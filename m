Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E4F8C427AC
	for <lists+nouveau@lfdr.de>; Sat, 08 Nov 2025 06:19:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CFA8410E04A;
	Sat,  8 Nov 2025 05:19:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="KeatW+7+";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from BL0PR03CU003.outbound.protection.outlook.com
 (mail-eastusazon11012063.outbound.protection.outlook.com [52.101.53.63])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE90A10E04A
 for <nouveau@lists.freedesktop.org>; Sat,  8 Nov 2025 05:19:26 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dp34RqmH4hVCLP2jN/EaZM+cGqo/x6teEIKjzxGiw8+CgVkO715azyHqK7OPfqltHaY7utuHypLtP+5i9Q3Y8qiH022Ip0tvNJq45HrkSDpPmnBsd3OJ9z5jQQtUBBi0joiYm5Wc3GQ/kSebzvrq5xcgFOh6P4KTKD81VoYPenmlc6KvqhfmQulHmAn6HqewctsBxkhvsbXJceHl8DWXJJu+4MyOHYwKujyirNc5nImrZ0v/Bz53vieg7S6yj3L4RRqY7c72hOuvjqnaYM2795S4o+Olw8sG2PMFPfDkwt4j3Fpv6zDizGi3sqRwNBVZGcWRyiNdNR9m/xndjsaTDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=19QObhQGqi1sw6bEJnONh4ftm8pz+dvaRJSOpgHDBW4=;
 b=bdGYHs+ERXjwinOLXLkZeAaLGI84GpDygx9a8Xm9aXhgHNbQEqAGlB5mHSjLwyZFarpocFdZofJ5sdNIpsQ7LdVueDwblUR6XPZUNitm4fzXgZvqzFLNrSHZAKse238y+oZc2q9WyF3r04xS9gu0PBatYgODqBrADTBmitMUYqAvo0ns+cL1zMliGGk/ku8+0iIUsxVVDm3DvoWsLAhttxEWv1cTyhm58/weqkeuMmy7cqHaQCr+srBnHqVDGZOchGcFLpT4zRQeQLRRcc3kD4HbjrIej+UC6JRYLwoQZKDMRv4ak9NmJL89oYxrDdgYKbePme9clSabqy+xa2eYwA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=19QObhQGqi1sw6bEJnONh4ftm8pz+dvaRJSOpgHDBW4=;
 b=KeatW+7+4m/vrMgVRkUJwOArO5WJfrGXgnE2kGVvQs04JUd9bSTf+kgTnN6IzRyo2v09n/HxDh6GjGitLU3BhNSXQHT+hbTblctNHM5CY6qVLAwEpYvBPJ/XQ1DteAPEJHRFLjHpB7jpXU3ES61gXHOuZKyDq8NiUUN/zBCweU+Je3np2XsYV90jbWHglm0UqYDCEwns/gpVnXeGFrzDQJHJ9dAPy1n6GaSxojxFmNCBCrNjsZr0uCODtxcgD592arJjcfZ4y7LAJgVpuCNzXXd3RZ42DkvfDjFsdeKYMkGNrToSbh30TePTsFtOXaVLJBuRTwUCG9k32nXoC3RnWQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from BY5PR12MB4116.namprd12.prod.outlook.com (2603:10b6:a03:210::13)
 by IA0PR12MB8280.namprd12.prod.outlook.com (2603:10b6:208:3df::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.13; Sat, 8 Nov
 2025 05:19:22 +0000
Received: from BY5PR12MB4116.namprd12.prod.outlook.com
 ([fe80::81b6:1af8:921b:3fb4]) by BY5PR12MB4116.namprd12.prod.outlook.com
 ([fe80::81b6:1af8:921b:3fb4%4]) with mapi id 15.20.9298.012; Sat, 8 Nov 2025
 05:19:21 +0000
Message-ID: <b45a419f-a91a-4238-97f3-480491d12543@nvidia.com>
Date: Fri, 7 Nov 2025 21:19:20 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 4/4] gpu: nova-core: add boot42 support for next-gen
 GPUs
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
References: <20251108043945.571266-1-jhubbard@nvidia.com>
 <20251108043945.571266-5-jhubbard@nvidia.com>
 <0c3630727945f806610da8c43211242b9c6162d2.camel@nvidia.com>
Content-Language: en-US
From: John Hubbard <jhubbard@nvidia.com>
In-Reply-To: <0c3630727945f806610da8c43211242b9c6162d2.camel@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BYAPR02CA0049.namprd02.prod.outlook.com
 (2603:10b6:a03:54::26) To BY5PR12MB4116.namprd12.prod.outlook.com
 (2603:10b6:a03:210::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY5PR12MB4116:EE_|IA0PR12MB8280:EE_
X-MS-Office365-Filtering-Correlation-Id: 3be325a4-0f9c-4a04-293f-08de1e865fe3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|7416014|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?aGltb0YvWmhZQ2FNTy83ZXg5V0dwVURiS3doeXF6WmpOb20xN2RObTJkVnR5?=
 =?utf-8?B?ZzZVQU5kOWpVNFU1bFNVUmpKL2E5SjVhckJ5bEgzWnlYRC9pczc1Y2ZDTkN3?=
 =?utf-8?B?Smp5dzFWd00zWFQ0RUZ6aXlvbFozY2RsUlVJR29iNmgrNEtzTXpVV3drck9B?=
 =?utf-8?B?VEhQSFRtVFpQRTZQSzRQK0J6ekFrVmpYRENoOGZtQ1BXK0VoWkFLbjFJb0NP?=
 =?utf-8?B?YnNoMExiV1hjWStXK3lOcHl3bHZQVHh1Q2R3dk5VdFE5cnFvMzhRZlp0eHpQ?=
 =?utf-8?B?RlN0OEwyN1JOQThjWjlaQk5STjB0cGZLRjJIQW1pNE8xVGJublBHa2ExUTIr?=
 =?utf-8?B?WDFoZE1rMk0wSEw0UXBrdmNOL3Bjb3kzbUVmRFk3eXpPQytHSSt0UjU1RS95?=
 =?utf-8?B?V1UvZlpLVVZVMGJiTXJET2xQcG5URWFFNUNvR0k5VWJRSnU2VllxalRrZElO?=
 =?utf-8?B?R2pqRkZidGJLTkhCV3lSeDhRU3ZIOTQ4VUo5ZDA1RzZmNElTbkIvMExNUUNm?=
 =?utf-8?B?c2dwcWhxK3EwMnl6cmI1b1pMS3luOHdtU0tzVHdpY2dEbFFhSkh6Q1Z2b0h4?=
 =?utf-8?B?SjBreHUwZStPVmVQc2RGblM2RGlkaFhDNnY1SVI0NXNNOTJXSm5QYUg0ZzUw?=
 =?utf-8?B?cE53MjlvU3phQzhGekNEeWRzbnRRL3dMWG56VUVSZk9wWmpKODhCRTM4K0cr?=
 =?utf-8?B?cTFOUnJIWUx2SGQzVkI2S1hBN3J0OXgwRFp6Mjk3b3JKc3dzNnNZR3FWaXlH?=
 =?utf-8?B?bXFQaXIzVlN5a2J1V0VtbnYwbDQ0c0V3UzYwM1lTM3NLbWFmYXE5d29ZQ2ZN?=
 =?utf-8?B?aVJLcmFXNHdGd05wb3Y0TElBblNrK0ZRL2VNNzhnMC9yWDJPYmlFcmovVjQ5?=
 =?utf-8?B?OXJsWmZPR2FrUkpGUjZ4V0MxNStqeUhTb2NVQUM2ZjA2MWU3eFN6SDVNMENy?=
 =?utf-8?B?TTZsWk1kWFlsUTI1aSt5Sm9EN2twYVBSd2RtUmt2aUtPc21GUzFobE5LOXEv?=
 =?utf-8?B?NnVRR05YUGEzUnlTUm1JNVpKRDZKOWREZWQ1SnhFTXo0Zk9KR3YvZDkwUXJC?=
 =?utf-8?B?cG5LcFAxN2JEakNEcjRNYVlqM0Z2cG90OWpxblZKeHZXU3Vya0RMTXBlREpx?=
 =?utf-8?B?aEpab3EvVERNamt1MXpvV09TOWd2R0Z0Q01tRUlHK2YvbmhZMngyZEg1eklr?=
 =?utf-8?B?R2J2RVhtRTBTSlIrTmttYjU0VUxYbUtIZFJ0MzI4c3VFVEF4SlhRaTBmYU8r?=
 =?utf-8?B?Z0xDdm4vQXZvTXZRZk8wSk1Lak5TNXQwa2pRMnh3VVNqTktMV1FBbnVVMnI4?=
 =?utf-8?B?MGF5K2dlRUc5M1MxMWNHc1I5aCtONDZ0ZWFjckI4blhxTnd3L3ZsOWNaL0xP?=
 =?utf-8?B?U2JIUkR4cUpLbnFlbTFKRnU5TG4rbG9tUnh0ZWdLUCtiRzR3b1Z3UUVVeXFR?=
 =?utf-8?B?ZTV3bzVTZnZ1Ung1Uk9WS29RV3o5OWpLQjRSMTl1bkVUS2IrbVVBVUowbzVT?=
 =?utf-8?B?aklsYW9vdjZiK1FLby9RTE0wOHdPWnE2b2VXSW9hUDF0TDh0NndXcGN6a01r?=
 =?utf-8?B?Vm5IaFFINWgzaGluR2EyZzZJTklTVVN4azNzd29oTmlwMWN2ZDdZdjZwYXpN?=
 =?utf-8?B?UVBvSGwvd25CeU90RUlBWUpMSmhwY2tKbzNJSVErOGdHK2FMYm9xNWxKaUZE?=
 =?utf-8?B?a1ppZit0SEFaZi93T2w2Mmxiay9QYkp0dTg5YkdTWGM4Q1llbHhsNWs1UTRm?=
 =?utf-8?B?a3pSUFJpcllhTTNNNXZDWC9kNkYvWlluTmhUZENSa1BKM2JkYjhNZ0hjbUFL?=
 =?utf-8?B?Ylk1WGNxNitGOUx4aTg2RFV2cTZMZklDYVlVc3JMa2hXSnhlNzFMNlYvTGt2?=
 =?utf-8?B?WmN0TXNZZy9wYUhEclFLdnh5ZUFDa1lxR3ZOdUlaMnRJMVlsUlRVR2dKTys3?=
 =?utf-8?Q?T0DHY8mxWq8W0roT6ZoHKNXhmNDUZk77?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR12MB4116.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(7416014)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UnhFcVVyYmoveUVMQnNFMnh1MTJIMG1YV2lGYm5oR1A5anJUblhMeXo5aTQz?=
 =?utf-8?B?RXlFQ2kzUVo5NHdCdmhKSGlDcGJhU0tKRGZPTThmQ3FoME5RL0RDd0tlNm94?=
 =?utf-8?B?aTI1NmRRZDFUVXZoM0UzUFJaYlV1N2JtTWlWYVluVmN5cjk1WTlqNE00SWRn?=
 =?utf-8?B?dnQzZ0dlNk9OcWcyY3JPUldrelRaVkRMckQ3a3hKRjBMWWpqYnJFZHJGbU14?=
 =?utf-8?B?Rml3TmFKNFc2d3RoS1NKU21NcjVJZmRQZTREeWVTdC9uem5URW5DRTJLTTlN?=
 =?utf-8?B?V1IxdHo4SDFCS0ZKYnJQU01DZVVtMGh4ZkVBQXpWeWYzUFFROW5rZC9aUmZU?=
 =?utf-8?B?WHlqTzVoVFJIZkhDaWJTMTdIeXFsa1dsT2cxU3YxRkIxODBxc21wWEtrZ1RY?=
 =?utf-8?B?QU45eEVwdjJLV21WSnVXY3o3MUlMeXVTRVA5M0ZkeUtFOEp0Tzk0YjJ6eHhp?=
 =?utf-8?B?a2VjdWpKUTFDcmZLa2RKOUIvazVzTkh6cTQzWmJaZE9QdVZJMkI3V0Rya0s2?=
 =?utf-8?B?bkJpdUFZK1hwWlJObkNsZlNmdEl2aG9mMDJmc3FQSk9CTnZIems0UGJlSVhU?=
 =?utf-8?B?NUhnSEpSMFB0TU0yVDE4akJXSEwxaW1QcDJWNktQdGNjeGhua24rc1dWN0tJ?=
 =?utf-8?B?YldTYTQyMUR1RWxMN0R5Z1E0Q0ZPbFI0U00zWWY3NHQ0QTQxcTVUWXYrZEJR?=
 =?utf-8?B?OHNUeHBqSHQxcUV0NFJ0aEZtcWZSYlhKZUNHeHVWTW9hb01WZExKeUpzSlQ2?=
 =?utf-8?B?NDRyci81aUJOVW5KM3Z0R2RoWk9JWXkwNHY5N2pUNVVpRDhKdGtEWE9walh0?=
 =?utf-8?B?NzdjSnNTVnl3RFNCVjVDOFQ1WjFLcjd5T2MxZlQvNjF0RENsVEV2T2xSQ2N5?=
 =?utf-8?B?UWl4VFM3Mm1Gei9uaVI1YVdFT2daZjNCZWZnbTZDWmtNQUw2VlhOcTBxUE5U?=
 =?utf-8?B?UnZNN1BLRjVrb0ZWWk93dWVWdmNSU29nNFZ3ZjlER3FqQ1F2cUpBZlFPUHdy?=
 =?utf-8?B?YjExeWNYUFYwOHpXV2J3cWx6TXdJZlVJTWhRbGRhV3AxQThBdVQ5SlVSbFpT?=
 =?utf-8?B?a1l2Q2pQb0NVdVpjUzkvQlU4YzZ6OTNUVGhjUXlLWXhTUExERW1iWkhjS0Z1?=
 =?utf-8?B?WVRORU05cG5xTXdXRXMxck5SYXBHd2QzWWxJdW1GaWlod093bTJWRjY5SXgx?=
 =?utf-8?B?UzRJd25rVDFoUzhvMHB6Z01oc3V5a1o2QS91cWQwdkVzYURQOStkU2N5MGk3?=
 =?utf-8?B?cHAzVDdhQjloOWRXK0VtM3Q2NjU0a3pLRmppdDNiQTlvWWt5cEtNMEErU096?=
 =?utf-8?B?ZnVaRU9LbW1DQmk1L3J0QUU0SGlKWUl5OFpVeWUveHZMbFloRk9vcEFZU2NC?=
 =?utf-8?B?UjJlZ0NGditCZThlWXJpeVRPb2gxNzlEOXFjZHMwQWJpNzg5bzd1M1VHZmxo?=
 =?utf-8?B?TmhQYk9SVWZXWkJWRno1RmlGVlk3U0VHNURzZmg5MURDMlVhU1kzQ2hTMzBM?=
 =?utf-8?B?Q0RqVENGMmY0bmE4YVlRcmFWamRPWEVVRlp6OFBJUDduNDVGaEd3YlBrWHZN?=
 =?utf-8?B?cjhHbGxJVUJTT3RFdy84dFFpZEl6bFNVNVR2TXpPK3BFZDVtQTBabGdsSWN2?=
 =?utf-8?B?N0VkOTN3Q0NoUnhSeitkcERWRk0vVWs5eDlnc2cwT2xFL2ZmRW5weE5OMzRS?=
 =?utf-8?B?VDI2N2JXekorZER6YTZhVGdUYzZnajdYUzV3d1Y1aUR4T1NENjNFOTA1aGpn?=
 =?utf-8?B?bUhET3c1OC9WTkl3SW8xMUxvdjRteHNaa213UlR1TXpCUGJuQkE3Q2xPOFk3?=
 =?utf-8?B?OUlucUlBa3gzWnNaM2pGNGFBMmFxejB3VHl5Q3VTdTJqWjlYeXprYTVrUWNo?=
 =?utf-8?B?MnltODlCdUZpYUdmV09tOEhSVko0R0RXZzhXTGxWdVpyVUVXcEtrTEpIVW8r?=
 =?utf-8?B?NEl2Uy9JVHQ0NE56K1MzOVRmTHJ4dEV0TUh0dnk3OHRwMzRWRXRTeFVFZVNI?=
 =?utf-8?B?bi9KVEowT3k2MUN2ZUk4NHBJSjNJWGZRRkZ3VVV0cEhLWjJJK2NSVDFiSGVH?=
 =?utf-8?B?Nzgvd2lQN01GUm5oZDJFVmpaRW9MMFdxUFRxbStvMWlJcTF1Nms3TFZPOHht?=
 =?utf-8?Q?PsbwUvjwGx26v3lT7XJE61BfS?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3be325a4-0f9c-4a04-293f-08de1e865fe3
X-MS-Exchange-CrossTenant-AuthSource: BY5PR12MB4116.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Nov 2025 05:19:21.7779 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OgLVkvf/mVw+UsG5YLvavn8H4KuEIY4JU3i74+ZSJwNe22Nt3rLoveT1WF7LaVD4Hv75CEzdB8Sx1CG5PDtYLg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB8280
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

On 11/7/25 9:09 PM, Timur Tabi wrote:
> On Fri, 2025-11-07 at 20:39 -0800, John Hubbard wrote:
...
>>          let boot0 = regs::NV_PMC_BOOT_0::read(bar);
>>  
>> -        Spec::try_from(boot0)
>> +        if boot0.use_boot42_instead() {
>> +            Spec::try_from(regs::NV_PMC_BOOT_42::read(bar))
>> +        } else {
>> +            Spec::try_from(boot0)
>> +        }
>>      }
> 
> Spec::try_from(boot0) will always fail, because we can't generate a Spec from a pre-Turing GPU,
> so it seems weird that we have it as an else condition.
> 
> I don't think the comment and the code aligns.  The code implies that sometimes we'll be using
> boot0 to generate the Spec, but that isn't true.  However, the comment makes it clear that we'll
> be using boot42 only.

Hmmm, yes, the new use_boot42_instead() logic means that most of the
boot0 logic should actually be deleted now. OK, so I can apply this
diff on top, and everything still works:

diff --git a/drivers/gpu/nova-core/gpu.rs b/drivers/gpu/nova-core/gpu.rs
index 5650c115c613..6d17ad3cec40 100644
--- a/drivers/gpu/nova-core/gpu.rs
+++ b/drivers/gpu/nova-core/gpu.rs
@@ -194,22 +194,11 @@ fn new(bar: &Bar0) -> Result<Spec> {
         if boot0.use_boot42_instead() {
             Spec::try_from(regs::NV_PMC_BOOT_42::read(bar))
         } else {
-            Spec::try_from(boot0)
+            Err(ENOTSUPP)
         }
     }
 }
 
-impl TryFrom<regs::NV_PMC_BOOT_0> for Spec {
-    type Error = Error;
-
-    fn try_from(boot0: regs::NV_PMC_BOOT_0) -> Result<Self> {
-        Ok(Self {
-            chipset: boot0.chipset()?,
-            revision: boot0.revision(),
-        })
-    }
-}
-
 impl TryFrom<regs::NV_PMC_BOOT_42> for Spec {
     type Error = Error;
 
diff --git a/drivers/gpu/nova-core/regs.rs b/drivers/gpu/nova-core/regs.rs
index 5d6397f6450a..018bee114a3f 100644
--- a/drivers/gpu/nova-core/regs.rs
+++ b/drivers/gpu/nova-core/regs.rs
@@ -56,31 +56,6 @@ pub(crate) fn use_boot42_instead(self) -> bool {
 
         !self.older_than_fermi()
     }
-
-    /// Combines `architecture_0` and `architecture_1` to obtain the architecture of the chip.
-    pub(crate) fn architecture(self) -> Result<Architecture> {
-        Architecture::try_from(
-            self.architecture_0() | (self.architecture_1() << Self::ARCHITECTURE_0_RANGE.len()),
-        )
-    }
-
-    /// Combines `architecture` and `implementation` to obtain a code unique to the chipset.
-    pub(crate) fn chipset(self) -> Result<Chipset> {
-        self.architecture()
-            .map(|arch| {
-                ((arch as u32) << Self::IMPLEMENTATION_RANGE.len())
-                    | u32::from(self.implementation())
-            })
-            .and_then(Chipset::try_from)
-    }
-
-    /// Returns the revision information of the chip.
-    pub(crate) fn revision(self) -> Revision {
-        Revision {
-            major: self.major_revision(),
-            minor: self.minor_revision(),
-        }
-    }
 }
 
 register!(NV_PMC_BOOT_42 @ 0x00000a00, "Extended architecture information" {



thanks,
-- 
John Hubbard

