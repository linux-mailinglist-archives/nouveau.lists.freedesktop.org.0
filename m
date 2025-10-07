Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E9EDCBAEBE
	for <lists+nouveau@lfdr.de>; Sat, 13 Dec 2025 13:46:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A8B3A10EC3F;
	Sat, 13 Dec 2025 12:42:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.cz header.i=@suse.cz header.b="VMM0QYu8";
	dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b="nF+t+9Fi";
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b="VMM0QYu8";
	dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b="nF+t+9Fi";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 13DD310E6C3
 for <nouveau@lists.freedesktop.org>; Tue,  7 Oct 2025 15:04:02 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id CA3F31F7C5;
 Tue,  7 Oct 2025 15:04:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1759849440; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=iiOdJ2MgSNByPM0WExeyOL23baz3N+sIvlTx4qo3pxM=;
 b=VMM0QYu8F8JaDlEHRosOOBTAw5T22NRFJRlTydUrull1ABmbqwX1sqrhfmrevQj8lxphrR
 GI/h6pGAF8WvWssRBw+HR7BMiKG4uLi4g4QWNPS/L1U7YcwEuemgWG/IAkUjDxxo0+OrwD
 ACkKPMSiqNgYSY41pUlLLXv9lGu6iw8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1759849440;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=iiOdJ2MgSNByPM0WExeyOL23baz3N+sIvlTx4qo3pxM=;
 b=nF+t+9FiNsh8U04SqybsJNGZo5K0adp3ADRwN4b0WVcDU6D+5qiAru+XtUoC/TqtfjjJyz
 TJV58zkSYl0XElCA==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1759849440; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=iiOdJ2MgSNByPM0WExeyOL23baz3N+sIvlTx4qo3pxM=;
 b=VMM0QYu8F8JaDlEHRosOOBTAw5T22NRFJRlTydUrull1ABmbqwX1sqrhfmrevQj8lxphrR
 GI/h6pGAF8WvWssRBw+HR7BMiKG4uLi4g4QWNPS/L1U7YcwEuemgWG/IAkUjDxxo0+OrwD
 ACkKPMSiqNgYSY41pUlLLXv9lGu6iw8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1759849440;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=iiOdJ2MgSNByPM0WExeyOL23baz3N+sIvlTx4qo3pxM=;
 b=nF+t+9FiNsh8U04SqybsJNGZo5K0adp3ADRwN4b0WVcDU6D+5qiAru+XtUoC/TqtfjjJyz
 TJV58zkSYl0XElCA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 8C79813693;
 Tue,  7 Oct 2025 15:04:00 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id RWSCIOAr5WioRwAAD6G6ig
 (envelope-from <pvorel@suse.cz>); Tue, 07 Oct 2025 15:04:00 +0000
From: Petr Vorel <pvorel@suse.cz>
To: nouveau@lists.freedesktop.org
Cc: Petr Vorel <pvorel@suse.cz>, Thomas Zimmermann <tzimmermann@suse.de>,
 Takashi Iwai <tiwai@suse.de>,
 Mohamed Ahmed <mohamedahmedegypt2001@gmail.com>,
 Danilo Krummrich <dakr@redhat.com>, Dave Airlie <airlied@redhat.com>,
 Faith Ekstrand <faith.ekstrand@collabora.com>
Subject: [RFC PATCH 1/1] Avoid NOUVEAU_GETPARAM_HAS_VMA_TILEMODE on nv177
Date: Tue,  7 Oct 2025 17:03:49 +0200
Message-ID: <20251007150349.7100-1-pvorel@suse.cz>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Level: 
X-Spamd-Result: default: False [-2.80 / 50.00]; BAYES_HAM(-3.00)[99.99%];
 NEURAL_HAM_LONG(-1.00)[-1.000]; MID_CONTAINS_FROM(1.00)[];
 R_MISSING_CHARSET(0.50)[]; NEURAL_HAM_SHORT(-0.20)[-1.000];
 MIME_GOOD(-0.10)[text/plain]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 RCVD_VIA_SMTP_AUTH(0.00)[];
 FUZZY_RATELIMITED(0.00)[rspamd.com]; ARC_NA(0.00)[];
 MIME_TRACE(0.00)[0:+];
 FREEMAIL_CC(0.00)[suse.cz,suse.de,gmail.com,redhat.com,collabora.com];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:url,suse.cz:email,suse.cz:mid];
 FROM_HAS_DN(0.00)[]; RCPT_COUNT_SEVEN(0.00)[8];
 RCVD_COUNT_TWO(0.00)[2]; RCVD_TLS_ALL(0.00)[];
 FROM_EQ_ENVFROM(0.00)[]; TO_DN_SOME(0.00)[];
 DKIM_SIGNED(0.00)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
 FREEMAIL_ENVRCPT(0.00)[gmail.com]
X-Spam-Flag: NO
X-Spam-Score: -2.80
X-Mailman-Approved-At: Sat, 13 Dec 2025 12:40:49 +0000
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

959314c438ca broke behavior at least on GA107GLM RTX A1000 on Thinkpad
P16, which has GPU in dock. unplugging dock freezes GUI on KDE5 Plasma,
plugging dock freezes GUI on GNOME.

As a workaround avoid setting value on NOUVEAU_GETPARAM_HAS_VMA_TILEMODE
for nv177.

Signed-off-by: Petr Vorel <pvorel@suse.cz>
---
Hi all,

obviously this is not a solution (that's why RFC and I don't set Fixes:
959314c438ca), but it documents that hardware is unusable with 959314c438ca.

FYI we are going to not set getparam->value for
NOUVEAU_GETPARAM_HAS_VMA_TILEMODE for any GPU on openSUSE Tumbleweed.
https://bugzilla.suse.com/show_bug.cgi?id=1198108

Kind regards,
Petr

 drivers/gpu/drm/nouveau/nouveau_abi16.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_abi16.c b/drivers/gpu/drm/nouveau/nouveau_abi16.c
index a3ba07fc48a08..fefaf7287723c 100644
--- a/drivers/gpu/drm/nouveau/nouveau_abi16.c
+++ b/drivers/gpu/drm/nouveau/nouveau_abi16.c
@@ -323,7 +323,12 @@ nouveau_abi16_ioctl_getparam(ABI16_IOCTL_ARGS)
 		break;
 	}
 	case NOUVEAU_GETPARAM_HAS_VMA_TILEMODE:
-		getparam->value = 1;
+		if (drm->client.device.info.chipset != 0x177) {
+			getparam->value = 1;
+		} else {
+			NV_PRINTK(dbg, cli, "Ignoring NOUVEAU_GETPARAM_HAS_VMA_TILEMODE for 0x%x\n",
+				  drm->client.device.info.chipset);
+		}
 		break;
 	default:
 		NV_PRINTK(dbg, cli, "unknown parameter %lld\n", getparam->param);
-- 
2.51.0

