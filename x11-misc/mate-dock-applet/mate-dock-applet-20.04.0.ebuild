# Distributed under the terms of the GNU General Public License v2

EAPI=7
PYTHON_COMPAT=( python3+ )

inherit autotools python-r1

DESCRIPTION="Application dock for the MATE panel"
HOMEPAGE="https://github.com/ubuntu-mate/mate-dock-applet"
SRC_URI="https://github.com/ubuntu-mate/mate-dock-applet/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="*"

RDEPEND="
	dev-python/pillow[${PYTHON_USEDEP}]
	dev-python/python-xlib[${PYTHON_USEDEP}]
	dev-python/pygobject:3[${PYTHON_USEDEP}]
	dev-python/pycairo[${PYTHON_USEDEP}]
	dev-python/pyxdg[${PYTHON_USEDEP}]
	dev-python/distro[${PYTHON_USEDEP}]
	>=mate-base/mate-panel-1.17.0[introspection]
	x11-libs/libwnck:3[introspection]
	x11-libs/bamf
	"

src_prepare() {
	default
	eaclocal
	eautomake
	eautoreconf
}

src_configure(){
	econf --with-gtk3
}
