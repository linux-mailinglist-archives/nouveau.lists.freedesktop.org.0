Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9731F97180F
	for <lists+nouveau@lfdr.de>; Mon,  9 Sep 2024 13:39:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7004C10E4A6;
	Mon,  9 Sep 2024 11:37:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="N7GCJMcx";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="DTUcshMw";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="N7GCJMcx";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="DTUcshMw";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 82E3010E432;
 Mon,  9 Sep 2024 11:36:58 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 21E6B1FC83;
 Mon,  9 Sep 2024 11:36:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1725881817; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nwcjN+ZZPkWWHxf2Mc6XweRmnrscIn70wQt5gJG+ZxI=;
 b=N7GCJMcx93ZhjQDtzlPyQunxbEuokt9Y5PJacOHgyIHOQ2M9mBmr9pfJQvymDH88Pbz4tk
 kHeFmSTpOh5TVN+lkDZhaSA0Blt9bMeX2YGoyk5dMYnMqPTh7I7LOGcG7NJrgcbm1Hxk7x
 jo3tw3Oa9qcjkkMNrUqWHFky+D+lQgQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1725881817;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nwcjN+ZZPkWWHxf2Mc6XweRmnrscIn70wQt5gJG+ZxI=;
 b=DTUcshMwBojg54EWRPMEgqoklnCI7fzr5DDKr3JLhdBviEVEvCo/Ba6kIdSLY0ikgv65v7
 68DldGvDpvrLvSBg==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1725881817; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nwcjN+ZZPkWWHxf2Mc6XweRmnrscIn70wQt5gJG+ZxI=;
 b=N7GCJMcx93ZhjQDtzlPyQunxbEuokt9Y5PJacOHgyIHOQ2M9mBmr9pfJQvymDH88Pbz4tk
 kHeFmSTpOh5TVN+lkDZhaSA0Blt9bMeX2YGoyk5dMYnMqPTh7I7LOGcG7NJrgcbm1Hxk7x
 jo3tw3Oa9qcjkkMNrUqWHFky+D+lQgQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1725881817;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nwcjN+ZZPkWWHxf2Mc6XweRmnrscIn70wQt5gJG+ZxI=;
 b=DTUcshMwBojg54EWRPMEgqoklnCI7fzr5DDKr3JLhdBviEVEvCo/Ba6kIdSLY0ikgv65v7
 68DldGvDpvrLvSBg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id D49E313A84;
 Mon,  9 Sep 2024 11:36:56 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id yBGPMtjd3malNAAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Mon, 09 Sep 2024 11:36:56 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: simona@ffwll.ch, airlied@gmail.com, jfalempe@redhat.com, javierm@redhat.com
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH v4 48/80] drm/fbdev-dma: Remove obsolete setup function
Date: Mon,  9 Sep 2024 13:30:54 +0200
Message-ID: <20240909113633.595465-49-tzimmermann@suse.de>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240909113633.595465-1-tzimmermann@suse.de>
References: <20240909113633.595465-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Level: 
X-Spamd-Result: default: False [-2.80 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 MID_CONTAINS_FROM(1.00)[]; NEURAL_HAM_LONG(-1.00)[-1.000];
 R_MISSING_CHARSET(0.50)[]; NEURAL_HAM_SHORT(-0.20)[-1.000];
 MIME_GOOD(-0.10)[text/plain]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 ARC_NA(0.00)[]; RCVD_VIA_SMTP_AUTH(0.00)[];
 FROM_EQ_ENVFROM(0.00)[]; FROM_HAS_DN(0.00)[];
 TO_DN_SOME(0.00)[]; MIME_TRACE(0.00)[0:+];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email,suse.de:mid];
 FREEMAIL_TO(0.00)[ffwll.ch,gmail.com,redhat.com];
 RCVD_TLS_ALL(0.00)[]; RCVD_COUNT_TWO(0.00)[2];
 RCPT_COUNT_SEVEN(0.00)[9]; FUZZY_BLOCKED(0.00)[rspamd.com];
 R_RATELIMIT(0.00)[to(RLbwen1niosrcqbxsafh1),to_ip_from(RLqirfcw6gnbcr9a9yhi49fhi6)];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FREEMAIL_ENVRCPT(0.00)[gmail.com]
X-Spam-Score: -2.80
X-Spam-Flag: NO
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

The old setup function drm_fbdev_dma_setup() is unused. Remove it and
its internal callbacks. New drivers should call drm_client_setup()
instead.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>
---
 drivers/gpu/drm/drm_fbdev_dma.c | 120 +-------------------------------
 include/drm/drm_fbdev_dma.h     |   7 --
 2 files changed, 1 insertion(+), 126 deletions(-)

diff --git a/drivers/gpu/drm/drm_fbdev_dma.c b/drivers/gpu/drm/drm_fbdev_dma.c
index 9ce754ebe18e..2343af1b09bc 100644
--- a/drivers/gpu/drm/drm_fbdev_dma.c
+++ b/drivers/gpu/drm/drm_fbdev_dma.c
@@ -2,15 +2,13 @@
 
 #include <linux/fb.h>
 
-#include <drm/drm_crtc_helper.h>
 #include <drm/drm_drv.h>
+#include <drm/drm_fbdev_dma.h>
 #include <drm/drm_fb_dma_helper.h>
 #include <drm/drm_fb_helper.h>
 #include <drm/drm_framebuffer.h>
 #include <drm/drm_gem_dma_helper.h>
 
-#include <drm/drm_fbdev_dma.h>
-
 /*
  * struct fb_ops
  */
@@ -102,12 +100,6 @@ static const struct fb_ops drm_fbdev_dma_deferred_fb_ops = {
  * struct drm_fb_helper
  */
 
-static int drm_fbdev_dma_helper_fb_probe(struct drm_fb_helper *fb_helper,
-					 struct drm_fb_helper_surface_size *sizes)
-{
-	return drm_fbdev_dma_driver_fbdev_probe(fb_helper, sizes);
-}
-
 static int drm_fbdev_dma_helper_fb_dirty(struct drm_fb_helper *helper,
 					 struct drm_clip_rect *clip)
 {
@@ -128,7 +120,6 @@ static int drm_fbdev_dma_helper_fb_dirty(struct drm_fb_helper *helper,
 }
 
 static const struct drm_fb_helper_funcs drm_fbdev_dma_helper_funcs = {
-	.fb_probe = drm_fbdev_dma_helper_fb_probe,
 	.fb_dirty = drm_fbdev_dma_helper_fb_dirty,
 };
 
@@ -246,112 +237,3 @@ int drm_fbdev_dma_driver_fbdev_probe(struct drm_fb_helper *fb_helper,
 	return ret;
 }
 EXPORT_SYMBOL(drm_fbdev_dma_driver_fbdev_probe);
-
-/*
- * struct drm_client_funcs
- */
-
-static void drm_fbdev_dma_client_unregister(struct drm_client_dev *client)
-{
-	struct drm_fb_helper *fb_helper = drm_fb_helper_from_client(client);
-
-	if (fb_helper->info) {
-		drm_fb_helper_unregister_info(fb_helper);
-	} else {
-		drm_client_release(&fb_helper->client);
-		drm_fb_helper_unprepare(fb_helper);
-		kfree(fb_helper);
-	}
-}
-
-static int drm_fbdev_dma_client_restore(struct drm_client_dev *client)
-{
-	drm_fb_helper_lastclose(client->dev);
-
-	return 0;
-}
-
-static int drm_fbdev_dma_client_hotplug(struct drm_client_dev *client)
-{
-	struct drm_fb_helper *fb_helper = drm_fb_helper_from_client(client);
-	struct drm_device *dev = client->dev;
-	int ret;
-
-	if (dev->fb_helper)
-		return drm_fb_helper_hotplug_event(dev->fb_helper);
-
-	ret = drm_fb_helper_init(dev, fb_helper);
-	if (ret)
-		goto err_drm_err;
-
-	if (!drm_drv_uses_atomic_modeset(dev))
-		drm_helper_disable_unused_functions(dev);
-
-	ret = drm_fb_helper_initial_config(fb_helper);
-	if (ret)
-		goto err_drm_fb_helper_fini;
-
-	return 0;
-
-err_drm_fb_helper_fini:
-	drm_fb_helper_fini(fb_helper);
-err_drm_err:
-	drm_err(dev, "fbdev-dma: Failed to setup generic emulation (ret=%d)\n", ret);
-	return ret;
-}
-
-static const struct drm_client_funcs drm_fbdev_dma_client_funcs = {
-	.owner		= THIS_MODULE,
-	.unregister	= drm_fbdev_dma_client_unregister,
-	.restore	= drm_fbdev_dma_client_restore,
-	.hotplug	= drm_fbdev_dma_client_hotplug,
-};
-
-/**
- * drm_fbdev_dma_setup() - Setup fbdev emulation for GEM DMA helpers
- * @dev: DRM device
- * @preferred_bpp: Preferred bits per pixel for the device.
- *                 32 is used if this is zero.
- *
- * This function sets up fbdev emulation for GEM DMA drivers that support
- * dumb buffers with a virtual address and that can be mmap'ed.
- * drm_fbdev_dma_setup() shall be called after the DRM driver registered
- * the new DRM device with drm_dev_register().
- *
- * Restore, hotplug events and teardown are all taken care of. Drivers that do
- * suspend/resume need to call drm_fb_helper_set_suspend_unlocked() themselves.
- * Simple drivers might use drm_mode_config_helper_suspend().
- *
- * This function is safe to call even when there are no connectors present.
- * Setup will be retried on the next hotplug event.
- *
- * The fbdev is destroyed by drm_dev_unregister().
- */
-void drm_fbdev_dma_setup(struct drm_device *dev, unsigned int preferred_bpp)
-{
-	struct drm_fb_helper *fb_helper;
-	int ret;
-
-	drm_WARN(dev, !dev->registered, "Device has not been registered.\n");
-	drm_WARN(dev, dev->fb_helper, "fb_helper is already set!\n");
-
-	fb_helper = kzalloc(sizeof(*fb_helper), GFP_KERNEL);
-	if (!fb_helper)
-		return;
-	drm_fb_helper_prepare(dev, fb_helper, preferred_bpp, &drm_fbdev_dma_helper_funcs);
-
-	ret = drm_client_init(dev, &fb_helper->client, "fbdev", &drm_fbdev_dma_client_funcs);
-	if (ret) {
-		drm_err(dev, "Failed to register client: %d\n", ret);
-		goto err_drm_client_init;
-	}
-
-	drm_client_register(&fb_helper->client);
-
-	return;
-
-err_drm_client_init:
-	drm_fb_helper_unprepare(fb_helper);
-	kfree(fb_helper);
-}
-EXPORT_SYMBOL(drm_fbdev_dma_setup);
diff --git a/include/drm/drm_fbdev_dma.h b/include/drm/drm_fbdev_dma.h
index 6ae4de46497c..fb3f2a9aa01a 100644
--- a/include/drm/drm_fbdev_dma.h
+++ b/include/drm/drm_fbdev_dma.h
@@ -3,7 +3,6 @@
 #ifndef DRM_FBDEV_DMA_H
 #define DRM_FBDEV_DMA_H
 
-struct drm_device;
 struct drm_fb_helper;
 struct drm_fb_helper_surface_size;
 
@@ -13,15 +12,9 @@ int drm_fbdev_dma_driver_fbdev_probe(struct drm_fb_helper *fb_helper,
 
 #define DRM_FBDEV_DMA_DRIVER_OPS \
 	.fbdev_probe = drm_fbdev_dma_driver_fbdev_probe
-
-void drm_fbdev_dma_setup(struct drm_device *dev, unsigned int preferred_bpp);
 #else
-static inline void drm_fbdev_dma_setup(struct drm_device *dev, unsigned int preferred_bpp)
-{ }
-
 #define DRM_FBDEV_DMA_DRIVER_OPS \
 	.fbdev_probe = NULL
-
 #endif
 
 #endif
-- 
2.46.0

