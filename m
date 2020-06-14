Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CD4A3203A5C
	for <lists+nouveau@lfdr.de>; Mon, 22 Jun 2020 17:10:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D22E6E825;
	Mon, 22 Jun 2020 15:10:00 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mta-p8.oit.umn.edu (mta-p8.oit.umn.edu [134.84.196.208])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C14926E081
 for <nouveau@lists.freedesktop.org>; Sun, 14 Jun 2020 01:41:59 +0000 (UTC)
Received: from localhost (unknown [127.0.0.1])
 by mta-p8.oit.umn.edu (Postfix) with ESMTP id 49kxyv3D0Mz9vY7J
 for <nouveau@lists.freedesktop.org>; Sun, 14 Jun 2020 01:41:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at umn.edu
Received: from mta-p8.oit.umn.edu ([127.0.0.1])
 by localhost (mta-p8.oit.umn.edu [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2zR2ikp02tmh for <nouveau@lists.freedesktop.org>;
 Sat, 13 Jun 2020 20:41:59 -0500 (CDT)
Received: from mail-io1-f69.google.com (mail-io1-f69.google.com
 [209.85.166.69])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mta-p8.oit.umn.edu (Postfix) with ESMTPS id 49kxyv1NdFz9vY7K
 for <nouveau@lists.freedesktop.org>; Sat, 13 Jun 2020 20:41:59 -0500 (CDT)
DMARC-Filter: OpenDMARC Filter v1.3.2 mta-p8.oit.umn.edu 49kxyv1NdFz9vY7K
DKIM-Filter: OpenDKIM Filter v2.11.0 mta-p8.oit.umn.edu 49kxyv1NdFz9vY7K
Received: by mail-io1-f69.google.com with SMTP id w2so8926700iom.13
 for <nouveau@lists.freedesktop.org>; Sat, 13 Jun 2020 18:41:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=umn.edu; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=RpBLca7Vpqp9NG1nh6LCEacLvQmpL511GojbmNx9nJ4=;
 b=Wjxn1rKfuw9BdNj2jJqRd7zUXS9Idph8gy/wDlJtPVuwZrLE8Aka8rkIwQd9yNRv2j
 mp6xtnBdLpUQvYUCouBoe9YCvCw1QHEELjP3WK4Wxk9OXb6mMtjzG8CQh0GtUppw9Gc6
 dWbbxPDrdmVsUt4miSIsz6UNxBDG5POTtsldrhrjfLt2vmWM2qnFUamAhzuoCEMYvYRM
 VXIZ7l8w6zQBftrBD7x8nr4Uxx/FaS3nOoynwTxUiZnFUjE+pGvrkpZBhxP+mMpisWO8
 TKz/cSX1R2QUiUafPIrU5iN7W6xqcwTwaJHIvFlhxLmt13rKt5GEnbhqL66pT/WMeaE2
 wadw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=RpBLca7Vpqp9NG1nh6LCEacLvQmpL511GojbmNx9nJ4=;
 b=K28Ag2OJ4Q8VTAjvyU0NsU/WvxvIKAiNFg4EQG/BYOwicPL7/b2DltKz3g2yD+eV7Q
 dbMyuQNzPMGwjanZFEX4nyFjGJpvNzwTpimluDMMJ5D1GVk2/0jSuqbxDeybpPVMcKJY
 NfxvOVptWrRK1HAHC1BeW74qYbZPGZfLP3R6LWMmX8SuHRWarcSVVogeRenZa8f5IbQZ
 BRAVRXGPGG6H9vcL7nt6Rn2utBF240IfegPAVxgdQ/uy44k7eOjSzg0iUQl7oJpj3EK+
 6LdsmrjIfD40san2Kf7qbVwOTZxlYcHxWWChoIa0FlzjvUcUMxtARP3TlstIQpTh54jb
 ewgQ==
X-Gm-Message-State: AOAM531bHZ3cC8NFaG8Lh1pW5oVkeimoB5TrErh6iXqEWIK6liLdQYdU
 We/vBfAYj6ddywC0wINHGZRZu8v6Cf6sdhIFOnHFnyJ14BrpWFEViIw4er4WKubs+px2biLvi11
 XmpxNqy5Df2rywk3EuR5AfggypoBkDQ==
X-Received: by 2002:a92:d704:: with SMTP id m4mr19565774iln.248.1592098918707; 
 Sat, 13 Jun 2020 18:41:58 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzBLK54k4OZ8RbUQudZFJkUsqfkSvb0zM96jD7mAQJP4d+aXqcGxn5UyF7jykVx6il8g76RcA==
X-Received: by 2002:a92:d704:: with SMTP id m4mr19565762iln.248.1592098918550; 
 Sat, 13 Jun 2020 18:41:58 -0700 (PDT)
Received: from syssec1.cs.umn.edu ([2607:ea00:101:3c74:d65:8ac4:1b02:86ac])
 by smtp.gmail.com with ESMTPSA id y5sm5644372ilp.57.2020.06.13.18.41.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 13 Jun 2020 18:41:58 -0700 (PDT)
From: Aditya Pakki <pakki001@umn.edu>
To: pakki001@umn.edu
Date: Sat, 13 Jun 2020 20:41:56 -0500
Message-Id: <20200614014156.122729-1-pakki001@umn.edu>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 22 Jun 2020 15:09:59 +0000
Subject: [Nouveau] [PATCH] drm/nouveau: fix multiple instances of reference
 count leaks
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

On calling pm_runtime_get_sync() the reference count of the device
is incremented. In case of failure, decrement the
ref count before returning the error.

Signed-off-by: Aditya Pakki <pakki001@umn.edu>
---
 drivers/gpu/drm/nouveau/nouveau_drm.c | 8 ++++++--
 drivers/gpu/drm/nouveau/nouveau_gem.c | 4 +++-
 2 files changed, 9 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_drm.c b/drivers/gpu/drm/nouveau/nouveau_drm.c
index ac93d12201dc..880d962c1b19 100644
--- a/drivers/gpu/drm/nouveau/nouveau_drm.c
+++ b/drivers/gpu/drm/nouveau/nouveau_drm.c
@@ -1026,8 +1026,10 @@ nouveau_drm_open(struct drm_device *dev, struct drm_file *fpriv)
 
 	/* need to bring up power immediately if opening device */
 	ret = pm_runtime_get_sync(dev->dev);
-	if (ret < 0 && ret != -EACCES)
+	if (ret < 0 && ret != -EACCES) {
+		pm_runtime_put_autosuspend(dev->dev);
 		return ret;
+	}
 
 	get_task_comm(tmpname, current);
 	snprintf(name, sizeof(name), "%s[%d]", tmpname, pid_nr(fpriv->pid));
@@ -1109,8 +1111,10 @@ nouveau_drm_ioctl(struct file *file, unsigned int cmd, unsigned long arg)
 	long ret;
 
 	ret = pm_runtime_get_sync(dev->dev);
-	if (ret < 0 && ret != -EACCES)
+	if (ret < 0 && ret != -EACCES) {
+		pm_runtime_put_autosuspend(dev->dev);
 		return ret;
+	}
 
 	switch (_IOC_NR(cmd) - DRM_COMMAND_BASE) {
 	case DRM_NOUVEAU_NVIF:
diff --git a/drivers/gpu/drm/nouveau/nouveau_gem.c b/drivers/gpu/drm/nouveau/nouveau_gem.c
index 4c3f131ad31d..c5ee5b7364a0 100644
--- a/drivers/gpu/drm/nouveau/nouveau_gem.c
+++ b/drivers/gpu/drm/nouveau/nouveau_gem.c
@@ -45,8 +45,10 @@ nouveau_gem_object_del(struct drm_gem_object *gem)
 	int ret;
 
 	ret = pm_runtime_get_sync(dev);
-	if (WARN_ON(ret < 0 && ret != -EACCES))
+	if (WARN_ON(ret < 0 && ret != -EACCES)) {
+		pm_runtime_put_autosuspend(dev);
 		return;
+	}
 
 	if (gem->import_attach)
 		drm_prime_gem_destroy(gem, nvbo->bo.sg);
-- 
2.25.1

_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
