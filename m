Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F8D4CEABC1
	for <lists+nouveau@lfdr.de>; Tue, 30 Dec 2025 22:42:55 +0100 (CET)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 0A4D610E95E;
	Tue, 30 Dec 2025 21:42:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="FGQ4oHJx";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 8DABE44C66;
	Tue, 30 Dec 2025 21:34:55 +0000 (UTC)
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1767130495;
 b=C1rPrmaF0c3nw9jxAfzdfcT/csMx0nQYdW6w4BMLLk6JKZ+PhEgTrXit9TwpzBUTaR5td
 mgB9atgUTjQvTUL3ZJV/GKu7lsM+gCTBUpC2Td+dDraC4hDZfLrNrCrp2lzfIPIbbFTXnIc
 BlvXbDTLH2CNvynzmYcRlQ8e+dmvzMpNRZ5DCKgLS8ruoRsTZSVsdxs0Cq7xohl7+FFSzXW
 0x03h1gfV+BkPD/WraOOJKK0leoB8HWuGftMEEN7U94NuiUak30iaQ8SaAQmqa6iOYJiQo9
 ZPEQUqfZ4knKWmHfNsNavlx2eGk4JgQDz6lu9Z7mXOmeEc3A7f0ZC6jtMZMg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1767130495; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=Oo4jvBL/G12DPsaOMC7/wKZ5+LX3OelIjcXH4ZOKalY=;
 b=KYgEgXqycwxYUkLnOzbI5lX3jV08z1ciIwG49XHDOU7zLeN+DIrbm7+3kaY/qHmU34BgG
 T0gLiJnfddqk+TCPPDS2MqyCwrFLAbzO/zpT4LfZ2h9WQZ+qsUk8JdeZVIr+dr7dFNgKdA+
 Rl0julAZp3RqiA6l8bBw/ipLRzhAqWA8Jmv8roSAysZvAjIbrtiQOpuxErkKcgjubQ5R1np
 OzGrBUDCII5hE7hU3CAqXn7we7V5qJ1owonHWknje+CqTli4ZP6v7uEPG4G8QLUJE/tbgNg
 evkcMBWR7W8G2omMbbtJ9yYMOUU1tJ/K07YLkpQqR/zhEBs2Am2jgZyQfW/A==
ARC-Authentication-Results: i=2; mail.freedesktop.org;
 dkim=pass header.d=Nvidia.com;
  arc=pass;
  dmarc=pass (Used From Domain Record) header.from=nvidia.com
 policy.dmarc=reject
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=Nvidia.com;
 arc=pass;
 dmarc=pass (Used From Domain Record) header.from=nvidia.com policy.dmarc=reject
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id 341D043E41
	for <nouveau@lists.freedesktop.org>; Tue, 30 Dec 2025 21:34:52 +0000 (UTC)
Received: from PH8PR06CU001.outbound.protection.outlook.com
 (mail-westus3azon11012024.outbound.protection.outlook.com [40.107.209.24])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 3DD9410E95B
	for <nouveau@lists.freedesktop.org>; Tue, 30 Dec 2025 21:42:50 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KzfNXV/9eTtFdwNC4aNpXjai16T16m7H+DTN71PtEAUxDuptmzEYpfJEBcYSBtfTI/h1/DMLrpjZcRcMrbmLLTwX8iZ3vcX+KRrmirvbYR6o49hQA1v+Ux/ITsYGreTM/td/H6o+DXsg2OhUl1CRwZUfyQnYV0/ZcAcdFPXpJleFq1GzBbaR4RlW45yY+zRvQ7t4Z2sI+Z207dNYolZMVffy4VQofGeIaSYyXX+BqIAnJ5zopB/2Rup2JwMU31mjsPgzXVgNkTdZmAfjlfD0z2hPov/Br9+8/aqIELBNt8/PabBW1racHDyNUFQ8b5rNt2Fp0axmslx10Zgu6k+V5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Oo4jvBL/G12DPsaOMC7/wKZ5+LX3OelIjcXH4ZOKalY=;
 b=g1A3KgIhx7CmKDE838FgJZiGyHXRenmVUMJ9aZ2v6ScmfjcUgFf48R+TX+GgYxNwXzUCTVQhKEJvhPWS3Kd/+W0UzuimslWEozGtm0/kaWu07cpyh5d8/FHb8pbpGGyJTY+hx6S5MrXoTloJ8k4G4Nfspzxz1UFH4WfbUwt/KnLC/HzpVu7rUKFGfLYfWixtYNJLgGQ0NTEqUWkZIQFshu1mPD+gwOA8443qFYQJZgjgolvb9VIoG3XDIfTv5+HuaTLo38nNfmd12Ex3FQix9FBZ4lGgV0yJoV87Eip9SxTyo3/+Ozums1EAnYTz20RtDGhc1b9pKwpYcGCTDRgInw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Oo4jvBL/G12DPsaOMC7/wKZ5+LX3OelIjcXH4ZOKalY=;
 b=FGQ4oHJxn3KJW7YJa1QkDMb3O7rGx6KWg0a5v7H2s9mJOQWd4XyLJ66HoiV6iHZF8klGt2O0RJTMtuXmJiFWAHI2kGqqbVqO/0FWw/fmTFZbdXWq6aoc7YSiDKqFxW5MTFCqXeXRdNn6VY76KaUgX7OVEdWEag9vTbBkXWU4Ys0CLQrTaQWvwgPqWC6IIMv6S0x9Z75E3HRJ6lWrEVqKET/OZlzhIwmPp4xhylNr08i/sPUs/QcLf4s4lWlFnR3iMglVYF1Y1oh416yniyBS88gYAymdvFRmHaumAZ8c9GkfFTVH/4JydIYMORFNGe0/nGTs5z1+IbaTwdOTisz/SA==
Received: from SJ2PR12MB7943.namprd12.prod.outlook.com (2603:10b6:a03:4c8::10)
 by DS0PR12MB6440.namprd12.prod.outlook.com (2603:10b6:8:c8::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9478.4; Tue, 30 Dec
 2025 21:42:47 +0000
Received: from SJ2PR12MB7943.namprd12.prod.outlook.com
 ([fe80::6a18:df97:8d1a:5d50]) by SJ2PR12MB7943.namprd12.prod.outlook.com
 ([fe80::6a18:df97:8d1a:5d50%4]) with mapi id 15.20.9478.004; Tue, 30 Dec 2025
 21:42:46 +0000
From: Timur Tabi <ttabi@nvidia.com>
To: "ewan.chorynski@ik.me" <ewan.chorynski@ik.me>, Alexandre Courbot
	<acourbot@nvidia.com>, "dakr@kernel.org" <dakr@kernel.org>,
	"nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>, Joel
 Fernandes <joelagnelf@nvidia.com>, John Hubbard <jhubbard@nvidia.com>,
	"rust-for-linux@vger.kernel.org" <rust-for-linux@vger.kernel.org>
Subject: Re: [PATCH v4 00/11] gpu: nova-core: add Turing support
Thread-Topic: [PATCH v4 00/11] gpu: nova-core: add Turing support
Thread-Index: AQHcb86jUh4zxo0ySUOi4HmApuhn2LU3ZAMAgANm14A=
Date: Tue, 30 Dec 2025 21:42:46 +0000
Message-ID: <802504957624510a92a4b028a2d5c4d41f1ee6e1.camel@nvidia.com>
References: <20251218032955.979623-1-ttabi@nvidia.com>
	 <DFA1CUMND2ME.1D3PAJW641QHM@ik.me>
In-Reply-To: <DFA1CUMND2ME.1D3PAJW641QHM@ik.me>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.52.3-0ubuntu1.1 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ2PR12MB7943:EE_|DS0PR12MB6440:EE_
x-ms-office365-filtering-correlation-id: 2192db10-675b-4294-ba6b-08de47ec5f07
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|366016|1800799024|38070700021;
x-microsoft-antispam-message-info: 
 =?utf-8?B?b2ovb2Y5TXZpK1RyZjY0cUJhMUp1b0NSWlgvSzMvdWhqS3QyeitGZnNxL3hl?=
 =?utf-8?B?bHRnZGpDR09nYTdCalRpVW5Ebk1yenJ6S2JHcUpWM0JjazFNTnJldktiVXoy?=
 =?utf-8?B?UmNrZzlzbHdFZFBNSHV5NEtQaUJXWDgydmNjU3RYa25VVkpzMlJtUndnRlA3?=
 =?utf-8?B?V2lFejhSUlhDMm9UcHBOWWFoeGlUcVlHU09udGk1N05EUzMrVC9EeVJDN1F6?=
 =?utf-8?B?eFV1VW91bC9aOTF6OEozU1dsaUJicDBkSmtqWnM2ZENraEpRNEd4ZFh5MWhw?=
 =?utf-8?B?RkV2Qmpxd0lQVEI4QVZ5OXM0OEpDdEdpUndTOXBZYzBJdjkwVW9NZUMrTkZS?=
 =?utf-8?B?bnBqUGc4bWRQdFJLMS9hYkRVNG9ENFhTa3JzUXZxMmJZSUdnbVpVbjMvSXJJ?=
 =?utf-8?B?RkhneVVOdFgwcFEzUVdFZHZZVTgzZUFiV0U2N1IzZlZQT2JoTjNrQjJQSzJh?=
 =?utf-8?B?Q1NUQmVld0g3NUVpZEQwL2h0V053ZjZnRWtLWDdaV011VC82bmZXUE1RUE5Y?=
 =?utf-8?B?d3VjdCtob0s5VGliYVp6U2o3RTQ1UHVsYXZ1aVVMT1hpMGxSR1lIczJxbGVM?=
 =?utf-8?B?a0J3RkJDU1RSd0t1UXBCbjhROWlsMFg4bnNnN3YvS0VZMm0zK2xEbXI5dDVp?=
 =?utf-8?B?SVRlRm5wNjVVU2NVTjJJdkJ0ZThjOGJCcTNWdnh3NnZRRkZtVzI3b1o2akJT?=
 =?utf-8?B?aVREWDU5NGVEcGxmd3FUZXdjcXpIMTFkZlFvSUYrdjZHZzFUQjhqL1YxSVZ1?=
 =?utf-8?B?VTI2NUNqd21WNkpVZHAwOWtRc2k1U1hQVUJMUHNzWTZuVVR4RGlSUVpXT0kw?=
 =?utf-8?B?YXhyMWFGOHJWMXhDY1MyUVhPRlQwa2ErUk8yUFYzT2VTUXZSdjVWZ3dJMFdI?=
 =?utf-8?B?NTJMOVZkblhkemRHejI2L213djJmdlpIM0tzK095Y21zcVVoRWtPMXpzRUZG?=
 =?utf-8?B?QmJTMm9NR092UUNwZWNXQ1BtZEJ5SitFZ1M1YlFVRlhscWFpL0hrVzB6dUIw?=
 =?utf-8?B?OGU4U3NSYWFqNVZKVVgyTmx2UGxuaVR4N21xbEpoeHJHMEJ2NnNhNkxQamtI?=
 =?utf-8?B?UXFMTElDTllSQmEyUzhnTEpsYVY1blN2QXJrVzh0ZThmSHhrWmNOeWZDYzZK?=
 =?utf-8?B?Sng2TTNINGtGa1FXc21LZ0RZbEpLaVBVMUNUcWdBV1M2K0NyMEZkTXc4VUgz?=
 =?utf-8?B?K1JvQ2FOdWFhcklOOU9Zdis3dENqMVEyTXJwQWtBamNNcy8vOHorZEZMRVBr?=
 =?utf-8?B?OTBmU2ZwVmMvMlRBVmY1bnl3YytaNXZOZXRwVEd4RTUvVHA3d3VSZHlzb2dF?=
 =?utf-8?B?NHR5aXF4b1VQSVN0Y0dRd0hZZjlvQWNMRmlSaDNqcVQ5dThrSTU0WG40ZXVz?=
 =?utf-8?B?QThuUjFCcjMweThNTFJtMWgxc0V5VmNGbFFDQUxUZjlyd2NvZmtlaHZvTE1q?=
 =?utf-8?B?bHdQcHZTaWRSb1A4MXBHTXZROG1DVEtTT2JZazVPTFIwckZMdUFMZHlXMTdp?=
 =?utf-8?B?YmZXTHExQ2RKM05vSW15TDlKWTZQWkFNYUsvU1dnNS9CVjR5OUhpbk5IUjBO?=
 =?utf-8?B?TXRaQ2VLb1lHYUNJQjdGMldnV0R5SWw2cFRpY29SaUh5TERsS1ZhdlRieGZl?=
 =?utf-8?B?MDh6ZXk0OGduVGdFKzlVS0ZzRDBob3FQdDVrRDNhZWdJYUhWd3pmVDRkaEpt?=
 =?utf-8?B?cmxhNjMxSWZXQWJoUWpnZllBMTY3MnVsS2VsMXErUDFKY2RsVVkwcURJOTBZ?=
 =?utf-8?B?d1hERUw3YkZ0SE1sQU5hNGxkQ09KdVNtSzlqY2J3RUh0VE9taTVYWDZxdjdQ?=
 =?utf-8?B?dFRBMU9RY0FLN0FMWEFHK3JpNHdsck5lTXo0K2p6cnFYd1ZjZ3N3WHZtV01U?=
 =?utf-8?B?Uko5L2c3WVh3bVFPU3ovUG9OYkdIK2xid3NGd3A4SGYzMXluU3B1aTdyajdX?=
 =?utf-8?B?V2FBSWtEekxoMkNQQ3NTWmJBb1M2R1BRWndwZGtWTEJTZU95K0hOamxMZTBO?=
 =?utf-8?B?UzVDbmNmY3FaTUtPY0J4VVFweEF3dHczSXo5c0h5TWVqcU83cWM0T2U2RCtR?=
 =?utf-8?Q?0KGd7f?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR12MB7943.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?L3ErZnBnOVpyWXZCNWlPZTRicWM1RkM4VkhVZWo1QmNFa09GUC8rSytJVCt5?=
 =?utf-8?B?blVEaXpPLzBCY0hLblZJdFREOEFkK2FFWEc3Q0cxNTc2alVTcEtUNVZQWCtj?=
 =?utf-8?B?RGN5aGtvSWY4dUQ4QmVWb3hzb05YYkoxTjlYRWswQkpkd3VtWXhQdm5USnMw?=
 =?utf-8?B?Zkc2cDArLy9wWEV1UCt5V081dHpmOXBzOVA0THQyRVpIeFhueEJZeWpaZGdQ?=
 =?utf-8?B?RUdqV1VTNGp4WHpWeU5ZOTJVOU11TUVLeVJ6Y2NmZ1BjNmQ2S1FuR0xJSkxN?=
 =?utf-8?B?RTR5U0Q1Rmk2TzlUazU5U252SmNRRWljZ0YzNG9kcHVyRk1vdzZDQlNZaHp0?=
 =?utf-8?B?SEw4cDdqOVpLMmprVTY4T0U3eWkvZUdoVVJ3a3h4RVRTd1VEYzdiV3lmSXBv?=
 =?utf-8?B?V3U5UUtDMEM0NTN6dFVXV0EydTlGMXYzTVRmTmZleFFEOGZhV08wMmdDREhQ?=
 =?utf-8?B?S2k1cmsveG9SVTg0ckJ5OERJMGZjMGthd1prNkNrQzk5MGxvOUpic29JRU1T?=
 =?utf-8?B?VitwSjlpK0Y4bnVESHE5b1JpWG9iblEveDBCdHR3b1E4NGF6K3o2UmZ5V0Ni?=
 =?utf-8?B?aS8rb0dCQWcrVk1JSFUyVDQ0eFlJcTAzQzZjVGl4S2lWcUJzd041aktIWjRw?=
 =?utf-8?B?dTVac0Jia0R2bXl3UGdMVHRyQU5EUkhtK2tpVFRBakhYL1NVeHR3N0IwSUI2?=
 =?utf-8?B?amdDc3Y0NnZPbHZiampFWGU0ZHNmZnB3ZHRiN1BsL25yUGNTbVZ0bGozYlFX?=
 =?utf-8?B?SUhPRFdSdEJ5VlVYSmRJMm4zWG9JUHpzTXlzVGEwcW9kR25DdVpTYjcrSnNs?=
 =?utf-8?B?YmNITWNZVW1RUHpkU2FFL0JaWG0rZ254VmRVK2VQbnJxZGFJWU8xaGtlU01h?=
 =?utf-8?B?YVZnVUx5THd6QmdYWlhNd2dTVzJpaVFiZVMyYjN3RUtUS0dUWmUyT050UFhl?=
 =?utf-8?B?Y2FrM3VMZTJEd0R4Nmc3dzRqWVJiZENaMTVFbGxxN25aS3NKTjlNM0haa2Z3?=
 =?utf-8?B?RCtkVk5kRmFHaFhGRTRsMUg4Rlo5NjdhNW5xL0VCSnlxU0xvSEJVVzBoR21M?=
 =?utf-8?B?TUtYcXdadUpYNVZmcHMveEZ0dkg2V1ZjMGgrdkthZ0RkMVA3eFJsWWg3VG5l?=
 =?utf-8?B?azlFdlRMYjZxb2VMcnRPbmhtMzRKeU5hdDVpbzJTbjFyOVJ6L3lYaWh5bVNJ?=
 =?utf-8?B?c0FqUzcwRTVaMnhhcnhtNGZiVUY0MFYzeW1sdlFIaTR5bVprbnhuWkpjOUJQ?=
 =?utf-8?B?K2F1NDlYMklmUnIvMlNtbXhLV3lvdG5zZHY5Uk0wRjdTVHJBL3JEbUhSbG50?=
 =?utf-8?B?R3lvbktTcncvcDF1QlcrQUNNN2E4bzdYWFVSeGZBVnU3dllyYklhc2pkTUgw?=
 =?utf-8?B?YzUyb1pOTWhMY3k5d2VKUmpzVjRKNFRCaGdWT3VvMCswYmk2QkxXWHcvRGxN?=
 =?utf-8?B?ZWNMVmpid0QxbDlJbW1yVlNCM0h3MTN5c0hkQmtqeC9OS3Z2ZjAxM3ZpMUxp?=
 =?utf-8?B?NlZmK0o5RVAvSmN1dXFYMmo3bVJEcnVEblI1ZXlEaXZlL1NwKzNudmc0dW51?=
 =?utf-8?B?d2pTT2tmaTBVUGlFSzdmbFR1bXdhV0hBQnhBK2kwYzNkVVl6Ymc4ZGtKVkNP?=
 =?utf-8?B?WmdtY2ptSXk2ZGJjZWxOSjdNK2huTVY1MWJxemZxajJzdjRWMWQraXU4MGo3?=
 =?utf-8?B?T3dGT1FKTmpmMVpVenpwU1Z1Nzh0ZVBxdGxIYXorUDBNNHF3NUg1WDBINDdF?=
 =?utf-8?B?cHhncDFrMjZPNXl2dkQrNk9wa25ZS0tOTkxadXdCdjFHMi9NMDVlUXNqbUM4?=
 =?utf-8?B?NlRMdStmZGNIY2g2THRVdEpjZ1FWUkFXZzVWMTlreGdIMXFhaEljSmxSdzZO?=
 =?utf-8?B?LzJxQzFuRTdsdVphYmRSeUViT2doVy9nYnlRNFBYSkEwdHp4cEVmbnlxUXl2?=
 =?utf-8?B?eTFvNHA1UXZ0VGI1ZEpPL2QyeFo5SmllYUVHM2hXSFdVOTZVQjgrQnhMTGZ2?=
 =?utf-8?B?OHQ0UjlnNVNySjZDbDljVUlJMW9XTERkdDg4bUhYYysvWHlHVkwyb1BPRWM3?=
 =?utf-8?B?eXRlTllrcnlDV3o0cVp0b0h4NVRuUlVHZ3d6ZWVESkRwSVcwVmw0SDRkTXVM?=
 =?utf-8?B?anVCTEkxSUxGMGlHQ0cxWlh3K0o4NXY3dXZpTEIycnRjZ1FtNDRmSEJpR2Rs?=
 =?utf-8?B?ZFpKck44eDR6R3RhUjA2R2E0SnkreUZBdUxMRVcxRkgzVklVcGNvTGVseEhD?=
 =?utf-8?B?bTJIYndLT2lBZmg1OGc3Y0NBZFJTdStaUnZ0UmNEckdzbDhCd0hTRDVCVnBa?=
 =?utf-8?B?MzlBS21GTTA1S2VDM2JwNjR2NVRlcUxJbC9WTG0xK0ZpZWxmWmJ4Zz09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <2C012332550C7944AEDA40E04487EF1F@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR12MB7943.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 2192db10-675b-4294-ba6b-08de47ec5f07
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Dec 2025 21:42:46.5323
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 
 vGDIiuu3HAweY89SMev82XlSTD1b+6qoAofcAmD6APqEA9cHG/g5ne6CQQ4nodVgtGufsc8dlG29Qaph4FNg8g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB6440
Message-ID-Hash: QMB54GGYO2ZQPXAVFN2Q3AWWC2DKORRT
X-Message-ID-Hash: QMB54GGYO2ZQPXAVFN2Q3AWWC2DKORRT
X-MailFrom: ttabi@nvidia.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation; nonmember-moderation; administrivia;
 implicit-dest; max-recipients; max-size; news-moderation; no-subject;
 digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/QMB54GGYO2ZQPXAVFN2Q3AWWC2DKORRT/>
Archived-At: 
 <https://lore.freedesktop.org/802504957624510a92a4b028a2d5c4d41f1ee6e1.camel@nvidia.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

T24gU3VuLCAyMDI1LTEyLTI4IGF0IDE4OjQ1ICswMTAwLCBFd2FuIENob3J5bnNraSB3cm90ZToN
Cj4gDQo+IFvCoMKgwqAgMy42MjMwMDBdIE5vdmFDb3JlIDAwMDA6MDE6MDAuMDogR1NQIE1CT1gw
OiAweGZmZmZlMDAwLCBNQk9YMTogMHgwDQo+IFvCoMKgwqAgMy42MjMwMjZdIE5vdmFDb3JlIDAw
MDA6MDE6MDAuMDogVXNpbmcgU0VDMiB0byBsb2FkIGFuZCBydW4gdGhlIGJvb3Rlcl9sb2FkIGZp
cm13YXJlLi4uDQo+IFvCoMKgwqAgMy42MjYyMzZdIE5vdmFDb3JlIDAwMDA6MDE6MDAuMDogU0VD
MiBNQk9YMDogMHgzMSwgTUJPWDEweDANCj4gW8KgwqDCoCAzLjYyNjI2NV0gTm92YUNvcmUgMDAw
MDowMTowMC4wOiBCb290ZXItbG9hZCBmYWlsZWQgd2l0aCBlcnJvciAweDMxDQo+IA0KPiBJcyB0
aGlzIGV4cGVjdGVkIHRvIGhhcHBlbiA/IEhlcmUgaXMgdGhlIGZ1bGwgZGV2aWNlIGRlc2NyaXB0
aW9uIGZyb20NCj4gbHNwY2kgOg0KPiANCj4gMDE6MDAuMCBWR0EgY29tcGF0aWJsZSBjb250cm9s
bGVyOiBOVklESUEgQ29ycG9yYXRpb24gVFUxMTdNIFtHZUZvcmNlIEdUWCAxNjUwIE1vYmlsZSAv
IE1heC1RXQ0KPiAocmV2IGExKQ0KDQpUaGlzIHNob3VsZCB3b3JrIG9uIHlvdXIgR1BVIHdpdGgg
bXkgcGF0Y2hlcy4gIEVycm9yIDB4MzEgaXMgYSBnZW5lcmljIGZhaWx1cmUgZXJyb3IgY29kZSB0
aGF0DQppbmRpY2F0ZXMgdGhhdCBib290ZXJfbG9hZCBmYWlsZWQgdG8gaW5pdGlhbGl6ZSwgYW5k
IHRoYXQgY291bGQgYmUgZm9yIGFueSBudW1iZXIgb2YgcmVhc29ucy4gDQpVbmZvcnR1bmF0ZWx5
LCB0aGUgb25seSB3YXkgSSd2ZSBiZWVuIGFibGUgdG8gZGVidWcgc3VjaCBpc3N1ZXMgaXMgdG8g
cmVwcm9kdWNlIHRoZW0gaW4taG91c2Ugd2l0aCBhDQpjdXN0b20gYnVpbGQgb2YgYm9vdGVyX2xv
YWQuDQoNCkkgc3VnZ2VzdCB0aGF0IGZvciBub3csIHlvdSBob2xkIG9mZiB1bnRpbCB0aGVzZSBj
b21taXRzIGFyZSBtZXJnZWQsIGFsb25nIHdpdGggbXkgZGVidWdmcyBwYXRjaGVzLA0KYW5kIHRo
ZW4gSSBjYW4gdHJ5IHRvIGZpbmQgYSBzaW1pbGFyIEdQVSBpbnRlcm5hbGx5IHRoYXQgZXhoaWJp
dHMgdGhlIGZhaWx1cmUgYW5kIHNlZSBpZiB0aGVyZSdzDQpzb21ldGhpbmcgZWxzZSBtaXNzaW5n
LiAgVHVyaW5nIGlzIHRoZSBtb3N0IGNvbXBsaWNhdGVkIG9mIGFsbCBHU1AtY2FwYWJsZSBHUFVz
IHRvIGJvb3QsIHBhcnRseQ0KYmVjYXVzZSB0aGUgZmlybXdhcmUgZG9lcyBhIHRlcnJpYmxlIGpv
YiBvZiByZXBvcnRpbmcgZXJyb3JzLg0KDQpJJ20gYXNzdW1pbmcgdGhhdCBOb3V2ZWF1IGJvb3Rz
IGp1c3QgZmluZSB3aXRoIHRoZSBzYW1lIGZpcm13YXJlIGltYWdlcz8gIElmIHlvdSB0dXJuIG9u
IGRlYnVnDQpsb2dnaW5nIGluIE5vdXZlYXUsIGl0IHNob3VsZCBzYXkgdGhhdCBpdCdzIGJvb3Rp
bmcgd2l0aCA1NzAuMTQ0LiAgWW91IGNhbiBmb3JjZSBpdCBieSBkZWxldGluZyBhbGwNCnRoZSAq
NTM1LjExMy4wMSogaW1hZ2VzIGluIC9saWIvZmlybXdhcmUvbnZpZGlhLw0K
