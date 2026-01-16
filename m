Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 44CA3D388EA
	for <lists+nouveau@lfdr.de>; Fri, 16 Jan 2026 22:50:44 +0100 (CET)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 7F55F10E297;
	Fri, 16 Jan 2026 21:50:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="THBkoueI";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 43E1A44C96;
	Fri, 16 Jan 2026 21:42:04 +0000 (UTC)
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1768599724;
 b=HReI5BI1ttS+7N+hdxACTXCgJVyZhnqEUkj7244SZi+QprshJ+nGAbkqeAI5rZ72I8bHf
 sMUcXQRBBmyj3h/sEf2ALIDNMJ6m+hrh3A5Tj1N3qjfM6ILd3HTPd1wdLtKNGtpfSBUe9uO
 TCbHRW0ggt/cKshTKkXCIWXaHoGZhvxas6QR2T6kc0PHOIj69Bxcxi7CJd0q7IqmbRMpZS8
 DpKEjoTiRBCuOLZdqSnkyWaKSJ+RcgMozlzICWeRf6BzYaYmPKj5LXLx9PWo95VVRb4SzgP
 YjNf82O6132i099vEwJHr5i2M7sQqtfvvmEDG97yTXg8Sz0sEa5k55WnvCdg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1768599724; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=rHxwt6Oug+9Hy/gO6ZJ8JiCXuN9YtBz5BAcNfR4Jllg=;
 b=DKeciXECH7zTcsumfcQ8fJrmE4ZzdWjnpBzFsZir3uG11asfeHKXttowAkDpQHUk4VDri
 EJ1xlwG7pbgW5NCdWQtpklGabQeJ1LLjMIiZFMEM+E1jAmeIGCAUkahQNDMosblw7wjxIib
 xylRGl/okflJ/wjkQc5IXbaTy5uvXdkZcfzaMGaaDtX7X4gfCZJQ40XNMRxhYYzTA/Ayn/j
 yLjXQVCmIGj6dCzaUnv6ZXJwPDDxtdBHaAUC0YQmgyFDp9Haw+BgNWgHPpjQokRy+ROIPbB
 3slLePjyVbSnbHdnx5ypwivg/0AYJaVP1nyvJN5X8ZqtadIJxiYNiS0HkPyg==
ARC-Authentication-Results: i=2; mail.freedesktop.org;
 dkim=pass header.d=Nvidia.com;
  arc=pass;
  dmarc=pass (Used From Domain Record) header.from=nvidia.com
 policy.dmarc=reject
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=Nvidia.com;
 arc=pass;
 dmarc=pass (Used From Domain Record) header.from=nvidia.com policy.dmarc=reject
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id 1DF5640744
	for <nouveau@lists.freedesktop.org>; Fri, 16 Jan 2026 21:42:02 +0000 (UTC)
Received: from CH1PR05CU001.outbound.protection.outlook.com
 (mail-northcentralusazon11010035.outbound.protection.outlook.com
 [52.101.193.35])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 2392710E267
	for <nouveau@lists.freedesktop.org>; Fri, 16 Jan 2026 21:50:38 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OTvOdojRa8WB/WrW1Ufr3bAlW4aC1e9PARacby0tdeDRKoeDTaAsoJJGfXJaknz2mNTJCifII/X1X5d4PkDX1Es4wPWJUOAPclmQQS1IAEfWAvHw7S27AOJ4z+3o+5w5P32CNPbuMNYk4BwXg9wUKEf45gyNQVdKjJ2ReeMAZ6unMeaNRmJwTTirwBKEo7NvLesYc6qGk9EsMTD1QlldZdq3H3BZ5Bwa7FgjvQEF7PK81TOqQpVSDKaXC/Iavj5+ud0VecaRcvjqd26Fs/Jt3r75xPp8N+ksGFyWpMubfYJESOqW9YdNLROR/yhDfZvbBhFBSxKl8vwNWGrr3zxGUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rHxwt6Oug+9Hy/gO6ZJ8JiCXuN9YtBz5BAcNfR4Jllg=;
 b=Mo3Ob63CHJbtflj2fYaBzjru4+sBvbhCQoIu6HKgr3ApZS53N9xvnARfpG0F5WgN5G+m33XSt47fSZvcqgCZ7tqatC6ersxWxqORw1/CBDkqX9TIBYFJMm7QTFs4zoLe7QhmFkl7XYjDHSPVjOW4XopqvgzjG8S3PSJP1jG3tZI9Kzlf3QZyUWXjyu51x+QVe96iMbSwd9K4TAX//ZVwSPX0+bPF9uuC0HWLkKYlSkB0V4PrZk2/oqceqTY5CZ8ma5sinQficcH96tdg0d3UKZRyDmqua70+Cgfbyo2fs7VLLSn23AuePOTh7/k0InXQfhRm6Pe4/pxXvjSaDsVloA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=google.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rHxwt6Oug+9Hy/gO6ZJ8JiCXuN9YtBz5BAcNfR4Jllg=;
 b=THBkoueIvX7zdmTHhJYU9QtyS96/zcMKUN2bApBmm+vTc0aHzguU8+LW22YTydzYqD62WvcUDgz0rY+Yi//6ef6tj6O8Q9FKRe1///07bLNExSebzFnfBncVJkL3K+X/u3PPFNT5EzSlnYmFeRojwBZQYHPqrJiV96Yyxww41Qhu3XgC2EgZ22+8yohuwJEn0AVLWT8tgfwB8xttfEiWvnmo3xZ6+l78DFjk3gLrOksAd1gu2lNL0eIgbYKjHBhXkSi3gaMFaKxboeSdb/WuiMC90RjKGSqzPpLG4BNXA+13QFpPColRCH0qe3aMtvlpTx5W9AaZitCZpwl22x6Y6g==
Received: from DS7P220CA0058.NAMP220.PROD.OUTLOOK.COM (2603:10b6:8:224::22) by
 SA0PR12MB7004.namprd12.prod.outlook.com (2603:10b6:806:2c0::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9520.7; Fri, 16 Jan 2026 21:50:35 +0000
Received: from DS2PEPF0000343D.namprd02.prod.outlook.com
 (2603:10b6:8:224:cafe::aa) by DS7P220CA0058.outlook.office365.com
 (2603:10b6:8:224::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9520.8 via Frontend Transport; Fri,
 16 Jan 2026 21:50:29 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 DS2PEPF0000343D.mail.protection.outlook.com (10.167.18.40) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9542.4 via Frontend Transport; Fri, 16 Jan 2026 21:50:34 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 16 Jan
 2026 13:50:16 -0800
Received: from ttabi.nvidia.com (10.126.230.35) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 16 Jan
 2026 13:50:15 -0800
From: Timur Tabi <ttabi@nvidia.com>
To: Matthew Maurer <mmaurer@google.com>, Danilo Krummrich <dakr@kernel.org>,
	Gary Guo <gary@garyguo.net>, John Hubbard <jhubbard@nvidia.com>, "Joel
 Fernandes" <joelagnelf@nvidia.com>, Alexandre Courbot <acourbot@nvidia.com>,
	<nouveau@lists.freedesktop.org>, <rust-for-linux@vger.kernel.org>
Subject: [PATCH v5 4/8] gpu: nova-core: implement BinaryWriter for LogBuffer
Date: Fri, 16 Jan 2026 15:49:55 -0600
Message-ID: <20260116214959.641032-5-ttabi@nvidia.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260116214959.641032-1-ttabi@nvidia.com>
References: <20260116214959.641032-1-ttabi@nvidia.com>
MIME-Version: 1.0
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.126.230.35]
X-ClientProxiedBy: rnnvmail202.nvidia.com (10.129.68.7) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PEPF0000343D:EE_|SA0PR12MB7004:EE_
X-MS-Office365-Filtering-Correlation-Id: 0becedcd-15f8-4d19-09f2-08de5549474d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|82310400026|1800799024|36860700013;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?rq6y3NxVc+PfdIgpu3u2Ibo5gSKrVDXj8o71MhVowZHdHUebOyk04bBVb2Lf?=
 =?us-ascii?Q?9f0/g1rWl17ADyGPKEhM1lEo/Lq2DMvatPej3v6MLNJHhzW72kyST1+ri943?=
 =?us-ascii?Q?+sql6C7txKby1ZKBxxzvyWELQ89xHYh4xS5D+NItMyZByN9tIBA6m9oQCAyy?=
 =?us-ascii?Q?X9BonwZUaTFXk/hCft1CyvRuKfu2BrXhuftJXPmX3Ot8y2r7lJsGxOzi4TPr?=
 =?us-ascii?Q?u0XFrDi8lfLeh+IYVJ0oHTXSU8iuXCvax2h33oQKDSPerD6MbuK33tggEZ11?=
 =?us-ascii?Q?a5bVcqiBro62HORvWlMLna4pVWvfN9BslFnWdeB6QW7ize+C9SLQaTScUy70?=
 =?us-ascii?Q?1SXwjKD95dePix9Ova58LrkLCRcGDrfUVTNzcoxNpuVkU3YtStfi6y7fsJsy?=
 =?us-ascii?Q?yB5G0Du0K2tFF+LmhDRJ1PFVVoCooeaUBQDonRmthiGDpibn6rac6Zkkis64?=
 =?us-ascii?Q?CwpO6jFSDydtZD6cdxnP/a2mnvnUnpKCy06XLj4i6YrYVkWiVLCcagMLOeqD?=
 =?us-ascii?Q?dinUeRE9zKkpx9HmV3MNc5bUJqRr3KOJSQnVL4huoLUxxVCL+tkjwfdxW2/W?=
 =?us-ascii?Q?j6PAqi22pJGb4Xcfjq9i80xaL1Mg1ehjqg1zCxpfXoYuUsm1xwUWs6pLFpBr?=
 =?us-ascii?Q?O2wIrKclNDtm80pEUeKU5ONbPJ1/SdkzF5mSuRNZyIOMAMQ4mvsoduu1DynM?=
 =?us-ascii?Q?GpmFtExy2HZMlqtmfo54/8UFIv6mWC48JPMInwvGsOO0x8mrYwo35r4CCTj8?=
 =?us-ascii?Q?n1ccWbw/bBn+ZliPGTiikocCP1f7Ja0E8w9ofUNylU1PIVk+1vpbgVwFHZUS?=
 =?us-ascii?Q?jxwGFfFz018aPOulAiWQ+/Su3sgwHF43YmijuSNFdwFMRv9rmQOb0btrZgTD?=
 =?us-ascii?Q?K5HzGgke4K61O56XTsIqHdZBATrEtBskdX+xmGBqKsLIrDPiPvHWUFmLtm3W?=
 =?us-ascii?Q?CoUfm0uDSNN+Y0jNRRzBKrgqtDF/aN2J4KSvslk0H2GOgT0xaRhprYFsvkSM?=
 =?us-ascii?Q?4QB3A/+euAIbFADwwNR94NgDkJSevHP8c82OTgDHx8cQTzSI+qUZQktIQvxn?=
 =?us-ascii?Q?kLYlipetxWpP5HEwu8FaAq8Dmv4xzhaRxZJT6/35cjnggL3kqb/YHbiz2+Ki?=
 =?us-ascii?Q?jJvvr2BLwYi4xLA3qjALks3fjOIL8lglJxJUQmHwS47v0T2KgQ1Pig2gK/GA?=
 =?us-ascii?Q?RpVqYjQrHXcclP5lywst6qyo5WgfDsuDR1d/ksbRTD2bwjhPpJmPDJGTeMa0?=
 =?us-ascii?Q?RtWflREHs+l2is/MzKhuLqLH2YqfiAfDOvekWdcs7KOKcXu/niVqf7C4cmQT?=
 =?us-ascii?Q?I/vkvfN3sdqBUP16oIZkhyMD3HVrjlO7eNdlrDzkk26rv9fOEI5bRyZJBsHT?=
 =?us-ascii?Q?iOQxzVt0l0NyybQ3DBcPNM9fxPsm2Gv3cryzbMxgSSootWtsi5ox+ZlPdpZv?=
 =?us-ascii?Q?xn3DXQPSOauwXIH0mH5II+qtaPrmu42oCiPsz/28ejCagxToelYkpoA/8YS8?=
 =?us-ascii?Q?gNY4o1E5vgV5W/y0o0CipU7anHF4cDtPvqtNY6faU8/JH12gYu1tRlBGAE6U?=
 =?us-ascii?Q?UvQK/cNrVNCKhW+0seAK4wpcxmLOgVeQ3p1zynj2cesFdUbb4HsOL9qfkBku?=
 =?us-ascii?Q?tJogoMX2xuezuJBnUz16BBvRLDa9xtoQFEzIU4lKpPKbABzTsGPg5ja2JVnY?=
 =?us-ascii?Q?wP7yuQ=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(376014)(82310400026)(1800799024)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jan 2026 21:50:34.8902
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 0becedcd-15f8-4d19-09f2-08de5549474d
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DS2PEPF0000343D.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB7004
Message-ID-Hash: 7JBRF4J5IMJ6BD3Q5IVA4R4EFMIBLBBP
X-Message-ID-Hash: 7JBRF4J5IMJ6BD3Q5IVA4R4EFMIBLBBP
X-MailFrom: ttabi@nvidia.com
X-Mailman-Rule-Hits: member-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/7JBRF4J5IMJ6BD3Q5IVA4R4EFMIBLBBP/>
Archived-At: 
 <https://lore.freedesktop.org/20260116214959.641032-5-ttabi@nvidia.com/>
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
 drivers/gpu/nova-core/gsp.rs | 40 ++++++++++++++++++++++++++++++++++++
 1 file changed, 40 insertions(+)

diff --git a/drivers/gpu/nova-core/gsp.rs b/drivers/gpu/nova-core/gsp.rs
index 766fd9905358..273327c33aa7 100644
--- a/drivers/gpu/nova-core/gsp.rs
+++ b/drivers/gpu/nova-core/gsp.rs
@@ -3,6 +3,7 @@
 mod boot;
 
 use kernel::{
+    debugfs,
     device,
     dma::{
         CoherentAllocation,
@@ -117,6 +118,45 @@ pub(crate) struct Gsp {
     rmargs: CoherentAllocation<GspArgumentsCached>,
 }
 
+impl debugfs::BinaryWriter for LogBuffer {
+    fn write_to_slice(
+        &self,
+        writer: &mut kernel::uaccess::UserSliceWriter,
+        offset: &mut kernel::fs::file::Offset,
+    ) -> Result<usize> {
+        if offset.is_negative() {
+            return Err(EINVAL);
+        }
+
+        let offset_val: usize = (*offset).try_into().map_err(|_| EINVAL)?;
+        let len = self.0.count();
+
+        if offset_val >= len {
+            return Ok(0);
+        }
+
+        let count = (len - offset_val).min(writer.len());
+
+        // SAFETY:
+        // - `start_ptr()` returns a valid pointer to a memory region of `count()` bytes,
+        //   as guaranteed by the `CoherentAllocation` invariants.
+        // - `len` equals `self.0.count()`, so the pointer is valid for `len` bytes.
+        // - `offset_val < len` is guaranteed by the check above.
+        // - `count = (len - offset_val).min(writer.len())`, so `offset_val + count <= len`.
+        unsafe { writer.write_buffer(self.0.start_ptr(), len, offset_val, count)? };
+
+        *offset += count as i64;
+        Ok(count)
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

