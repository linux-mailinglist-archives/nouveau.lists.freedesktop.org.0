Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 452F979FED4
	for <lists+nouveau@lfdr.de>; Thu, 14 Sep 2023 10:47:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ACF4710E533;
	Thu, 14 Sep 2023 08:47:49 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-oi1-x235.google.com (mail-oi1-x235.google.com
 [IPv6:2607:f8b0:4864:20::235])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F16E910E53F
 for <nouveau@lists.freedesktop.org>; Thu, 14 Sep 2023 08:47:47 +0000 (UTC)
Received: by mail-oi1-x235.google.com with SMTP id
 5614622812f47-3a86a0355dfso404441b6e.0
 for <nouveau@lists.freedesktop.org>; Thu, 14 Sep 2023 01:47:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1694681266; x=1695286066; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+pFQi/XMg5+4n9oNrszxmwnKATaRgZSA/0wz9ABPOwg=;
 b=gSJu1KJ210CjTU3H41lRPlIgsZHQSkvG/E1awxQAaxbVtnCTsH7dsyTITDmSIgSrF8
 cT0VK4YOLngfoYY0uESZzw3omK11vuhzY2C1RN37BX17VUFlAKzU8wHlTJunEtqzF6/t
 gzxBkaxH6Jl2uvuuX9iKxuw77gzGllEX7IPN6URrnMp1if1nHEUv5wsu/JdkpMKM7El6
 CkYA3rxX7acNUzlcTPFjn0TsaS6G4jAwjiOIwj5hpjQduX2myO/nfhUzEJ7EQbGhQ/BP
 yrkh7HXmBGKlM6c+R039X/qu6lwZYFJm6ijyFXp9nOSvdzHDtcufoS+5sfuEXV/QOS9w
 ODYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1694681266; x=1695286066;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+pFQi/XMg5+4n9oNrszxmwnKATaRgZSA/0wz9ABPOwg=;
 b=GYwvTqjf/sDW+bcLfFLcP5Rp+PzghXEiIqPh57VgWc9JNo4CaNXlrhIDXLQ5osXhba
 nf5MHEkeeumXz3F8llbUmuMLgn5V7hbOxv3cSJ4kWUG6g6zYfWwKq0kp+Fxhs8c+kWIE
 W/t22nK3SPQuuAbyTG/8q7Ql1joIQHyEyUjwuP3FoJNX6ri4u+ngr7p2GG8r2GGB/aZ+
 G/9Jd8bApGi6pBC5y7ScUnoGvPRttgz23sniy3+oIycTaW44mKuMou4IvK2TZ5cxlTJE
 jUHXUKXCpatEHl38iC7zafVstDZpS2SRf7c3JcFzaJubMI4KbDqRM2796Jdr6d2m05yS
 LRnA==
X-Gm-Message-State: AOJu0YwnyWxNLJTrnx9+U1GGG4yCN5MzBCS+hm0mI5Ghi6oPfO5XFkqj
 07Y3j+L9FVFiB9ywF70gP1QuzK+uLOk=
X-Google-Smtp-Source: AGHT+IEMDfHWu6WRv14vdPintyU/Xox/8XTaPGeOWyWDKTd0WR79RRAZjGE6LO6kPG/1GZbevPG4Bw==
X-Received: by 2002:a05:6808:1da:b0:3a9:e8bd:8510 with SMTP id
 x26-20020a05680801da00b003a9e8bd8510mr5094278oic.49.1694681266689; 
 Thu, 14 Sep 2023 01:47:46 -0700 (PDT)
Received: from localhost.localdomain ([87.121.74.45])
 by smtp.gmail.com with ESMTPSA id
 e23-20020a62ee17000000b006889081281bsm839205pfi.138.2023.09.14.01.47.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Sep 2023 01:47:46 -0700 (PDT)
From: Ben Skeggs <skeggsb@gmail.com>
To: nouveau@lists.freedesktop.org
Date: Thu, 14 Sep 2023 18:46:03 +1000
Message-ID: <20230914084624.2299765-24-skeggsb@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230914084624.2299765-2-skeggsb@gmail.com>
References: <20230914084624.2299765-2-skeggsb@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Nouveau] [PATCH 22/44] drm/nouveau/disp: remove SOR routing
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

