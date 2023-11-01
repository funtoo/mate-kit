# Distributed under the terms of the GNU General Public License v2

# @ECLASS: mate-desktop.org.eclass
# @MAINTAINER:
# mate@gentoo.org
# @AUTHOR:
# Authors: NP-Hardass <NP-Hardass@gentoo.org> based upon the gnome.org eclass.
# @SUPPORTED_EAPIS: 6 7 8
# @BLURB: Helper eclass for mate-desktop.org hosted archives
# @DESCRIPTION:

case ${EAPI} in
	6|7|8) ;;
	*) die "${ECLASS}: EAPI ${EAPI:-0} not supported" ;;
esac

if [[ -z ${_MATE_DESKTOP_ORG_ECLASS} ]]; then
_MATE_DESKTOP_ORG_ECLASS=1

# @ECLASS_VARIABLE: MATE_TARBALL_SUFFIX
# @INTERNAL
# @DESCRIPTION:
# All projects hosted on mate-desktop.org provide tarballs as tar.xz.
: "${MATE_TARBALL_SUFFIX:=xz}"

# @ECLASS_VARIABLE: MATE_DESKTOP_ORG_PN
# @DESCRIPTION:
# Name of the package as hosted on mate-desktop.org.
# Leave unset if package name matches PN.
: "${MATE_DESKTOP_ORG_PN:=${PN}}"

# @ECLASS_VARIABLE: MATE_DESKTOP_ORG_PV
# @DESCRIPTION:
# Package version string as listed on mate-desktop.org.
# Leave unset if package version string matches PV.
: "${MATE_DESKTOP_ORG_PV:=${PV}}"

# @ECLASS_VARIABLE: MATE_BRANCH
# @DESCRIPTION:
# Major and minor numbers of the version number
: "${MATE_BRANCH:=$(ver_cut 1-2)}"

SRC_URI="https://pub.mate-desktop.org/releases/${MATE_BRANCH}/${MATE_DESKTOP_ORG_PN}-${MATE_DESKTOP_ORG_PV}.tar.${MATE_TARBALL_SUFFIX}"

# Set HOMEPAGE for all ebuilds
HOMEPAGE="https://mate-desktop.org"

fi
