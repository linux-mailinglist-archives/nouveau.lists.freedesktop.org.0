Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AC1D8CEFAF5
	for <lists+nouveau@lfdr.de>; Sat, 03 Jan 2026 06:00:02 +0100 (CET)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id EDF0510E30E;
	Sat,  3 Jan 2026 04:59:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="fAwoxq1u";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 483C444C85;
	Sat,  3 Jan 2026 04:51:54 +0000 (UTC)
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1767415914;
 b=VVd3SC4GhjyxQzTXSpCVyaU54LTriMHSj4HXeuK/P9sIQBAfo34HjeR58OUlWYYXal3bk
 68Khftv3HHVIR9IAmns1EMcTicptZob51CVjSiBkuFQFNL6HfpUsAPFSlUFCh1vv/7g/n8A
 qm5yPVaeYCqLtX5BrkMxuP/+oxXNWz9zWIYbUplLRBYlN0LQUphyFNMqzVl+ldDuwaaCZSn
 vm+gKZLWGtEInjJ85Gzipu5ADJmY8Ve5YdnpqEpXTXBTKMRuITJhCVzf+AUk3nPM6dexfxI
 P4vACd6D/pEvZVFqakzJ/cyta8F1ipYJlujTjtlfxUEKhaE1M5RoD4PvkUew==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1767415914; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=qgtzr1gunWDpPp8XfEM9E851BRn+1Ou4Ma7yv6hZZuQ=;
 b=qSZeXagbTUxOH4QO/eTNEckLYvdjsn8Caooep/AaTd7+VEDG12wPoReQCQ8CBHL4/Iugt
 D/7JvHRIbx7bGDbrM2/46CCRKyQqRr6ojx6OTqqD/5e9gTfOqkJ8Hrj4lsQV9T91RK/1mym
 CFEFKSQUC2hJpFxpIBaY2Yw20PIIcfiyDemdGn8qHuYvUgisawx/sCWLMDJJ6nmoowzFCXg
 1jN02jEiOLxfHIAmcxmivMkqcc/UR7o6HDKiPjhZ1Mwj2/AuAHcX9tc/AWyKfpHs3Z6frMF
 PSYjTYXuapz7fwZIbMbvEHfE6p+vIYY7QIhZTXwtHZ8mvE2B3OTkAj0yzDnQ==
ARC-Authentication-Results: i=2; mail.freedesktop.org;
 dkim=pass header.d=Nvidia.com;
  arc=pass;
  dmarc=pass (Used From Domain Record) header.from=nvidia.com
 policy.dmarc=reject
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=Nvidia.com;
 arc=pass;
 dmarc=pass (Used From Domain Record) header.from=nvidia.com policy.dmarc=reject
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id 1A8A344C45
	for <nouveau@lists.freedesktop.org>; Sat,  3 Jan 2026 04:51:51 +0000 (UTC)
Received: from CH1PR05CU001.outbound.protection.outlook.com
 (mail-northcentralusazon11010067.outbound.protection.outlook.com
 [52.101.193.67])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 9214010E14B
	for <nouveau@lists.freedesktop.org>; Sat,  3 Jan 2026 04:59:56 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IFesPogHb3C7b8GW1JaB/vlkrmap9gT+WhmVISX8f5MvkPoppB3ERmUcrHlVfxHcwSvzSJ49OOcq9Ipblm02DrziwTpvkV7H2twSlwT/s9keLelU8eWrEgPg7QCHNIBq209es2TxIyNelAkMF+NbZHJo8CL1+5L7d9UOGoo5p7PceXRi/Dr/jpGiIVFxT7Q09eEZYrC0krWMf7VLWOC97xrHcXZqCIiYY26zUGhWv/mjbPisMFeS6RBkAGhqUsLXiLoKSFYpT9sGKKs8pEbHDLg7+VaOsj8h2PyWJjeVoBlKFKjqeekYy9BTXJJK4+LDuXBgN2lI4HLqspDox2A2yA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qgtzr1gunWDpPp8XfEM9E851BRn+1Ou4Ma7yv6hZZuQ=;
 b=yZqv2N73DzDqJEcTjPxeOS2ZU/uP8UZnvMC5Q1r0TwKiPieIzCQ+EiOYfklUXMHmlG/ewnf5tjUDi7gJsJPyZpXnN0NfYCRfOUcNRgSyKmmJOrZDohYU+Rx/ryj0rb2tqKWcd7EQnFIXLip0LLGXoBbJgH8hcaZlXnPD2ws80fSGYVsCcAfx6XJ0ldKU345BlpiMOr9L4l3/2Ccsw+p9e/70ZTMLK7si3lJib6JWxEvkfe1gMrRRGINrIY3AylFl46grtBYaAObxAc/pD123NR1okbcVtxx9P8sKDQ1TzgPwsVwpuqZaBMmhBCpZ3qiyVwByo/D1bJaiWhdnd1xbuQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qgtzr1gunWDpPp8XfEM9E851BRn+1Ou4Ma7yv6hZZuQ=;
 b=fAwoxq1uOMljpFmNycHwGrdSsoznvgEYZyll840NJiq6l3h1IbYjdqVzEv+s0mv6WQ0J759mszW40dge9qmjkuirnL8wjziUV5j2tDCZNoFrdnllFq07AnUbOcBBDrK8b0p13/5MYXei561YRxBVuib6OUsjCvTUn1QvsHznMIfXz+K8G4+BVOnPEySvEeBoqh3GCwP2EdulUVgKf65DINwJYW0hRaYXz+49O+aVG3n5X4BsUiWdmIg3mGo0JiusqWxt+tupWUM/k+YgGpzk9gR4I911ycmmAFRZoWdwEbqRvdNmPu5OPKwNMdXWdqCxUIXWqwwUPdky5XuXAlZjbQ==
Received: from BL1PR13CA0345.namprd13.prod.outlook.com (2603:10b6:208:2c6::20)
 by DM4PR12MB8499.namprd12.prod.outlook.com (2603:10b6:8:181::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9478.4; Sat, 3 Jan
 2026 04:59:53 +0000
Received: from BL6PEPF00022570.namprd02.prod.outlook.com
 (2603:10b6:208:2c6:cafe::35) by BL1PR13CA0345.outlook.office365.com
 (2603:10b6:208:2c6::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9499.1 via Frontend Transport; Sat, 3
 Jan 2026 04:59:52 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 BL6PEPF00022570.mail.protection.outlook.com (10.167.249.38) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9499.1 via Frontend Transport; Sat, 3 Jan 2026 04:59:52 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 2 Jan
 2026 20:59:47 -0800
Received: from ubuntu (10.126.231.35) by rnnvmail201.nvidia.com (10.129.68.8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 2 Jan
 2026 20:59:46 -0800
From: Timur Tabi <ttabi@nvidia.com>
To: Danilo Krummrich <dakr@kernel.org>, Alexandre Courbot
	<acourbot@nvidia.com>, Joel Fernandes <joelagnelf@nvidia.com>, John Hubbard
	<jhubbard@nvidia.com>, <nouveau@lists.freedesktop.org>,
	<rust-for-linux@vger.kernel.org>
Subject: [PATCH v5 03/11] gpu: nova-core: support header parsing on
 Turing/GA100
Date: Fri, 2 Jan 2026 22:59:26 -0600
Message-ID: <20260103045934.64521-4-ttabi@nvidia.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260103045934.64521-1-ttabi@nvidia.com>
References: <20260103045934.64521-1-ttabi@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.126.231.35]
X-ClientProxiedBy: rnnvmail201.nvidia.com (10.129.68.8) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF00022570:EE_|DM4PR12MB8499:EE_
X-MS-Office365-Filtering-Correlation-Id: 547ca9c8-43f3-4f31-6837-08de4a84ee61
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|82310400026|376014|36860700013;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?zWUmq2ccCfwH6mNd6UgWlfktE7yIjFMGp/TpzkbOWIzBU2Xs2AI7IWnpMK5m?=
 =?us-ascii?Q?VgmSApWes60ImcbQoqFpwiQ2u7HkYIUN4crtJxDHTigRtlkPUkC4v2MqTlAV?=
 =?us-ascii?Q?j6kAHBHBUmIh4jLLvgJEVYo3pMpfSlBKDN+kgazE2XbLioaS4Lv7SaKesbbB?=
 =?us-ascii?Q?ElWUJTZOpAtpnUmXwcpdcRTJqxv+LGYj+zFloX2N7q4Evt0rm2C0vn2+XbpL?=
 =?us-ascii?Q?OI+2dIjBJQjH/n2eY4lmsy1+OKPyLXZtsx38ViWMtCxdIvHEqKJvspnFGUj6?=
 =?us-ascii?Q?m9aRlw6n3+0NgoQbaWyfn1eGi9DS/qOC6qH7Oa2Ib1Yv5+54SE+J1gfr/fSU?=
 =?us-ascii?Q?XxJZKmO/q6bm8r/T+KR5aBS3uS132A3Pjy+rmW1v+74hmMWPpcFPQbxUfdh4?=
 =?us-ascii?Q?6qXRKVEBJZyiXBRcfncdrpuq91IkHkQFVylrVpQ1bCQBHPGLehXFvRmiTXm/?=
 =?us-ascii?Q?N3FPhcjDTcOXmNcklPUbuWvSS5k7RCavEd18U3hEao20K9on/OFqUOzzvl3h?=
 =?us-ascii?Q?f+cAs8tAaFu2sL205vCKG4qrr0ayay+XsdHVcmpyNmdP34h5aFzL9FCsVfeo?=
 =?us-ascii?Q?NNMgpfYdbfY6zPK0EhzQXQ7UruEsOrMUheOA12Ed8ot3Ej5YUbFwJHx8Ce16?=
 =?us-ascii?Q?otzp6DxxiOwVIkIUp+UGpTNbfQwdGu+uKr4VzVFFjPMKYzM/iRenuR/0+qmQ?=
 =?us-ascii?Q?gU4UK+juvnFIQsSN3vqSU+KvlJiWsYNYmYxwXOgrRD0UyD76wmAPOmW6wS90?=
 =?us-ascii?Q?rTpDZdLknO+qdZH3kBgGxuSAFaZAncOr+IWTbxqw3yVtYx79vbGB10Cu+Man?=
 =?us-ascii?Q?zPlqzfWwCUcqifV1AHSb0nyteqpqLVXRqrERoHJyPn7EanW1LMv9Mz60oyhR?=
 =?us-ascii?Q?5kF54Ba1V+DD4raUiq9qhMjZgoCeD1ONU66iHxNkXPsU3elh6EaV9Y5lk3VU?=
 =?us-ascii?Q?EnMg/wZoN/3gL7InLDsd+3GAEdObAOSDmMQjBAkZpLX1AkUzPhKgRE9zXhoT?=
 =?us-ascii?Q?sFvycGZB/igISZ3O7dXJsqQm1ZycV7oIhX/tOlvHjzCos56Olq+J98W1z7qx?=
 =?us-ascii?Q?b1rDw4gF33lfKL7MEIRvvF68jG/c1gOZzuc2n9lxFjnyMz4glBCk9MnDU16n?=
 =?us-ascii?Q?fwxt00ZjMotHr2PBXvXz0JjJZqF7apjT5nyG8B3PmmEccjk0ROkGpV/ZOjN8?=
 =?us-ascii?Q?5CCQdE05QWzahinJKzd7/Nfl/NXmEsreYhG3rPN9j/Eglv5LAgXtDejf7bzR?=
 =?us-ascii?Q?uWXHy7XTs7HAus0DgEijpNhlpOdy3VSR0FrS89VCS1bgWPEST+/5VYG9I15J?=
 =?us-ascii?Q?bJkBPHAdKV5FwemycGxBQxigoIxkmwR875MIsLaNqsu23lFhUYeA/7ER+vIG?=
 =?us-ascii?Q?6SZ/ykh4dgyUU/TuJcpwM0YJ72qzCbfWUWm6wKQ0V3PSOgHMUoPv9L5DMwBs?=
 =?us-ascii?Q?Egbt2ZmxZIC2AqXacGFWu7FNSYTeACmyfxgyZLHpQnDvCMs/z0oBGKdS1bxX?=
 =?us-ascii?Q?Zp0vsxtyPeNnavoJxf3btNAD8P9MPqGCkKNuLXwMJOIbgA106orZqFic2UP1?=
 =?us-ascii?Q?c7rWVrVgrKC+HIysCeU=3D?=
X-Forefront-Antispam-Report: 
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(376014)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jan 2026 04:59:52.6762
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 547ca9c8-43f3-4f31-6837-08de4a84ee61
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BL6PEPF00022570.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB8499
Message-ID-Hash: CEA62FNQ4677O33MBXWJUGCGQVYQ2ERB
X-Message-ID-Hash: CEA62FNQ4677O33MBXWJUGCGQVYQ2ERB
X-MailFrom: ttabi@nvidia.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation; nonmember-moderation; administrivia;
 implicit-dest; max-recipients; max-size; news-moderation; no-subject;
 digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/CEA62FNQ4677O33MBXWJUGCGQVYQ2ERB/>
Archived-At: 
 <https://lore.freedesktop.org/20260103045934.64521-4-ttabi@nvidia.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

The Turing/GA100 version of Booter is slightly different from the
GA102+ version.  The headers are the same, but different fields of
the headers are used to identify the IMEM section.  In addition,
there is an NMEM section on Turing/GA100.

Signed-off-by: Timur Tabi <ttabi@nvidia.com>
Reviewed-by: John Hubbard <jhubbard@nvidia.com>
---
 drivers/gpu/nova-core/firmware/booter.rs | 28 ++++++++++++++++++++----
 1 file changed, 24 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/nova-core/firmware/booter.rs b/drivers/gpu/nova-core/firmware/booter.rs
index 1b98bb47424c..86556cee8e67 100644
--- a/drivers/gpu/nova-core/firmware/booter.rs
+++ b/drivers/gpu/nova-core/firmware/booter.rs
@@ -356,14 +356,30 @@ pub(crate) fn new(
             }
         };
 
+        // There are two versions of Booter, one for Turing/GA100, and another for
+        // GA102+.  The extraction of the IMEM sections differs between the two
+        // versions.  Unfortunately, the file names are the same, and the headers
+        // don't indicate the versions.  The only way to differentiate is by the Chipset.
+        let (imem_sec_dst_start, imem_ns_load_target) = if chipset <= Chipset::GA100 {
+            (
+                app0.offset,
+                Some(FalconLoadTarget {
+                    src_start: 0,
+                    dst_start: load_hdr.os_code_offset,
+                    len: load_hdr.os_code_size,
+                }),
+            )
+        } else {
+            (0, None)
+        };
+
         Ok(Self {
             imem_sec_load_target: FalconLoadTarget {
                 src_start: app0.offset,
-                dst_start: 0,
+                dst_start: imem_sec_dst_start,
                 len: app0.len,
             },
-            // Exists only in the booter image for Turing and GA100
-            imem_ns_load_target: None,
+            imem_ns_load_target,
             dmem_load_target: FalconLoadTarget {
                 src_start: load_hdr.os_data_offset,
                 dst_start: 0,
@@ -393,7 +409,11 @@ fn brom_params(&self) -> FalconBromParams {
     }
 
     fn boot_addr(&self) -> u32 {
-        self.imem_sec_load_target.src_start
+        if let Some(ns_target) = &self.imem_ns_load_target {
+            ns_target.dst_start
+        } else {
+            self.imem_sec_load_target.src_start
+        }
     }
 }
 
-- 
2.51.0

