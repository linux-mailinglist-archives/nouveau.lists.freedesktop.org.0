Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D72456A623A
	for <lists+nouveau@lfdr.de>; Tue, 28 Feb 2023 23:15:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0049510E0E7;
	Tue, 28 Feb 2023 22:15:42 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C533A10E0E3
 for <nouveau@lists.freedesktop.org>; Tue, 28 Feb 2023 22:15:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677622538;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=lkbO8Zr5IWtc4/j1ncgTgHjPYcbP4Lmw69fF7SUMZRo=;
 b=PiHfSqyyxtK/+nyBNjhCmXWUuWQmkxMTj8JQXGcWYNUfCfGSK93g7zOuzSG1SfihV/pvsB
 72ThBJ8xZ1Dmk2oQ6l+kilGkSawq4bNwbVykPTqAIuhEmYQmRc3Jd7+dwZoaVCDVb0vor0
 JhCb93cjekoFkbKi+x0ps5G75ziAXRw=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-646-bH1MZwH8NeaQ9yzKMxf4Kw-1; Tue, 28 Feb 2023 17:15:37 -0500
X-MC-Unique: bH1MZwH8NeaQ9yzKMxf4Kw-1
Received: by mail-qk1-f198.google.com with SMTP id
 b22-20020ae9eb16000000b007427f9339c0so6881960qkg.17
 for <nouveau@lists.freedesktop.org>; Tue, 28 Feb 2023 14:15:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677622536;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=lkbO8Zr5IWtc4/j1ncgTgHjPYcbP4Lmw69fF7SUMZRo=;
 b=6eyYWg1Wfc4whuY7P0I8aeVK62cBLhnkZ2uGI7UdLgpJJnrumo3azTJyxQ8D9ZS8x/
 meSuzaipz+n2A1JkG+47rvA549ev4KJHcXb+vTte8yDqgXlSmEG6dsPxA1Hf7Z8PitK7
 jetEK7KywdVMMGTI4mTf81r2q8th0XvKgly2wJFsBELPjCCSQ6BC//XWz2dBzbE5HXpN
 VSmsbjYN/s+MOqZ1fo5PO2TtB1+dgaAoL6q227F5U8/khIZ8gK5dnEdO7h6JfXE1czVL
 ibRlFdBvBW7Vn5B5hmsunnNh4kTYk6UFq7+ARPhYINC47wMq+YTX0vNCu3HOxnlLuYGq
 SosA==
X-Gm-Message-State: AO0yUKU7oChz8HA8Zqlgq273IiTiROi339ofOd4nGvzP2RWlWw7p7kHY
 HIjY3RsKOWrYTnAGlIRA9rNbdvZcrmREVp08z9Auuq7HGTUW7C52by5w5By3CS80yfVZqkR+66j
 D0rV/5wjZS3N0qinR/mUkDyLa9pBkRho=
X-Received: by 2002:a05:6214:23cb:b0:56f:5ac:60d5 with SMTP id
 hr11-20020a05621423cb00b0056f05ac60d5mr7339059qvb.0.1677622536786; 
 Tue, 28 Feb 2023 14:15:36 -0800 (PST)
X-Google-Smtp-Source: AK7set8pCi0CAfSgN4N2zWMoTtjUNskBs56MvcyvKZa1GWtrB5qWMiGZ9OAVs86lglXXhTKllq5kqg==
X-Received: by 2002:a05:6214:23cb:b0:56f:5ac:60d5 with SMTP id
 hr11-20020a05621423cb00b0056f05ac60d5mr7339030qvb.0.1677622536534; 
 Tue, 28 Feb 2023 14:15:36 -0800 (PST)
Received: from dell-per740-01.7a2m.lab.eng.bos.redhat.com
 (nat-pool-bos-t.redhat.com. [66.187.233.206])
 by smtp.gmail.com with ESMTPSA id
 x2-20020ac84a02000000b003b9a426d626sm7076554qtq.22.2023.02.28.14.15.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Feb 2023 14:15:36 -0800 (PST)
From: Tom Rix <trix@redhat.com>
To: bskeggs@redhat.com, kherbst@redhat.com, lyude@redhat.com,
 airlied@gmail.com, daniel@ffwll.ch
Date: Tue, 28 Feb 2023 17:15:33 -0500
Message-Id: <20230228221533.3240520-1-trix@redhat.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true
Subject: [Nouveau] [PATCH] drm/nouveau/fifo: set nvkm_engn_cgrp_get
 storage-class-specifier to static
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

smatch reports
drivers/gpu/drm/nouveau/nvkm/engine/fifo/runl.c:33:18:
  warning: symbol 'nvkm_engn_cgrp_get' was not declared. Should it be static?

nvkm_engn_cgrp_get is only used in runl.c, so it should be static

Signed-off-by: Tom Rix <trix@redhat.com>
---
 drivers/gpu/drm/nouveau/nvkm/engine/fifo/runl.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/fifo/runl.c b/drivers/gpu/drm/nouveau/nvkm/engine/fifo/runl.c
index b5836cbc29aa..93d628d7d508 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/fifo/runl.c
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/fifo/runl.c
@@ -30,7 +30,7 @@
 #include <subdev/timer.h>
 #include <subdev/top.h>
 
-struct nvkm_cgrp *
+static struct nvkm_cgrp *
 nvkm_engn_cgrp_get(struct nvkm_engn *engn, unsigned long *pirqflags)
 {
 	struct nvkm_cgrp *cgrp = NULL;
-- 
2.27.0

