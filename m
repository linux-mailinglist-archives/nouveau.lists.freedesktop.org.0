Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E3E4959CCD
	for <lists+nouveau@lfdr.de>; Wed, 21 Aug 2024 15:04:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 09ED910E6BD;
	Wed, 21 Aug 2024 13:03:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="TlbFIEbQ";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="8/6AfVsO";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="TlbFIEbQ";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="8/6AfVsO";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E17D610E402;
 Wed, 21 Aug 2024 13:03:55 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 5085A20082;
 Wed, 21 Aug 2024 13:03:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1724245434; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=603JVrYRTde5EsCHKgmbx4i4VBMdLH0mP6Gro1ZSUUs=;
 b=TlbFIEbQK0x7GnucFvoxV/aPGYzkO7OON9d+Un7H+OJ+5eYbd2X0ZkuRtjCOKBzQIQYQlW
 bE5YuZ60lfxIBLb92t9p1Y1pwEmcoNZe54fZCeB6zkte/AWF51Q2TGFAJRz65t7IBaZOn+
 tqpZkIDFrb1OB7BZfjr6P/aQ4rgLsqU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1724245434;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=603JVrYRTde5EsCHKgmbx4i4VBMdLH0mP6Gro1ZSUUs=;
 b=8/6AfVsOGhp7s5XAKAYVz04rUCXapnJNY/cbqJbT2B2bUSDDtp1cy1CoX1cbF/TUCZa1ym
 fcABysgmK45JbsAQ==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1724245434; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=603JVrYRTde5EsCHKgmbx4i4VBMdLH0mP6Gro1ZSUUs=;
 b=TlbFIEbQK0x7GnucFvoxV/aPGYzkO7OON9d+Un7H+OJ+5eYbd2X0ZkuRtjCOKBzQIQYQlW
 bE5YuZ60lfxIBLb92t9p1Y1pwEmcoNZe54fZCeB6zkte/AWF51Q2TGFAJRz65t7IBaZOn+
 tqpZkIDFrb1OB7BZfjr6P/aQ4rgLsqU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1724245434;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=603JVrYRTde5EsCHKgmbx4i4VBMdLH0mP6Gro1ZSUUs=;
 b=8/6AfVsOGhp7s5XAKAYVz04rUCXapnJNY/cbqJbT2B2bUSDDtp1cy1CoX1cbF/TUCZa1ym
 fcABysgmK45JbsAQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 068F613B18;
 Wed, 21 Aug 2024 13:03:54 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id WJpTALrlxWbXGQAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Wed, 21 Aug 2024 13:03:54 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: daniel@ffwll.ch, airlied@gmail.com, jfalempe@redhat.com, javierm@redhat.com
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>,
 Alexey Brodkin <abrodkin@synopsys.com>
Subject: [PATCH v2 06/86] drm/arcgpu: Run DRM default client setup
Date: Wed, 21 Aug 2024 14:59:03 +0200
Message-ID: <20240821130348.73038-7-tzimmermann@suse.de>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240821130348.73038-1-tzimmermann@suse.de>
References: <20240821130348.73038-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Score: -2.80
X-Spamd-Result: default: False [-2.80 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 MID_CONTAINS_FROM(1.00)[]; NEURAL_HAM_LONG(-1.00)[-1.000];
 R_MISSING_CHARSET(0.50)[]; NEURAL_HAM_SHORT(-0.20)[-1.000];
 MIME_GOOD(-0.10)[text/plain]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 ARC_NA(0.00)[]; RCVD_VIA_SMTP_AUTH(0.00)[];
 FROM_EQ_ENVFROM(0.00)[]; FROM_HAS_DN(0.00)[];
 TO_DN_SOME(0.00)[]; MIME_TRACE(0.00)[0:+];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,suse.de:email,synopsys.com:email,imap1.dmz-prg2.suse.org:helo];
 FREEMAIL_TO(0.00)[ffwll.ch,gmail.com,redhat.com];
 RCVD_TLS_ALL(0.00)[]; RCVD_COUNT_TWO(0.00)[2];
 RCPT_COUNT_SEVEN(0.00)[11]; FUZZY_BLOCKED(0.00)[rspamd.com];
 R_RATELIMIT(0.00)[to_ip_from(RLw9gjjhh8cousxs3wi4trssza)];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FREEMAIL_ENVRCPT(0.00)[gmail.com]
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

Call drm_client_setup_with_fourcc() to run the kernel's default client
setup for DRM. Set fbdev_probe in struct drm_driver, so that the client
setup can start the common fbdev client.

v2:
- use drm_client_setup_with_fourcc()

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Alexey Brodkin <abrodkin@synopsys.com>
---
 drivers/gpu/drm/tiny/arcpgu.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/tiny/arcpgu.c b/drivers/gpu/drm/tiny/arcpgu.c
index 4f8f3172379e..81abedec435d 100644
--- a/drivers/gpu/drm/tiny/arcpgu.c
+++ b/drivers/gpu/drm/tiny/arcpgu.c
@@ -7,6 +7,7 @@
 
 #include <linux/clk.h>
 #include <drm/drm_atomic_helper.h>
+#include <drm/drm_client_setup.h>
 #include <drm/drm_debugfs.h>
 #include <drm/drm_device.h>
 #include <drm/drm_drv.h>
@@ -371,6 +372,7 @@ static const struct drm_driver arcpgu_drm_driver = {
 	.patchlevel = 0,
 	.fops = &arcpgu_drm_ops,
 	DRM_GEM_DMA_DRIVER_OPS,
+	DRM_FBDEV_DMA_DRIVER_OPS,
 #ifdef CONFIG_DEBUG_FS
 	.debugfs_init = arcpgu_debugfs_init,
 #endif
@@ -394,7 +396,7 @@ static int arcpgu_probe(struct platform_device *pdev)
 	if (ret)
 		goto err_unload;
 
-	drm_fbdev_dma_setup(&arcpgu->drm, 16);
+	drm_client_setup_with_fourcc(&arcpgu->drm, DRM_FORMAT_RGB565);
 
 	return 0;
 
-- 
2.46.0

