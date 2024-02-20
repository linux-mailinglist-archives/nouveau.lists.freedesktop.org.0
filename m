Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D98085CA4C
	for <lists+nouveau@lfdr.de>; Tue, 20 Feb 2024 23:02:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7FD4110E4CF;
	Tue, 20 Feb 2024 22:02:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="Mdg1xlyS";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam04on2052.outbound.protection.outlook.com [40.107.101.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B378B10E4CF
 for <nouveau@lists.freedesktop.org>; Tue, 20 Feb 2024 22:02:28 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WE+YB1k84Uqnhpsq/1niqsPD7h77fZc5gH3IYcKblS4jq5S1FcbGmXedDpJz3FzWBdJsuk1eec4wekc6T3owH82T1YB9Z/tSooEgn3u49d0rSpl8WQlwF+y3H/4/NMmJAHgMrB47uZPZauvD6GeTg+JJy93S/S1q9rNYmmGtmwIE+mRjFmop0/oIJb6695w3+hLE+VZfZ4jOq9GjBJYpTGzILN25VPR8e+9CSctEuJbqNi5yRBnlWFCxMzNdfZjrqAtu60gi5yQaoqFjGwdv4sXzzXeNcrgUchRD7HP04fuG8qxyd0j4X17DP9nRJfSrlp6LFCvnbtIv6KGj1FSQyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8xXunFE0u59iQjb0UUn8zURkNwQsj6hQ0mOsbbQOBE8=;
 b=bifeXxD40nMXW9TJUjp1OWBIJcO70bygws79kcIJiqb1n2ophb6t6tl0szZJ0lQw6ViItB2Sb2pfff3leqdHEGN5K/qu+VJLNvP4l0iVPHJGH0tutNHaA/mTSp1NJ0t71wmetRt1qG9JhzA73HakAezgeYtPLEtGquwoWerE8qYsMrqgdE4+VnfqnikF5GZYHvWGxeikMVntK7qWpJq4mS3CIwG/A0da5k4z1WMWbE2SiCE1W/LzJjTxTLRjCnbyIm6dWbm63dawGzRI4tVNjGgE4noyCEjZt/svwgzV8sDSeTIy2arqt6lm7A2I4vO2YU+VgLyzhdbN4+h4kfGrPA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8xXunFE0u59iQjb0UUn8zURkNwQsj6hQ0mOsbbQOBE8=;
 b=Mdg1xlySzImlc0+62lz+bCpRlpBid0FZa0bUIxkIXNuUpobdSAuFwRTPyqpOCx3Ye/VUarqTyT2g3AEBnRNS4ElmTu1tjJ6D+mC66gQdVfAU82Mv2QDlV1r9xFjmKnLDlzCQC5Y/sW39BNUyevTVdr8Yt40xBXAyAY4F4XDM5gjLwQHtsNXOsIXbgTCX6GGYCojxmO+MRXESdFnCEs6LELKSEs7gypql2sUEdfkdmykrh3Tr/UOAmD4wmA1bgALF2N3DscZeJRV0yMYEwvPdzzSHIDJCegI3nBiJgsA1ZN/jF+UTansR41fV3p7kYr1fTetpmti9TvJna0P+N/5EHQ==
Received: from SN7PR12MB8769.namprd12.prod.outlook.com (2603:10b6:806:34b::12)
 by CH3PR12MB7617.namprd12.prod.outlook.com (2603:10b6:610:140::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7316.19; Tue, 20 Feb
 2024 22:02:26 +0000
Received: from SN7PR12MB8769.namprd12.prod.outlook.com
 ([fe80::a969:afd:ee0a:796b]) by SN7PR12MB8769.namprd12.prod.outlook.com
 ([fe80::a969:afd:ee0a:796b%7]) with mapi id 15.20.7316.018; Tue, 20 Feb 2024
 22:02:25 +0000
From: Timur Tabi <ttabi@nvidia.com>
To: "airlied@redhat.com" <airlied@redhat.com>, "nouveau@lists.freedesktop.org"
 <nouveau@lists.freedesktop.org>, "lyude@redhat.com" <lyude@redhat.com>,
 "dakr@redhat.com" <dakr@redhat.com>
Subject: Re: [PATCH] [v4] nouveau: add command-line GSP-RM registry support
Thread-Topic: [PATCH] [v4] nouveau: add command-line GSP-RM registry support
Thread-Index: AQHaZEfwiyKT6Zji2U+l3xBb7o9yurETyGmA
Date: Tue, 20 Feb 2024 22:02:25 +0000
Message-ID: <e4c1b28742ce18c220332b2621e8a50f7dbd4102.camel@nvidia.com>
References: <20240220215805.3201094-1-ttabi@nvidia.com>
In-Reply-To: <20240220215805.3201094-1-ttabi@nvidia.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.44.4-0ubuntu2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SN7PR12MB8769:EE_|CH3PR12MB7617:EE_
x-ms-office365-filtering-correlation-id: a70e25c5-3b91-489a-f3c4-08dc325f9f81
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 4FhXT3QViB+WyucDDvg51tCfripYH+GROK3Hex3rM0WB5aWqY1buCjP5U1h8XC3I9sJ8mgBqGfl49dNNfG/AF6bkgf65ri4iR2zkKDCyGm7ohf/73ezRwgS/uhS4Nz9BN1S2K9uhTInY/Q/fpLsFrR13+extIioQqWv9G6cas168L9H4VVKtj/Ed5Qevaw6BE4L9+o15WHlR5czoQTrPur4Ev63mP4iXf5vKc2pCDDgkjMe+JCZxorsbOKdPOkBTVkzjAnnhp+QYouXpMbr51Wp5y5zaiFw1ecd988bxqDPPCdHssr3/4IuZgXRN5TgZ2DoaqUEvY9+vdxLGY33ot7duEe/fTx8+1aKXtIzXH1uJwTQt3xW8R+Ju0IjFg362tCiJF5hhAMuSVvx600EHe2rzU4Fgb+WjmQxo1ki0wHTwNjPXVVSgMThzrtZ4NzirB/G4VttmgW7iC7enVYcg6RCqNRJGHPjZXCrtsMe06Uf3Y+NglHQQDPKprzjltqDH04x6w6CXJF1J/MwwPRtL/KuDILc6UDlvTKChdFMOlTXDuXbowOd5moTB/EdchAqOyY3Jr83SPLmX50Mhld6RPbANlOU0ZIStUyF2Iq4LBzTcyfvaG162gu1rFaAFPQx3
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR12MB8769.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(38070700009); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?VDdhRzJEa2xwZ3NMZmVZRkhpelBEVEVEL0oxL1pEVFd1d1Z1bVNncElsVnNr?=
 =?utf-8?B?dUdlbGtVMXhNa05VTU5VVURjSmRRUytxejlSOFNLRStLc2d5RnJTbzZtOXFL?=
 =?utf-8?B?a3VzcE1wVDhJWXl3b0JpNWhKTmkzSjZ3cm5CK2ZZSHJoWXFXNm9TcWR3OXhC?=
 =?utf-8?B?WWkrMjJCdDJOaGZ0aE9zRDRhd0FBeFlhNkpHcURjWE15RUpLVFFkRFhrSS8y?=
 =?utf-8?B?VUgzcXp3RzNmdk1aTDIzY0ZrMmhLalM2YmtzODlmd1RJT2NJNVk2V3ZQV0gz?=
 =?utf-8?B?b2dpZVNxUVN3TzU5WmRwZW9PcFdCNG1VbWlsaExxZjE2Z1NwdFZiNzFEQ1FH?=
 =?utf-8?B?VDByRzZEdzgvcDE0a2hVQ0RpaGN2SER1SmhtM0hJK0tnMWtjSlkwbmJmTTNr?=
 =?utf-8?B?Tmpzd2V1NzJvei9BdE9qVVg2QUsyb1Z3aFk3VW5nSzVmaGFYMkRON05UTXdz?=
 =?utf-8?B?aVg5Z0R0Uy9wc3JZSHh1Y0dwZEl2cnl2Q2gzQVgwYmwyMHFSRFpobEF0UmZ1?=
 =?utf-8?B?ck1TUGFBck5jdTZZempBWEJmTWdrYVg0V1JKSWZnMCtkempXUGRleFFHdzBs?=
 =?utf-8?B?NVN1QVFHcTYrVUlYZjl4Z294WENKdEptcUJVbWp6eUQ4VzNKU0RpVm0xbUJ0?=
 =?utf-8?B?WkJSalF5dWxvV0dtVnFpRTRjYUtVaTNGSFkzNmxVVlNaYlluN09tcTVCNlhr?=
 =?utf-8?B?ZGkxUXdqM3BSdXJ4WWpnVkdXRTFHQitJZEgxUUdVNVpJd2V6RWg5eFhkL2Vk?=
 =?utf-8?B?dVNNYVU3elVkcWpMeDhicVc4TVFiYVVLTnZsb2wzYi9DOEp3b2owMW83cUVS?=
 =?utf-8?B?UDJiLzdwbGdPQzA2ZSt3amZLa2N3V0xIOFdXcTNsN01Wamk5Z2wxeGVSbnc3?=
 =?utf-8?B?NERHZGxhaFc5azFVL2RMR2k4MGxuSW5jMks3eU5nOG1WdUxNMDlYOHZuWW1T?=
 =?utf-8?B?bWxENGR5eUszVUd5VzVpMGo5VGxNei9BSzU2eFlUWXp1amJ0d3pHelhJd1Iw?=
 =?utf-8?B?UGVtUzBUT0pnWmJzUVFGeTA5WmkzVkNkS0pWaThXaDdtejluZnkxSTdmbnNa?=
 =?utf-8?B?cDhPYTg1SXdZclZSbGcySzJqWWtGY3dpMFRBbWIxS3l6YTVVWkNUVVg3bDBs?=
 =?utf-8?B?RDRFaVBBWW5TdnlUaWZ1b1QyVmVIa3FNTGluWmRIdFdZM1JtZFEwcWE2SEdz?=
 =?utf-8?B?VG9wNHpUcU9PRnhuUVExeEFqS2JjazJLaFk2ODMxMWZyd3RibFRjZG9EeG5M?=
 =?utf-8?B?a2Q3US9rMklFZlo4ZjdJYXQ4d0hFbVNXMkpPSTZnN29yWkg0K1k0TExKSktJ?=
 =?utf-8?B?TDkzMmpGK3JydkdiTUV3RDdDekdjMG1rd0JOS3RCU01VWXoyQWUwRk5ZaGxy?=
 =?utf-8?B?ajN6enRJZjlIOWFpQ3VyVmJuOW9KS0RrQWFYTUZuSE11SlB1NmZ0emhuN3VE?=
 =?utf-8?B?amJ6bHNHOXdNZU5HVnRYM3Y1d3JSU05Xa3p3OGdGUDFJaCtJWk9NTVAwZlNr?=
 =?utf-8?B?c3p4SXJhMVcwMTQzeGxUcEdvZ2Mxc1JKd1RmZFQ1cnBWVnBYM2V3bWViK3ZK?=
 =?utf-8?B?ZnhEQWJXNXl6MTk5dUR3SXBpdW0vR1BueWkzL2tMam5wYzlMRWNoSlEyY3g1?=
 =?utf-8?B?Vkk2U0o4SjE3NkpFemh1QXZ0TjBWRTVoUXg5QXFxUHpoMCt3YzZ5a05sVVNT?=
 =?utf-8?B?dy9rMmp0RWYxR29CODFjM0xiejBRcDNBaWJ6eTVwZ1M3ZldPZGl1Zkt2blkz?=
 =?utf-8?B?MmVZZDllWExoT2xmMHdLUmxvUWpycEM5YWhxcFZKV1dCOEJNSG1qTi9NZ2dp?=
 =?utf-8?B?aTNsSHd4NzR6N1NaKzVuWFk3c1BqQUlUQzFsSzQ1RlZzNEk2WitGd1dqOHhY?=
 =?utf-8?B?b1QyanptODVHaEpWL2JNT2tIT29YeXNkUnpyWFF4SmVZdE5CUGd4RjdYbC9h?=
 =?utf-8?B?RktDTzkydlYvZWcwWTNhNy91WjFwcnlqdHB1UTNIa25DZXNkYWkzZHZOdUxS?=
 =?utf-8?B?eW54Yjh2alRHNXppcm13cjRhQ1ZTU1hjQktuai81SkFkaHMzcWo2QmgxS21v?=
 =?utf-8?B?UjJ6K3dtZ3BmRURJaDVvTXlNZjBWRnk4MlNzT2tpWXhtTlFKWDhMYnJGN2FV?=
 =?utf-8?Q?v0WmodhsNeQ4oqoPSX7kuGby8?=
Content-Type: multipart/alternative;
 boundary="_000_e4c1b28742ce18c220332b2621e8a50f7dbd4102camelnvidiacom_"
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN7PR12MB8769.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a70e25c5-3b91-489a-f3c4-08dc325f9f81
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Feb 2024 22:02:25.8731 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Hggi6fqxAqVnoD36lDcBZFnywIOs2dSiqSS7Xv1jAU1P9vQOb59d8uBhHV9Hq7WLsl4jdPVllKMN26k/1LAUTQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB7617
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

--_000_e4c1b28742ce18c220332b2621e8a50f7dbd4102camelnvidiacom_
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

T24gVHVlLCAyMDI0LTAyLTIwIGF0IDE1OjU4IC0wNjAwLCBUaW11ciBUYWJpIHdyb3RlOg0KDQor
c3RhdGljIGludCBhZGRfcmVnaXN0cnkoc3RydWN0IG52a21fZ3NwICpnc3AsIGNvbnN0IGNoYXIg
KmtleSwNCg0KKyAgICAgICAgICAgICAgICAgICAgICAgZW51bSByZWdpc3RyeV90eXBlIHR5cGUs
IGNvbnN0IHZvaWQgKmRhdGEsIHNpemVfdCBsZW5ndGgpDQoNCit7DQoNCisgICAgICAgc3RydWN0
IHJlZ2lzdHJ5X2xpc3RfZW50cnkgKnJlZzsNCg0KKyAgICAgICBzaXplX3QgbmxlbiA9IHN0cmxl
bihrZXkpICsgMTsNCg0KKyAgICAgICBzaXplX3QgdmxlbjsgLyogdmFsdWUgbGVuZ3RoLCBub24t
emVybyBpZiBiaW5hcnkgb3Igc3RyaW5nICovDQoNCisNCg0KKyAgICAgICAvKiBTZXQgYW4gYXJi
aXRyYXJ5IGxpbWl0IHRvIGF2b2lkIHByb2JsZW1zIHdpdGggYnJva2VuIGNvbW1hbmQgbGluZXMg
Ki8NCg0KKyAgICAgICBpZiAobmxlbiA+IDY0KQ0KDQorICAgICAgICAgICAgICAgcmV0dXJuIC1F
RkJJRzsNCg0KT29wcywgSSBmb3Jnb3QgdG8gY2hhbmdlIHRoaXMgdG8gLUVJTlZBTC4NCg==

--_000_e4c1b28742ce18c220332b2621e8a50f7dbd4102camelnvidiacom_
Content-Type: text/html; charset="utf-8"
Content-ID: <8B7A43843338964F8BB914D003C64524@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64

PGh0bWw+DQo8aGVhZD4NCjxtZXRhIGh0dHAtZXF1aXY9IkNvbnRlbnQtVHlwZSIgY29udGVudD0i
dGV4dC9odG1sOyBjaGFyc2V0PXV0Zi04Ij4NCjwvaGVhZD4NCjxib2R5Pg0KPGRpdj5PbiBUdWUs
IDIwMjQtMDItMjAgYXQgMTU6NTggLTA2MDAsIFRpbXVyIFRhYmkgd3JvdGU6PC9kaXY+DQo8Ymxv
Y2txdW90ZSB0eXBlPSJjaXRlIiBzdHlsZT0ibWFyZ2luOjAgMCAwIC44ZXg7IGJvcmRlci1sZWZ0
OjJweCAjNzI5ZmNmIHNvbGlkO3BhZGRpbmctbGVmdDoxZXgiPg0KPHByZT4rc3RhdGljIGludCBh
ZGRfcmVnaXN0cnkoc3RydWN0IG52a21fZ3NwICpnc3AsIGNvbnN0IGNoYXIgKmtleSw8L3ByZT4N
CjxwcmU+KwkJCWVudW0gcmVnaXN0cnlfdHlwZSB0eXBlLCBjb25zdCB2b2lkICpkYXRhLCBzaXpl
X3QgbGVuZ3RoKTwvcHJlPg0KPHByZT4rezwvcHJlPg0KPHByZT4rCXN0cnVjdCByZWdpc3RyeV9s
aXN0X2VudHJ5ICpyZWc7PC9wcmU+DQo8cHJlPisJc2l6ZV90IG5sZW4gPSBzdHJsZW4oa2V5KSAr
IDE7PC9wcmU+DQo8cHJlPisJc2l6ZV90IHZsZW47IC8qIHZhbHVlIGxlbmd0aCwgbm9uLXplcm8g
aWYgYmluYXJ5IG9yIHN0cmluZyAqLzwvcHJlPg0KPHByZT4rPC9wcmU+DQo8cHJlPisJLyogU2V0
IGFuIGFyYml0cmFyeSBsaW1pdCB0byBhdm9pZCBwcm9ibGVtcyB3aXRoIGJyb2tlbiBjb21tYW5k
IGxpbmVzICovPC9wcmU+DQo8cHJlPisJaWYgKG5sZW4gJmd0OyA2NCk8L3ByZT4NCjxwcmU+KwkJ
cmV0dXJuIC1FRkJJRzs8L3ByZT4NCjwvYmxvY2txdW90ZT4NCjxkaXY+PGJyPg0KPC9kaXY+DQo8
ZGl2Pk9vcHMsIEkgZm9yZ290IHRvIGNoYW5nZSB0aGlzIHRvIC1FSU5WQUwuPC9kaXY+DQo8ZGl2
PjxzcGFuPjwvc3Bhbj48L2Rpdj4NCjwvYm9keT4NCjwvaHRtbD4NCg==

--_000_e4c1b28742ce18c220332b2621e8a50f7dbd4102camelnvidiacom_--
