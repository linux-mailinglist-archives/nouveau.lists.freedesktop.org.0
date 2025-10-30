Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 208BDC1DEDA
	for <lists+nouveau@lfdr.de>; Thu, 30 Oct 2025 01:38:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1054610E870;
	Thu, 30 Oct 2025 00:37:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="tH6famvZ";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from PH0PR06CU001.outbound.protection.outlook.com
 (mail-westus3azon11011009.outbound.protection.outlook.com [40.107.208.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0BED310E870;
 Thu, 30 Oct 2025 00:37:51 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=exV6X84TLfmyv5oFUZV/wp19PQT2qDxlkR2Te5o0ugG1KJn3iykbzWOnCjp8URZdriBy3vueIyBMdwgItw0+8PqYMx7y0InZxDCl9ZTwOtvuL7vfnNbcvCxoXX4O4hd8BuLrkflyCIcvBnTmyTS17kPJSMBQkK1og31He6ct9MCSs3rVLwXrktqKHj2ZtDspBfSYQoCyeSuhlVdYg4N20Qr4YefapAVv+9VR0KVDDpbVgoAfez5uU841q+iPjVAmxuMuRcWrhKsGbDAB2w6xKjKDe2WhHi7Uocn0CatfCivZadfzxvIMzMdms2G2S2K8/t33W+00wAQQrkF+W46uzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LGaqq6YEowxCn9ElhOF7H7xsXmDC4PohoznS9wyyPSA=;
 b=OWLie+CfYWEHG+Jz32BV3vwCPBvlRxdygk75xLl/xaTavG34B7Fx5HPvXDtVyh4uSOsAG6bO1zbcXzROqD9rjcCV2EP3Zkh+9grEJ8J2LdXrtA8iFWCEDiXocJUiHNyO1Ohwl8jam9y5lbup/rP727enPIot7BnA0xDtrGopxWhL0M8SV8Wx39nRUo1cinA/8gZsK4Wx3OB8usXHPu70z5SAVW1X69vMOZ2zVYNZoXucAg2hEyBa2/gBAr9GJVRjNBU4MYdMr6qYhRNpBT/4JB2qc7bu5OA8I5mqf9x0YyEWCLFPaN1W6StikQSXyq4vkJxgm8S2NThB94ePyFuyNQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LGaqq6YEowxCn9ElhOF7H7xsXmDC4PohoznS9wyyPSA=;
 b=tH6famvZkDfjKVZpk9tn74GUE+HlPpYq/lkn1w4m1UEiOpFpD0UH/gWZjAqFJJ79bZN168/B4HRGMXXdA+JC82wAU+G55EC+PO0FvMdasQ1yt7DLZ5UQnh9VCRvziJOCsqF008GRtdxAmLExCM2IDmmmr8pjJzK3MlB4CTPDd+i68kXC1Oo+qqdk+VMO5pyt/n8iaZhIv9XIpCzW3DP14oVcC+TRIHlT/8Pu4nIVMVOV5UlYPseYYnB0zZmjyxjzPiitwBvnomSymedl25Orf940im6m4/cRWQTs7fkke5ym6uXewpJH9e8TTJRZmlXg04PC/WR/fXXE+6rl5A2Inw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from BY5PR12MB4116.namprd12.prod.outlook.com (2603:10b6:a03:210::13)
 by LV8PR12MB9134.namprd12.prod.outlook.com (2603:10b6:408:180::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.13; Thu, 30 Oct
 2025 00:37:48 +0000
Received: from BY5PR12MB4116.namprd12.prod.outlook.com
 ([fe80::81b6:1af8:921b:3fb4]) by BY5PR12MB4116.namprd12.prod.outlook.com
 ([fe80::81b6:1af8:921b:3fb4%4]) with mapi id 15.20.9275.011; Thu, 30 Oct 2025
 00:37:48 +0000
Message-ID: <b0ba09ba-5e28-44c7-b9b3-e199bb968fe6@nvidia.com>
Date: Wed, 29 Oct 2025 17:37:47 -0700
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
 <DDURPPIWWIA7.27RFSM7KRLN7I@kernel.org>
 <DDUUUUL0GXAM.2LNWCIEW124JY@nvidia.com>
Content-Language: en-US
From: John Hubbard <jhubbard@nvidia.com>
In-Reply-To: <DDUUUUL0GXAM.2LNWCIEW124JY@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR03CA0274.namprd03.prod.outlook.com
 (2603:10b6:a03:39e::9) To BY5PR12MB4116.namprd12.prod.outlook.com
 (2603:10b6:a03:210::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY5PR12MB4116:EE_|LV8PR12MB9134:EE_
X-MS-Office365-Filtering-Correlation-Id: 6805b686-fae3-403e-d9a8-08de174c8ce5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ejV1UGJjaVZqRk9zbUNnVjlMZTZPU1M3SWNBcHltaXJyd3luVlZPV3k0bWk3?=
 =?utf-8?B?OW1nZUJidkJHYlA0OTdwRmpDK3pWWU50TXZIN2RxdUYwR2puRGxGVjIvWDM5?=
 =?utf-8?B?MVUrN3VkRytvL2F1aXBQVGR5NFJnaGUxc0JrYnVMelNWaXE5YzhGUWRRYUIv?=
 =?utf-8?B?T1BGWEdnSnhGdG1uZkhEYlNFRkZrMDZIaWxDc01WZjhjbEU5aXFyek9TRUxt?=
 =?utf-8?B?cDVUWVd2WFAzS0t2UFA5VkhTaHM4cTN6cnpnSXdDQlJQRElzVXBUZHRTYVcw?=
 =?utf-8?B?WStMenp1N2V5VUlscDFreTUvOHFyWDdKNURETXdsSW1GQmpZL2RpSnB0U2l5?=
 =?utf-8?B?KytkbGY2aFp3aWNJbnVVcVovZFhtRVNwRm1XQ1BPRU83NndpdWtwSTRxR2F5?=
 =?utf-8?B?VU5ZOEh5QS9WQ2hkMllpQ0JwWGRlNHdBRWoydUpYOHplU2YvVjhwSnFhNUJT?=
 =?utf-8?B?VTU1SDcyYWpVajBybTBFb3J1OE1ZSzVsLzdvZjlteWc3QnVPZHdqY0hmb2Uy?=
 =?utf-8?B?bnF5RnJUOUc3eFBDRllLT2pJR1N1ZFlNT2NLdlJoajRYSDhMeEkyd3JidFFX?=
 =?utf-8?B?UVdJYmtWcE9tZmNSUGd2TzRnZFdtQmJFODBuUzk1Y0RyOWJUNmlQd0FNM0lM?=
 =?utf-8?B?ei9JcktBYnVsZEdKOFdtWG9pa3h3ZHNqbU53VFFIaSt6SWxRVEFMWFprekFC?=
 =?utf-8?B?eFpLTk9kTEplWGIvZ2Jldy9ERHF2ZENNRHc0Y29yWE0zOGUzN1NFVWFwcVZz?=
 =?utf-8?B?dUsvQ3FkbjRQRVVuRWJYWkhEVnEzT0sycm5uV3RyYlJKMGQveWJFSEVVblVl?=
 =?utf-8?B?bmluMFlWS0sySHJ2bXJNUGdZK1FpSUtYRzNWREk3L2ZtL1Z2Y0d5dWU3ZXU1?=
 =?utf-8?B?WmlFc2daQy9DUjhiQUk5WHYxemJRVUxLMFd1V0RUa0tHQk9aRGxReUJMaWxv?=
 =?utf-8?B?aGh0S0ZYVk55dEtIMDh0NUlpTXBiK0d3VTFuTVZidFIzZVR4WFhQWGQ4bEpT?=
 =?utf-8?B?bkt5TFRpZVJjbHJRRFFMQ0podmFzeFdQTUsvc3dJWmFRQWt0YzlZTm1SVUt6?=
 =?utf-8?B?ckowOXJmYXQxa29adHI2Rmk5N3Z1ektZVlNNTGxWOTVKS1ZIMVFwd254YklT?=
 =?utf-8?B?UHM0UXBSQ25KeDBTU0VhU3BvT3ZINHpZZzN6ekFEVVdaRjJkRmNBQnIvNnRI?=
 =?utf-8?B?ZExrbHdLekZnbnNBUmt1MXg0TzJTWXRPVDJEUkJhdGdqTFBIc2dFeHczelFD?=
 =?utf-8?B?MjRRbGVWY0U1T0JLZ1o1bmx3YnNzb3R4OFk3c29tY0lPWEsxS0YzWlZPTUgv?=
 =?utf-8?B?dk1tVlZaN0JjK0M2UXZlS1d4WXNNbGdhN3NwSEpWcHFQSmtjU2ttYm9iaFE3?=
 =?utf-8?B?OCtGZk9MaVY2b1hnU2hmVTdpOUl3eVhxWVlZR2dVT0thSHhpRUpLZnpmK1RM?=
 =?utf-8?B?MVJQWUgvSEl2b1Z0dXBtSXlFV3VYMWFYZG1LTm5ubkJmR282V2kraGRObmE2?=
 =?utf-8?B?SU5KVW11SXhmcEIvcnZxRWYyTWs3eEdRNjFmUzlHMWFzVTBBakg3ak5ocCtE?=
 =?utf-8?B?NTB2V3I0Z2loUnllZzFTYUU5UkhYSFhXRGpIdzE5TWN1c0NEZjEwZk1iZjhP?=
 =?utf-8?B?UFV0OEMxQlBlekNEV0syRXJNUFViZ3hpWUJKZFZ0YTRld20vWjFlV3pHQ0xY?=
 =?utf-8?B?ZU9IckFoak5vcVV4ZHpaN0NES21PMk1tWlBNaUR4dEkwUDFjZkJzQ3h1TzIw?=
 =?utf-8?B?WHpsOG5CZjNVNXF3RUo3NytNL1VqRDBhREx0d1FTZ3hTUWJhZ1RHRjRIRE5U?=
 =?utf-8?B?RE1RaEZXZk15TlFrTTIxR3diVjdZblc5SW5mUXhUcDIrL01tNERuR2N4SXgv?=
 =?utf-8?B?SDE3L0lJRXBvTy9WUDRzM3FqTm03aWlsTDJGMXpESEI4WEZUOFlXVTd1aXBj?=
 =?utf-8?Q?jXQpM1yUiEsCpYGUSrUnF9FlBGzD6Tc2?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR12MB4116.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QWx3VlAxTSsvUzRDeXRVNHA3dERIOFFLUnErTnVJOTNVcVprZi9iN0t3Z0Fl?=
 =?utf-8?B?NzIvbXU1dzkra3lYMjNWL21EUFozT0t4YkRUNFNqSTZqbHg3amQ5V3B1UTYz?=
 =?utf-8?B?TGs4UEltVXQ0dkNkL05uMW5ySG1Ed3lrMTBjc0NERzVzNXZSOVFVVC9XNDFR?=
 =?utf-8?B?UnlpSVdpMjhUYTBCRDd4am5ZVktFQ0NJSWxHWWJPcXdORS8vVk13VCtBTExx?=
 =?utf-8?B?c0Fvc2p3NXpHVkM4bG1CZ0daTDlTTjU5WEFxY2pMeXcvNFpFQ2psRmk2aXln?=
 =?utf-8?B?R0xVSlUyWWM5WjZrWGFPeno0enN6cUszaytMQlMydll1R0pXZXFhczU2ZXps?=
 =?utf-8?B?dWtpTDBlNDJoaDd5Y1lzU1NZUnk0UW1lUTBrcXFnc1J1QXZCeTA3eXpmTy9y?=
 =?utf-8?B?ekxTcVpaRTFDcTZqUGhTRlEwMVJxdE0yZXF6SWd4WDhsaEVtN3IzVkxVcU9L?=
 =?utf-8?B?bHlGeHByOXpaNG9EUWFEV3VCTjZkOFBQQlN5UlArbXUzVlZMMWt2clhUalJX?=
 =?utf-8?B?UGlER0xseXZJQlRLK0NMNFcwN0NHeVdsbFNUT0NsaE0xME0zWTlFa1FqbGNG?=
 =?utf-8?B?K2tzQjVCUFBuUElpWnhnSm8xOEhYSHRlZi9TSFQ4dDVyb1ovazB0OVdmZGNM?=
 =?utf-8?B?aDFWUDVYSEFyZzVBNTZmVUhmZjJDUHV2ZWR6WEFJRC9DcGxWTk91M2ZQakR3?=
 =?utf-8?B?cGVJVnBPMk12UmFmVTNQd09wYjNPdDkvU2Z6Y2IzdHlERmNmVmtNdGtqT1lI?=
 =?utf-8?B?RnhiazNQc0lnMkZBcENOeVRBSjh1S2VsUlJsZXpEM0JWcFF2SFlaT2syRnF0?=
 =?utf-8?B?YVc3dmZTMEFUa2wzb25KSEltWHdWNFBNR0hScEtrUEgycFA1aDdKSzJQTzdq?=
 =?utf-8?B?UEZVYnUwUGMySGordHNSWnFZdjRseThyTi9WQVBjU3BUaU1QMDZwZy9vQitU?=
 =?utf-8?B?eS9HOU8xMmRBMFN0QUYwb2NEQWhKSjlHd1lxekI1V2VOaXFVK2o3VDBnK2ty?=
 =?utf-8?B?Ym5CYnpDM2diS2JDT2tyeXVpQVZyUzFxS3ZqQXl4VUE1VEEzWlAzWllrRmR0?=
 =?utf-8?B?bGhSOWN6ZWp0UXRuaEdKYUJZem0vaUcyWFZ4NktyYkI1NVBGOGFRRHF2Rmc1?=
 =?utf-8?B?QTBkcXhtNkRHcXNiZHNIQjAxMDB1cjlJaGgwZnpadlAzVGlxYm1LUGZ2RnQ4?=
 =?utf-8?B?K3BrRmJTdWFCbCtGaWt2UVE4K3FnZkRXUk5RQk0wNFRGeG5ld3RvMmYyOUpi?=
 =?utf-8?B?MTNXNUh1K245M3ZvdzVoV1pVMk9ZVk5WdVhKRCtud3lvMmVGalNKRllxSktX?=
 =?utf-8?B?ZWQ4Q1g0ZUhoWDZ6SWFDZXltbTIwUmptNTVYK1g1Z3ViS1cwUXZaeWNLZ2Zp?=
 =?utf-8?B?QTdEcFU5R0RJdGQ1UytlR3FaQm1TVGV2Vmo4UE5iN0FzWkg0dDRucTg5WHdy?=
 =?utf-8?B?clYwV0dVNGt2dno3YzVhcXVBdmtiNHpSeG13S1VUdU9zQk5kUTZHOStnMk1Y?=
 =?utf-8?B?WkFySmdYY0lIdEpPRlBoNjVVN3BCWWw3VjdNMU9USzlqVFNpaTNZUHMxUDZk?=
 =?utf-8?B?K1Qrby9sOTA2VFVSeXBHNHk0bk1ycW1peU5MZFdrWjRkRmpEYmNKTHJsakEz?=
 =?utf-8?B?R2Z3bU1nOEc2N0pWVWdSd1U0UlJqb0lsR1J4b1JLUEYyeDk5bnZaV3A4WFE4?=
 =?utf-8?B?S1VMZ0dlTmY2OFFzZE9QUVd0a1RLd3lqR0VJWjNoeFVESjc0SlJwZVhDWTg0?=
 =?utf-8?B?VlZuMEhKSkdvVVQ1Y24wUjdScDZrZUE5Y3Y3b3dvZzhsNDJwcWF4Vkd3eUsw?=
 =?utf-8?B?WWFLVlFNYTQ1VTlYOHZKcmI3VTdrVUdzZVV2WjJ6MWo0Q1BMbmxzN0Ntbndp?=
 =?utf-8?B?L3Z3WngwbENVeE54UCtkaU0xZTcxMnc3RDlFR2tVVFRtNFRCaGphYnhncG0r?=
 =?utf-8?B?MVQrN0RwQjZJU1YyOVptRkQxUENoUDZEVC9CeFBZcmd1NUNNbWtGdm5FV1c1?=
 =?utf-8?B?ZlNha1hGUGNWZ1VSSWo5ckVObEN4eVhHalQ5WjdjQThSMHJ5R25INm1UeWcy?=
 =?utf-8?B?a2hxTERmNGJxZ3NSTjJhdGdVUlR0bFhXR2hBZy81eVl4enM1QTZETEZuS2RO?=
 =?utf-8?Q?Y7+DnJsAgZB/rElVfidhvjRWl?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6805b686-fae3-403e-d9a8-08de174c8ce5
X-MS-Exchange-CrossTenant-AuthSource: BY5PR12MB4116.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Oct 2025 00:37:48.3238 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: f0OAuZ6jPyoUil7nsdGb8JmC3M9nOoQliLXomWsIJGM5NZAN94w5ogJM67bsGrmeHudSw152rh4Ofjogrsz6ww==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR12MB9134
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

On 10/29/25 6:54 AM, Alexandre Courbot wrote:
> On Wed Oct 29, 2025 at 8:26 PM JST, Danilo Krummrich wrote:
> <snip>
...
> I don't think this will work because `NV_PMC_BOOT_0` and
> `NV_PMC_BOOT_42` are different types, so we cannot alternate them in the
> same call to `try_from`. But the following should:
> 
>     let boot0 = regs::NV_PMC_BOOT_0::read(bar);
>     ...
> 
>     if boot0.is_nv04() {
>         Err(ENODEV)?
>     }
> 
>     if boot0.is_next_gen() {
>         Spec::try_from(regs::NV_PMC_BOOT_42::read(bar))
>     } else {
>         Spec::try_from(boot0)
>     }
> 

Done. Final code snippet looks like this:

        let boot0 = regs::NV_PMC_BOOT_0::read(bar);

        if boot0.use_boot42_instead() {
            Spec::try_from(regs::NV_PMC_BOOT_42::read(bar))
        } else {
            Spec::try_from(boot0)
        }

thanks,
-- 
John Hubbard

