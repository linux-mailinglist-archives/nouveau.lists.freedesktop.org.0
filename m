Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 352B4AA3CAF
	for <lists+nouveau@lfdr.de>; Wed, 30 Apr 2025 01:41:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A75BA10E5BD;
	Tue, 29 Apr 2025 23:41:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="ZECKFoNC";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2052.outbound.protection.outlook.com [40.107.243.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D16010E5B8
 for <nouveau@lists.freedesktop.org>; Tue, 29 Apr 2025 23:41:12 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ur3+b1rcoUtFfFGix3hROMMdRS3NCimXLK4rFo3a6Bioafas7c8NSp9RGPlSwlQVWiE0FNhpPeBXOoZPCR53rEORW81f3yTIa5oWm3Jaw86YeFgy1ZDrrzUVIrfDA17wShuv/Cc9PRi688jhRWg/B4mxzkI//gaaA6PlEyOQHRuUe7ZGwvg0QvmKPB6et7mKEsKgZbeAFcZWluyrY6BIW3HYacnKPPt7MVzm1j5H2Y1Kpg+vs4BzrcEOsrjNhqYb+YKlGmc+GfPm5jvldMzcbpx1e2Bg+d/2IrMoUfQXMPPXoyt+qQ5yOsCKdE7PJFdnzJ2dKrV83NK8s71LnjBfJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zcotJ8XGYlHcpGmgFDnLwKb53vnyrDNmP9TJSHnIjIE=;
 b=QyfHllq0j0BfdBFOTVnxN4I4Au72D99vYRu5lsFyCz2UttYBESpMRvv214QGHCqgxJsNfL5Q0oxRyUHMmAZrVVf9nvAjNTYSEAUce4p8GvpIpBwvZM6Gx0kzeShQpr1EA+d6WFs7D+BRzsHBTuD3xxiSE5c+LWZ05KSJ7LGrAdPJ01neQFoFgjH/WO/lY2MI6Tnx3dyKvTurlE1+516/a9LxeZ91igKT843CJDxCrbrKtsPskYG7BTkH+9pVpedfOgpRRJ78jk3mlywAqMacPiWXL5jdVdBR5V+YU3y2ATp5/VOAyCKREZS2VaI7a6uugDLb26uSoUCTuDDmKC3prQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zcotJ8XGYlHcpGmgFDnLwKb53vnyrDNmP9TJSHnIjIE=;
 b=ZECKFoNCbOFYiSeQL55WOFXSM65ED3CfN5Ks6Tlr53w4QU+tpThtOFkg967Z6pOBFGT6x9arTCBm2YN81EUCPXb4hErIgclNM7Hbs8Yc+hqR6Xz6iXG7q9VJjn9rv7HiVqmqm8spbIP1hkZW2HphUgejpQeVzWqq0MPYWv+9/2V05MM1n7kDUMXzHG/TNG/JcyX0nUHLQlZ7KHmgvugExMYqcGctfBjMRq2dgxFuKSDpoJqLzHhFIMe5PpmrCshK29vGAvQdA/m9GyerzQtC5TwCBCcI9dCdeGCpMpDul28QjB/PIyoodXruWqx95CimnQ5PWCITXa6KYTgXuWE/rg==
Received: from SJ0PR13CA0167.namprd13.prod.outlook.com (2603:10b6:a03:2c7::22)
 by PH7PR12MB7020.namprd12.prod.outlook.com (2603:10b6:510:1ba::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.29; Tue, 29 Apr
 2025 23:41:07 +0000
Received: from MWH0EPF000A6734.namprd04.prod.outlook.com
 (2603:10b6:a03:2c7:cafe::b6) by SJ0PR13CA0167.outlook.office365.com
 (2603:10b6:a03:2c7::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8655.34 via Frontend Transport; Tue,
 29 Apr 2025 23:41:07 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 MWH0EPF000A6734.mail.protection.outlook.com (10.167.249.26) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8699.20 via Frontend Transport; Tue, 29 Apr 2025 23:41:07 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Tue, 29 Apr
 2025 16:40:51 -0700
Received: from nv-dev.vdiclient.nvidia.com (10.126.230.35) by
 rnnvmail201.nvidia.com (10.129.68.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Tue, 29 Apr 2025 16:40:49 -0700
From: Ben Skeggs <bskeggs@nvidia.com>
To: <nouveau@lists.freedesktop.org>
CC: Dave Airlie <airlied@redhat.com>
Subject: [PATCH 59/60] drm/dp: add option to disable zero sized address only
 transactions.
Date: Wed, 30 Apr 2025 09:39:27 +1000
Message-ID: <20250429233929.24363-60-bskeggs@nvidia.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250429233929.24363-1-bskeggs@nvidia.com>
References: <20250429233929.24363-1-bskeggs@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.126.230.35]
X-ClientProxiedBy: rnnvmail202.nvidia.com (10.129.68.7) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000A6734:EE_|PH7PR12MB7020:EE_
X-MS-Office365-Filtering-Correlation-Id: 1352eafc-0913-4bae-4da6-08dd87775051
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|36860700013|82310400026; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?GLNxPedFSLhVd4XQhEVWZSRq5hCi8gWHG28sgM4xq2NUqq9JeuuVoMVamQ+s?=
 =?us-ascii?Q?qqTGI/1bC/kUV5PuRsBknJO8UmvxNSTFOAHFmpdwMd46VOaLWuH9PTmVl3b4?=
 =?us-ascii?Q?xLjg82EGDX+vQ57I5vs6IxwAdEJ2rrgn4CPa/s129y3kjl4DJ5PRsSxoKX3C?=
 =?us-ascii?Q?u86azo4knubkZ4eQzsAWqs7v1xNNeDM5GfcnMtOutzATY1JWjzG4gV4WzBYn?=
 =?us-ascii?Q?HrX/eqe9g91NVVm+/gW8xLjAF/EWPGvXmRxaBqS93C7DF2YVh6LifR8GqF9a?=
 =?us-ascii?Q?YcFsQQ9ZKfk0r9kRBLm4V2bBDTxdYjmXPMWtkC1d+L6iX9ICcFMRLObGvrAq?=
 =?us-ascii?Q?BZ+2Ksula3MCBSoPtyNly9UxbfdQofmFIJytVjdaR/6ezMVUzI0BFvhd1to4?=
 =?us-ascii?Q?YQk9AtbK+KNwOMPNFqZPtJvIIbKKICyjUqPlWFPYdrlGjSQmSM53M0C+jqor?=
 =?us-ascii?Q?ne21cFevpc7LUmqH6fPxjzipY7gmKVRxqU0l0XX5XmWzPegDY2OHF6gtNKb8?=
 =?us-ascii?Q?3nbVd9EAujxUcK+UbVJVyW2h7SiAvytL/isqUZPgZFRc3/178IHicHuUkv1a?=
 =?us-ascii?Q?vRH7sg0GuPCEXs9ED45IwCZsXTCd2wUuByOB/EDJ8XBmRqEXUQlosFoxTSiV?=
 =?us-ascii?Q?ww5EBqeaR6OFbsgyQNcX4y3jrdoUkbzUfxA5GIzUXSbEr+InpyeP3zFLfTYM?=
 =?us-ascii?Q?x7Mjd3DDpiSkAIJtoti6EwWuVOVUxCY7OYN7sR+bwFIPtQ6xU4p0enQ0qnEk?=
 =?us-ascii?Q?8/sfJ4cliodzFd0KrWxElB03Sbi0NljKeyhFcmZWmjY+BAfgiemdytGqWcbW?=
 =?us-ascii?Q?5bxI/oLfhlN52REOvopW1JUdeN4NDaMYt6/TAxWspgsxcqxV+jstqibhLs+T?=
 =?us-ascii?Q?VZI2KmtXy0dYE7sE7MnrkKVil4j8tnnb+REVbBW7KcanK9kXN42zIu5OncuO?=
 =?us-ascii?Q?dJSajRLd+6uEpIVHw58zcsNg8Ykst00krvm4bAHM3BiinsGfPphLkHh/TY46?=
 =?us-ascii?Q?iNouOBNf4QQF++y9PeE2P8p/LXg/vjB752jMtj3iC6xtfuhG7/JLPZO9PtRW?=
 =?us-ascii?Q?lpuSILwgdS2IEnXnry8sTCCpj622MM/Lv90JPeDNlin7ngDnoOMSj4UbyYcC?=
 =?us-ascii?Q?NQ2tB1Waxoy2uWImvtPb3YqnoAy2yDueJHK8tcco0oZ41VA2bC3wbuzqWCBH?=
 =?us-ascii?Q?K+5m/TSC10nPeWj3MfObuNb7+TfE6f20xKD72pvWJoGUhprb0zQSWsNYkTKH?=
 =?us-ascii?Q?jO138gLHNiaQnk73kLuVEHdG98l9ivnFOvQJ2q0cKk0n7SImoFk984XMC3GJ?=
 =?us-ascii?Q?h/+5Ci56dwDLkEZIu5fh6CxPZcBwwuVxKux0P6LQj1KvLC6j0itDXrN2AGlR?=
 =?us-ascii?Q?AD/dfLXbopItJAOC7WEBgyuy+U4ULBV6e+udnnRW4uuzrF+Pd4NIdRfTOH0f?=
 =?us-ascii?Q?fJtlDccj/jLxC4ojDa1/X/aF2HvyPftJFyjF3Xc4TfdDjhEhq3/jnzQnATYR?=
 =?us-ascii?Q?qJpTRbnxbt2b7twg/9zMzSep7Cw63LQt4WOW?=
X-Forefront-Antispam-Report: CIP:216.228.117.161; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge2.nvidia.com; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(36860700013)(82310400026); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Apr 2025 23:41:07.3455 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1352eafc-0913-4bae-4da6-08dd87775051
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.161];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: MWH0EPF000A6734.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7020
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

From: Dave Airlie <airlied@redhat.com>

Some older NVIDIA and some newer NVIDIA hardware/firmware seems to
have issues with address only transactions (firmware rejects them).

Add an option to the core drm dp to avoid address only transactions,
This just puts the MOT flag removal on the last message of the transfer
and avoids the start of transfer transaction.

This with the flag set in nouveau, allows eDP probing on GB203 device.

Signed-off-by: Dave Airlie <airlied@redhat.com>
---
 drivers/gpu/drm/display/drm_dp_helper.c | 39 +++++++++++++++----------
 include/drm/display/drm_dp_helper.h     |  5 ++++
 2 files changed, 28 insertions(+), 16 deletions(-)

diff --git a/drivers/gpu/drm/display/drm_dp_helper.c b/drivers/gpu/drm/display/drm_dp_helper.c
index 57828f2b7b5a..55b8fd6aa9bf 100644
--- a/drivers/gpu/drm/display/drm_dp_helper.c
+++ b/drivers/gpu/drm/display/drm_dp_helper.c
@@ -2137,14 +2137,17 @@ static int drm_dp_i2c_xfer(struct i2c_adapter *adapter, struct i2c_msg *msgs,
 
 	for (i = 0; i < num; i++) {
 		msg.address = msgs[i].addr;
-		drm_dp_i2c_msg_set_request(&msg, &msgs[i]);
-		/* Send a bare address packet to start the transaction.
-		 * Zero sized messages specify an address only (bare
-		 * address) transaction.
-		 */
-		msg.buffer = NULL;
-		msg.size = 0;
-		err = drm_dp_i2c_do_msg(aux, &msg);
+
+		if (!aux->no_zero_sized) {
+			drm_dp_i2c_msg_set_request(&msg, &msgs[i]);
+			/* Send a bare address packet to start the transaction.
+			 * Zero sized messages specify an address only (bare
+			 * address) transaction.
+			 */
+			msg.buffer = NULL;
+			msg.size = 0;
+			err = drm_dp_i2c_do_msg(aux, &msg);
+		}
 
 		/*
 		 * Reset msg.request in case in case it got
@@ -2163,6 +2166,8 @@ static int drm_dp_i2c_xfer(struct i2c_adapter *adapter, struct i2c_msg *msgs,
 			msg.buffer = msgs[i].buf + j;
 			msg.size = min(transfer_size, msgs[i].len - j);
 
+			if (j + msg.size == msgs[i].len && aux->no_zero_sized)
+				msg.request &= ~DP_AUX_I2C_MOT;
 			err = drm_dp_i2c_drain_msg(aux, &msg);
 
 			/*
@@ -2180,15 +2185,17 @@ static int drm_dp_i2c_xfer(struct i2c_adapter *adapter, struct i2c_msg *msgs,
 	}
 	if (err >= 0)
 		err = num;
-	/* Send a bare address packet to close out the transaction.
-	 * Zero sized messages specify an address only (bare
-	 * address) transaction.
-	 */
-	msg.request &= ~DP_AUX_I2C_MOT;
-	msg.buffer = NULL;
-	msg.size = 0;
-	(void)drm_dp_i2c_do_msg(aux, &msg);
 
+	if (!aux->no_zero_sized) {
+		/* Send a bare address packet to close out the transaction.
+		 * Zero sized messages specify an address only (bare
+		 * address) transaction.
+		 */
+		msg.request &= ~DP_AUX_I2C_MOT;
+		msg.buffer = NULL;
+		msg.size = 0;
+		(void)drm_dp_i2c_do_msg(aux, &msg);
+	}
 	return err;
 }
 
diff --git a/include/drm/display/drm_dp_helper.h b/include/drm/display/drm_dp_helper.h
index d9614e2c8939..4d03b591a755 100644
--- a/include/drm/display/drm_dp_helper.h
+++ b/include/drm/display/drm_dp_helper.h
@@ -518,6 +518,11 @@ struct drm_dp_aux {
 	 * @powered_down: If true then the remote endpoint is powered down.
 	 */
 	bool powered_down;
+
+	/**
+	 * @no_zero_sized: If the hw can't use zero sized transfers (NVIDIA)
+	 */
+	bool no_zero_sized;
 };
 
 int drm_dp_dpcd_probe(struct drm_dp_aux *aux, unsigned int offset);
-- 
2.49.0

