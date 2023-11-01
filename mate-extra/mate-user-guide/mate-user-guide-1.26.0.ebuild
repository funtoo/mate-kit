# Distributed under the terms of the GNU General Public License v2

EAPI=7

MATE_LA_PUNT="yes"

inherit mate

DESCRIPTION="User documentation for MATE Desktop"
LICENSE="GPL-2 LGPL-2"
SLOT="0"
KEYWORDS="*"
IUSE="nls"

COMMON_DEPEND="virtual/libintl"

RDEPEND="${COMMON_DEPEND}
	gnome-extra/yelp"

DEPEND="${COMMON_DEPEND}"

BDEPEND="
	app-text/yelp-tools
	>=sys-devel/gettext-0.19.8
	virtual/pkgconfig
"

src_configure() {
	mate_src_configure \
		$(use_enable nls)
}
