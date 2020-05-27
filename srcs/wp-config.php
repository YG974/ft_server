<?php
/**
 * The base configuration for WordPress
 *
 * The wp-config.php creation script uses this file during the
 * installation. You don't have to use the web site, you can
 * copy this file to "wp-config.php" and fill in the values.
 *
 * This file contains the following configurations:
 *
 * * MySQL settings
 * * Secret keys
 * * Database table prefix
 * * ABSPATH
 *
 * @link https://codex.wordpress.org/Editing_wp-config.php
 *
 * @package WordPress
 */

// ** MySQL settings - You can get this info from your web host ** //
/** The name of the database for WordPress */
define('DB_NAME', 'DB_pokemon');

/** MySQL database username */
define('DB_USER', 'ygeslin');

/** MySQL database password */
define('DB_PASSWORD', 'pikapika');

/** MySQL hostname */
define('DB_HOST', 'localhost');

/** Database Charset to use in creating database tables. */
define('DB_CHARSET', 'utf8');

/** The Database Collate type. Don't change this if in doubt. */
define('DB_COLLATE', '');

/**#@+
 * Authentication Unique Keys and Salts.
 *
 * Change these to different unique phrases!
 * You can generate these using the {@link https://api.wordpress.org/secret-key/1.1/salt/ WordPress.org secret-key service}
 * You can change these at any point in time to invalidate all existing cookies. This will force all users to have to log in again.
 *
 * @since 2.6.0
 */
define('AUTH_KEY',         'jkK-n,f|%W#J13AQ&Z-0dY@0k#x{%y]pExI2,SD@s@p ra=`L7d]8-}h|`]`MYD^');
define('SECURE_AUTH_KEY',  'HK~V#yWp|b8]S&j87S}>yXGzr8R~aNx0EM6CZZMZ^wGd_h<vX,~kA3A:w+(wEE@{');
define('LOGGED_IN_KEY',    '-+fCf(5 P3Pga:&BVi+P/~H^cJq$c-gt<}$|ix=w8gaFqd}5*c$gR[~M&c@Nm3N8');
define('NONCE_KEY',        'z?fJ=[RCu26K: 6o7/8UCeiZ;a A[jZGCh|-Dw_>^xp:aE{R(C)<{G|v~W<0XP+;');
define('AUTH_SALT',        'QM~g-Zc6]TEs+|1f`k#}s&Wm+#a]@$Tv!KV^w+1l+b*|;FrmbY@[Y/lfAz4_-du?');
define('SECURE_AUTH_SALT', '+85I.5n>R$Ns~8[^cOy1Ai8y#ecers+jShL^czeNdmB~+$>kVf;3gX7Qm>$;D_n*');
define('LOGGED_IN_SALT',   'L@O}+qjtdMv}f7wn9Pn@3&|f+@A^[/EThYWwn?}O-mO:{]1/P?846t0t>I:^N~vm');
define('NONCE_SALT',       'Zk5}&O-,p6ev1-4 >^R|$b|r +gb R@CJGpYO~a<oNI]zxTDyt](Wx[Bo54(5<dA');
/**#@-*/

/**
 * WordPress Database Table prefix.
 *
 * You can have multiple installations in one database if you give each
 * a unique prefix. Only numbers, letters, and underscores please!
 */
$table_prefix  = 'wp_';

/**
 * For developers: WordPress debugging mode.
 *
 * Change this to true to enable the display of notices during development.
 * It is strongly recommended that plugin and theme developers use WP_DEBUG
 * in their development environments.
 *
 * For information on other constants that can be used for debugging,
 * visit the Codex.
 *
 * @link https://codex.wordpress.org/Debugging_in_WordPress
 */
define('WP_DEBUG', false);

/* That's all, stop editing! Happy blogging. */

/** Absolute path to the WordPress directory. */
if ( !defined('ABSPATH') )
	define('ABSPATH', dirname(__FILE__) . '/');

/** Sets up WordPress vars and included files. */
require_once(ABSPATH . 'wp-settings.php');
