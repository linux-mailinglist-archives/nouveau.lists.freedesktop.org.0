Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BAEEED390F8
	for <lists+nouveau@lfdr.de>; Sat, 17 Jan 2026 21:58:37 +0100 (CET)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 2790010E1CC;
	Sat, 17 Jan 2026 20:58:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="TOsgtEqy";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id B459F44CB2;
	Sat, 17 Jan 2026 20:49:57 +0000 (UTC)
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1768682997;
 b=eR/j57UYftXyhQFUK7jZtQ/9nQEgCN+E9Jh7AH8adsYOCmpTnxqN2Kq1vbA+wqyVsMtlA
 7iOOEEyKOEfU5cw4X/5Nq3N/fC+MS7IPpytKgq/4DUbbqw75SnqOVuWHKhVEw6ov92ozmla
 Bg+8kmiGRNaN86IPm3M1g50BXXoAAIKsa1CbAla0a1oSI0N7VRmJQckftwX6k2haArIVul5
 abvtjxaNorRTlPJIlG35+iFq0yzHu2KSFBlOmyz108mlyo+gV8kti+InrWwdi4QNHvLLMeE
 ssolpEMFK2Y5ruEykw1yWqrJ6V+9zrXhPllojgZKfFF7bZeU4VyTg4JO9ADQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1768682997; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=qpcqip758rWa1K+2RkHJ5mS9lo2Ek/5YpS/2OhaYMHI=;
 b=nA2KHZTy+Wl3/jpXoNTnhYNEAIcSIf7CI8I/MQyMfL/rZlkI6cFz2ODCU/9h+LFrIOKf4
 rexHOtwEzPvLOycIfV9QESPXmrI2pQiQjqwbLvI8Pjui7+W1VlEuN+L4kmBZdxPPVxGwOJz
 LlLqtQCoB1J2OZYvlm8mTztdgA0YAfHO2jP4YMzKfj+gR8Rjm+HNobVsfT/SUV1xOfpyp8x
 JvBa752xyy06kFx6Mqu7PfOJu4h1ZWfAKGqTUxDPf0PieYHCfnm5clL+3Y5VKnp5CHu/YJA
 LKZw2SEdTAPz0jJRMcGKPR9O5X1M6tUqdlVwBgGRpMo8Kr/K5B+1vSSGJujg==
ARC-Authentication-Results: i=2; mail.freedesktop.org;
 dkim=pass header.d=Nvidia.com;
  arc=pass;
  dmarc=pass (Used From Domain Record) header.from=nvidia.com
 policy.dmarc=reject
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=Nvidia.com;
 arc=pass;
 dmarc=pass (Used From Domain Record) header.from=nvidia.com policy.dmarc=reject
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id BBA784032A
	for <nouveau@lists.freedesktop.org>; Sat, 17 Jan 2026 20:49:54 +0000 (UTC)
Received: from DM1PR04CU001.outbound.protection.outlook.com
 (mail-centralusazon11010056.outbound.protection.outlook.com [52.101.61.56])
	by gabe.freedesktop.org (Postfix) with ESMTPS id CA56810E15B
	for <nouveau@lists.freedesktop.org>; Sat, 17 Jan 2026 20:58:32 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MhFztnhYM4eXlF23ctE7bgnZp5Y23z1eDF4fo7dnGDqCEoUcl8pUiJgQbK2wKO9Nxmqa4Nys1DHphKvLT3JNBOGB6e7BkuuIwEFZGDrChSKsDbfYiWZ7ifLD3QRFqobLKNBAxvW0TiD0LozhtryZEeN53mlgw8itkBFRtD2WhxX2vlQ4WT2SEM+VhiJVIFBKEsaa2HTt6U3c+fTb8dGUQjd1Y4jti72zzVDboJ/EaBkoMXBfPjkE5QIdwhFai/pAlm9r4/E55lZxJVRgUwETQKnEWNAJWAO9EmoaCBWosLdt+wckCZQa2wyIlujRxrA5Y1sjmYIMb/CPDtGRqkorVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qpcqip758rWa1K+2RkHJ5mS9lo2Ek/5YpS/2OhaYMHI=;
 b=L6zExeYC7P45UXeQMBFtCq/GFhbM0T3i/s7JFIfgrddZlV6VuBcLgaCvf7HKPVeCt+EpFEh/PUhzMd0t6uEtLjDcwGQcm2n/4RnZVuegfKKKrjIOV07qChITJG85BeUNci9adgJhx3qynRsllMnTNUAM6/OZJ7ggKjtrvfO1GT6wn2DDPGnDBpjMy8M3Qau9ISpKNJS8eWsMIjBBD6ft6vLJoYtipaCoKlO9QBuEZKFmczR4HrLTnlgrPCcOE1fidA0R+pmb/OGSfrMzHfXE5PH5bpdomwqlhtleSZMrZi5u+fQsgcvs1Px/GvcKauVGMSCWTxaQYOgDwOuUJTgf5A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qpcqip758rWa1K+2RkHJ5mS9lo2Ek/5YpS/2OhaYMHI=;
 b=TOsgtEqyBhAp0LMJgcqHD/oRI+J96JUbtFuwhOTSN0bxrQzcxTSpIdwSnLqmyKe8NhnwLe+1iMCWsmrSF9a6aeMnS9UlnOsmdWvKaPT2l8GU5kdy+Vh6X5JaaSNQnkPX6+TOmk9W162eR2+kwAIbbuEYYZsl5wc0fIsO2dXboq567sZwybaR2arR72sN5B+ptIt2Wx8RxbLxhlOWLtEeqIop3nUDyarKHdUayppDcSyy0D7ay401diepb2uTWos2nemYWArybvXVlAIdtyCNrCThzFHqvzMvIPzHMOXKNiKexqsINLNaORwS1kRKXBvw7x48ca5lMiTw0MXKJ2mhNQ==
Received: from SJ2PR12MB7943.namprd12.prod.outlook.com (2603:10b6:a03:4c8::10)
 by IA1PR12MB6307.namprd12.prod.outlook.com (2603:10b6:208:3e5::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.10; Sat, 17 Jan
 2026 20:58:29 +0000
Received: from SJ2PR12MB7943.namprd12.prod.outlook.com
 ([fe80::6a18:df97:8d1a:5d50]) by SJ2PR12MB7943.namprd12.prod.outlook.com
 ([fe80::6a18:df97:8d1a:5d50%4]) with mapi id 15.20.9520.005; Sat, 17 Jan 2026
 20:58:29 +0000
From: Timur Tabi <ttabi@nvidia.com>
To: "dakr@kernel.org" <dakr@kernel.org>
Subject: Re: [PATCH v5 7/8] gpu: nova-core: create debugfs root in module init
Thread-Topic: [PATCH v5 7/8] gpu: nova-core: create debugfs root in module
 init
Thread-Index: AQHchzIqwUaIB+PYB0OD3tkbaxdt87VWS1wAgACOTYA=
Date: Sat, 17 Jan 2026 20:58:29 +0000
Message-ID: <656bfffe43ab220b387fb56bb6eeb829ff0bd1ef.camel@nvidia.com>
References: <20260116214959.641032-1-ttabi@nvidia.com>
	 <20260116214959.641032-8-ttabi@nvidia.com>
	 <DFQV57XCLMB6.1A0IW206EXE3H@kernel.org>
In-Reply-To: <DFQV57XCLMB6.1A0IW206EXE3H@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.56.2-4 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ2PR12MB7943:EE_|IA1PR12MB6307:EE_
x-ms-office365-filtering-correlation-id: 91f44608-ac69-4f42-067a-08de560b2aef
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|376014|1800799024|38070700021;
x-microsoft-antispam-message-info: 
 =?utf-8?B?U1U2U29hNnEwbnIvMzlkdUhqNHFNc0JVd1FHUHN2VXBmTmhSRk1oSTBrVW9x?=
 =?utf-8?B?cGR0aUhZZWVpdGdTVGVETWdGVllSVjZaZGdYMVdXOXBPOVJwSlRzNWF5OXNF?=
 =?utf-8?B?S0JPYVlaZmtCdFJ4SGFweGRPem4zNWJMOWhpU1dqcGhUUFFpYzU4RjhjNW16?=
 =?utf-8?B?TXc3QllVU2VDQ3UzVFZiL0xDOExuMXZyLzlzc2xLYmNubUZtWjg1cmIzbmlr?=
 =?utf-8?B?RFdLNXRua2ZJUnJzanVLNm94SGtZVGdkbVVwRkFHaVRDS21GNDMvTFAyY2Rh?=
 =?utf-8?B?K2l5R1Fib09sbnFIWkVtTS9CeVBLZTFhbCtBMTRwemJPVUI4NWtPT1o0Njh2?=
 =?utf-8?B?WkROWXBENUtraG9xekVDVWZtL1lzVGNBVEhBN3piYzM4UkNWMWFvYjNXN0R4?=
 =?utf-8?B?bElBVjNmL1BNSGY5SElCcUwrLzB2bmhqdUFkRithVWU5YjlHY09Fa0hTUHFo?=
 =?utf-8?B?cVZyd2RSWHI5RXJwR3Q5aEN0ME5mVXlxNjFleHVuOTFDdm0zU1FMbHd2UmFC?=
 =?utf-8?B?WWhRYjUvRGx6eDc0OEJ2dFJZVWh2dzJKdXRyZHJ4YjRycE4wUzJiQ25KV01I?=
 =?utf-8?B?emRIZit2RVZEdUxJQkExUTFjWDl3eFdwbjNObFpjUVNPbHI4N1ZraVQ0R2p6?=
 =?utf-8?B?QzFUaVNBVXV3a09SNjJnRjdUWlhwQ1l6YVB3am5mMkxycUtzZEhwdHo2dGha?=
 =?utf-8?B?YXhnVUtRQkFQUjRNZXpLOGlBa3VGT3EwQXVlK3B3Qy9XYm0xQXE2bDFFc3B5?=
 =?utf-8?B?MnhsZ3lLN01FQldBVmRMdzhlZDVXRSs0OEdqaitCVXdaMitnck5DNzVVK3Ft?=
 =?utf-8?B?WHEzTi9VL0FTa2hNVGd2dlVlQUg4YVJKZU5zekFRZmxPUG56dnJEekFsc3VI?=
 =?utf-8?B?eHpNMG8xcGN0RHIvazNOWHRMV282Mi95dTVFRGlmNXRZbVNrMnhuTWRXRXBG?=
 =?utf-8?B?VnBjTjZlUVAwaHd2UzNRMzBYQktZOVhOZU5oendjWk9nMmF3SVJYUk1PUUFs?=
 =?utf-8?B?TWxTYS9XbllBSzJnZW95WVRQUCtGdGY2MHdTR2oxLzRuRytMMi9ocDRDVS84?=
 =?utf-8?B?a1hYdVAybjZIYm1tTTU3LzR1c2RMUGdNRW5VaXlwVU5FQldaUm8vODlRaDEv?=
 =?utf-8?B?R29walI2MVRobTh1QzV2amw0SWZrZXhZTHljZitOUHVFejlOcFI2V3pHK1pG?=
 =?utf-8?B?VDFFUWFIRUVXeGUwTXNRVWllUXhYd0N6YnlNV1RBSkpTRVh1bkFaWEVxWGJl?=
 =?utf-8?B?TW50MW9MYVpyREFvZVNDbWZRdGVkSmtLbXk5RmVnSUJhZVIxNkk2MS96dlQr?=
 =?utf-8?B?ak9WSE56UUFkdlV2NW02bnJyTzFYWXJwS2lTT3ZjenZHMlROTCs3aTlNZm5R?=
 =?utf-8?B?NFU5V1U0N1JMbm5DY1FFRGRmbjVrK0w4SXNmbVRzK2EyY2RPN0hGUVlsUVZQ?=
 =?utf-8?B?dnVFWEpTVzhvMW9LeThxRnk0aEpsSWI1SGxGL0tQR0JUNzdMdUE4Nml2dHZr?=
 =?utf-8?B?Qjh1TWgyK25zakhjeDBValNDOGlieG5wS1J1QXBRUVVuYmpqYU9uWkZhbGlx?=
 =?utf-8?B?ZHVLaERlelVkd3pHK05kYlBzNDFLa1o4cm1QcVplZ2UvamhyZWFFeVpjVXJH?=
 =?utf-8?B?SXlxZWI1eHorS25OOGZDcnRHNlR6aitSUkdJK2E3Tnd0RS82WkkzQ2h0ZTBz?=
 =?utf-8?B?d2pocUtLWDdiaENvNEh3MHhFbGZDN0FWTXg5Y1g5QzVmYndsT0xIVEVDNGtS?=
 =?utf-8?B?WTR4L1gzQ2ZMRSsrWkkxM3RHMk91QlloVnRnZTN0bDFoQVBmb3lNMHpyMnFB?=
 =?utf-8?B?Sm5rQmFVNFlUM2MybGozRkFyM05aUDhUUWNQSk5pdUNHOUxUOGNUU1ZKQnIx?=
 =?utf-8?B?eU5QNlMrU1czRU1qdXFoUWlMbG9JM1RSOFhUOUpJVFVJRk5ScERpSVArRFY2?=
 =?utf-8?B?TjluanVZa29zVjVRQWM4MkFWRVhhUWRaMXFmMUlScUdFMEMwUUhmbzREYkpx?=
 =?utf-8?B?ajE3L1RZSzVkYTR0N3UzWFVkRmJ4YkF1d2p4N08vS001WlFiQjAzVVNQbjhE?=
 =?utf-8?B?eXh1QzZJcHM2eWU3bzZndUduaUF4M2VZVE5DT0s1SzJ1MnkyMVE1MDRLY29H?=
 =?utf-8?B?Z2pHZ3hLZGl3YXVMSE8xTUhRUmU5MVg4Q0p4QUlmdDg4RjE0WjJqUFN4TFBq?=
 =?utf-8?Q?QbZdW0iKDXUnjAYC3hO6WhQ=3D?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR12MB7943.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?QUZEQ1dZWVl6Uy9PaVFwa1Flci9WNHlHT0g3RHlsSUM2TFhSbHJyZkljWHdH?=
 =?utf-8?B?b0RPcUVHRFh3RFFoem9MWm1sc1F6dzdIVXg3ZUJ2eVZrdzNFSHFHME5BRTdt?=
 =?utf-8?B?cThnMlJSZFkrY0Izd1UrTUo2UWpRZXZFN1UrZ05zN2I5WGNieWpmVnhXN0dE?=
 =?utf-8?B?cEp1VXdiZUx5REJ4eDByME5vbFZWajNPRDBzc1JXZVMrVGN4T1hadVdEU2pL?=
 =?utf-8?B?TlkvVkZFUDQ0MlRvdTlvb0N4NDRtYldrVzJiQVJkb09leVA0dzgxQzV6YVBz?=
 =?utf-8?B?N1Ira1ptTFl3M0M2U1g4NE5ZenQ5OTJxT09GdEc1dC9Md2NWYVFKejBjeUx6?=
 =?utf-8?B?UEtqc2o1SkVLL1dUcDd5Q2REWFpETDM2bmpjemJTMmVVaFFDZmw5SWx4UU95?=
 =?utf-8?B?dStMVTR5Q3poUVgvbEJ2NjRrbGY1b0E1ZXNMYVJybDB2QmJGMnd0QU1iSm9p?=
 =?utf-8?B?eW81RlpaSytWUUN4cjExRlpTdEh6WVJWTHo0Nm5QcTY2d1ZwMGFpbkk1MXVo?=
 =?utf-8?B?V1lnQTljeU9UQjA4eGRubWFLTUNwQUdUV0pXci8vTThzTmtWRWd0N3pIQ21B?=
 =?utf-8?B?OWw4L0JIamIwMGE1bEpiSzBHVU1oL0Z4V1NCTWxsVHRnRVpCS0o3VEd4RkVE?=
 =?utf-8?B?OVFNSUs1WVV6MWlGRTU1WmpGWWVidG43WkxBRDBlVGZqMlA5ZzhKL2wzalJj?=
 =?utf-8?B?SW9CNng1MTVXdlZjOGwvcExLeC9DbEtYYTJrK1I4alJWd3lNamNZcnhDaHlj?=
 =?utf-8?B?SXhqd0JGUGE3bm9yYk1RcjhjQzRXdUVqN3Vhbkhzd2RsaERxdTFuWEwva2c0?=
 =?utf-8?B?WCs1bkhlRjJFaTY0ZElackFYdkhhYTVZOXcyaS9YRUlGREdOYkdpdDRpaHM4?=
 =?utf-8?B?ZWpzK1pNQ3RxT1Zpd3c5eklWUzQvQ1BQaVFGbTQwT1liS2kwWE9TSmVoaVd4?=
 =?utf-8?B?SmNVNTdHbnhVeVJZTFdZUVZWUUZzbk9HdFJLYnd0TERURWU4MWp6akdUaGtY?=
 =?utf-8?B?enoyOVhYVEwxM0d5UkxLVTJ6TXkwOGdOMzdlai9LMzRaNmRVbTU4YzhDbzhn?=
 =?utf-8?B?TzV5RkFNTEV2cTRlUitHUW51TENsSFU1TkxHbHZ6cFdXd3lZYkQ0ZUpHSWFK?=
 =?utf-8?B?cWF4SE5JYS9taFNrMlhYZEFCTjIrbFVnRHU0aXBOYXo1WEkxKys3RUhkT1dv?=
 =?utf-8?B?eCtDS3NEVnh4ZWxGT21LUXRuaEZSNmNzbVdvdlVXUTNOOUF4aC9WVXlLanUz?=
 =?utf-8?B?UkQrUGlmNWRmTkRVeHRNVWtDb3kvTnlLU3hiZjI3eEI4cWxGeHRmcjJ6YnNO?=
 =?utf-8?B?eWl3b3ZJYjE1WnhhNUVlZEFKSFZOM2E3RFpnZHRrZ1FIMDNJOUJ4MDY3ZVkv?=
 =?utf-8?B?L0FZVjhsUWZudDZvdmJ6dStnK05VS3Z4SGprUVJreVgyNEpyMHpuRTFHSTQy?=
 =?utf-8?B?a01JSVJYazljRkJiRlRwWWx0SHgzbjZNQ3U5K3V5STd0eDhYc2FUb2ovSHpN?=
 =?utf-8?B?dVFFbU5ERVJhSVRQVE1yR0RsRGJWZEs1QVlzWFJzeEpkUE9oQ0JaLzZkM3l1?=
 =?utf-8?B?VHJyV1UzZDdOVUZTMGFzWUoyZmtyWkJTNnZDUC9NTlk5elZmRVNBK0FzekpZ?=
 =?utf-8?B?enY3ak5jVVA0dFB4M2pWOEFydXg3RFlCM2pNbGxKa1AwTjdJdkpmSFdHK0Zw?=
 =?utf-8?B?WUVUckl0TVRxSUR1NFJSVHhKRzhRaUNIaWpYc296c053aE5hSThCTk54RDBL?=
 =?utf-8?B?RDVScThDd3Q5ajdmVG9VMCsyMGFwcDNnMlFrdlEyZjdJR0sycjBJYnpJQkFU?=
 =?utf-8?B?OHZYbEpHUTVoMGpiZjlEV0I0Y2gwTXhMbVN6WkNuS1h3dkI0VDNnRi9jVzV0?=
 =?utf-8?B?SzNObG13WWVSM2h5Zmt2SWdHNmU5dnRNellSN2cydXE4d1lSVGl0Yll2WTlW?=
 =?utf-8?B?a1NZOEtGVGVsb0ttZi9MRys3WUEzME01T0ptUzN2ZHpHY1hVclArSUNDYzdL?=
 =?utf-8?B?OGcrMmxMMlo0MFNvdThDSjRJRzlIbm84T24rZFlnb1U0VDc0dUYvVHVUTHNo?=
 =?utf-8?B?TWRrMFZ0VWJjZng4bXZTOVBqbXNrL3ZrZ2pQMFJuNjRHVno1Zi9GcDlaR1Yz?=
 =?utf-8?B?ZnRDLzZ1RHkrb3dBQUNRVVdPNHRtY2ZWNFpxM05QcVNNSWRDRk4rVmxCSnZE?=
 =?utf-8?B?cmlGYVQ4YzRTRGRxS1h5UDhxZmE2M0hyZEl6N3lsWlA0NXA4UjJYcHB0MnBV?=
 =?utf-8?B?WHlOdUlSSGJ2b1lBdlpsdkxORkJ6YTE1Y01IaEZyVzhYS3VBTVNqNDlZa0Rt?=
 =?utf-8?B?dFRsRjhxRkZNV3h0cTdBdmJXS1pINmhWTFl0d3pZVG1jREdnQjdldz09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <B59DE9585F0D2C409A3CC1DB6A7281E2@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR12MB7943.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 91f44608-ac69-4f42-067a-08de560b2aef
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Jan 2026 20:58:29.7267
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 
 phwwZk/8bKCPvsLMQDq003UUTK49HLzH/tG4i4ggRHdOmVthqQVLdMmnstKJqpyZur6bGy8m1UHkylo1jrIZeg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6307
Message-ID-Hash: FXCWMOBMCTM5SF4BLQA4GH6E5HGNCKC4
X-Message-ID-Hash: FXCWMOBMCTM5SF4BLQA4GH6E5HGNCKC4
X-MailFrom: ttabi@nvidia.com
X-Mailman-Rule-Hits: member-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address
CC: "gary@garyguo.net" <gary@garyguo.net>,
 "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>,
 Joel Fernandes <joelagnelf@nvidia.com>,
 Alexandre Courbot <acourbot@nvidia.com>,
 "mmaurer@google.com" <mmaurer@google.com>,
 "rust-for-linux@vger.kernel.org" <rust-for-linux@vger.kernel.org>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/FXCWMOBMCTM5SF4BLQA4GH6E5HGNCKC4/>
Archived-At: 
 <https://lore.freedesktop.org/656bfffe43ab220b387fb56bb6eeb829ff0bd1ef.camel@nvidia.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

T24gU2F0LCAyMDI2LTAxLTE3IGF0IDEzOjI5ICswMTAwLCBEYW5pbG8gS3J1bW1yaWNoIHdyb3Rl
Og0KPiBPbiBGcmkgSmFuIDE2LCAyMDI2IGF0IDEwOjQ5IFBNIENFVCwgVGltdXIgVGFiaSB3cm90
ZToNCj4gPiDCoCBpbXBsIEluUGxhY2VNb2R1bGUgZm9yIE5vdmFDb3JlTW9kdWxlIHsNCj4gPiDC
oMKgwqDCoMKgIGZuIGluaXQobW9kdWxlOiAmJ3N0YXRpYyBrZXJuZWw6OlRoaXNNb2R1bGUpIC0+
IGltcGwgUGluSW5pdDxTZWxmLCBFcnJvcj4gew0KPiA+ICvCoMKgwqDCoMKgwqDCoCBsZXQgZGly
ID0gRGlyOjpuZXcoa2VybmVsOjpjX3N0ciEoIm5vdmFfY29yZSIpKTsNCj4gPiArDQo+ID4gK8Kg
wqDCoMKgwqDCoMKgIC8vIFNBRkVUWTogd2UgYXJlIHRoZSBvbmx5IGRyaXZlciBjb2RlIHJ1bm5p
bmcsIHNvIHRoZXJlIGNhbm5vdCBiZSBhbnkgY29uY3VycmVudA0KPiA+IGFjY2VzcyB0bw0KPiA+
ICvCoMKgwqDCoMKgwqDCoCAvLyBgREVCVUdGU19ST09UYC4NCj4gPiArwqDCoMKgwqDCoMKgwqAg
dW5zYWZlIHsgREVCVUdGU19ST09UID0gU29tZShkaXIpIH07DQo+IA0KPiBJIHRoaW5rIHlvdSBm
b3Jnb3QgdG8gYWRkIGEgbmV3IEtjb25maWcgdG8gbm92YS1jb3JlIHRvIGVuYWJsZSB0aGlzIGFu
ZCBpbiBjYXNlDQo+IG5vdCBzZXQgbGVhdmUgaXQgYXMgTm9uZS4NCg0KWW91IGRvbid0IHdhbnQg
dGhlIGRlYnVnZnMgZW50cmllcyBjcmVhdGVkIGJ5IGRlZmF1bHQ/ICBUaGF0J3MgaG93IGl0IGlz
IGluIE5vdXZlYXUuDQo=
