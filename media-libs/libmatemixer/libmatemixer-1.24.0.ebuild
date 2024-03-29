# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit mate

DESCRIPTION="Mixer library for MATE Desktop"
LICENSE="LGPL-2 GPL-2"
SLOT="0"
KEYWORDS="*"

IUSE="+alsa oss pulseaudio"

COMMON_DEPEND="
	>=dev-libs/glib-2.70.0-r1:2=
	sys-devel/gettext:*
	alsa? ( >=media-libs/alsa-lib-1.0.5 )
	pulseaudio? ( >=media-sound/pulseaudio-5.0.0:0[alsa?,glib] )"

RDEPEND="${COMMON_DEPEND}"

DEPEND="${COMMON_DEPEND}
	app-text/docbook-xml-dtd:4.1.2
	dev-util/gtk-doc
	dev-util/gtk-doc-am
	>=dev-util/intltool-0.35.0
	virtual/pkgconfig:*"

src_configure() {
	mate_src_configure \
		--disable-null \
		$(use_enable alsa) \
		$(use_enable oss) \
		$(use_enable pulseaudio)
}
