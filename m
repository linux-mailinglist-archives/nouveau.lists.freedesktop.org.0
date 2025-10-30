Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 83820C1E6C9
	for <lists+nouveau@lfdr.de>; Thu, 30 Oct 2025 06:31:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3BC4410E893;
	Thu, 30 Oct 2025 05:31:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="gMPIlBFV";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from SJ2PR03CU001.outbound.protection.outlook.com
 (mail-westusazon11012022.outbound.protection.outlook.com [52.101.43.22])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D6BD810E248
 for <nouveau@lists.freedesktop.org>; Thu, 30 Oct 2025 05:31:44 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=O/ZrvU8w3hGj7rMxKAgXirzjxlU2TJ/4aEuy7h5nL50H57/7zcQ6sPw8HEqGQRMooTrTrRT2YKqeYO4KG6GLiNwYUYpOG3voJEZDoquH5833Kf4ikqpZDQfnh8DanHQ9DCgxTSRJ/6awLBVN7gVqKDshx8y8kGcmyJxVd+Yg5IRgdtd42ZDjBMRqnXIBhhY4XQpXtsLziohOLcDivJ1mneIViNCwtut5KN1wGVVw5RAoHutZWaxpeIgFRHGpJxjZmO4pOZb35Pdi4zvdA62VfM4ZnUvjBgR2mM1WzPY6DIZGAenIRkrmsMz32pCTzg7PfEEbtvhr8lCPgzgNQ2dfsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+pYeeXZB1s/mwwa4BkQXFzFoBvULZgZzRNFLo853C4w=;
 b=qtl7nyHDg/ZGZF+AxjYaQQDNrDGnIIIGR3hpfHBz86QA+Z0rHufacYmGpPeXeKzG01UaKQ+BSBspfEm2hTN3FIaN5pPPxAfF/1yxwQaUbec7dDWiGXB28Q2LbyOLhor0wnjz8IzcZqq8QFifpRg3p+cKCV+S8XDRvZceqE0pVC3Nea5oNGe7mgGLl9h407kLGdaffygt86WTvbYd0YCAvDmbBZ5373xayEvkARM/zqtsq3dbKjvfck6Phh+Oolg+yvZNd4m9jTeLS3LrlnV4lkkXiBndyFIq44NiHjMtGn8ueamYy+U3inH2pVwlampjwfsJfSfhO4KDBmso1rDb0Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+pYeeXZB1s/mwwa4BkQXFzFoBvULZgZzRNFLo853C4w=;
 b=gMPIlBFV1LveNurZiY5ZZZxKMd1UqgVONt05UPgQyxFy9qfuPXEsr8Z2E1A+RCI55BEqPuJnSFNu9h9YoU887AqCB6Uu+oT1E1Kn1tah2BLUmMhYahXtY+vhsEdnQYebHx0K91e9cyRxr6SW0X2UZqd6WwIhqvWFAZlkIegGgfEq1vwJeOjyj4hkHTQjt0I2P14CAthyQRnyDTuH5f7UQqvVqizrdoECi/dWFqEbCiMTCKn3TQOfUO27zbzlRx1F4euyK6chUmrvw6SDWJiLTcUbix0OilNrOlbaA7NR+rlOUhkjClNZTTt+SlBuu4iJOl1+kDnulyYYxltxxpGMtg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from BY5PR12MB4116.namprd12.prod.outlook.com (2603:10b6:a03:210::13)
 by IA1PR12MB8334.namprd12.prod.outlook.com (2603:10b6:208:3ff::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.14; Thu, 30 Oct
 2025 05:31:41 +0000
Received: from BY5PR12MB4116.namprd12.prod.outlook.com
 ([fe80::81b6:1af8:921b:3fb4]) by BY5PR12MB4116.namprd12.prod.outlook.com
 ([fe80::81b6:1af8:921b:3fb4%4]) with mapi id 15.20.9275.013; Thu, 30 Oct 2025
 05:31:41 +0000
Message-ID: <a1622011-6c86-4052-a808-31553e0b4916@nvidia.com>
Date: Wed, 29 Oct 2025 22:30:57 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/2] gpu: nova-core: add boot42 support for next-gen
 GPUs
To: Timur Tabi <ttabi@nvidia.com>, "dakr@kernel.org" <dakr@kernel.org>
Cc: "lossin@kernel.org" <lossin@kernel.org>,
 "a.hindborg@kernel.org" <a.hindborg@kernel.org>,
 "boqun.feng@gmail.com" <boqun.feng@gmail.com>, Zhi Wang <zhiw@nvidia.com>,
 "simona@ffwll.ch" <simona@ffwll.ch>, "tmgross@umich.edu"
 <tmgross@umich.edu>, "alex.gaynor@gmail.com" <alex.gaynor@gmail.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "ojeda@kernel.org" <ojeda@kernel.org>,
 "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>,
 "rust-for-linux@vger.kernel.org" <rust-for-linux@vger.kernel.org>,
 "bjorn3_gh@protonmail.com" <bjorn3_gh@protonmail.com>,
 Edwin Peer <epeer@nvidia.com>, "airlied@gmail.com" <airlied@gmail.com>,
 "aliceryhl@google.com" <aliceryhl@google.com>,
 "bhelgaas@google.com" <bhelgaas@google.com>,
 Joel Fernandes <joelagnelf@nvidia.com>,
 Alexandre Courbot <acourbot@nvidia.com>, "gary@garyguo.net"
 <gary@garyguo.net>, Alistair Popple <apopple@nvidia.com>
References: <20251029030332.514358-1-jhubbard@nvidia.com>
 <20251029030332.514358-3-jhubbard@nvidia.com>
 <DDURPPIWWIA7.27RFSM7KRLN7I@kernel.org>
 <a24876cd-1a41-488f-968f-38d2ebebdd39@nvidia.com>
 <72be0fbab026191152154b1f04a45b32dfeb402d.camel@nvidia.com>
 <b9686644-e2dd-4abf-9dd7-fc12081f400f@nvidia.com>
 <479ae6b7fb05376d21bdfe1fcde9e3705c11ecc4.camel@nvidia.com>
 <b8796ee0-05fc-48e1-a075-2bad99b938d2@nvidia.com>
 <35c2d37d02409be8fea5acd713832da938966c43.camel@nvidia.com>
Content-Language: en-US
From: John Hubbard <jhubbard@nvidia.com>
In-Reply-To: <35c2d37d02409be8fea5acd713832da938966c43.camel@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR03CA0013.namprd03.prod.outlook.com
 (2603:10b6:a03:33a::18) To BY5PR12MB4116.namprd12.prod.outlook.com
 (2603:10b6:a03:210::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY5PR12MB4116:EE_|IA1PR12MB8334:EE_
X-MS-Office365-Filtering-Correlation-Id: 5b2955ff-2dfe-4f7d-a008-08de17759ab8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|10070799003|7416014|376014|366016|1800799024; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?VXJPalFvY2JoeTg3ZlZObzJmOEZvYlI3M1BvN0JGbFpBVHFqT1NHMG9JMCtM?=
 =?utf-8?B?c3AzN3dJZU9wcC9nTm91MGVIM3VjbVJpYUlwd0MvSmFJRmZ3Q1lhZi9MOG5y?=
 =?utf-8?B?alg0VHQzVFdMUHpKRWZISmRjdGNpeGttT0tERWN3MmFPNjUwTk44WkNGcmxv?=
 =?utf-8?B?SGtkR25HODkramppRDJHM3V1djNhenJSTDFUWnpYUStMUzdVRkdadmZBWS9G?=
 =?utf-8?B?VktIeE51ZzhEOXc1bk9TNkNFZnV1TDJoUmI2TnNSWTNyc0JWYWF0THpaUHo4?=
 =?utf-8?B?cSs1UFNZVTdxRjYyVHVEN2tCWjg0SkRxTnpzSDVhVk11TVYrc2xSd2VDRUVr?=
 =?utf-8?B?cVdCQWhYVTJkU1lHUERQOG42ekhrdko1UGxDbjZ0cms3V0JqTFkzUVhOM3Az?=
 =?utf-8?B?OGxmeTJKMmg5QVdaTnExL2Z6TUI0RCswTlpQQ2pWZzI1c1JaRXpENEpaeU83?=
 =?utf-8?B?OHZpSGhrWkNJcjBuQmMvcmVtZVVQZW1mY0ZoL3h4RW1OSi81T3RRMGx6dTR2?=
 =?utf-8?B?MjRCeEgxRE1abXJSN29Fb09CU1E5TW1ZcG1FSEV3SFlBcGNmYWJPQTltK2xL?=
 =?utf-8?B?ZUZ1RElWS2F4OG96OWNXbW1aWThnT2VOanFvcnFzRXY1UzZyUmhlcVZoTVVp?=
 =?utf-8?B?eHAvMnM2U01VYURJMmkrM1A3UXc1cWdBS2RBZktWQkVXeWNCV3pZZ1NDb0p2?=
 =?utf-8?B?ZXVmRTBhcU1ZYlZNS1d5SEUzWS9ITzRqWEg3dEVPdHR3QjhpcUlqS1hTZ3ph?=
 =?utf-8?B?Z1ZWT0g4LzBTcTdJemZrZnZUZ2NhdFdPWkRnbWNvTUR6d081U2NsZmhFRi9O?=
 =?utf-8?B?SjM1QWJmM2g4WDdpcm1UelRCWEk4RHBQZjBIZXVORkhoeDl6TU9lbzRkSGdK?=
 =?utf-8?B?S1FQeGJaRVJMajl6Mk0vOFlOUGtGNi9Wb1RhRUVCeDNpcDFEM0J5Y2pSWTFY?=
 =?utf-8?B?b2FrR2t1Y3BDclF5cFRNRWprRWx3Tnp5S2cwa3ZUOHVodnZhNURjTm9xME90?=
 =?utf-8?B?QTRrd2ZXV1VTdWkwR0xWa2ROR1VhMk81UUQ1WDkyb3FkYStqUldqQ2EwWGhs?=
 =?utf-8?B?V3pXOHZZaWxKOVRkT1A3ZFd1MmJoUG9RYk10VHJyS05YVkNTUXNDNFlsQjg4?=
 =?utf-8?B?Zk0zdGt2QjFabVJ6V29qV015Nmt2Mjd1dTVlQnRFTHlxM1dIclRKUVBhMmdi?=
 =?utf-8?B?eStLQ2RobmpNRFJjcnR3SW0zUHNpcXFocHdRTXZrZE9nemVFZGJ6bWZ0WHpR?=
 =?utf-8?B?em5wOThOT1JmRnFLQmhXTFNuT2o3ck1LMFpDdy9yZ01tYm5lbnRHM25zRE4v?=
 =?utf-8?B?dHZuaFl2V0h5ckFXU3ZUUlF2UlkzNFZkeTgwSG5OTFl6c1h0eG5PdnRMdFlK?=
 =?utf-8?B?RkJNb3paZVBXY2lxZ2pYSXdBcGZRTVZWaVB4V3Irbk00ZVpWaUNzdkRFVEc0?=
 =?utf-8?B?ZWZuUEpUelE1NWJCSlZTeDAvbE95NFRzS05MSmRReEpHQk1QWTVLS204Z0tI?=
 =?utf-8?B?NjlUcGt5MG5PNHlET2I1em02Q2xSSGUxMlU3Y0IyZytzUHpUU0NBQjRwaXpm?=
 =?utf-8?B?eUMwb1ZsSVM1QitxLyt5ajN2M2Vwc0hweGd5b1NwaW1iQUc4QjAvSGNuTTA5?=
 =?utf-8?B?cU9wYVdVQWhWYW1kS285c0xDWHFOelFYWkZmSzVDRm5TY3dvZnhRdzIzRTRJ?=
 =?utf-8?B?eWI0a1Q3SVRmblgwQVNwemlheXEvY1FCbnBiZ2ZkSk1ySkx4MmZ4VGVncVUx?=
 =?utf-8?B?TWhqNXZNWHJ1YWg0VGpDZW4vWFlkRWp6enRMbTRGcmFKU0t6UkNDaXg1V2Zk?=
 =?utf-8?B?clZ5Z0poZEJocTd4bTVVWHJLU3JFN0EvTXU0ZGhrdGxhZDR4QzNYajcwTFdu?=
 =?utf-8?B?Vk9MVEY3SEMxTFBVSjlKQnJlSUFYNXZVNTZxbjZ0Mk5qWVJQWmlkazdvSnhS?=
 =?utf-8?Q?XQzjPC7Md15pOlJ0BaIbI/+hkGWBX2jI?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR12MB4116.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(10070799003)(7416014)(376014)(366016)(1800799024); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?emdnUitGK0FCbTc4OEZqMlVGV1BPd1hEZ1J2MkNNZmJFQzlSZ01vT1NmU3k5?=
 =?utf-8?B?c3pzc0ZMOThySDBYZDFmV1U2TWZ0VVdYQlllVWpZLzZEdEFVbFN0c2dnVG1l?=
 =?utf-8?B?YTVPenJqTHEwK09ZRVJ4a0lvaTd3TUdNNVlacVRGTksyRWdyeGlIdjcwWllH?=
 =?utf-8?B?ejI3clNKMGlEcjUzR2VoSTVjU1hheFNBWkFoL3BBRXg0VGJTbVJmRXVFZENo?=
 =?utf-8?B?ajZUenJRQW05c3VyNG1RbzUwTitkNU5EdmpNR0ZUbVlnN2lDVXh2cmVBUmhP?=
 =?utf-8?B?aUx1RDRzZ05wcUZ5VFBCeFJBVWZqczJSQUFmVlIwbG13RFUxVTBUUFZrRHBk?=
 =?utf-8?B?b1Ewd0FkTGJsYzBpajY2eGxNK1pVZUFxaTd0bUM1NWp4aGhKZXMyWnArNG05?=
 =?utf-8?B?ckpLV1Q5UGRDdE9ubjlScStoa2lteFBRSVFmWFNmNlBXaExEUkJmRDBZRitS?=
 =?utf-8?B?M3ljMDZOaEMzUGhGeStFNGFsNGJ5cUtQSFNHMnBYd3BEMmRKOWMrQ3UxYm9p?=
 =?utf-8?B?U0xYM2hKa1daeWxjQmRVcXhPVTRta0hET2tYeVVyMUl2NUhTWlNDSzVkWlJK?=
 =?utf-8?B?aExsT3NDY3hDSzVnNmdSN3k0NGlOdnprZDgxNWtQdEQ1clZPcG5JMGhxRkha?=
 =?utf-8?B?U05ZK3ZLYjlkc3A1bk9EUlR3YmpndlFZVkdZNE1hREw4UTFLclgyVktuVHdM?=
 =?utf-8?B?K3hrSGRGYU80ZG5xVkhQaFZNTmpicjNJVDFQVFJVc1M3L3loUmxoaEZ6TEpU?=
 =?utf-8?B?UUdNa0JUVjdWMXlsakUyRnMvcTRqQWQvQTgyVmpJU0dyMThqWGRsUGhQaGIz?=
 =?utf-8?B?REpuUStsZ1hBMS9wOTVEcHIwMDRJUnJkaFJDSHUyYU1TM3Q1YnFmZERmUnVs?=
 =?utf-8?B?M00zOThBL3VSNzFTY1ZWRTlxV3ZnOWZwaFRha2NIb2dJQnNiRVdldVBLbzNT?=
 =?utf-8?B?clhUM0lMM2o4TGo3ZlFTN0twdWhmc0tqUHFrMVhSYjRWTENhTlljU1VVSnRl?=
 =?utf-8?B?UG9aUVRrTmtRb3dORnZ0bWxjcGNqb3RaSTZNd2JZQUtXOUxuUXAzdFlLbU84?=
 =?utf-8?B?SDh1RlpqVU0yd1JUMnFuWHdWVzJwUDgwNDh6VnE3RDBJZDdpV0NXK2YyZlNl?=
 =?utf-8?B?WEo0QTVqMXYra1U0UktVcElNWjlEWVdLV0p3bUV0R2Yyc2JFVVFsQTFtdTNq?=
 =?utf-8?B?UXpHWmxmTVVJWEI1YzFhODJGbFJDTmVTVHdJdUcybFZJMTI5Mm1EQUN4MTMy?=
 =?utf-8?B?RE1ZVmUzdGN6d0RDTnE5S214ZjNaNWl3Qk5rcHVDYlhVZFhGVmZMWm1DUm5Q?=
 =?utf-8?B?N3JSRGcrRzFGMlNRMG55cVJhb2I5VE5IOFJRek50aTZxYndqOTZxOE1kSkNH?=
 =?utf-8?B?RUplMVZrR3lNUUlBbmxKcG1MRFVhTzlEcGs3VkFkbGdaNzQ3VzNCVTBOY0Rr?=
 =?utf-8?B?ZlE1MU0wMU1kaDU0bU1jK1dQSWFLc0pBL051UXFhdkI4dnEyTUM2RHVUTHRO?=
 =?utf-8?B?aGZ5Q0JXd20yMDZ0T2RhNFB2TVNrQWszcDRhdDlnUXlzaW5tdk5zYzBEbXVE?=
 =?utf-8?B?SXJQNkFqZGN1NEQvTWwybTQrMVVZNWZQb1QvVVhMdVE2cXNTb05Pb1Btc3Iz?=
 =?utf-8?B?VDBaYS92emhuNXdaSlFlWUlWc05tZm5pTkhHYnNESmhGMGIyNmdnQWZnb1Q0?=
 =?utf-8?B?cXhkek04d0lJcGRadGtJL0VGR2txaENpT2VhVG5jcXZkYjVxY1ZIaS9hMHFG?=
 =?utf-8?B?dG5FVHp5WDNBQ1U1cGFwYkVwb2lTRlBRZ1VEWjR5RFlKZDAyZzVCLzBkSEtx?=
 =?utf-8?B?RjdieEswOCtJdnMwZ0JLNC9OcE5TdE9keWtOazJQWVBuSVV1eHcvaG1PVkNS?=
 =?utf-8?B?SGlkMXJlc0NhWTZOd2dVMVU4UjJGUGdTK1VKb1hTS3Q4Y3hIazFldTZTY25v?=
 =?utf-8?B?NUdWVzFEdnNoSVZ4K1FaMTBiQ2dDSlJRTVY1Ym5UbkwzNGxiVGpuVkRrc25r?=
 =?utf-8?B?L0FoUCtuNWlrV0Vhd3puT3Bzekw1RmFEVXRqUFdUdE5JUmNTY3VuczhaUlpi?=
 =?utf-8?B?bEgxVG9teFhtaXFSREpUL2MvRWFlZ2phbWRFV1FyYUZwVDdHcjV6WGZHZmR0?=
 =?utf-8?B?ajJidXF6aVRJOVVEekhWcUduS29Edk5PaHY3OVNNZFB6OFVYeG1BVFlJWjVz?=
 =?utf-8?B?N2c9PQ==?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5b2955ff-2dfe-4f7d-a008-08de17759ab8
X-MS-Exchange-CrossTenant-AuthSource: BY5PR12MB4116.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Oct 2025 05:31:40.9523 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: idUDiDzXjOpADnA57jiuppraMmNn8G2cXq46gmlQrUPY/FSo5CmRjb2OaO6MsAIzGQzOQz50t7RSnIGZuL91lw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB8334
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

On 10/29/25 6:44 PM, Timur Tabi wrote:
> On Wed, 2025-10-29 at 18:07 -0700, John Hubbard wrote:
>> Yes, but someone can still plug in a pre-Turing GPU and try to
>> boot up with nova-core.ko on the system.
>>
>> So it's important to avoid getting into trouble in that case.
> 
> Sure, but I think we don't want any real code that looks at boot0.  Nova should really just look
> at boot42 to determine any architecture.  So what we really want is to avoid accidentally

Oh I really understand your sentiment here. I'm all about, "use the new
hardware and never look back". :)

However, I don't want anyone to have to risk reading boot42 on some
ancient GPU (earlier than Fermi, even), with uncertain results.

And our HW team has promised to leave behind arch0==0, arch1==1 in
in boot0, more or less forever, specifically to help us out here.

With that in mind, I *do* want to read boot0 for the forseeable future,
as a guide to whether to look at boot42. I really think that is the
way to thread the needle here.


thanks,
-- 
John Hubbard

