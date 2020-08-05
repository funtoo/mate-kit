# Distributed under the terms of the GNU General Public License v2

EAPI=6

MATE_LA_PUNT="yes"

inherit mate

DESCRIPTION="User documentation for MATE Desktop"
LICENSE="GPL-2 LGPL-2"
SLOT="0"
KEYWORDS="*"

COMMON_DEPEND="virtual/libintl:0"

RDEPEND="${COMMON_DEPEND}
	gnome-extra/yelp"

DEPEND="${COMMON_DEPEND}
	>=dev-util/intltool-0.40
	app-text/yelp-tools
	sys-devel/gettext:*
	virtual/pkgconfig:*
	!!mate-base/mate-desktop[user-guide]"
