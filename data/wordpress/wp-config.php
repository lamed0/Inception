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
define( 'DB_PASSWORD', 'password' );

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
define( 'AUTH_KEY',          'can$%LwKKLX +HyFb,J9L2Ot|S[Dc~htIOsyZ%;.H8C65o)hqy5Sx=xu0RR{GQ>r' );
define( 'SECURE_AUTH_KEY',   '=3js[c,UXnaeNVu_>qg<BPv,tyEsX;jEK[}@I3wZ}TMlMHPaDrL`)/~RRqPZW}3O' );
define( 'LOGGED_IN_KEY',     'UNd8Anq^g*p9*06U@f`QCyVb4arrqW>YDx5<kgnm!VJaMiIwHag[4/u|o:=}eUX?' );
define( 'NONCE_KEY',         'a5Ebh|A0UPN<!Z@RedevqX05]&?mI8_j+cV8 nr@@L6sjcB02fMEJprMpg8(DiD{' );
define( 'AUTH_SALT',         'MpPF7REdMYAN%}qI]@F3g0cR}ztg# `^%@g$|#]kz!5[L7#=xz!Zk7^wRE_*EHe?' );
define( 'SECURE_AUTH_SALT',  '?=UDC^]x2Brg6&ZK*zwN$1^f_;+=%.vp6}>s4!EZdGaf$x.lhVEX.wKpj9ILc} 0' );
define( 'LOGGED_IN_SALT',    '(3R[^E8VIX$-,PHY>2TV+j%;Hl5t$:SAb2g#Np*W5Mp-_O.DLixXENWFC5Rn U/^' );
define( 'NONCE_SALT',        'yJM,62dQ53x5z@:+,liAm$AZWs|,v tCuH4~|J5fp6Y6h$mO.] fu!42YAZcsm9d' );
define( 'WP_CACHE_KEY_SALT', '=i^V%s#GQZ/97[&9*+%Qsj6yS-bPdca%]h_bDhNwLLjmx8rCJ~Ej.Y3A,L UoBq`' );


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

/* That's all, stop editing! Happy publishing. */

/** Absolute path to the WordPress directory. */
if ( ! defined( 'ABSPATH' ) ) {
	define( 'ABSPATH', __DIR__ . '/' );
}

/** Sets up WordPress vars and included files. */
require_once ABSPATH . 'wp-settings.php';
