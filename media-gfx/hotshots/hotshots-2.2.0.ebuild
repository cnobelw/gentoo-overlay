# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=5
inherit git-2 eutils qmake-utils

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
#QT4_TARGET_SUBDIRS=(
#    build
#)

DOCS=( CHANGELOG README )
S=${WORKDIR}

src_configure() {
	cd ${S}/build 
	eqmake4 -recursive HotShots.pro PREFIX=/usr/local || die "qmake failed"
	econf --bindir=$PREFIX/bin
}
src_compile() {
	cd ${S}/build
	emake || die "make failed"
}
#src_prepare() {
#	cd ${S}/build
#	QT_SELECT=qt4 eqmake4 -recursive PREFIX=/usr/local
#}
src_install() {
	cd ${S}/build
	emake INSTALL_ROOT=${D} install || die "install failed"
}

