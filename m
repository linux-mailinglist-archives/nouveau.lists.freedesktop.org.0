Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 913DBCEFAFF
	for <lists+nouveau@lfdr.de>; Sat, 03 Jan 2026 06:00:07 +0100 (CET)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 69BF310E356;
	Sat,  3 Jan 2026 05:00:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="XdJA1wOA";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id B720344C81;
	Sat,  3 Jan 2026 04:52:00 +0000 (UTC)
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1767415920;
 b=lSIzCP342M+KwimLc/nw7YUpkpqoBXNGVZnigztgL3J6XwC6luyuE/9omsmzRuTC1XEIS
 Xqr+4sjWnl/Kf1SvUPkY/G0TXc88iKhfRNIGASI9w+/5j2VniQSEPgiyfFXlLzr0mDPTr7b
 thnIDTeTmSoeOT8bKp7rXEL/t+DZUI262a62BpF3m/PaCVX5SlQz1I5hRtDtaiQJ7MNJlvj
 BUd7uNio6bACEzIuIKUerKZSOrBZvt3bxCXTU809Soo2yil63qO0TXtHAKEsL/BAkKq6L7J
 ccDJnztFHhC0HY/J6odQaPVcPfpv8ZnZxpzHIyk9IudjWCUDta5X3RyBtZMQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1767415920; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=DPE7VZTRtIlDhLQAGDXJ8+YZh+QwzMKXePNLZiDGZfk=;
 b=WQkEzEhumsYJBheHVfLNHhM6ilPf5zBbAxQbZAzF+sznK0k9Bks3QukMfF+ir1X2EGfG9
 zRIaPAFKUDK9oMUubIDrOUgowxyTk+gIO1wOyf7d3KXgr47pVbFL6BSHJLPLqxQfS6kGDYN
 2xW7Ghdl9mpgT3yJktsax7oHJ/gu3vLenIOw1MB5HOa8nUiLjkYlMMBQb+IvP3iqtfoePUR
 KF1swdNK6x9HbN4TXtMtGBhul6f301a1USMelnjFAncCQPLpqjv4/HKZMajxrvSRWew+O8B
 RRpUbSrT/o3kFOE//jZqtlMAVUR/UWeakYzGRMLMGmLdTk25Kpu79tEMOY8Q==
ARC-Authentication-Results: i=2; mail.freedesktop.org;
 dkim=pass header.d=Nvidia.com;
  arc=pass;
  dmarc=pass (Used From Domain Record) header.from=nvidia.com
 policy.dmarc=reject
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=Nvidia.com;
 arc=pass;
 dmarc=pass (Used From Domain Record) header.from=nvidia.com policy.dmarc=reject
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id 838BD44C41
	for <nouveau@lists.freedesktop.org>; Sat,  3 Jan 2026 04:51:58 +0000 (UTC)
Received: from PH8PR06CU001.outbound.protection.outlook.com
 (mail-westus3azon11012045.outbound.protection.outlook.com [40.107.209.45])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 0E9C810E34A
	for <nouveau@lists.freedesktop.org>; Sat,  3 Jan 2026 05:00:04 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=L7eH1FrZpMZhCvIh4ryj3uExkIsLiteSqCWEHK4ND/GxOG/Vwrf46PmkKm6UiX2cwAQbD2pVwFna/xVWvdMw+UjS2Qy4hezszJMy4dGx6dte+BGhVJY00uRvpyEhEO+Ondho5xbwYWWPS/frypXijkF7qyeLm9Tr+GDLKNVy86/4lrJxceYDdsfVxERH9+Wi3oUz+UH0S007ND9eBwxEerbnDKHzUuJqeabl2No3nkrwftGjmpPb9tDO8jjVKgEswTmDT0zc7CLI79mcjZ7jTxQ1hWp84G7pgsIDjmbw03DSksQmf+56c8p3NKZSCm9Km88r+Si+H+f8fmPk/KEGpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DPE7VZTRtIlDhLQAGDXJ8+YZh+QwzMKXePNLZiDGZfk=;
 b=oYdVV8XvL4SWlhbvcUx5i+nKI1zm9U9LusI0TxmX+jDOSgZl0X+WNwDUaR+e6Hduk9cyBGNLs6wwltt105ietAZ9PMkSdlX/Pw1qAXFLXARnkkaoYwEnJ2Jd+NjZNA+N+VrMtWPzZLwic+6D4lYQffLwg+Jt1Y3VKKQtkpFs+/08BN1CxbEVuC3Tj5y85r7ws5qdubyF6CBWzUUVh8+DZ+NTOi90S3Wxc39Pt3ioFcfuh+9iVO6Wk2Ey1UNldtz0Xfl6kzjtvU92l8E8o3x0uV4krEUp1JEZU51wZyOs/bF1r+f32AQI5DwE3M2y1I7qBnz/tjzLebasNustxLo2Aw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DPE7VZTRtIlDhLQAGDXJ8+YZh+QwzMKXePNLZiDGZfk=;
 b=XdJA1wOAVVegeWW7O5qWbdRhR3nrLgYJm5hj/azaUYKmEOqWDdEoIoekziKeRfIdH2eTOPAjMtSFnFXOiBm8oKFztA/tCEM7jlOu+RYjabWeaIEdqbl+tW0pU1R3AGqDDJCfn0g4KcNz37KbzXbqawkdkn0PTgQQAc6nMaz5qVEyUl/tJuCKO4myha63VIx/CTqvFQCGwIp5REeuPjexYkoCXiBf02vVLVbXX0UyXc/fTtRjSMQOsOerSfjnPnijzAWGlEdi4fCahUo/opsKPCDdaJY9FqMQQ6Pje1jQii8eTOgYzNy59VMEM7qansxpV/ZJNU/Uo0gGCXuQYA8ZEA==
Received: from SN7PR04CA0178.namprd04.prod.outlook.com (2603:10b6:806:125::33)
 by PH7PR12MB7355.namprd12.prod.outlook.com (2603:10b6:510:20e::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9478.4; Sat, 3 Jan
 2026 04:59:57 +0000
Received: from SN1PEPF0002636E.namprd02.prod.outlook.com
 (2603:10b6:806:125:cafe::ed) by SN7PR04CA0178.outlook.office365.com
 (2603:10b6:806:125::33) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9478.4 via Frontend Transport; Sat, 3
 Jan 2026 04:59:45 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 SN1PEPF0002636E.mail.protection.outlook.com (10.167.241.139) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9499.1 via Frontend Transport; Sat, 3 Jan 2026 04:59:57 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 2 Jan
 2026 20:59:48 -0800
Received: from ubuntu (10.126.231.35) by rnnvmail201.nvidia.com (10.129.68.8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 2 Jan
 2026 20:59:47 -0800
From: Timur Tabi <ttabi@nvidia.com>
To: Danilo Krummrich <dakr@kernel.org>, Alexandre Courbot
	<acourbot@nvidia.com>, Joel Fernandes <joelagnelf@nvidia.com>, John Hubbard
	<jhubbard@nvidia.com>, <nouveau@lists.freedesktop.org>,
	<rust-for-linux@vger.kernel.org>
Subject: [PATCH v5 04/11] gpu: nova-core: add support for Turing/GA100
 fwsignature
Date: Fri, 2 Jan 2026 22:59:27 -0600
Message-ID: <20260103045934.64521-5-ttabi@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: SN1PEPF0002636E:EE_|PH7PR12MB7355:EE_
X-MS-Office365-Filtering-Correlation-Id: 3ec42834-4295-473c-4509-08de4a84f136
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700013|82310400026|376014|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?JBh/20sSUbUexlcMb7c6WZAasEY+Y/wKJEy3udwwfaTQv6UIYh+KCXLlOXpF?=
 =?us-ascii?Q?SvEUgjzl1IT+O7MqvgEiY7gF+5EtLGyORqxNKplvsvkMZZkKSc6kaX9w4CtC?=
 =?us-ascii?Q?ggRye1DJsDnFRDUqWyLAZt0FAjsBKEPUASqqRr2brJ5bDHyfZZ/pTwCDhCMW?=
 =?us-ascii?Q?jBQREjczri/a4V7IvNPgZhQV2GkTzvBxvCZIW4ezg2fv7vH62ywtfvXSNsVq?=
 =?us-ascii?Q?9sCi89GUsIECGh/+rZB6HAPNS+S5WjuIk9tPKND/YjHA0BQJPeVCAEujVkZe?=
 =?us-ascii?Q?bv9W90ktuDi30bh+8SBI2+o6YwEmNUX57uqVFw7kmvXsy+nn7pSbhsWS1QPR?=
 =?us-ascii?Q?2/fESpVOOWV6jWCbxOHpcaNOJwLDRwVXvBy+t1qfviG0d1sP/sfDC2rx8yVR?=
 =?us-ascii?Q?3XOtKKInxP2EoS5c/H+bMx/W9hba3sCPUML+Et/fZ1A7VOh+gfO/pBNrSLnL?=
 =?us-ascii?Q?Gdnh/xevKhPnCB97sXv/tIhFbdRTJt5GmqZZHp6/qYiEhwxiL96Kj6cg8idC?=
 =?us-ascii?Q?VS3L1EpcYXH+IGXWkhG+H3ze5JHfYFY3WSxgey86P5tRrYjlo5GzKg3xeee9?=
 =?us-ascii?Q?kDqNtYFcyfVaaLOfttmzailXiXjyE70tyNp3GBwEEzjBcZVipwRPH/JGMbRe?=
 =?us-ascii?Q?EOEdeV59xCefcjQWuRdhYaOju/ODeNl3JZmfc7FnT34iRMh8/KVtsXmsY8f/?=
 =?us-ascii?Q?W/d/tzcU5Wz940dwVUcYi9e0affjlNtWCbd65PWw60piGPwQiy+VFjIeXcbC?=
 =?us-ascii?Q?0Rou3mLZpAwE1oeEisgZc0tpO65QD4ywYjIFb1ZVwVMETQ57qfnVLjc+9F+3?=
 =?us-ascii?Q?KDY7XvIO/Gaot45ADWa+bwZq6mx/l9vKTdqRYDoHEVfSAu3l5Qzr/rCizlAW?=
 =?us-ascii?Q?e5Je9AgWfo7QCFbmy7orQCkZJ9fiK3pXRJTH6pPZp3IuC248z3jAMdIRSsgZ?=
 =?us-ascii?Q?2mlswiON97bAZuTuUmuBvS50Qb91rHjuAFLpqGuvwK8l2dSPpfGodMtoPUtB?=
 =?us-ascii?Q?duD5uKQfyCmPqyPj7m2z3IMivHotM11hhvy6v3fkxz33CbAlyzGkCehxIFtn?=
 =?us-ascii?Q?HaMpBV6Zcf5qaP2M4ZK+w80O92LsKJn78JeiSghmbneB1CAw3dVcBxvQWzNv?=
 =?us-ascii?Q?OSwhtd1hmgfp5wB4clFCJHJpR4TWEzlpnnLgiXrRY149n27+4i1GBL7+PCDG?=
 =?us-ascii?Q?WNZoRIcoLVeTmPVA0mw9olu27uJe+O4oLemiUmxKMGfAqxg4EGjnVsHqgTRN?=
 =?us-ascii?Q?PCgCcXGnDAmNusKubI0W1ouRO3JXKaJjUTR9WoFKtSmGY+2TqymtT1u2MbaE?=
 =?us-ascii?Q?rigB/p42RahvApa1VZwKXAAVv0lSoryilAvi0Oh/6qsbwNrtBNPyuGWmWPjn?=
 =?us-ascii?Q?oSkgu1D3lzS777RZRDrVnBwI26GIYrVSwjf7lKtpo9yoeC55saSFsB4KeQjH?=
 =?us-ascii?Q?0pFnKFvBstjmCJNIsjJBFgr3B9cc8DsWfrg5xZj8XyeeXNS7bZw1d8LPosKI?=
 =?us-ascii?Q?fNLdgbH0bDVw/WmSP3M9ZQjSQ5n8+jV4N7C8JkYiaDRowVAbjZyGaLzhnSoy?=
 =?us-ascii?Q?0Lo7fWg/mOhXGWuRHfM=3D?=
X-Forefront-Antispam-Report: 
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(376014)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jan 2026 04:59:57.4835
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 3ec42834-4295-473c-4509-08de4a84f136
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SN1PEPF0002636E.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7355
Message-ID-Hash: 2GMLH5ISSUESIGQEHADLEOWF72XUX77R
X-Message-ID-Hash: 2GMLH5ISSUESIGQEHADLEOWF72XUX77R
X-MailFrom: ttabi@nvidia.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation; nonmember-moderation; administrivia;
 implicit-dest; max-recipients; max-size; news-moderation; no-subject;
 digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/2GMLH5ISSUESIGQEHADLEOWF72XUX77R/>
Archived-At: 
 <https://lore.freedesktop.org/20260103045934.64521-5-ttabi@nvidia.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

Turing and GA100 share the same GSP-RM firmware binary, but the
signature ELF section is labeled either ".fwsignature_tu10x" or
".fwsignature_tu11x".

Signed-off-by: Timur Tabi <ttabi@nvidia.com>
Reviewed-by: John Hubbard <jhubbard@nvidia.com>
---
 drivers/gpu/nova-core/firmware/gsp.rs | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/nova-core/firmware/gsp.rs b/drivers/gpu/nova-core/firmware/gsp.rs
index da97814cf859..c463b60799a4 100644
--- a/drivers/gpu/nova-core/firmware/gsp.rs
+++ b/drivers/gpu/nova-core/firmware/gsp.rs
@@ -217,9 +217,13 @@ pub(crate) fn new<'a>(
                 size,
                 signatures: {
                     let sigs_section = match chipset.arch() {
+                        Architecture::Turing if chipset == Chipset::TU116 || chipset == Chipset::TU117 =>
+                            ".fwsignature_tu11x",
+                        Architecture::Turing => ".fwsignature_tu10x",
+                        // GA100 uses the same firmware as Turing
+                        Architecture::Ampere if chipset == Chipset::GA100 => ".fwsignature_tu10x",
                         Architecture::Ampere => ".fwsignature_ga10x",
                         Architecture::Ada => ".fwsignature_ad10x",
-                        _ => return Err(ENOTSUPP),
                     };
 
                     elf::elf64_section(firmware.data(), sigs_section)
-- 
2.51.0

