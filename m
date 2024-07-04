Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A0C692AD55
	for <lists+nouveau@lfdr.de>; Tue,  9 Jul 2024 02:55:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B20BF10E460;
	Tue,  9 Jul 2024 00:55:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="ik5CvE6b";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2056.outbound.protection.outlook.com [40.107.236.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B7D110E440
 for <nouveau@lists.freedesktop.org>; Tue,  9 Jul 2024 00:55:23 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bDv92uU26stSY6uT7/lZh9lYApctdKijWchmezMLhiFucFHG4PuVKkoZoV6GIs/4c4/9/ZhdloHsG0SWgkNYbILGMwFHj2e5mSb5B9iDN1+K4lxRoTjeOWI5EXHexMqpAn9y9Fod8BQ1VTzpbFyDRJwOsXfni77X0ewm2ZUom97AIXEaa2wZ0QdtyEhl5cSWfaiS5df+fnVshdLa1o6jZmTQMUF1MxFlz8ChvSzw3Tmw1a9SA0RAEWocozsYfF9OJw+/o1jqyUWy7NQO1YfRVSm/DmNmOAzlEXo1YmsXZ/JUz0RXy3NLNpi7exCvFx4MmlvcEPldfMB4HJmLB0ad6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=evzHdGg9q8lT0zVGTkS2iut/LT5hH3cF3CQyxcz1xYc=;
 b=Ul5pb25/a1jCw7y8NLIVgHqttutmpCbgTFEupO/13aeK5dRqseka/+63NkVUHSZj6Jz3MavQoilg3/ygoCk7qETd1AKsBSnFd6PhdR/nqMCUFtlINuVGdwapF+omNHnDwsGZ09CZxixpcBcTfnMWmbmmgST1s4lvhfZBl/nvlMRujYjal+g9CPTY+QygwNoCYAz5MdzIYFxeyLD4fVywyhhSNtSMKOSpS75iGEtNhMY7/7TozP9Jz4SLXxjc/FrYKdHTfJLUf75Wi6GsHqu35r4tBcxJtvnrS/9ZsWaomeukV+VAeLj0rkij8Tnirg3XJxjRyNLzgZ0NJsyPwQiyKw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=evzHdGg9q8lT0zVGTkS2iut/LT5hH3cF3CQyxcz1xYc=;
 b=ik5CvE6bt30QwalLVaWB95GkVyhNFCiPrLIQoV47dh1B7P3YQkMOnqHm7AtyiYtQ8MWR2IJfmTbYiwuVLc/Edug4rKqouGGAa+tKYbQjVwekeTXZAbG8u50eKL45vVItzTinaGZIsQpPIixlOKZcyV8RCQW5DD4/jcxyeUqRaAk9GcGw7z6VnjmdU/zzgnDB3QAv4cW8VPNxht0Arc6VwgK1/pLCgg36oJl7dIGcsOzkelxEirZNpNEV2CtoMO52ap5BloMbkmRXWqZ4X2PlNJiK0oIfR+qDZgno0n47XTBWvq5uIJc3nvSRr/vPd1p7v8QnuU4PUlrITASuP8B3hA==
Received: from BN0PR04CA0137.namprd04.prod.outlook.com (2603:10b6:408:ed::22)
 by SA3PR12MB7859.namprd12.prod.outlook.com (2603:10b6:806:305::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7741.36; Tue, 9 Jul
 2024 00:55:20 +0000
Received: from BN2PEPF0000449E.namprd02.prod.outlook.com
 (2603:10b6:408:ed:cafe::a5) by BN0PR04CA0137.outlook.office365.com
 (2603:10b6:408:ed::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7741.36 via Frontend
 Transport; Tue, 9 Jul 2024 00:55:19 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 BN2PEPF0000449E.mail.protection.outlook.com (10.167.243.149) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7762.17 via Frontend Transport; Tue, 9 Jul 2024 00:55:19 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Mon, 8 Jul 2024
 17:55:06 -0700
Received: from fedora.mshome.net (10.126.230.35) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Mon, 8 Jul 2024
 17:55:04 -0700
From: Ben Skeggs <bskeggs@nvidia.com>
To: <nouveau@lists.freedesktop.org>
CC: Ben Skeggs <bskeggs@nvidia.com>
Subject: [PATCH v2 13/37] drm/nouveau/nvkm: remove nvkm_client_search()
Date: Fri, 5 Jul 2024 04:36:57 +1000
Message-ID: <20240704183721.25778-14-bskeggs@nvidia.com>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <20240704183721.25778-1-bskeggs@nvidia.com>
References: <20240704183721.25778-1-bskeggs@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.126.230.35]
X-ClientProxiedBy: rnnvmail203.nvidia.com (10.129.68.9) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF0000449E:EE_|SA3PR12MB7859:EE_
X-MS-Office365-Filtering-Correlation-Id: a1b74928-9aff-4e33-0c3b-08dc9fb1ce06
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|36860700013|376014|82310400026; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?iKQImTRP/aNCq/ZG5wTiT//Y6ue3lf7MQhH0d3/pF6HnEM+Wy0YSUqmWvADM?=
 =?us-ascii?Q?5gKP3/kU4GukYeBvrjqmh3pZSUar+uhjRElBPqWfxj8/8/ggeYz98ec7Zitf?=
 =?us-ascii?Q?xcl8P1gtgVkJRjFEBoD7TG+4lHczLAgMN8IpPfNV0/xTzL/SDiJLJ124U+xB?=
 =?us-ascii?Q?NrubEWqcubaRAzJgMrxcCJ9Hf74VN8qd7GRGJv3SzN/5qcOGA7ehwY//wu7E?=
 =?us-ascii?Q?z227RxI4Oxm7OTuRRwlwmXAhSLDFs7wpvmyNDVA49PwI8nj9mtkrNczsu2gZ?=
 =?us-ascii?Q?ZLGttH29GhzGQvxXIU2A2VMgeOnzOL7iC0fFDoSBobpeYPxw7+3wtlTxDHdG?=
 =?us-ascii?Q?8Umuo5RY6CLa/jHasaMEJ+pzeUczyR1lk+8+1ZOq9KmmvfFifMAa2xhnRPW5?=
 =?us-ascii?Q?wwNwCn9/wy3tn6tD0SaYpvGK5clWRByb3K1I/DWc6yWNqbu8k/8+STTCy6Hg?=
 =?us-ascii?Q?y0aeUoyw3O/GRQunNqs3tagZq6H/Dtk6yuEX9tbm1y+oOakh2eXppNvz79lF?=
 =?us-ascii?Q?M48y0mWysmxg5GvsyPzppvbut4Olv4o1ulmo7nEk+kIYE+VDTdn0CnLW2jh8?=
 =?us-ascii?Q?OwMKXWp0HUx8447vwmqObVqWxMEw/1oggZntuAuKJZetHKlRVG0sh19cLOJo?=
 =?us-ascii?Q?nULXv/+BTqZwusgxfoGs09YULDKwdDZyUxBnP82FcANxKfMd11ioRL0bxdgg?=
 =?us-ascii?Q?mHPX6GcEHZ4dGy5VQhpCmQx5B5Bvflm9G9iqPsjAUZYlIG9rCMTekBWqmY7f?=
 =?us-ascii?Q?LO/v77MZHp3Z8V3EitCJ/cWjeCxLEdrIQEYxuA5CidSSNSyhJKDxChCAzF9W?=
 =?us-ascii?Q?QA0ZCnPqdJhONA8LRak5xzPQlJpRhmzv2Exk2OBb9dHDYOkHLyD7/zD8TupO?=
 =?us-ascii?Q?muSPlVFpgqsgIHjfAKhvbHKamBGHOeilHQyrdRpISGmYH8zlG3fH68IxlKgs?=
 =?us-ascii?Q?Ih+2hp9clG0rvHzgSnTlprQw6coPu77drrEVhgsI8dpC069sECMmakTW8Jpi?=
 =?us-ascii?Q?0azykEx8B+z47qf4hvEto+2eaQ32Hhxe8B4uRMTnaOI0PHni2seZrCEfTi/G?=
 =?us-ascii?Q?G58UCJxfqCs21qBu5LI95Ijsn2yCf2zuETUWOZNIYDVkSNMxZogTpHr3wsyd?=
 =?us-ascii?Q?K9RRMoqDBUbYxxFI34hYuu1odOlcSkx7qTq43q0mJTExvBE6LVCRIrU36HOA?=
 =?us-ascii?Q?8ZEDh+qrvezCnG0/XyxU+8sG3g0/47gY4WI/dGsvhnqKM+09zB1XzEEVKBYN?=
 =?us-ascii?Q?h8woMJxnOSHnJms+/tYUKJe/K4IHU3XXUEKHUSFHY7B1EzHQWSuydlLF7968?=
 =?us-ascii?Q?BjpLy3wUs7i5r6d1lfadU7UBgf40ktpru9ETbtM0zPNEfYs2YCjHV/Nic9D/?=
 =?us-ascii?Q?8wcBmgJ82o8ZQgc7yJlO147RDpKD+/YE5zVNScY5U025WHY0R1O0onYGgn3F?=
 =?us-ascii?Q?ekInMu64J0oWHdx/e8W1sUxTakzdqmtj?=
X-Forefront-Antispam-Report: CIP:216.228.117.160; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge1.nvidia.com; CAT:NONE;
 SFS:(13230040)(1800799024)(36860700013)(376014)(82310400026); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jul 2024 00:55:19.2267 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a1b74928-9aff-4e33-0c3b-08dc9fb1ce06
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.160];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BN2PEPF0000449E.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB7859
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

