Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9918F6DB668
	for <lists+nouveau@lfdr.de>; Sat,  8 Apr 2023 00:22:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8EE6810EAF0;
	Fri,  7 Apr 2023 22:22:03 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 196BF10EAF0
 for <nouveau@lists.freedesktop.org>; Fri,  7 Apr 2023 22:22:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1680906120;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=tKz0tg31KcO0axIciN8Gt+6+AOxGyPzji0GIe3mVV4M=;
 b=Y6Lu//k+DtbXHvpN8/xNjFkvn8riHoxa184nfgXVk3BerxhtYZcQC2xmKDEl8wFVggU58R
 TA68vazU2xBY7W0VArQ7rVfFcQV6E/8uERgISEuYquSmpLmHA97WwfaHqNG6FO0qpRv16Z
 /25v5fm7+8dVEYaeb7/olxvztZJHEzY=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-376-fHMxFWKpO1Cyo62X0mtBmg-1; Fri, 07 Apr 2023 18:21:56 -0400
X-MC-Unique: fHMxFWKpO1Cyo62X0mtBmg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4201A8996E1;
 Fri,  7 Apr 2023 22:21:56 +0000 (UTC)
Received: from emerald.redhat.com (unknown [10.22.8.2])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C3BF951FF;
 Fri,  7 Apr 2023 22:21:55 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: dri-devel@lists.freedesktop.org,
	nouveau@lists.freedesktop.org
Date: Fri,  7 Apr 2023 18:21:31 -0400
Message-Id: <20230407222133.1425969-1-lyude@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
Subject: [Nouveau] [PATCH 1/2] drm/nouveau/nvkm/outp: Use WARN_ON() in
 conditionals in nvkm_outp_init_route()
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
 Daniel Vetter <daniel@ffwll.ch>, Dave Airlie <airlied@redhat.com>
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

Signed-off-by: Lyude Paul <lyude@redhat.com>
---
 drivers/gpu/drm/nouveau/nvkm/engine/disp/outp.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/disp/outp.c b/drivers/gpu/drm/nouveau/nvkm/engine/disp/outp.c
index 6094805fbd63..06b19883a06b 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/disp/outp.c
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/disp/outp.c
@@ -229,10 +229,8 @@ nvkm_outp_init_route(struct nvkm_outp *outp)
 		return;
 
 	ior = nvkm_ior_find(disp, type, -1);
-	if (!ior) {
-		WARN_ON(1);
+	if (WARN_ON(!ior))
 		return;
-	}
 
 	/* Determine the specific OR, if any, this device is attached to. */
 	if (ior->func->route.get) {
@@ -248,10 +246,8 @@ nvkm_outp_init_route(struct nvkm_outp *outp)
 	}
 
 	ior = nvkm_ior_find(disp, type, id);
-	if (!ior) {
-		WARN_ON(1);
+	if (WARN_ON(!ior))
 		return;
-	}
 
 	/* Determine if the OR is already configured for this device. */
 	ior->func->state(ior, &ior->arm);
-- 
2.39.2

