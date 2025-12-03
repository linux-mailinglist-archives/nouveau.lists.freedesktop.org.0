Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E44FBC9DDA3
	for <lists+nouveau@lfdr.de>; Wed, 03 Dec 2025 07:00:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 90B5C10E71D;
	Wed,  3 Dec 2025 05:59:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="hv1WDxUr";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from CY3PR05CU001.outbound.protection.outlook.com
 (mail-westcentralusazon11013015.outbound.protection.outlook.com
 [40.93.201.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EEB9710E710
 for <nouveau@lists.freedesktop.org>; Wed,  3 Dec 2025 05:59:57 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uu4xgkh9MCwvDKubl5lwZX2XEGYuWuS7E+3Kdf2LGZTCOj6DQCXM+KsDMo1M9XUYBQDJQGeUoM0fd9XDm8zD6/9qn6U0TZcHtvvFxvh7TSQfxL/l6rHS8rjeQQpT9MmxCq4wlFwAMb2hj4Yc6/SNrYmiFN3eVJQq63zylkU09aQnHEM54/lCzV4yukUFD6kBYtSTb2f7l2hjjvtLZ1pjW640mpZTCJobkLmLaOWfZZFBSAIns57ESZ1yZ0Tm2+IBBSDFZLUSpd2/CgtimC8SYs7m6VLOvy4cgCvAq/3HEipfBZR68+p906bWPjZEJhnLSxsis/VYoKyWtBkcaGDjPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JOgxKzz7h2BSaHOxPPBTNFGt3i3DWfd5mm7Fqadh0jM=;
 b=Iz/Kq3v/GRVkSNK+8cYKQ3q5ovEVdcf8WfuK+gKjbNBJLz7ELEIC1L0EGMVRMp/aXXm3ajd2zpfrpg4g/k9b7c9RKw/74xsVu3b3mRCegNw1L961WusxGozcXX+g1kxgSsNBQbVfvwzVuAsaunlLZ+78Fe0wg8Ib9M8fXeS9tRNVTC8EqOD/Pkf/aUjVpxNi5xW2LL7ZwWGKh15wZev/TbI96SZSDAji2GR004eyTp1Z1d5Z9v0x/kofcpC90KcUmXmpaUmZQVBjw7pmZTQa28LMexB37/4riqFYOeo/N0vScqYow419YiUVZIef0NXGqy7Rw87PoRHEOxjbJ1JZGg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JOgxKzz7h2BSaHOxPPBTNFGt3i3DWfd5mm7Fqadh0jM=;
 b=hv1WDxUr8CFeyUr5NG+g+qw7g8eGciJ4AUv+EoPbXJhbeHjqeY+gZ3gdbCjl9n+uj4PQiWXxCu87ZYDFvyq5ElS1ihpXg3G5IXtVcLegKmhjotJmmzaMjsRgtUb3sLaFed1nHhpnjRd/XC/sIbsN9JR3E6IDmOFm8fNGROf6KisaOsGHimClEX87wGhDY8gd37cVd0Zm132Z+0jnltmox6zIUjhho5q6RQS0GflKftEznzh3KU966DdREGeUqY5NoHn1gcZfgNe5AjbMExXjZBDmVBW8dcrqAxfOZSCeSmXC7rfcq+P1huDDhhFevUAriW9PsZWBQ1uuFLQSQkltYw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 PH7PR12MB8013.namprd12.prod.outlook.com (2603:10b6:510:27c::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.15; Wed, 3 Dec
 2025 05:59:54 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%7]) with mapi id 15.20.9366.012; Wed, 3 Dec 2025
 05:59:53 +0000
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
Subject: [PATCH 20/31] gpu: nova-core: Hopper/Blackwell: add FSP message
 structures
Date: Tue,  2 Dec 2025 21:59:12 -0800
Message-ID: <20251203055923.1247681-21-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251203055923.1247681-1-jhubbard@nvidia.com>
References: <20251203055923.1247681-1-jhubbard@nvidia.com>
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR05CA0022.namprd05.prod.outlook.com
 (2603:10b6:a03:33b::27) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|PH7PR12MB8013:EE_
X-MS-Office365-Filtering-Correlation-Id: e887b062-a055-47ed-e358-08de32312dbe
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|7416014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?g2OGdQPvuDLWTngWpCmV2KLoN4G2VxX4s5QiawnvYJNwjVwdQCnNBjLLgczy?=
 =?us-ascii?Q?TCkX8+0z3Iq6/No7iQF55bWzsP3YxvmbA5VIUTxmm7yM3+7BEepICBmhi22b?=
 =?us-ascii?Q?8Z9MzZohiJCbIeYtDWO/i6EuC74m2KLQN+GUnlGU01LdHEZ+CPeIqFwFBvw4?=
 =?us-ascii?Q?0ae+aNTkFUPaz1EHcbU5xFEq9OtTV2j6R7sk38T74YY/hjmrF0fW+2m4qqpr?=
 =?us-ascii?Q?qwQujSPnOVb7FV2oWzewLwVtHlo6ZHYhy6xYSHDn+wm2K21cU05bMUBSTUSB?=
 =?us-ascii?Q?K6ZlkhleKLZaM2h2fzgcQ7aKyt0hK5DacCJMJO64XLrYnFgpfrAH5b7ncRo5?=
 =?us-ascii?Q?Psrr0BDf36yyPd0WBi5Un87PxZwahln9upcte2LRd/1lNxmS/NlBces9CnID?=
 =?us-ascii?Q?b8P0w+IHnKruve+LY2Fj/bliC4uTTfXotWMmDgbIeICTZxwv4GomzbeK1Znl?=
 =?us-ascii?Q?GCJCi6hDzmOTDgVJitDVkRFUkxCy670gY8ZZrEEGaqYoNVMbVfv7zKuDxV57?=
 =?us-ascii?Q?f6wFQ+bPa0abt4UbPQq19Tguy3UZ+o/T0DGsNZZngDhCXnrlR8nhZk+6n50w?=
 =?us-ascii?Q?vpTg8rYkEAYeUxaCw6vncVN9etnawXLSIl3g0bE0o8aTA8H+XJ0vA1FYRPU2?=
 =?us-ascii?Q?oet/Ltmfe9KJflVpbEPPxW8jN73yXqDcLilMMN7r0B4KD4cHCsIzi7iq/vDa?=
 =?us-ascii?Q?edsyEIwTTFYFal9jqIIElA+gRHE6mAjBTAFbw0Z7uBOTG9hV0v1dsW12lGJU?=
 =?us-ascii?Q?7Q08slF9F/VEFWRbWddc99gsst0Bsb8zZe898jY8ZPGMwta/1xojbWuvpGjk?=
 =?us-ascii?Q?PnW8difJstrW7UoQEoEYUwndMZPpealnhhMj2MfBjfSGZkVxxMWi7+HGz6VI?=
 =?us-ascii?Q?Q2GZBwfNbTWqFvMe7ohNtEct/HAH1n1cLDw4Lhwc1UaYPLNKvoh/Ly0j50FT?=
 =?us-ascii?Q?0QZ9eKE6sIX0fVuMchLSsHjWadsOxxHFpPX7hGMIwjLdsAF8HeAlzpVXm6Bv?=
 =?us-ascii?Q?gsKtRWKG58S+PS9fto4Sys1EsEguU0cHwtOuoMrb5fj3f226EckfaJnque3v?=
 =?us-ascii?Q?lYCk386UsHdr7/mCsLhXmiV+Wj6egG1UtZnmOU1M8D+Put3hGLUHknNu8/aj?=
 =?us-ascii?Q?PmCzUnBwcoWR/2jS+kqltAGDFJ2fIk2ymSpqIAbYDbZNSyyJUAeGVcXzFspK?=
 =?us-ascii?Q?cjmPSWdElhNAle7G+BdPi4Fbv7Q3hjqocaGmgd71Ip6n+95SQKGuFX9NueXC?=
 =?us-ascii?Q?eBVJ9gjkaD8xgRipj68AsQo+0AAck/CqQm/9ekJov1zcUWMwAJNGfMb3BHHu?=
 =?us-ascii?Q?/60whFRciSa3oSFYn45a7CGBf3OihH3HRcMqgCHTR0OvU/O1bEBK9g9h5LBD?=
 =?us-ascii?Q?G6YFvr1Uq8+DBb9StUfndwGSbKIc4hoheNrrQpbrdIkICFmfaJEHw4s79vSN?=
 =?us-ascii?Q?DFqQNy2QeGvq3r/M1vBEvIg6z4HLya2b?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM3PR12MB9416.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(7416014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?c5jrI0yHP6WFCKMwys9TO1QZCXkA2YwzJafeX7tez8Up5UiAHpewPy+4HN5m?=
 =?us-ascii?Q?73cftVuojCFIqj271TRAZEmsCJznfxbkwGjg2Eqjknvg/ntibrRvVOh9FBGc?=
 =?us-ascii?Q?Ue6y9iziACyUmd4HXmTdB4X+P5+hTzC75P/5HkjPmP2NGgnEEZmpRJeU1BHq?=
 =?us-ascii?Q?ZSTOC6gxtu774ir+ky9z/LxVv9cvsi7tlYNp5kYcjsSRpE3IUsSxLenHABdr?=
 =?us-ascii?Q?Hui2blZQREY4IkuXhbU5WIjsNkzh9cxmd0Nopor3POWrDol0aww/3/XV9ZZz?=
 =?us-ascii?Q?CefvPOXm0YdCCj2xdVH6c/kMEopTGiWCUhXtGY9YI1I0i/acrdScze2NIgpZ?=
 =?us-ascii?Q?/jT8RRBFFrx19hrFeeqxMcFsQW0PQ0v30SHsirDi2eDGfIoKUXp+fDKA+sVV?=
 =?us-ascii?Q?9f1Vvs9hC3S/rjfELAMi7Z5InBvu0s6rRY+MxLwTvNlXK5AGumbKb3xB5av0?=
 =?us-ascii?Q?OZrcey9fKNpw1VvSHnDMUeCva8uieF29p9kKSXtjxe4xtJbw+GkJbRtKLwFM?=
 =?us-ascii?Q?Msm4lzBEPfj8Gn7fbRqjPSh1cOptRo/0PuU/q2KAJoOxtGXFvPdFFsX8yz0G?=
 =?us-ascii?Q?BrAuudCdV6HLJGzn0RoBvIRGCHHhhZOeZFUU3UIM6+0x0HAK2uscmWMfqdXI?=
 =?us-ascii?Q?8tva+C5/5Gvs9QjIFfBJ+PHg3SIYxxqo+lDdvtjSwWBSkTelwMGPEzUZLaSU?=
 =?us-ascii?Q?HuXQ1MzCRNkxiT6pxP4SiUnCf1SCd2HTm38vwYJyLCiILGYBJDWy02VtKyD3?=
 =?us-ascii?Q?QGeaFr0uceEISf4mgTvLAbNiT+Y15oIQzvUz2Un7Yly+yzZYkAru49YqrJwv?=
 =?us-ascii?Q?9Nmb8w/3sKsdCgHUv+oLcQHONBG8R2KTo25BCu2wn/Lhyq07eEzg7llUMjQW?=
 =?us-ascii?Q?aS3wEgr2Xr4nBzaUQEqLibL+bDqjf44MQerf2nWEELD46BpnYd6XBa4cL4da?=
 =?us-ascii?Q?NErtu5KZIqHVDK+3gDN84Yrp5W3e8TuLguJFreZiGcwdcHtoDgz16/NOXhDW?=
 =?us-ascii?Q?IZ5w22tAq0kp2Lzn0gOJhnWvmgnfTQMx4/71SZYiF1g35LignRJby70K3e/g?=
 =?us-ascii?Q?nqVrcJXIzgVP6lA3KRKjjkIRAtvyEQsal7rDNmjsxbkDeL3KyaMCHoGZ3MeJ?=
 =?us-ascii?Q?4MvE/OftWtUzmFC5vZ7qUWLdtnDE50/myKVR8Lnh0/9scZuH0iswlwc1hE7H?=
 =?us-ascii?Q?kqbJIoUIW/bHQN3+yFc/fNsfboEbSuQqbuSavGxZpg18HBvCZVIxdV21jJSL?=
 =?us-ascii?Q?cw6mLK+FkvumuGMAIwZ5CLiZsIAPb5vQcs70XpLbyZKZcZJPertV8nCa437+?=
 =?us-ascii?Q?354VbN+qYtaFo2TNHIAG+a9go5XFPl/pYxhvFWRrjRG0BWYkR+tsv4nNDILT?=
 =?us-ascii?Q?0PHb1bpkZHYu7jDs294ZzC6vtDjhvTCkf8jhwP6CLex3/zNf/7MDGkXGfzDK?=
 =?us-ascii?Q?qbBfYx/6cdKypCsu4NFfTX6bfTQ3H3vyrgL90iB8Ke+7QOmI+gWvlyz/i/48?=
 =?us-ascii?Q?T3Y8jm/gtxbh0BaICi8nTMKNxFVvwXDjXYCe5yDyOvrn1fdxRzoC7aK9AeOI?=
 =?us-ascii?Q?l/R0YAYmtHkNs03czk/N+kRsCkr1QOwodGNN89t0?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e887b062-a055-47ed-e358-08de32312dbe
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Dec 2025 05:59:53.7984 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iBEJLfGdDWufJecvVQnAupRsc9CpV2/0s6rdtwD+jMKL/7H/9k6grpR6qnBzSflnDaWA3p1+KX2oshgevZ9Nkw==
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

Add the data structures for FSP Chain of Trust communication. These
include the FMC signature container (hash, public key, signature) and
the NVDM payload structures for sending COT messages and receiving
responses.

Signed-off-by: John Hubbard <jhubbard@nvidia.com>
---
 drivers/gpu/nova-core/fsp.rs | 76 ++++++++++++++++++++++++++++++++++++
 1 file changed, 76 insertions(+)

diff --git a/drivers/gpu/nova-core/fsp.rs b/drivers/gpu/nova-core/fsp.rs
index 12529b139861..389c43bfd538 100644
--- a/drivers/gpu/nova-core/fsp.rs
+++ b/drivers/gpu/nova-core/fsp.rs
@@ -124,6 +124,82 @@ unsafe impl AsBytes for GspFmcBootParams {}
 // SAFETY: All bit patterns are valid for the primitive fields.
 unsafe impl FromBytes for GspFmcBootParams {}
 
+/// Size constraints for FSP security signatures.
+const FSP_HASH_SIZE: usize = 48; // SHA-384 hash (12 x u32)
+const FSP_PKEY_SIZE: usize = 97; // Public key size for GB202 (not 384!)
+const FSP_SIG_SIZE: usize = 96; // Signature size for GB202 (not 384!)
+
+/// Structure to hold FMC signatures.
+#[derive(Debug, Clone, Copy)]
+pub(crate) struct FmcSignatures {
+    pub hash384: [u32; 12],    // SHA-384 hash (48 bytes)
+    pub public_key: [u32; 96], // RSA public key (384 bytes)
+    pub signature: [u32; 96],  // RSA signature (384 bytes)
+}
+
+impl Default for FmcSignatures {
+    fn default() -> Self {
+        Self {
+            hash384: [0u32; 12],
+            public_key: [0u32; 96],
+            signature: [0u32; 96],
+        }
+    }
+}
+
+/// FSP Command Response payload structure.
+/// NVDM_PAYLOAD_COMMAND_RESPONSE structure.
+#[repr(C, packed)]
+#[derive(Clone, Copy)]
+struct NvdmPayloadCommandResponse {
+    task_id: u32,
+    command_nvdm_type: u32,
+    error_code: u32,
+}
+
+/// NVDM (NVIDIA Device Management) COT (Chain of Trust) payload structure.
+/// This is the main message payload sent to FSP for Chain of Trust.
+#[repr(C, packed)]
+#[derive(Clone, Copy)]
+struct NvdmPayloadCot {
+    version: u16,               // offset 0x0, size 2
+    size: u16,                  // offset 0x2, size 2
+    gsp_fmc_sysmem_offset: u64, // offset 0x4, size 8
+    frts_sysmem_offset: u64,    // offset 0xC, size 8
+    frts_sysmem_size: u32,      // offset 0x14, size 4
+    frts_vidmem_offset: u64,    // offset 0x18, size 8
+    frts_vidmem_size: u32,      // offset 0x20, size 4
+    // Authentication related fields
+    hash384: [u32; 12],               // offset 0x24, size 48 (0x30)
+    public_key: [u32; 96],            // offset 0x54, size 384 (0x180)
+    signature: [u32; 96],             // offset 0x1D4, size 384 (0x180)
+    gsp_boot_args_sysmem_offset: u64, // offset 0x354, size 8
+}
+
+/// Complete FSP message structure with MCTP and NVDM headers.
+#[repr(C, packed)]
+#[derive(Clone, Copy)]
+struct FspMessage {
+    mctp_header: u32,
+    nvdm_header: u32,
+    cot: NvdmPayloadCot,
+}
+
+// SAFETY: FspMessage is a packed C struct with only integral fields.
+unsafe impl AsBytes for FspMessage {}
+
+/// Complete FSP response structure with MCTP and NVDM headers.
+#[repr(C, packed)]
+#[derive(Clone, Copy)]
+struct FspResponse {
+    mctp_header: u32,
+    nvdm_header: u32,
+    response: NvdmPayloadCommandResponse,
+}
+
+// SAFETY: FspResponse is a packed C struct with only integral fields.
+unsafe impl FromBytes for FspResponse {}
+
 /// FSP interface for Hopper/Blackwell GPUs.
 pub(crate) struct Fsp;
 
-- 
2.52.0

