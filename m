Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 81C82AC2B23
	for <lists+nouveau@lfdr.de>; Fri, 23 May 2025 22:54:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2CE2010E0C6;
	Fri, 23 May 2025 20:54:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="DqJTxS41";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1nam02on2055.outbound.protection.outlook.com [40.107.96.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 90CC010E0C6
 for <nouveau@lists.freedesktop.org>; Fri, 23 May 2025 20:53:52 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nq5qx7/DTIVqaOlos0htCtp+zMYYiOyzqY4OiyqsC3FZCBp+fDglUkEnnFaQMGIdO6DcEywgSITBEbGConNHS3L1G+3hgCD/DY7oOXaX5Uo4BW2PZlpn+6u/LhbpOk4Bp2p4Y+iuYD3yMukgonZ/wtc8nYGQAmxcjxmjDc7G5Ub5jDY11OhCXFY8E8E8UsXT7xksD6KbrZ2xQ2hINhNczuPXXbLmkhB5L+JQFIc16kCL7FuwjBHPktl99SgxQwfbYOZZTE/zkRUZz9w4orJKWtvWdQQnqMgQd95F6qnQ8T6n+g+oXAiLKe0riPKN7HI1Jn/2C0Xb0LmQdslmEgTPbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8RXKgoLAYAW/eVROTeu9De55zWhQHRA/STxpzJmXKag=;
 b=QraXe92kknxyCSAs+XUCNP8fzq30wrQ7i+cwFbDfkkMbfqYxlmlVJ3y0Q+fxi8Yh+IFjF7oBc8s2xyv66JbkXqX7JV6PanhnJuTEda53EWLwrIxJQmKIK6P0cG5NOEcNg8zew5o1lMWE7OzlK+I/geveMM9Z35f67U/MH5tIWnTzqob2F4+ogFQScVQBq6Ebbc2I8GGNKGu8vjQf5K6U02lUeIqQ5hAg92RpEPTNuR/gWndSmuGihSdpiCVs7284PtjtD4fDQkz3mBjeiWI3F/xkSQk3DAD6K1Kj4jnXxqfhYWu1PAP2ooxNKKAP0cnbge59KDq3s2X9L81PlVv0jQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8RXKgoLAYAW/eVROTeu9De55zWhQHRA/STxpzJmXKag=;
 b=DqJTxS41HV6z6lp/zEKD2L6dTVM0DLEx4gUFDFIqkSYbxjeAjjlg9z7YL5N11ex3tV1hG6L91VvG88oY6YITPZ8OLSU7YkW6ZEVJaSYZ9fBmLZ+tCvcJgStblVsUI4p+4Qx0J74nI0WSGQGCzMDLFM8WY3A/JvMGSahAMQLxPvQSgev67oCm00pW1bwVU5cIbKDYMh7kqbssldUsFwWA3u41xh48fd/O/+l0kb0GLHAv0oUDeCR20upwt/EjFWoGVmWAZuSZg8SvUlf/1qo9RkDPvseKfVV9uDWvnHlbcZv5+4s5JLeDPropMwq+fCgpdRAYq5eQlnFBGC/P4N/B7w==
Received: from CY5PR12MB6526.namprd12.prod.outlook.com (2603:10b6:930:31::20)
 by CYYPR12MB8924.namprd12.prod.outlook.com (2603:10b6:930:bd::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8746.31; Fri, 23 May
 2025 20:53:45 +0000
Received: from CY5PR12MB6526.namprd12.prod.outlook.com
 ([fe80::e420:4e37:166:9c56]) by CY5PR12MB6526.namprd12.prod.outlook.com
 ([fe80::e420:4e37:166:9c56%5]) with mapi id 15.20.8769.022; Fri, 23 May 2025
 20:53:45 +0000
From: Timur Tabi <ttabi@nvidia.com>
To: Ben Skeggs <bskeggs@nvidia.com>, "dan.carpenter@linaro.org"
 <dan.carpenter@linaro.org>
CC: "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>
Subject: Re: [bug report] drm/nouveau/gsp: add hal for gsp.get_static_info()
Thread-Topic: [bug report] drm/nouveau/gsp: add hal for gsp.get_static_info()
Thread-Index: AQHby/xFoSsi/HUyQEeS0kT53Juou7PgsZIA
Date: Fri, 23 May 2025 20:53:44 +0000
Message-ID: <55e0883c9ae9ccb96babe7e9641217e1ddf3d36c.camel@nvidia.com>
References: <aDCcWNFvrxtx8cXE@stanley.mountain>
In-Reply-To: <aDCcWNFvrxtx8cXE@stanley.mountain>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.52.3-0ubuntu1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY5PR12MB6526:EE_|CYYPR12MB8924:EE_
x-ms-office365-filtering-correlation-id: 5a9a756c-4b38-4d83-2264-08dd9a3be86a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|1800799024|366016|376014|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?UDNVV3RXUWd5Q2hWVkR2N052clAyNlhjdGxyQTZVQ3lzbkxKS1dHaWtBYTZx?=
 =?utf-8?B?RUV5VUN2V0YrQzNCbnhCYlhIUHFyanBFQzlhNnpjUjljYU1GdlhVL2R6TkRu?=
 =?utf-8?B?WkJySWV5QXBSaDBCN2k1aWZ2RkE4dmd4ZlA2NjlhbEl1ZXZQdFNoZUt5MlQx?=
 =?utf-8?B?djhTVjlIaEJlNDFUcG8zVjRpNG5XMnpqcytlczFkRVQ2aHhDblBidmk4SFBw?=
 =?utf-8?B?TFptWm1MYVhoQUxlZFBlRmxBbEVYemRzVWlKYTVqZ1U2SThqSWRXbjhWYnZ0?=
 =?utf-8?B?UE1GcEhxbmpHQjY1YkxLeHJyUUh2WUlvbG1TZHlReGNzRDg5M3dJN1ltQmRq?=
 =?utf-8?B?S3kvMldVYTg1bGNBUmhGZFFVSEZDaFVFSisyVzI1SUIreTdkcWFTSUlMS1VK?=
 =?utf-8?B?K0F4RlRHUEdpZXB6aWx3dnY3SlMwdmZSeGdtdWhJZjB1WnJ3bG1rblhWMXpB?=
 =?utf-8?B?RDNkMnZPV2JTNzZ3RWNTdnJUM1JOM2tZejQyTSt3Nzd6RUcrQnA4NXVPVGQ0?=
 =?utf-8?B?SmZ5a3RnNHBKblJpUG5WZG1FRzgwVDYwQ2d3Smp1bVZ1WHFaTFdkU3hlMWMw?=
 =?utf-8?B?M3piUFFCVU1WT21NcXg2ZTNKUHFBU3QvSWkvaDl5SUJRdHVzQkhhQ2czYVN2?=
 =?utf-8?B?dmRKK1h1cFB5dWhXSTZhTm56ZkF5TXNjV0VrQVd2YVBKMlFoWWF6SkRvWkdM?=
 =?utf-8?B?L2tTdTZQcVl1SkgzQVcwV3ZNWkZrWWd1TzBGaGtSaExyNzM5Y3EyaE5aQkRY?=
 =?utf-8?B?blJQRUh3cWh0cGhKMUF4MTBwZkVzL2JTVjl0cmg0d1N6V3NoZ3U2Rk9UZGVJ?=
 =?utf-8?B?a2Nra1hlTXBhV0J1ZGRKZnBFTDVWalcydE9Xd3FJTnAyZ3dPb3ZWT1g4Ti9P?=
 =?utf-8?B?NERJUmlkRk9pQytNaDZLZStYZGttMGVpek5oK3hhZzVwTmhOOFI2SXRuK2tj?=
 =?utf-8?B?aFQ3T0I0Y0JYbTdjU28yTXh5SzkzRmMwV2Fla01wSGJUU0VQQXN4VFRWandq?=
 =?utf-8?B?RWtUMXFqSnk3RGx6SC8yYVU0ZjBWOFBzMThKeW5TSU56MlhZcXk0R0VJNlZT?=
 =?utf-8?B?UVpNS3hxU2pmK2NDRG9uWExHVkppUzl3a0oyY1BBSzVLYWZPTHV1RHZwd09x?=
 =?utf-8?B?Sm9zZGZwZTNYNVdwbDFiZDVCdnVVb2IweGcyVnJERVhWYkJZVU00WVFXTk5z?=
 =?utf-8?B?Zkl5dUdCYXpkZkR0T3pGalBzR0xoWlAxdTZTK0FLeHhJWDBoakdVTjd2UmtC?=
 =?utf-8?B?NStjalFSZWNPTWJaRU1oMzNCaXR2K2MzbUJWOUxvZGVIdGZicEhkN1BSNWxX?=
 =?utf-8?B?YVZhR0ExN1JMamhHcm1iQmFocWwwVVNmVEZqa2krcW8vMFFxTUVVQmpua1Bs?=
 =?utf-8?B?Tm1CREZVSUFIdkg0dllmczVzRUIwVlpUNXhhMEdiVThlUVgyZ0xIQ0I0RVRm?=
 =?utf-8?B?cG83WXh0RHdjb2JDUTY0SGRKNGlZU1hGMkFtck5WMDc1b28zOFMxVXRLZ0pl?=
 =?utf-8?B?ejJNNFNVcjk1Nnl1bDRRZnljOHNvd3JWbEtsSE1zTHNwK0hHZnRjeG0wME5y?=
 =?utf-8?B?TnVwSEt0MnVQZDU5d2dLMGNRcU9UK0hIRExyTFdKZThCTkFVTEUvUE9rcmZm?=
 =?utf-8?B?Y3VYZndRMjd2L1dkWitWdFBLVzFVZW1nc3N2MmEyL3VyQUpSd2g4N0hrb3FY?=
 =?utf-8?B?TjVkRU5IdWNEYXFlSml2aW1zckh5cmNITmw1TGwrWTVPREp3dHkvZUNmQVlk?=
 =?utf-8?B?TWJ1aWlhMWp2aDlOQnFDZFJ2cFFuU1VJMnJiUTU0RjdIMHhObFlvYXFuOFZE?=
 =?utf-8?B?cmhpMm1IWjBzak8rdHEvcGIxY0dZRDBCbzNwNE9QTnh0WnNJclowcHRBR2Z6?=
 =?utf-8?B?ZjZnbDFGVXFESjBiRTBUZDB5M1orZGxLaVlsWU1Ea1BGZ3IwVEtyd2F2ellE?=
 =?utf-8?B?WkhaTjF4NHlLQXBSZ20zZWZmbmJGMTlYcVN4Y0lmWTl3NERZdDRGWkFpRDA0?=
 =?utf-8?Q?AbpFYWMeICba2QIEJqSAMf6zG+1clU=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR12MB6526.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ajQ1WmIzbUJnNGZ1UkdncytTSjNMd2Jtb3RLR3BxMFhxWEl5U004cTVyTGNq?=
 =?utf-8?B?T0wvQUZGRjl2VEUwNXplWncxTVJpL2xFNDV4U1VTMStud1VodzhUeXZBRnhk?=
 =?utf-8?B?TTBCcFdvN3dCbEp6ZUlhRlNTZmU1Ymd0SmhQdzdyZm56SDVKWUZXQVJOUm5a?=
 =?utf-8?B?TGpaR2tlaUVVUFJXdFVCMzd2S0hIa0drWm5UUUFqWVMra0FOUG1xNkxaWXZW?=
 =?utf-8?B?NDRMWms0ckFQcmVlWGpZNEdnSVZleWxsRmFKeVdGQldWa1g4WkFqaS9iT2VG?=
 =?utf-8?B?bUJ6bzJwaWpMcitrNUtHZTE0aWJpZmg0Z3dURnVvVCtCT2RvM1QyRm5MKzUr?=
 =?utf-8?B?Y1NneVNwK1VDcUxzQkVoRitPbEkvQy9tWFZMeW9nMk05SGJQNU5zQmd3dmVZ?=
 =?utf-8?B?U0psRW40TytqdnU4NDF3WGVtZEpQQlFNRTU4dEtlZXZhbkhTR1JxZ3RlWVhn?=
 =?utf-8?B?MmJpQ3BGT2VESUZCSCtCYWtIMkQ2Si9XNXE2SzA2dGdsSTc1M2hiNEhPVFY1?=
 =?utf-8?B?VlBUY0tjankwbGRQNU85LzdxTTQ3QnlUL3dHekdsV2pvL280KzBXdTJKY1hh?=
 =?utf-8?B?Z0dSbC90MU0ra3hBRGs3VlRjamt1aXdyQVljQnJNOW1HVGFCNmhJOS8yVlh4?=
 =?utf-8?B?WVJYRjVFaExHZzJ2eW03aEg4cUlkTUtkdnpCZm5VRCt6T2VkVk03QzNBRzAy?=
 =?utf-8?B?VlVlR1N3dERkVjBDT2NNZHdiZWVzNWIxV2RuVS9nNzJqZkZPVVZseE1pRDV5?=
 =?utf-8?B?VWlNT3NaZFl4TkFTeWhvWTgvQVA5K2pvOXVoZ3FWR0hHZlM0elNaVGQ5TkpP?=
 =?utf-8?B?UHdSYzFCMXhDb05PSnQ0UCtKWUJQZFNGYmtRR0hIYmttS3NtdDJmNmNpZVBO?=
 =?utf-8?B?ZCtGcEhjbkNlR3k1TmpIcitkTjcxeWxsYlZKcjNrVkh1YUxGZExwb3ZYWm9r?=
 =?utf-8?B?R2dTVGE5ZTdkUjR5T28xUnpXQ2VDM3VtK3M2TzcyOUoyRnFzWktxQ2NrcFNM?=
 =?utf-8?B?T3NhVzN2WWNKcUZ5RTZlWnRyeTJvM0poZWJxUTladnM4RzZZZ2JlL3NWR0pX?=
 =?utf-8?B?Q2J6dHhoam9qeGkvSFNzTndsNFNUZ2s0UUtyMFpPNENmWndZNyt6ZWYyOTQ4?=
 =?utf-8?B?ZjFnQkY5Q3FQVUI3NHFhWnlIN0xLOXNpdWFhMEgvS1V0N0pjbkJScHhCb2Ry?=
 =?utf-8?B?YWlrS053ZmRCYkFzWWQ5RXFiRGRRQ3dkdUJNMUN5Qkk0OE0yWmRyVVMwZnhs?=
 =?utf-8?B?eHo0a1E1NWlKRlU4VXBHUHdjcklCRmRyRTI0WkREQjFaN3VTYm9hSGFEdDNM?=
 =?utf-8?B?Q0FQSU1WS21SaHd0bEs0enIwZEhlbVRsMkcvRUlZK2FteUZuQUxyOEUzTlo4?=
 =?utf-8?B?Q2Z0ZGh4aWN2YzNGdWtERk5aOVJid2hhem9Lb0Y2L1BFU3c3MlhSUTJWdGpp?=
 =?utf-8?B?WDIrWGp5OUpYT1V3RmRwdDc5N2hqYVFwVmZ0clhlRTJ4Q0hSL3drSTZJSS9M?=
 =?utf-8?B?cUsxd1laRjlyQ0RSVmdqS2VKL2dPU29rN2QxY1RpVENGTGk2V1FwdGdwcnJD?=
 =?utf-8?B?N09aaFNaVHhHTVh0dStJODR1dFZIcDRIUmxtekt2SHJnREwxajJmeHFoV2gx?=
 =?utf-8?B?OWp4K3JNRGdzNW92L0xIWm91R2dMM2FVRXBUL1dlUnF4Sm4zbGFGZVNIVkxm?=
 =?utf-8?B?RExxbXR3dGdkSDkwdFd6NUdrbG1ybVhZUnc5dk4yTm9ENE1aYlRNUVhaUXMx?=
 =?utf-8?B?UGlheFp1YWpQdzlENUpYYmF0MklERHlNM2tSM0t1UE5YbWVTbFgrc2ZyOFNW?=
 =?utf-8?B?UWRJckZGTWVxcVI2Vkdadjl2VFh5Q3A5Rnl5S1UvRzlaLzM1aDZZQk9DTm1u?=
 =?utf-8?B?NGc5ZmhRUnN5R09XeS9HNlB3NkRWaEh1VXhNR0ZTWVA0KzFBVG9jZ3dVQVVR?=
 =?utf-8?B?Vjlab0hFLzVXcGNKTGhna0s2NmkwRmNSd1lONlJucnUySWNCa1BIc1B2dDl3?=
 =?utf-8?B?MDQ5UUFYdktQbVIyc2hzejBjdEMxUWpWQTU4OU1tODE0K0ZHMWNiZVRPb0tP?=
 =?utf-8?B?SHBnOHZKS3FGeHpEYzhnYjRqVjZZT2QwRlBWNTByc2ZhRmhtZ2xMWDdLNFdS?=
 =?utf-8?Q?vIG4ucVL12y2M0gNv/Tqmsds0?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <F3A051687365834BA3709CD9305340DE@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY5PR12MB6526.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5a9a756c-4b38-4d83-2264-08dd9a3be86a
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 May 2025 20:53:44.9397 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 0wtwDzKx8Jax14XKPN/u2w5Jbw+0knMh65XGeT0O3N6aPCSYOGB64xIkuaipucg7z4AqPLClYaYuSa5Cya0X6A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYYPR12MB8924
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

T24gRnJpLCAyMDI1LTA1LTIzIGF0IDE5OjAzICswMzAwLCBEYW4gQ2FycGVudGVyIHdyb3RlOg0K
PiBbIERpZCB0aGVzZSBmaWxlcyBnZXQgcmVuYW1lZCBvciBzb21ldGhpbmc/wqAgTm8gaWRlYSB3
aHkgdGhlIHdhcm5pbmdzDQo+IMKgIGFyZSBzaG93aW5nIHVwIGFzIG5ldyBub3cuIF0NCg0KQmVu
IHBvc3RlZCBhIGxhcmdlIHJlZmFjdG9yIG9mIHRoZSBjb2RlIGxhc3Qgd2Vlay4NCg0KPiBIZWxs
byBCZW4gU2tlZ2dzLA0KPiANCj4gQ29tbWl0IDdiYjc3ZWFjZGI4NSAoImRybS9ub3V2ZWF1L2dz
cDogYWRkIGhhbCBmb3INCj4gZ3NwLmdldF9zdGF0aWNfaW5mbygpIikgZnJvbSBOb3YgMTQsIDIw
MjQgKGxpbnV4LW5leHQpLCBsZWFkcyB0byB0aGUNCj4gZm9sbG93aW5nIFNtYXRjaCBzdGF0aWMg
Y2hlY2tlciB3YXJuaW5nOg0KPiANCj4gZHJpdmVycy9ncHUvZHJtL25vdXZlYXUvbnZrbS9zdWJk
ZXYvZ3NwL3JtL3I1MzUvY3RybC5jOjQ3IHI1MzVfZ3NwX3JwY19ybV9jdHJsX3B1c2goKSB3YXJu
Og0KPiBwYXNzaW5nIHplcm8gdG8gJ1BUUl9FUlInDQo+IGRyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1
L252a20vc3ViZGV2L2dzcC9ybS9yNTM1L2dzcC5jOjIyMyByNTM1X2dzcF9nZXRfc3RhdGljX2lu
Zm8oKSB3YXJuOiAncnBjJw0KPiBjYW4gYWxzbyBiZSBOVUxMDQo+IGRyaXZlcnMvZ3B1L2RybS9u
b3V2ZWF1L252a20vc3ViZGV2L2dzcC9ybS9yNTcwL2dzcC5jOjkwIHI1NzBfZ3NwX2dldF9zdGF0
aWNfaW5mbygpIHdhcm46ICdycGMnDQo+IGNhbiBhbHNvIGJlIE5VTEwNCj4gDQo+IGRyaXZlcnMv
Z3B1L2RybS9ub3V2ZWF1L252a20vc3ViZGV2L2dzcC9ybS9yNTM1L2dzcC5jDQo+IMKgwqDCoCAy
MTIgc3RhdGljIGludA0KPiDCoMKgwqAgMjEzIHI1MzVfZ3NwX2dldF9zdGF0aWNfaW5mbyhzdHJ1
Y3QgbnZrbV9nc3AgKmdzcCkNCj4gwqDCoMKgIDIxNCB7DQo+IMKgwqDCoCAyMTXCoMKgwqDCoMKg
wqDCoMKgIEdzcFN0YXRpY0NvbmZpZ0luZm8gKnJwYzsNCj4gwqDCoMKgIDIxNiANCj4gwqDCoMKg
IDIxN8KgwqDCoMKgwqDCoMKgwqAgcnBjID0gbnZrbV9nc3BfcnBjX3JkKGdzcCwgTlZfVkdQVV9N
U0dfRlVOQ1RJT05fR0VUX0dTUF9TVEFUSUNfSU5GTywNCj4gc2l6ZW9mKCpycGMpKTsNCj4gwqDC
oMKgIDIxOMKgwqDCoMKgwqDCoMKgwqAgaWYgKElTX0VSUihycGMpKQ0KPiDCoMKgwqAgMjE5wqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgcmV0dXJuIFBUUl9FUlIocnBjKTsNCj4gwqDC
oMKgIDIyMCANCj4gwqDCoMKgIDIyMcKgwqDCoMKgwqDCoMKgwqAgZ3NwLT5pbnRlcm5hbC5jbGll
bnQub2JqZWN0LmNsaWVudCA9ICZnc3AtPmludGVybmFsLmNsaWVudDsNCj4gwqDCoMKgIDIyMsKg
wqDCoMKgwqDCoMKgwqAgZ3NwLT5pbnRlcm5hbC5jbGllbnQub2JqZWN0LnBhcmVudCA9IE5VTEw7
DQo+IC0tPiAyMjPCoMKgwqDCoMKgwqDCoMKgIGdzcC0+aW50ZXJuYWwuY2xpZW50Lm9iamVjdC5o
YW5kbGUgPSBycGMtPmhJbnRlcm5hbENsaWVudDsNCj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgXl5eXl4NCj4gDQo+IFRoZSBudmttX2dzcF9ycGNfcmQo
KSBmdW5jdGlvbiByZXR1cm5zIGEgbWl4IG9mIGVycm9yIHBvaW50ZXJzIGFuZCBOVUxMIGJ1dA0K
PiBpZiBpdCByZXR1cm5zIE5VTEwgdGhlbiBvYnZpb3VzbHkgdGhpcyBkZXJlZmVyZW5jZSB3aWxs
IGNyYXNoLg0KPiANCj4gaHR0cHM6Ly9zdGF0aWN0aGlua2luZy53b3JkcHJlc3MuY29tLzIwMjIv
MDgvMDEvbWl4aW5nLWVycm9yLXBvaW50ZXJzLWFuZC1udWxsLw0KDQpXZWxsLCB0aGVyZSdzIGRl
ZmluaXRlbHkgc29tZXRoaW5nIHdlaXJkIGdvaW5nIG9uIHdpdGggdGhpcyBjb2RlLiAgSXQgYXBw
ZWFycyB0aGF0IG52a21fZ3NwX3JwY19yZCgpDQphY3R1YWxseSByZXR1cm5zIE5VTEwgb24gc3Vj
Y2Vzcy4gwqANCg0KCW52a21fZ3NwX3JwY19yZCAtPiByNTM1X2dzcF9ycGNfcHVzaCAtPiByNTM1
X2dzcF9ycGNfaGFuZGxlX3JlcGx5KCkNCg0KU28gZWl0aGVyIEknbSBjb25mdXNlZCwgb3IgdGhp
cyB3aWxsIG5lZWQgZnVydGhlciBkZWJ1Z2dpbmcuDQo=
