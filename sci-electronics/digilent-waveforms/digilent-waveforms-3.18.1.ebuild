# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

MY_PN=${PN//-/.}

DESCRIPTION="Digilent WaveForms Application, Runtime, and SDK"
HOMEPAGE="https://reference.digilentinc.com/reference/software/adept/start"
SRC_URI="https://s3-us-west-2.amazonaws.com/digilent/Software/Waveforms2015/${PV}/${MY_PN}_${PV}_amd64.deb"

LICENSE="Digilent-EULA"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND="
	app-arch/bzip2
	dev-libs/double-conversion
	dev-libs/glib
	dev-libs/icu
	dev-libs/libbsd
	dev-libs/libpcre2
	dev-libs/openssl
	dev-qt/qtcore:5
	dev-qt/qtgui:5
	dev-qt/qtmultimedia:5[widgets]
	dev-qt/qtnetwork:5
	dev-qt/qtscript:5[scripttools]
	dev-qt/qtwidgets:5
	media-libs/freetype
	media-libs/harfbuzz
	media-libs/libglvnd
	media-libs/libpng
	sci-electronics/digilent-adept-runtime
	sys-libs/glibc
	sys-libs/zlib
	virtual/libusb:1
	virtual/udev
	x11-libs/libX11
	x11-libs/libXau
	x11-libs/libXdmcp
	x11-libs/libxcb"
RDEPEND="${DEPEND}"
BDEPEND=""

QA_PREBUILT="*"
RESTRICT="strip"

src_unpack() {
	default
	mkdir "${S}"
	cd "${S}"
	tar xf "${WORKDIR}/data.tar.xz" \
		--exclude="usr/share/lintian" \
		--exclude="usr/lib/digilent/waveforms/qtlibs"
}

src_install() {
	dobin usr/bin/*

	doheader -r usr/include/digilent

	dolib.so usr/lib/libdwf.so
	dolib.so usr/lib/libdwf.so.3
	dolib.so usr/lib/libdwf.so.3.14.3

	for manpage in usr/share/man/man1/*.gz; do
		gunzip "$manpage"
		doman "${manpage/.gz/}"
	done

	(
		insinto /usr/lib
		doins -r usr/lib/digilent

		chmod +x "${ED}/usr/lib/digilent/waveforms/waveforms"
		chmod +x "${ED}/usr/lib/digilent/waveforms/waveforms.sh"
	)

	(
		insinto /usr/share
		doins -r usr/share/applications
		doins -r usr/share/digilent
		doins -r usr/share/mime
	)

	(
		dodoc usr/share/doc/digilent.waveforms/changelog.gz
		dodoc usr/share/doc/digilent.waveforms/copyright
	)
}
