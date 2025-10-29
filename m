Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A6DFDC1B127
	for <lists+nouveau@lfdr.de>; Wed, 29 Oct 2025 15:06:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ABAD810E1FF;
	Wed, 29 Oct 2025 14:05:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="jq+FNwpa";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from SN4PR0501CU005.outbound.protection.outlook.com
 (mail-southcentralusazon11011037.outbound.protection.outlook.com
 [40.93.194.37])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 294E210E1FF;
 Wed, 29 Oct 2025 14:05:58 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=j1kSjH3E4BRYFIXfQcA6Vl3CB9f8+XtlhjgwbOIag7FHO/pEgni0oLG+eGxbhp1IW8LrDl5tQkter9s182UwwYKdA1Aj6cinUwtGCcOIjHAcdxDgx+tKrofNycHtVTCFMyCa3nUPsquBc4wDq0Lki03uFm3VPnhq7O899yyWLBwVUlIpJmplrBYDx6siI4RmSU/qMXDNtZUeFDAgV1RsNmo+E/QOCPHtDbpMQE9pBzlpPmzIPNR1FRU7DzKL1PbQfBY7XztR3SS77lnnJRHaG2BEOLU5v2Ue9VXszUAeT1V7cTsGtmwC6Sz6sqgtxPYX/qywt1SOtb6HrveBJzZITA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=n+mT64GR0Nobkh1jY9d7bPhelK+5kjHd0GgUlPDT1m8=;
 b=bi6T6icsKLrmWplnr6N2otlY17maXdDxv507Q0XX8D+SP1veNMbO7NwvP7Tddr1Ak5rLVAQsvhnody/a/fFAakO7Hvo9ZrX4x7YQuxjwYvROo1JKmeXS8axaYw2URon+SQqx3qsePp8ewimBZaFRjAtMAHSVVftjOVd2EXuaIwgRdRiBzspkcvAJ8vhgIfs7lrkOVHY1Ndq/u3rquKrTNKOxjLugFdk5orKbSydKwp1+V+FHBhh/wMOBf+nFWGoosmbmKcNswo54H4l9xpkwfSIjG23vaFA3eZzDzRdGx7KmB6OG5a5XTPTjXYUUXt5wRparKkrzP6YOgt0mFWqg5Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=n+mT64GR0Nobkh1jY9d7bPhelK+5kjHd0GgUlPDT1m8=;
 b=jq+FNwpaCHVKJO9z+ISDvrRPYeOctkz9QAXpt+sBwzYoi5EzRcOwqq+PXVfzghpluGzTYrM8dBPTbYpR/aCEGn49m1NNbYoEuoTNDBdf3D3aXy/cJEJ2BFwTzo+K28Ol1yUpneIHonlOr8YqAKmM2uVQlMzUwS07Hb9+1BZR4T9O3S49MEBf88MvHRY9JZGsFgHL/8A/XN/svCaxS0Kn6Jun+GkO8LgDfauWnn5komW9OKGPcePQE2QaszgT3ryzOLvic+e2TBzgRndNbJZbMza0ISBLCAlnZBS/ziLADcGMdi1kzsXINKSA8kWo7flQh2DkWGYo1Lv3CnTjI4dMwQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by LV3PR12MB9168.namprd12.prod.outlook.com (2603:10b6:408:19a::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.19; Wed, 29 Oct
 2025 14:05:51 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9275.013; Wed, 29 Oct 2025
 14:05:51 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 29 Oct 2025 23:05:47 +0900
Message-Id: <DDUV3MZ58O0T.229A7N13MM1HN@nvidia.com>
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
Subject: Re: [PATCH v3 2/2] gpu: nova-core: add boot42 support for next-gen
 GPUs
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "John Hubbard" <jhubbard@nvidia.com>, "Danilo Krummrich" <dakr@kernel.org>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20251029030332.514358-1-jhubbard@nvidia.com>
 <20251029030332.514358-3-jhubbard@nvidia.com>
In-Reply-To: <20251029030332.514358-3-jhubbard@nvidia.com>
X-ClientProxiedBy: TYCP286CA0244.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:456::19) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|LV3PR12MB9168:EE_
X-MS-Office365-Filtering-Correlation-Id: 051b080f-1d12-41d6-4fdd-08de16f4445a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|10070799003|1800799024|376014|7416014; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?aHFEMTJLTFFxUTNwN3lleWQ2SFpRYm0yVmozOTUrQnMxc2R1OHhSQURFTXNr?=
 =?utf-8?B?enQxcDY3TWp0Skp5UGdwWW1tODY4Nk5NbXF1ZDlYWDNGZVNlRkZMR0FKRmpR?=
 =?utf-8?B?NG5oTzVscXoxQ3BtaG9VSElKemhzbytQdUNpcC8zNDNzWGVDaFVHelFtREc2?=
 =?utf-8?B?SWxqR0NLZ3k4SWpCaUlLRTk0YVlsTnlVQUtyYm4vd0dTYnJtNTVqUkNPN2E5?=
 =?utf-8?B?UGZnUFRoTVhYZ05BWXBUcWczTkp2OG11N2FNUjBZTDA3b1hibDJZcG1qUkdu?=
 =?utf-8?B?V3BsZnZ5TFNCMzZ3dmpwYnFweHVLRHhIcnZLZU1kdVYvbkdhRzloUENmNjBU?=
 =?utf-8?B?dnNVWlg0WUdzYkkxeG9qTTNveEZ4cXFEZVhtbG8xT3MyQytvNytna3FsR3JE?=
 =?utf-8?B?eXVsM0VFV1pPOE43dlA4ejRDSXFNYUZhWFMwNXlQOWRmck5zbkRqZUMzM1l2?=
 =?utf-8?B?b3d1US96YlBKdFRTMzl5TUZ5d3FWRyszSDJDTTVYL0JZcXpGUDAxVlR6M1Jl?=
 =?utf-8?B?QUkwd1dYVmJraXpWZzltV2lQSkFZNUkvSkEramxhb1pTSXJ4aUl4K0R2ZWVv?=
 =?utf-8?B?RXZuYXYvSm1vQXlwSjBQQTlJdytwN015SjVObTV5M211THZqRVZjSDNhOFd4?=
 =?utf-8?B?TmlaNWwzQmtBNW55ZENtSWFzOFVYU0M3dEwwbkVGOEJEWEdpeElQV2g4Yi9n?=
 =?utf-8?B?QjcvRUhmNElpanpLTEwzVUF6dlRMYTl2b1VuRjkweXVDQTNrT3VZeDlEN0w2?=
 =?utf-8?B?ZTdFc1NuSTdPcjVtcTI2eXErVEtuS09GUHEvcDZOYlVuVXkybThvMlFVYUkv?=
 =?utf-8?B?M1J3aUp1MHZLMWxtL3hvSHdXSjQ1RWR4T2pSbTZvVFBtRC9aQjhHZktKcmIx?=
 =?utf-8?B?Z0NQSVpwN3U5OThIejZDb1FWRFRvK0ZNMnJHV2VCUTdYYmROaG5HNjhQTHhZ?=
 =?utf-8?B?OEdkeDJSWko4WDlYd29SRnZaN3RWc0V3dVRDcmZVVnJ5Y3B3K0pBN1UrVllt?=
 =?utf-8?B?d2tDQVhNajhyK0phbkdLN05vYnFxNGpGU01GTTAvRDNORWppZC9QdDROOGR1?=
 =?utf-8?B?Y3orWng4ZkJMdU9WNFdweDhjVHdrM1NuMW9HcWpPR3dEci8xUHIyVGFSTThO?=
 =?utf-8?B?Nmk1UjBxUW9zdzJCb1QzdHZrNnk3bWs4MlRqaTBrQ1RTMHRSNGxMS1o2ekpY?=
 =?utf-8?B?elZzeGN6TXpBNldwY1JyS0t4WitGU01ITm92SFdic2c0UzkzSTNUN3lNRWN1?=
 =?utf-8?B?RERBMm9PLy96THkxM3VKM1BJVXhIemkwYUhUemRZYkhRTjU0MjlnUFI5MnN6?=
 =?utf-8?B?Y1JDV0s5Y1prbjVmSjJQR3Y3ZkJwQTFnUDJJbFB0ZHl0OUVRWjJJN3g2TjlT?=
 =?utf-8?B?MnBYL2R0bndCYkI0UzJRRGprTjM4VHUyeElKb0tsaXBIbVhVNFpPWVpVWnBu?=
 =?utf-8?B?ZEZQQ003b3Nya2FzTFViaU03OXlPSi9zaHpLVTE1KzBETzhseXN3YVh1VEV0?=
 =?utf-8?B?ZlZSbTFUbTl2T29iamRWQzFsV0ZRSjNwYjd4NEIzT1FabVAycVVOaWV0cUlZ?=
 =?utf-8?B?cWVGNUtMUXYyRHVRUW9JaU9ueXZBWVRidm9tWUVxMmgrYW5Hb2owRmx6Rnpo?=
 =?utf-8?B?SFlhNlphT0tYQjlXMGJVVFZEMEFqNU9QZ21GS05nUmdtNTRicE1ZbC8yNEhl?=
 =?utf-8?B?MDg4NkU0a20xa1VMSGxpUm9keVRodnRpb3lUZjVmcGtKUys1YkZrMXMwZVdy?=
 =?utf-8?B?TzBkV0txU1daWWpkanlSNjYwSGZJb2xMcGRPekNEZWtKUldocUJ0TngwNU1V?=
 =?utf-8?B?RkpWRHNzbVc4QlRBR3dibUdlMEJFai9IZmhFMEZ3b1cvcDBBQU5KQUhOQmMv?=
 =?utf-8?B?QURERXhjSlhaOS80ZkNZTzl0OVM1bTZJQmRmejRzTzQvYW0wTDVuNkl2WnBn?=
 =?utf-8?Q?Iahjo0gycvq/qYIhWZ8FJ8wwGsNCC0IK?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(10070799003)(1800799024)(376014)(7416014); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?blBBYmZ5ZVBBaU1vOEp3YjZsWWhpbGRqd1RIbndwNmo4U1JzdUdRVlpMMFN1?=
 =?utf-8?B?Y2t4WmsvYUlQNVY5Q0hKTWJTOG93MXhFZ1Ntb2ZaRk4xZkZmUm1RUEtOR1Ja?=
 =?utf-8?B?YWdGOEtoMzd3b0FyNEc5ZFBIbGFqRFlONUY4bzRicTVQdjRxbGhnZW50enFJ?=
 =?utf-8?B?ckxBMXRlS2YvYW9KS1FnRGNaN3lVQjh6YnV3SUIrQVloOHd4eC9XNlV4ZnBj?=
 =?utf-8?B?Qk85UzJ0YjQ1cWp0RWlsSlA2UlhONkJjY3lrMUlQd1l4TkZheFhFL0RrYTJL?=
 =?utf-8?B?MUZmSng0YnAxNng3WVNGV2xjOXVORCtCVWpFNFZVSHg4UmpaN0N0K3pRajRZ?=
 =?utf-8?B?TXBiYWxpekZVRG5HcEtyNmN3U0pWNGNzQ3BWYjF5OW5tZTdzZkpteXI2R2Qv?=
 =?utf-8?B?WnVMYmQrMnlWNjhFaXV5Umo5bVBJbzA3QzdIMGl5U1hKWnplMGpvTVZDa216?=
 =?utf-8?B?bnFLRU9Bbzh2OWVzMWRnNjJwbGJORW81clRaY2xtWGk5SVViQnhDQ3hickZN?=
 =?utf-8?B?TzJUc1RtTkovUk5mR0Z5MUhuVCtwa1g4c2tGeVBNRzlwa2ZqVEVQeGwyRGRT?=
 =?utf-8?B?bVNkRWJzTU5Id3hxOGoyVU4weGhuMGtpN0JWYUhqVHlCQTNvd2hOQWtNVC80?=
 =?utf-8?B?VUxrSG9GblBDaFV6cmlxdE9CbkVFRnprb09ERnFubHF6L2ZKcVNVZ3UweFN5?=
 =?utf-8?B?OEovelEzb1NxQXNSbHFibkdPWEtrTlZHWFZVY1BnVTU0YUFqREtKTmpvSGli?=
 =?utf-8?B?ZGwzRURPYVFqSHhLTi8rSnRjUWdHUS9qUTkzUjFpdXMzbEtYUENRejhWbzNH?=
 =?utf-8?B?blpVZkVHLzZ0VEJqamdhTEhIUEJBT1U4a2Q4V1hYU2lldzB1T0MzYjRDRzFF?=
 =?utf-8?B?NWRYWVJ2NCt4TVpDZ0NaL1ppVSt4cCtLNXp1OVZZdFJsZXNBRXFXNHQ1NTdF?=
 =?utf-8?B?WXhmaUsycHZXckpJQ1FKMGFXdzZEcUk4R1dUYlIzSnl2d0pDems2a1BJQ2hO?=
 =?utf-8?B?dUVWQ2VxUDFFd0V5TDNzZWZPSFZOY3I0bDlGUmdiak1iT3o3Wi8zbnV0SzNT?=
 =?utf-8?B?Zmd5UzdsRlBzU1czWUVIeXFtMXJKeVVlMzV5Smk4bVZZWXRHMmNFeE1WSHo5?=
 =?utf-8?B?SDI5K0laSng0REtjQytBQkdmSkVZcU15cUtROTgrRmdmdWJkdHB5cTVVelV4?=
 =?utf-8?B?SUdSeG1EZ3ZCQ1Z0UFpqL3lLSGs4OHdBaFdjS1BlWTdDOUN6VC82akhuQ1hi?=
 =?utf-8?B?SEtBYURCOHpTNjQ2NkhoVmpwTTNnRis1STZ5Um1wRWRlT3M2VUw2M0hkNXU0?=
 =?utf-8?B?SklFdEZ5dE9adHF0TmQrSGNucW03Ymw2bWZiNGdVV0UwWFNiSFhTclhSYnpH?=
 =?utf-8?B?eFlIWEZoUTREV3ZYbkJQQzNydkU3eENXT1VDTFkyajNKK0IwbStJQko1NXYv?=
 =?utf-8?B?djlLR1pSMjVwZWhIYnFPc25tYkM4cW5wZk1LNjcvQ0w3cHlzQnRDSGk0UktJ?=
 =?utf-8?B?dUJkZWVoU1p4Z1NlMWxMVHJ0L3pvV3NXTDcwcFViR0g2VWJQZ01obDM0TzEz?=
 =?utf-8?B?ZStIallPRVZEaXNoeWRVY0F3a3llOWJQNkNIbVpFekpIRzRhZDR2NXBBTklH?=
 =?utf-8?B?ckU4Y2dJbGp0RTZyejRmcHlNdDRhV3E2RDl5TmFjcnV0cG9lejdZbklPNEZM?=
 =?utf-8?B?NVNMaEhzdFhuUEh3MERJZVR0bGRGeFBrT0ZzdXptSExkdW1Za0I3ZDhJQlcz?=
 =?utf-8?B?SGRGMjFWMzhJQnlFRVJzdWxpcC9zR0JNK1hLSkZ1OEJmdnlsV25wTitVM1oy?=
 =?utf-8?B?K1JyODM1czJSYUR5L3pLclJ1TXNBajlCL0pucklYUEc5NWNsbmZEOEthRTl5?=
 =?utf-8?B?S2JRWlNsNUNJZnVUWEdWUWI4eGhoQ2IrUGpjQWN1Z0djVDN3RU5tTXoxMDcw?=
 =?utf-8?B?QnNHRU9sK3lhZFpmVmdTeTFnOW9McHVJNC8ybnE3YTVreVVOWndEL1hVWUdt?=
 =?utf-8?B?R0VkNXY3eW01U3ZMdHA4QVJ5Nm1Cdi9CSjl1RnNjcmtjMWNraklDVHp6SERy?=
 =?utf-8?B?UmQ0YnphY0ZyTHhpbDJmc1JuNS8yc3NRVjhFc0pkOWlpMzRHWWtmcDRmSklK?=
 =?utf-8?B?ZXpvcTh1dFRaTEwzZE51eWs3NExBVGJhcGYxOXJoSk1JaDJGMTh3NDdNd2ls?=
 =?utf-8?Q?jjykCO83ZsGFB8VE+o1KPaw/wHariQMZtOl6RrqslkcK?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 051b080f-1d12-41d6-4fdd-08de16f4445a
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Oct 2025 14:05:51.0306 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3U4ZnN3b/yYPgmfLvY21gSH1F0GdJV1C5z7gqhTYChtyZRY72TyNnBQHLV1ADd/0URSc/kfYgFmQPb3gKF7rFw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR12MB9168
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

On Wed Oct 29, 2025 at 12:03 PM JST, John Hubbard wrote:
<snip>
> diff --git a/drivers/gpu/nova-core/regs.rs b/drivers/gpu/nova-core/regs.r=
s
> index 206dab2e1335..ed3a2c39edbc 100644
> --- a/drivers/gpu/nova-core/regs.rs
> +++ b/drivers/gpu/nova-core/regs.rs
> @@ -25,6 +25,18 @@
>  });
> =20
>  impl NV_PMC_BOOT_0 {
> +    pub(crate) fn is_nv04(self) -> bool {
> +        // The very first supported GPU was NV04, and it is identified b=
y a specific bit pattern in
> +        // boot0. This provides a way to check for that, which in turn i=
s required in order to avoid
> +        // confusing future "next-gen" GPUs with NV04.
> +        self.architecture_0() =3D=3D 0 && (self.0 & 0xff00fff0) =3D=3D 0=
x20004000
> +    }
> +
> +    pub(crate) fn is_next_gen(self) -> bool {
> +        // "next-gen" GPUs (some time after Blackwell) will set `archite=
cture_0` to 0, and put the
> +        // architecture details in boot42 instead.
> +        self.architecture_0() =3D=3D 0 && !self.is_nv04()
> +    }
>      /// Combines `architecture_0` and `architecture_1` to obtain the arc=
hitecture of the chip.
>      pub(crate) fn architecture(self) -> Result<Architecture> {
>          Architecture::try_from(
> @@ -43,6 +55,21 @@ pub(crate) fn chipset(self) -> Result<Chipset> {
>      }
>  }
> =20
> +register!(NV_PMC_BOOT_42 @ 0x00000108, "Extended architecture informatio=
n" {
> +    7:0     implementation as u8, "Implementation version of the archite=
cture";
> +    15:8    architecture as u8, "Architecture value";

Here you can directly return the `Architecture` type and spare callers
the labor of doing the conversion themselves:

  15:8    architecture as u8 ?=3D> Architecture, "Architecture value";

This allows the implementation of `NV_PMC_BOOT_42` to mirror that of
`NV_PMC_BOOT_0`:

  impl NV_PMC_BOOT_42 {
      pub(crate) fn chipset(self) -> Result<Chipset> {
          self.architecture()
              .map(|arch| {
                  ((arch as u32) << Self::IMPLEMENTATION_RANGE.len())
                      | u32::from(self.implementation())
              })
              .and_then(Chipset::try_from)
      }
  }

... but also requires `Architecture` to be `repr(u8)` and to implement
`Default` and `Into<u8>` so it can be used in the `register` macro:

  /// Enum representation of the GPU generation.
  #[derive(fmt::Debug, Default)]
  #[repr(u8)]
  pub(crate) enum Architecture {
      #[default]
      Turing =3D 0x16,
      Ampere =3D 0x17,
      Ada =3D 0x19,
  }

  impl From<Architecture> for u8 {
      fn from(value: Architecture) -> Self {
          // CAST: `Architecture` is `repr(u8)`, so this cast is always los=
sless.
          value as u8
      }
  }

These implementations were not needed for `NV_PMC_BOOT_0` because its
`architecture` method is manually implemented as it depends on two
distinct fields.
