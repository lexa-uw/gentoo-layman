EAPI=4
PHP_EXT_NAME="eio"
PHP_EXT_INI="yes"
PHP_EXT_ZENDEXT="no"

USE_PHP="php5-3 php5-4 php5-5"
inherit php-ext-pecl-r2

KEYWORDS="~amd64 ~x86"

DESCRIPTION="Provides interface to the libeio library"
LICENSE="PHP-3"
SLOT="0"
IUSE=""

RDEPEND="${DEPEND}"
