Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D074AD1EEEE
	for <lists+nouveau@lfdr.de>; Wed, 14 Jan 2026 13:59:51 +0100 (CET)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id B7CDA10E60D;
	Wed, 14 Jan 2026 12:59:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="O650RMUo";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id BEF1444CAC;
	Wed, 14 Jan 2026 12:51:19 +0000 (UTC)
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1768395079;
 b=dMAxGxDlL7HlDen9CKLMSr6PXRsfaXZxE0bIBmgFLnQQAM3PAyjvJzdGBu75afNa11EnR
 fu50Vlrek8Z2k6tJTf7Vc2EbwEyniD33LASCmPrG4v/nbZDhklQU4CMS+XyVNuGrI/IG94T
 CHIVb8HYCtlAvy6Zbd9NhXha69KZUizvKUb1ebeEQ5vTxrimNEkH/L+K3URAUb54I6R0hW8
 O3vHJwgOiRFQatNowXh24IrtB8Lr9cbobyt5g17CNG+8hqmV7KLTJgvuj127mgiDE60laEm
 /bcYIX5L7ZLm9EK2oUp2Sy3pEd5K2NPAsGYuOiD8q5eDsacoiNfarELqfMbQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1768395079; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=z28sxhj9cQlleh+jJdlD63JzXubeJ1xcye1uPA3k7YM=;
 b=MaxjIkEmfXlPIPF1HBUpfETtyR6+5zPjvRzn455JYMA7MsfnlScyMBgelEgXOzBvz7QvT
 XQ/jjZ8onOIzEtax1Z2YgtDfXcmLYLAHjmbRZak+TPGEr+65o6cBI7tO22cpikKRGaX2eN+
 fWZA8TP47lQnSz3qsfzWFrLTZs1jLOv8qgDmWgfEEyEyyWFCjqXk5fqYemllN8TeURwljmL
 DBBN5VNDOAq2P8QiSNYfCumIgSPYQU+Jekiz+AfpjBv0oKiRL64ukjb7RSkMIxyqZsXx1kM
 779lmMsa1E7XIwhh+kz46iI1y/l15sCf1qJiZDqnYxZFvXTXD5dWzNiL5j/g==
ARC-Authentication-Results: i=2; mail.freedesktop.org;
 dkim=pass header.d=Nvidia.com;
  arc=pass;
  dmarc=pass (Used From Domain Record) header.from=nvidia.com
 policy.dmarc=reject
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=Nvidia.com;
 arc=pass;
 dmarc=pass (Used From Domain Record) header.from=nvidia.com policy.dmarc=reject
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id 6F80F44C87
	for <nouveau@lists.freedesktop.org>; Tue, 13 Jan 2026 22:46:10 +0000 (UTC)
Received: from MW6PR02CU001.outbound.protection.outlook.com
 (mail-westus2azon11012063.outbound.protection.outlook.com [52.101.48.63])
	by gabe.freedesktop.org (Postfix) with ESMTPS id E3A6B10E568
	for <nouveau@lists.freedesktop.org>; Tue, 13 Jan 2026 22:54:39 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TQMcwxXozBkzCJ5fdCD9ajKoug7DOoRyD74WmK5wKDfCYhQ5A9T1eP+RVXKjm3nFXbErQPHduTq584fj7cptnd9h3cCt+9BnS9J2axLX/7v1LFkGHhfRJSyvKCprwGWP1hajvC00SjpRypUdYjIFyAc0ip1zxOr4xNQRj6qZjPr4cCdIHMWCw5ovE7qvIkvmfFf8CgQsYzVfaLr5Kiw+maEkS118qkSOnrJQ38Tf/8Gu2l4t2EHvVrPnQNu59hUYIgB8VZ78PtUO0XCj1KDs7WtBYZwKf6IKnRRS5wmh4z8vFaqBc3DsyEs6X3k0CoZQz/9eXB6J8apG40OouRj28w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=z28sxhj9cQlleh+jJdlD63JzXubeJ1xcye1uPA3k7YM=;
 b=AegPPryM3SWb2PKHhxtIFX4PEJ8q8ZGPFiIQ8aD6kjDfXYH7t/EfgjcQwID9XRY5KnwCT0H53mYDSWpW26MdPntHyHjR7v5aRWP/G/t+3KqrUK0knPcXtaZc+kD9l5BOXkT6bOfrA8gu1N4FXbSIFS08IxHx5Yv7vNke9mUAZE0ynf9SYImZdCbNtcX8BpWfCsheoGWtuYIYOwdZILemcvIqWem0PCGZICGAvbw9Pu3pmvK7yOyVOC07PMwCSmI9j3/3jjHqPjx15dOXYztD6Nehao4q02g/MC/NipaN7+9VSWekNl8f7plzp1UJKgEtO5U9cd2ySKDAMfBSV0RadQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=google.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=z28sxhj9cQlleh+jJdlD63JzXubeJ1xcye1uPA3k7YM=;
 b=O650RMUouBJemIvUDkm2S/c5NU99TYyTVY1DQeYcVBhdxy2xRT4QcUdQMljdELXMCyTzjcLIIzS2qaOra8IHYtfXNBJtFItkWyMXpSe5tWEGFe+PPbAKRztBNgpAZr4g2PzaYhQnlCkCzE8SJlIGvm+zAvMfYKIXFB0Qm9fX3/2+Okl8uX+vCeI2k77YbiGnwDmzjdFWALzNmOCppLF96RP0KXmYAlJRdEql/NBu8BN9++pdoBLwPNXWDYEJK3nbroBd7mx0PAOhpJM6Fh02rFGkBC21Aljoy0I8Tb2KC1ssbb0Q7bjJyUfaJszrSouf3zSa8XpFixcJMP+4Q3gi2g==
Received: from IA1P220CA0016.NAMP220.PROD.OUTLOOK.COM (2603:10b6:208:464::10)
 by DS7PR12MB6095.namprd12.prod.outlook.com (2603:10b6:8:9c::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.7; Tue, 13 Jan
 2026 22:54:35 +0000
Received: from BL6PEPF0001AB78.namprd02.prod.outlook.com
 (2603:10b6:208:464:cafe::94) by IA1P220CA0016.outlook.office365.com
 (2603:10b6:208:464::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9520.4 via Frontend Transport; Tue,
 13 Jan 2026 22:54:35 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 BL6PEPF0001AB78.mail.protection.outlook.com (10.167.242.171) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9520.1 via Frontend Transport; Tue, 13 Jan 2026 22:54:35 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 13 Jan
 2026 14:54:20 -0800
Received: from ttabi.nvidia.com (10.126.230.35) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 13 Jan
 2026 14:54:19 -0800
From: Timur Tabi <ttabi@nvidia.com>
To: Matthew Maurer <mmaurer@google.com>, Danilo Krummrich <dakr@kernel.org>,
	Gary Guo <gary@garyguo.net>, John Hubbard <jhubbard@nvidia.com>, "Joel
 Fernandes" <joelagnelf@nvidia.com>, Alexandre Courbot <acourbot@nvidia.com>,
	<rust-for-linux@vger.kernel.org>, <nouveau@lists.freedesktop.org>
Subject: [PATCH v4 3/9] gpu: nova-core: Replace module_pci_driver! with
 explicit module init
Date: Tue, 13 Jan 2026 16:54:02 -0600
Message-ID: <20260113225408.671252-4-ttabi@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB78:EE_|DS7PR12MB6095:EE_
X-MS-Office365-Filtering-Correlation-Id: 4eff0e90-0eb1-428e-6868-08de52f6b953
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700013|376014|1800799024|82310400026;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?HrkwPv9j959dDvQ3jzEirxic/gLc58lGEbvJoMQTuYWVyW8aJ7RrHbxOF/JN?=
 =?us-ascii?Q?9NXYLsh3zvytc5wN4RwrUBCLhL4pG2fz6S6s62kROjwHhpKhPrHfu4u+37yB?=
 =?us-ascii?Q?hDRTY7SRZud1qxT3rt3QfqAxmqPkF0xshngbioq6JcGskB0hPMNtZtwYZEBU?=
 =?us-ascii?Q?65QIfTANPr+9uQ9t5BbHoycoPOS0Cjcn2Iv0+AswFOOmWM+NPmSZGOjTpt+d?=
 =?us-ascii?Q?jc/7BxZKCx+OsglzG39lul9eGjzMAvoqisyXNID9eWGxIGz+kXScylTizzwE?=
 =?us-ascii?Q?QaUTw/NJAHivkP4LhrGhj5gIPru+l8WIXfNESCq9nu7zzFcTAbDA10dFWibf?=
 =?us-ascii?Q?B5VQLW7ai75DymLssYMt9CVYkufHS6C7qu6UQtxjjwhoeLa/R4S4gXevDJYz?=
 =?us-ascii?Q?yofdskmnpUyYx99AQS8gpQUcUnKAG+epfjc6o9VDCv5Z+hiAy6AW5wPYLj2v?=
 =?us-ascii?Q?o3jNHj+4VdxNdvM0L0ipIIzyfQc9kkZf+WbqGaCT9NMlF1X6kAYb9uLzm7YG?=
 =?us-ascii?Q?sqmbIdTbzp8UvUja4VGSlqSMrpT1bKJ+qDnZJQSNAtTvPMwAzhi9oDsV27R/?=
 =?us-ascii?Q?zEC9yeSAb0hS9vDd1JID4v9CcofU/Ubo09o0Adyzmxf7Ea3b++Lyj6xdwW+a?=
 =?us-ascii?Q?SDVLTktSBzYA1nkDrc9cdTck9nUuNGXjZwQG0Vj5uaOdiUVONJEGTGubBexE?=
 =?us-ascii?Q?9Zd7Pae7RbQJoA/+PNIHb8pccNb7IcLT/8wnUlYQ6P0r6w9BFf2ikhYbdmia?=
 =?us-ascii?Q?EaoCBEOMTn6fFdKPmNNxci6ICfbi/ZH1CwM+vRIP8WtXghdo6KFOQpi4NFCe?=
 =?us-ascii?Q?1s4VwuBxK10usIvJ4A9kUnjsNTJZn8NcZKrTgiVOw242Hfl1pTm/b0vH2nxB?=
 =?us-ascii?Q?Ee9m43J0qK/jBoA4s9pjLHN8nECJPrPKsXHITCbE6jVk0ET9CQs01VMX0ayH?=
 =?us-ascii?Q?UiYcnfy6BJTMnIkEj8/xD2yMy60JfJXLmp0IHp1Vgq9UJ62+8KTvYKGXgGru?=
 =?us-ascii?Q?MRYPYmqkqy24w0VKkslPPL1biW+AgZM98ZQCyC/NLjBEd9HwkIczsFeNOXhW?=
 =?us-ascii?Q?MlBiNRQUNYXR6a6DfprIPGF6VBe9fJ2Chpx3XNmrPETx1MRMKQHa83sBvpZx?=
 =?us-ascii?Q?ZQ7aAMkgH4HFHX1ToiI1WMxIs0mJJrSpkgxlwp+36kKCOWVr+1PaASf6FBbQ?=
 =?us-ascii?Q?JmphyxHeen9Mn6GwXu/XUcXP+x9BsTJE7w72/0eTgeMbzgXcagp2bkkoEoZc?=
 =?us-ascii?Q?Bn3r50SmjNkyk+cFkBsSa0d3SZXjpTlGC/OVFT9vCVeEX4LfgIykl4MxlRkM?=
 =?us-ascii?Q?NvlZWIcTtmRvzsnzWuxMqiroTErMbG0UBfQPuBApLR7JphY0fofvhZbPQnbN?=
 =?us-ascii?Q?q0hkRvNooo986KuWuqJQTXD2FBG1c16oT07SN+iDs4hizrb7/kdmsA/tqZ1S?=
 =?us-ascii?Q?i5EGt+LxJGDsFOJs6CuBLdJNygHy9EwX3HqFqyRvWUxj5EHlZhHyEhFubIw+?=
 =?us-ascii?Q?vUhfKqyxrMzG8OrGKUXekKs9OCrsYr6kygOzch9aO0CeviUHKL8c7MagF3Vk?=
 =?us-ascii?Q?yv+nv6nb+DNov6KE1Fg=3D?=
X-Forefront-Antispam-Report: 
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(36860700013)(376014)(1800799024)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jan 2026 22:54:35.6164
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 4eff0e90-0eb1-428e-6868-08de52f6b953
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BL6PEPF0001AB78.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB6095
X-MailFrom: ttabi@nvidia.com
X-Mailman-Rule-Hits: implicit-dest
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation; nonmember-moderation; administrivia;
 max-recipients; max-size; news-moderation; no-subject; digests;
 suspicious-header
Message-ID-Hash: APHWA5K7RGZQTPPFL22RU36GT52BCGQL
X-Message-ID-Hash: APHWA5K7RGZQTPPFL22RU36GT52BCGQL
X-Mailman-Approved-At: Wed, 14 Jan 2026 12:51:17 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/APHWA5K7RGZQTPPFL22RU36GT52BCGQL/>
Archived-At: 
 <https://lore.freedesktop.org/20260113225408.671252-4-ttabi@nvidia.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

Replace the module_pci_driver! macro with an explicit module
initialization using the standard module! macro and InPlaceModule
trait implementation.  No functional change intended, with the
exception that the driver now prints a message when loaded.

This change is necessary so that we can create a top-level "nova_core"
debugfs entry when the driver is loaded.

Signed-off-by: Timur Tabi <ttabi@nvidia.com>
---
 drivers/gpu/nova-core/nova_core.rs | 26 +++++++++++++++++++++++---
 1 file changed, 23 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/nova-core/nova_core.rs b/drivers/gpu/nova-core/nova_core.rs
index c1121e7c64c5..d0df8db3693d 100644
--- a/drivers/gpu/nova-core/nova_core.rs
+++ b/drivers/gpu/nova-core/nova_core.rs
@@ -2,6 +2,13 @@
 
 //! Nova Core GPU Driver
 
+use kernel::{
+    error::Error,
+    pci,
+    prelude::*,
+    InPlaceModule, //
+};
+
 #[macro_use]
 mod bitfield;
 
@@ -20,13 +27,26 @@
 
 pub(crate) const MODULE_NAME: &kernel::str::CStr = <LocalModule as kernel::ModuleMetadata>::NAME;
 
-kernel::module_pci_driver! {
-    type: driver::NovaCore,
+#[pin_data]
+struct NovaCoreModule {
+    #[pin]
+    _driver: kernel::driver::Registration<pci::Adapter<driver::NovaCore>>,
+}
+
+impl InPlaceModule for NovaCoreModule {
+    fn init(module: &'static kernel::ThisModule) -> impl PinInit<Self, Error> {
+        try_pin_init!(Self {
+            _driver <- kernel::driver::Registration::new(MODULE_NAME, module),
+        })
+    }
+}
+
+module! {
+    type: NovaCoreModule,
     name: "NovaCore",
     authors: ["Danilo Krummrich"],
     description: "Nova Core GPU driver",
     license: "GPL v2",
-    firmware: [],
 }
 
 kernel::module_firmware!(firmware::ModInfoBuilder);
-- 
2.52.0

