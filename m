Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BC6993E8D6
	for <lists+nouveau@lfdr.de>; Sun, 28 Jul 2024 20:13:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 83C6110E19B;
	Sun, 28 Jul 2024 18:13:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="rspwmmeW";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2049.outbound.protection.outlook.com [40.107.223.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 38D6E10E19B
 for <nouveau@lists.freedesktop.org>; Sun, 28 Jul 2024 18:13:13 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XJQaUX4MxQdofmXaCpfOc6nG03bJX77cX8V0uix7tXC8Ix6zqAN220/5Y+vq20M8m2R2rbRdEztqrIx+Jk2FOb9bQk0EJsSX9tFOYk9n+WCso8oXgMUKhatCboSq3tX7KlqvS40ewd8gsqVFKeACxNOB2tq4/lLxaUo+amCTMuUtOOlEx8TA/HhHakJUo2ZYMaDH2xsocKp+d83wUJPxyKtf+9KG0lqQ9rbki2DkbQo59CnEhzofF31+2DfBs1EP/sYX4EBEB279GTVxJn5Q4V6FAeSOuPItrOiBHRFcIoHqCeG9NyyTMthMsfUVSK58034wS4x0Oqh6I4v/FfnT+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MD3iQfcjoWigd6MBnG8nRwYfcZ9F6LmGgUIlsbUw8eA=;
 b=Ely+OXVK2+luOTmMPp4eETo5+CKqSxo27Dsu+B9ISctBgM8efB1qR2o41WJHriM4323CJiArLPgJabDcoBjRVqTI6yYXb2pEnCF4EUCMxeLOgYHIA1fSX1LVp/aGGEjIk/zdaVm5vQjN7ZzTpT6P1R3TniUwjRE/8qz5AayG3a5yPCzee/fh+VFIcI/Rxl77W/GANvan0eITcSGmb7RJumVuk6KHZTXRdtN4PUfLXPCAKWune0g/ZiD7EdmCc0/xjy0UmlBRHf8EVAufbFmYvK1ysZ0V4aMjsNH5384kD6fZ4SlrArY0A3vz32ZKI/0Yn7fJuhb+9EYxiZaDK3d7NA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MD3iQfcjoWigd6MBnG8nRwYfcZ9F6LmGgUIlsbUw8eA=;
 b=rspwmmeWkurF54idMaYKtuuEXtSWurvje9MjyXEojS7zD859O/mpwl2be+u4ay1lTCJotsFQm22Lsbu6dbmT6rrYR+Xn7+6nREMVrld5lQQ7k+jwuTeO8cU0PAgPHEBPu1ZWayu8yv63dXyJMdavL9wfB/qnldA3oGIk1y45ZkddVgWIxn72qQbDgoh+TQEkqc1N2lLNk4v+r+MhuIUE9RTnzpb41olq6ie21uEUZCsLaXdb6jTC5D7cMv/t5wQ3eskqQAbnsf2bk/dbYaRvmni7SUicNOVLr/sDEoa4WW/kGNmceJF0Gy7/H8+388zm3q9WRfTIS7zbDzRCIGtGfA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM6PR12MB3849.namprd12.prod.outlook.com (2603:10b6:5:1c7::26)
 by PH7PR12MB7820.namprd12.prod.outlook.com (2603:10b6:510:268::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.29; Sun, 28 Jul
 2024 18:13:10 +0000
Received: from DM6PR12MB3849.namprd12.prod.outlook.com
 ([fe80::c296:774b:a5fc:965e]) by DM6PR12MB3849.namprd12.prod.outlook.com
 ([fe80::c296:774b:a5fc:965e%4]) with mapi id 15.20.7807.026; Sun, 28 Jul 2024
 18:13:10 +0000
Date: Sun, 28 Jul 2024 15:13:08 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: Ben Skeggs <bskeggs@nvidia.com>
Cc: Danilo Krummrich <dakr@kernel.org>, nouveau@lists.freedesktop.org
Subject: Re: [PATCH v2 02/37] drm/nouveau: handle pci/tegra drm_dev_{alloc,
 register} from common code
Message-ID: <20240728181308.GA3043865@nvidia.com>
References: <20240704183721.25778-1-bskeggs@nvidia.com>
 <20240704183721.25778-3-bskeggs@nvidia.com>
 <Zo1UP-aapSyf2Rnj@pollux>
 <e67e0c36-5c21-4f37-b489-78ec45298c4e@nvidia.com>
 <ZppJuiWfgfkEKeCH@pollux>
 <9760d7df-dfbf-478e-9b0e-ddc7768b8de1@nvidia.com>
 <ZqPDkZ2t5MjXX4Sx@cassiopeiae>
 <a6b13446-d903-4a94-9afc-ce04b41d5dbf@nvidia.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a6b13446-d903-4a94-9afc-ce04b41d5dbf@nvidia.com>
X-ClientProxiedBy: MN2PR05CA0054.namprd05.prod.outlook.com
 (2603:10b6:208:236::23) To DM6PR12MB3849.namprd12.prod.outlook.com
 (2603:10b6:5:1c7::26)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR12MB3849:EE_|PH7PR12MB7820:EE_
X-MS-Office365-Filtering-Correlation-Id: 811bb5bb-cc63-43e9-5aa3-08dcaf30efee
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?lnDcRCcuJEp5lG6vHEuXF16ea4WhFzvPZdU+daBtySF6dfrm5Ei4uVYUIX+f?=
 =?us-ascii?Q?UkYNabGACjrLXlxsi9YY0C+p2QWxzyUq+ELxw0gw4O3q0HPQ8BA9gzVg14sG?=
 =?us-ascii?Q?gYPilyTqPMYSngNvmhWR+h6MqDHqZNNep20QY2QR115k8CllJwadm8mg3PH8?=
 =?us-ascii?Q?jaAhquCSdxWX/gpIL/k2xFwDRYkUkGjmeVkwDzBkptGoHD4MGTOdM/o3eEYe?=
 =?us-ascii?Q?k36HYtvsvzhG60G7GVlOV73IrkjL7MEvIN3YxY0mP1uATc5UlVZ4+EwN/24b?=
 =?us-ascii?Q?cfawJ5+Efqk6fH4YTY9OCYRiQHv+cIexBPUatz9xT8PnJJMBVZmlBR4RiiuI?=
 =?us-ascii?Q?2PrbhtP6XpbapYoAm28YJzDPDB8PiwZ075DVpx49JZnFL/GnxG1PoxZ9Rus8?=
 =?us-ascii?Q?d/JufBfvuCN/mmpqyv7ndGYzLaUXK9nx/cQrJi7M702pUMQw6oRPiKf/CKOb?=
 =?us-ascii?Q?wzUP8z63t6H59rftERNjzbt3sAsaSIECoK9NXpSp17Ek4MLU8OO7oTTmJRE0?=
 =?us-ascii?Q?uABQlt5ZEfj4V1/L+CbYAdUXxMzUbxRHR1ZLUnBVwCcuvsL2m8MEZjkEe3RM?=
 =?us-ascii?Q?8pHvotA5iw7sfs65hGBbHCXi4BrCzuzo72W0I4dbPChoAixzTpTMBlGgbdWn?=
 =?us-ascii?Q?D3TeqyF0niRRrPbmRU5O9jCm6a5OcQZSA2N/CaWUV6ejL7SQQKRQf3MDlFSN?=
 =?us-ascii?Q?1btu3hO6bVN5AuZz82lxvVBCNtyGCW5KQ0AqBbIhwf21val9/025VIm6hJ0u?=
 =?us-ascii?Q?Ffhe2CdIQrfONywa90oMAVmFtZMpoyTRq+WVKheEc/cnBtDBrS4aF02rxjcC?=
 =?us-ascii?Q?Sl1pZGWiAzRE9sijlDSzXnApGFwj1QGqjIW/W26q4r7b9ttN9AIO6kliqs5C?=
 =?us-ascii?Q?BQHKjahSoVcooxhYhza1s5pIpcvG1GqbE1bKpz7SXvEt93nH9/ub3v5bRkv0?=
 =?us-ascii?Q?3KHhDMLImv/3gvDZBVSioFbFWho5t2PCSak2UJtq/9tdhRf8CQHB5+VmH/f8?=
 =?us-ascii?Q?3VghfOreJPT8Y4Kn6pRCW/ekS/tDCHAvxBkJao8xDaRkMLAUcVZmUOOR6XCW?=
 =?us-ascii?Q?c+mMyeI3goNupOpGi7GFUhhClQeUssVxkn0yrK2TwHrc1nbwmPMNBB7O0yvB?=
 =?us-ascii?Q?M1vJhWm+UTMlhybrEc5cYSWaSRpih60I9I1uHD8kQfvH80oMwFv4yAg3Q9Wv?=
 =?us-ascii?Q?043tQIttQzuGrueVgMMiypfSRxRpJzYYiyk5XmAid/JZaaCAkJZiEVp1cWHy?=
 =?us-ascii?Q?cPrkC9fCyC8FXF42jmYw8ekqLL9iY3rDkaWHf8iSN7gbX8vMzg0pPHkUloQf?=
 =?us-ascii?Q?RHJAzVoty4u5kd0ogHFuT7x97+FtFOjPKewPxkhzWKdNNQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB3849.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?gDUeR5UD1a7u8Bm9h1DYi3Qat0qmJnplfX6UU6diTDz1bADPgoH1oqz0N+WN?=
 =?us-ascii?Q?o1e4MvSLYzBQfivu/2VMMC4hPQawt6MF4t0k1VW5n/AfQkq6XlmTC5zlYBW5?=
 =?us-ascii?Q?tiu1xjvM+tcsmgjBjkQMfa36A7DPG88au9X1HEQdNQ/klBGGoQjlPvAurXW+?=
 =?us-ascii?Q?kKEUcqCVSRC5AVa1Gi5vFOGrD555dUHni37JlJ5Aondz610mqHOxeVbFWI44?=
 =?us-ascii?Q?lpcLS4ee5rSToGrqaemMxFqz6F5ZC/pRM58JgfTd3cnhZP3EUNgILATFMt2K?=
 =?us-ascii?Q?8lP6W8H9YQQTRA2o6E2xfchvy15zLhkdFRSaslha6UjJf3WfoLWNKIXxcSkM?=
 =?us-ascii?Q?k6f8DxbCp9P7K4Y1GcLFC/6HPrQFlE9sCtBg4+u8935B85sUN1lhFmjLvMQ8?=
 =?us-ascii?Q?0pR5smlPCLI0JeH9hv6g9evltUgwduNL24mWaFlJ6IJdPtjPDIMPddnbs7GS?=
 =?us-ascii?Q?RYq4IoCYwNinsaAshAAGUUkrAVm8+tGbMMhWs7Bb5K8ASP8+sZL66oX3WKFV?=
 =?us-ascii?Q?+AmvypLMxBJIGynWV/flyMwNYMH2DMds+WRVCzsNzvN7ufsxCAh9esdvxy0i?=
 =?us-ascii?Q?xeyVtg4SBW5RC5UWnsYW8jef5wUPggneAcpfWhJgU+0Ox6XVl0dlncEQA/Ri?=
 =?us-ascii?Q?77W+bEwWkQaV+Nu6DLFQG2wzq6B945/esBpw+ObXT6MiZFLksNjMEtdROIQf?=
 =?us-ascii?Q?kaPDdAd4+ODkrsTwOQHhWvB6OGOdQlKzkVxf/rNrODSy+cLTPZ+kimOZrotl?=
 =?us-ascii?Q?a+EFJ0nnKJWI3djXO5bZNBi2jp63ZklrpKyEq7Kv1yPW6yWiBTs3UsC7lLFb?=
 =?us-ascii?Q?9fOXO8Pcc1ZvRF8Su0vZwNtpalNegtvXUlc0fXAmpkVFyBAP3pfiUyfkXv72?=
 =?us-ascii?Q?aWMifTisqituVINr8nEQFLxDFrfS7Aa1AJVJviPfYXVyDujV1FmPXAKB+FvR?=
 =?us-ascii?Q?81sQNIciqai2PbwBQs2Lpqs79CPcNyCuLP0QMWxyDnx62b+A0q0uE25s/FiM?=
 =?us-ascii?Q?FMncHV8NZBPcsW02N311/IZf0G2Bd9JwMNL/3eAfuzEF8e8thgOHinxUyXde?=
 =?us-ascii?Q?UH19LsqVUf8rcy1LdDiCnZSa/Rw+5UAP2RfPgerrz36illFPi03xLNSkBKH/?=
 =?us-ascii?Q?dSculGKtK5PLbBQsS0bHGIFzXat40PegAeAwIF19fe1eqUNrF+BoViJPalkd?=
 =?us-ascii?Q?6544995BkUNoYftWzE5+N3UeIgdT/Bga/K9Mg0tX3mPB/KXNsV7EnKI2BF5a?=
 =?us-ascii?Q?iVs0H8j1F+fID+OsRvDjZf2OVcI8vbabeF8VJSRmXdsfu1/mbHr2SVZEmih9?=
 =?us-ascii?Q?k87NayB9xr0+fSoKRF4XrivymckgV3Lozn5uHNBbtMsUVafK/3SYxMl3fpMQ?=
 =?us-ascii?Q?IcRRQKUWSlWpl/WQm1o1Q3OdT1DBCmJQkcN2neG0xLM8qnHL2VvqtMBbeB0I?=
 =?us-ascii?Q?ruN3u7Aqcd9+xsGCOJRnJuXRnjXpF479WCjSPp/vgqrVjJHLu2VpS7FvDPZ5?=
 =?us-ascii?Q?heiAx+/W3DDK9WYaI2wb9DloJ6e38539BDshtUqWeG6+PDnLQEot4UaEVhPQ?=
 =?us-ascii?Q?3goazYO5iFI0cvO6eaA=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 811bb5bb-cc63-43e9-5aa3-08dcaf30efee
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB3849.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jul 2024 18:13:10.0517 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: d4IH+ZSQ1kkTergVLRkWID7X3oE84lmO5CxF63PCM8yEiNQ5UOFNC7psh4OWn3WK
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7820
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

On Fri, Jul 26, 2024 at 11:07:19PM +1000, Ben Skeggs wrote:

> > Right, I think I took that too literally.
> > 
> > The lifetime of the DRM device (or more precisely one of its references) is
> > bound to the binding between the parent device and its corresponding driver.
> > 
> > But the lifetime of the parent device itself is bound to the DRM device.
> > 
> > So, yes this doesn't work, and proves the point that initializing the DRM device
> > with the parent's parent is just a workaround.
> 
> You're greatly overstating the "complexity" that's added here. It's a minor
> inconvenience that doesn't require much code at all to implement, and is
> essentially irrelevant outside of module load/unload.
> 
> I agree it's not ideal, and userspace should gain auxiliary bus support
> before a new driver implements a similar architecture, but it's really not
> that big a deal.

Ben asked me to share what other places are doing this stuff.

To recap, when converting a legacy driver into an aux split we've
found in several places that there is existing userspace that has
hardwired certain sysfs paths. ie an assumption that an infiniband
device appears under the sys/../pci/ directory.

Argubaly this userspace is not in good shape, but we have to preserve
it.

So the approach is to make the sysfs visible elements tied to the
original sysfs location (ie the pci device) and continue to use aux
otherwise for discovery, probing and tying subsystems together.

Obviously you have to be careful about the difference between the
sysfs parent (for owning a subordinate struct device, sysfs files,
etc) and the probe time parent (for owning devres, and other tasks)

We've been fortunate enough that subsystems so far have had a clean
enough setup that this is easy enough to do. It sounds like DRM is the
same if it just requires calling  a put in .remove() - that is pretty
normal (though most subsystems would call that unregister, not put)

Jason
