# Distributed under the terms of the GNU General Public License v2

# @ECLASS: mate.eclass
# @MAINTAINER:
# mate@gentoo.org
# @AUTHOR:
# Authors: NP-Hardass <NP-Hardass@gentoo.org>
# @SUPPORTED_EAPIS: 6 7 8
# @BLURB: Provides phases for MATE based packages.
# @DESCRIPTION:
# Exports portage base functions used by ebuilds written for packages using the
# MATE framework. Occassionally acts as a wrapper to gnome3 due to the
# fact that MATE is a GNOME fork. For additional functions, see gnome3-utils.eclass.

# Check EAPI only
case "${EAPI:-0}" in
	6|7|8) ;;
	*) die "EAPI=${EAPI:-0} is not supported" ;;
esac

if [[ -z ${_MATE_ECLASS} ]]; then
_MATE_ECLASS=1

  # Inherit happens below after declaration of GNOME3_LA_PUNT

  # @ECLASS-VARIABLE: MATE_LA_PUNT
  # @DESCRIPTION:
  # Available values for MATE_LA_PUNT:
  # - "no": will not clean any .la files
  # - "yes": will run prune_libtool_files --modules
  # - If it is not set, it will run prune_libtool_files
  # MATE_LA_PUNT is a stub to GNOME3_LA_PUNT
  MATE_LA_PUNT=${MATE_LA_PUNT:-""}
  GNOME3_LA_PUNT=${MATE_LA_PUNT:-""}

  inherit gnome3 autotools mate-desktop.org

  case "${EAPI:-0}" in
      6|7) EXPORT_FUNCTIONS src_prepare src_configure src_install pkg_preinst pkg_postinst pkg_postrm ;;
      *) die "EAPI=${EAPI:-0} is not supported" ;;
  esac

  # Autotools requires our MATE m4 files
  BDEPEND=">=mate-base/mate-common-${MATE_BRANCH}"

  # @FUNCTION: mate_py_cond_func_wrap
  # @DESCRIPTION:
  # Wraps a function for conditional python use, to run for each
  # python implementation in the build directory.
  # This function should only be used if the ebuild also inherits the
  # python-r1 eclass
  mate_py_cond_func_wrap() {
      if [ -z "${_PYTHON_R1}" ] && [ -z "${_PYTHON_R1_ECLASS}" ]; then
          die "This function requires the inheritence of the python-r1 eclass"
      fi
      if use python; then
          python_foreach_impl run_in_build_dir "$@"
      else
          $@
      fi
  }

  # @ECLASS_VARIABLE: MATE_FORCE_AUTORECONF
  # @DESCRIPTION:
  # Available values for MATE_FORCE_AUTORECONF:
  # - true: will always run eautoreconf
  # - false: will default to automatic detect
  # - If it is not set, it will default to false
  : "${MATE_FORCE_AUTORECONF:="false"}"

  # @FUNCTION: ematedocize
  # @DESCRIPTION:
  # A wrapper around mate-doc-common
  ematedocize() {
      ebegin "Running mate-doc-common --copy"
          mate-doc-common --copy || die
      eend $?
  }

  # @FUNCTION: want_mate_doc
  # @DESCRIPTION:
  # Returns true/false based on whether eautoreconf should call
  # ematedocize
  want_mate_doc() {
      grep -q USE_COMMON_DOC_BUILD autogen.sh
  }

  # @FUNCTION: mate_src_prepare
  # @DESCRIPTION:
  # Call gnome3_src_prepare to handle environment setup and patching, then
  # call eautoreconf if necessary
  mate_src_prepare() {
      debug-print-function ${FUNCNAME} "$@"

      local force_autoreconf=${MATE_FORCE_AUTORECONF}
      [[ ${PV} == 9999 ]] && force_autoreconf="true"

      gen_chksum() {
          find '(' -name 'Makefile.am' \
              -o -name 'configure.ac' \
              -o -name 'configure.in' ')' \
              -exec cksum {} + | sort -k2
      }

      local chksum=$(gen_chksum)

      gnome3_src_prepare "$@"

      if [[ "${force_autoreconf}" == "true" ]] || [[ ${chksum} != $(gen_chksum) ]]; then
          want_mate_doc && ematedocize
          AT_NOELIBTOOLIZE="yes" eautoreconf # gnome3_src_prepare calls elibtoolize
      fi
  }

  # @FUNCTION: mate_src_configure
  # @DESCRIPTION:
  # MATE specific configure handling
  # Stub to gnome3_src_configure()
  mate_src_configure() {
      local mateconf=()

      # Pass --disable-static whenever possible
      if ! in_iuse static-libs || ! use static-libs; then
          if grep -q "enable-static" "${ECONF_SOURCE:-.}"/configure; then
              mateconf+=( --disable-static )
          fi
      fi

      gnome3_src_configure "$@"
  }

  # @FUNCTION: mate_src_install
  # @DESCRIPTION:
  # MATE specific install. Stub to gnome3_src_install
  mate_src_install() {
      gnome3_src_install "$@"
  }

  # @FUNCTION: mate_pkg_preinst
  # @DESCRIPTION:
  # Finds Icons, GConf and GSettings schemas for later handling in pkg_postinst
  # Stub to gnome3_pkg_preinst
  mate_pkg_preinst() {
      gnome3_pkg_preinst "$@"
  }

  # @FUNCTION: mate_pkg_postinst
  # @DESCRIPTION:
  # Handle scrollkeeper, GConf, GSettings, Icons, desktop and mime
  # database updates.
  # Stub to gnome3_pkg_postinst
  mate_pkg_postinst() {
      gnome3_pkg_postinst "$@"
  }

  # @FUNCTION: mate_pkg_postrm
  # @DESCRIPTION:
  # Handle scrollkeeper, GSettings, Icons, desktop and mime database updates.
  # Stub to gnome3_pkg_postrm
  mate_pkg_postrm() {
      gnome3_pkg_postrm "$@"
  }

fi

EXPORT_FUNCTIONS src_prepare src_configure src_install pkg_preinst pkg_postinst pkg_postrm
