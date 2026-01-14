Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 62A1FD1C2F7
	for <lists+nouveau@lfdr.de>; Wed, 14 Jan 2026 04:03:57 +0100 (CET)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 337AE10E263;
	Wed, 14 Jan 2026 03:03:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="fREUjloX";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id CB52744B8E;
	Wed, 14 Jan 2026 02:55:24 +0000 (UTC)
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1768359324;
 b=ns95OBrgeA3L6t1GfYwjtCLtBbiPn3R7v8/CUuH5fZDu0g0UadYBBLSmWJt3YeroYzEqv
 u8aj+PJ9VpKcshcV5jO8pjM3aKhr0UjLuY6AL9Ow9u77pxiIXNMUZls6i0BE/mbcCB/R/UB
 mxi0XbGFA7eRjFG5EG7loNw24IiB2nn5U19rkVge2BunhMcBJYn26IKgZfFKcjWOmf8TYQN
 u++naMh2QS+UvtzY2VljQcXHoKmxOuTN2Hmavl5Soa8ts3h2MilA/MuANLu8Kt2SyKwJMGr
 oYTe3cdIJBhEKOmojY5Vtaba5Nz1K75/S+pNismgL+4Ly3d+on/2/iAOAG5w==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1768359324; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=czR9Zl4WBg+U3B+xc6Mi8JgpFXkIMaA/VnxRtk8cYp8=;
 b=riHDlagO1ppp1zZvFzvmrOck4yQ14vGrUknL2QtCIR2orpX3rp+OfH7ArPD/fmRv6vuhr
 JVB6GLOCCOcSynKAi7DbLufeFJmZKkJfJVF9ciNpeIh5hcoulfBYx6NIlpeRDu5QptdXjKy
 B77Wk7IDTIkqH+gXE6xz2I4yewtEaAv+Ay9irDzUiOobgaxj9r3sm2WrDoLDjp/KB/YPXB2
 icCvrIQofmotm8haP6Ttc086oI73hEWAvjt54j02BeCzCJxelDqT+LN4r9hQ/MJ7uOjuADY
 UG3XOHLFTfi8lCYC056hUjIjtAKyVxMJkbn3MWC+V5MZn+i+yR/Rta2TgSig==
ARC-Authentication-Results: i=2; mail.freedesktop.org;
 dkim=pass header.d=Nvidia.com;
  arc=pass;
  dmarc=pass (Used From Domain Record) header.from=nvidia.com
 policy.dmarc=reject
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=Nvidia.com;
 arc=pass;
 dmarc=pass (Used From Domain Record) header.from=nvidia.com policy.dmarc=reject
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id B0E7F44B8E
	for <nouveau@lists.freedesktop.org>; Wed, 14 Jan 2026 02:55:22 +0000 (UTC)
Received: from MW6PR02CU001.outbound.protection.outlook.com
 (mail-westus2azon11012009.outbound.protection.outlook.com [52.101.48.9])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 8221410E263
	for <nouveau@lists.freedesktop.org>; Wed, 14 Jan 2026 03:03:52 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ptkklyy3jQ6eZRb80WlBVgtRmDLhy83y8einXctY5c6pnyEalqVDEZpLL3kNRB9szc8BWR/Dgl9OKYqLVQTScRJmoY07Saxw0B33CHu3FQJVedYz5i9QTEULbd/VirOxW+KCdNjOuXglXKqSz/KdorJP67/59MM7ecop7SNFVSYAnZEca2qcj4b/kqwUICZ4RMc7cEeoIxwAVfNm9ux/pPl/6QMAM/iMvMAGubslMW8SENX/mxMzIhKeV72ryC8vcWxrgIV9Qa7WCvqhJRecwsRlRE5i/CZ2fOJL8To295pKq5gWCO2WECdznNjC8KQ75aOdCZWA8XuOnFx1LPjX/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=czR9Zl4WBg+U3B+xc6Mi8JgpFXkIMaA/VnxRtk8cYp8=;
 b=uIOeKT+AwB1BaSRHwj/A2nSttUGYlYOve9a/lC4wjK/843OKP/IOff3lDJVOTZTYRQmoSp15Hd25obrVTc+nc3ss56F3veVPrfdqy5Xka5rH0Uf35PoCvglh4iuPx6AkLaYwvOg4tWREw//9siWDwdN5qgKqc3tgWcyojVQ+LjGrfDgyMr2SAlxrZG/kCj5DN4uSSbTqaa2Df0S0AhMjPyZOYWcBQXoS2g+wiYb2ndT7spi6s/+Ly/ssFHNS/6mjHINZe1BI0/9epKtf6hVzfo6Vev5aDYcGnXgckD/0CkaOc1I7FEkLXemZVMDePPf9dVzx/cxOorSqp8TEiSX4gg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=czR9Zl4WBg+U3B+xc6Mi8JgpFXkIMaA/VnxRtk8cYp8=;
 b=fREUjloXccyvn96M9x8DPHW2dKmfffMNeE0oAtk+0lck93cRaEiEgPWktSACoY74Dym+rG9mbuDPLue73qwQA/BbG4e2HdjOYsN/uaQWUlVArZz1vn7PVlaW3dNy9WhrfGUJNjAyr31q4kPPGxUMjiq6FuT0DqKspdnwraxKvdhDNLqa3x4/sxqwZewbg3eUHa+/PCmBs+88fPyPWDmXytDBaAYHP2cHPfcKQh8XyZrO1Mdg3EBKdV0UCAuSYi3+4VupF7568sth9tv450MALd3vCc5gURulbuDOMP5/PWWGUbAlGFWqGn0tJk8Ka34dp6VW0+CKdfkL5aENGyu24Q==
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 CH2PR12MB4182.namprd12.prod.outlook.com (2603:10b6:610:ae::11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9499.7; Wed, 14 Jan 2026 03:03:49 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%7]) with mapi id 15.20.9520.005; Wed, 14 Jan 2026
 03:03:49 +0000
Message-ID: <ab8d6f00-bf94-4fbc-a1c5-d7d22af9479f@nvidia.com>
Date: Tue, 13 Jan 2026 19:03:04 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 07/31] gpu: nova-core: set DMA mask width based on GPU
 architecture
To: Gary Guo <gary@garyguo.net>, Danilo Krummrich <dakr@kernel.org>
References: <20251203055923.1247681-1-jhubbard@nvidia.com>
 <20251203055923.1247681-8-jhubbard@nvidia.com>
 <DFNI82AQBBUV.1I49DFIO8072F@garyguo.net>
Content-Language: en-US
From: John Hubbard <jhubbard@nvidia.com>
In-Reply-To: <DFNI82AQBBUV.1I49DFIO8072F@garyguo.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BY5PR17CA0054.namprd17.prod.outlook.com
 (2603:10b6:a03:167::31) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|CH2PR12MB4182:EE_
X-MS-Office365-Filtering-Correlation-Id: 3138be64-1b18-4a5a-e1b4-08de53198a1c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|7416014|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?Z3Y4TkU3WlJkOWd4bE50cUVnSktkN2c3WEpPUnFMQnVBQ0JFZHRlNTk2c3Rl?=
 =?utf-8?B?aDZDdWhJVU41bGlNS01hRXg4SXdZSDl2YUxVUGpCdHJMWVFDc2hZYW9xVGls?=
 =?utf-8?B?ZFJGVVkvUGRaamxIN2IxU2R4dXN2azBwVEVySkZTVUdBREJnU21jTkp5MHIv?=
 =?utf-8?B?b3VSYnFpdVBNdlJ4OEdoVmcxV3lSSkliK2cxUGlIY201SC9aV0NjcEFwRE5T?=
 =?utf-8?B?UUhvMDhzenNhdlIwQzNyTWZiUTFOUlV5SFdSd3Bxdmp3VUo5cmVlQlBkWjN3?=
 =?utf-8?B?czNZV3NMeDVITkp0dXJWRUROK1Z4VHdmS2tEclg3K0tYT3IvVmZFeUhxQ25h?=
 =?utf-8?B?TlNEa0NpbFNFekpSN3lhTjh5Rnk1eW5XQm5CTXJiU3MzZkh3dGFWVFR6bzgr?=
 =?utf-8?B?S2NacXZiNHZuTzNXanU2U0RGMXlqNWc3cjBMUDVobFN3WjIrSzlUSFQvcWIx?=
 =?utf-8?B?R2Q5bTZKb3pNRUZ5dzJFa1hRa1dpSk9BeDNoQlFxY1YvM3NBK1VHaWJBdXpt?=
 =?utf-8?B?ZTdYUGhqV0F2Q2J0VEdpclVqOTg0eHh4eUJONGE0RWxoZWhkMUhKd0U2VWNj?=
 =?utf-8?B?YTAwblhzZmYvdng3cGNSQzdpaXY4c1o2YzhOSjljUDVrT29iejNFYjJ0aVAv?=
 =?utf-8?B?aHgrcVFxaHkrSE9yRWNQcUNaNFcvRklVU2ZsUklUVTBtRWNTMU15eDBOcC9u?=
 =?utf-8?B?Y0owb2dIczcwTzBxKy9HM2MzMGRqTUd5WGZ4WGpqV3MwRFNhbFBpelpuNUJM?=
 =?utf-8?B?NHZDeHo3WmN3ejJMVVNvQVBwRjByclFIRG9MZkZFMTQ3d1RDWVlPY2x3bDlh?=
 =?utf-8?B?OXBkVFhxZGVndkd4WE02TGEvS0VPOXpzcUgvNitZOHBodHdHNzhRYmVvTDU1?=
 =?utf-8?B?cCtzWng0SmVERng3Y01oLzVVT3JrY1pabCtFRlFUK0V0UlZVK08wR2d6Z0RC?=
 =?utf-8?B?ZDlJVElLK1NwVldnRFcvSzNuMWtvNDMrSnhkcjdhTXRScFVHNmJCMnRzOWw1?=
 =?utf-8?B?WnBVMzZJamZORWhyNVhRYW1zMW9nbXVrTndCWUd3Z250U01zMDcrMlFtQ3Ax?=
 =?utf-8?B?V3U3SnJaY0dtWWdsemFRNjE5Q1IzUGl4elNsQUhjcldIaFBrSVc2TDJOOUor?=
 =?utf-8?B?anhTV0UyeGFHcThpcUpuT291ZjJTdUM0NjRPeFNpZzU4bERRckFPZnQyVTFB?=
 =?utf-8?B?MENYTDUzbEVPdE1haURRSjZGM255SUNCUW1YYTJmK3ZSN3haWllmRjhpTkxP?=
 =?utf-8?B?VlNqcVZLR1lVNlpIaFNteklFKytOR1VXWjlhaWNzci9ubGlTa0NhV2RIUWJq?=
 =?utf-8?B?anN4aTN5YmtFUlV5QnBMSDBsU0UxRXA3bHNMRnIvQXRPRDZYUm9pUGxvalJ4?=
 =?utf-8?B?UzRvbHFScS9qRFNoaGVEeHo5eTNRN21oV2RiaCtIalhmUlh6OU9TMEJtWXFB?=
 =?utf-8?B?MVFOK0FGR3B2SmRDOWtiNTBQd2RqT0lTdlZEUUZBb0lnQ0d5ZDFGTUxGMng1?=
 =?utf-8?B?TlJ5TTdqK1dET01OOEREWUVDNDVuUGNSSkgrWVovMURKbHJGNVpUeHZjL2JW?=
 =?utf-8?B?Z0ZoODJCK00xWXM4VExjS05ZWjFCZWVaeEo2alR6a2hBS2VuWG1HQW1weThi?=
 =?utf-8?B?VUNGa2JzZ2lzVzdwRzJkaVgvYlB3NkkralhRd1V3L0phZXFlQTk4ZFZkSExF?=
 =?utf-8?B?K2VnUnluS04zWjhhd3JTUkJldzBxaGsxTlQ3N3hVOHNzb2ZzWk1tZmxmOWdD?=
 =?utf-8?B?eWdRajRiR20xdGo1MDkxTTFGVFNQaTZkMUY1UU1oQ2ZDdzRBb094SUc3K0cy?=
 =?utf-8?B?a1Q2S0FYOUxHNXVORjBYd0U0M0diR1piQ1AwczFMQmYvd09iVFBraGhESjRT?=
 =?utf-8?B?Q1Zmd3ptMUFUWjlBbFBUVE9IT3FYZmNMcTl3Qm13eUxzajJyT25lVURCMnBD?=
 =?utf-8?Q?eOuTyJVrJee3Z7HPunZ1k+7k1Z46D7zI?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?TTlaY3NCekxnYTdVTWRwQkI4YUhRaTd4Y2F3ampRQWc4WmJ5OUZ0ek9VTUp4?=
 =?utf-8?B?OXpRUUJINkRtbVpYZU5jT3Y4R0JlYWk1YXRhWitHdEc5UDJ0QzZwbEdMNklW?=
 =?utf-8?B?MDBsVjBSNVJFWi9UMDBlclJPdkQ4dFlhUnZlSW1wT2VkMGorcHRSMFhyYk4z?=
 =?utf-8?B?OFg4V2lMc1dXaC9SK3RENmtkTmJHVG5vR0xqc2dvUy9OUklNVnBlOU1vK2hy?=
 =?utf-8?B?MFZDbk1NUGoxQ1BjYm9HVndjRzc5MGRxWkRxc3BaWHhJdEpjdC81YklmVklV?=
 =?utf-8?B?MXpqS21WVy9oWUlJSGVnRDlrVGhCQk1PRkhtVGU4R2RwNCtCT2IrRjZrOFVP?=
 =?utf-8?B?OTFKVTY2eW1mSFNXT2tqby9wSkQ4ZUw5QmJvNVgxdmIrYTlFMWJ3b2VNc0Vj?=
 =?utf-8?B?QVU5TEx0aXpPdFNUcDFwQzNpcnRnQ2dvT1dwcm1XLzVvWGRzd29iZk1sQlQ0?=
 =?utf-8?B?Y2NGV2dCdkpTVktaWFhRbWtsa2paZEl2aXFCRHFHdFlVK2hkSVhaM0FQVkVK?=
 =?utf-8?B?U2lYMkJPNnRGVnZmdTVaS0FydjVLWHVRSGRoa1ZTOEJpWmtSMG1OT2taeGdo?=
 =?utf-8?B?N2N0dmV4bFRsamx1Zmo3dE1UVW1FakRGK0lReXZDOUZpQy9DNitYcjduaCtq?=
 =?utf-8?B?azNnUjRZWThYckFiY2szM0dOOUJST3BMRUhrb3B6c2tLL3RHRFE3TkljMEty?=
 =?utf-8?B?bHVXSG9FRXpacmZia3ptTGJ2MkZnMWs3UmJIQ3lkeDlQb2JwRmNOTGNpR2lG?=
 =?utf-8?B?N2JVeEF3cENhVTNLaVZpWmVRWUNXQmltY0tqckxGd21kOThua05IV0R5YXhO?=
 =?utf-8?B?Ylk5blZsU2kwSEx6RHlXY2h1bWZtNERxbXF6TmZWbjd1ZElMeGlyMGJoc0Zi?=
 =?utf-8?B?eWphWnpkM2l0OXpWS2ZhYndMTDRkYzhKRDFKcmtTTW5LRGtZMHdidVF2UkZZ?=
 =?utf-8?B?WmRFaDE0ZzlLVnhhTWRVNzJDcHJXcnRvdmMwRGkxNkg2ajlkSXlpWmNXb0Uv?=
 =?utf-8?B?anZuczl4djYyTzMxL1IxZ1pTOEJIUENrMnNkRFQwcEsxcnZSQmFua1l6Tlpu?=
 =?utf-8?B?OUd2OXZaMy9wQnJkT2hlN1VmMDJjRmxETkkveDh1TTAveUNDYkZCc1hXVktj?=
 =?utf-8?B?SFI4VTdQblJMbTBEYlZBdkxZd0l2VjFFYmJxNFk0MTg3WUYwUS9qSXJjMnRj?=
 =?utf-8?B?T0IwbHhqT2JZRFRqTXAxbExBNUFjNERLNTJ5c1pLaHFPQUErRDdRV1BDeG9I?=
 =?utf-8?B?cm84ZTdncThvem8yanFDc0FEWUtzK1o3U1lYK2U5ZnAyb2xlRkFsdjhvZU9G?=
 =?utf-8?B?WlFIRWFKRnV5L3dsOFBkSWkxbnQvZW50dWxMbytwUFNwNUNaNmNBS3lna3NP?=
 =?utf-8?B?bjU2N05ieU9LRk5waVo1MG43STVVbGRaOXBlaHI0ZTRZWjRRY3EzcUlxSDRY?=
 =?utf-8?B?QjJyTzZnZlRWL1JhWkFMY1l0L3hUcEhkUThrSExoRlRkMzB5c0g2YXlicmlG?=
 =?utf-8?B?K2ZYbU8rMVZJYndrNkVHZm1DS005QVJldTlBTldDSVRzRW9KTnpjemEzVzJX?=
 =?utf-8?B?U1BHN1AwZEQzaTJJOE9iSVg3eVRoaXlLRFdJMW9TNVhFN3VudzlnVStaVWJv?=
 =?utf-8?B?N2N4MGduclVtaElnQThFRFFmR2dQdlFvcFJMQWV3QWxZbmViYmFaM0sralpF?=
 =?utf-8?B?WTNmYXoyVWRaYUJOd2w0NHh0YldreURBdjh5clA3d3BienV4ZklYbnNqbkxn?=
 =?utf-8?B?SVR6S0pXQkRrWGQwSklFNWE3eTRadDB0Y0U2T3RQR25PYzk5a0xSMDh0L1hp?=
 =?utf-8?B?bXFKVWxnOFMwOHdZbTgwVUFLNjRKYkZST1MwWVFxN0thYU5TcndFUUh0L2JE?=
 =?utf-8?B?UkExSUdsM0tnK0c0c2VVOEQ2VnVoWXJXdk1GMUpHaFVqczA2UUpya2tJeVEv?=
 =?utf-8?B?WEc0WmdFUUpLdFNlcVk3VUJkWHBVWGNqL1R0OW81bjZMdkROUU5oQjQ3clh5?=
 =?utf-8?B?NWo5Mk93bUtIeTRYZllsYUF5ZzF0SWhUWHJnZUJPQjFBMGNVMzUrcFQyNHdO?=
 =?utf-8?B?ZDhqVldYbXNBVW5rWjF1N0hnTHVncHp2YzhKN2UwNnVEeGZORVJOUHJCWm9i?=
 =?utf-8?B?b3JKQjBqS3JoTkNmdXlyanIwUGx3Uk5xWGlBVi8rSy9rR01BNzdHY21CM1pq?=
 =?utf-8?B?MVFLZjd4NVRoekFBVk9ZcUVsOG1yeWJqRXdXSHhtUnVBZVd1R2gzM3FSam1W?=
 =?utf-8?B?VjlQRlM1Zkd3UVoxZWpyRDZKWDl6VmF2UWI4YUgvVTNwVGhHT1VIT0J0d2U3?=
 =?utf-8?B?MWtJYW5PS1IybHpsbjYvZ0h5UEdBMStDckppdDRqVGlxRlRrVlFLZz09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 3138be64-1b18-4a5a-e1b4-08de53198a1c
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jan 2026 03:03:49.1413
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 sQzNDTDkNflNho0vbbsBBQ4tl+ixihU7nyk6/RvqVoYyCkajdxmkYcDihsJWpy93z60Oa9xoC5GiRHkOzVvPXg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4182
Message-ID-Hash: VQO7EXORXO23SU2IHBJYOYDDCUONP64S
X-Message-ID-Hash: VQO7EXORXO23SU2IHBJYOYDDCUONP64S
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
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/VQO7EXORXO23SU2IHBJYOYDDCUONP64S/>
Archived-At: 
 <https://lore.freedesktop.org/ab8d6f00-bf94-4fbc-a1c5-d7d22af9479f@nvidia.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On 1/13/26 5:43 AM, Gary Guo wrote:
> On Wed Dec 3, 2025 at 5:58 AM GMT, John Hubbard wrote:
...
>> +impl Architecture {
>> +    /// Returns the number of DMA address bits supported by this architecture.
>> +    ///
>> +    /// Hopper and Blackwell support 52-bit DMA addresses, while earlier architectures
>> +    /// (Turing, Ampere, Ada) support 47-bit DMA addresses.
>> +    pub(crate) const fn dma_addr_bits(&self) -> u32 {
> 
> How about just return `DmaMask` from here? This get rids of the fallible
> constructor call of `DmaMask`.

Yes, that's a nice touch, I'll do that.

> 
>> +        match self {
>> +            Self::Turing | Self::Ampere | Self::Ada => 47,
>> +            Self::Hopper | Self::Blackwell => 52,
>> +        }
>> +    }
>> +}
>> +
>>  impl TryFrom<u8> for Architecture {
>>      type Error = Error;
>>  
>> @@ -203,6 +216,20 @@ pub(crate) struct Spec {
>>      revision: Revision,
>>  }
>>  
>> +/// Reads the GPU architecture from BAR0 registers.
>> +///
>> +/// This is a lightweight check used early in probe to determine the correct DMA address width
>> +/// before the full [`Spec`] is constructed.
>> +pub(crate) fn read_architecture(bar: &Bar0) -> Result<Architecture> {
>> +    let boot0 = regs::NV_PMC_BOOT_0::read(bar);
>> +
>> +    if boot0.is_older_than_fermi() {
>> +        return Err(ENODEV);
>> +    }
>> +
>> +    regs::NV_PMC_BOOT_42::read(bar).architecture()
> 
> Can this just be `Spec::new`?

Yes it can. I've fixed it locally, to do Spec::new() early and pass
the Spec into Gpu::new(), and it does result in less code here. Good.


thanks,
-- 
John Hubbard

