# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit mate

DESCRIPTION="Calculator for MATE"
LICENSE="GPL-2"
SLOT="0"
KEYWORDS="*"

IUSE=""

COMMON_DEPEND="
	dev-libs/atk
	>=dev-libs/glib-2.70.0-r1:2=
	dev-libs/libxml2:2
	>=x11-libs/gtk+-3.22:3
	x11-libs/pango"

RDEPEND="${COMMON_DEPEND}"

DEPEND="${COMMON_DEPEND}
	app-text/yelp-tools
	>=dev-util/intltool-0.35.0
	sys-devel/gettext:*
	virtual/pkgconfig:*"
