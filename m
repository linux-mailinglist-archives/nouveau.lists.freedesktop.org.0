Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D014BC40476
	for <lists+nouveau@lfdr.de>; Fri, 07 Nov 2025 15:17:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E8A2110EADB;
	Fri,  7 Nov 2025 14:17:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="emzV4/hW";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from BL2PR02CU003.outbound.protection.outlook.com
 (mail-eastusazon11011023.outbound.protection.outlook.com [52.101.52.23])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 16B1E10EAD9;
 Fri,  7 Nov 2025 14:17:25 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eZxBvI3YwWG6GwpCwOozIrwelbfJSUXgm3cwejIelt3/xxr4zyJIdoZ7R+86OTlYFNS5XZwjoAHdGQ3Jt9HYBaOtYbRKMIy8kuOmHag0nxeEJBRVR8JHuGUKpHxJlObMRlwgHWIw8C/zCxGdp9ANcWe+qvG6jcad/r1gVm1zrxiXcNGhkWFkjfV+3NDwFjL0w6TdtfedCVRIlBkPmxcX0Ybmd1JOVKDe6rkvNcmi+0tS629y4+kOmfZlGZHsdvzL9cILk3qO65Mby7hO6R4TNdJqGBoW+4QyND1Ud43JRntlhYiL9KjrCPo4B2/NsTVa0vc8OasMaNdJj1FJCapnog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PIFrT7cN9le1ifxX4cGQjn2QXES7A29Mlfm4BdRAf6Q=;
 b=grvjMeF745k8D0ltMjxQxVniW1jg8qk6G5wI3tlhfb4JycXFqwS9tINSDVp0lUOuhLcKeZdbC07kb5fgUmHvPhjpKomnW43XrQYTObmg0uXPFoRja47BId8Z5HMDupyOv3JGcPbF9T6sQs05Xro0c5sqBp4PIoXoQR9sSUX9leHOGY6VBcsjD2JQdwVgBJl4SzfKg76Vq/IEfkwNL6QXs4Lwcsx44zKP6FrVd5uSFjotm0+wj6ngOWzxIXKLdpUOfMyv7qstRbrc2ROg49VXz+LeScIjpJ9uKkUXe6PX0h03XPCSQKUf8Hox+xcN8YW5+U5hSwsJZYtuu83633pPRA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PIFrT7cN9le1ifxX4cGQjn2QXES7A29Mlfm4BdRAf6Q=;
 b=emzV4/hWlFPwBLHZ9kvaDrrOF892+Yg4YPN7KQJVfz/USPdo9kJFdXUVCjsyEVIY1B8ciGVAJR8LbFJZzjOJw62Wb2NWwf2QTiq3759opCLRH9yZvwg3bszl7qrUYW0VSmB3NliAif7b+kN4avZv5qOq8R5PAPyGRAgGbSNFoXV6YwDoIA9PsoIOSyGQ00C8npXFZeNFSZDDKVMkKFgIjvxU/L8ZNu6qBvzo+QZxn5hjcgaYBFTxeufNvXymkL5IuiZ1wOcWdVHahgfJ1rUnUdNexrZyGJQPqStfRx+yLzFcuwI2pR5KSU03XygLE9VfW4BIdlyobNilf52FDw5Zcg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by PH8PR12MB8608.namprd12.prod.outlook.com (2603:10b6:510:1bc::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.13; Fri, 7 Nov
 2025 14:17:18 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9298.010; Fri, 7 Nov 2025
 14:17:18 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 07 Nov 2025 23:17:15 +0900
Message-Id: <DE2IZB6X5QQN.NZHOR450WZSZ@nvidia.com>
Cc: "Alexandre Courbot" <acourbot@nvidia.com>, "Joel Fernandes"
 <joelagnelf@nvidia.com>, "Timur Tabi" <ttabi@nvidia.com>, "Alistair Popple"
 <apopple@nvidia.com>, "Edwin Peer" <epeer@nvidia.com>, "Zhi Wang"
 <zhiw@nvidia.com>, "David Airlie" <airlied@gmail.com>, "Simona Vetter"
 <simona@ffwll.ch>, "Bjorn Helgaas" <bhelgaas@google.com>, "Miguel Ojeda"
 <ojeda@kernel.org>, "Alex Gaynor" <alex.gaynor@gmail.com>, "Boqun Feng"
 <boqun.feng@gmail.com>, "Gary Guo" <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Benno Lossin"
 <lossin@kernel.org>, "Andreas Hindborg" <a.hindborg@kernel.org>, "Alice
 Ryhl" <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>,
 <nouveau@lists.freedesktop.org>, <rust-for-linux@vger.kernel.org>, "LKML"
 <linux-kernel@vger.kernel.org>, "Nouveau"
 <nouveau-bounces@lists.freedesktop.org>
Subject: Re: [PATCH] gpu: nova-core: apply the one "use" item per line policy
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Danilo Krummrich" <dakr@kernel.org>, "John Hubbard" <jhubbard@nvidia.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20251107021006.434109-1-jhubbard@nvidia.com>
 <DE2D56N69NP8.2X1SGEBDM92DG@kernel.org>
In-Reply-To: <DE2D56N69NP8.2X1SGEBDM92DG@kernel.org>
X-ClientProxiedBy: TYCP286CA0081.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:2b3::7) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|PH8PR12MB8608:EE_
X-MS-Office365-Filtering-Correlation-Id: 3f6c9fa8-0f9d-42d2-ef39-08de1e085b92
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|7416014|376014|10070799003|1800799024|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?UFJiVEdRRDYvelFoNVZWMVN2eWZrY0ljSzdONGNUenZOaUY2Q0N3Zk9IZ0lN?=
 =?utf-8?B?ZElLVkN4RFAya3lNdk1zN0NvOG9vWm4vREtPRTg2bytaWXlFaXV3MzhRV2NE?=
 =?utf-8?B?MktvU3c3U214UE51MnBkQjJ3QmlVTVFGVWl4S29sOHArSWFPODh2ajRhM3Vn?=
 =?utf-8?B?WVRrQVVyR2twUVdsTzRDS3VoYjNqR3RKV2I0ckJ3OThEVHBLSklhK1d1b3cr?=
 =?utf-8?B?Q01PcW9WenJkUkdlMWRsVHdRRmZjb2N0cjMyekdkYlpVOE1zem5VTWlCaCtQ?=
 =?utf-8?B?c2ludjRZTUVMWE9JNFlpNnkyZmVBQ1ViY1p5VVk2dTFFWGRqdUdHOEwzajNs?=
 =?utf-8?B?Yk9DQ3ZDUzRkN2MxQTJ4ZC8zNkpiNGVtQWZIajVHNmtKZEdIU25qVjZnaFpo?=
 =?utf-8?B?QkszNkRKSnN4VktNVnZXQVhGcW9oZ0ptME55VDZDMmVOTVU1NmpaQXRjNTJq?=
 =?utf-8?B?VGdnUU1ZV2hWeDlFWlNaWTZVR3B0L3ZEY0pYaTBCeHJIWGpNaVZFdG5SQVZJ?=
 =?utf-8?B?VlkvRHB2ZncrLy9aMXc0OUNCNnpKdVhyVWxORTJsbHlVUmN6UGJGSDgvRzZ0?=
 =?utf-8?B?eUNqL0trc1lKWG11S0FSQ1hpWEt5Sk9tbjBjY0F2UGs0YzJ5OWZiSWFhRytY?=
 =?utf-8?B?cSt5cHNuMzRVRjJQUm1zNVZPdE9zVzJoWG9CQjVvaytnbkxCK1U1NFltdGpI?=
 =?utf-8?B?NDNKMXJiSjJWYXRGU2puREJBWWVNc3V2MU55aHJRUkZWRVN4Y0Nvc1ZHQnE5?=
 =?utf-8?B?OG1raDBWL0RSMDQ2cVAwZ1JTaEQ1OVlpRmM1SGEyTGkwZFV5VER6MmJxUmNG?=
 =?utf-8?B?bVRlTkpkSU51QTNYdFFoWVczNitRSzJQVW1UY0xJVkFzNjhGanIycTJFS1pm?=
 =?utf-8?B?TTVuNFI1WVNYanVTNkNDRm8vdC8reHlIZXIwLzlCRWdjWUd6bjNWbjYvSUZz?=
 =?utf-8?B?QXVyd2J3NE9yNXk5SHAzaGY1MjVtUUE0a3dIenBuQU1aL3dRT2R4R0RCVE0w?=
 =?utf-8?B?aXQ1T3ZGYW5LMTJOSFo3eHNZSFNxcnpRTlBzOVYvaDc5ZUVXa0V2b2QvL09Y?=
 =?utf-8?B?eDBmYUQrT1B2UmpsV1g0NFA3UExwWGVsVGRTbGNVREtyMnNVamdrQ3c4cXRj?=
 =?utf-8?B?OTNwQkdHVDhTR3kvYThybnR3K3VTUVRoNGZkMGM3N25QM1M0S1lTdnVNUTdh?=
 =?utf-8?B?NW1PSGE3cVlIQWdVbGtRRG16QmlkZWk2c1k3ZFlUUmhDM0FXN25Vb1NKeWdo?=
 =?utf-8?B?LzFFamtpRGpXbzRPT2tjbmxDWmZyWFJRQWYrT2RFTGEzV0ZyT0JpS2NPNjBC?=
 =?utf-8?B?dXNsMFFmMTJIZUQzaTJHTDFyaGdFVlBmV3daNUpCcS9tSmRKbWp0Zm8rY09R?=
 =?utf-8?B?WFNlWXZBd3ZROHgvLzNBdWQzdG9uOGZjRWh3cWhkTVFUM3hCY3RkVGUzTjB1?=
 =?utf-8?B?NlRtSWVndDB4TzFWVTBDbGZHNlhCUGgybVhCMy9WYjRNL0ZUOGc5Wnl0NVJq?=
 =?utf-8?B?U3haR2tHYnlqNTN3b0tlZUNXeXNvY1NwWVdNc05FNURBV0xZbThjU0k3UkpM?=
 =?utf-8?B?MjRneGZRek5KL29PaFlRMHMvMXN1a3JIcmluQ2t3S3dhdE9ucWkvbnZ4cUJ2?=
 =?utf-8?B?amZTOXhScmJndGtEUEl1L2MyTlBncytZamI2c0UvTGQvWnJFOGtiNndmS1lw?=
 =?utf-8?B?cVVLRm9UYis5emtmYWRlcGtJU0tGaTlucytVL3JNOHRnRHQ3Y0dsYWhQVHZQ?=
 =?utf-8?B?Skdia2dRbVgxVGNUdXQwZVAvalhpZ3p5TGVaVVM4WE9zNFA4RTV4aGh6b1NK?=
 =?utf-8?B?aXl0anJLQlZOSXl0UzVUL1BGaUl4SVA4eWc3aG90VU1WUlpmSGZULzM1TE4z?=
 =?utf-8?B?NW5VaFEyY0FrZHRIb2xQMVVHWEdMc3dKaTdndFVuc0tFWDhGbHd0OWVBNy9M?=
 =?utf-8?B?bW5JMURwUTRtUWQ1ejRjR1BZZ0V4Ly8vMkJjQkswamxqQlBKZWZkSFc2cXUx?=
 =?utf-8?B?QjdRaGsvR1NnPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(7416014)(376014)(10070799003)(1800799024)(7053199007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TDdCQ1RIaEZyaUlGc21YVGw5YmpQcnFldkhUOGJiMkhHd3RwcUhiZXpzcFBw?=
 =?utf-8?B?RTZnQ3ZnNm9RZnVsRzA5dWlTVldHb3I5MHJVclljVVpuWEJDVDZ3YzhUZVpU?=
 =?utf-8?B?UG1OTkt6NUxzd0x2dU4wT2t2bkdVQTBZMlJ0TGRJV2VkRUVEcEQ1b0NxOWZQ?=
 =?utf-8?B?MmUxMGVJVVVoVmFMeG1laXBucmt6M2x5aG9qOE5xaWg5ZkpwWEtERjZkb3Rn?=
 =?utf-8?B?ejJhWC9LMi9jSUt3c0lBZEZZNkhvbDgrS1RGTGl5K0toanhzekJVeEJ1aHpT?=
 =?utf-8?B?U3ZnZFNrc3BmaFFrbE0rY2o2YVhNY1F4Wkk4UkY1UUY1UHloNHQwTkRML3lJ?=
 =?utf-8?B?bEM4c0hRK2JKdjNrRjVyNUZzSXRJaUIzOG51a2dlaHJVTWczMUplSHBXcmlM?=
 =?utf-8?B?a0k1SnBzNmZ4SXRNektZVnFhbTlkem5JcVVDTmV5LzI4U0dBNERwWkpVUXk5?=
 =?utf-8?B?UW8xbENNRVZxR0lSUGtGT3dsR1dnOHliaU9yYjl6OTBucXJDYU1rSFA1Zk5D?=
 =?utf-8?B?YVJpbHlMYXpZZy9ZOVlTcE4xMFR4VjZFOWZyOC9yaXdZWVk4dnpvOGFXdGl4?=
 =?utf-8?B?UmFoUld5UTB6S2JyWTFiQmNxWHZGaUxNd2JFVDFCWDlZQVFNWWJEaTZCVGxC?=
 =?utf-8?B?VlNyd3pNUW9LNVVZNk03SnpwVjV3SGVCMkZjZFFsOE4xa0JXeEZqZlZFZ0gw?=
 =?utf-8?B?Lzd5a2xiK3ZSekh6N3Nia0JIeGdHZXZLSDJKeFI1TnhtRXF6cjVYYk1KUG54?=
 =?utf-8?B?YXVBVXJDY1BlQ0JNWC9uNGkyNFdzakRmMzRDdkp2V1k0dlZ1ZTBzQkhOQmRR?=
 =?utf-8?B?U1lYTTdwNDMrNEFRU1N2ZDFmVVRnc0YwWE5vSnlTZXlmY0x3SUtpNjJaRXR2?=
 =?utf-8?B?VlprNmZnWEFNUU10ME4ydUt2ZlNTWXBWTkkvTWdBMkcxWFBsazNMT3prbjM1?=
 =?utf-8?B?UHRRYmFyUHdqcm9YWTl6ZG45UnB1YWhsWk5lVk5UZUVaNjVxTEc3MmJaK3Bk?=
 =?utf-8?B?ZW5CSFMrenFhSEVTMEFlbHdmbms4ajE3YUFrWVQvbkVpN1g2eW8rWHpmcldN?=
 =?utf-8?B?TjYva3ZaRVUwVk5SUlJiQktRWHNCWDlOMStwSUt2YnBNZjkzUHJBMHk4UU9F?=
 =?utf-8?B?dTlkcFM2d1ZINFVSK1ExNGRmUDZwVmZMQThHZElrWkk2MitMM0dMSFE4dGFB?=
 =?utf-8?B?aHl1dWJmZ2czeUlHdmUwSHlKN0lFaDdQdGZ3MGcwcUtHZ1RXSTFER01SOU03?=
 =?utf-8?B?NTB1R1JqUXh5WjBEcXkzcWE0dUw0RW9VWGFCT2creURaZm5TNGRDRGJXeGF0?=
 =?utf-8?B?TUh3K2ZHbE1ybnhhVTk0ZE9RVEswTUdrL1Q0YTlOcDd0dU4rL2dIaG54T1dQ?=
 =?utf-8?B?RmR4dExLSkpKOVBEOGgwZHRFWkMwL1g3ZEk4NithNVQwSlluM0JjVS9FUmpk?=
 =?utf-8?B?ckhHYzJJbHFsRyt0NnZteitxS25YZWNBNXlYV2pxWTNDZitiR3JkZjdvTjIy?=
 =?utf-8?B?MHhFejdJT3BTNW5jbmRMc0JNcUxSNjJObDYvQXpYbXdyTU1XditSbkJEclk4?=
 =?utf-8?B?UXRvUXVuMGJDUEVxZ3RWdG56ZmQ3cVVkT1FDUFQyengxOUMxZVEwNDVuWGlw?=
 =?utf-8?B?cGxSTG50bHFwT2M5WUlJajRjc0E5TVRPd1F3Vy9uangrL3luOUl5VUtBNkpM?=
 =?utf-8?B?bG02NFpmYndJUnoxVDFDYzJjbzlGa0VaNW9QSUlmYjZpQUpBWmVaczk1S2ls?=
 =?utf-8?B?NDFmVUJia1RBNnJHVWJOT3AvNng5RlAzc3l5N3NNamUxZDlyYmtZNUtOSEIy?=
 =?utf-8?B?c29LaERNWDY0c3NaUm5XWHMrNWQ3UmpVL1p1by9RRldGQU5HUjZmQlhnY04x?=
 =?utf-8?B?Y2pqMXg5bG1CcjNsWDVtNnlWTTgvNVRDTS9ZVjdGS3ZMNUNSbUR2Z3NNSDB0?=
 =?utf-8?B?dXd1dHl1RUN1RjQ3SHc4L0lmMnhrQXArOGpUU0NyamlkMFZEbFM2OTZSeGpN?=
 =?utf-8?B?VjVFQWZ3Z2xkMXZ0VmlTczhRYTlTTDlRVk1SYkpTYktoVHg2a3c1STdqQ0hJ?=
 =?utf-8?B?ajJ4Z1ZkRnYvTWZMOTZXVTFkd01CR0NBYjBoVlR3Wkl6VjI1SkN3cUZDNVpX?=
 =?utf-8?B?M3JhS21UQ0FTYk9XekE0T25NMFcvQkZLOGtUZmsyczlQS1hWVEd5cDFZUkxm?=
 =?utf-8?Q?YlbQEOqjqWRG2iCz0lwHlJn8s6h5/jeTGtVojDOgiY/l?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3f6c9fa8-0f9d-42d2-ef39-08de1e085b92
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Nov 2025 14:17:18.0223 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DNKvM+Nkwn530utkcAIfkQALwnpJvGSX0hTzpgsITshYaORSCV8iJatczW2QXGzyZztVrn6CF3Y9PhuSMEOg2A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB8608
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

On Fri Nov 7, 2025 at 6:42 PM JST, Danilo Krummrich wrote:
> On Fri Nov 7, 2025 at 3:10 AM CET, John Hubbard wrote:
>> As per [1], we need one "use" item per line, in order to reduce merge
>> conflicts. Furthermore, we need a trailing ", //" in order to tell
>> rustfmt(1) to leave it alone.
>>
>> This does that for the entire nova-core driver.
>>
>> [1] https://docs.kernel.org/rust/coding-guidelines.html#imports
>>
>> Signed-off-by: John Hubbard <jhubbard@nvidia.com>
>
> Thanks for doing this!
>
> Few nits below, I assume Alex will fix them up on apply, so no need to re=
send.
>
> With those fixed,
>
> Acked-by: Danilo Krummrich <dakr@kernel.org>

Applied these suggestions, thanks!

I've also noticed that sometimes the trailing `//` on the final line are
not always necessary if some intermediate sub-blocks already had one,
I've also removed such cases that do not affect rustfmt.

Planning on pushing tomorrow.
