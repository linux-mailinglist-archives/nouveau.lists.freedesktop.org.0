Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 598D5A39EDB
	for <lists+nouveau@lfdr.de>; Tue, 18 Feb 2025 15:26:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 841D510E6EA;
	Tue, 18 Feb 2025 14:26:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="E47xWng3";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="KChpdRZm";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="E47xWng3";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="KChpdRZm";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 24B9010E6E9
 for <nouveau@lists.freedesktop.org>; Tue, 18 Feb 2025 14:26:02 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id C4CF321176;
 Tue, 18 Feb 2025 14:25:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1739888749; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=yMMGLrtVVhDmJyhqakJon+MPSH4DP55cAIQ1HDFmEFE=;
 b=E47xWng3L35jgIjhUNDgJ9IazNVlavOvGJN3WDb/m6Cem/59nyTW52GsbENqfjhLchxma9
 Atx20BVSEwYZSWclxttlJFioVcOvKrMDzfYw0Xi5HDc3xkGUrzcUarbvSF+UQaMdIOMbou
 PznQ7Y1uzqRqrLJjTRDfv+H5cf0m8+c=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1739888749;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=yMMGLrtVVhDmJyhqakJon+MPSH4DP55cAIQ1HDFmEFE=;
 b=KChpdRZmT8vPYbjGrMC6aE9iGTQQH45kGwN2Kaxcrb8WI8ASCupKpzWl8uVkGyOYP/PNi8
 vhpO+6GiloKoRZBw==
Authentication-Results: smtp-out1.suse.de;
 dkim=pass header.d=suse.de header.s=susede2_rsa header.b=E47xWng3;
 dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=KChpdRZm
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1739888749; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=yMMGLrtVVhDmJyhqakJon+MPSH4DP55cAIQ1HDFmEFE=;
 b=E47xWng3L35jgIjhUNDgJ9IazNVlavOvGJN3WDb/m6Cem/59nyTW52GsbENqfjhLchxma9
 Atx20BVSEwYZSWclxttlJFioVcOvKrMDzfYw0Xi5HDc3xkGUrzcUarbvSF+UQaMdIOMbou
 PznQ7Y1uzqRqrLJjTRDfv+H5cf0m8+c=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1739888749;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=yMMGLrtVVhDmJyhqakJon+MPSH4DP55cAIQ1HDFmEFE=;
 b=KChpdRZmT8vPYbjGrMC6aE9iGTQQH45kGwN2Kaxcrb8WI8ASCupKpzWl8uVkGyOYP/PNi8
 vhpO+6GiloKoRZBw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 4BA1713A82;
 Tue, 18 Feb 2025 14:25:49 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id MJInEW2YtGdXYQAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Tue, 18 Feb 2025 14:25:49 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: maarten.lankhorst@linux.intel.com, mripard@kernel.org, airlied@gmail.com,
 simona@ffwll.ch
Cc: dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 imx@lists.linux.dev, linux-samsung-soc@vger.kernel.org,
 nouveau@lists.freedesktop.org, virtualization@lists.linux.dev,
 spice-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
 linux-rockchip@lists.infradead.org, linux-tegra@vger.kernel.org,
 intel-xe@lists.freedesktop.org, xen-devel@lists.xenproject.org,
 Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH v3 05/25] drm/gem-vram: Compute dumb-buffer sizes with
 drm_mode_size_dumb()
Date: Tue, 18 Feb 2025 15:23:28 +0100
Message-ID: <20250218142542.438557-6-tzimmermann@suse.de>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250218142542.438557-1-tzimmermann@suse.de>
References: <20250218142542.438557-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: C4CF321176
X-Spam-Score: -1.51
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.51 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 SUSPICIOUS_RECIPS(1.50)[]; MID_CONTAINS_FROM(1.00)[];
 NEURAL_HAM_LONG(-1.00)[-1.000]; R_MISSING_CHARSET(0.50)[];
 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 MX_GOOD(-0.01)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo,suse.de:dkim,suse.de:mid,suse.de:email];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FUZZY_BLOCKED(0.00)[rspamd.com]; ARC_NA(0.00)[];
 MIME_TRACE(0.00)[0:+];
 FREEMAIL_TO(0.00)[linux.intel.com,kernel.org,gmail.com,ffwll.ch];
 RCPT_COUNT_TWELVE(0.00)[19]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 FROM_HAS_DN(0.00)[]; FROM_EQ_ENVFROM(0.00)[];
 ASN(0.00)[asn:25478, ipnet:::/0, country:RU];
 RCVD_VIA_SMTP_AUTH(0.00)[]; RCVD_COUNT_TWO(0.00)[2];
 R_RATELIMIT(0.00)[to_ip_from(RLqtkr6cif1ebgurukgmwdm7xc)];
 RCVD_TLS_ALL(0.00)[]; DKIM_TRACE(0.00)[suse.de:+];
 TO_DN_SOME(0.00)[]; FREEMAIL_ENVRCPT(0.00)[gmail.com]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Flag: NO
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

Call drm_mode_size_dumb() to compute dumb-buffer scanline pitch and
buffer size. Inline code from drm_gem_vram_fill_create_dumb() without
the existing size computation. Align the pitch to a multiple of 8.

Only hibmc and vboxvideo use gem-vram. Hibmc invokes the call to
drm_gem_vram_fill_create_dumb() directly and is therefore not affected.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/drm_gem_vram_helper.c | 24 +++++++++++++++++++++++-
 1 file changed, 23 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_gem_vram_helper.c b/drivers/gpu/drm/drm_gem_vram_helper.c
index 22b1fe9c03b8..15cd564cbeac 100644
--- a/drivers/gpu/drm/drm_gem_vram_helper.c
+++ b/drivers/gpu/drm/drm_gem_vram_helper.c
@@ -6,6 +6,7 @@
 #include <drm/drm_debugfs.h>
 #include <drm/drm_device.h>
 #include <drm/drm_drv.h>
+#include <drm/drm_dumb_buffers.h>
 #include <drm/drm_file.h>
 #include <drm/drm_framebuffer.h>
 #include <drm/drm_gem_atomic_helper.h>
@@ -582,10 +583,31 @@ int drm_gem_vram_driver_dumb_create(struct drm_file *file,
 				    struct drm_device *dev,
 				    struct drm_mode_create_dumb *args)
 {
+	struct drm_gem_vram_object *gbo;
+	int ret;
+
 	if (WARN_ONCE(!dev->vram_mm, "VRAM MM not initialized"))
 		return -EINVAL;
 
-	return drm_gem_vram_fill_create_dumb(file, dev, 0, 0, args);
+	ret = drm_mode_size_dumb(dev, args, SZ_8, 0);
+	if (ret)
+		return ret;
+
+	gbo = drm_gem_vram_create(dev, args->size, 0);
+	if (IS_ERR(gbo))
+		return PTR_ERR(gbo);
+
+	ret = drm_gem_handle_create(file, &gbo->bo.base, &args->handle);
+	if (ret)
+		goto err_drm_gem_object_put;
+
+	drm_gem_object_put(&gbo->bo.base);
+
+	return 0;
+
+err_drm_gem_object_put:
+	drm_gem_object_put(&gbo->bo.base);
+	return ret;
 }
 EXPORT_SYMBOL(drm_gem_vram_driver_dumb_create);
 
-- 
2.48.1

