Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D0CA5383BC
	for <lists+nouveau@lfdr.de>; Mon, 30 May 2022 16:46:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE5D910E144;
	Mon, 30 May 2022 14:46:52 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4247310E07D
 for <nouveau@lists.freedesktop.org>; Sat, 28 May 2022 14:34:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1653748490;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=XE622bwRFQLXoWlWGwkx558rDBHwnMuHGZROqrwvbw4=;
 b=CyQvOHPet4ku6/s6mrEKC2udmZmWQfc6pdxXdLl/ktdlPjKN+0wz97slmuca1qrQWZF/SB
 v5MGcIooI6pFK4mJh6zYGwtaqX1QCaOXWW9nsG6C2GUHIxMOOaHLgrXmALQJBqM9Gzwrv3
 tL7WlAtsaKfIXvUDAGrzxwUOZAfilo8=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-392-mnNd08hMOMOYV4IGEz23VQ-1; Sat, 28 May 2022 10:34:48 -0400
X-MC-Unique: mnNd08hMOMOYV4IGEz23VQ-1
Received: by mail-qk1-f199.google.com with SMTP id
 f20-20020a05620a12f400b006a36317a58aso5856405qkl.6
 for <nouveau@lists.freedesktop.org>; Sat, 28 May 2022 07:34:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=XE622bwRFQLXoWlWGwkx558rDBHwnMuHGZROqrwvbw4=;
 b=hmp8Md0USD4JeDgR+TAT+NMvPkMPFrk8RvX8oc22K49JX/zACQJnsjR9Pu6/3GhH8x
 W+2etgYB6fk7CBsX+BBc4bp7b0LNB/8YbHOOZOOOUxrIrnISdAnjUsa8mifP1kGV3XkL
 Sa+0BrIZYr2m1vgNJFzK7904dboNPOXkn3HQT3ZKJ7m+tQo8VwuNAU3MoW4V0GCVpc1R
 eI0E6GiVSaKpooUwuVApoegKN/A/T3MT8uBiTwxFgOyDLn+qBxQfnn+UpQnURD2shkXG
 vHtfIbIbGPlRxzJqoaIsPYSbE3HxtfkHz/wVBZ84WKFvRR+JBZsGmDSiFhFoBX9pRN+c
 3gqg==
X-Gm-Message-State: AOAM530XLZdMEcqqa8UcRbRqXt446LZdPrlguNXv/CYDCEIoBJpLI0xs
 ElcP/LoNdMNhfwa17/1sSB5ivn6cznxKooJz7X+ZRnPACLwoMnWMZVqCKESeeyXZppp4sdO6FSj
 Cuv1Z+gKlt7hV2rsbU6JwoPsIGw==
X-Received: by 2002:a05:622a:186:b0:2f3:b5e1:8f2c with SMTP id
 s6-20020a05622a018600b002f3b5e18f2cmr37699908qtw.99.1653748487815; 
 Sat, 28 May 2022 07:34:47 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzfw+zDbPoW1PujPqrT77plf9K/dqh5eJc8Y+lAMBwBf227Q8xlr2ZkX6Cc6T3ziRTt2IzQLA==
X-Received: by 2002:a05:622a:186:b0:2f3:b5e1:8f2c with SMTP id
 s6-20020a05622a018600b002f3b5e18f2cmr37699895qtw.99.1653748487608; 
 Sat, 28 May 2022 07:34:47 -0700 (PDT)
Received: from dell-per740-01.7a2m.lab.eng.bos.redhat.com
 (nat-pool-bos-t.redhat.com. [66.187.233.206])
 by smtp.gmail.com with ESMTPSA id
 c131-20020a379a89000000b006a098381abcsm4541947qke.114.2022.05.28.07.34.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 28 May 2022 07:34:46 -0700 (PDT)
From: Tom Rix <trix@redhat.com>
To: bskeggs@redhat.com, kherbst@redhat.com, lyude@redhat.com, airlied@linux.ie,
 daniel@ffwll.ch
Date: Sat, 28 May 2022 10:18:36 -0400
Message-Id: <20220528141836.4155970-1-trix@redhat.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=trix@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true
X-Mailman-Approved-At: Mon, 30 May 2022 14:46:51 +0000
Subject: [Nouveau] [PATCH] drm/nouveau/fifo/gv100-: set gv100_fifo_runlist
 storage-class to static
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
Cc: nouveau@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Tom Rix <trix@redhat.com>
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

sparse reports
drivers/gpu/drm/nouveau/nvkm/engine/fifo/gv100.c:56:1: warning: symbol 'gv100_fifo_runlist' was not declared. Should it be static?

gv100_fifo_runlist is only used in gv100.c, so change it to static.

Signed-off-by: Tom Rix <trix@redhat.com>
---
 drivers/gpu/drm/nouveau/nvkm/engine/fifo/gv100.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/fifo/gv100.c b/drivers/gpu/drm/nouveau/nvkm/engine/fifo/gv100.c
index 70e16a91ac12..faf0fe9f704c 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/fifo/gv100.c
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/fifo/gv100.c
@@ -52,7 +52,7 @@ gv100_fifo_runlist_cgrp(struct nvkm_fifo_cgrp *cgrp,
 	nvkm_wo32(memory, offset + 0xc, 0x00000000);
 }
 
-const struct gk104_fifo_runlist_func
+static const struct gk104_fifo_runlist_func
 gv100_fifo_runlist = {
 	.size = 16,
 	.cgrp = gv100_fifo_runlist_cgrp,
-- 
2.27.0

