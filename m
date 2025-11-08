Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CD4BBC42701
	for <lists+nouveau@lfdr.de>; Sat, 08 Nov 2025 05:39:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7AF4710E348;
	Sat,  8 Nov 2025 04:39:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="JD3H6Fky";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from BN1PR04CU002.outbound.protection.outlook.com
 (mail-eastus2azon11010065.outbound.protection.outlook.com [52.101.56.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 00FBE10E301
 for <nouveau@lists.freedesktop.org>; Sat,  8 Nov 2025 04:39:51 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QiB1xjAYoOBZnGrTDkau855kePjVw2eHDiV3Vhd17BJ21mnpSjXplwFqLOcNHilRugFq2W5WWkHF1AlAmDefaS/I6V9U4z1MIjJeYLpBRAiowbKIjY7tF1mNwCIdOwnjuSRnYsZVOuYPBmxLMk1zUXbBABF5O5jEdnU12wjfvSdMfMGkQnkv9DZJCne9TWiHng2v6MfY0+f2eFTHalH8hzdU6IhqZedgmmsWkwPzOpSgtb4orAHM5xlmR407A54P97KufZ3CH4kf55kGKOlf8l7tKABj6Q95YjQSeT5oWT5aMuzJkDSBPIjOl0v+d1zbZYfhhf+UZQzBt66ZxAb9LQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ziZPlECQAGQZP6V9aCUK+MjbC5vcIZQ+Naw1dlxex44=;
 b=VAwegAJAjSRkk7htJccIG7jlA264rrOD++9doJG9ZqhB9vgz3Lm4B66RLL0vtgox0WptU7LyEMg3Eyzr30xLh14Zyn3hrrwCcKQXiw431AluHd8VR1Aoore9fl4SbwPPkO3ItIZZFg/gTmPlpmGmw/YlHRx8wdja8ZrpzSf+qrqoz5FCU9qU2AhK/IbHEXm9w1v4uNFQOrXpW+hxsPXTsS3MUZBqH4eJ5j/aL6b2kH6CHHmfHoCuysqdZ/5P1AX3+BzWtIzun3ePa6HLvs+4clTygClWpOWsnGcpo4QSOcXXjz9BnK74sUuDcAvHgSZd7Xe0IRP5vMuyf8xf3OMRMQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ziZPlECQAGQZP6V9aCUK+MjbC5vcIZQ+Naw1dlxex44=;
 b=JD3H6Fkywh1HBBuzF8eUG7BswEZB6QfNRrVlzLd1iaoIrpwuV0IHxvydbeSPOs8srySrI1l2pbQ2CMdzpicNUCavYZeeb5UXAMtP67K9TFzIs+1/mCMbUFqadr+FbHlMH4kgTEw5K7nUctHQTvWVYZNZpZMtvcIgFR7alQB29aNSiUC1xf2/rTnZQqDvRUNv1aOSyLuFHIAVi2eiwC9+D/OimVPGu0uBCFsQdjQJlVVrRj6HUL0QJEpjMF/WBbv+7jgEPilTQQs55x9J/b/l2UHbt5E3JrNVmTbXBO3sxY7u6C2wl6Hnn8iIZmpCrHlJlAXRaXfc4csIDjVrLry5Rg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from BY5PR12MB4116.namprd12.prod.outlook.com (2603:10b6:a03:210::13)
 by DM6PR12MB4169.namprd12.prod.outlook.com (2603:10b6:5:215::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.14; Sat, 8 Nov
 2025 04:39:48 +0000
Received: from BY5PR12MB4116.namprd12.prod.outlook.com
 ([fe80::81b6:1af8:921b:3fb4]) by BY5PR12MB4116.namprd12.prod.outlook.com
 ([fe80::81b6:1af8:921b:3fb4%4]) with mapi id 15.20.9298.012; Sat, 8 Nov 2025
 04:39:48 +0000
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
Subject: [PATCH v6 2/4] gpu: nova-core: prepare Spec and Revision types for
 boot0/boot42
Date: Fri,  7 Nov 2025 20:39:43 -0800
Message-ID: <20251108043945.571266-3-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20251108043945.571266-1-jhubbard@nvidia.com>
References: <20251108043945.571266-1-jhubbard@nvidia.com>
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY5PR04CA0006.namprd04.prod.outlook.com
 (2603:10b6:a03:1d0::16) To BY5PR12MB4116.namprd12.prod.outlook.com
 (2603:10b6:a03:210::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY5PR12MB4116:EE_|DM6PR12MB4169:EE_
X-MS-Office365-Filtering-Correlation-Id: 8bdd2a17-08f6-4a38-7be1-08de1e80d94b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|7416014|1800799024|366016|7053199007; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?6zWs+XhHWipD1fAooLUh4dEsqjyCgp4b/3jxEBSCyG+vNBHFUvujUFKRRUKD?=
 =?us-ascii?Q?gFnZ1KXXmfp8CdmyCG7bTnyR394E8BubcFB2LXlrqqGCY2c1wDdmqgxhrq5m?=
 =?us-ascii?Q?IHnCHq66nqjAim5AElNWSOcmOXMrEc2RPKcC8uR3l7pbzwRhYTZYb7CC1Anf?=
 =?us-ascii?Q?ooVoZdbiMLjU1w/Gi+troFrleTMSNQrEyJZFAYju7almMN59IR2HAB3KsF7X?=
 =?us-ascii?Q?xR9u2Kl3PeRwMuTK7cmKMKLyAQDGvMaphL8vZ7CDoHaakLb92YmdK1gRYhkT?=
 =?us-ascii?Q?yKS0/5wWNbdY4kmOf0ETbCW4W+qNRS/SdWGHgTAdDu5RNxmpQU3Ol5tZN3l6?=
 =?us-ascii?Q?/mK3eYSiLjk/lTxVHellXPmdJDfXSfcPLRAHHnY+eZs+1umaZlDeuco4+WDm?=
 =?us-ascii?Q?M2L/GUxxqYYlXb9LecS6WTsiBiNTjMvS4X8eMGbnTCRxhNnspuNTRpR3uIOf?=
 =?us-ascii?Q?5TvXvwzmDfIMtD60WW8YqMn1zy2W9klXRcYBFDvph0XaGigZH4P5vXeXdHK/?=
 =?us-ascii?Q?BF1i82j1jeJoS5X51widV39p7rxlf6vdmrrx6ateKooCZiRnQAKzIwiI2O0N?=
 =?us-ascii?Q?E0lKLPLxgUkAzgn6pMOgDcwWpjZ+Dru0nE06Vu9g4yz5iu90t+tcNZ9M67cX?=
 =?us-ascii?Q?X5vWbz8SKBD1NIOUldrjr8agBEI8oBqMRIp4a1jeGr0LDmhB3T1y85xiKdps?=
 =?us-ascii?Q?TS2YSvgb1n/0QN7vBmQz4rv6utYUntIvKep66odfsB3D8LmU7EoCfKKw63I5?=
 =?us-ascii?Q?kANXdMMKbwIXwwr2XkPla8dFv/jMaqAs653St6br948jset4kO7hSEBEVI8z?=
 =?us-ascii?Q?SzJK8JCGjQdZeZcqaZTtTSwKZjuZG0l9ojB48gM5zIg2Ic9yQ16lkq7VbaE6?=
 =?us-ascii?Q?i+XQlEmriCnbnTQuUdst7qrgOPMgP8h/YrdieEdLnqXBCidTuGs8xyIuUpuw?=
 =?us-ascii?Q?7DdNKV+KE62pq/BlPhhvaRcCvN6xZVJkRJ245KsFxwzb1ix7X8JabO3Vll32?=
 =?us-ascii?Q?XQGoGIfHHI8vDEr4JYNaSZgPVXWy5Ic/gxWFk5Tg2Hj6aJFbpLJxF7xATHVm?=
 =?us-ascii?Q?IhQOHRWh2up1+Pj5MTlqvx3vf/IuH1rVXh0tQvnMjS1qGC3t00wfg06bM22X?=
 =?us-ascii?Q?0UGUy15FL1o0oHSDRuqLyRXDJG/J50+psBi/XjMdKIp68vUPfAnlopTVDKUD?=
 =?us-ascii?Q?3qseVkmD8ole8IVaTGTLeoquaEXgVE1WIvIUe2EnnQfhMykyODKDy9Z7ngq9?=
 =?us-ascii?Q?ADFk2wCTaqH4PEWPZUGu4npspFrD7RpiutQVcSFrNwrXEJCdNfbSd1oT36xI?=
 =?us-ascii?Q?sQg7f79gZAKedFcWN2dskvwQm6zjo8H3wbtkUCqR0wvr7zlo9Ulc4mQkPsxg?=
 =?us-ascii?Q?CuIyOsUnifw6XdzB51vH+vYIR3yFap5aylEJGQy64QYwKdqXBRFh5kb3DfhD?=
 =?us-ascii?Q?MaIuecGg0RikvC05uM+5alBFflODLgaC?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR12MB4116.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(1800799024)(366016)(7053199007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?u9RIy8lHR5+XsFrvaZXC7NOB0FySU9pS2/lUGNITzQDueaVJER0tNZ+PQpce?=
 =?us-ascii?Q?DTkpKdt26oHU9RrIsLmniw59gNpvzsHxKESD2mQ3O6Imp+lqJIDsHHzbxhXm?=
 =?us-ascii?Q?dfih5cEvH4XJ99X5aXDY/vdxBt9yTzIdc7ay+bkSrV/yUs/7Q5M8VXn6H/3y?=
 =?us-ascii?Q?EcMXRikcCL2ZPbGFJW+J11xDMtCqtbxDS/iOvKD3XtuNigl1mLa+Slp7+34k?=
 =?us-ascii?Q?fCjYRvGFhRUEynNBE6uS2QzG/lq6cyfnyC5FnvaOlJn/GUg0irj8V4hJ0Zao?=
 =?us-ascii?Q?r+NM4OiTqr2etU0YnRXMw8OQgvYZ02ct6NIwQaBp9RaiCyOAz0dI9h3x7t8q?=
 =?us-ascii?Q?exSWPddIh2Ff0lwNaEAm3ykaGc1bj2D2SGACTpEYA4Wqh+GbQ9/58DM8VsAz?=
 =?us-ascii?Q?jhHbnPR/IRv4tWjP0mf0UvBaubaT+1v7AbW56rtYH1FTwQtZk5hXkZQQTLU3?=
 =?us-ascii?Q?0ZqD+65II23gvOJV7MFRvheiAuXrWU6DB6PIBwpKQ9RHpQ9/TLWgO/RYNmxM?=
 =?us-ascii?Q?s9PjPJKVqatJb9/84gjUVq2hhwuvngw7oNk0LHzyDKIJLn/zlu+SsxaTK1Q6?=
 =?us-ascii?Q?HDypQCwGT5BNhqTjGUso4pxXZ5nERdnGOYdIu+i8Vfm5Xm3Ztj2ktr8iXOWp?=
 =?us-ascii?Q?IQ9vnBn5fka+60JL8zEyCpbpZgFNsef2Ig29uDgjVFoCeUNOPoSOc2rkpFfE?=
 =?us-ascii?Q?TUhOi+019iQJtN8qEnBwK+KAqCMHX5i3KsS9sPJpTt5cw0EsJgX8dQaRPyXR?=
 =?us-ascii?Q?rGaLnKrFb6+ByDy5141T9La67W7kFxlkgmrbKDJVlD3r+ucJYTNC+FivdjKC?=
 =?us-ascii?Q?cawVL4wdhJ9pSx7QGGSlFBKqPO6QYylK2txX+ud1VboAeaPdVNoe+MZTbQS1?=
 =?us-ascii?Q?3hdS3VP1UDtOcbrhUCJ0dw1iXKN3oqriby5ZEtDAb7piMTtaZRth+Oz/TZc9?=
 =?us-ascii?Q?L/3n6zZxfUjw9VwMU8AiChRJSyNIwtcQtF44FH69bHoQJ49DzQ380i0VY4LJ?=
 =?us-ascii?Q?cHcLhjLql//Nm+zaCMB3MEQ4PtE+93TJ3a9b5eT6O/DyM/EOdwxKs6SdCNFH?=
 =?us-ascii?Q?Hws2h6gOXRKjdjAZQbyUc2h0Gu6DX5UD57ncgda2LzGC+fy2utMg+bJX6Rg3?=
 =?us-ascii?Q?G8BfxNfIBEo/wmpCZhKPrghLluwhdxv3jhSjI8E3TgflYbTpBxcrDVNCdlWs?=
 =?us-ascii?Q?C05AeesVTY9VNcabJoqSDYoMSZFmUeqt86hBAEu8agK3tGY6TurKQjtG8m7d?=
 =?us-ascii?Q?ma9HVG5FM2jrqSvezGY0rd57MLnffVaRTwQv2GIj+EiidWDgzl8RjPWQtI2J?=
 =?us-ascii?Q?17dru4OqnmOPJWrBhzC8e85rRdDGwKIm5GK5COg4Je8lNH4tnQH4NtU4Gnlv?=
 =?us-ascii?Q?pvT4Oxf2fbfIWD1tWxxgP6andi/7J6jG9Wzbao7RZ6uiCzT3uSbi7/ILzUhO?=
 =?us-ascii?Q?Qy51YmlPEN2eZGkb4XnPQAu6/6Ws7NsaaiX4quHMm0pseQnTVSHaM3UvAvFl?=
 =?us-ascii?Q?fHLJqVyvv6LPEkk2ZmZQ3Vil95WgeYKi74sPrtOm3zBqs6Y56EQtA08F16Sz?=
 =?us-ascii?Q?e4hDo6UrDrGgh9697i1wheMHrFLbXvwv5Z4TQF4g?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8bdd2a17-08f6-4a38-7be1-08de1e80d94b
X-MS-Exchange-CrossTenant-AuthSource: BY5PR12MB4116.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Nov 2025 04:39:48.4744 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: acp5RlCYmJDHNgMb/p8s86DPkPt98Il5DEF6r4/WYl85jbzefDoag2my1GCLBrJxXMU4ltLhyCN2EeDjlsrqwQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4169
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

