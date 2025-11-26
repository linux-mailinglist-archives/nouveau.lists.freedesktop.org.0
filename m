Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AC157C87B98
	for <lists+nouveau@lfdr.de>; Wed, 26 Nov 2025 02:41:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E0BC10E4E4;
	Wed, 26 Nov 2025 01:41:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="OCGBBlZ2";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from CY3PR05CU001.outbound.protection.outlook.com
 (mail-westcentralusazon11013003.outbound.protection.outlook.com
 [40.93.201.3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 67ADC10E4E4
 for <nouveau@lists.freedesktop.org>; Wed, 26 Nov 2025 01:40:59 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UwMFYysL4nS63x4K40Xu02jDHAEKXYSxKSvrXRTTZtTqHUBYOUxi8ccDYVHblsvR337c9LXgJwnPeqhnEZ1WO4ed5qE5ZQotTNO0F6ETONYh9H5ty235g2YbU2W6uCzzNOVAMqUoE0bw+PFUyOweBuIM/z5fitIix4Olk+b4ZdEOa7LqRQC1l+JT8kIlXP4k6RJddhp1zaqX1ULbg5isQ25tmBHyncFrb40I21YXCPke41vQPH9Uxm2MQtnrYDaFkSD2P2COXKwAs1DqHIzjSj/Tj7RgWOtQaCkQ8h3FxKCN97raY1mrhgHzTv6BzUsnBa8tgeVauG1pCuNBL7+ZNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AfjdSBO+v/4XLJu5BvlZmcYRvXV8IXBZi9Xh4nYhziM=;
 b=oNZCE7m2i0kKzL33GtISkWsg8ceaztXpr9M3Gv9ltZe/Nd6ha9PqdkAuNvCWUMdh++9qNXWPsvd6BWuO6Qa3P6SI1/s5kKJ/EFeEmcMtml9PvZJvf6n8KZVnysn0tEzo1rNb0c5o4iP4ytiNvcTACx2nO6vCK894NHKKH7qQRu4puPkeclJtTJ2gd7vgknpx9ZhR7jyJOAqI1+jMql+vaNx6j67kwmcHfRtenz+yOaqLvxUlZjm0OOspXjxTBfOaLyCmt2AoufUTcn5RU9dRR9J4PFkZLy+XsBP589vPoK3lGlzgQpYSZhEciWiC2Frf/qA7oxH2aTYUhPQ1JrGLyQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AfjdSBO+v/4XLJu5BvlZmcYRvXV8IXBZi9Xh4nYhziM=;
 b=OCGBBlZ2aY76NV4pepr0esUszsDNJt1JNzgwgX11fnDKJFJOq2iQwIvnbPCBbCFsKTjTuR/mxWV3pW/pBvE/0rx+89GhDrQeMnWdZcCGA3OP3yU/YscqPu3RirsP2LPpYb8AVXpktpMIWSITuC3ud5fll1MuYlP/pX75yGUwk1t1Dq8MvvU05ozGW+1XfkKCgk5G1BKicro6XxWv3J+ezd4YRCe1Qp+LVnv8rG+fXqbuX0xp1SUHBKHY54seFpHYqvHuLAc+jErlLF4Uy5uKtYoCfFXDpe09zkEUaPNhBlluHkrvfu6yp47lLdXFvXmXOZ+w6i8iRP9s3HKxfXwFJQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 SA3PR12MB8022.namprd12.prod.outlook.com (2603:10b6:806:307::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9343.17; Wed, 26 Nov 2025 01:39:42 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%7]) with mapi id 15.20.9343.016; Wed, 26 Nov 2025
 01:39:42 +0000
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
Subject: [PATCH v2 3/5] gpu: nova-core: Hopper/Blackwell: basic GPU
 identification
Date: Tue, 25 Nov 2025 17:39:34 -0800
Message-ID: <20251126013936.650678-4-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251126013936.650678-1-jhubbard@nvidia.com>
References: <20251126013936.650678-1-jhubbard@nvidia.com>
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY3PR05CA0054.namprd05.prod.outlook.com
 (2603:10b6:a03:39b::29) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|SA3PR12MB8022:EE_
X-MS-Office365-Filtering-Correlation-Id: ccff7293-8715-424c-ec3c-08de2c8cabdf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|7416014|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?+5rQAPzvc5jLILNhppg1ALVm82VLod5nFGydZ3Y33WHmgP/4rzw+dc2R9SU1?=
 =?us-ascii?Q?3s8lcd/n+qNC7dN1sLBsTqzGc5QacjA0q5otkf85cC8S9HTNm+2ZG2WEQ87r?=
 =?us-ascii?Q?kudU9Q3zy8ih7OvtQ2g4ZsNNSemxx/cnQCPKNNHG4yGUK/NLIrNBbh3f4bOd?=
 =?us-ascii?Q?Gl9mY8joLSl+F+r5spdW4pAB+5WGlTon7KWi+zwlIc3T74wGJ1RLvC+Y/34e?=
 =?us-ascii?Q?kGsMflcP3xsnb80rIif3HR4BQ6mPPSEKcVBUev+FF6cqiB1npZU5R388c8W/?=
 =?us-ascii?Q?isL3952iB5Xj5pRXycj5kchzEOnM4aBdfOyQPrOIwhp3tZ20mbe/0KvbMhhB?=
 =?us-ascii?Q?z94JckAwULibNLxMRWx7BzgvVzb5xzGFJz5Ube9pfaMhPfAF3DIJW+LKKk6/?=
 =?us-ascii?Q?vezCRkgd+mgv3J2iYyJlGkly+Ywaf8isGocGuDKypOLlTDzsf/t++Pk4Dm+p?=
 =?us-ascii?Q?UmoKbeHXr/eezmBDFKsycpmQCOEnltmK0cWYqwnoZeN5fQeukx28U/FVW4f0?=
 =?us-ascii?Q?Nh1Cx4oTPykB7C9SEDA2XL4NvBVrWGnsR9lVZVecTJW9DBw2MDWrVWylAQus?=
 =?us-ascii?Q?0E4wk3rbjtdAyPQB1AMTSz7aXXfkos3zefRtUuVRIxUdohDi1kaDVmPDz/k9?=
 =?us-ascii?Q?7y/CaISqjg6k4GM2DP5EZKauSerSZM90dYwnbkIulx1DgP+iIOzbyNek7XSu?=
 =?us-ascii?Q?EoUByUMPl8dwohakqCpQ5TGVuci02QMBVVdikK9Y9qm3YsR7lvoWEdSyWzuo?=
 =?us-ascii?Q?Yg6bwEe4WbtKRrdrNQjU8qlrzyyhoVATT8Q1k4tM+p2SUo5aYEHAbqqW6BUM?=
 =?us-ascii?Q?g3VFyVy9pqmyPc0H1/LRAzQe8+fdoBoeABB+fc9XaO/LMS8uavvSMDtaeXCk?=
 =?us-ascii?Q?EUIipvMDO7JOzq0vrxq6Y7FNs9GGzsbsLvLlXBfss32u5ZRZh/6uOUuRHsDa?=
 =?us-ascii?Q?DkMXGXQDJAX7NPX3Er5sHei1paF6A89t36j4J8LZ/0QOT3DmWNH8iGuKdhX3?=
 =?us-ascii?Q?LuFfE5gb7eyR/rgHvmV9TB1zPmxOmKE0j4ec+vxvK0v7wJJjII0ou6v9t8aP?=
 =?us-ascii?Q?raxp0hZod4pzfCbMEyDOVY0bCFGmgNrdoxDcyItcrPMF2yppQ11sBP9Sl320?=
 =?us-ascii?Q?nvrNeUgNwTOeXm6sfkbfIhwIuYf3d7+57RdDSo9j3gLvCqoU+9nyyBW6dQmK?=
 =?us-ascii?Q?S61bgZwoi8bu8Vy3AnpxfteZ+zuUaTxadEOlsJJI2a7kRgyNEeC2xlOhihNz?=
 =?us-ascii?Q?YCSXqfCN9ukoHiS5Um1V0iH7ErQvjRcOBNffnPzpTkC2h/bLpPoXirfVBg8W?=
 =?us-ascii?Q?RVi2h4+5mZNIyWS6bHR8+qn3plE62adpf5oc96QAjUI1tjmIBUJ+UA6SUv+O?=
 =?us-ascii?Q?OAZEwm21OKEDnpxJq0RV3tdui15oLqZSWjDQ1H53fYf1kprdIrqXehgzCVAZ?=
 =?us-ascii?Q?GAY6KHXKFR/x5CmtC0T8mJZKrsD5KnoF?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM3PR12MB9416.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(7416014)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?1JZYPyTzWuV+QTZ630ZSF2c3QjHmQK1HkZXjMjystXYpr+UkaEHCmBi6B6iI?=
 =?us-ascii?Q?wigNjcZuggqw/BcMmXiaFTvxUGlNuLE6U4yrLsOkl3/irRu0DpnzAlDURG0N?=
 =?us-ascii?Q?PYP0Frp0VfqdAJNkHPjp/Z5GMOgX53xrVG1sALBxlDS+TaCNpalHJHA1kl/U?=
 =?us-ascii?Q?zCYwLyyGp0eT0THZNxr2f78N16QLvnvhxCj/5g37O+rmIFjxtQVwXBdAWXz0?=
 =?us-ascii?Q?KYRZ9JmIckLspCe9l///vlaD0qOYemwpqio3xfpcazO0nCuchtDTktlvB299?=
 =?us-ascii?Q?1SBEi6+7cPvZjStcZIZLoyvXV7udwOhUTr9is8gvbMdzXinVFUSO/MdeEafQ?=
 =?us-ascii?Q?ictVQHpJ5QUjqTIY/UkNRp0fSe/Itmns3f+leKHmDy5stUL1cbNrprqN/WKK?=
 =?us-ascii?Q?ygdIPUW8k+qxfhUUu9vrod3uhKMr2Xm9YmDL5rhN6BOBwRqqRF0ZeP1tqs1x?=
 =?us-ascii?Q?caSGhUqiKb5onSKsL4OLX2RtbNoHfgEXtZ77ChvMGerXZ2f+ew0An8Wj30Zx?=
 =?us-ascii?Q?oaGUwYf11P2g8tGQ0HyybBRHqnf6pbEFRqfzFtGeugjwVPXYup8ou/fRMXUb?=
 =?us-ascii?Q?II1+vggu5VOEPxOK1tm0LbjcNJWzY72mYK8BCKGz9qJ0NAS0WEhRgr+P9NuF?=
 =?us-ascii?Q?RtmwPcAfLbtk6lr0SupgZyq+5eIUt3Nx1Ow+4Jqf0+5TrQmdr+CbiiSI1txQ?=
 =?us-ascii?Q?e9QxT7mp89tC60WKioLYnZe8n0N7N1rxSqDBgUtSxTPavexLbAWAmpsAVV7y?=
 =?us-ascii?Q?5gAOqD7JBVI8ReIdWoDjr/f7mqs+V7SWxoAtNC2FKmgTtCl16H36Rtdmhtrs?=
 =?us-ascii?Q?BIj87oDtjx0wt8+2n/OUXBDbSAgOevJ1ssm8aEEbGWM1wtQY0OFdFpBxhw0i?=
 =?us-ascii?Q?yePqOeDTkGypYQuZhYi0FxzMvCSfcTvmNzCFg/tcltUV0nYzYl7gZlUCtmao?=
 =?us-ascii?Q?x75ru02U7DBmwa1ByohUYVsq3B1/MO1KYAut9FZw2uJQdLNxq1rmarVtR1CW?=
 =?us-ascii?Q?T1kAbnXu/IFRzGEhQTsSvYUSltZSO6YAirHwF2bAPD71JIkIXMUQCGZeD/S5?=
 =?us-ascii?Q?KarUcusC+Q65zde12bvUG9m9/IVzr8TrCb5dRab1g89NILdTpc0JT9GzRq5u?=
 =?us-ascii?Q?tM66MQV2i/wuEVb4y4VkviiMe3aVS+4zZgKClDb0oICg9Q8VSNZ1ROaorLyd?=
 =?us-ascii?Q?AgilAp2LTdzy1I8SB0ayKjeihMYCIAeAgfMthadnkSjoDDQ9e0gpWGcZBkiR?=
 =?us-ascii?Q?yrblQmBgJVPkgxKRBzAe/klCoKFLHzMGJz7tB6KpihCJNpv4FqR+l9AtKg/I?=
 =?us-ascii?Q?+CjHYGz5Il5HCjzIsxxOaPNg2Lok6fq9IaPhrPv902cEb1gEyrxR/JKoh16j?=
 =?us-ascii?Q?IMTVl8Gpkh9aoYdaZbssHipVAxTQWAyI0dOtkk5ap/oW2n0q0k6/O1e1I2yQ?=
 =?us-ascii?Q?42CIJG66XO4CY3SmiROaJuNB+jcc4UFGiGVUBy9XLve80Ty97oYb/HZ++R62?=
 =?us-ascii?Q?7Yyqj78wWYqmSQvlSdjo5FBClQ2GzJC74djNZC4RpabEUsDQcfFd1JI18Ik+?=
 =?us-ascii?Q?dwqmXtn+2IuZ/GFROAsZdcpIUwFQrz8cVrhXZ5Va?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ccff7293-8715-424c-ec3c-08de2c8cabdf
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Nov 2025 01:39:42.5720 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zaSZX1nMjpIdOYe/LQ/4kXaE9u2N2tVIu/HTS9A6RuQWkBZsuKRPcEiDaAs6tcOBVtQo9hjSht1wtyoCNSmkCQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB8022
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

Hopper (GH100) and Blackwell identification, including ELF
.fwsignature_* items.

Signed-off-by: John Hubbard <jhubbard@nvidia.com>
---
 drivers/gpu/nova-core/falcon/hal.rs   |  3 ++-
 drivers/gpu/nova-core/fb/hal.rs       |  5 ++---
 drivers/gpu/nova-core/firmware/gsp.rs | 17 +++++++++++++++++
 drivers/gpu/nova-core/gpu.rs          | 22 ++++++++++++++++++++++
 4 files changed, 43 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/nova-core/falcon/hal.rs b/drivers/gpu/nova-core/falcon/hal.rs
index 8dc56a28ad65..82558af1b927 100644
--- a/drivers/gpu/nova-core/falcon/hal.rs
+++ b/drivers/gpu/nova-core/falcon/hal.rs
@@ -50,7 +50,8 @@ pub(super) fn falcon_hal<E: FalconEngine + 'static>(
     use Chipset::*;
 
     let hal = match chipset {
-        GA102 | GA103 | GA104 | GA106 | GA107 | AD102 | AD103 | AD104 | AD106 | AD107 => {
+        GA102 | GA103 | GA104 | GA106 | GA107 | GH100 | AD102 | AD103 | AD104 | AD106 | AD107
+        | GB100 | GB102 | GB202 | GB203 | GB205 | GB206 | GB207 => {
             KBox::new(ga102::Ga102::<E>::new(), GFP_KERNEL)? as KBox<dyn FalconHal<E>>
         }
         _ => return Err(ENOTSUPP),
diff --git a/drivers/gpu/nova-core/fb/hal.rs b/drivers/gpu/nova-core/fb/hal.rs
index aba0abd8ee00..71fa92d1b709 100644
--- a/drivers/gpu/nova-core/fb/hal.rs
+++ b/drivers/gpu/nova-core/fb/hal.rs
@@ -34,8 +34,7 @@ pub(super) fn fb_hal(chipset: Chipset) -> &'static dyn FbHal {
     match chipset {
         TU102 | TU104 | TU106 | TU117 | TU116 => tu102::TU102_HAL,
         GA100 => ga100::GA100_HAL,
-        GA102 | GA103 | GA104 | GA106 | GA107 | AD102 | AD103 | AD104 | AD106 | AD107 => {
-            ga102::GA102_HAL
-        }
+        GA102 | GA103 | GA104 | GA106 | GA107 | GH100 | AD102 | AD103 | AD104 | AD106 | AD107
+        | GB100 | GB102 | GB202 | GB203 | GB205 | GB206 | GB207 => ga102::GA102_HAL,
     }
 }
diff --git a/drivers/gpu/nova-core/firmware/gsp.rs b/drivers/gpu/nova-core/firmware/gsp.rs
index 0549805282ab..547f46b6655b 100644
--- a/drivers/gpu/nova-core/firmware/gsp.rs
+++ b/drivers/gpu/nova-core/firmware/gsp.rs
@@ -164,7 +164,24 @@ pub(crate) fn new<'a, 'b>(
 
         let sigs_section = match chipset.arch() {
             Architecture::Ampere => ".fwsignature_ga10x",
+            Architecture::Hopper => ".fwsignature_gh10x",
             Architecture::Ada => ".fwsignature_ad10x",
+            Architecture::Blackwell => {
+                // Distinguish between GB10x and GB20x series
+                match chipset {
+                    // GB10x series: GB100, GB102
+                    Chipset::GB100 | Chipset::GB102 => ".fwsignature_gb10x",
+                    // GB20x series: GB202, GB203, GB205, GB206, GB207
+                    Chipset::GB202
+                    | Chipset::GB203
+                    | Chipset::GB205
+                    | Chipset::GB206
+                    | Chipset::GB207 => ".fwsignature_gb20x",
+                    // Non-Blackwell chipsets, which can't happen here, but Rust doesn't know that.
+                    _ => return Err(ENOTSUPP),
+                }
+            }
+
             _ => return Err(ENOTSUPP),
         };
         let signatures = elf::elf64_section(fw.data(), sigs_section)
diff --git a/drivers/gpu/nova-core/gpu.rs b/drivers/gpu/nova-core/gpu.rs
index 629c9d2dc994..c21ce91924f5 100644
--- a/drivers/gpu/nova-core/gpu.rs
+++ b/drivers/gpu/nova-core/gpu.rs
@@ -83,12 +83,22 @@ fn try_from(value: u32) -> Result<Self, Self::Error> {
     GA104 = 0x174,
     GA106 = 0x176,
     GA107 = 0x177,
+    // Hopper
+    GH100 = 0x180,
     // Ada
     AD102 = 0x192,
     AD103 = 0x193,
     AD104 = 0x194,
     AD106 = 0x196,
     AD107 = 0x197,
+    // Blackwell
+    GB100 = 0x1a0,
+    GB102 = 0x1a2,
+    GB202 = 0x1b2,
+    GB203 = 0x1b3,
+    GB205 = 0x1b5,
+    GB206 = 0x1b6,
+    GB207 = 0x1b7,
 });
 
 impl Chipset {
@@ -100,9 +110,17 @@ pub(crate) fn arch(&self) -> Architecture {
             Self::GA100 | Self::GA102 | Self::GA103 | Self::GA104 | Self::GA106 | Self::GA107 => {
                 Architecture::Ampere
             }
+            Self::GH100 => Architecture::Hopper,
             Self::AD102 | Self::AD103 | Self::AD104 | Self::AD106 | Self::AD107 => {
                 Architecture::Ada
             }
+            Self::GB100
+            | Self::GB102
+            | Self::GB202
+            | Self::GB203
+            | Self::GB205
+            | Self::GB206
+            | Self::GB207 => Architecture::Blackwell,
         }
     }
 }
@@ -132,7 +150,9 @@ pub(crate) enum Architecture {
     #[default]
     Turing = 0x16,
     Ampere = 0x17,
+    Hopper = 0x18,
     Ada = 0x19,
+    Blackwell = 0x1b,
 }
 
 impl TryFrom<u8> for Architecture {
@@ -142,7 +162,9 @@ fn try_from(value: u8) -> Result<Self> {
         match value {
             0x16 => Ok(Self::Turing),
             0x17 => Ok(Self::Ampere),
+            0x18 => Ok(Self::Hopper),
             0x19 => Ok(Self::Ada),
+            0x1b => Ok(Self::Blackwell),
             _ => Err(ENODEV),
         }
     }
-- 
2.52.0

