Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 637B4C3D959
	for <lists+nouveau@lfdr.de>; Thu, 06 Nov 2025 23:24:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D5AE610E5A6;
	Thu,  6 Nov 2025 22:24:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="aug2ibKL";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from PH8PR06CU001.outbound.protection.outlook.com
 (mail-westus3azon11012028.outbound.protection.outlook.com [40.107.209.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B0F810E5A6
 for <nouveau@lists.freedesktop.org>; Thu,  6 Nov 2025 22:24:35 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=M8AhN3s7JDt5v7WV+nhorSSU17F9jD0vG2QSmEZ2K65P45pLORjbJdRWYdr709xQCv87AKhXQKDyFP+Ed5ixr70Yu1CeVc1Fsjp/I8DYyba3rVxBZlbKswPPpa39c1YyJ5/6E+c9UynnIdmTxhwOnx3bZFGj5wEJvbpWXWvp2I1bpD8yEsr/qt4jt50O1CXa97+JpR01JyI4fsI1pLEwFoRwCf/eSmUgMHxfDySmPeAr1R00HF5FmXJHlnbxoZd1nANIjqUz6qTP+s+dUIlUUPxfYE4ZjIR5nfkPb82U3OMDpZXL8hEdvCXIkTFnK2OtefBvYIPf/7i8vVwyMGDHsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GlqpBNcQmfDvDTVzLpMvgFDclSSddc0OLY/wew2DZdw=;
 b=i7DpcoZt6TwLaghmeRtV7TbgpvZ+KOBOAoFkIwvVyduxlK1k0/03zO4lxUqo9uvaLhDjx3sje8KFd3jK5hFeyGdfPEqIZYIhDV9EKNuwlMWPvZK31tCYLHOSs+E1m519IFoJ2Fo64mNjz0gjUB8mgSryxkojz3Wp9J77NNPcwyEHXM3I4zziAtrrSQnbZ2f/kb9155oUel2DL2rF7OzNtvy4d5nUHlnZoIXAxtl2vpYve+H6ZHwKeyklFm8XnkpyJEpgSHRK278v5fdedqmgVWcP5vT0SVR9haHGdljRkZKKtTt7K2SnPz8M9K1M9z3p9ymrWsFcP2XM3bYfN1RgSQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GlqpBNcQmfDvDTVzLpMvgFDclSSddc0OLY/wew2DZdw=;
 b=aug2ibKLROw4j8pqmxtSRnKQnK0x4OofofkdFwgnW2iL4hdkWkJJPRGZ6zGN/RqCschR4zGJ0UEpALe5ZDQgRQQEzfuIIc11xbcmv6QH3dBoj49AXcZbYVMGBz/LghASoPUfenyEUG0AQE7QNy1zTPxMF7AtimBKD7POT2e4mtt6fTxcP/aihiDnp7o6Yc0/Mu84XCPNaZTOiJHtDv1P0zbHt3Vrg3+MJz/bF+noDbPCX1H3wC+s3SVK+V+IveUTbQ8A+o6qSDPLNNylDmTQQKNiYtb7ymQxjdFiWR56xiYUPRXQH3SV/zS6n0QguNvrUYdoYeGAXV4OYm/Rtm4n8A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from BY5PR12MB4116.namprd12.prod.outlook.com (2603:10b6:a03:210::13)
 by MN2PR12MB4062.namprd12.prod.outlook.com (2603:10b6:208:1d0::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.12; Thu, 6 Nov
 2025 22:24:32 +0000
Received: from BY5PR12MB4116.namprd12.prod.outlook.com
 ([fe80::81b6:1af8:921b:3fb4]) by BY5PR12MB4116.namprd12.prod.outlook.com
 ([fe80::81b6:1af8:921b:3fb4%4]) with mapi id 15.20.9298.010; Thu, 6 Nov 2025
 22:24:32 +0000
Message-ID: <7d928fa9-74b3-4790-9e94-10cc56801fb4@nvidia.com>
Date: Thu, 6 Nov 2025 14:24:16 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/6] gpu: nova-core: Blackwell: basic GPU identification
To: Timur Tabi <ttabi@nvidia.com>, "dakr@kernel.org" <dakr@kernel.org>
Cc: Alexandre Courbot <acourbot@nvidia.com>,
 "lossin@kernel.org" <lossin@kernel.org>,
 "a.hindborg@kernel.org" <a.hindborg@kernel.org>,
 "boqun.feng@gmail.com" <boqun.feng@gmail.com>,
 "aliceryhl@google.com" <aliceryhl@google.com>, Zhi Wang <zhiw@nvidia.com>,
 "simona@ffwll.ch" <simona@ffwll.ch>,
 "alex.gaynor@gmail.com" <alex.gaynor@gmail.com>,
 "ojeda@kernel.org" <ojeda@kernel.org>, "tmgross@umich.edu"
 <tmgross@umich.edu>,
 "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "rust-for-linux@vger.kernel.org" <rust-for-linux@vger.kernel.org>,
 "bjorn3_gh@protonmail.com" <bjorn3_gh@protonmail.com>,
 Edwin Peer <epeer@nvidia.com>, "airlied@gmail.com" <airlied@gmail.com>,
 Joel Fernandes <joelagnelf@nvidia.com>,
 "bhelgaas@google.com" <bhelgaas@google.com>,
 "gary@garyguo.net" <gary@garyguo.net>, Alistair Popple <apopple@nvidia.com>
References: <20251106035435.619949-1-jhubbard@nvidia.com>
 <20251106035435.619949-4-jhubbard@nvidia.com>
 <ec49facbd969b1ad00acbaec1c719d3b30e0151d.camel@nvidia.com>
Content-Language: en-US
From: John Hubbard <jhubbard@nvidia.com>
In-Reply-To: <ec49facbd969b1ad00acbaec1c719d3b30e0151d.camel@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BY3PR04CA0008.namprd04.prod.outlook.com
 (2603:10b6:a03:217::13) To BY5PR12MB4116.namprd12.prod.outlook.com
 (2603:10b6:a03:210::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY5PR12MB4116:EE_|MN2PR12MB4062:EE_
X-MS-Office365-Filtering-Correlation-Id: 7e684d1d-af88-4059-a4db-08de1d8341be
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?QVVuWVVqc3EzQUZEb0lFb3FEbFZRVjA1VHpHUjBaVDdUK1dTZTBRa2JKSzYx?=
 =?utf-8?B?RUo0MzVQU0RkTm5qckg4WEVUbUFXdnpRRndMNEphWkZRMFFGbWxyVm8zZVdQ?=
 =?utf-8?B?YVFMaUl2SG9PZUI4M2JrMFUwWXUzTWN2WjRJRjRGRzZzZGIvNzQveFYxaGto?=
 =?utf-8?B?akFod1JCdmU3clVtT2Z0WHlUQW1CcDZsU1NqNkduLzFnR0YwNnVjOUtRT05H?=
 =?utf-8?B?L0x3QjFFZHZCbDhpL1NZb1FVWXl0MTRlTFhlYjl3NEtoWm5HbUtZYTNscHow?=
 =?utf-8?B?L3AwK3kzTDkySk5wUG9EcmM0VFpKRm1PeTVPbGlqT2ptOFVXZ2NEbXpnbHc1?=
 =?utf-8?B?TmNacG03dUM5ZWk0cUtxTjROWUJpUFd5dmJSdFUyOFR2R1l1WGJ1U3F4eFk4?=
 =?utf-8?B?czA3ckRQenpEeXVSWlB1VHgxbVZlVno3dHcwcG1RbWJ4aE1HNTd6T3ZtQkhx?=
 =?utf-8?B?MDJwNkFEYnhqMGl0NVVlYjdDQ0tvM1FyNndUNDhQRkFteVdaTWtVRUw2cVVi?=
 =?utf-8?B?WEdTeFY0eXJETno2UzRXM25BdjlNcXplY0twZWVTV0l1Q29uQitmeTJNanNB?=
 =?utf-8?B?c3lTVEhpdGVXNlA0YmNqWVp6d3pXQzBZL2xuZkZNVVp4eEFIRStGMXdiSXkx?=
 =?utf-8?B?d00zY3BsTzNOSnlvejJ0bU8rQk11YkFTMjJzSHZzZmlWdHYxWGNBNnZxL1VP?=
 =?utf-8?B?SEdqc05LdXEzR3RLeEt0L1BpZGhDbXNxaFd4N2JKa3IxU0R0NUNVeGdhT2w1?=
 =?utf-8?B?UnNta2l1RHdqOXdLS2pQdjFSaTV4eTl6VGlzYnUycVRqWlJYNkxYM0Y3VFlx?=
 =?utf-8?B?ZVVFL1RRNWgxLzdpM2tpY2FkYmt2ekNYSDB3UlNhRVdsSzJGaDNLZjR4RWxw?=
 =?utf-8?B?WURieDBxdGVnWi9Sc0ZyclJUT2dqMVFtRGtUMm8yNGFBbVlnaXdZQnNKb1BN?=
 =?utf-8?B?TTBNd3pOZkFTWllEK29SbDR0VkdJaDBnRUozd2FteVVGb1EvaUhpYjQ1N3Yw?=
 =?utf-8?B?ZHRKT0xiejVWcGRtbmRIR1FKU0w1UjNvcmpONVJQQktwMU81cS9EUHd4MnNY?=
 =?utf-8?B?bzN5bjZYSjhlUlJiMGRadmxFMlN2MTBnekhiM2VhQUVJZENyZ3FyL3FXb0xy?=
 =?utf-8?B?WGNGRGF6Zld0N3U1NUkxYjk0aVpKWHpsMW1BRDJHVm1PQzVUYTBpREc1R0d5?=
 =?utf-8?B?MTk2S2QyL0VRN2JKZ1ZIWHowR0RUaE1MQ0VsZzJjRHhDMG1QTXNWWWZSWWNJ?=
 =?utf-8?B?STVqNXd5Yk9UNlZZSzZGdlJMRXZxbXl0UmxuRGE5ZGxOUVRKQVBWYzhueG0w?=
 =?utf-8?B?U1RNT2FIVWNvZWVJT2ZRV0xNeVRETXVyOTM2MzNtNUJYOGZBU0s4Si80Nis5?=
 =?utf-8?B?d3owTE1tOWxLa1U4K0pRTk1YVUlwZUhFNExmaXNkS0h3OVQ3UmZKM1JFWGFX?=
 =?utf-8?B?WVBiczBTMnQrRHRwQzB3dWxpdkxPVGExOFZLWFZMaE55eUsvY0V1VDlYUnI4?=
 =?utf-8?B?N0hyV2g3Skh2ZGhCVTE2Mmw2WnlZUjcxbGVQMGlZRE1zamlyMm9kMUJHSW9L?=
 =?utf-8?B?amM2V2RjTzdmb1BsZlkzTkRvVUd5SUR6VHJhLytPR3ZueUhweGlhamVERUEr?=
 =?utf-8?B?ZEFzYUs2WU03QmlFaHN2K1NmdXVYTFZkZTU1dXRaSGl4SUdveDhGZFNsVmFy?=
 =?utf-8?B?WWdzc2dwc1czb0krMjFuNVpVVTFYRW51V3k4Rnh5dWIrV1FUTUtLM3lzcGRW?=
 =?utf-8?B?bFlRVFpnc1RuZENmdlBjaldnaERtTDdtT0c4Nk8yTjBESy9HdDFPcjUrZW4w?=
 =?utf-8?B?STkwdmNHV0dWL1BmNnZsRlByV0R6OVNTY1NCc2ZGTEVhemN3enIyK2tBa1Nw?=
 =?utf-8?B?ZTJ5VTMwODdDeGY0S0FYTjVTc2VneVI4L3BqWUpOcUxNbE11MmM0TmNhV0hJ?=
 =?utf-8?Q?O2lVleScsfTvJM4Yyt9oTlI3AyITPJvB?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR12MB4116.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YUo2bGN2OEljSDE2WEY1RUhZbDVhZE1Ia3lBVFVmY0c1Z0RsY3VKeGNpU1Fk?=
 =?utf-8?B?c3lTRUcwS1kyUHV4Qzg1RG9wQ3QzU21LUTZwMnF0UUZWSWI2NE5icnBDZmkz?=
 =?utf-8?B?QXB4Q3ZiYjJEeGx4L2w4TDNhcU9xUmszaXRETk5HT3daK3V5NU4raGRDL2s5?=
 =?utf-8?B?K1hpOWRFRVZ4Z1ZjTXdXamJoL0JKNUVVaTgrNW5LcXdHTXlwK1RSMGJzREJQ?=
 =?utf-8?B?aVJoVkl0MjNVU1NKRXBwNGJSQTJ5UVVkaFBVSjMxQzRoM2lrSllmUzVpQWtw?=
 =?utf-8?B?TnRoREdIU1J5VEtVY01RQlhhTFJtb0tyUGRTSnlIdXFkSWhkS29kalZOOXoz?=
 =?utf-8?B?azIzNkhUUjFWK2VvMVdvV0ttTVludktKY2cwTmZuUVpJQktYMTB6YjlpbUhh?=
 =?utf-8?B?SVhZcEh5NGJDVW1DVzFZSVgra0hLWlNBZnF5WCtqMXJLbm1XTkl1MUNjai9r?=
 =?utf-8?B?VkZyNnd4QktLaGtEdGZ3WmptLzVqWStwREV2UzlXdURpR1dVemdsczFkaDBS?=
 =?utf-8?B?SVhBZWVhc3ljZ1Jha2xJZTFuQ09TQkVGa09tbkZCdyswSnZERHN2S3I3QlBn?=
 =?utf-8?B?VFgwc3hMSTQ0UUlYWmdHTDFXeWwrNmd4ZmVTMEpmaWFkaFl0MWIxZG9OeXZU?=
 =?utf-8?B?K21uYTN0WlJFVnlIeHl2Q2tHNDdNNjBCL0RQamdPVkpqVDV2Q0xhR2dKbjdE?=
 =?utf-8?B?YmdYUkNSZk0xeVV1cFBtdzZDeDFWL2JqVHJMdnEydDhGQVMvQmFXYnlHOUE1?=
 =?utf-8?B?MnpHTEdvZVZ0RFhpNkFmNHFCcWRNNXpjRWhOQXNxRVBTSldTMkhnZUZVWWRJ?=
 =?utf-8?B?a2E1eWlLRzJ4UlNFQnAwR21EWm9odkplNDBHU3NYVFpyUWRMbzNjY3lpUFpU?=
 =?utf-8?B?eW9SekZyckxkNWF0SWxMbm1pMjdURGRqU0l1eVkvbU1rTlBUNHFPcS92dVFi?=
 =?utf-8?B?WjZDWG52d0tTV1p5RC9hMHZLZnBhdFlwTDZhRkl3YVAzcmIwUW14MFc5UHBT?=
 =?utf-8?B?cExVZXc4NlRxcFRmZXd6SUhOa1NZZ3Z3TXZDVExtdWpNOHVVZUlCcjErUll6?=
 =?utf-8?B?UGFtb2E0V1Ztd3Q3UXV4U2w4Zmp4Y1FmQjBzT3JRbE1rQkN2c2grVVBybmU5?=
 =?utf-8?B?b0YwWGc0UUVTV2ZLcnFmbDZHVzRCcGU1eFNLTDZiZUhON0hkcU5FSFM0S2Nu?=
 =?utf-8?B?cWpweS9CRXB1SVZkY3hCUGFLL0lTSTVncHEyakVid2FkYXRhRUZJYjhSS0JQ?=
 =?utf-8?B?TllFVHBmYWk3VkJxcS9HRHlpQWprZTduMmZKL2RmM1FLSUxiOXJOeXQweU1W?=
 =?utf-8?B?NzR2MjczZnBjdE5rdlhvWVJiRjNpa2lXREp3eTJEZEJ1aU5McS9sV2orc0dH?=
 =?utf-8?B?OXlmdTBPRjQwWUZNR0pzaGxPazR4OFVXVXB1V2JReWRRVzVGVmZVOWJoUm9N?=
 =?utf-8?B?cnR6YWdHVDREcyswZU9yaVo3Tm82M24vdHpRQXhOU1RWSHJuU2VDNWlhMDFC?=
 =?utf-8?B?TUhUeXdLTFJSZkpSTTNKMFgyL1ZNRGR2L0RFd1pqdlBnZEVNSUJFWUl1SFk4?=
 =?utf-8?B?Nk9mQWc0dGszY0hPT3NqNjRDcGZiM2dVcENHSEt3Wjg1TnRsdmp2MG1xWGF1?=
 =?utf-8?B?UUwzVGkydHh1QkNMRHJlcVFZMUpQVHhyYm5WYmRsdGhIbTVkeFlOcDFCbVdu?=
 =?utf-8?B?UE9tRTlNZ3BLTEFvSjluZVZ2aXUrZ0tVY211OTZBVU1LSExZQUlTdHJSM1hx?=
 =?utf-8?B?ZkFMRnROaFIyS2IvUzhmSTIvRmt4d0hBZi9BbVNkWE9iZVNyRytEcC9VZTNi?=
 =?utf-8?B?bE0wSHhUdlRnc2RNRzlRUlZRcGhhNVVGZ3MzTlpyZVBRbWNSSzBYWkFJUThH?=
 =?utf-8?B?YTRvL0FtaU83Rml4eFhUOFNzMXptQkc0QzZmMk1LZmpDWkpndDIxblFpdWFN?=
 =?utf-8?B?cm9HVG04TDN3YSs0ZlhRN0phRWVLZHJKenM4eDNXbU5uZ2ZDOWxhUHpibU5B?=
 =?utf-8?B?K2grV3ZvMlBWU2RGRTYxZUdUT1dnZlRmajFYc2VrMW1icUN2allvTWdBcVVO?=
 =?utf-8?B?aUxrRWVFN3Flcm9pdUtlc1NmQ29TUm13V1IrTW04QU1xaHN1M3FzdVdQNjhE?=
 =?utf-8?Q?1Cm2b1Nkllnoq2pytAt6c2PKt?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7e684d1d-af88-4059-a4db-08de1d8341be
X-MS-Exchange-CrossTenant-AuthSource: BY5PR12MB4116.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Nov 2025 22:24:31.5897 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: egtkl2Afyn7HKiloGwsBZxNOl3HrJwd4G9eoweO1RxsshGs7rumEv4ji44ys5CZox9jXPPGRqqQb0uoiilhecg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4062
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

On 11/6/25 6:44 AM, Timur Tabi wrote:
> On Wed, 2025-11-05 at 19:54 -0800, John Hubbard wrote:
>>       let hal = match chipset {
>> -        GA102 | GA103 | GA104 | GA106 | GA107 | GH100 | AD102 | AD103 | AD104 | AD106 | AD107
>> => {
>> +        GA102 | GA103 | GA104 | GA106 | GA107 | GH100 | AD102 | AD103 | AD104 | AD106 | AD107
>> +        | GB100 | GB102 | GB202 | GB203 | GB205 | GB206 | GB207 => {
>>               KBox::new(ga102::Ga102::<E>::new(), GFP_KERNEL)? as KBox<dyn FalconHal<E>>
>>           }
> 
> Maybe combine patches 2 and 3?  Also, maybe this should be a range check, instead of listing
> every since version?  It seems like everything past GA100 uses the GA102 HAL.
> 

Sure, I can combine the patches.

I'm not sure why I've been wary of using ranges for these arch's.
I'll try it out.


thanks,
John Hubbard
