Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 24E0FC5B055
	for <lists+nouveau@lfdr.de>; Fri, 14 Nov 2025 03:41:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D7D010E98A;
	Fri, 14 Nov 2025 02:41:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="Au3O177k";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from SN4PR0501CU005.outbound.protection.outlook.com
 (mail-southcentralusazon11011024.outbound.protection.outlook.com
 [40.93.194.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB2B510E98C
 for <nouveau@lists.freedesktop.org>; Fri, 14 Nov 2025 02:41:21 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LNrUKnGTEH/UpvTC3GqeYHuwoI6pV7pzDnyh0oOhs4Gq584tUTwuaFQBfcYpKm8D9txmcVl8NprUk+xbaL6uCGgcmjU862j35X520UogvQ1zyY2aFAtjyW+MvSnNSKt3ISnEEVPHae74rzZpmldY+AZMG4/c3KpvN73svFkIZdrJUpeiS3fKCDUuYy5fMcF9KyVBbLYMBkwIGXMPp/1LPQYKLRIrZrUkOB7aok/Y4mcPq3XSiyJ5njJ7qKDlsPsEyHtMDXvzLYu7BGz73v+gYZEKoqByg6yi+GuQrJShtFexKiAaMG/xcawShTXY2u2LeHfOsGw70WdnzFcu34zMfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pHDrGxFk1xXwl+7Zo7GfldaIueCCLzTq10XDUjZjm/U=;
 b=tJLyshgOu82uSt792NcuVioVZlKeVj7OGSmUUSYZZwgv6+4GKqm0vYPGqn/HIdpqt2w214Enx/mMgJ3L8PE5s/FF0yqvH9SkmKWOff//pccoMaSN/X3s2H+1pkdU28MXHjXHIBYbKSWb7AwbFDxsOJHZA5YNdEy3gNNUBC8pYsbfO58uCDBPybqX1GP7RQMvlNb3Q2S+gMa0e1H2YBLnSIPrTUlmbv4cUI3GZhBT1DyRZEYf22NesFAzuxTz3RDES33CVOxzzyc857+qR/X6f2NiQVE2kvS9Za9FrYo6eCU+co02WDYxDs1NbXlkYMVpsJ5k+TfLQsasaN1S219Agg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pHDrGxFk1xXwl+7Zo7GfldaIueCCLzTq10XDUjZjm/U=;
 b=Au3O177kTCnI8tdaf5j/TPPO4m8GNGyIIRiOAh2uZebRZTr7Wwy1foPb7j9ME4zr07o+yduJAW+ztC9/E7tD6TJjV0C8odHBVNKpHcTlPjXOFnbvZHoL71GdVk4llhK650X/TKVal1NM/iNcHJQR8HE2XRAgp71y6FHroHZFW+mesoymUFGGS1KMg6WK54zWdZXTEJLOQIy8FwEnWVr5Awn1dy0hV0fmvLJcQIGNJHKKKYtrxPITgQVsEsR8eLTECvh2horft2dGmjjXgYCr4lZglFGFQl+ndT0D8c5XCmWPTFsVs7e4AzohL9R6pLVSSGMMhrcsjB0wOCbb6n9jsg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 PH7PR12MB7986.namprd12.prod.outlook.com (2603:10b6:510:27d::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.17; Fri, 14 Nov
 2025 02:41:19 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::d622:b3e9:bfe1:26bb]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::d622:b3e9:bfe1:26bb%7]) with mapi id 15.20.9320.013; Fri, 14 Nov 2025
 02:41:19 +0000
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
Subject: [PATCH v8 6/6] gpu: nova-core: provide a clear error report for
 unsupported GPUs
Date: Thu, 13 Nov 2025 18:41:09 -0800
Message-ID: <20251114024109.465136-7-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20251114024109.465136-1-jhubbard@nvidia.com>
References: <20251114024109.465136-1-jhubbard@nvidia.com>
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0P220CA0005.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:41b::12) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|PH7PR12MB7986:EE_
X-MS-Office365-Filtering-Correlation-Id: 781e39dd-e6fa-4af9-71cf-08de23274a5f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|376014|366016|1800799024|7053199007; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?P/uBX2G2Axs15QoDTfsX7807bQcwYXRXqG7s8cHbmJ40PrkcNlJb4SJjJK13?=
 =?us-ascii?Q?otAtVLAEDpZqobm/ye4zVOOJy/WOhA2HG9koyXwG3JR56ZAY2EG6rVeLCdCV?=
 =?us-ascii?Q?GeRfjpensxb1Ni+lCni6/J8U3CG/5asmZ4FY5fEBJYBygJdMC3JlhAcfrLhc?=
 =?us-ascii?Q?9yLHmSYzgzwtVFFICZUohcJlzBg4xBVSXsAzUxr5a3qutftylu12qzi0DwfL?=
 =?us-ascii?Q?TxX0mHbGhCH191uKtyp65R9mNois+6JwgVxGgOpNsZ8YOOFk8enBg1jxbwiy?=
 =?us-ascii?Q?ljAzNWRHF6kUCrza8NSD48G3RcZ/sK7MKVmDyo/wxdVDCRZQ9j1shbCrRxYZ?=
 =?us-ascii?Q?hAfxKPm3cPjceRtCelmfbHiGsZaYOu1VOWEUdQqY1NJOQ8v+fWlLBzeT8Igg?=
 =?us-ascii?Q?REbk1ky01B5A8ky666hojoK+4RLnhfHCt4xSm84pUAaRFcO6PYx9LbWuppgB?=
 =?us-ascii?Q?gjexkPNuHZYbSXHcul136jmlWMNIsDujqFTlh3XgFU/N0MFXm7n3Js3nEFDH?=
 =?us-ascii?Q?+vikdH9Yy88mDLTSriyNINtJ5N0E0Ip8fG61fzre2FGN+GU3eDLNoDJfPK1Z?=
 =?us-ascii?Q?zxFa0N1a0yEtbzW2yJ81Kk+7F+niv52+2OWNOG8rx+6kQQTs8nC7cpc99XkR?=
 =?us-ascii?Q?rIqkaFnYyxSeEH/35GgWrEMMRN37nBjKLjZdVCVGa10iCV8QSXFAp+OFlsXz?=
 =?us-ascii?Q?4K6khhi/hZ8c7fnY1uAhWWeyCeemoSN/rx78Q0JHVpyx9ct47wC/UIYbk8qy?=
 =?us-ascii?Q?R4R77666L3xcP1crUMenQ+9SUqvqfGOmB8GbFggtvgm1WiPIG3LLHN6EGhYS?=
 =?us-ascii?Q?Yr9VcbBrpv9LvozI3LuhaVG2fdyNMs3KHEMY8LxPwRKqRn839Qk7RF/CCExU?=
 =?us-ascii?Q?/saeFxOakuk7eFDdXV/lhTJZTIeG0iSEqo0QnBvRxH6uRdPh8oErLLrK/U/a?=
 =?us-ascii?Q?Yl/HDXeA4u6Nmmh6otcrZdN2zsdFKaCT+kqDSYJxJRzbWN2NzOW0qV6jGoOK?=
 =?us-ascii?Q?XCMBRGKlYq3ljB37fYB8g9PirBaKalzcwl/zQMR7lUKBrKMkZbLyEOW9cgaY?=
 =?us-ascii?Q?u3QBgBfsuErVXky0/988BRDNr/1vXGY3KWmP5+LTpfwlLLX0WC8PyI6fogmy?=
 =?us-ascii?Q?NWSdSddlEWtDuMOBw6+P2N4u0iNqiMrhZ6PnJ5NPcxFQlHZf4fwRIvUzDGCI?=
 =?us-ascii?Q?PSvq14bry8b9EEQaePU/wBBjcuYxa5dbye/YLVlaaweifb0G7/Bccq+FPyP9?=
 =?us-ascii?Q?vnDD1GX14RDs50adaOsnCFK/5pt3Ii6fQGx2e0+VY33PwIJ8L5wFFXhho1In?=
 =?us-ascii?Q?NrWAG5TDjW0zmr4yIRxVnVJRSOS55Lte1x2ZTvRsJBEAHmSA/IZCBLBgOvzi?=
 =?us-ascii?Q?mM0r4CA/zNXmaMT07NTyMq6FwFrC2RpGxeqnsZ9say4aA/S5sGZoiqCDrjxS?=
 =?us-ascii?Q?ZA77h/SDHZxOdd14a6DR3bEdcxUnG3T2?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM3PR12MB9416.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(366016)(1800799024)(7053199007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?s+YZHz/FqbyWlQZNXYlg8al8jaDtvsRqnWT4+km3e3KUVzDsqyQ91l2m4gzm?=
 =?us-ascii?Q?CTEtucGnsoXJnY/FJIrwz7gcVP7zLhE7TWJrGYGpAXsgCo13I+wyNAiI+evD?=
 =?us-ascii?Q?al4Kw4A1mFGvi31dzeV4kSqdHPlHfq4VtBzDcr/+FZJoiyq93UG4mtNaFrrh?=
 =?us-ascii?Q?XioQMUsSd/GAy8JbYxmuqixBoS/dUcYXKzmtqgZnzb77vJm7vDrpDlzas0o7?=
 =?us-ascii?Q?ctyVVFBYy3g0Qz6FTn5S8z5hdcZID6N7xJzCbK3KyXzKE/u57B8FpwBYBFCl?=
 =?us-ascii?Q?6/fiGlP/2iU5EwA+Ljoidy6NpOFOVUhKcuE/ouOSa050PsnWFISQmDQ/U5Zo?=
 =?us-ascii?Q?3DWW/kTMHGLCvzHCjGhI8wWZKDPygP1TU6fMPCDKm4LbSRdjf+SIXm8ApVhU?=
 =?us-ascii?Q?RrkrdSONluzWviIbaN9Z4NCYdsqE0rlNFxhvmTM7eSL8fHCcv3/+MidZ0h2N?=
 =?us-ascii?Q?q2ls9ozSo0izyZaH+StiPU9lU8xh3hi7PK559DFVc7lQODUZtSXb/0YB6QkT?=
 =?us-ascii?Q?vI+cyUmNTbLieXkwPmnVMHdC7BwIouUI0Qj1xMBoWnWMsS0XR8xGfIR9Dej4?=
 =?us-ascii?Q?Ymutx71EH1hGIkudIEaQO6Dc3OKc42JXIdAKCxTqUFFWXAnNL1vbj1+TUMG/?=
 =?us-ascii?Q?Km920cTSGECBdh8Ld3M2VI9lxL6FbqZUZ+C5CaBAAKsmUkka9qvIAJ00jNvr?=
 =?us-ascii?Q?ztdKxJ+08X/J0AqcHVyhgF02D7e+sXu74AjA6GIdX6mQDC18TWQgKm3h3wv2?=
 =?us-ascii?Q?+kycx/9hNa7ss30n3b1m2K4yu1xVz8Oz+OCnncy8pWJDjKMf13UhleRXZx6e?=
 =?us-ascii?Q?iEPBhK0OLb7FVnLrGy1CnmtCooDmiCOXmzyFd8M29J3sVAbn5/JzGbsU+AJ/?=
 =?us-ascii?Q?RQBHTlje1GuK9WBvny65hi5aJcDprQf14/+K3feBAmWiefuU+uh1FAfB5Lne?=
 =?us-ascii?Q?YdowhIoOHYyjgncmnZeiG5ObIeFyUVGhpA/Bn5ukbopvBsgPdC6FP0q4ippf?=
 =?us-ascii?Q?ogF9NgKpE2CYsWRJoP5j3Zj1zgPIjP634N/+qcwi4MoOgKGZxQOI9b6W6TZ3?=
 =?us-ascii?Q?UVK5wh9w8DFJDoUIGxjG5xCvdEdTcvufDCGrJFAG1L4Fs1EmdaagKmbGbOXy?=
 =?us-ascii?Q?F0EDyq+ATX3VuX7EdFaWmbrISe7vfEADyG5hY7rWSlHDajDp+FernhjErHaC?=
 =?us-ascii?Q?pd/WwxQG+jdOTMuO3DIEd0t1iGUvQOoVRUMxbSnWSB7agYvoJsjBS2JIxbXg?=
 =?us-ascii?Q?NpcRJe2iyG4TQUtPYFLExIz+Ez9a7H8r4QKoNP6YtKk+/QCbH6vQgXWKggfW?=
 =?us-ascii?Q?hry+spJTtEU3UYDnDmzcO6bGAMGkSLP+HBeu4svQGCes5TWiSTyNiy97S98S?=
 =?us-ascii?Q?9gV5KvGt30DldLvyBvTWYPEejk2E43pf1WbVXsCwXvGrdsGuUNBd5S94CsGD?=
 =?us-ascii?Q?XbMLDQ43N42QHeIBMLAmRN+Y6CvirHufc3Pctew7R96OguI7JkQUAUUmJDjW?=
 =?us-ascii?Q?/ie3dJ7vXnmwgbUh8MW23GwDOEyU0svFnoULzVuemv6oWlPnpP81AGyH6Xfj?=
 =?us-ascii?Q?UhOaMIaUcdiKmI0DSanq6TfJZSksPBB/6JMvZiLC?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 781e39dd-e6fa-4af9-71cf-08de23274a5f
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Nov 2025 02:41:19.3459 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: q3loe0QP6CEWbxwO2OIPCIB9Ua6DLnzdMjUEAXO1BRLhKh2+NDuCkj2knEuSqtZ7PfI75Z53D/10+OPlQxDL+A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7986
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

Pass in a PCI device to Spec::new(), and provide a Display
implementation for boot42, in order to provide a clear, concise report
of what happened: the driver read NV_PMC_BOOT42, and found that the GPU
is not supported.

For very old GPUs (older than Fermi), the driver still returns ENOTSUPP,
but it does so without a driver-specific dmesg report. That is exactly
appropriate, because if such a GPU is installed, it can only be
supported by Nouveau. And if so, the user is not helped by additional
error messages from Nova.

Here's the full dmesg output for a Blackwell (not yet supported) GPU:

NovaCore 0000:01:00.0: Probe Nova Core GPU driver.
NovaCore 0000:01:00.0: Unsupported chipset: boot42 = 0x1b2a1000 (architecture 0x1b, implementation 0x2)
NovaCore 0000:01:00.0: probe with driver NovaCore failed with error -524

Cc: Alexandre Courbot <acourbot@nvidia.com>
Cc: Danilo Krummrich <dakr@kernel.org>
Cc: Timur Tabi <ttabi@nvidia.com>
Cc: Joel Fernandes <joelagnelf@nvidia.com>
Signed-off-by: John Hubbard <jhubbard@nvidia.com>
---
 drivers/gpu/nova-core/gpu.rs  |  9 ++++++---
 drivers/gpu/nova-core/regs.rs | 18 ++++++++++++++++++
 2 files changed, 24 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/nova-core/gpu.rs b/drivers/gpu/nova-core/gpu.rs
index 9bc94811741c..7f8a5c1ed9f1 100644
--- a/drivers/gpu/nova-core/gpu.rs
+++ b/drivers/gpu/nova-core/gpu.rs
@@ -173,7 +173,7 @@ pub(crate) struct Spec {
 }
 
 impl Spec {
-    fn new(bar: &Bar0) -> Result<Spec> {
+    fn new(dev: &device::Device, bar: &Bar0) -> Result<Spec> {
         // Some brief notes about boot0 and boot42, in chronological order:
         //
         // NV04 through NV50:
@@ -198,7 +198,10 @@ fn new(bar: &Bar0) -> Result<Spec> {
             return Err(ENOTSUPP);
         }
 
-        Spec::try_from(regs::NV_PMC_BOOT_42::read(bar))
+        let boot42 = regs::NV_PMC_BOOT_42::read(bar);
+        Spec::try_from(boot42).inspect_err(|_| {
+            dev_err!(dev, "Unsupported chipset: {}\n", boot42);
+        })
     }
 }
 
@@ -250,7 +253,7 @@ pub(crate) fn new<'a>(
         bar: &'a Bar0,
     ) -> impl PinInit<Self, Error> + 'a {
         try_pin_init!(Self {
-            spec: Spec::new(bar).inspect(|spec| {
+            spec: Spec::new(pdev.as_ref(), bar).inspect(|spec| {
                 dev_info!(pdev.as_ref(),"NVIDIA ({})\n", spec);
             })?,
 
diff --git a/drivers/gpu/nova-core/regs.rs b/drivers/gpu/nova-core/regs.rs
index 81097e83c276..d6da8bc2e242 100644
--- a/drivers/gpu/nova-core/regs.rs
+++ b/drivers/gpu/nova-core/regs.rs
@@ -68,6 +68,12 @@ pub(crate) fn chipset(self) -> Result<Chipset> {
             .and_then(Chipset::try_from)
     }
 
+    /// Returns the raw architecture value from the register.
+    fn architecture_raw(self) -> u8 {
+        ((self.0 >> Self::ARCHITECTURE_RANGE.start()) & ((1 << Self::ARCHITECTURE_RANGE.len()) - 1))
+            as u8
+    }
+
     /// Returns the revision information of the chip.
     pub(crate) fn revision(self) -> Revision {
         Revision {
@@ -77,6 +83,18 @@ pub(crate) fn revision(self) -> Revision {
     }
 }
 
+impl kernel::fmt::Display for NV_PMC_BOOT_42 {
+    fn fmt(&self, f: &mut kernel::fmt::Formatter<'_>) -> kernel::fmt::Result {
+        write!(
+            f,
+            "boot42 = 0x{:08x} (architecture 0x{:x}, implementation 0x{:x})",
+            self.0,
+            self.architecture_raw(),
+            self.implementation()
+        )
+    }
+}
+
 // PBUS
 
 register!(NV_PBUS_SW_SCRATCH @ 0x00001400[64]  {});
-- 
2.51.2

