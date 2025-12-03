Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C35FC9DD9B
	for <lists+nouveau@lfdr.de>; Wed, 03 Dec 2025 06:59:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 020F210E718;
	Wed,  3 Dec 2025 05:59:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="sDk4map8";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from PH8PR06CU001.outbound.protection.outlook.com
 (mail-westus3azon11012011.outbound.protection.outlook.com [40.107.209.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C1C1D10E718
 for <nouveau@lists.freedesktop.org>; Wed,  3 Dec 2025 05:59:55 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nbkgbGVJe5MGyWxqO4CQgz+JwlYAssykwwWrUt8sAJBOclJUG20ORxzaagWhZ4gBkNxZat+NOe4zFF3refWjLHdM7hjdoOOabjztZusdG6qbUXRHFrNSmIAN6TkyF6zk+rnIG6+5Xu5Tt9Jd0kiJZaU2hI0HhWsMPXvLOpw33kUBAxSqAm3gBGse4aDpLQ3b2Mwx0cAR9CtPsros9EBL2eEiMxxfGCLfubuYdjKkbm9YWZBtljn+VEQagMylSaQhJjQ9bhqI9g7qD5Rv74eoRsg2cFe4etU0u+HtVvAZQSqN0sNjxdjpE00pb0GZwUbijYQinm9PgflFonjPeS/mgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ewn4sMij5p1fYJVvHc6KEOdnPJu+p4PvEivaGzzq7ys=;
 b=WUujGVtPtQNhE44M01PDOAYG2Wc807fgdvZ2UpL011YI2OZlfD0m0sxUMX3VhZwZ5DBYM/dhkfwk8Hy01K5uTwnmLlpvqB9uEXKaiclKLq3pNO6n7cZrVZgxG0W4ApPsvLu6kluCXqLiLEqFR6nwYnA8JOzRCKY7mX9tJFti0xtG6iNBAUvEokeLTqzQmV+uG75/A3/JuVaaM6G3erDLl8haIXZV3hlv3qapMJ4UIye67Nqab0ISbTmDk4HZhh19ouTWp0a9cxQcgME9yRsoe/VuTsfDeLIeuMP7ZFS8OIxp3lGWuLdExt29I0r21X+X/MtDvtGFqOv4tKKR4v9fTA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ewn4sMij5p1fYJVvHc6KEOdnPJu+p4PvEivaGzzq7ys=;
 b=sDk4map81rwCfq9AwvVOXgY9vGjUKe0zs63a6DIVDYJnzm7v13NkY0elIMpORjRluE5F8trFCZV37xf3yXOE7BCGvAKQbqNpnggntSnmKaQz8WgZi9o2k2rjQrT4XFKFpK1xtlnZQPw+Ib4tRQjNDrLTnUUIewwbu08egfZMuPGdtFvjvFstf2UCqmaQwkNg9cyshZAvDIalF85GHEKaIsSAwWX+5O/1mhS3+TfOTap3NNIfqsyl9qa7AHxYvP/cgbsM18cd8ejBX03fuH9b1Vw/i7LhSesNho4VzoRruY+TXdfs5cJYfJsVxS8cNA6dWy9QfHtD7oh78WL5a5sAZg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 PH7PR12MB8013.namprd12.prod.outlook.com (2603:10b6:510:27c::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.15; Wed, 3 Dec
 2025 05:59:51 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%7]) with mapi id 15.20.9366.012; Wed, 3 Dec 2025
 05:59:50 +0000
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
Subject: [PATCH 17/31] gpu: nova-core: Hopper/Blackwell: calculate reserved FB
 heap size
Date: Tue,  2 Dec 2025 21:59:09 -0800
Message-ID: <20251203055923.1247681-18-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251203055923.1247681-1-jhubbard@nvidia.com>
References: <20251203055923.1247681-1-jhubbard@nvidia.com>
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR13CA0116.namprd13.prod.outlook.com
 (2603:10b6:a03:2c5::31) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|PH7PR12MB8013:EE_
X-MS-Office365-Filtering-Correlation-Id: f34f9013-ec61-4493-109c-08de32312b7b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|7416014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?D9F8ybRFzlZ4SUbOazCi/c3fTDmBGm+dvNZ4WD3wzzIdkgxlq4VK3dxHmT+k?=
 =?us-ascii?Q?qJmG2ng3uvRY4DoLK5IO5jsTd/xj7dQ2UTgYbPOGgcpWN0I9kDmjWM6KwGWO?=
 =?us-ascii?Q?61ofgq7kBWtlLdjhI9CRrEC++B/khzNPcyhfwmtLVyfRMZ6eFm6vMOCEhVFd?=
 =?us-ascii?Q?jwd2KRToirWFsA55E80oz1yw3mC9Wjgx4iI6YJcALXwTJmlgQB7oE6c2zFex?=
 =?us-ascii?Q?s8GEtvqUlw9+Iv/6mRdHabrnZssnhK7VLD/JGv5g00ik/QX+WpfmnxNf3lPA?=
 =?us-ascii?Q?XFbU8wOGLO6um6dJmHbl+7gBFsF0H17YmP+jjB9VpSjhLktafUGBRpzSfyyE?=
 =?us-ascii?Q?orW+OchaZQrIfpTMSlGaWuOQbidQL0/LeCvnZ2xokrT0oV1Vz0Va+gW3LvbU?=
 =?us-ascii?Q?cVa7NX6t69gK3+1UoiNil/CVeLAO8nyywMEqi5DIgowYs7/lj7/P36312IC0?=
 =?us-ascii?Q?Wh8xNSlTP2hBjVI67e/MTcMCLihW+h0SuntPd5IH6GHSwnaHR0qs1PDst/0+?=
 =?us-ascii?Q?ODq7csklFNeX5axJfvJfGOb69H5o07Pv1DEnojnTyBbx5m8hftvSY73Ct7Ar?=
 =?us-ascii?Q?zKobeuTVwn8Sb9y9rIwCAacVOvaKVhIka8U+cthrf0Ub0eXn7u7zj1ZZYgLW?=
 =?us-ascii?Q?6qpbXAAHRkrvgSvciXlVC7BHcksQlEyoGTJfX0eLrtUNMn3LH8sLi+oGeLhv?=
 =?us-ascii?Q?AxRRQCXalxcfsjX6OG7dSbsy02314UEA0+uZIz9lhPPhnTBWK3H9EMvot9z5?=
 =?us-ascii?Q?dAT7kpi6wHB6XjBSajJii5qoTnYGNUkuV4HOVMS86PuV8UUuwS0w1pBJ/1+Z?=
 =?us-ascii?Q?yVBAP1FIpcDPdDcMa64f6TUv1Q4bLU70Xp38biaCKI6WB4gbV0Y4kQ7J8zoN?=
 =?us-ascii?Q?O9NC+NN1r09FgVtSgS/BELxs+8GDB2x3Z5h4tfmebk7dqzqC9SiycEd9qe98?=
 =?us-ascii?Q?kjWBLKRwVFjmNABpx9rZ8/X4u/ZXhPWKKS2WzX7xk6hl62Ri6NAb05qk98aN?=
 =?us-ascii?Q?Po6b+lNc4nAMce3s3LPJ6aZIkgINFqpN243x5b4qtcvLnPkdmSnUeVnzsEJP?=
 =?us-ascii?Q?g2r5qHPinLJGuB3jPKwVK++33oRsrjMEykiGs4uipWtGYa69ckrHNcCuMyxi?=
 =?us-ascii?Q?5dUanDzYUxxyAFyE/lVA1tHjTPrR6dJvIKW+AWmglNW5o2jDfbB86YCqAZvS?=
 =?us-ascii?Q?oTF+kbexs9vL5zs1yViAjihDCUO9EqZC1okkpRDtk7YRQwzFy8actD6X+0br?=
 =?us-ascii?Q?NgYtyd6aB4kKoqfZfUsIGgEMdmgiH9FZoeUIWNcamgMAq/e+oic8QyKySjsK?=
 =?us-ascii?Q?wsXdeMHJSn7yu2oPCzWT/lXhQW8UhB7809SDg/0OvGKqF7CqsxMsLqRZIjcg?=
 =?us-ascii?Q?cYfHvFBnUHXwd9SX9uDlnRloYc08ymzYrlVKnmBHybqktPHM/t9Zmq4ybGKr?=
 =?us-ascii?Q?eWwhUMYN4HRD8T59BntIfQ6JL+tR97vS?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM3PR12MB9416.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(7416014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?QJ/24Uk1NMS3Tw3cIc/hyZTO0HCEcAdrCuDy5XWlLD5bCVx+S+2jAKg7SY41?=
 =?us-ascii?Q?Qf2Zkbqh16k53DNzdxkwz7AyAwwTmnsb0t24aKdRvENDZbeNQz5Nsa/+S/Va?=
 =?us-ascii?Q?gqE4s20ugHMEBW/RYtvDoTfbZuLzqWosm9P40wIpZz9DrMcIAgRjemtBLZ1W?=
 =?us-ascii?Q?HEM0rtn8yRgX8rtCmClFLZLIsmNwEwhv0NEyWpCZBuzcnLSQhBZtQhn3oiYE?=
 =?us-ascii?Q?Bx9B6biBB7S56YEoxNqSX/3vfoABDp2CVT5YLtqgw62mvDlRH6iN+6GefBIT?=
 =?us-ascii?Q?o7+iUVjyCFUIHniWUurnQuL3qcp0ijVRBEWBC46EdmCt2y0doiqGtQ5H2C6j?=
 =?us-ascii?Q?YuahhAEa3ZUXjS33aCJwL4d7ukOEsAyzGB+BPLi4u157s1dUU3ScRoJnE3dV?=
 =?us-ascii?Q?AAghJbVadl4XJ+EWDvabgQhdMak6QALllVk/H3MVgqq+HY0ppO9ym48/5tvE?=
 =?us-ascii?Q?3MEHJP4g5RSsre+U/sqLWgZKJd+nQaGe5rvhNZAkmVkwRb0jaI87srqPPyi6?=
 =?us-ascii?Q?/aA3LQ1SRbGRg5cnAJ1SQT+5/M5jcbOvPmeN2qrB3twW4p/tS4La6ocd4Lv5?=
 =?us-ascii?Q?5Md8yDDC7K8sturVlePJknuVDQ1LVe0Wx+4KEsSZp0HOq8ywUQFWXdzhFUAz?=
 =?us-ascii?Q?1V7cWbNCXMCS1el+tJv9T6CaJYsNS5y0S2EphPf79yfshNAklsrFqTogKD9W?=
 =?us-ascii?Q?hjcsb7JXS+FmHaoPaHJMx8a43oosx/dqw80q2hoIcSNOIx9LeR/LzxclnyVm?=
 =?us-ascii?Q?PNcSQsDhRqnNjT2qBRCa/pLbc6XJfS1e1GxG/KmLnl8nMXOdfz0FtxECl3Gv?=
 =?us-ascii?Q?4jEIgAZxYXyQjpLdHcLQc2TTAUJFyDLjbwBuUTiUiSYyDiVTgcVSDbYiqxUj?=
 =?us-ascii?Q?SRP1uQAzbd8E3nzI02tWYO6TnQYFLAb7OyX4/w5Aj4pOpG3g4wBTWQJDIowH?=
 =?us-ascii?Q?FHVWeW7nXj6g8RD6i4C4mQNRMZkfepSfUk0dXqatdYxxNxohdzreueMF/vPh?=
 =?us-ascii?Q?4f2bdGOKiYQjo214NqU7Dibbp2bUTv6hvlh802fY2zlH06RiCt0PMZwn4xMC?=
 =?us-ascii?Q?plmliunA0R68xk9CCIkjU3F/4bVx+U5LDEMIAy5Em3o9yfQkxOEgv33XDYAx?=
 =?us-ascii?Q?2zoKpM9Zt1uuTHRpRcdZlNNEn1JwpmNrMXMrgSJAZAAK2nAbDDT8YgxtJGPJ?=
 =?us-ascii?Q?SlrSqmBeeUbqQn88so/EMwMM+aN5NJJBiXZFm0eCkZIEo9vxqc1qNlGXGETm?=
 =?us-ascii?Q?9iuT2VKU8IIMVX75VfT2rBfqvzCr2QsWaawtkFFEWklPPQaHTOhDhJg+lFdd?=
 =?us-ascii?Q?YCcUBTys5vRw2HRfNFohfGkEqqM5pITFlcF5h371TIs3enLL5AMdVj33ewWd?=
 =?us-ascii?Q?unn69ZrzFJdBc7RuAk+EfW+agni03U1V9Sa8UCNarwFTwnwDpkJLhn9Opkx8?=
 =?us-ascii?Q?xv+e56K5aEPcb4IphJCE0lFlTkLLqsyru9B4p3ogCmYq8h8/oe24m5Ejt4lf?=
 =?us-ascii?Q?VpJCoRMhRI5nCsFlhu478GRXa7+i6Iasr8FEyw1guP1DofhOW3BbBaHyPe5B?=
 =?us-ascii?Q?fflf1UgeQ+S0bZeOm2ij9lIi7EjSW8Q0h2rQCpUS?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f34f9013-ec61-4493-109c-08de32312b7b
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Dec 2025 05:59:49.9014 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JSkqJAS6pbDt3SeSWZGb9g/VvEdbQ3r+/+cD3h4BGshW1h8BplHL+a0T3D0gWzcmnniCs4zcoQ96LVIXMbatLg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB8013
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

Various "reserved" areas of FB (frame buffer: vidmem) have to be
calculated, because the GSP booting process needs this information.

The calculations are const, so a new const-compatible alignment function
is also added to num.rs, in order to align the reserved areas.

Signed-off-by: John Hubbard <jhubbard@nvidia.com>
---
 drivers/gpu/nova-core/fb.rs     | 18 ++++++++++++++++++
 drivers/gpu/nova-core/gsp/fw.rs |  6 +++++-
 drivers/gpu/nova-core/num.rs    | 10 ++++++++++
 3 files changed, 33 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/nova-core/fb.rs b/drivers/gpu/nova-core/fb.rs
index 9fcd915e12e1..e697436de29a 100644
--- a/drivers/gpu/nova-core/fb.rs
+++ b/drivers/gpu/nova-core/fb.rs
@@ -153,6 +153,9 @@ pub(crate) struct FbLayout {
     pub(crate) wpr2: FbRange,
     pub(crate) heap: FbRange,
     pub(crate) vf_partition_count: u8,
+    /// Total reserved size (heap + PMU reserved), aligned to 2MB.
+    #[allow(dead_code)]
+    pub(crate) total_reserved_size: u32,
 }
 
 impl FbLayout {
@@ -240,6 +243,16 @@ pub(crate) fn new(chipset: Chipset, bar: &Bar0, gsp_fw: &GspFirmware) -> Result<
             FbRange(wpr2.start - HEAP_SIZE..wpr2.start)
         };
 
+        // Calculate reserved sizes. PMU reservation is a subset of the total reserved size.
+        let heap_size = (heap.end - heap.start) as u64;
+        let pmu_reserved_size = u64::from(PMU_RESERVED_SIZE);
+
+        let total_reserved_size = {
+            let total = heap_size + pmu_reserved_size;
+            const RSVD_ALIGN: Alignment = Alignment::new::<SZ_2M>();
+            total.align_up(RSVD_ALIGN).ok_or(EINVAL)?
+        };
+
         Ok(Self {
             fb,
             vga_workspace,
@@ -250,6 +263,11 @@ pub(crate) fn new(chipset: Chipset, bar: &Bar0, gsp_fw: &GspFirmware) -> Result<
             wpr2,
             heap,
             vf_partition_count: 0,
+            total_reserved_size: total_reserved_size as u32,
         })
     }
 }
+
+/// PMU reserved size, aligned to 128KB.
+pub(crate) const PMU_RESERVED_SIZE: u32 =
+    crate::num::const_align_up::<SZ_128K>(SZ_8M + SZ_16M + SZ_4K) as u32;
diff --git a/drivers/gpu/nova-core/gsp/fw.rs b/drivers/gpu/nova-core/gsp/fw.rs
index abffd6beec65..8d668a24142c 100644
--- a/drivers/gpu/nova-core/gsp/fw.rs
+++ b/drivers/gpu/nova-core/gsp/fw.rs
@@ -27,7 +27,10 @@
 };
 
 use crate::{
-    fb::FbLayout,
+    fb::{
+        FbLayout,
+        PMU_RESERVED_SIZE, //
+    },
     firmware::gsp::GspFirmware,
     gpu::Chipset,
     gsp::{
@@ -183,6 +186,7 @@ pub(crate) fn new(gsp_firmware: &GspFirmware, fb_layout: &FbLayout) -> Self {
             fbSize: fb_layout.fb.end - fb_layout.fb.start,
             vgaWorkspaceOffset: fb_layout.vga_workspace.start,
             vgaWorkspaceSize: fb_layout.vga_workspace.end - fb_layout.vga_workspace.start,
+            pmuReservedSize: PMU_RESERVED_SIZE,
             ..Default::default()
         })
     }
diff --git a/drivers/gpu/nova-core/num.rs b/drivers/gpu/nova-core/num.rs
index c952a834e662..f068722c5bdf 100644
--- a/drivers/gpu/nova-core/num.rs
+++ b/drivers/gpu/nova-core/num.rs
@@ -215,3 +215,13 @@ pub(crate) const fn [<$from _into_ $into>]<const N: $from>() -> $into {
 impl_const_into!(u64 => { u8, u16, u32 });
 impl_const_into!(u32 => { u8, u16 });
 impl_const_into!(u16 => { u8 });
+
+/// Aligns `value` up to `ALIGN` at compile time.
+///
+/// This is the const-compatible equivalent of [`kernel::ptr::Alignable::align_up`].
+/// `ALIGN` must be a power of two (enforced at compile time).
+#[inline(always)]
+pub(crate) const fn const_align_up<const ALIGN: usize>(value: usize) -> usize {
+    build_assert!(ALIGN.is_power_of_two());
+    (value + (ALIGN - 1)) & !(ALIGN - 1)
+}
-- 
2.52.0

