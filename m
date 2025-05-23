Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 26D2EAC272F
	for <lists+nouveau@lfdr.de>; Fri, 23 May 2025 18:08:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CBCFE10E82E;
	Fri, 23 May 2025 16:08:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="y8ctUDuM";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com
 [209.85.208.174])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F089D10E82D
 for <nouveau@lists.freedesktop.org>; Fri, 23 May 2025 16:08:14 +0000 (UTC)
Received: by mail-lj1-f174.google.com with SMTP id
 38308e7fff4ca-30c416cdcc0so88418981fa.2
 for <nouveau@lists.freedesktop.org>; Fri, 23 May 2025 09:08:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1748016493; x=1748621293; darn=lists.freedesktop.org;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :from:to:cc:subject:date:message-id:reply-to;
 bh=hGF7HsXVnOrqTUKvr0Dj/ZLjMe7xNdGfL36SW0iFLZk=;
 b=y8ctUDuM8b4RiaQegDn5WTGd2/ZOlKIdTSFLeJ2LNFRfP5gBeCoKGmL/Y4SuZK3xek
 ZzZdUSeFsSBg6lkaMmiIP6ZkCcaZRmrzF+OlNp4pD2Gp6Qx3gDjnmtPABV40W8gtjRLM
 P64Sy12k+A17DZ92YVjM3R7gXBCIrewS9kIOABHwQkloMi2SUOBkBScQs/8mTydjuLRe
 BKfHqvdNQJ814spp9hP2EkenHA4E+z5+FDllKPNb/aicpqCY+Ny3l8ISkIGEqjGdvlO+
 jjJVQ5A+OHGbH8417r4xqR1P31rVJZGfy8ki5q/VdeD1boZwmSeca8jWGreXmTjuvUTm
 A+ZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1748016493; x=1748621293;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=hGF7HsXVnOrqTUKvr0Dj/ZLjMe7xNdGfL36SW0iFLZk=;
 b=KmT3qBpIBYkfDrn6vs3GoKsXYRXeSH44sBieGjQKsGmCob7re5IvEPbJjA3exv990k
 YDdIhEl/Scm6oaCQjW6NQ/flz4DsedEJle+Ehl9mOcngphzRCrhBhNdYjbH4ONVKQYPF
 l2Dg07nlOxjo58NZv/A0Wjf7mKXr1Bp67cRKW3Hm9ydBnxGtdhH8AkiBknccGYVMYu1p
 tNKRzU+Pp9+U1uIdCLdxc3mFHhCb2GMbYRXn3de5/ZDhTenNWX+QPB63uEjUaqF2TLX+
 ema0zNL4fkuyqr5J9hQ+RME3kvHy/VDA/ZaDUqxdo8JtZw99SIMFo8GZF+N+OveX6p7B
 sRMA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWLyNX7kuiuVYJJsILwCL7z2kKBp4mDHrlJdWulfywZaLpK2yXqPv/ui9ZvwwV284IqN9NbRHFc@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwA2nfknlvagiaT/d3zEKPQfRzlEyUEVgETt9aJP7PjgS7gi3vL
 VL55qwfjPr11sgTlh+zEx2Y/QBYf9ThbvaNNfafghCwTizqRtnx9TczDTa4NWYWd1r0DD78SK+2
 Nnluq
X-Gm-Gg: ASbGncvQxN7A2Vm1NDmvvRzyzGE3mTayG8i1UU9ucrgk5Krc7tgwLBqarTMMdH7z5vP
 VfcyA9K0RorsSHs6V1Bm4m8A7MVZ57yeL2zB0DX9i5+9KqoRmQN4bN5B/2jp7efzT9iKHZl4AOL
 ibCI8iR+jcWCuyCMt1fRDCJTyP0vyDriDZ3Q439hwf3ij2O71abhUaT88Ng2EJ83SIin8dmtRy4
 PYg26tOIl8Ci+TAgw/R3BvpwGjgjK+9NZrt2LGsIEWAiuzJPF526+6UPiF1db32uLvdRqu3JWB5
 Vd8XVJds3f9Dvw1tWXCTXkUP1D+EzEAqYadMiDyls8/AU+B31dCpDuMI+M51KbUriLQ=
X-Google-Smtp-Source: AGHT+IEgnqQ89pTDpIiXTK+5YoVr8iR1h5pIE/WFcVljNceH6shNrv9ACEId9Fo5qIq8B9APct4R0g==
X-Received: by 2002:a05:600c:3b21:b0:441:b3eb:5720 with SMTP id
 5b1f17b1804b1-442ff0396b5mr274072555e9.29.1748016482352; 
 Fri, 23 May 2025 09:08:02 -0700 (PDT)
Received: from localhost ([196.207.164.177])
 by smtp.gmail.com with UTF8SMTPSA id
 ffacd0b85a97d-3a368136014sm22978069f8f.92.2025.05.23.09.08.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 May 2025 09:08:01 -0700 (PDT)
Date: Fri, 23 May 2025 19:07:58 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Ben Skeggs <bskeggs@nvidia.com>
Cc: Lyude Paul <lyude@redhat.com>, Danilo Krummrich <dakr@kernel.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Dave Airlie <airlied@redhat.com>,
 Lu Baolu <baolu.lu@linux.intel.com>, Timur Tabi <ttabi@nvidia.com>,
 dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org,
 kernel-janitors@vger.kernel.org
Subject: [PATCH next] drm/nouveau/tegra: Fix error pointer vs NULL return in
 nvkm_device_tegra_resource_addr()
Message-ID: <aDCdXk98AhLBcWvK@stanley.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
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
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

The nvkm_device_tegra_resource() function returns a mix of error pointers
and NULL.  The callers only expect it to return NULL on error.  Change it
to only return NULL.

Fixes: 76b8f81a5b92 ("drm/nouveau: improve handling of 64-bit BARs")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/gpu/drm/nouveau/nvkm/engine/device/tegra.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/device/tegra.c b/drivers/gpu/drm/nouveau/nvkm/engine/device/tegra.c
index 0ca2dfe99676..114e50ca1827 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/device/tegra.c
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/device/tegra.c
@@ -196,7 +196,7 @@ nvkm_device_tegra_resource(struct nvkm_device *device, enum nvkm_bar_id bar)
 	case NVKM_BAR1_FB : idx = 1; break;
 	default:
 		WARN_ON(1);
-		return ERR_PTR(-EINVAL);
+		return NULL;
 	}
 
 	return platform_get_resource(tdev->pdev, IORESOURCE_MEM, idx);
-- 
2.47.2

