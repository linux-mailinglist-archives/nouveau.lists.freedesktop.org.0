Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 72FCA7A5398
	for <lists+nouveau@lfdr.de>; Mon, 18 Sep 2023 22:14:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E0ED510E2E8;
	Mon, 18 Sep 2023 20:14:57 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-pl1-x636.google.com (mail-pl1-x636.google.com
 [IPv6:2607:f8b0:4864:20::636])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF92610E0F5
 for <nouveau@lists.freedesktop.org>; Mon, 18 Sep 2023 20:14:55 +0000 (UTC)
Received: by mail-pl1-x636.google.com with SMTP id
 d9443c01a7336-1c572c9c852so9765845ad.2
 for <nouveau@lists.freedesktop.org>; Mon, 18 Sep 2023 13:14:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1695068095; x=1695672895; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ExqNNHf0Nm/2dFINn6hpO+ffv455eyzDlRR/YHZw0u4=;
 b=XHxIa16w61wQRm1B8YGw388ep7u7gf4dOsL927KSwLNKjCHN4Ucx63JTmlTgXtM3Na
 CGA7lz9CV6uZu0ev61V+3C/+xYfOfeCSMdS8QHhOWOCf2sAVQZurc3AHJFCSe4Dydyju
 HcCREplSOEb1a78oav3zGnNcYeq7WdQibWoTqTJGRmntuKUbZ4eTBwyVOniD9jp371qP
 mz/q/39xExN8XiTFyprKJdqsftpdeg7Vh5jremu4dF16+7DvmyDuQ9/1aytK5tD4lqJJ
 +XbQN9zrETf5HQRR1nCoP1rfvzISDRqRyhFUWdS7pReLneyFUgX2lxGHhIPyLJToa6kJ
 qU9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695068095; x=1695672895;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ExqNNHf0Nm/2dFINn6hpO+ffv455eyzDlRR/YHZw0u4=;
 b=s9iUUwBfOUKyoWTYP8LCJ6J47uvhI7GODnm0APfDe47cnsszRYY5JWmVzZNhkFqvNm
 iLrXn4SvgNv3JaMD8abAPAdGhtUgsbm+U0Gj+ENtiSe+ddium95gacW+qBA+r5XyiBFx
 IGCdJ3xNzvRmOybVE4+PrcpeuQwPcaYm8wt6H+iwEFUSvgAycCoW4O0YH/vIfgoLlp3g
 V2uOf1OXREpUmxXoF9Hj/pQ4MK0WTPwgB9z/hnV31H1QIUgblsGd1q6iTiuMWoywH6fS
 WZsRRUBrdigAWkYvSYiev4RX3rUPo2zIy6v0uTEJKL2JeBIG8yNS3JeC6R9nZCnQuK2B
 qlbw==
X-Gm-Message-State: AOJu0YxjXpYSLngps4Q/HuKiwPKXcGrOGQnYITew1YIeN+0U5ROzt7P9
 lZ+BCLHjGdcIIE+9xHX4OEE/+mxwLbc=
X-Google-Smtp-Source: AGHT+IFCViCZeuOdr0gir3cQfQUZWNgylMoMSabdbQdW+k6I0stBXGvvKFOZCUDRqWzH1QXfmsBU9w==
X-Received: by 2002:a17:902:e845:b0:1b6:bced:1dc2 with SMTP id
 t5-20020a170902e84500b001b6bced1dc2mr10328035plg.0.1695068095052; 
 Mon, 18 Sep 2023 13:14:55 -0700 (PDT)
Received: from localhost.localdomain (87-121-74-45.dyn.launtel.net.au.
 [87.121.74.45]) by smtp.gmail.com with ESMTPSA id
 p21-20020a170902ead500b001b8c6890623sm8706858pld.7.2023.09.18.13.14.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Sep 2023 13:14:54 -0700 (PDT)
From: Ben Skeggs <skeggsb@gmail.com>
To: nouveau@lists.freedesktop.org
Date: Tue, 19 Sep 2023 06:13:34 +1000
Message-ID: <20230918201404.3765-15-skeggsb@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230918201404.3765-1-skeggsb@gmail.com>
References: <20230918201404.3765-1-skeggsb@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Nouveau] [PATCH v2 14/44] drm/nouveau/disp: update SOR routing
 immediately on acquire()
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

- was previously delayed until second supervisor interrupt

Signed-off-by: Ben Skeggs <bskeggs@redhat.com>
Reviewed-by: Lyude Paul <lyude@redhat.com>
---
 drivers/gpu/drm/nouveau/nvkm/engine/disp/outp.c  | 2 +-
 drivers/gpu/drm/nouveau/nvkm/engine/disp/uoutp.c | 2 ++
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/disp/outp.c b/drivers/gpu/drm/nouveau/nvkm/engine/disp/outp.c
index 5b55598e09c8..b288ea6658da 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/disp/outp.c
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/disp/outp.c
@@ -48,8 +48,8 @@ nvkm_outp_route(struct nvkm_disp *disp)
 
 	list_for_each_entry(ior, &disp->iors, head) {
 		if ((outp = ior->asy.outp)) {
-			OUTP_DBG(outp, "acquire %s", ior->name);
 			if (ior->asy.outp != ior->arm.outp) {
+				OUTP_DBG(outp, "acquire %s", ior->name);
 				if (ior->func->route.set)
 					ior->func->route.set(outp, ior);
 				ior->arm.outp = ior->asy.outp;
diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/disp/uoutp.c b/drivers/gpu/drm/nouveau/nvkm/engine/disp/uoutp.c
index d71bc188047e..042a43c22061 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/disp/uoutp.c
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/disp/uoutp.c
@@ -235,6 +235,8 @@ nvkm_uoutp_mthd_acquire(struct nvkm_outp *outp, void *argv, u32 argc)
 	if (ret)
 		return ret;
 
+	nvkm_outp_route(outp->disp);
+
 	args->v0.or = outp->ior->id;
 	args->v0.link = outp->ior->asy.link;
 	return 0;
-- 
2.41.0

