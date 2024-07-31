Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A4DA89897C6
	for <lists+nouveau@lfdr.de>; Sun, 29 Sep 2024 23:29:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C10210E2B1;
	Sun, 29 Sep 2024 21:29:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="T4h17O0e";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2063.outbound.protection.outlook.com [40.107.223.63])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5169D10E64C
 for <nouveau@lists.freedesktop.org>; Wed, 31 Jul 2024 17:38:45 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nklrkcyaQEpLefXKAZk5Rov+0OkXEOgNOKFO9Quc+KsPAbfT8+6CtvF2VON0SRqlqPtKeWHUbHOVG2ftM8bgGLSfvFvYqIVnC99I1AnagguaQ5+N82NOLBLkd3mfcMf+addfuw51pVsi0bcKlfvQ/Z6q7mnxWFj+UAJGxlEQMyelNBPLSSAaSpX207ZYxPPJkVUEjgp+e419lev66v6mdejI6vDn6pirfff7/6BS/ajx13PREZLDd9aQPpwKas89KPeNGAxsinitWlHjWlyR/Xkgj0II2G/U/ORDwN52hHmzuQfVkoI7f8MNQ9/ChA9+Qyus9ZyuwJzNdB4ibORaIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IfO439/+ao8jzRnkhWV4UWmlht9rLWsjVJn2tBL7S8M=;
 b=SiICTcddsmEt7ZMKlT/VjidSb06yMh+7ZZi8Gg521zIsgB2Pyl6MVnJ7EbjlkbB6wAA4z9dsUZzh/TlOND/lWWJpxoP1PbMytXGbMEbf5Y3FKfPTKi5ustNg7Df3SAmvS5LUqzvfSgSOIH7aSjipwSgKb0pKnxDB2c447aqiRHysnhYovMzgZYZ1LlFYK/1JzsLft84LAiP+7dXv/QjMLA0JLHHev43+BFHaXvNH2Vh/x1n3YgTKKtZUWJ68diQnXFeA1pWTAotbLvSFdDbkCVT1CVqoEXXfNmOZEyrZ7gXC/etu95Iy5cgNJhCkm2DvLBauTA6ba32qLX3beLqzbg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IfO439/+ao8jzRnkhWV4UWmlht9rLWsjVJn2tBL7S8M=;
 b=T4h17O0eO319DQ/isGwrUwmOJiuqzusBVYaiigRINaD4WSWksIiXA4oo1dDgIfBH0xjzqZrLOnGIdx927JW9lUi/IboGNTSBIiWyXx7RMGDrHqOInddQZF2EjoUbqtNtp+ZJ1JvTHsM5EqBAtPstLkiLTOpJJ/zTt9k1oVSyJ3az6frZtf3IjL0barHNFeGpvEMXMYsOm3745dtGqvICe4woo+sBNubcjxNyVJwY1JIVitRRKuk0cO5UpR4Sde+4tSsc3WJ3UJNBgDNey1QjGnYYscN5XIxLAH4RgRPtD6tCMFlRuBQ44iQ4EQ2v8rXUdpUZ/qivcTbsiiviDO+Daw==
Received: from MN0P222CA0003.NAMP222.PROD.OUTLOOK.COM (2603:10b6:208:531::13)
 by PH8PR12MB8429.namprd12.prod.outlook.com (2603:10b6:510:258::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.28; Wed, 31 Jul
 2024 17:38:40 +0000
Received: from BL02EPF0001A0FF.namprd03.prod.outlook.com
 (2603:10b6:208:531:cafe::37) by MN0P222CA0003.outlook.office365.com
 (2603:10b6:208:531::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.21 via Frontend
 Transport; Wed, 31 Jul 2024 17:38:38 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 BL02EPF0001A0FF.mail.protection.outlook.com (10.167.242.106) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7828.19 via Frontend Transport; Wed, 31 Jul 2024 17:38:38 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Wed, 31 Jul
 2024 10:38:21 -0700
Received: from rnnvmail205.nvidia.com (10.129.68.10) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Wed, 31 Jul
 2024 10:38:20 -0700
Received: from localhost (10.127.8.13) by mail.nvidia.com (10.129.68.10) with
 Microsoft SMTP Server id 15.2.1544.4 via Frontend Transport;
 Wed, 31 Jul 2024 10:38:19 -0700
Date: Wed, 31 Jul 2024 20:38:19 +0300
From: Zhi Wang <zhiw@nvidia.com>
To: Ben Skeggs <bskeggs@nvidia.com>
CC: <nouveau@lists.freedesktop.org>, <zhiwang@kernel.org>
Subject: Re: [PATCH v3 25/37] drm/nouveau/nvif: remove device rd/wr
Message-ID: <20240731203819.0000172e.zhiw@nvidia.com>
In-Reply-To: <20240726043828.58966-26-bskeggs@nvidia.com>
References: <20240726043828.58966-1-bskeggs@nvidia.com>
 <20240726043828.58966-26-bskeggs@nvidia.com>
Organization: NVIDIA
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.38; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0001A0FF:EE_|PH8PR12MB8429:EE_
X-MS-Office365-Filtering-Correlation-Id: 91207237-b325-4177-3963-08dcb1879c64
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|82310400026|1800799024|376014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?msIZlQ+EJa+tBz7FibMh4j2eX4aYsmI00rXPN4HdXbZwbEixqQAwpVOiyjaT?=
 =?us-ascii?Q?M/daiL/QxiAvuIqqvjZvalsQ9zkwhSQzzW5+1KfBbLMBimiY7mFc9uaj4Yfm?=
 =?us-ascii?Q?EwUQBNKN2tB1fWTpVYfcLbAQYOW59z8ZSFyyVPCPthaXpJHdp0eWdGSKEruE?=
 =?us-ascii?Q?KR7bMH4wpCNW6IXBNiCsz7jNf1dcOP/PtlYmjvQb6GyS2JEGOmz2v1TUPwd2?=
 =?us-ascii?Q?DPA/1q1UgmCOlwREwqjNaYkljArxjLgluCGq+gJNg1uc+QFTltv1wgiXOQEC?=
 =?us-ascii?Q?944Q82fpC1JZU85Zb16OTRr/11a8QtEe2oclCBOi1FgC9sqYW5hiJgJhByiy?=
 =?us-ascii?Q?wj2gL6jJQW07W3UvSlVdMKR922h5FLcxTKJmssxhC50NuGmXzAO1ByIsuCfW?=
 =?us-ascii?Q?XbZcvTnDs20Ed8k83fs6I4vFpeLuBkXmOyzIOjiUYbOgiHfjFibK/UEqMi/E?=
 =?us-ascii?Q?+VUtkCWxLWE1S8to/qUzVYOnALl/V/7P2EbTPv3Jw1VhRwG2Zz+s2hnef8TY?=
 =?us-ascii?Q?XPODm/67jqPYVCiBJ6URFdpzG5qYsW7DQFZlMh7Et04TySwrWj7dT5obc3Db?=
 =?us-ascii?Q?ua5OaI89LbpLb7u0klgJMgSrN54L+edzfJ/y+GQ2gEKIip4tEuClTZ/yErFi?=
 =?us-ascii?Q?qoEGOmWQr14ggWQ0HH2hCQQ8RPG01cRdFBAsTGujkhxHHL9WhQAM3K7CqTVe?=
 =?us-ascii?Q?bfCq8MOmHfbKx6cnJb5PKk9dATdZ+S/3ukRp0ogHTb/jMX7lHTJ/Sa1viXOs?=
 =?us-ascii?Q?sMZ7Sqt2WTKvNP9GTFcW0kskpoE2qsQtXb63OpmXi+mMTx9Bv7kf9unHk54B?=
 =?us-ascii?Q?Dmm8tpdo7PmFYSka+c2lcRPcPPoiGGpN/2f6re7EFGf2yaescyMFnFdpepIw?=
 =?us-ascii?Q?7Qad7nM2MvvlTWREPSHk+PfUNq36BVGuRDFpmW5o8J4SI4LhTpEiFq+99FDs?=
 =?us-ascii?Q?+VUhcNNxhKdTYbjVJVyF2NXM27ZNKtfJdqYPAb9h7FEglNrtHoVfcQGBPIWp?=
 =?us-ascii?Q?P6MYf3GVLG0fVW5AHsAyqPU9F3FqEkQ8AvlXc+RslL+LgQWbj9ueKh8sU6TP?=
 =?us-ascii?Q?c/Ewc2o5iuBL0j+/voP/ZEunbs4VeTSt8C768MacGVisIwkzPzgP9vYqv6GW?=
 =?us-ascii?Q?KBW2t/lBwiva9yGAzb8yDzIKUbRXvyeROlgIPenBtxK5EjRLI/MgR+IAPqqI?=
 =?us-ascii?Q?cxFItWzr95rpBIcTcQpVxA9XdcZe5lapdmocM8aGVXhZHp6rQk38qFlncqJt?=
 =?us-ascii?Q?iiGjH1FMf6JL+ErnJuKZNgMx03cMQ/0Z5wmZvhJzrUFOhA7ySTn1fMAVs/4z?=
 =?us-ascii?Q?+dlymlR5Zi7rCBmIfPRL/gKQ2+AQdXHXrXN3i1A0HeLjgHdPKjaArROjGuU+?=
 =?us-ascii?Q?SiwCJu03ph5PG1HL0hI03kzgoPDIgGyKuega8YKSY0boOTpHlBVGHYAYNTlE?=
 =?us-ascii?Q?FrlB9UAhqMzB1xfoBSAsT7lUBCRBgIYz?=
X-Forefront-Antispam-Report: CIP:216.228.117.161; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge2.nvidia.com; CAT:NONE;
 SFS:(13230040)(36860700013)(82310400026)(1800799024)(376014); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jul 2024 17:38:38.0251 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 91207237-b325-4177-3963-08dcb1879c64
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.161];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BL02EPF0001A0FF.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB8429
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

On Fri, 26 Jul 2024 14:38:16 +1000
Ben Skeggs <bskeggs@nvidia.com> wrote:

Curious why the "(*{rd, wr}_32)()" are not removed together with others
in this patch?

Also, it would be better to put the removal of the udevice {rd, wr}*
callbacks in another new patch? As the tittle of this patch is for
cleaning the nvif, while udevice layer uses the nvkm_{rd,wr}, which
directly use io{read, write}*. I suppose it is not tied to nvif.

> The previous commit ensures the device is always mapped, so these
> are unneeded.
> 
> Signed-off-by: Ben Skeggs <bskeggs@nvidia.com>
> ---
>  .../drm/nouveau/include/nvkm/core/object.h    |  8 ---
>  drivers/gpu/drm/nouveau/nvkm/core/ioctl.c     | 10 ----
>  drivers/gpu/drm/nouveau/nvkm/core/object.c    | 32 -----------
>  drivers/gpu/drm/nouveau/nvkm/core/oproxy.c    | 28 ----------
>  .../gpu/drm/nouveau/nvkm/engine/device/user.c | 54
> ------------------- 5 files changed, 132 deletions(-)
> 
> diff --git a/drivers/gpu/drm/nouveau/include/nvkm/core/object.h
> b/drivers/gpu/drm/nouveau/include/nvkm/core/object.h index
> d4f1c964ba31..c91abac44bd6 100644 ---
> a/drivers/gpu/drm/nouveau/include/nvkm/core/object.h +++
> b/drivers/gpu/drm/nouveau/include/nvkm/core/object.h @@ -33,11 +33,7
> @@ struct nvkm_object_func { int (*map)(struct nvkm_object *, void
> *argv, u32 argc, enum nvkm_object_map *, u64 *addr, u64 *size);
>  	int (*unmap)(struct nvkm_object *);
> -	int (*rd08)(struct nvkm_object *, u64 addr, u8 *data);
> -	int (*rd16)(struct nvkm_object *, u64 addr, u16 *data);
>  	int (*rd32)(struct nvkm_object *, u64 addr, u32 *data);
> -	int (*wr08)(struct nvkm_object *, u64 addr, u8 data);
> -	int (*wr16)(struct nvkm_object *, u64 addr, u16 data);
>  	int (*wr32)(struct nvkm_object *, u64 addr, u32 data);
>  	int (*bind)(struct nvkm_object *, struct nvkm_gpuobj *, int
> align, struct nvkm_gpuobj **);
> @@ -61,11 +57,7 @@ int nvkm_object_ntfy(struct nvkm_object *, u32
> mthd, struct nvkm_event **); int nvkm_object_map(struct nvkm_object
> *, void *argv, u32 argc, enum nvkm_object_map *, u64 *addr, u64
> *size); int nvkm_object_unmap(struct nvkm_object *);
> -int nvkm_object_rd08(struct nvkm_object *, u64 addr, u8  *data);
> -int nvkm_object_rd16(struct nvkm_object *, u64 addr, u16 *data);
>  int nvkm_object_rd32(struct nvkm_object *, u64 addr, u32 *data);
> -int nvkm_object_wr08(struct nvkm_object *, u64 addr, u8   data);
> -int nvkm_object_wr16(struct nvkm_object *, u64 addr, u16  data);
>  int nvkm_object_wr32(struct nvkm_object *, u64 addr, u32  data);
>  int nvkm_object_bind(struct nvkm_object *, struct nvkm_gpuobj *, int
> align, struct nvkm_gpuobj **);
> diff --git a/drivers/gpu/drm/nouveau/nvkm/core/ioctl.c
> b/drivers/gpu/drm/nouveau/nvkm/core/ioctl.c index
> 584fc43c0d75..95e9537e1d7c 100644 ---
> a/drivers/gpu/drm/nouveau/nvkm/core/ioctl.c +++
> b/drivers/gpu/drm/nouveau/nvkm/core/ioctl.c @@ -206,14 +206,6 @@
> nvkm_ioctl_rd(struct nvkm_client *client, nvif_ioctl(object, "rd vers
> %d size %d addr %016llx\n", args->v0.version, args->v0.size,
> args->v0.addr); switch (args->v0.size) {
> -		case 1:
> -			ret = nvkm_object_rd08(object,
> args->v0.addr, &v.b08);
> -			args->v0.data = v.b08;
> -			break;
> -		case 2:
> -			ret = nvkm_object_rd16(object,
> args->v0.addr, &v.b16);
> -			args->v0.data = v.b16;
> -			break;
>  		case 4:
>  			ret = nvkm_object_rd32(object,
> args->v0.addr, &v.b32); args->v0.data = v.b32;
> @@ -246,8 +238,6 @@ nvkm_ioctl_wr(struct nvkm_client *client,
>  		return ret;
>  
>  	switch (args->v0.size) {
> -	case 1: return nvkm_object_wr08(object, args->v0.addr,
> args->v0.data);
> -	case 2: return nvkm_object_wr16(object, args->v0.addr,
> args->v0.data); case 4: return nvkm_object_wr32(object,
> args->v0.addr, args->v0.data); default:
>  		break;
> diff --git a/drivers/gpu/drm/nouveau/nvkm/core/object.c
> b/drivers/gpu/drm/nouveau/nvkm/core/object.c index
> 580b8c7f25af..913c3bae51f7 100644 ---
> a/drivers/gpu/drm/nouveau/nvkm/core/object.c +++
> b/drivers/gpu/drm/nouveau/nvkm/core/object.c @@ -132,22 +132,6 @@
> nvkm_object_unmap(struct nvkm_object *object) return -ENODEV;
>  }
>  
> -int
> -nvkm_object_rd08(struct nvkm_object *object, u64 addr, u8 *data)
> -{
> -	if (likely(object->func->rd08))
> -		return object->func->rd08(object, addr, data);
> -	return -ENODEV;
> -}
> -
> -int
> -nvkm_object_rd16(struct nvkm_object *object, u64 addr, u16 *data)
> -{
> -	if (likely(object->func->rd16))
> -		return object->func->rd16(object, addr, data);
> -	return -ENODEV;
> -}
> -
>  int
>  nvkm_object_rd32(struct nvkm_object *object, u64 addr, u32 *data)
>  {
> @@ -156,22 +140,6 @@ nvkm_object_rd32(struct nvkm_object *object, u64
> addr, u32 *data) return -ENODEV;
>  }
>  
> -int
> -nvkm_object_wr08(struct nvkm_object *object, u64 addr, u8 data)
> -{
> -	if (likely(object->func->wr08))
> -		return object->func->wr08(object, addr, data);
> -	return -ENODEV;
> -}
> -
> -int
> -nvkm_object_wr16(struct nvkm_object *object, u64 addr, u16 data)
> -{
> -	if (likely(object->func->wr16))
> -		return object->func->wr16(object, addr, data);
> -	return -ENODEV;
> -}
> -
>  int
>  nvkm_object_wr32(struct nvkm_object *object, u64 addr, u32 data)
>  {
> diff --git a/drivers/gpu/drm/nouveau/nvkm/core/oproxy.c
> b/drivers/gpu/drm/nouveau/nvkm/core/oproxy.c index
> 3385528da650..afc10ec256a7 100644 ---
> a/drivers/gpu/drm/nouveau/nvkm/core/oproxy.c +++
> b/drivers/gpu/drm/nouveau/nvkm/core/oproxy.c @@ -55,36 +55,12 @@
> nvkm_oproxy_unmap(struct nvkm_object *object) return
> nvkm_object_unmap(oproxy->object); }
>  
> -static int
> -nvkm_oproxy_rd08(struct nvkm_object *object, u64 addr, u8 *data)
> -{
> -	return nvkm_object_rd08(nvkm_oproxy(object)->object, addr,
> data); -}
> -
> -static int
> -nvkm_oproxy_rd16(struct nvkm_object *object, u64 addr, u16 *data)
> -{
> -	return nvkm_object_rd16(nvkm_oproxy(object)->object, addr,
> data); -}
> -
>  static int
>  nvkm_oproxy_rd32(struct nvkm_object *object, u64 addr, u32 *data)
>  {
>  	return nvkm_object_rd32(nvkm_oproxy(object)->object, addr,
> data); }
>  
> -static int
> -nvkm_oproxy_wr08(struct nvkm_object *object, u64 addr, u8 data)
> -{
> -	return nvkm_object_wr08(nvkm_oproxy(object)->object, addr,
> data); -}
> -
> -static int
> -nvkm_oproxy_wr16(struct nvkm_object *object, u64 addr, u16 data)
> -{
> -	return nvkm_object_wr16(nvkm_oproxy(object)->object, addr,
> data); -}
> -
>  static int
>  nvkm_oproxy_wr32(struct nvkm_object *object, u64 addr, u32 data)
>  {
> @@ -197,11 +173,7 @@ nvkm_oproxy_func = {
>  	.ntfy = nvkm_oproxy_ntfy,
>  	.map = nvkm_oproxy_map,
>  	.unmap = nvkm_oproxy_unmap,
> -	.rd08 = nvkm_oproxy_rd08,
> -	.rd16 = nvkm_oproxy_rd16,
>  	.rd32 = nvkm_oproxy_rd32,
> -	.wr08 = nvkm_oproxy_wr08,
> -	.wr16 = nvkm_oproxy_wr16,
>  	.wr32 = nvkm_oproxy_wr32,
>  	.bind = nvkm_oproxy_bind,
>  	.sclass = nvkm_oproxy_sclass,
> diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/device/user.c
> b/drivers/gpu/drm/nouveau/nvkm/engine/device/user.c index
> 65bd6712bce2..d7f75b3a43c8 100644 ---
> a/drivers/gpu/drm/nouveau/nvkm/engine/device/user.c +++
> b/drivers/gpu/drm/nouveau/nvkm/engine/device/user.c @@ -202,54 +202,6
> @@ nvkm_udevice_mthd(struct nvkm_object *object, u32 mthd, void
> *data, u32 size) return -EINVAL; }
>  
> -static int
> -nvkm_udevice_rd08(struct nvkm_object *object, u64 addr, u8 *data)
> -{
> -	struct nvkm_udevice *udev = nvkm_udevice(object);
> -	*data = nvkm_rd08(udev->device, addr);
> -	return 0;
> -}
> -
> -static int
> -nvkm_udevice_rd16(struct nvkm_object *object, u64 addr, u16 *data)
> -{
> -	struct nvkm_udevice *udev = nvkm_udevice(object);
> -	*data = nvkm_rd16(udev->device, addr);
> -	return 0;
> -}
> -
> -static int
> -nvkm_udevice_rd32(struct nvkm_object *object, u64 addr, u32 *data)
> -{
> -	struct nvkm_udevice *udev = nvkm_udevice(object);
> -	*data = nvkm_rd32(udev->device, addr);
> -	return 0;
> -}
> -
> -static int
> -nvkm_udevice_wr08(struct nvkm_object *object, u64 addr, u8 data)
> -{
> -	struct nvkm_udevice *udev = nvkm_udevice(object);
> -	nvkm_wr08(udev->device, addr, data);
> -	return 0;
> -}
> -
> -static int
> -nvkm_udevice_wr16(struct nvkm_object *object, u64 addr, u16 data)
> -{
> -	struct nvkm_udevice *udev = nvkm_udevice(object);
> -	nvkm_wr16(udev->device, addr, data);
> -	return 0;
> -}
> -
> -static int
> -nvkm_udevice_wr32(struct nvkm_object *object, u64 addr, u32 data)
> -{
> -	struct nvkm_udevice *udev = nvkm_udevice(object);
> -	nvkm_wr32(udev->device, addr, data);
> -	return 0;
> -}
> -
>  static int
>  nvkm_udevice_map(struct nvkm_object *object, void *argv, u32 argc,
>  		 enum nvkm_object_map *type, u64 *addr, u64 *size)
> @@ -362,12 +314,6 @@ nvkm_udevice = {
>  	.fini = nvkm_udevice_fini,
>  	.mthd = nvkm_udevice_mthd,
>  	.map = nvkm_udevice_map,
> -	.rd08 = nvkm_udevice_rd08,
> -	.rd16 = nvkm_udevice_rd16,
> -	.rd32 = nvkm_udevice_rd32,
> -	.wr08 = nvkm_udevice_wr08,
> -	.wr16 = nvkm_udevice_wr16,
> -	.wr32 = nvkm_udevice_wr32,
>  	.sclass = nvkm_udevice_child_get,
>  };
>  

