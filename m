Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D33ECCC571
	for <lists+nouveau@lfdr.de>; Thu, 18 Dec 2025 15:54:06 +0100 (CET)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id E88F010EA0F;
	Thu, 18 Dec 2025 14:54:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="oAdm3/We";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 08D0544B8D;
	Thu, 18 Dec 2025 14:46:33 +0000 (UTC)
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1766069192;
 b=ysAaBy51Ddlg2okGKHmzkkuoNCv6+7jMhjFAXrbOE4WpYLtqzwvnQnF2krCQZ5TWDXxcT
 BIzRl3wrw5YzJNSIS6ID+OyR7PUPov68KhVix1yf5WEx635sbL/9uqVMmq32ES9G2e7fmJl
 5XwWR6AvttsgrOXktwRamKnU8zP5FoLX5sItvL+d1n6paXig9t+TLyKoTrci/93I3tz8WB6
 WU2M/KHAYutHPw8x9P3PtnYjDk385dGZqPR5SF+60IQb7MGT8k4fOnjvatb5ArbVN1Mlgc9
 7StGQ4TpbD1ljdpvGLxBEeamzEZeJ004jEK7cjm1P1JGfjqhsIuaK/OdkhiA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1766069192; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=+6OHKTZxWhBvXk4EcUwnEsSYwmRlbNWv9Qc6LBIrIEk=;
 b=jpbj/v4FZxnfiTH8HWAwLSPVcO6KybyhxbO07SaeUFGCtuLMcgkasdf98y4uu9u2EI5mq
 o5onQMm6MClcEGuerJWmCitO711SZ/tKgoun7cfhT2bEITLPuWmCirKWcpikqD9aAotDxgg
 kpzjJY4Hq8ezF6AUJDJbre27Ko/BOpdMEKACvx5kywFKJLX0gmF9b4SVVIBrggg9jrEtsyO
 KdaGvmXrI5+HlcpsiKS2lSDzaoHtlsauu0fy2Flomw1p6N6rIDlmH3XqpfGM86TrrJW5Mct
 vrFR2bEYi6cWmnnQRi7kNJdvQCA2Cuwx46Ai9BKLzY3Ev0Ka+gO/vr47BY9w==
ARC-Authentication-Results: i=2; mail.freedesktop.org;
 dkim=pass header.d=Nvidia.com;
  arc=pass;
  dmarc=pass (Used From Domain Record) header.from=nvidia.com
 policy.dmarc=reject
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=Nvidia.com;
 arc=pass;
 dmarc=pass (Used From Domain Record) header.from=nvidia.com policy.dmarc=reject
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id 62D0A45620
	for <nouveau@lists.freedesktop.org>; Thu, 18 Dec 2025 01:32:12 +0000 (UTC)
Received: from SJ2PR03CU001.outbound.protection.outlook.com
 (mail-westusazon11012053.outbound.protection.outlook.com [52.101.43.53])
	by gabe.freedesktop.org (Postfix) with ESMTPS id D774710E414
	for <nouveau@lists.freedesktop.org>; Thu, 18 Dec 2025 01:39:41 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=V2c/XXIGt3/LU9bEzehUUCqslNI3CXC6K7P2yrkUgH8tuswoCPyR+lnWxsoX9xYYzZTBhGR/r2PRquK/ttirqecK39arNY4ows3WhKt/OPzV5cQzilVGf7y9eiKUx5tzr0KsSJCT9K8iIuRbxxMp5hxl7S+/xSzVoVpWI1qkRQQHn26LgcpbPPzT58pMtK/jOMYn9T2EU7fAjpELA3Mab0f+Cn3bvWOgxYeKr4KOYaZHdcPEnxEr9ul/Zw/Oup4XjQSxAOL6XUtYjtFN8cmNk+0WWoaqjgt6RC3t2cw3w6N2yDfRM4KwuBLHQJn6aJ0JF6ZYtdNSc57/QdTjLjh0ag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+6OHKTZxWhBvXk4EcUwnEsSYwmRlbNWv9Qc6LBIrIEk=;
 b=M0tdBLjIPkmwrcFtP3MXywbThFk86fbwG3TUcjAxY3wM73WGTI0whKDEVpbGqViU2ttec6/rBRw9z8xRDh+eCOYX/ygA/R8kBJbldAdBGkQPeqVK3dMfd5afvDl0+gthzGrATIdatTgPDektFSpo+qWXUyvXFUfPaHYF8eBJ19kkRES9Sy7TBzYa6W/it8ir/wxb4ukQtIwLWI7NpaA4uOy4lpKhRyOn+jS5SdYj/IoaCnRRxJXzPPz44qHEvyKkUIVfJ8AJI1p1vgnaDnAuDN6opQbDaeztwPxUexhCzkYqv+Z8xaJIX/X5dQjpcfDYWqTv//fJ9gcL/jKsaYoylg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=garyguo.net smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+6OHKTZxWhBvXk4EcUwnEsSYwmRlbNWv9Qc6LBIrIEk=;
 b=oAdm3/We63vzdGDj7y5V7zoK7OweV6HylA1jeMwmWaOxZIS5c2hkQwrYS4D/vWcKxIEdxfZclxyllzQLtbq1smiuem07mbwdgznDaDgvc5WNKx1IKSmo5GD2zaTQeoM8dBmXY3qLa7y5lZ59CL/6n0mZpoZ4UzvBl/HdckI7Wr4aD5tHBzGTBHVea0ul1MxZejdYdXNtVwxF5i7lWOb6f70pMzXF++tTN4E+VhgjkXQQGGWbkFgKQrW/3SvTYwUuq8y/dSX0e4TMWLB5fdsWntUBV1DWFh+B3i5Uw8cD7fVe9d8EM0wgAeksndgm8tlGgONiHWekLhPV6JqSLKzSlw==
Received: from BN9PR03CA0415.namprd03.prod.outlook.com (2603:10b6:408:111::30)
 by MN0PR12MB6053.namprd12.prod.outlook.com (2603:10b6:208:3cf::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.8; Thu, 18 Dec
 2025 01:39:37 +0000
Received: from BN1PEPF00005FFE.namprd05.prod.outlook.com
 (2603:10b6:408:111:cafe::b3) by BN9PR03CA0415.outlook.office365.com
 (2603:10b6:408:111::30) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9434.6 via Frontend Transport; Thu,
 18 Dec 2025 01:39:28 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 BN1PEPF00005FFE.mail.protection.outlook.com (10.167.243.230) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9434.6 via Frontend Transport; Thu, 18 Dec 2025 01:39:37 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 17 Dec
 2025 17:39:20 -0800
Received: from ttabi.nvidia.com (10.126.231.35) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 17 Dec
 2025 17:39:19 -0800
From: Timur Tabi <ttabi@nvidia.com>
To: Gary Guo <gary@garyguo.net>, Danilo Krummrich <dakr@kernel.org>,
	<rust-for-linux@vger.kernel.org>, John Hubbard <jhubbard@nvidia.com>, "Joel
 Fernandes" <joelagnelf@nvidia.com>, Alexandre Courbot <acourbot@nvidia.com>,
	Lyude Paul <lyude@redhat.com>, <nouveau@lists.freedesktop.org>
Subject: [PATCH v3 1/9] rust: pci: add PCI device name method
Date: Wed, 17 Dec 2025 19:39:02 -0600
Message-ID: <20251218013910.459045-2-ttabi@nvidia.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251218013910.459045-1-ttabi@nvidia.com>
References: <20251218013910.459045-1-ttabi@nvidia.com>
MIME-Version: 1.0
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.126.231.35]
X-ClientProxiedBy: rnnvmail202.nvidia.com (10.129.68.7) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PEPF00005FFE:EE_|MN0PR12MB6053:EE_
X-MS-Office365-Filtering-Correlation-Id: 9964d59e-14ca-4db6-763b-08de3dd64dfa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|36860700013|1800799024|376014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?lQDH9CgugeDq4dZ9C0pta5SGam1XZW/Q4u992aedXXnLtMDy8sRyuFJcLDBm?=
 =?us-ascii?Q?smI45ctcVBDSlcSc0Vdd2t2DvnCmpgYRu+IKhRiljC6JJRDo4vZbEkjccy0V?=
 =?us-ascii?Q?/1eCMYAROFXTOTC9WYee29HISskZL8wz2JNrXpl8KFkp81ELtSWIh+f13say?=
 =?us-ascii?Q?35BxzJsEH3DO3CxmuSelI0Q73sUvxjqlA6yI+G0Op1xrVO6TMyG/CjYz1sjl?=
 =?us-ascii?Q?HMiiPCJN0kr2yQZqjiRlxGi/PgovJYUnQ3mVHYzl1U+7WVeO0ZlbmDBRU4v/?=
 =?us-ascii?Q?7yYgxnw5JdOUtk8rICJCITX7zzoMH1fOUouu4oEbckiWB0Hthc9yb3XuTzz9?=
 =?us-ascii?Q?oKuRZrm1ESesgGU1ZmMSFODRqR2TkbTs1ilTL6T7szPy4KjbNEhxzl8QovVQ?=
 =?us-ascii?Q?dCITpUGzOXArjn1Bg0g0jwwAkq5aMSVJfekj3BLNs0jBIoRGoUIXyAj0q2u4?=
 =?us-ascii?Q?d8buGJGfucDiNj5CWORKWCNMvM01yPbAzT/m0ryny/TrS8+WACa0lRO4reNh?=
 =?us-ascii?Q?cw6s/lRnsD7v91/lFhvhYmBjzDeeyMrxMH+OgzUI57Bp6izeeNiVtm7sTur6?=
 =?us-ascii?Q?y1N8h8Kqfohsjc58xdKVHvHfIAJz3jcraSZ2H1PB6bYCeT82J3VlvXCKW5m4?=
 =?us-ascii?Q?sjRdPdueg1SnJwIUvVnX3mExUtQPXViXD+Mzc9U6B2j+Fu7FBSYGPRh+UqA1?=
 =?us-ascii?Q?EbbuUGilJvRPBdxQsHZQEom1ldS9aQS8+InfAS3RIg0rdEEgALEj7HZmM1tb?=
 =?us-ascii?Q?9cY3zFIdbqP4fqNVEmJUgE9MqASnApaBHwmPl0QoS3ETBnRLHfShMvhDiSWt?=
 =?us-ascii?Q?ZpxICKkMTO4y+muN4iAHVGcayDidLs6IQs0lfRWUl1h+cT6fNRtnFl9bAYi3?=
 =?us-ascii?Q?sHID2TcFMKQr00Ld22BSjgX9dfTPdkUgb1TADZ6Mcu3a9EVYEHvY6X7DmIOc?=
 =?us-ascii?Q?mb8/pbYoMDon4cn3fdrKTU9Qr8TGOkoVhX2fDCFFLQi0jMV0kmzroT9Ms9pq?=
 =?us-ascii?Q?7u6sEMcI/O+RunbidW5agd53AhJxlY6MaWku0Z3JJ5pp6q+qH6rfaO+N5dOM?=
 =?us-ascii?Q?vqdfxfvS8jWXn2FD9IkGy+juQyl0DssBUSkN7hubRTdfTMU2FEgSVVAwLeVt?=
 =?us-ascii?Q?1TMfozpX8KfU9Irvu5LALoupmOjrz1UGFAE/l6jYegZCqnFmVDKC/LerqLuZ?=
 =?us-ascii?Q?FMCj1NK3EPofMxACLLVpVfb8VAjbH2pvNJ+ZcjzkQDjZTeHCITKz+yg8jPDT?=
 =?us-ascii?Q?2fgvg/ttkKQrOTPhGOJIg+IGNrI5ox1mkZ2CG6JZv5yzJW8XCc3x8C1D3f9h?=
 =?us-ascii?Q?4ykZvithIOAkXFDbDhCmjA2aFVzDNCERqmubxppa5vumHYN8n0v3LERRebxV?=
 =?us-ascii?Q?yEnvOIodGgDAyUiXg3IYSgX5EfNL3ABSDwzbA1AUi2e/jhu3tNqHu2Wr4vAS?=
 =?us-ascii?Q?922zIYraSfAzBkmPFb7ruoa3Ho2oSUCm9rDdNcZRgPNQZWJVsp+9Ce0BcY/8?=
 =?us-ascii?Q?IxdDBU/nisC0wW2vfXNx3OXw7WMdFztLBD35vlBG+vFe9ozxrxZB9AzU3Cjo?=
 =?us-ascii?Q?WhevGzQzvcfAP7Ql8/4=3D?=
X-Forefront-Antispam-Report: 
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(1800799024)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Dec 2025 01:39:37.1811
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 9964d59e-14ca-4db6-763b-08de3dd64dfa
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BN1PEPF00005FFE.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB6053
X-MailFrom: ttabi@nvidia.com
X-Mailman-Rule-Hits: implicit-dest
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation; nonmember-moderation; administrivia;
 max-recipients; max-size; news-moderation; no-subject; digests;
 suspicious-header
Message-ID-Hash: 7H5WMMI3NSK2GK46ITPN7FMBG5277SOQ
X-Message-ID-Hash: 7H5WMMI3NSK2GK46ITPN7FMBG5277SOQ
X-Mailman-Approved-At: Thu, 18 Dec 2025 14:46:30 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/7H5WMMI3NSK2GK46ITPN7FMBG5277SOQ/>
Archived-At: 
 <https://lore.freedesktop.org/20251218013910.459045-2-ttabi@nvidia.com/>
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

