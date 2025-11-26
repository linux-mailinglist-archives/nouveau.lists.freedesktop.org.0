Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9587CC87B97
	for <lists+nouveau@lfdr.de>; Wed, 26 Nov 2025 02:41:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 351BF10E4E2;
	Wed, 26 Nov 2025 01:41:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="O0bozW+z";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from CY3PR05CU001.outbound.protection.outlook.com
 (mail-westcentralusazon11013003.outbound.protection.outlook.com
 [40.93.201.3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E00910E4E2
 for <nouveau@lists.freedesktop.org>; Wed, 26 Nov 2025 01:40:59 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mp++SwHkrvy09mFRzuI1RZ42Xad232tljXv51fzKR/mnWj5kiBD409tm/7GliOHFtdN0kPIIhz1PKWXrrniDc7DIep/droRjXZKM5cQ+nzdyDtnFTOdfZt1N9A66AvmCNEAAUWvHAO7eL3ozanCO7sA9TrQqFq4rGVp7HfYc2BMmT+T8Yqt7jkGbriucaBv3gCUxjxVP9yzn7xuzKn/E/facX6FC92AZ34bKLHwZCud+6qBTcCbtNswIjCJyRSt1jlssamVFBdLVzwW82MZatfXGicWl4F6QuXxiBJ9Y2qnfNAVhss7BK4ubmFR5Ox3gqVGktmlUmPbb1cKPYxLKYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MuLegbD+0RStRUzvguz5VZ3qj9GDYL+kDElAvI4lThw=;
 b=HVZ+5fuczbdnJjqyZ30oXflj4Vxs6aerwSq7DdVAEUWOgsQYSm+PRkXW3ZKNVALCFhsHJ3E+9/Qj6Fgd4dwrJMz6oo+ZbTLtA4BEcREO7dnWNlFLrUWUcX279VXtp+kswFTDHKT6yg8XumJkofmdvcSb1HTYSzTgr3AhDwf9gkMVucIIVljArjEbehr1urWuiHhn5aTzsJMywdDSswQ6FEQqleW3zZnmln5aQh2oQSzDizQVG72GRzlFpPj8STouK/MNhSz9R/n8K4Yd5TuNfmrLn9Yyv+WNkF5986uzCVu8otAiTJjx3LEMqGLpeE7s/0nPPzOnRcV93DiJI8aWoA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MuLegbD+0RStRUzvguz5VZ3qj9GDYL+kDElAvI4lThw=;
 b=O0bozW+z7KFbUax2KD9G4iwrNHClNXUc+6sk8G2dvyMdnwC3yFwt9gjj2PP9hxn4o6vtDivOIQqznKtGYhssuqeCgbh4bFNdfh+ECZLMqC4DXuCo+C4L1xK6yIEiN4UuLeL/eGO5CQU1O3ycsBYNAN4l21xWDmVDD3XY9qhOMU8PBdZbNo7Vj6r4C/hlNI2zImJG8Jugt0euTIx9pCXORO2efo0kpr5NiHwf2zhIR9JCqqHkwRMezYgSMhtvXWmHRSNc6QD4UGFzTUtyZPSOrIZqX01sjj7IKLeD+r/97tAl+60L9EsgqIbe+kqyqdnxeQLZ0IER+FiHt0UnPguLxA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 SA3PR12MB8022.namprd12.prod.outlook.com (2603:10b6:806:307::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9343.17; Wed, 26 Nov 2025 01:39:45 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%7]) with mapi id 15.20.9343.016; Wed, 26 Nov 2025
 01:39:45 +0000
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
Subject: [PATCH v2 5/5] gpu: nova-core: use GPU Architecture to simplify HAL
 selections
Date: Tue, 25 Nov 2025 17:39:36 -0800
Message-ID: <20251126013936.650678-6-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251126013936.650678-1-jhubbard@nvidia.com>
References: <20251126013936.650678-1-jhubbard@nvidia.com>
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY5PR20CA0011.namprd20.prod.outlook.com
 (2603:10b6:a03:1f4::24) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|SA3PR12MB8022:EE_
X-MS-Office365-Filtering-Correlation-Id: 6dd10504-214a-42c1-f489-08de2c8cad78
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|7416014|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?iEfTMAa26mjF97KfPE87exq0QN51msMd9ZJ15qwvLHmz8hfesgtJOjqH3DMF?=
 =?us-ascii?Q?holOKPKiyAkEZrJr8OwraWKASZS4sjjpcqHcKb1oVTcSRGquKi9BM3LYz3KG?=
 =?us-ascii?Q?W5l1Rzw+aExD1PXT+wsSFuGdoXb+yzRVjqGYdNU6eFWcbzwc9Zj/58iQhFEO?=
 =?us-ascii?Q?R5/sTEzb7SWCC0IF7/PcfzxsesHcNvh5PMbWGmADJIry/KLOORjLnsLFV8u8?=
 =?us-ascii?Q?MsW+/Zrr8y7esjN2l4J0HnMGYM6fJaKhhd2Ny4Xrteb5jTpEFeWWjw9lrfq1?=
 =?us-ascii?Q?7ZwX03uifKNUHfU30bW/Z9ede23O12VHWAJrwV24JrgEpUoCur8WFAYM/pt7?=
 =?us-ascii?Q?3dwsDja66TiVaiiFu2lwwDuTqdq1Ip6RQIaoHVhrcIecx/LVppvfmHXG5FEY?=
 =?us-ascii?Q?AReR2y8ElRVWKsPIXX7jjYhusdVf7M6+n5qSWCT/YRP22aUUY85YPEpTg+Qe?=
 =?us-ascii?Q?lC6G0wYPE3vyeB31LaRFPdCgk7PFGbN/Uo6oF+QW+Wsf51nUAwxcR2GbQYxz?=
 =?us-ascii?Q?Y88jGQpd+rEspOXO9m2hkTyL8vsZfx3J6v8vnNkEJRGysVFdtWNMcfRpCE77?=
 =?us-ascii?Q?7fH9znCnHbf6DuJ/AFSKDQkTC+G8b0fzfFbS30wOOOhVw9LSeHKqfyideezD?=
 =?us-ascii?Q?jLoe2HGE1iOMkoNIiijS/wZg34onfkZfz53WUQxoW+mAlYdHOFxgEVg4UnWg?=
 =?us-ascii?Q?ahisKVXC1JJRbSRBkR0px3Aokd6tQoxUe/BZkir0Mp9d2Hjs4UzSMwnrVG7v?=
 =?us-ascii?Q?DTtIalr/vW0ZvlSz6+LdljNAnyoo1aSYcN6rsiKjMrp9i7mI07yigHoZcj2w?=
 =?us-ascii?Q?iy+5Cgk0xSXOJKCRIUR5kTeSZqaiKw4vKWuz6LqQ96vTFtuHm8yp1hNsTLyO?=
 =?us-ascii?Q?ke6DcKt3jrRcXKLsaLCdffb2mvvjOWuJ6qJkZgdo5y3WQvr2ieasc5mVfGl4?=
 =?us-ascii?Q?6Sz7fSa4zZQk79KGQzHTgmo8njISDNaz52xaqvxu+UR54GIG0j5uqNvVTkdk?=
 =?us-ascii?Q?SRKNvjdT1kCTAJy0xi6BGvi6O8ycE75JHVWvvyyFM5tz0oHs+VlfCk7S+GgJ?=
 =?us-ascii?Q?15K9js395vkk86aME9myQZPgQKBJihDz+RPJaPZDT9r0oczf+qz9aKzXpYHQ?=
 =?us-ascii?Q?LSNMNexvhfW2Ge1xzG/e1HFAWhXw7CQNk+WPYQgjngYQBR6XX+xM86TqAPRo?=
 =?us-ascii?Q?lUCOVhQr3oZF3BiHsDQzuFraDhnzj/8GkC1ow94y8Wh0ijuNEuy3HPBSBts/?=
 =?us-ascii?Q?AqTptno3KDBLkH07o7BaPMWZCA/dITvQHsjRpkXijsZP0q6P5eb4XKHH/eD6?=
 =?us-ascii?Q?SGxYVGpbr7tOjM+M8aucNSgkM3JAkpdUpE2cK5asg0qQTei83ahdM0jJstu1?=
 =?us-ascii?Q?Ox4lD3als6SIqUom1Den3VqeJWX8kIO2gi9qs0Tw6ytgdHEEbFdL/f+3OTjU?=
 =?us-ascii?Q?oRSIQVBvV7xdntYppc3J9GfYdKDDwuyb?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM3PR12MB9416.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(7416014)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?hZwgWkff4ok0quGDNhIlIA++EshoeFHP/CAfAAeX/sMyPr6lfwMIDpzUqcH3?=
 =?us-ascii?Q?Oa44C412UopfyP/a0HKoE7ORyx4+2N+BHwId23vSJwLYE+jFin0Z2h/8wHzF?=
 =?us-ascii?Q?fSCJAwZGkJJkBt++vUn+AmZMeXSiAnfPzs7IvaHWRvk3gdYwI5UN01ZXYAzx?=
 =?us-ascii?Q?xpCNzP6wpzkrfAdwS4b/95g9cgOknEse/Z1ZHAL8RFDDCfsyd9Xpm3CmKo+E?=
 =?us-ascii?Q?01h9flsShKMBVNi0mP7XZc4noYOk2FHy7AFKCTlkYVndSBgUiXn+yP1X3W4b?=
 =?us-ascii?Q?46p2r/OTBUgFmFbWlDvm5mHAjZkH0nWeLtlQFh4c0NEXtMRqxqhTq3n9xzdB?=
 =?us-ascii?Q?pUNG/1LEcV0VwzpApleRigrWhcBPnR/mcbXHeAvTC8m0b81ZvnmwwFjLM9DX?=
 =?us-ascii?Q?AsGUakxBXWVSu1O7wcnaiEyx++ntLtJAXg9C3ee9kR91l8pQGX7snpBRAV8P?=
 =?us-ascii?Q?vuihepoSTmgrBAuUWSPZ6jI681y3S+TKVzR5iFjY7Eb5xnt6B00Yvl+nTkhh?=
 =?us-ascii?Q?g0sUD3IVmBiMuHWST+UU2L4EfMfLigr85N98IeTwf5t8KMpHQivsAtbf8hZB?=
 =?us-ascii?Q?OwgLkYkOP6oyqkTDvdMsw4XT3JHsWqF9ybfSAXW2yYWr9dSjw013SPrcbVEo?=
 =?us-ascii?Q?Kmnz8k8o5UJkgqakqqIh5kZiLgYo/bKuiXglbYv9EqzxvFbZexSEL8luvnxQ?=
 =?us-ascii?Q?diAxTocohcEKjwIWIOqyX8/pwove+uvtyVx4+bjum1sXxirVy7ejlGFsfuvp?=
 =?us-ascii?Q?NuL7hdyyoIvoCsrTTPQEdk0G74w6LHx+FQyAB9jg+stY2AWWVUpV7qWlnyEo?=
 =?us-ascii?Q?UGvEb0hVYKfGEjUPWuDOiXpyg6pIQfNNB8w9Ztmvbr3RflplTseMHFFtTo4d?=
 =?us-ascii?Q?KUG36KOv3HALIeyQL+8SIDuPzB+TOIemXKQun/qfNmsJ5sBny3expw6Ye1wd?=
 =?us-ascii?Q?x/nX7LGW4N/dxsh9j2k7a7do6aHJsWqgKUsciCuFsYxs/XBfHaeO3TmKiqtX?=
 =?us-ascii?Q?YD7FLb0ezcwG5oR6BOaJ44ikgQmbFVZhCsfmq3BmtNkKzV77eBBgw4SrjnNL?=
 =?us-ascii?Q?yLdDH0N3t9OJgH27WyK3u3uW3SHMw9VqEF25w7WWVwhYjQynxRzmmxg9swJC?=
 =?us-ascii?Q?VAgXtydZpErkKjQ/O3Jnllu+xH5Fcl7toiCgl1FR0Agcgml4azN/jOJFqyNH?=
 =?us-ascii?Q?NRzOuLB+CC3kWeCwQDa06Z/rJx38wh+tJShYqWJb5d/rRWytm1uJcHRJ6fRZ?=
 =?us-ascii?Q?T842dwAD2VCac6kCb5fOMtenJ0GwWNQ01s82mhKLSP42zH3XhN3qUiKiDLP/?=
 =?us-ascii?Q?JF7+VYRD/LmmGKYyGeaMO5QDNsWHUMC09lQjijRuntSm7Ua7mT/oGj8yA4oN?=
 =?us-ascii?Q?U6RipOCX+iwGLpt812AeChb6Sn+AnZuzgHVfqeesbmyh2OO42hGq4n81JMPZ?=
 =?us-ascii?Q?9dBuS1+E1+1yAX+E7HfG+4AoUaWAMsDBJ2VpwsQhVFeymE8vlaHG2tGhfXbk?=
 =?us-ascii?Q?ugTtq9crxAnAR9ByfZyJhUH3cWhWo+xFk5zBhloEa33JKdrX5mDi8kJKZPju?=
 =?us-ascii?Q?MwNPiAYWo3QeMapobE2HPf9edMTa+oe5OZiIdejV?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6dd10504-214a-42c1-f489-08de2c8cad78
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Nov 2025 01:39:45.1937 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KufWMkYatZO1JwbXeTPWYd81dx82/+siK5pWHxK9yMszxTRBtBdLIhuexAN8O1coZfKskD8eW30otQLbCKow1w==
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

Instead of long, exhaustive lists of GPUs ("Chipsets"), use entire
GPU Architectures, such as "Blackwell" or "Turing", to make HAL choices.

A tiny side effect: moved a "use" statement out of function scope, in
each file, up to the top of the file, as per Rust for Linux conventions.

Signed-off-by: John Hubbard <jhubbard@nvidia.com>
---
 drivers/gpu/nova-core/falcon/hal.rs | 20 +++++++++++++-------
 drivers/gpu/nova-core/fb/hal.rs     | 17 +++++++++--------
 2 files changed, 22 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/nova-core/falcon/hal.rs b/drivers/gpu/nova-core/falcon/hal.rs
index 82558af1b927..5c504577b97c 100644
--- a/drivers/gpu/nova-core/falcon/hal.rs
+++ b/drivers/gpu/nova-core/falcon/hal.rs
@@ -9,7 +9,10 @@
         FalconBromParams,
         FalconEngine, //
     },
-    gpu::Chipset,
+    gpu::{
+        Architecture,
+        Chipset, //
+    },
 };
 
 mod ga102;
@@ -47,14 +50,17 @@ fn signature_reg_fuse_version(
 pub(super) fn falcon_hal<E: FalconEngine + 'static>(
     chipset: Chipset,
 ) -> Result<KBox<dyn FalconHal<E>>> {
-    use Chipset::*;
-
-    let hal = match chipset {
-        GA102 | GA103 | GA104 | GA106 | GA107 | GH100 | AD102 | AD103 | AD104 | AD106 | AD107
-        | GB100 | GB102 | GB202 | GB203 | GB205 | GB206 | GB207 => {
+    let hal = match chipset.arch() {
+        Architecture::Ampere
+        | Architecture::Hopper
+        | Architecture::Ada
+        | Architecture::Blackwell => {
             KBox::new(ga102::Ga102::<E>::new(), GFP_KERNEL)? as KBox<dyn FalconHal<E>>
         }
-        _ => return Err(ENOTSUPP),
+        Architecture::Turing => {
+            // TODO: Add Turing falcon HAL support
+            return Err(ENOTSUPP);
+        }
     };
 
     Ok(hal)
diff --git a/drivers/gpu/nova-core/fb/hal.rs b/drivers/gpu/nova-core/fb/hal.rs
index 71fa92d1b709..d795ef7ee65d 100644
--- a/drivers/gpu/nova-core/fb/hal.rs
+++ b/drivers/gpu/nova-core/fb/hal.rs
@@ -4,7 +4,10 @@
 
 use crate::{
     driver::Bar0,
-    gpu::Chipset, //
+    gpu::{
+        Architecture,
+        Chipset, //
+    },
 };
 
 mod ga100;
@@ -29,12 +32,10 @@ pub(crate) trait FbHal {
 
 /// Returns the HAL corresponding to `chipset`.
 pub(super) fn fb_hal(chipset: Chipset) -> &'static dyn FbHal {
-    use Chipset::*;
-
-    match chipset {
-        TU102 | TU104 | TU106 | TU117 | TU116 => tu102::TU102_HAL,
-        GA100 => ga100::GA100_HAL,
-        GA102 | GA103 | GA104 | GA106 | GA107 | GH100 | AD102 | AD103 | AD104 | AD106 | AD107
-        | GB100 | GB102 | GB202 | GB203 | GB205 | GB206 | GB207 => ga102::GA102_HAL,
+    match chipset.arch() {
+        Architecture::Turing => tu102::TU102_HAL,
+        Architecture::Ampere if chipset == Chipset::GA100 => ga100::GA100_HAL,
+        Architecture::Ampere => ga102::GA102_HAL,
+        Architecture::Hopper | Architecture::Ada | Architecture::Blackwell => ga102::GA102_HAL,
     }
 }
-- 
2.52.0

