Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DAAD6959E1A
	for <lists+nouveau@lfdr.de>; Wed, 21 Aug 2024 15:08:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6676410EAB9;
	Wed, 21 Aug 2024 13:04:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="v0SYmGe1";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="52iA+XEi";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="v0SYmGe1";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="52iA+XEi";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7237B10E9FB;
 Wed, 21 Aug 2024 13:04:19 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id E23D62009D;
 Wed, 21 Aug 2024 13:04:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1724245457; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tyQ8uSj507E0vHpdrXiZE0y2B+QZCwaMtd7CpOzKpeQ=;
 b=v0SYmGe1Ig/zoODT9STP6h+V18T615JfIGII+eqdksuXPPAEg8zpzM97XFEVLaLKNbymp3
 a3Jo3iY4UrKOboK7OH8YdXMYbPV7Sg95I7frCDQNKTSwQGQ2YwZsMxvbr/3fCn0GjyKCy+
 idorZbEl1qRTnJvkNN5kkE8cVtK6aHc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1724245457;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tyQ8uSj507E0vHpdrXiZE0y2B+QZCwaMtd7CpOzKpeQ=;
 b=52iA+XEi7tfsBSL6CalnmbfvCsvdBXpqlgtCGDIr141mtr2f9GBaJrVV5D6VmEVNNGFCx9
 uzoK08RmFDqyrvBQ==
Authentication-Results: smtp-out2.suse.de;
 dkim=pass header.d=suse.de header.s=susede2_rsa header.b=v0SYmGe1;
 dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=52iA+XEi
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1724245457; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tyQ8uSj507E0vHpdrXiZE0y2B+QZCwaMtd7CpOzKpeQ=;
 b=v0SYmGe1Ig/zoODT9STP6h+V18T615JfIGII+eqdksuXPPAEg8zpzM97XFEVLaLKNbymp3
 a3Jo3iY4UrKOboK7OH8YdXMYbPV7Sg95I7frCDQNKTSwQGQ2YwZsMxvbr/3fCn0GjyKCy+
 idorZbEl1qRTnJvkNN5kkE8cVtK6aHc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1724245457;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tyQ8uSj507E0vHpdrXiZE0y2B+QZCwaMtd7CpOzKpeQ=;
 b=52iA+XEi7tfsBSL6CalnmbfvCsvdBXpqlgtCGDIr141mtr2f9GBaJrVV5D6VmEVNNGFCx9
 uzoK08RmFDqyrvBQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 5C51D13B18;
 Wed, 21 Aug 2024 13:04:17 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id kEhsFdHlxWbXGQAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Wed, 21 Aug 2024 13:04:17 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: daniel@ffwll.ch, airlied@gmail.com, jfalempe@redhat.com, javierm@redhat.com
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>,
 Gerd Hoffmann <kraxel@redhat.com>
Subject: [PATCH v2 66/86] drm/bochs: Run DRM default client setup
Date: Wed, 21 Aug 2024 15:00:03 +0200
Message-ID: <20240821130348.73038-67-tzimmermann@suse.de>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240821130348.73038-1-tzimmermann@suse.de>
References: <20240821130348.73038-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: E23D62009D
X-Spam-Score: -3.01
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.01 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 MID_CONTAINS_FROM(1.00)[]; NEURAL_HAM_LONG(-1.00)[-1.000];
 R_MISSING_CHARSET(0.50)[];
 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 MX_GOOD(-0.01)[]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 FREEMAIL_TO(0.00)[ffwll.ch,gmail.com,redhat.com];
 MIME_TRACE(0.00)[0:+]; ARC_NA(0.00)[];
 FUZZY_BLOCKED(0.00)[rspamd.com];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 DKIM_TRACE(0.00)[suse.de:+]; TO_DN_SOME(0.00)[];
 RCVD_COUNT_TWO(0.00)[2]; FROM_EQ_ENVFROM(0.00)[];
 FROM_HAS_DN(0.00)[]; RCVD_TLS_ALL(0.00)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo,suse.de:dkim,suse.de:mid,suse.de:email];
 RCPT_COUNT_SEVEN(0.00)[11];
 DNSWL_BLOCKED(0.00)[2a07:de40:b281:104:10:150:64:97:from];
 R_RATELIMIT(0.00)[to(RLazpx1r3qpnsfr8nfakn),to_ip_from(RLgk4u1ri6nhg6f1rtzmk7keyw)];
 RCVD_VIA_SMTP_AUTH(0.00)[]; FREEMAIL_ENVRCPT(0.00)[gmail.com]
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

Call drm_client_setup() to run the kernel's default client setup
for DRM. Set fbdev_probe in struct drm_driver, so that the client
setup can start the common fbdev client.

The bochs driver specifies a preferred color mode of 32. As this
is the default if no format has been given, leave it out entirely.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Gerd Hoffmann <kraxel@redhat.com>
---
 drivers/gpu/drm/tiny/bochs.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/tiny/bochs.c b/drivers/gpu/drm/tiny/bochs.c
index 31fc5d839e10..fb69f70043d5 100644
--- a/drivers/gpu/drm/tiny/bochs.c
+++ b/drivers/gpu/drm/tiny/bochs.c
@@ -5,6 +5,7 @@
 
 #include <drm/drm_aperture.h>
 #include <drm/drm_atomic_helper.h>
+#include <drm/drm_client_setup.h>
 #include <drm/drm_drv.h>
 #include <drm/drm_edid.h>
 #include <drm/drm_fbdev_ttm.h>
@@ -604,6 +605,7 @@ static const struct drm_driver bochs_driver = {
 	.major			= 1,
 	.minor			= 0,
 	DRM_GEM_VRAM_DRIVER,
+	DRM_FBDEV_TTM_DRIVER_OPS,
 };
 
 /* ---------------------------------------------------------------------- */
@@ -667,7 +669,7 @@ static int bochs_pci_probe(struct pci_dev *pdev, const struct pci_device_id *ent
 	if (ret)
 		goto err_hw_fini;
 
-	drm_fbdev_ttm_setup(dev, 32);
+	drm_client_setup(dev, NULL);
 	return ret;
 
 err_hw_fini:
-- 
2.46.0

