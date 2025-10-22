Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 450F0C8718C
	for <lists+nouveau@lfdr.de>; Tue, 25 Nov 2025 21:47:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BAAD410E475;
	Tue, 25 Nov 2025 20:47:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=permerror (0-bit key) header.d=gmail.com header.i=@gmail.com header.b="PGCi073F";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com
 [209.85.167.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 81DE810E69F
 for <nouveau@lists.freedesktop.org>; Wed, 22 Oct 2025 04:13:07 +0000 (UTC)
Received: by mail-lf1-f42.google.com with SMTP id
 2adb3069b0e04-58affa66f2bso7495258e87.1
 for <nouveau@lists.freedesktop.org>; Tue, 21 Oct 2025 21:13:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1761106386; x=1761711186; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=HTarvr5NQrK1UQUHCo4kav4SXNLG6y74vPoWa3KRT+Q=;
 b=PGCi073F10KQkXcS5OfBXAijqviY0QpTEmjwbpaubuKUWnhbMSo7q0Q/H12zte5ttL
 EpwF8cj4vvjWAeJxRejnOdJ5qD4M7fHK234LKlHX6cK2rhs+kv8rkqfbT087/Myy5XX5
 y5g1DEhiF/0h0OPjeHRQnzSUSFmPfumsYyvUzpOrhtloHzZgJATc+W+u3UQboU9sGoGC
 upZdki9vV1GAKgiiWWxM+V8vUSqy/INA66QSqujf8KVwrRMp2ChjMGfhmn3aSSwGRIux
 +QrQ9BDMsBIpnJETNA4h9SbQDxoD9mXx3+wJ9mFSZYJXlK6m2RqCBtb/16gtLoojpxMC
 /Lpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761106386; x=1761711186;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=HTarvr5NQrK1UQUHCo4kav4SXNLG6y74vPoWa3KRT+Q=;
 b=Y5eJgsR7U29MjokYpdZJD9NbzLCGPPP02dxjpUVGffJpWlc7UdzpOvE0M9+v6znDXg
 iPI5lSpp+JRU0t+Bh8v7IsTP5JIPlmtdmQsiP0C4FgAyDWczepmq/GpQ8+slHnbLPhXe
 UnOsLWQLp/R7aFxdID5mxOrI/x9tL/od2TsedwWM/bTXlIK6DBrxq4XV8RhMM0ESnmPx
 J2/Trw7aDuFwlO0KDur1qu7yP9G5viWCh9CZU6kedQGr2uzLXfz3GwO2ErfSRIdJGNBT
 zcAOd8rlh4ksuwnl7DWmVoTsewRljnfFdNoauGwGLpzQ03I1QR6GSMIZJhQZqtYYp10I
 906w==
X-Forwarded-Encrypted: i=1;
 AJvYcCV3gSPg2S04lWjXr/tZ7pjnY/VMtA7REPdPg9P2vqR8BoA3XhIV45AC1+ES+eY7bS4/2dy2k8/t@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzaVwIpvs/wp5qLtPtkn9ZxNIvABWPR3v1MUvyQJPb3g1B9v27E
 ZFvNoXc9uX3Wx0aRH6nw+tXQ7M6ONi6XslZ7QNCnAZ0EisvGQy7SxwSnJZTELnijrX6+iw==
X-Gm-Gg: ASbGnctPQ2lqCmtDag1600wjfTHrJ9DH1aw6arE2e/+qhFZEqnqipHlk0BXRrmIG1Q8
 Yz8StwnDN+7b1Bo9IRxqML19PNjSJVtCeQU80rD1HG2rYORehsHVL+WyTUpWrTuTurnfcZSWCfT
 OCujceSaCfMljt4nINMkcvkt/COK+71sg6J87Xvahe11EH7+Ig27J9z/W7LVuI0S6jBUbmVNLqw
 axKW20/bqagkwrSMfvB80CzNJdo3yIIgr08xUogT2XGg7s+5UlVxeIa6X4aZ1e1fL6HpMsm4w6Y
 T3pKVYtcZblGw6jd7p99o5nEOjhLWkcgk6+3E7DDzDG/NMYomBrRBaaYP4tBpPMU5CpT9rbnHoE
 oaRq1Z6ZJ5vBy/5xXtTpmcFC0AzVD3QeWFm1kaBwnggikq8GmeF6nWNpyPMYWh9DbgLI2znvPIa
 BRyfbeXmHieVnGGZUjOmZL48eh6ifVNz2Ra+qP6FFl9pcpCiHTecOIZvzG8O85T1/ginoLHH80X
 kjHrAzd
X-Google-Smtp-Source: AGHT+IHY7I4DBmj7a1FpDVM7msh9gcYm7KPVmZxtgTaCyBA4vmSmAHD2ToTDDsFBgGtcjxwcP6lO+w==
X-Received: by 2002:a05:6512:220f:b0:567:ef90:f519 with SMTP id
 2adb3069b0e04-591d850d08fmr6278217e87.12.1761106385519; 
 Tue, 21 Oct 2025 21:13:05 -0700 (PDT)
Received: from localhost.localdomain
 (broadband-109-173-93-221.ip.moscow.rt.ru. [109.173.93.221])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-591deeaf6e2sm4252192e87.32.2025.10.21.21.13.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Oct 2025 21:13:05 -0700 (PDT)
From: Alexandr Sapozhnikov <alsp705@gmail.com>
To: Ben Skeggs <bskeggs@redhat.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>
Cc: Alexandr Sapozhnikov <alsp705@gmail.com>, dri-devel@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 lvc-project@linuxtesting.org
Subject: [PATCH] drm/nouveau: handle division by zero and overflow in
 nouveau_bo_fixup_align()
Date: Wed, 22 Oct 2025 07:12:59 +0300
Message-ID: <20251022041302.13-1-alsp705@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Tue, 25 Nov 2025 20:47:23 +0000
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

The expression 64 * nvbo->mode can evaluate to 0 when 
nvbo->mode = U32_MAX/64, which results in division by zero 
in the do_div() function. A value greater than U32_MAX/64 
causes a u32 overflow, and the division result may be 
incorrect. The nvbo->mode value depends on the data 
passed from the user via ioctl. Generally, the kernel 
should distrust userspace data (an attacker could operate 
from there, and there's no guarantee that mesa and similar 
software are bug-free) and validate it to avoid crashing.

Found by Linux Verification Center (linuxtesting.org) with svace.

Fixes: a0af9add499c ("drm/nouveau: Make the MM aware of pre-G80 tiling.")

Signed-off-by: Alexandr Sapozhnikov <alsp705@gmail.com>
---
 drivers/gpu/drm/nouveau/nouveau_bo.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_bo.c b/drivers/gpu/drm/nouveau/nouveau_bo.c
index 7daa12eec01b..afe4e73b6190 100644
--- a/drivers/gpu/drm/nouveau/nouveau_bo.c
+++ b/drivers/gpu/drm/nouveau/nouveau_bo.c
@@ -168,7 +168,7 @@ nouveau_bo_fixup_align(struct nouveau_bo *nvbo, int *align, u64 *size)
 	struct nvif_device *device = &drm->client.device;
 
 	if (device->info.family < NV_DEVICE_INFO_V0_TESLA) {
-		if (nvbo->mode) {
+		if (nvbo->mode && nvbo->mode < U32_MAX / 64) {
 			if (device->info.chipset >= 0x40) {
 				*align = 65536;
 				*size = roundup_64(*size, 64 * nvbo->mode);
-- 
2.43.0

