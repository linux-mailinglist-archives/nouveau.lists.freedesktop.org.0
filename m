Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1ADF3A01C5C
	for <lists+nouveau@lfdr.de>; Mon,  6 Jan 2025 00:01:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 96D0F10E53F;
	Sun,  5 Jan 2025 23:01:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="VCyKt7+D";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com
 [209.85.167.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 24C4410E53F
 for <nouveau@lists.freedesktop.org>; Sun,  5 Jan 2025 23:01:21 +0000 (UTC)
Received: by mail-lf1-f43.google.com with SMTP id
 2adb3069b0e04-53e3c47434eso14287158e87.3
 for <nouveau@lists.freedesktop.org>; Sun, 05 Jan 2025 15:01:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1736118019; x=1736722819; darn=lists.freedesktop.org;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:from:to:cc:subject:date:message-id:reply-to;
 bh=WCrt8tmPhl/PazcPZULV+mOJhKFlUUnTodJCBeRZ3LU=;
 b=VCyKt7+DVp+IOEWJNTvl2HwRzHktTOzuMSJlMXJ2jvbXo9ow9ekS5KtCGyB+6ZNicI
 /dhTfQV7/xEI2xugJ1pfzxr6JCYlK5Jz5RTsHXlw8hhe6a7R2KEfjTW1Hzm7FI4LkDqq
 Tb6EAmOp+v/tZJ3pYyoOEy6h9Zqr15lMN9nCT0/daZfIH4SKeAu7CT/DGx2ZFalyr3p6
 98lMoFGx92RIN1uJAkdcY3nCnOQLIfTDDtvxG6Hs8vuIUzvXwhjiU6W5pMpk60R4kjFA
 8Ocn4W1YV5cqOhLAl6bKlnmWaUnrAgcdO7ky2bBoO/tBcnIZ2Q6kAY1Ppo1vVj4WBD/N
 ezug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736118019; x=1736722819;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=WCrt8tmPhl/PazcPZULV+mOJhKFlUUnTodJCBeRZ3LU=;
 b=slijpQXfTKt44rA8lFlPTZnmnyi9rleKiAiriLYUxzumTdK4OfGzxeITAvrayritoB
 iOQ6YaFIaOC7qdPW7IsJo4vzLGzgr154hLBvQ11nWKwiaGIrMQ+8SYk4eMUduhblElDi
 ve/3IgRHkRonEQ6tV2ZpDpySwR6jbMklvJG0dsGfc8a+2pPpz2zhd/aAKXe0EYWOKTfG
 I2RNMHCKT9tM8c+iSBcK1/6VQ2Yfypr+tWoTFcngtvFFJtFJ+UzHjhaQfJ9IpvhxFzOF
 lNA1HW8ejghVgk+oZzfqv6YsCwHFxey1PFwKNYOIYm+40lI5v//vXGEoM8nCypKbsHK+
 xsNg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUdihW2AiaMHWG0HJ6uvayBSAb9oOJ6gSfvwaov6U9dE3UZ3f2ZFLy+4xYROarfEewLNYxfWBNg@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz22hG2wc/jBO3u1KUrGAnUGsDT8QO+KwMLH8gjOhxvtjtSPiUT
 yYniyHntDG6YuYfEk1NSLGXtfipYC6VZXDxcwnfOzgJcIksEfBhhfxYHQ5iPrxg=
X-Gm-Gg: ASbGncu4B8mB8LS2KbG4mkOaMyUt1VZCYjoQM72xskGCVNiklDSA/eeBwZ6yVQTGZBP
 wi3N92Y3fdg01wp/KUDlA2QMla5H9VMusq6DSMjFMmJ8KzZOpacn8Snec71eumqvbpMnpmgsMss
 yT5J5fYrHhp88pNAeGPNLcDb7n01yik0JqLSbKNhM0qhuxoMsqcTnrMm9tFuVNGNW95pgp6r2UD
 KQOZYSChLWJrOw6hVa0A07J45Q7sKaNhTvt2m7iKPeJgyqr0Dpjtt1bkPlpMak1
X-Google-Smtp-Source: AGHT+IEa9s4RHPghxGMaSlBDMdhWj+kIQ+tWX+hXXbf8XL3JqgaWtSiYuSXqPjuyp6pc6VeEB8MVYg==
X-Received: by 2002:a05:6512:1316:b0:540:2fe6:6a3a with SMTP id
 2adb3069b0e04-54229586bf8mr17486044e87.57.1736118019321; 
 Sun, 05 Jan 2025 15:00:19 -0800 (PST)
Received: from umbar.lan ([192.130.178.90]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-54223821583sm4614034e87.203.2025.01.05.15.00.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 05 Jan 2025 15:00:18 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: [PATCH v3 0/2] drm/nouveau: remove drm_encoder_slave interface
Date: Mon, 06 Jan 2025 01:00:12 +0200
Message-Id: <20250106-nouveau-encoder-slave-v3-0-1d37d2f2c67f@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAPwOe2cC/4XNQQ6CMBCF4auQrq2hQ6XqynsYFyMdoAlpyVQaD
 eHuFla6MC7/l8w3s4jEjqI4F7NgSi664HNUu0I0PfqOpLO5BZSgFSgtfZgS4STJN8ESyzhgIom
 1tRqgRY0nkW9HptY9N/d6y927+Aj82t4kta7/xKRkKe9k0dRGG6DqMjiPHPaBO7GSCT6Zwy8GM
 kOtwZLqowENX8yyLG9bTawVAgEAAA==
X-Change-ID: 20241214-nouveau-encoder-slave-a6dd422fa4a9
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Karol Herbst <kherbst@redhat.com>, Lyude Paul <lyude@redhat.com>, 
 Danilo Krummrich <dakr@kernel.org>, 
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>, 
 Helge Deller <deller@gmx.de>, Danilo Krummrich <dakr@redhat.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 nouveau@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2854;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=aOcldVdbqjILyVtpyvco3ISK3lAxKklS6+rIV9e5yIM=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnew8A6i1DrQa3drg11bpFI5xDxBHFm2GJFs6S8
 4LEOv7hVdWJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ3sPAAAKCRCLPIo+Aiko
 1UIUB/9gJhRB28XgXdRmeE1FB7beSSIMy3GgOg2qDAkyBrtFcV8QtLJfFosMb5r3bk4zKMUcwWj
 NNpQVR+JzaOle1FJg+G5WrPzP/j0EYZdKmQ9aDkJnJjqaBnj3muYy33eNqeawoG1VlvsX0ucJrU
 SI9052sa64qB6yhuN8yF19vWRPmh7p0s+t/mN4yoWxwwm8bXg+iY3UKqR+L7Pl8Nu9Eq0IGVsck
 c6pGxP+2aOXgbojo3ZeE3lNQ3k6/06d0dJiRR4RkNhKR7b0aw4HsusGa1AU26bEGD/qWJoe2FkT
 O642Cc2V+xCLZ5nurz5Hn945TdhBkUfuIz5bpLqjta+4a5Qe
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
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

The nouveau driver is the only user of the drm_encoder_slave interface.
Demote it from KMS helpers module to the nouveau driver itself, moving
corresponding I2C encoders to be handled by nouveau driver too.

Ideally those two drivers should be converted to the drm_bridge
interface, but it's unclear if it's worth spending time on that.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
Changes in v3:
- Moved includes to drivers/gpu/drm/nouveau/include/dispnv04/i2c/
  (Danilo)
- Trimmed Kconfig entries to remove mentions of "some nVidia cards"
  (Danilo)
- Fixed checkpatch issues related to alignment and code formatting
  (Danilo)
- Link to v2: https://lore.kernel.org/r/20241215-nouveau-encoder-slave-v2-0-ef7a0e687242@linaro.org

Changes in v2:
- Renamed symbols in defconfig (Laurent)
- Added missing Kbuild file (Laurent, LKP)
- Renamed guarding defines in include files.
- Dropped mentions of two removed functions.
- Link to v1: https://lore.kernel.org/r/20241214-nouveau-encoder-slave-v1-0-beda767472e3@linaro.org

---
Dmitry Baryshkov (2):
      drm/nouveau: incorporate I2C TV encoder drivers
      drm/nouveau: vendor in drm_encoder_slave API

 arch/arm/configs/multi_v7_defconfig                |   4 +-
 arch/parisc/configs/generic-32bit_defconfig        |   4 +-
 arch/parisc/configs/generic-64bit_defconfig        |   4 +-
 drivers/gpu/drm/Makefile                           |   1 -
 drivers/gpu/drm/i2c/Kconfig                        |  18 ---
 drivers/gpu/drm/i2c/Makefile                       |   6 -
 drivers/gpu/drm/nouveau/Kconfig                    |  18 +++
 drivers/gpu/drm/nouveau/dispnv04/Kbuild            |   3 +
 drivers/gpu/drm/nouveau/dispnv04/dfp.c             |  17 +--
 drivers/gpu/drm/nouveau/dispnv04/i2c/Kbuild        |   5 +
 .../drm/{ => nouveau/dispnv04}/i2c/ch7006_drv.c    |  30 ++---
 .../drm/{ => nouveau/dispnv04}/i2c/ch7006_mode.c   |   8 +-
 .../drm/{ => nouveau/dispnv04}/i2c/ch7006_priv.h   |  11 +-
 .../drm/{ => nouveau/dispnv04}/i2c/sil164_drv.c    |  33 +++---
 .../dispnv04/nouveau_i2c_encoder.c}                |  95 +++++-----------
 drivers/gpu/drm/nouveau/dispnv04/tvnv04.c          |  24 ++--
 drivers/gpu/drm/nouveau/dispnv04/tvnv17.c          |   4 +-
 .../gpu/drm/nouveau/include/dispnv04}/i2c/ch7006.h |   4 +-
 .../drm/nouveau/include/dispnv04/i2c/encoder_i2c.h | 121 +++++++++------------
 .../gpu/drm/nouveau/include/dispnv04}/i2c/sil164.h |   4 +-
 drivers/gpu/drm/nouveau/nouveau_connector.c        |  10 +-
 drivers/gpu/drm/nouveau/nouveau_encoder.h          |  13 +--
 22 files changed, 190 insertions(+), 247 deletions(-)
---
base-commit: 938fbb16aba8f7b88e0fdcf56f315a5bbad41aad
change-id: 20241214-nouveau-encoder-slave-a6dd422fa4a9

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

