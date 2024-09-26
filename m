Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 00143987B4B
	for <lists+nouveau@lfdr.de>; Fri, 27 Sep 2024 00:51:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E72D410E0B8;
	Thu, 26 Sep 2024 22:51:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="NU8ZrzVi";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2058.outbound.protection.outlook.com [40.107.244.58])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0113910E334
 for <nouveau@lists.freedesktop.org>; Thu, 26 Sep 2024 22:51:23 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hEqg/4CTzq571jbeV5VT0LgfWMz4OQFsitJh+yJUgvcKbhgOeMt+4+eoSMV1kXJyZiGJVjaTUVo1A1k2VcnNJuJBF1lo4+KndtCMU36PVdesxJGGVlrfkDJXxcN2xfj0sD1t8uE7b8Z1YZF9CQZuyar1KQFGxiG/XXtzwDlQjfifgrDOvMCOKLpAbrZLcvS9zCbuEoHDlQIZDCS1SoFftBAIkMuM+ULyFM4bviS2Rk8NQiK06ZKd9/6rW+Cd4dE/reUJ3JzJdaD41uP7uAG6fDVovuLkR2WUH+tnY1YVANQqGPPed6MdnAmLK5EsNlmGIaGPlRZl+dFCG8g+xn6CdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=k5K4gGx5Om5XfuFqUT2PKq1N4P1fdowJiHPfmg7z0d8=;
 b=Pot42YKnqc8iqpWZ4OrzDmnI7zlJrlSDVkR2C0tbZWmpBhxezCrix1N2sd+wvm734WrtgRdyEgLU9zgZq83lpJ4ouvRO/Jim8ed1iWoqluCTr0j7j7or0YoloexOlEY1WNy/fK/+75yZRIOYf3MmaSKjL7SDwTbrDPQ9rB4JFgLmlkePl8Hj+4Juga+TjzkrSVZOWcC9iAY4KqyT52vbw9FHnt7K9HaEksAjOOuWn5SwyunCkrlqMnHuWimzm+Ym70LAB8gNEKkBe0HBR51RZ+10dMv31nsLQIv5Ru9gX/GajN7ztIQJdCO+tiKvyH6AfH0dpzdxNkzdhQ+ZA+FsWQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=k5K4gGx5Om5XfuFqUT2PKq1N4P1fdowJiHPfmg7z0d8=;
 b=NU8ZrzViuw75BfJF/yhPdlvpl2JC7qmKzrAY1aV5t0qDXsjD5EhBnskYN+WEr27v35RLo4YEt1yaES/9w+QLy4vOCVbIGA/pOjw6MSarCSGQMZDTsnCiOKh0F29H+GSWCZwDaxagNVON6kQxnqF9Wv4hS6Mhf8o13puWybuhkzAKzAyG8TGis3qY9A2VDB/GrieAgBstbWU9rkp65VMaDIhNuCzwUHWZGOLM5YYojfT1KhxHiquW6fdj+WLbKsc5ZEv+cZITmhnMhNlVIg8Ez8cUJEs/VdL87y8hA50zesZUKHvkNZso/ItlqkMEuUbbJGx/S7RQ8ISw0UFZbS3ZjQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH3PR12MB8659.namprd12.prod.outlook.com (2603:10b6:610:17c::13)
 by PH8PR12MB6794.namprd12.prod.outlook.com (2603:10b6:510:1c5::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8005.21; Thu, 26 Sep
 2024 22:51:21 +0000
Received: from CH3PR12MB8659.namprd12.prod.outlook.com
 ([fe80::6eb6:7d37:7b4b:1732]) by CH3PR12MB8659.namprd12.prod.outlook.com
 ([fe80::6eb6:7d37:7b4b:1732%4]) with mapi id 15.20.7982.022; Thu, 26 Sep 2024
 22:51:20 +0000
Date: Thu, 26 Sep 2024 19:51:00 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: Zhi Wang <zhiw@nvidia.com>
Cc: kvm@vger.kernel.org, nouveau@lists.freedesktop.org,
 alex.williamson@redhat.com, kevin.tian@intel.com, airlied@gmail.com,
 daniel@ffwll.ch, acurrid@nvidia.com, cjia@nvidia.com,
 smitra@nvidia.com, ankita@nvidia.com, aniketa@nvidia.com,
 kwankhede@nvidia.com, targupta@nvidia.com, zhiwang@kernel.org
Subject: Re: [RFC 04/29] nvkm/vgpu: set the VF partition count when NVIDIA
 vGPU is enabled
Message-ID: <20240926225100.GT9417@nvidia.com>
References: <20240922124951.1946072-1-zhiw@nvidia.com>
 <20240922124951.1946072-5-zhiw@nvidia.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240922124951.1946072-5-zhiw@nvidia.com>
X-ClientProxiedBy: BL1PR13CA0309.namprd13.prod.outlook.com
 (2603:10b6:208:2c1::14) To CH3PR12MB8659.namprd12.prod.outlook.com
 (2603:10b6:610:17c::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR12MB8659:EE_|PH8PR12MB6794:EE_
X-MS-Office365-Filtering-Correlation-Id: b993e58e-b7be-4981-53c5-08dcde7dbd26
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?OBQX6AVwXErK0OgVOwzTpPPtfn5GVBXqodLGe7mxUs5Im5SdQwJgSRrcMh/p?=
 =?us-ascii?Q?Pd4OXHRnAoGxumLoRQpNfAfSSdtrlI3qfZLyB8bKXMWC83n0ayFsv+OsP1a1?=
 =?us-ascii?Q?RNuSFutKmMc/OOE+tbAhs0s8TZghXNlt8Zdz34aOStTJv1aZSiyHbS0eERUv?=
 =?us-ascii?Q?SN3/f1cM4rBCBpU883xDlQ8X3/GjQ6eTc6LTdQrMGTtDABS1Ch9qdGQd0i+K?=
 =?us-ascii?Q?C1FrpALwrDFo31GnuffZRm+4fyLC/ZVhr2XhyevruYPGv/POCfuyohZq4K03?=
 =?us-ascii?Q?saYMI5+7w9yI3hPYyjXry1BMJ4+8wQ5KHswEmGfjY6k57E7PBoLF5lkyGMKr?=
 =?us-ascii?Q?cjHcC9IOWTKUQkWc+F6l4N2nVeZ8YHKYQtI4Kxwa/liTmQCjgONllyCAiL6c?=
 =?us-ascii?Q?8sfOoiDTdX+/noQ+9TXFBPjJ+kP1Pa1ti7JKorcQAeUzBdPSLnGSdYpdUivA?=
 =?us-ascii?Q?v0xgEz/vAYsBkTKlE1GyiKAYJZvGlAKwxriN4UJwuqG7f/UkUgVRRLmttoox?=
 =?us-ascii?Q?/Qd6t/GBI7EJwHOk+wZarBL6Tfb4hCIos+5NzAaaex++uegOHre1pSGim1CZ?=
 =?us-ascii?Q?+O9BNUTa8TjAd+QRVgjlZu6jK8yCDY+tkVVRqUsiHTeApaXyVGM7sbx+nRFN?=
 =?us-ascii?Q?gyTnCJa6SHD5uWsF226xvp0m8T1WIlyoJ1ZwaAqoqnWMmzxDFKD3GjEbxrZ/?=
 =?us-ascii?Q?ncAlMciAYTWCw+dcGHCX7rriCriaNLZO/1QBsVNlRAiZiG7lnZCWIEhAJmmf?=
 =?us-ascii?Q?GiUvexfk/V2Qkh3hci0NUfFOqXxmGtu8WOM/tFUAunuFnAa99NGuqrHLtIaV?=
 =?us-ascii?Q?ZCACfsEQpz0JU6a6kpF364yyuCQKnBMmfw4kJOQusS06FY+Cozm4KRVvaXhh?=
 =?us-ascii?Q?+ni/d32sm0w95UCfR0V4IGJdM63XScj4+RGCVwrfNZ62UX7atgeeOit9cscA?=
 =?us-ascii?Q?chPwg0YmLTYRvLQHOApCx4KEXGpQvm1HBH3AUgROwGWekLWjfxTHvRB3Egin?=
 =?us-ascii?Q?k66sP1iZe6N1KFXz0R59LyiNc8LzzadZvMFU6n/pS5QxXdPa6vc6pHfx43bk?=
 =?us-ascii?Q?BsU5XMM9PXeStKC8r7n5mlaWY2zte/+USEj+APeEBtiaow8p/yrmyhR1S2+G?=
 =?us-ascii?Q?3xzK+nNsVfkR9dp05coPvRJAe/up8blDcm+NDrLLH7thQJHT6KUFYa3TUUt6?=
 =?us-ascii?Q?fNYlJh7H1r1ufQe+udHHB7GnL4CqkaW4iKymJqn23FSPG4tbOmyHY73u7/nA?=
 =?us-ascii?Q?1HyLSwAOactpYMcwl7CmXLoA2tB6cc6tA5G3Oox2Kw=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR12MB8659.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ThOnmEL1LoYk7BZsUGHRIfw+ot0VTHzHz3jxG+QUhSxVtPFoZb4WgBPwlgYM?=
 =?us-ascii?Q?X80UMfNvGPbtHYV9hoiOLx1I3X/3k21g76atLQ4nECKZjFbbptgm00KYFmRu?=
 =?us-ascii?Q?/nY30Qof7fO7ENwtSHGkA6YIyTunVJzd2zPMKQmA8L2xBqPegjHhwd65+BDe?=
 =?us-ascii?Q?weUHAsvu895hCjuM3Ds/7yrJjB6NA/0IzAXQM6WKY6dKbspKqW3hABMR3L1h?=
 =?us-ascii?Q?XCKT+shjPOityAmc9SD4cJJv366F1IP6calFt+CuyJeNHgNF7cIRAOdCF5lh?=
 =?us-ascii?Q?6jMo4MpGEzsvgGSFRUPLbzmK5Emn2PLNpSdNk9F7EuxJrC80St/E6Kmd9ltz?=
 =?us-ascii?Q?UQLp5LS767poas161PfmLVr/Q8uFIxDtSLWeBuI4EmgzvJtLkf2POkWBBAcn?=
 =?us-ascii?Q?kZtoTmQFF7DuInV7clDavtSHxpfQ4s17yLt7wtjjLkkB4h/THYuCLNTx4xM8?=
 =?us-ascii?Q?x2Q4nIpJ8lvP3ixMuAG8uKG1aBLPoxq6ix/OOMsCItTvYdc10E3DOXT6eEFo?=
 =?us-ascii?Q?uXtvBph7+w/XKBX4KYsl5JWIKa8UppitUw5LIDmBVScN7tcIG6LWfd+0ghLx?=
 =?us-ascii?Q?CdBXONFUAm5iaB3lKuO2wvPMRfyCOF0YZOCNZCyoJ9ch1hx5W7rG9V3h1uTU?=
 =?us-ascii?Q?x4yedAr1cZ32JL6HhQi7KFMI3kjWO5XB/kXy7ZLzbfX2aAicRdFjyaDxveER?=
 =?us-ascii?Q?fGffRCVXmM+ncpEK62poS6A9gb64meIIVjvhiOOk+BziYwGehUjSJR0efn8k?=
 =?us-ascii?Q?2rOvzRlkHYGGmAen+GY2eEjiECrMd2w7mf6ngQu6QUUT4+JB96umBFH1Vk0i?=
 =?us-ascii?Q?eGyDeF8BDk2wKyj0agY9PZVZoR6c56nLebBIwj8tJZwx2tv/BA3AAEsTcTBZ?=
 =?us-ascii?Q?V3Vb4e/OV17w8NLRv3m0lEWX1ENaleIzy0Po9dBVd2TGTQtK0Ih5KqKUJKCd?=
 =?us-ascii?Q?osyrxzaObypj/XepNx1ptLHL8cWmSQYewApinBNhz+faTucvIBZIQWjxPVdp?=
 =?us-ascii?Q?JD6Q0iYXMia0rdR52PNxGGFkxnoW0oO5i0yZ1wOi0hW1Mz4aIAjArbbNen7l?=
 =?us-ascii?Q?hqLbX6JG3FHF1bdtdJiNgvCG32hs8H4siKLjWxeSsVUCGf1lzKpGIzno5VEU?=
 =?us-ascii?Q?TUY3aGUXVXIbxyzPEm/IdWWz1EfS1YZQwUHFZfKGJXmFsdhB5byVkzMy7vsY?=
 =?us-ascii?Q?GP9NF2yO8pO8/ZMR0XOjgkx9R+kUHnHUZANmS9UCUaxo0+yEgu+R6P+voxwH?=
 =?us-ascii?Q?2mc+xf+uHlpgvTE7kz2T9XdXh7XC82ljFTVqsvwf195PCkT8IdBs+Of+V6+c?=
 =?us-ascii?Q?1f3g4aXjzQBRJhMGa4A0vosSL3hHckYqF6K9qKBw8v7vssG4UcZvWyYCoSx4?=
 =?us-ascii?Q?ALEEnCl2w1kk94zLlqQirRBCzAjxi+vmln61OYZEqCQEu5k5YGb7FPOQ/SQM?=
 =?us-ascii?Q?aeFPkNdLRZgLlu0/EaNpt5I60OyMJII58UGHUbJWAAWg+7ZNXnn5hqqA+8+O?=
 =?us-ascii?Q?zPfM+Ik58Z1JGjr/8zvP/vzc0JktlxQjAseA1Pag6V/zyD5HAAvU52HqvowP?=
 =?us-ascii?Q?r6/zKvHPo0o9Skv25Z0=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b993e58e-b7be-4981-53c5-08dcde7dbd26
X-MS-Exchange-CrossTenant-AuthSource: CH3PR12MB8659.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Sep 2024 22:51:20.6860 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wtJXe7hqEbpwsu8wC1tLUrrm12pvnyevlGAcfHfxbpJT1KRktMkBSlieMDKCGy8I
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB6794
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

On Sun, Sep 22, 2024 at 05:49:26AM -0700, Zhi Wang wrote:
> GSP firmware needs to know the number of max-supported vGPUs when
> initialization.
> 
> The field of VF partition count in the GSP WPR2 is required to be set
> according to the number of max-supported vGPUs.
> 
> Set the VF partition count in the GSP WPR2 when NVKM is loading the GSP
> firmware and initializes the GSP WPR2, if vGPU is enabled.

How/why is this different from the SRIOV num_vfs concept?

The way the SRIOV flow should work is you boot the PF, startup the
device, then userspace sets num_vfs and you get the SRIOV VFs.

Why would you want less/more partitions than VFs? Is there some way to
consume more than one partition per VF?

At least based on the commit message this seems like a very poor FW
interface.

Jason
