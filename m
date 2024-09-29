Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E33859897F1
	for <lists+nouveau@lfdr.de>; Sun, 29 Sep 2024 23:29:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 694C410E3B9;
	Sun, 29 Sep 2024 21:29:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="YK+2Nxx3";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2080.outbound.protection.outlook.com [40.107.223.80])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A8B3610E171
 for <nouveau@lists.freedesktop.org>; Sun, 29 Sep 2024 12:31:50 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ooiIx+cBvDeMP+eKTSX3Ko9Qds5GTWOWQEGM4Ibkp4E6qFEiIKHlWsm5PU7Q0FxZU/L8BxFoUN9XMQFa5hMB/kR+IIGD7v4mF/QObihZ4CF4t/QMxA+TGV4SvmRh0ReaaSakYsGqBEF+5g4jWio+cZhhNMr6q9LPICGHvl27jNEJKcCOmp5LHD1857530SgRA+poSpBI6lmLTED1/s3n00OR+1E0vasKdnTrMe/wc9ELUb/Le1KxZeAHO6gMLQedHWXS2bnTUR1E8gGdEa8kWV/Hr9o5FIqmKfiR45H3nWTr4E9vIkUMTTUp5ryjJfIC32mS5Nwz/llRJk5xBpIgtg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SgM/B74BXkHJ8t9utgm1llijCsC+NQe128KyLYZmAuw=;
 b=h7z6QX5lngl9unp9BDRxVbbD5eL3tcvaoKaCYh6fw9+bm3SHz1r6ZLdeIUB7H86SEfCx+TZkB5joFj4uHyLJ4jqdXf5JoRStH7l6R5U64RtY8UqmPwaJWOQ+TA9DlNMmxIx7ikE1hSDRDZD4zJzKnk6f5HyA3PluEgAabl3WSs4cdy3HuQXXFvB6OzJzeDS0MR3jQd+6vJ/Y9yhY4pois7zOaHVG91RSPaEseu9Mymit0lywVWjyp9KN8ZxEzGKY3zIUI4Fvn5L2rQxz8YFUoKhr9iVIWTYzVKwyjPo3tDkFkSisdV1CqW49rzDlUUIIpkV3FlVLTFgHUu5j6quuTg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SgM/B74BXkHJ8t9utgm1llijCsC+NQe128KyLYZmAuw=;
 b=YK+2Nxx3TrTOs8pyfF9OO/AImIIqADry06Ck/89QQSe58qKPlK6aCsO7fVNyfG+6yN6zkYbttD3aS9MSf9/fgbngKnyiMKytKC9XBEd1p961U7d3tw/ZH1YT1Pjb761tw7NuOe7mnb5Yi/e28cT+yJGSTAtbkuhLh9UUxXUW3YZxB7Y34S1PPsMtG9wVESz/ix+05PCXiDeRXS8Ao/wSlIfOPo+UMZdT2mBiCUX4Gm33Jo/KAvSUMR+/BSWWg1wCrUkuERgL7sKvIg7iSRUvtMD60cupE7JSMDyj4dWWi/h674L7hCmms7Fm684/ELplGNpBS/zsfcehEeLg7iMZ0Q==
Received: from CH5P221CA0013.NAMP221.PROD.OUTLOOK.COM (2603:10b6:610:1f2::10)
 by PH7PR12MB7282.namprd12.prod.outlook.com (2603:10b6:510:209::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8005.22; Sun, 29 Sep
 2024 12:31:44 +0000
Received: from CH1PEPF0000AD7E.namprd04.prod.outlook.com
 (2603:10b6:610:1f2:cafe::de) by CH5P221CA0013.outlook.office365.com
 (2603:10b6:610:1f2::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8005.26 via Frontend
 Transport; Sun, 29 Sep 2024 12:31:44 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 CH1PEPF0000AD7E.mail.protection.outlook.com (10.167.244.87) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8026.11 via Frontend Transport; Sun, 29 Sep 2024 12:31:43 +0000
Received: from rnnvmail204.nvidia.com (10.129.68.6) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Sun, 29 Sep
 2024 05:31:32 -0700
Received: from rnnvmail203.nvidia.com (10.129.68.9) by rnnvmail204.nvidia.com
 (10.129.68.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Sun, 29 Sep
 2024 05:31:31 -0700
Received: from vdi.nvidia.com (10.127.8.9) by mail.nvidia.com (10.129.68.9)
 with Microsoft SMTP Server id 15.2.1544.4 via Frontend Transport; Sun, 29 Sep
 2024 05:31:30 -0700
From: Yonatan Maman <ymaman@nvidia.com>
To: <nouveau@lists.freedesktop.org>
CC: Yonatan Maman <Ymaman@Nvidia.com>, <apopple@nvidia.com>,
 <bskeggs@nvidia.com>
Subject: [PATCH 0/2] *** drm/nouveau/dmem: Fix Memory Leaking and Device
 Channels configuration***
Date: Sun, 29 Sep 2024 15:30:51 +0300
Message-ID: <20240929123053.441096-1-ymaman@nvidia.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0000AD7E:EE_|PH7PR12MB7282:EE_
X-MS-Office365-Filtering-Correlation-Id: f752b981-8494-4aec-baa8-08dce082ad9d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|36860700013|1800799024|82310400026; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?zP1S+sCtAVEv/Baxjmus7UkodMIXSRgbCowXeSTGwr1MhnRA1RQom1xQNPEQ?=
 =?us-ascii?Q?iuC+Q0s8uwK+1kyyfTC/sN48yP7CqUtmj5eW50I52yIr+/0z94pyen78MZUq?=
 =?us-ascii?Q?WJOJWP7SQOODwSaF+tgc925SEL2qYRoWYdg35yyXfd6eiC2a9jnIt5vt2JDe?=
 =?us-ascii?Q?ENKQANwhyyl17NZ8pP6g5uNfGkB7zSBEk2IV5y4RgQBGdZS+2JqjQPekksex?=
 =?us-ascii?Q?kBIR/M20TViUhwZQ7nfTEq8s55vhbQhJYzLlIEIAqYklBS0/lUNHal1ift+/?=
 =?us-ascii?Q?RS15AhtZNbMkOuFDxFeFrXPSkV44/JB+L2ci/85LfGLAMITkvk5jFHEUWu5c?=
 =?us-ascii?Q?vlEJsL6s8ZcDheA2rTBEotwCXR5TR19NrWml9/Aj1XhxRq0noQHsXwhFR/35?=
 =?us-ascii?Q?zUsZeVypckSzvgLXiVWWnL6dWXh11XktsG83J/eqcZf249LmMyxEnEqczQc6?=
 =?us-ascii?Q?5i0k7sSK5dVDhTQ79Q+DHkfXAE1S8e5NDyU/4gR0hw1MZnrUeRmh4ZKKT9Zu?=
 =?us-ascii?Q?aclzsydiwfeg7UcAcUfqlnPJBYlOwGt1t/dVbiPyYdwif7+cKtIC5GMyCjlA?=
 =?us-ascii?Q?dDonZIOQUT09UMfEXOKztOPNErqhIV3gMKtThO3vCydXlMdKcWLUDdsHYLm+?=
 =?us-ascii?Q?tu0ypPmfU54dOMdHOQjdI+YjgoWMAO4T/Hr+FLoaL1NyQcHEJCC2PNiYDlbB?=
 =?us-ascii?Q?Z2OhvqbOx0Xl3s1cM/otUzan1Y8fFP3s8hAkHXST+tiC05oxLJs9NMtcHkZx?=
 =?us-ascii?Q?j7byUXjr4eHRBUJYFbPpWZA8Gh6jKKn0uxrUDHgrM4ec4O+f2X7XkuZBG7nB?=
 =?us-ascii?Q?4z36n45MfQMpbMKId1lhQ1FERYZs+Yv3ycS1RgmMkx4nSA2x5PHyeQubt1AB?=
 =?us-ascii?Q?afWHjt7vlo1lhG/WO6hpzjfe7gPURu5foAzT9TIQtYnUAflFowlnNrbdM9Wi?=
 =?us-ascii?Q?aefQCyQ/ksn5rej1cl6zulJaeSaCqdkBPSxegQqbxmEvBIyAaDdnpeNUyQ0Q?=
 =?us-ascii?Q?i1ney1NAVCvwlrbVi27hMTABV/odkmabrEgWkClYSyS+ljVH3wR7mA8XkZjT?=
 =?us-ascii?Q?qcm57BvUV1eWRMcq3FDM0e4ZnSSGKBt4ryhIb1/SDtr9tgwu9xuINlRNSu9F?=
 =?us-ascii?Q?tW7tzeMlHKmznn1X+5TeW3KOQuv3D1vT3QKfEJmt4G4gE9XB5zHC5HEiu72H?=
 =?us-ascii?Q?MZaFkBn15I2GWIa8cpzp0T/2oudQ4vML6gT+WQZF/GlgbfqGfJMvzhDxtO2O?=
 =?us-ascii?Q?i9xH55Z7/cEoeN7r+5hfdtlrqLp6eo7aa5x3FJdeWpB9pvN3efHN8mqqL2US?=
 =?us-ascii?Q?ta29yA5uwE1ZBSgyBI3OXWoih0jXabf5A8VO9M6UQLlKiZJbUUW9DB/lSvQq?=
 =?us-ascii?Q?eVXVu4CsjpJWOD5S1My58LeCHlrU?=
X-Forefront-Antispam-Report: CIP:216.228.117.160; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge1.nvidia.com; CAT:NONE;
 SFS:(13230040)(376014)(36860700013)(1800799024)(82310400026); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2024 12:31:43.9964 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f752b981-8494-4aec-baa8-08dce082ad9d
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.160];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CH1PEPF0000AD7E.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7282
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

