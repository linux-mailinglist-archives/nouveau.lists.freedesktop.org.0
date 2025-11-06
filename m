Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 682BCC38B27
	for <lists+nouveau@lfdr.de>; Thu, 06 Nov 2025 02:28:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E3D810E7DD;
	Thu,  6 Nov 2025 01:28:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="bQkHq0D1";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from MW6PR02CU001.outbound.protection.outlook.com
 (mail-westus2azon11012051.outbound.protection.outlook.com [52.101.48.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3315B10E7DD
 for <nouveau@lists.freedesktop.org>; Thu,  6 Nov 2025 01:28:04 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QOuuBgXRCyAPj7IdTqIpg0JEo4KnUo3rqznBpb0cnT3ZwKUkuHy5VLoh5fKhkuOeHF+pps8kF3kuuY3tlyUjI6tmd60lHgPfRdVFiT/OMXYu6ri06bfWQKxNnlJCVNitnde4C4A6MtJH41Mm/xPvoV40GePgY3eEJ40J4vSVK1X4SZ0mMw/ZyLYBG1Qu6bNexYg169/4SmkNpf2CMrM2NUJOeKhPQb/gDrOxM0sCHEfiLKwrkhrdN3YDuP783L4peXPQv5wYlmRPfd/5NPvVYWNdbaTXpONgCsLHXY17nw8KCOsDPareYx2tSdfPK8LpfzbXdLaFUAZg6bql3YqL8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cO8r6Kp8TkkTILwoyPoZIPmqB9JWtYK6Sm0bzhQmPCM=;
 b=rbh2mACtd2gQMha28LZt3KWLwqP4Sw7BlMKUpldziNIWnfu9GNd0/U2rpHm3jUboxP+uhaM3ikgRX35iEvq+GGWFA6GuUgccFn8UbFLWk0JCmGSBiDrHiUlymVPCMu6EHLvCLzBSW+xzzoHFVsGFzQxedyuUZSjvI1Y93ENTgzCMxW0fXdasl8pqtLvLNR9k5WpXNhvLPQCG6byJKNKK16I8S0pU9wSB59RlzYRU+ZT0O6QRIX9bLkiHSP8Pvm36SU+ORJvgMJpJ3nYuGy/ZFlKGj8Nyq2wu8bMueewC8gX9bgWEXr5l+fSS2doHC0eZfcweos7pvYaKmQ/idb561g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cO8r6Kp8TkkTILwoyPoZIPmqB9JWtYK6Sm0bzhQmPCM=;
 b=bQkHq0D1IAOt6zSn7TM7yo6F+zR+FkzjQ9KiRoNuy7bzijHnSn5SF+I3KrQp8CR1HbSgzQjt5x7OTCzRZm3RKHEdKijb8GSyJmw6FSnIfCGUsXYUqcqs+AYO9BcixYZwx+Fcao6YbO3jXiz580XMhscfXW/gUqG/IQSIqPp1NHYTdQPwj+KnQUUJ0Yz7MsxI28C8Fz/OfYZDihcp6qIWxka05LfjgaUNlmNlffCFeiFZQspoLIwqRU7uzZrg59trA73lYVC6YAC6BKQ8zgLvoexe5F95I2g/BKn5qAjEDjtyK1nDSpX20vNPeGg54qqmVVxbYHAfEUOIRZqf+vXAZQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from BY5PR12MB4116.namprd12.prod.outlook.com (2603:10b6:a03:210::13)
 by CY8PR12MB7658.namprd12.prod.outlook.com (2603:10b6:930:9e::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.8; Thu, 6 Nov
 2025 01:27:59 +0000
Received: from BY5PR12MB4116.namprd12.prod.outlook.com
 ([fe80::81b6:1af8:921b:3fb4]) by BY5PR12MB4116.namprd12.prod.outlook.com
 ([fe80::81b6:1af8:921b:3fb4%4]) with mapi id 15.20.9298.006; Thu, 6 Nov 2025
 01:27:58 +0000
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
Subject: [PATCH v5 1/3] gpu: nova-core: prepare Spec and Revision types for
 boot0/boot42
Date: Wed,  5 Nov 2025 17:27:52 -0800
Message-ID: <20251106012754.139713-2-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20251106012754.139713-1-jhubbard@nvidia.com>
References: <20251106012754.139713-1-jhubbard@nvidia.com>
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY5PR13CA0028.namprd13.prod.outlook.com
 (2603:10b6:a03:180::41) To BY5PR12MB4116.namprd12.prod.outlook.com
 (2603:10b6:a03:210::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY5PR12MB4116:EE_|CY8PR12MB7658:EE_
X-MS-Office365-Filtering-Correlation-Id: da409bc3-3670-4662-4ac1-08de1cd3b820
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|376014|366016|1800799024|7053199007; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?K2DvnxvqbA3Fln1rYgAYHTSEsf3BWIT3Ziwb7grbPcBxXT80SiN3FhEMZloo?=
 =?us-ascii?Q?qnAUGe6iqO3wCn0OesNXLslBGVfzEOE1WsbbEBfdLjgHuyazufTJweHFv6L0?=
 =?us-ascii?Q?/9SijgpF/KcDlUSaQvUnzB71zRU9O37pelj5WBS16xakxHpkdi9UEvWtIAhC?=
 =?us-ascii?Q?eIyazp4YdilOYunguhJ7pc983w31yP2rBongTqM+QrEgKW8Ywjk/tECaoUmY?=
 =?us-ascii?Q?cR+E2FWvxc2Q/bIGi2UCmOOUW0IBLrLNtwzaK23NK2ZHzTuLXibHxLXIO+yP?=
 =?us-ascii?Q?IzrVqKtYkBIH665oyfZ4u2dvNddLOP7H9SeLHkMjxMQjD0fEBaj/aMNim2W+?=
 =?us-ascii?Q?DGrx7Izheh+/0Hyr1sPkJgqJem7nULsrqG9ufTPAzi+27GkcM3A2o3a2WHZ3?=
 =?us-ascii?Q?m/dcPI+b6PMCcfbBDNCRkrhUAnZIAj4gTOb/gt1Xkjh7By5JHsAyhMa3kVjP?=
 =?us-ascii?Q?pHnwbg/3564kh/er0BtsiY+gI7CaTN3piBaSigQo0PyleQq2mNkEzmFnaEHI?=
 =?us-ascii?Q?1D+lH0IvrXJwYsEpyYVTHt8mS1WKljIHkxRWjFV7dgPTTktAO8PpzhIqSWUl?=
 =?us-ascii?Q?KgtE0EnPW5392ukc7Npunn7ayZeoHD+PphYw9DEKIuCH+ho0RavMjYG2H+0r?=
 =?us-ascii?Q?IuQQ679HXfxYuAH2BpJX3NcCsw/p69pmMwSjq1PuUsqB5g6K8eoczFAjkFhQ?=
 =?us-ascii?Q?5WzwsoYkT6EqdT6h7zK7LHfOJbIy2iiaBTUAgJq18jgfE6JkLwhogUTdNP6H?=
 =?us-ascii?Q?BdFFPg/JynlqIZPVYOsDhvV4J6HLUfGsWr1Sv4NrChM/JnPkv/BMLPpUTJpI?=
 =?us-ascii?Q?lW04KKs5YCl2sqpz+ZY6HZgO7xXwkTyqw9eS7vbj76zOyseY556F6sfRgyVK?=
 =?us-ascii?Q?UN3k6GeUq8o4Y9w05mBr8QeKilQsRSLOIg4jBlEaw7mRIlRZ53vqglue1SSd?=
 =?us-ascii?Q?oZZxVVGOfTn2jQAhQH+Xj5S4Wxoi2l937tTXTkbNFGNYDozqUl5GnTQtfHYu?=
 =?us-ascii?Q?2THoyL1FWdwxqW8BKiXE5Y4TGF4g/nEZextWxm/bVrVQLkIFoQ4U6HgbojUK?=
 =?us-ascii?Q?7vyhWRihie6+T1I2knnnnFae2SrjZIGqGEdEOEGO/paFf4PXYujG2bj13pZN?=
 =?us-ascii?Q?Om8kC2L9TIMxrSv5iSh6NuDMyrNB4BHvW5rFOQxmzEYZQNXb6RxvzYRwGzfG?=
 =?us-ascii?Q?+punL3Pos0RyPbCKYYk15++BkMnoBPKwD8z1tVQcDM6dNo/HDJVWyWRQBwBv?=
 =?us-ascii?Q?2GQzMTE2Zk5DObz7EOOMsGKs99OuKLAKF2d9ul5WtdZYHEdz9K1LMZ0H/l3b?=
 =?us-ascii?Q?lzQ7mMTUaGPhyJx2hr6z0MwmZtRCRPd3sQwsZtFW6Q6t/2Azuz8BnuHsA0Qq?=
 =?us-ascii?Q?anDoe4jkhKWM6DqCaM2fq4jqxnVR6q3sTsEOVsQRectz/iG2RxeoLXllOPo2?=
 =?us-ascii?Q?eVSZppjBCETaBj9GVrER2x26Jlrn3T8M?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR12MB4116.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(366016)(1800799024)(7053199007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?pnW2NsCbSOhXPXAaJw7EYhd+pRiGGrXh83+vqsGN6+8TMT9QgwyQFCZIGrB6?=
 =?us-ascii?Q?tysOsNJQMy5g+oDSJbOFrCvPdt8D8/bXnCXNH15zEt1np0bwVGwrVJUlrYBa?=
 =?us-ascii?Q?4AGqGcgmpos8mz8Oe6txYgDASPzm2cDm3EMVBx3cpJg7+STjNYJytZpHCVEV?=
 =?us-ascii?Q?PDT7UAOLG/Cam2fQcfHpbJUJVeXC/jJR9Ks4HO71e2Yh5+LlOl4s0uRbwFCm?=
 =?us-ascii?Q?ZZ17mDFAgdO2VJlpGjyUd3QWAu58oVAAJyCVgZBCwzbY5hVL7DCh5JRjr7rI?=
 =?us-ascii?Q?6ZYN0+dfq4cwmvfRCDksIdX40qvvIywBaM12mr2AD+29/9YQX9H9zTVPXeH6?=
 =?us-ascii?Q?QZ4/2/4KEZ5TaL9ujfxBzfu6lRD6nN8AiH94KKXjImqOOpTNWUVMHjCN67qn?=
 =?us-ascii?Q?VtqpBhX+NOk/esaW14kpHyn5UPK9QJpYy2wqwl7ySPkytdshxsk4GDCA55EL?=
 =?us-ascii?Q?o2AJXqdhSSc2wahbFHKSNmNUgxWrJx/SwMh6tyz3dPQe3jlpjrCdEpWsYOka?=
 =?us-ascii?Q?JpgBH3Iyb5eBf3w8XhWcFYF7uBplPjLJHy9RSUe7Jt7xa5TAF+CTXlM377rK?=
 =?us-ascii?Q?QZWNqpqYKtWrJ2d4QWvPc0ZLf0trdjw2hzPbpV44lIvgxSVdNBF2K3X5UgD3?=
 =?us-ascii?Q?UtS8u/zQ/xfB3U7p5w2Ad2dCc02jhQePoXESPrwONfg/aVeuWINrlWe3NKB1?=
 =?us-ascii?Q?yEhfsv0vC+C0yvG8FE8G/KKQzKzUZPHK4PDMaTbAElQbdm+jhPYoRp+OuaDq?=
 =?us-ascii?Q?TNWkyVsX6mzHzc9n+Ay5hcAv3vP/c6FwQ7xagblHhUBTd+/mIUvw2dFi0rqX?=
 =?us-ascii?Q?YQehfShLp3+HLCa/7cdv0L0h4BCwsLVN8PItc3+Z0JFk3KyalkkTBySRXJqa?=
 =?us-ascii?Q?M/6JKO14WQTdzgUxzg+1BRtDR5329d+DoCBHf64A2RbXKMrDog0XbY1dCmbT?=
 =?us-ascii?Q?GmlJE69w2JUFIiJ4gg602NHGgiHTmLuQDxpelieSsktZJN8wO2ogrBUXqkCz?=
 =?us-ascii?Q?g2OYmM2zzrO+Fhs6ocnst/aXMCWf/rm8B86apuu9jvu8D9x28cQMhVey1Cv8?=
 =?us-ascii?Q?loqSHSq+o0Ps48yMXSealoF7aL+CdrWXPY6ePzoGyKWjR8oiE2ne/8K14KcT?=
 =?us-ascii?Q?s/Fm8egC69MxbapLFRQya4ByDgynueDY34DGWBBkgeybuh3wiQTspk2vcJRG?=
 =?us-ascii?Q?wrX/9qiI9RgEM5KSBTBTqhV1/VmDfAYyRJkfSA4KQ6nb4aflXH0cFnxFOUvX?=
 =?us-ascii?Q?ueM/n6g6jfN1yYM8UQW6rQo/T5Wyz05jvNxLHp/XW0a6WFZjUAQ0iETtKDlK?=
 =?us-ascii?Q?FAwczuEffxe9ZP9ngxu4gqpaw7sd34gNnmKiKTVx/nHBfxZQd3m1msoKYVe2?=
 =?us-ascii?Q?z80rgeSCZTs+KI2+ubsqd95GFsW8DVc3v376wXA7c48gTRb6+vPjVWL34Ldl?=
 =?us-ascii?Q?NCT6/kDmgpCma1ZlCH1Fwz5Sys16uzWe2DkdrzzpvBrxtaDJBa/IR8iimmPn?=
 =?us-ascii?Q?0M/v6ObBEcTJmqnXnbuzwzhuljKuChToCcnH57majz18FnG+mhT/1nSkaTTx?=
 =?us-ascii?Q?10/T6/0NVoesG0z9q0qM8bL7qElT3WZ0gANcYoeD?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: da409bc3-3670-4662-4ac1-08de1cd3b820
X-MS-Exchange-CrossTenant-AuthSource: BY5PR12MB4116.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Nov 2025 01:27:58.7484 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PeiXYplrp89l6HB5DfqJRLHVCJg2PKz9euXpcsM0kccWcxuJ9/xbGdtEN+RN5MTuFKwXR3UCGsi86dohdnPpXg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7658
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

1) Implement Display for Spec. This simplifies the dev_info!() code for
   printing banners such as:

    NVIDIA (Chipset: GA104, Architecture: Ampere, Revision: a.1)

2) Decouple Revision from boot0.

3) Enhance Revision, which in turn simplifies Spec::new().

4) Also, slightly enhance the comment about Spec, to be more precise.

Cc: Alexandre Courbot <acourbot@nvidia.com>
Cc: Danilo Krummrich <dakr@kernel.org>
Cc: Timur Tabi <ttabi@nvidia.com>
Signed-off-by: John Hubbard <jhubbard@nvidia.com>
---
 drivers/gpu/nova-core/gpu.rs  | 45 +++++++++++++++++++----------------
 drivers/gpu/nova-core/regs.rs |  8 +++++++
 2 files changed, 33 insertions(+), 20 deletions(-)

diff --git a/drivers/gpu/nova-core/gpu.rs b/drivers/gpu/nova-core/gpu.rs
index 9d182bffe8b4..8173cdcd8378 100644
--- a/drivers/gpu/nova-core/gpu.rs
+++ b/drivers/gpu/nova-core/gpu.rs
@@ -130,16 +130,18 @@ fn try_from(value: u8) -> Result<Self> {
 }
 
 pub(crate) struct Revision {
-    major: u8,
-    minor: u8,
+    pub(crate) major: u8,
+    pub(crate) minor: u8,
 }
 
-impl Revision {
-    fn from_boot0(boot0: regs::NV_PMC_BOOT_0) -> Self {
-        Self {
-            major: boot0.major_revision(),
-            minor: boot0.minor_revision(),
-        }
+impl TryFrom<regs::NV_PMC_BOOT_0> for Spec {
+    type Error = Error;
+
+    fn try_from(boot0: regs::NV_PMC_BOOT_0) -> Result<Self> {
+        Ok(Self {
+            chipset: boot0.chipset()?,
+            revision: boot0.revision(),
+        })
     }
 }
 
@@ -149,7 +151,7 @@ fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
     }
 }
 
-/// Structure holding the metadata of the GPU.
+/// Structure holding a basic description of the GPU: Architecture, Chipset and Revision.
 pub(crate) struct Spec {
     chipset: Chipset,
     /// The revision of the chipset.
@@ -160,10 +162,19 @@ impl Spec {
     fn new(bar: &Bar0) -> Result<Spec> {
         let boot0 = regs::NV_PMC_BOOT_0::read(bar);
 
-        Ok(Self {
-            chipset: boot0.chipset()?,
-            revision: Revision::from_boot0(boot0),
-        })
+        Spec::try_from(boot0)
+    }
+}
+
+impl fmt::Display for Spec {
+    fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
+        write!(
+            f,
+            "Chipset: {}, Architecture: {:?}, Revision: {}",
+            self.chipset,
+            self.chipset.arch(),
+            self.revision
+        )
     }
 }
 
@@ -193,13 +204,7 @@ pub(crate) fn new<'a>(
     ) -> impl PinInit<Self, Error> + 'a {
         try_pin_init!(Self {
             spec: Spec::new(bar).inspect(|spec| {
-                dev_info!(
-                    pdev.as_ref(),
-                    "NVIDIA (Chipset: {}, Architecture: {:?}, Revision: {})\n",
-                    spec.chipset,
-                    spec.chipset.arch(),
-                    spec.revision
-                );
+                dev_info!(pdev.as_ref(),"NVIDIA ({})\n", spec);
             })?,
 
             // We must wait for GFW_BOOT completion before doing any significant setup on the GPU.
diff --git a/drivers/gpu/nova-core/regs.rs b/drivers/gpu/nova-core/regs.rs
index 206dab2e1335..207b865335af 100644
--- a/drivers/gpu/nova-core/regs.rs
+++ b/drivers/gpu/nova-core/regs.rs
@@ -41,6 +41,14 @@ pub(crate) fn chipset(self) -> Result<Chipset> {
             })
             .and_then(Chipset::try_from)
     }
+
+    /// Returns the revision information of the chip.
+    pub(crate) fn revision(self) -> crate::gpu::Revision {
+        crate::gpu::Revision {
+            major: self.major_revision(),
+            minor: self.minor_revision(),
+        }
+    }
 }
 
 // PBUS
-- 
2.51.2

