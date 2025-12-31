Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 98CFCCEC7CA
	for <lists+nouveau@lfdr.de>; Wed, 31 Dec 2025 20:16:05 +0100 (CET)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 59A3A10E698;
	Wed, 31 Dec 2025 19:16:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="F6ArWslv";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id DA0FF44C67;
	Wed, 31 Dec 2025 19:08:01 +0000 (UTC)
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1767208081;
 b=YN3QKiYKX0tRmRjKLu6dhENVrZx+dq/jhl7dHcp7ikF4cXxh/IYKg+uxw9bpo0D1HZ5ou
 zBXvTmeOVJ9Xkh/2ePd4VB5juG/OlrZYygzy9wGe+r7DJwT9donNxLtnSEZMpubcmNKM22n
 uxJg9Xhc5B5Op4v3AF7AGYxhHBhJPLXEl9IhWgOHebVaDOX+cJMvvdnXwGrbg+yR4o1kCOo
 5PLia8EyoE3YDDMGd3zSy5sr1kpMmuk3+A/okon3i67dQHRrZtd5j9iqo46NLbpkTvBC+Yz
 Of25P3h935czDNAtxW+wTLN586tSjLj/++17rkOKwmW5kd6Vj0h8cceALVaQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1767208081; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=cApr5qmCdZGTcVeAyLUyQEIKxf60Xqnbp0Fdyr+uknA=;
 b=FisfuHv8L1WXlRusqTfk2bPnKd6r+dWhYeR84ywplnXYTsd8viqFiSu1fDwSzUw7rvPV/
 y73cZ4dRZyrnwVc7BGoUKaFkhSe7C5djN6hAh2QyD/Zc3COHTYNB0QLzudRdy1SVBZdRr1+
 /F898R9zCYu6i5oQPa7j+54LDwDolHjNoVMdD49dtgoNLmPKMT6D8pOB0F0ptQdKtD06YAk
 6m5Qwc9Dhp4HSgV5tE+nNtjCTG56OemW/MuE0voIwJlqJhg9dgM843dYq505YFRMCfhuJXP
 vX9TlU1c2PBNW6T8ObuKZmbX15S5G8w2db3oZXgad5nVhpS9jfuqbybo9qYg==
ARC-Authentication-Results: i=2; mail.freedesktop.org;
 dkim=pass header.d=Nvidia.com;
  arc=pass;
  dmarc=pass (Used From Domain Record) header.from=nvidia.com
 policy.dmarc=reject
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=Nvidia.com;
 arc=pass;
 dmarc=pass (Used From Domain Record) header.from=nvidia.com policy.dmarc=reject
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id 29221400F9
	for <nouveau@lists.freedesktop.org>; Wed, 31 Dec 2025 19:07:59 +0000 (UTC)
Received: from CY7PR03CU001.outbound.protection.outlook.com
 (mail-westcentralusazon11010020.outbound.protection.outlook.com
 [40.93.198.20])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 2732410E013
	for <nouveau@lists.freedesktop.org>; Wed, 31 Dec 2025 19:15:59 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vCciwkMASEXfURdaSQ0RPUZ9Gj00sSfanrNBkT4d6+F0SQx0BP1Nirz8Uv//annow0K3WtJ1eF5hS3HWlwKHbsWY7+7UZcRak1dbXMUvKdTJswT7hAOav/5jUfq2zHgxG+GZ4h9CjdvZp5DLEIofSc5vK2FWRmCtZJNC5BdIE5CYMrA/6/1rTA643n8a8hY5BMr5qOiNeyuIz1UjcT9JBtrPcKbmRY4M8OmMXWP12WcwS341eCGYnw0FQ+EnnEFpx8vVufby4ZwBow+YnGPmtb+w4/V3sdzJKbACU/nq40DjXYntRtPzrqN16cXdn71y2YPULdVOx5pqAl3/i1Ei7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cApr5qmCdZGTcVeAyLUyQEIKxf60Xqnbp0Fdyr+uknA=;
 b=QuzYJ7knRixrcMPQJBFd6LLSgxVLrT1SWPgS4bceZwGyXSrytVchLoI+6JU5kltQBsRmNTN453vxVCoihd7zb4WSSqYAb72he+WtRU7swfQT7eNt7x+Wfgd2nnwFbCduDgqrgsYmO/LkghPwO6bOTeKn6IPhI1e+7Q6oiRkD5xNXQjx+iOZ8cMo+r3bMPrfFlzRYw+4rhsnGu0VgYLNcKNnb7/xjNl+VX/R+MBiWROoogR/M3STQ6xgB1rHGQi8Lzh9Xniyv68LFd+serm+kcbO8vIpQyAg9B6s7n9lsIXIPkxhtx4g3F8EneHXlmb92tAYCr8rYPwBV/MFXNqnlAw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cApr5qmCdZGTcVeAyLUyQEIKxf60Xqnbp0Fdyr+uknA=;
 b=F6ArWslvGW+QUjQyUG4J3G7vtsLSba/boBV3yy3qQenoO2EB9XVBTNpXLg9MLx7aaZcCLnF1s/4Aw6ZDkNfLsvWAYPhHjSmROjpOJBC/UFG0emf1Z0pJwPXTRUMoKH0n4Jub1DRVS4f3u5Bqs6r3bEYKvOwJQnEjiCpqVYt2RWxRGdqH4vTg+n4VjU7dCYVaecXEHmLc8Kc57IRXzi0dfOv9JaCLx1Qr8WY4alxep+r+krteFnPZUJ4GYBKu4SKB5qCtVSBDZo73XNojHD/jgta9o3k0ViiqkQKwmokWeKSG0/JCkRxsDWe1BGYfRr62eZlDvHbemlE9IvNa0B8BVA==
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 CH3PR12MB8660.namprd12.prod.outlook.com (2603:10b6:610:177::5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9478.4; Wed, 31 Dec 2025 19:15:52 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%7]) with mapi id 15.20.9478.004; Wed, 31 Dec 2025
 19:15:51 +0000
Message-ID: <4beba5c3-a117-4cb7-8fed-2f1c133dfec2@nvidia.com>
Date: Wed, 31 Dec 2025 11:15:34 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 00/11] gpu: nova-core: add Turing support
From: John Hubbard <jhubbard@nvidia.com>
To: Timur Tabi <ttabi@nvidia.com>,
 "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>,
 Alexandre Courbot <acourbot@nvidia.com>, "dakr@kernel.org"
 <dakr@kernel.org>, Joel Fernandes <joelagnelf@nvidia.com>,
 "rust-for-linux@vger.kernel.org" <rust-for-linux@vger.kernel.org>
References: <20251218032955.979623-1-ttabi@nvidia.com>
 <858af758-e5a8-4c9e-99ed-65ddffef4c31@nvidia.com>
 <4f83e5e3a7e32ccccb94651ea4cf2a6e0eab8ca9.camel@nvidia.com>
 <91be3c66-6296-4c37-9fb4-a45cf9865973@nvidia.com>
 <b8386ea25078f9cd9012645732ba3ef943677003.camel@nvidia.com>
 <e1cecbe1-9171-42f2-9563-2946bc0b7daa@nvidia.com>
Content-Language: en-US
In-Reply-To: <e1cecbe1-9171-42f2-9563-2946bc0b7daa@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0P220CA0017.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:41b::27) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|CH3PR12MB8660:EE_
X-MS-Office365-Filtering-Correlation-Id: 4e0df982-886a-4806-f8a1-08de48a1034b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?a085bmVVb1ZwTjRBVUt3SmNDV0ZhdURqV1FLMUJaOE5sTXZYazZsOUJEaUg4?=
 =?utf-8?B?N2VXOUlmNWttdUZmVmJYOEZ5bUxaMitmVFN6WjN1VHhJZG1SZTlPUHRhN3Ev?=
 =?utf-8?B?THBCbjlTZUV1MzZjYnRXR2tVOHdRTGE2YmFTVU1OM0E2cUtPYm1BNWJvZUN0?=
 =?utf-8?B?aERFQ2xiRUhHcG01YzJDV2JoSzFTZzYxQmpnQWpkdXRRK2o1MmhxaGtwNEd1?=
 =?utf-8?B?NXA4NnVlVFkya3JCTHl0TXZFNllEYmYrWlZVZFFpV2NGYnVCbmlwc0ZtODZZ?=
 =?utf-8?B?Y0FpT0FDK3NtbjE3RHVnNEM5dkpSNHNzUjIyRjR0eVhUaDBZc01xWGEvWVlk?=
 =?utf-8?B?aFdlVkNmWHorV1YwQzZUV3JDazFBcFM2b2NtWVJGcWh6WDlMdkRlVll2dDMw?=
 =?utf-8?B?TllZUldpclpOdEhaMTh0TTJ0RlFTaFRKOGpFL0lUcjdOZXBRaVEvREZ2clBI?=
 =?utf-8?B?Z1dabkdKbzVWWTB4ajkwc1VUT1oxd1ZOMzQ5ZkZEbEh5bWEwMDloZ0RhVDVJ?=
 =?utf-8?B?N3NHRXhVbEtyZDdmNC9EUGRYY09NMk5PYnZUb05YRHRhQmhkYnR4OXBRaHZD?=
 =?utf-8?B?RDIyYkpneHZXYjRvcGpNR0pabmY4MkJiNUhlMGkrd2U1TjNzLzdQMDNwRnl0?=
 =?utf-8?B?T2YvM01XaTRBN1YvYkNXRTNRZ1ozb3RaMmFzS3ozUTB1MXUzcjh1R0JBQ2tL?=
 =?utf-8?B?b2JSc1czWU9iWkhYUHh4TnczU0JWSzFlS2VKT0RrUzFkRWhTU3p1QjFDVGgy?=
 =?utf-8?B?djVYN3ZNdmtPOU05dFhHZCtXMGZyekdVS0piTkNVQWhBMXFoWjNPVFlWbkkx?=
 =?utf-8?B?YVhzTGdVRTZhNWlUTWorNnlXMFRBMzF5dWROOWt5dVN4V1FxSmNtbVlYRTkw?=
 =?utf-8?B?Unp4SkZ1TzdwVlkvUHVyOWdQSmpzY2QvUnB6S0R2MTZYb1hkSklpYy9CV2RC?=
 =?utf-8?B?d2F4VzVYaEJlWGpyTWlFWVZMZzg3M3lRVnBiUWsxQVFWbUx2dzhabHJUSDB0?=
 =?utf-8?B?Y092cCtsb2JDSmd6OWw4RDJsdjhaZE9TcVJQU3cybGFzbVZvYjA2NWlWYzRq?=
 =?utf-8?B?WVZtM2tGeVEzanBKc3M2bDNVcUpaekx4VkxEMjJFT1cvNG9kUkZLTnlISHll?=
 =?utf-8?B?alVGT0RTVndEZFVCaGJiRVB2c1l2Um9DeDFFa1FBRGsyNU5veVdJcVRscHlK?=
 =?utf-8?B?aGJJSzJhTlZkcjFjZW1OOEJtTUN1V2k4ajNtbDFlUHNhcERDZE5HSkMwQVY4?=
 =?utf-8?B?UTNEa1dqcWJrUkdwQlNIckNJSkVQMldoODQ3VDN1eXRXMm5KN01RODE2MXps?=
 =?utf-8?B?QUcyN202ZWNTS0RnaWdkOXdOM3lXTTl4SjE1OTh4R1IwemwwNjdzeTYraFhQ?=
 =?utf-8?B?dDlKQzVaR202UDkveWxHMnVhL2M1WGdjRVh1VDB3K2w5b0VQN2VwRU01WGZW?=
 =?utf-8?B?d0Nwcmw4c2NSVERVRGN5K05TcmxVTXRwWnluc0VEbVBiUGZHQmUvbVhPTGJp?=
 =?utf-8?B?V05XeG9lUlFjWFJTd0NFYmN0T21yZTdMOVJjQ3pTZitRRzVKTThiK1RWeDll?=
 =?utf-8?B?dk5DOWtlcjlXSjh3Wm53VDRMeXpaTTJZbkhCbzYyNFhvckQ1c1Q0YTZGQk0r?=
 =?utf-8?B?aDJLU3R3OG5uZDZlemtmN1NZL3VKLzFLeGR0WU84aGROM2FXcUFXcWxaOXp1?=
 =?utf-8?B?Vy9KYlA1aUo2RlZmS3RGWVlNZlRzc2hzTDVheHlZOU5OeUxGR0trSG01bS9L?=
 =?utf-8?B?OTRYZHAzS0NqcUFWSVFFNmx4Rk55UlhMUldReTNDQ212a2QwUXBGdWw5NGFV?=
 =?utf-8?B?MjNycnZ1d3dvdENSbnB2NDJsQTNoZEd3QkRPQW9wc1dZNlRDUVh6cTMxOE5l?=
 =?utf-8?B?QjhzSm8rbllsWGJjUW85eUhUTFp3WVNCNDA2WktMdnZYY3NNR01OZ2JkVEVz?=
 =?utf-8?B?UkFqYUU0YncrRWtFOWljU1BFYlNRY1dFSWRmYS8yRzNPQkEvU2I3UC9jOHBM?=
 =?utf-8?B?WFN2RFNISkZBPT0=?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?dHNaNVIzY3VnNjhYRDhqa0xRV09LZVlXL2FPZlhyZlM4dEVHL1oxaUxOdDU0?=
 =?utf-8?B?RFY2WW5Oa1VCNTk5VHFSRmpCSlFQdmw4ZEN6SHVFZFdIQTF1M0hPbytmSXdY?=
 =?utf-8?B?dVJTdVREUnRvY3AzSmMyYTdBR1FmL0RsRmx4U0R4MW12blhPcW41d2N4VnI5?=
 =?utf-8?B?MkJHdGZGNnB5b0VuK2N6N0xUZGQ3KzhJcWFZeVh0aHdMUGFSYUFtaXFPUk1j?=
 =?utf-8?B?Sjk4Rk9BaUFwdnFzdG8xSlNDNHZVWmFHY2p6NlVEcXFjNUV6Wnozcml1UUZa?=
 =?utf-8?B?aWxKOU5CNmVqcGtLOUUzRmJreHlDNWljVVNTdHJFQWxycDUxT0E3VWc0dHkr?=
 =?utf-8?B?T2pXdHd1MFJ1NGd2Y2JCc3lxdDhIMi9Ga2dQeCs4enNmY2JzYkJaUVNwc0Vo?=
 =?utf-8?B?dGtObHBZNVI1MG85bm9SVE1IS0oyUmNFODZFYlhXRlVEcU9PdUxtZXl5cGNt?=
 =?utf-8?B?MU5xL3g3S0ZWR2NvMnJvT2pmYlBwYUQyMER1eDlpeVpOajF1N01mRVNaUEpv?=
 =?utf-8?B?Rjk1b0c2Q09mWG5EQjZ3Sm5hVjhEQzllTDBSTmFFVmJMbStOYk16c3UvRUpJ?=
 =?utf-8?B?ZzM4ZkhSK0cyZjh4NFRuUmZlWUJiT3MvSjdxNDlqOXZWeWE0MlRyMjFtcHpI?=
 =?utf-8?B?UkVRMnFZY2EzU2xEaU9nem9sQ2FOdUV5Y1gvS0NocXRkWVJRalRMQ0hpWmY5?=
 =?utf-8?B?allzclRzYmFYSzV6a25xSmVDMVNQQXpweUJyeWlZZHBMZkRBaVFxNjBwdS9D?=
 =?utf-8?B?Zy9xRm4zZ2dUYm9GOTN6ZC9CQVFldHMvenEwYnhEUngvVHl1bVZxOTFEa3RN?=
 =?utf-8?B?eFN2cDdyK2dSVXZtbW5CSVE2MVhOUnRLOG1DMGs3aXdtdHg3ZkI2d3hCNmRl?=
 =?utf-8?B?a1YwZ0RwWDRSZUxsdE5Kd2RDa3BoMkNMRGZIKzNHaW0wZUZvM0oxUFg3NkJ1?=
 =?utf-8?B?OUpuZDdSdlE2UVZ2T2tmQ250UHJWZnRyM2d2RVM0cUpLelZzOWZLekZ0eWNR?=
 =?utf-8?B?R1RsNnlGODhlSVhUc3BGaXV0R0UrNnhXOGhycjZEcncySENaMzd2eTBzVGFM?=
 =?utf-8?B?aTNJZEdQUmJQNHRJOUhmRU1hdXIvZDd0UUVVaVlGVVFRNHNuZ0dPTnJ3b1Yz?=
 =?utf-8?B?bjBOYmxDSU5GVjVlMVRsTTZTdEc1ZU83WnM5Ty80ZHZwSUU3d1hNam9QbzRn?=
 =?utf-8?B?RW9DZysrSzhoSFFZT0lvcFNreDFJVndHL1JTQ0FuNkxSMkFvRTdFeWRzMUtT?=
 =?utf-8?B?NjEwWXNnbzd0dUt6VXprakxkQWNFaHc1TGFpQkZvOUFLVStEaUdMMS9uUTdz?=
 =?utf-8?B?eTRNOVlhSEhrTWFMYTVRNjJMSVRPZGFqTUhlVWUxZFo2WXRqL0JLekEwRk10?=
 =?utf-8?B?bytYb1Q3RGlmaEl2WmpMK3FwOUNUZStvUU9rR3NscU1wSmRWelhyb1N5Wldl?=
 =?utf-8?B?MnNDZTQ0M3IwWFJiTmV1clR1c0pvQXg5cUhuOTdGd2JpZGdOc29RVlNqbjFH?=
 =?utf-8?B?SEFOS0lKTmpQWUFZSkgwWThXR3Z3bGhHKzFjQi9KcCs5NUhyOGZVeXFKL0lL?=
 =?utf-8?B?WjJsSzlQb0RmbnV2a1RPNG9Sd1dxQkZBOER0Z0VtbmM1TEMyZXZGVmJsR1VP?=
 =?utf-8?B?MGIydGR5b1ltcThrcWlwa1d3UHVTV1R6eWtQa3E2MkErWFovZThqRGVJUE5a?=
 =?utf-8?B?LzJqamkzWUtlYnJ2ZlZWOStuN3E1Yy9pK0VTWUJVby9QdW5obUhnNlMzSjMr?=
 =?utf-8?B?Mk5oWVhicjhHcEZidE1lTXg5aDdKOGhtYjl5WXZSK2N3RWNOS2R1bk04RWxB?=
 =?utf-8?B?V240SDdkbDBrcHlSR0pvOUkrSE1LckRZZU1seXlhb21MRHBtNEJTZjFjd2Mr?=
 =?utf-8?B?VXRYYk9BbTN2Z2daZHc5bHV1Q2wzYjZXVjkrV3h5ZDhQeEhSd05WQXREaWNq?=
 =?utf-8?B?ZFJLZ3l2azhzWmh5WEtWRzd2N1hZMjFyRGdhOVhuZldnWHpHbDBaUi8zTVNS?=
 =?utf-8?B?blBvNGhtdHpQTEs1aW1lZ21JYnlDamRJWm5hSXJZZ1ZLc2NDdnZoQXpYd3BB?=
 =?utf-8?B?cWlCK2tRU0hrdXd0dHRjSU1EYVFhWDdnY0lyOGhDR0lUTTN0aCtFdWdFN2pI?=
 =?utf-8?B?RTFpTXA2NkRLSWNIQlFZdFdMSzY5b05NTjZQY05vNEhIWkR4MmFCZnlxbXJr?=
 =?utf-8?B?MmdDYTQ0M2dhd3Z1dU4yRXJNMTJ1UWhzbnRXcEVEMnI2L0VUMEMra3c3Q1Nq?=
 =?utf-8?B?b2wxNUMycDNwclZOTUNPZzlpNHJMTlZvblRrbFJCU0FiM0cveTdvQWtnRHBY?=
 =?utf-8?B?dUFtVW80Q0tvVDRMM2MvVjB4REJwQ2hWNzhITnFuV3lTVS9rZ0ZUUT09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 4e0df982-886a-4806-f8a1-08de48a1034b
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Dec 2025 19:15:51.6975
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 LYEvKuIcFI329V8kpLsdJTBJMB2WBoyquylJsf8bM4XTa9LsYNPE/8jyhFZCNgsruO+Jd8G4YKSBmCgixxG4Zg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8660
Message-ID-Hash: 5QVZGHTX5KUDBTGBFHX3GMNRK7RSJAMW
X-Message-ID-Hash: 5QVZGHTX5KUDBTGBFHX3GMNRK7RSJAMW
X-MailFrom: jhubbard@nvidia.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation; nonmember-moderation; administrivia;
 implicit-dest; max-recipients; max-size; news-moderation; no-subject;
 digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/5QVZGHTX5KUDBTGBFHX3GMNRK7RSJAMW/>
Archived-At: 
 <https://lore.freedesktop.org/4beba5c3-a117-4cb7-8fed-2f1c133dfec2@nvidia.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On 12/31/25 9:29 AM, John Hubbard wrote:
> On 12/31/25 8:33 AM, Timur Tabi wrote:
>> On Tue, 2025-12-30 at 22:17 -0800, John Hubbard wrote:
>>> Actually, I should have been much more specific, and should have
>>> asked, "what git repository and branch should I be using for linux-firmware?".
>>>
>>> Because none of the branches in either of these seem to have any file named
>>> gen_bootloader-570.144.bin:
>>>
>>>         https://github.com/NVIDIA/linux-firmware.git
>>>         git://git.kernel.org/pub/scm/linux/kernel/git/firmware/linux-firmware.git
>>
>> It's right there, in the `main` branch:
>>
>> https://git.kernel.org/pub/scm/linux/kernel/git/firmware/linux-firmware.git/tree/nvidia/tu102/gsp
>>
>> Did you forget that you need to run the installer script, and not just blindly copy the files
>> over?
> 
> ummm, maybe. OK, definitely. :)
> 

So now that I have the right linux-firmware is installed, it's still
broken on TU117, but this fixes it:

<blueforge> linux-github (v4_20251217_ttabi_nvidia_com)$ git d
diff --git a/drivers/gpu/nova-core/firmware/gsp.rs b/drivers/gpu/nova-core/firmware/gsp.rs
index 112488216bff..60d657f4d204 100644
--- a/drivers/gpu/nova-core/firmware/gsp.rs
+++ b/drivers/gpu/nova-core/firmware/gsp.rs
@@ -163,6 +163,9 @@ pub(crate) fn new<'a, 'b>(
         let fw_section = elf::elf64_section(fw.data(), ".fwimage").ok_or(EINVAL)?;
 
         let sigs_section = match chipset.arch() {
+            Architecture::Turing if chipset == Chipset::TU116 || chipset == Chipset::TU117 => {
+                ".fwsignature_tu11x"
+            }
             Architecture::Turing => ".fwsignature_tu10x",
             // GA100 uses the same firmware as Turing
             Architecture::Ampere if chipset == Chipset::GA100 => ".fwsignature_tu10x",

You can merge that in somewhere, or let me know if you prefer a formal
patch from me, whatever is easiest for you.


thanks,
-- 
John Hubbard

