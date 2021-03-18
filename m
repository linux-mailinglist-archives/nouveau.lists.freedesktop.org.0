Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E7EEB34104D
	for <lists+nouveau@lfdr.de>; Thu, 18 Mar 2021 23:21:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F6C76E1B7;
	Thu, 18 Mar 2021 22:21:41 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [63.128.21.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B50796E1A8
 for <nouveau@lists.freedesktop.org>; Thu, 18 Mar 2021 22:21:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616106099;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3eGq0CaIyzsJWT3l78v2M/Vr0RPTI5s5NnBbSpXjFYs=;
 b=h53IHKLe7idDjBXafaKPq5olY+H3xKbjopD4C3h4N1S9e1+MTcicLp3NF6r0pJJlY3vHjT
 CEioao4GWMGyVhJ5JwUwwtkYLhLt/F32Lvi7WuN9KHHKnj7mHm5h9HWR/jKDEj/2Qwwr5J
 zO0CvPiE6ashCYx2ZGetKfHtd+YzPsM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-458-mx_7jnxqMyCn8fIr0SyOvQ-1; Thu, 18 Mar 2021 18:21:36 -0400
X-MC-Unique: mx_7jnxqMyCn8fIr0SyOvQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C2DB51007474;
 Thu, 18 Mar 2021 22:21:35 +0000 (UTC)
Received: from Whitewolf.lyude.net (ovpn-113-18.rdu2.redhat.com [10.10.113.18])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 02E0060CD7;
 Thu, 18 Mar 2021 22:21:34 +0000 (UTC)
From: Lyude <lyude@redhat.com>
To: igt-dev@lists.freedesktop.org,
	nouveau@lists.freedesktop.org
Date: Thu, 18 Mar 2021 18:21:24 -0400
Message-Id: <20210318222124.970997-3-lyude@redhat.com>
In-Reply-To: <20210318222124.970997-1-lyude@redhat.com>
References: <20210318222124.970997-1-lyude@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lyude@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Subject: [Nouveau] [PATCH i-g-t v2 2/2] tests/kms_cursor_crc: Test 32x32
 cursors
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
Cc: Ben Skeggs <bskeggs@redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

From: Lyude Paul <lyude@redhat.com>

Since pre-nve4 only has two cursor sizes (32x32 and 64x64), we should at
least test both of them.

Signed-off-by: Lyude Paul <lyude@redhat.com>
Cc: Martin Peres <martin.peres@free.fr>
Cc: Ben Skeggs <bskeggs@redhat.com>
Cc: Jeremy Cline <jcline@redhat.com>
---
 tests/kms_cursor_crc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/kms_cursor_crc.c b/tests/kms_cursor_crc.c
index b9c05472..754e1073 100644
--- a/tests/kms_cursor_crc.c
+++ b/tests/kms_cursor_crc.c
@@ -703,7 +703,7 @@ static void run_tests_on_pipe(data_t *data, enum pipe pipe)
 	igt_fixture
 		igt_remove_fb(data->drm_fd, &data->fb);
 
-	for (cursor_size = 64; cursor_size <= 512; cursor_size *= 2) {
+	for (cursor_size = 32; cursor_size <= 512; cursor_size *= 2) {
 		int w = cursor_size;
 		int h = cursor_size;
 
-- 
2.29.2

_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
