Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 37B149897EA
	for <lists+nouveau@lfdr.de>; Sun, 29 Sep 2024 23:29:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5420510E398;
	Sun, 29 Sep 2024 21:29:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="uJQq8YEK";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2046.outbound.protection.outlook.com [40.107.243.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D806710E171
 for <nouveau@lists.freedesktop.org>; Sun, 29 Sep 2024 12:17:04 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OWInQH/2fR3Z8NwcClD8X45WD1D/bNIgJnauXf6T08WLR9dye8SMHSOVy/hQGnoavn5yUmeKY8pa6cK55eqSXIbeODVwWKTyy3cJCmtLw6VA/g6cxCzp2UqT+VqX92/FPNabJmRdHMyUNEjl3lZLENIuqQGPJyGNJSfQ+t5GAy6zFQEFSS7YJhCLJaSux9pjSm9tuv3UyDY82DVg06CldAcOjCDTBtZp6t5go0f+KHXKPQTiEtQAdta2PzVQAbPnpmS7j30V1vbom5ngdEkdFF1/hRVrW4rBlhuGadcBcnm6sJG25vHhT3IGdwYttCL0xabn6bKFmGEHhVBrMmd0BQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SgM/B74BXkHJ8t9utgm1llijCsC+NQe128KyLYZmAuw=;
 b=VVjBk7bE3PfEWOAx48Uki7L5X5PPLyrYg1sxSq4MjW5XKuzQP3e9FguMKIvHaNdz8UohEZEDBj3KaleNXwDqAHwwghIDS0DHLgkjH5mU1fa54zrgI98C6yR48SoVS1p9rKrKr+NBrPy4vYiF1GT1VT+Ew2utiGbga5TYppmW3nIFaQudgvhvLIsmXwaAfxXihz5v3MmiXj50aQH/HzPOwH5KXm7Fwag0PZP44AAOw/v64NFB/Rf2HgV2E3Tesr6/KAfwpIqfZwphFyS5v9kew6SnJcq0cBxNMbNllTrcFW2n4Qt/FQq0JT5hmYiajcdepd6QmMhIvbz5nuh267l/WA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SgM/B74BXkHJ8t9utgm1llijCsC+NQe128KyLYZmAuw=;
 b=uJQq8YEKmZMVkdUIy51UK5Lzc8guOndrFZOPGlj9aWG94EGlbmKW0h62N1zhNEYM5J0GhpFbsS7ZxjPHupmtbdHo6uNvs6UTT3CvMtOh3wQnIUDYcK6cFRMrdJvqKAbjQuEiuHgOhYh+6VAm0ho9ARD07ghXFMGekbjE5lP5zldoxTi+rFi+utMQ5+aTOwjkjXAX4wEL5eWs2PuW6emZ3MtJqMFBM7UaMTDvhgKOoo9YpfZwA1MbQbNQwZigwk1MiawHmBVEf3UamArSvy1tOzGjOPQ+drSbpjtmwCtpxPav0kia3K393mGSTpkHHV2qCjA7Mc4V7OVNd6CD17VoGA==
Received: from BN9P223CA0019.NAMP223.PROD.OUTLOOK.COM (2603:10b6:408:10b::24)
 by SJ0PR12MB5634.namprd12.prod.outlook.com (2603:10b6:a03:429::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8005.22; Sun, 29 Sep
 2024 12:17:00 +0000
Received: from BN2PEPF000044A9.namprd04.prod.outlook.com
 (2603:10b6:408:10b:cafe::b7) by BN9P223CA0019.outlook.office365.com
 (2603:10b6:408:10b::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8005.25 via Frontend
 Transport; Sun, 29 Sep 2024 12:16:59 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 BN2PEPF000044A9.mail.protection.outlook.com (10.167.243.103) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8026.11 via Frontend Transport; Sun, 29 Sep 2024 12:16:59 +0000
Received: from rnnvmail202.nvidia.com (10.129.68.7) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Sun, 29 Sep
 2024 05:16:48 -0700
Received: from rnnvmail203.nvidia.com (10.129.68.9) by rnnvmail202.nvidia.com
 (10.129.68.7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Sun, 29 Sep
 2024 05:16:47 -0700
Received: from vdi.nvidia.com (10.127.8.9) by mail.nvidia.com (10.129.68.9)
 with Microsoft SMTP Server id 15.2.1544.4 via Frontend Transport; Sun, 29 Sep
 2024 05:16:47 -0700
From: Yonatan Maman <ymaman@nvidia.com>
To: <nouveau@lists.freedesktop.org>
CC: Yonatan Maman <Ymaman@Nvidia.com>
Subject: [PATCH 0/2] *** drm/nouveau/dmem: Fix Memory Leaking and Device
 Channels configuration***
Date: Sun, 29 Sep 2024 15:16:30 +0300
Message-ID: <20240929121632.441007-1-ymaman@nvidia.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF000044A9:EE_|SJ0PR12MB5634:EE_
X-MS-Office365-Filtering-Correlation-Id: a7d08bcc-4436-457c-6be9-08dce0809e56
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|82310400026|1800799024|376014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?ziyR+suP0G/9giYRBOZJGFApyb1wzfa+RxkvCaoAjPOig1O+K9sSmYlKKcd3?=
 =?us-ascii?Q?raH8XPdtwKGORCgmwfQWPYSXDv0sIhjIFMjxS5e0Y8A/HpqOSm0xZ9w0rNwQ?=
 =?us-ascii?Q?ZWf/rpCeFeZiUFO48E47/Kt1/HnWyz/IxH1DAQYN1ZoTSCfBRd5otkr/TYjJ?=
 =?us-ascii?Q?OEgJ8YRXy24wT7+o4BPb8+7IGmx+l/xQ8OrK+OrO4jAjg/GTkvT6xreoA96z?=
 =?us-ascii?Q?HxdfVa7Ho/9y+JtoBffiLkw4hs8yKaQ9CJhLYNungbpf22n1m9fVpvR0pRuB?=
 =?us-ascii?Q?8kuUfhXbM3fOg/djBI5u4H9iSWgpcqkSHjZuVc5+GKRKCUCgyffUFvGRX81J?=
 =?us-ascii?Q?dv5HMqUq5r5IPk4xfhFxSV1gSBDqyPbB4sefHzB3adP8LZ1lcJKGzObeyeMp?=
 =?us-ascii?Q?3azVWbxwVOHpv5++qeFFSmB3Asc4ysaaOmF30yg6VUZcFlr400EBeJ0iUk7a?=
 =?us-ascii?Q?3FwPek7ogXTa/N0NfGY6H7mKJei5zhRpy+xsYuGelWhi9ouPGLeNjkMnKmvV?=
 =?us-ascii?Q?PhuLFiZsQxIFHBMrxDtWqUYlbiA+k2WPLjNidVRx9tKmKS4yeXD00FX+PXKg?=
 =?us-ascii?Q?mpUNYRpE8EBNJtPO262J1OkmpDDPiRyNVsepkgWYCeCNRUUL4KREvR8EGFWf?=
 =?us-ascii?Q?RfwpPPh8UdPhJBFN8HW+hWH//e5TEDTXLIKSs8yoTlwy04GF6KBG8ECBD3nO?=
 =?us-ascii?Q?6hEgkXe8vZqGNPtCI9LY+sVhXs9ti8wb2qxWEshZe/GyqGJmf0lMYnA1+TlM?=
 =?us-ascii?Q?4g4K1VSrMM/nW6g7Vmn5lW9Yg/46sq7cfx+G3u8owKoP6HwMpIiggnt3US3G?=
 =?us-ascii?Q?yRiyb/yf83t9qifj4WHFJoz76TK+c4SraW1xQK5vzzmBPcOlTs0w6zJrCXNR?=
 =?us-ascii?Q?oP/APPfCMTHGnAlroilaFvCEIl7sG0rZDLZKG9hr0sg8Kr55FnNW819lDuH3?=
 =?us-ascii?Q?rAGymmknZy3lu7HPAwntVOH1gP1v0srY2qCn6FIhrvmoD0YjiVM9cDBPY/py?=
 =?us-ascii?Q?X4UQi54ksZLd37vQAy4yvQLLyHy4l18l2dyLpcpUGiID672CiufzIEHx2+sa?=
 =?us-ascii?Q?EtERYanSUKCsouRSL4V+DlvdIVFIl1ZHyZsmX626lCIeLIb7T4Kkbf+8TXBc?=
 =?us-ascii?Q?ng8fIsMtHpF5uIfFtZvmPA7VIXdgy990PBstvZZENbfLLzFHv+dupvvjUw6o?=
 =?us-ascii?Q?ER8m3f+QWv7T++iywP0vJAx48DYQpc/j9a4mNBwPDGsfsFcTX1MTQOrSEYp8?=
 =?us-ascii?Q?W7YGB0wsDeMtECU8KZf1YuqMNln0crKYFsPzmFqnUYlSBUYQk3KlmDaVun3M?=
 =?us-ascii?Q?UTZK4Zv8EvgYS2/8yEj+dmI669L5RTJYqv48JweAki5ySCyBlazlD7/YfqJh?=
 =?us-ascii?Q?5XwaeM6G+Hw2piMRdbU2fdkJ8LvLk9y1qx3+zCJ2icMqISkh7IhJTsmgpfmq?=
 =?us-ascii?Q?NzcXQhie2D3mHwcXsQnkjroui/E+/qwx?=
X-Forefront-Antispam-Report: CIP:216.228.117.161; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge2.nvidia.com; CAT:NONE;
 SFS:(13230040)(36860700013)(82310400026)(1800799024)(376014); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2024 12:16:59.4792 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a7d08bcc-4436-457c-6be9-08dce0809e56
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.161];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BN2PEPF000044A9.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB5634
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

From: Yonatan Maman <Ymaman@Nvidia.com>

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

