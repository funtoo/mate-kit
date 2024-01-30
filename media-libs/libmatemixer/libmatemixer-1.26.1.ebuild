# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit mate

DESCRIPTION="Mixer library for MATE Desktop"
LICENSE="LGPL-2+"
SLOT="0"
KEYWORDS="*"

IUSE="+alsa oss pulseaudio"

COMMON_DEPEND="
	>=dev-libs/glib-2.50:2
	>=sys-devel/gettext-0.19.8:*
	alsa? ( >=media-libs/alsa-lib-1.0.5 )
"

RDEPEND="${COMMON_DEPEND}
	virtual/libintl
"

DEPEND="${COMMON_DEPEND}
	app-text/docbook-xml-dtd:4.1.2
	dev-util/gtk-doc
	dev-util/gtk-doc-am
	virtual/pkgconfig
"

#PATCHES=(
#	"${FILESDIR}"/${P}-slibtool.patch # 785232
#)

src_configure() {
	mate_src_configure \
		--disable-null \
		$(use_enable alsa) \
		$(use_enable oss) \
		$(use_enable pulseaudio)
}
