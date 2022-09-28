# Spins test instance using custom module
## ACG Lab

This command would generate a public and private key
$ ssh-keygen -f terraform_ec2_key

get pem: terraform output -raw instance_key > key.pem && chmod 400 key.pem 
ssh -i key.pem ec2-user@<IP addr>