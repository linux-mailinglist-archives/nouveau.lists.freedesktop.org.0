Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 215B5AA3C6B
	for <lists+nouveau@lfdr.de>; Wed, 30 Apr 2025 01:40:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0926B10E00B;
	Tue, 29 Apr 2025 23:40:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="QkHG+MjH";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1nam02on2080.outbound.protection.outlook.com [40.107.96.80])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F023310E00B
 for <nouveau@lists.freedesktop.org>; Tue, 29 Apr 2025 23:39:59 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=T0EB/6ViG2w6C4n1eydtzOCM1n6WxT8Lr/ier+tQ0J+cPRjEZGF4MxGhIRJHUa4VJNw+wxVZNAfOGRez2/+9BmBdvIFrnzI7QL/a+gUOa2IWWTKkt0yaaOg3sKGqCzPiN7T3D5hxKQk6zA7Kn0cYQIUeza1AHu4sznuPmeSsAXKHIdEYdQrViMCwGUJTT7ybMNuW/bQSgnl7P80XC5+Yzh3UEIcIKBoTfCMVcV9sV9V4Cox8crk+YSfKNDUXBrGweBf9ZPEB71ss7DuX1HP48tUwr6jC+zh0N+6AOrJ2SgP82gSS+PhuNxcofi0sh0F5u4ALKAtomWoR1RqDJSgweA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZmUPlQP+4bDkX0o4dr2IcDwQSuPAYNYcOOlTs4jd1x8=;
 b=BMOdLo5ps4bQaT7N2S5Bg4V8Er+X87tABX5gJoajgpea2RURw+CMRrJpiLPVMFhy042GQ8i+x0eQf6t9+bn+y4gBV0X/faE5eQtla16bZWkUG6jR76S6r9BZuTm7nIMKTbyf2Wt64MdEmTaafg5IFOHHRjBytHsjliREc1scTgnld1larjizW4qt7+BzW3MemiB+6LuxEZtY2KMVdP9OegxjLXIjmYqt2LZPoacjEWW8/fyn2+VtMefvvsJ3elP7+IZUjRMpY3dDGf925u0OTYb2JnfbaV47vj1g70sszMv6rnZ5Jf/nMT0NHxg6cmzYHtyq3Grn3xLN+mifFLlDpQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZmUPlQP+4bDkX0o4dr2IcDwQSuPAYNYcOOlTs4jd1x8=;
 b=QkHG+MjH2HG1FAJMBHrNhRzvoZ80zbwHjNkeAjdTfOMJ80kq7wBmIlPS3rJxLiXxx4LwInunbYC2zQU1PrhcBIk+VrqU23ZJ7Q/zVXW7RnrMp5ZZMfE8Q0RutCaXwlIEx2axzKeA9S0ybR0iM7k9uIVYkOrq8UVpF+o+1W8Xcg/7SsDV6yziQjJ1Mg3R0xS7mHCz1Pkr5A4k6+wzurcjFdRfZqxrksLq8KThoif1rVrmX7CpriLz8qMbCJHkMbCC2wksUGWAQKeNJzY/fHrT2AbHE3cLJUBbndEThFxtXSSqQO5OXUPLZs1PKaTmGbIha7NEQAwbAcoTJafUTOeCJw==
Received: from MW4PR04CA0338.namprd04.prod.outlook.com (2603:10b6:303:8a::13)
 by LV2PR12MB5728.namprd12.prod.outlook.com (2603:10b6:408:17c::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.19; Tue, 29 Apr
 2025 23:39:53 +0000
Received: from SJ5PEPF000001EC.namprd05.prod.outlook.com
 (2603:10b6:303:8a:cafe::92) by MW4PR04CA0338.outlook.office365.com
 (2603:10b6:303:8a::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8655.35 via Frontend Transport; Tue,
 29 Apr 2025 23:39:52 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 SJ5PEPF000001EC.mail.protection.outlook.com (10.167.242.200) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8699.20 via Frontend Transport; Tue, 29 Apr 2025 23:39:52 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Tue, 29 Apr
 2025 16:39:40 -0700
Received: from nv-dev.vdiclient.nvidia.com (10.126.230.35) by
 rnnvmail201.nvidia.com (10.129.68.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Tue, 29 Apr 2025 16:39:39 -0700
From: Ben Skeggs <bskeggs@nvidia.com>
To: <nouveau@lists.freedesktop.org>
CC: Ben Skeggs <bskeggs@nvidia.com>
Subject: [PATCH 01/60] drm/nouveau/gsp: fix rm shutdown wait condition
Date: Wed, 30 Apr 2025 09:38:29 +1000
Message-ID: <20250429233929.24363-2-bskeggs@nvidia.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250429233929.24363-1-bskeggs@nvidia.com>
References: <20250429233929.24363-1-bskeggs@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.126.230.35]
X-ClientProxiedBy: rnnvmail202.nvidia.com (10.129.68.7) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001EC:EE_|LV2PR12MB5728:EE_
X-MS-Office365-Filtering-Correlation-Id: 183fb1d8-79f5-4a0c-6192-08dd87772361
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|36860700013|82310400026; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?u5lhDj+X9E4gpFhv5FmkX7eBFDa1ZuidU6SBKWypP9hEri9qY51f9mDh/CI0?=
 =?us-ascii?Q?HW8JQ/4M/cQmS00XZdiqmykX7MiQ2Cw5udJOgIuteJn2mEkZR5m1AOmQpxSA?=
 =?us-ascii?Q?XhyFAG4tQ7P0q6VqXWuN5kKQw44A10561Sp+WTVwEP+edAFsCkkMdPPkKa6y?=
 =?us-ascii?Q?d0kL1/JxtgA9ksM5pOorJ2K9+rKMsgog4XA4kyn7ek7xm2YnHxCExFuXptXX?=
 =?us-ascii?Q?WoKJUZWKghFMsE370c8ebe8Nt2hlTMfen935FU+QfYw98FCiGtIWq0zHOhRw?=
 =?us-ascii?Q?0+S4Ls4V/0H7MAZ0CzXBNWsAOTH3R3++m6Gc7tFmA16f4szgOTElkGmixBiL?=
 =?us-ascii?Q?alTSRfPi1ieNS6JHfuexEJrC7vHulbR8r4PRQ/FCtgBHatD8+1mQ4tgfVTOc?=
 =?us-ascii?Q?j/xWK275jcZQBFKcIA6QryeezGcKAuEErnh/VVTuP+GCBOD7J456kJGEoYue?=
 =?us-ascii?Q?VTUaTqgefPMZoVFOvHX51CtPPwcPjHO9UbTrJbC/ZImFE1GK9HJfMhMpRmGw?=
 =?us-ascii?Q?C03/5SLJMRJxgrRKgr5kS0DS5BhTWI3t5kXkwg1+8G4UPZ6A0X98JLVcfs0E?=
 =?us-ascii?Q?dTORhp5xFEgX96OIR4wbR9wdcy2Vwxx2rZf4COyU+zVNd582GsJt7suArSZh?=
 =?us-ascii?Q?u6G5AfXmQUOmrdUJooX6yTLqCzvKdQTQe/e1+WdxXaCNWJ4JJR+oSBNLFxDO?=
 =?us-ascii?Q?E8C4fLbVGsN8SCrQeVPqFKISFUfCbCvOAvrlCq1DyMrUwHZQz28o+fX+5For?=
 =?us-ascii?Q?MwSXxOMQdQzxR1jItknyZYNzO2pjJ0aTgenpo5GRE35V6BrQ/dmNBJZernD8?=
 =?us-ascii?Q?LeiatSJeZtCDcafYPFZBFQjsdeuMZvm6YMyebA2tJnHZWVHrYiXfmaDGLYoh?=
 =?us-ascii?Q?xDVw8XxtBj7DUpul63Z/axVVE+GL4fDZdssw+GmN2m40YQL0C+GLCbLBKOok?=
 =?us-ascii?Q?o0kdQtjlgrrT9JKppXONtlFwUkhPgpHoPIGbHX05MpBRQ2Wfq5m+qR2jPjG0?=
 =?us-ascii?Q?L01I2DcCs5bPJamW0C7DhHxVZLRiO/MFs1DF+u3TY8sN44gvO/F+fJeI4iKU?=
 =?us-ascii?Q?EIP6aHz0E7kh8OoNKKmKFWDqB2zpkSRTX/+HztSd/CsIiajk2uVFgV6BVmqh?=
 =?us-ascii?Q?+RuMChollpJk5I7XbzrQS6Mbg+2cQwsX91llSzH7JKXoOTY8W7w6FoBuLWal?=
 =?us-ascii?Q?je0sM6HNe3GliONaAcP8KJawuuUIndwoHht2/LxGIzzrFTmRG6KYHLAZN+4O?=
 =?us-ascii?Q?olU1wXpXKWotOkVba4Bu7yvDuzfbabFK8qZxJ5+VsMRke0upEgIaYC1Fyj04?=
 =?us-ascii?Q?SFye+9Ed7NRbCvnSeVDU/EeEyX5ZJEMgSEEdRs8PVlVgBE/b/Jz1lt8ySyJE?=
 =?us-ascii?Q?6G237gIgtWyRB1a4YG/Z7QInaOZ+mjWKgqGdo8UJYglfzEleEvsNRVbulSFj?=
 =?us-ascii?Q?iu3x032OrnukrUPvG/ffh3Yi6VlvIHfPjBFP7F9/o1RiQLcFVR2aZnsHSeiJ?=
 =?us-ascii?Q?Sq0hS87oB8Sj5gFrJ+URPE3mMEeGXKpGLg3C?=
X-Forefront-Antispam-Report: CIP:216.228.117.160; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge1.nvidia.com; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(36860700013)(82310400026); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Apr 2025 23:39:52.0640 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 183fb1d8-79f5-4a0c-6192-08dd87772361
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.160];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ5PEPF000001EC.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR12MB5728
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

Though the initial upstreamed GSP-RM version in nouveau was 535.113.01,
the code was developed against earlier versions.

535.42.02 modified the mailbox value used by GSP-RM to signal shutdown
has completed, which was missed at the time.

I'm not aware of any issues caused by this, but noticed the bug while
working on GB20x support.

Signed-off-by: Ben Skeggs <bskeggs@nvidia.com>
---
 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c
index 969f6b921fdb..64b58efd3132 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c
@@ -2844,7 +2844,7 @@ r535_gsp_fini(struct nvkm_gsp *gsp, bool suspend)
 		return ret;
 
 	nvkm_msec(gsp->subdev.device, 2000,
-		if (nvkm_falcon_rd32(&gsp->falcon, 0x040) & 0x80000000)
+		if (nvkm_falcon_rd32(&gsp->falcon, 0x040) == 0x80000000)
 			break;
 	);
 
-- 
2.49.0

