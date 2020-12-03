Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C450B2CCACF
	for <lists+nouveau@lfdr.de>; Thu,  3 Dec 2020 01:02:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7FE956EB1D;
	Thu,  3 Dec 2020 00:02:44 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 202766EB20
 for <nouveau@lists.freedesktop.org>; Thu,  3 Dec 2020 00:02:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606953762;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=5DH0t8qqaEn3RqUMO5KivnbVKgQ9Z9+5Q+gHm3Vh9Tw=;
 b=G+mJBK2ibbe1/+1Xf6UC4YZYNyBA6nMAP/ryLD2N0kG8kw+iXlEch8dpjhTKPNvHWTHbys
 wCq+bAOH0Ka54i8YO3NStxGyIDhMTauk5GG2bZdiv+W+GMtr6dtW6wvtSxp1wngFS22Txk
 rCbk9Il9Q4BSbIa7L8rrXXSOQyxMWrM=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-319-Sd3e9UHoP3K0YWItVE1QOw-1; Wed, 02 Dec 2020 19:02:38 -0500
X-MC-Unique: Sd3e9UHoP3K0YWItVE1QOw-1
Received: by mail-qv1-f71.google.com with SMTP id ca17so262587qvb.1
 for <nouveau@lists.freedesktop.org>; Wed, 02 Dec 2020 16:02:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=5DH0t8qqaEn3RqUMO5KivnbVKgQ9Z9+5Q+gHm3Vh9Tw=;
 b=lq35TpMGVxjMFbgHoan+k6HlkN9e5GtaGxNZIskX3VxTEnGEXPoBZAiKAQNHeMD0G1
 Ns6C6rF/0CBvSkkLv/ebW49qOCZYVq/xGIt4+eRayVSW9ODmUCSW6Py1CQAILZSNVTLn
 4WgX8584AnHoXBwfPHFA6sfvd0NbKscOs3UFPHiLX7PIIBgNNsGCJCXRg/lfeAd7vSrv
 zxKeFi8Sf9Q1bP+tx0UuBeFiWpSLu2H60bF4NM9OXs5C6mlI/zTcsFs6dAzpURicdw8M
 DXmXWXt5ermxM4oep4Wft9WI2ov6dEeuPZo+Xwt7Q1C9IG6eSSbqERk+LM2zt5w+9fOD
 jjoA==
X-Gm-Message-State: AOAM5310bOabUqWDHp0JUOuceNR4hEs2WQzj/ef+ycP7n3QKxApMm+N6
 c5MScHL0bpieEMkxagGv3j4fUqKMMaC/KybGtlnZRae+GdpkCbNU1R7bSx9Gw00GXXrXLEp0zpe
 ZWgjwO9TCwahmG6z/IG7eZ4d0Rw==
X-Received: by 2002:ae9:de03:: with SMTP id s3mr368149qkf.218.1606953757240;
 Wed, 02 Dec 2020 16:02:37 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxk/AL4kcxqZ1ogOOJxv1t1HGunHRRWZ5UdQ0lVVre8JW7SManmMIHEc30+Z/HknHhrJOet2A==
X-Received: by 2002:ae9:de03:: with SMTP id s3mr368133qkf.218.1606953757014;
 Wed, 02 Dec 2020 16:02:37 -0800 (PST)
Received: from dev.jcline.org ([2605:a601:a638:b301:9966:d978:493:6a3d])
 by smtp.gmail.com with ESMTPSA id y3sm222428qkl.110.2020.12.02.16.02.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Dec 2020 16:02:35 -0800 (PST)
From: Jeremy Cline <jcline@redhat.com>
To: Ben Skeggs <bskeggs@redhat.com>
Date: Wed,  2 Dec 2020 19:02:20 -0500
Message-Id: <20201203000220.18238-1-jcline@redhat.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jcline@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Subject: [Nouveau] [PATCH] drm/nouveau: avoid a use-after-free when BO init
 fails
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
 Daniel Vetter <daniel@ffwll.ch>, Thierry Reding <treding@nvidia.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

nouveau_bo_init() is backed by ttm_bo_init() and ferries its return code
back to the caller. On failures, ttm_bo_init() invokes the provided
destructor which should de-initialize and free the memory.

Thus, when nouveau_bo_init() returns an error the gem object has already
been released and the memory freed by nouveau_bo_del_ttm().

Fixes: 019cbd4a4feb ("drm/nouveau: Initialize GEM object before TTM object")
Cc: Thierry Reding <treding@nvidia.com>
Signed-off-by: Jeremy Cline <jcline@redhat.com>
---
 drivers/gpu/drm/nouveau/nouveau_gem.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_gem.c b/drivers/gpu/drm/nouveau/nouveau_gem.c
index 787d05eefd9c..d30157cc7169 100644
--- a/drivers/gpu/drm/nouveau/nouveau_gem.c
+++ b/drivers/gpu/drm/nouveau/nouveau_gem.c
@@ -211,10 +211,8 @@ nouveau_gem_new(struct nouveau_cli *cli, u64 size, int align, uint32_t domain,
 	}
 
 	ret = nouveau_bo_init(nvbo, size, align, domain, NULL, NULL);
-	if (ret) {
-		nouveau_bo_ref(NULL, &nvbo);
+	if (ret)
 		return ret;
-	}
 
 	/* we restrict allowed domains on nv50+ to only the types
 	 * that were requested at creation time.  not possibly on
-- 
2.28.0

_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
