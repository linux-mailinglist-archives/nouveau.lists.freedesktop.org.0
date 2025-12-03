Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E9AA4C9DD7A
	for <lists+nouveau@lfdr.de>; Wed, 03 Dec 2025 06:59:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8225C10E0BB;
	Wed,  3 Dec 2025 05:59:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="KUnzfpaS";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from DM5PR21CU001.outbound.protection.outlook.com
 (mail-centralusazon11011004.outbound.protection.outlook.com [52.101.62.4])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3456910E70A
 for <nouveau@lists.freedesktop.org>; Wed,  3 Dec 2025 05:59:40 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wB0zl6xROBlMdJ5f5rn7hTw/nuCllYI/SjBbpS2E/tQQsHWNxoUgGoKt+Msh1CHRc9ASbf5RCC8kFK/jVsKfciYS8AGjXwj2XrOZM2ssL/OINKAiB0JrufMm2Dm4Nl+RVhpU9xQtIDJ8bpB3IQ+o4DUC/p04yWmDcmv8MSpYl+SEwe1wg6uKiEXQzbeznxqPxVrUGHzV1q1xKJMDJ3xuwM8FLKQWkdlCQIg71L8/SS2Dmu5XKhoKqrDTNqCOlUFOu2OpPzZjcTJ37fwjn3NxId1YoXdEmdHKLfF8c1s5OL40DNciHSkADonuwoPoBqxkEkpXMtNNxMMBD6PGabRKkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dC1xoqCgAM1+HaD1tLlMI2Ge5xObxp9WnpHDyJ5iF28=;
 b=f2K0QuxkgPPs/FAmXkO4p5OkvD5ryQMU7WP8jJYU7YQIG5fyfMJSBVUsuUy3Mn7RonuAsUkGXscfD6VQNusto8z9F9f/RWP3H+Ef2CWKA54BTbibADvSCOhRs4otlUTYRPW7VtoOunEExLZBOJ0GW/7zfhk/VVa7cFpNJsE3v6HuoGpWIuuitStGogv2G4hLQUMgknKcSll0g4nmP/aVmYGeG0drnrJsDoQ0+Vlh64zCdabICT/jFiLViHfQdAvo34yDGbaM9KUTEQighQnYgkB2nFRbcvNRDSftx0rsAy/GyAmK5McRzdaIoW1dQ8krdj2GwYq+vqMll6zzZu9rHQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dC1xoqCgAM1+HaD1tLlMI2Ge5xObxp9WnpHDyJ5iF28=;
 b=KUnzfpaSLGdUMR1qb4hA5CAJ5NCqnOMnqgdS5BPB9dsfUmWucZnXEzO+Mjw0gC8SvOlvPlA/wL6lCiicZKT2U8Z/8vzqTEaV1f4jBoy+XneCASWMgbKqWBoz2OHJ9jmJGPIsBrTqs2X1ElfeWlAtTrcPkKw9WBhlHHkFk5XvvpBYMAux/r+lhQWfUCXyWCiPyJMN7EufWD49iqi1+jGu/PuxIFP5Aw58rnOfloN1nHbR/cKAkww7E8uNLDzUxE4A/rq9+V5UV5o5w9FJ4GucOnvA8ZbS1fgr7kav2/mtX/4g19g5OnKkcB07zinDXzhP6ZvhXnmWb38zHtCa9JzJLw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 PH7PR12MB8180.namprd12.prod.outlook.com (2603:10b6:510:2b6::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9388.9; Wed, 3 Dec 2025 05:59:37 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%7]) with mapi id 15.20.9366.012; Wed, 3 Dec 2025
 05:59:37 +0000
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
Subject: [PATCH 08/31] gpu: nova-core: move firmware image parsing code to
 firmware.rs
Date: Tue,  2 Dec 2025 21:59:00 -0800
Message-ID: <20251203055923.1247681-9-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251203055923.1247681-1-jhubbard@nvidia.com>
References: <20251203055923.1247681-1-jhubbard@nvidia.com>
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0236.namprd03.prod.outlook.com
 (2603:10b6:a03:39f::31) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|PH7PR12MB8180:EE_
X-MS-Office365-Filtering-Correlation-Id: 1991f79d-789d-4ab7-3b4c-08de32312443
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?ctN7vRwx6MQDFP6FvlqUrODRDrfP0WuBBa6Kgx0Zy1b5JLQ/MOlS1i8c204m?=
 =?us-ascii?Q?fKRp+24X8Jtt6WK4rEtYokPGdTAF5hoX/j03Vd1PfY+Iu9nlORFHVJWdAaLi?=
 =?us-ascii?Q?E5m/vCKDxwW9uwmIi+diD9bq1ZfLVhrpdRuqMvOQrS7vLzWkc1so2x4pILRc?=
 =?us-ascii?Q?faxX0mttlST3SqEBePKEGIFOVGqjHkcbkhRlejrxOUKpTQUczUypAGLTEhk0?=
 =?us-ascii?Q?gJAXeV4UrrGfk345kW0HMHdnMVjUrCLbNHyqOlbxHlV9OckdlgHi07NSWryk?=
 =?us-ascii?Q?tlDLOvPj/aNaOWu6suvShhbseDvT4LgaseVuViwp32w+MdflfxblopNAd15q?=
 =?us-ascii?Q?cFRLzzRuD8DQKLJSXe3S+QQZsm8qG6heMTxL6BTOqWkSDPDx/9tjAycokU6I?=
 =?us-ascii?Q?HGBAn6/EVTLzkFQ3Jj407MCRNW/pb85V9KRXw+dpclQqlrnsW5mNJ0bexCrk?=
 =?us-ascii?Q?91hYTdeuMU0DrJrk0VoXii9K9rXR6RpGKjN1S6kMPi+qrOx37LWRTPvDUXUA?=
 =?us-ascii?Q?UnVo5P07MxIRL3oUiiixEQNfnv39cVF8xAwj9o3cho+kVs2qkX/o9QQyeQtp?=
 =?us-ascii?Q?VpUpEpC8l8lmBTRSFrlZJ1dl7HQbmVVl8MFSq3JkXeQdWjTmTlM2bIy3rrVf?=
 =?us-ascii?Q?08lk0YgRrboFqVfhikYDDIQLv6JtLqZKeCSIPsj931Q4DWCr44Q85LMkVDte?=
 =?us-ascii?Q?sELYvfU6cW5x1F5tR1HW+n910YzFMP/NQs0TH+9x0wnfF3VuQ15v+asloela?=
 =?us-ascii?Q?qbGsGVVRHydbc4VsAsi8c1sBHS7sb5AFquwXKP66ZA2Oi1ZD7Pga+tYSIx+b?=
 =?us-ascii?Q?Ojh1pHqUEtngyVYjkzx7imzqJzm7Q2pPsjfvN6hYOOaPzwkCTwKP+L0FofJr?=
 =?us-ascii?Q?RVSyXQD/oktHwH2kyIwQmID/lX8dIe5VXX3FVu74IcmuvZNojnE8c1ftBXhr?=
 =?us-ascii?Q?NwW3rE1Rqb4VGu1TjM1yMTFqflcvQRM2YKFDFGF955bfJGcwN8PJm5PhR+Hh?=
 =?us-ascii?Q?BKRGG0sw60LXIJQ2nbxubyeuoTsAvXUcGMS29xWtby+w3Y4i0CY7gToZf4ry?=
 =?us-ascii?Q?y9qOwZT+DffaZ0Bzw99AoKEGFWfM8c5w6qoBCZiFWPZRv9yGyg0d+WL4cp5Y?=
 =?us-ascii?Q?HAtSLG+XcIozQfGoBQSJq9yBpbf8Cm2i0xHK5kHT7rSzy/kVhtfV0PiyRCPv?=
 =?us-ascii?Q?PV98kGAivCeDpPSBVMGEnR4PtssP2QRTfPbJD648i3Ny9q6bCj1GpyzBPM0u?=
 =?us-ascii?Q?+uC1rOcUA3nLUteCFgfwrFcmTUU8RW9MDHgndLsG5LVDR63ZzPX1yXGZZf4I?=
 =?us-ascii?Q?AqoKtuO/vsnMFRmKmaNVngwtyaxbRuh8Gj7MVB3zDPGjH5DLTlkUGAUCYqFm?=
 =?us-ascii?Q?d8/+bSUaNhaGN9+w1DPGFDXvakBp3+KzHlBwTxJ3FiZAwVfQ047JjZ4CIOe9?=
 =?us-ascii?Q?PmPP7rVOhH21tTWLRA3mq/wGOCKycyhN?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM3PR12MB9416.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?6PHWrRzwWMWqgRt8Gv+fAqikifgDUDA0ug92Lr/zHUfquKQxgf7d3K/Utq8H?=
 =?us-ascii?Q?2U4XJb7vYdxF6cjST03DspupQ0kRf9Ypw4ShoRj/K6rCSX5koxsLiK5ucDgS?=
 =?us-ascii?Q?v9CxEBOeAwRs8w/WJH8Z9k4rYYU1QV/hJEXv33ND4HAAriDUaZKd9iYzfxif?=
 =?us-ascii?Q?eQFzyzHaoahyEbRIdBCCZsX4ZbvBM1PMuwWdUfsCo5E2LUrbBR1ZfSGmO76Y?=
 =?us-ascii?Q?umzwx5uLwvnCl0iwKHzeL7KU5H/OH6vZ6mEtR8GTiMJo4zr/1/4dF7o8fJmq?=
 =?us-ascii?Q?dhWh77615U3oF4+P91HIbsD+ybipMUfQg0EQtE9RwoRZ/Mc5yCsLpAFPCnG7?=
 =?us-ascii?Q?MXsSwF5vTFI3lpu4ByBU8WyfBJCIcA5/jSditr3Uzrjy6J3FX/qLfhHqaWtP?=
 =?us-ascii?Q?dojXAqGYnh9GK+k53XEVLhxjwvlV5x78itj9Gd8annJOXHC11F5UVPmrHJFN?=
 =?us-ascii?Q?gRsEjMvfLql1e63vr/tGKVuTxsRxmfMRhdwiYjEiZ+l1JGRLA2XcNk0cLl4V?=
 =?us-ascii?Q?q/PPd4loCFSQDfHLFfcMOPVvSogWAZQ2fpbcxVKi6zk070WQxqTwYrBp/dXZ?=
 =?us-ascii?Q?q9r86xCIhPYd1bBX3Muzy4Ok8bXyASoiK9JrmrVdbOsLoK8tUzOlhUiPMLi6?=
 =?us-ascii?Q?EuzC28zaK70g9WP2h6pn4Gkbhc9+6Vg26tOizmAnHw28FRT/BS/Zbc+zHGxX?=
 =?us-ascii?Q?ogIy7PFa81LngmvMXjxZ0Jtcf4GDgxaLfq9/ZILVw7KvOJxRffM1sDShTp/5?=
 =?us-ascii?Q?iMI1aVmzhz8VYmaR2mE5zjN22P/q3KTFzPN/Xpkp/XVAjvS6dTCALfFT29Qw?=
 =?us-ascii?Q?Y4A9Nr1ZQixCbWK6BIlUlr14Ksbt9W0U/e331vvqjpaGzY+hx3wO2bw4js1f?=
 =?us-ascii?Q?rx+i+YQPduhA7Wco8t1Pw3iBRI2bvP+P6m+wiSx8VQKLi6ZC1kMIjw2Clip9?=
 =?us-ascii?Q?9E7e87CiQH1mQvqLtAxOidi3PPDtaSM/v/REgyxym4ZKkBjgcopvcNlcMUVz?=
 =?us-ascii?Q?VNF7oUvR1a0mf6eCJBhiihWijuBJf0XQ1G/WLBGtsgoc3sXFoqPbvt752hM8?=
 =?us-ascii?Q?s0E8hJ4H9sn7G9my4tyPTv50qUOE4bJTpOMWAXXYRP/hzWhdKTObtYSTXqVO?=
 =?us-ascii?Q?QrTMaGOUTSGBh0QAjtRbm8tdQ//45617o0rmaZZz8RoUXL3QFVc2NtC5lHV9?=
 =?us-ascii?Q?eHIbqfLt1A4ONRgeTG7Ay2ph+GC3J0veLbzp8/gro2Rz1VpdVJGDy+MJA3Wb?=
 =?us-ascii?Q?9/b8lYCHr7YRPw8N/lgzwaBz/r3ZesPlf1N7QLJ6eEf5gNbCM00McuzDQrbv?=
 =?us-ascii?Q?AWyV25L4sGd5HZWG57x2h/4uiC2K1/3S3yEc9DbtjiAZnlz6AGWhiyGqJqC1?=
 =?us-ascii?Q?98HCcw/XBI9W/yBZ7aYkcXR6cbUATCL6ZOLavnW88gRLlmf6c44gDfCsokrw?=
 =?us-ascii?Q?4oRs7MrkMoQTPTH1xntEro7FK/+61gff5ZBOqIWPg98G6a/GU9ufq/EXQcPV?=
 =?us-ascii?Q?o5gaxKNQZGBp2f66ffJgnirpCJyicdApfr+RBvqTTNN3OgsakOpXo6N4uwGy?=
 =?us-ascii?Q?+1DTgiJEO38MgyFLZFWybM5C9vSRC5oPfQri7cYh?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1991f79d-789d-4ab7-3b4c-08de32312443
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Dec 2025 05:59:37.7604 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Pl+e3MScUOQ8KnyLEwaFwMo4O7/tJlsp8u+zbWUHKjttUfJVlBnABx5+6g1dcRT8Rr4oF08ClYCZpF8rRvCoaQ==
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

Up until now, only the GSP required parsing of its firmware headers.
However, upcoming support for Hopper/Blackwell+ adds another firmware
image (FMC), along with another format (ELF32).

Therefore, the current ELF64 section parsing support needs to be moved
up a level, so that both of the above can use it.

There are no functional changes. This is pure code movement.

Signed-off-by: John Hubbard <jhubbard@nvidia.com>
---
 drivers/gpu/nova-core/firmware.rs     | 89 +++++++++++++++++++++++++
 drivers/gpu/nova-core/firmware/gsp.rs | 94 ++-------------------------
 2 files changed, 93 insertions(+), 90 deletions(-)

diff --git a/drivers/gpu/nova-core/firmware.rs b/drivers/gpu/nova-core/firmware.rs
index 2d2008b33fb4..31a89abc5a87 100644
--- a/drivers/gpu/nova-core/firmware.rs
+++ b/drivers/gpu/nova-core/firmware.rs
@@ -242,3 +242,92 @@ pub(crate) const fn create(
         this.0
     }
 }
+
+/// Ad-hoc and temporary module to extract sections from ELF images.
+///
+/// Some firmware images are currently packaged as ELF files, where sections names are used as keys
+/// to specific and related bits of data. Future firmware versions are scheduled to move away from
+/// that scheme before nova-core becomes stable, which means this module will eventually be
+/// removed.
+mod elf {
+    use core::mem::size_of;
+
+    use kernel::bindings;
+    use kernel::str::CStr;
+    use kernel::transmute::FromBytes;
+
+    /// Newtype to provide a [`FromBytes`] implementation.
+    #[repr(transparent)]
+    struct Elf64Hdr(bindings::elf64_hdr);
+    // SAFETY: all bit patterns are valid for this type, and it doesn't use interior mutability.
+    unsafe impl FromBytes for Elf64Hdr {}
+
+    #[repr(transparent)]
+    struct Elf64SHdr(bindings::elf64_shdr);
+    // SAFETY: all bit patterns are valid for this type, and it doesn't use interior mutability.
+    unsafe impl FromBytes for Elf64SHdr {}
+
+    /// Tries to extract section with name `name` from the ELF64 image `elf`, and returns it.
+    pub(super) fn elf64_section<'a, 'b>(elf: &'a [u8], name: &'b str) -> Option<&'a [u8]> {
+        let hdr = &elf
+            .get(0..size_of::<bindings::elf64_hdr>())
+            .and_then(Elf64Hdr::from_bytes)?
+            .0;
+
+        // Get all the section headers.
+        let mut shdr = {
+            let shdr_num = usize::from(hdr.e_shnum);
+            let shdr_start = usize::try_from(hdr.e_shoff).ok()?;
+            let shdr_end = shdr_num
+                .checked_mul(size_of::<Elf64SHdr>())
+                .and_then(|v| v.checked_add(shdr_start))?;
+
+            elf.get(shdr_start..shdr_end)
+                .map(|slice| slice.chunks_exact(size_of::<Elf64SHdr>()))?
+        };
+
+        // Get the strings table.
+        let strhdr = shdr
+            .clone()
+            .nth(usize::from(hdr.e_shstrndx))
+            .and_then(Elf64SHdr::from_bytes)?;
+
+        // Find the section which name matches `name` and return it.
+        shdr.find(|&sh| {
+            let Some(hdr) = Elf64SHdr::from_bytes(sh) else {
+                return false;
+            };
+
+            let Some(name_idx) = strhdr
+                .0
+                .sh_offset
+                .checked_add(u64::from(hdr.0.sh_name))
+                .and_then(|idx| usize::try_from(idx).ok())
+            else {
+                return false;
+            };
+
+            // Get the start of the name.
+            elf.get(name_idx..)
+                // Stop at the first `0`.
+                .and_then(|nstr| nstr.get(0..=nstr.iter().position(|b| *b == 0)?))
+                // Convert into CStr. This should never fail because of the line above.
+                .and_then(|nstr| CStr::from_bytes_with_nul(nstr).ok())
+                // Convert into str.
+                .and_then(|c_str| c_str.to_str().ok())
+                // Check that the name matches.
+                .map(|str| str == name)
+                .unwrap_or(false)
+        })
+        // Return the slice containing the section.
+        .and_then(|sh| {
+            let hdr = Elf64SHdr::from_bytes(sh)?;
+            let start = usize::try_from(hdr.0.sh_offset).ok()?;
+            let end = usize::try_from(hdr.0.sh_size)
+                .ok()
+                .and_then(|sh_size| start.checked_add(sh_size))?;
+
+            elf.get(start..end)
+        })
+    }
+}
diff --git a/drivers/gpu/nova-core/firmware/gsp.rs b/drivers/gpu/nova-core/firmware/gsp.rs
index 86ed4d650d05..4d84bd049d9c 100644
--- a/drivers/gpu/nova-core/firmware/gsp.rs
+++ b/drivers/gpu/nova-core/firmware/gsp.rs
@@ -18,7 +18,10 @@
 
 use crate::{
     dma::DmaObject,
-    firmware::riscv::RiscvFirmware,
+    firmware::{
+        elf,
+        riscv::RiscvFirmware, //
+    },
     gpu::{
         Architecture,
         Chipset, //
@@ -27,95 +30,6 @@
     num::FromSafeCast,
 };
 
-/// Ad-hoc and temporary module to extract sections from ELF images.
-///
-/// Some firmware images are currently packaged as ELF files, where sections names are used as keys
-/// to specific and related bits of data. Future firmware versions are scheduled to move away from
-/// that scheme before nova-core becomes stable, which means this module will eventually be
-/// removed.
-mod elf {
-    use core::mem::size_of;
-
-    use kernel::bindings;
-    use kernel::str::CStr;
-    use kernel::transmute::FromBytes;
-
-    /// Newtype to provide a [`FromBytes`] implementation.
-    #[repr(transparent)]
-    struct Elf64Hdr(bindings::elf64_hdr);
-    // SAFETY: all bit patterns are valid for this type, and it doesn't use interior mutability.
-    unsafe impl FromBytes for Elf64Hdr {}
-
-    #[repr(transparent)]
-    struct Elf64SHdr(bindings::elf64_shdr);
-    // SAFETY: all bit patterns are valid for this type, and it doesn't use interior mutability.
-    unsafe impl FromBytes for Elf64SHdr {}
-
-    /// Tries to extract section with name `name` from the ELF64 image `elf`, and returns it.
-    pub(super) fn elf64_section<'a, 'b>(elf: &'a [u8], name: &'b str) -> Option<&'a [u8]> {
-        let hdr = &elf
-            .get(0..size_of::<bindings::elf64_hdr>())
-            .and_then(Elf64Hdr::from_bytes)?
-            .0;
-
-        // Get all the section headers.
-        let mut shdr = {
-            let shdr_num = usize::from(hdr.e_shnum);
-            let shdr_start = usize::try_from(hdr.e_shoff).ok()?;
-            let shdr_end = shdr_num
-                .checked_mul(size_of::<Elf64SHdr>())
-                .and_then(|v| v.checked_add(shdr_start))?;
-
-            elf.get(shdr_start..shdr_end)
-                .map(|slice| slice.chunks_exact(size_of::<Elf64SHdr>()))?
-        };
-
-        // Get the strings table.
-        let strhdr = shdr
-            .clone()
-            .nth(usize::from(hdr.e_shstrndx))
-            .and_then(Elf64SHdr::from_bytes)?;
-
-        // Find the section which name matches `name` and return it.
-        shdr.find(|&sh| {
-            let Some(hdr) = Elf64SHdr::from_bytes(sh) else {
-                return false;
-            };
-
-            let Some(name_idx) = strhdr
-                .0
-                .sh_offset
-                .checked_add(u64::from(hdr.0.sh_name))
-                .and_then(|idx| usize::try_from(idx).ok())
-            else {
-                return false;
-            };
-
-            // Get the start of the name.
-            elf.get(name_idx..)
-                // Stop at the first `0`.
-                .and_then(|nstr| nstr.get(0..=nstr.iter().position(|b| *b == 0)?))
-                // Convert into CStr. This should never fail because of the line above.
-                .and_then(|nstr| CStr::from_bytes_with_nul(nstr).ok())
-                // Convert into str.
-                .and_then(|c_str| c_str.to_str().ok())
-                // Check that the name matches.
-                .map(|str| str == name)
-                .unwrap_or(false)
-        })
-        // Return the slice containing the section.
-        .and_then(|sh| {
-            let hdr = Elf64SHdr::from_bytes(sh)?;
-            let start = usize::try_from(hdr.0.sh_offset).ok()?;
-            let end = usize::try_from(hdr.0.sh_size)
-                .ok()
-                .and_then(|sh_size| start.checked_add(sh_size))?;
-
-            elf.get(start..end)
-        })
-    }
-}
-
 /// GSP firmware with 3-level radix page tables for the GSP bootloader.
 ///
 /// The bootloader expects firmware to be mapped starting at address 0 in GSP's virtual address
-- 
2.52.0

