Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E5D2B23CF7
	for <lists+nouveau@lfdr.de>; Wed, 13 Aug 2025 02:11:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 12B6610E66C;
	Wed, 13 Aug 2025 00:11:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="diqL1sYF";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2046.outbound.protection.outlook.com [40.107.243.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 489B210E66C
 for <nouveau@lists.freedesktop.org>; Wed, 13 Aug 2025 00:11:44 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MyKPFdTF24wAZ3/CLgbejohEcMiBgyL51wLxfx4FifU4WBD4rN8VdS0fAdhf4wxftZ7Y819XfzSFzNgxuzlB52QowPq2xWeGdOFAEdWBfK2fhy2jAARRaOJ4QQ81y1s2gCIa19Yq+Js8c3hKfi/F/YTwaoyAYHi0+ZIwSTPSDchT2tVlpgOgSP/592kibeaaRFLDCwS0r6qJQzTQLKW0J3tGrAkKPO1fZNBzEDEZmH0EQDeHKZ1HdCHb0eSmeY6ld8deDPrVN1o8lDas38xIlj9SgNAF6V6ARm37X/6c/9dRnwoeiVfHGqN5ywkFBW6CmwTWJSqnefPeq16/AJykSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1CUtbWRr20tfcR01KvSGL8KUmCU4qRf5SjyyNRaTJF4=;
 b=vrCxwt8r1QLudGquy0IbDOQ2ovbgPmB+j+Fha5eCR+Ln6cQUxgwGx2V8x2Du8fhSqk1tvPq1HQnCtBHTCiOBq+2JyyyHWVsrfMwMsDtGkEjK/Os5BSn3DCdEZkcNAtJ12YGJ+BXzB3bOU7aSbhJoHtwxrn61Jbo2Vy+ZFHuc8YxyxOrL+j2aqr58juA7eKI3QSIl4FGzSZispaifYpaRU9P/OlWEz+F0sQzipXS9yRcxLQhskCvtfpAkbAo4Z7utY/uOOOQ5xWcxri+LBW/OogMjoL2mtKWXPeYUlV5jRDsYdEsAgJ/OWenpZc8Eux5ibmxIzfPwbvIgY3/G/AgJTg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=redhat.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1CUtbWRr20tfcR01KvSGL8KUmCU4qRf5SjyyNRaTJF4=;
 b=diqL1sYFeEeQAbr5DatJwShQkDk/e7nJM76h5LHfncv4pcKcNxs68dDKyxQxj3o5hlkSa1gMUCxB2w7Y5Vi+KRk5OFSf73GzPED8fZ5M+Jq6CkZe1CjwIQtuua3eYCjh4jdhj95Sm32Eteje2uyMnp2LeRt9tf5B3TWTf/Y9vlX3UgpitEeIGiAoeOyiTFY9kU0NMGvHW9RHOGUtwsXAL6w8kMMxIyzMceUPDgQFWvOwPvdNOYNl9jSbKm4VjbEkukMoOcv39WThdYc/3QM93vr0YPbm8pIhG1mfiDiabgRZiouM4l1bQ1pLOChFyMyrdMAWF6WO4+5l7w7BA9/Pbw==
Received: from MW4PR04CA0322.namprd04.prod.outlook.com (2603:10b6:303:82::27)
 by CYYPR12MB8750.namprd12.prod.outlook.com (2603:10b6:930:be::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9009.18; Wed, 13 Aug
 2025 00:11:38 +0000
Received: from BY1PEPF0001AE1B.namprd04.prod.outlook.com
 (2603:10b6:303:82:cafe::21) by MW4PR04CA0322.outlook.office365.com
 (2603:10b6:303:82::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9031.15 via Frontend Transport; Wed,
 13 Aug 2025 00:11:38 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 BY1PEPF0001AE1B.mail.protection.outlook.com (10.167.242.103) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9031.11 via Frontend Transport; Wed, 13 Aug 2025 00:11:38 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14; Tue, 12 Aug
 2025 17:11:17 -0700
Received: from ttabi.nvidia.com (10.126.231.35) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14; Tue, 12 Aug
 2025 17:11:16 -0700
From: Timur Tabi <ttabi@nvidia.com>
To: Lyude Paul <lyude@redhat.com>, Danilo Krummrich <dakr@kernel.org>,
 <nouveau@lists.freedesktop.org>
CC: <stable@vger.kernel.org>
Subject: [PATCH v3 1/3] drm/nouveau: fix error path in nvkm_gsp_fwsec_v2
Date: Tue, 12 Aug 2025 19:10:02 -0500
Message-ID: <20250813001004.2986092-1-ttabi@nvidia.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.126.231.35]
X-ClientProxiedBy: rnnvmail203.nvidia.com (10.129.68.9) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY1PEPF0001AE1B:EE_|CYYPR12MB8750:EE_
X-MS-Office365-Filtering-Correlation-Id: 7e37911f-ead5-49fb-664d-08ddd9fdf8de
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|82310400026|36860700013|376014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?EV3A4Gs/82qzmcvwD/onC3PVBnhVFM9KJPJc37t7MeDaHRpfAiKB7C77ToY5?=
 =?us-ascii?Q?no7EG3D+eCBJ1Vq+E9DTl0QfT7ssnKbyBRPewxZ8WCQT0YUThL5DNKnsrSqj?=
 =?us-ascii?Q?8JLk9w2I6MqeIUNrQW7nOLVfdWiIsB8vB+UKywfWzvdWexAwyJrYArbOyyGK?=
 =?us-ascii?Q?rmUX6/JRUr7AMOBOYpdL5Sxa4vEDTVX5/HOCMe6s0GsTFOe9uCJ2vDqDpe0z?=
 =?us-ascii?Q?aTpDSJrhLs0+GHUukVTS2tCCncVaDVkliCF7AOfqI0PTveZIHmrGujpTOpoI?=
 =?us-ascii?Q?8qk6r28rbfCRro/rOvImDCJmeMtfriMm+M0TaZRGA3N+ghDEvR38CLgHYA41?=
 =?us-ascii?Q?fbZp+/jdBJ929NhGuXYSMWHFkCf7gxas8bdw1iA9FdRvGE6/HW1kR+BAr9fe?=
 =?us-ascii?Q?BNPyWgS1HaDXTg2Ux9Qfm74K/x+C1MKgnwE5pd9q38hMBFQWAGa3DaSJy8ha?=
 =?us-ascii?Q?jbmB/3OpQMdOHLzrbZSusRFynRhW6xWQjumzx9r/HhE3mzsky+gt4i4u9mRF?=
 =?us-ascii?Q?rtFmM6BN0g6BMajZ5UNbqqIm+GvDrPsq3zqLtLDml+cnzV8aeGgX5VtC8cyf?=
 =?us-ascii?Q?92JhPv1HZu0hG70J+GmhOzASHrVCc8Qd/XmrIV7UN+iSu3nc54dUBeDSCEmH?=
 =?us-ascii?Q?oTHI+XbdguG4ifk9QAuc5KxiB1LQLCUnUMBUaXudqo0dYOtmWrdeLoIyBQpE?=
 =?us-ascii?Q?UJMyKeWYNt82cwE3iZ5mAitTMB5kLOhmHXjstW3AP3QresAR7zKZDjO6L7N0?=
 =?us-ascii?Q?UnA18NjQOH9+F2QQCcGmtmByLCGV5rhd/yZdWjc+6KhLz6oLojWcKxzGa4hg?=
 =?us-ascii?Q?WA0P560tX6pYrLF2XmfSGttauxh4s5Dq+rwR/lqjlxw/cczTQgUptycdz6/n?=
 =?us-ascii?Q?WIPGtMmQAHkGFHFkpdKiHDPdYZLpfTmnxieNFp0cZ4kVb85LqMxdpKxwTns0?=
 =?us-ascii?Q?O1YY2t/Y4Q0y10WrxGpNfKEuTi3IpeDgc0t/7g+1/MtQy6wDQIjpb0H8Z1Kq?=
 =?us-ascii?Q?8g70yPN0LBjo/5lY7BiorY4iXpQ6O152GxA8VVBfIf1DY3MZkoXKp8GFS7ss?=
 =?us-ascii?Q?vjbjI1PfGmWyrBg0Awtcdrkm5/R/6j6hNqwis8BLT/R62XHIcv3P/bhcHG6H?=
 =?us-ascii?Q?JtBZlpsfOkDLG3kimjOimisJwOmUgaTEiHx2yEeiUS93SrmxseKqr2TZCk53?=
 =?us-ascii?Q?Hr/mOWJePVBAp20GDkCAYeOVSVOC8JocE4cXSc0YDaomCKaFPjc3hMsntqxA?=
 =?us-ascii?Q?iIOGeDl6tt58+aeql3jqN/XZm+ryOBRZhAtD6/NxSjqQrgIeY9vop122laxZ?=
 =?us-ascii?Q?ExoVFc28mB/O4cXTFpwAZOT8hm1tGFoyxNeIKBBsbaT8XHomV5P4dp1pI5TI?=
 =?us-ascii?Q?qVrd/rpSOzIVO8sFdCQbFp/hngl/op+i3j3B5opkD1R4/e2zVUkx9O9mirSe?=
 =?us-ascii?Q?Wq1vQ5uZOFnf4779xeJDWMtpNLtZ8pSbAzEUnA7kjDALchxU0hzzBGx3WK1k?=
 =?us-ascii?Q?a9kZ5yldOWQyeNFmfBr++2qCPfCwrw2zqvCx?=
X-Forefront-Antispam-Report: CIP:216.228.117.160; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge1.nvidia.com; CAT:NONE;
 SFS:(13230040)(1800799024)(82310400026)(36860700013)(376014); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Aug 2025 00:11:38.0438 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7e37911f-ead5-49fb-664d-08ddd9fdf8de
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.160];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BY1PEPF0001AE1B.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYYPR12MB8750
X-BeenThere: nouveau@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request@lists.freedesktop.org?subject=subscribe>
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

Function nvkm_gsp_fwsec_v2() sets 'ret' if the kmemdup() call fails, but
it never uses or returns 'ret' after that point.  We always need to release
the firmware regardless, so do that and then check for error.

Fixes: 176fdcbddfd2 ("drm/nouveau/gsp/r535: add support for booting GSP-RM")
Cc: stable@vger.kernel.org # v6.7+
Signed-off-by: Timur Tabi <ttabi@nvidia.com>
---
 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/fwsec.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/fwsec.c b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/fwsec.c
index 52412965fac1..5b721bd9d799 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/fwsec.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/fwsec.c
@@ -209,11 +209,12 @@ nvkm_gsp_fwsec_v2(struct nvkm_gsp *gsp, const char *name,
 	fw->boot_addr = bld->start_tag << 8;
 	fw->boot_size = bld->code_size;
 	fw->boot = kmemdup(bl->data + hdr->data_offset + bld->code_off, fw->boot_size, GFP_KERNEL);
-	if (!fw->boot)
-		ret = -ENOMEM;
 
 	nvkm_firmware_put(bl);
 
+	if (!fw->boot)
+		return -ENOMEM;
+
 	/* Patch in interface data. */
 	return nvkm_gsp_fwsec_patch(gsp, fw, desc->InterfaceOffset, init_cmd);
 }
-- 
2.43.0

