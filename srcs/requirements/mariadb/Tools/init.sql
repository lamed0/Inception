CREATE DATABASE IF NOT EXISTS wordpress;

DROP USER IF EXISTS 'wpuser'@'%';
DROP USER IF EXISTS 'root'@'%';

CREATE USER 'wpuser'@'%' IDENTIFIED BY 'wppassword';
CREATE USER 'root'@'%' IDENTIFIED BY 'rootpassword';
GRANT ALL PRIVILEGES ON wordpress.* TO 'wpuser'@'%';
GRANT ALL PRIVILEGES ON *.* TO 'root'@'%' WITH GRANT OPTION;

FLUSH PRIVILEGES;





/*foor changing ip add depending on your setup
UPDATE wp_options SET option_value='http://10.14.58.100' WHERE option_name='siteurl';
UPDATE wp_options SET option_value='http://10.14.58.100' WHERE option_name='home';
*/