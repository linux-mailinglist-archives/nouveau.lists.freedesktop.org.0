Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A65393CD49
	for <lists+nouveau@lfdr.de>; Fri, 26 Jul 2024 06:39:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9330D10E910;
	Fri, 26 Jul 2024 04:39:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="PGpY1bCj";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2073.outbound.protection.outlook.com [40.107.94.73])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A700410E905
 for <nouveau@lists.freedesktop.org>; Fri, 26 Jul 2024 04:39:22 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BwSqg6PlQMnJMegDhBXWaoJqtPDj4zA/Un3VyBADL7qiW9iDwzMKZExMIEwYvPOide5Yh8T9bbX+Bk5BaFipuaAXBI46LUl2iQTAXRQ2KA4Y9vxPuMnVi+2BrSZatSOsJB8Tu0moMkg7HOYTpC3ts8LKi328tUPJLnJmcumsgwKA+JPeKay2GxxqTHEj43tHuYpNUg3HXqaEsdRakj2LtFR64NjDaJEMp4gCDFrUMVaT37oKIFiYnwDfWRBem+5D9nj4GSTE4+jBy9blVBZZ3tWPMi3A3MhYqWtNuuo5MIXaR5Uw+y0xDcW96X/gZsWeOKAmEt39upAbx3yDRXctnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=evzHdGg9q8lT0zVGTkS2iut/LT5hH3cF3CQyxcz1xYc=;
 b=yo/hz55qn3+HIVEJn59MLZod5B4tQQkRB+eOodPE51F3yqcQ03H0+JeDybj1JVjueVO7j5Lj1L4R3vdaYn7u3akw3MBcGFDddBNa19C7N00DJKsCsKmGagkQZDwdrywV8juxvXPTBYztPJ2ICmIqCIg1HXjCVismz2NQXTflAzeRiI7f81GvJHgHRDiatQDH1BvJSvwd1LUDOWaGkEsRQ9JWOyOVaWbQJPgXvXuErX9lvLV5rkprUyF6lZwXnUJwIqpHfZlQpMZRD6jr7JAfa9gjxLGGPR12s7AWvPwKYway01ZW7fEhsC+JL04On5DJxnqAOezKZevS7dcDtT9ofA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=evzHdGg9q8lT0zVGTkS2iut/LT5hH3cF3CQyxcz1xYc=;
 b=PGpY1bCjLBXn2i0TJvWXj7i6dH+N0b9UhN/I9/Q5cu8tn4LomVWNs5ABk3uEw9H2JrWxJtl7WCrJEvNpC8CtqLZPurpz0faNZG0UnOyl2m35bfFYyS1wP0P/NDtFsM8WotssQkQSwr/NgEzdnEfEN/Um2eD67dcRw4ZtbgB2WH6CHlMp/ZXQeH603lGw5dxirkG1LU0LuFfOWBzR+bj4WfQHoC9ruuWa/uB4le4Xboty854oTmurM5PD+GOdCAREcqD3T/uny13zXq/u9yYk5IqGq2YUsq/UALzTo+MchYX/i0l4tGQm08gf/cskmg1LndDxIJKzYHJBPPeVM8utyQ==
Received: from DM6PR08CA0047.namprd08.prod.outlook.com (2603:10b6:5:1e0::21)
 by CH0PR12MB8463.namprd12.prod.outlook.com (2603:10b6:610:187::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.29; Fri, 26 Jul
 2024 04:39:13 +0000
Received: from DS1PEPF00017093.namprd03.prod.outlook.com
 (2603:10b6:5:1e0:cafe::a1) by DM6PR08CA0047.outlook.office365.com
 (2603:10b6:5:1e0::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.20 via Frontend
 Transport; Fri, 26 Jul 2024 04:39:13 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 DS1PEPF00017093.mail.protection.outlook.com (10.167.17.136) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7784.11 via Frontend Transport; Fri, 26 Jul 2024 04:39:13 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Thu, 25 Jul
 2024 21:39:03 -0700
Received: from fedora.mshome.net (10.126.230.35) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Thu, 25 Jul
 2024 21:39:02 -0700
From: Ben Skeggs <bskeggs@nvidia.com>
To: <nouveau@lists.freedesktop.org>
CC: Ben Skeggs <bskeggs@nvidia.com>
Subject: [PATCH v3 13/37] drm/nouveau/nvkm: remove nvkm_client_search()
Date: Fri, 26 Jul 2024 14:38:04 +1000
Message-ID: <20240726043828.58966-14-bskeggs@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: DS1PEPF00017093:EE_|CH0PR12MB8463:EE_
X-MS-Office365-Filtering-Correlation-Id: 0359c701-96e5-47f4-0b74-08dcad2ce685
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|1800799024|36860700013|376014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?aHCa3XdQXq9BKWL+OR7IvTv2DmN+zZOskFqbZCU5NdbeIsxPgyLBAmnV7EB0?=
 =?us-ascii?Q?3AEb4jBNOEnPOW3CmEk7tFNOrzrNpNXDAFXDZEiUIA0NUCGaFy9EBTCVIc8N?=
 =?us-ascii?Q?shh12DSe34eQuAFKIjf+AqNJSIfdqtsKNyNLKcMj7jjjSt3sS5yyNNS0Z7kH?=
 =?us-ascii?Q?FG2SXx2gHum5hj71y/s1h/qqAIbvq24hY8Qs9Zz+US6NKTtrR7f/5uBWNHN4?=
 =?us-ascii?Q?7upNy6V5HxDk/QMIXFFg1ptbt1XO/gW/rtBTKvkn+vydd7BBE8YucY8UjOvM?=
 =?us-ascii?Q?pgEQnAHlQ6o05sHvJpK/tqwP2IEg0a8WJmS9fPhQoYGU6R712jzM/izkzvXu?=
 =?us-ascii?Q?UKQempPUPflPGliTMZKODH8a8/GiiO75QlyWVjOJw5LZ04vpkrlghuOqdSNf?=
 =?us-ascii?Q?RqA949rca8PnGDy9+7iS6j0983XM6cj3gC092V+d+HftiVDLX7WTiKbzbQbl?=
 =?us-ascii?Q?9TYZ1TSD+f4x1/txyUzuTTYzM0usqtFWw+28FoWqykM/vMAZGX0t4xIXZH1m?=
 =?us-ascii?Q?9mxwWNnSUz4JrS/tZw79htvrodkJL6bciocEidxHP2Rj4CC98y4eb0OCgng9?=
 =?us-ascii?Q?fFvEE0pkq9NU75iEkH02qdZG4VWS0v6oGRYnDHoFOJMuBhJeQF2qs1chpFLJ?=
 =?us-ascii?Q?5WM/O2rklnqGUdBGtPSMSOdc1PTcqTfeJXgL8F8yiHDjg/dQO1QLgT7VhC71?=
 =?us-ascii?Q?NEyMm1toJr4m8cC36Jnjx1qs8tzwtHCoFGoQ7CpUEijWkfM94Mop6ELNcjh6?=
 =?us-ascii?Q?AIhcFA1O1bhg9hagDIt/1sbXxpCjE/Ey/3H2+x2+gMwMSQqzleyD8oZLktmq?=
 =?us-ascii?Q?zI2ZyyQo1tU4VVuEMHyOnZWUsNiH7Hrk08uZm5CKUpy55Ov++LGQhSr2SaJc?=
 =?us-ascii?Q?Tl0jxG/bA6cpyzdv5l2wy22K5TZtDUL07o6+RD8Uw0Qe9pGjZYw+e/vCmFti?=
 =?us-ascii?Q?xZhTT4lNSfvDGb4OoHD2Ek9M2wWnHiO0uk73l9bLQ06b0WstjlEVKhyDBsTG?=
 =?us-ascii?Q?5dn4BVmqMwNgTQ8fIGCJY/EaEYLmRbmVflVHuo+R1u0DxT2AgQ53eHhsX8zV?=
 =?us-ascii?Q?N7CZ9qig2BvYeoLMg82jkfEwdecd1oVaG13ZYBONXTeS3orUxXvKqOTe0Ofi?=
 =?us-ascii?Q?rFxEEoAuitIyOs8fYTJjtg+hWQTQ+y+1KzK7LON7baNeD1AVbW8An6a6qkAn?=
 =?us-ascii?Q?rsjKBaAPUTpXNBPJ5VSIfWxZTbTAnRTO0XWzxQ4TMOHgJIWcblkMAObfpUyL?=
 =?us-ascii?Q?FDm9rDpTNl+g6m10YnwQjXBbHKy7TJ1/sfkx8fl4OYqb+2ngTpjRsCFcvOyk?=
 =?us-ascii?Q?AcRKkwfFRhMQ39h3VJNVwrqzCCN9J0kWJu2tTZZDBOttzD/6nLdsTDy59VZT?=
 =?us-ascii?Q?sx1dAfRrZRk0iA8tuJbp3YDybk7k6gV4MpjEHA+PFiMkJFzV/epsRN3ckCVf?=
 =?us-ascii?Q?O2YdVBYJp5hqyPdY3h0GwerXtCqnG7sM?=
X-Forefront-Antispam-Report: CIP:216.228.117.160; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge1.nvidia.com; CAT:NONE;
 SFS:(13230040)(82310400026)(1800799024)(36860700013)(376014); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jul 2024 04:39:13.6319 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0359c701-96e5-47f4-0b74-08dcad2ce685
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.160];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DS1PEPF00017093.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR12MB8463
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

Has been unused for a while now.

Signed-off-by: Ben Skeggs <bskeggs@nvidia.com>
---
 drivers/gpu/drm/nouveau/include/nvkm/core/client.h |  1 -
 drivers/gpu/drm/nouveau/nvkm/core/client.c         | 13 -------------
 2 files changed, 14 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/include/nvkm/core/client.h b/drivers/gpu/drm/nouveau/include/nvkm/core/client.h
index 932c9fd0b2d8..15f27fdd877a 100644
--- a/drivers/gpu/drm/nouveau/include/nvkm/core/client.h
+++ b/drivers/gpu/drm/nouveau/include/nvkm/core/client.h
@@ -22,7 +22,6 @@ struct nvkm_client {
 
 int  nvkm_client_new(const char *name, u64 device, const char *cfg, const char *dbg,
 		     int (*)(u64, void *, u32), struct nvkm_client **);
-struct nvkm_client *nvkm_client_search(struct nvkm_client *, u64 handle);
 
 /* logging for client-facing objects */
 #define nvif_printk(o,l,p,f,a...) do {                                         \
diff --git a/drivers/gpu/drm/nouveau/nvkm/core/client.c b/drivers/gpu/drm/nouveau/nvkm/core/client.c
index c55662937ab2..48416c5039a1 100644
--- a/drivers/gpu/drm/nouveau/nvkm/core/client.c
+++ b/drivers/gpu/drm/nouveau/nvkm/core/client.c
@@ -67,19 +67,6 @@ nvkm_uclient_sclass = {
 	.ctor = nvkm_uclient_new,
 };
 
-static const struct nvkm_object_func nvkm_client;
-struct nvkm_client *
-nvkm_client_search(struct nvkm_client *client, u64 handle)
-{
-	struct nvkm_object *object;
-
-	object = nvkm_object_search(client, handle, &nvkm_client);
-	if (IS_ERR(object))
-		return (void *)object;
-
-	return nvkm_client(object);
-}
-
 static int
 nvkm_client_mthd_devlist(struct nvkm_client *client, void *data, u32 size)
 {
-- 
2.45.1

