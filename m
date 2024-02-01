Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E368A845EAE
	for <lists+nouveau@lfdr.de>; Thu,  1 Feb 2024 18:38:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 900B610F28E;
	Thu,  1 Feb 2024 17:38:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="bYc+02DK";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2057.outbound.protection.outlook.com [40.107.220.57])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C76F10F28E
 for <nouveau@lists.freedesktop.org>; Thu,  1 Feb 2024 17:38:20 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=L7oO7PS6nIH4Wse8eGhKg+JiXx4s1VB7XS+439VnyvMkJYFBBKIzBp7ojxbEGv+nODIg/Pfi6Vfnfc7uw+3G4GYEZAVkUMp3B9t6JV76S6EfLhQrquNZOaikKPS/098FurogAOG9WZxZYjjzrXffSeHUmNRVj+mNdg4diLATqvVNXNLXF4Yk68lb5kiuycyuu+WDXbEuMlDHcWV6zOTq8H+y8PnuObGhdW1A43F83kj5xYH/XaMbkMXScbCkxQN8+VIzLN9VFNHy23P8wB6g9li9kZrdF+8R/CkV7OsH1KrJOe9RCzRw9eRq7+uL1UhDtvgWUam3Ro6daXYBzyJdpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jc6RDSjcK45tFGHqBPD6nKdKGwUUYshZx37jf2wVhHc=;
 b=k0/l2K1DKnCKRl1hv2YqtZviYwfzxC79sEcTu4r2dlWzKb2Ro7fYwqFzt5Gl7FtMdNqNtaMNF825wbR/lGHjPMS6cpODw52N1krE6BRoq/RdNwvY9sJzAKDrKJunpQOYDgT0d2rJ07ubjKN5gy2Acw/xSQot3xVSILKGnSDitj6P5ONfNoc8w1sc0LbGnsYdiiddNwg1kt0RV8qthafvoVWvZPxFD40G8T+AHm5dZYs+NCFC6hscrsw3Epz3CXQngQ3eNYNDDU3e1RgKs7v0LNTo7zgnfzbi9DlFVCNUKf5t6Nn/lSciTDuFzeT+e3/+2gn7I8zPRRKJncpgH6MxTw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jc6RDSjcK45tFGHqBPD6nKdKGwUUYshZx37jf2wVhHc=;
 b=bYc+02DKGEny4GDXb5e8cMsOBI53NRN+UWtiAO9lYRSXGOLl3tuxxulIopZ9dUFKPoChBGOx9bQZKI42Cp1KNCOS7b8nkeQ9tKi/GgQNWy86jQaVU1oUtFGgViqm/ThEPjhdrmwFe5Npgke8BgHJSasUVLMhLpRPk3aSG1LqKwyDVqZKHUbn3ZTokr8ced8A0MWwyOfGih77EahknFtMnxHwYOFMm5xib78riWmuO6+GBLBBeUC5EHQ6RdXVja/5dBOW9CM4RSmqhHpIOOkOuC9KwEZPo/LMZRdpgcDswDmTvyp06a5TvIrmTXrZwqYyOsyUGjBMoPSoSboyErs1dw==
Received: from SN7PR12MB8769.namprd12.prod.outlook.com (2603:10b6:806:34b::12)
 by IA1PR12MB6233.namprd12.prod.outlook.com (2603:10b6:208:3e7::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7270.11; Thu, 1 Feb
 2024 17:38:14 +0000
Received: from SN7PR12MB8769.namprd12.prod.outlook.com
 ([fe80::9f0f:632e:815c:f953]) by SN7PR12MB8769.namprd12.prod.outlook.com
 ([fe80::9f0f:632e:815c:f953%7]) with mapi id 15.20.7228.029; Thu, 1 Feb 2024
 17:38:13 +0000
From: Timur Tabi <ttabi@nvidia.com>
To: "dakr@redhat.com" <dakr@redhat.com>
CC: "airlied@redhat.com" <airlied@redhat.com>, "nouveau@lists.freedesktop.org"
 <nouveau@lists.freedesktop.org>
Subject: Re: [PATCH] drm/nouveau: nouveau_sched_fini() should check for init
 failure
Thread-Topic: [PATCH] drm/nouveau: nouveau_sched_fini() should check for init
 failure
Thread-Index: AQHaVI3+W441+uFKck219sU+KV3DkLD1c4gAgAA4h4CAAARDAIAAEW0A
Date: Thu, 1 Feb 2024 17:38:13 +0000
Message-ID: <879680fdafcc0c4227879e520715573052589bad.camel@nvidia.com>
References: <20240131213917.1545604-1-ttabi@nvidia.com>
 <cf79b780-2add-438e-aac0-e29b08799314@redhat.com>
 <036b1f1d704d02b2681a366f70ad93bf3143e8d0.camel@nvidia.com>
 <3cf2e6eb-07c2-4d85-8141-79568e78d8c9@redhat.com>
In-Reply-To: <3cf2e6eb-07c2-4d85-8141-79568e78d8c9@redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.44.4-0ubuntu2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SN7PR12MB8769:EE_|IA1PR12MB6233:EE_
x-ms-office365-filtering-correlation-id: bc6018cc-be49-49e1-da76-08dc234c90e0
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: UuKjoO7HTMwBmH7fmrKB+sEnmEqMGrl9yX1+6+8H5gEuPRyL5ZbVjswyU57DSgcISy967ESXhMTqXe4HB9DHZeCWXEH3s8G29MHHX0OA+NAON8iaaQyUYzK6nJ6cj4Z5szaBERJtpXTpQDrxPZ9o7FvjozD0uOG3ccufug1qmJKG5f5u/1flFZc96uM37pXaLLoKbJ5ICZeEKHSXHJ6GN2wwXxqTynQnTeoF1XoXvWFxqS/4sj3aNAHu4LjCU18NrXEvXNeZeRBqNhRyqcsreaCdvpHvKvDVBxSyH8a8pzlyWiJ9L6WeoNF+7FH5vJDaUBnseTYiqDBs81SrSTrjF8DrKmRqd86zjAUv68/C5Z0gVmBpHz8WMVq0a3Eo9XKcRpfsH8xYWy2Vjy45jYL03qs2PZ+LDNKt1tm4OiUo0a1b1nxGMgUX5sdP8gbcSuQ/o3WWeQJECzxter/ssBeOfWA5gYs7GTbjsF0PEnmUynDd+iot/hk9PPjmzQKCUcGImgaKjsri8WkTzbJdjINjVW7uzzpP6yPmWu13780CAxUT5IFlK1KUhBDrfBpSZHtRqZJfoPuDgxHEcdcL48t3eBIb3JODFE1j4PhPn2BuhUC6asMU6yf42aNM46MZH5ot
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR12MB8769.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(346002)(396003)(39860400002)(376002)(136003)(230922051799003)(186009)(451199024)(64100799003)(1800799012)(6512007)(38100700002)(26005)(2616005)(122000001)(5660300002)(4326008)(8676002)(8936002)(71200400001)(4744005)(2906002)(6486002)(6506007)(6916009)(66446008)(478600001)(54906003)(64756008)(66946007)(316002)(66556008)(76116006)(66476007)(38070700009)(41300700001)(86362001)(36756003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?cDN3NzA1bnlaL0JKNlkwa3BMdlJDNnhGRW9KNmViVk4ybCszSC9CRnp6cksx?=
 =?utf-8?B?S0FrZm9oRkZGYytwdlB1cTZLdFNoZUJnVUh4dkVDQjhrL1gzL0xUVFBUaXh0?=
 =?utf-8?B?RTRmYllxVEorNVE2elJIUGpOOVA5MlhvWE1qZjBjYmpvdXUrTWZHZU9mZHRk?=
 =?utf-8?B?MlNjU3paRnBHZHlTRWdQYW9ZK2N3VjFFY1VJV0lyeEZaQU1VKy9uZm1adysw?=
 =?utf-8?B?NzRtS2pqNU04MUtmK1VaVmc3NFRjeWhKblVyb2IzMkpGbFpwVUg2dnhveFho?=
 =?utf-8?B?bW1mNmFRaWxkbHR6Ty9uditLV1FMdDBZdWlDeTBiNmdadm5wVmptbWtpL0xP?=
 =?utf-8?B?eEovN3hEdXZ3MWFLY25PL2ZFQldoM2k2RmQ4YTJhNkVtL2xHeU1lK05pNC9z?=
 =?utf-8?B?ZHNxSHJIaFlWNTdqbDJYOUtacGJCRUo5M1VUUFE1eGpLbXQzWlNYaHlzbGxV?=
 =?utf-8?B?dUxPK00xRzBicVd6aDlQWEhGbWl2MjdMOXh6djM5UzBiczV5VlVuVmowL1kw?=
 =?utf-8?B?WE1aWVN3NWh1OWI0Sk1aY2FGcnVBMkQ4b29XUHdBWDJqVVFHaEV2Z2xWUVFp?=
 =?utf-8?B?cTRvV3l2SEZwOGJiQ0RnU2JyaDM4OWwya1RVZC9pSVBSSUlHNWZ0WWpOaHJY?=
 =?utf-8?B?bzFMOUJ0aktLbU51WEk3VlBJSFgwZHF2c1E1L20yYWp5VU9VZVcrTFI2aWFo?=
 =?utf-8?B?T2RUdHRBQVlOUDc3czBBZHFzTGFZalYwbVZvSURBQVlTcUljUHdwYitrTUly?=
 =?utf-8?B?T2JmM3lPOVhhMHBjTmYxVzRCNVFGQjAzNmFSM3BCdWhsSmpibXBkNlVsb1Fa?=
 =?utf-8?B?UFNtQXZJbFZ0ZGpEMWJkeE9pazIrSFVKQVlyTnUzeWxXWHl6Vmo3ZDdsWmRr?=
 =?utf-8?B?YnNwNTJLeFBFRHd1Z0pmM3d1VWduVEdDUkRscjFDalZWaTNxdHBQak9CWmJG?=
 =?utf-8?B?V05SSFlCRVVoMUtERWppRVR0NmVpTldJUlZHQytPSHhqVEJNTkFWcitpVFBh?=
 =?utf-8?B?Y3dpZWw4ZmxyKzE4M0ZzeXkvU3VLOUVTM2lOWkg0aTBHbUl5d0VvWmVQa0VY?=
 =?utf-8?B?a3Y5MWY4aFpZTWdRQnNMSzZNcEFmZjNBOXFkTExwd091UGIrd0dIWXdpcWgx?=
 =?utf-8?B?ZmxPWUVKRmpGN1djbm5RLzZ1QThxR1AwVGdoQS9sV3VBYnhvT0o2YllFYk5Y?=
 =?utf-8?B?aGgyWWlaU2ZOaDNLemN5Z1BnSEZrbW9wT3RPaTJQSDdJZWQybklQMGN4N3Yy?=
 =?utf-8?B?YnRNRkpyQytGTWxpa3ZERzJrKzY0eFhZdHVsN0MveFNJT0lucmtyM1dPdjNY?=
 =?utf-8?B?SDNGVUtFb1dBQThOQ0l6Rk5ZeFVKK1V6NU1MUDRQSDRrenNjWG5ta0JqWU9j?=
 =?utf-8?B?L0Q0QThYbFgvd0F6VFpPSzg2TE05YkJwZEFsRVNYdGZNdkJtNm5ya0NGNFpx?=
 =?utf-8?B?aWdIMjBRa3BGc01vMWxmR2tYSGF1T3JHRmNVelJsdTIzUjVsMUdudE81dnNX?=
 =?utf-8?B?Sy9SdXpZUTRDc0NXa0R3VU1OZ1ZNOUFmZFhBWFBLYlNORGZMeUFvUHVDOGhj?=
 =?utf-8?B?REhqSnM1bHBhQ1BwUHcvUkRZeHhuUTY0M0FodzQzdVVHK1ozd0NBVTk3dWxP?=
 =?utf-8?B?R3R5dzZLditlYXF6TkgydExXcVJYNk1lNUw5N3dCQ3gxNWxkQ0NCQzJuaUo5?=
 =?utf-8?B?QklkY2dZTkVJZ3IrY0srQytrMEk5Y3ppRzg0SDRSU0JRQmY2SVNwZ3JRUGVL?=
 =?utf-8?B?UXc0M2dNK0g4VWhSUGJ1cTVyeWZ5VFZ3ck16Yk16K0VCaGgrMm41T2RUc0NF?=
 =?utf-8?B?c3A2UWpJQ01PK1M2aHgzc2pXZDc1K0pUQnR6MHRnT0QrY0xQQVpmck9aay9Y?=
 =?utf-8?B?MmRudmVzTXdFdkwyZHBWbVU5OFJ3RUVmMGhFNlJ0aDQ0b2JEclNvdlp6bCtW?=
 =?utf-8?B?VThNeVpFZ2NjaWZuSnlobTdkUXlHMkM2emdQZUM2WUNSd3F2bllSemhSWkI1?=
 =?utf-8?B?RExBa1ZSd2FISFNFVGRIbEFuZU5JRVB0Z2pDYUZXdVRzcXZzUnlMeTFwaXpp?=
 =?utf-8?B?U1ZqOTkrb0sveE9pWVkrY1JlNTdvQWJnTVByUUFkbnFwN2graUlLakh1Uzlm?=
 =?utf-8?Q?txyBCEJOjLdwondM2aa/Gxuxl?=
Content-Type: multipart/alternative;
 boundary="_000_879680fdafcc0c4227879e520715573052589badcamelnvidiacom_"
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN7PR12MB8769.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bc6018cc-be49-49e1-da76-08dc234c90e0
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Feb 2024 17:38:13.4889 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 8GzT+SQwTOAAa/xV0Nvugv7c/N73qjhKuBy//Au/8dFaP2eVWPUoONpK/VuCwvgdPNlHursRWXNcDYfh3Ihxmg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6233
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

--_000_879680fdafcc0c4227879e520715573052589badcamelnvidiacom_
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

T24gVGh1LCAyMDI0LTAyLTAxIGF0IDE3OjM1ICswMTAwLCBEYW5pbG8gS3J1bW1yaWNoIHdyb3Rl
Og0KRG8geW91IHdhbnQgdG8gc2VuZCBhbm90aGVyIHBhdGNoPyBPdGhlcndpc2UgSSBjYW4gYWxz
byBjb21lIHVwIHdpdGggc29tZXRoaW5nIGFuZA0KYWRkIHlvdXIgUmVwb3J0ZWQtYnkuDQoNCkkg
dGhpbmsgaXQncyBiZXN0IGlmIHlvdSBkbyBpdCwgIHNpbmNlIEknbSBub3QgYXQgYWxsIGZhbWls
aWFyIHdpdGggdGhlIGFiaTE2IHN0dWZmLg0KDQpJJ20gYWJsZSB0byByZXBybyB0aGUgcHJvYmxl
bSBlYXNpbHkgYnkganVzdCBoYXZpbmcgcjUzNV9nc3Bfd3ByX21ldGFfaW5pdCgpIHJldHVybiBh
biBlcnJvciBjb2RlIGluc3RlYWQgb2YgMC4NCg0K

--_000_879680fdafcc0c4227879e520715573052589badcamelnvidiacom_
Content-Type: text/html; charset="utf-8"
Content-ID: <59BFEFD9C5B16D45BC8D06B8F8BDC171@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64

PGh0bWw+DQo8aGVhZD4NCjxtZXRhIGh0dHAtZXF1aXY9IkNvbnRlbnQtVHlwZSIgY29udGVudD0i
dGV4dC9odG1sOyBjaGFyc2V0PXV0Zi04Ij4NCjwvaGVhZD4NCjxib2R5Pg0KPGRpdj5PbiBUaHUs
IDIwMjQtMDItMDEgYXQgMTc6MzUgKzAxMDAsIERhbmlsbyBLcnVtbXJpY2ggd3JvdGU6PC9kaXY+
DQo8YmxvY2txdW90ZSB0eXBlPSJjaXRlIiBzdHlsZT0ibWFyZ2luOjAgMCAwIC44ZXg7IGJvcmRl
ci1sZWZ0OjJweCAjNzI5ZmNmIHNvbGlkO3BhZGRpbmctbGVmdDoxZXgiPg0KPGRpdj5EbyB5b3Ug
d2FudCB0byBzZW5kIGFub3RoZXIgcGF0Y2g/IE90aGVyd2lzZSBJIGNhbiBhbHNvIGNvbWUgdXAg
d2l0aCBzb21ldGhpbmcgYW5kPGJyPg0KPC9kaXY+DQo8ZGl2PmFkZCB5b3VyIFJlcG9ydGVkLWJ5
LjwvZGl2Pg0KPC9ibG9ja3F1b3RlPg0KPGRpdj48YnI+DQo8L2Rpdj4NCjxkaXY+SSB0aGluayBp
dCdzIGJlc3QgaWYgeW91IGRvIGl0LCAmbmJzcDtzaW5jZSBJJ20gbm90IGF0IGFsbCBmYW1pbGlh
ciB3aXRoIHRoZSBhYmkxNiBzdHVmZi48L2Rpdj4NCjxkaXY+PGJyPg0KPC9kaXY+DQo8ZGl2Pkkn
bSBhYmxlIHRvIHJlcHJvIHRoZSBwcm9ibGVtIGVhc2lseSBieSBqdXN0IGhhdmluZyByNTM1X2dz
cF93cHJfbWV0YV9pbml0KCkgcmV0dXJuIGFuIGVycm9yIGNvZGUgaW5zdGVhZCBvZiAwLjwvZGl2
Pg0KPGRpdj48YnI+DQo8L2Rpdj4NCjxkaXY+PHNwYW4+PC9zcGFuPjwvZGl2Pg0KPC9ib2R5Pg0K
PC9odG1sPg0K

--_000_879680fdafcc0c4227879e520715573052589badcamelnvidiacom_--
