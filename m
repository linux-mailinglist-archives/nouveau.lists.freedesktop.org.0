Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C499ECBA22D
	for <lists+nouveau@lfdr.de>; Sat, 13 Dec 2025 01:54:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6BC8810E373;
	Sat, 13 Dec 2025 00:54:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="MWc214jH";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-qv1-f51.google.com (mail-qv1-f51.google.com
 [209.85.219.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6ECF510E373
 for <nouveau@lists.freedesktop.org>; Sat, 13 Dec 2025 00:53:59 +0000 (UTC)
Received: by mail-qv1-f51.google.com with SMTP id
 6a1803df08f44-88a22eb38edso495946d6.2
 for <nouveau@lists.freedesktop.org>; Fri, 12 Dec 2025 16:53:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1765587238; x=1766192038; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Ve33K6PM4qmVAbiznfkMhmxqrGOtTDLlXSBQIY2aSec=;
 b=MWc214jHGKYXxYO+lL0+yP2Xj0xBR7TeBYd+M3WyUTWK/MWUTNiX6OBmHQ7XZXRekI
 Ne7T8PYFmqGZWdvNw9lI1Sn/AILDD0xM+g2lUy1+3MN9Oyl5HPtIImGLSP1Zd0OpXyXn
 4LjHEC/DiVpI5WF/ZfZZK1C4hUJ4wk/sedkLYg9iBsRBoNH85/KhzVVyv6sJ1dYDWlt2
 V6/BqaC/BrCPCKt3B2zXEvitXjijmFzC9rN+F3QBU0yM9TD3eV/MVH7p19W+wT+DlOhK
 YDMlAkPbkA08AP49QGkvPUclmpeWM3lZyDH3dFtrMnCATqvZOdIF5drxv5c8z7hdadhm
 W4lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1765587238; x=1766192038;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Ve33K6PM4qmVAbiznfkMhmxqrGOtTDLlXSBQIY2aSec=;
 b=CZyHVMveUgIZ4AbMl3FAYr9WSjkMFssWR/9bZLW/gU3Nk63J/3ipWtc6OFCvCTU+O+
 dyCeAjKOuWB1pl/0uFuMSfp3dgRZoSbp74UOIY/jqvf30YzCrqz2zHA+vJQAPgX5kVK2
 bEyvtsjCQpBsROZ1eYo7cCyJKaYsN9iZ4aU2YNqhoRv9OFHxZANgqNttMVHKsGHvLKzL
 n4hbWBSAZf/xTzxEsYwwAovaJxUgz5seEf34WjzC1Py+TVYyDNoCI2UdqFLvuMDcWPKX
 XeaCAJlWNB5GSS6rIwMFeLVBKrRQFCJQ3NPfRoyOJnKcF4YmWDG6eTgIQ62nIIXo0V9H
 BQDw==
X-Gm-Message-State: AOJu0Yw2axcxjudJLZCBA8i2sVzD9EgA9Zf89H/qhobIFoHkmh3rNqhS
 z7V7qy7wDLl1+2O3rsXnYV5cs1bxNoljUVVPDw1Uar/7a7lTQQCx9SH9
X-Gm-Gg: AY/fxX5DM1wUZ5HPI7IfX6niGWWOxO5G6u352UQmNvpolcBScfOk8Ngi5YSyjG03NUG
 jeCLPEq3tThwAa+sw+2qxoh2uB+DmpT3kmkaWNRC7Aotp6syOVdPW1LeK+/nJn32J/TI3Hv7QL1
 W6EW9xNTFZJ/PDytViFAKFDVKKHrqJxcrtfmEEFAU31BIuEVFInL37ETk7mShIIG+2ulFijq2/j
 Grj6p9SPMIFTkTzCt9RWvOs4KEYau9PDLLjyHPPEveLo7rwSwICpwn8EUolTVzX6owFMFSDLVup
 jK/BQQIFBx5S97kmQQd5a5z26u0usYEr+y3OXQGQXGcyByZcTeub/WYcSQJFaxgh08sTsB+cFiM
 8RwaFiUKdgoKtGCOS7YSlYJpwtZE+6fSq94fjR5tY6EBL+Jzr+KYS2skdJ0datCDw+QzivOHYbY
 lE2AxV
X-Google-Smtp-Source: AGHT+IF4nBNRqdWjaS3TsiTeSwzjTNL7QD7vB52ZPkoojXohFwOQTudNgDWn2yFdqJznDr3zNMj/dQ==
X-Received: by 2002:a05:6214:5f0f:b0:882:4dec:42b9 with SMTP id
 6a1803df08f44-8887e444717mr68067276d6.26.1765587238456; 
 Fri, 12 Dec 2025 16:53:58 -0800 (PST)
Received: from kunkbox.lan ([2601:18a:8300:336d::6c2])
 by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-88993c61ff0sm4452176d6.21.2025.12.12.16.53.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Dec 2025 16:53:58 -0800 (PST)
From: lxrmrz732@gmail.com
To: lyude@redhat.com,
	dakr@kernel.org,
	airlied@gmail.com
Cc: nouveau@lists.freedesktop.org, lxrmrz732@rocketmail.com,
 Alex Ramirez <lxrmrz732@gmail.com>
Subject: [PATCH v3 0/2][RESEND 2] drm/nouveau: add and implement missing DCB
 connector values
Date: Fri, 12 Dec 2025 19:53:25 -0500
Message-ID: <20251213005327.9495-1-lxrmrz732@gmail.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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

From: Alex Ramirez <lxrmrz732@gmail.com>

uconn.c's handling of display connectors was refactored for Linux v6.5,
causing a regression that issues a warning on boot for GeForce 8600m GT (MacBookPro4,1)
and likely other legacy GPUs.

Several connector types used to be implicitly supported before v6.5 by a branch in
[drm/nouveau/nouveau_connector.c:1353] that determined connector types using encoder
bits, but these connectors have since been left entirely unhandled after the refactor:
the aforementioned kernel warning causes that branch to never be taken.

nv_connector->type is generally 0x0 (DCB_CONNECTOR_VGA) in the case of an unknown
connector because the WARN_ON macro in [drm/nouveau/nvkm/engine/disp/uconn.c:214]
causes nvkm_uconn_new to bail out before a suitable connector value is chosen;
it *seems* like the value is left undefined.

This patch set implements the missing DCB connector values per NVIDIA spec to fix the
root cause of the warning AND changes the WARN_ON macro in uconn.c to a printk message
to more gracefully indicate unknown connector types, as was done pre-v6.5.

v2: Include better commit messages. My original submission was partially
blocked by a spam filter.

v3: Update NVIDIA documentation link according to Petr Vorel's suggestion.

Alex Ramírez (2):
  drm/nouveau: add missing DCB connector types
  drm/nouveau: implement missing DCB connector types; gracefully handle
    unknown connectors

 .../nouveau/include/nvkm/subdev/bios/conn.h   | 84 ++++++++++++++-----
 .../gpu/drm/nouveau/nvkm/engine/disp/uconn.c  | 73 +++++++++++-----
 2 files changed, 116 insertions(+), 41 deletions(-)

-- 
2.52.0

