Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AF94B9F2319
	for <lists+nouveau@lfdr.de>; Sun, 15 Dec 2024 11:19:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 98CC210E151;
	Sun, 15 Dec 2024 10:19:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="TqTEV0mI";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com
 [IPv6:2a00:1450:4864:20::231])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA8D710E02C
 for <nouveau@lists.freedesktop.org>; Sun, 15 Dec 2024 10:19:31 +0000 (UTC)
Received: by mail-lj1-x231.google.com with SMTP id
 38308e7fff4ca-300479ca5c6so30810861fa.3
 for <nouveau@lists.freedesktop.org>; Sun, 15 Dec 2024 02:19:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1734257970; x=1734862770; darn=lists.freedesktop.org;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:from:to:cc:subject:date:message-id:reply-to;
 bh=XmJRlCgQ43HqhYS9HmW8tiBWnQtuxSsa3zDxVOfvub4=;
 b=TqTEV0mIqbOjovf/zMBMWet/X1M3C4YuQYi8mZchQEwBlLWYOTIUtUCILpFbMigQSR
 the01HPVeWKo6bMru1/dtHDV9nzjlGikgL8oL46cJ6+LHuawYrGuPlxiMbSS0GYZ0Rs5
 fuxkrwv+gwdnEtwiel8T8PSM8eWOd96oTAkcGau9Kcy5Iiw3wPLisOERjrPHqfis5/hk
 kEoBo9Khpbw9oastwQh9A+zz/PtRteea+TZOu8MsOp6z3IxmG7kBKeexIthqZR5iznik
 8CIUq383TT6b4Q/i36sonOFmJH+RkghipGYfmxyq7T8HFM9DgEVfvzDbPpidVHdhnKRc
 T29g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734257970; x=1734862770;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=XmJRlCgQ43HqhYS9HmW8tiBWnQtuxSsa3zDxVOfvub4=;
 b=q1I9kLe4hhxYDt8ndQknnaNdnf/m2BJIH3fed+w3gQD/hQ4TEGzcO0ww2co+72P9am
 gzC9UUhttlizqvl3LysxrFFXdIXPBFPh0VYnFD7oXoQXArY/BXBW178z1Aaw2DOMU1Wk
 fe45wKwUV8YjBtZJlVQuA5bs0eo/NvigwdSOT5nsA8W8q54XbyQ7XIuaRnGjawVrhlHt
 o1dyDt4UG6pgp5FYxeUN5mL9TgPSZmt9gQblqtzMGV/0RzOafdLrbsmerNnSfrsVakfu
 kDpMcnYxotcejrz4gAZl6ys4TBbXZ5YOxAnkPSWyUXYPZAucTVyySC4PVwwvcs5trWSK
 kx1w==
X-Forwarded-Encrypted: i=1;
 AJvYcCUNjj5TUPE9sQbf9ANLnwTLpqqdAg7mTGDtg8JQonEouW3a0T2PEbqaRMID3X5vjJOR5uEu1n1Q@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwF8s5CG8h/YFMOVHwWWbYXI/uZNuVV+IJlQ+TjgtmspZ/PqdW8
 PTCUL1UsgWZbfRDKeEIRkgGWviAnYI6xClUMG1Kn4up0nzFmLTdYySm7wts93ig=
X-Gm-Gg: ASbGncs1/FSxcYPrpY4jGM0UWiC76zMUlGEHFswXsJCpYmhxskq4mA1qMzrsDGiYZm8
 2j13TS3hvdnOHMzIQKlSbh+GvhtSWIEKscVnnevNXq0nACmsnZf4NYC/khT2bgMESfHEL/wD7ml
 Kl0hQ+T7JomLE22nCg5CjoZe3Qd0SVmrNLx+zd6cJib40PYZU3IVSD7xvHm+D/8fTEwYnZSUgxS
 utNExIXTCXK5dsxVoZybVXfKLCNE29FbEx05ATYMbum5fNUfdjYOwzTKoWljW6C
X-Google-Smtp-Source: AGHT+IGWyXChb/D3B2rPy2AbSmqVSVzMB+hbWmEQo+gBesrAsnI7rlvG3Pz1R9B+snZAh8Q1EO+Auw==
X-Received: by 2002:a05:651c:2109:b0:2ff:9b6f:23d9 with SMTP id
 38308e7fff4ca-302544268a1mr24067711fa.7.1734257969909; 
 Sun, 15 Dec 2024 02:19:29 -0800 (PST)
Received: from umbar.lan ([192.130.178.90]) by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-3034401d546sm5270851fa.11.2024.12.15.02.19.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 15 Dec 2024 02:19:28 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: [PATCH v2 0/2] drm/nouveau: remove drm_encoder_slave interface
Date: Sun, 15 Dec 2024 12:19:22 +0200
Message-Id: <20241215-nouveau-encoder-slave-v2-0-ef7a0e687242@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIACqtXmcC/4WNQQ6CMBBFr0K6dgwdG4iuvIdhMdIBJiGtmUKjI
 dzdygVcvpf89zeTWIWTuVWbUc6SJIYCeKpMP1EYGcQXNlijs2gdhLhmphU49NGzQpopM1DjvUM
 cyNHVlO1LeZD30X10hSdJS9TPcZPtz/4rZgs1PNlT27SuRb7cZwmk8Rx1NN2+71+5zvEQuwAAA
 A==
X-Change-ID: 20241214-nouveau-encoder-slave-a6dd422fa4a9
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Karol Herbst <kherbst@redhat.com>, Lyude Paul <lyude@redhat.com>, 
 Danilo Krummrich <dakr@kernel.org>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 nouveau@lists.freedesktop.org, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2501;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=3uERJoyD6tEdmd7Ye5Z7DP4u68QhGn6/3ku1AADiaSo=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnXq0vCch41TAM7WiRPkozL/rQQweK5oSKeHQ4y
 RBmwJGmxyWJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ16tLwAKCRCLPIo+Aiko
 1Yr7B/936nIs6FtfnNKBW5AwyrppVEyPZFGQpirMdY83dKN7czEFsLt8zQYuJU5tJ686XowwX2D
 UsMiuGW5oAF3GXiXWDW53Z7lYXrepHGepoJvp7Zu21GxssPV9Kzgs9ST8kT+9Uy9DPCDEbRQuF4
 ACXVXFxo1jy6ozYd/76xCnjeW/W0rkdI9+GqzWPAmggzy+I/KYwAzN1uM4t7Nk7RAZwKZMthyZS
 Vo6nRyPasl5RhLttKblMSXeDQEVQC5CzqMSLef9IYMB4vYJ1K1SLtJpI3pzmBLeWhx4JFjwezYG
 GzShXf1g//MCGCvQp3nx7a25wm4bCjT6e/hY4L/RYo7Ssa0E
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
 drivers/gpu/drm/i2c/Kconfig                        |  18 ----
 drivers/gpu/drm/i2c/Makefile                       |   6 --
 drivers/gpu/drm/nouveau/Kconfig                    |  20 ++++
 drivers/gpu/drm/nouveau/dispnv04/Kbuild            |   3 +
 drivers/gpu/drm/nouveau/dispnv04/dfp.c             |  12 +--
 drivers/gpu/drm/nouveau/dispnv04/i2c/Kbuild        |   5 +
 .../drm/{ => nouveau/dispnv04}/i2c/ch7006_drv.c    |  30 +++---
 .../drm/{ => nouveau/dispnv04}/i2c/ch7006_mode.c   |   8 +-
 .../drm/{ => nouveau/dispnv04}/i2c/ch7006_priv.h   |  11 ++-
 .../drm/{ => nouveau/dispnv04}/i2c/sil164_drv.c    |  33 ++++---
 .../dispnv04/nouveau_i2c_encoder.c}                |  85 +++++-----------
 drivers/gpu/drm/nouveau/dispnv04/tvnv04.c          |  20 ++--
 drivers/gpu/drm/nouveau/dispnv04/tvnv17.c          |   4 +-
 .../gpu/drm/nouveau/include}/i2c/ch7006.h          |   4 +-
 .../gpu/drm/nouveau/include/i2c/encoder_i2c.h      | 109 ++++++++-------------
 .../gpu/drm/nouveau/include}/i2c/sil164.h          |   4 +-
 drivers/gpu/drm/nouveau/nouveau_connector.c        |   6 +-
 drivers/gpu/drm/nouveau/nouveau_encoder.h          |  13 +--
 22 files changed, 172 insertions(+), 232 deletions(-)
---
base-commit: 4176cf5c5651c33769de83bb61b0287f4ec7719f
change-id: 20241214-nouveau-encoder-slave-a6dd422fa4a9

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

