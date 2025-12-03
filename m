Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DDFF1C9DD6D
	for <lists+nouveau@lfdr.de>; Wed, 03 Dec 2025 06:59:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 54A8D10E70F;
	Wed,  3 Dec 2025 05:59:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="CeY3ps6u";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from PH8PR06CU001.outbound.protection.outlook.com
 (mail-westus3azon11012043.outbound.protection.outlook.com [40.107.209.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 38CA510E70A
 for <nouveau@lists.freedesktop.org>; Wed,  3 Dec 2025 05:59:34 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Wa0d+0VH31Xbchz0XRGccEv4GxBLF4NSpZZYUMri/oqXIoWf29sqcaJCUasZAT+CaDAB4UvjwkQUl+rLl6WdzgDRQiZ8sYdypnhbC/CeU0dROxpIpraCfvaUT1BGSFfcUeTDCvf09jo6yvDW3tFGk4MkCfhpyMDs7OWnCkFipmiEVFaPAOi+66WxT20DVIIkFbEMM1aPY/K3k3qXMWIYdJNfhWQEcK2P41gOvDdrQzpGebwdGq2yATdj2tRAC7mrR/jHNbqmTSE/D8BGKBsHYvwUPdXU8RaiGMVScsYk7r9VInCw0PtjxJfEBpuFYS15nO4BPBN94RujHNnQnFv1Lw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MuLegbD+0RStRUzvguz5VZ3qj9GDYL+kDElAvI4lThw=;
 b=Lsnvd3myr9Y3MfpLp3PEZ02tEcOxRQq6COHiomRwj6pEthnsHEiJYQrPoU5rAz7raB3rkg+FZ4ePyvRmkuYxjeuXAJof/1BjuwUlm8BsCvAizpxh55XvKDe1+03M9+eZI4xKF1DTzB54S4TY74L8kNClb4HyOQMR2Hg5fGjYT3ySQuNzFaXQIidQiellLn2SJNsXY+6/1BXjNczBBVvW779dynWq4Fy3bO6eZ18Hwz/Q0Ar0rSEOsJ3myjSWD++XPzmI6DWx65HmPw00obHxGQo50jgg/7an859u2CadKywstS2ParMzYg0yQwmUEDcyllQBrCqrjBSWuRZws2qdcg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MuLegbD+0RStRUzvguz5VZ3qj9GDYL+kDElAvI4lThw=;
 b=CeY3ps6ueXD2aMKdlFWB7he2nsfk46PoHPRY//jVkUPb0mX08sSuREv8ME74b0+OASZoDWRbkaH2eCgonW3qlIwQg2D/CintwZBJJV0WQxuZ8eWOMb5JGpVm5UfzPXnSJP1twqeRqJb0TgBuChsGF7/NkVJsLf/pF0pgPLAbf3j6UTk1WCTLUhz73q63IlvgI7muFPoajFBUksgnTZPSDRrLG80to+BEyK8oDCm3Uj/vzEg7cJzoekydrHRSHqhoU2u+bmhSW47+jDB766peyn3xzK2Rdbkl+JDZm8BTF9cS0iE511M6DkCUnMdRyh53uxyI570+1d4ff0+HPaR8sQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 PH7PR12MB8180.namprd12.prod.outlook.com (2603:10b6:510:2b6::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9388.9; Wed, 3 Dec 2025 05:59:31 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%7]) with mapi id 15.20.9366.012; Wed, 3 Dec 2025
 05:59:31 +0000
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
Subject: [PATCH 05/31] gpu: nova-core: use GPU Architecture to simplify HAL
 selections
Date: Tue,  2 Dec 2025 21:58:57 -0800
Message-ID: <20251203055923.1247681-6-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251203055923.1247681-1-jhubbard@nvidia.com>
References: <20251203055923.1247681-1-jhubbard@nvidia.com>
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR13CA0120.namprd13.prod.outlook.com
 (2603:10b6:a03:2c5::35) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|PH7PR12MB8180:EE_
X-MS-Office365-Filtering-Correlation-Id: 1cc5bdd5-f25f-49a0-b2a2-08de32312078
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?TqNRThunUnUrZtSYqRVfdBpx4vNXrh+0VVl4nohRIPNY34Oi6tfcMllILEUE?=
 =?us-ascii?Q?qeKfJ+2xcngegFOZCRgHoGn/nlFm9k8+vqXVV1m9L69dPFDt+6h7z02aW8Nf?=
 =?us-ascii?Q?UKHpVcgmN2RUceMvqdDmNY1eD6Nu5b2hMAKo9ikgzvshHfd7pbRv53tjTfST?=
 =?us-ascii?Q?NCGo501PJ3Go5j3HGrbUf5cfIopskAoxrrZwqXizIDD3raHWK3ifpObNKOxF?=
 =?us-ascii?Q?UTigwbHPIWrNLYqAld40Dna7IlTn/XN4Cx0SeBLeuuedS1tvWQCl3xaRCnxp?=
 =?us-ascii?Q?m0K/XLVqsnWBqAMbe+C8Vju6IFEC3ckgoBdFcZeAba7IPji/K5dA54KiC+UG?=
 =?us-ascii?Q?GxaOdINH1Q8idyhR/NVBF1Me2EdtPsIVcjlxfEf8cY5ptAjJ7DjRUyvfCSpx?=
 =?us-ascii?Q?e6OR9myby3cSmHtGpTQEAjF6ulcb8LrR2WdIJcMNjkV+P5KDUWepL5Br0eKc?=
 =?us-ascii?Q?FVXxnWr+OtA7eqZ38cauVpFhDC2JDau6M9zPyKdNlLwOfzOucuTrTuaouBuD?=
 =?us-ascii?Q?t6fAgnjlB8UEeQnW68u3Qf22dKjJJCTwcQHIN7Nex7whBhfxlsGV2eYcohm6?=
 =?us-ascii?Q?RuvGrFL7tIcqFmVfv7rSQfD0MtUyMOYw+NiIAEJk50ze6s1vulnDUEGC6tjX?=
 =?us-ascii?Q?4aE6PB5FApX9K1xjq/zPTERmY75DTG5hFw2erLqaTMdCdRDJ4H7ujtOFdMMn?=
 =?us-ascii?Q?E04+PtNi/04a/pJSUb1IovcNPvqzBKC5xDtCx5F5J34Rfp1GMN0+yPNhhZBq?=
 =?us-ascii?Q?+iXFkkvMuwss5J8kh65NkTNnBBycEQi1vRRjcFTdSSOd1EG+PjgXKd2AysgT?=
 =?us-ascii?Q?toKfHgdn1bNzEfGuALaCmS3Xuywe5S8gJM8DbsqKpN8o3IG4+YDqWBn6BRYB?=
 =?us-ascii?Q?2bl5fCaGsfJe4oue9eA4gmw379a2fk5eOd/li0cX9RVmygnI9R6h/jnGyw7F?=
 =?us-ascii?Q?+2V+Epp3wej5agvrSnZu8oRpqkGCCDd61ZkvDNqv0P1i13PXS/mbw0Tx6BXu?=
 =?us-ascii?Q?iCgQbwGeZ0JguxQRBuVARNcqIiejuUOAYLpa301+smVskw2kg6SMBJChh72i?=
 =?us-ascii?Q?eagzbjHgUJA24dQGmAgQRoYkBOodTl/heQdPC6SoGb290/Mc0CJjsFP3qwqQ?=
 =?us-ascii?Q?2zk9AFKupv6sHMWlUzx+G3rFT7V9tR6VsHG3R2EqNaodsqyYFhvPPvqkHKK4?=
 =?us-ascii?Q?AxQRnBLFlEyJmFlI0unhq9+zycE6HWi2f2PVuxOyBS7SQ9HqQ5Mw5yRVXE1J?=
 =?us-ascii?Q?CJ/5w8OZFBJZr/xKEJ++DFyNkqOdh28foa5/rCyPA0aygRLQxuK9esMhow4p?=
 =?us-ascii?Q?jMe//CsuhvOLKdF3vmP+8ul1NC4Hh1zvrgWfdaMcPLvIX3AzUF8Vr4Wi8VzU?=
 =?us-ascii?Q?zoB0k1EzahX6vQcasaObyqEN/+2IDOnFNxogs1Ok1E1EqHBE61vFa9EzbT+H?=
 =?us-ascii?Q?RU4g7UtO+kPZMl3FQBur+++XVspGEyC6?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM3PR12MB9416.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?+QG3FUKYeoK0+UDffI+hcmCW+3IWJT7gwRjkJVzKf8s0xggWcPi9Z8RP2YVx?=
 =?us-ascii?Q?7nT2S64INcxOE/vOTWKkbXeOb2blxlFuquL3+HU8K4Dl4uZSZtirDp1SMTcs?=
 =?us-ascii?Q?hUmMrX8O2I6scKJWBi0jPZVgYfDIf9nyZq3A8VRXePXF1u4fam4vKOx+UXPl?=
 =?us-ascii?Q?IotUmaQyYcB928BU7pKhq+YAmdFJ4LvH20lz3n5IYffFL3zt1wNzG4DrGE+N?=
 =?us-ascii?Q?EEh6Ka33nHxfy4mfzDLk5yUmIP76McGywTN8Lm56EWvvl5haL3lbKxQwo+U4?=
 =?us-ascii?Q?kjGIIx1/s6CYQa68r4DBKKYHoTSrkEcBlQAgh3tbm2JF/SNoZsur9bQooC/s?=
 =?us-ascii?Q?P3VLcY7y9hHrIwJW3m1z4mxwZzHybv/ER5//moT9NkSFbAkAMlChQRorI8i0?=
 =?us-ascii?Q?IQMMT+cQ5gcbaw6JemXdH6lDIjhyuOhv6iJBp5Nq1XTOCRcPcxq0A8mC+5fS?=
 =?us-ascii?Q?1dTf5J5zBidiJThPWPnxYa9W1rkpRYMNT4GRkVdTCeHpUwS4i/cGKDmZKFxp?=
 =?us-ascii?Q?2JjeSwBPWfypp1xcL33E3HaqImjXx+miLC5MjRH9D1QOE8ez/5Jz7xxPSXYN?=
 =?us-ascii?Q?ucEgqcvI1AzoXVdvx/te0JPZxsZacEiE4YcMAiaoU3RPfYMhwHqFF+liEhyM?=
 =?us-ascii?Q?Prfq19G5pv8Ni4G52Sp2RGyy+FJCNg8z7CDm8EBeiClkQV/nyADG2riXNxN6?=
 =?us-ascii?Q?5436Gk5Lvq+nVwZ4MYHvMXLkdO8vp3oRtgHAbVeFLUxzdGnWzQFPc9aVPmh4?=
 =?us-ascii?Q?bmXcOb1RbY2f1JYy2FdvbQPW830tJWNFRAKaqOcglsaAcy9MHqpskmI+sePM?=
 =?us-ascii?Q?kpKgkmIhbjy+BHlBXDmEm+c0cnI2eYSOG9HkEhf9h1aVhCwNp7QYdFfqMvG/?=
 =?us-ascii?Q?0iq32ttGZXHGMrx5DbG2gG5MbJAdhQVS/GDEzvFHnpuzyht9mpLRKZOi0aYq?=
 =?us-ascii?Q?khnSfJf1Tuy2ypD7NJwmkLV8Rbta4d7NaQ8/57MD6zz9OhaMYmeTn8zIWdbC?=
 =?us-ascii?Q?eUWll4gqjnGRr5m22i+Tzd+cbN67EduLd6HyfUEsWfSmqS/9gah/stwhTFY/?=
 =?us-ascii?Q?oLpjLG7LRujy9ZkZI6OmHPWyF3w8m7sbL2kJoMXVeYGwvQ4b+y+jERFLb9W5?=
 =?us-ascii?Q?mGaRHDRbBizJdL04va5aAJcg89ooRipPTTcu+rX1w024WC7eSou3QX+UFRoL?=
 =?us-ascii?Q?NdM2nV2XQ0reP+285RO5GEaK1GvEdtFNwovikjd3PFioc5E4wDgeA6wCe0fW?=
 =?us-ascii?Q?AHhY5QQSjFzXm3ZFUNVCCkf7bnb8zmpNT9nck3aLUbEkjSpiXx1sjOj2yahk?=
 =?us-ascii?Q?trwIVDlayTq01NQY8cABAdjRrB6r8A23W6qgIxBtjLBuaVTYKFFFgBvq2vJw?=
 =?us-ascii?Q?V1Lz0PjccT6Mhq6x4Zo28KCY0JW4eOztnQGY+PK3mPDJsIuAsWkU3FqJ2I7n?=
 =?us-ascii?Q?n0y8w6Rs6z14Dg/8dckc8K6DEq05wvP+G1HEx3HKvsHe/BiEeMiVt/U5vt0K?=
 =?us-ascii?Q?OBwU5wOuf4oabOj/Gqxtjpe5yQt9LjGXA/StZJ8/lA6Zx3cA60YGxfuliqF7?=
 =?us-ascii?Q?/6k51gPuiCqZXIRN/9AIwET4GW1pl2wM2OUmSNsS?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1cc5bdd5-f25f-49a0-b2a2-08de32312078
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Dec 2025 05:59:31.4862 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YJXueBxJuSyYnMv4EFvo2LLZn6BJiPzllMEK7TTZTRZi9m7Giy37JBpognowNs+EzAsupQ0Ld6bcb+300/sOtw==
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

