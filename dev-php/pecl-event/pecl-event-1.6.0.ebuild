EAPI=4
PHP_EXT_NAME="event"
PHP_EXT_INI="yes"
PHP_EXT_ZENDEXT="no"

USE_PHP="php5-4 php5-5"
inherit php-ext-pecl-r2

KEYWORDS="~amd64 ~x86"

DESCRIPTION="Provides interface to libevent library"
LICENSE="PHP-3"
SLOT="0"
IUSE=""

DEPEND="
	>=dev-libs/libevent-2.0
"
RDEPEND="${DEPEND}"
