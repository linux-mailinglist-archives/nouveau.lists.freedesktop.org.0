Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 87997954A56
	for <lists+nouveau@lfdr.de>; Fri, 16 Aug 2024 14:57:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1968810E5F0;
	Fri, 16 Aug 2024 12:54:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="hzbQzQEQ";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="EYbyHLbo";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="hzbQzQEQ";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="EYbyHLbo";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8485510E6E4;
 Fri, 16 Aug 2024 12:54:37 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 327F22287D;
 Fri, 16 Aug 2024 12:54:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1723812876; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=S7uajd+qgA01aaubtyFQVsz5TnaCgtYsHzFkNFaKf5k=;
 b=hzbQzQEQsZFoNdpL2QANLmqDZ6dF86Yb60hTpzat6q9EkeJmgU8DlD5fmVmuPs0yWUu/9P
 HnvJlJEmA3DBAo6ABp60N9lI17HdClgTmpyrV6sBrxMNH4jmZgzSaJs8QU9C5t2EKrAm9O
 ysIa/ssFN4JUc5SbDpMCZ8AxY4GHNKY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1723812876;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=S7uajd+qgA01aaubtyFQVsz5TnaCgtYsHzFkNFaKf5k=;
 b=EYbyHLboWzZsrb8bE3Vc7uPQ8Fv5HybDVjlsEnXCYhhaRUshQMu50Mjq4aScOIds136cI6
 TvG32eWoFp7vARAg==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1723812876; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=S7uajd+qgA01aaubtyFQVsz5TnaCgtYsHzFkNFaKf5k=;
 b=hzbQzQEQsZFoNdpL2QANLmqDZ6dF86Yb60hTpzat6q9EkeJmgU8DlD5fmVmuPs0yWUu/9P
 HnvJlJEmA3DBAo6ABp60N9lI17HdClgTmpyrV6sBrxMNH4jmZgzSaJs8QU9C5t2EKrAm9O
 ysIa/ssFN4JUc5SbDpMCZ8AxY4GHNKY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1723812876;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=S7uajd+qgA01aaubtyFQVsz5TnaCgtYsHzFkNFaKf5k=;
 b=EYbyHLboWzZsrb8bE3Vc7uPQ8Fv5HybDVjlsEnXCYhhaRUshQMu50Mjq4aScOIds136cI6
 TvG32eWoFp7vARAg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id D690A13ACA;
 Fri, 16 Aug 2024 12:54:35 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id iNQQMwtMv2bdbgAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Fri, 16 Aug 2024 12:54:35 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: daniel@ffwll.ch, airlied@gmail.com, jfalempe@redhat.com, javierm@redhat.com
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>,
 Zack Rusin <zack.rusin@broadcom.com>,
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>
Subject: [PATCH 72/86] drm/vmwgfx: Run DRM default client setup
Date: Fri, 16 Aug 2024 14:23:38 +0200
Message-ID: <20240816125408.310253-73-tzimmermann@suse.de>
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
 RCVD_COUNT_TWO(0.00)[2]; ARC_NA(0.00)[];
 RCVD_VIA_SMTP_AUTH(0.00)[]; FROM_HAS_DN(0.00)[];
 RCPT_COUNT_TWELVE(0.00)[12]; MIME_TRACE(0.00)[0:+];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; FROM_EQ_ENVFROM(0.00)[];
 RCVD_TLS_ALL(0.00)[]; FUZZY_BLOCKED(0.00)[rspamd.com];
 FREEMAIL_TO(0.00)[ffwll.ch,gmail.com,redhat.com];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email,suse.de:mid];
 TO_DN_SOME(0.00)[]; FREEMAIL_ENVRCPT(0.00)[gmail.com]
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

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Zack Rusin <zack.rusin@broadcom.com>
Cc: Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>
---
 drivers/gpu/drm/vmwgfx/vmwgfx_drv.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c b/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c
index 50ad3105c16e..f9009f5a5aef 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c
@@ -36,6 +36,7 @@
 #include "ttm_object.h"
 
 #include <drm/drm_aperture.h>
+#include <drm/drm_client_setup.h>
 #include <drm/drm_drv.h>
 #include <drm/drm_fbdev_ttm.h>
 #include <drm/drm_gem_ttm_helper.h>
@@ -1628,6 +1629,8 @@ static const struct drm_driver driver = {
 	.prime_handle_to_fd = vmw_prime_handle_to_fd,
 	.gem_prime_import_sg_table = vmw_prime_import_sg_table,
 
+	DRM_FBDEV_TTM_DRIVER_OPS,
+
 	.fops = &vmwgfx_driver_fops,
 	.name = VMWGFX_DRIVER_NAME,
 	.desc = VMWGFX_DRIVER_DESC,
@@ -1679,7 +1682,7 @@ static int vmw_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
 
 	vmw_fifo_resource_inc(vmw);
 	vmw_svga_enable(vmw);
-	drm_fbdev_ttm_setup(&vmw->drm,  0);
+	drm_client_setup(&vmw->drm, NULL);
 
 	vmw_debugfs_gem_init(vmw);
 	vmw_debugfs_resource_managers_init(vmw);
-- 
2.46.0

