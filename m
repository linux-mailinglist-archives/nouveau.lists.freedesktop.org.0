Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 01DF3C9DDB2
	for <lists+nouveau@lfdr.de>; Wed, 03 Dec 2025 07:00:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 94BD810E721;
	Wed,  3 Dec 2025 06:00:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="RqBGh1nb";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from BL0PR03CU003.outbound.protection.outlook.com
 (mail-eastusazon11012046.outbound.protection.outlook.com [52.101.53.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 132F810E721
 for <nouveau@lists.freedesktop.org>; Wed,  3 Dec 2025 06:00:06 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FYtd0AzJY/r7h4x8GZlq/pzoWBM391yWWSGlXL/OXZsO7LLtxHctVNrnBak1qCM6PampWX6vTi6aOF3CfFJNx+7NW67ryCmSO8o4Iw3wazZ1sW0AUP6GsPCe7dIjPzRtwTWlsyc/GPDxIcCY80Dnga5kUScqOdRdO4Qe0xQ6samgrJf9pv0MPickgTSRuhgUq8DPdXw+T/Zu2qcR7uabM6qWabrM0z/Ii8ONHq0toir4u4EatVu5vNgirncNgUzz3hRIgxYz5KA3S/Oz3nuyNYKa9rZnXzCtd1Qbe0XQP4i/TSmQrskyjDLESypdsY/kMsqUmrx7vYkuq73PMLHqZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Lsv3JEyXi6x/wWOZPmUriADO4B5sictsNNAqha1YqAs=;
 b=jLVOdG8pHyaCAAk8H4Hhu+dWsK0lkn0eahIGpNZYsum1gVlJZ2K/kwOU32oAKXmOlwNqv57W2pCZc80XNs19+O7m4jE0EDVDGS/wDI71ZpAaD7XfB506kMsX0xkKKHzMi7pH9l8NrkzqnqTRNU7ZuPVim24yzYrfvUv0MrO2L4jJTMa+L/hiuQR0vr4PWdnxCnizTD4fnTzE70CeRHoDPaY1maJ5m/CUUnKahOUY4QVpHJf0nSjAp5ybbc8FHwmLVRK9doPsaXK+R2UGzS6yKHjA7WtVscvi5TwE9DIWlY1Y6SrRVBOzyrwk4mNqMCVQlxEQCKX9ELJnZPrfgoEyNA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Lsv3JEyXi6x/wWOZPmUriADO4B5sictsNNAqha1YqAs=;
 b=RqBGh1nb0yCuthgOhaEaBkurIvrJsTClnZZSJVo+nZHJtX4G9YKCa6w05WobtlZc4QVD5Kyk37lmIUehoIbSfrbzXVTMdtXUEKc3g1870HrlenSdsMh09HLhxJNdZK7Iz/w1Ti7O2MBc59dwvggWk/qHuPDYr47ArSahnHsWo7trwT6c7U1Rg8Rxp49rzGJwrnLUayJPB5usvlI+kLEr6lVbHS9nggjhA1FaLyfCIdSfO0ZTcbxXxjfCRMk/aYCX4mi49Tkr09exscg0AN+8ZIBUxvI4BcO2a8iEm6p6soxoLZIkcroRbdDJ/0vySEa8uGaToHjsXJMkytuUg7ntRg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 PH7PR12MB8013.namprd12.prod.outlook.com (2603:10b6:510:27c::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.15; Wed, 3 Dec
 2025 06:00:01 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%7]) with mapi id 15.20.9366.012; Wed, 3 Dec 2025
 06:00:01 +0000
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
Subject: [PATCH 25/31] gpu: nova-core: Hopper/Blackwell: larger WPR2 (GSP) heap
Date: Tue,  2 Dec 2025 21:59:17 -0800
Message-ID: <20251203055923.1247681-26-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251203055923.1247681-1-jhubbard@nvidia.com>
References: <20251203055923.1247681-1-jhubbard@nvidia.com>
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR05CA0122.namprd05.prod.outlook.com
 (2603:10b6:a03:33d::7) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|PH7PR12MB8013:EE_
X-MS-Office365-Filtering-Correlation-Id: 9dda281b-c9a3-491b-d110-08de3231322e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|7416014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?bHuMbIOPUh111dcm5y//9JMB6WDSL4iwqAe+N6tEk9SPadIZQnwE6i6VOzmJ?=
 =?us-ascii?Q?wR7dam7RCxMIw7XQ+vffyAH/rSPWO1uUM9ma6onCX7RpqvHRlRR8gJV+EzZv?=
 =?us-ascii?Q?E8ewfCqIGa4OOmRSxlmNzfrOJePCjlaYwsBvLRvC4/pVA929Xj1Ya8gibJBk?=
 =?us-ascii?Q?gAKXni69oaCRurA6aPF4XwSaKLoKwqwNFSTn8mJ4wz0MG434v6mmOPBnEdFC?=
 =?us-ascii?Q?W6vdytiIFtfobIFnS2/R+hxqMDwGK2LB44wLYapZWiiYtJm4blxHAiaJZW8g?=
 =?us-ascii?Q?vzjkFH+3eY5pJRWpZnj7Sa6hW6fktQnVnlK7VVinbtJCN4/hdM852n+gCezP?=
 =?us-ascii?Q?vI7My6Wk5i+qJGLUntJIcy/wG23r2ZScDYpWDGLi7B26ZZSqvk2nwG1fSr+w?=
 =?us-ascii?Q?BzufR120F1i9ElnBPv2gOQQCCNMEm3LOwmLBOGmAzQ3t1xSVLdogGvPW3+B+?=
 =?us-ascii?Q?xJrDkovXkajiu+dVRlQFh8zChlrEe0v2W2VGAvYCO+15tFGOHC6S4ZMOppvn?=
 =?us-ascii?Q?9h6jrRMnxz+kVSIKoCYS30/RLLU2k0u9LYKibThaIgNwEapV7OZGTJKb4+yW?=
 =?us-ascii?Q?aLuFNAIEPokEj3CGjesPbcP0ldyay3L7/cwRybr9omPZ5rtnq7DzJJ6iVwAt?=
 =?us-ascii?Q?c8XhNKij+LBcJmtt3Ze7Y3wRnHEHwyB047V4biR0/Mg9a5UFeKMv5hQwvRf/?=
 =?us-ascii?Q?eaVNq+AmYha9vBDgLT1FTUyQDa1KH5c8mMwS4KBoIJ2r1W6sokMMb2Xc92Yj?=
 =?us-ascii?Q?946M+lKBTM+dRvd8aFqADsOPrdjS5Pzg+7SXGFra6j3mgsJ4KZjCvyzH8yRI?=
 =?us-ascii?Q?f0JCT2sr+E3pFJrnHUaNN9BDCuQXmlbXj1BfS6NK/qQwxh3UJZGg/XZGh2kT?=
 =?us-ascii?Q?o1f+PA9vs3ePH67otQDHMddHgSAnj/PsWfmKf1xv0MQu94lw2ReVJcO5vKr/?=
 =?us-ascii?Q?jSmAAEnqbKvOmSTgF/TUTbugw48AYMOQB/OnGccPH9OJB8QfWfQgb4l5MUMu?=
 =?us-ascii?Q?bofc/XLEE2AOf1AoFa4Uz5daHuc/eruGKsvymDnI39wInObIOAdCEww+pWo5?=
 =?us-ascii?Q?fvihwWAXtn3H0ZsyLqo+ec+LaDxfGSzN0lifaEMdF7xecXk4cR8+yuMzM/QA?=
 =?us-ascii?Q?P/Lzs+Sh86NU5c4t7BSe97O8pz65MJ32v7EgtKlZyUKoY0nPXoSxHHc5/pMo?=
 =?us-ascii?Q?e/BOdP8Pd801exhTVPribHWknXW2NCHagrXhbk046AGiV+C1ioPgUUhQnoJ4?=
 =?us-ascii?Q?XX28rd0xny7ay4Ue9oFesfVUhnvXbcMQNkoNUbaXvlPKcybI6LmEIvNKHvyu?=
 =?us-ascii?Q?/GLKvTRXR+Mj6GxAoYHNebc+e241Wopu2T4bKYnXkQiTOy5HA0eX/5tsKUDw?=
 =?us-ascii?Q?iZSQubdqTKpMOs3PFL5h0D9hmYUq650gt5Bd815SwSyW9WMW6B77ZrDjS31n?=
 =?us-ascii?Q?aq7MDTdK1dtHSnWp/WqHHmxSivJ3FLKX?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM3PR12MB9416.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(7416014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?gDQ+kiudYjz5HJLx3J8MhXPwUWYswKvhnDIA9vuwMSZZsPKvlJEvLe4R3aY8?=
 =?us-ascii?Q?AE0ng0W5SSK4/naXQ+mLsUpAVAfnQlkzuibf/3+25zeYqqoRU24oD1uw9rdt?=
 =?us-ascii?Q?JlMqoorM2xIS/UyElA8tPiDPJ0Uy6KpFtJFYhBuAEAK3nzlKz0SWLhWldkqo?=
 =?us-ascii?Q?wNNwf+4kiIpiR9l1kLHNyb04cD/yHVqbxtc+0ut7LEv6x1LxYJ2OCFRKLjJA?=
 =?us-ascii?Q?8tvA21lEok4BPRRdw8cDkJpK/INMmLeUyuFTipJh5sSMyEXkmN/dsmMzkyoW?=
 =?us-ascii?Q?MuZjjPlOpcplGTDsD3KeAyoEGDP7naXHOsuZSD6Xd86bXQX49FRKsXVtJheF?=
 =?us-ascii?Q?dld2ehKNreQL944HUrcgq+yrmi8KHrLo0sSsOTRDAlYF6dFs9WN868pl7WGN?=
 =?us-ascii?Q?hwblplsWS+gMVvZbE9TN3iItGlPirFulsx0qMwlsmulqreaWaHSZ6aiOwHMK?=
 =?us-ascii?Q?RBxu6axtEETAdQ1s3c9VemYFfygvseWqRzJfhdH1T17HWA5vOxgE94z8/Ftt?=
 =?us-ascii?Q?Al8recQX2YcurdHtt8wTyqxDDd6ox/Qq+l9vcgLWyt/Oo/CvkSdIAoX9qAAM?=
 =?us-ascii?Q?9KByZn/WtvnWodS796JM2/g3vCwDPQ+8BtPlnGlHXlMjsR7uW5D355b0ba3L?=
 =?us-ascii?Q?B4TpKia86QEnZhczaETMvEzQ03eZFE1rdD7DibU7UG2oHwOAvR5axo1g+Drv?=
 =?us-ascii?Q?XejkEVEWKXHAB3YSHkSN1xLbqFBUe5k2T8gPHMK4ns3YQKZeKYEbwAwJ4bqj?=
 =?us-ascii?Q?u8v9XfD6aaCo4z6O675QZpmqepQmDHU8LovFG/i0JCPUBvNpe9FqqwThdBfy?=
 =?us-ascii?Q?XjiYJPgR9EPR/1GTaC3UsydxVYaRjT5dJGHbl5KoMJsRn9hPfDD6GFSFTD2Q?=
 =?us-ascii?Q?szothCE20MsAHOoHJHUonzBjtssB/dtEYvzd4xy87kKrY3O9sGko6tttDTpT?=
 =?us-ascii?Q?u8/SiDuIdNiesqnU4Ojyz7vqKzBHSabw1BHn57UDVGj61CMVhTq4R8mfgll9?=
 =?us-ascii?Q?RlT3Mz/FJxgmR/cMq/bIM009pZgObqS5VVx6oeGJ90hOZgyzN64ohp27yv2A?=
 =?us-ascii?Q?3w2ya6/qk9bxXQKtCMfTaUylieKWf7u8g7JJhr7RpIkQjCNbi7rqqT+FXT1C?=
 =?us-ascii?Q?vQDbP1rjT6aYV5XUItDPwn6IdVp2R51lIbp85EoIbRnZW3+eUcPg6npMrdj2?=
 =?us-ascii?Q?AjE255Oc7yWYbPA87lNA08WBIXYRcNuN3c4fArn3JronlgtOgXi+S61Qb8yN?=
 =?us-ascii?Q?9JbV9ld4BcL5BgjlL8ROSpD+kEkXdT2fBQQ7+04raIMhT4RdsMwkJEJoCR7J?=
 =?us-ascii?Q?Zb8rH8rPkzHS1vSg40yLd2O/J9BmJe+OV4LBpTDDYZjvyFkofigs+I4HRjY4?=
 =?us-ascii?Q?oRkbzrC+iSPKwT9dIw5PAwtj/RtCAaAixar70qHC9Hc7wSUr/8f9Qq2qF0q0?=
 =?us-ascii?Q?7tFLcfAlI8oag1A6aKBDY6GQp6Y3PfLEgMelG2wRfke+FsOTwjXt5ohRVtRb?=
 =?us-ascii?Q?t+axtBLb+i0Vl8EzkOXFwzkr3k6YRk1CwzK+aC9/LVPzc99GXYD7HQzx3DFz?=
 =?us-ascii?Q?VwTSm8lfpQ/SfjD2hAIaBLVILb/93bLii3McJ40b?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9dda281b-c9a3-491b-d110-08de3231322e
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Dec 2025 06:00:01.1166 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SbN8Zf4CtPF7XFoSDsdykXzIIq4IYNGHWekv9QCLFjY/gm9UrgqefSXmgDQzn1tdanyqD0GsKPa8oTY1bL07qw==
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

Hopper, Blackwell and later GPUs require a larger heap for WPR2.

Signed-off-by: John Hubbard <jhubbard@nvidia.com>
---
 drivers/gpu/nova-core/gsp/fw.rs | 49 +++++++++++++++++++++++++--------
 1 file changed, 38 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/nova-core/gsp/fw.rs b/drivers/gpu/nova-core/gsp/fw.rs
index 8d668a24142c..6b7afbd7d9b6 100644
--- a/drivers/gpu/nova-core/gsp/fw.rs
+++ b/drivers/gpu/nova-core/gsp/fw.rs
@@ -49,21 +49,35 @@ enum GspFwHeapParams {}
 /// Minimum required alignment for the GSP heap.
 const GSP_HEAP_ALIGNMENT: Alignment = Alignment::new::<{ 1 << 20 }>();
 
+// These constants override the generated bindings for architecture-specific heap sizing.
+//
+// 14MB for Hopper/Blackwell+.
+const GSP_FW_HEAP_PARAM_BASE_RM_SIZE_GH100: u64 = 14 * SZ_1M as u64;
+// 142MB client alloc for ~188MB total.
+const GSP_FW_HEAP_PARAM_CLIENT_ALLOC_SIZE_GH100: u64 = 142 * SZ_1M as u64;
+// Blackwell-specific minimum heap size (88 + 12 + 70 = 170MB)
+const GSP_FW_HEAP_SIZE_OVERRIDE_LIBOS3_BAREMETAL_MIN_MB_BLACKWELL: u64 = 170;
+
 impl GspFwHeapParams {
     /// Returns the amount of GSP-RM heap memory used during GSP-RM boot and initialization (up to
     /// and including the first client subdevice allocation).
-    fn base_rm_size(_chipset: Chipset) -> u64 {
-        // TODO: this needs to be updated to return the correct value for Hopper+ once support for
-        // them is added:
-        // u64::from(bindings::GSP_FW_HEAP_PARAM_BASE_RM_SIZE_GH100)
-        u64::from(bindings::GSP_FW_HEAP_PARAM_BASE_RM_SIZE_TU10X)
+    fn base_rm_size(chipset: Chipset) -> u64 {
+        if chipset.needs_large_reserved_mem() {
+            GSP_FW_HEAP_PARAM_BASE_RM_SIZE_GH100
+        } else {
+            u64::from(bindings::GSP_FW_HEAP_PARAM_BASE_RM_SIZE_TU10X)
+        }
     }
 
     /// Returns the amount of heap memory required to support a single channel allocation.
-    fn client_alloc_size() -> u64 {
-        u64::from(bindings::GSP_FW_HEAP_PARAM_CLIENT_ALLOC_SIZE)
-            .align_up(GSP_HEAP_ALIGNMENT)
-            .unwrap_or(u64::MAX)
+    fn client_alloc_size(chipset: Chipset) -> u64 {
+        if chipset.needs_large_reserved_mem() {
+            GSP_FW_HEAP_PARAM_CLIENT_ALLOC_SIZE_GH100
+        } else {
+            u64::from(bindings::GSP_FW_HEAP_PARAM_CLIENT_ALLOC_SIZE)
+        }
+        .align_up(GSP_HEAP_ALIGNMENT)
+        .unwrap_or(u64::MAX)
     }
 
     /// Returns the amount of memory to reserve for management purposes for a framebuffer of size
@@ -106,12 +120,25 @@ impl LibosParams {
                 * num::usize_as_u64(SZ_1M),
     };
 
+    /// Hopper/Blackwell+ GPUs need a larger minimum heap size than the bindings specify.
+    /// The r570 bindings set LIBOS3_BAREMETAL_MIN_MB to 88MB, but Hopper/Blackwell+ actually
+    /// requires 170MB (88 + 12 + 70).
+    const LIBOS_BLACKWELL: LibosParams = LibosParams {
+        carveout_size: num::u32_as_u64(bindings::GSP_FW_HEAP_PARAM_OS_SIZE_LIBOS3_BAREMETAL),
+        allowed_heap_size: GSP_FW_HEAP_SIZE_OVERRIDE_LIBOS3_BAREMETAL_MIN_MB_BLACKWELL
+            * num::usize_as_u64(SZ_1M)
+            ..num::u32_as_u64(bindings::GSP_FW_HEAP_SIZE_OVERRIDE_LIBOS3_BAREMETAL_MAX_MB)
+                * num::usize_as_u64(SZ_1M),
+    };
+
     /// Returns the libos parameters corresponding to `chipset`.
     pub(crate) fn from_chipset(chipset: Chipset) -> &'static LibosParams {
         if chipset < Chipset::GA102 {
             &Self::LIBOS2
-        } else {
+        } else if chipset < Chipset::GH100 {
             &Self::LIBOS3
+        } else {
+            &Self::LIBOS_BLACKWELL
         }
     }
 
@@ -124,7 +151,7 @@ pub(crate) fn wpr_heap_size(&self, chipset: Chipset, fb_size: u64) -> u64 {
             // RM boot working memory,
             .saturating_add(GspFwHeapParams::base_rm_size(chipset))
             // One RM client,
-            .saturating_add(GspFwHeapParams::client_alloc_size())
+            .saturating_add(GspFwHeapParams::client_alloc_size(chipset))
             // Overhead for memory management.
             .saturating_add(GspFwHeapParams::management_overhead(fb_size))
             // Clamp to the supported heap sizes.
-- 
2.52.0

