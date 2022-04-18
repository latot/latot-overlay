# Copyright 2022 latot
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit rpm

DESCRIPTION="Fork of Github Desktop for linux"
HOMEPAGE="https://github.com/shiftkey/desktop"
SRC_URI="https://github.com/shiftkey/desktop/releases/download/release-2.9.14-linux2/GitHubDesktop-linux-2.9.14-linux2.rpm"

LICENSE="MIT License"
SLOT="0"
KEYWORDS="-*"

RESTRICT="mirror"

BDEPEND="app-arch/rpm"

src_unpack() {
    rpm_src_unpack ${A}
}

src_prepare() {
    eapply_user
}

