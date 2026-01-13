Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3477AD1EEFD
	for <lists+nouveau@lfdr.de>; Wed, 14 Jan 2026 13:59:56 +0100 (CET)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id AA3E010E624;
	Wed, 14 Jan 2026 12:59:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="eLmXlfKu";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id B681244CAE;
	Wed, 14 Jan 2026 12:51:21 +0000 (UTC)
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1768395081;
 b=qI+cvRXFTcomvNrdojrWcrVuSSP3aBH1dBRJBhhaFNNdsMcX5Jr3G/kivVAWvnthhNLG8
 UUMEAnqnSwDJAFbW7IjbKTP6VoQRHgv6kBOSi5/6ihMfOH38qudZ6JTeiQ47T21zOGncdax
 zF6bzbYEzT+hOvOs93ROUxaZQ8L82mxrSgsZ4f3h2h4Z3CIvLzVfeCUXjyvAExSArncKg5p
 hH0MYtc9/YcaXJ8tfgSFx+ybazZHYutyYHrFAgXJCIMW0D/B5oRvgC4SZ/DqMIUw/Ch1l+u
 8Wu/8ql1D4OV6UwR2h7C0d7NPxBetsnRNrnpMMddvbNpHOail2VbSfNre32w==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1768395081; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=+C6S4z2BekgHs6vS0lcUxP1c0g2pxCXTMXp1eQQ3PS8=;
 b=X/IS0mbGGSRrKBORvS1VzSkl6BGGWmPUImLi3snvjZMldoI+xBq2xSAuLhW/nyyUKrwVi
 W68anyuNvGF0p7+QHuKqxw/Db9AmJqVn/t7vQ67gPSYhAyLeOdBwLIezPlCvgyy32tNCWPZ
 AoNC6fvUpqskvWqWPAw4yMl5UknFzMLnAndlRQki7LqlJJyOwOrGoEjAQFdvjRXtf9f84pH
 GeC8dAmmYrxJRT2ViMOMj9PgpiQgjgzCT0CWJ7oq0uHpXxJXV+gEMeXqdD688sUsZeC31wv
 1PTDVa4iqJBIC8DkYbm8nY+JAv9R3Zokx6BYvbc39n6lEJ/2hESQ/vkD0r/w==
ARC-Authentication-Results: i=2; mail.freedesktop.org;
 dkim=pass header.d=Nvidia.com;
  arc=pass;
  dmarc=pass (Used From Domain Record) header.from=nvidia.com
 policy.dmarc=reject
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=Nvidia.com;
 arc=pass;
 dmarc=pass (Used From Domain Record) header.from=nvidia.com policy.dmarc=reject
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id B907A44C87
	for <nouveau@lists.freedesktop.org>; Tue, 13 Jan 2026 22:46:12 +0000 (UTC)
Received: from SN4PR2101CU001.outbound.protection.outlook.com
 (mail-southcentralusazon11012047.outbound.protection.outlook.com
 [40.93.195.47])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 30EF510E29A
	for <nouveau@lists.freedesktop.org>; Tue, 13 Jan 2026 22:54:42 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rIXicqlQzJslfPBziwFlSEArj6PMtTYKJMAnNO3Z8tjK4FBz6nGsOqVEJT+S05Rr1+vBwweZ8b/3OwhtPBeC3AZhGWp7aP5Ytl+zDVdv51p0NShJxan3iJg9b7fW1Gp05LYbsqqi0l5An/BnA76FxxOegGfuFaZfxtFuAqzanm4ss4Te2/SvFYUpVr/2pI8oyYR4IfRCi4pfe6u5EtrurkSQuKQ25nyZIYOT9qWcU27AP3dSyfCqqiFBrCvWRs0QUeXchM3EZMB+1s4ybdhfcAocpQQNAES9AQplAYRNLpMjeM7r3hwrkKDsTNSWbTKByvvU1fuL3O8e+DyGsY6t7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+C6S4z2BekgHs6vS0lcUxP1c0g2pxCXTMXp1eQQ3PS8=;
 b=WdhNELVFsNZMvOJJ/m8M3l84GI1CQ81nFHk4Ka+6Vkbe+5ZsD07izqWGxYHRpaDjZsIM5PgF4f6GUkO2piplWRiRXS5EfKfnwCoLOA6UI9g7QJb99lSh9R7CwyrdjVI5CeNylTd+DZnRm0r5DwbiEOfAe31hMFEs7daLmqh1bVfUjJ2iLXJkdGrPxVaaNFBiR9TjocL4O+UECHyvaYXTfq/TToCVsFqxVTk2+3S2qcFe9s2+sAh26mtBX8ZHjPS4K0ZKEcWij+4megVZSDt4Ec3gye72E2WtFkuq6yip6WVAAkCoRG9NVMm8XimAGSU/XNIIMZWHRiDIG0uaOHZddQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=google.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+C6S4z2BekgHs6vS0lcUxP1c0g2pxCXTMXp1eQQ3PS8=;
 b=eLmXlfKu24R01JGLd2npqPQn/zMCPfjQOHguvT4BPlyDK1iI65s9BG3vBxlErS9He4B8t3PzmZQPQJz5VL1HIKKeKpoFUxVVTXTldeswF+OPFGyf1B0c8jZTbggglJCb4xrjYg+F8lobtj5CDMQRHKbVkFKCSVJrcqZNDkwR4DQIlnnBRezui7PiKtLMiYu5y5LMAAtHufgNTgSppKGQHjtUUuYDvrNRmQWENNb2harhH17aRiAttwV5DeOAjTMuIQN33I26xkGPYJxEPa+PcJWMVhkpNRJe6iNzOa+gvb81utKDwadud9/HmSkdY+xGVx9w2kB0rtIQ/tzIiqWb/Q==
Received: from DS7P222CA0008.NAMP222.PROD.OUTLOOK.COM (2603:10b6:8:2e::29) by
 CH2PR12MB4312.namprd12.prod.outlook.com (2603:10b6:610:af::14) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9499.7; Tue, 13 Jan 2026 22:54:38 +0000
Received: from CY4PEPF0000FCC5.namprd03.prod.outlook.com
 (2603:10b6:8:2e:cafe::8) by DS7P222CA0008.outlook.office365.com
 (2603:10b6:8:2e::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9499.7 via Frontend Transport; Tue,
 13 Jan 2026 22:54:38 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 CY4PEPF0000FCC5.mail.protection.outlook.com (10.167.242.107) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9520.1 via Frontend Transport; Tue, 13 Jan 2026 22:54:37 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 13 Jan
 2026 14:54:23 -0800
Received: from ttabi.nvidia.com (10.126.230.35) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 13 Jan
 2026 14:54:22 -0800
From: Timur Tabi <ttabi@nvidia.com>
To: Matthew Maurer <mmaurer@google.com>, Danilo Krummrich <dakr@kernel.org>,
	Gary Guo <gary@garyguo.net>, John Hubbard <jhubbard@nvidia.com>, "Joel
 Fernandes" <joelagnelf@nvidia.com>, Alexandre Courbot <acourbot@nvidia.com>,
	<rust-for-linux@vger.kernel.org>, <nouveau@lists.freedesktop.org>
Subject: [PATCH v4 6/9] rust: debugfs: wrap Entry in an enum to prep for
 LookupDir
Date: Tue, 13 Jan 2026 16:54:05 -0600
Message-ID: <20260113225408.671252-7-ttabi@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: CY4PEPF0000FCC5:EE_|CH2PR12MB4312:EE_
X-MS-Office365-Filtering-Correlation-Id: 9e6da5bd-97fa-405a-47c9-08de52f6baa1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700013|82310400026|1800799024|376014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?v7e9KbTZji56+UiKswLdHL0lJWAsvbbtraJvY84F12arGWx3q6CXi2CFj5Mm?=
 =?us-ascii?Q?TIf2FLPvN7FA+nUKdqd4TrS94BBB7hhRu632jfqUFxfz6ESKf3YwZwslhHoU?=
 =?us-ascii?Q?n5qmzC4/Jjo0sRrnHYH+e/D9tO0l9B5V+AwrGAMzpExY96ra/OfH/q4hpnn0?=
 =?us-ascii?Q?sqDjs8cZZzcopSd3Bic7hJlOPqVLFgY/HwBvyJW2ml77QwfH1aJePQ9O5PyH?=
 =?us-ascii?Q?m8WS6TIAv/odOZuHwt7RfKDQNuxlqbSnLmlwtGN8oh46lq9OQsC1qQJh5Hjv?=
 =?us-ascii?Q?Uanhq8LTE8mGUx3SPBXGb5AQ7sL1VbTCC0v7ExBdALEnLSpKmRGWdlrsb30B?=
 =?us-ascii?Q?utClOmK1nYJuyDQ5HSQFTMfiUdKJZvCH1F5IWZ8nQ7EUJcjsYXDrrX9MiNL/?=
 =?us-ascii?Q?IxvkYW1kq7OMbBPqzAMhyxeZqBl2Acvm5kI02sgCq4OoW3UCs47Wcgr2lBYd?=
 =?us-ascii?Q?LBFVHcj5/T4cqHQRGOcmeG/I63CSNh9+I07hUk9ksPNNqbbx31A98N49srXL?=
 =?us-ascii?Q?njPtS+ZHg2/a21VbdIOE5KzHyy6v9hGZr9ReTuBT8cPOi53LhP7hQWTHNo1D?=
 =?us-ascii?Q?jfzwzwnp3mOQsUfkEbw4Rjfjx83zptQWv7yGDnGWpOZhJgRwIz84X+LoP7Yd?=
 =?us-ascii?Q?p7a0IMJifgICfgZBcAQuqorZYKvdk3xus5oQhrnwU1pu4YrFLKhiJ1lBMkBg?=
 =?us-ascii?Q?sVNzROCo09i4Xt6mwOg1bzY9+ogEs7wa6vbfUNbiiw3VOug+H+lBmeWBTiSw?=
 =?us-ascii?Q?zU5Cp3BrYygBavYfE2nI7/R/hpLRRFJOUJqKZ9VjRAul2TAEu2akLaDznmcm?=
 =?us-ascii?Q?W1zJO3ar4lPulSNgy97S0Dsj4utWiugg4chf+QAuLwaee9WEbdj2pMpmkjWX?=
 =?us-ascii?Q?uhFICN9tF/tQMW/h4f8QozXPgaOOoVu6kY8Tb5S66pfmlVw3BEeUfFnmRu2E?=
 =?us-ascii?Q?uvOLk51P34OD5jYYr2sR/+KkM6UoyexPvqtbqjrfMm7ZQBrxFZh1beXKSPa8?=
 =?us-ascii?Q?N3xHHCwQnjz0bG+fDn1DkMxXRvAYCIhOyZe8xy8iB1rid2poB49VRVgpQBpG?=
 =?us-ascii?Q?XyKli8FFMB0ua2/KegHdClbDoCLcIoYY5A40WaHnT4DjGtn0n2JAAQrvDZc9?=
 =?us-ascii?Q?6XZcf8mphkwH2eLxJEV0GxYekoK0+YrMEjhNdq1JwKTmbg+qByEjGDh7I0n/?=
 =?us-ascii?Q?U2yJhHBdy/qN/svJcrrTROC/z+HV6/fNiDAx9NLWfeUffmPQ0Vd1HZU76UbO?=
 =?us-ascii?Q?0Cz57pjYqJultXVHEJ/qWC3Sv+rfNoy4Dh6VtgNTWsBT93SUD0Mre7W//T26?=
 =?us-ascii?Q?Rd5ychBa3vq1oOCl3kZrSg7fBOY4r4K7+qzjmjJymLna/E+ceTqGj3vC1wiU?=
 =?us-ascii?Q?KtuABj5sX6Z+UVbDAqeCtiWjTk5gFYTeM5MgO2KEAVRc/FxF7eY87xYlj4yY?=
 =?us-ascii?Q?f6KmH65a+ITexazUwZHg7aE17e9V+bz9AKReSWZTSH3A7pLChGLiC93ukXmB?=
 =?us-ascii?Q?8vYgANVn+s54yPf/8LcGyj0HaB59bMZAm6H6XGDe9dUcH3GF3tWZbqOWzcwQ?=
 =?us-ascii?Q?98WVxPXEGKQzonXHNho=3D?=
X-Forefront-Antispam-Report: 
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(1800799024)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jan 2026 22:54:37.8617
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 9e6da5bd-97fa-405a-47c9-08de52f6baa1
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CY4PEPF0000FCC5.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4312
X-MailFrom: ttabi@nvidia.com
X-Mailman-Rule-Hits: implicit-dest
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation; nonmember-moderation; administrivia;
 max-recipients; max-size; news-moderation; no-subject; digests;
 suspicious-header
Message-ID-Hash: Q6KXY6XJPJPLR5GNH3SSPA6S743FO6OT
X-Message-ID-Hash: Q6KXY6XJPJPLR5GNH3SSPA6S743FO6OT
X-Mailman-Approved-At: Wed, 14 Jan 2026 12:51:17 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/Q6KXY6XJPJPLR5GNH3SSPA6S743FO6OT/>
Archived-At: 
 <https://lore.freedesktop.org/20260113225408.671252-7-ttabi@nvidia.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

To prepare the Entry struct for adding support for LookupDir, create a
wrapper enum DynParent.  For now, it only holds an Arc<Entry>.

Signed-off-by: Timur Tabi <ttabi@nvidia.com>
---
 rust/kernel/debugfs/entry.rs | 16 +++++++++++++---
 1 file changed, 13 insertions(+), 3 deletions(-)

diff --git a/rust/kernel/debugfs/entry.rs b/rust/kernel/debugfs/entry.rs
index 706cb7f73d6c..3152e4f96219 100644
--- a/rust/kernel/debugfs/entry.rs
+++ b/rust/kernel/debugfs/entry.rs
@@ -7,6 +7,16 @@
 use crate::sync::Arc;
 use core::marker::PhantomData;
 
+/// Type-erased parent that keeps either an `Entry` or `LookupEntry` alive.
+///
+/// This allows an `Entry` to have either type of parent while maintaining proper
+/// lifetime management. The parent is kept alive via `Arc` reference counting.
+#[allow(dead_code)]
+pub(crate) enum DynParent {
+    /// Parent is an owned `Entry` (will be removed on drop).
+    Entry(Arc<Entry<'static>>),
+}
+
 /// Owning handle to a DebugFS entry.
 ///
 /// # Invariants
@@ -15,7 +25,7 @@
 pub(crate) struct Entry<'a> {
     entry: *mut bindings::dentry,
     // If we were created with an owning parent, this is the keep-alive
-    _parent: Option<Arc<Entry<'static>>>,
+    _parent: Option<DynParent>,
     // If we were created with a non-owning parent, this prevents us from outliving it
     _phantom: PhantomData<&'a ()>,
 }
@@ -41,7 +51,7 @@ pub(crate) fn dynamic_dir(name: &CStr, parent: Option<Arc<Self>>) -> Self {
 
         Entry {
             entry,
-            _parent: parent,
+            _parent: parent.map(DynParent::Entry),
             _phantom: PhantomData,
         }
     }
@@ -74,7 +84,7 @@ pub(crate) unsafe fn dynamic_file<T>(
 
         Entry {
             entry,
-            _parent: Some(parent),
+            _parent: Some(DynParent::Entry(parent)),
             _phantom: PhantomData,
         }
     }
-- 
2.52.0

