# Copyright 2004-2007 BreakMyGentoo.net
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit multilib

DESCRIPTION="Native Postgres driver for erlang"
HOMEPAGE="http://process-one.net"
SRC_URI=""

LICENSE=""
SLOT="0"
KEYWORDS="~x86 ~amd64 -*"
IUSE=""

DEPEND="dev-lang/erlang"
RDEPEND="${DEPEND}"
S=${WORKDIR}/postgres

src_unpack() {
	cp -r ${FILESDIR}/postgres ${WORKDIR}
}

src_compile() {
	find -name "*.erl" -exec erlc {} \;
}

src_install() {
	local ERL_LIBDIR=/usr/$(get_libdir)/erlang/lib

	dodir ${ERL_LIBDIR}/postgres/ebin
	insinto ${ERL_LIBDIR}/postgres/ebin
	doins *.beam

	dodir ${ERL_LIBDIR}/postgres/src
	insinto ${ERL_LIBDIR}/postgres/src
	doins *.erl
}
