Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E47AC9DDBB
	for <lists+nouveau@lfdr.de>; Wed, 03 Dec 2025 07:00:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D37E610E71A;
	Wed,  3 Dec 2025 06:00:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="F62m822e";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from BL0PR03CU003.outbound.protection.outlook.com
 (mail-eastusazon11012030.outbound.protection.outlook.com [52.101.53.30])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 372F210E725
 for <nouveau@lists.freedesktop.org>; Wed,  3 Dec 2025 06:00:09 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=niWUu7eRR+ca6PJqQhYXXtvbQmpmsvk1fCYtsggIYOtdqrLK26CJe9KAp7QKDyYX7fDKn3QgNVcDd2ymTDogIpr942ymPW8DDdULiUZl/0vEDjLs4NHjewZFX4Vdrgm7Jp8u2kJrsw1NnEbHinm6zHymdbp7AWsCbIl0/hxtt+j+A3vn2aNuY0z466V2nqERVCkCuMGy9Cd5cg5cd5q5Q8BJ5F4WZkV4/JWH852XPoAUWWTlkzsX1piKM0C0+lu/+XFp7tGXHqr3xxNkDM4Klw/LNJG4dnomSYz2/9OA9e8vObmJC9ZTdBsgNjmBj6oG6oGaMtto1yTD7iGT7Ood2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1rqEKi3PfaVWHgWuCjLoh84YxFOgukzYWIWZIRQlym4=;
 b=J5U/eGvBv3ycv1QcLVgIHmqUVe2xT5+qnVNyWAz5lWGlBmeSKNu1uUEPNfcasMDQVhuYpQi74ogJhuWIgUO/vVDfnB4SNhZz6s3FE2X/u7bv4SNFkO+wv1naxTuQGwoJLdfSsWPH4Tbn6pL9JkqwXOkvvuRQxeiclBVFZVf6ZTuV33R6Tz16xENSfdQVVDC26G8gs27YfGRIeg8gczmt/V5kEIENn1v8LNlRtUw9MSw7nu8AI8Nn3OrL2yYwzEH3ydjFWzt/bBjPJGxz+aaSmwLnS6t6JT86RKxcRSq6p5x3suZLoQeNsHL46LaJ0xGmyNensDuCa+7hsnNyQf1DAg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1rqEKi3PfaVWHgWuCjLoh84YxFOgukzYWIWZIRQlym4=;
 b=F62m822ej+m1IWjGPLDCothLG/SJtIaSH7XFAoZRRWxW0HwtVIKcMBOzdKIPbVMkdBEAZSSF+uzcMR01Bu2PAEYR+6myE286lrm0KbNg9+0DeaEqhWFyBm7WJ0qJXI2jBSIhKV2hRYgKklEY1ujMXF/mwQm3cDqaUmsa85FCmWzigeVwXO8GlQzRJe4g0YWLsmq4E2OfwQ4Gft9edpEF/tFIzzAWq1QijR+RSFS/KjGjZAgPCgbuTGzl5DtXqYb3ks2hvP0H60E0u00xLVWJHLOQERVHotsyFJkQCGFhsbOqYOzgB2T9lYc1MEF/bxtuQtZ66kK6MwaSEhOIwF5aBA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 PH7PR12MB8013.namprd12.prod.outlook.com (2603:10b6:510:27c::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.15; Wed, 3 Dec
 2025 06:00:05 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%7]) with mapi id 15.20.9366.012; Wed, 3 Dec 2025
 06:00:05 +0000
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
Subject: [PATCH 28/31] gpu: nova-core: Hopper/Blackwell: add GSP lockdown
 release polling
Date: Tue,  2 Dec 2025 21:59:20 -0800
Message-ID: <20251203055923.1247681-29-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251203055923.1247681-1-jhubbard@nvidia.com>
References: <20251203055923.1247681-1-jhubbard@nvidia.com>
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0163.namprd03.prod.outlook.com
 (2603:10b6:a03:338::18) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|PH7PR12MB8013:EE_
X-MS-Office365-Filtering-Correlation-Id: 778a586a-806a-4e11-6489-08de32313469
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|7416014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?RetaBr7bLS1XOxgCNe/rSQB/e6Hj7/Nnob0UNwJw2yf60YcDRE1mrn5s1Z4x?=
 =?us-ascii?Q?T9Vtfp1FXbqj+gdedAlN00IGcUoXGpiN7Sygws/l90itUauabR2CLRZCZ4E6?=
 =?us-ascii?Q?jFPsKGYxwl8qMIPQm4bvQDafYT1YW8pMTWVV8HhyHbukA4Y3HJD0BT4EYXhn?=
 =?us-ascii?Q?cmHKCO2pee8EE/ujxSPTuy3sF90tFZ2ZeTZDBHVTiiq9m5KM5LsQMDeHX3sW?=
 =?us-ascii?Q?XFX7j5r5DNzsC5nh95AjeeLm/Z671vazBFta0zH1OjVmoDPAUgY0ICbqBsIn?=
 =?us-ascii?Q?rLwDmjlDyWUuZEC7cGlwFb0W5hRelFwbfxi0lStOPLWTV8R+ezgVuWRGU5Mz?=
 =?us-ascii?Q?bz/4po0gTbJVYt5LfwVUFTarW75QJZ2ytiafYa9b6p9IDhu+6oA7rUxd+1Ca?=
 =?us-ascii?Q?8apZ/9CABqKUQN3M4NH7fDte8ulZJjcj3NSefttgbzTC6iwsGs/I/3EIQtY6?=
 =?us-ascii?Q?ITnTcjR8g2ztlISj6h9i5FlxkRgfH1s8Zsqiy6lXKNRlEJ69wk1wvNRBJNxr?=
 =?us-ascii?Q?oXK8UYTVj5e89A1J0AHl4cT4aDN7iYLtNnzf4IWqOzfvXU/qDNi/kzFKrWrW?=
 =?us-ascii?Q?BdiYYVdBjdUWlhXx+vKhpLzFuCLiUvWTBFa/L136XWiOaB2ML4KdukqcSh5r?=
 =?us-ascii?Q?jS/AIRAkuMKiM32vzaAaOG69c1BpKGsfCY/T4JWeOSacsMtYrwMu0T5PNRlJ?=
 =?us-ascii?Q?XLvNSbI3qfwigeHmNFmiyfCjPnBtqGCr5oIRG0p/AN4TewwhHvhsJKa/DsWz?=
 =?us-ascii?Q?xtZLLE7eRR0zF7JoTedq0uNRcxrS5qM0qSdqgyS8J++rfDlkVFxtBeI4f7HI?=
 =?us-ascii?Q?7EsVNVMmTSauZQLfOo23RaFmOY4An9X2AdECnPatRZ+jigPpodm8XcJsKw7l?=
 =?us-ascii?Q?rW5NODPG1HYvC60CS1VTTAoDOBGmoqMllgAVJ/71zBukq49eUCvTl68B+7SS?=
 =?us-ascii?Q?sFwDwRScJXrDlcUGlshVseYE8DnKJGDp+LXhTrBJkiQozJ2gRO9dztUHQ1X4?=
 =?us-ascii?Q?4Qph+8E/AydnJZ2KiqwKEfnlHtLAhl+t3ip7O4h2adXn0iQwdhG0/pS7xlq2?=
 =?us-ascii?Q?7Mu8K3Hjh39NZRx0k5/DIGxpN5jYNpS2rJhvGMiqV/uyzbGVQ1cJ4u7HZaPL?=
 =?us-ascii?Q?GRlVy9W8GKbjfZ8sjQk2yBXM86Doml3MxIisyHwv1mZM70XJqOnQ36PUuXYR?=
 =?us-ascii?Q?G6MoJ5CuYoI4rWXmsBHipvuqGwgAus5KNsCH7md/ecbCCR72Y5D9pII9tkIY?=
 =?us-ascii?Q?4Vz6r3LEpBIOEiwDTgsoXE9EpLlLXb3d/Pc+t0+/ESKvb9GA9MXGUWrBPIHo?=
 =?us-ascii?Q?oBbrj/+6HC7NkPyROgZWMp4XlaJkUTr6kU2gNnDGUUKAKabkG6T2OI1437tb?=
 =?us-ascii?Q?wwd1mACq961giE4FUjhhRW8DThOGR5mXTg7SSI6fKb7+rViYDinWxza74lVx?=
 =?us-ascii?Q?iqGhK7Ox8gW1eksJ0Ms0pdCz0ErtKrMe?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM3PR12MB9416.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(7416014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?O1WxUwR66VFPiELXZsUitKHrkdBprpLLc3ILVxwffVZ5zMD1nYwl/kI6CjWe?=
 =?us-ascii?Q?RFMn1/QkcU0CgjjVZBKJ82V08uzHBVRlddEGGSMx3ogBP9nfHIEUqwBZYZJS?=
 =?us-ascii?Q?jtP4mw9sf1/+P+kYHfrSf45LmAp82VqrkRXc84ZGQ06UElv8eCvj24VTbJCy?=
 =?us-ascii?Q?kNhU/atwSOp9WxAiP6+eDChpk9CSI/MsgM4NS9LGEKJm97xoLNCuSJvULV/Z?=
 =?us-ascii?Q?+ce1M/WtrEW15T2CGXyuCr25Ek5IBUxU42bxCLQ9eLBLcLEFwNrppOtZz6Jw?=
 =?us-ascii?Q?bSC2KCcT8a1yvm6bL84p/pIzRU9TRYpgZsNnkg3He4nn0GCceNezj5RRbLL1?=
 =?us-ascii?Q?qbkdj6/wEjW4gz+85bV9IWg6Q4L3hyNgGaeQt8cJAmoywTFVDBbyvA1zLPW/?=
 =?us-ascii?Q?VOLRwEvAc5J37evVf3iturcgTRQtlYIcVgXOkONL2nE0CcO6j4opt6Yoagc4?=
 =?us-ascii?Q?qUhE/PzpA5gQJ1k6uBwczZ6sQePFdVtlYApdocx8FolAcCE4ALp4AQ9GY28k?=
 =?us-ascii?Q?KqbV6TTLs3smWBy6RxdfDatjl+SOCCvILk1xEeBUooIkVxJwxVLrwZW2ZSsS?=
 =?us-ascii?Q?IR06Xe7pdOtac7jnAYx8YRSOmdfxN28QOmcy7t6MUedHxw9PfKnqpTVbPJkg?=
 =?us-ascii?Q?MgrPNPgd3HzTmu5XqD++ngn10j7RD01PdjNWXOcTd5GKXe+E2hir/Tzk4YRY?=
 =?us-ascii?Q?FEF4XPvsb8k3p0IZjNA51RAcsyOgFGQdU7ORKaJ5BTyWSe69Oz8twnl1wJAB?=
 =?us-ascii?Q?Wvz1VZjvK+AJotBufwSKLJdJ5q2VgTUVTDweJ8bzQykl9uu2igfIV01MTrHH?=
 =?us-ascii?Q?Tc0tsyUFRKqbu0/nkavHY41C+ZR6RWghPL1Dao9vbrQvEGwH3uuC5HeOJXmh?=
 =?us-ascii?Q?8S9FKQQtqaW41e/833xPexbnEbgZXx1/ZRcF3aoBRfynsTFNQtF/qjcgKENu?=
 =?us-ascii?Q?GP7ldiJnbo1QrRKkfiPnaK4Izx8RB705b+rWYEWfc5Rrlsde29dF5OLDjd0C?=
 =?us-ascii?Q?9jF9tnYAxlZbt1sKhP0wY8MkvS0HZjdAQLYj81d+dFaUDMEWigg3Qww9zkST?=
 =?us-ascii?Q?LeQZf55hGpbd1UFjdscGeB/qEV9hAA0XU5yYgfmvhUS61op+WOUZxJhBpK4g?=
 =?us-ascii?Q?XuF5Wqflg92jQpuVI6C2o3RGy9rCv/mT0aNwePEkrSvM8EL02sayEGl52WDo?=
 =?us-ascii?Q?Hl/6N2xSVp4dHiUEYrfZt6y4ry3rC48RRYvFLyvA0RDimL8LZIuEqpmq0gfH?=
 =?us-ascii?Q?A4SZu7W8UMygjTPc6e/xq1pZLulW57g0STd4tNggfSGIqEwxcKGjNe0IYY4D?=
 =?us-ascii?Q?AN9SqgqemZhy1vIQDior3TrmYhC5WM02M7E0uLzzfAHDqaUzPqRXd1S2gFiV?=
 =?us-ascii?Q?kLzMRCmw1Ssku/Akuq8Rj+YhfXlsDB4WtyUCtVqhB6b25xXa4VD+1cD12FGo?=
 =?us-ascii?Q?vnjZ2brvZGscnGso0zIcT2l2IZDKhux+MJCIQnJOHI/K+UAaPZTh8RiAi2Yc?=
 =?us-ascii?Q?7aqe0VI8CEpyMsVP6pK3EL76oCm4IGopEPi29eyfBFiMpCkh9LX3+kdb8Gzj?=
 =?us-ascii?Q?IbwmRHadZRo5RWk4zyBy1abtgfEB5K5vQGnsj/L/?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 778a586a-806a-4e11-6489-08de32313469
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Dec 2025 06:00:04.9295 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UU8bXJKWdxPCzGJki8sWqH5H5m21hVqR9FJhLGFK6u/oyanMg3rA4JL3oYS8NtJBIJ45I0BTYifpmv8Gwu+1tw==
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

On Hopper and Blackwell, FSP boots GSP with hardware lockdown enabled.
After FSP Chain of Trust completes, the driver must poll for lockdown
release before proceeding with GSP initialization. Add the register
bit and helper functions needed for this polling.

Signed-off-by: John Hubbard <jhubbard@nvidia.com>
---
 drivers/gpu/nova-core/gsp/boot.rs | 86 ++++++++++++++++++++++++++++++-
 drivers/gpu/nova-core/regs.rs     |  1 +
 2 files changed, 86 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/nova-core/gsp/boot.rs b/drivers/gpu/nova-core/gsp/boot.rs
index 315f84907b11..4d04135a700e 100644
--- a/drivers/gpu/nova-core/gsp/boot.rs
+++ b/drivers/gpu/nova-core/gsp/boot.rs
@@ -15,7 +15,8 @@
     falcon::{
         gsp::Gsp,
         sec2::Sec2,
-        Falcon, //
+        Falcon,
+        FalconEngine, //
     },
     fb::FbLayout,
     firmware::{
@@ -154,6 +155,89 @@ fn run_booter(
         Ok(())
     }
 
+    /// Check if GSP lockdown has been released after FSP Chain of Trust
+    fn gsp_lockdown_released(
+        dev: &device::Device,
+        gsp_falcon: &Falcon<Gsp>,
+        bar: &Bar0,
+        fmc_boot_params_addr: u64,
+        mbox0: &mut u32,
+    ) -> bool {
+        // Read GSP falcon mailbox0
+        *mbox0 = gsp_falcon.read_mailbox0(bar);
+
+        // Check 1: If mbox0 has 0xbadf4100 pattern, GSP is still locked down
+        if *mbox0 != 0 && (*mbox0 & 0xffffff00) == 0xbadf4100 {
+            return false;
+        }
+
+        // Check 2: If mbox0 has a value, check if it's an error
+        if *mbox0 != 0 {
+            let mbox1 = gsp_falcon.read_mailbox1(bar);
+
+            let combined_addr = (u64::from(mbox1) << 32) | u64::from(*mbox0);
+            if combined_addr != fmc_boot_params_addr {
+                // Address doesn't match - GSP wrote an error code
+                // Return TRUE (lockdown released) with error
+                dev_dbg!(dev,
+                    "GSP lockdown released with error: mbox0={:#x}, combined_addr={:#x}, expected={:#x}",
+                    *mbox0, combined_addr, fmc_boot_params_addr);
+                return true;
+            }
+        }
+
+        // Check 3: Verify HWCFG2 RISCV_BR_PRIV_LOCKDOWN bit is clear
+        let hwcfg2 = regs::NV_PFALCON_FALCON_HWCFG2::read(bar, &crate::falcon::gsp::Gsp::ID);
+        !hwcfg2.riscv_br_priv_lockdown()
+    }
+
+    /// Wait for GSP lockdown to be released after FSP Chain of Trust
+    #[expect(dead_code)]
+    fn wait_for_gsp_lockdown_release(
+        dev: &device::Device,
+        bar: &Bar0,
+        gsp_falcon: &Falcon<Gsp>,
+        fmc_boot_params_addr: u64,
+    ) -> Result<u32> {
+        dev_dbg!(dev, "Waiting for GSP lockdown release\n");
+
+        let mut mbox0: u32 = 0;
+
+        read_poll_timeout(
+            || {
+                let released = Self::gsp_lockdown_released(
+                    dev,
+                    gsp_falcon,
+                    bar,
+                    fmc_boot_params_addr,
+                    &mut mbox0,
+                );
+
+                Ok((released, mbox0))
+            },
+            |(released, _)| *released,
+            Delta::ZERO,
+            Delta::from_millis(4000),
+        )
+        .inspect_err(|_| {
+            dev_err!(dev, "GSP lockdown release timeout\n");
+        })
+        .map(|(_, mbox0)| mbox0)
+        .and_then(|mbox0| {
+            // Check mbox0 for error after wait completion
+            if mbox0 != 0 {
+                dev_err!(dev, "GSP-FMC boot failed (mbox: {:#x})\n", mbox0);
+                Err(EIO)
+            } else {
+                dev_dbg!(
+                    dev,
+                    "GSP hardware lockdown fully released, proceeding with initialization\n"
+                );
+                Ok(mbox0)
+            }
+        })
+    }
+
     /// Attempt to boot the GSP.
     ///
     /// This is a GPU-dependent and complex procedure that involves loading firmware files from
diff --git a/drivers/gpu/nova-core/regs.rs b/drivers/gpu/nova-core/regs.rs
index 0d5c13f19073..a41d31449c65 100644
--- a/drivers/gpu/nova-core/regs.rs
+++ b/drivers/gpu/nova-core/regs.rs
@@ -277,6 +277,7 @@ pub(crate) fn vga_workspace_addr(self) -> Option<u64> {
 
 register!(NV_PFALCON_FALCON_HWCFG2 @ PFalconBase[0x000000f4] {
     10:10   riscv as bool;
+    11:11   riscv_br_priv_lockdown as bool, "RISC-V branch privilege lockdown bit";
     12:12   mem_scrubbing as bool, "Set to 0 after memory scrubbing is completed";
     31:31   reset_ready as bool, "Signal indicating that reset is completed (GA102+)";
 });
-- 
2.52.0

