Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CDEC1CEFAF8
	for <lists+nouveau@lfdr.de>; Sat, 03 Jan 2026 06:00:03 +0100 (CET)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 591E410E323;
	Sat,  3 Jan 2026 05:00:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="W6x99Dwm";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id A808244C45;
	Sat,  3 Jan 2026 04:51:54 +0000 (UTC)
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1767415914;
 b=j+Y+ZxD5V0dL9AT+xQE9vUHWhzBvEs+CHWDeybDdZCu/GL4+IxXKDiSnSjkeQQEpj4XHd
 R+CjQ7V8OjczfaVzXvrYKQz63p/iW3xoHBR3qEk8K63ZWNgx0e1GZ6L8+yHo3cvP9BEIRGu
 UEeXhnWXaDlZhI8tjBUAbMfcEauF/KHcuJDqNXdgdYPEkE9fG/njHGFZyXmHXbKY6YxOS0g
 cED06KYZFTRVQ9/zYb9PnfeKwFIVlN/4Bg7SodogWAiWaf87MB49c5JDpMGtIVZg9ywdrcY
 yu5HG3ANMBKt1+9DEJj+Yy1h4MrEQPsoZmPFP30zMX37ugOe9gRYaDk7fKVA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1767415914; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=HZHDpprMYPiWkG6P28YdIVOiwL+dPsHu3uPV5m5I7eI=;
 b=Q6t69VMPA2Ywpo9qFTKf3s50LaQDzhAWdO3KmyBXtzLj7oFTIjJ/eLAboXL+iaqFabViQ
 M/sPpD6d+jhopnFt4eWo/met2/JhT7QItTb61/VVhz18/QPwHXr435rP8WMg/sMrDeAbEWm
 ZrBW9Dr+uLe3atczsZzApxmGRthg0Ij84tGOy7RJFdj4SxGNb6VrraL4tf6dVgPM/pWGrl5
 I/PzqTgWTa0F+2BCcuH0oYHza2KG5E7yO7pPdvqpFQMuxI+SXwyIG/9bX0pQbuiO5V0tXwX
 6+3A7VvJEW7kYM7LcDmve8yGBJajOg1wnOAR4q2CW9Pt0Aa/2qpmlGCx0y/Q==
ARC-Authentication-Results: i=2; mail.freedesktop.org;
 dkim=pass header.d=Nvidia.com;
  arc=pass;
  dmarc=pass (Used From Domain Record) header.from=nvidia.com
 policy.dmarc=reject
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=Nvidia.com;
 arc=pass;
 dmarc=pass (Used From Domain Record) header.from=nvidia.com policy.dmarc=reject
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id C559D44C45
	for <nouveau@lists.freedesktop.org>; Sat,  3 Jan 2026 04:51:51 +0000 (UTC)
Received: from BN1PR04CU002.outbound.protection.outlook.com
 (mail-eastus2azon11010045.outbound.protection.outlook.com [52.101.56.45])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 4087310E14B
	for <nouveau@lists.freedesktop.org>; Sat,  3 Jan 2026 04:59:57 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=O7EFFZsPz1BUywZG2Zhe75F+7FFcsGsLg7Z2zoJC1Aoz4xatW4oc59o8iAUhBQKyT0cAPAp5DoLyawzkQqsCbC/B4O2Bdv9aTPGil336TTugq/r0aGK+LI0f0WcZUMJGLXpmN1CFCK4d8Bq/8XqQB8UElb1y/l45Z8fPGkE8wLRqgXqgTgUSqPPwC+XNd5ZsJUTO1GjwWdcrQL+8zJ7B7MbAYR8OKTglQf11E2nAitUcYYBicU0j12UAuikLmYkehXJMBCRcqFvK2s3Vvq89T1B7TJqdDCDfyRam9+klopkKZy/iDFSsQFUZBzSZlmrgheWqW1ubSt7VZoeFZfuJ2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HZHDpprMYPiWkG6P28YdIVOiwL+dPsHu3uPV5m5I7eI=;
 b=WzlI2nOulmfFeQfIZrlIHGbYup5vH8hshJHh3Qf/EEXtjLiqmmlGrw0ZyMv1fiEkT5IeqQDQXGwSSjsEvoAWgwNR9iPM9r35j1M/uLQck34T9A87N9OF3ptQIuJjwfgGQ6XK8bChs9KYJ1bWnqi2LrwfcbYTNQYOEcusbi2FmgwVqQkgk7dl/mnytCruaAGT777X7ZwLZJH5zODFi/lK5ubfFCDV/+9u7Ci/r6DldRIzQ9ahf7VHKxvQ9EDl9cNmRpT8MwTmf+2lmvSE64F6u17cQoOjJp/i6eqK7AKKIrzKqfwZsZ56A7x4FkvMvovyh0/zWqwaLfH4mBD+X2yz/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HZHDpprMYPiWkG6P28YdIVOiwL+dPsHu3uPV5m5I7eI=;
 b=W6x99DwmVmRW9PHzuN0klu7U3lGSNFZyuUMCHrOerSSHBwCBGZy1vEEy+CD1S+V4yrj01C7x40RS9VVR8rZEvRWeQgKBQcInlH52YHqWzz0I1BGDPlxRPaLHY7AvcmOW+M1qWaLfjVeV0FT8LmD9UIp1wfKJV/9NDnfZK9YBe2scG8fyIEKPTpd7gldPj1ADbyVzMIitluH2CrmF6ylE2hOJ95cD3/3tawFngqQTHzf8IEz3xF1o2ah3EUdUypaTxdNmR3yqP6Bw6ePccbtFrtvl6V86QGTcQ+fLp2+ncqcIkY1SGoaBMX/Z9mA4kCP1QRS60KZbmKPy4rGWX0wGcg==
Received: from SN7PR04CA0175.namprd04.prod.outlook.com (2603:10b6:806:125::30)
 by DS4PR12MB9660.namprd12.prod.outlook.com (2603:10b6:8:281::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9478.4; Sat, 3 Jan
 2026 04:59:53 +0000
Received: from SN1PEPF0002636E.namprd02.prod.outlook.com
 (2603:10b6:806:125:cafe::f6) by SN7PR04CA0175.outlook.office365.com
 (2603:10b6:806:125::30) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9478.4 via Frontend Transport; Sat, 3
 Jan 2026 04:59:31 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 SN1PEPF0002636E.mail.protection.outlook.com (10.167.241.139) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9499.1 via Frontend Transport; Sat, 3 Jan 2026 04:59:51 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 2 Jan
 2026 20:59:45 -0800
Received: from ubuntu (10.126.231.35) by rnnvmail201.nvidia.com (10.129.68.8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 2 Jan
 2026 20:59:44 -0800
From: Timur Tabi <ttabi@nvidia.com>
To: Danilo Krummrich <dakr@kernel.org>, Alexandre Courbot
	<acourbot@nvidia.com>, Joel Fernandes <joelagnelf@nvidia.com>, John Hubbard
	<jhubbard@nvidia.com>, <nouveau@lists.freedesktop.org>,
	<rust-for-linux@vger.kernel.org>
Subject: [PATCH v5 01/11] gpu: nova-core: rename Imem to ImemSecure
Date: Fri, 2 Jan 2026 22:59:24 -0600
Message-ID: <20260103045934.64521-2-ttabi@nvidia.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260103045934.64521-1-ttabi@nvidia.com>
References: <20260103045934.64521-1-ttabi@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.126.231.35]
X-ClientProxiedBy: rnnvmail201.nvidia.com (10.129.68.8) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF0002636E:EE_|DS4PR12MB9660:EE_
X-MS-Office365-Filtering-Correlation-Id: 180dc89f-5067-46b6-f6aa-08de4a84edd1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|82310400026|376014|36860700013;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?5SzT/ej0gGcmjtI0MejELG0raZwaUaJQ2FoDwoc/VgPwpqwDC9PNqR8zrGro?=
 =?us-ascii?Q?oW0ZA89mlGJmf8GZZ0+EZUdgnS2R9kNykqXO716RG5fX9PyYcmLaTFrINxLI?=
 =?us-ascii?Q?KYLbsGNPvfD63ovKZQxgRFAIXc/8Tf595nuzpjfqB0YjCRWpoO6ab6ahCACO?=
 =?us-ascii?Q?Midst9Lm82YtWekTHggEGWq4usdU+jnh8nUfTFTgUwibzTzDINbhaWsZMh0C?=
 =?us-ascii?Q?TFGtEYwMnSJ3UdwqoMmufzGo5QgHdD9s2qTTTS6eytdai8sJSPDgi/uR/yJ3?=
 =?us-ascii?Q?QAi2xd/axSfTxFzf+b+hoGxlErJv+xgsEW+Gp8qX5Hr/J1RpemOU/by5Z5yy?=
 =?us-ascii?Q?xf3ncuACdJZqM9byUNM2UFLLHjIc/hEkVAB2oBiKuwfkIPAdnYwbzURmJdCG?=
 =?us-ascii?Q?1eZ0Zu6c27u6mW4i9erDzPRnY4ppoZEjSNW6/yJZ0a19DjWZDdFEUzv9hlBg?=
 =?us-ascii?Q?mmhB+1v/AHxT70pMvRpT7xwpcCVa24uVMZdJMRit8edLMjp9HUyj6kNlDJo3?=
 =?us-ascii?Q?H8aCAfJAqiVjrrPjIs1cuwfJyiMGg/7uRWCvJ4R2MbIhVizRDq35G4/MgNJT?=
 =?us-ascii?Q?n06GHSMblhw9+57/TZcZWl0mp3AyC0CS+O6rfBGpLctRBPeLHAtlSxABlHxQ?=
 =?us-ascii?Q?epMqv9/zVk0RKA6JtSGvHDl4MvOXmfLFhhd1kURfIL+r/lNK3JYP0DRb/tej?=
 =?us-ascii?Q?6hA+Nm7dm/bl1St6qYXxxIHg8k37paL2/mivOi0gybQOrx9J/EzhtDKrek+J?=
 =?us-ascii?Q?QLlP6k8zF7tXoUzoqg3R/gnXT43GhWMQNrLdPZ6Ygp2OwI7t/0mGBsk6AaL3?=
 =?us-ascii?Q?a/9NXXWFHB1xxVZ+IiF3XLzSyn2+k3SPLqwRdSj/sOxgZM0DtXFv6SmlOlwh?=
 =?us-ascii?Q?BNB8jUirlAfp2I4YLvOCM1XJxNFDcCPaOHUhuCv0GwA0Fsnckkdi6LfAdklz?=
 =?us-ascii?Q?gFYFjHc++j8MI2A96CcMr5ls4prIUUWBpJUynh3HOyKouiRpwtv8iGqI8FUg?=
 =?us-ascii?Q?OaWgxYpHoHjUTt7Xl2WUmqRgRcPx5axm+AKTDaOANrzYRgkEaC34Xa0T5tRW?=
 =?us-ascii?Q?xGQXNpk00gPyK6dod7gjpLk3LGAJrifvaLhQrwt0gG6YAxcBKpwVZVZZ/rhb?=
 =?us-ascii?Q?CCPH7uvROv9X0EEjrM08lo9ix7ei/eZjwXrlhL7zZ8mh/EH8/7E4vTYroSlG?=
 =?us-ascii?Q?3RRRNVXE4//neRT5R+5FfnLo7NXPqjyuVEqw+/kaaq5Ajt8kIk05iS/V/8uw?=
 =?us-ascii?Q?l01voeul6VWIh4GGifP4PPcMRTeEZRJYmyLLK6/8+R0p+mXjsJL5kiNuVazE?=
 =?us-ascii?Q?9ycVI2rZJHAoviegI8J9eLxZ/msTG0id9IW8TzChRU5GHDVezwknmjIvj4cW?=
 =?us-ascii?Q?2VzM6ce0heBssCyQ8LwsmTs12BhBwXDRSh9BTfkFV+WNMM26AQwU9+Vr44YM?=
 =?us-ascii?Q?R7xaoHg9wIgkWN9cr5cGbsELgovNclF5xB00sf5ZNQsc0kJ8eNSIWoUENtDA?=
 =?us-ascii?Q?PskuDWBByA0Y7fkXLiGmzBk9Z2hZfg0gTv2aztKmadTxNq8UP5/13cb/2NAl?=
 =?us-ascii?Q?J38pArn/V9mvzBZFU3w=3D?=
X-Forefront-Antispam-Report: 
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(376014)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jan 2026 04:59:51.7905
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 180dc89f-5067-46b6-f6aa-08de4a84edd1
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SN1PEPF0002636E.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PR12MB9660
Message-ID-Hash: LXQWIZFX3O5NNLFI5PLWEOETSII2UR6W
X-Message-ID-Hash: LXQWIZFX3O5NNLFI5PLWEOETSII2UR6W
X-MailFrom: ttabi@nvidia.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation; nonmember-moderation; administrivia;
 implicit-dest; max-recipients; max-size; news-moderation; no-subject;
 digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/LXQWIZFX3O5NNLFI5PLWEOETSII2UR6W/>
Archived-At: 
 <https://lore.freedesktop.org/20260103045934.64521-2-ttabi@nvidia.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

Rename FalconMem::Imem to ImemSecure to indicate that it references
Secure Instruction Memory.  This change has no functional impact.

On Falcon cores, pages in instruction memory can be tagged as Secure
or Non-Secure.  For GA102 and later, only Secure is used, which is why
FalconMem::Imem seems appropriate.  However, Turing firmware images
can also contain non-secure sections, and so FalconMem needs to support
that.  By renaming Imem to ImemSec now, future patches for Turing support
will be simpler.

Nouveau uses the term "IMEM" to refer both to the Instruction Memory
block on Falcon cores as well as to the images of secure firmware
uploaded to part of IMEM.  OpenRM uses the terms "ImemSec" and "ImemNs"
instead, and uses "IMEM" just to refer to the physical memory device.

Renaming these terms allows us to align with OpenRM, avoid confusion
between IMEM and ImemSec, and makes future patches simpler.

Signed-off-by: Timur Tabi <ttabi@nvidia.com>
Reviewed-by: John Hubbard <jhubbard@nvidia.com>
---
 drivers/gpu/nova-core/falcon.rs          | 20 +++++++++++++-------
 drivers/gpu/nova-core/firmware/booter.rs | 12 ++++++------
 drivers/gpu/nova-core/firmware/fwsec.rs  |  2 +-
 3 files changed, 20 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/nova-core/falcon.rs b/drivers/gpu/nova-core/falcon.rs
index 82c661aef594..0965cb50568b 100644
--- a/drivers/gpu/nova-core/falcon.rs
+++ b/drivers/gpu/nova-core/falcon.rs
@@ -237,8 +237,8 @@ fn from(value: PeregrineCoreSelect) -> Self {
 /// Different types of memory present in a falcon core.
 #[derive(Debug, Clone, Copy, PartialEq, Eq)]
 pub(crate) enum FalconMem {
-    /// Instruction Memory.
-    Imem,
+    /// Secure Instruction Memory.
+    ImemSecure,
     /// Data Memory.
     Dmem,
 }
@@ -345,8 +345,8 @@ pub(crate) struct FalconBromParams {
 
 /// Trait for providing load parameters of falcon firmwares.
 pub(crate) trait FalconLoadParams {
-    /// Returns the load parameters for `IMEM`.
-    fn imem_load_params(&self) -> FalconLoadTarget;
+    /// Returns the load parameters for Secure `IMEM`.
+    fn imem_sec_load_params(&self) -> FalconLoadTarget;
 
     /// Returns the load parameters for `DMEM`.
     fn dmem_load_params(&self) -> FalconLoadTarget;
@@ -457,7 +457,7 @@ fn dma_wr<F: FalconFirmware<Target = E>>(
         //
         // For DMEM we can fold the start offset into the DMA handle.
         let (src_start, dma_start) = match target_mem {
-            FalconMem::Imem => (load_offsets.src_start, fw.dma_handle()),
+            FalconMem::ImemSecure => (load_offsets.src_start, fw.dma_handle()),
             FalconMem::Dmem => (
                 0,
                 fw.dma_handle_with_offset(load_offsets.src_start.into_safe_cast())?,
@@ -508,7 +508,7 @@ fn dma_wr<F: FalconFirmware<Target = E>>(
 
         let cmd = regs::NV_PFALCON_FALCON_DMATRFCMD::default()
             .set_size(DmaTrfCmdSize::Size256B)
-            .set_imem(target_mem == FalconMem::Imem)
+            .set_imem(target_mem == FalconMem::ImemSecure)
             .set_sec(if sec { 1 } else { 0 });
 
         for pos in (0..num_transfers).map(|i| i * DMA_LEN) {
@@ -543,7 +543,13 @@ pub(crate) fn dma_load<F: FalconFirmware<Target = E>>(&self, bar: &Bar0, fw: &F)
                 .set_mem_type(FalconFbifMemType::Physical)
         });
 
-        self.dma_wr(bar, fw, FalconMem::Imem, fw.imem_load_params(), true)?;
+        self.dma_wr(
+            bar,
+            fw,
+            FalconMem::ImemSecure,
+            fw.imem_sec_load_params(),
+            true,
+        )?;
         self.dma_wr(bar, fw, FalconMem::Dmem, fw.dmem_load_params(), true)?;
 
         self.hal.program_brom(self, bar, &fw.brom_params())?;
diff --git a/drivers/gpu/nova-core/firmware/booter.rs b/drivers/gpu/nova-core/firmware/booter.rs
index f107f753214a..096cd01dbc9d 100644
--- a/drivers/gpu/nova-core/firmware/booter.rs
+++ b/drivers/gpu/nova-core/firmware/booter.rs
@@ -251,8 +251,8 @@ impl<'a> FirmwareSignature<BooterFirmware> for BooterSignature<'a> {}
 
 /// The `Booter` loader firmware, responsible for loading the GSP.
 pub(crate) struct BooterFirmware {
-    // Load parameters for `IMEM` falcon memory.
-    imem_load_target: FalconLoadTarget,
+    // Load parameters for Secure `IMEM` falcon memory.
+    imem_sec_load_target: FalconLoadTarget,
     // Load parameters for `DMEM` falcon memory.
     dmem_load_target: FalconLoadTarget,
     // BROM falcon parameters.
@@ -354,7 +354,7 @@ pub(crate) fn new(
         };
 
         Ok(Self {
-            imem_load_target: FalconLoadTarget {
+            imem_sec_load_target: FalconLoadTarget {
                 src_start: app0.offset,
                 dst_start: 0,
                 len: app0.len,
@@ -371,8 +371,8 @@ pub(crate) fn new(
 }
 
 impl FalconLoadParams for BooterFirmware {
-    fn imem_load_params(&self) -> FalconLoadTarget {
-        self.imem_load_target.clone()
+    fn imem_sec_load_params(&self) -> FalconLoadTarget {
+        self.imem_sec_load_target.clone()
     }
 
     fn dmem_load_params(&self) -> FalconLoadTarget {
@@ -384,7 +384,7 @@ fn brom_params(&self) -> FalconBromParams {
     }
 
     fn boot_addr(&self) -> u32 {
-        self.imem_load_target.src_start
+        self.imem_sec_load_target.src_start
     }
 }
 
diff --git a/drivers/gpu/nova-core/firmware/fwsec.rs b/drivers/gpu/nova-core/firmware/fwsec.rs
index b28e34d279f4..6a2f5a0d4b15 100644
--- a/drivers/gpu/nova-core/firmware/fwsec.rs
+++ b/drivers/gpu/nova-core/firmware/fwsec.rs
@@ -224,7 +224,7 @@ pub(crate) struct FwsecFirmware {
 }
 
 impl FalconLoadParams for FwsecFirmware {
-    fn imem_load_params(&self) -> FalconLoadTarget {
+    fn imem_sec_load_params(&self) -> FalconLoadTarget {
         FalconLoadTarget {
             src_start: 0,
             dst_start: self.desc.imem_phys_base,
-- 
2.51.0

