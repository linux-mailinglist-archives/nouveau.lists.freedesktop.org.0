Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BAF6C12AD4
	for <lists+nouveau@lfdr.de>; Tue, 28 Oct 2025 03:39:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 80A9610E1C5;
	Tue, 28 Oct 2025 02:39:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="KfJTGnIM";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from PH0PR06CU001.outbound.protection.outlook.com
 (mail-westus3azon11011053.outbound.protection.outlook.com [40.107.208.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B334810E1C5
 for <nouveau@lists.freedesktop.org>; Tue, 28 Oct 2025 02:39:43 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=k/CJpnwQ9JzSFUqmFH8MXgzmDb0WUB9Ut/CAzF+6JfZXB3v9novs/W2L2qe5SEY9IxITbrZRQLWlR/UcEiAwY0Vbj+Mewd5aEZ8W9/iUGf9JxTZOryxs0rsK8tjjNCa+wuilBYiZMMNdwsg/plgfc23yyegKzBLM2A5u6dFbSEyTRFpxy9rKKxTE3ibL3CYDE0N20B60WhbMLtpIdmWGC+JfxjZe6q1w2Owf5W05+cEbQIQS+NjhCa1LQswdxj6wwkopqyCOU1aotHcy7UfnB9wgA2KP+r9QGf2NRLr3RK/RdP/6eeFEcnpji+yWXxicKyaMuHErr62UmVmHGLAutw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pnOIBSOA9IRTJvAfZPukBHTdRobn38EVtSmCXSHdPcE=;
 b=X77wlheSNClij+Ya3yQSWRvpOu0dn79XoICqxwT0WlX5STjL3LYrVuqidSko16rmg6fFDKpW4Vc3DtImhIJ/N3XrsciIt5RT7Zrb2I5Hj7b7pUirgGqO5mEeXRN8BBu4ym6P1RD5eOy46em8K3yeoqpYTCBkLLB1CVa8xvvLmfBRbrVTl9KFWodF+EmGI4d5PU/gfUypbKj28HkTDJxCPERBGBGVv810efev0ZzbOD5QO5pGwDCzXSkgRYkVaLgpBTeMrnyGCIE8H2gxA1QrPWqbmEUkIWwX2TSWfzeYlb5QFaEc+kXQ3P6PnEDxMN9oLWWwbQ5oABr9FCPmRaHmTg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pnOIBSOA9IRTJvAfZPukBHTdRobn38EVtSmCXSHdPcE=;
 b=KfJTGnIMEJYrMHgzkt8E/+vsi9LgEsPkuQWpDM6ElGruRD6oDOcfycUqPp4u6ZI17n61khKsss2clXgeqfwzdC8qftFdk0Ml+eDv1aiRVtYHsDiTgdxh1sH7ejVyxEKQ0cCvoJTTwXeYR1z17+V1DPikz5gUwII1mPHJ3D35mxD427q/ANHbFneZruowKIHMw5xOiDNQ4LIRzJuPGBE75s9fs40erRl9zY+FqNfYthqsCRHQxswqeKP6B44hyA29RxfSxt+Rkh1aFovE4YqB8KUKv9l8IinGHcUdDIS8E2n+enpwKuZ9gO2QYULWUoOmByazXSMiv+I9EJvEVcBizg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from BY5PR12MB4116.namprd12.prod.outlook.com (2603:10b6:a03:210::13)
 by DS7PR12MB8346.namprd12.prod.outlook.com (2603:10b6:8:e5::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.18; Tue, 28 Oct
 2025 02:39:41 +0000
Received: from BY5PR12MB4116.namprd12.prod.outlook.com
 ([fe80::81b6:1af8:921b:3fb4]) by BY5PR12MB4116.namprd12.prod.outlook.com
 ([fe80::81b6:1af8:921b:3fb4%4]) with mapi id 15.20.9253.017; Tue, 28 Oct 2025
 02:39:41 +0000
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
Subject: [PATCH v2 2/2] gpu: nova-core: add boot42 support for next-gen GPUs
Date: Mon, 27 Oct 2025 19:39:37 -0700
Message-ID: <20251028023937.1313108-3-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <20251028023937.1313108-1-jhubbard@nvidia.com>
References: <20251028023937.1313108-1-jhubbard@nvidia.com>
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0026.namprd03.prod.outlook.com
 (2603:10b6:a03:33a::31) To BY5PR12MB4116.namprd12.prod.outlook.com
 (2603:10b6:a03:210::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY5PR12MB4116:EE_|DS7PR12MB8346:EE_
X-MS-Office365-Filtering-Correlation-Id: 5b54a94e-cbe1-4ed8-29fe-08de15cb3ee0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?qsXi7vn2/vhcwfznxCQbaE7MK65p9klc6ZDZpDZ7v1v9+iPZqKePDLjX9r9G?=
 =?us-ascii?Q?9Ra8kSojg7Y7Xj+tGS6RvMCrPtRSrXK1iuZenqZXknzez0sj2Moi6uyEpkTp?=
 =?us-ascii?Q?iCGa8ZvHtplKNA4BEisTDcyJNbW4OyytD2QgmmvIFSgQFYqn+o/u79oxPGuo?=
 =?us-ascii?Q?Xb8H1e5LnwT5iqid5fAg3smhQHma5hWCt5OCGIspi6KodtPbquX9TL+iUtMO?=
 =?us-ascii?Q?vCaI00axVWp1U063+69sf3TUBui9GTJirCsZ6KwfvcrRCQ5bKgqBmL7SAJFb?=
 =?us-ascii?Q?R203KW2faMLnToombm4F/ypLeztW2a0NV8UK+SieKSFVx8QyfATPReU5cd9z?=
 =?us-ascii?Q?ddGM2IT5lo7jhhJo9dDhj3XLlbegCEpLUB/dXfvIFJRctRG3imoTtNOWrDOi?=
 =?us-ascii?Q?WC0jfi4bIPA+IhCSiOF8N3LtQN8M3Ir+TcJiZ9FkkfvsFz9vZHBnrUCoKJvl?=
 =?us-ascii?Q?5iIMsufFml8ccUhc0c6aABvfCUQSASJJpT+l5iTwi670c4e5f2H4KUmKrH+y?=
 =?us-ascii?Q?P7x2Psi4nIoV3EfD47Nc9L6MYOIbE/MS8yFqTqZTk9Sxhbjn2cVn6wQvvBh4?=
 =?us-ascii?Q?TFTe2fp+lqvFkNrWNBBJekNhJkcqByR4IjivEe+OhJO37CWmOU35JDTRC4r/?=
 =?us-ascii?Q?dqtIjmdwmHCcIlCysgXpGpkZlKW1RSs3M7EyQ/HBvcHYsO/HdCXhbJwdtxfw?=
 =?us-ascii?Q?XEWQ6Br01/pOJKqnIn89beHWCqhPyFCTRvtVzMFqFVV1Jt6NptgaATbi0qDm?=
 =?us-ascii?Q?Q2ym+6/iP1GHelNFSSBwbX1qIGa35W1B3RHnPcomIooxGg0+dHN1ycsNbXMg?=
 =?us-ascii?Q?0DciMCJBb71bzi5ccyAXE47p1Rk9EoV86oBUjDYj7EFtGQGx5v7aT01YiboD?=
 =?us-ascii?Q?on9IhiNEIHkQUwyOjY6AoZjTKneCRyYU9Ugo/j5HqeNxx4T0S1FSZCCBhhrk?=
 =?us-ascii?Q?Hq8lXY4Bkcl6gyatAR91RjMvMUmPLHF8uRmbHx3ZJ/0aKf05PG/ILSbXBHvl?=
 =?us-ascii?Q?+CNvZ4il6zAvKDoJf2tgRsUxVXsyIqhmyGiDRY5OEffQSLtBlghJ1UqFEh8V?=
 =?us-ascii?Q?x6oiuncoyzRim8Hfshnq691Z9FEDK1liM4bj0aLgSfVJZK4bqw8jP553XSAL?=
 =?us-ascii?Q?RqtmVoSzlXR+rRVNo7jzW9l1e54B5/43a1DnWqawpZedg/oonJZ7P/7IdHIm?=
 =?us-ascii?Q?yHqGkMyE44CHB/gWUoJ42Qn5LlhiDEUnH+2RMPJuLE8GwptFYwOHL9c9/U+N?=
 =?us-ascii?Q?t+M0sCWddB6+usZnFmOW1ZYqLEFu1K+AzlvgLvW467u2OP5aIPbHZiI6pBaM?=
 =?us-ascii?Q?HysvX6JtAlQ1vEawP6iYDSAPVbKO5bDh6tgakKY27GweWrKlIDTWGoRf+cjm?=
 =?us-ascii?Q?S1HOHtRpbk/dOgvHogRjLoMi7C52TvC4DJZCl/orRM+tJ3gX37zm1uHAd1MI?=
 =?us-ascii?Q?adDqs/NAVdugKDGjMKxL5aEYoCHolLQ3?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR12MB4116.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?77Z85rG0gvLulbHIlopqxwakAKMQRJLXJq1NjjfCIPen3F79LO+RfhTzcPcV?=
 =?us-ascii?Q?jFU7NVg8VVSO3316j1RaWUQO6xWtEIOGFu/YuLUZLQ+bZ0GUZDWNQFabYFRQ?=
 =?us-ascii?Q?siIgrPqtf/FuP7YfStD/2ATes7Mnk/R31+8HQU/L16r+CU8xIPs579By0r6h?=
 =?us-ascii?Q?LVtki/UGOpBSqNdYTGUt4D2P9ax5INKu0p1UuSL1YSg3QZc5l2jHq8aQGhNM?=
 =?us-ascii?Q?DnfolsyooFPR3WrxuziHmHqtU0/CR5PMayY7DobVJFA2nUBCzuXG6H3DMR+g?=
 =?us-ascii?Q?L1gFZ1+ke5q7dUROUhZIiQL7tON820mwim7S/lqayChgfOi3C3o9NdMbQZam?=
 =?us-ascii?Q?WHIflIvsdYpgN09bip/PxM/iS5YU6HnX2zxw0KEMwXggx2hV0p8bfYt8a303?=
 =?us-ascii?Q?BbS2C8L5MXSpWcIaKDnrehgLWcZSm1Htrhyrg9THe7MeOPSKh2An5/gVU0M0?=
 =?us-ascii?Q?fymQ3EePxEZ/EU3NqJ+EFuMH9wp+LlDkVnn9MDVZsWCAkWdulSbYXGN8TO7b?=
 =?us-ascii?Q?cDrRD4mgICKygd2YtLGGxG1fbDI3346us8VKNucHnbH3/m+9ePkby4O9D3+S?=
 =?us-ascii?Q?oRGx7RdIZSsvJUpwthPq/3081bI+pCyKOaicWYGyoCkrLwxStc5fqYa/ETpb?=
 =?us-ascii?Q?Y3RUWkDWdY3/FAEeq082HIgHx6fB5jwlYGJ54qBzf9IXuUDTWAn0MefFx7zI?=
 =?us-ascii?Q?Fi7mCA3RDq+2ucX+F4g8Fhfs0WVBn6yZMvP5moqmCffgTMJ1QdNanGSzWZ/4?=
 =?us-ascii?Q?B7lHIxqBoLgegN1jyZDQACNn0K40ESOwyjB6YfATe4ofST7mWIkYW500ATog?=
 =?us-ascii?Q?JZE3M4ETpQ+DGEk40tFPdhBmtVBDUR1oSqlX+YTsdvoAu/y+c10k/g1F9fdD?=
 =?us-ascii?Q?lKExvt9uKRny6PCXun8UlauwSIy/yAhA3IQig+r0Uk+HgjcCz0l+PT6DUz3/?=
 =?us-ascii?Q?5tfxgKIc/DYuhAt5im6DTFF1/fqXLQmTojHuhi7ODKgIvmZ4f3FNCulAWyhk?=
 =?us-ascii?Q?wkHG/2J3ZgnSh9F14jYd7S91I4wdsvn86KgQn/l8vmEy2SEfI7ZIxGtx0+29?=
 =?us-ascii?Q?3mgFjvYD1xHcHSIeLKWftsBleWlpVBhnleBDllYlDllKf1WF1jXstZQy9cSi?=
 =?us-ascii?Q?yqBvNmIrfJUCINtXhrGXnJ2v3Pyd2PiBEvucTOK6Bz+zXoI87dmTfaok1V3M?=
 =?us-ascii?Q?92m2WfYxTWKG9rtokRT+V/LeTE0uV3UVJWuqvps/+1oqnlWPwjU+GYblSaxR?=
 =?us-ascii?Q?B6F9sQVjo7P3XbaE8YOmMazlqI+6h9xuRlDsEh+k1r1WHlV9+B5i3ogLTLlD?=
 =?us-ascii?Q?KftoWvyuh2OdgcPrywGM2u229OaYMC5b4o5YE40ZhxlQIQ6+pWcMDEFeB19c?=
 =?us-ascii?Q?La0ocgx3o9bDNnUISK22O0ZyU8nFciudyQnWBdNCm5BB9qJsegVe9tOXKNLl?=
 =?us-ascii?Q?fIE2ltRioO+ucR7O3h1V7U+m8u/8wdRySn0jeohOp0HQ78leS6d/Bp0+s0Fg?=
 =?us-ascii?Q?r59Q0Q3VkqPg6iohJp6Ga9uZrusgDWpDwUFXOpevby4kd2IB26/hOfd9nMiJ?=
 =?us-ascii?Q?hZiQtVqUexvvJ4pk9MoIMfa5KEKnnaLz9JEEBfKQ?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5b54a94e-cbe1-4ed8-29fe-08de15cb3ee0
X-MS-Exchange-CrossTenant-AuthSource: BY5PR12MB4116.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Oct 2025 02:39:41.1803 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EU5tNYLIP0G5lQqvsoVo2B6qHg1QymYQpcLjZNEEU6kLO4Dl8hw+BWFBkjP7FX9xvJIyT1BwzC76DKQa2FBWVA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB8346
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
 drivers/gpu/nova-core/gpu.rs  | 58 +++++++++++++++++++++++++++++++++--
 drivers/gpu/nova-core/regs.rs | 27 ++++++++++++++++
 2 files changed, 82 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/nova-core/gpu.rs b/drivers/gpu/nova-core/gpu.rs
index 0ba1cdc42ba3..666a938c8e97 100644
--- a/drivers/gpu/nova-core/gpu.rs
+++ b/drivers/gpu/nova-core/gpu.rs
@@ -140,10 +140,62 @@ impl Spec {
     fn new(bar: &Bar0) -> Result<Spec> {
         let boot0 = regs::NV_PMC_BOOT_0::read(bar);
 
+        // "next-gen" GPUs (some time after Blackwell) will zero out boot0, and put the architecture
+        // details in boot42 instead. Avoid reading boot42 unless we are in that case.
+        let boot42 = if boot0.is_next_gen() {
+            Some(regs::NV_PMC_BOOT_42::read(bar))
+        } else {
+            None
+        };
+
+        // Some brief notes about boot0 and boot42, in chronological order:
+        //
+        // NV04 through Volta:
+        //
+        //    Not supported by Nova. boot0 is necessary and sufficient to identify these
+        //    GPUs. boot42 may not even exist on some of these GPUs.
+        //
+        // Turing through Blackwell:
+        //
+        //     Supported by both Nouveau and Nova. boot0 is still necessary and sufficient
+        //     to identify these GPUs. boot42 exists on these GPUs but we don't need to use
+        //     it.
+        //
+        // Future "next-gen" GPUs:
+        //
+        //    Only supported by Nova. boot42 has the architecture details, boot0 is zeroed
+        //    out.
+
+        // NV04, the very first NVIDIA GPU to be supported on Linux, is identified by a
+        // specific bit pattern in boot0. Although Nova does not support NV04 (see above),
+        // it is possible to confuse NV04 with a "next-gen" GPU. Therefore, return early if
+        // we specifically detect NV04, thus simplifying the remaining selection logic.
+        if boot0.is_nv04() {
+            Err(ENODEV)?
+        }
+
+        // Now that we know it is something more recent than NV04, use boot42 if we
+        // previously determined that boot42 was both valid and relevant, and boot0
+        // otherwise.
+        let (chipset, major_revision, minor_revision) = if let Some(boot42) = boot42 {
+            (
+                boot42.chipset()?,
+                boot42.major_revision(),
+                boot42.minor_revision(),
+            )
+        } else {
+            // Current/older GPU: use BOOT0
+            (
+                boot0.chipset()?,
+                boot0.major_revision(),
+                boot0.minor_revision(),
+            )
+        };
+
         Ok(Self {
-            chipset: boot0.chipset()?,
-            major_revision: boot0.major_revision(),
-            minor_revision: boot0.minor_revision(),
+            chipset,
+            major_revision,
+            minor_revision,
         })
     }
 }
diff --git a/drivers/gpu/nova-core/regs.rs b/drivers/gpu/nova-core/regs.rs
index 206dab2e1335..ed3a2c39edbc 100644
--- a/drivers/gpu/nova-core/regs.rs
+++ b/drivers/gpu/nova-core/regs.rs
@@ -25,6 +25,18 @@
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
     /// Combines `architecture_0` and `architecture_1` to obtain the architecture of the chip.
     pub(crate) fn architecture(self) -> Result<Architecture> {
         Architecture::try_from(
@@ -43,6 +55,21 @@ pub(crate) fn chipset(self) -> Result<Chipset> {
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

