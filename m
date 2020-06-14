Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CC8E203A5B
	for <lists+nouveau@lfdr.de>; Mon, 22 Jun 2020 17:10:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1886A6E824;
	Mon, 22 Jun 2020 15:10:00 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mta-p6.oit.umn.edu (mta-p6.oit.umn.edu [134.84.196.206])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6FC0089FE8
 for <nouveau@lists.freedesktop.org>; Sun, 14 Jun 2020 01:33:45 +0000 (UTC)
Received: from localhost (unknown [127.0.0.1])
 by mta-p6.oit.umn.edu (Postfix) with ESMTP id 49kxnP0hhkz9vYTm
 for <nouveau@lists.freedesktop.org>; Sun, 14 Jun 2020 01:33:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at umn.edu
Received: from mta-p6.oit.umn.edu ([127.0.0.1])
 by localhost (mta-p6.oit.umn.edu [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id U-yjp6b8HS1z for <nouveau@lists.freedesktop.org>;
 Sat, 13 Jun 2020 20:33:45 -0500 (CDT)
Received: from mail-il1-f198.google.com (mail-il1-f198.google.com
 [209.85.166.198])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mta-p6.oit.umn.edu (Postfix) with ESMTPS id 49kxnN5vhJz9vYTh
 for <nouveau@lists.freedesktop.org>; Sat, 13 Jun 2020 20:33:44 -0500 (CDT)
DMARC-Filter: OpenDMARC Filter v1.3.2 mta-p6.oit.umn.edu 49kxnN5vhJz9vYTh
DKIM-Filter: OpenDKIM Filter v2.11.0 mta-p6.oit.umn.edu 49kxnN5vhJz9vYTh
Received: by mail-il1-f198.google.com with SMTP id j71so9431607ilg.9
 for <nouveau@lists.freedesktop.org>; Sat, 13 Jun 2020 18:33:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=umn.edu; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=jUlMgTFm6fgfWMMV+9s/cidt0Ya0VFDxiosQzLpc40s=;
 b=Ei3a4oCienBBw6iPl3GFWh9tQY0JjX8uZSP4hyeKGf0Iq4siwktVhkBFJeMu9dwJMn
 Chw34JghNFTOkIHxYWPcX2+UpEehlBp8JIeBr0oRj/bA5uN3Q7o4yyyAqT7GAZMF0Q+d
 S0i844L14NaGAbApvuzW7pnHYPEBsCSj1kfzImBZGrw3dgSdnbPSvg+2v8ZsH3aJpFMY
 7hZb1cX44hmnYFYpTJLycCmLzr7inAoKdNdrIlie5gMSZ7zwczaPrNIgiThSEtf/+m05
 7mfJOB3cvuM5dhSwAiobY8dTIC69JCgS6oQRCW+KQ51cbA9nwl4O81GOweBb3rvAWj2S
 7C7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=jUlMgTFm6fgfWMMV+9s/cidt0Ya0VFDxiosQzLpc40s=;
 b=SZw7OeKOeTcnQZM2zKm+O3pzQ5xS3CCIq7LNs1GGpFeyOIvySFYmvCJ0FYhEDCcUAP
 pHHyuN0+pPHMg8J3W2a7cOKOfMOx+BDB40oF56X64h5gl8qf8StwaX+hM7X2sp2QvLFl
 wDdpzaAmdyL04+hUfP0hqd+8KqB7VT6BwF9lGpJcM8499DsuwW8s4d9WiOJzE1ezjODg
 d44mzwUNveJ6vPNTokUzwOwNRIMAwj84ACB9HfdlP0TgccQpYFDrWWA40HowarA2il08
 EDx9WjSOAfyK6M2uBhwTMr33RDD6AMp6ze8MtQtK5XlVaVaKfy5uFOTkfxBofJWAJBo+
 YPVA==
X-Gm-Message-State: AOAM532Wl0VRwHsiG/13w2o+hI29wl9XMb0NV5zxOe0ZG2B5guvEV43l
 6b63UJOd5kg98PXwLvD5JqiZMXeKRTBYsmDIKNqSno8znHCqS4HgUDxsy111ljPS9HOicheOOKO
 AKTtWKuyQbp/w2ZtIE/Lt0gWaA2mRqQ==
X-Received: by 2002:a05:6602:1647:: with SMTP id
 y7mr21169398iow.75.1592098424493; 
 Sat, 13 Jun 2020 18:33:44 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy8lq+ZJcFfEGG8Lqn6FC+nNd+cCmmNo/tt7bKBSBKebyGZR+rrsj/xfGHJjBtj4WzgMDZCYw==
X-Received: by 2002:a05:6602:1647:: with SMTP id
 y7mr21169380iow.75.1592098424337; 
 Sat, 13 Jun 2020 18:33:44 -0700 (PDT)
Received: from syssec1.cs.umn.edu ([2607:ea00:101:3c74:d65:8ac4:1b02:86ac])
 by smtp.gmail.com with ESMTPSA id w18sm5705722ili.19.2020.06.13.18.33.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 13 Jun 2020 18:33:43 -0700 (PDT)
From: Aditya Pakki <pakki001@umn.edu>
To: pakki001@umn.edu
Date: Sat, 13 Jun 2020 20:33:42 -0500
Message-Id: <20200614013342.122079-1-pakki001@umn.edu>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 22 Jun 2020 15:09:59 +0000
Subject: [Nouveau] [PATCH] drm/noveau: fix reference count leak in
 nouveau_fbcon_open
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
Cc: wu000273@umn.edu, David Airlie <airlied@linux.ie>,
 nouveau@lists.freedesktop.org, kjlu@umn.edu, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Ben Skeggs <bskeggs@redhat.com>,
 Daniel Vetter <daniel@ffwll.ch>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

nouveau_fbcon_open() calls calls pm_runtime_get_sync() that
increments the reference count. In case of failure, decrement the
ref count before returning the error.

Signed-off-by: Aditya Pakki <pakki001@umn.edu>
---
 drivers/gpu/drm/nouveau/nouveau_fbcon.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_fbcon.c b/drivers/gpu/drm/nouveau/nouveau_fbcon.c
index 3d11b84d4cf9..f10d28f8f132 100644
--- a/drivers/gpu/drm/nouveau/nouveau_fbcon.c
+++ b/drivers/gpu/drm/nouveau/nouveau_fbcon.c
@@ -189,8 +189,10 @@ nouveau_fbcon_open(struct fb_info *info, int user)
 	struct nouveau_fbdev *fbcon = info->par;
 	struct nouveau_drm *drm = nouveau_drm(fbcon->helper.dev);
 	int ret = pm_runtime_get_sync(drm->dev->dev);
-	if (ret < 0 && ret != -EACCES)
+	if (ret < 0 && ret != -EACCES) {
+		pm_runtime_put(drm->dev->dev);
 		return ret;
+	}
 	return 0;
 }
 
-- 
2.25.1

_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
