Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C404C39078
	for <lists+nouveau@lfdr.de>; Thu, 06 Nov 2025 04:54:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 86AE410E7FD;
	Thu,  6 Nov 2025 03:54:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="XB+ZY3uu";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from CO1PR03CU002.outbound.protection.outlook.com
 (mail-westus2azon11010028.outbound.protection.outlook.com [52.101.46.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8007D10E7F8
 for <nouveau@lists.freedesktop.org>; Thu,  6 Nov 2025 03:54:44 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=q11u332gj0/CouJHynhSqLeKSt6p50Kgv9PPE6eJEmfzFdudZQM/JkZgfIQkotXcKEflhd5+sN7vVqCbp/iCsK8Qg53+KDvyHxGNXJcpJO/NwkBsDyP8zoERKpbqVmBzcqp5+rpOhGV+YzwYL03dkPRErOsVHX65lzWqQ3xuxeQ/xunWX2R5RuCQGdNUSxZ66cEGe2ylKsNAKwpjZISrOELa9KQrRbAvTcKhd87EU8JwDMoDfs+d9ZSQM3iUENGlbN03LNVpKWft3bin3/MjFcEQjyE21Uyw7mkPk2spHcUAsYlqFzW8d5lEO0qwCOpAyWXXz4aTTxzge5uWSPRzBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vJrroQgpEWv4+0Nq0RLYZ7dPxcX/hAutwVZJaqx3E7U=;
 b=RwBNQlsCzH7yMVbo53miUFN5pnq3c9tTHYirHa6J+HGHbhbS84mMc61jUnZwoF4H1mhgelt/vvtc/ZO3JaAV8QYUzbRN99KKZrO0pOIM1P9Jlsj/ytfzFNtkMKycWMY+vezRC7VutsOiDssimIWAe9EC43ad09CZ27CvY7A7FHkmJQRkmFme2ItMsIp3Fu3gvgx0OUspFArB70qwZP+HUfuAr2XlS5IpGOkTY4BdkogDkzr5GD1ox0p6I45oc2Ek7rEkiDUIVLxSNq9hOJE0m4qlpMGC1NOPb0W2MXYLR00+yko/3bXGEqYcOYg4al8z3YG/JzQCIlnPrBjEcEb93g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vJrroQgpEWv4+0Nq0RLYZ7dPxcX/hAutwVZJaqx3E7U=;
 b=XB+ZY3uueM2OtqRDveBe8a+r6xBdl4DCJDQdRZSYI2DOlsFwMxnx8l9Bxz7vwAaEd6xiSV67a62gUzYBYmLifdd42D4bNNG5XjGoCR9o7wUVdS2+v7Nx2NVQpIL5LZoatDKiTLICYLxJY40xHrX43vc3Etyec5SKA4gWI7Kf0RMZzy0BkXSn16j96/gVFMsjO+vo5BfpTZM5u8r9941tF34wL6lDgfoNm7p7e8lw8vy/eMXkRFeglbRPS73EKLMWIkhbVn9CASLs8Q4EKuWtyxD3qmA6aFuame8YwWZdUIzMGe3W+KorBlz75k7oSLovCVfmml5qNxPvCscKEY5vPQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from BY5PR12MB4116.namprd12.prod.outlook.com (2603:10b6:a03:210::13)
 by CY5PR12MB6622.namprd12.prod.outlook.com (2603:10b6:930:42::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.7; Thu, 6 Nov
 2025 03:54:41 +0000
Received: from BY5PR12MB4116.namprd12.prod.outlook.com
 ([fe80::81b6:1af8:921b:3fb4]) by BY5PR12MB4116.namprd12.prod.outlook.com
 ([fe80::81b6:1af8:921b:3fb4%4]) with mapi id 15.20.9298.006; Thu, 6 Nov 2025
 03:54:41 +0000
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
Subject: [PATCH 4/6] gpu: nova-core: factor .fwsignature* selection into a new
 get_gsp_sigs_section()
Date: Wed,  5 Nov 2025 19:54:33 -0800
Message-ID: <20251106035435.619949-5-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20251106035435.619949-1-jhubbard@nvidia.com>
References: <20251106035435.619949-1-jhubbard@nvidia.com>
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR03CA0022.namprd03.prod.outlook.com
 (2603:10b6:a02:a8::35) To BY5PR12MB4116.namprd12.prod.outlook.com
 (2603:10b6:a03:210::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY5PR12MB4116:EE_|CY5PR12MB6622:EE_
X-MS-Office365-Filtering-Correlation-Id: 4963eb13-1ad1-4f7e-e3f0-08de1ce836b0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7416014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?OZVCuxl8e5rjfUF68LBU56MAFHp8fEtgowPFM1rkxo02LzhNn7UyRcnLfZfn?=
 =?us-ascii?Q?wWP5mDa/8uYB/a0rpAVnzZfmTXiicW0isAC8G3W8PJkUVyhqS3g3RLfDQCkH?=
 =?us-ascii?Q?3mdFaDY4OnM5R/WOMvGP2OSwJ4N0N708Cr6ALaGD7yBqH75YG5Qsdo9feAqR?=
 =?us-ascii?Q?dL81m5F+fKCZ5HnqsfRn4TmKQUfbbGftmf/LgRYnYzRd5ZltPWRslgfsDJYq?=
 =?us-ascii?Q?ZfS6H7Sq5v6A/eLWli/me45gSl968c8TBdl39WHSU03kskvk6pjETzcAPc5a?=
 =?us-ascii?Q?oJkWgQ7AD/zrrfjvyXFvWvoHVMZ/mbhXkk70trs0/VByLr6zq4qRRVHV8DK+?=
 =?us-ascii?Q?rCnwzcKlMbTCnFT7Ncy2Mdzo314yzi+6+0LscQBp/KUSRn3mCM1ude899cGM?=
 =?us-ascii?Q?xN7TKUEEOrV6LG5bNhy3OjXN8j88NToPvhombvdAfBQ1sfuFyR1+QGhJoa0c?=
 =?us-ascii?Q?3LdZAGwoG4TkzaK5RmipyEJHEHx/uOvAaKsOnu9BtbBPZtOUXzYA8indnXQQ?=
 =?us-ascii?Q?T5cstXdEp14zclu/zNZhVZ4jVGVmf8bkvFLYr013drsJZca7L1sH/S2yAm1d?=
 =?us-ascii?Q?sSWQVlEHgXsRYIEhnC5puXORfte8IH0u61fQvfjf5WfT3S/5IE0A3sy9bTPX?=
 =?us-ascii?Q?vsGvSmR2zluoVEQ+VyOTf7t1KdkV9HneDP6FgIm93jA7PgW37NqJnqA1eS/t?=
 =?us-ascii?Q?z4PouPteHhwFjELrGH8ptbqccZy4i/L2sb2bsC5S8FIfU3yPeYN1hVs3rdAs?=
 =?us-ascii?Q?h2E4arIq+uhJKzZi6LiszW8b1Pk7+8RqxhEjUfipBwUGm1MALcog+IzBx73C?=
 =?us-ascii?Q?AP3WXcrgBAkHIWJzn5sISvcGvDlqwNZciKGqrlRd3HhcfkyH+ToDlbJRmCx+?=
 =?us-ascii?Q?EBu69DLATqJL30vVUC/II7jKGHZadZJsIdE4fNPNRr5epIrgp/US0ZrjPnPk?=
 =?us-ascii?Q?7DA8dFN4COWfRs/YH19PyUhx2/DgEaByiS5yeaayncZ5uMYa6dfxTMxIoP8X?=
 =?us-ascii?Q?puPcBxKsqpT7CA9biLjEOiDgwIBBK/q0Kgb139qbsXmsWRkCgKQEvY+muoPB?=
 =?us-ascii?Q?7KczxFPCZjnfzcY7wNszD4ZPGA5EAgjjn+3jnOancC2gU7RCieA0WTwgJSV2?=
 =?us-ascii?Q?P7M5HrFwXOjRQXcQTSvnXAytCHQhj/1iWDtnYqLlMy3obcRK+f2jh54n1ql1?=
 =?us-ascii?Q?ZbrcZEPtlFWPvJW1R0yOJN0XL09MVouX6/mqwyskpKK9vbjsIB4IaM7NYRwd?=
 =?us-ascii?Q?MlxldX0fG0/QS9XLAuZDWLXR9mdZr5srARdKKJFUFjw/d55YI/lvTJkHrFan?=
 =?us-ascii?Q?tTnNMqAIGmQ66eET9NZsPONNWZJrLYML32UbHxap5LQiKoMiNm+md8+Uo/vX?=
 =?us-ascii?Q?gWvnCPUnkzOiycQDuEr2Ji4vrn6AY88/kzbv8HEBLcEJDU1PmAFCggaM3rs6?=
 =?us-ascii?Q?ms3iE6QN6BXpxuft6gmoA7gW+bzZTH5/?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR12MB4116.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(7416014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?NktQiN9Zipoytm/MM1yAOAqvYF+t3mO+Q9lVQslT8J06HFLRstHXA6vqdqwN?=
 =?us-ascii?Q?1HgrE/tuEOAEMNQ6wuG8dV0o0O6COZLsmU7shrlkaVUUkpD424jtd4AbwEe+?=
 =?us-ascii?Q?Od2V1OtAcnQGr9zxxIDnnXRN8lVIHvfA6tc7zAfQDuBUvNMknLLLIWRWw1sV?=
 =?us-ascii?Q?Cpdl74FshGXjmsPuvm9T4gB/J3s72h0kCfDik4tbnugGyHlCki6Yb7BB5fvr?=
 =?us-ascii?Q?7+RpnW5p4pLGkWRey1Q4UKqpFJD/f1WBM5M0++d+QvUGpwIxsNNJIwz91KLY?=
 =?us-ascii?Q?LsrqUe+hzWKnVtyY//gM7OMpoXBkyaz6ZVF24Cnf1F9PJeBzJexiQPD++qeP?=
 =?us-ascii?Q?E7uwjrbQy7xdVDKeTv5vlF/qphQUL0Ad5IZ4u8i9tsP849IbHGHBhMCx8CcH?=
 =?us-ascii?Q?1FY+JKhCNaEu3DIB+IZz8RkJI1+iWXq9rehKdCIY5+jwDD843chJZqV6LnN/?=
 =?us-ascii?Q?Nn6SOXeK42hHVawRAaoVssJTnqVN+Br6f4Kn8POnVEC0nSjaHCOhVwCY8T82?=
 =?us-ascii?Q?XUtq4uxn8EzvOWgm1tSBH55fLeLONgxkfLsSf1BgBNhxn+znojSyeX52ras2?=
 =?us-ascii?Q?FIZVivmGI/+jHP2Mi55267VpgUxsEpPe4aufIWLL5H+VQxdhOGKuq+2Lp4lg?=
 =?us-ascii?Q?J5Px3nrpRmjbpP1fG5AUT8mTrVFK6NlwCv5pRthY0MfGM1dprWGAAm5tYnVU?=
 =?us-ascii?Q?cgIIB0/s8wgKjZpejNgiq2sBnn/v5QKrn5Ch4hl7TiaHwkcxBlozhb8OEMEF?=
 =?us-ascii?Q?85DlX+xO1i2L3Qrl8Vd8pqefdyWeq48eYBbHBowVB4QRo+svUZjmahS2UaKZ?=
 =?us-ascii?Q?u6vfZgPCkn+4VxsFeaeRLvIzYxRrpHDSmOUrTdmf/T9Plu84XHrfhWzLTCxR?=
 =?us-ascii?Q?afc+UttCnZkd3/pqW9UuYsH4bumDJ6mukna7VPJAa8gIj919YLWudjGfGiOz?=
 =?us-ascii?Q?TZWBv1RdgzPehQT7oJ16gVR5FFMUD9iCWD/BrGZNgvO8iXX1oHCbar2dLBY3?=
 =?us-ascii?Q?1W8XNynnSJaULkLRyMiMPvwseFrZf5biHNbanWlpFTCIsJW2D1CAde5XHyZg?=
 =?us-ascii?Q?UmKqIP4tZOH65gq/Ac8FUZsUh43uaGNifWiMnt7OigRn5JKt75kfQYUa7bKv?=
 =?us-ascii?Q?py02vaka4TOyzsMh2NzhRr/2vbfi7JQKbrsb+0JnVZGyB/MpckqfzJ3shUaV?=
 =?us-ascii?Q?6QNL5AcG6l1eYE9PWB2CSePpZYJytnmu+gJcLW3t3Q3RxyoAqeFLc7yphiCr?=
 =?us-ascii?Q?sh0lN1hW6KNe04ovFMUqJ+EDJPCLZbRJEZU9lt++r5xUUVFxrg1+h56EuaE4?=
 =?us-ascii?Q?ojbODa9+gSUcMgRHLbEe2rJvsdz5Cn4gxgQGr2AY2gMXKZqn4q4DMt2RHfBR?=
 =?us-ascii?Q?QDDQaFzz5NLxdvNsYmVEkNNnUIHfIhfWcV7ZUDTWKwTDzMvykcyfn0MYS2nb?=
 =?us-ascii?Q?+e3asabJYIzDexp3zGsYYcel9iaHqGRmESVv6T0y4LBul2iJEZkq0SiCvYED?=
 =?us-ascii?Q?jGU+HD+AGYbZ+SvMMbvwSYdad9NgORiJ+Sgn7daJSAzQHtteAbFwvOoP8JmB?=
 =?us-ascii?Q?5y+bdSTXY89INWRjb9icxpNsU0Hb7SOHBBvu8NgY?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4963eb13-1ad1-4f7e-e3f0-08de1ce836b0
X-MS-Exchange-CrossTenant-AuthSource: BY5PR12MB4116.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Nov 2025 03:54:41.0135 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GjDJRytNtHtlddWeWmHm40drjsNOT2Mi5PfKTlY9NuyRHmY3rSMd5wHdM4E5YFcg1k/WHqG6KeR1A4VI6PlVVA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6622
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

This cleans up GspFirmware::new(), which is helpful on its own. In
addition, future work in this area will build upon this.

Signed-off-by: John Hubbard <jhubbard@nvidia.com>
---
 drivers/gpu/nova-core/firmware/gsp.rs | 41 ++++++++++++++-------------
 1 file changed, 22 insertions(+), 19 deletions(-)

diff --git a/drivers/gpu/nova-core/firmware/gsp.rs b/drivers/gpu/nova-core/firmware/gsp.rs
index ed2dea2cd144..3a85f34bdbea 100644
--- a/drivers/gpu/nova-core/firmware/gsp.rs
+++ b/drivers/gpu/nova-core/firmware/gsp.rs
@@ -138,39 +138,42 @@ pub(crate) struct GspFirmware {
 }
 
 impl GspFirmware {
-    /// Loads the GSP firmware binaries, map them into `dev`'s address-space, and creates the page
-    /// tables expected by the GSP bootloader to load it.
-    pub(crate) fn new<'a, 'b>(
-        dev: &'a device::Device<device::Bound>,
-        chipset: Chipset,
-        ver: &'b str,
-    ) -> Result<impl PinInit<Self, Error> + 'a> {
-        let fw = super::request_firmware(dev, chipset, "gsp", ver)?;
-
-        let fw_section = elf::elf64_section(fw.data(), ".fwimage").ok_or(EINVAL)?;
-
-        let sigs_section = match chipset.arch() {
-            Architecture::Ampere => ".fwsignature_ga10x",
-            Architecture::Hopper => ".fwsignature_gh10x",
-            Architecture::Ada => ".fwsignature_ad10x",
+    fn get_gsp_sigs_section(chipset: Chipset) -> Result<&'static str> {
+        match chipset.arch() {
+            Architecture::Ampere => Ok(".fwsignature_ga10x"),
+            Architecture::Hopper => Ok(".fwsignature_gh10x"),
+            Architecture::Ada => Ok(".fwsignature_ad10x"),
             Architecture::Blackwell => {
                 // Distinguish between GB10x and GB20x series
                 match chipset {
                     // GB10x series: GB100, GB102
-                    Chipset::GB100 | Chipset::GB102 => ".fwsignature_gb10x",
+                    Chipset::GB100 | Chipset::GB102 => Ok(".fwsignature_gb10x"),
                     // GB20x series: GB202, GB203, GB205, GB206, GB207
                     Chipset::GB202
                     | Chipset::GB203
                     | Chipset::GB205
                     | Chipset::GB206
-                    | Chipset::GB207 => ".fwsignature_gb20x",
+                    | Chipset::GB207 => Ok(".fwsignature_gb20x"),
                     // Unsupported Blackwell chips
                     _ => return Err(ENOTSUPP),
                 }
             }
-
             _ => return Err(ENOTSUPP),
-        };
+        }
+    }
+
+    /// Loads the GSP firmware binaries, map them into `dev`'s address-space, and creates the page
+    /// tables expected by the GSP bootloader to load it.
+    pub(crate) fn new<'a, 'b>(
+        dev: &'a device::Device<device::Bound>,
+        chipset: Chipset,
+        ver: &'b str,
+    ) -> Result<impl PinInit<Self, Error> + 'a> {
+        let fw = super::request_firmware(dev, chipset, "gsp", ver)?;
+
+        let fw_section = elf::elf64_section(fw.data(), ".fwimage").ok_or(EINVAL)?;
+
+        let sigs_section = Self::get_gsp_sigs_section(chipset)?;
         let signatures = elf::elf64_section(fw.data(), sigs_section)
             .ok_or(EINVAL)
             .and_then(|data| DmaObject::from_data(dev, data))?;
-- 
2.51.2

