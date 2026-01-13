Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 88DBED1EEF7
	for <lists+nouveau@lfdr.de>; Wed, 14 Jan 2026 13:59:55 +0100 (CET)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 52A6B10E618;
	Wed, 14 Jan 2026 12:59:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="WTxqq41m";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 59FB644CC4;
	Wed, 14 Jan 2026 12:51:21 +0000 (UTC)
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1768395081;
 b=rnK3tXPS3fvNErWIdW6bm1uE6zKDtr94l8tQxmLRLQ44n92KH1TJkdNYYFl7GlNwuF4dV
 LLRo3d1TEm7oHUM8LULkVyMpxZOWyh5UewCAUUNGndVbtRh5+Zs5SDuHzkBj5ZlfyFaK0Zn
 fU2RZkf6t5XiJ91HYm+AvgwDTgeGYEBBc9XmFJoLz046zyZZ1BCdjyzZms8dl4/TUv3c7nq
 PeWRiryi3wF0Jb7P8O/Dqupqr21UmVv1vbWb6qrWrvjkP9yVK3ZJv1v3bZE10pYFfP96Ut9
 8MSe9V7XIr9rxiRhD2ccVm0SLdODFjtpQ7AbguGnaHp0PmH+VQ00g6qQ+OjQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1768395081; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=8QTTzw37ZfhN0gYaqOci0IWP4owV30QPwMzkOf9Kibg=;
 b=jTM4Twl8qVafiNO/aFnT/vdC+CdkiC6WBz4/BjhTje8jBaOeuMWZm22cVt+z79DTUSQ06
 GA9sNdEHvT8La/E+5cUJ4VXjw/xo7NtraQUNIs7K1hmTH8dk/hexVw94AX2n4MK6Ha1aMBU
 LsbOxO7O2HSrHBkmnp4rzcXejAcbmMh0UA6eBh71Id3DB8rIXECfvOdKCp0watAQLPRuDdY
 WTzF6rGiecdXW639LWc7HOCJtNqgGiYhOXWU9rD7p8w7XoGsaJ8mbgoZc9ZY2WYTYb9KgxW
 ebfvOXzTYh/+rVIuT/ntT0ubTsh0qYy3MJ9/Csb63U5wE/YgA8/azZW3e4gg==
ARC-Authentication-Results: i=2; mail.freedesktop.org;
 dkim=pass header.d=Nvidia.com;
  arc=pass;
  dmarc=pass (Used From Domain Record) header.from=nvidia.com
 policy.dmarc=reject
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=Nvidia.com;
 arc=pass;
 dmarc=pass (Used From Domain Record) header.from=nvidia.com policy.dmarc=reject
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id 71DCB44C87
	for <nouveau@lists.freedesktop.org>; Tue, 13 Jan 2026 22:46:12 +0000 (UTC)
Received: from BYAPR05CU005.outbound.protection.outlook.com
 (mail-westusazon11010068.outbound.protection.outlook.com [52.101.85.68])
	by gabe.freedesktop.org (Postfix) with ESMTPS id EDAC510E29A
	for <nouveau@lists.freedesktop.org>; Tue, 13 Jan 2026 22:54:41 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=U4bg0vjR6jti/Jltwl/WmFakRrf7lq7nC/LuAggZMKq2oI5c9KAdkulMA2dpmItH1F7YPAUR1jUkE6h6Wep6eE0klbV1PShXog73oNgUPEG8i9Y4As6V+mv/G7r/KzaLxE7y/2yljZN8b/TmlMaQTa70JDOoedGx+v+B69QiRXeEQouB8jyGaNQhW5ITNJHYF4DTVJ+Wfrs+cwWEC4sWhW5jS3J9rx2PIcHMAmCkU5s2HVCB+TgOGXNzcUkIDo7Wvrk0mUdj8jdrMS0BPnK/Rm6u3BRC90lxJrq9knKrI4VVu+GUWAvewISGLXNZcXJo28sVDc42wJD+MYPtQu0Yng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8QTTzw37ZfhN0gYaqOci0IWP4owV30QPwMzkOf9Kibg=;
 b=yR3OQnGSVhMNw2x9dDQUR6X5V8Iz7VFWUP/f46I+dxi6S0wy+IPKKbooM0CJ0NuK3P/JPY00h0swrINQHqezEi30rOWoe9p5grdxIFS2L+XsbmiROh2t0kPmKxaLvG7lbxQdm4Yj7FDrMrXnmJj+SDVKEyZbGe2feorVdQb4rUXwt7+ZaZTc349EYTOVivFiHfGw29s/RZbykB7COKHxcJ0pV8CoPmNKDPf96RHnsdgAKUu5fJyQOd16uUfxhvar/bXsFT5kg1N0Zl/Hfu6g1xTVrjyVCveCY/v4zqE3zULodRRhsA5AZHpVE1p/2iROi3bbqyK6o0m4FWi1Sz79dg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=google.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8QTTzw37ZfhN0gYaqOci0IWP4owV30QPwMzkOf9Kibg=;
 b=WTxqq41m3yIHRB7VNMXPCa3wOQydF25HdlpldFp0qlBlBy2GlWDO8voHubrJaMCWq2iXeUFIACcd9hgTJ7uGw3ncwxEDqJ5ppvZ19yp3FifB6idHzOYCgSGq0RQsdamM8MMXuFfm4XBv3Mbi70R7uiVmYL11IWlIR/StM3ZxkJfsSnHjmAZ9dvCZavqoHlRFYqH2O6WsCGCqjIdfc6SYNRIGITIY5iu51rFmXsPy/0vcqwVv2AdqqP/gIGxYurIH76jNt47oTdYKy68xSiBh1tXxG4dGh3v/lh4In9PbGbn5sSTLd2PtTkkyni4BtZuh/ukZmcALvZJyJi8gV8ebjg==
Received: from DS7P222CA0018.NAMP222.PROD.OUTLOOK.COM (2603:10b6:8:2e::33) by
 SJ2PR12MB9115.namprd12.prod.outlook.com (2603:10b6:a03:55c::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.5; Tue, 13 Jan
 2026 22:54:33 +0000
Received: from CY4PEPF0000FCC5.namprd03.prod.outlook.com
 (2603:10b6:8:2e:cafe::a1) by DS7P222CA0018.outlook.office365.com
 (2603:10b6:8:2e::33) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9520.5 via Frontend Transport; Tue,
 13 Jan 2026 22:54:33 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 CY4PEPF0000FCC5.mail.protection.outlook.com (10.167.242.107) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9520.1 via Frontend Transport; Tue, 13 Jan 2026 22:54:33 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 13 Jan
 2026 14:54:19 -0800
Received: from ttabi.nvidia.com (10.126.230.35) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 13 Jan
 2026 14:54:18 -0800
From: Timur Tabi <ttabi@nvidia.com>
To: Matthew Maurer <mmaurer@google.com>, Danilo Krummrich <dakr@kernel.org>,
	Gary Guo <gary@garyguo.net>, John Hubbard <jhubbard@nvidia.com>, "Joel
 Fernandes" <joelagnelf@nvidia.com>, Alexandre Courbot <acourbot@nvidia.com>,
	<rust-for-linux@vger.kernel.org>, <nouveau@lists.freedesktop.org>
Subject: [PATCH v4 2/9] gpu: nova-core: implement BinaryWriter for LogBuffer
Date: Tue, 13 Jan 2026 16:54:01 -0600
Message-ID: <20260113225408.671252-3-ttabi@nvidia.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260113225408.671252-1-ttabi@nvidia.com>
References: <20260113225408.671252-1-ttabi@nvidia.com>
MIME-Version: 1.0
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.126.230.35]
X-ClientProxiedBy: rnnvmail202.nvidia.com (10.129.68.7) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000FCC5:EE_|SJ2PR12MB9115:EE_
X-MS-Office365-Filtering-Correlation-Id: f5b5ea53-d101-4ac6-95a1-08de52f6b7d5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|376014|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?ZPmcwDC6he8ZFOf8e8e7sAeVkXJn1F7g67mHIaDmg5aMCCAjuOV/2tvXHX3u?=
 =?us-ascii?Q?G5vgRm88xvdORPr73YkP7HTO2XrJ1+l0axXpcAWxHcSq9TV0rFicFaQ37UzX?=
 =?us-ascii?Q?vLqoiOdw43x0huVM9Qu/jAQzCak6S6DfCc47RBFdV5xhmgXcIxm74fw1oh6k?=
 =?us-ascii?Q?shP8u4x18W5iZOARw3LZGKwKX8U4mtsAEXgA1OGFQ3v4gVlY7urdkXPCPLqQ?=
 =?us-ascii?Q?b1QYvW+EimThS6r+/6IirR7uH3vuY8j408+1T+RrijH0s4g4GVq82H1+w2Rp?=
 =?us-ascii?Q?fa98FU0faxdj7vbefvaeM0iwVZy+RC1k7TTxgUYXZMpBT4FwrbfD9cCwZISl?=
 =?us-ascii?Q?biuyD74Gn5J6hMa1FAo2WqTJO9NnIrtvuNSdRRylY0Nc3/5nAfohkNiCuG0J?=
 =?us-ascii?Q?7hm7+v1vgBiL55rjB19JRG4SvfXI+V4VsNcoH/fsFmZpsQME5++3xmq712OY?=
 =?us-ascii?Q?2+rMa/bBX9ow7Aok3sRKgxQQmzdiyTT/fhJYM+VqJyTkI1arP4aAl681Q/u5?=
 =?us-ascii?Q?5AbLCCbxWXvfRQCZZAnrpNzOg76KnEfW6c/yvaKIVX5Ae0XSG/jTQe/gb/cr?=
 =?us-ascii?Q?856afLXD3p6n47e5U/eKo/cbqiwL1sIP0ZT9pnT3TUHm0GqPIIJXjXWA8TJE?=
 =?us-ascii?Q?A9YxQMpf57vzM4lXuBaXmVKdOLI3s9HUoS0AWco1fCX4dz/pmtdW4G3blhRb?=
 =?us-ascii?Q?o13zllEpBtTB4ciJ3eYEr6nHSnVq0sDOKS6B1TNFzMC1LhJJZ9E84r2tPq39?=
 =?us-ascii?Q?8T2Vsnn9fWv0kmwiBmK5PDIJmC80ZVHDmu2U0Xen0NNb1mHuYPpjNRxvx26g?=
 =?us-ascii?Q?N/AlzYsHgEnh0vi3mXkOx5khocZkSxDQsDKjl+kyDXkHAL4HrVOHcI3EYvl7?=
 =?us-ascii?Q?FKzU8dW20ErfHslfSVW9+SP5I2fgmG933h8KKWlBQ/phImp6Bp3hAzP9pzYa?=
 =?us-ascii?Q?V3+WCspL5pndIkpIFfBHIxGRtKKaFycfsKg4X2LLqoq3x/Hhk4jXnYxGwz4h?=
 =?us-ascii?Q?ky9nZx5Po61/UiBtLVDhCKbOxkUdf09rVImOcitO7npU+azPEwXJfGPjh0Td?=
 =?us-ascii?Q?EYMuXNoVcfoZR4vRapM8akxwtFb6ubx36U61qe43p288izlfF6SqXqThl5KS?=
 =?us-ascii?Q?mNRCXaqxn+NY3QXEjeJ+0Jrs+rE32WUT437UuG7Q3RkJ0IolWHdhjzSlGNh+?=
 =?us-ascii?Q?HeNn/KRJ4tzjijFbN1wYyFCh6LoC7rBhET2FbUQn+J6AmPpqtNjT6dp3rI2K?=
 =?us-ascii?Q?2XZyYK/RyC8Qcjvk8LWUoPTz1lyyPrcfY8pKOyNnJGulIVyYjShHs244T9n/?=
 =?us-ascii?Q?HG3mkTrk5qG1qezFHrKisHIOqY8J6tcROZ5+28q2naB9/F25EdIYXDqA6Vat?=
 =?us-ascii?Q?n4buWMwD7LxJPbLREfcY3+6YNFQTyOIRLRFvxAydZGrtZf9TgDKhJhzgRi9Y?=
 =?us-ascii?Q?tDK+jOOoKk01nr/wip5AMcNr2HHr9BpBewqsZnv/7fb4S5Jo5NiFuTAZxeaw?=
 =?us-ascii?Q?9YZ7I1o7NEtffItkqxeNMvO/Cnl0uzMZ7pE7NrTvofJIV5AqLJs40UjZSEEY?=
 =?us-ascii?Q?Zi1SF1GUFv/3gwRNP/4=3D?=
X-Forefront-Antispam-Report: 
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(82310400026)(376014)(36860700013)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jan 2026 22:54:33.1781
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 f5b5ea53-d101-4ac6-95a1-08de52f6b7d5
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CY4PEPF0000FCC5.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB9115
X-MailFrom: ttabi@nvidia.com
X-Mailman-Rule-Hits: implicit-dest
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation; nonmember-moderation; administrivia;
 max-recipients; max-size; news-moderation; no-subject; digests;
 suspicious-header
Message-ID-Hash: 4NXLKXPK7KK76USNNVSCLVP5ONHMSSON
X-Message-ID-Hash: 4NXLKXPK7KK76USNNVSCLVP5ONHMSSON
X-Mailman-Approved-At: Wed, 14 Jan 2026 12:51:17 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/4NXLKXPK7KK76USNNVSCLVP5ONHMSSON/>
Archived-At: 
 <https://lore.freedesktop.org/20260113225408.671252-3-ttabi@nvidia.com/>
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
index 766fd9905358..9b73c96fbd3a 100644
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
     pub(crate) fn new(pdev: &pci::Device<device::Bound>) -> impl PinInit<Self, Error> + '_ {
-- 
2.52.0

