Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 12454189360
	for <lists+nouveau@lfdr.de>; Wed, 18 Mar 2020 02:01:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 756A96E850;
	Wed, 18 Mar 2020 01:01:01 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-74.mimecast.com
 (us-smtp-delivery-74.mimecast.com [216.205.24.74])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 12AC66E850
 for <nouveau@lists.freedesktop.org>; Wed, 18 Mar 2020 01:00:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1584493259;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=a36Cp1b82AY7M+ypuDCKis8Fctd0krnTAfsHd+xP6vQ=;
 b=a0LpNI+mNzd6l1cKqgSmVR1rjOlU2T9jqLFBgos6k54kfsco5+Z94QFiJfQXK8P06XZryC
 sJxAWtfpEupJXqWwioaXMerhxivhG1zwbl+g113CgQJaB1I7KmCYuGCjg+K7tsfjLF0zkJ
 KI169FcgCLXctnAm9T5i4amDyBvW7bE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-181-H2sOFrIcNwuF6ZoNSXzN1w-1; Tue, 17 Mar 2020 21:00:51 -0400
X-MC-Unique: H2sOFrIcNwuF6ZoNSXzN1w-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3CF328010FC;
 Wed, 18 Mar 2020 01:00:50 +0000 (UTC)
Received: from whitewolf.redhat.com (ovpn-113-173.rdu2.redhat.com
 [10.10.113.173])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B449C60BFB;
 Wed, 18 Mar 2020 01:00:49 +0000 (UTC)
From: Lyude <lyude@redhat.com>
To: igt-dev@lists.freedesktop.org
Date: Tue, 17 Mar 2020 21:00:43 -0400
Message-Id: <20200318010047.237024-1-lyude@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Subject: [Nouveau] [PATCH i-g-t 0/4] Add nouveau-crc tests
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
Cc: nouveau@lists.freedesktop.org
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

Lyude Paul (4):
  lib/igt_core: Add igt_require_fd()
  lib/igt_debugfs: Add igt_debugfs_pipe_dir()
  lib/igt_kms: Hook up connector dithering prop
  tests: Add nouveau-crc tests

 lib/drmtest.c       |  10 ++
 lib/drmtest.h       |   2 +
 lib/igt_core.h      |  12 ++
 lib/igt_debugfs.c   |  29 ++++
 lib/igt_debugfs.h   |   1 +
 lib/igt_kms.c       |   6 +
 lib/igt_kms.h       |   1 +
 tests/meson.build   |   1 +
 tests/nouveau_crc.c | 396 ++++++++++++++++++++++++++++++++++++++++++++
 9 files changed, 458 insertions(+)
 create mode 100644 tests/nouveau_crc.c

-- 
2.24.1

_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
