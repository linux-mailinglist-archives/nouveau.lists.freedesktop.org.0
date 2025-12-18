Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 33E68CCC56E
	for <lists+nouveau@lfdr.de>; Thu, 18 Dec 2025 15:54:05 +0100 (CET)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id B550A10E9FF;
	Thu, 18 Dec 2025 14:54:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="s4b17YgT";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id A993D44B8E;
	Thu, 18 Dec 2025 14:46:32 +0000 (UTC)
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1766069192;
 b=IgZ9TV0LWSjD8+zH3s3/bHIt9wLgX/VJ2rW0CrkU4AfSeZmjWitjqJNqQfCYkJj9ZT/FL
 xrrRHgXutg5xj7aCCwO+VjnR8vqTcxISrhnWylXO2kH2I+TgZzntUEQBPOYvkpYOVpyUlsu
 guPTjpWEfrS2IdaGIkb5iUAlUgImyDX51R/pMYBESBlCx+k9QFBhperhuSeRI+0HzS6Ykat
 emO9sTks42nmDusDpw6IiTsPtZ4lRwAlinW4G3YEqPIDf3PJHuIQKHiQvIW0/MkmcYhj2Fm
 S5+XjvlCRsquBO1fiAPDdg/6hB9OstfkgkGlsCTSY2g6v3LrDLreIQjoM8Ig==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1766069192; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=V6H1xJBLWTeg6vtWyxh23EZtU2RVD8uMUMmklPJEMLI=;
 b=tUwSIGYlce5ZkFt1QnTFXDkA/v3miHQxO3/CUa0kHCMHwgAqHZmxVBxcfY1dWcS+iLJ7w
 jHAS4opn+scGdr8O9ppuRLDymMC/4OQl+Ud2KIQXsu+LmRl6M7ZsrAtYqxYYvmp3tvHoL2v
 i47pm+tbxmlQ11I3kfpOh9rgXiYCIDcwCMmfXxKmLA3ojC8s9dQvNIVnaiT+3vQgbckB868
 oaGhmI0KX+SxMZlMstBWtwkq0BL7kwwumqZO0naTMjQH1oqhDRIUwgQD16Th66K8nZf9TNB
 yVoE+wHO85zO0TE/iiLdxrNSa42wQFnf+h0P/eQUJuUa/lVxzFoFVUS/73IA==
ARC-Authentication-Results: i=2; mail.freedesktop.org;
 dkim=pass header.d=Nvidia.com;
  arc=pass;
  dmarc=pass (Used From Domain Record) header.from=nvidia.com
 policy.dmarc=reject
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=Nvidia.com;
 arc=pass;
 dmarc=pass (Used From Domain Record) header.from=nvidia.com policy.dmarc=reject
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id 1B842440A5
	for <nouveau@lists.freedesktop.org>; Thu, 18 Dec 2025 01:32:11 +0000 (UTC)
Received: from MW6PR02CU001.outbound.protection.outlook.com
 (mail-westus2azon11012051.outbound.protection.outlook.com [52.101.48.51])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 7E31710E414
	for <nouveau@lists.freedesktop.org>; Thu, 18 Dec 2025 01:39:40 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eQRrWtCljyuXQDRSlrtkaMVluWK+XjDnFLNmp/Js3CV9VxlFnN5MinFvq+jXKl+0E5vQRzUu06D57iJQetXPM5/Nwcv0cHFz0sKNgiy5GEfJvx4ipn6+Rqj6ob+WV/FpoUcgHeSEaF8MGTvnshyi4shTIoWMmcvsti2aFmNyYsEPWcuTUTrarLZ7U8Cl4p7vy+CkUBPuhAQZIY87Y8U52rqgcm9uD7By+Jsvx93JYhEXw8wsglxdeDU9Nmjrzu6QO/bnX3N7Dz4l0cKBYn61sLsrh+fbnGOgY/WaJCw0UyLTWP2VPNCqofWgc9Q1cr6y2dG3IJWbjrDtAWrCb1BGTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=V6H1xJBLWTeg6vtWyxh23EZtU2RVD8uMUMmklPJEMLI=;
 b=WiWhs0J8LokYqAdfu/jLLWq0NrCIKmTEcYbXaVJR3+xl2ZPPUIco8ROSnadGTYqr8WhJoBmOxsWoC7AYo9CHQ1A6RRTlBkbzYeNORu4MQAsW7sU0aioFG7CzXkdNTkZOQjFEV56amdE1/Fyko/JHAoqaztZ/Hq7FrutXhEaR8yVInHNXEOAVG1ET6z/FvZP342jBYxmH26aNaHdXcxZyRuP2lrH1EznwRVhZKmIs+g8SZRaojde3pWv9CrgKXXQ+IcZykED41VCHM3/sQUnTrXLkoo6TDYUxI2pOBA3u00fXNGneCo6NN4w+xm/Q+UGIh9fX6jpTzdLA9NOhVDN4gw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=garyguo.net smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=V6H1xJBLWTeg6vtWyxh23EZtU2RVD8uMUMmklPJEMLI=;
 b=s4b17YgTpaAb6E33lEjP4/OFWENoDuILRNGJerXNByICrPHwJB8F0SpqMiT1zwZdtgV/1C/SZ3OuzdiSPsJkE6uvTxU6/JlFzY2GMeQhuW7P8d+TS9jWgrKHIZazW2qH+mQjE9hHw4HJnKdEPhJckrIJHV1+opEOmdc4aLYoVpjOH2euOiQHWPyL1Poz4NjvDBclgUsGfkdbzZWV240ZzT+3vRtf+Cf+IcktiVBuNkeK7RvWZsaiXxg1axW7PQ8RHI8adp6j31cVJQTraoBXydZGjBltLPsWA25iTxsbod1dfBln/Mi9qVtgaT7Iimdi8ClmzXnBfrYuwmAScB1bUA==
Received: from BN9PR03CA0483.namprd03.prod.outlook.com (2603:10b6:408:130::8)
 by PH0PR12MB8050.namprd12.prod.outlook.com (2603:10b6:510:26e::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.6; Thu, 18 Dec
 2025 01:39:35 +0000
Received: from BN1PEPF00006000.namprd05.prod.outlook.com
 (2603:10b6:408:130:cafe::9) by BN9PR03CA0483.outlook.office365.com
 (2603:10b6:408:130::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9434.7 via Frontend Transport; Thu,
 18 Dec 2025 01:39:22 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 BN1PEPF00006000.mail.protection.outlook.com (10.167.243.232) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9434.6 via Frontend Transport; Thu, 18 Dec 2025 01:39:35 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 17 Dec
 2025 17:39:19 -0800
Received: from ttabi.nvidia.com (10.126.231.35) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 17 Dec
 2025 17:39:18 -0800
From: Timur Tabi <ttabi@nvidia.com>
To: Gary Guo <gary@garyguo.net>, Danilo Krummrich <dakr@kernel.org>,
	<rust-for-linux@vger.kernel.org>, John Hubbard <jhubbard@nvidia.com>, "Joel
 Fernandes" <joelagnelf@nvidia.com>, Alexandre Courbot <acourbot@nvidia.com>,
	Lyude Paul <lyude@redhat.com>, <nouveau@lists.freedesktop.org>
Subject: [PATCH v3 0/9] gpu: nova-core: expose the logging buffers via debugfs
Date: Wed, 17 Dec 2025 19:39:01 -0600
Message-ID: <20251218013910.459045-1-ttabi@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: BN1PEPF00006000:EE_|PH0PR12MB8050:EE_
X-MS-Office365-Filtering-Correlation-Id: 6c1a0608-88fb-4ba2-21b7-08de3dd64ce4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700013|376014|82310400026|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?GaqIKhPNSgbrBfsftRUu8Dq2OAbZfPQ7srPKSemAlrI2mcXqKZhGOgh1dUxY?=
 =?us-ascii?Q?xuWxBcg87fm6GjVmtDS/tsPEXeo2CQPPwaFVw4t4sqGrOIC95CCaB0CxvDea?=
 =?us-ascii?Q?DLx9SvyIJbWKe0tHKrM2WYEFFZqnG6/DvMqNrBpdtv3k1iSf0XK8VEi3XUO1?=
 =?us-ascii?Q?kDVpq38gmRWP3+dPi9Eg2+Lrzud8ChQWdLawC+sy9U9Zr4QMfqzv2/AAD9SJ?=
 =?us-ascii?Q?91QZwN5SCCE/0RT1qJFoLy2BZDyHEf1KK41/OWXSSSm7513u2Cccv2nvoIWR?=
 =?us-ascii?Q?h6YkVGliODS6rfMM0I5MOecf37dqrce4VtF/DS1ERr7xlHZYziLbo0NZAsDw?=
 =?us-ascii?Q?f9UJ8eAmPtUJ3V25Pb4Ipu+FAE+ixogUbtRP55c0bo2gapBGfgE+9OUroyI6?=
 =?us-ascii?Q?p73d7DOcoc24WnBQyEcIwkwnxAaO5xReMOMuv4uXCpgzavR4QJ6N+nl8C5nB?=
 =?us-ascii?Q?6PA9V02MtW1vkl8GWHuyXXGl4yvkXqqu+JBhK0gHQCKvpVWY3S1KoZvqOe2q?=
 =?us-ascii?Q?fodatIrZ+5uuOkiqKFZP6iPp/9uxMUTpj1awoY55BKtbscL0vZXp/1YJA1TT?=
 =?us-ascii?Q?lodZ9px3XiM/YhFa/LN6h+nUsCwwv5tULVjkfGRC7uZl4rdFZ5sUqKxF7KBc?=
 =?us-ascii?Q?7EK42z8tus3nNNpZPeWNVH3jgR6yH8vz5F4BstYEggM2ierOluLbqan5+XAk?=
 =?us-ascii?Q?ycpQ4bHYYd6mNwMSrq2jeV1iddLh4ZObTQEkIlv7/UYUit3GirVPYAJqdZ/a?=
 =?us-ascii?Q?ygpZi9it+4qAtH+fuwMV1rhpEiucdRvviBcFY2R+ikcEa/sHv/nhmR9tLzVs?=
 =?us-ascii?Q?gbHw3zUFAWjp0p9/QSQ/IEodsoaqUJJVozOBzhq6xF4QOdsSobhp7KFUpgN/?=
 =?us-ascii?Q?ZjZ2u4ydeBK0rkxzTAhhWUtcv1xCaM7av4cwh6ejAxhSA/eL/QUqzorPt22z?=
 =?us-ascii?Q?sTQGc/g+q3c7fLQg5alMtGy9FX8iFDRR2Nc/C6ly2gQzx6EjHoalGHj4Tkda?=
 =?us-ascii?Q?7PDHfAroD8KrCM71jxQd+UnZXa/xwY8DtXkB0yv+f0KOhgW8VExRF9xA9Ymj?=
 =?us-ascii?Q?w5osGvl9rK2bvfy9T7ZiS4Jpbxpb9RWckxUFF34UgkKLlhz/1u7YIHlr1zq8?=
 =?us-ascii?Q?DUDr2WB5CLQRTRGaBqHhztZE0Wp6c0OeSnETZO6iY8xof5vY8YcILT4fpdhH?=
 =?us-ascii?Q?L5jDRd6NBUTg5k5E9snWkoDqyxOrvMIm7WKEKyUYI7gTyJ38RPs/OyjssC9W?=
 =?us-ascii?Q?xRK48hI7FWNeZHbfPOPl0Mts06n9uxDJHkD5OC6Scu3M37j4QfB/NeBBFX+6?=
 =?us-ascii?Q?QTIezbNO+JQErLCSOKiKHJE+4BUcIh2/8Mm7m596zHC3uhPW4PCntDJ0f1yu?=
 =?us-ascii?Q?AIoEfpevFavN/7RahoMWX46kV5IfcYlzzO6z4gOZdzTRlrGZDw1o51jgLLj4?=
 =?us-ascii?Q?hV8jl4Lb5CeUSg8AaVdU8LGj9mFUQtQw5+uXKQH0VdjlEw/DIpTobgPtcgmd?=
 =?us-ascii?Q?TYaojVF2qNZ7VDhRGNMFUBUTOXStS3Cu3RKoG428qX8BFXVVeM28tU1RYOv0?=
 =?us-ascii?Q?HEr856FECbwtz83rOHw=3D?=
X-Forefront-Antispam-Report: 
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(36860700013)(376014)(82310400026)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Dec 2025 01:39:35.3570
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 6c1a0608-88fb-4ba2-21b7-08de3dd64ce4
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BN1PEPF00006000.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB8050
X-MailFrom: ttabi@nvidia.com
X-Mailman-Rule-Hits: implicit-dest
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation; nonmember-moderation; administrivia;
 max-recipients; max-size; news-moderation; no-subject; digests;
 suspicious-header
Message-ID-Hash: QZGRXK54YCB2HTDVD5HJJFUCXU3HLVRT
X-Message-ID-Hash: QZGRXK54YCB2HTDVD5HJJFUCXU3HLVRT
X-Mailman-Approved-At: Thu, 18 Dec 2025 14:46:30 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/QZGRXK54YCB2HTDVD5HJJFUCXU3HLVRT/>
Archived-At: 
 <https://lore.freedesktop.org/20251218013910.459045-1-ttabi@nvidia.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

GSP-RM writes its printf message to "logging buffers", which are blocks
memory allocated by the driver.  The messages are encoded, so exposing
the buffers as debugfs entries allows the buffers to be extracted and
decoded by a special application.

When the driver loads, a /sys/kernel/debug/nova_core root entry is
created.  To do this, the normal module_pci_driver! macro call is
replaced with an explicit initialization function, as this allows
that debugfs entry to be created once for all GPUs.

Then in each GPU's initialization, a subdirectory based on the PCI
BDF name is created, and the logging buffer entries are created under
that.

Note: the debugfs entry has a file size of 0, because debugfs defaults
a 0 size and the Rust abstractions do not adjust it for the same of
the object.  Nouveau makes this adjustment manually in the driver.

Based on Linus' repository, not drm-rust-next.

Summary of changes:

1. Replace module_pci_driver! with explicit init function.
2. Creates root, per-gpu, and individual buffer debugfs entries.
3. Adds a pci::name() method to generate a PCI device name string.
4. Adds a lookup() method to debugfs, so that the root debugfs entry
   doesn't need to be a global variable like it is in Nouveau.
5. Makes some updates to debugfs core code.

Alexandre Courbot (1):
  gpu: nova-core: implement BinaryWriter for LogBuffer

Timur Tabi (8):
  rust: pci: add PCI device name method
  rust: debugfs: add lookup contructor
  rust: debugfs: add Dir::empty() for no-op directory handle
  rust: debugfs: fix Dir::scope() to not borrow self for returned
    lifetime
  gpu: nova-core: Replace module_pci_driver! with explicit module init
  gpu: nova-core: create debugfs root when driver loads
  gpu: nova-core: use pin projection in method boot()
  gpu: nova-core: create GSP-RM logging buffers debugfs entries

 drivers/gpu/nova-core/gsp.rs       |  66 +++++++++++++++---
 drivers/gpu/nova-core/gsp/boot.rs  |  15 ++--
 drivers/gpu/nova-core/nova_core.rs |  29 +++++++-
 rust/kernel/debugfs.rs             | 108 ++++++++++++++++++++++-------
 rust/kernel/debugfs/entry.rs       |  49 ++++++++++++-
 rust/kernel/pci.rs                 |  37 ++++++++++
 6 files changed, 259 insertions(+), 45 deletions(-)


base-commit: ea1013c1539270e372fc99854bc6e4d94eaeff66
-- 
2.52.0

