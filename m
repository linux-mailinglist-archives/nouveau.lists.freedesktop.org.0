Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 613F2CCA2CD
	for <lists+nouveau@lfdr.de>; Thu, 18 Dec 2025 04:30:30 +0100 (CET)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 035EB10E4CD;
	Thu, 18 Dec 2025 03:30:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="i7sLxRFE";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 1B82344B0D;
	Thu, 18 Dec 2025 03:22:58 +0000 (UTC)
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1766028177;
 b=g/jhxhEDltr6tqox0TVU3TkJI53SxZytVzUTk0UjTrxeug2zMVZYjKptXrqIadXGxLAUZ
 TRZVyYR7HHYzuwpQ9Km9OgN0CvetwkhHE+EqB0tALNTB5BIZdTDXJMjeuwniK1+dPpJovyw
 xYCPlR/rGXbbAmThZ6gyQiYgAv5+gvrsN1QopWbuSXiSBHtZn8ecD1jaQ94sUd8xYzBHtk4
 IhZ/VcOPOsy3jgFvvdNz/wgGw9UTTbChTFwMBaDaJN29Q072X61rHtIXVunFPnOlVZR1bL0
 Ze80FzBzs6gO/h29rZBMv/FE5cRVMbsJkLz1zO+0h6xZAgYCaiPAki8ZIBdQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1766028177; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=PamHvb4qi/bN808jeEFYQfTiz1WK4OD4AI/1XX6yX+Q=;
 b=y9NzJL3Cat70PQMSIZ3O0XCTy73zKBuNBXh9uhqkKy0DrXvVr5AjVLOlvLN1KwcrMpr2L
 rgfH61KF+EYOxfAFY7MGONGKEstyCM71iJWaddhV8f7LV2z9PZedBzqdmZYHlsyBw06yTbd
 a/O+wQ1GdcsnLzCj2+QBf3VRCkRHrtbPKtJD3C3f4rCh1H07zifNh99pQwPvcLipEIw/63m
 1TvR6rpXVYFaGdclNKjmGL5IC1uhjFAfiMLW5iOHRW8+VjbyAM+c9SNNhiPilrpRdOTwrkz
 HvcpBQMASg3KXhywTntSqYKdj1zd+AdeO6io9gWuf6TgfdOlUjlrOaPwdsnQ==
ARC-Authentication-Results: i=2; mail.freedesktop.org;
 dkim=pass header.d=Nvidia.com;
  arc=pass;
  dmarc=pass (Used From Domain Record) header.from=nvidia.com
 policy.dmarc=reject
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=Nvidia.com;
 arc=pass;
 dmarc=pass (Used From Domain Record) header.from=nvidia.com policy.dmarc=reject
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id 99C7344B0A
	for <nouveau@lists.freedesktop.org>; Thu, 18 Dec 2025 03:22:55 +0000 (UTC)
Received: from CH1PR05CU001.outbound.protection.outlook.com
 (mail-northcentralusazon11010027.outbound.protection.outlook.com
 [52.101.193.27])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 44B3710E0EF
	for <nouveau@lists.freedesktop.org>; Thu, 18 Dec 2025 03:30:25 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=r+cKbA92yyDH/+tIfMQCN6P9PxQQohMgXKh40liPiW2MMzNoMdd4/+cDweGdq7XVN6oHHJFq0uHuSQdpP2Ij5Td4YxDnl1ga5TWErEyHoX3N5odz15QD+Z+vh69LTUaF9uzuUi9E8aNEuHZAZaY9oWi9WWhtFlPxAXBhOSjg0dOS4Lz3qe6h0bPA+57l/aacK2btQJc/bP24mbsBT0FS00AORvg35y2UixTaKEOtfAAZPQVGpHIIGESSRnZc45V7YJfQ2A0PMXjfsw2TDyiRcqj5kNQUjOe7otANK4dLH6N5e+RPoQnWhTytjxTiVWS8BinjfYZMkj6G1Lu8B78mjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PamHvb4qi/bN808jeEFYQfTiz1WK4OD4AI/1XX6yX+Q=;
 b=oCi1+VaxNixpSy9ZlY4rvh8ED0gAAalXtKKNihPVO/1hmBFPlfLZwZ0607VPOzDtV+vTZRvrF6OOtEtfrOgLkxuaOffnJDY9ewNREvqwBaFIxvTw8DztsBqF0YQULVkZp3evax/UgJJQ5dIWQN2OsiqD7XzBb6tKZsxgYPDwmtBy+nYtK20BzVUhr3I/zQCS2n4Pfzs5DrpgTA/oi4FSZ18GBtskdnWonY9U68AXNgNrBjzBlfMu8LBWzazZA8JC8GGIiZevtQ3VXE0fXCKYP9UWuTMT28BKFcXyCqA4l2B+jHf8JSGiQbOQEyexSyKXD6JwYSFiw+xNkohFPcu0hg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PamHvb4qi/bN808jeEFYQfTiz1WK4OD4AI/1XX6yX+Q=;
 b=i7sLxRFERJSDl78od/uzLXpl1FkngqjR+s/pjgKlNmQx6d746v4teOS+J+E6dRAWNtpNEjj7Xns6G5uwR6ZcrpXDm4Gf2OTM/DYwA9wWsQExMZooiv1WTRYQF2lH+WWtI8kcyy8Dz+USRM0eJaRVulM70SnLsNIKG/hs4NWR/miBtzM+G63kcsZWSBAGPMEU8VLDFcpveEjMSAufkmMnlyRLOfOCDTtb9bABp/6caCoiJ8fdGGyLNRC33fvsu5X3ziuyntHVmvCC6VEH1sE/3jhUJriLAPo0GlAQupQB41HJwcLcJrA7Z3BqUZwuwIYcCzmx3aex1ZnLVzSQv/THPw==
Received: from DM6PR02CA0109.namprd02.prod.outlook.com (2603:10b6:5:1b4::11)
 by SA3PR12MB9107.namprd12.prod.outlook.com (2603:10b6:806:381::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.6; Thu, 18 Dec
 2025 03:30:18 +0000
Received: from CH3PEPF00000016.namprd21.prod.outlook.com
 (2603:10b6:5:1b4:cafe::12) by DM6PR02CA0109.outlook.office365.com
 (2603:10b6:5:1b4::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9434.7 via Frontend Transport; Thu,
 18 Dec 2025 03:30:16 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 CH3PEPF00000016.mail.protection.outlook.com (10.167.244.121) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9456.0 via Frontend Transport; Thu, 18 Dec 2025 03:30:17 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 17 Dec
 2025 19:30:05 -0800
Received: from ttabi.nvidia.com (10.126.231.35) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 17 Dec
 2025 19:30:03 -0800
From: Timur Tabi <ttabi@nvidia.com>
To: Danilo Krummrich <dakr@kernel.org>, Alexandre Courbot
	<acourbot@nvidia.com>, Joel Fernandes <joelagnelf@nvidia.com>, John Hubbard
	<jhubbard@nvidia.com>, <nouveau@lists.freedesktop.org>,
	<rust-for-linux@vger.kernel.org>
Subject: [PATCH v4 00/11] gpu: nova-core: add Turing support
Date: Wed, 17 Dec 2025 21:29:44 -0600
Message-ID: <20251218032955.979623-1-ttabi@nvidia.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.126.231.35]
X-ClientProxiedBy: rnnvmail202.nvidia.com (10.129.68.7) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PEPF00000016:EE_|SA3PR12MB9107:EE_
X-MS-Office365-Filtering-Correlation-Id: 3e01ccdf-a093-4003-bc87-08de3de5c3f8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|376014|1800799024|36860700013;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?UBoItIvtA2+ioYdMZ660YCBnOOp1kyp91SRFgGZL4tnWVgn9t7wdR+NSKFNi?=
 =?us-ascii?Q?pTW3vxkGDI98UkJPQY9lhDDY+sx5Yjn4pvenUt++Lbrti2/5t5+ebWXqh08k?=
 =?us-ascii?Q?CGsOiXP7PpWGekCS6QONmRnd1vBFhxEmg0HGQBbRWVW2HTadg3EZFC2RQDDe?=
 =?us-ascii?Q?h//Go1ClToxTgEMN+qjM/frgqBusZcOuMORDe+84JnQMJyv8wofBjzv02a4b?=
 =?us-ascii?Q?ONBeSV68xyjG0Dcqg9A/PWVxxFDAlCyTlO1QEPi4vwq7ySspJ7I81lNk/62f?=
 =?us-ascii?Q?UE7lt5Ym69z8pu+ehhAt4/EHVTA//1GLopv/YXznA2JQVbj/DoF7j9WgHbJc?=
 =?us-ascii?Q?e9p1BDxA4uAJzZvgOxxshnebuoVxHEvUkAlFzhVOPT7XNsdQD/mNarjSeX+h?=
 =?us-ascii?Q?sNupGnTm6DXha2r5HA7eK47lnOFlLeYQRcuOfjURNu7FCGPl97smBqEEDo12?=
 =?us-ascii?Q?N465ihTjaDbwH4t4/pn6X/wTkENxIAkh9K8p+2AekZjPbWeSYamrDYNO+dIw?=
 =?us-ascii?Q?+AJyvFoebEYc3ge/DX9lbTU9t2DF3XVO5Y4e0OgWwixY8PMtFDgYZIeWoNZE?=
 =?us-ascii?Q?Y1Py5daiThTpKSDm40YUMBqIKpaFQ9k3crD55gxhDHGNeuPU36omuoiKobfl?=
 =?us-ascii?Q?+vvSWWSRLIJjRp7Ng5gMW5Lu2hF2chJs1jdINrCG9/F9dH2Na8WzC7Skxz8d?=
 =?us-ascii?Q?h7S1w6H/J9aM5gOxSfE72WAzVqTIXRuNZcVo/SkJhoTI0cmu0XJjTZnD1iRM?=
 =?us-ascii?Q?+PNx23OUe/T7UHXd1XEXUE2tDZsA+/0qcikARUXCHY7Jr3WO8mn/tV/t8zNP?=
 =?us-ascii?Q?owAOfEOGwpT3yVkZ2By/ZT6ikmkvcREDTGyR4ChTgh0xHalArtnjH0DzDAZM?=
 =?us-ascii?Q?hQwTcVNwjVgULq2puC1MAXrUteSGYJDO7cLDCn0XoE5Rys2TADHRAcvIT4fI?=
 =?us-ascii?Q?+gISRL4F1l5hzoDnjJHg93mFdSJAjGzsKkjOMQzSVuemtY4axPtTF4H6ttFX?=
 =?us-ascii?Q?MZn6THH/9DUoGT7EqGcPUkpJ9C9G5+bGsS1DGvQoAkJs4uHegfGP09bcG1qY?=
 =?us-ascii?Q?OM5zp560m2wWIhuoGLmnzTuBDvwcoQjiBwaw0uA4g/+uxAzNHkniFsCESk0W?=
 =?us-ascii?Q?d8oM8tPufAxFhJxElShbIzdpejWCxyDDq9tJMTipr20owWHlJeDC1UCirDRT?=
 =?us-ascii?Q?pcnxmeiPvuXtVvvIEgtBsc+9leqyjgG4JRfzk8neDx0oWEIw1B/JFa81DToM?=
 =?us-ascii?Q?HbdAGtfzoRXAdP+LoSKK+DVPsdnq2za3oiTtytLRV6sb7aO6f2rFT/z/naig?=
 =?us-ascii?Q?UhlONjsIkDwOUnLBAJtU79j43+TG9e+6FD6+cGQLZZokE4MGrn8R2VOOqvdu?=
 =?us-ascii?Q?ux17MMVAHzXWfgnRufPBJugkWjOmEaLpgQyTXDH+hmI/Au2iW/SViyg/5T5w?=
 =?us-ascii?Q?k0AHBZ+KGRZq0U+MFn9qJv+OzIA2EIe+HNr8BaHICqzR1G02meKC50YkUwo9?=
 =?us-ascii?Q?prQvsNXqBuRWrxcS+l4l90aSe9HNTYGXebwbErdvQmBA+vfqoNBTLdg9uqY0?=
 =?us-ascii?Q?1YtYvO3DOLme4D8H6dM=3D?=
X-Forefront-Antispam-Report: 
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(82310400026)(376014)(1800799024)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Dec 2025 03:30:17.6235
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 3e01ccdf-a093-4003-bc87-08de3de5c3f8
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CH3PEPF00000016.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB9107
Message-ID-Hash: UXB6YK3BVIUODJGFOQQM6PWB6YZZXIYA
X-Message-ID-Hash: UXB6YK3BVIUODJGFOQQM6PWB6YZZXIYA
X-MailFrom: ttabi@nvidia.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation; nonmember-moderation; administrivia;
 implicit-dest; max-recipients; max-size; news-moderation; no-subject;
 digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/UXB6YK3BVIUODJGFOQQM6PWB6YZZXIYA/>
Archived-At: 
 <https://lore.freedesktop.org/20251218032955.979623-1-ttabi@nvidia.com/>
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

That latest linux-firmware.git is required because it contains the
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

Changes from v3:
1. Fixed Rust formatting issues
2. Misc style changes as suggested by Alex
3. Merged regs.rs changes into commits that use them
4. Used Zeroable::zeroed()

Timur Tabi (11):
  gpu: nova-core: rename Imem to ImemSecure
  gpu: nova-core: add ImemNonSecure section infrastructure
  gpu: nova-core: support header parsing on Turing/GA100
  gpu: nova-core: add support for Turing/GA100 fwsignature
  gpu: nova-core: add NV_PFALCON_FALCON_DMATRFCMD::with_falcon_mem()
  gpu: nova-core: move some functions into the HAL
  gpu: nova-core: Add basic Turing HAL
  gpu: nova-core: add Falcon HAL method supports_dma()
  gpu: nova-core: add FalconUCodeDescV2 support
  gpu: nova-core: align LibosMemoryRegionInitArgument size to page size
  gpu: nova-core: add PIO support for loading firmware images

 drivers/gpu/nova-core/falcon.rs           | 246 +++++++++++++++++-----
 drivers/gpu/nova-core/falcon/hal.rs       |  17 ++
 drivers/gpu/nova-core/falcon/hal/ga102.rs |  47 +++++
 drivers/gpu/nova-core/falcon/hal/tu102.rs |  77 +++++++
 drivers/gpu/nova-core/firmware.rs         | 181 +++++++++++++++-
 drivers/gpu/nova-core/firmware/booter.rs  |  43 +++-
 drivers/gpu/nova-core/firmware/fwsec.rs   | 215 ++++++++++++++++---
 drivers/gpu/nova-core/firmware/gsp.rs     |   4 +-
 drivers/gpu/nova-core/gsp/boot.rs         |  10 +-
 drivers/gpu/nova-core/gsp/fw.rs           |  24 ++-
 drivers/gpu/nova-core/regs.rs             |  53 +++++
 drivers/gpu/nova-core/vbios.rs            |  75 ++++---
 12 files changed, 864 insertions(+), 128 deletions(-)
 create mode 100644 drivers/gpu/nova-core/falcon/hal/tu102.rs


base-commit: 60c7398bded2e11f0db40a409a241b8be5910ee2
prerequisite-patch-id: a3e23917ec535263604af95194422382f14c2f21
-- 
2.52.0

