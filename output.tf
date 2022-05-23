output "WebServerIP" {

    value = aws_instance.wordpressfrontend.public_ip
    description = "Web Server IP Address"
}
output "DatabaseName" {

    value = aws_db_instance.wordpressbackend.name
    description = "The Database Name!"
}
output "DatabaseUserName" {

    value = aws_db_instance.wordpressbackend.username
    description = "The Database Name!"
}
output "DBConnectionString" {

    value = aws_db_instance.wordpressbackend.endpoint
    description = "The Database connection String!"
}