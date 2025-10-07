Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E49DBC1EC7
	for <lists+nouveau@lfdr.de>; Tue, 07 Oct 2025 17:24:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 10DF110E1BD;
	Tue,  7 Oct 2025 15:24:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.cz header.i=@suse.cz header.b="LMxvvIAa";
	dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b="e7VXgCaL";
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b="ISNLylY+";
	dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b="AJxn3aRo";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A67B110E1BD
 for <nouveau@lists.freedesktop.org>; Tue,  7 Oct 2025 15:24:31 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 5964F33685;
 Tue,  7 Oct 2025 15:24:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1759850670; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=VyAWM+pKUDL8GABaNXZWdDeIc4cyEKH8w9yhdhBC5+A=;
 b=LMxvvIAaZnHA3u0pmZ9qeGdnNaW4gWnQvKhC+tm/AqpTaKDwg0P2PbMT0UrQY+GNGj+yL2
 xxL51inh36xKVxeNWo0A3iVrOvC0Pf99/PeL2hPGygRSVQ59nSVZiJgVlsnevFekxtj+8G
 jG1yEfb8mGQ7VFgIWnYgUNQNKv7TeeQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1759850670;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=VyAWM+pKUDL8GABaNXZWdDeIc4cyEKH8w9yhdhBC5+A=;
 b=e7VXgCaLN0NsX7celelX5rug91IwXbJJoivHUXdThl1+L9TiIV0JKQx9LXsAkRJwq5QRpZ
 DMG4JYTjF5cSufAg==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1759850668; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=VyAWM+pKUDL8GABaNXZWdDeIc4cyEKH8w9yhdhBC5+A=;
 b=ISNLylY+moKwE1MgF62z/bJr72PQ/uBmvT00X6Us2nsBemJD+m5roFJfiHk+iKEcBksYWH
 9MKz+/j+BBqfmilEM3zPQmJXyCy1KAn5f/b0LAp6U49JRKy+24i3P9pd0n4jWa9wuvg5Zu
 VQaBA6lUzqd2s4G+hLBeWUcPM5pxiAA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1759850668;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=VyAWM+pKUDL8GABaNXZWdDeIc4cyEKH8w9yhdhBC5+A=;
 b=AJxn3aRon0uAjZzvAGbZC5wWmjwansztIzChod7TEcJHoL6W18A+1wu4DPVKm8w/AO0Whw
 94rQhyKlhxfdGwDg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id D5CE113693;
 Tue,  7 Oct 2025 15:24:27 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id G4uGMasw5Wj0TQAAD6G6ig
 (envelope-from <pvorel@suse.cz>); Tue, 07 Oct 2025 15:24:27 +0000
From: Petr Vorel <pvorel@suse.cz>
To: nouveau@lists.freedesktop.org
Cc: Petr Vorel <pvorel@suse.cz>, Thomas Zimmermann <tzimmermann@suse.de>,
 Takashi Iwai <tiwai@suse.de>,
 Mohamed Ahmed <mohamedahmedegypt2001@gmail.com>,
 Danilo Krummrich <dakr@redhat.com>, Dave Airlie <airlied@redhat.com>,
 Faith Ekstrand <faith.ekstrand@collabora.com>
Subject: [RFC PATCH 1/1] Avoid NOUVEAU_GETPARAM_HAS_VMA_TILEMODE on nv177
Date: Tue,  7 Oct 2025 17:24:24 +0200
Message-ID: <20251007152424.7322-1-pvorel@suse.cz>
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
 DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.cz:email,suse.cz:mid,suse.com:url];
 FROM_HAS_DN(0.00)[]; RCPT_COUNT_SEVEN(0.00)[8];
 RCVD_COUNT_TWO(0.00)[2]; RCVD_TLS_ALL(0.00)[];
 FROM_EQ_ENVFROM(0.00)[]; TO_DN_SOME(0.00)[];
 DKIM_SIGNED(0.00)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
 FREEMAIL_ENVRCPT(0.00)[gmail.com]
X-Spam-Flag: NO
X-Spam-Score: -2.80
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

[ I'm sorry to repost due previously not being subscribed to the list ]

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

