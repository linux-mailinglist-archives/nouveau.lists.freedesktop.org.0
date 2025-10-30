Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 54C2DC1E004
	for <lists+nouveau@lfdr.de>; Thu, 30 Oct 2025 02:14:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1DEC510E879;
	Thu, 30 Oct 2025 01:14:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="Q088cA4j";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from CO1PR03CU002.outbound.protection.outlook.com
 (mail-westus2azon11010023.outbound.protection.outlook.com [52.101.46.23])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7776010E879
 for <nouveau@lists.freedesktop.org>; Thu, 30 Oct 2025 01:14:07 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RxcVuqDGdDdz7TNU/62rMN8tcSxsz4ssYrZzD6QtzGgI2EWGGvxFm/rIo5B6OCu6UQHI6w2IMywtvCE8q9frekMS8L9Gnr/bsRCaMPYgUfTA2pguAse18CJSBDg/Gmz3nBqrJeWVab6QCxmIranhwF5frqzEADjTx9QY6hr4GKBBFfrV92cDsVOiP3bJPA+yeShSdj27oREeXi9Y7NCtBoBFzboii7q8Rv/wJQJI1bHd4b01MOrJiSkxDgG1dAlh7oWWnBltONuRfYubW5Ez2ej/c3mhy42fuNhukKnhyULxJGPwZDEcyv405Dhk9wYzKoq5FtDwpNWxzIGivPYXmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=91fNc0hfdXOLnOVeX9e11BYQWLH09ZeNoEul7hQw3Ac=;
 b=HBgaKuRr4wXlAoqsAM0p4vj0NWVAx3OI6goLBkqL3+N9EbuY6Fv8EbYgfgVFXJmZviS4v+1paR/1igQO2Vhfm+XzNr9jfKu4aem0F9NFk5AqjRX7Kg00gL9D1+e1pxBhZ10YCsrAQqDLYdbFBwRfXPgeFBFT4bbzDcB1extdHLowQyWFITfx0sh7t8P4EJk9LWSk6gTz06zKXt1GS4UL7Ql07lTgVF3eNTbMzBfneCBc1jmuLu/KUFVRgyxpDV4knJjRS60G3OSXX7BYKjdGXlB4eR7vKL3Af51V3Kdyk702PSsMh9NhX5Afqd3q/kidJupDqgIX7p61y0ERpAURrA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=91fNc0hfdXOLnOVeX9e11BYQWLH09ZeNoEul7hQw3Ac=;
 b=Q088cA4jGVBLW5Veg0yqhbb4voM6/ARPFNDUfmm8Ef8CE6q8Fc2IjouGse/bmgMat3I8b/zZo4Aa0TsUP4UgFs9zM3BIobt32B0A8EIP5wFHHFr5cjTHAI1SwXecwY3bITidFM2oFZ3XlzMoH2bVsoyXmpY9q9cYgonoPJphyjrjjdbZ11+5Xz5K+tY1D6m9CroiJAY1ajootOJXxodnCws4Prr7IzCWWRXV9pALDSZgitJyCOxXVKAwr+E7oEdJQkETwQZmo/VAziaXc56GeIkNI5FcQGjN32bQA7bVDw0skDTaTqP4tgsRei6/ij5YMyQCP+ahZwmYQ6l7EYVFkw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from BY5PR12MB4116.namprd12.prod.outlook.com (2603:10b6:a03:210::13)
 by DS0PR12MB8526.namprd12.prod.outlook.com (2603:10b6:8:163::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.13; Thu, 30 Oct
 2025 01:14:01 +0000
Received: from BY5PR12MB4116.namprd12.prod.outlook.com
 ([fe80::81b6:1af8:921b:3fb4]) by BY5PR12MB4116.namprd12.prod.outlook.com
 ([fe80::81b6:1af8:921b:3fb4%4]) with mapi id 15.20.9275.011; Thu, 30 Oct 2025
 01:14:00 +0000
Message-ID: <41b48a39-a408-4968-a98d-17e771f290e8@nvidia.com>
Date: Wed, 29 Oct 2025 18:13:45 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/2] gpu: nova-core: add boot42 support for next-gen
 GPUs
From: John Hubbard <jhubbard@nvidia.com>
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
 <b8796ee0-05fc-48e1-a075-2bad99b938d2@nvidia.com>
Content-Language: en-US
In-Reply-To: <b8796ee0-05fc-48e1-a075-2bad99b938d2@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BYAPR02CA0070.namprd02.prod.outlook.com
 (2603:10b6:a03:54::47) To BY5PR12MB4116.namprd12.prod.outlook.com
 (2603:10b6:a03:210::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY5PR12MB4116:EE_|DS0PR12MB8526:EE_
X-MS-Office365-Filtering-Correlation-Id: c5b747fb-fe02-4d6c-3050-08de17519bce
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|7416014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Tk16ZWUzQVdNU2dBaHZhcUk5MnZ4SmdKRXYxQzFpVFhBSEV5MFIyUXc5MHYy?=
 =?utf-8?B?WFFibStaWXg3ZHVDN1E3WEhRRXNsOFNscUxReWFVQ3RJNnF0L1hPODJWZkQy?=
 =?utf-8?B?T3RlcUcwWW8rd1V1MWtUYWJoVjZla0lpZVJjdGNtdkdlZ2xrN3FMd3NFZThm?=
 =?utf-8?B?bEY1RFd2UUZXMUhUbERubUQ3RUFGbFJ0ZnNHVy95eXd1eVZJQ3BENXNKQmNS?=
 =?utf-8?B?bnVtU21VbXcvSG41Y3ZORmtTYStBOWExRTl2RXVxS2VQb05Kd3NBdWt3REN4?=
 =?utf-8?B?RVZ4clFMTU80WFVWNVFtZzNSN0J5ZFlkUURNUnNZQ0puMlhvb3hQR0pLTjBS?=
 =?utf-8?B?dmNrSyt0b3Y4a2g3M0p5U3ZNME5zUUFEWno3S1BhWFJLNU1tUmJidnFpYzNH?=
 =?utf-8?B?aS90V0c2eXUrR1phOGFST0R5a25KemhMRnowQ3lyUkpOQ2ZMYmFJY2VNbm5q?=
 =?utf-8?B?SGZUcXlBeWtpbXAvSzBvcitBajJJWkRXeEpIMU5xWVdkY2xwZ1RHc2FMUCtO?=
 =?utf-8?B?QnVTVlNlN1Iwc2JOaXo4enhtcHdvOGRUbDB4ZU44M21iQ1RSNjF5NHE5QUpD?=
 =?utf-8?B?bmpIMjNtODIrVHRMWUlDOTJ1Z0lmUWF1YllmamF6dEJZTk9jbU5aNkgvMTB2?=
 =?utf-8?B?YmV2UEY5Y3hzWWNlWXZ6eW9wQkx1K01aNXZNWHo3a3RwcTlPWXFvSEd6TVVK?=
 =?utf-8?B?SjZTSmpqWlhqbllpaWl5cDM0YlhHL3dDN29XMkZ5YnVLdkJ1SU9PRzBwOWpR?=
 =?utf-8?B?dnhqc3RRcmdjNm9MVXo0bWFkSUtlL3ozRUdHQjVlb3NUQ2toTHpad045M1lE?=
 =?utf-8?B?b1N1WDlab2hBVEdCYXRBUmQrMVVKS1NmNTUySGs5YW02ZStneWRWVmFQMFJa?=
 =?utf-8?B?VWhiM016L2I2K3ExMit5UUZJdXBhOXAvT3k3eVN5cTAzMUJwZFI3a0k4Wlhh?=
 =?utf-8?B?TGVXNDNkMkxIYWFvSFMrV09ORCtUS3N2VEhOTlR2Nll3ODVFaEwweUYrYk93?=
 =?utf-8?B?SFBSY2lNZk9Na2JwSnhMSi9zdzk4cjNlSnFZeFFrNkxzUk1NS0hEUGdMUVZZ?=
 =?utf-8?B?Y3V1VjQ2RzY3VWhPWWtZNU1maXNva0xLZUNOUldwRGcxd2JKNzBUSXh0L2Ra?=
 =?utf-8?B?elI1THhFc2dmMjJrZVpqQ2l6ejJNeWpmVHV2ZEJ6NUFoaHcwWENxNjk3bVJj?=
 =?utf-8?B?N3kvaUFWVWVNL3MzVDA2RnlaSDJEUWFJRVhCWFpmV2JlTmgwOWlkTEhOYnJ0?=
 =?utf-8?B?NWZuT0ZoMHF6WXYvUENodnNEd2ZDK2VzNW5DeFRNTUNaQmJGZ3hCZERNeVIv?=
 =?utf-8?B?RHlQTHhiR2RwMGFZck9jeGxaM1FYTjVQZVJQWEdrRWdrZ3M4N0dEaXhMU3Z4?=
 =?utf-8?B?L3VwNzlmZzNQSTRVMVFtM21oZFFJWk1YbkJhSXd5NzkxTEhWY1krQllJcnJB?=
 =?utf-8?B?TDU4c2lhSkxscDB3ZzRLbjlVbW9odURYazVYRGJMdzU3S1VueEp1bmMxOUtT?=
 =?utf-8?B?MHpwc3A4VjFXVWRWUVgxTEw1dXpVNFBEcmRJbFlrV0l2UTd5MFMyK3BxMzBO?=
 =?utf-8?B?R2VLOG5MRElDUElvN2NkTXdXM0JGb2VFRHpJMlI3Um9NS1BsZlhHTUZuOHZQ?=
 =?utf-8?B?K0VHK0hPN2ZNQTVKSmN1aENJZllVbWovdFptUE9lRHJkRkd4TlVMRXFMUXV6?=
 =?utf-8?B?U3lZZEZVN3FDLzU4ZUQydE83Yi81NDlVa3Vxc2lLVmZXNWdwS1Fxb2loWWkv?=
 =?utf-8?B?cGJwQ1VWeHBnWHJCUmlBWDJKUnFjQUNRaWlyYzI0aXRmZ0s1cWpaTWxnc0lx?=
 =?utf-8?B?RE5lbW5ScXI5NnFVVGhkek1GajRDM1JNcXpFRk0zRkJsTWNGWWdJakgrYy96?=
 =?utf-8?B?Z1RxQlpkWHpQT0FPbUYrUDdWYWw3YUVZZmN2YXBTY3FOOGpTcXJWUnZvZS9C?=
 =?utf-8?Q?t0jL1VvhcIxvAp5h4cukopmjZ0SReB0p?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR12MB4116.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(7416014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aHFOZ0dFcU5RMVNhVTYxVy9YTU9BaE9GSTBoTThpZzJRL0FFeElJZm5HUHRu?=
 =?utf-8?B?VkdnTnZiNy8zQXJOWnZjT3BiemlYdmcyQWJqaCtxOGNXOWlFUHhjMmExNktI?=
 =?utf-8?B?cEhVSU4xU0NrbCsyaUF6cGFoMkRSKy91Wjlua21MNVBlQWZ6L0haWkFKbExU?=
 =?utf-8?B?WEkvY1lSQUQ4OVNnaTBCRVRVSkpCQnZ2R2FkNkJueCs0NVRiemNpeWRWYnNm?=
 =?utf-8?B?TEdDSit1YjZNNVZ3VmQ1RHlTSERjMVdLQXBDY0FvUWdZQjFna2JGNnNtSXpp?=
 =?utf-8?B?cFFZWDQydHkzdEJNS3hwQ2xZUDRCUEtjcUQyVVNLTU9yZGpqLzBSQ0dRNE44?=
 =?utf-8?B?d3NpTCtzVW5OVkJqdUxtSzllKzdIV3MvLzM2SFRmVWNId0tCUnBBa0dtMDV2?=
 =?utf-8?B?bnZ1R2V1RzhFUFpPdVRjd2pDWk4xdkZ1cy9HRDBDUVBtQkpnU2V1YXJaWUdO?=
 =?utf-8?B?RUpSTmR1UXNheW4vcXNVRkJkU1EzOEpINmMzVDl2aWFXaGZsNnE4dmdxcjRI?=
 =?utf-8?B?aCsyL09DeU1UanBFeFArMmxnWnJ1TmFBVUU5RHBxak14VEJPcTJvb2N0SGtm?=
 =?utf-8?B?dFlvbksxbWZJSTIvaitIdzJlSVlyM3FxRy9KWVpaRHFZQjNSUFp4WFpIWDBa?=
 =?utf-8?B?L0NPbXl6VGJYTXBJbk5MRnVORC84STVYTHhLek9HZUZJQWVKTkR5WWM2M2RW?=
 =?utf-8?B?UE04QkpEY2s4ODN5aXpQcitXYVhGR1BYYkt6YW5DaHVoL1dEQ1hUYjcvOUcr?=
 =?utf-8?B?U3lWK1ZUS2lETGdKZDc4b3ZLNUhKVWliR0ZKaWVkaFJ4T3IvSnhmbjJYaXNW?=
 =?utf-8?B?NUlYR0wwTEhOdUFqY3RQdk5EYTQ2OWk1RC8xYW5xUmNNRFRjMDRpb0FtWlNE?=
 =?utf-8?B?Tlptc0pha2wvdTkwN0FVSVpvWVVpT1V4L1pkakpCNGVNV1Jkek9zaWRYZUt3?=
 =?utf-8?B?VElydWxDQnpuanVGSm9XRnZGbjB2MXNNODBNUHg5VnpYbDBZVUxERngyRlFQ?=
 =?utf-8?B?aVA0c2hKQ3B2aW1IUzZQOHZZUmZzMG9ib3ljLzJEYS9FMHMyWURwWFdkVDIz?=
 =?utf-8?B?RS9pN2IvdnpoaW5xdE5wN1REVU5EeTVWUVo5NkxhZTZ3dkdneEJHLzB0VXdF?=
 =?utf-8?B?WXFaOTRLN0tENDZ2b0lHT3RSZFJkQll2dVdQR1gyanJ6TXIyelBXUjdCSE5Q?=
 =?utf-8?B?YW9qZWphM2tIb1FkT2owcVNxb05GaDhxM01ONFNRekFtQ1dIV1phejkzVG53?=
 =?utf-8?B?Z1hXajBqcnBNMzh4eEhacEJWV0xzUFFXd1k1Snc5Z291dWZ2b2FUS0g1TTBr?=
 =?utf-8?B?MjF5UFU4d0JEM0RrbGtJU25IWWd5eHRLVk1rUW1qZGR4bmdLQnlUbGhwekRD?=
 =?utf-8?B?aTl6YXBnS05SOVkreXdLQjJSTzRQMjJUM0ZNUkVKWDIrYnZ4SUtGdlB2QXV2?=
 =?utf-8?B?LzNOWW1iOGJIMURCSW04U2V5YUdBZXJrdHcySHUxY0tXZmdBVEp5bVU1QVJV?=
 =?utf-8?B?ZTZyUmYyQ3A1Ylc5aUtvZktKaXEwTXVZN1N5TGR1NDRCQTVuWWJVTmoxVUc4?=
 =?utf-8?B?dG5SdkJjc2NmVnFlaVNqSlBlcVovNC96SlYvMXdhTEtzYWtPUTZHVnJSZ2JE?=
 =?utf-8?B?MVhvRDhHMDgrT1FJUXdBYTBwVks0MU9PYkQ5anU4d1hmK1VmeTVqWE5FU0Vn?=
 =?utf-8?B?ZHkrUkw0T0phYXdZZWtLSW1OeXpkcDk2eXNGWlN4TGJtRmVzR21oellYVGhR?=
 =?utf-8?B?TjRzZU9pZHRrZmJvMS9JMExkT1RMeTVJYkc3U2xqMW9uK0lUVmk5ZnJmNXF6?=
 =?utf-8?B?MWtteVljZ3VQd0lhaStWSGgwaFFqRHBOZWZUOVoyZEpxTkJIR3pVejhkK21C?=
 =?utf-8?B?aEN2TUxscnJzbkJVY1AvLzhtMy9hTkJka1FJZFhsOWp2bTZKck94N0ZxOStk?=
 =?utf-8?B?VVZocVhWcXpMbktoc3g3N2VKQVQvWUVRNzNVU1pJRXI2TzVOZGNVVXlyV3lx?=
 =?utf-8?B?dm9sUnQ5ZGNHY2tnbCs0dlVSSmtRSWRJcXJKTEFuYldtU2JnVWg5cWdNbmY3?=
 =?utf-8?B?a3o1Kzd2OWQ2dEVPeWpLWWZvaWdBOGxUSVdoRWZlcnRQbHNLTTJJcnhsdUlD?=
 =?utf-8?Q?xHLCcDSmS0jjiXTCsi0A34nAu?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c5b747fb-fe02-4d6c-3050-08de17519bce
X-MS-Exchange-CrossTenant-AuthSource: BY5PR12MB4116.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Oct 2025 01:14:00.8142 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MR+RbVDHHB8kdb+NsqEkNDHIp31B8PnaCZt98g1ro7BoyPWoT0T51HpFkwH53eyjFEL0goADSxnwntFGxt8swg==
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

On 10/29/25 6:07 PM, John Hubbard wrote:
> On 10/29/25 6:01 PM, Timur Tabi wrote:
>> On Wed, 2025-10-29 at 17:35 -0700, John Hubbard wrote:
>>>          // "Future" GPUs (some time after Rubin) will set 
>>> `architecture_0`
>>>          // to 0, and `architecture_1` to 1, and put the architecture 
>>> details in
>>>          // boot42 instead.
>>
>> I don't want to kick a dead horse here, but aren't the architecture 
>> details already in boot42
>> for Turing?  I thought the whole point was that we don't need boot0 
>> any more, and only Nouveau
>> has to worry about boot0 vs boot42.
> 
> Yes, but someone can still plug in a pre-Turing GPU and try to
> boot up with nova-core.ko on the system.
> 
> So it's important to avoid getting into trouble in that case.

In fact, here's what I have staged for the next posting:

impl Spec { 

     fn new(bar: &Bar0) -> Result<Spec> { 

         // Some brief notes about boot0 and boot42, in chronological 
order:
         // 

         // NV04 through Volta: 

         // 

         //    Not supported by Nova. boot0 is necessary and sufficient 
to identify these GPUs.
         //    boot42 may not even exist on some of these GPUs.boot42 

         // 

         // Turing through Blackwell: 

         // 

         //     Supported by both Nouveau and Nova. boot0 is still 
necessary and sufficient to
         //     identify these GPUs. boot42 exists on these GPUs but we 
don't need to use it.
         // 

         // Rubin: 

         // 

         //     Only supported by Nova. Need to use boot42 to fully 
identify these GPUs.
         // 

         // "Future" (after Rubin) GPUs: 

         // 

         //    Only supported by Nova. NV_PMC_BOOT's ARCH_0 (bits 28:24) 
will be zeroed out, and
         //    ARCH_1 (bit 8:8) will be set to 1, which will mean, 
"refer to NV_PMC_BOOT_42".
  

         let boot0 = regs::NV_PMC_BOOT_0::read(bar); 

  

         if boot0.use_boot42_instead() { 

             Spec::try_from(regs::NV_PMC_BOOT_42::read(bar)) 

         } else { 

             Spec::try_from(boot0) 

         } 

     } 

}

