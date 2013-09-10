# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

DESCRIPTION="PHPDaemon eselect module"
HOMEPAGE="https://github.com/lexa-uw/eselect-phpdaemon"
SRC_URI="https://github.com/lexa-uw/eselect-phpdaemon/archive/${PV}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND=""
DEPEND=">=app-admin/eselect-1.2.4
		!<www-servers/phpdaemon-0.4.1:0.4
		!<www-servers/phpdaemon-1.0_beta1:1.0
		!<www-servers/phpdaemon-20130907:weekly
		"
RDEPEND="${DEPEND}"

src_install() {
	insinto /usr/share/eselect/modules/
	doins phpdaemon.eselect
}

