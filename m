Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D3E7A6A9852
	for <lists+nouveau@lfdr.de>; Fri,  3 Mar 2023 14:27:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1593510E0A6;
	Fri,  3 Mar 2023 13:27:42 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E03E910E05D
 for <nouveau@lists.freedesktop.org>; Fri,  3 Mar 2023 13:27:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677850058;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=xZViEbKSFytDEA7BQHkIqtpOmiHcpYWTt+g+Ou0aIyc=;
 b=ZX+9IjTEimLAVNmOgi58M1EnAxh9xhie3wyEtiBAOWf7we0Sz7b0XSIDhaQftBflXmmTUY
 2YBD3hPX3OdCJQYG73RX4m5PehJzfmi0Z3TTq4cXg47LhKRAQaAdrw83nocIb/XwxokqsM
 Rsvxk+kxFBCtfihVjcbpHlD2ZhLDs04=
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-206-V075EOSBNjeQztdkY029Qg-1; Fri, 03 Mar 2023 08:27:37 -0500
X-MC-Unique: V075EOSBNjeQztdkY029Qg-1
Received: by mail-qt1-f198.google.com with SMTP id
 z22-20020ac86b96000000b003bfc3f97097so1461461qts.14
 for <nouveau@lists.freedesktop.org>; Fri, 03 Mar 2023 05:27:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677850057;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=xZViEbKSFytDEA7BQHkIqtpOmiHcpYWTt+g+Ou0aIyc=;
 b=HVW8+OwDSmOEyAsOPDEU1Bp+Z0FKtASL1jzaynYjCMNfxabGWLT7HKyCaAq4pTWs7s
 f6cxILaEXaK2WeIG6fQByaJn0mI6MBcLjsu7Ch4rOFztOsEJhzboHnQ+HdFAl3WecUMb
 yARis+mWbaGoudLi+y8NGTRfwC5qwLaiV4RlBpXNaUkfPc4OCTxEAlay8JcWk1VVKbJD
 cuIfqNvgOJ7irkpZJ+3ndS/GWfitUHjiFEAHXLjYDsS4vChr5RGdT6W7+jzgGf4tgbvT
 roYE6tuWsNO9ZLHLT3pohBrZ9PfRLX/pxCZ+7gQ4wImOmiTXDuOhvdkZ0uxYreZzoPxo
 xgbg==
X-Gm-Message-State: AO0yUKV4MPjWddWagj/a1MLZ464VNprrGb8VdgoYLQCMWgcaxvdj7LYL
 Oe/ssM5L424ieOS6a6TvBxS6qDZrs5qwLL43AEEMJ2e+9f0JiStb5WKPmTd5DGkFJ+jiVuLpzLn
 Hq1fOybEukHP/VGdcF1OCTvlhIQ==
X-Received: by 2002:a05:6214:d02:b0:56e:a07b:f4d1 with SMTP id
 2-20020a0562140d0200b0056ea07bf4d1mr2488036qvh.2.1677850057314; 
 Fri, 03 Mar 2023 05:27:37 -0800 (PST)
X-Google-Smtp-Source: AK7set8dveykfGBVt70UyNuMYBmxTxxZX4pm0Ls634+/jDN5mktxgyqaetnfSuCm+FshuDVD566LrA==
X-Received: by 2002:a05:6214:d02:b0:56e:a07b:f4d1 with SMTP id
 2-20020a0562140d0200b0056ea07bf4d1mr2488014qvh.2.1677850057060; 
 Fri, 03 Mar 2023 05:27:37 -0800 (PST)
Received: from dell-per740-01.7a2m.lab.eng.bos.redhat.com
 (nat-pool-bos-t.redhat.com. [66.187.233.206])
 by smtp.gmail.com with ESMTPSA id
 d11-20020a05620a158b00b0073b8745fd39sm1682277qkk.110.2023.03.03.05.27.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Mar 2023 05:27:36 -0800 (PST)
From: Tom Rix <trix@redhat.com>
To: bskeggs@redhat.com, kherbst@redhat.com, lyude@redhat.com,
 airlied@gmail.com, daniel@ffwll.ch
Date: Fri,  3 Mar 2023 08:27:31 -0500
Message-Id: <20230303132731.1919329-1-trix@redhat.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Nouveau] [PATCH] drm/nouveau/fifo: set
 gf100_fifo_nonstall_block_dump storage-class-specifier to static
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

gcc with W=1 reports
drivers/gpu/drm/nouveau/nvkm/engine/fifo/gf100.c:451:1: error:
  no previous prototype for ‘gf100_fifo_nonstall_block’ [-Werror=missing-prototypes]
  451 | gf100_fifo_nonstall_block(struct nvkm_event *event, int type, int index)
      | ^~~~~~~~~~~~~~~~~~~~~~~~~

gf100_fifo_nonstall_block is only used in gf100.c, so it should be static

Signed-off-by: Tom Rix <trix@redhat.com>
---
 drivers/gpu/drm/nouveau/nvkm/engine/fifo/gf100.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/fifo/gf100.c b/drivers/gpu/drm/nouveau/nvkm/engine/fifo/gf100.c
index 5bb65258c36d..6c94451d0faa 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/fifo/gf100.c
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/fifo/gf100.c
@@ -447,7 +447,7 @@ gf100_fifo_nonstall_allow(struct nvkm_event *event, int type, int index)
 	spin_unlock_irqrestore(&fifo->lock, flags);
 }
 
-void
+static void
 gf100_fifo_nonstall_block(struct nvkm_event *event, int type, int index)
 {
 	struct nvkm_fifo *fifo = container_of(event, typeof(*fifo), nonstall.event);
-- 
2.27.0

