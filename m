Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AA67B30B64
	for <lists+nouveau@lfdr.de>; Fri, 22 Aug 2025 04:04:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D63DD10EA3F;
	Fri, 22 Aug 2025 02:04:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="NppO4JQa";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2069.outbound.protection.outlook.com [40.107.243.69])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 72D1310EA3D
 for <nouveau@lists.freedesktop.org>; Fri, 22 Aug 2025 02:04:05 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=W4/4AFvmF+RDKV70XxfxyL2v6j0dCvVxNQ0jwcNq9ygaEVEGrvDP/E0MkgfdPhzzWW/psTzNPyj3jWTlgLBFzOSMkLsT69eRsruTE/svVguVbGA2/kBFkRYPIZ2U4hsyEBp8DJbfaAu0+G1SzTos078SjkZHZPOfiR/24GjfyWRfzd93I9Hyd9JL3ePJvwl68/keowkkQKaTs/UX/9vEqwLYp5j2rc1CMIxX+/BuAnAKHZhAZrlNO49kz2Dbz18A6bu7kG1BVBflx9sdFRcVdAWkdsQK7D5X4ojm8DYz0U+Ov70ZyhWKdb8bNSihXGEE/zQBS9cBJ6mdXXJA2NWXug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+USrqwEzeiv0JfQtBdHhqDthV+QkNEZRfk50sbV45hU=;
 b=qE8+HAmh/gJmOYw89JMcgUGRMV5awHkSej8tbJz5teBdPGQtBVUYFyzh1pteOBKyr9kMy/PGrzkOxMkzjCDaqJ1IVWoCN7h+wclLAL9OSHy2K2B/G8n7OUFn80hyCVE47WOjmTAatNi97GoTy0xyno9v7vWlWwQwbQFk62b9Rv8kr07xzDGOCho97pm0cak+OOfxwv3Cn3b43bhji/jRuUE2TVDJXwGuegvWSYiSPa03L6AHAFGOej15ZErMM9d3uG8tHt2fi58w+lVpNZpfM6jgwXDqWAR7DTNg2yT1CdZFPWbS62h3IDZijRebW6zDaQJG2W82MVgXaM69JXLjzw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+USrqwEzeiv0JfQtBdHhqDthV+QkNEZRfk50sbV45hU=;
 b=NppO4JQaNnYqwxIPi0IwUsPmXOZ999bubs6tgPyDqHQbMSaxEIWRdLfXhwJaQgV3rm+t5epigiUT8JSkH0PqFoKQcNL6yEs82LdD9o9Cf+D5JxfItp3EyNB/kH3pdz6NiVN2mFuOI3nkFkwul3E8aC1JnvnPTxDvYDKheKSMVZTfQlf07HyI4UZGsIbb4s5TiE7TFvKhH3INQpUWv6umq+0aF0h2egKyGhhDamrQpczx5gn7vbIB+Rnfm6Ys50jhF1qMocf2IK+K9M3sI/htnvhNs4eHsfETpoGzbfbaOcPFXp4p6qhW8TyasEYUNIvgLwnGQpbfPq56iOP0e8wfGQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV2PR12MB5968.namprd12.prod.outlook.com (2603:10b6:408:14f::7)
 by PH0PR12MB7907.namprd12.prod.outlook.com (2603:10b6:510:28d::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.15; Fri, 22 Aug
 2025 02:04:02 +0000
Received: from LV2PR12MB5968.namprd12.prod.outlook.com
 ([fe80::e6dd:1206:6677:f9c4]) by LV2PR12MB5968.namprd12.prod.outlook.com
 ([fe80::e6dd:1206:6677:f9c4%6]) with mapi id 15.20.9031.023; Fri, 22 Aug 2025
 02:04:02 +0000
From: John Hubbard <jhubbard@nvidia.com>
To: Danilo Krummrich <dakr@kernel.org>
Cc: Alexandre Courbot <acourbot@nvidia.com>,
 Joel Fernandes <joelagnelf@nvidia.com>, Timur Tabi <ttabi@nvidia.com>,
 Alistair Popple <apopple@nvidia.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Bjorn Helgaas <bhelgaas@google.com>,
 =?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 nouveau@lists.freedesktop.org, linux-pci@vger.kernel.org,
 rust-for-linux@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
 John Hubbard <jhubbard@nvidia.com>, Elle Rhumsaa <elle@weathered-steel.dev>
Subject: [PATCH v6 3/5] rust: pci: add DeviceId::from_class_and_vendor() method
Date: Thu, 21 Aug 2025 19:03:52 -0700
Message-ID: <20250822020354.357406-4-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250822020354.357406-1-jhubbard@nvidia.com>
References: <20250822020354.357406-1-jhubbard@nvidia.com>
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR13CA0130.namprd13.prod.outlook.com
 (2603:10b6:a03:2c6::15) To LV2PR12MB5968.namprd12.prod.outlook.com
 (2603:10b6:408:14f::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV2PR12MB5968:EE_|PH0PR12MB7907:EE_
X-MS-Office365-Filtering-Correlation-Id: fab910d4-bb0a-46fb-ed94-08dde1202a33
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|7416014|1800799024|366016|7053199007; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?+ccmlOgNaL0fYCIfcqm9yRMG796pyVAtInGmzoWPg5/XbQ28kWXe7CRXGT+2?=
 =?us-ascii?Q?jCCZAA27NFUoqj80YF6OglyyybuGmy3qcgmS6mfn9ghQm3eiZnUqwXsxRrtq?=
 =?us-ascii?Q?DI4SWLL1upidLS9ylUy3dpswFguEI/6CX048FOq2OxSgUGI+WNUtoXuhkhY6?=
 =?us-ascii?Q?NmbRBAYe+qBOInRqcgvTlSKawjuB6DEgVEm4ELgmNHCUyMNk7qvBKNk9Bmem?=
 =?us-ascii?Q?+B+HrOX/sxaaz20U3hMP60WjsyEKf+L5KFlvOK+GL7Vmm1IHDhwvJAW66Xtw?=
 =?us-ascii?Q?i/Ooydl2ChZ7gM7M9bKvv93XsomydPMoonaySYWjhJ5Pjcu2cT63pkbetXTz?=
 =?us-ascii?Q?sEFYFyMXXUsZQH12YqzWpUuoRh23M5vs5abf/HDghH6vk8a9bJLpI4sN0Zi2?=
 =?us-ascii?Q?YscD0+mADtzrvT47uQkqPNEc2YsTXpLgVw64n5Zns9rKJQflxV0aF/fG7IWe?=
 =?us-ascii?Q?cJEbw6ZigC3tvdrgoQzNdFjWvEanLHdpPbjbXY0OLlYn2PUhFg4aBB39A5j2?=
 =?us-ascii?Q?3OirhJm77gtTMCMOoiajwdC7vTO7K2CPba0NpWpuq4h7/POUHRDFL0bv8ixz?=
 =?us-ascii?Q?gDFgrMifgktJLxZmZgZHN4sT9FjDNZGzicjI9rv37iwpeLUWFI6iyL2vtKbA?=
 =?us-ascii?Q?EbwmRmThqiLbd8nBINgF/4Rg7T6+xTqOmP4CjxQYqSkaPJ7XcmcCm0Pingth?=
 =?us-ascii?Q?9PzbzoBk8Jl1LIOrWiv2hjAFzVxWuASBlr1+GDRwgQYYEUFekyjmDn76/nOG?=
 =?us-ascii?Q?pNFbjILjCKZnsuc8EnG4lxVh1iWTeMoRf4DlbRF30tnt6E707UscywR37OWK?=
 =?us-ascii?Q?zdMS5BbCjOnoLeq4YJMHdkfoXvsoawUmT2QOoqnNAG30bexDrHNd8MrJ2f4u?=
 =?us-ascii?Q?vo/XJKNOjynOy/Vou1Zc14kbDMnqJVmwl95QYVx56vFhnFH6Llug1fkALwng?=
 =?us-ascii?Q?txDyTaS5HuNINjOkTwNO1PGsFp00RKoh+o9G1EtIn4qbAWkTM8uUsk8sjsy/?=
 =?us-ascii?Q?zRAk3izbH19N0HilkC28qPsTtbrBnGT9hduuQEp5EMIFW/0XfxET1JNJTebS?=
 =?us-ascii?Q?nRlaH6A2VP2rc/6L+H0L/wrP5ecm0Rk2lnMcJZg3IoEkMUJ6oj3lFtavx/5e?=
 =?us-ascii?Q?wMetJkrKVn46vwhuihN+As01omeQ4VYZWexKI8RCrWKBBPVSO//G1ijcyz5k?=
 =?us-ascii?Q?Hw4Fk33MpGWh3srU3ySuur0g2rqYvLaeYq0jblMClwTs2I0v4av1TlOsgEhZ?=
 =?us-ascii?Q?nkL983I642VoofRjGgMdAKEPHd52F2U8i55w6q5HXDyBp5TSf4Ls4zxDkPIW?=
 =?us-ascii?Q?Yzdf8FnujLha7qx6qkdQNkZFE+PAtUdsmmExI1Wuu6/AueMU0/B5Ydj22Z+0?=
 =?us-ascii?Q?PE2jc3hqcjjb9k50lDgYvo2OpJjZM+O7zvANyGhp21buZ0+om9UkH+jiowgZ?=
 =?us-ascii?Q?7kqOQmDYKY4=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LV2PR12MB5968.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(1800799024)(366016)(7053199007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?D1COqKnKktmswls8XFymPaBFTKYgi+Tms0AJD8wiySW8oaAshS8+GLhuesj6?=
 =?us-ascii?Q?N/lNKBUglGd8YT8yrwVzUuIrr05iFCprRZ7a+CqbXChyfJ7PGatHEgjF6jpC?=
 =?us-ascii?Q?WahwLlSRqwv91fvsHIUnGhZSZGuxDLp3VhXhBvjiXwFPQp+s1bXN0s6Z9b6u?=
 =?us-ascii?Q?Dql3/zxHlPh85jTAPI8ReGrmuCIpOPChNuuhjeuBvaPfiRDjQjk8X2Oz5iy7?=
 =?us-ascii?Q?0JYDEJV2TsfMl9d+czk8EBW2LoIVkXzIL/8SKiHcbKtm8MTB+mjGzA4IkSWP?=
 =?us-ascii?Q?oZCycs8VvwHshbdyzW+/yg8LPe4EAYnBdWDfs45amJR6NxTfHaC8g+FGKNlq?=
 =?us-ascii?Q?VXgVjlIbcDZwneslKS/HaRk7EnXTtv0z9IlotV1QQ2lVPdNoiJjVmkh3h6HK?=
 =?us-ascii?Q?Z1VLjMMIKoVlgWtKGI+YlYFu+zLh8f8AnJKJJZ/gxSgzMYroi3mLLelB78yv?=
 =?us-ascii?Q?b+tI0m6b9MM+5fDJj3J5ObtSGXB/0PQGjzhovBDFjm5zUJqu9OZHnjn0btRz?=
 =?us-ascii?Q?ca4JrUeWZ/4ZyKx4vvbQUj0ofxuMRKRAoh/ZT9EFIb3UMO7YSMl6BR5kT8Ka?=
 =?us-ascii?Q?3AmI9g+R6EVCMyqSSNh0LhIiJsPP0dH0Bp/kTk/nJAZHFhcORwXhM4b9Fhzu?=
 =?us-ascii?Q?feVuaJIrn2kIDWLprHfYVCzKNtRrElxlR74lpuFofcvSXj+eXiUbuV5aYJz5?=
 =?us-ascii?Q?3W0wubeo6G97VLiUD7sZTvcKtkr0xnhNSAytMWNushmPio5U42dw+oJdyWJf?=
 =?us-ascii?Q?w3YoAgKMjuQZAcJLpUyTHEEfmpupbhgBybnKPZNCD7aA/pLfEvkE9qbQaVRd?=
 =?us-ascii?Q?z9G2lkT1YLghTwS+/6WzLks72ECRm3fAchlZqJiOQwmlVQ4ncU3CdHVDtKVA?=
 =?us-ascii?Q?AEWzigFzRk7YS8z5ioRYGvGB+breQwpdyFc29mrN4RtDw2nk8mzcdd6TFxES?=
 =?us-ascii?Q?ABcXrVEeDOxbTRUWlSUYmCy+rXFgOhLZ0Ctsb/KcxlEwQUuJ7UdE1VI0GKBa?=
 =?us-ascii?Q?eH9u+uvVOjexacW8WBaTKCXalMjohS5+ioimK+rgCw8r3EmKjuhSpcDh43Kh?=
 =?us-ascii?Q?Pel4njWhxCoSkWYLLmuKdsARhUlG6e1A4P/MyOO2HO3XN7tiIuh6FW7GV8z0?=
 =?us-ascii?Q?8auOr346McFZW8jFAD6Ccrko5PLM+Dzz92DU2yLy2QQ1uVea8KhdIydVCAPl?=
 =?us-ascii?Q?hKgdAidXLRaTi3Fr/lSqDnVeEGjg+PWAN4dDIN5bsS0KU+zOxsR83OtyUv9d?=
 =?us-ascii?Q?8aAm5QITDYTlLnmFVkJLU/rUNb3s0fcKCWziX9IBlfrUkDWvCIGdSSuwXP2N?=
 =?us-ascii?Q?64Nr+kKsXfXlKvb1y+VyrzJv71foCzcY3tMUK+em+v7JJ2GmKgFuGQK3sk3x?=
 =?us-ascii?Q?AjN52+IAqfdYM8Eb2dS5aHsPEZR2qtE+w5YkVEScndN6/7kdbligpjBDUcXf?=
 =?us-ascii?Q?BsG6AgM7SoH93144lsxM/OjbTJ+9Zipj5qdaAS5Zs5GFoF7u8NkYwtyD3FpZ?=
 =?us-ascii?Q?NEbM+0sKCwQCVHLQNXZ2Q7KmEsIU/G6AsRZDUF9u6koxCwA2bowPHuIEkGFr?=
 =?us-ascii?Q?xr4KVAAfKrCGST/Ekcvc8XU1Evt6wDAxZ09ePh3g?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fab910d4-bb0a-46fb-ed94-08dde1202a33
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5968.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Aug 2025 02:04:02.1193 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SNpvkKzIJCHXT5EYq7CAPS0mMvXFDH5Nc3T8hG2Z/5UEZSTcLsvOT5ZwxxK8JDJwNfagchePqU0KaZWMrYc+Lw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB7907
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

Add a new method to create PCI DeviceIds that match both a specific
vendor and PCI class. This is more targeted than the existing
from_class() method as it filters on both vendor and class criteria.

Cc: Danilo Krummrich <dakr@kernel.org>
Cc: Alexandre Courbot <acourbot@nvidia.com>
Cc: Elle Rhumsaa <elle@weathered-steel.dev>
Signed-off-by: John Hubbard <jhubbard@nvidia.com>
---
 rust/kernel/pci.rs | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/rust/kernel/pci.rs b/rust/kernel/pci.rs
index d4675b7d4a86..504593c882c9 100644
--- a/rust/kernel/pci.rs
+++ b/rust/kernel/pci.rs
@@ -161,6 +161,27 @@ pub const fn from_class(class: u32, class_mask: u32) -> Self {
             override_only: 0,
         })
     }
+
+    /// Create a new `pci::DeviceId` from a class number, mask, and specific vendor.
+    ///
+    /// This is more targeted than [`DeviceId::from_class`]: in addition to matching by Vendor, it
+    /// also matches the PCI Class (up to the entire 24 bits, depending on the mask).
+    pub const fn from_class_and_vendor(
+        class: Class,
+        class_mask: ClassMask,
+        vendor: Vendor,
+    ) -> Self {
+        Self(bindings::pci_device_id {
+            vendor: vendor.as_raw(),
+            device: DeviceId::PCI_ANY_ID,
+            subvendor: DeviceId::PCI_ANY_ID,
+            subdevice: DeviceId::PCI_ANY_ID,
+            class: class.as_raw(),
+            class_mask: class_mask.as_raw(),
+            driver_data: 0,
+            override_only: 0,
+        })
+    }
 }
 
 // SAFETY: `DeviceId` is a `#[repr(transparent)]` wrapper of `pci_device_id` and does not add
-- 
2.50.1

