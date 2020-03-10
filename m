Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FB1D17FE01
	for <lists+nouveau@lfdr.de>; Tue, 10 Mar 2020 14:32:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7CBEC6E2D1;
	Tue, 10 Mar 2020 13:31:58 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 60A996E2D1;
 Tue, 10 Mar 2020 13:31:57 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id r15so10836047wrx.6;
 Tue, 10 Mar 2020 06:31:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=jrDtyK6FLnqHTMEHua3mmqEWGNJQ4n8j8Ssk1MYnbIk=;
 b=vJ7ysWTIYyPXmgp0Sp+bajnIIMsLa1JcTuH4HM4R7lYAuGaxUzw+Hv+5snwkeTWThT
 rt/QTjHajnsC+DOoRWSCvA6UribCXRqIiCAGb2lifsVzKHjZ2e6vNpf3g6GNFgM0HOH7
 BlQlO5MkoOc3kCj9bJGTz4UCX+bUIMvU5iCdnZyAahYaQ/H/QCgjGNpEvvdjtbTFLr0c
 Ah+uAOr8KcyxvQIRvYoKjo+NZwmoCZ6il5+YY0/zRnP8RUptwmZLxjbjSNNxIPRKKOv9
 CjBMyz23jMszNzsypr0VILUfJjisT8oN8X1Q2JWs8utMd9OkfHK+GyCrthXrFjenEeQe
 o/CA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=jrDtyK6FLnqHTMEHua3mmqEWGNJQ4n8j8Ssk1MYnbIk=;
 b=AAd58yGQJ74bS7erm4lMxtLSEeomoudJuY/+FG4T6PPfTwr0BP8l85fFoxzzN1Te4j
 X0BZmh9+N6SrUsIK+H/X6557rwr7zRS7AW+93NEQL2vlOOHnZlcullrb5bBx6umHxc8p
 Gh2HODyX5tBzwLNKlioNQHm+ao+gOvzrXabBP1TdgP/7mYL4EuciFMbWGbv/hKhBOqKf
 6krZIF5gmQM0wYZVkM6XDBck3069Zy9QGOkGCNCCL8g4l5+o/KEETqEgF/fOLJhAnHW7
 5oT7nXLpnfYycL97BkzFyTPLox1EbnsVqNyCLj19+vbSzoKcu2Qx6UAAaM+ztHDvshQ5
 fBTg==
X-Gm-Message-State: ANhLgQ2sJq4+/eLKv9nyDnJ2TirnN1Zd7kVJKaDkJDRbOyfb+SvNC6T7
 VcOZlCUMFFvqNrTp1VK+Aaw=
X-Google-Smtp-Source: ADFU+vvEOWPQJw/FEbRudxX6QTWpQe8WMthu0+XVTUd0fFBVZkcDCWxjgdY2UI0zM0Ef4xHLUNZqKw==
X-Received: by 2002:adf:eac8:: with SMTP id o8mr14498933wrn.105.1583847116123; 
 Tue, 10 Mar 2020 06:31:56 -0700 (PDT)
Received: from localhost.localdomain ([197.248.222.210])
 by smtp.googlemail.com with ESMTPSA id o7sm14047141wrx.60.2020.03.10.06.31.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Mar 2020 06:31:55 -0700 (PDT)
From: Wambui Karuga <wambui.karugax@gmail.com>
To: airlied@linux.ie,
	daniel@ffwll.ch,
	Ben Skeggs <bskeggs@redhat.com>
Date: Tue, 10 Mar 2020 16:31:15 +0300
Message-Id: <20200310133121.27913-12-wambui.karugax@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200310133121.27913-1-wambui.karugax@gmail.com>
References: <20200310133121.27913-1-wambui.karugax@gmail.com>
MIME-Version: 1.0
Subject: [Nouveau] [PATCH v2 11/17] drm/nouveau: make
 nouveau_drm_debugfs_init() return 0
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
Cc: gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

Since 987d65d01356 (drm: debugfs: make
drm_debugfs_create_files() never fail), there is no need to ever check
for the the return value of debugfs_create_file() and
drm_debugfs_create_files(). Therefore, remove unnecessary checks and
error handling in nouveau_drm_debugfs_init() and have the function
return 0 directly.

v2: have nouveau_drm_debugfs_init() return 0 instead of void so as not
to introduce any build warnings to enable individual patch compilation.

References: https://lists.freedesktop.org/archives/dri-devel/2020-February/257183.html
Signed-off-by: Wambui Karuga <wambui.karugax@gmail.com>
---
 drivers/gpu/drm/nouveau/nouveau_debugfs.c | 20 ++++++++------------
 1 file changed, 8 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_debugfs.c b/drivers/gpu/drm/nouveau/nouveau_debugfs.c
index 7dfbbbc1beea..15a3d40edf02 100644
--- a/drivers/gpu/drm/nouveau/nouveau_debugfs.c
+++ b/drivers/gpu/drm/nouveau/nouveau_debugfs.c
@@ -222,22 +222,18 @@ nouveau_drm_debugfs_init(struct drm_minor *minor)
 {
 	struct nouveau_drm *drm = nouveau_drm(minor->dev);
 	struct dentry *dentry;
-	int i, ret;
+	int i;
 
 	for (i = 0; i < ARRAY_SIZE(nouveau_debugfs_files); i++) {
-		dentry = debugfs_create_file(nouveau_debugfs_files[i].name,
-					     S_IRUGO | S_IWUSR,
-					     minor->debugfs_root, minor->dev,
-					     nouveau_debugfs_files[i].fops);
-		if (!dentry)
-			return -ENOMEM;
+		debugfs_create_file(nouveau_debugfs_files[i].name,
+				    S_IRUGO | S_IWUSR,
+				    minor->debugfs_root, minor->dev,
+				    nouveau_debugfs_files[i].fops);
 	}
 
-	ret = drm_debugfs_create_files(nouveau_debugfs_list,
-				       NOUVEAU_DEBUGFS_ENTRIES,
-				       minor->debugfs_root, minor);
-	if (ret)
-		return ret;
+	drm_debugfs_create_files(nouveau_debugfs_list,
+				 NOUVEAU_DEBUGFS_ENTRIES,
+				 minor->debugfs_root, minor);
 
 	/* Set the size of the vbios since we know it, and it's confusing to
 	 * userspace if it wants to seek() but the file has a length of 0
-- 
2.25.1

_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
