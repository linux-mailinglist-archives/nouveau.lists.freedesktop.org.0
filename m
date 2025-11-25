Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E5794C82E71
	for <lists+nouveau@lfdr.de>; Tue, 25 Nov 2025 01:05:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0359510E330;
	Tue, 25 Nov 2025 00:05:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="MKgdfMCH";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from PH0PR06CU001.outbound.protection.outlook.com
 (mail-westus3azon11011067.outbound.protection.outlook.com [40.107.208.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1CF3810E33D;
 Tue, 25 Nov 2025 00:05:18 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yFKds1l/yW0Qy/NJgUMlO7TFD+/zHh6vZDptmLQFLR9Ysu1Q/TP13+wSiGgmGeYlDru2QO3pcAGwHtFcywZNjjSjLvRTOAVojz5/NGyYUstpxA5s6b5kvL457eF7S4RBsxqZo01p2it1tGd32bBP/5d5ktG4IbWhO8kbXdBD02+lwF3cF9CtHnDiOeeF8MzPPiE168d/mxWe5T5hrEkBQpQfWuzVLiq9rqr/GMtoTkS0dW2kt5ty2WcmLyj6+Sz1RsybzQySZHTnI9cOeqM/jvmm5HnXA/TKt6pjsidmFaHyt51bo3Q81FB5T/MICY86pte9Jb7q9p1Xjg702AF21w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9f7kv6Wkz0CSsp/DEwspSpUA3zW9CjRbDXFsnLpQkKM=;
 b=ts91iw9qQJ2524bcR6k2AiBjSAyXNM9bEtfR/NJj83SRsTSH4LxG267iUzcEvtyWY3K6sQrR0LysiTkDFU3UOay3iSlXZxv/ZXDbOU8y+QnnqL44BnuTcoVOHkjHA7Krw7QvZSpVxr36NTgCw4OwKrMYjjlyPDzi7x0atx93D+/R/yqOavCux9hnrd+tlqapwdKlHrS8eCS0H+ywSxteqp9GvtU8P8x4R4jgpIzFPJSMK8mx59vixQjENfr4foYJEUNle3h1p+T8RvSj+xM3IUMvSYnBSiLXOpf5INMtOPEryS7tf904WMiFpn8aLFdY9zuKeOEzZKqi8uqCaOBSRQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9f7kv6Wkz0CSsp/DEwspSpUA3zW9CjRbDXFsnLpQkKM=;
 b=MKgdfMCH0+KLcrCSu3tu44iQlHw7bzCHp+pVr7i8HbQgblD9iQOWfhu55sjS5Gtd9Xp9D1w8lqOISCklpTi+rAPvX7Px+L7f5zQuS4r2S6CXCXaeDtdwzqz9BazJvGCZQzs/tfy35Cxh1CMW0OgMuxLGuhURNwKZuvHytdhr7GAyOvt6KhsQ1sqQcA8kqn4k3/MgXl1E0LL0zzxKUhALK79knSdi49MC97IXmUt6U4ubrsFU0nDXk/cLf+wkT8Lx2EYj6G3Kx74vow/2OMZmDx0qimMF4TiPl3pfqNF2LoRMHZmJiIuSD1JdPvdd9xYvIUy6JKJXQRGkpZ3G8wEmkQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SN7PR12MB8059.namprd12.prod.outlook.com (2603:10b6:806:32b::7)
 by BL1PR12MB5897.namprd12.prod.outlook.com (2603:10b6:208:395::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.17; Tue, 25 Nov
 2025 00:05:14 +0000
Received: from SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91]) by SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91%2]) with mapi id 15.20.9343.016; Tue, 25 Nov 2025
 00:05:14 +0000
Message-ID: <a7d939b2-e16b-4c61-a910-a9ba6663ed1e@nvidia.com>
Date: Mon, 24 Nov 2025 19:05:12 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 03/11] gpu: nova-core: support header parsing on
 Turing/GA100
To: Timur Tabi <ttabi@nvidia.com>,
 "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>,
 Alexandre Courbot <acourbot@nvidia.com>, "dakr@kernel.org"
 <dakr@kernel.org>, "lyude@redhat.com" <lyude@redhat.com>,
 John Hubbard <jhubbard@nvidia.com>,
 "rust-for-linux@vger.kernel.org" <rust-for-linux@vger.kernel.org>
Cc: "nouveau-bounces@lists.freedesktop.org"
 <nouveau-bounces@lists.freedesktop.org>
References: <20251114233045.2512853-1-ttabi@nvidia.com>
 <20251114233045.2512853-4-ttabi@nvidia.com>
 <DECBWUFEHV5D.3O0TH2AL775C0@nvidia.com>
 <fb673d50111ed0989ec8ba2a245e89eecaeb1864.camel@nvidia.com>
 <272631b2-77d9-461d-ba24-1df218afdc10@nvidia.com>
 <d900795e-bc56-44f9-9768-c22527e67f0f@nvidia.com>
 <4bd83208dad65786b386002e501bdcad36d76da3.camel@nvidia.com>
Content-Language: en-US
From: Joel Fernandes <joelagnelf@nvidia.com>
In-Reply-To: <4bd83208dad65786b386002e501bdcad36d76da3.camel@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MN0P220CA0003.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:208:52e::32) To SN7PR12MB8059.namprd12.prod.outlook.com
 (2603:10b6:806:32b::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR12MB8059:EE_|BL1PR12MB5897:EE_
X-MS-Office365-Filtering-Correlation-Id: 788476e9-6659-498a-9380-08de2bb64f29
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?N2NjMEs1bG5ZUGxpaUFLOFNwYWdodTltWmpaa1BjWUxvd3hXNlJMQU9GbWEx?=
 =?utf-8?B?M21MYnlSSnJMMXE1eG9aL2FhU2MxWEw3QkRwRzVQQlFWb3VJTkdpN0dZODIy?=
 =?utf-8?B?VDJkZWtkYXluZExidW9sZmRBZ25IU1E1L1ZtaEU0TDZLQTR6SS9aZElzUDRu?=
 =?utf-8?B?UWprckFnQWNIeWxsVVUzaWN3NVM5WmNWS1dvNkNkSXU2MUNJRks0WFNIekho?=
 =?utf-8?B?clVJMVI3ck1kVDNQRDVoTnFDdkJFRXJSaVZsVW11dy9hMzJEay95dXdwYVFN?=
 =?utf-8?B?VlI5R0NlTlZnd3RXN2MyZCtQM2Q3RVhFQTczblpkSUNPSmExY2x4eHZmbTJt?=
 =?utf-8?B?d25vVGdQSmRPOVFQdDdqam5XTVEwM1lVNHVHcjRnRW5LTFpBUXE4WFg1a1Fi?=
 =?utf-8?B?QWk2V0Y1MVdkWnRrK3FyM1JCb0hiSFRsMThkWTVLSC9mWng3bFFkWlowWWNm?=
 =?utf-8?B?QWJoUDJuUUd0M2ZiUFRhWE9ySjUzWG5VazBpUDF6dHFyWHkxUDlLazBWQUtI?=
 =?utf-8?B?ZlQva3hTenNLeU85K1FsQm5ka2EyVTBZWjdMRy9CMlNHOEw1M3AxSzAyQTJI?=
 =?utf-8?B?RjZuVlYwZlc5QW94eWlCeUR4T3p1ZXZodmpQai9BL0VVR3dVT2FPam02UDJ0?=
 =?utf-8?B?Q3JjZWV2cE5XSEhMMGhTWTlIV1F1WHZNN3JjaHVOaHlPdUhpQWlaUk9pQ0hr?=
 =?utf-8?B?NGc4OGFKOVFTakdDcHVrT2VOY3Y5QmxCWnMwZmpUbDNldXNkRDBKV3hoUDlH?=
 =?utf-8?B?QlhYcXNmYzgzWncrZXYvMEdEcTBRbHdqVnE3QklLVkRCRHptUnNMbVp4RzND?=
 =?utf-8?B?R2VJWEZCUUpuck1qQmJQL3o4SEpia2lMbWl3a0NlQmJ2WjRtNGVxWDJVUVdO?=
 =?utf-8?B?QWk2a25aNXFiKzlYZnFEQTlyQklaUTRra0puK3ZnTkt1WkpIQi91OVlUUHJX?=
 =?utf-8?B?bE5vQkpHVlAvWnc5N1BBTUNUZnhHZ0R5R1pkdm54dkpLcDBpOEFxa1QvT1FE?=
 =?utf-8?B?bUpiVzdNTEdwS3dNWStHQVkxZFpBYVdjRmsvSUZtb0VNZ2RhdjJsbWRPZkR3?=
 =?utf-8?B?RDdzdE00Vi9GQllmQkIxcVBtYXNKUkwxdzc3REh4SWgwZmZ6NzB2UTlGR1Rs?=
 =?utf-8?B?ampJcVFvOHlVQnRXc0dHWVRwNkR5SHlpaWNFQnYzeTFTbE95dVdiT1R4VzNp?=
 =?utf-8?B?TTJ4bWJNeGVTMXRqUS9FUFdGT29zeXRTcWxFekxodFN2S0d3UVcyUG5XQUgw?=
 =?utf-8?B?YXRzV3RpajF1ZlRlYlh4QjdiWllEaUZtZDcreE54alZkM01NVUR6RkJSSk9B?=
 =?utf-8?B?NEl5UWxTU21oaDNvRG9xdFNURTlrbFowdTdjRGNVQzRUMmZvakk2eDY0NWt6?=
 =?utf-8?B?L1JZRGI0RmQ1Z3FDblo1Sk5uSkl4NTE3OG1JK0hDZ2NxM3RlUmFhWWdrTGJQ?=
 =?utf-8?B?VGc5TkZ1SXIrSkhNTHJYaUNNV2lieEN3S2tJdml3cjkvMGNlMjVsSDRnNWtE?=
 =?utf-8?B?a2wwSzFzVkJBUktjWFE0QzlIWW9QU2x1UVp1QXEyeDREVDVBZlVXTmZhTFNY?=
 =?utf-8?B?TXZWN3JuaEFCUFRNbU5KbEFVNnAyU0YvZ3RXbG5QZXErK0RSeTZ0OWttZ0lt?=
 =?utf-8?B?OXZ5SlQ4UjVaVmtTSFhXeXVPZHJVVE9aNktVWnBZU0lpNDdPdVZQMnFnWE9h?=
 =?utf-8?B?OCtkNTd1a0IyK25iRTFzTHRGTjdSOWpzZDZrcHBBbkRMNlVXZEptV3BPRG9N?=
 =?utf-8?B?TTJCZnd2MGg0eUtKdk1KWVpQQ2ZQaVc5Tk5PczlEZUxiV2Z6cGsvY3NUYjFL?=
 =?utf-8?B?b3NSdnkzU1A1R3VXcEE2QjhkdGVQWWJqLythb2JIWEpiVWtwK0o0bTdSUkdn?=
 =?utf-8?B?QWlNVVg2TDBPcTBYSUFWbFUxNEdpWEdMZWtjekJwUXAxSWVFb0JBdnR5S2xi?=
 =?utf-8?Q?Z4fw1KMUGysolHkr/KewjezjJiBWrB2i?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR12MB8059.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WGRCMVA3aStlSkM5cnAxczJuUTErNXN4cnUzSS9leTkyckIwUHBVSUdmSS90?=
 =?utf-8?B?UStKeUd3T1duQ21rNndwcGNGWUIxWktJT05LZlFvaTFlMHR1VGhCTkNZZHBZ?=
 =?utf-8?B?NElPbkQ5aEJCTlQ2QnF4b21mcEV3S0V0ME11dDFrZ1ovMUpMNWkySEwrYnRB?=
 =?utf-8?B?Tm5JMFlFSXFFb1RIbG1YL24rcjZYa1VZcEdCbDVyNWVNY3dZcFlwMVcvR0lO?=
 =?utf-8?B?OXQzbGlHbElBVFluVERtMkY3MC81WHZBMWw3c2llcjhHZFVEZGwzU2N1R25B?=
 =?utf-8?B?YVhFSnJwc1RuR1pFemQ1NVBQRkQ4VjVqVzdYUzBqcHBIeVRnTmxrMjAweEw3?=
 =?utf-8?B?ZkpHU3lSZ3ZCRUdxblZ2NnBUMVNxMjExbTZFYnFkTUhna3dtd1ZhcGlKa2RW?=
 =?utf-8?B?TmxqSmNRVDNTakYxUElyVDlnZ2RuVUFZYm9tcVlLcEJGUnVvcGpTRytUQWps?=
 =?utf-8?B?R2pHSDFSdUNBOXpzSjFNN3BSMTlZVFJCZ1NLUWtITC8xazRYaGZORHNYbVl6?=
 =?utf-8?B?K0p1WFYxcmFhT3RyN0l4ZVJKRGJOYUhhWUxQYWZPcTlsZlJxT2hyR0JTOFdR?=
 =?utf-8?B?bk5VR3pERUcxSllKS25heU5LdnpMRzN6UWxNbEtkS3RkaEVTS0RKYzRnaXBp?=
 =?utf-8?B?QmMvU2hsU2VLREI1TkdOaHUxN29HVC9jYVVELzVvQVBaSGZqdWJjL0JFNEhQ?=
 =?utf-8?B?MURyOVlRR0huOHRhNkIzbS85MHN5NFpaSXV5SmNHZlVVUVlIYnVUenVzZFZx?=
 =?utf-8?B?MnlmZzU4dE10QnJlQTJ0NTVST3NvR3FJcys1R2liK3pTaC9IVnkvRXU1UjY0?=
 =?utf-8?B?cCszOWxCQWM0cXlLUmgrTlZlYmFBSXZnc2VXNnRNMnFxdlVLaHhaQXhKZVk4?=
 =?utf-8?B?SENHNklXV05Wd2VMVlJoWTRjRnhuQmFmV3BhRThYaXBJbzBLVE5pWEVSd2Ix?=
 =?utf-8?B?WGw0cXpzMGpHZTI5Q2dMZFhnU2hEMEQ0TU9scU1tdzVtK1dvY1RCK3EvSjRG?=
 =?utf-8?B?OTIrb09ubGhQTExIam5lRjA5UmZrVkRuS3VNUTFhZUI1dkZRa0MrMzdQMjN6?=
 =?utf-8?B?K1NJRysrTjZDZlBUaTc0Kzk2V0tOZ2hDcmI4Sjk1QUJxcmpJNzVtRldzUmx1?=
 =?utf-8?B?bXdKTHRxeGFZdUZtdGE0QURxY2I0TU9XcW1GQmVxQUFaNUtZeFoyUWlvbWp0?=
 =?utf-8?B?NWxKRit6NEZxWFc4dnlPTnFJb0x4TDZKQlREQUErVVVvNENWSHZCa045c2dQ?=
 =?utf-8?B?c1RYVVZqbXo3emFNQTdEcmdMVVU0dXdTNEU0ZkVaSWc0TmFzMnR3NVNxWnc5?=
 =?utf-8?B?dkdpVVpMZDZNUUVxQnQ0OWFSMzMxd2MrS3lhNFRQMG8xUVJEdjhrdmcrQzFx?=
 =?utf-8?B?TUxjejRTNEJsTWRQY1JxNTlBS0t1WlhWbk1pdGRrbm9WRDFpZW4rZWFEQTBj?=
 =?utf-8?B?OFg1S3Q0czl3QkhxRkpwSytoQ3IyUWhCaS81aGR3dVdBbDd6MDE2RFhZL1dR?=
 =?utf-8?B?NitNLzN5d1VxLzlaSWh2enJuK2pPKytOcHAvL2EzSXN6NzFTamtpV3hZK1B4?=
 =?utf-8?B?LzE1TWlmTExvdHFxN2xuWi9hWnArV2V0ckViaUxQY1BSNW5HajRMdVlGSHBi?=
 =?utf-8?B?OC9NTm1vaUpoSHI5L3JTdmV1ZnVIdkF1eXBOdUFyeVBRMDZPZmloTUcwb1NP?=
 =?utf-8?B?TDdyVXZQTUNENXIzR3d4b05KNEZWUC9TZmRwcGhNU1ZuemprNTJaSGpwMFdk?=
 =?utf-8?B?QVN5SVM2T0xUNDNab3dubERZYlBxQ1NadmNuSmpMOTJRK1FJZEE2QmJDQVQv?=
 =?utf-8?B?dWtJNVV0V1dnZzJ0dXhFNXUrTDNDcFJOMWllNThMMnkrT3E5Q1ZZalo2Y0Rw?=
 =?utf-8?B?MGQxa1B0eC9LTCs1L1pDT0VyUStWdys0OFBUbEpaNDVNUXNnNGNtNnM3bS9w?=
 =?utf-8?B?WWFSVkJNZjM0TnNTVjNlcysyS21VWUJ2bmlxbXZ0TjlWdktVa3Jlei9nRVF3?=
 =?utf-8?B?YUxDNS9vTGRHOWFxeEZlK3oySnd5aEhDUTM2WEZJOWU5QzdoanJrb21Zb3pR?=
 =?utf-8?B?TXd4YXgrL1MvcDlCSTVwS2N4ai9ma09hZWxydmdibjRTaVRtZ1NDUDcxM0NH?=
 =?utf-8?Q?scY3epmmzcYofMgWK5XpMXsRX?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 788476e9-6659-498a-9380-08de2bb64f29
X-MS-Exchange-CrossTenant-AuthSource: SN7PR12MB8059.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Nov 2025 00:05:14.7718 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aVWs8nQlB5JSGmjd0uu+MXMIbngFmIRFIufeMsR9hmL6VizAHgZLVUj8ZXZ8fUIQAry985DudEUGulvjxGB+HA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5897
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

On 11/24/2025 6:47 PM, Timur Tabi wrote:
> On Wed, 2025-11-19 at 15:10 -0500, Joel Fernandes wrote:
>>          sec2_falcon.reset(bar)?;
>> -        if chipset > Chipset::GA100 {
>> +        if booter_loader.flags() == BooterFlags::Secure {
>>              sec2_falcon.dma_load(bar, &booter_loader)?;
>>          } else {
>>              sec2_falcon.pio_load(bar, &booter_loader, None)?;
> 
> The problem with this is that it conflates (Non-)Secure IMEM with using PIO/DMA.  I haven't looked
> at GA100 yet, but it's just coincidence that platforms that have Non-Secure IMEM sections also don't
> have (functioning) DMA hardware.
> 

Sure, I am also Ok with the chipset check happening in a single place as we were
discussing in the other thread, and setup BooterFlags there (and then check
here) to say that DMA load is needed.

Thanks.

