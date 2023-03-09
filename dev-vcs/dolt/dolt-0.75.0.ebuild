EAPI=8

#inherit autotools
inherit git-r3

DESCRIPTION="Dolt: MySQL server with git integrated"
HOMEPAGE="https://github.com/dolthub/dolt"
SLOT="0"

SRC_URI="https://github.com/dolthub/dolt/archive/refs/tags/v${PV}.zip"
#WORKDIR="${S}/dolt-linux-amd64/go"

#EGIT_REPO_URI="https://github.com/dolthub/dolt"
#EGIT_BRANCH="main"
#EGIT_COMMIT="v${PV}"

S="${WORKDIR}/${P}/go"

inherit go-module

export GOPROXY=direct 

src_compile(){
  ego install "./cmd/dolt"
}

src_install() {
    dobin "${S}/dolt"
}
