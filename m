Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 138FBC6C4F2
	for <lists+nouveau@lfdr.de>; Wed, 19 Nov 2025 02:54:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D4EA10E54C;
	Wed, 19 Nov 2025 01:54:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="Wb9QCinX";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from SN4PR0501CU005.outbound.protection.outlook.com
 (mail-southcentralusazon11011050.outbound.protection.outlook.com
 [40.93.194.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 80B3210E54C;
 Wed, 19 Nov 2025 01:54:30 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KlptetJ703r0pgbUfPxV1TBoGwgG0ZHzgpH5C1kMwEO6WTbg8sqMOmn1gPc27I9xV4HqWpUbDxWqm+6tYsdGh+jv0oGvEcrjUcGHhkrvYM9pW+nVHhWN9weP5e7BXheJTqCRYaUnxL2fDevtxzornHemHOQA5axLliP51kWsKn4UhOfFtBqMwCOsVClcMlDE5B/b8/vlHy1jUIK7kV0QTOM/wFqwdq1B1828/gg+XIqVxt+7lSn1kqyXvseMv2EmpLpi61EDE83O5yIdbo1IwaoYEmyPTHVtUsnNPuGKoqz2nFAv8/2bjpdgPgFhxbFbn+hPZa9OokBV2wUXn1mD6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iAozF1np++Ic3JrwH2hvFABbmcNx5G1gfVcwgMDqnKw=;
 b=fles+n2m4f8OvkUinUyxWHE20al3+F4ekLPWVQFhXahp4zHRlQo3k7LcdwcDOu1BbHY/ZWyNariev9uJX2rfj2ScpHYWAROFWZGJh/2cGoTqZeWybHB1cn8WciB0rhsO8im67y+nosQT/7jKrnmOimT4vky7gRa2TIPtEDcPYN7z335i3/r0wSlko9yJQWnG4HBYc/XOpzMMgDotkFnzZ7RwhZ7WA9jrVNF9zQGUsv1VIHSiq2a1vC6099bQ56wUsT/TpVcv6KCiv2FrRcI8WB6CwrNVHJ5lp53euo1wE+tkSbMSagmw2k20JpgN8jbJd6/drRzsAz+GhRl0a5WkYw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iAozF1np++Ic3JrwH2hvFABbmcNx5G1gfVcwgMDqnKw=;
 b=Wb9QCinXhekrBfdpv82CV76/ZFuRYiARb1XTsXniE9Jzx6sK4GG9cAE/+AlT6yxsjSdT40d9YkCYPI2T3ux9RXeN/WiQG9zgdZJfIHBfUup3LELiYFMYYH9XDquQra6aBfnfC/Ja7rhKHi2mJiRzMCrAudj9do8SKuVWCyA/n5pcSCINpCXmWZ8CIknkMUSUEOukNp4xCPGqHR7oGtaVByaERWVfiX4aOLm+/sicnDJWvUpDiRcz4wSrgg1+C52OHMs/i/0XVcecGWZpd36/Ra+6h3tWtqq45YyLBJZ/XyabAPow2/H9dGvhCETMXkCeRWikek962I6fkuvPdInkZQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by PH7PR12MB8780.namprd12.prod.outlook.com (2603:10b6:510:26b::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.22; Wed, 19 Nov
 2025 01:54:27 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9343.009; Wed, 19 Nov 2025
 01:54:27 +0000
Content-Type: text/plain; charset=UTF-8
Date: Wed, 19 Nov 2025 10:54:23 +0900
Message-Id: <DECAP2MZ5DUU.1SLMSVDB3GU1T@nvidia.com>
Cc: "Nouveau" <nouveau-bounces@lists.freedesktop.org>
Subject: Re: [PATCH 02/11] gpu: nova-core: add ImemNs section infrastructure
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Timur Tabi" <ttabi@nvidia.com>, "Danilo Krummrich" <dakr@kernel.org>,
 "Lyude Paul" <lyude@redhat.com>, "Alexandre Courbot" <acourbot@nvidia.com>,
 "John Hubbard" <jhubbard@nvidia.com>, <nouveau@lists.freedesktop.org>,
 <rust-for-linux@vger.kernel.org>, "Joel Fernandes" <joelagnelf@nvidia.com>
Content-Transfer-Encoding: quoted-printable
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20251114233045.2512853-1-ttabi@nvidia.com>
 <20251114233045.2512853-3-ttabi@nvidia.com>
In-Reply-To: <20251114233045.2512853-3-ttabi@nvidia.com>
X-ClientProxiedBy: TYCP286CA0279.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:3c9::6) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|PH7PR12MB8780:EE_
X-MS-Office365-Filtering-Correlation-Id: 9d0bdd35-89e5-46c6-65ee-08de270e91f4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0; ARA:13230040|10070799003|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?QldxMHlUSGVyZEdIMUFGUTFERmMrVWIvZ3lxK1grTXRVc0RXdFFMMjUxZTFW?=
 =?utf-8?B?empEKzM1QW1zZkVXZ3gvbnFOL3BqRGw0a3FJM1I5MmJ2UDR2VkJCamNEWE1B?=
 =?utf-8?B?dCtYSzNnUkZ3RDVSSWlPSVJ5REdXNVAwUVVhMVAzUjVXYmtIMEdJeFplbWly?=
 =?utf-8?B?NTdncEV6c1c1dGRyU2tyU2I1eVE3YnZYdDNsbzVWVVUvNUZNSEVKUm5WUUZs?=
 =?utf-8?B?VjhVTmtJWFZHRWlpaXpZQ3ZiKzYrWmJMb1VFU3RtQ3ZmaUw3bWRmTWFTY0Ey?=
 =?utf-8?B?STcrV2FURmp5K1ZGNXl5RUhhczJONFFYYmlMVEFVK1h3eHZTaStseEgvNzZv?=
 =?utf-8?B?V1RzZVBQbDd2dllYczRVVGNIaTdUQWFmd1NDZWV4TVcrWnQ5OUNPc1BGTWEv?=
 =?utf-8?B?d1NiN1ZraTY0SnRSSWtjUHpXWUh1Y2tDaThZd09jVWxlNUIxVFpEZGJad3RS?=
 =?utf-8?B?eHlhbG9RZlhnU2xHTTNOd3ZaOXI5RlJhNG4vL3JrMW5hL0pyeDJMVlhwK2RR?=
 =?utf-8?B?MmZ4OFg0cFlUZWV6QWtUTHY0MExCWlZtTWtGZ0QwWnhSOEloajFCenVNTEcz?=
 =?utf-8?B?L1VSc0syOGFwV0RIMjRrL1VKUXJUMnZXbUcyZ0xDTFNKbFFDOHo3Z1N4YlVy?=
 =?utf-8?B?MzlMa21OWkNmWHJKeS9ZQjY3Qm4ycm9RbitjREk4ejM2YTFFTXg2WjVXalRv?=
 =?utf-8?B?SUF3clkvQ2dzditMYTVKVzlZSktxek9ZZmlYWVVhVWJqTTA5YlU5eG53UkR6?=
 =?utf-8?B?SHJwQTQyTWZHaklLYXhxdEJNb3l0WUJlckZUbG1MbG5VNVM2THgyVFFZYXNr?=
 =?utf-8?B?M3ZiUUtzWmppMzlocVlhczY0VCtHa2N4bmtlM3NoOE90OEhCWUV4NkZZa3BM?=
 =?utf-8?B?ODNPSSswUGR1SHNPR1RFK01JUVhUdlZPVk02SEp3VHdyYzVhdzV2R0pYblVM?=
 =?utf-8?B?TEYwNjdOUzNmem5TMlZueVpKeTMxOGF3ZTB5eE1ubUhOdlJSb2hHVFZONEZK?=
 =?utf-8?B?eWZUZmNzM3YycUxkRlNJQW8raGd2dGxMOVlEVDRYV1IycnhPSHJMaWVXS3JT?=
 =?utf-8?B?b3F4ZlpvbFZKbU55SzBsOTV3b2JsSVpqSElNQ3JCSUZ5SXNoOUpNbEhLRDZs?=
 =?utf-8?B?d0FRVnIzbjRpMW5uS3JHdnVWYnUvZDFBNmlacktSRHVmMGNQN3RkQ3JpV0N3?=
 =?utf-8?B?SkNwTU14SkkyTGNPdTdOOENXVlNFb3FsQU5WL0RkeFV6ZVJmdG96Rm43QXlH?=
 =?utf-8?B?ZzBKVWd4UUxVc29sVHZlT1hTeHhuV3BnOVRZZ1pDdndPQjhWT2VKOFB6TXFS?=
 =?utf-8?B?R2I4d2N2a2tJRERWWTkrWVdvckpLVmRDRjkvSGdFSUU3QytGRnNtNUJZSjhQ?=
 =?utf-8?B?alkxaExEM0NJUldOWFdNWVNnS2pSb08yc2lxdHJqejNIT2l4dWQyYUMrUTVF?=
 =?utf-8?B?RFB3bWxGOStoa2pDS1BtK2lWcDIvYjErRmVwV0lSaDhTbmlFc3h3Rk1vM0pW?=
 =?utf-8?B?RGcxQVdGZm9NTCtvaHIrZGt1cjBqTkRPb3cyYXRmQ25KZXJKR1pTeDZhbG01?=
 =?utf-8?B?WStGM3VJTjVPcStYZFNxVXY0TUpibExYb3lZUVNWWXgxay9uN2dWNFdldkhN?=
 =?utf-8?B?b2Q2c1FJaFZjM3dDMkNhY0l2ZjRtd2QvNmdkTldaQkJQV3hTR1R0WlNhYU1l?=
 =?utf-8?B?bVp0c1hRdlNSU1p4UnJFVElpMGpNekVhQ1N4SFZBc0oxTmkyTWpKeENrcjhV?=
 =?utf-8?B?WWZQY3RDSEN1czlWd3pmMlZZWHBZTFkweFJWRVF6T1l2eUR4UXFHbU9KQXF4?=
 =?utf-8?B?am1Oc3FmSk11Y2dkRURGWTZwRGo4djR5cytNc0VXbmlaNjJsajh6L1ZWMkFG?=
 =?utf-8?B?SXpXUHJRTlNQdmhqRTU2MFNreXI3ajJSemE3ZFEzakFVb0E3MG5xNlF2czVH?=
 =?utf-8?Q?6iRlUxnzZGueWzmNeyuY7pu+yJHhiV//?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(10070799003)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?b0lYVWJWa2Q0ekdxK0cvd0dFR3RSQzRFTlVPU2g3dmF6YVdtK2t2azNyb0Uy?=
 =?utf-8?B?UUMzcWhKZVdJRU9sdmx2Tjl4Tkl6OGp6N0M3RkhzRkJCdC9DdnpwQXl0OVg5?=
 =?utf-8?B?TmJ5bVhyL3paNTJTQjMra2ZjejhyM2RZQm1XRWdkYWs1Q3Z0NjczeEFjOGJh?=
 =?utf-8?B?MU50clBRN0wvQThKRkNtSTdXQ2R1aDZSTUNHMlZydGovUytYN21JclNNUlJJ?=
 =?utf-8?B?WWpVSjVIVjhvOHhWUXZDRWRuTW1qN3RxUkZza2pDb2YxYTBDQlhZcmpOOWVu?=
 =?utf-8?B?NWc3Y0ZXNXJxY0kvYU9PVmxPU2I5MnpYR2toeVdvYnpSakdhczZjeVNjS2pD?=
 =?utf-8?B?eFIvbmVYUWRtL0JmVCs1SFZPL1F6MXIxeEV4azE1d0I2WXp5VFBIRmRkdjhH?=
 =?utf-8?B?OFYrV2xWOXRuK3NYQzdHNWF1NWxnWnZ2RkRCOVZQcmJIcU5xWUpVVllrVWxa?=
 =?utf-8?B?Vk1GVklMNGF3NjZKNEk0N2kwYURMY3VjK1g2NXpnc0FETFo2ejZjWXoxWDBJ?=
 =?utf-8?B?U2M2d3Q0VW8xOWowU0xrblZwcVZ1S0ZYMzNEbG81MnRxUnJITjU2OFRlWUNs?=
 =?utf-8?B?enVLdkJPTjB0Y2hVOHpnclBOQWltNzJxbU1NNjAwc1hsVU5Vc3ZWMWlwQmNk?=
 =?utf-8?B?aTRLVjR3bytuM1Jnb1h1TE9JRmtoYXdjSFA5ZzBsaDBMZUUxcXhJMXVnaGNi?=
 =?utf-8?B?V3JPd2lJVjg0K1psZG10R2EvRFlPK2pNOUVOTlUwZUEwRlpacmphSkdEekJR?=
 =?utf-8?B?eU9CZ21DSUQwRWd1dDdBeGlNVzQxM1hJZ0lrdVBTVWdXcG9tVlRhMzJLZzNq?=
 =?utf-8?B?WnV2KzdhYTZ2b3Z2eW5nMW1OcDA0MlRzd3dpdUNRdi8rbWlTVXFSU2NNRFZT?=
 =?utf-8?B?NzJPOTVWTlJzdzVuT3grMys1cmdlQWlvTDNEMmlWdUN1UmNpL1VpYWM5MFBS?=
 =?utf-8?B?bHI1MTZDS09KMGhXcU1UblpMOWczRGhIQVZLdi9paExhZjF6TkoyLzNIMlo3?=
 =?utf-8?B?eVR1QjdlTUxYWThzVjZVejMxS3V1RkdSbm0zYTk3ajRKNVNiQ1UwU0U3MGlI?=
 =?utf-8?B?a2ZEWXpVc283UlpRZlZVUmtEWEZFOGlHd0tzRmZHb2oyZVV3aUhSM3JWZjV1?=
 =?utf-8?B?UlBQQXdjSDhlZnNwcnZUT1dKSEp1VHVwL05rZFFYV2xyRU1pOVVOT2tJcWxK?=
 =?utf-8?B?UmNTYTRYL3I4OExlR2FISUNoQ0lPd3FLODZOQ29PVEtPanFBRUJYc1lNcStP?=
 =?utf-8?B?RE9hVkJhdXZGcmZVUS94WHNCOGZRVTFpbDZMdHVQd2U0M2tmeXZobnVUWldu?=
 =?utf-8?B?TmxuSnIrblhZU0dBQ1o4UjlMYmd3bkpvYmM0RnRiMVJtTExBSGpjaFAzMStB?=
 =?utf-8?B?NXZRMmxJeVRpNllBNkt0Y2oxVTg1R21saDMyUjJBWFNwR0ZYRGpZZWxrY0FO?=
 =?utf-8?B?NWxyWUpDM2ZNZXg1M3ZZTXpVdTcxSkw2a3ZHYXpHci9IZDRROVZaTXR4bEd0?=
 =?utf-8?B?WEVNbUxLYm9saS9lZDdrU0RUVDdqT1A5VUtVM0JtSktKenh2RGltdExlc3VZ?=
 =?utf-8?B?dlRCaGNEQVVEYzZMenhLRWtkcExGQjYra0YrbXBvUkpXWmJGcjRlNWhiVzJt?=
 =?utf-8?B?YkdwdXJFNnU3bWR5d0Q0ZEFvODJBSERobmpKTDBDL1hkVUFJUGFIVU9nZ0ww?=
 =?utf-8?B?VlRyb25naTBtWm9nLzl3TzdPeUhtVHFkelNQakNXbzhyQU81M2FIUURta0gv?=
 =?utf-8?B?ZFZFRnNDRTh4V3pIalRRemdBV1JqdVNJK2w3b3c4ZWZTbDUyaG5Xd2NURVYx?=
 =?utf-8?B?NDFtbEV4NWhQZGNnVG9iMit3QjFyZHN5UGgzaHE4TXpJNEI5Qld6OVd6ZHZ0?=
 =?utf-8?B?SkFuaDV5bVRWUWxQOVNUem9ZZEpieEtQcVFoVzhMRlk3Y1p2UVpxb2h0M2c4?=
 =?utf-8?B?NDB0ckIxQk85TVZOZzBjckRNS3Z1b0JMMStRRFFneDhWWkNZN0hGY1J4MTZW?=
 =?utf-8?B?S1RNb00yaXIxYm9lRkY2bWRrZ0E4a1RML1d3OGhpZ0FlUlpnWmZZSkVQR3Qy?=
 =?utf-8?B?U29pbmRUNEZBc2FWWXpYUzRrZWE1Uy9nTXo5cnl0VThLRmZrZzErMXpuci9m?=
 =?utf-8?B?MVdzY1A0UkdaSHJLMS9TY1h1OE1ISDQ0UWhnaFBIaEF3WVYyQUErOHJkeXR3?=
 =?utf-8?Q?ymfnQu5DnsKvGl3/r5ErG+tbuqP+K2deb3Yv2dFmkJEO?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9d0bdd35-89e5-46c6-65ee-08de270e91f4
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2025 01:54:27.2383 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Jr2AoXoqlr8h72Ys+5ZovBcT1JJXV3QDIb9c9fv77vT7Pirx3NBhEgwpxJky0Pku+TFyA5+Ik3BIOEMysPg71w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB8780
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

On Sat Nov 15, 2025 at 8:30 AM JST, Timur Tabi wrote:
> The GSP booter firmware in Turing and GA100 includes a third memory
> section called ImemNs, which is non-secure IMEM.  This section must
> be loaded separately from DMEM and secure IMEM, but only if it
> actually exists.
>
> Signed-off-by: Timur Tabi <ttabi@nvidia.com>
> ---
>  drivers/gpu/nova-core/falcon.rs          | 18 ++++++++++++++++--
>  drivers/gpu/nova-core/firmware/booter.rs |  9 +++++++++
>  drivers/gpu/nova-core/firmware/fwsec.rs  |  5 +++++
>  3 files changed, 30 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/nova-core/falcon.rs b/drivers/gpu/nova-core/falc=
on.rs
> index 0e0935dbb927..ece8b92a627e 100644
> --- a/drivers/gpu/nova-core/falcon.rs
> +++ b/drivers/gpu/nova-core/falcon.rs
> @@ -239,6 +239,8 @@ fn from(value: PeregrineCoreSelect) -> Self {
>  pub(crate) enum FalconMem {
>      /// Secure Instruction Memory.
>      ImemSec,
> +    /// Non-Secure Instruction Memory.
> +    ImemNs,

So, seeing how this is taking shape I now think we should just have one
Imem variant:

    Imem { secure: bool },

This makes matching easier for the common case of "we want to do
something in case of Imem, regardless of the secure flag". Something
like

    FalconMem::ImemSec | FalconMem::ImemNs =3D> {

becomes:

    FalconMem::Imem { .. } =3D> {

And if you need to use the flag, you can change e.g.:

    FalconMem::ImemSec | FalconMem::ImemNs =3D> {
        regs::NV_PFALCON_FALCON_IMEMC::default()
            .set_secure(target_mem =3D=3D FalconMem::ImemSec)

into

    FalconMem::Imem { secure } =3D> {
        regs::NV_PFALCON_FALCON_IMEMC::default()
            .set_secure(secure)

Which is simpler and easier to read.

This also removes the need to rename `Imem` into `ImemSec`, so the first
two patches can be merged into one.

