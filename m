Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A6CE5CFFFC6
	for <lists+nouveau@lfdr.de>; Wed, 07 Jan 2026 21:20:22 +0100 (CET)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 247F910E654;
	Wed,  7 Jan 2026 20:20:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="r4gWM4yS";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 1AC4744CA6;
	Wed,  7 Jan 2026 20:12:05 +0000 (UTC)
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1767816725;
 b=zsn3rxqiTzzYqFoj0NItoD/1cMC4osaCKhlMBDqt92THZWw59y38CASseOH7GarQfe+fI
 BcfXi36hzJcNrr7YLYIaKAGhfPe4+CLECq4wVvim4Lml8W2M+MHJw0E+BnhaUZES3clqeSd
 yc234x833Kzd67CDvPW5W/YfTBusaiqb/6GVEizcw2C6dSXUZssxQWcBNt3p/C3IF2mQAEP
 wiKjD9E/OpO9xjI7cpMqkXjAFTskr5OWM4yV1SHB9iUJu2lns7IblRQrG8J+6cQxuJLVP+I
 ohslgJD+RK19IrtK87ki3erpGSckRfST7aOQ8rkCApHvBUeJ8h79P65qp4Sg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1767816725; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=YQP5JZifAsCOlylAvGu++Q5VLeGlFwy3MqW5QbWmFSE=;
 b=UXFie6uRH3NpBlTnEUy8203FGkYnkSrkUPU2Qud82Br8WvGfcsD3GzIHN+iQM6gfnttmf
 ovqFz6KZecu1Qe1ksCrdzQ8xh382udpraXWjikBB5wpFmewWMBjrDAKz8RbaHKsrtSt7c0r
 JTLr43OMgby01vYA7dbqFzGuiZ1+0S+5i2joi7BvZAehDyK8ihnT5mlT8LeZdhraOItR1s9
 2t6S5E/bYB5QgpdX5ateAKWyJNmq41SW4mYwx7ZxY4Uf2C2VpxZYyibMDS365YOGJZzBghX
 /Jzp+Iua1ltjM9BM6K4W1UgppLlWyy0Tefz6CU6lyEmLsj30DwF5i02tfrbw==
ARC-Authentication-Results: i=2; mail.freedesktop.org;
 dkim=pass header.d=Nvidia.com;
  arc=pass;
  dmarc=pass (Used From Domain Record) header.from=nvidia.com
 policy.dmarc=reject
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=Nvidia.com;
 arc=pass;
 dmarc=pass (Used From Domain Record) header.from=nvidia.com policy.dmarc=reject
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id 555FE44C65
	for <nouveau@lists.freedesktop.org>; Wed,  7 Jan 2026 20:12:02 +0000 (UTC)
Received: from CH1PR05CU001.outbound.protection.outlook.com
 (mail-northcentralusazon11010070.outbound.protection.outlook.com
 [52.101.193.70])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 1F9A310E086
	for <nouveau@lists.freedesktop.org>; Wed,  7 Jan 2026 20:20:18 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=F+XT06YvvmNz2/qj4fV95UW14QvRJNAtzhPIJQAMy6+KW23PV/0iE7LIyWYmqHUY6fd2CCwnOjSHta0Wufd10CupjJeScNaUB7NgIyTZJKqPdmMfVrlK4/mowws4/aQ4BK/nQE26V49ZPGsRBY15QKVz6YqW/JJxJD54uNvXBsm9CPwIhFw+Xs5M1L8nPIDyu598jOFjQK4dzqoNdZSXGTG6fNC5u3Uck2oJhkypqjrmbB25av5i4jeQDAWbU2agleudRXQV7HvNYyYFJ9wOoUnFuFAsrM9M8qeSWCgvEhk8IBDahkFY5x3xvqNds1SMeOrKpQe8GQ4Y60PBbs4AdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YQP5JZifAsCOlylAvGu++Q5VLeGlFwy3MqW5QbWmFSE=;
 b=fYX1ENZeY8ardrZCekIav9/B+zUNo67FbeKq/EdgwiKdbpHoLeJymmiDSVPABe3MUmOo/HlW8Qk/P6ZfEcFHZignmvpVPhhPKDOWJ0Ab99Dpu7LLOCKkQsYkxiRj0AzQRaJA3QJRmE9vERbU4hIPF6bnVj76xAjPI1A3g4aIE4rou04wBiGpSMqiz3frlHgUhbAiaq6kEj63B8KHcg4k4bivgOSBhFabx6ot1RsmXLN+rtUCyAC/VqF/V45PXx5pKbSQ6b192y2dD5jJ7UF7XifWFw78shvW9JSTmiBobBdjdGSgXDJdX9GPKvzPgP9gKhTCSgGpdnPUOydHBYZwiA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YQP5JZifAsCOlylAvGu++Q5VLeGlFwy3MqW5QbWmFSE=;
 b=r4gWM4ySCiuUCOqVjP+t/ZebPAq6bMDTA9HUyolZVyjxmoqoBNb0HcRT0t15gd/GstNTHrS1E/4wyQ1VFKwLygZki8Mp0Kpzwn6AcbfuzKpGzUpNzGI7iSOsOyIJUmOhBWEYTLiMXvV2dBpxxtr+PCAUeJ5RZSYBy++UwiL/j/Gl+E/GORUuq5YfokuNf2tHqSiAT9QKVi3C3NrvKDYXemxnyJ3HvVvmccgBK4j+332hT2qliU9/3I8Wdt2S5mdQZ/aCjlqh3VBs2FYFeNlGsLSrtOWNGbHQHGPxQUKO1vdp9tkec0xm2BhPd6m8tAv3gUDbNPtAj6xC4vleutcgbg==
Received: from BYAPR05CA0046.namprd05.prod.outlook.com (2603:10b6:a03:74::23)
 by IA1PR12MB9531.namprd12.prod.outlook.com (2603:10b6:208:596::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.2; Wed, 7 Jan
 2026 20:20:10 +0000
Received: from SJ1PEPF00002322.namprd03.prod.outlook.com
 (2603:10b6:a03:74:cafe::71) by BYAPR05CA0046.outlook.office365.com
 (2603:10b6:a03:74::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9499.2 via Frontend Transport; Wed, 7
 Jan 2026 20:20:10 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 SJ1PEPF00002322.mail.protection.outlook.com (10.167.242.84) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9499.1 via Frontend Transport; Wed, 7 Jan 2026 20:20:10 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 7 Jan
 2026 12:19:54 -0800
Received: from ttabi.nvidia.com (10.126.230.35) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 7 Jan
 2026 12:19:53 -0800
From: Timur Tabi <ttabi@nvidia.com>
To: Danilo Krummrich <dakr@kernel.org>, Alexandre Courbot
	<acourbot@nvidia.com>, Joel Fernandes <joelagnelf@nvidia.com>, John Hubbard
	<jhubbard@nvidia.com>, Miguel Ojeda <ojeda@kernel.org>,
	<nouveau@lists.freedesktop.org>, <rust-for-linux@vger.kernel.org>
Subject: [PATCH v2 2/2] gpu: nova-core: add missing newlines to several print
 strings
Date: Wed, 7 Jan 2026 14:16:47 -0600
Message-ID: <20260107201647.2490140-2-ttabi@nvidia.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260107201647.2490140-1-ttabi@nvidia.com>
References: <20260107201647.2490140-1-ttabi@nvidia.com>
MIME-Version: 1.0
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.126.230.35]
X-ClientProxiedBy: rnnvmail202.nvidia.com (10.129.68.7) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00002322:EE_|IA1PR12MB9531:EE_
X-MS-Office365-Filtering-Correlation-Id: 753e8f24-79b5-4072-e458-08de4e2a2818
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|36860700013|82310400026|1800799024|7142099003;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?TG/CLnKWPQHCvGWj64fBbrBbi5+ZZYDcAt2gv28v+mNFnBrjLLwDYOKO6dIO?=
 =?us-ascii?Q?hEt+9i6W6iOWCT7ffi7B/1JeoFqrzKapx0z14yfn4FQt8TdZmqKO+lC8PoM4?=
 =?us-ascii?Q?qjf+xdJNC8CpYo6vKme1q9y0oTpi39F0allu83p1w+T4GoekpdbCAnFCwxGt?=
 =?us-ascii?Q?DOjgL/CQu/slBpQHk+JcwI7zTz/h3oQaw1W/96c1bmw0l2jkxtR8FLa7fUwR?=
 =?us-ascii?Q?LecgLKHEqsA/SZtRAQT6QY8qNjdz2VWchIQetecJX+IkExMWcAq5X33WW9JI?=
 =?us-ascii?Q?55ufQD8Cf1+lqbXd/qeMiRbx5ISpKd3TNH2QZ0oq5sD/2BlaelORfqZYfxei?=
 =?us-ascii?Q?QpFgcCfop8ZR8DJ7Os7ydAC4FbolioEpq/xFeDEXNwWjmVak+D7KphfZRaBD?=
 =?us-ascii?Q?H+0gk/tPeOxgK8QmJtNnmLG1h/+SZU9LzN+6nHttAklNpcZu9gaCDszeirhZ?=
 =?us-ascii?Q?KU5VXrOOrPOVfDJPUGzj+P3i0wALPTzloI6fWsKJZphYzI3CBOa1cdCWejtA?=
 =?us-ascii?Q?cR1hbPrP7cHhHWvt2nrf1J2o7O3AHvQ1TuNO2jLW64slptRet0NIPNgxOFax?=
 =?us-ascii?Q?SrxuWf4Gp8yqS9XWzvskGXwCg5THhKktxxC07LT63ze/29yhb8gSNcD3Lgx8?=
 =?us-ascii?Q?DQZDHZjrqGxRew0yHx3GtdJSjNwdolGC2lQ7ShUhCiRQbxDGeV5Hx60v3D7v?=
 =?us-ascii?Q?hTnUADOtZjWS1iB2LKkIIu6Gn+3DjHpy2PZ/nantFueJx5G5wIY4kzB04rfV?=
 =?us-ascii?Q?OKSJ92cfQq2eJs1maCRbchzcyAB5jnnSXOr+n1eIl1iVHpc3m4f7C2GiTSlN?=
 =?us-ascii?Q?aA4vOa8ZHP3og32CxGhcokIqj3p1IFBdxczZAX454xzb3qnwzyieN0HZCZr+?=
 =?us-ascii?Q?n6GQjPa1riB557fiSOr7f9WXPX1csbKwACmg1soEmBCzeuDA533M258Ayvk4?=
 =?us-ascii?Q?OPleX3xQNo/s57VOXVN+HXahs09V3ZvzeWsys1MhJAr2/osza98hqajN0XXO?=
 =?us-ascii?Q?E4M/ZX5NxoQDQ/MjNyQsezTl9vKKnYRyzLwPGzlDhuxVRzmHVWg2FJLmlqrE?=
 =?us-ascii?Q?XwCtyEEeqbFINbLRyUuFqWMMYIM0pDGUcqXLzXkH2gS+A3RdvL3+LYBPhN7B?=
 =?us-ascii?Q?w2gAdEKcT6w/LMqgzktIWIMk09aIgaH735YP2bDQc66wGGwlXTkDuSj8MW5l?=
 =?us-ascii?Q?p8q7XfImqrb250XITvtYZJKRIC5prvF70iZ6r8WU444FEf8l8lLhXJADXWgl?=
 =?us-ascii?Q?8BtY9nFBwVoUtzdTXN1g/UfqfdCKDjnVFIaRpJ/naGXTP+gUkXCf5QAtEWR7?=
 =?us-ascii?Q?0MDF4gAssEPllLSWRakeR1LoSqnHfS44PGU0gxi7uMTKYeKzihewhB7UI64K?=
 =?us-ascii?Q?GgyMzCVoVsaL4CqncdhlmEgigtZVMzg9L+c9zafcPHCNy3ungubmzJ590/6X?=
 =?us-ascii?Q?1YSzjKYP7qTp5tmVeYQYYTL6KQUmktJEQcrcg1fKZi+Zy3RSvYhgaAhQZIxu?=
 =?us-ascii?Q?VRZ+vXYaR4hjqsnj8qbvOAwM4yHqC3xiLIzh3Qo/jt2VaDd8TrueuZdKOmyG?=
 =?us-ascii?Q?7ABPnYC/sm+b4ZsWug8=3D?=
X-Forefront-Antispam-Report: 
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(376014)(36860700013)(82310400026)(1800799024)(7142099003);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jan 2026 20:20:10.0106
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 753e8f24-79b5-4072-e458-08de4e2a2818
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SJ1PEPF00002322.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB9531
Message-ID-Hash: 4ORO4PNRFQKI5YQ6CCKWQYSCLWG6EMGL
X-Message-ID-Hash: 4ORO4PNRFQKI5YQ6CCKWQYSCLWG6EMGL
X-MailFrom: ttabi@nvidia.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation; nonmember-moderation; administrivia;
 implicit-dest; max-recipients; max-size; news-moderation; no-subject;
 digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/4ORO4PNRFQKI5YQ6CCKWQYSCLWG6EMGL/>
Archived-At: 
 <https://lore.freedesktop.org/20260107201647.2490140-2-ttabi@nvidia.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

Although the dev_xx!() macro calls do not technically require terminating
newlines for the format strings, they should be added anyway to maintain
consistency, both within Rust code and with the C versions.

Signed-off-by: Timur Tabi <ttabi@nvidia.com>
---
v2: added some more strings that were missed

 drivers/gpu/nova-core/falcon.rs           |  6 +++---
 drivers/gpu/nova-core/falcon/hal/ga102.rs |  4 ++--
 drivers/gpu/nova-core/fb.rs               |  2 +-
 drivers/gpu/nova-core/gpu.rs              |  2 +-
 drivers/gpu/nova-core/gsp/boot.rs         |  2 +-
 drivers/gpu/nova-core/gsp/cmdq.rs         |  2 +-
 drivers/gpu/nova-core/gsp/sequencer.rs    | 10 +++++-----
 drivers/gpu/nova-core/vbios.rs            |  2 +-
 8 files changed, 15 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/nova-core/falcon.rs b/drivers/gpu/nova-core/falcon.rs
index 6ae0490caffa..4e1da0b9cf4f 100644
--- a/drivers/gpu/nova-core/falcon.rs
+++ b/drivers/gpu/nova-core/falcon.rs
@@ -466,7 +466,7 @@ fn dma_wr<F: FalconFirmware<Target = E>>(
         if dma_start % DmaAddress::from(DMA_LEN) > 0 {
             dev_err!(
                 self.dev,
-                "DMA transfer start addresses must be a multiple of {}",
+                "DMA transfer start addresses must be a multiple of {}\n",
                 DMA_LEN
             );
             return Err(EINVAL);
@@ -489,11 +489,11 @@ fn dma_wr<F: FalconFirmware<Target = E>>(
             .and_then(|size| size.checked_add(load_offsets.src_start))
         {
             None => {
-                dev_err!(self.dev, "DMA transfer length overflow");
+                dev_err!(self.dev, "DMA transfer length overflow\n");
                 return Err(EOVERFLOW);
             }
             Some(upper_bound) if usize::from_safe_cast(upper_bound) > fw.size() => {
-                dev_err!(self.dev, "DMA transfer goes beyond range of DMA object");
+                dev_err!(self.dev, "DMA transfer goes beyond range of DMA object\n");
                 return Err(EINVAL);
             }
             Some(_) => (),
diff --git a/drivers/gpu/nova-core/falcon/hal/ga102.rs b/drivers/gpu/nova-core/falcon/hal/ga102.rs
index 69a7a95cac16..0bdfe45a2d03 100644
--- a/drivers/gpu/nova-core/falcon/hal/ga102.rs
+++ b/drivers/gpu/nova-core/falcon/hal/ga102.rs
@@ -52,7 +52,7 @@ fn signature_reg_fuse_version_ga102(
     let ucode_idx = match usize::from(ucode_id) {
         ucode_id @ 1..=regs::NV_FUSE_OPT_FPF_SIZE => ucode_id - 1,
         _ => {
-            dev_err!(dev, "invalid ucode id {:#x}", ucode_id);
+            dev_err!(dev, "invalid ucode id {:#x}\n", ucode_id);
             return Err(EINVAL);
         }
     };
@@ -66,7 +66,7 @@ fn signature_reg_fuse_version_ga102(
     } else if engine_id_mask & 0x0400 != 0 {
         regs::NV_FUSE_OPT_FPF_GSP_UCODE1_VERSION::read(bar, ucode_idx).data()
     } else {
-        dev_err!(dev, "unexpected engine_id_mask {:#x}", engine_id_mask);
+        dev_err!(dev, "unexpected engine_id_mask {:#x}\n", engine_id_mask);
         return Err(EINVAL);
     };
 
diff --git a/drivers/gpu/nova-core/fb.rs b/drivers/gpu/nova-core/fb.rs
index 3c9cf151786c..c62abcaed547 100644
--- a/drivers/gpu/nova-core/fb.rs
+++ b/drivers/gpu/nova-core/fb.rs
@@ -80,7 +80,7 @@ pub(crate) fn unregister(&self, bar: &Bar0) {
             let _ = hal.write_sysmem_flush_page(bar, 0).inspect_err(|e| {
                 dev_warn!(
                     &self.device,
-                    "failed to unregister sysmem flush page: {:?}",
+                    "failed to unregister sysmem flush page: {:?}\n",
                     e
                 )
             });
diff --git a/drivers/gpu/nova-core/gpu.rs b/drivers/gpu/nova-core/gpu.rs
index 50d76092fbdd..9b042ef1a308 100644
--- a/drivers/gpu/nova-core/gpu.rs
+++ b/drivers/gpu/nova-core/gpu.rs
@@ -268,7 +268,7 @@ pub(crate) fn new<'a>(
             // We must wait for GFW_BOOT completion before doing any significant setup on the GPU.
             _: {
                 gfw::wait_gfw_boot_completion(bar)
-                    .inspect_err(|_| dev_err!(pdev.as_ref(), "GFW boot did not complete"))?;
+                    .inspect_err(|_| dev_err!(pdev.as_ref(), "GFW boot did not complete\n"))?;
             },
 
             sysmem_flush: SysmemFlush::register(pdev.as_ref(), bar, spec.chipset)?,
diff --git a/drivers/gpu/nova-core/gsp/boot.rs b/drivers/gpu/nova-core/gsp/boot.rs
index a53d80620468..da21447be663 100644
--- a/drivers/gpu/nova-core/gsp/boot.rs
+++ b/drivers/gpu/nova-core/gsp/boot.rs
@@ -82,7 +82,7 @@ fn run_fwsec_frts(
         if frts_status != 0 {
             dev_err!(
                 dev,
-                "FWSEC-FRTS returned with error code {:#x}",
+                "FWSEC-FRTS returned with error code {:#x}\n",
                 frts_status
             );
 
diff --git a/drivers/gpu/nova-core/gsp/cmdq.rs b/drivers/gpu/nova-core/gsp/cmdq.rs
index 6f946d14868a..3c01fc6e6b6a 100644
--- a/drivers/gpu/nova-core/gsp/cmdq.rs
+++ b/drivers/gpu/nova-core/gsp/cmdq.rs
@@ -615,7 +615,7 @@ fn wait_for_msg(&self, timeout: Delta) -> Result<GspMessage<'_>> {
         {
             dev_err!(
                 self.dev,
-                "GSP RPC: receive: Call {} - bad checksum",
+                "GSP RPC: receive: Call {} - bad checksum\n",
                 header.sequence()
             );
             return Err(EIO);
diff --git a/drivers/gpu/nova-core/gsp/sequencer.rs b/drivers/gpu/nova-core/gsp/sequencer.rs
index d78a30fbb70f..d6c489c39092 100644
--- a/drivers/gpu/nova-core/gsp/sequencer.rs
+++ b/drivers/gpu/nova-core/gsp/sequencer.rs
@@ -121,7 +121,7 @@ pub(crate) fn new(data: &[u8], dev: &device::Device) -> Result<(Self, usize)> {
         };
 
         if data.len() < size {
-            dev_err!(dev, "Data is not enough for command");
+            dev_err!(dev, "Data is not enough for command\n");
             return Err(EINVAL);
         }
 
@@ -320,7 +320,7 @@ fn next(&mut self) -> Option<Self::Item> {
 
         cmd_result.map_or_else(
             |_err| {
-                dev_err!(self.dev, "Error parsing command at offset {}", offset);
+                dev_err!(self.dev, "Error parsing command at offset {}\n", offset);
                 None
             },
             |(cmd, size)| {
@@ -382,7 +382,7 @@ pub(crate) fn run(cmdq: &mut Cmdq, params: GspSequencerParams<'a>) -> Result {
             dev: params.dev,
         };
 
-        dev_dbg!(sequencer.dev, "Running CPU Sequencer commands");
+        dev_dbg!(sequencer.dev, "Running CPU Sequencer commands\n");
 
         for cmd_result in sequencer.iter() {
             match cmd_result {
@@ -390,7 +390,7 @@ pub(crate) fn run(cmdq: &mut Cmdq, params: GspSequencerParams<'a>) -> Result {
                 Err(e) => {
                     dev_err!(
                         sequencer.dev,
-                        "Error running command at index {}",
+                        "Error running command at index {}\n",
                         sequencer.seq_info.cmd_index
                     );
                     return Err(e);
@@ -400,7 +400,7 @@ pub(crate) fn run(cmdq: &mut Cmdq, params: GspSequencerParams<'a>) -> Result {
 
         dev_dbg!(
             sequencer.dev,
-            "CPU Sequencer commands completed successfully"
+            "CPU Sequencer commands completed successfully\n"
         );
         Ok(())
     }
diff --git a/drivers/gpu/nova-core/vbios.rs b/drivers/gpu/nova-core/vbios.rs
index 7c26e4a2d61c..e4eae9385f47 100644
--- a/drivers/gpu/nova-core/vbios.rs
+++ b/drivers/gpu/nova-core/vbios.rs
@@ -790,7 +790,7 @@ fn falcon_data_ptr(&self) -> Result<u32> {
         // read the 4 bytes at the offset specified in the token
         let offset = usize::from(token.data_offset);
         let bytes: [u8; 4] = self.base.data[offset..offset + 4].try_into().map_err(|_| {
-            dev_err!(self.base.dev, "Failed to convert data slice to array");
+            dev_err!(self.base.dev, "Failed to convert data slice to array\n");
             EINVAL
         })?;
 
-- 
2.52.0

