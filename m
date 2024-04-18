Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BBCB48AA68B
	for <lists+nouveau@lfdr.de>; Fri, 19 Apr 2024 03:33:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 34CB210E876;
	Fri, 19 Apr 2024 01:33:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="mhwx6p7C";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2082.outbound.protection.outlook.com [40.107.220.82])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5CBB310E876
 for <nouveau@lists.freedesktop.org>; Fri, 19 Apr 2024 01:33:26 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=M+ecvjrJT3ckmNhFTiaClv0RcAkdUiSt+mdT2owVpsWshz31dslUpk8qfiV0rM6JvzPbsL1XzAp/DWiDcpF7//P2q4NN6zqMLI/8XDu5E/5KoUF/GluEm7LsceH9ciUr6UxYzwXGBCKar5n8WSb9iQl7vDlaRiClyB/IcoJpVaVl2w7g1G5s/RCDQMnzbVJEq+9UJLzfy/JT5Z8F7HJNtBhutteIxsh4tBRWMvVVkV6TyIkU9gJDJJDAXSy+VpTsDUyI3c3IMq7qnL3KMb5AjB9PcXCbehPjUVm05fqRjXsOp6qfbsiz7NgwIy0D2C7xUibjuUm+X4+o+BLbVIjvtg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=m+AM5yOIMfDq3119wbVcR4IUqYdgx0tUvlxuRIe9LE4=;
 b=S3TKheyIbHoIEcC9ajsXpPtTz9K7p77Nl3smEbf/RgI7anYgdITmav+PysPrjKFtJfyAuxQtp0j8RGDnwO0Gl7NEdMpXy4DM9LHLpE7kKoQZczxYvTwR6VEYChLAX1C5RyuFm/R989Sct5a7C7qQJjl5vYqN8KY/+loATq3xyADDfx9oBgndmTRlxi1RWlq2dvfcPZp/TRCuZePUF2rh1ecNlM3TVFdSbZpTlN0z6ipaDyR6wbjmRP+2nutd1eBEVGw6b7CS0AOqzahXKZiBNBPgNVb4Vxolv+G6fEeyuxQsdW82Lrleoz1164eogiEuaylZwnR2kF74syoP0li4BQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=gmail.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=m+AM5yOIMfDq3119wbVcR4IUqYdgx0tUvlxuRIe9LE4=;
 b=mhwx6p7CNT5P4zUYXF/w07fs3FrbEDwW77oPkiEpOieUBnFgbGKJBymB+jFT6s/a4EW+39uJOstA+8h+ACRXQx1YclwEGEqCrDRXeBLa/vU/X0K6QWtEOCxtzGw0V2CYpzYRSrx+y3vBRyYMa9UoJWKPaABtxyYQGmMUOCVtK3qPCk6yHfi3coXDlswEJoqwRN46WzZlTnFk1eQaJtFzNHmcrgzrsAKFEi4l7HsqqK1OawuWAFcyWt7KgNG82icNhB6w+yDiGkW2ibrZmYWbE8ihAI6Frj47FgE6eCXbLNam8HNsu3k389IDB6tqFHoYbFWE9aOTKfdOEgGMDmdpVw==
Received: from CH0PR03CA0300.namprd03.prod.outlook.com (2603:10b6:610:e6::35)
 by SJ0PR12MB6941.namprd12.prod.outlook.com (2603:10b6:a03:448::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7472.39; Fri, 19 Apr
 2024 01:33:21 +0000
Received: from CH1PEPF0000AD7D.namprd04.prod.outlook.com
 (2603:10b6:610:e6:cafe::f1) by CH0PR03CA0300.outlook.office365.com
 (2603:10b6:610:e6::35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7495.30 via Frontend
 Transport; Fri, 19 Apr 2024 01:33:21 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 CH1PEPF0000AD7D.mail.protection.outlook.com (10.167.244.86) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7452.22 via Frontend Transport; Fri, 19 Apr 2024 01:33:21 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Thu, 18 Apr
 2024 18:33:09 -0700
Received: from [172.19.145.127] (10.126.231.35) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Thu, 18 Apr
 2024 18:33:08 -0700
Message-ID: <5828c948-0c46-4215-840b-c5884b825889@nvidia.com>
Date: Thu, 18 Apr 2024 22:52:04 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Ben Skeggs <bskeggs@nvidia.com>
Subject: Re: [PATCH 000/156] drm/nouveau: replace "ioctl" interface between
 drm/nvkm
To: Dave Airlie <airlied@gmail.com>
CC: <nouveau@lists.freedesktop.org>
References: <20240416234002.19509-1-bskeggs@nvidia.com>
 <CAPM=9tyW=YuDQrRwrYK_ayuvEnp+9irTuze=MP-zkowm3CFJ9A@mail.gmail.com>
Content-Language: en-US
In-Reply-To: <CAPM=9tyW=YuDQrRwrYK_ayuvEnp+9irTuze=MP-zkowm3CFJ9A@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.126.231.35]
X-ClientProxiedBy: rnnvmail201.nvidia.com (10.129.68.8) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0000AD7D:EE_|SJ0PR12MB6941:EE_
X-MS-Office365-Filtering-Correlation-Id: 2db5008f-d305-485e-baef-08dc6010b2c9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: oUe5TIF1DBQQH3v29p8rXJ9ddZuvZt+b5RBg3NtjhwqX398iycv/nbW29P5FNfUg0SzetEFezx2PdqjOf6VpQHzVCNEvktxSJTHyWbAwZgiZ/p5HBerHr4DhrP+vUt/M1c2e6H6MmJ+igEo5BUYN+ugIjpEYTp0fVkjWZ1NvD+qfc3CifXs2RRn59e7i9cUbOykbLQMNy5EAM5yJxwlXKn6qlo7GMzsScFmjKcPY39fBiQ7lDE8qKkZK9T7Syi+Ep57kLar6S+D2vT2EUlsNxB2vEO+YQO6fZX0yQnbE4bbyWBU24NoFUm2wkwkC0OwQEWaVbf+S/6Qgulx0Tn+Rb32tvR6mo46hehipfjScXt1qmBrs3cWicKP65bAR9JtE9MGLhB2tF3bkd/jszTGNqOB0OcLVTUvP5oG6yt1UBzTnyekwp4g5AK+HShkTsTjmnhI+wMHlYl+Paaua0CargNtiBkHH2zlwMZlhLOxyIsp3X8w+pR9Eg43kmdfk8Op5O+j7s0lNf/hqYOh0V9ZX3bsQC3zO3nzQzCCHKnYUsRTbWEnstZQ9xFdY4LNHplUzIKi3Lgamjk6DmY5Ku/Xv1IuJ6wsPeCaqlD55dJrH0zcbBCDGOBHmoT48TujPpnQvtzVEzTqusys8+hwpSEv0FOy5MMbTQH100a3VMpn12gOMSit/5wJ7lfPxr1fkYTaHrgDs+py57dHU1wpftUuoPtkj8pnD2I+wIKirHyUuB2gB2Bp06P+8wU7v7i1uEhOz
X-Forefront-Antispam-Report: CIP:216.228.117.160; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge1.nvidia.com; CAT:NONE;
 SFS:(13230031)(36860700004)(376005)(82310400014)(1800799015); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Apr 2024 01:33:21.3513 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2db5008f-d305-485e-baef-08dc6010b2c9
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.160];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CH1PEPF0000AD7D.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB6941
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

On 17/4/24 14:15, Dave Airlie wrote:

> On Wed, 17 Apr 2024 at 10:57, Ben Skeggs <bskeggs@nvidia.com> wrote:
>> This is a series of cleanups that I intended on doing after posting
>> the initial GSP-RM support several months ago, and have now had the
>> opportunity to work on again.
>>
>> The main intention here is to replace the ioctl-like interface that
>> sits between NVKM and the nouveau DRM driver with more direct calls,
>> to reduce the call-chain complexity (and overhead).
>>
>> This is achieved by having NVKM return structs of info and function
>> pointers specific to each class, along with an opaque pointer to its
>> private data.  These are stored in the NVIF structs and used to call
>> directly into an implementation without handle lookups and multiple
>> layers of indirection.
>>
>> There's room for further cleanups and API changes from here, but for
>> now most of the API usage is exactly as it was before, as the series
>> has gotten quite large enough already.
>>
>> The first part of the series starts out by cleaning up some of the
>> interfaces within the DRM driver, and reimplementing the subset of
>> "ioctl" interfaces needed by userspace directly.
>>
>> A number of unused interfaces/function args are then removed so that
>> they don't need to be ported, and some initial renames/preparations
>> are made to the NVKM's user object implementations so that diffs of
>> the next set of patches are more straightforward to read.
>>
>> I then go through each class in turn, starting from the root of the
>> object tree (client), and working up from there.  The object ctors/
>> dtors are ported first, followed by sclass/map/etc, followed by the
>> class's methods, and then repeating the process with each of their
>> children.
>>
>> Objects remain accessible with the "ioctl" interface throughout the
>> changes (until their last use, after which they're removed from the
>> object rb entirely) to allow each change to be done independently.
>>
>> After all classes have been ported, some final cleanups are made to
>> the DRM driver to complete the series.
> Welcome back!

Hey!  Thank you :)


>
> Do you have a git tree with this in it, since I think at least patch
> 25 got stuck in moderation.

I've pushed a tree to 
https://gitlab.freedesktop.org/bskeggs/nouveau/-/tree/remove-ioctl


>
> Have you tested nouveau GL and nvk on top of this?

Yes I have, nvk mostly via zink (and vkcube ;)).


Ben.

>
> Dave.
