Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DEA0B51EB52
	for <lists+nouveau@lfdr.de>; Sun,  8 May 2022 05:50:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5BAD510F6B7;
	Sun,  8 May 2022 03:49:56 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B4D0210E452
 for <nouveau@lists.freedesktop.org>; Mon, 25 Apr 2022 13:01:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1650891663;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=rTys+erDRBI/RIRvGMImXOuLh5EmnDonu4B+GkyDP0E=;
 b=djaEgvJKnzGh+hUrgaCMgh9xtH8CDFhea22QqCHV+7/vgdOwuBHXL6ilRMDIrKDFzbryTV
 1NjARy/bDt6RURT8lOnkwQO14b0lNrPzFxMX1NnEprm5pPMsga1nLNyX+9HqmMkwA050l2
 mjKTtOhc0EQyhA3DxZ7OASPXp+Tk8zo=
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-655-DC9p6IdRMmefBjn7w4E4aA-1; Mon, 25 Apr 2022 09:00:59 -0400
X-MC-Unique: DC9p6IdRMmefBjn7w4E4aA-1
Received: by mail-qt1-f198.google.com with SMTP id
 o2-20020ac86982000000b002f1d71c97b8so7867665qtq.2
 for <nouveau@lists.freedesktop.org>; Mon, 25 Apr 2022 06:00:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=rTys+erDRBI/RIRvGMImXOuLh5EmnDonu4B+GkyDP0E=;
 b=pYbemAM3WsownQzdm+MibmMxtu0ZsBwgsnJ7BF/p5V3whEySe+jFalfbu1IpIQ2Efc
 hEXLcWt6PEsCT0iEpiTJ2N/XbS8JsElXiG1eBdXtELTMw13wh0R8/zHuvpw+fBrFTxCT
 HoAiPd+LwDp4bV64l+jQjaHGPK6cOoXVlZFWKtWJFHDemb5Eikp3c5XB7uu714flkGAA
 S6HLhKF6deDj5o59UBJ0yOT37G3dDPOBfwPETVW+IKWC+88nQJFJzs/iEfILLNnjRsEJ
 s4z6CS4FatsZb8ye+jNYEbMRMRD/1bn6IDv5yMcbvOk8P45L/vq3Ti2pZP05rQRDc0cp
 IltA==
X-Gm-Message-State: AOAM530dHP59rMpXZX31LOCXWGAlZo82iYvSMz3FVjqykNvgERk34n+D
 Nacj4Zpnd0naa7ii5Ujdv7+NfEIEbGulpvY1kcf5Jd+FaPrQKAq7Pz1BgnLl8lAv31mE3/f/AF7
 YAeiZmEUIxW5hXuJ8FM4MhOW2Rg==
X-Received: by 2002:ac8:5fc1:0:b0:2f3:6731:241c with SMTP id
 k1-20020ac85fc1000000b002f36731241cmr3572755qta.675.1650891658657; 
 Mon, 25 Apr 2022 06:00:58 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyrNZbxLMQwnrHy53N0H2O7nNxhHG7BzBXBhpXYmwsVimEqJHWZzXb7khbqE1uBB1FI/T3+Pg==
X-Received: by 2002:ac8:5fc1:0:b0:2f3:6731:241c with SMTP id
 k1-20020ac85fc1000000b002f36731241cmr3572656qta.675.1650891657748; 
 Mon, 25 Apr 2022 06:00:57 -0700 (PDT)
Received: from dell-per740-01.7a2m.lab.eng.bos.redhat.com
 (nat-pool-bos-t.redhat.com. [66.187.233.206])
 by smtp.gmail.com with ESMTPSA id
 x129-20020a376387000000b0069f2aaaf734sm3830995qkb.20.2022.04.25.06.00.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Apr 2022 06:00:57 -0700 (PDT)
From: Tom Rix <trix@redhat.com>
To: bskeggs@redhat.com, kherbst@redhat.com, lyude@redhat.com, airlied@linux.ie,
 daniel@ffwll.ch
Date: Mon, 25 Apr 2022 09:00:50 -0400
Message-Id: <20220425130050.1643103-1-trix@redhat.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=trix@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true
X-Mailman-Approved-At: Sun, 08 May 2022 03:49:54 +0000
Subject: [Nouveau] [PATCH] drm/nouveau/disp/gv100: make gv100_disp_wimm
 static
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

Sparse reports this issue
wimmgv100.c:39:1: warning: symbol 'gv100_disp_wimm' was not declared. Should it be static?

This variable is only used in wimmgv100.c.  Single file variables should be static.
So use static as its storage-class specifier.

Signed-off-by: Tom Rix <trix@redhat.com>
---
 drivers/gpu/drm/nouveau/nvkm/engine/disp/wimmgv100.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/disp/wimmgv100.c b/drivers/gpu/drm/nouveau/nvkm/engine/disp/wimmgv100.c
index 89d783368b4f..bb4db6351ddf 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/disp/wimmgv100.c
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/disp/wimmgv100.c
@@ -35,7 +35,7 @@ gv100_disp_wimm_intr(struct nv50_disp_chan *chan, bool en)
 	nvkm_mask(device, 0x611da8, mask, data);
 }
 
-const struct nv50_disp_chan_func
+static const struct nv50_disp_chan_func
 gv100_disp_wimm = {
 	.init = gv100_disp_dmac_init,
 	.fini = gv100_disp_dmac_fini,
-- 
2.27.0

