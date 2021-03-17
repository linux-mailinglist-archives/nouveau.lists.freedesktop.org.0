Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 45A6B33FB83
	for <lists+nouveau@lfdr.de>; Wed, 17 Mar 2021 23:51:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC82D6E85B;
	Wed, 17 Mar 2021 22:51:18 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D68C46E85B
 for <nouveau@lists.freedesktop.org>; Wed, 17 Mar 2021 22:51:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616021475;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3K9xjdaO+mFRYmOodMmxiJGOfAGQOU4IY9APsSv/+TQ=;
 b=L8Drqy8833UBBnbvw5SXXGHIEiR+PO/GYrapPKFs0IP+2R+K9xm2gZojF+KaO+1CN7wVfV
 8TypV11VnkqgyN5HcHyX/iMoYuF1vpJDRXyCS+Lk+tstJvmeYQF0N8n9uTqEyCdHFDYe5d
 wyinDn93bHW5K4t5JeCheGyexbi5+ng=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-44-Bzj7CbzmMC6NCJ1lY12k6g-1; Wed, 17 Mar 2021 18:50:08 -0400
X-MC-Unique: Bzj7CbzmMC6NCJ1lY12k6g-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D50FE107B7C3;
 Wed, 17 Mar 2021 22:50:07 +0000 (UTC)
Received: from Whitewolf.lyude.net (ovpn-119-60.rdu2.redhat.com [10.10.119.60])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 34647610F0;
 Wed, 17 Mar 2021 22:50:07 +0000 (UTC)
From: Lyude <lyude@redhat.com>
To: nouveau@lists.freedesktop.org,
	igt-dev@lists.freedesktop.org
Date: Wed, 17 Mar 2021 18:49:46 -0400
Message-Id: <20210317224949.448284-5-lyude@redhat.com>
In-Reply-To: <20210317224949.448284-1-lyude@redhat.com>
References: <20210317224949.448284-1-lyude@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lyude@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Subject: [Nouveau] [PATCH i-g-t 4/7] lib/igt_fb: Remove domain from igt_fb
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

It doesn't look like that this is used by i915 for anything these days, so
let's just remove this while we're at it.

Signed-off-by: Lyude Paul <lyude@redhat.com>
Cc: Martin Peres <martin.peres@free.fr>
Cc: Jeremy Cline <jcline@redhat.com>
---
 lib/igt_fb.c | 3 ---
 lib/igt_fb.h | 2 --
 2 files changed, 5 deletions(-)

diff --git a/lib/igt_fb.c b/lib/igt_fb.c
index f0fcd1a7..2b478887 100644
--- a/lib/igt_fb.c
+++ b/lib/igt_fb.c
@@ -2491,7 +2491,6 @@ static void create_cairo_surface__gpu(int fd, struct igt_fb *fb)
 						    cairo_format,
 						    fb->width, fb->height,
 						    blit->linear.fb.strides[0]);
-	fb->domain = I915_GEM_DOMAIN_GTT;
 
 	cairo_surface_set_user_data(fb->cairo_surface,
 				    (cairo_user_data_key_t *)create_cairo_surface__gpu,
@@ -2571,8 +2570,6 @@ static void create_cairo_surface__gtt(int fd, struct igt_fb *fb)
 		      "Unable to create a cairo surface: %s\n",
 		      cairo_status_to_string(cairo_surface_status(fb->cairo_surface)));
 
-	fb->domain = I915_GEM_DOMAIN_GTT;
-
 	cairo_surface_set_user_data(fb->cairo_surface,
 				    (cairo_user_data_key_t *)create_cairo_surface__gtt,
 				    fb, destroy_cairo_surface__gtt);
diff --git a/lib/igt_fb.h b/lib/igt_fb.h
index 0d64898a..e4f8b2b1 100644
--- a/lib/igt_fb.h
+++ b/lib/igt_fb.h
@@ -64,7 +64,6 @@ struct buf_ops;
  * @modifier: tiling mode as a DRM framebuffer modifier
  * @size: size in bytes of the underlying backing storage
  * @cairo_surface: optionally attached cairo drawing surface
- * @domain: current domain for cache flushing tracking on i915.ko
  * @num_planes: Amount of planes on this fb. >1 for planar formats.
  * @strides: line stride for each plane in bytes
  * @offsets: Offset for each plane in bytes.
@@ -87,7 +86,6 @@ typedef struct igt_fb {
 	uint64_t modifier;
 	uint64_t size;
 	cairo_surface_t *cairo_surface;
-	unsigned int domain;
 	unsigned int num_planes;
 	uint32_t strides[4];
 	uint32_t offsets[4];
-- 
2.29.2

_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
