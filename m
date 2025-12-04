Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 93D71CA2A43
	for <lists+nouveau@lfdr.de>; Thu, 04 Dec 2025 08:35:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6C96810E8C8;
	Thu,  4 Dec 2025 07:34:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="nw7iLiub";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from CO1PR03CU002.outbound.protection.outlook.com
 (mail-westus2azon11010000.outbound.protection.outlook.com [52.101.46.0])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD0A010E8C7
 for <nouveau@lists.freedesktop.org>; Thu,  4 Dec 2025 07:34:51 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ww2HsLt0XUJ90o5yW4hW4pd8VpP65Y7Xapre+un5uwzLltSoQoqO4RLnQv6s0I4iW0BF1RH7Pj6BaFGuTzyQJZsTqZ3dz+i5LYorpDxf0mcE2qjReL+9CzKGAhZnoDwX24eWNxLwDkaia8trbEiakCGf4gdvizn3lQgbrI9we/37prrH2xEAdXaKvoXUNZdn4Tia2e0g68SgvPnVr7lHs+9Yeeq+jxu50SjO6hdv19WCN4Nv5+ioIVAjmeocl36+i/tUAY24Mbq0h5ky3I+nWtF/Jmphzq4NvHN+M3LSXqlhMhs31BTv69hEPljkkZZKdplqA4s4iURUe7sI4YjNQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=73UW3NaPUWUoJUUewWvs6NW29dFwuR/eXcaiu6gi3Kg=;
 b=KP4/J/o9hMdULIX2Sp1fCThtT03WFtFGoqqe+zikF0HUTzsZkUc+kWHyJRLfgC963lja0UrRB8YDvuUiNY42omkO5uNwbKyMNDAgpSDxELjGU94FWjcmPyNEGHbpmm2CXcJAG2YSG2zUFiHyNiG4isUJJv0vbVqZyAcySbgYFNIocjHaj2odkzWDittLyjc0NkVo/vwBAcEH1o1Guf0ek9VSlzrwGuqRKJLMEAT4ssyXzD/E4i83og4hO46iOsVDSmh03bjsDEtJUExqR86I0dHjhRO1EUWaFq9TQ5v9Mei498+Pnht+tEJJXkw3HnR3NuZHgE5BwpVjcp9oTlogDw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=73UW3NaPUWUoJUUewWvs6NW29dFwuR/eXcaiu6gi3Kg=;
 b=nw7iLiub/hmHfWizYAlPSL7wXP0W2jcAbht1R3MEI2hk61EVz+cK2qrce9pRlKKuAnKa003bSpdk0wYHGsB3NFGWTXDOb5HVMBPOcK7OXFbelXTptcG8mXQ/07Mb5vjAVlnojiP0gjqpIAhqNewZfZ18/oUias6gnrNxWRFBCqfxaDtchnoKAbtvIbk+iF7f57dE27MwBC5riqjxAprOOOvDRA+BEQHZNwEVcyu0JoGh6CYp3kIoiJCNJEO8kH9StltCA50O2Dy3DcLti+9ethJiJuHMPwUP7gZ3NFbEDhdspj13ZLx3/jKJfWQk+IHzhbmbfx/DhQyIuYXqtdSQ3w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 PH8PR12MB7229.namprd12.prod.outlook.com (2603:10b6:510:227::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.17; Thu, 4 Dec
 2025 07:34:48 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%7]) with mapi id 15.20.9366.012; Thu, 4 Dec 2025
 07:34:48 +0000
Message-ID: <ac0338f2-6b7d-4b34-90a4-7be041682d2b@nvidia.com>
Date: Wed, 3 Dec 2025 23:34:45 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 17/31] gpu: nova-core: Hopper/Blackwell: calculate
 reserved FB heap size
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
References: <20251203055923.1247681-1-jhubbard@nvidia.com>
 <20251203055923.1247681-18-jhubbard@nvidia.com>
 <4e36e160bfa53240987f65ba36cae8e6fe4d6e6c.camel@nvidia.com>
Content-Language: en-US
From: John Hubbard <jhubbard@nvidia.com>
In-Reply-To: <4e36e160bfa53240987f65ba36cae8e6fe4d6e6c.camel@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR13CA0160.namprd13.prod.outlook.com
 (2603:10b6:a03:2c7::15) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|PH8PR12MB7229:EE_
X-MS-Office365-Filtering-Correlation-Id: 2e4c5022-c5ed-4462-dbd8-08de33079a9a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|10070799003|1800799024|7416014|376014|366016; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?SnpYUStxWG84U0lkb3dNcW1xS2dMRnAzOEpySlRDK0N6d0NuYVBnOVRiUDh2?=
 =?utf-8?B?cFJUNkdlWitPYU5vUlZXaVRUbGFQZUFpbWZrRDZDL3VFUGRRY3JBUFJDNFBV?=
 =?utf-8?B?bW1wbFV4UXZiT1dqclI1MDhDMzVEVGticEtXc0hzTjBVbjlTZUpMRFZVZUx6?=
 =?utf-8?B?c0RSeTlWaGt3bGVmaWplTnVxamhMTTd4dDh2OG1tWDdwZGQwR3VmWmNQK0po?=
 =?utf-8?B?eVh0N3hhWTR6d2hSNWo4dDZ1MWFWOGxpbDRJWitKNUNVMzhpN0o2U0RoMEJj?=
 =?utf-8?B?ZnhRZ3hLMThLUDd2V0Q3Ukh0aVFHeVloY3F2VlVTRVFiZnk0aVRBMjJ6NVF5?=
 =?utf-8?B?aWp3RDdSMmsxNEFkOE50VFI1OGJqVHNqc2dDd1ZBMFRBMTBhaXk4VTBnS3BH?=
 =?utf-8?B?N0RrS0VITHNzcmwraldJS21xMTVTTXhHQzlnUnFxR1dVSzBCWmkrZkx5L084?=
 =?utf-8?B?SGFJVG5pcEk0M29KbDFYbElQendnQjNDQ1lGMHZQMkxoMVE2MnhnVDJ2YTBS?=
 =?utf-8?B?MTRQR2hBcmJsU0RlUTVXN1dWNndzNitqcFVUYkdCUG9velowRk9saUhYZ3pQ?=
 =?utf-8?B?ZWRSdy9PRXFoRk0vaWhnbG0rM21IZFR5NldSUGtYdWRLaXRhNFhLNGlmQjJL?=
 =?utf-8?B?YnpBNVBKbDJSMXU3SG0wNkpvc3dlQm9hd2M0a2d6MEM5V0src0xuVFNMVVZC?=
 =?utf-8?B?cERmdmFDTE03RXBZVzkrODlsUW1tOHYwZ21JYm95Z1g1MWR2WURURVkyK21Q?=
 =?utf-8?B?OWVJbjdmOHpnbEtKYnFuUlczeUVDSnJGRTZ1a3U5K1JVN0FuMzl3bHRTT3Jv?=
 =?utf-8?B?QnhMd1ZhSC8yam1RZjFCcUQ5Umg0bHdwL2pFc1k3M0R6akRvc05YRUtOL1ZT?=
 =?utf-8?B?VmZwUWFTczFDQjJRVG9WWStkcWxqbmZNRXArVFh4VU1ZVUhhaGNTd3prMWZl?=
 =?utf-8?B?MGVBWnoxVWdqV01oMDh3TUtKWjNwbHB3d05UT2RieVQwa3R3ei9YaUVlWUY2?=
 =?utf-8?B?RE90ckRKclkrdll0TXJ5OVJmQUdyeVJ6cC9MakVoWEhiSFRWR3NoQ2pqVDdt?=
 =?utf-8?B?aE02YmptcDVQYVZPV2p3RERkRUszNEZwbEZ1a2YzU0JsMm9DVTRKMjg0VFdM?=
 =?utf-8?B?V0xYN1d4U0dKS1Y2b3QxVUJRZk1EQVJXY0ZRVzI4UTM2eHMwTTVoVkgycWVS?=
 =?utf-8?B?K0dLalVrcGRoYmVIMlp3cml5Q1RablUzZU9KU0tRMlV6aExFMGZCTGJGR2tq?=
 =?utf-8?B?R0daWGN2SXpld2Q1SVA1V1NKMEdWZHk2b0tiUVN1QXBrWlAyZkJKcWtLSEJz?=
 =?utf-8?B?OXhGSzdZOTdJSGt4eWJsSEtHSjRhWDFxYWJLYjFoNXFxYmdmTUJyUG1oMUJH?=
 =?utf-8?B?UVVnYi9BWG9GR0tsNjVobWZySjBabmdaZkpONlA3RlpqOWtiVTlMNUJnUHUy?=
 =?utf-8?B?MVU0bUVQRUlubFlGcXRTeVNNUXNvRk1NdEttR3dRVGVIKzRGWncrOXlWVDA1?=
 =?utf-8?B?dTVOUXBFWUlGcSsyWHVBQzgwakJYWkJVWm81cG9vNTlHOCt6a241UUg4L3BS?=
 =?utf-8?B?aXZCa2ZueHc5OU5TaWFYUlBiTEk2K25yYWQweXlUMDJweG9hTVFHcTRMSTlh?=
 =?utf-8?B?U2Z4Z2RhYjAzRlVkbU1xdmRaZGw4cGQ1RXJwcCtaUDdOc2hBZU85MUpGZGlR?=
 =?utf-8?B?L0xDY2svdnF1K29PRHNNU253ZlJlbjk2NDdDdkZpcEV0WEx0MUJGaTR5dlp3?=
 =?utf-8?B?aytTNng3NXIvZXdyM0JRVVFhTHI0NCtqek1aVTNSRTlZZFBuUE96c1h3NCtE?=
 =?utf-8?B?UkNaVnA2UzlnRzF2cWpidVJMNkR5cm5tMnNCTE95ZzN1TU56VU9OUHVrSkh1?=
 =?utf-8?B?ZEdHSTY2V0svOUJnV0Y4ZkVNSUpzZVBiR0NaaFBkMFpUR2V1VW8xenhGKy9l?=
 =?utf-8?Q?jyHz94Kq2h0yS1osLWWAwUoONVMISl5I?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM3PR12MB9416.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(10070799003)(1800799024)(7416014)(376014)(366016); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SGJldUdXZXh2Sm5uNFNObm1HY2lVb3ptZkQwSVIzTGs4eUdSVUFoNnFBMVB2?=
 =?utf-8?B?cGpKWUw3bmEySVBIdE9Sd3RMTjBTUUhBQVBwZUh1UlhhT0dtNzVGN213MmNE?=
 =?utf-8?B?cUpSbVd0Z2VPbDhxYkFMVlljWUtpQ1FHL1Mwd0V4a3VqejltSjJMVXlaREdO?=
 =?utf-8?B?SkplQjRoU1FzUW5LRTBBN2hHUnVmNTMxY0VWRUFtcm1JakQ0c25Sd0tNejd2?=
 =?utf-8?B?VzRWNExwR3hwcUx2aWJlK0l0eS9oZ24waHBGK2lTMVNBUWpOcVliWkVHZS90?=
 =?utf-8?B?VThlMFc3VkwxdUEvSVYvYjFPK1lUSm5JclVzVExnNmRIVkhVNEo3M3M2dHNl?=
 =?utf-8?B?TjFtaUxUb0ZrditiaU90R001NXIwUkhTU0N5ZGd5RzhlRW04eG9FUTQvM1dw?=
 =?utf-8?B?L0JCM0VmUWFsK2k0Z3hHMzkxY2JBb1NNUlJhcGxHRWI0Y3VtWDVTUHdOanZy?=
 =?utf-8?B?VDY0UUhXdkJwSTlhZm5qY1BIWVkrTHJocmF3ampRS2pjRFNlbXVrMVk0Ylhi?=
 =?utf-8?B?ZzJ6aGJDM1dCRElZaEpPNjYxM0kydDNDU2tKbEF4Z3dhWDFXSUluTzFTNURF?=
 =?utf-8?B?YUtrSHd4MTBveWhQWnFtc21JQXU0ejBDSDBLUHcrTzJYWmVIcS9kZno0U2NM?=
 =?utf-8?B?NFN0YUZ0dlI5Nit5OFh0UmdlWFdEVVk1ME9vT1lUZmlZdmEvcDdjaTdtTzdP?=
 =?utf-8?B?eU1YNytxSldDSEZQVG82aVQ0RzIrTjlyTEpuZmE3NThSemd3UWxRM2xuUEJH?=
 =?utf-8?B?R3J5S0M1eDFkZ2UrRWtPTmJBak1yRUFPcjJQNFdsNTZzNWlrdUc4RnJjMXhE?=
 =?utf-8?B?NzBjZzZWb21lcUt5UVlMVXBJbm96ai81dkNCeE5HOS9KN3lYTFhlMG52b0JF?=
 =?utf-8?B?SFB0TjRXL1M3RFJQNGJDV1ZrMW5NMmlUU2FuTUVIcHdleEdSN0pZNnluSE55?=
 =?utf-8?B?dlpiZ3d5RG1jZnh1djZJUHNEWUxZa1lFNnZiWVF5cWxjOHVZUThtMmxhMVZX?=
 =?utf-8?B?TmsyMTBXOHhGbFJaOGdjZXM5cngvc0VLWUREL3hnV2tZL3pYdVpxR2RJMHc0?=
 =?utf-8?B?bXJJVTJIcDBiTWcxcnlKN3FRaTRoNThZSnZnclZSQ1dObkJpcUJQYk1Od0ow?=
 =?utf-8?B?ZlAwRWZDbkRvajljN2swR3RaNklESG0rV3dVUk9CR3NxanNtZ05SV2x3ajcv?=
 =?utf-8?B?c0kwQ3dubXQ0TjNpNzFXa3J2NzUxQTFCdHNNOUg2VTRKU1lzaytLcTByY25P?=
 =?utf-8?B?QTM3RDg4WXNoM2VEV1FYU1dWV1ZqSFZtNHNTSlZTalBxTGhGYXhkb3dpY29E?=
 =?utf-8?B?dlY0WU16Q3ZKNndWUkJIdlY5YmQrdVErSFNKZTV0S0R4eXNMZENleGJVb3E0?=
 =?utf-8?B?VEVjOHl0SnJadDBzV1ZkLzZWeTZ1NlViRy9lSG1qc3VnN0VRaVg4a3AyRDdP?=
 =?utf-8?B?UGJYRndKS0tJMnNsUGdSZDFrRDE2VUluV3p4eVRqdERDSGlTWWplUnFhckdS?=
 =?utf-8?B?MCtUMmxKWFZ6bDR6M0R0bDN0aFo2VE1GNVBkMExkd3htcS9iN3B5WkxXdFRZ?=
 =?utf-8?B?UWFMVGdSSEJUd09QZUppUGJjZXRaYklpOVY1di8rMmRTZzVVSHhpZm1tdDNW?=
 =?utf-8?B?eG80d3hkeEw0anRtUnZkWm1LUUs5ZlZtZGR0K1ZJdG10KzNXRStsQmRLeUVq?=
 =?utf-8?B?MWwxMktuY1NKL1dmTDk4dEd0RjcrMCt1KzE3bDg1SVZ4b1RQMVVqV29tVUsx?=
 =?utf-8?B?elBPb3VXck5YWDZCTzc5VGJoSjRyeCtiSVc5Vi9URnNrNU5KZnhaR1RmUnZq?=
 =?utf-8?B?ZUM2NWRVSFJHODBsUGdpd0tlaDlsNmo5cGNYbDFOUUNFeUVja05iTytwVGpj?=
 =?utf-8?B?d3NyK1VhTVRCZFF3eHNHcG50THNQZmUyOEtoV1E3MFJyZ09ma1orcVNhVHM2?=
 =?utf-8?B?d0ZNZFptbzJWZ0Y4THNKVzQ5TkJaMno5RG9qUWEvYW93TExhWjg3VU5rTFlP?=
 =?utf-8?B?ZHphemJvZXptdWR1MTdsNkhheWF5ZXU0eElQSDN2eUZkSzVmVTA4Qlk0YVQ3?=
 =?utf-8?B?Y3JHN1NXakpmMzJkaEZtZ1ZLbmYxWXo0RktsdXg2dWNXcktLWkRNUVNXTmlw?=
 =?utf-8?B?T1JsYzhjOG1uRXZmRFB4VUpOcW9MOEhCYlpkOUhjUFhBTXZ5d1Yra0RKc2tY?=
 =?utf-8?B?cmc9PQ==?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2e4c5022-c5ed-4462-dbd8-08de33079a9a
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Dec 2025 07:34:48.6503 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ebe0v8yL3pnoY5yOdXzEWNd4f+JP4NrJblFfuKqRA1YA8szOTHQzeI25wbVbqcDnUD4dCABmaH8GrTzIVjxOig==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB7229
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

On 12/3/25 12:48 PM, Timur Tabi wrote:
> On Tue, 2025-12-02 at 21:59 -0800, John Hubbard wrote:
>> +#[inline(always)]
>> +pub(crate) const fn const_align_up<const ALIGN: usize>(value: usize) -> usize {
>> +    build_assert!(ALIGN.is_power_of_two());
>> +    (value + (ALIGN - 1)) & !(ALIGN - 1)
>> +}
> 
> So this is just like the issue I'm having with .next_multiple_of() in my patch #10.
> 
> Shouldn't you have a check to make sure that value + (ALIGN - 1) doesn't overflow?  Since I need to
> align up to the nearest const power of two, I could use this function instead of align_up() and
> avoid testing for an error condition.
> 

Const items are special: they are evaluated at compile time, rather
than at runtime. And so this will fail to compile, for values that
would overflow.

For example:

error[E0080]: evaluation of constant value failed
    --> drivers/gpu/nova-core/num.rs:226:5
     |
226 |     (value + (ALIGN - 1)) & !(ALIGN - 1)
     |     ^^^^^^^^^^^^^^^^^^^^^ attempt to compute `usize::MAX + 15_usize`, which would overflow
     |
note: inside `const_align_up::<16>`
    --> drivers/gpu/nova-core/num.rs:226:5
     |
226 |     (value + (ALIGN - 1)) & !(ALIGN - 1)
     |     ^^^^^^^^^^^^^^^^^^^^^
note: inside `_OVERFLOW_TEST`
    --> drivers/gpu/nova-core/num.rs:231:31
     |
231 | const _OVERFLOW_TEST: usize = const_align_up::<16>(usize::MAX);
     |                               ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^


thanks,
-- 
John Hubbard

