Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C24F954A88
	for <lists+nouveau@lfdr.de>; Fri, 16 Aug 2024 14:57:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 50ABC10E7B5;
	Fri, 16 Aug 2024 12:54:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="OY0i4mq7";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="5qRX7JKB";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="OY0i4mq7";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="5qRX7JKB";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5FE9410E746;
 Fri, 16 Aug 2024 12:54:42 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 20A05200C0;
 Fri, 16 Aug 2024 12:54:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1723812881; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=MvTvCTnBFlTZmv0Bu58n7C+0hHbgqMHaDT4VMJ18cmY=;
 b=OY0i4mq7YNXxJyu81PJW2z00sTeayYyRZrCaiWPEpjsu+cia5mhWZt3NghV1rEkjlpBu+B
 ncySRc4kAgkcPmB4FNwHEJgwFG8VacnnF7gMbCY19bsUwB1hj/09tnnty7nwkJvUUiT71C
 uZE0/7gpqK7a/l7syP58T0ts29rRzCA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1723812881;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=MvTvCTnBFlTZmv0Bu58n7C+0hHbgqMHaDT4VMJ18cmY=;
 b=5qRX7JKBuMVHN9Wx0qkP9rdRxp5ufB8Vn5+rfLaaMd/uKrACMMcJ6yj05AZQpNytoy+YzV
 m+YC6szZOwkh8ODw==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1723812881; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=MvTvCTnBFlTZmv0Bu58n7C+0hHbgqMHaDT4VMJ18cmY=;
 b=OY0i4mq7YNXxJyu81PJW2z00sTeayYyRZrCaiWPEpjsu+cia5mhWZt3NghV1rEkjlpBu+B
 ncySRc4kAgkcPmB4FNwHEJgwFG8VacnnF7gMbCY19bsUwB1hj/09tnnty7nwkJvUUiT71C
 uZE0/7gpqK7a/l7syP58T0ts29rRzCA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1723812881;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=MvTvCTnBFlTZmv0Bu58n7C+0hHbgqMHaDT4VMJ18cmY=;
 b=5qRX7JKBuMVHN9Wx0qkP9rdRxp5ufB8Vn5+rfLaaMd/uKrACMMcJ6yj05AZQpNytoy+YzV
 m+YC6szZOwkh8ODw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id CB7C713A2F;
 Fri, 16 Aug 2024 12:54:40 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id 6K9kMBBMv2bdbgAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Fri, 16 Aug 2024 12:54:40 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: daniel@ffwll.ch, airlied@gmail.com, jfalempe@redhat.com, javierm@redhat.com
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: [PATCH 85/86] drm/omapdrm: Run DRM default client setup
Date: Fri, 16 Aug 2024 14:23:51 +0200
Message-ID: <20240816125408.310253-86-tzimmermann@suse.de>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240816125408.310253-1-tzimmermann@suse.de>
References: <20240816125408.310253-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Flag: NO
X-Spam-Score: -6.80
X-Spam-Level: 
X-Spamd-Result: default: False [-6.80 / 50.00]; REPLY(-4.00)[];
 BAYES_HAM(-3.00)[100.00%]; MID_CONTAINS_FROM(1.00)[];
 NEURAL_HAM_LONG(-1.00)[-1.000]; R_MISSING_CHARSET(0.50)[];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email,suse.de:mid];
 RCVD_VIA_SMTP_AUTH(0.00)[]; FROM_HAS_DN(0.00)[];
 ARC_NA(0.00)[]; TO_DN_SOME(0.00)[]; MIME_TRACE(0.00)[0:+];
 FROM_EQ_ENVFROM(0.00)[];
 FREEMAIL_TO(0.00)[ffwll.ch,gmail.com,redhat.com];
 RCPT_COUNT_SEVEN(0.00)[11]; RCVD_COUNT_TWO(0.00)[2];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; RCVD_TLS_ALL(0.00)[];
 FUZZY_BLOCKED(0.00)[rspamd.com];
 R_RATELIMIT(0.00)[to_ip_from(RLw9gjjhh8cousxs3wi4trssza)];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FREEMAIL_ENVRCPT(0.00)[gmail.com]
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

Rework fbdev probing to support fbdev_probe in struct drm_driver
and remove the old fb_probe callback. Provide an initializer macro
for struct drm_driver that sets the callback according to the kernel
configuration.

Call drm_client_setup() to run the kernel's default client setup
for DRM. Set fbdev_probe in struct drm_driver, so that the client
setup can start the common fbdev client.

The omapdrm driver specifies a preferred color mode of 32. As this
is the default if no format has been given, leave it out entirely.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
---
 drivers/gpu/drm/omapdrm/omap_drv.c   |   1 +
 drivers/gpu/drm/omapdrm/omap_fbdev.c | 131 ++++++---------------------
 drivers/gpu/drm/omapdrm/omap_fbdev.h |   8 ++
 3 files changed, 38 insertions(+), 102 deletions(-)

diff --git a/drivers/gpu/drm/omapdrm/omap_drv.c b/drivers/gpu/drm/omapdrm/omap_drv.c
index 6598c9c08ba1..d6b368fa1722 100644
--- a/drivers/gpu/drm/omapdrm/omap_drv.c
+++ b/drivers/gpu/drm/omapdrm/omap_drv.c
@@ -647,6 +647,7 @@ static const struct drm_driver omap_drm_driver = {
 	.gem_prime_import = omap_gem_prime_import,
 	.dumb_create = omap_gem_dumb_create,
 	.dumb_map_offset = omap_gem_dumb_map_offset,
+	OMAP_FBDEV_DRIVER_OPS,
 	.ioctls = ioctls,
 	.num_ioctls = DRM_OMAP_NUM_IOCTLS,
 	.fops = &omapdriver_fops,
diff --git a/drivers/gpu/drm/omapdrm/omap_fbdev.c b/drivers/gpu/drm/omapdrm/omap_fbdev.c
index 044e80403c3b..f4bd0c6e3f34 100644
--- a/drivers/gpu/drm/omapdrm/omap_fbdev.c
+++ b/drivers/gpu/drm/omapdrm/omap_fbdev.c
@@ -6,6 +6,7 @@
 
 #include <linux/fb.h>
 
+#include <drm/drm_client_setup.h>
 #include <drm/drm_drv.h>
 #include <drm/drm_crtc_helper.h>
 #include <drm/drm_fb_helper.h>
@@ -124,8 +125,32 @@ static const struct fb_ops omap_fb_ops = {
 	.fb_destroy	= omap_fbdev_fb_destroy,
 };
 
-static int omap_fbdev_create(struct drm_fb_helper *helper,
-		struct drm_fb_helper_surface_size *sizes)
+static int omap_fbdev_dirty(struct drm_fb_helper *helper, struct drm_clip_rect *clip)
+{
+	if (!(clip->x1 < clip->x2 && clip->y1 < clip->y2))
+		return 0;
+
+	if (helper->fb->funcs->dirty)
+		return helper->fb->funcs->dirty(helper->fb, NULL, 0, 0, clip, 1);
+
+	return 0;
+}
+
+static const struct drm_fb_helper_funcs omap_fbdev_helper_funcs = {
+	.fb_dirty = omap_fbdev_dirty,
+};
+
+static struct drm_fb_helper *get_fb(struct fb_info *fbi)
+{
+	if (!fbi || strcmp(fbi->fix.id, MODULE_NAME)) {
+		/* these are not the fb's you're looking for */
+		return NULL;
+	}
+	return fbi->par;
+}
+
+int omap_fbdev_driver_fbdev_probe(struct drm_fb_helper *helper,
+				  struct drm_fb_helper_surface_size *sizes)
 {
 	struct drm_device *dev = helper->dev;
 	struct omap_drm_private *priv = dev->dev_private;
@@ -207,6 +232,7 @@ static int omap_fbdev_create(struct drm_fb_helper *helper,
 
 	DBG("fbi=%p, dev=%p", fbi, dev);
 
+	helper->funcs = &omap_fbdev_helper_funcs;
 	helper->fb = fb;
 
 	fbi->fbops = &omap_fb_ops;
@@ -253,94 +279,10 @@ static int omap_fbdev_create(struct drm_fb_helper *helper,
 	return ret;
 }
 
-static int omap_fbdev_dirty(struct drm_fb_helper *helper, struct drm_clip_rect *clip)
-{
-	if (!(clip->x1 < clip->x2 && clip->y1 < clip->y2))
-		return 0;
-
-	if (helper->fb->funcs->dirty)
-		return helper->fb->funcs->dirty(helper->fb, NULL, 0, 0, clip, 1);
-
-	return 0;
-}
-
-static const struct drm_fb_helper_funcs omap_fb_helper_funcs = {
-	.fb_probe = omap_fbdev_create,
-	.fb_dirty = omap_fbdev_dirty,
-};
-
-static struct drm_fb_helper *get_fb(struct fb_info *fbi)
-{
-	if (!fbi || strcmp(fbi->fix.id, MODULE_NAME)) {
-		/* these are not the fb's you're looking for */
-		return NULL;
-	}
-	return fbi->par;
-}
-
-/*
- * struct drm_client
- */
-
-static void omap_fbdev_client_unregister(struct drm_client_dev *client)
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
-static int omap_fbdev_client_restore(struct drm_client_dev *client)
-{
-	drm_fb_helper_lastclose(client->dev);
-
-	return 0;
-}
-
-static int omap_fbdev_client_hotplug(struct drm_client_dev *client)
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
-	ret = drm_fb_helper_initial_config(fb_helper);
-	if (ret)
-		goto err_drm_fb_helper_fini;
-
-	return 0;
-
-err_drm_fb_helper_fini:
-	drm_fb_helper_fini(fb_helper);
-err_drm_err:
-	drm_err(dev, "Failed to setup fbdev emulation (ret=%d)\n", ret);
-	return ret;
-}
-
-static const struct drm_client_funcs omap_fbdev_client_funcs = {
-	.owner		= THIS_MODULE,
-	.unregister	= omap_fbdev_client_unregister,
-	.restore	= omap_fbdev_client_restore,
-	.hotplug	= omap_fbdev_client_hotplug,
-};
-
 void omap_fbdev_setup(struct drm_device *dev)
 {
 	struct omap_drm_private *priv = dev->dev_private;
 	struct omap_fbdev *fbdev;
-	struct drm_fb_helper *helper;
-	int ret;
 
 	drm_WARN(dev, !dev->registered, "Device has not been registered.\n");
 	drm_WARN(dev, dev->fb_helper, "fb_helper is already set!\n");
@@ -353,20 +295,5 @@ void omap_fbdev_setup(struct drm_device *dev)
 
 	priv->fbdev = fbdev;
 
-	helper = kzalloc(sizeof(*helper), GFP_KERNEL);
-	if (!helper)
-		return;
-	drm_fb_helper_prepare(dev, helper, 32, &omap_fb_helper_funcs);
-
-	ret = drm_client_init(dev, &helper->client, "fbdev", &omap_fbdev_client_funcs);
-	if (ret)
-		goto err_drm_client_init;
-
-	drm_client_register(&helper->client);
-
-	return;
-
-err_drm_client_init:
-	drm_fb_helper_unprepare(helper);
-	kfree(helper);
+	drm_client_setup(dev, NULL);
 }
diff --git a/drivers/gpu/drm/omapdrm/omap_fbdev.h b/drivers/gpu/drm/omapdrm/omap_fbdev.h
index 74c691a8d45f..283e35b42ada 100644
--- a/drivers/gpu/drm/omapdrm/omap_fbdev.h
+++ b/drivers/gpu/drm/omapdrm/omap_fbdev.h
@@ -10,10 +10,18 @@
 #define __OMAPDRM_FBDEV_H__
 
 struct drm_device;
+struct drm_fb_helper;
+struct drm_fb_helper_surface_size;
 
 #ifdef CONFIG_DRM_FBDEV_EMULATION
+int omap_fbdev_driver_fbdev_probe(struct drm_fb_helper *helper,
+				  struct drm_fb_helper_surface_size *sizes);
+#define OMAP_FBDEV_DRIVER_OPS \
+	.fbdev_probe = omap_fbdev_driver_fbdev_probe
 void omap_fbdev_setup(struct drm_device *dev);
 #else
+#define OMAP_FBDEV_DRIVER_OPS \
+	.fbdev_probe = NULL
 static inline void omap_fbdev_setup(struct drm_device *dev)
 {
 }
-- 
2.46.0

