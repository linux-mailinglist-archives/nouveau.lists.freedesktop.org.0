Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B9C25CCC586
	for <lists+nouveau@lfdr.de>; Thu, 18 Dec 2025 15:54:10 +0100 (CET)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 69CBC10EA35;
	Thu, 18 Dec 2025 14:54:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="sy+jFaCc";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 6BA4944B90;
	Thu, 18 Dec 2025 14:46:37 +0000 (UTC)
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1766069197;
 b=j16i2qAXRTr3sCSX+SnZPJMcE9ZtwGHRWHGO48jUolf0/OL+82dfWb48aBjbqaCk15hka
 KS4J+3kPhKSaPyjKYlfuaP1ymuxUjW0bnpi0D5vwFeKvUkSGgcdrT79aWr8+UCBJZPRa8wr
 VV5oDW1Mtuv4LxTMzcEMgRklAfm34NDGg5t5Gx1F5R+Ku/orhkEZM9uQ+APX3tA7B2tUipK
 1wUdHZqB1kHGTRuDHslhu8sPWVLmWjpyBLhaR374dKHsXbdempRqkqhMhoMd3JU42E1JdV2
 TUACGT0znXFpxrUcZMHuK3CyFva1RT+gQeJdF/Dvaq+Wy6NPblGBD1+KoFSg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1766069197; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=HLV01b18XKFs7fcmA97WvoLrjEG5gG3pxBjJtfgS4jo=;
 b=cMw8lcdN7Mbw9GWAWsinkA3JxLEeBgy0BKDpgypHhSLv/O/tGjlUPRVtUiHM8e1wZdXQt
 jKidZWuZ/130A2zB/Bg64G9g3EzOvnFukXg5SiHk0tAqMyvkYLkDib8rZXW8qHgmKthlnpY
 tHXSNOXK2XuZRahd2JLo2Ch3nhsVdY5YYjdH3nR1VNvLONOeSkf2wYodCZqXVOtyQ0OmF1r
 43kIYGWK11arP1ZVQhivS86urX0Y3GHGd4/ZWauLJ3cq5O20O/wHyeWhoES7n1ocEFpdg66
 s1Q1rhrd4kMHBtcRRKs3K2XqkOs4rbAtUa+BEHn3vTX2bvtMnzU8RzNJKnbw==
ARC-Authentication-Results: i=2; mail.freedesktop.org;
 dkim=pass header.d=Nvidia.com;
  arc=pass;
  dmarc=pass (Used From Domain Record) header.from=nvidia.com
 policy.dmarc=reject
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=Nvidia.com;
 arc=pass;
 dmarc=pass (Used From Domain Record) header.from=nvidia.com policy.dmarc=reject
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id 7E23B45643
	for <nouveau@lists.freedesktop.org>; Thu, 18 Dec 2025 01:32:17 +0000 (UTC)
Received: from CY3PR05CU001.outbound.protection.outlook.com
 (mail-westcentralusazon11013030.outbound.protection.outlook.com
 [40.93.201.30])
	by gabe.freedesktop.org (Postfix) with ESMTPS id F13AE10E414
	for <nouveau@lists.freedesktop.org>; Thu, 18 Dec 2025 01:39:46 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=D7ExDyq2c+tzzFCKuc1au009jPuxacF4PlSzhmBluLoZa/6g32QkQV+m4mnKd3k/h57s6sFHiiVGkZmU32RPgV/1f4vK/X07dx+1wjyPXlETma0ojAjRR+LW5iDgshQwNrnaDNEaFAb9KDD30DXVLPpC99t2d6tugoR2IAy1OftqDuMHoJocpqrWRs6Nl/4lT8Rn1qQRAhV3pyVyyXNuS3raNB2xhskmp2NzwpZ/8R53NmSqry9Ns0FmOf2PT0QzBSrO7YXCHbuKB2ifDI7mo6jhWjhAfFkl/V63GQDqSh17tCLJQQ99ddJLbv24iEB5x1Q6MvGb6Y2bmsDOpPO04A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HLV01b18XKFs7fcmA97WvoLrjEG5gG3pxBjJtfgS4jo=;
 b=t1lA8F4iphZv3FOH1lhfKmP7KnirfArC1xA3KyiFNXtlkFumCwtFpKYeFiqbFrDzIOxwF0NHYhNt+kDZiWIaVjSJda9l4MNFjvMnGTswYKnEVbiDsVPUKa/oCmxqrzKtOSgKSK9X76w1sqwLMu7TT5zwOpkJ+aHO0izpah8taKjQKkGd5zQlzhFhcHaPOx2Lop2+NwDVwj6DTUvSP2k3d+Ygx/CI9jS4BurKnDpJPActs8r4lRl527FTe2wS6f5zzQBuZquIFPdxdaQFg1TpDiLt3Dc3BQR1+gk0B2WOJh6ASBLfGujy6bzSGR1+o8QVNq+39UQC4WSYVBbofF60cQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=garyguo.net smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HLV01b18XKFs7fcmA97WvoLrjEG5gG3pxBjJtfgS4jo=;
 b=sy+jFaCcN6AmKj3Ilcxq+OWjbl5B2ChfuFc1+5F5e/7N1KyGrP6oT13ZVThef4EPtRQdTu1Vw5RMhGSTh8/a8UA7mOp6omBq+n+yNtaTsYkCjr85XQDLL/J+dHzbrHddoJIX0+Zlfkbo3CEWaSb4kD75eZdlreTHjLqmhe287ZW18ci6YziqcMRBiBJevncZ0TpolylPKGDFs0h+T6GJ5J4Z2tErJOEdvJD7e5NMXCJL19VjvARkpP0pwPeAQclq4PY0jxXMOF4wjikDabpnxj65Y33kTG6PnZj0ZKUJk7gd0VJyiuqea98AIKWn9D7P4NxWUL8bAgmWXcr7fqLKJA==
Received: from BN9PR03CA0624.namprd03.prod.outlook.com (2603:10b6:408:106::29)
 by IA0PR12MB8086.namprd12.prod.outlook.com (2603:10b6:208:403::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.6; Thu, 18 Dec
 2025 01:39:43 +0000
Received: from BN1PEPF00006003.namprd05.prod.outlook.com
 (2603:10b6:408:106:cafe::2f) by BN9PR03CA0624.outlook.office365.com
 (2603:10b6:408:106::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9434.7 via Frontend Transport; Thu,
 18 Dec 2025 01:39:35 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 BN1PEPF00006003.mail.protection.outlook.com (10.167.243.235) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9434.6 via Frontend Transport; Thu, 18 Dec 2025 01:39:42 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 17 Dec
 2025 17:39:26 -0800
Received: from ttabi.nvidia.com (10.126.231.35) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 17 Dec
 2025 17:39:24 -0800
From: Timur Tabi <ttabi@nvidia.com>
To: Gary Guo <gary@garyguo.net>, Danilo Krummrich <dakr@kernel.org>,
	<rust-for-linux@vger.kernel.org>, John Hubbard <jhubbard@nvidia.com>, "Joel
 Fernandes" <joelagnelf@nvidia.com>, Alexandre Courbot <acourbot@nvidia.com>,
	Lyude Paul <lyude@redhat.com>, <nouveau@lists.freedesktop.org>
Subject: [PATCH v3 7/9] gpu: nova-core: implement BinaryWriter for LogBuffer
Date: Wed, 17 Dec 2025 19:39:08 -0600
Message-ID: <20251218013910.459045-8-ttabi@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: BN1PEPF00006003:EE_|IA0PR12MB8086:EE_
X-MS-Office365-Filtering-Correlation-Id: be68119a-e7d6-4752-6316-08de3dd65166
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700013|1800799024|82310400026|376014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?ana3vNQQ78p1Ztr6Wsg974MmUb89U0ZqGIgUOOc+DlaQNd1PPa42erLK0tOO?=
 =?us-ascii?Q?Z0tfmQ/cnJZSE25vLLA7opAICH431+BKzg5VlWCEKNwiEvbi0xYlPK/lzcCM?=
 =?us-ascii?Q?cBS3Z+R+pvLshXY20ms2UCsFQ6Xb1Zdu8YthFY1Tx4VSnk69xrsNnO4u6pZ2?=
 =?us-ascii?Q?gDO6CkmIvxSndaAd76y/WqPRI6Sw788Tr5OdhfClBMQ2b4zpF0FdcyfkIR8J?=
 =?us-ascii?Q?IqfWwy1bcYAtx4fMF8+TiwkXMXLO+n26qtJ20Yt6HN2nJUFhPfrNlR+4bQV5?=
 =?us-ascii?Q?D2p4PqxBW5/4fdF9B9RI7WEucttUO5OAu6kr1+SLLW3kY2oFxQtZVRx6tYsn?=
 =?us-ascii?Q?krzBGbRVW6p7pfL1TxYmNk3XjjdJ/YpXy/a5ptPgtcOwz7FogXdI4MbufzeC?=
 =?us-ascii?Q?A+gTOCNhpNR2eF5zjpohj408ifArla9oZ6NSGwpu0pKDic0ETbDPlj4kawQj?=
 =?us-ascii?Q?Xw381FDOlMOktFLOSq4falU+rPpJpo07+lnS5/vd0fv3qfnhAkOXhTC2Isn6?=
 =?us-ascii?Q?yOsYGXowbUjdNVqN7eAVXB45PGENY8os1LPrkYkCpVs0vzNcRh7cnwJt7I5T?=
 =?us-ascii?Q?edS7++bPv+voidItjbGHhIJb2kBLfiwq57uXYgCJSYe/mhSGCSd3zGa+nl75?=
 =?us-ascii?Q?pKOviOfdS2JYcd2c2hDY3I4Vip+UkiVb+7IDkg+Rhkg9AE3psAuUeHEj1+Nt?=
 =?us-ascii?Q?Gltw8izGBd2ufZDeo6qVNI736NWKAJ+9p+DDMUtfY1wc1PYNqW43eOBnerLF?=
 =?us-ascii?Q?y6rdTkeV83jL7nc7CipsxiMkDEpeQY22VKibJ8IotCYeyaM6Z9EnlgNYKhbh?=
 =?us-ascii?Q?HqFjQYhCXCvxh9PET2GgiUtP6kMMWL9C0IWm2qn2HYb0IZ7FNxn6DUNkxBIs?=
 =?us-ascii?Q?dfRENjvNj6j9lr9JD/3sLkYzWMdUZGw8uIggVXcm/oIc96exsIXqM4tP01G3?=
 =?us-ascii?Q?bjTETqj0thokgP9J4yxqzPGGYOMSgt/fzFdTQRW7/3rWrY1miiMJ9o6ni9ty?=
 =?us-ascii?Q?sPxX3IMQbU89w1xhd9gJqDYdE1+tUXwvFT193IVGPv41cYtacfm+cJLlsya5?=
 =?us-ascii?Q?1YKjrxJZCIsv1DRwxyMlvohj9ob4uXqvESjAKZDujcydBGagmu82TpmLQB/I?=
 =?us-ascii?Q?cYA++vE7zIYWblaDOD/mj6TPYc/8CIWvKSidqkYeVAENhIpMtslZcTUcj2Wb?=
 =?us-ascii?Q?ES4rvOMAZQbqevv319SAT7MRE8HjccdOUQyConoQGwd5ARgqiXiCluo8olf0?=
 =?us-ascii?Q?9qA8Hs7DqMy1p1aKAPiCmUMOYBCCxlsadgmcv18ubq3fRZIRyBgpaxABsGrU?=
 =?us-ascii?Q?MqKa/1DsxKybc2o6LHtqijy5xE+Bd85BTmBhYEK7cgdXPJzU/OADQ8p/HKnp?=
 =?us-ascii?Q?mwy+csw8VBeaPvczAWUJDLgltPmo8qhUhsGp99ZjV9b5VJLEGEi1UY4gi10h?=
 =?us-ascii?Q?T3E3INmCtUz++hP3oXEKHcAuzpbd81sX82Qg6QmomwrUZng9pRyhTKkOqWYC?=
 =?us-ascii?Q?N6T/szQJLB0XRIIajocCEuYvl7F5nvDW1v6fMDmoBwZSXxQ6OztaWd/eyA/f?=
 =?us-ascii?Q?/qU3ILDXovg+1hzF4z4=3D?=
X-Forefront-Antispam-Report: 
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(82310400026)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Dec 2025 01:39:42.9268
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 be68119a-e7d6-4752-6316-08de3dd65166
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BN1PEPF00006003.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB8086
X-MailFrom: ttabi@nvidia.com
X-Mailman-Rule-Hits: implicit-dest
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation; nonmember-moderation; administrivia;
 max-recipients; max-size; news-moderation; no-subject; digests;
 suspicious-header
Message-ID-Hash: TNBQW6P6PTBKAUQDLBQXXUKGT4YPQE5L
X-Message-ID-Hash: TNBQW6P6PTBKAUQDLBQXXUKGT4YPQE5L
X-Mailman-Approved-At: Thu, 18 Dec 2025 14:46:30 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/TNBQW6P6PTBKAUQDLBQXXUKGT4YPQE5L/>
Archived-At: 
 <https://lore.freedesktop.org/20251218013910.459045-8-ttabi@nvidia.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

From: Alexandre Courbot <acourbot@nvidia.com>

`LogBuffer` is the entity we ultimately want to dump through debugfs.
Provide a simple implementation of `BinaryWriter` for it, albeit it
might not cut the safety requirements.

Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
Signed-off-by: Timur Tabi <ttabi@nvidia.com>
---
 drivers/gpu/nova-core/gsp.rs | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/drivers/gpu/nova-core/gsp.rs b/drivers/gpu/nova-core/gsp.rs
index fb6f74797178..860674dac31e 100644
--- a/drivers/gpu/nova-core/gsp.rs
+++ b/drivers/gpu/nova-core/gsp.rs
@@ -3,6 +3,7 @@
 mod boot;
 
 use kernel::{
+    debugfs,
     device,
     dma::{
         CoherentAllocation,
@@ -117,6 +118,29 @@ pub(crate) struct Gsp {
     rmargs: CoherentAllocation<GspArgumentsCached>,
 }
 
+impl debugfs::BinaryWriter for LogBuffer {
+    fn write_to_slice(
+        &self,
+        writer: &mut kernel::uaccess::UserSliceWriter,
+        offset: &mut kernel::fs::file::Offset,
+    ) -> Result<usize> {
+        // SAFETY: This is a debug log buffer. GSP may write concurrently, so the
+        // snapshot may contain partially-written entries. This is acceptable for
+        // debugging purposes - users should be aware logs may be slightly garbled
+        // if read while GSP is actively logging.
+        let slice = unsafe { self.0.as_slice(0, self.0.count()) }?;
+
+        writer.write_slice_file(slice, offset)
+    }
+}
+
+// SAFETY: `LogBuffer` only provides shared access to the underlying `CoherentAllocation`.
+// GSP may write to the buffer concurrently regardless of CPU access, so concurrent reads
+// from multiple CPU threads do not introduce any additional races beyond what already
+// exists with the device. Reads may observe partially-written log entries, which is
+// acceptable for debug logging purposes.
+unsafe impl Sync for LogBuffer {}
+
 impl Gsp {
     // Creates an in-place initializer for a `Gsp` manager for `pdev`.
     pub(crate) fn new(pdev: &pci::Device<device::Bound>) -> Result<impl PinInit<Self, Error>> {
-- 
2.52.0

