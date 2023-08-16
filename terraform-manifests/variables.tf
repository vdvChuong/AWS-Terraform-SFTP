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