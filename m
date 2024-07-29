Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F3F29940189
	for <lists+nouveau@lfdr.de>; Tue, 30 Jul 2024 01:09:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AEA1B10E3A0;
	Mon, 29 Jul 2024 23:09:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="pvaF7jU7";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2079.outbound.protection.outlook.com [40.107.94.79])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0789710E3A0
 for <nouveau@lists.freedesktop.org>; Mon, 29 Jul 2024 23:09:07 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=N9PY2QTbqrq2w/zab7LFEx19363hWASSNVPbXbQPFFdiu3unAS7AA5RXlCbB+amVmd1akgOKIMY+medrzpRCcr9gIWB/WrgY+hBLpNnDQKeLzlhEB8Mrw3tXqBtG5K26F+QOGCys6cCblVCZkJkRUZhLXZMpiNBDzTj7CRd6pM++ZVEz65bfDZQf6vsbQ6d4N6ltypPdn2BRsS9yz/FJEpQ1Qbc68KldXawSg8vFD68O++7XjSwcW1tcXSVIylNtoQE+6SWjJlk8tpbU5uGAiiEw8oaMyzr4AVIHokR4Gpb8rA5KvrNlaInrMUgiVENgzrLkzl4eQC3cejoD6Yo53Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=R6ikO7m9lZdZvCYsS1oKrk5UU7yCFN0Jn/8tcMTdajg=;
 b=oZuDQHBUf8yeEjCcxfkp6g2jFrh1v7fgRSkkBLvuXIo3t+EznPfNj5HAem8++wcX20czKU34SLUC8XtGdDEB/MOkD9Ec+0+1Q7nVg82VKvXictXvppopVJvPsOzxqgbtLRgZQwnBuFD0Ex/HmrfOqn96lBmUGxXSNQAreRPbVVdMlZZZRDqR0xq1c2qssnLgcGdUUWhJnpKtaXgaKZXCWASuZzAO1f4JFvoAffEH69Q4G1jsmRZR/PgPL9B9W9B7eQ6cHPpNAlc1lE7lvDDCCwATMn3SlHroAn308UZetRQdNA6WHbyJ6WlGvQCRND6RGYrbLqigAQSbAgxfIJ6s2A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=R6ikO7m9lZdZvCYsS1oKrk5UU7yCFN0Jn/8tcMTdajg=;
 b=pvaF7jU7OygwFcsIFtpsQM2l8Vv5aerXbWEkg8jLqaiAiLHABrXa0qiAAV6LAjdocUKGOIUmxQVp7vLabgP6GV/M2srhSsHtOnNWiqD6LeqXFu6DyKKSkF5j/iCg8fMqtPs3iViL+iuI10xzZzpnwwkGuQXlRsd+J7WQKiXBB1nA12YAYk7AqI9nBHaCSyC4v6UJNXD0wcc8TjVUenUXWK0tY//4q8RcjuVoECa8TYiBcZuDoA34Ne2rC0/9uMCU6v3g23S9ny+flMEnmnSgovg7B4w34F8ZNhEzxpZVWwhyReYsu08PfLwj7NgIfWuOkiMpRu4lr6SkbHMz7EjvXw==
Received: from CH0PR12MB5268.namprd12.prod.outlook.com (2603:10b6:610:d3::23)
 by LV8PR12MB9153.namprd12.prod.outlook.com (2603:10b6:408:185::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7807.26; Mon, 29 Jul
 2024 23:09:02 +0000
Received: from CH0PR12MB5268.namprd12.prod.outlook.com
 ([fe80::c194:e8c3:6ef4:523f]) by CH0PR12MB5268.namprd12.prod.outlook.com
 ([fe80::c194:e8c3:6ef4:523f%5]) with mapi id 15.20.7807.026; Mon, 29 Jul 2024
 23:09:02 +0000
From: Timur Tabi <ttabi@nvidia.com>
To: "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>, Ben
 Skeggs <bskeggs@nvidia.com>, "airlied@gmail.com" <airlied@gmail.com>,
 "dakr@redhat.com" <dakr@redhat.com>
Subject: Re: [PATCH 1/2] [v2] drm/nouveau: retain device pointer in
 nvkm_gsp_mem object
Thread-Topic: [PATCH 1/2] [v2] drm/nouveau: retain device pointer in
 nvkm_gsp_mem object
Thread-Index: AQHa4gwgfYHNW/Zmc0avSfBgd0Y5fLIOVICA
Date: Mon, 29 Jul 2024 23:09:02 +0000
Message-ID: <749743ec8a8d0261dab066af0828a59dcbbb13be.camel@nvidia.com>
References: <20240729230720.1305760-1-ttabi@nvidia.com>
In-Reply-To: <20240729230720.1305760-1-ttabi@nvidia.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.44.4-0ubuntu2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH0PR12MB5268:EE_|LV8PR12MB9153:EE_
x-ms-office365-filtering-correlation-id: 5b43caf2-acd6-4f2d-8e8f-08dcb0236fb1
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|366016|376014|1800799024|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?WDZTQkpOemlvN1ptT2dCTXQvSVNvSmw0a1c1bGNBUXZRdGlEclY1TU84UEhn?=
 =?utf-8?B?NS9DcFRuTGtweWpSeE1ZaG5ZbVpJQXppN0dxSG8wMlNwWGhDWkVwM21uWERY?=
 =?utf-8?B?eFc4SGVBcTBkUmcyc2liN1ArOUVWUVVXSTUvTkJjcmM4QTNlYzAyeW9MZno2?=
 =?utf-8?B?ampHVU1lRGpWYTdwWGkzUHlRaWdueWFGM1F5SytEbEtlcytNdjZUWkJnR3lL?=
 =?utf-8?B?TUVOSUxmOFVCTlYvYm5YTmt1cGZVd3NIQWFWNTA2bTVWNVZHOStYWXRYRUl5?=
 =?utf-8?B?cmtJalJySjdwejRUZ2JqWVk0aWlOdFQ0Z0I2a2x2aCtPRm5XeVZNYTg1bE1O?=
 =?utf-8?B?UmxacEtZeFk4ZTFEQVNKT28vbWEwdnZJS2E1WU91dTYvQStVektpWngwVThL?=
 =?utf-8?B?MmRpSXQvNnNzbU9xbytVNmNia3F5YStISnNvdlprNDN1b2RVdU5wZ2RWc0FU?=
 =?utf-8?B?WHVhY1JKaWJzY1p2MXYzQlV3ZmwyWE1Lekk1elhNN0lLc1RWZElxeVd5UjJo?=
 =?utf-8?B?T1k0S3JqNmRWeGFoeG05V3d1TEpUb0hvU05ma1pRbFI1ak5YZDFhZTdlMEVw?=
 =?utf-8?B?T2M1dHo2aXI0eU0vejJBQ3BrUVNaU3hpY0tTVDVnbnJBOGJrN09EdUJhRDJR?=
 =?utf-8?B?TmJKR1NsZ1J1N1paOWhOYTJ6UDBBangxWnJsZGozZGFNS2pGb3BsaUZqbGdx?=
 =?utf-8?B?dzdDak1jQytlMVNXMVpTZFU3Q1k0Q01iM29Oang1RHhLUURnZmJMcTdaM1BK?=
 =?utf-8?B?Uko1K1lDRU01eWwvWEp2bktITUd0c2xSeHI2QkhtdXlydU9ZcDYxSWlRNlMy?=
 =?utf-8?B?TlBMa1Q0MFFvZVNYUGs4NTdwZ0c1aTFCaDZ2cW5BQVQ3ZGFZT1VHdFZWTHNW?=
 =?utf-8?B?YVhSTXRvVWpLSWJ5YytQWmpPZzFWdkN0eE13UVVNcXBYQURQWlNXR3FnVnFG?=
 =?utf-8?B?dkJpbFZQTU1GbzNTUGRPYUI0eFJqSUNMVndRR1V4ckRNbEFWMXlvQmNZQStW?=
 =?utf-8?B?VGoxNlJwQ0JlR3JJNGFkTURZd3FDY2lKYkxvUktmZVZ3czFhNG5uTmR5NFg5?=
 =?utf-8?B?WHFOaUhEeFdrZzd2ZmJzQ0pFbTdsYmdQVEdVNmw2MXhRVUZObEJiZnJDdEJ2?=
 =?utf-8?B?dHFyRjl1S1lDclRsWUxmb3FySlVFWjV2dDJ2SUg0d01tNW9zcGpMVG9HbTlJ?=
 =?utf-8?B?M3UvQmxLWnJ2SjUydzVoMFI0bVErd3Q4cW5odnl3Z0xuMktnWFQ5T0ZVQThj?=
 =?utf-8?B?WHlLWjUwOG11eVBQZVIyQmpGUWd4Yml0d25wV21sM3RNQ2dyOEFIOStrL0Vt?=
 =?utf-8?B?N3FSWUxhcXJsWldWY2dZb0ZRbm5lZkxKWWF1MlZPZmVUcUE5YlE5QUlpSk91?=
 =?utf-8?B?V3gzTzNzMzFOSHl3RU5DTmthTjl5eUVvS0EzN0ZlUVh4djRGL0hsT2psVlhy?=
 =?utf-8?B?Qy9pcnI0TGFMTUhONVhpN2JlSnZTSE9MOUJlUDVCbm85M0FsWU5rb0loL1B2?=
 =?utf-8?B?R0haQVowVmJzcGk5clI4WUNCNHlUd1FjSS9SbVM3VStSeDRHM0pOSngyVTNO?=
 =?utf-8?B?TWxtR0Vsa05VMlpQamJFSVl4REl5SmNuZmhyY0FlcEZlTXowQ1d4QTdwOWk2?=
 =?utf-8?B?cm1DL1RrWkxIMHU0Yi9TYXI2Y3FuRnUzcXRxbk82NGRDazA1ZnBCQkRNUEgz?=
 =?utf-8?B?V2dyWU5zejludjg5WURBa0RtQ3F4ZFlCYXVBb2xQSFNmc25FUThOOVpUNEJM?=
 =?utf-8?B?Mk0wdWZqME44SWNTQmFCY3RrS2xZdExwQzRSbFowaHZLbHl3VFB6SklWZ3Rr?=
 =?utf-8?B?TWlsQ3g1UWVhcEI2SmtmY2d2d2wraTlHUzltRnRTaHVKYSs1b0pYbWduWUdt?=
 =?utf-8?B?bEx6NEdpTUVaSXIrdUZIUDY2MkdVYlJ4by8yTVh2RkJpbEE9PQ==?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR12MB5268.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?WFVUbDFaL0ZjS2sxbUFhMGhTa00yQkI0RzZvSlpwQnVGUFdiaCttRUo2STho?=
 =?utf-8?B?eWNLdHR1MG1rSWhKazBZdjRJcTMvSFpWMFJwNWhMSDhndVNnUmtibU5nNEt6?=
 =?utf-8?B?bldmRzRYcis3WUZFVU95NmxTeTNvUzdYM2gweWN3Wkdsc1gvSFI0Y2JKT2VP?=
 =?utf-8?B?OFBSLysxTzlvbW0wZHQ3VW9qK2dIRlBKenoyVkZRMzZnMWFkOUs1YTlCNG1N?=
 =?utf-8?B?TFhyUVoxK3N3U0lZVEF6b09scFRhMGgyM1Naa1FLZmJMd0U1YXI5cTNFbGpo?=
 =?utf-8?B?TWhkTlpPN1VReERQRllJNDExaEFFTkZkb2NKNFZZRmpoenduVDNwSXpCdXVa?=
 =?utf-8?B?WXdOdC96NG42WTh4L3FuZU5LWUVjU0FHRnNiRm5xMGJBWStMNUIwdER0Ylpx?=
 =?utf-8?B?eVM0ZjhoRUIrbU1kN09aRkJYRmp6SUFpZXU5bG5sY2pBMUZEbXVmWmlmZGRX?=
 =?utf-8?B?UjM0V0x6TW5IdmJOOFNrdklEV3ZrZzFlOUwvOG93V2ZwWXArTEZDZnNUWkdT?=
 =?utf-8?B?YkNSV0kxd0VhRHgza3VpQ3YvNW5PTEVUU2kxalZyWE8yekczdGpRSStscnda?=
 =?utf-8?B?dHRNUkVOZS8vdFdpamNmdHVmVXJzd29WTDhrTTZGbU9VT3l0Wlp6dTNqU1VL?=
 =?utf-8?B?bVliN1dkUW9WZ0FpWm96bW0wUW8xbEk2VkQ0c0tjRzRJc0NLamZqbEtIb0FU?=
 =?utf-8?B?TnF6VzhBcFFFSmFwbzBmNEt1eFZBakJPdHRVRGFaMUl6aVhSR2xSOGdVcjFt?=
 =?utf-8?B?UGhjakt6R0g1K1FROHoxOXptR0lSZVI5M0RRNFJ3NFNVMUV5cEFKSzI3bmlF?=
 =?utf-8?B?MnhGTFNqdVp0bFpEVGhrUzJjS0VYcVZCYm5KRVMzc1UwWHV0SThaK2locGth?=
 =?utf-8?B?dG5US0NNMWp0THRHdGNUblFia2NXVzhlbERDSFNpMzFSUGk1amZFb25EV1U4?=
 =?utf-8?B?eTgxUzFiSEovNXVUVDljWUFzTlpRMkt5cTVqUWtHdXFWcGt5RkNYUHJiSkRC?=
 =?utf-8?B?cE55TUgwalR4WlYwL3UrakJxekVpdGRPSGlPUTFQbDJRTU1xWDg0OGJrMGJv?=
 =?utf-8?B?MldOZTNVSHg5SS9qa2hIa29aSk8wKzNDVnRrSzFkeVpUSHVsdzJKQzVGUXZ1?=
 =?utf-8?B?TUt6cVZ6SnJINXNrMytoVXlTcVVuZGhXUC9zdUVnWEIzbGhmL0duUTZxM2g4?=
 =?utf-8?B?Sm1icWk0Y1l1TjZxSElydWJKL3hEY1FXNFVDUzIvdmpCVXgzUDZWaFZaNENL?=
 =?utf-8?B?RE1obXNTZFlQT09oY1VxLzY4T01TeXE4REd6VGRWd243SnNZMTNHWi9aaGRi?=
 =?utf-8?B?MFBKSGFSRzFIT0ptYWdSUVJ4WGNBbHlQTVRUakpQcmRKaERoYmpHMHg5SVpT?=
 =?utf-8?B?WGhIYXY1NUZYSVp0cW5CaVkrbTNYY0xZaEt1Q1FMcmRneGU2TFhlWkZkbWZi?=
 =?utf-8?B?MDV4ZUpKSkV1ZHA0eTF5VGdXUENPaFQ1WSs3M1F3RXMvQmJ0ZDRnUWYxSHhR?=
 =?utf-8?B?WDYvcVZQQytlWm5LSDVpZ2VKVkZaTGJHZEgxbU5mR1laSk55aUpyZHpJNzNC?=
 =?utf-8?B?Z1Q1VHM5ai8yYjkwSFUyZWVTbXVORFdmNnczNUJlL3M2SXBwY0QzTGdPYkxh?=
 =?utf-8?B?TjdzUmQ2eVR3SitteEJzL0N4V2V6WFJkcGZkcGRoVlBBNExtb0p5REs2ZHNk?=
 =?utf-8?B?SnJsRkpCdFI3c2lSdTVyUmpKa2dWSEdEU0grVjlielJUNE9lZGNZZStGaVlC?=
 =?utf-8?B?WWJ6ZTVIM0xXbEQxRERYMkVEUGJnL0lkNzZUd0ZESWR3dEhONU04UklwTlRn?=
 =?utf-8?B?NTQzMzNaTnlDQVhyWnZWOHZCUmc2ckZ2RjVaeVdZTjlVUXZ0Q2ZKKzdPcFFh?=
 =?utf-8?B?eVp2UEg0b2RCRkRiS2pyZFVvNFhUWGd6TXlFRWJHaUxSZklmN0FoWVhGV01y?=
 =?utf-8?B?dlVPRjdMc0FQVXBHUWc0ajdwYWIyUU9wYUJIU04wUVZRb3g3Wk9iSzNnd1R6?=
 =?utf-8?B?YmxqVDRnR0UzT2V3QjZMclgzajZJZERWVFdHbDJqMzcwdVRFcDVadDFrdSti?=
 =?utf-8?B?SGZ1elFzVTRidHkwdUpvR1d6YnVDVUFtUDA0YWFKYnplMTRjbWQ4UnlwWUJS?=
 =?utf-8?Q?q4xSAcFmGJkH6e4JQ4i2xqnSw?=
Content-Type: multipart/alternative;
 boundary="_000_749743ec8a8d0261dab066af0828a59dcbbb13becamelnvidiacom_"
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR12MB5268.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5b43caf2-acd6-4f2d-8e8f-08dcb0236fb1
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Jul 2024 23:09:02.3561 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: +Nyn0riNb/KgWInwC+/rP5Mw6PHlWPKi+jpbZz93pR2qxX8NphYIDXWI1tAt0mna5P7r7ttrk23WHIyUJv9Blg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR12MB9153
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

--_000_749743ec8a8d0261dab066af0828a59dcbbb13becamelnvidiacom_
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

T24gTW9uLCAyMDI0LTA3LTI5IGF0IDE4OjA3IC0wNTAwLCBUaW11ciBUYWJpIHdyb3RlOg0KDQpT
dG9yZSB0aGUgc3RydWN0IGRldmljZSBwb2ludGVyIHVzZWQgdG8gYWxsb2NhdGUgdGhlIERNQSBi
dWZmZXIgaW4NCg0KdGhlIG52a21fZ3NwX21lbSBvYmplY3QuICBUaGlzIGFsbG93cyBudmttX2dz
cF9tZW1fZHRvcigpIHRvIHJlbGVhc2UNCg0KdGhlIGJ1ZmZlciB3aXRob3V0IG5lZWRpbmcgdGhl
IG52a21fZ3NwLiAgVGhpcyBpcyBuZWVkZWQgc28gdGhhdA0KDQp3ZSBjYW4gcmV0YWluIERNQSBi
dWZmZXJzIGV2ZW4gYWZ0ZXIgdGhlIG52a21fZ3NwIG9iamVjdCBpcyBkZWxldGVkLg0KDQoNClNp
Z25lZC1vZmYtYnk6IFRpbXVyIFRhYmkgPHR0YWJpQG52aWRpYS5jb208bWFpbHRvOnR0YWJpQG52
aWRpYS5jb20+Pg0KDQoNCnYyOg0KDQphZGRlZCBnZXQvcHV0X2RldmljZSBjYWxscw0KDQpVZ2gs
IEkgZm9yZ290IHRvIG1vdmUgdGhpcyB0byB1bmRlciB0aGUgLS0tDQoNCg==

--_000_749743ec8a8d0261dab066af0828a59dcbbb13becamelnvidiacom_
Content-Type: text/html; charset="utf-8"
Content-ID: <123867ED45593446A38C3035AE8967B7@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64

PGh0bWw+DQo8aGVhZD4NCjxtZXRhIGh0dHAtZXF1aXY9IkNvbnRlbnQtVHlwZSIgY29udGVudD0i
dGV4dC9odG1sOyBjaGFyc2V0PXV0Zi04Ij4NCjwvaGVhZD4NCjxib2R5Pg0KPGRpdj5PbiBNb24s
IDIwMjQtMDctMjkgYXQgMTg6MDcgLTA1MDAsIFRpbXVyIFRhYmkgd3JvdGU6PC9kaXY+DQo8Ymxv
Y2txdW90ZSB0eXBlPSJjaXRlIiBzdHlsZT0ibWFyZ2luOjAgMCAwIC44ZXg7IGJvcmRlci1sZWZ0
OjJweCAjNzI5ZmNmIHNvbGlkO3BhZGRpbmctbGVmdDoxZXgiPg0KPHByZT5TdG9yZSB0aGUgc3Ry
dWN0IGRldmljZSBwb2ludGVyIHVzZWQgdG8gYWxsb2NhdGUgdGhlIERNQSBidWZmZXIgaW48L3By
ZT4NCjxwcmU+dGhlIG52a21fZ3NwX21lbSBvYmplY3QuJm5ic3A7IFRoaXMgYWxsb3dzIG52a21f
Z3NwX21lbV9kdG9yKCkgdG8gcmVsZWFzZTwvcHJlPg0KPHByZT50aGUgYnVmZmVyIHdpdGhvdXQg
bmVlZGluZyB0aGUgbnZrbV9nc3AuJm5ic3A7IFRoaXMgaXMgbmVlZGVkIHNvIHRoYXQ8L3ByZT4N
CjxwcmU+d2UgY2FuIHJldGFpbiBETUEgYnVmZmVycyBldmVuIGFmdGVyIHRoZSBudmttX2dzcCBv
YmplY3QgaXMgZGVsZXRlZC48L3ByZT4NCjxwcmU+PGJyPjwvcHJlPg0KPHByZT5TaWduZWQtb2Zm
LWJ5OiBUaW11ciBUYWJpICZsdDs8YSBocmVmPSJtYWlsdG86dHRhYmlAbnZpZGlhLmNvbSI+dHRh
YmlAbnZpZGlhLmNvbTwvYT4mZ3Q7PC9wcmU+DQo8cHJlPjxicj48L3ByZT4NCjxwcmU+djI6PC9w
cmU+DQo8cHJlPmFkZGVkIGdldC9wdXRfZGV2aWNlIGNhbGxzPC9wcmU+DQo8L2Jsb2NrcXVvdGU+
DQo8ZGl2Pjxicj4NCjwvZGl2Pg0KPGRpdj5VZ2gsIEkgZm9yZ290IHRvIG1vdmUgdGhpcyB0byB1
bmRlciB0aGUgLS0tPC9kaXY+DQo8ZGl2Pjxicj4NCjwvZGl2Pg0KPGRpdj48c3Bhbj48L3NwYW4+
PC9kaXY+DQo8L2JvZHk+DQo8L2h0bWw+DQo=

--_000_749743ec8a8d0261dab066af0828a59dcbbb13becamelnvidiacom_--
