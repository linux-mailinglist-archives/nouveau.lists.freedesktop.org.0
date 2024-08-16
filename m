Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E844954A8E
	for <lists+nouveau@lfdr.de>; Fri, 16 Aug 2024 14:58:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3170110E7C0;
	Fri, 16 Aug 2024 12:54:52 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A17B710E74D;
 Fri, 16 Aug 2024 12:54:42 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 6B797200BB;
 Fri, 16 Aug 2024 12:54:41 +0000 (UTC)
Authentication-Results: smtp-out2.suse.de;
	none
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 27F0813ACA;
 Fri, 16 Aug 2024 12:54:41 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id qCVXCBFMv2bdbgAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Fri, 16 Aug 2024 12:54:41 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: daniel@ffwll.ch, airlied@gmail.com, jfalempe@redhat.com, javierm@redhat.com
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 86/86] drm/fb-helper: Remove struct drm_fb_helper.fb_probe
Date: Fri, 16 Aug 2024 14:23:52 +0200
Message-ID: <20240816125408.310253-87-tzimmermann@suse.de>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240816125408.310253-1-tzimmermann@suse.de>
References: <20240816125408.310253-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Pre-Result: action=no action; module=replies;
 Message is reply to one we originated
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Spam-Level: 
X-Spamd-Result: default: False [-4.00 / 50.00];
	REPLY(-4.00)[]
X-Spam-Flag: NO
X-Spam-Score: -4.00
X-Rspamd-Queue-Id: 6B797200BB
X-Rspamd-Action: no action
X-Rspamd-Pre-Result: action=no action; module=replies;
 Message is reply to one we originated
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

The callback fb_probe in struct drm_fb_helper is unused. Remove it.
New drivers should set struct drm_driver.fbdev_probe instead and call
drm_client_setup() to instantiate in-kernel DRM clients.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/drm_fb_helper.c |  8 ++++----
 include/drm/drm_fb_helper.h     | 17 -----------------
 2 files changed, 4 insertions(+), 21 deletions(-)

diff --git a/drivers/gpu/drm/drm_fb_helper.c b/drivers/gpu/drm/drm_fb_helper.c
index 92926cb02dfb..4968676a88a9 100644
--- a/drivers/gpu/drm/drm_fb_helper.c
+++ b/drivers/gpu/drm/drm_fb_helper.c
@@ -1625,6 +1625,9 @@ static int drm_fb_helper_single_fb_probe(struct drm_fb_helper *fb_helper)
 	struct fb_info *info;
 	int ret;
 
+	if (drm_WARN_ON(dev, !dev->driver->fbdev_probe))
+		return -EINVAL;
+
 	ret = drm_fb_helper_find_sizes(fb_helper, &sizes);
 	if (ret) {
 		/* First time: disable all crtc's.. */
@@ -1634,10 +1637,7 @@ static int drm_fb_helper_single_fb_probe(struct drm_fb_helper *fb_helper)
 	}
 
 	/* push down into drivers */
-	if (dev->driver->fbdev_probe)
-		ret = dev->driver->fbdev_probe(fb_helper, &sizes);
-	else
-		ret = (*fb_helper->funcs->fb_probe)(fb_helper, &sizes);
+	ret = dev->driver->fbdev_probe(fb_helper, &sizes);
 	if (ret < 0)
 		return ret;
 
diff --git a/include/drm/drm_fb_helper.h b/include/drm/drm_fb_helper.h
index 3dcb9a60e408..56cf0cae3321 100644
--- a/include/drm/drm_fb_helper.h
+++ b/include/drm/drm_fb_helper.h
@@ -69,23 +69,6 @@ struct drm_fb_helper_surface_size {
  * Driver callbacks used by the fbdev emulation helper library.
  */
 struct drm_fb_helper_funcs {
-	/**
-	 * @fb_probe:
-	 *
-	 * Driver callback to allocate and initialize the fbdev info structure.
-	 * Furthermore it also needs to allocate the DRM framebuffer used to
-	 * back the fbdev.
-	 *
-	 * This callback is mandatory.
-	 *
-	 * RETURNS:
-	 *
-	 * The driver should return 0 on success and a negative error code on
-	 * failure.
-	 */
-	int (*fb_probe)(struct drm_fb_helper *helper,
-			struct drm_fb_helper_surface_size *sizes);
-
 	/**
 	 * @fb_dirty:
 	 *
-- 
2.46.0

