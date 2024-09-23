Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 73BAE9897E1
	for <lists+nouveau@lfdr.de>; Sun, 29 Sep 2024 23:29:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9BCFD10E36F;
	Sun, 29 Sep 2024 21:29:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nvidia.com header.i=@nvidia.com header.b="AEJCj3m8";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from xvfrnhpk.outbound-mail.sendgrid.net
 (xvfrnhpk.outbound-mail.sendgrid.net [168.245.32.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 620B610E08E
 for <nouveau@lists.freedesktop.org>; Mon, 23 Sep 2024 13:54:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com;
 h=from:subject:mime-version:to:cc:content-transfer-encoding:
 content-type:cc:content-type:from:subject:to;
 s=s1; bh=ziLSBkmD8N3wAECNVc4vP8+a8zEWGyAXVCNY3Vn7ff0=;
 b=AEJCj3m8vbHBBBETUWtOYUy0ZAlb8lLmCPHcnJU4CUoU+DjWbDuF1ZoRYHwdVEyARi6v
 4cnoQPqWaDxyq+ild68etiFoHx+AC7uOgcZF26rtcp4u/ArJmFLnpo6rOeTi2WSFPWAtJ7
 nT2Me7jpOytFpZ4czBR4uHEeNW+vA/LvT0hagctEGlFLFiq1Ox5GqIs/PDwC2b9wKNMpT3
 tbUveqkhhE3bAzBLqs+KJAbBfbazoOXhD5lyA/76iPAcQ/Acq9RrT4Zs4lPWG4CgA/0kNf
 29xt5mGPBAQoAN7SYUZupr/wBrvGzKHnBgXjt4y03wk6qxT4m1tBYGuw+VaM7RkQ==
Received: by recvd-598c644d4f-hh5sv with SMTP id
 recvd-598c644d4f-hh5sv-1-66F1732D-10
 2024-09-23 13:54:53.629840151 +0000 UTC m=+935827.653967892
Received: from mtl123.mtl.labs.mlnx (unknown) by geopod-ismtpd-11 (SG)
 with ESMTP id y9xdXkf6R1up2LgvzBof8Q
 Mon, 23 Sep 2024 13:54:53.460 +0000 (UTC)
Received: from adv-dev-804.mtl.labs.mlnx (adv-dev-804.mtl.labs.mlnx
 [10.237.43.220])
 by mtl123.mtl.labs.mlnx (8.14.4/8.14.4) with ESMTP id 48NDsqur028627;
 Mon, 23 Sep 2024 16:54:52 +0300
Received: from adv-dev-804.mtl.labs.mlnx (localhost [127.0.0.1])
 by adv-dev-804.mtl.labs.mlnx (8.15.2/8.15.2/Debian-22ubuntu3) with ESMTP id
 48NDsqr9356264; Mon, 23 Sep 2024 16:54:52 +0300
Received: (from ymaman@localhost)
 by adv-dev-804.mtl.labs.mlnx (8.15.2/8.15.2/Submit) id 48NDsqpP356263;
 Mon, 23 Sep 2024 16:54:52 +0300
From: Yonatan Maman <Ymaman@Nvidia.com>
Subject: [PATCH 0/2] *** BUG Fix for Nouveau Memory***
Date: Mon, 23 Sep 2024 13:54:53 +0000 (UTC)
Message-Id: <20240923135449.356244-1-Ymaman@Nvidia.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-SG-EID: =?us-ascii?Q?u001=2ELV3ZPuPfm6MEUzpJJKUmPK7bFUdOAxbw77JQHpHEsK=2FX2=2FUTlQRmqLgqk?=
 =?us-ascii?Q?5EHnkMyvO1KLlDiEzbuD8jfGZLnyFjHkFVR4XLP?=
 =?us-ascii?Q?ntsbDQkYp0kfeKMCdmrf2FKZKtszOsCHFCRHaGY?=
 =?us-ascii?Q?yfdFq0IMZ9TNui63vFZ649=2FPh5hcAiSp=2FZGVWem?=
 =?us-ascii?Q?GTl+LCCVBrJUt73GUPLylE=2FRR98P1NeuvrFCjt=2F?=
 =?us-ascii?Q?80oaUsm6FPNzURws+ZLZ1dQRVBUsqyRjB1jsksu?= =?us-ascii?Q?fapD?=
To: nouveau@lists.freedesktop.org
Cc: Yonatan Maman <Ymaman@Nvidia.com>
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

This patch series addresses two critical issues in the Nouveau driver related to device channels, error handling and memory leaking.

- Memory Leak in migrate_to_ram - the migrate_to_ram function was identified as leaking memory when a copy push command fails. This results in the function returning a dirty HIGH_USER page, which can expose sensitive information and pose a security risk. To mitigate this vulnerability, the patch ensures that a zero page is allocated for the destination page, thereby preventing memory leaks and enhancing the security of the driver in case of failure.

- Privileged Error in Copy Engine Channel - an error was observed when the nouveau_dmem_copy_one function is executed, leading to a Host Copy Engine Privileged error on channel 1. The patch addresses this by adjusting the Copy Engine channel configuration to permit privileged push commands, thus resolving the error.

Yonatan Maman (2):
  nouveau/dmem: Fix privileged error in copy engine channel
  nouveau/dmem: Fix memory leak in `migrate_to_ram` upon copy error

 drivers/gpu/drm/nouveau/nouveau_dmem.c | 2 +-
 drivers/gpu/drm/nouveau/nouveau_drm.c  | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

-- 
2.34.1

