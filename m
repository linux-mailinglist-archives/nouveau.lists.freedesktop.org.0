Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D6D33D1C41
	for <lists+nouveau@lfdr.de>; Thu, 22 Jul 2021 05:10:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 57DC76EEA9;
	Thu, 22 Jul 2021 03:10:05 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12olkn2021.outbound.protection.outlook.com [40.92.23.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 651036EA99
 for <nouveau@lists.freedesktop.org>; Sat, 17 Jul 2021 18:04:07 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Gq+aBmVzSHy1Uuas9GSXbVwSu/MXWOlCyNqpiUiDPdO7uDbvQuC5cV1llrMBcuK0QRsiT/C+dYOoTD9r8grfJs79GEWZ/p2QBrPx0GFcpE+xnTJGgJijgMWb/e+KoTk/59J/cqOH0/NNWIQJav0ixj/qiUqRaUmed2K4i/185kzefjPIYkU7HSqgYIIumTo8T5ftMKM5eTPUDk9Npxx/yq0Sdwoq6kCuSF4WPsq7uef7qJVib7dZu8QGknidT2Db7jGViTfDn7t3eo707Z/01i1b8O4QMlxcdV2/+CZ19RwWrxuYx89zRTiG9MVO/E3C03SM5wP0dvIIxcU07PPNSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1tTSKxnr/1SkQkvaKZlWyGPffZriRw8EecZn7Y2fYHI=;
 b=FCUX16mPFbmOtA8nWCvTsdgoPA6Fp2m1hVJyrhBTdMINP1/Nbg+qwvt38pBuYDzGbWbHGU6DTBA8epnNqdpiw9iyLnnhUQNvdUe5b3m1tVXalb6Zm9flolNdDXocgKunisi9cmonIJTlCgIV5cZDsvktmLS1E+poI/qAfKwePwNfpk2wwXQFEJyHwcjLenxIc3nGaKN1GQ+SO1xnsJoX8bALVP0pN8APXGOLRhVTNXC1Bt3suelXBNEpzGk90c/tjmIRsKwCZiss0kzkvP7UeZI4seGRMqjYUciBLexzHVOOGQQ/w4vgbpNAFy+f6liAfirv2MHtyQBuF57uCyDkGA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hotmail.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1tTSKxnr/1SkQkvaKZlWyGPffZriRw8EecZn7Y2fYHI=;
 b=nWsyaVYpUkWc5RngiKqWjxHg7VP9C2/69SaMvCH9U9ltoQWxtwRLD3QRzmSo+azSYLggjAEjC2unibYxPHSBlJKp/VC06gYTfR+2Hz/4wzb4EAHDhwiWmo9nG6sCfv1CkxWcLFJ3I6bRHb+F3wk3lYlS83eq4rL5LDfI7wMH/lbMZbCUIR8KVAj2a5z7lljArMelCqegXdj9f29UVnKjWle7YS97qZWa4H6uKhelhtnuM4sJMYUlBj+IbZmxq+L4xrCc49z+fe6i+y+WX2wAVYjLQBD3/ObC0QJW6nN+NXvpcUD+wsQVArNvJqWgPCFndiYSSiUAeOdn8ulgHSrB4A==
Received: from DM6NAM12FT047.eop-nam12.prod.protection.outlook.com
 (2a01:111:e400:fc64::43) by
 DM6NAM12HT050.eop-nam12.prod.protection.outlook.com (2a01:111:e400:fc64::376)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4352.9; Sat, 17 Jul
 2021 18:04:05 +0000
Received: from DM6PR19MB2780.namprd19.prod.outlook.com
 (2a01:111:e400:fc64::4f) by DM6NAM12FT047.mail.protection.outlook.com
 (2a01:111:e400:fc64::319) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4352.9 via Frontend
 Transport; Sat, 17 Jul 2021 18:04:05 +0000
X-IncomingTopHeaderMarker: OriginalChecksum:E48691FB14CCE39596666221D5D36A0260DF52F671931391F379209EBECD6120;
 UpperCasedChecksum:07D071641AB0BA0D8B10756FC90DC70E59010B435B078F36E8B4EA245DF212C9;
 SizeAsReceived:7346; Count:45
Received: from DM6PR19MB2780.namprd19.prod.outlook.com
 ([fe80::d3:370:7280:e46e]) by DM6PR19MB2780.namprd19.prod.outlook.com
 ([fe80::d3:370:7280:e46e%5]) with mapi id 15.20.4331.029; Sat, 17 Jul 2021
 18:04:05 +0000
From: Ratchanan Srirattanamet <peathot@hotmail.com>
To: bskeggs@redhat.com
Date: Sun, 18 Jul 2021 01:02:41 +0700
Message-ID: <DM6PR19MB278063772C30271C6B8929B5BC109@DM6PR19MB2780.namprd19.prod.outlook.com>
X-Mailer: git-send-email 2.25.1
X-TMN: [jahWIjRRpLHm03xdU+16IutMjWr8anf+]
X-ClientProxiedBy: SG2PR01CA0106.apcprd01.prod.exchangelabs.com
 (2603:1096:3:15::32) To DM6PR19MB2780.namprd19.prod.outlook.com
 (2603:10b6:5:13d::26)
X-Microsoft-Original-Message-ID: <20210717180239.493567-1-peathot@hotmail.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (113.53.198.108) by
 SG2PR01CA0106.apcprd01.prod.exchangelabs.com (2603:1096:3:15::32) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.21 via Frontend
 Transport; Sat, 17 Jul 2021 18:04:04 +0000
X-MS-PublicTrafficType: Email
X-IncomingHeaderCount: 45
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-Correlation-Id: 6df8dfde-343d-4eb1-d9d8-08d9494d4435
X-MS-Exchange-SLBlob-MailProps: =?us-ascii?Q?yWRSDCO040ARi10gNL3XVNT8ePF7dyMpv1Hz/xzpNNRnwGGYWD4coxdrQBpR?=
 =?us-ascii?Q?93luTJ2zE2EUdetgB7Sy93dPuU2QWdv9iuxIbZfNfo60GBqo2lCLB59zE2FO?=
 =?us-ascii?Q?YSOMBVbyIKm012ok2lF17WdNr/f9mU+sc0QqspDYuPiMH+HiBOvLwHkfL2NF?=
 =?us-ascii?Q?kN+Wk0m8DgSHGcHL7ME400wuRvh92GtNSggbY8VBs77hXoZZ3gPpqcaT+uER?=
 =?us-ascii?Q?FN65iGpnuwlGCE+U9fAB7DmMq8bkjC33IYC0DHEkeBw+yjgrX1m78Q+cHMlJ?=
 =?us-ascii?Q?mVVXeYI25wo9L/gCygXrywmw1E3l/FzbyRvDK4R1PR1XR7MQglupq49u3H2u?=
 =?us-ascii?Q?siPv6jPEyIx04eZeUGE1pLoP0KF6AtAI0xeP+SpZoTHk3/SsW9IYjSnwYSSS?=
 =?us-ascii?Q?8TOPiaUr2xB9H6QTbePLDJnRP9qGHFkcuhqKJiB7svazLDl7Lth1thKad40N?=
 =?us-ascii?Q?QRxpH2UUJDWoBaO0D3vYTkIU2sWsGae7PCwF8+dDqyrXGjVsR4AwrV/2tfjc?=
 =?us-ascii?Q?/OjOYLjyQtHZa4RJQCSn/HPdUJG0zhx+3xYPLLlCdAjnD/ovPP72gSlYHTc5?=
 =?us-ascii?Q?DefwxcelBjiP9xpU6fOw8vAPUGhXXndzZwbXCRR+dDnsfRYuxvu00BjEjnGs?=
 =?us-ascii?Q?NTO4EikE6oXE8Zjk68nXFndrdS0KXps+Fi2AhOoriMIUQamdFzAkMWPZMAu3?=
 =?us-ascii?Q?HKQ1OZMhB4h213XETfpF5kEfCnBMKODO/pbQpJvdfDjMkXIjXrC26WjdUf61?=
 =?us-ascii?Q?Kpnv90yuuSx+utHorRVZ1g9/TzJt6Mr/Ewu8+3JDSUchCqiUMuBQG8RFOuhx?=
 =?us-ascii?Q?NpYSSpvjvcXhnmWY652OFi6i33wsopQIpEsgyeGuQlVXfu4nm48K8vHM1YQo?=
 =?us-ascii?Q?b6kBH/VpBIiHZD5mNyBat+5Swwr2HK24VuFAAmBQ7sZq1DVzdvGGk5oQgV3g?=
 =?us-ascii?Q?g/bFzh3beDU=3D?=
X-MS-TrafficTypeDiagnostic: DM6NAM12HT050:
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: otNp1bTb1cY3SL2+3kdQnBGvg8ue+uO17W8fTqJDjbsPe36t+V67lcUBFA3IyeSHfqbFAtLiU6dJG0/+oXc2u8xqcL0/RRlrZyZuzpZjIZ+To5Y4Cx08Z/BBz7PRq/MTfuj9ac/gHmJF8zhE8gKz38vhq19yOJVmfRni1Viz3sRc3aANAqq0rZdAVNfevp/6G1tC/Z4VUB/rF3aY55SvKPbXyJmiPIZCV6fQQzSizlDo7uNt/PttyQqiA8B5bY/KpbSI46aOXNSJThczVJhdUGyL5y+N/lIWagMRHLBYo6cikdtRoNVjkU7vly72bVokCLqzrtpBJ6DxWM/A4EG/L+bzYzjHsStqtBvXAxWN/gmeixa6+IG7kDa9ManOw1v5XIkItpYkAVlxTAld55Vc4NWhWAkS37LWFMRttCiAMg8hCVJjAwRXDfSDO9KqA3gM
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: RbudoOukIqdjz9Q+1qaAaS7+cBO1yMczAPkei2UvXvLuzOCB5rztuVpVJBzFokpEoB3TYsmqqFiNKrnV9xKDxyG8qL654SvAQN0qeBBCr8Gsy1fo1SnojHZkir3O597OW4VmDqoLpYBPdzSSsu6KFQ==
X-OriginatorOrg: hotmail.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6df8dfde-343d-4eb1-d9d8-08d9494d4435
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jul 2021 18:04:05.8833 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM12FT047.eop-nam12.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: Internet
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6NAM12HT050
X-Mailman-Approved-At: Thu, 22 Jul 2021 03:10:04 +0000
Subject: [Nouveau] [PATCH] drm/nouveau: don't touch has_pr3 for
 likely-non-NVIDIA device
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
Cc: nouveau@lists.freedesktop.org,
 Ratchanan Srirattanamet <peathot@hotmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

The call site of nouveau_dsm_pci_probe() uses single set of output
variables for all invocations. So, we must not write anything to them
until we think this is an NVIDIA device of interest. Otherwise, if we
are called with another device after the NVIDIA device, we'll clober the
result of the NVIDIA device.

In this case, if the other device doesn't have _PR3 resources, the
detection later would miss the presence of power resource support, and
the rest of the code will keep using Optimus DSM, breaking power
management for that machine. In particular, this fixes power management
of the NVIDIA card in Lenovo Legion 5-15ARH05... well, at least
partially. New error shows up, but this patch is correct in itself
anyway.

As a bonus, we'll also stop preventing _PR3 usage from the bridge for
unrelated devices, which is always nice, I guess.

As noted in commit ccfc2d5cdb024 ("drm/nouveau: Use generic helper to
check _PR3 presence"), care is taken to leave the _PR3 detection outside
of the optimus_func condition.

https://gitlab.freedesktop.org/drm/nouveau/-/issues/79

Fixes: ccfc2d5cdb024 ("drm/nouveau: Use generic helper to check _PR3
presence")
Signed-off-by: Ratchanan Srirattanamet <peathot@hotmail.com>
---

Hello,

This is my first time submitting a Linux patch. I've done a
number of PR/MR workflows on GitHub or GitLab, but never done any
email-oriented development. So, please excuse me if I'm doing something
incorrectly.

 drivers/gpu/drm/nouveau/nouveau_acpi.c | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_acpi.c b/drivers/gpu/drm/nouveau/nouveau_acpi.c
index 7c15f6448428..c88bda3ac820 100644
--- a/drivers/gpu/drm/nouveau/nouveau_acpi.c
+++ b/drivers/gpu/drm/nouveau/nouveau_acpi.c
@@ -220,15 +220,6 @@ static void nouveau_dsm_pci_probe(struct pci_dev *pdev, acpi_handle *dhandle_out
 	int optimus_funcs;
 	struct pci_dev *parent_pdev;
 
-	*has_pr3 = false;
-	parent_pdev = pci_upstream_bridge(pdev);
-	if (parent_pdev) {
-		if (parent_pdev->bridge_d3)
-			*has_pr3 = pci_pr3_present(parent_pdev);
-		else
-			pci_d3cold_disable(pdev);
-	}
-
 	dhandle = ACPI_HANDLE(&pdev->dev);
 	if (!dhandle)
 		return;
@@ -249,6 +240,15 @@ static void nouveau_dsm_pci_probe(struct pci_dev *pdev, acpi_handle *dhandle_out
 	*has_opt = !!optimus_funcs;
 	*has_opt_flags = optimus_funcs & (1 << NOUVEAU_DSM_OPTIMUS_FLAGS);
 
+	*has_pr3 = false;
+	parent_pdev = pci_upstream_bridge(pdev);
+	if (parent_pdev) {
+		if (parent_pdev->bridge_d3)
+			*has_pr3 = pci_pr3_present(parent_pdev);
+		else
+			pci_d3cold_disable(pdev);
+	}
+
 	if (optimus_funcs) {
 		uint32_t result;
 		nouveau_optimus_dsm(dhandle, NOUVEAU_DSM_OPTIMUS_CAPS, 0,
-- 
2.25.1

_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
