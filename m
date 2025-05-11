Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 00B75AB2B7D
	for <lists+nouveau@lfdr.de>; Sun, 11 May 2025 23:10:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A42FD10E290;
	Sun, 11 May 2025 21:10:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="IFktKH5D";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2065.outbound.protection.outlook.com [40.107.237.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4283510E290
 for <nouveau@lists.freedesktop.org>; Sun, 11 May 2025 21:09:58 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ckTSesL9CQCzO/EOW58ixSWNrCQsu0mfGQnt1QX6JdzkHFTnyl3l3f0zqMJ5mURUPYQbF0RYdqzBLdhukWhlpeOBfDRJVZgpNCrLeEJCRBxIMTCE/I5f//I17VvjgLU8Zp6yLj8Rq+A4gzIr8B2s9H72lGGyqpUqRINeJ4G4U0IMN9I9NuxgasaOS86ndhtc06D1Bw+a4vDYwURHyL5pWtK9eQcpUamrqKGWc/MIJvGSTVPazkZOsnoRGP4WAlz0hol8UYpS2svUDfsU7+hGEqBhQ8mX0d5xUvaom3pW2bsSGAcUfhz8e45trYIif6+WUoy0nIlCfek3VgZDuqpXXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=knM0CRIqZM69DHfllThZ0svDBIH3Ucre/k1bPQJSauo=;
 b=AoR1a1LoZE1agEDQ7FUpnCcJv8mF3MvVfcU8mha3rOCi5FSW1RG1a2pfVSRUMbt67T6+s7wmJ2jXi3iZBPnctOloyn9Wu2Hu72oFbKsZwDXu7lxoUbxzZzTidVkdEqQLnyVMtCBUwbik/LB3tItbmJfiCpht5fB5ewx44zHtEsw+rWPl18J6PmroHelHHc2pBvnL0jERr5A7b7dFtK8xXO3ch8Z0aZJqV44w7L2sxQgz4tu9DQvsOIvogGcmkOgMbYBIyX18wZTBzjbFtW4e5qRcDguBJNDbYcVOGODI7uYruHZvP+vf/PMzdNszHlecmMluptVJK8owJzTt15cHyw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=knM0CRIqZM69DHfllThZ0svDBIH3Ucre/k1bPQJSauo=;
 b=IFktKH5DygSi2echElGvtXAJ/EiPyCFCnFy4pGpPwrGizh0FX9IaPj3nOPk2xYN+HaX1ZdRoUWD6+AVnoVffXU1MPzjWdgcIkiC2P5rcVgQ8Gfr8wYRkrPf1Nvdmus9VYNz4rwuGF7H0yPAH9f9Z48DC83b2DnHMNsT//Xn/cNYHD6a403hsxAbeIENqKWJTg0kBV8/wsSF00Jdyy4KDWFFJd4zxabcNOoD0dh2NmpqJ/iAKoWSviMPSyYbiw1jnyLRHFMUO7Bgt6tRv1NG14nkhnzx+3Ssd7q/YRcupPEwy2oPJxjBbqf83FS4tyJa7kXAkQ6S+NeI7HtlSHxvHig==
Received: from DM6PR02CA0092.namprd02.prod.outlook.com (2603:10b6:5:1f4::33)
 by DM4PR12MB6255.namprd12.prod.outlook.com (2603:10b6:8:a4::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.26; Sun, 11 May
 2025 21:09:54 +0000
Received: from DS2PEPF00003442.namprd04.prod.outlook.com
 (2603:10b6:5:1f4:cafe::c1) by DM6PR02CA0092.outlook.office365.com
 (2603:10b6:5:1f4::33) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8655.35 via Frontend Transport; Sun,
 11 May 2025 21:09:54 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 DS2PEPF00003442.mail.protection.outlook.com (10.167.17.69) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8722.18 via Frontend Transport; Sun, 11 May 2025 21:09:54 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Sun, 11 May
 2025 14:09:47 -0700
Received: from nv-dev.vdiclient.nvidia.com (10.126.231.35) by
 rnnvmail201.nvidia.com (10.129.68.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Sun, 11 May 2025 14:09:45 -0700
From: Ben Skeggs <bskeggs@nvidia.com>
To: <nouveau@lists.freedesktop.org>, <dakr@kernel.org>
CC: Dave Airlie <airlied@redhat.com>, Ben Skeggs <bskeggs@redhat.com>, "Timur
 Tabi" <ttabi@nvidia.com>
Subject: [PATCH v2 61/62] drm/dp: add option to disable zero sized address
 only transactions.
Date: Mon, 12 May 2025 07:07:21 +1000
Message-ID: <20250511210722.80350-62-bskeggs@nvidia.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250511210722.80350-1-bskeggs@nvidia.com>
References: <20250511210722.80350-1-bskeggs@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.126.231.35]
X-ClientProxiedBy: rnnvmail203.nvidia.com (10.129.68.9) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PEPF00003442:EE_|DM4PR12MB6255:EE_
X-MS-Office365-Filtering-Correlation-Id: e9f73252-ba6b-40a6-4b69-08dd90d02d7b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|1800799024|376014|36860700013; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?dPKe1cAMvOG1eorMVAB7bhst1KC7NOR12sueRnXQI/vaV49iMBz/NtufS2CK?=
 =?us-ascii?Q?/oLae32OBxI0FKvoBzhfERJvRNgGXqpQJFJfzEVVDaMftSK4Ly3o3L74ZL3v?=
 =?us-ascii?Q?rx3xP66hvqGvCat80l/fpmb1kpy8jx7Y7pt2+KqyRo2toNu3r5zVM8faAb+H?=
 =?us-ascii?Q?aUXrdSDHvn1MInU+GXygd7mp1BTGUptz9xI85aKMAakEUPb/YwcL7C5LJdHr?=
 =?us-ascii?Q?R2djr9wTLS0VQ6hV2ONe98EMP2K1YBtwbOoCi8//2ErJw5Mvk9Jjvz8KEknL?=
 =?us-ascii?Q?N8od/BI1M1UFZ2P44zQjXdNb5RlCt+6hCSA8V5eQ45Htu172jujmTTz0Ug2b?=
 =?us-ascii?Q?CwOrOotXNAmatYXaF08HjmRC5rSVZdmRj0KXkinOHxQmyU8OWQGkkdAIedqX?=
 =?us-ascii?Q?9sOrnk3RWb5HbZ1rM4p8mrg729IYZsVWyvRL4PLEmMcVv2ttFxA2WDTpHSPa?=
 =?us-ascii?Q?DOWyo0QwoKVHTD4DkjF/x7aOqqsma0wcvA62QVlosuXNKjmJXqXO7MZPS1Q9?=
 =?us-ascii?Q?c16xhJT582g7/aDvsYUikmatRgnA/a5ZX9GqoHhcNcXvtl8W/qI0pxd+810k?=
 =?us-ascii?Q?NW5C8KxFdEWyseZVHZbcUubQg0v1LuCzYCRjuDQSCpbLKsrTijnTPkQZxWdn?=
 =?us-ascii?Q?8HuY+it1n453UyrkX1vMDttY+Kz7TdECHO72iXIUBx7QDhaZDAnh3QgZ9uGr?=
 =?us-ascii?Q?3GcpujZqe0+9U2n1bfLKWR2E0wSJygWXYYLboTVnUUS7DCr4cKP5IkAKtWc5?=
 =?us-ascii?Q?auvboxOEGsTHTs20+5yusWMfeepQmQgKOte9dpL0+If480GrpACRM0CftiDE?=
 =?us-ascii?Q?QmqX/Kjg1NmjLPXEv+q7YPdvWUC9TnqPAgaMKG9A5A7xgPlQYOWiqj1su/sP?=
 =?us-ascii?Q?TdGKSk9yGJh+LB/2Hxra91a2+m+zjMYDR9CCWoWkdO678of2OIne2Ngc1Heo?=
 =?us-ascii?Q?PjMASVg0PfnE6T2/4PUIQVfZLCS9zKIMqgtiu7OFRvUYXeRvMVHnrD25H/zU?=
 =?us-ascii?Q?ZzTYFOB9RGZIJNMkVto85oZhabzSJiI40kXfhuND/NN44IVKDeSvah85wpka?=
 =?us-ascii?Q?91MVbP24Xma7E+aG3HtLkVbI6FRkr3c7WzTBiKgLORNyFua4PqQYcgPJ+2lf?=
 =?us-ascii?Q?IpX5FrfstIAeeAPvOS1mRy/m/t5jgcnRM9JmvFK5TsyPgvaetnlBphvQFonq?=
 =?us-ascii?Q?O/rOKC1K0FPZFWypb3PzpYEXNpso8sh4CHelRJ8Hno3N7eEU7IN4bisja5Ot?=
 =?us-ascii?Q?Qq7Wk7B8tiOG13O9vLYBI74jUYu+iQlPu1bkpl5I2eMelpuaUz48EgqUgrcs?=
 =?us-ascii?Q?kfATcGNh5pQjJ+kvUyJe/gjCRtjq4/7RPdfpQaC6y3SXfZVJKkpGWL/oI+bx?=
 =?us-ascii?Q?vRzGjn+ouaRoxePgcOZOn/aaUy36+TTQ8jq87WVvuUOXHG82OrV8r+Dr2Gxz?=
 =?us-ascii?Q?sv+My60LIv50B4gTG56qQDqks/s6QgYiHp8KUuUMrLH+OSxLt7EckQbV77ny?=
 =?us-ascii?Q?mmDksHoyA+lupPfyyfprny5P/BCa9cI9F84m?=
X-Forefront-Antispam-Report: CIP:216.228.117.161; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge2.nvidia.com; CAT:NONE;
 SFS:(13230040)(82310400026)(1800799024)(376014)(36860700013); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 May 2025 21:09:54.5914 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e9f73252-ba6b-40a6-4b69-08dd90d02d7b
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.161];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DS2PEPF00003442.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6255
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
Reviewed-by: Ben Skeggs <bskeggs@redhat.com>
Reviewed-by: Timur Tabi <ttabi@nvidia.com>
Tested-by: Timur Tabi <ttabi@nvidia.com>
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

