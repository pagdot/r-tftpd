IS_RELEASE ?=
IS_OFFLINE ?=

CARGO_FILES = \
	.cargo/config \
	Cargo.toml \

all:

include mk/init.mk

-include ${HOME}/.config/rust/common.mk
-include ${HOME}/.config/rust/r-tftpd.mk
-include .local.mk

include mk/m4.mk
include mk/paths.mk
include mk/cargo.mk

include contrib/Makefile.mk

install:	install-fixup

install-fixup:	cargo-install
	${MKDIR_P} ${DESTDIR}${sbindir}
	mv ${DESTDIR}${bindir}/r-tftpd ${DESTDIR}${sbindir}/
	-@rmdir ${DESTDIR}${bindir}
