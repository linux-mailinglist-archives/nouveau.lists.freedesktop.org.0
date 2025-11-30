Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BD67CBA8DF
	for <lists+nouveau@lfdr.de>; Sat, 13 Dec 2025 13:17:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F3F4A10E40C;
	Sat, 13 Dec 2025 12:17:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=permerror (0-bit key) header.d=gmail.com header.i=@gmail.com header.b="cx7BZTRN";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com
 [209.85.167.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2681810E0E0
 for <nouveau@lists.freedesktop.org>; Sun, 30 Nov 2025 14:42:33 +0000 (UTC)
Received: by mail-lf1-f54.google.com with SMTP id
 2adb3069b0e04-5943d20f352so1961577e87.0
 for <nouveau@lists.freedesktop.org>; Sun, 30 Nov 2025 06:42:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1764513751; x=1765118551; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=p73b8XMlnTSi7KqBmjtWQMkQBIAWTKM0Ot/hr/K9NMU=;
 b=cx7BZTRNr2/QFLtRcSzL4vKpESlfrAFzXpOiCJM5amQ9wQUzN3lFyecun78cPWX2HD
 n1Imn+dFLJWetvblMliTPBVl9hQFn+VEPltS4BfyScptTSJhllhLTXURa/w+zc6ynlOm
 YVDs3IFAPMLYEn4VpFXxZbKm2l4VwYHa24A9UfJkC6xplXK6MYnh/4vB8F+MrvScCxQs
 HPBqjcOUpEFHHDlcggLPBhXwoFY2h/Uca6juc63l8EGXJA1qDc8sX25RxnRSh4DznnQf
 uYalInRwp2puQ//dkdccmddDVc+S+fTPfLuuVdrE3Vokh5e7i6eKNYi+g/swx0E9uyT7
 KJZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1764513751; x=1765118551;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=p73b8XMlnTSi7KqBmjtWQMkQBIAWTKM0Ot/hr/K9NMU=;
 b=LEklTp1tNJ4IvwkGr2Ifytjxcg68RnteXa2/LBcPsnjq14ahqxfd0givYP1rtEjm30
 w7zRJ/xMrM5J5p5YwULlPr8KwKYhvpjMjdhHq/fxYNOHRhiOb2bDbcYCUKTZ1IuzzFdy
 Q37QduhfPYeRZN/Qo/NYhf16qhVbJJ2017azaQ5uWzLX5lhlUunMA91zs6GeGg3ul18z
 7soCvoSDJnEwXp9NTk7IQ7aWirn/DqzqVwDCESnAcvYci2ePmAEs9LGHxAF83NB+Gj8I
 yF4EGLWHXC/ewM/aVa+shZuMlqUfh54Y1oMa3XmSTG5gpaVc3quiJEWOwg9AbNnKDRz5
 l7rg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUD/1WyLEnb0rTNuxrHun0aL+YhyPqNEewcw5zcDwz9Tchr7tchzVJ8900y4oLB+vFZFxgb4X29@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxZL6iCCUDSbVPCOTGep3sZnf3iD1Y1dasgLfxKLgRJDQcm62e9
 7Xbxi8ulESqsZCVUTGptOWaDzPffZf3sAscNjXKNJFCA1yowfYgQsOok
X-Gm-Gg: ASbGncvYMPeWQkD/xBphIhSc9D+Sm3RpfclHnXWtF+p6FtisLyniek5AQHLIu53DdfW
 Ks2eoymJgHxIOORjny38cKeFnyJfcGpEMlw08JcBCiMoQ1XIigHEPpyC88iC5Of0CV+woCh6GKu
 ijVtwydviV4Yfb5BG8DEgXbRX2FwlacVfRDMhIovvsdKCK5aEqbTD2+FrKe10U2WY1yM2nFkvZT
 X6JT7dfKFZl/2WpEkyvjvSJ/85ka4H31QpAKDtYccePGCrIu9VTIKH7/LTlW8PPBY4Y79eHPbfK
 WycPu7YuUyZNOYZnyxVpGIfAkziaRqYjda0wAuOdYDM/iwKakjztbkyTAyDj9K4pzizQqjZg7vq
 92mP+SOoHBjeGu3lVm7wxLkaQcaBebBZYUu9GWXJkfZVEoifC1Ykz2FpkDzhcJJFCvye0rtVhz8
 LAqzAiK0R50TfXk9wdzQoQ/ElmpCWHhX5hA0AP+oynAwOqgtOf
X-Google-Smtp-Source: AGHT+IH1K7vOLIGvq0uhY0khDGnZ6O5dtNHEYSExFHc8Hxw3O6yt++WQ+vurMa839//Vrr6SIF7E4w==
X-Received: by 2002:a05:6512:2304:b0:595:8062:135 with SMTP id
 2adb3069b0e04-596a3eb322amr11827999e87.20.1764513750889; 
 Sun, 30 Nov 2025 06:42:30 -0800 (PST)
Received: from home-server.lan (89-109-48-215.dynamic.mts-nn.ru.
 [89.109.48.215]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-596bfa48cc8sm2846041e87.83.2025.11.30.06.42.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 30 Nov 2025 06:42:30 -0800 (PST)
From: Alexey Simakov <bigalex934@gmail.com>
To: Lyude Paul <lyude@redhat.com>
Cc: Alexey Simakov <bigalex934@gmail.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Francisco Jerez <currojerez@riseup.net>,
 dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, lvc-project@linuxtesting.org,
 Alexandr Sapozhnikov <alsp705@gmail.com>
Subject: [PATCH v2] drm/nouveau: fix div-by-zero in nouveau_bo_fixup_align
Date: Sun, 30 Nov 2025 17:42:21 +0300
Message-Id: <20251130144221.7689-1-bigalex934@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Sat, 13 Dec 2025 12:17:04 +0000
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

The expression 64 * nvbo->mode can be zero when nvbo->mode equals
U32_MAX / 64, causing a division by zero in do_div(). Values greater
than U32_MAX / 64 cause a u32 overflow, leading to incorrect results.

Since nvbo->mode comes from userspace via ioctl, it must be validated
to prevent crashes or undefined behavior.

Add a check to ensure nvbo->mode is less than U32_MAX / 64
before use in multiplication.

Found by Linux Verification Center (linuxtesting.org) with Svace.

Fixes: a0af9add499c ("drm/nouveau: Make the MM aware of pre-G80 tiling.")
Co-developed-by: Alexandr Sapozhnikov <alsp705@gmail.com>
Signed-off-by: Alexandr Sapozhnikov <alsp705@gmail.com>
Signed-off-by: Alexey Simakov <bigalex934@gmail.com>
---
 drivers/gpu/drm/nouveau/nouveau_bo.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/nouveau/nouveau_bo.c b/drivers/gpu/drm/nouveau/nouveau_bo.c
index 96a8b7b1215e..774888ffa4a8 100644
--- a/drivers/gpu/drm/nouveau/nouveau_bo.c
+++ b/drivers/gpu/drm/nouveau/nouveau_bo.c
@@ -207,6 +207,9 @@ nouveau_bo_alloc(struct nouveau_cli *cli, u64 *size, int *align, u32 domain,
 	struct nvif_vmm *vmm = cli->svm.cli ? &cli->svm.vmm : &cli->vmm.vmm;
 	int i, pi = -1;
 
+	if (tile_mode > U32_MAX / 64)
+		return ERR_PTR(-EINVAL);
+
 	if (!*size) {
 		NV_WARN(drm, "skipped size %016llx\n", *size);
 		return ERR_PTR(-EINVAL);
-- 
2.34.1

