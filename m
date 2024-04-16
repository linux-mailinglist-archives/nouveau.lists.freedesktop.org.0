Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 115668A78F7
	for <lists+nouveau@lfdr.de>; Wed, 17 Apr 2024 01:42:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 815EC112F74;
	Tue, 16 Apr 2024 23:42:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="YFKrlWh/";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2083.outbound.protection.outlook.com [40.107.220.83])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 91164112F71
 for <nouveau@lists.freedesktop.org>; Tue, 16 Apr 2024 23:42:18 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=S1PKYvkri8la7B6rzOxruXXx7PzLqZMbCuGXHjWPKEgtsvJ7Cq3YehBy5AgxFDyta8eAvfLZuEm5yYaS0AnsZG8zGSye+NrIwzucGXOPNrM6637Qj0/VnHNo/hY/Jqy8pmq4CoZcbZeKJXtATO5r+C0OJwp61t5uKSHHjEy1tT82aX+D0e2U8TMv521hMT3rafkvcI40liBko5uC/F2ZU6aTpkb8jxxnv9lP0ztPR7/gczNDxlInM4QDfYay8vElsoPeo0v56lLCHO5/zZ9t1v0kq002mLGgYa97Gqq2nd2l6mFRdsKJPnub1e4AntfnWVojOJbY0n2Lo1CkYXHZRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cknWCINbRtbGWSNcfkzsTtU94pBGayZYKqomNtv3mNk=;
 b=H8aVQqqkUARY3ubT27PyQsbdAJKTn0JcuzurBdC0Es3juCeqmCov9oMu2DkAzfqhN/C3KRgShyKzhYqrApxZX/Kk/o8ferab/8vKFmaJAf0cIY5JE5Jugi0ix6NArtz8cQC41YI+l1+XtmUoZyPb2safC8iePOHaVDBKt6qGR15lQnOR6HZPDLiM9FRy1z37ax60rd7DzdxMaQllzzANFLWl3VG7R8zobQLB/jIDR3L1hMdQvhmA8cumtUVmlnZL0+MCtbWRvMyfq2e3z58NqPB+h8xu6O84ljBoVXlqwj1IMep/fN7eWWlw17D1j1wLClSCcLLE/tJOa1gkAw3xhg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cknWCINbRtbGWSNcfkzsTtU94pBGayZYKqomNtv3mNk=;
 b=YFKrlWh/WrzuQIUtd9ivmgmUEUXt7nQcttfiQbU29K8Kf8KuohN/YcWESE4VLln16BV4Eeo/lC8Uh25w3QwCv4bKsgHeoTCsIEK9bosI3yX2br5UpJ0mvt05dSs9Ar2RMEnzmZ+g+Uin0ANkAnD2l8rOZJ8GUsgIw2a/4wvb5yhAKsEovI0HLd2tiNrPkHV3Xepe7I+fPlLlGhTQUdbLPNvQyWTbexrlu5gGXmjEkbAPWlELndyE9FwKSOGzikz1qT9Zm5zS4vebiATClbNcvpFc2F/Uk7lU72BtYcnWIb06u8/OSlMMb5D7B/UA8EVEJ2rp3KB1+KDBUXSEOjlxVw==
Received: from CH0PR13CA0056.namprd13.prod.outlook.com (2603:10b6:610:b2::31)
 by LV3PR12MB9093.namprd12.prod.outlook.com (2603:10b6:408:19d::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7452.50; Tue, 16 Apr
 2024 23:42:14 +0000
Received: from DS2PEPF00003439.namprd02.prod.outlook.com
 (2603:10b6:610:b2:cafe::85) by CH0PR13CA0056.outlook.office365.com
 (2603:10b6:610:b2::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7495.17 via Frontend
 Transport; Tue, 16 Apr 2024 23:42:14 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 DS2PEPF00003439.mail.protection.outlook.com (10.167.18.36) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7452.22 via Frontend Transport; Tue, 16 Apr 2024 23:42:13 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.41; Tue, 16 Apr
 2024 16:41:59 -0700
Received: from fedora.mshome.net (10.126.231.35) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.12; Tue, 16 Apr
 2024 16:41:58 -0700
From: Ben Skeggs <bskeggs@nvidia.com>
To: <nouveau@lists.freedesktop.org>
CC: Ben Skeggs <bskeggs@nvidia.com>
Subject: [PATCH 077/156] drm/nouveau/nvif: remove usermode from object rb
Date: Wed, 17 Apr 2024 09:38:43 +1000
Message-ID: <20240416234002.19509-78-bskeggs@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: DS2PEPF00003439:EE_|LV3PR12MB9093:EE_
X-MS-Office365-Filtering-Correlation-Id: 4e1ceba1-46f6-400a-04dd-08dc5e6ed7e1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: i3pDkHZMuvQ+e928CuSOVbfxni1V198IB9jz1YcRmRFkB3VHJgrb3cVijnLFOfI1/HaxGvglxhJOEnSUfMdPR/bICPrIo6QCqQ2NFrqyip1+GJJ0Y5oY9LWeV3eUtQUIhfe/IRRHIWg+FOshiulhZBs6Y3oy0QtBMZqs4BewanyKJJ5N8tJ2vjdHcHESn8xPqIMO2fwwwRvD2q0K0OwCEixCN6IBU7TRArBrLNoVJtCfvir5VcchMbF1PTe+OcFPN62lVNRMXrPcIk0C3JYA2EW1Gk848Gi+EwKmEvkIHEInpwD5ORu42IE0wjrJOFQ7txt5NrsjZe7EwzxH/ycYlqwiB0HaiUX4j8hLC3fh6s2Hg/uXr32kgPYxhLkay2CmYv6ys86Gu7+k430459o7rVj5aJjFycIv4fmDipC69zcYGPlffNXfc0xr7T04gHaCMx4QWtnk2vE2PO7PJNZ7CZBJEI5mbaOVzsmFHN3vO1to6+KX7CwlTA1zJi5kPFsC9JPiaeDSn0gHCWYiTuXxxlCbv8WrK/eTyI1eKre4aipuUDKNBkiW4YnZ20qyaXv+PmOU5h64hr4y6n+eAGmJuWlVoK+BjR28jt3MSVtTy/sHvaWRMfHAReREF0EVyNAafnrxVV6gPyvMYJWiwG/bI4HT0k8asdBgyklnaEu1i+VtLL0REMHcCMotbNGW37wph+mAkdaIvC4cZSvmlJ95TZM35RnUFtZAigFu02gpAxxox7Xv5xzTXvrtF3s/WRiP
X-Forefront-Antispam-Report: CIP:216.228.117.161; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge2.nvidia.com; CAT:NONE;
 SFS:(13230031)(36860700004)(1800799015)(82310400014)(376005); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Apr 2024 23:42:13.9623 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4e1ceba1-46f6-400a-04dd-08dc5e6ed7e1
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.161];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DS2PEPF00003439.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR12MB9093
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

- no more users

Signed-off-by: Ben Skeggs <bskeggs@nvidia.com>
---
 drivers/gpu/drm/nouveau/include/nvif/driverif.h | 3 +--
 drivers/gpu/drm/nouveau/nvif/user.c             | 3 +--
 drivers/gpu/drm/nouveau/nvkm/device/user.c      | 5 +++--
 3 files changed, 5 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/include/nvif/driverif.h b/drivers/gpu/drm/nouveau/include/nvif/driverif.h
index 3f481d19e7c6..cd96e9c36f55 100644
--- a/drivers/gpu/drm/nouveau/include/nvif/driverif.h
+++ b/drivers/gpu/drm/nouveau/include/nvif/driverif.h
@@ -124,8 +124,7 @@ struct nvif_device_impl {
 	struct {
 		s32 oclass;
 		int (*new)(struct nvif_device_priv *,
-			   const struct nvif_usermode_impl **, struct nvif_usermode_priv **,
-			   u64 handle);
+			   const struct nvif_usermode_impl **, struct nvif_usermode_priv **);
 	} usermode;
 
 	struct {
diff --git a/drivers/gpu/drm/nouveau/nvif/user.c b/drivers/gpu/drm/nouveau/nvif/user.c
index dbeae9f1e6d2..4b955fce8382 100644
--- a/drivers/gpu/drm/nouveau/nvif/user.c
+++ b/drivers/gpu/drm/nouveau/nvif/user.c
@@ -57,8 +57,7 @@ nvif_user_ctor(struct nvif_device *device, const char *name)
 		return -ENODEV;
 	}
 
-	ret = device->impl->usermode.new(device->priv, &device->user.impl, &device->user.priv,
-					 nvif_handle(&device->user.object));
+	ret = device->impl->usermode.new(device->priv, &device->user.impl, &device->user.priv);
 	NVIF_ERRON(ret, &device->object, "[NEW usermode%04x]", oclass);
 	if (ret)
 		return ret;
diff --git a/drivers/gpu/drm/nouveau/nvkm/device/user.c b/drivers/gpu/drm/nouveau/nvkm/device/user.c
index aadd0c0956ee..cd126f5b165a 100644
--- a/drivers/gpu/drm/nouveau/nvkm/device/user.c
+++ b/drivers/gpu/drm/nouveau/nvkm/device/user.c
@@ -42,7 +42,7 @@ struct nvif_device_priv {
 
 static int
 nvkm_udevice_usermode_new(struct nvif_device_priv *udev, const struct nvif_usermode_impl **pimpl,
-			  struct nvif_usermode_priv **ppriv, u64 handle)
+			  struct nvif_usermode_priv **ppriv)
 {
 	struct nvkm_object *object;
 	int ret;
@@ -51,7 +51,8 @@ nvkm_udevice_usermode_new(struct nvif_device_priv *udev, const struct nvif_userm
 	if (ret)
 		return ret;
 
-	return nvkm_object_link_rb(udev->object.client, &udev->object, handle, object);
+	nvkm_object_link(&udev->object, object);
+	return 0;
 }
 
 static int
-- 
2.41.0

