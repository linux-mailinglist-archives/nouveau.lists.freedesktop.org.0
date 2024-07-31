Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CB4719897BB
	for <lists+nouveau@lfdr.de>; Sun, 29 Sep 2024 23:29:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BDE5310E2B7;
	Sun, 29 Sep 2024 21:29:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="aziITLsd";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2079.outbound.protection.outlook.com [40.107.244.79])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 39FBF10E162
 for <nouveau@lists.freedesktop.org>; Wed, 31 Jul 2024 18:33:56 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rfGvevzncaJpQ8Bw3cDatcY7UJOMCmfIEYqO3858lriPFQf7SjaRuWSnOgfOaGEg0jCDVW2vP1d41984G4x3no1O2W6UDtDaP8wVUAPFKH29ItyGtZXEhbk8bOqDK8qRK9UvO+scF1ZS6q+dukcRfa61zXTsSVfcIFiWalvLj27FrFBtdp926WY3/MBOY0YPFiUKushzHsryNftFOzeJgFVWlxceK7N9rozzz/5/egZlCosuRukaCUz9XpxgGRYy08fRw+5SmGv66guQE1A9fCTsKlNrSyyXIxK5SQ6bPS2N3cw+9DKRRkJe+CmRAu94K6YeX3Qy6vZdC5TjONnabw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5RkrHSpZRdgXpR3Rik6A1TgSpS24c3yLLpd1YRzVWnA=;
 b=HCIxRPnC1VhqKl5Wr8ZHdMClAwDACXa+40QSNqZ3sNhlPKwJ67qHaXlzGqgbuuEusm3JqpDCjGwbbE/za3TXWscFNk0oQhNrMEG8clgs39ph8s7FCeWhWfUJJuk1CM9prr5mdfQu7pzN+wtQ591foChncetoPcN3xBwRLdekJ/RS4H+2tQGmyW5fBhugJKuFEZtrUP7bSLuU9AcpvmQ9wO3VuG5DUx2F85V/pmVwVgbjzmtC5bu/8gnv1nNDmqmdhbiGsreV4rr3+TwTXMf4EMQBHmAUIOQmFs3H2y7Q1PuQDedNhj77hmLtxIxDcK88MQVSb/FiAuWGdFzaHjJHoA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5RkrHSpZRdgXpR3Rik6A1TgSpS24c3yLLpd1YRzVWnA=;
 b=aziITLsddf+FiC6/sokK3ftxvMsxoqp/10yjDcbbfyrd1lsaqYs9TftiXzNvOOmWsiSPM0mQ+3ImwUcBa4R1iMb6vj6YubPjGZeFoBNRXPTE+nh8wLYPMvhMMzNna5v5L5Xx5ft+EaGR/CIsEJ/s+1F5sPquCgWeKwSO6AfU+z6Yq5ygktoCVzLDyRIW3p+VQTOCKLtrul90GqyyXHtdPlIZeNA+/asOXTZJ98AHtpxLf2pVIgGuRkQPy+XhNd0yopHdp0M2X3cznfqo11o14rNlN5PvsJgqDyJHZ25gz2ymIrId5soStY0RiLdtSMeIhsbwJgSbc2514yfHM+ywFA==
Received: from MN2PR22CA0016.namprd22.prod.outlook.com (2603:10b6:208:238::21)
 by LV2PR12MB5941.namprd12.prod.outlook.com (2603:10b6:408:172::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7807.29; Wed, 31 Jul
 2024 18:33:51 +0000
Received: from BL02EPF0001A106.namprd05.prod.outlook.com
 (2603:10b6:208:238:cafe::74) by MN2PR22CA0016.outlook.office365.com
 (2603:10b6:208:238::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.21 via Frontend
 Transport; Wed, 31 Jul 2024 18:33:51 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 BL02EPF0001A106.mail.protection.outlook.com (10.167.241.139) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7828.19 via Frontend Transport; Wed, 31 Jul 2024 18:33:51 +0000
Received: from rnnvmail204.nvidia.com (10.129.68.6) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Wed, 31 Jul
 2024 11:33:35 -0700
Received: from rnnvmail205.nvidia.com (10.129.68.10) by rnnvmail204.nvidia.com
 (10.129.68.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Wed, 31 Jul
 2024 11:33:35 -0700
Received: from localhost (10.127.8.13) by mail.nvidia.com (10.129.68.10) with
 Microsoft SMTP Server id 15.2.1544.4 via Frontend Transport;
 Wed, 31 Jul 2024 11:33:33 -0700
Date: Wed, 31 Jul 2024 21:33:33 +0300
From: Zhi Wang <zhiw@nvidia.com>
To: Ben Skeggs <bskeggs@nvidia.com>
CC: <nouveau@lists.freedesktop.org>, <zhiwang@kernel.org>
Subject: Re: [PATCH v3 00/37] drm/nouveau: misc. cleanups and removal of
 unused apis
Message-ID: <20240731213333.0000183b.zhiw@nvidia.com>
In-Reply-To: <20240726043828.58966-1-bskeggs@nvidia.com>
References: <20240726043828.58966-1-bskeggs@nvidia.com>
Organization: NVIDIA
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.38; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0001A106:EE_|LV2PR12MB5941:EE_
X-MS-Office365-Filtering-Correlation-Id: de66491d-3f7e-4761-c39c-08dcb18f534a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|36860700013|376014|82310400026; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?g43K52ip22LYRa7vht63iWocdQYvnlJq6wSX5DzYJvgswTUC7K0V+DwkFtaQ?=
 =?us-ascii?Q?CHsfWA8NJLqemt339FMzpFCy8JPWbXCxCY7Lc2dUrL/gDd92545I0bsDowVQ?=
 =?us-ascii?Q?slhYwAE2GE9Npm8fA2iGqJnutlF6f211HPchKF162XyOO2AhfLEr9Sgp+V3F?=
 =?us-ascii?Q?xscMhNNhJhb55YAuxvqehn6uSQ0Qb+w0QNa6GOXdOt188Vwo/FjAWDr4sHlP?=
 =?us-ascii?Q?Y+nK1cmearjvcpOe7F+HT98lF1C5E8GzRsskHCq+TkY4Pm+L2D7WY1siGenM?=
 =?us-ascii?Q?OoGCEUE85eZ4F5eV2zT4pzvLdd7cedSvKJrrFnZjUCugd+CWdkmvAODOOduJ?=
 =?us-ascii?Q?k4yTFAMUbG6oXsKNZ/+VOzYEZzuoEv/ol1K4aqgtrZCWMgCP9WrnUNq3eodL?=
 =?us-ascii?Q?TntYg4vRBDT1LckDyDLBGq6CJY3prgBg7sdotJk68vDGATLMo7HfmORww0HC?=
 =?us-ascii?Q?2WPQet+1Y5/ymVqNSvKBS4iIPqIoRWBvPs3lypXFarNiHY+rrC0A78SPlKD6?=
 =?us-ascii?Q?3dZf1PNffSi0tYp04CDH+shcapPiRGxmbtgNtAfNDtB+YspNdJqwe36IjMTC?=
 =?us-ascii?Q?5G2rZZUbnOUN+pj5GoYTcr2nXY1pQnwtEPHpazJcR9bYBLy7paHGGCH/kgiN?=
 =?us-ascii?Q?iUjrxLxHlWD+r8ACHRE/k3Wz6mLe+VYhmQpEkYfRU/h40ViiFazv86BeyuIb?=
 =?us-ascii?Q?IgNVMaPy0xRWTiyXGJb03TGGO/4FPIty0ZtECcy6oOO2FDtS1hRooIEqQ9tv?=
 =?us-ascii?Q?Pf0N0RXyQazU9nN2/8vwtv89mkEXEtI+1h9RemfUP7OqzthZO9llYFUC2Spn?=
 =?us-ascii?Q?Ub7iBwfZS0aEFc8wGpJUNX7pDR92L6jeQnAsVjPqUcjEf19CWWjf5DkXyrYc?=
 =?us-ascii?Q?XIq766xBcOZKFmpSDjSjj3ERpf16l4ao9ENF5E37eHeS3OICXRKGKIkdIySx?=
 =?us-ascii?Q?cQLl9dXpmRW9v3tVJiIs/pAwBQWKoCf5Yv1ekt9qVg+KecHc6JEpqXdddyhd?=
 =?us-ascii?Q?aXAdNGEoSxuK0G3r+OWz17p4q+iJde+A0L/pIOl5+bzvg/MHGGkqyAiLqrOC?=
 =?us-ascii?Q?X7xKR98EaBn9RmbsNsnWydUAAaM+x3w6vpW1w9UPGcI6EnZNiCdIguwUREqP?=
 =?us-ascii?Q?CeIZjx6jVnM5fD3L6e73iZ8kWDZzLnli9DjID+4SEQ3b//6WWe/Aao7O2C5W?=
 =?us-ascii?Q?lGg2aI1i9xke03OshoOQe6mSIbkFk+HkgBWqBMFNWc7t+xuqJuGGEm3miMSA?=
 =?us-ascii?Q?ZBBlGDk6B5OJFRBxMfkBtnwfnJGuh3D10Qn5IPGTlcmLgbaQYMJ/I/wqKCXU?=
 =?us-ascii?Q?xVyyIQmCSPzMBPIAp5hsFR5X+pKS4VHCNRPzpAZyLdP/wH6x4Fn6Mw70mmMG?=
 =?us-ascii?Q?pLZ5Iz3x6xRXY6Cqcc9qTsRPNd9YOGzYmxMvKpVru865ur7qzdDWjibrFAko?=
 =?us-ascii?Q?AqrfiwhfJrGyUi4jlCbJbkQTkC7Ofe12?=
X-Forefront-Antispam-Report: CIP:216.228.117.160; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge1.nvidia.com; CAT:NONE;
 SFS:(13230040)(1800799024)(36860700013)(376014)(82310400026); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jul 2024 18:33:51.3741 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: de66491d-3f7e-4761-c39c-08dcb18f534a
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.160];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BL02EPF0001A106.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR12MB5941
X-Mailman-Approved-At: Sun, 29 Sep 2024 21:28:51 +0000
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

On Fri, 26 Jul 2024 14:37:51 +1000
Ben Skeggs <bskeggs@nvidia.com> wrote:

Hi Ben:

I reviewed the v3 patches. Here are some overall comments from me
besides the comments in patches:

1) It would be nice that we can wrap some pointer fetch in marcos or
inline functions. E.g. introduce xxx_to_yyy() to warp some pointer
fetch e.g. in patch 35.

Thus, it will reduce quite some LOCs and reviewing efforts when
adjusting the members between the data structures in the code refactor.

2) There are some patches removing stuff that have some history. E.g.
support for userspace tools, nvkm running in the userspace, which I
haven't seen before. Will leave those to folks who know it and I
will review them after they gave an AB.

Thanks,
Zhi.

> This series is a smaller subset of the prior series I posted, that
> aimed to remove the ioctl layer between NVKM and the nouveau DRM
> driver.
> 
> Whilst this series doesn't go the full way, it aims to remove a bunch
> of internal APIs that aren't useful anymore so they don't have to be
> ported, and to cleanup a few paths in the DRM driver that have
> suffered from bit- rot over the years to ensure it's safe to remove
> the ioctl layer next.
> 
> There's more details of the specific changes in the relevant commits.
> 
> A git tree is available at [1], and the remaining commits that were in
> the prior series, but not this one, are available at [2].
> 
> v2:
> - prepended a couple of patches that begin to cleanup pci vs tegra
>   paths, addressing some comments about variable naming, more in a
>   future series
> - rebased on current drm-misc-next
> - other changes mentioned in their relevant commits
> v3:
> - remove unnecessary change to nouveau_name()
> - reword some commit messages/comments
> 
> [1]
> https://gitlab.freedesktop.org/bskeggs/nouveau/-/tree/00.00-cleanup
> [2]
> https://gitlab.freedesktop.org/bskeggs/nouveau/-/tree/00.01-remove-ioctl
> 
> Ben Skeggs (37):
>   drm/nouveau: move nouveau_drm_device_fini() above init()
>   drm/nouveau: handle pci/tegra drm_dev_{alloc,register} from common
>     code
>   drm/nouveau: replace drm_device* with nouveau_drm* as dev drvdata
>   drm/nouveau: create pci device once
>   drm/nouveau: store nvkm_device pointer in nouveau_drm
>   drm/nouveau: move allocation of root client out of
> nouveau_cli_init() drm/nouveau: add nouveau_cli to nouveau_abi16
>   drm/nouveau: handle limited nvif ioctl in abi16
>   drm/nouveau: remove abi16->device
>   drm/nouveau: remove abi16->handles
>   drm/nouveau/nvkm: remove detect/mmio/subdev_mask from device args
>   drm/nouveau/nvkm: remove perfmon
>   drm/nouveau/nvkm: remove nvkm_client_search()
>   drm/nouveau/nvif: remove support for userspace backends
>   drm/nouveau/nvif: remove route/token
>   drm/nouveau/nvif: remove nvxx_object()
>   drm/nouveau/nvif: remove nvxx_client()
>   drm/nouveau/nvif: remove driver keep/fini
>   drm/nouveau/nvif: remove client device arg
>   drm/nouveau/nvif: remove client version
>   drm/nouveau/nvif: remove client devlist
>   drm/nouveau/nvif: remove client fini
>   drm/nouveau/nvif: remove device args
>   drm/nouveau: always map device
>   drm/nouveau/nvif: remove device rd/wr
>   drm/nouveau/nvif: remove disp chan rd/wr
>   drm/nouveau: move nvxx_* definitions to nouveau_drv.h
>   drm/nouveau: add nvif_mmu to nouveau_drm
>   drm/nouveau: pass drm to nouveau_mem_new(), instead of cli
>   drm/nouveau: pass drm to nv50_dmac_create(), rather than device+disp
>   drm/nouveau: pass cli to nouveau_channel_new() instead of drm+device
>   drm/nouveau: remove nouveau_chan.device
>   drm/nouveau: remove chan->drm
>   drm/nouveau: remove master
>   drm/nouveau: remove push pointer from nouveau_channel
>   drm/nouveau/kms: remove a few unused struct members and fn decls
>   drm/nouveau/kms: remove push pointer from nv50_dmac
> 
>  drivers/gpu/drm/nouveau/Kbuild                |   1 -
>  drivers/gpu/drm/nouveau/dispnv04/crtc.c       |  14 +-
>  drivers/gpu/drm/nouveau/dispnv04/dac.c        |   2 +-
>  drivers/gpu/drm/nouveau/dispnv04/dfp.c        |   2 +-
>  drivers/gpu/drm/nouveau/dispnv04/disp.c       |   7 +-
>  drivers/gpu/drm/nouveau/dispnv04/disp.h       |   2 +-
>  drivers/gpu/drm/nouveau/dispnv04/hw.c         |   9 +-
>  drivers/gpu/drm/nouveau/dispnv04/tvnv04.c     |   4 +-
>  drivers/gpu/drm/nouveau/dispnv04/tvnv17.c     |   6 +-
>  drivers/gpu/drm/nouveau/dispnv50/base507c.c   |  21 +-
>  drivers/gpu/drm/nouveau/dispnv50/base827c.c   |   2 +-
>  drivers/gpu/drm/nouveau/dispnv50/base907c.c   |  10 +-
>  drivers/gpu/drm/nouveau/dispnv50/core507d.c   |   8 +-
>  drivers/gpu/drm/nouveau/dispnv50/corec37d.c   |   6 +-
>  drivers/gpu/drm/nouveau/dispnv50/corec57d.c   |   2 +-
>  drivers/gpu/drm/nouveau/dispnv50/crc907d.c    |   4 +-
>  drivers/gpu/drm/nouveau/dispnv50/crcc37d.c    |   4 +-
>  drivers/gpu/drm/nouveau/dispnv50/crcc57d.c    |   2 +-
>  drivers/gpu/drm/nouveau/dispnv50/dac507d.c    |   2 +-
>  drivers/gpu/drm/nouveau/dispnv50/dac907d.c    |   2 +-
>  drivers/gpu/drm/nouveau/dispnv50/disp.c       |  74 +-
>  drivers/gpu/drm/nouveau/dispnv50/disp.h       |  14 +-
>  drivers/gpu/drm/nouveau/dispnv50/head507d.c   |  24 +-
>  drivers/gpu/drm/nouveau/dispnv50/head827d.c   |  10 +-
>  drivers/gpu/drm/nouveau/dispnv50/head907d.c   |  26 +-
>  drivers/gpu/drm/nouveau/dispnv50/head917d.c   |   6 +-
>  drivers/gpu/drm/nouveau/dispnv50/headc37d.c   |  18 +-
>  drivers/gpu/drm/nouveau/dispnv50/headc57d.c   |  12 +-
>  drivers/gpu/drm/nouveau/dispnv50/ovly507e.c   |   6 +-
>  drivers/gpu/drm/nouveau/dispnv50/ovly827e.c   |   2 +-
>  drivers/gpu/drm/nouveau/dispnv50/ovly907e.c   |   2 +-
>  drivers/gpu/drm/nouveau/dispnv50/pior507d.c   |   2 +-
>  drivers/gpu/drm/nouveau/dispnv50/sor507d.c    |   2 +-
>  drivers/gpu/drm/nouveau/dispnv50/sor907d.c    |   2 +-
>  drivers/gpu/drm/nouveau/dispnv50/sorc37d.c    |   2 +-
>  drivers/gpu/drm/nouveau/dispnv50/wimmc37b.c   |   7 +-
>  drivers/gpu/drm/nouveau/dispnv50/wndwc37e.c   |  24 +-
>  drivers/gpu/drm/nouveau/dispnv50/wndwc57e.c   |  10 +-
>  drivers/gpu/drm/nouveau/dispnv50/wndwc67e.c   |   2 +-
>  drivers/gpu/drm/nouveau/include/nvif/cl0080.h |   7 -
>  drivers/gpu/drm/nouveau/include/nvif/class.h  |   3 -
>  drivers/gpu/drm/nouveau/include/nvif/client.h |  11 +-
>  drivers/gpu/drm/nouveau/include/nvif/device.h |  37 +-
>  drivers/gpu/drm/nouveau/include/nvif/driver.h |   5 -
>  drivers/gpu/drm/nouveau/include/nvif/if0000.h |  10 -
>  drivers/gpu/drm/nouveau/include/nvif/if0002.h |  39 -
>  drivers/gpu/drm/nouveau/include/nvif/if0003.h |  34 -
>  drivers/gpu/drm/nouveau/include/nvif/ioctl.h  |  27 -
>  drivers/gpu/drm/nouveau/include/nvif/object.h |  24 +-
>  drivers/gpu/drm/nouveau/include/nvif/os.h     |  19 +
>  .../drm/nouveau/include/nvkm/core/client.h    |   1 -
>  .../drm/nouveau/include/nvkm/core/device.h    |   1 -
>  .../drm/nouveau/include/nvkm/core/layout.h    |   1 -
>  .../drm/nouveau/include/nvkm/core/object.h    |  14 -
>  .../drm/nouveau/include/nvkm/core/oclass.h    |   2 -
>  .../gpu/drm/nouveau/include/nvkm/core/os.h    |  19 -
>  .../gpu/drm/nouveau/include/nvkm/core/pci.h   |   1 -
>  .../gpu/drm/nouveau/include/nvkm/core/tegra.h |   1 -
>  .../gpu/drm/nouveau/include/nvkm/engine/pm.h  |  29 -
>  drivers/gpu/drm/nouveau/nouveau_abi16.c       | 330 +++++--
>  drivers/gpu/drm/nouveau/nouveau_abi16.h       |   6 +-
>  drivers/gpu/drm/nouveau/nouveau_bios.c        |   4 +-
>  drivers/gpu/drm/nouveau/nouveau_bios.h        |   1 +
>  drivers/gpu/drm/nouveau/nouveau_bo.c          |  10 +-
>  drivers/gpu/drm/nouveau/nouveau_bo0039.c      |   6 +-
>  drivers/gpu/drm/nouveau/nouveau_bo5039.c      |   6 +-
>  drivers/gpu/drm/nouveau/nouveau_bo74c1.c      |   2 +-
>  drivers/gpu/drm/nouveau/nouveau_bo85b5.c      |   2 +-
>  drivers/gpu/drm/nouveau/nouveau_bo9039.c      |   4 +-
>  drivers/gpu/drm/nouveau/nouveau_bo90b5.c      |   2 +-
>  drivers/gpu/drm/nouveau/nouveau_boa0b5.c      |   4 +-
>  drivers/gpu/drm/nouveau/nouveau_chan.c        |  96 +-
>  drivers/gpu/drm/nouveau/nouveau_chan.h        |   8 +-
>  drivers/gpu/drm/nouveau/nouveau_display.c     |   4 +-
>  drivers/gpu/drm/nouveau/nouveau_display.h     |   2 +-
>  drivers/gpu/drm/nouveau/nouveau_dma.c         |   2 +-
>  drivers/gpu/drm/nouveau/nouveau_dmem.c        |   4 +-
>  drivers/gpu/drm/nouveau/nouveau_drm.c         | 387 ++++----
>  drivers/gpu/drm/nouveau/nouveau_drv.h         |  61 +-
>  drivers/gpu/drm/nouveau/nouveau_fence.c       |  17 +-
>  drivers/gpu/drm/nouveau/nouveau_gem.c         |  21 +-
>  drivers/gpu/drm/nouveau/nouveau_hwmon.c       |  46 +-
>  drivers/gpu/drm/nouveau/nouveau_led.c         |   2 +-
>  drivers/gpu/drm/nouveau/nouveau_mem.c         |  38 +-
>  drivers/gpu/drm/nouveau/nouveau_mem.h         |   4 +-
>  drivers/gpu/drm/nouveau/nouveau_nvif.c        |   2 -
>  drivers/gpu/drm/nouveau/nouveau_platform.c    |  11 +-
>  drivers/gpu/drm/nouveau/nouveau_sgdma.c       |   2 +-
>  drivers/gpu/drm/nouveau/nouveau_ttm.c         |  12 +-
>  drivers/gpu/drm/nouveau/nouveau_usif.c        | 194 ----
>  drivers/gpu/drm/nouveau/nouveau_usif.h        |  10 -
>  drivers/gpu/drm/nouveau/nouveau_vga.c         |  14 +-
>  drivers/gpu/drm/nouveau/nv04_fence.c          |   2 +-
>  drivers/gpu/drm/nouveau/nv10_fence.c          |   2 +-
>  drivers/gpu/drm/nouveau/nv17_fence.c          |  10 +-
>  drivers/gpu/drm/nouveau/nv50_fence.c          |   2 +-
>  drivers/gpu/drm/nouveau/nv84_fence.c          |  12 +-
>  drivers/gpu/drm/nouveau/nvc0_fence.c          |   4 +-
>  drivers/gpu/drm/nouveau/nvif/client.c         |  32 +-
>  drivers/gpu/drm/nouveau/nvif/device.c         |  15 +-
>  drivers/gpu/drm/nouveau/nvif/driver.c         |  32 +-
>  drivers/gpu/drm/nouveau/nvif/object.c         |  40 -
>  drivers/gpu/drm/nouveau/nvkm/core/client.c    |  64 +-
>  drivers/gpu/drm/nouveau/nvkm/core/ioctl.c     |  91 +-
>  drivers/gpu/drm/nouveau/nvkm/core/object.c    |  50 -
>  drivers/gpu/drm/nouveau/nvkm/core/oproxy.c    |  42 -
>  drivers/gpu/drm/nouveau/nvkm/core/uevent.c    |   4 +-
>  drivers/gpu/drm/nouveau/nvkm/engine/Kbuild    |   1 -
>  .../gpu/drm/nouveau/nvkm/engine/device/base.c | 479 +++++-----
>  .../gpu/drm/nouveau/nvkm/engine/device/pci.c  |   4 +-
>  .../gpu/drm/nouveau/nvkm/engine/device/priv.h |   2 -
>  .../drm/nouveau/nvkm/engine/device/tegra.c    |   5 +-
>  .../gpu/drm/nouveau/nvkm/engine/device/user.c |  93 +-
>  .../gpu/drm/nouveau/nvkm/engine/disp/chan.c   |  24 -
>  drivers/gpu/drm/nouveau/nvkm/engine/pm/Kbuild |  11 -
>  drivers/gpu/drm/nouveau/nvkm/engine/pm/base.c | 867
> ------------------ drivers/gpu/drm/nouveau/nvkm/engine/pm/g84.c  |
> 165 ---- .../gpu/drm/nouveau/nvkm/engine/pm/gf100.c    | 243 -----
>  .../gpu/drm/nouveau/nvkm/engine/pm/gf100.h    |  20 -
>  .../gpu/drm/nouveau/nvkm/engine/pm/gf108.c    |  66 --
>  .../gpu/drm/nouveau/nvkm/engine/pm/gf117.c    |  80 --
>  .../gpu/drm/nouveau/nvkm/engine/pm/gk104.c    | 184 ----
>  .../gpu/drm/nouveau/nvkm/engine/pm/gt200.c    | 157 ----
>  .../gpu/drm/nouveau/nvkm/engine/pm/gt215.c    | 138 ---
>  drivers/gpu/drm/nouveau/nvkm/engine/pm/nv40.c | 123 ---
>  drivers/gpu/drm/nouveau/nvkm/engine/pm/nv40.h |  15 -
>  drivers/gpu/drm/nouveau/nvkm/engine/pm/nv50.c | 175 ----
>  drivers/gpu/drm/nouveau/nvkm/engine/pm/priv.h | 105 ---
>  128 files changed, 1119 insertions(+), 4194 deletions(-)
>  delete mode 100644 drivers/gpu/drm/nouveau/include/nvif/if0002.h
>  delete mode 100644 drivers/gpu/drm/nouveau/include/nvif/if0003.h
>  delete mode 100644 drivers/gpu/drm/nouveau/include/nvkm/engine/pm.h
>  delete mode 100644 drivers/gpu/drm/nouveau/nouveau_usif.c
>  delete mode 100644 drivers/gpu/drm/nouveau/nouveau_usif.h
>  delete mode 100644 drivers/gpu/drm/nouveau/nvkm/engine/pm/Kbuild
>  delete mode 100644 drivers/gpu/drm/nouveau/nvkm/engine/pm/base.c
>  delete mode 100644 drivers/gpu/drm/nouveau/nvkm/engine/pm/g84.c
>  delete mode 100644 drivers/gpu/drm/nouveau/nvkm/engine/pm/gf100.c
>  delete mode 100644 drivers/gpu/drm/nouveau/nvkm/engine/pm/gf100.h
>  delete mode 100644 drivers/gpu/drm/nouveau/nvkm/engine/pm/gf108.c
>  delete mode 100644 drivers/gpu/drm/nouveau/nvkm/engine/pm/gf117.c
>  delete mode 100644 drivers/gpu/drm/nouveau/nvkm/engine/pm/gk104.c
>  delete mode 100644 drivers/gpu/drm/nouveau/nvkm/engine/pm/gt200.c
>  delete mode 100644 drivers/gpu/drm/nouveau/nvkm/engine/pm/gt215.c
>  delete mode 100644 drivers/gpu/drm/nouveau/nvkm/engine/pm/nv40.c
>  delete mode 100644 drivers/gpu/drm/nouveau/nvkm/engine/pm/nv40.h
>  delete mode 100644 drivers/gpu/drm/nouveau/nvkm/engine/pm/nv50.c
>  delete mode 100644 drivers/gpu/drm/nouveau/nvkm/engine/pm/priv.h
> 

