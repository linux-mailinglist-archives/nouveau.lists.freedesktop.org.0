Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 78BBDCEFAF1
	for <lists+nouveau@lfdr.de>; Sat, 03 Jan 2026 06:00:01 +0100 (CET)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id C9CE210E196;
	Sat,  3 Jan 2026 04:59:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="kvdd0r9o";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 0076A44C83;
	Sat,  3 Jan 2026 04:51:53 +0000 (UTC)
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1767415912;
 b=S/SgSLkXf/HZziKtsijA8TwvT80TsEh8/YRq+phkh2me1F+PSFlNr90bWggmzQcasR38V
 iLIbdZWnjhN5fyxdbXJYBGSflFrAUwjgxXRV7lcwLR/JvYM/XkVclIZwQTi5gL6eNSlIA+q
 gkdcun0eb3WkACy3jXCGbluBtI0GKLuQBxNrFvQvHVC5Qkpv7+ZPtlwo5kAlcnS70+fT3T9
 naThAb8AVrE/K4+xbJeYV4xjhhb8thCapPaWt9NSe5oHFEi1WoyZ0hs6z6a8vRPF6xVgYPb
 NPOs4kBgfXo3LI67xWfS0XrYBJCDTLx5dkNyG5O8KL3Iqor0vAnNpSev2GXQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1767415912; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=VBMkiqN4VHx+3NeglPg6Z8SueS37gddtYF3Ik2ktQr0=;
 b=iMLlrQKVF2GuF9lVdq3h8MwG28J4/8b6diEPWceVpjcnPtf9ckaT4NsRDM0ansJN+PTwn
 ikKPx2kq6lfJfxIXFaP+j4aMu3ShzseQS7Fs13/RRDlB+/GCsHrPxUFEDJDch7I3qTekI4u
 li5iX3lBIn7fQ0exYzqHzwCdyGnVxEooZYIBWkHouPeWo34tfGbiQUv+S/vEBRyB4GksVKo
 6u1CJOYt6YygjLEcy+xzh+06Qlb/zY9HV9XlSXMk19EgY/dEmUgQR7lB548cL7jWgfTNcpV
 b+qJQPJ3KwE/oYJqe9XvSvJ9kJj0izyhomG5JNxxL2lgLbb4hgba+6udhzbA==
ARC-Authentication-Results: i=2; mail.freedesktop.org;
 dkim=pass header.d=Nvidia.com;
  arc=pass;
  dmarc=pass (Used From Domain Record) header.from=nvidia.com
 policy.dmarc=reject
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=Nvidia.com;
 arc=pass;
 dmarc=pass (Used From Domain Record) header.from=nvidia.com policy.dmarc=reject
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id 0EDDA44C41
	for <nouveau@lists.freedesktop.org>; Sat,  3 Jan 2026 04:51:50 +0000 (UTC)
Received: from BN1PR04CU002.outbound.protection.outlook.com
 (mail-eastus2azon11010027.outbound.protection.outlook.com [52.101.56.27])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 5A6A210E14B
	for <nouveau@lists.freedesktop.org>; Sat,  3 Jan 2026 04:59:55 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Qvd9o04TBWAEIBgJWk8EhTpiYxcdj8vZ7WnVjJx3q4Zy2jS7da7uQKSX9T0FAHX/D4A9Kd4kXivtACWrAjQlY2dshx5B6+McCPhABEO7EwlB4Skd7OPI2zC+HqBtLOAHM/PlX+kxxUvCDhiWM4A7yvKJqxXdDQuolrQQWChCFPk1O1IxneQ6yEeWGFeJdoEE7zj6nzp8CkZKcjDIo7iWbzimBwPxVGWT62y9j3FDc9fPDpDR9xJSNdgxxSPGCbLHqvFroU33JX2X7fPRiKNDdSZk3OeHyy0ZH4PJyojewUMoSzls86iVDSQvOabjdF01mEuOoGers4ecMAkXC+wing==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VBMkiqN4VHx+3NeglPg6Z8SueS37gddtYF3Ik2ktQr0=;
 b=xnHGGt0Uvi4p60JTBVhV6m1Ps+QNouj3OnYojAq1ExnfHgUsDBPGCPX5ioBq9WSHEPLUGoYhzGUEn3UK539V3axtXK0XFOfRiAkLx3nSiaYfWaBDm2mlGvbiXdFp6zbQPKCxDIIvnosMWp6uQ7J4lQoZ2uH5lYW85+BT8pVlwVolNmNVqsCEvXfRqvV2JP6PRQN+hRdMv63IOfA07giwFnrReckJtP2W0cDffsWHhDVT0fXoa9MhKsA+cNJWUlkKvcXbOh4o/3yD+FIttLtQ9asihgmfAUTpRB73MnokNs6vsg+7arZMtVi+DkZt8gskPmS92AyZS3Q3OKkb7f8bBw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VBMkiqN4VHx+3NeglPg6Z8SueS37gddtYF3Ik2ktQr0=;
 b=kvdd0r9oKBrLK5hLYq0DCDD+LIdKSh3+cSFmj/kT4Hri/PTZbaF7asfqaaMn8Q/3AKK6Si/3ECI0HVVlP+338+B+ucqN/pKJbJVAtBl2Lh1FOT+aPIx3LtyQtE45cmjSC/3JchUsh2B7Ei06PcO5nTA9+m34UFcSkh4q3acRfTZN0fHOB34V/zHr/2LAE9GuRQT21nHLDUnrQCwDPHY6A0yXr1LmhImad1hGMsUqNQtGmZ2PxeIYEVp7q0Yz10O2DfB/lMyDh93PccAgukft+YrsXeMXEn1qfCAf8fwNYyVGwUGuXvol5zQ2KgL+BHUZiiwzLO5xNhMuaEd21Fi1mA==
Received: from SN7PR04CA0158.namprd04.prod.outlook.com (2603:10b6:806:125::13)
 by DS7PR12MB8201.namprd12.prod.outlook.com (2603:10b6:8:ef::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9478.4; Sat, 3 Jan
 2026 04:59:50 +0000
Received: from SN1PEPF0002636E.namprd02.prod.outlook.com
 (2603:10b6:806:125:cafe::2a) by SN7PR04CA0158.outlook.office365.com
 (2603:10b6:806:125::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9478.4 via Frontend Transport; Sat, 3
 Jan 2026 04:59:50 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 SN1PEPF0002636E.mail.protection.outlook.com (10.167.241.139) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9499.1 via Frontend Transport; Sat, 3 Jan 2026 04:59:50 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 2 Jan
 2026 20:59:44 -0800
Received: from ubuntu (10.126.231.35) by rnnvmail201.nvidia.com (10.129.68.8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 2 Jan
 2026 20:59:43 -0800
From: Timur Tabi <ttabi@nvidia.com>
To: Danilo Krummrich <dakr@kernel.org>, Alexandre Courbot
	<acourbot@nvidia.com>, Joel Fernandes <joelagnelf@nvidia.com>, John Hubbard
	<jhubbard@nvidia.com>, <nouveau@lists.freedesktop.org>,
	<rust-for-linux@vger.kernel.org>
Subject: [PATCH v5 00/11] gpu: nova-core: add Turing support
Date: Fri, 2 Jan 2026 22:59:23 -0600
Message-ID: <20260103045934.64521-1-ttabi@nvidia.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.126.231.35]
X-ClientProxiedBy: rnnvmail201.nvidia.com (10.129.68.8) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF0002636E:EE_|DS7PR12MB8201:EE_
X-MS-Office365-Filtering-Correlation-Id: 6cc462c9-759d-4fef-9c71-08de4a84ecee
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|1800799024|82310400026|36860700013;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?mFFqHZTmLpuJYdBtpl8wWdzRKTOFvnAfi6KPjahKijFO6/EY+i2DK6SHJr48?=
 =?us-ascii?Q?cimBPNedZW/TVFr0GaqR/sxRiEYqAtu83JWC1B6J/tJczcFo6EjMRKD8qZ0W?=
 =?us-ascii?Q?bHVQ0RObP4xdCtk5/HZuRYU+SzUzY5UKxQS9e/kGdgBoKlqEZYVLiXe/NKZf?=
 =?us-ascii?Q?fG53lzogIcCXfxbKcgXYt7C04Co3G7rwQQVBG3qWxKUGTLk3QSHsz32u5r41?=
 =?us-ascii?Q?pnSERCVMB3DuPU/Fyc43fpyLTyD6JMZK9KEBVWPW6VbfqKckRMeOzG0V7vY+?=
 =?us-ascii?Q?ccZkbSwNiC97vfp2S8UMM9ckGnNia4OuZRCCn3zg0WOATRbChVQrgUjcHvMW?=
 =?us-ascii?Q?7+cxvNjc8WuWQEAPfgPmieGr+5KA2L0R56iPmcYvnJg2oI1vCzP/KSVzhKH9?=
 =?us-ascii?Q?bm8JpVp4/F9uf4KsrGOp3uH6668HcuSrW6WT+E63Rvr9bYXYIIYcF4xpSDnJ?=
 =?us-ascii?Q?RrxpmYYTSJnqqZPubs7/a3Al4zG2ll6poAIKOq8ZG3C9IDP/tNCgM0xtnnR9?=
 =?us-ascii?Q?RJ+dcF69EHGYLwJyMj6DXFeJBpwlo1f0wTwt8tQMk99AEfpSX8eLsyB8I8Tm?=
 =?us-ascii?Q?sFX9An4bsg5X5P8EgVj3sfZQIvtEdKlfTtRvDnzImlaq5Eus1du5LeouDyxX?=
 =?us-ascii?Q?hy6Uhhau8/XP6bm1ooBTCJMcuEPakib5c3Ba0xwRLxHsQQ986cTM1NLtYvNu?=
 =?us-ascii?Q?gjOfIT5ni+OnGKjtSyEHjo2ti1/7Z+G+4XFutXzvtWyxTO6E3/PC5QXXLnQ7?=
 =?us-ascii?Q?6iq60hCvfyKW7zdIJs36q7/oQx8BcSeapOrO8LXbvhaWkFvCYK8HOcn0FmvV?=
 =?us-ascii?Q?4Y2dgbITNJ9Brn8rlzCyXq9etJZ5hG0VfmuN93ekO9mhZg/eHEmr54AzVWJj?=
 =?us-ascii?Q?zcYz1N3ZSS8a8Lg3gOQKDTBCA2oQcfoTZDedLJuiTOHyzHhwpmTiRtjIPbv8?=
 =?us-ascii?Q?XdLp75qwO6fJHR+qsMBECCkGeEtuZ8QmB6WIFVcqv3UKfROPxHVws6kx1A+0?=
 =?us-ascii?Q?KeCXEx+EuzYP7hZyuwGmvwTICboN6FIOnj5LD+gH5hR5qT4erL2cT2YhXNbq?=
 =?us-ascii?Q?xVTnjFMrdJkUgGspoXR/lZZTdEnX6xI+QjtPgIRNZbcwlBQF47dAv6rLnhCc?=
 =?us-ascii?Q?AkcIMpvzmHg+xfgjQ4ZkFaFe6s04Z4GCFQbM5DRtyb7dEPFLxePPDHWFko0Y?=
 =?us-ascii?Q?eyQ1K78PDdxNS+toeYVRSt3k9orFoCv9GvT8U4IUtRdOixIa15zCFTGzcfuH?=
 =?us-ascii?Q?oCtLJ9Po0ThIDgXMwJBSdC6bBKoiiBJv0WuZ14oqY2UA/nnC4fNXoTbNr0ZU?=
 =?us-ascii?Q?5KVY7iBy4JiDZ+3ZzZApltE0xUJgtnPyq1LBQ18EComCr9YWPC1hPR+jFTs8?=
 =?us-ascii?Q?6f9OF2w7K+P/u93AVsQjd69LwaqWzE5TvRcxexkQMNG0ChKcXZCJ7KxmWRbZ?=
 =?us-ascii?Q?MVQBrSJ/bXp9oOEcR4AJuxWl01TTIclpYWweexobCu74K6WMvz8Ag+mafPSO?=
 =?us-ascii?Q?/QycR0xqgGkgDWK7boq8eb5xtHiA5zYZPJZbKnpZ5VISRla4Zk5IAISfTvNJ?=
 =?us-ascii?Q?eQ6vFsGzV3uqAatpwrI=3D?=
X-Forefront-Antispam-Report: 
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(376014)(1800799024)(82310400026)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jan 2026 04:59:50.3316
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 6cc462c9-759d-4fef-9c71-08de4a84ecee
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SN1PEPF0002636E.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB8201
Message-ID-Hash: YFBVDEGPLT3KPKQ3LC4VILUZLGYLOFDQ
X-Message-ID-Hash: YFBVDEGPLT3KPKQ3LC4VILUZLGYLOFDQ
X-MailFrom: ttabi@nvidia.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation; nonmember-moderation; administrivia;
 implicit-dest; max-recipients; max-size; news-moderation; no-subject;
 digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/YFBVDEGPLT3KPKQ3LC4VILUZLGYLOFDQ/>
Archived-At: 
 <https://lore.freedesktop.org/20260103045934.64521-1-ttabi@nvidia.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

This patch set adds basic support for pre-booting GSP-RM
on Turing.

There is also partial support for GA100, but it's currently not
fully implemented.  GA100 is considered experimental in Nouveau,
and so it hasn't been tested with NovaCore either.

The latest linux-firmware.git is required because it contains the
Generic Bootloader image that has not yet been propogated to
distros.

Summary of changes:

1. Introduce non-secure IMEM support.  For GA102 and later, only secure IMEM
is used.
2. Because of non-secure IMEM, Turing booter firmware images need some of
the headers parsed differently for stuff like the load target address.
3. Add support the tu10x firmware signature section in the ELF image.
4. Add several new registers used only on Turing.
5. Some functions that were considered generic Falcon operations are
actually different on Turing vs GA102+, so they are moved to the HAL.
6. The FRTS FWSEC firmware in VBIOS uses a different version of the
descriptor header.
7. On Turing/GA100 LIBOS args struct needs to have its 'size' field
aligned to 4KB.  So pad the struct to make it 4K.
8. Turing Falcons do not support DMA, so PIO is used to copy images
into IMEM/DMEM.

Changes from v4:
1. Fixed various nits
2. Added enum LoadMethod to control whether fw images are uploaded
   via DMA or PIO
3. Added GspArgumentsAligned to ensure RMARGS is 4k-aligned.
4. Replaced FalconUCodeDesc.as_descriptor with impl Deref.

Alexandre Courbot (1):
  gpu: nova-core: align LibosMemoryRegionInitArgument size to page size

Timur Tabi (10):
  gpu: nova-core: rename Imem to ImemSecure
  gpu: nova-core: add ImemNonSecure section infrastructure
  gpu: nova-core: support header parsing on Turing/GA100
  gpu: nova-core: add support for Turing/GA100 fwsignature
  gpu: nova-core: add NV_PFALCON_FALCON_DMATRFCMD::with_falcon_mem()
  gpu: nova-core: move some functions into the HAL
  gpu: nova-core: Add basic Turing HAL
  gpu: nova-core: add Falcon HAL method supports_dma()
  gpu: nova-core: add FalconUCodeDescV2 support
  gpu: nova-core: add PIO support for loading firmware images

 drivers/gpu/nova-core/falcon.rs           | 252 +++++++++++++++++-----
 drivers/gpu/nova-core/falcon/hal.rs       |  22 ++
 drivers/gpu/nova-core/falcon/hal/ga102.rs |  46 ++++
 drivers/gpu/nova-core/falcon/hal/tu102.rs |  84 ++++++++
 drivers/gpu/nova-core/firmware.rs         | 149 ++++++++++++-
 drivers/gpu/nova-core/firmware/booter.rs  |  43 +++-
 drivers/gpu/nova-core/firmware/fwsec.rs   | 199 ++++++++++++++---
 drivers/gpu/nova-core/firmware/gsp.rs     |   6 +-
 drivers/gpu/nova-core/gsp.rs              |   8 +-
 drivers/gpu/nova-core/gsp/boot.rs         |   6 +-
 drivers/gpu/nova-core/gsp/fw.rs           |  14 +-
 drivers/gpu/nova-core/regs.rs             |  53 +++++
 drivers/gpu/nova-core/vbios.rs            |  75 ++++---
 13 files changed, 834 insertions(+), 123 deletions(-)
 create mode 100644 drivers/gpu/nova-core/falcon/hal/tu102.rs


base-commit: 7acc70476f14661149774ab88d3fe23d83ba4249
-- 
2.51.0

