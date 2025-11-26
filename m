Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D7964C8797A
	for <lists+nouveau@lfdr.de>; Wed, 26 Nov 2025 01:31:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B570510E062;
	Wed, 26 Nov 2025 00:31:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="XRwmY2oy";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from SA9PR02CU001.outbound.protection.outlook.com
 (mail-southcentralusazon11013053.outbound.protection.outlook.com
 [40.93.196.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF9C010E062
 for <nouveau@lists.freedesktop.org>; Wed, 26 Nov 2025 00:31:20 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FEmY2TmLccDJs3SHRNuYOchQFQqefYoEzV5UyO9ytvq7KSBM7TffccgG0Z+ksPxc71wqZAgCEMR7qsIJhQHhRZe/Ay9XULLNuQ/BO+aQM5YlhjIGiIv9EVov2AigYpYRN5t8cYFEbv5K92xIYQoWbCWAy6XLv9bz65lomzPRtzVpfpHhlrufSbhBvgNjKxNrxhH4VD3NqQwLlbYFCCraQW49u7UT9JM/Ewj6eejuRgQwhgwAJP8zx/MWqudOcLeUwi/8fS08WI7C0zBWqGiExe5A35RrPzYg3fA8gwu8J4rH/lwaOdNFx0xBC5qmhyu0rIYNQVwErXa/VqxNcChtOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uDrlWYzq0KilS+0ePCJbYFhT4Hc8IurpF3oMySpEUw4=;
 b=vNbm0EBsTDj8Jv+tsNhqYZGYE6TheQz4tMmVFOdJdQPcX0Z06QqLsrvOF5mEpvq8TQroTTkGCh2cwqtCH8/fdZVtxbPo7mUnxbnreDr5XvllDl6uoiydwg6MI2fF4UzgOaARdMHEbjz9rNhmoz1spBDaUa8VLQaD4uj6QnIDF9a9NQBTptS59eoOSzzx7tMuwnIzu4NQDGvTJtEvPH2W/zSq0LJ+accDolpfBxvHmpVYMnkN7DMQZC1PrUzccsRH46q0WlktUHlsFhNX0P61hwjTDYkWyOuTSEVpQ+gYVe+3gUBUBlhjtxgJ2FnUcSqBXLoftVHnXIZ3YxsXBRvpOA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uDrlWYzq0KilS+0ePCJbYFhT4Hc8IurpF3oMySpEUw4=;
 b=XRwmY2oyC26hfOvJ/erAY3AyfqzsWelCFplgDbWrga6Y/t+NRVprqehlsDxzPs3B9zIRYrvVoHIluzodP0FrqzocJY8CkLgl/zV9m/VuRilavdpIYZMlS0qwvNwttXV45xrUsh9TpBqsrzpC8hpoz8douRRReCWCjj8klGQLLf0c/6Lc2GdyGXEY2VgEkht7NfenZB7a5oAzX/ThEVyIxfSWJwKY99ug7MdK5iRe+7v9A5/BhRYg3hcJUmfJ9wxioFUDvSRWIqGJ01WreiUe6AMs5h2yaPcfsbCqmNVD0bUUGcPAQh9Jv1WUP2VBqFpZB/ZbwyrBuTolNBqr6K4zaw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 IA0PR12MB8350.namprd12.prod.outlook.com (2603:10b6:208:40d::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.12; Wed, 26 Nov
 2025 00:31:13 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%7]) with mapi id 15.20.9343.016; Wed, 26 Nov 2025
 00:31:13 +0000
Message-ID: <054d9c84-4231-4662-8847-4028228cd290@nvidia.com>
Date: Tue, 25 Nov 2025 16:31:06 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 09/11] gpu: nova-core: add FalconUCodeDescV2 support
To: Timur Tabi <ttabi@nvidia.com>, Joel Fernandes <joelagnelf@nvidia.com>
Cc: "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>,
 Alexandre Courbot <acourbot@nvidia.com>, "dakr@kernel.org"
 <dakr@kernel.org>, "lyude@redhat.com" <lyude@redhat.com>,
 "rust-for-linux@vger.kernel.org" <rust-for-linux@vger.kernel.org>
References: <20251114233045.2512853-1-ttabi@nvidia.com>
 <20251114233045.2512853-10-ttabi@nvidia.com>
 <20251117231028.GA1095236@joelbox2>
 <0808b509a969458003accdc3be7c262500b305f7.camel@nvidia.com>
Content-Language: en-US
From: John Hubbard <jhubbard@nvidia.com>
In-Reply-To: <0808b509a969458003accdc3be7c262500b305f7.camel@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR13CA0171.namprd13.prod.outlook.com
 (2603:10b6:a03:2c7::26) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|IA0PR12MB8350:EE_
X-MS-Office365-Filtering-Correlation-Id: 9415d52a-9757-41c3-9e4c-08de2c831a77
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?UVJGZnpESmhvTWV4LzBtb21nWHorR01ubDJUWFZEVDNPMVBzNW10OHA5cGtu?=
 =?utf-8?B?eFdFdVFnTUs4QXFEZzQ5MzA0enpFOXFYYXRKSFd4c3hZNjRnWDRBTkNuUmN4?=
 =?utf-8?B?U0NETUhaVy9BL2xOVStleFE1YzJXK29QNnR5b2FCU3BtcThIQ1lDUWM3bmNN?=
 =?utf-8?B?bWFNbm0zWW5vbXpEbGJYbkR2bEpMcUNGbjMzTmt5RGprVkd4OEVnMjU4V1Zq?=
 =?utf-8?B?bDZPNHNrNSt0bzNPbVJFKy8yZjRVd2NWbFRSVk9ReFpDZmUvRFhmc0dPZ1pv?=
 =?utf-8?B?ckdhYmN4ejZQZlBONFI2TUFiNHZsR0haZTdkUzAwcDNaTlpMZ2VzZklVeSsy?=
 =?utf-8?B?eDZVdmcySldyR0pUQlNNMFpKdm56UGlvdE1SSDdWU1I5d0RDT0JEQ1IxeCtT?=
 =?utf-8?B?Yyt4NTNVZDlQRGV4RGtORUZ3a1JBZmFQZlhEWmZYT1NBbndmKzF0R0o3MXZB?=
 =?utf-8?B?VEFLWXY2OG5mamkrVjZWMnhsOGY2MnFJU3J4b01mcW9nWUlGb1BCVERQLzgr?=
 =?utf-8?B?TWlVK3NQRW5sbkxNNVViMy9lb0JJbWRZRkFmUGZuaVRycmVlS0RmNFBtK0hp?=
 =?utf-8?B?Ty94TzJSc1BOMHpZc2o1bkluWmUyWng1NC9TR3UwYUsvcEV1SFNaZkttUDJp?=
 =?utf-8?B?UDduT09QWkp1MnVCaUtOODI4aDRLNi9MR2xFdFFJRkZ0eGVQUUc4bGg5VEMv?=
 =?utf-8?B?bFpEWHk4NWJDbTN3aVFSN1lOQTI2THNaZ0RsNnBGVmRlTTJOd1BDYU1zOEFK?=
 =?utf-8?B?WDFaWnJVYmxaemxtbmsxWEVrUVRkRlkzcTEwS0xjRXNsamhCUWpIZnpzTDcx?=
 =?utf-8?B?VHJsTUZNU0RoeGRYTG0yY25vNlJPejl1SUQ5cWh5RytLNjBCdmM3Q2VLNEEy?=
 =?utf-8?B?eURmZnVld0t4WitHUHhiV3JvQ0tBbkJsNWEwQkw5MkdjZ0x1RWxSSDBEeUNN?=
 =?utf-8?B?aG5ySGJmUVhJaVJVdG1YQ2dlcmV2VVdTaGZ2UEliNEtEZDFIVkhUL25aRTIr?=
 =?utf-8?B?V0JyaEc4YThOMnRNdUl6TWU5R2VDTk9ybW5GTlFwdlZLeEJGQ294Tjd4YnNt?=
 =?utf-8?B?VUpabG9RbFZKSFhSVEVtb3V1Ynk5Vk5MZ0t6RlhIQXk4Zk9yRXhpemhEcURW?=
 =?utf-8?B?UE9zMnI4dmZOK0Y5OGhNYjdxTGJneEg4OVRHMU9jSXkybXd3UWRwTVBjWjl5?=
 =?utf-8?B?dFE0RmlBNTN3eHdHTnduc2VRbWcrTEN6M0FEK1dRWWg4KzZoNTFrZHd2a3dE?=
 =?utf-8?B?aFIydzRqb0Y4NTArQkthNURsL2ZUSVduWUhaOWZGZGVwSy9lUlRTWEtaRnhL?=
 =?utf-8?B?YnNGdCttaG5pN3dCclNuUVk5VXNmR1c2UWVORVRGby9mN0ZsbmpKYU1uL2JM?=
 =?utf-8?B?TG1RR2x4Y1d4cCs1TEFWdDhFMnh6S29YS0hhWEZlVi9rR2VCM2U2UnlRZURS?=
 =?utf-8?B?S3paWUdhb3J2T2M2Sk5hZHJJOXpSK0R6WEZrRnZkVm1KVUFMeHh2SHEyMVRX?=
 =?utf-8?B?UGlLNXBaenB6bTE4TzVNVmdYVGN2WENUcU90MnppTXY3RjhrbU1LLzBxOWVu?=
 =?utf-8?B?bG9NQTgrV1o4d0tGY3Qwa25mUWpzRXVVbU9NaVB3cnRRSnkwa1l1dHgycWw5?=
 =?utf-8?B?SEJjSk5Jb1lRUUswTEpURTMrd1l3VXQvNjlKczlBZ1ZpVnZORTFqek4rK1hO?=
 =?utf-8?B?Mlp3alN3OUJhWnI1OWlSTkliMjkwQ3dXdzI5M0UzcVNnM3pxbXc0QVpQVzEw?=
 =?utf-8?B?RXNRNkRGRFIwTnUxSmdzRHg1RzFqZWxLNXRPaGJtL2JPb1V4SDZpTVArYWlW?=
 =?utf-8?B?b2VFZGp0RzA3bGc3aUdDejdiN1RTazU0dm5WemVJZWhlemZEY2FWR2hkNU5E?=
 =?utf-8?B?bHUwMlRhbmpBS0Z2TG1XdDA0V2krcHRFU0pObkVCUGdWeUZCTVBhMU9OMEdn?=
 =?utf-8?Q?zETW/p8+5YNw3izJ3R+SP52WVHgOAidZ?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM3PR12MB9416.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?N2lyZlZ4cy9PM045K0pDYnMwb2lheXpRczZsdE9KN0xTaGhQUlFtcVNicHht?=
 =?utf-8?B?RGM2aTkxY2QrckY4eEs4cGUrUGdXaWs0dE1Uakg4eGxnRVFqaHlHb29yNnN6?=
 =?utf-8?B?eTlJRUE1Y25PT0ZldjdwdnRUbDZZSkZFZDBTWXk0SU5LbHY3U3JkMWlNbXov?=
 =?utf-8?B?V1BEUmlYY1JqU25rMVRtdExGRDFoY1YrbFhUQmNyQ09OMGIyS0xaVzJicTJo?=
 =?utf-8?B?cUtkVlgzenl0TitFa0hmVGhoc2lNQVl6bnpMcTJ1NGhlVTVYOUJLSEF3UWVG?=
 =?utf-8?B?c0ZoVEV1cnBJVkE5anFZelhXbzdQcFV4WWRkUlJ4SnNnS1UrOUhFb05wVlZP?=
 =?utf-8?B?YStPRUhUd25xWmRLejBRalp3NlBOYzVwdDJ2eDdhNDRubkJac1JYZFEvY0Fz?=
 =?utf-8?B?bkFTWUZlVk5vRi91b2ozZEpFMVdwZkpiL3BPbDZuSzVIalF6bEtzd2Nmc0pH?=
 =?utf-8?B?OE8xRmxrMXRvUk1lQytLK2plNmM1VUNQNDhkUmJqNENyaXgzRGxnNE9NUGxY?=
 =?utf-8?B?TWJWQzNZN2JMMkNGYUxwZU9RaHAxR003bGhkUmlqT3N2TkkxZkVYSlhaNFB2?=
 =?utf-8?B?QkpNTmc1REVCNGhNSXBXck5VcEpuWFVzS1BOTnFBenZnc0pnR2F4b3hpZHdV?=
 =?utf-8?B?WVUzTnlQUjNaeGZNWFlwMnduNkwrdFdnL255T1o2NytDTFh2eXN6OS82TDla?=
 =?utf-8?B?cnlFUERveW9rUENoTzBNNUZIZG5CY0JrVzNRVXNRVlRmeGtEV3VwaVlnU1lX?=
 =?utf-8?B?YXcwMTRTcmh1SFVzdW5lMXFpNmszN1lYZDZIMXZPSkYyOW8vM0U1TlVRNElG?=
 =?utf-8?B?dTk0bjB5cW1DVndVN0JCNEpIb09jNXJlazNPM0VVRmZ0bHNOVTJWd3kxaFRQ?=
 =?utf-8?B?VW0wRWdzOVpDbnJJSWRJQmlUWlpobGF6cTF6cFQ0VUp1SXJqMTFzL2ZXa09V?=
 =?utf-8?B?Zm1BalFrclkzNWh1ZnR5bXZ2SUh1U1Fudmplbk4vaWEyYnFzM0tuWlVEUHJ3?=
 =?utf-8?B?Z3BDUFZKYWhZSFJVak5HOHJGcmdUVGc1c092MlozenlHS1l1YitSK1psM0ph?=
 =?utf-8?B?NVlVN0xCNlRmQ0FDK2ZuaFB0MmR3NjVzd05JSWxoNWhOSUMzbzloSlpFNTFU?=
 =?utf-8?B?SWZFQks2dGZESk5PM3F3TXRGR2diZkMvTEhaeU5yRlg2RXhEVHRsZFBPRzkr?=
 =?utf-8?B?M3BqdnFIMlpHVTNsZkpCVWFzSzN3cEhOaHZBL0dnNkFiVGpzQmNDcU9VODA1?=
 =?utf-8?B?QlNHWldzQWJkakU3R3YrYWFHV1QwZ2xxUG1zN2lUUC83MXVtRDd2c0VoTG1X?=
 =?utf-8?B?QUM3dzIzRmpvSng5bjMxdlBvazFMR053d2psM2ROa041TWQyOERySytWSy9S?=
 =?utf-8?B?aWpZcHhXS2tsc1ZzalB2TFYzb240Smx2MnNHdlZDRWxPTGpha0dpYndwODhU?=
 =?utf-8?B?d0ZwWExyYU1MRUFzeEhZMmgvOGlNMk1mR2dhMHYxSCs4c1VKZzhCdW4yUHBz?=
 =?utf-8?B?VjluY0t3bUdmak9JVkw3MXkvdFNYdUZFQ2dVb29MT0VyWlJTK0t6SFJpUnNG?=
 =?utf-8?B?MzkrZFEyQWt5akN2ZEwvUVpQMHNYaTNvNEdoK1BUdlV5c1ArK3lRZ0NMNmc1?=
 =?utf-8?B?TjN4SWRjcW0raEdwL2RVNVhlRmxMbVdjeXlaeExVNVZqK3ZScDU3Qmx6VVly?=
 =?utf-8?B?MzF4KzlLTnA0N1AwMjhBWXRUK1MvVHdVVzlKYlhDbDZmdXZPMXo3UHpMUVlr?=
 =?utf-8?B?UGdZZXJFM1NyYms4Z05ESVNDUXhYcUZDZTVYT1JYQ3pTUGRHUjhpRUY2ZnBK?=
 =?utf-8?B?SGFDVFRXUk4zbC9zRHBSdWpvNUcxenVFYzJ2Wk1HcGNGeUZqMXlDUzJ3Tkxa?=
 =?utf-8?B?UmZOV3htaVVoSU9uUWJXcjNlL2NUWnIxbHFGeFZsU2ppYjArOFBVN1NDWFJV?=
 =?utf-8?B?NlJsQm4rdE5DUUM1Mk1UYWRvM1VYVHo4cnVrTzV2YmRJeEdDUE9iTmdtNVVn?=
 =?utf-8?B?MURlRDNubzRqWmVobVN4dmd1V3RuVHYreVhHVVMrTFpXNCt1KzZLeXQzMnVo?=
 =?utf-8?B?YlVscXFlVE5MVVp2ZHBBYzVDbWhPUlRVZy9xeU5iQTZ1RWhQWGs1NGw5T3U0?=
 =?utf-8?Q?J7Hdm2sx+9Hnz5+FFQbneUaQt?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9415d52a-9757-41c3-9e4c-08de2c831a77
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Nov 2025 00:31:13.1717 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QMUXU7LkLPUoSqk0LDu8d1sPlmpkK1zwDFyO2YHK5YNXKfLmnhlqE+NkoOnbAdHL9QexdO7gZf72t207jVxEXQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB8350
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

On 11/25/25 3:59 PM, Timur Tabi wrote:
> On Mon, 2025-11-17 at 18:10 -0500, Joel Fernandes wrote:
>> // First define trait
>> pub(crate) trait FalconUCodeDescriptor {
>>     fn imem_load_size(&self) -> u32;
>>     fn dmem_load_size(&self) -> u32;
>>     fn engine_id_mask(&self) -> u16; // V3-only field, V2 returns 0
>>     ...
>> }
> 
> Isn't it more idiomatic for engine_id_mask() (and any other field that exists only on one version)
> to return an Option<u16>?

I don't know about idiomatic-ness here, but we have been trying hard
to avoid Option in fields. It really makes a mess of things.

Other approaches require less special casing, we've found.


thanks,
-- 
John Hubbard

