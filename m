Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D18B3E3C7F
	for <lists+nouveau@lfdr.de>; Sun,  8 Aug 2021 21:24:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 54C4389B11;
	Sun,  8 Aug 2021 19:24:00 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12olkn2056.outbound.protection.outlook.com [40.92.23.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C6B8789B11
 for <nouveau@lists.freedesktop.org>; Sun,  8 Aug 2021 19:23:58 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iGSF8U/rsA0M005DWdh9PUYd4zsmrRc2uF+uY9Zepz/nZAfqvE8mwsGy7CSkq8Sgx0ygHaO9VEUzfsFgZtgWqLeeJ4QkBuIcDuELFwG1+3in2nhRFNYbiewMZTWuTXtJoIDO2Ry5xNwEFuU72oVau0xcIixSY5TQiCxhk0z82SfCl0ebonNJyB+CrjeSSMyPFPkfTQ8jwCxZ2rfpFp0h0O0QjK3rZ7ZyxgAbnFa9xE5udNLW4oFLp1LuKJYC/COyCzRSx1GhdqiAGaUCTh39nL74GmgEMKDy9FuUE7VQmYgYETNhVqDRvuf7Zo6fkmFgf4/SZjWEdnJF8gDcvVstlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8MDQA2+J1gXyx2VhwlSbmpFlmvWl55/J0/Wq0MLcO+8=;
 b=WMYMs8lyav657tJEjqHxUa1fYFEjjvAXzgtnytaGnqvah+IS/g8buaClv9o8KEi4Tulf2KRgjEG1+2DSBtIt1hYvOC0dnEB7SDqGdV+GOzYCEA1zP0UbwRd/qWvC5eFLA3fDZcAbaVkKBoDJMZCcS3hao1CjUXvBdxSrNDmdXnXPnUK7apNrIzim48RUL2OqpdCraOTYicz/hRC5/ukn7/Y6QcNfThBCECq+GC/6d2IBaUw6MZ/9TO5I26ZoodPICCy5xMkWOzNlAaGQWjwU0ZBQmIoDIl4GXs8rkNoNrmt7MECpZxvFH7+bJX0AKyVZ6w9hEGuse6JCI+2OPt/1eg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hotmail.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8MDQA2+J1gXyx2VhwlSbmpFlmvWl55/J0/Wq0MLcO+8=;
 b=dq+W9BjLWrK1jexJMZTUXqANbnxoO9v7LnkPRHIx+Tfk4e47XCuid4GZLUtQB4jADhQdar6TbhDn2oo9HQx3ayT8xwlrMo/07vqQA11iasKBz2txhFm7vSOkImUf9ZwaLX5tGhPl6ECgjY5zjNNHySBRHPkuSuLFr8gJKCH7PLLD24wzHBK/AHJAkcxlyDJPn5khGCsxlc1iiCKDQbuNiqrbfWaQxr+8bDV+a4SQ0EJ8+qS9kTzGDdLhfWqP7DoJQcQgR/qT1QHZA3MrE/CM1CFB4JchxqJMT4KkrU6YPWeijiQ4oxsVy8IhNxKg81u3Cc6TtIXzPF9IRKza+aQXmA==
Received: from BN8NAM12FT027.eop-nam12.prod.protection.outlook.com
 (2a01:111:e400:fc66::49) by
 BN8NAM12HT013.eop-nam12.prod.protection.outlook.com (2a01:111:e400:fc66::476)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4415.5; Sun, 8 Aug
 2021 19:23:57 +0000
Received: from DM6PR19MB2780.namprd19.prod.outlook.com
 (2a01:111:e400:fc66::46) by BN8NAM12FT027.mail.protection.outlook.com
 (2a01:111:e400:fc66::138) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4415.5 via Frontend
 Transport; Sun, 8 Aug 2021 19:23:57 +0000
X-IncomingTopHeaderMarker: OriginalChecksum:99982A4A7CDEA89761CDE3E69D0CB6698C17BE51BC5A38DF7D488B71D3AD0CA5;
 UpperCasedChecksum:E806E2E0E5758C8A377EA951F05635B2938EA81877C4ED58C8FAEDDBC17C30B3;
 SizeAsReceived:7301; Count:45
Received: from DM6PR19MB2780.namprd19.prod.outlook.com
 ([fe80::d3:370:7280:e46e]) by DM6PR19MB2780.namprd19.prod.outlook.com
 ([fe80::d3:370:7280:e46e%5]) with mapi id 15.20.4394.022; Sun, 8 Aug 2021
 19:23:57 +0000
From: Ratchanan Srirattanamet <peathot@hotmail.com>
To: bskeggs@redhat.com
Cc: kherbst@redhat.com, nouveau@lists.freedesktop.org,
 Ratchanan Srirattanamet <peathot@hotmail.com>
Date: Mon,  9 Aug 2021 02:23:04 +0700
Message-ID: <DM6PR19MB278000DDEC936A67E85752E5BCF59@DM6PR19MB2780.namprd19.prod.outlook.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-TMN: [e5Rc5eRFmO/eWrsyoJ+bsBJyJtG294wB]
X-ClientProxiedBy: SG2P153CA0035.APCP153.PROD.OUTLOOK.COM (2603:1096:4:c7::22)
 To DM6PR19MB2780.namprd19.prod.outlook.com
 (2603:10b6:5:13d::26)
X-Microsoft-Original-Message-ID: <20210808192304.18858-1-peathot@hotmail.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (113.53.37.21) by
 SG2P153CA0035.APCP153.PROD.OUTLOOK.COM (2603:1096:4:c7::22) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4436.4 via Frontend Transport; Sun, 8 Aug 2021 19:23:55 +0000
X-MS-PublicTrafficType: Email
X-IncomingHeaderCount: 45
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-Correlation-Id: a6bb8ffa-5dc6-4fc6-5953-08d95aa2110a
X-MS-Exchange-SLBlob-MailProps: =?us-ascii?Q?7FNIAzWC7Tok6NFdOUOvq4eRcCUoJWmEREAmRscorAjakZTNfBaVFtQi5JXV?=
 =?us-ascii?Q?DLL6PWEq2a1M3Y6TpdARk5zx5x5fzpAr1aesAzJ8jAHwMDJS0dY6ZD7dei4m?=
 =?us-ascii?Q?sLZ+c+ZAhDXm0Lru9NKMyq62IoOnCgpN+80nRZ4F5/yZRhfxItOGWk3EqBfD?=
 =?us-ascii?Q?BYYtAFPeXQ9IeJBTtiRIOTP8raCWF/MT2aEv3bUMZxDoXWWo/n8H+UXtGytl?=
 =?us-ascii?Q?AXvSqvs9bMEPS8z4K6bpi9xhSh0rCfl1Lkdp1zfRjFFr48Stz9+c3KkrAXik?=
 =?us-ascii?Q?PFcyeCgVLs8QVp+EQ/7ecM2QKetvBZ4BH5ER6vm4oq5uUjbhb0b3nwZTbvYr?=
 =?us-ascii?Q?wDSjHVwCfOK2RbyKaPVsqTi4Bptyr59x919TiET1jSU7/wY5KelSGVbyCntA?=
 =?us-ascii?Q?aq829DCor0ToRGjBY4VDlizHouwWqcC0MpLPLGUH4+LfOzkspCKXcOLLPHU8?=
 =?us-ascii?Q?B63t7IiS2ErxXNNgIagM8moyPjN6Zh/5XnrSnyD7Kupabn/8OWevoRXNci2b?=
 =?us-ascii?Q?9PPrZ5tutFEPy6tjhrsXWH4l7XfEpg6gP62dH6uqx55Cq8jXVxgVlCbrMXSu?=
 =?us-ascii?Q?XfVK5o+BsaX+OwzXZL8nPLeNqg7P4iO5oLY/86nydkKoOWlul2HzX6VbEnG5?=
 =?us-ascii?Q?PGL+BcMOz/uVWUmq9GUTIgEJJbWtQcaN9zUpiJEhMFpW/KkpYtcaIOe1d/9u?=
 =?us-ascii?Q?/IyikaDQeVAIPctn/7Zd71aCyGlL0Q3OW5Gu/25IMrEUoR4dE1ut8B2VoB84?=
 =?us-ascii?Q?JTqbWMyLoa4sx/QrjP9U1PpSakqLgEaKPT6ogJLzD6PLQDhJaHcZ1RoERr4D?=
 =?us-ascii?Q?Qi7vkMcz+4Ton9qrYXzS+wF/BB/E98hPlp9c5opdVxQW11LFZv9gTd1bdM/1?=
 =?us-ascii?Q?QVPPo1Jmnb3lxEUA7LutnAOOfRYlyR8xWUcPOebBLo1jOPVBSOMXIzmfO1HN?=
 =?us-ascii?Q?HAgdXVZHRwOyJNJAaIwaEoksJcJt+ZDUjq3h64vdexg0oshkHi32ufHbpnnF?=
 =?us-ascii?Q?mpGw+nGfQJmJkkXShW8VBbsCFV9wXtqbeAOLrEk2pMII0NL9LTJQ4zplmrCf?=
 =?us-ascii?Q?NsObpcKifuM2VIH8opc=3D?=
X-MS-TrafficTypeDiagnostic: BN8NAM12HT013:
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: a9BZtBzBQVQNp6EqyliaZXxXLDz92gDyy8wrCQYoC6TajyEg5Y4CyJaImX3y/1Mcl6mc3BeaZX8k6nbEc5VMXrt6/8aNAR7wgeDhMINunGrnCPX+YrLXtT2RIYdknPcs1NhIAr4PUsFHKSRgz/Dm24GJMfQbHxL9oVh94UFKKy85c0muTzka4dnOYLF4LOiqDeuvMlUbdvnGILQ5WMl9KF2Vi/H+5lgXQ9j9voU9eg9vXVLdeV/glvHse5rx3L5eB6ZQ+4/wl3NL7S9WS6GcbewAmKh1xGkOSiyFcFilFTXsJ4PzNXib6lhXSP/v4tRG0waq9tkLR/5KrsJLDqTqkvaTsnYJuogtS+U8GWQwgd/dPpDgiC1X+l1lOppNackdOLbgfvX0TKLwfQ2xx7mj/aBNS0NEXrNAhe+DOVu9x+x3MoerzO3JRNv099GZreRMQDP3ABSmyZH6+yc5ZM9uBzhyAF2Q3jl6r+j/YrB+XRI=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: d4vHTvra1qDXq8TwV/DAXd+o5PX6E2jIqw2IAeZfcq285xQe3X81ten6PrxpmI3fms+GehZXgPwR6AVaj24KPewSyZiNV5I06U3lqut56CRIVI8VWbzmw1oYqJ6JHZVYbVIbFb9BqxRXf6xNcs085Q==
X-OriginatorOrg: hotmail.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a6bb8ffa-5dc6-4fc6-5953-08d95aa2110a
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Aug 2021 19:23:57.1735 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM12FT027.eop-nam12.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: Internet
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8NAM12HT013
Subject: [Nouveau] [PATCH] drm/nouveau: don't detect DSM for non-NVIDIA
 device
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

The call site of nouveau_dsm_pci_probe() uses single set of output
variables for all invocations. So, we must not write anything to them
unless it's an NVIDIA device. Otherwise, if we are called with another
device after the NVIDIA device, we'll clober the result of the NVIDIA
device.

For example, if the other device doesn't have _PR3 resources, the
detection later would miss the presence of power resource support, and
the rest of the code will keep using Optimus DSM, breaking power
management for that machine. In particular, this fixes power management
of the NVIDIA card in Lenovo Legion 5-15ARH05... well, at least
partially. New error shows up, but this patch is correct in itself
anyway.

Also, because we're detecting NVIDIA's DSM, it doesn't make sense to run
this detection on a non-NVIDIA device anyway. Thus, check at the
beginning of the detection code if this is an NVIDIA card, and just
return if it isn't.

As a bonus, we'll also stop preventing _PR3 usage from the bridge for
unrelated devices, which is always nice, I guess.

https://gitlab.freedesktop.org/drm/nouveau/-/issues/79

Signed-off-by: Ratchanan Srirattanamet <peathot@hotmail.com>
---

It's been discussed in the "previous" patch series ("[PATCH] drm/
nouveau: don't touch has_pr3 for likely-non-NVIDIA device" [1]) that,
instead of changing how the detection works, it's better to check if
the device's vendor is NVIDIA, or if it's a secondary device. I don't
find a feasible way to detect the secondary-ness of a device, so I
opted for checking the vendor code [2].

Thus, this makes the patch different enough to warant a different
summary phrase and description.

[1] https://lore.kernel.org/nouveau/CACO55tsYWW_dfAFWBFLrH51SVivUeN72Omc6DRTCtzVWSLE68w@mail.gmail.com/T/#mb710275dc1dd7e9d83028c218b886400d3a43bfc
[2] It's been suggested to use `nouveau_dsm_get_client_id()`, however,
    on my machine it would return _DIS on both cards, so it can't be
    used.

 drivers/gpu/drm/nouveau/nouveau_acpi.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/nouveau/nouveau_acpi.c b/drivers/gpu/drm/nouveau/nouveau_acpi.c
index 7c15f6448428..9c55f205ab66 100644
--- a/drivers/gpu/drm/nouveau/nouveau_acpi.c
+++ b/drivers/gpu/drm/nouveau/nouveau_acpi.c
@@ -220,6 +220,9 @@ static void nouveau_dsm_pci_probe(struct pci_dev *pdev, acpi_handle *dhandle_out
 	int optimus_funcs;
 	struct pci_dev *parent_pdev;
 
+	if (pdev->vendor != PCI_VENDOR_ID_NVIDIA)
+		return;
+
 	*has_pr3 = false;
 	parent_pdev = pci_upstream_bridge(pdev);
 	if (parent_pdev) {
-- 
2.25.1

