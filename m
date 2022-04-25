Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B03551EB50
	for <lists+nouveau@lfdr.de>; Sun,  8 May 2022 05:49:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EEF9810F6B1;
	Sun,  8 May 2022 03:49:55 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 26D9610E25E
 for <nouveau@lists.freedesktop.org>; Mon, 25 Apr 2022 13:13:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1650892405;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=OV5M88ExrHBJLlDEVqDhMiG8Kzj0MFYt6DBHZT5ejGQ=;
 b=OgPqQWJC45XVV6F6RBvLOpH87b0v0rEKbu+C6SQC7IAgE1nXT5j9Mbwab62BV/7lIBhk8v
 sM2ub9jqzUuteWzoMFZfafmirpRmecfckKfKg1yR9fGGrjAOiq0j3komsjQy2gTwFn9crR
 lbCRrdvUQ9s/dG/FqtfNuDRfCRPHLT0=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-61-hXKIu4T5Pua9N1yRTxdPAg-1; Mon, 25 Apr 2022 09:13:17 -0400
X-MC-Unique: hXKIu4T5Pua9N1yRTxdPAg-1
Received: by mail-qk1-f200.google.com with SMTP id
 t3-20020a05620a034300b0069e60a0760cso9634601qkm.20
 for <nouveau@lists.freedesktop.org>; Mon, 25 Apr 2022 06:13:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=OV5M88ExrHBJLlDEVqDhMiG8Kzj0MFYt6DBHZT5ejGQ=;
 b=0v9uD1J0ltfQsYis+YPLvTnMZCGdYcreyBjCm7gLUWtzvbX6LaleF1NiOa05ELIKkA
 2ZhABGMxUuTY0mPZAspsHFqBiWSfvO1xFs9TgcPcgAWPoGiK8atJVxam8O3VadqT/fic
 2rD0ejUXgzQKof6jZAIehH+aYNrcPuiRTQuV6PcFN0bosalCswwt1yEaxjGiQskwfHYe
 gmEvDhYaynkCoTRROYgp/TdYxqj1x5yeTOO3y+KYh2HpDF5wqAIJX42hraNQRXWGsM1I
 3uuAhDD3HMJj/lOPejVYNVzDQn9qB2PqS6SjJuFTrBTiXc9qJ9W8I2TDFG7S9E+3qCOO
 IgOw==
X-Gm-Message-State: AOAM5319E6UQv8uEmLaal8uRdZwqo33Dt65+GBb9uW540gC5LgRc0e2N
 DvnhHMaUdL3emCBONMKR/5h4yWzSO7U6QbkkTwrD2iPIr8PRmux942ZxTKp/rQ/lS0ccbJT3CY2
 lsHo7jKyQyD8TfJcAmeRNEzU0Eg==
X-Received: by 2002:a05:6214:1c87:b0:42d:20cb:e484 with SMTP id
 ib7-20020a0562141c8700b0042d20cbe484mr12145222qvb.10.1650892396730; 
 Mon, 25 Apr 2022 06:13:16 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzPOqTD8cO+BzlbfrXGx8bSpW2fXt9dKS1tp8Lcv1B7tS2bEgBAUJkY4Q26CjFWa0jOYCeRbQ==
X-Received: by 2002:a05:6214:1c87:b0:42d:20cb:e484 with SMTP id
 ib7-20020a0562141c8700b0042d20cbe484mr12145207qvb.10.1650892396506; 
 Mon, 25 Apr 2022 06:13:16 -0700 (PDT)
Received: from dell-per740-01.7a2m.lab.eng.bos.redhat.com
 (nat-pool-bos-t.redhat.com. [66.187.233.206])
 by smtp.gmail.com with ESMTPSA id
 s195-20020a37a9cc000000b0069ca29ab6f4sm4961900qke.26.2022.04.25.06.13.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Apr 2022 06:13:16 -0700 (PDT)
From: Tom Rix <trix@redhat.com>
To: bskeggs@redhat.com, kherbst@redhat.com, lyude@redhat.com, airlied@linux.ie,
 daniel@ffwll.ch
Date: Mon, 25 Apr 2022 09:13:08 -0400
Message-Id: <20220425131308.158635-1-trix@redhat.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=trix@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true
X-Mailman-Approved-At: Sun, 08 May 2022 03:49:54 +0000
Subject: [Nouveau] [PATCH] drm/nouveau/disp/gv100: make gv100_disp_wndw and
 gv100_disp_wndw_mthd static
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

Sparse reports these issues
wndwgv100.c:120:1: warning: symbol 'gv100_disp_wndw_mthd' was not declared. Should it be static?
wndwgv100.c:140:1: warning: symbol 'gv100_disp_wndw' was not declared. Should it be static?

These variable are only used in wndwgv100.c.  Single file variables should be static.
So use static as their storage-class specifiers.

Signed-off-by: Tom Rix <trix@redhat.com>
---
 drivers/gpu/drm/nouveau/nvkm/engine/disp/wndwgv100.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/disp/wndwgv100.c b/drivers/gpu/drm/nouveau/nvkm/engine/disp/wndwgv100.c
index 5d3b641dbb14..e635247d794f 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/disp/wndwgv100.c
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/disp/wndwgv100.c
@@ -116,7 +116,7 @@ gv100_disp_wndw_mthd_base = {
 	}
 };
 
-const struct nv50_disp_chan_mthd
+static const struct nv50_disp_chan_mthd
 gv100_disp_wndw_mthd = {
 	.name = "Window",
 	.addr = 0x001000,
@@ -136,7 +136,7 @@ gv100_disp_wndw_intr(struct nv50_disp_chan *chan, bool en)
 	nvkm_mask(device, 0x611da4, mask, data);
 }
 
-const struct nv50_disp_chan_func
+static const struct nv50_disp_chan_func
 gv100_disp_wndw = {
 	.init = gv100_disp_dmac_init,
 	.fini = gv100_disp_dmac_fini,
-- 
2.27.0

