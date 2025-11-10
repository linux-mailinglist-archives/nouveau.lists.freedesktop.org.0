Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 68534C4943D
	for <lists+nouveau@lfdr.de>; Mon, 10 Nov 2025 21:39:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C19910E305;
	Mon, 10 Nov 2025 20:39:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="V7B8LuB3";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from PH8PR06CU001.outbound.protection.outlook.com
 (mail-westus3azon11012070.outbound.protection.outlook.com [40.107.209.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B3E810E305
 for <nouveau@lists.freedesktop.org>; Mon, 10 Nov 2025 20:39:15 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=n0eQxhN8gegf4FTcyyF8y/rb9az/0HZ3j6xKV+KU/zV3697XT27druKEp89D6R5f7VAKiotYpIGO0186w6nEHmkf9V9SdUNYVO2+osWGmyegt6yvMUX8AysezEyspdTkVKwvJqac2BNaQ6txPiU4bkyA9fdRlvbJSRbTd6B0Rq2yGRbbdVjLZ9l1MIXSpr9rNn/4Fsfmr84U9/EYtc/1oRhiksQfhmYJmIO35kZWtBaOZKYVPlOCEmed5AS7EDNUaPmy3Z/mQNNjpGxIYF4xexYXjXbknYD0IIrpoQELiRG3qNxDyka6nyd5OC6+wqio7YTxsNTe2HLiRgROR1nCvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0JxKA5IJff3bkMuDS+i89NB+RSkPCw8DnPizwmaoR1U=;
 b=sJKIHZTTvIs61Jst1PARGtM1Wf9hoUgzHcG7J2lxED+MfNdeCcx5FoipKdboWajVZZqxO/U1iUFX0rmwZe1doKP+xs1xU+HD/RcURsnbUwXxLckoczcnVJTBRu1KkRVKH3NFGoIB/RXnMuiOaKwaNPGGV/FnmziShQ2++ui843BeQPloSs+Rw1NwO82oxsPIFIDRTcEG1GsAO2DeoKO2GzctoQV9qiO7v5hG66t4d/uAnJoSEdSJdJ8SSPc4nizUiyu2WBA26nJZ+A9NRJqxoL8fGTdsXKR9dsZGsjvgU2p8Y4XAFkkKhc9Ah8hncG90D/NZRXsk5AOoaxLYwtithA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0JxKA5IJff3bkMuDS+i89NB+RSkPCw8DnPizwmaoR1U=;
 b=V7B8LuB3NkafBjnMmrq72bftMOJ2df4oN4Qlyu0eXmLEVe9yk51gQGQUAPGeXrMHCWNuxvZ0CExKGbiGJscrBnkNQKPtjpSASBWpbhjcvhPaQ7QpSZAGSLq/OyfwcbfLHxaHejMWnFSdpX9FrH8XV+0u9PbAD1hOgMYUosOeFd6X1Kj5FqqKybDxn7KBYYeAJOo7RkTa0qmSILIm5SCBcPcHnpo1YIAC6on8FhFNXLJiOnNMQdH8P+9oR4CDPACnstSlQIhwjacXgQsStg70NN/hrzkSzUn18YKSTsd3eAuFDcIgVN/XDQqJ7QShoI8OzXIVQ9UWw4Add7459QzyTQ==
Received: from CY5PR12MB6526.namprd12.prod.outlook.com (2603:10b6:930:31::20)
 by MN0PR12MB5786.namprd12.prod.outlook.com (2603:10b6:208:375::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.16; Mon, 10 Nov
 2025 20:39:09 +0000
Received: from CY5PR12MB6526.namprd12.prod.outlook.com
 ([fe80::d620:1806:4b87:6056]) by CY5PR12MB6526.namprd12.prod.outlook.com
 ([fe80::d620:1806:4b87:6056%3]) with mapi id 15.20.9298.015; Mon, 10 Nov 2025
 20:39:08 +0000
From: Timur Tabi <ttabi@nvidia.com>
To: "airlied@redhat.com" <airlied@redhat.com>
CC: "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>,
 "lyude@redhat.com" <lyude@redhat.com>, "dakr@kernel.org" <dakr@kernel.org>
Subject: Re: [PATCH] drm/nouveau: set DMA mask before creating the flush page
Thread-Topic: [PATCH] drm/nouveau: set DMA mask before creating the flush page
Thread-Index: AQHcSoEh8dWTlveQmEOccXmfjOLePbTp7IaAgAKCloA=
Date: Mon, 10 Nov 2025 20:39:08 +0000
Message-ID: <8cc46ac81e58a2043052ee67affacb372250bff7.camel@nvidia.com>
References: <20251031161045.3263665-1-ttabi@nvidia.com>
 <CAMwc25pOob3aXPH8u2ON7HZ-Bk+a_d9JWg0+wLNOycnFsVWHSg@mail.gmail.com>
In-Reply-To: <CAMwc25pOob3aXPH8u2ON7HZ-Bk+a_d9JWg0+wLNOycnFsVWHSg@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.52.3-0ubuntu1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY5PR12MB6526:EE_|MN0PR12MB5786:EE_
x-ms-office365-filtering-correlation-id: 9118969a-f9eb-4682-e0e4-08de2099329a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|376014|366016|1800799024|38070700021;
x-microsoft-antispam-message-info: =?utf-8?B?MHMzVTJJemcwSWw3dVZycUdldmV3RmVhT2JnL0svaUxtaWJ6UCtrOHVRa0k2?=
 =?utf-8?B?SnZNUkI2WU12OFJHUlN4aE9ScU5UeGtKRXdXd0VQUEpGMjdHK0F0SS9ad0xQ?=
 =?utf-8?B?MkZkOEZYY3lVK2xxdjlDWmN1OUpXYThWZWNxODM5dktVREcvTkdHdG9UVHA3?=
 =?utf-8?B?cUxDOVNjZzRCZzlnRitiSitTOURTVW5TTWZqV3Fua0VEYzdWMnBLOExMditO?=
 =?utf-8?B?cjVMQ2JnSzgxZUZ0aWJkRGVkSzNMWVFRUUJQaUlBdHZaRU5lYjA4RUZkb3c5?=
 =?utf-8?B?TDJZNzRRa0hibitKOGJnRDRCMlZ5QmhXbThmeWErTjlJZE0zR0VUaDRUT1lF?=
 =?utf-8?B?MFBYTlFrSTBNaHRtMGRiOFRKVXJHWjhjanloSStzL0NNeHFrSDFMeitXTjNO?=
 =?utf-8?B?dVVvUGxXSUVITUc5S3NPWTVJcHhnK3hqRUhvdm41ZUtDWmxRb2RaUUViWENN?=
 =?utf-8?B?TkN3K1UyUGhxei82OEtjNHZSQnZ2dm1LWTUrYjNFWkRibFB1bEh0RWNod0JD?=
 =?utf-8?B?Wno0eEI3MFl6cGQ0c0I4VUFIR0FtZUhUOFNuUGdwbDIyY2kyamhwOFRLeUJE?=
 =?utf-8?B?aTVOcFZHOXpjWXNIK0V1UzEyRFRqeWpoakY1MTFsa1BaNTlJS1Q1ejR1bkNU?=
 =?utf-8?B?djRGMFJGeHlqVldjbU5ycXBCd3I4dzJ4VXF5dlh2dDQ5SEFHYXZZSzlpSnpM?=
 =?utf-8?B?dE5WaEIyY0MyVFVhSHd6TXN2N0ZaRGhZMHBSZHFCYmozNS9UQlJDSmFsbXd4?=
 =?utf-8?B?N0N1dlQzNkRCSitXK3R5NmJydVh3OWswVm1DQW1md1IwTkEzUThCbUdXeDd4?=
 =?utf-8?B?czduaDA4OVdvSDg3Y1daUktpMU52S01xVlE2NGM5MjVHMlpNK3pRMEIyVGhs?=
 =?utf-8?B?NDR3SzFyUHJxazUzWUtNMkh5U1BNaXBiaWpGaWNXWUVYM3ZxSXQrQkw3V1oz?=
 =?utf-8?B?Y1BLSkVIeDFrTHBicU1MRGxuemE2YUl2eTdpNVV1ajM2OWJUUTRzR0VUTUkx?=
 =?utf-8?B?VzNkdUh2bnVTWHBiVHc5SDZjR0sraTNkbi9iaTU1R3JTdkc3U05Jcm5vYzNT?=
 =?utf-8?B?RVZEN0ZEek85aTBxWm1PSGVxajVwQ1NEQ1NraVovSXB2NkN5VXpSeTJlakZv?=
 =?utf-8?B?OEc2UjNsRzVsb3VMRlBHT25Ib1g0S08zeFdMclYrdXFZQ0JKSE9IbHJNWGc0?=
 =?utf-8?B?bFpqci9zMk5zczRUSWNBalJtUndybTkwMDBaYU9GbVE1OXlOSjc5SE42VHFs?=
 =?utf-8?B?MjNLclFKV1pHRTh6TjRHK1NUbU9NRjNZZ1R2eDd4QVJDa09zdW5VMk9lRXdt?=
 =?utf-8?B?MExTMVBHU0wwN1BjTmg3dXNOSDVpakM5ZjZpT25uQmI3NnhPZldRT3cvWmNI?=
 =?utf-8?B?V2Q2S29SY1o0bUptUXpwejJ6a2xIdGlHUWprNi9nNjJSemtPL3BTWnRJQllK?=
 =?utf-8?B?cEt2OGVGc2hWU0c1cy80Y1VOVVQrUXpqTUNTeS9IZStKMFFaT3FZMjlOdENo?=
 =?utf-8?B?dGt4NzFzOEZuMHdMN2N2QzFFTVNYK1kwK05xbmtDbUN6Y3RuN0d2bTliM21I?=
 =?utf-8?B?VHlPUzhmS0h4c2VQRDZBQmFrYVNpWVBFVHRiS0szeVJ4NEV1SmlzYlMvTk5u?=
 =?utf-8?B?OFEzbW0wYjBuU3pBQVhENGJvSHkrb1U4QXlTRFFJRUhodDZ2YWpidGdJbjM3?=
 =?utf-8?B?bGNkMkRSanNHL3pjYjhFMGNyaUF4QmxWYWxxbVY1blpTNnl6VmZXSW9PQXN4?=
 =?utf-8?B?MDcrSFRlWjVBOURNY2ExeHVOU1pmdS9TVTJsTUlvMWI4elNhMFNjcit5b2VE?=
 =?utf-8?B?ZmNFdFBpNWxnU0o1TDNzOGxqU1Fqamxzc2JlNzFjaVhER0V0RU40Sko2d2Yr?=
 =?utf-8?B?SUtrT3d6QjVUN0tyWlNvTlh4RW8ycWRNaGVaWkFhTE9ScGNDejF1SnBmanN5?=
 =?utf-8?B?STFLUndabTIxUlQ2dVhmR2l5bzZCTUttbTNDZnJxeTJvY2NmVHZFOU5wNSt5?=
 =?utf-8?B?Z3Fad2NBNnJqL2NYZ1Jqb2VqM0NSVm5VTHM4QmZFRVA4RFhhQkVvckFIY0ha?=
 =?utf-8?Q?/ZAGry?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR12MB6526.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(38070700021); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?djFOaFRDanRhNWo4Q3VmL2g4bDlzMkpqM0RscnYxYWFQUHZMSERsS3NNZ3V2?=
 =?utf-8?B?ZWhBM1hUakdhWnQ2Nm5uMmFEYmpmaTR6dVVsbk9wSGJWdHlsUGF3aUQ3eFNB?=
 =?utf-8?B?Vk01anVKVjIwSWlMVWRRUHpqTk0wWGR2L2JQem4zQnpCRW80OHFtUlNZWEti?=
 =?utf-8?B?TW1DMnQ3YzVOY3NmZm1EWGhXZE04OEliaXpGZmN6TEJwWVl1TExhdmJ1VlRC?=
 =?utf-8?B?ZzBiQWlJK2tHdFN2Z2hQMmtLWm9WK2xhWGZyYzNWNTZPdUhqejMxa3kxU0Mx?=
 =?utf-8?B?Q3FTbW5iVm02N0hYdEtnY2trSi9HOEUzeThmSFdZZjErUTRndkRCN3dreGlm?=
 =?utf-8?B?QldDSnNaWVFDVzR1aTN6MzQrc2k3aDg4S3p4Nm0zOTZsZkh0UWlhSlFyL2Ri?=
 =?utf-8?B?Rk5nUUY4U0ZEOU50ZUc3UVFmTG9vNHh6S1hLRnBqZjJsTVF6TjM2ZUZFVXBM?=
 =?utf-8?B?UGgxc2UxWHRDN0JGZTFMWWFZdmpoWkdES1p1NUNZdmxndXhvNUIxdmRLa1Mv?=
 =?utf-8?B?RTU4bmFsNVRRQjYyMG01VlJYWTJEaGVvY2I1eU1oRWp4SjMwWUllSVFYeml1?=
 =?utf-8?B?OHFRS3YrQWZMbmN5SlVzZ2JhTllNSE0wMmJ5c05QL2h2NTVNN0JQVi9lK3FC?=
 =?utf-8?B?STBvdmZsTmx4Uk8yQTc2T0MrbmJuTnk3ZTc1cWk3REpNOWlnWSttTDAzY1d3?=
 =?utf-8?B?TSs0V3ZJN3RXZ1pzejAyS3d6OTFxbmZ0NGJFYlZHbUsxQVJhQklRdlA5Vlhh?=
 =?utf-8?B?cDFudStnRjZpQ1hjaEd1V0o2TkpsOU9LZU5wT0JaQ2pEU2ZhTjh5N2JKdG0x?=
 =?utf-8?B?QVNoMXFqLzVQM3hQb2VXNG9WK203NzRQenU2alpPNHpxYml1NGR0ZWl6QWdy?=
 =?utf-8?B?aHFwWDBEeVBVWUdlcHRzaitKblZkemNyZHZQaTR5L2orZEpNM2o3Und0d2NR?=
 =?utf-8?B?ZlpTUW42ekRjNTBWU2JwR0J1Y3lOYlh4SmQxSUdCV0RhZWF2c3Z6NUtVdVJO?=
 =?utf-8?B?Umx0NGI5UWpqTVZPa2NMZFRCTG9qb0tPU1g2b21oTU5vbDRJZUpVV0o3UTVE?=
 =?utf-8?B?cEYyN1pvb2lKajRObm1wb0FkMWZYOUhyZEw2ellaN21iUXY5VDYwTk5JR0hX?=
 =?utf-8?B?TUEyb0dCNWlKSThlWU5KUHgzYzVHWXRpczhVMUQ1L2R0OXdSSnRJOGd1bmR1?=
 =?utf-8?B?VTQwQlRGMnhYQTF1WkMzRk9uL2tFSnpHUTY4K3NFVWE2RVd4RndoVXNQTXZs?=
 =?utf-8?B?Q24ydzNkN0VLT3k2K1NSVWdmUi8vRUY2ZkVrYjdaSnBBYmJoNmVseUxwdjdw?=
 =?utf-8?B?dHZxQyszZm0yNWhVT2doMlFjbEZ0eTV0c0JDT0JjRnNQUFFxendrcFozMWYv?=
 =?utf-8?B?bHNURklDblVWZU1OdTNmM2lPVW8zMlVkWWtEeW5kajA0N2ZBUGl3c3FvSTZs?=
 =?utf-8?B?Q0NYUWxMZGk3L3Q3eStaRjFYNHZXWjFPeHRoVzBvYjJtbzdBWkd6UGVUNEFK?=
 =?utf-8?B?UFoyVFBhdFM0UUFMdnFuc3o0eGhTamZ3Q1J1Z2lxOUhLa2pGTVVLSGJqU0M1?=
 =?utf-8?B?YTBKWmQ4NUNGb250Vm5OOVBFNmdEeFZjVzlwd2t3ZlVzMHlPT0NiOHNhUmRB?=
 =?utf-8?B?TGw1Z2Z4dWhsS0liN3p1OTB3VHZBbmlsUkZ0dEQ0dW1ibnN6NE9rWUZQb2FC?=
 =?utf-8?B?WDRxeldGUmNQMENaSDJlVlN0THN2Wjd3VHBtVWMvL2l2Y0FUd1kxdkE5UTlV?=
 =?utf-8?B?aFlTNnVSckdqa0xXK3NVYzBRUmJiV1BoaENNdUVLUTBOc1RZbmJmUmtjN2pW?=
 =?utf-8?B?dm11dWxaYWd2QVZKdE5pSk00NXEzNDM0WlhQN3FWY2RSdDFrem95NHJ1R0pi?=
 =?utf-8?B?eTlGRTFHV3BsSitIcnVmY2tDZVdGek1CWTJTRElKWFhGZWVTR1UxUkdSeWhE?=
 =?utf-8?B?bFRaS2FpUXFHZ0lXMWJ3ajRLcHp3VzIralkvT2R1OWwycVF4TFVWVTFObWVD?=
 =?utf-8?B?dDhtNjBOMWN6S0RYaW1IcThiaWxZc2pTbHUrRXBwdGI1aVV5YktVamI5Wm9P?=
 =?utf-8?B?SnJpWWVaQk5YVktwNG1DclQ3ZWd1UW9wcjZuQkJJMFZaM0lpeEMrUVM4NGxp?=
 =?utf-8?Q?STTk4Lnhg8GBVKto+6qyCEC6A?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <1A84229A273848479B4B079D47B4AC60@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY5PR12MB6526.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9118969a-f9eb-4682-e0e4-08de2099329a
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Nov 2025 20:39:08.3696 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 3+qp/n+sG2kiBc+r6fw5uVdwjve5HWEMs/0jfU4DH33mx8siqme9damdLJN9IhzZ9/TH5l54FPpBs/MFCbdJfg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB5786
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

T24gU3VuLCAyMDI1LTExLTA5IGF0IDE2OjE5ICsxMDAwLCBEYXZpZCBBaXJsaWUgd3JvdGU6DQo+
IFNvIHRoaXMgY2F1c2VkIGEgcmVncmVzc2lvbiwgYmVjYXVzZSB0aGUgc3lzbWVtIGZsdXNoIHBh
Z2UgaGFzIHRvIGJlDQo+IGluc2lkZSA0MCBiaXRzLg0KPiANCj4gbG9vayBpbiBvcGVucm06DQo+
IHNyYy9udmlkaWEvc3JjL2tlcm5lbC9ncHUvbWVtX3N5cy9hcmNoL21heHdlbGwva2Vybl9tZW1f
c3lzX2dtMTA3LmM6a21lbXN5c0luaXRGbHVzaFN5c21lbUJ1ZmZlcl9HDQo+IE0xMDcNCj4gDQo+
IFRoZSBwcm9wIGRyaXZlciB0cmllcyB0byB1c2UgR0ZQX0RNQTMyLCB0aGVuIHVzZSA0MCBiaXRz
IGFuZCB0aGUgY29kZQ0KPiBpcyBhbGwgaG9ycmlibGUuIEl0J3MgcHJvYmFibHkgZmluZSBmb3Ig
dXNlIHRvIGp1c3Qgc2V0IHRoZSBkbWFfYml0cw0KPiB0byA0MCBoZXJlIGJlZm9yZSBhbmQgdGhl
biB0aGUgZnVsbCByYW5nZSBhZnRlci4NCg0KQ2FuIHlvdSBwcmludCBvdXQgdGhlIGFjdHVhbCBm
bHVzaCBwYWdlIGFkZHJlc3Mgb24geW91ciBHQjIwMywgYXMgd2VsbCBhcyB0aGUgdmFsdWUgb2Yg
J2JpdHMnPw0KDQpTbyB0aGUgNDAtYml0IGxpbWl0IGlzIGJlY2F1c2UgdGhlIHJlZ2lzdGVyIHVz
ZWQgb24gcHJlLUhvcHBlciBmb3IgdGhlIGFkZHJlc3MgaXMgb25seSAzMiBiaXRzOg0KDQp2b2lk
DQpnZjEwMF9mYl9zeXNtZW1fZmx1c2hfcGFnZV9pbml0KHN0cnVjdCBudmttX2ZiICpmYikNCnsN
CgludmttX3dyMzIoZmItPnN1YmRldi5kZXZpY2UsIDB4MTAwYzEwLCBmYi0+c3lzbWVtLmZsdXNo
X3BhZ2VfYWRkciA+PiA4KTsNCn0NCg0KQnV0IG9uIEJsYWNrd2VsbCwgdGhlIGxpbWl0IGlzIDUy
IGJpdHM6DQoNCnN0YXRpYyB2b2lkDQpnYjIwMl9mYl9zeXNtZW1fZmx1c2hfcGFnZV9pbml0KHN0
cnVjdCBudmttX2ZiICpmYikNCnsNCglzdHJ1Y3QgbnZrbV9kZXZpY2UgKmRldmljZSA9IGZiLT5z
dWJkZXYuZGV2aWNlOw0KCWNvbnN0IHU2NCBhZGRyID0gZmItPnN5c21lbS5mbHVzaF9wYWdlX2Fk
ZHI7DQoNCgludmttX3dyMzIoZGV2aWNlLCBOVl9QRkJfRkJIVUIwX1BDSUVfRkxVU0hfU1lTTUVN
X0FERFJfSEksIHVwcGVyXzMyX2JpdHMoYWRkcikpOw0KCW52a21fd3IzMihkZXZpY2UsIE5WX1BG
Ql9GQkhVQjBfUENJRV9GTFVTSF9TWVNNRU1fQUREUl9MTywgbG93ZXJfMzJfYml0cyhhZGRyKSk7
DQp9DQoNClRoZSBtYXggdmFsdWUgZm9yIE5WX1BGQl9GQkhVQjBfUENJRV9GTFVTSF9TWVNNRU1f
QUREUl9ISSBpcyAyMCBiaXRzOg0KDQojZGVmaW5lIE5WX1BGQl9GQkhVQjBfUENJRV9GTFVTSF9T
WVNNRU1fQUREUl9ISSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgMHgwMDhhMWQ1Yw0K
I2RlZmluZSBOVl9QRkJfRkJIVUIwX1BDSUVfRkxVU0hfU1lTTUVNX0FERFJfSElfQURSICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgIDMxOjANCiNkZWZpbmUgTlZfUEZCX0ZCSFVCMF9Q
Q0lFX0ZMVVNIX1NZU01FTV9BRERSX0hJX0FEUl9JTklUICAgICAgICAgICAgICAgICAgICAgICAw
eDAwMDAwMDAwDQojZGVmaW5lIE5WX1BGQl9GQkhVQjBfUENJRV9GTFVTSF9TWVNNRU1fQUREUl9I
SV9BRFJfTUFTSyAgICAgICAgICAgICAgICAgICAgICAgMHgwMDBmZmZmZg0KDQpmZmZmZiBpcyAy
MCBiaXRzLg0KDQpPcGVuUk0gZXZlbiBzYXlzIHRoYXQgdGhlIGxpbWl0IGlzIDUyIGJpdHM6DQoN
CiAgICAvLyBBc3NlcnQgd2hlbiBTeXNtZW0gRmx1c2ggYnVmZmVyIGhhcyBtb3JlIHRoYW4gNTIt
Yml0IGFkZHJlc3MNCiAgICBOVl9BU1NFUlQoKGFsaWduZWRTeXNtZW1GbHVzaEJ1ZmZlckFkZHJI
aSAmICh+TlZfUEZCX0ZCSFVCMF9QQ0lFX0ZMVVNIX1NZU01FTV9BRERSX0hJX0FEUl9NQVNLKSkN
Cj09IDApOw0KDQpTbyB1bmxlc3MgeW91J3ZlIGdvdCBzb21lIHdhY2t5IElPTU1VIHRoYXQgcHVz
aGVzIERNQSBhZGRyZXNzIHRvIGFib3ZlIDUyIGJpdHMsIEkgZG9uJ3Qgc2VlIHlvdQ0KY291bGQg
aGF2ZSBoaXQgdGhpcyBmYWlsdXJlLiAgDQoNCkknbSBnb2luZyB0byBhZGQgV0FSTl9PTnMgaW4g
Tm91dmVhdSB0byBlbnN1cmUgdGhhdCB0aGVzZSBhZGRyZXNzZXMgYXJlIGluIHJhbmdlLiAgQnV0
IGl0IGFwcGVhcnMNCnRoYXQgb24gSG9wcGVyIGFuZCBsYXRlciwgdGhlIGFkZHJlc3MgcmFuZ2Ug
Zm9yIHRoZSBmbHVzaCBwYWdlIGlzIHRoZSBzYW1lIGFzIHRoZSBkZXZpY2UgaXRzZWxmLCBzbw0K
bXkgcGF0Y2ggc2hvdWxkIG5vdCBoYXZlIGJyb2tlbiBpdC4gIEl0IHNob3VsZCBoYXZlIG9ubHkg
YnJva2VuIHRoaW5ncyBvbiBwcmUtSG9wcGVyLg0KDQo=
