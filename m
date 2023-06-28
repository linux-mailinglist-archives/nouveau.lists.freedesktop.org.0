Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DC367741AAD
	for <lists+nouveau@lfdr.de>; Wed, 28 Jun 2023 23:23:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7DC9710E184;
	Wed, 28 Jun 2023 21:22:56 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C81310E395
 for <nouveau@lists.freedesktop.org>; Wed, 28 Jun 2023 21:22:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1687987373;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=35yLjXwmK+JFwMD6kxYKyYPiJnk3z5/P0tWTo/VOF6w=;
 b=LMsWvE6TuaVskBWM73K6Fb3+d0xHrQXcoCrUMxpM+npyP6pmYsveD5ARxVQ2W4BhwPikBz
 lsiPSZEBrKMneOH4YB2NxDXrfX80xA9EolEip+yz4IOA34r4WAtU4boWz15AGXluuzXQbM
 6eKmAQBDABBDQUSaHjrxmGJ9v2IDBm4=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-540-GftIO6wjNOSSDRcpS2U2KA-1; Wed, 28 Jun 2023 17:22:51 -0400
X-MC-Unique: GftIO6wjNOSSDRcpS2U2KA-1
Received: by mail-wr1-f70.google.com with SMTP id
 ffacd0b85a97d-313ecc94e23so680f8f.0
 for <nouveau@lists.freedesktop.org>; Wed, 28 Jun 2023 14:22:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687987370; x=1690579370;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=35yLjXwmK+JFwMD6kxYKyYPiJnk3z5/P0tWTo/VOF6w=;
 b=CGd90U+l/YAfu67gRMslgBm3JsipgTBVm9Tc8awJ2FC3WHLkhunlwWQJMhaaH4OSX2
 TEhvxbZFZ9P6XLh7Um2wNkK+z1g1hQW8iQmdTBWGNblFMr5D7GbYfFCazZeGVZZsGo/5
 J3Q+WO75fYNwJuW3LIcKJR7v9uL3AHhMZEsoVGZBGOa9V7IlEeL90FwxeqOxsxi2qvmi
 XQrWDiy35AUyb5Z5cxUAddn7fn2QOAH8eAuSqaIvpsZHtVHQP96NWcTFjCvAi8Ncu+Dr
 vuHbsUZIyUx8z9AOx3vVZ006Hccn1Zn/fS3CqDpX9fd2StmmkmmmzPl/wwl0b6bmh+NS
 fFfw==
X-Gm-Message-State: AC+VfDzMTbdv8nIiLbC3T85hT+shSGWVqOWeHxHBW/N+uqjiCxFzqSYV
 jJaArx2BLVwhwrborWaRYzGEALySFlH+AkVMKuZIFv2ydJEPj6dFfB//4LWsbwUaP+7laNSxfjD
 P+lYf/8M2+1iIpNnkINMDcJUBOg==
X-Received: by 2002:a5d:688c:0:b0:313:e8fb:b00f with SMTP id
 h12-20020a5d688c000000b00313e8fbb00fmr12064950wru.6.1687987370472; 
 Wed, 28 Jun 2023 14:22:50 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ4etKwVYGUIIKgW4+xNP19noBx/4crXKmYa7hOdvnL0JSt90wwvxFWoR/KRdnfuAOGnZNBW/g==
X-Received: by 2002:a5d:688c:0:b0:313:e8fb:b00f with SMTP id
 h12-20020a5d688c000000b00313e8fbb00fmr12064938wru.6.1687987370225; 
 Wed, 28 Jun 2023 14:22:50 -0700 (PDT)
Received: from kherbst.pingu ([95.90.48.30]) by smtp.gmail.com with ESMTPSA id
 r3-20020adfda43000000b0030ae3a6be4asm14294323wrl.72.2023.06.28.14.22.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Jun 2023 14:22:49 -0700 (PDT)
From: Karol Herbst <kherbst@redhat.com>
To: linux-kernel@vger.kernel.org
Date: Wed, 28 Jun 2023 23:22:46 +0200
Message-ID: <20230628212248.3798605-1-kherbst@redhat.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true
Subject: [Nouveau] [PATCH 1/3] drm/nouveau/disp: fix HDMI on gt215+
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
Cc: nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Ben Skeggs <bskeggs@redhat.com>
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

Cc: Ben Skeggs <bskeggs@redhat.com>
Cc: Lyude Paul <lyude@redhat.com>
Fixes: f530bc60a30b ("drm/nouveau/disp: move HDMI config into acquire + infoframe methods")
Signed-off-by: Karol Herbst <kherbst@redhat.com>
---
 drivers/gpu/drm/nouveau/nvkm/engine/disp/gt215.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/disp/gt215.c b/drivers/gpu/drm/nouveau/nvkm/engine/disp/gt215.c
index a2c7c6f83dcd..506ffbe7b842 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/disp/gt215.c
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/disp/gt215.c
@@ -125,7 +125,7 @@ gt215_sor_hdmi_infoframe_avi(struct nvkm_ior *ior, int head, void *data, u32 siz
 	pack_hdmi_infoframe(&avi, data, size);
 
 	nvkm_mask(device, 0x61c520 + soff, 0x00000001, 0x00000000);
-	if (size)
+	if (!size)
 		return;
 
 	nvkm_wr32(device, 0x61c528 + soff, avi.header);
-- 
2.41.0

