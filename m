Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 02D82C6D05F
	for <lists+nouveau@lfdr.de>; Wed, 19 Nov 2025 08:04:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 98BDF10E587;
	Wed, 19 Nov 2025 07:04:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="H/4ZuB1T";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from CY3PR05CU001.outbound.protection.outlook.com
 (mail-westcentralusazon11013045.outbound.protection.outlook.com
 [40.93.201.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F9B710E587;
 Wed, 19 Nov 2025 07:04:36 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wuJLU92n2wvlQIrfJF7Ypk+VhrLT6n+tlV9W4XbuNKwXihoVhqzvALdoUscLDh5ZdJapdF0ZTPv8VH+VLl4CztQGt5cmpsNlqG1IZZI4BYVYMyogKESqvOerNy/6M7zDSatcw1MrUdkdlEVS2l45racB1WTgBXbIx/HcLmjzA9coPG+m2RND67duVir293ynQsHmgiV90lKWVIp6lijm0S9Am6vzbj2a3MnbkLd2mBpAfJEM83lZ71n2UId9uZVYMtMwtg36KZwm1VSMFeLLqfYGPW1drnSXFpGvNP+tgmNwWEc1V9sHO5hjQEQGC/tyfFZ0uhKp61MDwBlkVGYrmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YVWw+ltexN3wqho2f/OphAtnw+rcEUiUMkujh8B4LAY=;
 b=VXjNbjomPHIjsUE+AbwPoCwWevTdPYCK7bXBsV+wlnA3jDirZXVhe9oJPYawY7n+s3/Gh9GHObzAsZ5sCY+BDcaAhGaROpUzWLz4ty7b/V5dvh4KBiNDxZG5vN9hWGVKloZGkS/hwFtQj6xr2PwgQ30UR16cqfE66ir/DCPI6uWuN5wYxthuKP7Due4RhhtiqysQJ2fzKv0Qu13AEFZOOncHg2SHisBgTiwYtJLI5LZbLjqdeYmKVMo83hAo4q6/MidjUhrDZm8OpOnEgE8r1l2Lyk98nCycyNg75fayyR8EtNczKIpZLyrUhai1MvJ3btdfvGb01C3hNqoJh0dDCA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YVWw+ltexN3wqho2f/OphAtnw+rcEUiUMkujh8B4LAY=;
 b=H/4ZuB1TPVjYv5YGYH+lophrzKRdrPA5QSy983MlkyExfUfg/OudD+6us/FIgqzVoudUq/GMXx02lv6IZy9IrJcFrDgLLzm7G6IWBAyAvoWT3BSxBII2Y4FNu0H4svgLMqrs3z/uXXvo2Nh8XjdkMxP0B2zLTIT6ioGb7V/fySWN+2O1BJ54DW8nDCt/IpQYbD2o0GznL+GZb6ol22tpVuFekFAqJFVnUmHiSOMFq+HlHBuArAsvqEYi4oK3bONjFDkYGdvfUn8XNnoyffYEJ4ZYI2Y51ImNaTvYmwQz8gzqM+4JHmjk5iUJytv8q235Y5w3YdHz/LB/8zg4uHxB7g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 LV3PR12MB9118.namprd12.prod.outlook.com (2603:10b6:408:1a1::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.10; Wed, 19 Nov
 2025 07:04:33 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%7]) with mapi id 15.20.9343.009; Wed, 19 Nov 2025
 07:04:33 +0000
Message-ID: <272631b2-77d9-461d-ba24-1df218afdc10@nvidia.com>
Date: Tue, 18 Nov 2025 23:04:21 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 03/11] gpu: nova-core: support header parsing on
 Turing/GA100
To: Timur Tabi <ttabi@nvidia.com>,
 "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>,
 Alexandre Courbot <acourbot@nvidia.com>, "dakr@kernel.org"
 <dakr@kernel.org>, "lyude@redhat.com" <lyude@redhat.com>,
 Joel Fernandes <joelagnelf@nvidia.com>,
 "rust-for-linux@vger.kernel.org" <rust-for-linux@vger.kernel.org>
Cc: "nouveau-bounces@lists.freedesktop.org"
 <nouveau-bounces@lists.freedesktop.org>
References: <20251114233045.2512853-1-ttabi@nvidia.com>
 <20251114233045.2512853-4-ttabi@nvidia.com>
 <DECBWUFEHV5D.3O0TH2AL775C0@nvidia.com>
 <fb673d50111ed0989ec8ba2a245e89eecaeb1864.camel@nvidia.com>
Content-Language: en-US
From: John Hubbard <jhubbard@nvidia.com>
In-Reply-To: <fb673d50111ed0989ec8ba2a245e89eecaeb1864.camel@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR13CA0048.namprd13.prod.outlook.com
 (2603:10b6:a03:2c2::23) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|LV3PR12MB9118:EE_
X-MS-Office365-Filtering-Correlation-Id: 6e3fff08-eeec-43b1-f0fd-08de2739e442
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0; ARA:13230040|376014|1800799024|10070799003|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?cGozcnIyNUZZM0ZtWXNQcmdLQ0xoOGg1a1lpN2RLWEcxODQzcVFTSU9XaVFm?=
 =?utf-8?B?QjdGdjJGUGJoMGEwSzJ6Yjd0VlB5NEREdmRKWTdoQ1AwODYwMmx6ejl3SW01?=
 =?utf-8?B?SUkwalhWalBpcURNM3o5RE9MR2JhMGNFa1lTeFJuaExzSUFvYnEwRWdmL3h0?=
 =?utf-8?B?Sk9SOGtCU3hPS04wa0VMeXdpckQ2V3VWekVaNDVPRmlpZWpxRGg5U0loYlN1?=
 =?utf-8?B?MkYzNis4NkJHNk5Vc2xOejV4c2NQbFlPUTZnSDlnZ0pwSVlZSFozMjZXVkkw?=
 =?utf-8?B?VXFHNHg4eWV3STZWSllOUzFIZS9TVE9sUGFIQUxtSnVubzBQbWc3L2tLRks1?=
 =?utf-8?B?UTAxUTNGQ0dlK2UvWHNCVXA0TU1ZekFoVUFZVFlsS0c2b1R5S21sajcrKzh6?=
 =?utf-8?B?QU9vb29MYWt6R1lKajRpa281S3lJWkpMaFg0YTJVU09JTGNDcHAvNlBObXor?=
 =?utf-8?B?UE9KWEw5bFB4VHI1VXFrM0lhRFYzbkVVbmE1QThoYlV3M0FybjFNMlVZZUZ4?=
 =?utf-8?B?ZlUrWTMrTkUvNTg4b0NVOTdCdFRhdWk0RlAvbXhPMkpQMGMraXBHaC9PSFNh?=
 =?utf-8?B?WW5pdmxvZStnZ1ZNd2tyR3NLU3BiVGlnSVRRVnc3Q1NMam1zUHF2WFp2czJD?=
 =?utf-8?B?Z1pCd1JBYVoxN2hGczZPdUY1UW1kNjhLRFpCb3pIR0NXSE9wMkFtRmFZaTZo?=
 =?utf-8?B?QVJVdm5qcW5HcjdRTGR6YzNMUGoveUdSL0ZFdG5BV3pHTEw5TFJoOWNLdldo?=
 =?utf-8?B?Vks1NFpod3kzNDNPTnJ5NXhReENHNE84STB1REtZbUl3WEhVcFdFaTVhb1ht?=
 =?utf-8?B?dk9wQ3NpZGhLUTV6b1NLbGJPdzdzbitJalZuRXh6K0NwV0NocGRpQ2ZVNXhk?=
 =?utf-8?B?cW1sSk5pOFQ0V2FiVnpLQ1hsQnI0MzUwVE1yZTA4dXlhVkMrQmRzV2w2SEpa?=
 =?utf-8?B?QTg1Z3g4U3BwS2FwSzYxQk91UWQ1SUZkZlhsUXQxOGhkQmJUT3FqOXdKZE5m?=
 =?utf-8?B?Z0F5c2pXVlUzWFNqaXZadXc3eUJLRFAySXI1cURSWUVkQ0FPYVQ2cVhtNDN1?=
 =?utf-8?B?YWlVWjBVVkJnVUFxdkR1a3pmMUFidndSMThiYUtlSS82UjlrKzRDZitSU0Fp?=
 =?utf-8?B?SjVLaE1BdmYzeHByOWNCM2VWQk1QanFnV2kzZUxDbVRtN0d1cVVrQzM0Ty9Y?=
 =?utf-8?B?QVlibWZzK3BZK08zWGNzRnkwNTd2dE43WkUzaDY4QzdpWnZ6ckJnS3FTbGRw?=
 =?utf-8?B?aWcxdFV3QzNvRkI0NHFDaWRrR3pCbWNiUTNrTFlZdWoySVB4L3lNYnZRekpn?=
 =?utf-8?B?dDJsU0d2RHZDdUJSQ25QbnZ0OFRQVllFclhvemRkM1ZMWFFXVnRDeVIyaGRS?=
 =?utf-8?B?aTdKRVFpc1l0TlNvaTFmRVhaYlFSWGpBN0dZYk9hQWVDUGlYOW1VVDNBelhX?=
 =?utf-8?B?Y1ZPeDl6M2YrcDVGSndLejd1NUljdXpGY0I1eG9YcHozK3FsTGtXS2xxU2hL?=
 =?utf-8?B?R3laeTV1ZDlZNGFBRmkxTXhUTDJpLzdyQzlkVUdLSzJHbmRjeDRzQUg4R2V2?=
 =?utf-8?B?NmptQzZUNThaWWd4eEw3NlhaRGo0Z0RVNldadk1lR3hFVVM2RmxNT1ZlS21U?=
 =?utf-8?B?TXVlZ3JFaFNyWkpHaTJ2WEpBbURmQ29kZk90VGlpYTkxMEZBT2wwZWNJeUUv?=
 =?utf-8?B?MWVDcE5TMnN0cHBBMTNyRFhQYUpjMGdKeDkyTUcrNjlkWXNSdHZhenI4Qk9Y?=
 =?utf-8?B?MmJTcVQ0V3NqRVFjSU5BN3N4V3FEQ0xWWi90Y1hjZE9qYkVndHFmemRIZzg0?=
 =?utf-8?B?YnA2NzFITnlWOHd3TWc2MkE1UHRDQmxWelJMZjNSend6Rld1aER1U1lnMzI5?=
 =?utf-8?B?enJnb2tITHN0VlA0bDF4MjNFb1VOak1mVXRORGVGT1FCempWelNYOXRUSVdF?=
 =?utf-8?Q?ZEku60yUwul5RJ9FAhtkWpyZMIZf1sA9?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM3PR12MB9416.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(10070799003)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dVpoNHVmdmhIenB4VDJKVy85QXVIdk51MGxpR1RmcVVjNXd3UCtoWTNKWVhi?=
 =?utf-8?B?MWZUTXcxL2ZSTVhWMEZXQXJtaDk5R1BjWEZDZGR1WW9aSXU3VHNRSmlQWDdl?=
 =?utf-8?B?di9FTGZJdUNVcVcrN01rOVBFL3JjMll0OCt0WGd1WldTeW9qWng3Qi9COXBH?=
 =?utf-8?B?eWFVMFNYVTgrRUhsYmJ0dVg5MkYyT01Lekl6bVUrQ0RqMXByWVJjWlRuRVIz?=
 =?utf-8?B?S0lMMkcwQUF6WG1Gd2p5WEhEREx6SHZ3WVpKZFNzRG5aOXlvNTB0c2xFTUY5?=
 =?utf-8?B?VG5mbFRUSXhjaW14c0xTZHRHUEZpcE5VRGF5ZTlRSks5VWcyOVlQNEY1VVBF?=
 =?utf-8?B?Mi9oNzFXdEREQkZrNHJVYzg3Q1prWEYrdEw4NFdQMGRWWGJubjdFREp0M3ho?=
 =?utf-8?B?aG5EbnN3UzU3cS94V1hCNS9YRWVqOVpGczhaN0h4ekduQmZBYXU5ZWV2Z3hm?=
 =?utf-8?B?SDJ4ZzYxQ1ZkVkxpRGc3b2ZVUUdJeko4ZHJ5ZmNsTzhtaGxWZDREdGNTVzUz?=
 =?utf-8?B?Vm41QUQ4TXVoQTR0bzJkYUJheUsxbnVLd2tPRno2Z1FJYWVQUS9PZSswWjZS?=
 =?utf-8?B?OWNFdFNNeWQ2NUwyeG84SHdXVE9lcE5yNkpRcFJGMkhIQjFnTHlkcjVSUHpJ?=
 =?utf-8?B?dDVXZXFpMzJPWmhadG84M0lHaWJ3SC83TFNDUEhpNUIvM04rR0pzbEYya21O?=
 =?utf-8?B?RFEwQVBNazBVMzNtZTRHVjREVkU3a0N1a2pZWm15L2N0V1E2NFJrbDRqZkhT?=
 =?utf-8?B?dkZBZXNLeGxpVHNhTWhCR0ZpMUwzTFRKZHlXUUNleWROd2h0TEdUbldpR2Ru?=
 =?utf-8?B?cWFUVjZ6N3pYaDV0cTFpN1pmNTJiYTkwTWZzTks0UW4wbEo2K3NjTXh3Vzl6?=
 =?utf-8?B?Y3k3R052TTlxbUpkajltVU1kd3JIM29xaFcvVHBFaUxleVpLMnNDV1NiZlEr?=
 =?utf-8?B?WTFiZUd1Q01WSWJjc1J0NWdxUVprdnBnTjJ2Y3J0MER1b2dCWEhsZkc1ZGda?=
 =?utf-8?B?ejU5c2dkLzBEdHFoZVIyMnM5K0hSNERXYnpLZXJHbzVFT1VvSTFTS21YM2JD?=
 =?utf-8?B?ZDVNc3JsOUlEdTdSd1pOUjZYV2NLMytURVFOa210TmMxNlkzZ0hwa2hhTHVv?=
 =?utf-8?B?QS85WUJkK1ZMaWVUekZmZ1BzUXpEL1M3cVFWUnZKREMyalNsTEhheGl4NDhM?=
 =?utf-8?B?VzlnU05RQXR4NEF3aEFLNXBjbjQvNnZGVE1QSVVrb3h1L1NkSEN5QUIydGlz?=
 =?utf-8?B?Mi9aWFFTS3A4S3lCNlhNRFNhZVFiUVVtSVR4bVQzdHRjeEJBRzlwZWlWWXls?=
 =?utf-8?B?MFZmcDBycmprR0Q0WFZRZzdkQkJFNkVPakUyQUhRcTVIQWxUaWp6Y0FvWXZq?=
 =?utf-8?B?RzdQOEtOWWpaTmhad2FnNGVTK3FiYmdaRXJDTmpsaE1WU1FOVERMVUFGekp1?=
 =?utf-8?B?bGFJclpyZkJoZ2VKYWdaaEFQWVZ2TlFTMlpEM0hxM1lSWGxWRWVpYTlBdlBF?=
 =?utf-8?B?R0hoZW5LQzczMzFlOEdKQUlrdWNUdWx1cDQ3bFFQM1NMbkJYY0pwWUlZVVY5?=
 =?utf-8?B?RW9CSnk1S0E4QkYzdEg0RzZoaEhqVjl1TjRyRmVJMUpNTW9Kc2NOcXM1S0M3?=
 =?utf-8?B?UVgvUHMzMWIvcUxVRUdMMzZVTWVQRGRxWUp2bjhhOXZ3V09mUFdmakNyYVNL?=
 =?utf-8?B?S0tFL2lJK2pSRWJtOHZSei9QUUt5OHJFZWx3WDAvQnZJM0pwYWI4VVZzTTVM?=
 =?utf-8?B?eVRWTXlTR09TZStyazQ0aFczMGJZaFFuL1BWYjQvTHJjWUF4WjdNT0ltUHpR?=
 =?utf-8?B?YytJaGU2RUMycUZjTTdyU09VeUxZYk1jT0EyQWVaaWg4UmpyRFlJMSt3cUlr?=
 =?utf-8?B?SkNnaGxITm1kalhHUEdHNnFpb2lJYnc2ZkF5MWkrMmJTcmVqWjBreG5QMG9i?=
 =?utf-8?B?UTM4MkM3NUtMUzdnNUpvOS9jdldJNDBOTXZJcGdUdThiN2FoWGN2di9Pdjgz?=
 =?utf-8?B?bmw5cTVPbXFJNytsQW5OOStHNUJLMEFaWlVsWFJiY3hLeGtmdm9UVGxJSDJw?=
 =?utf-8?B?aHgrSVBQTEtJNXNvd0ROb1liNGJiaXlVemY1anJMbGxpcE5jSi9VaGE3UjU1?=
 =?utf-8?B?V1dTSlB3amFFTmMweURpa0FOV1FZMTAwNWNnWFU4b1NQNkFvbVNnVUo4bU1K?=
 =?utf-8?Q?zkEZhBtHwQnQyfCtpWPaWHU=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6e3fff08-eeec-43b1-f0fd-08de2739e442
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2025 07:04:33.1179 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iCwRWimz4MKR65mIrCq4ZWCGoE92dtqKfHrhk3Fh+Rpx9lS9WxYusuDbnNO04IE07up7z6cXEBWEydoOnYbV6Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR12MB9118
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

On 11/18/25 9:16 PM, Timur Tabi wrote:
> On Wed, 2025-11-19 at 11:51 +0900, Alexandre Courbot wrote:
>> I'd prefer if we could reason in terms of functionality instead of
>> specific chipset versions.
> 
> If you can figure it out, I'd be happy to change the code.  I wasn't being lazy when I made this
> comment:
> 
>    // There are two versions of Booter, one for Turing/GA100, and another for
>    // GA102+.  The extraction of the IMEM sections differs between the two
>    // versions.  Unfortunately, the file names are the same, and the headers
>    // don't indicate the versions.  The only way to differentiate is by the Chipset.
> 
>> IIUC the relevant factor is that Turing/GA100 have some non-secure
>> bootloader code as the entry point of booter, which GA102+ doesn't
>> feature as it is capable of starting in secure mode directly (please
>> correct me as my understanding is probably incomplete if not outright
>> wrong).
> 
> That sounds about right.  There are secure and non-secure sections in the firmware image.
> 
>> What is the HW or SW fact that requires this on Turing?
> 
> I don't know how to answer that question.  That's just how it's done on Turing/GA100.  I would
> need to start an internal Slack thread to get a better answer, and I don't really see what it
> would gain us.

Here, would it be reasonable to just create a tiny HAL-like construct
(a trait, I guess) that has the function to call, and it decides which
behavior to use based on the chipset-selected HAL.

In other words, we know very clearly that we need to call one version of
the function for earlier chips, and the other version of the function for
later chips, and the dividing line is because that behavior changed at
a certain chipset.

I think this HAL-centric, chipset-centric approach is fine for some
things, where we really have no reason to care about the internal details.

For other cases, the functionality based partitioning is probably ideal.

Thoughts?

> 
>> Is it linked
>> to the fact we need to use PIO for it? What I would like to achieve is
>> removing or at least reducing these chipset checks into one single
>> point, which in the worst case could be a method of `Chipset` telling us
>> which loading method to use. But if we can find a distinguishing factor
>> in the parsed by this method, that would be even better.
> 
> Both OpenRM and Nouveau use the chipset to gate on how to parse the headers.

Yes. That also carries some weight.

thanks,
-- 
John Hubbard

