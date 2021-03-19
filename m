Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C9AF2341F91
	for <lists+nouveau@lfdr.de>; Fri, 19 Mar 2021 15:36:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CBB3C6EA2C;
	Fri, 19 Mar 2021 14:36:46 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [IPv6:2a00:1450:4864:20::631])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A79D06E9AE
 for <nouveau@lists.freedesktop.org>; Fri, 19 Mar 2021 08:24:51 +0000 (UTC)
Received: by mail-ej1-x631.google.com with SMTP id l4so8268918ejc.10
 for <nouveau@lists.freedesktop.org>; Fri, 19 Mar 2021 01:24:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=BenSWVQP2zN1koiPW0t4kws5hTFRiEoau/BE1y9GfNM=;
 b=oYWlnV715tCLUBUZeEDrM0wpCjeONuoxo+3C79hxVxvB8pCEQYK+jSqFAx2gbfgfwH
 n1TztEimoVY6MF894XhvGVjWrmeVXaVorLFS8ocMbNhFlUz2t4DL8H9yv6Mi54buMcP2
 zrrtllvrV3JRgkGqf44mltxIzcxnMk8t7PnwcUJjIHICtm79tOaAYocHa45kjgQaqGIF
 E/gReLSRwchhEXGmAmFH0ZYmXlBGQ38VW6Ed/nUE783qy8NQ27hsty26IGAFI5ZZJv5E
 aYta5XBi+HF2Zq7l1JEX14Ib5cARXLIat30SuqSMDq/lG/mSrl8dk4NxJcs8BQCPG2a9
 tWXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=BenSWVQP2zN1koiPW0t4kws5hTFRiEoau/BE1y9GfNM=;
 b=iQMuwY6zuik521xuJ6jki59QWBw3atvbK52/qEoPWIjQJfZoPEvb+DYzmxJW2ChIvB
 g82IzJDxBRYYXT1CbVhCvMYP5XA1tMSNHGkms3QZmZUsMH/CmD0nmlSd0zrKZ4LzAgbg
 BfhiwAR4Xe9F1bohr21e51gmOLjOGG9cbAQp3t4Wyn1K865LPiPiskozxBevwNFpLetR
 XGX5O/h740oi6nj6TgRW8mELPD0WWfLnA6Su3rQe5II2nxGOB05mFBBCfItHRUooTmVe
 3cEKRlKFgGgtf655lMJ3iW3nsXiteT6uHh405jyOmtVeJTiSGgqvpkPMvdf1K1oQGEQ/
 QMLg==
X-Gm-Message-State: AOAM533cEm62i3Bhl2D1ZCBxBbrArX43+PL4dlXKw2ZR3PjfQoXxW2id
 BhYqsinIXirQIl7CsE3mzwimog==
X-Google-Smtp-Source: ABdhPJxuH+2sZwvtwXnTvWJjVjs+eqo/uTPUENoEZ5KkXMAP0d9KhrIHoM6ef56AjMLywklcMo0kcA==
X-Received: by 2002:a17:906:2b46:: with SMTP id
 b6mr2916696ejg.521.1616142290404; 
 Fri, 19 Mar 2021 01:24:50 -0700 (PDT)
Received: from dell.default ([91.110.221.194])
 by smtp.gmail.com with ESMTPSA id b18sm3273727ejb.77.2021.03.19.01.24.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Mar 2021 01:24:50 -0700 (PDT)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Date: Fri, 19 Mar 2021 08:24:28 +0000
Message-Id: <20210319082428.3294591-20-lee.jones@linaro.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210319082428.3294591-1-lee.jones@linaro.org>
References: <20210319082428.3294591-1-lee.jones@linaro.org>
MIME-Version: 1.0
X-Mailman-Approved-At: Fri, 19 Mar 2021 14:36:46 +0000
Subject: [Nouveau] [PATCH 19/19] drm/nouveau/nouveau_ioc32: Demote
 kernel-doc abuse to standard comment block
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

 drivers/gpu/drm/nouveau/nouveau_ioc32.c:52: warning: Function parameter or member 'filp' not described in 'nouveau_compat_ioctl'
 drivers/gpu/drm/nouveau/nouveau_ioc32.c:52: warning: Function parameter or member 'cmd' not described in 'nouveau_compat_ioctl'
 drivers/gpu/drm/nouveau/nouveau_ioc32.c:52: warning: Function parameter or member 'arg' not described in 'nouveau_compat_ioctl'

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
index 8ddf9b2325a42..2af3615c5205c 100644
--- a/drivers/gpu/drm/nouveau/nouveau_ioc32.c
+++ b/drivers/gpu/drm/nouveau/nouveau_ioc32.c
@@ -38,7 +38,7 @@
 
 #include "nouveau_ioctl.h"
 
-/**
+/*
  * Called whenever a 32-bit process running under a 64-bit kernel
  * performs an ioctl on /dev/dri/card<n>.
  *
-- 
2.27.0

_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
