Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 17A33C9DD8B
	for <lists+nouveau@lfdr.de>; Wed, 03 Dec 2025 06:59:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A177010E712;
	Wed,  3 Dec 2025 05:59:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="AQEjkudD";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from SJ2PR03CU001.outbound.protection.outlook.com
 (mail-westusazon11012015.outbound.protection.outlook.com [52.101.43.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D0E8110E0EA
 for <nouveau@lists.freedesktop.org>; Wed,  3 Dec 2025 05:59:46 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=S2+vbLSdf1tf6aGFjYhrkWR3c5XZgb5Pft775i4xvu/J04E/Whi4mzzUAfD5aVA5Wvhn62D+NC2PNyEcsg5TNzcg1zaddZ38dq8CgqGtr/+sHphU3lNBfQ7q65k0wax6AGF4w9wWeMEf1AEBCicozOfQejV4pl/fv7+rk6I2X2pRz4CXbIoUoGERWFNWdGqtZdExPYT4Mp+x4yZKV+AHVznvbto5akpeqKceN6WXxFxsIe/gBSP1TRBREC+wB1ntUTa3gXCpMdAPjbae0576iZe3e61bCdAtr1xlglNdl5YX/zcwCSJFjafAVy7KdTlycl5ulOHZiPiXNk1/XPJEsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JE/QlFLP4akCJT9438R4KfV++PEcDJ6vlFLYrSxdR7k=;
 b=mwUHoSZjwSgTlUFM4zG339J5tDs5Ysbfu7JwxWvSSnpzkEM7px43R7mFgTOAKHSeTskKO2WhAPg2V1wsjahsXK1Ux45T4HBac3YCMH6Oob8QRCdViAqZv9Aa2vVUvnilteZg+N9XqqLTzMJfJ1wmYxfGkdp6NkOIj2oymUntv6ZjFUDUTKakl2L157FZ01AsjLBpVHrEOCggaPqudRZrwlyg0d/LkRKXbdf/BVKHwazUGX6sJhUVm/pPR+NKH9myAFlhkswjqkp6sJ7Rf+X3FGy6vfQfZJ3GKTQjjai6Wzk+1I8wFpJxqTTBWktBpVYNdKu5kC5jBuH3Lpe2uvtRNg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JE/QlFLP4akCJT9438R4KfV++PEcDJ6vlFLYrSxdR7k=;
 b=AQEjkudDMgccW48nzthucI2YCK9HtUc9JDjcuTGJUGZBWNNe5vrpyhppuWhpejk6G6PQMkpP3rllrdRkInLnbWxx1/zmP4dCj/U7s5HWOcMgiD6kS/3fXeSEOA3542dATNjGNCwaav1ezYkbh79Y60mJAw1EDtYnfUUCKPUrSFA8qbc7VEl2PDYrffUAi+Btsv8a+YhuiULAjdg6FwpNAIHsHEIURdPXrgFKyfwYua8Y8XkXqJbpZwvWZEQzsxfNdkdayl6+RTdyd1qNDiiUeOy4VuoNsw6FzbAJTrnfJEYVdZua/2ctH9vBj627VlRD6m/DykPCCTDOg19vS3Y6vg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 PH7PR12MB8180.namprd12.prod.outlook.com (2603:10b6:510:2b6::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9388.9; Wed, 3 Dec 2025 05:59:44 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%7]) with mapi id 15.20.9366.012; Wed, 3 Dec 2025
 05:59:44 +0000
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
Subject: [PATCH 13/31] gpu: nova-core: Hopper/Blackwell: add FMC firmware
 image, in support of FSP
Date: Tue,  2 Dec 2025 21:59:05 -0800
Message-ID: <20251203055923.1247681-14-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251203055923.1247681-1-jhubbard@nvidia.com>
References: <20251203055923.1247681-1-jhubbard@nvidia.com>
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0167.namprd03.prod.outlook.com
 (2603:10b6:a03:338::22) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|PH7PR12MB8180:EE_
X-MS-Office365-Filtering-Correlation-Id: 92110b9f-7d27-4cd2-9875-08de32312849
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?JdHsLoLp9WEHluAd2/VmfUx1SSQtj7mpezZS/VEyXUdZTRrgpbZlslPny/A7?=
 =?us-ascii?Q?x529LGKjKuj7xDfX62EhmKvcK5NUCG9wj9g2/7WSYZiUrz/GksdJdGQzPmo6?=
 =?us-ascii?Q?k4UHv2wiYpmhl6yqUu5E5BdIqB7V7I85Vi0ODA+cJ3wEjdUdgwRzn3CTfx83?=
 =?us-ascii?Q?hXdYpRgnKojn4BpI4bxvmqN+j+hVF5KPtBq9NLSvRNkhew1B4CC3ZMfNPl78?=
 =?us-ascii?Q?7ritkL1bEtEb8QGE6r/QkUfcpzmjW99ybq6n+3T6NwRF+WwyWnqbceiVBjiw?=
 =?us-ascii?Q?s8CqN7yfzQEPqBX0gzNe6RiLTRVvN6VAlSNr0wZrGpDnQ4aHU04I0YsRrlMb?=
 =?us-ascii?Q?gjrw2XHSXBSrRjGQc/DrsbUnJpqF1n9GDEALxDBoDfYMqWpS+WYcrgjtGXA+?=
 =?us-ascii?Q?zY/DYOtI/XML5gRMdmzhlYQt57o3q9M/JN04PlUAo2bje/90FZSpblqkzV9a?=
 =?us-ascii?Q?vPblkQ+uyM6Dmq6YNGi0ZP6072KyZdL5pyRwUbDCDdM22ypVd3Ivcs8Pcsf7?=
 =?us-ascii?Q?woIIb3zWUjekt6E5R/olUAEm4S/bhZ0Nc0eGlBmgWu6ugh0KeM26WUkmvZyH?=
 =?us-ascii?Q?o2NSveDgPWUqMBdW9RN5m4cFfeYl3Vzpg8cE595FC18LlTl9653PK/fqLri3?=
 =?us-ascii?Q?Ie0C1itjiHeyPa7Qb7QQGntK2GupyLLLf5ezpwhizXq9AMbR+zqTjbl6A87u?=
 =?us-ascii?Q?NmD+Vlq9ArJO3NTpCTDoNitG1Z1JMILJW3ce2XY6n8X1oXc6zhWrKf6V7P4N?=
 =?us-ascii?Q?oSQXlior5W4/7Or2wZGxEShlWqY7pVlTVig8eSgWStwvHRC05R+mCNMWbTSX?=
 =?us-ascii?Q?mM1z7WAIpbDree/toewtRFp9LORvAR32iRlXNjOpXS1/LAH09vJ4/ntbf0qC?=
 =?us-ascii?Q?eW9vxQuLJcymQe4cq2xNETkNcXyGVix0SEI+rfpppbkig2pc+zO7K57mKmAy?=
 =?us-ascii?Q?fJv37I6wZVPfqYhUfNAQTgzh3YubSRzay9ZYrh6uvHdU7TPJSYx9BVRV6pj3?=
 =?us-ascii?Q?3cnQpECxlDWZ/nVd1XVVjDxnEKLFQax8Bl7xzjV4BSjeFc0X/fjakRciAQ4f?=
 =?us-ascii?Q?n+n1X74iz0A+AjUUK7W0/IrF+jE2kMaIu/52p9sll/RbxrB2bBRCh28g8rZI?=
 =?us-ascii?Q?4OghSlx0vL+YFfJMykcMrHdwTAr6PC+y4V/NHQ9u56U0rYn7HHJK51htW1aK?=
 =?us-ascii?Q?unAwPRu7wO9GaChp0YIQxwMVqIoiTgPDhhXMMU+PFgRvzHIdm6A9ZInLEaXf?=
 =?us-ascii?Q?9dzs4+08Gaon673KT0FXPDts/d05khdp0I9DN4liM319PHjlqrYyUKnJEvUD?=
 =?us-ascii?Q?QAS7TXYlkDfr54ffr/BdxnP97CaMHRPnISSY446VZTnRiSb830U0mA+MdZ5a?=
 =?us-ascii?Q?21+cg+fvEaK2PmS2cnmVUuLF31c56LRP1kcAtK8VFO4p4Yd5Fsje5s6C+nJD?=
 =?us-ascii?Q?NOt/2A1qe6z/bOwqsm7ORvyEBQ7D1JMy?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM3PR12MB9416.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?vATmp4yyHvFJS0n9k52lUCYxyaXPTdsBhjXIGGlHDUiFumAl8snpzn/HLSsG?=
 =?us-ascii?Q?ScPyCEzOMnD48+w+7qkvUWmmMQvOmOrEUO5miAUWdhMloeAAiAsLrh68l7Hx?=
 =?us-ascii?Q?fUiNZwB8HBzj8NGPgbl4SBO5zipGisAMjHgeaL+w6j43b7xBKdKw6r1daLHc?=
 =?us-ascii?Q?0A6jimb+4nfOAujqFzfgzCcp6CKWDgkGZ7b+TQEfAqsaS4PSxBCUhGzp5e64?=
 =?us-ascii?Q?QgeLlSZ1mGT8Mihql5dsdlRRKil8k/0IYGY+7YbcqvH1+ALefeO95PXqaquO?=
 =?us-ascii?Q?2Y3ehoOye7xNBDh76LLDYeqjXh8kMONqQBQFVMiibxJlkeVERLHzuCpVXbqf?=
 =?us-ascii?Q?3tm/YKIB5yL1mXtIGpYoNxXL85AQBS4kZouotl2mMg7N8FrBfq5JWKWnsL5B?=
 =?us-ascii?Q?jMM1u7xcinanu3ejyAHXMFDqNnVw+283KR4fOot5U7ur9ZfNvfa2yNyIlvtf?=
 =?us-ascii?Q?1E1Q5e9UG3bfeDQZiAC9jCQO3zFQnd2pzVPp4NICN3ykVAY2EuBLGWVJff6T?=
 =?us-ascii?Q?TFPP1iM3wDb/iJbEtUUridfbALZNZZNbO0zV8i6u7ToFthMpBjYpAARomA1D?=
 =?us-ascii?Q?FSl6qyszGvteZgabbZmjz/z9S+ZTUFJAh+DKpGFmETV8uHwj2RosWa4Y6XM4?=
 =?us-ascii?Q?cxnHXuui7xuJ9N5lmsfUSldtKCup2p7x3kAWOIizl3kYLJwy9JWultLO68dE?=
 =?us-ascii?Q?emieIivCzXsQmW8UrYQicSAUg99/uBr8YRI5vWll1m1nBsDrZWP2BOgjGYvB?=
 =?us-ascii?Q?jeMynQg6xiD8J5K5mOc8KsAC2lkDk+lvHa2keQEubcXVjWcaNfHVRmmn4EfJ?=
 =?us-ascii?Q?y4oVfWJ6jX4QijRuzBP6NJ1+WETQApa9fxNPS69ieVhdeB+Rqn2erB/9k7cI?=
 =?us-ascii?Q?FqKWE9vgUGDtrolsC0CAFAN9TMhkqERsmXiGgc/fs4Vd2/oUJsrC/0tu85JW?=
 =?us-ascii?Q?wDyX4RA66MeBzvXn+y2GI4cz4J6vl6oA/Mw8smbv5uWTO8gIoajgEBHQARnZ?=
 =?us-ascii?Q?IMTq5G8AOAmj4d+r0rn9yOvf8qkaD7oYUyT8ycIepzPAHmBoAPnStQKvIEzL?=
 =?us-ascii?Q?E8lGA+9JbFwWVobZhgrhLkS16EfpWBEXgKq8MYZRvAuv7ffIbi4dOFO4oqp1?=
 =?us-ascii?Q?m5/1Pe1Fb1LLdelam7UMnN6OxDkZC1OSe5KJWe9O7HQ19hRN3tRrseBxvZOx?=
 =?us-ascii?Q?UQAbKOPHAITDz1m4g9P15D/97sx+p1d75gE0IBbkvUjJWL7dcZVYLoqdiLgN?=
 =?us-ascii?Q?jD/5CaVxIh2Yh2rsXSg/GgWV8cuohNfcsE7swtLtS/4Uz3SoE+CppiObgCnG?=
 =?us-ascii?Q?u083c/pxN52fV4nEbqcMJxJgYaefLYCgKp4RZf6VlV89FFp4kov2+tsBqloU?=
 =?us-ascii?Q?ilhZX2eUcX40oQQ9L7tBoUoexC0MH2cnq4BcN1gE9PMf96EySuU/UXKVTgpB?=
 =?us-ascii?Q?1twUY52cG2daSH/WtcINh9HCnMVcCgj2WpOLh3VEt8hOtFOWkIHJSzyltivP?=
 =?us-ascii?Q?OyQpzSUiGjillzMH+nOSFCyPEXXOWny6UVqElEjYokWpNO6ePjlfLBjKOEt1?=
 =?us-ascii?Q?xPUJza3vtRTiyrxFon0BwcoYB1iCNThVbXomU589?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 92110b9f-7d27-4cd2-9875-08de32312849
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Dec 2025 05:59:44.5719 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ny0jWmdPZT4dSvAQvYGSDnB17ZRcqOWH8J5uhW6leQ5Xoc4upbGKpQAkYG4iw1dACcJQS8nwJJteRs6FKbxMoA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB8180
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

FSP is a hardware unit that runs FMC firmware.

Co-developed-by: Alexandre Courbot <acourbot@nvidia.com>
Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
Signed-off-by: John Hubbard <jhubbard@nvidia.com>
---
 drivers/gpu/nova-core/firmware.rs     |  1 +
 drivers/gpu/nova-core/firmware/fsp.rs | 44 +++++++++++++++++++++++++++
 2 files changed, 45 insertions(+)
 create mode 100644 drivers/gpu/nova-core/firmware/fsp.rs

diff --git a/drivers/gpu/nova-core/firmware.rs b/drivers/gpu/nova-core/firmware.rs
index e45b91bb45a3..5cbb8be7434f 100644
--- a/drivers/gpu/nova-core/firmware.rs
+++ b/drivers/gpu/nova-core/firmware.rs
@@ -24,6 +24,7 @@
 };
 
 pub(crate) mod booter;
+pub(crate) mod fsp;
 pub(crate) mod fwsec;
 pub(crate) mod gsp;
 pub(crate) mod riscv;
diff --git a/drivers/gpu/nova-core/firmware/fsp.rs b/drivers/gpu/nova-core/firmware/fsp.rs
new file mode 100644
index 000000000000..80401b964488
--- /dev/null
+++ b/drivers/gpu/nova-core/firmware/fsp.rs
@@ -0,0 +1,44 @@
+// SPDX-License-Identifier: GPL-2.0
+
+//! FSP is a hardware unit that runs FMC firmware.
+
+use kernel::{
+    device,
+    prelude::*, //
+};
+
+use crate::{
+    dma::DmaObject,
+    firmware::elf,
+    gpu::Chipset, //
+};
+
+#[expect(unused)]
+pub(crate) struct FspFirmware {
+    /// FMC firmware image data (only the .image section)
+    fmc_image: DmaObject,
+    /// Full FMC ELF data (for signature extraction)
+    fmc_full: DmaObject,
+}
+
+impl FspFirmware {
+    #[expect(unused)]
+    pub(crate) fn new(
+        dev: &device::Device<device::Bound>,
+        chipset: Chipset,
+        ver: &str,
+    ) -> Result<Self> {
+        let fw = super::request_firmware(dev, chipset, "fmc", ver)?;
+
+        // FSP expects only the .image section, not the entire ELF file
+        let fmc_image_data = elf::elf_section(fw.data(), "image").ok_or_else(|| {
+            dev_err!(dev, "FMC ELF file missing 'image' section\n");
+            EINVAL
+        })?;
+
+        Ok(Self {
+            fmc_image: DmaObject::from_data(dev, fmc_image_data)?,
+            fmc_full: DmaObject::from_data(dev, fw.data())?,
+        })
+    }
+}
-- 
2.52.0

