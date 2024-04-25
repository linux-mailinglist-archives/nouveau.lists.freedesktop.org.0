Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F8768B26A4
	for <lists+nouveau@lfdr.de>; Thu, 25 Apr 2024 18:38:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F35AD11A629;
	Thu, 25 Apr 2024 16:38:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="V90cwGFh";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam04on2068.outbound.protection.outlook.com [40.107.100.68])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 14A7F11A61C
 for <nouveau@lists.freedesktop.org>; Thu, 25 Apr 2024 16:38:23 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jRF6akI6OTmiyaqfUPGOISdYCG0RVJ2vXBDnD12xKNIFJxNYasd5FHxM3tgo00DnQqL7CZUCM5w7OeboS5w7R1rg0CZihdY1WVciNAYKipvVBLPuweJ9hnt9kzppt24SHOcH7uXJf/6j38R1YqDEis4I6QbnJWICJ53m9ZgwLxhX+dGxym1g2B8SBq2yBf8fMZShwYb3tsLaHricQwYQuwAKM9w40r8fosg37+Jb+92XsUj0teO8LqZD/YrAm6MSZUXEy6nxunYjx/+hqzsNevKmgiVzEX++iUCxBAU2mJ9Vm8IlUJ1eD8tdwUZPAp7kyVAs7U9WZ58KOOqT+t36ZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JELUhax2xoFfy4Yyv33uGAKj5/qdtxAQXXpjIQqbixY=;
 b=IuH8KGdRo3iHRbyH3M5O3iXG3e28OedXCKQ81isPIDA3J4L47N1pyJR/QpTB0rYThEDQ96aTkBJyHTDKJvyWFmlQ9GvbCZPCf9J6NQtyWC5woInRGLkeOhVmEArtFtkpPPk6m2QpyDFddSbvPk7QIxKMsqS0vnA7AnFSuOkKVSULrQdxoPY3g0La5J+T1VAkZ+HbC090rXahJBpatp2xgBn9d6LB/6/cAm/PTNudCVF/RUyLxwzSVVkykGbKaR6NnA18FT+J6wvRShubzzI2CBKca7YVx4iwMg2YYEH0T87Zi0nf0dIV2aDCKoimMYu4a1mxH5XYpUnNCR98V5rCUA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JELUhax2xoFfy4Yyv33uGAKj5/qdtxAQXXpjIQqbixY=;
 b=V90cwGFhELIiFil8XPtoySlhQEaonoD4zVTWLj0rIQ8IqMRaPa6P7iGogzqFjMGwmVzOW/EMluSdtUreRBbdp7lVi+rwv2D/b0xJ1ErS9kl5/u/XYAFZFWeDvuQZE+cPBuQZpx23jdcEp+W9jbko+I0QzjjX0IhNYEs8J+Uy9pdPhyT76A3FVQnC/46EhNzIOJs2iTAroNvd++1SZ8KVUxQ/qvMvmmRXXtFj/q52dRH/tIMdMzHrUGNcbeaaELA9GSYXl6vuSg+rORH++YFgJx2nERs0UkCgU+Ydt7J3o0864nMXwWcJ3zzMa7Iv6sc/NO66+zdpNzDqmQK235uZdg==
Received: from SN7PR12MB8769.namprd12.prod.outlook.com (2603:10b6:806:34b::12)
 by DS7PR12MB8202.namprd12.prod.outlook.com (2603:10b6:8:e1::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7519.22; Thu, 25 Apr
 2024 16:38:20 +0000
Received: from SN7PR12MB8769.namprd12.prod.outlook.com
 ([fe80::ac4b:38c3:29cd:519]) by SN7PR12MB8769.namprd12.prod.outlook.com
 ([fe80::ac4b:38c3:29cd:519%3]) with mapi id 15.20.7472.044; Thu, 25 Apr 2024
 16:38:19 +0000
From: Timur Tabi <ttabi@nvidia.com>
To: "dakr@redhat.com" <dakr@redhat.com>
CC: "airlied@redhat.com" <airlied@redhat.com>, "nouveau@lists.freedesktop.org"
 <nouveau@lists.freedesktop.org>, "lyude@redhat.com" <lyude@redhat.com>, Ben
 Skeggs <bskeggs@nvidia.com>
Subject: Re: [PATCH] [v7] nouveau: add command-line GSP-RM registry support
Thread-Topic: [PATCH] [v7] nouveau: add command-line GSP-RM registry support
Thread-Index: AQHakRG5UhwazQBxDEyKQ4bLCZjfrLF5BToAgAA2l4A=
Date: Thu, 25 Apr 2024 16:38:19 +0000
Message-ID: <913052ca6c0988db1bab293cfae38529251b4594.camel@nvidia.com>
References: <20240417215317.3490856-1-ttabi@nvidia.com>
 <162ef3c0-1d7b-4220-a21f-b0008657f8a5@redhat.com>
In-Reply-To: <162ef3c0-1d7b-4220-a21f-b0008657f8a5@redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.44.4-0ubuntu2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SN7PR12MB8769:EE_|DS7PR12MB8202:EE_
x-ms-office365-filtering-correlation-id: 7f601481-a4d6-4a40-9b56-08dc65461da6
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230031|1800799015|366007|376005|38070700009;
x-microsoft-antispam-message-info: =?utf-8?B?Rk8yLzM4K1htREQzT21NNFEvTmh0Q3hIVTlJbzhIZUpRa21zVU4rei9FeDh5?=
 =?utf-8?B?NXJOWDN5YmVnVzV5QkZiTk5YeGxDWW1GTkF5d3F0cXgyTWVENWxPTWtseHE4?=
 =?utf-8?B?bnRTZUVKL1IrdHVqWEZDcDlOSHY3cWNSeHhGZ0FOR1M3RjNDQ2FQYXZRYzVm?=
 =?utf-8?B?aXBZR0VBeEJYa3hDdzZHOXFhUkt5S2FmcUJuWklaeWdDa2haSTllc2pOS09N?=
 =?utf-8?B?bWNFY0d3MUs1a096Z3A1citoR1FBZnAyY2tRaWx6bGVEcnU3dkJJamVjb3ND?=
 =?utf-8?B?TUpiZkFNci9qUnNnR3c3bVByUmF3OTFQUW9PWFY3dVFMYmk1WE53N1hYcDZE?=
 =?utf-8?B?L0FKTFhXbTlYa0VYNm45SHpUb2xValppWENIa1A3bWsxUG1jcWc3WVRnN0lS?=
 =?utf-8?B?Qi9IMGQyVFM5VFhESllGK1NiQjNGQlJHQlMyWXNSbjh2SEZWNkQ2Z21IRE04?=
 =?utf-8?B?WkZDSi9Bb2lobnB0dTlCb2ExMTZNTkZ1ZnkwTytoRDliVzhkbS9MUkQ0dlFR?=
 =?utf-8?B?Q1FMYTdrbEY4T21OMlVKajJVS3NEeTNaYUtXY09XUEJyYld6N0QzcHJRbTh3?=
 =?utf-8?B?dzM3TVovNXkxcW9pNkt0bUtwRFh3eXlNMmxCTHNGVUZDUzhBYnMzQ1FMYjFl?=
 =?utf-8?B?UmJBTksxQ0drYUd3TXJOVGJ4TXE0dVFxYm1FbytrV2RmTElRTmova1BjL0hM?=
 =?utf-8?B?KzdtY0ltU2xvTU40eG9pWkdFSE1sV3RUb3o2WWI0dkNCRUE5amdwMFNLeWZv?=
 =?utf-8?B?c2IyZHFsdk44eHU0VFA5MjRIRDJUdlpOaGJzVFV5cXp1MTN6TnlNQ255VnJW?=
 =?utf-8?B?QkNGanczY0RPQ3k4QWpqT1poSWJqeVJmNnBNSjFrVk83cW9wS0QvSG91cUda?=
 =?utf-8?B?Qjc4RnhUVTVud2hFeEE2dkt3bEk4a0N4MkY2TksrU3VNVWhLRUN3Vkw5SUdz?=
 =?utf-8?B?WTdqWHNYVDFIeXFzeTZUaXhyN3BJaFNoV1NTcDZYVFVLcGZ6VmRUSFhWWGFp?=
 =?utf-8?B?aC9rTGo3ZVpNYStQQXhZMG8zdFdxOXZOZWpvQkhCcXpvajB4bm1BeGk1REVW?=
 =?utf-8?B?UnFvTGlUOG81SGpxbkdZTm5GVWxOTUZWTzlxczFxTU9BbzI1WHlCcjF1Q3JV?=
 =?utf-8?B?YjBOL1JkVStYLy9Kbm54Q0lrU2FieDZvSXBxMDJCamlLUDF0dUxNV3R1N3VB?=
 =?utf-8?B?VFpRRXNyM2g1YjhpRTBtY09RdFA2T2xyVndBeTFSQ29nNncrZ3NrY0FtQllZ?=
 =?utf-8?B?dmxaN3RsditrcE54U0pRczMxa3RaQjM2b2NlVzZ1bWkydU05UkZ2emp4VGNn?=
 =?utf-8?B?ZVlFVGNJV0M5a05NKytiK0pST2cxQmFuV3paRHI2Q1dhcUJ2dXNnZGVhVVh4?=
 =?utf-8?B?K2tIdDVGQ1lJWlkxVnpKSmkzR1hBcmNMcE9kTVgxZklOMEx6VkwzQW16ajRU?=
 =?utf-8?B?OTQ0U2RBR2hIeSthNXZqRndxaEN4am56dWdUeE1LN3UwTmVzQ1Z6L29XTUFH?=
 =?utf-8?B?QVFPUGhpTCtLZ0NtOXhNMURjaWJyK1hPa0JOM2hRV2Q1czc3TFFibGVydE1K?=
 =?utf-8?B?VmNOMEJkblZBRXJJRjdNZEFySWF3ZmI0MlN5SUZLd3JqLy9PeVJpWXd5MlVo?=
 =?utf-8?B?OUtWMWFPSUxqWWd1eHR6QWNTc2VHNDhUNnVJT0xnK3hRN1BQNk81TUNyaENG?=
 =?utf-8?B?bXFRNkx0cE9lbkp0cURiaTJEckJjU0pvbnU5ZWFJeFBsaFNtM0hxT244OXQr?=
 =?utf-8?B?ZWd6ZDN6amxURFpyTG5RQWNBanQxWmtzNG9BRmlNKzdONER6ZjBFTXVXL0pw?=
 =?utf-8?B?V1BjUXFEb2wvSHdkNVZQdz09?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR12MB8769.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(366007)(376005)(38070700009); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?WU1iVjdPK2tnSVpvNm9GWEVjYzJBWkY5bXYwbno5M29KWjdjZ2tkMklhVkZQ?=
 =?utf-8?B?MHJPNWdzZFZqMXZkMEw3NUFweW1oZGtqbXEyM1M5Sm5pQ1JjbDFqNmg0NGFT?=
 =?utf-8?B?TE42VU1oTEJBTFcyTFZodzEyNnhraDd6SkpnOEwyZEFXTSsyZFg2cEVGYm43?=
 =?utf-8?B?RW9EOXgrbEtnQkJsVjlSWnlKY3Z1Rkk0OWp5TS8rOFVKK2VJKzY2NTFKc0xs?=
 =?utf-8?B?U21uVnhiQ2VzZUFlUjh6N3dod2FIS2lhb2xuNVhNdGtpbERwWlJMVFZ6L0JI?=
 =?utf-8?B?OThQOFBzclUrY3lRTldsYWQzYnVHUTN5V2tCZ2w3SEVGQTFYMkYzRlpTTERG?=
 =?utf-8?B?Q09VZURvL3hiQWxKU01rdHVWUUw4WW5aMDJ6LzZMNzBJWmFndmdmWkJnQ2Jz?=
 =?utf-8?B?WnJoQVZxYzhjNlliS3ExRGdxbDVLenk2ekJHQlhleGRzRnFSanlaV01PSkY2?=
 =?utf-8?B?aVBPN2xHNkU1NjNNUnFPQTFodWhpcHQ3TVJFbS80U0NYNTNHT1dmbHhsa1Q5?=
 =?utf-8?B?bFJxNEhNRTJUTFRXMVZobHlVUFZBbWdScWRJdlJUMmFneVdzM0dlZ1dBOVpi?=
 =?utf-8?B?azZLaVVvTFMyVkFpRG9MTFcxOXZuQXUwb25aVkxLVXN4R0FQZkRTcWh6TDFS?=
 =?utf-8?B?ZXJRU1F3VkRlM1hzRWVlM0cwd2hNR0hzeFFjaWVXYS9tb2lGaFpKR3RvUldR?=
 =?utf-8?B?NnJGYmpYT3BrWE9HeElsWkZyZDZKdTVROHpyOTk1azBwb3ErYXFtdzFXRHN2?=
 =?utf-8?B?aENHcUdvbkFvVUtZWElwbDB4b3dHUHZzSzdYb1BvYXZKZTM5WDZSK09peTRS?=
 =?utf-8?B?STNNQlUxZmhpZXlsamFmWVI3ck1rcFJGM3V4VzBhbzB4K0hFVEt4aUhTdXVr?=
 =?utf-8?B?NmRxSG5HSFE0Mzc1WVVCUXdUby9NNFZLRDZxVUV6cGYxUWJvRytkUnJyOUdm?=
 =?utf-8?B?TXJ0VEx4WlJvT2VDTUErckZmdXVteXZsVzR2b2ljL3FCZndBNlV2bWhWOTdE?=
 =?utf-8?B?dHB3L3JLUWlialBNQjltMnU2ZzNWS0JsUVVOMi9yRGlKTjRta25iYmVhbmhm?=
 =?utf-8?B?MGNnMlppOWk2azliVVpSeEdaY09ZTGI0REZ3cDlTQlY0czJHblphVWRrWDB2?=
 =?utf-8?B?eWJDTEVvVFFIZTdjVVJVWlNYUnlLWWxDMXZsYWlUa1JHdnZIQXhNREx3Nitt?=
 =?utf-8?B?NTFhNWlEdjUra0NpclBNTGFsblQ2TXZmKzZIOUlNd21nYWNKT3pjNEw3QU1q?=
 =?utf-8?B?Mk5Ecml0RFFyRGFnenRBNmFpTGUxZXY3d2JEOGw4blA2a0cwY1hENENYV1o2?=
 =?utf-8?B?Ty91QXEyNUovVzZFTHhWYXB2T2JwOWJpc3pLdVQwL1VsRnF1U1k0cm5CNlkv?=
 =?utf-8?B?a21BZEo3dmRHdk5ZR1NJdEpIS1ZicVF5MUtyMlFmR0lyRC9wblpPYWxDNXJl?=
 =?utf-8?B?MHYrUUdMR2JoS2NKVHpQOERkVTYxakxha0pmc3ovU3pFbEx5eVpHcGpCbm1i?=
 =?utf-8?B?aisxbTJZdlh4UGg5bTcyb0ZFMXJqd0VweGwvakJXRU9pRnI1QUo2K0VSVG5r?=
 =?utf-8?B?RElZdU1VcmtvNTV3U1Z4K290N1RCc3RzZ0huSXAyS1BsY2tKWlRYOTNYUnBE?=
 =?utf-8?B?ZGVJb25qbVplOGNwZEdwNlpjWUpVb0xrdmdMSER3L0w4UjhVTTE4ZVBCdVQ5?=
 =?utf-8?B?K0JTN016Y29aVFhTRTZBZUV1aXZOQkx3Tmw4eTNrcmNBMFBYalRSOFZmUVlP?=
 =?utf-8?B?anpnQXZpRWlSbjBKK3o1cW11VmhQdXp3aUEwR3NrNHBDVTVuL0NMb2NteUNl?=
 =?utf-8?B?MHpFRnF5NFpRSFB2b1l4aUtlUVVka3p5RnJIWDdOeTN3ZkdpYzBaNU44bkta?=
 =?utf-8?B?c084OW5reGJ5QUwrWmh5QUZwV2NBQThKakl2VXBQYkJ0VVNZRzgwMXJRU1hF?=
 =?utf-8?B?bktPdkZhM2MwV3NWekI5TXlYS3FEcU4zSjNSbHpvdTdiL2ZTL01RbUw1UjJ4?=
 =?utf-8?B?ZE9ENER0Q1krK0ZURWJKY3hFb3lraWFUZkpEem83RjVxK0lPYkNlejJ5N1dK?=
 =?utf-8?B?dlZXTXhlVUo5aHZDMklLenJYL2ZNdTJSS3NOSmQ3MGNZQzdPQTFCL3dmRmto?=
 =?utf-8?Q?j3+nEIdjLfsYO/lacLXYNDOt7?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <95DB8142F746AF45BF963FF6D1CF8F6F@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN7PR12MB8769.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7f601481-a4d6-4a40-9b56-08dc65461da6
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Apr 2024 16:38:19.9181 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 8MHG28bezhzKwsFSKk4BQJ4317Yzy72Ff46poju3Nbw1yuq+kxwO6i9Oh2QfQEtxRxrH+pJih/ISEP5xRFgPpA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB8202
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

T24gVGh1LCAyMDI0LTA0LTI1IGF0IDE1OjIyICswMjAwLCBEYW5pbG8gS3J1bW1yaWNoIHdyb3Rl
Og0KPiA+ICsJCXNpemVfdCBsZW5ndGg7DQo+ID4gKw0KPiA+ICsJCS8qIFJlbW92ZSBhbnkgd2hp
dGVzcGFjZSBmcm9tIHRoZSBwYXJhbWV0ZXIgc3RyaW5nICovDQo+ID4gKwkJbGVuZ3RoID0gc3Ry
aXAocCwgIiBcdFxuIik7DQo+IA0KPiBXaXRoIHRoYXQsIEkgc2VlIHRoZSBmb2xsb3dpbmcgd2Fy
bmluZyBjb21waWxpbmcgdGhpcyBwYXRjaC4NCj4gDQo+IHdhcm5pbmc6IHZhcmlhYmxlIOKAmGxl
bmd0aOKAmSBzZXQgYnV0IG5vdCB1c2VkIFstV3VudXNlZC1idXQtc2V0LXZhcmlhYmxlXQ0KPiAN
Cj4gRGlkIHlvdSBpbnRlbmQgdG8gdXNlIHRoZSBsZW5ndGggZm9yIGFueXRoaW5nPw0KDQpObywg
YW5kIEkgY291bGQgaGF2ZSBzd29ybiBJIGZpeGVkIHRoYXQgYmVmb3JlIHNlbmRpbmcgb3V0IHY3
LiAgSSB0aGluayBJDQpvcmlnaW5hbGx5IGludGVuZGVkICdsZW5ndGgnIHRvIGRldGVybWluZSB3
aGVuIEkgZmluaXNoZWQgcGFyc2luZyB0aGUNCnN0cmluZy4NCg0KPiBBbHNvLCBsb29raW5nIGF0
IHRoZSB3YXJuaW5nIG1hZGUgbWUgYXdhcmUgb2YgJ3AnIHBvdGVudGlhbGx5IGJlaW5nIE5VTEwu
DQo+IA0KPiBJZiB5b3UgYWdyZWUsIEkgY2FuIGZpeCB0aGUgd2FybmluZyBhbmQgYWRkIHRoZSBj
b3JyZXNwb25kaW5nIE5VTEwgY2hlY2sNCj4gd2hlbg0KPiBhcHBseWluZyB0aGUgcGF0Y2guDQoN
ClllcywgdGhhdCB3b3VsZCBiZSBncmVhdC4gIFlvdSBjYW4ganVzdCBkZWxldGUgJ2xlbmd0aCcu
ICBUaGUgTlVMTCBjaGVjayBmb3INCidwJyBzaG91bGQgY2FsbCBjbGVhbl9yZWdpc3RyeSgpIGJl
Zm9yZSByZXR1cm5pbmcgLUVOT01FTS4NCg0KVGhhbmtzIGZvciBjYXRjaGluZyB0aGlzLg0K
