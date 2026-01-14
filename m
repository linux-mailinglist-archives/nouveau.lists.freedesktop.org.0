Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 62F60D1C3BD
	for <lists+nouveau@lfdr.de>; Wed, 14 Jan 2026 04:19:16 +0100 (CET)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 99EFF10E5C3;
	Wed, 14 Jan 2026 03:19:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="H9jkNEOH";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 7986044CAB;
	Wed, 14 Jan 2026 03:10:44 +0000 (UTC)
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1768360244;
 b=I0Cy9KvtZn9L4ViIHoNKWc5cYROtgqERYtaUY27n0LcUv8RytUULSWcptV6LSzomUpwbH
 NJTQDXcB2O7C5gTHL2SULkovdy57KP3MGTPExjO9h+kd5vFQFLcKIJwQ3Ug3gXBlLvR67zo
 OjQijGKfMNd4Uqvk9Y3pe+jEVF2VuDb7ncmCvkwguhTDaZwHVqZZsjRZOpLNERMj2WYkLXA
 h06yvHjgZ8sJEWd6VXQsG424KLbepejzWuNDodf3nUTMLlgS/Yf3HLlg5U9Yx+vPAwGizDo
 SsWMj1wAbh+fjCfQGq+l/1ogc/LiKAJzBgXjHqzg205797lpxHakPVbEazPg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1768360244; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=bsCo7yBqtaX73aM7GwuhQJP8RNSiiVXpBU0FcrGIRAU=;
 b=0/L6O6vfdMCG8PVCYirsYYnHtQ3C2wl5fkVHSCq3YUELTF+F46dbm1Z77yzGLOhWy4ZA+
 n+3XWeVzFPHf4/T9g2Vh9zZLaW/r/pCiXUc3mHQepiaiEB2Et+TFeDA9m43Hf8e/GWEgPEq
 knIcoFmxVsDrFL+pX34rjQ+MC6a9XGDpWocoqszBeKuc8Qifx3/ENqf+zLgPgd7rZuXFBko
 yo8fZi7TP2RTkUxqVqwNEC/qWBdgugzoQfV23482DhkIlkPBSvEGbxm2czQ8VVHvjlaB6mv
 LXvbmbS629ObJnjX4cEa/NMFxwBIyp2BjUiF1cq72k3MgL6A7P98FC5sJw8A==
ARC-Authentication-Results: i=2; mail.freedesktop.org;
 dkim=pass header.d=Nvidia.com;
  arc=pass;
  dmarc=pass (Used From Domain Record) header.from=nvidia.com
 policy.dmarc=reject
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=Nvidia.com;
 arc=pass;
 dmarc=pass (Used From Domain Record) header.from=nvidia.com policy.dmarc=reject
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id 60E3F44BB2
	for <nouveau@lists.freedesktop.org>; Wed, 14 Jan 2026 03:10:41 +0000 (UTC)
Received: from BL2PR02CU003.outbound.protection.outlook.com
 (mail-eastusazon11011070.outbound.protection.outlook.com [52.101.52.70])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 23C4F10E002
	for <nouveau@lists.freedesktop.org>; Wed, 14 Jan 2026 03:19:11 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uHj8aZlT12tJz/jCYaiJFdkRiBuD3ueq6+LUWCxdr9KBYvUdvGQVgKUkz0moz1dEA2MvXcnz75V3lVqMGkytVQ9dCqBVkirCaaeriwrum8y+nDw5jrwBcd64S1cMDw77LOyHN2LABOgRPud7pxsPhkQV1muHV06l/FjWPOflilGSwQ0XMvDgEEwoa+Qo2DYL5pmpQhjdm2Y0fqxaGvLVWp9ZEXRS3Ep8YkzPWbciizzUxJdSF9kjfQ6xTbvPHXKZr9fgUzu45WdVY0t2bIcrCJ0FeHbptmf+T/ilMGv6j3QQjDVAKJKtyDctXvIw/vV7yjrXNdqcVvS/ZL6IwgXUYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bsCo7yBqtaX73aM7GwuhQJP8RNSiiVXpBU0FcrGIRAU=;
 b=KeKVwStUOw7BE8nLx61i5mbuOxpr5bKWyEpDDm4KYYJjMHYNjt4qXN1cvculIDoI5311JXOKXEier3EuQeNZ5OyKPDofcAIgCnkGQ7j2XezZwKYBQ79DOznD5cIBr8bX5nHhaZLVvMV5pskMPFYZrRsI3TPyRUFtvtBCc0aL2DG1Jtcd586ot2U54L6s5M0aniMbTc+sNgc5Lyb2mMCq8zbK1zsV5bFuFbrf5ANHo9uTkDahQyIvjTikcrJl18KTzb9aDFAeMDH6DgYp8dsTDENpNZ7IR+BUDAiwc/5iLhuTEkHzbm4G7xHZ48SWjRqsfvJrUxgfBYvzlUM6ht0ZKA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bsCo7yBqtaX73aM7GwuhQJP8RNSiiVXpBU0FcrGIRAU=;
 b=H9jkNEOH5lLUC6UJYjs/IKyjOmxwxSZLtjoeL8YQmzOeWzMy2wzNN1KbU/gkCpRC8iSBCfY/CNzCmikNzldzkYfhHK9iGUoOwy3cBzscBECM3JPCZZAmnKhKxaLIKhZG1E2VU0RL4gkp4/F4IcdVwLqQF1Z6sJgJqzcd/9hSqSGkqsrCWGK0r8HcyIuZZzn2TWhAxnRfsfmiUYM7WZ31SvTMTHYN8zEE1OVbhTH3o2lYSV0lhltTcRE/Uz8mzUIO9nElwt2CIPFAt50ZB8GT7sxi4pIemMMapeHSOd7dfQ0dit7HfEdPpai5aV60VCX08PitNxfEX6XMDpeKzz2Wpg==
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 MW4PR12MB7120.namprd12.prod.outlook.com (2603:10b6:303:222::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.5; Wed, 14 Jan
 2026 03:19:06 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%7]) with mapi id 15.20.9520.005; Wed, 14 Jan 2026
 03:19:06 +0000
Message-ID: <1dde9813-1084-4174-90b8-d9910309f530@nvidia.com>
Date: Tue, 13 Jan 2026 19:18:55 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 09/31] gpu: nova-core: factor out a section_name_eq()
 function
To: Gary Guo <gary@garyguo.net>, Danilo Krummrich <dakr@kernel.org>
References: <20251203055923.1247681-1-jhubbard@nvidia.com>
 <20251203055923.1247681-10-jhubbard@nvidia.com>
 <DFNIIJH106EO.35SYTYVJYK0N8@garyguo.net>
Content-Language: en-US
From: John Hubbard <jhubbard@nvidia.com>
In-Reply-To: <DFNIIJH106EO.35SYTYVJYK0N8@garyguo.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BY5PR17CA0036.namprd17.prod.outlook.com
 (2603:10b6:a03:1b8::49) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|MW4PR12MB7120:EE_
X-MS-Office365-Filtering-Correlation-Id: 124be0d2-d0c2-41f8-1d08-08de531baca9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|7416014|376014;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?SW9MRFRpSDc4SHJFTE5KR2hTUE9JMkxESmVtOWdlZ0NIS3ZXNDdTbXRkb0s3?=
 =?utf-8?B?Ni84ZGdBc2Y1YW1QMHJ1QTBRY282N1dTV3I2YWZuSDhuTUVBYVlmYkhOUUxs?=
 =?utf-8?B?bTdCbWVrVngwNS8yam9qQXAyY1VZM2IxV3FtdlJVNHFFVkp4RkwweUlRMWVC?=
 =?utf-8?B?bHJzUDFqMHN6UmV6UUR1T1NXZDRFZjIyVFkvbUcwOEFwMVNaVE1TdlQ1Q29M?=
 =?utf-8?B?UUVRVGllUng4NzhibFhWcE5lMkJkdUk2alBQM3RxQjNjbGUwV203czRhbCtQ?=
 =?utf-8?B?Wnlzbm9oQXJoRWdhMXArMmxZVjgyYktoREo1emprUzFnSmcvdVFnakY2S1BI?=
 =?utf-8?B?MFczVWNHL0k3MEtDSU9BSzJLbW5ycHAwWGhEMzJoTThMRXRscE5qVmV0cVkx?=
 =?utf-8?B?UTJpNXg4Z0RzbjA1ZkVSZnpSVjB3QWxWZkd0dnZqQS84Vy9WUzJpbGlaWVRJ?=
 =?utf-8?B?VXNMa1pMaWtLT2xTUzNOejVBeis0Vmkvd0dxdFMvUkYwelRLbVMyeXRSSzZa?=
 =?utf-8?B?Z2J0ZlJRYUV6T3ZMNVNnMk9XYUMwajQ5a2QwNGVCSm1weEFOMGk2UnhOMGVO?=
 =?utf-8?B?WEFUYzJnS3lGYUc1Sy9wY3RnM24xQkVweHRwcFpNMDhxMWhUN2ZaUVFPYzBZ?=
 =?utf-8?B?YjhoZEhwdHZVaENzdUlHbEtJWFE1TjlCUitCUjNhT1gvMTF6Q0VjcWhjcmVW?=
 =?utf-8?B?Ynl5Ujg2YjJyTFViRy9vVUFTaXk3cDdEWndGVExjTTFVaXZwNUNNWUQ1ZmhY?=
 =?utf-8?B?RVk4TlVmdVRuM05VSk0vQWpKVzI3TUVtRnJiUUtkdzJ6SFpBMkJia0lhbWJB?=
 =?utf-8?B?VC8yRDhjTGVqV1NUaGFKZU0rM0UxVTNxYXBNUlhQd0tsY2pKOGNCUmdESlZy?=
 =?utf-8?B?ZThoWjZUMjJnakxEU0dBNlJlOUVTQmx4NlZqdStHOHNaWjNXbFJIQVFDZW80?=
 =?utf-8?B?Z2NTMUtNUEdvYUNIT0ZLODFKUDh6dFoyVHVvdWp3TXJnRElZMEl6UFdaS09B?=
 =?utf-8?B?Y0RGOWk4eFpDUG5vdG1PQjV3R2NEd1VwNnhaR1dEd3cxQVlicXdlMk5HWXk3?=
 =?utf-8?B?SEVNTGxSdjBsS1hBRVpZSlczZzMrL0V2RTVtUFlEeEp0aHdNTCt2cE16MFdo?=
 =?utf-8?B?cmJDNlNPM1NZN3hld1BWR3hYMmdnNTczNk5wQStabW1kZDU2UC9DT1FLYW9B?=
 =?utf-8?B?d0lmMC9XMy9ERnhLeGtWdFJiVjBNelJ3bXdXbm5FMkp4a1ZuRW42MGh2bDN6?=
 =?utf-8?B?aHNKallyR3hUZmhFTVBmUU41UWpzanpkZ1BwVEVPWnVGL2VMdEt3RE8zVGVM?=
 =?utf-8?B?eDBRYTl5S0RXVUhzV20zU1BDZ0RxSlBtTzlieGRoaW5ieUYxL2F0NFlBWU56?=
 =?utf-8?B?ZHJocUh6VE1DdXQ2KzRSM3lNK002NFVwb3RhQUU1QlVmQTA3UGFiOUFNWk9N?=
 =?utf-8?B?YnJvalg1NTFhMkZvNnQ2VWcyU3FJL09TMmFDdWF4dTh4Vks2YUNQRDVtMHFv?=
 =?utf-8?B?dzJBRXU5d05JSjh3TW9SMEhzMVgwdTVIZWV3dWZOVzdwdUMwcEY4VWVFd0NS?=
 =?utf-8?B?UE9NNTZZM0dtVkNnSnFZa3dCZ0RZOFpWVjdYNG5XdzNJcWRuVWpXMWJCdE91?=
 =?utf-8?B?bzFoVjZMVWxGN0NxTnl0bVh3RjRLdy93YlVYSXUxREcwVGRQcVhDZURoa1RS?=
 =?utf-8?B?UU1xMFRxTCs4QjJXUWhPWmRnb1JnMU8yeW5tZ2FXVmxPSzNyN2FSK0FHQldJ?=
 =?utf-8?B?bEdEU2swYkZmVmRiUENCd0wrMldZeHVLZTZ1RGREVVVyOHpac1RCbkVCQ3l4?=
 =?utf-8?B?MWFLVmtyOGxJaEpJTDVkQ3U4SVlwRURYQVd6NTBVMnlxZFFNeG1VMldHMElG?=
 =?utf-8?B?ekVIKytma1pXZUZ0dTJsMzhpb3BWSTNhR2tBdjJSNEc3R2dCTWNTRXByRWpL?=
 =?utf-8?Q?yHTwRm9UUV8FG8wT2FLDhbYzGLxA9gVa?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?RTg1Lzg0dnQyWUdvTmE1UjFrY2wvU0d2b1VpTXV6R29vVGtFNXExQm5WckQz?=
 =?utf-8?B?Ui9pWjYxa04ySVc2TjVkczJza3E1UmZlYUhzOGJlYTFidklkZGtpR1dEWnBp?=
 =?utf-8?B?NVRnYlc0M2tBay91VFFRTlFKRVBseldROVN4dHNoa2dQUXFqQVRpTjVISjBz?=
 =?utf-8?B?a0NiR1YyM3d6S2hDclhieXpvNFgzZTBWTThYOSs4TnUycXhONi9uckFUOHFp?=
 =?utf-8?B?ME1qV25GaFFVeHJEWk5mREEwcm5vZkhvSDRReENmMHRHZ3dKaWlmeUtvZGZr?=
 =?utf-8?B?TGJGQm9jRGdVaEs3bUxiUnJrNUw4eHpMWENNNDUwSTRMZkNWajhOZFNTWUFN?=
 =?utf-8?B?M3dJT3VXdkoxZitGak9NczAyTktjK0ZCL3RieTFhOFBKMGFLZVk4TkNiMkx5?=
 =?utf-8?B?TzY2RmlyT2x5ek92RXRMdlJQYjhCWGJCYjBaQVQ1WE5DODVZaEdnWEVUOVB2?=
 =?utf-8?B?RDJsalBMamJWalJGanNsbEN2eXRhSG81NlBsTW92ckZGaFY5eVBnWTRleWJO?=
 =?utf-8?B?c1dXazVQVkxCVlh5QUJ6L2FsbldTOUVJTjhqR1Zobi9xb3crRnR2dkJoQkl4?=
 =?utf-8?B?MW5hSUt4dUQza0hkSWc3YXFHNjh1NGc1UlM1SG1aVGZzTTNxZmtnOGZJQXhw?=
 =?utf-8?B?MkE2akYxY2xJUlhYZjd3ZjIxVXhCMlBtbFRKZjdjOHdMWGFOSk9UVmE5SWpZ?=
 =?utf-8?B?SDF2bUZ1UVZudHhkKzVrOFlsa0RsTC94QnpZcDFXUUxZdHRRQXFiNmpmd29x?=
 =?utf-8?B?MDJzWmZmSFA3VjRPTFlWWmprTUJQMUZ3cjNtUXpTNlVtYVBldTVBcjhKR1BD?=
 =?utf-8?B?YnMrNmRrd3dSRUV4RGFjMmU2RVVqMG9LKzh6RlZtSnZSU2NXeVY0T3hpakRR?=
 =?utf-8?B?RWVZK2hDODcxTGxBbVEveUVySm42WjJlUE5MTWxNLzdGQmVSeHpKbUV2VElL?=
 =?utf-8?B?b0t5UHNmdlN2cXpPQ2IvUGMrSVVEYldPSmpYMXdWUkdUWEhMOFRxUDQwSWNq?=
 =?utf-8?B?S0pOM3kzc3k4blJZUnRQcXFOSzZ4MWlWQUh4aWNCeWxwdXVHSERPYW1MUVRx?=
 =?utf-8?B?NWYrWkl6a29pa3hsdlVNQ2lDVWdYS1J0NlBXOGZ0dGhyR1ZmMVBQSktRb0I3?=
 =?utf-8?B?cmlwTWRvUHZiakwxZ1VQaHVmSjhEdGhNU3ZaSktJaTFScVV0bE1yVEY0Sk1p?=
 =?utf-8?B?NnozRkRXcit0bzVhQlh6cVRxQ1YveFMvZDYybDlZaWcweCtINFhFSkFXNnFw?=
 =?utf-8?B?OUtsNHNnL2JvQUZtUTVvckFCTllZenRVRjI1L0ttR2RmVHEzTFlSK2s3bFBW?=
 =?utf-8?B?SkN5TWRwVG5WUWUxczI2d051WTBXbFQ5YkdXdmJ4L2QyTFVrRkdobjF6VzJh?=
 =?utf-8?B?dHYzZ2xwMDhGcExSV1UyS09lYkFXc1dEd2NXZFlPTWVwU0Nrd1hQbTlJZDZ5?=
 =?utf-8?B?aEo4OEtoSGZXbDV6YzBNWHltUzRJSWV1YnhQV2xGeFlXUEFVdXpDZXFDUjhx?=
 =?utf-8?B?TkpCZWJJa1RGK1lDd0dHeFRpM2JOOHZ6N0EvcGZXdU4vMUhuZ2RWSkhtSWJ3?=
 =?utf-8?B?d21TeFdITktXQ1M2MVBHNFJWbkhwOU5rUXVvWTRpUGF1WGJTNTJZUTNKc0tD?=
 =?utf-8?B?UXNYR1JISUlxREU3aGlsTFdtc25pa2RHQlZEVWFSMjcwUTJGM0xsekxvM0Fo?=
 =?utf-8?B?bU42TVpVZlJ1VCsxSnNBcXAzTFpURlI2Y0JoRk9FY25ZWDVqRndmVWZSODJh?=
 =?utf-8?B?NjFyekowb1lYaUJuUENUTyt4ZWhwcWxtWHNEVWYyOWwwU1I1MXJaQVlpZEJX?=
 =?utf-8?B?cWRLbEl2VmpRZ3dneWEzdHBST2VKdS93RGNVMEYrd3lNQ2ZuYmlTa1F5YTJi?=
 =?utf-8?B?Z3ZpK1p2RklnVExhVFVzZk9CSDgxS2JqRXdUQnQ0NjF4WnVNekVZazAxaTlU?=
 =?utf-8?B?OVM1dDZabnErRjk5Sit3WFR1bUZIK1JwN0hKQzRFOCtlMzFwSm11OXNGb3Yz?=
 =?utf-8?B?K0FSSGVQdlgwMEtTV2g0RVNFbXdiZER6VHFQSmxFcWhnQW5NaUtzOW5UMUF1?=
 =?utf-8?B?bkpMaGtCbUJPdWpLREVJMmVjQ3lJbVk3MzBGOWFrcitpYjN5S0REYzlmSTV3?=
 =?utf-8?B?V3F5cTRQM3B4ZEtRcUl1TWgzSlR0UXZBVURJKzc1N0laNkt2aHM3ODlISm1P?=
 =?utf-8?B?NjVtTTdtSGhQTXBya2pQOWJQVG9hNE9LenVIY3lQTi9sUGk1anJiVTd6QzZV?=
 =?utf-8?B?UURiSnkvMVBudzZQQmhYTHZIaVZZTk0wTE5FUEg5U1k1a0hERkR0b1NOVGQr?=
 =?utf-8?B?UEM2aVpiSzlUaVFEcnJGbkFMckpyU01VSHlzd2VFcU9tUFZZN21wZz09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 124be0d2-d0c2-41f8-1d08-08de531baca9
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jan 2026 03:19:06.0705
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 r+oYMBnTF7tMJOsYG5nJc7l7Fpg+3Gzr9kIT8mlN1Cd9C6tF2oMQzk677QtrQbcM3BNYoPaRq9lEIewqALXMtA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB7120
Message-ID-Hash: QGY2P353XA2NQ74DRVW3SXCEDJMFWDYU
X-Message-ID-Hash: QGY2P353XA2NQ74DRVW3SXCEDJMFWDYU
X-MailFrom: jhubbard@nvidia.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation; nonmember-moderation; administrivia;
 implicit-dest; max-recipients; max-size; news-moderation; no-subject;
 digests; suspicious-header
CC: Alexandre Courbot <acourbot@nvidia.com>,
 Joel Fernandes <joelagnelf@nvidia.com>, Alistair Popple <apopple@nvidia.com>,
 Zhi Wang <zhiw@nvidia.com>, Simona Vetter <simona@ffwll.ch>,
 Bjorn Helgaas <bhelgaas@google.com>, Miguel Ojeda <ojeda@kernel.org>,
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>,
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 nouveau@lists.freedesktop.org, rust-for-linux@vger.kernel.org,
 LKML <linux-kernel@vger.kernel.org>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/QGY2P353XA2NQ74DRVW3SXCEDJMFWDYU/>
Archived-At: 
 <https://lore.freedesktop.org/1dde9813-1084-4174-90b8-d9910309f530@nvidia.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On 1/13/26 5:57 AM, Gary Guo wrote:
> On Wed Dec 3, 2025 at 5:59 AM GMT, John Hubbard wrote:
...
> What I would do is to provide a helper function to be obtain a NUL-terminated
> string from ELF:
> 
> fn elf_str(elf: &[u8], offset: u64) -> Option<&str> {
>     // Note that you have a more efficient `from_bytes_until_nul`, you don't
>     // need to iterate yourself!
>     CStr::from_bytes_until_nul(elf.get(usize::try_from(idx)?..)).ok()?.to_str().ok()
> }
> 
> and then you can do
> 
> strtab_offset.checked_add(name_offest.into()).and_then(|idx| elf_str(elf, idx)).is_some_and(|s| s == target)
> 

OK, will do. (I keep thinking we have found all of the older places
that should be updated to use CStr::from_bytes_until_nul(), but still
not there yet.)

> 
>> +
>>      /// Tries to extract section with name `name` from the ELF64 image `elf`, and returns it.
>>      pub(super) fn elf64_section<'a, 'b>(elf: &'a [u8], name: &'b str) -> Option<&'a [u8]> {
>>          let hdr = &elf
>> @@ -298,26 +316,7 @@ pub(super) fn elf64_section<'a, 'b>(elf: &'a [u8], name: &'b str) -> Option<&'a
>>                  return false;
>>              };
>>  
>> -            let Some(name_idx) = strhdr
>> -                .0
>> -                .sh_offset
>> -                .checked_add(u64::from(hdr.0.sh_name))
> 
> I think the change is making the code hide the error when ELF is malformed. The
> old code fails early which is arguably better?

OK, so something like this would be easier to debug, but I'm not
sure if it is as Rust-idiomatic as it should be?

        // Find the section which name matches `name` and return it.
        shdr_iter.find_map(|sh_bytes| {
            let sh = S::from_bytes(sh_bytes)?;

            // Compute the name offset; fail early if the ELF is malformed.
            let Some(name_offset) = strhdr.offset().checked_add(u64::from(sh.name())) else {
                return None;
            };

            // Get section name; skip if we can't read it.
            let Some(section_name) = elf_str(elf, name_offset) else {
                return None;
            };

            // Check if the section name matches.
            if section_name != name {
                return None;
            }

            let start = usize::try_from(sh.offset()).ok()?;
            let end = usize::try_from(sh.size())
                .ok()
                .and_then(|sz| start.checked_add(sz))?;
            elf.get(start..end)
        })

> 
> Best,
> Gary
> 
>> -                .and_then(|idx| usize::try_from(idx).ok())
>> -            else {
>> -                return false;
>> -            };
>> -
>> -            // Get the start of the name.
>> -            elf.get(name_idx..)
>> -                // Stop at the first `0`.
>> -                .and_then(|nstr| nstr.get(0..=nstr.iter().position(|b| *b == 0)?))
>> -                // Convert into CStr. This should never fail because of the line above.
>> -                .and_then(|nstr| CStr::from_bytes_with_nul(nstr).ok())
>> -                // Convert into str.
>> -                .and_then(|c_str| c_str.to_str().ok())
>> -                // Check that the name matches.
>> -                .map(|str| str == name)
>> -                .unwrap_or(false)
>> +            section_name_eq(elf, strhdr.0.sh_offset, hdr.0.sh_name, name)
>>          })
>>          // Return the slice containing the section.
>>          .and_then(|sh| {
> 

thanks,
-- 
John Hubbard

