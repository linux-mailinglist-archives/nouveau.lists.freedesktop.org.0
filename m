Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E62E7101FC
	for <lists+nouveau@lfdr.de>; Thu, 25 May 2023 02:31:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C92A10E10E;
	Thu, 25 May 2023 00:31:24 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-pj1-x1030.google.com (mail-pj1-x1030.google.com
 [IPv6:2607:f8b0:4864:20::1030])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA5F110E0F6
 for <nouveau@lists.freedesktop.org>; Thu, 25 May 2023 00:31:21 +0000 (UTC)
Received: by mail-pj1-x1030.google.com with SMTP id
 98e67ed59e1d1-25372604818so623004a91.2
 for <nouveau@lists.freedesktop.org>; Wed, 24 May 2023 17:31:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1684974680; x=1687566680;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=mvL2QmEhBZIs5h8LuZPKViA55qh4sOUQP+2nGG84Yyw=;
 b=XGVmKiIktQFe1fckLgfadrzO9kta03kBKn1rcOQiMnoC+AdnIgaJLmTgmC2kMoN5r5
 3gMC33rf4/xRvsRfCGkhFpyqSlFrvjINFVtpqQ9jBnVddjN7VNDONL9PsXZShrC2LgnY
 Rz3VsFsuuS8VW+NsQn3uXyca6l6H9S3SjuO8qv4OfdgjBW/h6J2FI4EVeU/FFhsdmBhG
 UNZONIS9TbobxKJ6ShF16kx079a+/9UJf7NgAjrYMq5LIlN15rflllRAQDVSzA+0aqri
 oB77sQIEwsWFwR48k+pKh/7hTODR1DSNStF0R6HXlR1VMvbI7A0zcwhJQTK+ZacFVt5t
 JPJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684974680; x=1687566680;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=mvL2QmEhBZIs5h8LuZPKViA55qh4sOUQP+2nGG84Yyw=;
 b=jfHSNSVi5t8rz6uKh8MiZw1oXxyb5ZoU/GpNAwpBmbu+BVZ6S61ryopwWojfptA4S9
 F8RVhGz8ce/iCdmAxS35aF1iDkLfPfps5ETyph7reB3RAcmr2I9tb4d8Mv1LcyllFUOU
 9o2aIe34EUlycXWjuzTFMsLMxo1JhCsFOn2C+Pzi3J4oKEs2ry4sJauW1Ttbeq0YYmD0
 jfP/kqYc37Lt65pb2raioMMJNBNpFfNBCKYT2E3EcP0fKUGE7o1X5Vs/U+80c7aGs9uJ
 Vff08ad9sZvE5ACg4AM6VYFLwKJuzTdolbRnbCwdA+tOkFdsmCPAG5QPrhzN+yFxnvqw
 Rhpw==
X-Gm-Message-State: AC+VfDy+qDNJfHwjFIqDG+K3ZdzYhvqj9Yw419pFHI++h449D9QEkyT9
 Mg8apGJCcS/N+YlF8NOip8PrO5mHtlY=
X-Google-Smtp-Source: ACHHUZ6+FeJcO9WeiRg0MI3rC0YJ5fFv/pjK5E+ov5QjBEhYLw8UCfayQZHDlK1+xtjg/YMxLU/AIg==
X-Received: by 2002:a17:90b:46c8:b0:255:3b09:6ef5 with SMTP id
 jx8-20020a17090b46c800b002553b096ef5mr14797279pjb.44.1684974680478; 
 Wed, 24 May 2023 17:31:20 -0700 (PDT)
Received: from localhost.localdomain (87-121-74-45.dyn.launtel.net.au.
 [87.121.74.45]) by smtp.gmail.com with ESMTPSA id
 ev18-20020a17090aead200b0025271247ab8sm98016pjb.11.2023.05.24.17.31.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 May 2023 17:31:20 -0700 (PDT)
From: Ben Skeggs <skeggsb@gmail.com>
To: nouveau@lists.freedesktop.org
Date: Thu, 25 May 2023 10:30:58 +1000
Message-Id: <20230525003106.3853741-2-skeggsb@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230525003106.3853741-1-skeggsb@gmail.com>
References: <20230525003106.3853741-1-skeggsb@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Nouveau] [PATCH 02/10] drm/nouveau/nvkm: punt spurious irq
 messages to debug level
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

This can be completely normal in some situations (ie. non-stall intrs
when nothing is waiting on them).

Signed-off-by: Ben Skeggs <bskeggs@redhat.com>
---
 drivers/gpu/drm/nouveau/nvkm/core/intr.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nvkm/core/intr.c b/drivers/gpu/drm/nouveau/nvkm/core/intr.c
index e20b7ca218c3..36a747f0039e 100644
--- a/drivers/gpu/drm/nouveau/nvkm/core/intr.c
+++ b/drivers/gpu/drm/nouveau/nvkm/core/intr.c
@@ -212,8 +212,8 @@ nvkm_intr(int irq, void *arg)
 		list_for_each_entry(intr, &device->intr.intr, head) {
 			for (leaf = 0; leaf < intr->leaves; leaf++) {
 				if (intr->stat[leaf]) {
-					nvkm_warn(intr->subdev, "intr%d: %08x\n",
-						  leaf, intr->stat[leaf]);
+					nvkm_debug(intr->subdev, "intr%d: %08x\n",
+						   leaf, intr->stat[leaf]);
 					nvkm_intr_block_locked(intr, leaf, intr->stat[leaf]);
 				}
 			}
-- 
2.40.1

