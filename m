Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B0B07D1EF00
	for <lists+nouveau@lfdr.de>; Wed, 14 Jan 2026 13:59:56 +0100 (CET)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id E5EB510E628;
	Wed, 14 Jan 2026 12:59:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="dBo/D+YI";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id F08B944CAD;
	Wed, 14 Jan 2026 12:51:22 +0000 (UTC)
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1768395082;
 b=oIAzaPPvqKhVmYWg7pBkl98WfEhz905j8YSIbWRD5jH323JxOLGafoGx21t25C65J8wYs
 X6PHzWOFa2lNSRW7q7/Sgle0gM9op8rP1NXjUj0n2KJz039n54iRYS2qn+SXE04wG54a/9A
 6TecG2jEAg9N0F2Ex4QTfg0f2U6OFJBrsMvH5o7xXg02QewDEq1foLQp9dUQBvdAXQIdqjv
 Fmj8DOtSWRwh0ic0LntFKX2bEI/NmX+qF1MgEihlwOGLTgnSVi07Vz4cNDJRMIwBY/kkJfS
 +qdcCif2K8b+gjSYjt81anYawBJ/3WGCK7fyyZvx6KqhgdCg4WIgE7MP+tGA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1768395082; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=+6OHKTZxWhBvXk4EcUwnEsSYwmRlbNWv9Qc6LBIrIEk=;
 b=x1YJV25mbUoN4d1s3EHWnjIrBrdJnl3AT7AjXckYR6s6r7xlT6Ct3UXGwzshsMfdnOqs2
 f5prxpp+nOT6KcTIvt0zdX4mw9+/WgkPHdxZzNTKJrshCmB4WtnCzbFhFhasSKSvzOLhVqB
 qHQ+ymKiW6GhHlomz0UiXqaWruFJSH0ZG8uwl35DKWj3XPvi1iZAq460uKYHzaVE0JJ4Rg/
 Uo4xf5cAHH77oaU1VZAbUPCMKEshEaOZ8nOF+fTAtJgRwdNoyJ3ohlCPhkvlwWIxI1JqmDC
 9VLOttX6yTGiNlDmDWEg0O3/iuEtPWn/WCWpwv9lMMB57ycAVUvd/YJb9lRQ==
ARC-Authentication-Results: i=2; mail.freedesktop.org;
 dkim=pass header.d=Nvidia.com;
  arc=pass;
  dmarc=pass (Used From Domain Record) header.from=nvidia.com
 policy.dmarc=reject
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=Nvidia.com;
 arc=pass;
 dmarc=pass (Used From Domain Record) header.from=nvidia.com policy.dmarc=reject
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id 82DB344C87
	for <nouveau@lists.freedesktop.org>; Tue, 13 Jan 2026 22:46:13 +0000 (UTC)
Received: from CH5PR02CU005.outbound.protection.outlook.com
 (mail-northcentralusazon11012051.outbound.protection.outlook.com
 [40.107.200.51])
	by gabe.freedesktop.org (Postfix) with ESMTPS id F10E310E562
	for <nouveau@lists.freedesktop.org>; Tue, 13 Jan 2026 22:54:42 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gOiOImTtDIi+CtrT04esUsF0uP2wIsJMqpWIC9zo9nT7zHFs2q1DFQWPr2XwNRQNJSikzK0ILKWZiu+ACyttWzrSGzlJLuRMn/jjcMe86enp9cO5wXgFViNGiGMz1qY8k1+jYCZ5XtIuv8B5z7LWtuQ2uuiCkMsSnKlTXi3ucY1awFDD+pSsX36N3jORHBlp/FGs2Xe+IcQH+8/kCqXGPsMDYVLa/J0YEjV+i3DKUe+JBYTYI7SVI8bPkcFIEKGLK91RMZ6DAIbnI+oYnkStqTE+vL+rX4bdXfEo8gpsMW1OLlEsCvm+0AaiX+lZW7L6wezHq+IISlUY9Q7MrtT3Sw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+6OHKTZxWhBvXk4EcUwnEsSYwmRlbNWv9Qc6LBIrIEk=;
 b=nWAnRp2IQeukBKAxvvyVH4KCWmlx2xNc6jNAVW42rQ+NQEjF2N8Jjoc0zGDv+v75MlTbX+5K805rfamudBYCqWqtJnmD8pqe11ntMv0LMvnXa7eTaadgAtqDdW3v/12Emx553XNt3Rj6MdyAvr5hJDiFJN2CSaSDviufFrToZM5FHhbLMpEAXdU4QRxlBmQbyVGavpQaNzBcuANLMDxCrM9kHicBt+HM6FOxn+gQHXZf77bNMmX/boJ6FK+lcR1YOWQRQrGPTEOZbrMl75aQazjque0rXIAvt8FKmMcDlGgDimUv8WyiDHYSjtdarAtaKwrp3FnBJ147Jy8fYUfCmg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=google.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+6OHKTZxWhBvXk4EcUwnEsSYwmRlbNWv9Qc6LBIrIEk=;
 b=dBo/D+YIQnzH/YWbmaPgmNDcFICjK9rzxCxiELxvClrphY9fJyhrjO2keKTS64m5bdhlUd5EYu/C/SldW9acIo0lBrOz5A5DATjJPdFS0B1YMOIQt+QVMFSh7+Wogbhp6N3tKz3CEEq4joj9cYO1i1wB/8qGMPsHNBBg5fKNybqlA48KRq+GaLgfvVvfu1lC+WRNolRKnbirDrJeCqtPRhJHD3oULzi6BzA7D7m99K03hJWZYn9psrCr1XpiiWLhjt6xEI9k6c7x8k41VijM+onW5ST7gggUVgmTSUjpknVT/s2sPLTpO8DTjmlwCOxJ3pknJpCHGHsLUupujH8TUQ==
Received: from CY5PR19CA0003.namprd19.prod.outlook.com (2603:10b6:930:15::20)
 by MN0PR12MB6246.namprd12.prod.outlook.com (2603:10b6:208:3c2::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.3; Tue, 13 Jan
 2026 22:54:32 +0000
Received: from CY4PEPF0000FCC3.namprd03.prod.outlook.com (2603:10b6:930:15::4)
 by CY5PR19CA0003.outlook.office365.com (2603:10b6:930:15::20) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9499.7
 via Frontend Transport; Tue, 13 Jan 2026 22:54:20 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 CY4PEPF0000FCC3.mail.protection.outlook.com (10.167.242.105) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9520.1 via Frontend Transport; Tue, 13 Jan 2026 22:54:31 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 13 Jan
 2026 14:54:18 -0800
Received: from ttabi.nvidia.com (10.126.230.35) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 13 Jan
 2026 14:54:17 -0800
From: Timur Tabi <ttabi@nvidia.com>
To: Matthew Maurer <mmaurer@google.com>, Danilo Krummrich <dakr@kernel.org>,
	Gary Guo <gary@garyguo.net>, John Hubbard <jhubbard@nvidia.com>, "Joel
 Fernandes" <joelagnelf@nvidia.com>, Alexandre Courbot <acourbot@nvidia.com>,
	<rust-for-linux@vger.kernel.org>, <nouveau@lists.freedesktop.org>
Subject: [PATCH v4 1/9] rust: pci: add PCI device name method
Date: Tue, 13 Jan 2026 16:54:00 -0600
Message-ID: <20260113225408.671252-2-ttabi@nvidia.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260113225408.671252-1-ttabi@nvidia.com>
References: <20260113225408.671252-1-ttabi@nvidia.com>
MIME-Version: 1.0
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.126.230.35]
X-ClientProxiedBy: rnnvmail202.nvidia.com (10.129.68.7) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000FCC3:EE_|MN0PR12MB6246:EE_
X-MS-Office365-Filtering-Correlation-Id: f7b53482-706e-43de-cfc1-08de52f6b6e9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|376014|82310400026|36860700013;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?SAFLPNCFHr0DWOJPl4CfjG5RSS0jrGZpC5HcXw4r5neLOWKEc09x9ithgYU5?=
 =?us-ascii?Q?ovHRBf8vgIQPVMbyfx3xJHMddI+FWKKKcs92xYk3FoS2OuvoyDKvgs+wEATZ?=
 =?us-ascii?Q?UhwMTrdPoks17nlgYVRYGJ9WD8SJiRh1uTneUYyPAw9tzp5F2mj72vhhIwSm?=
 =?us-ascii?Q?bGN58NP0rWlS+BRtvqVemaZ9rhGMf01PwFVPOtONhaj3+G9uY6FFcHV7sr6N?=
 =?us-ascii?Q?BV6p6EHlFWTY8yRfpCnni04mslQSU/YIEmfYtVomGAGwCKM07ucN8YtaBFdw?=
 =?us-ascii?Q?W0mluUKvPzpLVN+NgyRHOp5odMR3ZDP0XLy93ZV8wM9QzE1obO3NhbHvosTt?=
 =?us-ascii?Q?6UptfySAn8WCcVdoNU3l5dy4ACStkEzqOoQgto1X8Zb1inkTW88JZtwaShfj?=
 =?us-ascii?Q?HoC+p0QIAjgvs179PcqOMmmM53rlHpXlqRfr4P/I9CnDL0f7qgil7jjzloZB?=
 =?us-ascii?Q?HJyuyA5aN7KeyBoXBrNnXZR+JnHYU3/HF3SGj67Kg3OJZ6/GbkJluCFg3Ofe?=
 =?us-ascii?Q?zPmPLTYNK4FYx3P9E5OMVdt5QUcG+3JEMsVnDqJmgwApEicx33487HCU4Xeh?=
 =?us-ascii?Q?j4lsB161ov69kWKygeJn/Al+uOR6oYempaGhvBg1klx7LGZUMN2fvaSfPJMP?=
 =?us-ascii?Q?+d4USnmSMJgif93WHUNpXvxeajayaTB+cdPI3li5ZP9p8wj1vs2KL+zvN8ls?=
 =?us-ascii?Q?q6HNyinUMAPubunJTwj7yqDNaHsa75+z2/9sBDNYA3MSSoVh4hFpoIkJnBXF?=
 =?us-ascii?Q?EWdEMxuXmXyklnMoUZsh60xsUgG3/tY6T4qqYph41QmJryN71Vx4Nv+QAHua?=
 =?us-ascii?Q?rmBr5sb+WMyQaSLlzhADVOd4XaOgDWoDWOvDuoAZu29IVeUY8/14MO2ngW5j?=
 =?us-ascii?Q?piJQsKMMgDNDdC3QOFPDBIBs4rKJufHGLPtVwh3l/LrSgE+L/l4atCqy/Ap6?=
 =?us-ascii?Q?zAQCQ+mVuNhU5i6PpROBgQGO13gDbuZDNqxS0cxudP5NgWrwj+ZWHqglbXZG?=
 =?us-ascii?Q?CarwJJCRWVKoFngjI+dYwdGlXSiebpgRPVomU/X5GTZ69/t/ORYsUeN5hVMi?=
 =?us-ascii?Q?JFfN0uHBmJPYjymnLepO7Y+9Os8adVDUBEPLEUUgjyVKoaFQAb7d308NfuG6?=
 =?us-ascii?Q?GmeMHQDDV5LZm5Y2ljsh60+nT8AUPHV00UQuHiUV58zwzNNkVD1f0tOc6UbR?=
 =?us-ascii?Q?mMffkMwmCXM10EL+anQEVu/aBabHVFYL5/5RPKFtRjT2ORzzFVST/75E+XIx?=
 =?us-ascii?Q?rJR7AM2zDxIx8V/XDTqCDxJOA1k1zlawt55rm2DZofCE8gRLd0+eGyHKokVg?=
 =?us-ascii?Q?1ELrahcNfd5zZ8rjfxGElBry69Dxr75RFiOl9G8Q0+JqIiKjZK5Z+CUHyBc7?=
 =?us-ascii?Q?Zcol+QQgOC+Y3WwOqzPn7hdYxTcvLDXiu1xgzrClQBWxbPEpVUYvHyoc1q8n?=
 =?us-ascii?Q?Q+5KQhAFJriCE6E+RPxnu9HJvw4gEvDEKkFT+yW67Ucu58ChARvDdJni3j2g?=
 =?us-ascii?Q?bnE3QbNHd66AdA/JIz2icW1zuDvogxHIatnxx4Cs4R7ShUbXIi/BMB0cawAt?=
 =?us-ascii?Q?FAjmC+wZ5742VEur/X4=3D?=
X-Forefront-Antispam-Report: 
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(1800799024)(376014)(82310400026)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jan 2026 22:54:31.6309
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 f7b53482-706e-43de-cfc1-08de52f6b6e9
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CY4PEPF0000FCC3.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB6246
X-MailFrom: ttabi@nvidia.com
X-Mailman-Rule-Hits: implicit-dest
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation; nonmember-moderation; administrivia;
 max-recipients; max-size; news-moderation; no-subject; digests;
 suspicious-header
Message-ID-Hash: 6LI2643X4BJYQPEUOAUR7LARLYPSKFLC
X-Message-ID-Hash: 6LI2643X4BJYQPEUOAUR7LARLYPSKFLC
X-Mailman-Approved-At: Wed, 14 Jan 2026 12:51:17 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/6LI2643X4BJYQPEUOAUR7LARLYPSKFLC/>
Archived-At: 
 <https://lore.freedesktop.org/20260113225408.671252-2-ttabi@nvidia.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

Add a name() method to the PCI `Device` type, which returns a CStr
that contains the device name, typically the BDF address.

Signed-off-by: Timur Tabi <ttabi@nvidia.com>
---
 rust/kernel/pci.rs | 37 +++++++++++++++++++++++++++++++++++++
 1 file changed, 37 insertions(+)

diff --git a/rust/kernel/pci.rs b/rust/kernel/pci.rs
index 82e128431f08..125fb39f4316 100644
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
+            let dev = &raw const (*pci_dev).dev;
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

