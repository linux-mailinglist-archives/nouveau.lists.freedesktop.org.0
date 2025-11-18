Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 89E8FC6B7C1
	for <lists+nouveau@lfdr.de>; Tue, 18 Nov 2025 20:46:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 33E2510E1F5;
	Tue, 18 Nov 2025 19:46:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="EI+jnGmH";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from BL2PR02CU003.outbound.protection.outlook.com
 (mail-eastusazon11011042.outbound.protection.outlook.com [52.101.52.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BED4810E1F5;
 Tue, 18 Nov 2025 19:46:03 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xkJanz6lHysRhI1N9DKaCLpkt4QtGhNUti1AM4M0M15LJw9i1wCt1/eHJWWUCx5O82Iz5pqdrSr3cHIzOVMr8yQd87+MHpQHTJ95HzgDjZxEjJaUuOXJAWsUwn5UVQv8PL8gTdnfbWiwtLGU+TFmQQvW7pEaTTGVWAWKO7EJKgiGoK4QU7+2uycu2104Uw8z1L6j/hJpTutUirxynylfdh/nPf1eQDTiEkK3nJnqr3bKUwYCFUpjw2vlF//Tg9iamtuqm6UjadKhERFzTPZjFCsGSa064C4JTFxGI7uz4dTLIY3wzhc/EAi3iVcJmkwDWsnxAmapnslLI4zH1PBlBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gYHdF+NrSMcLtu48m/SVYdm6bU62n2SZLRqOR/fmups=;
 b=lyHZkk9ri280IvA41NvHEw+qslYvTYBCQuRdVK3kr9eCn+jSEhFIOQaTj0+hNwej1LOIHv1g3sEPnDnCfd59COTMHpO5RC2nGgl0a/nveiqtwg6nkWcVQW98vr7f24KCVWE7bvAS69/7oTsSQaojBFsTU1OPWHcuSr3jtbEk0TUVvSabAYO8M+zGsrSqiGsQzjSsdp2V1JnHfo/TNgJ0qucqzwAHI4KqeeYYfKWVF2BYVyAaIvsWTER8Bl/m4raLujbCvViLSRTLpgfuorcncPaMMJoiJbAYf4H4JqDhHdsxePlSt8eYx9JCUcOlh+S0Leod7ySqE/cqkeXVNXq9rw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gYHdF+NrSMcLtu48m/SVYdm6bU62n2SZLRqOR/fmups=;
 b=EI+jnGmHFHzjSYIzpGV7M5pdcld1nwANqqxFjyZ2+BIPe32EgrIqQrokeosW1kbiRdD7Rz2I3zb3B4lUe8Ho16/xJTazPF4flGeR1pui6xmh1phgGmTr0nAmFUUqcmhM0QyA3iORh2i5xj7F/4xvacOMbqccr3flHZfH2YztmHCetr2jmt/vc5rw07/P/6PuJ+KMprBj5aioVV7KinNnAwJCYLWNNE20KtjJ8IEamfzcAoTPp1nnK2V8Jrz6M5oviJ4l1uZD+9MH1awO5VuunF0FNQvqP9IZ2tk54ex3SuLIfxubBeiHyVhkcYU4pDcjBNfyr7ofTx50kT5FXeKthg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SN7PR12MB8059.namprd12.prod.outlook.com (2603:10b6:806:32b::7)
 by DS7PR12MB5864.namprd12.prod.outlook.com (2603:10b6:8:7b::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.22; Tue, 18 Nov
 2025 19:45:42 +0000
Received: from SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91]) by SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91%2]) with mapi id 15.20.9343.009; Tue, 18 Nov 2025
 19:45:42 +0000
Message-ID: <9d46760e-f315-4757-8502-ca8d48c6405a@nvidia.com>
Date: Tue, 18 Nov 2025 14:45:40 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 09/11] gpu: nova-core: add FalconUCodeDescV2 support
To: Alexandre Courbot <acourbot@nvidia.com>, Timur Tabi <ttabi@nvidia.com>
Cc: Danilo Krummrich <dakr@kernel.org>, Lyude Paul <lyude@redhat.com>,
 John Hubbard <jhubbard@nvidia.com>, nouveau@lists.freedesktop.org,
 rust-for-linux@vger.kernel.org,
 Nouveau <nouveau-bounces@lists.freedesktop.org>
References: <20251114233045.2512853-1-ttabi@nvidia.com>
 <20251114233045.2512853-10-ttabi@nvidia.com>
 <20251117231028.GA1095236@joelbox2> <DEBUBWW4AF8H.S54ZKX607FND@nvidia.com>
Content-Language: en-US
From: Joel Fernandes <joelagnelf@nvidia.com>
In-Reply-To: <DEBUBWW4AF8H.S54ZKX607FND@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MN2PR20CA0009.namprd20.prod.outlook.com
 (2603:10b6:208:e8::22) To SN7PR12MB8059.namprd12.prod.outlook.com
 (2603:10b6:806:32b::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR12MB8059:EE_|DS7PR12MB5864:EE_
X-MS-Office365-Filtering-Correlation-Id: d504996b-644f-4772-9c48-08de26db0ef1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?b01GT29sMi9iZ0IwRXp2NkRNNWg3Qjd5MHFjUlo0ZEJVUGRvcmV1NUxIUXQv?=
 =?utf-8?B?emhxWGx4Y1YwbjNuOFR1MVEralZwdlFzQ21WTXR1aklyUVNTc2pRdCtnVklt?=
 =?utf-8?B?N1hkVCtSdmF4aVdDOWhheDlTVVpkZE1mWWcycXczeHNGN1QweXIzR1c5MUds?=
 =?utf-8?B?ZEZDMXI2VmFRY3UyaU9ESURWbzR2TlBzNHlVYmNmRDZEd2dMS2J3Y2RpeWhB?=
 =?utf-8?B?b3NuWml2dmtHYkFTVHd2Q1czSXd1c3NQRm91WkJWMjM0dUFyVXloRVBtK0dQ?=
 =?utf-8?B?WVRhZ2srTkdVQTJEMkJHRG9SUVdpcS9QeHh6aFJDdVEybHFSU21sUXU1ekNl?=
 =?utf-8?B?L3lmaFBBazhuNTIvMVpUdDZSazNUMUpXK2k2bVRtS0VrQmxiYk54c3lpZkpF?=
 =?utf-8?B?dDZQdVJvV2ZUMWh1akFqa3crN0N2VGpkNCs4ODVXMWlVQmRxRGZSY3VkS3lt?=
 =?utf-8?B?c25wQ1NybHM3RVJST0NWQklsbTU0NGx5dy9odFhTc3FqdjJoZ0pFRTdPWlBi?=
 =?utf-8?B?WTI4K21GQU9NZmJDOEtXT0JCV0FNcnRsRU9aYXlNVXd1VmZmb1R0NUVoM1Va?=
 =?utf-8?B?WERJcVlSMXBDN2J3UmY0K0N4VzJsRnUxMDZFa2UzcjdlRHRmdkxSMEk4SkEw?=
 =?utf-8?B?VGRCYmRSbTc0cE5SbDVwanZ6b2t6K3lpSHg3Z1dqYTlhM0RiS0dZbTZjK1NK?=
 =?utf-8?B?NFFXMnZseUpvTjNsWjRibGdUd2kwWkJaZjAzdmhjR0RTcmdtdThqek03MmNy?=
 =?utf-8?B?TklUeUEvSzk4TTNaM1dqSVNhVlgyYzlUazRMei9hTlc3dFJmUVBCbjE3VVNZ?=
 =?utf-8?B?YlZoQmh0WU9ZemFicEkvRUJTUWRiTzZNWFlKVlFLZ2hRTG1OTXlMNUxKWXFa?=
 =?utf-8?B?UFY1V0tFb3Q1Q1Azb2R4NnNnN05rQlgxZVQ5WU9VbFRlSWlzT1RkeVhlMkxV?=
 =?utf-8?B?ZXdla0VBa3NJWnp5Q3dVRjJEeTJvZnZnSVVRb3drVDYzWGorcTlycHV2S25a?=
 =?utf-8?B?TmZWa00wQnFGZ0tldFZzZ0RTNnpXd1FENE50MmVoTkNqcTZ5QlhXdEZNOXU4?=
 =?utf-8?B?ckJQSklQRmxRUmRnVUx1cExDRjFlanpPTEhMMTdSc0ZWZFpaOHBrdXJmMEtF?=
 =?utf-8?B?VkVlN212R0Ntanl5WDVRNndqYmFLU1cvak5OeitnenIvaXZkNXRtemd0OHVW?=
 =?utf-8?B?R0FBeVB0YUt4T3lNS2tmUFBpUXdZNGFCOEJGMExnWHVGNVlGUEx6NXlMZDBG?=
 =?utf-8?B?aXJYZHhRc0Qvc3d6aEtNSkh0djhZK2NTN2YzOWRaZlhiUzhKKzFOT21QQTJ1?=
 =?utf-8?B?WmdjQW9sZ2crUmV6YlRkRUZUSnVFNE4vMEcwUmZ2VEN6NnI5RW5xS3Q2L3Rt?=
 =?utf-8?B?V1VIcjQ2bmdBaUhsTUUzNUVxMTA0bDI4MUd1OHBGTnB0VE5iS3NPYTVEVWxO?=
 =?utf-8?B?VzFVeDVwOGNRTTZEU2JqdWRVa1FIU0V3RGRoanBodVNMZ2hQUW1QRlI1cWkr?=
 =?utf-8?B?UWVWTytxSGZjTFAyUGFXNG1GUzBxTzgwVURzQ2twT0E1OUFGamN2QVIxaStw?=
 =?utf-8?B?Mkw0YUpnYnZ0MmdTYW5sKzNBZ2RrWEk4c3RUU3JWclVkd0MyUVJ2YlN3dDlV?=
 =?utf-8?B?emd5T3FFeHc4ZHU0SDVxOXhOQ082dkc3MUZQVkFDQ2FFZk5LVUgrVkVucjlB?=
 =?utf-8?B?OXRuOVd6OUdEbnpkRnY4QW9jV3oyaWRJMlNqNHhaNjJtazBkQ0lpdWxWNVhF?=
 =?utf-8?B?cS9vTFIrcjVmVThDNHlOVEFDUlcwNmtuRk16enlia1NnMlErUUY4UHo3SmtP?=
 =?utf-8?B?czJYcDJCOFNtRjdwVUQ4ZlgrazJzN2ZVVHhOaXNlNWNPUW92ZkQzNnhoUFlQ?=
 =?utf-8?B?YzNhTVd0RWh5NVNaRVl4UTFmRlZxcVlobkh4OEtxdytPRm9pM2diT3g2V2Zn?=
 =?utf-8?Q?3womLiMdnZMpTYpP1D+zpZjP4xiS+srC?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR12MB8059.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VGo3QUZYaTNTZHk3ZlI2bFh5cyt6WnlOZVBzaXprSG95d285MUdSUkJwRkFN?=
 =?utf-8?B?SHQrMUsxMUdUZ3gyYUhzaGVKdWxsbmxmYkJocDBOUnNVa1hjSzd5aFFseTFq?=
 =?utf-8?B?c3cwUnFUcUtyaE81T3RVMkducmVWWWI2NkZhaDBDZTV5MlZQRXN0NzVnMlBx?=
 =?utf-8?B?eDRzNUJ5S2dxWTZmbkVMWlZ0Z0NpbGVXcGlNSWJ3TU9GVmF3RUZEVHROTWxU?=
 =?utf-8?B?dko2TkREN09NeklmNkFMRHE5OUVFR01qVTVnRWp6eHVqcnFqeHk3ZnRwT1Bn?=
 =?utf-8?B?NHQrTDlEK2RtSExOekh4OHV3ZENrRFdjRU4yS2F1bkJiOFM5Y1MwQTIvWUQx?=
 =?utf-8?B?Z01waWRveFp1cDdWNEVXOFBnU0FTR2NWWW5zU1pUQUsyT1pNVURVVDRJeitQ?=
 =?utf-8?B?c0YySitjSVA1ak81OVZtenVPM3d0eW1uTDZUTndPYXcxSXRkQjdNS0RySWtD?=
 =?utf-8?B?eG5tbGMvK0hJbUtrZUtXd1BSNWZOb3ZHNlorTjZTSnM4Sk1wZXV1UFFzQ0Za?=
 =?utf-8?B?QWc4SVR5YlB1MDVpSnNHRGpYUEtxUWNmQ0Y3OEd0bjY5NjVNSzlKcWFqdVBB?=
 =?utf-8?B?aDB6OGdJdi9qQkdjWStLV1hWR1VUY0VzMkFhYWpGUDc3S0V1MG53Tm1VOEtl?=
 =?utf-8?B?dHd4MElESHA5UzFlWFNiM3IwdGhjcTFqK0o1U2pNRFFOb01oZ2kxRzhUZ0pS?=
 =?utf-8?B?MWJJS2FqeE0zQVlROUZOVW1iTXhPY3ByamtwRUNVRy9UV0JQdW9KLzhISVRY?=
 =?utf-8?B?cmVnR3FxTmtEU0h6U2tZOVdTZytkei9zQlNKbjJVeXByeXJHM3hvZ1N5TmV1?=
 =?utf-8?B?bkxGYXpZUVc0ZUxiRHdtczdIdGlOL2lFaUMwVDZuUUMyL3ZkeFZpaG02SFBk?=
 =?utf-8?B?ZEo3eFMvV3lUeHlscjRJVjN3aVU0UEtOT2VZVzRSZUxid0RiR09HUENFSWRH?=
 =?utf-8?B?MXlCVTdZR2xuUFljNG82ckVkMHNiVGdkVHpWOUphNzlYcDlUb0hPcEc1Nzlz?=
 =?utf-8?B?ZHZ4MnBOTXU4Y2ZsaC9LT1g1MDBrNnN0Q2NDOUY4d2xmaldzcTJEcXFQVkhU?=
 =?utf-8?B?WW9KOGV3alA3a2doUXhOZFF5dVNKVkJFUDhOZW02VjFOMGZmR0hjTTg1ZzhX?=
 =?utf-8?B?amo2bXhnZzBzRThEdFRLUUdkM3krZ0tCb3BQOXlPWGRlR2ZVMG1WYXEvZm1E?=
 =?utf-8?B?ZnRUQm5DTUVycTZra1ZqU3VsL3NvMnZjVDM0VURXNXM0TCt2ZnNhRlpHWVZS?=
 =?utf-8?B?RGVpUFFja25lU21WTzJNN0h4T1lLbDh0dXBNUlhIMU1KMzVxQXNRZ0U0YW9i?=
 =?utf-8?B?bFd2T3M3T0wycTB1SkVNdG5HK0dEbzVSa0VkenptK29Qd2hqbFNzU3UwSG5K?=
 =?utf-8?B?MHltVC84d0kvTFpRSzVCbFgyd2srRGJObVF0bUQ2Z0RuWHczeHUwTGdpd25y?=
 =?utf-8?B?Ny9RSktwYzZBSFJxdXAyRjZyVFErRlYxTHlIM1BzTUt2b09taFhOWXNPUVNh?=
 =?utf-8?B?WTl5aEpXVlNDNDk4VjJjTGp2cDRLMTd2Q3dwcWtxSXEzTnJEaXhmeXBzRzlk?=
 =?utf-8?B?bHFjRWNmTEkrYnZtcnBIVDNjMGc1QXkxWlk5d0VSTU9PMjE3NG1Eek9ON1Mz?=
 =?utf-8?B?ZzMvL3c4bk5iaDNxa2hacVNjYjlrQi9jUm9OcklyUVd1b3VveGkwMlBXN3RH?=
 =?utf-8?B?Sm1xNzJoZkJKa3R1MjE4SCtQMUFUcTkzMG5DcnVTL0d5aHBqdTBqdCtyMUcr?=
 =?utf-8?B?cXkvTVNVOEw3U3RsS1RubHo0U3NYZ3JoYld5SGx1eWJEQ0kwUHJBMFFYaDRM?=
 =?utf-8?B?UlFQV3hhSVFDOHhqbjg5Zno1dENKN1lLeEpieHJLcnQ5VTF3dWtoMGFURXJD?=
 =?utf-8?B?ajJlRnhWdzhWNHZDcitvWklMaWk1aDRwMXpGQURkbXdVMFRlS1VxZE1aM2Vv?=
 =?utf-8?B?UEhTdFdyMWxDL2V1UWFaejNKZGRsa2YweVpESWxqaGpkU0xTK3NtUG81aDBR?=
 =?utf-8?B?MStPNWludXl6UU5FaU9UNVovTWo4NDlPb1JITWQ1VG05NDYzbVFLM1RUQTlx?=
 =?utf-8?B?aUlWV3p6MUNHUUJLSGJYVWdGUEVEelkzK2VPaWlUUFJ6dFlEL2RHMHhPbFJs?=
 =?utf-8?Q?pATK0enJGfwI2Y9QM/hq/gRNL?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d504996b-644f-4772-9c48-08de26db0ef1
X-MS-Exchange-CrossTenant-AuthSource: SN7PR12MB8059.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2025 19:45:42.4643 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0pyq/pdZhkEgGWo2N6qx6yInlrQLERBVNHr9bkNdRaZ8xl40gO3kjrE9nDfMBYyC3Cea2wGnxVF35vR/a6r14g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB5864
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



On 11/18/2025 8:04 AM, Alexandre Courbot wrote:
> On Tue Nov 18, 2025 at 8:10 AM JST, Joel Fernandes wrote:
>> On Fri, Nov 14, 2025 at 05:30:42PM -0600, Timur Tabi wrote:
>>> The FRTS firmware in Turing and GA100 VBIOS has an older header
>>> format (v2 instead of v3).  To support both v2 and v3 at runtime,
>>> add the FalconUCodeDescV2 struct, and update code that references
>>> the FalconUCodeDescV3 directly with a FalconUCodeDesc enum that
>>> encapsulates both.
>>>
>>> Signed-off-by: Timur Tabi <ttabi@nvidia.com>
>>> ---
>>>  drivers/gpu/nova-core/firmware.rs       | 108 +++++++++++++++++++++++-
>>>  drivers/gpu/nova-core/firmware/fwsec.rs |  72 ++++++++++------
>>>  drivers/gpu/nova-core/vbios.rs          |  74 ++++++++++------
>>>  3 files changed, 202 insertions(+), 52 deletions(-)
>>>
>>> diff --git a/drivers/gpu/nova-core/firmware.rs b/drivers/gpu/nova-core/firmware.rs
>>> index 2d2008b33fb4..5ca5bf1fb610 100644
>>> --- a/drivers/gpu/nova-core/firmware.rs
>>> +++ b/drivers/gpu/nova-core/firmware.rs
>>> @@ -43,6 +43,43 @@ fn request_firmware(
>>>          .and_then(|path| firmware::Firmware::request(&path, dev))
>>>  }
>>>  
>>> +/// Structure used to describe some firmwares, notably FWSEC-FRTS.
>>> +#[repr(C)]
>>> +#[derive(Debug, Clone)]
>>> +pub(crate) struct FalconUCodeDescV2 {
>>> +    /// Header defined by 'NV_BIT_FALCON_UCODE_DESC_HEADER_VDESC*' in OpenRM.
>>> +    hdr: u32,
>>> +    /// Stored size of the ucode after the header, compressed or uncompressed
>>> +    stored_size: u32,
>>> +    /// Uncompressed size of the ucode.  If store_size == uncompressed_size, then the ucode
>>> +    /// is not compressed.
>>> +    pub(crate) uncompressed_size: u32,
>>> +    /// Code entry point
>>> +    pub(crate) virtual_entry: u32,
>>> +    /// Offset after the code segment at which the Application Interface Table headers are located.
>>> +    pub(crate) interface_offset: u32,
>>> +    /// Base address at which to load the code segment into 'IMEM'.
>>> +    pub(crate) imem_phys_base: u32,
>>> +    /// Size in bytes of the code to copy into 'IMEM'.
>>> +    pub(crate) imem_load_size: u32,
>>> +    /// Virtual 'IMEM' address (i.e. 'tag') at which the code should start.
>>> +    pub(crate) imem_virt_base: u32,
>>> +    /// Virtual address of secure IMEM segment.
>>> +    pub(crate) imem_sec_base: u32,
>>> +    /// Size of secure IMEM segment.
>>> +    pub(crate) imem_sec_size: u32,
>>> +    /// Offset into stored (uncompressed) image at which DMEM begins.
>>> +    pub(crate) dmem_offset: u32,
>>> +    /// Base address at which to load the data segment into 'DMEM'.
>>> +    pub(crate) dmem_phys_base: u32,
>>> +    /// Size in bytes of the data to copy into 'DMEM'.
>>> +    pub(crate) dmem_load_size: u32,
>>> +    /// "Alternate" Size of data to load into IMEM.
>>> +    pub(crate) alt_imem_load_size: u32,
>>> +    /// "Alternate" Size of data to load into DMEM.
>>> +    pub(crate) alt_dmem_load_size: u32,
>>> +}
>>> +
>>>  /// Structure used to describe some firmwares, notably FWSEC-FRTS.
>>>  #[repr(C)]
>>>  #[derive(Debug, Clone)]
>>> @@ -76,13 +113,80 @@ pub(crate) struct FalconUCodeDescV3 {
>>>      _reserved: u16,
>>>  }
>>>  
>>> -impl FalconUCodeDescV3 {
>>> +#[derive(Debug, Clone)]
>>> +pub(crate) enum FalconUCodeDesc {
>>> +    V2(FalconUCodeDescV2),
>>> +    V3(FalconUCodeDescV3),
>>> +}
>>> +
>>> +impl FalconUCodeDesc {
>>>      /// Returns the size in bytes of the header.
>>>      pub(crate) fn size(&self) -> usize {
>>> +        let hdr = match self {
>>> +            FalconUCodeDesc::V2(v2) => v2.hdr,
>>> +            FalconUCodeDesc::V3(v3) => v3.hdr,
>>> +        };
>>> +
>>>          const HDR_SIZE_SHIFT: u32 = 16;
>>>          const HDR_SIZE_MASK: u32 = 0xffff0000;
>>> +        ((hdr & HDR_SIZE_MASK) >> HDR_SIZE_SHIFT).into_safe_cast()
>>> +    }
>>> +
>>> +    pub(crate) fn imem_load_size(&self) -> u32 {
>>> +        match self {
>>> +            FalconUCodeDesc::V2(v2) => v2.imem_load_size,
>>> +            FalconUCodeDesc::V3(v3) => v3.imem_load_size,
>>> +        }
>>> +    }
>>
>>
>> This looks like the perfect use case for a trait object. You can define a
>> trait, make both descriptors implement the trait and get rid of a lot of the
>> match statements:
>>
>> // First define trait
>> pub(crate) trait FalconUCodeDescriptor {
>>     fn imem_load_size(&self) -> u32;
>>     fn dmem_load_size(&self) -> u32;
>>     fn engine_id_mask(&self) -> u16; // V3-only field, V2 returns 0
>>     ...
>> }
>>
>> // Implement trait for both versions
>> impl FalconUCodeDescriptor for FalconUCodeDescV2 {
>>     fn imem_load_size(&self) -> u32 { self.imem_load_size }
>>     fn dmem_load_size(&self) -> u32 { self.dmem_load_size }
>>     fn engine_id_mask(&self) -> u16 { 0 } // V2 doesn't have this field
>>     ...
>> }
>>
>> impl FalconUCodeDescriptor for FalconUCodeDescV3 {
>>     fn imem_load_size(&self) -> u32 { self.imem_load_size }
>>     fn dmem_load_size(&self) -> u32 { self.dmem_load_size }
>>     fn engine_id_mask(&self) -> u16 { self.engine_id_mask }
>>     ...
>> }
>>
>> // Keep the same enum. If you want to get rid of the enum, you'll need Box,
>> // but then that requires allocation.
>> pub(crate) enum FalconUCodeDesc {
>>     V2(FalconUCodeDescV2),
>>     V3(FalconUCodeDescV3),
>> }
>>
>> impl FalconUCodeDesc {
>>     // Return trait object, the only match needed.
>>     pub(crate) fn as_descriptor(&self) -> &dyn FalconUCodeDescriptor {
>>         match self {
>>             FalconUCodeDesc::V2(v2) => v2,
>>             FalconUCodeDesc::V3(v3) => v3,
>>         }
>>     }
>>
>>     // delegate to trait, no match statements!
>>     pub(crate) fn imem_load_size(&self) -> u32 {
>>         self.as_descriptor().imem_load_size()
>>     }
>>
>>     pub(crate) fn dmem_load_size(&self) -> u32 {
>>         self.as_descriptor().dmem_load_size()
>>     }
>> }
>>
>> // Usage example - no more match statements needed!
>> impl FalconLoadParams for FwsecFirmware {
>>     fn dmem_load_params(&self) -> FalconLoadTarget {
>>         FalconLoadTarget {
>>             src_start: 0,
>>             dst_start: 0,
>>             len: self.desc.dmem_load_size(),
>>         }
>>     }
>> }
> 
> On principle, I tend to agree. In practice, we will probably never have
> more than these two variants, so we need to balance the benefit of a
> trait against the overhead of defining it in the first place (there are
> quite a few methods in there).

I don't know if we'll never have more than one more variant really, its hard to
take a call on that. If a third variant comes into being, then the match arms
increase more.
> Trait objects come with their own complications, i.e. you need to store
> them on the heap if you need more than a short-lived reference - but in
> our case the short-lived reference should be what we need anyway.

Yeah, true. AFAICS though, and as you mentioned, in Timur's case it looks like
that is not an issue and we do not need an allocation.

Thanks.


