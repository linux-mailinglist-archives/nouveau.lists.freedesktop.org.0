Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E44F2D21094
	for <lists+nouveau@lfdr.de>; Wed, 14 Jan 2026 20:30:29 +0100 (CET)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id C767010E681;
	Wed, 14 Jan 2026 19:30:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="GTzoM5AE";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 3ECB044CB3;
	Wed, 14 Jan 2026 19:21:57 +0000 (UTC)
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1768418517;
 b=bQXc/qQlSc86IIw7mWJY9Xavip2ZWPGXMITYqXkSOuAfqPPOEf0SKGQ6Bi1+Ltw51xtaB
 QMHH/m6Sl3qQjk46i+vH7kK6OkMWNs4mFL9MQNbJSABFRDBcYeYau+Iku8RnJo9V4zo9QQ0
 qHTW3TWjxGdXdWn4b7xTYWJViRFF4geM+63DG9j0AyF56Z7SfBuJbovuHB9lAiXrkCYa/XY
 qWZJYi6P+jL8akVEdKlieNbHsdKzRB09FN0YtpZwqOMqi+qTMgUZlGCqd8AMhR66o4kwxx2
 c83AhbBIWbg77V8p+X5Vzsa0PyEDHDwUHfWUSfXU/WkfOaw/Y7ZD7HG2Zorw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1768418517; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=u82tz22sFgXWhhTjdwDxdE9+o1w3WBSj7gyZneRWpTE=;
 b=DfL2YIFv+IYAdNF33pEnwYblLscVnIL0UGGEoQlAeY7Yh9J/pAJYbV9wy0c1KFm/oLMEq
 JPWGhf+g5NQGk/lmsoEPU+eXUE1hqgiaIPMWNnbsVfjcGuTsg3CqNOSAkMyQ0ZCIzpzDe4S
 u9CjSrW1Hj/b7v8Ls+Gbix3sF/6vcHlX0O6OZDh6F4vy2d9HQ0oeoehiaVKgUHEw5rBIcR9
 dexqe4HfT+t7+bdTBLRy7uEPOIaOWCzOV0Hdn9/EbNRb0/7C3/bvSiYaEkII266jRKqtJ//
 f4dDlkq4ustRyB+DZuC52gUK+4LtTC3aulJRysCA9EeAV60gOUYjfM/jLarg==
ARC-Authentication-Results: i=2; mail.freedesktop.org;
 dkim=pass header.d=Nvidia.com;
  arc=pass;
  dmarc=pass (Used From Domain Record) header.from=nvidia.com
 policy.dmarc=reject
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=Nvidia.com;
 arc=pass;
 dmarc=pass (Used From Domain Record) header.from=nvidia.com policy.dmarc=reject
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id 53E5A44C87
	for <nouveau@lists.freedesktop.org>; Wed, 14 Jan 2026 19:21:54 +0000 (UTC)
Received: from SN4PR2101CU001.outbound.protection.outlook.com
 (mail-southcentralusazon11012022.outbound.protection.outlook.com
 [40.93.195.22])
	by gabe.freedesktop.org (Postfix) with ESMTPS id AA4C110E0F0
	for <nouveau@lists.freedesktop.org>; Wed, 14 Jan 2026 19:30:25 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZIZRCjnGJHrYMjlgpYRl6V7c80DJW7l2wCVc/qyHzBRoVxzSBVlGGMwEecak3sj9AxqNykbJMuvNE5PPEW0izal4OMHICGlqfEh71wwhDM17FSiUskIqklyK393N06nphIa4XO6AplwpEY8o5h8L3wc/fTMfI0SoDZ/XE510D1ZfXcLSsYfLD8Rbdhmbqc+a+/ckkpOZOTEAWvB04BmYVcChuQAcQtathdgxPsb6hiin8Uzyd2FcLRL2OE0gRzG70CHYx/J2kbyzcHV1foAWEtu0DcepCWvAShocMVtiXIeP2FGgVgfpn7pkiUUzXYRBv3MxcEVQvcq9o6W7KRNCnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=u82tz22sFgXWhhTjdwDxdE9+o1w3WBSj7gyZneRWpTE=;
 b=skTKXTzx0t/cFSIg46FIIZ+VTu8l6mT66iHp3tLqsBhxMpFfzShuHhC4xWQ0wTimb+Sa3bPPXtuM/0VA7LADWGCpbMjf2DsY/aoXP2hCvT9eS7NbUysFkBV5Y8r1q7HX6uEe0ktoUoXhhDsesBz+TLs7HYjYT5yOOfQzlPMieBnmGDbgS9NqZQkYrapiUS7zcyRjnmqSIPlpcifoNeWliVAR366ZhgUI7MuyTvx8wW6tktdLmbGAY9s55WoxV+CpfxAsnTib+FY72xLDkKGqJLgsqdlgFwEckfLyo3L9ZYqzmeLYrYIm9QxhvbTYKqd98uFzEWqNBYTscpq1l/TH0g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=u82tz22sFgXWhhTjdwDxdE9+o1w3WBSj7gyZneRWpTE=;
 b=GTzoM5AEt3wUh/CbsZNwmyQi3PHyK2Vcyjb33ATUd+aVb3tLRRBXYd/+GIZNPBNgHQyX21HF6PdJTo96wGNo2pm+pGwiPj4Qs3f/GwCqdEl9XnumnZQh30BEUK+kCvlO63x+Ccr7BzJRCz8xUUBSVS0AAesftpTJSjX0f8zabAZc0LTenqh9YEaQknw2gzrH4tZIucMrjm/3qA8dfS6NN9z6WgzSM0f0r6MF4eeUh+0CQcEDYC81BCzyrTb20I9EiELQpBfyiEGDnXLskSJ4KCnaz9Fitneqsa0JW0BmLiDmEC548m25nC+bzEkfru8tl4J9/Bbc3nhKBwHS3U5QNw==
Received: from PH5P222CA0009.NAMP222.PROD.OUTLOOK.COM (2603:10b6:510:34b::14)
 by IA0PR12MB7579.namprd12.prod.outlook.com (2603:10b6:208:43c::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.5; Wed, 14 Jan
 2026 19:30:21 +0000
Received: from CO1PEPF000044FD.namprd21.prod.outlook.com
 (2603:10b6:510:34b:cafe::e4) by PH5P222CA0009.outlook.office365.com
 (2603:10b6:510:34b::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9520.4 via Frontend Transport; Wed,
 14 Jan 2026 19:30:21 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 CO1PEPF000044FD.mail.protection.outlook.com (10.167.241.203) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9542.0 via Frontend Transport; Wed, 14 Jan 2026 19:30:20 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 14 Jan
 2026 11:29:58 -0800
Received: from ttabi.nvidia.com (10.126.230.35) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 14 Jan
 2026 11:29:57 -0800
From: Timur Tabi <ttabi@nvidia.com>
To: Alexandre Courbot <acourbot@nvidia.com>, John Hubbard
	<jhubbard@nvidia.com>, Joel Fernandes <joelagnelf@nvidia.com>, "Danilo
 Krummrich" <dakr@kernel.org>, <nouveau@lists.freedesktop.org>,
	<rust-for-linux@vger.kernel.org>
Subject: [PATCH v6 00/11] gpu: nova-core: add Turing support
Date: Wed, 14 Jan 2026 13:29:39 -0600
Message-ID: <20260114192950.1143002-1-ttabi@nvidia.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.126.230.35]
X-ClientProxiedBy: rnnvmail202.nvidia.com (10.129.68.7) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000044FD:EE_|IA0PR12MB7579:EE_
X-MS-Office365-Filtering-Correlation-Id: 317e7695-11e9-47fd-62dc-08de53a35b40
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|36860700013|376014|82310400026;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?bca+pZT0B6G3HzGun57Kj3n0AKwB+a1htpdXVCgfpmhCHhZEpv0E+Q2goCuE?=
 =?us-ascii?Q?IunbPraBlsXB7yFWSIaAVaXG78p3FQAvjyciY9slYcovYfTqJK61mqjC3Iht?=
 =?us-ascii?Q?W4WDHtNLC4i8PFnf0XYat4nXuMz2tKotiSVy4YoqdJN623Q5P1LQWa1R5goo?=
 =?us-ascii?Q?rBpCHUk/HS3zv/jN1L6576nJy+SSmkoWhtC+AXjfCK17JQGZfmXU6Id6stOl?=
 =?us-ascii?Q?cydwDRY83n70QUNZvlfKLHKvDUu9zpUDmHyet/6yB9FnW7f+A+nbprWfb8cX?=
 =?us-ascii?Q?4RiVOGNMWJ89ihH65qlV03l4lUXQIDgB/s5OFC1htiIugXwHO9d1G1krF4hd?=
 =?us-ascii?Q?0kgcQZHY+KiQeveM0W2rQozyVJq3/LQDg7fNYbNB2yhJoTn7Hmdcw2Ec0dpP?=
 =?us-ascii?Q?Ky/FnicA7yAWcyQb76ae/wvvc9QJ+RUhZyB9K7AySD7PeglHPOeyLRj1Pu/C?=
 =?us-ascii?Q?Trvqw7bOTc1jJq/wZdF+y4BaxheX4X43uv8eE4yE3NnMX8AuT+X66Jkyuk+A?=
 =?us-ascii?Q?DOd/6GSsnlL6Ii0UbVU7lu/xW8aT9rCGDxbW9j3CmQ4euO5ud+WPJYXn8ZhO?=
 =?us-ascii?Q?wjzt5y5BVhUhMFzaK7L4M4SpB4JRaP0EwUm1eBbNgvN405zoYv/rjE8UDP+E?=
 =?us-ascii?Q?A9RK9lx9tIJmhLDFaWkM/acZPy5N27v9opDmaSWvPoLkz7czpzurCHHhYjbw?=
 =?us-ascii?Q?ZK4tjw2OnfO1gzy7wZAbtC6qcimk8Vx0Pt76UEq6cvVtw8NSB5Y4awpTd+pT?=
 =?us-ascii?Q?UWILtF7lLHAWi973WRZyK+NFeLZCfqIfugsxYPu4t6KrCpmPzsgXw+sW8h+l?=
 =?us-ascii?Q?MwJCq01LaaKMl2QD3YKZD4O+g6rDraQ8jiVlxCGcp+CXEQ1wkkF6D3ifUTjU?=
 =?us-ascii?Q?rN7GyPu1RqxLmzXQ/oNcm0VMyxo6uHMo6qK0PqULvYZ2CPrK5TLHRJ7o/Gi1?=
 =?us-ascii?Q?EzrX9ZhREP9265YT3bqQC2zgViUqFmdMWgUdufU2ro1E6Ms95L/Gj0pX3JCz?=
 =?us-ascii?Q?ZACJV5kMb8Lsq0SvBKZSTvsuXHFX7/WDIO8xIOjFqt5/l6uzVek++SJ7G0Sz?=
 =?us-ascii?Q?PY2KBpqYkU8j5fBzLk7+OG/q2m3CXmAP2FMuuL2e+8fzCm4ojGatVvHqZGWB?=
 =?us-ascii?Q?PbxuarRao4V2Au1p/N+6PDM7gl9mZRyI7TQCAzWK4wLd8j43QPAI0SSFXYbR?=
 =?us-ascii?Q?kEOokCQ5QlMjz7ro+9eOG7qVektmMO2wFMO15pOMgbhHjwvAwbs0yjNDH+gL?=
 =?us-ascii?Q?chqTef7tukFk6aUIKgfXCGuGQAAYHATG3gF/GJwIXaArUoW3vJMREEHXqGqh?=
 =?us-ascii?Q?5CSJfI8Gtu+wZc2vqa2SW6b/Uqfpkx2ztRmsgj8m/Z1JjiloQlO4sNcnt0Tn?=
 =?us-ascii?Q?m12b1cPzoOn7VKgkARnYn43oA+IPVkZAKLuCN3EXMok2JHCq8iZy4sZGoMdw?=
 =?us-ascii?Q?0cSQsHCq6rJ2tvvfGxDVsQH3chYQ2H7Qa3S50JNi3oQS+rL++iNCA2cwGmY1?=
 =?us-ascii?Q?jwzBtxwfKCsn1w+yfP0fS204bn6p15CGfP7lk7ryxMRZ0ezeOECGag9zH7ds?=
 =?us-ascii?Q?3opVmFRiZxIOfmcEz8X4iDUjukapffe5HUfh6bqF8v6J6OhNQVJ9biRWcbCM?=
 =?us-ascii?Q?voPRs0TX3ODrhLdIDM8RkeSqYTc9K4GaZdmFoK7aEPip+AbkbIRj0rc9Rt1R?=
 =?us-ascii?Q?MYgpCA=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(376014)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jan 2026 19:30:20.7493
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 317e7695-11e9-47fd-62dc-08de53a35b40
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CO1PEPF000044FD.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB7579
Message-ID-Hash: HDPRFDYNJW64LTBEKG2XAKRW634GDGWT
X-Message-ID-Hash: HDPRFDYNJW64LTBEKG2XAKRW634GDGWT
X-MailFrom: ttabi@nvidia.com
X-Mailman-Rule-Hits: member-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/HDPRFDYNJW64LTBEKG2XAKRW634GDGWT/>
Archived-At: 
 <https://lore.freedesktop.org/20260114192950.1143002-1-ttabi@nvidia.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

Note: This patchset requires "[PATCH v3 2/7] rust: io: always inline
functions using build_assert with arguments" in order to compile
with CLIPPY.

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

Changes from v5:
1. Fixed rustfmt complaints
2. Fixed stray diff in Alex's patch
3. Added checked_sub to imem_ns_load_params()

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

 drivers/gpu/nova-core/falcon.rs           | 251 +++++++++++++++++-----
 drivers/gpu/nova-core/falcon/hal.rs       |  22 ++
 drivers/gpu/nova-core/falcon/hal/ga102.rs |  46 ++++
 drivers/gpu/nova-core/falcon/hal/tu102.rs |  84 ++++++++
 drivers/gpu/nova-core/firmware.rs         | 149 ++++++++++++-
 drivers/gpu/nova-core/firmware/booter.rs  |  43 +++-
 drivers/gpu/nova-core/firmware/fwsec.rs   | 204 +++++++++++++++---
 drivers/gpu/nova-core/firmware/gsp.rs     |   6 +-
 drivers/gpu/nova-core/gsp.rs              |   8 +-
 drivers/gpu/nova-core/gsp/boot.rs         |   6 +-
 drivers/gpu/nova-core/gsp/fw.rs           |  14 +-
 drivers/gpu/nova-core/regs.rs             |  53 +++++
 drivers/gpu/nova-core/vbios.rs            |  75 ++++---
 13 files changed, 838 insertions(+), 123 deletions(-)
 create mode 100644 drivers/gpu/nova-core/falcon/hal/tu102.rs


base-commit: 654826aa4a8f25cf825ad9254f37e6cb5092098f
prerequisite-patch-id: a3e23917ec535263604af95194422382f14c2f21
-- 
2.52.0

