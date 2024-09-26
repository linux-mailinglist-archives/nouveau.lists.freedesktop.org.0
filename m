Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D30A9873EB
	for <lists+nouveau@lfdr.de>; Thu, 26 Sep 2024 14:55:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 71CAF10E327;
	Thu, 26 Sep 2024 12:55:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="NDGUq4q5";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2056.outbound.protection.outlook.com [40.107.220.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 75D2410E114
 for <nouveau@lists.freedesktop.org>; Thu, 26 Sep 2024 12:55:35 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=W4AvQZz6FwX5Id1xUUdUsylvgvSqJNhxBGiAPntGslCuTeB32xx7sSQ1QoRWbxbkdATJAV02HqqCaNP1wUCXF9269u1MURIahOcbjVMgXNzxiKiE4BaClcuuDqmyWK7DzrD1GNI2fFtSiINYCRdb3SGyI02k61vsY4BdOLjrupOAT2OfkptkqSUfLMtt38Empc6WZ2c+9JoDkBZTFRjc1h6RHrywMPtiQDudhaYCEsb05uo4iiqtArBlw46gQn0akZzLTCianBz0ttBDrgrVPxcsuX5SnWAzsK96gdsdcHwzbNakjOR/nlWr0CqROd0QKBAgVZuIIJwAZNHClrZ0HA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yO8w0/ZSkeRQuENdrFVRt4+EygjnW02HxcNRDZ3n3iU=;
 b=MCJ0DHyYnvoBinkSergO8QKG3Nc++jw+YXoBnKXbRBV18xt63lsMMiwlfXZkW6Qu7QCD7uu2fYrahgu+HCYWU+zECdYxVmVX/+hb74uoIfUsjhWutmPRn4ibP4INpOy+Gap/zWY+bQHm0feXkkJ5hc5SpBtvykoyxV7Qb1BIcKm0uPgSNJKR8A/nG/YOhb6EhCrSaRaTXRs+csdqiK8UnDRw48AFR0eD9tAAMIoLEFKKTyV07xia2mo5YG27ivcbDJErf3BVElJ3N93D8+S2A4rOUDHf4Ysf1VkKspfBM1d0b1QHIvDjdZvU/YmEln3AjAimG8p/EIvLHVz0SRYNBQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yO8w0/ZSkeRQuENdrFVRt4+EygjnW02HxcNRDZ3n3iU=;
 b=NDGUq4q5brmO1+LgUuaKaD6UAA2ehU1463CLkoynepI8caEg7wFOuKX+70NA+O1zpjulbxnSQQIVgL/c2xilC2BCsEBKzmPpWeYg6aIdV/LfgLn3NK17TiD4J8GnrTb57MEhGhn3R22LH5enEW6iaq9QYzoedfPlSprCdQ7PpqLeoauvoFDTuxNEGT4MlpSAWou707X28wpYZIySyw1YC4KXRP4/3obEoFb3nYVPOL6YcNtOhpKq+acNnPM5ziK1B70uhZ/+FlK0LuHcQy11BO0W1Fe+DS28KOMgTH4Nf4e9Z3f2+bR+MRXrzZiZZy2dkNeS53uncvZyst4vgd+Cjw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH3PR12MB8659.namprd12.prod.outlook.com (2603:10b6:610:17c::13)
 by MN0PR12MB6224.namprd12.prod.outlook.com (2603:10b6:208:3c0::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7982.28; Thu, 26 Sep
 2024 12:55:30 +0000
Received: from CH3PR12MB8659.namprd12.prod.outlook.com
 ([fe80::6eb6:7d37:7b4b:1732]) by CH3PR12MB8659.namprd12.prod.outlook.com
 ([fe80::6eb6:7d37:7b4b:1732%4]) with mapi id 15.20.7982.022; Thu, 26 Sep 2024
 12:55:30 +0000
Date: Thu, 26 Sep 2024 09:55:28 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: "Tian, Kevin" <kevin.tian@intel.com>
Cc: Zhi Wang <zhiw@nvidia.com>, "kvm@vger.kernel.org" <kvm@vger.kernel.org>,
 "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>,
 "alex.williamson@redhat.com" <alex.williamson@redhat.com>,
 "airlied@gmail.com" <airlied@gmail.com>,
 "daniel@ffwll.ch" <daniel@ffwll.ch>, "Currid, Andy" <acurrid@nvidia.com>,
 "cjia@nvidia.com" <cjia@nvidia.com>,
 "smitra@nvidia.com" <smitra@nvidia.com>,
 "ankita@nvidia.com" <ankita@nvidia.com>,
 "aniketa@nvidia.com" <aniketa@nvidia.com>,
 "kwankhede@nvidia.com" <kwankhede@nvidia.com>,
 "targupta@nvidia.com" <targupta@nvidia.com>,
 "zhiwang@kernel.org" <zhiwang@kernel.org>
Subject: Re: [RFC 00/29] Introduce NVIDIA GPU Virtualization (vGPU) Support
Message-ID: <20240926125528.GY9417@nvidia.com>
References: <20240922124951.1946072-1-zhiw@nvidia.com>
 <BN9PR11MB5276CAEC8170719F5BF4EE228C6F2@BN9PR11MB5276.namprd11.prod.outlook.com>
 <20240923150225.GC9417@nvidia.com>
 <BN9PR11MB52768D78EE4017A90E7CAE408C6A2@BN9PR11MB5276.namprd11.prod.outlook.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <BN9PR11MB52768D78EE4017A90E7CAE408C6A2@BN9PR11MB5276.namprd11.prod.outlook.com>
X-ClientProxiedBy: BN9PR03CA0862.namprd03.prod.outlook.com
 (2603:10b6:408:13d::27) To CH3PR12MB8659.namprd12.prod.outlook.com
 (2603:10b6:610:17c::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR12MB8659:EE_|MN0PR12MB6224:EE_
X-MS-Office365-Filtering-Correlation-Id: 2c6e28f5-02bb-4349-3d33-08dcde2a8007
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?qvKtX4mcElbcHK2D62g7CGaqSnm1RGs3nnlmvMFxBVzxdlaK+ca0X8kfEBlp?=
 =?us-ascii?Q?ziH3OuAch8DqhjmwzWWLawnp5Lfng4rjVNze8msJqSI6bHauPinif7PouE3U?=
 =?us-ascii?Q?eKMyWR0hplO2sUTEsMsVMixAH11XILhhlgSQnhOUthONT6e08EuK3OiH7d6a?=
 =?us-ascii?Q?3fyToEu6axp8KMFzPK5NJA7dth8Ff6cvb+GTSaL4v/RDnOvuHxlV88N1gbO7?=
 =?us-ascii?Q?sQygXMmKRcziezavCuThwq/6acixm6rYc8nm9J62K45IQFj49nWWXXbtj5uc?=
 =?us-ascii?Q?MbpZ3NhsMrEBy0vrtzmxB3bQ5gDPz2gcwvRJZrxtA06+3quR+xMTnZYV37FR?=
 =?us-ascii?Q?pKlsdsXUAnlXU1moxD8ULBuFXRZHOFr3+RjAMS1z9nsTvL54TPk9zqAxJUE8?=
 =?us-ascii?Q?EHq5JqB56fC6Rge+LkfldQnXbGbcdGHC7EPp30Rqsbvp9EP2deVCjySEWekG?=
 =?us-ascii?Q?pwjQI9Btyxy+oLQ3aFtaVw5Yl1FGsB0MgDYmDY/cdFm/cPfYAE3rcOFcGzEl?=
 =?us-ascii?Q?MErghdgtutqxGzEbWsDPCKy2+VziMmZGe87IZnikk0idHecgLThThIDp9Jdq?=
 =?us-ascii?Q?AYlJgovvLjDXMQDQQqPLnc7AkZrCNJlz4kll6e+m9eHvpin0sfoLnnZwX4A1?=
 =?us-ascii?Q?C7NPoI5127Ims4PdifT8cc7HOVebzP3T8djuDJUy/aLy/+jDzRi5pG96U7wf?=
 =?us-ascii?Q?/YZ/C+ZDFV/QO3BUMjloUlSOt0trIE0uvmwyJWXXCuPxFyveYPXOfTqotbUX?=
 =?us-ascii?Q?is518Q6g1LYuNySGjS07Po7GPa5PZbFLJ7r3KGhWMp0P4w8LTkys+k3rOngB?=
 =?us-ascii?Q?uyfTNjSVGOPMHjFR/Zf2Uycrgc/iykN1WfXJp4/c9Hno/HQlcDj5t2BPUg7K?=
 =?us-ascii?Q?Qnift9ZG/P2xOedNGSQ6wMqmH7oNvNn8OQu69MBDYEhVFOq8z1Z8DronuBt5?=
 =?us-ascii?Q?T/AvJLnysT0ESbA+cpfRrdqd8jv5V6dMpIZvYn9mqMMOaYLsIcs5TxPGY8Vu?=
 =?us-ascii?Q?6no9JaBP+uV/lmrAesxnpoL/2cpQrrQQfZHBZMvLFQGGgt6oS40UoXeuzjRE?=
 =?us-ascii?Q?CSZz5a+Yy+eX9xDo0b4Xo1Rdsyc7sIuk3lES32dSxSk29bViuVmYjoEtYvZn?=
 =?us-ascii?Q?BqqwtmFsrgNH4zpPLb84q40OtLTi2Xv2H7lPqIxZpTxqLiXHl0BK+IlJMKVs?=
 =?us-ascii?Q?/X8bZTnEPGYqitolAXFtsw6/sFESXc7zxTky4FAB5J8K5wrO2Pi2COh+bAoT?=
 =?us-ascii?Q?M+iFysZVWIy1HILwrfADcd3P/enUhqbINC5NOPSfZw=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR12MB8659.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?h7ZdOzLI7JV6EppvZLFuoRgvq0ut/sgqd5g7aosvoVn1HWuY8bgmWbtInMti?=
 =?us-ascii?Q?fE6Obps8NLEFszCoJ+qq+DN37fNDcqLLapWkJENy5dwJ6pT4D8qhFnUZ+DXP?=
 =?us-ascii?Q?MKeQ4jeciNrx0PrkRLWuURhaHrvlLo5n35ZOxGeNZO7yU+0i+BSWfSJiHPL6?=
 =?us-ascii?Q?DSi9mH7/Lej67KhKES+02eTuDAgjp3G+qsuBNA3egw9pU8Wfmr6LXGEq3pTz?=
 =?us-ascii?Q?vE/uIulrxP3m1Iu/J56A1DWiDszApIuhBYNO9YO7F/l/LyPHBae8E32RuwO+?=
 =?us-ascii?Q?UNIflIrrUXHHJ875jI/Ge9SE0PaBWXKhUkyrt4D1bFzr+CApflb50Ug+O4q/?=
 =?us-ascii?Q?B6vxH0sSOZy3xrTqKF1ZCEz/tgPtsA9GUT+gWymGcswPaViU6qXiQaUP41D9?=
 =?us-ascii?Q?k8Kbw4p/p9jg2+lWBy784NOipdiij5itIVZGal6N5DkwuJND8qBuv4FwNYyk?=
 =?us-ascii?Q?wEOuEVeVyPdC8z7TZfPWkBqHyBuAWMvvVxsDsbkRv3vjqD61QszMtKZsUa6I?=
 =?us-ascii?Q?M19SV7rUaP0DoipF40CiZQY3fh8+tYeEcRl9YKOcE/QVFzqN0UggJIiWQs6P?=
 =?us-ascii?Q?eQBczfSNpwBY39kAw8MVXoIhqd1owDfpBVRZs9bw8glQjJeFcIXPF2HbgBZL?=
 =?us-ascii?Q?HvzjO0Cq9nMjiinCQlqc0NEnp/G84ROVMABYFnULhi9petV+cOVq0QKO257m?=
 =?us-ascii?Q?a4UYQh7RaXH9SMUAniT5qA/LRCf2ez3ok9KG9yvc/tiGl65w57rrpp8nTAn2?=
 =?us-ascii?Q?6pbC0dY4U/48QS/7eNLg5WpvnOmgeiJW+AG9DLytT9d4BA9jzEcEDQjcI0zR?=
 =?us-ascii?Q?GMxwXuxirJSNYckpyE9fTI2XbNS89590PEF+V7F63nL9Hk1DGRyQpUU3WAR6?=
 =?us-ascii?Q?meRedr3InkJ4+gyymMN3zbs4wc7OJeC2wrCM76XgwgqcimWzP1SVUSWsQyHa?=
 =?us-ascii?Q?grSIU+NK9KFTNz2m24hADByydCwLFMlA3MOZ5mfL2nccMjBQY0RNjl3/gPjE?=
 =?us-ascii?Q?aiZm14Na1oMCCngZboO+IjVuXpyun/cKxpxZQxpJ8ojbJv9YVYw78k2nJtC7?=
 =?us-ascii?Q?AAqRIOjF4WNW7X4zaUwenjxzAam/z+yM+QVZJxi9r7mMVzABnCP2+Z4mMRnp?=
 =?us-ascii?Q?W1ZGN89WJ8uTGeVfQvXgaBsA4SkcEf2FAFHj7jqnSVV5+IJ1M85VMKlRYOlS?=
 =?us-ascii?Q?DFX7b/cPVzFWQF8+WYY1sbSBEsuSfDIp9lgEHGTFkVZcSSc635gfAhbR3cND?=
 =?us-ascii?Q?ja03x7GPuHqw45v1VnO6F00z7xAIfeQQj5IMLu4a8LKEBQlB98XslKcqG9DW?=
 =?us-ascii?Q?keYHi1CWNstzQfBbXOrep5Tq6OnD0AYKsXrNL2KYwCjc7vfk+uUY8FSE+NO3?=
 =?us-ascii?Q?CWaY/h9K1dFJesvS/EBmBrIaeLrINCuDyE0cbmYFoDAiLuNNhYb0ymw/xPSP?=
 =?us-ascii?Q?UMu8x0lkwkZujhqAnDhwkdjJWecVdV1QeDMBlIhCYqXS9xOG1/yRMyl2FePD?=
 =?us-ascii?Q?qV7mqDug8qYkGnPOKzonEEOJy91416hDoXZXdB+21UAMQ3Z3tdqPhSO5Fozj?=
 =?us-ascii?Q?raR83sQlRsVWWPu2I4s=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2c6e28f5-02bb-4349-3d33-08dcde2a8007
X-MS-Exchange-CrossTenant-AuthSource: CH3PR12MB8659.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Sep 2024 12:55:29.8975 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UXBzaM68gZaeL7i2CeMC7tJ6vvbtlxJZpJKKzzfXBUDHfrOyJMxG1k7nWUkyZGKW
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB6224
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

On Thu, Sep 26, 2024 at 06:43:44AM +0000, Tian, Kevin wrote:

> Then there comes an open whether VFIO is a right place to host such
> vendor specific provisioning interface. The existing mdev type based
> provisioning mechanism was considered a bad fit already.

> IIRC the previous discussion came to suggest putting the provisioning
> interface in the PF driver. There may be chance to generalize and
> move to VFIO but no idea what it will be until multiple drivers already
> demonstrate their own implementations as the base for discussion.

I am looking at fwctl do to alot of this in the SRIOV world.

You'd provision the VF prior to opening VFIO using the fwctl interface
and the VFIO would perceive a VF that has exactly the required
properties. At least for SRIOV where the VM is talking directly to
device FW, mdev/paravirtualization would be different.

> But now seems you prefer to vendors putting their own provisioning
> interface in VFIO directly?

Maybe not, just that drm isn't the right place either. If the we do
fwctl stuff then the VF provisioning would be done through a fwctl
driver.

I'm not entirely sure yet what this whole 'mgr' component is actually
doing though.

Jason
