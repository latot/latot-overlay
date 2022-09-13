EAPI=8

inherit autotools git-r3

DESCRIPTION="Dolt: MySQL server with git integrated"
HOMEPAGE="https://github.com/dolthub/dolt"
SLOT="0"

EGIT_REPO_URI="https://github.com/dolthub/dolt"

src_install() {
    dobin "dolt-linux-amd64/bin/dolt"
}
