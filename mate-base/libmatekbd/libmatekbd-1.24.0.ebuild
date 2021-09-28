# Distributed under the terms of the GNU General Public License v2

EAPI=6

MATE_LA_PUNT="yes"

inherit mate

DESCRIPTION="MATE keyboard configuration library"
LICENSE="LGPL-2"
SLOT="0"
KEYWORDS="*"

IUSE="X +introspection test"

RDEPEND=">=dev-libs/glib-2.70.0-r1:2=
	x11-libs/cairo
	>=x11-libs/gdk-pixbuf-2.24:=
	x11-libs/libX11
	>=x11-libs/libxklavier-5.2:0[introspection?]
	x11-libs/pango
	virtual/libintl
	>=x11-libs/gtk+-3.22:3[introspection?]
	introspection? ( >=dev-libs/gobject-introspection-0.6.7:= )"

DEPEND="${RDEPEND}
	dev-util/glib-utils
	>=dev-util/intltool-0.50.1
	sys-devel/gettext
	virtual/pkgconfig"

src_configure() {
	mate_src_configure \
		$(use_with X x) \
		$(use_enable introspection) \
		$(use_enable test tests)
}
