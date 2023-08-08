output "sftp_endpoint" {
  description = "The endpoint of the Transfer Server"
  value = aws_transfer_server.sftp.endpoint
}