EAPI="5"

inherit git-2 versionator

KEYWORDS="~amd64 ~x86"

DESCRIPTION="Asynchronous server-side framework for Web and network applications implemented in PHP using libevent. phpDaemon can handle thousands of simultaneous connections"
SLOT="0.4"
IUSE="examples +libevent runkit"

DEPEND="
	>=app-admin/eselect-phpdaemon-0.1
	>=dev-lang/php-5.3:5.3
	libevent? ( =dev-php/pecl-libevent-0.0.4 )
	runkit? ( >=dev-php/runkit-1.0.1 )
"
RDEPEND="${DEPEND}"

HOMEPAGE="http://github.com/kakserpom/phpdaemon/"
EGIT_REPO_URI="https://github.com/kakserpom/phpdaemon.git"
EGIT_COMMIT="v${PV}"
unset SRC_URI

src_configure() {
	PHPDAEMON_DESTDIR="${EPREFIX}/usr/$(get_libdir)/phpdaemon/${SLOT}"
}

src_unpack() {
	git-2_src_unpack
	cd "${S}"

	mv conf/logrotate conf/phpd_rotate
	sed -i -e "s/\/usr\/bin\/php/\/usr\/bin\/php5.3/" bin/phpd || die "Sed filed!"
}

src_install() {
	BASE="${PHPDAEMON_DESTDIR}"

	insinto ${BASE}
	doins VERSION || die

	insinto ${BASE}/app-clients
	doins app-clients/*.php || die

	if use examples; then
		insinto ${BASE}/app-examples
		doins app-examples/*.php || die
	fi

	insinto ${BASE}/app-servers
	doins app-servers/*.php || die

	insinto ${BASE}/app-web
	doins app-web/*.php || die

	insinto ${BASE}/bin
	doins bin/* || die

	fperms +x ${BASE}/bin/phpd
	fperms +x ${BASE}/bin/php-chroot

	if use examples; then
		insinto ${BASE}/clientside-connectors/websocket
		doins clientside-connectors/websocket/* || die
	fi

	insinto ${BASE}/conf
	doins conf/AppResolver.php || die
	doins conf/crossdomain.xml || die

	insinto ${BASE}/lib
	doins lib/*.php || die

	insinto /etc/logrotate.d
	doins conf/phpd_rotate || die

	insinto /etc/phpd/${SLOT}
	doins conf/phpd.conf.example || die

	insinto /etc/phpd/${SLOT}/conf.d
	doins conf/conf.d/*.conf || die

	dosym ${BASE}/bin/phpd /usr/bin/phpd${SLOT}

	cp ${FILESDIR}/init.d/phpd phpd
	insinto /etc/init.d/
	doins phpd
	fperms +x /etc/init.d/phpd
}

