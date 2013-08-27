EAPI=4

PHP_EXT_NAME="runkit"
PHP_EXT_INI="yes"
PHP_EXT_ZENDEXT="no"

S="${WORKDIR}/runkit"

inherit git php-ext-source-r2 confutils

KEYWORDS="~amd64 ~x86"

DESCRIPTION="PHP runkit extension."
SLOT="0"
IUSE="modify super sandbox"

DEPEND=">dev-lang/php-4.0"
RDEPEND="${DEPEND}"

HOMEPAGE="http://github.com/zenovich/runkit"
EGIT_REPO_URI="git://github.com/zenovich/runkit.git"
unset SRC_URI

src_unpack() {
	git_src_unpack
	cd "${S}"
}

src_compile() {
	my_conf="--enable-runkit"

	enable_extension_enable "runkit-modify" "modify" 0
	enable_extension_enable "runkit-super" "super" 0
	enable_extension_enable "runkit-sandbox" "sandbox" 0

	php-ext-source-r2_src_compile
}

src_install() {
	php-ext-source-r2_src_install
}
