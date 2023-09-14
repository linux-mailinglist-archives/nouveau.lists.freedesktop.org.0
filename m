Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9315C79FEBD
	for <lists+nouveau@lfdr.de>; Thu, 14 Sep 2023 10:47:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B31C10E522;
	Thu, 14 Sep 2023 08:47:03 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-pf1-x436.google.com (mail-pf1-x436.google.com
 [IPv6:2607:f8b0:4864:20::436])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA15E10E51F
 for <nouveau@lists.freedesktop.org>; Thu, 14 Sep 2023 08:47:01 +0000 (UTC)
Received: by mail-pf1-x436.google.com with SMTP id
 d2e1a72fcca58-68fbb10dec7so608303b3a.3
 for <nouveau@lists.freedesktop.org>; Thu, 14 Sep 2023 01:47:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1694681221; x=1695286021; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=zMjUA+15Wfn7Qtxj/e6rLV9kK0rq5ztmPJgQX6aeZMg=;
 b=Sf/QLHwVrtB1AfCYL/Qmu8pbkLep6CVCU19jOpf8+a3gJ5FAlqfx77tS/HZnAwbXZ/
 tsBUtrlJHPW9Q5TbGr6EtkZl17+JDdEFzd/hVs5jAQNSzIoghl0aLUA3Q7kxUVmVDcFR
 pRkJ/5IikLtHO3AQP31ubeBAO91J6nPcBHONyxDbdIbWnHFbK6AUOopdNCrH2yzLTZOR
 RQWlNei3ev/xtnFjqz7rSYXu5/Ua4NyDlm6JPP1eH0G6gH9/AWL0JhY+LOzVTiTOv7x1
 OOJ8cDOjubgxQggRsTBVZM4cewe+xWR2Adz0AQV95PUi/jrEQ1U7E+L6gt/3aJ9CbhXY
 3xNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1694681221; x=1695286021;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=zMjUA+15Wfn7Qtxj/e6rLV9kK0rq5ztmPJgQX6aeZMg=;
 b=l1NveZoh71kwP1BFd7GK0dJpZ42qVKHAbc+amjKUY2AHkHzMAClq2FUqtajxpYhM7c
 Lnle/h5qk6tzkYudP+wBS3K/91eu2lojf8NLl41b6KRHMz5yOFyTe0pHTQkMsIPlR+dg
 /R+/Fob+JCWL/zEW6JxBmPFK8/iRp7MotXl9nnwv+r19nt95MyXp5L0dmFC1nIM5s1hs
 odD+MrByWjxx5a/gcUQz4FiOPvQ4i36xzaUlJ8qIr7VYHyhyPs6bbFM1isMDFA65QTBU
 zgtrekjR02BS05Y1xgJ3VKpXjk3ymXEOkeZtkb1p6QoT23Jntf2zfJWToVHUKfsM7w/L
 GeuQ==
X-Gm-Message-State: AOJu0Yxcaxl6mExrnEN/Hj9bX2qumRBOVwtQM1uQzFQ4TLHdXNcqWUvA
 Q6Lk+VxhqZEFcESjOXFHgs/50dH1k5c=
X-Google-Smtp-Source: AGHT+IHQXjDM2V1BoBdZTKS8HWIcaePpZ83tCWe70KGBUwWnqZ4v4tdT5CBdU3qYH9q4cIifcm+sbg==
X-Received: by 2002:a05:6a00:2a06:b0:690:25fb:bac1 with SMTP id
 ce6-20020a056a002a0600b0069025fbbac1mr2162759pfb.18.1694681220785; 
 Thu, 14 Sep 2023 01:47:00 -0700 (PDT)
Received: from localhost.localdomain ([87.121.74.45])
 by smtp.gmail.com with ESMTPSA id
 e23-20020a62ee17000000b006889081281bsm839205pfi.138.2023.09.14.01.46.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Sep 2023 01:47:00 -0700 (PDT)
From: Ben Skeggs <skeggsb@gmail.com>
To: nouveau@lists.freedesktop.org
Date: Thu, 14 Sep 2023 18:45:42 +1000
Message-ID: <20230914084624.2299765-3-skeggsb@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230914084624.2299765-2-skeggsb@gmail.com>
References: <20230914084624.2299765-2-skeggsb@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Nouveau] [PATCH 01/44] drm/nouveau/devinit/tu102-: remove attempt
 at loading PreOS
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
Cc: Ben Skeggs <bskeggs@redhat.com>
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

From: Ben Skeggs <bskeggs@redhat.com>

From Turing, HW will already have handled this and locked-down the
falcon before we get control.  So this *should* be a no-op.

Signed-off-by: Ben Skeggs <bskeggs@redhat.com>
---
 drivers/gpu/drm/nouveau/nvkm/subdev/devinit/tu102.c | 12 ++----------
 1 file changed, 2 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/devinit/tu102.c b/drivers/gpu/drm/nouveau/nvkm/subdev/devinit/tu102.c
index 81a1ad2c88a7..40997ad1d101 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/devinit/tu102.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/devinit/tu102.c
@@ -83,17 +83,9 @@ tu102_devinit_wait(struct nvkm_device *device)
 }
 
 int
-tu102_devinit_post(struct nvkm_devinit *base, bool post)
+tu102_devinit_post(struct nvkm_devinit *init, bool post)
 {
-	struct nv50_devinit *init = nv50_devinit(base);
-	int ret;
-
-	ret = tu102_devinit_wait(init->base.subdev.device);
-	if (ret)
-		return ret;
-
-	gm200_devinit_preos(init, post);
-	return 0;
+	return tu102_devinit_wait(init->subdev.device);
 }
 
 static const struct nvkm_devinit_func
-- 
2.41.0

