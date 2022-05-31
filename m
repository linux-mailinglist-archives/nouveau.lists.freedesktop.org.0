Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5294B538E2B
	for <lists+nouveau@lfdr.de>; Tue, 31 May 2022 12:00:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 625811125D3;
	Tue, 31 May 2022 10:00:24 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [IPv6:2a00:1450:4864:20::62c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 512881125C7;
 Tue, 31 May 2022 10:00:23 +0000 (UTC)
Received: by mail-ej1-x62c.google.com with SMTP id m20so25484388ejj.10;
 Tue, 31 May 2022 03:00:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=0fF+SmUCgmGBHMWIupVoHZia80K1ptfL7PQV1qLHe5E=;
 b=pGad9b/BwcaioFOjylZCfm5P6oSeZF3Qa2xsSM2t1mLTeOulJ6Fk7o/kQXSFGfU7lJ
 fp+6f/aeJYjHr4ThwoNMeFWvRYk8Xi3t4V6MuHjD4pXyJ85cRklWkQW6ame4vh7fx+mt
 eaMJgziirhMF0TIu3swNi0t8QcgG/D+TrXhYN/6zpOjgadE1pDN936EPEKG/3T0VKKBY
 eGDD/HmuCJdKW697mwOSCL+AIzK1PpEsB7W8mV3UO/gZVPIZSxHIDtHAeMFs64m0dwsi
 kXbIgj/gmD2mW2jfFnmLmUvUEs8rVjrgUuJi5qMnGsABI9in6Ar4JrgyhpFWFSv1YPAZ
 psrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=0fF+SmUCgmGBHMWIupVoHZia80K1ptfL7PQV1qLHe5E=;
 b=vuYtQVkhPvhtzm0mm0TkhggisXRnK8bdOWUok3Dmy1KKbO5m072rJfFR6U3tSgqCXs
 nmPz7a4sPP09w1rzC7cOVTrEVWlKzflKaFup5F23jpL5Ak0i732bJhudh8iaf68virib
 S4YDNgc7mJ3fQz4A1bMcfLZ2jaeUzH7OBIrp0M2nJ9Zbl9Pm/s/4X60EtntociKhqQhe
 D+jBnV5mbw8CoKpIdvvjZzKWXRCfvjmlknQX+cOPjLMJRk/4jiNTlrVXM3CwdVY3VJhQ
 ARDpv0xxz+BJKmPUn8ifau8/7wHSsUVDPnQaedldqabyniFJi5qfVFmGcnBkFVCwZMmT
 HXlA==
X-Gm-Message-State: AOAM5308Td/2sWzHWR6kiM5b0ybEjfK8m3mshnWf8j+2lijuo/45MS+9
 92Bsm+0MK+N2I4uUQj5xMBI=
X-Google-Smtp-Source: ABdhPJzxN/Ir8FJD89b6qow8Ub7cZ5+SzEkXV/zrFCVZFTH37oV1HNV4o+OUoqVfB6+SbpZEADHJkg==
X-Received: by 2002:a17:907:9482:b0:6f5:171d:f7f5 with SMTP id
 dm2-20020a170907948200b006f5171df7f5mr53043726ejc.68.1653991221803; 
 Tue, 31 May 2022 03:00:21 -0700 (PDT)
Received: from able.fritz.box (p5b0ea02f.dip0.t-ipconnect.de. [91.14.160.47])
 by smtp.gmail.com with ESMTPSA id
 r13-20020a056402018d00b0042617ba6389sm582062edv.19.2022.05.31.03.00.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 31 May 2022 03:00:21 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 intel-gfx@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, linux-tegra@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, linux-mm@kvack.org
Date: Tue, 31 May 2022 12:00:02 +0200
Message-Id: <20220531100007.174649-9-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220531100007.174649-1-christian.koenig@amd.com>
References: <20220531100007.174649-1-christian.koenig@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Nouveau] [PATCH 08/13] drm/radeon: use drm_oom_badness
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
Cc: andrey.grodzovsky@amd.com, hughd@google.com, viro@zeniv.linux.org.uk,
 daniel@ffwll.ch, alexander.deucher@amd.com, akpm@linux-foundation.org,
 christian.koenig@amd.com
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

This allows the OOM killer to make a better decision which process to reap.

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/radeon/radeon_drv.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/radeon/radeon_drv.c b/drivers/gpu/drm/radeon/radeon_drv.c
index 956c72b5aa33..7e7308c096d8 100644
--- a/drivers/gpu/drm/radeon/radeon_drv.c
+++ b/drivers/gpu/drm/radeon/radeon_drv.c
@@ -550,6 +550,7 @@ static const struct file_operations radeon_driver_kms_fops = {
 #ifdef CONFIG_COMPAT
 	.compat_ioctl = radeon_kms_compat_ioctl,
 #endif
+	.oom_badness = drm_oom_badness,
 };
 
 static const struct drm_ioctl_desc radeon_ioctls_kms[] = {
-- 
2.25.1

