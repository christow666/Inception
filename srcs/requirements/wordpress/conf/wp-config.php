<?php
/** The base configuration for WordPress
 * @link https://wordpress.org/support/article/editing-wp-config-php/
 */

/** The name of the database for WordPress */
define('DB_NAME', 'mydatabasecp');

/** MySQL database username */
define('DB_USER', 'myusercp');

/** MySQL database password */
define('DB_PASSWORD', 'mypasswordcp');

/** MySQL hostname */
define('DB_HOST', 'mariadb');

/** Database Charset to use in creating database tables. */
define('DB_CHARSET', 'utf8');

/** The Database Collate type. Don't change this if in doubt. */
define('DB_COLLATE', '');

//** Redis cache settings. */
define('WP_CACHE', true);
define('WP_CACHE_KEY_SALT', 'bcaffere.42.fr');

//** Try Redis container */
define('WP_REDIS_HOST', 'redis');
define('WP_REDIS_PORT', 6379);
// define( 'WP_REDIS_PASSWORD', '$REDIS_PWD' );
define('WP_REDIS_TIMEOUT', 1);
define('WP_REDIS_READ_TIMEOUT', 1);
define('WP_REDIS_DATABASE', 0);


/** Authentication Unique Keys and Salts.
 * You can generate these using the {@link https://api.wordpress.org/secret-key/1.1/salt/ WordPress.org secret-key service}
 */

define('AUTH_KEY',         '>++/C|v`#o%tWB-ZXwHAoNr@&||o/r|A@0:gd]:3>nQ5</=d7Wr(n+] -LTiQ_kJ');
define('SECURE_AUTH_KEY',  'Q--*;;+!zadk{2NGaYI:_+&sX:t^*J}F{~U`h-l5Ei]RzMdTH/Fm064~ydF|yctL');
define('LOGGED_IN_KEY',    ',BJSuh^$<Net?@V5$EsygH,zd(x)2Mc&n-gnMJa[aO|D,FUC,5APsl.-|n#-6(WO');
define('NONCE_KEY',        'M|$O$Z];@w&Q<(L%Gomf(Yi_`)N>o+vbX8F`BW~*X@R-2H{?hp=zP7=/`7;$d=.}');
define('AUTH_SALT',        '|,|Yyf7q&^nXL_RfprcqH/sqw|6).eKMD4]_t-}fVTb<&+ljL|,S949b(>J`N9-N');
define('SECURE_AUTH_SALT', '4[BiE_zWx?K0%>#2[p?Jx p7lGhk7D%*^[.U:MJo|6,5>__mDfdfo_-O6W8]*0@U');
define('LOGGED_IN_SALT',   'q`OlNjH,C8J;d+r[]N5-tP=RLs$xEhrH1#-;dhFKgUf:NxQtH@`sYTrw9vADxh|p');
define('NONCE_SALT',       'fFR6m+D:Zb3]bg2HApO%a/SBkE^CJe?fgKh]x)4ztlh,_6ubaqTZBg4c$Pmr[9&a');

/** WordPress Database Table prefix. */
$table_prefix = 'wp_';

/** For developers: WordPress debugging mode. */
define( 'WP_DEBUG', false );

/** Absolute path to the WordPress directory. */
if ( ! defined( 'ABSPATH' ) ) {
	define( 'ABSPATH', __DIR__ . '/' );
}

/** Sets up WordPress vars and included files. */
require_once ABSPATH . 'wp-settings.php';
?>