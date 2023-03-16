Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AE9D6BD267
	for <lists+nouveau@lfdr.de>; Thu, 16 Mar 2023 15:31:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8228310E066;
	Thu, 16 Mar 2023 14:31:31 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B91010E066
 for <nouveau@lists.freedesktop.org>; Thu, 16 Mar 2023 14:31:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678977088;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=IUpF5YpfmKBEdpMgbmDi2tfoMcmDwV8UPq2EahjD2lk=;
 b=LAhzFcF28ELlLKXnXkXCfTzMqRhIXDhhmM9MhVCnP/BUry+/lOTrzjlhp1rkvqqvQrNL3A
 UvxVRdmq/kw10sNljzmMHvPN7V9whaGqrUySybY3L9mZpbsTtgZbeoZgDPt12B3FnYjzKz
 3Q0uJFhLU5wazbYFOj4nsnKyQMj/joY=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-461-Bw73nyypNginCBvE5WdlLA-1; Thu, 16 Mar 2023 10:31:27 -0400
X-MC-Unique: Bw73nyypNginCBvE5WdlLA-1
Received: by mail-wm1-f69.google.com with SMTP id
 i8-20020a05600c354800b003ed59bae33bso727231wmq.5
 for <nouveau@lists.freedesktop.org>; Thu, 16 Mar 2023 07:31:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678977086;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=IUpF5YpfmKBEdpMgbmDi2tfoMcmDwV8UPq2EahjD2lk=;
 b=TEOAScbVt2HJVfQ+AWzAu2BzadY9z1cFtqJmbzLM+8FZals9wYGMXfAP3enZJPHj8y
 21k0Cgiwhkhm/h8EXR1Qnfc5H7rd1ig3qLHVaC6YN1k28MDuzwbPOGrJiXNGBTVESCuu
 70+Pwaq4hznrIDOWMg81cQZBUnc9AkNb3JhAzJmUOlvzxyzsl1ZJyvsAkBC3ra3tX0+s
 RkJaoZQel5eZVhTbU1Eco7T5DTE9fD3IrJxL/2w2MYNFCnrV9UcPGInWLpg+fv9jxpdV
 nbVp3O3+mOQeWuvcve4tqcAmI1I8DAkqkfvaGJQ6mxc+IRpZ2DZbd7b4+muM5TTne6Jc
 Rqdg==
X-Gm-Message-State: AO0yUKU1YayHSz3rFLWR6AFNwOOrjz3PBNKUMq0vRM1JaH4Llrd7Qy11
 mHN2YpqVVvwDY/uu1R/KRRqc0xZWUs7aWgBE2xfH7sg8odoJqHoyy8jWl7GuhtUCTcHIFzgBEhf
 DcgxGTQQJ1Bprd2jrn4NhxbCWZw==
X-Received: by 2002:a05:600c:1d27:b0:3ed:2a41:8529 with SMTP id
 l39-20020a05600c1d2700b003ed2a418529mr2598330wms.2.1678977085984; 
 Thu, 16 Mar 2023 07:31:25 -0700 (PDT)
X-Google-Smtp-Source: AK7set9ONATU/6Jrjx4MVUvm8TBfCFj8L6oolG4cHH5OfWe7GoRvRBF/xk+E8xlHDHoVUXeZJyfTVw==
X-Received: by 2002:a05:600c:1d27:b0:3ed:2a41:8529 with SMTP id
 l39-20020a05600c1d2700b003ed2a418529mr2598313wms.2.1678977085687; 
 Thu, 16 Mar 2023 07:31:25 -0700 (PDT)
Received: from kherbst.pingu.com (ip1f1032bf.dynamic.kabel-deutschland.de.
 [31.16.50.191]) by smtp.gmail.com with ESMTPSA id
 fk4-20020a05600c0cc400b003e0015c8618sm5145432wmb.6.2023.03.16.07.31.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Mar 2023 07:31:24 -0700 (PDT)
From: Karol Herbst <kherbst@redhat.com>
To: linux-kernel@vger.kernel.org
Date: Thu, 16 Mar 2023 15:31:22 +0100
Message-Id: <20230316143122.2377354-1-kherbst@redhat.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true
Subject: [Nouveau] [PATCH] PCI: stop spamming info in quirk_nvidia_hda
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
Cc: Bjorn Helgaas <bhelgaas@google.com>, linux-pci@vger.kernel.org,
 nouveau@lists.freedesktop.org
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

Users kept complaining about those messages and it's a little spammy on
prime systems so turn it into a debug print.

Cc: Bjorn Helgaas <bhelgaas@google.com>
Cc: Lukas Wunner <lukas@wunner.de>
Cc: linux-pci@vger.kernel.org
Cc: nouveau@lists.freedesktop.org
Fixes: b516ea586d71 ("PCI: Enable NVIDIA HDA controllers")
Signed-off-by: Karol Herbst <kherbst@redhat.com>
---
 drivers/pci/quirks.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pci/quirks.c b/drivers/pci/quirks.c
index 44cab813bf951..b10c77bbe4716 100644
--- a/drivers/pci/quirks.c
+++ b/drivers/pci/quirks.c
@@ -5549,7 +5549,7 @@ static void quirk_nvidia_hda(struct pci_dev *gpu)
 	if (val & BIT(25))
 		return;
 
-	pci_info(gpu, "Enabling HDA controller\n");
+	pci_dbg(gpu, "Enabling HDA controller\n");
 	pci_write_config_dword(gpu, 0x488, val | BIT(25));
 
 	/* The GPU becomes a multi-function device when the HDA is enabled */
-- 
2.39.2

