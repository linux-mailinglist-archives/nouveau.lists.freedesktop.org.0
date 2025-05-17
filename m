Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E2AEABA737
	for <lists+nouveau@lfdr.de>; Sat, 17 May 2025 02:11:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 879BF10EBEE;
	Sat, 17 May 2025 00:11:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="pStjA5Nd";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2068.outbound.protection.outlook.com [40.107.92.68])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F35710EBE9
 for <nouveau@lists.freedesktop.org>; Sat, 17 May 2025 00:11:53 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SHE7nfcqdsPwCZahixNed56qHYSpjDjJViTmpcesIwbEHFwiDxIXUxyH3Rz/7vc1XUBcyvIN6xO1GutkhcK40FX/y4NYbtKf8HPx6OBtKVhtZHRHVam9VvpZhWHbTCk97eNbAazSyXu7wt5eNuTKdJWx83zYXISyIICJdqHKW97pW+6xTXfl3Qo7pyqS8nGfcL6hnmcZr9HeSuZMsrfvJiHL8UqzhucnbBjSg7bJL9+1L50LSFt2gVUVSugZTpOnonbGalH0JOaOh2OvCn06eCdJr81+Rnaq/cHqMKfgi8zUWwRT9ITyJ7Zjm2CNaxgoxTSxHfwpmkecKv0kHta3GA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=y1+L4/Zo/3BCCO5xx8jSJRo6IYO5v2KQfLDSoS3YBGM=;
 b=iMb/Kv6WqSp1zCRWliLgO6YswDVR5f7vPAWp3c8doVmwOBNoomBpwhQHtsAGVGetjAm7FoqaYl7omranhZ1g8tTU2jvuqW+Md5TmIbDqDhoUPTWa6cFA+K+ocv/PP+JEpwAWkqA8CQj3oUX+mLRX8Ee6f64hbH6Fdv1BFP4g4Hp1lWspI9+4w6mzC9C3XFrOGIc1I9MPpnw4wShj1WTW0yN4d8xB6gZ3PllkcyxssM8Z3KBWxEIUY7bWferYzNabaxoLD7wW4Fw6eQIujAeXdrAq0ilxXPgtK5MTz3iVUSYtj+oCRFKSc54WvwQ5MBfJ9ZroJpUkmLX1bOPwVq1Kkw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=y1+L4/Zo/3BCCO5xx8jSJRo6IYO5v2KQfLDSoS3YBGM=;
 b=pStjA5NdK6oKp9slGJkl5zFBlwotZ30Tm1B4t/gJvjHQnjeAOyJwteVwCid4NEwuE5PNmQ19vpjJ8LnyOga0M9h/3b1ugItYO0gKu86Gatkqnr6xZ1pMEHYGuJtdFfM4lQc2FwkLMpzNTLoXQAmxxoe9kTQZtiq3KeJfbM/hWF4p+e1rqi8p4VhM79/yN85nBiIuQEXqVwFN7Xn0bQrRyojcrcHlGES1eV35u8UAikQACB2l9b6960hKQLfWPNOR26xxjuPHkaLruIOC5GgLco9NpsKKqyp5DU1ge5TseX0SeJ4n5iZnjwmIF2C70/ErccLK+wgPK73rFv7dUXCNVg==
Received: from CH5P222CA0024.NAMP222.PROD.OUTLOOK.COM (2603:10b6:610:1ee::9)
 by SA1PR12MB8642.namprd12.prod.outlook.com (2603:10b6:806:383::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.32; Sat, 17 May
 2025 00:11:50 +0000
Received: from CH2PEPF00000145.namprd02.prod.outlook.com
 (2603:10b6:610:1ee:cafe::c) by CH5P222CA0024.outlook.office365.com
 (2603:10b6:610:1ee::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8746.24 via Frontend Transport; Sat,
 17 May 2025 00:11:50 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 CH2PEPF00000145.mail.protection.outlook.com (10.167.244.102) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8746.27 via Frontend Transport; Sat, 17 May 2025 00:11:49 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Fri, 16 May
 2025 17:11:38 -0700
Received: from nv-dev.vdiclient.nvidia.com (10.126.231.35) by
 rnnvmail201.nvidia.com (10.129.68.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Fri, 16 May 2025 17:11:36 -0700
From: Ben Skeggs <bskeggs@nvidia.com>
To: <nouveau@lists.freedesktop.org>
CC: Dave Airlie <airlied@redhat.com>, Ben Skeggs <bskeggs@nvidia.com>, "Timur
 Tabi" <ttabi@nvidia.com>
Subject: [PATCH v3 61/62] drm/dp: add option to disable zero sized address
 only transactions.
Date: Sat, 17 May 2025 10:09:53 +1000
Message-ID: <20250517000954.35691-62-bskeggs@nvidia.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250517000954.35691-1-bskeggs@nvidia.com>
References: <20250517000954.35691-1-bskeggs@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.126.231.35]
X-ClientProxiedBy: rnnvmail202.nvidia.com (10.129.68.7) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PEPF00000145:EE_|SA1PR12MB8642:EE_
X-MS-Office365-Filtering-Correlation-Id: 38c7f7fb-2979-49f6-67cc-08dd94d76ba2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|1800799024|376014|36860700013; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?SmFuIUlRsol6GfVbGgRhC3XuXpUCiDAyc2F1dUpZJOs53caK1hxREsu0gSyH?=
 =?us-ascii?Q?1+mQ47FpQ/vM5jQdM19anviICVTn9yIib0H3yytC79tltXD7LnXVjB5P/8uk?=
 =?us-ascii?Q?5MEOFLt/LM6Z6x4iC8vbivhMIgS6rqAc1+EDYY8DR1BZmR/z6DK57Q88esfz?=
 =?us-ascii?Q?59AwUgjbVJDe8Skh28twYBEvMAB/g3ujJCCwvdzdrQNdRik4zgJGV5sTpELk?=
 =?us-ascii?Q?2KsCfA2TdrmRPqmY16Gv8WhLGNUKeCZ6tBADL4i9YyynIiL/36n05tImzGJf?=
 =?us-ascii?Q?383PowC7OjVMS9xGm3pGQrwL4XC25eSz4DawQkzC2UCofs0QByJRw8n9Uv5C?=
 =?us-ascii?Q?NdRvTrO1co/1iL7Mga0D9nKSIN3uW/GnR+59HNXWgybV78gTBeTwYyA0evVy?=
 =?us-ascii?Q?Gg1S2yWvs5mBfqzb/HcVCxokn+sBgcz1i+Et5dmFiFVqcfxubu0vYVajFq1U?=
 =?us-ascii?Q?iO0oPgy2QTCs+qVLdjmy7BN2AjNnN6t92IC17xQP/KPlv8uKi1QmGtiXYpt3?=
 =?us-ascii?Q?8zAewByDtRud+ClYHoq+Nr1IG43kOxZ8E+i4HrNyjp9+3G3kXU3cm4XVh2kp?=
 =?us-ascii?Q?MD8AL8Dy58sgQ4WkWVI6wd2l5Y2gMxEDfVgjfpkCVLQ6cjkv8m+hogjjenLA?=
 =?us-ascii?Q?qr4H5zXmo7r6djj5uZiCy3xRNwTT0uCI2GnLkFoj1tZClE1v85ZUGpjRoIKc?=
 =?us-ascii?Q?ZTZcIrnVDtIm4gkzElYndrXbF0XDI1xDdg3e13M5vd4Eu2KftPC8WgkmVhx1?=
 =?us-ascii?Q?s0uZLuMUx3zJm2R8ToUbyftdWSSFE8N1JctHRQajRJA9ZC/tvhdqDmbMUl1M?=
 =?us-ascii?Q?iSzWNiJcQrGf1LjK4reNzXtuAkWZpVUwSFPbGVZbGi7mBtoj6l5NrSv8rZgI?=
 =?us-ascii?Q?3EGx7M90prn1Aflteas3DQrh6W9oJQk7tirqIwwbJdD67IvzSnuUUkiTzXSe?=
 =?us-ascii?Q?pusWiAjmiYLDKpO0htfbebl4gUfqViy2s5ORuwM/3Hj5w2NytepZzF3v7JRG?=
 =?us-ascii?Q?gYIzus4P8KN6ZWdgMSI2enrKIfZE9ALDms1yMZL96Ge2oCZbe6eVq53IKfWP?=
 =?us-ascii?Q?zhVybxn89EtrG/EQE+n16EQkWANmf1uIqjJoBFzzw2ZcaOv1pGUM1a4FikXc?=
 =?us-ascii?Q?IKPre4e8XJH9u8yxcaOK+gKfpmU/rc9ZRAJgapDf1KuFVh8MYGwYjMSZp2Gq?=
 =?us-ascii?Q?fLHEICBnwq1a0w6AU+v98Tg3OCPssvXLlAi9TRIQRphUyecU1f7Fzx31xN6F?=
 =?us-ascii?Q?fkCjGkkR2V5cOD4XDRuDqEaBwlHBeYMn0sRIaeBEr8OcahDHvZQN6+WldJla?=
 =?us-ascii?Q?2Frz7clvt3+iVM6RkHupoYNVG6/Mz7Q93/gtn77KkZwB4Vjoj0hwxUnj3Z35?=
 =?us-ascii?Q?MltFFk0oKJRmXWN1HyGH4Qhi1CYJVRAOgtmGGlU7/j7GsqNF8ONhUi6rGlJj?=
 =?us-ascii?Q?EROjlg/TKQ8GlyYJ4h6LMOd1n9uPXR9K7X/kZghEDl/Ak7XQf3WK3zoTt9au?=
 =?us-ascii?Q?uYVxELu6hDsb3UPJ2ZAl/bQ7MkaOmhuttxlK?=
X-Forefront-Antispam-Report: CIP:216.228.117.160; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge1.nvidia.com; CAT:NONE;
 SFS:(13230040)(82310400026)(1800799024)(376014)(36860700013); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 May 2025 00:11:49.9529 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 38c7f7fb-2979-49f6-67cc-08dd94d76ba2
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.160];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CH2PEPF00000145.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB8642
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
Reviewed-by: Ben Skeggs <bskeggs@nvidia.com>
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

