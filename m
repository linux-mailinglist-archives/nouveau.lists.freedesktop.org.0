Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 595B2B21790
	for <lists+nouveau@lfdr.de>; Mon, 11 Aug 2025 23:39:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2DCD310E558;
	Mon, 11 Aug 2025 21:39:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=darkrefraction-com.20230601.gappssmtp.com header.i=@darkrefraction-com.20230601.gappssmtp.com header.b="hN8GktFA";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-qv1-f51.google.com (mail-qv1-f51.google.com
 [209.85.219.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 55E1910E557
 for <nouveau@lists.freedesktop.org>; Mon, 11 Aug 2025 21:39:07 +0000 (UTC)
Received: by mail-qv1-f51.google.com with SMTP id
 6a1803df08f44-704c5464aecso47865446d6.0
 for <nouveau@lists.freedesktop.org>; Mon, 11 Aug 2025 14:39:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=darkrefraction-com.20230601.gappssmtp.com; s=20230601; t=1754948346;
 x=1755553146; darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=7cmh9zZEdqiV3NmqqAUhDgNdsvYT/9RhKyW5oIISWXc=;
 b=hN8GktFAQ9YkY76geCOwmuOuesZmJ337On7nITsNEYjITcj0x4NKo99vzs5KHloV3O
 JQM09uUzx2zUsmIco48POky8oG482I3z0ph751LfruMbM5g9IikV2HLz83QrbiLiTsI0
 4w9Opy5nJERcFMVAj0Ht1Px7zNLFtZTnQEZWemQ24EzY7TeRtHVF9ObI3D5x4xhJ6fN8
 pPQ0zgZiMwNG986lxr+zpDNEK1iSaOoFBK3Q/NWRUuh6NRas6QcEhi7rUcK5aE/DeYrW
 zuDbVni/ETf5gm3vzJRIvK0bIuQJ8DaF4nUocdr0Unq/6aEfBsr5/5Kb5eAh2b3jAPEy
 dbrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754948346; x=1755553146;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=7cmh9zZEdqiV3NmqqAUhDgNdsvYT/9RhKyW5oIISWXc=;
 b=bqYTH8ogNtnd8C0bhLDX/OijP0BQJi4vgUOXI7uaVFVcTJdo6XuJiH6FzbJhCA005G
 HgeyvDvaCaw0X5ZgQUlEsjTYZSi2CbqhrZ9iQkvosRKyNlGVdXhNoaegEvz0erFzvoPa
 dc4tUtLu06jsGQeyyRfLda+Ykrpvho0Mqc2kNQioTN7B60x3Pu/RpvFfA0gNIhQHHkI6
 lepu0IMLWVFDfM6OafhBeBF5mxpqbZTHbIRzUbEsxNMcA39/rGbdGAtvMI71nLA0jtJu
 FmrLjTsZVtLEXGsinvSLraVCrpPKMYYHXE4zsoz+RJAE+JnUnHDZHgK0RMcDc3N0a7Ft
 rzVw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVo3BNtO0tJ+6kPXaG0s00R/r+KKFwIuM2FtqU5AafNri+Ry9ylqEV3la7RIyu+JjYpzt++vPHR@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwpDscKoHvIXTBmhLsfHiPuimC0vE7rQJx9SR0C5GoIK8LIRkkg
 T7Hes2wRkQpD3NpJ7BGWZyX9NG6XZ9A+M1sILcmbRrJvdkVwHE+q9/6G/xtxYrnU+Sk=
X-Gm-Gg: ASbGnctX/kqdNnfAnWkXON90F0gTCy6mFzo6OaX3FJse8aKQTfAHIaYpA7G5Su58hvb
 ZHFd5izwhHQ8rqNx10/OxGL55V9OKu3js6RUJMjLeoR1qBgo6D/8Qko1TwZ9TDFf8Ro9vdu4U2F
 p/6/P0TcXpScxeGzU3s0ymtJrjbO03sDKxnT8aOorkr/4hk+fnMPB+OYGgS3e2HMfzLHszTi10/
 f9YkB1GqpIkLrkBru/fuXouj/8dx6AHdZEl2K68jC9s6HRXvQe+/B0YrZ3+5s6t0MigRjFqtnoR
 DmyndgLms8v5YDjw+Y+4tBYotGXNEOwVttMFRDEXjxp8Grq0rqJgTEXSpsJ4Awpykx3WLiyUQ3K
 4AcNlPf4t3eIrnvx5YvrzRHcoQwXr/g+69UIEq54WkzTDgLZHkSIvsSMjOP/oaz1GfuifpwgzdW
 Crj4SYGdh8R/xcPKI=
X-Google-Smtp-Source: AGHT+IGRoeaO9O+qk/W9QptasfYz+/nbhpKM+4WgmkKbkhdulQI095MnF1uSmFsRzxpH9JvpOpQ7cw==
X-Received: by 2002:a05:6214:b65:b0:707:56a4:5b56 with SMTP id
 6a1803df08f44-709d5eba2b9mr21027726d6.40.1754948345817; 
 Mon, 11 Aug 2025 14:39:05 -0700 (PDT)
Received: from m-kiwi.verizon.net
 (pool-108-18-253-193.washdc.fios.verizon.net. [108.18.253.193])
 by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-7077ca1d5ecsm163097136d6.26.2025.08.11.14.39.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Aug 2025 14:39:05 -0700 (PDT)
From: Mel Henning <mhenning@darkrefraction.com>
To: Karol Herbst <kherbst@redhat.com>, Lyude Paul <lyude@redhat.com>,
 Danilo Krummrich <dakr@kernel.org>,
 Faith Ekstrand <faith.ekstrand@collabora.com>, ttabi@nvidia.com,
 bskeggs@nvidia.com, martin.peres@free.fr, dri-devel@lists.freedesktop.org,
 nouveau@lists.freedesktop.org
Cc: Mel Henning <mhenning@darkrefraction.com>
Subject: [PATCH 3/3] drm/nouveau: Improve message for missing firmware
Date: Mon, 11 Aug 2025 17:32:33 -0400
Message-ID: <20250811213843.4294-4-mhenning@darkrefraction.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250811213843.4294-1-mhenning@darkrefraction.com>
References: <20250811213843.4294-1-mhenning@darkrefraction.com>
MIME-Version: 1.0
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

This is inteded to address concerns that users might get cryptic error
messages or a failure to boot if they set nouveau.config=NvGspRm=0 on
the kernel command line and their gpu requires gsp (Ada or newer).
With this patch, that configuration results in error messages like this:

nouveau 0000:01:00.0: gsp: Failed to load required firmware for device.
nouveau 0000:01:00.0: gsp ctor failed: -22
nouveau 0000:01:00.0: probe with driver nouveau failed with error -22

When nouveau fails to load like this, we still fall back to the generic
framebuffer device, so users will still have limited graphical output.

Signed-off-by: Mel Henning <mhenning@darkrefraction.com>
---
 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/base.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/base.c b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/base.c
index d23243a83a4c..7ccb41761066 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/base.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/base.c
@@ -138,8 +138,10 @@ nvkm_gsp_new_(const struct nvkm_gsp_fwif *fwif, struct nvkm_device *device,
 	nvkm_subdev_ctor(&nvkm_gsp, device, type, inst, &gsp->subdev);
 
 	fwif = nvkm_firmware_load(&gsp->subdev, fwif, "Gsp", gsp);
-	if (IS_ERR(fwif))
+	if (IS_ERR(fwif)) {
+		nvkm_error(&gsp->subdev, "Failed to load required firmware for device.");
 		return PTR_ERR(fwif);
+	}
 
 	gsp->func = fwif->func;
 
-- 
2.50.1

