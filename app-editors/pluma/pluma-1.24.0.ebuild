# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=6

MATE_LA_PUNT="yes"

PYTHON_COMPAT=( python3+ )

inherit mate python-single-r1 virtualx

DESCRIPTION="Pluma text editor for the MATE desktop"
LICENSE="GPL-2"
SLOT="0"
KEYWORDS="*"

IUSE="+introspection spell"

REQUIRED_USE="${PYTHON_REQUIRED_USE}"

# Tests require gvfs sftp fs mounted and schema's installed. Disable tests.
# https://github.com/mate-desktop/mate-text-editor/issues/33
RESTRICT="test"

COMMON_DEPEND="dev-libs/atk
	>=dev-libs/glib-2.70.0-r1:2=
	>=dev-libs/libpeas-1.2.0[gtk]
	>=dev-libs/libxml2-2.5:2
	x11-libs/cairo
	x11-libs/gdk-pixbuf:2
	>=x11-libs/gtk+-3.22:3[introspection?]
	>=x11-libs/gtksourceview-3.0.0:3.0
	x11-libs/libICE
	x11-libs/libX11
	>=x11-libs/libSM-1.0
	x11-libs/pango
	sys-devel/gettext
	introspection? ( >=dev-libs/gobject-introspection-0.9.3:= )
	spell? (
		>=app-text/enchant-1.6
		>=app-text/iso-codes-0.35
	)
	!!app-editors/mate-text-editor"

RDEPEND="${PYTHON_DEPS}
	${COMMON_DEPEND}
	>=mate-base/mate-desktop-1.9[introspection?]"

DEPEND="${COMMON_DEPEND}
	~app-text/docbook-xml-dtd-4.1.2
	app-text/rarian
	>=app-text/scrollkeeper-dtd-1:1.0
	app-text/yelp-tools
	dev-util/glib-utils
	dev-util/gtk-doc
	dev-util/gtk-doc-am
	>=sys-devel/libtool-2.2.6:2
	virtual/pkgconfig"

src_configure() {
	mate_src_configure \
		$(use_enable introspection) \
		$(use_enable spell)
}

src_test() {
	# FIXME: This should be handled at eclass level.
	"${EROOT}${GLIB_COMPILE_SCHEMAS}" --allow-any-name "${S}/data" || die

	unset DBUS_SESSION_BUS_ADDRESS

	GSETTINGS_SCHEMA_DIR="${S}/data" Xemake check
}
