Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C4289D87E2
	for <lists+nouveau@lfdr.de>; Mon, 25 Nov 2024 15:26:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 382A210E66D;
	Mon, 25 Nov 2024 14:26:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="G/PoCBt1";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C18B10E66D
 for <nouveau@lists.freedesktop.org>; Mon, 25 Nov 2024 14:26:46 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id ED1145C0375;
 Mon, 25 Nov 2024 14:26:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 32AD9C4CECE;
 Mon, 25 Nov 2024 14:26:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1732544805;
 bh=4/1wTwjwgHWxYZ5E/+HKIfozXpk1jsOdarTYOtxpw/o=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=G/PoCBt1ualYxYYo+pX1RSxHr9yQZ7Wh9dCV1zecKrOxrzoajklQJ7XOiEtWR20uL
 B2O/+DM91k+TSXJlLOg6XCmvYq54ltQ9gBga3TA5AGhV2kGqQGKyUB1ccD2S3jnHoS
 2ayd6xEXApaOXeuhsh9h48Nb8Uwwg++PladR9jrTxA3CeaNuQLXLzPak95Jw51/4vh
 x4E7Ml0r3PeUz9osyxoA8K43+uS3JUNKn1aGghxqJsax/wHobm6tki6/xwwk3ymLgB
 ddhNu/bGPlNDoWThpH3d7VMd4/lrgWjmhHOG48T7lQ52sefgKtkVbyhJbi49IrP1Ku
 /RwSw4DQU6jlQ==
From: Danilo Krummrich <dakr@kernel.org>
To: ttabi@nvidia.com
Cc: nouveau@lists.freedesktop.org,
	Danilo Krummrich <dakr@kernel.org>
Subject: [PATCH] drm/nouveau: create module debugfs root
Date: Mon, 25 Nov 2024 15:25:49 +0100
Message-ID: <20241125142639.9126-1-dakr@kernel.org>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241030202952.694055-2-ttabi@nvidia.com>
References: <20241030202952.694055-2-ttabi@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

Typically DRM drivers use the DRM debugfs root entry. However, since
Nouveau is heading towards a split into a core and a DRM driver, create
a module specific debugfs root directory.

Subsequent patches make use of this new debugfs root in order to store
GSP-RM log bufferes (optionally beyond a device driver binding).

Signed-off-by: Danilo Krummrich <dakr@kernel.org>
---
Unless there are any concerns, I'll pick this patch and rebase Timur's patches
on top of it.
---
 drivers/gpu/drm/nouveau/nouveau_debugfs.c | 16 ++++++++++++++++
 drivers/gpu/drm/nouveau/nouveau_debugfs.h | 16 ++++++++++++++++
 drivers/gpu/drm/nouveau/nouveau_drm.c     | 22 +++++++++++++++++++---
 3 files changed, 51 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_debugfs.c b/drivers/gpu/drm/nouveau/nouveau_debugfs.c
index e83db051e851..200e65a7cefc 100644
--- a/drivers/gpu/drm/nouveau/nouveau_debugfs.c
+++ b/drivers/gpu/drm/nouveau/nouveau_debugfs.c
@@ -313,3 +313,19 @@ nouveau_debugfs_fini(struct nouveau_drm *drm)
 	kfree(drm->debugfs);
 	drm->debugfs = NULL;
 }
+
+int
+nouveau_module_debugfs_init(void)
+{
+	nouveau_debugfs_root = debugfs_create_dir("nouveau", NULL);
+	if (IS_ERR(nouveau_debugfs_root))
+		return PTR_ERR(nouveau_debugfs_root);
+
+	return 0;
+}
+
+void
+nouveau_module_debugfs_fini(void)
+{
+	debugfs_remove(nouveau_debugfs_root);
+}
diff --git a/drivers/gpu/drm/nouveau/nouveau_debugfs.h b/drivers/gpu/drm/nouveau/nouveau_debugfs.h
index 77f0323b38ba..b7617b344ee2 100644
--- a/drivers/gpu/drm/nouveau/nouveau_debugfs.h
+++ b/drivers/gpu/drm/nouveau/nouveau_debugfs.h
@@ -21,6 +21,11 @@ nouveau_debugfs(struct drm_device *dev)
 extern void  nouveau_drm_debugfs_init(struct drm_minor *);
 extern int  nouveau_debugfs_init(struct nouveau_drm *);
 extern void nouveau_debugfs_fini(struct nouveau_drm *);
+
+extern struct dentry *nouveau_debugfs_root;
+
+int  nouveau_module_debugfs_init(void);
+void nouveau_module_debugfs_fini(void);
 #else
 static inline void
 nouveau_drm_debugfs_init(struct drm_minor *minor)
@@ -37,6 +42,17 @@ nouveau_debugfs_fini(struct nouveau_drm *drm)
 {
 }
 
+static inline int
+nouveau_module_debugfs_init(void)
+{
+	return 0;
+}
+
+static inline void
+nouveau_module_debugfs_fini(void)
+{
+}
+
 #endif
 
 #endif
diff --git a/drivers/gpu/drm/nouveau/nouveau_drm.c b/drivers/gpu/drm/nouveau/nouveau_drm.c
index a99c1d9855c9..911c57a0654e 100644
--- a/drivers/gpu/drm/nouveau/nouveau_drm.c
+++ b/drivers/gpu/drm/nouveau/nouveau_drm.c
@@ -113,6 +113,10 @@ static struct drm_driver driver_stub;
 static struct drm_driver driver_pci;
 static struct drm_driver driver_platform;
 
+#ifdef CONFIG_DEBUG_FS
+struct dentry *nouveau_debugfs_root;
+#endif
+
 static u64
 nouveau_pci_name(struct pci_dev *pdev)
 {
@@ -1423,6 +1427,8 @@ nouveau_platform_device_create(const struct nvkm_device_tegra_func *func,
 static int __init
 nouveau_drm_init(void)
 {
+	int ret;
+
 	driver_pci = driver_stub;
 	driver_platform = driver_stub;
 
@@ -1436,6 +1442,10 @@ nouveau_drm_init(void)
 	if (!nouveau_modeset)
 		return 0;
 
+	ret = nouveau_module_debugfs_init();
+	if (ret)
+		return ret;
+
 #ifdef CONFIG_NOUVEAU_PLATFORM_DRIVER
 	platform_driver_register(&nouveau_platform_driver);
 #endif
@@ -1444,10 +1454,14 @@ nouveau_drm_init(void)
 	nouveau_backlight_ctor();
 
 #ifdef CONFIG_PCI
-	return pci_register_driver(&nouveau_drm_pci_driver);
-#else
-	return 0;
+	ret = pci_register_driver(&nouveau_drm_pci_driver);
+	if (ret) {
+		nouveau_module_debugfs_fini();
+		return ret;
+	}
 #endif
+
+	return 0;
 }
 
 static void __exit
@@ -1467,6 +1481,8 @@ nouveau_drm_exit(void)
 #endif
 	if (IS_ENABLED(CONFIG_DRM_NOUVEAU_SVM))
 		mmu_notifier_synchronize();
+
+	nouveau_module_debugfs_fini();
 }
 
 module_init(nouveau_drm_init);
-- 
2.47.0

