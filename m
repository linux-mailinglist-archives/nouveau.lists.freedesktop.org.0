Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 78BE6A2CAA0
	for <lists+nouveau@lfdr.de>; Fri,  7 Feb 2025 18:58:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B3EB10EB94;
	Fri,  7 Feb 2025 17:58:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="StIZ/4ze";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam02on2075.outbound.protection.outlook.com [40.107.212.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2776D10EB90
 for <nouveau@lists.freedesktop.org>; Fri,  7 Feb 2025 17:58:42 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VQ/w6LbfiISJ/6IGAKiIHHGSSUfuHAcSTE3GjRdFwvs7KeKGbpG0aq0dWT17FE84hREitGmXjv/rzzzJp/2HVgrQ+5/xiwh++pjE5TK5WKP4h27rNLlm1ydZAbi4qtmEsmFJ4Wkp6E35MuKkIXcEcaTUwoYzNF1YyaHxtzkcWvBu6GoZLDUGSEXuJA18vz2byDdCO5W6ef7ZJUwpun99Gmf/BPjVaKzD8wg85HhHG2i09DWDbls1P7VFt+vzynFRq4zca9SK+auNpZUHCHVfjr0PjVXfi264G2UiNUYb49IM2qHpvBQz8H2aLEFt1V+fcmkFZYfk3h05HNSKrbwAeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WLOTLtIwf1+A3onvd0mpen90c1ofjU96Qy2KLt/cwOg=;
 b=MQFEACC+bs2tdxYhdnjM+caE6OILL7b6/5awjAlK70IxCJyST9WA8kApZoZIBiTAssN+AwTZFalXmPRTtJRWSPCSSn/DSDg11kGznD5k5q8Amr3KfbCa8B0F+FS1JQnTNYDnxat7vX89yU7ftBrxEl1HDwi7MW7mY38bbCBH4SsRkOH2LgI5Q0a5jN+/lCjgZs2+nRQWSrFQPAQ1RbepvZPQKLYEjN9lEujspWyYWt12ssw/P0BrKOWc0J6H/mQPEPltHW1VNzkTENriUBFK5s813px2T+MDDeN6VOKI8mg9WTOVczWHzm6OXGiwrxP/baorNUG7RkFV6OXLiRg4fA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WLOTLtIwf1+A3onvd0mpen90c1ofjU96Qy2KLt/cwOg=;
 b=StIZ/4zeN5Nje+qYsRMjMC9zRuslFMVKQ5GpmBM/079OfD6mPLp/uTxFERUK6YIAG6HvgjiBmrZ8xeXlv/ehbZaZ1V538NX5UNlIuGsQMYmkKfYVQ1ZHZpTYuVxa71x0YT3ITYxPyp4oBmgBIHFtAXfz1w7f+Xy8QPmm6whsVmIKVMQiLpP8haHZCEdEeHX/Uht3y61MdaKnpwQA/MEyWPetfY45im/Xvev52hrUF/47R7UZZVFB6PjY17by2zYnRUsdokmL9zXMiPb0zMpalD9B+Cl6HlXecSMAQtuiUpXX4/Nui8lvZUn56WH0x/AuD91WwowcGL7jcBC+lhO94g==
Received: from SA9PR13CA0137.namprd13.prod.outlook.com (2603:10b6:806:27::22)
 by PH7PR12MB8154.namprd12.prod.outlook.com (2603:10b6:510:2b9::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.12; Fri, 7 Feb
 2025 17:58:37 +0000
Received: from SN1PEPF0002BA4D.namprd03.prod.outlook.com
 (2603:10b6:806:27:cafe::64) by SA9PR13CA0137.outlook.office365.com
 (2603:10b6:806:27::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8398.25 via Frontend Transport; Fri,
 7 Feb 2025 17:58:37 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 SN1PEPF0002BA4D.mail.protection.outlook.com (10.167.242.70) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8398.14 via Frontend Transport; Fri, 7 Feb 2025 17:58:36 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Fri, 7 Feb 2025
 09:58:21 -0800
Received: from rnnvmail205.nvidia.com (10.129.68.10) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14; Fri, 7 Feb
 2025 09:58:21 -0800
Received: from ipp2-2314.ipp2u1.colossus.nvidia.com (10.127.8.13) by
 mail.nvidia.com (10.129.68.10) with Microsoft SMTP Server id 15.2.1544.14 via
 Frontend Transport; Fri, 7 Feb 2025 09:58:21 -0800
From: Zhi Wang <zhiw@nvidia.com>
To: <nouveau@lists.freedesktop.org>
CC: <airlied@gmail.com>, <daniel@ffwll.ch>, <dakr@kernel.org>,
 <bskeggs@nvidia.com>, <acurrid@nvidia.com>, <cjia@nvidia.com>,
 <smitra@nvidia.com>, <ankita@nvidia.com>, <aniketa@nvidia.com>,
 <kwankhede@nvidia.com>, <targupta@nvidia.com>, <zhiw@nvidia.com>,
 <zhiwang@kernel.org>
Subject: [PATCH 3/5] drm/nouveau/nvkm: introduce new GSP reply policy
 NVKM_GSP_RPC_REPLY_POLL
Date: Fri, 7 Feb 2025 17:58:04 +0000
Message-ID: <20250207175806.78051-4-zhiw@nvidia.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20250207175806.78051-1-zhiw@nvidia.com>
References: <20250207175806.78051-1-zhiw@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NV-OnPremToCloud: AnonymousSubmission
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF0002BA4D:EE_|PH7PR12MB8154:EE_
X-MS-Office365-Filtering-Correlation-Id: d662d2a3-389c-49f9-99bb-08dd47a10bab
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|36860700013|1800799024|376014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?uDk/kchnUexvdenyFV60NNBUivwjaNVBDCXn4aSex3/xeUttdP8yPTX511uD?=
 =?us-ascii?Q?QzJ8/IfT/6E+ZIh8eG5ylqEdeNJoSgxsdNvDXy1pe2p36Xtmw5IXUblbKOfx?=
 =?us-ascii?Q?S3UklRpIaEcHhWIBtOVppIxJxSqVBn3q06NvFxXoKbQHnkGLGEMmA+uUqXUL?=
 =?us-ascii?Q?mXTuMddZuCwO0+jtvcovgs9oBIFrNA4nM/Cw2QLPGBx1hzPWjVpKFqf/t8Ln?=
 =?us-ascii?Q?25hNL1hPZwvaUCRc7+5w5FoMQHUFLLTLVf6hElAai4vKXwmqj1+au+l3/Xdb?=
 =?us-ascii?Q?73SeSZ+2Z9JM9jceEXg/m1vM0D/UjHfT94bexujN7MSAl8ULJ9tGnPVLVKdd?=
 =?us-ascii?Q?xvmCg0GSsaKezDg1eSGepflcRzT1gCvRMO0uOBJ4etUZwKGE0bjI7Os/tswY?=
 =?us-ascii?Q?dg7olgoMFIJiiprMdJ3eIE4nQcafDAifrL7CQaqoRJzaALQLCm2Vj9EWEG4I?=
 =?us-ascii?Q?SaVy6wWsgDy2DYrQd4C5Scxj1mgeEzIR94ovjhNDTaNOFsGN9ZZJsXFugAnS?=
 =?us-ascii?Q?dlmjrsm5FYo6aewWv0LdDGzAB3VxXQ7ivhSijyNyQiM0lGWz3kIfjac4oxRT?=
 =?us-ascii?Q?3v7THiiyIPcTgqESajhR6sLwdrq0bP6+B3oMp4rnuQIQW4G2kGrwLo2IrCOl?=
 =?us-ascii?Q?rg5SYoJlnZTPIQdz/mfqT04zk/6nj/CWMK4f/67pGaJQ+M+Jn6fCV7i9IxGx?=
 =?us-ascii?Q?kZLeq9phSAnBt/hBUcQc9jdp5EWAyaR2pDCZTslRWICIus7vNRUXJ978x+iQ?=
 =?us-ascii?Q?/z7VQ6RnZIU3CIEx0EkuJKiPvUJLusR/L0YQQWEkWsjqVSWtbuFz9fKhHGZr?=
 =?us-ascii?Q?YDWJtjyuOFDquAOl3tKn97z+8G8R/uJS/qEZzBCGMQF5t55woWSWe3mSVF9u?=
 =?us-ascii?Q?Gt7aRldu6RHO9OIDcvu6qGQY/siWEYkmeOL7wz/za8gG6ukGUNm2koFJOIkp?=
 =?us-ascii?Q?CBU1x7BscexVse4e7zVKpQjgpTlMyWNAsV3aFOfhX+0RbcI6jqLgtuJSF1F7?=
 =?us-ascii?Q?YNZhBjE8FUGmGuWEyMyBPdiv1Fh6H3kk8BXsLa/l2++378xfjNPj8wOoctBu?=
 =?us-ascii?Q?AhhU3I02Wl2YCLgP35mW1vbQbdaj5q5M/avElHo3r+i2Z5+ZBY6w7+33AYPU?=
 =?us-ascii?Q?g/O68SqkHMOFydG/sTB5aqpfuc4C7k6xD5xw7SyQr3XxoTdnG+P2phg12Rns?=
 =?us-ascii?Q?e/FKPkRg2gni6QJpI2vGX1/N7I284AE/9hBBJB7oaPMdGlWNkX98u/XZoAxy?=
 =?us-ascii?Q?nSysl4vyu1npCLAeEFz/Bqkns2P/bBdABA+vbNV43DqKh0KKB3ZrPqX0ty+U?=
 =?us-ascii?Q?yb9gey45nMK61tnMMp4xerAEy3MqRMdU+7t7LO8kxUjQ/E0XRAZSAWWiQvH/?=
 =?us-ascii?Q?jNtM/5/iaxGEBbQt/SwOEelSM1cHt4vVDWqXzSoFYBhsq3uwS4AFX+B458DT?=
 =?us-ascii?Q?QDyVPuoEMdcU3PB/07c/bdpGwnQMEgS6Sarf09N3tj4m2zQDFs9RPS1aSrw9?=
 =?us-ascii?Q?S/ORqejiOrZKKcA=3D?=
X-Forefront-Antispam-Report: CIP:216.228.117.161; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge2.nvidia.com; CAT:NONE;
 SFS:(13230040)(82310400026)(36860700013)(1800799024)(376014); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Feb 2025 17:58:36.6018 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d662d2a3-389c-49f9-99bb-08dd47a10bab
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.161];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: SN1PEPF0002BA4D.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB8154
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

There can be multiple cases of handling the GSP RPC messages, which
are the reply of GSP RPC commands according to the requirement of the
callers and the nature of the GSP RPC commands.

Some GSP RPC command needs a new reply policy: "caller don't care about
the message content but want to make sure a reply is received". To
support this case, a new reply policy is introduced.

Introduce new reply policy NVKM_GSP_RPC_REPLY_POLL, which waits for the
returned GSP message but discards it for the caller.

No functional change is intended.

Signed-off-by: Zhi Wang <zhiw@nvidia.com>
---
 drivers/gpu/drm/nouveau/include/nvkm/subdev/gsp.h | 1 +
 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c    | 3 +++
 2 files changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/nouveau/include/nvkm/subdev/gsp.h b/drivers/gpu/drm/nouveau/include/nvkm/subdev/gsp.h
index c467e44cab47..bc16510261b8 100644
--- a/drivers/gpu/drm/nouveau/include/nvkm/subdev/gsp.h
+++ b/drivers/gpu/drm/nouveau/include/nvkm/subdev/gsp.h
@@ -33,6 +33,7 @@ typedef void (*nvkm_gsp_event_func)(struct nvkm_gsp_event *, void *repv, u32 rep
 
 enum {
 	NVKM_GSP_RPC_REPLY_RECV = 1,
+	NVKM_GSP_RPC_REPLY_POLL,
 };
 
 struct nvkm_gsp {
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c
index bc8eb9a3cb28..af2836cca38f 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c
@@ -601,6 +601,9 @@ r535_gsp_rpc_handle_reply(struct nvkm_gsp *gsp, u32 fn, int reply,
 		else
 			repv = msg;
 		break;
+	case NVKM_GSP_RPC_REPLY_POLL:
+		repv = r535_gsp_msg_recv(gsp, fn, 0);
+		break;
 	default:
 		repv = ERR_PTR(-EINVAL);
 		break;
-- 
2.43.5

