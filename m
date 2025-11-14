Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 23315C5B049
	for <lists+nouveau@lfdr.de>; Fri, 14 Nov 2025 03:41:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 804A210E986;
	Fri, 14 Nov 2025 02:41:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="YfsZHHlI";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from PH0PR06CU001.outbound.protection.outlook.com
 (mail-westus3azon11011055.outbound.protection.outlook.com [40.107.208.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 814F310E97C
 for <nouveau@lists.freedesktop.org>; Fri, 14 Nov 2025 02:41:16 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=F3L7TxPzPC/fREa6MA7gBjFCqNKwqFK2VSfZ/pDuSEwwuptOYyRaqFKuimP/mbkRqs3VvdYpS+ITgZoJhGVbMSD1NIHITBzVxWVTp69GEJ+C0MTCdA4AYXDT5WevtAzjfQmd8xuH4tDPdBSG8r/yXQIGK6UEqmYBN2ZN5ueyrjnV1+AA+D2fzHLFP2AJnjU5sTpjDt2OSHSF6VnVaeBHAMZXr8N04WaR5+qJ/jOi62JG3zyhTC9XT0Jy+YjTmbX6e0rm8lnrkeEYDOHNGO8AWpDU89oxkqt3nep7cmN4WMTfxGP1Lb55mnSuJHAYjIqQ2sUmol3grTyfloEQf5Fj0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=D+Yu7gHduP6x9MiT6T83eYvPILyyoR8JXctTZ44f2go=;
 b=eNSlB3vMhjEks4DN2UJh15C5sN9nb+oTy0TnVuuaMrqkzGLfJocu08le5UjZ3Af5iOqkl0xZdOsrVNEYiUvYIPKordQjhL//EWsaV9SSCvCONfIKmIrh9YQhj+DxTFAd1Ol1BqkJYkYpewciXjArnNqPf/Vp092d3qG41DK9+9887SL4B3cstbWn4R7AwT2mi+c2drDY6zgMouuxy4E5W97M3H1PK4+SVJfD+HisnenQoByFS+g/CAtRVXfj/tRskjab28G+szduGtOdQ8Qn2MwH/JYNUWLU55p8764GyKIKZG4amxKbxoDJCv8e60enxGkd/Y49ch8L2h8AgMUC6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=D+Yu7gHduP6x9MiT6T83eYvPILyyoR8JXctTZ44f2go=;
 b=YfsZHHlItsip0XxeZBbI2KTIu8c3OVjh6bWzkN0+ZdejWFvMRMNjzHzS94JyW6F+DBoSVNh8hVu03MXoeqFxytGP4V3O3if6pfdA6MeVrVODQAttFRYsCr9ZYshLmdxB3kwPwqV35vo0yhjtCk8btGH8nNyB70jezJS4zHPfQI04uLhsy+sZWm8HXg7j3Bb9CA5lZ7Pq+LO6RMVKII5mFdBjkYSqb01EQkPbvXOSo+QNHrF2vQHzGO5zQzZdzpBHB9mvmaynTzaGS1gI026uvDPwRem2pnaybo0DLdD8QmWVTmyB9JAjwsfo31Oo29YY3/zm77r3g19hjZ8/BrIJlg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 PH7PR12MB7986.namprd12.prod.outlook.com (2603:10b6:510:27d::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.17; Fri, 14 Nov
 2025 02:41:13 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::d622:b3e9:bfe1:26bb]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::d622:b3e9:bfe1:26bb%7]) with mapi id 15.20.9320.013; Fri, 14 Nov 2025
 02:41:13 +0000
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
Subject: [PATCH v8 2/6] gpu: nova-core: prepare Spec and Revision types for
 boot0/boot42
Date: Thu, 13 Nov 2025 18:41:05 -0800
Message-ID: <20251114024109.465136-3-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20251114024109.465136-1-jhubbard@nvidia.com>
References: <20251114024109.465136-1-jhubbard@nvidia.com>
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0209.namprd03.prod.outlook.com
 (2603:10b6:a03:2ef::34) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|PH7PR12MB7986:EE_
X-MS-Office365-Filtering-Correlation-Id: 46902b7f-5de5-4834-4ce8-08de232746f1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|376014|366016|1800799024|7053199007; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Zj2ekvvoyyE0d3kTZwj9HS/isbruieR72OFnOWtqDTB++YVfGUtgjR5+Q67u?=
 =?us-ascii?Q?1Curc/co0WJ0DU7Yg6NiA3kGzYMBVlZ/vAmcB1RUkYhL6moAQFIDn4W/J+sn?=
 =?us-ascii?Q?1hHjkHTwOEDzHoF57wMjwYIVnUnTfMzFk67rvHEJzjiAaclTVVLzsmHW7Oyi?=
 =?us-ascii?Q?p9ofKJGnwggbIradCnTtt+qJaZOqsQ2yAvdvtCQhNZVjUpClXqbS+CNAcSjB?=
 =?us-ascii?Q?s1oSNba7xqMyvmfVKBITJ0uGnYd1DgFFNyJ1MPUaZyxFRZ8OruyjnHThD/LL?=
 =?us-ascii?Q?XX8x+/fyO1snpxwiPNlx8UvSdIZRJB8FcmGVtKHrKkRR38Vh7nY4uz6hJIMx?=
 =?us-ascii?Q?4BvkWgV5UiETspuNIbyU4Lur+pkv7Jg5bCe5wrqji2YPEd57lWgpxLU+LsQ9?=
 =?us-ascii?Q?ig2diU4Vnk5cyYUkqR//knNNj5iOVYP5PddJAMxvNQWe9gUgilYBjMAUtfjz?=
 =?us-ascii?Q?11/jUcFQUkAbGP7RuMo0Stl+skgkHN4Ijgh2+IY6PyAMNMrYSAPRl3sKXA5e?=
 =?us-ascii?Q?MXIVYRxFYR8S9ZWVUXlhEqoObaZboT1qwIPJspYqi1H1erwAzg/rOoXA/ElO?=
 =?us-ascii?Q?A0hyLE2BMW4/FjCg1/8L/ads9PesroR5irvQDpqjbDiV/DM2SR8PzwH2YUYk?=
 =?us-ascii?Q?b44/GOv4fzdWXAxueTNLgnS5iByP8LHbl6t867JItKAPkBl65rVX22tAUdWj?=
 =?us-ascii?Q?A252JOV6KON1khRu6AcdgVOEJ9EgT8pdmaSD10kdyFKEXmUaa/oiClXQgggu?=
 =?us-ascii?Q?B+IBj0vPfY8zaEelhyJlaPpXvuPjHS9a4bnOMGXRYftmptYJAIGpiDqtHoa2?=
 =?us-ascii?Q?WDGMTOGNB9sdgOOYwII8bNcJ2Zon62F5zx6VbUEv9ruYTjd+aGEqoGsMj+nD?=
 =?us-ascii?Q?b/f6VJ4R3HIwL8uPm4eDXw+IhCP/OTMOjVZ9R2s5DIoHQgF8HHwSPHILxSi1?=
 =?us-ascii?Q?sdGBTGU3/yykvrzEmBvmd7a4uUN2FuXdVt25S/YiX+r/B/WkSU0T6IBVnogD?=
 =?us-ascii?Q?TYoRWopo+s2MyDOXBb+eIr8YYtHTVWQZqU3zz3zvqmgMrIk3baAYjhp/bZcX?=
 =?us-ascii?Q?3kp3g601qybReca/A4C247d+ahBVv2MBuIgH2OOw0XohOULzK4YvvSczusGP?=
 =?us-ascii?Q?pvfP3uED5+uU2qachCvdG3HKZoozbcrv/OeXCi4Hyk8y4zT8KsphHKC7GxoW?=
 =?us-ascii?Q?9zq3OEs6nHt1m+BiTWhydfs1jNq/8aI25369F/Njf4pnihbb8bvqQ57nY5aw?=
 =?us-ascii?Q?2dQwBR/EzbW1a1eWjc2K70rjBiZ7Ey+2eyHv0lXxeeRZAMAza7hFA65H/RK/?=
 =?us-ascii?Q?gw7FU6QPC9fX/VMykei8FXbwQ3KNeypoBHH3c6tas77r5EMiQgCxWyZV1VJF?=
 =?us-ascii?Q?nW/CR3ecEr904zNrAMT9wZHpwaGS5c6kRPGu5Xhq5dYfugcXeYW1xusZOm07?=
 =?us-ascii?Q?U2cbe/3RIkm5vFnRSsyExG7L5PEpju5U?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM3PR12MB9416.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(366016)(1800799024)(7053199007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?/f/+JprbuRHov3jBifTV/69iynUHiDxhDrhMnLcvcm5hP2P2LZvovfXsQaxK?=
 =?us-ascii?Q?KS4M0lg9hIe67CfBMEZi448sRWpaI8Ux33tRkgdfYqL3WWngJpQ/9B0eUlp9?=
 =?us-ascii?Q?m3IaKN0K0FPrB5IfRtTmmO/wwgoK9UYn1Qz7/puD26rNdPb/QUaPRGYC8xwf?=
 =?us-ascii?Q?8EH72o0ydXl8CY8APtrLes1xdwZv097WzEeTpJ9iP2GNNSLhiXk2472rMohz?=
 =?us-ascii?Q?bUsGtkMmx1nyrF0z4y8oasTVUyiDeSY+POcqe1kE5X0fz6gIPqRaHyOdpNnq?=
 =?us-ascii?Q?YjNk8YFXvyyht0Sf4kpRWx+MXidDx/H3gpYdsmuOCYbd5oxOGzTa+JSTNz72?=
 =?us-ascii?Q?ljAZRlLwGOXMipFSjygpn495eVUQIPBl/4dQRDxPi6ZP/OjYO9K7ifFoNsQc?=
 =?us-ascii?Q?3h/Ylpp4xfMIR3vHrJf8LAi0sqcowLTKTJUDO6hUGJR8XS+cuEqF5pyPopkb?=
 =?us-ascii?Q?bdFuVM08NFPfpHYhr1BcLfkSpxCP4DDEdeqgAXdArRlPUBeyKN4VtzLBjFv7?=
 =?us-ascii?Q?iU9/9clTWdjdHMPDjnxgs7YmwEA//uhKNRhz3Uq0kzsWLmdOhT6Keus3w84t?=
 =?us-ascii?Q?KNwd9RhZzpsn9pCifzp9q4pK54kmJmLgx0ipWR4Zq4ds/wxJEL5I2hverA87?=
 =?us-ascii?Q?0eCqOXQCLxpRsBQ0Vus/+F/nYkwt0251wyjhrDK2cdTYV2jcgVIbT19as2ui?=
 =?us-ascii?Q?GiHWqVxTduNB5ifHKrEu/znoKyHUv7b0nScHhhZeOotF77xFyyNa3YKh5stH?=
 =?us-ascii?Q?mmNRrJyPN19CEltVHLQbPX4ZIHEdAAQ+oBxlGhFldk14rjI7dGCuv1Mt5aK+?=
 =?us-ascii?Q?VOb4/qBco64pyTYuACyT6LIJNm40Fgp+qFovmGJlzL8FVCG5QWCGA8VVogVX?=
 =?us-ascii?Q?TKU9GYZ2sKNG5u0S1826slTPQPV2bIm9LvyHm1QweInRP4Gwho4fULvHWNDS?=
 =?us-ascii?Q?0jiidW5CN3UOCmLQfyGFpmBL1hVmR7YFLVoY/UozyKp4tMWP4fdtQXYHqRGS?=
 =?us-ascii?Q?UzocAceDJxPDe82QGX/iV0CDqG/thieWfs8YOjw771jxCdsPCSa1D/yfQnIw?=
 =?us-ascii?Q?SaxGiITm02CvFyfYi6BRX71uhxjpDCj9UuO757alxmvSw5EF2eoLxa5gxsqN?=
 =?us-ascii?Q?fM+r1iwzdHKFPke5rl6XW1TrWaJZuawqY+Y00hMRRHfUQss9FNS1Q9TJjg8v?=
 =?us-ascii?Q?qPSkFtxPYhEcoA9TOICjnEZI4UHoS2hPmD4V9xzXsY0rECrzoe+mvr3KQVW7?=
 =?us-ascii?Q?jD80gNbt8djk/tsRj9inNec78shnSkHoiavQoxgYe5KajOsPX1K64zbWnDz9?=
 =?us-ascii?Q?jZUyQvCLPTCeatiQG3DpvAA7eKswUqZ3QRl9M3tRtFcMlZ/FnHCcmx8kaemH?=
 =?us-ascii?Q?Nd42zwG6G0XmWwRsk+Ia6JpC4dLUXdwEEQVZCb1mJ/T9SHpUTK7VJ6ruyCbq?=
 =?us-ascii?Q?0+GvnSky3nfGTqWj9sC9BZY144vmUmrVsXBxPAoQ+5dANVkJkU9eKT3cW14P?=
 =?us-ascii?Q?1wHWLP2lBmatezCVAyWayZH0vpKECqWxk3wJzCyhdnhwjFHkJJiZCk5Pgfem?=
 =?us-ascii?Q?QuWpAv9PqXeei1tjKo0roTHmgPnf+j7LNAAx3Egh?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 46902b7f-5de5-4834-4ce8-08de232746f1
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Nov 2025 02:41:13.5522 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: n8ZzInIyoAnx9bk+TdA/JoMGhtr3B/u4rC7GvV0B2kulO1tMtUGppNSJbTvkzRKmhEhGHD9LSPYQdWo4H1gJZA==
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

1) Decouple Revision from boot0.

2) Enhance Revision, which in turn simplifies Spec::new().

3) Also, slightly enhance the comment about Spec, to be more precise.

Cc: Alexandre Courbot <acourbot@nvidia.com>
Cc: Danilo Krummrich <dakr@kernel.org>
Cc: Timur Tabi <ttabi@nvidia.com>
Reviewed-by: Joel Fernandes <joelagnelf@nvidia.com>
Signed-off-by: John Hubbard <jhubbard@nvidia.com>
---
 drivers/gpu/nova-core/gpu.rs  | 26 ++++++++++++--------------
 drivers/gpu/nova-core/regs.rs | 11 ++++++++++-
 2 files changed, 22 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/nova-core/gpu.rs b/drivers/gpu/nova-core/gpu.rs
index 7fd9e91771a6..8f438188fc03 100644
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
@@ -162,10 +153,9 @@ fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
     }
 }
 
-/// Structure holding the metadata of the GPU.
+/// Structure holding a basic description of the GPU: `Architecture`, `Chipset` and `Revision`.
 pub(crate) struct Spec {
     chipset: Chipset,
-    /// The revision of the chipset.
     revision: Revision,
 }
 
@@ -173,9 +163,17 @@ impl Spec {
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

