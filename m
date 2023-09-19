Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 08D157A6DE2
	for <lists+nouveau@lfdr.de>; Wed, 20 Sep 2023 00:05:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7EF6310E28D;
	Tue, 19 Sep 2023 22:05:08 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 18B1510E22A
 for <nouveau@lists.freedesktop.org>; Tue, 19 Sep 2023 22:05:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1695161105;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xCjo/Hem9MAnfhVLHZne2i5FM0zSf1y9nqtdKVn+f9M=;
 b=iSj5B4XBfC4UGLmoBkY6gh6/poJSh4s+bYF2D2a3f/WRdq2EzkRvin86tfP5L29AG2tWIQ
 eOeXSu/FQ1cBf5X7gorxD9upqRZHLT3nTx+Fqqhx0ktSGkxDYH1sgwrdv9SFksl1RFV2yn
 xnRYl3kcp2xGg9FRABl1nOt4+Et1sEQ=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-116-9boy7TcLPjKkApWptqZUqA-1; Tue, 19 Sep 2023 18:05:03 -0400
X-MC-Unique: 9boy7TcLPjKkApWptqZUqA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8889A3822565;
 Tue, 19 Sep 2023 22:05:02 +0000 (UTC)
Received: from emerald.lyude.net (unknown [10.22.18.67])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D5DFE40C2064;
 Tue, 19 Sep 2023 22:05:01 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: dri-devel@lists.freedesktop.org,
	nouveau@lists.freedesktop.org
Date: Tue, 19 Sep 2023 17:55:56 -0400
Message-ID: <20230919220442.202488-2-lyude@redhat.com>
In-Reply-To: <20230919220442.202488-1-lyude@redhat.com>
References: <20230919220442.202488-1-lyude@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
Subject: [Nouveau] [PATCH v3 01/44] drm/nouveau/devinit/tu102-: remove
 attempt at loading PreOS
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
Cc: open list <linux-kernel@vger.kernel.org>, Ben Skeggs <bskeggs@redhat.com>,
 Daniel Vetter <daniel@ffwll.ch>
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

From: Ben Skeggs <bskeggs@redhat.com>

From Turing, HW will already have handled this and locked-down the
falcon before we get control.  So this *should* be a no-op.

Signed-off-by: Ben Skeggs <bskeggs@redhat.com>
Reviewed-by: Lyude Paul <lyude@redhat.com>
Acked-by: Danilo Krummrich <me@dakr.org>
Signed-off-by: Lyude Paul <lyude@redhat.com>
---
 drivers/gpu/drm/nouveau/nvkm/subdev/devinit/tu102.c | 12 ++----------
 1 file changed, 2 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/devinit/tu102.c b/drivers/gpu/drm/nouveau/nvkm/subdev/devinit/tu102.c
index 81a1ad2c88a7e..40997ad1d101c 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/devinit/tu102.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/devinit/tu102.c
@@ -83,17 +83,9 @@ tu102_devinit_wait(struct nvkm_device *device)
 }
 
 int
-tu102_devinit_post(struct nvkm_devinit *base, bool post)
+tu102_devinit_post(struct nvkm_devinit *init, bool post)
 {
-	struct nv50_devinit *init = nv50_devinit(base);
-	int ret;
-
-	ret = tu102_devinit_wait(init->base.subdev.device);
-	if (ret)
-		return ret;
-
-	gm200_devinit_preos(init, post);
-	return 0;
+	return tu102_devinit_wait(init->subdev.device);
 }
 
 static const struct nvkm_devinit_func
-- 
2.41.0

