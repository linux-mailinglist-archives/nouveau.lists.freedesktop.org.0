Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ECF177A53B8
	for <lists+nouveau@lfdr.de>; Mon, 18 Sep 2023 22:16:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2DBD010E306;
	Mon, 18 Sep 2023 20:16:00 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-pl1-x62f.google.com (mail-pl1-x62f.google.com
 [IPv6:2607:f8b0:4864:20::62f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 069DC10E305
 for <nouveau@lists.freedesktop.org>; Mon, 18 Sep 2023 20:15:59 +0000 (UTC)
Received: by mail-pl1-x62f.google.com with SMTP id
 d9443c01a7336-1c3d8fb23d9so38678715ad.0
 for <nouveau@lists.freedesktop.org>; Mon, 18 Sep 2023 13:15:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1695068158; x=1695672958; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=v+uLzCes0Ibqu0Il+W3f7zeY8+MxXcFj4ptFirkY79Q=;
 b=YasE3OSxj0nYbRaCxZEobC6A0/PDb17idBqBdb2iFFo7AQ3WjOrrKFiJWvaAHm45pe
 vhEzX5sEzlzjfr0wx0MYOOuDi7227+p1jU4jML9u67NNxAmAmo464l6S/a1N1H8jZOTW
 6g1D2y8ex2yeWnIzfmuPJf3BLsuZC8BybIc+pzChwRTa8RqbXVg/JA22n5vw2diKQZ+j
 ZKrNU7p+0Tc7uAjl9Dcp3iS6A2Hg0QnfltBKHyaJIrAzL431JMrO6uXWm20PjKanjg2S
 8fNHzHnfd2ltoebCnqs6Rpi6c1rg+y601tg9jKieq2DVME3Qmgj8rLZR2pfh881HvBzp
 EB+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695068158; x=1695672958;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=v+uLzCes0Ibqu0Il+W3f7zeY8+MxXcFj4ptFirkY79Q=;
 b=K6TvTt1rwafwxi+6nJjyu6SxAn7UpfAAdXKXKQV+51PyMhMTmJQ85CY1BDg+dxOi4w
 N4PGbQ4BtUiTIok7YoNy44a4sjzlD7iFHwBlsixqd1i5wFcS4rLCcaGMbhOgk8Tv/1bE
 x3OkWYq6iKMRXLwkZMjUn/zMPQztZANnpxDOD+X3x1HlxZvbk1n0IzxZVpuTdu2Co6P3
 zzTPFzEcxuR48qLnpU4Jn5YKzzHyY/0ebW78No+LIwNEJV9W4SxA1AqkDAOq+X4xvSHv
 dwxln6wRMWFTquYmRzPl4Ngz7xV/swiVI2cLfFJCT99OyPBZv53HxpQHt1pVpHOkjn8r
 wm4A==
X-Gm-Message-State: AOJu0YzohD4e0jwOTVSjR/4SUqn9s9L6IYzeYvV/vVBCvX9EdvgIljoM
 BuAdMnmTPoVH+ba/7pIinAN+PLn0K0A=
X-Google-Smtp-Source: AGHT+IENdOx96cP9zx9Dq8tcR/Dv8a2ciTf779hNdX2pr6I9fvBd9I91upfFtPOH+tT6SydRc6gMaA==
X-Received: by 2002:a17:903:32c2:b0:1c3:c758:4311 with SMTP id
 i2-20020a17090332c200b001c3c7584311mr10295483plr.58.1695068158189; 
 Mon, 18 Sep 2023 13:15:58 -0700 (PDT)
Received: from localhost.localdomain (87-121-74-45.dyn.launtel.net.au.
 [87.121.74.45]) by smtp.gmail.com with ESMTPSA id
 p21-20020a170902ead500b001b8c6890623sm8706858pld.7.2023.09.18.13.15.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Sep 2023 13:15:57 -0700 (PDT)
From: Ben Skeggs <skeggsb@gmail.com>
To: nouveau@lists.freedesktop.org
Date: Tue, 19 Sep 2023 06:14:00 +1000
Message-ID: <20230918201404.3765-41-skeggsb@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230918201404.3765-1-skeggsb@gmail.com>
References: <20230918201404.3765-1-skeggsb@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Nouveau] [PATCH v2 40/44] drm/nouveau/kms/nv50-: create heads
 after outps/conns
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
Reviewed-by: Lyude Paul <lyude@redhat.com>
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

