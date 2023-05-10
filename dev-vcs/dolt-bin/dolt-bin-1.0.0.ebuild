EAPI=8

inherit autotools
#inherit git-r3

DESCRIPTION="Dolt – Git for Data"
HOMEPAGE="https://github.com/dolthub/dolt"
SLOT="0"

SRC_URI="https://github.com/dolthub/dolt/releases/download/v${PV}/dolt-linux-${ARCH}.tar.gz -> dolt-bin-linux-${ARCH}-v${PV}.tar.gz"
S="${WORKDIR}"

#EGIT_REPO_URI="https://github.com/dolthub/dolt"
#EGIT_BRANCH="main"

src_install() {
    dobin "dolt-linux-amd64/bin/dolt"
}
