Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0307BC6CEF6
	for <lists+nouveau@lfdr.de>; Wed, 19 Nov 2025 07:32:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB0EF10E225;
	Wed, 19 Nov 2025 06:32:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="YT/+TXuG";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from CH1PR05CU001.outbound.protection.outlook.com
 (mail-northcentralusazon11010016.outbound.protection.outlook.com
 [52.101.193.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 92FD310E225;
 Wed, 19 Nov 2025 06:32:17 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yvFFlObWfKiaSRHJrjdgi1iUeLsDuDlLb2+crDbjekAhihJJVHs0SggUr7YFET7XjMHMxWpmDePZK1gQSxpJpwVXsylJ/nX/sRhm3UeqCoWXjhFKMkMa9/sRhlsFAqezCEXISxuhiZh7Yz7VYAbF9emWqIA/Haxr67eX5a/JfNZ2Yq8qvLqB+ncu6g8bk0OPKlBLbIisNl5kadyrSb3Jc0Jpjou/6GMrDNoxImqbg9VCLjdXkMFaBln9Q9m8PmbaFgtc1DPXUKnPv1OBSCapXZ8xIftedHfdH1/Op9YEZRQh4ZK5qREm59tzsdsEMNQKM0686FUYADRGyDvrgxS5Sg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7jETRgLrl/NhbPepwR6HWd9yR4OJPdYiwse7EmhU/dI=;
 b=jE95unCs4p04jzG/NRcN9p2VvKCF8RvlfRXXc/SMt2FIs+AJboCEUZMvBQixLAzeKKxyxB2T2ULp70rV9K3I0Ng/7tE5sBLNwIliKaw+GcPw7Lp7FDPTVLh6wcvgrVfkXxfYswt+hjx7R3LP+ZngW+vw6X3tMKimpU/baxhOCslvWxdZbRt3bYUgRM0exSN2SwHxlugvP/vMCPzb71DeZF18MQ/e/zKE7e7iRoDu1WGygKqwS8DEoLJowLFbPs0SsdWyZ/oMnk7xV1SVmYU7gZljqL+diDUNR9hEoHxAZLD2TOWS4w1UiubnmiWDXQzPRlDaVq6SNz3urUS8TbyMAw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7jETRgLrl/NhbPepwR6HWd9yR4OJPdYiwse7EmhU/dI=;
 b=YT/+TXuGu8DAnzMAC/Y4wgl67WiLQfMfagib0snNqYNe+HlyrzaRM4j1CTUJnnP8eGQg9l0Mw1FiYImLlAONSeBy7KrIgTgqIuVWV9pI/zK1MIDf1ZkkmCSeULix4eOwYhjIqGbkiJcLnhGQqv/agxuhHoN31fgp9ehae5vgVrJBj4g0LDhnO7mtfJCH//lojaGWSdYf7o6eftMHKhV4TidEzZLn3sYMUYmweSvLEhbTMDOkcvtzyYNBfTaQ3Y/E6jszn0oGW29wLj5PJ63GQ+HYppV7CqkP1hhODvJftkM/AA3A3c2YDDlmZuklvzey4gl8NyLu2W7MPhARc2sC9Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 BN7PPF2E18BD747.namprd12.prod.outlook.com (2603:10b6:40f:fc02::6ca)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.10; Wed, 19 Nov
 2025 06:32:14 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%7]) with mapi id 15.20.9343.009; Wed, 19 Nov 2025
 06:32:14 +0000
Message-ID: <41a7abc8-b8fb-41ea-8b10-e55c9795c246@nvidia.com>
Date: Tue, 18 Nov 2025 22:32:12 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 05/11] gpu: nova-core: add
 NV_PFALCON_FALCON_DMATRFCMD::with_falcon_mem()
To: Alexandre Courbot <acourbot@nvidia.com>, Timur Tabi <ttabi@nvidia.com>,
 Danilo Krummrich <dakr@kernel.org>, Lyude Paul <lyude@redhat.com>,
 nouveau@lists.freedesktop.org, rust-for-linux@vger.kernel.org,
 Joel Fernandes <joelagnelf@nvidia.com>
Cc: Nouveau <nouveau-bounces@lists.freedesktop.org>
References: <20251114233045.2512853-1-ttabi@nvidia.com>
 <20251114233045.2512853-6-ttabi@nvidia.com>
 <DECC6RG6POV3.32454JPX1CK8E@nvidia.com>
Content-Language: en-US
From: John Hubbard <jhubbard@nvidia.com>
In-Reply-To: <DECC6RG6POV3.32454JPX1CK8E@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR03CA0078.namprd03.prod.outlook.com
 (2603:10b6:a03:331::23) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|BN7PPF2E18BD747:EE_
X-MS-Office365-Filtering-Correlation-Id: b91284b1-b739-4288-7a33-08de273560c8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0; ARA:13230040|366016|376014|1800799024|10070799003;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?QzdsUVByNnpZMzBBWUJ0c1NnNGovZnRjT3dCVklKeVBybUhwOTQyYWU5bzBa?=
 =?utf-8?B?QTdNaHF3THFMMnZka240ZjJqYWFQeE1sa0N4eTFlK2hzUkI0OXVBMTM5VDdP?=
 =?utf-8?B?VFp6YlZNNVFpZkd1NVBzcnBxa2ZqNUJ0V0tGdi95RVkwWXQxa09CUjFMaWhw?=
 =?utf-8?B?Qkdobld2aDhIYTBITTg4YXlQNk5RYUFwZ2sweFNIV2FnbGovcVhOOU9YVHpT?=
 =?utf-8?B?TzAwMzZlb0VUL09LVk5WdjN1QWRnRW9zR09YTmRRa2ZTU3VzR01vNFlXTzg1?=
 =?utf-8?B?WUcyc0p3TG15YTYvd3VzSVRzb1VPd0xBKytuYjg3ckJKc0NCL0d6V0kwNGFD?=
 =?utf-8?B?eHBGT0dJaW5rbHppdmZDMVEvaE95VFZWRlEyMWNEclllZCtaS3FudkFCSFdj?=
 =?utf-8?B?RzBrV2w2THlwbjZNZkw3MHBWVGZXWHptYjFxdEZZRmh5SGpndHMxU3RYODFX?=
 =?utf-8?B?WHNLbHJKZjZjZEhpbE85Y3FGNk1UZUxtd3R4bW1YQTJrc0l0N0R6SDI4OE1w?=
 =?utf-8?B?S2pJUFVHdSszK1VSWGllWUtyTk5pUkNsOVV2bWRTOCtlTHB0ZmhvOVVQVk5L?=
 =?utf-8?B?clIvZVNVTnZ2LzFGM2tTaDBIUTV1THZUeE9QT0VFSDhjSldZUTB4RmJGWjRX?=
 =?utf-8?B?QWRhNjNxbFJCZ28wLytUdkZUaUZmLzJRaW5zN1dHRmNtSnNIRFJkeFpTRTN5?=
 =?utf-8?B?OFhRZXRtbC93a2RURlAyd1JObFpOaVRjQktnTXlib1NDanBWUUswWm1ZUEY5?=
 =?utf-8?B?OHp5ZlhaZW9ZRjU0MDZvZzd6ZEgzdUdtbEhPVnVpS2ZtUTlSK0Y0RFpCYTJz?=
 =?utf-8?B?dGZJakdQRzZXY3kwRFBqcEw4blI5d0VDTDgwampwUld4eFZ3K3JTZy9hM0xH?=
 =?utf-8?B?Nk1MSzlqeFNSSCt4Y2x0bW5xRlNYeUZ0dFdKRE5laVB1VGxyVUxmYWxhdGt3?=
 =?utf-8?B?anRBQlFuWkV3WmNDU0J5VnVYSlBCdnFnQlJwalpoS1haL2NLQVFFWnJSaE5V?=
 =?utf-8?B?bitIR3pUNzdmbXAxVmtWZGlvQlpEcXdXdnJodWM5NnJCSXlPaUd0dnVuc3BJ?=
 =?utf-8?B?YlFCaExWamY4RlYwWkNHUTMwZDBOeGxkZloxSWZ6MVFvdzFjNzF3dmJpZXR6?=
 =?utf-8?B?MjVobU1Edmc3ampicG1DRWtQcERERUxPRU5pSXR5eHM2Mlc1blVzOXVkbDFR?=
 =?utf-8?B?Z0dVRTdxN1hXV25kWmhQSGFnZ1NhQXR3SXZYOGphWXlzVG1zMkZ1ZUNrMURI?=
 =?utf-8?B?ZHF1QWpKYnlmaXhqbWVnc1J1UU5Ia1EyZXlodXIxNVp6MzZwSmc0MFZyY1k4?=
 =?utf-8?B?bm5vTGFYaTRTemx4aDNVem5UZndFM2pkVE5HNzVCeWJGZkJ6aXNVWUZHQ2lD?=
 =?utf-8?B?K2dPaGtxMWRRUnZuaTM1cVdaazBwV0tNR25lbStXYjdxdXJnQ0xYc3VaRU1L?=
 =?utf-8?B?a2R3c3diWFRoNDVwVmdSbTNXaUNKTjBacmsrMHMzbXA3R1ArYjJTVjFkRENK?=
 =?utf-8?B?aklLb0pxT3NjUDdmb0N0RUZKZ2Y5Y0JNRXM0OHF1YTJubVRTdXdMMy9kaUxn?=
 =?utf-8?B?L2hFQktxVmtZaFR3UzNtNVZSQ0xSYkF2NndNdFNzYU43eXczOEdJMWRrdVZM?=
 =?utf-8?B?TWUvT2xmdXNWR3hqaVlMd2RLUi9KOGM5SmwvOUtPV3MvK3Z3OElpS3Zua01W?=
 =?utf-8?B?VUp1aXZkL0xqREIyYk05aTZzNE9RM3o4WUFaekVQano4LzBlanVvSnk5cWtZ?=
 =?utf-8?B?OTZEc3B4c1EvMUc2NzZ5M0pib3p3WENHbHZGak9lOXZQM3dDcHNWY2pqMkRP?=
 =?utf-8?B?eloybmtUZUdKY1g3TTRhb0JZNEhxRFQxSGpITU5RMlBWZGZKS2FHRWFtR1Fu?=
 =?utf-8?B?Q3hWbUdObHhGY1RuUEIwMUZsVkE4MDFjbktKVnM5WWkvSERhcWxieWhxODlZ?=
 =?utf-8?Q?GElk+eA0e2FDTmu5DnfPedYlpone3B6Q?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM3PR12MB9416.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(10070799003); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VjQ1UGJPSTVZQllVMllrZWh6Uk5YU2x2L1BIS1FRMERoOXU5aU5aZExBRUNo?=
 =?utf-8?B?YXVORkM2S1MrVHBGTjVadm01ZTM0Nm5ucXZPajYzSFZzblZxSzVjalNOQnlU?=
 =?utf-8?B?Sk1mVkVWUWZZTllLaFROSWExdExMaXZpRHkreEtvcHd1VXd4ZnpiOHhacTdy?=
 =?utf-8?B?ek05UEtPTWlZdHJIcHdUSkFrNG91T0hTNU1lb1FUVFRNNEpjTWNaeDcydFFH?=
 =?utf-8?B?YUQ4eGFVMU9JV3ZSU0k3bTdHQzJPVnpUM2MxdGkrZlZXSkNUZWxtZ3FjSFBm?=
 =?utf-8?B?VG1qK08wN25zYnJiK1RMK0laOFNtNFNseGNscG9wQ3Q0Q2c1c0srNVE3TlU1?=
 =?utf-8?B?U1dyTkMwanZvSElmMllBM05RWVZnR3pqbElJTVJGVkQ5aEQ4Vk53dXVvVmEw?=
 =?utf-8?B?UnQySnd5MzNKUG03MTlxSGNTWEFVSU93bzB3YU5MbVVpRVBEeWYzSU9Jd3Ey?=
 =?utf-8?B?bU1XaVIrYVhEOXM1cm5CcGpuL3ZjdTNEZjZNM1NQREk4TVRXb25ZYmpJYkpX?=
 =?utf-8?B?RnVhenVwQmZ5WTNSdjZ3VHg4SHN6eGxPMlp1d0YxM2E2U1hYS0RXMmVYR1R5?=
 =?utf-8?B?ZUV5N2wzYTNoamlUM3BKYXczb3FtUlBFWHhzeG94Vkx5UUwwb0FwejVjY2dq?=
 =?utf-8?B?ckZsUTRZYU4yNnRYWnV2dlFWUktiWGIzbS94Um5iS3RpZ3Vid2JwYWs4Sm9U?=
 =?utf-8?B?aFYvaE9IL2lQTnBvaGI5bzErWkQrbU1kN2FHTWovM28rME9JL1NZL3ViR2gy?=
 =?utf-8?B?NldMb3ptQkErYm51TmZWZ2l2YmR1Rm93dnQ0ZysxMTEyR3hNdTN1YmJnMXlN?=
 =?utf-8?B?YkN0b0NRM2d0ZnRkVENvZlBHU2U5WkNpMTNIYTcxMnZPb0w4Z2pNQzZ3eVMy?=
 =?utf-8?B?V2Y1ZGRtbEtsVWdqL3liSitSb1hHUGo3YW4xNzJickVoMFNYQzRYdWphM3dK?=
 =?utf-8?B?a1U3aER1YTBLM3B5aWlCcThxWUZORjBwS2R3am93Y0tpTDVJSXlTSmN1cE10?=
 =?utf-8?B?UHZXZEhIOGdmdk5LekplWXlaRlNEMXlFYmUrZXhxaEJyR2ptM2d3b2orY2ZN?=
 =?utf-8?B?OVh2TGdMQXRqQ1pBTlBTZThZcVd2andITmw4aEs3QTliQStyT3IvTkJIN0tM?=
 =?utf-8?B?aExTSUx1Si9qVGRiYW1QMy8rK3ErRlFzTk1GQ0FkNCt6Slk4dHVWaWplbVN0?=
 =?utf-8?B?VEJ0VnpLYzJ1RktGSkozMUlLRkdoM21mSHNQdGRCWE84aFJKQ2p0NVM5cSs2?=
 =?utf-8?B?cW5BcU8vUXNuQmVQV1F5MytwaEpoRzN2djJFWEEzS250TzJuRVFYZ3BaK290?=
 =?utf-8?B?aEVkZFZGbXJydkI4Zk9UQ3QxcGFkYjlFN2pWbVJVQlFNMDR6azZybXBFQlEz?=
 =?utf-8?B?dFNWb0l2dCtLWmRFc0hFbVRISmNQNitIMUd6cmhsazNicmFudVRhUDJxb3hG?=
 =?utf-8?B?WGNib2RtUWFHTkVmNHJkcnl5WjQ5dXc4NnpvckNYNEVEdkRKTGZQQTY4U2Vo?=
 =?utf-8?B?VnJjd2s0N2JuWEJ4em9vTTgvenZ4WUNCZlBTeHJKWlNSdlA0Ky9BS0VoMHZt?=
 =?utf-8?B?VXRsKzVJTi81a1pDWHZyNWppQXZXL1VBaU5kUm84L0UrOFVpdTNrVno0OVJw?=
 =?utf-8?B?YWw3dDdPWEFxNDBjaEV6TmxSVnBPM3BXdUgrbkNmQzJJR0dYWGduZUl2MzIz?=
 =?utf-8?B?UkZnMUgxOXNIT1kvOTFCcVJ6YnpFTlJiUHJLZGNMbVd2eEE5TVY1dWpTaG4w?=
 =?utf-8?B?M3pOSVl2YUVDdFliQk90aDlEZUw2UFRWWmZhWjExZm5jVG55Y1NsaWMxZXl3?=
 =?utf-8?B?b3A0M2EvMjFleWpSNE96bXc0dy9Za2c3aFF0SHlpSG5tZVVaVmhkRm1QdGQ0?=
 =?utf-8?B?cnJLblVITkdTQWpHOURiM0NjbjlWSWJpQUFNYVBKbmpYN0IwTDBUUW9aVDN6?=
 =?utf-8?B?Mm9najY0djFWUzZRU3dyZForcUJqOTlTajRsUXB4aVpIYVlobkh5bzZWbDRY?=
 =?utf-8?B?eCtLSjhDNGZLbFV4RXVyUVp0dkIrVHdGWnJkaTc3U2JCOGVlWTJwN1grei9m?=
 =?utf-8?B?ZWhaV0s3Rnhqb1BnSEJZVFFsNURucFhrM1JORjhpNWYyNmU4Q3d2U2pnanoz?=
 =?utf-8?B?ZGhxUXRacFgxSGJKVnVNVHNLU2VkQytnZDZuTFJkQ3docXB3aWdHTXZXOVdC?=
 =?utf-8?Q?GLD+P+ayeu4vJ3rKT49um74=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b91284b1-b739-4288-7a33-08de273560c8
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2025 06:32:14.5715 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mO9FTFPQilwnT/ywmaY4DR02qdUHe3G183/tYGD9xnUq33QoN1KQRywe7136hes5EvogXDdouu+faOGuFY6XVw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PPF2E18BD747
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

On 11/18/25 7:04 PM, Alexandre Courbot wrote:
> On Sat Nov 15, 2025 at 8:30 AM JST, Timur Tabi wrote:
> <snip>
>> @@ -290,6 +291,15 @@ pub(crate) fn mem_scrubbing_done(self) -> bool {
>>       16:16   set_dmtag as u8;
>>   });
>>   
>> +impl NV_PFALCON_FALCON_DMATRFCMD {
>> +    /// Programs the 'imem' and 'sec' fields for the given FalconMem
>> +    pub(crate) fn with_falcon_mem(self, mem: FalconMem) -> Self {
>> +        self
>> +            .set_imem(mem != FalconMem::Dmem)
>> +            .set_sec(if mem == FalconMem::ImemSec { 1 } else { 0 })
>> +    }
>> +}
>> +
> 
> After merging `ImemSec` and `ImemNs` into a single enum, you can change
> this code into:
> 
>      self.set_imem(matches!(mem, FalconMem::Imem { .. }))
>          .set_sec(if matches!(mem, FalconMem::Imem { secure: true }) {

Or with enums all the way down:

           .set_sec(if matches!(mem, FalconMem::Imem { NonSecure }) {

>              1
>          } else {
>              0
>          })
> 

thanks,
-- 
John Hubbard

