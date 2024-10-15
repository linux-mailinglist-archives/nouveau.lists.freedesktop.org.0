Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A434799E9A4
	for <lists+nouveau@lfdr.de>; Tue, 15 Oct 2024 14:23:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B6FC010E574;
	Tue, 15 Oct 2024 12:23:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="KgWv4oaI";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2057.outbound.protection.outlook.com [40.107.244.57])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2CF5310E574
 for <nouveau@lists.freedesktop.org>; Tue, 15 Oct 2024 12:23:46 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZtYgUK2V0nfXI61dG5NeCccdyEnnLw866tLU7Giw5AyhuSebwgyCy3TS2CCQyvS7wZgCWFrLiGPqLB1ZvrR+MqbsjaWIZxiKyhDexYI7jgmFAwKkORXZ1NR9qAZ4nzTVBUZIt7grpjsPd4Y5y44nywTs5ImNXz++mL4YgibqwrJ4rsRAkjYR47rzqGTknA492fYyXg5CZzhUEiv8cQyzzpvUP89BEq3NutdNIpcopvqEdD/oBEWyw0USzgmXMS38pwYvVvYM3OmJSVI4RFMZlbrh0y2kcYjsbMCb1QuKcPoEL+BCDwTIOf3vzjEm+unHmmgTVNB01ebPPOT3C2Dp8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ov1D1XSau6xcMvnD4Ojs/8w5VfP359oRNM8GLVsBkDI=;
 b=qjHGjyXhx3Le1UOpNPb9lMk6MgvuQooa5qsVf325QwwU/QIQ2PpXu/MrgB5q8LsGLGQ3xCu8ADQ9ebaTey7EDqsfs0FgTIMIYiHL9BVr+1adFNny9uqtT4hvRG6fn42N+2HViLSwsMbC2M7zLisZw/jhYruVyQM/y8jIoSR8H+jDboG3RrkiSHq0I/GmZcLu/1+iy/2wW+dV9+13KBPtVbKZT2eBKiEd4jzyat316RMrfRTXX5lDLplrQzwmT1U/h2/WxuNS++sY2k1ZZDSSa6mlsjXC26/fEdCzZ3t2W4yFl+iGdxMJLjwQdC/52jTtz2Wy/FYJ97z4BHzBSACycg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ov1D1XSau6xcMvnD4Ojs/8w5VfP359oRNM8GLVsBkDI=;
 b=KgWv4oaI8/Z947RJMmbQN6vnBf2xnCUQUHeusOi2UNk08IDRaptdQq/plXlzA1Dyt5/gdPBu8MCH8UsuH1gP5i71kTEXmwWxfzDpFVAGJ4s2si2TUAktcVbQQNCpUvq9akF5pQxX0XYreqBRoJX99pZVJzPlSbjOOxXxbJVMJ4A5lMibZ40fcIDQF1I0eDy0Doje583/uClpr+1pQxb0aoSRGyOaZxh7/UppOGNCbUkvv3aZbYg5ak3bgoXD2Nhif2s++LtSzufD1co0FX+Vs9MMgsxu4K0qG69B/WHANA685qm4J3G8ekOO7Za4SMH3+V9GcnEbbtu631o3dRDMbg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH3PR12MB8659.namprd12.prod.outlook.com (2603:10b6:610:17c::13)
 by MW4PR12MB7285.namprd12.prod.outlook.com (2603:10b6:303:22e::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8048.27; Tue, 15 Oct
 2024 12:23:41 +0000
Received: from CH3PR12MB8659.namprd12.prod.outlook.com
 ([fe80::6eb6:7d37:7b4b:1732]) by CH3PR12MB8659.namprd12.prod.outlook.com
 ([fe80::6eb6:7d37:7b4b:1732%4]) with mapi id 15.20.8048.020; Tue, 15 Oct 2024
 12:23:40 +0000
Date: Tue, 15 Oct 2024 09:23:39 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: Zhi Wang <zhiw@nvidia.com>
Cc: "kvm@vger.kernel.org" <kvm@vger.kernel.org>,
 "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>,
 "alex.williamson@redhat.com" <alex.williamson@redhat.com>,
 "kevin.tian@intel.com" <kevin.tian@intel.com>,
 "airlied@gmail.com" <airlied@gmail.com>,
 "daniel@ffwll.ch" <daniel@ffwll.ch>,
 Andy Currid <ACurrid@nvidia.com>, Neo Jia <cjia@nvidia.com>,
 Surath Mitra <smitra@nvidia.com>, Ankit Agrawal <ankita@nvidia.com>,
 Aniket Agashe <aniketa@nvidia.com>, Kirti Wankhede <kwankhede@nvidia.com>,
 "Tarun Gupta (SW-GPU)" <targupta@nvidia.com>,
 "zhiwang@kernel.org" <zhiwang@kernel.org>
Subject: Re: [RFC 06/29] nvkm/vgpu: set RMSetSriovMode when NVIDIA vGPU is
 enabled
Message-ID: <20241015122339.GI3394334@nvidia.com>
References: <20240922124951.1946072-1-zhiw@nvidia.com>
 <20240922124951.1946072-7-zhiw@nvidia.com>
 <20240926225343.GV9417@nvidia.com>
 <bc19bc8f-1692-49f5-9286-d4442714776e@nvidia.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <bc19bc8f-1692-49f5-9286-d4442714776e@nvidia.com>
X-ClientProxiedBy: BL1PR13CA0429.namprd13.prod.outlook.com
 (2603:10b6:208:2c3::14) To CH3PR12MB8659.namprd12.prod.outlook.com
 (2603:10b6:610:17c::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR12MB8659:EE_|MW4PR12MB7285:EE_
X-MS-Office365-Filtering-Correlation-Id: c78b3abd-e074-4bc5-c80c-08dced1433e7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?2HP/Ta3vlYkm2WFJoCjTg/sW+LTCUScJR4c5WsUh7DWxm7i8Y6gmw4w6ISwI?=
 =?us-ascii?Q?gsd1bpEUL2Zv+c0U3PMCXoyGzujZ9d52b1EaVR30NIFwM6RQqlTiRMDnnjzO?=
 =?us-ascii?Q?l6gRvSUQPFmWezty+EQlXiQ2Cy1/QkHIb9MenNPXxyeqO62Cp7xtWAPaw1pW?=
 =?us-ascii?Q?QV9LJVudmhGpD7T1GFNsh2h1q7Spv/bxVLrAYfl6W0qZKu3b9r5fcb0QURuo?=
 =?us-ascii?Q?1mf815Zh9Qdt2bOlaMpCbFaDlmBXLC/Ta8AIbm0eSC7XR76HxPSDhgWOVLW+?=
 =?us-ascii?Q?xBBOdHN2faSUPbhe0UppvNfIkejjT7IaPkon/q8svyIqs/0CNW+MxG2viSWD?=
 =?us-ascii?Q?xEezpqr45XPFEpdOntCFOCMS/IBaKPDyI2u/E3y40UJknX4wMwOhXdNVQx+2?=
 =?us-ascii?Q?N6ip2f7RIWPEGlhIyJP3F50+DE6XPwvfOiGrtK9+HxxgfYc0nmmrko8yUxZB?=
 =?us-ascii?Q?DbyzF4NXlrDjuLdfRor1ppr6iJ/24K2RIXgVsTOKfAAn1ozlbZTTdaoOxMJ0?=
 =?us-ascii?Q?venIgrrSVrd+me+EAOuMpqPok3Tw5TL35FoBRVRNwhkkd7/ZpoVM9gGY4OUm?=
 =?us-ascii?Q?N6hPR41EnMmdVBFvHMJgj1J9QNZwAd/9lgbNw2gEMZGZm2NbMOdvKDBOLQGp?=
 =?us-ascii?Q?XVaYTz5WM/6z1T9v8LtvNG4T2GOJ97Afth7R57s5eU47RianhWmIQASEF4By?=
 =?us-ascii?Q?7+MURn9Vp2M/si83bJ8G/lRQvsyOuNK2DqSP4/eg4qI+WW018H1Nc5M/9GW7?=
 =?us-ascii?Q?3lgwBVnc2Jlkp1XnfkZ1T0WtgtOiDl7LJ9JFj3I6TxdKj46OQ4sH4LQXP2hW?=
 =?us-ascii?Q?bNWV/Qew1NYSLiUeSlO+cDqmiI+CegVo5t5wjEM/BRGiG5zkkK1Pfjv0NZYM?=
 =?us-ascii?Q?6vfe68Kx/IC9zXJvc5NUm69vVKYrYDLgOTJdrYpexOGaigiy6QBqOpKjIP0P?=
 =?us-ascii?Q?sbTfY3Tdi4NA/2Q1ZI4rUnxW9c0tkuR/aTKou579fh07ujien7hLMuVx798X?=
 =?us-ascii?Q?iIGCiyQk6265WwDlHJ1d1GVpng30T83w59EWpJeGDC6PnNKY2f+K+C+pFZ6R?=
 =?us-ascii?Q?myFEhQfJgNLMH5sW7A+RqyB315b/d9JI/WaSEMNFHBQjWYeWvgblxD4Im0s/?=
 =?us-ascii?Q?ZuwAJD9irx6WwZpF4KIXXgi74NCGjF0DV+nrS+t4hELWFyhONxWwJCgR/4Z1?=
 =?us-ascii?Q?es4ptu7UdKsT8zcSuamOuzZpkRy1ueX65EzTiZh7qHlc1vC6KyOEMWKgJ+gv?=
 =?us-ascii?Q?FfbAsNTIRKTbCPn1+xQELh4k4zXKuIqYWEeEKkahIw=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR12MB8659.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?MRFlT0K9r2thUZpmD7R/dROOp2Cgt4yCAOIyz3ztOpdzozSaVN5b5XeTZ3xw?=
 =?us-ascii?Q?WEVDB/kFJ2t/94n0G2AhAnJoZqzceVXFbZKwmHv5jNT68ptZWUgjcaF5Mape?=
 =?us-ascii?Q?5Y0hT2NDyphLRkzwm6hxaVqlczPNywTCX0sI45wMtrnbAkNcroNbIPkZn2Pn?=
 =?us-ascii?Q?2pE0S8sfsjFhkw/mZaHnx4W97ekaFfUFpXvhQDT7Q3Y2v6iDyRHcdCMzvOlZ?=
 =?us-ascii?Q?HOhX2dZPpCgb06WJ8UJZWD/C2E+jrVFr7kU+ydEbr9YfucwQ2g+UAAmf0uHI?=
 =?us-ascii?Q?3rRy/225DSWIFmGYaduQPNAxy+xW3IsjMg0yJP6RgUSA1L72GURRDDZIrRTk?=
 =?us-ascii?Q?JE2aMeEgX0KC88/xDxYp8+abHIsR+eXJKjf4beY5GQ2NP7T/nir2tM7vfDmq?=
 =?us-ascii?Q?iuEwnVxzRX52rH+ikW7Tq2DpY7e+EDuYYSMWl6q52L7dJCecyPKRgU1lryce?=
 =?us-ascii?Q?wfp+9FrnYQ0oN1SqpJPw0tu5PPnExypTFGceWegU2eLq8pUUhZcp1B72MLzH?=
 =?us-ascii?Q?oAAC2jEfjeRXWNKKkGby7I7I7u/QT7ekAABnkWX/bxSbUcuT4wV1iN8yqq4y?=
 =?us-ascii?Q?nXIVxvQb1RCpdblV2DdBndd1KtKgmX4o0HdhAp3Egpov+l6ZORhVGryZI9uA?=
 =?us-ascii?Q?gMM7wycS8tHrWtnCMH6IT4KtfWMuHbzo/OtnKqNdCDDt8hnKZTokO//Y4ZgL?=
 =?us-ascii?Q?my0PoTTmZ9oECqKG/SIahnpilgFDH0L9SaCE50Eew99GC0etmMgRTUQBWTVK?=
 =?us-ascii?Q?F6DoedMLQ92dw0unV4Q3y4cpbvkBogFCEb6xfxtEdPyOOthlkFFnHfpqeJ3/?=
 =?us-ascii?Q?fF6YV/CDcWdoby1o4KH0OGyPT2T2fH9iEHKbPTeVfGYOrhEQLtakX97cHsyn?=
 =?us-ascii?Q?WCK83R6I5MUuyL/O01q3/QRJIfE/dQBTK6u8yBy3/hS5/m9J50q6A5uHVz5c?=
 =?us-ascii?Q?65Z7JJs2ape4NbdsitshJEOGIOgRqC116QokZksjhC/09GOvBKJfhiqORr1m?=
 =?us-ascii?Q?IBXYpjw62BcS2UXk8+AlVjKXhUGMbPNEAZTkz2cauxMBQOR6TaAu1lJ474t5?=
 =?us-ascii?Q?UCJ+Qq37lx41Mii7Z3HsHDsvvn4tlnW32i1hrghROkPPYWUesMtZdp3FloxW?=
 =?us-ascii?Q?ZlORBXNKkICOfPpOLNrmddVX+2OhRupDksVQq5Haqua9QCNYkZHdZcCpDhOL?=
 =?us-ascii?Q?03DwfkN0I0NN3H/rYYpdRq7VAXylszimJc1hlGhNELg0mqVQdZ6Rpb60u2ua?=
 =?us-ascii?Q?X0bEYkTn8dyn4icMz3YOvAfVU8DYN6zl+9G2HoC2X3rvgIr4aHex/H7Cgye9?=
 =?us-ascii?Q?4VQXM0QUScy3B/9UwvsYV6x0P2hC1LE8xjjkYfKsn5FDemOOi7/2NUq5Sxdd?=
 =?us-ascii?Q?Ab/3mZG+sv6Gh+zrIGsTE7qsEQuWoinbryOk3qHmOlXh1okoE9W2KPfWxV1Z?=
 =?us-ascii?Q?nzxa2Um5hGG1H3vuyXkEXFQ1BUNMFvS+klrIoVDi4NKDuBa6SIa/O3u52024?=
 =?us-ascii?Q?KeYP9C2hp5FKoci//2Maua8Xl2jH0ZzBVyiFxIoCivDUHhPAWa9KGW1Dhodu?=
 =?us-ascii?Q?vdoNPs2s1cq4YGEYWnRjK3YSkuUXugxV3oBASroy?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c78b3abd-e074-4bc5-c80c-08dced1433e7
X-MS-Exchange-CrossTenant-AuthSource: CH3PR12MB8659.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Oct 2024 12:23:40.7357 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uisIWZCHn7hHu11elx8AZ8lwh2O22pIMSc7o+svUTjbyTp34LzvumeJ5tZpkmp8j
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB7285
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

On Mon, Oct 14, 2024 at 07:38:03AM +0000, Zhi Wang wrote:
> On 27/09/2024 1.53, Jason Gunthorpe wrote:
> > On Sun, Sep 22, 2024 at 05:49:28AM -0700, Zhi Wang wrote:
> >> The registry object "RMSetSriovMode" is required to be set when vGPU is
> >> enabled.
> >>
> >> Set "RMSetSriovMode" to 1 when nvkm is loading the GSP firmware and
> >> initialize the GSP registry objects, if vGPU is enabled.
> > 
> > Also really weird, this sounds like what the PCI sriov enable is for.
> > 
> 
> As what has been explained in PATCH 4's reply, the concept of vGPU and 
> VF are not identically equal. PCI SRIOV VF is the HW interface of 
> reaching a vGPU and there were generations in which HW didn't have SRIOV 
> VFs and a vGPU is reached via other means.
> 
> The "RMSetSriovMode" here is not equal to PCI SRIOV enable, which 
> activates the VFs and let them present on PCI bus. It is to tell the GSP 
> FW to enable the mode of "vGPUs are reached by VFs".

Which is usless if you don't enable SRIOV, so again, this seems like
it should be dynamic and whatever activated this is doing should be
shifted to sriov enable time and not fw load time.

There is a fundamental issue in Linux with trying to configure drivers
statically when they are probed. We want to avoid that as much as
possible.

If it can't be properly dynamic then the driver needs to take its
configuration from device flash, or you need to build a whole system
to allow configuring and rebooting the device - this is pretty hard.

Jason
