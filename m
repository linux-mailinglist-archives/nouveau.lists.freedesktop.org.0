Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D809A70CAC2
	for <lists+nouveau@lfdr.de>; Mon, 22 May 2023 22:18:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 06A7F10E381;
	Mon, 22 May 2023 20:18:50 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A184B10E37D
 for <nouveau@lists.freedesktop.org>; Mon, 22 May 2023 20:18:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1684786725;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=O9q1qCwNu3Mrx87IGOjeTMvMrxO9D4Con5QINyscbnk=;
 b=Ijh/Cy8Yq2mEWhlx9zE2hmCg+7OgpOTV6bXt17cH9g+CCvGqk96hOuxmjY2b6tKk08ufXU
 YcsR/DrN+pi4b1KMG+nOKgZKm7ISlz+Jyhh+Fa0GhZTM4XJitLtBMf7HJZji/Vfb/BIy1i
 FsHThOBi1duPH5HO9PLMErFRqouGGys=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-317-IctLRjufMZyiQLfvezn2SQ-1; Mon, 22 May 2023 16:18:44 -0400
X-MC-Unique: IctLRjufMZyiQLfvezn2SQ-1
Received: by mail-qv1-f72.google.com with SMTP id
 6a1803df08f44-624a29df9feso3154796d6.1
 for <nouveau@lists.freedesktop.org>; Mon, 22 May 2023 13:18:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684786723; x=1687378723;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=O9q1qCwNu3Mrx87IGOjeTMvMrxO9D4Con5QINyscbnk=;
 b=V3GXw/EmuVeLrZUw9OvYEZx5ptN5GeHy+zhZJT1iVi0YQqKwz5EbQsK3xY3LDP8H2d
 N0tfBccTA2NBr6nTX/f/2RBq8bakbO+vwNN0m8AqMD5aRvmSdMzQsDiGeZRGPLYp1+UA
 5pkR/BpEuBLY+zyLzeFRXloeHMAcP4Fb+xoK0EV1BDZX+ok9VONIkU923TgfdLEe3+gh
 g69nMlvZ0bJ6ui59jidV7nPwcyokxILluU9gSslxQvBhj2hlGkpblJGJGJTlbHzZIXj0
 W8f6filmWRNuyyKe9OSURZVGXJIZnL+hU/d8NumdwrPrRqzpbuFNMAAW45BVPaT6ZIil
 6XXA==
X-Gm-Message-State: AC+VfDxPaem5NpXFOH07TciDYQ9iIy51evNQxRhlAVmZT+Jgl2/ueAkF
 FlCKrMRWqNI7xRz7gwe0xpibo9zXd0cCu4v9bF5S/xiOsyElGgcOadwbSbC6b9EMINBq7/HLOCi
 tNzG44xYuIOuNyK243Hl7cFGufQ==
X-Received: by 2002:a05:6214:400f:b0:625:86ed:8ab4 with SMTP id
 kd15-20020a056214400f00b0062586ed8ab4mr4376380qvb.3.1684786723529; 
 Mon, 22 May 2023 13:18:43 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ7fUAFOMh8GoM7ZLqKEyQV3CmmIqRVsI4seXXB/Q3bmVY+dOhM/G3gUw77RysfQOiQm3Y6Waw==
X-Received: by 2002:a05:6214:400f:b0:625:86ed:8ab4 with SMTP id
 kd15-20020a056214400f00b0062586ed8ab4mr4376368qvb.3.1684786723299; 
 Mon, 22 May 2023 13:18:43 -0700 (PDT)
Received: from kherbst.pingu (ip1f1032e8.dynamic.kabel-deutschland.de.
 [31.16.50.232]) by smtp.gmail.com with ESMTPSA id
 i10-20020a0cfcca000000b006255bcfca88sm1688836qvq.7.2023.05.22.13.18.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 May 2023 13:18:42 -0700 (PDT)
From: Karol Herbst <kherbst@redhat.com>
To: linux-kernel@vger.kernel.org
Date: Mon, 22 May 2023 22:18:38 +0200
Message-Id: <20230522201838.1496622-1-kherbst@redhat.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true
Subject: [Nouveau] [PATCH] drm/nouveau/acr: Abort loading ACR if no firmware
 was found
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
Cc: "open list:DRM DRIVER FOR NVIDIA GEFORCE/QUADRO GPUS"
 <nouveau@lists.freedesktop.org>,
 "open list:DRM DRIVER FOR NVIDIA GEFORCE/QUADRO GPUS"
 <dri-devel@lists.freedesktop.org>, Ben Skeggs <bskeggs@redhat.com>,
 Daniel Vetter <daniel@ffwll.ch>, Gourav Samaiya <gsamaiya@nvidia.com>
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

This fixes a NULL pointer access inside nvkm_acr_oneinit in case necessary
firmware files couldn't be loaded.

Closes: https://gitlab.freedesktop.org/drm/nouveau/-/issues/212
Fixes: 4b569ded09fd ("drm/nouveau/acr/ga102: initial support")
Signed-off-by: Karol Herbst <kherbst@redhat.com>
---
 drivers/gpu/drm/nouveau/nvkm/subdev/acr/base.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/acr/base.c b/drivers/gpu/drm/nouveau/nvkm/subdev/acr/base.c
index 795f3a649b12..6388234c352c 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/acr/base.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/acr/base.c
@@ -224,7 +224,7 @@ nvkm_acr_oneinit(struct nvkm_subdev *subdev)
 	u64 falcons;
 	int ret, i;
 
-	if (list_empty(&acr->hsfw)) {
+	if (list_empty(&acr->hsfw) || !acr->func->wpr_layout) {
 		nvkm_debug(subdev, "No HSFW(s)\n");
 		nvkm_acr_cleanup(acr);
 		return 0;
-- 
2.40.1

