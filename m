Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A8F9DCCC58F
	for <lists+nouveau@lfdr.de>; Thu, 18 Dec 2025 15:54:12 +0100 (CET)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 6F00910EA3C;
	Thu, 18 Dec 2025 14:54:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="PL5H+FjJ";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 836A644B91;
	Thu, 18 Dec 2025 14:46:40 +0000 (UTC)
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1766069200;
 b=zY092FQ+54QpHJ6vjHfRYf8/lHGek6Q2LN9HVq1KUlGHP8eHNS1nN1HGjGDpk9jcdRsBc
 GWoJxw/w4G1uztUXYzux+rdXh/cLpVqjoqBeySb2r+bL+eTuK4JdbKzDxlzFwixt4CCGw1c
 anTsB4htUdqtiXR5rHm6Jg0ve7xpaJ/RQVySN0zXdFHsMbyZcoARb1jDpss/YmZEJsSh4PP
 N8XhiMDcOPP5y2PYdvdukobXsJFTrwNgYDcinq9vMyNeXNcXcJ4KX9eStbti11D559IJz7T
 5CnyrwuquN4MhFxfof2JMUsCU46lUKtHjzMK0bJxIeVOiwVKa+vmOn9wWPQQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1766069200; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=TOWu29hdg+y1/Q3vbW06H3sJqkL4kWVCoj7D4Rlraxg=;
 b=wWOWPBtnEpaRL2sjxGH4ba9wpIqIvJNCsc9oymDeTN+rhTb7bo5PRvBAl88OdufCt8ohK
 eJCbhhDXoPJIErymHc9oPxXLI30dn0o0Zp+4/xS7Z94vl1TYspfnY7cg6zRuOyCJYE+TKFd
 9mTyobe83LpKZRg9YEEhIRRzX+BuGrZ34Bt27DkbIssc80QmORZkVDSKnVtjcF8ZFuSZNOa
 +JImjvRdHxChR0vZzmnJLYe2Ea5Kn0B0YkBk9Ngsv3xai65HJ1AMhOi6bghENI3q49NK8w9
 rFzwcpE7OcCkeBCQDSPL6C7JY5s0AY022rDvZzx+EmgxZpWmoxT7IgKlzCeA==
ARC-Authentication-Results: i=2; mail.freedesktop.org;
 dkim=pass header.d=Nvidia.com;
  arc=pass;
  dmarc=pass (Used From Domain Record) header.from=nvidia.com
 policy.dmarc=reject
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=Nvidia.com;
 arc=pass;
 dmarc=pass (Used From Domain Record) header.from=nvidia.com policy.dmarc=reject
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id 6B1684564B
	for <nouveau@lists.freedesktop.org>; Thu, 18 Dec 2025 01:32:21 +0000 (UTC)
Received: from BL0PR03CU003.outbound.protection.outlook.com
 (mail-eastusazon11012014.outbound.protection.outlook.com [52.101.53.14])
	by gabe.freedesktop.org (Postfix) with ESMTPS id CF72A10E414
	for <nouveau@lists.freedesktop.org>; Thu, 18 Dec 2025 01:39:50 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aJlYlMi1pBje9b+xrW1Kv7XrsLwYsou9wwpPdfvJGBIGMglhWm7rR4/Owa7ZGFdxNZ85+DhRSqGtGoql/CBwx+UXHtKpaU1DvXGyukp5ip1RHRNbi7LrzXtyuKrQgP3PW8Oj8FwLovgaEV6EY5KiAED5qS+Doufm/vyFAXt2LuE/Orm3fKCHMC6TlXqk15rLaImdQIAQ7jbFYnnuJgnKvlva4hTjyFUIpqExQeuvCw9sLi1bxyghnbmaaYKa3Z7cKBGtoV7F6RgExRjZADfSqins2P7HaVrRFeNADI6zhisiWARexFiU698Wl6PJhd3ATf0Jm2OXMqWs92vcVF3GJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TOWu29hdg+y1/Q3vbW06H3sJqkL4kWVCoj7D4Rlraxg=;
 b=DuWYkWFUJoNphgf59NzqjL8bZSWUyvV4lmK9zG9ypIY6ANFzfBBTchn04odspqiLSFtAw9Mgi8UAJpeqHsClTvn+lnVwKm2q8cR8Dt+PL2P6EcFmZVs3KCYo4gOD6m63wLJhBbodUHNl/0V/qHCmg1wKofaSS8z+cprPpjUhaLubtItYNuZFJB86hQ9joAKV8dEOu2GK+qs48lnrX2LLuUtsaB5ytOn0DXzh3SS3QI/gv7sRFsrD9+pcrxfJbfPblSMgK7K1xEpctNDqUaugsqPkmEBVCnG3IA57CAnEm3ZLsozHnV0L0pLhMkzHorvtHEBYdpitjUxI+YY2VBKItQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=garyguo.net smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TOWu29hdg+y1/Q3vbW06H3sJqkL4kWVCoj7D4Rlraxg=;
 b=PL5H+FjJKbuDGsr9liANYtAA7FdsGwU1XzaA6npEonUUtNOy6qXvgtibYtY6uphSRgRxtTjNnCXamcY2yQNuuSLpdb57eu4UPOfr15b6SLNLL0mbl1MYmIHAflM+c8w5O8IKhzxssEiPD4NDaqpRaGpqPOI/AtV/8hr+FS256PZ23ZcpSj2yBWNsY7/SJMTV4aNHG4sJZvO1veS82WZjLjSkiVOyJmO5W7BWxypFiAQNQztUw8o5iPeVqSA7IUdkKxoPFzh7lvZ26U1LocEPxPRVyzKIpyDO9YyMEP5Z9TrEw/Vn3N5QSi1/+BMuiFEBKgxlp/Q+82kRh+fDlDmXfQ==
Received: from BN0PR04CA0117.namprd04.prod.outlook.com (2603:10b6:408:ec::32)
 by SJ5PPF75EAF8F39.namprd12.prod.outlook.com (2603:10b6:a0f:fc02::999) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.6; Thu, 18 Dec
 2025 01:39:45 +0000
Received: from BN1PEPF00005FFF.namprd05.prod.outlook.com
 (2603:10b6:408:ec:cafe::98) by BN0PR04CA0117.outlook.office365.com
 (2603:10b6:408:ec::32) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9434.7 via Frontend Transport; Thu,
 18 Dec 2025 01:39:34 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 BN1PEPF00005FFF.mail.protection.outlook.com (10.167.243.231) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9434.6 via Frontend Transport; Thu, 18 Dec 2025 01:39:44 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 17 Dec
 2025 17:39:28 -0800
Received: from ttabi.nvidia.com (10.126.231.35) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 17 Dec
 2025 17:39:26 -0800
From: Timur Tabi <ttabi@nvidia.com>
To: Gary Guo <gary@garyguo.net>, Danilo Krummrich <dakr@kernel.org>,
	<rust-for-linux@vger.kernel.org>, John Hubbard <jhubbard@nvidia.com>, "Joel
 Fernandes" <joelagnelf@nvidia.com>, Alexandre Courbot <acourbot@nvidia.com>,
	Lyude Paul <lyude@redhat.com>, <nouveau@lists.freedesktop.org>
Subject: [PATCH v3 9/9] gpu: nova-core: create GSP-RM logging buffers debugfs
 entries
Date: Wed, 17 Dec 2025 19:39:10 -0600
Message-ID: <20251218013910.459045-10-ttabi@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: BN1PEPF00005FFF:EE_|SJ5PPF75EAF8F39:EE_
X-MS-Office365-Filtering-Correlation-Id: 98248abd-3c00-4497-d7dd-08de3dd6526d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|36860700013|1800799024|82310400026;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?hDpl66Rj88XDIt+Q0rXmkaqjODB3K2qHPX3Jjx/7iUglk5zv/n/6LVw7UXmL?=
 =?us-ascii?Q?jHoOIBNGj4WgNynwXDvgIo9zfB6t+fozD0qd8OzzpTSG6aFitinYt2Namv8E?=
 =?us-ascii?Q?gddPRsJPr5FL803QpZ1v8FcoPxyiK6sJDUhmqgtadrAa5Fwz5tENROm99H5l?=
 =?us-ascii?Q?XHrc/ojADthI1T5XoNCNfjZSiHkKlCvBuvBIUqlMb1hgROsyR1VsUzPI93I/?=
 =?us-ascii?Q?XSTu/yOhLVKUnw8zzYIZOasZACmZN0X8oP2HqjXS5TPwv880aJUSNiP07zPE?=
 =?us-ascii?Q?/IDVXG+wI+aNEGuHJMqsz3F6Mdm28zwbv+Y+724V+9ya+RL+5QeWDxa9Im3y?=
 =?us-ascii?Q?u9m1AnXnsZyrUwje8H/DOIW0PCto3dePVngjghsaq+NVpoMR6jN2oVrcrP43?=
 =?us-ascii?Q?JOzSAE1WEHFE9PsQGyIXjuh1tKJ9c//azaFD3CPVVZmAHr+n57fQWqZs5Ud4?=
 =?us-ascii?Q?/DtKcrzClsJl6POPIymT+fFdvLUX3gbEPyhEY+ccWFbcevO+Sh64DHEspxU8?=
 =?us-ascii?Q?rUeg1b1AiCWTBat0kYUGgV/r6nBzyhPMAVsK+Ko9kP+kKItSOtZC3pVPEMq+?=
 =?us-ascii?Q?e4xxUN9nzBB/F6srd3A1+MWGRXMyBYeW4daHzz/GkoMA2meKjOBaBJZtu/e5?=
 =?us-ascii?Q?2bxAQT/na+eMlzLXlZWd0Bd5B61skrbkzo9Np1VQCdBb6ppu18MG0UsppWwb?=
 =?us-ascii?Q?29jmDazFfe+hhEb/6CGAek/g2iAOmog3Bb8pTZIlzV1NGSFrZFO6Jm0gfdUy?=
 =?us-ascii?Q?yNXhS4Vc5HC+/dmyhBhxGOWn3oTcqxR1f9PFUD9fPKzDO4LgPqyKzqexR4n8?=
 =?us-ascii?Q?rdCjTSVHIhJwtr38Wj1FM9FpqfdZqwNi65wyb/iQBbCq2wnGWrnNV8vj/TG1?=
 =?us-ascii?Q?RbaSfbm5b3LaPrXcD/ijF8wyIk/B2MGS5dzE152YVikXw/WB7pwEuMQ1yGVI?=
 =?us-ascii?Q?oNk+73eoTqaKjPbbwekfRsJM2vsLLl8jSL+IM0z8CGm8DEh58rSSR1hTqIjs?=
 =?us-ascii?Q?/q3acWRaEIEuL4tqV8LKd5X2HqLHLQ24oTFa24zSyWzaEjIq37pTRKMx+ztS?=
 =?us-ascii?Q?HRwZgd8xi3pZZQyz3xd78Uh0Z7bN1ONzefwppnXzp7bsM9d4ZdMwbdZRXGWL?=
 =?us-ascii?Q?AtBAHXVaCqKkRgI6sERGaly1j3QrMCvOd4G5Bz2l0pxpxN9r97OKGniWpxn7?=
 =?us-ascii?Q?pl6eKeWj4xM5sbiq4crFbSI230DyUusfKtRaBkpEJMH7+vwMQ5OOlsp4KlZG?=
 =?us-ascii?Q?tf7ha8SSzNO8JeAi/opInnocvLbQNXX5E9wfvfOgX4HC4AKYMtkFEmj1L0zN?=
 =?us-ascii?Q?UeFjleuA/Z6s+ACT8tK2Pj4jvu0tb5bPJtC9jA0JcC7uzNO1CFJ0uNj1Q29y?=
 =?us-ascii?Q?88K/4hw8AB4RZq0ac2F6XLepbNv3pRlXuiOVmPydkBLou/2FXAEQ9qD+ZQpS?=
 =?us-ascii?Q?qT4MqR2Tcise1qyzfkv2xRKEp4Yq7WevWCYE1MozTIV2pcSm77ytR23lbQUN?=
 =?us-ascii?Q?BFu25+IdT3L82SheC8tHREWTfNgSdXpXLWyWd2w7OnoKTVPf84gpO4GOrTG8?=
 =?us-ascii?Q?6PLQiyvEISmbOkc6FA0=3D?=
X-Forefront-Antispam-Report: 
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(376014)(36860700013)(1800799024)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Dec 2025 01:39:44.6643
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 98248abd-3c00-4497-d7dd-08de3dd6526d
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BN1PEPF00005FFF.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPF75EAF8F39
X-MailFrom: ttabi@nvidia.com
X-Mailman-Rule-Hits: implicit-dest
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation; nonmember-moderation; administrivia;
 max-recipients; max-size; news-moderation; no-subject; digests;
 suspicious-header
Message-ID-Hash: 7SRCXWZN5KONUSWBEHVLEM4INWAZFXYH
X-Message-ID-Hash: 7SRCXWZN5KONUSWBEHVLEM4INWAZFXYH
X-Mailman-Approved-At: Thu, 18 Dec 2025 14:46:30 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/7SRCXWZN5KONUSWBEHVLEM4INWAZFXYH/>
Archived-At: 
 <https://lore.freedesktop.org/20251218013910.459045-10-ttabi@nvidia.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

Create read-only debugfs entries for LOGINIT, LOGRM, and LOGINTR, which
are the three primary printf logging buffers from GSP-RM.  LOGPMU will
be added at a later date, as it requires it support for its RPC message
first.

This patch uses the `pin_init_scope` feature to create the entries.
`pin_init_scope` solves the lifetime issue over the `DEBUGFS_ROOT`
reference by delaying its acquisition until the time the entry is
actually initialized.

Co-developed-by: Alexandre Courbot <acourbot@nvidia.com>
Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
Signed-off-by: Timur Tabi <ttabi@nvidia.com>
---
 drivers/gpu/nova-core/gsp.rs | 42 +++++++++++++++++++++++++++++-------
 1 file changed, 34 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/nova-core/gsp.rs b/drivers/gpu/nova-core/gsp.rs
index 860674dac31e..409ff80f55e6 100644
--- a/drivers/gpu/nova-core/gsp.rs
+++ b/drivers/gpu/nova-core/gsp.rs
@@ -3,6 +3,7 @@
 mod boot;
 
 use kernel::{
+    c_str,
     debugfs,
     device,
     dma::{
@@ -101,17 +102,24 @@ fn new(dev: &device::Device<device::Bound>) -> Result<Self> {
     }
 }
 
-/// GSP runtime data.
-#[pin_data]
-pub(crate) struct Gsp {
-    /// Libos arguments.
-    pub(crate) libos: CoherentAllocation<LibosMemoryRegionInitArgument>,
+/// Log buffers used by GSP-RM for debug logging.
+struct LogBuffers {
     /// Init log buffer.
     loginit: LogBuffer,
     /// Interrupts log buffer.
     logintr: LogBuffer,
     /// RM log buffer.
     logrm: LogBuffer,
+}
+
+/// GSP runtime data.
+#[pin_data]
+pub(crate) struct Gsp {
+    /// Libos arguments.
+    pub(crate) libos: CoherentAllocation<LibosMemoryRegionInitArgument>,
+    /// Log buffers, optionally exposed via debugfs.
+    #[pin]
+    logs: debugfs::Scope<LogBuffers>,
     /// Command queue.
     pub(crate) cmdq: Cmdq,
     /// RM arguments.
@@ -143,7 +151,9 @@ unsafe impl Sync for LogBuffer {}
 
 impl Gsp {
     // Creates an in-place initializer for a `Gsp` manager for `pdev`.
-    pub(crate) fn new(pdev: &pci::Device<device::Bound>) -> Result<impl PinInit<Self, Error>> {
+    pub(crate) fn new<'a>(
+        pdev: &'a pci::Device<device::Bound>,
+    ) -> Result<impl PinInit<Self, Error> + 'a> {
         let dev = pdev.as_ref();
         let libos = CoherentAllocation::<LibosMemoryRegionInitArgument>::alloc_coherent(
             dev,
@@ -173,11 +183,27 @@ pub(crate) fn new(pdev: &pci::Device<device::Bound>) -> Result<impl PinInit<Self
         dma_write!(rmargs[0] = fw::GspArgumentsCached::new(&cmdq))?;
         dma_write!(libos[3] = LibosMemoryRegionInitArgument::new("RMARGS", &rmargs))?;
 
-        Ok(try_pin_init!(Self {
-            libos,
+        let log_buffers = LogBuffers {
             loginit,
             logintr,
             logrm,
+        };
+
+        // Look up nova_core debugfs directory - only create entries if it exists.
+        // If nova_core doesn't exist, debugfs_dir will be empty and file creation
+        // becomes a no-op (data is still stored, just not exposed via debugfs).
+        let debugfs_dir = debugfs::Dir::lookup(c_str!("nova_core"), None)
+            .unwrap_or_else(debugfs::Dir::empty);
+
+        let logs = debugfs_dir.scope(log_buffers, pdev.name(), |logs, dir| {
+            dir.read_binary_file(c_str!("loginit"), &logs.loginit);
+            dir.read_binary_file(c_str!("logintr"), &logs.logintr);
+            dir.read_binary_file(c_str!("logrm"), &logs.logrm);
+        });
+
+        Ok(try_pin_init!(Self {
+            libos,
+            logs <- logs,
             rmargs,
             cmdq,
         }))
-- 
2.52.0

