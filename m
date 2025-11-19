Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C8BDEC6D083
	for <lists+nouveau@lfdr.de>; Wed, 19 Nov 2025 08:08:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0370110E588;
	Wed, 19 Nov 2025 07:08:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="lhPOkk2h";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from CH5PR02CU005.outbound.protection.outlook.com
 (mail-northcentralusazon11012059.outbound.protection.outlook.com
 [40.107.200.59])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE3C510E588;
 Wed, 19 Nov 2025 07:08:05 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TkhTXWfeEpg5WlRN/0vx7803JXHEr7iUdIcVqC2S0fpntL+PA8ja2bQFsGLCib+hqAtTUJrl25fYS+ngf5JhOsd4gbLwVUPlHPTJLXlyrOfe3A0djls+p4G1kdIiHe5ehdni+o3SXyhwtXWBIbNiGfHSOraPZaLFtFljSOMn1vC2DjYPyt+HHknwzKN+E16ABYt/Pmsp4auTVf2FqmrbeI9wDELh1SO6C21J970lm9unaDKLNRHmRuajR0JueeMLvjwS++YGjIKOKMLywiq0DyaXYz0DuoYL5vCPDem4ZcAq5fjxHGfwtjGobL1R+JnX75OK+pQYJ4HyS01IW6Q+Gg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xX10ddBmKlPJxGL77BqPrEQ10NJ9orJ5zQUQbeTOxfw=;
 b=NpqQP06HtXE7W8uFzU9rag+gzgmdND/jNSI/OYzYUe+de7HWhv1smGY5KCPxtZd/8sSwLJsNzNwTrfYZSyZHl4w5HjaAzMqzvZecW0g8/89oprdV7speAN54fEP1+s4VTy8T9jKgoq+kcDwCry18nMPgLwXWs8WKiOI3tbuDd5OeGwCuTfcMOjF/L8s4HUTWl7bU8Cb9eu14tCNFLm3dqwOKZ+sk0qnvv536MHWPXz51ImZMEyplq+x9KavT8gAtItLwudTmkQRpDij4DPzhethEvvD4Hf4KXHshfzJR29Vvh6ZFPmEMQupjP6jOR4A9SGtTVRn4IDlUq9wryu7MZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xX10ddBmKlPJxGL77BqPrEQ10NJ9orJ5zQUQbeTOxfw=;
 b=lhPOkk2hzTNKlKumLtJhbfpyw+3eIZdYG8a4KnpvHGz4x0IQ63dQxWnHHq/MJTUZW0VQvQUBtRGcNlbCkIp3/Waouu+QgKWlEhTCbYk3+MwnkIzowRiPiqCZTzH7gAmXAgoB6HiwgtcPVN+El1/sZHzpN5cWYI3z/r7FwK8R6+D+Q2miypXaARUn2KjczlzXtah3FiIkmX0/g0YanvPqWdhdkkjOBIiXBvfLw8TRTyLodW5O7G9sCXb4FxXj29yHRzPdzYht+pA2VfWviuNVnv0BEmBPQC7LeENVQBGY2RhtenM398QbeaulA+b2nR0VIknuyWvLFIPK7Yk5mZ9bWg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 PH8PR12MB8605.namprd12.prod.outlook.com (2603:10b6:510:1cc::6) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9343.10; Wed, 19 Nov 2025 07:08:02 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%7]) with mapi id 15.20.9343.009; Wed, 19 Nov 2025
 07:08:02 +0000
Message-ID: <ff7f82b7-d812-4ccf-b5c7-263f0baaac3b@nvidia.com>
Date: Tue, 18 Nov 2025 23:07:42 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/6] gpu: nova-core: Blackwell: basic GPU identification
To: Dave Airlie <airlied@gmail.com>, Alexandre Courbot <acourbot@nvidia.com>
Cc: Timur Tabi <ttabi@nvidia.com>, "dakr@kernel.org" <dakr@kernel.org>,
 "lossin@kernel.org" <lossin@kernel.org>,
 "a.hindborg@kernel.org" <a.hindborg@kernel.org>,
 "boqun.feng@gmail.com" <boqun.feng@gmail.com>,
 "aliceryhl@google.com" <aliceryhl@google.com>, Zhi Wang <zhiw@nvidia.com>,
 "simona@ffwll.ch" <simona@ffwll.ch>,
 "alex.gaynor@gmail.com" <alex.gaynor@gmail.com>,
 "ojeda@kernel.org" <ojeda@kernel.org>, "tmgross@umich.edu"
 <tmgross@umich.edu>,
 "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "rust-for-linux@vger.kernel.org" <rust-for-linux@vger.kernel.org>,
 "bjorn3_gh@protonmail.com" <bjorn3_gh@protonmail.com>,
 Edwin Peer <epeer@nvidia.com>, Joel Fernandes <joelagnelf@nvidia.com>,
 "bhelgaas@google.com" <bhelgaas@google.com>,
 "gary@garyguo.net" <gary@garyguo.net>, Alistair Popple <apopple@nvidia.com>,
 Nouveau <nouveau-bounces@lists.freedesktop.org>
References: <20251106035435.619949-1-jhubbard@nvidia.com>
 <20251106035435.619949-4-jhubbard@nvidia.com>
 <ec49facbd969b1ad00acbaec1c719d3b30e0151d.camel@nvidia.com>
 <7d928fa9-74b3-4790-9e94-10cc56801fb4@nvidia.com>
 <4c87b7d6-5ce0-4f08-8f22-578a34ea2bd5@nvidia.com>
 <DECBSKQQ8SZ4.1B1D97HLUESDD@nvidia.com>
 <CAPM=9txhNyBOK2W=fgEabv3vXBscD1MNX0dyk6-OV7yCzD291Q@mail.gmail.com>
Content-Language: en-US
From: John Hubbard <jhubbard@nvidia.com>
In-Reply-To: <CAPM=9txhNyBOK2W=fgEabv3vXBscD1MNX0dyk6-OV7yCzD291Q@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR13CA0045.namprd13.prod.outlook.com
 (2603:10b6:a03:2c2::20) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|PH8PR12MB8605:EE_
X-MS-Office365-Filtering-Correlation-Id: 8bef11ad-4e3c-4764-4c76-08de273a60ce
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|10070799003|366016|376014|7416014; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?VGc4NFBCeHpnS1Byc3pKWjMrMXlVUUE1WGdmYlRXVHU4dHdnWmp4anVwVUNi?=
 =?utf-8?B?d1MrN01ZOFFhZXpVSGxHK0NiVmlDYnhCWGhWdkRlY05sM3dWL3Bzc3VkeVFB?=
 =?utf-8?B?eGRrdDVmT2l0dERRY0xDMEx6Wk9vaHMxcFExdW80dmtuSklITWJCWUFKTXh2?=
 =?utf-8?B?Q0hEcE55YjhDNTVWQ1phbnZnYzNlbU56TFZZcUt6UUJEaFVXNVNJbStFeUl4?=
 =?utf-8?B?UWlsc1F4d1c2d0FiRHdsNUljcjBKbnU2UEZoUGVKRUk2UFZibEFFQklLRHVV?=
 =?utf-8?B?bVloVjJ6L3RLenphTkZDejBkRlRNZE5hTGw3R1lGTGpoSGhMZzFiVEtSTGtz?=
 =?utf-8?B?QnNvd3I4SEEvSDBIQTdXYUMrdjJSN2tXdk9VZWpnSXpnMTF4VzkrRS96b1M4?=
 =?utf-8?B?a1lybk0rZkdTZml5WWJzQXR6bTJVMDNHV3RZeFJhRE1ZVjdURFJYdlFaSGk3?=
 =?utf-8?B?R1Y2UHp6YlRPTEtZQkhnaTRRS3l6cUIrMmZjMzQrZ1ExR200bXNsM0RMbW9Z?=
 =?utf-8?B?UWFIZVluckdwODFWekl5OFN5bU9tV2VhTGhqcDVUV2xnTnV5TkdOUVFhbS9T?=
 =?utf-8?B?VS85UHVlTjVtQkV2Z3FrUHJQMTMzNzlyaUE0eDk5by9YSnk0cU9YQklxcXZE?=
 =?utf-8?B?UDVyMlhKWW9EVThrdGN6Yms0eFMvRlBoSzF1Qm9xanNRMXNmSWtVaExtellT?=
 =?utf-8?B?NFZPOCtaQkxxL1hvT2hnalpXWDNUUVpTOCt6cFQ5d1p5cnlQYlJLY2hnbW43?=
 =?utf-8?B?UmdsNUlGTmF6VTVkTlV1Rzg4R2FqMWpoMUJ0RHNmL2ZsTjc1RE9UT3paQ09m?=
 =?utf-8?B?N2RWWDFaVk4wVTZPTTdrT3dRUFU2TXJZVVcyYlJWYWE4K0lNd2ZMZUxxM2Y0?=
 =?utf-8?B?OUx0QXIzNTRjMlF6NlFLazcrNm94d0RFYmJOS1RBQkVXaWc1R2NUdkFBU1Mr?=
 =?utf-8?B?ZjA4Y3ZYdVJONjZlUWI5M0daa1N1anZsUTJCc0M1MHpEa2hzYWowczR6dFNF?=
 =?utf-8?B?TEFGUjlNOVZ1aVl3bGlhQXhsaVRJbWJmL1ovdkdFUFg3aWEyalhrTVRyUWJW?=
 =?utf-8?B?RHNwTnN1a3JDUngrOTV0Mkw2d0tXTDZHUEJNMTM1QTU3a3kydFY0ZC9XZHp0?=
 =?utf-8?B?YVBuSEk3d05US1BnYUs5YmoxTXQwVHppQzFjTVFEWUFVZFNENVhqTjdPYndu?=
 =?utf-8?B?bWNjbXJjRXA2UFcra2ZzTFFnWFZTdjI1SVVJTXpLaDd2b3FGdDhQQ2tBVlJ1?=
 =?utf-8?B?Rk1QNklGazdjd2UzZkVjRTJyc1pZK3FLZkxrckM1a1FCMW1KMmVIZE9wSDhq?=
 =?utf-8?B?M1ZMSjdpZHVzWWVtSWc1L0tFRHdzaG1qWVA1NHk4WUJ2SEp5cU1leWZOYys5?=
 =?utf-8?B?OGJ4ODBzdVpIdWl4UE9XNWdJZlBteFpNazZHUm5PZDNjUTI3bVp0dUJ4cEY2?=
 =?utf-8?B?QllQTXUvQWNEaW9lQlhxNVk1S0RMbTVaZkFrd0VSMGFldVFsMytTOVNocU5E?=
 =?utf-8?B?ZStYdDdrSnNZTzJmSXJaT2dFS2NoOHgzYjBXekY0VTF3TUJHYkFLMCtCbVhP?=
 =?utf-8?B?dHRHNkh4c0FuTU1ZYUpGaXhMalMzazJqdHhCNVJyd0lJVVZ1V1NPUFYyekVK?=
 =?utf-8?B?MFpjNzN4cllKdllTV2h1MEtQOFh0aW9TY1Rta2dzVlJFeUhOTXZEajdhY09p?=
 =?utf-8?B?dFVSSzFTWTcrckRjTnI3amRrL21rdEJQbUxVMFJBNkYvc1BlOWNJdXA2UWlO?=
 =?utf-8?B?d2JvSmNYZGpwcGhzYnJvaGFodUpabDdkTTlCUW9ranlwMEk5QjFDQTBOMlVL?=
 =?utf-8?B?b1pRYlh5M1JmSFg1WWl4ZDc4UDlSM0l2aVU3cUhOMlB1TTZYc0YzeVF4a1pl?=
 =?utf-8?B?SFdZaldza0VyVGdOY0lpV1NqUkN5VVVaVm15Mm1jZFZzVWx3cXRNZmpRMlIv?=
 =?utf-8?Q?sv7Nj5Enf4lkUq9o+/ux2LYAG6geqRmK?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM3PR12MB9416.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(10070799003)(366016)(376014)(7416014); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Q0x4dG50YnJiUUpqV2kzU240MUVPcFNnQWVVaDgrUnlyZXorUlQ5bzh0SUkw?=
 =?utf-8?B?aXpodEN4ZnhoUXk4VC95Qm9EazZkanhrdlhNRXhSQ3RJYWt3WGQyZ3Iyd0JP?=
 =?utf-8?B?bHllaHZpRzBUcXRuY2N4VGhsTjRsR3BNd1k2b29YVFM1RHFrL1l6WWcwcGFr?=
 =?utf-8?B?eEpraXZEQXlBOXZuUC9CaTdIU3M3dHJHUGUyL2s3VzV2Z09pYUFCRkRHUTdy?=
 =?utf-8?B?MWs1cC8xcXVOM0EwN25rK1R1NWt2SE1QQTREbVEvNkErVVh3aUdwakUybWxJ?=
 =?utf-8?B?aUhMT1RrRlhFeE9oS00ycmRQdWNIeUJEenZGeGN1em01bEFDMFQ1WXk5S3py?=
 =?utf-8?B?azArakxyNFpHbEYrcE9seVE1Wjd4dlhhZ0JEL09Ud2NlOXpFYWI1WFJjSG1j?=
 =?utf-8?B?N1RiSjNGOGNMc05KYWxQNGZlcVBZcnlBbSt3bmI5ZGZFZjN1REtMMXJCS0lZ?=
 =?utf-8?B?ZmNDK2pjYzFxL2VKOFdMNUVTdHZhYllQYmg1NGJ0TGVvYjdIek81blN5bjZP?=
 =?utf-8?B?RkpEUzJqbVJNNllEem84Q2RnditVQnYzdHlpRkN6Y2xQUkgzZVl6eTYyNHlN?=
 =?utf-8?B?a05ENjlIWUR4bUpyNkdtcVkwT2JnL21SdCt5dXB1MmpyT3hDWlRkLzVqZ1F5?=
 =?utf-8?B?STdjanllQWtmc2lGTnBoemZRNUN2N1VuVnRqY29maHI3TEpQczcwK2w2TlM5?=
 =?utf-8?B?NGVGVTVQTkNDdnNpcFVlOGNSb3JCa29CVUVaWGZ0aXdPTVY2MXRIR1orbVA0?=
 =?utf-8?B?ZnVkT09ZNzBobnpYRFFsVkc4UjNpQTJlb3dFeGh6dkRYRzU0QU5GM0o0Wlov?=
 =?utf-8?B?RXFnTWlkTnlGalhEZTI2SnhQQktaQVU2QjZXQ1o2WlVwajk4aWhWT21wOEph?=
 =?utf-8?B?a2E4d0RKSnptcmRtMXZwTUUvNnNydlhhL09JZjZnWjlRcU5GRzFQTDRIQUJZ?=
 =?utf-8?B?VWVPMUNlMDg0KzQ2WktlblFCUDB1UVZoeUMra0oxUnAwOVlnR3RNNnA1aEZU?=
 =?utf-8?B?cXByMmtjZWtQTm1JVWgyRmowTzVERGx5RHNHazhhajYvSU5SR3JpWU85bWhl?=
 =?utf-8?B?YTRldk1zajFZV3pRSVdYS2lmRWR3OWdJSHN4MTgvYS9EU2ptWG5TOC9qeEJ6?=
 =?utf-8?B?VjYrSVBKSnUvT2QwSXIweDQ0TTZ4TStFRzVvVUNIdm5oSUFVdldPTjNpeVVR?=
 =?utf-8?B?MGVoTTk1WjIwYm9uUXVkV2pWWTRSVXFCaVNQVGljT2FjOEdFeWZOQlBTMTRz?=
 =?utf-8?B?QkZTUjJZWEVweGtrUlRiOFVmNjM4TFRWY1lHTHZqRFVYOTdvb0E1N3R1S3pz?=
 =?utf-8?B?b2FqY0V2RHdCVWtNYUlJVmhGSUIrT3JNeG9ydUYyWEYxMm9BVDl3TXBmbHU5?=
 =?utf-8?B?RUJtR2dZN2JkZERMWXBDaHZORWhDWlNpSTc0SERpVGhjcnhURDNaZUt2bFZH?=
 =?utf-8?B?azF2TGJ6ejBDbElHdk56YVoyTVFvR2djZi9BR3lyMGNLSWtST3ZGYnh6TkpQ?=
 =?utf-8?B?b1hTR01GdTdYVmNURW4rVWZZanRkTlpkWmtpSCtzMjZVQk9FU3Fvd3ZXQWxu?=
 =?utf-8?B?T0lxTjdGTTN0VWdHUGt2Q1Q1eTJKM3NhUGdTdDVvZ095bmhDRXZCTm9CYWxD?=
 =?utf-8?B?cW5qVjB3WEphZ0s2NEdiTkQwZ0Q5MStKc3NkOUp6RERkcnF4NDJlVVlESCt2?=
 =?utf-8?B?UFZTMmk1UnAwRCt4NHlmbFI2a010azcvdTBpRlUrbUkrUzVkOEhoM0psK3JY?=
 =?utf-8?B?MEFWVEpBVEtvbUJEZnJjREtsQlBRMnIvS3FvWnVPWld6dDN6ZnBrc0F1RHAw?=
 =?utf-8?B?eW5uRVRXanhiend3ZUZxcHhmOE1Eb1p6cXJPL3dtMVFocVlmWG1XM1F5NWFW?=
 =?utf-8?B?RVhCYVhpaUVHYUJjaTVobllNcFBZcE9QMVU0YjU0QWtpNm1rSGwrQjA2MWV4?=
 =?utf-8?B?dE9QY0M0OHBDalhMZnViMnZZSTVuT1B3bktJcXJJc21BVzRkN21BMU82ZlFM?=
 =?utf-8?B?U2sxZjNHWlN2TWxrZ0wzT011cWNsWlFEcFZ1OVdzcTZaS25ka1AxV1R1aGpi?=
 =?utf-8?B?TUMxbWExcVFtUzNPSnRxVlpDbWkvR1NKNDZzNHlsTk1zQUZoOEdiT3p6M0RG?=
 =?utf-8?B?dHhjYkk3WERMK3NzTitsaFE1ZTFnNGttb0pQdHoxQTJRa0ZMb25EcU9UbXQ3?=
 =?utf-8?Q?x0R6/awV3gsWA3repHVc5VQ=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8bef11ad-4e3c-4764-4c76-08de273a60ce
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2025 07:08:02.0630 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oXCYlcg+V3OTMvx74cfUBscp70RLrzONRfJ/84kSDiDgpFmkrTylMZYPaJ7c00s1jzhTLM7UQskR3v20NOz7+w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB8605
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

On 11/18/25 7:15 PM, Dave Airlie wrote:
> On Wed, 19 Nov 2025 at 12:46, Alexandre Courbot <acourbot@nvidia.com> wrote:
...
>>> Maybe let's just do the long lists of chipsets for now...?
>>
>> Yeah, I've hit this issue as well. The compiler might remove that
>> limitation in the future, or maybe we can craft a `chipset_range!()`
>> macro that hides the messy casting, but this exhaustive listing also has
>> the benefit of forcing us to consider every critical site whenever we
>> support a new chipset so I'm actually not too bothered by it.
> 
> I wrote some macros in my nova-core-experiments, had
> chipset_before/after/range I think
> 

aha, I was afraid someone was going to say "macros" out loud, at some
point. And now you've gone and done it. :)

Well, I think we probably want:

a) The ability to clearly specify a chipset range, and

b) For extra credit, maybe: also be able to specify entire GPU
architectures, and architecture ranges.

...again, without too much extraneous noise at the call sites: the goal is
to read it easily:

     GA102..=GA104 | Architecture::Blackwell


for example. Macros are going to require that to be less clean, but
let me poke around and see.

thanks,
-- 
John Hubbard

