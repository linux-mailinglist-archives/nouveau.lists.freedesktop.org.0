Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C3909C9DDA9
	for <lists+nouveau@lfdr.de>; Wed, 03 Dec 2025 07:00:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C852F10E0EA;
	Wed,  3 Dec 2025 06:00:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="NTKs+Q27";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from SJ2PR03CU001.outbound.protection.outlook.com
 (mail-westusazon11012065.outbound.protection.outlook.com [52.101.43.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 33B8710E710
 for <nouveau@lists.freedesktop.org>; Wed,  3 Dec 2025 06:00:01 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oHH/ZduKCythvVKkmzXE77r5WpJnVtd6UVq7F28IvddqsJx3olp6M9hK5jixT2DtXOwIk77KX5P3Vmmy1YHiPgLA+6+XewjaryzOab3mFYJOh6hvmJEvSRnxTZPjxmuFNyKMFftKSAeQfl6JdrWZ3Ee3wNcjzeBOVFXzenngdg9wC2oy1VtWaRP4rtDBUMDpzV1RUfiRJrZf0kIkCRK3ILslevO2m0rzFkV0WmEcI3rOqbNVbw1U/1BkV4g9ktRvtr5S0rN7YILSMdk+oA8Qzt8ZqBWDl9hyKT/t1pnraXmDafOqlD2X6EFoq81JOzt6RwozEnudb2ZV4Dncc7xsyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6HGFWv6dpTk6OgjmAZXQ5MTO6cVPK+GqG3M0vFFi3Pw=;
 b=tvOXIFbnHexWrq6B/xqdEeIBSHYw43XC2zQ6rlZZjDYdk7p1vZ6hCE41/zYGdSdTVem0dMSAb16fXUcJdvizchHK6Svf4vBsZp+pE+5JL4hcgNmTLUFFLlNs24zTq+RjPUleaDBJxT+BXeYujgWdPcpz2+aUYkrLh1sz25YR53fyzDQnNKPjcQlcfyGPQk2eVu4vpM6Wny6iADzw3+wSN8hQ2YDFrcXwRJ+ILTEM/HRo8F+GP25MCbsylMSGDeMKZepQRYKkSMXSAkIWX1oRZdHZGh7WD/BDnuo5Vuat9gKNryGXiAJ8ij2VizloU6/pxA92r7eSnAunYKWW3zGZNg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6HGFWv6dpTk6OgjmAZXQ5MTO6cVPK+GqG3M0vFFi3Pw=;
 b=NTKs+Q276Wr5nuD+k0kXLhWcvvgVFaIrpU7M0gct+W7HPW1YrGSOcRt/ajolrwxWLyNj105UWAHEDhaEqKhtkVRlU88dREIJHJxQgNN+X/TASFeh9BaPZjJxVxJNfsGKOkw65QrBeLP1V6acb/o0xclhYRhPUahIbamt9WPY1ScILfkS8b5jGwbOFW6UxpbnFvVJ76uAMOBt92QUrf/EFEeleD+TNgmhvKWk4SMeoOkfE9Pxt9BMzVu5qgDs0v4VPY5Nye2RiTO+9bXsqJlxvOK4HllsaTbUt8uLLscm/grKnNoQ/ypBZF6GC3Jemk6C1gW2fe9A+Y7Z8+nnPWNa/w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 PH7PR12MB8013.namprd12.prod.outlook.com (2603:10b6:510:27c::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.15; Wed, 3 Dec
 2025 05:59:57 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%7]) with mapi id 15.20.9366.012; Wed, 3 Dec 2025
 05:59:57 +0000
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
Subject: [PATCH 22/31] gpu: nova-core: Hopper/Blackwell: add FSP send/receive
 messaging
Date: Tue,  2 Dec 2025 21:59:14 -0800
Message-ID: <20251203055923.1247681-23-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251203055923.1247681-1-jhubbard@nvidia.com>
References: <20251203055923.1247681-1-jhubbard@nvidia.com>
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY5PR03CA0005.namprd03.prod.outlook.com
 (2603:10b6:a03:1e0::15) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|PH7PR12MB8013:EE_
X-MS-Office365-Filtering-Correlation-Id: 8e53fc63-16fc-4ede-8336-08de32312fb2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|7416014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?LP0zuo6yqHyAG2ifmuJZmjDqO3BMMnHdSEll5sZFZ3YPJrZe454GsMbjucBC?=
 =?us-ascii?Q?Bz0BSwSfksQDha7ktCP0u/h8c4SJQJgYXJKkeC6kIHCyHbE1JCrSEsHnvVUi?=
 =?us-ascii?Q?t/8PFh2atSzev9RgOJjNy2jfPjzMQalogjA2ZxPZjuNcEpz13H2N9o9Z9cmU?=
 =?us-ascii?Q?1exh+kiy3zo/FjpobJ1DY5f7Cr22OjA52EQZcxDBiXU1JCjTrJkEK6MeozxW?=
 =?us-ascii?Q?/NHIHg5Bg153wWPMBsB/SMPypK6DxQmZRCQDD9N1tDIQYHC1dhQ5G5wVi4cU?=
 =?us-ascii?Q?CkmziWeBFL6ucoZ6pxZ7Amr/v0lfezxuhns44IMPtWzqvDztdKorjPR/IAj4?=
 =?us-ascii?Q?RoF+j/6A/2Oln937DUFzmGsghD4hPWt8rK1k7XJeIREKTvAfSTnzarlNLNWS?=
 =?us-ascii?Q?3VIFZYSSWRKQ0zMymfrNFq76FMhesJcBkmIoTTFFfH9VISPzE3dmrgja+F8H?=
 =?us-ascii?Q?BRsdJ8xnHF6kfFyXA5HgJbhlLHoPH/dJExLRMo5rwVG16ATb1edrwYom0Cgp?=
 =?us-ascii?Q?URtPA9lGYr40ReKCZIZrVpWs59lgdMKdHoGiCV1pI3Le+wSKkIe8FViIjtgC?=
 =?us-ascii?Q?bwPLzPAMIfnY2u8qWxCrxnjAnsfcN5cw+s3Hg9mIwxIXmnfe702dmcT8F66q?=
 =?us-ascii?Q?ae/LVaJiDF9gyviJleKGj9QWMhNb0aciiTWzOgjVUVDXercTi9X0JC2ri57Q?=
 =?us-ascii?Q?s0qphmTOaC/a4Vf0PA2m0TFvW1p2PUNVKGOnzFyMa21K4HuE0nQlCtWsp/J8?=
 =?us-ascii?Q?5xskmO6F8ADbz9kJhB4gTwPvhJ0UZGhn5zTgNgt5aSKiBXvpTUo6AQaOx9fZ?=
 =?us-ascii?Q?AeoWbAotY8ppv5rlW0TYLcRwb439CfH5g+dmOmLnIOl2ppLnf61itKD+dGM0?=
 =?us-ascii?Q?Iu5BhHZoC07NBJr4EUnJBqeNQ4VKG669OQnFLP6T6N0RhDcIZnAm/M9NABri?=
 =?us-ascii?Q?7i6bb76BGj7BnIbnAs2Ulz/SA5YMNHh+kPcHF0YqKg6lMpYYdEK/Bz+RPLGf?=
 =?us-ascii?Q?TKoUVgl9V4uxxLbX8QzKkS6xZG6fKMndJ9sSv9J6t3bBnP9RBJFc+7H1/BpA?=
 =?us-ascii?Q?oVm5YUfC8nraeDMlfpK9NJY4zuPUKHsBL8D2u5vpCH4rv7+KCEzx7neUrVsy?=
 =?us-ascii?Q?+8kYaG34b4qjvi7j3fodS93YMzNb4g1nu9y21OI1gyi/5PQHrjK7D9jeAWLH?=
 =?us-ascii?Q?qGvg+FmYQgXIW3+HW/FW9PF3vhGYBj6FXT0xiOICfmE8hCz62ctj+quXXrc3?=
 =?us-ascii?Q?FZeK97y080UxF+hFV23ej/wZB0Kz9y+xLz9AYVMXJYcVunZWTvtXtAvmve5w?=
 =?us-ascii?Q?JULJNRCitATipzslyVIwrPGpg3Bc9Kh87wuyY8MMn8FUoLntPR9AwvEWVTTD?=
 =?us-ascii?Q?R194Zd8Q5dEYd2jMJA7VilRJQv/zOGTmPjfabBf+PYtUgs6f8Jw1XW/ifiPO?=
 =?us-ascii?Q?Ue0Y3Mu/4xbIli7Q8mLb6aMZCdjLmH4R?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM3PR12MB9416.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(7416014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?W4N5x5THahm0wJPIebomq0CLrIGD/Do+ILmobYAhLyTvxRfKByKQWrlgizhf?=
 =?us-ascii?Q?5KoKTyaIeoLhgn2nC+YmddBCy8bBPimG6Lk0Fp+IsrEZuujI4arpf7elv8T/?=
 =?us-ascii?Q?TBjQpBapEh8GmIXEzp+oGcianJ8RzSz43wyKHn+kPZYUI8vj18A1PPEAYuUS?=
 =?us-ascii?Q?A6at7h0ZEXKjxfiS8mcq0vht/n4PMzyHOpZwyVTB1Vmnqa9sOVpOnLynYzUl?=
 =?us-ascii?Q?94aFgODINyyzjqzzcNPTlY4qOjbMbKAxVjDdNUIDY8ESv8qpM0MGHIwNB7c+?=
 =?us-ascii?Q?nw6UopP3TV8Bl3X0VVuGt6KC2Hj+JpmYzhBB8tej9jL2eJriWzksZzYvIrFT?=
 =?us-ascii?Q?57vTFpk477/bZUy1ehnjg2qyWpGzZBdraoE0YpmthhbSaoG+zjaMDQfo0PJy?=
 =?us-ascii?Q?gOLkBdJbbs/ZS4Q/rbuxaazKXygeAae7QjSRrnpR9Da/WVHLiRNsT1J7HfeG?=
 =?us-ascii?Q?kIXI17M+TeAav4zF41XOzYJKbq/ElkkZvNeJW8Uma3h/sz3YYEYLpvnC96cZ?=
 =?us-ascii?Q?SrHn9AX1Heo6uS1xWXJerwh83jBIo9ZgjpLwSA3hKI/eUSzjVGts7r1xKIL3?=
 =?us-ascii?Q?3XqCJMExFPOlHge3ZLfG0QsOTREqmeo2/0lnrp96smtFAV+g+3L1R8oalosc?=
 =?us-ascii?Q?5vi6CbmL9tMUTnRlyE3/U3VXqzaIfi5Zw9GmIYo7EiykQ3PoZgkq72a4AA4b?=
 =?us-ascii?Q?OyBuSxxJIJWacC7yCGqa6o8cY8LX18ymVrq6LMcDrnjoVn/9xD2dGOkhaPSb?=
 =?us-ascii?Q?MKZ5QKANaAHfmuHEpIcqxB2zRRTUSjok1WMIdSnENPwZ+poEXu8r3h7E8bnG?=
 =?us-ascii?Q?VaI/vdukybGmsZfRHSLC5X+u1IeGo5EpIxI7LlRClKCLSwPd5gAFfbWYwyfm?=
 =?us-ascii?Q?gF7bWtRHXm94tmUpzCa0ZVVyXqpjqt7NZ/hpRiuDBz2T+BuZLg+4x+vqZdlM?=
 =?us-ascii?Q?UfBZLhHOZ2OQkUd4KzMQv1k1BnXRg447TlSBEjYbZiLqHPtySFbjaN9xZ2zz?=
 =?us-ascii?Q?odyaaqXJ6Rx+6Njo2AlBHrw/XwkiwKrBumnpHKsRv8W3Yz3YvsKZ1iVbn5Ke?=
 =?us-ascii?Q?KJJw3/QJ2WyzZ65/LRImnErQqKWikK11T//3N4L4onyE02vFXSxv8u5yg2jW?=
 =?us-ascii?Q?8O0OUic5YdNPmXKhAh44fNoPfZMYwPSTSxboXzwvsSThaUazOvV1bgmMQLjP?=
 =?us-ascii?Q?DOApLapZMzukBVz9yQRJY/H0yPkM4mKd5Uc1UplulInaYIOKH+otwnxBvqnq?=
 =?us-ascii?Q?c2mfwnM4VvyR1iT7d4iNRX0eUVvy3LpWAgtEmmG0X42MPx8PUQyTBUNntXmq?=
 =?us-ascii?Q?q5zXwk/+3kQ9e5uwthQCkH+d7hiUz1Xxtkg4BJi5kXV0vh6ue7OXNFx4vPZZ?=
 =?us-ascii?Q?+1jcjOQBiMoYFLyeuxeJs/79gwY11xruKvVouA5I8qd6BGpIwgLydhq2NG1M?=
 =?us-ascii?Q?ZUu+Cokb2M0pqZ73uEL09UzLRjE7N3DscxvTU6FxBnQb6Binzq2rh74F+29T?=
 =?us-ascii?Q?UkhyGlEos6Ci9M6Cw4G/WT8l2Twpxr0FA0n4pSEgdRSl67AFsUrghlNJ5b2/?=
 =?us-ascii?Q?x7i3X/veLx1eM0SSGJ8DrwGx13hJSGbkeRP1df3f?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8e53fc63-16fc-4ede-8336-08de32312fb2
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Dec 2025 05:59:57.0625 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1F+J4muVuARGx5UnwjbeUEq2gWSON2XBj1iv6Ok4227eIDGcZfMmOh5XcuUq4lUD1rbUUAW4avX6m+R8BhIqAw==
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

Add send_sync_fsp() which sends an MCTP/NVDM message to FSP and waits
for the response. This handles the low-level protocol details including
header validation, error checking, and timeout handling.

Signed-off-by: John Hubbard <jhubbard@nvidia.com>
---
 drivers/gpu/nova-core/fsp.rs | 102 +++++++++++++++++++++++++++++++++++
 1 file changed, 102 insertions(+)

diff --git a/drivers/gpu/nova-core/fsp.rs b/drivers/gpu/nova-core/fsp.rs
index 311b6d4c6011..bb1e19c03c30 100644
--- a/drivers/gpu/nova-core/fsp.rs
+++ b/drivers/gpu/nova-core/fsp.rs
@@ -22,6 +22,9 @@
 
 use crate::regs::FSP_BOOT_COMPLETE_SUCCESS;
 
+/// FSP message timeout in milliseconds.
+const FSP_MSG_TIMEOUT_MS: i64 = 2000;
+
 /// FSP secure boot completion timeout in milliseconds.
 const FSP_SECURE_BOOT_TIMEOUT_MS: i64 = 4000;
 
@@ -360,4 +363,103 @@ pub(crate) fn extract_fmc_signatures_static(
 
         Ok(signatures)
     }
+
+    /// Send message to FSP and wait for response.
+    fn send_sync_fsp(
+        dev: &device::Device<device::Bound>,
+        bar: &crate::driver::Bar0,
+        fsp_falcon: &crate::falcon::Falcon<crate::falcon::fsp::Fsp>,
+        nvdm_type: u32,
+        packet: &[u8],
+    ) -> Result<()> {
+        // Send message
+        fsp_falcon.send_msg(bar, packet)?;
+
+        // Wait for response
+        let timeout = Delta::from_millis(FSP_MSG_TIMEOUT_MS);
+        let packet_size = read_poll_timeout(
+            || Ok(fsp_falcon.poll_msgq(bar)),
+            |&size| size > 0,
+            Delta::ZERO,
+            timeout,
+        )
+        .map_err(|_| {
+            dev_err!(dev, "FSP response timeout\n");
+            ETIMEDOUT
+        })?;
+
+        // Receive response
+        let packet_size = packet_size as usize;
+        let mut response_buf = KVec::<u8>::new();
+        response_buf.resize(packet_size, 0, GFP_KERNEL)?;
+        fsp_falcon.recv_msg(bar, &mut response_buf, packet_size)?;
+
+        // Parse response
+        if response_buf.len() < core::mem::size_of::<FspResponse>() {
+            dev_err!(dev, "FSP response too small: {}\n", response_buf.len());
+            return Err(EIO);
+        }
+
+        let response = FspResponse::from_bytes(&response_buf[..]).ok_or(EIO)?;
+
+        // Copy packed struct fields to avoid alignment issues
+        let mctp_header = response.mctp_header;
+        let nvdm_header = response.nvdm_header;
+        let command_nvdm_type = response.response.command_nvdm_type;
+        let error_code = response.response.error_code;
+
+        // Validate MCTP header
+        let mctp_som = (mctp_header >> 31) & 1;
+        let mctp_eom = (mctp_header >> 30) & 1;
+        if mctp_som != 1 || mctp_eom != 1 {
+            dev_err!(
+                dev,
+                "Unexpected MCTP header in FSP reply: {:#x}\n",
+                mctp_header
+            );
+            return Err(EIO);
+        }
+
+        // Validate NVDM header
+        let nvdm_msg_type = nvdm_header & 0x7f;
+        let nvdm_vendor_id = (nvdm_header >> 8) & 0xffff;
+        let nvdm_type_resp = (nvdm_header >> 24) & 0xff;
+
+        if nvdm_msg_type != mctp::MSG_TYPE_VENDOR_PCI
+            || nvdm_vendor_id != mctp::VENDOR_ID_NV
+            || nvdm_type_resp != mctp::NVDM_TYPE_FSP_RESPONSE
+        {
+            dev_err!(
+                dev,
+                "Unexpected NVDM header in FSP reply: {:#x}\n",
+                nvdm_header
+            );
+            return Err(EIO);
+        }
+
+        // Check command type matches
+        if command_nvdm_type != nvdm_type {
+            dev_err!(
+                dev,
+                "Expected NVDM type {:#x} in reply, got {:#x}\n",
+                nvdm_type,
+                command_nvdm_type
+            );
+            return Err(EIO);
+        }
+
+        // Check for errors
+        if error_code != 0 {
+            dev_err!(
+                dev,
+                "NVDM command {:#x} failed with error {:#x}\n",
+                nvdm_type,
+                error_code
+            );
+            return Err(EIO);
+        }
+
+        dev_dbg!(dev, "FSP command {:#x} completed successfully\n", nvdm_type);
+        Ok(())
+    }
 }
-- 
2.52.0

