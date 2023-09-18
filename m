Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B3147A53A1
	for <lists+nouveau@lfdr.de>; Mon, 18 Sep 2023 22:15:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E0C710E2F1;
	Mon, 18 Sep 2023 20:15:18 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-pl1-x62e.google.com (mail-pl1-x62e.google.com
 [IPv6:2607:f8b0:4864:20::62e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8BB5810E2EF
 for <nouveau@lists.freedesktop.org>; Mon, 18 Sep 2023 20:15:15 +0000 (UTC)
Received: by mail-pl1-x62e.google.com with SMTP id
 d9443c01a7336-1c4707b1031so16001395ad.2
 for <nouveau@lists.freedesktop.org>; Mon, 18 Sep 2023 13:15:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1695068114; x=1695672914; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+6nTWb2L6Lp9Y7930PFiYHbz0axFcXN1s/med+CyDbw=;
 b=J8b0GzcKZVqLHKX+5Mfwxl+KL7t6RJH2dEm0FV+v1aAc6y0+mPpyPHeV+cmDIPpUVG
 FCROD62PvhvmGGVAud1hWqnnzsY4yEIEpyvCBNqoJktuwaaS/CI9BocmClAXXiWXXP1m
 sc90lQT6OiaIfmzkFf8Xrpzczdh1YY+GXAsejPMjFi8evIA6rYd1hE4mYUkbDL/xhe2F
 MPmGzBqy3Tv77/KUJawZsWicHh1DiXQEHkPS4VVY8pOzqn+YBGtcQCl/bn0hIIYz4JM0
 4tOFixDzxF5smyoC/nTnygIazs/hh4Q5nanJiXRFKpIn4016PCPfcVNRLvOlMMjOAqK9
 g1UQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695068114; x=1695672914;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+6nTWb2L6Lp9Y7930PFiYHbz0axFcXN1s/med+CyDbw=;
 b=nA4dU5aj+/crQxG7KMT2QLbKjowjFDKd96FoOvaxZ4hbRKFi1KMqslPQqXNLQMnNae
 xNBV8gUyIsT+dZB7eM4hSD801HxqNzHJMTkAdLe0eRZ0V2KhNZmOTfucdLvpwdrWx/QS
 tyNEcx3yRWcWs8wZoKZ6zGmGMecEQfNGzHN+EVUvh8JXehT8bVTYUQZyMKysN5NJu5tn
 qC4hnHf5B4qPB1rUB2cKbIKghZg8bYJcg1iG9WHgbIIT565j6bSXEJQ43B2cinyXAH6a
 YbtGzz8MeppQTI2PpvJ2S7gguaci55c36YNMD0izPf9Wo0SZ09FIOpOLUG3qpFbvo2ny
 aTvQ==
X-Gm-Message-State: AOJu0YyHAm+HkG6mfN5hzCmo+1T1jWy9We+6pZ7KS5mh1NL4I7Ujtcr9
 FrYbEoFORTdPM6rvIEeoiBCeaNhzIMo=
X-Google-Smtp-Source: AGHT+IF06ZTX3qLYSHYUTGiRI9XQ25L7yWpUF+tH437szydUvmRcpYryHoE3myG1M7HX7GZMhutfaw==
X-Received: by 2002:a17:902:dad2:b0:1bb:9f07:5e0 with SMTP id
 q18-20020a170902dad200b001bb9f0705e0mr12877527plx.60.1695068114665; 
 Mon, 18 Sep 2023 13:15:14 -0700 (PDT)
Received: from localhost.localdomain (87-121-74-45.dyn.launtel.net.au.
 [87.121.74.45]) by smtp.gmail.com with ESMTPSA id
 p21-20020a170902ead500b001b8c6890623sm8706858pld.7.2023.09.18.13.15.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Sep 2023 13:15:14 -0700 (PDT)
From: Ben Skeggs <skeggsb@gmail.com>
To: nouveau@lists.freedesktop.org
Date: Tue, 19 Sep 2023 06:13:42 +1000
Message-ID: <20230918201404.3765-23-skeggsb@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230918201404.3765-1-skeggsb@gmail.com>
References: <20230918201404.3765-1-skeggsb@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Nouveau] [PATCH v2 22/44] drm/nouveau/disp: remove SOR routing
 updates from supervisor
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

- these shouldn't be necessary now, and are done in acquire()/release()
- preparation for GSP-RM, where we don't control the supervisor

Signed-off-by: Ben Skeggs <bskeggs@redhat.com>
Reviewed-by: Lyude Paul <lyude@redhat.com>
---
 drivers/gpu/drm/nouveau/nvkm/engine/disp/gf119.c | 1 -
 drivers/gpu/drm/nouveau/nvkm/engine/disp/gv100.c | 1 -
 drivers/gpu/drm/nouveau/nvkm/engine/disp/nv50.c  | 1 -
 3 files changed, 3 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/disp/gf119.c b/drivers/gpu/drm/nouveau/nvkm/engine/disp/gf119.c
index a48e9bdf4cd0..937baae6a3eb 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/disp/gf119.c
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/disp/gf119.c
@@ -1038,7 +1038,6 @@ gf119_disp_super(struct work_struct *work)
 				continue;
 			nv50_disp_super_2_0(disp, head);
 		}
-		nvkm_outp_route(disp);
 		list_for_each_entry(head, &disp->heads, head) {
 			if (!(mask[head->id] & 0x00010000))
 				continue;
diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/disp/gv100.c b/drivers/gpu/drm/nouveau/nvkm/engine/disp/gv100.c
index 4ebc030e40d1..7ac59bab6309 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/disp/gv100.c
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/disp/gv100.c
@@ -863,7 +863,6 @@ gv100_disp_super(struct work_struct *work)
 				continue;
 			nv50_disp_super_2_0(disp, head);
 		}
-		nvkm_outp_route(disp);
 		list_for_each_entry(head, &disp->heads, head) {
 			if (!(mask[head->id] & 0x00010000))
 				continue;
diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/disp/nv50.c b/drivers/gpu/drm/nouveau/nvkm/engine/disp/nv50.c
index be8116802960..a4ce60517789 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/disp/nv50.c
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/disp/nv50.c
@@ -1371,7 +1371,6 @@ nv50_disp_super(struct work_struct *work)
 				continue;
 			nv50_disp_super_2_0(disp, head);
 		}
-		nvkm_outp_route(disp);
 		list_for_each_entry(head, &disp->heads, head) {
 			if (!(super & (0x00000200 << head->id)))
 				continue;
-- 
2.41.0

