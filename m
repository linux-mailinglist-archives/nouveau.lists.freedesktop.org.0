Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CEC9C9D5B6
	for <lists+nouveau@lfdr.de>; Wed, 03 Dec 2025 00:40:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7699A10E44C;
	Tue,  2 Dec 2025 23:40:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="pi5anbAJ";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from SN4PR2101CU001.outbound.protection.outlook.com
 (mail-southcentralusazon11012015.outbound.protection.outlook.com
 [40.93.195.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 582A010E44C
 for <nouveau@lists.freedesktop.org>; Tue,  2 Dec 2025 23:40:53 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Qc11rmw3Et7yT5tk/aiHVP9O3fY9jTBLna6g3Y18DaXQsb75iCdv2JhCmQeicIs9fzs1/Pn9Q+cbbMdPUBY+GAI8pYXhubk6cUqZmqH+koUYSC9StBfZog7ZOHLzNe0Xq6ntz28WdBGAm3UWA3MsB4+a9tgpSzax1zJsAvpcJ3E4PBatYFSr96gEufBZJ45gMVg+ZokWyN0xybEk1ye1LY4HF4WlL/KZITwXhokHw9bSme7w8LC5tMUAmC2aWXv2uqAfsGb65yVHKTVYvwfIoFSUutj28kF+yJElHQvSlJKdENx4gMdllYrCRAwqC5z1z7SzCPWmSjLB9Lk1a6VyRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=961dySnAecUiO3sro8N0GJEvN6bdrNnJ0GMbSqz0dug=;
 b=pw1D4b1Wbq98LTpKt2VXfmi0Cg1iHWjriZPU2OGGwnO/4dziwo24A4DlDXlPBFeNI3Ds4SqTB0BgacWytn7F2mZt7YoddHnUESu/XDhgAYeoNPIYiaU+YGbE1wfJiz7eefd4QJZ6Pk9s39Lduv206qjk3pusyruvsUZm9LBgZ1jXfbeV9hhaA4eUn3IBwiynVKAmD2fGrlz+iFeoXVXp8vSRh23Ebmn8AITW9FOS34WhnqiS0xeP5BZUUzF1NkjEFzRlZo6PjazWags4zPJURvgCjOFHxqcnhRIM7Dn0i4wG2ueH92KfXOkIXUJECfwlZlU5IXPj9fuwVbqxzlwzIg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=961dySnAecUiO3sro8N0GJEvN6bdrNnJ0GMbSqz0dug=;
 b=pi5anbAJHQlhCNv4k6jw/TIDZiy9DwG9iMXCty2OsfFix+8eBoxn0K5hNtemLleb19pA2hvADBo6l8nmrS4brSaW9LbqWOK7LBJrQPHGH2sEHfdb4zsz/K//EMN+srLe6a1ICFcmBsz2SvCKt+9lJUGBuNZXu6v++zLGy9LzNPybFr7c3FX0wnVLOHMJoeZMXTRWq8zNgciUkfukE1Y6vOLkmdceBHL2ZDywUaHjdoh70YtdIL0IZNbi80BOwWa/DVPfvRjxTF7mIAnq30x9Oh9lEcGLkNz/Ybs8sZZXqLre5yy6mCLbMvl6L5EQ7woSPuIdQCcox6siJ3fJCE+XDQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 LV9PR12MB9832.namprd12.prod.outlook.com (2603:10b6:408:2f3::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.9; Tue, 2 Dec
 2025 23:40:51 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%7]) with mapi id 15.20.9366.012; Tue, 2 Dec 2025
 23:40:50 +0000
Message-ID: <df1e24cf-6983-4d17-8652-15adca8281ea@nvidia.com>
Date: Tue, 2 Dec 2025 15:40:46 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 12/13] gpu: nova-core: add PIO support for loading
 firmware images
To: Joel Fernandes <joelagnelf@nvidia.com>, Timur Tabi <ttabi@nvidia.com>,
 "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>,
 "dakr@kernel.org" <dakr@kernel.org>, "lyude@redhat.com" <lyude@redhat.com>,
 Alexandre Courbot <acourbot@nvidia.com>,
 "rust-for-linux@vger.kernel.org" <rust-for-linux@vger.kernel.org>
References: <20251201233922.27218-1-ttabi@nvidia.com>
 <20251201233922.27218-13-ttabi@nvidia.com>
 <581a1e44-e6a7-4ce1-8254-a92392d80cbd@nvidia.com>
 <aba0e260e8a2909c3c66a1aca07574c9192b0dbd.camel@nvidia.com>
 <cec4c58a-cdfa-4bf9-8d0e-7c47d8232697@nvidia.com>
Content-Language: en-US
From: John Hubbard <jhubbard@nvidia.com>
In-Reply-To: <cec4c58a-cdfa-4bf9-8d0e-7c47d8232697@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR03CA0268.namprd03.prod.outlook.com
 (2603:10b6:a03:3a0::33) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|LV9PR12MB9832:EE_
X-MS-Office365-Filtering-Correlation-Id: 0e73d0fb-cc7b-4f42-bdf2-08de31fc39d3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?bFI1Y3pSbHZpTkZhd0p5U0V1QVNYZGJmUk9DeGV5MnhXbEtmYkV5M05MMXEz?=
 =?utf-8?B?V01XYzQzY0tqeDI5bXNPMmYvNzR6QnVrQ3lNbERnQUl2Qkc3VFJaVGZnMGdu?=
 =?utf-8?B?UTJFZEtLK1dyWElBT3pvNjRGNEdndVlUeUNQTjBLYTlxRGNBM2o5SDJONE00?=
 =?utf-8?B?VWJrUFRpSTZxQVZpNFR3Z3MrUXVaNW5RamNPa1hEOXFJbExXTGdTSjNqYllq?=
 =?utf-8?B?bDJPNGxFZDFNRGZ2YmJTQ28xdWRyNlkyT2RqdEhOSmdXSlc2SFVHcThZUklK?=
 =?utf-8?B?ZXUxSlVFQlNjU3IzaDFVZFFLb3N1WURqckFWTG5SZnAyTG9PYWpKWHUrUzdw?=
 =?utf-8?B?QXlGY0trSHZlVTQ4c0pvN1QwbVpWOWZhRHBiUjhwTHNhZWZhRkdVWFJ5emcy?=
 =?utf-8?B?cDMrUWxyaHNOb3NNVTVKMTVaMWEwdEk3UW4xRGw3NmFacVlUdWVoRGRkMGNJ?=
 =?utf-8?B?K0lrL3dHZ0F6WkowRExzcW5RUnY4ai82THV4VER6T2RrenRLQTdieHZTdEc0?=
 =?utf-8?B?TENTd1p6dTlKeEVlRUZpQUZkUDNvNHFxaXlLUHg3T2xtNkR2MTlmOG81WWRa?=
 =?utf-8?B?QzY3MUpocFFudGlFV3J5a1Bhejdlc1h0S2tOUnpEK0xRYzI5c0ZBQmlmd1pS?=
 =?utf-8?B?K0lLbEU3Y0hvVmt1L3dQeUFyVloyZDhmN3FMZDI3UGs3NEc0NkwvbUlMSjhX?=
 =?utf-8?B?bUdiUHpqQmFEa0V3aUdtU0RxQmd6dXlqcnZLVUNGWmpSd1UwZmpVMnVCV2tv?=
 =?utf-8?B?c0ZuT0p1eTl4VC8ySmVYMVR2b241VWRLYTkrdW1QZU9OaTY5WWhwK0NueThn?=
 =?utf-8?B?KzN4N0FiMlVGZ0dzVTdwK2lKeUJ2OE9Tb2VaeTh3ZTBwN2Mxc3RjQXdiOWxm?=
 =?utf-8?B?Z1l6UGNnOWV3WmlNRFIyU1dlbEkrZ3U1Mm4wbTg5ak9jRy9lTmV5WVJtUmlW?=
 =?utf-8?B?NkhjNmdtY253YzV4bW5CWnFXOGZ1VlVUSmJxYThwbmFlLzVOcnR2azEybHpB?=
 =?utf-8?B?YlBMNnhqZXBVWFhFaXIzNlhyRktiNll4SVlkd1plRmJSKzg2bFdmRmRqUnFa?=
 =?utf-8?B?MFY2QXRKeTMvWFdwMHRJTU5lVVUreVZuL1hFVWcyRzZjSk5qbmEwalpHLytI?=
 =?utf-8?B?UU85cHRvRlhEdEYyZVJrSE55Z2NHaFpWYjZLUWhHYithMDFoQVdhYXQ0WmRR?=
 =?utf-8?B?emxoR2VkRUhaZlYrOVQ2dXkrNkRBM3ZscnVVWnA2c3k2bkRvc013ZWVUSFhx?=
 =?utf-8?B?WmJ1anM3MDlYS3BMNk1qZnJnQkJMUXk1T0ZlU1pZK2FGd1pTOTJGNloxQzhu?=
 =?utf-8?B?TTFYZGg5WnA1NGREa2Vrc0JobTJDLzVET1FiYW9JVjFrU0RBTUV6Ym1EeEd5?=
 =?utf-8?B?SnkzU0tSamk2UmkvYjdkTmY3blhNcGhLc0NMcjcvS0pITVR5YlR1OXpuUWJV?=
 =?utf-8?B?M1ptN1ZoWk9wVVoydHppa1Z0alZRNm16V2lRWS9HN0ZsUHNycUJHSitMbTBu?=
 =?utf-8?B?RDRBN0hHYU9HTDExTnJCaXQ0MGpJd0ZkWExYK1dEOHBoMTRSd1JtOVNNTWRS?=
 =?utf-8?B?UGlWZVpoMWsvdXVpeEdiZjdYV1VnNmRSQTdHaFdXVHNDSGFnQ2VxQk1QTnN0?=
 =?utf-8?B?d1VBY1QrRHhjNUFiV1kwcEJuNVh4V3h5dnNmRVlEazRGMkMzZEo5eENpR2FQ?=
 =?utf-8?B?SXJSbFI2VSs5WVR1MTFVbmtzUWNpeXNDZmROQlUzOVRONENGZ3U3QU1YSU5Z?=
 =?utf-8?B?ZHc4ZWZQSnRZMTV6R1UwL25DWEl6QjlBNVpoelhnRERILzAzcnRBNENnbVQv?=
 =?utf-8?B?bkdqd2pUR3kyTUNBMGwxRVAxVUIzMlBIekM3bUlOaUppcDk5R3lmeXVGVzJ1?=
 =?utf-8?B?YUtFUHdRUE9uN2ZRekdhTW9VSmx3SzUrdzlWQnhvZXNGUnFEcG1vZ3NVQjhS?=
 =?utf-8?Q?KvBbAJlK5z1GllbDDpxCtn0h9/YMLKwJ?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM3PR12MB9416.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?c21KbjJLL3NCVjYwTFp2aU1pWmtaNDEwNHlnZmNucUZlSjNsSzBnK2tiWWs5?=
 =?utf-8?B?bGRPZzBpZmgyODJNcVJYVlNTMDVEVXg4NzJ4MTF4YXFFRVhjUVBoZUdhSEQ4?=
 =?utf-8?B?UFJ4bVBmdXpDbHFBdlNQRHR6RlNQUnNsMjEvaXBiTzFwTXFNWHArSGtia2xM?=
 =?utf-8?B?TUNDWjhwSEpmOXNXbzFoNmRWWUs3VlpnWDhnTUswTWFBd0xTS0VNWCtnNUJU?=
 =?utf-8?B?L2kzRjNoSXFKb1UwZnFDRjdJNFRpQjhPQjJxSHdYdUlrNUFTeGl2RmpRSUE5?=
 =?utf-8?B?S0JJeERHRnFsWlNCdmZOcWx2OUh5dVhqNmhURWxYZ0dKYkFzSnZFMjB6Titz?=
 =?utf-8?B?WGFaeUI2U3VCK1pWTHhJZTJCcU1GaW5zYnd4YUIzckJlaU1vcnpYQkptMlhI?=
 =?utf-8?B?U3BiVm02VDBiN1lGQUlRME9remFpOVB6b014cG1uQ241L0RrYTJJdDhpZVlk?=
 =?utf-8?B?eEF0cnl2b0tvaXQ4dlZZSWhON2NYMWR0UUhCQnVVeVlPa05kNTFKMFNtaDE5?=
 =?utf-8?B?ZTdMTVpRTCsxQnJsWUd3Z3ZnMFJTRVArS2tCYjZ6RlJSTmoyOWRCaFlyNnpx?=
 =?utf-8?B?TjNWMFFBclNxa3JQNlJoV2dqZURROUVPYWhqalNyM1ZUKytWTW1jWlBaTTRH?=
 =?utf-8?B?N2hYR29zbVBUVEdROWMvZmxYRHQ4YWt1NTJMVDNVQzY5bHBEampoYURvN21M?=
 =?utf-8?B?b3ViOWNMWDFwb0pNcElicEMyc2E1d2tKaUs0NjUxcGhMbFg5cmZVU25nc3Mw?=
 =?utf-8?B?eU15RHBaZzNYeFJPakkxZVBSdElScDcrR3JxSUNDZXZXbU5XdkVvemwxcCs3?=
 =?utf-8?B?ZE4xdmRzUTJyby94bmdZdmxES05kUlFDV3c2d1NmdnVmcTBMdWJNUWJOeTRk?=
 =?utf-8?B?UXNnbDFiSFZmVzl4ajhqbEVQKzhBdStqdlBzY2JOTk1wY2hRYUo1NlY1Y0Vs?=
 =?utf-8?B?SlFORy9JNzZPdGNFdXVVTGduMnhPZDNkYlF4YTFpaTBOYmh3SVNSQ3hxdGN0?=
 =?utf-8?B?N3JQWHlFYmxXK1FGUnR0WDhlRi8zdGZzMUlmMzIvdjRXVkVqNzJ6T3Z4ZXpQ?=
 =?utf-8?B?dEZLNTE3dGJLTFo2bDBvNSs1QWo2Z3dkUnBJK2RpTS92R29XS0h1ejNzT21P?=
 =?utf-8?B?MUJjVWZvZ2FTcENDSmFzWlUraXVCUDBBYmw2SXc2YnR3RFV4SS84ZnlxdEhR?=
 =?utf-8?B?OGdxNDhvWlowNmMrcjFLUkYrWEdncUNkSlBVbFY3Vkd6bFhYQXlRN0VTNDlp?=
 =?utf-8?B?U0c2c0Y4WWI3MVhoQ2V2d2UzSGpPNmFMNkMyOS90SmI2S3JJQTVtQlRmNGRs?=
 =?utf-8?B?TGd4anUvWXRtcUk4NUNKQVAzejVlSXJxVC9pRVloWExFYXQ2Z1JvTUo1Tmxp?=
 =?utf-8?B?NThYbk9kQ0l3YnBITnUyTEtqVUgrZkwyVlQrcmttSmQ1bG81czhLM3hZYkI1?=
 =?utf-8?B?OTRKeU90bEdTVEpueHBRd1lTb3dEOGd4amdvS1hwMnc1QzNCMjRzYlFQMi9y?=
 =?utf-8?B?SVRnYk1zTHJYZHY1N1MvZ3FKZW5VT01JZCthZnVyYnhGY1ZnWTJGQVRDNFM0?=
 =?utf-8?B?dWJ2akhCdkhDOUlwaDFHSEl2ZVNqUS8zMUxQYUdYZzhHeU1sa0Y5VDJuSTRy?=
 =?utf-8?B?SzFNY04yUkZwOUxrWmZab2kvSW1XdEJ0UGNnM0RIMFV4bDdqYnRodG5xbldu?=
 =?utf-8?B?cmNxUktyS1VFRFBCWXJOWXduTTFsczFHeHhLK3lvc0E3ZnRiL0NCSGY4LytS?=
 =?utf-8?B?ZUdqRWhBZHVjQkVVdVZzeHdtS2ZRTWZoZXdjUXFVWTRaUUM3a3M1RXJYN2p0?=
 =?utf-8?B?NXdzNFM4Qzl5SHZYZEdoZnpzU0YwV3VOVHJaT0ZBVThDVjFrZWhINVlORktV?=
 =?utf-8?B?emFRMWQ1VjlLaEwwM0ZYUy9EUStTNkk0ejZOMk5BWGlVemdrdjlxZ1dOUFhO?=
 =?utf-8?B?eUdKbTdUTUdHbnB0V2o2cEpXeFNWRlFWdXo2eUhRNUlZbVBzTnRQVmVQSmtj?=
 =?utf-8?B?eGJnNUFKaEloUXVoNlZXTVMySE9kNmI3MDllbzdNT3AybHFKdmhMbDlKZ0dH?=
 =?utf-8?B?SG5wRGZtRDZ0a1g3aUloa2ZXSjBGUHlEUmZQNmVEOWJHdXB4U3MrZkIwWXhG?=
 =?utf-8?Q?oNpsi1j/QkXiX7I8GNXq7dAII?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0e73d0fb-cc7b-4f42-bdf2-08de31fc39d3
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Dec 2025 23:40:50.6787 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RkhtSaUJttgBlnGSmXAytkDMkKlwkdneXn7jXUCP1nK5qVxmJO4x+yzQ9h8/SXhWhBSi25Y/QkQStbfXHt/Yxw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV9PR12MB9832
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

On 12/2/25 3:20 PM, Joel Fernandes wrote:
> On 12/2/2025 5:51 PM, Timur Tabi wrote:
>> On Tue, 2025-12-02 at 16:23 -0500, Joel Fernandes wrote:
...
>>> If img.size is not a multiple of 4 bytes, this can panic right?

Rust for Linux avoids .unwrap() for similar reasons that we prefer WARN*()
over BUG*() these days, on the C side: avoid killing the machine if at
all possible. Because it changes a routine bug into a harder-to-work-with
bug.

...
>> Wouldn't it be a run-time constraint anyway? With the exception of the BootloaderDmemDescV2 write, 
>> all of the calls to pio_wr_bytes() have lengths only known at runtime.
> 
> I am not sure but I think rust code is expected to not panic and handle
> situations gracefully even in the face of runtime constraints being violated,
> you could argue that the image length being violated is UB but I don't think
> that'd be enough to justify the unwrap(). But perhaps someone from the rust core

Agreed. This situation should return an -EINVAL Result, approximately.

In fact, I just finished looking through my Hopper/Blackwell PIO code, which
also needs 4-byte alignment, and concluded that returning -EINVAL for misaligned
data seems to be the appropriate way to handle things.


> team can chime in about that because I also have that question. Can a "FW image
> corruption" type of scenarios be considered something that safe rust code not
> need to worry about since it falls under the UB umbrella (similar to memory
> corruption)?
> 

I'm not the core Rust team, but I will chime in anyway: misaligned or
corrupted firmware should not *directly* cause a panic. We should detect
and error out.

thanks,
-- 
John Hubbard

