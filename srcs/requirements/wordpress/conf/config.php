<?php
/**
 * The base configuration for WordPress
 *
 * The wp-config.php creation script uses this file during the installation.
 * You don't have to use the website, you can copy this file to "wp-config.php"
 * and fill in the values.
 *
 * This file contains the following configurations:
 *
 * * Database settings
 * * Secret keys
 * * Database table prefix
 * * ABSPATH
 *
 * @link https://developer.wordpress.org/advanced-administration/wordpress/wp-config/
 *
 * @package WordPress
 */

// ** Database settings - You can get this info from your web host ** //
/** The name of the database for WordPress */
define( 'DB_NAME', 'database_name_here' );

/** Database username */
define( 'DB_USER', 'username_here' );

/** Database password */
define( 'DB_PASSWORD', 'password_here' );

/** Database hostname */
define( 'DB_HOST', 'localhost' );

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
define('AUTH_KEY',         'a`oxm}f?y@xy,}a1x`,m~yn%B[n-wmK< od(`|R~BlzYL+^k5]slf-Puko8w+7{ ');
define('SECURE_AUTH_KEY',  'fONME@-@gEc^Z10V<hWo3fbP/{qOWV){Ez[HC|D^+u=2%S^SLAZ0suOJs&Yk-o22');
define('LOGGED_IN_KEY',    'D3dCJ(p*omuw5Gz-YoS1[-OmJOPp;,!#)FK-RkF0-4IA=yl,6Iz7(r63`!{V[R)5');
define('NONCE_KEY',        't<B&g{ec6JRvGq[</?5U7xc>ZaU`Cj1+i#N<k5$3CtEvX?W64lc:nhPm.xH[P]4E');
define('AUTH_SALT',        'ps}z*9a6WAQ :uTEAkaatYdw>aI(%xx(>0$vjPA8d oKYc6^h$/J4k]J/-A8ilTP');
define('SECURE_AUTH_SALT', '?z~>{J62,_1 ;g4@^ 6}-=3PArrYdAP-Gn l|Kfun<aDX[gD#p1<Pczw9r4hj{&}');
define('LOGGED_IN_SALT',   'ZR$FzzBq.uMcp#id{o%@V%;}a Bgy{G!wg!=f#9%/+)u?*6IpaKAy`RW/l@HnI?$');
define('NONCE_SALT',       '[VI>:!n[@foLSJ=n,*!z=X&}.kV2}6RF^Y><NW:ShF.=laI+Ap?xn>T5UOGz4b@&');

/**#@-*/

/**
 * WordPress database table prefix.
 *
 * You can have multiple installations in one database if you give each
 * a unique prefix. Only numbers, letters, and underscores please!
 */
$table_prefix = 'wp_';

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
 * @link https://developer.wordpress.org/advanced-administration/debug/debug-wordpress/
 */
define( 'WP_DEBUG', false );

/* Add any custom values between this line and the "stop editing" line. */



/* That's all, stop editing! Happy publishing. */

/** Absolute path to the WordPress directory. */
if ( ! defined( 'ABSPATH' ) ) {
	define( 'ABSPATH', __DIR__ . '/' );
}

/** Sets up WordPress vars and included files. */
require_once ABSPATH . 'wp-settings.php';
