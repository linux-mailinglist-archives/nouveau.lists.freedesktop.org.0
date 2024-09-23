Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D62D797ED88
	for <lists+nouveau@lfdr.de>; Mon, 23 Sep 2024 17:01:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D5EDD10E269;
	Mon, 23 Sep 2024 15:01:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="f0dlcV/0";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam04on2061.outbound.protection.outlook.com [40.107.101.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 60F4410E269
 for <nouveau@lists.freedesktop.org>; Mon, 23 Sep 2024 15:01:46 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=X2ILA5nJDeqOPMrfMjToePX3GMrTZ2A1zdI2pnSg6u6vBP+FddT4z/Tw2fe3DECj+dBls1IZz+q1Z7/VrU2f2zm5P3rwkpR5E7owrGllaOCwRH2ZJenqej5Qt9RR+SgnBrTSIsHYpZ7sEHU9282kUAJPaSJFGg8cD1bPna8uNSXuJNYIxlkCelMGqQjNekQMvFOe6oOzVdWRl4rulzDNZ8qQ52J4iA/384JRK3ZHl73X6nHS9tCp5rLy9/JCC1jYpXKnkT3z4JOLFlLnsNl7AP3R4hwspjyTduihtTzx3J1F01OIpf/SyBXuGMbf6lEkiu5j7RQVF0OZieZe/qyRYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=piPxW6lZUqN2q4P9/dxbABJKjTNAmI5xHoRkI6x8/1M=;
 b=kFYMQkKPM4+vmw4D/lpTLUtO4TQngbPpOPMVDJV+ikw4bIqrYiS99mu2vRUfqg7BzrP5LUjvCW5NMwnJ3vswXx8Rq0DQrn/T9Gat+9+NyeOO/6SX3e0j6dyneuDPZpwqiNDOf1Cdy+ftS0l7hhFH/6/TGYCeXOHrupdr5E3frDgRZ3+MoWewIlnvUhywyM0+e5BBdYGw/CUjJz2gEki0bgxS1XAkPVCNpoCt7z5Ab2j5qkcq3lWqAcqQ1H84r/pcXvdz4Vd5mo2MTnxnfdRYUkz6SdPRIjXl0ODu1XUpXKN2LWqKPgVNKN9GE6yCmj70dGKKv73pKgQQ36KosYLxvw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=piPxW6lZUqN2q4P9/dxbABJKjTNAmI5xHoRkI6x8/1M=;
 b=f0dlcV/0GY3CxEdVcxmIfdj+z9+aHrSJ0PpB4/bC6SxHYyJR7lubjjTxcQvwasOjBVGaknEWUyldYHD5b5piFXrOh36fn0yPqocejBvrVhVrskzTEQ2BqK0XGN8lwgYmsdOtuI+Azolgj9LuSNk5WPv4dMSetnn5f6qQPbjDBAz5tsD9Y0gmeLnyOLU/4vdizhU2NrrtnfBkArpTQ6+f6lCrJs0oHOGtRXOeYrysKpAG+hrvYd7+AQWZBhVhWsZFZF7eEjssyRAUpWi0Egz3lCgb+v4QtT+6nW+HJ9k+SVDb3+E8Mlf6WP7IWobSaHr5EniyEMJxLlL7GveZlwOiFg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH3PR12MB8659.namprd12.prod.outlook.com (2603:10b6:610:17c::13)
 by SJ2PR12MB8720.namprd12.prod.outlook.com (2603:10b6:a03:539::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7982.25; Mon, 23 Sep
 2024 15:01:41 +0000
Received: from CH3PR12MB8659.namprd12.prod.outlook.com
 ([fe80::6eb6:7d37:7b4b:1732]) by CH3PR12MB8659.namprd12.prod.outlook.com
 ([fe80::6eb6:7d37:7b4b:1732%4]) with mapi id 15.20.7982.022; Mon, 23 Sep 2024
 15:01:41 +0000
Date: Mon, 23 Sep 2024 12:01:40 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: Danilo Krummrich <dakr@kernel.org>
Cc: Zhi Wang <zhiw@nvidia.com>, kvm@vger.kernel.org,
 nouveau@lists.freedesktop.org, alex.williamson@redhat.com,
 kevin.tian@intel.com, airlied@gmail.com, daniel@ffwll.ch,
 acurrid@nvidia.com, cjia@nvidia.com, smitra@nvidia.com,
 ankita@nvidia.com, aniketa@nvidia.com, kwankhede@nvidia.com,
 targupta@nvidia.com, zhiwang@kernel.org
Subject: Re: [RFC 00/29] Introduce NVIDIA GPU Virtualization (vGPU) Support
Message-ID: <20240923150140.GB9417@nvidia.com>
References: <20240922124951.1946072-1-zhiw@nvidia.com>
 <ZvErg51xH32b8iW6@pollux>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZvErg51xH32b8iW6@pollux>
X-ClientProxiedBy: BN0PR10CA0020.namprd10.prod.outlook.com
 (2603:10b6:408:143::11) To CH3PR12MB8659.namprd12.prod.outlook.com
 (2603:10b6:610:17c::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR12MB8659:EE_|SJ2PR12MB8720:EE_
X-MS-Office365-Filtering-Correlation-Id: 2ad14647-8e4a-4f44-6955-08dcdbe0a1cb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?JTcn4otvl7WGzLuQ2IqZ6Bu5fFRVdxi0947AWilBDx/OaZEGdsPs0g6CEcPM?=
 =?us-ascii?Q?rlDAWqJkROqp1ApdZcV1CG2EcLKLx9eJLCH7HSHM+GVMVzTggTc63wktRbGK?=
 =?us-ascii?Q?MmQ2weXvWUULYRe140nt4rq6PI8P5eP/Ydu4DS8lWUC3qVoQ7ICG6LNAZx56?=
 =?us-ascii?Q?JBsUmynrPDPtmw3wNvo2jRwmmOT6jmALB36jskNHtyxhBYYAnbiPKUzCSFqW?=
 =?us-ascii?Q?dLxX88FazyqFoWe8PrezK/gav4KoH26WtfdrZfWKjVFyHf+TWpeidKYz/dx8?=
 =?us-ascii?Q?FCczLtoaVeiTwQvMBzIQa3Ezwp4Sj1d4AhrhrCOfw6fF0T5RPfkJGWHS1e7q?=
 =?us-ascii?Q?imrQH72PgUZBF+rHz+tpPSvh0L+Uy/RTqk7OVjBEY+UlbYus7rj/B5hQhykG?=
 =?us-ascii?Q?tgT7Ju8N2G1MomrjxaAMjxI1FjsGm4iOORD8dA+2IAg0wQO2WabyAZ+OytiN?=
 =?us-ascii?Q?EOYazai+3hOYoq6BRzm7L8n63e1M/cu6/IC49nYeqQ/G2v+wwOv/VqKf7gyV?=
 =?us-ascii?Q?iQXXDOs3B5iayULiGy5wRRUk+d/iiT2tH8PjaUs20wtjAZqiECOnoDeqkM3I?=
 =?us-ascii?Q?l86N3XSCheYeH8MpY1/47CJ02gdg+sR2IWgoChGraem+7bYinvi99cRJNb59?=
 =?us-ascii?Q?3nbwwZgVh0vdSVfdHMUh9yJ8tZSu1TNFaavN4daH8iYnZUraEqxw3ff/t8Ks?=
 =?us-ascii?Q?a8kHdJ+ALqmk5YpQJYlp1PoqwpAs5VU4bFJ2lqocxwiOlMzrlHnu8YqpKSRg?=
 =?us-ascii?Q?ipI6LjrccH31X6imUOnE8J6D/7g96fJO/84gla4+ChGTPwzXMOzJhKdtg+U9?=
 =?us-ascii?Q?56xvc0viKiQI2TLlJ9vUtEUP5gaXT+1hqWvmp6abEB+/xTTOzRELna9Ooju9?=
 =?us-ascii?Q?UUEqH95T6McpABuSdj19jEQ3R+bHuiiEbA87rSseNYslnC5rzMefshl9y9UP?=
 =?us-ascii?Q?IpJut49qnQfNqGaibALjPj9geScEK/IDudgRNvFxuvaVT4x5Twd227tRlRY7?=
 =?us-ascii?Q?aOFFpZ4+qtg+FqLaCO+0/qMkcAqliYc9p723y4ysnj0dR/5fYYalroZJuQNb?=
 =?us-ascii?Q?CIWr0SQ1Ghn+X5gpFkLM57MNSQC6I/fT01rrc3wYBnCiWmrhcSVhsx2b6jf5?=
 =?us-ascii?Q?3dJhyDh0v6XsskUyQvVqlHfQhLa/r9sFGKh7BniDVMYT7m+hph5Zv47uK8dZ?=
 =?us-ascii?Q?Zmn6OiHp3O1jQ+TZlyR6lvifszWvVfuuPr/SsnEGIioZAu6NEca/HIe/+CMn?=
 =?us-ascii?Q?iLzm8BhhD0C2MJJpZzDLOi/aoJo/a90EBu8LSlf7ZVbPxpIk/UgvoJcFdQkF?=
 =?us-ascii?Q?cgLIpJNOa0dk6yVoqW5mualjkE5ekpuq1t/+ENUTypbxqQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR12MB8659.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?dvr6sx+pWm1bT9ReBbuqiVevKP9Yqbng36FDVi5dy/r7RyxNwLlfHIodIit9?=
 =?us-ascii?Q?vGfZ4IG5DPiRJGYPgJWWBCtNzQK9eVk41eiRrrX+FtQ3Y+LaO2AjmeqDCrW3?=
 =?us-ascii?Q?rE0by4b2ER9itJc6ruSV1jlwZjJzwXRaB0LucMrnWA3znkaVFRlIRYbQjO6a?=
 =?us-ascii?Q?qoy47Be9G9xUfMcT3JkInWCYHGO1WXzPnWJoXDdtjX8Km3bydeTfVjfT953t?=
 =?us-ascii?Q?3X2ECz8oSctPwRQkMAkiOg4mJqjQ9C4L6Tw9N2P+2KWkT3ypYyQp3tYjlUEK?=
 =?us-ascii?Q?BvS85oq9IGDk8oo+PFBZxLTJrdyencz4bk14/v0nD7T6TG4Gkffz2zF7xQnk?=
 =?us-ascii?Q?NF3pNEDVkKWO6vSRJ+8v1NdWFEZuvPq1HBjNBbNd3x5AH9aneRw0Xeg1Za7N?=
 =?us-ascii?Q?O1/nIcPscq6bOyMUfLEFy1AiZh2Redcu/g5Ol+yfcyTstV9vLKk8bXng+eFu?=
 =?us-ascii?Q?DLSdF/a6zQeXJygFXud82Mvcvot/sZmCgz2kpcTN/STdt7PxH+AgqVuZuG46?=
 =?us-ascii?Q?dymJvFHB0xPS80lMAG7KOPluHqsZxgk6uDmE6NCpXFr6sZinYSgkhe7zMw7k?=
 =?us-ascii?Q?O9prKZPcOAlrfGKvftDLLHtp+PtL+J0tllYPYt/ZHkTieurtyuI7UZOneDDc?=
 =?us-ascii?Q?02fYeNYlQwXsomQES728diB00XL4RaLNx9NF6hxrzHsUpM9CDXiYNwtgbYAz?=
 =?us-ascii?Q?ebw309oOjgvXDsY++Wt3xTG8YDGW0xtPMdZgddJcJDSkEa4T/tFGPWcG87yL?=
 =?us-ascii?Q?9QR1ZjAZEkuvvlp7mcoaZ2jPDrXjidmRN/7KfwGFlER7W4hJSVEkbiihMV+J?=
 =?us-ascii?Q?Jn4IgwJznXypASEbrFtmMeUTrt8uaIi30mXPt7DL2SCpmUAbAWzK+Q755+Sj?=
 =?us-ascii?Q?aTk+iAIEHNwekkaGzpfSU3GPDvL70qvHj2gCyIppRkOUTOxpmWz8tHXBnmKV?=
 =?us-ascii?Q?hQkFzHsF1aCuEgRfr++Ff/M/tOgPUArQd4+aaUHGM8/dBClJ92Zz9OanQ7gl?=
 =?us-ascii?Q?y/YGCrhDdFM7vf72X+Tgpd30jLDnvtjP0MDNFnOBzw5qywdo0IqueApAlWfp?=
 =?us-ascii?Q?gbj3zcOlYlISBVoctizmE9sgppOHhrBgVFAyKXALC+kkuTo2c8fmiS5Ozf5P?=
 =?us-ascii?Q?0uVYNY/aPjwL+lW770ChJfOsl22Zj2k5pCmxfU9h/+v1cPD7+Wtg/5hQAdaJ?=
 =?us-ascii?Q?jpfm190CXAmNcisIo3YCNloOrvLmBgNzcim2oo+8zqsWYjzvLgUKP9W28KTU?=
 =?us-ascii?Q?heDcloLzuR7rB2s6BAp+0ayUCHPQgKbPc0WyYkQ9mrHgs2bLu0cnRtB16Itx?=
 =?us-ascii?Q?6Fz4v/AbEiMN6JrTk4/0jMwC83W4o2R0/V1DVioD2g/m+VV12tsBK60mN+Ir?=
 =?us-ascii?Q?ct1zL80nelaYH0BgUmCzZ06+BGBw0pCKziCq7z56JlBIwb6d/9b0DtEGr8Mq?=
 =?us-ascii?Q?7BbHxl9nN5jbCI5iYqNBG1crY2mQLIPCZVuD7Fwy2s8QPrpKWsuKjBH7CbDg?=
 =?us-ascii?Q?cQqeoPEsRMuT4OIThJ24Ee8c5RdTjdosiYU1OiYIOWqh/7R9ByjOnZC+kpgF?=
 =?us-ascii?Q?YG4bB/LklQPG/2fo2nU=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2ad14647-8e4a-4f44-6955-08dcdbe0a1cb
X-MS-Exchange-CrossTenant-AuthSource: CH3PR12MB8659.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Sep 2024 15:01:41.5337 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Y9Z6CHg5YYW3k+zSCaq14odHccjg45/vig0orHW5h6NVfB9XPsbCxm50AD88TOCt
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB8720
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

On Mon, Sep 23, 2024 at 10:49:07AM +0200, Danilo Krummrich wrote:
> > 2. Proposal for upstream
> > ========================
> 
> What is the strategy in the mid / long term with this?
> 
> As you know, we're trying to move to Nova and the blockers with the device /
> driver infrastructure have been resolved and we're able to move forward. Besides
> that, Dave made great progress on the firmware abstraction side of things.
> 
> Is this more of a proof of concept? Do you plan to work on Nova in general and
> vGPU support for Nova?

This is intended to be a real product that customers would use, it is
not a proof of concept. There is alot of demand for this kind of
simplified virtualization infrastructure in the host side. The series
here is the first attempt at making thin host infrastructure and
Zhi/etc are doing it with an upstream-first approach.

From the VFIO side I would like to see something like this merged in
nearish future as it would bring a previously out of tree approach to
be fully intree using our modern infrastructure. This is a big win for
the VFIO world.

As a commercial product this will be backported extensively to many
old kernels and that is harder/impossible if it isn't exclusively in
C. So, I think nova needs to co-exist in some way.

Jason
