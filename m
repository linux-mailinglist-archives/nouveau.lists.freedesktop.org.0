Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CA0BC5FCE3
	for <lists+nouveau@lfdr.de>; Sat, 15 Nov 2025 02:09:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5057410EBA8;
	Sat, 15 Nov 2025 01:09:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="PLJVIQy1";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from CY3PR05CU001.outbound.protection.outlook.com
 (mail-westcentralusazon11013062.outbound.protection.outlook.com
 [40.93.201.62])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 99B8110EBA8
 for <nouveau@lists.freedesktop.org>; Sat, 15 Nov 2025 01:09:34 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sMi0fvuCfqVZHu5lRHiYIkKq0cIcR1J3S06Sk5AK9OIgvzm8IE7v1AYxY9IOOb8/ArBpoj/A8cpTmVcPoO/pQ3t8gwJ8hygigTV3PJsWiBKxBqBkDAt9p+9D7pSacRg7nx/0qd49sWM0aW5xoxe/D/NZ75KkVgza1DdIj0Bb9nWwzh0B1qFGfoS4XkNoUHoaOxEnXwgHOmmwtsWz3SWmuErbL7NKtFm29g/ojiYtEnwRurkiMlJb65PRnmwhYuFijg1vo7LLRunM3f6gb+0FJaLWKssLcuP7xsnjB30FC2XZnJnNlW0WXb2jPyfjdtK1y04LtNyvhArohfQJp8Sg8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/TCl+lbCGtlONGF5EKWGglO7xxFhuEQEbWNkDyDXE7g=;
 b=IATolukmLJfmFb6+YJfXxaf1Bz6Dxp2LLBhucFbnLg5CYnj0p/kjdji8i8HYLOF1njEnYvwETxRHz+U1gEwcSUtRWwzgIhU6V3aE1xFQMHX5lKgewk8HjpfooVpnfw6sWGiJhooj4DSN7r58o13+H0iNcj8W8LFd8yy6e6OaLJ9BTsGwu/r5s9+Q3CQu2Bo+xDcHeWL5qXeC9mb2DoKIuNMERqHjA5FObLfZE72ydHXgzuEarAN2RXYaarYOKkoONZSUtheU3LyhHEbNmcKWHSCKCRgH1a1Xk9Aq1vPlRFguFJXEcQQxRG3uK7lDusQ3TkZ/Lv8KBiz2/dgpDXnvlQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/TCl+lbCGtlONGF5EKWGglO7xxFhuEQEbWNkDyDXE7g=;
 b=PLJVIQy1VeLRm2M6BkR5F/VfxRpcIC3nr5Mglk8xm19iiuXqFeehiQ5BbMYxmgqZRwDUMbkecAsh7egli747PHUj6/EuVbwU8q5/8x4Z+Ah5WPyLDkBFyfrpuZoEgQ7J2zgL/c98hF+g0f3jDiO++9VHICWY9jLVHf3eGsLV9nVHRnwejkfmiu0M4NHHHNEjQ+3k3lUtNcYnoRYPz8OFMd9Q83TEnootZyLz6ulee7oaz4cs+j7IdTAvPHlhgHJv0u+w+tScqhe04Vip4WmC7cinv0Me2ODRtJnQ6q/J6YpJkL6SvrgZR8snjwSqe433dYKQa59wh+aKoCVAP2jvcg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 DM4PR12MB7645.namprd12.prod.outlook.com (2603:10b6:8:107::16) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9320.18; Sat, 15 Nov 2025 01:09:31 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::d622:b3e9:bfe1:26bb]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::d622:b3e9:bfe1:26bb%7]) with mapi id 15.20.9320.013; Sat, 15 Nov 2025
 01:09:31 +0000
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
Subject: [PATCH v9 4/4] gpu: nova-core: provide a clear error report for
 unsupported GPUs
Date: Fri, 14 Nov 2025 17:09:22 -0800
Message-ID: <20251115010923.1192144-5-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20251115010923.1192144-1-jhubbard@nvidia.com>
References: <20251115010923.1192144-1-jhubbard@nvidia.com>
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR13CA0113.namprd13.prod.outlook.com
 (2603:10b6:a03:2c5::28) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|DM4PR12MB7645:EE_
X-MS-Office365-Filtering-Correlation-Id: 24f109ae-c4da-4a8a-45fe-08de23e3a1dc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|7416014|376014|7053199007; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?H1QYvOERqX61KcT1gw2mrk2cJJd8EaBSAxPS5a8u/98ZalXVlSDZaR29nMJ/?=
 =?us-ascii?Q?KCizKvIU7yn+EnD13BKsF5MrNxwhEscMAbGWlVEnpQWAwwo066ztRtpIm+sX?=
 =?us-ascii?Q?1BlAaXOYXcrZ4NrVPd2c3LOUuTTljz8HfZ8RrxnejkE2joxvQ7l9PtX0glq+?=
 =?us-ascii?Q?A6ARm4qPJ7BGBD6hsVHMDHuWwlgAoKpuChzDVOa8IcjKogWoEWecRdu7sOpN?=
 =?us-ascii?Q?8QkgKbb8w/UZg3Vn1yjXkCQoWUkusp25bAlAvgK4iucRQRWf9O8A5LpXDh3n?=
 =?us-ascii?Q?VebCyB2F5pRUCSXnTa5n23zg2LSxO04NskJlKYtnJFSZaSRHBtdJArwAxFIh?=
 =?us-ascii?Q?FDATFn0NgzwDP7v9kmO6KHgNlpYQSVjxLcKz++hnCQZ+90+xw6MgvFGRx3V8?=
 =?us-ascii?Q?KFHU93p+6Jp1Q8T6ZK+k4SOXSnwEtkLlJ6QuLdpU7AcPusE7aFz5IKVeSP0R?=
 =?us-ascii?Q?0yo6bD4YAMRI1T6kl9npfpjussvk660w+W1auWnbqZtrqUzOafnUz3xDGyw6?=
 =?us-ascii?Q?nxTex46tKr3qM4npDgr+xpEKLRyZG+IGsekvnsrkvx4e3p7JvQQHgYHhqfR9?=
 =?us-ascii?Q?+xWxn0cR115qaMK4dYC8doAHqN13szaCuK/r4x2KDiOSr/QdIZmi4Aatmry5?=
 =?us-ascii?Q?f38AuHNOxS43R5/Ib7rQvLLoWzVNBMiQPoUlsgyofjYnVo1a1tzhMjX7hTN6?=
 =?us-ascii?Q?5nTUhG2GfHXd5qOilKlabSDJWbS2rEP9YsHeo8cCZSLU3y8ng20OQX/qWJfe?=
 =?us-ascii?Q?BuqsVbCvZ2Gn6CudbEjrpLxDtrAXf0jNa8quj7ZvuITcHrMX7UWtROt/U7G+?=
 =?us-ascii?Q?RP4zvcC1H8Br4sckpa+xUKXDxTfVecDFqiKp6psFjB0LkjpcpYHnKiVEqgq9?=
 =?us-ascii?Q?N6B+KC6ygF7NQ3tkGM3FtWdsuFK+OAai+DajTdbZa7QIRwRx4yUD+r/8jnqf?=
 =?us-ascii?Q?fpWiK/rB5I1yFj6mh+1PPqFFFglly06ByzbNE40kYr55S4PM9NcAnzSFwsEV?=
 =?us-ascii?Q?oWg4FQQN8vQ6WUGb88S0lZTbgdHRVqFPLUCc6MIyp9GqtwpA5hK6QjDQuFDe?=
 =?us-ascii?Q?Glayl2xdOLTgYhbxkAJ7eWKtjP3djd0IGiU3ZIwPj/y9uiai8JkGMJwomOHq?=
 =?us-ascii?Q?2ypfg925CWf58p67DXGToQrh+8BzqvqoT4EDoWw2OONncnjQmdU1SeOVmM50?=
 =?us-ascii?Q?H6HanMjyKnpvTexl2UEXlBul4tYnsHvUepuAtkOqNWeLAFDKePq0rfav/F2t?=
 =?us-ascii?Q?cUKTIXOgCRo04ZjDLo7tJcfmTwza9BM/xh2DJEoyKZ17zJUggYSxMH0Evsrh?=
 =?us-ascii?Q?j29JB1wJwl0X0hYeogZ5XbBWi4f6xOFBxbGp7XGlbVnv3uxX8AUd/SINnsK8?=
 =?us-ascii?Q?4d6lw8tTqsgRKEg05MMTtjGkQV4OuBgynpVPoeRFaAWGu1uzhpSOK5HpSkOk?=
 =?us-ascii?Q?3/gs4sQ4xqbQhUzsh+TiSKc70iVJwBso?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM3PR12MB9416.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(7416014)(376014)(7053199007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?utDzca5PM/+/ab9Lz2NLc7yqNKs5YbSduJgBdspqT7+iRCT2TJHQVNiI+wys?=
 =?us-ascii?Q?u0VNnFN0k+pM734ZZ/9qOCZl7WW2cbmZJKVleJnPypQg/tpOU0/L87GLLkBO?=
 =?us-ascii?Q?qbK6wl7keLWrlSZKiCel57ku+IBfpUMJOExKANKb/F2vF3Ww5aDp23HRFEMP?=
 =?us-ascii?Q?uu2AMAoteLfxuG62yCcZft0D+RTpje+YE7b54sCSWemEdCa4A3o+XAq59gxJ?=
 =?us-ascii?Q?ytNAbcRw6Xp+LI2JRmByTk8E4/ebKRcJhPIdoTonjFdKgj+9/XGISBzE99j7?=
 =?us-ascii?Q?Izx7NN7GmU35N13EV6RbLJQm9afZZdUsSX0SWrDV3QQ1p4d2nZkF9JfJDMNB?=
 =?us-ascii?Q?SdScqkfxUaYLgpdht76boon//LoB2/qXas0n5Cfcw9aBmZE+0jHcc2DKDFVM?=
 =?us-ascii?Q?ADckUI0iDh7OH5r1Kjiuf5+d8f4EPyOmbdjzffJJ4PGGqiYxeAYwNp1C6fM1?=
 =?us-ascii?Q?JWwBfwkFGpsjZoXuMQTrii5+5oa0rEe5rLQsX3FudIeSdfv6DD1eJpO6bv6C?=
 =?us-ascii?Q?DGDTgjSdBDyprGnHWt28sgNE96ek3AW7Ecou3YmBOJlmwYJyvcc32+HOchq8?=
 =?us-ascii?Q?gC9tRGVuXXL8A5wdnrsh8RC1/iMoCauk5Hnx+rjwCIgW6FMk/kae2LF4ZDRs?=
 =?us-ascii?Q?brPHiAml3/GkTGqvXsIM+QwBIAPtEA5X0Odo6UA7Gwq0Uu3781VFEM9YJO9W?=
 =?us-ascii?Q?eTh3ZvGQgb7DCo2quMUhc69TUT9fscWoCGL5uSexhTO+KE+fSdkDYFgJvtkx?=
 =?us-ascii?Q?Q9kfbVyxTC+5Jnf5brQFqTOBkTdd+/tqEZOYCPVBTdsTZ5188d2kE0/NWtqr?=
 =?us-ascii?Q?fNSU2kcMHBYQ3z0xorw1bKrD1ZH1uC7Q1qhNYgb+diLq5UO7tv39+/4N3f+i?=
 =?us-ascii?Q?NMsYUbWGmG4Ge3aCUK7xP5uRYgpos/zus8HSyyEX22xFs0U7Fv+99r0ZO06j?=
 =?us-ascii?Q?tjSmmEX4p36M0IUquJxNpX+o6r78Y4SDBAdGLtXb1OFFf7LchNdzzYUnhr7A?=
 =?us-ascii?Q?p+MH4qbpK5kT6G76AJdNnkR8/mE8dkjaKWl+lN02mUw5iEM75+xASq5LNTd2?=
 =?us-ascii?Q?EOCnRueG1ym5wc6rOCW9tMEA/M9gJOVsFFnFZ4uYLoXFMuJZ76tI87tdAcm2?=
 =?us-ascii?Q?i4kIq6lZSRNLvQYCh+WMhpvBb2/jI/Fbi5Z7orA+YmSjTUZJqQonB0PqUyfd?=
 =?us-ascii?Q?NTcOYtg8/nyyKhIqu3lb6giC+iUyDNqGsN6omGw4aFA4GUxHO8Yrk+RlC5OS?=
 =?us-ascii?Q?gXRijN8cBryaxyby3sXuC2IGGTOICaOEFntQ7A+k9mv6EYhPeyKfeKqL/opL?=
 =?us-ascii?Q?eXv2B1ikl26WwiCke/XW1ZTMPuvAx9JCZ4LOyyoYOrq4+SS3fXnTBBzC0eIV?=
 =?us-ascii?Q?3FhfppVcJW3hren3rqBObDDhyqGZpq8OvCT16gOKN5d2vWEzm1d3Mky+SOd0?=
 =?us-ascii?Q?ydU4z/D9QK4pjlQ5iEitLOp7FS7G0kIXLR1mPEL9DxkiAWJzn/Acgp86J/gG?=
 =?us-ascii?Q?hNs+CpTLOqNnIFZO9X9MsRB9Rs0qv5KZT6v9fu95I2bXAYMCVkGaSkPYUUL7?=
 =?us-ascii?Q?lvKdgkuKcXP5S0DHeOtJBB5qyyB6ssxkdqHe6tQ+?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 24f109ae-c4da-4a8a-45fe-08de23e3a1dc
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Nov 2025 01:09:31.5340 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LXv2e2uQ2G1PCJz8FVb1l5tEFWdI4nM1e248dJmZxUWG43RW+stqM51+R5Q+wCyrmw4SkjyF6S1uw5nfbnhBEg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB7645
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

Pass in a PCI device to Spec::new(), and provide a Display
implementation for boot42, in order to provide a clear, concise report
of what happened: the driver read NV_PMC_BOOT42, and found that the GPU
is not supported.

For very old GPUs (older than Fermi), the driver still returns ENOTSUPP,
but it does so without a driver-specific dmesg report. That is exactly
appropriate, because if such a GPU is installed, it can only be
supported by Nouveau. And if so, the user is not helped by additional
error messages from Nova.

Here's the full dmesg output for a Blackwell (not yet supported) GPU:

NovaCore 0000:01:00.0: Probe Nova Core GPU driver.
NovaCore 0000:01:00.0: Unsupported chipset: boot42 = 0x1b2a1000 (architecture 0x1b, implementation 0x2)
NovaCore 0000:01:00.0: probe with driver NovaCore failed with error -524

Cc: Alexandre Courbot <acourbot@nvidia.com>
Cc: Danilo Krummrich <dakr@kernel.org>
Cc: Timur Tabi <ttabi@nvidia.com>
Cc: Joel Fernandes <joelagnelf@nvidia.com>
Signed-off-by: John Hubbard <jhubbard@nvidia.com>
---
 drivers/gpu/nova-core/gpu.rs  |  9 ++++++---
 drivers/gpu/nova-core/regs.rs | 18 ++++++++++++++++++
 2 files changed, 24 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/nova-core/gpu.rs b/drivers/gpu/nova-core/gpu.rs
index 8e04628ca3d9..2bbc084e2095 100644
--- a/drivers/gpu/nova-core/gpu.rs
+++ b/drivers/gpu/nova-core/gpu.rs
@@ -191,7 +191,7 @@ pub(crate) struct Spec {
 }
 
 impl Spec {
-    fn new(bar: &Bar0) -> Result<Spec> {
+    fn new(dev: &device::Device, bar: &Bar0) -> Result<Spec> {
         // Some brief notes about boot0 and boot42, in chronological order:
         //
         // NV04 through NV50:
@@ -216,7 +216,10 @@ fn new(bar: &Bar0) -> Result<Spec> {
             return Err(ENODEV);
         }
 
-        Spec::try_from(regs::NV_PMC_BOOT_42::read(bar))
+        let boot42 = regs::NV_PMC_BOOT_42::read(bar);
+        Spec::try_from(boot42).inspect_err(|_| {
+            dev_err!(dev, "Unsupported chipset: {}\n", boot42);
+        })
     }
 }
 
@@ -268,7 +271,7 @@ pub(crate) fn new<'a>(
         bar: &'a Bar0,
     ) -> impl PinInit<Self, Error> + 'a {
         try_pin_init!(Self {
-            spec: Spec::new(bar).inspect(|spec| {
+            spec: Spec::new(pdev.as_ref(), bar).inspect(|spec| {
                 dev_info!(pdev.as_ref(),"NVIDIA ({})\n", spec);
             })?,
 
diff --git a/drivers/gpu/nova-core/regs.rs b/drivers/gpu/nova-core/regs.rs
index c6e2e08c754b..a53b013f2eca 100644
--- a/drivers/gpu/nova-core/regs.rs
+++ b/drivers/gpu/nova-core/regs.rs
@@ -67,6 +67,24 @@ pub(crate) fn chipset(self) -> Result<Chipset> {
             })
             .and_then(Chipset::try_from)
     }
+
+    /// Returns the raw architecture value from the register.
+    fn architecture_raw(self) -> u8 {
+        ((self.0 >> Self::ARCHITECTURE_RANGE.start()) & ((1 << Self::ARCHITECTURE_RANGE.len()) - 1))
+            as u8
+    }
+}
+
+impl kernel::fmt::Display for NV_PMC_BOOT_42 {
+    fn fmt(&self, f: &mut kernel::fmt::Formatter<'_>) -> kernel::fmt::Result {
+        write!(
+            f,
+            "boot42 = 0x{:08x} (architecture 0x{:x}, implementation 0x{:x})",
+            self.0,
+            self.architecture_raw(),
+            self.implementation()
+        )
+    }
 }
 
 // PBUS
-- 
2.51.2

