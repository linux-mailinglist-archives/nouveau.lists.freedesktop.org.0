Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D76B9702CFC
	for <lists+nouveau@lfdr.de>; Mon, 15 May 2023 14:44:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5070810E1B6;
	Mon, 15 May 2023 12:44:47 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5921E10E1B6
 for <nouveau@lists.freedesktop.org>; Mon, 15 May 2023 12:44:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1684154684;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=cZmYTRAn7NU2pb19zTAYR+mb+ybNs5nlZD8A2O1lVGg=;
 b=I3hZwCl/ur4DITE2CwjtGBehhwbxgPjUjb/tLbYi/WTVHNQfozx4p6tlY9va/kF6+MAUC1
 f8euj6FywH7ODXyPN2U9ty0KQ7Ow+Aay0jMgtmEBbTNm10bY8mIGUAHktvVT5XHR43F5qw
 WmqfN1NbqHoLkJ4co5Q8pWHPc/zNta4=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-9-6AuHT8sQOCOQJdUpYFOuCw-1; Mon, 15 May 2023 08:44:43 -0400
X-MC-Unique: 6AuHT8sQOCOQJdUpYFOuCw-1
Received: by mail-wm1-f69.google.com with SMTP id
 5b1f17b1804b1-3f08900caadso16122435e9.0
 for <nouveau@lists.freedesktop.org>; Mon, 15 May 2023 05:44:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684154682; x=1686746682;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=cZmYTRAn7NU2pb19zTAYR+mb+ybNs5nlZD8A2O1lVGg=;
 b=kHTqN0UPIfNLLnZLnDClcjTPue2IypQ0YuPoj0YkZL7a2tshE2eqN7RZy5t/1BuKto
 5eEBwy4YG84tyQ2HCFwJJa3WNlefepFRQiezgnYcwNSJrtcq+qm7r41vlRzgoXIfJ12n
 js5M0QRDRhLfi4rbJlxU3CJzXajR3pDPP1bSKn3mbk6aXMbVZE6yQqpmQGD5Bj640clE
 2RlgO4S5zVaPOr59q4iwc3gcS0XxH1PMBFEjri9LWTIzcdnXtySxw/lPX4qa7OC3EWcR
 8J64hmZFlyXZtLtkq38nscbm0hF9dSTNHi0XbfKeHztRI21ezV4X990dvCeOnuTb1OQ1
 AyPw==
X-Gm-Message-State: AC+VfDx6yzcT86gL4DDSz9mDN+7gYSSaycMGhwS1y5laq7PWA4c1ZACX
 nla3XsCNvmtu+rLtypmRPsx/5hRPAtwLfxD2xG/0M889/F0ic/yvT8ErWluuAE3HQCTLV/ihRl4
 V/O50SamlgW+30dgQC39sHiIxXg==
X-Received: by 2002:a05:600c:35cf:b0:3f4:f204:4968 with SMTP id
 r15-20020a05600c35cf00b003f4f2044968mr8731451wmq.1.1684154682178; 
 Mon, 15 May 2023 05:44:42 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ76ly2s9BWGl+80vve46j05skeM6iSlOiqEvBV8GMj96bvOhN4iMHwcgu7nH9/0EeHx5tw9DQ==
X-Received: by 2002:a05:600c:35cf:b0:3f4:f204:4968 with SMTP id
 r15-20020a05600c35cf00b003f4f2044968mr8731434wmq.1.1684154681806; 
 Mon, 15 May 2023 05:44:41 -0700 (PDT)
Received: from kherbst.pingu (ip1f1032e8.dynamic.kabel-deutschland.de.
 [31.16.50.232]) by smtp.gmail.com with ESMTPSA id
 t25-20020a1c7719000000b003f43f82001asm17024977wmi.31.2023.05.15.05.44.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 May 2023 05:44:41 -0700 (PDT)
From: Karol Herbst <kherbst@redhat.com>
To: linux-kernel@vger.kernel.org
Date: Mon, 15 May 2023 14:44:39 +0200
Message-Id: <20230515124439.257585-1-kherbst@redhat.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true
Subject: [Nouveau] [PATCH] drm/nouveau: bring back blit subchannel for pre
 nv50 GPUs
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
Cc: nouveau@lists.freedesktop.org, Ben Skeggs <bskeggs@redhat.com>,
 dri-devel@lists.freedesktop.org
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

1ba6113a90a0 removed a lot of the kernel GPU channel, but method 0x128
was important as otherwise the GPU spams us with `CACHE_ERROR` messages.

We use the blit subchannel inside our vblank handling, so we should keep
at least this part.

Closes: https://gitlab.freedesktop.org/drm/nouveau/-/issues/201
Fixes: 4a16dd9d18a0 ("drm/nouveau/kms: switch to drm fbdev helpers")
Signed-off-by: Karol Herbst <kherbst@redhat.com>
---
 drivers/gpu/drm/nouveau/nouveau_chan.c |  1 +
 drivers/gpu/drm/nouveau/nouveau_chan.h |  1 +
 drivers/gpu/drm/nouveau/nouveau_drm.c  | 19 ++++++++++++++++---
 3 files changed, 18 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_chan.c b/drivers/gpu/drm/nouveau/nouveau_chan.c
index e648ecd0c1a0..3dfbc374478e 100644
--- a/drivers/gpu/drm/nouveau/nouveau_chan.c
+++ b/drivers/gpu/drm/nouveau/nouveau_chan.c
@@ -90,6 +90,7 @@ nouveau_channel_del(struct nouveau_channel **pchan)
 		if (cli)
 			nouveau_svmm_part(chan->vmm->svmm, chan->inst);
 
+		nvif_object_dtor(&chan->blit);
 		nvif_object_dtor(&chan->nvsw);
 		nvif_object_dtor(&chan->gart);
 		nvif_object_dtor(&chan->vram);
diff --git a/drivers/gpu/drm/nouveau/nouveau_chan.h b/drivers/gpu/drm/nouveau/nouveau_chan.h
index e06a8ffed31a..bad7466bd0d5 100644
--- a/drivers/gpu/drm/nouveau/nouveau_chan.h
+++ b/drivers/gpu/drm/nouveau/nouveau_chan.h
@@ -53,6 +53,7 @@ struct nouveau_channel {
 	u32 user_put;
 
 	struct nvif_object user;
+	struct nvif_object blit;
 
 	struct nvif_event kill;
 	atomic_t killed;
diff --git a/drivers/gpu/drm/nouveau/nouveau_drm.c b/drivers/gpu/drm/nouveau/nouveau_drm.c
index cc7c5b4a05fd..59e040a93a41 100644
--- a/drivers/gpu/drm/nouveau/nouveau_drm.c
+++ b/drivers/gpu/drm/nouveau/nouveau_drm.c
@@ -369,15 +369,28 @@ nouveau_accel_gr_init(struct nouveau_drm *drm)
 		ret = nvif_object_ctor(&drm->channel->user, "drmNvsw",
 				       NVDRM_NVSW, nouveau_abi16_swclass(drm),
 				       NULL, 0, &drm->channel->nvsw);
+
+		if (ret == 0) {
+			u32 blit_class = device->info.chipset >= 0x11 ? 0x009f : 0x005f;
+			ret = nvif_object_ctor(&drm->channel->user, "drmBlit",
+					       0x005f, blit_class,
+					       NULL, 0, &drm->channel->blit);
+		}
+
 		if (ret == 0) {
 			struct nvif_push *push = drm->channel->chan.push;
-			ret = PUSH_WAIT(push, 2);
-			if (ret == 0)
+			ret = PUSH_WAIT(push, 8);
+			if (ret == 0) {
+				PUSH_NVSQ(push, NV05F, 0x0000, drm->channel->blit.handle);
+				PUSH_NVSQ(push, NV09F, 0x0120, 0,
+						       0x0124, 1,
+						       0x0128, 2);
 				PUSH_NVSQ(push, NV_SW, 0x0000, drm->channel->nvsw.handle);
+			}
 		}
 
 		if (ret) {
-			NV_ERROR(drm, "failed to allocate sw class, %d\n", ret);
+			NV_ERROR(drm, "failed to allocate sw or blit class, %d\n", ret);
 			nouveau_accel_gr_fini(drm);
 			return;
 		}
-- 
2.40.1

