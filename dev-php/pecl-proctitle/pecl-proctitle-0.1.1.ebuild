EAPI=4
PHP_EXT_NAME="proctitle"
PHP_EXT_INI="yes"
PHP_EXT_ZENDEXT="no"

USE_PHP="php5-2 php5-3"

inherit php-ext-pecl-r2

KEYWORDS="~amd64 ~x86"

DESCRIPTION="This extension allows changing the current process' name on Linux and *BSD systems. This is useful when using pcntl_fork() to identify running processes in process list."
LICENSE="PHP-3"
SLOT="0"
IUSE=""

DEPEND=">=dev-lang/php-5.2.0"
RDEPEND="${DEPEND}"
