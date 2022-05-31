Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 98B2E538E32
	for <lists+nouveau@lfdr.de>; Tue, 31 May 2022 12:00:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 42601112603;
	Tue, 31 May 2022 10:00:29 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [IPv6:2a00:1450:4864:20::536])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C2FC3112603;
 Tue, 31 May 2022 10:00:27 +0000 (UTC)
Received: by mail-ed1-x536.google.com with SMTP id c2so7260328edf.5;
 Tue, 31 May 2022 03:00:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=NiGv7XqpyS2XED0WdTZJaaW3qxD3EEwJnBgFNlUBlKA=;
 b=aUB5B9Qt8tVriEh42JHF6p0XPngykorf81VEvkU+jbQb7CSF/l+p5bKKOyZ20uEgsA
 E43T85l2RNnZ7ArvqSkvuaTiD93Z/Q+CcF5nsxGUHtbZPnk25OSTrL4t5vJROge1iv08
 D43ebZ6vcKHFJLX+daUhnhKonDnOhJN9wbzFrqgWFfIh7GjGBXxWi48JT9I+x8K6ogvq
 Gyvusf+zhEL6Gk09/w34fLwp6G9rdW/r/FFrInAhnujV6+INA3rKvI4kTTFmibLu1J5X
 yfuU2boXQuUY1zqYSg/AQttssmci0RltzIdFgKtVRPa9qApgcGl9lqhFBcWEyD7XIwTB
 xPcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=NiGv7XqpyS2XED0WdTZJaaW3qxD3EEwJnBgFNlUBlKA=;
 b=Dmk8UH0WLtkjLYrhuO72XfH5LH2T7XHADLYJCFnOJPn2DcH1JWbWVm4xTqPbZyNAcC
 bNyK133oA4nAOdQDLcNGRN9ExSylso3aBpNoPSOqSWflRd2ACgfEg9lkiALkheGcOfM3
 d0XDveHauySZZvClGbGomxer40XUIaFpRLBKFpZt2WhgsJptYWgDCUvJEEodAfzhqQLC
 TVH94Nxngy+yCinDt8Kbp+bi4oCb6J/K8nPwCRX1WbXYbxLe2qpenD0ebGHg8l/jN8nL
 K8Dzugbdp7auSX/AQlhkEw7OksetMZpFw+iqzhscHWe3elD4+9e5Nltrnh9MwT97ALEb
 blbQ==
X-Gm-Message-State: AOAM5331xDDhn0gHSVcijZGuKzbIvP2W3ztGBkMbC2E/YDXWFh4Njeb8
 iBEPGw+n9s7VfBC2YXUfHPU=
X-Google-Smtp-Source: ABdhPJxaefghKbMHCtIN9ZsUiLrQ9JGsM6ui0kyhG9BoMRuUMSSLwMZQJupGKdHga/0PvqPhhZrEmQ==
X-Received: by 2002:a05:6402:90d:b0:428:c1ad:1e74 with SMTP id
 g13-20020a056402090d00b00428c1ad1e74mr63021246edz.345.1653991227420; 
 Tue, 31 May 2022 03:00:27 -0700 (PDT)
Received: from able.fritz.box (p5b0ea02f.dip0.t-ipconnect.de. [91.14.160.47])
 by smtp.gmail.com with ESMTPSA id
 r13-20020a056402018d00b0042617ba6389sm582062edv.19.2022.05.31.03.00.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 31 May 2022 03:00:27 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 intel-gfx@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, linux-tegra@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, linux-mm@kvack.org
Date: Tue, 31 May 2022 12:00:06 +0200
Message-Id: <20220531100007.174649-13-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220531100007.174649-1-christian.koenig@amd.com>
References: <20220531100007.174649-1-christian.koenig@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Nouveau] [PATCH 12/13] drm/vmwgfx: use drm_oom_badness
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
 drivers/gpu/drm/vmwgfx/vmwgfx_drv.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c b/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c
index 01a5b47e95f9..e447e8ae29be 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c
@@ -1577,6 +1577,7 @@ static const struct file_operations vmwgfx_driver_fops = {
 #endif
 	.llseek = noop_llseek,
 	.get_unmapped_area = vmw_get_unmapped_area,
+	.oom_badness = drm_oom_badness,
 };
 
 static const struct drm_driver driver = {
-- 
2.25.1

