EAPI=8

inherit autotools
#inherit git-r3

DESCRIPTION="Dolt: MySQL server with git integrated"
HOMEPAGE="https://github.com/dolthub/dolt"
SLOT="0"

SRC_URI="https://github.com/dolthub/dolt/releases/latest/download/dolt-linux-amd64.tar.gz"

#EGIT_REPO_URI="https://github.com/dolthub/dolt"
#EGIT_BRANCH="main"

src_install() {
    dobin "dolt-linux-amd64/bin/dolt"
}
