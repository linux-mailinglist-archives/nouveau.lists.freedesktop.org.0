Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CE7B743F82
	for <lists+nouveau@lfdr.de>; Fri, 30 Jun 2023 18:14:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8277510E4AE;
	Fri, 30 Jun 2023 16:14:37 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D3C510E4AE
 for <nouveau@lists.freedesktop.org>; Fri, 30 Jun 2023 16:14:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1688141675;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=zDzqJbvPB3+ncS0JVgMogsHg0szcNxLVo0nvRHNMeoA=;
 b=FfjvqCpa9rhz9u6QUjvQlRRIOdL3OSB/mSotUW9eVOcY3+1LQQpdmnlFta9YAL3Ity/783
 VWZP1EpwgovA9pWMcpuhbJaqQAYYsVtwkwKatnPWkNjENgr8Z4AbHtN+5RPz9g03OfFbwl
 DFuhPtGCKXpbIhTQikGjdd0oNM93mMY=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-625-us8IQUhIMxuSHXPpJ4XgQg-1; Fri, 30 Jun 2023 12:14:34 -0400
X-MC-Unique: us8IQUhIMxuSHXPpJ4XgQg-1
Received: by mail-wm1-f69.google.com with SMTP id
 5b1f17b1804b1-3fa71e19e32so4095595e9.1
 for <nouveau@lists.freedesktop.org>; Fri, 30 Jun 2023 09:14:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688141673; x=1690733673;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=zDzqJbvPB3+ncS0JVgMogsHg0szcNxLVo0nvRHNMeoA=;
 b=l9ybJMQe8d5aJZsJdqXRSUTlQybWo8Y2dHVvtXG+qaRuyLpRAqHfuo86pQ5OXZgTSd
 sDdOhEMKrc+uTPeauafuHCPZeJUUSIaUPuI/NAlQWKvjMK20gar6MKyWiWvCE5ORKyOq
 PAN3iWQieVD8vJ419OVOftd4FieyY/CyeZYPXy0jrvBU/Wsv+8SA4Fn09xIdAmVo1sRL
 SU4mDxL5UanJjeZktIzhYJhqtk/GDZkmWUl9kTwHcs12YJKgdyclGF9rAEZRmDfV73wQ
 FqPzw64YO/8Gt+47zaOfxoUdQh4YR/yS1iFxgPZ5dXtiqHddE6/2M7jGFN76f4sRXQhC
 9c0g==
X-Gm-Message-State: AC+VfDwQnZZga6reoZhVNnFJZyhZ+4AStwwICEjOkPirhzeYirTGxMCk
 qkUeSDj08Vx/LOk30E4QFUaVHU5u0m7BqNJj3ljB54CeIrQrDFfgeUCl7viYkCOv9MNVApsO0kf
 EbwKoRRNcrq2gyInaGLrrkBeWng==
X-Received: by 2002:a05:600c:1d9b:b0:3fa:9767:bb0 with SMTP id
 p27-20020a05600c1d9b00b003fa97670bb0mr2822019wms.0.1688141673014; 
 Fri, 30 Jun 2023 09:14:33 -0700 (PDT)
X-Google-Smtp-Source: APBJJlHboVEA9uwXPyVU1Q8VvIf0AXphxjPZ6dsb08b1Lb3IKDCnNo6XzcKAR3OcUmRaH9Lq3IFlhA==
X-Received: by 2002:a5d:4a91:0:b0:313:ed10:7f53 with SMTP id
 o17-20020a5d4a91000000b00313ed107f53mr2727668wrq.6.1688141208961; 
 Fri, 30 Jun 2023 09:06:48 -0700 (PDT)
Received: from kherbst.pingu (ip5f5a301e.dynamic.kabel-deutschland.de.
 [95.90.48.30]) by smtp.gmail.com with ESMTPSA id
 cw8-20020a056000090800b00311d8c2561bsm18551755wrb.60.2023.06.30.09.06.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Jun 2023 09:06:47 -0700 (PDT)
From: Karol Herbst <kherbst@redhat.com>
To: linux-kernel@vger.kernel.org
Date: Fri, 30 Jun 2023 18:06:45 +0200
Message-ID: <20230630160645.3984596-1-kherbst@redhat.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true
Subject: [Nouveau] [PATCH] drm/nouveau/disp/g94: enable HDMI
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

Cc: Ben Skeggs <bskeggs@redhat.com>
Cc: Lyude Paul <lyude@redhat.com>
Fixes: f530bc60a30b ("drm/nouveau/disp: move HDMI config into acquire + infoframe methods")
Signed-off-by: Karol Herbst <kherbst@redhat.com>
---
 drivers/gpu/drm/nouveau/nvkm/engine/disp/g94.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/disp/g94.c b/drivers/gpu/drm/nouveau/nvkm/engine/disp/g94.c
index a4853c4e5ee3..67ef889a0c5f 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/disp/g94.c
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/disp/g94.c
@@ -295,6 +295,7 @@ g94_sor = {
 	.clock = nv50_sor_clock,
 	.war_2 = g94_sor_war_2,
 	.war_3 = g94_sor_war_3,
+	.hdmi = &g84_sor_hdmi,
 	.dp = &g94_sor_dp,
 };
 
-- 
2.41.0

