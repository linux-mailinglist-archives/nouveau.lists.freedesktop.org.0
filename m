Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 57A6E538E31
	for <lists+nouveau@lfdr.de>; Tue, 31 May 2022 12:00:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B0721125ED;
	Tue, 31 May 2022 10:00:29 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [IPv6:2a00:1450:4864:20::536])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8FD7E1125E7;
 Tue, 31 May 2022 10:00:27 +0000 (UTC)
Received: by mail-ed1-x536.google.com with SMTP id h19so8692303edj.0;
 Tue, 31 May 2022 03:00:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=JruBtp3H6AJykO9OR/eL1GiHC7q7udWmPGM/sruwocU=;
 b=gblxCfTt5pOw7A9YHZEJV+r2VG2ChUPoOQENqtkp2cD9u6jNXJgjxv2GFFFMsM/j1v
 Q2bAWtuYoHVtOWqHe7hjKmrV3TsMB+pNFCxXxg98Hxoy145vOkyrtRBbQ1b4zZpA+A1+
 m3vrIpLanU3qXFTpv1WHgWerwCM08gLxzMyuLrfLY2BLdTpWmtpZZCIA8VnGVxQPJSGw
 xqv5Ii2BDXG3LKm7eR73P/dCNDyy1at1PARvuyUQJ4QUTBg+DKyDnVUw6Iop+kGwRAzR
 hJvsA8R/+LW94eBMAMh3wccqPVIx8QKXEc5XbXbso3UNdF0HbknOCrBEyS28rXYGBpJ4
 wTKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=JruBtp3H6AJykO9OR/eL1GiHC7q7udWmPGM/sruwocU=;
 b=BfRmGWhdenCOq41Xr+lqqVF8hsmw4LYirviVjzUPlJcYf5q5L/bjLQDeVzkk0N2wwa
 ZoexPH6O3Muqw8D9nXMQtJgm8goS2frJXzyU/J3h1vHl4aYuzWt40JBwvpRgKWOqcv1F
 iDyiig6jo2FjzTpPMSRtBJMOgwuOgdG2JtDtExVnm20PymFffYv8JCdvly27wCCDxWTH
 g9r7m0t4ljFW8x3yOrDqb18AD75+cO2oJcyxnplXmINKvobsvQsLr/iq4geXdUkzGCtb
 aIhb0YmhkBhp/0+twAgTMowOQKiSQTWieOF9diHLVS3X9LtNtmU3aDgYiy+8aDWz/n/U
 bBwA==
X-Gm-Message-State: AOAM531LN4P67/s64547RXe/y7YMwduW+PlloaSMckQLX8/obKVeM1tj
 LqLWK/MUi8J60RkrvC63MTg=
X-Google-Smtp-Source: ABdhPJxrLNkOBCK22JKPARmcl5BjmY6TUTpFvEk9uA+1n3mHpJJ9+WrPqf1O6PJKP4JfkZxzMsKPKw==
X-Received: by 2002:a05:6402:350b:b0:42d:d565:a62a with SMTP id
 b11-20020a056402350b00b0042dd565a62amr7607557edd.172.1653991225974; 
 Tue, 31 May 2022 03:00:25 -0700 (PDT)
Received: from able.fritz.box (p5b0ea02f.dip0.t-ipconnect.de. [91.14.160.47])
 by smtp.gmail.com with ESMTPSA id
 r13-20020a056402018d00b0042617ba6389sm582062edv.19.2022.05.31.03.00.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 31 May 2022 03:00:25 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 intel-gfx@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, linux-tegra@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, linux-mm@kvack.org
Date: Tue, 31 May 2022 12:00:05 +0200
Message-Id: <20220531100007.174649-12-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220531100007.174649-1-christian.koenig@amd.com>
References: <20220531100007.174649-1-christian.koenig@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Nouveau] [PATCH 11/13] drm/omap: use drm_oom_badness
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
 drivers/gpu/drm/omapdrm/omap_drv.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/omapdrm/omap_drv.c b/drivers/gpu/drm/omapdrm/omap_drv.c
index eaf67b9e5f12..ca2c484f48ca 100644
--- a/drivers/gpu/drm/omapdrm/omap_drv.c
+++ b/drivers/gpu/drm/omapdrm/omap_drv.c
@@ -684,6 +684,7 @@ static const struct file_operations omapdriver_fops = {
 	.poll = drm_poll,
 	.read = drm_read,
 	.llseek = noop_llseek,
+	.oom_badness = drm_oom_badness,
 };
 
 static const struct drm_driver omap_drm_driver = {
-- 
2.25.1

