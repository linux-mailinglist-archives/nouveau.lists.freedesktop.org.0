Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DB1633FB7B
	for <lists+nouveau@lfdr.de>; Wed, 17 Mar 2021 23:50:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A2AA6E04E;
	Wed, 17 Mar 2021 22:50:11 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 80F146E04E
 for <nouveau@lists.freedesktop.org>; Wed, 17 Mar 2021 22:50:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616021409;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hOL0WAKyqW1Tf3OeEtSalUKSLYMY2WIX/9OPhhjbobU=;
 b=ae6oifOBCe9Mhjnh33rgX7m4tLzOLEPTmmI3JKd7S1mMfumPfTqCPftlw+tozrbHWdukWP
 VMwjpM422PjII27ERar8+6yyFS1O4OCIPdyqLZaNg0oZs6x8vTaCJdWGxKkxXYPfhVRFZn
 C6TtE0nURtLNIrK4nKmQSIvq/nMCE4o=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-141-v9uj9Sp3NgOFoyWZw607ZQ-1; Wed, 17 Mar 2021 18:50:07 -0400
X-MC-Unique: v9uj9Sp3NgOFoyWZw607ZQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3F0408189C8;
 Wed, 17 Mar 2021 22:50:06 +0000 (UTC)
Received: from Whitewolf.lyude.net (ovpn-119-60.rdu2.redhat.com [10.10.119.60])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5AEE7610F1;
 Wed, 17 Mar 2021 22:50:02 +0000 (UTC)
From: Lyude <lyude@redhat.com>
To: nouveau@lists.freedesktop.org,
	igt-dev@lists.freedesktop.org
Date: Wed, 17 Mar 2021 18:49:44 -0400
Message-Id: <20210317224949.448284-3-lyude@redhat.com>
In-Reply-To: <20210317224949.448284-1-lyude@redhat.com>
References: <20210317224949.448284-1-lyude@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lyude@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Subject: [Nouveau] [PATCH i-g-t 2/7] lib/drmtest: And use do_or_die() in
 do_ioctl()
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

No need to use igt_assert_eq() here now that do_or_die() uses
igt_assert_eq()

Signed-off-by: Lyude Paul <lyude@redhat.com>
Cc: Martin Peres <martin.peres@free.fr>
Cc: Ben Skeggs <bskeggs@redhat.com>
Cc: Jeremy Cline <jcline@redhat.com>
---
 lib/drmtest.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/lib/drmtest.h b/lib/drmtest.h
index 789452ea..c4b15a26 100644
--- a/lib/drmtest.h
+++ b/lib/drmtest.h
@@ -125,7 +125,7 @@ bool is_vc4_device(int fd);
  * successfully executed.
  */
 #define do_ioctl(fd, ioc, ioc_data) do { \
-	igt_assert_eq(igt_ioctl((fd), (ioc), (ioc_data)), 0); \
+	do_or_die(igt_ioctl((fd), (ioc), (ioc_data))); \
 	errno = 0; \
 } while (0)
 
-- 
2.29.2

_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
