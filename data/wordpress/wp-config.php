<?php
/**
 * The base configuration for WordPress
 *
 * The wp-config.php creation script uses this file during the installation.
 * You don't have to use the web site, you can copy this file to "wp-config.php"
 * and fill in the values.
 *
 * This file contains the following configurations:
 *
 * * Database settings
 * * Secret keys
 * * Database table prefix
 * * Localized language
 * * ABSPATH
 *
 * @link https://wordpress.org/support/article/editing-wp-config-php/
 *
 * @package WordPress
 */

// ** Database settings - You can get this info from your web host ** //
/** The name of the database for WordPress */
define( 'DB_NAME', 'wordpress' );

/** Database username */
define( 'DB_USER', 'wpuser' );

/** Database password */
define( 'DB_PASSWORD', 'wppassword' );

/** Database hostname */
define( 'DB_HOST', 'mariadb' );

/** Database charset to use in creating database tables. */
define( 'DB_CHARSET', 'utf8' );

/** The database collate type. Don't change this if in doubt. */
define( 'DB_COLLATE', '' );

/**#@+
 * Authentication unique keys and salts.
 *
 * Change these to different unique phrases! You can generate these using
 * the {@link https://api.wordpress.org/secret-key/1.1/salt/ WordPress.org secret-key service}.
 *
 * You can change these at any point in time to invalidate all existing cookies.
 * This will force all users to have to log in again.
 *
 * @since 2.6.0
 */
define( 'AUTH_KEY',          'jRr=d3l9Q9h?TU@-B#YW{g)Lj~Fh:Mh5Bi`KAK;U.yYrxAieftriv6(Q^>KfWTrx' );
define( 'SECURE_AUTH_KEY',   'Q^y7U`uMW}]0)2*]_Po}Wy+qGyHLjpb4S~wDT}Kpe@R4FHf.7r^MLCAa;]64i1ex' );
define( 'LOGGED_IN_KEY',     'Md-}[5M`P#UaEU31,_DwD|T@W]hB/s{Kj.H`V&R}oHb=wa)FuPMw+ha=H^v;V40b' );
define( 'NONCE_KEY',         '@Nt&{54/@AXMWm!lzh8|[>i*+[O`);PG/R1<i:Y?iZjdn0JsAI$Y+G:py(.ux`U|' );
define( 'AUTH_SALT',         'L4#+*|$kIp72;M~K&WAj~glzuKM%u=H32r.Y2:!5GI2arbu4{vaI#jpttAaX-@`>' );
define( 'SECURE_AUTH_SALT',  'U!%oHx7V1vD kePF=-.ZH]<!e2!~9/bs ,?b=O{6(LkhDl_A+[jfrdyiP6ZL?WUl' );
define( 'LOGGED_IN_SALT',    'S;X[osxq,rpO)@Hp$50Gj6iD>}/`34w5GHN7!5*Gv($7cxe]:$*E^;rDQPa:|]ZP' );
define( 'NONCE_SALT',        '8:|~BJ/zIn</*Ywta3OaAy+^MJfV!,EejNoBJA[?)SsdwrrIJl5;lm_+OGLpl9g?' );
define( 'WP_CACHE_KEY_SALT', '5$vG==_lqOXi?<$hVHwmTC^(d(gu?!yu56~xi1^q1t)6b{ J&w~e.5>=oK]iZaj5' );


/**#@-*/

/**
 * WordPress database table prefix.
 *
 * You can have multiple installations in one database if you give each
 * a unique prefix. Only numbers, letters, and underscores please!
 */
$table_prefix = 'wp_';


/* Add any custom values between this line and the "stop editing" line. */



/**
 * For developers: WordPress debugging mode.
 *
 * Change this to true to enable the display of notices during development.
 * It is strongly recommended that plugin and theme developers use WP_DEBUG
 * in their development environments.
 *
 * For information on other constants that can be used for debugging,
 * visit the documentation.
 *
 * @link https://wordpress.org/support/article/debugging-in-wordpress/
 */
if ( ! defined( 'WP_DEBUG' ) ) {
	define( 'WP_DEBUG', false );
}
define('FS_METHOD', 'direct');
/* That's all, stop editing! Happy publishing. */

/** Absolute path to the WordPress directory. */
if ( ! defined( 'ABSPATH' ) ) {
	define( 'ABSPATH', __DIR__ . '/' );
}
define('WP_REDIS_HOST', 'redis');
define('WP_REDIS_PORT', 6379);


/** Sets up WordPress vars and included files. */
require_once ABSPATH . 'wp-settings.php';
