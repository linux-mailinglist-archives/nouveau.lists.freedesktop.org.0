Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E7D1C5FC3F
	for <lists+nouveau@lfdr.de>; Sat, 15 Nov 2025 01:50:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 25BCE10EB98;
	Sat, 15 Nov 2025 00:50:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="nbqjpu1P";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from BL2PR02CU003.outbound.protection.outlook.com
 (mail-eastusazon11011034.outbound.protection.outlook.com [52.101.52.34])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D347C10EB99;
 Sat, 15 Nov 2025 00:50:18 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tfPKoxy72/Ln68XssiKrUWLoHw7dQJClFzqjQPj+Ld8iRe6UT0qtxDrDkBC8Z3/K8SEkEIW83PT8hP/8GwLmYxqKLvK4xbLvavV4VyjFYN44DKZxVhrm5vqkIiW381DZp58RmF51hakGep7PlkWr1okI6qzW1TgiNY/7H92Xr/FU9+bDkKBeWohp9TRNSbziA3EBtqANq3cpAiDj8O7ReU5V1yJBABAI/qPYZToV+7e1jxqC2QC7TNiL1lU1kqle38gr28bP+H4x/NewViMfpr3BMgpLu5zdO+QSPMNyskIDZsHiMiazzbRDKdnyATQz2XYADEe3BEP0A1tkTFMIHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=j4VoMIqJ4bohBksRNqRnzkJsF9bMs6j/9A9fTrQWneg=;
 b=BIOk6Z2o6XN1BtCKyXMAy1uGBgpskdw5v1gcl8FiaHI+5n5bn836VF52Qla4erw2GdhdjK8UlroNxkNEnAKC5AYzPop+UYa6bENsULcmwYuSWMjpAfTgDimAlo1KIeHcw4VmMmxzX14lBM+2DIXoTMrsxiBRSZ8MUUwrlgQqZt3MTpb18giVbLc/bAUclj5lGEJ9gZ9qc8kC0MVkjoPKGnjjNXHqnnqP+gw3xMOO0FDfGeWl2JTMWJMNpfzKaNcSWpi2cFA9J3lMJkdpupV+iRUPEIQmEq+A2aQejnK9fu5Dgom3Ztve8x6lrNfKtgNoF75tWKG4EOevxsMv+hyIfw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=j4VoMIqJ4bohBksRNqRnzkJsF9bMs6j/9A9fTrQWneg=;
 b=nbqjpu1PDoW8oZnlRpIkyBqVUoCwCt6hE+ais92AFd8dlKIR0z2hX7p/o1IPVicNkQXFuyDJ6deiNZjReACSXPARE9w53lx95kjd7TnZYpC0Xwwesny8nhW46P32UH/KsqLccV/M4LU9sSbWQXUYYnCP3BzhxaHFr1j+kuL8vjoOXyHj8PXlhRwecTryTkqN9HQZfYfXEvHvsGY8+yKR0DNyKo98H8pe65ZnJwMhnSkYjy6Lstgo/6J8oqwUP8x45ltsfKq5rznczE6qRRbFc0gFyPp0pUN1tdVi2X7DJ6zJ2pBFUvNq80Y+R58ZAWe6hxFd8Xj674FQq6dEVMRkfg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 DS2PR12MB9663.namprd12.prod.outlook.com (2603:10b6:8:27a::13) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9320.16; Sat, 15 Nov 2025 00:50:14 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::d622:b3e9:bfe1:26bb]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::d622:b3e9:bfe1:26bb%7]) with mapi id 15.20.9320.013; Sat, 15 Nov 2025
 00:50:14 +0000
Message-ID: <d4723c7a-b0ef-444e-a72a-6a083db8457d@nvidia.com>
Date: Fri, 14 Nov 2025 16:49:58 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 2/6] gpu: nova-core: prepare Spec and Revision types
 for boot0/boot42
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
References: <20251114024109.465136-1-jhubbard@nvidia.com>
 <20251114024109.465136-3-jhubbard@nvidia.com>
 <DE8HSL6JS4DU.2V5WDFEN1L4X2@nvidia.com>
Content-Language: en-US
From: John Hubbard <jhubbard@nvidia.com>
In-Reply-To: <DE8HSL6JS4DU.2V5WDFEN1L4X2@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BYAPR02CA0058.namprd02.prod.outlook.com
 (2603:10b6:a03:54::35) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|DS2PR12MB9663:EE_
X-MS-Office365-Filtering-Correlation-Id: 08f64242-7753-412b-34c5-08de23e0f032
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|7416014|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Y1FRUmNhRTM5VGRHNzBneVVtdlM1NkhqYytFWkJzcGM3ZWljSkpvNmFsQlJW?=
 =?utf-8?B?QU5CUnVUY0ttZGFLSk12ZWxYVDlnaGtPb2R5N2liMmh6eVk2L1Ezb2pxcWxB?=
 =?utf-8?B?dVc5S3I1RTFtdmVUYTdMamx4SXg5bzZSMHJTeFl2RktaU1MrdFg2TXN6QnFR?=
 =?utf-8?B?M1dzUjB4YVAvREtLclllblV5RGRrMURIZnppWjIzVlp2eFgrbDBtZUp2RFBC?=
 =?utf-8?B?NGswdi9kQ3NLMTdpQzY3VjVBUFdydlJRb0dJb01NMDRlTkpicDNnb3UyMjc4?=
 =?utf-8?B?VlRyRUk4ZUR0UUYzQThBcUozV3M0c3BKVkZHaXdrd3R1RVY3L0lKQ0lGMTJH?=
 =?utf-8?B?Y2c2aEE2WUc4VjR1dzFYSURhbGUzQkxrRXA0djl0TE12OUJ0WGs2Mnp5VlNB?=
 =?utf-8?B?V0lyRnFTT0dPMVpyazU5eUo2QVoxS0gzN2lVMUt3WmUvMEVFMWJPTGpCTGI4?=
 =?utf-8?B?aVR1TGxQck02Y0tyeVVENVlZWEhuQS83MktMWCszV2p1RmdmdnJUVlJVdG0z?=
 =?utf-8?B?MG1nNE9qOUVhSWhvL3UzU3A4bFhuVEptQWlweUtqTnA3VktYSGZCenEvQ3pT?=
 =?utf-8?B?dVNnSmdlRFdDV2YxZTk1a00rOVZsdExWL1dlR2NLSXdIQnorS0dTY0puak1D?=
 =?utf-8?B?c0VtVCtQN2FCdUovS2RGQm50UVBUQlRkb3d5L1ZiWFc2cEJZUklvVWsvM1RK?=
 =?utf-8?B?TjYzdlJxZitzeWs0bzIrOUpzVU5SOTBhbVhOb0cySmZ0RDR6S3QwUnl5Wk9Y?=
 =?utf-8?B?TWdGV3R0YlhLVTZCa2p2NnBRQk5FZGt4ZkM0L1ZIWFUzY1JkSUZhbXBMMC9M?=
 =?utf-8?B?NnNQUmtiVzl0SjArUGQ0V0VDQmJ4dTNBdjBjdCtqZDlsS1pHc3FnUzhPL2wz?=
 =?utf-8?B?bWdQMjEzL0ZuaVIzWlBaZlczT05YMUlxTytYem1YVGFBSFd1ZXlKV2ZjdkUy?=
 =?utf-8?B?bVNqbFBpamlqQUxRSGd2c3VyVmhvRng0OHJHMGhtQ2ZmSytIUVVJenF1bU15?=
 =?utf-8?B?K2x4QjVqRXY0WkowQndZZ2ExaExRb2ozMWI3eDdpZ01NcUgrOE9XSmR6VkxV?=
 =?utf-8?B?Szd6TDRmRFpQL1dWemsrTDh4VnZtR0J5Qkpkc1hGelhLcXg2dXp0eHVJRXRt?=
 =?utf-8?B?RWw5WmVDSGNsNDRIdkRNOWRkNVV6bVdoMmUyUjdvZDNwU1k4V1dWK1NRNDFT?=
 =?utf-8?B?TkR3MWdVTWN1T3BtK1p1TWlURFRxMHpHcTdPOFQ1ME1mK05CZUtNYlN1TzN0?=
 =?utf-8?B?RFM0aG9tUXJRVTRoZzNCbVhDelQxRnd3YzQzc2dPaWYyelZST1k3cWtuMzRN?=
 =?utf-8?B?MWhhdWhyZU8xL3hvd2s0SnF6aFpJNmZSWW9MK3pQRUVhckpqeFVkbEhSLzQ2?=
 =?utf-8?B?WGJLdDJhUm9DQVo3OHB3QXBsU01XR2JtSzVhSFhWaW9mM01naXZxY3UwK1J6?=
 =?utf-8?B?TFQ1ZThidlFYYWZaTllsbkI5NHJBaEIvY3h3SWlwU2RCMUZRakhBU1oxSC80?=
 =?utf-8?B?dlFXQ1hsSUk1MVAyWlpLNm5VY3d5Q0h0cE5oWE1ydVdmWFIvb2dxc1F2UXU2?=
 =?utf-8?B?c21qbmkzSitSaExTNWdzTTJHU3ZsYkFDaEc2UjAvNndPOWhTb3huQitUTUZL?=
 =?utf-8?B?T3Vvd2VFdU1lbEhqd3ZLdVh2NUZPb1VOdW5jaDN3OWIyMFQxbVhPa25WRG1h?=
 =?utf-8?B?WVZrMVh3T0drVVdBcXVuK3g4WlFaZWNMZmprWnEzUUQ2K2RKa1c3ZStCRzRk?=
 =?utf-8?B?STNmdTJwSWdBTElDOWp0Q29MMXVSYTNJWXVyaHNybEs5NzdwUXZyOSs4ZGdU?=
 =?utf-8?B?ZTFTbmVCTUxMR2p0R3o0b1l6Um8wckZtMWNKMUFmWVB6eVJlY1JDd0tVdGJs?=
 =?utf-8?B?N2RBb2pPa2dyWWlJSW9aV3pNOVMyKzMvUnRBUGY4M21pdUFrd00ranpTMFJG?=
 =?utf-8?Q?j0PvGwcgeCSmgfZY5gVcYzGY21V9sTcu?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM3PR12MB9416.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(7416014)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZDZkaEZlSUxmNitOd212eU1UbmR1SHlrOFdpV3B1cUhQaGQwcDY2blFvM05Q?=
 =?utf-8?B?d2YxUkdpaHRoUlR0THphRDJSNmd1RXppckh6ZStnWlp2RVdGYWxudUdIckRG?=
 =?utf-8?B?Nm1DeGNieVhyNFA4MHlTd005dVJidFZSTitqMkJQTVNXT2N3QmlJMDFjYWk3?=
 =?utf-8?B?U2xiNmlqWXoyS01qM0RHVUhEbDYyN0Qzb0gwS3FFR2srQjJiTmdCYW10dEJx?=
 =?utf-8?B?cHRoZm9VdTZoQ0lRUHJSQXpBNnJaTDBTZGlLOGVoOTgrVk5tUVBsY042eVFz?=
 =?utf-8?B?TjVNUldCQ2EzZ0g0bTM1NzBZTEVNZVhwSm9uQ1dQQUpHaDRaM2xZV0k2N3Vu?=
 =?utf-8?B?b1pGRTMzU1l6OGRDTGVXWFBSSWtOMFkzdUlHUmgvWTE5UlRqUkZUbGcvY3A2?=
 =?utf-8?B?aEZnTElVcWdUV3doSkM5aDlHcVIrTFAzTXlzRFdGOVNZOUlTZ2lWenljSmFN?=
 =?utf-8?B?c1BLdHUzaU9NTzdVQTl5Z2RIdTZMQjI0eEsxSVpmWmU5T1llbjFta0hTQ0pr?=
 =?utf-8?B?QUJWbk5maDZLTWhXYnR6NW5VUEs0K2M2OFl6VE0zOHRUbTJNRDVLd0RjWXVQ?=
 =?utf-8?B?TlZRYUhuQWNCUlV6eEg0VzVOaVJzL3lVTTJpaFdVNVZsNG1GOUpjZWc0R2Ur?=
 =?utf-8?B?Ymt3a0p3VFZLTEdIT3JUNE42TzlSVWFRL3JKVTJYMjVXR2o5Z21BTE5HdXZ0?=
 =?utf-8?B?R3p6cU1ma05PT1VjTnJvT3NnVkprdFVPQnh4SWlYZWtFMDRiQkR5bkdTQlpC?=
 =?utf-8?B?aGRhY2ZOeW5kbGI0dEprSnVvUVhEUVhkd0lTalBLMzgwWTNKeGJ6UVRDbEo3?=
 =?utf-8?B?N09zSDhaRVhWN29oeTlHUGg1WmdUMjlxZG8rUXdVSXg3NEdaWXdoWUduNDZI?=
 =?utf-8?B?b1VLSXhGclZnQWI1YnVuOEJQZHFack51alo5WFVESERWbk4yMFNFQlpKL0pT?=
 =?utf-8?B?VW1EK2hnd1FZSTBFai9peTF5QnNEQWhXNVRDN1ZRMHpaalpWRS9tYTd1eCtI?=
 =?utf-8?B?eVhIMHhSNGpIMzFFZ1g1bHBaR3psblptODlzbytpVDIzS3RQMVdBVXlNdlQ3?=
 =?utf-8?B?WU9Wb1lTNEUvVXZ3UDNiM2dISHIvKzBCK2JyOGhKdlJ5V0VPYjBhOHk5dFVT?=
 =?utf-8?B?UGNzeEJQWC9LWjFMd3JudHh5UFhha0RhZXFZcGtqUGpIOC96SDZzM1NBd2Z1?=
 =?utf-8?B?RlVrVHZnWkpJY0dQYkQxV1lXY2I2dWY2cDJjanlZZGZtY2M1bDdYOHdnTDdO?=
 =?utf-8?B?RTVsaDhraVgxMkllSUM2MldiUWVEdTVGRHVtYVRaQ3RkL2J3RHBZUXEwQVRa?=
 =?utf-8?B?RGk4aGRvb2h1SzJBWXR6OWVBY1NtVzMxZXhsR1RlS1dadzZIckFWMWJpT3RU?=
 =?utf-8?B?bkVSbW5zWVFaY3IvcDNJTUlGMWdoWUg4Wk9oUE94WWphMWtWeW9Wc1c5OXgz?=
 =?utf-8?B?VU44OEVHL0VkNHRtS1h3T0tLQUQ5THZZVzlJN1JrSnpKQ1FGMGxncHBpcXNy?=
 =?utf-8?B?cGhERVoraDJLWjFTZVpwMmZwVUptdmhxbHpXVVZKWXZTbDNDSTAwUE8vczQ3?=
 =?utf-8?B?eG01VWxPZHAzVXQxTzFXQmpGaVEra3JSSGhmdGpLMEdldTV5Q0M2cFhXbWZh?=
 =?utf-8?B?cEgrdWQzdXJrUW9iWUhRRFpOazZyajNSTURLSFZkSjlaWUI1ZFVNeDJqZzI0?=
 =?utf-8?B?OG9EeEl3TEU1dTljLy9ERWw5NitrS1FSV1JQcXpzalB4RFVZcnFHSlVOQnFp?=
 =?utf-8?B?V0dCTi8zODdhUlpYVUhwcGVWTWhLL1RHcGhHUFBSV2RCd1AyT3pZMWZIbVVP?=
 =?utf-8?B?czhCQXpYUm1CQnlZOEFUSHJtS21oZDM0ZzhxRnpUdzJDYjlWcjFMdUNzMzRl?=
 =?utf-8?B?QmJaRlg2RGhKekZEa2hFa2VDVVlPeUkvZE5TdW95VGx5dk94VjFnTWl1SkFN?=
 =?utf-8?B?aWxOUkNULyt5OVh2QnZrMWcxVlVKMVJtdWFrdFJzdlBNQ0ZwZjhNY3RhTjNt?=
 =?utf-8?B?bmoyQjBLQXFETGliS3ZFM1FPUzFkSm9JYlg0bnlBSkNJcnRBOHd2Z0VyVkFR?=
 =?utf-8?B?UllWWjNzV0NyMnhTVDBuYkxqU0VHUlVpZUthaFFXekNlblI0YVhieW9SODRi?=
 =?utf-8?Q?5Ki0U9TG3INngn+RHvxIgqHka?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 08f64242-7753-412b-34c5-08de23e0f032
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Nov 2025 00:50:14.4426 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: A9qFSlRKuN2Uk2QIJ88BmvzCs4TN7raygVpxwgH+jSeA7R8mNUtQ2jYsZKOHgARyrAUYO2/u95ALfQO2OsmjlQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS2PR12MB9663
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

On 11/14/25 6:37 AM, Alexandre Courbot wrote:
> On Fri Nov 14, 2025 at 11:41 AM JST, John Hubbard wrote:
...
> Something felt a bit off with this diff, and I only realized why now.
> 
> We are moving, for no good reason, the creation of `Revision` into the
> boot0 (and later boot42) register, which forces us to increase the
> visibility of its fields.
> 
> And while `Revision` is now created by a method of the register it
> originates from, `Spec` for some reason isn't, and we even add a
> `TryFrom` implementation for it here. This creates an asymmetry that has
> no justification afaict.
> 
> Instead, what if we replaced this `from_boot0` method by a `From<BOOT0>`
> implementation? That way, we have consistency in how we derive our chip
> information structures, and this patch can be reduced to this (with the
> other changes below):

Yes, that allows leaving Revision's members private, which shows that
we're laying out the objects in a better way.

I've implemented this for v9.

> 
> diff --git a/drivers/gpu/nova-core/gpu.rs b/drivers/gpu/nova-core/gpu.rs
> index dfeba9d5d8f6..57c20d1e7274 100644
> --- a/drivers/gpu/nova-core/gpu.rs
> +++ b/drivers/gpu/nova-core/gpu.rs
> @@ -147,8 +147,8 @@ pub(crate) struct Revision {
>      minor: u8,
>  }
> 
> -impl Revision {
> -    fn from_boot0(boot0: regs::NV_PMC_BOOT_0) -> Self {
> +impl From<regs::NV_PMC_BOOT_0> for Revision {
> +    fn from(boot0: regs::NV_PMC_BOOT_0) -> Self {
>          Self {
>              major: boot0.major_revision(),
>              minor: boot0.minor_revision(),
> @@ -162,10 +162,9 @@ fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
>      }
>  }
> 
> -/// Structure holding the metadata of the GPU.
> +/// Structure holding a basic description of the GPU: `Chipset` and `Revision`.
>  pub(crate) struct Spec {
>      chipset: Chipset,
> -    /// The revision of the chipset.
>      revision: Revision,
>  }
> 
> @@ -173,9 +172,17 @@ impl Spec {
>      fn new(bar: &Bar0) -> Result<Spec> {
>          let boot0 = regs::NV_PMC_BOOT_0::read(bar);
> 
> +        Spec::try_from(boot0)
> +    }
> +}
> +
> +impl TryFrom<regs::NV_PMC_BOOT_0> for Spec {
> +    type Error = Error;
> +
> +    fn try_from(boot0: regs::NV_PMC_BOOT_0) -> Result<Self> {
>          Ok(Self {
>              chipset: boot0.chipset()?,
> -            revision: Revision::from_boot0(boot0),
> +            revision: boot0.into(),
>          })
>      }
>  }
> 
> ... and the subsequent patches also get some simplification.
> 
>>  }
>>  
>>  impl fmt::Display for Revision {
>> @@ -162,10 +153,9 @@ fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
>>      }
>>  }
>>  
>> -/// Structure holding the metadata of the GPU.
>> +/// Structure holding a basic description of the GPU: `Architecture`, `Chipset` and `Revision`.
> 
> There is no `Architecture` in this structure though?
> 
>>  pub(crate) struct Spec {
>>      chipset: Chipset,
>> -    /// The revision of the chipset.
>>      revision: Revision,
>>  }
>>  
>> @@ -173,9 +163,17 @@ impl Spec {
>>      fn new(bar: &Bar0) -> Result<Spec> {
>>          let boot0 = regs::NV_PMC_BOOT_0::read(bar);
>>  
>> +        Spec::try_from(boot0)
>> +    }
>> +}
>> +
>> +impl TryFrom<regs::NV_PMC_BOOT_0> for Spec {
>> +    type Error = Error;
>> +
>> +    fn try_from(boot0: regs::NV_PMC_BOOT_0) -> Result<Self> {
>>          Ok(Self {
>>              chipset: boot0.chipset()?,
>> -            revision: Revision::from_boot0(boot0),
>> +            revision: boot0.revision(),
>>      }
>>          })
>>  }
>> diff --git a/drivers/gpu/nova-core/regs.rs b/drivers/gpu/nova-core/regs.rs
>> index 934003cab8a8..8c9af3c59708 100644
>> --- a/drivers/gpu/nova-core/regs.rs
>> +++ b/drivers/gpu/nova-core/regs.rs
>> @@ -24,7 +24,8 @@
>>      },
>>      gpu::{
>>          Architecture,
>> -        Chipset, //
>> +        Chipset,
>> +        Revision, //
>>      },
>>      num::FromSafeCast,
>>  };
>> @@ -56,6 +57,14 @@ pub(crate) fn chipset(self) -> Result<Chipset> {
>>              })
>>              .and_then(Chipset::try_from)
>>      }
>> +
>> +    /// Returns the revision information of the chip.
>> +    pub(crate) fn revision(self) -> Revision {
>> +        Revision {
>> +            major: self.major_revision(),
>> +            minor: self.minor_revision(),
>> +        }
>> +    }
> 
> With the `From<BOOT0> for Revision` implementation we can also drop this
> method.

Yes. Done.


thanks,
-- 
John Hubbard

