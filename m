Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FA30C6CECC
	for <lists+nouveau@lfdr.de>; Wed, 19 Nov 2025 07:30:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9143D10E221;
	Wed, 19 Nov 2025 06:30:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="gSjgk8js";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from CH1PR05CU001.outbound.protection.outlook.com
 (mail-northcentralusazon11010037.outbound.protection.outlook.com
 [52.101.193.37])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D08F10E221;
 Wed, 19 Nov 2025 06:30:11 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=w4SClBXV/2IyLRBY0WBwNVxEzew8I7MusGKMrD6L4r9Y6RAYNHZnKL9C9Lh6UPSU0+2elTbAjkf1QnvAOCI1d8opnxZ4If6yXHjdEPGsOE70sFwv4Wx1HeqSfghdgCxu79DljpIlzh7cOJsfJEVFlNIOGPSf5S1saNtiYev+oikI4e+h2lLthdYM7yTlysLbdWs/YZ4yDLSPwgzxedj9gyHEJfgZ0qNRIuYqVmLV4VOHcCkdY3GS6YdH+lmh3czd9D8ppv46cuIWUyYk/U9rJ3mhCSR3tIEQVJpor80kPkq2CG8MKSwgljLXVwrZegk9u2/4lLaRH+Kpqp6fg9AwQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nuR+NCUHPmTlZK7UqQEBy89GcUz7tlYdZ6mzw6yKJsE=;
 b=iA1NBn43ULTaeSVMODAxJYPcB2v4aIPXXS9aNoH2qSGOW6H8ccE2XXboCESLnsWP9T5ASUr4/Yv2KL9YFiusy/hZQWpDEDFhuHhtHYbBCB8YZsBFN1R/xFiqBvlpo9JyGrSQ75V9J5+IoAAE2jrg7Ir1CYTnZghdqN0CiZr22WCynwFvBXCcC2Gk0iJt6lsj+waRixXlhNIcNlH45pCZOgfNQ0+A2dVhIdNZTQIJDDo+rmVWl2zfYT3DF3WN60kGKprkSyhWG0j5pmGUhCcw1DacKFLe014tnL9SUVmCwvGqM4GwCIQrNDW2i5FBQND85OKPDmqq/FYfmsBL7e+I6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nuR+NCUHPmTlZK7UqQEBy89GcUz7tlYdZ6mzw6yKJsE=;
 b=gSjgk8jsG5AEDhOR65/oORbjdsxrHfsTUhpcnxy85HsrF+oCy0Fgv0ilgHb2iwjumMpjW9JjTqvzos0sn1YVnccVPEFacF1sRWaq/hCNCFBe2tkQkiQUtyTzdGmqYWknyx/VDmP46XJopnn4V2AGE3bMXlDIoAX54G2Em1Px1Knc0j63IgR15Aya8r8PVQvEx82kuflnTSIMIXnAexR+9qrDNC9nhGIiHj9OWd11iWWE+hVOJZZINRSUoLsj+dDxJ1Scx+Vtlt99dMqR+eNCxBE0CUjc1oI6qlWuaVWC5CSaua1MfOdk5lC3inf/q7deOtki/9bVzLzCLgOr3CHeqA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 BN7PPF2E18BD747.namprd12.prod.outlook.com (2603:10b6:40f:fc02::6ca)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.10; Wed, 19 Nov
 2025 06:30:05 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%7]) with mapi id 15.20.9343.009; Wed, 19 Nov 2025
 06:30:05 +0000
Message-ID: <637a93fa-fa68-452f-b218-efe17fd58d3f@nvidia.com>
Date: Tue, 18 Nov 2025 22:30:00 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 02/11] gpu: nova-core: add ImemNs section infrastructure
To: Alexandre Courbot <acourbot@nvidia.com>, Timur Tabi <ttabi@nvidia.com>,
 Danilo Krummrich <dakr@kernel.org>, Lyude Paul <lyude@redhat.com>,
 nouveau@lists.freedesktop.org, rust-for-linux@vger.kernel.org,
 Joel Fernandes <joelagnelf@nvidia.com>
Cc: Nouveau <nouveau-bounces@lists.freedesktop.org>
References: <20251114233045.2512853-1-ttabi@nvidia.com>
 <20251114233045.2512853-3-ttabi@nvidia.com>
 <DECAP2MZ5DUU.1SLMSVDB3GU1T@nvidia.com>
Content-Language: en-US
From: John Hubbard <jhubbard@nvidia.com>
In-Reply-To: <DECAP2MZ5DUU.1SLMSVDB3GU1T@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR03CA0070.namprd03.prod.outlook.com
 (2603:10b6:a03:331::15) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|BN7PPF2E18BD747:EE_
X-MS-Office365-Filtering-Correlation-Id: 582a3a9c-6c8d-42c2-57e0-08de2735138d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0; ARA:13230040|366016|376014|1800799024|10070799003;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?WEhZU0tqdmVaalBtb3QxMEU2V09CdFdYM293U3BEaEppWkRQcWpKU1hTTWRq?=
 =?utf-8?B?YVp0eVY2YlFTQXpuSTZ2ZmlrRlBHUFRmZUQzRzhWTzQ1cDNOcy9rUzBtbXpK?=
 =?utf-8?B?Rlo4MFoyZC9aK0h1RXhKWkhtTkRPTUNxdURCazdmVml4ZUFZL3hraWNQamVE?=
 =?utf-8?B?QlRKdDJsOWVsVUh3ZVFVOUZ3Q29Od2Q5ZlhYM3k5NGF6V2pIdGVMeTY0elZw?=
 =?utf-8?B?Y3pkamNKd0ZvL2xoYkpzNTN5ZWlkOStFcU16RWJ5aUFBRGpVY0lwWWxGaW9h?=
 =?utf-8?B?SUp0ZUFqUk9mRi9Da1lnYkRlbHhUaFplS2piQzd5RlU0RndEeXRNMWtMKzQ1?=
 =?utf-8?B?M3BVNWtrVjBuMUpVdmNBY0ladnkrSmtxT09IWlI1Tm9kbWpkRnB4YTdjZnk4?=
 =?utf-8?B?L2F6VEdQSzBFcjVsL0pzbjNtR2M4dnJzREdrdGc5QlJPZ0hzUnBKM2dBOW5Z?=
 =?utf-8?B?WlJHb0pGMjhwcmNkSG9oYU93Z1FxclF0MlN5MWdiQ2tMNDh5R3VPZ1B6cTR5?=
 =?utf-8?B?Y0dvellmWFdNY3FVc0xoRmI5K2MyeVF1T09TYk1WSkdzMjlFSmFQcEhRZ2FD?=
 =?utf-8?B?ZkdqNEExS0JLSVBoa3gxSzREbzE2UkhKVTdQVjRMeEJmOHhzNzR0TnFYdnFE?=
 =?utf-8?B?NHBNVjU2cXkrVE9CdGY4Rk1jem9mdy93MThPeGFzS0o2VTJPbzAxRHdEcmQy?=
 =?utf-8?B?Y1hzd2RScTU3dVF2R2FiRkE1WXl2Z2MxSGdXMnJ3NzZlLzJmSEJIQnNJQWcv?=
 =?utf-8?B?Rk9BU2p5eHNXZ0JGMUZ0RjBxOW11YjJRa0NXQkxsNC92cTM4eVFicnYrSHhV?=
 =?utf-8?B?V2lYUDFmWnFRVk1zVHlsaGJWUGhVcGpXVTlubnhJaXZJVmEzUGFrU2J0M3Z2?=
 =?utf-8?B?TWw4ek5ySk56VlByRDE5RXNwSUdVNEovVGc2SzUrOGtUR3ZETURnRk9DZ0Ja?=
 =?utf-8?B?Rk81Ty84WXYrdjBZOWN6bUg3Y3BEV1BTRjJFZmpHdEZqY25ackx3dVRIc09x?=
 =?utf-8?B?amxZZEIwMFoyRERRdzIwbHBxUkFMRFRubGJoNDhCakpJMWxsMGZBZUQ0aWpG?=
 =?utf-8?B?WlJjOU9UVnFNSU9FUGgwZmxydWlsWmtwaWplbDRQWnFqczBvSkt6cFM4cFhI?=
 =?utf-8?B?b3dudHdXQ0hBTkRTK1ZWTWRwalBYRGJveVdWM1FSdlg3anlSZnR1dHJYMkJM?=
 =?utf-8?B?aWVGZkJhUld5TVIzRDRzbGQ3L1cwYUtaK2tLSEV0bmtEZ3ovV2RKUnJGNXhP?=
 =?utf-8?B?V2NpNGFYc3dhaWxyK0dGUUYwSmlVOEV6OHJBL0NPeWE5LzVjNmJzdGdPL0Z2?=
 =?utf-8?B?bnlscmhNdmxBZklYMXBiSXV4L2s0T2FSaWZ4bUdkaGtoUFkydGlLTGFzY3ZB?=
 =?utf-8?B?Z0RNT211YWN6c0FrYlhONWVTVHpadDYwUE5Kb1RlMTU4bkdIcUd0V2VPRW1h?=
 =?utf-8?B?dm5RU3pPVmNwdE9qeU9FMmRDN2prTWxRdmh2MHNHdnhyRk53QXlCUHZ0SGpS?=
 =?utf-8?B?Ny9uSytQY1FaYzkvbklIbVdWU1ZmMU9JQnlqdVdtOGZKcFVLQkVQN0srdEd3?=
 =?utf-8?B?NnYyR0xlUTZBUGQvUFRLVzhjbFNsaFRMTE16UU1kUUNqTUFOMy96UVA1Ynls?=
 =?utf-8?B?bTJldCtuR0dNSGczSFBxU0JiTnVvbmVmOCsrRXR5UnFqUlhzK2NSSk56aW50?=
 =?utf-8?B?QXZJRjFxaGtHQWQwVnlNZzhwTC82ZmY5Y295R3JLVE9QZXhtMGM2TllPK2Uv?=
 =?utf-8?B?dG9WRExuNkwyYWQ3NEh4bkZ5RTQ1TU1VaGJ0SlRUMEk1SVRFc1FxMVpKdVR0?=
 =?utf-8?B?enJYdjl3OVVoV25zWld2ZEVQZDk1eWFrM3lHWGpJUXdBSGdBeDBub3pBY0pw?=
 =?utf-8?B?V0diMnlQbFRxdXhvRHJMOWdaR2hWaG9FSTE4dGdlN3c1dnV6WTUwL292OGZW?=
 =?utf-8?Q?voNgjAXnzwzlMVvHAz86/QW+QIcOC9Xs?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM3PR12MB9416.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(10070799003); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MFB3QWJpVm1TOHlCVlJheGM5bG80MERHN1pqVm8rQmVXalZ4eXhGV0FEMThH?=
 =?utf-8?B?VFpmcFRqL01vY09oWjVLOFNEMXJkOVRlMmpOcHJxcDNoc1h1SUxDYmNJcGxY?=
 =?utf-8?B?dUpiSzhpN1BjQVE0OVByemF4MUlyUUV6M2hnaUhhSC94S0UzRXRGRC81TlRm?=
 =?utf-8?B?d2JBNUM5bnUzVkZNd28wTlZPWU9HMnhRZXl0c2RSSzlwVjF6blArbEdLZUc2?=
 =?utf-8?B?SktiVXJzOTl0VHROVkxEWlJ3OHEvZEpZUFlwbjNZWHkwRExUbERZVkQwTERy?=
 =?utf-8?B?MDdXQktyb0Y5VTZIVFNtQmw1bkhHT3lMc1BkSzdiaENRc0pqR0tzRFJpS3NH?=
 =?utf-8?B?bmErTFE0Vk0wcDNIRmh6ZkpDT1ovZ1pEZ0l4WXNwc2g5VllBZTErV3NRM1NE?=
 =?utf-8?B?ZmJ4UGdvd2tBSnRnUEhvb21vaUFWdWVrdk50dnFGTE9mRnp1bWZvZ3V5RElR?=
 =?utf-8?B?T2xiTU9SMEtPQkdlSi9PaWlxNEtSZ1FpVElCcWdNZ0RnTzZ1OHJjdW82UWRI?=
 =?utf-8?B?VDRKYUV6MXc3NHVMSnFRUWZSYVc0SXphQkFDZ1lBSUJ6U3k2TDZHYUJxMHZS?=
 =?utf-8?B?c3F5MWZSZTEwNC90M3JEbEEwZ3VhYVIvSTMvVnFLTzcwQS94cnlzQ2RMajV2?=
 =?utf-8?B?TFFyS0crQUtwbjdNQW5DdlplekUwc3NhYXFISld4Q25OTWlkSXlSckZlbjdT?=
 =?utf-8?B?dWQ0V3ZIMFhpZlMzRkdRbCtTaGw3ZkVSSXp5THoycUdTVFpHaGR2QjJJa1Jp?=
 =?utf-8?B?RDVrbkw3K2V0bFpIZTRRVDltd3VnMXVDK05NbkJtWlY2MFk5d0RZL0dMS1dx?=
 =?utf-8?B?TWo0eTAvWUlXZmJ3Z2syeGpneFJPRmgxOUhyRmdkdG1TaVdObDFWUDhVdC9H?=
 =?utf-8?B?Vjlja3A1eGhhMHFkNUxUL2RSTnBJRXd3Rk5lUE85TGs0RmdwS2VoTEtVcmNZ?=
 =?utf-8?B?S25aSzlidzQ5VFNTdUt6cXVERDBmcnpJMm1rUkpES0ZJczBib2xvc1JWTVNx?=
 =?utf-8?B?dkM1Zzc3M2Faa2NXbmdrdUtoZ0JyVFNONjJIeHNObXdCUVVTNGZDVGtWR0h3?=
 =?utf-8?B?eThJSTU4MzFhSzZzZkRMV0N2QVBIaUZLRm40SURFRDVWdHIvN1pjMHo0QVdm?=
 =?utf-8?B?bUFROHpWcmtLQnNRcTU2Z054RW5rYkZVYlVFT1hzTVI1Q2dKN1ZsazVlcCtM?=
 =?utf-8?B?cEZrUlc2d0dvRjhEUlJEMWpwV0M0dk9xU20yZ3pmYjFFZU1zZCtmemhKcllm?=
 =?utf-8?B?bitwQ2x1SnJVRG9qS281TzVBME0zamw1TkpLQTVrY2xqNDJlamZUNzBzcEhQ?=
 =?utf-8?B?em1PNWVScTFLUXRpZTB3VDVWb0VDSUZDSDVVd0J6Nkh2SWFJeG0zdlZjMUlE?=
 =?utf-8?B?aW5xUnhBaXdPLzN1UjhKeEVWWG9OUjNaWVNxUVFSZEVZektrQThONDB1cTcz?=
 =?utf-8?B?MHNxaVdJdkkxd2dQS05OemZOUWg3YW4yV3BFSjJJaXI4eEFKR2Q4VVExTlRZ?=
 =?utf-8?B?TFhPdGhYWU4rb2JMVXdqQ1JkTFFzSHhKS05tNFdTQnlKZXZYekpwbnBXNHhL?=
 =?utf-8?B?bk9KSy9heFFMWEJSNFRkdU5PdHVNWkt4OHdtZXMrYUoyMlZyUlFHdFMrZzV4?=
 =?utf-8?B?VGg1b2p1cVZrTE9aTzNWTjM4UExINzZaOWtFU3UvbzR5RWMrSGtaU2dyT1lU?=
 =?utf-8?B?VzkzUFRjSlphV3RMeDhNL2NHWTVJWlNPVEpnVUlOVEMvRVdzc3FMRWVldndz?=
 =?utf-8?B?RU1od1lvMVE5bTJqZkpTNFdJMnI4M1E3ZW5hRmhXMVBtRitxWGJhbWJBRm1Y?=
 =?utf-8?B?MmJXT3JGNCtwMzVPWXZOTVZ2cUkwMFN1WVN4SFM0bDlTTTVNbS9kRmp1SVFa?=
 =?utf-8?B?UFplbVVMRVFMUGU1bk1ZSHFGaEZBUHRCK2lXZUlYN09YbW05ckdRK1p6UGJz?=
 =?utf-8?B?b0QyK3hqMFBwZ09LSUV5YVRaL2p3YUdpTjU1dWVhWTBoYUNLRTRJT3ZwQUpv?=
 =?utf-8?B?bHN2YkRzUGRwYnFoVDJLN1BrNTVORUdZd291RFhyR3Bxby9JNlRqRiszTnFO?=
 =?utf-8?B?NGxKVnVwZk1CQm9jZzA0MG9HZVhpWjB3eTEwMHZDNWJHWmVMTWFKOGF0YVlh?=
 =?utf-8?B?L29MbHNYcG5IU01OR1RLRkozWkZPaHEwbERsakhIRnhuZTFRSTRITjdHZXZW?=
 =?utf-8?B?QUE9PQ==?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 582a3a9c-6c8d-42c2-57e0-08de2735138d
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2025 06:30:05.0012 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: b5Zt00nORW+C+tsRm/1IVLGP8FUSasNA1Q1DDQPGiQDHFZst+kJS6GcoClkj6ERbvhekm+0bZKvhtfRYEJZqbQ==
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

On 11/18/25 5:54 PM, Alexandre Courbot wrote:
> On Sat Nov 15, 2025 at 8:30 AM JST, Timur Tabi wrote:
>> The GSP booter firmware in Turing and GA100 includes a third memory
>> section called ImemNs, which is non-secure IMEM.  This section must
>> be loaded separately from DMEM and secure IMEM, but only if it
>> actually exists.
>>
>> Signed-off-by: Timur Tabi <ttabi@nvidia.com>
>> ---
>>   drivers/gpu/nova-core/falcon.rs          | 18 ++++++++++++++++--
>>   drivers/gpu/nova-core/firmware/booter.rs |  9 +++++++++
>>   drivers/gpu/nova-core/firmware/fwsec.rs  |  5 +++++
>>   3 files changed, 30 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/gpu/nova-core/falcon.rs b/drivers/gpu/nova-core/falcon.rs
>> index 0e0935dbb927..ece8b92a627e 100644
>> --- a/drivers/gpu/nova-core/falcon.rs
>> +++ b/drivers/gpu/nova-core/falcon.rs
>> @@ -239,6 +239,8 @@ fn from(value: PeregrineCoreSelect) -> Self {
>>   pub(crate) enum FalconMem {
>>       /// Secure Instruction Memory.
>>       ImemSec,
>> +    /// Non-Secure Instruction Memory.
>> +    ImemNs,
> 
> So, seeing how this is taking shape I now think we should just have one
> Imem variant:
> 
>      Imem { secure: bool },

ohhh, boolean args are usually not a good idea, because they make the
callsite non-self-documenting.

That's also true even in magical languages such as Rust. :)

Let's prefer enum args over bools, generally, please. So for example
(there are other ways to structure things, and this is just the
enum aspect of it):

     enum ImemSecurity {
         Secure,
         NonSecure,
     }

    Imem { security: ImemSecurity },

> 
> This makes matching easier for the common case of "we want to do
> something in case of Imem, regardless of the secure flag". Something
> like
> 
>      FalconMem::ImemSec | FalconMem::ImemNs => {
> 
> becomes:
> 
>      FalconMem::Imem { .. } => {
> 
> And if you need to use the flag, you can change e.g.:
> 
>      FalconMem::ImemSec | FalconMem::ImemNs => {
>          regs::NV_PFALCON_FALCON_IMEMC::default()
>              .set_secure(target_mem == FalconMem::ImemSec)
> 
> into
> 
>      FalconMem::Imem { secure } => {

See, this is hard and misleading to read. It reads like "secure
Imem", until you think at it a bit. Devastating! :)

>          regs::NV_PFALCON_FALCON_IMEMC::default()
>              .set_secure(secure)
> 
> Which is simpler and easier to read.
> 
> This also removes the need to rename `Imem` into `ImemSec`, so the first
> two patches can be merged into one.
> 

thanks,
-- 
John Hubbard

