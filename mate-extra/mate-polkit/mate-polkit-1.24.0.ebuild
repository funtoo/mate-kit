# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit mate

DESCRIPTION="A MATE specific DBUS service that is used to bring up authentication dialogs"
LICENSE="LGPL-2"
SLOT="0"
KEYWORDS="*"

IUSE="accountsservice appindicator"

COMMON_DEPEND=">=dev-libs/glib-2.70.0-r1:2=
	>=sys-auth/polkit-0.102
	x11-libs/gdk-pixbuf:2
	virtual/libintl:0
	>=x11-libs/gtk+-3.22.0:3
	appindicator? ( dev-libs/libappindicator:3 )"

RDEPEND="${COMMON_DEPEND}
	accountsservice? ( sys-apps/accountsservice )"

DEPEND="${COMMON_DEPEND}
	dev-util/gtk-doc
	dev-util/gtk-doc-am
	>=dev-util/intltool-0.35:*
	sys-devel/gettext:*
	>=sys-devel/libtool-2.2.6
	virtual/pkgconfig:*
	!<gnome-extra/polkit-gnome-0.102:0"

src_configure() {
	mate_src_configure \
		--disable-static \
		$(use_enable accountsservice) \
		$(use_enable appindicator)
}
