Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BB50954A7C
	for <lists+nouveau@lfdr.de>; Fri, 16 Aug 2024 14:57:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F017210E7AB;
	Fri, 16 Aug 2024 12:54:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="pD2WOm67";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="JoWohMzm";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="pD2WOm67";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="JoWohMzm";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 481C110E713;
 Fri, 16 Aug 2024 12:54:41 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 0826C22886;
 Fri, 16 Aug 2024 12:54:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1723812880; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6HRrHcB8H958v/SzDmsK+0XtQ5HzxMqAXtGUCIodP2g=;
 b=pD2WOm67NfjMvtJ2bDG/hG55prBj2TpHEylL2zpOER02ODP5gcasoJlS9B9nRrnY2BcvPY
 0faqtvvVdm52LtGO2lJo7UD1HgPAP3GATV3iNGKKTNyLlbWzRPU2PIYnbtqsxosEzkRYYX
 VWKBa5sLyA395yA71StaBJRoEbXom7o=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1723812880;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6HRrHcB8H958v/SzDmsK+0XtQ5HzxMqAXtGUCIodP2g=;
 b=JoWohMzmVForTf2ojBXpJSq1lBCmJnl4EJkYSTOl23PSI4MLut30Y7/5BLxONny3YDe+Fa
 3D0b3UHjRGD6y7AQ==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1723812880; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6HRrHcB8H958v/SzDmsK+0XtQ5HzxMqAXtGUCIodP2g=;
 b=pD2WOm67NfjMvtJ2bDG/hG55prBj2TpHEylL2zpOER02ODP5gcasoJlS9B9nRrnY2BcvPY
 0faqtvvVdm52LtGO2lJo7UD1HgPAP3GATV3iNGKKTNyLlbWzRPU2PIYnbtqsxosEzkRYYX
 VWKBa5sLyA395yA71StaBJRoEbXom7o=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1723812880;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6HRrHcB8H958v/SzDmsK+0XtQ5HzxMqAXtGUCIodP2g=;
 b=JoWohMzmVForTf2ojBXpJSq1lBCmJnl4EJkYSTOl23PSI4MLut30Y7/5BLxONny3YDe+Fa
 3D0b3UHjRGD6y7AQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 9A6A513ACA;
 Fri, 16 Aug 2024 12:54:39 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id QCF1JA9Mv2bdbgAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Fri, 16 Aug 2024 12:54:39 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: daniel@ffwll.ch, airlied@gmail.com, jfalempe@redhat.com, javierm@redhat.com
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Subject: [PATCH 82/86] drm/i915: Move custom hotplug code into separate
 callback
Date: Fri, 16 Aug 2024 14:23:48 +0200
Message-ID: <20240816125408.310253-83-tzimmermann@suse.de>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240816125408.310253-1-tzimmermann@suse.de>
References: <20240816125408.310253-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Score: -7.30
X-Spam-Flag: NO
X-Spamd-Result: default: False [-7.30 / 50.00]; REPLY(-4.00)[];
 BAYES_HAM(-3.00)[100.00%]; MID_CONTAINS_FROM(1.00)[];
 NEURAL_HAM_LONG(-1.00)[-1.000];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 TO_DN_SOME(0.00)[]; RCVD_VIA_SMTP_AUTH(0.00)[]; ARC_NA(0.00)[];
 FREEMAIL_TO(0.00)[ffwll.ch,gmail.com,redhat.com];
 MIME_TRACE(0.00)[0:+]; RCPT_COUNT_TWELVE(0.00)[16];
 FREEMAIL_ENVRCPT(0.00)[gmail.com];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FROM_EQ_ENVFROM(0.00)[]; FROM_HAS_DN(0.00)[];
 R_RATELIMIT(0.00)[to_ip_from(RLw9gjjhh8cousxs3wi4trssza)];
 RCVD_TLS_ALL(0.00)[]; RCVD_COUNT_TWO(0.00)[2];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; FUZZY_BLOCKED(0.00)[rspamd.com];
 DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:email,suse.de:mid,suse.de:email]
X-Spam-Level: 
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

i915's fbdev contains additional code for hotplugging a display that
cannot be ported to the common fbdev client. Introduce the callback
struct drm_fb_helper.fb_hotplug and implement it for i915. The fbdev
helpers invoke the callback before handing the hotplug event.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Jani Nikula <jani.nikula@linux.intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
Cc: Tvrtko Ursulin <tursulin@ursulin.net>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: "Thomas Hellström" <thomas.hellstrom@linux.intel.com>
---
 drivers/gpu/drm/drm_fb_helper.c            |  6 +++
 drivers/gpu/drm/i915/display/intel_fbdev.c | 43 ++++++++++++----------
 include/drm/drm_fb_helper.h                | 13 +++++++
 3 files changed, 42 insertions(+), 20 deletions(-)

diff --git a/drivers/gpu/drm/drm_fb_helper.c b/drivers/gpu/drm/drm_fb_helper.c
index d9e539b0fd1a..92926cb02dfb 100644
--- a/drivers/gpu/drm/drm_fb_helper.c
+++ b/drivers/gpu/drm/drm_fb_helper.c
@@ -1938,6 +1938,12 @@ int drm_fb_helper_hotplug_event(struct drm_fb_helper *fb_helper)
 	if (!drm_fbdev_emulation || !fb_helper)
 		return 0;
 
+	if (fb_helper->funcs->fb_hotplug) {
+		err = fb_helper->funcs->fb_hotplug(fb_helper);
+		if (err)
+			return err;
+	}
+
 	mutex_lock(&fb_helper->lock);
 	if (fb_helper->deferred_setup) {
 		err = __drm_fb_helper_initial_config_and_unlock(fb_helper);
diff --git a/drivers/gpu/drm/i915/display/intel_fbdev.c b/drivers/gpu/drm/i915/display/intel_fbdev.c
index c03fb00002a4..abe77ef0bd84 100644
--- a/drivers/gpu/drm/i915/display/intel_fbdev.c
+++ b/drivers/gpu/drm/i915/display/intel_fbdev.c
@@ -305,10 +305,32 @@ static void intelfb_restore(struct drm_fb_helper *fb_helper)
 	intel_fbdev_invalidate(ifbdev);
 }
 
+static int intelfb_hotplug(struct drm_fb_helper *fb_helper)
+{
+	struct drm_device *dev = fb_helper->client.dev;
+	struct drm_i915_private *dev_priv = to_i915(dev);
+	struct intel_fbdev *ifbdev = dev_priv->display.fbdev.fbdev;
+	bool send_hpd;
+
+	if (!ifbdev)
+		return -EINVAL;
+
+	mutex_lock(&ifbdev->hpd_lock);
+	send_hpd = !ifbdev->hpd_suspended;
+	ifbdev->hpd_waiting = true;
+	mutex_unlock(&ifbdev->hpd_lock);
+
+	if (!send_hpd || !(ifbdev->vma || dev->fb_helper->deferred_setup))
+		return -EAGAIN;
+
+	return 0;
+}
+
 static const struct drm_fb_helper_funcs intel_fb_helper_funcs = {
 	.fb_probe = intelfb_create,
 	.fb_dirty = intelfb_dirty,
 	.fb_restore = intelfb_restore,
+	.fb_hotplug = intelfb_hotplug,
 };
 
 /*
@@ -557,25 +579,6 @@ void intel_fbdev_set_suspend(struct drm_device *dev, int state, bool synchronous
 	intel_fbdev_hpd_set_suspend(dev_priv, state);
 }
 
-static int intel_fbdev_output_poll_changed(struct drm_device *dev)
-{
-	struct intel_fbdev *ifbdev = to_i915(dev)->display.fbdev.fbdev;
-	bool send_hpd;
-
-	if (!ifbdev)
-		return -EINVAL;
-
-	mutex_lock(&ifbdev->hpd_lock);
-	send_hpd = !ifbdev->hpd_suspended;
-	ifbdev->hpd_waiting = true;
-	mutex_unlock(&ifbdev->hpd_lock);
-
-	if (send_hpd && (ifbdev->vma || dev->fb_helper->deferred_setup))
-		drm_fb_helper_hotplug_event(dev->fb_helper);
-
-	return 0;
-}
-
 static int intel_fbdev_restore_mode(struct drm_i915_private *dev_priv)
 {
 	struct intel_fbdev *ifbdev = dev_priv->display.fbdev.fbdev;
@@ -637,7 +640,7 @@ static int intel_fbdev_client_hotplug(struct drm_client_dev *client)
 	int ret;
 
 	if (dev->fb_helper)
-		return intel_fbdev_output_poll_changed(dev);
+		return drm_fb_helper_hotplug_event(fb_helper);
 
 	ret = drm_fb_helper_init(dev, fb_helper);
 	if (ret)
diff --git a/include/drm/drm_fb_helper.h b/include/drm/drm_fb_helper.h
index 34eb77c18a13..3dcb9a60e408 100644
--- a/include/drm/drm_fb_helper.h
+++ b/include/drm/drm_fb_helper.h
@@ -112,6 +112,19 @@ struct drm_fb_helper_funcs {
 	 * TODO: Fix i915 to not require this callback.
 	 */
 	void (*fb_restore)(struct drm_fb_helper *helper);
+
+	/**
+	 * @fb_hotplug:
+	 *
+	 * Driver callback to prepare hotplug event. If set, fbdev
+	 * emulation will invoke this callback before sending a hotplug
+	 * event.
+	 *
+	 * Only for i915. Do not use in new code.
+	 *
+	 * TODO: Fix i915 to not require this callback.
+	 */
+	int (*fb_hotplug)(struct drm_fb_helper *helper);
 };
 
 /**
-- 
2.46.0

