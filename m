Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E8F00C87B77
	for <lists+nouveau@lfdr.de>; Wed, 26 Nov 2025 02:39:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D8C010E4E8;
	Wed, 26 Nov 2025 01:39:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="jMJ5AyFt";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from BN1PR04CU002.outbound.protection.outlook.com
 (mail-eastus2azon11010047.outbound.protection.outlook.com [52.101.56.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CCC8510E4E2
 for <nouveau@lists.freedesktop.org>; Wed, 26 Nov 2025 01:39:42 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NMTT8fXcjeydaYRJ1IBTMhx7rm+vDOixCVKRKDAH8+JltC2wj4zjX4Te60YUdbRB/n7GVIL0Eio2sJFjMMBiO9HKuZofZjQi1BSS7FJcp2m2VqpKcXYQzVr9k47BtwRRqi0xk1eFbGCNU0xG6HhtvncFeU64oLQwbBtZBKShjrBLjuI30jDt5v4XLT1py/TGZSZXJOBBGZARJBU5AdU0XJZzAao6srGlqNXgtgLWP4nGn6JoqMxyIqLII+jwqpXrOWFK4tf2Nr5ygfeUGloDuGu19IFlFHGXxW0VDIHC4PxhA+rgXrb/43/MlpqwTfn9OPm1deGeN6R7+/6SY8gpow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nI+puBWEO5bDNmyCHBKbHQ2EaZj291ZuJoePuOZekOk=;
 b=WW+w8rB7/J08KH8SGK0SuR5HEo4z66hpSItUEZrNa8rh67pAcvubhPEWJch9Mpu4kdhGx8FWyRXgox9phwELiP8xPshk91ol3OoB1iTAlCHaWFPmQnVD9ICNxfVPiaPWZdk+WGHy8cgdpTMdAuezWhpoJdUO3BlwJl9Mer4uWbW5h+eMJVxsHnCH/MhRF2XjYnRx5ksvY3szgj6QCx2n80XhbwwE4DeQanSRFgMUDefyzGFmMyKtPAGXKtl9JAduJ0BsofKOj1ThagqT4xDspmnB2ye0nMzcCFqHjWY/vrAQkavJOPGr+PqwSX/AYaMXls1ETTAbAMf3kiSY4f9+3w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nI+puBWEO5bDNmyCHBKbHQ2EaZj291ZuJoePuOZekOk=;
 b=jMJ5AyFt4iC5x8T20bmP2dF8fyt3zBGBzgeZL7wG+QIDXD7AULNBUw84tU2uqu/zaCMV10wZ20uLkHBG8qZ+7TatlycEoZkQ1XUHYVAJ6NJWoTp3K1ZVKN6cJy/SUZQ3526/Xy1ONbHVo6qcrH24J/Qo6A3Nq6z0i9FvS+l2siMk6Ow3ywZFvsLVfCIOcpGiqx7VQfzw9nBieE5csntloKqT//gG2eLQbFeggzwUPfrR0DxBs89J20xYlgSymZS7TX9vQ4l3UETK5OWmald7iub8ox5WmMQD7Jsbaog+i+WjlHWDPm2ch8CEjp9M8nhtduIMiy22IV7wbE9DmHscUQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 SA3PR12MB8022.namprd12.prod.outlook.com (2603:10b6:806:307::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9343.17; Wed, 26 Nov 2025 01:39:40 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%7]) with mapi id 15.20.9343.016; Wed, 26 Nov 2025
 01:39:40 +0000
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
Subject: [PATCH v2 1/5] gpu: nova-core: print FB sizes, along with ranges
Date: Tue, 25 Nov 2025 17:39:32 -0800
Message-ID: <20251126013936.650678-2-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251126013936.650678-1-jhubbard@nvidia.com>
References: <20251126013936.650678-1-jhubbard@nvidia.com>
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY5PR20CA0004.namprd20.prod.outlook.com
 (2603:10b6:a03:1f4::17) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|SA3PR12MB8022:EE_
X-MS-Office365-Filtering-Correlation-Id: 6e90ff54-c2fa-4794-6e08-08de2c8caa58
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|7416014|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?FDUHipNU02guThctGx58TL3VBlNpHVJ3qEW98YSoWLralCTP/DOthgKB6R4W?=
 =?us-ascii?Q?5Q6v++74w8VjhTAWrMv3K1GClY2j1UlkPYN6WTwpOtpJ7Znr5OZMfzJIaaMl?=
 =?us-ascii?Q?biyMpBd3krsIh3cpPW9vpZCVa5XtkYNUDz7bRLLE+HKfJjno/48Xo+PeWVwm?=
 =?us-ascii?Q?8reGt8yS5OWbztnGSLGVjBAfsCjDfMfVQpMsISwN83R5msPCgLUP/zaBeuHh?=
 =?us-ascii?Q?Wu9D4EtRBOTkzzCawLGYphfJiG93Tf+QDnACjuK9GkuFMc7vuOvmcCTDjIts?=
 =?us-ascii?Q?RqA6EqybpIt2RKJ22GlJzhD3Qq92jLLBcCKwjfQ2o1Xe6IVTocehgZkT1z++?=
 =?us-ascii?Q?9rFACg75bBMRwmuHVoZLfHyQK/N1O1wyZaIkjxRUhiNu9UR62fUry5XKrTg0?=
 =?us-ascii?Q?KUewswIPGypqwXr2X0LlHjdFyvokXk4z+eIc1ybhcO/4bd5z8dv+M28RqRsb?=
 =?us-ascii?Q?FtPkffLrvU8b8dfasNVQEHdgvy1veC0saWrJjNlkn7XoG6glt+MI4/g44nCU?=
 =?us-ascii?Q?R7X8Ut+8AMQ/cWEMzaDHz+kXAspRtUSgTcBFXdWGQXxsKFvZ749qBLJYi+ys?=
 =?us-ascii?Q?2TM8uMxzWZ1zlOoyFAEq0UvofTpUdtrHJegLNXhNRPelgn9CyrloKbJaIXrx?=
 =?us-ascii?Q?KLThkt3vZZ1hYsmdvczNhniUOMa/bizOUI/eHQW0TJ31NZ1tGxMNZTYCHgF5?=
 =?us-ascii?Q?IJLQER1hUML8uSQPF995kFIWKBAf4+dVoUwD8QCUZw22GgT3VXt5HzQExXGV?=
 =?us-ascii?Q?Nb/PgXhbXAcMNq3cFAtX9HJ5ydLu3vKY6zIcURlKgiIrWUvRpm/ZuGF9RUZl?=
 =?us-ascii?Q?g3+S115ENFUmuvjCYIt+ekNdR6IMLaDCpPBcsP3Zp2pOprT6q2LYseuwRUoZ?=
 =?us-ascii?Q?0kQN0USh92KA82XdN49VW22d9GJz2wL7JRnRPrNGDt0YV/nWA6qoduauTIeB?=
 =?us-ascii?Q?b97Fd1ZcHgOZnqFRfr88Cg+pTJSXrrPx8+BfHyfhphhqQ/6ehm710jQU3aIM?=
 =?us-ascii?Q?nnNIupawIg+P+LHkE97XVo6GciED0r7YtmRilaQYuDP/coUizCun7o+8KQnC?=
 =?us-ascii?Q?bquc0vfx87lraeEikfil2LWbanVen998CgHBQBtRRmGKwGeXDrBFVlIVBZrw?=
 =?us-ascii?Q?7GJHA09vsN3+joWWdjSUnPgpTyX35uLF9iQRol8MUTR4g86JMmRhHLLKnQKr?=
 =?us-ascii?Q?IqRKBelHlFJA0ZnaARpeBV9WK2AFM/AHjqLRyGx9CeuIcUIBvzUBLlfnn2ii?=
 =?us-ascii?Q?WZkWie5S+eWJb7VbxOQNAv0KMMa9f6hb7SAQkPTUFF3mnatfmRdnPJfiDCBz?=
 =?us-ascii?Q?Z0yJ9O7zjjHnOd0MH5tIz2SMkVL5YJFPItlra/+6gq8GoHCuyXJehjgR3Su+?=
 =?us-ascii?Q?+njIplWGvQjDyxWBCyUFiu+DX7X+K3D8x/7HDwly1/EgO8UobuNeNXmQgjeK?=
 =?us-ascii?Q?pWF9g0dLnysiNdXPPoRLIZCpOuAFz2K0?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM3PR12MB9416.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(7416014)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?adzswd7qZfreXnSD9oE28imSpy2hRxAM5f+6zVNDCZA6V2dcd2UWUHDAZ7sw?=
 =?us-ascii?Q?ZJbd5NoDjQShlug5i8CgV4Y2+qzf7AzviECQkKuWWC9ICuIuVqS1YikukNW0?=
 =?us-ascii?Q?awKd4jGDutXXshh+N7ZQTs+YwKyWWBp20Ylls973A6PnzhwMs2lI6hSCdPSZ?=
 =?us-ascii?Q?fIfNAowylOLsSmgRPhjakROFJuje7/r6UhvPddpyWRQXANZn5dsg+E+idnDJ?=
 =?us-ascii?Q?eVgZjngNmkLRHX2jyH8KeC8i70VXjMnYmI9Q84i58utCY3Uyq8ukXeUEy84v?=
 =?us-ascii?Q?Omot6VBZSSSqn7Ae2qh2Ej7LceE3x0EStQR7bFojhG4ervyxPeU6BnzEpNjS?=
 =?us-ascii?Q?SpmMGR08FRUN8BgaTLhU8zYzaekVXx2gCCdvAtbVZ1pn5qCQN8XCG7mpXgul?=
 =?us-ascii?Q?zVLmxhhLRhQKxNkLzwL3tJXCe/pICDUFW6rl2KgeUpANM4ygrbiYhMIR8Mei?=
 =?us-ascii?Q?hLU/EYaIv2f9hAzbHkY68F7A5dETkaYIa4FcygAUYbqwPEmaCNOIaDZgrN0f?=
 =?us-ascii?Q?47oFsni5fWSLdg3pszUsQCk3BJPfIMM6I7/QdK/uXJvc7ukCSa9gE6Gb9VpX?=
 =?us-ascii?Q?fJ+Suwmank7X7zgexZRSlan8yQzNcXvofa7KYv5YSIVzZLckZmtoYDFSyose?=
 =?us-ascii?Q?5188Fk3y8TJhqnXpbWXjD+3iov2E0hwYIFbas0g9yKK3tApfLitSdzLzrOi0?=
 =?us-ascii?Q?CP94ZSxB8CRn7ZWeXgje0fw6my93jUl+Ga9kTtCaMjK9MuPvnd1ajYmAJQ2z?=
 =?us-ascii?Q?FRMZcAu6nMXObN6WaGHtRHwjEdRIJd59fIuolWQuxeaznERPc2yoqLN7b7yh?=
 =?us-ascii?Q?9IgfcaTeIf3OJLxU2QOinw2hthPogIc4OC8BWsfpTktm59en9mJMDyIJaMbJ?=
 =?us-ascii?Q?cIz8yBiG3ntTOV2VcAgvpGSLuOP2+iSqpuCE6M8QrjopAM2z0Gl1Gisd2kdC?=
 =?us-ascii?Q?zDUOyvNHY3Hw7QuKwaI/yHewBUpOs69oC9MtSRrEV8gLMOAm87yxomt0wSoO?=
 =?us-ascii?Q?pLJI3cqgfviv9dolarS3DONvcjEhJI2zVfzMuKHCBXM5YiQs7zDb1wp5ZDXN?=
 =?us-ascii?Q?XlsPCBF8tDn/zeJdnxBgNqlxtWlUoPZME965meyWHBSh7tlI037J/kjWx7vr?=
 =?us-ascii?Q?t0IaZzBiJ1Z04aOovLugfPlfhkdpOimSdQGlQ7VuiECa5VcEJzneM3V01m4q?=
 =?us-ascii?Q?cpWJBsYRESZ4lJ2vuqpvP/czaiyNqwpIToOwFc0G3+Qzqly6+Q1OSVe87Bl8?=
 =?us-ascii?Q?46xTgFodhJJrRayOLBpCBRed6z8Xx9hj2xd0ky7FpMKG+WoJKcFMVS1GAJcz?=
 =?us-ascii?Q?3e4OQxKt3K72bH5Z4vk5gvBlbZTSa5Fy/ATtTr6T5TNZZ25pEGZb3exBShC4?=
 =?us-ascii?Q?aCOlD6qCH/Wf6X+AsYZnCudzMsUIKEfRHJltn5Lbon9YgM9yNvdfIY5SYNA4?=
 =?us-ascii?Q?91OFQazhWmfR5zozt1YITXThnlGHvWA11kLRQ3lhTwNmvtw0rbMq8JfTcey/?=
 =?us-ascii?Q?93yk9RD2UG3JmfdmGdCFFlLsdnPmTQmz41V3+R/nqYdyc+93whtzk3/x3K9a?=
 =?us-ascii?Q?ja9IDbQHVotgignSE1OXUgnqdZq0lxyn+s1KWRZu?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6e90ff54-c2fa-4794-6e08-08de2c8caa58
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Nov 2025 01:39:39.9782 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ICxD1Bkl8zv9plDIDAd0mQkuJRh/X2xJSBjfWDRePtvLbyJEbj9z9zkSyMhYc8UvpucoTkFXgr91z1aKW2CN6Q==
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

For convenience of the reader: now you can directly see the sizes of
each range. It is suprising just how much this helps.

Sample output (using an Ampere GA104):

NovaCore 0000:e1:00.0: FbLayout {
    fb: 0x0..0x3ff800000 (16376 MB),
    vga_workspace: 0x3ff700000..0x3ff800000 (1 MB),
    frts: 0x3ff600000..0x3ff700000 (1 MB),
    boot: 0x3ff5fa000..0x3ff600000 (0 MB),
    elf: 0x3fb960000..0x3ff5f9000 (60 MB),
    wpr2_heap: 0x3f3900000..0x3fb900000 (128 MB),
    wpr2: 0x3f3800000..0x3ff700000 (191 MB),
    heap: 0x3f3700000..0x3f3800000 (1 MB),
    vf_partition_count: 0x0,
}

Signed-off-by: John Hubbard <jhubbard@nvidia.com>
---
 drivers/gpu/nova-core/fb.rs | 66 +++++++++++++++++++++++++++----------
 1 file changed, 49 insertions(+), 17 deletions(-)

diff --git a/drivers/gpu/nova-core/fb.rs b/drivers/gpu/nova-core/fb.rs
index 3c9cf151786c..333e952400e6 100644
--- a/drivers/gpu/nova-core/fb.rs
+++ b/drivers/gpu/nova-core/fb.rs
@@ -1,9 +1,13 @@
 // SPDX-License-Identifier: GPL-2.0
 
-use core::ops::Range;
+use core::ops::{
+    Deref,
+    Range, //
+};
 
 use kernel::{
     device,
+    fmt,
     prelude::*,
     ptr::{
         Alignable,
@@ -94,26 +98,54 @@ pub(crate) fn unregister(&self, bar: &Bar0) {
     }
 }
 
+pub(crate) struct FbRange(Range<u64>);
+
+impl From<Range<u64>> for FbRange {
+    fn from(range: Range<u64>) -> Self {
+        Self(range)
+    }
+}
+
+impl Deref for FbRange {
+    type Target = Range<u64>;
+
+    fn deref(&self) -> &Self::Target {
+        &self.0
+    }
+}
+
+impl fmt::Debug for FbRange {
+    fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
+        let size_mb = (self.0.end - self.0.start) >> 20;
+        f.write_fmt(fmt!(
+            "{:#x}..{:#x} ({} MB)",
+            self.0.start,
+            self.0.end,
+            size_mb
+        ))
+    }
+}
+
 /// Layout of the GPU framebuffer memory.
 ///
 /// Contains ranges of GPU memory reserved for a given purpose during the GSP boot process.
 #[derive(Debug)]
 pub(crate) struct FbLayout {
     /// Range of the framebuffer. Starts at `0`.
-    pub(crate) fb: Range<u64>,
+    pub(crate) fb: FbRange,
     /// VGA workspace, small area of reserved memory at the end of the framebuffer.
-    pub(crate) vga_workspace: Range<u64>,
+    pub(crate) vga_workspace: FbRange,
     /// FRTS range.
-    pub(crate) frts: Range<u64>,
+    pub(crate) frts: FbRange,
     /// Memory area containing the GSP bootloader image.
-    pub(crate) boot: Range<u64>,
+    pub(crate) boot: FbRange,
     /// Memory area containing the GSP firmware image.
-    pub(crate) elf: Range<u64>,
+    pub(crate) elf: FbRange,
     /// WPR2 heap.
-    pub(crate) wpr2_heap: Range<u64>,
+    pub(crate) wpr2_heap: FbRange,
     /// WPR2 region range, starting with an instance of `GspFwWprMeta`.
-    pub(crate) wpr2: Range<u64>,
-    pub(crate) heap: Range<u64>,
+    pub(crate) wpr2: FbRange,
+    pub(crate) heap: FbRange,
     pub(crate) vf_partition_count: u8,
 }
 
@@ -125,7 +157,7 @@ pub(crate) fn new(chipset: Chipset, bar: &Bar0, gsp_fw: &GspFirmware) -> Result<
         let fb = {
             let fb_size = hal.vidmem_size(bar);
 
-            0..fb_size
+            FbRange(0..fb_size)
         };
 
         let vga_workspace = {
@@ -152,7 +184,7 @@ pub(crate) fn new(chipset: Chipset, bar: &Bar0, gsp_fw: &GspFirmware) -> Result<
                 }
             };
 
-            vga_base..fb.end
+            FbRange(vga_base..fb.end)
         };
 
         let frts = {
@@ -160,7 +192,7 @@ pub(crate) fn new(chipset: Chipset, bar: &Bar0, gsp_fw: &GspFirmware) -> Result<
             const FRTS_SIZE: u64 = usize_as_u64(SZ_1M);
             let frts_base = vga_workspace.start.align_down(FRTS_DOWN_ALIGN) - FRTS_SIZE;
 
-            frts_base..frts_base + FRTS_SIZE
+            FbRange(frts_base..frts_base + FRTS_SIZE)
         };
 
         let boot = {
@@ -168,7 +200,7 @@ pub(crate) fn new(chipset: Chipset, bar: &Bar0, gsp_fw: &GspFirmware) -> Result<
             let bootloader_size = u64::from_safe_cast(gsp_fw.bootloader.ucode.size());
             let bootloader_base = (frts.start - bootloader_size).align_down(BOOTLOADER_DOWN_ALIGN);
 
-            bootloader_base..bootloader_base + bootloader_size
+            FbRange(bootloader_base..bootloader_base + bootloader_size)
         };
 
         let elf = {
@@ -176,7 +208,7 @@ pub(crate) fn new(chipset: Chipset, bar: &Bar0, gsp_fw: &GspFirmware) -> Result<
             let elf_size = u64::from_safe_cast(gsp_fw.size);
             let elf_addr = (boot.start - elf_size).align_down(ELF_DOWN_ALIGN);
 
-            elf_addr..elf_addr + elf_size
+            FbRange(elf_addr..elf_addr + elf_size)
         };
 
         let wpr2_heap = {
@@ -185,7 +217,7 @@ pub(crate) fn new(chipset: Chipset, bar: &Bar0, gsp_fw: &GspFirmware) -> Result<
                 gsp::LibosParams::from_chipset(chipset).wpr_heap_size(chipset, fb.end);
             let wpr2_heap_addr = (elf.start - wpr2_heap_size).align_down(WPR2_HEAP_DOWN_ALIGN);
 
-            wpr2_heap_addr..(elf.start).align_down(WPR2_HEAP_DOWN_ALIGN)
+            FbRange(wpr2_heap_addr..(elf.start).align_down(WPR2_HEAP_DOWN_ALIGN))
         };
 
         let wpr2 = {
@@ -193,13 +225,13 @@ pub(crate) fn new(chipset: Chipset, bar: &Bar0, gsp_fw: &GspFirmware) -> Result<
             let wpr2_addr = (wpr2_heap.start - u64::from_safe_cast(size_of::<gsp::GspFwWprMeta>()))
                 .align_down(WPR2_DOWN_ALIGN);
 
-            wpr2_addr..frts.end
+            FbRange(wpr2_addr..frts.end)
         };
 
         let heap = {
             const HEAP_SIZE: u64 = usize_as_u64(SZ_1M);
 
-            wpr2.start - HEAP_SIZE..wpr2.start
+            FbRange(wpr2.start - HEAP_SIZE..wpr2.start)
         };
 
         Ok(Self {
-- 
2.52.0

