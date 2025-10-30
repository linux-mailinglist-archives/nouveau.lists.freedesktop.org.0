Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B1744C1DFCE
	for <lists+nouveau@lfdr.de>; Thu, 30 Oct 2025 02:07:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 05BF310E877;
	Thu, 30 Oct 2025 01:07:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="otRf0Qiu";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from SN4PR2101CU001.outbound.protection.outlook.com
 (mail-southcentralusazon11012002.outbound.protection.outlook.com
 [40.93.195.2])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 388A210E877
 for <nouveau@lists.freedesktop.org>; Thu, 30 Oct 2025 01:07:32 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xtBp6PwYCNvY5YgrgnysQNPPWobN+j8AG9QDCfw+rsMIdZTt2WeW5hXZNYLWidOlobJmgFMfvntWCtSI6vgVgoYadxiyGc+ctgKDu4ftBGY9C1U9SKEcQyFTJ4YgDsXXefHi6QWnUOq/9ZsI3REVMO7UK6dPP+nMdAGo3AhRNHRdgaxu9UYLTzu2A24ofDDwCBlY2GcEjtkplUOAcFj5t4ZAz6MHY4dza4RLF9YhX3Qp+6s2DyQfBrlMrF5k+BT//EGi+RsVAidCFhxj7+Tc5/E/NG0FXgo6UwiuvFylL5jB6CWz7DZhPlQp7/oRxfjEQIKJ2nxlo3rJ/g+Qns3HJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HZ/Wolv/CVDmryPuz2FVyFGd+z4rUuPt3EadGff8G/Q=;
 b=Lt1UdXKNeIRVd+133lqCGjRorMYDolKX1YuOVOWo54qrw8fzk/wvjAupK3Rn5eAhm48Oy8p07qni6nEfJFxWQnxacaQQApJVH0F/4S6+c0CMdjyEujYipwIlGEJ58NLhfWeBziy4qRVedz29aSuCtDC61LBRwY+RvBgLUhGV5U12WYx3LI26ukQpgNguvxg5ota5kkgCi8ya+ojCFLWVac1Tg9rH9VPwUyIEBwV2zDyzxO0GFQLl7uLUHDxMdSNk7iY7EcbAj9HJ9YGMFxNOuiXFpZSSgMmfUm/8gyRSa/oW3MQHsiLwTsL1FkH06G7/JqR8tqIbmth5A+SDBs6Ccg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HZ/Wolv/CVDmryPuz2FVyFGd+z4rUuPt3EadGff8G/Q=;
 b=otRf0QiuGhQoszb7CCpdE9m/3YjQ0Kx3QE6m/xRV11bu1iX5O8fx+dVqvcf5IBsX/AkPtI22/zmkBa+YtGcoykfHzdQqp4YIuSscT27ngKYEHOft4Y3Kh8cqhExTb01Ay9vep2Y4ew5EEZ/3D40DkKI/GaEvrXYGYZJWArjZ6JhAXe9KJCpP67YTX6DC/GRZjzQGiA7FL7xoeoB2PKbtHyNpm6DcBWjTMZMjCNdTIZZpTYqXRqEa+tX5TCeWfsi3/AjUQGv2lg2LAMFazVMRsF4TWxCW9ROsPoBI+d6h9/iEb5i/je+23YXheg2XnJwAcQL2X9GeKOUSIoib7tHR5A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from BY5PR12MB4116.namprd12.prod.outlook.com (2603:10b6:a03:210::13)
 by DS0PR12MB8526.namprd12.prod.outlook.com (2603:10b6:8:163::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.13; Thu, 30 Oct
 2025 01:07:28 +0000
Received: from BY5PR12MB4116.namprd12.prod.outlook.com
 ([fe80::81b6:1af8:921b:3fb4]) by BY5PR12MB4116.namprd12.prod.outlook.com
 ([fe80::81b6:1af8:921b:3fb4%4]) with mapi id 15.20.9275.011; Thu, 30 Oct 2025
 01:07:28 +0000
Message-ID: <b8796ee0-05fc-48e1-a075-2bad99b938d2@nvidia.com>
Date: Wed, 29 Oct 2025 18:07:27 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/2] gpu: nova-core: add boot42 support for next-gen
 GPUs
To: Timur Tabi <ttabi@nvidia.com>, "dakr@kernel.org" <dakr@kernel.org>
Cc: "lossin@kernel.org" <lossin@kernel.org>,
 "a.hindborg@kernel.org" <a.hindborg@kernel.org>,
 "boqun.feng@gmail.com" <boqun.feng@gmail.com>, Zhi Wang <zhiw@nvidia.com>,
 "simona@ffwll.ch" <simona@ffwll.ch>, "tmgross@umich.edu"
 <tmgross@umich.edu>, "alex.gaynor@gmail.com" <alex.gaynor@gmail.com>,
 "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>,
 "ojeda@kernel.org" <ojeda@kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
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
Content-Language: en-US
From: John Hubbard <jhubbard@nvidia.com>
In-Reply-To: <479ae6b7fb05376d21bdfe1fcde9e3705c11ecc4.camel@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BY5PR17CA0032.namprd17.prod.outlook.com
 (2603:10b6:a03:1b8::45) To BY5PR12MB4116.namprd12.prod.outlook.com
 (2603:10b6:a03:210::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY5PR12MB4116:EE_|DS0PR12MB8526:EE_
X-MS-Office365-Filtering-Correlation-Id: 0c47fde2-ce3c-46d7-f97e-08de1750b1a0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|7416014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?MHB1bEpMNElmWFhYWjkzQWF0UDlBTkovVlBqS3g0MnVzUGlVNE01Q1dzUmFH?=
 =?utf-8?B?dlMvSHJnUnNxWVJOOHN0cFdWOUhYdEMrSEE4bjRmZjNrd3hNbXZYWkEvUHNq?=
 =?utf-8?B?R3RWdWJSWGs4dStIRzFZdzNNS01ucStiOGt1SFlvYlJxcWF1N0JRUGFIbXJZ?=
 =?utf-8?B?RlR1NnZhT1pjQWR2cDRudkNPUnFvVUdLNzBSUm1kc0NVK2NVSU5VNjAwZzRk?=
 =?utf-8?B?UWJLSUlGN0poclVPK1VqVmU2WHZjd2NNUjFEbkxDRFhvclpzQ285SHlweCt5?=
 =?utf-8?B?WWMwcXhUZmdldmp2amZJc05RSWw4R0R0cVljaVAyTzZhLzV3Rm02dUI3b3RO?=
 =?utf-8?B?NFE4R3VQQ1VCdDdIMmV0UWV5V0ZOOHErbGRIL1YzcnFvKzhCY1ZuSnliNTF0?=
 =?utf-8?B?ZElhNlJJdlVaL2xicUJzR21UVjc0eDJQVWdSUGY1QkxreEhNUkc0NEs5ckx3?=
 =?utf-8?B?eVdVaGJlUHhWTS9TZ2RHTCtlbXYzTldMR2NLaXNVL1UyK3R4TURaYzZLNEJm?=
 =?utf-8?B?VDFQVUVoTk9DQlh3b1ZQazI3d3E1ckhKekZlUWVSamE4dFV2eExWdTZkdkRw?=
 =?utf-8?B?ai8xMzduaGhTb2U0N2NkZXN0V2lYRWt4MGFCcEdXczNxdkRiYWRpeTlIYjVN?=
 =?utf-8?B?MkdRRDYwZTR3REM3SkQ5WHh3ZUwzbEdXRlg0b21la29VMHJrcGt0QWVrZ1lQ?=
 =?utf-8?B?bytYYS9uekdkYUZtQmZaOGZjVE5qMS9EVFFpTFJtSzEvMTBldjhqM295aHdI?=
 =?utf-8?B?eUhUZDgybmFIdVppdTFZZ2dmVVE3aVJUYXQyU2dHZldnNzgyaDdVdWJHMmhS?=
 =?utf-8?B?TWt6MFovY1JCYlJZdmxBdkVNZ2I3K1BSa2dmYjg0TTQvOUk2VndCZnltMHBR?=
 =?utf-8?B?ZG1mZ3JJeGhVMVZFYjlPSG0vczIwYlg5alhmSFBMV010bnZGNVB5ckFtMGdP?=
 =?utf-8?B?YTRSTXNZc3pmcnEyNGRuNGs2QkNVOWpuT3c1ZzVXNHNXTWVPYWNVUVNkWkJw?=
 =?utf-8?B?OHVpeCt5eHNwT0RtZGtzLzdDVEN3WjUwY3pacm1RdWJXR3N1blBEbGl0Y2R2?=
 =?utf-8?B?ZS9FbHNKdHVmSHd6SExnS2JkTVBIeE9wK3RwUW51M01sTVpxWFFtdmsxMDFX?=
 =?utf-8?B?cHNZSkkyZVBJMlREdGVSaDJuT0NndzF5UHhiVWZuRWVoWGdaQ2NOcjN1NnZi?=
 =?utf-8?B?N3M4TGUrM1Q1Vldnek9jZGJPV2FZQW01RWFvQW1hZDY1U3NCNlJKNG4wOEtI?=
 =?utf-8?B?NzYwNnh4Z2JZZ1hvMDZxL3BFazRqTi9EU3lpSllLQ2ZqM3FmdWNGZm1EZXlu?=
 =?utf-8?B?R0wrZ2ZBVkplSnVlbGZ3aGR6U2dsUXY2KzBRODNhWVNRTVVlZ242YjZGOXY1?=
 =?utf-8?B?Z1NnYnZObkRSblFXZzVTUFBHM0NQR1lDVzM0NmMrREllTTQ3OFhSbnpKb3pP?=
 =?utf-8?B?SGpOSUhmdU5lQjZMajhibkl0L1A0Y3RlU3R3Wnd3SW9EQXFxUVcraDZRajVw?=
 =?utf-8?B?elRKeHZwYUpLVlcrZmNnN0p0K1JROVB0OU9PRFVkdmVyeFh5bldZT0VsWSt2?=
 =?utf-8?B?dDNScXBrZUh0NGNObXNTb3d0T1JweTFHaDVhVTh1V29MalJKdWltbmJqWmpS?=
 =?utf-8?B?OWYzZnYyZk8yUkVHTkEzbDllRHQxNEJmazgvcDJVZUg3VGRLYm1OWlFtSlJn?=
 =?utf-8?B?dlF1dG1ub0MydGIxRFlCbGxZbUd6OW41Umo3KzZYTXNsNVhhdkpzaDlhUU8r?=
 =?utf-8?B?dUx1MjJpeEJ0TWkxQVZDV01GOUxHZ0EraG9XY21TVjJTSUhKbjBBWngxMm0r?=
 =?utf-8?B?UCtIQUYxRjFXVHZsSGVkaFR1Q3hjN0M3SFVqVGozRmg3Qmp4clM2QWI4WXY2?=
 =?utf-8?B?MFlRTk5KYW44SkRTTjVTNDU5SzhVUXppQXlqeit1Y0RIQUh4dit0eE12VWNC?=
 =?utf-8?Q?ayGoeG+XTHEb+uq7PFLS9Oc1F9UtxYks?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR12MB4116.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(7416014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SHN4c1F2T2lwWGlUSHVQc3NBQlR3RUZja3NORUU1MDY2N1k0Z25SRVdKRkx4?=
 =?utf-8?B?cmxFWTJTNVdmcGFTN052N0tUY0p3UjNSUVNVOG5HaTdiRWpQSU5kOERWdWxo?=
 =?utf-8?B?cE5Lbmd0ZHBFZjJ2WWhsbWlmUml3cG5XaE10ZHZQWlR6eXRtME5lRzFrRGMx?=
 =?utf-8?B?Y1R0aFpGeGJZL214TGpSLzMzMFJISzBNWllEaEwwOG5TcU1BN1htZDlUTHRt?=
 =?utf-8?B?b1dTdm9xVUlqb3E4VlRBb1lIenY3NWFBVjUrVy9nMVNMeG9ITlN6Y1NpOURh?=
 =?utf-8?B?MWkzM3YyRHg2MkR1OFNQa3hFQUdFQ3ZsSVZodG9PNnRZV3g0M2pRbVZSM3A5?=
 =?utf-8?B?Z3N5cFI4am9JeEpFSVFBbDZFWTVGRGR4SlBKek9RYTlhdjVtTURQTk9CNnNJ?=
 =?utf-8?B?RDFERGhJMEkvb0dZclVKT2FreDJ5cjE5Y2ZqanM1dVladnpadGpZUEtZMlRR?=
 =?utf-8?B?cWZDZkdPY3ZzelRKZVp4M1YxSTZkelhNUnNjUFNaU0xaQ2hDUjNOTTlKbE5h?=
 =?utf-8?B?dUh2R01DQWp0TGxTbHAxVmp3SXJqZEZabjZ6VHVvSjFTcWt4TjdYYWdOMW1w?=
 =?utf-8?B?RHFpb3VPMGFaQmlTdHM0b2prcEdQMTFjVWVwRHZ1Ti9QOFMvYmZZRDU2bmJi?=
 =?utf-8?B?cEllSXhuL2JmTENCdVlrclY3M2M0Mm9FT0N6MlFudmk1ZVBNb0wwTmw2enVY?=
 =?utf-8?B?Q1kwa1VMMVd6ZWlQeEk4N0lUY21FenNBa0lWUUQ1c2tYQ0xnMjJwTUo4N2o4?=
 =?utf-8?B?V1dkNUY5N0JVTzFKVHVGbUpZY052TEpqdG1JbXUzQXFsQ256djRjL2RMVTZO?=
 =?utf-8?B?K3FOMlRxS2gvbVVOWW9FN3ozOEVPdjlUY2dvNEtkUEw0bThuVkVwVGQxRHR6?=
 =?utf-8?B?VjRhK05Kbm1SYTNvd0pWVkRRQjFSa0QwS1lTYXp3bmJjSlM2anJ0NW51V05M?=
 =?utf-8?B?ZnNXd3lGRDUzRjVYa2FiZ1dkd1lTUndpRklYeHpkZDIySS9OL1FXMkl3SHRw?=
 =?utf-8?B?Skk0cTVZdk1ockVIVXRObmxPc2M0V1d0aEpLbVZoREhVaTlyekRXVGZSbUgw?=
 =?utf-8?B?Y0JEeEFUNjdtaTczZUF6RHZFb0dYVTB1K3lGUUw4dDZwYkFYdzM3VGpLRVhB?=
 =?utf-8?B?V3A5TVVBQnRWYjBkbk0yaTJ4RDBwd2dBZlhkbWd5Yndadm5kRkVYaElXT0dn?=
 =?utf-8?B?QzhORU5pZXdpMTVpb3JrYTNNQUl4UUN2ZFVlUVY1OUhOVHhoL2dzaFVVU0Rl?=
 =?utf-8?B?Zk5aRUc4M3pIM3FCb2F4M25CS3dhK2FGYkhTRldFWUQ1UWJNQW1Pc0poQTV4?=
 =?utf-8?B?TXFieVFaTGQxV2tqVXl0WnRWSTBCOFlBMXY1a2phOGFLVmdNVHhXZ1hpSHBr?=
 =?utf-8?B?Wlovenl1eEhibnlkdCtaM0xUVkErNkVtd0E0ODhLRTcrbjVzMHkwa0lUZXdX?=
 =?utf-8?B?ci92bUpzVVk1U1hBKzlZSGRKMmlCVk12SmlyNUt2dFc2L3ZTUWZSbVJqVTlk?=
 =?utf-8?B?WkVMTWo2dG14ek93QWNURGZqWVllYzJOaVNzSTQ1NEptSWtzNTFuNGtrSFdF?=
 =?utf-8?B?Q2tJTEFNY3RGcVgrYnpoRXlxbVZHcFVhQlZMUy9kb3BjY2grOUZiRHNlSldt?=
 =?utf-8?B?czdSMHl5T3RHb1pQUXRnbCs3TEZYalZBTUdRUGkzUlN3YTFZSWlZTjBZNWR2?=
 =?utf-8?B?UE94SkpZMDgwM0ltVkZRamIzM1NMeGJMQmwwME1rM3Q1QXE4RTl2b3dSeElF?=
 =?utf-8?B?QjhKanB0ckttZm1EMVpTV1E2anNoaGM0d0lmQ09jZit2SXBOQWduUEhYbEJO?=
 =?utf-8?B?dlhweHFtWVQ4RzVIMXorb0hMcmVsYXJVcldXOFI5NGt6bWdxR2liQU5CRnFG?=
 =?utf-8?B?cGY4MExsWG5UcmtxQzNQTzJXbXhLSjdOM3NtYmw4dE8wcjEzanArVHBsdTNO?=
 =?utf-8?B?c3BzZERVNUQ5cTZZVkk1ZXh4RTJDZG9xaVV1aEVBY1BuTlc2Z2lHRUhlVmhC?=
 =?utf-8?B?djBVaVVVdERtNnhhZkVSNC9oR0NuYzQ3VFdOaStGTkRlMDNaa2hWbGJmTGdE?=
 =?utf-8?B?T01nVk5aS2dtWWw4bGJYanJnZ3lWRmVidDgyeWx3bnNUakRqMFRnNEtzNGQy?=
 =?utf-8?Q?65FXueuj3Nd8fsje3+j7zoN/0?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0c47fde2-ce3c-46d7-f97e-08de1750b1a0
X-MS-Exchange-CrossTenant-AuthSource: BY5PR12MB4116.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Oct 2025 01:07:27.9663 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xQYF1IfFfI/yBZOwyAKszqSYEt6/SuibyTOwXIVo7wqY8FkZBly+2JOjQlc6tyKRDoJ+YA9pigJ8JdvzTfEdXQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB8526
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

On 10/29/25 6:01 PM, Timur Tabi wrote:
> On Wed, 2025-10-29 at 17:35 -0700, John Hubbard wrote:
>>          // "Future" GPUs (some time after Rubin) will set `architecture_0`
>>          // to 0, and `architecture_1` to 1, and put the architecture details in
>>          // boot42 instead.
> 
> I don't want to kick a dead horse here, but aren't the architecture details already in boot42
> for Turing?  I thought the whole point was that we don't need boot0 any more, and only Nouveau
> has to worry about boot0 vs boot42.

Yes, but someone can still plug in a pre-Turing GPU and try to
boot up with nova-core.ko on the system.

So it's important to avoid getting into trouble in that case.

thanks,
John Hubbard
