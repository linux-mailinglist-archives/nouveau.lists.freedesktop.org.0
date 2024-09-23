Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AB5079897E5
	for <lists+nouveau@lfdr.de>; Sun, 29 Sep 2024 23:29:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1172510E387;
	Sun, 29 Sep 2024 21:29:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nvidia.com header.i=@nvidia.com header.b="MSv4+qrw";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from xvfrnhpk.outbound-mail.sendgrid.net
 (xvfrnhpk.outbound-mail.sendgrid.net [168.245.32.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C2A910E08E
 for <nouveau@lists.freedesktop.org>; Mon, 23 Sep 2024 13:54:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com;
 h=from:subject:in-reply-to:references:mime-version:to:cc:
 content-transfer-encoding:content-type:cc:content-type:from:subject:to;
 s=s1; bh=FqlIwZD48b5YhQmqyhADPiG2ENluZ4A33K6uoKNXTSQ=;
 b=MSv4+qrwV2bk0cH58cO4G09e4xvkX3VfxurBKQAZ8Ejp6b3KjLYtRjeKlOwTESRqVtQE
 gthXJEhIVXOfR7gkZz0Djm7lVFAxTiVcFZQ3MKt2pReicf/2e3Rd1HP8vhdlsHBtxnBobb
 ugwPX1xH56Q8AL7pnMSOVJ9YO90YsNGxFtN+r7yd9w1Y0HvhhD8qqgktGAq6iZ3+Q8bdDF
 nwt74izG3kDTfgBnunjYHyMgrA2eCITU3plF7c+Q2p4QnKR/MuCf97eGyF0K3lbqjhDMgF
 scfUIYJbfYvN9+NYc+0IrCWYxRmH4zjVVrh79xRIleXWr8l3nAamZ0vhuZyFsStQ==
Received: by recvd-6ccfdb9759-nvdbw with SMTP id
 recvd-6ccfdb9759-nvdbw-1-66F17332-15
 2024-09-23 13:54:58.400958387 +0000 UTC m=+935842.082053598
Received: from mtl123.mtl.labs.mlnx (unknown) by geopod-ismtpd-5 (SG)
 with ESMTP id gtOCFFx3RdGniX3NXaV2_Q
 Mon, 23 Sep 2024 13:54:58.228 +0000 (UTC)
Received: from adv-dev-804.mtl.labs.mlnx (adv-dev-804.mtl.labs.mlnx
 [10.237.43.220])
 by mtl123.mtl.labs.mlnx (8.14.4/8.14.4) with ESMTP id 48NDsvkx028636;
 Mon, 23 Sep 2024 16:54:57 +0300
Received: from adv-dev-804.mtl.labs.mlnx (localhost [127.0.0.1])
 by adv-dev-804.mtl.labs.mlnx (8.15.2/8.15.2/Debian-22ubuntu3) with ESMTP id
 48NDsvV3356270; Mon, 23 Sep 2024 16:54:57 +0300
Received: (from ymaman@localhost)
 by adv-dev-804.mtl.labs.mlnx (8.15.2/8.15.2/Submit) id 48NDsvHA356269;
 Mon, 23 Sep 2024 16:54:57 +0300
From: Yonatan Maman <Ymaman@Nvidia.com>
Subject: [PATCH 2/2] nouveau/dmem: Fix memory leak in `migrate_to_ram` upon
 copy error
Date: Mon, 23 Sep 2024 13:54:58 +0000 (UTC)
Message-Id: <20240923135449.356244-3-Ymaman@Nvidia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240923135449.356244-1-Ymaman@Nvidia.com>
References: <20240923135449.356244-1-Ymaman@Nvidia.com>
MIME-Version: 1.0
X-SG-EID: =?us-ascii?Q?u001=2ELV3ZPuPfm6MEUzpJJKUmPK7bFUdOAxbw77JQHpHEsK=2FX2=2FUTlQRmqLgqk?=
 =?us-ascii?Q?5EHnkMyvO1KLlDiEzbuD8jfGZLnyC4RTO3Q7aNE?=
 =?us-ascii?Q?rxIy80GNX0jjsm0HbF+5G2X4YFBVtXo8TNjePKj?=
 =?us-ascii?Q?zlTHEWfZptWMW2GJSF8l1u=2FF9No2XaRpb4vwF8r?=
 =?us-ascii?Q?hSzKQpAnRJQuhkPi8HetbkyX+DzioNnYkLByKZU?=
 =?us-ascii?Q?nXQd+P226uYWtjdwt=2F9ifcTXq279aIyA8xtDt0+?= =?us-ascii?Q?kkfx?=
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

A copy push command might fail, causing `migrate_to_ram` to return a
dirty HIGH_USER page to the user.

This exposes a security vulnerability in the nouveau driver. To prevent
memory leaks in `migrate_to_ram` upon a copy error, allocate a zero
page for the destination page.

Signed-off-by: Yonatan Maman <Ymaman@Nvidia.com>
Signed-off-by: Gal Shalom <GalShalom@Nvidia.com>
---
 drivers/gpu/drm/nouveau/nouveau_dmem.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_dmem.c b/drivers/gpu/drm/nouveau/nouveau_dmem.c
index 6fb65b01d778..097bd3af0719 100644
--- a/drivers/gpu/drm/nouveau/nouveau_dmem.c
+++ b/drivers/gpu/drm/nouveau/nouveau_dmem.c
@@ -193,7 +193,7 @@ static vm_fault_t nouveau_dmem_migrate_to_ram(struct vm_fault *vmf)
 	if (!spage || !(src & MIGRATE_PFN_MIGRATE))
 		goto done;
 
-	dpage = alloc_page_vma(GFP_HIGHUSER, vmf->vma, vmf->address);
+	dpage = alloc_page_vma(GFP_HIGHUSER | __GFP_ZERO, vmf->vma, vmf->address);
 	if (!dpage)
 		goto done;
 
-- 
2.34.1

