# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit mate

DESCRIPTION="The MATE Terminal"
LICENSE="GPL-3"
SLOT="0"
KEYWORDS="*"

IUSE=""

COMMON_DEPEND="dev-libs/atk
	>=dev-libs/glib-2.70.0-r1:2=
	>=gnome-base/dconf-0.13.4
	x11-libs/gdk-pixbuf:2
	x11-libs/libICE
	x11-libs/libSM
	x11-libs/libX11
	x11-libs/pango
	>=x11-libs/gtk+-3.22:3[X]
	>=x11-libs/vte-0.48:2.91"

RDEPEND="${COMMON_DEPEND}
	>=mate-base/mate-desktop-1.6"

DEPEND="${COMMON_DEPEND}
	app-text/rarian
	>=app-text/scrollkeeper-dtd-1:1.0
	app-text/yelp-tools
	dev-util/glib-utils
	sys-devel/gettext
	virtual/pkgconfig"
