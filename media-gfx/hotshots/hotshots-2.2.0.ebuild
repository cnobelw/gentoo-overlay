# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=5
inherit git-2 eutils cmake-utils

DESCRIPTION="HotShots is an application for capturing screens."
HOMEPAGE="https://github.com/cnobelw/gentoo-overlay"
EGIT_REPO_URI="https://github.com/cnobelw/hotShots.git"

LICENSE="GPL-2 LGPL-2.1 CC-BY-3.0"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="dev-qt/qtcore
        dev-qt/qtgui
		dev-qt/qtxml
		dev-qt/qtnetwork"
RDEPEND="${DEPEND}"

DOCS=( CHANGELOG README )

src_install() {
	cd build
	cmake-utils_src_install
	# doicon "${S}/images/${PN}.ico"
	# make_desktop_entry "hotshots" "HotShots" "${PN}.ico" "Qt;Utility"
}

