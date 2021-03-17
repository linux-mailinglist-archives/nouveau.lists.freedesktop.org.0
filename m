Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 628D433FB79
	for <lists+nouveau@lfdr.de>; Wed, 17 Mar 2021 23:50:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 989826E857;
	Wed, 17 Mar 2021 22:50:06 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED2456E059
 for <nouveau@lists.freedesktop.org>; Wed, 17 Mar 2021 22:50:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616021404;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=T4SRfwDzVd3XS0+8SM+oDq+ir9t56PAk7CjSRP3XnjQ=;
 b=LbkDaCOcwwI4yXuQxZIAB783tbaL6uVrA3zVS0WPenXpY7q+KTfVBir4i2x5EqLpJmhPfM
 yd4dErNH2E0dJmQOqfOW+zkw44N5UBCDiyIryo9FCYI16uqo4MUf3DJn0SjZ/unHuIJJMc
 qJGqVql2wcL3Uyny4Rn65cRmF+tkzew=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-519-fOnqAAZYPj2qCNQY2lM_cg-1; Wed, 17 Mar 2021 18:50:02 -0400
X-MC-Unique: fOnqAAZYPj2qCNQY2lM_cg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 476E1180FCA8;
 Wed, 17 Mar 2021 22:50:01 +0000 (UTC)
Received: from Whitewolf.lyude.net (ovpn-119-60.rdu2.redhat.com [10.10.119.60])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9BADB610F1;
 Wed, 17 Mar 2021 22:50:00 +0000 (UTC)
From: Lyude <lyude@redhat.com>
To: nouveau@lists.freedesktop.org,
	igt-dev@lists.freedesktop.org
Date: Wed, 17 Mar 2021 18:49:42 -0400
Message-Id: <20210317224949.448284-1-lyude@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lyude@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Subject: [Nouveau] [PATCH i-g-t 0/7] lib: Miscellaneous cleanups from
 nouveau work
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

These are just a couple of small fixes that didn't seem important
enough to stick in their own patch series, but were various issues with
igt that I found along the way during my recent nouveau igt work.

Cc: Martin Peres <martin.peres@free.fr>
Cc: Jeremy Cline <jcline@redhat.com>

Lyude Paul (7):
  lib/drmtest: Use igt_assert_eq() for do_or_die()
  lib/drmtest: And use do_or_die() in do_ioctl()
  lib/drmtest: Remove i915 refs in do_ioctl*() docs
  lib/igt_fb: Remove domain from igt_fb
  lib/debugfs: Fix igt_crc_t docs to mention has_valid_frame
  lib/igt_aux: Print name of debug var in igt_debug_wait_for_keypress()
  lib/debugfs: Fix function name in igt_pipe_crc_get_for_frame() docs

 lib/drmtest.h     | 8 ++++----
 lib/igt_aux.c     | 2 +-
 lib/igt_debugfs.c | 2 +-
 lib/igt_debugfs.h | 3 ++-
 lib/igt_fb.c      | 3 ---
 lib/igt_fb.h      | 2 --
 6 files changed, 8 insertions(+), 12 deletions(-)

-- 
2.29.2

_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
