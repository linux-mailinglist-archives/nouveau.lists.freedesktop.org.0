Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 19BD7CFB959
	for <lists+nouveau@lfdr.de>; Wed, 07 Jan 2026 02:24:51 +0100 (CET)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 30CA910E55F;
	Wed,  7 Jan 2026 01:24:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="tiIquXJ4";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id CCF5044C9D;
	Wed,  7 Jan 2026 01:16:34 +0000 (UTC)
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1767748594;
 b=HasvbtMI/aru0DyyNrjLBHKyQFBHDgS1oaApeQxsuLx5yygvW0gkO1EmPWIxIcEXPZFUO
 6lR0FdENauu8XLv0OprGvLcOUtxEnYQA3evaXs8MFnbvQjSVP7QMjfs4he4xBYfaynJWSke
 w5oXpX4xqiU/nE7/EnrkzEK+mwQ8PFOv5Bd6pjvD7OtHPSN/o0eRkXD+YKOLOuX/1r5ZH11
 uw60WW3fgA3NsxisMOs3xORvvI2alRM4E3QNhXVw5TkXTzRycS9OhQwc/5LZz/jzKrOByN5
 Lg9m+CwvXVMtBiqyHwBqCv5qqnXthGRvSaEcKc3u7rhSzswq7I8MC6EAs/mA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1767748594; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=n3Gj9Cn8r0nNvl+oD3dgM66b97vGHcw5eOrw6qCezgs=;
 b=F/ac8yTRWpw1qslERkXqwYUIb++uN8AT24qG7H4wf0Ej+UWahqFxdp1oqgK+5G5AY2EUf
 UhxLRwLWk5I4vWaIpSQQzZYd3Cv6XIgqKSFAa2ymZuNDqiytxjYt2lUZWSg9o0vgOpCkXPd
 MhFKkaK207qKnSu/ioHnb/x4O2G4LfhA7KdO20UuE0QkYn/HzOVf7PY/ZSooH2oMMLH3cpQ
 D+N4l86JOV32s/exWwCZHiZvxJo6lqR+TDOcswYcVC7OZrZC3Nzd3aXABBuobK5Kg9MwDt9
 bU4hA1V1KzgXGpbBz0A5iRrhvXXPrWBvoCKNKQX+YNroZqmwkJ2POIRRWTXQ==
ARC-Authentication-Results: i=2; mail.freedesktop.org;
 dkim=pass header.d=Nvidia.com;
  arc=pass;
  dmarc=pass (Used From Domain Record) header.from=nvidia.com
 policy.dmarc=reject
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=Nvidia.com;
 arc=pass;
 dmarc=pass (Used From Domain Record) header.from=nvidia.com policy.dmarc=reject
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id BAF2144BB6
	for <nouveau@lists.freedesktop.org>; Wed,  7 Jan 2026 01:16:31 +0000 (UTC)
Received: from BL0PR03CU003.outbound.protection.outlook.com
 (mail-eastusazon11012037.outbound.protection.outlook.com [52.101.53.37])
	by gabe.freedesktop.org (Postfix) with ESMTPS id BBD9710E04D
	for <nouveau@lists.freedesktop.org>; Wed,  7 Jan 2026 01:24:45 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZW0YKKSCfmmaZ2Yi+zxFBrBnv4cniHV9/1ecyHNehs1RrKj3BUAlabNNRKCaIMrMZKYfUZ0gHN4zvCcnvJCzmHXSOZLTJkLjaIb9yTOJQeraSMIzhGh1OuTJhdx7Aa1bbIyFPwjp015G2SLsBBuIRUkYGjJpOnhCVm+3FVClUx9Uqidq7TegAUSYu0v7Wo7xLCxIw7+jSSYLZueanRCv7jw0ezNljmoDvzO09vxIBWjQr4HN6SystIKqcEYHVyhWk0Z8G/a/PVXLDf5e+Umlhh5JYJY+WhyAauiCRdb0+HPd2A+mQ3TbPW8tthD1HM1tcrWSggkNWF2embU/9KuPqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=n3Gj9Cn8r0nNvl+oD3dgM66b97vGHcw5eOrw6qCezgs=;
 b=gzZfxBarbiR8g+Pl9cb4Ztmm8rBzh0E/2MDL1x+x314+3H49OkXBbiGvWUZm5+O0fCgKN66q81bfcnga/nfFh7sQUL0g2F9fjzyBoWSDxrzwPqYQAR887Fm2ueEqTj/RLzBDI/Jez6BQmharPY8VNSXu3J63FGyjugmAeiK2AfX3t1mkyBUaHGLH5fT1FIryMhPeYOeObqz8dHdD6TorpgQOefqIxMwC7a/zIXTr22VPWGEKRMhOlZU33vLOfYelU95MIZJJXo9JhFcf+XzSXZAwltbkTEJcz3S2uL/UhEB3elojPebh4g6QpWdHvj15o7sDIZkUxH6xIFv5r5JejQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=n3Gj9Cn8r0nNvl+oD3dgM66b97vGHcw5eOrw6qCezgs=;
 b=tiIquXJ49EyT15btfPXZ3xzW1grSOLyf6S2l1+7gXh0xcrySVs/g19D7OGN30HQyDhBtcN1k2Sc3h9BmgOMSYjUyAFoXn9drsaRNWJsbCbI9wNbbtNXt7mRwC7+5Ny3sjSz/w4EMueYsaQVuHgG/dn/v8LCAjje+773Hs3oFApwJLlSHPDHBfNNOwCFR87PCgUfTFfAeP8Algodu1UZLVnHJJO3DX9PwrvtfcfCym3ExBzslceWpxxUCL3XlTME7FhxdU1kJfR7ZWM5/UyXTe5rO0XejTynOD0xD3ZvCkzJQEk14LGCMttph7tinvrr5DeRTydbQQ/CTN7i7PLZ3vg==
Received: from BN9PR03CA0475.namprd03.prod.outlook.com (2603:10b6:408:139::30)
 by SA5PPF7F0CA3746.namprd12.prod.outlook.com (2603:10b6:80f:fc04::8d1) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9478.4; Wed, 7 Jan
 2026 01:24:38 +0000
Received: from BN2PEPF000044A7.namprd04.prod.outlook.com
 (2603:10b6:408:139:cafe::e8) by BN9PR03CA0475.outlook.office365.com
 (2603:10b6:408:139::30) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9499.2 via Frontend Transport; Wed, 7
 Jan 2026 01:24:36 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 BN2PEPF000044A7.mail.protection.outlook.com (10.167.243.101) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9499.1 via Frontend Transport; Wed, 7 Jan 2026 01:24:38 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 6 Jan
 2026 17:24:22 -0800
Received: from ttabi.nvidia.com (10.126.231.35) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 6 Jan
 2026 17:24:21 -0800
From: Timur Tabi <ttabi@nvidia.com>
To: Danilo Krummrich <dakr@kernel.org>, Alexandre Courbot
	<acourbot@nvidia.com>, Joel Fernandes <joelagnelf@nvidia.com>, John Hubbard
	<jhubbard@nvidia.com>, <nouveau@lists.freedesktop.org>,
	<rust-for-linux@vger.kernel.org>
Subject: [PATCH 1/2] gpu: nova-core: check for overflow to DMATRFBASE1
Date: Tue, 6 Jan 2026 19:24:13 -0600
Message-ID: <20260107012414.2429246-1-ttabi@nvidia.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.126.231.35]
X-ClientProxiedBy: rnnvmail202.nvidia.com (10.129.68.7) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF000044A7:EE_|SA5PPF7F0CA3746:EE_
X-MS-Office365-Filtering-Correlation-Id: 4b8e6173-eba0-4589-64d7-08de4d8b865e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|82310400026|376014|36860700013;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?wSp0B2RHzxSiToBoutBv3DHonEOIBp2xAl6tod8HOGP2Zi/793gfdRcXcKql?=
 =?us-ascii?Q?yb25PV99SSd177c3Bbaw7njAQtOxjwMgStQvlQ1D+AkLC+JbFwU5kb3LaoqR?=
 =?us-ascii?Q?rzha0PuOnK1tWf8E2zsUkeFxhQjS/V+hYlSdCC4HMuSXEnWq3KIF+/x1B8/U?=
 =?us-ascii?Q?JWZ5bkg9xaF/adqFOg7xuPBjYmSSnay5fXG+zfJMDQNdK5FiJL79xY1gLZIA?=
 =?us-ascii?Q?4nmK7ub7m/Xf2cZscun69SAT0u/9lPPH3PcGW7gLM65u9n5y7eMUnqimDb+2?=
 =?us-ascii?Q?U1Q8qNijlml/Yd0orq8pl4D85PXY0mNwJCbkOlCnwEG88JzadyN9rPGcSIUv?=
 =?us-ascii?Q?8NDk5k0LAz+YyiGEkRRf0tq6CI1zh+BagPFyxefjHAhVpiRlhSjjgJ3r5YNz?=
 =?us-ascii?Q?RkYF9Cxs6fFWyNb/R8OUew2ZBTjzm74xSLc04xvmxFY0w2ULKhxvKKPnr+y8?=
 =?us-ascii?Q?L3SYuQoF4QmrSDBgPK8Nxfwy9cCNmxQ9Kf6PKO06u/5edyVkeJQR8t1Ap9b8?=
 =?us-ascii?Q?nmIsnQVtZfhfECmjRoWMrQMWTcemW05xFfNCBeeJh2T/4lojOgTjx4JsF+Lg?=
 =?us-ascii?Q?cbb58K46CIaE6ep2j4XZSgkWLnQtRMD2TsE/7n9xKAa3YYvjRqvsUI+9KpSn?=
 =?us-ascii?Q?C7tt8lJ2cuaBhMl21k2vsrro7tVzFPJHl7v5nBxQrmYIqYR5CrjiIgXjSvQa?=
 =?us-ascii?Q?z6SdlcYtZ0tu3r1Pnn/QaeiwEdHB6OCF8wBJIH74mkJKETibbNycbE7w9GT9?=
 =?us-ascii?Q?44Ef875ayWu4py5SkUhKTsqDoyNCsXN0vLX2cNlqJWFEMdJ5ff6RL3xyxkBJ?=
 =?us-ascii?Q?DYmS09HfGqVIXUTREQoDBBYV/ZrecKrCdATiSxhI38ZtnFnUj/pediLapYtr?=
 =?us-ascii?Q?QG6QyJJtwC+Irisi5/dm4z4RAO6Z6zSOFqLRaLKOROiQxGspCNyWML4a2isc?=
 =?us-ascii?Q?dwHFjxUl9bXEnNUWmALEZ58QhntPTW13babl2Pa7zvF7ZvZVXka9fKG3tPRO?=
 =?us-ascii?Q?R0RFCHMLprEShwsCRGfqMJOeQwgH8KK5wxPBv+7cZ8x6gUmoMGnCIFGmqytY?=
 =?us-ascii?Q?eyQG3g40+J2XdTDBbVdtZ++nRJp1EY1EAH4DPSa3vWyez3erUuN4v4M3PuUG?=
 =?us-ascii?Q?7uuySVyiy5NQ02YkBS9nepYGE45vO4tRoBrP4Gm2XJ+yc5i1Aasbs6QiQC+9?=
 =?us-ascii?Q?y0pX4tEmT/mesK+DeO7KQhm3hmeNmX6eH6B6FtUdcAwkvXjYwFTFNNWq6JWE?=
 =?us-ascii?Q?xsN5ch75hJBrLIn6dND+7k1j64uEvabDUc3GnQ5pp2kimyf5RI3lCYJuUmb/?=
 =?us-ascii?Q?5z39syv9AWl4e0ZkWy9lohCLHiC7c4AH8t3rmrGK5MiYTEJ9VlvAt3YLw6QG?=
 =?us-ascii?Q?q+x/MiNbq7uJhTPlBkOzf5a5iGy1ScAQdkZr2vvoi48rSupVrW8X2Pdkk3k4?=
 =?us-ascii?Q?SWIvvGGAi79xn8IV/LsNlH2ZaNhY+HyaVj1sXv1L4AbuDcPHJt8CukADMtAB?=
 =?us-ascii?Q?a9MH/Zf4r2OPaNVCjGP10oDEaWrREDd2S0IhAZQgTdKGuRf9YGQRLuL3nyhD?=
 =?us-ascii?Q?ALWSwGWzqkbEASHlni8=3D?=
X-Forefront-Antispam-Report: 
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(376014)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jan 2026 01:24:38.1505
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 4b8e6173-eba0-4589-64d7-08de4d8b865e
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BN2PEPF000044A7.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA5PPF7F0CA3746
Message-ID-Hash: EZRJVCEYIZH4UINXF52J3CQ4P5XXT6CN
X-Message-ID-Hash: EZRJVCEYIZH4UINXF52J3CQ4P5XXT6CN
X-MailFrom: ttabi@nvidia.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation; nonmember-moderation; administrivia;
 implicit-dest; max-recipients; max-size; news-moderation; no-subject;
 digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/EZRJVCEYIZH4UINXF52J3CQ4P5XXT6CN/>
Archived-At: 
 <https://lore.freedesktop.org/20260107012414.2429246-1-ttabi@nvidia.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

The NV_PFALCON_FALCON_DMATRFBASE/1 register pair supports DMA address
up to 49 bits only, but the write to DMATRFBASE1 could exceed that.
To mitigate, check first that the DMA address will fit.

Fixes: 69f5cd67ce41 ("gpu: nova-core: add falcon register definitions and base code")
Signed-off-by: Timur Tabi <ttabi@nvidia.com>
---
 drivers/gpu/nova-core/falcon.rs | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/nova-core/falcon.rs b/drivers/gpu/nova-core/falcon.rs
index 82c661aef594..fe5abf64dd2b 100644
--- a/drivers/gpu/nova-core/falcon.rs
+++ b/drivers/gpu/nova-core/falcon.rs
@@ -493,7 +493,11 @@ fn dma_wr<F: FalconFirmware<Target = E>>(
             Some(_) => (),
         };
 
-        // Set up the base source DMA address.
+        // Set up the base source DMA address.  DMATRFBASE only supports a 49-bit address.
+        if dma_start > kernel::dma::DmaMask::new::<49>().value() {
+            dev_err!(self.dev, "DMA address {:#x} exceeds 49 bits\n", dma_start);
+            return Err(ERANGE);
+        }
 
         regs::NV_PFALCON_FALCON_DMATRFBASE::default()
             // CAST: `as u32` is used on purpose since we do want to strip the upper bits, which

base-commit: 4348796233e736147e2e79c58784d0a9fb48867d
-- 
2.52.0

