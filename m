Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D5EF97171D
	for <lists+nouveau@lfdr.de>; Mon,  9 Sep 2024 13:37:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A40810E3A1;
	Mon,  9 Sep 2024 11:36:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="HYBtzPQb";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="lHiUgXQU";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="HYBtzPQb";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="lHiUgXQU";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8164810E37C;
 Mon,  9 Sep 2024 11:36:40 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 18D3B1F7B7;
 Mon,  9 Sep 2024 11:36:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1725881799; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XS+ckVVnRgJoRgkpzuBUKeGdZ3Genb5xJvB9E7pFLNo=;
 b=HYBtzPQbWNeYYqHS0nC6gu9dBKQBjyiyiu+BjIBCVs2MWR87+I5RYQVlX29VwuXI19VkTe
 Y2EXjCHlCUx1tDnazhBC9P2w//oRyhf53U517qawrqeeFqpIoCHJ3KLuplqqHnRP0MCAaA
 NO/yz/32+ZHd+AN+tXw2LLbLBreuqQU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1725881799;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XS+ckVVnRgJoRgkpzuBUKeGdZ3Genb5xJvB9E7pFLNo=;
 b=lHiUgXQUAtWBM1kUonZeTZoipoZK53Gsc1bJyzPpkdjdRd9dLfGKTeQ27DXXgAvQXBOE2z
 SW0l4LJsjtGediCQ==
Authentication-Results: smtp-out2.suse.de;
 dkim=pass header.d=suse.de header.s=susede2_rsa header.b=HYBtzPQb;
 dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=lHiUgXQU
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1725881799; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XS+ckVVnRgJoRgkpzuBUKeGdZ3Genb5xJvB9E7pFLNo=;
 b=HYBtzPQbWNeYYqHS0nC6gu9dBKQBjyiyiu+BjIBCVs2MWR87+I5RYQVlX29VwuXI19VkTe
 Y2EXjCHlCUx1tDnazhBC9P2w//oRyhf53U517qawrqeeFqpIoCHJ3KLuplqqHnRP0MCAaA
 NO/yz/32+ZHd+AN+tXw2LLbLBreuqQU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1725881799;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XS+ckVVnRgJoRgkpzuBUKeGdZ3Genb5xJvB9E7pFLNo=;
 b=lHiUgXQUAtWBM1kUonZeTZoipoZK53Gsc1bJyzPpkdjdRd9dLfGKTeQ27DXXgAvQXBOE2z
 SW0l4LJsjtGediCQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id CED3613A84;
 Mon,  9 Sep 2024 11:36:38 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id mFk3Mcbd3malNAAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Mon, 09 Sep 2024 11:36:38 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: simona@ffwll.ch, airlied@gmail.com, jfalempe@redhat.com, javierm@redhat.com
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH v4 03/80] drm/fbdev: Add memory-agnostic fbdev client
Date: Mon,  9 Sep 2024 13:30:09 +0200
Message-ID: <20240909113633.595465-4-tzimmermann@suse.de>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240909113633.595465-1-tzimmermann@suse.de>
References: <20240909113633.595465-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 18D3B1F7B7
X-Spam-Level: 
X-Spamd-Result: default: False [-3.01 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 MID_CONTAINS_FROM(1.00)[]; NEURAL_HAM_LONG(-1.00)[-1.000];
 R_MISSING_CHARSET(0.50)[];
 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 MX_GOOD(-0.01)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email,suse.de:dkim,suse.de:mid];
 RCVD_VIA_SMTP_AUTH(0.00)[]; ARC_NA(0.00)[];
 RCVD_TLS_ALL(0.00)[]; MIME_TRACE(0.00)[0:+];
 FREEMAIL_ENVRCPT(0.00)[gmail.com]; TO_DN_SOME(0.00)[];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; FUZZY_BLOCKED(0.00)[rspamd.com];
 RCPT_COUNT_SEVEN(0.00)[9];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 RCVD_COUNT_TWO(0.00)[2];
 FREEMAIL_TO(0.00)[ffwll.ch,gmail.com,redhat.com];
 FROM_EQ_ENVFROM(0.00)[]; FROM_HAS_DN(0.00)[];
 R_RATELIMIT(0.00)[to_ip_from(RLqtkr6cif1ebgurukgmwdm7xc)];
 DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Score: -3.01
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

Add an fbdev client that can work with any memory manager. The
client implementation is the same as existing code in fbdev-dma or
fbdev-shmem.

Provide struct drm_driver.fbdev_probe for the new client to allocate
the surface GEM buffer. The new callback replaces fb_probe of struct
drm_fb_helper_funcs, which does the same.

To use the new client, DRM drivers set fbdev_probe in their struct
drm_driver instance and call drm_fbdev_client_setup(). Probing and
creating the fbdev surface buffer is now independent from the other
operations in struct drm_fb_helper. For the pixel format, the fbdev
client either uses a specified format, the value in preferred_depth
or 32-bit RGB.

v2:
- test for struct drm_fb_helper.funcs for NULL (Sui)
- respect struct drm_mode_config.preferred_depth for default format

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>
---
 drivers/gpu/drm/Makefile           |   4 +-
 drivers/gpu/drm/drm_fb_helper.c    |  15 +--
 drivers/gpu/drm/drm_fbdev_client.c | 141 +++++++++++++++++++++++++++++
 include/drm/drm_drv.h              |  18 ++++
 include/drm/drm_fbdev_client.h     |  19 ++++
 5 files changed, 190 insertions(+), 7 deletions(-)
 create mode 100644 drivers/gpu/drm/drm_fbdev_client.c
 create mode 100644 include/drm/drm_fbdev_client.h

diff --git a/drivers/gpu/drm/Makefile b/drivers/gpu/drm/Makefile
index 784229d4504d..d7a684ae6a59 100644
--- a/drivers/gpu/drm/Makefile
+++ b/drivers/gpu/drm/Makefile
@@ -144,7 +144,9 @@ drm_kms_helper-y := \
 	drm_self_refresh_helper.o \
 	drm_simple_kms_helper.o
 drm_kms_helper-$(CONFIG_DRM_PANEL_BRIDGE) += bridge/panel.o
-drm_kms_helper-$(CONFIG_DRM_FBDEV_EMULATION) += drm_fb_helper.o
+drm_kms_helper-$(CONFIG_DRM_FBDEV_EMULATION) += \
+	drm_fbdev_client.o \
+	drm_fb_helper.o
 obj-$(CONFIG_DRM_KMS_HELPER) += drm_kms_helper.o
 
 #
diff --git a/drivers/gpu/drm/drm_fb_helper.c b/drivers/gpu/drm/drm_fb_helper.c
index 550fa69311cb..d5e8994345bb 100644
--- a/drivers/gpu/drm/drm_fb_helper.c
+++ b/drivers/gpu/drm/drm_fb_helper.c
@@ -492,8 +492,8 @@ EXPORT_SYMBOL(drm_fb_helper_init);
  * @fb_helper: driver-allocated fbdev helper
  *
  * A helper to alloc fb_info and the member cmap. Called by the driver
- * within the fb_probe fb_helper callback function. Drivers do not
- * need to release the allocated fb_info structure themselves, this is
+ * within the struct &drm_driver.fbdev_probe callback function. Drivers do
+ * not need to release the allocated fb_info structure themselves, this is
  * automatically done when calling drm_fb_helper_fini().
  *
  * RETURNS:
@@ -1612,7 +1612,7 @@ static int drm_fb_helper_find_sizes(struct drm_fb_helper *fb_helper,
 
 /*
  * Allocates the backing storage and sets up the fbdev info structure through
- * the ->fb_probe callback.
+ * the ->fbdev_probe callback.
  */
 static int drm_fb_helper_single_fb_probe(struct drm_fb_helper *fb_helper)
 {
@@ -1631,7 +1631,10 @@ static int drm_fb_helper_single_fb_probe(struct drm_fb_helper *fb_helper)
 	}
 
 	/* push down into drivers */
-	ret = (*fb_helper->funcs->fb_probe)(fb_helper, &sizes);
+	if (dev->driver->fbdev_probe)
+		ret = dev->driver->fbdev_probe(fb_helper, &sizes);
+	else if (fb_helper->funcs)
+		ret = fb_helper->funcs->fb_probe(fb_helper, &sizes);
 	if (ret < 0)
 		return ret;
 
@@ -1705,7 +1708,7 @@ static void drm_fb_helper_fill_var(struct fb_info *info,
  * instance and the drm framebuffer allocated in &drm_fb_helper.fb.
  *
  * Drivers should call this (or their equivalent setup code) from their
- * &drm_fb_helper_funcs.fb_probe callback after having allocated the fbdev
+ * &drm_driver.fbdev_probe callback after having allocated the fbdev
  * backing storage framebuffer.
  */
 void drm_fb_helper_fill_info(struct fb_info *info,
@@ -1861,7 +1864,7 @@ __drm_fb_helper_initial_config_and_unlock(struct drm_fb_helper *fb_helper)
  * Note that this also registers the fbdev and so allows userspace to call into
  * the driver through the fbdev interfaces.
  *
- * This function will call down into the &drm_fb_helper_funcs.fb_probe callback
+ * This function will call down into the &drm_driver.fbdev_probe callback
  * to let the driver allocate and initialize the fbdev info structure and the
  * drm framebuffer used to back the fbdev. drm_fb_helper_fill_info() is provided
  * as a helper to setup simple default values for the fbdev info structure.
diff --git a/drivers/gpu/drm/drm_fbdev_client.c b/drivers/gpu/drm/drm_fbdev_client.c
new file mode 100644
index 000000000000..a09382afe2fb
--- /dev/null
+++ b/drivers/gpu/drm/drm_fbdev_client.c
@@ -0,0 +1,141 @@
+// SPDX-License-Identifier: MIT
+
+#include <drm/drm_client.h>
+#include <drm/drm_crtc_helper.h>
+#include <drm/drm_drv.h>
+#include <drm/drm_fbdev_client.h>
+#include <drm/drm_fb_helper.h>
+#include <drm/drm_fourcc.h>
+#include <drm/drm_print.h>
+
+/*
+ * struct drm_client_funcs
+ */
+
+static void drm_fbdev_client_unregister(struct drm_client_dev *client)
+{
+	struct drm_fb_helper *fb_helper = drm_fb_helper_from_client(client);
+
+	if (fb_helper->info) {
+		drm_fb_helper_unregister_info(fb_helper);
+	} else {
+		drm_client_release(&fb_helper->client);
+		drm_fb_helper_unprepare(fb_helper);
+		kfree(fb_helper);
+	}
+}
+
+static int drm_fbdev_client_restore(struct drm_client_dev *client)
+{
+	drm_fb_helper_lastclose(client->dev);
+
+	return 0;
+}
+
+static int drm_fbdev_client_hotplug(struct drm_client_dev *client)
+{
+	struct drm_fb_helper *fb_helper = drm_fb_helper_from_client(client);
+	struct drm_device *dev = client->dev;
+	int ret;
+
+	if (dev->fb_helper)
+		return drm_fb_helper_hotplug_event(dev->fb_helper);
+
+	ret = drm_fb_helper_init(dev, fb_helper);
+	if (ret)
+		goto err_drm_err;
+
+	if (!drm_drv_uses_atomic_modeset(dev))
+		drm_helper_disable_unused_functions(dev);
+
+	ret = drm_fb_helper_initial_config(fb_helper);
+	if (ret)
+		goto err_drm_fb_helper_fini;
+
+	return 0;
+
+err_drm_fb_helper_fini:
+	drm_fb_helper_fini(fb_helper);
+err_drm_err:
+	drm_err(dev, "fbdev: Failed to setup emulation (ret=%d)\n", ret);
+	return ret;
+}
+
+static const struct drm_client_funcs drm_fbdev_client_funcs = {
+	.owner		= THIS_MODULE,
+	.unregister	= drm_fbdev_client_unregister,
+	.restore	= drm_fbdev_client_restore,
+	.hotplug	= drm_fbdev_client_hotplug,
+};
+
+/**
+ * drm_fbdev_client_setup() - Setup fbdev emulation
+ * @dev: DRM device
+ * @format: Preferred color format for the device. DRM_FORMAT_XRGB8888
+ *          is used if this is zero.
+ *
+ * This function sets up fbdev emulation. Restore, hotplug events and
+ * teardown are all taken care of. Drivers that do suspend/resume need
+ * to call drm_fb_helper_set_suspend_unlocked() themselves. Simple
+ * drivers might use drm_mode_config_helper_suspend().
+ *
+ * This function is safe to call even when there are no connectors present.
+ * Setup will be retried on the next hotplug event.
+ *
+ * The fbdev client is destroyed by drm_dev_unregister().
+ *
+ * Returns:
+ * 0 on success, or a negative errno code otherwise.
+ */
+int drm_fbdev_client_setup(struct drm_device *dev, const struct drm_format_info *format)
+{
+	struct drm_fb_helper *fb_helper;
+	unsigned int color_mode;
+	int ret;
+
+	/* TODO: Use format info throughout DRM */
+	if (format) {
+		unsigned int bpp = drm_format_info_bpp(format, 0);
+
+		switch (bpp) {
+		case 16:
+			color_mode = format->depth; // could also be 15
+			break;
+		default:
+			color_mode = bpp;
+		}
+	} else {
+		switch (dev->mode_config.preferred_depth) {
+		case 0:
+		case 24:
+			color_mode = 32;
+			break;
+		default:
+			color_mode = dev->mode_config.preferred_depth;
+		}
+	}
+
+	drm_WARN(dev, !dev->registered, "Device has not been registered.\n");
+	drm_WARN(dev, dev->fb_helper, "fb_helper is already set!\n");
+
+	fb_helper = kzalloc(sizeof(*fb_helper), GFP_KERNEL);
+	if (!fb_helper)
+		return -ENOMEM;
+	drm_fb_helper_prepare(dev, fb_helper, color_mode, NULL);
+
+	ret = drm_client_init(dev, &fb_helper->client, "fbdev", &drm_fbdev_client_funcs);
+	if (ret) {
+		drm_err(dev, "Failed to register client: %d\n", ret);
+		goto err_drm_client_init;
+	}
+
+	drm_client_register(&fb_helper->client);
+
+	return 0;
+
+err_drm_client_init:
+	drm_fb_helper_unprepare(fb_helper);
+	kfree(fb_helper);
+	return ret;
+}
+EXPORT_SYMBOL(drm_fbdev_client_setup);
diff --git a/include/drm/drm_drv.h b/include/drm/drm_drv.h
index 02ea4e3248fd..36a606af4ba1 100644
--- a/include/drm/drm_drv.h
+++ b/include/drm/drm_drv.h
@@ -34,6 +34,8 @@
 
 #include <drm/drm_device.h>
 
+struct drm_fb_helper;
+struct drm_fb_helper_surface_size;
 struct drm_file;
 struct drm_gem_object;
 struct drm_master;
@@ -366,6 +368,22 @@ struct drm_driver {
 			       struct drm_device *dev, uint32_t handle,
 			       uint64_t *offset);
 
+	/**
+	 * @fbdev_probe
+	 *
+	 * Allocates and initialize the fb_info structure for fbdev emulation.
+	 * Furthermore it also needs to allocate the DRM framebuffer used to
+	 * back the fbdev.
+	 *
+	 * This callback is mandatory for fbdev support.
+	 *
+	 * Returns:
+	 *
+	 * 0 on success ot a negative error code otherwise.
+	 */
+	int (*fbdev_probe)(struct drm_fb_helper *fbdev_helper,
+			   struct drm_fb_helper_surface_size *sizes);
+
 	/**
 	 * @show_fdinfo:
 	 *
diff --git a/include/drm/drm_fbdev_client.h b/include/drm/drm_fbdev_client.h
new file mode 100644
index 000000000000..e11a5614f127
--- /dev/null
+++ b/include/drm/drm_fbdev_client.h
@@ -0,0 +1,19 @@
+/* SPDX-License-Identifier: MIT */
+
+#ifndef DRM_FBDEV_CLIENT_H
+#define DRM_FBDEV_CLIENT_H
+
+struct drm_device;
+struct drm_format_info;
+
+#ifdef CONFIG_DRM_FBDEV_EMULATION
+int drm_fbdev_client_setup(struct drm_device *dev, const struct drm_format_info *format);
+#else
+static inline int drm_fbdev_client_setup(struct drm_device *dev,
+					 const struct drm_format_info *format)
+{
+	return 0;
+}
+#endif
+
+#endif
-- 
2.46.0

