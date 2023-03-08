# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

DESCRIPTION="Open-source scientific and technical publishing system built on Pandoc."
HOMEPAGE="https://github.com/quarto-dev/quarto-cli"

inherit git-r3
EGIT_REPO_URI="https://github.com/quarto-dev/quarto-cli"
EGIT_COMMIT="v${PV}"
KEYWORDS="~amd64 ~x86"

RESTRICT="mirror"

LICENSE=""
SLOT="0"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

src_configure(){
	econf
}

src_compile() {
	emake
}

src_install() {
	emake DESTDIR="${D}" install
}
