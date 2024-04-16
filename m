Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C455A8A78C4
	for <lists+nouveau@lfdr.de>; Wed, 17 Apr 2024 01:41:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D872112F3B;
	Tue, 16 Apr 2024 23:41:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="VwDz8MMj";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2067.outbound.protection.outlook.com [40.107.92.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F7A4112F3D
 for <nouveau@lists.freedesktop.org>; Tue, 16 Apr 2024 23:41:25 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Nt0qcKFPPeEiKXxhNp0EA7bxrXvNIGVUW/MSOVhgbl0H5ntRpCD3iqSFgDgl3nayVkF3kq5KW7STQ8Z2teM3mv8up7jf/W0h1uNmF+P0hf7fyK54aE95z8hzeROBLG3BODm4apyyTTW8kjqfoRBWZSxiY0UQz3LNBpXOq+7bJglUuNMW+JJ9ZnSBYo/hGIvIHWROrDl27xrTuQL0UEOtHcRg2U7RjQioeXQC/AI35a3W+vbh9K/DVBRTqqy8WsWhJn3zKZW1LvduSgGWhZgbcCw7Xor8d8AV2wzxiEzBEqQevnUv6MTgV/drmeSXobl6QmAvIlFHa1+Q8QG55DO3Vw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CG2qJlw4hn6q1RQiycgQxmFFZ1gWwVF7Pb2eGAt8Rwo=;
 b=jYvevcXK7RDOpiOH4BCxrw5rta8KJpUmnS0rWZwKJ/gzWgZ/4s4SqBkSWhS3PAUHpF9cSYIYtTlbRz6jmbE7ZcTYHI9vRlh/snYyAapZA1Y5od1MwUYiF4UuayjhxMFFV2oQ/SRB3EXzL1UxUxbRs7XrMFdaar3IHMM5R2oBr0HzWxWOV6Mg1BeoKxfIRTAGi1vUkyeY87CvjSgGL8dsLFu4FxyVF63Jwee5BztRh0M6RTHTEvicQhNP+0yWFsNAmimphWPZp3xouf30kL/UzNhOU4Q4LPezx8nWMMTbv2Q0wnFC/gEv2FrBFtPHsvMfNBA4e/VdyEwC12NqzAZkqw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CG2qJlw4hn6q1RQiycgQxmFFZ1gWwVF7Pb2eGAt8Rwo=;
 b=VwDz8MMjCU3lo8LghI/EDAVD+XTvLJf6T2nns0Ie5Fl/jdzxtZ3s9K1P0DkZKeviFDVFOtTj9nwjdlMU6L7pO+zsVDo9ybQzHbsWCp6DDSrsDXJEEJ6fSkQ6HUR9razFlfmgbvERLsmxvy2bntHCzKUeIR6Yd3t4J+l1XWO/IC41HS1OKROrsrFwPY3e4Y9TqO74yQFFyWWVZzYPHIXCCarUC3WGgYfc7fxo/1DFA4t8U+T42rT7rCFfImQb57qkGA+PFO7PPF1sdpoL3h+vYcfVyAAsMnxhPrdQUtooY7vP07p/xhYizDMQu37AxeLzYdWuNZdR+xfZVcqFeDEQog==
Received: from MN2PR01CA0002.prod.exchangelabs.com (2603:10b6:208:10c::15) by
 CH2PR12MB4120.namprd12.prod.outlook.com (2603:10b6:610:7b::13) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7452.50; Tue, 16 Apr 2024 23:41:21 +0000
Received: from BN3PEPF0000B071.namprd04.prod.outlook.com
 (2603:10b6:208:10c:cafe::7e) by MN2PR01CA0002.outlook.office365.com
 (2603:10b6:208:10c::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7472.33 via Frontend
 Transport; Tue, 16 Apr 2024 23:41:17 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 BN3PEPF0000B071.mail.protection.outlook.com (10.167.243.116) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7452.22 via Frontend Transport; Tue, 16 Apr 2024 23:41:17 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.41; Tue, 16 Apr
 2024 16:41:01 -0700
Received: from fedora.mshome.net (10.126.231.35) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.12; Tue, 16 Apr
 2024 16:40:59 -0700
From: Ben Skeggs <bskeggs@nvidia.com>
To: <nouveau@lists.freedesktop.org>
CC: Ben Skeggs <bskeggs@nvidia.com>
Subject: [PATCH 026/156] drm/nouveau/nvkm: remove nvkm_client_search()
Date: Wed, 17 Apr 2024 09:37:52 +1000
Message-ID: <20240416234002.19509-27-bskeggs@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B071:EE_|CH2PR12MB4120:EE_
X-MS-Office365-Filtering-Correlation-Id: 65eeee2f-d8f5-4f39-e5cd-08dc5e6eb606
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: zcT1ISpWz2UW0G/i+KU1NDzykNL0rBu2TwKATt5NVIJ0ZFhOJkSfLmLA7pFrj8dv5GVlVmUt2+sV1Q9eI5ZFwjcgau9hDyOA591gCoTq0zBkWnuymX3eTMCGc2BfLzq+IegS6fcKIjE5+aYq/qcxYHIm8dWbPbJMSDnPTVTavwtS43w0bb7KvlxLyr0Ve0nWdNZN6+wxUH62dorIrkipeXWJP1BJNYthI0N4RiLTuHVhqVwYaY+mi5+i9RVZ0DBpGZG62Hn6REI771tyxYLDxdlt/ey8QrILZ1Vz2942Xe0cZl6yXmXxP7VrQQzFupGSO9a+we3L4La8XpzKYoxP+Yl0R2tRS0xb5mHkXnO4QwjqaCgABOeD0GCX4JMoa2KRhCidKjdT7qLpXrKjruaKu71/4vF1n3+w4ZJjnoC9QspHUUsxOwbrbRwgJs6BCV/q9io2p0wbGLbyROcZb6G35KQnGzD3rwhHpfIGgsNvjELIaDKQcYBwMFbO2iqQP4l0tmjDtuymVozvGUa+eL69DkUA8gDP6RitRC8X2Bv86Q2wIYrN9oNnmZl39ukJ4UFBWZYEsXf/mPAjYQFCfmCe/rc+sVQpEUQNiVnqW6FbF3iQda405okm80048WVhqhxvMQEXhPVOdQX0thB2HhMtr/xl8UQnqM12HoxYOCFfxeo6FLwhBnhqxx0fiRHUwef6mEVLD//UlJRuNrBKCVC7WVgMEaFqhovXJ+boVniSTVxvRLbCvw3z8kY0f8PWBoDy
X-Forefront-Antispam-Report: CIP:216.228.117.160; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge1.nvidia.com; CAT:NONE;
 SFS:(13230031)(1800799015)(376005)(36860700004)(82310400014); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Apr 2024 23:41:17.0742 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 65eeee2f-d8f5-4f39-e5cd-08dc5e6eb606
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.160];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BN3PEPF0000B071.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4120
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

- has been unused for a while now

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
2.41.0

