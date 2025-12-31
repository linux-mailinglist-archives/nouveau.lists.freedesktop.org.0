Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EEF42CECA21
	for <lists+nouveau@lfdr.de>; Wed, 31 Dec 2025 23:33:49 +0100 (CET)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id BF09010E9D8;
	Wed, 31 Dec 2025 22:33:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="a3lFI8C3";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 0F07644C84;
	Wed, 31 Dec 2025 22:25:48 +0000 (UTC)
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1767219947;
 b=gNGEe9rDEviJ3MjlQB9SGxgnTe89Y7JJvArPgUYRh1LN9SK8TSLWMvxpj4GKIaPqUk+hf
 hQdwyULOnTJETL7NJipIycfPwOeEW1/JCa27DmpE1hO68Onq3Ks1hcA82twtbo821QEzF4P
 30NVJ+spiio+I/YNXpQfQqtMGd1+TyK4Ffx8VhC4O1wupzygpN7G/H+DeyiRPfpdB/IMOol
 O0JuEpBpuMzioPMFinVxqyEWt4cXWSk0IVYPjm3j3Qwy1L/LCMh6frfAAM+VRxZRVZydMtp
 kS7WYCInsHAbMOyBXFphf9K12jfpANkA3JHVZHD2rYYNgHJJ1/vZCM2eMwfA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1767219947; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=qMxPekPzFAs2X9o9ZjRGIknVEn56GLNYKsy4J5ys5zc=;
 b=yqlAukKUXeaFZzzSxboXPVyz/akJJGakbTu+X0tsOqkUKlBvzzVY+c6rR2RVqtdj9rRVj
 xIrTTD2fucnv2j63CQ2K+JjRzqySllV64hzm9SOpgVcKz0EljzcNPvGetGWQg2IuMoTrTEc
 FoFDtrXXW8VbTxzjIoBPZUjPvUCvwfmSTOo5dPWVhcAIaMMx6ty1MYW0uCggnkKy8r1I1HT
 9Ix9lkDREsvAZoh2ZoPbjStksaqgestbNA7DdNrcjmv183w2Sa4Me+elHwY4dV8F2TLCfQf
 7KP0swTKoHsdczGufORKbKHdiNKfpqiSwhOWCbM7abYn50XinLCjkD8fWQzQ==
ARC-Authentication-Results: i=2; mail.freedesktop.org;
 dkim=pass header.d=Nvidia.com;
  arc=pass;
  dmarc=pass (Used From Domain Record) header.from=nvidia.com
 policy.dmarc=reject
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=Nvidia.com;
 arc=pass;
 dmarc=pass (Used From Domain Record) header.from=nvidia.com policy.dmarc=reject
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id 36B5244BF7
	for <nouveau@lists.freedesktop.org>; Wed, 31 Dec 2025 22:25:45 +0000 (UTC)
Received: from BL0PR03CU003.outbound.protection.outlook.com
 (mail-eastusazon11012047.outbound.protection.outlook.com [52.101.53.47])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 7992E10E9D0
	for <nouveau@lists.freedesktop.org>; Wed, 31 Dec 2025 22:33:45 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SEjnXGwg8rFC3WIGKkG0iUCGiW3Yow08i3l1IkWeDF3UuDOE5g4IMG2xARS9P94T9ZLjgsTosbTtEUdJqdKS7ZPuagrvs4D8A/9urUWhkoVcefHeydcyKeS0t6Q5ZjslgQwvwByA4nc6d/SuF/OJAPoLrClDu8OURxBUZ0jcf3GHHMyMqv8+DUas3+ho/gI89GxkqE0aqUu3cL4UBQXEuzYFUUJFJrPrn6hXiXnJg1q/0zCqpH9/wAL/yDm/f4yHTlFjcauHxy8SXcXGQRN6vUnraKvrAqBY16pUdBuxvF0Cs41wnAEe+rcQREvTVX8I0rge3Ybt/AvJpRCGvnSSaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qMxPekPzFAs2X9o9ZjRGIknVEn56GLNYKsy4J5ys5zc=;
 b=h3rGnf8Noj4KyDzMHku/sOkZNaQrC+p0L3FAkmIG5B7UNcXl7WfzhzZmczB5Q/ywZZ02Lp+Ez3aRXIYjo+kYqLlltbAoJZiRhoVyFPMLtNg7dkwTFXr3A3sHa8FLv2NDl08cmEz0FPFB8gdiQJqJ7OsYmraKac3Re3ilz9a6KCi4tPb1oEFTHmDIEzWEZHNWaoH4ApvqC/wYwox8wbg9i4KxQe4npSdAEZBTDs4vz0TgIMIpz4O8AfWpe0TTAUPN7OY40e6olAFgqCxlxeAHr4l8ZFdiVlTgbfxx5xyQ3b+BoKvqPjsy5YVsWGAB3izPoh0DZfbaJUdQ1ieH4rY+OQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qMxPekPzFAs2X9o9ZjRGIknVEn56GLNYKsy4J5ys5zc=;
 b=a3lFI8C3BD0AxOvjVb7rLlHoEU8Ycfm/8WNiiMyOnfqjDntUJSaivzTDCuLxxwiFa7p2SoRH5L7nyGcAvVbLXluh5IwXJ/hPz10GofTtRVa+4KQKcalBFTOBCGeZuwsHWn4mTSOmWxav1ryDA74tZT+MeCxP19fK2YpxEngvviDiQBpas4fzKhe8n1vLUIa6mhbzEnMUkAiAXlmRl+LRCohX/zR/g8hZXE23jpBTeRs/pIjfshAU5G6+qO0vTQFi6FyeqOUBDpvx+oMQs2Y0PWKBylcEwOCgapwtvVDauujxJSmD9OOXvpuJx9MSaZD3uJrOofSxRLYGVjxdnTs3iQ==
Received: from SJ2PR12MB7943.namprd12.prod.outlook.com (2603:10b6:a03:4c8::10)
 by SN7PR12MB7935.namprd12.prod.outlook.com (2603:10b6:806:349::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9478.4; Wed, 31 Dec
 2025 22:33:41 +0000
Received: from SJ2PR12MB7943.namprd12.prod.outlook.com
 ([fe80::6a18:df97:8d1a:5d50]) by SJ2PR12MB7943.namprd12.prod.outlook.com
 ([fe80::6a18:df97:8d1a:5d50%4]) with mapi id 15.20.9478.004; Wed, 31 Dec 2025
 22:33:41 +0000
From: Timur Tabi <ttabi@nvidia.com>
To: "dakr@kernel.org" <dakr@kernel.org>, John Hubbard <jhubbard@nvidia.com>
Subject: Re: [PATCH] gpu: nova-core: bitfield: use &mut self setters instead
 of builder pattern
Thread-Topic: [PATCH] gpu: nova-core: bitfield: use &mut self setters instead
 of builder pattern
Thread-Index: AQHcep8T3DpSJh2ak0mVgGL85ruklbU8VccA
Date: Wed, 31 Dec 2025 22:33:41 +0000
Message-ID: <9db27bd6015ccebaa20e51450d8c42eb2864cb2e.camel@nvidia.com>
References: <20251231214727.448776-1-jhubbard@nvidia.com>
In-Reply-To: <20251231214727.448776-1-jhubbard@nvidia.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.52.3-0ubuntu1.1 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ2PR12MB7943:EE_|SN7PR12MB7935:EE_
x-ms-office365-filtering-correlation-id: 3144576e-f7f2-4f6b-72a2-08de48bca686
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|376014|7416014|1800799024|366016|38070700021;
x-microsoft-antispam-message-info: 
 =?utf-8?B?YmdiVkd1dEdGaE9OSHQ3c29wMFVpblVYSG1GUndjc2FkYzBMb0RYRDFrazFr?=
 =?utf-8?B?SUUvUENtejFGeW5qZU5zOC83RmNza2JoUHhVNlA1ZUZRdDZLUnl6MHVyWWpK?=
 =?utf-8?B?QkdQUjlQRnNwUCtRdHR6WWYvVDNCWWFiM2VXVVZoT2RMNGhrOGNxbmRYdnFw?=
 =?utf-8?B?czZvdXN1REFLblZTY3puWmV0c1pLOEFxc3VaRkJDOWZtYngvdzJYMXhqSHUv?=
 =?utf-8?B?WVFEMU9JRXBkN1lyV2YyeWl5Sm1Nd0RsSzFIU1RPYWZabThUZE1QNGpsREJ3?=
 =?utf-8?B?UDRubGt2NG9odUVMQlVqcjd2RFlncUNKa1pBdDhUZEFmMEw2N3JnTFhjN0Z0?=
 =?utf-8?B?V09pemJOWkxjRFRaSjd2S2tJcXJSdWVMRkVHbGNvdHFmYkxGL3hEUDQwVXdI?=
 =?utf-8?B?NENNSXBTcENHMnNiZ00vTkhlMU9GTjF0b3J6YUVEMGVaVk90Z0pncFQ0alRE?=
 =?utf-8?B?K1BQZUVlbVRNMXFOR0NDekVLUkJycldBVFdDbkVnMEpTSnpHV3h2dVA5K0cz?=
 =?utf-8?B?QktDcC9zNUh3SXk2SUJVWnNiS0JxbVdyNlVvWGhQQm9sWVU4YWdmTDZoVkdr?=
 =?utf-8?B?bmVxelZnbTcvd0RuNm5SbEkzWDA3S0FNQzB3Q1IyTVlzejUzeVBMWnRqWm1J?=
 =?utf-8?B?NFIyZDJBeFJnOSs4RlN2Ty8xQmhVZXk4cGZEY0tsV2J0U0JUVml5dk8xVjVL?=
 =?utf-8?B?NlQ5Wi9pOEkvZFRKbTZzU3NmWTNxYUw4L1hQQlBSUTRidVcvalZUS2x1NDdP?=
 =?utf-8?B?clBsRm4vUTNvZXloRGJ1RUhGQ3Q2MU94RXpDREkzWmM4OUE1aHBiNzFuM3c0?=
 =?utf-8?B?R2Z0dCttbDVWdUdSYjlGaFhNdEJqcWlHZXgxcTR0cjRUVk5uaFIvU0Y2TmJu?=
 =?utf-8?B?a3c4eUFZNm9jREorQnowL0pESVJHU0drdjgzOUp2cm1EUmlqK3hIOGljUmNS?=
 =?utf-8?B?SmZvUG44cUU1bWdoNlpLUnRyUjVzZG55MmllS2kySTRTOEF0NVlUWWZNZk0y?=
 =?utf-8?B?b1BVWnhMekE1aytkcUk2V3dEMTMyT0p4MGxJVW1WU0pFc2Nwb3F6aWJsMXkv?=
 =?utf-8?B?bldldG5LNkFvZWJFbmVlUk1sbFlOVnZ0YUdUR1AzS2xtdk9QYmJOazhEWWNo?=
 =?utf-8?B?dnVBZmFiZW90SG9uZ2UxMC8wMTAwU3Q0WHZ5Yk16Z2VDdkNaSG9wWUJHT21X?=
 =?utf-8?B?VXBGRkJHMGlWNXh6OGJ5c2xhOVRKRU45blV4endKbC9PenkvdzhkVVFCR1RJ?=
 =?utf-8?B?N3dyYStzTDZmTUdUdGs2WkU0Wmc3NVBxd1dwSWo1endRblMyQmZMbU5lbFN0?=
 =?utf-8?B?Y2JndmZGalpyRjNjcWdVY0Y0QXd3ODJNWFJVV3NTK0F5T0lHcC9TdHdKZE9E?=
 =?utf-8?B?R1ZtZ0FrbVZOUkEwVDJPSlROcmxYYkpUVVNzejhSSFY3ZGFDcFhRTzd6aTlo?=
 =?utf-8?B?T0xuRXRrTEw5Um5ZUjc2TGJFT1VNQ1lVTC9MVnE3SzRsUUVzZzVGSEZqMUc4?=
 =?utf-8?B?c3I1WndyK0Z2cnVscHFQTSsyZUhrRmhQZjF4SC94enhPUFkrSVNxM3FYZzZq?=
 =?utf-8?B?L0U0ZEFjT1dyRWRwSmJuWmx0NGFWenl2eDFqT1FMV0ZhS25MY0I4ZStzcFMv?=
 =?utf-8?B?aXZ6RW9RSWFqaXNQRzhKMkNaQis4Zks4S1BDajZsd05IY01LczB4K2hnRGlK?=
 =?utf-8?B?d1JqeDBKS0hTTU9jNjl1dGhQWUVCQlNjRnBaQzgvRHlhSzArcnZiTWNQK1B6?=
 =?utf-8?B?R3FIcWZHd2ZOVlFhdGFGTy82aDY2Ni91Z3lSUTZQZWVhL1JianBKcHlYNmZB?=
 =?utf-8?B?ekczSlYwOFlsalVLYVJBM2xtWmVrNk9mWHAvSjJkU1pqOHhlWDdDcXFEZTBX?=
 =?utf-8?B?aDh0RUVVMlljbDQrNmNleXBJS0NGd0pnNkNoeUIvWHpKblZNQ1dTZVh5QkM5?=
 =?utf-8?B?c20vcTU2dWNVbkV3Rk9iNEs2RVBXUEw3MXB1a2lvR3pTNUVCTTdhQTlUSTEw?=
 =?utf-8?B?NFJlOU9pWTlFQjl1Mzg4bWI1ODdkbU5oalhRKzVBUWRMTnRucmNuT29JRysr?=
 =?utf-8?Q?UMG5Bv?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR12MB7943.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?R0R2WVVQMFpwdTV4eC92WDljUHZpY3RzWFZIUDMwaUVYRHN5RVM1UXpsdnN1?=
 =?utf-8?B?SVhOaGR2Nis5VWdrSTBVMkxxUTdCUE8rcmVRTHkxQXdHWSsxTCsyN3krTlBC?=
 =?utf-8?B?WURGOHhsY1RuVlBrTFRKYTZmZXAxSVpqQzdBY1NEbmRRU1NCWFlFcjM5OVRl?=
 =?utf-8?B?QW8xRHlZK1FmRzNWMEFXN25FYjZkMVphQzRuV0R1dXFaYVQ3TG05UWRvWmhC?=
 =?utf-8?B?SUhpTGNZRWFIRUR4NXlpQmc5SGFZRmxwWkZPKzhIQ2FXQW9GOVpQb1J2Ykli?=
 =?utf-8?B?TnlVY2VMMWtvNGlHa2l5eTNCQ25Qd0tNZ0xadmNKa1BPWDRyNEJ5Wk1ka0tE?=
 =?utf-8?B?Mi9JU1FVUHA1aXRHeHFxY1g1UWFLOTN2Y0dFakUvTUUybzR5TjBIeUJ0T2FS?=
 =?utf-8?B?TUJ5SjlZQWxxUjQwbk82M0VDZThVUXZGcUhKNXA1MW9Ebis2NUl1MnFjYXJW?=
 =?utf-8?B?cmZQeXZwWjZjT3cwVVNhTXVEZ3dDSEEvNlhyQUFrQ2pxNWJRVnNjSTBzWWhL?=
 =?utf-8?B?SkcveGRrS0U1TytOci9rN3NhUGw3NVpKOVQrTGNrWXpEMVdBVk5rci9lWDNJ?=
 =?utf-8?B?em1sdHZKVUt1WUMvR2V5YUdpMTdwL1RnWC9VNklybFpld001ZXlsZXJadklj?=
 =?utf-8?B?K1UyYU9oMkRDN2xDQ25GRXVCRXRLQ2N0WDFPMnZ3SG41ZnF0dXR1M0xEZjJ6?=
 =?utf-8?B?dktTbUVYS3JSeWJpdzVobnNySWhEYWhxbjdzTmZGejlLT1hLZUphWjlQbC9W?=
 =?utf-8?B?Q01OM0JKR1VYOUpKMEVQcXFVUVdZa1FPYng5d2YxNEdRRmZvWStZQ0Jxa0o5?=
 =?utf-8?B?eGJOVjA3dGVGMFdOcnpmb0NRTFNmdHRGNDZndUtCaVFYYUduTG5UWkFIK0Zt?=
 =?utf-8?B?U0ZoTmNQbVdhWE5UcUY4UjdLNGtaYXlHL3dyWXRiSkZObS9USHAycHcydTh6?=
 =?utf-8?B?dDRTd3dPUjYwdzVBYURtWjQ1eE9NSGlQelEvamttdjRaOE0xUkk1bEJ0NFRW?=
 =?utf-8?B?WjkrTjNBZDU5K241d1EyWW5qMjUxelNvZGZYZ2NWeWNmZzBFN1dkVjNyMFJO?=
 =?utf-8?B?cVRTYW1LQWcrYVo3Z21SM2VUNGg1RkVTQUdOSUo4dERKejdtOTRUMDh2OXE2?=
 =?utf-8?B?WDhVajJWR1JrOC9xT0JlejgvMFFyOFY5Njl2SXRmTUs5SzJkcEQwcXRnT01N?=
 =?utf-8?B?aVZDSG0ybm1yc0g1WGlXNHlQalQxZnpTMzNYOWZaaFhUbjlNalpta2RUdUdi?=
 =?utf-8?B?WFU1ckcrN1AzMUpuV01ja000djZlYnd1ckI3bDNETUtlK2hweXNTZEV6bmo4?=
 =?utf-8?B?RXRsWVp6cGpqZnJGL0hObkFOcGhIc0ppdlRhcXpCUzE1YkczY2hueXkrZ0tJ?=
 =?utf-8?B?dTBYbnRJSlVqTW1tdmtxaEhPdGdqT2pCUkRlTS95UFd5R21uK2tyMGxqRjF2?=
 =?utf-8?B?L0Z1OGphQS8rcjdnVE03cnlPVHFZQzNpVDIrcm45T2VxaCs2OTFlOEFvWEQx?=
 =?utf-8?B?NTI5OUx3WHUvM1lKMjk3UlM5V1FPZW8vd0tTTHNmamorY1IzOEdZMUMzVXQx?=
 =?utf-8?B?M2t5MUtKVVBKWTBGN2phYVVJcmlzd3J0ZUYvK29BMTZKZGIvOUFTcFBvM2Zn?=
 =?utf-8?B?TWs0clZxeVp0MDhqWVJOWFlGVnFwY1d2NGYyclFWeFNVaEkwQTVPVThIUVRG?=
 =?utf-8?B?cjVYVUE5RERsaWtiNmVBZGsxOVVzUmJ1NFZyb0RpbHNTL0t5SVB3NHVRL0gr?=
 =?utf-8?B?cEQ0SnhuS2xCdFNoaEJqMDhvUGpwNXdBcXlaME5wUUtRY1Nsb1hYZFF1Unlo?=
 =?utf-8?B?L1I2Y1BYMS9yajkxSTl6TzlTeWhxc0FIQWFSQXZkZ3NPTmwwbVd0OERWd0FR?=
 =?utf-8?B?d3BLU1QxV0E4YzFyUzB0MkVLbmtzZ05uaUFpU0JjWFlhazZjVXBzVytpZ1JG?=
 =?utf-8?B?WkVWbHdUVEptTnEvYWN1MlVCL1F0TVU3LzFzaDRMVmdqZjlNc2ZRSDJnSW1i?=
 =?utf-8?B?SGNXaC82clRxWmZwTmRsZUs3U3pKdnFrRFpIeDBzNVE2dzhHMXdwY0dNUmRq?=
 =?utf-8?B?YXlSUUNzOG1pMG1CTzBCOHJVU1dDa21DVURzSjAxTE8rTHhTWUE4UnVhTzkz?=
 =?utf-8?B?TVBXQXdrZ2xLcHpuU0dCTXhOZm8xdHBGNEFody9OOWpyMW1iOC9LK0NWTFho?=
 =?utf-8?B?RE1pTkwxbE1RV2MrTkN1WjNIbysvVU5ZZ0tLTGd5TUNGK01XWW9LRHBpbjkr?=
 =?utf-8?B?bm9CdzZvbDRYTHQwTEpSYTBBQlloMUZuOFFXUERXaGN6c0lJY2U4Znp1b0lT?=
 =?utf-8?B?bmRXRnNhcTM0aWdJcUNubjRrd1M1ZmdDWXhCZG9mUjNzRExHazdqQT09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <931BE86028AB0B4DA0414748E28C739D@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR12MB7943.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 3144576e-f7f2-4f6b-72a2-08de48bca686
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Dec 2025 22:33:41.8010
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 
 czsEDb4Szi1dA3Cx/+YNJsD8K/+fx9WnhHBGq5Ikh1Z9n7r9ukvnDxjimCfO+zDsO3GSZ8qQbajhBzyudvVgoA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7935
Message-ID-Hash: ECJUD4MMCOWDN4U5OYXHTBST67XGEME4
X-Message-ID-Hash: ECJUD4MMCOWDN4U5OYXHTBST67XGEME4
X-MailFrom: ttabi@nvidia.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation; nonmember-moderation; administrivia;
 implicit-dest; max-recipients; max-size; news-moderation; no-subject;
 digests; suspicious-header
CC: Alexandre Courbot <acourbot@nvidia.com>,
 "lossin@kernel.org" <lossin@kernel.org>,
 "a.hindborg@kernel.org" <a.hindborg@kernel.org>,
 "boqun.feng@gmail.com" <boqun.feng@gmail.com>,
 "aliceryhl@google.com" <aliceryhl@google.com>, Zhi Wang <zhiw@nvidia.com>,
 "simona@ffwll.ch" <simona@ffwll.ch>,
 "alex.gaynor@gmail.com" <alex.gaynor@gmail.com>,
 "ojeda@kernel.org" <ojeda@kernel.org>,
 "tmgross@umich.edu" <tmgross@umich.edu>,
 "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "rust-for-linux@vger.kernel.org" <rust-for-linux@vger.kernel.org>,
 "bjorn3_gh@protonmail.com" <bjorn3_gh@protonmail.com>,
 Joel Fernandes <joelagnelf@nvidia.com>,
 "bhelgaas@google.com" <bhelgaas@google.com>,
 "gary@garyguo.net" <gary@garyguo.net>, Alistair Popple <apopple@nvidia.com>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/ECJUD4MMCOWDN4U5OYXHTBST67XGEME4/>
Archived-At: 
 <https://lore.freedesktop.org/9db27bd6015ccebaa20e51450d8c42eb2864cb2e.camel@nvidia.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

T24gV2VkLCAyMDI1LTEyLTMxIGF0IDEzOjQ3IC0wODAwLCBKb2huIEh1YmJhcmQgd3JvdGU6DQo+
IFRoZSBidWlsZGVyLXBhdHRlcm4gc2V0dGVycyAoc2VsZiAtPiBTZWxmKSBlbmFibGVkIG1ldGhv
ZCBjaGFpbmluZyBsaWtlOg0KPiANCj4gwqDCoMKgIHJlZy5zZXRfZm9vKHgpLnNldF9zZWMoeSku
d3JpdGUoYmFyKTsNCj4gDQo+IFRoaXMgbWFkZSBzZXBhcmF0ZSBvcGVyYXRpb25zIGFwcGVhciBh
cyBhIHNpbmdsZSBleHByZXNzaW9uLCBvYnNjdXJpbmcNCj4gdGhhdCBlYWNoIHNldHRlciBpcyBh
IGRpc3RpbmN0IG11dGF0aW9uLsKgDQoNClNvIHlvdSdyZSBjb25jZXJuZWQgYWJvdXQgdGhlIGZh
Y3QgdGhhdCB0aGUgY29tcGlsZXIgaXMgbm90IG1lcmdpbmcgdGhlIHNldF9mb28oeCkgYW5kIHRo
ZQ0Kc2V0X3NlYyh5KSBpbnRvIGEgc2luZ2xlIHJlYWQtbW9kaWZ5LXdyaXRlPw0KDQo+IFRoZXNl
IHNldHRlcnMgYXJlIGluZmFsbGlibGUsDQo+IHNvIHRoZSBjaGFpbmluZyBwcm92aWRlcyBubyBl
cnJvci1wcm9wYWdhdGlvbiBiZW5lZml04oCUaXQganVzdCBvYnNjdXJlcw0KPiB3aGF0IGFyZSBz
aW1wbGUsIGluZGVwZW5kZW50IGFzc2lnbm1lbnRzLg0KPiANCj4gQ2hhbmdlIHRoZSBiaXRmaWVs
ZCEoKSBtYWNybyB0byBnZW5lcmF0ZSBgJm11dCBzZWxmYCBzZXR0ZXJzLCBzbyBlYWNoDQo+IG9w
ZXJhdGlvbiBpcyBhIGRpc3RpbmN0IHN0YXRlbWVudDoNCj4gDQo+IMKgwqDCoCByZWcuc2V0X2Zv
byh4KTsNCj4gwqDCoMKgIHJlZy5zZXRfc2VjKHkpOw0KPiDCoMKgwqAgcmVnLndyaXRlKGJhcik7
DQoNCkFyZSB5b3Ugc3VyZSBhYm91dCB0aGlzPyAgSXQganVzdCBzZWVtcyBsaWtlIHlvdSdyZSB0
aHJvd2luZyBvdXQgYSBuZWF0IGxpdHRsZSBmZWF0dXJlIG9mIFJ1c3QgYW5kDQpyZXBsYWNpbmcg
aXQgd2l0aCBzb21ldGhpbmcgdGhhdCdzIHZlcnkgQy1saWtlLiAgVGhpcyBicmVha3MgY29tcGF0
aWJsZSB3aXRoIGFsbCB1c2VycyBvZiB0aGUgcmVncw0KbWFjcm9zLiAgU2VlbXMgcmVhbGx5IGRp
c3J1cHRpdmUgZm9yIHdoYXQgc2VlbXMgdG8gbWUgbGlrZSBhIGNvc21ldGljIGNoYW5nZS4NCg0K
