Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BA061C42789
	for <lists+nouveau@lfdr.de>; Sat, 08 Nov 2025 06:10:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 69A8810E345;
	Sat,  8 Nov 2025 05:10:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="QumfGpww";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from BL0PR03CU003.outbound.protection.outlook.com
 (mail-eastusazon11012034.outbound.protection.outlook.com [52.101.53.34])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 26AA610E345
 for <nouveau@lists.freedesktop.org>; Sat,  8 Nov 2025 05:10:42 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CT9MVslMKhKnTwt70+PX9UEquU7OTn2ROI/yKfR/NRkLrzeeztoSEzvEC+sjhGg4cQKKAZZSi2MaI5yA/rxKjbJY1fzOpGkvj9rUh481d//NUcIhC258kB42rdo4YNi/qRRMtMClfkITP3X3LGGLRGAsm5Y3QkGU0An4D94sN1cUdEMF3DlIV7ysHNUy+rpaJbQFpIQY0dR0+NusSUv0v1bA/cb4uJdYBjj3zVhq/S30S6DLls0i+Kno1pUqOQAZQ3efOuJEHD35AX3WS818hShcDELpRKvwkF1fn5FxZSdV5Z3X6SagtMsAD7Fr5zszKzrbZaSfqFalNaoqtdPqGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kchZgqAexcdN9QHoirM4Im3r+2xc8/v88CZVoymCiBc=;
 b=ysF4aU/SWN1YVhehJT7yZvynhMx+tTIWx3rp2uIAh2myE7ROFRAw1YvH3lSXB4O7ah/V+tLtTNYv4gxZJ9ejg/UTYoLVhHQZd5AK0ygPyLC6Hpfw/GpR0tE1+xKuF/e2u6L8w60BcugrpwspRLbtf7ixXFBmL86N9leIgrkN7bBoAdMoJugfMvilNMOWyN1sJv0EOX2mEQnXBsGHfAz3vOjv3Y2vDmJoetoQrXlFtqnZO+/YgIQRZ7p8lS9UDHKV4AC4LQoVM4/oleN6zils6RZrcAmvwQW27xSaU4MWmpOfQ1YbvrT4Zo0bb2rx1OjQcfmE5i7AQrt67T+CB4nsQA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kchZgqAexcdN9QHoirM4Im3r+2xc8/v88CZVoymCiBc=;
 b=QumfGpwwAtGaIl0KvJ0nGNDRo87e+BDqGkAx4SNz4LLiyDDV1ZtRiv4JXpD7nxwx4G98PtXBwP8jFyqqL+ARRDwpWknn1KVovAW0/JoWbodFXPRz26FAad7ZabqBFSO1EuVeVVCF8xh3c8yAUV4dpz+ggJV9wzCjVQIIWDWGrCIpXRiuukSE2m+qERNbyqQUw+UAcO32MqMWkKrim3O8pEIkmt2Lq68vq02goqmlRARWFfqlVwbeqrQbBmbYNZ6aB5FcZk+HhrEKmHmZNTvRWzHOA3LzaB+dQfSfhlnlbAFwvH2WtWr4mtIyNOUVSD2ftlb15k/dDgJp8myStUtwLg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from BY5PR12MB4116.namprd12.prod.outlook.com (2603:10b6:a03:210::13)
 by DS7PR12MB9044.namprd12.prod.outlook.com (2603:10b6:8:e3::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.12; Sat, 8 Nov
 2025 05:10:38 +0000
Received: from BY5PR12MB4116.namprd12.prod.outlook.com
 ([fe80::81b6:1af8:921b:3fb4]) by BY5PR12MB4116.namprd12.prod.outlook.com
 ([fe80::81b6:1af8:921b:3fb4%4]) with mapi id 15.20.9298.012; Sat, 8 Nov 2025
 05:10:38 +0000
Message-ID: <46c4877e-2af3-440b-b8c5-fa9078a5cf9c@nvidia.com>
Date: Fri, 7 Nov 2025 21:10:35 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 1/4] gpu: nova-core: implement Display for Spec
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
 <20251108043945.571266-2-jhubbard@nvidia.com>
 <673640f6b26617bc5e1f4962bc2f9f7257346efb.camel@nvidia.com>
Content-Language: en-US
From: John Hubbard <jhubbard@nvidia.com>
In-Reply-To: <673640f6b26617bc5e1f4962bc2f9f7257346efb.camel@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR03CA0035.namprd03.prod.outlook.com
 (2603:10b6:a03:33e::10) To BY5PR12MB4116.namprd12.prod.outlook.com
 (2603:10b6:a03:210::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY5PR12MB4116:EE_|DS7PR12MB9044:EE_
X-MS-Office365-Filtering-Correlation-Id: 89b1e998-1f39-4765-4943-08de1e8527ff
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|376014|366016|1800799024|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?VmQzRWFHYWtZcmVlU1dpclR3Mk8zQXFLeGFLTVNhVDU1WjJRWkxiRVJRUjly?=
 =?utf-8?B?NDRCZVFWOXJHZ3dLZFFDUks2OVVXRXBwb1NIWmZFeW5XQmFIQUpGejhtenZr?=
 =?utf-8?B?MmtLRVNTejE1WWVPYVR1QXAzZ2N5SFRYV2F0amc2N2Q2NUduejMwYmgyeGVY?=
 =?utf-8?B?UnRKdUNoclMzRm94cEJwYmZVbHpqQXphanYyNTQxTkRtVVp4ZlYxakl3cVdY?=
 =?utf-8?B?M2E2N3dvZzZmYlFwNTRDeGticEQxRmMyczYwQitOcEt2czQya2tiUTBSMjJ3?=
 =?utf-8?B?Smk1T2tydFNhcWJBMHB1Y3B1clRxcnljTVpPbkcrNUtQYkM4V2tmc3kxb3Za?=
 =?utf-8?B?bEgwY0xSVlVkYUtmRmtoa203NEhWOHZwQVU1VXl1RytGWE1kWmNtZHp3NEcr?=
 =?utf-8?B?ZEI4Q0lvZm8wbnMvMkt5Q1p6OGlqTU1VZHA5SkdGUWxRT2JGTVI0TEVyTlVN?=
 =?utf-8?B?bk5ETlFrUkp5Q3hOWkx6clNtakQxcThQM3YxRjF6SkhGc0ttR2grL2diSmF5?=
 =?utf-8?B?bjJoMEQ1amoxaFdFaUhxNzg0WnhTM1ppR3FoYUU0NHk1TkRvWmFkdTliV28v?=
 =?utf-8?B?RzJWcE1iOVgrREdVbjEzakRnalc4RFc0dHpqb3JDZHFuSEd1b0YyZi9zdGlo?=
 =?utf-8?B?MEh3NVRnVzl5M25LRHgvVzluY3BQeDliRU8xNzAvcTYwaFdGd3Vyanp5NStD?=
 =?utf-8?B?ckF0L0UyRGsycncvTVA2NVJJeEJ6ejc4K3ZEZHdCRUNFSGFLdFNjN2cyc3Zv?=
 =?utf-8?B?OHdjbEk2azI5TUo0SGZ2UHZKNmxSbjRmMVhTUmNUcVdOQVFEalU1RE5NZTdm?=
 =?utf-8?B?STZxakZWRDBLcThYNGFkVHNLMjhKVGg3T2dSaXZuczk0NkthSnVLSDM1aFJj?=
 =?utf-8?B?T3lFSmtCYVg5MFlRK2dUL3dGaFJ1d05SdGVHM1NOMjlNdjZUVEF3dmF3b1Rr?=
 =?utf-8?B?YlRFaU5vL0FYZURIMkIvL29WengxUzNnWFFXRlBOa2tpdXdTcmt0MGNacXN5?=
 =?utf-8?B?T0lpVHhmenJYeGVkTXExS1lHQmdaS09XeGlZVE1seFJadk1ob0VnY0xicURq?=
 =?utf-8?B?UFlRT2lHMWlBQ0RQZnlnYVFvaWhEVTNweTVBZjdQb1RIZkw3aEp5NWlMRmdN?=
 =?utf-8?B?Ulpmd0k2dnZlNGdKM2Z0L2UyQXVTMjBFUU1xT285NGRzN2hNeXZKSUVVNnF3?=
 =?utf-8?B?Mlp6WkNXOWsxYzBDQTY5MlMyVytqL050T3VNMzFRUUE0UEdWVEhZbW9HUEoy?=
 =?utf-8?B?SVd3Wm9rRFZNeE9ycHFSejAyS0VaTXVWVTlwc2gvQWRYVDdtbXpiVHl5MUJE?=
 =?utf-8?B?S1ZqSjg3NG9yUWs3WUp1VXhBMnVJR0FFME9KNGYzRUI2WHJybnFTOVlYSVpG?=
 =?utf-8?B?YkRubDNMd3k2eHh5WDlhem5pTnhrUmI2VFpUZlRHMHo5Uk1PNmp3bnlTSEp4?=
 =?utf-8?B?dU9jbThjNUxGMXREYnh3RjlnWGR3cHFtTFB3MDBRSDNqOWllUEpwbVpUQTFv?=
 =?utf-8?B?WDJVd1pBN0s4ekZQNjVQbXBPZ3d5OURUL0lNV0xHQU1sNlJNejNsK2xITysr?=
 =?utf-8?B?dVFoWTZQbnpCTVV3N293bFpCT1dSeWx4T2dZTnNkUWZFTWFaa28rRm5YSVNi?=
 =?utf-8?B?cjZYQ0hIZnJoc0g2VERGRnpkMUJtMEFQRWpaVEZCeStCVUthbk5KMVpFMk1S?=
 =?utf-8?B?TU03ajlqQWtmYlFrUnZCd0RTQmVSdmlXSjBmN0NjNDJxbzM1YkZyT29uZDV3?=
 =?utf-8?B?MWl3WTcrcFBmUlFTWXlvQ2MyazF6dFBaRUpKbHNEaWFhOEpWbXBGcC9GU0c3?=
 =?utf-8?B?dnNiZTVFdFBHbGthSWZ6WkJZcDJxdThZWllacmZBNlNuZzhmaDZlK20zUU94?=
 =?utf-8?B?MjNQaGZNbk9MQS9DbHE5WTJEcFdaeThydy90QWd2S3V6YXlwdEtFT1RFako4?=
 =?utf-8?Q?hwbEM+adA/8EljmO7RDA1No4mhrmlpPn?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR12MB4116.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(366016)(1800799024)(7053199007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?U05HQWthUEMzZUhETzk3WitmL2EzcFlXRWo5RzFZYkVXM0dXYWYxaVVab3hD?=
 =?utf-8?B?eU0wZ2ZZNTZmUDNPc2crWkd6VWVDclFtSzdTUmxSWHE3TmZPMFpVSHVqelZq?=
 =?utf-8?B?RXp6QTNVQWZnYnZVcGdra2owZ0Z3YkpiN2FCYkNwYW95UkRReHNkZDlud05L?=
 =?utf-8?B?VXAwN0FZcGVHREdBZU9pZDZYeHliWDBRUUNSa2NkQjRIVG9mYXNkNDFxQWRy?=
 =?utf-8?B?Ri9wcVFLcnFIRjB6anhRdWRoU1YzNFRuaGhUT25WdVJTcDI0YnFjQ3htOW5N?=
 =?utf-8?B?OXoyV0Y3NG9ja2pwb2FIRG5xWCsycDV1OUhxYjlCMVRGL01iQW9wYkZENHkw?=
 =?utf-8?B?K1g5WHlBWXpNVUlCOFdxNTJoQnVNK0VFdjFLNEJhNG82Yk9raVR3MUZFTFJo?=
 =?utf-8?B?TEp3Wlk0K0FyN3FjbDlhOUE2TTFkcXJMUzJqRlpTUFY3cjZjbGFhL1VzZTFS?=
 =?utf-8?B?Zm1iUGY5RjZ4ak01dTVENCtPelJRcTRHZlRCbi9MNlgyeGNOY2MvWmJDRFZ6?=
 =?utf-8?B?TXN3eWJKckNRRVNNTmNzM050NXhVNk9TczFuaUt6MmFhbWZKYitxazRtZit3?=
 =?utf-8?B?Tm9Ja0J0UVJ3bEFNWmRJN1MrRWtDb01EMTEvYTNrUWxpTTVWYXQ5WGtaT0Yv?=
 =?utf-8?B?UWlRVkw0VWVoOEpYSW1XRVRpRmZoM1liN1BWMm4xMk5XQ2dkYk9nYi9sYjA3?=
 =?utf-8?B?ZzcvYm5qWmFkS21rVEoreDV4NjJyVy9jRVU0cGFvMUxxRGxVM1MyMGdQUVp0?=
 =?utf-8?B?U1B6b3E4NXR6REtFa0VOQ3JhTTJvUEZoaFRKTGpYVUZvdkdnajlSeUtuZ3V3?=
 =?utf-8?B?WVpKVGlvU2dEQ2xlSHlxaU5jQ1hWSzBOZU9yYTBKQnkvZUJzdkpTSlgvQlRM?=
 =?utf-8?B?Tm9XWkMvelB4WTBod1ArVzd1RldDQ0RSLzRPT0JKc1d4bEM3elNFbzZ2R1oz?=
 =?utf-8?B?Q2VaSUl3UExsSFBBcUJRWWhBcEFtZkdDa0NtbWVxRkw3clkrcWI4M2ZUR1Rt?=
 =?utf-8?B?dndRaXNRa1JYa0sweDA1RGhHN3R0a2pzQ0t5QmhDM3R1QUZBT2dQL09zSHdU?=
 =?utf-8?B?WGZqSHhjNWw5TjFJZHlOTXpKbHRLdnlZcTl4bW9XbXZYNFFaUFBaRjJNYWh2?=
 =?utf-8?B?cFRNSHQxMDRkcVptMGxvalN6VFRFSVAzRGtuN1IzcVg4TXRVSDZtazJ5YkNR?=
 =?utf-8?B?YWN2ODAwbzQ3R3FnSS9QU2c1YytQOWlTTjI1eTRIcml2a01pZldPTnAxR3o1?=
 =?utf-8?B?Z2xSdy90bDV1U2RndEYxUDRmZ0JVR3ZQTDdZUEhsOFEwQXdoU096YjRwekpC?=
 =?utf-8?B?N0t1M3RqdkY2VzNzUmlkUTNWdVBMS0ZEMEQ4SWUrUzFYRUt3RnBQSjlteUY0?=
 =?utf-8?B?T3ZSdGdoK2RTcUZZYjRVUHZybW0xUUphRFFCMWdmZkFZVHVjb0dNdlZ6bDk0?=
 =?utf-8?B?V1AzSGQ0L3cxWmtlU0g0VkU1UGYwcEZ4S0JxTWh2V2tTZlQ2SUFlNmZVR3do?=
 =?utf-8?B?a1JqTkxOc2lNcXJGSjlTcStKaHNJNnlSbE4vZ2NhWGdSamdvaW9xTE9GMUhC?=
 =?utf-8?B?NlM5M2tqdkNESVkrQm9Nank3ZFdKSkd1MUF2ckxsL01jcDJMUVpjRWF3K25y?=
 =?utf-8?B?T3M1NFdiajI0L1pPUkZWQ2dHdkpFS2haSkM1TWVscHQ4c296VUdLY1hFQi9n?=
 =?utf-8?B?bDcySlhObEY5TGExNitlWWZMZ0tJb241bVNnZGpZNXZHSE9RWFUzNEw3M1Q0?=
 =?utf-8?B?cHpXYmRVeHErcUMxNHdWNmxUdVJPUlVybmFhVnhaV3dpT0JjYi8zUytlSFJq?=
 =?utf-8?B?aFpFa0pmcGw1dVUzVWl6bU1kUmFvUnAvUGt5VmJxK25MU0xlN2I3dDVYQkdk?=
 =?utf-8?B?ekQzdFhRRHNQdDg3bVNHVEQ0NGVJMy9EclRGMS9LSVBPRk5PVGNNK0ZLWlRB?=
 =?utf-8?B?UTZ0czNId2dTTDZaNW1naENRUzhJOVQ3RjFOYzVpdzFBSWdFZDlwVnYwVjNk?=
 =?utf-8?B?aURTUWJ0aWEySjVyVzBFYUpZNWRXbU9IRVk0YXN1TXFtKzY3ejl3ZWlBWkRq?=
 =?utf-8?B?Y2dvSVNRNVFuNVJNekxkUDBPRjJWKzZyTnJQdG5TS0RPNnNiNHc0b2crajMy?=
 =?utf-8?Q?iOED9VAF/HgPPvJMCxiMaBrIB?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 89b1e998-1f39-4765-4943-08de1e8527ff
X-MS-Exchange-CrossTenant-AuthSource: BY5PR12MB4116.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Nov 2025 05:10:38.4970 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jH5wQ8fG1kn1UJvTZ507NTlcW2AlYGfS88PUBjsn1tSTQQTQo1pKszUPyjAgHLIchygWP7s0iAuhzdzn1ZqCFA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB9044
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

On 11/7/25 9:02 PM, Timur Tabi wrote:
> On Fri, 2025-11-07 at 20:39 -0800, John Hubbard wrote:
>> Implement Display for Spec. This simplifies the dev_info!() code for
>> printing banners such as:
>>
>>     NVIDIA (Chipset: GA104, Architecture: Ampere, Revision: a.1)
>>
>> Cc: Alexandre Courbot <acourbot@nvidia.com>
>> Cc: Danilo Krummrich <dakr@kernel.org>
>> Cc: Timur Tabi <ttabi@nvidia.com>
>> Signed-off-by: John Hubbard <jhubbard@nvidia.com>
> 
> I'm okay with the entire patch set, but I do have a few questions.

Great!

> 
>> +impl fmt::Display for Spec {
>> +    fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
>> +        write!(
>> +            f,
>> +            "Chipset: {}, Architecture: {:?}, Revision: {}",
>> +            self.chipset,
>> +            self.chipset.arch(),
>> +            self.revision
>> +        )
>> +    }
>> +}
>> +
>>  /// Structure holding the resources required to operate the GPU.
>>  #[pin_data]
>>  pub(crate) struct Gpu {
>> @@ -206,13 +218,7 @@ pub(crate) fn new<'a>(
>>      ) -> impl PinInit<Self, Error> + 'a {
>>          try_pin_init!(Self {
>>              spec: Spec::new(bar).inspect(|spec| {
>> -                dev_info!(
>> -                    pdev.as_ref(),
>> -                    "NVIDIA (Chipset: {}, Architecture: {:?}, Revision: {})\n",
>> -                    spec.chipset,
>> -                    spec.chipset.arch(),
>> -                    spec.revision
>> -                );
>> +                dev_info!(pdev.as_ref(),"NVIDIA ({})\n", spec);
> 
> I believe that this is the only place where a `Spec` is actually printed.  Does it really make
> sense to implement Display for a single usage?  Do we generally want to implement Display for
> new types?
> 

I agree that it looks a little excessive, but I defer to reviewers
who have a lot more Rust experience, and they requested this during
a review of an earlier version.


thanks,
-- 
John Hubbard

