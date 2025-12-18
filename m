Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 55D78CCA2D6
	for <lists+nouveau@lfdr.de>; Thu, 18 Dec 2025 04:30:36 +0100 (CET)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 2F94E10E6F3;
	Thu, 18 Dec 2025 03:30:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="lNVphVOg";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 44C3544B0C;
	Thu, 18 Dec 2025 03:23:05 +0000 (UTC)
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1766028185;
 b=KgzhPCteW936ZvGjvcw9UOiFn42RHADNoFWDE2QlFepTAG4j10nASQZXbDvj8lyh/5Fp3
 1bSxpiw31L5WkSsu3KmTyD1rQySqDgFAQ4i+RILWseKMYMZkHloqG2IbkOiRaf6YRYDIj04
 xGS6GL5bH+knyGNlAxAw5yTC6NdDNoC2kPvYDaXq3CR1AhsC6APi7LM7fbZRXD8F+6WR42S
 yCMG5v8qnyIRU8Pv04tloj2SPDQsZ/oOKv9iqLZsGKBW/OynhNJN76mNPCw8mQGLc9AaSkg
 ADTD7YfkQ/WFkQP22KS/3Iz0u/x5+RSRWz5dyKAOaV1kEqch0CaYhu8xhB3Q==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1766028185; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=T3jshI0b4h4q7MvAwfag0z6A1jjGq7+f+oSKWmK9HxY=;
 b=qsE/+9CSnSvMffyAL9phYuxPKtJfwryXOeXwfT0EtFYVTDqYuZI099cQ7H8Zm9woFbTEQ
 xOKOpY/jJysa5H7ECOmgCwBfpTnSsbx+DNzJNcDRNcGwf39H3Ss6g/9yDtth1n8CTv6IrjF
 uloOeMyWNI62GBNhhy96gWnfw5q0+rVwOG4PaXzEIwOV8C9kEGaoJ2kj1qjjMh7U4TPd5cf
 8TcXcCr+laCIq6Q/e9WNtrQqSlXx9cKhXTofZ+qrnIA6sm9QKID37qE70DRKdCNpvOj7Sb4
 pVk5tKQ7PFtL0KPTMeYs+hWmNPxa0ORh7cTXpnzxHy1mkEHdTMlXb9+qykQA==
ARC-Authentication-Results: i=2; mail.freedesktop.org;
 dkim=pass header.d=Nvidia.com;
  arc=pass;
  dmarc=pass (Used From Domain Record) header.from=nvidia.com
 policy.dmarc=reject
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=Nvidia.com;
 arc=pass;
 dmarc=pass (Used From Domain Record) header.from=nvidia.com policy.dmarc=reject
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id 6550544B0B
	for <nouveau@lists.freedesktop.org>; Thu, 18 Dec 2025 03:23:01 +0000 (UTC)
Received: from MW6PR02CU001.outbound.protection.outlook.com
 (mail-westus2azon11012029.outbound.protection.outlook.com [52.101.48.29])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 0F9CE10E5EF
	for <nouveau@lists.freedesktop.org>; Thu, 18 Dec 2025 03:30:31 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=d9Sn0zdHsomrJot9uewrTQvqbpX7l8ZyGuIn48LQ/yaQYTaDTKrLy3BKs9b+iOZDlFQblCx9iuHCdPTuBVnt+I3p5icdZR+f4BPkSgbzV4oP1z3KA9yyg98R5cBJHM56mJG3JUBy8ejMBK2uYtEh4l6RZ5fYs+gSygUOkCMSzoFFaD9RYl06Kdord98KudX+U0dVMeQgA+a/4RmT2LKBYV5ASJnj8hCZRSeL1fBSnYaGCUJV+chyfMo/eT6zKvrc3CMJi6QAiA1uwTAgVtrWzlGDnaThh/Q2OzRIfyldW0XLRDrzFnMb22WYP1rrl5nhN3LqJhe5eGRQ3hIaK8ZkTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=T3jshI0b4h4q7MvAwfag0z6A1jjGq7+f+oSKWmK9HxY=;
 b=QwFmkgnYgsBtTt+xN+Zz6x5vtmE0C50keo0MSYj65ve4DTqhPnH1O+h9tWTVts9eXbgB60B5svlpCD1weaTPgP7wZY2eM8O47SecqRTP4WvwfySk9hNrEZiPbVg4OGhx4lAwtEEpRYvVbfp54dEvskOg/BgZe/EYNQ6DZNTJs40dvYQCit5x5OmPYlmFk2xFQDOcmsYLRp2lbRLmF6hZ7F9eNnbyVJMvz0x3Xb2hmD3+u0k9a6FKx0MA5rp2zzp97FsmF0Ym1T8D31TaZs1/NLo7uneGGjpGE1qVoelylQ24uu5SijTAP66OvP95kb4EFAXNzsM0CjEnG6Ih9L9MPA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=T3jshI0b4h4q7MvAwfag0z6A1jjGq7+f+oSKWmK9HxY=;
 b=lNVphVOgaGtwGJTFGGyshqQeTc/kjcsFAhSM3sTY4u8HXJjfgRPe8xiEnsLndz1DdG/8XjuwRyldW/qJ3NudmPzdjNbJ0KG1Wliw6ibYlde3xtVQB97j4SM+bGiVQ2x1XKP76Hb5+Rfr+J94/1ZuRe9aSYYL/ARJNA3xBVsTUMR+HxB5HoEVuWfxLyx7kWVYf6/ip9UaU8j/wssFiiTv7dfV3NuROHDehse4nGDjFJJE6znjmMKJOT6NpnXhj6SFngUQkrL/FEJ/Qk5QeusYJfUnXvwgA+H1rInWfLDSwhYJpn5w5iEWdtL2EgTTgP9rBic8BQZwoJ1Hl+/HMvyXiQ==
Received: from CH2PR10CA0022.namprd10.prod.outlook.com (2603:10b6:610:4c::32)
 by SA0PR12MB7090.namprd12.prod.outlook.com (2603:10b6:806:2d5::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.6; Thu, 18 Dec
 2025 03:30:27 +0000
Received: from CH3PEPF00000018.namprd21.prod.outlook.com
 (2603:10b6:610:4c:cafe::e) by CH2PR10CA0022.outlook.office365.com
 (2603:10b6:610:4c::32) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9434.6 via Frontend Transport; Thu,
 18 Dec 2025 03:30:26 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 CH3PEPF00000018.mail.protection.outlook.com (10.167.244.123) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9456.0 via Frontend Transport; Thu, 18 Dec 2025 03:30:27 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 17 Dec
 2025 19:30:09 -0800
Received: from ttabi.nvidia.com (10.126.231.35) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 17 Dec
 2025 19:30:07 -0800
From: Timur Tabi <ttabi@nvidia.com>
To: Danilo Krummrich <dakr@kernel.org>, Alexandre Courbot
	<acourbot@nvidia.com>, Joel Fernandes <joelagnelf@nvidia.com>, John Hubbard
	<jhubbard@nvidia.com>, <nouveau@lists.freedesktop.org>,
	<rust-for-linux@vger.kernel.org>
Subject: [PATCH v4 05/11] gpu: nova-core: add
 NV_PFALCON_FALCON_DMATRFCMD::with_falcon_mem()
Date: Wed, 17 Dec 2025 21:29:49 -0600
Message-ID: <20251218032955.979623-6-ttabi@nvidia.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251218032955.979623-1-ttabi@nvidia.com>
References: <20251218032955.979623-1-ttabi@nvidia.com>
MIME-Version: 1.0
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.126.231.35]
X-ClientProxiedBy: rnnvmail202.nvidia.com (10.129.68.7) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PEPF00000018:EE_|SA0PR12MB7090:EE_
X-MS-Office365-Filtering-Correlation-Id: 0800ba8e-867c-4d2f-a883-08de3de5c9a2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|1800799024|82310400026|36860700013;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?CvFoYr/aIB/nf7xw9YUQBw3zq2lBq1L+A3/UrkoIKYhBrWJkbU9nQc2gwDKN?=
 =?us-ascii?Q?RfwQdffhTZZhzU0ID9+qLAO6P1NaAtqIJt5SjjjTDKInX+NROVA5UMU16QQZ?=
 =?us-ascii?Q?YaUouw/1WjvfSP4G9VNE/cRJEApnArqNiH8zytfAEU+p4SOU694O0oeVSXNu?=
 =?us-ascii?Q?NnN0856lE/dNId2ubiC5UkFmrZOopNc4o05D5RIeweZrJ+RFQT+aBmKK+1JD?=
 =?us-ascii?Q?qxgERNAl9gegFJ3OOl5AKqESIWPXw1vtmyRXcgL2cMrsNabbxBO0R6zFynbp?=
 =?us-ascii?Q?TC+V8E9sFribaDUkefvXbVT58shuSSWQAt72M2PnAPqGjK+r0TDYh+hZSTKw?=
 =?us-ascii?Q?CIles+yG48+1E6P8AOu7fyPJFj5ZZjMpn9pQ33N/kB+oy7Nv4/nXbzO8TgZp?=
 =?us-ascii?Q?QPOAnGdmPkdH2+Gz99x8AtMhpxJAH+ROPui3kJ3nJAy5V/k+AS2rNWtUbXE8?=
 =?us-ascii?Q?QOg1akavdZfkMTKTAwg6hNf4HydGuiF59oI06wmehjU+hmXCqsgzmJ6wswM8?=
 =?us-ascii?Q?tu6zPUr3oAwWbiGb5W+Un1MynJjp9LRjid7cn2ds7C9qTNpQj2FBsIqRazDD?=
 =?us-ascii?Q?zegKbVAo5S4WIwSnnF0rX/ezsylsEVCxv9fcJ3ZegEdrcobpRM9H0yiNeWaF?=
 =?us-ascii?Q?HzM244Eql/8wgg3OZuVa2MbxMLA640UghFpCUEvggegQmeDMveWAlMkZjMZc?=
 =?us-ascii?Q?Xq3yGKjG+YMPrwcJ9Igib4wx6/anVw8kiH/5qByGHaXHwnCIKdckjYbAPYyE?=
 =?us-ascii?Q?qnCbXhsWMkzShCwyUQHGEeRlluO18aAhcFNfxIT2MAQsa324w0yypfg+Av+X?=
 =?us-ascii?Q?rP/Gm4z4r1peCuajxfVY9dbud3FV0emzTT9avnnGHAW9uHXcnl+oALpAlP4N?=
 =?us-ascii?Q?0QlhOLM7EIQjHSvFkD+A/L5VTVCP5YcqeoVOvNADITkZJQ8uTzRkAWhqz7Dl?=
 =?us-ascii?Q?gZy27/jgjVBn7gtKx9CSsV9qmn1cTuEIWGI7NWmQX24m8uVF1Tw5WQ729h8v?=
 =?us-ascii?Q?BDuvQracOFQWHjHN+R8YyH9+1Dxzpn39o1jfRLF1JLmTtqbHiL0u3BpTzz4x?=
 =?us-ascii?Q?117tx8SFAUepfdpEgl0r7zjvf8rIhJpoE3HQKaPM8jYmLt1stNKopOH9XFmF?=
 =?us-ascii?Q?Em865iCptpZlPEgoEL4Dz9kbcu6YIDBe1o6SpAI+OxO7S9SWabQIGLoZdLU8?=
 =?us-ascii?Q?wewJqiODyxHKb1eD5PS2ToUf1ps9ryd0SfgE2sPpDleDEahdcd0io1a210qG?=
 =?us-ascii?Q?RzJWEK313RJmZ3nnn7BA+6iI3aTKg23txQtMqesV4jrBBCaNCjfJrzloHGmD?=
 =?us-ascii?Q?GpRiJlNCZxsjobwIBIzakFWJ7hqNg6kfHKNDhS3gISP9o8VSa8Jp3Svl7Qel?=
 =?us-ascii?Q?P8XGUPT41xU7d5tIANsLIsskamuQncvLZUaJVNvQtTH8GK/dR9OuTJQK4YY8?=
 =?us-ascii?Q?0s9ivNDHZDQnOyC7XimxIbcZRdhuDmsj0/pHrtDOuT4Ecxi6Gb9MPTFvl/B+?=
 =?us-ascii?Q?pIYoWiHPJdLPwRib4LtEa0g4GEMXuvXHO+bFjtjlT9wdfV1jHepBXtMf2p2M?=
 =?us-ascii?Q?eMQCLS60r4iLMc9nNRk=3D?=
X-Forefront-Antispam-Report: 
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(376014)(1800799024)(82310400026)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Dec 2025 03:30:27.1174
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 0800ba8e-867c-4d2f-a883-08de3de5c9a2
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CH3PEPF00000018.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB7090
Message-ID-Hash: 5AT5IK6S74WJ33I3MNCUZU5TWMLMCMDC
X-Message-ID-Hash: 5AT5IK6S74WJ33I3MNCUZU5TWMLMCMDC
X-MailFrom: ttabi@nvidia.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation; nonmember-moderation; administrivia;
 implicit-dest; max-recipients; max-size; news-moderation; no-subject;
 digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/5AT5IK6S74WJ33I3MNCUZU5TWMLMCMDC/>
Archived-At: 
 <https://lore.freedesktop.org/20251218032955.979623-6-ttabi@nvidia.com/>
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
---
 drivers/gpu/nova-core/falcon.rs | 16 ++++------------
 drivers/gpu/nova-core/regs.rs   |  9 +++++++++
 2 files changed, 13 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/nova-core/falcon.rs b/drivers/gpu/nova-core/falcon.rs
index b92152277d00..44a1a531a361 100644
--- a/drivers/gpu/nova-core/falcon.rs
+++ b/drivers/gpu/nova-core/falcon.rs
@@ -454,7 +454,6 @@ fn dma_wr<F: FalconFirmware<Target = E>>(
         fw: &F,
         target_mem: FalconMem,
         load_offsets: FalconLoadTarget,
-        sec: bool,
     ) -> Result {
         const DMA_LEN: u32 = 256;
 
@@ -516,8 +515,7 @@ fn dma_wr<F: FalconFirmware<Target = E>>(
 
         let cmd = regs::NV_PFALCON_FALCON_DMATRFCMD::default()
             .set_size(DmaTrfCmdSize::Size256B)
-            .set_imem(target_mem != FalconMem::Dmem)
-            .set_sec(if sec { 1 } else { 0 });
+            .with_falcon_mem(target_mem);
 
         for pos in (0..num_transfers).map(|i| i * DMA_LEN) {
             // Perform a transfer of size `DMA_LEN`.
@@ -551,21 +549,15 @@ pub(crate) fn dma_load<F: FalconFirmware<Target = E>>(&self, bar: &Bar0, fw: &F)
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
 
         if let Some(nmem) = fw.imem_ns_load_params() {
             // This code should never actual get executed, because the Non-Secure
             // section only exists on firmware used by Turing and GA100, and
             // those platforms do not use DMA.  But we include this code for
             // consistency.
-            self.dma_wr(bar, fw, FalconMem::ImemNonSecure, nmem, false)?;
+            self.dma_wr(bar, fw, FalconMem::ImemNonSecure, nmem)?;
         }
 
         self.hal.program_brom(self, bar, &fw.brom_params())?;
diff --git a/drivers/gpu/nova-core/regs.rs b/drivers/gpu/nova-core/regs.rs
index 82cc6c0790e5..c049f5aaf2f2 100644
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
+    /// Programs the 'imem' and 'sec' fields for the given FalconMem
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

