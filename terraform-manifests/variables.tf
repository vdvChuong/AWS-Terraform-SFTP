variable "AWS_REGION" {
    description = "AWS region in which to deploy the server" 
    default     = "ap-southeast-2" 
}

variable "PROJECT" { 
    description = "Project name"
}

variable "BUCKET_NAME" { 
    description = "Target S3 bucket name"
}

variable "SFTP_USER" { 
    description = "Name of user with permission to access the SFTP server" 
    default     = "tftest-user" 
}

variable "SSH_public_key" { 
    description = " SSH public key to connect to SFTP Server"
}

# variable "SFTP_SERVER_ID" { 
#     description = "SFTP server ID" 
#     default     = "tftestuser" 
# }

# variable "bucket_prefix" {
#     type        = string
#     description = "(required since we are not using 'bucket') Creates a unique bucket name beginning with the specified prefix"
#     default     = "my-s3bucket-"
# }