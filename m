Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D7F04CE83E9
	for <lists+nouveau@lfdr.de>; Mon, 29 Dec 2025 22:59:36 +0100 (CET)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id B170910E73B;
	Mon, 29 Dec 2025 21:59:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=broadcom.com header.i=@broadcom.com header.b="gbUzshlJ";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 8046B44C66;
	Mon, 29 Dec 2025 21:51:39 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1767045099;
 b=XM34dStlFM/jTbfWTmM1b9wOByyocGvIIWeV4mqxyRhdHSS3o709gCLwp3hNCMosXcIan
 CR5TmZWztyhZS87fYm4aiXnjhzP+uX+Ym0pG1WvKe7iosHA7hQPYj/yVAR8Ao7SB7IYMs+t
 bVRXx/WWvLLa5BpDOlPaFmlWe18CqRGv7UFhpOpvCBlI+FYGgq+p8jj57b6dN0OwQwUtdbs
 IAfKyH7FNEQpmu7c21wTlTaDh5wnH8Na/bYo7iZWbzRQBiu9C6FmfuCyecU1IsWy05F1YaR
 hnvkcXZUMgmDZMNPBy0bRU/j1YBzZwS3dtfrAMUB+rOcavxbWPc+Vohfc/lw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1767045099; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=Q4KdukKFQUL9FIJkansAje16tRq8afqRuBs3aDoBF14=;
 b=I6Ztl7sY3AOSLZQd9KKxTGzje8BYIVlRoxQZBnUTfc3ctw0Twlf8W/dvcfva5KFNC46Ob
 dzj38Ung604dXpCEEB54r+rJ0CP1iGSqNOZkIfc1pICj2nc13BYL3cNVL3NRcbFbnS/OZAQ
 Z+5/mByrNzkgUfVACFZuImq82iypVBA3krqAssagQnsj7k43QejDohZZs3ZSRuYAlABvzek
 YaADbK/yaFFp9u2WPLSHX1gYvwfEFgxTt4RRgkGvqIghFQgTBqUYFm3pXl6LHPPdu6sJc1I
 rt+86Jb0LAAx/fwxfNo0+uzJzAZ1o7PnkWtfGB83tul7vXa+BKml4Z4o0hvA==
ARC-Authentication-Results: i=1; mail.freedesktop.org;
 dkim=fail header.d=broadcom.com;
  arc=none (Message is not ARC signed);
  dmarc=none
Authentication-Results: mail.freedesktop.org; dkim=fail header.d=broadcom.com;
 arc=none (Message is not ARC signed); dmarc=none
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id 49F624401E
	for <nouveau@lists.freedesktop.org>; Mon, 29 Dec 2025 21:51:37 +0000 (UTC)
Received: from mail-oa1-f99.google.com (mail-oa1-f99.google.com
 [209.85.160.99])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 41D1D10E739
	for <nouveau@lists.freedesktop.org>; Mon, 29 Dec 2025 21:59:33 +0000 (UTC)
Received: by mail-oa1-f99.google.com with SMTP id
 586e51a60fabf-3ec6c10a295so3791625fac.0
        for <nouveau@lists.freedesktop.org>;
 Mon, 29 Dec 2025 13:59:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767045572; x=1767650372;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Q4KdukKFQUL9FIJkansAje16tRq8afqRuBs3aDoBF14=;
        b=cHZLDUdF0mA9HtmTihxLR3W22peBUqc3YmjpejmHc2vL5LanHoUzbkuDyl0Tyj0RyS
         pk8u0ikINP9j2hCVTUMdnuFSJx/5M4sVCsd1FXelKwtdf8oJjRA8oGrecZVgeOxKL9sD
         W4yt/rzTekG7lFQsJh6yLjDPd7Bk/J52H6H/Yp38dlG2yWqfUHRebjbh9Zo9wP7mtPnD
         LPnM0rTdR2uKlZXBt1O5QQEqYBlaUcCPZGl/CmAEtbcMn4Frt6GXl/Ypmszaz7KyRt+o
         l+G9aKO6a2bkw4N+wkQ6cxjMTqLebu9ZXDM0th1w1+jtm9jqPBTph2me82R92y/PeK31
         boww==
X-Forwarded-Encrypted: i=1;
 AJvYcCVI+I9ENxysXwaGQ3omAny8DQ4aqm/z24zZhfR9X0YP20dlr/gniWU1IPzboB15BPbqu6IrodxX@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyYKxKsQWG0kno/VeNNt+Zwb63EIm6vciDofr2I5IYp1liDM1Z8
	9YbVovsqvJf8fDMitaZ+voIkVe1QxJxVB3ZDRroy2EqRE+mSIIXo/2GymtcT5a1XNiOfDM503Go
	gN2uhlLT5zc0uI/1PulIz6tAJcEQy9nXQj9qm3PfXyjZDh9erLQm/s0fO9C6OYzDe5k53nYFpKB
	a59GRrgw/042A+rNPj8z98m3uG66A/I3Rhcbd1GEGruyoR1e6S59K5nFXKE7u4ofnLBLjDl3D/4
	BSQHfKXfsEEJ0nAqw==
X-Gm-Gg: AY/fxX4ZHWj9eQe+bWH6TkuzlC1EUvSMuU8bqlHm4AxslC6e8J0rY53bPzUv5B1tshM
	O7t7OC74z3e7X5CgA5DBUnWhutI2tGOYYerhRsqcbAdcwgKe/ReuoT5Ff+hIibEN7aUbSbz50Nu
	BSwnN/nHfwvVZDGw81RvEiCV0jX3Puomh/wTwvT+gq0onEU0PBqw3IUqD0gUGIgqkip6wXbhOc/
	TR55sEog60qu2FuwB9rBr+dqPXooCqByyE4dHAIrwpIvF8nBeGkIIr3zgKmat1Fc1KHh6hwWWxq
	0vOxyLBKy6jO4MgBMN47WGXIdGc8Zaha7B8jrkxO6x0FhV5oyoPY1VEe3Fly2hwcnypR0+a6WzE
	kzlaSh7DKbVSNX0Gdw9zlzPq8YYeTzhgMW9cPRIHBE6T9OxoRdFVEFIwssghV0J3Za2Xb6BJEKP
	A4eJoiXRLMZqzWjP98rufx7hW77Pw13tNylarVSJU6LnT8
X-Google-Smtp-Source: 
 AGHT+IHwiriLtdAi4+i/cokphdECW2U9E6Kz34qlTQoukUBhdZ2aMwGKDLZW/iPxYyiEU9OXpftUNYyLS6r3
X-Received: by 2002:a05:6870:5b99:b0:3ec:3534:56e1 with SMTP id
 586e51a60fabf-3fda581b55fmr14265260fac.30.1767045572067;
        Mon, 29 Dec 2025 13:59:32 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com
 (address-144-49-247-101.dlp.protect.broadcom.com. [144.49.247.101])
        by smtp-relay.gmail.com with ESMTPS id
 586e51a60fabf-3fdaa937e2esm3122553fac.5.2025.12.29.13.59.30
        for <nouveau@lists.freedesktop.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 29 Dec 2025 13:59:32 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qv1-f72.google.com with SMTP id
 6a1803df08f44-88a31ce8214so237900876d6.2
        for <nouveau@lists.freedesktop.org>;
 Mon, 29 Dec 2025 13:59:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1767045569; x=1767650369;
 darn=lists.freedesktop.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Q4KdukKFQUL9FIJkansAje16tRq8afqRuBs3aDoBF14=;
        b=gbUzshlJhuQ8k3WgQuocfy5N/34gQq5e0XB2HwweoAupWEQVC835WvGGsZmnhh3ODV
         /lvytsI2qc50g4i+2v+IXF+Tg0FG5zlZarSEsXXDk/8XPcIlcYs9gxGG9TdeDqz/wGG5
         TpsczNacqlxFbjYAW8Y5A2WgVRq+9BC33Chi0=
X-Forwarded-Encrypted: i=1;
 AJvYcCXMi0CGzpXnG6QgvjHtt+GUWhZHrTrmRuNENW/QtsKV9s08zSdnIXfqDnkZTQZqdQRNdcInSEv4@lists.freedesktop.org
X-Received: by 2002:a05:6214:212f:b0:88a:4694:5921 with SMTP id
 6a1803df08f44-88d833b7862mr558877926d6.37.1767045569307;
        Mon, 29 Dec 2025 13:59:29 -0800 (PST)
X-Received: by 2002:a05:6214:212f:b0:88a:4694:5921 with SMTP id
 6a1803df08f44-88d833b7862mr558877646d6.37.1767045568851;
        Mon, 29 Dec 2025 13:59:28 -0800 (PST)
Received: from localhost.localdomain
 (pool-173-49-113-140.phlapa.fios.verizon.net. [173.49.113.140])
        by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-88d9759f164sm231530026d6.24.2025.12.29.13.59.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Dec 2025 13:59:25 -0800 (PST)
From: Zack Rusin <zack.rusin@broadcom.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 06/12] drm/nouveau: Use devm aperture helpers for sysfb
 restore on probe failure
Date: Mon, 29 Dec 2025 16:58:12 -0500
Message-ID: <20251229215906.3688205-7-zack.rusin@broadcom.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20251229215906.3688205-1-zack.rusin@broadcom.com>
References: <20251229215906.3688205-1-zack.rusin@broadcom.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e
Message-ID-Hash: QS6ZNFZMKIW4UUYTIAUJZDIPJONBY62B
X-Message-ID-Hash: QS6ZNFZMKIW4UUYTIAUJZDIPJONBY62B
X-MailFrom: zack.rusin@broadcom.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation; nonmember-moderation; administrivia;
 implicit-dest; max-recipients; max-size; news-moderation; no-subject;
 digests; suspicious-header
CC: Danilo Krummrich <dakr@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Simona Vetter <simona@ffwll.ch>,
 nouveau@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/QS6ZNFZMKIW4UUYTIAUJZDIPJONBY62B/>
Archived-At: 
 <https://lore.freedesktop.org/20251229215906.3688205-7-zack.rusin@broadcom.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

Use devm_aperture_remove_conflicting_pci_devices() instead of the
non-devm variant to automatically restore the system framebuffer
(efifb/simpledrm) if the driver's probe fails after removing the
firmware framebuffer.

Call devm_aperture_remove_conflicting_pci_devices_done() after
successful probe to cancel the automatic restore, as the driver
is now responsible for display output.

This ensures users don't lose display output if the nouveau driver
fails to probe after removing the firmware framebuffer.

Signed-off-by: Zack Rusin <zack.rusin@broadcom.com>
Cc: Lyude Paul <lyude@redhat.com>
Cc: Danilo Krummrich <dakr@kernel.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Maxime Ripard <mripard@kernel.org>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: David Airlie <airlied@gmail.com>
Cc: Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org
Cc: nouveau@lists.freedesktop.org
Cc: linux-kernel@vger.kernel.org
---
 drivers/gpu/drm/nouveau/nouveau_drm.c | 16 ++++++++++++++--
 1 file changed, 14 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_drm.c b/drivers/gpu/drm/nouveau/nouveau_drm.c
index 1527b801f013..7211ec6cdcc9 100644
--- a/drivers/gpu/drm/nouveau/nouveau_drm.c
+++ b/drivers/gpu/drm/nouveau/nouveau_drm.c
@@ -871,8 +871,13 @@ static int nouveau_drm_probe(struct pci_dev *pdev,
 	if (ret)
 		return ret;
 
-	/* Remove conflicting drivers (vesafb, efifb etc). */
-	ret = aperture_remove_conflicting_pci_devices(pdev, driver_pci.name);
+	/*
+	 * Remove conflicting drivers (vesafb, efifb etc). Use devm variant
+	 * to automatically restore sysfb if probe fails. This ensures the
+	 * user doesn't lose display if our probe fails after removing the
+	 * firmware framebuffer (efifb/simpledrm).
+	 */
+	ret = devm_aperture_remove_conflicting_pci_devices(pdev, driver_pci.name);
 	if (ret)
 		return ret;
 
@@ -903,6 +908,13 @@ static int nouveau_drm_probe(struct pci_dev *pdev,
 	drm_client_setup(drm->dev, format);
 
 	quirk_broken_nv_runpm(pdev);
+
+	/*
+	 * Probe succeeded - cancel the automatic sysfb restore action.
+	 * We're now responsible for display output.
+	 */
+	devm_aperture_remove_conflicting_pci_devices_done(pdev);
+
 	return 0;
 
 fail_pci:
-- 
2.48.1

