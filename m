Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B011DC11892
	for <lists+nouveau@lfdr.de>; Mon, 27 Oct 2025 22:21:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B412D10E156;
	Mon, 27 Oct 2025 21:21:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="XrhGCqed";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from PH8PR06CU001.outbound.protection.outlook.com
 (mail-westus3azon11012047.outbound.protection.outlook.com [40.107.209.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1270610E156
 for <nouveau@lists.freedesktop.org>; Mon, 27 Oct 2025 21:21:39 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RuczjaGexyBuW373vbQkO9+9gJ291/dSvQeJ+nYErQq41w7M5gBXKrPUFvPN90zwho/D82mSHLykattE8xUmaAhRA29JrBj5eBQsV/SA28MsusYwQu3x0omCHH9LGQJdt4bUFCUf4vLFg1aby2QLzcHWlFY5kPADoK1vg0pwlKDsPgP52HhqMNxtEJZWQVjTislM4ehaLlS+r99wkTySBl/+r09Nkj2A491XId4Moe4EQJ/J9oiy61txSrUo4AaasOdv1u69xQqb+Q+XrLVcjaJ0lIGsjCrki4T2x75vErBBheLHMowQdExpjrbD9H0y8tIK9LjvsECI2N6GQ21C6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7+aMftYLa5WfPYLN83Ny9RbTKHYS1glYOQl7bWX9ExU=;
 b=lNYdqhkGvqwihos6tV6CX9xKDsOqpIl318gCC7BV3IOveFnEyoaGfJxLWujRp/9YPRF40nsMY2GaEhY8uMUFpe2Z4pZ/9kbb0JVaDTmq5AT4Gfe1mQGlCZMIx9CmQgEUo/51tcUnQfw8GUEaMZoEpaEZ/7X7L/NPM4grLnXEmejYFEej42YtueUb1o4c4UyIOwxxI7/66CN88J1aKl57T7OW/RSA26/OmgMiexQVs1GWCX1eWeo1ioKEYAu2NQFnXzBTFIBFkSg6yK7sWvRWir+LivVEdPdNQdi2bQpOgS07VXIyzhjw0R+adn9uBOZwTKO1A0jOyHd4bftRU3adEQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7+aMftYLa5WfPYLN83Ny9RbTKHYS1glYOQl7bWX9ExU=;
 b=XrhGCqedGjnGkT7fcFiZaMQVmgw0zyo5BvaRe3Qx+80Qz6ruAIGfjYB/32n3sZVhm+QMmJzbmCXZMH8oLLcXOpB/Mjp1MiRCem9jZolDmJpj2IrEma5/ntRJFPLu2b14buKs3zHjtuZc7cwuAydqVtvt3sNWIoGYfaNnOEiI9arvb9vUw5EthyP49QxIXHdP7ZiP48ulsXQLUDX+l78GRQhwO3qcZirVNDc2ZTldo78OOO2MRSTnNFaFNBmQBjXBhCOXbp++y8D86WAutE31ln68Nx2XO0hcVmyu9GQMgvCxwcnPGGj+ch7Y9tPn7CvDtF9SGnMT3bKHYF39vr0NtQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SN7PR12MB8059.namprd12.prod.outlook.com (2603:10b6:806:32b::7)
 by DS0PR12MB8480.namprd12.prod.outlook.com (2603:10b6:8:159::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.18; Mon, 27 Oct
 2025 21:21:34 +0000
Received: from SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91]) by SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91%2]) with mapi id 15.20.9228.015; Mon, 27 Oct 2025
 21:21:34 +0000
Date: Mon, 27 Oct 2025 17:21:33 -0400
From: Joel Fernandes <joelagnelf@nvidia.com>
To: John Hubbard <jhubbard@nvidia.com>
Cc: Danilo Krummrich <dakr@kernel.org>,
 Alexandre Courbot <acourbot@nvidia.com>,
 Timur Tabi <ttabi@nvidia.com>, Alistair Popple <apopple@nvidia.com>,
 Edwin Peer <epeer@nvidia.com>, Zhi Wang <zhiw@nvidia.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Bjorn Helgaas <bhelgaas@google.com>, Miguel Ojeda <ojeda@kernel.org>,
 Alex Gaynor <alex.gaynor@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 nouveau@lists.freedesktop.org, rust-for-linux@vger.kernel.org,
 LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 2/2] gpu: nova: add boot42 support for next-gen GPUs
Message-ID: <20251027212133.GA298309@joelbox2>
References: <20251025001459.491983-1-jhubbard@nvidia.com>
 <20251025001459.491983-3-jhubbard@nvidia.com>
 <DDRBEHGSMDFM.X7RQC8XCC7C8@kernel.org>
 <50acc826-dbe7-42bf-9645-ad5aa47a3d17@nvidia.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <50acc826-dbe7-42bf-9645-ad5aa47a3d17@nvidia.com>
X-ClientProxiedBy: MN2PR11CA0007.namprd11.prod.outlook.com
 (2603:10b6:208:23b::12) To SN7PR12MB8059.namprd12.prod.outlook.com
 (2603:10b6:806:32b::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR12MB8059:EE_|DS0PR12MB8480:EE_
X-MS-Office365-Filtering-Correlation-Id: a05ac88b-543e-48aa-8285-08de159ece5c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|7416014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?7Eri5EpXHCKVfWvIO5potjTSbLtSsO5XQbrAAVLUIRTEUtyHn4m5YrDpfG1S?=
 =?us-ascii?Q?tJPi/5lQVRS2E2t4sB8HaDFZfdTLoEMdeK8oZvxn1fKfphabSMcloD0r8Xi9?=
 =?us-ascii?Q?XnvbtTorpv/nj4MeyIVu3R7VlJdz8VgAUKt+nutunVz3eRfbHBcWcbaQCFis?=
 =?us-ascii?Q?ZnIRkYr2duEz+pIGGpNLqaZtJZrkxFT8eCPiXluCEZ1y4uT6fiHfDbQtNPtj?=
 =?us-ascii?Q?rYUIFjSJvkSyJuZFW4IPXrovoKUx2y45QgRosUsaJ29f/udjQXPkf/QhG2je?=
 =?us-ascii?Q?3CQ4UWtA3DAFR/gfa4AvjsX6ncP22c1y5lH0Nwd9XOooq01sOsXL2VIwR4mG?=
 =?us-ascii?Q?DLlKx5Wh0x6pI5zhdDWVe99LCwTnT5uCpACuAKllOFCXpsMSLS/aG5+k9d3v?=
 =?us-ascii?Q?fR82QwnIAswow6LR+MsYsu2OzpjbzxBoTb2iPJg8wg6wacCAD0XeORaXHHKd?=
 =?us-ascii?Q?fZrgu+9wIHmhtpYbpoaCavH0gijMPpGuuc0e6GFCLIgcBBfUAVjGs3xZjRw+?=
 =?us-ascii?Q?tNf7eWj4yu6hAwfs6TdNqcNrgKAnL1yMjxrFtmSg4t0k8jt6uHv9ZsdNWIMw?=
 =?us-ascii?Q?BiZkktLcugOEpBPJpRVHkxG70iSPz6NhUAN5MV+MBFxzRr0ecL18+mlG0BwU?=
 =?us-ascii?Q?3MMU2fTgWlZwYokaZLLeNLxDg6Dzlo6PZQiSXwCJ3ayRAcCUYnRgsyZ5v/c2?=
 =?us-ascii?Q?wpYpor1iT3yXtc7OKTmB02nc8ZXZ95zOoAhLs/Mim4foVLvIaexJmO81Yp0d?=
 =?us-ascii?Q?C0Bex3EiZp/ewfS9cWjkLc1lxdCZSwsIW37ipxu/9e6RD5T7HDxlLBYZl4MN?=
 =?us-ascii?Q?2B1rSB/j2OznMb9tm9JICGLCPilIgwHvjIrbk14mU6mud3io2i6PMDycahaU?=
 =?us-ascii?Q?2WdP0HS8U6WSL51IHRhyvgXyWsz//ZSzDOjhGKUXwvMd8f2ZDek+7LqAllAr?=
 =?us-ascii?Q?vfB1oLtEGD2n6DIwQKeksz7m8QuSc1T/osMlOT39oyD0cxl2zQK8UQ5GbYdm?=
 =?us-ascii?Q?CP6cZT2q15WrB80h9MSy4ha/1cmmdD3sjIlCXE7/hgk7Bhry3gOLNwrEBBlW?=
 =?us-ascii?Q?n38nLYtMUilde64XssW5ZbqN/e//6eIwcgEOwJQxqb7RPPLbpPWMDWKsG0Pt?=
 =?us-ascii?Q?JJshY4GJPVE+zaF+p4mneaR4uH6gK+SatxtVowG3MNEvoAKHFW7x5p7ykISE?=
 =?us-ascii?Q?75WmkMRezk5p8vKTzrl91fnfALZp4VJ13tO1yLTFA+sXmM8FElY2VCfqytRb?=
 =?us-ascii?Q?BwNdzlpoMLCMHTCjbD9coFzfG7LdT/n8DgTn1T2egNSxUAZVDHwstzsQsVc2?=
 =?us-ascii?Q?EFUG2/Mvlua20qo02ZsH7RslfzC9CbdyVKqeNIyWGiMrMZDr60OwY+gKFPaD?=
 =?us-ascii?Q?dqRnAh69ZmujaWjkZegWhktXBqPbB7hjBp+1oWO7iLtPxF+23T3DeMWzYoad?=
 =?us-ascii?Q?rp6MHxy4ce7b6jD5fiqmdyR8F3DrUjcf?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR12MB8059.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(7416014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?3I/eCiURSjxw2jMb1fR2tU3NpQ7Me/413cUplmCpUCkaCzUDM9cz0bLaRItt?=
 =?us-ascii?Q?ZIc+Pl3oFmop+6mu4TrNZz7YFqycIcH4R67MrDiTmzjt1Vu5GQAqH70ALHoH?=
 =?us-ascii?Q?gZ6kTRWm0O/2+7snIK89Kl4I3hthhgAWZlYZKgg8CIGSpZFY+ZRBRJLIJveK?=
 =?us-ascii?Q?aGbwI6Ul5UG42qddf9jLRR5IUAba0NX8m1OcSysKTsvBTfv7SX8uKR2gw2Om?=
 =?us-ascii?Q?tFhPe0Yjc45GOO/zFoA30w/BdVfOWvvkcXq0RzBtpVeUAErRw9nlPzD2OxlJ?=
 =?us-ascii?Q?SSgu5CaHwmSpbMef4y25KBWB2QOmGRt/XOrqYmNpsCPqeQI+jvDBAql0qot4?=
 =?us-ascii?Q?rgiQy4+gjNHU5KJiWEPdaVMbvPXPKfWj9CuBzTxvOp0NPpCe/Xdat9218IS7?=
 =?us-ascii?Q?otIbgr4f9XX5+3TNfTnJ/gYS/tazQkLCyfSMDBB7HfjXUcD4EmBGMLdtGfPq?=
 =?us-ascii?Q?WbjCwSrX20iAN7oa87Nt2F68w1GCpiYvWLWuhTNgkBC4NQcV+YDmzVMfpfKB?=
 =?us-ascii?Q?0/xYiDK3KJhPA5kBgz+HXy3OmzGYGJ7kSDnuHsAAvPxlWq6m1t6nR7aZNl3v?=
 =?us-ascii?Q?8PfgpiliVsGUL2AFIliKm/mQIIekyoudwZr/11Soa0QneqrZ1oFEmtI7wlfL?=
 =?us-ascii?Q?31lJbnViRsKXKjL1XpTt5lxgTpcEcBu+Xv0aX6E6K5uYmRJ6vH2l08EpY7BZ?=
 =?us-ascii?Q?QmFsCThedjocnqYha1AcjEmOYjCmHnTHNxSZyGTaJI2zMut78d4I7QrCJRa4?=
 =?us-ascii?Q?02mhI0hK/pTF2tmeqzVc0uMvn0XrWUWBtpN6/6QEQSC/U/fekOGtYotHtB6o?=
 =?us-ascii?Q?nIbDkzQblX0rlAN0P9Jdm7tv/lS4Ye9L98+omANhmniQ7+St+55i1Bbq5ZPf?=
 =?us-ascii?Q?6ITVQH0KAiIlSJY/oRdzWAWT2lQQNGI64Zuen3zehIPfZeEEC4sdyXbagMHO?=
 =?us-ascii?Q?cDgH/v16IiCB7KuVd1wODnbcsPjCLsXnCAy9Z3SrZREBaquDXrQubJB7pKW7?=
 =?us-ascii?Q?OuBm9OLCB06rRKkLiBKclt0J6p2BZmtDjfOUlin1y6uFp8htJFGQAUhjKrDh?=
 =?us-ascii?Q?t2a5caMmcFn8GxuQ84097u55AUzbm3FtOJfQiZz9wo6RrOJ7/tiE2pT2wMbO?=
 =?us-ascii?Q?IbXeY4lHwQUjVIUjcF7dkocdIozqaXaMyadVuO6No4NMOb7QjUTYeh2TWmIA?=
 =?us-ascii?Q?XJ5Vj6FelejDEQLAXtCpczJchFxoe0Q+xwmOzUgitwKKoDvFFeTvtggWk7lv?=
 =?us-ascii?Q?YEWVNB3dyRs8u87sGXAd7Pnv4jSYhNNJDnshqLY/d7qHsGDtElWTDvRgedPG?=
 =?us-ascii?Q?e4DAN66Gvn972AIPQgKyQAhXazes8d/wNOSHqjNKeBrsdOfmOac1qw+dQSif?=
 =?us-ascii?Q?COoD0xPu5kpol9bZN3zDaSiffVCOFxCaBf7Z9TneYysvs2KuuSe0fJ5i/BOS?=
 =?us-ascii?Q?O6dO0oxp702vtk2OWnV7QtJZgjwfOQYRFdczsHGAKBUp3Muh5dMSReM+MP+g?=
 =?us-ascii?Q?Gr4Yqk7XGqiLiIJlNlucd4B0Ysg5NJmwaS3pFr4W0sParfMfRtqsh/9TCJ+X?=
 =?us-ascii?Q?Cryv/kyxtrKYIEBCmSUl90XnV7fwrkSbpHB7U8VH?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a05ac88b-543e-48aa-8285-08de159ece5c
X-MS-Exchange-CrossTenant-AuthSource: SN7PR12MB8059.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Oct 2025 21:21:34.6301 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0PQYqiJQrbN229u/cl7yNN7FCokrBSNmFfS4SO2kvmOrIwOY0MD+d1p6ldEenXqBmMEl9DLsTbSVM3EYJH4jsg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB8480
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

On Sat, Oct 25, 2025 at 10:32:35AM -0700, John Hubbard wrote:
> On 10/25/25 3:01 AM, Danilo Krummrich wrote:
> > On Sat Oct 25, 2025 at 2:14 AM CEST, John Hubbard wrote:
> ...> Why open code all of the above in the struct Gpu constructor? This
> could all
> > happen within Spec::new().
> > 
> 
> OK, yes, that does help avoid cluttering up Gpu::new().

+1.
Also, it bloats up the dev_info! print in Gpu::new() to those.
Spec can encapsulate the boot0 vs boot42 code, and any further changes.

But otherwise, the boot0 vs boot42 code in the patchset look good to me.

thanks,

 - Joel

