Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C75DC7A6E46
	for <lists+nouveau@lfdr.de>; Wed, 20 Sep 2023 00:07:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 02B7010E407;
	Tue, 19 Sep 2023 22:07:41 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 55F9E10E403
 for <nouveau@lists.freedesktop.org>; Tue, 19 Sep 2023 22:07:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1695161257;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=BCAfXJvvF84aMRX4wn8THN8Hfy1i9CyxygmzANiShPI=;
 b=M4txGixnPhc4rvoYvxw+SjM7KKoR8lIknY/manUI3Z7s3Z+69g22vM0Pn8p9j08xDO/ulP
 EUQBpVDq0E0/t7fO65jkBhEkQio9df4DbLELESEWt0FCrbE7IokfZXEX8DeMjhUHStgeip
 /vytEhdQ9jqV5C5E38fh+oZcjFp+5fg=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-528-EJw0itI4NE2WF2abZfbhXA-1; Tue, 19 Sep 2023 18:07:34 -0400
X-MC-Unique: EJw0itI4NE2WF2abZfbhXA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id DEA38800888;
 Tue, 19 Sep 2023 22:07:33 +0000 (UTC)
Received: from emerald.lyude.net (unknown [10.22.18.67])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8564440C2064;
 Tue, 19 Sep 2023 22:07:33 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: dri-devel@lists.freedesktop.org,
	nouveau@lists.freedesktop.org
Date: Tue, 19 Sep 2023 17:56:33 -0400
Message-ID: <20230919220442.202488-39-lyude@redhat.com>
In-Reply-To: <20230919220442.202488-1-lyude@redhat.com>
References: <20230919220442.202488-1-lyude@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
Subject: [Nouveau] [PATCH v3 38/44] drm/nouveau/disp/nv50-: skip
 DCB_OUTPUT_TV
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

We've never supported it.

Signed-off-by: Ben Skeggs <bskeggs@redhat.com>
Acked-by: Danilo Krummrich <me@dakr.org>
Signed-off-by: Lyude Paul <lyude@redhat.com>
---
 drivers/gpu/drm/nouveau/nvkm/engine/disp/nv50.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/disp/nv50.c b/drivers/gpu/drm/nouveau/nvkm/engine/disp/nv50.c
index 4be09ec4fd5c2..2d05e2f7e46b8 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/disp/nv50.c
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/disp/nv50.c
@@ -1656,7 +1656,6 @@ nv50_disp_oneinit(struct nvkm_disp *disp)
 
 		switch (dcbE.type) {
 		case DCB_OUTPUT_ANALOG:
-		case DCB_OUTPUT_TV:
 		case DCB_OUTPUT_TMDS:
 		case DCB_OUTPUT_LVDS:
 			ret = nvkm_outp_new(disp, i, &dcbE, &outp);
@@ -1664,6 +1663,7 @@ nv50_disp_oneinit(struct nvkm_disp *disp)
 		case DCB_OUTPUT_DP:
 			ret = nvkm_dp_new(disp, i, &dcbE, &outp);
 			break;
+		case DCB_OUTPUT_TV:
 		case DCB_OUTPUT_WFD:
 			/* No support for WFD yet. */
 			ret = -ENODEV;
-- 
2.41.0

