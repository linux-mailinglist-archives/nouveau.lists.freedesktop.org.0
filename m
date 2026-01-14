Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AF1A3D2109A
	for <lists+nouveau@lfdr.de>; Wed, 14 Jan 2026 20:30:32 +0100 (CET)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 5EDFE10E67F;
	Wed, 14 Jan 2026 19:30:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="BIOjcHgX";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id C463C44CAC;
	Wed, 14 Jan 2026 19:21:59 +0000 (UTC)
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1768418519;
 b=U7k4/6jgV8nZ7nK8on3XdBEoRzqROiUb+WJyL49TAyZmA6OCi4MnT0do+hHMN/N2mT+jb
 PCRG7LBukUixTpuePA0dEjJ10HrUr2w4iEt1grB4Zmwk7UMi0cWYPJCIkU+GAxwwcolFigO
 2MduT2ynYlpsm+kok5IUdm3rT74knlDvVhf40icjAV3gaG+0Fu9WN9Wt6Cxoxwf3yRSQBKL
 NxXA9NwQwi8JOFqfXEI1Pv/tQZh6KgAcSpcS7FQG5ZiojcxD1NnsEqkVGmg5R5weWzcVJ81
 XIiZETEyHa2NkFSazHCmyumtjJwnHrUwkHSa4zwGdjoWCbwxXGZXIA5qkzyg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1768418519; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=BDTbnicKuY0v8+B0QTZjbgrZZe4UCx9kzokAyHMKv+Q=;
 b=lt4yDWGKCgeUTb3zAYZdAceERBOsNKHG9crgVEmZSiIDIpHtIA8AKEjWgeu4DZo9ncqqj
 HRDvA1w1oHxNgyUSpLghZJzrIze25Q0TA7pqQKtmnwJ3o1llA2ojY1Udemo0N3qWmNIMjJL
 SZ8qF/nDEq5CF5vRD5gPNMhiH/o56qAK4ucL7hoJq3LcKXYgteEt3tsCZQ2L3FmM0UpgmbA
 z1JpJyLeL6e6B3F8Abo/2DlD7LdgwsZFNzSTpF/eSAM1OgQ42I2vMCRCWb/zLBfoF+5XQnd
 vdVh91lUMI2ER2EC8EArUCDT6ohaLX8ifJx1Fgxs1miUYUpYGHunMYRBm6AA==
ARC-Authentication-Results: i=2; mail.freedesktop.org;
 dkim=pass header.d=Nvidia.com;
  arc=pass;
  dmarc=pass (Used From Domain Record) header.from=nvidia.com
 policy.dmarc=reject
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=Nvidia.com;
 arc=pass;
 dmarc=pass (Used From Domain Record) header.from=nvidia.com policy.dmarc=reject
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id EC17944CAD
	for <nouveau@lists.freedesktop.org>; Wed, 14 Jan 2026 19:21:56 +0000 (UTC)
Received: from CY3PR05CU001.outbound.protection.outlook.com
 (mail-westcentralusazon11013032.outbound.protection.outlook.com
 [40.93.201.32])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 4EAAD10E0F0
	for <nouveau@lists.freedesktop.org>; Wed, 14 Jan 2026 19:30:28 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xVywOI2tvEpfjle53p7lQcTljPLA5n7OesUz0JlsEzxE03Fmhw3wm3H43QXdqbEU3pqC8udhvSH8CqyU0hHWB4GbHplex7xuy8hETrOdT/fD6X9D+KvdM/RBtCpJeLGf+CEv818ChjNkqwGytu2VX0sRK0jHhew/4BR63UiZaDei94m3nLreRyFxp02hVaoUyyaAAda5t8uHivcxnEZdRDVSHaO4SJ8OfPzIGRVPuOFIarLbJOBgSei/SmzZ084+cIOOvANrXM/l0hy980bxwi7txnIZzO9jwWuHzx3/5ZEyznBOt8eNBclszOH+gTr97IQVwHcp92kZy15zu/yOxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BDTbnicKuY0v8+B0QTZjbgrZZe4UCx9kzokAyHMKv+Q=;
 b=dCeytC2xlEIRT6RNmwyz0gxC1vv/RxNwiYvvWSAoe6adI6rL1SPo7PjoHgiEAQYkA6X4dxBUkzOhnzq7+2fuiV2Hc+gZgyHsWJNBBsWKjkBGFZTXbO1xXnJ3fyk1zAKRBMMRA2rSIuoWAV6WAs1T7q71RixH5fkcaxLRcfzRi1P5cFA8vlz91MuG4FQb49gt7gX9O/hapWsKm+HtGPlbxpaRjuBJuiCurUoREUShvRZjFSOuefZ1YCR58PjHz8O4o7rdGrl86tExrmyJy5ufssyW9vduvXE09HqePGQx7fjPx2Q5ZQ5JY1YlhE0uxT5rlHTsFrWKj4ZaAPzNFz+yWg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BDTbnicKuY0v8+B0QTZjbgrZZe4UCx9kzokAyHMKv+Q=;
 b=BIOjcHgXbuMVLMRajc77bHxQZJa3MXrUhLnQ0RhrWGjQol5CssvUvRvKlgIdvVGjCJRVN6u8z6J+DGiFufx1CAZejpW5QX0EKliMsCxUB4uyjRLEIQoflnF5Cq5t3Ak7yECVIfeUiSfzV+uQC4pdlOv5d71POvtsTcW+4tEts0Q58cGRjamzuSuw1pUv7xk0/adm++aUPVOe75dOBfwYiCOrFwAeb8Fuq4Remf+Sk8A7EskjnDxgUyOs6HFVFhRVpAhazW2ehSO1eu5PAGrZaNDpxVQwSPImwcOyhGJcEyPM6d8FDIYK+ifRl005NmKdBuPUDGr22m/oy1gfRefgUw==
Received: from PH5P222CA0006.NAMP222.PROD.OUTLOOK.COM (2603:10b6:510:34b::6)
 by MN2PR12MB4272.namprd12.prod.outlook.com (2603:10b6:208:1de::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.7; Wed, 14 Jan
 2026 19:30:23 +0000
Received: from CO1PEPF000044FD.namprd21.prod.outlook.com
 (2603:10b6:510:34b:cafe::1d) by PH5P222CA0006.outlook.office365.com
 (2603:10b6:510:34b::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9520.6 via Frontend Transport; Wed,
 14 Jan 2026 19:30:28 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 CO1PEPF000044FD.mail.protection.outlook.com (10.167.241.203) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9542.0 via Frontend Transport; Wed, 14 Jan 2026 19:30:22 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 14 Jan
 2026 11:30:01 -0800
Received: from ttabi.nvidia.com (10.126.230.35) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 14 Jan
 2026 11:30:00 -0800
From: Timur Tabi <ttabi@nvidia.com>
To: Alexandre Courbot <acourbot@nvidia.com>, John Hubbard
	<jhubbard@nvidia.com>, Joel Fernandes <joelagnelf@nvidia.com>, "Danilo
 Krummrich" <dakr@kernel.org>, <nouveau@lists.freedesktop.org>,
	<rust-for-linux@vger.kernel.org>
Subject: [PATCH v6 03/11] gpu: nova-core: support header parsing on
 Turing/GA100
Date: Wed, 14 Jan 2026 13:29:42 -0600
Message-ID: <20260114192950.1143002-4-ttabi@nvidia.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260114192950.1143002-1-ttabi@nvidia.com>
References: <20260114192950.1143002-1-ttabi@nvidia.com>
MIME-Version: 1.0
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.126.230.35]
X-ClientProxiedBy: rnnvmail202.nvidia.com (10.129.68.7) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000044FD:EE_|MN2PR12MB4272:EE_
X-MS-Office365-Filtering-Correlation-Id: 671f2611-c07a-4621-f6db-08de53a35c64
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700013|1800799024|376014|82310400026;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?l3fc4WpNuSDvK2KTc0+1Zz2TikQhcazJIPowLl9nn+ipoXEe4C8IKiZWe+zc?=
 =?us-ascii?Q?yfct75N2TPeH+R7jej+x76vPXvd7IdOuEm16LxF+3Bzuv936vpQG4o78A+Kg?=
 =?us-ascii?Q?EliJVd6XHQsZFTsf+WVYH3Qw5slGrL6jB+o85rI5dL9fnXUgV1bxn0XPCG4g?=
 =?us-ascii?Q?rZQY/CHqYAAsmWB+gEA8RP6VoSX3G7yXHFa+29GQUDbrxtJQZBczuo7U8K0G?=
 =?us-ascii?Q?+y8f1XPbWUCrd9q0UT3XSJMfk+7Eg0ELCWMB9WuvzVNOdxWjlnhbGb28U884?=
 =?us-ascii?Q?ebf6AnsUUTVVivxUggskvvACyELlQ2oiaVvbWUvRyzbDeJgXEoIWJDODmOOS?=
 =?us-ascii?Q?eO3rtiK7Gg2tgIC027Jwjdpo91cdBI07DUt5Mjy6ZYEguy8jdyuN4aWfm2ep?=
 =?us-ascii?Q?GvUQKbwy8txQ8aprVBfAGpya8PYzQAD1lYM99WBw87iPIdErE1g4sAtNZa9C?=
 =?us-ascii?Q?ACYqfMKo4Zo3K1ah5Og5FSKUqKgGmnKCMPlAlFEkXfuc/okzrBlz7/tDGeP+?=
 =?us-ascii?Q?p8Ka3QU/E6IOQLAaN7ud6HaU1kGkE9OVYatQjyjV2vuGZy3yh3+cJahQnrHT?=
 =?us-ascii?Q?BR0IANz0rdK//LBaPtd2qgFyQRWKXxkcWbsnZtmQO8V4FGOluNZ0u5i2uEUY?=
 =?us-ascii?Q?dHk1mHBeqOya4jjGk7zyonRJVciDHIwqUoQYTOqNkDrjKjp+/VkEk18oKsQ5?=
 =?us-ascii?Q?rJ+HMWecXc8twD3YbWHn/h5iHaO759manZzMssldaCao7vz4qnfIDUnxirdK?=
 =?us-ascii?Q?CDeXSjXDjPbFnmmOqC2Pkm8PTAZRonk13feUyKNDJ/nVZteCEJXbGu0cQ1HW?=
 =?us-ascii?Q?sPn/zeurwRcUvH/tSU9hyMXO9y/Plcx+peXuvEe139XAl8QsLUoF9xoRzO/7?=
 =?us-ascii?Q?W7H700m4RwDcO3XShp8NcjDrnHGgGxWfVgEWYxGR8O+7Y0xzRR7/iuLc+Q0D?=
 =?us-ascii?Q?9ONz2aCIsFsAaXP1ZjnBrC8+adealLmsXr+4D7hcPxUQz/5MXIT1Jrj7n33g?=
 =?us-ascii?Q?lB4+Pq3Z6x4DwqV8BcO0im26QYuVhau/uHLL0wYASa7jHI45i0yEeLeQztzQ?=
 =?us-ascii?Q?xCAuwwJ6ednQn+miBeC97J0ippjeGR33XP/vwN09GMrsXajqdo6a2AuqxQaw?=
 =?us-ascii?Q?Xz4q4T15BkwUIr/BZmETNpV2nZLLZRvUPhX1VXjlGgbIcuszdlDXUcmabV6y?=
 =?us-ascii?Q?632yfWDIfPoMvshsJ3JxMYQe0oACPi4Yk8cTuzaNhmm06/S1aIf20bmz4V9J?=
 =?us-ascii?Q?HaTQfiMbhD+ym3Q4FVVHt55AF201VvEdklo/DfU2IDzK4UjM+FO9j4KvVTou?=
 =?us-ascii?Q?yLoqWbHfwG9r+rdD7DxmcGn7ccbaBc/+u3rsSgkNoM2a2KdDzAVrFUW1vZzx?=
 =?us-ascii?Q?hPEQAJ/i2Ua56ivd0feKENU4jd0cPNBA0mvFhHjmBxSzzS1MIDRVRzZQhmFV?=
 =?us-ascii?Q?E3glrfuEpC60/mE3Jswu6EdEfUxL+iCwl7GdP5CMuF4ZAV+Tw8afMS8brnMq?=
 =?us-ascii?Q?TEPmOuoimrSKvMckJsRkJQdcEdKt06li/eYwWQalM8Y6ykwzrSxm1HdymzqM?=
 =?us-ascii?Q?o1PXB2JtSXi8BwQxWoGYS+11CiwxcKRoGipR2ky4QwJU93XL0sgXFqAvC8Q8?=
 =?us-ascii?Q?R5lgLSenUEzhK69EtBktdgUt84G8pBQO083ROrgt6s8Ml6cyhOvePDVettPW?=
 =?us-ascii?Q?pY7ibg=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(376014)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jan 2026 19:30:22.6594
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 671f2611-c07a-4621-f6db-08de53a35c64
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CO1PEPF000044FD.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4272
Message-ID-Hash: 5IKHZ3LQNLQZXAYWMVC4ZGVVL3OV3KNH
X-Message-ID-Hash: 5IKHZ3LQNLQZXAYWMVC4ZGVVL3OV3KNH
X-MailFrom: ttabi@nvidia.com
X-Mailman-Rule-Hits: member-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/5IKHZ3LQNLQZXAYWMVC4ZGVVL3OV3KNH/>
Archived-At: 
 <https://lore.freedesktop.org/20260114192950.1143002-4-ttabi@nvidia.com/>
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
2.52.0

