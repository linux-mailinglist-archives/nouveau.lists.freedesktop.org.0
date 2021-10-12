Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B2E4842A5C0
	for <lists+nouveau@lfdr.de>; Tue, 12 Oct 2021 15:33:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 30A7589C1C;
	Tue, 12 Oct 2021 13:33:41 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E15BE89C1C
 for <nouveau@lists.freedesktop.org>; Tue, 12 Oct 2021 13:33:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634045619;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=MT+WGN85virsYnfaWkabBnlRhl4BVNJstj9q0qW4GvU=;
 b=VtGrpfXRcAGzja/Pq5z2cfdPaKMiT7Khaxjrl+9AfvwX15NZLkvItmXjQomTYONKvcmUSm
 jluzBkEyvd0wdqpnLY6O25xtN5ANLBneHN2RfYfBhr/KrYSdNN7vkm/rJFG42dAQaIlbwj
 C0IxhS0F1aMkY+7CJ9rE56MVZAwinYM=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-159-0nftxYUJMVS_wihKcWeOew-1; Tue, 12 Oct 2021 09:33:37 -0400
X-MC-Unique: 0nftxYUJMVS_wihKcWeOew-1
Received: by mail-wr1-f72.google.com with SMTP id
 j19-20020adfb313000000b00160a9de13b3so15761142wrd.8
 for <nouveau@lists.freedesktop.org>; Tue, 12 Oct 2021 06:33:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=MT+WGN85virsYnfaWkabBnlRhl4BVNJstj9q0qW4GvU=;
 b=H+LU3eJgqVO/C+DMZQbsocItPf1n2YZFpoQ6/kwANLNtxTFUJOgFq3pIQzwLYubY6h
 i/4P3ZOZZnLeY4D/ABJhnTfH8CWweyREYkeZ8EpehL8xhV4CUpE1NhUl0FHGJFWhKsYB
 QEouXavvL7ziyNsE2Ya6e3nOCaUnSuVsUsrC8zsBBwx19wA6XQHfTqVgigOL8tb4eptM
 Ybig41T8Bphd+uCx2R2Cerw+vtS6jt6NeYG/OJ3XX99jChmCV35lD38M5LdJftl/1NtN
 2O1CwExpWSkFM5SuZhip/ECbrdD23N63JiPG140hDo1HAp0n9Z6QDbM1GWZqCEK29Url
 8uug==
X-Gm-Message-State: AOAM530eZRMyQYvZBtPyrtrLARqtqr0TzkfV6WeBhRMLZtZFqpBrwrqG
 ExjrOR7BwPJNPNmNgan4cxhO5nqhEFqrmUgp/T/umOzGwUZRFImghEAsyjkMdcSljaV8cCq5ejS
 lSPRTb53Aj9Lujy7cTVz6HafN3A==
X-Received: by 2002:a05:600c:a45:: with SMTP id
 c5mr5550797wmq.79.1634045616528; 
 Tue, 12 Oct 2021 06:33:36 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxhDxKhOlvfo/706pxslzpu1FHeBx94YPhwo2SnElkp9WJha5oN/R8hfR1LOXibQ33TMS0vwQ==
X-Received: by 2002:a05:600c:a45:: with SMTP id
 c5mr5550783wmq.79.1634045616303; 
 Tue, 12 Oct 2021 06:33:36 -0700 (PDT)
Received: from kherbst.pingu.com (ip1f10bb48.dynamic.kabel-deutschland.de.
 [31.16.187.72])
 by smtp.gmail.com with ESMTPSA id q204sm2656305wme.10.2021.10.12.06.33.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Oct 2021 06:33:35 -0700 (PDT)
From: Karol Herbst <kherbst@redhat.com>
To: linux-kernel@vger.kernel.org
Cc: Karol Herbst <kherbst@redhat.com>, Stephen Rothwell <sfr@canb.auug.org.au>,
 DRI <dri-devel@lists.freedesktop.org>, nouveau@lists.freedesktop.org
Date: Tue, 12 Oct 2021 15:33:34 +0200
Message-Id: <20211012133334.1737918-1-kherbst@redhat.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kherbst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Subject: [Nouveau] [PATCH] drm/nouveau/mmu/gp100: remove unused variable
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
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

Fixes a compilation issue introduced because I forgot to test with WERROR
enabled.

Cc: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: DRI <dri-devel@lists.freedesktop.org>
Cc: nouveau@lists.freedesktop.org
Fixes: 404046cf4805 ("drm/nouveau/mmu/gp100-: drop unneeded assignment in the if condition.")
Signed-off-by: Karol Herbst <kherbst@redhat.com>
---
 drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmmgp100.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmmgp100.c b/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmmgp100.c
index 2b21f43069aa..17899fc95b2d 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmmgp100.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmmgp100.c
@@ -488,7 +488,7 @@ gp100_vmm_fault_cancel(struct nvkm_vmm *vmm, void *argv, u32 argc)
 		struct gp100_vmm_fault_cancel_v0 v0;
 	} *args = argv;
 	int ret = -ENOSYS;
-	u32 inst, aper;
+	u32 aper;
 
 	if ((ret = nvif_unpack(ret, &argv, &argc, args->v0, 0, 0, false)))
 		return ret;
-- 
2.31.1

