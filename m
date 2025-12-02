Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D28AC9D52D
	for <lists+nouveau@lfdr.de>; Wed, 03 Dec 2025 00:20:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F24D10E040;
	Tue,  2 Dec 2025 23:20:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="X1I+Z2bQ";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from PH7PR06CU001.outbound.protection.outlook.com
 (mail-westus3azon11010007.outbound.protection.outlook.com [52.101.201.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C59E10E040
 for <nouveau@lists.freedesktop.org>; Tue,  2 Dec 2025 23:20:36 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=k5KnxDGW2M/T/blxzcAazbzDLkGOCkkIx/jjqPQE+NNIIBhB3B/gyr+fpmxRGRpF4LCEXKty2DXrhN6TtczkVpqsuOP/3o4C3ooRxXPjAzdGZ459NFIIjzAHC4bBqeUd6i+ySlN3pgbJtkSCUEvxsAVE0IDLgpFBVhEzNdqB8fYSZRG+pQ7QbSTuibxjYL0pBbh1GaYHSEje6BRg912VsR+HZQbiTTVMiB2IAXAqotj1FIpL/5dM2cXkV54AztU1jQ4zUnrKFkWCowFNOu6mko/y91tmhjv7FmkfNCbH6DVzFS3bP3fk3FcGnKt7bu6aue1BuTNeDlto8yVOkBEpgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=v34ZK3KY6OA7TdwM85RdOwsU0zPmZ08K4NflqYUoiZY=;
 b=Xv1yv/c1Fsdt+SbKbo2wG6CNRUbzF5u4fJ+0JgzH5CHWNUd+5URduvDYIPdtUGeyoqkimBC53MbYkqmdR10DNdepfbzofDAlZvZoogNengUoSuJZXJMJ9QH2zEUVGV7FT7SBTloAnCGSHiDgFml23DHuh1h3gC/iMUJQ/mzqjX/SGxLupZHNDFirWobCQk0znXZ41rNFPt39Vf7L6qzSYDhDIOvaExxShZ2UQETjUiEkpMm6ppRYjVzBL4huqCCUqNR17A6umOndrpLWFie5h6x6lRHcJhjxiI0+J+TbNZEGMlaQtsP8f8yIbf7/J1LXCdykl2eHZYrvshKZpJCiNA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=v34ZK3KY6OA7TdwM85RdOwsU0zPmZ08K4NflqYUoiZY=;
 b=X1I+Z2bQUmsXfGEk775jrUY70PC9pZFT64X/66g8kmRpZlb0BNxlz5UgoKb37NpuLbxOAlkE0jLM9E6WXGu7LbYPrWxypN0Ms+wM3cPun8jUZyN6PeJuNNrNBCUYavzxzIHtDr75PYaJMX/NzYAS4PyFXkbrnhw7xxXkmyKtw9Qd1JrBwZUdtVeif9YKEV6D281BG5AbDeBPL8PYnCCOBCbv6Yv1Z9vOjGpnT6Nko5D3+WPxeMKhSK6bcZx4PPp63Bi/SjGncLbR8+mRgQWrJmU5KKlJFdWNaenK3372CKhdvqC3aj40wU0JP/b4UVkAzLOOeR6cEozcp1r6P7BdTw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SN7PR12MB8059.namprd12.prod.outlook.com (2603:10b6:806:32b::7)
 by DM4PR12MB5985.namprd12.prod.outlook.com (2603:10b6:8:68::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.9; Tue, 2 Dec
 2025 23:20:32 +0000
Received: from SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91]) by SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91%2]) with mapi id 15.20.9366.012; Tue, 2 Dec 2025
 23:20:32 +0000
Message-ID: <cec4c58a-cdfa-4bf9-8d0e-7c47d8232697@nvidia.com>
Date: Tue, 2 Dec 2025 18:20:30 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 12/13] gpu: nova-core: add PIO support for loading
 firmware images
To: Timur Tabi <ttabi@nvidia.com>,
 "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>,
 "dakr@kernel.org" <dakr@kernel.org>, "lyude@redhat.com" <lyude@redhat.com>,
 Alexandre Courbot <acourbot@nvidia.com>, John Hubbard <jhubbard@nvidia.com>,
 "rust-for-linux@vger.kernel.org" <rust-for-linux@vger.kernel.org>
References: <20251201233922.27218-1-ttabi@nvidia.com>
 <20251201233922.27218-13-ttabi@nvidia.com>
 <581a1e44-e6a7-4ce1-8254-a92392d80cbd@nvidia.com>
 <aba0e260e8a2909c3c66a1aca07574c9192b0dbd.camel@nvidia.com>
Content-Language: en-US
From: Joel Fernandes <joelagnelf@nvidia.com>
In-Reply-To: <aba0e260e8a2909c3c66a1aca07574c9192b0dbd.camel@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MN0P222CA0022.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:208:531::29) To SN7PR12MB8059.namprd12.prod.outlook.com
 (2603:10b6:806:32b::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR12MB8059:EE_|DM4PR12MB5985:EE_
X-MS-Office365-Filtering-Correlation-Id: 0b69a8e6-0082-4786-9c1c-08de31f96395
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?VzFJcDV3Zm1lT3pWSkRZYXFxWkcvdFMwNys0STdhd0lqZWI2RUU2UTNOZHRK?=
 =?utf-8?B?cnZqb2kvTUdYOVA0ektmV1V4WHl0eThGZURhL1pYSUwxUEx2MldYb2tLTnpy?=
 =?utf-8?B?NXJsUk5OOU1SaGhaYlU2TDR5T1B3dExJSFoybFNxV0xEZVlySDJpamsxaTFN?=
 =?utf-8?B?UHJCajF6d2tySzkwSEl0RXY1UjdhVmMraUgxUmJMbWFqSEEySjl1K0ZpV3JT?=
 =?utf-8?B?WlA0bmVPWVNCN3VraWROWC96Y0xKM3c0NFlGSFVTTTdqK3dBY3BPcjFYenp0?=
 =?utf-8?B?TEtYM0hMOHFIb1dsZE9CbUdJLzJGbURraXJUdzIrb1ZDcTJod1lBNFlNQTdS?=
 =?utf-8?B?dHVrYXhXSmpVUDdtVHNzNkdiMU1JNnVOVW94MjBrNnVNdjlCcitHUHEyMmFH?=
 =?utf-8?B?enQ0YTNhNzhSOGhvaXpWc1hUTndmZCtXOUd5R2xJRGVYU2YwazZ2bHlhWU4x?=
 =?utf-8?B?QXNWTHZBSUFTU3dwM3lUTmFjSnZXUXo4UHkzaUZlNkYzWXB6U0w1bGprd2dZ?=
 =?utf-8?B?ZTlxOXFmb0hUS3IvYktZaFBCaStMS0prZ2xsRUxJa1dwVWRxZXNPTlN0d2t5?=
 =?utf-8?B?VWN6cGdRVkV5dGxTaWNtS0JaREZpdDFaQ2Z5aVQ3VCs0NnJmZ08rcUFWMk81?=
 =?utf-8?B?MUxBWFNSS3l6ZFpnNSs3dCsxY29pUFdqY1NLWHJpWkUxbG1FZ2EwQmswcnZm?=
 =?utf-8?B?VXVaaUZSQkFjMmlrU1I1UVNTQlRnb2dZVTJPL2QxSDNGa0xmaXpJTUxleFZk?=
 =?utf-8?B?UW5SSnRMbjFSRWcwSkRJYXJIb1U0L0pBdHJpWS85c0ZXOEJxdDVKKytoL3Nr?=
 =?utf-8?B?bFVKTGNaRjBlSCthOE9Wa2xsQTQyeHp3V29Wcm54Njk2SEtEQ3htNUZpTGlo?=
 =?utf-8?B?Qys1c0tkRjI4NVhqd1FPb2xadEljRnQxdlAwU1NkeFBkT0dzVlFOVk1kRVlT?=
 =?utf-8?B?a3JqZFBpekhXMXd1aGR0bi9sb2E5cFIxZktORjFoQXJ0YWdtUit1OVpNeER6?=
 =?utf-8?B?K2RTYWpwS0M4U01iMXlnam5vM0dtQ3JLeFhKdURCWnJ3aVJHQjhET2Zvd0or?=
 =?utf-8?B?ZytQL2NoNCtVU2Y0SERSMHQrN3dBbVRucm9mS25GWGFESSt1R002ZFlvd1lN?=
 =?utf-8?B?SGpSMVhTOTRtZldCRmpOMGFRMDJneEc2VXMvSThTZVgvVjh2aE1uRG5QY3ls?=
 =?utf-8?B?Y0w3TlJLc0lMZEdVcjhnaVIvanJaSkFxZjh5ZXRacTRjNmlabS9ZcDNVQnY2?=
 =?utf-8?B?TStqejlUZTN6TXVkdUlHOXpFQnl2dDliOTUzbVNDdDV4WGY1RnZMRXM4eFRI?=
 =?utf-8?B?MTNBVzAzK1VJVmJZZWpjdE5tbkllWVJOUnlNOFAwYjRyV0x6ZFRBZTZUZFV1?=
 =?utf-8?B?Z0ZEUVZJVnlaWFljNE5CVFZVNXMvMExuQmN5MktsZFUxZTR5SzJ5REh2dVk3?=
 =?utf-8?B?WEx6ZVZCbElTNGhFb3F5MWJMdGRDdVkvYUEzRjZkS0psbXJIRHJhcytqRU5Y?=
 =?utf-8?B?Vm8vR3lZZENZQldWcmJzdGhkdXJEQStpYkdYUEVEN0U5S2t1Z20yWk9QNzUr?=
 =?utf-8?B?WHRwaU9OR294Mlcvc0srOGFOR1hFMWh0TDRrKzFXU2xueUFYY2dhMTV6d1Nx?=
 =?utf-8?B?azA5TUFuMkhCOVdiSXFQelJtTThVbjN3QzY1bDA3VldoOFU0bjBTaWxKYmg4?=
 =?utf-8?B?RHd4UEVFR1lBWWtiV1MxallMbVMzdjN3dCtlV3NhYVAvanJUZ1JqSkdRbXQ2?=
 =?utf-8?B?RGQwQWcwRThOS2RYdUcvZy9mMHkyampIVWNPV0UyL3dJRlplaVduSWMwbFNX?=
 =?utf-8?B?NG5leEdZQldYSDFzcE5JMENFSGdHbmZWSHlKRVdNWm9oaGd1UWlBL3k3dGRD?=
 =?utf-8?B?V2I1N3lkRVV3UVdjZFFtRjNRQlVuWUFzeTVqaTUvSlM4aHFNL3FiZ0dsR0Z3?=
 =?utf-8?Q?dpGuy0GTX3Eb9eZoI8+qHFQUb3xNWcj/?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR12MB8059.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dmtPckl0QTBjQ25tRjFubkNnR2tveDR6QmlYSkJHck5CR0creHZvYm0zQUVk?=
 =?utf-8?B?TnFEMVlkSDdSSFBCcHFHMXJub01ycTF0c080ckQ1aS9tUXJNYmppWWMwZkcx?=
 =?utf-8?B?MmJ1MU00bW9QYmI5eUZUMytSOTZ4Vlg4eW16dGxtT09yODNTWXNTeGpLc0Qx?=
 =?utf-8?B?Y2F6ZzBzOFVOaFZtc01DSG10QTd5TVVZdGVZMjFnbkdqdGg1U0dKK2VaM1lP?=
 =?utf-8?B?dDFMcVFPZU5EKzJ1aUUvK1I3MXVXU0luNjR2Z2lOTmJ1VnpNMjVDbmxXUTlx?=
 =?utf-8?B?VGU0Z3hkQ2JwU0t2WFJ3QlBRK1hVVy9wOS9rOEh2cDBLK0x4NHZmclk4RXdj?=
 =?utf-8?B?ckZ6YXhtVldnYURySWNkY2R5d08veGZmaWZ2dUQySVpHNU81ZW1kVFpGZFFF?=
 =?utf-8?B?UDhOblJGVjgxUlBTMVlLUW9WcXBqOTJ6MGxZUzdtSm91OFVEZWR1c25FY0d6?=
 =?utf-8?B?b0FHY2Y5S2RkN2xMYzY2YittTGUxUzZlRnFlN1JTaGlEaGQ5ZUpTWlZ4b0Mx?=
 =?utf-8?B?bmFFV2xQdkF5MVYyeFAzOGxyQkZzRUU3ZDZ6bm5EUnNzRElkL3lSNUpsNzF6?=
 =?utf-8?B?cmJtSkJFbU15d3dPSkxOVm5vUjBMVmVFZWNmc080TWpwRlk5V0dSbjRmazZG?=
 =?utf-8?B?aUJVQ3g1SU5QN0tldGtZMkltNjZYTERXV1V1Q2dKNmNoQWNkbmp6WkxJaEZO?=
 =?utf-8?B?Q1BHS1NFYXcydjJRUG9SRWtIOFBkeTdJUUZ1OFlQWk1BZjgzQVExVGJVa1pC?=
 =?utf-8?B?bmNyOEpGa0dEWGZMcHNqWG5sUEsvdGxuOFpxdzNJNWFIc0RnYW5SQUlyVzl2?=
 =?utf-8?B?SWYySjduNVJqeFliUENrWDlkVEZhZkIyUmtEbEJXV1NweGZRTUd1TisxOVU2?=
 =?utf-8?B?aFM5MHg5TXNNM25BRGs2eEhYQmJzajBqSmZZeXlxa0oxUWl2dkowak9OL0NL?=
 =?utf-8?B?OVJvSk1QNWdNZG9RWi9CSjJFenlycGhRdGwyWmRrVGVmWnVFempiYWFWaFcv?=
 =?utf-8?B?U09mR0VoVGJsaGk1TEVkSE5CZHprbTNsaGd2emttMU5QWDBkNHRjVU9Ubk5J?=
 =?utf-8?B?ZWlaOFhQR0V2cThXV1dUMC81Y0NQZ1NaMW5PMU5YM3lSVlFWRHlhU3JvSTBU?=
 =?utf-8?B?dHlvVnZCUVQ3UmxKeDluekFycU1reGx0WGpmL1hVTFNkd0ZBWTk5ektET2pL?=
 =?utf-8?B?ZzV4c1JhT2N6UjRjeVkrYmdNOXZyYmNpU2lXL2VJSU9BbVNxTXN3OEpLd1lU?=
 =?utf-8?B?Y1FuM3VpZUVvcTB3elVpUWtDMFhXNGc2eTdLM3RKYnNlQ1Uzc2VKQXVGbURU?=
 =?utf-8?B?bmNTZ0s2L3MxVkx6dWo2ajNiQWQwTTMvK0ZKaGVEUkEvWmtRODNLNVBJVU9G?=
 =?utf-8?B?TFRUM1h0NEZwUHV6ci9DakFyRXJtSGhnYlRlOUduVGRYOE54ZDQ5YWp2d0Zw?=
 =?utf-8?B?cGJxVDdqbUpIbVlRNGtXNFJyS0tueHlDcTRzVEV1SjFLcUcrQXdpcUtUQTE0?=
 =?utf-8?B?T2o2L3h1WktNMVU5ZnJZL3g4Y3NkYUNldlVOeWlQd1lUKzBqYnpHaU8zRFBs?=
 =?utf-8?B?WnVjZXQvbDRTYWt2dUU1QnpxNE0vWXJDS0JyOXlXdzA4MjlYWWhqZ0FqeFZX?=
 =?utf-8?B?aVliZUUvVGJPUi9ZOFU4L3hQTU5NRW9qT2pmL3R6RytyTVBMNE5vdGJpUU1q?=
 =?utf-8?B?MjdmdElRK0Y4eVVRN0xkTWFSMUkwM0s5ajRxVHlSdDBjckVCS3Q1eG15MUV3?=
 =?utf-8?B?SjZJRnJNZHNwdnBhUDd2T2dUQmpIaFVySEhaemlqNFpINUFOeitCcXRYMEdX?=
 =?utf-8?B?cXE0b1Z0T2EzbzhlNUIrTFNtZWd5UFNaUWZ4NjFST2kzNnZSZVdMaEo4QUhD?=
 =?utf-8?B?Q3BzR1pSWXg1RzJORUFrUk4zRWJXUUViRVVQaDd5anpHUlpxK1ppZ0Q3UFE1?=
 =?utf-8?B?c1RZZDJaOWdoaTBrSlVZeWdIYXlFV3NhSHVPNUoxK09YTHRHNnovK2Q0Y3RO?=
 =?utf-8?B?cmxQNllXR1J3eEM0ZHRGR1ErYXN5TjJCOXp4ZDhoQktROEhwUWZZVTNvTDRR?=
 =?utf-8?B?d3hXdzJGTEhIVTdmY0xLdWxIeWdNWjNJL0tGVFYvbWdSdnZHcElwSTlXandZ?=
 =?utf-8?Q?jmtjmi6HIq7cEZ6tlSueQAcVn?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0b69a8e6-0082-4786-9c1c-08de31f96395
X-MS-Exchange-CrossTenant-AuthSource: SN7PR12MB8059.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Dec 2025 23:20:32.2740 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qlf3+pOjd6yb2ER39RJQAqits4L9W2NimqRrRyfa+HFLFTCUg40vilYVhbB9M5wXeWBxvnUoCVCLaY+gSoqDZg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5985
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



On 12/2/2025 5:51 PM, Timur Tabi wrote:
> On Tue, 2025-12-02 at 16:23 -0500, Joel Fernandes wrote:
>>
>>
>> On 12/1/2025 6:39 PM, Timur Tabi wrote:
>>>  
>>> +
>>> +    /// See nvkm_falcon_pio_wr - takes a byte array instead of a FalconFirmware
>>> +    fn pio_wr_bytes(
>>> +        &self,
>>> +        bar: &Bar0,
>>> +        img: &[u8],
>>> +        mem_base: u16,
>>> +        target_mem: FalconMem,
>>> +        port: u8,
>>> +        tag: u16
>>> +    ) {
>>> +        let port = usize::from(port);
>>> +
>>> +        match target_mem {
>>> +            FalconMem::ImemSecure | FalconMem::ImemNonSecure => {
>>> +                regs::NV_PFALCON_FALCON_IMEMC::default()
>>> +                    .set_secure(target_mem == FalconMem::ImemSecure)
>>> +                    .set_aincw(true)
>>> +                    .set_offs(mem_base)
>>> +                    .write(bar, &E::ID, port);
>>> +
>>> +                let mut tag = tag;
>>> +                for block in img.chunks(256) {
>>> +                    regs::NV_PFALCON_FALCON_IMEMT::default()
>>> +                        .set_tag(tag)
>>> +                        .write(bar, &E::ID, port);
>>> +                    for word in block.chunks(4) {
>>> +                        let w = u32::from_le_bytes(word.try_into().unwrap());
>>
>> If img.size is not a multiple of 4 bytes, this can panic right?
> 
> I think so.  I just noticed that I used chunks(4) here and chunks_exact(4) in the Dmem loop below. 
> I need to make it consistent.
> 
> chunks(4) will return &[u8; 3] if the buffer is shy one byte.  chunks_exact(4) will simply skip the
> last 3 bytes.
> 
> The problem is that it is an error for these images to not be a multiple of 4.  Such an image is
> just not valid.
> 
> So it's a lot simpler to just reject these misaligned images.  The previous version of this function
> did return a Result, maybe I should put that back.  It just seems wasteful to test for misalignment
> on every pass of the loop.
> 
> What we really need is for from_le_bytes() to be less picky about the slice size.  If I give it
> &[u8; 3], then it should be able to handle that.

Yeah, but I guess whether to pad with zero's or error out when the slice is not
a multiple of 4 is questionable.

> 
>> Even if it is unlikely, unwrap() is quite frowned up due to possibility of
>> panic. I'd recommend something like the following since the function cannot
>> return an error:
>>
>>                         let w = if let Ok(bytes) = word.try_into() {
>>                             u32::from_le_bytes(bytes)
>>                         } else {
>> 			    // can print a warning here too if needed.
>>                             let mut buf = [0u8; 4];
>>                             buf[..word.len()].copy_from_slice(word);
>>                             u32::from_le_bytes(buf)
>>                         };
> 
> Wouldn't it be simpler to use chunks_exact() and then remainder()?  That way, we wouldn't need a
> test inside the loop?

Sure.

> 
>> Btw, I wish we could encode the slice length constraint in the slice type itself
>> (i.e., the slice length ought to be a certain multiple). But I think there's no
>> way to do that without introducing a new type.
> 
> Wouldn't it be a run-time constraint anyway? With the exception of the BootloaderDmemDescV2 write, 
> all of the calls to pio_wr_bytes() have lengths only known at runtime.

I am not sure but I think rust code is expected to not panic and handle
situations gracefully even in the face of runtime constraints being violated,
you could argue that the image length being violated is UB but I don't think
that'd be enough to justify the unwrap(). But perhaps someone from the rust core
team can chime in about that because I also have that question. Can a "FW image
corruption" type of scenarios be considered something that safe rust code not
need to worry about since it falls under the UB umbrella (similar to memory
corruption)?

Thanks.

