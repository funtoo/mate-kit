# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit mate

DESCRIPTION="Calculator for MATE"
LICENSE="CC-BY-SA-3.0 GPL-2+"
SLOT="0"
KEYWORDS="*"

IUSE=""

COMMON_DEPEND="
	>=app-accessibility/at-spi2-core-2.36.0
	>=dev-libs/glib-2.50:2
	>=dev-libs/libxml2-2.10.4:2
	>=x11-libs/gtk+-3.22:3
	>=dev-libs/mpfr-4.0.2
	x11-libs/pango
"

RDEPEND="${COMMON_DEPEND}
	virtual/libintl
"

BDEPEND="${COMMON_DEPEND}
	app-text/yelp-tools
	>=sys-devel/gettext-0.19.8
	virtual/pkgconfig
"
