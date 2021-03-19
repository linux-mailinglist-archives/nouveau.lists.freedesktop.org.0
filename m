Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B5C8A341F94
	for <lists+nouveau@lfdr.de>; Fri, 19 Mar 2021 15:36:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7475D6EA30;
	Fri, 19 Mar 2021 14:36:47 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [IPv6:2a00:1450:4864:20::52e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 09B286E9A2
 for <nouveau@lists.freedesktop.org>; Fri, 19 Mar 2021 08:24:50 +0000 (UTC)
Received: by mail-ed1-x52e.google.com with SMTP id bx7so9721642edb.12
 for <nouveau@lists.freedesktop.org>; Fri, 19 Mar 2021 01:24:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=QN4aBNwxKOCABxwfpyuG0Xk/7oUm3WT2PgkGnXFzadY=;
 b=xWnz3znjFX0tNlW97leA+LZR30kAS4pJ8PYHiwxM/+iY/SDaIbTj6tWToOXKAZNWUw
 3Fc8+e74T6Vu46ecZ3bBMYpLvi60D6XBeSEfImpnAHgWEoyGx2x7vu9tVcgEsKTnkJB3
 Z0uLIUTCwAaSFxopOOrNDj4nSHqdQ/XfofC89C+sKyV97q9eUBvjxq5/89nvlo2QB9rq
 9aNacsmrTFvmNCUC456ULATHyldGtn4gY9hqJeg2Rb9UUy2m6ovSXOV9dOycIsIfINVD
 Ka6tGO2ZRhIOVH1CpnUY+l/ra1+5xL3x4JO8o0swlS0Jn9HnkFWNtCQxWTBAWVH5rlbE
 +UMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=QN4aBNwxKOCABxwfpyuG0Xk/7oUm3WT2PgkGnXFzadY=;
 b=G2EhqdvDz9oaRB+gpPE12YmrWIhodc/yu6KDO7YX8mA4wgafC254lwDHUYC7+2QCfE
 yIS2hr3IoEWT5cPlP2BAIfwVSK1Wg7Mi5JQkLsZBjNXgyxncWrSQm60DGuiPAwL1hr7t
 fmLs/MKGpi58Te7epVMBpi2kt4FxGbriatuAl+oV1yQd0/ufTYSQLjaIEYgI2Zgku+vK
 2dlohlppBVLzkw4QczkdCyDkt0iodWA8wiEVXcliCwryAnt87dWS8msgM3bZSfb//FCl
 LmCiuw3BV8h1Kq4Lt3QsdIoSIQZWfATFHQAvBLQ7ZxOs69JPASNDFMSW8ekaiOB0DpY0
 scTg==
X-Gm-Message-State: AOAM531x5u4bj8UvQdw4kvzAEU2O6txKF9/QKQ0c6KV2b3uro9jjDTWg
 KrGmPqnmwX6mmWoRqyakjnGByA==
X-Google-Smtp-Source: ABdhPJwscQWu+LWU/WdUY0149XPKN1oU1qX01NKk8VcKSVszs01UoBJnFfmsmVlA0SKHNDd4ocW6yQ==
X-Received: by 2002:a05:6402:3486:: with SMTP id
 v6mr8079033edc.109.1616142288680; 
 Fri, 19 Mar 2021 01:24:48 -0700 (PDT)
Received: from dell.default ([91.110.221.194])
 by smtp.gmail.com with ESMTPSA id b18sm3273727ejb.77.2021.03.19.01.24.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Mar 2021 01:24:48 -0700 (PDT)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Date: Fri, 19 Mar 2021 08:24:26 +0000
Message-Id: <20210319082428.3294591-18-lee.jones@linaro.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210319082428.3294591-1-lee.jones@linaro.org>
References: <20210319082428.3294591-1-lee.jones@linaro.org>
MIME-Version: 1.0
X-Mailman-Approved-At: Fri, 19 Mar 2021 14:36:46 +0000
Subject: [Nouveau] [PATCH 17/19] drm/nouveau/nouveau_ioc32: File headers are
 not good candidates for kernel-doc
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
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Ben Skeggs <bskeggs@redhat.com>, Daniel Vetter <daniel@ffwll.ch>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

Fixes the following W=1 kernel build warning(s):

 drivers/gpu/drm/nouveau/nouveau_ioc32.c:2: warning: Cannot understand  * file mga_ioc32.c

Cc: Ben Skeggs <bskeggs@redhat.com>
Cc: David Airlie <airlied@linux.ie>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org
Cc: nouveau@lists.freedesktop.org
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/gpu/drm/nouveau/nouveau_ioc32.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_ioc32.c b/drivers/gpu/drm/nouveau/nouveau_ioc32.c
index adf01ca9e035d..8ddf9b2325a42 100644
--- a/drivers/gpu/drm/nouveau/nouveau_ioc32.c
+++ b/drivers/gpu/drm/nouveau/nouveau_ioc32.c
@@ -1,4 +1,4 @@
-/**
+/*
  * \file mga_ioc32.c
  *
  * 32-bit ioctl compatibility routines for the MGA DRM.
-- 
2.27.0

_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
