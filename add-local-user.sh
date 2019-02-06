#! /bin/bash
# Create and account on the Local Host.
# Must run with sudo or root account.
if [[ "${UID}"  -ne 0 ]]
then
echo " You must use sudo or be root to run this script."
exit 1
fi
# Ask for user name
read -p 'Enter the username you will use: ' USER_NAME
# Ask for Full Name or Application for comment
read -p 'Enter the person or application this account is for: ' COMMENT
# Ask for the Initial Password
read -p ' Enter the initial password for the account: ' PASSWORD
# Create the user.
useradd -c "${COMMENT} " -m ${USER_NAME}
# Verify the user account was created successfully
if [[ "${?}" -ne 0 ]]
then
  echo
  echo "The account was NOT successfully created!"
exit 1
fi
# Set initial password
echo ${PASSWORD} | passwd --stdin ${USER_NAME}
# Force Password change on First login
passwd -e ${USER_NAME}
# Display new account information ( Username, Password, Hostname)
echo
echo "Username:"  ${USERNAME}
echo "Password:" ${PASSWORD}
echo "Hostname:" ${HOSTNAME}
exit 0
