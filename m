Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C5A2CB9CF6
	for <lists+nouveau@lfdr.de>; Fri, 12 Dec 2025 21:50:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B3D410E966;
	Fri, 12 Dec 2025 20:50:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="UgwbNb3J";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from CH5PR02CU005.outbound.protection.outlook.com
 (mail-northcentralusazon11012008.outbound.protection.outlook.com
 [40.107.200.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 662BA10E968
 for <nouveau@lists.freedesktop.org>; Fri, 12 Dec 2025 20:50:19 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LBaIHvf+blUmoz43FVYPd79GhhJmD2g3LLX/kybsbDGuC8/3JwVaF++IrHIwNBBT1uxcnekVa9KDHSxQ/IrGAbV8JQO6XqudXQdYAoO6wleYNHED7bkX8qFHIqS4RAxwnsIX2n69mS91JdW8NuyoDoyG460NzqFo/QjwYu98PVNrFsjg2DMrJukjGYArVtX06zELoGOBQopBZLkw+jF1Zz6gXx2CTW1dvKEj8I1dpyUwrBo0b9PYBRFDX10vD4ZEFU7XJiyaDgX56UaJVoLMhErPjFHJRmsIbKWCChbGvzDr3Ohw32TcVhrUufK6ojnIndSr7UxuOfPJOHRE8tIAxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HgCN0EtvZ5igkide6TahH9d2h2ZnoU+oSU5xQkmun/Y=;
 b=t8UeGxVF2oa+OfholyoC2sEWYXrogxf95b3+fxjXku3Z8mpUHy84/JsluXIHgHZOy83JHdiY9lBQAZbntvG2KSOg1wfBQtcyjy/YGCUCe5FsbaTLh//oNuIG/SzRCqiBWimcDRrVks6X2Hl5w3b416cOiVTIHy977QuJ86XGl+FjhD/kaPXbNoZlMM7PWfcltj4Hu4+q7dQB4RY0wJPhl3KDyxFAqBquhlFhF291Zb7/p7D1L9KYhvntw2YeYfVWQjiWfb5a0dLUyu+WMmFIE/lL83TBBwRjH//mh/+KlQL1hYNmyuvvhtvJDFoCL6e/jgXJBMdpQURUEGKIiJHGQg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HgCN0EtvZ5igkide6TahH9d2h2ZnoU+oSU5xQkmun/Y=;
 b=UgwbNb3JQpO+r8VGlFvzCrsrOle/UhDIaoVUjUBZs/2gniMOlKwmWLmgduMnKCQB9oI8ZYoLP1AMsR6iHRG5rlm3ZCBrjJaFjpVrSFtEsibleK39jsv+yeqJHwsL9KOuEjZoL+g1YTqNV7DRP9iSjMydnYTFaZ89x+3na6jV5U0vMuQD8jWy33TTpn7ZqXtR4wKMvffUEU+C4uiSjm5EviBszgwvEiQT+0KDSlGqtG6xlSGp5gbSZwIMLqlPjnxZ4J0PUeTIR9WiM0q45CyhMTr4xC2jPqw/yDuXaAzUAS0sYX3tvcWDx9BgASL/oLRbQB2Vm2vNgbaaJiZKsLrW6A==
Received: from SA1P222CA0004.NAMP222.PROD.OUTLOOK.COM (2603:10b6:806:22c::14)
 by IA1PR12MB7565.namprd12.prod.outlook.com (2603:10b6:208:42f::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.9; Fri, 12 Dec
 2025 20:50:14 +0000
Received: from SA2PEPF00003AE6.namprd02.prod.outlook.com
 (2603:10b6:806:22c:cafe::a4) by SA1P222CA0004.outlook.office365.com
 (2603:10b6:806:22c::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9412.9 via Frontend Transport; Fri,
 12 Dec 2025 20:50:13 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 SA2PEPF00003AE6.mail.protection.outlook.com (10.167.248.6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9412.4 via Frontend Transport; Fri, 12 Dec 2025 20:50:13 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 12 Dec
 2025 12:50:03 -0800
Received: from ttabi.nvidia.com (10.126.231.35) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 12 Dec
 2025 12:50:02 -0800
From: Timur Tabi <ttabi@nvidia.com>
To: Danilo Krummrich <dakr@kernel.org>, Alexandre Courbot
 <acourbot@nvidia.com>, John Hubbard <jhubbard@nvidia.com>,
 <joelagnelf@nvidia.com>, <lyude@redhat.com>, <nouveau@lists.freedesktop.org>, 
 <rust-for-linux@vger.kernel.org>
Subject: [PATCH 1/7] rust: pci: add PCI device name method
Date: Fri, 12 Dec 2025 14:49:46 -0600
Message-ID: <20251212204952.3690244-2-ttabi@nvidia.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251212204952.3690244-1-ttabi@nvidia.com>
References: <20251212204952.3690244-1-ttabi@nvidia.com>
MIME-Version: 1.0
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.126.231.35]
X-ClientProxiedBy: rnnvmail201.nvidia.com (10.129.68.8) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF00003AE6:EE_|IA1PR12MB7565:EE_
X-MS-Office365-Filtering-Correlation-Id: 89570102-d8da-4835-518d-08de39c00c50
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|82310400026|36860700013|376014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?TKqgoO0C82MSk3Q5UgU4B6t/0TNHqL5w5WLNjsHxWtZbaZfTvaWyn7Ob867O?=
 =?us-ascii?Q?k+/oaGfss6u6dDgugtnB4N4IRfjkWPjbk+0YxUGHzgg28XLLuwPhJCf6qIN9?=
 =?us-ascii?Q?IU+VJdEt+3Ss2TJc5M4SRDNCjT/IJjg3UA/EGCnE/2nWS5hnNYL5HJDv9EDm?=
 =?us-ascii?Q?HmtXqh+9Pqh8r0j93OBtH1TLHtWXLnIkXLBCqrXv4x2BN9ZIo4CjwxZO8zFK?=
 =?us-ascii?Q?kGNG3q0lmRFKLrpr9nuW+3lmXzWc2SwMcEZrIwZTihPwuCWh3p/t6U+KAn6+?=
 =?us-ascii?Q?qk2ZG3j+4z+mWFgBJrK3lnPe2cHjr8Upew0kjVut3j63PsK6KD2jub2QDrUs?=
 =?us-ascii?Q?fJoDLVdKlFav6rBMKUc+17YHwGpI/E6MLbkLPnFnPE1SMAEJ0haOr80hAc6e?=
 =?us-ascii?Q?fM5aM9lT1RQygwrdqe9x5VczmPMHjEaNex2zqVX1rU3QVLmrcgN0oSu7Ekh5?=
 =?us-ascii?Q?ZyTC7cwPf92N2w5V5O3mP5VWGYF9bm3jI3+hsFXrnwRQW24x0CjbanGvKy/I?=
 =?us-ascii?Q?9ghSoMKq5vMJGADlVKsdsxMxSw68hxbcX/3P7OtG0xXMQ4qUOh9POnFcYgcd?=
 =?us-ascii?Q?U63mxyERrY2ZTTRlM7SqHsIo7hDcWn93kYw2oK82tyWXhfCpiy8PwqpOpb2q?=
 =?us-ascii?Q?f/QF8asNloCYTeL829NMIMDWpnodkfPTno9IuKiEAb2ZRdrxDZrsYv3HoqEB?=
 =?us-ascii?Q?F5cCFcbrHyMEScdOXaxfsxSnr4i4txoeEhfOiyV4EKCrEDNSbobqyYMLhyn0?=
 =?us-ascii?Q?ePvJjqYATMAemeUy1C0XWFE1wyEBYe9nAFlTAYM/HKUSUt+MDgX95hGKFHlx?=
 =?us-ascii?Q?ovh9maskMrYrw5dNT2ZqfYmNBayOniVCB7m1jdmmPz4cVVkHK/DXRmWdOW1E?=
 =?us-ascii?Q?KgX6Hftq6Bk1u0tjNzWIafYrMxWY3JV4IiRFL3GlwqxGuT+CMHgyLXXuXT/y?=
 =?us-ascii?Q?YHwLRkJ8ABdTnDU23ZhoJkfcMege8CJILRvahFkqF274GJRgvhgyokMbmcDG?=
 =?us-ascii?Q?E7Nhdn9vEY0AnsZXKl4XpKGDenv+3Q46BIuFLt13qfitf3N9VEfbzMoJk8n1?=
 =?us-ascii?Q?FlBsDbuRvyZFx95vy/Veg4Lpqq4AvrCbOX8oBnNcnLAaF+xpBQddu+Uacgvy?=
 =?us-ascii?Q?tu4wciHDM6D2h+otaxhMmLHJ0SHcgCmR0fDtCdFbLCpeJ0L/xoDJGiYL+X17?=
 =?us-ascii?Q?KK7Cw1BiualTBLRcNJEZJ+XzKK1kFpUEZiz4VvACj5jU6aFFLYoZiABkxiV+?=
 =?us-ascii?Q?sNwk7l2/uLSgeAobtrp+cO6EDrS0G/FH/ZLGYZOetv3n4TaLeHkZKtTCnPag?=
 =?us-ascii?Q?nG+1jWidJxXEIlfow84QJJ/z9In4NVMjsy29fJ4kiWKJ2KirJdiJ+uGo3psC?=
 =?us-ascii?Q?EaXjJzo4UqZajCLCtUw8h38TRYBEADEW5QTzuwxe9H0AEntBvDuH8BozQ/X/?=
 =?us-ascii?Q?9a342QSCPGStP96Rp8GeQp9AlrhOV44giyhNpKjn0nXE2nUywfJxz2VHVQ+L?=
 =?us-ascii?Q?UYUD9HpyBB70IHHrc9N5+7ot3+xxSKRDdLCvKg/n3B3+UZi3AdudwwIvdDnE?=
 =?us-ascii?Q?0VtqhB3C//wprdkZMFE=3D?=
X-Forefront-Antispam-Report: CIP:216.228.117.161; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge2.nvidia.com; CAT:NONE;
 SFS:(13230040)(1800799024)(82310400026)(36860700013)(376014); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Dec 2025 20:50:13.4850 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 89570102-d8da-4835-518d-08de39c00c50
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.161];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: SA2PEPF00003AE6.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB7565
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

Add a name() method to the PCI `Device` type, which returns a CStr
that contains the device name, typically the BDF address.

Signed-off-by: Timur Tabi <ttabi@nvidia.com>
---
 rust/helpers/pci.c |  5 +++++
 rust/kernel/pci.rs | 37 +++++++++++++++++++++++++++++++++++++
 2 files changed, 42 insertions(+)

diff --git a/rust/helpers/pci.c b/rust/helpers/pci.c
index bf8173979c5e..411bc743fcc2 100644
--- a/rust/helpers/pci.c
+++ b/rust/helpers/pci.c
@@ -2,6 +2,11 @@
 
 #include <linux/pci.h>
 
+const char *rust_helper_pci_name(const struct pci_dev *pdev)
+{
+	return pci_name(pdev);
+}
+
 u16 rust_helper_pci_dev_id(struct pci_dev *dev)
 {
 	return PCI_DEVID(dev->bus->number, dev->devfn);
diff --git a/rust/kernel/pci.rs b/rust/kernel/pci.rs
index 82e128431f08..d0c0c2f6aa32 100644
--- a/rust/kernel/pci.rs
+++ b/rust/kernel/pci.rs
@@ -427,6 +427,43 @@ pub fn pci_class(&self) -> Class {
         // SAFETY: `self.as_raw` is a valid pointer to a `struct pci_dev`.
         Class::from_raw(unsafe { (*self.as_raw()).class })
     }
+
+    /// Returns the PCI device name.
+    ///
+    /// This returns the device name in the format "DDDD:BB:DD.F" where:
+    /// - DDDD is the PCI domain (4 hex digits)
+    /// - BB is the bus number (2 hex digits)
+    /// - DD is the device number (2 hex digits)
+    /// - F is the function number (1 hex digit)
+    ///
+    /// # Examples
+    ///
+    /// ```
+    /// # use kernel::{c_str, debugfs::Dir, device::Core, pci, prelude::*};
+    /// fn create_debugfs(pdev: &pci::Device<Core>) -> Result {
+    ///     let dir = Dir::new(pdev.name());
+    ///     Ok(())
+    /// }
+    /// ```
+    #[inline]
+    pub fn name(&self) -> &CStr {
+        // SAFETY: By its type invariant `self.as_raw` is always a valid pointer to a
+        // `struct pci_dev`, which contains a `struct device dev` member.
+        unsafe {
+            let pci_dev = self.as_raw();
+            let dev = addr_of_mut!((*pci_dev).dev);
+
+            // If init_name is set, use it; otherwise use the kobject name
+            let init_name = (*dev).init_name;
+            let name_ptr = if !init_name.is_null() {
+                init_name
+            } else {
+                (*dev).kobj.name
+            };
+
+            CStr::from_char_ptr(name_ptr)
+        }
+    }
 }
 
 impl Device<device::Core> {
-- 
2.52.0

