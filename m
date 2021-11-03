Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F081E443ABC
	for <lists+nouveau@lfdr.de>; Wed,  3 Nov 2021 02:11:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0435A6E959;
	Wed,  3 Nov 2021 01:11:25 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-pf1-x42e.google.com (mail-pf1-x42e.google.com
 [IPv6:2607:f8b0:4864:20::42e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E403F6E959
 for <nouveau@lists.freedesktop.org>; Wed,  3 Nov 2021 01:11:23 +0000 (UTC)
Received: by mail-pf1-x42e.google.com with SMTP id 127so706992pfu.1
 for <nouveau@lists.freedesktop.org>; Tue, 02 Nov 2021 18:11:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=dNH8eciGojVjY46fZCeKUIUNeaCP1ehIOQAcJy8VsG8=;
 b=hJbAgQ31UAE0p2/35E6pxu8qXHCQ5zMQXec/7du2V5Mb3OsWsIg6Lt0rCUjlxOU58t
 8o7UTdVZPfhdOU4OPWr/ehvpa0CijXGSsr3m2tSrdWy9jI0tXjOmUZbFtPwCSfqfJK52
 Gsj1DTodrc2IsJkxOr6whdQXmMSDj470DUbEa9C2xVTWoFNHNW2DEAI+IlFLuGA8uw0t
 Wms/qyfiADIncyhALK/ztjzPG7hqcexTGbN2M3k9DnCTWXjP51ZhlpK6J9Io9tfpTGuf
 Mn0iAyUj3/GlHTyRl8nwiCJcQ1GtXx3fJTlmf+QZOvqNOTdV1MvW0eE35/8jqThGIfyB
 6Wmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=dNH8eciGojVjY46fZCeKUIUNeaCP1ehIOQAcJy8VsG8=;
 b=Lj45BOHOc/EGOMH7e7kgJ4RC4VG5aYTmBXXkipCFrCQWk42Ys1SDd0t7QjyaMMSWDU
 qCvSkO9Xjb+KfGagdSZtqyD7E9MvZy95TtTRS5w4C9E3R5W6s3GtSwl4N7Q8HhgGXbAs
 HifW51biV58JdC8bhuatB8gzAnZGU91Z748suk8PXstNuUO06FokQnb1ol/2rreRJ8c9
 nc0hxC422LGu8AHhx/OllI5mz33yMsNW/QtovTzAUzECmCUAOh3Llz9KliJ9w1W44dpo
 nNo2uAiYrouoxKtXZsWcl8vsrrX9ErS3W3yNB3VRiZuI2RlHWuYYNQ8D/qR6vdbQ/tO9
 3MQw==
X-Gm-Message-State: AOAM531LWgGm3tYmoMOFUnCbC8/Z9m8OScjgMpgP1gEj+Cs+Oo5+4Ss1
 iaRjNkO+GBOtERaciSk9AtJmKdzwymY=
X-Google-Smtp-Source: ABdhPJzOip5xZ5w1wdTzyZzhBuEkUqkmW+pVe0ZIcV6zYZHrDSp+CyGFmtK0D4m9S5aCkwDwwDf4Ug==
X-Received: by 2002:a05:6a00:2492:b0:48c:3150:1117 with SMTP id
 c18-20020a056a00249200b0048c31501117mr2689988pfv.55.1635901882968; 
 Tue, 02 Nov 2021 18:11:22 -0700 (PDT)
Received: from localhost.localdomain (52.55.96.58.static.exetel.com.au.
 [58.96.55.52])
 by smtp.gmail.com with ESMTPSA id w12sm3782564pjq.2.2021.11.02.18.11.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Nov 2021 18:11:22 -0700 (PDT)
From: Ben Skeggs <skeggsb@gmail.com>
To: nouveau@lists.freedesktop.org
Date: Wed,  3 Nov 2021 11:10:57 +1000
Message-Id: <20211103011057.15344-1-skeggsb@gmail.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Nouveau] [PATCH] ce/gf100: fix incorrect CE0 address calculation
 on some GPUs
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
Cc: Ben Skeggs <bskeggs@redhat.com>, stable@vger.kernel.org
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

From: Ben Skeggs <bskeggs@redhat.com>

The code which constructs the modules for each engine present on the GPU
passes -1 for 'instance' on non-instanced engines, which affects how the
name for a sub-device is generated.  This is then stored as 'instance 0'
in nvkm_subdev.inst, so code can potentially be shared with earlier GPUs
that only had a single instance of an engine.

However, GF100's CE constructor uses this value to calculate the address
of its falcon before it's translated, resulting in CE0 getting the wrong
address.

This slightly modifies the approach, always passing a valid instance for
engines that *can* have multiple copies, and having the code for earlier
GPUs explicitly ask for non-instanced name generation.

Bug: https://gitlab.freedesktop.org/drm/nouveau/-/issues/91

Fixes: 50551b15c760 ("drm/nouveau/ce: switch to instanced constructor")
Cc: <stable@vger.kernel.org> # v5.12+
Signed-off-by: Ben Skeggs <bskeggs@redhat.com>
---
 drivers/gpu/drm/nouveau/nvkm/engine/ce/gt215.c    | 2 +-
 drivers/gpu/drm/nouveau/nvkm/engine/device/base.c | 3 +--
 2 files changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/ce/gt215.c b/drivers/gpu/drm/nouveau/nvkm/engine/ce/gt215.c
index 704df0f2d1f1..09a112af2f89 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/ce/gt215.c
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/ce/gt215.c
@@ -78,6 +78,6 @@ int
 gt215_ce_new(struct nvkm_device *device, enum nvkm_subdev_type type, int inst,
 	     struct nvkm_engine **pengine)
 {
-	return nvkm_falcon_new_(&gt215_ce, device, type, inst,
+	return nvkm_falcon_new_(&gt215_ce, device, type, -1,
 				(device->chipset != 0xaf), 0x104000, pengine);
 }
diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/device/base.c b/drivers/gpu/drm/nouveau/nvkm/engine/device/base.c
index ca75c5f6ecaf..b51d690f375f 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/device/base.c
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/device/base.c
@@ -3147,8 +3147,7 @@ nvkm_device_ctor(const struct nvkm_device_func *func,
 	WARN_ON(device->chip->ptr.inst & ~((1 << ARRAY_SIZE(device->ptr)) - 1));             \
 	for (j = 0; device->chip->ptr.inst && j < ARRAY_SIZE(device->ptr); j++) {            \
 		if ((device->chip->ptr.inst & BIT(j)) && (subdev_mask & BIT_ULL(type))) {    \
-			int inst = (device->chip->ptr.inst == 1) ? -1 : (j);                 \
-			ret = device->chip->ptr.ctor(device, (type), inst, &device->ptr[j]); \
+			ret = device->chip->ptr.ctor(device, (type), (j), &device->ptr[j]);  \
 			subdev = nvkm_device_subdev(device, (type), (j));                    \
 			if (ret) {                                                           \
 				nvkm_subdev_del(&subdev);                                    \
-- 
2.31.1

