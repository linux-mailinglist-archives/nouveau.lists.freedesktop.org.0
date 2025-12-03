Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F1113C9DD85
	for <lists+nouveau@lfdr.de>; Wed, 03 Dec 2025 06:59:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA47110E714;
	Wed,  3 Dec 2025 05:59:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="JwLHP394";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from DM5PR21CU001.outbound.protection.outlook.com
 (mail-centralusazon11011016.outbound.protection.outlook.com [52.101.62.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F9DF10E70A
 for <nouveau@lists.freedesktop.org>; Wed,  3 Dec 2025 05:59:44 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=khzX08RVLsCuDMo/7VMkkR+7/oSU8YBv+Qq2pSbMJYTU5mzcGh1RmWwBU389XepHfOHevuo7asTip2/Mc7mSUeO1kRM+qtOGkR6jYchc7/loaQF2U48ghPl5gGYy9wZH+U5YmoHXjojlp8wjBx0CI5YOUAFZl9J1e7EzYvkFoR+CBtGlPeRf4vFVEPgPYIuugblo6MF02rOJlrHlGv/mWVxdyyjItuq5MFDQ7eM89MSkP8n8gV7WoGGwvz1kLIzJ5A0jcrofaufmAvj8VEh42Q3n1TjEQvspgat797beAgAuUfaY5I8P3THtuGWTvjroUGuRrtfjvY5YHwgru2RRHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nqM7fJV+z5h+CN1tJXJm8zDEP43tpvUcQaboY3sVk8k=;
 b=WzQuSoXWrvIWtQnCnKUPeOiMx0sIEdaHtqB4DM60rCgD9QfIokZObFkAJo41K9bt2jOB2STFDjtQ3muTsi8UypZM7qfCrFkO/u6Rzwlbe8Jp8FErPsBdsuE/Jcd2V0MQhMmDC7dc9+2+WBQ6lyNOPJ4+C6XexAoHkfvRFnInLmd3dU5USChmQUetFujYwfUvwXYmWtyASP5k/2pZIihaAIxgdjJWlbYpuS0ey2yGQ/QC9OGHtyL+60Ph6Q+fawFan+0BMPIAmEToiIbkNYcoD6vNcxkrftDBDAIJ8rda7EJfCPrPnhs9mrQr+EJCo3b/JJIRM3Rl0VXtHjSurDiW0w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nqM7fJV+z5h+CN1tJXJm8zDEP43tpvUcQaboY3sVk8k=;
 b=JwLHP3949MIL9Uf6dNTYJnCRSqshU9xDHI5toObr3NsYZFy3jytT/DGaOlsV8WuE0BC/N1hAVwY8lcQ+2r09auJPl6J/TbVA+sW/rTELVIE9dVOXtJPJKibZ3mV4+wnpT5GVrqgqEeuveNOfisYYfUghG+DbHVQDyWHa9eWJh0uQPWEJv+UVFnsFN1DlFvpttzrZkbTcM8myQkKAL6K5hU28vBRVzkpv/waIteI3DBa37GuisuVS60iJFpmMWi6gMdeOucQWSM22PX1ro9e/G6moilv6JAhLwfg80Y0KpXpi2+6ntwQI/+lXCALa+8BcS9aNGKVcW2iGurhWoHe3jg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 PH7PR12MB8180.namprd12.prod.outlook.com (2603:10b6:510:2b6::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9388.9; Wed, 3 Dec 2025 05:59:42 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%7]) with mapi id 15.20.9366.012; Wed, 3 Dec 2025
 05:59:41 +0000
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
Subject: [PATCH 11/31] gpu: nova-core: add support for 32-bit firmware images
Date: Tue,  2 Dec 2025 21:59:03 -0800
Message-ID: <20251203055923.1247681-12-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251203055923.1247681-1-jhubbard@nvidia.com>
References: <20251203055923.1247681-1-jhubbard@nvidia.com>
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR02CA0068.namprd02.prod.outlook.com
 (2603:10b6:a03:54::45) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|PH7PR12MB8180:EE_
X-MS-Office365-Filtering-Correlation-Id: 566ec244-b296-4935-0426-08de323126a7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?nVIkCz2EL/l1zUBHRPN6Q45SSRyE8c/tc+iwv7NpsswUCTz7EZ5EckueshXo?=
 =?us-ascii?Q?nrcnfBmuPmbwSyeWyFfeR+OSgIYWyNpv1XDqigVJxYCPdw8vsJsiwv90uxnP?=
 =?us-ascii?Q?TIVSNV2KHydxcbazCm0+gNCcxmK+yKLnQWq7ondBd4J16Qt1ayVI0XX62OWl?=
 =?us-ascii?Q?WA7GkJgPWFL13uGepquhyqoaAqJG5+aBx+Fc7Gs2vjxeLlitSFijZQ7SVhNU?=
 =?us-ascii?Q?0dvcd/MboQHRAjTRNtXL60XnC40Sr6ST7vD+6qLFMGT9ea6m6VnZilkBe8o+?=
 =?us-ascii?Q?h/LvJ5Klfnwvza+FXKqYozkOc3+qQ44eox8VGX8SSzyf7B9AccFNrzoNEBft?=
 =?us-ascii?Q?2Paw2fWSD57BcGa9yyNrWCUxI/Se9uRfLFJjZQKem64WA4WwWH0w/ko+DWQ3?=
 =?us-ascii?Q?D8oIJwsn7qSKQuJ6wEdiq0mon1eQj0uYqNT79KGqrgdXXRTYZVLL1Eu4T0GP?=
 =?us-ascii?Q?M6h28JVZ13VxAz6Hg4E4KWtGVVd6pbm325xNdKclk6L+8kwcIPiDNuHwEsUE?=
 =?us-ascii?Q?XXSYNCRjtXYmAlvPdcJKB88dknYSqbyZO+SNRzS2ihXdNHV8enEtrV4Nm2RV?=
 =?us-ascii?Q?kxjHmd277/SyUnnM698+8lmogWqb49nfrDg0fyj2gQUtaAPWkgQqpRBcL4U/?=
 =?us-ascii?Q?VKEqZzcHAsz9NwXtubcfB8/yb6P0hhYl7ezuCJi5JLojtPaJG23pJU6gx01e?=
 =?us-ascii?Q?jqyq8llGASUOU3RiwdetNZcfXNmSuRGI4nzLap/tmXCvRRUvpqs1eV3inbN3?=
 =?us-ascii?Q?59RbZ7IK/KxJDHDcfIloaWALsHiOQC6I8gwLgbTPkmoR3cf5BP3WFBZ0DwHn?=
 =?us-ascii?Q?CGrEiH0nbdkAX4QoMCmXdIIXPPdO8oTt1Jgc4AppF1m+Fd8DMOcWe6XLwIpK?=
 =?us-ascii?Q?nnTSejQVDge4vEq2Bc0fgT+bN0WF8aueOHPWvgqYv7sLI4aBpAJKqw/73r1q?=
 =?us-ascii?Q?d9CUDP8lJTMsScDFg1rbo8nA+EhcqWWyU5VkfCkTlg2aQUwtEm/H0tnqwcLW?=
 =?us-ascii?Q?hLzwDpCr2AyG9YB9gacCg0dTgbM28Q8D0XUbiEZqUsyh5Qi4t1Sggu/9zGpT?=
 =?us-ascii?Q?TNmIjI3lXkpMJKutbqdzSXbhMPQB7LpPo4sLq2jXAjTEL5fJ299LOwaev13+?=
 =?us-ascii?Q?hKCPfNFHZg0cUVL/Zvt5f1UWJRp3Z4SYBo5ZFLNIVUhwYx9agYZQvgpgl05J?=
 =?us-ascii?Q?85Je1n9RQ7Xz6hWY167xSAPjACyJbciO0z4sNNAOPmJ3wXDlSsKmB+AXIIvS?=
 =?us-ascii?Q?sgPi8DIyviyidIM4k0bOV3eo22qKvgE41wZFHRXPZRtgnMD4yvaX9T83tN9e?=
 =?us-ascii?Q?o+H3T91/Bil6g+1LAtXGf3OqaJHSxm+MU0jnAI6IDoS1FTDLO0diwOYO/vox?=
 =?us-ascii?Q?zRDCSWLIHC2MJHE19/XlmYVoXgV8MFQjouKfj0+QB+i8Cnqe7zV7z4Ysz9pR?=
 =?us-ascii?Q?XBfv9wuthqP9B5oc16W/nuZPTSxIXEec?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM3PR12MB9416.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?RJBX7xPE3SW5R7eWZJo/+dDEHim6TglngiCLlGDC4DWiV6Cdna5oke9fDcfI?=
 =?us-ascii?Q?lpgzl8x20FmY8H2aY6O8w4oxPnjEbq/AiYXx31CsixfD8z9IO2Q61DmAIDHn?=
 =?us-ascii?Q?fK/zvhQ833GKalHgoXUQidm/W4lK9+cRFdzzxpBeXkr99+JtYeOIKjairS1R?=
 =?us-ascii?Q?n5qvnBrfCJDIDBkB54gUHyAOMe4D53f5dR+OJO7CD73ve7JSueC/6ScUKj58?=
 =?us-ascii?Q?4kwZE9bHIEAFUSdeu3UGkjvkW+wiFZpbHGXM71vyei+0LlyF744dvDwAkxeU?=
 =?us-ascii?Q?mr4CMr9naR+rkS3fZknvmcIeKJuHamL+iDtwU1nkWvVMWTMKWG2nbC4HZryV?=
 =?us-ascii?Q?tqlqh+RSp5urUXscrrDpf87DvWPAmmEMI4pMk7msV6dlrZlu4/QV6b72KQ1U?=
 =?us-ascii?Q?BwEnm7aG7Ip5LzB6uKS4KZXW1dMRXYgtB0DbAwOa+8kToExgODx5+OU8brBh?=
 =?us-ascii?Q?vIykxwKBXOHUtFY1o7wdcrE6RPReXcXaYMIf8ZQFd9svKsH5P4yhg3YOxTsK?=
 =?us-ascii?Q?FpKlylgnIycbiBpq8cDISn/+zI+l1T3oiuwqyExLYmYbIrAVigBYpcw6aVDv?=
 =?us-ascii?Q?PNeF9JmYocyOb1Zku0uutLnApJ8BELSvk0Ll56Xj8/vBYzYmF0X0hBzgtT+f?=
 =?us-ascii?Q?FUKeXVtQv9Dsvxz4OM66/F26WQ38c9fGxAoUjg93vCPFOj0KajnizIvK1mXw?=
 =?us-ascii?Q?H1T3x5mKHmS8u2752MqZudoyb3FY6wmJ/frGkiiyvP8aZucfpDs4lxFKxCvW?=
 =?us-ascii?Q?dzqMJCE+g5gBJ6fqvrooHc2msnReEe5BwLvQC+Rq9Ys2yyoGOa1eN+QnB28Q?=
 =?us-ascii?Q?mt/fLEH/KAEyktH0DkkC0v9LdbXuwCxOYXP/q3jHG5SaNt4GaTRc4wCGiPiD?=
 =?us-ascii?Q?vyNphwgIMLGDApKpSlQ3J4OT2x4SywhkMrWZ2fPiPq5qt3O5jJmgEhDr5ZAD?=
 =?us-ascii?Q?nwe8tAla5in0CTrN5KYGoRhXDyY7X0uLgAV8z1pw8Ks9d1VLOAo9KBW94enu?=
 =?us-ascii?Q?+G5u0sjuNiMUrdCm7qKnUA8YJM27zF98BxunxjvwqAK56VKdHbEORCW9TLwb?=
 =?us-ascii?Q?APXROKZEs1E/1sYgPAXia/COhlcRUnkh5dztq+K/xYEMBsphGWwxYnc6aJpb?=
 =?us-ascii?Q?z5Tuy7A2GWDRkR0bdGdRdFhLQgxuBxSjdNK/WUO8LjRoIX0akJJMf23Cyz17?=
 =?us-ascii?Q?IpUpZ6+giZSjJbZ63jOJFTWEJ/LA5Yz67QX4YlgLsLaMQptXaZu3d4QuB/O8?=
 =?us-ascii?Q?jMoVz0wIpbjQqHr6ztpmzr45J7H6T2hsTtq64YQGgn4qKVNrb86I9YY8HPpE?=
 =?us-ascii?Q?dFA+6nAsZEYZdywxoGr9P/LMF/kYk9lyaapD8aGsUPWalslR8wOWp7oy+5KV?=
 =?us-ascii?Q?Qbu7RXQTvigOG7IpoFVFDFA7siYoy2b/ZPT/UFAwwo3NgumpdUuO5f59q9nN?=
 =?us-ascii?Q?pmnDUf86/5mYM8JLHw84p4k6Klw/ylT5B9vGUa45qC3haNfIQNE6lOANwBby?=
 =?us-ascii?Q?AE+k3mMmed6fjZEbFmQWTNTc/jscmE2LyUnjC8n1Sd/U6hVIZYksne4m0ts+?=
 =?us-ascii?Q?Qp6Nx7UimzdzcR73QhElqutLJMAiRn5y+zKrnmqd?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 566ec244-b296-4935-0426-08de323126a7
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Dec 2025 05:59:41.8373 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /DFUmaRWVOTfhHQMVnptg1kTim5frog3CqxFjCh8KJgIRCbwBivjXvjKEy5prWOB+4nF1ffpiiHQbf8YpXUhUA==
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

Add Elf32Hdr and Elf32SHdr newtypes, implement the ElfHeader and
ElfSectionHeader traits for them, and add elf32_section().

This mirrors the existing ELF64 support, using the same generic
infrastructure.

Signed-off-by: John Hubbard <jhubbard@nvidia.com>
---
 drivers/gpu/nova-core/firmware.rs | 46 +++++++++++++++++++++++++++++++
 1 file changed, 46 insertions(+)

diff --git a/drivers/gpu/nova-core/firmware.rs b/drivers/gpu/nova-core/firmware.rs
index 1cb5897778f8..c355e0d7e407 100644
--- a/drivers/gpu/nova-core/firmware.rs
+++ b/drivers/gpu/nova-core/firmware.rs
@@ -310,6 +310,46 @@ fn size(&self) -> u64 {
         }
     }
 
+    /// Newtype to provide [`FromBytes`] and [`ElfHeader`] implementations for ELF32.
+    #[repr(transparent)]
+    struct Elf32Hdr(bindings::elf32_hdr);
+    // SAFETY: all bit patterns are valid for this type, and it doesn't use interior mutability.
+    unsafe impl FromBytes for Elf32Hdr {}
+
+    impl ElfHeader for Elf32Hdr {
+        fn shnum(&self) -> u16 {
+            self.0.e_shnum
+        }
+
+        fn shoff(&self) -> u64 {
+            u64::from(self.0.e_shoff)
+        }
+
+        fn shstrndx(&self) -> u16 {
+            self.0.e_shstrndx
+        }
+    }
+
+    /// Newtype to provide [`FromBytes`] and [`ElfSectionHeader`] implementations for ELF32.
+    #[repr(transparent)]
+    struct Elf32SHdr(bindings::elf32_shdr);
+    // SAFETY: all bit patterns are valid for this type, and it doesn't use interior mutability.
+    unsafe impl FromBytes for Elf32SHdr {}
+
+    impl ElfSectionHeader for Elf32SHdr {
+        fn name(&self) -> u32 {
+            self.0.sh_name
+        }
+
+        fn offset(&self) -> u64 {
+            u64::from(self.0.sh_offset)
+        }
+
+        fn size(&self) -> u64 {
+            u64::from(self.0.sh_size)
+        }
+    }
+
     /// Check if the section name at `strtab_offset + name_offset` equals `target`.
     fn section_name_eq(elf: &[u8], strtab_offset: u64, name_offset: u32, target: &str) -> bool {
         strtab_offset
@@ -371,4 +411,10 @@ fn elf_section_generic<'a, H, S>(elf: &'a [u8], name: &str) -> Option<&'a [u8]>
     pub(super) fn elf64_section<'a>(elf: &'a [u8], name: &str) -> Option<&'a [u8]> {
         elf_section_generic::<Elf64Hdr, Elf64SHdr>(elf, name)
     }
+
+    /// Extract section with name `name` from the ELF32 image `elf`.
+    #[expect(dead_code)]
+    pub(super) fn elf32_section<'a>(elf: &'a [u8], name: &str) -> Option<&'a [u8]> {
+        elf_section_generic::<Elf32Hdr, Elf32SHdr>(elf, name)
+    }
 }
-- 
2.52.0

