Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7198BC50857
	for <lists+nouveau@lfdr.de>; Wed, 12 Nov 2025 05:30:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1404F10E687;
	Wed, 12 Nov 2025 04:30:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="nDat02zM";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from DM5PR21CU001.outbound.protection.outlook.com
 (mail-centralusazon11011056.outbound.protection.outlook.com [52.101.62.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B923E10E687
 for <nouveau@lists.freedesktop.org>; Wed, 12 Nov 2025 04:30:05 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RZmqH8iDxSWXXjKT1ea8KzC2dD9yES3Ft4jAs5mq1VYC7A27ZJBfIzBd47Nq+/Kf0YBaXm1nXPnI5AloBSXCmWZL+2jmMWnh69bQHo6BsVm5opImFyDhZ8lUw4o2aIs5NJOdwxC1LKsD9OkWTf9q61HjzDkP3fb9jntW1JyrTKYcEkMWOQiOR5cKVH3v0K1bnf0gMEkZW1MbuHGD+hfnYb1BvreW33h8olKmPF4SaojLhpnq69FLaBOdwLpf0LS7g8Rd7UMCmNDKHokVwVpW76c7FChL/ALGAVF4t9qeXA63gPHIe48F6R6a1c6HVaG9yzhuM+fFbmvZfuXkBhbOQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ziZPlECQAGQZP6V9aCUK+MjbC5vcIZQ+Naw1dlxex44=;
 b=rNXTjKwP2b1JBTvKj486BlSqOCNdZTWx7WtZy95DF8SnBxC6SQijDyIwlrLJkVnx1O7vmaJRQg53q+Ls9fUc1R5E4N6gE/84C6OGl+AcOhJbVHFuRnS2Ss5KafNcd5ZkgXjdJLrnilLW5BfcEzz55Hkjwtxa4hEzr+b2khS36qjAl5URjE4KcNdtMaYvjjmwMbpQ9L8XEiLRu+hmt/8x/obcQ2KFN0mvFWZBLGR0hzVD2ddPtkzHO78dzLV36e6KoUdmFMQKkEuWc/4YcI9Ip1gEAN6YJCdkpxQ+tgycDVrzHes5fi9/Mjb8fMnfaZLdeEmi+7cukDotOgdwprw1KA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ziZPlECQAGQZP6V9aCUK+MjbC5vcIZQ+Naw1dlxex44=;
 b=nDat02zMk1d6/3rZihpEUMU+iKJMD+WLYcRclj8FTC/BQsCJvhK13ZkcLDGUyCFrc+lxF78xJadrRzZRDGacReLwLhA8LguzfkBNRAe3oHlLOuOUGJL3PxkFQDH9WjKrV1eIj4elqxjbqZlulhH9sN7AHpVjlcINxnMHN/30RZN83YsdykGsLBn7kuzV7yuLoGKNW5IWVKo0f+41qWlGhp7K2VYbiyUQOx0zMg9qRqAMMwsdSVHQlCvGZVL5IIi5HXqsNCzC4JE9vNqCbCJp2dGPSgkvDMCUWTFcEYa4AYMY/gR6OAH5yfZvrwufPRoP+ScsaV2s5c8PK/qV5OFW/w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from BY5PR12MB4116.namprd12.prod.outlook.com (2603:10b6:a03:210::13)
 by IA4PR12MB9811.namprd12.prod.outlook.com (2603:10b6:208:54e::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.15; Wed, 12 Nov
 2025 04:30:03 +0000
Received: from BY5PR12MB4116.namprd12.prod.outlook.com
 ([fe80::81b6:1af8:921b:3fb4]) by BY5PR12MB4116.namprd12.prod.outlook.com
 ([fe80::81b6:1af8:921b:3fb4%4]) with mapi id 15.20.9320.013; Wed, 12 Nov 2025
 04:30:03 +0000
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
Subject: [PATCH v7 2/4] gpu: nova-core: prepare Spec and Revision types for
 boot0/boot42
Date: Tue, 11 Nov 2025 20:29:58 -0800
Message-ID: <20251112043000.83071-3-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20251112043000.83071-1-jhubbard@nvidia.com>
References: <20251112043000.83071-1-jhubbard@nvidia.com>
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0296.namprd03.prod.outlook.com
 (2603:10b6:a03:39e::31) To BY5PR12MB4116.namprd12.prod.outlook.com
 (2603:10b6:a03:210::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY5PR12MB4116:EE_|IA4PR12MB9811:EE_
X-MS-Office365-Filtering-Correlation-Id: f44e674a-b072-422e-b262-08de21a4264b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|7416014|7053199007; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?PoEc/Z0LkOMKHsdksfzDTFF3AimxIX/X5hSM201G6hErdVUe8Lcq7YTA5zbM?=
 =?us-ascii?Q?v+l3XxBsvsyy4o7d8jFbW135Hu1I80TwENHo6Fktswwmu4ZDC5WPrYPCnfgf?=
 =?us-ascii?Q?NzOdOrJ3QOad5rEcMYmG5fAFEb0e/CZtJUPZft8eyVO6MEeypgZnGLx2MF7Y?=
 =?us-ascii?Q?i/xJ2Ttwooz9Y43WsaW0HOlrOBPL3Eul/5GB5pjU1tDvJ/DuzlgVhzkn6wpH?=
 =?us-ascii?Q?yCsac/bBbRn8+q/cTd6llgDoIRgVQei0tAz3XGCGRAsUlnWppLgOrbXkTX4c?=
 =?us-ascii?Q?1zvu7qwOuV9uZVwGAeSlrE1V5PrsjJR7h1uGgR/RbPKiG1fN+xQWt8Ez4kDH?=
 =?us-ascii?Q?AXVX4kiS9sqTHNnPLyjjfyY9gCMZ7zM2pT0t2weupqQTxpxKxp9qQD+y7Bw7?=
 =?us-ascii?Q?FZywtGDnZL9gFGCVJpRoeFvMa3xOxDY7gwq/XgpME94AGB6baEyyY9+DJKS6?=
 =?us-ascii?Q?UDMlcdoQjR+TUPrjWqPGN3aPwkn4tU6P79/UsKfdGXPPxeAdiBpNQBXPryiZ?=
 =?us-ascii?Q?wtMe1+zAnjCblHpyomlFXDWv+jsrITYbWsS9ay5wa44PebRazSkeeHgZ+JIm?=
 =?us-ascii?Q?bJ+jYbu/c4ExqnEEiFxhIYMdg/zdKTBgZ0DOffOLVt984gdN+y3N6OeUT1oc?=
 =?us-ascii?Q?Raxga/WxrIyAttj2fFmWmjJkg9GuiaiMI9N4ly7Cwjb7vY1UnlMnmD9wHClz?=
 =?us-ascii?Q?OgsMfbg4ZDaON2s3RnmZQhfP/cBiMJYkNSgnehrdV7qdIV6Tc0gpsY8bjbDc?=
 =?us-ascii?Q?hKwS52Vp4MdsuI1JsFR1gJJaDwTBXqx+h83ofIRSQk5aemImuRS/Y/U1nyM4?=
 =?us-ascii?Q?h4NCgRYiu7B0zqnykt2E6qfuddy+PtcFd5sia74/VtofjdweOS/++AbamiKt?=
 =?us-ascii?Q?3SxPRvTIVFG82HGXSyM3ANX06BoftzJiQ0/f1y1BIn20oNkUAEzBVal+/4yC?=
 =?us-ascii?Q?zY+ZFcDyYmyM6EiID+yP5cdvEhITO1rnT2ZAw/lW+VeVgjQqnSm8so9G1GtQ?=
 =?us-ascii?Q?M1ra5GdJOgjAfuZipyyWMx6NbSc4qIp6Q8HiHpoMCLnlzBuEMFhxYiI/9g+P?=
 =?us-ascii?Q?YCH+LxRvu1V2HJTyvLcw3EMOuA9H92mupnbRLSkJLloYm1Bo9GPK3JL2EbDR?=
 =?us-ascii?Q?J8VPaD0A7H70G42YNBs/+RvNfl8m1dAkiH+ikqlgcDzeX0ozNPiOqBqy3cQG?=
 =?us-ascii?Q?oZzZoIswPCbXOjSN6I0cADE637XrFfkR5wda62tnGZWw4YbKmY3BFEbka0uh?=
 =?us-ascii?Q?Y4+WoP8VFkO0JYOCAM+9ncDqA8/L5hR6Zo/AAmPJLGnM1cjHJo+IjSYBDusM?=
 =?us-ascii?Q?ZiFUYxl9a0iffSvoK+Il+NG8xn+9s/k0FyzDHJi72PM8UEo0S5PYz/HxTwEz?=
 =?us-ascii?Q?qxgs5bZbN16elZWklcrxEMgQCJAJkd6T2y9knIqiNfsU1jI0Yi8IuMuq5UvK?=
 =?us-ascii?Q?65NhI50RBViTCV7alE8onAXjWc0mwOtb?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR12MB4116.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(7416014)(7053199007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?MxZnlExALnXAl4S3ndZq6bM295MBDKPgiUDFpsbQ4qGue8yqwSKGkU5SExAd?=
 =?us-ascii?Q?N66HlQUqfATO9KHJGtVPjrkvHzGjEyHuBuJNWKj8tXfqk2I4crl1um6wRnCQ?=
 =?us-ascii?Q?xaBb+64L729fmr1+zEfqB/QTx+k+n4Zc/HoJhQSaIC7Tz/q6yNkGy8gJmF3p?=
 =?us-ascii?Q?EWPkIUY+uiQH7Ken+MAs4WfKcQNxLg4v1MCHeXjp+8N/NH2DXhQWe/zzdjQ1?=
 =?us-ascii?Q?STUlRxdF7iQPe2emrukNXqEIjm01K/ytrxCjqRnKqkW2eYmEeBs5p/XO2LxC?=
 =?us-ascii?Q?+M6Ioss6p5ty/9NANloE7WRf75mXTqqwnwOrvwyQ3Kt+nLgYxEmOz8mb/0dJ?=
 =?us-ascii?Q?nivBOaUWCof+YLJ7OkcPXvgPRcBkTwzlPLSLCv0egZ2c2GKx3839bJs+ZGk9?=
 =?us-ascii?Q?N/YCW9Acap//Yml7jhdnhj63OcakRMjF17ReIeKnnUiXz8yq5CLYfdclh7X4?=
 =?us-ascii?Q?L2Cg/h1VsK44rSBB06z3vlKCm0ZZtoYgyuf+KffuJumzKQB7spwgQhhtDec0?=
 =?us-ascii?Q?UtFHOyLrMWkWxSDG02AXOxDLSe3b9OZVugVs/NMSc4rehAJstUQh+/Ll7+Ei?=
 =?us-ascii?Q?Tz/77pYulAZEdyITYgSMeX6slurGuih1kt0uJu+2PK9+qsG0fQr/DTGhH8xU?=
 =?us-ascii?Q?4+v7teWVzb56Y+T8lREtqQR0d4ITdrWMXeh2cOTjyQv45BP0zU3J5lX+NtH4?=
 =?us-ascii?Q?3oadDWkBiJAwOuppWL4Hn0DfOcb+XQ6+/gnHQ79X1Mn0c5y+r0SCarq/Suh7?=
 =?us-ascii?Q?k69gnGjRvpkwuUsdvJTqsae+RzIIm0wR8UbOA6YpF7U/pGjh2mns7O/9N8Eo?=
 =?us-ascii?Q?uepMjhRlElC80WnrpNv3BDxdB2JrEWxfmySNLgpYeiCHF+6W976mL06z7Zxj?=
 =?us-ascii?Q?lx9UnSu/zmYYNIkLVeBdBezTK9eeGCLrJUL8VmD2eL7t+zJW3xeeN0urDxgH?=
 =?us-ascii?Q?HXBsMiVy//TMiwL9MMKgSZZGFAioII/+d+x8DYORW5QShPV+mGnDASN/yMmY?=
 =?us-ascii?Q?+IFAS/BBYi5NQQbu6Dc4+XG37sD6HyjpaUIF5DUVolUsVzhX0WiSHpux2VEH?=
 =?us-ascii?Q?KKSpXUECv89Ijg/yC0XEQm26Og0/8E4urFPadUS96Zw5gziXBHmxzKKzJUDY?=
 =?us-ascii?Q?UU0xJmpNhwfsmQLrd5CYFZrHlvKyJIxnNpitZb5RnA1WqxV4dzaltg/3AWim?=
 =?us-ascii?Q?uyes7bnWNqXY7baoD8M8qINc6b+mHeOaTPZX+oONaLvV5H9jvFPXAS3pY6nI?=
 =?us-ascii?Q?s8S0NjspIfDnYDzCsmS+AWtNKCoCChpfWZ/fCBbvYbKk5vF7qo//Mk1H6uFY?=
 =?us-ascii?Q?I+wI0m/uYOkO5UYMfX7b5pY84auBFf7zcOwe+ysTNFDuKvMQ3KoN7ADpUPfm?=
 =?us-ascii?Q?rwzfDMJRpB9bzZw9Y39iLWvVehfy7xaA8tCHIw66GKOc2EhdyFy2clKuF1iO?=
 =?us-ascii?Q?0VMc6LIYBzh480BFrqaq6kBfRoqqOBrogMB4YgPaGdqohKivB0uPAdaWxYN1?=
 =?us-ascii?Q?92nS3IQcuPHNTebIdPOXiGHbDMojIkMX5+7lm6nGiyp/kbqdMyo/iQvBtXGv?=
 =?us-ascii?Q?wpvUq/+yCEPFPHFg91vFwi6YvCxAurlL7gOYqVd6?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f44e674a-b072-422e-b262-08de21a4264b
X-MS-Exchange-CrossTenant-AuthSource: BY5PR12MB4116.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Nov 2025 04:30:03.5381 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: K7H6geVcGcePpQP1Q0c0n1IxyTNzzmFIBN48M3aZmJbBBNQPiYd2QYdqYeP0S9KjKyKSAY86E8keeTHdaLXipg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA4PR12MB9811
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

1) Decouple Revision from boot0.

2) Enhance Revision, which in turn simplifies Spec::new().

3) Also, slightly enhance the comment about Spec, to be more precise.

Cc: Alexandre Courbot <acourbot@nvidia.com>
Cc: Danilo Krummrich <dakr@kernel.org>
Cc: Timur Tabi <ttabi@nvidia.com>
Signed-off-by: John Hubbard <jhubbard@nvidia.com>
---
 drivers/gpu/nova-core/gpu.rs  | 25 ++++++++++++-------------
 drivers/gpu/nova-core/regs.rs | 11 ++++++++++-
 2 files changed, 22 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/nova-core/gpu.rs b/drivers/gpu/nova-core/gpu.rs
index 7fd9e91771a6..acf564fee9c8 100644
--- a/drivers/gpu/nova-core/gpu.rs
+++ b/drivers/gpu/nova-core/gpu.rs
@@ -143,17 +143,8 @@ fn try_from(value: u8) -> Result<Self> {
 }
 
 pub(crate) struct Revision {
-    major: u8,
-    minor: u8,
-}
-
-impl Revision {
-    fn from_boot0(boot0: regs::NV_PMC_BOOT_0) -> Self {
-        Self {
-            major: boot0.major_revision(),
-            minor: boot0.minor_revision(),
-        }
-    }
+    pub(crate) major: u8,
+    pub(crate) minor: u8,
 }
 
 impl fmt::Display for Revision {
@@ -162,7 +153,7 @@ fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
     }
 }
 
-/// Structure holding the metadata of the GPU.
+/// Structure holding a basic description of the GPU: Architecture, Chipset and Revision.
 pub(crate) struct Spec {
     chipset: Chipset,
     /// The revision of the chipset.
@@ -173,9 +164,17 @@ impl Spec {
     fn new(bar: &Bar0) -> Result<Spec> {
         let boot0 = regs::NV_PMC_BOOT_0::read(bar);
 
+        Spec::try_from(boot0)
+    }
+}
+
+impl TryFrom<regs::NV_PMC_BOOT_0> for Spec {
+    type Error = Error;
+
+    fn try_from(boot0: regs::NV_PMC_BOOT_0) -> Result<Self> {
         Ok(Self {
             chipset: boot0.chipset()?,
-            revision: Revision::from_boot0(boot0),
+            revision: boot0.revision(),
         })
     }
 }
diff --git a/drivers/gpu/nova-core/regs.rs b/drivers/gpu/nova-core/regs.rs
index 934003cab8a8..8c9af3c59708 100644
--- a/drivers/gpu/nova-core/regs.rs
+++ b/drivers/gpu/nova-core/regs.rs
@@ -24,7 +24,8 @@
     },
     gpu::{
         Architecture,
-        Chipset, //
+        Chipset,
+        Revision, //
     },
     num::FromSafeCast,
 };
@@ -56,6 +57,14 @@ pub(crate) fn chipset(self) -> Result<Chipset> {
             })
             .and_then(Chipset::try_from)
     }
+
+    /// Returns the revision information of the chip.
+    pub(crate) fn revision(self) -> Revision {
+        Revision {
+            major: self.major_revision(),
+            minor: self.minor_revision(),
+        }
+    }
 }
 
 // PBUS
-- 
2.51.2

