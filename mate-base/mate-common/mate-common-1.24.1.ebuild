# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit mate-desktop.org

DESCRIPTION="Common files for development of MATE packages"
LICENSE="GPL-3"
SLOT="0"
KEYWORDS="*"

src_install() {
	mv doc-build/README README.doc-build \
		|| die "Failed to rename doc-build/README."

	default

	dodoc doc/usage.txt
}
