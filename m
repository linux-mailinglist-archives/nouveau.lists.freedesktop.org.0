Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BE592CCC577
	for <lists+nouveau@lfdr.de>; Thu, 18 Dec 2025 15:54:07 +0100 (CET)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 563EB10EA18;
	Thu, 18 Dec 2025 14:54:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="SuxoKAQV";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 6AED444B98;
	Thu, 18 Dec 2025 14:46:34 +0000 (UTC)
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1766069194;
 b=lIyDPHm+oPLhnNcA+c2hSDWkHtbgZc2/U+QudJMeZ0Vv/dzon5Q8qGs13y743+GxfiujS
 ryeSHtuO5G0SNsBP9nuuFknj0R9tqo1D+nsEah8PFsHP2+ymaBEMnj3pq3H4nEOnLFGGgz4
 oPZxF554r21+oAWLiOuiHxHN57WUi0NvJuf25e1AQCxGibpeGNRAPxp41bVs8ejVvGWWCaV
 0BV6Hu9OI6ymencfeyA0ykf3lqL1TEjP4RQpGcPKccAZQJcT60Ayc9pi8WG6IuoRWKmPX/I
 Ysy0qGx4cu+lUiIDO3BcFv9N9DfmiYWyaAElG/G/2khsedruprCn/lRvVn6A==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1766069194; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=X/z5tc2V39dPCkLdQS/dPXCXDwjZbVrqtdIe2B6COuk=;
 b=0DNTdKjkD1Xc8vU2e87pMJTewwQ+YhW1wyu8U4q5ZWXCx+LRzqEq4cGaJJJYCjoBsGRLu
 IcxGHr3ttoNzdUcbZINbCHRtSe7Eu3lTmw7mb5ijeA3Byh8+I0WOePGQKTuwFyF1wefHbnN
 0y3fQ3H8yYy9vAywtR1LE3qVEPHR2QT5J+0z0XEJ8aOgvcC36dpIUUSjsFJcG9AIL62Rt/X
 u4lE39koQt91CyywEd3C5skwd2XYijwPM1jGxEkQI4dokO5zT35WBUNoaEKNBLNbKdHKFBa
 u+J1VwYbD2uRniA1E2lCCa3DKUxY6aTN/C8hH0nOg6mZAcazArsT5LhHsogA==
ARC-Authentication-Results: i=2; mail.freedesktop.org;
 dkim=pass header.d=Nvidia.com;
  arc=pass;
  dmarc=pass (Used From Domain Record) header.from=nvidia.com
 policy.dmarc=reject
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=Nvidia.com;
 arc=pass;
 dmarc=pass (Used From Domain Record) header.from=nvidia.com policy.dmarc=reject
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id 457A14562A
	for <nouveau@lists.freedesktop.org>; Thu, 18 Dec 2025 01:32:14 +0000 (UTC)
Received: from DM5PR21CU001.outbound.protection.outlook.com
 (mail-centralusazon11011040.outbound.protection.outlook.com [52.101.62.40])
	by gabe.freedesktop.org (Postfix) with ESMTPS id C096910E414
	for <nouveau@lists.freedesktop.org>; Thu, 18 Dec 2025 01:39:43 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wXGf6czCEkpP6Gc2tJ9o0BvBYXpHRDzc/gqytxd8ctKXz8bnCERr/bWZC0zo62yIscT+DQb5TBHxmdqPQW7opWPM7vONoO21x/QSH+KEYOkN+GxvkJC5rxUPNzlkan99oSfueQDwGuDtEQkY23Sy9BVT6DOMX/NNcdw0hLxcUQpB2dUDw3pIw1Dh0IeNgTFuGp7xvB2XHQCa3E4J8McgWSZWypSPqB9pXuJ7hXVHF44wDb8fv2YRwFVR9PXiXwhz/lf4xikySpNFxWj98DIKutU6vZxh2xJE7P+CyNtAqVsUB5XvoHr0Br17+bNtRc9abFkXqUp2XLFryVd622JlZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=X/z5tc2V39dPCkLdQS/dPXCXDwjZbVrqtdIe2B6COuk=;
 b=CZwJHDnmb8f2Qc17i8bQ7PduUPuYYIZ0cRYWHTUIq0i0zmtjS+E4Fn82J0y5wAyc2dUIH59HUS6mp5+1s9sOq83GlC7MR3qzjwie3uKDRbIDJVE7YhpcUaTsIZPhT7KgI/QftKlssDs0kChQ5V/QXZ2vdpcmRtHKrl2+q85rOx2hvqZIfq3NWYXUpYOFSrC5IuHfExnKS0+QH+qSKCWVcROB8URInLcwO7KsMoLiodwbc6VIrUOYd/Be+Ny5Ax6pEuTK9GN2oDAkOW/M8EYjJt0EjzlUpylcYZJIZ4luSkTVxB5ufSur/P/fk13Jgo8eA58CgYXFEoNO4DyQ9HOsQw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=garyguo.net smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=X/z5tc2V39dPCkLdQS/dPXCXDwjZbVrqtdIe2B6COuk=;
 b=SuxoKAQVIm70jFcihJwcSOGqD2CLQVIxblRw6VkD7PLK1CI5WbKbenHHJzr8ud68zoJ+d4mfuL/7ml8TBB9mhCiUMf3ekZ3XX29ZTdL74umxCmVLz54PmywkE6UeHLhVNSOUjGlTTygJD6NXxWBhgsFbopcV1LT74ACckfuiJkzSwV3Q8ilTP18ncR1B6roSj+TgZXWEUMR7X2j14FX6ChRqYL3CmNaEcrvX0eDqnoh1Gyfl2cnbpbxHmjVgO3IdLfUpjHn0JZawF0Lpkra+npusoErzI++FBw6F3bqaRcXeklNgnLPHLNyJaBDIWkC9E/ChsUAgZMh05s0L/K2yeQ==
Received: from CH3P221CA0021.NAMP221.PROD.OUTLOOK.COM (2603:10b6:610:1e7::10)
 by CH3PR12MB8934.namprd12.prod.outlook.com (2603:10b6:610:17a::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.6; Thu, 18 Dec
 2025 01:39:40 +0000
Received: from CH2PEPF00000143.namprd02.prod.outlook.com
 (2603:10b6:610:1e7:cafe::c9) by CH3P221CA0021.outlook.office365.com
 (2603:10b6:610:1e7::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9434.7 via Frontend Transport; Thu,
 18 Dec 2025 01:39:41 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 CH2PEPF00000143.mail.protection.outlook.com (10.167.244.100) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9434.6 via Frontend Transport; Thu, 18 Dec 2025 01:39:40 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 17 Dec
 2025 17:39:22 -0800
Received: from ttabi.nvidia.com (10.126.231.35) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 17 Dec
 2025 17:39:20 -0800
From: Timur Tabi <ttabi@nvidia.com>
To: Gary Guo <gary@garyguo.net>, Danilo Krummrich <dakr@kernel.org>,
	<rust-for-linux@vger.kernel.org>, John Hubbard <jhubbard@nvidia.com>, "Joel
 Fernandes" <joelagnelf@nvidia.com>, Alexandre Courbot <acourbot@nvidia.com>,
	Lyude Paul <lyude@redhat.com>, <nouveau@lists.freedesktop.org>
Subject: [PATCH v3 3/9] rust: debugfs: add Dir::empty() for no-op directory
 handle
Date: Wed, 17 Dec 2025 19:39:04 -0600
Message-ID: <20251218013910.459045-4-ttabi@nvidia.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251218013910.459045-1-ttabi@nvidia.com>
References: <20251218013910.459045-1-ttabi@nvidia.com>
MIME-Version: 1.0
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.126.231.35]
X-ClientProxiedBy: rnnvmail202.nvidia.com (10.129.68.7) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PEPF00000143:EE_|CH3PR12MB8934:EE_
X-MS-Office365-Filtering-Correlation-Id: 5ea2a0f1-c0a1-444f-b455-08de3dd64fd9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|36860700013|82310400026|376014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?ANGJSkQsRxkCixF3VZw4ZgOpwKX+hM2WmaQzccMOnDgba1qpz8KGRRa74LNR?=
 =?us-ascii?Q?jImalL8A33McP9ZPy7S2fahXS5TGYacaoKbEz+suVmwZ8JDvGdQqs9I6qWHt?=
 =?us-ascii?Q?/qnJwcAtoGxzox67oqZK3Co6emPITH9enMtyh7zXaZfJO5+65+CgUBGk2jGO?=
 =?us-ascii?Q?Lrj2pFCHz83Y1ixomfjBnTYUMtY1BSOpRqq1ykpg3ZJhE7aPmuTYPp7v3ojf?=
 =?us-ascii?Q?Q2Ly8AUy5l2bJcYBfNqoHxASD4gOsDCqcjVkx+7/9Xh0fhJ2IKRl4hcSoo+4?=
 =?us-ascii?Q?xznLObSuAECwNm2mDQPa1thRGSp9QHo1yM1ROT0vuslclN2n/bjcr4UIXVEU?=
 =?us-ascii?Q?xx3/BZtX1Ab4yhehWMN/UCdTlPKrHJTY1UKqUIilduW7NzccCDFR3CdURCKP?=
 =?us-ascii?Q?7kMEWweyFZk0SWky5VSDoKGseDJjlBlSuIlzNtMWApyiuhzGETWUB31JzH1r?=
 =?us-ascii?Q?kUGW56xgLBQh3Dsajgq0MfgGiHM3lR9Zy0EMB7m0pz22V/MIxGGIGYghMbWh?=
 =?us-ascii?Q?/XByXDDVDBFasRRSxQOZBRo2Y5kk47spvL0ZCl8IhpvzCSUvIsmeizGdCpTc?=
 =?us-ascii?Q?yL/zuOvdFPElN21QOP2BafieTWpP079BApMTGtMT+sYdnIzE+uvMi/YtZz4b?=
 =?us-ascii?Q?7MJRfoChzsEYLNVffRKPrk404AISNiJQbGtdnEAQdL6h3yyEYDTz5/E6f0ts?=
 =?us-ascii?Q?RRN9iqM6F8JOLCkMbZJllCnR7xamGcAVIRv/a6dySPJIg5iT2MIyxPSjQxIi?=
 =?us-ascii?Q?Fkhea6vU/eD3CI7ZpyL9IUbBG82UpDP4On3L9AcGt8W56XbwnPFcaBpmmQVB?=
 =?us-ascii?Q?UjFYpdNhT7nmzZqxhlCYjDHWiQ28ZTwXkJnN7l34vdnT4qcd0sPXSHliEsS6?=
 =?us-ascii?Q?y3nbfbSM5JyydC7u+FzTksFadr61q054bGnfb7fzR7qbUex5cKTkWUE4sA9F?=
 =?us-ascii?Q?eBh6AN3BEjZkcnrKBNrtSDntFM7Am9++vSzeJcieG17ksf9L7EyoZ0IDzway?=
 =?us-ascii?Q?G6COzxrywO3aP9bZLqq/gTZfeJf9KgEGgu1w0TiY3UBpW8PFJUDtV5yTzAnj?=
 =?us-ascii?Q?0poeQLSnp/PM2as8XBdjG8cQMroWAT4YAlgwc2C3W2hD1XBSxNvGNPu5SxMI?=
 =?us-ascii?Q?VQVdqoVe/k3YnMHd6Cw+T1AlI5P4x3w6dy/Wyh8wL8sSAwRE25FHDklXL8m0?=
 =?us-ascii?Q?ob50zjWjBT3AzsDzpzjfjK691zniMvhgNKi/Gj9lfAmAibA+0Lg91QPkqaiM?=
 =?us-ascii?Q?WDO92NAn6YWKSBIQmbtx4koc0JblQNFHyk1nXpyrHfejaZsFtLBgFVxeUfVM?=
 =?us-ascii?Q?k8D2fi9tGdhQtJEuagpTwresXmXRwF4LQgT6k3AvUNoNnPkhJdrAbRwAQY8F?=
 =?us-ascii?Q?W+sqR69tfC77tR9wtDCuKyeUWxMd9g6KcsTBoDSdsrzap8L8bDkCIWcBc5Jb?=
 =?us-ascii?Q?B/E62B0AVWl4Bfyyc+OOXzv5Zb677BDTRowfdegXe72cGLIBb6C3DWMfZYKo?=
 =?us-ascii?Q?SNF5YLIS9StGmvm0kEaUnF1IxqkNBzyFa8g9HYc8vpqvTKSTBPiCw6L+kSrJ?=
 =?us-ascii?Q?ux+bZRlmqK1rzXGlqWg=3D?=
X-Forefront-Antispam-Report: 
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(82310400026)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Dec 2025 01:39:40.3568
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 5ea2a0f1-c0a1-444f-b455-08de3dd64fd9
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CH2PEPF00000143.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8934
X-MailFrom: ttabi@nvidia.com
X-Mailman-Rule-Hits: implicit-dest
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation; nonmember-moderation; administrivia;
 max-recipients; max-size; news-moderation; no-subject; digests;
 suspicious-header
Message-ID-Hash: XTBDX7NK4ZHOSPOHY2RW67V4KJ5Q6XNR
X-Message-ID-Hash: XTBDX7NK4ZHOSPOHY2RW67V4KJ5Q6XNR
X-Mailman-Approved-At: Thu, 18 Dec 2025 14:46:30 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/XTBDX7NK4ZHOSPOHY2RW67V4KJ5Q6XNR/>
Archived-At: 
 <https://lore.freedesktop.org/20251218013910.459045-4-ttabi@nvidia.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

Add a Dir::empty() constructor that returns a Dir representing no
directory. Operations on this directory (creating files, subdirectories)
become no-ops, but the data is still stored.

This is useful as a fallback when a directory lookup fails but you still
need a Dir value to pass to APIs like Dir::scope(). For example:

    let dir = Dir::lookup(c_str!("parent"), None)
        .unwrap_or_else(Dir::empty);

When CONFIG_DEBUG_FS is enabled, returns Dir(None). When disabled,
returns the empty tuple struct Dir().

Signed-off-by: Timur Tabi <ttabi@nvidia.com>
---
 rust/kernel/debugfs.rs | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/rust/kernel/debugfs.rs b/rust/kernel/debugfs.rs
index eee799f64f79..b0cfe22982d6 100644
--- a/rust/kernel/debugfs.rs
+++ b/rust/kernel/debugfs.rs
@@ -110,6 +110,30 @@ pub fn new(name: &CStr) -> Self {
         Dir::create(name, None)
     }
 
+    /// Creates an empty [`Dir`] that represents no directory.
+    ///
+    /// Operations on this directory (such as creating files or subdirectories) will be no-ops.
+    /// This is useful as a fallback when a directory lookup fails but you still need a [`Dir`]
+    /// value.
+    ///
+    /// # Examples
+    ///
+    /// ```
+    /// # use kernel::c_str;
+    /// # use kernel::debugfs::Dir;
+    /// let dir = Dir::lookup(c_str!("maybe_exists"), None)
+    ///     .unwrap_or_else(Dir::empty);
+    /// // If lookup failed, file creation becomes a no-op
+    /// ```
+    pub fn empty() -> Self {
+        #[cfg(CONFIG_DEBUG_FS)]
+        {
+            Self(None)
+        }
+        #[cfg(not(CONFIG_DEBUG_FS))]
+        Self()
+    }
+
     /// Looks up an existing directory in DebugFS.
     ///
     /// If `parent` is [`None`], the lookup is performed from the root of the debugfs filesystem.
-- 
2.52.0

