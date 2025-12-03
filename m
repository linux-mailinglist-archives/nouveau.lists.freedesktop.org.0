Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EF4CC9DD61
	for <lists+nouveau@lfdr.de>; Wed, 03 Dec 2025 06:59:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 42FEA10E0DD;
	Wed,  3 Dec 2025 05:59:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="Si5iJY8x";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from SJ2PR03CU001.outbound.protection.outlook.com
 (mail-westusazon11012060.outbound.protection.outlook.com [52.101.43.60])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C8F2B10E07C
 for <nouveau@lists.freedesktop.org>; Wed,  3 Dec 2025 05:59:28 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aj6XocLN0IrSzfTNr//KWI/qtQXSt0qc3I7jWoUsIxAEXxr5k22/sbQY5obQQtge7trDaaaJXk3G0YRNjPt4NzDPxKKmpKEVfmdYoW6wOL1Ax97EUJSlilKMmyz/eT79bc8oeBRsJl9OBqLJNc3VFLpy87bG2IBtN7O3veJcmUy7gyvXzP+5rmqku5PfKPJCHgt8QXFmX9rU/KACvn3Y5iZ0BoO0odqIf1s+ODVsU/DARv5TBvAiQBNhtxWkEwRC4OHI1mWEQf8ql1k2uzdYurOSzphq/SqGQc3/wcIxK5zm7AueddugXa9rOQxAflv+2ltzDQHT0TgZR93BYjte3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nI+puBWEO5bDNmyCHBKbHQ2EaZj291ZuJoePuOZekOk=;
 b=GvNagLr9csyvrr2WyT11CY76zH5K54UGtNJX1uU1sCamVXixk9aOARUokX47BPH+0fEJDGhZHJJD4iccldvIq1CUFsLsP++lCu9KfQs4eLqS85EtIwf3CIYNGwh6TJusNVQxNLY3O11sRaypGs5G2YIeZHb2A2JQdPDzANr1651NL/VhtL5Zyz6xto9IMvAwCUZ7p1jW7B4MTWRdMdC4ASNnS/wSNMn4v5nzPA45Yd/fRj5wv7kfnQKAszAthd2SKFwsvbA3+AgghMcvBOXkrtw8RwVb0l4Xsrl/Cbvdhw655hcJv8wE6UQz0Mnt5Ewzm1+B0dujQbtXHXYYEVntFQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nI+puBWEO5bDNmyCHBKbHQ2EaZj291ZuJoePuOZekOk=;
 b=Si5iJY8xQEh7/9LsvICY5z/ijAQPLHvL7e0jEuJumWCzw5cvkxyqqEXqAL2t30dNrLjfx1sAXqZIS+KwALOeK/44uIu8lRwV1nwkuK7lricNxcvpW2phVAO7Bf26+uvURPEqesungzp0AR0ubzqrTtIMMbpEXAlQf4W4cYZElhzQnXz701kZZgfvLPc/tBb5fQ1CmSRkp6Uv2ZWPvQun8K6xfGcUZ+WYaaOh5bPzBJLdpckn8787pS+lfG117Lavw251U3E8Tks8IBPSZNgA8SErVJbGtYM9W9RkOeIpEFIG3YBBSZKCpfq/hrdAFzcjiO9TXqVYneZ3ubRDfmDrzw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 PH7PR12MB8180.namprd12.prod.outlook.com (2603:10b6:510:2b6::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9388.9; Wed, 3 Dec 2025 05:59:26 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%7]) with mapi id 15.20.9366.012; Wed, 3 Dec 2025
 05:59:26 +0000
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
Subject: [PATCH 01/31] gpu: nova-core: print FB sizes, along with ranges
Date: Tue,  2 Dec 2025 21:58:53 -0800
Message-ID: <20251203055923.1247681-2-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251203055923.1247681-1-jhubbard@nvidia.com>
References: <20251203055923.1247681-1-jhubbard@nvidia.com>
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0138.namprd03.prod.outlook.com
 (2603:10b6:a03:33c::23) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|PH7PR12MB8180:EE_
X-MS-Office365-Filtering-Correlation-Id: cf78079f-66c0-4ba8-94eb-08de32311d90
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?vEyKNDLYMMoWqHnbjd+6gtvlWFx8vFGJa6TsXvj1n15x/TBWgFp2FHng+7BV?=
 =?us-ascii?Q?9khaMqKtTzZkzwnZERS+D7U2txASuvG/fx6MHKKdDaceThNnTg6/RTKUwbnq?=
 =?us-ascii?Q?c9WpFs57LHHyaDcS4YJmpeZx03nz3rlRZe1Unz6dBXt3JBoENYfORpSgtA1A?=
 =?us-ascii?Q?XbzDBGi0Go/J4wDhlXi1ZbCAMJrnf7147RgqzHbdy9lbpcIZ45MdIBE2FJT0?=
 =?us-ascii?Q?lYX0Aakt9FUAdhhbqqgj89tcv9QZjlIiCvmRBxjA/pz7C9Gvnm2djoTsrlfn?=
 =?us-ascii?Q?Izktx/8Tpac0JNFu5l4llpkniV6RxZes+dCcCCV8Vkezx3+P8wJy59pvsS/K?=
 =?us-ascii?Q?jvQbAcpQQ/K/HRExRTCEIMkZ+k5Bq9znLF14DaEGHpKVY77x6M3+Dq41E1WM?=
 =?us-ascii?Q?Y7QAeuMuEhYlcLLzoKAuUEokCQdE2elLzfRKb2hSSBJ/JWs6C/qUKYwWqGr1?=
 =?us-ascii?Q?gSq2SapF1K3pD8EavEYq9dYazl9sDPVBvMDnYqL678cXDzOr0RxkFlJO0/3u?=
 =?us-ascii?Q?8zWQeM4y/zdeOOhJVQCHV/j9XVQb8CYHws1fH2tkvBSRfPn5uC2LJWAtJoxN?=
 =?us-ascii?Q?L26vozIY79iI7ZIRGMXl7FU1MRQXoWei4auz7G7A8TbsfY4GSrlq+cQURCRT?=
 =?us-ascii?Q?uTSe8XLn0vuUiDU3HgYVRSrjimEs+1a1avi48oBdJ9w35SK+tcjHPlOtPlHf?=
 =?us-ascii?Q?j61MgtwvMzbSLcDQ2ilc7uHaD+3x366t0MD5n2aDYxt31OXRhVPT9Hg2F0C2?=
 =?us-ascii?Q?NPKOcGR8fo4xhgQt2C1X1Np04DJUWKKmOrhMqa0JWq6L8vzpGs64H0xm7Nsp?=
 =?us-ascii?Q?uHVikIZi8MCcE8qkPOHq1bEtIwhWyQyscMMLdRVcHN+5h1lD03powFSyCwbx?=
 =?us-ascii?Q?ciSuPr+4xDxhslGdi/prWKIjT2asIHgCsioETDZO1N+arg7Geq8fUYL5ZyOL?=
 =?us-ascii?Q?NCGECVtalmkdnbAjm7So00bEI8b16AF9S9xdAFw30Rjacg9ZhCvUPwCUM+ww?=
 =?us-ascii?Q?dDGCQiEYEfRc9dJ7uURl+hGwTV0D95DnXxX0TRfSyQq+E4OsjfhciF8e89Da?=
 =?us-ascii?Q?M9Cc0pNfr5jyEEnfdmGT+41Os9Ng4DhdpvaXo6in3P2/qoncYsp07ENXpj8G?=
 =?us-ascii?Q?/4zM+ANIMasfBclsK9HYwT5StVOqJRbqd2rTR7JrBdKbq4ycpGUvKikvWRn2?=
 =?us-ascii?Q?qB6iXipB22dv6zohImEM6C+4TIZ3Id8MiLvIqkl3cQw6aWVcfN37A4bM8ebh?=
 =?us-ascii?Q?swVf5DMAiw9JNmmwJUG3wdFJdcD7+ZESnDEAeQKUAV6SBrEN2rg4s0ky5vLZ?=
 =?us-ascii?Q?jD438Hi/fGrZv7mZsG0SljXs8r7/e2j7hCtcJhArowAgtkpUfqT3f8W+F4A8?=
 =?us-ascii?Q?DR/oGALauVnL+AHacUgwXt5N1mInmIehP/k/3RkTtUEJyKWhuUfDigM+0+75?=
 =?us-ascii?Q?d/u26utHKNUFhMZkGE3HAgFP9gtnp5Yz?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM3PR12MB9416.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?iQFxqJisAYQWk/o8UHEV+Uo+CEwZyjJCaJnoUSqN5DVKh0eRc2S8AbFqucIT?=
 =?us-ascii?Q?G35B9rzc1dveeZLyZKDS14c+l+gh+wtbj2t6vhSC39p/ogIrAIk/Oho7ULeI?=
 =?us-ascii?Q?x6N1JThkHu/XvFOc0OLRFAhLnb7yzHRhbe3jwzzuVU07t+CWmigsVIpkvlqT?=
 =?us-ascii?Q?dRmOacx7Jwqzj300hdeHGmHilB+jjirJXDSlyxUuyJidyl+FkiiitnszqP0+?=
 =?us-ascii?Q?a8SDeVIxZkn/pE2BobPl011NPz9AW7CqaIb2M0Fm6uhr5xNsxn7c/WcYIcqL?=
 =?us-ascii?Q?k2VDpLyPV83f2hq4luif+Fmod7VMSYMODo6gLykjZ7mIXlSwxgviKVGx3T38?=
 =?us-ascii?Q?wD+JIGD63e1YCAIod0dLAZt2xipElnyW8blnu9XHt7Yy31ASUcYt+/DBrBpm?=
 =?us-ascii?Q?/gq8bLCwtbOnbkkWDoRljWlEV2qVY4ROgH+HQ+medEtuJ6o6ClR8nPLXs1n4?=
 =?us-ascii?Q?u1C2mCHG6v54cYHSbsyLheeECnu7JX7okDCLJOY800bDLQDTIzH+fXA61Plp?=
 =?us-ascii?Q?Zcbo2rLMpYNZMvieyJ+z90t832c+uZXVjttwy11ly/Exc2Z21n/PX5HBYVgV?=
 =?us-ascii?Q?gpgI7wopXxCzwQpCz4uwMugJnVBIgoDCJqu9oh4BkuXfAQKN8PRJ4Ep+I8rd?=
 =?us-ascii?Q?QRrVHfWz/OLMebbTWjS7vP6MZosTURsm2cu9QFsIRkUl9NyeQ9ZMv0X12fM/?=
 =?us-ascii?Q?WtFe8j0XLhAMeBFw3z+Zuz37k3yPCZn9cU9F6qPnzy/OEw8dQ5ydZ10Jl9A5?=
 =?us-ascii?Q?9Vr63Yk/0xBwSrWRz4OP0vNxHnSWqP5c2EwyEPB+K3ErYs0iP141y9AD+05V?=
 =?us-ascii?Q?Jp6Id/tSlModc6HVFglsmfKCZOmwLrvVG6C3aOr9iOVaLTBrWpEPDy6o4127?=
 =?us-ascii?Q?iILdYxVW/YUdTBqfAUtY3oq98vw1gBc+DCHK6QUjq4IURcIeZA0u1fTnXqcc?=
 =?us-ascii?Q?Sx2LAhFrx92Maozny3gZAe6HpNeL5qUZvzZHBkyOiXPDfrnMY9NKhPhFF2Gp?=
 =?us-ascii?Q?7qFQJSTp8wFgHsA09z5DA9GbkGp0ONoWxOsoOgfz61hCkhaqTpUiz4JEB78x?=
 =?us-ascii?Q?lX2enIJt4iTxdAmRf2w/7asZuFd8WfbjmNvmD60u46eFTGkEHrhRNvcjuNAO?=
 =?us-ascii?Q?sUXJd1baZB+ErKvZEHxEu5sfKHz+WpZAhp/A7VFBCUR9AeJlh1rQqLJknjhk?=
 =?us-ascii?Q?jVpYFJbah8VojuKCK1vuaS8UY6b7t+liva6wOR0w0hCYjJc9MOrkyIIjk9V1?=
 =?us-ascii?Q?6EQJjbetWHZ37itMsAoG+Y6khMrBxZUJxLxtf7rJ8E5O8QnufoT8NkVcKHEN?=
 =?us-ascii?Q?D9fNPjsRc+nTb1BPqmpWLRYHFKi7Mk71KkMjPBQsHuSFsPlB/Sv/FKO2/DPA?=
 =?us-ascii?Q?Qxbf2/4CqA6THYVj2oodbagq6HyQE9ZO1PCTMds9aqtNYCdGXsJPo2piVhyS?=
 =?us-ascii?Q?7S00sG3YubHzynCcT8OPMdRdIt/91c22t9RQxk92W1+ylpZyM83UU+5fXtoz?=
 =?us-ascii?Q?QzHIPwY2eZYR9alJE4W35W2UI9uh6XAy7hQxRnOUTmlFSNtgi1htcLMPmQs5?=
 =?us-ascii?Q?TPE5Jw/WjeQ+tXDBs2DKOXsI/wfGdSIeBtjB9DDk?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cf78079f-66c0-4ba8-94eb-08de32311d90
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Dec 2025 05:59:26.5481 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: A6nyStbaxaNdO/0uQ9NXGQ8HZ9pn+dMrcIq6hNdGRf93YpDSOYA4E0O9ypMWkET9PKthNcU504X+QHd2WAUQIg==
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

