Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 25CCF482918
	for <lists+nouveau@lfdr.de>; Sun,  2 Jan 2022 05:18:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 70E1189F89;
	Sun,  2 Jan 2022 04:17:57 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mx5.ucr.edu (mx.ucr.edu [138.23.62.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CCB8510E342
 for <nouveau@lists.freedesktop.org>; Sat, 18 Dec 2021 02:56:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=ucr.edu; i=@ucr.edu; q=dns/txt; s=selector3;
 t=1639796201; x=1671332201;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Vhh2Wojmk5xxnlKfiyWrawrHKzGyzr84ZKM1o8pV+po=;
 b=Rmo5pVaZe2sMOWSHHXX1hOjW0v3i4G7mjrxLO/ofld0n8w7qmQPYR8iv
 vUCBONsNE8GgIfrGmfFNymgSiDSrjQeJCjsjAubZkgPSBMBjLEVmkXGOp
 7fbbomsvPj+8qgp72t32OzPhEymfLv0DfXT5Qx0fh/62p1cG2uYMiqvL4
 YJf7hGqxRMfxIw8HZEWVeWR9l2rTmEC+rP8akT2Qf+mol2KMv6hAGiOml
 2RZe0ydhb2M46J1rwwyJ0yo0KKCxAAJGXOoJHHvB5D9g7NAyZAL0a5du8
 ko5DWXAjaQ74Z/PtnO3oKZxk03EUabQtmJTXrH2FTauaxfs7q86rg7Kby A==;
IronPort-SDR: W5GIraq98mLpnwbZtlo9Eo20/3DHuG3hNl8umSFJhSnGEn1YisIgEV4pTijDzDyjDw+kZdFNSi
 Sw/Hj/Y+NcyjHLhKa9aTq4C4XuYnsAKNazgMeDp5b55G+mkUASJVP3mAQSNoT2RvWI0S2AQ4E0
 4EkdqL4tJ61jsGofbFIgXOkaWzUeW/hZy+ssPIplMVuiG5UaLWxQSjiXcxx3HAgkQvi1yf6dz5
 lwg83FhFKoNlX3FFXM7Kogw70Jh8fUwG+qEHn3tJwqR5cgrX3tyBhwb0dJNm9X/v69w9XplNLo
 avp1Dd9UTrPsfgxpOfTflSKo
X-IronPort-AV: E=Sophos;i="5.88,215,1635231600"; d="scan'208";a="263260738"
Received: from mail-qt1-f197.google.com ([209.85.160.197])
 by smtpmx5.ucr.edu with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 17 Dec 2021 18:56:40 -0800
Received: by mail-qt1-f197.google.com with SMTP id
 4-20020ac85744000000b002b2f329efc2so4210307qtx.12
 for <nouveau@lists.freedesktop.org>; Fri, 17 Dec 2021 18:56:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ucr.edu; s=rmail;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=W/oW4xcGaHD/Q9q+L8wKlfwu0bwPMu3EEaXJ1rCZ7r8=;
 b=Q1p+R3mC+VX9kDcyIZHntGkxKhbBd1chuPJ73wN16OAQ/DfnmvLJpQcHRIU2WoU7Zq
 tMDLlXWxqTIUo1WvrzD36E0gfnySwXT6rY6UQs9nb+9GXnekte7W8LvZLG6zEtyWu/Al
 FsP2C5hPSiTsbWEQBzH3/3CSPKY18FDzVtEgk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=W/oW4xcGaHD/Q9q+L8wKlfwu0bwPMu3EEaXJ1rCZ7r8=;
 b=RimLMM2MXkpFLy0LuZRc40CIO+iCv2pYyf44AdtyHrcl9J+Y1Up4pL9jVdKL7JUhkg
 lQktte9ADdR5nh8gq38+ApoLzYOaiVtoTSqo3t4EYXS8oGI5Jo0U9RY8q3gKDFUNj08n
 jzxsG0nWBrJNjr1NwJ/E5H6bCNMZ+3v72DFq7KaNyOtWP9PhR0KqXL0zvVP/yVrkWgZK
 kgWvdM0090Jkss2g6BvDcsGSURN4B7naFpgrSvhzL60D/52G5EfGYKnKbFdlEAIwykPN
 ikgWDnG8orWogaeiIM+I5YaSsX361IIVleGFsMlGToajKF5j6TBuwqkjrMFKSbSMrMMW
 dd8g==
X-Gm-Message-State: AOAM5303+sCTsrdTrcz+wJDJH8iflyKmrnH7R+Faq/mt6N6o5X5fBoBY
 n/TKH3zh1a3E0kL1w9f6um/nOglUBLPp2bFS+QW+qPXnf0IVZ+QAfft8tlQdZM2rgZJnoRVlVYU
 rMxnn9tFwi5flVyU4LRMZyTtN6D0=
X-Received: by 2002:ad4:594e:: with SMTP id eo14mr5090072qvb.99.1639796198057; 
 Fri, 17 Dec 2021 18:56:38 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzNSeR5+Y93fUCIc7POaHKnPLRzL0hlcG5CdAYxVV5YFjohfuBdG0RQ94oMtIxeknO4m2da8g==
X-Received: by 2002:ad4:594e:: with SMTP id eo14mr5090057qvb.99.1639796197839; 
 Fri, 17 Dec 2021 18:56:37 -0800 (PST)
Received: from kq.cs.ucr.edu (kq.cs.ucr.edu. [169.235.27.223])
 by smtp.googlemail.com with ESMTPSA id m1sm8455617qtk.34.2021.12.17.18.56.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Dec 2021 18:56:37 -0800 (PST)
From: Yizhuo Zhai <yzhai003@ucr.edu>
To: 
Date: Fri, 17 Dec 2021 18:56:30 -0800
Message-Id: <20211218025632.2514288-1-yzhai003@ucr.edu>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Sun, 02 Jan 2022 04:17:56 +0000
Subject: [Nouveau] [PATCH] drm/nouveau/core/object: Fix the uninitialized
 use of "type"
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
Cc: David Airlie <airlied@linux.ie>, nouveau@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org, Yizhuo Zhai <yzhai003@ucr.edu>,
 Ben Skeggs <bskeggs@redhat.com>, Daniel Vetter <daniel@ffwll.ch>
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

In function nvkm_ioctl_map(), the variable "type" could be
uninitialized if "nvkm_object_map()" returns error code, however,
it does not check the return value and directly use the "type" in
the if statement, which is potentially unsafe.

Cc: stable@vger.kernel.org
Fixes: 01326050391c ("drm/nouveau/core/object: allow arguments to be passed to map function")
Signed-off-by: Yizhuo Zhai <yzhai003@ucr.edu>
---
 drivers/gpu/drm/nouveau/nvkm/core/ioctl.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/nouveau/nvkm/core/ioctl.c b/drivers/gpu/drm/nouveau/nvkm/core/ioctl.c
index 735cb6816f10..4264d9d79783 100644
--- a/drivers/gpu/drm/nouveau/nvkm/core/ioctl.c
+++ b/drivers/gpu/drm/nouveau/nvkm/core/ioctl.c
@@ -266,6 +266,8 @@ nvkm_ioctl_map(struct nvkm_client *client,
 		ret = nvkm_object_map(object, data, size, &type,
 				      &args->v0.handle,
 				      &args->v0.length);
+		if (ret)
+			return ret;
 		if (type == NVKM_OBJECT_MAP_IO)
 			args->v0.type = NVIF_IOCTL_MAP_V0_IO;
 		else
-- 
2.25.1

