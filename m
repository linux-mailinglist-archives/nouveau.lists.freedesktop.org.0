Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D32C89897E0
	for <lists+nouveau@lfdr.de>; Sun, 29 Sep 2024 23:29:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6850510E369;
	Sun, 29 Sep 2024 21:29:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nvidia.com header.i=@nvidia.com header.b="DwziDzDi";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from xvfrnhpk.outbound-mail.sendgrid.net
 (xvfrnhpk.outbound-mail.sendgrid.net [168.245.32.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF36E10E288
 for <nouveau@lists.freedesktop.org>; Wed, 18 Sep 2024 15:46:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com;
 h=from:subject:in-reply-to:references:mime-version:to:cc:
 content-transfer-encoding:content-type:cc:content-type:from:subject:to;
 s=s1; bh=RbSG7t9Wbvc6nLERNuyEIbEcFl98xy78HtYg4AjxY2Q=;
 b=DwziDzDipYBd0JZDkk+YFk27fx9WYOXRwFfdgvrbxVn7t6Zlvymka9bODue5ebW33yHa
 CE2A5wWnXuMa2AjK523CiiINN6f2Rzp7mN3tnEET2O4joM0M3+CaVIip0rZ85OtAiEaM9w
 MKlbEmFVs2c0whrwgUCAzRTN6Od2HfpKu2NWhme/WNqeNm0lkHLJbhQldytFnf+yRUPhC5
 Z+z/gNhgPu7SaDL7GLNMiyISsDI/nbdO1MtmoIIH/VfpTu3np1MZraNpRE+WtgYBLWS+x4
 Q0PY4j+kISiXNvGYkmwhAem92M5xcIm1WRWzV3Uo9K3wIGE+Xx8rHFQHvucQIJ8w==
Received: by recvd-78b9697b7d-kp2cq with SMTP id
 recvd-78b9697b7d-kp2cq-1-66EAF4A7-32
 2024-09-18 15:41:27.45450942 +0000 UTC m=+510328.042225621
Received: from mtl123.mtl.labs.mlnx (unknown) by geopod-ismtpd-11 (SG)
 with ESMTP id _sHl2CMmRZON7U6KphZeog
 Wed, 18 Sep 2024 15:41:27.236 +0000 (UTC)
Received: from adv-dev-804.mtl.labs.mlnx (adv-dev-804.mtl.labs.mlnx
 [10.237.43.220])
 by mtl123.mtl.labs.mlnx (8.14.4/8.14.4) with ESMTP id 48IFfQVr012726;
 Wed, 18 Sep 2024 18:41:26 +0300
Received: from adv-dev-804.mtl.labs.mlnx (localhost [127.0.0.1])
 by adv-dev-804.mtl.labs.mlnx (8.15.2/8.15.2/Debian-22ubuntu3) with ESMTP id
 48IFfQmD299143; Wed, 18 Sep 2024 18:41:26 +0300
Received: (from ymaman@localhost)
 by adv-dev-804.mtl.labs.mlnx (8.15.2/8.15.2/Submit) id 48IFfQxP299142;
 Wed, 18 Sep 2024 18:41:26 +0300
From: Yonatan Maman <Ymaman@Nvidia.com>
Subject: [PATCH 1/2] nouveau/dmem: Fix privileged error in copy engine channel
Date: Wed, 18 Sep 2024 15:41:27 +0000 (UTC)
Message-Id: <20240918153932.299095-2-Ymaman@Nvidia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240918153932.299095-1-Ymaman@Nvidia.com>
References: <20240918153932.299095-1-Ymaman@Nvidia.com>
MIME-Version: 1.0
X-SG-EID: =?us-ascii?Q?u001=2ELV3ZPuPfm6MEUzpJJKUmPK7bFUdOAxbw77JQHpHEsK=2FX2=2FUTlQRmqLgqk?=
 =?us-ascii?Q?5EHnkMyvO1KLlDiEzbuD8jfGZLnyE8n+BazRQRf?=
 =?us-ascii?Q?FthMJ68fba4aOYcdNGnp09V62Rh5TaW3aLFAbVN?=
 =?us-ascii?Q?tREPqI5NK9hB=2F3u4+ycDNYTX1U4B1GQ+c4TF4L+?=
 =?us-ascii?Q?2a05DX0LLmbwuTvfEnatrQasagIeN5f0FPR72kt?=
 =?us-ascii?Q?le=2F0zMjkVaAZqr9Uy32CJPHUzZ7GXC+WKmimlOR?= =?us-ascii?Q?2HLC?=
To: nouveau@lists.freedesktop.org
Cc: Yonatan Maman <Ymaman@Nvidia.com>, Gal Shalom <GalShalom@Nvidia.com>
X-Entity-ID: u001.9Nu+sJkq3f0LJ/tZbyfOWA==
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset=us-ascii
X-Mailman-Approved-At: Sun, 29 Sep 2024 21:29:23 +0000
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

When `nouveau_dmem_copy_one` is called, the following error occurs:

[272146.675156] nouveau 0000:06:00.0: fifo: PBDMA9: 00000004 [HCE_PRIV]
ch 1 00000300 00003386

This indicates that a copy push command triggered a Host Copy Engine
Privileged error on channel 1 (Copy Engine channel). To address this
issue, modify the Copy Engine channel to allow privileged push commands

Fixes: 6de125383a5cc
Signed-off-by: Yonatan Maman <Ymaman@Nvidia.com>
Signed-off-by: Gal Shalom <GalShalom@Nvidia.com>
---
 drivers/gpu/drm/nouveau/nouveau_drm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_drm.c b/drivers/gpu/drm/nouveau/nouveau_drm.c
index a58c31089613..0a75ce4c5021 100644
--- a/drivers/gpu/drm/nouveau/nouveau_drm.c
+++ b/drivers/gpu/drm/nouveau/nouveau_drm.c
@@ -356,7 +356,7 @@ nouveau_accel_ce_init(struct nouveau_drm *drm)
 		return;
 	}
 
-	ret = nouveau_channel_new(drm, device, false, runm, NvDmaFB, NvDmaTT, &drm->cechan);
+	ret = nouveau_channel_new(drm, device, true, runm, NvDmaFB, NvDmaTT, &drm->cechan);
 	if (ret)
 		NV_ERROR(drm, "failed to create ce channel, %d\n", ret);
 }
-- 
2.34.1

