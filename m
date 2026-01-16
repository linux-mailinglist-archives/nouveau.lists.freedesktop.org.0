Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F8B3D388ED
	for <lists+nouveau@lfdr.de>; Fri, 16 Jan 2026 22:50:48 +0100 (CET)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 853DC10E272;
	Fri, 16 Jan 2026 21:50:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="G7xD5jFa";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 3DB7844CAB;
	Fri, 16 Jan 2026 21:42:11 +0000 (UTC)
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1768599731;
 b=wKEgLSckDSWYWdpBpwxXqpAiVHJNrRgTEH6UVddki4rvccYpjE7Jqa6onLPbXXGyqY46l
 SUa1Y4RP2iXpu+g2gALxSWskVIxhN97fzC/D2KEas6v5xlAyHEMIdH4Nvk9P4g0Oj88junI
 faqEHgePRGav7t0FG9daO1q5XUxOYGpnCcSU3kSd0bU26hwFnIKDG/LKSOlxHfqkV7VQIZL
 rjPmDKtZI2PGCbSjVikrHGDyCOM1ZrcgEh+14th0c3+dY6KknB306+SjU/UIqFrnjmGdTao
 +NLB2eTqDb8P82kjjW8+Hrb7kAaw6b1YyfXZMqBDmnA29EP77NDIDQNwuXnQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1768599731; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=jsdJjAszzNmQrNWGonSKHtIrOeUTa0xb+b9DGsMG5D8=;
 b=Now8nx4gwMVVJt4TVT7Ecbqyy+VhpkDeHbhrk/m5k+KU1lKIkPbpUkLVkQXpoWG5k4ASa
 6Tt0pxFU4EX6anpHyPuLIWrBsQavrwNoUXAcsXx5Zq3QRXPFyEw/sMBdcQ+hkSG7+x7eOKt
 sVV9nHK8mMhKeptkofb6ECZjm+qtHdI9ZdnMtE4X305hxANsOaBQqTODeYrAJpjospeenp3
 IY5cLh9ajbaNxwg3J9SBMbfuq6xJDDCg2OiLj700XUOCJbdlNZCjENCPoHe4KntOBocru3i
 QCV2TqtJazi0McyNnpAT9c6mLFoxFn5lBwV2gR8muSEfg13RCEzUsCY5B3QA==
ARC-Authentication-Results: i=2; mail.freedesktop.org;
 dkim=pass header.d=Nvidia.com;
  arc=pass;
  dmarc=pass (Used From Domain Record) header.from=nvidia.com
 policy.dmarc=reject
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=Nvidia.com;
 arc=pass;
 dmarc=pass (Used From Domain Record) header.from=nvidia.com policy.dmarc=reject
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id 3C1BD40744
	for <nouveau@lists.freedesktop.org>; Fri, 16 Jan 2026 21:42:07 +0000 (UTC)
Received: from SA9PR02CU001.outbound.protection.outlook.com
 (mail-southcentralusazon11013029.outbound.protection.outlook.com
 [40.93.196.29])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 42CD110E27C
	for <nouveau@lists.freedesktop.org>; Fri, 16 Jan 2026 21:50:43 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GO4iqbkOqfmhTpXa/u0xsNA3DnCkQ55lr705kB/Jin5RGzOshdORUkO7SMWHkj7QW0/GiUzsnLA1udAnYYLI1onw0oG2uRvWf1xUQ//q9vD4Rd4VeYs4Uk9we+MTzxodA0d1BQXsaGQklBpj5Wg2FfKE8xfPc7lCV2TEsVnQpDGgV7EhmKI1VKsg+4MlTQntKdh0xWtppClvr3ubdkY1hOSk+QP4Smgj0XfoujuVI5BBgjpsCvHMqCu4o3k+Qk2vh8+3Lpgx619AqfO5OYm95HZg5HindyDqfYR2IjZ8W78VRPpzCYURAMpYMwqEsBwsvz7W67W7PKeGdKs8AlhU4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jsdJjAszzNmQrNWGonSKHtIrOeUTa0xb+b9DGsMG5D8=;
 b=E9oqM2qUEIKR+B73kaPCgOK6s3TqgeF/YV7F6q7Qy9hD3NQsBRrTnGNfb302uWRW1KiocnRKPT9B8p44bqm4dz6fZ2j/jk/+mb1R2/Eu0pJQasNL35IggCmefH2suWDux97m5rdz4dbO17qHGpKGOw+y+L4EzyPFGhTEPIuBNH4PnOY5jZs3Q8s8Zn3uc3lgXv0shWJY8x4ham+c1ZlB6Gj7iTByWqchA0LupNI6dAP6URqQXEJnwW8WaJN2rvYQqwGvPf0T3rPVlRdk2j6w5ckfXjM6cQOS8zN3KDAm3xHEl10hmMKdpnUUUrddk6DTAqHkb58pe2dslC7YdS9GiQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=google.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jsdJjAszzNmQrNWGonSKHtIrOeUTa0xb+b9DGsMG5D8=;
 b=G7xD5jFaO4ILH/lXC2suICzmQvdyOER9TOSdhR/R41f4j5hh7JVp5ogZkR0s+waMhQR867z5TeKQ7jyAnMy5tbFLRHUEiD0v2l1w3AEWIdkm+686z+tE699dE1UFF8Sr9OCCsbzkMe6/eXtTVyTUO9T3312TjCQPK6RyCkNNImMtE3f6Fpzdrqg5FVgQvUqr6uukln4sQtCuM5OsD5NCnNKjffbNFeL1w7YCP8PFsk/T4tnC0QqZOa3pkZPC5A1F/ApyIVqqmSRCqkXDCC117DqIRjro6rjLr9v3POPEE9kghUa6hDkjcV44I20ZVl6gWbA0XyA6Enn4VBBFGfX5RA==
Received: from SN7P220CA0009.NAMP220.PROD.OUTLOOK.COM (2603:10b6:806:123::14)
 by DS4PR12MB9586.namprd12.prod.outlook.com (2603:10b6:8:27e::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.7; Fri, 16 Jan
 2026 21:50:38 +0000
Received: from SN1PEPF0002529D.namprd05.prod.outlook.com
 (2603:10b6:806:123:cafe::5f) by SN7P220CA0009.outlook.office365.com
 (2603:10b6:806:123::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9520.7 via Frontend Transport; Fri,
 16 Jan 2026 21:50:38 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 SN1PEPF0002529D.mail.protection.outlook.com (10.167.242.4) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9542.4 via Frontend Transport; Fri, 16 Jan 2026 21:50:38 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 16 Jan
 2026 13:50:18 -0800
Received: from ttabi.nvidia.com (10.126.230.35) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 16 Jan
 2026 13:50:17 -0800
From: Timur Tabi <ttabi@nvidia.com>
To: Matthew Maurer <mmaurer@google.com>, Danilo Krummrich <dakr@kernel.org>,
	Gary Guo <gary@garyguo.net>, John Hubbard <jhubbard@nvidia.com>, "Joel
 Fernandes" <joelagnelf@nvidia.com>, Alexandre Courbot <acourbot@nvidia.com>,
	<nouveau@lists.freedesktop.org>, <rust-for-linux@vger.kernel.org>
Subject: [PATCH v5 6/8] gpu: nova-core: use pin projection in method boot()
Date: Fri, 16 Jan 2026 15:49:57 -0600
Message-ID: <20260116214959.641032-7-ttabi@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: SN1PEPF0002529D:EE_|DS4PR12MB9586:EE_
X-MS-Office365-Filtering-Correlation-Id: 14a921c6-3c21-4ea6-f455-08de55494949
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|82310400026|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?2bmAZk9UHuXpO+suD+FaxNGDcSxshM+DmzNsLlbxfPG4RR5Q+q2nQF5IsNjx?=
 =?us-ascii?Q?HEjtUrzZxo31ORTzaDUzO3ytzCWx12CS1znLbuXMaOsRRPK3R5RnistYhRJl?=
 =?us-ascii?Q?qzTkWhQooPJ7KMGAs/f41v3PZmtYlXIRIMPVEneieatPM9H8x1hg8ngPlIQf?=
 =?us-ascii?Q?NHhvhPEZEPnSaIQGQ8IpxPtXAt5VKOAlfAgEcNZyfCoLkL99ESFH/R+8UvWP?=
 =?us-ascii?Q?DWCzbTH/DLgagQaw06Xn8fiXtkl/ejMu22kNfcpqdTQ7BzJutIL63A2vrXEA?=
 =?us-ascii?Q?QfbYR74rBDxp8mx5aJBNPu7qMv+p1OEboODad96/40ufedf/IJxBTl4zFBtM?=
 =?us-ascii?Q?0AWTHqFZELuLlymv9uuu7nDh13HKFeOeN7dS79HDyjAf6+yb6TI6WO1LaEKM?=
 =?us-ascii?Q?0YGLOczqRipgrd4/EgPg1M1KIeX+jjf9DJbrm9N42K6ilUeSq7uYIVmbLdpq?=
 =?us-ascii?Q?hWL77eOkefKeEcD/5SKO0uFZf1LSz1nISsWq/LMfPwQoIwmpJMAGNNK60Nms?=
 =?us-ascii?Q?PhRfct3xWYJa/dhoSbon5eBnn0CrOKju4ffRkddeSjXbgiPJPvSHoHRre5nJ?=
 =?us-ascii?Q?xrArSZQD2C2BR7xEvikLA4UAMAs7e4lJEG/EC08bMUQRYW3c/mqO84aak3pH?=
 =?us-ascii?Q?NcRCS6LRv3Y4DLtQaH5YNOuRrmwZeFjeEWvCqmU8naA/WfcLNVCrfEe7RIbD?=
 =?us-ascii?Q?XDQm2sWKFdYX/SQAxQCWxQr0U7VUO/wRdfCzDPIHS1+KfeLCNUK6/samjhHZ?=
 =?us-ascii?Q?VVJe3m6QoeIr7lYnQ2COH7FPc2+1IzCVQ3sOZNKweDQzWI05LvL6Gm++S+gL?=
 =?us-ascii?Q?aabae2Zl75HeKhTrDIhMVpIrz5YTMBWooPdq8yL/pfjENGp1kFQjWwpIZLZU?=
 =?us-ascii?Q?Pjg0QurUX/fBxl+5GUcJn0guj3veK8FMOn/IXuYmpM6dNssyKbqDauecsVGE?=
 =?us-ascii?Q?8zHsdfzamrkGuHwYYJi2VNLkStUcVTkbOJXqR0sae4vx0DwEKGiBePNKoVPo?=
 =?us-ascii?Q?dzOrV2aJofJE0frx7xJGDeDbEYCcCk88dlbPNflBLnyFXEgDg6Xw9a3FnDm6?=
 =?us-ascii?Q?5MMilDL7Omz7grhXjssStHx8WIZgzI5p2n73oe631uBMb02PAzIGbvHudzoM?=
 =?us-ascii?Q?Jlz9XjbNtAR5r9jpfe4+MWYiEYqxDIDSa23K2Pi42VWWerif4MQeEdth4swy?=
 =?us-ascii?Q?vkE3fG5tjHQa5Tj0L6bLRQyD6ug91d9JISVAavcauvUp6PFx9B4OO3qizvoT?=
 =?us-ascii?Q?MggGHm4HGPoZGm3W3BWrFIFK3YQWDPNIXqza7FBy8gdPDiFI1bRFM0xyDFcZ?=
 =?us-ascii?Q?IWkah2Ye7lV+4uvk2/1U8GpFw3aPI3KRg2YFuKZ8Q3vXtuTTgdQru5BjP0RD?=
 =?us-ascii?Q?1++olh0ppmMEZDasJVuHplxAmMeO4XyDM5jFOfc0BXToTq+SjIdZ7WrP/tAT?=
 =?us-ascii?Q?S8vrVBSbQUH75xxLjQCDVWTz+VTyDjyQtgxnUqooXwzdrJRDhAzxZsm5LlKW?=
 =?us-ascii?Q?JsRcqE1fv9nOb8oq9FyVxQYOOIhV0pc2zpSCtmONjeaJiWBOE6754AcKZ97K?=
 =?us-ascii?Q?ZNJ0idJyUknK7ctTg/o898BDym/4YcS3g9ojuRF+O4LvVbwjRtGCMXPsCepQ?=
 =?us-ascii?Q?2PKCYBV2ut2TAyqoc1cXTsUTAEtvUmp6rvJ9ogMdk+Dqv5v8aCJwVIphGAms?=
 =?us-ascii?Q?JvGbvA=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(376014)(82310400026)(36860700013)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jan 2026 21:50:38.2250
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 14a921c6-3c21-4ea6-f455-08de55494949
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SN1PEPF0002529D.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PR12MB9586
Message-ID-Hash: DEEYIBM6UUOYSNBQAWQZXG7VRXJCDJ5H
X-Message-ID-Hash: DEEYIBM6UUOYSNBQAWQZXG7VRXJCDJ5H
X-MailFrom: ttabi@nvidia.com
X-Mailman-Rule-Hits: member-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/DEEYIBM6UUOYSNBQAWQZXG7VRXJCDJ5H/>
Archived-At: 
 <https://lore.freedesktop.org/20260116214959.641032-7-ttabi@nvidia.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

Struct Gsp in gsp.rs is tagged with #[pin_data], which allows any of its
fields to be pinned (i.e. with #[pin]).  When #[pin] is added to any
field in a #[pin_data] struct, fields can no longer be directly accessed
via normal field access.  Instead, pin projection must be used to access
those fields.

Currently, no fields are pinned, but that will change.  The boot() method
receives self: Pin<&mut Self>. When struct Gsp contains any pinned
fields, direct field access like self.cmdq is not allowed through
Pin<&mut Self>, as Pin prevents obtaining &mut Self to protect pinned
data from being moved.

Use pin projection via self.as_mut().project() to access struct fields.
The project() method, generated by #[pin_data], returns a projection
struct providing &mut references to non-pinned fields, enabling mutable
access while preserving pin invariants.

Signed-off-by: Timur Tabi <ttabi@nvidia.com>
---
 drivers/gpu/nova-core/gsp/boot.rs | 14 ++++++++------
 1 file changed, 8 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/nova-core/gsp/boot.rs b/drivers/gpu/nova-core/gsp/boot.rs
index 581b412554dc..68a8acaf8c54 100644
--- a/drivers/gpu/nova-core/gsp/boot.rs
+++ b/drivers/gpu/nova-core/gsp/boot.rs
@@ -159,12 +159,14 @@ pub(crate) fn boot(
             CoherentAllocation::<GspFwWprMeta>::alloc_coherent(dev, 1, GFP_KERNEL | __GFP_ZERO)?;
         dma_write!(wpr_meta[0] = GspFwWprMeta::new(&gsp_fw, &fb_layout))?;
 
-        self.cmdq
+        let this = self.as_mut().project();
+
+        this.cmdq
             .send_command(bar, commands::SetSystemInfo::new(pdev))?;
-        self.cmdq.send_command(bar, commands::SetRegistry::new())?;
+        this.cmdq.send_command(bar, commands::SetRegistry::new())?;
 
         gsp_falcon.reset(bar)?;
-        let libos_handle = self.libos.dma_handle();
+        let libos_handle = this.libos.dma_handle();
         let (mbox0, mbox1) = gsp_falcon.boot(
             bar,
             Some(libos_handle as u32),
@@ -231,13 +233,13 @@ pub(crate) fn boot(
             dev: pdev.as_ref().into(),
             bar,
         };
-        GspSequencer::run(&mut self.cmdq, seq_params)?;
+        GspSequencer::run(this.cmdq, seq_params)?;
 
         // Wait until GSP is fully initialized.
-        commands::wait_gsp_init_done(&mut self.cmdq)?;
+        commands::wait_gsp_init_done(this.cmdq)?;
 
         // Obtain and display basic GPU information.
-        let info = commands::get_gsp_info(&mut self.cmdq, bar)?;
+        let info = commands::get_gsp_info(this.cmdq, bar)?;
         match info.gpu_name() {
             Ok(name) => dev_info!(pdev.as_ref(), "GPU name: {}\n", name),
             Err(e) => dev_warn!(pdev.as_ref(), "GPU name unavailable: {:?}\n", e),
-- 
2.52.0

