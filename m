Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 614FE79FEEB
	for <lists+nouveau@lfdr.de>; Thu, 14 Sep 2023 10:48:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C005910E546;
	Thu, 14 Sep 2023 08:48:28 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-pf1-x429.google.com (mail-pf1-x429.google.com
 [IPv6:2607:f8b0:4864:20::429])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA75910E546
 for <nouveau@lists.freedesktop.org>; Thu, 14 Sep 2023 08:48:26 +0000 (UTC)
Received: by mail-pf1-x429.google.com with SMTP id
 d2e1a72fcca58-68fbd5cd0ceso549595b3a.1
 for <nouveau@lists.freedesktop.org>; Thu, 14 Sep 2023 01:48:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1694681306; x=1695286106; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+qQqa+q8/jCZzMqqRX7RAqkD+9K7qMGIeFVi2NKWE+I=;
 b=RGtyUXdgl6Nhze/GvTDO0pB1CN9xO34Q/8nweTFGLfGySkRTlDHWRu/tnm2QFavjPK
 ZovtiQMPuCAeQFMPEg0UlKkmOGkqpAD8tVeYHnUFPlp/zD3/7Xh0paH1FJpnp/WqKAi0
 OH5XedPgwgSCDBfARSLBR3cPfU/IShOKqh581vp9EEVqQJDgKMp5yzvoeVIaUzLZOC5L
 huZ54pDorHiSAm0v23L6CcS0cxTuMN/DZdiyuBWbSLtkUP5LdDvXHmnqILeUbdwDN2+0
 n+ewpyrHLJwt5CduVrIYb32dX09nTXgLEWzL+g+BUGBn6CP1iOiKJ0YjKBQ9e4rpIweY
 ic0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1694681306; x=1695286106;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+qQqa+q8/jCZzMqqRX7RAqkD+9K7qMGIeFVi2NKWE+I=;
 b=jWa1WdT1jEz50PqffwrSQNtJSwRrV6mAdedSc8oDofeJ07POwNRLiIzQ/2EdovdcUn
 /+gdPAmZ39su9c7vynBsMVucJHpEdBAXY+fJtJx1HdJoS5b9jGk+yWrqNk7BPQJ9ZIrD
 6vOiYbkxZXVebJUJcMVLQZq4GQeBaM8/oG6b2LGL30zov9IkJNH1uaatuqm9apNccS8q
 U9BGPS/ZYLT9rkBaBIZuBPC48rv2HIyOXp5fC+QNJjnSpLY3/OyCfHWBzLTogi9mGvkO
 LuG3JhMn/nRZ0vZ8XH6IxTwvZcvzMR7ZzW0VcFrwYjDHGUWh3Hm0pSwEr6ow1MCrdRvH
 5REw==
X-Gm-Message-State: AOJu0Yx808CzEyNAhJfaFfpSVoPYpixuRELlxwra0mZvnRzuQz3FjBw/
 exhsoRDAw2dEM4KkeIyvgOWArkCAY/M=
X-Google-Smtp-Source: AGHT+IG3kVM3LvWWblwQxv1YrAuqpMc072+YoRUQ5VJb5y/aV4Xnueulm0/P1QFMkVNgkGlz8MOfPA==
X-Received: by 2002:a05:6a20:3254:b0:13a:6bca:7a84 with SMTP id
 hm20-20020a056a20325400b0013a6bca7a84mr3660414pzc.44.1694681305905; 
 Thu, 14 Sep 2023 01:48:25 -0700 (PDT)
Received: from localhost.localdomain ([87.121.74.45])
 by smtp.gmail.com with ESMTPSA id
 e23-20020a62ee17000000b006889081281bsm839205pfi.138.2023.09.14.01.48.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Sep 2023 01:48:25 -0700 (PDT)
From: Ben Skeggs <skeggsb@gmail.com>
To: nouveau@lists.freedesktop.org
Date: Thu, 14 Sep 2023 18:46:21 +1000
Message-ID: <20230914084624.2299765-42-skeggsb@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230914084624.2299765-2-skeggsb@gmail.com>
References: <20230914084624.2299765-2-skeggsb@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Nouveau] [PATCH 40/44] drm/nouveau/kms/nv50-: create heads after
 outps/conns
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

- output info will be used later to determine MST support

Signed-off-by: Ben Skeggs <bskeggs@redhat.com>
---
 drivers/gpu/drm/nouveau/dispnv50/disp.c | 64 ++++++++++++-------------
 1 file changed, 32 insertions(+), 32 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/dispnv50/disp.c b/drivers/gpu/drm/nouveau/dispnv50/disp.c
index 3d9a312838bf..76d3fd1dec77 100644
--- a/drivers/gpu/drm/nouveau/dispnv50/disp.c
+++ b/drivers/gpu/drm/nouveau/dispnv50/disp.c
@@ -2776,38 +2776,6 @@ nv50_display_create(struct drm_device *dev)
 		dev->mode_config.cursor_height = 64;
 	}
 
-	/* create crtc objects to represent the hw heads */
-	for_each_set_bit(i, &disp->disp->head_mask, sizeof(disp->disp->head_mask) * 8) {
-		struct nv50_head *head;
-
-		head = nv50_head_create(dev, i);
-		if (IS_ERR(head)) {
-			ret = PTR_ERR(head);
-			goto out;
-		}
-
-		if (has_mst) {
-			head->msto = nv50_msto_new(dev, head, i);
-			if (IS_ERR(head->msto)) {
-				ret = PTR_ERR(head->msto);
-				head->msto = NULL;
-				goto out;
-			}
-
-			/*
-			 * FIXME: This is a hack to workaround the following
-			 * issues:
-			 *
-			 * https://gitlab.gnome.org/GNOME/mutter/issues/759
-			 * https://gitlab.freedesktop.org/xorg/xserver/merge_requests/277
-			 *
-			 * Once these issues are closed, this should be
-			 * removed
-			 */
-			head->msto->encoder.possible_crtcs = disp->disp->head_mask;
-		}
-	}
-
 	/* create encoder/connector objects based on VBIOS DCB table */
 	for (i = 0, dcbe = &dcb->entry[0]; i < dcb->entries; i++, dcbe++) {
 		struct nouveau_encoder *outp;
@@ -2870,6 +2838,38 @@ nv50_display_create(struct drm_device *dev)
 		connector->funcs->destroy(connector);
 	}
 
+	/* create crtc objects to represent the hw heads */
+	for_each_set_bit(i, &disp->disp->head_mask, sizeof(disp->disp->head_mask) * 8) {
+		struct nv50_head *head;
+
+		head = nv50_head_create(dev, i);
+		if (IS_ERR(head)) {
+			ret = PTR_ERR(head);
+			goto out;
+		}
+
+		if (has_mst) {
+			head->msto = nv50_msto_new(dev, head, i);
+			if (IS_ERR(head->msto)) {
+				ret = PTR_ERR(head->msto);
+				head->msto = NULL;
+				goto out;
+			}
+
+			/*
+			 * FIXME: This is a hack to workaround the following
+			 * issues:
+			 *
+			 * https://gitlab.gnome.org/GNOME/mutter/issues/759
+			 * https://gitlab.freedesktop.org/xorg/xserver/merge_requests/277
+			 *
+			 * Once these issues are closed, this should be
+			 * removed
+			 */
+			head->msto->encoder.possible_crtcs = disp->disp->head_mask;
+		}
+	}
+
 	/* Disable vblank irqs aggressively for power-saving, safe on nv50+ */
 	dev->vblank_disable_immediate = true;
 
-- 
2.41.0

