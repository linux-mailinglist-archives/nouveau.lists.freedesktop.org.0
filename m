Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 408378A78E7
	for <lists+nouveau@lfdr.de>; Wed, 17 Apr 2024 01:42:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 671E3112F6C;
	Tue, 16 Apr 2024 23:42:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="CqnfV7D5";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2078.outbound.protection.outlook.com [40.107.220.78])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F283112F5D
 for <nouveau@lists.freedesktop.org>; Tue, 16 Apr 2024 23:42:00 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=G8exiM1t9PfFsxfvNAzSV0OkzFMrAxgNk+FtqpuhbcGoM1a6F9VY2mNUZXecmYF5UU7/0HvYSVwYSPwNRuMzV1Y66tA3OWykt02K7Q9Up8G270XkX6SuCSFC0IA9PzhhuILp6WSDVYe5zZM9HHTQPCWXg3EOPaF8EpPKoSiYmkxn4QmDYa3ghAkbwRZk5inArlSPqf0Uuqux+FcVBGmehUTkXeD0P8dEmDpYxjMa21mIhmKe8DbU1ROEHAeAzFa1gm94Ak8H9hYjRUudpA7WRm6azDrpgx7j2lK6WZjc8bmpvj1fnFJckJKNdqeARuAG/vBo3yKpOcOeCR5vBXkqvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PipwIWzsWR+jQE9E07GrKTcZ71qoiUWoCUSkJLs8Clw=;
 b=do7dfNRTGCzlKN5MkgfLrFyHHYOBB9tR5P1IZlnh5mT3yebHwfmWx56JkRcLfy8Z+6EilreGDvx5h12wQ/p588cTbmlXr2dwMA/kqjn9xkcy6YYhjU93cD02EgobGSmGwmP6SFrBeGSa+XXw4Pa2af6lr6c9y+ScoDAiXTHdyD6Y8gv5+Uk3+c4rM6sel1FQ/m9oBJZTK9WvvNsMq44K++Zwf+LvrA9OYWTtbKQcvAEyWMsgb29RSU57WJezcBolWfEdgOvqHM6tCms1cJX7EvZ/RuoTcZgcnIftPNrsKSVixj9zJmq6L4P2kzY2wK26z9HsXiXs5a9feFfJFHLdxw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PipwIWzsWR+jQE9E07GrKTcZ71qoiUWoCUSkJLs8Clw=;
 b=CqnfV7D5qbMbFs8hOT8yXCQcfz+dj40w6Th4QfEwzWBspj8q2rKadyJM+QzEN6xaI0mNszqlp+TYz9LrYrbDsmVWq/G2unNA6Tki/2IdWx8pKGgZsWEPA4M0RC3QUL+fgpgrcxrpF60YrGxRRxwkdaZ1hI4vxVWIRYix39Hdqaq+TefRQj94hL6Hxg2+p0CxStQ9A806+ZZlNFioBFW6tDRFC4BAXWdAbfclc2U0Pgv2oPdJlNrIBp7mfJThXltnGg/cZqxdxpQl7yqlntCpl5eMPmj4nKTitUPThxBs6CTspSFJjF2xdtP+sfmpqQTw4mQLX+ieHeJaeSmoqUBtmA==
Received: from MN2PR19CA0035.namprd19.prod.outlook.com (2603:10b6:208:178::48)
 by CYXPR12MB9387.namprd12.prod.outlook.com (2603:10b6:930:e6::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7452.50; Tue, 16 Apr
 2024 23:41:58 +0000
Received: from BN3PEPF0000B076.namprd04.prod.outlook.com
 (2603:10b6:208:178:cafe::2f) by MN2PR19CA0035.outlook.office365.com
 (2603:10b6:208:178::48) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7472.33 via Frontend
 Transport; Tue, 16 Apr 2024 23:41:58 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 BN3PEPF0000B076.mail.protection.outlook.com (10.167.243.121) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7452.22 via Frontend Transport; Tue, 16 Apr 2024 23:41:58 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.41; Tue, 16 Apr
 2024 16:41:37 -0700
Received: from fedora.mshome.net (10.126.231.35) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.12; Tue, 16 Apr
 2024 16:41:36 -0700
From: Ben Skeggs <bskeggs@nvidia.com>
To: <nouveau@lists.freedesktop.org>
CC: Ben Skeggs <bskeggs@nvidia.com>
Subject: [PATCH 058/156] drm/nouveau/nvif: add alternate version of
 nvif_event_ctor()
Date: Wed, 17 Apr 2024 09:38:24 +1000
Message-ID: <20240416234002.19509-59-bskeggs@nvidia.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240416234002.19509-1-bskeggs@nvidia.com>
References: <20240416234002.19509-1-bskeggs@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.126.231.35]
X-ClientProxiedBy: rnnvmail203.nvidia.com (10.129.68.9) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B076:EE_|CYXPR12MB9387:EE_
X-MS-Office365-Filtering-Correlation-Id: dd3a082d-e17c-472b-e9d3-08dc5e6ece6b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: xJlGBFinFE1dIHAXPjkqDpVJC/uRAvqALzy6gbfpF4YnaemEu0bXfuoMa6smcXYlEBmQ8F0ANZQPIG5bq3CcpjolKvZdjc4mH0hGi52oF2CuFAg8raZuDsu8dnnXdqzcDNYB1VLutz9qdn+6PMS9Ax8jU3OwlwUD03fbBekydVGyEptyDFusZoRkbxotw4WNp4QPr1dtFwPtUr0tdCSb+PwW72hoAoUXpZhjBbgfBuxjqw/dR+taEecxB5Gl9TqgT8cl5D1b9hwzWwUJEFWUasKQJdwtQHQef/6bAR/SqRolLlNGB9JnZ7VMoi7FrhszTri2E5IV//haTnG/AuGmGNZnhVrM9CRAmErv1Yk7af/nGz7diX/wbpSUpucarWb+yWapwWC6U6vSVeiU2y3I2XmPRRcWgO0dtitZAZumZHs3PmiRbmIZNpRBLjs+ZDzPFBQKOTdeSS6iBF+tHfQkkBo36xjbvprA7CwKiradEnc34YRN1jfXSiHeu2UNCdhXNDlqPU2Yxh1GRpHIHeg+3CaV8y7ISdNnOvFYPNgTF3RI8ljwr9qQiC54taIpvbnPfO5bLLilrNbCpWGhGMamUKYfyYE+22u5FYEAVZgqh4N3UQ7jmq0giz/bo0750etdBD9ZGM92HOLgY+3R/Vs99/vLLsFzct+IJ3SuqIJCXOw+oZ5485zm8YOil80gpW71JNCpv+aWyeNy+RN+0Ka7t5xZ8SpTq4/7c2+947EOuxLH+KGBYwOMjZBvUSh6RMfP
X-Forefront-Antispam-Report: CIP:216.228.117.160; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge1.nvidia.com; CAT:NONE;
 SFS:(13230031)(376005)(36860700004)(1800799015)(82310400014); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Apr 2024 23:41:58.0328 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: dd3a082d-e17c-472b-e9d3-08dc5e6ece6b
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.160];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BN3PEPF0000B076.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYXPR12MB9387
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

- callers will transition to new args in upcoming patches
- some macro trickery to avoid temporary renames, will be removed later

Signed-off-by: Ben Skeggs <bskeggs@nvidia.com>
---
 drivers/gpu/drm/nouveau/include/nvif/event.h | 18 ++++++++++++++++--
 1 file changed, 16 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/include/nvif/event.h b/drivers/gpu/drm/nouveau/include/nvif/event.h
index 68bf6635841f..1683e138c7f8 100644
--- a/drivers/gpu/drm/nouveau/include/nvif/event.h
+++ b/drivers/gpu/drm/nouveau/include/nvif/event.h
@@ -24,12 +24,26 @@ int nvif_event_ctor_(struct nvif_object *, const char *, u32, nvif_event_func, b
 		     struct nvif_event_v0 *, u32, bool, struct nvif_event *);
 
 static inline int
-nvif_event_ctor(struct nvif_object *parent, const char *name, u32 handle, nvif_event_func func,
-		bool wait, struct nvif_event_v0 *args, u32 argc, struct nvif_event *event)
+nvif_event_ctor_0(struct nvif_object *parent, const char *name, u32 handle, nvif_event_func func,
+		  bool wait, struct nvif_event_v0 *args, u32 argc, struct nvif_event *event)
 {
 	return nvif_event_ctor_(parent, name, handle, func, wait, args, argc, true, event);
 }
 
+static inline void
+nvif_event_ctor_1(struct nvif_object *parent, const char *name, u32 handle,
+		  nvif_event_func func, struct nvif_event *event)
+{
+	nvif_object_ctor(parent, name ?: "nvifEvent", handle, 0, &event->object);
+	event->func = func;
+}
+
+#define nvif_event_ctor__(A,B,C,D,E,F,G,H,IMPL,...) IMPL
+#define nvif_event_ctor(A...) nvif_event_ctor__(A, nvif_event_ctor_0, \
+						   nvif_event_ctor__, \
+						   nvif_event_ctor__, \
+						   nvif_event_ctor_1)(A)
+
 void nvif_event_dtor(struct nvif_event *);
 int nvif_event_allow(struct nvif_event *);
 int nvif_event_block(struct nvif_event *);
-- 
2.41.0

