Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 45AE9C9DD64
	for <lists+nouveau@lfdr.de>; Wed, 03 Dec 2025 06:59:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 535D310E127;
	Wed,  3 Dec 2025 05:59:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="F14uH4OM";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from SJ2PR03CU001.outbound.protection.outlook.com
 (mail-westusazon11012058.outbound.protection.outlook.com [52.101.43.58])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF97010E0DD
 for <nouveau@lists.freedesktop.org>; Wed,  3 Dec 2025 05:59:29 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dNmcSWVFRGZxL4VZlBhPY6atP0+NVoJUsj53bzjiyELmSuYcG9I/XIDf0KXo1I9fJCdAV7yGexO8p8EyZC9MPQy2cE3rj4MwT5AB+oXkf7OoCrS6WfVkw+ZhQJOxM+PN3nh2DHTwr6XxXi8tnSUGbp08kZHq3y2zq3Ggo2FStK2zyF8Ta/PuApGGDCa6/HAJ00zuFmsCvZgUGdrdB6DVV4UN8QjWoLi4bp5Np1Mcn3qd+bbkzNTWlnG4jwVc8VARl/pJ7zq+qvSR9XqVTHepNhrfSUZuGKRkufWVtVWTL3epFPz5nSXJmSf0se60bX7Y/JN71ak4urtfUwW36YdXjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8+P7Y8Xer31zLZMaL0KBtNkDpAvUwi1/CVg/Jt1bYAE=;
 b=yxMZmsJETEDYH2vrc1Kn4YMvJ6fd+tJwBvUJijOH3lLNEyiFD6BsBeuO7jXg+cYAAsyi49niiSXzOV0Igkj1QyKR8P7U8k29jREmOks3K+1k8/ABVbxTFPVq6IgPvAw4dgmQALDk44FS8pbtK54PMk4w4Ea73S2w8e04Ddss8MU/0ONK9JkVu4UJzCDy6ku0ZGhsOCVOA1dANIyQFQ11Z0MAcSTAmwMMFJ77PcEHBj+F7gfNDe59X7LhlBradn0egTDoOUzSlCCHgCvtokUK+iB6P/CcsJXNjAIbgpy8jRTd+RoiK7/x5t3hT5ngmsGuVkHXOqp5/EIm3hrX+jlzrw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8+P7Y8Xer31zLZMaL0KBtNkDpAvUwi1/CVg/Jt1bYAE=;
 b=F14uH4OMggF55dWk484kNjnviI9kNmSfdwVKb7be+heSWWS/v9Ck9AJ6UFoZeEoR1pukUx2dHfx6QfaJHQKW3boD+EUncZqPxy5WGIXAK5Se0K/LtNqNXdiARDToYIQ3rZ6dlx/pqJ3aP38Q8czCBMgKWCRbZnMkkmQ8vKR9vpIsnnzhXs7EnWx7DYRV0O0Hpcn+Uhyulv+sA7kooklcfRsibS8KuZOU5wOTaCQSlwaK6aCBMRhQag1drGG5N0f6JC7Jhh21OrO3HpONvt4tEDcwFRB5yV4WRNGmc2B8Re9eqJkkcoo5Pe6dNbULq/lgHrdFrT2R4JWNlOgGYQ3QvQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 PH7PR12MB8180.namprd12.prod.outlook.com (2603:10b6:510:2b6::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9388.9; Wed, 3 Dec 2025 05:59:28 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%7]) with mapi id 15.20.9366.012; Wed, 3 Dec 2025
 05:59:27 +0000
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
Subject: [PATCH 02/31] gpu: nova-core: add FbRange.len() and use it in boot.rs
Date: Tue,  2 Dec 2025 21:58:54 -0800
Message-ID: <20251203055923.1247681-3-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251203055923.1247681-1-jhubbard@nvidia.com>
References: <20251203055923.1247681-1-jhubbard@nvidia.com>
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR02CA0016.namprd02.prod.outlook.com
 (2603:10b6:a02:ee::29) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|PH7PR12MB8180:EE_
X-MS-Office365-Filtering-Correlation-Id: 793441ec-5c0b-4ee4-a618-08de32311e4e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?i4MUe3h4VxeKrM6h/ddQnpNgGfbaSR56oDcOQlbRmgM9VbIa7ZxLaOEJ8yZb?=
 =?us-ascii?Q?fjRayyZqfytL/+P2IWA+uACA+/TiNJzzpD2fM8BFd2YCsKrqMiEhZg+eHuXc?=
 =?us-ascii?Q?XNgyfUnaWJtAhIGr3bWX20H0ySD3RfmRVDOelghJN2l41wczAWxvODbXUrR4?=
 =?us-ascii?Q?PJ7o6z3FRi8AelQWcviyqV7mlPngflN8nf4BO3etD6wpj/joordeC4ZJer5e?=
 =?us-ascii?Q?0gJNWa4g79AhakEcUn88bbOaFJy/iTUuz87MRzLRPyN2gqTTwwKX3RzFRHfe?=
 =?us-ascii?Q?NyOCLjj47fWig+rAxvj2Un9qMVz3QulD0LDzqEy2Csd5D8v4FLDfMatr995a?=
 =?us-ascii?Q?87vAvJ32IiFjdAovLa24/N8as27kmYAOvGLSBQ5Uzs0VGlmgh+n9m/3tyDwu?=
 =?us-ascii?Q?aRBitSeiiIrB043ttEhi15Luoldwrgb7aRtAshW0hdOUiU1Ng+l2HSBHdJe8?=
 =?us-ascii?Q?8aei2Nx9s2zzQlFQsU4SdFB/FW16NZsCBRJ+g/RM3HXxsk8FrXu+/1qo/30g?=
 =?us-ascii?Q?55gmqUZPZxT/9p4Xw92BHRR+ogGOIuSp8kvfKePrs4nM44bViCN+SuIlzUK7?=
 =?us-ascii?Q?6qeNjgAJbBwqTPE//Bs+duYD6slDHN3NLv7Ze4v0+Cacu6u2Y/pMMfhvk++C?=
 =?us-ascii?Q?swMDg4OpLovkv3TRjEgZrWZ55TQ4yLGLVIm15Ei5oGwmSHYkwX66MRDn56CJ?=
 =?us-ascii?Q?4Sj9aJwO4WuQInSuObehUDWE0nhkTlQHL/fcMwMfyuwAdUYFHMhAbOjD9k6q?=
 =?us-ascii?Q?ewmqFYJo6ZNCmimaAnY8WJIgb0TKqwfZAWo6Xh+0O0EHneWsPm3/tJg6eD0H?=
 =?us-ascii?Q?apcvsA9GIGbprWfZWVXVjETIu7TeZHhjIJXt+HbFleyVnjIYSaIdF49vDTe8?=
 =?us-ascii?Q?TfGE9L2lxKVHgbiSWtQyM2xhWkIrePsUvCganjLFTUA2zHVzHiD1xAhToCte?=
 =?us-ascii?Q?RroNyDmhdKWh+EgWGQL1j6HtkyfBibdCJ9wD+InBGt5gshfyW1F8Ms5k+0Ww?=
 =?us-ascii?Q?10y4teuFjIPAHyOKrH7cPPF/FSPQmBWj5cKHkFFTdlDQQEaagQNvHG7sbGiT?=
 =?us-ascii?Q?Mgidwfma0TdvNHXoIRIX9A3ymOI+t55o7lWE6feW8r/f804NmdSrSUOnX4ZL?=
 =?us-ascii?Q?OnqkQrsHqvbA3xD5u9VGInEnh9Oy/OhT/f5Sc/MNoQSNJItY83v8Qng6/gzG?=
 =?us-ascii?Q?5v/qb+Q5HuDusF4Wx3pO9ilu8Qe8r8iZRuAL9aY6jOKKKhxrvN9LFYLHDlC5?=
 =?us-ascii?Q?3CMopESTrFPHLvW4/S5S40sIghDMEpgF3sdU/leLCBdmDz4gJNAAqXI+TIh/?=
 =?us-ascii?Q?jS2mK+UKDAvCUHIsd54EbAu+GD8K3GuR5XMCvIakcCBWT9pnARSD3+XxJLlj?=
 =?us-ascii?Q?lglvqtcuVyrSZx4nIEqE7/+FXLO9Oq3PCh+TxDkhhA+/6EgMw226XLAhlmT+?=
 =?us-ascii?Q?QBi5D9jPPtZhgcYvB3vozF2vBV5dDNce?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM3PR12MB9416.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?zsC8lnZSbQmLDeyYu79x7zuc93e8Mo5SfDzDNu0vUrSOqV+/7IIE7QZyxNu1?=
 =?us-ascii?Q?2bgQjgWKOIb29dgLQyJpxr6vN2Fwc+PbMAnIsOqM/upHuI99aB0xWHKQIxHL?=
 =?us-ascii?Q?150WBB7ZRb2coxdeNScytWHRM2kMR2wlFmfMdfhjybZQG6MYmSnk4oTjL7lj?=
 =?us-ascii?Q?gKRWla1DMPcIJtWUBAJsSvQo1xWX/HM8XLR+VqdLdHYrInjBE+p2YzGqP3Ol?=
 =?us-ascii?Q?DAcfe+XCtRypCkwOfWAzGzDzAlx4A7YSLL/LoCPw4n0VmRO5U9uVC1nTLIAR?=
 =?us-ascii?Q?XgyGNUlOHAz76oKMjo0Oo3cAHX+8UYkgXf628Dk4/YCWmXa2po5cSo98JKbl?=
 =?us-ascii?Q?BdGhwxc+BUXrx3kT5OFWt4YqzFIQDyScKKHv1I+OhGt2oklc4z4k5jeQn4mg?=
 =?us-ascii?Q?M01gqfvEk2kB2okMCrixutooebT5Q9/0NShkH0JEPopHTyqs5PcZIABlKVPm?=
 =?us-ascii?Q?DFv7KfgJYqSWsIQvEEoPQzBTyFRWwsxrVtjaLA/2Jh1/JjW756/x6WpMO0O0?=
 =?us-ascii?Q?WkHAud2eD/WcnUmujYJpGyZ9qc3mmvoDgyctQqRylSALND863x7g1aa7mvF3?=
 =?us-ascii?Q?/i5GBANRRvQvXHFXRD7N5NSJxOd6rflJkhgbnNcmMP6W7RH1pa3rTFjB1BBt?=
 =?us-ascii?Q?UWCYPmDRoCceuNA10P4bc1G1InDH5ElRzIht3LfZSQZekFXlwOukkMsrRmg3?=
 =?us-ascii?Q?8BQWaiDG0ntd4MIpREOc/cuG/ViW7zjhdBnfcj1Sx0fbY/qHiEXaPxO+J8dx?=
 =?us-ascii?Q?VpZItNvat8qRVj+XBU4KlyXKtes3P4gOLExDsqEf/jLPx2EG5hF3Zw/oX13y?=
 =?us-ascii?Q?REbdp+aUdH5kLbqD+6Q3y3AvWgWKtZdLa/Cf7HVE/vSPAcrKO2FrY5zSKWnF?=
 =?us-ascii?Q?vtzuPJPbgW2PbcGKL3rSmtIY/lLpyPQH0HRkGFs3iiM9fUNG4126WZwpWVDi?=
 =?us-ascii?Q?G+SDeqfDQZYmjHOPXlxEofLQ0AutEd19B/6pEErLkOVA1BWueT5Tx62EPRUC?=
 =?us-ascii?Q?8vWg2twKtLkoVRMTSi/Y40Abz+Cdcxlg2RSkS0AFVI/zUR2FAwHQAMPFKH8F?=
 =?us-ascii?Q?4Twp0Kp//Ul5TNjGY5PER690ox8oOOZ9bowwFPSQ3/SIbeuQKl/qNdgmk9FH?=
 =?us-ascii?Q?PEOO3lcOfLv1U3TwJsEvsLhgUNaAiKQTc7uQqV89R2p8WD8i2Y10zRSVNypj?=
 =?us-ascii?Q?gP+W87NbG6/z963QWf38cYO8GII2lYPn835KVBZos0pXpjwkoEUfh5OI5zYN?=
 =?us-ascii?Q?MgRQP+eN6SMncxpb5xiU1wJMg6PVFCgZdgo70BCkgWaCI+W0M9BlTcP+8fQK?=
 =?us-ascii?Q?J6nTzR03fZD5QdIWI52WLJd+qCOSVe1R9vwyNBgYoD3XC7cvN/ycudiQ7ZnQ?=
 =?us-ascii?Q?LfpwXmPCLema5ikr6fJzWFhXLCqZSK3yZedgidVH3tQx7lgmLkwJk4oCSuTs?=
 =?us-ascii?Q?OfjkyRVnyT8Kid19gHVKGaKl78Vp89Sz3kRWF8lLtWjLWw3gncEtGbJweJPf?=
 =?us-ascii?Q?VaEnPVoSX17M1GXpjD6NqgWtRX8qgbXKLvsqxXqfbQJQLoGF10P1gUk+K2N9?=
 =?us-ascii?Q?Wn7ec2f0KABQqFEmoNLcGBSIf1OJaAbLmALiM1eb?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 793441ec-5c0b-4ee4-a618-08de32311e4e
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Dec 2025 05:59:27.8255 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nUfObFsLZRHQfMoQ42Ii0jSaE/03Lb+C6pdpwZophAZdrmVBJL+8YGdptmfsg3O7l5zPc83YYOw3adPsCDm1ew==
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

A tiny simplification: now that FbLayout uses its own specific FbRange
type, add an FbRange.len() method, and use that to (very slightly)
simplify the calculation of Frts::frts_size initialization.

Suggested-by: Alexandre Courbot <acourbot@nvidia.com>
Signed-off-by: John Hubbard <jhubbard@nvidia.com>
---
 drivers/gpu/nova-core/fb.rs       | 6 ++++++
 drivers/gpu/nova-core/gsp/boot.rs | 2 +-
 2 files changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/nova-core/fb.rs b/drivers/gpu/nova-core/fb.rs
index 333e952400e6..9fcd915e12e1 100644
--- a/drivers/gpu/nova-core/fb.rs
+++ b/drivers/gpu/nova-core/fb.rs
@@ -100,6 +100,12 @@ pub(crate) fn unregister(&self, bar: &Bar0) {
 
 pub(crate) struct FbRange(Range<u64>);
 
+impl FbRange {
+    pub(crate) fn len(&self) -> u64 {
+        self.0.end - self.0.start
+    }
+}
+
 impl From<Range<u64>> for FbRange {
     fn from(range: Range<u64>) -> Self {
         Self(range)
diff --git a/drivers/gpu/nova-core/gsp/boot.rs b/drivers/gpu/nova-core/gsp/boot.rs
index 54937606b5b0..846064221931 100644
--- a/drivers/gpu/nova-core/gsp/boot.rs
+++ b/drivers/gpu/nova-core/gsp/boot.rs
@@ -70,7 +70,7 @@ fn run_fwsec_frts(
             bios,
             FwsecCommand::Frts {
                 frts_addr: fb_layout.frts.start,
-                frts_size: fb_layout.frts.end - fb_layout.frts.start,
+                frts_size: fb_layout.frts.len(),
             },
         )?;
 
-- 
2.52.0

