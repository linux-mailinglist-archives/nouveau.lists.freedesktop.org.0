Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 237CFC9DDAC
	for <lists+nouveau@lfdr.de>; Wed, 03 Dec 2025 07:00:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6966C10E710;
	Wed,  3 Dec 2025 06:00:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="qb23tJpP";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from PH0PR06CU001.outbound.protection.outlook.com
 (mail-westus3azon11011030.outbound.protection.outlook.com [40.107.208.30])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6850C10E721
 for <nouveau@lists.freedesktop.org>; Wed,  3 Dec 2025 06:00:03 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LjoV57Kc05RZOsXqljtr+SyodJ0jGP28J/xI8uV/lzVG+3VQycDFKZetkEk3vwb5M3F6/kv/Wk8LkcxVX4hu1lA5dTBaYNHtkSjDBuKbpov0fYPKk9p27pw6anhGVAhgD684qRroWlHNRSv+eGx4AwXpccPeVNh5BuiKj+2brcyGP+jzD0JYQdj7UMETH/OUjawtmSbNzUDmaLLL3geOngWne0nl2X9F9VJrzTlL9RqZyaj7Bszuc/3aTOt889Tues4yED1xJpCv+ja5ea0kQocRke1gjpl5+EBwZYLzaJfKKzNyQXN2//RfcH5Rd9t82+sOHa3am3yipbZWTM0Oqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HkcpAHlVyG8eEBlPtTgUqx1zV9qp59/Z/GVglrrM6gY=;
 b=G65Mg8WeRRzARr2pn5CujV1VRjGDdVly7Wi4H5pWKtpt7bXxBEcyvX4CJ3IhLdwDLhPF0OO5wXosrKEiVkHUXPMHd9dZDK3RHRNvL+Uozb4d9TLA3cVVvBrFRtpin0F0aNiLO/2aO1/ms6ax9J7cPzKB1w9NlSyQiKe//57Lx31zG7EQdM9xiJPNRykaPxzqM7lTG2wAIt3yCsQIvAO3sv4aSdPObwfeoKz5aq+QHQCSMd5E6OTzLyyTYM2bmuwMT10G+2BUxnnG1dGKwParvzms6GKe2JAgHEzq9ko4Hd9AjhNLjZgrHSJjsyjS3+vpayFYkHyPTJrkUu6XvoggUg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HkcpAHlVyG8eEBlPtTgUqx1zV9qp59/Z/GVglrrM6gY=;
 b=qb23tJpPilhV4qMmCHfBtXUf/Yd9VcMNe1AExEiYJ2cNWhZiwLpO6SFFK2LwIooqYZn0NBBYCx1NdBp5g46VRM+0UFRgIidi0N7zjDbG0xmnrNoqrK4tw7RycWiL0h+mIChvTa1AZhe/c+hEHr4E93R4UrZcED3ziHoZOBhISFWF8FXtHjpMUFwPE1mK6a2B9l0vy9EW1ZeVTp0KYGoV62AfTgh5xNWwK824MA/YGMDotU2L4REad9U/DOJt9jJO9gIApLVoUiptl5zGji8K54U03u1cF1rfFrFcORRB6cbXJHLoTCiOBvhuSvo1kY6kVCwtoUnCM0dPjoZkQD3D6g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 PH7PR12MB8013.namprd12.prod.outlook.com (2603:10b6:510:27c::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.15; Wed, 3 Dec
 2025 05:59:59 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%7]) with mapi id 15.20.9366.012; Wed, 3 Dec 2025
 05:59:59 +0000
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
Subject: [PATCH 24/31] gpu: nova-core: Hopper/Blackwell: larger non-WPR heap
Date: Tue,  2 Dec 2025 21:59:16 -0800
Message-ID: <20251203055923.1247681-25-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251203055923.1247681-1-jhubbard@nvidia.com>
References: <20251203055923.1247681-1-jhubbard@nvidia.com>
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR13CA0093.namprd13.prod.outlook.com
 (2603:10b6:a03:2c5::8) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|PH7PR12MB8013:EE_
X-MS-Office365-Filtering-Correlation-Id: 34894c18-6b53-4376-fd8b-08de32313157
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|7416014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?A3CenGtYfEPgTW4b9YgiFx4EnAr8tNx8W5YeLyCaHQisdAXzbKa1NUAHF6mj?=
 =?us-ascii?Q?VvpaUkFHzLpbi80wISJj0+BwdhePF3ukWRX95CPcF4FnwkIjC1cMovmvXCZB?=
 =?us-ascii?Q?SzTsLo+IlgMQOFzh/iXokl/riZ/edlhnc45EjN8FlQAK0uaQL15iLelflWk0?=
 =?us-ascii?Q?RWzs6rtox8yDXOmjHxNWlhHaWK6TPjMnSoTaSGWN6cAoKUgZFkpzQHy4YscW?=
 =?us-ascii?Q?My+XWslWgZSvZgL0K35K5+Gq84vLHyKY4qK1lxMf4yGV7pjW21jB3ilqmnQu?=
 =?us-ascii?Q?b0YLT+j6a4lPfFFeQSBdlK2kBp4I766HfvrE9GjOIHA2Q+IOKBcp5F+FS4Ke?=
 =?us-ascii?Q?+J4IelT4Dx/S55Pvsa5NGpN46av93DX6fX8sfRen24szIDxnMTbXonv7Z0Xf?=
 =?us-ascii?Q?9xIkZApv5S3paXL7KwS8o+B5RMdqFppGizJrJRTXHkaUL9INwuyfbCl2vCPR?=
 =?us-ascii?Q?7jcQ1eMU7MiUM6l5V6o9lhyYPJoYGX4OLtT36jyEHSSmRSe6hwdTEc8U8es+?=
 =?us-ascii?Q?ZMoDUNX68CX9Q5hJxWfC1B/mHrDLMdLlkUaCdegu49/Jb6ydLOJXRNMvNGDK?=
 =?us-ascii?Q?xD7ZmnMLU7fmNOETM9um9YmvfoMbsa0LsrcVlNEgX9Z/YctAOip15pJHvO67?=
 =?us-ascii?Q?fLMmLqKrFZ5v5WNMKHAd7PIg/XRQlS6f1HtgQIFmAW/umUBRRxrD8N0gO3xJ?=
 =?us-ascii?Q?NhAE9sC5HLCuzFpHsK6gnvpw/TPXPwvMb2N1vefNWkoAnUjesFoq6bm2m+MH?=
 =?us-ascii?Q?MYaTKuhAx5Mm96MCVZU2NgX7NAjbV5+GcEwW8sZxm0h6UunWu3+/E5x6NYFG?=
 =?us-ascii?Q?kuC4EVqsijdjFt6pr7cFr0FOi/YuxZA7lTADxk2m0c+9uhlqSkmgySjl8GML?=
 =?us-ascii?Q?85vJAFjEJRVe02z2/7XZdrIgmr7FFHg1C+JIYXfzO8I9ISxS0+omG1N2Z7RB?=
 =?us-ascii?Q?wvSx75NUcqXzmNqBM+RgFmU8DWpWSa851m1W2sjmqOqZZ2G+eH/1m92Csh4E?=
 =?us-ascii?Q?1iU9vZP+8xv2G8iMWT8MpSmI8CqFxl/7X4qmpompIpJP4fE8vvv3UcA8x8px?=
 =?us-ascii?Q?furzAaYMLZP6SS/5tvIMwH1Ew/edGzf7omrnHYYiS1NaATg4LKMBuKKwBt1r?=
 =?us-ascii?Q?AztSSGDnl+yFJbyIPxmiO90Q9YdFcxTRhUX8Z3jsPMNEx5UiNssopbmNUf5Q?=
 =?us-ascii?Q?LuynjZVNSwXFQCJxgSU7yf3AX4HLfVYy/KCB5bZo440zBrLiwlbf22wFBsDI?=
 =?us-ascii?Q?zQp3Q1E8w4OiyiQuGLprV3RrpMaxqF7N4XWr8OPvQ3YjtVPhgjfTDPD0DsA6?=
 =?us-ascii?Q?jpCed+BmDzGi0VeDrerGRh0FEJWqleQ27JZHcM/ybqHHF2uIRAqysPgZKzhE?=
 =?us-ascii?Q?xR4S66MCyr6kVqWXDUT540wpixbVi5nz2TX5DGsm7bjDIMzcJbKJ1Zn0AIUn?=
 =?us-ascii?Q?3U/SAga7EoHlJJcjVIG6M+PsXU2KOEf6?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM3PR12MB9416.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(7416014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?4Dk+hIDybIycyCcXJdGMa0UDWof7lOjpx0lkF90tCs/agVwOFAQK+oVRPMN+?=
 =?us-ascii?Q?WSqMjyUUOH0LYKSo1JNyO7KBuyR6jQP/l6+LNO0aaLlIqGfXczO/tH8cuL7y?=
 =?us-ascii?Q?sJXqipFRwUSj2+73Yh3prB+Gu948YlMQlSLfjzKTSX5aMTC62zFgccb9XLvv?=
 =?us-ascii?Q?vx6TJ2TKaqsAe/ol6nnXvdVZimZMGmGkyDvWz9U1yfdEkuYHKGk8N3Ep5LDM?=
 =?us-ascii?Q?6yinpzmMw8kOXAfIGUZ76dKmh32xu9RQJ9eSmfSYH+Uy0zLTWXK+RQeWCCxY?=
 =?us-ascii?Q?++aYnrXw+yn0X9fr7ZMBlpe3dKhukH4f2NfK1nLutyPhyWhxV+jpPWvUlA4N?=
 =?us-ascii?Q?v71o1+mzS7B00JNiHiBre003PlQ9amWpB+Glno7qyX4xOYy43pdh2dLg8UWJ?=
 =?us-ascii?Q?kCOddImW0CdmJNAbSJt+Dw9OyzExu16QnMFORaJWu7JTGKSnL81ty5mf9M89?=
 =?us-ascii?Q?S2lpKWaHR8Lco2QiEa9wu7MSkWaM03l7ZxlO2FpYTiVic9M554ldF7ssk0xQ?=
 =?us-ascii?Q?5MRRB3I1XNspbjUXC6I3Bbi+gI9VkuEh5yDSir310XTHNRZTXoS8P0DwKRl/?=
 =?us-ascii?Q?Bna5lSr7iPv3LH9+X4/13vgChBVo5QuxRAqPVtp2Fy+7KVjF8FZAjflxb2/Z?=
 =?us-ascii?Q?OQC81sN1IMMe47BInHwjfB8SJj2+dUfxVwfLPNjRokV5Igoa/NUpilAmZq5A?=
 =?us-ascii?Q?vfsuTB0sUcr3Tc5QRCdxSOVR5z32hJqIl6sFq5YbL6RsvRrxVZ9gHQ02QfBU?=
 =?us-ascii?Q?tw0sXLQZfk/a202YroVm+Vr6+ztjf5s6pKQy8stWrJJXwQEIDYj7FyJGVRLR?=
 =?us-ascii?Q?/lDP+fBuO6dtsJe5fP2yhZxIxMF6TAShVdqURUZD6zc1XHjLGjJ57SURbVCU?=
 =?us-ascii?Q?d+RdS4cP5eyxGuRicSZY9k2OfHh+eAenGyIVqxcVAM661q4hM+IUDTy1p6BU?=
 =?us-ascii?Q?oD2RIJ632Yix2Pt/uNztcondejerjaJuLPSFz9ApDVc34XW2oB/CFLVgFGl+?=
 =?us-ascii?Q?FV9PeG8p0wwrnQXtdv7kJrAX4VvsZjHiqjuPWHvwpP/+/UPRxIDkLtC9hqCw?=
 =?us-ascii?Q?71SHqgRLppXRJfDGpJOUyfePQEU5xfVZd/Yaksak1TgQYdBTN+cjeojB/+pw?=
 =?us-ascii?Q?radyRzHev2TLsqJiQX1R/7q4uMxQAYo8yqB+a/4TaAcWdc+ZpbRzJzz9ZHvq?=
 =?us-ascii?Q?BP4UFE281u9vTWsmU9hiiZpiHuv1kqUN3IkdNMSsV1HxPIKU1pmDF61Fg/5x?=
 =?us-ascii?Q?+bmc1FZOaGUQ9ccHq7iKAE0UYnMuwr6abZF+R7W2m+oOLihdRFbRHA8AK+J5?=
 =?us-ascii?Q?dZWlskPZ3jAX/RvMtBfxNJE82TYgQ+i9BM3r0zbrJ95jJO/FvjNsKF9wyzUm?=
 =?us-ascii?Q?yfqJxaD4aLz3RaOnVy6wMe7Pc/TWz1SMG7XSPDmg6i/kMPOh/u22F+hrs58U?=
 =?us-ascii?Q?/3T5XwsiOBGHpVZaSy+YQKIpJjjPSI9IcP7W8UkDc1mHY4DnWJFcq8BajIeG?=
 =?us-ascii?Q?7Wser6rSjda/ZhMc28k2ClomgtZps/uAlu77IEO24Zl0ZzgMIqttX0fd9ApM?=
 =?us-ascii?Q?4T5m+FJt8TOX/OclV9uD+xB3P9QSf724GJA2UAw7?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 34894c18-6b53-4376-fd8b-08de32313157
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Dec 2025 05:59:59.7714 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: s7jv3E2Y+7CfuagXHgH0Su/KdN/bBdJn0KcvpBlRIguwaED47RH+sLXZBGVpj+ZI/32L3FgWgVrMWnmzrVfNtQ==
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

Hopper, Blackwell and later require more space for the non-WPR heap.

Signed-off-by: John Hubbard <jhubbard@nvidia.com>
---
 drivers/gpu/nova-core/fb.rs  | 15 ++++++++++++---
 drivers/gpu/nova-core/fsp.rs |  2 +-
 2 files changed, 13 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/nova-core/fb.rs b/drivers/gpu/nova-core/fb.rs
index e697436de29a..a402a9fe86f8 100644
--- a/drivers/gpu/nova-core/fb.rs
+++ b/drivers/gpu/nova-core/fb.rs
@@ -98,6 +98,16 @@ pub(crate) fn unregister(&self, bar: &Bar0) {
     }
 }
 
+/// Calculate non-WPR heap size based on chipset architecture.
+/// This matches the logic used in FSP for consistency.
+pub(crate) fn calc_non_wpr_heap_size(chipset: Chipset) -> u64 {
+    if chipset.needs_large_reserved_mem() {
+        0x220000 // ~2.1MB for Hopper/Blackwell+
+    } else {
+        SZ_1M as u64 // 1MB for older architectures
+    }
+}
+
 pub(crate) struct FbRange(Range<u64>);
 
 impl FbRange {
@@ -238,9 +248,8 @@ pub(crate) fn new(chipset: Chipset, bar: &Bar0, gsp_fw: &GspFirmware) -> Result<
         };
 
         let heap = {
-            const HEAP_SIZE: u64 = usize_as_u64(SZ_1M);
-
-            FbRange(wpr2.start - HEAP_SIZE..wpr2.start)
+            let heap_size = calc_non_wpr_heap_size(chipset);
+            FbRange(wpr2.start - heap_size..wpr2.start)
         };
 
         // Calculate reserved sizes. PMU reservation is a subset of the total reserved size.
diff --git a/drivers/gpu/nova-core/fsp.rs b/drivers/gpu/nova-core/fsp.rs
index 5840ab78e79f..7d46fbcc7abd 100644
--- a/drivers/gpu/nova-core/fsp.rs
+++ b/drivers/gpu/nova-core/fsp.rs
@@ -454,7 +454,7 @@ pub(crate) fn boot_gsp_fmc_with_signatures(
         // frts_offset is relative to FB end: FRTS_location = FB_END - frts_offset
         let frts_offset = if !resume {
             let mut frts_reserved_size = if chipset.needs_large_reserved_mem() {
-                0x220000 // heap_size_non_wpr for Hopper/Blackwell+
+                crate::fb::calc_non_wpr_heap_size(chipset)
             } else {
                 total_reserved_size
             };
-- 
2.52.0

