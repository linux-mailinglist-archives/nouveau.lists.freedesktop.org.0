Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AE7D2326EF
	for <lists+nouveau@lfdr.de>; Wed, 29 Jul 2020 23:37:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6141C6E7D3;
	Wed, 29 Jul 2020 21:37:24 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 062336E422
 for <nouveau@lists.freedesktop.org>; Wed, 29 Jul 2020 21:37:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1596058640;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PrUnfRcbB8TeX4xq00PXZWnFqDspEOmAntW7u0EIgTs=;
 b=ZKquxcVLPH1wjlFoTz8YEJWa7sllphiKU2DnuFlFlh64c38B0sEzjcw/nUYxgJlN64LnJs
 CIO3ur3am+vkR3Vj/T26dI5kBFZeH0aQYFjni7EOJ+V2PVFNoJSq3RiAPv2+hhmgo2v6ix
 TNPcXharcGj81xSMLqnUejipMJnvTv0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-377-czHsmebpMZmpc-6H9BMHLA-1; Wed, 29 Jul 2020 17:37:18 -0400
X-MC-Unique: czHsmebpMZmpc-6H9BMHLA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0AE0B801E6A;
 Wed, 29 Jul 2020 21:37:17 +0000 (UTC)
Received: from Ruby.redhat.com (ovpn-119-146.rdu2.redhat.com [10.10.119.146])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 046D161176;
 Wed, 29 Jul 2020 21:37:15 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: nouveau@lists.freedesktop.org
Date: Wed, 29 Jul 2020 17:37:00 -0400
Message-Id: <20200729213703.119137-7-lyude@redhat.com>
In-Reply-To: <20200729213703.119137-1-lyude@redhat.com>
References: <20200729213703.119137-1-lyude@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Subject: [Nouveau] [PATCH 6/9] drm/nouveau/kms: Use
 pm_runtime_put_autosuspend() in hpd_work
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
Cc: David Airlie <airlied@linux.ie>,
 "open list:DRM DRIVER FOR NVIDIA GEFORCE/QUADRO GPUS"
 <dri-devel@lists.freedesktop.org>, Ben Skeggs <bskeggs@redhat.com>,
 Daniel Vetter <daniel@ffwll.ch>, open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

Again, we don't have any need to suspend the device synchronously here,
and doing so could in theory lead to a deadlock (although it's unlikely
since we've called pm_runtime_mark_last_busy() before-hand).

Signed-off-by: Lyude Paul <lyude@redhat.com>
---
 drivers/gpu/drm/nouveau/nouveau_display.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_display.c b/drivers/gpu/drm/nouveau/nouveau_display.c
index 63c58f12458c9..cdc5a2200f95e 100644
--- a/drivers/gpu/drm/nouveau/nouveau_display.c
+++ b/drivers/gpu/drm/nouveau/nouveau_display.c
@@ -444,7 +444,7 @@ nouveau_display_hpd_work(struct work_struct *work)
 	drm_helper_hpd_irq_event(drm->dev);
 
 	pm_runtime_mark_last_busy(drm->dev->dev);
-	pm_runtime_put_sync(drm->dev->dev);
+	pm_runtime_put_autosuspend(drm->dev->dev);
 }
 
 #ifdef CONFIG_ACPI
-- 
2.26.2

_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
