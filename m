Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DD02C9DD6A
	for <lists+nouveau@lfdr.de>; Wed, 03 Dec 2025 06:59:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7EC8910E70C;
	Wed,  3 Dec 2025 05:59:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="nJYzrjtO";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from SJ2PR03CU001.outbound.protection.outlook.com
 (mail-westusazon11012067.outbound.protection.outlook.com [52.101.43.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E11510E70A
 for <nouveau@lists.freedesktop.org>; Wed,  3 Dec 2025 05:59:33 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MdcJfTFXGF7nYda77SLhb06qlQ365Ksp36IgRipuoY7U8WigjkLmpTo015g8SVXTCItsW3jPVSESfJnE2aV+pp9IyiTyBLSbQl+9l5w0eI4lpfDZwxBp3z5reDF/F4ed2hz3Y8IEoJBENI8vVnZTNNBpSLEZ+lwaf5CHVx3gMjNbdxMNiwogWuncXVssciAGZLpeRfcCCkLHAfs+fjXEObuTKN1nrgMGNss445Wll0CYl8Ky7/65nZfPJSnZuDEKy5/KbhndQBvQiGdzXnCVVj3lQr297RciwB5L0bbUX8bKf6h+rVHHGVp3VcoBjX4dQsslb84OjJILEsFT/p2ISg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XbwIPLOSpSuSX6iuNz2sv7q1IcyLr0C7nSpj1kl0nyY=;
 b=XxWTVbaZo2Nu1wGUjcwnFbpQGMpD5UquMzPK0z762Z9UdplnFjIPnyRH9OnqRlHTYQ2p7zFn4Bygj6dth43XuE6X8WTScHlW1LrY9N4IAZyOkdSKu8MeDiIE2TxCu+GLKyLcxfbAWYdTauRKZNQ5EHRiPtfMkvJhAvAzd73SErqiKa3PzDERU5a4HWjZ6WQpBzFuwKd+4AU3GAbr/r5ovuYBWxSURn3tZ2WoOdp0RLWOvYR/t7tRcSWDEWWyxMITVZBL4Lrh9JGF5xvA+T7H+M0/5Cm4xeer+cUjZw97bIbauBlE/ZLEIS7pyyQr0SQKdhQl8XQdJ5y0KjwuKFO+Sw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XbwIPLOSpSuSX6iuNz2sv7q1IcyLr0C7nSpj1kl0nyY=;
 b=nJYzrjtO/aoGYbWeLoo0hEoQmX8qLB32Nj0reWGgThOwKmNI8rPrZBPk0yLKuXnD1gvn894h7BJfXgF6eGKk8VVRPlsYBPEbxAn2u4PF/PlGstz3jejOPOe7IuaTaH6gbcx8WIhOOtIeBg/ysjIHK0j4a3+gdrpoBH4R74TkQ3Y9H3eCbYw4G3JSbsQb/YCRmbS+hu+MRs4A6BI3IGXxSNC8a4QJJzZfaahpztliAng0215BKT//0kH7qwpVLT8GOVAmiJH1km4CNCugyGqzugQvL+Q30lhiFhaS0KtKVbcncypuBmPeXjwhZ0z5E4RALRDOeZAC3zJKc2ZsxibWrQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 PH7PR12MB8180.namprd12.prod.outlook.com (2603:10b6:510:2b6::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9388.9; Wed, 3 Dec 2025 05:59:30 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%7]) with mapi id 15.20.9366.012; Wed, 3 Dec 2025
 05:59:30 +0000
From: John Hubbard <jhubbard@nvidia.com>
To: Danilo Krummrich <dakr@kernel.org>
Cc: Alexandre Courbot <acourbot@nvidia.com>,
 Joel Fernandes <joelagnelf@nvidia.com>, Timur Tabi <ttabi@nvidia.com>,
 Alistair Popple <apopple@nvidia.com>, Edwin Peer <epeer@nvidia.com>,
 Zhi Wang <zhiw@nvidia.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Bjorn Helgaas <bhelgaas@google.com>,
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 nouveau@lists.freedesktop.org, rust-for-linux@vger.kernel.org,
 LKML <linux-kernel@vger.kernel.org>, John Hubbard <jhubbard@nvidia.com>
Subject: [PATCH 04/31] nova-core: factor .fwsignature* selection into a new
 get_gsp_sigs_section()
Date: Tue,  2 Dec 2025 21:58:56 -0800
Message-ID: <20251203055923.1247681-5-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251203055923.1247681-1-jhubbard@nvidia.com>
References: <20251203055923.1247681-1-jhubbard@nvidia.com>
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0150.namprd03.prod.outlook.com
 (2603:10b6:a03:33c::35) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|PH7PR12MB8180:EE_
X-MS-Office365-Filtering-Correlation-Id: fcbe6cd3-970c-4651-56bb-08de32311fbf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?BbRHCIhlzv2u9bDkwAFYSYaExphbNNzvjoTQerwe0sPMtW8RZn1GAuK/xEkR?=
 =?us-ascii?Q?QAvVFjirLQKmZ7n7+sQnRx82FWh1AFw5E0gV2u2YAw7vD+tT3kQD7l8K7s8+?=
 =?us-ascii?Q?LaiQfO5Qy9SbzRiSgeDbi1wyRIzOSKc1qpHf7csC5q043yX4cLWwE/V9GC2i?=
 =?us-ascii?Q?Bj2UqLC6Ch45o+4wkTqhKbCFy45sQByh/WecQZ5vbYGqSPVwagYmQNzsgH+3?=
 =?us-ascii?Q?ETOP07osWo6/hSW1N3qfQelC/trBz+OYSDr9irqNjEfP54nTzzAbAmjKbSEZ?=
 =?us-ascii?Q?ICHJDIK1Nx8LZc7aBu0MKnkzrNZYmDc6XhjFl4TTG4feo1PhlRluUKcp6oh/?=
 =?us-ascii?Q?BbuyMh9eIip/Ie7rmg5Gxlli/9RgRh/yqMERz8zjoH08pizx4xHT8LGQv3wO?=
 =?us-ascii?Q?29qV3qlWX363r2/IXR8oqoDps/V+OX/UvonBZVP6d/qb5gyHqH3FKYdzFno2?=
 =?us-ascii?Q?K84GGTUGCEnme+g86g+Jh0pdm9ngm4tOksXk0i++kdnyuaIawFXOBPneCZj3?=
 =?us-ascii?Q?pWFgSaxg/qu+ABdZq7dlin0vOLLrEsYOijX18Ge4LHNa47OhsBDJnImCquhD?=
 =?us-ascii?Q?dsJx+2Hv3oJiikCJXiZ+wOk2xp/4feh767kKlTY8MrTYaftJzFxQt2QN9VIb?=
 =?us-ascii?Q?uSLYpaL7Qm7pQQklMHRtj2kZR6uZc7bSJpoDoxxYpRSoyNX02vxAmZOahg87?=
 =?us-ascii?Q?um0YtJLjFMmU/UCuPsSsw0mG7MBsGJSFv6lH0ZLUO8LkhO35TrIviCDKD0TU?=
 =?us-ascii?Q?tmOvBP4vszIF2657pd2LwFRxnRUeaPJNsiv9Zi6Sy0Wu63Wd4gjT0PTzwnJp?=
 =?us-ascii?Q?e4mTfV+c40ChfDPaNYPn5fpnxszktab2B0nUqMzWeSJQgT7go25VCDa6Mrut?=
 =?us-ascii?Q?0RgutAi/FdUSZe2CqxePBJZXqg/4gT+AoBgiiIXdhIeLe4es5cztFJWua7e7?=
 =?us-ascii?Q?P0iEOv8Gb0l1ujarZuyJOEpOnHPjLNH80DCFOZDSf2RHQRMLeOkg+mGHb8bv?=
 =?us-ascii?Q?txLOldl9P3Sgrm7uW9+rfMTmL9tqT8QcXVsUzKigrV01gZwkb4MD3K3jj18U?=
 =?us-ascii?Q?aLERbswxbGO5lH4/5AsIHLQ3MuQYOCJUTCQsHGNOow5NtySkSq9Edn3ieyIg?=
 =?us-ascii?Q?/qOXYB3bTpc0ISsShZIGBjDUwwR8GNDBeg8AvoN/OfIibsP0mdO1fmiC/5mv?=
 =?us-ascii?Q?cByqYJawnqH9iu6YDNiDgwpw4vbLEd1Z0oJv0uQwnw4dHvKgHOuxhEoeIFN2?=
 =?us-ascii?Q?YvlUkrmgR4sCE14O2EFGWqkCCS6cJf+EKCCo6SgjBS/GR9HvrU0olpWdMr8G?=
 =?us-ascii?Q?xudnefGa9mzzIHNojeqnVqniqIbYBuTFNoIyZMqENOQYSd0N+Pz0HkMGLcS9?=
 =?us-ascii?Q?qx+HZVFncg4AstkoQ7XuxVSfAxSu8PAEaz/YRbGqh4qhtlWkg3ysjqy2huQk?=
 =?us-ascii?Q?NT9Bwn84WoXufrM4G7uIa75QJOE+7Hfp?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM3PR12MB9416.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?g8ck9I47VrmKV6kvBnMR/w5MnDFEJ+TilDdP3K8cgfadV0z5HcwxFNv7M6zE?=
 =?us-ascii?Q?IhQ5yprFlxHS1/kQimLVDAWw9IaqT3ZyfXnrv6a4oBi7b5uixty8YciSxIs+?=
 =?us-ascii?Q?s4OvbhsI+guq2yyJYS9XiOlzWK9czVP3jBf1czNv2N8G1QLjH1ittjQkbGVk?=
 =?us-ascii?Q?di8zTAxubjHihyoWgd0IOl2AOu+STClQgkZH7fCHFuLIMrwFm3g4MPsfffpF?=
 =?us-ascii?Q?pfS8138c650bKLDOALki5+9LqAYx265qSxtilurGN7WXIAHOFV9ipBWD4/5y?=
 =?us-ascii?Q?1LryBdMmytXDEKyrcjYqU8Z/kIChuQrxPiejXVRPVu9CGfaM9WjMhDY05iRW?=
 =?us-ascii?Q?c7y1/OB8m6UNjKOkwdvvlUMuo24gO44Ft1goSBlcyhPcJW9R8PFUXn8OBrix?=
 =?us-ascii?Q?Op5Xe58aeambhrsSmo3M8STjWsjXTrJfJY8mypdptsqZvwZ63LUzOkFYl1/f?=
 =?us-ascii?Q?TN1cWnD0e2zVC4JH0Qob9NLN7JLK/DNfzxZ9/MBhZ5/HOkqR7SsqF0YGe032?=
 =?us-ascii?Q?r8O6BnWzgvRvmuVFko9hNctTyypxwVnI9Njy2jXnJTLOV/fh1tFpFR9wqOH/?=
 =?us-ascii?Q?TmoOiyrcBt+4aTlap7s+M+d1XzKuL9jP/yA2maOS/b4XC79gj5grSQDeZimP?=
 =?us-ascii?Q?fvOQbjGwVLXfVqxgo9ozY0LKPZVKELwuWmHUuaKw7mNTfxYt4N7KsYb7muAW?=
 =?us-ascii?Q?io7iHZtpz2pGy0tH9f6zT/LnvN9wTjjAOkLEslNuhronZGalHvg2c/wYX9I8?=
 =?us-ascii?Q?hV/BpiUZepkuqMKlH4KQCWMi128lhM5cDUXscue//jZD6QMWyX9AmvFZ9EOw?=
 =?us-ascii?Q?FFNcpos3t4haPfcF0tHgQ4c+xSGiy5KvftNjxyeMou4oJuhgZelotRRqt1CC?=
 =?us-ascii?Q?ohIVD5mvmxu98oW5wtp4zlq/utww+aGMbc7Jg+i6AKF16tr0ArM892sSuLdp?=
 =?us-ascii?Q?kKGyESjVE5QTI3MTsFURH6T5EwH6gDOE5ux+QtanLQSFxTq52hFAZ/0o5FaS?=
 =?us-ascii?Q?jCBaKvsnuZ6cS4a7nsjbhyFL2AiTcm48Yt8q9OotcMBEENyhcUDyu6XciXbo?=
 =?us-ascii?Q?S3tse4st9VCfVyb1CfvFKrm4mAm1XnjO6VpuWV1XvpOvCGJOOyRKgETIn4MC?=
 =?us-ascii?Q?578If1wB3X5yrq44ceBvNVtzVehpCEXahV4n6MVG2RA2HgdD9b8hdHC020w9?=
 =?us-ascii?Q?5SF7bUqlr0YzTDfAHxyzXSqJerbk65Dw/Ctux6xu2PqlHTN+c5rwA48a0f/c?=
 =?us-ascii?Q?bRgQgQSdOan25oP7XYDb8LswcpYe0TimyFGXRhuuWKlpZGFA99k4FqoXczHO?=
 =?us-ascii?Q?bPvK8U8HQeb2QD4f9/hu9Q/4LC/WS3gphsOTBnR4OhQSlyL8BaneyYWNqdPm?=
 =?us-ascii?Q?QewCrJFlnltvTkSWTEja6APNdruMF3q/EeS4DfU1CTXcf6wfZnH2Ke6IqyWE?=
 =?us-ascii?Q?AuGmweu3on0Yw1F1yc/b/espc+scHNy79+6TtqhNTpEEcin/jOyh0kU9lD+I?=
 =?us-ascii?Q?U1EXrEqmIe3WxvyB/AGzOx9hd7uyzA6R6J51+7xhJeLXaQthbD6xb1qmzeZ2?=
 =?us-ascii?Q?ZR7tbg1/EMHDrvRasT39fpK05HGrXXOHKeax55gm?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fcbe6cd3-970c-4651-56bb-08de32311fbf
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Dec 2025 05:59:30.2426 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZGK4bg83bjnoLhZuVDPjSMhfdjxwuITE/kfBUAkXTPCvCSvbcjKbHFi24MmGDmGq0siOfWSd6zSUb0zyj0/QJQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB8180
X-BeenThere: nouveau@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request@lists.freedesktop.org?subject=subscribe>
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

Keep Gsp::new() from getting too cluttered, by factoring out the
selection of .fwsignature* items. This will continue to grow as we add
GPUs.

Signed-off-by: John Hubbard <jhubbard@nvidia.com>
---
 drivers/gpu/nova-core/firmware/gsp.rs | 43 ++++++++++++++-------------
 1 file changed, 23 insertions(+), 20 deletions(-)

diff --git a/drivers/gpu/nova-core/firmware/gsp.rs b/drivers/gpu/nova-core/firmware/gsp.rs
index 547f46b6655b..86ed4d650d05 100644
--- a/drivers/gpu/nova-core/firmware/gsp.rs
+++ b/drivers/gpu/nova-core/firmware/gsp.rs
@@ -151,39 +151,42 @@ pub(crate) struct GspFirmware {
 }
 
 impl GspFirmware {
-    /// Loads the GSP firmware binaries, map them into `dev`'s address-space, and creates the page
-    /// tables expected by the GSP bootloader to load it.
-    pub(crate) fn new<'a, 'b>(
-        dev: &'a device::Device<device::Bound>,
-        chipset: Chipset,
-        ver: &'b str,
-    ) -> Result<impl PinInit<Self, Error> + 'a> {
-        let fw = super::request_firmware(dev, chipset, "gsp", ver)?;
-
-        let fw_section = elf::elf64_section(fw.data(), ".fwimage").ok_or(EINVAL)?;
-
-        let sigs_section = match chipset.arch() {
-            Architecture::Ampere => ".fwsignature_ga10x",
-            Architecture::Hopper => ".fwsignature_gh10x",
-            Architecture::Ada => ".fwsignature_ad10x",
+    fn get_gsp_sigs_section(chipset: Chipset) -> Result<&'static str> {
+        match chipset.arch() {
+            Architecture::Ampere => Ok(".fwsignature_ga10x"),
+            Architecture::Hopper => Ok(".fwsignature_gh10x"),
+            Architecture::Ada => Ok(".fwsignature_ad10x"),
             Architecture::Blackwell => {
                 // Distinguish between GB10x and GB20x series
                 match chipset {
                     // GB10x series: GB100, GB102
-                    Chipset::GB100 | Chipset::GB102 => ".fwsignature_gb10x",
+                    Chipset::GB100 | Chipset::GB102 => Ok(".fwsignature_gb10x"),
                     // GB20x series: GB202, GB203, GB205, GB206, GB207
                     Chipset::GB202
                     | Chipset::GB203
                     | Chipset::GB205
                     | Chipset::GB206
-                    | Chipset::GB207 => ".fwsignature_gb20x",
+                    | Chipset::GB207 => Ok(".fwsignature_gb20x"),
                     // Non-Blackwell chipsets, which can't happen here, but Rust doesn't know that.
-                    _ => return Err(ENOTSUPP),
+                    _ => Err(ENOTSUPP),
                 }
             }
+            _ => Err(ENOTSUPP),
+        }
+    }
 
-            _ => return Err(ENOTSUPP),
-        };
+    /// Loads the GSP firmware binaries, map them into `dev`'s address-space, and creates the page
+    /// tables expected by the GSP bootloader to load it.
+    pub(crate) fn new<'a, 'b>(
+        dev: &'a device::Device<device::Bound>,
+        chipset: Chipset,
+        ver: &'b str,
+    ) -> Result<impl PinInit<Self, Error> + 'a> {
+        let fw = super::request_firmware(dev, chipset, "gsp", ver)?;
+
+        let fw_section = elf::elf64_section(fw.data(), ".fwimage").ok_or(EINVAL)?;
+
+        let sigs_section = Self::get_gsp_sigs_section(chipset)?;
         let signatures = elf::elf64_section(fw.data(), sigs_section)
             .ok_or(EINVAL)
             .and_then(|data| DmaObject::from_data(dev, data))?;
-- 
2.52.0

