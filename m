Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BAFB9DBB36
	for <lists+nouveau@lfdr.de>; Thu, 28 Nov 2024 17:22:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0064810E474;
	Thu, 28 Nov 2024 16:22:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="DaKgVL9p";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1nam02on2054.outbound.protection.outlook.com [40.107.96.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E231510E474
 for <nouveau@lists.freedesktop.org>; Thu, 28 Nov 2024 16:22:52 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fYkXsvAEK2TKf+/tr9mKNUPSHlyNWU3Bg6UdoWLE6gdSyC03Kmg9ORqDpXsKNcOkaHK3NT+MZCPpBaRWIbGBwpVctG+kyXjXA8MxPVyVWx+g8H+qAloyaALqsdBPmxxQ/d+SRBYM8XZEeEsP6eYqcYZzPTBn7h24CQ6h4f9TeLXuGF0l5HS/GEQhIVtP2SzXbz4WWtDdvaA+kAfOE/x3kd7EbzP3d67IFEVxyhv+3vp+iZHQFA/6FzyubIx8xLt8Fcd38LaY4sc02NSLq5zisMa9v9LmAAa56z6uD3U1ZW9n1R0lSeX9k2vgtl+I+Kkm+cKmVGXaR1Lga+UE2zJjeg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/T8epQ6uXE6/EtAivimzyP54Sj4pDD+rlNa+hwXqz4c=;
 b=GSkAP1s8imXTU4BuFx6npxhgbZ0GlLE0SSpkRSpXsEnVeTxTH+uUuE3VeMdgk363c5Ybtaz+fLdf4zu3rXlV9DgHaO49mDWFhhysWrrsF0ozNcQM2sbnS8kzTm2Z3259GD0vWeDNHPGEdzhitXWN5Wzf2NdpPTESccFylcn3tMZBmR1/E4g13jKzCQ9Zu7nZHBhVDJG6YZW1mI5XMRfO6Duza8RBDQFxai/9iwUQo6saVVxkPw/G/KZfseqviSTUtk0heBrBDh2OZin11+IbeWUVah6LPWWFxsrKB49ZeAq4mbTQtKJbOiuSG1F+V+Xj/+37+wMdgqB7ZUXTbM4z+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/T8epQ6uXE6/EtAivimzyP54Sj4pDD+rlNa+hwXqz4c=;
 b=DaKgVL9pLG3KjupGRZDXjmNCLDavetiqID4t5g35BTU/c1KNYDgjErY8MarJbidCOa8tNFRU7ZxIyUO8JJg07eEy7S+9S02CkU8PlWRB2oN5MNdfXnSKvj7zaiSXkaQXWHlqZiNjqtxL2oPsuiW//p8sVE+u2dvD8EF3+l2W3emR/Ccicxxa4il+QC6gtwUnd+DN6z/DeR6wOhaeRnPMPoKQB+Hk2uK0lchC54QUENOJ+d/TBRYnOBmEhlWaUrNnd2ZP/a9ZQvRHkJCe+xwOXYCTakwFovrxv2deBWDdSPAlwSW1nfTczvvhVus0VK0Vq3jwFmRmjKT0+a4b+dqwsQ==
Received: from CY5PR12MB6526.namprd12.prod.outlook.com (2603:10b6:930:31::20)
 by PH7PR12MB7872.namprd12.prod.outlook.com (2603:10b6:510:27c::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8207.13; Thu, 28 Nov
 2024 16:22:49 +0000
Received: from CY5PR12MB6526.namprd12.prod.outlook.com
 ([fe80::e420:4e37:166:9c56]) by CY5PR12MB6526.namprd12.prod.outlook.com
 ([fe80::e420:4e37:166:9c56%5]) with mapi id 15.20.8207.010; Thu, 28 Nov 2024
 16:22:49 +0000
From: Timur Tabi <ttabi@nvidia.com>
To: "dakr@kernel.org" <dakr@kernel.org>
CC: "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>
Subject: Re: [PATCH] drm/nouveau: create module debugfs root
Thread-Topic: [PATCH] drm/nouveau: create module debugfs root
Thread-Index: AQHbP0YQuwH2BIUSVkK1NZZCrIlp2rLM5PgA
Date: Thu, 28 Nov 2024 16:22:49 +0000
Message-ID: <0a92975de72ee0b3b4a51d5623802b81539cea15.camel@nvidia.com>
References: <20241030202952.694055-2-ttabi@nvidia.com>
 <20241125142639.9126-1-dakr@kernel.org>
In-Reply-To: <20241125142639.9126-1-dakr@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.52.3-0ubuntu1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY5PR12MB6526:EE_|PH7PR12MB7872:EE_
x-ms-office365-filtering-correlation-id: c9977ad0-89dd-420f-e731-08dd0fc8e6a2
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|366016|376014|1800799024|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?WjhDS3l4Z2M4Vnc4ZmxSSitrRUFvZUpzWTJCL2FhSWlIL2hZM1J4bi9lenBC?=
 =?utf-8?B?R1EyOHFLYmpWeTZzMGRJcUxJdXNDSkYxdkR4em9JUG44ZnNJL2JJWC9kWWtP?=
 =?utf-8?B?NTlzM3FHYktQbzlzN0pVenVWdDdCaEw2a3grRFRPYkVYeTViZ2szK01SdG9V?=
 =?utf-8?B?emRVUmoycXBGaFBEaURQeFRnQjVNalI2cTBZY0U4K3psQmFvMmVCOWtiWERp?=
 =?utf-8?B?VjRpTzhESy9PSzk4SmF5ZXE4SDhOdHNoeHJJdEx3UVlpSU1tM3dpTE1xWTFv?=
 =?utf-8?B?ZXovc1J2T1lkSUhUMWZhMnZvRFY5NkN5R0dLeDAzYXpCYk1BQzlpamtsRXBm?=
 =?utf-8?B?ZG4xeERxclVmQ09vZ0FKbnc4YmZ2N0sxOFdqdHBlQ3o0M1I3ek9jYnVFYWY1?=
 =?utf-8?B?OWdLYWtYR083bkp1VUxsQ0NCdVc1ODh6TkIySWMzTS91Wlhwb1U4OHZxSUlE?=
 =?utf-8?B?cEo0N3FjbEZhMmxiVDhKNkZvNFBHNU05Y1JHTERXalZ1TFp0RTQzOXhBVjRN?=
 =?utf-8?B?Tis2cWE1cnU1NGpRNG5QdE5kMy9QdnB0bnF1RWh6NzJjQUw5L2tXblVoelhL?=
 =?utf-8?B?enhWell1cUhId1FOQmk1N2F5QUMvTVFjNlhSTkduV0dKSWR5K1R3QTJzd3N1?=
 =?utf-8?B?UFNoektRSTRkWmVST29VdUdYTTM3c0pUNDhFeXFydUNiTWowelR2eVlkYTUv?=
 =?utf-8?B?aS9CcGU0TEc0UWx4ZlplVHpEdmY1STlRSE5Cb0xUaTBmU0xyMTl3bC9OY29p?=
 =?utf-8?B?dEZseldZS3FCNWlUbnFZck0zWmFKZVlEMVIrTjV2clZ2SUt5TVBzQW5IQzRL?=
 =?utf-8?B?RWhLdEo2a2QraGI3KzRWUGlNWjM0ZzU3MHdVMVJ3ZGZYNlVGZDdJNUNBTlJO?=
 =?utf-8?B?a2RKVmRRcWZvOExOdnViQ1l3ZDIydWNCa0gvMTkrWitCRTJYTjY3U0RMOGJ3?=
 =?utf-8?B?YkhWMFBrc1RpY3REZG9LWlFUeVB1VFBMUVNsSlhOWHZLZHduei9NWW5HNFZM?=
 =?utf-8?B?MHBwU0w2ckdtSnYydHNBcVBFRXk5bEx0aUpnako4c29Jc0k2a2lLdlpLYnNR?=
 =?utf-8?B?ZUkzMkhBRWpqMHV0VDVkcUxBTGNvamg1aUVhSDJIcWxKVlVYWlhweE9YQ0xT?=
 =?utf-8?B?Z2hZeWNJY3ZQTDVQUmFNS3N0SEU4QXlDN0JuSEhvck03WHQ0QlgrYVhvZ0xz?=
 =?utf-8?B?MnZaOXNRdFVPVWVqbWtwU2ZqSC9wTWdIZTczaW5yQjZJOVBhOWV3ZndNTElP?=
 =?utf-8?B?UGlpZXFXR2paU0dJUEJUMmU0bnFUbHE1OWtHVFd5MlBuWkNwaTZTazFxWXdV?=
 =?utf-8?B?ZnAzRkZRd2hXelFxQW1CZEl1cjhTdkVqd3VFU1RnN2JhQjd2bXJoWGRoQTdD?=
 =?utf-8?B?cEZZMkMrS3JXZUlYbXNQdVlESnZBT2djOEM0bmVURlhDY0RoREdkZk52SS9a?=
 =?utf-8?B?K2VVVnZkVktBdXZUNkJlU3k5UnhyVWh4b1lnSSs4TFRZVHd3cFJXQlpsYzUv?=
 =?utf-8?B?OGtPYzFlQ09zbk9oTkM2VldpWENldTRldVdaUG1aTHFhYjRaSzV1T3hhQXlC?=
 =?utf-8?B?VU8wUno3QUxibmZSZzdLcnllVE9WVGZ2eG0yNDZhVDNrZ3FvSVpUaTY5NlpU?=
 =?utf-8?B?MkVrZFNHem5VYlFaNFN3bk5hVzFadjJmNWdYZ3laQ2JENFY1bGdRYmJpVDNM?=
 =?utf-8?B?YnNwalZzaXhDWjJuMTk3VlFwY0VSdW5jR1VVZGNVaVVQa2R6ZHg1M04zVDl0?=
 =?utf-8?B?emwvRk95ZWVpREtsczFLZlFXbnlMLzBnU1c5Ulc5TzFXSzdLYVNwaUFoQVhk?=
 =?utf-8?B?UkdnbmFVYng0dklEdC9wZXZ0ZFdlbDRaQk4za2U5ZmdEUEhIWllWZ0JEUzBk?=
 =?utf-8?B?ZEFSdzBhcks1NlY1cjBJeStYWlZsQjlsMmtTaXdOUmZiOVE9PQ==?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR12MB6526.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?a052c0wwY1JFbm5BQzNrKys5a0FoRjN6MTQwOFVPdGhjMjFyY2s2bmlQREpB?=
 =?utf-8?B?bE1ram9IZHRQWkI4alBEZFB1MVhYOHE3V2RHUC80a2c3VnhLd0JLbzlPdEpJ?=
 =?utf-8?B?TUZsS1FoeStSb2ZGVTVlN3ZzOHVKeXdDemVXT1VTWnJiRHFYVWg4cWxSTStR?=
 =?utf-8?B?TExVNklUN2hKRHdZaXFKeVJKVmtxS1AramFQYVZ0dnY5eFFhVXRPb2pBaTJv?=
 =?utf-8?B?Sm9aY0NQcW8rcE50TUM1bzlTZC9McHFvRTNFWUJwSXpkSFA1QlRwdk9aR3F4?=
 =?utf-8?B?RUdpb0ZOZ2FvTXhmYXB2SW9wZHZxQjZMMkgycnNTNHFYODdQTi9VM3JhWTl5?=
 =?utf-8?B?VlR2Y1BEY2dETk5lMlZKR2hnWXJ1RTZTQjdjV3VKWWxOVHpxSjlNYy9oYWhi?=
 =?utf-8?B?cWRuVzVaNXZMZ3R1NGpuM2o5b1JIMW1jbjN4MDcxMHY2Y0VBY0l1U1JTRC9R?=
 =?utf-8?B?MFBZdFdrb2ZSMlRvV0FNZWhhSVJoTElpVGs0MDRKaUJKSjBFdm9UV0pnTk9v?=
 =?utf-8?B?eFA3Nmp5L0g0MFFPQk9rdFRtMlVleE1hYm9NOHNFUGlYUWZDY0lGZ09iRXlF?=
 =?utf-8?B?eXZhQU1GNnl6NXUwMEszK0k4WFVDU1NVM2ZWOGRCRENyWUdWdnBSM2lZN2dX?=
 =?utf-8?B?cFdlZzdhMDJ1NXNoRUtLQStpYXFFSHhPZm1CZnpSaCsvQituaWRLU0NmTytx?=
 =?utf-8?B?WGRlbFBBYVp5OFozZlBKRUtBUk05UzZCdjVZU0hSMHA2OHFqazZyV01qV3dt?=
 =?utf-8?B?UVpST3FpR0k4Mlg2ZzBQbHVhKy9DOFkwdXJ1MzFJdzZSRGlvVUJoUG81V0lC?=
 =?utf-8?B?RGgvYmROaFJHb21tUE1nbjhNVXhYQVl0enJabVlqK1VtRGRIdFZ2MjZuZTZZ?=
 =?utf-8?B?dE1xQjdpNzB4Z3crZkNvbUNTaW5zNkFSZC8rTmZDbDI1TWlqMUNVcXJiRGFy?=
 =?utf-8?B?SGRjelVuaWhPWTd5czk1bzY0djhubTB0MTBVMkh4S1pjS3lXM2NISE5KamtI?=
 =?utf-8?B?dHdLNUtMTUNtbS9qWkYzSUUzUFhRL1A4bVg3ekh3Wk41T3dBcXQ2eFN4dEZh?=
 =?utf-8?B?MHpZYW0xemYxNEovZTZpNGRNUTdUTjc1Vnd4OUV5SkRxNVNoTFpiUU5BR1Ft?=
 =?utf-8?B?ZXMwOWV3U29Uc0h5SkdubktoZmFrMGswdXBYTENFQkdBL3lrNGh6YWN3S0h3?=
 =?utf-8?B?WHl5K0xTN2REQnlzdXQ5M1ZBYmppVDNDOWs2TFpDSGYwTGVDM0hlNkxBZ2NP?=
 =?utf-8?B?NE5FRzBNQzBDZlBVUlp6VEVwaTczOStoOUdNQkpNVzkwdndLbVRzaTNFT2Fx?=
 =?utf-8?B?VGxnMEZEaWFhcUdXWmRhU3grb3pOM2tIN2dZL2doZ0taK21UZ1hXM1o1Szgw?=
 =?utf-8?B?NmlKTFJjSGxidkRPZ1FyK2ZrRjN5Z0VDUUppT2FYVHhoUmVybDY3VEhPUEV6?=
 =?utf-8?B?MDBWS1p5ak13eGVEcDdjSktBYlJjcG0xRC9CUEhLcmwybVAvVkxqVCtxRnhO?=
 =?utf-8?B?ZlJWQmFtTmtSaFZNc29PLzMxUk5uQ1BzRDRnUnY2TU1XelZOWGUzUmNjamxF?=
 =?utf-8?B?OW53UUN0ZEJMa25ZaUU4MnBDRGZoZ0x6dDhRSEFKTGFzR3QwWUFUQ3BKdmtY?=
 =?utf-8?B?c29HdWt2SUo0NnR5aE44czMxSkszT0ttUjYxNm8wUDgwZFQvbDdlQlp3eEFu?=
 =?utf-8?B?YUc0SlNVSEl4U2RmenJyWTVVOUU3YWxpQ3FGTVpnOTVteUNEMTUzdW9ZSlpj?=
 =?utf-8?B?TWYrTjgxTXJSQXV0WmU3SmsrMFRFYVlLODh5bTZaSGFNOG8ycTZGSW1QNU9a?=
 =?utf-8?B?U3FMV29qZy82RzNuMFE4dWFQZkwwN0NBUDdaekhrTzVRSHJMZzZWRVlUKzhI?=
 =?utf-8?B?V09VckNMaW13RldRekVES1dUZ3JmenkzVHlGenhkaExKbzBVaW1oSW8vMmlC?=
 =?utf-8?B?MWJoMnhab1hWaUpGM2hVRmFsVDNGbFM5ekFzcXRyeXVRNTdHTTRBeStpQjE3?=
 =?utf-8?B?T3VRSDBmR0pUcm0yZ3U3aXk5QkYvWlAwWVhaKzBMVVpWK0ZTR1AyV25iM3pr?=
 =?utf-8?B?Qml0QlFnVjJwSzJMMkYxeXV5aE9wWldKbk9ic0RWUTV3cncrMFNxUWpkQjFs?=
 =?utf-8?Q?P5iPkG1SFpoZawD079GgAL+PT?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <09E0CC270A27A2499AF5392396B985D0@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY5PR12MB6526.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c9977ad0-89dd-420f-e731-08dd0fc8e6a2
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Nov 2024 16:22:49.3609 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: XK5et/ays3HU3X4kGbqObBl7xffZoCT1GfRzNyYngAijl7QWXgKspiODrtefBGdrHWLmLrIwsRoOPUCTI2F3pw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7872
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

T24gTW9uLCAyMDI0LTExLTI1IGF0IDE1OjI1ICswMTAwLCBEYW5pbG8gS3J1bW1yaWNoIHdyb3Rl
Og0KPiBUeXBpY2FsbHkgRFJNIGRyaXZlcnMgdXNlIHRoZSBEUk0gZGVidWdmcyByb290IGVudHJ5
LiBIb3dldmVyLCBzaW5jZQ0KPiBOb3V2ZWF1IGlzIGhlYWRpbmcgdG93YXJkcyBhIHNwbGl0IGlu
dG8gYSBjb3JlIGFuZCBhIERSTSBkcml2ZXIsIGNyZWF0ZQ0KPiBhIG1vZHVsZSBzcGVjaWZpYyBk
ZWJ1Z2ZzIHJvb3QgZGlyZWN0b3J5Lg0KPiANCj4gU3Vic2VxdWVudCBwYXRjaGVzIG1ha2UgdXNl
IG9mIHRoaXMgbmV3IGRlYnVnZnMgcm9vdCBpbiBvcmRlciB0byBzdG9yZQ0KPiBHU1AtUk0gbG9n
IGJ1ZmZlcmVzIChvcHRpb25hbGx5IGJleW9uZCBhIGRldmljZSBkcml2ZXIgYmluZGluZykuDQo+
IA0KPiBTaWduZWQtb2ZmLWJ5OiBEYW5pbG8gS3J1bW1yaWNoIDxkYWtyQGtlcm5lbC5vcmc+DQoN
CkFja2VkLWJ5OiBUaW11ciBUYWJpIDx0dGFiaUBudmlkaWEuY29tPg0KDQo=
