Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 51E84A04FE2
	for <lists+nouveau@lfdr.de>; Wed,  8 Jan 2025 02:49:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 252AB10E7CA;
	Wed,  8 Jan 2025 01:49:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="YlIgU3wc";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2085.outbound.protection.outlook.com [40.107.243.85])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D4DAF10E043
 for <nouveau@lists.freedesktop.org>; Wed,  8 Jan 2025 01:49:27 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TbrO61qPa2fHPJ+PpX52LDCt/MwBC69QwKTIYGBsQgqGeL6tzf/n3vNKxxufayWIyVIzOe5jydE8OlfuuB86gXfJmc0SRg0vEMnnr2f6qrc/TvjSrM0JiVk79w0gJBtM/sBdLDg+lHz7Sur7o4LSiQTRW24MC7xwrfsckxEFOWbhzmjyvCzAe6UsngZYsWjUt/J1d7NN4Oh++t0CA2VWFqLDlCcLtGKSxIpm3istG8Ccd6ZEHHR591SHTz1tsLdqNC6ltEt0K5HZHTZEwgchuMgQ2yVD2THmRwr+HRmrSDQz5gbM37i+fe+Uh/R6N1V20hB3HwqE5pKgsaASOnO9Jw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qGPwt6X+IKQp3dhga8TCL4/TsEr9U64o7z2Nt7iUKiQ=;
 b=AbamiG2U0Z+Qcmdaq6FkomCA2VoTPPPrF9RDnFL6U4yoa6o5hjzpnh+ji2Loxuec+3EDwsmjTmfC/HorhuGNFO7E0yZnF9Edi4nFpJSdyw/oEAUvWCw0cdDFCYMpUkx0Fd2AClouhQhUbchSQT9GkA4zMCzYUV4qAhFWamUVwaOYUMQQGSDyYmuRwQDjpGmTwnnCdAYsptL2KRiMF8Jh9vmPf57hTVBRBKDzijSk+MJP8fTeRt8/0tWArE1fXaCxype2WEUrBCAXA8/jqV4IArSjZY/mSKWtLdUOYYNcTGzwyyi8HTzAFVwam78YDhPo0B9rrbn4e8WiAocZpi2IyQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qGPwt6X+IKQp3dhga8TCL4/TsEr9U64o7z2Nt7iUKiQ=;
 b=YlIgU3wc6BCCCkYLQsaJ29ydk9saK3H5q9WdsVgVs6tSgA5/xTadTm8VCmARE15M/lUYAZCYZxEqZH8dYuKAuO4v7TH+nsxloc3ur+QF3XlU0UFGNjjQgNoxeqkz1a4ImCII8d8hGvKCnd3m0YVrVo6iPpOahH2gJqIsdeSAL6aGCHhim0GFmd17e9TNP2D417ESt3nS3tqyukYbJcMI2Zv2cu9s+45v2I/2qIZMwDNE9zpDVFbiUAuNMNpyWAhaqCkH1ab6jtdn8GkESB4kDFKyblbkd+VbcjQ2r9Qq+vLaXpfL05zTsrpgc/JUVlnSJA6lOljpwNDxZRi4vaUqAQ==
Received: from CH2PR14CA0012.namprd14.prod.outlook.com (2603:10b6:610:60::22)
 by SA1PR12MB8724.namprd12.prod.outlook.com (2603:10b6:806:38b::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8314.17; Wed, 8 Jan
 2025 01:49:24 +0000
Received: from DS3PEPF000099E2.namprd04.prod.outlook.com
 (2603:10b6:610:60:cafe::a4) by CH2PR14CA0012.outlook.office365.com
 (2603:10b6:610:60::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8335.11 via Frontend Transport; Wed,
 8 Jan 2025 01:49:24 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 DS3PEPF000099E2.mail.protection.outlook.com (10.167.17.201) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8335.7 via Frontend Transport; Wed, 8 Jan 2025 01:49:24 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Tue, 7 Jan 2025
 17:49:12 -0800
Received: from [172.23.93.240] (10.126.231.35) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Tue, 7 Jan 2025
 17:49:11 -0800
Message-ID: <5ed045e8-020d-4d41-8d18-c29d07c044bf@nvidia.com>
Date: Wed, 8 Jan 2025 11:49:03 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] nouveau/fence: handle cross device fences properly.
To: <nouveau@lists.freedesktop.org>
References: <20250107055846.536589-1-airlied@gmail.com>
 <Z31P_Wp4qMzIlv88@pollux>
 <CAPM=9twK4UUnrOc1rB7bZLgWG534HH14vsdyCgUcKX1YLrnNDg@mail.gmail.com>
Content-Language: en-US
From: Ben Skeggs <bskeggs@nvidia.com>
In-Reply-To: <CAPM=9twK4UUnrOc1rB7bZLgWG534HH14vsdyCgUcKX1YLrnNDg@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.126.231.35]
X-ClientProxiedBy: rnnvmail202.nvidia.com (10.129.68.7) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS3PEPF000099E2:EE_|SA1PR12MB8724:EE_
X-MS-Office365-Filtering-Correlation-Id: 91cefaa4-fd5b-4d7c-8145-08dd2f86add2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|36860700013|82310400026; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?bTg5ZjhrU242bE5ENzJNZUM4S1RVKzBwR29OMnY1ZXBWdWxlejZhSGFXdlhz?=
 =?utf-8?B?Z20wYlJ1aVU5SVBZQ01hUjY4a1dFWTBxNk4rTHZGNHFDZXp3ZzkvVWJiYUU1?=
 =?utf-8?B?dlRqc0FGV0pWUW81ZnU4TE5TVWxpSWszV2swangwanRwREJDMFFXSDVDTnBx?=
 =?utf-8?B?ZVFrTjEwVDZtSnFHeE05VFhUOTBBQ096aFRCL0NlU05KU0k2ZUFrQXZ1eXkv?=
 =?utf-8?B?RkdFaEFZaXVqWXFjeERaaFprcjBZK09saThDdFJhZEsrSjJLRm1lUVJxclRs?=
 =?utf-8?B?dG5IcmFhU3JIL3hrVTg0NDEzczNzekNQQXROVGRjdWczNmhXbzV1MS9GOVBy?=
 =?utf-8?B?NExDaVJkZVRvQTZkdllabGh6OUlWa0Rjc0ttZEVFTTMzTjAwekNOUFFJSmta?=
 =?utf-8?B?OEoweHZqNEVOM0tGa3JwdTJuZ2RSVGRhRE9STmxqK045M1pnLzRjL2RJU1Er?=
 =?utf-8?B?TnpjY3F6aEdhcHB2aFROKzZ1cjhrMHVCWjQ1elNGVStocUtuaitqbVpYNEY2?=
 =?utf-8?B?R0lpQ3duaUVQQkFvT2dVVG8wK1N5VlFBMldCdUxBdS9USmUrSk1nSHhwb3J2?=
 =?utf-8?B?NGxSMXU5L2JyY2VGSTNYWHkvRVVxbTNxWHl6L2tnb2ZvY2paRTdZUzcyMlhL?=
 =?utf-8?B?a1hQRXFMNU00OGl0RTl3SGNYTVluWWhUUFM2N1JDYzc0UlpzaDFvNk9HYlI0?=
 =?utf-8?B?VHBnZmV1T2crdm9PYzFBMkJyK25MRFloMjZFTlZCbTEzeWhicUMxaHIvZ290?=
 =?utf-8?B?dlpnM1VWTWkyZFBxSkFRRVlxVEJ1Z29vN0l2eFhTWittTXNHWkdhRlNBZGkw?=
 =?utf-8?B?S0hGb1QxVXVFTkNNWkF4UFF5L3FhbkRieVJJSit6NGhhM0k0U1lrWDRvRjdG?=
 =?utf-8?B?N3pxMlFoQ21uRU9WdEJqYUpxbGs2bVJCaGxSNkJoSkptTXBmVit5Qmd4N0pP?=
 =?utf-8?B?NTlEMUNKck5nSDdpY2Z6T0QvTHVDWWw5VW12Tng0VGVHcFJIUUY5dUFBdU1u?=
 =?utf-8?B?M0pvdEtzTDBhYVdtN0hJbWE5enlTbzFCTlZRZTlSMzhxK2pXbEt5Q2lwNW9B?=
 =?utf-8?B?cThJb2dTZzNqbFN3eDBnT3FXOTN2QytrSmxLZUNzRkRQSjNLMGJPQ1pFNG40?=
 =?utf-8?B?dVg1UWJsM3lVYS9XM21yV0xQaDhRK3dnS2J2RWpiSGVIMGRPeDBGdFVITTFS?=
 =?utf-8?B?azhkd2lZeXVLOVBqcmJPbC9IRDlUYUx5cXV3YWFJYUdBUkF6TWZaRS9PMkU1?=
 =?utf-8?B?ektDSWh0V24yYStTMXY3ZURZVDcycHA3OWc3cVlkUEZ1RXVxM1NlWitLM0Zm?=
 =?utf-8?B?OFpzNDFEQlNVdWp5Y3Z1MExudENYWUQrNUt5T0pka1ZQMVBYazVuVzhWWTVv?=
 =?utf-8?B?Y1lxWXF5ZVdDQzJIOEtOOXBudkdaWXMwNTVoSE9OQlRIREtPTjd0QTAzbXRn?=
 =?utf-8?B?aW5ITkZ3Z3JiVXVGV2M0NXRVdkROS1VWNHpPSU5ock5VVXk1dDBIVVBPdlpC?=
 =?utf-8?B?NHUzZ3RjZTJ0WFNpSVBqQkhYNmRScWxFU1JxVndNZ1lvQXpMUW13dThKMGs5?=
 =?utf-8?B?U3V2OC9VMWhnbXkwMkI3RWZpdGtDdGEvcDRCZm5UYkp4WjE0WVBzWjl1em1W?=
 =?utf-8?B?K2dzcTQ2VjRqM2RMV2RBOVBjMlM4V2U2OEJDYXdDRGxsWjlaM0xOOVNKcnZr?=
 =?utf-8?B?S3IzQmdHVFYyZUdGb3RXdU5acXRXVnhYU2NNYWU0YkhQVUZJaTU3T0dkNFhP?=
 =?utf-8?B?ZzZaL3kzbEtuK2UzU01hQXhYR1E4T1FuM0NuL1l2UlZxZCtudFluTVFBSCtE?=
 =?utf-8?B?OFNHbmlrRTh0RGNubzlPTENFdGVSRE90SEFsanpJbnZ6K0dlNDJFOTJycXMx?=
 =?utf-8?B?Mkx2TlErM2pRMytjcmxDY0xrUWpOczZXZkFKSWZKUlpHVXZVS1dBTk9rdjhR?=
 =?utf-8?B?eFVESDFtM3hJRXFGSW1VWkY5akl1aTNZdnRDd1FpdWJpRkQxK3J2eUNjSU1z?=
 =?utf-8?Q?UPQZzcxlaH0FxRYdySSCfSSFtuyR6w=3D?=
X-Forefront-Antispam-Report: CIP:216.228.117.161; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge2.nvidia.com; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(36860700013)(82310400026); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jan 2025 01:49:24.3293 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 91cefaa4-fd5b-4d7c-8145-08dd2f86add2
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.161];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DS3PEPF000099E2.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB8724
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

On 8/1/25 11:04, Dave Airlie wrote:

> On Wed, 8 Jan 2025 at 02:02, Danilo Krummrich <dakr@kernel.org> wrote:
>> On Tue, Jan 07, 2025 at 03:58:46PM +1000, Dave Airlie wrote:
>>> From: Dave Airlie <airlied@redhat.com>
>>>
>>> If we have two nouveau controlled devices and one passes a dma-fence
>>> to the other, when we hit the sync path it can cause the second device
>>> to try and put a sync wait in it's pushbuf for the seqno of the context
>>> on the first device.
>>>
>>> Since fence contexts are vmm bound, check the if vmm's match between
>>> both users, this should ensure that fence seqnos don't get used wrongly
>>> on incorrect channels.
>> The fence sequence number is global, i.e. per device, hence checking the vmm
>> context seems too restrictive.
>>
>> Wouldn't it be better to ensure that `prev->cli->drm == chan->cli->drm`?
> Can you prove that? I thought the same and I've gone around a few
> times yesterday/today and convinced myself what I wrote is right.
I think Danilo is right.  Using the VMM would prevent synchronisation 
between clients on the same device, which was one of the intended purposes.
>
> dma_fence_init gets passed the seqno which comes from fctx->sequence,
> which is nouveau_fence_chan, which gets allocated for each channel.

All this code is really old and horrible, especially after not receiving 
much attention through many many DRM changes over the years.  But - all 
channels share the semaphore buffer, each with their own (fixed, based 
on channel id) offset.  There are indeed per-channel GPU VA mappings of 
the buffer in the fctx, but they all point at the same underlying memory.

The "new" exec submission path doesn't use nouveau_fence_sync() at all.  
This isn't the worst idea in the world, given various shortcomings in 
how it's currently implemented, but I've never felt confident 
*something* wouldn't regress by removing its use in the older paths (or 
buffer moves).

>
> So we should hit this path if we have 2 userspace submits, one with
> say graphics, the one with copy engine contexts, otherwise we should
> wait on the CPU.
>
>>>   drivers/gpu/drm/nouveau/nouveau_fence.c | 3 ++-
>>>   1 file changed, 2 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/drivers/gpu/drm/nouveau/nouveau_fence.c b/drivers/gpu/drm/nouveau/nouveau_fence.c
>>> index ee5e9d40c166f..5743c82f4094b 100644
>>> --- a/drivers/gpu/drm/nouveau/nouveau_fence.c
>>> +++ b/drivers/gpu/drm/nouveau/nouveau_fence.c
>>> @@ -370,7 +370,8 @@ nouveau_fence_sync(struct nouveau_bo *nvbo, struct nouveau_channel *chan,
>>>
>>>                                rcu_read_lock();
>>>                                prev = rcu_dereference(f->channel);
>>> -                             if (prev && (prev == chan ||
>>> +                             if (prev && (prev->vmm == chan->vmm) &&
>>> +                                 (prev == chan ||
>> Maybe better break it down a bit, e.g.
>>
>> bool local = prev && (prev->... == chan->...);
>>
>> if (local && ...) {
>> ...
>> }
> I'll update that once we resolve the above.
>
> Dave.
