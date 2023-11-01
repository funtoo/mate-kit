# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit mate

DESCRIPTION="Multimedia related programs for the MATE desktop"
LICENSE="FDL-1.1+ GPL-2+ HPND LGPL-2+"
SLOT="0"
KEYWORDS="*"

IUSE=""

COMMON_DEPEND="
	>=dev-libs/glib-2.50:2
	>=dev-libs/libxml2-2.10.4:2
	>=mate-base/mate-panel-1.26.0
	>=mate-base/mate-desktop-1.26.0
	>=media-libs/libcanberra-0.13[gtk3]
	>=media-libs/libmatemixer-1.10.0
	x11-libs/cairo
	>=x11-libs/gtk+-3.22:3
	x11-libs/pango
"

BDEPEND="${COMMON_DEPEND}
	virtual/libintl
"

DEPEND="${COMMON_DEPEND}
	>=sys-devel/gettext-0.19.8
	virtual/pkgconfig
	!!<mate-base/mate-applets-1.8
"
