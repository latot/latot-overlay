# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="Open-source scientific and technical publishing system built on Pandoc."
HOMEPAGE="https://github.com/quarto-dev/quarto-cli"

#inherit git-r3
#EGIT_REPO_URI="https://github.com/quarto-dev/quarto-cli"
#EGIT_COMMIT="v${PV}"
KEYWORDS="~amd64"

SRC_URI="https://github.com/quarto-dev/quarto-cli/releases/download/v1.2.335/quarto-${PV}-linux-${ARCH}.tar.gz"

RESTRICT="mirror"

LICENSE=""
SLOT="0"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

src_install() {
  echo ${S}
  dodir "/opt/${PN}"
  insinto "/opt/${PN}"
  doins -r "${S}"
  dosym "/opt/${PN}/${P}/bin/quarto" "/usr/bin/quarto"
  fperms -R 755 "/opt/${PN}"
}
