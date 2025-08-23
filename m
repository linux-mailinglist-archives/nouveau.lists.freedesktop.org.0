Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A078AB32C4C
	for <lists+nouveau@lfdr.de>; Sun, 24 Aug 2025 00:20:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7183610E06E;
	Sat, 23 Aug 2025 22:20:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="aDpuFcnr";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam04on2053.outbound.protection.outlook.com [40.107.102.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C9CED10E06E
 for <nouveau@lists.freedesktop.org>; Sat, 23 Aug 2025 22:20:49 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VPBI20Ab4ARE5ZN+4awTzOxJUU6mGva+67WaHeRC4IOlJSfzAhGOZEPjFTdFfmqFzMCS1xla/BakZJm9hpUWsIejqEIv3ltfKWGYuz4k8wJ1ZgzV4o50d4jT6Oh+Ryf3OXUKpXkn2KeCEzhR14FY8R16SN0/fH/sMz7K+I5eBSER8KO2Dsy0w072gvz88MWBEgz56W2uGC7qL7noQhZdcV9iBk99Vpy4gTzPmNtQgzCI7Y9jSpYq5ABrHQAKYlV5xW8POlO32/1iuRJodRB9cV5rVGXhDDGa1Jfe95PNBZBnsPiZMmBozEhUbxcSSUtgu+p1G65BSZATK78f4LY4/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7NEDjWgJwWM1IUEGiiry7Nmz+iBsssEfZu9m6Rh/Ooc=;
 b=edLkmnl2xDy9WNv0C4vbHOmCO4r/jfzqBlIo//2X8/MX3/scY6S6P68JfFLy0FC+Ym2f5aeYIs8UfaEE8crBninva098tuW9MeHcF5cLo/dn6igIfbIRhUUkQi4Uh5hhZ4LB8DKHpi6eYFfZGu7U/ETRcVN/Bl1jvKvoE7NEP7g0QFp6v/uPLg5Lwv1mkiRp2Sy1/FEmyo4GjgS4IBljV1/VpIyd+tQdC5AzYiDJ0Iq8+DyQvPlkebCbutN+YqUVon3CILWY7Z4T4k9g3wWXrLa7GN6o3DVwDoJQzUdqEuYvM8XsR4alwegBcTruB6NQBWekcsoLVxHSlTOC3qPHAA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7NEDjWgJwWM1IUEGiiry7Nmz+iBsssEfZu9m6Rh/Ooc=;
 b=aDpuFcnrXbEOWezoXeOvsTDDuCyETeTsee15iSPgEuBSUGn5THDfT0t90qgoCmlf0bbQXNtf90ljBOnPb9/YNnRvwfFkTstWqm+WnttJns3hZwQSIAmn9xbdAduXoZhf9SsdnLIdlgQsX4CPM6rfuk72S9eH1QU2Ce2ek65W5izaaP27Nb6DsKfQBDlASRpU6VqqjJyMlsb4QYhkTkYJiHPJ3/lzey1yGKAj7IBVR3VBPoKXtXiBmcuaeEUFjI4XKd/cOVuINP3RjDgRutwaBJImME1YdIOgGYKytYqk8zNc7xUWFaE+ZTPwu8lyNQthAvzth58pwwng/0dy0dEvbw==
Received: from CY5PR12MB6526.namprd12.prod.outlook.com (2603:10b6:930:31::20)
 by IA1PR12MB6019.namprd12.prod.outlook.com (2603:10b6:208:3d5::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.20; Sat, 23 Aug
 2025 22:20:45 +0000
Received: from CY5PR12MB6526.namprd12.prod.outlook.com
 ([fe80::e420:4e37:166:9c56]) by CY5PR12MB6526.namprd12.prod.outlook.com
 ([fe80::e420:4e37:166:9c56%6]) with mapi id 15.20.9052.019; Sat, 23 Aug 2025
 22:20:45 +0000
From: Timur Tabi <ttabi@nvidia.com>
To: "dakr@kernel.org" <dakr@kernel.org>
CC: "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>,
 "lyude@redhat.com" <lyude@redhat.com>
Subject: Re: [PATCH 0/3] Various minor fixes to Nouveau
Thread-Topic: [PATCH 0/3] Various minor fixes to Nouveau
Thread-Index: AQHcBXWvN84eh3o0skeAk95R4pX3YrRaNm+AgBa2+wA=
Date: Sat, 23 Aug 2025 22:20:45 +0000
Message-ID: <fa4197b1ce1cbf7f0b48f9ade901935709e18361.camel@nvidia.com>
References: <20250804192601.10861-1-ttabi@nvidia.com>
 <05ba6c52-a503-474e-919b-d9621c7b3198@kernel.org>
In-Reply-To: <05ba6c52-a503-474e-919b-d9621c7b3198@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.56.0-1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY5PR12MB6526:EE_|IA1PR12MB6019:EE_
x-ms-office365-filtering-correlation-id: 1ad2b2b1-cf4a-445a-73b2-08dde2934e44
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?NUJRem5GaGszOUxqaUlJcTJGM053U1BuVVN5YmtpSk5wTUtCdlhmeGU4V0Vl?=
 =?utf-8?B?d1MrUVp6NUxIbUtkalpNYTl3enduc1JVR01YL1ZyZGhmVjJ4UmRtdUg5TlFD?=
 =?utf-8?B?WHdESUxmeWw3bWlXY1ZpQW9tcDM3VFhleVVUZlpnc1NvVmdOdklxeGUrYXhH?=
 =?utf-8?B?TVNkVVIydnJkRWtDWUZrdXEzckRFVmZ4NVF4b1B0aEVtUDZEWlVKNzdXTlJE?=
 =?utf-8?B?THRqclU1WEFGVFdNVGpONW5hRTY4cGdGdW5IM29XSTNMc3pMOERTZ0IvOFZS?=
 =?utf-8?B?L3NzYmtCOTdXeVBOaklDRkwza2hwdkpGamVBNWwyNzQyc292ZmZKZm1naDBl?=
 =?utf-8?B?aHJWTHJLVVRRTHEvYVFBVEdtd0RhSVRtenRUQXluWEJFTnVqcWgxY2U3ZFg0?=
 =?utf-8?B?Und4bkEybUg3TnVkUWVCVHFOMVBkUjh6QmorZFZ5OUlJZlFaUHFqbkxxMmVz?=
 =?utf-8?B?QWVHam9sYzJweUJIYWJiU3U3RVBlTUhtOGt6dFFhYnVIbDBHY0hPN2sxeE1h?=
 =?utf-8?B?WUpSL2VNZFBvRFZTc1RJSjlaSnVTeittZmtjVTJSOFlXRkZQa3FZUVdtWm1Z?=
 =?utf-8?B?MXV3MzI4ZTBCaU5EMlJsZXQ5Ky9kazgvY0c2VVY0WU1jRG5FT1VwOElBeEFX?=
 =?utf-8?B?aVo2S1I4TExYU1I0UDlaMUJRNHMwbzU3WitmdTUwUjFaQ2t6MW5oWXhNTWgw?=
 =?utf-8?B?R1gvU1gvQ3UzNkVqeVl3MktXOUFndmlSa252VFFTanZPbFU0U1pWSklLVWRh?=
 =?utf-8?B?Z2xxZTEwTzI4VXRGWk1tdkdhVDRERUZrb0JXNWdVMHlzWmFNaE93RzJZclkz?=
 =?utf-8?B?SklzL2E2RTBsUkw5bk54bzd0bFRkNElmR0VZK2htbGVWT1JwclZnSFNUdksy?=
 =?utf-8?B?ZndGTU1BaFZxaHFwM3ZqMG9POXNDQzFJRVhXQnhlQ2RwTURXZjdkY2NRUUxa?=
 =?utf-8?B?UEF0c0FwYld1UFRyUGZlTDJpU0lHWkZoODV0ZWo0SnFPeWR2anBkM1dGVzZ0?=
 =?utf-8?B?dVp5Y3dDaGg1R24rd3V1N1ZGMmV2NXBIM1JBTUVQbGZHYkRtZkIvUzB3VEtJ?=
 =?utf-8?B?UWsyNFpSWU9ieHdIWHl4OUNQUFRDeXR0MXdxMXFzcUoxMnZUNnpDME5uUUdj?=
 =?utf-8?B?N2tpN2dTUHAwVGN4TkRsdTFBUHZuemtPdmh3eXpxMlJkMFNIT0p0b3dLODdL?=
 =?utf-8?B?Wm45dlBDMzlqNWxtY3gzSjBHd3VEYjlJTEh3WHJpSjFEWHpWd1EyUCs4M1N5?=
 =?utf-8?B?YTVsUm9NbUhXVDNNR1RtOGpoMzlXZDNrL1FhU2pNSlpyWlFleThhWVFybmxI?=
 =?utf-8?B?WlJqUjkrbXEzYWVFcUFXeWZEMHV1UThKdTVIUk9EcHowRTRoN3BNQzM1MmFr?=
 =?utf-8?B?MHFtajN1M25KZC9sK1g5ZDlwWEw2VEN0bEQybEFIWTZpbUxOYmJsVVlEbjAz?=
 =?utf-8?B?Mmpwa1k5bXBpZ2RJaW8wL1dNbGlIdnRicUp1Yyt2NmNKNXZwRVpaWGhkSFI2?=
 =?utf-8?B?TkxWNnBCTS9HZHFsQzZ2RWJ3THNWRVRXMFN4Z2tNWVQ4MkpIQ0ExbnN4UDJy?=
 =?utf-8?B?RGhQY3B1YWdIaFh1cVhUdFh4TFhmbko0STVLbWdoWUgvZHdNZkNodno2ZUFV?=
 =?utf-8?B?d0NpWWxwS1diaEhmTXA0VktoYmNwY0Y5Qmx0d1hmM2x0azgvT0ZoN3pTSDVq?=
 =?utf-8?B?YlpERG1TTDRrYSt6UnN1QU9ZN2ZUbkp5bUpQdXlVMlRjZWpnZUYySE16bG9q?=
 =?utf-8?B?M3ZFQy9xemIxU00raEorQkJlTVlNS25PRFp4MjdvUmFaRDB4ZXlJd1FqNG16?=
 =?utf-8?B?aWVuamYwQkphWVI3bmd5SkJHOE1sNlBmeENZME93QUxJZXdNYjk5ZVdHdlQ2?=
 =?utf-8?B?T3k1RDJFc3FodUtNZzk4d0pZa3pIcmg4NDJXRWljWGx2UXdVYXUyL2dRWVVV?=
 =?utf-8?B?aG5HekdVNGx6RFdEMnpUWDVWYndMVjd6NVplQWZvdHEwZWsxQmlKWnFEemw3?=
 =?utf-8?B?aHloeTZZVDdnPT0=?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR12MB6526.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?VFM1QXV6Qm4rVkNNYndnRi9yRDN0b3JPbDR1eVdYNDM4czZybWtrS05hMkpN?=
 =?utf-8?B?d1VSY3pNbkFXZ01PYmJodkJkK3pMenFXcUQvb1RiamZzY0N1UWhUZ2tSUVAy?=
 =?utf-8?B?MFU3RW1tbWRFU2Vxd2RhazNOak94M0svcVVTSDVZMktLMzJMMVU3SzBudEpn?=
 =?utf-8?B?Tm8raGxXL2hnNHZDREpzc1NKWnRiMFNqTnRLZGNiODhEWXc3NHVSNUNRWkpD?=
 =?utf-8?B?c0ZlWHg3MlBKU1NTUWc4czVjYkVqTHNsR1RjYWoxSmIvanQxdUR3U0kzTnRN?=
 =?utf-8?B?elN0NVN3S0dnWllNd2RqckhVS0dvaDBrUmkvcHFwSlJveGdVcDdVNWh5SzhR?=
 =?utf-8?B?aWRObU9yYzFJejRETjVER3JNdHd6L2J4WnplYUpCSE1oSGNIMEord1RLQlBx?=
 =?utf-8?B?S1ptQVhrYjh5MmFsM3h5clNCTjFSdzUzSVc1NTVmemtlV1U0ZFNaMHRDRFdL?=
 =?utf-8?B?WDk3NURDZWt2WFRsaHE1d25CQzMwZzc1S1Z6Y3hHYVlETkI4RjVQY0VGY09P?=
 =?utf-8?B?eUZXUWt1TkF4K0dScnpDT3N3M0lWWTBuaEZDb0xPL3VQek44YzgxdUIxRnA3?=
 =?utf-8?B?cVdwNzhmOHlPK3JUdUFwdG96NHo0VHNTMFNSdi95dks4bUV6VXV4RkR6TGpS?=
 =?utf-8?B?N1Y3cUtaajRxRlJSRzk4M2pDUTN5MGZ3L3hrTFBMZ0FVOVI3Q1pwZ0lrbTlX?=
 =?utf-8?B?OWEwRFFKeVM3RW1EVThIRWdIVHdRSDFCUmkwck9PRVh1OE85ZTdSUW15czN1?=
 =?utf-8?B?bUttQ2s0MTN3ZWJFVkJQa1VicG5yNXJ2ZTBiTzl4K0tJbFR5alp2SHZRQU5n?=
 =?utf-8?B?YUpJRERrOFNpV2RaNmZjRlRGSUtCWnlXejFlL3c5ODVyK1QwRU1hbEFzWEVs?=
 =?utf-8?B?TTlDazJqbmE5TW9nTDdVc3MyOVk4TUtqTmtpTi9CYVVDNTJSanpMcjBGQStU?=
 =?utf-8?B?aGZvUVVOd2ZjeXR6ODU4NVVsaWJZOGczb0dvZnFndTBoQlJpQkl0Vk9TNysy?=
 =?utf-8?B?M0ZLNkFDMWMvUm9JOERmKzZhTG5kaGpNNkFUZGdHdFVmWXRyTDJBaGgvSGM1?=
 =?utf-8?B?akNnOWdJcUtKaFhkUXpZeFQyZFdyNTdqRW1CaDZ4TFhYVG85K1JoeDJRejhL?=
 =?utf-8?B?blppWjBtYWtlTmJJbFJvbks3WEpkd3RhaDdWZUNkbHpMWHM2cmZaeXdjNVNh?=
 =?utf-8?B?dXExeXQ2ZksrTnpYZkQ0R0k0TjFCaDhKVFpINlhXUUtEMGg0anNEMHYrSjE2?=
 =?utf-8?B?WlhtWUpPR2FacERkd0hSWXN4SStDVmh0enRWcW1BSEhGSWVJUzlIUVBQODdY?=
 =?utf-8?B?RVlScThIS29VdFA0bUFXTGlsRGpidGxCMElWSVlCY3M1bTU3eFdna1k1cEtD?=
 =?utf-8?B?V0FLSVNlTTZQK2ZTRzh2S3B5b1NRU2ZtRUtXaEU0YTE0WkUzYytCb2xBWHcw?=
 =?utf-8?B?SVhPMm5qWTFxbGoxQlF5bjc5KzBWeFlkQzlxOFRwK0F1MjB5NGJjZW4xZ3Zn?=
 =?utf-8?B?TERYRHl4VEgzYklwVE1RZFZ5am42a2JPcitDdGJ1K2JiOG8zRzZiM2VubjBS?=
 =?utf-8?B?NjZZRVI4MjdEeXRKYWZXZVFBc0x3UkczMVdaMlJtbHgrZll3cFZuaTN2UWRy?=
 =?utf-8?B?UUl1QkJna2ZWMi9aMFdIdnk1ZmpxRk54bGlTNDYrQTY1L0psc3pJSzRXTk9J?=
 =?utf-8?B?NmlQRy9aMEtERGJveHdtS3FjRG53R0xJb3ZlZXQ1TEowTExCZFpmNTlZV2J2?=
 =?utf-8?B?NCtCclZ1M0tVWnBSdkhWUUE0RU80dGtSR2poOVAzeFhGWGpUL244U0MrdUpz?=
 =?utf-8?B?OFBZZGlvQTAzeUZLa3FqRlVVR3hRQlB5TlllZG9xdFBDTGxaTHYyL0llcVhl?=
 =?utf-8?B?SG5hU0E2ZUZMOG5pRVVDMWRqYnFzanZELzNCR05FYnhNWTM1NkJDWlBXdlNV?=
 =?utf-8?B?ZS9SZFhkQWpweWs5NmNYUklLS0FINitrMms4NXFhNnhhaVk0ZlIxVHVlZFo5?=
 =?utf-8?B?RGkxSjk2S1NlRkRxRGFTNldYRWx0MDRGNUFmRGE0ajRnQmxwUmsxRWpPSjFF?=
 =?utf-8?B?cDJaVTJ1ZkE2MElqVllNcTRwbEVtVVJzUmpzV3dsY1QreW03QVNxVUJ4UFJH?=
 =?utf-8?Q?rX4ovR0GnqbrtMaw39fm9S6Ez?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <D0EC66FA7D804640B9434C00ABE1DDE6@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY5PR12MB6526.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1ad2b2b1-cf4a-445a-73b2-08dde2934e44
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Aug 2025 22:20:45.7443 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: wRZyOIP/bGLxohD//siIRqbmvl+GFhlE20w44veg+ydXzVmh+auSrUTvySl0/yGiBfWD1fuAHLjugrmun/agaQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6019
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

T24gU2F0LCAyMDI1LTA4LTA5IGF0IDEzOjI4ICswMjAwLCBEYW5pbG8gS3J1bW1yaWNoIHdyb3Rl
Og0KPiBPbiA4LzQvMjUgOToyNSBQTSwgVGltdXIgVGFiaSB3cm90ZToNCj4gPiBUaHJlZSBtaW5v
ciBmaXhlcyB0byBOb3V2ZWF1LCBkaXNjb3ZlcmVkIHdoaWxlIHdvcmtpbmcgb24gTm92YS4NCj4g
DQo+IFRoYW5rcyBmb3IgdGhpcyBzZXJpZXMhDQo+IA0KPiA+IFRpbXVyIFRhYmkgKDMpOg0KPiA+
IMKgwqAgZHJtL25vdXZlYXU6IGZpeCBlcnJvciBwYXRoIGluIG52a21fZ3NwX2Z3c2VjX3YyDQo+
ID4gwqDCoCBkcm0vbm91dmVhdTogcmVtb3ZlIHVudXNlZCBpbmNyZW1lbnQgaW4gZ20yMDBfZmxj
bl9waW9faW1lbV93cg0KPiA+IMKgwqAgZHJtL25vdXZlYXU6IHJlbW92ZSB1bnVzZWQgbWVtb3J5
IHRhcmdldCB0ZXN0DQo+IA0KPiBQbGVhc2UgYWxzbyBhZGQgYSBGaXhlcyB0YWcgZm9yIHRoZSBs
YXN0IHR3byBwYXRjaGVzLg0KDQpEb25lLiAgUGxlYXNlIHNlZSB2MywgcG9zdGVkIG9uIHRoZSAx
MnRoLg0K
