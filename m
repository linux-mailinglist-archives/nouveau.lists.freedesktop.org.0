Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 70F0DC08625
	for <lists+nouveau@lfdr.de>; Sat, 25 Oct 2025 02:15:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA93C10EB4E;
	Sat, 25 Oct 2025 00:15:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="PBg9mEiy";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from CH4PR04CU002.outbound.protection.outlook.com
 (mail-northcentralusazon11013009.outbound.protection.outlook.com
 [40.107.201.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9817C10EB46
 for <nouveau@lists.freedesktop.org>; Sat, 25 Oct 2025 00:15:07 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IyqRqI7AsjOXeR0kU8WiuBS0QnPZ6wHlx5LEBY0hkxIhFIYDYZsCtdLodT1W0YwO2VjPUCsgWbD4sS2uZYsDTIW1bg2+crkywAkhoaxVhIvBLxWyhPllXwgdtnP9K0n+fLBtTbPbJiV9rRRE+gytjhfYylThPA4lWaiuC++0jCJe2YT8zFweKyWAjzKyqK7rhae7WYlNnpaOWMhodKr3eK2nLXQsI7q9f+9fobFDW1NArq3+YvB7zYlXcjzpEBfdWVbqqKyAx5zAYQh3PLJn8mEfqT8OTbAbHsrL8g1C1iBAmj/dopq5qvtctkfDAMrJCng8bsMTJK0F0gN9nOORaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=v6Cc9RbDbucBeGnG4e6vYh5qGuZU17+zuIK1xhT6pJI=;
 b=mdMjHdV4BdqalWOudGChiH0JHAr8fBfRVj5vU6DlYfbf0z/3jQbdGfJjuotTFCyANCFsEQgPtInuDSicja6blMOpiO2QY+c5NaGaRSjsHqfLYPD3BZW7FEUn5M2y94Q3Pqpc8Chh/hh/zKhU+2m8SYkfmo6mvysaVyPa8pISs4GPoVr35yqhWmLkVe25yDqlEJZFTY4sYA6w0sKQUMtsVqtQ2+owBN3Y4xxZUFS7NG+w69rVdlSjE8jVXQ1v3niRzrOTn+nvLiwWpIdMiPLINoNGOvceP/uIAzjIum9GdnXDYKZbM9k4o8XgboBLWWzuoI9fz4azaNmV6Yt41AxmHQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=v6Cc9RbDbucBeGnG4e6vYh5qGuZU17+zuIK1xhT6pJI=;
 b=PBg9mEiym77b2O4rgMNy5pW/WgC10GkC/SiahGwIpUeXlGZ489TW43jKZZyihtFnakqjuxCQ8Cba+df2mUK96fpS1L53ArkBE5ayQQRcaxAdJhR5Io2FiFCiNLo/210X7d/9yiSqD3oAzvSgxJXbbaLLE70tJDiL6JeRs1UP4FzDEMw2gImyE3wZfb2/93TY/wf2GF1+WRcPCUmjfeyVBxmjasG6DGyGAlvtJx7IgaylJKNGzOoQnkKYMyAETUJACcUNP7DV4fohrDbIN9Gc4hFDfWdbj6ahM5aBI8ij+MW8xKmB7lipSJbPwRQ7xZyS9z5iKD6aWqzobvhUIe6tUQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from BY5PR12MB4116.namprd12.prod.outlook.com (2603:10b6:a03:210::13)
 by CH3PR12MB9313.namprd12.prod.outlook.com (2603:10b6:610:1ca::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.13; Sat, 25 Oct
 2025 00:15:03 +0000
Received: from BY5PR12MB4116.namprd12.prod.outlook.com
 ([fe80::81b6:1af8:921b:3fb4]) by BY5PR12MB4116.namprd12.prod.outlook.com
 ([fe80::81b6:1af8:921b:3fb4%4]) with mapi id 15.20.9253.011; Sat, 25 Oct 2025
 00:15:03 +0000
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
Subject: [PATCH 2/2] gpu: nova: add boot42 support for next-gen GPUs
Date: Fri, 24 Oct 2025 17:14:59 -0700
Message-ID: <20251025001459.491983-3-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <20251025001459.491983-1-jhubbard@nvidia.com>
References: <20251025001459.491983-1-jhubbard@nvidia.com>
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR13CA0048.namprd13.prod.outlook.com
 (2603:10b6:a03:2c2::23) To BY5PR12MB4116.namprd12.prod.outlook.com
 (2603:10b6:a03:210::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY5PR12MB4116:EE_|CH3PR12MB9313:EE_
X-MS-Office365-Filtering-Correlation-Id: fc5896a8-504d-4f1c-bc39-08de135b8b80
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7416014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?/WQe+fm3DHFPhDmrLjPqrq3lG+yBRAF3YMU7cv/uhzYPeOHDKjTkbAK1YwDp?=
 =?us-ascii?Q?lbA8bNI7x3Rdan24VJsYXB1afSOSw3IXG3vu1R8jIU6GfoKmF1EAmddRtklq?=
 =?us-ascii?Q?DRIkGwAFQ26GKElvqa1jzmb/O2rvh/bu17/0YxqxyR4zIvPi4+WPoOy9qfAw?=
 =?us-ascii?Q?lPQYC/kLFgkYohk0DgoPREhJGqvioMT1dzjL8G1bB+X5bhYvDYuJ4tJo31dr?=
 =?us-ascii?Q?UCe5BuL8Yu+ri1kWrYzwfmVIdtULZ8GvcY34QIvyFvL2euGduklhOL8ndOSj?=
 =?us-ascii?Q?unR/IWxqotWBU1MG+FcC3Pmp4dRhLts1oDq5UEGQcaQejUBfDM/yBMlP7MKQ?=
 =?us-ascii?Q?3FB3Ivb+Wv40MQUejl1E9jLKikiunKeucEVB8V7fsE+1N+A1ZhoU2ke0tCUm?=
 =?us-ascii?Q?mDGenCW5N878D7dON6c4zbSfEMM1lJ6pK5AsSMh4JT51rkruUFbEG5JC1A4p?=
 =?us-ascii?Q?yszNBA4z6MOO6ScaT76B5FEGJl6iorK/J0zxOb5Me8UMUICIrO+rSjJCE/Pe?=
 =?us-ascii?Q?bEPqPwOJ70VhtZJaKdeUKQ4hhViaYBoiLqi2yI87srtQEp2Ambd5XnJUrwMj?=
 =?us-ascii?Q?YTq2+KvjxduAlYx17dMEPBLcJhZk7CCXSit8t3MoWAmw7eZTAe6TTWoYqTZd?=
 =?us-ascii?Q?KEXyRhkrH6D4JWXpfA0sj/FJmLRCfsPb9iX8hltoMl/1Eucl52cfXmg9dFbV?=
 =?us-ascii?Q?CmOGSnFoTnf96Lz9MN5CGhu3L+A0nU3F17253G+BZKU+VoaPJMiuR19eX6Ie?=
 =?us-ascii?Q?x+xX1J3vPYngylNe9b33BCLIeqnl5jCic6P+/aLrWa9X1aBsXtCsoaftamH7?=
 =?us-ascii?Q?F/SlL/zzo8+TVTnf4LhjVGGSGb4ewrAGhd9X6wlDgQov0SROAEspo+epG7KK?=
 =?us-ascii?Q?8awON6wsV1wrLrQDoO8+ZCtY94frY7kY8cn/le3skT0hJsYkt9OSJbSqWd6X?=
 =?us-ascii?Q?HyrhxByJGmWEWb1d+xuIuD1CXK14tsHW5wpFRWauSkLd/Zsme6t1TNY9fC3C?=
 =?us-ascii?Q?IyCLj+iacJNDR/Eaqun8mW9fnSfmrjaQunHrRWstKLhOdFCdhKXWawY07PHV?=
 =?us-ascii?Q?8kJFaP8qAng4nqeBoR6tV90dBFaXlQo2jEG3w2Ao5VxKaBlofEBUPhY/4GVZ?=
 =?us-ascii?Q?UHPikmVtM01mz6aPjj7ylSVlHqw5ji/tcmB4qDztAlQMRCKooUTfsuZ6c1gW?=
 =?us-ascii?Q?4Ax/mAtTnHIgecmAgK19yPCmGZBa8qz/7VkP3q6BNtCKNX7v0WX7NTOBX2pK?=
 =?us-ascii?Q?PNemWz+k8wENkhZYpMlqteE1mTAWA9t41Wyr6eIMPCdHBJMuR9azfTFYMjlx?=
 =?us-ascii?Q?oOQELg2n0wqWTK4inV5bxUjvaRElXYcnKiabmLgaZkszyFAC1mS66ttlY1sj?=
 =?us-ascii?Q?2KIALaKApM5m2TSUPAcpmRr6f1rNs7Ur5uroaBaGIAB45A/sVjgr9Eg1WAMj?=
 =?us-ascii?Q?3H43qTdl1Hmrh0Do+8I05uSfKAOMsQ/U?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR12MB4116.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(7416014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?TPLghsGNxr5JsHmSDvoQu32p2DXgId9kKEvldm7krdjtSdKcAAV5GjyeYT/g?=
 =?us-ascii?Q?Hb5mLeoJ2GRse1H1u/olaYRZJsp4vpmn3pWM0SWQIk2S+R+kgitFLg1LJtcl?=
 =?us-ascii?Q?R7lR7C8Mp+NvjvxFE32mvxkoJ5kbxew5/FkDOi6R8e8omhnLgWrFFX2zOfM3?=
 =?us-ascii?Q?d/rFu9YmpxJr34hkS1uQvVRmY8qZ9r241dvUbUlfE5vTfeznpT43RswgBuIg?=
 =?us-ascii?Q?HSOitW11AbWg2ZzoeoOpSz9LBNsHqq+jKGKykZ0uoZxUqPq7E6RXPFviLfl+?=
 =?us-ascii?Q?PX0MiRJMTf0Rk0kWiWG8rkfXLjYkhpNujpMw2FGKT1ORJp7PWKCZ2U6rkdUp?=
 =?us-ascii?Q?+UP3vxn1pbSJsptA1HDuo3dKjNkVSP7hjoSPwxSNDdFDd9LNARlaG6oaCLaL?=
 =?us-ascii?Q?huhzgQbI+P1UaWk9mpBTSsC6ApLVhdyhlRqbjP4k4/YZIWssqnBhbTkYxioH?=
 =?us-ascii?Q?Us2WUQeqvvCrDbTlcw39YnMK5AoXm3YQpyZ1dOVxSfdZYK2n7AO9zNoC+fLa?=
 =?us-ascii?Q?tO7q8/bzS0S0fhaeYqpvwTPX/jS9C9TX++naGQLz/K5H+qS/N2veKV2DaiL9?=
 =?us-ascii?Q?s8rvD/D/mQGanNc4gvlbxqWND6tArPF1eB1i1mi8l7slvDNAzfLenr5eUcyV?=
 =?us-ascii?Q?yAhUIGWxmGFNANbMN+uVj2mphwBLtZq4aFDrwlrSreVie9BtHrt5s7Tg+cEf?=
 =?us-ascii?Q?waIz42wa1opgXN3eAgJ3ItE/R3BrxUSWj1QvNrZ6pDEWKmynxfxznuPYhtaQ?=
 =?us-ascii?Q?X4uOforgLIJ39Ihoum7u2cUmAbpsG4+DZhyhtrBrMrSvKzJT35hOlgeI5N5C?=
 =?us-ascii?Q?F5STYHMf37KddP4udnAmreZeomt4djdgcSrKFQsKX8dBUL6/B8magfW4yLer?=
 =?us-ascii?Q?sBo0pb2z4rMtpgwNTSIsImrckKRvZ8Mz2Er5kDMbyKX5SxjjtNcZum0hXk+A?=
 =?us-ascii?Q?T3l5LhFtRDZHYSGGP5QpsgiIqiz1WVmn104KP8fI98GZt6oRE2Kmg4gOBpya?=
 =?us-ascii?Q?okQiz/oWba0zhZyP17SMAMcZIaxlBJNtO6rS2ny/sF4zTfIpWqHyYirp9keX?=
 =?us-ascii?Q?1g3dPmvlWA+Uyrz3zDEdPv2UHxLNB1FW2eY4C1GsLbJapL1Czg//qq4MBAIW?=
 =?us-ascii?Q?7cQNa7dHlYRQndYqebW+zOCJ89Nf90clbS7QrAJwV2d141sEfK2iWA/LSNO3?=
 =?us-ascii?Q?n3Ai8UeLbmgXQEChi3mNwmWiClaJkfo129dBrL/DsyhJT6aL8XdD0BpIAjlX?=
 =?us-ascii?Q?4XO6W9oHJ3XLYewuuR4jsn/Qvx6u1HHRd6XnYepw3v5kwaOa5nAhe3CgywQg?=
 =?us-ascii?Q?a2h2CmFZXVt7JektGH8QwdEoOjLVOAsyPpTcEXVS5T9E8llOn/Nzl9JTeL6h?=
 =?us-ascii?Q?8yID7mfQ2PwNIsA39NYoFclUDE042GKl0ImvmYkONv2N3FNzBlExOrU6tx2C?=
 =?us-ascii?Q?MCvvvOd/2L4XYFw+KSNvL6nO1ObSGwHnMKS1czuJKAOBtvgv9JNWFBqYbc3M?=
 =?us-ascii?Q?U22hYuqp2upsT6s+bBLHnTwIydxJIYf/BFsEXvh8XRnFk/Fz0TySttVgocEB?=
 =?us-ascii?Q?Yed2La7y6tQp/yXBuKFSoRnbQy4iIj3WgZAdB8s3?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fc5896a8-504d-4f1c-bc39-08de135b8b80
X-MS-Exchange-CrossTenant-AuthSource: BY5PR12MB4116.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Oct 2025 00:15:03.8078 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 60/Zfn/m6F1m2kQSfnVB1tqB5US/XW0+BaF/2cCs2wvSVE8r+XRr4JnHxu8Ea+TUXg3UVg5px3LTNvSWp/jskg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB9313
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

NVIDIA GPUs are moving away from using NV_PMC_BOOT_0 to contain
architecture and revision details, and will instead use NV_PMC_BOOT_42
in the future. NV_PMC_BOOT_0 will be zeroed out.

Change the selection logic in Nova so that it will claim Turing and
later GPUs. This will work for the foreseeable future, without any
further code changes here, because all NVIDIA GPUs are considered, from
the oldest supported on Linux (NV04), through the future GPUs.

Add some comment documentation to explain, chronologically, how boot0
and boot42 change with the GPU eras, and how that affects the selection
logic.

Signed-off-by: John Hubbard <jhubbard@nvidia.com>
---
 drivers/gpu/nova-core/gpu.rs  | 69 +++++++++++++++++++++++++++++++----
 drivers/gpu/nova-core/regs.rs | 28 ++++++++++++++
 2 files changed, 89 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/nova-core/gpu.rs b/drivers/gpu/nova-core/gpu.rs
index a8a993424771..a00036721247 100644
--- a/drivers/gpu/nova-core/gpu.rs
+++ b/drivers/gpu/nova-core/gpu.rs
@@ -155,16 +155,67 @@ pub(crate) fn new<'a>(
     ) -> impl PinInit<Self, Error> + 'a {
         let boot0 = regs::NV_PMC_BOOT_0::read(bar);
 
+        // "next-gen" GPUs (some time after Blackwell) will zero out boot0, and put the architecture
+        // details in boot42 instead. Avoid reading boot42 unless we are in that case.
+        let boot42 = if boot0.is_next_gen() {
+            Some(regs::NV_PMC_BOOT_42::read(bar))
+        } else {
+            None
+        };
+
         try_pin_init!(Self {
             chipset: {
-                let chipset = boot0.chipset()?;
+                // Some brief notes about boot0 and boot42, in chronological order:
+                //
+                // NV04 through Volta:
+                //
+                //    Not supported by Nova. boot0 is necessary and sufficient to identify these
+                //    GPUs. boot42 may not even exist on some of these GPUs.
+                //
+                // Turing through Blackwell:
+                //
+                //     Supported by both Nouveau and Nova. boot0 is still necessary and sufficient
+                //     to identify these GPUs. boot42 exists on these GPUs but we don't need to use
+                //     it.
+                //
+                // Future "next-gen" GPUs:
+                //
+                //    Only supported by Nova. Boot42 has the architecture details, boot0 is zeroed
+                //    out.
+
+                // NV04, the very first NVIDIA GPU to be supported on Linux, is identified by a
+                // specific bit pattern in boot0. Although Nova does not support NV04 (see above),
+                // it is possible to confuse NV04 with a "next-gen" GPU. Therefore, return early if
+                // we specifically detect NV04, thus simplifying the remaining selection logic.
+                if boot0.is_nv04() {
+                    Err(ENODEV)?
+                }
+
+                // Now that we know it is something more recent than NV04, use boot42 if we
+                // previously determined that boot42 was both valid and relevant, and boot0
+                // otherwise.
+                let (chipset, major_rev, minor_rev) = if let Some(boot42) = boot42 {
+                    (
+                        boot42.chipset()?,
+                        boot42.major_revision(),
+                        boot42.minor_revision(),
+                    )
+                } else {
+                    // Current/older GPU: use BOOT0
+                    (
+                        boot0.chipset()?,
+                        boot0.major_revision(),
+                        boot0.minor_revision(),
+                    )
+                };
+
                 dev_info!(
                     pdev.as_ref(),
                     "NVIDIA (Chipset: {}, Architecture: {:?}, Revision: {:x}.{:x})\n",
                     chipset,
                     chipset.arch(),
-                    boot0.major_revision(),
-                    boot0.minor_revision()
+                    major_rev,
+                    minor_rev
                 );
                 chipset
             },
@@ -175,21 +226,23 @@ pub(crate) fn new<'a>(
                     .inspect_err(|_| dev_err!(pdev.as_ref(), "GFW boot did not complete"))?;
             },
 
-            sysmem_flush: SysmemFlush::register(pdev.as_ref(), bar, boot0.chipset()?)?,
+            sysmem_flush: SysmemFlush::register(pdev.as_ref(), bar, *chipset)?,
 
             gsp_falcon: Falcon::new(
                 pdev.as_ref(),
-                boot0.chipset()?,
+                *chipset,
                 bar,
-                boot0.chipset()? > Chipset::GA100,
+                *chipset > Chipset::GA100,
             )
             .inspect(|falcon| falcon.clear_swgen0_intr(bar))?,
 
-            sec2_falcon: Falcon::new(pdev.as_ref(), boot0.chipset()?, bar, true)?,
+            sec2_falcon: Falcon::new(pdev.as_ref(), *chipset, bar, true)?,
 
             gsp <- Gsp::new(),
 
-            _: { gsp.boot(pdev, bar, boot0.chipset()?, gsp_falcon, sec2_falcon)? },
+            _: {
+                gsp.boot(pdev, bar, *chipset, gsp_falcon, sec2_falcon)?
+            },
 
             bar: devres_bar,
         })
diff --git a/drivers/gpu/nova-core/regs.rs b/drivers/gpu/nova-core/regs.rs
index 206dab2e1335..bcd0834c500b 100644
--- a/drivers/gpu/nova-core/regs.rs
+++ b/drivers/gpu/nova-core/regs.rs
@@ -25,6 +25,19 @@
 });
 
 impl NV_PMC_BOOT_0 {
+    pub(crate) fn is_nv04(self) -> bool {
+        // The very first supported GPU was NV04, and it is identified by a specific bit pattern in
+        // boot0. This provides a way to check for that, which in turn is required in order to avoid
+        // confusing future "next-gen" GPUs with NV04.
+        self.architecture_0() == 0 && (self.0 & 0xff00fff0) == 0x20004000
+    }
+
+    pub(crate) fn is_next_gen(self) -> bool {
+        // "next-gen" GPUs (some time after Blackwell) will set `architecture_0` to 0, and put the
+        // architecture details in boot42 instead.
+        self.architecture_0() == 0 && !self.is_nv04()
+    }
+
     /// Combines `architecture_0` and `architecture_1` to obtain the architecture of the chip.
     pub(crate) fn architecture(self) -> Result<Architecture> {
         Architecture::try_from(
@@ -43,6 +56,21 @@ pub(crate) fn chipset(self) -> Result<Chipset> {
     }
 }
 
+register!(NV_PMC_BOOT_42 @ 0x00000108, "Extended architecture information" {
+    7:0     implementation as u8, "Implementation version of the architecture";
+    15:8    architecture as u8, "Architecture value";
+    19:16   minor_revision as u8, "Minor revision of the chip";
+    23:20   major_revision as u8, "Major revision of the chip";
+});
+
+impl NV_PMC_BOOT_42 {
+    pub(crate) fn chipset(self) -> Result<Chipset> {
+        let arch = Architecture::try_from(self.architecture())?;
+        let chipset_value = ((arch as u32) << 8) | u32::from(self.implementation());
+        Chipset::try_from(chipset_value)
+    }
+}
+
 // PBUS
 
 register!(NV_PBUS_SW_SCRATCH @ 0x00001400[64]  {});
-- 
2.51.1

