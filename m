Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CB149C5B04F
	for <lists+nouveau@lfdr.de>; Fri, 14 Nov 2025 03:41:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 46A2210E985;
	Fri, 14 Nov 2025 02:41:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="OS3qFsAB";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from SN4PR0501CU005.outbound.protection.outlook.com
 (mail-southcentralusazon11011003.outbound.protection.outlook.com
 [40.93.194.3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B019510E985
 for <nouveau@lists.freedesktop.org>; Fri, 14 Nov 2025 02:41:20 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RsI2ROgcem8ZXti1cW2E+xY9FwiHOn7lKA2QYFH1nCJNGdamwFw3+zPPZIuikwYqtFkPF28juffUpMWq1ioYbZecGM2fqGdHIlyeUtkAQdHfNy+JEXMmHo6prFOn6jseuc8AY2V/ORFwtGkuH9Fx/clxN9ZuzMsncqutNwAXuXGARU1YuK1vgNLpY8rHC2jLiXW2mYWVkqUfZIHEOE185wOfIACq+g9l6EuL0KG07mxb0Wya2f4cpJfhzZXiBIozRZnM5YqnEgvme2rpAgffcV2B2e+1jhzUpHrE/drItjmO47b5ZL+dS+ZnvQZ1q1Ct1m7Ogp+GjAvvkQcXVY1t5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=I1kg9x3e+fF4tuXU0vh6mUs7OqJ/6fyyfH+kjJJFMmU=;
 b=pAjDPsPQP7LElTV1kh06xxKLztbAgPhPvQ5Y8XPKZ6cQr+FrO2fzu30RZfBjgoT0DNKw7EUpUEnczidQI4xHuuogNmnf6V0rs4sNuYh2W71rTWq7FOn/9+N05RpavUQ/M0bU4j6pS/0Ja5Hg8ZylCm0VYbyAWE7rn91KlLkRerf/DND8GGFFxYbbh4MKmj9WG4TcyTMqWqaTccG95nP3er8xtPoF+GBnd04L/zeTqzDDqailnj/UfUuXafczKlc0Rdf1ASzH74gKu/pgafbPzpr+5xIxdO8YwquhbhFA6C3DiGJHvvF1AfrQA216gvNk4LXwL+Kh+AJmaCIb6dd2dA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=I1kg9x3e+fF4tuXU0vh6mUs7OqJ/6fyyfH+kjJJFMmU=;
 b=OS3qFsABxwk3UT0MowSsbtePRHAMbBT7eFPsSUFNpOOAptz0bk28U440WUxO42oYLRjjP3DorZTwOK8h4TY2z90qGoXVnQ7zsWrlEaUoxyw21628dkMHMIQ+G7xBWeJGMeM/yo9pzTyBb1VQde3eJHmK0YjifrstzrSFsVnysBCWNgMe+PvAS8jS0vM9F8brv9RiMsfIwC8ZOlOTxon4pISIj1I1WFSYq55Ebp5VRoVbWDJUXyCPj/GcypNjFjIex+M/XOYpLuD4K4vUaInkPHXbgdzWjoNQkLqREHO26Lp9EqHQbj2vpjHvTpM8lph61oQuMCn0uQ8F8cApP/9brQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 PH7PR12MB7986.namprd12.prod.outlook.com (2603:10b6:510:27d::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.17; Fri, 14 Nov
 2025 02:41:18 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::d622:b3e9:bfe1:26bb]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::d622:b3e9:bfe1:26bb%7]) with mapi id 15.20.9320.013; Fri, 14 Nov 2025
 02:41:18 +0000
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
Subject: [PATCH v8 5/6] gpu: nova-core: add boot42 support for next-gen GPUs
Date: Thu, 13 Nov 2025 18:41:08 -0800
Message-ID: <20251114024109.465136-6-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20251114024109.465136-1-jhubbard@nvidia.com>
References: <20251114024109.465136-1-jhubbard@nvidia.com>
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0390.namprd03.prod.outlook.com
 (2603:10b6:a03:3a1::35) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|PH7PR12MB7986:EE_
X-MS-Office365-Filtering-Correlation-Id: 7160f609-9dc4-469c-d85d-08de23274977
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|376014|366016|1800799024|7053199007; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?AXiOykrAjm2mbtxJm5YZsT0w8FAVz9sMRBcHOJnSOYZeWB+yJNdIZ1KUvc7O?=
 =?us-ascii?Q?XmnkDd25BRMkqKVB1HCnmPTbCgdF+1wLYEfW6nGFHCqYI2xy3YmmT001Z4aF?=
 =?us-ascii?Q?iompNUeOjjd347PMmOG1bDW7X552PJZWO58LQ8H6kMCNvoN3+uc5f/Qz4gW2?=
 =?us-ascii?Q?J45D0K/BRH+9wZ8zbk9657yIGINZlid0+mE/LnVSsu8dhh6uUcOXrlmeJwuF?=
 =?us-ascii?Q?qf9jebaMASqdCQLzDvtJEhoWdqR8q1UycLGtoFvIByKjgDI2NF1nFkEKy98y?=
 =?us-ascii?Q?/1KnYQqqW187qLfeOpSG6NDkWIRm/ki+jME9vxKmg33HI5iYtm1L4tU2TN6p?=
 =?us-ascii?Q?UViRMoBYYI85XuEKyhm5Upo25i7sNC91UuH5Xb9n8UQPETLEm8+9VzOAsIbY?=
 =?us-ascii?Q?5wYIVnsdHZikej03gQ6hKLcUzvd3NpMUT411CLps6x+Yx/G1e3cN8Z4sq6FE?=
 =?us-ascii?Q?PEPZzYoaUZV+wzpdlS8jG+IxsFjoJ7R885YNmbopY6X7pbylhguVdnTsedBL?=
 =?us-ascii?Q?+EHiAL2f/GSMxdGA3rvJI1bFaKq1a9doJZSMqjyz4Da0UXhrXe5gKo9v5GUn?=
 =?us-ascii?Q?jfKPu3tgCexb4yzLOxKQ0cXBhwQOtHQSerGW8OSxMko2kQHg7PjFEJnpw59t?=
 =?us-ascii?Q?17HPtZfQFADW+zW0CYd+NUqssbT5FtN2g6bBabYhLHRkEfKdJ9li7Z03kSPj?=
 =?us-ascii?Q?X7cPqF69VmeTtUQh7/VBQWl2Auu3SO1n7N4cLFBpj7Z1PtVuiKio45krQd+X?=
 =?us-ascii?Q?tcW90q/OvHbGqb00NDwu+kHmgtG0yyN78F01LGxvcKNEeUBATHdTiurP2R6T?=
 =?us-ascii?Q?z1GS9Onq79rbcaqyFMpoVZilKnPv+P+i5YhrPeLSE1v/HxGywSqfkE8FoXPn?=
 =?us-ascii?Q?Qv6I5gqMdmQ4FaBNGCgQTXTAQ5VqOPWqSTznJoFU+XqIlQ+M1Lv2mSQ1berK?=
 =?us-ascii?Q?V5I8sWANIZeACaXssqCTTJmij7NMpEqHCy0zCCWfibRgbVkcF4sqF2iYX9PV?=
 =?us-ascii?Q?PNNSzEd7d5MjZ+Z+bxFRfTs7fuP2tms1jlZj2QFKz9AimWCtG0xvF3eNQu8Q?=
 =?us-ascii?Q?dkecacvU2q/klOc4PACvkthpTArjjmIBwezgCbF4R1lVlgPv3E4U7ViSKP65?=
 =?us-ascii?Q?4HuhnJCcIhE3oHHmrRWYtq2Go24640qYqE8gloasAnfUBNzqZxtwzoQKHmSB?=
 =?us-ascii?Q?ChH3G2FqMJ7NX2c5awgFmymCukXzxOBl2tP7wGewEjXPKdT9reqS+0zPgrVU?=
 =?us-ascii?Q?A0/nO2u8lD0ycSBEfDKpSkZ5AFZ5YBL75sc8fe5IMuethkqJ49MU0jKs3K0q?=
 =?us-ascii?Q?xziB3g65SN8vgbINr3wBkYjDhlA1KNa1vcTVAvLub+Nr2M/UIMcAaTOb61rZ?=
 =?us-ascii?Q?FNVB9tyENH3tyRTB+mHwA13IRaBBcV49O/m5bOS94bKOQ+bh5FQPMm8ColH7?=
 =?us-ascii?Q?NoMAHavb5DycPZvP6H5eTPSvzzPSKcCH?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM3PR12MB9416.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(366016)(1800799024)(7053199007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?8kQeP2rV3282f5REx30e1mImLuoN80uhGjuWbADOEqlLH3hMAt1tQ6y+KrZK?=
 =?us-ascii?Q?zVndXBiujp2aUwFeaK/9NC+GFsXyuRW/mQTr5/fY0uuViTyDh0OMc/iwb3Pk?=
 =?us-ascii?Q?naM7eMxHgo1xsg80VQ/+6VEH3/8/Htje2YQQ+rUSAu5rP/wXLN0QkVjdDJsz?=
 =?us-ascii?Q?+ZS5FHaJ+HB7UNNLvNunhmVsqV4NT+i/zJxNu/ztmU7+L/nFxOY19bHRyrDW?=
 =?us-ascii?Q?RViXTM1NcmqI1oKglvkvVLkrVGHFFb/xvYR427RmrK+e14CzUVGbFF/r5n3k?=
 =?us-ascii?Q?1qxH2FO0EOkF9CGuImpvXE4GFc9wXw1FowVXtRUtIPPQFvJ0iceHz7WTZRDa?=
 =?us-ascii?Q?ObqoRKCsh6GNtL0Hk8qzWwJelAA0XDTvKkQwi55nej25Q8eSkkUR7CpBQkzk?=
 =?us-ascii?Q?zpVMcpGo3J5eNEU0q7ea00mQjAmtfmSNhJw7Pk9S6ZfiAlD26w9vkRJ28DlF?=
 =?us-ascii?Q?dPnRwLQwmPhPaCEzPs88oMSb907aQVIP0Dgr5uQwnuulk5u+OyncLNB9+2vF?=
 =?us-ascii?Q?l5sxwv/6ndKJ8CGpSRy+dYZAzLmv9liDdUE4YVlXp8X/OpOMGUY5BZr9fSbS?=
 =?us-ascii?Q?aU36GA7OxCtVqlDpvrXH/21xazfkgG/VXb4FfDqHxKmPGDg0mm2fGkYnIWu/?=
 =?us-ascii?Q?/ktdKqvh447iQUMHxW7ji+uz+IYYb4ENq8tpKpFfy0OI1667PqEbh3FYQFtW?=
 =?us-ascii?Q?ecL571gA9IhsUhApecfhSHoN/i92ypIo9sR1kNBmmndZ7WRbhcsB0Jn0Ywll?=
 =?us-ascii?Q?XMYujaqbmsO2Lr71u0x0uJv/KnqnHFGnpTqDt/nZW8GA9vyVTq5jHvt8heS6?=
 =?us-ascii?Q?hdgSyGqrlAzjGvDItUZKrWhkfoGxHTI8CSoa5ZyZlBqhPkUC/O7DIRUKxkSt?=
 =?us-ascii?Q?iw1pnIkJc9X2Vd2PZk8tcwC0pJ9E5x4Y/G6RWS5K5qRwqmlaE1CPWGGIidfv?=
 =?us-ascii?Q?I2ePESGao+4tT07jnvwTTWwJsnnRMXXUyEa/ORIeWVc/w2NOcv4FnAp8Xgwh?=
 =?us-ascii?Q?IHHIDHU3M9/+n9qersVxGrMhKnbmDr6wr7zQffzDXpeNl2iBdcmtv9q3xbo8?=
 =?us-ascii?Q?//CSLTJMR2TJe6rqS4XdnqDqj8H8y9W+JnmYc/iDqG02COQKJjajagQcxbZy?=
 =?us-ascii?Q?6o0OwDq2LOz7KBc3JqR5deEeTst/h8uaPAOtZFJLFwFJSxXIMnYu72BU571U?=
 =?us-ascii?Q?Rfz8ztN7/CUmKRCdBIJhKH0Sc/VOD9bb7SRuBzG0/UiOHnlD2NrSs/ItSJ8v?=
 =?us-ascii?Q?mJMh4yaf6n0D85xgcn7azxj0B04hEATBnQgTN16gOevtghFYfmBEvL4/+fEA?=
 =?us-ascii?Q?RpG+0NGSd0zDj+Pu+JISbFNDEZSw6/oO7fWBGP5OpOHPXWGDlGD97OoJ9mCf?=
 =?us-ascii?Q?Mmz3rTlmYj9Q3puosfl/W3o0PtVQC1GOvax3tQ51ITKjh3LK2A7ahX9xJ/13?=
 =?us-ascii?Q?EPLSwPQZnuBaPtaGTR5576b3pB2Tiy4icVa2V9WJGZtHYNGcuTN0+AxNi3ve?=
 =?us-ascii?Q?MHpo7fRx2Q1o+uqenNIzxA1V3HgM8UuWmq08ENg9whLFPu98Zlnxobr1+RBn?=
 =?us-ascii?Q?DaVqYRkZ+QQDKPNihqkj2YHVKwmvcvQmT197LEfs?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7160f609-9dc4-469c-d85d-08de23274977
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Nov 2025 02:41:17.8831 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dI6oit4SKDIqA8jv1tcQCHjkKQ4hx4Oq/N0pWYXUty40SfpAHZuomfJCaqR6pC8rXdhf1NP9rGykRu9J+kNrjg==
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

NVIDIA GPUs are moving away from using NV_PMC_BOOT_0 to contain
architecture and revision details, and will instead use NV_PMC_BOOT_42
in the future. NV_PMC_BOOT_0 will contain a specific set of values
that will mean "go read NV_PMC_BOOT_42 instead".

Change the selection logic in Nova so that it will claim Turing and
later GPUs. This will work for the foreseeable future, without any
further code changes here, because all NVIDIA GPUs are considered, from
the oldest supported on Linux (NV04), through the future GPUs.

Add some comment documentation to explain, chronologically, how boot0
and boot42 change with the GPU eras, and how that affects the selection
logic.

Cc: Alexandre Courbot <acourbot@nvidia.com>
Cc: Danilo Krummrich <dakr@kernel.org>
Cc: Timur Tabi <ttabi@nvidia.com>
Reviewed-by: Joel Fernandes <joelagnelf@nvidia.com>
Signed-off-by: John Hubbard <jhubbard@nvidia.com>
---
 drivers/gpu/nova-core/gpu.rs  | 32 +++++++++++++++++++++++++++-----
 drivers/gpu/nova-core/regs.rs | 22 ++++++++++++++++------
 2 files changed, 43 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/nova-core/gpu.rs b/drivers/gpu/nova-core/gpu.rs
index aa8e881dd474..9bc94811741c 100644
--- a/drivers/gpu/nova-core/gpu.rs
+++ b/drivers/gpu/nova-core/gpu.rs
@@ -174,19 +174,41 @@ pub(crate) struct Spec {
 
 impl Spec {
     fn new(bar: &Bar0) -> Result<Spec> {
+        // Some brief notes about boot0 and boot42, in chronological order:
+        //
+        // NV04 through NV50:
+        //
+        //    Not supported by Nova. boot0 is necessary and sufficient to identify these GPUs.
+        //    boot42 may not even exist on some of these GPUs.
+        //
+        // Fermi through Volta:
+        //
+        //     Not supported by Nova. boot0 is still sufficient to identify these GPUs, but boot42
+        //     is also guaranteed to be both present and accurate.
+        //
+        // Turing and later:
+        //
+        //     Supported by Nova. Identified by first checking boot0 to ensure that the GPU is not
+        //     from an earlier (pre-Fermi) era, and then using boot42 to precisely identify the GPU.
+        //     Somewhere in the Rubin timeframe, boot0 will no longer have space to add new GPU IDs.
+
         let boot0 = regs::NV_PMC_BOOT_0::read(bar);
 
-        Spec::try_from(boot0)
+        if boot0.is_older_than_fermi() {
+            return Err(ENOTSUPP);
+        }
+
+        Spec::try_from(regs::NV_PMC_BOOT_42::read(bar))
     }
 }
 
-impl TryFrom<regs::NV_PMC_BOOT_0> for Spec {
+impl TryFrom<regs::NV_PMC_BOOT_42> for Spec {
     type Error = Error;
 
-    fn try_from(boot0: regs::NV_PMC_BOOT_0) -> Result<Self> {
+    fn try_from(boot42: regs::NV_PMC_BOOT_42) -> Result<Self> {
         Ok(Self {
-            chipset: boot0.chipset()?,
-            revision: boot0.revision(),
+            chipset: boot42.chipset()?,
+            revision: boot42.revision(),
         })
     }
 }
diff --git a/drivers/gpu/nova-core/regs.rs b/drivers/gpu/nova-core/regs.rs
index 8c9af3c59708..81097e83c276 100644
--- a/drivers/gpu/nova-core/regs.rs
+++ b/drivers/gpu/nova-core/regs.rs
@@ -41,14 +41,24 @@
 });
 
 impl NV_PMC_BOOT_0 {
-    /// Combines `architecture_0` and `architecture_1` to obtain the architecture of the chip.
-    pub(crate) fn architecture(self) -> Result<Architecture> {
-        Architecture::try_from(
-            self.architecture_0() | (self.architecture_1() << Self::ARCHITECTURE_0_RANGE.len()),
-        )
+    pub(crate) fn is_older_than_fermi(self) -> bool {
+        // From https://github.com/NVIDIA/open-gpu-doc/tree/master/manuals :
+        const NV_PMC_BOOT_0_ARCHITECTURE_GF100: u8 = 0xc;
+
+        // Older chips left arch1 zeroed out. That, combined with an arch0 value that is less than
+        // GF100, means "older than Fermi".
+        self.architecture_1() == 0 && self.architecture_0() < NV_PMC_BOOT_0_ARCHITECTURE_GF100
     }
+}
+
+register!(NV_PMC_BOOT_42 @ 0x00000a00, "Extended architecture information" {
+    15:12   minor_revision as u8, "Minor revision of the chip";
+    19:16   major_revision as u8, "Major revision of the chip";
+    23:20   implementation as u8, "Implementation version of the architecture";
+    29:24   architecture as u8 ?=> Architecture, "Architecture value";
+});
 
-    /// Combines `architecture` and `implementation` to obtain a code unique to the chipset.
+impl NV_PMC_BOOT_42 {
     pub(crate) fn chipset(self) -> Result<Chipset> {
         self.architecture()
             .map(|arch| {
-- 
2.51.2

