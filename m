Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AC6419897E9
	for <lists+nouveau@lfdr.de>; Sun, 29 Sep 2024 23:29:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C65710E392;
	Sun, 29 Sep 2024 21:29:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nvidia.com header.i=@nvidia.com header.b="bkC67KeA";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from xvfrnhpk.outbound-mail.sendgrid.net
 (xvfrnhpk.outbound-mail.sendgrid.net [168.245.32.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F080D10E288
 for <nouveau@lists.freedesktop.org>; Wed, 18 Sep 2024 15:46:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com;
 h=from:subject:in-reply-to:references:mime-version:to:cc:
 content-transfer-encoding:content-type:cc:content-type:from:subject:to;
 s=s1; bh=FqlIwZD48b5YhQmqyhADPiG2ENluZ4A33K6uoKNXTSQ=;
 b=bkC67KeAaBpo0YiThTTyYzo7njEydgO15R4dI8EtiDBAId87pe8d5QkXZG1KioeUNkRZ
 beGtabrNNOpZlcZAxXH131Hpk/WpHhFynDpte5l5DCgCFcrk0PUsY6KZhUBNDsI+GNMu91
 4j2bLk1BwZJjrWTQS28/OX1Mtcl9hG2Xhd5VDt8NrBj3dhOCfmn+fVasqcFE97qjrp4+vL
 GP+znRraXIzOHOS867NHZXgk5XNwjtd/55cUr/l/O4feC0nlwwoZ/AfLDM9JrRw6Qixst8
 MibCKopLwoHBLFRgtkprI7P6PCC4MP8ivcG8LoFkAxis+qVGludlYwJE6W3g3ICQ==
Received: by recvd-598c644d4f-nqsl7 with SMTP id
 recvd-598c644d4f-nqsl7-1-66EAF4AB-6
 2024-09-18 15:41:31.113499358 +0000 UTC m=+510187.639525297
Received: from mtl123.mtl.labs.mlnx (unknown) by geopod-ismtpd-7 (SG)
 with ESMTP id T3fs05-xTDiBHis1ZpSdFQ
 Wed, 18 Sep 2024 15:41:30.975 +0000 (UTC)
Received: from adv-dev-804.mtl.labs.mlnx (adv-dev-804.mtl.labs.mlnx
 [10.237.43.220])
 by mtl123.mtl.labs.mlnx (8.14.4/8.14.4) with ESMTP id 48IFfUV8012737;
 Wed, 18 Sep 2024 18:41:30 +0300
Received: from adv-dev-804.mtl.labs.mlnx (localhost [127.0.0.1])
 by adv-dev-804.mtl.labs.mlnx (8.15.2/8.15.2/Debian-22ubuntu3) with ESMTP id
 48IFfUvh299146; Wed, 18 Sep 2024 18:41:30 +0300
Received: (from ymaman@localhost)
 by adv-dev-804.mtl.labs.mlnx (8.15.2/8.15.2/Submit) id 48IFfUre299145;
 Wed, 18 Sep 2024 18:41:30 +0300
From: Yonatan Maman <Ymaman@Nvidia.com>
Subject: [PATCH 2/2] nouveau/dmem: Fix memory leak in `migrate_to_ram` upon
 copy error
Date: Wed, 18 Sep 2024 15:41:31 +0000 (UTC)
Message-Id: <20240918153932.299095-3-Ymaman@Nvidia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240918153932.299095-1-Ymaman@Nvidia.com>
References: <20240918153932.299095-1-Ymaman@Nvidia.com>
MIME-Version: 1.0
X-SG-EID: =?us-ascii?Q?u001=2ELV3ZPuPfm6MEUzpJJKUmPK7bFUdOAxbw77JQHpHEsK=2FX2=2FUTlQRmqLgqk?=
 =?us-ascii?Q?5EHnkMyvO1KLlDiEzbuD8jfGZLnyFeSCZGTFDGV?=
 =?us-ascii?Q?kMJGu9CG2kJajU6Cnf6KqGNtT2F7tlZtDFWhR=2F4?=
 =?us-ascii?Q?yK2g=2FclVY84tBJHOR9SRYdicvfimOUdofED9kRJ?=
 =?us-ascii?Q?EVF=2F1Qd4jzP1gla2KfS56MRs3I58262U41st2rI?=
 =?us-ascii?Q?ptkLYNXexP=2FtzSM7K8ZW4HGYQ+GpzWqFNmq=2Fd4J?=
 =?us-ascii?Q?4r8Y?=
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

