CREATE DATABASE wordpress;
CREATE USER 'wpuser'@'%' IDENTIFIED BY 'password';
GRANT ALL PRIVILEGES ON *.* TO 'wpuser'@'%' WITH GRANT OPTION;
FLUSH PRIVILEGES;



/*foor changing ip add depending on your setup
UPDATE wp_options SET option_value='http://10.14.58.100' WHERE option_name='siteurl';
UPDATE wp_options SET option_value='http://10.14.58.100' WHERE option_name='home';
*/