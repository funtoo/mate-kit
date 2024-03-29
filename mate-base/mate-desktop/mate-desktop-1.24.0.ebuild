# Distributed under the terms of the GNU General Public License v2

EAPI=6

MATE_LA_PUNT="yes"

inherit mate

DESCRIPTION="Libraries for the MATE desktop that are not part of the UI"
LICENSE="GPL-2 FDL-1.1 LGPL-2"
SLOT="0"
KEYWORDS="*"

IUSE="X debug +introspection startup-notification"

COMMON_DEPEND="
	>=dev-libs/glib-2.70.0-r1:2=
	>=gnome-base/dconf-0.13.4
	x11-libs/cairo
	x11-libs/libX11
	>=x11-libs/libXrandr-1.3
	>=x11-libs/gtk+-3.22:3[introspection?]
	introspection? ( >=dev-libs/gobject-introspection-0.9.7:= )
	startup-notification? ( >=x11-libs/startup-notification-0.5:0 )"

RDEPEND="${COMMON_DEPEND}"

DEPEND="${COMMON_DEPEND}
	app-text/docbook-xml-dtd:4.1.2
	app-text/iso-codes
	dev-util/gtk-doc
	dev-util/gtk-doc-am
	sys-devel/gettext:*
	x11-base/xorg-proto
	virtual/pkgconfig:*"

src_configure() {
	mate_src_configure \
		--enable-mate-about \
		$(use_with X x) \
		$(use_enable debug) \
		$(use_enable introspection) \
		$(use_enable startup-notification)
}
