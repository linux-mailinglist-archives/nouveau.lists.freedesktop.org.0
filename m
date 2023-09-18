Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B7907A53E8
	for <lists+nouveau@lfdr.de>; Mon, 18 Sep 2023 22:22:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B9DC710E311;
	Mon, 18 Sep 2023 20:22:31 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-pf1-x430.google.com (mail-pf1-x430.google.com
 [IPv6:2607:f8b0:4864:20::430])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 30C3E10E317
 for <nouveau@lists.freedesktop.org>; Mon, 18 Sep 2023 20:22:29 +0000 (UTC)
Received: by mail-pf1-x430.google.com with SMTP id
 d2e1a72fcca58-68fba57030fso4267945b3a.3
 for <nouveau@lists.freedesktop.org>; Mon, 18 Sep 2023 13:22:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1695068548; x=1695673348; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9s2t2yHQVvw+q0aROtVnRO7sHhAqzKct5/mK4n5laLw=;
 b=MRg24eH7hQS481F67ScnGZDlr+Kqy9f50Zh0nVZVeYPNcws4lZg3gaDOf2lGDOTkoI
 wOoV3hDDhesf5HYjOI7aC1Ors+uNZCUahX1FSWLaPAehEWuIsgRNdqTJfRvH2tAshjDj
 PXtWzVVoeyChHOHGf9xKWKN6tJrk6Ad9jfWu9m35MzStFCJDvwWo0ukys5T0wPuywLpS
 gGVTWtSvodjWRkwhOjP3yTF1SnO7CXR3s888xc1pLzclyCk1iK8XuBqWYFD9AcI0y9VM
 LOJ1hzXzIWnd0tfL2nnDA7jbw/ymaafKEUUrflTX4+O1AEs04hKQyLnjqroJz5XgDO1v
 oapQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695068548; x=1695673348;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=9s2t2yHQVvw+q0aROtVnRO7sHhAqzKct5/mK4n5laLw=;
 b=NrlUtBYk/n7Suwntomvr0Hnxb2sx+LlQwlRXKgjLcQ0JD5HdUgjRMpkMndKBTDIg0i
 ptBNzy3ghan35WYcSxJS6xTyL2EWHc8ZcE0XsVuafiyCb072+brsn1ZKuYEtDUKAwulK
 28gIIdhcYhlYTWkQK7pSXTxs77QFXQdphyGPxKDG4h2hTR6H0SstGVSJTxy+4+L3VIPm
 vdOIW1drz+PmfUPiyhjkroC+YDwn0Bgk8w2QlHXN/B0OYlCnX3+p2x5AJtS+mDI+lNnt
 7xHDO+Q4VWPFHm3VMwnLb0DuCyuvgdN/DyC1/ZNBsWl9taBnrZTZmF2SG8aLWvb4T1qx
 U7xw==
X-Gm-Message-State: AOJu0YwKoB4pBs3be97aehQbPIGHiD7xxbfw8DS2iz8pJZUOgm3tTHMF
 KuUvPmbo/JMpa94I5vPSeZmJQyzLLLs=
X-Google-Smtp-Source: AGHT+IGfYVvvmNQ6f+17BSmZ5bleZzfVfGtTfxPHP/Vk+PlOOCb1FnrdZ1M4rW46a0I61nwLv4+bRQ==
X-Received: by 2002:a05:6a21:47cb:b0:14c:e089:94a8 with SMTP id
 as11-20020a056a2147cb00b0014ce08994a8mr6894600pzc.27.1695068548118; 
 Mon, 18 Sep 2023 13:22:28 -0700 (PDT)
Received: from localhost.localdomain (87-121-74-45.dyn.launtel.net.au.
 [87.121.74.45]) by smtp.gmail.com with ESMTPSA id
 p21-20020aa78615000000b006889348ba6asm7446067pfn.81.2023.09.18.13.22.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Sep 2023 13:22:27 -0700 (PDT)
From: Ben Skeggs <skeggsb@gmail.com>
To: nouveau@lists.freedesktop.org
Date: Tue, 19 Sep 2023 06:21:16 +1000
Message-ID: <20230918202149.4343-12-skeggsb@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230918202149.4343-1-skeggsb@gmail.com>
References: <20230918202149.4343-1-skeggsb@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Nouveau] [PATCH 11/44] drm/nouveau/fuse/tu102-: prepare for GSP-RM
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

- disable FUSE completely when GSP-RM detected

Signed-off-by: Ben Skeggs <bskeggs@redhat.com>
---
 drivers/gpu/drm/nouveau/nvkm/subdev/fuse/gm107.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/fuse/gm107.c b/drivers/gpu/drm/nouveau/nvkm/subdev/fuse/gm107.c
index 7dc99492f536..d621edbdff9d 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/fuse/gm107.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/fuse/gm107.c
@@ -23,6 +23,8 @@
  */
 #include "priv.h"
 
+#include <subdev/gsp.h>
+
 static u32
 gm107_fuse_read(struct nvkm_fuse *fuse, u32 addr)
 {
@@ -39,5 +41,8 @@ int
 gm107_fuse_new(struct nvkm_device *device, enum nvkm_subdev_type type, int inst,
 	       struct nvkm_fuse **pfuse)
 {
+	if (nvkm_gsp_rm(device->gsp))
+		return -ENODEV;
+
 	return nvkm_fuse_new_(&gm107_fuse, device, type, inst, pfuse);
 }
-- 
2.41.0

