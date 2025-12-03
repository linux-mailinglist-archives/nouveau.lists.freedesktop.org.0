Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AEE2EC9DDC7
	for <lists+nouveau@lfdr.de>; Wed, 03 Dec 2025 07:00:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5937810E720;
	Wed,  3 Dec 2025 06:00:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="ErnH66DJ";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from CY3PR05CU001.outbound.protection.outlook.com
 (mail-westcentralusazon11013039.outbound.protection.outlook.com
 [40.93.201.39])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE94710E720
 for <nouveau@lists.freedesktop.org>; Wed,  3 Dec 2025 06:00:40 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=S/KqwnDqlj9aHBQ+o7q8rjxUeQEk6QwuA4wysKFt/lKrf83HYqBLiJBWcYl/G9K+FrQ+mzq+7u8haTxfSge1zwLZNdgloC5FKZkpU/hv/JKCvLfMDh8srsy05oHeJAdr6v8fyCbHiY2v3vhNNrq8oSnowFhxl5zFR8zPiQYaiklI4/rwv00DrqdbN1TGmCP5mjLoF6p/c2d7tAL1F4u/aYOjmUf32opIOKbLXBTU5IHJEe6bl4s6ndWpl6oD1H6t+Umou94pztUaIjEJhWux3jgKWyy/AuuIoVMbKvhYtKmPA7WeEhhXNV0WaxNVuTOTt/379LI4VF8pDYb9Mq93lA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Wov+hBKCa4Wmt8o0qhVMipOEG06MH12H6vxJvzEk/lU=;
 b=U/jwJFJsZaS9jDPdi36qMlBjXNMv0qkAFKD9lKhUtdlicXLd+uQvjc5c3A/vw3x9K+6TqcXQAb5xBl/RZZjEKCVGb3viC8Pa1snUdYKy9SHz7x08xZ3j24DyqGyb9puW5U9FJ9pqB4aaPcwEbU/4m+KeSonA9mb2jfABEABecDzjgl5Lr2zOu+9hEo2azI5zaXgyFNU0bizZJBGFMUxX3TKs9M4TCnsjjXp43HXtUsiErhN4ygiB5C8EaYx8hiIr0v23e2cNZoNPgIzT7s7XMAwUj3p0KoLRAdOZXqgRPFT76ls6oKH1nv9FygsIBgHVr3YzEgPWjPXVU20C/No6Fg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Wov+hBKCa4Wmt8o0qhVMipOEG06MH12H6vxJvzEk/lU=;
 b=ErnH66DJ5UWB73PwwUn8MK8FMCvywSxgq+wyKndrO08O2+nqu4MWrNd0ckz99QZ4dyyVabJiPUBUyfT8SzxDx67kc9PoknUZI0l0BjQ3XyttydAX0/iTa9KRQisnd5aJE78D31OyZr4eXoiEG0DnUT1gtV7fJpQGYdds/+e+mJRtlmU9+OtxWribmTT2DyyTT9RodkBMiVZuvnpffzF/R0u3szf0P5CxpOtw9OLGsWhe9uYWmWHcqVBYU8G3u+tkQ++WMwjc1kLyNUE/8ahZ+gS/YSipfxfHgbAIcpBrbAvyKYO0r17eoIH3DvkYwZd43ofEFnL9xrFoT69eW3YdzQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 PH7PR12MB8013.namprd12.prod.outlook.com (2603:10b6:510:27c::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.15; Wed, 3 Dec
 2025 06:00:37 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%7]) with mapi id 15.20.9366.012; Wed, 3 Dec 2025
 06:00:37 +0000
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
Subject: [PATCH 30/31] gpu: nova-core: Hopper/Blackwell: new location for PCI
 config mirror
Date: Tue,  2 Dec 2025 21:59:22 -0800
Message-ID: <20251203055923.1247681-31-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251203055923.1247681-1-jhubbard@nvidia.com>
References: <20251203055923.1247681-1-jhubbard@nvidia.com>
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY1P220CA0019.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:5c3::15) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|PH7PR12MB8013:EE_
X-MS-Office365-Filtering-Correlation-Id: e8dba0f5-48f7-4371-59d8-08de32313611
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|7416014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?VlBG6lS6TyCvPYOr6db7fiVWgoVppmLKkcXGNB3pZNQxSlsXtUAKeoYFnP/W?=
 =?us-ascii?Q?4qKo/glyX3bLurfnZVtqGjdjzG7XZUBvY40fbQmkh3IPWAJa590zrhvK/Isk?=
 =?us-ascii?Q?WmK6D9ZbbtRP5KJU30ZqjZv4YcNmaF0gfHSiyoEPQ/lOgB/hbJOYprCRDAKi?=
 =?us-ascii?Q?vz+ILC60fvmNmXCJ262ZovWkJCjbAuLAQ7Eo0Ft/v/Y07Hzr8htRKQ7M//t7?=
 =?us-ascii?Q?fHBp8CK/Dc1Dx7OBHwJ7ZfDGnuhZKLgPgzf8sz+vmoY6kMhr5C/1UcJf7RIe?=
 =?us-ascii?Q?4hDT3gJKauCVmaqXkuHMyiaTe3FmoumeIxn5xlYgvHozCEzdXLVHwGLnEQQ2?=
 =?us-ascii?Q?fXgi4knMhfo7SEPRcrKFAFEE+Bt6uA1BNTMg33sOsqYB/wVDxZTEUyogNjn2?=
 =?us-ascii?Q?VDYqQUIt9OxRGo0pKpMr4Dnh8JcabeyXWeUkZZB6b9F+gF/XhVdPI4EYSWbo?=
 =?us-ascii?Q?5FbCmB+BoGx/0b2+fvbyYkPWKCBOVjrOd9d00aXX1zyBiiZvaLG5XiYRcmO7?=
 =?us-ascii?Q?PY3/icztG+chzCe6zPAeyeXQsELBQFFUKR4he282RB/M0zbmiorzxFYq4Xt3?=
 =?us-ascii?Q?QtnDXGDbZMNcypNq5kMz4qZwIBW1Dnmj/Wn70/xHD9joGXfWpnJRG5+cjek5?=
 =?us-ascii?Q?zPsMTXX3V631AFOk6xjJ1mST2f1iD7ZIhbfb/NnUJK71yxvZAJDdvEjOMZd6?=
 =?us-ascii?Q?e8sCu2GkVbAivvZfJcwwR1unWBp345POdQQgZu5eKkjJSzf1Rt01tqCLkBYl?=
 =?us-ascii?Q?JBQggblOUstan3609hY8hSPntFgFQ0N5BYfsPu8T1o4P4RGBB+s3EQd/VG6K?=
 =?us-ascii?Q?FKJvVaaNyoRuEtPPm9lVnHKzH2dZ/q795HKTBDunimV02p0RzXJkMSUdxuRX?=
 =?us-ascii?Q?aXOnVBknyCNcWXoSru98g0xnb/ISi2dE7544Bvz2SstZjhkzJRt2Xfh+kY2i?=
 =?us-ascii?Q?q3m0bb9a9WfgMulhqkOYz3JFS8kcTfD1pFXkogD+L33+aoc6TDTnDtpKmEjd?=
 =?us-ascii?Q?KUOHkf9cdfcpLCcaViXrovYSrmeuTr0gXwGNVJCZ0m8/2aUYSeyTw3MLw+8D?=
 =?us-ascii?Q?Ws8u5hz6/EP+EpEpWNUABAZt/p1mxl87IhAtR8vX+ni2r3LJ3qkI7CwBl3z+?=
 =?us-ascii?Q?UPHmkGkjFMJ/FeROhaiP5ACMsirmqyL58ncAbAFUMqSkXKB0qyMbeFWeoBNw?=
 =?us-ascii?Q?Kiyh40F/1hKf3RHnDtNKcz9957V9rTwjtfeAnOn3ySvbGLtLANE0SDak3ow1?=
 =?us-ascii?Q?FIpdbrh6f1op8U0iYEwQy0PQKrh5FrmFlL11EDHlnOcbHxjmWdgUHJdu4puc?=
 =?us-ascii?Q?3aNCMGm1g+gaKi6zBRNNuriCjv+IYFvwqZba+SlHgHNTL8EwWCzK4ngRz/0C?=
 =?us-ascii?Q?B+tlxcPjcpJ3NOAJdGu8vweXx3vq1XvpCXvzaazu3CFLoALoQcBHy5GHG1iB?=
 =?us-ascii?Q?XlFsUws9LU38luWk53GkTWYFDDcsXhD0?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM3PR12MB9416.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(7416014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?pI6tL03PTHwOevT7HUxOrQdG4jScO3PAJm89PE/ywtiAF/c9+PGJoyNh0o89?=
 =?us-ascii?Q?4gOfurmj8Gfybrgx7oYgydw3KTIGUTkD1yhCg1AB1vAaDA7M0k9DuR2A8yUv?=
 =?us-ascii?Q?7jZj9NWjK9g7GE+aUsNvIsb8pREiKcUaxOKpkiId2nbEiMOWN4zvy+f4pRCG?=
 =?us-ascii?Q?g3tcqJT96PTYycBmAr65EHyvhvYR6eiNGHRx1IOyaat6+a79hxYzjUxOnvVq?=
 =?us-ascii?Q?jeZzuQVCxqK6ac9pud0ArZOoC6koppCJHN+57WoaJ3Npa0O7fd55oE3O2FAU?=
 =?us-ascii?Q?rxqh49F5PUVJPOmIKU1eqUhSdltShSw4nGlS+aDdXdTanSSvWaBIj1L/rn19?=
 =?us-ascii?Q?a3ZWRsyUDrCUspv0yrDab6iL0SgQGcJHmIbEumGWsy3mRnsgZG1H/x51PycR?=
 =?us-ascii?Q?wlz4l59koCOug0wfHdcdMAeSqc20ZuYhpZKNlxIWg4k6sneCbE5Qa+nXbrCw?=
 =?us-ascii?Q?QjF7Oe/GUY5AheG1sA/U3k1vXK+A7QGiB461ReOU73qPvyH/hsIn+8AYuinf?=
 =?us-ascii?Q?oDMqeBEiy4guvpX6R85cG+uiEgppZ7WN54ClQNl919vLGgRdNqbtTUYIIssY?=
 =?us-ascii?Q?qtpEqOghQNoZL1KmMM7H8i5Ny4ly6AW5tO6Zq1FYTRvZpSamwVVR9+047aiL?=
 =?us-ascii?Q?2lh5lf6OxeuZmvmMeDF8aBdJ+vBoPWRqAY15u8wnmpzeLDtD8Z3qQCxxQh51?=
 =?us-ascii?Q?DBz0IL175LRQpQ2KCj8JrXekXONT65Wgscw2FCM4vJnV3rh7BGa3tZVA1R0T?=
 =?us-ascii?Q?3XdLhvbe7yRqnTdRQtEo2FJL/xWE8TKr8TLXV2/TMjgKUET6QATxZDQg6wJU?=
 =?us-ascii?Q?SXXRkD2cj3zfoOZw71UjfLCAoboM7XVf1oxhvCE0hb+xmzpHxZdc/F37FARE?=
 =?us-ascii?Q?qJgpBNHzoYC0Y7gexBb47ftvJfOti7SJAuSAHEpNt+f/Bbg6aMeEQf3BRQSh?=
 =?us-ascii?Q?NOgpjcphw0scNZx8eP1CTJptLDG33k5xaAFDmlhDLCpntTQC0VSw7eU7IIkT?=
 =?us-ascii?Q?BFvdoWaL8GrwNOxs1ZXCnsVTcUWulN02v4Jw1J+ERD7nq1srfHDviGkU5Mlc?=
 =?us-ascii?Q?pJHjtx/KZWrJiOoiFH45L+fp1vyfqHKfNeFp7IilG6rCu76srwRYbbaQ3bSj?=
 =?us-ascii?Q?yhuqOiIaRLX34kV9csLQgNcjXKV/JG+6jgvmoyu4vzWFtY8VN76xePe74ClD?=
 =?us-ascii?Q?l+3jsdFC3Ue0u5W4wGuiC0deB14pHorRASPY6XAJ//ApMZKUyJAbE1gI8TVl?=
 =?us-ascii?Q?mxpnFeQOMkwsDdC/Z0vf1x25CQs320S/LQGgIw2oKCXQqe59ovr+iBVS8ZlC?=
 =?us-ascii?Q?BME8LJ2uFYojjy5QqHRlimv/bymPMC6ntWRzidOt68CcDm8A9HjH6pw8elkd?=
 =?us-ascii?Q?FERX7E4qZ9ErkpElfbFtZxc8/5lG02QDzgVoo5JMkAtYrTX7sd3PMS4DDE/n?=
 =?us-ascii?Q?Re30rltStdmByOlZZWU2nscvT5d0XArkNQMIzTqJByiJMTg12y64TfM69F7M?=
 =?us-ascii?Q?14cgg0+U0+noEFMVEq5+gdRKrBOzBMLKLAB42P06z0YiijLwI8M9WxBSCr3A?=
 =?us-ascii?Q?IpnvYUkAv87D5SWJeNu5nCe88apeYaDdI+B6RP9j?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e8dba0f5-48f7-4371-59d8-08de32313611
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Dec 2025 06:00:07.6646 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vVIUs2prJAKb3pSlk9ZL347/bQo6ilwcu4nPdk2DKNOsyLtquzEwm+nhgAqRbkZWv5RPWaT8jCrNhqVRAP5wUQ==
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

Hopper and Blackwell GPUs use a different PCI config mirror base address
(0x092000) compared to earlier architectures (0x088000). Pass the chipset
through to GspSetSystemInfo::init() so it can select the correct address.

Signed-off-by: John Hubbard <jhubbard@nvidia.com>
---
 drivers/gpu/nova-core/gsp/boot.rs        |  2 +-
 drivers/gpu/nova-core/gsp/commands.rs    |  8 +++++---
 drivers/gpu/nova-core/gsp/fw/commands.rs | 18 +++++++++++++++---
 3 files changed, 21 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/nova-core/gsp/boot.rs b/drivers/gpu/nova-core/gsp/boot.rs
index 0fbaa73eb55c..084be5586389 100644
--- a/drivers/gpu/nova-core/gsp/boot.rs
+++ b/drivers/gpu/nova-core/gsp/boot.rs
@@ -390,7 +390,7 @@ pub(crate) fn boot(
 
         // Now that GSP is active, send system info and registry
         self.cmdq
-            .send_command(bar, commands::SetSystemInfo::new(pdev))?;
+            .send_command(bar, commands::SetSystemInfo::new(pdev, chipset))?;
         self.cmdq.send_command(bar, commands::SetRegistry::new())?;
 
         if matches!(
diff --git a/drivers/gpu/nova-core/gsp/commands.rs b/drivers/gpu/nova-core/gsp/commands.rs
index 0425c65b5d6f..2a0b796e5927 100644
--- a/drivers/gpu/nova-core/gsp/commands.rs
+++ b/drivers/gpu/nova-core/gsp/commands.rs
@@ -18,6 +18,7 @@
 
 use crate::{
     driver::Bar0,
+    gpu::Chipset,
     gsp::{
         cmdq::{
             Cmdq,
@@ -36,12 +37,13 @@
 /// The `GspSetSystemInfo` command.
 pub(crate) struct SetSystemInfo<'a> {
     pdev: &'a pci::Device<device::Bound>,
+    chipset: Chipset,
 }
 
 impl<'a> SetSystemInfo<'a> {
     /// Creates a new `GspSetSystemInfo` command using the parameters of `pdev`.
-    pub(crate) fn new(pdev: &'a pci::Device<device::Bound>) -> Self {
-        Self { pdev }
+    pub(crate) fn new(pdev: &'a pci::Device<device::Bound>, chipset: Chipset) -> Self {
+        Self { pdev, chipset }
     }
 }
 
@@ -51,7 +53,7 @@ impl<'a> CommandToGsp for SetSystemInfo<'a> {
     type InitError = Error;
 
     fn init(&self) -> impl Init<Self::Command, Self::InitError> {
-        GspSetSystemInfo::init(self.pdev)
+        GspSetSystemInfo::init(self.pdev, self.chipset)
     }
 }
 
diff --git a/drivers/gpu/nova-core/gsp/fw/commands.rs b/drivers/gpu/nova-core/gsp/fw/commands.rs
index 470d8edb62ff..fe8f56ba3e80 100644
--- a/drivers/gpu/nova-core/gsp/fw/commands.rs
+++ b/drivers/gpu/nova-core/gsp/fw/commands.rs
@@ -10,7 +10,13 @@
     }, //
 };
 
-use crate::gsp::GSP_PAGE_SIZE;
+use crate::{
+    gpu::{
+        Architecture,
+        Chipset, //
+    },
+    gsp::GSP_PAGE_SIZE, //
+};
 
 use super::bindings;
 
@@ -24,7 +30,10 @@ pub(crate) struct GspSetSystemInfo {
 impl GspSetSystemInfo {
     /// Returns an in-place initializer for the `GspSetSystemInfo` command.
     #[allow(non_snake_case)]
-    pub(crate) fn init<'a>(dev: &'a pci::Device<device::Bound>) -> impl Init<Self, Error> + 'a {
+    pub(crate) fn init<'a>(
+        dev: &'a pci::Device<device::Bound>,
+        chipset: Chipset,
+    ) -> impl Init<Self, Error> + 'a {
         type InnerGspSystemInfo = bindings::GspSystemInfo;
         let init_inner = try_init!(InnerGspSystemInfo {
             gpuPhysAddr: dev.resource_start(0)?,
@@ -35,7 +44,10 @@ pub(crate) fn init<'a>(dev: &'a pci::Device<device::Bound>) -> impl Init<Self, E
             // Using TASK_SIZE in r535_gsp_rpc_set_system_info() seems wrong because
             // TASK_SIZE is per-task. That's probably a design issue in GSP-RM though.
             maxUserVa: (1 << 47) - 4096,
-            pciConfigMirrorBase: 0x088000,
+            pciConfigMirrorBase: match chipset.arch() {
+                Architecture::Turing | Architecture::Ampere | Architecture::Ada => 0x088000,
+                Architecture::Hopper | Architecture::Blackwell => 0x092000,
+            },
             pciConfigMirrorSize: 0x001000,
 
             PCIDeviceID: (u32::from(dev.device_id()) << 16) | u32::from(dev.vendor_id().as_raw()),
-- 
2.52.0

