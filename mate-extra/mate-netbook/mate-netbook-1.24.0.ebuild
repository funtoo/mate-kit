# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit mate

DESCRIPTION="MATE utilities for netbooks"
LICENSE="GPL-3"
SLOT="0"
KEYWORDS="*"

IUSE=""

COMMON_DEPEND="
	>=dev-libs/glib-2.70.0-r1:2=
	>=mate-base/mate-panel-1.17.0
	>=x11-libs/gtk+-3.22:3
	x11-libs/libfakekey
	x11-libs/libwnck:3
	x11-libs/libXtst
	x11-libs/libX11
	x11-libs/cairo
	virtual/libintl"

RDEPEND="${COMMON_DEPEND}"

DEPEND="${COMMON_DEPEND}
	x11-base/xorg-proto
	>=dev-util/intltool-0.50.1
	sys-devel/gettext:*
	virtual/pkgconfig:*"
