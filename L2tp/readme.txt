
Additional VPN users are supported, and can be optionally declared in your env file like this. Usernames and passwords must be separated by spaces, and usernames cannot contain duplicates. All VPN users will share the same IPsec PSK.



VPN_ADDL_USERS=additional_username_1 additional_username_2
VPN_ADDL_PASSWORDS=additional_password_1 additional_password_2


Note: In your env file, DO NOT put "" or '' around values, or add space around =. DO NOT use these special characters within values: \ " '. A secure IPsec PSK should consist of at least 20 random characters.
