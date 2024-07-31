Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B27FB9897CD
	for <lists+nouveau@lfdr.de>; Sun, 29 Sep 2024 23:29:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F0D910E372;
	Sun, 29 Sep 2024 21:29:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="SE1wpDa0";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2059.outbound.protection.outlook.com [40.107.92.59])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0544C10E5D2
 for <nouveau@lists.freedesktop.org>; Wed, 31 Jul 2024 11:49:28 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Q2XpX4CmQjy4sf2V/9c6wa5WOV2mra3/UbvkP+PZ9CZp/2LQBs+GYBbEw+GGdH2hpEcTTmAHiVYpUivEgfLtDFhBOwMGvAHkryBIFnOHS2M90za48FWFjuC/I0zSV6x6yESTtVxNhXju9tgwEmMiR4iAfMCGFpTp7/cORQRT6L8ot2soxPunBG7GLnFIRy92jE3sdQO2SgYk/U7W6K8NTfJqhf84FbRb1/ojHsMZrVO9pMi5nFYY70ZAkhZ7POjlRXakDY59ZHh+9VCAIHaKLoBHBNnlJw/uYugPt1kR+mAy3uuYliivdygRI9GYsSf6eIZth6heRO8308FnD1oukw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Z/F6Hny7a3qZBMYwZb1wmEsU2Kd7kI1J66ClltKqZXQ=;
 b=MRVL2Nlptmk3iti6467ShsHZzkGKI131JAtqzqnLQWGDkHMi4+EgTqiokF0N6w15h0HKqntlBdomPCGAXqm6nHLq1o/2tBJw18l8JlGQlGjl6g1PVapK0ohQ8+OXKWgWk2m40SShUxCJE5i8uLadjD4I4IBYWlqy064CD1y+hq78L8tvbyhOGbjdwOXge37QMBGKF4q8qzVgnV1FndQWqz7CC8b/Ag62W4pO2anrzlRTgNjxgyuWG2ctqHYfm147VJqCDLTbyfxNrzxT8Cs2lrZu0Uf3VECOaNpI6BG7B9wFsVF3+F/vKZeXj9b3BHynNXCg54uKdM+Hr9ZdOYSCdQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Z/F6Hny7a3qZBMYwZb1wmEsU2Kd7kI1J66ClltKqZXQ=;
 b=SE1wpDa04itXUvtPj72YucU1GlApD4dM4fg2YObKOcm63+yFXP7+PXjSCF5M+m2WkA3uYWK6FH2pjtyh1jPukTSgKps/gEztbkezK4wHlTS1h5KZ8Yv3c5wiMjZk9RZ63taGaCbcA54bMfH0/hHqTnNHtIdrabqcDblBagf+pLAKoY0nNszimrgBOKPq2EB7zaAYIXFdXsgeUPyFJJikZMPk2vk77WXAagGcw15iq6uGkPblGScT2iY2exGS/xy8kwZiCO4ChCqR8JwQiXRklndoYcUri3Kr+utiMmEV9DRA+6x4FmhkNw6iuD7NUr2XkDRzpC2LgH/iczbDZH8VyA==
Received: from SN1PR12CA0104.namprd12.prod.outlook.com (2603:10b6:802:21::39)
 by CY8PR12MB7754.namprd12.prod.outlook.com (2603:10b6:930:86::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.20; Wed, 31 Jul
 2024 11:49:23 +0000
Received: from SA2PEPF00001504.namprd04.prod.outlook.com
 (2603:10b6:802:21:cafe::8f) by SN1PR12CA0104.outlook.office365.com
 (2603:10b6:802:21::39) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.34 via Frontend
 Transport; Wed, 31 Jul 2024 11:49:22 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 SA2PEPF00001504.mail.protection.outlook.com (10.167.242.36) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7828.19 via Frontend Transport; Wed, 31 Jul 2024 11:49:22 +0000
Received: from rnnvmail204.nvidia.com (10.129.68.6) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Wed, 31 Jul
 2024 04:49:12 -0700
Received: from rnnvmail204.nvidia.com (10.129.68.6) by rnnvmail204.nvidia.com
 (10.129.68.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Wed, 31 Jul
 2024 04:49:12 -0700
Received: from localhost (10.127.8.13) by mail.nvidia.com (10.129.68.6) with
 Microsoft SMTP Server id 15.2.1544.4 via Frontend Transport; Wed, 31 Jul 2024
 04:49:11 -0700
Date: Wed, 31 Jul 2024 14:49:10 +0300
From: Zhi Wang <zhiw@nvidia.com>
To: Ben Skeggs <bskeggs@nvidia.com>
CC: <nouveau@lists.freedesktop.org>, <zhiwang@kernel.org>
Subject: Re: [PATCH v3 22/37] drm/nouveau/nvif: remove client fini
Message-ID: <20240731144910.0000121b.zhiw@nvidia.com>
In-Reply-To: <20240726043828.58966-23-bskeggs@nvidia.com>
References: <20240726043828.58966-1-bskeggs@nvidia.com>
 <20240726043828.58966-23-bskeggs@nvidia.com>
Organization: NVIDIA
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.38; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF00001504:EE_|CY8PR12MB7754:EE_
X-MS-Office365-Filtering-Correlation-Id: 885b60df-bd02-456e-131f-08dcb156d1e0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|36860700013|82310400026|1800799024; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?HaFp34UyybzYuhWYfh4eRlWvTONV/6inmX5vybunlatcuya4yzOPX/0WgzxD?=
 =?us-ascii?Q?vuLVwdXyabQPncIYeya8UuKWsTbebM7uCKh3oURSHn2F7Sxz0m7a9i8xYy63?=
 =?us-ascii?Q?mSP19G9S7mPRiU4Ygwhug5BuxrVJ7cEK7G5SHHke5opw1JAQSr4d5hseUmdS?=
 =?us-ascii?Q?3ywWivspuCHggP0pUd79oIJ34iwvyaDrxKuXCmUb4oXKzOmNsxa+9nyhSVMf?=
 =?us-ascii?Q?4gCUS5rX0jhvksT3zfHe5zJf3mb2yMlAuWVZervPoEMsVuvo/FX9AnJhb+NI?=
 =?us-ascii?Q?y1fQw1rFUPVeh5RBNXPI1ccbuH1LO1tr/cita2ncsnfm4m9J4cQNAJXNYVtB?=
 =?us-ascii?Q?9QwkOeVUokFtFBHPooM7VdgwxVEIsuldTSE48vXvrakvm1IH8CRXo/QNDabY?=
 =?us-ascii?Q?rMabr9LUOY6prMGQ7kbBwwDEPbZ+k2YsytACAu1Hjj7DV+/eIwAGsrZMlqfb?=
 =?us-ascii?Q?K98XWUGvcpBD/EOshs9FqK6yS90AEyd0HWAlrOjRPHIp98ygOLsJN+YkiqtK?=
 =?us-ascii?Q?diltkFU1180KUOg45kEnHeBDJoZN9DfmXKZ5yd1Oogw2d437auT0uAY4Ao+r?=
 =?us-ascii?Q?/xGsAHcZBuhDutT6i4gsM07mTTRwNIiUk25maPOT+aA18ME1mur5ZSXN83bx?=
 =?us-ascii?Q?LwOBCcHRByGwPdYRUn+M2GkkAQ4MlVo65sx5bajhQ4C+S7EGlavBJs6yUq3m?=
 =?us-ascii?Q?7fgaOiSY+rohco2aQedUgd+UYp//57LVc8vWpEZlvUO6BuUZig7JVCmNKC3r?=
 =?us-ascii?Q?hjhplYtYnW9A+cQZBG3RyYAHmzhIH9YIURLIRNjvRZuogHC03v0Rblv6cqQD?=
 =?us-ascii?Q?hpZcFB6zOCHCjskyG1pg6qI6rI4zLGanYeauA6e/yGXr06MknICel+lyvAiJ?=
 =?us-ascii?Q?OIDDpTjKgQl+e8VMQDUcJrnZgc1SMLTE6JlS1esLVNMvaGmF8gYdTVysDQe5?=
 =?us-ascii?Q?Ks2yd5ZNL/9qZ2QMGGx6y3KgW0LjnFXTqSWVj7zIuC8djoEWcS7aj55bG6SP?=
 =?us-ascii?Q?iBJ+IWd7ZBBf2wasSEh+T3wRoQBiAnmiPI5t/h5NlPaytlMWDKTSDlybA3Rt?=
 =?us-ascii?Q?NNTVFeEEJPHASZQBlrtwVlaql8/LFi/BhlED+NH7/76WKi4FalocVjWKGhZZ?=
 =?us-ascii?Q?gb+/JxKrQ625Y99nztuoWtnvrrccYGiz6fm4vj6Fb6k7PBA0yrPB2DBQrVbO?=
 =?us-ascii?Q?TZsR7vOAfkf5ReeecJ6FjpKj+Cx2NzQ+UEdrgj2soRvnLpyajosfse3TSa4V?=
 =?us-ascii?Q?G4kM2FLTv7+6NrwNBxeBP0a9PAI/5QQjZKtvigASV3G4GBrb2uusf9aetBsS?=
 =?us-ascii?Q?CMldgdOIqExEK6vLOmILeCaFmeLvM7cZT08y4bK2j4pxD9ciboYGC4e6AaDy?=
 =?us-ascii?Q?UQ9XNzI9OLZtIdiMy1GxSdXd5uUn0/AVMaRYp3tvaOsvJpmNnkeLIMaJ3TmQ?=
 =?us-ascii?Q?GZ6sCsRPD6idPeaJmhfpPLO+ebpAVP26?=
X-Forefront-Antispam-Report: CIP:216.228.117.161; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge2.nvidia.com; CAT:NONE;
 SFS:(13230040)(376014)(36860700013)(82310400026)(1800799024); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jul 2024 11:49:22.5100 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 885b60df-bd02-456e-131f-08dcb156d1e0
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.161];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: SA2PEPF00001504.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7754
X-Mailman-Approved-At: Sun, 29 Sep 2024 21:28:50 +0000
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

On Fri, 26 Jul 2024 14:38:13 +1000
Ben Skeggs <bskeggs@nvidia.com> wrote:

Reviewed-by: Zhi Wang <zhiw@nvidia.com>

> Does nothing.  Remove it.
> 
> Signed-off-by: Ben Skeggs <bskeggs@nvidia.com>
> ---
>  drivers/gpu/drm/nouveau/nvkm/core/client.c | 7 -------
>  1 file changed, 7 deletions(-)
> 
> diff --git a/drivers/gpu/drm/nouveau/nvkm/core/client.c
> b/drivers/gpu/drm/nouveau/nvkm/core/client.c index
> 5c87146b8508..72c88db627a5 100644 ---
> a/drivers/gpu/drm/nouveau/nvkm/core/client.c +++
> b/drivers/gpu/drm/nouveau/nvkm/core/client.c @@ -90,12 +90,6 @@
> nvkm_client_child_get(struct nvkm_object *object, int index, return 0;
>  }
>  
> -static int
> -nvkm_client_fini(struct nvkm_object *object, bool suspend)
> -{
> -	return 0;
> -}
> -
>  static void *
>  nvkm_client_dtor(struct nvkm_object *object)
>  {
> @@ -105,7 +99,6 @@ nvkm_client_dtor(struct nvkm_object *object)
>  static const struct nvkm_object_func
>  nvkm_client = {
>  	.dtor = nvkm_client_dtor,
> -	.fini = nvkm_client_fini,
>  	.sclass = nvkm_client_child_get,
>  };
>  

