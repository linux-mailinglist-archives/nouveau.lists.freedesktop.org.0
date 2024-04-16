Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E39778A78A7
	for <lists+nouveau@lfdr.de>; Wed, 17 Apr 2024 01:40:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B1BA5112F13;
	Tue, 16 Apr 2024 23:40:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="pz94LmNl";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam02on2080.outbound.protection.outlook.com [40.107.95.80])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED46C112F15
 for <nouveau@lists.freedesktop.org>; Tue, 16 Apr 2024 23:40:53 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=isFQQwbQR1SPc1Gfg/zZr1LNDxOXmBHlf3Bv4vPs5M+Jx1+uAfMv4iIS7ktjzwK/KHpxl4XtQXn59wA7LUKOEaxw/bCW7R+dUjQZr+la7Lu76g+FKDej+Piyf6TbGQlbrTdQVy+XPRZGrE9s1rKVc6oYTXRS6hOLSBaLBG6cZrIuY7KEjPXpnoadPr9H5NbSWDU97BsRqYDe9WusPpZNnglpGV8al+593qbMuevLKhhg8KRQnHRIH6NgHYCguOf8edlkW8nN77fCe3AnsX0ZdGBkYmPEg/jXD++D7wkqKdV43n3orlH95wo7vV+CV4BCzgQX7AeTME5w1j+dyfBu0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ayW/VyJliw7HHuCfbzDMHBommwJ+teAQP7V9Lu1EWKA=;
 b=RO3GuzxpeC7rRNURF2kQ10+wP5LyL9/8Zjn7tvoKhkm7rrllO8PzYOFs9nUtB3ZMqm9DfrsBsJovY7rx1Xef/SFTm5zT/CvdO8mhsn1SD1k+Q589Z2gBnXUa+daIlUC4yRK+U4kkto2DqY6jYjVLDuKIfm5p7CxrrNVZcsXq5ZeZFWB3SuuM1+GFrT6+QqVLKhuvC8snsfQQ33wCMzJa+POYvFUdrho5GbPLRnqZ5Uo/wwkWpm7zM/VRQU31K+TH3gvh7v2mef1yk1CFBhqolYcCuZJJlKHhutHVD/VcCdowKdibYxPape9lvPFeHRi55RPRuI+07CYuJ30Y71HGGQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ayW/VyJliw7HHuCfbzDMHBommwJ+teAQP7V9Lu1EWKA=;
 b=pz94LmNluy634FVIOwheMH/i6K/BUocbSaxClZCsLIC0bShkLdQQZoTqzuv1ic2tFa4suCO48XfMqgaHN2e+ahSAt+azeRv3/BoHJifmWFAF3tPNAvd6cJ1Bosku4SeEp2dwHQDRIBJmHgBgydOuJflyWqr7AU3hkFcp9aMp3+Ryg4YKn6wPWYfBmBPTIyk6rCzqMsJ1WPvz9CJ5gFSBJSbD3kairpY6sKNaljhSnjE+qSG0Pjxiv1lFbu7Rgaa3oM4Ov0Zgw+JwbrTy4Cx00U5GAQEnV3ZWQ4foK7Wh+9ZYAnM4qRZ8/VVqCSOAx0GRdEUU1cstYhdgUFZ/XltIcQ==
Received: from BN9PR03CA0675.namprd03.prod.outlook.com (2603:10b6:408:10e::20)
 by MW4PR12MB7333.namprd12.prod.outlook.com (2603:10b6:303:21b::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7452.50; Tue, 16 Apr
 2024 23:40:49 +0000
Received: from BN3PEPF0000B077.namprd04.prod.outlook.com
 (2603:10b6:408:10e:cafe::a2) by BN9PR03CA0675.outlook.office365.com
 (2603:10b6:408:10e::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7472.33 via Frontend
 Transport; Tue, 16 Apr 2024 23:40:49 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 BN3PEPF0000B077.mail.protection.outlook.com (10.167.243.122) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7452.22 via Frontend Transport; Tue, 16 Apr 2024 23:40:49 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.41; Tue, 16 Apr
 2024 16:40:31 -0700
Received: from fedora.mshome.net (10.126.231.35) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.12; Tue, 16 Apr
 2024 16:40:29 -0700
From: Ben Skeggs <bskeggs@nvidia.com>
To: <nouveau@lists.freedesktop.org>
CC: Ben Skeggs <bskeggs@nvidia.com>
Subject: [PATCH 000/156] drm/nouveau: replace "ioctl" interface between
 drm/nvkm
Date: Wed, 17 Apr 2024 09:37:26 +1000
Message-ID: <20240416234002.19509-1-bskeggs@nvidia.com>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.126.231.35]
X-ClientProxiedBy: rnnvmail203.nvidia.com (10.129.68.9) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B077:EE_|MW4PR12MB7333:EE_
X-MS-Office365-Filtering-Correlation-Id: 1f270364-b6a9-4ca6-d743-08dc5e6ea579
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: fmur4mILtbd1s7xzvlI4vHLlMH/9AwBXAG1wBM21NUUiukgZvFgk5TyJWHhwDdY+TXibjGQJHZlDKJhBRSJuTAuBP0QB8lh3M8G2UP0o1Q5719AxMyKq6NYG3iAhMlindF5RTOVuC/4vwzZQYKZkbWoC7ZPbGbsW8Ho94wvaXUb7lHPEPqLX6yGhr0SLjg7RWIF/9ZDu+Ta9Tye3BoSpVu8G+gMiD0IFZPbb/G5hCyNKV4MirD7db27pBzq87EF0leHyDB9lz0DJpXLxZ8jtKhec3RkeVkcCMR7kY1t/B/czRo7HoseYeQCckbNT2kAoWxtvLeHSPvLt+gZdOMrCe+KsAQUHabbxzFe2M1LkB+j1f4b4HPFN2lHCtc0+R45T/LoIUjp1LD+iGOYtSSdVj2BFA2MwbtnTry23CzmQsJp0iH1/en8hW54gRPdaAcoZlb6i9AoLXReWs+EA8dR5cUS1QjHpK4wVPu5cJNl3v2neceDoaLAKLnC+qfRfm19EsE8OV26nXxd4C5EbBhnRgL1G4i5OtlQWwjMPxyqydy4RSEg9Thi71N4ZQfmoUqlPJOQSLTpC5vTy8HLcwIIPfuxeqeab7ugMORjSdfm8F+a93jKSFOEgFNxLq9Kn0Z8WH2WVyPuivbPI/stvQuUMcznn9AJ8u/9cqZy4FMUOykMmj6NiM8NRpMiE94jzJCpAunju3Yha7B/S8aRJ1doEqwz3q5Qry1NPBlsYtLUsCrxHKZAEFMKRSgRWErHveerC
X-Forefront-Antispam-Report: CIP:216.228.117.160; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge1.nvidia.com; CAT:NONE;
 SFS:(13230031)(1800799015)(376005)(82310400014)(36860700004); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Apr 2024 23:40:49.3375 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1f270364-b6a9-4ca6-d743-08dc5e6ea579
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.160];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BN3PEPF0000B077.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB7333
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

This is a series of cleanups that I intended on doing after posting
the initial GSP-RM support several months ago, and have now had the
opportunity to work on again.

The main intention here is to replace the ioctl-like interface that
sits between NVKM and the nouveau DRM driver with more direct calls,
to reduce the call-chain complexity (and overhead).

This is achieved by having NVKM return structs of info and function
pointers specific to each class, along with an opaque pointer to its
private data.  These are stored in the NVIF structs and used to call
directly into an implementation without handle lookups and multiple
layers of indirection.

There's room for further cleanups and API changes from here, but for
now most of the API usage is exactly as it was before, as the series
has gotten quite large enough already.

The first part of the series starts out by cleaning up some of the
interfaces within the DRM driver, and reimplementing the subset of
"ioctl" interfaces needed by userspace directly.

A number of unused interfaces/function args are then removed so that
they don't need to be ported, and some initial renames/preparations
are made to the NVKM's user object implementations so that diffs of
the next set of patches are more straightforward to read.

I then go through each class in turn, starting from the root of the
object tree (client), and working up from there.  The object ctors/
dtors are ported first, followed by sclass/map/etc, followed by the
class's methods, and then repeating the process with each of their
children.

Objects remain accessible with the "ioctl" interface throughout the
changes (until their last use, after which they're removed from the
object rb entirely) to allow each change to be done independently.

After all classes have been ported, some final cleanups are made to
the DRM driver to complete the series.

Ben Skeggs (156):
  drm/nouveau: add nouveau_drm.device/mmu
  drm/nouveau: alias nouveau_drm.client to nouveau_drm.cli
  drm/nouveau: pass drm to nouveau_mem_new(), instead of cli
  drm/nouveau: pass drm to nv50_dmac_create(), rather than device+disp
  drm/nouveau: pass cli to nouveau_channel_new() instead of drm+device
  drm/nouveau: remove nouveau_chan.device
  drm/nouveau: remove chan->drm
  drm/nouveau: replace some void casts with chan->cli
  drm/nouveau: remove nouveau_drm.master
  drm/nouveau: always map device
  drm/nouveau: add nouveau_cli to nouveau_abi16
  drm/nouveau: handle limited nvif in abi16
  drm/nouveau: remove abi16->device
  drm/nouveau: remove abi16->handles
  drm/nouveau: store nvkm_device pointer in nouveau_drm
  drm/nouveau: create pci device once
  drm/nouveau: remove push pointer from nouveau_channel
  drm/nouveau/kms: remove a few unused struct members and fn decls
  drm/nouveau/kms: remove push pointer from nv50_dmac
  drm/nouveau/kms: move hw ring tracking vars into nvif_push
  drm/nouveau/kms: move dmac sync/vram ctxdmas to core+wndws
  drm/nouveau/nvkm: remove detect/mmio/subdev_mask from device args
  drm/nouveau/nvkm: move nouveau_nvif.c to nvkm/core/driver.c
  drm/nouveau/nvkm: move nvkm/engine/device/ to nvkm/device/
  drm/nouveau/nvkm: remove perfmon
  drm/nouveau/nvkm: remove nvkm_client_search()
  drm/nouveau/nvif: remove support for userspace backends
  drm/nouveau/nvif: remove route/token
  drm/nouveau/nvif: remove nvxx_object()
  drm/nouveau/nvif: remove nvxx_client()
  drm/nouveau/nvif: remove driver keep/fini
  drm/nouveau/nvif: remove client version
  drm/nouveau/nvif: remove client devlist
  drm/nouveau/nvif: remove client fini
  drm/nouveau/nvif: remove device args
  drm/nouveau/nvif: remove device rd/wr
  drm/nouveau/nvif: remove disp chan rd/wr
  drm/nouveau/nvkm: rename struct nvkm_uevent
  drm/nouveau/nvkm: remove nvkm_client()
  drm/nouveau/nvkm: rename struct nvkm_udevice
  drm/nouveau/nvkm: rename struct nvkm_control
  drm/nouveau/nvkm: rename struct nvkm_uvfn
  drm/nouveau/nvkm: rename struct nvkm_ummu
  drm/nouveau/nvkm: rename struct nvkm_umem
  drm/nouveau/nvkm: rename struct nvkm_uvmm
  drm/nouveau/nvkm: detach user handling from nvkm_fault_buffer
  drm/nouveau/nvkm: detach user handling from nvkm_disp
  drm/nouveau/nvkm: detach user handling from nvkm_conn
  drm/nouveau/nvkm: detach user handling from nvkm_outp
  drm/nouveau/nvkm: detach user handling from nvkm_uhead
  drm/nouveau/nvkm: detach user handling from nvkm_disp_chan
  drm/nouveau/nvkm: rename struct nvkm_ucgrp
  drm/nouveau/nvkm: rename struct nvkm_uchan
  drm/nouveau/nvkm: move umem list to mmu
  drm/nouveau/disp: simplify hw user definition
  drm/nouveau/nvif: output oclass id in object dbg messages
  drm/nouveau/nvif: add alternate version of nvif_object_ctor()
  drm/nouveau/nvif: add alternate version of nvif_event_ctor()
  drm/nouveau/nvif: move nvif<->nvkm interface definitions to driverif.h
  drm/nouveau/nvif: rework "new driver" api
  drm/nouveau/nvkm: remove device list
  drm/nouveau/nvif: rework driver "new client" api
  drm/nouveau/nvif: rework client "new device" api
  drm/nouveau/nvif: remove client from object rb
  drm/nouveau/nvif: rework device "sclass" api
  drm/nouveau/nvif: rework device "map" api
  drm/nouveau/nvif: rework device "info v0" api
  drm/nouveau/nvif: rework device "info v1" api
  drm/nouveau/nvif: rework device "time" api
  drm/nouveau/nvif: rework device "new ctrl" api
  drm/nouveau/nvif: rework ctrl "pstate info" api
  drm/nouveau/nvif: rework ctrl "pstate attr" api
  drm/nouveau/nvif: rework ctrl "pstate user" api
  drm/nouveau/nvif: remove ctrl from object rb
  drm/nouveau/nvif: rework device "new usermode" api
  drm/nouveau/nvif: rework usermode "map" api
  drm/nouveau/nvif: remove usermode from object rb
  drm/nouveau/nvif: rework device "new mmu" api
  drm/nouveau/nvif: rework mmu "sclass" api
  drm/nouveau/nvif: rework mmu "heap" api
  drm/nouveau/nvif: rework mmu "type" api
  drm/nouveau/nvif: rework mmu "kind" api
  drm/nouveau/nvif: rework mmu "new mem" api
  drm/nouveau/nvif: rework mem "map"/"unmap" apis
  drm/nouveau/nvif: rework mmu "new vmm" api
  drm/nouveau/nvif: remove mmu from object rb
  drm/nouveau/nvif: rework vmm "page" api
  drm/nouveau/nvif: rework vmm "get"/"put" apis
  drm/nouveau/nvif: rework vmm "map"/"unmap" apis
  drm/nouveau/nvif: rework vmm "pfnmap"/"pfnclr" apis
  drm/nouveau/nvif: rework vmm "raw get"/"raw put" apis
  drm/nouveau/nvif: rework vmm "raw map"/"raw unmap" apis
  drm/nouveau/nvif: rework vmm "raw sparse" api
  drm/nouveau/nvif: rework vmm "fault replay"/"fault cancel" apis
  drm/nouveau/nvif: rework device "new fault buffer" api
  drm/nouveau/nvif: rework fault buffer "map" api
  drm/nouveau/nvif: rework fault buffer "new event" api
  drm/nouveau/nvif: remove fault buffer from object rb
  drm/nouveau/nvif: rework device "new disp" api
  drm/nouveau/nvif: rework disp "sclass" api
  drm/nouveau/nvif: rework disp "new caps" api
  drm/nouveau/nvif: rework disp "new conn" api
  drm/nouveau/nvif: rework conn "new event" api
  drm/nouveau/nvif: remove conn from object rb
  drm/nouveau/nvif: rework disp "new outp" api
  drm/nouveau/nvif: rework outp "detect" api
  drm/nouveau/nvif: rework outp "edid get" api
  drm/nouveau/nvif: rework outp "load detect" api
  drm/nouveau/nvif: rework outp "inherit" apis
  drm/nouveau/nvif: rework outp "acquire" api
  drm/nouveau/nvif: rework outp "release" api
  drm/nouveau/nvif: rework outp "bl get"/"bl set" apis
  drm/nouveau/nvif: rework outp "lvds config" api
  drm/nouveau/nvif: rework outp "hdmi config" api
  drm/nouveau/nvif: rework outp "infoframe" api
  drm/nouveau/nvif: rework outp "hda eld" api
  drm/nouveau/nvif: rework outp "dp aux pwr" api
  drm/nouveau/nvif: rework outp "dp aux xfer" api
  drm/nouveau/nvif: rework outp "dp rates" api
  drm/nouveau/nvif: rework outp "dp train" api
  drm/nouveau/nvif: rework outp "dp drive" api
  drm/nouveau/nvif: rework outp "dp sst" api
  drm/nouveau/nvif: rework outp "dp mst id get"/"dp mst id put" apis
  drm/nouveau/nvif: rework outp "dp mst vcpi" api
  drm/nouveau/nvif: remove outp from object rb
  drm/nouveau/nvif: rework disp "new head" api
  drm/nouveau/nvif: rework head "scanoutpos" api
  drm/nouveau/nvif: rework head "new event" api
  drm/nouveau/nvif: remove head from object rb
  drm/nouveau/nvif: rework disp "new chan" apis
  drm/nouveau/nvif: remove disp from object rb
  drm/nouveau/nvif: rework disp chan "new ctxdma" api
  drm/nouveau/nvif: remove disp chans from object rb
  drm/nouveau/nvif: rework device "new cgrp" api
  drm/nouveau/nvif: rework device "new ctxdma" api
  drm/nouveau/nvif: rework device/cgrp "new chan" apis
  drm/nouveau/nvif: remove mem from object rb
  drm/nouveau/nvif: remove vmm from object rb
  drm/nouveau/nvif: remove ctxdma from object rb
  drm/nouveau/nvif: remove device from object rb
  drm/nouveau/nvif: rework chan "map" api
  drm/nouveau/nvif: rework chan "sclass" api
  drm/nouveau/nvif: rework chan "new event" apis
  drm/nouveau/nvif: rework chan "new ctxdma" api
  drm/nouveau/nvif: rework chan "new engobj" apis
  drm/nouveau/nvif: remove chan from object rb
  drm/nouveau/nvif: rework engobj "mthd" api
  drm/nouveau/nvif: rework engobj "new event" api
  drm/nouveau/nvif: remove engobj from object rb
  drm/nouveau/nvkm: switch nvkm_object to non-irqsafe spinlock
  drm/nouveau: remove client_mutex
  drm/nouveau: move nvxx_* definitions to nouveau_drv.h
  drm/nouveau: pass nouveau_drm to nvxx_*
  drm/nouveau: remove remaining usage of nvif_device.info
  drm/nouveau: remove remaining usage of nvif_device.object.map
  drm/nouveau: remove remaining usage of nouveau_drm.client

 drivers/gpu/drm/nouveau/Kbuild                |   2 -
 drivers/gpu/drm/nouveau/dispnv04/arb.c        |   7 +-
 drivers/gpu/drm/nouveau/dispnv04/crtc.c       |  50 +-
 drivers/gpu/drm/nouveau/dispnv04/cursor.c     |   2 +-
 drivers/gpu/drm/nouveau/dispnv04/dac.c        |  18 +-
 drivers/gpu/drm/nouveau/dispnv04/dfp.c        |  12 +-
 drivers/gpu/drm/nouveau/dispnv04/disp.c       |  15 +-
 drivers/gpu/drm/nouveau/dispnv04/disp.h       |   6 +-
 drivers/gpu/drm/nouveau/dispnv04/hw.c         |  83 +-
 drivers/gpu/drm/nouveau/dispnv04/hw.h         |  45 +-
 drivers/gpu/drm/nouveau/dispnv04/overlay.c    |  21 +-
 drivers/gpu/drm/nouveau/dispnv04/tvnv04.c     |   4 +-
 drivers/gpu/drm/nouveau/dispnv04/tvnv17.c     |  16 +-
 drivers/gpu/drm/nouveau/dispnv04/tvnv17.h     |  10 +-
 drivers/gpu/drm/nouveau/dispnv50/base.c       |  33 +-
 drivers/gpu/drm/nouveau/dispnv50/base507c.c   |  43 +-
 drivers/gpu/drm/nouveau/dispnv50/base827c.c   |   2 +-
 drivers/gpu/drm/nouveau/dispnv50/base907c.c   |  10 +-
 drivers/gpu/drm/nouveau/dispnv50/core.c       |  84 +-
 drivers/gpu/drm/nouveau/dispnv50/core.h       |   9 +-
 drivers/gpu/drm/nouveau/dispnv50/core507d.c   |  34 +-
 drivers/gpu/drm/nouveau/dispnv50/core907d.c   |   2 +-
 drivers/gpu/drm/nouveau/dispnv50/corec37d.c   |  19 +-
 drivers/gpu/drm/nouveau/dispnv50/corec57d.c   |   4 +-
 drivers/gpu/drm/nouveau/dispnv50/crc.c        |  34 +-
 drivers/gpu/drm/nouveau/dispnv50/crc.h        |   4 +-
 drivers/gpu/drm/nouveau/dispnv50/crc907d.c    |  12 +-
 drivers/gpu/drm/nouveau/dispnv50/crcc37d.c    |  12 +-
 drivers/gpu/drm/nouveau/dispnv50/crcc57d.c    |   4 +-
 drivers/gpu/drm/nouveau/dispnv50/curs.c       |  35 +-
 drivers/gpu/drm/nouveau/dispnv50/curs507a.c   |  41 +-
 drivers/gpu/drm/nouveau/dispnv50/cursc37a.c   |  12 +-
 drivers/gpu/drm/nouveau/dispnv50/dac507d.c    |   2 +-
 drivers/gpu/drm/nouveau/dispnv50/dac907d.c    |   2 +-
 drivers/gpu/drm/nouveau/dispnv50/disp.c       | 313 +------
 drivers/gpu/drm/nouveau/dispnv50/disp.h       |  37 +-
 drivers/gpu/drm/nouveau/dispnv50/head.c       |   4 +-
 drivers/gpu/drm/nouveau/dispnv50/head507d.c   |  26 +-
 drivers/gpu/drm/nouveau/dispnv50/head827d.c   |  10 +-
 drivers/gpu/drm/nouveau/dispnv50/head907d.c   |  26 +-
 drivers/gpu/drm/nouveau/dispnv50/head917d.c   |   6 +-
 drivers/gpu/drm/nouveau/dispnv50/headc37d.c   |  18 +-
 drivers/gpu/drm/nouveau/dispnv50/headc57d.c   |  12 +-
 drivers/gpu/drm/nouveau/dispnv50/lut.c        |  12 +-
 drivers/gpu/drm/nouveau/dispnv50/lut.h        |   5 +-
 drivers/gpu/drm/nouveau/dispnv50/oimm.c       |  29 +-
 drivers/gpu/drm/nouveau/dispnv50/oimm507b.c   |  20 +-
 drivers/gpu/drm/nouveau/dispnv50/ovly.c       |  32 +-
 drivers/gpu/drm/nouveau/dispnv50/ovly507e.c   |  28 +-
 drivers/gpu/drm/nouveau/dispnv50/ovly827e.c   |   2 +-
 drivers/gpu/drm/nouveau/dispnv50/ovly907e.c   |   2 +-
 drivers/gpu/drm/nouveau/dispnv50/pior507d.c   |   2 +-
 drivers/gpu/drm/nouveau/dispnv50/sor507d.c    |   2 +-
 drivers/gpu/drm/nouveau/dispnv50/sor907d.c    |   2 +-
 drivers/gpu/drm/nouveau/dispnv50/sorc37d.c    |   2 +-
 drivers/gpu/drm/nouveau/dispnv50/wimm.c       |  25 +-
 drivers/gpu/drm/nouveau/dispnv50/wimmc37b.c   |  24 +-
 drivers/gpu/drm/nouveau/dispnv50/wndw.c       | 101 +-
 drivers/gpu/drm/nouveau/dispnv50/wndw.h       |  20 +-
 drivers/gpu/drm/nouveau/dispnv50/wndwc37e.c   |  46 +-
 drivers/gpu/drm/nouveau/dispnv50/wndwc57e.c   |  10 +-
 drivers/gpu/drm/nouveau/dispnv50/wndwc67e.c   |   2 +-
 drivers/gpu/drm/nouveau/include/nvif/cgrp.h   |  17 +
 drivers/gpu/drm/nouveau/include/nvif/chan.h   |  45 +
 drivers/gpu/drm/nouveau/include/nvif/cl0080.h |  60 --
 drivers/gpu/drm/nouveau/include/nvif/class.h  |   8 -
 drivers/gpu/drm/nouveau/include/nvif/clb069.h |  15 -
 drivers/gpu/drm/nouveau/include/nvif/client.h |  14 +-
 drivers/gpu/drm/nouveau/include/nvif/conn.h   |  24 +-
 drivers/gpu/drm/nouveau/include/nvif/ctxdma.h |  29 +
 drivers/gpu/drm/nouveau/include/nvif/device.h |  51 +-
 drivers/gpu/drm/nouveau/include/nvif/disp.h   |  19 +-
 .../gpu/drm/nouveau/include/nvif/dispchan.h   |  25 +
 drivers/gpu/drm/nouveau/include/nvif/driver.h |  27 +-
 .../gpu/drm/nouveau/include/nvif/driverif.h   | 643 +++++++++++++
 drivers/gpu/drm/nouveau/include/nvif/event.h  |  16 +-
 drivers/gpu/drm/nouveau/include/nvif/fifo.h   |  11 +-
 drivers/gpu/drm/nouveau/include/nvif/head.h   |   2 +
 drivers/gpu/drm/nouveau/include/nvif/if0000.h |  20 -
 drivers/gpu/drm/nouveau/include/nvif/if0001.h |  47 -
 drivers/gpu/drm/nouveau/include/nvif/if0002.h |  39 -
 drivers/gpu/drm/nouveau/include/nvif/if0003.h |  34 -
 drivers/gpu/drm/nouveau/include/nvif/if0008.h |  42 -
 drivers/gpu/drm/nouveau/include/nvif/if000c.h | 117 ---
 drivers/gpu/drm/nouveau/include/nvif/if000d.h |   1 -
 drivers/gpu/drm/nouveau/include/nvif/if000e.h |  26 -
 drivers/gpu/drm/nouveau/include/nvif/if0010.h |  14 -
 drivers/gpu/drm/nouveau/include/nvif/if0011.h |  18 -
 drivers/gpu/drm/nouveau/include/nvif/if0012.h | 294 ------
 drivers/gpu/drm/nouveau/include/nvif/if0013.h |  35 -
 drivers/gpu/drm/nouveau/include/nvif/if0014.h |  13 -
 drivers/gpu/drm/nouveau/include/nvif/if0020.h |  45 -
 drivers/gpu/drm/nouveau/include/nvif/if0021.h |  16 -
 drivers/gpu/drm/nouveau/include/nvif/if500d.h |   1 -
 drivers/gpu/drm/nouveau/include/nvif/if900d.h |   1 -
 drivers/gpu/drm/nouveau/include/nvif/ifb00d.h |   1 -
 drivers/gpu/drm/nouveau/include/nvif/ifc00d.h |   1 -
 drivers/gpu/drm/nouveau/include/nvif/ioctl.h  |  44 -
 drivers/gpu/drm/nouveau/include/nvif/mem.h    |  18 +-
 drivers/gpu/drm/nouveau/include/nvif/mmu.h    |  38 +-
 drivers/gpu/drm/nouveau/include/nvif/object.h | 105 +--
 drivers/gpu/drm/nouveau/include/nvif/os.h     |  19 +
 drivers/gpu/drm/nouveau/include/nvif/outp.h   |  58 +-
 drivers/gpu/drm/nouveau/include/nvif/printf.h |   9 +-
 drivers/gpu/drm/nouveau/include/nvif/push.h   |  18 +-
 drivers/gpu/drm/nouveau/include/nvif/user.h   |   6 +-
 drivers/gpu/drm/nouveau/include/nvif/vmm.h    |  30 +-
 .../drm/nouveau/include/nvkm/core/client.h    |  16 +-
 .../drm/nouveau/include/nvkm/core/device.h    |   6 -
 .../drm/nouveau/include/nvkm/core/driver.h    |   9 +
 .../gpu/drm/nouveau/include/nvkm/core/event.h |  10 +-
 .../gpu/drm/nouveau/include/nvkm/core/ioctl.h |   8 -
 .../drm/nouveau/include/nvkm/core/layout.h    |   1 -
 .../drm/nouveau/include/nvkm/core/object.h    |  43 +-
 .../drm/nouveau/include/nvkm/core/oclass.h    |   2 -
 .../gpu/drm/nouveau/include/nvkm/core/os.h    |  21 +-
 .../gpu/drm/nouveau/include/nvkm/core/pci.h   |   1 -
 .../drm/nouveau/include/nvkm/core/subdev.h    |   2 -
 .../gpu/drm/nouveau/include/nvkm/core/tegra.h |   1 -
 .../drm/nouveau/include/nvkm/engine/disp.h    |   4 +-
 .../gpu/drm/nouveau/include/nvkm/engine/dma.h |   2 -
 .../gpu/drm/nouveau/include/nvkm/engine/pm.h  |  29 -
 .../gpu/drm/nouveau/include/nvkm/subdev/mmu.h |   3 -
 drivers/gpu/drm/nouveau/nouveau_abi16.c       | 498 ++++++----
 drivers/gpu/drm/nouveau/nouveau_abi16.h       |  11 +-
 drivers/gpu/drm/nouveau/nouveau_backlight.c   |  30 +-
 drivers/gpu/drm/nouveau/nouveau_bios.c        |  22 +-
 drivers/gpu/drm/nouveau/nouveau_bios.h        |   1 +
 drivers/gpu/drm/nouveau/nouveau_bo.c          | 130 +--
 drivers/gpu/drm/nouveau/nouveau_bo0039.c      |   8 +-
 drivers/gpu/drm/nouveau/nouveau_bo5039.c      |  10 +-
 drivers/gpu/drm/nouveau/nouveau_bo74c1.c      |   2 +-
 drivers/gpu/drm/nouveau/nouveau_bo85b5.c      |   2 +-
 drivers/gpu/drm/nouveau/nouveau_bo9039.c      |   4 +-
 drivers/gpu/drm/nouveau/nouveau_bo90b5.c      |   2 +-
 drivers/gpu/drm/nouveau/nouveau_boa0b5.c      |   4 +-
 drivers/gpu/drm/nouveau/nouveau_chan.c        | 353 ++++---
 drivers/gpu/drm/nouveau/nouveau_chan.h        |  31 +-
 drivers/gpu/drm/nouveau/nouveau_connector.c   |  30 +-
 drivers/gpu/drm/nouveau/nouveau_debugfs.c     |  47 +-
 drivers/gpu/drm/nouveau/nouveau_debugfs.h     |   2 +
 drivers/gpu/drm/nouveau/nouveau_display.c     |  50 +-
 drivers/gpu/drm/nouveau/nouveau_dma.c         |  10 +-
 drivers/gpu/drm/nouveau/nouveau_dma.h         |   2 +-
 drivers/gpu/drm/nouveau/nouveau_dmem.c        |  19 +-
 drivers/gpu/drm/nouveau/nouveau_dp.c          |   2 +-
 drivers/gpu/drm/nouveau/nouveau_drm.c         | 359 +++-----
 drivers/gpu/drm/nouveau/nouveau_drv.h         |  71 +-
 drivers/gpu/drm/nouveau/nouveau_fence.c       |  33 +-
 drivers/gpu/drm/nouveau/nouveau_gem.c         |  34 +-
 drivers/gpu/drm/nouveau/nouveau_hwmon.c       |  46 +-
 drivers/gpu/drm/nouveau/nouveau_led.c         |   6 +-
 drivers/gpu/drm/nouveau/nouveau_mem.c         |  44 +-
 drivers/gpu/drm/nouveau/nouveau_mem.h         |   4 +-
 drivers/gpu/drm/nouveau/nouveau_prime.c       |   2 +-
 drivers/gpu/drm/nouveau/nouveau_sgdma.c       |   4 +-
 drivers/gpu/drm/nouveau/nouveau_svm.c         | 174 ++--
 drivers/gpu/drm/nouveau/nouveau_ttm.c         |  43 +-
 drivers/gpu/drm/nouveau/nouveau_usif.c        | 194 ----
 drivers/gpu/drm/nouveau/nouveau_usif.h        |  10 -
 drivers/gpu/drm/nouveau/nouveau_uvmm.c        |   4 +-
 drivers/gpu/drm/nouveau/nouveau_vga.c         |   8 +-
 drivers/gpu/drm/nouveau/nouveau_vmm.c         |  14 +-
 drivers/gpu/drm/nouveau/nouveau_vmm.h         |   2 +-
 drivers/gpu/drm/nouveau/nv04_fence.c          |   9 +-
 drivers/gpu/drm/nouveau/nv10_fence.c          |   6 +-
 drivers/gpu/drm/nouveau/nv10_fence.h          |   2 +-
 drivers/gpu/drm/nouveau/nv17_fence.c          |  25 +-
 drivers/gpu/drm/nouveau/nv50_fence.c          |  13 +-
 drivers/gpu/drm/nouveau/nv84_fence.c          |  20 +-
 drivers/gpu/drm/nouveau/nvc0_fence.c          |   4 +-
 drivers/gpu/drm/nouveau/nvif/Kbuild           |   3 +
 drivers/gpu/drm/nouveau/nvif/cgrp.c           |  52 ++
 drivers/gpu/drm/nouveau/nvif/chan.c           | 130 +++
 drivers/gpu/drm/nouveau/nvif/client.c         |  54 +-
 drivers/gpu/drm/nouveau/nvif/conn.c           |  53 +-
 drivers/gpu/drm/nouveau/nvif/device.c         |  67 +-
 drivers/gpu/drm/nouveau/nvif/disp.c           | 107 ++-
 drivers/gpu/drm/nouveau/nvif/dispchan.c       | 222 +++++
 drivers/gpu/drm/nouveau/nvif/driver.c         |  40 +-
 drivers/gpu/drm/nouveau/nvif/event.c          |  63 +-
 drivers/gpu/drm/nouveau/nvif/fifo.c           |  66 +-
 drivers/gpu/drm/nouveau/nvif/head.c           |  35 +-
 drivers/gpu/drm/nouveau/nvif/mem.c            | 102 ++-
 drivers/gpu/drm/nouveau/nvif/mmu.c            | 111 +--
 drivers/gpu/drm/nouveau/nvif/object.c         | 290 +-----
 drivers/gpu/drm/nouveau/nvif/outp.c           | 353 ++-----
 drivers/gpu/drm/nouveau/nvif/user.c           |  50 +-
 drivers/gpu/drm/nouveau/nvif/userc361.c       |   8 +-
 drivers/gpu/drm/nouveau/nvif/vmm.c            | 200 +---
 drivers/gpu/drm/nouveau/nvkm/Kbuild           |   1 +
 drivers/gpu/drm/nouveau/nvkm/core/Kbuild      |   2 +-
 drivers/gpu/drm/nouveau/nvkm/core/client.c    | 150 +--
 .../{nouveau_nvif.c => nvkm/core/driver.c}    |  69 +-
 drivers/gpu/drm/nouveau/nvkm/core/engine.c    |  12 -
 drivers/gpu/drm/nouveau/nvkm/core/ioctl.c     | 390 --------
 drivers/gpu/drm/nouveau/nvkm/core/object.c    | 159 +---
 drivers/gpu/drm/nouveau/nvkm/core/oproxy.c    |  76 --
 drivers/gpu/drm/nouveau/nvkm/core/subdev.c    |   8 -
 drivers/gpu/drm/nouveau/nvkm/core/uevent.c    |  88 +-
 drivers/gpu/drm/nouveau/nvkm/device/Kbuild    |   7 +
 .../nouveau/nvkm/{engine => }/device/acpi.c   |   0
 .../nouveau/nvkm/{engine => }/device/acpi.h   |   0
 .../nouveau/nvkm/{engine => }/device/base.c   | 552 +++++------
 drivers/gpu/drm/nouveau/nvkm/device/ctrl.c    | 172 ++++
 drivers/gpu/drm/nouveau/nvkm/device/ctrl.h    |   9 +
 .../nouveau/nvkm/{engine => }/device/pci.c    |   4 +-
 .../nouveau/nvkm/{engine => }/device/priv.h   |   2 -
 .../nouveau/nvkm/{engine => }/device/tegra.c  |   5 +-
 drivers/gpu/drm/nouveau/nvkm/device/user.c    | 434 +++++++++
 drivers/gpu/drm/nouveau/nvkm/device/user.h    |   9 +
 drivers/gpu/drm/nouveau/nvkm/engine/Kbuild    |   2 -
 .../gpu/drm/nouveau/nvkm/engine/device/Kbuild |   7 -
 .../gpu/drm/nouveau/nvkm/engine/device/ctrl.c | 212 -----
 .../gpu/drm/nouveau/nvkm/engine/device/ctrl.h |  13 -
 .../gpu/drm/nouveau/nvkm/engine/device/user.c | 431 ---------
 .../gpu/drm/nouveau/nvkm/engine/disp/Kbuild   |   1 +
 .../gpu/drm/nouveau/nvkm/engine/disp/ad102.c  |  13 +-
 .../gpu/drm/nouveau/nvkm/engine/disp/base.c   |  29 +-
 .../gpu/drm/nouveau/nvkm/engine/disp/chan.c   | 272 +++---
 .../gpu/drm/nouveau/nvkm/engine/disp/chan.h   |  15 +-
 .../gpu/drm/nouveau/nvkm/engine/disp/conn.h   |   2 +-
 .../gpu/drm/nouveau/nvkm/engine/disp/g84.c    |  13 +-
 .../gpu/drm/nouveau/nvkm/engine/disp/g94.c    |  13 +-
 .../gpu/drm/nouveau/nvkm/engine/disp/ga102.c  |  13 +-
 .../gpu/drm/nouveau/nvkm/engine/disp/gf119.c  |  13 +-
 .../gpu/drm/nouveau/nvkm/engine/disp/gk104.c  |  13 +-
 .../gpu/drm/nouveau/nvkm/engine/disp/gk110.c  |  13 +-
 .../gpu/drm/nouveau/nvkm/engine/disp/gm107.c  |  13 +-
 .../gpu/drm/nouveau/nvkm/engine/disp/gm200.c  |  13 +-
 .../gpu/drm/nouveau/nvkm/engine/disp/gp100.c  |  13 +-
 .../gpu/drm/nouveau/nvkm/engine/disp/gp102.c  |  13 +-
 .../gpu/drm/nouveau/nvkm/engine/disp/gt200.c  |  13 +-
 .../gpu/drm/nouveau/nvkm/engine/disp/gt215.c  |  13 +-
 .../gpu/drm/nouveau/nvkm/engine/disp/gv100.c  |  52 +-
 .../gpu/drm/nouveau/nvkm/engine/disp/head.h   |   2 +-
 .../gpu/drm/nouveau/nvkm/engine/disp/mcp77.c  |  13 +-
 .../gpu/drm/nouveau/nvkm/engine/disp/mcp89.c  |  13 +-
 .../gpu/drm/nouveau/nvkm/engine/disp/nv04.c   |   5 +-
 .../gpu/drm/nouveau/nvkm/engine/disp/nv50.c   |  20 +-
 .../gpu/drm/nouveau/nvkm/engine/disp/outp.h   |   3 +-
 .../gpu/drm/nouveau/nvkm/engine/disp/priv.h   |  31 +-
 .../gpu/drm/nouveau/nvkm/engine/disp/r535.c   |  46 +-
 .../gpu/drm/nouveau/nvkm/engine/disp/tu102.c  |  13 +-
 .../gpu/drm/nouveau/nvkm/engine/disp/ucaps.c  |  70 ++
 .../gpu/drm/nouveau/nvkm/engine/disp/ucaps.h  |   9 +
 .../gpu/drm/nouveau/nvkm/engine/disp/uchan.h  |  10 +
 .../gpu/drm/nouveau/nvkm/engine/disp/uconn.c  | 176 ++--
 .../gpu/drm/nouveau/nvkm/engine/disp/uconn.h  |   9 +
 .../gpu/drm/nouveau/nvkm/engine/disp/udisp.c  | 288 ++++--
 .../gpu/drm/nouveau/nvkm/engine/disp/udisp.h  |  17 +
 .../gpu/drm/nouveau/nvkm/engine/disp/uhead.c  | 125 +--
 .../gpu/drm/nouveau/nvkm/engine/disp/uhead.h  |   9 +
 .../gpu/drm/nouveau/nvkm/engine/disp/uoutp.c  | 778 ++++++++--------
 .../gpu/drm/nouveau/nvkm/engine/disp/uoutp.h  |   9 +
 .../gpu/drm/nouveau/nvkm/engine/dma/user.c    |  19 -
 .../drm/nouveau/nvkm/engine/dma/usergf100.c   |   5 -
 .../drm/nouveau/nvkm/engine/dma/usergf119.c   |   5 -
 .../drm/nouveau/nvkm/engine/dma/usergv100.c   |   5 -
 .../drm/nouveau/nvkm/engine/dma/usernv50.c    |   6 -
 .../gpu/drm/nouveau/nvkm/engine/fifo/Kbuild   |   1 +
 .../gpu/drm/nouveau/nvkm/engine/fifo/base.c   | 126 ---
 .../gpu/drm/nouveau/nvkm/engine/fifo/chan.c   |   2 -
 .../gpu/drm/nouveau/nvkm/engine/fifo/priv.h   |   5 -
 .../gpu/drm/nouveau/nvkm/engine/fifo/ucgrp.c  | 108 ++-
 .../gpu/drm/nouveau/nvkm/engine/fifo/ucgrp.h  |   9 +
 .../gpu/drm/nouveau/nvkm/engine/fifo/uchan.c  | 388 +++++---
 .../gpu/drm/nouveau/nvkm/engine/fifo/uchan.h  |  11 +
 .../gpu/drm/nouveau/nvkm/engine/fifo/ufifo.c  | 129 +++
 .../gpu/drm/nouveau/nvkm/engine/fifo/ufifo.h  |   8 +
 .../gpu/drm/nouveau/nvkm/engine/gr/gf100.c    |   1 -
 drivers/gpu/drm/nouveau/nvkm/engine/pm/Kbuild |  11 -
 drivers/gpu/drm/nouveau/nvkm/engine/pm/base.c | 867 ------------------
 drivers/gpu/drm/nouveau/nvkm/engine/pm/g84.c  | 165 ----
 .../gpu/drm/nouveau/nvkm/engine/pm/gf100.c    | 243 -----
 .../gpu/drm/nouveau/nvkm/engine/pm/gf100.h    |  20 -
 .../gpu/drm/nouveau/nvkm/engine/pm/gf108.c    |  66 --
 .../gpu/drm/nouveau/nvkm/engine/pm/gf117.c    |  80 --
 .../gpu/drm/nouveau/nvkm/engine/pm/gk104.c    | 184 ----
 .../gpu/drm/nouveau/nvkm/engine/pm/gt200.c    | 157 ----
 .../gpu/drm/nouveau/nvkm/engine/pm/gt215.c    | 138 ---
 drivers/gpu/drm/nouveau/nvkm/engine/pm/nv40.c | 123 ---
 drivers/gpu/drm/nouveau/nvkm/engine/pm/nv40.h |  15 -
 drivers/gpu/drm/nouveau/nvkm/engine/pm/nv50.c | 175 ----
 drivers/gpu/drm/nouveau/nvkm/engine/pm/priv.h | 105 ---
 drivers/gpu/drm/nouveau/nvkm/engine/sw/nvsw.c |  14 +-
 .../gpu/drm/nouveau/nvkm/subdev/fault/base.c  |   1 -
 .../gpu/drm/nouveau/nvkm/subdev/fault/priv.h  |   5 -
 .../gpu/drm/nouveau/nvkm/subdev/fault/user.c  |  99 +-
 .../gpu/drm/nouveau/nvkm/subdev/fault/user.h  |   9 +
 .../gpu/drm/nouveau/nvkm/subdev/mmu/base.c    |   1 -
 .../gpu/drm/nouveau/nvkm/subdev/mmu/umem.c    | 125 ++-
 .../gpu/drm/nouveau/nvkm/subdev/mmu/umem.h    |  24 +-
 .../gpu/drm/nouveau/nvkm/subdev/mmu/ummu.c    | 186 ++--
 .../gpu/drm/nouveau/nvkm/subdev/mmu/ummu.h    |  13 +-
 .../gpu/drm/nouveau/nvkm/subdev/mmu/uvmm.c    | 357 +++-----
 .../gpu/drm/nouveau/nvkm/subdev/mmu/uvmm.h    |  12 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmm.h |   8 +-
 .../drm/nouveau/nvkm/subdev/mmu/vmmgp100.c    |  68 +-
 .../drm/nouveau/nvkm/subdev/mmu/vmmgp10b.c    |   2 +-
 .../drm/nouveau/nvkm/subdev/mmu/vmmgv100.c    |   2 +-
 .../drm/nouveau/nvkm/subdev/mmu/vmmtu102.c    |   2 +-
 .../gpu/drm/nouveau/nvkm/subdev/vfn/base.c    |   1 -
 .../gpu/drm/nouveau/nvkm/subdev/vfn/priv.h    |   3 -
 .../gpu/drm/nouveau/nvkm/subdev/vfn/uvfn.c    |  44 +-
 .../gpu/drm/nouveau/nvkm/subdev/vfn/uvfn.h    |   9 +
 306 files changed, 6653 insertions(+), 10697 deletions(-)
 create mode 100644 drivers/gpu/drm/nouveau/include/nvif/cgrp.h
 create mode 100644 drivers/gpu/drm/nouveau/include/nvif/chan.h
 delete mode 100644 drivers/gpu/drm/nouveau/include/nvif/clb069.h
 create mode 100644 drivers/gpu/drm/nouveau/include/nvif/ctxdma.h
 create mode 100644 drivers/gpu/drm/nouveau/include/nvif/dispchan.h
 create mode 100644 drivers/gpu/drm/nouveau/include/nvif/driverif.h
 delete mode 100644 drivers/gpu/drm/nouveau/include/nvif/if0000.h
 delete mode 100644 drivers/gpu/drm/nouveau/include/nvif/if0001.h
 delete mode 100644 drivers/gpu/drm/nouveau/include/nvif/if0002.h
 delete mode 100644 drivers/gpu/drm/nouveau/include/nvif/if0003.h
 delete mode 100644 drivers/gpu/drm/nouveau/include/nvif/if0008.h
 delete mode 100644 drivers/gpu/drm/nouveau/include/nvif/if000c.h
 delete mode 100644 drivers/gpu/drm/nouveau/include/nvif/if000e.h
 delete mode 100644 drivers/gpu/drm/nouveau/include/nvif/if0010.h
 delete mode 100644 drivers/gpu/drm/nouveau/include/nvif/if0012.h
 delete mode 100644 drivers/gpu/drm/nouveau/include/nvif/if0013.h
 delete mode 100644 drivers/gpu/drm/nouveau/include/nvif/if0014.h
 delete mode 100644 drivers/gpu/drm/nouveau/include/nvif/if0020.h
 delete mode 100644 drivers/gpu/drm/nouveau/include/nvif/if0021.h
 create mode 100644 drivers/gpu/drm/nouveau/include/nvkm/core/driver.h
 delete mode 100644 drivers/gpu/drm/nouveau/include/nvkm/core/ioctl.h
 delete mode 100644 drivers/gpu/drm/nouveau/include/nvkm/engine/pm.h
 delete mode 100644 drivers/gpu/drm/nouveau/nouveau_usif.c
 delete mode 100644 drivers/gpu/drm/nouveau/nouveau_usif.h
 create mode 100644 drivers/gpu/drm/nouveau/nvif/cgrp.c
 create mode 100644 drivers/gpu/drm/nouveau/nvif/chan.c
 create mode 100644 drivers/gpu/drm/nouveau/nvif/dispchan.c
 rename drivers/gpu/drm/nouveau/{nouveau_nvif.c => nvkm/core/driver.c} (65%)
 delete mode 100644 drivers/gpu/drm/nouveau/nvkm/core/ioctl.c
 create mode 100644 drivers/gpu/drm/nouveau/nvkm/device/Kbuild
 rename drivers/gpu/drm/nouveau/nvkm/{engine => }/device/acpi.c (100%)
 rename drivers/gpu/drm/nouveau/nvkm/{engine => }/device/acpi.h (100%)
 rename drivers/gpu/drm/nouveau/nvkm/{engine => }/device/base.c (89%)
 create mode 100644 drivers/gpu/drm/nouveau/nvkm/device/ctrl.c
 create mode 100644 drivers/gpu/drm/nouveau/nvkm/device/ctrl.h
 rename drivers/gpu/drm/nouveau/nvkm/{engine => }/device/pci.c (99%)
 rename drivers/gpu/drm/nouveau/nvkm/{engine => }/device/priv.h (95%)
 rename drivers/gpu/drm/nouveau/nvkm/{engine => }/device/tegra.c (97%)
 create mode 100644 drivers/gpu/drm/nouveau/nvkm/device/user.c
 create mode 100644 drivers/gpu/drm/nouveau/nvkm/device/user.h
 delete mode 100644 drivers/gpu/drm/nouveau/nvkm/engine/device/Kbuild
 delete mode 100644 drivers/gpu/drm/nouveau/nvkm/engine/device/ctrl.c
 delete mode 100644 drivers/gpu/drm/nouveau/nvkm/engine/device/ctrl.h
 delete mode 100644 drivers/gpu/drm/nouveau/nvkm/engine/device/user.c
 create mode 100644 drivers/gpu/drm/nouveau/nvkm/engine/disp/ucaps.c
 create mode 100644 drivers/gpu/drm/nouveau/nvkm/engine/disp/ucaps.h
 create mode 100644 drivers/gpu/drm/nouveau/nvkm/engine/disp/uchan.h
 create mode 100644 drivers/gpu/drm/nouveau/nvkm/engine/disp/uconn.h
 create mode 100644 drivers/gpu/drm/nouveau/nvkm/engine/disp/udisp.h
 create mode 100644 drivers/gpu/drm/nouveau/nvkm/engine/disp/uhead.h
 create mode 100644 drivers/gpu/drm/nouveau/nvkm/engine/disp/uoutp.h
 create mode 100644 drivers/gpu/drm/nouveau/nvkm/engine/fifo/ucgrp.h
 create mode 100644 drivers/gpu/drm/nouveau/nvkm/engine/fifo/uchan.h
 create mode 100644 drivers/gpu/drm/nouveau/nvkm/engine/fifo/ufifo.c
 create mode 100644 drivers/gpu/drm/nouveau/nvkm/engine/fifo/ufifo.h
 delete mode 100644 drivers/gpu/drm/nouveau/nvkm/engine/pm/Kbuild
 delete mode 100644 drivers/gpu/drm/nouveau/nvkm/engine/pm/base.c
 delete mode 100644 drivers/gpu/drm/nouveau/nvkm/engine/pm/g84.c
 delete mode 100644 drivers/gpu/drm/nouveau/nvkm/engine/pm/gf100.c
 delete mode 100644 drivers/gpu/drm/nouveau/nvkm/engine/pm/gf100.h
 delete mode 100644 drivers/gpu/drm/nouveau/nvkm/engine/pm/gf108.c
 delete mode 100644 drivers/gpu/drm/nouveau/nvkm/engine/pm/gf117.c
 delete mode 100644 drivers/gpu/drm/nouveau/nvkm/engine/pm/gk104.c
 delete mode 100644 drivers/gpu/drm/nouveau/nvkm/engine/pm/gt200.c
 delete mode 100644 drivers/gpu/drm/nouveau/nvkm/engine/pm/gt215.c
 delete mode 100644 drivers/gpu/drm/nouveau/nvkm/engine/pm/nv40.c
 delete mode 100644 drivers/gpu/drm/nouveau/nvkm/engine/pm/nv40.h
 delete mode 100644 drivers/gpu/drm/nouveau/nvkm/engine/pm/nv50.c
 delete mode 100644 drivers/gpu/drm/nouveau/nvkm/engine/pm/priv.h
 create mode 100644 drivers/gpu/drm/nouveau/nvkm/subdev/fault/user.h
 create mode 100644 drivers/gpu/drm/nouveau/nvkm/subdev/vfn/uvfn.h

-- 
2.41.0

