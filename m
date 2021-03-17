Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4203A33FB7D
	for <lists+nouveau@lfdr.de>; Wed, 17 Mar 2021 23:50:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0235A6E85D;
	Wed, 17 Mar 2021 22:50:14 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DED196E85E
 for <nouveau@lists.freedesktop.org>; Wed, 17 Mar 2021 22:50:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616021412;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=uqe9d8wlisRRZfSfOSQ1wyEWTttRZQ0F/+8t6eMj4Dk=;
 b=cJaZpoBZ//bOQeXzxH0BO5rTdSKLvvQvc7k7oQJX20IoooWAXGXRYofwvXFqKMqi87yjIS
 V2WqFNRojnQVPZNCysfj9oYrzglPN7mXc/3kzdE7RL+YbIr4NFKsj7XwTlWNJVgiqBzZYn
 uI7cv9Oxt0ELen/MIwJqvxz7KIhDS7w=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-511-r_MmXwzZOY-a9uTiq5SdAQ-1; Wed, 17 Mar 2021 18:50:09 -0400
X-MC-Unique: r_MmXwzZOY-a9uTiq5SdAQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A9AB7180FCA5;
 Wed, 17 Mar 2021 22:50:08 +0000 (UTC)
Received: from Whitewolf.lyude.net (ovpn-119-60.rdu2.redhat.com [10.10.119.60])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 07CCD610F0;
 Wed, 17 Mar 2021 22:50:07 +0000 (UTC)
From: Lyude <lyude@redhat.com>
To: nouveau@lists.freedesktop.org,
	igt-dev@lists.freedesktop.org
Date: Wed, 17 Mar 2021 18:49:47 -0400
Message-Id: <20210317224949.448284-6-lyude@redhat.com>
In-Reply-To: <20210317224949.448284-1-lyude@redhat.com>
References: <20210317224949.448284-1-lyude@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lyude@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Subject: [Nouveau] [PATCH i-g-t 5/7] lib/debugfs: Fix igt_crc_t docs to
 mention has_valid_frame
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

Looks like this never got updated when has_valid_frame got added.

Signed-off-by: Lyude Paul <lyude@redhat.com>
Cc: Martin Peres <martin.peres@free.fr>
Cc: Jeremy Cline <jcline@redhat.com>
---
 lib/igt_debugfs.h | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/lib/igt_debugfs.h b/lib/igt_debugfs.h
index d43ba6c6..97cbaa1c 100644
--- a/lib/igt_debugfs.h
+++ b/lib/igt_debugfs.h
@@ -70,10 +70,11 @@ typedef struct _igt_pipe_crc igt_pipe_crc_t;
 /**
  * igt_crc_t:
  * @frame: frame number of the capture CRC
+ * @has_valid_frame: whether this CRC entry has a valid frame counter
  * @n_words: internal field, don't access
  * @crc: internal field, don't access
  *
- * Pipe CRC value. All other members than @frame are private and should not be
+ * Pipe CRC value. All other members than @frame and @has_valid_frame are private and should not be
  * inspected by testcases.
  */
 typedef struct {
-- 
2.29.2

_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
