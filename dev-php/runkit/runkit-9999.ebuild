EAPI="5"

PHP_EXT_NAME="runkit"
PHP_EXT_INI="yes"
PHP_EXT_ZENDEXT="no"

USE_PHP="php5-3 php5-4 php5-5"

inherit git-2 php-ext-source-r2 

KEYWORDS="~amd64 ~x86"

DESCRIPTION="PHP runkit extension."
SLOT="0"
IUSE="modify super sandbox"

DEPEND=">=dev-lang/php-5.3"
RDEPEND="${DEPEND}"

HOMEPAGE="http://github.com/zenovich/runkit"
EGIT_REPO_URI="https://github.com/zenovich/runkit.git"
unset SRC_URI

src_unpack() {
	git-2_src_unpack
	cd ${S}
	for slot in $(php_get_slots); do
		mkdir ${WORKDIR}/${slot} || die "Failed to create e ${S}/${WORKDIR} to PHP target directory"
		cp -r ${S}/* ${WORKDIR}/${slot}/ || die "Failed to copy source ${WORKDIR}/${slot} to PHP target directory"
	done
}

src_compile() {
	my_conf="--enable-runkit"

	enable_extension_enable "runkit-modify" "modify" 0
	enable_extension_enable "runkit-super" "super" 0
	enable_extension_enable "runkit-sandbox" "sandbox" 0

	php-ext-source-r2_src_compile
}
