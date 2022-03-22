Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BE4B74E3EC0
	for <lists+nouveau@lfdr.de>; Tue, 22 Mar 2022 13:48:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C2E2510E55F;
	Tue, 22 Mar 2022 12:48:07 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1CF8910E2D5
 for <nouveau@lists.freedesktop.org>; Tue, 22 Mar 2022 12:48:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1647953284;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=u9yrNlkYpunaRytWgUY4ikU4zuFUDmjdz1rHYai2Yfg=;
 b=LrUbzTqA78uqUxQ8Tvk/oJ43s1iQsvKBHLk6tkVzhpZO2MXeqTfYuGoq4So4dOpgzvwznL
 az0PSlcgMdFM7/ZzrWxXD9BSqkCzuBib4rcr7P5/ZZK9WjsHsyAuZtqLgt3DZhEueWgZPj
 jGi7W9KvqO8x4iArEN4SvylwZ73/gI4=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-414-JjUGsb2dNuKeXCfW---IZw-1; Tue, 22 Mar 2022 08:48:03 -0400
X-MC-Unique: JjUGsb2dNuKeXCfW---IZw-1
Received: by mail-wm1-f69.google.com with SMTP id
 r9-20020a1c4409000000b0038c15a1ed8cso1182946wma.7
 for <nouveau@lists.freedesktop.org>; Tue, 22 Mar 2022 05:48:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=u9yrNlkYpunaRytWgUY4ikU4zuFUDmjdz1rHYai2Yfg=;
 b=rlg9j1H2OGiyfR+SyeiGOwJZHP/JNt80OPjA15Kpf8nzJ4XJJDTCfzSsY6RSwE2+K1
 uWs7Lw01Nj41czn6Sv9yT8zGHfL/Nbresfk8BcRbMPzsNNLAyPHEvE8SGaIf3PEFdccq
 DT2dNthzz/qexPOvW1nem4NwnbybXKyAA/hlnRzYK/n6UuLSq/bqg9owgQDB6cwGrq/K
 SzEIOIKq39i9W93RI8DdEINSqkDvCS7fiAxOcThTlHS4bO8jGxZOyxxMrZ5gV4294HI0
 mLBZSWj4vcL7ZLH6t7xOOFux1a2DyGJJvS4Ujkd50GVfmAB6zqlbBEcaFLbvO0o7P0mM
 fSzg==
X-Gm-Message-State: AOAM531XpvQYtih+yWZmTscOFwHUyXhkTeIGUtWN4LZtYLKs+4zXH9Xn
 fIWbwgpWS9M2rR5jD6C/G3HqPq/mZkZ14fIFQ4WaJYU1r1Ia1LcTh5xWPlIoUHXF/3AQgki073T
 OsxjTtDPv+kAo3iIVgKRUgukwvg==
X-Received: by 2002:a05:600c:5021:b0:38c:70c0:80e9 with SMTP id
 n33-20020a05600c502100b0038c70c080e9mr3610560wmr.91.1647953282574; 
 Tue, 22 Mar 2022 05:48:02 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyb73Jj3kArrdOmr4xNJ2g6A2tODfvNxCiROA57ukRjloP9coQ4ogSvUIco5W02naEshguG4A==
X-Received: by 2002:a05:600c:5021:b0:38c:70c0:80e9 with SMTP id
 n33-20020a05600c502100b0038c70c080e9mr3610550wmr.91.1647953282389; 
 Tue, 22 Mar 2022 05:48:02 -0700 (PDT)
Received: from kherbst.pingu.com ([31.16.187.72])
 by smtp.gmail.com with ESMTPSA id
 s17-20020adfdb11000000b001f02d5fea43sm16823291wri.98.2022.03.22.05.48.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Mar 2022 05:48:01 -0700 (PDT)
From: Karol Herbst <kherbst@redhat.com>
To: linux-kernel@vger.kernel.org
Date: Tue, 22 Mar 2022 13:48:00 +0100
Message-Id: <20220322124800.2605463-1-kherbst@redhat.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kherbst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Subject: [Nouveau] [PATCH] drm/nouveau/pmu: Add missing callbacks for Tegra
 devices
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
 stable@vger.kernel.org, Ben Skeggs <bskeggs@redhat.com>
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

Fixes a crash booting on those platforms with nouveau.

Fixes: 4cdd2450bf73 ("drm/nouveau/pmu/gm200-: use alternate falcon reset sequence")
Cc: Ben Skeggs <bskeggs@redhat.com>
Cc: Karol Herbst <kherbst@redhat.com>
Cc: dri-devel@lists.freedesktop.org
Cc: nouveau@lists.freedesktop.org
Cc: <stable@vger.kernel.org> # v5.17+
Signed-off-by: Karol Herbst <kherbst@redhat.com>
---
 drivers/gpu/drm/nouveau/nvkm/subdev/pmu/gm20b.c | 1 +
 drivers/gpu/drm/nouveau/nvkm/subdev/pmu/gp102.c | 2 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/pmu/gp10b.c | 1 +
 drivers/gpu/drm/nouveau/nvkm/subdev/pmu/priv.h  | 1 +
 4 files changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/pmu/gm20b.c b/drivers/gpu/drm/nouveau/nvkm/subdev/pmu/gm20b.c
index e1772211b0a4..612310d5d481 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/pmu/gm20b.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/pmu/gm20b.c
@@ -216,6 +216,7 @@ gm20b_pmu = {
 	.intr = gt215_pmu_intr,
 	.recv = gm20b_pmu_recv,
 	.initmsg = gm20b_pmu_initmsg,
+	.reset = gf100_pmu_reset,
 };
 
 #if IS_ENABLED(CONFIG_ARCH_TEGRA_210_SOC)
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/pmu/gp102.c b/drivers/gpu/drm/nouveau/nvkm/subdev/pmu/gp102.c
index 6bf7fc1bd1e3..1a6f9c3af5ec 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/pmu/gp102.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/pmu/gp102.c
@@ -23,7 +23,7 @@
  */
 #include "priv.h"
 
-static void
+void
 gp102_pmu_reset(struct nvkm_pmu *pmu)
 {
 	struct nvkm_device *device = pmu->subdev.device;
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/pmu/gp10b.c b/drivers/gpu/drm/nouveau/nvkm/subdev/pmu/gp10b.c
index ba1583bb618b..94cfb1791af6 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/pmu/gp10b.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/pmu/gp10b.c
@@ -83,6 +83,7 @@ gp10b_pmu = {
 	.intr = gt215_pmu_intr,
 	.recv = gm20b_pmu_recv,
 	.initmsg = gm20b_pmu_initmsg,
+	.reset = gp102_pmu_reset,
 };
 
 #if IS_ENABLED(CONFIG_ARCH_TEGRA_210_SOC)
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/pmu/priv.h b/drivers/gpu/drm/nouveau/nvkm/subdev/pmu/priv.h
index bcaade758ff7..21abf31f4442 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/pmu/priv.h
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/pmu/priv.h
@@ -41,6 +41,7 @@ int gt215_pmu_send(struct nvkm_pmu *, u32[2], u32, u32, u32, u32);
 
 bool gf100_pmu_enabled(struct nvkm_pmu *);
 void gf100_pmu_reset(struct nvkm_pmu *);
+void gp102_pmu_reset(struct nvkm_pmu *pmu);
 
 void gk110_pmu_pgob(struct nvkm_pmu *, bool);
 
-- 
2.35.1

