Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F63F7FA018
	for <lists+nouveau@lfdr.de>; Mon, 27 Nov 2023 13:56:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 12C8310E25F;
	Mon, 27 Nov 2023 12:56:40 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D063A10E25F
 for <nouveau@lists.freedesktop.org>; Mon, 27 Nov 2023 12:56:37 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-40a4848c6e1so29001555e9.1
 for <nouveau@lists.freedesktop.org>; Mon, 27 Nov 2023 04:56:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1701089796; x=1701694596; darn=lists.freedesktop.org;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :from:to:cc:subject:date:message-id:reply-to;
 bh=OIYOB2eU2H+bluz3T89WDZtEixLUpIjEWJSjNBKPfQM=;
 b=G6QxIhaJV9BVgb+e4xa7j14bogl1llp0lw72u8Fqiet/Llxwy/CW8pg3Lp3P8q3Dts
 lFgvP7BNNkfEqhu0qhHeBi3BGDk+bXLIhLt/bfSUN/WS8PWwbC2quWqfhoYDpZn59UIn
 6gjjBQOxYi+FGPCcnGyTStrrniE8kNCF2WHo8wIMIi1WnUA5LL285GoGBKRKDfmWrHGA
 kMUmW1y7K7ZbQ8D9OwaiQo0zs8zDoqth7YxLs00YiEaUSH2M748sTrPpbZyAR0SHTF/t
 2PdINBJlB56MX9ZF+CsqGeFCqZQ7jPQmJmhfrC5wihUJzFULCZ0fgsJdA1iApsTz8vla
 mgEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701089796; x=1701694596;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=OIYOB2eU2H+bluz3T89WDZtEixLUpIjEWJSjNBKPfQM=;
 b=RT2th2GS1URa3VxqPejReP0tsTLfVtm31Ns+wo+yOr7QxiK1sZa1ZuHPRyEb72D6Cl
 g4PRHvEwQj0ik1PAY4zpU//qiMxYuMoNQF8MACrODzZyY2/CZtgf0+48r0W5Quq3P8Pp
 SUZaf8sHNmqgzNg6ZFe8sw2tIDDuJ9W0a+YukUDVzPHmILQ+rGjL8YnheycAoPW8iqMi
 z/KFsG7pKozwfRHV1ZFFwono1Dk7z+TAfvdS/GnPLncQUNzFYF8aXaH7529GTF0jf15G
 1AcIZbzyJsyXlyB8VoaEY9f0VqlJJDQ3pYj49nV9f5pIvGuPULbA4oqoIQcLYqK96Hai
 7nsA==
X-Gm-Message-State: AOJu0Yyf5+1fckMbVuoU62Te0CQ9EN965MKXVbfwiYNhFa18bZIdzeFj
 JcnfTq+/KrfzJ+kxBhJ5QkySTg==
X-Google-Smtp-Source: AGHT+IFPPTGfLzqzJNgYs1IpQL1hsJuI8oapdRcXNEpwBLbJewMCagBAP3dI7Z2zilUHv4TqflpLPA==
X-Received: by 2002:a05:600c:45cf:b0:3f6:58ad:ed85 with SMTP id
 s15-20020a05600c45cf00b003f658aded85mr8311151wmo.10.1701089796257; 
 Mon, 27 Nov 2023 04:56:36 -0800 (PST)
Received: from localhost ([102.36.222.112]) by smtp.gmail.com with ESMTPSA id
 z15-20020a05600c220f00b003fe1fe56202sm13576241wml.33.2023.11.27.04.56.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Nov 2023 04:56:36 -0800 (PST)
Date: Mon, 27 Nov 2023 15:56:33 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Karol Herbst <kherbst@redhat.com>
Message-ID: <a0293812-c05d-45f0-a535-3f24fe582c02@moroto.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
Subject: [Nouveau] [PATCH] nouveau/gsp/r535: remove a stray unlock in
 r535_gsp_rpc_send()
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
Cc: nouveau@lists.freedesktop.org, kernel-janitors@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Daniel Vetter <daniel@ffwll.ch>, Dave Airlie <airlied@redhat.com>
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

This unlock doesn't belong here and it leads to a double unlock in
the caller, r535_gsp_rpc_push().

Fixes: 176fdcbddfd2 ("drm/nouveau/gsp/r535: add support for booting GSP-RM")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c
index dc44f5c7833f..818e5c73b7a6 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c
@@ -365,10 +365,8 @@ r535_gsp_rpc_send(struct nvkm_gsp *gsp, void *argv, bool wait, u32 repc)
 	}
 
 	ret = r535_gsp_cmdq_push(gsp, rpc);
-	if (ret) {
-		mutex_unlock(&gsp->cmdq.mutex);
+	if (ret)
 		return ERR_PTR(ret);
-	}
 
 	if (wait) {
 		msg = r535_gsp_msg_recv(gsp, fn, repc);
-- 
2.42.0

