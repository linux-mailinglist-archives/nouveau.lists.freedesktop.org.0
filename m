Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6276041610F
	for <lists+nouveau@lfdr.de>; Thu, 23 Sep 2021 16:32:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED7346ED7E;
	Thu, 23 Sep 2021 14:32:12 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
X-Greylist: delayed 592 seconds by postgrey-1.36 at gabe;
 Mon, 20 Sep 2021 18:26:59 UTC
Received: from smtp-relay-internal-1.canonical.com
 (smtp-relay-internal-1.canonical.com [185.125.188.123])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B5F66E5BE
 for <nouveau@lists.freedesktop.org>; Mon, 20 Sep 2021 18:26:59 +0000 (UTC)
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com
 [209.85.214.197])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 6D4263F338
 for <nouveau@lists.freedesktop.org>; Mon, 20 Sep 2021 18:17:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1632161826;
 bh=TjtorBP1QG+MBkByGdZNpa22mOVzwIsICVZSplyAbbE=;
 h=From:To:Cc:Subject:Date:Message-Id:MIME-Version;
 b=aM+Xf4yDN35MlZk4MjNWS6NRK4aeW3VBzWN+JrX0G/iyTbSewqSn7Fw4YYr4kEqe6
 Yvn+pQMDEXg8ZJVg1PEWk+DFPTR2t8d2RchPdUoerdit8uNWKpn/9hQKRkZTyFPzbj
 YVdFN1HVkXLH4dHwxSuxYmUq71Iuu957dIf8KmlEKDQoA9sYsaiGJbDW83Aw+elffL
 N2eD6VocivuPbpVHhiK3YKBhiduzbNQPaQvWec8FHz1MKWXqzJGTdh+kaSpPjqVCCE
 U1+8V/fjuLTx1Z+7d7XkKbtwMU9ERXqSRjlciyVOP0pt4li7CQUIBJ1Q+MhlvsqPbK
 TSNKQjGHu37ew==
Received: by mail-pl1-f197.google.com with SMTP id
 b24-20020a170902d89800b00138a0292071so7384571plz.13
 for <nouveau@lists.freedesktop.org>; Mon, 20 Sep 2021 11:17:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=TjtorBP1QG+MBkByGdZNpa22mOVzwIsICVZSplyAbbE=;
 b=G+kLkVRegVo4UQm1eZZyE4o7ckVQWI8hhcgSSsZjT2YIYrghhxTcRYCMd5+C3jArdI
 yMbrsB0FY+PvdfeqMfFZMA+Pl1asT6Wx75108XfkrB4ntPBwMxHK5ZTSUBkNQ45Vjoqe
 V6eb/r9JZeXhjqoHXo/sS1q8FvOiej+bmuIdYEJZME1o49CJBiS2kBwKneHgJdPQBBg2
 B9uMRMPoS+URWJKT0l4vp1dfAx/LrHmDGayq/orVPGJfqfGM/OSCiGkb/Qbm3GVgDGbs
 q2Y42ZQQALY7kjF2lSwI5RnqpbLeJ7GW++/9m27fg7xKu/IUuabdduTgDlqggIPbWU8l
 2bGw==
X-Gm-Message-State: AOAM532V3dXEuBpsT8wIbL8PZgfTRFln+6jeITQRtUcCMfUibanYVAYg
 67gTJPPNeSjiBKcVafL1HseWbVufP0yVOVarLUvG19LKVo00gqJ6IHm9WQCDOA50nbF4KAWbe92
 PtwfE3Zhme0Cq5P9eeCa6HneuWsqKM/Q4dTLKtqDszc8=
X-Received: by 2002:a17:90a:24c:: with SMTP id
 t12mr357829pje.103.1632161824737; 
 Mon, 20 Sep 2021 11:17:04 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwDHbTX6MS7FWBtqKRkGWZ8SYTluchgpjHnl329yBqjyNyrGnU2x+2LHi5jaLReYrYUZHW5Fw==
X-Received: by 2002:a17:90a:24c:: with SMTP id
 t12mr357801pje.103.1632161824463; 
 Mon, 20 Sep 2021 11:17:04 -0700 (PDT)
Received: from localhost.localdomain ([69.163.84.166])
 by smtp.gmail.com with ESMTPSA id m64sm16126877pga.55.2021.09.20.11.17.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Sep 2021 11:17:03 -0700 (PDT)
From: Tim Gardner <tim.gardner@canonical.com>
To: nouveau@lists.freedesktop.org
Cc: tim.gardner@canonical.com, Ben Skeggs <bskeggs@redhat.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Karol Herbst <kherbst@redhat.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Date: Mon, 20 Sep 2021 12:16:47 -0600
Message-Id: <20210920181647.22156-1-tim.gardner@canonical.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Thu, 23 Sep 2021 14:32:11 +0000
Subject: [Nouveau] [PATCH] drm/nouveau/ga102: Free resources on error in
 ga102_chan_new()
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

Coverity complains of a resource leak in ga102_chan_new():

CID 119637 (#7 of 7): Resource leak (RESOURCE_LEAK)
13. leaked_storage: Variable chan going out of scope leaks the storage it points to.
190                return ret;

Fix this by freeing 'chan' in the error path.

Cc: Ben Skeggs <bskeggs@redhat.com>
Cc: David Airlie <airlied@linux.ie>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: Karol Herbst <kherbst@redhat.com>
Cc: dri-devel@lists.freedesktop.org
Cc: nouveau@lists.freedesktop.org
Cc: linux-kernel@vger.kernel.org
Signed-off-by: Tim Gardner <tim.gardner@canonical.com>
---
 .../gpu/drm/nouveau/nvkm/engine/fifo/ga102.c  | 20 ++++++++++++-------
 1 file changed, 13 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/fifo/ga102.c b/drivers/gpu/drm/nouveau/nvkm/engine/fifo/ga102.c
index f897bef13acf..4dbdfb53e65f 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/fifo/ga102.c
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/fifo/ga102.c
@@ -175,19 +175,21 @@ ga102_chan_new(struct nvkm_device *device,
 		}
 	}
 
-	if (!chan->ctrl.runl)
-		return -ENODEV;
+	if (!chan->ctrl.runl) {
+		ret = -ENODEV;
+		goto free_chan;
+	}
 
 	chan->ctrl.chan = nvkm_rd32(device, chan->ctrl.runl + 0x004) & 0xfffffff0;
 	args->token = nvkm_rd32(device, chan->ctrl.runl + 0x008) & 0xffff0000;
 
 	ret = nvkm_memory_new(device, NVKM_MEM_TARGET_INST, 0x1000, 0x1000, true, &chan->mthd);
 	if (ret)
-		return ret;
+		goto free_chan;
 
 	ret = nvkm_memory_new(device, NVKM_MEM_TARGET_INST, 0x1000, 0x1000, true, &chan->inst);
 	if (ret)
-		return ret;
+		goto free_chan;
 
 	nvkm_kmap(chan->inst);
 	nvkm_wo32(chan->inst, 0x010, 0x0000face);
@@ -209,11 +211,11 @@ ga102_chan_new(struct nvkm_device *device,
 
 	ret = nvkm_memory_new(device, NVKM_MEM_TARGET_INST, 0x1000, 0x1000, true, &chan->user);
 	if (ret)
-		return ret;
+		goto free_chan;
 
 	ret = nvkm_memory_new(device, NVKM_MEM_TARGET_INST, 0x1000, 0x1000, true, &chan->runl);
 	if (ret)
-		return ret;
+		goto free_chan;
 
 	nvkm_kmap(chan->runl);
 	nvkm_wo32(chan->runl, 0x00, 0x80030001);
@@ -228,10 +230,14 @@ ga102_chan_new(struct nvkm_device *device,
 
 	ret = nvkm_vmm_join(vmm, chan->inst);
 	if (ret)
-		return ret;
+		goto free_chan;
 
 	chan->vmm = nvkm_vmm_ref(vmm);
 	return 0;
+
+free_chan:
+	kfree(chan);
+	return ret;
 }
 
 static const struct nvkm_device_oclass
-- 
2.33.0

