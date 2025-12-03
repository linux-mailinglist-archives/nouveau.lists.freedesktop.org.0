Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FB4FC9DDB8
	for <lists+nouveau@lfdr.de>; Wed, 03 Dec 2025 07:00:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B1BBD10E727;
	Wed,  3 Dec 2025 06:00:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="iXp/RETd";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from BL0PR03CU003.outbound.protection.outlook.com
 (mail-eastusazon11012046.outbound.protection.outlook.com [52.101.53.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 59F5410E720
 for <nouveau@lists.freedesktop.org>; Wed,  3 Dec 2025 06:00:06 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OH57OEbvbP/NTsxhtwyA4ruK9el3qYKiebEAtj6C1f4IV0GJ4OpQWfdpKghN9pACT1xXR/QY9W9qpa8z4NNm8YnQDOCjh82ej5Vc02qASHh+V3H1Y6THxR3+JCyRbcbprWlGZRNVgijku0hLKPuq10gBZrUmk/FP8u+KRSnMuEomPxMXob4BHcAO9ashR/i3txRDGL23Gqfnb6Zv02uenanVdDDUsLNUeAbOkPL1FfXJVVSQjXqmcV8GYvEScIBJSOcUKHTc2MwQT2VHDGDYPA1lS2zGcUyGM/zpoLhbjykGTrySGyJKJG//HR15x1R4mdF7JTaXeslS1Y0R3xXv9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cbdu81NKj8gvhkYBTtO982xDLhtuvcyLOH5I6Wyd68Y=;
 b=HOUlMlf03tMHztfESmTzNVjF0PhAR69Hzr7+xHKzD5OnbQfGnwf2Bybxu/dnTsS9TYipPIzv4G8nM2BziwVSDRixnnh0gH/JCpBTqBMk92rz0NFIWXaZQ9u1rdSBiafQy/RlQuZyNUv8jqoIZkMBRRJAD6/WZwMcshfwiX8+NpKVNL/1d7gflAqyZ/6sr3R8eYM9z3p9r5voSpHM0/L8Zay2QOxbRFHj13lR/GbSLdJdEOBHGAGMjJQ1xm/r9WxJqhEQE9Kf6kJzODdkojnLs4LoLoZU1aWYypYbmXhzoMhPSM7ksDD8gRe5acBaSYDDaq+qpUbK0ZUGp1uy83dJ9A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cbdu81NKj8gvhkYBTtO982xDLhtuvcyLOH5I6Wyd68Y=;
 b=iXp/RETdxxc6fjKz4Ks4CCJBxF0VM/Ltz54L/Z7e/DB4PDYBMOnQxXlb2KEYxAILWjxqchbkB+Al7KLqLXtMh2tC58VHsxgm4NghNz97cQ7JcMEAwmaXIwKcA59+sC5HTOPF45Z7Av47AUELA3zUe9MhLpFlHw+W83F+3M1K9WeHA6svb6MfqCJXAynPpJAvVllIneDlby4ygxuB4rdVllfdcxNa9BQ3B1VypJrh7zyn39iMjW+VtLUFHUDIW+FGhJMU85V0UAZlp5Hi7y4+iiPAkftjY/CYTqJLkEQcSuguEbE/om50Ts8gR5USQjgSaX4RSrcdGPXf8kaAb5wllQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 PH7PR12MB8013.namprd12.prod.outlook.com (2603:10b6:510:27c::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.15; Wed, 3 Dec
 2025 06:00:02 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%7]) with mapi id 15.20.9366.012; Wed, 3 Dec 2025
 06:00:02 +0000
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
Subject: [PATCH 26/31] gpu: nova-core: refactor SEC2 booter loading into
 run_booter() helper
Date: Tue,  2 Dec 2025 21:59:18 -0800
Message-ID: <20251203055923.1247681-27-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251203055923.1247681-1-jhubbard@nvidia.com>
References: <20251203055923.1247681-1-jhubbard@nvidia.com>
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0168.namprd03.prod.outlook.com
 (2603:10b6:a03:338::23) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|PH7PR12MB8013:EE_
X-MS-Office365-Filtering-Correlation-Id: 66e99376-fde8-47f2-f57a-08de323132e1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|7416014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?OtSNQ/OEfw1hW4Mdt/0DTLcE4BlWa66Anu7nJzhDRKUKBim+ktsoOxe7/car?=
 =?us-ascii?Q?Q6YHqNxtHOVE4rHDjWd44wamhYmcbmZF4dIja7ZwZb+3KaFB4FrnPnEoFsyK?=
 =?us-ascii?Q?JGUatNv1bnNTGZwN0dD23Knku/36ueLeQFYejoqaPwRotoEbD3MzXBHMMViX?=
 =?us-ascii?Q?jHMy8g27NG8sUFUS71AZa2Gdu0Zpw2NBEHrRmQzz7NMFQF6d3wr0v2t5le5+?=
 =?us-ascii?Q?/WKoWGwaFDNrxfjYdG7Qfblo/eMBAMOgCvc3zrrl+I/GyQviUmFtOXiO9eMH?=
 =?us-ascii?Q?tIgJ42B+4kA46ibjYCjfr2zE5/9Bonu39DWvMpDFqfNW2DFf9m0HnQBM6PzR?=
 =?us-ascii?Q?nW4nmjKOtxrfHJzPBEMElW7O2nAH4wlcR7r7+hnISGxIvHjMaWV9YogW1Wxf?=
 =?us-ascii?Q?4iXDebBz/MJnbF5g/NFtpIf6vSvc+wE9IF/M7jU6K6SA+d+8PRzEkjRxWT3J?=
 =?us-ascii?Q?0MZqjMWAwXfyVpN0sUotRL4eP4eNGrw0zoe+gSBZpJs4fSc9YzK0yXb1AhA+?=
 =?us-ascii?Q?JH7hJ1Jh6n4kpJf6J6eaIcf3Q1ol2KK51j5++/TaZsn5BeCBk02VqhRSteqC?=
 =?us-ascii?Q?Ow7WmbeEurjXFI/arZQsp1IexxMy6TvRXogoCdq4WOsjXlcheb2wH7CDHL5L?=
 =?us-ascii?Q?SeR1zxpeW4f8PkOELpDQ6Nurijqug6YG2g+66W0vB5X4RJT0aD+pxSX+SZeT?=
 =?us-ascii?Q?CmjIBaGC8/c76ZzpdG03PPh7jkn2Gw0+4e7iwRSin6rG9Py4aSJKPjvL2Zle?=
 =?us-ascii?Q?KmkOR1RgGzJqgtezXrJe3fUMXbs2K9yJj6085EIxqgIFqxqvnq60ZKNy3Wjh?=
 =?us-ascii?Q?rk5Ekc659gQ7AHmorsR67yVY5QiWRK6xBcAHCfAyHBhqQohky6ihCc8lpoV9?=
 =?us-ascii?Q?co8G4fgp3UNAf2G5F2+epFe5oDsti7MRwjbFD8RT9uYFQiTjhKUHLkRUqTjr?=
 =?us-ascii?Q?cmSTNEv8aKwZzoMpbdOy7eDC+cC0TPMc48gCM+BOVeTV7weMkbVYjkjc020W?=
 =?us-ascii?Q?uq6ic+L+2DFPVgAoo1gqNlePV+AEdKYdxH4XhWJgmSVBUINKlgps5T+ZIE0k?=
 =?us-ascii?Q?nyo6J+AHrh8878ngFqrD5kgggzkxzRdnysIX1THSkBfh3eAGs9jhe3j1aKyn?=
 =?us-ascii?Q?BRXutyK9F+KKCEBsxgpvlXXOBkX0zn+ff7nSMDE43fS9Sbeb22QwWyj1vbDI?=
 =?us-ascii?Q?YU/Nfcxe3KatGOCNbupr0VCYl/LS3xXFVOPiyZ19n+sa+n9l7ujohJWbrkJw?=
 =?us-ascii?Q?ixrucxfXpmwBlOoHKPfHLk4KMgAgNqov1Zx8vN9UEdGd/C+hDSFmIK06+GCX?=
 =?us-ascii?Q?re47ZQ8GvUDUyBWFAMR7ZXqUQh5CHpXIHfvD8mPMv6sp87uzLR4ctcDuXbJU?=
 =?us-ascii?Q?EmwiWgNmm0y2xP2qFMkcAzu8zd8WMTj0E4SB2Fr/gpNnORYFu2uLG/rGmc0N?=
 =?us-ascii?Q?vDAJJZMSSgXoylOeUvJR1DA5c7hNxhUB?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM3PR12MB9416.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(7416014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?bu46S/x0FDYDQIRca/0V7/UH3LqJGSc1zsFZnywEgnktVAv1NAohkMaF2NYA?=
 =?us-ascii?Q?P6mE6JojcfJoxy9zuRUsxFmnq4BSUN6xHx3ndyquiWc9VDtKsRMUIS3tqI4G?=
 =?us-ascii?Q?6LwuGIxzCVXz1+Ycotit7A8R4rY1kdBvPaAJphXUCGUGFOwJDadzps9hb7Ku?=
 =?us-ascii?Q?dHy3Sjh7SPGMy/r225sR5TWkYgTqy0gokDylf31OKa4OY3RaVCxxdEugcllK?=
 =?us-ascii?Q?KXlQahNN/7nwVRPTMaFRdjhPaoL4g/b5pa92SChanEZuIIoylolxsF8IQCRS?=
 =?us-ascii?Q?RfvIwYzrOCunhZtOgPnaFDRoyo3g5O+DYQE3aa6KAhgXYF4TL2Wydsb4vcHl?=
 =?us-ascii?Q?lo2cTHRhO6YC7AJyd78C3CpgCz2Md2dOlyr18uELvD8MiJn1AmfMNCnwQ5oI?=
 =?us-ascii?Q?5sOAGcB2anfZcX0quCOTY8glIjPMt8VVpu2X95IszV2b0dELHjFtZdKimQ6O?=
 =?us-ascii?Q?MP6TxlhzS6Q516W67MBFBbWInCW3vDj0B2jiDdla8Whp3EU+w8A1KiBfwrAm?=
 =?us-ascii?Q?Q8uqP1/jMhz4+XPSnF5poyKlmCoGu/ZbLA8PIwPVjfD5/hhWZ7ClDZFry8e1?=
 =?us-ascii?Q?wk4vOKaujASFT3fIPApGE2FLAIs10iOaWlvhzLwtHUpQghxXYbreRFlkLR96?=
 =?us-ascii?Q?Bnt8CaigFYwm5cgSJl0iNz1Uk955dF9GEeWyPag0XrnsNXs2jRO0/eJf+9uD?=
 =?us-ascii?Q?JFZnHz4gyYu5ZDoHarWLYMn8cmY4ahWhfptS5hVaIYV5Y9NPatfv8ZHsfFFT?=
 =?us-ascii?Q?0sNdpKUI8RRh+BAn0yji45Q4iLfERuI24xvDLlL9kUduofFPrOsOyfhBL8hR?=
 =?us-ascii?Q?g1L0jT/CNMgK6UTAh7R49eC+TGcKnaZS1T/YEATOishUcIJ/QJ5KLYU8+DaS?=
 =?us-ascii?Q?RHAlhJHPwMXWre2UWHDNT9BzkwzHKTXO4g831e6Iaj3iPcC/lJZrdLsI20Qq?=
 =?us-ascii?Q?J4++Na52ro6NC1hKh7y8IBB3cAMJdMG53aiLXUR7Q51nq8dNWvsWo1gYzK9h?=
 =?us-ascii?Q?Y+OdgyaqihyUxSBnyCAjP0Sk03TGorHHUDJW/5K8+SIrHVD77amMdDxxnLEo?=
 =?us-ascii?Q?g/PoaJVHRtB6sEu7QsMl2s4APLTa6wFFNCr8bxy6x/Tm1LOiT/Au1a1423jQ?=
 =?us-ascii?Q?DizNKdpv79ZXMzYZlyd0cr4FowWQGRtv2kjm5MTBLjTpf4NE1ViGuMZhKlTa?=
 =?us-ascii?Q?MptM8w5vtsp5GyPCRgyj9Fv/ZtvFaTLpPIA+P/9B93yBS7bOw3HvnRwr5Ik6?=
 =?us-ascii?Q?BWsQAsfJZYXnYZBfwpltymzwKc6VoxAKkw84c/7X43fWa8+/k76zwI5N/vGz?=
 =?us-ascii?Q?9N31VJaxLE0PZe7ek7tvcqnOn07AJSTXLeTfYnqO31xPK5ygtfKy0aBRQJ0J?=
 =?us-ascii?Q?JKLPBvJEiNtGVDNzm8+j7jjjIyWSwlGfbPcr5uIKEZ3hzQSjDFPYLsT4B89u?=
 =?us-ascii?Q?A2aHewszGJ6uz853+61Wd8mU8bpvbTAek63iu6aOjaghx8AVnK0XBwH9jz+R?=
 =?us-ascii?Q?Pajw+I4FEWC/2Mp/HOtmXASkDSitQoyysdQ6idY0+2OiCpwARLxbbhkK0rFv?=
 =?us-ascii?Q?oY518/d2xC32LLa0dBJAX0s7D2xXd4uYQ0DNLCy2?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 66e99376-fde8-47f2-f57a-08de323132e1
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Dec 2025 06:00:02.3368 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZlfRjGfdRwjhFmgg1UxtXiQjgqwH7U81+UEhxceltoRMfkFaM+yeDWx4lsqDXW8FTtfnCL3ogHYDOIw7RpGkWQ==
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

Extract the SEC2 booter loading sequence into a dedicated helper
function. This is a pure refactoring with no behavior change, done
in preparation for adding an alternative FSP boot path.

Co-developed-by: Alexandre Courbot <acourbot@nvidia.com>
Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
Signed-off-by: John Hubbard <jhubbard@nvidia.com>
---
 drivers/gpu/nova-core/gsp/boot.rs | 67 ++++++++++++++++---------------
 1 file changed, 35 insertions(+), 32 deletions(-)

diff --git a/drivers/gpu/nova-core/gsp/boot.rs b/drivers/gpu/nova-core/gsp/boot.rs
index 846064221931..315f84907b11 100644
--- a/drivers/gpu/nova-core/gsp/boot.rs
+++ b/drivers/gpu/nova-core/gsp/boot.rs
@@ -120,6 +120,40 @@ fn run_fwsec_frts(
         }
     }
 
+    fn run_booter(
+        dev: &device::Device<device::Bound>,
+        bar: &Bar0,
+        chipset: Chipset,
+        sec2_falcon: &Falcon<Sec2>,
+        wpr_meta: &CoherentAllocation<GspFwWprMeta>,
+    ) -> Result {
+        let booter_loader = BooterFirmware::new(
+            dev,
+            BooterKind::Loader,
+            chipset,
+            FIRMWARE_VERSION,
+            sec2_falcon,
+            bar,
+        )?;
+
+        sec2_falcon.reset(bar)?;
+        sec2_falcon.dma_load(bar, &booter_loader)?;
+        let wpr_handle = wpr_meta.dma_handle();
+        let (mbox0, mbox1) = sec2_falcon.boot(
+            bar,
+            Some(wpr_handle as u32),
+            Some((wpr_handle >> 32) as u32),
+        )?;
+        dev_dbg!(dev, "SEC2 MBOX0: {:#x}, MBOX1{:#x}\n", mbox0, mbox1);
+
+        if mbox0 != 0 {
+            dev_err!(dev, "Booter-load failed with error {:#x}\n", mbox0);
+            return Err(ENODEV);
+        }
+
+        Ok(())
+    }
+
     /// Attempt to boot the GSP.
     ///
     /// This is a GPU-dependent and complex procedure that involves loading firmware files from
@@ -149,15 +183,6 @@ pub(crate) fn boot(
 
         Self::run_fwsec_frts(dev, gsp_falcon, bar, &bios, &fb_layout)?;
 
-        let booter_loader = BooterFirmware::new(
-            dev,
-            BooterKind::Loader,
-            chipset,
-            FIRMWARE_VERSION,
-            sec2_falcon,
-            bar,
-        )?;
-
         let wpr_meta =
             CoherentAllocation::<GspFwWprMeta>::alloc_coherent(dev, 1, GFP_KERNEL | __GFP_ZERO)?;
         dma_write!(wpr_meta[0] = GspFwWprMeta::new(&gsp_fw, &fb_layout))?;
@@ -185,29 +210,7 @@ pub(crate) fn boot(
             "Using SEC2 to load and run the booter_load firmware...\n"
         );
 
-        sec2_falcon.reset(bar)?;
-        sec2_falcon.dma_load(bar, &booter_loader)?;
-        let wpr_handle = wpr_meta.dma_handle();
-        let (mbox0, mbox1) = sec2_falcon.boot(
-            bar,
-            Some(wpr_handle as u32),
-            Some((wpr_handle >> 32) as u32),
-        )?;
-        dev_dbg!(
-            pdev.as_ref(),
-            "SEC2 MBOX0: {:#x}, MBOX1{:#x}\n",
-            mbox0,
-            mbox1
-        );
-
-        if mbox0 != 0 {
-            dev_err!(
-                pdev.as_ref(),
-                "Booter-load failed with error {:#x}\n",
-                mbox0
-            );
-            return Err(ENODEV);
-        }
+        Self::run_booter(dev, bar, chipset, sec2_falcon, &wpr_meta)?;
 
         gsp_falcon.write_os_version(bar, gsp_fw.bootloader.app_version);
 
-- 
2.52.0

