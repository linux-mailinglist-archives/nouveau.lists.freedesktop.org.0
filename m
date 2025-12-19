Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 18A15CCE999
	for <lists+nouveau@lfdr.de>; Fri, 19 Dec 2025 06:55:45 +0100 (CET)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 334CC10ED31;
	Fri, 19 Dec 2025 05:55:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="TDiMBPPh";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id B997A454F5;
	Fri, 19 Dec 2025 05:48:10 +0000 (UTC)
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1766123290;
 b=pF8HliWLmAUzSNyjYf9zALcltBV4n8ZIE8jOwy41UOiYqjse+x2gjB43SnxTcwkbeHnXn
 +RrkOl+mYQX87/gby2LQ/FgOuFV5FBcox2O1wZHp3m4oS1Qq/+AdaqoCJxb5NOfYKtawIBZ
 qyvCzVeoESqDvqQInI2WnnNZGGzBCtb47YWs43lWs5JYJwBlPKEt4/DZcoqE4mQaOvy2tgX
 K2vPKT4Ga+0DVDqbQCrkEcfJ2nekobf/U0+pOACs05TEIYiE3+2t5yQcLjv06w0XkFgv4kV
 oHJBd/dn2POFLRjBLjVvBZLFVZnACJMaxpClU90CM5VtSk0BxuKQUqv3tgzQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1766123290; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=mwNDb/uW6EVgqn5pZXt6UFwWtvV3ePN6XzEgAL3JQwc=;
 b=PISTjRCA+AsvDz9fIJyZ/NJ54Dz5Wm/MVGkUBmcoy2FWc6Ks1EKwK8R/hcy4kHk3Qnxsb
 fXtwAniDU9MFhdM4Xgttv0d6Zv5AU9CAALGvUKm6fSf3y2Dj2sz2ONK4UOzBSrH6hjKBd28
 iBbRYQF3aBiT28TWqEtxfD4sDBxensp6PKWXEEDmdV+m+NJo82m7kjt3T38z8tLJAY/ukuW
 5NwwwTmPNCgwL0vr7k3iFFioONybof2RGiDd9p1SLSdq6TKU0c94t3AkMobWxGXH6qxz20O
 /p1+nmFqVZwsNODSVTSVIKB6QzC/vaRnsvukJrMIqKp2Y6juFd2ROdGrHsLQ==
ARC-Authentication-Results: i=2; mail.freedesktop.org;
 dkim=pass header.d=Nvidia.com;
  arc=pass;
  dmarc=pass (Used From Domain Record) header.from=nvidia.com
 policy.dmarc=reject
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=Nvidia.com;
 arc=pass;
 dmarc=pass (Used From Domain Record) header.from=nvidia.com policy.dmarc=reject
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id EA06444B96
	for <nouveau@lists.freedesktop.org>; Fri, 19 Dec 2025 05:48:07 +0000 (UTC)
Received: from CH4PR04CU002.outbound.protection.outlook.com
 (mail-northcentralusazon11013024.outbound.protection.outlook.com
 [40.107.201.24])
	by gabe.freedesktop.org (Postfix) with ESMTPS id E911E10E013
	for <nouveau@lists.freedesktop.org>; Fri, 19 Dec 2025 05:55:39 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=edVqb0CTa9zWUwGSKyJeTZ+jU4izdCH5yP4Ya5co7oSrB3i2biWLiJCyXFi2CElu1wbkThE8HTKzSfxwi0ajVU+Zen9FSpXDj3dFo9dGo6ednhnw90muvNtIWyruPPR4Xcrqte8i2pU0rCwmGb+/8mTNfk/YTw9SZ2m6VfzAb6L5NHykE2Io/8dUQxwtQiLGzMVwszQcirml9SXQ8kPdxScHWSekKtP/sJyCFM8roy+Atfns1/0/kVp0ZDHsCmAsohuVJP5SAO6XO7K2g1g1AbRCJnjLpt56h3RjY4Uxf+Ru2iCKlEZ1v7P/J+aRn1Tfeu70ZfDvAtxUp33jRTKRgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mwNDb/uW6EVgqn5pZXt6UFwWtvV3ePN6XzEgAL3JQwc=;
 b=gXFTXj8pL3DIz97h6aa07YL+vVMmkTISRcr++VgZWFSOq5P24PPKX0pQz/WBREpkgfLQCNRapQFuT/w0r5Yp8FnCyTqvabmAcjU1tbrfaPbvN4PfCOnNX/iBsPZl9wetajLLsX097YyMLd8b+3TwMk0yFdgfxMSGvLvKdSAiZz4V+4OyMp5w2q/Fp9cfMMNZXtZy3tK6A20b2izI99hcDsPVhdrQ4vEy9NStopdsqIXfEXbt/awHdSU/A69zxevNy7WNY7pRyyVKzIxT+QRB19Ji8QhVhkuCv9KIjKkFc/IghXk/7L1vX8oJ/7MAhRKPIFl5Y6Uz0432F6Ubcv1iuw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mwNDb/uW6EVgqn5pZXt6UFwWtvV3ePN6XzEgAL3JQwc=;
 b=TDiMBPPhOzLH63L+RGccdjT6NiwMl85Jw/U6Z6I5bThbxIpoKV8MvxhCuI3Udv+cC5s1ApGr3XdM1h0UT5IdYXZ175//YyqtGbLeH6vYmIvjSuz5zG3cpD6N8hiT7qmvuIb9EfcnAcl28vYyJFXbBNV9UG3DmLYPo/Nq5peUkBc60YzLY8Ccdhe/s1QMd+EW+LFB3GLecWZHHejMoFiONjxKaXPfHxkI72rmbvo0wZbvQGEDJITNbb60NmrhBj+KAUUNmYLkmtB0EBGW8ZYi8qIMusSRHiB+Gi6NEVcAwLA62IuYkAtkE3bxm1pbQ/VKP7k1MgD7wZ6mzUYVDeWOUw==
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by SN7PR12MB7250.namprd12.prod.outlook.com (2603:10b6:806:2aa::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.6; Fri, 19 Dec
 2025 05:55:35 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9434.001; Fri, 19 Dec 2025
 05:55:35 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 19 Dec 2025 14:55:31 +0900
Message-Id: <DF1YM1GU7MKN.1MKJHK0BLBZ1@nvidia.com>
Subject: Re: [PATCH v4 10/11] gpu: nova-core: align
 LibosMemoryRegionInitArgument size to page size
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Timur Tabi" <ttabi@nvidia.com>, "nouveau@lists.freedesktop.org"
 <nouveau@lists.freedesktop.org>, "Alexandre Courbot" <acourbot@nvidia.com>,
 "dakr@kernel.org" <dakr@kernel.org>, "Joel Fernandes"
 <joelagnelf@nvidia.com>, "John Hubbard" <jhubbard@nvidia.com>,
 "rust-for-linux@vger.kernel.org" <rust-for-linux@vger.kernel.org>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20251218032955.979623-1-ttabi@nvidia.com>
 <20251218032955.979623-11-ttabi@nvidia.com>
 <DF1BM2Z71OY4.246P9YGJC6J4N@nvidia.com>
 <e7b6a0bcbeeb7312b52f0e9c755e6af045d99d29.camel@nvidia.com>
 <DF1VSZIO9UZH.YU8SUUQ72GPI@nvidia.com>
 <50c97b2629dcb1456b936162d6cb4cbad8bfd937.camel@nvidia.com>
In-Reply-To: <50c97b2629dcb1456b936162d6cb4cbad8bfd937.camel@nvidia.com>
X-ClientProxiedBy: TY4P301CA0079.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:405:36f::6) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|SN7PR12MB7250:EE_
X-MS-Office365-Filtering-Correlation-Id: 9ea2df11-0f6e-49e3-9c76-08de3ec33a34
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|10070799003;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?SXN5eDRMRXV1d09mQWE1Z0c0V3NaZmVXUjcxRG9qY0ZxcU1ob0MwNUZsSnp1?=
 =?utf-8?B?bCtUb3BjMlZMeEhDdVVIZUxob25CaDNjaTFiZGlUeVZORFNWSFVZQWx3U09S?=
 =?utf-8?B?blNFbkJaN1VCWFBVTnMvTzVyTWtVNDVGUzloOW5VbmlDcVY0K3EvT2F4T3V1?=
 =?utf-8?B?WVhYYU1LRytCeWJmVTRQK2VMSkhYM2wxYXhjL1JCdlo4WmhVL1FRY0xFR1pr?=
 =?utf-8?B?QXlJV3hZeUVQSHFVdTB0aitpak5nZGRGRVR2VC9XMWpIbGtzOWZUZmlQS2NK?=
 =?utf-8?B?cXQ5Z2lHSFBiUGRXbkQxNlRZT1NPazFISlIzTXJVNlNUT1kxZjk2S1VZa0ZS?=
 =?utf-8?B?TnF2cG42MnQ4UlNtSVg3UEp3ZTMxbGdRM2RhT1o3UUJNUy83THdMSE1ycWZL?=
 =?utf-8?B?YThmR2M1Vk1qYS9UTm10YTZDZm9XaGprclNNMlN1SC9zVjV3N2tHV2F5a2NV?=
 =?utf-8?B?L0hVTHk0bzVkR0xJQ2tJcndsaUtJUXdzbmN1MFBseitGY3RyTjd0eFFFWm4y?=
 =?utf-8?B?WEtTc2JlQVpPOWo0cklIVGlhajJtY3FyZlVSb3hMRnJDZkZDdFhJNkFranEv?=
 =?utf-8?B?WUdPOW5ZNzFTRHRPdSt5anIycEZ1cE9DSTlya1pkbER6NS84UU5wK1Z2WFFn?=
 =?utf-8?B?RGMwenJyQ2pGenpKaXNTVVJrVGduREQvb2hQWkhpOWFjd2t0V1VodWpkR05Q?=
 =?utf-8?B?MVJZK1N6czNjTWNGMVdBcDRDRVhWNGR0VjlMK1pMRHBJaTA0dlR6WDVJbXhq?=
 =?utf-8?B?U3hyRkNlZUFIcVlFYVh2amMwdDg5NnhneGUySzh0bVBudVBiWkRhWWhsSWN0?=
 =?utf-8?B?cVFpQ3hWTHllbmdIMTNjaW12OTZUd2xaeXJlb0wyM1dCOWRyOC81VEVtcTU4?=
 =?utf-8?B?RFR4QVk0T0FHOXZUTisrN1hCcDZuV2ltQ2thT2hoRThlUnFha28xS2VPL0Qx?=
 =?utf-8?B?OTN6T2NDRGs2NCtURFVQYUZzbldHc1FCcjJ3SnhCNEhmNzRaOWszV2EyVU84?=
 =?utf-8?B?WFNYRzJlS1RoV0NHWlFHQXdXa1UzRGpsbTRRME9YZGpFeCt6c1BWd3l3NUM2?=
 =?utf-8?B?Y0J0enNHQVpkL1owUnBJTDkvQ0hPMnFoYWF0KzZYT3BTdVdKU0VEOVNGcVJh?=
 =?utf-8?B?WUwyU0xEMW5YRmQ0UTc1YVVmaXlWOTB0UzluTkNjek91dUhkWVc0ZHZYNFUr?=
 =?utf-8?B?RFUyU0g4V1hpNGZkMndyZVVZMXRST3IwdTFaYlNadmRHZUswUU55M2pXTnFW?=
 =?utf-8?B?T0llUHhHcElZVUJrd2VtTCtPVVhYWGJTVDVyVVYrdVIwUkFUMXFHMkc2cnBQ?=
 =?utf-8?B?RzFuN2YvbU5rdDI3bDZVYW8yem9LU0RuOUorVFJ4bXRZRi9BcU5NbVBReTlx?=
 =?utf-8?B?U254SUdJK0hBTm8wM21qNktFR1M2R3ZIYUtxekZ0SE5ybW14ckhQcEFZSThs?=
 =?utf-8?B?US9xUGtsZVVYYU4vcENQcVYxeXl4bnFwdGE1aE55NTdtNnBxemNCbXR5VU1H?=
 =?utf-8?B?Uk9udUxPbFMwTjNJS21Na3lhUHNSeHJDUmlab2FBUktJWEszbkduTU9wN0VM?=
 =?utf-8?B?NVlOQkgxQ2lnZkVBaVVHZ3B4ZENZWDRzMTFkTDVRRGNkbWdFeURoNW9EOXAv?=
 =?utf-8?B?ZTRTa2srMHlnVThaQUJyUG8yQzFGaFo0SVY5Q08rckNmOWt6ak8waVNsNVZX?=
 =?utf-8?B?Qk5TTWE1MUhaL0JxY3JzOHMxZzBIMlZ2cmpPK0tndndWdXBPSU5UbXdMUkF1?=
 =?utf-8?B?OGxBVEZsSk1HSUIyQXJZMGZVL0hLR2twSGtmUldpWlpGYVhmdmRiZTV4Q3kx?=
 =?utf-8?B?R2FGUkZpVGtrcGcxdGJxZ3FRaHpQQTIxVEphMW5OOGxoRXBuMDVyTGZyaXJX?=
 =?utf-8?B?VUZZSjdJMkdGcHhTWjc3R0w4YzNLOTRZSjQrQ0xRMTNqYWR5dTR5R0NaVUVP?=
 =?utf-8?Q?qMUBqeBMN60kQcGNBIND6EV5ddzRhdt3?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(10070799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?cDhTVGNWTysrV0tWTjJuMzl1L0lQWGQ4cFg1VkdlUUYvck8rMnhCdkU4eW5U?=
 =?utf-8?B?ZkYwNDcwTXVyVkdkZ3V4WUNSelJ5NTBOVHpMVThMK21ReUtHNUw3d05zNjJm?=
 =?utf-8?B?RGNQNzFhc2E5eXZMNnB0cGJqTFdpcmxidHFWajFENzZhajU2Mlg0OUdpV2h2?=
 =?utf-8?B?eG50enQvb1c3bWNpUk5nNWRDblFDbVVyZlBhUThuRk1NbDl1bERUcXE2aExh?=
 =?utf-8?B?OTZFeU9GbkppYWlyelBkVWd0bEM0YytKelZSZUZ5K3hFUDBaWHgwVjJDK01R?=
 =?utf-8?B?cGphWjk3WDZyVVk1TDdzWnRETTlqc0NTRjBJSy8xSTBjayt1RW9HV0hEenpn?=
 =?utf-8?B?NWE1NEZ5RjNGV0hSSXd2TGVubjQrZDFZWVJndUM5TlpIaDZYeGVlS2FocDZO?=
 =?utf-8?B?dUVEQmZVZ1lyalcrMjhrKzZBS2NuUjNBd2lRNXh1TXRSMXJrODB5Z214cCtr?=
 =?utf-8?B?RlZrM1BkUjNTVitGeXhDMzJxdmN4UWthMDJubFVEcFRVbTRGaVZ6ZElBSllz?=
 =?utf-8?B?Z0d6a1lIeGt3NXN3eFhEeFpFVUU3Tzg3NjMzWmhBUXg0bGlCakp5eWZyN24r?=
 =?utf-8?B?aEFWYnYybDVsMEdEam1VbzEyOGNwWWloRjIrWitwcGlIazdCaEV0NnlrWStn?=
 =?utf-8?B?WjczZ3FTNDBveTNKYjl4NFR6dXNTRXZJUUlQa2NxaS96eThRdDQ2TXFIMXRw?=
 =?utf-8?B?Y2ZidjY1ZXlNaDhLaHpmWXQ4V3pjd1hST1AyaG13cTBFaFlIdE9BMVQ3UFVn?=
 =?utf-8?B?dHE2RTlOYUJsM1hZYjEwMDRDRFV2djlHT2ducDIybWRpbEd3d0paQjJSYXgx?=
 =?utf-8?B?T1hmQ3VBN3pjcWM3ZFV3YWZvUlVqWkZIRksrWm43emxpblVXWUxkOWtkaVBD?=
 =?utf-8?B?QU9IdjhKb2h5bExxSDF3dEhZUEl6RjNEUGcyZ2d2Wm5TK1dKbHZPVDhFTGVT?=
 =?utf-8?B?TTJvU3JGWXpOMURyREloaUR5VGVyck1SNGJka1lQSE5XQVF2eHlVNmRUWDJi?=
 =?utf-8?B?V2JsTDVHU1JaTndCaVFmcUlXVVdBL3ZVSG1qeDM0Y1B1U2g5WFdCMS9VL1Jq?=
 =?utf-8?B?OXY3S3BJY0hBRldFendxN2JadUM2aUx6UXFjaW9mVHViaEVQdC9HRGpHSlhi?=
 =?utf-8?B?UmxvVXREcTFIQjdGcHdOdFc1WFZMc05hd3hzVmcycEl6TktrNHpISFhTaEJK?=
 =?utf-8?B?UGgveDZiTnVkd2tBS0hVWlp2WXlRcE95bTZHZzdRa3pYUUR2bmhFS1ZiMmdL?=
 =?utf-8?B?OFloZzFlWnRkbzVyM2srWkx5RmljbnEzcU1hZDh5Y3gxUldxa3BFejI4MytY?=
 =?utf-8?B?N1NsaGE3TmQ1V25xMFVBZEVpb2JFNEMzenBEZG0rZWZXdjRkUlBQS2FOdm1N?=
 =?utf-8?B?c051Z2IzQWxvc0NqbnJsbDVRbTNnTVZwZ1dUVzArdXl1bWRtTjhOL25rOEdK?=
 =?utf-8?B?Qnc5WWhTQTAza282VlVTcEc0azJyRy9BYWIvZ0pKZFFicmk1YVVOWFJKRHpk?=
 =?utf-8?B?OWMvdDhOdUxQdVl5OWYzclVzNkJUQS9xQmtnQ2Q5eTdwQlByZTc4OTBaakpF?=
 =?utf-8?B?a3B0YWlKOEVFY1crUnFaRitsaG55UW85K3ZUUFAvZ0dLbUpLYWRWZ0VJZGhF?=
 =?utf-8?B?NmQ3clh4U3pPYmxkTzR5OFZ5QmdPTzZnNEY5cHd5RTJtZEc4SEVWZjNiV3V5?=
 =?utf-8?B?M3Y3aFRuY3BvSldTd3dOZ0N3dVppTDNJM1dPWGx3dzFRSnZGaDBJeThCYjRT?=
 =?utf-8?B?M29adXM2RE9JTnNNVlZjalRiVWFSdVFPY3VQaTUyQU9QZlJsMjFxcldGNVdw?=
 =?utf-8?B?eWQxaHVnNXhCM3M1Q3k5dmJkdERLcFVrZklkcElRb1BSLzA2MG5pZ2JoS1Mr?=
 =?utf-8?B?TXc5c0l5SXhhdkZOb2NiQklqQlpKNDZmaWZIYVFpZkVXVEUwTklINmhlTXdH?=
 =?utf-8?B?ZlIrbXlLV1Y3cUdveEJ4eUR5OTVOVi85NGpmN3R6TFpBaGpRdXNaaCtRZEJ5?=
 =?utf-8?B?dnRyNmJ1OGFtR29BWlB4bE1tSllsb0VDc2ZobTJPakRaMkhLYy9DUlo4VUpD?=
 =?utf-8?B?OXhoYTBYWjVLdVR2ekdWdllXQjkrcVNlM0ZCOVFyRFZ1RUZ6OU9MdDBuMFFO?=
 =?utf-8?B?bXJWZkgxYXVoa1JIR3Z5TUV3ZS9rTG5mekZiVFdiQmVIeGxRbXd2aVpkeUpR?=
 =?utf-8?Q?Ffb/Y7eXrC4m9qK+8p+75yc4zUxfkJfJfD23EUi8KEtZ?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 9ea2df11-0f6e-49e3-9c76-08de3ec33a34
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Dec 2025 05:55:35.1360
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 oG2EYUwMtsvyTqeb1GHQT7eVxkfO18uaTZQWeW33hGpnhQHc+o7jNDkRDAJhvIz32/BQeqZpef57r2sxOyXu9Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7250
Message-ID-Hash: F66AIEXU4O2CMDJDNYFVMBP5YH5EUJ5H
X-Message-ID-Hash: F66AIEXU4O2CMDJDNYFVMBP5YH5EUJ5H
X-MailFrom: acourbot@nvidia.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/F66AIEXU4O2CMDJDNYFVMBP5YH5EUJ5H/>
Archived-At: 
 <https://lore.freedesktop.org/DF1YM1GU7MKN.1MKJHK0BLBZ1@nvidia.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On Fri Dec 19, 2025 at 1:34 PM JST, Timur Tabi wrote:
> On Fri, 2025-12-19 at 12:43 +0900, Alexandre Courbot wrote:
>>=20
>> Yes, the patch I sent in my previous message was in replacement of
>> yours, not to be applied on top - I should have mentioned that.
>
> Ok, I will replace my patch with yours.
>
>> > and with the padding removed, doesn't this
>> >=20
>> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 dma_write!(rmargs[0].=
inner =3D fw::GspArgumentsCached::new(&cmdq))?;
>> >=20
>> > now only copy the args and leave the padding completely uninitialized?=
=C2=A0 That's okay, I
>> > think, I just
>> > want to make sure I'm not missing anything.
>>=20
>> Since we call `alloc_coherent` with `__GFP_ZERO`, all memory will be
>> initialized to zero before that line is run. It's not 100% ideal but
>> does work.
>
> Ok, I get it now. You allocate the block, and then dma_write! memcpys the=
 GspArgumentsCached
> that's on the stack to it.
>
> When you say it's not ideal, is that because it still has to do a memcpy =
from the stack to the
> DMA buffer, whereas Nouveau was able to write to the buffer directly?

It is not ideal because you can end up DMAing uninitialized data to the
GSP if you don't allocate using `__GFP_ZERO`. In this case it is not a
big issue as the data is not expected to be valid, and is never accessed
through a slice, but it is not 100% bulletproof by design.
