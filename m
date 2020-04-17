Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8962B1AE750
	for <lists+nouveau@lfdr.de>; Fri, 17 Apr 2020 23:10:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D1BD6EB9F;
	Fri, 17 Apr 2020 21:10:41 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D00D6EB9F
 for <nouveau@lists.freedesktop.org>; Fri, 17 Apr 2020 21:10:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1587157839;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=K69Laazh1VM12a+ohy1E30SSigTQ9P+N0WbO8Et9K5w=;
 b=hf4BDNRGaOHePvUTw7kOBUcNt3CQZ1dIcE9w7KNadpioIIwgrUQxYfBdvTnnf3A8oB/8xh
 aG+h4/kuCPx1519qO1lOxT00DTd/QUCWUUuzXWZTdgVUXP6BTiuDzLWJTJ7xpatG0jB3y8
 DdYr4fbnUmz/HM2nUZpFXvBJk4DbOfQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-66-PasjS7RYNTGW_QboTthJOw-1; Fri, 17 Apr 2020 17:10:31 -0400
X-MC-Unique: PasjS7RYNTGW_QboTthJOw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A08E4107ACC4;
 Fri, 17 Apr 2020 21:10:30 +0000 (UTC)
Received: from Ruby.redhat.com (ovpn-114-140.rdu2.redhat.com [10.10.114.140])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0C5495C221;
 Fri, 17 Apr 2020 21:10:29 +0000 (UTC)
From: Lyude <lyude@redhat.com>
To: nouveau@lists.freedesktop.org,
	igt-dev@lists.freedesktop.org
Date: Fri, 17 Apr 2020 17:10:20 -0400
Message-Id: <20200417211025.109574-1-lyude@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Subject: [Nouveau] [PATCH i-g-t v3 0/5] Add nouveau-crc tests
X-BeenThere: nouveau@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request@lists.freedesktop.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

From: Lyude Paul <lyude@redhat.com>

Nouveau has finally gotten CRC support, hooray! Well, it's under review
at least:

https://patchwork.freedesktop.org/series/74804/
(it has a cover letter, but nouveau's mailing list configuration has
blocked the email so I'm waiting for a moderator to fix that)

So, this series adds the relevant tests for it since nvidia's CRC
implementation has some rather interesting design choices that needed to
be worked around.

Changes since v2:
* Fix build errors on mips/arm/aarch64
Changes since v1:
* fix documentation errors Petri pointed out
* Fix documentation for igt_require_fd()
* Fix copyright year in tests/nouveau_crc.c

Lyude Paul (5):
  lib/igt_core: Fix igt_assert_fd() documentation
  lib/igt_core: Add igt_require_fd()
  lib/igt_debugfs: Add igt_debugfs_pipe_dir()
  lib/igt_kms: Hook up connector dithering prop
  tests: Add nouveau-crc tests

 lib/drmtest.c       |  10 ++
 lib/drmtest.h       |   2 +
 lib/igt_core.h      |  16 +-
 lib/igt_debugfs.c   |  29 ++++
 lib/igt_debugfs.h   |   1 +
 lib/igt_kms.c       |   6 +
 lib/igt_kms.h       |   1 +
 tests/meson.build   |   1 +
 tests/nouveau_crc.c | 397 ++++++++++++++++++++++++++++++++++++++++++++
 9 files changed, 461 insertions(+), 2 deletions(-)
 create mode 100644 tests/nouveau_crc.c

-- 
2.25.1

_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
