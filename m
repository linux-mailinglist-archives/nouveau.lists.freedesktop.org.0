Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AA86C66CEA
	for <lists+nouveau@lfdr.de>; Tue, 18 Nov 2025 02:13:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 640EE10E40A;
	Tue, 18 Nov 2025 01:13:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="c81UTTT6";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from MW6PR02CU001.outbound.protection.outlook.com
 (mail-westus2azon11012001.outbound.protection.outlook.com [52.101.48.1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 59EC310E12A
 for <nouveau@lists.freedesktop.org>; Tue, 18 Nov 2025 01:13:18 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=y0ZaYzdm9xLi2GWrzt9QU9BslFdDgldZ+qVQxauD2xj3NZuoE2DBzN4De2jO2NOOG1atMOVvkrbphS2Z0mBpEmpW/wo+mao/MKPAvJX2CnP8dxw0VfvhnaMhaZ/OrhKw2owceiF94tiJAOVcFQFrwG6EUQukgVtKgvuKHZO/Zqvr4wOa3YqAo1e1wiEdk0jmCi79VFVQYMbq8giuNw85u/sPR4CKqemyEgsh7PgLanEqd3sJGGTRdWx6GItlsp3oBIWliu5R9PShubgvUR+AkHAI/KNqDH4WOH2ZON29nMc/Mwik26UUak5pJXf5y9RkvWDu0m8bB/GTHr+8IbycUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=I4seHB1ilEyJ8iQj9pplM5yJ2VwPXKC5u/xBgon6jzI=;
 b=QV7JQn2udkaQflaV8/IY5BX6phJQ5jbLp5ehtNRVrDqGb0NUD5DahhgXQ7Gh/XvQTkP4hsDy7cEsQXK/nPVje3L7DBN6YO79J1bPmjXYLWmd1c+pN3SIGlzpnWFZ5oAp4iSXNP3NXVpPtNUUyVbOLNQcUT8B6Qt7LewvcpbgtGWuMPhWtr6xbwxgobpsOROMnQIbZIZlLu8+wssULwdEy4tKr1Ezt1/jPtcbuJCtqlUl7aBW5Y8cYcXij8tAq0y9wdb7/Ka1bKf3PsqN3EL8oCDcWdUBxzRaVQSVEE7tGVZWAJbf25AKMTK0hiWAM3Xp+0CTDmhdaV83kqf2sA3P9A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=I4seHB1ilEyJ8iQj9pplM5yJ2VwPXKC5u/xBgon6jzI=;
 b=c81UTTT6z8pQu/HvWScRk3K6e8adheb4ZghxKOGH6R+fVnPjTwol5em0cetlvRszvNT0nSUhq6cBHu4ugjJHdBY4PnYcCuZMJMgkUSYKSI9DOUlMdnEp5wxwQdgOJMBLu414gTa2iqUAYrvg/jUTeMdqFDoBuRfKpOKw4lqwlt0nLNy4IX62/5K90Nu/A9CG+YQmQHfBBpIMRv3QBVsWchKVCC/luX3O75qn7cRLHQF5E8BOVsPrh2Kt1/+g7I2+Q2rzbRN3+mtU2ZtLMUKlUIpMOoIhteSRtuBcRLMIFoqwePhG+iTPf+uK6iQPkvL9Q7/Wy38XumCIwnKvGQGF5g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 PH8PR12MB7157.namprd12.prod.outlook.com (2603:10b6:510:22b::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9320.15; Tue, 18 Nov 2025 01:13:16 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::d622:b3e9:bfe1:26bb]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::d622:b3e9:bfe1:26bb%7]) with mapi id 15.20.9320.021; Tue, 18 Nov 2025
 01:13:16 +0000
Message-ID: <5ff4c334-6f36-4aaf-8f6b-45650b8f7a32@nvidia.com>
Date: Mon, 17 Nov 2025 17:12:48 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 03/11] gpu: nova-core: support header parsing on
 Turing/GA100
To: Joel Fernandes <joelagnelf@nvidia.com>, Timur Tabi <ttabi@nvidia.com>
Cc: "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>,
 Alexandre Courbot <acourbot@nvidia.com>, "dakr@kernel.org"
 <dakr@kernel.org>, "lyude@redhat.com" <lyude@redhat.com>,
 "rust-for-linux@vger.kernel.org" <rust-for-linux@vger.kernel.org>
References: <20251114233045.2512853-1-ttabi@nvidia.com>
 <20251114233045.2512853-4-ttabi@nvidia.com>
 <20251117223324.GA1094429@joelbox2>
 <57b542d736e22d1bce7143b789e0760c9380aaa3.camel@nvidia.com>
 <20251118010424.GA1131446@joelbox2>
Content-Language: en-US
From: John Hubbard <jhubbard@nvidia.com>
In-Reply-To: <20251118010424.GA1131446@joelbox2>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR05CA0168.namprd05.prod.outlook.com
 (2603:10b6:a03:339::23) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|PH8PR12MB7157:EE_
X-MS-Office365-Filtering-Correlation-Id: 9f227091-e230-4f94-bde0-08de263fa6ee
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?MFMyZ1ZJdWlydzBJL0doM2hsM2l1Y2tTcXJWcG1mNU52YUJYVGJ0RSsyZTdW?=
 =?utf-8?B?aDgvUVl3UW5QaXI2R0V2TjZXcmdFNzdMQWwzT3FEeW02QXltdDZNbHZuWUlw?=
 =?utf-8?B?bXZwVmVUYy9jVEY3aVRaUE4wYlBxZUF6dURSZlFvTW51UDM4TlNxdC81bzYz?=
 =?utf-8?B?Q1R4WC91ODYyOG1aZUdGK1kvcm5wUG5la0hnbHI3dE1rYmpGeXRGNkcwTGs1?=
 =?utf-8?B?dVZYNGZmZE9qeThBV0s0TXFDWHRDbHhGWkFQczRneG5nS3M4Z0tmSTdMNEQ0?=
 =?utf-8?B?UUVzMDdVR3pxb3RYZGpJNWdKVjROeDdaTVNHRVhwZ3NNNis3K2tPSXV3QllI?=
 =?utf-8?B?RmZQV2llL3ZZR0pzdnRINXlKaXF2UVQ4alpjekZNTDNQRlR4eHdteTRLNXI1?=
 =?utf-8?B?d0ZGR1l3OUg1Y1orYVIvVUlqQU9sWGdsc0pRWW1zUnFGUkRqQTRnMVJQUEll?=
 =?utf-8?B?akdsYWZvaXMvRXZwUXNCeUNYTXZORWJoSElGRlBRWEFINXFLNnRPYTBoL0RF?=
 =?utf-8?B?aElveGtmZXE4eUNQS01xM1ZVejV2cG5KNDN3aFZrL1JJNGtFdWVsbEo4MXVi?=
 =?utf-8?B?QUhtdENrZVl2MzlvZnpjT1QxZEplV014RzQ0NkdHTVF3OFg4VVMraWpSWk1P?=
 =?utf-8?B?a1Y0T2lKVVhTSHN0cHNnbTM4Vm1iWjdzUCtPVnQ5U2RpYkN4UXF0SkdUOHJy?=
 =?utf-8?B?aXlEOE5sWSthZkNYMnY2L0NhNTV1SnplOVVaajJ2STVtRkNHUVkyWFNUQmhP?=
 =?utf-8?B?alpFY2tma25vdzFrVFNqSFdESUhqL2lKcGlMdStpdy8vZ3FNMDk0VDgxQmw5?=
 =?utf-8?B?a3doK2QraFJUZlZzaFR3bkVEREFWUW93N3F1eElHVEFXcGlTZkJ2MmNONzE4?=
 =?utf-8?B?Yys0Y0Q1dktjTlBaUFJGVnVDT2N4R2o2SUx0em0rYlZScDBzQmp2N0ZMdGtD?=
 =?utf-8?B?VjNUMkhCckpFamk0RWJCcXNNQU1wNFhWQktNVzJSMjRUMDB5bHYyMFZUWVF6?=
 =?utf-8?B?STgxbVZHZVNKUXB3MmxJOHdWUFYwMWtMMFBRWndPL0FLeUFpVTZLSnJnKzhv?=
 =?utf-8?B?ZTlkeFkzbnRITGNST3Y5cjhRV0ZrdHJGcW5hbm4wTzFRRjdYR0JhNzNYYUk0?=
 =?utf-8?B?V2YvdE9NQzVTLzhxR2VrcVhmcG5ueitHMHc4WmE0RXB0T1l0cUFXOFhkTndI?=
 =?utf-8?B?TGNZeGhjNHViR2FuNUpGbGtuVjdBUHJXOHRINSt5RE9HVHlIR0NHWlpvSTdx?=
 =?utf-8?B?cVRVQTZXRGZjcjFQT2RabW9Za3R1bFhZb21XazUxTFB5eEhNOWtGdWs0ck9G?=
 =?utf-8?B?YnlkdXdYWmk0Zmo2cmpUNUhkcTF3aGhIbnZiSWczVmtCR0dkN29COVp6M2JD?=
 =?utf-8?B?N3ZDVU83OXVFOVVxekJaa1ZnVkdxTG1oNUYrZmZlaFhyZy8rUFIvdmQyMHds?=
 =?utf-8?B?bGRzemxxZzNWRWNZWEVaSDVYaDRWTGJNbTI3NTltK2ZBcFovbGhNdTQzc0hD?=
 =?utf-8?B?bWI3Y0lOU09NcUk0RmJodmxNU0RjSDd2MVdPZWpmWmFWMXB2eFlmMlhQNE1t?=
 =?utf-8?B?UHlFbldTNnJSRmdtU0FYV05MbG5KbEc3RTlhSGtuWXBLVG15TVMrNnB4dDdz?=
 =?utf-8?B?Y3BzM0RxRk1XUmx4SzRQK2RuUlQwd2FydVMrMGxWalJSbDYvcEdFTDEzQ1Q0?=
 =?utf-8?B?WHBoaDJUeVJLVmZFVTV2TlFvaEVMM1FvbFQvNjd6YU12UGVpb0I5RkVSN2Iy?=
 =?utf-8?B?bzVmVWFKUFprYzA0V1ZwbHovU3ppeU1ZMnhpd04wR2o4TUFkTzF1V2ZPeEF5?=
 =?utf-8?B?SmJsM0ZGUWlqK1Zydm53WEpFcUl3NHRubXdOV1AzZTB2c2RUUlB5YjVhYllt?=
 =?utf-8?B?RkVMaWpLSEhUWjNmaytVSmlHTzJKSS9rcFN2YXhYUzNtajdZSDFodGhlMHFS?=
 =?utf-8?Q?cQrYmeD0NG4MnZuwpKoarg7q1cPF+Gto?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM3PR12MB9416.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZnBxRkY2Y0kwb3pvaXROTllETS9oVEIweExRYjdEaXJvZE8raGt4UHNuS3Ft?=
 =?utf-8?B?R3ZyYUZLNElhTHN5ZkRmdUEzeUZqWnAycUFOanl2SW8wVkptRU9aS3FRV2xS?=
 =?utf-8?B?dTgzZXE3YmMvQWVjcFVWL3NsMXNHZ2dmVVdhSDBJREVmY2g5cTNUamZMdldv?=
 =?utf-8?B?K2UycnNJYkVIUVZzTGF2dXZuNlZneDMrWmgyT29hTlJHOTR2MFdLWFFabENR?=
 =?utf-8?B?VmJvczZPVXAvdjIyZ3hZTHNLektJTE8zVFRSUEVZaWdGLzJrb2lTV29vNVhV?=
 =?utf-8?B?Rnl6MnVqOEJlTkxxN0VrNlN5cUVKM3N4aTJISldMeS9CTzZpMmVqOWhlYWdM?=
 =?utf-8?B?Um52UDBSVUY1eXRVMWxNL1BJSXZsME5EUkxDWmlQUzBhaWVWek5oSGNLR1VI?=
 =?utf-8?B?MUp4aVpNdzNTeGh3Qmd4WFFZQ0NWNTNDaXg2SXQvNlN0dzVzRmZ0QkZDRWFn?=
 =?utf-8?B?dWZhSlQ2dUUrRGJXSGM4QXArSzI1Q0VHOUdSazhJTGhuUVRiRzd3MzVlZlBN?=
 =?utf-8?B?S3NQUVU0dkthWXZHTXQ4SW1UMHZCT1puc3pTanVKZGEvbVA1YXRRRmk0ZWp3?=
 =?utf-8?B?MThub214M2FLMHF1ZGJyYU5zOXpobUxHNU1RUkJhZ2hMQWJHUXJnRHh5cXhB?=
 =?utf-8?B?NzNDUWhjNEJOUHMrQUVLM0lvNzVEVXkrUUpYR0MydlFaQmQ2cEZFQ0Y1YUtU?=
 =?utf-8?B?aHNsUkF1Y1lUMU1nSTJaNmRaMDhxY2hkTzNpRDkrTlhiSGt0R3ZqY21WdHhU?=
 =?utf-8?B?Q1cxVy8xUEVzSUJGSjBQMDhvcUxSUUFBMXJQL3MrR1FLRHZTaGUxTGdEay9p?=
 =?utf-8?B?VkM2TWl5N0daSjZmK2pPT2pWUm1LRlUrclpYQ1VLdTJTdUxjMUVUa0xDSHl5?=
 =?utf-8?B?YitjbEsyWkUwdi9vKzF6UmRiaWJPTForVDJhazRhUlFhVzc4V2JMM0Q2Y3M3?=
 =?utf-8?B?YnZydjE3cC90Y1RCM0Z6TUtYK3FacGEwWTdCcEdJVC8vMk41Qm8yM1JHTkh4?=
 =?utf-8?B?OHlZWnYxUUJ4ZjJ2RXlmSzlIM0IyeHZJUkxYUzcrYzYyZUhHN1NOZGtRYnIx?=
 =?utf-8?B?WXR2bStnajZkaElnUjF5Q0hQSnZuUUhic010SlE3QzQ5cjcyVW8wZDlMQlgv?=
 =?utf-8?B?S1hZTGNYU015emROUFJXNDRZazZLZFJBRTBhWDYvRjdsZEdUYk9WOWoxMGZk?=
 =?utf-8?B?cW8xMFhmeVUySXNWekhKSmJpSEhLTExFQkJyQkU5MEMybUNkSkh6ZWpmc0ll?=
 =?utf-8?B?dnI4Uk8wL2o4R0w2Mjd3RWVDTm4yQ3pPWHFQYU9tWWxZeUR3Z08rRXRScHda?=
 =?utf-8?B?ZjBPNW4yWW9ib1g5NWtodzhpbUtKSnNVWnRRd2UzTjlkdE9GVlJTaTZCNGV1?=
 =?utf-8?B?VHJaVUsyZFIyNFBQbUVuM2xKQlJCOEZDQWx3QmRUdDBmMEdpSXJZckc5eWY1?=
 =?utf-8?B?QVp2b2psYnIzaW9DVEhFUUxDMDJMNzNWbDdidlZEQ0FqMk4vZTVWVVJRTi9F?=
 =?utf-8?B?YWFzTnVoTFZMQU1uTkF5UEMxVGU0L3paZC95YkhsYktTdmh1ZFNsU3k4SEJE?=
 =?utf-8?B?Zzl2SEZUdExGbzJmcVdKWXhPSENuM08yd0Vsc1IxQ3I0eDEyZGh4SVhEU0dE?=
 =?utf-8?B?RlJlUjN1VHlUQm1ycmpTQnYvZnJOekZSOXBtWDJTT1BZaDVDdEV1N1RJNGU3?=
 =?utf-8?B?aEh4T3VVczBmeE44VXhoM1RZWWY5cE4xZE5vV3ZtTHNoOTRRS3UrbnpJaFFD?=
 =?utf-8?B?TVJEeHFSeTFyVTJrTDRTZ2hzMWpmUEowNDNjOVpxLzhBZnBDYlJ1VC95VWNz?=
 =?utf-8?B?Q05LL1hxUm91VGRTUERTbE5EN2p3TUhVQUkwLzV5RWxiSFNtNGg1SFNjN0xY?=
 =?utf-8?B?dFJuS1BvNHZTUUM5QzkrajN5VTVYZTRVT1UwTzBnaVlwR1pIbDNnVVhBOHBG?=
 =?utf-8?B?anZnM2JSeFoyV050SlJ5UUt0SldSVGZxSGYyOGtWeEdYdTAyVkF6VDRUMUNv?=
 =?utf-8?B?SnNkQ0c4a2tlZE9QVzBVZGlSeURHdmw5d0pWM2MrU2RGemZ0SjA4RmxZWGk3?=
 =?utf-8?B?RjJSMDdDVWVtcGpzWThoeWZ1VGtWNEdrYXc5VFpuWjY4VFZrdVhqcmtwK29r?=
 =?utf-8?Q?jVUynHIP1H8SaT2V+3zDv1QhM?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9f227091-e230-4f94-bde0-08de263fa6ee
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2025 01:13:16.0161 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nZMO4cfB29H+jfDe35PmVsBUacDI1nT6iGCBVoLs/kp6/Drf/+rSXi4PYRHGXKc9SXxZzszJHew203dFS3GVaA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB7157
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

On 11/17/25 5:04 PM, Joel Fernandes wrote:
> On Tue, Nov 18, 2025 at 12:52:47AM +0000, Timur Tabi wrote:
> [...] 
>>>> +
>>>>          Ok(Self {
>>>> -            imem_sec_load_target: FalconLoadTarget {
>>>> -                src_start: app0.offset,
>>>> -                dst_start: 0,
>>>> -                len: app0.len,
>>>> +            imem_sec_load_target: if chipset > Chipset::GA100 {
>>>> +                FalconLoadTarget {
>>>> +                    src_start: app0.offset,
>>>> +                    dst_start: 0,
>>>> +                    len: app0.len,
>>>> +                }
>>>> +            } else {
>>>> +                FalconLoadTarget {
>>>> +                    src_start: load_hdr.os_code_size,
>>>> +                    dst_start: app0.offset,
>>>> +                    len: app0.len,
>>>> +                }
>>>
>>> Can write more succinctly:
>>>
>>>   imem_sec_load_target: FalconLoadTarget {
>>>       src_start: match chipset > Chipset::GA100  {
>>>           true => app0.offset,
>>>           false => load_hdr.os_code_size,
>>>       },
>>>       dst_start: match chipset > Chipset::GA100 {
>>>           true => 0,
>>>           false => app0.offset,
>>>       
>>>       len: app0.len,                                                                            
>>>   },
>>
>> Do we really want to use "match" instead of "if", just because we don't need "else"?
> 
> I don't care about the if/else as much as I care about the opportunity to
> just specify FalconLoadTarget once instead twice. I think the match here is cleaner for this
> snippet, but I am Ok with the if/else as well.
> 
> Something like:
>    imem_sec_load_target: FalconLoadTarget {
>        src_start: if chipset > Chipset::GA100  {
>           app0.offset
>       } else {
>            load_hdr.os_code_size
>       },
> 
> That would be one more line of code, but pretty much the same.
> 

You know, this latest snippet looks a little better. The pattern of 

    match a > b {
	true => foo,
        false => bar,
    }

is actually not as nice as an if-else, because, well, anytime you
explicitly compare against true and false, you are likely doing 
something that the language (any language) has a construct for.

And in this case, it appears to be "if/else". :)


thanks,
-- 
John Hubbard

