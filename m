Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C5F1D21097
	for <lists+nouveau@lfdr.de>; Wed, 14 Jan 2026 20:30:31 +0100 (CET)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 1BAB310E687;
	Wed, 14 Jan 2026 19:30:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="SB/8LvRt";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 8134D44CAF;
	Wed, 14 Jan 2026 19:21:58 +0000 (UTC)
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1768418518;
 b=S1IyB5pz1NvmZYeCQfQagjhKDstSQv99VClkTLtmG0ZSX0ElSegjZLCczlKbvQiBa8I88
 9oFZcuzdgTNX6hkho3RxuDi3feSrxmqRcAXjUGQb8Y7/7xEOP5+PsV81c7gD/rfZfE7ibEV
 1rtfoCUdmwNxI6/0b1J9rFpZ2GFKj1ZoZh9UM90B2HxAzPtlmqLPmYi02lYJ7CqpxOwkJvZ
 wOLCpy2t0oje8vLhdGu573C1i4AeDU8HvjqqH/I99MQHiznZm3xYQdOYMvOu6KZGNGpRnCx
 sC6giK+Re7Xfd205XcP9oLdAkMrrqkk4qusDkNlJeNWD8hHU6mYGNNfclPvg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1768418518; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=nL6oemKjE6MJ/aorDMg77+dd7cuvFAuQcYBjS2cpCiI=;
 b=QBvbqY245T8rKbiG09GzoJqY6PbNn1GdO/NJDEAq0DQYMiaiey60L0JwCd50+T3zx/HA7
 iOGyP+HJwrmhGQ+0U/FurNi6USQmI0Gx7RUuKwnMQohMypIvIYA8HZLfueQNAJeCdaX8qCB
 IiLHCnPzKfskYpfG9A+KcrE0dyyuopfzMgVwncusWqkrAmIj6kC4ZMQsFHNgY3BIE0I/wBU
 CU/+8y6eDitH43UmFEfS0apEEQskgXkkAqacdezHj1zKR4Gez0pkj1Qn1+cdx/GEuvICKPB
 ndIMI6f+o9pyPCAzHkgGdumABJz57POt9vljcV6Hzmb8m/nUz+zl5NNLem3A==
ARC-Authentication-Results: i=2; mail.freedesktop.org;
 dkim=pass header.d=Nvidia.com;
  arc=pass;
  dmarc=pass (Used From Domain Record) header.from=nvidia.com
 policy.dmarc=reject
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=Nvidia.com;
 arc=pass;
 dmarc=pass (Used From Domain Record) header.from=nvidia.com policy.dmarc=reject
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id BA85544C87
	for <nouveau@lists.freedesktop.org>; Wed, 14 Jan 2026 19:21:54 +0000 (UTC)
Received: from CH5PR02CU005.outbound.protection.outlook.com
 (mail-northcentralusazon11012057.outbound.protection.outlook.com
 [40.107.200.57])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 2011710E0F0
	for <nouveau@lists.freedesktop.org>; Wed, 14 Jan 2026 19:30:26 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tWRlzsAcRZftKOZZXmpoUDXyYF+qKSWfwDnOTzhZXf8oY+Nt4CYexGzsxIRn1e4uC710oyGYaYM3XTF/gXswNQEkV0rf80QUexXn6ivt/39g/KtDOF6qmKRpYAUbjVHar8mejRhRxGr13Nz6Di50UXehHn2RAAKs3Ky2M7ZLt2dUpgUMF8JU5Rf6Tto0W2OwSr6YjNTMPGq8ulbAkn9S1OkrEHV1EjMxHl0qvOETp4i2KWeEBsKpy+imA0HKtcxsiH2QAmyCP1KpKIYbKzPpxgN6umDC9SkFjJvU0fsa/CJw+k/vbTpbZ2NuAZF7wfGxuVm5vfukB5tdH/25cfHD+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nL6oemKjE6MJ/aorDMg77+dd7cuvFAuQcYBjS2cpCiI=;
 b=yyu4IhVQvnjWrQQWRI2E1bNP6xeSP+ZkNihzXueZWeBg+ETdxUMeO19HVA+Ol9v9KpB+OqAqcfzR9N4kG0dTBQLNH9Waive6GFpSlNbhU/cbobtH+pqyUPDOYE8WoNVByFzOntiqnB9/W/VU7ma03ybXVMHtKWyRQl7AHsZyoeHpxlhR4coqQpKswRjASw0U31CwPP43xXpxKOVk+CkhE0xweIoyv4iFv/sFT5JxjBwXgI823doN7BlbXkbuX85fVFgXXzApSbSSHRXX5NP0jmlIOFBBZQhCOPWld+9V8zYD4zSLNJb9pJbh64+FWI8/OY0rv1G+UZz7a35XaRN/tQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nL6oemKjE6MJ/aorDMg77+dd7cuvFAuQcYBjS2cpCiI=;
 b=SB/8LvRtYdPeppNpeT75TN/HFLoyDy+BLMzRW8YpsXyiyeYMmy8IoCaRCBxJQx3odlxhlXWhG25U1G9PCxQarmanIdqhfCWAo4RekMC0jWgIWjq+/XPj99yhDRVM1Er2gVCwb5SonXoNHFQyjRV6UWr3T4F/X9Ogid7U8iPeLkZN9E6aUvQeN/sez/ZnDDbk5A9kzA5jLWRiT9qvjjv77dWpseknyhJE9cBejOItW5hIsoqK7n9KB+77RhYz6nAHJA/EgjInLdcjFVH6qqRpJtwAsu+Yh8SY/5/N0K2hsQ2s1nCqhHIiNuev+Vkp93ZnF1wmH4dM7cgQH10X6r5L+Q==
Received: from BN9PR03CA0877.namprd03.prod.outlook.com (2603:10b6:408:13c::12)
 by BL3PR12MB9050.namprd12.prod.outlook.com (2603:10b6:208:3b9::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.4; Wed, 14 Jan
 2026 19:30:20 +0000
Received: from BL6PEPF00020E64.namprd04.prod.outlook.com
 (2603:10b6:408:13c:cafe::8f) by BN9PR03CA0877.outlook.office365.com
 (2603:10b6:408:13c::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9520.5 via Frontend Transport; Wed,
 14 Jan 2026 19:30:12 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 BL6PEPF00020E64.mail.protection.outlook.com (10.167.249.25) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9520.1 via Frontend Transport; Wed, 14 Jan 2026 19:30:20 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 14 Jan
 2026 11:30:04 -0800
Received: from ttabi.nvidia.com (10.126.230.35) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 14 Jan
 2026 11:30:02 -0800
From: Timur Tabi <ttabi@nvidia.com>
To: Alexandre Courbot <acourbot@nvidia.com>, John Hubbard
	<jhubbard@nvidia.com>, Joel Fernandes <joelagnelf@nvidia.com>, "Danilo
 Krummrich" <dakr@kernel.org>, <nouveau@lists.freedesktop.org>,
	<rust-for-linux@vger.kernel.org>
Subject: [PATCH v6 05/11] gpu: nova-core: add
 NV_PFALCON_FALCON_DMATRFCMD::with_falcon_mem()
Date: Wed, 14 Jan 2026 13:29:44 -0600
Message-ID: <20260114192950.1143002-6-ttabi@nvidia.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260114192950.1143002-1-ttabi@nvidia.com>
References: <20260114192950.1143002-1-ttabi@nvidia.com>
MIME-Version: 1.0
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.126.230.35]
X-ClientProxiedBy: rnnvmail202.nvidia.com (10.129.68.7) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF00020E64:EE_|BL3PR12MB9050:EE_
X-MS-Office365-Filtering-Correlation-Id: dcbdf9d9-6945-4892-3237-08de53a35b3e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|36860700013|376014|82310400026;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?UpiIlmO4jLN5A1JjP+RMD8p05LpCqsqlO+rPACNA7PecGqpj0mbTgju5No3/?=
 =?us-ascii?Q?8c5l/CMzv/oud7SKazGG6OZZV6+/P+3LrYmApGL1y7VcWxjXZPbJBsNCg+9i?=
 =?us-ascii?Q?5Rgb+7DJVm84UyXH0XUAo0xEbSpL1FbgdULlMT/skxCO1TEbOIZK32oUScty?=
 =?us-ascii?Q?Igb/M+OvtX+g/qwUav9gYLEC5nJb2ZdcTMZQhq+PIOiLUecrbNLE6tET/XmK?=
 =?us-ascii?Q?MTdbB5FJz2HWKR//EWWaFgRbUVXLX25ZloRry61PKFve2Px3dyWXhNkbXA+J?=
 =?us-ascii?Q?nrvnoCarJUX0xeNjcZMuxmr+huhwps8QCbCv2dJ57rQlQY8Qp6xlAqGPaqMY?=
 =?us-ascii?Q?0RGmcDd7nzUKfQX1OyFTVrr/04pM+5mUZv5Jv8uWDZm9sUq5DEVyi+DtxIpv?=
 =?us-ascii?Q?B7CYFaIlGsvutvU7n/4MnD3ivaC3rs6ob5KVIejRzgKsCKcvx7lIsa4VlQtL?=
 =?us-ascii?Q?kb9Mu9qgukmTyJdPgXkKcSWLEnPy6pQSuAhlL346wS4+Ef13nZZvj+/WPgx8?=
 =?us-ascii?Q?4+KiPJeqhYPg3hl/Wwct9PpXnDmsZn8kgsvLxahiNZdctP93cWYdWVtUWV1W?=
 =?us-ascii?Q?LOVtiVoOUZ8AOc11ZnEm57E/rQSe9OiLY6Ral0YGgDDEdgVP0GCAyksMiRhb?=
 =?us-ascii?Q?Xv/9JbCQt2CU+g+WLN2ZihVivD7j/hIj1udjP2PtVlrWZ/+X7Or0lnOM9qib?=
 =?us-ascii?Q?yhI0GWwTOOZz2BzXKlbNA5BPCcdci4GNdHwEKAvQOG5GkIBRkG7Bp+kxXcAh?=
 =?us-ascii?Q?0jRfJsWKsEPZhZrd0v5lr6AbCCGW8RV8b2FoDJ/WQzzZFbO5kzSmyxtuoy3h?=
 =?us-ascii?Q?osNqfAOgBD0yHW2PpXr9t/EFHjDA9WEjWarRvwhRMRmOWSwenU7TO/p9OrCo?=
 =?us-ascii?Q?82I37lLa+enb3ipBX8DpfvSrFXXmymxdT4ntcIw1a8369NLNkRbvXkZxYPRj?=
 =?us-ascii?Q?/Ic03iLhQ+/uGYva2PmToe9LqBDDvU3LbHKZYJY0A4rJuPr/JM1p/WvObASR?=
 =?us-ascii?Q?nW0Xl2UDu2o9q8fB1A27uLcqT8QxEcHDvnV4EwsHE+Qj2uRbIBCVf63j2ccM?=
 =?us-ascii?Q?vhDB18nsPA1zd4dJjq4Jmso9l/LI3E+sq74+6iFwPbGZCO8lrVGNPQI7tvHY?=
 =?us-ascii?Q?tfJlvjsS7VGTDQnaXWwFVIpq2tVd559asIXyXX59zYQrQ0jHnFItWbvHymYp?=
 =?us-ascii?Q?Z2P5059DQXv0Bb4XxRVALsGA1hvpHe2SAgiNwcYZQr89z6cDe0eODCyMZhO2?=
 =?us-ascii?Q?VEXy7/EaZ8DKW5xm7b1FvObU5ijG+1CKd7TV7X0ZRlaTFbrYwoy6VSHhwJGV?=
 =?us-ascii?Q?AU0VHo7ynXv3Z2r7c80z7N2Ghh3wI8Upmh2cqG+Lys69NaZbhvh+vRk7O8ri?=
 =?us-ascii?Q?oXHogvPFlPizIvjK26GRqqkwpQQHB/uyPfIdcuDdErEts3OVt8t9vqyYAxbe?=
 =?us-ascii?Q?aWZgi2sq4dUjNDeuu06zacrR/usef6j2wAfVYVnAeBdIxZYtmu14FP6beOpt?=
 =?us-ascii?Q?qu+XtMi6lIarZ602p6U8Z/Z34CZU3lxDffEKireKxAQvOSdD9MRsRyyxA+7L?=
 =?us-ascii?Q?hOQtEVp7l2T4w9Bh2YZxs6AqZljBeQnpvm8rcftTn9kOQGZLOsO/WiHRGbc0?=
 =?us-ascii?Q?dhitJET9KClwmUiQG4ItlHTI+TrN+eEuwahxcBF728RtQrn0vkp1/HV/gXN0?=
 =?us-ascii?Q?Qd7H/A=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(376014)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jan 2026 19:30:20.6970
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 dcbdf9d9-6945-4892-3237-08de53a35b3e
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BL6PEPF00020E64.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR12MB9050
Message-ID-Hash: E7H7MKA6TMSWIPQ3SVPMI7ELUCHQ2HEF
X-Message-ID-Hash: E7H7MKA6TMSWIPQ3SVPMI7ELUCHQ2HEF
X-MailFrom: ttabi@nvidia.com
X-Mailman-Rule-Hits: member-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/E7H7MKA6TMSWIPQ3SVPMI7ELUCHQ2HEF/>
Archived-At: 
 <https://lore.freedesktop.org/20260114192950.1143002-6-ttabi@nvidia.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

The with_falcon_mem() method initializes the 'imem' and 'sec' fields of
the NV_PFALCON_FALCON_DMATRFCMD register based on the value of
the FalconMem type.

Signed-off-by: Timur Tabi <ttabi@nvidia.com>
Reviewed-by: John Hubbard <jhubbard@nvidia.com>
---
 drivers/gpu/nova-core/falcon.rs | 14 +++-----------
 drivers/gpu/nova-core/regs.rs   |  9 +++++++++
 2 files changed, 12 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/nova-core/falcon.rs b/drivers/gpu/nova-core/falcon.rs
index 60713fecffc9..2a8fb7059a44 100644
--- a/drivers/gpu/nova-core/falcon.rs
+++ b/drivers/gpu/nova-core/falcon.rs
@@ -457,7 +457,6 @@ fn dma_wr<F: FalconFirmware<Target = E>>(
         fw: &F,
         target_mem: FalconMem,
         load_offsets: FalconLoadTarget,
-        sec: bool,
     ) -> Result {
         const DMA_LEN: u32 = 256;
 
@@ -525,8 +524,7 @@ fn dma_wr<F: FalconFirmware<Target = E>>(
 
         let cmd = regs::NV_PFALCON_FALCON_DMATRFCMD::default()
             .set_size(DmaTrfCmdSize::Size256B)
-            .set_imem(target_mem != FalconMem::Dmem)
-            .set_sec(if sec { 1 } else { 0 });
+            .with_falcon_mem(target_mem);
 
         for pos in (0..num_transfers).map(|i| i * DMA_LEN) {
             // Perform a transfer of size `DMA_LEN`.
@@ -566,14 +564,8 @@ pub(crate) fn dma_load<F: FalconFirmware<Target = E>>(&self, bar: &Bar0, fw: &F)
                 .set_mem_type(FalconFbifMemType::Physical)
         });
 
-        self.dma_wr(
-            bar,
-            fw,
-            FalconMem::ImemSecure,
-            fw.imem_sec_load_params(),
-            true,
-        )?;
-        self.dma_wr(bar, fw, FalconMem::Dmem, fw.dmem_load_params(), true)?;
+        self.dma_wr(bar, fw, FalconMem::ImemSecure, fw.imem_sec_load_params())?;
+        self.dma_wr(bar, fw, FalconMem::Dmem, fw.dmem_load_params())?;
 
         self.hal.program_brom(self, bar, &fw.brom_params())?;
 
diff --git a/drivers/gpu/nova-core/regs.rs b/drivers/gpu/nova-core/regs.rs
index 82cc6c0790e5..b8ddfe2e5ae7 100644
--- a/drivers/gpu/nova-core/regs.rs
+++ b/drivers/gpu/nova-core/regs.rs
@@ -16,6 +16,7 @@
         FalconCoreRevSubversion,
         FalconFbifMemType,
         FalconFbifTarget,
+        FalconMem,
         FalconModSelAlgo,
         FalconSecurityModel,
         PFalcon2Base,
@@ -325,6 +326,14 @@ pub(crate) fn mem_scrubbing_done(self) -> bool {
     16:16   set_dmtag as u8;
 });
 
+impl NV_PFALCON_FALCON_DMATRFCMD {
+    /// Programs the `imem` and `sec` fields for the given FalconMem
+    pub(crate) fn with_falcon_mem(self, mem: FalconMem) -> Self {
+        self.set_imem(mem != FalconMem::Dmem)
+            .set_sec(if mem == FalconMem::ImemSecure { 1 } else { 0 })
+    }
+}
+
 register!(NV_PFALCON_FALCON_DMATRFFBOFFS @ PFalconBase[0x0000011c] {
     31:0    offs as u32;
 });
-- 
2.52.0

