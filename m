Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A3684C9DDCA
	for <lists+nouveau@lfdr.de>; Wed, 03 Dec 2025 07:00:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A38B10E726;
	Wed,  3 Dec 2025 06:00:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="OQ2czA7A";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from CY3PR05CU001.outbound.protection.outlook.com
 (mail-westcentralusazon11013007.outbound.protection.outlook.com
 [40.93.201.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A97210E720
 for <nouveau@lists.freedesktop.org>; Wed,  3 Dec 2025 06:00:42 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MDw8fJeT5t8WbQ/m2EYtzYJUfhv9XS3474iW8JVxJnjBKeVxKvpVnliySFE9dFHo3CeqK1DzXt9JXzIMWpgtmgLQ5e5nCXnDhLdZ2iH+bVYOKs5h4DdhwbS43cccQFpoJhVGeZtjOlfzFpJV04/mEQLZ23/tFL93s6F2AYiQFYiXeW2gWx5GINMpbz1SL4uH8eJ3WZ188IwsJ2PvRixn0XQdMx99amL5PcQVx8k0EevTOQHiRLkUQTKiBDSCHQFJUWRzedmnXTdnwwUV9TLa/LzmrlAkTmOaXNvBidA/IvobSbGg3BA1O56rYObH1Prm17MyXR9e6Ji+Bjx/Ob3dHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HIkA8gMPpqwUBm5LKx8YEPMGYMA+2P0i4HT5QcOrQBM=;
 b=Bn09U32CQ/pdretOaHNIkTqnCTOQ+0IanVn3I+mOsykB/jMSEyqv6L8GLCh9SRUFq4U+IL9f149nVTCC2ZqTHNIK3as5nKaaiT/+/UkdF4G5HdYm5Vh93ckbRFresxr1ASV/qjHE43T0z80dYgSMD65YyjOsKvQjt1WTLBvTrLfa6HuLboqcRKXN607XjerGhSUDPxXvY3xmafehGthdjt9EGMdOGdIKo7QJDvM1ZN+611MFpaB/pvXQc4hH32epm82v8Fg0qMet3SdSslgztyUILxf4k9zoTUwcj+orgVcbZRosQbBpGcDg0fgMjHUZz8cII/fbFEv1GddEd3nrJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HIkA8gMPpqwUBm5LKx8YEPMGYMA+2P0i4HT5QcOrQBM=;
 b=OQ2czA7ArKMxslOch4est0MDV+RbkFtHAnrMJWcvn2zFIJ8kSXKiI3etrDWZOy1qnQ9hIeXpg73G62XKEfcBZLIFcLD0uapiO3e5fMsz9oZYmb8/g9w6PJxG8p1lO3a7E51C0Vrgoagj8vJLxL1tlacz7hKSqyF8KIZZrLSG4oDia4tN93EwnW8gxKstKe6D0sSMiT77HE0ToqH+5hSN0vIvhwuUC6RUB4ReyEmyuLUn9QSrzixl0ya4U23mTDYVxNFd7/OK/lBfE7wOvZ1iW6bJQm9F2XGGIdIWok2Mc5nraaUeOlRY+OK8Q8r2piY7aMjITiJQ9MWISeRJBYp9YQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 PH7PR12MB8013.namprd12.prod.outlook.com (2603:10b6:510:27c::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.15; Wed, 3 Dec
 2025 06:00:38 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%7]) with mapi id 15.20.9366.012; Wed, 3 Dec 2025
 06:00:38 +0000
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
Subject: [PATCH 31/31] gpu: nova-core: clarify the GPU firmware boot steps
Date: Tue,  2 Dec 2025 21:59:23 -0800
Message-ID: <20251203055923.1247681-32-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251203055923.1247681-1-jhubbard@nvidia.com>
References: <20251203055923.1247681-1-jhubbard@nvidia.com>
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR05CA0132.namprd05.prod.outlook.com
 (2603:10b6:a03:33d::17) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|PH7PR12MB8013:EE_
X-MS-Office365-Filtering-Correlation-Id: 120159f8-7ef5-4a8a-de6c-08de323136d1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|7416014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?l/JoFy7szQ+3/FKubQF3M8aDu5iP1zSNBHDYT2EyaFHnC/sGJX5NSo0scMlL?=
 =?us-ascii?Q?6ExsYPCW/YoDCmiSnK862G2B9uJi8x9nAQSWz6P7OeTHTSk0sisGW2x1G0w3?=
 =?us-ascii?Q?NaEBI2P0Nm8mci8sTqO6Sklyl690bqNpBl2LRLZeVOpfZO0mygfKpYDBjbm4?=
 =?us-ascii?Q?ofsz1RsSPTV9ce7I5YUv7Ljw7aAemdScpXg2y/l3iuiox8h5J8w8wpMPuhwd?=
 =?us-ascii?Q?q0QQeaiLFvVmRmDJN0Tk8isNCetRnuIBdj2pKVI0yZyLyGqWuZ/klyHI7xOh?=
 =?us-ascii?Q?ONLYpFSzNh4q1liJnRJKOYu/X8Ab2OSUpmLTPRD8LxTrgN8sfFTC/aJh5YBG?=
 =?us-ascii?Q?ynxhSxnyevP/QhP/YEau/omA9fYMDFmrswNi9q3k5PnnB2/0N50uxmnuAJ/F?=
 =?us-ascii?Q?Nrl9PWRx/wPwOw4StlyaFoa9KPdyVuEzimr9Cl8XM9qsb6k7iRi9Q7gwIS4G?=
 =?us-ascii?Q?PkR25DKBUE3j+eXSCdjjTZ9HO+pbv0OYJY8QrJG8QxKAyBlRqcrTBWs3PkQb?=
 =?us-ascii?Q?Q9s/vdgMuuPXejxA5gpUgvx++zsK0IcDJ81x9eiFRacehYP+lOrw3NHuyxiw?=
 =?us-ascii?Q?/VCXjspDa4BBeNmS/xrWadImHoLutvxORjjdcxgrAg9nZfTPs9m8JqaOMdX7?=
 =?us-ascii?Q?FKcLM1ea0iHWmgejIEI1PA9Hr0HImCSZkE0zDsijam7b7RuhOe3BDHwIJ5Z/?=
 =?us-ascii?Q?kJqNtRisUr2PKLj2WUnAO97ynM/bIja/QRNPJszsM0vLGAxmkyo/1WtbDbqo?=
 =?us-ascii?Q?4AVdQ/w1tKbnDdTFAAInGA+evSFvtFuQjOOz7ERj1iJUZDQ/nui1umlhKTQw?=
 =?us-ascii?Q?qkCCmhElVHXspPzsoF9lDrTgsjVxmAcV86jYY99+Blb+8akIhIED11As+2BX?=
 =?us-ascii?Q?uc6usPn40Ojb/vblCf5XoRRxJbNQ1QxqdowDN0wAWRcJ0ght/Y/w5lXOijZG?=
 =?us-ascii?Q?ZNYZBN6yxQORZz++CgUqb545bUDR1v1PbNF79Ur4/hZ8J6amChoaGZ4OrCMX?=
 =?us-ascii?Q?qWKv+b+GdoQX715A1EE5KYVJNB4Rtv4UFS5P93pXJImTO+4juRBA2sdKZGGR?=
 =?us-ascii?Q?VegFa0fwzyAsPk+n6z9lAxjevc2ctkNCGJ3mdtWoFx2uPRbEenxu1DL7RS0I?=
 =?us-ascii?Q?la/evTLW25APwZNKew8VGhwUYoJj8yEn+Y3z5vv/tLSw49jeZy7DWHzlY08m?=
 =?us-ascii?Q?KejjJ22En4S6u4QLfTkTtEW1wptRH5O0roNrT8Xk7rZzHdYCNmhrdHyg2qxW?=
 =?us-ascii?Q?lrg0l9ZMr+M8L56Pj2vJzPsLDCml31Msk/Q87Pe+BRJvcY5aa+yshxd+nKHo?=
 =?us-ascii?Q?hsmfLNan8TXtVeBnKTmGyouxq4AqErfY2vkelRYBPN3gmkyT8zEOfgvJPcjl?=
 =?us-ascii?Q?1k+aq3TdjSTMk/f6DYrC5br8rbr9ixfeUJpRLWTy0GTyfpQAr4TYhWOb7GZV?=
 =?us-ascii?Q?KB/04yPuFa7SOH52BnPqUK1DKQgD6/3v?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM3PR12MB9416.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(7416014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?77AgyW7zWqumsW+HVXi67U4NceT1i3y2gBuwxPm5F/PFCP6+1DcpxC0DoDzv?=
 =?us-ascii?Q?HmCkotBmVSGdQS032bwBtx/uccIK6CpBuWyHesgMjPOlTQIpd3tOxxYRSc/K?=
 =?us-ascii?Q?urEMwNLIXjHgmEZroP8RQZ2TSF9HMe6i8atnIjL2JR+syEqef+nAY3gyMlHQ?=
 =?us-ascii?Q?x8UwxVskfV1QFntQNCe3ky/oNBWkrCENskk5csrZQwEu5kx2Dwl1VSUC2N7C?=
 =?us-ascii?Q?4EPXzIk6UHucdkkGA7IWxOKKA/q5Rv8dQcc8uF8OukkoaWFI0ag1oZ7yEcae?=
 =?us-ascii?Q?50EwDB21Ox6Fjs+rLh6QI7f/3yQtht9orPH4HaJgHQtEuHgV2SoBWbGKbWae?=
 =?us-ascii?Q?MfBgGY5Ut0wvkfVgi2bIia9uQtCiiXltRYt161uBt14xvWuqcpHyJpl9BTJs?=
 =?us-ascii?Q?MMqCRCxyWnEuusbQuClZwDVGMBxeUKGJBCK9RFGyRxXw3MG3W2xSqrG9BQ0Q?=
 =?us-ascii?Q?2TbLD1fGRkgJ5i0PsB+kL3YylF0PVNcW/kQeDduePn/M1jZFatD2/YjkFFMY?=
 =?us-ascii?Q?nx/DN0agzKxlyKg17rN+SqBzdUqCn25bS1k1OvHQI+DSHJbqCkb0SVkBpK93?=
 =?us-ascii?Q?Q8BSn9LLNhgqBQE7YUQxNqW/P5JP+JoIc9aD/23k2hwr6KehzNCaA8ziyUzV?=
 =?us-ascii?Q?pakrCb5CZpA701oI3tLYlztYtb8zY4M9lRDybgVenDImB2wCfsEa1IYXEfyu?=
 =?us-ascii?Q?BuDUDkHHbim6wdpv/nJYvr7h2l8jRCP+rOwOgrE/nFMM0IvI80VrxQTv/9do?=
 =?us-ascii?Q?39CbRjN53oN0O/w+eUNnMfX1Pcfu4xVMh96jAE3+rlJ7OGJklB+MAPoeR64T?=
 =?us-ascii?Q?SU80ZfdUguJaPWMPb7kgUXK1/6AWSXP4D1N1/5gYdvCuzoMqMaP8CE6jCDfu?=
 =?us-ascii?Q?NPC10HGIflCD6lZ/i7TFAQYJtzq00ya51hCoTatuwZHmVq7B4QZUy2w2rj4o?=
 =?us-ascii?Q?AEMYqkxFw5DYtZFuC/znor7Nst+V42M8NGgYH9y9OGnYglpjcjdSaQiDf0XW?=
 =?us-ascii?Q?IJG595svQlj54x/Xy64RLptYKduXSL6eg6z1qNCHUUYOtblGj4mH7uQZBvlz?=
 =?us-ascii?Q?Wxn9yiT+XJ+Nyb4MVFjPYspKdrJY1S1WVLT8ybPdt8hH1wPVFsSrWtThUim/?=
 =?us-ascii?Q?gz8+aly8/wSjFR9IbKVbsFw+ZdHgdNAkYSihk8ykHzcqTdgM8rYbYSF1ftRZ?=
 =?us-ascii?Q?b05cJFR37zbpdLC5uIi2+uEhSelkpGxPBG3g/LDmgFEzQJxWDDlsfs6CLcn5?=
 =?us-ascii?Q?Z4TOEFnzebUWqNZPv5yN1NK07sBvOhS/rPIP6q00BZRKcIGcMNtSbaWjPcAz?=
 =?us-ascii?Q?6zO4BRm2CfRzP5PpJZSiyfYPUKXktErzRVeHMy5cpImf08Jo43waezXMvqnC?=
 =?us-ascii?Q?OXQE6YehVZkMxnoFEtY6BQnDxHJt3KmKIBjWXaftnoeU/PjCjWOd0SFkA/jT?=
 =?us-ascii?Q?+aMwOdXUijHXxfrtpHzfLlLjLBqQu7FIOzoob/J7Jogrq8GYz6icoeKZ2Uej?=
 =?us-ascii?Q?hWTDjTtZTX/8vLS2ZAYRMuiUJ+Y8k9+cNdzVb1F+/NiMo0T2f6EsIc5KedsD?=
 =?us-ascii?Q?ftNsuAZce3CW4C0CYcseHcUwzkCFUwxQDT+Zq4AE?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 120159f8-7ef5-4a8a-de6c-08de323136d1
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Dec 2025 06:00:08.9162 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FIiucN7dESOwsnJLviUBPcC6TiYp1lItXC5TExczuhh2b5Eev0vbbvEmP4DuK4qTa/Pn7KlULiDHhkHsiB4Oig==
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

Now that Hopper/Blackwell GSP is up and running, it's clear how to
factor out the common code and the per-architecture code, for booting
up firmware. The key is that, for Turing, Ampere, and Ada, the SEC2
firmware is used and a CPU "sequencer" must be run. For Hopper,
Blackwell and later GPUs, there is no SEC2, no sequencer, but there is
an FSP to get running instead.

This change makes that clearly visible on-screen.

Signed-off-by: John Hubbard <jhubbard@nvidia.com>
---
 drivers/gpu/nova-core/gsp/boot.rs | 116 +++++++++++++++++-------------
 1 file changed, 65 insertions(+), 51 deletions(-)

diff --git a/drivers/gpu/nova-core/gsp/boot.rs b/drivers/gpu/nova-core/gsp/boot.rs
index 084be5586389..79a2f5acc09b 100644
--- a/drivers/gpu/nova-core/gsp/boot.rs
+++ b/drivers/gpu/nova-core/gsp/boot.rs
@@ -159,7 +159,48 @@ fn run_booter(
         Ok(())
     }
 
-    fn run_fsp(
+    /// Boot GSP via SEC2 booter firmware (Turing/Ampere/Ada path).
+    ///
+    /// This path uses FWSEC-FRTS to set up WPR2, then boots GSP directly,
+    /// then uses SEC2 to run the booter firmware.
+    #[allow(clippy::too_many_arguments)]
+    fn boot_via_sec2(
+        dev: &device::Device<device::Bound>,
+        bar: &Bar0,
+        chipset: Chipset,
+        gsp_falcon: &Falcon<Gsp>,
+        sec2_falcon: &Falcon<Sec2>,
+        fb_layout: &FbLayout,
+        libos: &CoherentAllocation<LibosMemoryRegionInitArgument>,
+        wpr_meta: &CoherentAllocation<GspFwWprMeta>,
+    ) -> Result {
+        // Run FWSEC-FRTS to set up the WPR2 region
+        let bios = Vbios::new(dev, bar)?;
+        Self::run_fwsec_frts(dev, gsp_falcon, bar, &bios, fb_layout)?;
+
+        // Reset and boot GSP before SEC2
+        gsp_falcon.reset(bar)?;
+        let libos_handle = libos.dma_handle();
+        let (mbox0, mbox1) = gsp_falcon.boot(
+            bar,
+            Some(libos_handle as u32),
+            Some((libos_handle >> 32) as u32),
+        )?;
+        dev_dbg!(dev, "GSP MBOX0: {:#x}, MBOX1: {:#x}\n", mbox0, mbox1);
+        dev_dbg!(
+            dev,
+            "Using SEC2 to load and run the booter_load firmware...\n"
+        );
+
+        // Run booter via SEC2
+        Self::run_booter(dev, bar, chipset, sec2_falcon, wpr_meta)
+    }
+
+    /// Boot GSP via FSP Chain of Trust (Hopper/Blackwell+ path).
+    ///
+    /// This path uses FSP to establish a chain of trust and boot GSP-FMC. FSP handles
+    /// the GSP boot internally - no manual GSP reset/boot is needed.
+    fn boot_via_fsp(
         dev: &device::Device<device::Bound>,
         bar: &Bar0,
         chipset: Chipset,
@@ -310,6 +351,10 @@ pub(crate) fn boot(
         sec2_falcon: &Falcon<Sec2>,
     ) -> Result {
         let dev = pdev.as_ref();
+        let uses_sec2 = matches!(
+            chipset.arch(),
+            Architecture::Turing | Architecture::Ampere | Architecture::Ada
+        );
 
         let gsp_fw = KBox::pin_init(
             GspFirmware::new(dev, chipset, FIRMWARE_VERSION)?,
@@ -319,49 +364,24 @@ pub(crate) fn boot(
         let fb_layout = FbLayout::new(chipset, bar, &gsp_fw)?;
         dev_dbg!(dev, "{:#x?}\n", fb_layout);
 
-        if matches!(
-            chipset.arch(),
-            Architecture::Turing | Architecture::Ampere | Architecture::Ada
-        ) {
-            let bios = Vbios::new(dev, bar)?;
-            Self::run_fwsec_frts(dev, gsp_falcon, bar, &bios, &fb_layout)?;
-        }
-
         let wpr_meta =
             CoherentAllocation::<GspFwWprMeta>::alloc_coherent(dev, 1, GFP_KERNEL | __GFP_ZERO)?;
         dma_write!(wpr_meta[0] = GspFwWprMeta::new(&gsp_fw, &fb_layout))?;
 
-        // For SEC2-based architectures, reset GSP and boot it before SEC2
-        if matches!(
-            chipset.arch(),
-            Architecture::Turing | Architecture::Ampere | Architecture::Ada
-        ) {
-            gsp_falcon.reset(bar)?;
-            let libos_handle = self.libos.dma_handle();
-            let (mbox0, mbox1) = gsp_falcon.boot(
+        // Architecture-specific boot path
+        if uses_sec2 {
+            Self::boot_via_sec2(
+                dev,
                 bar,
-                Some(libos_handle as u32),
-                Some((libos_handle >> 32) as u32),
+                chipset,
+                gsp_falcon,
+                sec2_falcon,
+                &fb_layout,
+                &self.libos,
+                &wpr_meta,
             )?;
-            dev_dbg!(
-                pdev.as_ref(),
-                "GSP MBOX0: {:#x}, MBOX1: {:#x}\n",
-                mbox0,
-                mbox1
-            );
-
-            dev_dbg!(
-                pdev.as_ref(),
-                "Using SEC2 to load and run the booter_load firmware...\n"
-            );
-        }
-
-        match chipset.arch() {
-            Architecture::Turing | Architecture::Ampere | Architecture::Ada => {
-                Self::run_booter(dev, bar, chipset, sec2_falcon, &wpr_meta)?
-            }
-
-            Architecture::Hopper | Architecture::Blackwell => Self::run_fsp(
+        } else {
+            Self::boot_via_fsp(
                 dev,
                 bar,
                 chipset,
@@ -369,9 +389,10 @@ pub(crate) fn boot(
                 &wpr_meta,
                 &self.libos,
                 &fb_layout,
-            )?,
+            )?;
         }
 
+        // Common post-boot initialization
         gsp_falcon.write_os_version(bar, gsp_fw.bootloader.app_version);
 
         // Poll for RISC-V to become active before running sequencer
@@ -382,29 +403,22 @@ pub(crate) fn boot(
             Delta::from_secs(5),
         )?;
 
-        dev_dbg!(
-            pdev.as_ref(),
-            "RISC-V active? {}\n",
-            gsp_falcon.is_riscv_active(bar),
-        );
+        dev_dbg!(dev, "RISC-V active? {}\n", gsp_falcon.is_riscv_active(bar));
 
         // Now that GSP is active, send system info and registry
         self.cmdq
             .send_command(bar, commands::SetSystemInfo::new(pdev, chipset))?;
         self.cmdq.send_command(bar, commands::SetRegistry::new())?;
 
-        if matches!(
-            chipset.arch(),
-            Architecture::Turing | Architecture::Ampere | Architecture::Ada
-        ) {
+        // SEC2-based architectures need to run the GSP sequencer
+        if uses_sec2 {
             let libos_handle = self.libos.dma_handle();
-            // Create and run the GSP sequencer.
             let seq_params = GspSequencerParams {
                 bootloader_app_version: gsp_fw.bootloader.app_version,
                 libos_dma_handle: libos_handle,
                 gsp_falcon,
                 sec2_falcon,
-                dev: pdev.as_ref().into(),
+                dev: dev.into(),
                 bar,
             };
             GspSequencer::run(&mut self.cmdq, seq_params)?;
@@ -416,7 +430,7 @@ pub(crate) fn boot(
         // Obtain and display basic GPU information.
         let info = commands::get_gsp_info(&mut self.cmdq, bar)?;
         dev_info!(
-            pdev.as_ref(),
+            dev,
             "GPU name: {}\n",
             info.gpu_name().unwrap_or("invalid GPU name")
         );
-- 
2.52.0

