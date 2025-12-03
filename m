Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E500C9DD7F
	for <lists+nouveau@lfdr.de>; Wed, 03 Dec 2025 06:59:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C01C610E711;
	Wed,  3 Dec 2025 05:59:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="Zbhe1oXZ";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from DM5PR21CU001.outbound.protection.outlook.com
 (mail-centralusazon11011049.outbound.protection.outlook.com [52.101.62.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3FBC210E70A
 for <nouveau@lists.freedesktop.org>; Wed,  3 Dec 2025 05:59:41 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GdaRyUOpJfOTXDqVdAawOUsjAUb5WN8xXZz5rve5wZuQsFSaCvI1id5XVLgZRLT9rDCoOUYjyDAD5S5CIwm3Bp5MV/hcUECA3dw+nO9OUqHzBmAkXIm8BxQwWGAycJioiYg2nVnAkBg18wA08NWtSHfk/Sc/doik4pQzxpSNQa+8dECa3MOwvaLTcvEc3P1DzvWjNBKP/dOFUOz2o/6cSridTjaZmniAOzP2Y9kDLU4tEbqtodWGdkCwIbMpXxsE8eEEBpGUbjhQ1/d6OzhK+MKpWqaPIkVMl4w5GV0VgGF8NJW7YtSjLNqrhsBuXXr3+GsgLVEGuxDXbrdTzLIpmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LtFUp3gQ121B/PlejVElvyBcofbTFvFucqD6XSCjBMI=;
 b=WFEru+xUaoSmu4/ArW2VRJAtDF0JtjqhicvcRlbiai4Fh/MQMccVrLYzCJyoyZ1niZPqej8P3DN27N+Fbbj6J1n5pbBG34XgwxMHsiPUDz+ODqL5r9qd89BJrmctGKDBCIXCqo2Ch4y2sfwUmj9laS+pfwAwPybWdO12jZZcCyu0KccHxWXX458uVdjJ2FR5vu48ljaMHdf7MYf52HefXlbM2OyamXuhBGQQpqSTcunPnKNY/3wXdGHV1kzsTqGUpPLNYuO8xpoA59dryuwecaNZZFT5ijFoNrx4XrMbNMT6bcIdpw9I/qeiSKMbtZmmO75vRbMagYKdDWPeN8Ekjg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LtFUp3gQ121B/PlejVElvyBcofbTFvFucqD6XSCjBMI=;
 b=Zbhe1oXZ9lQyuDbM/mHNznZDsy/nwoZzeS85Gv171mQz9DVo/ZmRZGE98M+JEiwLzEOw4/+/PzL7fdhEXB3BDtnDynrVyxnLg8jt1M1X4mwvLATQ31lYKMzNbE1GV+q8TqnWSVMdJN5uyVv2L3H+UBP07fXUE5CG7xCyWCGvGcwjHfmGKrSZW8h2gWHGCoEviwwUZmyyB2w/l6xV1dug4Qjj9alqAjyg1DrXaaT4u64pnsl5Cc3v2HV7frmn2Tjqo7Ceit8JlFbrMP+bMlXUPC+/N09u69ziCcj0dOkW9sI359YpHawwZDTu9pDrbufbiCwugDt6s3C1fabOaGG8wA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 PH7PR12MB8180.namprd12.prod.outlook.com (2603:10b6:510:2b6::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9388.9; Wed, 3 Dec 2025 05:59:39 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%7]) with mapi id 15.20.9366.012; Wed, 3 Dec 2025
 05:59:39 +0000
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
Subject: [PATCH 09/31] gpu: nova-core: factor out a section_name_eq() function
Date: Tue,  2 Dec 2025 21:59:01 -0800
Message-ID: <20251203055923.1247681-10-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251203055923.1247681-1-jhubbard@nvidia.com>
References: <20251203055923.1247681-1-jhubbard@nvidia.com>
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0218.namprd03.prod.outlook.com
 (2603:10b6:a03:39f::13) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|PH7PR12MB8180:EE_
X-MS-Office365-Filtering-Correlation-Id: f717bb71-de58-4782-cd7f-08de323124ef
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?0fKWCIecGq477fOk9zuFRVP6zdEwqHQBZ07KThTps8g9kyMrHdinDEMEFmjC?=
 =?us-ascii?Q?RDOP8i1MgOfATJ90SSuPzs+8JtSyvmNmj2o7kL9aeWrJFVMiwvWzeXyMLGgC?=
 =?us-ascii?Q?6kNCdp/WAHay+OJGXgb3QDjgl6MhmeU4qOmaX3Kp3AGdygH9Nj6SxHh/H83z?=
 =?us-ascii?Q?0IwRuTfQe6e7QFAXz21h2XGV6aAMHNC5GMpiScvRTYaJ4mrFMcvd6g0OtAbz?=
 =?us-ascii?Q?vDw5MKy3GAedttqsP+H6whrdHF7STWYZmhRVRa7iTy0RFv8F19WOP+FtUsPT?=
 =?us-ascii?Q?zNReRA7R8CydV7pQLvoyVfwvZLp8fECPQmStq4d4n7cfr7ZxvnHH7FjqNYaT?=
 =?us-ascii?Q?I/sTqcjphZFr5hmUwTgNR6NYkBcGHm67drL4qaXCfTRDSzUhEye8tyCd2A0C?=
 =?us-ascii?Q?Owpq4TgsqfSUKq+bKL9sQw/LSGJQzPIX0uTknJwo8G0En9RSvJF/bmdp4Lfy?=
 =?us-ascii?Q?vYtVjtsuI78R2T6GNrVtBS5lMmShA0UbJTkm4jucrDfgRT0UNQotZz41kJM5?=
 =?us-ascii?Q?o/n8B2MwlZzu6M3N/ujVdkPvI5g/LWINbLwo+Rg5QaAMs9FiEY8rIkekShDd?=
 =?us-ascii?Q?FYF4Rz/n0rb/obm9ZFveE8cXwGXplD5m7Eb6yzxmTLZQtQ/HWXv7FkZbRH92?=
 =?us-ascii?Q?4MnGwmK5wEbx/Sg0TMAfqEXLNuaSx+0rPzhqhms7h61Iv5h1N1ADVBjWL7KC?=
 =?us-ascii?Q?AxfyClK610iwHORfiveHHP3KtruMQ7hQs8pfcFxJGkG0GYGhl4dY3LZeNHxb?=
 =?us-ascii?Q?HMutDOtYHeYMHOj3xG7k+4/5+8QycTV1ZbSLDWgBv1mV3BVToeY9otVEO1g/?=
 =?us-ascii?Q?Gt/ef+a/CXppOCaizArm5CSa02lQ7iGKKqPMpQeJ9hOnzzLgsb3KSYF8bng+?=
 =?us-ascii?Q?nKOy0pqtef59qBHOriVf0MbojxTKEDLClt4fZw5JsRPUuhS9TWGbqMOnP+QR?=
 =?us-ascii?Q?860a3mrL4h51YR66NUusV2Tgd6p0JO/KmQG4jOTI/8SKtLcqdN53/Dscp3oq?=
 =?us-ascii?Q?e7VXnjuW8jyu1crTA7l4/A6N95oKJxrtl/q2DwAx1O2D12xo9TTd8i//nDgp?=
 =?us-ascii?Q?rlpeYXesT7k1bXmr5FRu9kBwlmIdqoyWJfT9LIWjhgUtyuiqbwgo8bI3Edng?=
 =?us-ascii?Q?Cbx2bWTtL7h961tTQ1ccF0u5zM9nnpRz3wpLotWbKb21amqRrc6n+bwqxw/f?=
 =?us-ascii?Q?3XvwjHlxxto8mN/1ptZsrcXbzvW9xhaCg3Qbr0Vs2w45ERAyyI+lERYr2g0f?=
 =?us-ascii?Q?2pcI5wbCe4l9oWG5CO1d6ztNpcXRB2O9FIsRPPi5D84ZZTmjO8YAR65qw7Iq?=
 =?us-ascii?Q?Ou5qEOPnLBMcUTDjIBTTNB2OrD10U/wr0QRWBI0kDt4TUcqCDKy0Gk/D5jsf?=
 =?us-ascii?Q?yGIY5E5jWZrECwu8/I0FKlFI8zsVoI5rcKVHO3Y2hK1PYGPepeot+dx6GK3w?=
 =?us-ascii?Q?HFRD9sbVpkbgvG73HZF8HWZDV79y1npt?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM3PR12MB9416.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?/tGjrAtLtqVa1g2Gy5e2U7/9ws//PBOsnNAmmDVQyMf9o9XsjC+uTaJ3Z5+h?=
 =?us-ascii?Q?URGAt1jiLOynDAsgAVfWWV2sAU/C9dH4yz91oNKq6dhCFQA1KM505Al1j238?=
 =?us-ascii?Q?C2bZ+gweHZUaGTqkVJVxCThj7p3tSbNv9OJHeGerWzXiVkV1KnbDFS2DOEOx?=
 =?us-ascii?Q?S6zyCtUUBE4wOS71zhd+lz0Vb5+QNs6ky2jrgj8Bhir1R8dHqOEtGYsUKD4k?=
 =?us-ascii?Q?X9bW7N+LWiPEp3+R1djyp1Jqx7WaGdUr6ynm9J7TnUvYB3krJp9w4D1OmfL8?=
 =?us-ascii?Q?pfGrXB2bRr6KCTR/tUv9mQYocOVQ7CFxO9zznC4WsDSS3hy2kig0x/m9cUiW?=
 =?us-ascii?Q?4cdjMFyKNXiSr+W6QLXd1st05/1yfKZnzMKnQGpMRebm4f+N12fbI4SyU9cv?=
 =?us-ascii?Q?tmcmWU4gf0gHh/34PZMGyMafYTt0QSVgmDZt0KXDaTFaumTD9p/Tw87XmWQd?=
 =?us-ascii?Q?5k/D00grt7ZidSEO/Fsy/cjh/+JqF3VPwLAMqVHNwPT2l8dyanZ2dDM9nwVy?=
 =?us-ascii?Q?oeC2MVWNFa7sm52dmZwrCuTbJP+Obeu5+d+KXJWa8a64icoh3h+bX/eowr0f?=
 =?us-ascii?Q?oc9l7oyYJ1DFYdFIu+8aCyNX+ZiyRbsO8lrluM3B2DASiyJJU9VRZEZnVAOT?=
 =?us-ascii?Q?dTw4Yx0sflrAl5rNp4k2DdgZmyYtpRMWF//H91+Ba0XCrmjwwGqdhgz8XBak?=
 =?us-ascii?Q?0nE/ney2EikiS5mw211AucRWE7Ke/SP1y2YCpKLf4ixF0B0BA3mukFmmOlka?=
 =?us-ascii?Q?R9vEvhftk0pXjgx6Jm8SmtSwBoUQTJPGz/WUGWhKDQ8fSnRCpmzSvxdoZuXt?=
 =?us-ascii?Q?JEaAoYFq+A7Nu7LDdM0magsv6W9T+3zo9h/bPo459LPhmAVHYyHvvHVw+kiD?=
 =?us-ascii?Q?Fwae00osu1vv6E6FbPV0mMcvMhc6EjZgDB7hPUD3rVZgyVB3AJpEAz+d2jPG?=
 =?us-ascii?Q?KIhd1ksLEc57snU0NgxIgM7k9GyvNLWWn0Pdz32Io1U+Wg5GefHC3HlspeWb?=
 =?us-ascii?Q?+240Go6919RulymDws3btC4b46Ey0zItD/i+pVs1YF+3PSRh8LFp4AUGf8Sq?=
 =?us-ascii?Q?m102HCfYX8cTwyJLksAj5aSFe91w0WiHAUJabyigUB6RKkxwPzzZBwrrgBoA?=
 =?us-ascii?Q?LgEq3sDhEq22+DlAta5sDGNMkcB8nre81s2rvjcSN73rLBewHt19yVazQ0DA?=
 =?us-ascii?Q?db8k3cqE2dlTKEhj0PDGlVjFzCr+ha2FuxoEc+vH3iHa4KZllidotHvXQ5zP?=
 =?us-ascii?Q?n3lmP1LsR58nD89zVFEm8GQukXrsAG4TksRoRmKF+uXJ9qKPV3aO1aIwEF+N?=
 =?us-ascii?Q?CBfrTzzHkXibQ3AqH7LiFYEoyC9OOTe/bXIxqYIgwexF0jQgQe2B2OlxOxB5?=
 =?us-ascii?Q?uGdPpUr2IFuM4MdEsXf8NC+S6U3ZjY7hyZBCLWHNrQPPDPd3iVjM6S9797Hx?=
 =?us-ascii?Q?xRDjqDIUWb38z3d/rb1TCGJ+kfqq2s7/qrPZFYuUgBGfsuBuCv2PVyas08H2?=
 =?us-ascii?Q?rhZCtpUzuRww/tDR3+SJUAaHnN18Fj6/eKQgPcf7l+ZWsZJhL4zyIeOljAP6?=
 =?us-ascii?Q?592NktinloAjp2gbu3r1/nAwK5CYh1YcPOeCFOlA?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f717bb71-de58-4782-cd7f-08de323124ef
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Dec 2025 05:59:38.8876 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: d3VismCeRKfyHXyqCQMTVkQncjDrMD57dfhQiOJcJ3k165c104+zGQb+R8C2+EUCUa8ekiymgLUeQs/ROP4ggw==
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

Factor out a chunk of complexity into a new subroutine. This is an
incremental step in adding ELF32 support to the existing ELF64 section
support, for handling GPU firmware.

Signed-off-by: John Hubbard <jhubbard@nvidia.com>
---
 drivers/gpu/nova-core/firmware.rs | 39 +++++++++++++++----------------
 1 file changed, 19 insertions(+), 20 deletions(-)

diff --git a/drivers/gpu/nova-core/firmware.rs b/drivers/gpu/nova-core/firmware.rs
index 31a89abc5a87..5ed079a45ec2 100644
--- a/drivers/gpu/nova-core/firmware.rs
+++ b/drivers/gpu/nova-core/firmware.rs
@@ -267,6 +267,24 @@ unsafe impl FromBytes for Elf64Hdr {}
     // SAFETY: all bit patterns are valid for this type, and it doesn't use interior mutability.
     unsafe impl FromBytes for Elf64SHdr {}
 
+    /// Check if the section name at `strtab_offset + name_offset` equals `target`.
+    fn section_name_eq(elf: &[u8], strtab_offset: u64, name_offset: u32, target: &str) -> bool {
+        strtab_offset
+            // Compute the index into the ELF image.
+            .checked_add(u64::from(name_offset))
+            .and_then(|idx| usize::try_from(idx).ok())
+            // Get the start of the name.
+            .and_then(|name_idx| elf.get(name_idx..))
+            // Stop at the first `0`.
+            .and_then(|s| s.get(0..=s.iter().position(|b| *b == 0)?))
+            // Convert into CStr.
+            .and_then(|s| CStr::from_bytes_with_nul(s).ok())
+            // Convert into str.
+            .and_then(|s| s.to_str().ok())
+            // Check that the name matches.
+            .is_some_and(|s| s == target)
+    }
+
     /// Tries to extract section with name `name` from the ELF64 image `elf`, and returns it.
     pub(super) fn elf64_section<'a, 'b>(elf: &'a [u8], name: &'b str) -> Option<&'a [u8]> {
         let hdr = &elf
@@ -298,26 +316,7 @@ pub(super) fn elf64_section<'a, 'b>(elf: &'a [u8], name: &'b str) -> Option<&'a
                 return false;
             };
 
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
+            section_name_eq(elf, strhdr.0.sh_offset, hdr.0.sh_name, name)
         })
         // Return the slice containing the section.
         .and_then(|sh| {
-- 
2.52.0

