Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A99859717F5
	for <lists+nouveau@lfdr.de>; Mon,  9 Sep 2024 13:39:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 864E410E491;
	Mon,  9 Sep 2024 11:37:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="DdLnB/tz";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="KzFN1r8s";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="DdLnB/tz";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="KzFN1r8s";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A38910E461;
 Mon,  9 Sep 2024 11:37:03 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 17B6721BEF;
 Mon,  9 Sep 2024 11:37:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1725881822; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xxT3B7xtcZppaXc8v/YZRMvAeX62wGRvdf+0xZfDE5E=;
 b=DdLnB/tzZJ5dj0x3+gmusrTrLFqUHe0Jgm8aSVZpIz1EnVucfj9/PwNZQbFw2v3poOiwVW
 8hvU92bTJWj63KqzgrBGF2jzy2rOawP5anWlUpJ+CWxoMtHx/gzyj+mG2eqmGeqjuWATlV
 mF4MMdMrHApeDreQMckzk68/zcbCrNM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1725881822;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xxT3B7xtcZppaXc8v/YZRMvAeX62wGRvdf+0xZfDE5E=;
 b=KzFN1r8sMzMypANKkbQxqTtW1UeIHE9L8V/ser76+/9OSJrJw05lHhTFkdrBIJ5h+vven2
 agmfCl6kOyCQPyCQ==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1725881822; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xxT3B7xtcZppaXc8v/YZRMvAeX62wGRvdf+0xZfDE5E=;
 b=DdLnB/tzZJ5dj0x3+gmusrTrLFqUHe0Jgm8aSVZpIz1EnVucfj9/PwNZQbFw2v3poOiwVW
 8hvU92bTJWj63KqzgrBGF2jzy2rOawP5anWlUpJ+CWxoMtHx/gzyj+mG2eqmGeqjuWATlV
 mF4MMdMrHApeDreQMckzk68/zcbCrNM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1725881822;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xxT3B7xtcZppaXc8v/YZRMvAeX62wGRvdf+0xZfDE5E=;
 b=KzFN1r8sMzMypANKkbQxqTtW1UeIHE9L8V/ser76+/9OSJrJw05lHhTFkdrBIJ5h+vven2
 agmfCl6kOyCQPyCQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id CF52A13312;
 Mon,  9 Sep 2024 11:37:01 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id 2I5dMd3d3malNAAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Mon, 09 Sep 2024 11:37:01 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: simona@ffwll.ch, airlied@gmail.com, jfalempe@redhat.com, javierm@redhat.com
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH v4 64/80] drm/fbdev-ttm: Support struct drm_driver.fbdev_probe
Date: Mon,  9 Sep 2024 13:31:10 +0200
Message-ID: <20240909113633.595465-65-tzimmermann@suse.de>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240909113633.595465-1-tzimmermann@suse.de>
References: <20240909113633.595465-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Level: 
X-Spamd-Result: default: False [-2.80 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 MID_CONTAINS_FROM(1.00)[]; NEURAL_HAM_LONG(-1.00)[-1.000];
 R_MISSING_CHARSET(0.50)[]; NEURAL_HAM_SHORT(-0.20)[-1.000];
 MIME_GOOD(-0.10)[text/plain];
 FREEMAIL_TO(0.00)[ffwll.ch,gmail.com,redhat.com];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; FUZZY_BLOCKED(0.00)[rspamd.com];
 MIME_TRACE(0.00)[0:+]; ARC_NA(0.00)[];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 R_RATELIMIT(0.00)[to(RLbwen1niosrcqbxsafh1),to_ip_from(RLqirfcw6gnbcr9a9yhi49fhi6)];
 TO_DN_SOME(0.00)[]; FROM_EQ_ENVFROM(0.00)[];
 FROM_HAS_DN(0.00)[]; RCVD_TLS_ALL(0.00)[];
 RCVD_COUNT_TWO(0.00)[2]; RCPT_COUNT_SEVEN(0.00)[9];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email,suse.de:mid];
 RCVD_VIA_SMTP_AUTH(0.00)[]; FREEMAIL_ENVRCPT(0.00)[gmail.com]
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

Rework fbdev probing to support fbdev_probe in struct drm_driver
and reimplement the old fb_probe callback on top of it. Provide an
initializer macro for struct drm_driver that sets the callback
according to the kernel configuration.

This change allows the common fbdev client to run on top of TTM-
based DRM drivers.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Acked-by: Javier Martinez Canillas <javierm@redhat.com>
---
 drivers/gpu/drm/drm_fbdev_ttm.c | 142 +++++++++++++++++---------------
 include/drm/drm_fbdev_ttm.h     |  13 +++
 2 files changed, 90 insertions(+), 65 deletions(-)

diff --git a/drivers/gpu/drm/drm_fbdev_ttm.c b/drivers/gpu/drm/drm_fbdev_ttm.c
index 119ffb28aaf9..d799cbe944cd 100644
--- a/drivers/gpu/drm/drm_fbdev_ttm.c
+++ b/drivers/gpu/drm/drm_fbdev_ttm.c
@@ -71,71 +71,7 @@ static const struct fb_ops drm_fbdev_ttm_fb_ops = {
 static int drm_fbdev_ttm_helper_fb_probe(struct drm_fb_helper *fb_helper,
 					     struct drm_fb_helper_surface_size *sizes)
 {
-	struct drm_client_dev *client = &fb_helper->client;
-	struct drm_device *dev = fb_helper->dev;
-	struct drm_client_buffer *buffer;
-	struct fb_info *info;
-	size_t screen_size;
-	void *screen_buffer;
-	u32 format;
-	int ret;
-
-	drm_dbg_kms(dev, "surface width(%d), height(%d) and bpp(%d)\n",
-		    sizes->surface_width, sizes->surface_height,
-		    sizes->surface_bpp);
-
-	format = drm_driver_legacy_fb_format(dev, sizes->surface_bpp,
-					     sizes->surface_depth);
-	buffer = drm_client_framebuffer_create(client, sizes->surface_width,
-					       sizes->surface_height, format);
-	if (IS_ERR(buffer))
-		return PTR_ERR(buffer);
-
-	fb_helper->buffer = buffer;
-	fb_helper->fb = buffer->fb;
-
-	screen_size = buffer->gem->size;
-	screen_buffer = vzalloc(screen_size);
-	if (!screen_buffer) {
-		ret = -ENOMEM;
-		goto err_drm_client_framebuffer_delete;
-	}
-
-	info = drm_fb_helper_alloc_info(fb_helper);
-	if (IS_ERR(info)) {
-		ret = PTR_ERR(info);
-		goto err_vfree;
-	}
-
-	drm_fb_helper_fill_info(info, fb_helper, sizes);
-
-	info->fbops = &drm_fbdev_ttm_fb_ops;
-
-	/* screen */
-	info->flags |= FBINFO_VIRTFB | FBINFO_READS_FAST;
-	info->screen_buffer = screen_buffer;
-	info->fix.smem_len = screen_size;
-
-	/* deferred I/O */
-	fb_helper->fbdefio.delay = HZ / 20;
-	fb_helper->fbdefio.deferred_io = drm_fb_helper_deferred_io;
-
-	info->fbdefio = &fb_helper->fbdefio;
-	ret = fb_deferred_io_init(info);
-	if (ret)
-		goto err_drm_fb_helper_release_info;
-
-	return 0;
-
-err_drm_fb_helper_release_info:
-	drm_fb_helper_release_info(fb_helper);
-err_vfree:
-	vfree(screen_buffer);
-err_drm_client_framebuffer_delete:
-	fb_helper->fb = NULL;
-	fb_helper->buffer = NULL;
-	drm_client_framebuffer_delete(buffer);
-	return ret;
+	return drm_fbdev_ttm_driver_fbdev_probe(fb_helper, sizes);
 }
 
 static void drm_fbdev_ttm_damage_blit_real(struct drm_fb_helper *fb_helper,
@@ -240,6 +176,82 @@ static const struct drm_fb_helper_funcs drm_fbdev_ttm_helper_funcs = {
 	.fb_dirty = drm_fbdev_ttm_helper_fb_dirty,
 };
 
+/*
+ * struct drm_driver
+ */
+
+int drm_fbdev_ttm_driver_fbdev_probe(struct drm_fb_helper *fb_helper,
+				     struct drm_fb_helper_surface_size *sizes)
+{
+	struct drm_client_dev *client = &fb_helper->client;
+	struct drm_device *dev = fb_helper->dev;
+	struct drm_client_buffer *buffer;
+	struct fb_info *info;
+	size_t screen_size;
+	void *screen_buffer;
+	u32 format;
+	int ret;
+
+	drm_dbg_kms(dev, "surface width(%d), height(%d) and bpp(%d)\n",
+		    sizes->surface_width, sizes->surface_height,
+		    sizes->surface_bpp);
+
+	format = drm_driver_legacy_fb_format(dev, sizes->surface_bpp,
+					     sizes->surface_depth);
+	buffer = drm_client_framebuffer_create(client, sizes->surface_width,
+					       sizes->surface_height, format);
+	if (IS_ERR(buffer))
+		return PTR_ERR(buffer);
+
+	fb_helper->funcs = &drm_fbdev_ttm_helper_funcs;
+	fb_helper->buffer = buffer;
+	fb_helper->fb = buffer->fb;
+
+	screen_size = buffer->gem->size;
+	screen_buffer = vzalloc(screen_size);
+	if (!screen_buffer) {
+		ret = -ENOMEM;
+		goto err_drm_client_framebuffer_delete;
+	}
+
+	info = drm_fb_helper_alloc_info(fb_helper);
+	if (IS_ERR(info)) {
+		ret = PTR_ERR(info);
+		goto err_vfree;
+	}
+
+	drm_fb_helper_fill_info(info, fb_helper, sizes);
+
+	info->fbops = &drm_fbdev_ttm_fb_ops;
+
+	/* screen */
+	info->flags |= FBINFO_VIRTFB | FBINFO_READS_FAST;
+	info->screen_buffer = screen_buffer;
+	info->fix.smem_len = screen_size;
+
+	/* deferred I/O */
+	fb_helper->fbdefio.delay = HZ / 20;
+	fb_helper->fbdefio.deferred_io = drm_fb_helper_deferred_io;
+
+	info->fbdefio = &fb_helper->fbdefio;
+	ret = fb_deferred_io_init(info);
+	if (ret)
+		goto err_drm_fb_helper_release_info;
+
+	return 0;
+
+err_drm_fb_helper_release_info:
+	drm_fb_helper_release_info(fb_helper);
+err_vfree:
+	vfree(screen_buffer);
+err_drm_client_framebuffer_delete:
+	fb_helper->fb = NULL;
+	fb_helper->buffer = NULL;
+	drm_client_framebuffer_delete(buffer);
+	return ret;
+}
+EXPORT_SYMBOL(drm_fbdev_ttm_driver_fbdev_probe);
+
 static void drm_fbdev_ttm_client_unregister(struct drm_client_dev *client)
 {
 	struct drm_fb_helper *fb_helper = drm_fb_helper_from_client(client);
diff --git a/include/drm/drm_fbdev_ttm.h b/include/drm/drm_fbdev_ttm.h
index 9e6c3bdf3537..243685d02eb1 100644
--- a/include/drm/drm_fbdev_ttm.h
+++ b/include/drm/drm_fbdev_ttm.h
@@ -3,11 +3,24 @@
 #ifndef DRM_FBDEV_TTM_H
 #define DRM_FBDEV_TTM_H
 
+#include <linux/stddef.h>
+
 struct drm_device;
+struct drm_fb_helper;
+struct drm_fb_helper_surface_size;
 
 #ifdef CONFIG_DRM_FBDEV_EMULATION
+int drm_fbdev_ttm_driver_fbdev_probe(struct drm_fb_helper *fb_helper,
+				     struct drm_fb_helper_surface_size *sizes);
+
+#define DRM_FBDEV_TTM_DRIVER_OPS \
+	.fbdev_probe = drm_fbdev_ttm_driver_fbdev_probe
+
 void drm_fbdev_ttm_setup(struct drm_device *dev, unsigned int preferred_bpp);
 #else
+#define DRM_FBDEV_TTM_DRIVER_OPS \
+	.fbdev_probe = NULL
+
 static inline void drm_fbdev_ttm_setup(struct drm_device *dev, unsigned int preferred_bpp)
 { }
 #endif
-- 
2.46.0

