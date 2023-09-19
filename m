Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DAB797A6DE7
	for <lists+nouveau@lfdr.de>; Wed, 20 Sep 2023 00:05:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1ABC810E298;
	Tue, 19 Sep 2023 22:05:17 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 09C6F10E294
 for <nouveau@lists.freedesktop.org>; Tue, 19 Sep 2023 22:05:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1695161113;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8u3cLqlQIYdOREW60hMS4Co9cQn7jWijgctfO2tY6gg=;
 b=JeBaPAK573ZYWR+jM9OmA8VKH6+6IsXmjB380CEZkJSUvH/yVaHHu74QvtIqQ44taUqO9Y
 5cBT2aqjrA3B02aOcYfZ8bqVokNKCOXqelmt7LGMlblja2vrhqrFPsEckEhggkzxaosDe/
 sHIbvReFedmZUJsBb+KhxxuaJSw2piw=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-692-OXCJCIifNvOpgWtW13gbng-1; Tue, 19 Sep 2023 18:05:09 -0400
X-MC-Unique: OXCJCIifNvOpgWtW13gbng-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9F8C73C02532;
 Tue, 19 Sep 2023 22:05:08 +0000 (UTC)
Received: from emerald.lyude.net (unknown [10.22.18.67])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5360240C2064;
 Tue, 19 Sep 2023 22:05:07 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: dri-devel@lists.freedesktop.org,
	nouveau@lists.freedesktop.org
Date: Tue, 19 Sep 2023 17:55:58 -0400
Message-ID: <20230919220442.202488-4-lyude@redhat.com>
In-Reply-To: <20230919220442.202488-1-lyude@redhat.com>
References: <20230919220442.202488-1-lyude@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
Subject: [Nouveau] [PATCH v3 03/44] drm/nouveau/gr/gf100-: lose contents of
 global ctxbufs across suspend
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

Some of these buffers are quite large, and there's no need to preserve
them across suspend.

Mark the contents as lost to speedup suspend/resume.

Signed-off-by: Ben Skeggs <bskeggs@redhat.com>
Reviewed-by: Lyude Paul <lyude@redhat.com>
Acked-by: Danilo Krummrich <me@dakr.org>
Signed-off-by: Lyude Paul <lyude@redhat.com>
---
 drivers/gpu/drm/nouveau/nvkm/engine/gr/gf100.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/gr/gf100.c b/drivers/gpu/drm/nouveau/nvkm/engine/gr/gf100.c
index 3648868bb9fc5..c494a1ff2d572 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/gr/gf100.c
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/gr/gf100.c
@@ -2032,18 +2032,18 @@ gf100_gr_oneinit(struct nvkm_gr *base)
 	}
 
 	/* Allocate global context buffers. */
-	ret = nvkm_memory_new(device, NVKM_MEM_TARGET_INST, gr->func->grctx->pagepool_size,
-			      0x100, false, &gr->pagepool);
+	ret = nvkm_memory_new(device, NVKM_MEM_TARGET_INST_SR_LOST,
+			      gr->func->grctx->pagepool_size, 0x100, false, &gr->pagepool);
 	if (ret)
 		return ret;
 
-	ret = nvkm_memory_new(device, NVKM_MEM_TARGET_INST, gr->func->grctx->bundle_size,
+	ret = nvkm_memory_new(device, NVKM_MEM_TARGET_INST_SR_LOST, gr->func->grctx->bundle_size,
 			      0x100, false, &gr->bundle_cb);
 	if (ret)
 		return ret;
 
-	ret = nvkm_memory_new(device, NVKM_MEM_TARGET_INST, gr->func->grctx->attrib_cb_size(gr),
-			      0x1000, false, &gr->attrib_cb);
+	ret = nvkm_memory_new(device, NVKM_MEM_TARGET_INST_SR_LOST,
+			      gr->func->grctx->attrib_cb_size(gr), 0x1000, false, &gr->attrib_cb);
 	if (ret)
 		return ret;
 
-- 
2.41.0

