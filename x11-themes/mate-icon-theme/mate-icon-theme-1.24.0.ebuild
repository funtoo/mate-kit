# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit mate

DESCRIPTION="MATE default icon themes"
LICENSE="GPL-2"
SLOT="0"
KEYWORDS="*"

COMMON_DEPEND=">=x11-themes/hicolor-icon-theme-0.10"

RDEPEND="${COMMON_DEPEND}"

DEPEND="${COMMON_DEPEND}
	>=dev-util/intltool-0.40
	>=x11-misc/icon-naming-utils-0.8.7:0
	sys-devel/gettext:*
	virtual/pkgconfig:*"

RESTRICT="binchecks strip"

src_configure() {
	mate_src_configure --enable-icon-mapping
}
