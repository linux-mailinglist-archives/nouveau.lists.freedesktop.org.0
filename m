Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 067A9D388EE
	for <lists+nouveau@lfdr.de>; Fri, 16 Jan 2026 22:50:50 +0100 (CET)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id CF20710E948;
	Fri, 16 Jan 2026 21:50:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="Ao6Sa6zU";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 942A444C8A;
	Fri, 16 Jan 2026 21:42:12 +0000 (UTC)
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1768599732;
 b=gexhjy3p6mO/jMwr0p3Vc3k4Tk4xDp8TF36Z8H96gEBn7n7uVW/YJHeqgfqt65ki5xqKm
 e605RmshvO4y4C/WnaVTNa7x2gCU3gFOXBVfNWNVu9JUHN7CXS07hbbMEwdcN8ZBrd983nL
 Ke+OrKiUa1jU5fxl+gVR4UsRjchst5yx1TJT8p6tzKNsRR6+BYmG9fusUv9K7VY22LwxV6q
 6MGxPY1cuiqUi14G0Y+RE7YITEMtaGLylwrhrMEZcQcYE2AAarLqKKtKWvN/TikpZpXb1lQ
 TNlNE2+TDbwSgeJsu0uB4c2nZZM3DA8SKEesc+gFK/ccgUlQPhZq3vNDQedw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1768599732; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=7l+BiG5yPCX/XiPeami2oECxkWWVcWx4BUY81OWDb/w=;
 b=zJyKGqLIa2GBJPTqwR+s+Zq1DUJHcaCCZ79tk2XZJ/BNKcHJDZmIPrSI53zxUvXdyXdEC
 kjUc9lylyi9AFESta8F54nwUHQUBeLB/jihbL+E+uoS7iv0XsK+QxMD6OvNmBuMNfG/D6q8
 qn0a82/w/aeeOmO6KgJ/dQ+wDVWcuHJ7Zx1dW/EoZdMF41SpcKs3T73ukwnDkJjVerRxmXa
 eizXLo9SCVNICELKD6T4ZgfHQIGfs8v5OoRRML9CzyNV0Ek8t58XYJz7xhzFraURqILaRdq
 K9pta2SMcEFnCkKqfXDSZvPeWoAIxTPTFQ+Y1Gt0c2IA35OAJbgPcuQjOE3w==
ARC-Authentication-Results: i=2; mail.freedesktop.org;
 dkim=pass header.d=Nvidia.com;
  arc=pass;
  dmarc=pass (Used From Domain Record) header.from=nvidia.com
 policy.dmarc=reject
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=Nvidia.com;
 arc=pass;
 dmarc=pass (Used From Domain Record) header.from=nvidia.com policy.dmarc=reject
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id 95B9944B97
	for <nouveau@lists.freedesktop.org>; Fri, 16 Jan 2026 21:42:08 +0000 (UTC)
Received: from CH4PR04CU002.outbound.protection.outlook.com
 (mail-northcentralusazon11013033.outbound.protection.outlook.com
 [40.107.201.33])
	by gabe.freedesktop.org (Postfix) with ESMTPS id A08F510E27C
	for <nouveau@lists.freedesktop.org>; Fri, 16 Jan 2026 21:50:44 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mk8nlQDaIjQumJjPxJT3fgn5F88sgDJJbif8Z/q9wKpfPigesZM/t9RuuSFJnI8uA8sp62llew9XVvRMM7Loi/Ck1FVMYiIfyeJ+P+Q6YPJ6Etq0VXammmwg8t2MuGv7SlqMzWqMDkAV71nTQDWcRWNSHYKqDssqw3x5OwERyG/4JIFVv0E6rmGDjXpzIZbzLfydJu8Ojx96V4RJ4mku0IjSzI5GcRIbKu07c5izUNt5vbvd6ufygTCsfFnYDSePWgEj4p9boYOWVUck+XbkA5qXeoiigvYuEXWQmYNg6jUt97c8LKfLTkYHiuqsAUVpfcJUwlcF5WZXGIV5gatx1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7l+BiG5yPCX/XiPeami2oECxkWWVcWx4BUY81OWDb/w=;
 b=d03b91u7fyZ2oVe7hA+NNW3Roc54fMdg5dDpHKYWxZUOso5qwiZeiLECJlahjymoOyUj8LRHOiGmaESDOrnq2PnFRsbC1IrlmZ0pFNpr2EdvOTS2zJMXlU/J7CYg3NHLxnOvIh/ZtYxHtXuhmEJQhfrS9Bz80qEEnGQU8t3G4XucBpSDtGReyVyJr3K97HY5moY7Q/ahOLs7FjscIUFnL27Opuc/7etBV6wQXrxJcH7SuXWxRux2g3SjC/+4JWzI9qoxLaAQaBJQnOclQy5XxyZNpATjDV6vMNnCDGijDFx9Boq0d3iFXA3F+p9J6AwKGZ0TUqRnKa8ll0VIRMRrvQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=google.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7l+BiG5yPCX/XiPeami2oECxkWWVcWx4BUY81OWDb/w=;
 b=Ao6Sa6zUZBw50aBUj8GlB/ZRGWqbRnAkjZz632QE4eX2I8IiYWxcnVBdECL3YG7IUgTlFkNEeud8U49SPin9U9Zb26rqkJmica0zCDhdZGZUXfg9JUTO5uJW86vlBuaOqlkAm8pZHBVMleDRnpdAhaLYeNZsktJHiTKdYkSiUfulI4npRQCGM20U3mKRDCubPbRkIEWYiR5vtKbg6cTEySa04J1Qp0F6OsnSsSrY1tk9eEHvlZ4im+wt2z/f+rDsF+3Y2Tm6vH83ZKMrCycj3SwRv1u/njVR3yumq0TXkagYHDpr3S0JjFrFsfAMrK1i74yaMFc3ROVem5Mk4zF/KA==
Received: from DS7PR05CA0069.namprd05.prod.outlook.com (2603:10b6:8:57::21) by
 DM6PR12MB4090.namprd12.prod.outlook.com (2603:10b6:5:217::11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9520.7; Fri, 16 Jan 2026 21:50:39 +0000
Received: from DS2PEPF0000343C.namprd02.prod.outlook.com
 (2603:10b6:8:57:cafe::4e) by DS7PR05CA0069.outlook.office365.com
 (2603:10b6:8:57::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9542.5 via Frontend Transport; Fri,
 16 Jan 2026 21:50:36 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 DS2PEPF0000343C.mail.protection.outlook.com (10.167.18.39) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9542.4 via Frontend Transport; Fri, 16 Jan 2026 21:50:39 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 16 Jan
 2026 13:50:19 -0800
Received: from ttabi.nvidia.com (10.126.230.35) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 16 Jan
 2026 13:50:18 -0800
From: Timur Tabi <ttabi@nvidia.com>
To: Matthew Maurer <mmaurer@google.com>, Danilo Krummrich <dakr@kernel.org>,
	Gary Guo <gary@garyguo.net>, John Hubbard <jhubbard@nvidia.com>, "Joel
 Fernandes" <joelagnelf@nvidia.com>, Alexandre Courbot <acourbot@nvidia.com>,
	<nouveau@lists.freedesktop.org>, <rust-for-linux@vger.kernel.org>
Subject: [PATCH v5 7/8] gpu: nova-core: create debugfs root in module init
Date: Fri, 16 Jan 2026 15:49:58 -0600
Message-ID: <20260116214959.641032-8-ttabi@nvidia.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260116214959.641032-1-ttabi@nvidia.com>
References: <20260116214959.641032-1-ttabi@nvidia.com>
MIME-Version: 1.0
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.126.230.35]
X-ClientProxiedBy: rnnvmail202.nvidia.com (10.129.68.7) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PEPF0000343C:EE_|DM6PR12MB4090:EE_
X-MS-Office365-Filtering-Correlation-Id: fff0e19c-7d94-4fef-7486-08de554949fb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|82310400026|1800799024|36860700013;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?WfbUe5JYEPbQV1+7mTlf8dOA/S4sMKZWxCoiZ4XdOfJYTaEITTC64lxRxLqh?=
 =?us-ascii?Q?mPUqsxMOv+kBM6e6Qef5bGRlDkLfV5KqmxjuVMMvoD6PwgfdDAM30ZR8sjiD?=
 =?us-ascii?Q?kQDGJmi/3TUV+FVDendXqit6/8CSdmIVAqarpfCsQAyEwAfczf04P2umPsIN?=
 =?us-ascii?Q?rSHMJKuqKkiXZ/ggYP6vbg8H7cRuvFJ5zBGY+kaoSZOD1nXGHdGIqFDi3J0r?=
 =?us-ascii?Q?URrARZc1k3y0hXmEU/ua220hfIJNL2zW+8mbVgZDwO3+/VQYcQV7Jwc6m2C8?=
 =?us-ascii?Q?X8BkXbL6XqPkmTSQXAlD8p67D08roSBpJRTf3vPwFXukSmGakcybAL0MxoYg?=
 =?us-ascii?Q?e1qhFdWZMS3bcrIHZNrstqF8T2TPTwnGWqCx4osojn1zOhD+tknyfLHdZ1yh?=
 =?us-ascii?Q?BYEuXb0IR6ApiGYWCWYqocFUd6ISa5LVJoVzOEfdjDz1BtBHXvBPic050FHZ?=
 =?us-ascii?Q?qZVAPw3Jj6Vgprpe0IeuvBEj5qdGzNlF8slk3+kBkzuNnel+YDMB7BGFrgrZ?=
 =?us-ascii?Q?Lpfze+Cj94BMkDjcBXvasZg3aV2oJKpfmsxh0vNMmBHEWxXnnUU2XELgABy3?=
 =?us-ascii?Q?aZqOXXFc/uzPPIwdFrwfuCSs4d1cFPZa96C36C8C0+UIcThk+oOTGBUDivvE?=
 =?us-ascii?Q?l+M+2QJ6J+rLg42x19UDGbbQrRKrADlZyS/pcwNuIFz0KCcZZRUhl6qDnupQ?=
 =?us-ascii?Q?A64dbhN09sJZAzB7hixuBiVmJIINyWfMp4RhhOY1E/KspaCF3e4xWCqFjW9z?=
 =?us-ascii?Q?uXymfjF3lDe7zEFYhFwaX/zpye5DyjG1itTjxKuAt3bSjlx9xNvJm2UwsLkj?=
 =?us-ascii?Q?jbQs0xE8wYRRnA53dGCACuAcUGH0afUFCMbwSDKIQLw7CA442Sv3/b33YnBJ?=
 =?us-ascii?Q?acn8Zjta5gm34qXnuIQGGZoYq0IlL4k1semeOYqglaGOmv+vR7GrWccM5S7j?=
 =?us-ascii?Q?Hp4EXYzcOpUDdT64KIvE4KSIidI4nf8kF6M++s+JnGqbZCZxHCp1TRBYWBaQ?=
 =?us-ascii?Q?FVDMl73o4NQ9ipq421p9HndOE2vtvETGJficjakh4rwIYkAYkITd3Mq9P+f1?=
 =?us-ascii?Q?5c8Q2pOn1stqUz3uL5x2jYyq6e2ymwzjr93JTxWD10bqfL0x8D+UwrrxZSwB?=
 =?us-ascii?Q?5GpAyD75EnuzmHix6WEjMzY9rhVX7Ch+Bgd+f5jzpok3lkZ7vZ474eSd+Uks?=
 =?us-ascii?Q?KfHZPWZ26XjHUMJ4POGxAkmTCEXQ5u8ZOqEk/+qjRy/kgM1Ff7VzbJxu3d6h?=
 =?us-ascii?Q?rq3IfFxuR1oSKkmoxqIBaPvrNxikNUV4zuAR8vtEqG4s1pNnnUa1ze8nGEJr?=
 =?us-ascii?Q?HF2tqf+1Hk6ospYJcWHmGWf+Ripqm6ziTuPEoWg9+pbQDl5z1aCpO7OqvhdQ?=
 =?us-ascii?Q?9iJqhO2owybmXmkqS5s7mF5wch0eEGcrPXK4ePLfZ3OaxiU4gJJpEl8pPnpV?=
 =?us-ascii?Q?apItMUfBrUk56KvyjNAjObuQ1DAXNYac8Th3JPSyaY2Fh07w+rQMon5spzly?=
 =?us-ascii?Q?iw4maNB6jcdwlhw8ckNSEk19k8ADyumXt5Ksveiqeg23grD0xALegah00dEM?=
 =?us-ascii?Q?MHCgASQITfHSyzJ9+u+6oAaTEZEONtVSEx5H9M+v1PY9+7mQtgiOoLuyBBqt?=
 =?us-ascii?Q?YUVOvRz1xoUbjhZMSEpeoEvL7GqUOHggx8pDdh8YIfqnxyHfVCZ5ZVLthvwl?=
 =?us-ascii?Q?4zPqzQ=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(376014)(82310400026)(1800799024)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jan 2026 21:50:39.3906
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 fff0e19c-7d94-4fef-7486-08de554949fb
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DS2PEPF0000343C.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4090
Message-ID-Hash: HWL3OVC4HYJOIMFJXEQH6V57PUQ5PMYT
X-Message-ID-Hash: HWL3OVC4HYJOIMFJXEQH6V57PUQ5PMYT
X-MailFrom: ttabi@nvidia.com
X-Mailman-Rule-Hits: member-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/HWL3OVC4HYJOIMFJXEQH6V57PUQ5PMYT/>
Archived-At: 
 <https://lore.freedesktop.org/20260116214959.641032-8-ttabi@nvidia.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

Create the 'nova_core' root debugfs entry when the driver loads.

Normally, non-const global variables need to be protected by a
mutex.  Instead, we use unsafe code, as we know the entry is never
modified after the driver is loaded.  This solves the lifetime
issue of the mutex guard, which would otherwise have required the
use of `pin_init_scope`.

Signed-off-by: Timur Tabi <ttabi@nvidia.com>
---
 drivers/gpu/nova-core/nova_core.rs | 20 +++++++++++++++++++-
 1 file changed, 19 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/nova-core/nova_core.rs b/drivers/gpu/nova-core/nova_core.rs
index d0df8db3693d..eceefa41cddc 100644
--- a/drivers/gpu/nova-core/nova_core.rs
+++ b/drivers/gpu/nova-core/nova_core.rs
@@ -3,6 +3,7 @@
 //! Nova Core GPU Driver
 
 use kernel::{
+    debugfs::Dir,
     error::Error,
     pci,
     prelude::*,
@@ -27,7 +28,9 @@
 
 pub(crate) const MODULE_NAME: &kernel::str::CStr = <LocalModule as kernel::ModuleMetadata>::NAME;
 
-#[pin_data]
+static mut DEBUGFS_ROOT: Option<Dir> = None;
+
+#[pin_data(PinnedDrop)]
 struct NovaCoreModule {
     #[pin]
     _driver: kernel::driver::Registration<pci::Adapter<driver::NovaCore>>,
@@ -35,12 +38,27 @@ struct NovaCoreModule {
 
 impl InPlaceModule for NovaCoreModule {
     fn init(module: &'static kernel::ThisModule) -> impl PinInit<Self, Error> {
+        let dir = Dir::new(kernel::c_str!("nova_core"));
+
+        // SAFETY: we are the only driver code running, so there cannot be any concurrent access to
+        // `DEBUGFS_ROOT`.
+        unsafe { DEBUGFS_ROOT = Some(dir) };
+
         try_pin_init!(Self {
             _driver <- kernel::driver::Registration::new(MODULE_NAME, module),
         })
     }
 }
 
+#[pinned_drop]
+impl PinnedDrop for NovaCoreModule {
+    fn drop(self: Pin<&mut Self>) {
+        // SAFETY: we are the only driver code running, so there cannot be any concurrent access to
+        // `DEBUGFS_ROOT`.
+        unsafe { DEBUGFS_ROOT = None };
+    }
+}
+
 module! {
     type: NovaCoreModule,
     name: "NovaCore",
-- 
2.52.0

