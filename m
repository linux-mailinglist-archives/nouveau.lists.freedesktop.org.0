Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5130D844A32
	for <lists+nouveau@lfdr.de>; Wed, 31 Jan 2024 22:40:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A48A210EB22;
	Wed, 31 Jan 2024 21:39:48 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2056.outbound.protection.outlook.com [40.107.237.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 989BC10EB22
 for <nouveau@lists.freedesktop.org>; Wed, 31 Jan 2024 21:39:45 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eC+WRR6HFK00GTpNQSB2isQA3+KxN2BZEPAeykppQsunjC6AL8uW/KH259xXfeE7E/iSy1kNdmbBsxbmQpsAWfR7f8GegbSrg9vrbiv7QqvhPn/KilwXtC1nrezgZy8dL8Ckrf3o3LKNl5CoX9TkZ2Munlyi0v+3lSmnmEQG08jYx7hO6t4H07yGLEtB19GoICFjnIDPcWOtDu35PM0NFDnaVFkyIYbTfkfozsaDrL62xBBYLNAvM1+G26LJ/HyeEJaWyu5yAt4fTWuIn7pWoUXWRnA+o0leHsoSQ6lmdGglD4lLfaRsX2POsGba/p4iUO/zEgHLkGZE7jdtNRwJ9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MldMFrR410igdVLfuhu8qEnMy3FX0rEfyDzViQOUeVA=;
 b=LM33XkGK5S3VRxn0qybIkZtWN+Q4zQz7VbabC1JRLZ9KfcyBwrBCtaFNVKC8NJLOqwb9Q2n7K1wV8NUQsYaWS/36DG2tY7Tf408S0q3ehZEsec0n7CnMa318U1QTnocAcze7sNolChmW2qkSC6MohbNp1H+ywIBD8/YEb32Fkp+DyC2+HttFK8yITgc66urKTYTjHrb4FXi5sWhb4jC1AibMufTf2r3hHtoYG3a64/1s5OsS7QD8tbqDOobSVS9IfigpNHFkDPUxOmFpFkNOEYjnGHq3j5T/M6f4FwthuXfqU+wXxmaPgooid432plrzNO8BTGOayv55pwWpL2h2xA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=redhat.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MldMFrR410igdVLfuhu8qEnMy3FX0rEfyDzViQOUeVA=;
 b=PrKeiJeLWaaLGueORklJ+XGzFqGfurRA8KW9+mhwijhyEGkveR7N3QWFY09G4unkCANorGngZQexnPl35rls24emEo9PXcXK6KFHJFggDrPIJJG/25EyXTyGp2HB2KBj6UekcYIEZ3XRdH/RMq2Lqdb6K/9RyR8q0Q4tKsLKRMVV3avOgOXVNTl/B35AuO8eC5DYY6OkUYb5GX0mMRNNRGd4b5goQ3NHEEpyrZBkGoOq8BwpKj/qB1nW1F3bSbXLQ84NTE7E++cC11Djz4ZezSGoSSDrmHjTEOH95a4B0Fn3ga0YjF7XW4Q6h7l1y5p/s88mJ7WonnX/A+cRb0cXuw==
Received: from CH2PR05CA0062.namprd05.prod.outlook.com (2603:10b6:610:38::39)
 by IA1PR12MB7566.namprd12.prod.outlook.com (2603:10b6:208:42e::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7202.34; Wed, 31 Jan
 2024 21:39:37 +0000
Received: from CH2PEPF0000009D.namprd02.prod.outlook.com
 (2603:10b6:610:38:cafe::25) by CH2PR05CA0062.outlook.office365.com
 (2603:10b6:610:38::39) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7249.22 via Frontend
 Transport; Wed, 31 Jan 2024 21:39:37 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 CH2PEPF0000009D.mail.protection.outlook.com (10.167.244.25) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7249.19 via Frontend Transport; Wed, 31 Jan 2024 21:39:36 +0000
Received: from rnnvmail203.nvidia.com (10.129.68.9) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.41; Wed, 31 Jan
 2024 13:39:19 -0800
Received: from rnnvmail203.nvidia.com (10.129.68.9) by rnnvmail203.nvidia.com
 (10.129.68.9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.41; Wed, 31 Jan
 2024 13:39:19 -0800
Received: from ttabi.nvidia.com (10.127.8.13) by mail.nvidia.com (10.129.68.9)
 with Microsoft SMTP Server id 15.2.986.41 via Frontend Transport;
 Wed, 31 Jan 2024 13:39:18 -0800
From: Timur Tabi <ttabi@nvidia.com>
To: Dave Airlie <airlied@redhat.com>, Danilo Krummrich <dakr@redhat.com>,
 <nouveau@lists.freedesktop.org>
Subject: [PATCH] drm/nouveau: nouveau_sched_fini() should check for init
 failure
Date: Wed, 31 Jan 2024 15:39:17 -0600
Message-ID: <20240131213917.1545604-1-ttabi@nvidia.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PEPF0000009D:EE_|IA1PR12MB7566:EE_
X-MS-Office365-Filtering-Correlation-Id: 16170854-4ff7-4a3a-a0a9-08dc22a51f54
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: x+FUKo7vUvDqq03RzxtGTUtQHT/oWnhPiksFRKc3zxcAXtjgFJdZw4zMiQderTctHRkzSJkBu6lBR8MwKaxZ0IHTGQxYMVzu4Aa2ivx3dqh3Wi6yrHctkXJCGbrxaXbRNSmj7ibYAgm19rkECvTUU5n9Y7EyYEXp6V7r5PqVIV2rb4e9aW14r9tmeDGdeOvRJ6i/yTsArKqMAH0WO+QCc9KJF9H3q++Y+xB2s7sOh4Wa1EHoFGDn8Gk1bsy2PICiPosTP6Ml/wT+QCuGhGySol1DQrUarL4bm1o58BdP9jkcqDWOLgVjK9s0OEVR0FAB9+lNUyVbZ+hToyfTk3cDlo9jI6BT3DlBZRtSGqSCtYQXJyL+pmMgUxqyv1zC6VLOX0NA0fn8IA3dwMHcdbW2P+3TjbR1T5G+XHYT7V80t09obryCXVIvjIOpMdVaO87ZjzRE3lyy3giwEtGtvQ5JpDaOZvv3JASN53YHFhFh/AIxfItX428AKaXaDtdiT2q64kZdG24zYcGImtPlwiV10yI1vFWyC9nnO2XCD94jUwI6YELByGBNaeA76ZNL67mp+JCiAtWu/tEsAHgGnr+kLMhqQtZziBreDTWCTro7lDEUHYX66ftLxdeGoRi83n9+GtPXmrL49klzD757UErMEimLJBnF567NvXh8+wL7Lz2XkjgInuqPC4E9V4Xac9G4S9hog1O1/JiTXcPvhd0d7jrFQ7tsayWTh4b0MLoeno9zEbgq/Kgng9PH1JHjGJrq
X-Forefront-Antispam-Report: CIP:216.228.117.160; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge1.nvidia.com; CAT:NONE;
 SFS:(13230031)(4636009)(376002)(396003)(39860400002)(136003)(346002)(230922051799003)(64100799003)(1800799012)(82310400011)(186009)(451199024)(40470700004)(36840700001)(46966006)(478600001)(5660300002)(7636003)(356005)(2906002)(82740400003)(36756003)(86362001)(41300700001)(336012)(426003)(83380400001)(2616005)(26005)(1076003)(7696005)(36860700001)(316002)(8676002)(8936002)(110136005)(47076005)(70586007)(70206006)(40480700001)(40460700003);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jan 2024 21:39:36.8793 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 16170854-4ff7-4a3a-a0a9-08dc22a51f54
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.160];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CH2PEPF0000009D.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB7566
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

If initialization fails, Nouveau can still call the _fini() function
to clean up, with the expectation that the function can handle if its
corresponding _init() function was never called or exited with error.

Such is not the case with nouveau_sched_fini(), which still attempts
to wait for jobs to finish even if the underlying data structures were
never initialized.

Fixes: 5f03a507b29e ("drm/nouveau: implement 1:1 scheduler - entity relationship")
Signed-off-by: Timur Tabi <ttabi@nvidia.com>
---
 drivers/gpu/drm/nouveau/nouveau_sched.c | 5 +++++
 drivers/gpu/drm/nouveau/nouveau_sched.h | 2 ++
 2 files changed, 7 insertions(+)

diff --git a/drivers/gpu/drm/nouveau/nouveau_sched.c b/drivers/gpu/drm/nouveau/nouveau_sched.c
index dd98f6910f9c..9c771bc0e332 100644
--- a/drivers/gpu/drm/nouveau/nouveau_sched.c
+++ b/drivers/gpu/drm/nouveau/nouveau_sched.c
@@ -443,6 +443,8 @@ nouveau_sched_init(struct nouveau_sched *sched, struct nouveau_drm *drm,
 	INIT_LIST_HEAD(&sched->job.list.head);
 	init_waitqueue_head(&sched->job.wq);
 
+	sched->initialized = true;
+
 	return 0;
 
 fail_sched:
@@ -459,6 +461,9 @@ nouveau_sched_fini(struct nouveau_sched *sched)
 	struct drm_gpu_scheduler *drm_sched = &sched->base;
 	struct drm_sched_entity *entity = &sched->entity;
 
+	if (!sched->initialized)
+		return;
+
 	rmb(); /* for list_empty to work without lock */
 	wait_event(sched->job.wq, list_empty(&sched->job.list.head));
 
diff --git a/drivers/gpu/drm/nouveau/nouveau_sched.h b/drivers/gpu/drm/nouveau/nouveau_sched.h
index a6528f5981e6..351931c706aa 100644
--- a/drivers/gpu/drm/nouveau/nouveau_sched.h
+++ b/drivers/gpu/drm/nouveau/nouveau_sched.h
@@ -109,6 +109,8 @@ struct nouveau_sched {
 		} list;
 		struct wait_queue_head wq;
 	} job;
+
+	bool initialized;
 };
 
 int nouveau_sched_init(struct nouveau_sched *sched, struct nouveau_drm *drm,
-- 
2.34.1

