Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EC1E993CD4D
	for <lists+nouveau@lfdr.de>; Fri, 26 Jul 2024 06:39:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A19A110E90F;
	Fri, 26 Jul 2024 04:39:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="tGPROnS/";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam04on2074.outbound.protection.outlook.com [40.107.102.74])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 210AE10E2AB
 for <nouveau@lists.freedesktop.org>; Fri, 26 Jul 2024 04:39:31 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GDNjlbv2fEzhq38VR7Cmlp16J6DsJe38com8e7WrjZ+Mkk7gFajiU/Hp2TrSfaUCyPm0WUj/g48RxbqiWqoJ+cZgUNCRJtA3n817mhkC7qNwXZ0kpjq2gORaJwQDt3/M2ZTCbmVdDSnv7jLKgrkSteVEn2sD95iFSrmu1GK+GMglf+OAhdtxwNt7I7JIvmvcgGkkpucR67MN6Hqqb1niIaxNUUVU8lcDOv9ksKO26jXNbur+07qyOZuFrIgSjcAQLxNCxweYePz/5sIXpvyRQ+JhiVMN8xhaoSTXjAhHpNzVLOYyVWFmke80SQwBOPzoX1AJAgUoUnGnfOG6Sj608w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=u7EdDI3hc+P38Y4y+qdUQHKoBCVqGn8o9cmJgKL5vgc=;
 b=varzFseiQNMFA28Utf6GxGJp7fwgAG4vF2EDQhv8pi99noxOQN+2CagjyZE/Iv91LEYM0eOGiylKzlz+Z89qY/0gqXeB7LrGgKujn4cXNmmt/IItPZF6HUI76fDm5Taqu7OppLnwRR3rEvOLlmkiU2QwNRTOnOkueCxH0XBgqd4wfmTbegGLy/QjbEaeEE3hL2y2K+cAbg/FBRD7f+ZMPNuvaVjOQ/c/Jeyun5vx77Sa+MmQdA24oBCN6UjWmTrtpFtIftIT3NQBrmDa4a8H6CLEK5iWK9Kyo8vNv+e3JcRjdWTaBc91HxWCXyXPfnMqNqtd1yvTZ1Y5jlygTBY6DA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=u7EdDI3hc+P38Y4y+qdUQHKoBCVqGn8o9cmJgKL5vgc=;
 b=tGPROnS/4x0MmOh+3oaJzGU+a8/MWbQLlxLQ+hZzOcSjUPMcnQtQG9gOXccgbzPY1lQoxcRH7j0j550jH3YaMrS38AFN09mppbTK3Y1x/u4k3q6Lt/k2QGzTGsZYCH6wu7F1XHL57RP6hpCjEloGTEnpfU11XRllXb5OhS0SvuuLKbBLUYpLkopzmYbbQJ1wxMZoR/MHLIHeXsqj9WgwJJnvQK7DXqAPSJjS2eE2Hfyl7p6X34FIBzWDBEJDaDcGX4gXtmToo7XUUZVBelV27gx4bYnpzeabUdTa8tSQ6sIj8IA9CxsvonE00uNQe7ZXRmxGLZWcr5Rm4ttuaXjCcQ==
Received: from DM6PR08CA0056.namprd08.prod.outlook.com (2603:10b6:5:1e0::30)
 by DM4PR12MB7694.namprd12.prod.outlook.com (2603:10b6:8:102::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.16; Fri, 26 Jul
 2024 04:39:26 +0000
Received: from DS1PEPF00017095.namprd03.prod.outlook.com
 (2603:10b6:5:1e0:cafe::65) by DM6PR08CA0056.outlook.office365.com
 (2603:10b6:5:1e0::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.16 via Frontend
 Transport; Fri, 26 Jul 2024 04:39:26 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 DS1PEPF00017095.mail.protection.outlook.com (10.167.17.138) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7784.11 via Frontend Transport; Fri, 26 Jul 2024 04:39:26 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Thu, 25 Jul
 2024 21:39:15 -0700
Received: from fedora.mshome.net (10.126.230.35) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Thu, 25 Jul
 2024 21:39:14 -0700
From: Ben Skeggs <bskeggs@nvidia.com>
To: <nouveau@lists.freedesktop.org>
CC: Ben Skeggs <bskeggs@nvidia.com>
Subject: [PATCH v3 22/37] drm/nouveau/nvif: remove client fini
Date: Fri, 26 Jul 2024 14:38:13 +1000
Message-ID: <20240726043828.58966-23-bskeggs@nvidia.com>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <20240726043828.58966-1-bskeggs@nvidia.com>
References: <20240726043828.58966-1-bskeggs@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.126.230.35]
X-ClientProxiedBy: rnnvmail202.nvidia.com (10.129.68.7) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS1PEPF00017095:EE_|DM4PR12MB7694:EE_
X-MS-Office365-Filtering-Correlation-Id: 5abfff37-cd78-49af-d551-08dcad2cee53
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|36860700013|1800799024|82310400026; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?M5coNtKGPHQSoiS+L+KVdAsa7f8QAQWUHLUjs+5MzXzdClusiXv3/skpzFfV?=
 =?us-ascii?Q?zH31oV3b9VPz6fevBiZBGkV/ENR1qJjE0vebV1AQU5jbyFVt4y3eSXc8ZW3I?=
 =?us-ascii?Q?jikZiz5mH3L/Ri0kwx8Y1qGMexunXKSuA4onlOiveAP6xy5CSIiJv1fAIaPF?=
 =?us-ascii?Q?7kmgmpRrDsFov4CLIcxWGsloXu+6YewrZiQsJpF9Xuhrj5rZ0nYGP68feuEC?=
 =?us-ascii?Q?Uhefdt8N1osnUJfC31cqTU90d2eRKGsdcKCrNqiTPVG8PDO921+nTfqrH0FC?=
 =?us-ascii?Q?A82gqLejWU76hb9hr4ai6JY1fj9yIIZo6lC47I3CReFkSUiNn17yij5QpJE9?=
 =?us-ascii?Q?LlSWRaniHntAuAMPG5Z+Ej5du5hCqls5sGIrgpkuKKMtOfhLYEC5njPLcg9E?=
 =?us-ascii?Q?tcBcx3egTPATGYDG6yMmOvKwaoBih5O+l45Qd8yIeRF27fk496dVrB7M4s9F?=
 =?us-ascii?Q?vQYuE07iMHJkuJgW5qozlzvM8+a0DPC+H9VihXK5am/fBGjECTMtwIkRds98?=
 =?us-ascii?Q?vvCnF91rcGj4JpVQXsIqIYk6cz82zUj2phywAow7tTfUhWWpc5NqSpDx7eWc?=
 =?us-ascii?Q?AONJ991uxT0XdRCm7UuNz5Dv12+j8Yh9NCvZo14VP0Cybarz0k+3KJGWrZN2?=
 =?us-ascii?Q?VD0+H7mSgabNLSzxlMrDvkXlx1OMqWOwdHyvJYU3fIAc6jd0lCDiJkR5OJQc?=
 =?us-ascii?Q?R32o8LYOlIcWw+wUc12mx25LfpWfJHMWxfQgbrGWJiQyzbx3Zr0AqBCnQdEC?=
 =?us-ascii?Q?zbfGI+L4lCf+vY2b1xb38IVE43b9EPFBgwcAH4emV+VK9VRSQSlw/NcdcAQ5?=
 =?us-ascii?Q?nXfHO0d2FoxtHGy9c/cs0F6mSA5KGQysdBp96ZCj9k5z0+OxfWdTfnC+SHBy?=
 =?us-ascii?Q?KuNYn4x4WjhXBkq2YtSCKlKzhmEcrsotgVusUl+2mdMMSUxgyPKR8u2ipquG?=
 =?us-ascii?Q?NFp4tTCoODCX3mrVDShWGNlLPTVd0/+H/VOtLrH91T+01ZnLuLB4MJsX6Z1u?=
 =?us-ascii?Q?kKnXXNQ2SnGg1Xm9LcgOTz9hkPIbJrbVLWftu73c5r/sCSpEavJYyFne7UIo?=
 =?us-ascii?Q?aHALF0jwiLQXgnbsN6r72jrkJXLqMAiU5wh6aGyLMnno7JBM6xuSQwP20Ult?=
 =?us-ascii?Q?QSLgHnoDDndguBg4+RqA/Biz+xto6EJeNFfwLr3QTiOmyojILjLXlismvFyY?=
 =?us-ascii?Q?f6fgI93hcZS8rgO8gQUb38a/xokp6urutHEXYE23jI4VUNIwZ5dUSi8NgLZg?=
 =?us-ascii?Q?hbuseaVwFqBCt5act0KW4IJneFsxufv7ivo9x8CdsnKS86oiRYo+hIyalSDp?=
 =?us-ascii?Q?V8fO8vAPb8snF3BytpLQE6ZytksUiQhdRCIPXuaNiVqLisUmgovmBizN1J/O?=
 =?us-ascii?Q?pH2JAYCDLTPkrmnL5lr1hJg6/y1t4GnOf+Pays/1oap7ZWE3eNVFQ1n4zhZu?=
 =?us-ascii?Q?p0wL4BgR8cc0xsVk5hsGQNDiDQjrMNN4?=
X-Forefront-Antispam-Report: CIP:216.228.117.160; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge1.nvidia.com; CAT:NONE;
 SFS:(13230040)(376014)(36860700013)(1800799024)(82310400026); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jul 2024 04:39:26.6843 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5abfff37-cd78-49af-d551-08dcad2cee53
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.160];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DS1PEPF00017095.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB7694
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

Does nothing.  Remove it.

Signed-off-by: Ben Skeggs <bskeggs@nvidia.com>
---
 drivers/gpu/drm/nouveau/nvkm/core/client.c | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nvkm/core/client.c b/drivers/gpu/drm/nouveau/nvkm/core/client.c
index 5c87146b8508..72c88db627a5 100644
--- a/drivers/gpu/drm/nouveau/nvkm/core/client.c
+++ b/drivers/gpu/drm/nouveau/nvkm/core/client.c
@@ -90,12 +90,6 @@ nvkm_client_child_get(struct nvkm_object *object, int index,
 	return 0;
 }
 
-static int
-nvkm_client_fini(struct nvkm_object *object, bool suspend)
-{
-	return 0;
-}
-
 static void *
 nvkm_client_dtor(struct nvkm_object *object)
 {
@@ -105,7 +99,6 @@ nvkm_client_dtor(struct nvkm_object *object)
 static const struct nvkm_object_func
 nvkm_client = {
 	.dtor = nvkm_client_dtor,
-	.fini = nvkm_client_fini,
 	.sclass = nvkm_client_child_get,
 };
 
-- 
2.45.1

