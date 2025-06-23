Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 84705AE5553
	for <lists+nouveau@lfdr.de>; Tue, 24 Jun 2025 00:10:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A9AF010E470;
	Mon, 23 Jun 2025 22:09:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=darkrefraction-com.20230601.gappssmtp.com header.i=@darkrefraction-com.20230601.gappssmtp.com header.b="Ubg3hDfX";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-qv1-f42.google.com (mail-qv1-f42.google.com
 [209.85.219.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 778AF10E470
 for <nouveau@lists.freedesktop.org>; Mon, 23 Jun 2025 22:09:57 +0000 (UTC)
Received: by mail-qv1-f42.google.com with SMTP id
 6a1803df08f44-6fa980d05a8so44671596d6.2
 for <nouveau@lists.freedesktop.org>; Mon, 23 Jun 2025 15:09:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=darkrefraction-com.20230601.gappssmtp.com; s=20230601; t=1750716596;
 x=1751321396; darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=1nuGlJAk99F9szc3kYMP1AwVjb/D91a8HtVJ+JX/QFY=;
 b=Ubg3hDfXwIkiUWkr+lXK444hzpZBRABHrs4dEoTtguU/PKO+J4fCEcsZsKi1fXa/eE
 s/z1JGKAOYqrn1BedAE5H5n+gH79U7zPn9TcC25oxkTZXb9CDt+G2C9pCdkBcM6j/guN
 frp38CB+2Q2ud4OA4ojvXuMzzEa5yFhxaDqpmd5CWG7pLdfYGYjRZXdhajc0DJo4zELL
 rgVtmtYpl4rQ1Ho2bQfJ2MLFp3UPK5M5M3AvOgzq4LgVhsgydwwopsTUhHBkynDe3lha
 VpglVtiSpv5s8VVZU1svRrw5XDzVmxac97Fh9hwiPvVLJ8tyTf9Dclg2TRzlv2QA7VdB
 qxcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1750716596; x=1751321396;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=1nuGlJAk99F9szc3kYMP1AwVjb/D91a8HtVJ+JX/QFY=;
 b=O9pnxDCQ4/WTVXxUGkXnmWWXokdVyBb9tI+nYvbNCPLvlwGHV5FrG6Aeg4nasC5dO0
 r0CzS0RsDExGodyEu7x1fQ+IyX6JyQ7u/Zv6r36pZLgg/jXbssv247daMNv0MzstKwXJ
 pD1YSgejsdyotpFpsP0VZlHjER0JM3/sdx8lXn0zLwskRFCopLwxCi5J1ypt82BEOzaz
 iSXBjc3ABxzKiGmlP9TIIZuv3XUEGDjVcJMd7atWgCrMzWoUnS2ZiPjyUGlY486TIDp4
 zTxW/8QP0OQWSK9J+TB73AttMIYUvQ2WpP/CjqlFbYS7sQrFEc96+pd45/QZWtZigJYx
 3ehA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUgfBQklgwoYOQ7/O7GthhIBmaWdclY9RtM5turZvVyxXKN0Cq3ZJrQQ2PKg2tnbF7X2VxnBeWe@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzJ7886APMJivn9hoye9ysY2jPhacS9m7I8bzohx40qEfj+uuxT
 ooDHJh1hd5gG+I8pRk9QwPV3U7bbm4BGzp3zvjixiad3Cgf2pyNswA2imHNqAp2Bk60=
X-Gm-Gg: ASbGncsNQKBmqgodsXlRLHDOyK48NMvVrYef9tXQGBm9fLIoc4ffby/K4im2zBlVESs
 5bYBXmu5/NTmZ6QSkEX9NfjGnIjkSs9vQjO5bp7Qp4FNNJdQUYD6r5mzPp13OeFhOlHFX4v5taN
 FQgCPRUk/C8nH01LtyQernncr+Zl2twzB+sBqln/Gc7e7YxO1KTd9outq83LCmL4q+6763Z1V3m
 vpTDNdZTnkhcHpV+zNechwybOupLuZO4x4kvd746i+8S+mn5oG/OfTKxzcSEnEUTU8Kx7xhmHoP
 6nstmeThTwTXWPwFgnM40vFCWhpNYwyTbGJQFyagFIsLWmHcm8nfTgyeLZSV6AxEkX5GczGxv5T
 l7MN2NImoYHN41STrAvKY33pcGkk7pFL6mb25NExGoqwOZYqTdDs=
X-Google-Smtp-Source: AGHT+IHaNCMjhd44SlVTJL8Io/YJXCsr0wcdj+yfWlnEs2qWr8133S97D6OLT/9oiMTHDopQCZZ2wA==
X-Received: by 2002:a05:6214:485:b0:6fa:c5f0:bf57 with SMTP id
 6a1803df08f44-6fd0a587d49mr273331546d6.38.1750716596485; 
 Mon, 23 Jun 2025 15:09:56 -0700 (PDT)
Received: from m-kiwi.verizon.net (pool-71-167-25-61.nycmny.fios.verizon.net.
 [71.167.25.61]) by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-6fd09425af6sm50019856d6.27.2025.06.23.15.09.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Jun 2025 15:09:56 -0700 (PDT)
From: Mel Henning <mhenning@darkrefraction.com>
To: Karol Herbst <kherbst@redhat.com>, Lyude Paul <lyude@redhat.com>,
 Danilo Krummrich <dakr@kernel.org>,
 Faith Ekstrand <faith.ekstrand@collabora.com>, ttabi@nvidia.com,
 bskeggs@nvidia.com, martin.peres@free.fr, dri-devel@lists.freedesktop.org,
 nouveau@lists.freedesktop.org
Cc: Mel Henning <mhenning@darkrefraction.com>
Subject: [PATCH 2/2] drm/nouveau: Remove nvkm_gsp_fwif.enable
Date: Mon, 23 Jun 2025 18:04:02 -0400
Message-ID: <20250623220909.7591-3-mhenning@darkrefraction.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250623220909.7591-1-mhenning@darkrefraction.com>
References: <20250623220909.7591-1-mhenning@darkrefraction.com>
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

This struct element is no longer used.

Signed-off-by: Mel Henning <mhenning@darkrefraction.com>
---
 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/ad102.c | 4 ++--
 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/gb100.c | 2 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/gb202.c | 2 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/gh100.c | 2 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/priv.h  | 1 -
 5 files changed, 5 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/ad102.c b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/ad102.c
index eb765da0876e..35d1fcef520b 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/ad102.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/ad102.c
@@ -41,8 +41,8 @@ ad102_gsp = {
 
 static struct nvkm_gsp_fwif
 ad102_gsps[] = {
-	{ 1, tu102_gsp_load, &ad102_gsp, &r570_rm_ga102, "570.144", true },
-	{ 0, tu102_gsp_load, &ad102_gsp, &r535_rm_ga102, "535.113.01", true },
+	{ 1, tu102_gsp_load, &ad102_gsp, &r570_rm_ga102, "570.144" },
+	{ 0, tu102_gsp_load, &ad102_gsp, &r535_rm_ga102, "535.113.01" },
 	{}
 };
 
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/gb100.c b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/gb100.c
index 12a3f2c1ed82..1b3b31b95ce4 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/gb100.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/gb100.c
@@ -20,7 +20,7 @@ gb100_gsp = {
 
 static struct nvkm_gsp_fwif
 gb100_gsps[] = {
-	{ 0, gh100_gsp_load, &gb100_gsp, &r570_rm_gb10x, "570.144", true },
+	{ 0, gh100_gsp_load, &gb100_gsp, &r570_rm_gb10x, "570.144" },
 	{}
 };
 
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/gb202.c b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/gb202.c
index c1d718172ddf..51384c63148c 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/gb202.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/gb202.c
@@ -20,7 +20,7 @@ gb202_gsp = {
 
 static struct nvkm_gsp_fwif
 gb202_gsps[] = {
-	{ 0, gh100_gsp_load, &gb202_gsp, &r570_rm_gb20x, "570.144", true },
+	{ 0, gh100_gsp_load, &gb202_gsp, &r570_rm_gb20x, "570.144" },
 	{}
 };
 
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/gh100.c b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/gh100.c
index ce31e8248807..b0dd5fce7bad 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/gh100.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/gh100.c
@@ -344,7 +344,7 @@ gh100_gsp_load(struct nvkm_gsp *gsp, int ver, const struct nvkm_gsp_fwif *fwif)
 
 static struct nvkm_gsp_fwif
 gh100_gsps[] = {
-	{ 0, gh100_gsp_load, &gh100_gsp, &r570_rm_gh100, "570.144", true },
+	{ 0, gh100_gsp_load, &gh100_gsp, &r570_rm_gh100, "570.144" },
 	{}
 };
 
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/priv.h b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/priv.h
index 4f14e85fc69e..c3494b7ac572 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/priv.h
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/priv.h
@@ -14,7 +14,6 @@ struct nvkm_gsp_fwif {
 	const struct nvkm_gsp_func *func;
 	const struct nvkm_rm_impl *rm;
 	const char *ver;
-	bool enable;
 };
 
 int nvkm_gsp_load_fw(struct nvkm_gsp *, const char *name, const char *ver,
-- 
2.50.0

