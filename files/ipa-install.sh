#echo 'testing error';exit 1;

#* krb5-config/default_realm:

# TODO check for default host names and abort if used as the hostname for joining the domain
# otherwise you should just be using a base image with ipa installed rather than fill up 
# the directory with temporary host names

# TODO get realm and domain from role vars 
echo "kb5-config krb5-config/default_realm string VPC.SPARKHIRE.COM" | debconf-set-selections
echo "kb5-config krb5-config/admin_server string " | debconf-set-selections

#apt -y install awscli jq freeipa-client

apt -y install freeipa-client

#DATA=$(aws secretsmanager get-secret-value \
#   --region us-east-1 \
#   --secret-id ipa-enrollment-pw \
#   --query SecretString \
#   --output text)

#if [ $? -gt 0 ]; then
#        echo ""; echo "Error: Please attach role with IPAEnrollment policy to continue"
#        exit 1
#else
#        ENROLL_PW=$(echo $DATA | jq -r --arg k "enrollment_password" '.[$k]')
#fi

ENROLL_PW=$1

run () {
  ipa-client-install --uninstall --unattended
  ipa-client-install --domain=VPC.SPARKHIRE.COM --force-join --unattended --principal=enrollment -w $ENROLL_PW
  return $?
}

run;

if [ $? -gt 0 ]; then
  ## uninstall
  echo "Error installing"
  
  ipa-client-install --uninstall --unattended
  exit 1;
else
 echo "Success"
 exit 0
fi

