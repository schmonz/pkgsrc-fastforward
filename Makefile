# $NetBSD: Makefile,v 1.31 2025/04/03 01:11:10 schmonz Exp $
#

DISTNAME=		fastforward-0.51
PKGREVISION=		3
CATEGORIES=		mail
MASTER_SITES=		http://cr.yp.to/software/

MAINTAINER=		schmonz@NetBSD.org
HOMEPAGE=		https://cr.yp.to/fastforward.html
COMMENT=		Sendmail-style /etc/aliases support for qmail
LICENSE=		public-domain

DEPENDS+=		qmail>=1.03nb7:../../mail/qmail

CONFLICTS+=		esmtp>=1.2 postfix-[0-9]* sendmail-[0-9]*

DJB_BUILD_TARGETS=	install instcheck

SUBST_CLASSES+=		djberrno
SUBST_FILES.djberrno=	cdb_seek.c error.h

SUBST_CLASSES+=		paths
SUBST_STAGE.paths=	do-configure
SUBST_FILES.paths=	hier.c
SUBST_VARS.paths=	PKGMANDIR

.include "../../mk/djbware.mk"
.include "../../mk/bsd.pkg.mk"
