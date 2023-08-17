output "SFTP_SERVER_ID" {
  description = "The ID of the AWS Transfer Server"
  value       = aws_transfer_server.sftp.id
}

output "SFTP_ENDPOINT" {
  description = "The Endpoint of the AWS Transfer Server"
  value       = aws_transfer_server.sftp.endpoint
}