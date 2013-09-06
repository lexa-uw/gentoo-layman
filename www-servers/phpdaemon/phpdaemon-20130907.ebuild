EAPI="5"

inherit git-2 versionator

KEYWORDS="~amd64 ~x86"

DESCRIPTION="Asynchronous server-side framework for Web and network applications implemented in PHP using libevent. phpDaemon can handle thousands of simultaneous connections"
SLOT="weekly"
IUSE="+eio +event runkit"

DEPEND="
	>=dev-lang/php-5.4[cli,ctype,json,pcntl,posix,sockets,sharedmem]
	eio? ( >=dev-php/pecl-eio-1.2.1 )
	event? ( >=dev-php/pecl-event-1.6.0 )
	runkit? ( >=dev-php/runkit-1.0.1 )
"
RDEPEND="${DEPEND}"

HOMEPAGE="http://github.com/kakserpom/phpdaemon/"
EGIT_REPO_URI="https://github.com/kakserpom/phpdaemon.git"
EGIT_COMMIT="31ba025213c52878c2addd767d650b8a0bb4a569"
unset SRC_URI

src_configure() {
	PHPDAEMON_DESTDIR="${EPREFIX}/usr/$(get_libdir)/phpdaemon/${SLOT}"
}

src_unpack() {
	git-2_src_unpack
	cd "${S}"

	mv conf/logrotate conf/phpd_rotate
}

src_install() {
	BASE="${PHPDAEMON_DESTDIR}"

	insinto ${BASE}
	doins VERSION || die
	doins LICENSE || die

	insinto ${BASE}/PHPDaemon
	doins -r PHPDaemon/* || die

	insinto ${BASE}/app-web
	doins app-web/*.php || die

	insinto ${BASE}/bin
	doins bin/* || die

	fperms +x ${BASE}/bin/phpd
	fperms +x ${BASE}/bin/php-chroot

	insinto ${BASE}/conf
	doins conf/AppResolver.php || die
	doins conf/crossdomain.xml || die

	insinto /etc/logrotate.d
	doins conf/phpd_rotate || die

	insinto /etc/phpd/${SLOT}
	doins conf/phpd.conf.example || die

	insinto /etc/phpd/${SLOT}/conf.d
	doins conf/conf.d/*.conf || die

	dosym ${BASE}/bin/phpd /usr/bin/phpd${SLOT}
}

