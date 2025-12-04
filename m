Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2690FCBAFD0
	for <lists+nouveau@lfdr.de>; Sat, 13 Dec 2025 13:47:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB45510ECCA;
	Sat, 13 Dec 2025 12:42:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=permerror (0-bit key) header.d=gmail.com header.i=@gmail.com header.b="cXKYHKCB";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com
 [209.85.214.179])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2ACA910E086
 for <nouveau@lists.freedesktop.org>; Thu,  4 Dec 2025 11:40:30 +0000 (UTC)
Received: by mail-pl1-f179.google.com with SMTP id
 d9443c01a7336-29555b384acso8659805ad.1
 for <nouveau@lists.freedesktop.org>; Thu, 04 Dec 2025 03:40:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1764848429; x=1765453229; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=VOLP0XruPd1QOq3grXNaxKngGKdOYC2kF7NcMiuxQlI=;
 b=cXKYHKCBEjlXy7HJVjoNREJ43Zy+K/sBT5pLnqb5qzvzrxjSVhVfHhpkxWY6jxpbnU
 xuviJrnrkCAPMvK4r8z3DiF/FnClVDK5fasEnoUsnKd6+KIujKK8dBJ1EtBHF2xWeBqs
 LYkfUSRjYCetYcWIzuj6iDtiaQoA5qWxE2kmjdpVWWaFgWhwh+qyLyIRqV66+Wtbw46C
 UGgUM0BppWSu8NPr96VCp+HVoARa6nBFIWwDiXBwTeM9sk/u8B11UEjvrguvj1D4BCrX
 GVygc2lAAZvsdDKq92UMZNzzZCalthw9ufIoh8N/E3A3JAeVK6VnyDuAKoED97qOpXQb
 Ofwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1764848429; x=1765453229;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=VOLP0XruPd1QOq3grXNaxKngGKdOYC2kF7NcMiuxQlI=;
 b=tHZUTjYbTUIpPv/btTtW7+JZjuh26YJzVdpbyCUsKWwZN9Da0kd8SObsTiBe7Wh5/W
 nSmo97hAJYthYJ2D1iumvC37mJU0LXqaZCilj7VWl1BUB1UNPnaMpxu4uTyIuZwoylQz
 ZL4hh9rGAZ5y/4NoO8xt3y6fZ6yVJMgOgcB6fYFJt78tWwb4DUUPYNNunFUjogZeDlej
 doZiWQUdNrHYapDG0+cn+yG8+xPhn3I6chEg4SuKtJO4czbNjbyMBgUWXJUydzrEyQY3
 t3Xe8M75ZP1svLbcEyhCoRo449mEmj0h73lTz1C/l1GsrVWYONA6zXWmKkf+UGxFI/mN
 PoDA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXWj01Ssont1uY7FD9OK7rLZrOetL/WPUppYdY7a6Z2U19OWkLQwicgA+XXjCj3Ilv+QtHbWW0j@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzSFYnbA0b01HH9pY5Hq/dYs6JTxd5OVLBWHWCVZ+sM1EzN9/5K
 KIROa+NB07bpybbF87mBaBw4ae9uCZhiwNvsOBFO/2/4XjddccChxRkK
X-Gm-Gg: ASbGncsc/1IQ9nZ2sRhn78ZKjXnBK9iGZot0OEwLcaOQRClKolWpAmYyO8P/LpCzZ0c
 Rp9t4/C50X182rPUxN/e4CBA9MIN2t1efTzC6sPAb2wnhoiLIm+YUPdvsDnL8ho3F6GHMs1FYrD
 BCY6XbARP92DokuxakYNGTt6p5zXEs4GIT0i8hiSKoNW4HyjvEZ26dSC8BMy1EUMCIOK3sj1O3c
 a/bU6ymunB8SaJbwPm5Mfh04HN9OSgrwMWfoBPPIK5vP4grzTpwRJdtcUaIv002EKpT8I3BwgBp
 tUBh/V06w1rs7puvDtA8Vaq6AovNXNNsADWXiMIMpNZXDiZEjIKh3FTXmEeqL2g/YMCJE5e7MHB
 UexYkX5Qk/1W5nt9ngYn+bkE9uG2Jyn4kzytii4c4YWNiiOpd/GIPGq4AbVHx/mwQ5mgekkTCG9
 xSZCXtIJbpsqxcGk8B0yBu9tM=
X-Google-Smtp-Source: AGHT+IEOyFNQpZDBuG6E+IFuy81iiipGlnmTigN6oxFceckZ0M6BWW7ltYQKjSJV9ixoVX2TZKIuZQ==
X-Received: by 2002:a17:903:2d0:b0:298:60d5:d272 with SMTP id
 d9443c01a7336-29d682f4b2amr84735045ad.17.1764848429504; 
 Thu, 04 Dec 2025 03:40:29 -0800 (PST)
Received: from archlinux ([36.255.84.59]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-29daeae6ad1sm17734215ad.90.2025.12.04.03.40.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Dec 2025 03:40:28 -0800 (PST)
From: Madhur Kumar <madhurkumar004@gmail.com>
To: lyude@redhat.com,
	dakr@kernel.org
Cc: maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, simona@ffwll.ch, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, nouveau@lists.freedesktop.org,
 Madhur Kumar <madhurkumar004@gmail.com>
Subject: [PATCH] drm/nouveau : refactor deprecated strcpy
Date: Thu,  4 Dec 2025 17:10:21 +0530
Message-ID: <20251204114021.36719-1-madhurkumar004@gmail.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Sat, 13 Dec 2025 12:40:48 +0000
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

strcpy() has been deprecated because it performs no bounds checking on the
destination buffer, which can lead to buffer overflows. Use the safer
strscpy() instead.

Signed-off-by: Madhur Kumar <madhurkumar004@gmail.com>
---
 drivers/gpu/drm/nouveau/nouveau_fence.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_fence.c b/drivers/gpu/drm/nouveau/nouveau_fence.c
index 869d4335c0f4..100c7dff4ff8 100644
--- a/drivers/gpu/drm/nouveau/nouveau_fence.c
+++ b/drivers/gpu/drm/nouveau/nouveau_fence.c
@@ -183,11 +183,11 @@ nouveau_fence_context_new(struct nouveau_channel *chan, struct nouveau_fence_cha
 	fctx->context = drm->runl[chan->runlist].context_base + chan->chid;
 
 	if (chan == drm->cechan)
-		strcpy(fctx->name, "copy engine channel");
+		strscpy(fctx->name, "copy engine channel", sizeof(fctx->name));
 	else if (chan == drm->channel)
-		strcpy(fctx->name, "generic kernel channel");
+		strscpy(fctx->name, "generic kernel channel", sizeof(fctx->name));
 	else
-		strcpy(fctx->name, cli->name);
+		strscpy(fctx->name, cli->name, sizeof(fctx->name));
 
 	kref_init(&fctx->fence_ref);
 	if (!priv->uevent)
-- 
2.52.0

