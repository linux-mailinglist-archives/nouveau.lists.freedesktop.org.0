Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BD2B7C87B99
	for <lists+nouveau@lfdr.de>; Wed, 26 Nov 2025 02:41:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4612710E4EB;
	Wed, 26 Nov 2025 01:41:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="QvwHYFFH";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from CY3PR05CU001.outbound.protection.outlook.com
 (mail-westcentralusazon11013003.outbound.protection.outlook.com
 [40.93.201.3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4258B10E4E2
 for <nouveau@lists.freedesktop.org>; Wed, 26 Nov 2025 01:40:59 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ij8JYAfS5XloMjZQzh1nDigJoy6RkghzZQKZU7jrj52hH39MrC3IEWwOesRMM6tgq8ujMHzO80RZeu5baUpc1wMFuU4HcyG7XXvu/Z2RrNE1/ZhKBowBiUI+n7dz/s7fYHHamUzTybAgbXJIzte5eOxcZz5rMbKUvk7nFguoCqO2fg5/HKaxBMdJDuNB0rO8l1phYjCv1xysOxNh19Acrf7Gi6e0HGvqvldQp8bUwOUt+yGJYP6lfNy9T3LTQmQuBufqasMnC56zEfkVjUpxwqi5DnNoenV1dVc9sWEFlS0tPMI+4kqaSL8LiFst7TASOcuWf7gkRwHkfyPrR8TZiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XbwIPLOSpSuSX6iuNz2sv7q1IcyLr0C7nSpj1kl0nyY=;
 b=m8kZLpfyJbdLnDahpdblcWipYhFwnMFek/d2PhCczOQEn7YVWokGtBujlx3cb2e1G9+xiQ9rGha/yznklA4Thog+f8R0y21lnnZvP62t8lla2GiXaWQOrFGrSXEbb2KztrRgxezK8EcG33C/1POxj6lO3Cuy9VqLEBL+gr0N+QDtTEJsPmuyHRF2mwIu2TTN1BLbyCGW+byT58tPXD2JOfVptW6nYCppnOIkCaB+NSmbGlGFMOVQZUhQQWXOD0wLaZnsWrALNx61k0V8DRIdhUKlLM5QwQLzih0+o9MkEj8y0X9bZLqv6kLYK9v+22uUjPdJskx63DKXRJAm8HyO1A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XbwIPLOSpSuSX6iuNz2sv7q1IcyLr0C7nSpj1kl0nyY=;
 b=QvwHYFFH8NNKyduCESoCihy7an7tU9pZ2Gr71146XKPPyySu8b9rLZjDlXyM+LS1h5Ro/XTHVEdcvDwuprWunmE10YDSjP51p5NecJLHMfxJgZG103+X5WSsBwRvTSdt7W1XhglY0zatsfE/CHYLmP6+jx+V3GtR+jxcjFEg87r6B+4L0OTXLptkMPBw5J2gyMtB3t6pJEK3Rmr1yNO1s7uK9/2jvunqq8IBd1cnVmOeHOh7ujVNpQG8Mvz682f94vFs1vl8v++b9Kv3jtFsmh2bnHjF8gSyzJ/wee59UK6+utR2NMoSmALwDaTz1ksNOceHvv4yc25AIcch4QCMBg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 SA3PR12MB8022.namprd12.prod.outlook.com (2603:10b6:806:307::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9343.17; Wed, 26 Nov 2025 01:39:44 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%7]) with mapi id 15.20.9343.016; Wed, 26 Nov 2025
 01:39:44 +0000
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
Subject: [PATCH v2 4/5] nova-core: factor .fwsignature* selection into a new
 get_gsp_sigs_section()
Date: Tue, 25 Nov 2025 17:39:35 -0800
Message-ID: <20251126013936.650678-5-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251126013936.650678-1-jhubbard@nvidia.com>
References: <20251126013936.650678-1-jhubbard@nvidia.com>
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY3PR05CA0013.namprd05.prod.outlook.com
 (2603:10b6:a03:254::18) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|SA3PR12MB8022:EE_
X-MS-Office365-Filtering-Correlation-Id: eeb73a88-70f2-4695-9618-08de2c8cac91
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|7416014|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?a8iN66tWTHed4Bun+BRGv4z4Od8qORBHqyupqdNnhK2MbM542yKW9uSIovaW?=
 =?us-ascii?Q?hjUdgN05Oy/l0xbV9zzEXG/7aWfw9n3poh6mifCw+KAfqP/qZHtQCYeeAssg?=
 =?us-ascii?Q?QQcTtTmnlLYeoysanhdmrgidbYIRc4jPT30nt9Bh+1umcS2HUwujZaeXCU5v?=
 =?us-ascii?Q?KC5OTKLvBKRsFGHJl2ZaFvhMNx30hI2tMTa6adjeMyicxnHxi2QgIltn7Fkg?=
 =?us-ascii?Q?KgVAzOFYrDoY7UUR2TKAMcdz1lgVVdFfNeCAM7gp5R+RE+ltbUtEQQrqSsdi?=
 =?us-ascii?Q?EqE79DbnRhYT6ojjXdFTQTFNYPfy0aD66/xmEwA6Scg5EvsnKFFFJYS0rY4K?=
 =?us-ascii?Q?G9cyaiHVxJiTJsxMFmaFF+Ej4TPXWgQ9st4OH0d/Wq+R1IMQdvKUYqx5Td3P?=
 =?us-ascii?Q?syoX13qIufpvryfPiiPhJW9uuF3zpIOu1DWdcxwvDzh+BYCxDJn/PF/XD9C7?=
 =?us-ascii?Q?qdOYurORKTdTBtMvkBH0sB1LOkWwRTTiCBtjdKXOmZIrS3CI9ykxNW9nUtDq?=
 =?us-ascii?Q?Ufrd7ELr0YvDYbbmQ26UdTyoH8WlmUR9/36xLt4Zmw0Zuai9GxywCB/hcOw0?=
 =?us-ascii?Q?GMTqlHuq+xmjOGgdq6avZnJCX8cElqdPVfmEbJFj69sRb/9N+BSniR9kEUoO?=
 =?us-ascii?Q?cQhnt0PrFStE1HRFPmxid263TE14lzkJtfZScw3R5wn0bkG6Fadi5sPZq9oY?=
 =?us-ascii?Q?x8yZfEZADGbwju4PwWmQ8pRuQkNcxRZj6/9p6rxVIViWUqqlIBFg6cbZat62?=
 =?us-ascii?Q?Te/fgMVbq0FUGjO26Ya2o9LUpJrj38tqqETkuA7Lazg8U3OLvtluQOby3wxr?=
 =?us-ascii?Q?VHQTsOyoLxTdQrz0Lpe0WQo95f0pA+l16kXJkEhBCHe5kdoNCBJ6AcCE7ccz?=
 =?us-ascii?Q?BksICgmswfScb5Sq5GGlc+grF8OpYM4GlnKw8zPWpQ5zl/0tnR6qaFRHVWHm?=
 =?us-ascii?Q?TUotm3xh3GzEEEdeJqHVAg7R+rP1UmrfNySrdH7iKEqXrXEqlLrQX/vOqCya?=
 =?us-ascii?Q?lYTZH8xfOKWi/0G/JWiAX2z+1brsnwSVc2YekbzL0nEPgUlaeRbMKarJD+Da?=
 =?us-ascii?Q?fvGJmHuSXo4EMuYvtslG/k1jsu9rhakQZFIWwwrktbcO+iOSuJgyclTEhIus?=
 =?us-ascii?Q?sFojBS3T+KwhEnKWtBRXSVDUy8ARrK6kFJZrLueXKeYARbUF57nrGfsf01TD?=
 =?us-ascii?Q?fzbfvECCLNlSBPFHuwpVHqd4DyWOxW3uUfR4co7Bh+E5F1fmrz5MmPQgqOUv?=
 =?us-ascii?Q?jlT8EYBNF6EjWJpmflS6L2TxSBSlV3YTy1ikrW48oNQYxr5LgkbSxgfIUgTu?=
 =?us-ascii?Q?bvdSru+6wll62emF/WWbqXjsqGuL1FzsJydhkb1MdidsQ+Mdl8VaBhj0qfoM?=
 =?us-ascii?Q?dMa4fGKJlgNzKRTV3vPkaXIboH1G4/SShGMxZeR8v6RS1LiO4Amw2RBb2A72?=
 =?us-ascii?Q?pCiaI/TRyw+/1OcLpneNntcb3wVcfezU?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM3PR12MB9416.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(7416014)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?P03rzgSx1Pci5YpYrdWw6qUx32k/TyvxHlSCRVBkYbRyBn0pgXvSWkRNM3mu?=
 =?us-ascii?Q?jn3byNhfRE9gaJp+zpHEGMUuRXPDPSmn9vsA6+GGRaBAm2YxcCiaDs9IKvzP?=
 =?us-ascii?Q?LZnG4le+75PmblDO+ThQB5CLyAHkIlzJP+ipOzmqJEkLUR4wIL58gmc+uw9O?=
 =?us-ascii?Q?ukt+q8wbeeOTYoAgILhIsm8UUrLiktvLxdDqNpR9jyE42S5J42s+FSLOPHCA?=
 =?us-ascii?Q?48ue2hQCKtirKvFyCieOhSd+mNvW3gY8CduOz640bXwocDXEU/spq0fBOY/h?=
 =?us-ascii?Q?crP3cZFhbSccQhv9YghL6xyF7zw8EDPQhnc9acNzmt6Qm18+fqPMHwxW6g45?=
 =?us-ascii?Q?o5iz6DQPLnrwenZaNdtXbpuFdJgKPWweSPWe5cesqrJQSI0Q4kZDnMwKuqf9?=
 =?us-ascii?Q?P9qXWw5DWwag12mLv+5pkL6tesKULla2o3GiBwLB0ka9deEyzA8HtX7+7+/l?=
 =?us-ascii?Q?Cf1+bmrGBTcCkG5QfcCHZVZAEFN5H84HzBRJ1pQo+MjR4zM32UNzPcMsizEY?=
 =?us-ascii?Q?/MEiGDsEfl/ZFA94+THgZe/EJyIPbz3F2u3tUwF/eorin/ibCCohK//qn1ha?=
 =?us-ascii?Q?AY/Du37ffx2+JhODypWl17JsgDh8LEDfHyZejJfn8M6uS65djNVKiobgpyPJ?=
 =?us-ascii?Q?R/2OCAzhPiPfE2UXJcoTxdPvc5aorCUercIPd1OQHi1r/Ui7Q/xuXvviW8Dk?=
 =?us-ascii?Q?i1rGPvJ0CCB0W3lRdSdZkX4GOhieI5AjgDULvCQ9b/0KETjp40Bns904vA7d?=
 =?us-ascii?Q?1vbW0bzZAdowTdjfLbpVkDhC19ftssnZ/qpjLJorT/0lF2FueJ6M3tiMoD92?=
 =?us-ascii?Q?mh/we4nM+9+JA6qySqNM+hZ2/NTsmHJDG4iZO68EtUbuRqy436P7yk0C2CBr?=
 =?us-ascii?Q?mmK17IwjRU4vDMcAvKsojZ4xxbK11YQt/IHzL9WV9NTTSwRwjwPNZQfuEoVn?=
 =?us-ascii?Q?iNJYEHtndt+YtyXeeDSwO/wU63aiPVekQbtWoisT1bvMlhm7GtL5ASKQfdGD?=
 =?us-ascii?Q?5HVwxt74HGFf/kUjUzGUtxQsUZLROYE4gJTea7o/mjquNsAD+27YbVOSnN17?=
 =?us-ascii?Q?QKr8hqVSBRxjOEYbx0Z+6y1+SoS/hIxMDHhdy4TZW5kHY0yrEZrs+L/UmBfA?=
 =?us-ascii?Q?rpm5BxcxLJMH3D+C+4iF9nLTDQfQHn4wdDx6Q4b+o9SQRQ9ddqM/OSCNbaV3?=
 =?us-ascii?Q?VFsZuv2z/vkbK2lhmNY6SwYU/U8QE1uucUqyiOiO7hd2IsOTrK7+vpiRTPBO?=
 =?us-ascii?Q?2d3AcKhywb3KBpNb6Tr/kXxpFvqRDYrCn+/16BBz54ZwUv4EONlKlwK+vULN?=
 =?us-ascii?Q?J0L+rfWl+iDqjqpta+HR9fI11R2BqIvSfole+17mRHkQIO2HXtLGuhtnkedb?=
 =?us-ascii?Q?/fbchN6WLkHfnw1IvQwtRF97NeaQJFnEvpawtkGSgROyPmRyPJFYk/IP8AsZ?=
 =?us-ascii?Q?TB8wLLx9jGaBDbvYC8pMY6/Vjau77XKOP5YzLBPEr//RUSZp3i+1eSPV3xGK?=
 =?us-ascii?Q?wEJc8euckBDrbCA+2f5ezQJgyGnbdpIawKavcfCeJG30TzHHh8MmhSL+cJbC?=
 =?us-ascii?Q?CBcj/zA59m2W501VejHSIyf2K3lN0YBagTufg6ld?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eeb73a88-70f2-4695-9618-08de2c8cac91
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Nov 2025 01:39:43.6981 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XXrHfQyyxZD8DZq/13sGu+Q9W4BSipmeyW/V2kByMvyOydOdAuzAvKNnJNna9dxc2BdQlIn3NE6Yc3iHayvMWw==
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

Keep Gsp::new() from getting too cluttered, by factoring out the
selection of .fwsignature* items. This will continue to grow as we add
GPUs.

Signed-off-by: John Hubbard <jhubbard@nvidia.com>
---
 drivers/gpu/nova-core/firmware/gsp.rs | 43 ++++++++++++++-------------
 1 file changed, 23 insertions(+), 20 deletions(-)

diff --git a/drivers/gpu/nova-core/firmware/gsp.rs b/drivers/gpu/nova-core/firmware/gsp.rs
index 547f46b6655b..86ed4d650d05 100644
--- a/drivers/gpu/nova-core/firmware/gsp.rs
+++ b/drivers/gpu/nova-core/firmware/gsp.rs
@@ -151,39 +151,42 @@ pub(crate) struct GspFirmware {
 }
 
 impl GspFirmware {
-    /// Loads the GSP firmware binaries, map them into `dev`'s address-space, and creates the page
-    /// tables expected by the GSP bootloader to load it.
-    pub(crate) fn new<'a, 'b>(
-        dev: &'a device::Device<device::Bound>,
-        chipset: Chipset,
-        ver: &'b str,
-    ) -> Result<impl PinInit<Self, Error> + 'a> {
-        let fw = super::request_firmware(dev, chipset, "gsp", ver)?;
-
-        let fw_section = elf::elf64_section(fw.data(), ".fwimage").ok_or(EINVAL)?;
-
-        let sigs_section = match chipset.arch() {
-            Architecture::Ampere => ".fwsignature_ga10x",
-            Architecture::Hopper => ".fwsignature_gh10x",
-            Architecture::Ada => ".fwsignature_ad10x",
+    fn get_gsp_sigs_section(chipset: Chipset) -> Result<&'static str> {
+        match chipset.arch() {
+            Architecture::Ampere => Ok(".fwsignature_ga10x"),
+            Architecture::Hopper => Ok(".fwsignature_gh10x"),
+            Architecture::Ada => Ok(".fwsignature_ad10x"),
             Architecture::Blackwell => {
                 // Distinguish between GB10x and GB20x series
                 match chipset {
                     // GB10x series: GB100, GB102
-                    Chipset::GB100 | Chipset::GB102 => ".fwsignature_gb10x",
+                    Chipset::GB100 | Chipset::GB102 => Ok(".fwsignature_gb10x"),
                     // GB20x series: GB202, GB203, GB205, GB206, GB207
                     Chipset::GB202
                     | Chipset::GB203
                     | Chipset::GB205
                     | Chipset::GB206
-                    | Chipset::GB207 => ".fwsignature_gb20x",
+                    | Chipset::GB207 => Ok(".fwsignature_gb20x"),
                     // Non-Blackwell chipsets, which can't happen here, but Rust doesn't know that.
-                    _ => return Err(ENOTSUPP),
+                    _ => Err(ENOTSUPP),
                 }
             }
+            _ => Err(ENOTSUPP),
+        }
+    }
 
-            _ => return Err(ENOTSUPP),
-        };
+    /// Loads the GSP firmware binaries, map them into `dev`'s address-space, and creates the page
+    /// tables expected by the GSP bootloader to load it.
+    pub(crate) fn new<'a, 'b>(
+        dev: &'a device::Device<device::Bound>,
+        chipset: Chipset,
+        ver: &'b str,
+    ) -> Result<impl PinInit<Self, Error> + 'a> {
+        let fw = super::request_firmware(dev, chipset, "gsp", ver)?;
+
+        let fw_section = elf::elf64_section(fw.data(), ".fwimage").ok_or(EINVAL)?;
+
+        let sigs_section = Self::get_gsp_sigs_section(chipset)?;
         let signatures = elf::elf64_section(fw.data(), sigs_section)
             .ok_or(EINVAL)
             .and_then(|data| DmaObject::from_data(dev, data))?;
-- 
2.52.0

