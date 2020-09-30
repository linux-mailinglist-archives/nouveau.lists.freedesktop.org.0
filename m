Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C6F527F08E
	for <lists+nouveau@lfdr.de>; Wed, 30 Sep 2020 19:32:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E67B6E7EA;
	Wed, 30 Sep 2020 17:32:04 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [63.128.21.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 19A5E6E7D2
 for <nouveau@lists.freedesktop.org>; Wed, 30 Sep 2020 17:32:03 +0000 (UTC)
Dkim-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1601487122;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=XY7ZvqTh9X2mPGuDKGeCECmOJn3QIyDvATumssKezyg=;
 b=floAycVTqc4dtunFlemJ8CnKyOFaXyX0cAwSTVrLZtE0Y9EiVFVRJiR8HupMjAdEZmWRaD
 4znaChrxXHRMBl8trJSm753vTmQ5qDg9Jgr8Sumi1Z6Aedo4LDhL3CaxA0FspJpvViXXiJ
 g4h5ra6yu33HKObGPUC5z6obxZKojdk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-216-FUPZTl6JPHGCpC_9WuE0qA-1; Wed, 30 Sep 2020 13:31:55 -0400
X-MC-Unique: FUPZTl6JPHGCpC_9WuE0qA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D0DE1801F99;
 Wed, 30 Sep 2020 17:31:54 +0000 (UTC)
Received: from Ruby.redhat.com (ovpn-118-194.rdu2.redhat.com [10.10.118.194])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 523F278806;
 Wed, 30 Sep 2020 17:31:54 +0000 (UTC)
From: Lyude <lyude@redhat.com>
To: igt-dev@lists.freedesktop.org
Date: Wed, 30 Sep 2020 13:31:45 -0400
Message-Id: <20200930173150.431995-1-lyude@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lyude@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Subject: [Nouveau] [PATCH i-g-t v5 0/5] Add nouveau-crc tests
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

Nouveau has finally gotten CRC support, and at this point that support
has made its way upstream. Hooray!

So, let's start adding some relevant tests for it since nvidia's CRC
implementation has some rather interesting design choices that needed to
be worked around.

Lyude Paul (5):
  lib/igt_core: Fix igt_assert_fd() documentation
  lib/igt_core: Add igt_require_fd()
  lib/igt_debugfs: Add igt_debugfs_pipe_dir()
  lib/igt_kms: Hook up connector dithering prop
  tests: Add nouveau-crc tests

 .gitlab-ci.yml      |   2 +-
 lib/drmtest.c       |  10 ++
 lib/drmtest.h       |   2 +
 lib/igt_core.h      |  16 +-
 lib/igt_debugfs.c   |  21 +++
 lib/igt_debugfs.h   |   1 +
 lib/igt_kms.c       |   5 +
 lib/igt_kms.h       |   1 +
 tests/meson.build   |   1 +
 tests/nouveau_crc.c | 414 ++++++++++++++++++++++++++++++++++++++++++++
 10 files changed, 470 insertions(+), 3 deletions(-)
 create mode 100644 tests/nouveau_crc.c

-- 
2.26.2

_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
