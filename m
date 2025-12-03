Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F650C9DD8E
	for <lists+nouveau@lfdr.de>; Wed, 03 Dec 2025 06:59:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE39D10E715;
	Wed,  3 Dec 2025 05:59:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="Jt1WONVF";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from SJ2PR03CU001.outbound.protection.outlook.com
 (mail-westusazon11012064.outbound.protection.outlook.com [52.101.43.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2596410E715
 for <nouveau@lists.freedesktop.org>; Wed,  3 Dec 2025 05:59:50 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AJ8FOCJoIEBkCn4LZOa3MnD27p0KnXoskWp9GpA1qZ+7wDv0hutjd33MpY+w/igDFZZVMHMaOb4nv2ZtsiIOJiF8PyvkbpXulkICdDY4VXefgOJ+vBICHZTr5VYHT/6c6oCD+l90khPsWBd7PH2bWS5zap2tDlvGjxMUmrZzQwwZR6C5EIrKEJ2+PCasKzxPts2qkIwMFes1ES08dA3h9usORpCHYp9auoDJ8jGW8vyNFuDLjED+n6bsuV3O3zZ6ijHd2Z5RfHiIrDOhSvBX/+cY529hL/v4+cmw2My+pxZPBreYh3XOS2GPZEbIVMn40a1B2TW7Tg4QEjyOoUuIgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oq9PxA9fcnA30fZHESWUxTc1tkpoU/ElZepUGIWs+eY=;
 b=fQTh/A+6Gq+J92mdnYUECXDdgHCWG+QZ8QG0xgvE9UA/Okj3VkjKtTNZQ5YKsX4QTfkXiji4OAXeIJfFguFZov7Tv8DV67XRDLSSWvHeQ5kIiUn1q/J5jepjB4i+iJPJK01H9Zs0DGTaj3AEywobFdnCwxtyYzEDJ5jUFe0CXgFZSgw+F+iPijnR1V1+sfPEEzSSud0x1eH0sNd0O3yGSD+bGxLlW1F7qiddewWT5O7sc5xE2LCmepvsfFAS7KY4zns0gjkcexVBhqSl6/Adt0fOsFeVv/8Se/RN0E2FiFvGyuezsWITCu11sUxXzGEA0O6y40iIdTMuJLXzQinqmg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oq9PxA9fcnA30fZHESWUxTc1tkpoU/ElZepUGIWs+eY=;
 b=Jt1WONVFyy3dcpU3TVSHd7NF59HsbdcOXbNxsgHzQoCL15opt3PGZPca2jbdykcauieSutnL1+/akONoF4sBqxMEaU3BySQvYUrpdpYD5OGFvGUaledVFxyvCXiLclL0NyCWRLak3biSHvJgFOkwJ/4VFxSnttgKvbTAgAuIDxgMjTWS6CEqZyvoWeLkooeN5A9Wq2jlJcddEcj7IV0+nF/ve9N3i4YcAUiLauc+r11WRHldQ3yFkiaTb8v6UU1SaOOYUaVesDgZsHbwVau4hazEXx1ub9p9/+6a6GYQeLKZ98lJb48j5baJK4yDaW0QmhcS6Td2+XRaF2BcU2BwPw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 PH7PR12MB8180.namprd12.prod.outlook.com (2603:10b6:510:2b6::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9388.9; Wed, 3 Dec 2025 05:59:48 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%7]) with mapi id 15.20.9366.012; Wed, 3 Dec 2025
 05:59:47 +0000
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
Subject: [PATCH 15/31] gpu: nova-core: Hopper/Blackwell: add FSP falcon EMEM
 operations
Date: Tue,  2 Dec 2025 21:59:07 -0800
Message-ID: <20251203055923.1247681-16-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251203055923.1247681-1-jhubbard@nvidia.com>
References: <20251203055923.1247681-1-jhubbard@nvidia.com>
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0332.namprd03.prod.outlook.com
 (2603:10b6:a03:39c::7) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|PH7PR12MB8180:EE_
X-MS-Office365-Filtering-Correlation-Id: 0bede2d8-7cd7-45d9-0e64-08de323129f6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Y1KD8vrOvJ4rvy5A1e8owtjlImtUEC2YKUZfKyiwLzov9VmDn+llhd7CTmM3?=
 =?us-ascii?Q?UaVVZvDcRAWNTx0/AsgpVXkQ3yU91uJKe7EvXSWv0OcFQC5R6ZpbPBpuk3iP?=
 =?us-ascii?Q?ZvCU6Jixu3SJ1KZG3ldlK/E2odCJ6Bglr3fJ8CEI9nKQZj73QFbdZw2PR807?=
 =?us-ascii?Q?GzhwoLYQv3yN4UsuJAr2NhhqJEJSVllRxioTiFGx8On2wd7pPEB0MVuPofH0?=
 =?us-ascii?Q?nSxUXJCdh/czwS5veudJ0VWjGR+Y0Mz7Groa1QqfqiOrgB+HMVP7NPdiQeSt?=
 =?us-ascii?Q?OiGrwmwgvRmN7Bg3RIKfgOmVAD4PG2FHBw4lv3/oBNmNpx3qOpoiR12+LLRA?=
 =?us-ascii?Q?0aJTGP9lNEtCCU3WmMHlF9ZxqU8L5dqayhLUVd8MgFHbejOEBxPcxxVuWU7h?=
 =?us-ascii?Q?Y6NiWbjhgc2CAbsus/DnxiNCYO3oHQjI5yFaDWSDeP5l8exH7JzaY770qvsf?=
 =?us-ascii?Q?jjgnl+SkOpUHC/l4YV+qghTnaMp86p1oNyPZnxHf9+HFBm9KRr8hLtlmsU8d?=
 =?us-ascii?Q?03cMRXWEd9ZO5qYRULBl5XLdMAMZIoedi9mpYGZf87RMi6c7qsf9jJWDyxPt?=
 =?us-ascii?Q?Rqe2XZLvPm02a/HhenlJj2LCJqryHA6IdKXGNzvUC1n1OYLORjApyUf+LH61?=
 =?us-ascii?Q?jF9osoUaRTpOgaPaY8BdIeKFxTef90inHpmFzwBtrlQFOokdpQkacYPw1Sqk?=
 =?us-ascii?Q?1LqcMJ48zeZ4gQU6DPKGVP6i7vJiXeaDlBeh7mzOaGc44ddufNIxzznnd1TI?=
 =?us-ascii?Q?iZaqp1hcnVlHo3B2L6aHaTw1uD83WMgHdZr3y02sUkCJFGDAwvt1hmF61Y2+?=
 =?us-ascii?Q?7pT22p2lSXeRct3V5biV45RLvpnWYakRK4d4tzNodtZ5QaoEQLPRJdYc4lyu?=
 =?us-ascii?Q?SQfBi+8WLPVCr245s87s3fOJPfgeR92ZURAUJ0LLvrDF795Tt9LU83GZQJcx?=
 =?us-ascii?Q?SHJHUIqiA4TWbsxskwbOvRHCtkgi9tS31xPYVuXpa06J+cx9pW86+n+sQGwy?=
 =?us-ascii?Q?Pz+1WAAvapKJFyPU6loei7Ph8b9P7A22gF4mtD5OHRPahvc2RNlXxRCFp24K?=
 =?us-ascii?Q?83SJTqxkWmCnaqDMox8lgZ42CnqexHuWaqxPlM4hYkZBbvH5e/iA3exWrb+5?=
 =?us-ascii?Q?y2xFh2vkMc5FLKc1HZfjJNGDUP2LnC7hslABAgG9Thp8vWofxUyPlmK7rzGo?=
 =?us-ascii?Q?jyKt10lc1+sCHqSqtrf6T3uaQOHJ5gEJ+55g7Z2r2T4gtWT7dcGLM/h8HIol?=
 =?us-ascii?Q?cfQsg5w9AToVPLjyI3rUi7efKcIwlWyOwFPE/bZHeYKdzypSg7ryPBW/89ZE?=
 =?us-ascii?Q?3GeLWhMSjzLg27ioEpM81ZAGqpTfhJJoGznI5PCk9WZCBWoLM1ZiNMuXJbP+?=
 =?us-ascii?Q?Z6jnTkms5CCP2Kwc5uw5VV48WnpPo4NGRJX039O0VdVTsWHX/VdKvwF4U/Au?=
 =?us-ascii?Q?519cnUThEVFoy0aCOM0IuIDVc5uNdrdm?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM3PR12MB9416.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?TFixZRdE431eY1vOfqKqeYGbp1mcjeyMqVKhyz3jgFQawkTKecs8DC473X7n?=
 =?us-ascii?Q?ZQYkkMa0a8Z83Idwq4CpX2R18otyY+WnGvu0ESNRG2iPHWM5JcbfTJftKZkl?=
 =?us-ascii?Q?Z3DAcI+o91VW58Wv8Ao9nR6sK3I2pQ271wOnqZbBHlRds03qE951WwQ/2RSI?=
 =?us-ascii?Q?sNxvXWz8RbIT8GsOXVPCCZ0n/cmX4z6CGxetidpz1Qi4RwFHsz/Wf9ritzK5?=
 =?us-ascii?Q?kUNmn8+SIOW9hnQnUSmmNvEFg+AUiXszk7cPr8hka39iqHyQMyubvNfthtaX?=
 =?us-ascii?Q?3ysi5I5BgxsrEnNithswt7GYnckGMOuUhoVHDIOJP4/scoGVrsz5jDVZ3hy1?=
 =?us-ascii?Q?6XydbI2xa6KMDj2hJryOSdxljxdsl+1O1UmPWr0OavZyBQGGsdDBJqMbUbfz?=
 =?us-ascii?Q?xYOz5MRP9hNlt/tAmGibJ2atVJLWeWH2L3bEd82ZP6COV/mhSzSVBs3AOs3a?=
 =?us-ascii?Q?4uBAVopiGWjEKgdf0LNozO62Y5RTiali76bGFvHLEOCiiVliiZYJa7ibMlZ1?=
 =?us-ascii?Q?SbAYaqde0e8xMTB5W54WKZ+uj6XG6ixeOLMhc+A3rAl/uBWE9Gk1o1KJdwse?=
 =?us-ascii?Q?JFs3oXD91CKE2xLcxQQ8d2ECwRVntwYlJC76esC1RawihKumRdyhn1ITkIq1?=
 =?us-ascii?Q?k2nlYZwgffyTQLigCc39z+YD/kGk2picNSdpw/snyqKTqwEKdP1nMsKmU3We?=
 =?us-ascii?Q?cBO89NS5rwqHW2xUufiHFd4oWp3dzxJznflmhJCCs10BsKgLh/+iz7fOBEqS?=
 =?us-ascii?Q?/ztcGkE2x/faFFQJ+8oD0WWaaQNiPA/OamVZkMdLwcvnW32NQTco+DTisem9?=
 =?us-ascii?Q?Xiv0o8CNxsSio4+5+T2jmHbIl2lwL3nHynlZwlx6Hn/xoijpdIrtAm1NaX8D?=
 =?us-ascii?Q?HUAD2huP4Zfq2NgM96hY/j4xmIrDRq7nkDwrq9guWOAFq6vKi2F89EkXQkbS?=
 =?us-ascii?Q?scHj2/czeizBtXFnJCxFY8hRa0gFqWv6Mfd+lUjvNbrA85tpZE7utRFbrVDL?=
 =?us-ascii?Q?fUaU69vDU6rX7D5Wj9sfgMeoVApKKaCJ3oTLo560Z6jNuUfyG7T8RvpAEHsq?=
 =?us-ascii?Q?VarBC2pQ3a7zxAx/ii2jlcAO2deZ3r3iBuhiAuTSehM0ZOjMJWx5GxJj5YBO?=
 =?us-ascii?Q?Fro98jydfAmdM7kUuNyvTORRS/3np+zW0mZGqVRBDXeNv2ZG1jbqFYyL4Cag?=
 =?us-ascii?Q?OWY7+lmnhziyNXxidNSrdoX6iyXTztYC6365mhorRi0AEJPe+bhNVOakQz4y?=
 =?us-ascii?Q?RcugYgiwWh53CHEHCGJp6xniVRSn7s59xNP8wpfuGONDsncZ4rGU3T6DD5ib?=
 =?us-ascii?Q?5uLkW0qBXjQohXJbosZzNOh5HALYrfBEEW/8Znend5BlT1fLIT9A5W1SgPVg?=
 =?us-ascii?Q?mnN6COBzc/ImaiPgwS/qSOp0whmNJVLTkJeO//+qOVG4sUEm2EKpO1pvUb2R?=
 =?us-ascii?Q?KhyTSl1v9HBsACVr2U9g0kPkbujKjmoT/kHqmJ+5wiZJE9yAt8zQtUxYWVl9?=
 =?us-ascii?Q?2YhHTNZyqddjcG/TE6hlkxBJXA6yDVxSjc4DMlKcSZuMHBCg6aioTu5Hzw8k?=
 =?us-ascii?Q?W6/SCJvcv4IjypalMXNaigQFywKKPWuTb6DgJBE1?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0bede2d8-7cd7-45d9-0e64-08de323129f6
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Dec 2025 05:59:47.3890 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Cho01GTegI6Ka+FeIJCZUkRCRgL0zC51xqQ8nmWkS0FQT5iPhFeJJ4mtErt7ZsciAb6C3sNPkb8ZQh9dLtrfkA==
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

Add external memory (EMEM) read/write operations to the GPU's FSP falcon
engine. These operations use Falcon PIO (Programmed I/O) to communicate
with the FSP through indirect memory access.

Signed-off-by: John Hubbard <jhubbard@nvidia.com>
---
 drivers/gpu/nova-core/falcon/fsp.rs | 60 ++++++++++++++++++++++++++++-
 drivers/gpu/nova-core/regs.rs       | 10 +++++
 2 files changed, 69 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/nova-core/falcon/fsp.rs b/drivers/gpu/nova-core/falcon/fsp.rs
index 7323ae2f2302..9e796e82e556 100644
--- a/drivers/gpu/nova-core/falcon/fsp.rs
+++ b/drivers/gpu/nova-core/falcon/fsp.rs
@@ -5,15 +5,27 @@
 //! The FSP falcon handles secure boot and Chain of Trust operations
 //! on Hopper and Blackwell architectures, replacing SEC2's role.
 
+use kernel::prelude::*;
+
 use crate::{
+    driver::Bar0,
     falcon::{
+        Falcon,
         FalconEngine,
         PFalcon2Base,
         PFalconBase, //
     },
-    regs::macros::RegisterBase,
+    regs::{
+        self,
+        macros::RegisterBase, //
+    },
 };
 
+/// EMEM control register bit 24: write mode.
+const EMEM_CTL_WRITE: u32 = 1 << 24;
+/// EMEM control register bit 25: read mode.
+const EMEM_CTL_READ: u32 = 1 << 25;
+
 /// Type specifying the `Fsp` falcon engine. Cannot be instantiated.
 #[allow(dead_code)]
 pub(crate) struct Fsp(());
@@ -30,3 +42,49 @@ impl RegisterBase<PFalcon2Base> for Fsp {
 impl FalconEngine for Fsp {
     const ID: Self = Fsp(());
 }
+
+impl Falcon<Fsp> {
+    /// Writes `data` to FSP external memory at byte `offset` using Falcon PIO.
+    ///
+    /// Returns `EINVAL` if offset or data length is not 4-byte aligned.
+    #[allow(dead_code)]
+    pub(crate) fn write_emem(&self, bar: &Bar0, offset: u32, data: &[u8]) -> Result {
+        if offset % 4 != 0 || data.len() % 4 != 0 {
+            return Err(EINVAL);
+        }
+
+        regs::NV_PFALCON_FALCON_EMEM_CTL::default()
+            .set_value(EMEM_CTL_WRITE | offset)
+            .write(bar, &Fsp::ID);
+
+        for chunk in data.chunks_exact(4) {
+            let word = u32::from_le_bytes([chunk[0], chunk[1], chunk[2], chunk[3]]);
+            regs::NV_PFALCON_FALCON_EMEM_DATA::default()
+                .set_data(word)
+                .write(bar, &Fsp::ID);
+        }
+
+        Ok(())
+    }
+
+    /// Reads FSP external memory at byte `offset` into `data` using Falcon PIO.
+    ///
+    /// Returns `EINVAL` if offset or data length is not 4-byte aligned.
+    #[allow(dead_code)]
+    pub(crate) fn read_emem(&self, bar: &Bar0, offset: u32, data: &mut [u8]) -> Result {
+        if offset % 4 != 0 || data.len() % 4 != 0 {
+            return Err(EINVAL);
+        }
+
+        regs::NV_PFALCON_FALCON_EMEM_CTL::default()
+            .set_value(EMEM_CTL_READ | offset)
+            .write(bar, &Fsp::ID);
+
+        for chunk in data.chunks_exact_mut(4) {
+            let word = regs::NV_PFALCON_FALCON_EMEM_DATA::read(bar, &Fsp::ID).data();
+            chunk.copy_from_slice(&word.to_le_bytes());
+        }
+
+        Ok(())
+    }
+}
diff --git a/drivers/gpu/nova-core/regs.rs b/drivers/gpu/nova-core/regs.rs
index 82cc6c0790e5..b642cee9611d 100644
--- a/drivers/gpu/nova-core/regs.rs
+++ b/drivers/gpu/nova-core/regs.rs
@@ -391,6 +391,16 @@ pub(crate) fn mem_scrubbing_done(self) -> bool {
     8:8     br_fetch as bool;
 });
 
+// GP102 EMEM PIO registers (used by FSP for Hopper/Blackwell)
+// These registers provide falcon external memory communication interface
+register!(NV_PFALCON_FALCON_EMEM_CTL @ PFalconBase[0x00000ac0] {
+    31:0    value as u32;       // EMEM control register
+});
+
+register!(NV_PFALCON_FALCON_EMEM_DATA @ PFalconBase[0x00000ac4] {
+    31:0    data as u32;        // EMEM data register
+});
+
 // The modules below provide registers that are not identical on all supported chips. They should
 // only be used in HAL modules.
 
-- 
2.52.0

