Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 48F45C22C36
	for <lists+nouveau@lfdr.de>; Fri, 31 Oct 2025 01:05:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB05310EA80;
	Fri, 31 Oct 2025 00:05:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="sV/wcajV";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from MW6PR02CU001.outbound.protection.outlook.com
 (mail-westus2azon11012017.outbound.protection.outlook.com [52.101.48.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 427DA10EA80;
 Fri, 31 Oct 2025 00:05:49 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vx0Ajguvac0FaMZM9n8Yjk+Ul7OSLCO9Sd3PWH1XNw/xJnlA2OU07xL77ulFr6ibyfbhLOrx7UGNBoz5jeSeXi1IXXtFH136oRk1gDj7nfCKwCqUHsFj3+lds3xwCL1j1820411J+oX9Hy/uvoCr8KbWZa74dRIwXa/mcwOU21ZEBJiy0JGrwysoMnywmQoQHYniF7oxvH1oP8UCXFTmH+SR98AoBTVUOLk8z+mV+lzggr2vLyyNXHQYLLrlvWMX7nhpi1Xik4JWRt4cCAak+CtcHm56xty5y0PFO1GCy49CauqmM8t6z9Iss1UE/28frYFnAu0mYWEQlWZ77+xS4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gGDGaOUR57R0POy2SE85wFnXuAHW+4K+ZK63xkLXJ3g=;
 b=Y8xTnQuqnOMT1M5XKdf3WJlIaio4TAMGRzyLsNduMN2nBxgBihH34/H1/iV+4NTHkXdKj45V24quQlckCrPEXKQyB3ucwOtvdhbuBa8ZKI+JtSW0SlzF9V9Niua7HKbA8tHelIDkqPwoQw2nKCRdf+kmpPqHr6ru9xXNVLC/yRtNGi79+O4ZvMDIvRj0hQlcSUVmsSqpUYtcneWur7VLWM8bBGYA/rIK3xXtieo6lACZaJu55EBwIisghM+F4/bD9H4ddoCd3KMKhlDkn0LWWK/1bWpBsAG4BZsnGDAYcLF6en4fduL+F/eMEJgOxqJP4U9/nrIi1+c5JDlArx+VXg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gGDGaOUR57R0POy2SE85wFnXuAHW+4K+ZK63xkLXJ3g=;
 b=sV/wcajVwVdHPWMcKGMzZ35NR5dQEolKAUjRc6C3dNNfpkqVVT2asJF/WTZyA6n0L57KgmTz8zo57xy6OL2JgXggBwspwLJ/uGxwtjJhdM653Ni2uHxEIeBvvx7QBSe3FfoTMZGyZwhjfI5iV1aAkrS+F4f7wReBrEnI+ThxMCtbkT8+NAmZWWr2e7v5dnHrH6xxnDhHr2yPg0oPjJ1f5zxWP+MGgV/GtJrHVk7d1JVlQTmznd285BbMw70aGDZCG4/Ej5yJYZdUXgh3TqYr0Tho5pbPBUzsEKPAbgz/jHWQhX/0MixqN41JcUxaWAwzWC97bPqk/7Yzhp0Hc7ha4A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from BY5PR12MB4116.namprd12.prod.outlook.com (2603:10b6:a03:210::13)
 by SA1PR12MB6800.namprd12.prod.outlook.com (2603:10b6:806:25c::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.18; Fri, 31 Oct
 2025 00:05:45 +0000
Received: from BY5PR12MB4116.namprd12.prod.outlook.com
 ([fe80::81b6:1af8:921b:3fb4]) by BY5PR12MB4116.namprd12.prod.outlook.com
 ([fe80::81b6:1af8:921b:3fb4%4]) with mapi id 15.20.9275.013; Fri, 31 Oct 2025
 00:05:45 +0000
Message-ID: <5fede4c1-52ff-4cd6-a3d3-88fd38e21a6a@nvidia.com>
Date: Thu, 30 Oct 2025 17:04:53 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/2] gpu: nova-core: add boot42 support for next-gen
 GPUs
To: Alexandre Courbot <acourbot@nvidia.com>, Danilo Krummrich <dakr@kernel.org>
Cc: Joel Fernandes <joelagnelf@nvidia.com>, Timur Tabi <ttabi@nvidia.com>,
 Alistair Popple <apopple@nvidia.com>, Edwin Peer <epeer@nvidia.com>,
 Zhi Wang <zhiw@nvidia.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Bjorn Helgaas <bhelgaas@google.com>,
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 nouveau@lists.freedesktop.org, rust-for-linux@vger.kernel.org,
 LKML <linux-kernel@vger.kernel.org>,
 Nouveau <nouveau-bounces@lists.freedesktop.org>
References: <20251029030332.514358-1-jhubbard@nvidia.com>
 <20251029030332.514358-3-jhubbard@nvidia.com>
 <DDUV3MZ58O0T.229A7N13MM1HN@nvidia.com>
Content-Language: en-US
From: John Hubbard <jhubbard@nvidia.com>
In-Reply-To: <DDUV3MZ58O0T.229A7N13MM1HN@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR05CA0180.namprd05.prod.outlook.com
 (2603:10b6:a03:339::35) To BY5PR12MB4116.namprd12.prod.outlook.com
 (2603:10b6:a03:210::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY5PR12MB4116:EE_|SA1PR12MB6800:EE_
X-MS-Office365-Filtering-Correlation-Id: 68fec266-8ba0-4695-1b47-08de18113d48
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?U1BneHhzSWtad3l5ejNzeUZqdTQxRStMOG9LUVNPTFVUSW1Sd1RlVkdtS05x?=
 =?utf-8?B?S2tFS3QzNVVDMnR2aEc4MFdKVWx3d3VmSm9kdHdjQXVmK0J1bFVDVWpEdmpH?=
 =?utf-8?B?NkFydDAwSWZ4OTM2V2RKeWFaTmpoVFBhcmFIVWxqeGZVdHo4aGFINEJXc2Jy?=
 =?utf-8?B?NkZaZ2xsclN1MnRGZTZabVNhbFdyVE1mY1ZZM3BqaDhUMWZ3OXVHOTkwSjFl?=
 =?utf-8?B?b3BPZ2UzZ05rYzVoNUtXVmRrV1B2QVpValRIWkdRMlVodEdqSEI1SDNDc3dQ?=
 =?utf-8?B?K08zbFZKUHlBZ2RNL0l4M1ppSHMzVWVlZG1QcDYvU2l4NEtoZ1NwQ3lqS3VZ?=
 =?utf-8?B?bWEwWnYrVFBMOCs5djJoeWdqb2pNRW9pekFVeHpFa3oxOEZucVhyK0xKK1Zy?=
 =?utf-8?B?SXRvYkdaN2ErY3hRbVJKVHFHdWp2NkkwK096aUdSTGF2UmlVd0tUdTdQSlZs?=
 =?utf-8?B?ZkhjQ1FnU0JzQ09tOHU5cGxTMTZISHVYVXlQQlBRbEJOaUd2bVhhSU9qWlJu?=
 =?utf-8?B?S3cvR3Q1SlNnaEJIcXV2QnA3M0plc2N6OXZUakRkUUdFYmJXRkhUVjVKa3RI?=
 =?utf-8?B?Nlp1MmkxbFAxWExjOXgvc25yb2NCWk4wRkhFZTZMcmZWK1lBaEpGNldkaU5H?=
 =?utf-8?B?dy9mWnMvSXlmczllNjQ2RHRkWDIvaC9jaXJZK1Z4SXc3SlhrU0ozMThPWkNr?=
 =?utf-8?B?cEU2aGk3cnVkRm1qK0F2WSsvN1VPaGUxaUt1dlNiRDJYZjZORWJhUVllZVlH?=
 =?utf-8?B?SnY4NExHZ3RWb2NNOUYvaE1KT3pCQ3R5YXVNWElzalUvSzg1Z2FaVHlSOVls?=
 =?utf-8?B?QkVPa0F3bGNpYWE0cnNMalJad3ByS3ZsTFN5T0pxK3BCT2xjVkQ1SlVtcHBU?=
 =?utf-8?B?bURBa3hvMGt2RWhtSzVxVGdYWk5Qa0tUemx2dGtRTE5Ub1pidERteW1qZHRY?=
 =?utf-8?B?cDdLSm9jdE1EUDBjNlhuSjRhSW5neURWZVpuRUVRUVY5a1JOUXdKb3dyMDhM?=
 =?utf-8?B?a0xoSXNxWWo5NlFXMjJQUWt3ZW41TU1tU2I4Wng1Q2UrT0NVNXptQXZ2d3JR?=
 =?utf-8?B?SmlCbmVyVnpUZkJhS2paeitYL0UrVEhocHVNa1poNDNtNEozbXlYVFlmYzRk?=
 =?utf-8?B?TDI4aG9kaXJGM0pjM284UlByYTdTSnVMZnZmN0lSRW1SSWVBcnJ6YWYxemFS?=
 =?utf-8?B?YWhqWDNUN2JMbk5KTTdkdGVrajFjbFRLNFZEcE1Nd1l5Nmsyei9SVlB0dDMw?=
 =?utf-8?B?dzRZWlFzNFhTKzFsZkhuNWVXTUpXdWxMZ1FLUTRQMENvWnZqR1QyNWtvRG1k?=
 =?utf-8?B?NUlwUFRNNWx6UWU4K2dVMW8ySGo0UTJZejcvKzRZdkpVc0ZORzUxbVZkYnF3?=
 =?utf-8?B?clpianYyc0hobFFrYkZMWUQ5VWN2dFhqYzFLR1R0bVpFWHNyV2FQaEpSL2xS?=
 =?utf-8?B?TURJVVRMK1NDclZzSmhoV2V3Q2NqeTliMFNldUQwYndtRXdKSUpQa3l5ajlq?=
 =?utf-8?B?ak9TQ3YwOGV0MC85aGo4eGcvMCtvTVlzSytLZUZIVUx6cGUvVGo1clNGSHRT?=
 =?utf-8?B?N0ppdHBVMUtPSzhvaHRyVXcxOFB4YUNiOEFVRzJmRmFjSG00OHE2TkpsMlhz?=
 =?utf-8?B?YXVnRWExdktOZmZMWUtNMkhqNVNSL0tiUHVhcU9DU3dKcVNvWjNtWXowbFAy?=
 =?utf-8?B?ajZ5SEtlbWVrLzMxWXc3VHVRZVlodEdZM0tKallLN29sYmZOeER2djVoT2RK?=
 =?utf-8?B?aXE3Uk9ZRlB0TzUvY3BmU203R0ZGUUhkeGNHQ2ZETFU0MHZDaXFMWExNYXBH?=
 =?utf-8?B?SDVJMlpzeEdJS0ovc3N6UmVTazBJa2RtSXN1L3ZPampkMjZ5QUpZNTdsK1NJ?=
 =?utf-8?B?Z3lYZE9ObnVQQUVPWXhWT0JMTWxYL1NHTDJJMzcwTWZXZ1A5eGpKUHJRZStG?=
 =?utf-8?Q?8CUTtIm8bMKvft4oeOgZ43quBp+S/5/T?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR12MB4116.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZFZvdmNiTDJLaXNvclcrZEFVY3pSaTdBVUF0OVNIeVNZZjNIcTM3OHlTbEZ1?=
 =?utf-8?B?SE1qWUlSemZDWGowZDFjRWxHd0pxVjlnVFpsRGg3Z3BDMk1lM0YxazlzdUd3?=
 =?utf-8?B?cFdHZkpzbGVjTk53Z2wzcjF1c1VKckQ0NUhBMTFic2lSTUQwamJpNERlcENT?=
 =?utf-8?B?bm92QTZBODQzbWlPc0RQU2tJUlhwNHMxc3R1ODR4R2IvQUl0NXBRVDFSSkY2?=
 =?utf-8?B?WjMzL1JhWkk5V2F1MDFwWk0ycU5ETFJraVpVeFRVVUdWbWZkWFdBVnNKTVZV?=
 =?utf-8?B?UWV4WDZCbVlnWFdwUnAwQ0JCd1RvT0sraFh5Mll0VEJrTldKSmF6Q0ZYdFFq?=
 =?utf-8?B?Uk1tYTZRSlpoUGtIUVRqaEN1VGhDM0lXVkFoKzJzalR3bmZzVXlBdlc5UXpm?=
 =?utf-8?B?NVNaVGY5U085YkhnMzU5ZDl6bEZMTUoyQnprY1lKblRTN0lvS1dUS3pHWlRD?=
 =?utf-8?B?d3pHc2d6WkxBajErQ2RQWDFkY0gwazhkODJxZlUvK2VuL01ZVk1CVXpwaXE4?=
 =?utf-8?B?TmVSbGEyc2N2aWxKQ2gyVndtK2lpUXNPMDNwOVB3L2MwQmVsOTN1ZFFyZzFx?=
 =?utf-8?B?MGhad05QYmExYk0zZEpZMjJEaDNoYXVtRVRRNkZRY1Q3STFhMjJlTGUvU010?=
 =?utf-8?B?N3hFOHhBeHNUblBwTlJraFpxQm1uQUNJZEVRQlBObVZ0MlVSdDEwbmVGTU42?=
 =?utf-8?B?bXY1UVQ0MGJPbnF2eExkRExZUkpnZmN0YzZFRDJyYndJbE9ON2NTTzZEakxv?=
 =?utf-8?B?TCtWanJadlRhZktrUE84VFlNYzl3ZFpzRTkzZW1YdDBXNG53a1JmbGsyY0xj?=
 =?utf-8?B?aGpKOUFuWUxRdjViZUtGN3hWdDd3eDJKeWI1NnVtZGVuQkVINTE1YkxYczBk?=
 =?utf-8?B?cmtMekYrVXFGV0dqUFZKUG53TFRNdEZ3N2ZGVU9Udi84YUI1SXA1TEJncVRN?=
 =?utf-8?B?OUgrdnV0SWpkUXNzTzNaRUNkTGNFSllvNkZGd2FuclY5STFQbCtYcm9JRWc3?=
 =?utf-8?B?ZjExRHBmRldtYXJ0VTJYYnpKelZ1WXFQYnVZaVV4MGpLaGhMWHo2aTUySmtv?=
 =?utf-8?B?RTljTjZ5VWcya2JnVHFkdERZcFVCamswd2VzeGRtb0JBVXJjVWluYjZkVTI0?=
 =?utf-8?B?MW1sVmk5dkNXcjJWMm0wUzJBZW1NbEE3MVRFMjZjRCtwUzdWNnN5bnp0T1Fr?=
 =?utf-8?B?M0dqR0Y2SzFYUWdvWVoyUzh0Tjk0NXcwWU10WlVwVTRSVVFudGtZTkx0cFVT?=
 =?utf-8?B?WitTSDE5b0xTWStGYlNJZkkyYVd3MTdCRkJDSG1LTXA2TmdkN3J1YVdpYms3?=
 =?utf-8?B?cjIwSjlwYzF0TkltNUlXWFM3QzF2YlhYWTlSc0ZqODNxUEhZMXNyVGtvbDZr?=
 =?utf-8?B?Q0UxMm5uaXNHV0lxeUZHdTU0OUpYR3Bwekp1WDRkRnlGVlcvT0RzcmgxelNR?=
 =?utf-8?B?ZkJYOGMrSXQ2dmJxSHVQWGdjVlQ4ODBnQjkvTUNsZjVSWXAxdGlkd2tKNVZK?=
 =?utf-8?B?Q0pOT2NPbzRRM2xSbWtwdmpiTzNzbWNRTHZTSEltUTkyTE5rdU5FZC9wQXhV?=
 =?utf-8?B?RkJ6UkpDNFg1SUVOQTZMMUpQQm1ReHgzUkp5NFM4Y2M3SGFuc3VuY1l0S2J5?=
 =?utf-8?B?NUJ3VldtQ0RGVEp5N1VEL2hlWHBZb243UmJLaHVtSVg0K2R1U09tYXdCRXlC?=
 =?utf-8?B?MHAwOFZmVGdrc2grbml0eEt3VW1LYXhCMTJNV0NkYWpsNzl6WmFwRjlOMVNp?=
 =?utf-8?B?YlZSQ2hXbGczSVdmNWo2L0FHV1JYNkxWajJWUmNXQWR3QzlEZ0luT09VMytT?=
 =?utf-8?B?TjV4RXhIMVJaZWN6ZDl0ckpNZnR2V2c1dGttOFZHODFiNndyUFpvbDFVTDNj?=
 =?utf-8?B?U3B3VjZEY2lXbGZWblZpQXlSZW44U0YvTjZORy9VeFhGa2xvQjdZbWo2dUY2?=
 =?utf-8?B?cmcxWEFDOHo5YTNmSjFaYnNSV1BBM0tpWVgvcXB4em1WZ2o5OTBnRS9CSFY0?=
 =?utf-8?B?STFSUDVSbFptbVdqV0dYaDcxdFVkanpaL2F4Ynk4SzIvR01RaGRPVXFjRmd4?=
 =?utf-8?B?Wi9GeGlmSjFBMFhZRk5wR0RiZTV4SkI2MkZUYXhOaDN5WUwwQVNvWlBVNStB?=
 =?utf-8?Q?MkmaVZiD61P3WASx4eoUpEWb2?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 68fec266-8ba0-4695-1b47-08de18113d48
X-MS-Exchange-CrossTenant-AuthSource: BY5PR12MB4116.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Oct 2025 00:05:45.6622 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lIGYbo2mnB/SApNVTDKqg1EPFzZolINRCca/Pueul1lZmBcxk3UeEhmszUQBABIxdbmuT5T6csLDSgW6t2IVRw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB6800
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

On 10/29/25 7:05 AM, Alexandre Courbot wrote:
> On Wed Oct 29, 2025 at 12:03 PM JST, John Hubbard wrote:
> <snip>
> Here you can directly return the `Architecture` type and spare callers
> the labor of doing the conversion themselves:

Hi Alex,

I will attempt this, after updating my brain with a few missing macro-
related skills. haha :)


thanks,
-- 
John Hubbard

