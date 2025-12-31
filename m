Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D4E8CEC864
	for <lists+nouveau@lfdr.de>; Wed, 31 Dec 2025 21:06:26 +0100 (CET)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id DD76810E8D3;
	Wed, 31 Dec 2025 20:06:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="nxOZGmH/";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 5F31B44C66;
	Wed, 31 Dec 2025 19:58:23 +0000 (UTC)
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1767211103;
 b=WzzDQboghYFShkOxVdMOjXm1mnlsKZZtj2BclYlVFe1BrsZlnJWF+UI8dezbJvpQjVyGQ
 Wc8sa1VQcaL0YZltn2h4m/9VCQ94zrE87CNOz8Yfehjq5Ideg0Z9Dae5tXFpqTTZJBjPzAR
 iPd7uKn1kKz6c1ijpQb/IUIBIPgiqF3Fzdym8s71W49A+EZ6QlPzhGdLHzJEyCZ7JWWcx1J
 i6RRdscLQT92wvyXUcG8SmxxGXXMJOHdHbFFOmGFJbKjiVSTcgS2Ygg+ZTeYanBL5vIUb+4
 bMHVruMjddiJsaGctyr6jXqzAKC7Fa/BB4AY1BX6TMIPL6G02hiV9lGp7yBw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1767211103; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=+X8OmW1g+h1C0hNXrLcy0Pizz4bcXZinDBpNxqifNdg=;
 b=Yg/53K6uBnDSITlLi+Keea0buKro16ApSpweHtr+tZahwdFrr2PA/1ZxcwvKWP+uolqqa
 2gK1tl7tmE7g+Be5ZzXaV/eQR3OTsN8QIy5/fSub95qJ3qH7DVmAVaHoibnUDemWffFLdCn
 cCN50iDZxR5vLSesNePSCkvA11EgdsLlZtPE/ymXmx/KkddhNtXbVnWjUhMkb42psD8WvSV
 0OV9Z534+vFZNVa3YjSPwK2iAzn37AHsRnIHzBW99Rm8ml/qlDJ5Jpqyh+k7SrarY0KE5as
 yePN9kVgN7IEduKERdhDriuYMMQCutCnNmoCbWm3qWiFTKSfZFahwTiePHkg==
ARC-Authentication-Results: i=2; mail.freedesktop.org;
 dkim=pass header.d=Nvidia.com;
  arc=pass;
  dmarc=pass (Used From Domain Record) header.from=nvidia.com
 policy.dmarc=reject
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=Nvidia.com;
 arc=pass;
 dmarc=pass (Used From Domain Record) header.from=nvidia.com policy.dmarc=reject
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id 6512744695
	for <nouveau@lists.freedesktop.org>; Wed, 31 Dec 2025 19:58:20 +0000 (UTC)
Received: from PH0PR06CU001.outbound.protection.outlook.com
 (mail-westus3azon11011017.outbound.protection.outlook.com [40.107.208.17])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 8E0F010E85E
	for <nouveau@lists.freedesktop.org>; Wed, 31 Dec 2025 20:06:20 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AIm/ZNWkyxf3iwhYl1jRvSEDFYbI5vH03IQD5LqeRRJA/rPeoJcVgghQXqmuG4IsifSpy8ZuHpVE8Loawrh1ZR7TfQKP80EbC/q4TUu7DFgPmrZDHchD74mFKxUcSQOOoJcdVP5U4eM//ZF3S+6cly8yysLmOjK9IKm9ncdNPChKwVl/D5a4pn4Ht+pbaoMj2e5VQ/XDXZzbvQPiudg6q0YS5jaUBYlhKUxcknS/KJNQrPWHUpJxa6t+JWLunOeCx7xKdmECNfNzFhuVrkrCF6ivUGFqImsuxl5m3qbnGi5Z8fOI7Rs0BZIaS3i14LLHLzYvOu6KPJ17sOY6kRRDkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+X8OmW1g+h1C0hNXrLcy0Pizz4bcXZinDBpNxqifNdg=;
 b=GeVlw0J58DDzcOaYGaGbh/3qOpPGeSOZew6UVXuLkhAbZRhANnH7ul4usLpK7mxJYR5D6eWMcMpGejxkVtfPN9f5c/1EQoD6jeiQrQeZzorOxMI28NpcWSeb3DCD5CdMDA1fqSEEa8qTwqLPyCT7qUFH0HzX58zN9mY9qTnTkyiFOpikyRcEhFGG33czmXpuZY4td2CIwIdaCzWptYoqWIF3ulKTQ/+xbtxoJcSmEqimWoQ5k0ITkibQAadi/WYc7w9baGopQg39A64ApYBWU/HPu4Hi6zUXG45hWapjmT+idXYWGNjLuBorgjry8rT3Ww6YvOf/N441zRSEOV6GRQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+X8OmW1g+h1C0hNXrLcy0Pizz4bcXZinDBpNxqifNdg=;
 b=nxOZGmH/qjzNQdtU01JOHE+Np0l/N2VueIKISrpLnmTs5vARM6GFvI91RIUF4Zi8DpbPPtjNoNeFV4ShKz0WVTt+2QLcMpoxZi2awilTLIIYkofQt/jTtnDbJ9YUqHs878DXhRxNv79TGFb9+iHvAmYeXcRDL2Cr8hZohPUhkdY0uqA7OybQ5K5bLFQr+U5ykI1Nhj+wu3ptRaZxLEyIPO/5V6XHq61h2iQ2ergoimrkJY2sgjOGKoP4O/pfsr7KDknKCAo5bA4W3MPOYufF+AvTpbESb+U2U0VLa5aFcrstTmt+R/SnyFfbBr6k2B0Nh3LVtt3S1GUzANLBo6TjeA==
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 MN2PR12MB4360.namprd12.prod.outlook.com (2603:10b6:208:266::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9456.14; Wed, 31 Dec
 2025 20:06:18 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%7]) with mapi id 15.20.9478.004; Wed, 31 Dec 2025
 20:06:17 +0000
Message-ID: <adc47679-baf2-48e5-b726-7ebb27634e1d@nvidia.com>
Date: Wed, 31 Dec 2025 12:06:16 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 00/11] gpu: nova-core: add Turing support
To: Timur Tabi <ttabi@nvidia.com>, Danilo Krummrich <dakr@kernel.org>,
 Alexandre Courbot <acourbot@nvidia.com>,
 Joel Fernandes <joelagnelf@nvidia.com>, nouveau@lists.freedesktop.org,
 rust-for-linux@vger.kernel.org
References: <20251218032955.979623-1-ttabi@nvidia.com>
Content-Language: en-US
From: John Hubbard <jhubbard@nvidia.com>
In-Reply-To: <20251218032955.979623-1-ttabi@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BYAPR04CA0020.namprd04.prod.outlook.com
 (2603:10b6:a03:40::33) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|MN2PR12MB4360:EE_
X-MS-Office365-Filtering-Correlation-Id: ae0c81da-50d4-40a7-ca5a-08de48a80f04
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?VjE3eUdwMVVXNU9ZWE1JcVd3dzZ5bFF6aGVxblI5ZGpqZi9EZVg4MDRZbUhR?=
 =?utf-8?B?bjArQnZBUHJnb2JRTWY3TjBObCtESkdmYWhDelk2NTVUNWVxeDNVQWVuZzBQ?=
 =?utf-8?B?WHF3NXdvU0tuOWltd1R6QnJvbW44bTJDSnZjNnVNTG4rUHVBektRTDJNUmc5?=
 =?utf-8?B?VDlYZHVUNmxxTHd3aFRaTGFPV1hYZjZPL0tnYXVXMlRMWmJkaUc1YWJVU1Fh?=
 =?utf-8?B?RVhsY2FQalA5WjhFL2RnMTBWVXNCQjZLOFRJVFNFTXFac0hrNUNVaXZnNUtP?=
 =?utf-8?B?ZkJQL0NCMjcyajhsb1BSK0hSSGs2eUE5U2F6R1NSZ2lvaW0yQmFFWDBpampp?=
 =?utf-8?B?ZUNaYVFtRTR6N05PTFo4dWdqZTQ0N08zMURrNjZHR0o1d1VsNFFnb0VGYnFj?=
 =?utf-8?B?SXZnalRES1cxQXA0dDI2VVQxZG5vREYxSElETXZzSm1OZE0wZlZ0eE95eUp2?=
 =?utf-8?B?dDRweUdkMk9kb055VHgvczQ1R2J0dXYxME95SzZZNG5qdlB0dnorM2RCZWVD?=
 =?utf-8?B?blY3TFdxcDVCYkhCRlpMNnBYWXBYWjZJclRuT3YyaFZ1ODlZZGlYZUxVWldW?=
 =?utf-8?B?RjJCYWpYbzI5bEUvcTA0WkpWckVYVVl6Q3dsNk0xenlMN2F5ekZLQVBnUjdE?=
 =?utf-8?B?Q3JwMy93ZVFCc2p5ZHV3dHVqVUMxalY1SXJvbFFra1JHUk8rNzZ5NVFrSkM4?=
 =?utf-8?B?TENtQ0VNdnZ2RW0xMFl1a0lFelB2bm5zT2V5K0ZOd0cweGV5RmozZnVJZWlT?=
 =?utf-8?B?c3RabXlKekFJbGxBTDdycHBmNHpKQWRmRHQzZGs0ZDZqSjh6Tnd5b1o2VERM?=
 =?utf-8?B?WlJoT1RzTkJlb2hsNVVFcW5lMDJiUjF2bXJ4MVNvbmFlblFleFowbTYwODEx?=
 =?utf-8?B?eU9SZTdlVGorR0JSa2twQjBvR0hrdndsZVpuSlZFMG9LbkdaM200cUhqNitj?=
 =?utf-8?B?QnBhS3Zwb21oYVJaWGt6YUh1WFZQSHNjZUVQNHBlck5Na0gxdG9saDdYL3hJ?=
 =?utf-8?B?MS9EQ1lHNy9FR1AxVE5ObHFaSVFZMHBSeURBaXloZEJSempVRWNuZ1BDdDg5?=
 =?utf-8?B?K241NVJySm9yQndhbFhMNW5xRWVaWEJQSUNWalUwQXowYXptOVluWDhmY1Rv?=
 =?utf-8?B?ay9zN0pEV1NzQVpIT0FkL0hUdUlNVU82ZzlWQWM2RkpxdndyZUxaakQ0V3lN?=
 =?utf-8?B?SE4rbFRNOFp5ZkJtbkFjK2xxTWlzRXJaazQzZ3NYYXhSSVJBcXJjVW1XYUtC?=
 =?utf-8?B?R2tXaFRSbG1uVU53bm4yNVIybS9EQTVJMWRWZ1c5ZVJXNmJ5L3NyWTVqNmhr?=
 =?utf-8?B?M2FBSGFyL3N2U2ltRTMxK2pQQWFwR0k4a0wxaXRqNURnbW1ycTV6UkFMcGNx?=
 =?utf-8?B?ZGdDd0pjaThpVzRzbE9zc21rY1RPN2w1OUxsNXVITlBNTVFWM21BSndBeGNJ?=
 =?utf-8?B?a0RqTWdIbVZGU2xaU0N3d1FEN3pGK2c0elFjdS9NeE1RZ3h3MlpISFhremtu?=
 =?utf-8?B?Z0lVWVp6MUp5QlJvalhQODN1MmNYUDZvSEFHU3FYaTFUL0M3akJmUHdpR0Ns?=
 =?utf-8?B?YlZ2cUNRaU4xUVNZV2t4SGpaZEpiUjVHZ2ZHdXlGSGFUUHcvOVZZMVA2aXFH?=
 =?utf-8?B?U2NDbXluditFWXZ0Z0dXSVMxUllMdFN0Q1ZCZmkydjJRdldUMFVBRzR0UW0z?=
 =?utf-8?B?NnZzQWV1M2JoSmpudmxoVit2M2M4V2d1U2pUMVRNM0h0cjlxbklMT3hPWU1S?=
 =?utf-8?B?RUpRSkxDSVlVektCSFpzVjZIa3hBSnJNblNXdDJtcjZWNVErRDZKWlBpVStK?=
 =?utf-8?B?UWlwUHFRSkNhQXcrdjYwK0RqVURmNU1weTUvS1V6YkY1RU5Kc0JhZDF5WWg1?=
 =?utf-8?B?bHpYWHBsNXZCZUc0Wmszakl3R3RDY245SVVVSkhYN09VLzZJMFY3N1pxeklI?=
 =?utf-8?Q?No+0V/iIftTizCuxXRbAN/ShPJoE4DA9?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?Q2hmUEZQeWFKQ2puKzZiTVhTQ21OSHUxY2dXcGwrQWpNcm13Qys1STFGVGNl?=
 =?utf-8?B?ZHowTHpBNGhEN1lXT3N0YUEwQWZadXFKSnMvbjJhRm9XUUYyaHRHMVp4R1B2?=
 =?utf-8?B?cGNsSldoVUxLUTRrSWN4ditSM0RJYWtJV0dFc1E0Yi9XOU1FaElsNFQrcmdT?=
 =?utf-8?B?ek1hOW43cldMK0w2RmFZN0NMQVJNR2xMTXg2a2VwWGRCWFJ2L3VpTXlVRFF3?=
 =?utf-8?B?MWpOQ0RxbXpoa1ZCdFpPTjEzTEZDL3QyNVQ3SURuVm5xWmVGZXkwU2ZNMXZm?=
 =?utf-8?B?YytFSG5xMExjS2taenZpS0hMa2tidExzOC9KYXUyTEJaUXRzSERaRWkrb1Za?=
 =?utf-8?B?aWx5V0N1WEVrNjF3cmJXN2tOWEFSaTJXUEl6M3RnRWdNSmhGS2R2YXB3bTZl?=
 =?utf-8?B?ZVhRWVFBajFoR2hEdlVqa21MYWZPTmtJL2UxdWpTQ2Q5QXRWK2NETHlCcEF0?=
 =?utf-8?B?Myt1NTlPeWtqaS82WWl5OWZ4dUlqeFJ5Rzk3MTJLYVNUd2NKK0lZNE1SbUJS?=
 =?utf-8?B?UWtCYnpaUi83RU9MSFVZMStOemtvYkxZUWRnY1lhMjQrRHY4WEsxZlE4S1I3?=
 =?utf-8?B?bE96U0FOcTlOR0wrYkZ2Vm1hT3h4bnRMdlkvZy9DT2s2OG1Gc2lUVVh2SGVK?=
 =?utf-8?B?M0tsaUowM1NhSDFsSnJRR28zUjd1MGtzN2dMdktKcGRKSzhHVDd1SktwU0do?=
 =?utf-8?B?MXRNRlkyd2JnOTgvZGtBVk1oRytLK3FTQjFUMlN0N2NCY0grNzZMbk5PSkp5?=
 =?utf-8?B?amlwYXRueWRpcnNVdUNacXZURWU1c29PWC9HdzBFN1d3YnFScGVtSEVSekl3?=
 =?utf-8?B?TXdJK1h2K1FEc1ZFTXRVSndTQnpxSmxpemFja2tJa3VyOGF2SnB0cnYyQVNh?=
 =?utf-8?B?VndDQkJDSEtKNUZPT1NkZmZaSDVoaXBQK1B2Zjg0TE5RM1lNUGJDQkpzbzl2?=
 =?utf-8?B?ZjlqTVFvSHFMTlh6aTdYTmRqeWMxWVladFFIMU9LbXFjNlR2QW15VGtXUUxG?=
 =?utf-8?B?MFV6eGtZVnpmc1VESnhjdnYyVXVGbHZaM3dsVHFMMkxDV3dNWUlKQTRtcmhI?=
 =?utf-8?B?cCtaQlhIdDNFcUIrdk9KRDRPTlFhbHhsdWU1Mk0zZ1c0ZUN5QllQYnZGSzVw?=
 =?utf-8?B?RkRyMGsyZHFINWxjMWdlZWZoaTNlYkJFV2lYbkJGWDhjYndFZmdBUTFPcUs0?=
 =?utf-8?B?Uldkd2hvOE55ZUphY092Smk3UU5MS1pqZlBVbjI1NkZWNHU4WWFVTElEVUx3?=
 =?utf-8?B?MmpmTmgyUW1DdXVWRHJ3WmM1Yk5jaXZwZDNESHRybzdHZVRPVHVHT1BXbnFy?=
 =?utf-8?B?cUJhbUlvc2Joem95K1ZjYWlGaS9UOTVYRFR2MFI2Qk5hZUttc21wenJzVHF3?=
 =?utf-8?B?V3NhaWl1QXZ2QVZkM3gvalNxUjE4WmhEQThRbGxiYTNWZU1nZzRsUEpPRU45?=
 =?utf-8?B?RmlnWG4veDdaTWZ6Ykd6YUhzOTJyZUhieldpMTVjSmlnVFZQZEgwajZ3ZDlL?=
 =?utf-8?B?Y2N2T2t4ZTlwVWw0dnI1UWtjTFlOaTBLR2luL1hRVFVyd2FIaHlwNGhWOVMy?=
 =?utf-8?B?RU50cVlRUHJBaDRZZnQ5MFVLN3VNTUxCZEtna3B5N1B1NENYRDcwSkJUcXdE?=
 =?utf-8?B?M2lhNkdsQU85TWxZWk5kNklFajRlSElnK1pXY1VBRTF2VDBNaERaZmFZR3NG?=
 =?utf-8?B?dDNNaEozU2VDZHNCL2VUSFhDdGlpVGhMSjVuS21UeWpFVWVwN0hOVTVDNjkx?=
 =?utf-8?B?aEpFTTRYdzM5WUkzeHZGRHdSQXRieFdBQ0RwQXpFQTdySkpsWHc0bTByK1RS?=
 =?utf-8?B?azlIdGVUdWdJeVFmZTJxd1NRYWFMUzd6OFFaUCtxM0FCdUtrd0ZqQTNoQzBK?=
 =?utf-8?B?bStSVVg1bEJha1dmaXJjZzBGdUFidzhHblpKQ2Q2Y25ZMFVYSk9RbUdYK2Vz?=
 =?utf-8?B?MDY1eFVoOW1DYzBIMGFwaWg2SVlFTlhuemFqcC9jSVkxbjM2eGVFRVNGVUxY?=
 =?utf-8?B?ak1SYWQxTFM4Z1dMSGdhRGhtY3JQM1o2L0RrYkMzUWJscDRFUXdwaXVNdXJZ?=
 =?utf-8?B?UW5QcTZubmJQWFVPdWsxSGNiZ3ozL004YjRuOWpKREJCelNQMWJFZEIvUVJ6?=
 =?utf-8?B?VllKdFc0OEM1a1BVOHRzY2JrMUdTaEpoMkZMaW9tNm50dnNZWDExTFNyV084?=
 =?utf-8?B?a2NOdXB4RjBOZmgxczZoWDE2a0JzOFAwMStucmlKV05HZk9sU09ocmNHMElC?=
 =?utf-8?B?aXM3dU9YNWtHeitkYjhOUU4xK3YzYjhGSGEwcGpISWhFajdsUE9aOEVFMTc3?=
 =?utf-8?B?aUZQc0QydWl1d2crRFJKMGp2aFhsMkovbWg4OGtKYUlETXgxVC94Zz09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 ae0c81da-50d4-40a7-ca5a-08de48a80f04
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Dec 2025 20:06:17.8772
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 IjHvdka0wwrGqfTkAHy/LdBXFhKflqv14a38yy1AUZgkJkXIrZYVovsyNj0dW64eD+N6szmxhK/ADvIZHgq8gg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4360
Message-ID-Hash: WLSSD7PA6XFULC5RECVMFAJDYDW4XLXH
X-Message-ID-Hash: WLSSD7PA6XFULC5RECVMFAJDYDW4XLXH
X-MailFrom: jhubbard@nvidia.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation; nonmember-moderation; administrivia;
 implicit-dest; max-recipients; max-size; news-moderation; no-subject;
 digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/WLSSD7PA6XFULC5RECVMFAJDYDW4XLXH/>
Archived-At: 
 <https://lore.freedesktop.org/adc47679-baf2-48e5-b726-7ebb27634e1d@nvidia.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On 12/17/25 7:29 PM, Timur Tabi wrote:
> This patch set adds basic support for pre-booting GSP-RM
> on Turing.
> 
> There is also partial support for GA100, but it's currently not
> fully implemented.  GA100 is considered experimental in Nouveau,
> and so it hasn't been tested with NovaCore either.

Hi Timur,

Are you also working on rebasing this onto drm-rust-next? There are
some changes and conflicts to work through, but I'm hoping that we
are very close to getting this ready for merging, so that's the
next step.


thanks,
-- 
John Hubbard

> 
> That latest linux-firmware.git is required because it contains the
> Generic Bootloader image that has not yet been propogated to
> distros.
> 
> Summary of changes:
> 
> 1. Introduce non-secure IMEM support.  For GA102 and later, only secure IMEM
> is used.
> 2. Because of non-secure IMEM, Turing booter firmware images need some of
> the headers parsed differently for stuff like the load target address.
> 3. Add support the tu10x firmware signature section in the ELF image.
> 4. Add several new registers used only on Turing.
> 5. Some functions that were considered generic Falcon operations are
> actually different on Turing vs GA102+, so they are moved to the HAL.
> 6. The FRTS FWSEC firmware in VBIOS uses a different version of the
> descriptor header.
> 7. On Turing/GA100 LIBOS args struct needs to have its 'size' field
> aligned to 4KB.  So pad the struct to make it 4K.
> 8. Turing Falcons do not support DMA, so PIO is used to copy images
> into IMEM/DMEM.
> 
> Changes from v3:
> 1. Fixed Rust formatting issues
> 2. Misc style changes as suggested by Alex
> 3. Merged regs.rs changes into commits that use them
> 4. Used Zeroable::zeroed()
> 
> Timur Tabi (11):
>   gpu: nova-core: rename Imem to ImemSecure
>   gpu: nova-core: add ImemNonSecure section infrastructure
>   gpu: nova-core: support header parsing on Turing/GA100
>   gpu: nova-core: add support for Turing/GA100 fwsignature
>   gpu: nova-core: add NV_PFALCON_FALCON_DMATRFCMD::with_falcon_mem()
>   gpu: nova-core: move some functions into the HAL
>   gpu: nova-core: Add basic Turing HAL
>   gpu: nova-core: add Falcon HAL method supports_dma()
>   gpu: nova-core: add FalconUCodeDescV2 support
>   gpu: nova-core: align LibosMemoryRegionInitArgument size to page size
>   gpu: nova-core: add PIO support for loading firmware images
> 
>  drivers/gpu/nova-core/falcon.rs           | 246 +++++++++++++++++-----
>  drivers/gpu/nova-core/falcon/hal.rs       |  17 ++
>  drivers/gpu/nova-core/falcon/hal/ga102.rs |  47 +++++
>  drivers/gpu/nova-core/falcon/hal/tu102.rs |  77 +++++++
>  drivers/gpu/nova-core/firmware.rs         | 181 +++++++++++++++-
>  drivers/gpu/nova-core/firmware/booter.rs  |  43 +++-
>  drivers/gpu/nova-core/firmware/fwsec.rs   | 215 ++++++++++++++++---
>  drivers/gpu/nova-core/firmware/gsp.rs     |   4 +-
>  drivers/gpu/nova-core/gsp/boot.rs         |  10 +-
>  drivers/gpu/nova-core/gsp/fw.rs           |  24 ++-
>  drivers/gpu/nova-core/regs.rs             |  53 +++++
>  drivers/gpu/nova-core/vbios.rs            |  75 ++++---
>  12 files changed, 864 insertions(+), 128 deletions(-)
>  create mode 100644 drivers/gpu/nova-core/falcon/hal/tu102.rs
> 
> 
> base-commit: 60c7398bded2e11f0db40a409a241b8be5910ee2
> prerequisite-patch-id: a3e23917ec535263604af95194422382f14c2f21


