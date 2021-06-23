CREATE USER 'wp_cli_test'@'%' IDENTIFIED BY 'password1';
GRANT ALL ON wp_cli_test.* to 'wp_cli_test'@'%';