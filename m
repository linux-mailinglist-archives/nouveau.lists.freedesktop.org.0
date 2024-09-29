Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 36C9D9897E6
	for <lists+nouveau@lfdr.de>; Sun, 29 Sep 2024 23:29:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1DE6310E38F;
	Sun, 29 Sep 2024 21:29:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="qxOINmsh";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1nam02on2045.outbound.protection.outlook.com [40.107.96.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 30C4B10E171
 for <nouveau@lists.freedesktop.org>; Sun, 29 Sep 2024 12:09:19 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=y7Yp1pqW04+EslKd1OntVACnCvgsGibjxTRj4rozlbhBWNcuLUDb7HicAikiw/YKVEbEQyXGdShBjIQA5xiiZ3QJj/fjQ8cZ/JivZu6QZfIcfTG/OyBbX69hKD7yFA5VfoWoW3gjhTGOEeSpcGpOClFmV7x9uEUvLmQe8p63yYlS0GQl7llu3FcYdatwozOoDPaljHoTPQmJEJGlpFIeDm466uDh0/shZ1kJEA3M3jWe6RgnriGKFu4HqnIiRbmiPG7eW/eITuqH2ZZcj+e94/MU9KVQiDIsH5hCKCPxa4Uw+HGjDhBv6exKdG9wePZa4+JSkddnQPh+M/sc2qTmxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XJqP4zemDkW4wrwSO612eOvMgNvjKhmdH4FHsV63vOs=;
 b=JiFPTo9Okyp/0JZGCkuD0zgIHL0rQ5C+yXQbm27nxSzKvG3D0Hf7FY5KroiBQgnaAzmbK8uZvm7VEw0EZZiniC/iuPIoUqurwPN6uFB0ea/6Fu68iZMZUBS5S9d+EXeFht/faTrNslppqRKeXp9i90duNa08S9muPK6omTlfzj0N594nt9wIQlCE2S2uYDfA0t0KE22+X2FbJHl7dCpnld+Gp/FcNBJQ1tXTrTactMg6tKu19pipyZG/EljRmKMQFBkI+9diyFOxZMz5XubCfuOVAy71wqPXWWpAFNawzSMoQ6eEzlBjZfV8cwSFhfVUU4+HPHlsfFlvFD6nZWXKCw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XJqP4zemDkW4wrwSO612eOvMgNvjKhmdH4FHsV63vOs=;
 b=qxOINmshabevYJSQNiDONJiyOn4BmkfufUsfjyELrvbvRpoFv6z2PpX/sXX6JKJ/gX9rlNvOaiCzStMv5TjuTeqlEh146Pm/crkzbH5yzTgRP2St8+pvM7SRJ6uvw0p5Ta2Ku00PN65QcrkJs5tIqHnrLiRquar3u0wD3pPVcjDISJ0w0MXWc7OLx+d9V+mgtf35QW1zdsD2lFmdgEbnKOvlVeFTtJoMu0FT7K+mgpgMSAKNBcPzTwXTx/ur0jy8JZ46+MdXW8pRkcaNoX6mn6iyi6y3HBx/tIxFIZABa8Ud4xAhRrbC4ZlYig7HPBHHTAZSEfYx02nswR6zOwuFCw==
Received: from DS7P222CA0028.NAMP222.PROD.OUTLOOK.COM (2603:10b6:8:2e::21) by
 DM4PR12MB7504.namprd12.prod.outlook.com (2603:10b6:8:110::6) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8005.25; Sun, 29 Sep 2024 12:09:14 +0000
Received: from CY4PEPF0000EE39.namprd03.prod.outlook.com
 (2603:10b6:8:2e:cafe::62) by DS7P222CA0028.outlook.office365.com
 (2603:10b6:8:2e::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8005.26 via Frontend
 Transport; Sun, 29 Sep 2024 12:09:14 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 CY4PEPF0000EE39.mail.protection.outlook.com (10.167.242.11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8026.11 via Frontend Transport; Sun, 29 Sep 2024 12:09:14 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Sun, 29 Sep
 2024 05:09:03 -0700
Received: from rnnvmail204.nvidia.com (10.129.68.6) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Sun, 29 Sep
 2024 05:09:02 -0700
Received: from vdi.nvidia.com (10.127.8.9) by mail.nvidia.com (10.129.68.6)
 with Microsoft SMTP Server id 15.2.1544.4 via Frontend Transport; Sun, 29 Sep
 2024 05:09:01 -0700
From: Yonatan Maman <ymaman@nvidia.com>
To: <nouveau@lists.freedesktop.org>
CC: Yonatan Maman <Ymaman@Nvidia.com>, Gal Shalom <GalShalom@Nvidia.com>
Subject: [PATCH 2/2] nouveau/dmem: Fix memory leak in `migrate_to_ram` upon
 copy error
Date: Sun, 29 Sep 2024 15:08:56 +0300
Message-ID: <20240929120856.440950-3-ymaman@nvidia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240929120856.440950-1-ymaman@nvidia.com>
References: <20240929120856.440950-1-ymaman@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EE39:EE_|DM4PR12MB7504:EE_
X-MS-Office365-Filtering-Correlation-Id: bbc9227e-32e0-436a-5796-08dce07f8905
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|82310400026|36860700013|1800799024; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?ni9tLMr3CjpfG72gRzg2vE9w+B82TVodaF4Z9qCdUEo2jA57xRTj+GlcbRHY?=
 =?us-ascii?Q?0L9z4UExMH2iQRlsUruH2ylMpGQ6bpZWSOLTVq7gR8rcXCR9sugAcCwSNeqO?=
 =?us-ascii?Q?eoTgAF3H7474m/9Yvxg9cQtu1lq3Rgr6PuP+85At0jt8DogomvForFns3gYH?=
 =?us-ascii?Q?mTZZOO+qdYSd04aDID3wN1d2eNt5Rn4v89isEdYyJcSkq6gAy6ezbjV1p/d4?=
 =?us-ascii?Q?klb1KA1yc3kV4UAc28Gq2QP6E3KBOVX3MbezgAAcus6x8yW7Gc8Skg2mO+TF?=
 =?us-ascii?Q?CTmrAHn8Pv/eA+7klNRhFkprepDsFzaCC1bK5QoJe3WGgnaPkx+/82pVc3BH?=
 =?us-ascii?Q?Au7jO9HIVK9++etEdj/zp2XdGsk4LQpPMg2ZOaQhRxkc0H1KkyP94CZOoGRf?=
 =?us-ascii?Q?p0GLLECZ80Z8dW3JQ0ijihdUHNn33AmdatH9PsRDjlptEwLwNPcejUWdFMGT?=
 =?us-ascii?Q?FruCMNTzML2gmt/vhOr2N1dZOjmdbhRThj5gh/jHBTRyyF/FVBgj512WfC6R?=
 =?us-ascii?Q?hibhsTbw/kKQ2HSj3f6KM87IDUXevySJ1et/GCoyMRtrpUR9cSyv3Ti1Nco7?=
 =?us-ascii?Q?/6b7nPjUs3w/FoCwtTY6Rq4/7dKMZwonZShqm+nb594wVFT74FUKlfn6WrEC?=
 =?us-ascii?Q?OyiVx44unC4lWu7ZEgiDfOkAdCvubXC0C02HrSN8tqCkMI3pZDBW7XnRvURw?=
 =?us-ascii?Q?52ORT3ZJDWwAKhoYlixqDcZE5u7VztkMs/R9wlTlAoSe5oTvzh3ENGrfJRPb?=
 =?us-ascii?Q?t/YDxfIJItUhdfgSa2WIrEoAA1nqxY2xdFeGFn1bLWbjmQzXx6I1B56v+JpO?=
 =?us-ascii?Q?+yCyarJEOBqacbYbC3zgy5Giw/ssxBpYtj9pM4abBtAZBpeQMf8MGFS3PW0B?=
 =?us-ascii?Q?Lj9R2Ye0MBrp7GezWo3QZCPcItPE2DH7EwdMu4gXfFNkjYKMeTpD9vysS+Yk?=
 =?us-ascii?Q?0ZhCJsiZuZHcmpUKEmc49waWqUeboeK/UVDeJFGIbj/vG/bOaTBifQU7Telo?=
 =?us-ascii?Q?oc5CW4NHrnQ0Egq5SjSYiX/tMCS6dNTXToU98MJINJegrP+3HraZ6ci4abW4?=
 =?us-ascii?Q?C6x2IYuZFT325gsFVW0ExiYpOE7VN2hvd/U6Rve0cRQ5T7Pjwg3HUujP3Paa?=
 =?us-ascii?Q?XPDXozvjkK4rsSJiI8TovggYm5Dg2cwLPCl/CJe9fqJaz12m2pYCwB8TmeZC?=
 =?us-ascii?Q?1SHAFxbASZ+gWANPt4w3PiIKxlmJ0EQloVq+uiGvd7JTISVzz30VteFYE2SX?=
 =?us-ascii?Q?ACJP3rALoM5qCBT7yyVWkGDVMYW68ztEhoYAxVmxzKWapbBYLNZA8Tr8K3nD?=
 =?us-ascii?Q?30lOZGs0/K4/EcZRn8J2RTkpkz8P9LsSbasCtz67M2aTGFK0Y8x9QWrU69hT?=
 =?us-ascii?Q?R8fwh7jR49DLGQdTgZaPszZciV83?=
X-Forefront-Antispam-Report: CIP:216.228.117.161; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge2.nvidia.com; CAT:NONE;
 SFS:(13230040)(376014)(82310400026)(36860700013)(1800799024); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2024 12:09:14.2814 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bbc9227e-32e0-436a-5796-08dce07f8905
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.161];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CY4PEPF0000EE39.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB7504
X-Mailman-Approved-At: Sun, 29 Sep 2024 21:29:23 +0000
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

From: Yonatan Maman <Ymaman@Nvidia.com>

A copy push command might fail, causing `migrate_to_ram` to return a
dirty HIGH_USER page to the user.

This exposes a security vulnerability in the nouveau driver. To prevent
memory leaks in `migrate_to_ram` upon a copy error, allocate a zero
page for the destination page.

Signed-off-by: Yonatan Maman <Ymaman@Nvidia.com>
Signed-off-by: Gal Shalom <GalShalom@Nvidia.com>
---
 drivers/gpu/drm/nouveau/nouveau_dmem.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_dmem.c b/drivers/gpu/drm/nouveau/nouveau_dmem.c
index 6fb65b01d778..097bd3af0719 100644
--- a/drivers/gpu/drm/nouveau/nouveau_dmem.c
+++ b/drivers/gpu/drm/nouveau/nouveau_dmem.c
@@ -193,7 +193,7 @@ static vm_fault_t nouveau_dmem_migrate_to_ram(struct vm_fault *vmf)
 	if (!spage || !(src & MIGRATE_PFN_MIGRATE))
 		goto done;
 
-	dpage = alloc_page_vma(GFP_HIGHUSER, vmf->vma, vmf->address);
+	dpage = alloc_page_vma(GFP_HIGHUSER | __GFP_ZERO, vmf->vma, vmf->address);
 	if (!dpage)
 		goto done;
 
-- 
2.34.1

