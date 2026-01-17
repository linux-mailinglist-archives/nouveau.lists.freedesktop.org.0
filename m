Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5932AD39022
	for <lists+nouveau@lfdr.de>; Sat, 17 Jan 2026 18:42:30 +0100 (CET)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 3609F10E182;
	Sat, 17 Jan 2026 17:42:29 +0000 (UTC)
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 22AC444CA7;
	Sat, 17 Jan 2026 17:33:51 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1768671231;
 b=ZIl7P7+f2vt6Odue91FnzLU3XFOWc3lz9pQ6+0rjj60bT98A25A7ARV4fLnfZCfjFJn02
 wjtBcMBgT+3XGNzIJVmY3uvxDi9dhLtBVNINeZlBPZQtPvjeKhC47TCCr46tvrw0cymOvQG
 zXdtdL9BOCSw7mf82GRUggPjyWQvItA7QdtMVEEmN1IitX3wP7nLm+Ruz4iT/uiJnSBkkcT
 foTUkaIfx/IyaphlQ0JDhL+zBPyZlrYVveHhvQ6Vi666jRRuEOn/HyDViZC97cHztc013FF
 qIyhXxxLAm0Cr5ALaWBD+kLdsCcwTcDqlc+vXStWqDYsjg/R5+vauifpIDcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1768671231; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=hzzcWuAbiEu6PFX9ynd2hGhDVM2kk3/QTVHWQqTdHXs=;
 b=05zg9HV9DyVQhqa6ni1BM8wfdkjD4bjGTTVkHZr6F3aC9CMZKsl+ZDxXxo1fzicR82lsK
 zkL0sXf1k3UBtlI6Xx4G4ToC1aZUbkEilmou8ic6LWeA0qbcIAb9Ej2s+o99fNhjthOyh6K
 rD71Zs96AaLDO21UMHCPjBJH+p1jiXBE4m20yIVdfOCOe/oNWTq8D2fwmbAbF8mYd5k6RGl
 LDFK9iJno+2AmRCnyUNCcaxwxSd2obTnX2zqPyc+hl33glYiDo50PvRoNqu4bzRwsBt3p1R
 BPGIUYWUFBfbfpz9UPiCILnr/HC0QnJpSBO3aMvXtZCsJj3UAjDWQLiwpaCg==
ARC-Authentication-Results: i=1; mail.freedesktop.org; dkim=fail;
  arc=none (Message is not ARC signed);
  dmarc=none
Authentication-Results: mail.freedesktop.org; dkim=fail;
 arc=none (Message is not ARC signed); dmarc=none
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id 8167744B97
	for <nouveau@lists.freedesktop.org>; Sat, 17 Jan 2026 14:51:57 +0000 (UTC)
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com
 [209.85.208.53])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 38BC910E0C2
	for <nouveau@lists.freedesktop.org>; Sat, 17 Jan 2026 15:00:35 +0000 (UTC)
Received: by mail-ed1-f53.google.com with SMTP id
 4fb4d7f45d1cf-655ae329d6bso3054786a12.0
        for <nouveau@lists.freedesktop.org>;
 Sat, 17 Jan 2026 07:00:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768662033; x=1769266833;
        h=content-transfer-encoding:content-disposition:mime-version
         :message-id:subject:to:from:date:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=hzzcWuAbiEu6PFX9ynd2hGhDVM2kk3/QTVHWQqTdHXs=;
        b=EoauJjPIPUvrH+k0uUSsizlumBVfxS5UB93KX7IItMNEgiDqj/W4OPEHWyHcQVwu7t
         yG7f28iCzgkxE6sI8wXtfRGy/5+BlioPyDa7GzaKaejrE/48fPcRtc6JpGBBO7NB70py
         k9VQWTJQ7uL/SWGf/MDh+7H1XWPQxfNxi18VtbA48sYyhWC/uhuECkGWmJKcUqC2zKUL
         LRNn3w6UuFdjbAYbRs7oE+RRuuBmP1KiboIhP4i08Ly3NNgb49aiNFAFKwravD/sHMwU
         jxDwC3BA1W9b6R0y1Dz+Yv9D3oHhQui6aAWp6p/mRVR/pzsFBwGfTWr7VZx92nmlogVT
         fF/g==
X-Gm-Message-State: AOJu0Yw9BkIK2O13V/a4JI7Y9xbFXCXGnKHTycdzcsaylxJCgnMrSlDG
	xgjNOqiY9z2IHgImcNyPKcbgZdHF0/bQofA0skhPZ+54a2rrnHov5mJzkWVJ3igYJvg=
X-Gm-Gg: AY/fxX6cSrkUEg1MCCud/EnZ4gNBJCng4nXa9KhB6DNIy6U5WVJ+VNOvoymf+rfpYM7
	nR0h+ubaUnZ8KdC9wzxUaw9r2qjUjH+59U8k06a1gdRcUG9Hf5d3yriP6BrHGDJIKW93hhcG/b6
	OQg2Im30XVTSFPPNw/3TlunnilatikFslpFlHcLm3Y2y1QyU89v6rxNIDAZ7H8usWbRvJeYK6g9
	Aw8hWlNGd8tZhomf9Vo5ztpSG62S23LbC+GTTwhd4ld3dYVIiqERFP7Yx58Fw7pCzayPFwtkmZn
	5z9yIbMnwdwRktJGTuYeWItBLIs8f5lq63CENuD1aEC1yZ0dfy0WqFjIzxPsdnYRQwyPOPYp4rx
	YzBBdcK7kuaMNk06MUoQZpu7i3yZF8OBSdKf39VneSQjaXDcqVCsYv4wGkwgHWjOdqmNkdO2R5t
	4ewk+gUa8MxWramh7sY5KbV+0m
X-Received: by 2002:a17:907:dac:b0:b87:15a7:85ee with SMTP id
 a640c23a62f3a-b8796b7a7a0mr496819866b.47.1768662033021;
        Sat, 17 Jan 2026 07:00:33 -0800 (PST)
Received: from linux-gentoo ([158.47.224.235])
        by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b879516900csm594774666b.23.2026.01.17.07.00.32
        for <nouveau@lists.freedesktop.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Jan 2026 07:00:32 -0800 (PST)
Date: Sat, 17 Jan 2026 16:00:30 +0100
From: Giuseppe Ranieri <giuseppe@ranieri.dev>
To: nouveau@lists.freedesktop.org
Subject: [PATCH] Fix broken initialization when SCDC is supported but not
 implemented
Message-ID: <aWukDouVtfiORRrn@linux-gentoo>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-MailFrom: rgiuse@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation
Message-ID-Hash: FTPID3X6YGGFWJBEZOVKYGASGNLRAW3Q
X-Message-ID-Hash: FTPID3X6YGGFWJBEZOVKYGASGNLRAW3Q
X-Mailman-Approved-At: Sat, 17 Jan 2026 17:33:49 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/FTPID3X6YGGFWJBEZOVKYGASGNLRAW3Q/>
Archived-At: <https://lore.freedesktop.org/aWukDouVtfiORRrn@linux-gentoo/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

This patch fix the missing scdc implementation on scdc enabled card behaviour init call and add debug message on error:

 - FIX: when the scdc implementation is missing the call of nvkm_uoutp_mthd_hdmi don't return anymore an error code but emit a OUTP_DBG log message and continue the initialization process

 - ADD: an NV_ERROR message where  error code is return by the nvif_outp_hdmi call in nv50_hdmi_enable method

Solve problem with (scdc enabled) card that don´t had scdc implementation in nouveau driver.

Signed-off-by: Giuseppe Ranieri <giuseppe@ranieri.dev>
---

diff '--color=auto' -ur a/drivers/gpu/drm/nouveau/dispnv50/disp.c b/drivers/gpu/drm/nouveau/dispnv50/disp.c
--- a/drivers/gpu/drm/nouveau/dispnv50/disp.c	2025-11-30 23:42:10.000000000 +0100
+++ b/drivers/gpu/drm/nouveau/dispnv50/disp.c	2026-01-17 01:27:34.150245394 +0100
@@ -819,9 +819,11 @@
 	ret = nvif_outp_hdmi(&nv_encoder->outp, nv_crtc->index, true, max_ac_packet, rekey,
 			     mode->clock, hdmi->scdc.supported, hdmi->scdc.scrambling.supported,
 			     hdmi->scdc.scrambling.low_rates);
-	if (ret)
+	if (ret < 0) {
+		NV_ERROR(drm, "Failure to set HDMI: %d\n", ret);
 		return;
-
+	}
+	
 	/* AVI InfoFrame. */
 	args->version = 0;
 	args->head = nv_crtc->index;
diff '--color=auto' -ur a/drivers/gpu/drm/nouveau/nvkm/engine/disp/uoutp.c b/drivers/gpu/drm/nouveau/nvkm/engine/disp/uoutp.c
--- a/drivers/gpu/drm/nouveau/nvkm/engine/disp/uoutp.c	2025-11-30 23:42:10.000000000 +0100
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/disp/uoutp.c	2026-01-17 01:20:03.670240977 +0100
@@ -253,8 +253,7 @@
 
 	if (!ior->func->hdmi ||
 	    args->v0.max_ac_packet > 0x1f ||
-	    args->v0.rekey > 0x7f ||
-	    (args->v0.scdc && !ior->func->hdmi->scdc))
+	    args->v0.rekey > 0x7f)
 		return -EINVAL;
 
 	if (!args->v0.enable) {
@@ -266,6 +265,11 @@
 
 	ior->func->hdmi->ctrl(ior, args->v0.head, args->v0.enable,
 			      args->v0.max_ac_packet, args->v0.rekey);
+	
+	if (args->v0.scdc && !ior->func->hdmi->scdc)
+		OUTP_DBG(outp, "SCDC enabled: %d, ior->func->hdmi->scdc not implemented (ior): %p", 
+				      args->v0.scdc, ior);
+
 	if (ior->func->hdmi->scdc)
 		ior->func->hdmi->scdc(ior, args->v0.khz, args->v0.scdc, args->v0.scdc_scrambling,
 				      args->v0.scdc_low_rates);
