Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F235EB2178B
	for <lists+nouveau@lfdr.de>; Mon, 11 Aug 2025 23:39:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9AD5C10E553;
	Mon, 11 Aug 2025 21:39:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=darkrefraction-com.20230601.gappssmtp.com header.i=@darkrefraction-com.20230601.gappssmtp.com header.b="eOuzBlBx";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-qv1-f54.google.com (mail-qv1-f54.google.com
 [209.85.219.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9044210E554
 for <nouveau@lists.freedesktop.org>; Mon, 11 Aug 2025 21:39:04 +0000 (UTC)
Received: by mail-qv1-f54.google.com with SMTP id
 6a1803df08f44-7073075c767so59115776d6.3
 for <nouveau@lists.freedesktop.org>; Mon, 11 Aug 2025 14:39:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=darkrefraction-com.20230601.gappssmtp.com; s=20230601; t=1754948343;
 x=1755553143; darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ZCIAkGeT2vZNSLCvoLyr3RnZmR3ss1FWHMBkfixBQwE=;
 b=eOuzBlBx7xhgVfImS9wH9zQNVfl4Y4t8Ed5oDWPPXVaLQ5pBKEFY+my/PjKpRLQ5NW
 CPZwnOyhZAvtsh15mbopRJFrE1vasBP/J/STByrrQ8BML57YpW4LByRBwLWAQa/48DiD
 f5fzFHE+mOYxck9yat9SAgpdGThKzvlDcD4y+gWYQBPgqLtF7cEoz8wUfy/XS6ujooOe
 HFIIeMnDxijphcqn6YwY0zILJ/srje9hSEf3ppszLWVQy75vA3a1S7FEt2ejs4HNpYRi
 ScOX+6/mX9dBqq3g9c7bHrggm8wrtFTDCS1L7zyBgE0AbNXq20E8farwq6X76UU4/cPn
 D8QA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754948343; x=1755553143;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ZCIAkGeT2vZNSLCvoLyr3RnZmR3ss1FWHMBkfixBQwE=;
 b=jafyf2bY4trid8x1ELmG8zeg+f2o9Taz2V1OH0HwUdz2chqaFttmTTx8KGcB8CC7Ye
 sAVeYRE0UyDzN048sZXbpCkhFcFuA+B4N/rIjEzFWq53FZEpSH+T79EYzKr49XeXZRqX
 BRV8PDamS5icaqL/iE7VbpGsL6l1Z1hFh4z77zd8T4CtopwcCz1tFJQhr2VKnikOagxu
 UmOhgPLF4xMHMFtjZntcB1MepcxHVEJA8CnFFARCj7FolrdUg+oxPbAAWQuqQVJ53/pE
 L3tbBGTZ3V8CZRar5wg2Of+aqZVx/u1GvPJaE8dHtWOaINYDkjtriQD4oGXbg2nluAMj
 guKA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXVuvul0co4iXWeLxV9mZ+hCAtA8p4/FoYcPq02FKM6oRuAAO7xpnJchahYWW0DJk0aR2Vy4wc4@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxYIBvtk3p5RLCKRgDRPHwWf8nKBJFlmuEljvjQx3/bddEqD+n9
 BMs3Gea658ckWMqFh35XMPZ1PDCuAh/UekC95BfaTya2RxQKktGGeN2iibgt1dK945Y=
X-Gm-Gg: ASbGnctzf4KfRsBRS6fjosOBeq1LDIKAA5VosXJ3L9oNirEcZzCjGcGtUx01Q0i+osp
 NQevTlRltUyNV3P+63Vizb3KfsEAmHyh/ARjh01wB0UgZvZS76dTEfg+Fc5Tx/04N1WH+nMZVGa
 Y+QZyINWbDvlzafDmcJcoPXN0+1KyRhV0Pa6RcFwN1i4HhIhEGRN2w6+1YBBjko7LKxNAldADsM
 FsiZ3tt5YHHDqks4th9NI5I2bnsQ1YI7M1kQPZpXwE/t59aWs0fL7dfSBgdC8L9/q6W5vuBxRFk
 M3qwsrQXFsxlwUFptWmrYkevZssuaj1lHoujOix5yJ9v+jnd3vHK0NsXeo/d2VKTdIYg58KVuHT
 T3j2OeXAVqHRdEoaseMWq4+jF4b+KBQWzJJGWKOQSxY1cOMnIXLLyPiEazTC9YuO5kfBa5mxd+i
 tHpotRbKL0SD+W3Js=
X-Google-Smtp-Source: AGHT+IFSw1YwtSXE4UQC4rL3iJs+44Dv+VefFzT65FxYokrpqoGKJ7IIaNC1jQljGNpJJZBzSRriPw==
X-Received: by 2002:ad4:5e8a:0:b0:707:451e:2787 with SMTP id
 6a1803df08f44-709d5dc3956mr23469276d6.28.1754948343585; 
 Mon, 11 Aug 2025 14:39:03 -0700 (PDT)
Received: from m-kiwi.verizon.net
 (pool-108-18-253-193.washdc.fios.verizon.net. [108.18.253.193])
 by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-7077ca1d5ecsm163097136d6.26.2025.08.11.14.39.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Aug 2025 14:39:03 -0700 (PDT)
From: Mel Henning <mhenning@darkrefraction.com>
To: Karol Herbst <kherbst@redhat.com>, Lyude Paul <lyude@redhat.com>,
 Danilo Krummrich <dakr@kernel.org>,
 Faith Ekstrand <faith.ekstrand@collabora.com>, ttabi@nvidia.com,
 bskeggs@nvidia.com, martin.peres@free.fr, dri-devel@lists.freedesktop.org,
 nouveau@lists.freedesktop.org
Cc: Mel Henning <mhenning@darkrefraction.com>
Subject: [PATCH 2/3] drm/nouveau: Remove nvkm_gsp_fwif.enable
Date: Mon, 11 Aug 2025 17:32:32 -0400
Message-ID: <20250811213843.4294-3-mhenning@darkrefraction.com>
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

This struct element is no longer used.

Signed-off-by: Mel Henning <mhenning@darkrefraction.com>
Reviewed-by: Ben Skeggs <bskeggs@nvidia.com>
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
2.50.1

