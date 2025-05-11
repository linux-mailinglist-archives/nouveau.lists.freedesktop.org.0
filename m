Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 15AFFAB2B5F
	for <lists+nouveau@lfdr.de>; Sun, 11 May 2025 23:09:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AED2F10E1B3;
	Sun, 11 May 2025 21:09:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="RXz8NWK2";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2050.outbound.protection.outlook.com [40.107.93.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 956BE10E1A1
 for <nouveau@lists.freedesktop.org>; Sun, 11 May 2025 21:08:59 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZODpacaJ2jw4rirYX6kRCymo7zWVLeK7xsxAXnY6CVCxV8hvZvB9c4eEOtSwxdCDp44mumjGhRZDEFpmbkdKPTbgK136GWkj1J2CJbUyS8GXhQ5jHk7w84DTvmiXrvoSlTraxmfAwGVAPbgvJTIOwsBD1xhp51Pmh5HMUvzdIxdh2FRJ1rpM92TTA1pAzDlR13hwBOqHdMLhKQAUBLDlysQgnwn2jGPNSPw57THcJa28UFrBxn4gYnWRf5JoEfuyd9wfG907NdLptRg5avkNI39IuQBDWeJjS39jVzU3boOLPlcPxpOm9fqpJX8jH9TlpwhVASuVxmr8KorWsiwrzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=q2/Nl3/xvd6/5FcFuCo4bprYhwe4HVSuG+jnF62TGlQ=;
 b=SnXfaPaUZZ8MVVK4mS48xwX07NVacWvLWdA4JaC4HGErVQfNv+UwnEXTwaXWRovbUGmcioJeS9QKDz7FBCEHZ+4wKzSdOUe5hAGNVdNcZEXUuASF9sCIlh4Wgp3JVIRDrO6PbOCeRCaIuTA//T70IwCRmgV29FvPKcl3UI/f2mDDelSQMO/xeTYEFG/rJlNIluvuK+8j9MEeMuZwws6YtRKo9ytlll7SVbvkg/qyi0339U35U0Om1MXgqPxdNugLyf1KMya0qYo/ozoxFDRIWUmpX+JMxVjOn2UZEYeT+sEmTnnUqxyuVss5giNqeDP4Ylioy5D/rsPzmC8uh8RDnA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=q2/Nl3/xvd6/5FcFuCo4bprYhwe4HVSuG+jnF62TGlQ=;
 b=RXz8NWK2EKc+5qEjRkQQZpjiSaPNGPvGoFfFirsADJBhhmhYCVUmdn9ftU1/+h3NrASwbQZnwIQVTJJRdBq77VRR5sUuQIUqxZKedm2MO2vbrWAg1qH+U/t9E3ZS+y3QW4mohLkckRL5ax7jjeR6LDyEUDX8eFgFAIln1Gib5SHCFDUVw1LbkJkCxYhxO6C4VsUr9ahRh43/yYUwriQfWXky+PT1ffwD1qv6NQslKOL1qDMIVGytKV7vhqT7TBu7u/SHcZztGGUFls9oZrVl8VbvrQsiVkIHjJS6zZ8szYHBx8ypoDIwPzi7EaoTJHTXH+mmRMdj8FrY4p7Twk+Ekw==
Received: from DS0PR17CA0007.namprd17.prod.outlook.com (2603:10b6:8:191::14)
 by DM6PR12MB4138.namprd12.prod.outlook.com (2603:10b6:5:220::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.33; Sun, 11 May
 2025 21:08:55 +0000
Received: from DS2PEPF00003448.namprd04.prod.outlook.com
 (2603:10b6:8:191:cafe::1f) by DS0PR17CA0007.outlook.office365.com
 (2603:10b6:8:191::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8699.32 via Frontend Transport; Sun,
 11 May 2025 21:08:55 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 DS2PEPF00003448.mail.protection.outlook.com (10.167.17.75) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8722.18 via Frontend Transport; Sun, 11 May 2025 21:08:55 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Sun, 11 May
 2025 14:08:46 -0700
Received: from nv-dev.vdiclient.nvidia.com (10.126.231.35) by
 rnnvmail201.nvidia.com (10.129.68.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Sun, 11 May 2025 14:08:45 -0700
From: Ben Skeggs <bskeggs@nvidia.com>
To: <nouveau@lists.freedesktop.org>, <dakr@kernel.org>
CC: Ben Skeggs <bskeggs@nvidia.com>, Dave Airlie <airlied@redhat.com>, "Timur
 Tabi" <ttabi@nvidia.com>
Subject: [PATCH v2 26/62] drm/nouveau/gsp: add hal for
 gsp.drop_send_user_shared_data()
Date: Mon, 12 May 2025 07:06:46 +1000
Message-ID: <20250511210722.80350-27-bskeggs@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: DS2PEPF00003448:EE_|DM6PR12MB4138:EE_
X-MS-Office365-Filtering-Correlation-Id: 42fe007e-3ac1-4ceb-9291-08dd90d00a75
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|1800799024|376014|82310400026; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?n2dTsbx6TMzGD1M+cdMNcIr+45CZ0+sxO9PAASV/GNKlPHcnbRTkcbbmQRLY?=
 =?us-ascii?Q?VtoiYWh+cwHcx1ne3AhYH+cSAnXQIE7KrvWbwldQfixSfZQs1BCqpstiT6bW?=
 =?us-ascii?Q?+4BFkGWGloJWDjNVg/P1P/vHtC5g5sqovVxVXAOCMZ9eW9od8FIZcsp3V322?=
 =?us-ascii?Q?phEcW9KaXNAZcnnTHxxrKu4SeAvP/BbunoJjPY1SID4Y4IsNk2nsLz605hYu?=
 =?us-ascii?Q?3yvlJFuMZPNhuT3CcSMeCwad/dTLV/yq8pfJT1vx0oN/1p7Sa0eVzIT/HxlE?=
 =?us-ascii?Q?NrIDJyiZMRkYfFAn7phYKks7YLdj92nrAUXoJRJmoTrCVwS3MhOJ3BzRnf3P?=
 =?us-ascii?Q?EIUX4yZxZe4NY7k5ZucmpY/2RqnQpYWgjc1FY2g1zdPf/Aiv+n07B6CgIynM?=
 =?us-ascii?Q?9UdfrT7ssGDLzIYSydXlF+nAQZCeDpRsplub46TNrKD/g4lkiruAddm5krXA?=
 =?us-ascii?Q?h4U23UmzVGyDIzQZ87l1uk+X7D+mwyl+2CcGFM3ewDLgLqxzg++HQiavNHIU?=
 =?us-ascii?Q?89dTvdzIwm288FcfOTQDbMPnL2Xjrygqtxvg6hkewqx+HQ+K7gbYbehKNBwV?=
 =?us-ascii?Q?jKgD6vYyfna9O8ZC4SM1zAeTQ1pUIdIEH+tnMxfvyDjHgkWdJjqdcg5fIZIu?=
 =?us-ascii?Q?OHFQV8XAfQHbzxbo+aAKY6jwIb/KhqCWbXah8aIvj16+0Z/f4Y4wrBa5rOFY?=
 =?us-ascii?Q?qRZagZjUFhvqZhylbqKYLFUYlx5RPIoPHCjyWV0J+VAdupnRiEPuIatGjY/g?=
 =?us-ascii?Q?OeWV8V9zPn+gifL0dYpUhSibkUIckub8Iz7QXWJv0WChrTsSPFL71SDaFq1b?=
 =?us-ascii?Q?hvyGuenPyUaliXaY4gBsCbL+RkmSN4aPfal9iq8xm13ocUiwwJ0YOdOTEyGx?=
 =?us-ascii?Q?PEypjG9gNoCo1SNC9ALnsnc6djPADcJlrcJSgX+OuPb2wonftCLLHLBcg+Lv?=
 =?us-ascii?Q?z9uX4nW9MsAg5LOFQhqbTbsliSoMT6EdJkQji2TzCgiwjJnaognXjo0B7NDA?=
 =?us-ascii?Q?qyfJe7dwdM4+iV7U81eyCPGnTSM/A0ldUyq/WICwdZWel2LYoZrPGZw9KBhL?=
 =?us-ascii?Q?uyu5xCG7PJh5KmCiad8X9RXgHDMg9PoC+iV7B0eMiQDzhVvLQVhhwkKBJJW5?=
 =?us-ascii?Q?hmIcneqVJrGMiB3n8l4IA2ljwYjWaIn3hGa0AqS7L2oELJldbQCUuowrETOF?=
 =?us-ascii?Q?IdfdkfE7siB9ucOTY6kAZKQ7IlLA1CvFXs4w485PGArGP/LOMA+D5dHAbmN1?=
 =?us-ascii?Q?YMLA0KkDvmR5KBRCTits/WkDBZzXQ5dgVi7Tj7PmDew1SY/wfNK9L4Pz5Oq9?=
 =?us-ascii?Q?LnpEVvjZq/zhiFvJevbgGE6FuuOH7YA3gljbNcFsfwd2dF5P1/a/zvUvuO1L?=
 =?us-ascii?Q?2jMBMjfYr5NfCym9pMfhsTn67Wc7nWEpiZ0w8C6zw/zWHVF0CeGRI5WKLeOS?=
 =?us-ascii?Q?8mfgD+OGFzbhmtHsQsyRrHTPLlBbZTdsazGZsYdOIBejuiZEFUvVJPGotQn/?=
 =?us-ascii?Q?SNEv0R9blRFDh9JSSy8aOaziEXkoiFYJ0izh?=
X-Forefront-Antispam-Report: CIP:216.228.117.161; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge2.nvidia.com; CAT:NONE;
 SFS:(13230040)(36860700013)(1800799024)(376014)(82310400026); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 May 2025 21:08:55.8495 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 42fe007e-3ac1-4ceb-9291-08dd90d00a75
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.161];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DS2PEPF00003448.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4138
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

545.23.06 removes NV_VGPU_MSG_EVENT_GSP_SEND_USER_SHARED_DATA, but has
another event (NVLINK_FAULT_UP) in its place.

Signed-off-by: Ben Skeggs <bskeggs@nvidia.com>
Reviewed-by: Dave Airlie <airlied@redhat.com>
Reviewed-by: Timur Tabi <ttabi@nvidia.com>
Tested-by: Timur Tabi <ttabi@nvidia.com>
---
 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/gsp.c | 11 ++++++++++-
 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/rm.h       |  1 +
 2 files changed, 11 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/gsp.c b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/gsp.c
index af93116a0fd8..218a7141ba97 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/gsp.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/gsp.c
@@ -2097,6 +2097,12 @@ r535_gsp_dtor(struct nvkm_gsp *gsp)
 	nvkm_gsp_mem_dtor(&gsp->logrm);
 }
 
+static void
+r535_gsp_drop_send_user_shared_data(struct nvkm_gsp *gsp)
+{
+	r535_gsp_msg_ntfy_add(gsp, NV_VGPU_MSG_EVENT_GSP_SEND_USER_SHARED_DATA, NULL, NULL);
+}
+
 int
 r535_gsp_oneinit(struct nvkm_gsp *gsp)
 {
@@ -2144,7 +2150,9 @@ r535_gsp_oneinit(struct nvkm_gsp *gsp)
 	r535_gsp_msg_ntfy_add(gsp, NV_VGPU_MSG_EVENT_OS_ERROR_LOG, r535_gsp_msg_os_error_log, gsp);
 	r535_gsp_msg_ntfy_add(gsp, NV_VGPU_MSG_EVENT_PERF_BRIDGELESS_INFO_UPDATE, NULL, NULL);
 	r535_gsp_msg_ntfy_add(gsp, NV_VGPU_MSG_EVENT_UCODE_LIBOS_PRINT, NULL, NULL);
-	r535_gsp_msg_ntfy_add(gsp, NV_VGPU_MSG_EVENT_GSP_SEND_USER_SHARED_DATA, NULL, NULL);
+	if (rmapi->gsp->drop_send_user_shared_data)
+		rmapi->gsp->drop_send_user_shared_data(gsp);
+
 	ret = r535_gsp_rm_boot_ctor(gsp);
 	if (ret)
 		return ret;
@@ -2174,4 +2182,5 @@ r535_gsp = {
 	.set_system_info = r535_gsp_set_system_info,
 	.get_static_info = r535_gsp_get_static_info,
 	.xlat_mc_engine_idx = r535_gsp_xlat_mc_engine_idx,
+	.drop_send_user_shared_data = r535_gsp_drop_send_user_shared_data,
 };
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/rm.h b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/rm.h
index aecb066982d8..4a27e8bfafcc 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/rm.h
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/rm.h
@@ -30,6 +30,7 @@ struct nvkm_rm_api {
 		int (*set_system_info)(struct nvkm_gsp *);
 		int (*get_static_info)(struct nvkm_gsp *);
 		bool (*xlat_mc_engine_idx)(u32 mc_engine_idx, enum nvkm_subdev_type *, int *inst);
+		void (*drop_send_user_shared_data)(struct nvkm_gsp *);
 	} *gsp;
 
 	const struct nvkm_rm_api_rpc {
-- 
2.49.0

