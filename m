Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F1FDBAA9DD5
	for <lists+nouveau@lfdr.de>; Mon,  5 May 2025 23:07:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE1C110E131;
	Mon,  5 May 2025 21:07:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="WxrqQW9c";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2046.outbound.protection.outlook.com [40.107.236.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BDEB910E131
 for <nouveau@lists.freedesktop.org>; Mon,  5 May 2025 21:07:37 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=s4vNvGYA0bL0h1gP25Vpbx+1RHSEnxiiOKI66gklqRCyaZg8AC9I3zX84SMt+/Vebxy/GJ+c7ShlpwydZZF8yh5jth2LCwF5dl1snBOrBvRv3svDB0J4/ibtdd8p4c7JFgFSJyUoshZHH8lHHUm/T6XT1otoJkQMTXuXnTsAu00IRKovW19V4OXc80oiln/2BfTi6plgs07QD9/10YhCoYllSjHe0STPu/BmHdTY9HkWn56NjeYkuo2hzCQW/6fwqhUpYCinS3Wts/DWI/yXCmbi0msFm9nqtjQKUZ2b+N/dYsMozS+cNOOqctkw8RkXBW9LgaTFAfnKAn0ohVZcmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OssYNpdz/DrBMms6R6Iry2GsB3SdNVKsmpWuqtag8as=;
 b=APxVKLe5Q66WYSd6Zm4gyh4hXdh702HQz4oVw+l8m2PCFA7iCxmlHSlsDgZouv8HcxJEIYUqYo2BkvB67goVlmcKZ/JhRVV/UiO0xOks0eLCWHYu40xeqfIWtYVBEaoXzjLMuHA9Gbn7W5SA69ecVXUda9G0JaphvFgKHlv3Mns4jLLvs0YGje7CWOKbiSqQP1ZdtBmOsYJskjMzdeyMpZX9MZB4zxwZwzirRrR5FjGc4n8Pwe9qBLPHgM9EwFc4j1flwUkpzBoSi5DNZBAv2IM+xtVEGvffYCZ8oZFaeEVbnGUm9bF7HZzqI33tinaGBxNd87xYcrvB/Y0VOhy5/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OssYNpdz/DrBMms6R6Iry2GsB3SdNVKsmpWuqtag8as=;
 b=WxrqQW9c/YK+rXycyJW0lA53U2zru1/HEoARh5XekQ6tYnhCT7iETkx42L88wRMGiIYB5Wihx8bP1XBb091nrTfPqLDoMse1JpIhe1fJtLCxIZKdUlJDNHekn2pr4ZO+eMwr3ITWHBvYKcrRY03w/tYyfY6F6QqTd2aOcBm21xE+fxYMm8IIiRtBVPdLl/0vsP17icnHuwIczjVDZmYHmddjh0BrVDCakYhsvaFe4cvuneiSNfCj7a/4RRAVlfe0oAWQTi7XYZjmDJYyRIMOOWRTKG3yxqaysHKW4/JjI8BnJEUCyB2Ib6mRN4dbmtyQ/pTqBRz4VJ4Bip3xWE/l3A==
Received: from CY5PR12MB6526.namprd12.prod.outlook.com (2603:10b6:930:31::20)
 by DS0PR12MB7728.namprd12.prod.outlook.com (2603:10b6:8:13a::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.24; Mon, 5 May
 2025 21:07:33 +0000
Received: from CY5PR12MB6526.namprd12.prod.outlook.com
 ([fe80::e420:4e37:166:9c56]) by CY5PR12MB6526.namprd12.prod.outlook.com
 ([fe80::e420:4e37:166:9c56%5]) with mapi id 15.20.8678.028; Mon, 5 May 2025
 21:07:32 +0000
From: Timur Tabi <ttabi@nvidia.com>
To: "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>, Ben
 Skeggs <bskeggs@nvidia.com>
Subject: Re: [PATCH 56/60] drm/nouveau: add support for GB10x
Thread-Topic: [PATCH 56/60] drm/nouveau: add support for GB10x
Thread-Index: AQHbuWA12MqVxDZEbkyf7MEJdtttU7PEkK2A
Date: Mon, 5 May 2025 21:07:32 +0000
Message-ID: <c5d1707b2ce5c171981d9e5bf75cd6bf66bd5b8a.camel@nvidia.com>
References: <20250429233929.24363-1-bskeggs@nvidia.com>
 <20250429233929.24363-57-bskeggs@nvidia.com>
In-Reply-To: <20250429233929.24363-57-bskeggs@nvidia.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.52.3-0ubuntu1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY5PR12MB6526:EE_|DS0PR12MB7728:EE_
x-ms-office365-filtering-correlation-id: 2e154e07-6191-4a86-fdc0-08dd8c18da81
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|1800799024|366016|376014|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?bVByd2lRT2hOZXBwNUR5S0p5S29zMWNFOWV2VnRoMkNRN1BvRkVrdVllQVZ1?=
 =?utf-8?B?UExLdkxlYXp4TERDZGlVUWJ6dHBXWU9iTVAvTXRLNE9sV2NPQjRNdXJ2aEh2?=
 =?utf-8?B?WXZITHdQb1FwSTExSGxCS0ZuV1lVN1o2Kzk4KzJ3b1RuaVVienIvcGFYWExv?=
 =?utf-8?B?MW4wV1hLeUdBR3RXeXg0Z2dhQnRFOVF4b0NxY2w5cDVrMnFPaCtCSWpsQ251?=
 =?utf-8?B?TExNc1V4Mk5tdW9TYnE2cXhxMVU2eWtDampHRXhUR2h3ejZWY1dwZ0Q2VHo2?=
 =?utf-8?B?UlF4YjE2UTdKLzBuVDdNcUtWQ28vM2REN3ZvZjlHQ0lMbHJxTzM3ZjAzQnpk?=
 =?utf-8?B?UTJqT1FJSjRzRVo5c3ZWOGU1QWt1TE8rSHZMSktqc3RXQ2lZZ0FIaHE3eHBS?=
 =?utf-8?B?RFVlTGY5cExrVXRrYWtWY3QxczlPUy9zVXBwZlpCVUY1NnY1WGJodFkrK2Nv?=
 =?utf-8?B?b2Nkb0prdW1oak5QZmhvczNvQ2ZoN1pmdDEwblpmOTlQUW9HRVNFNjEvOStp?=
 =?utf-8?B?VEg4Zm5lZHBrN2lsVUo0V1gyanVEcDBaMXF2OGdDV1N1c2VIVmtmYUJEbENF?=
 =?utf-8?B?TFRTaDFGQllQOFVEd3l3SWtTYWdHNDJ4VWVWSnY2YlBDeDVjNURUcVlBTzVT?=
 =?utf-8?B?QURTMUJlL0RMZzlBeDM4REJ4cUxMelhvN2tOVUMwOU03S05OL0xnaGRYc3RU?=
 =?utf-8?B?c2hDcG8reFBRZmRmMmlPd1lLc0lLKzJCY3VsWG4raDZnK0xIRUt1K1VGWjNh?=
 =?utf-8?B?M3lrVEllbDQ0am5mU0VLWE9hNGRqeERweVpET3ZJb05BRWtUYnMwQzVjckZm?=
 =?utf-8?B?bnJsRWVySlZNREFZY0Y3d29uQzNRMHZUeXRlSUhWbHBMcmFtdWJvZXNqTzJP?=
 =?utf-8?B?enRHaHhVNW9kSjdhMXEzTVBnR2JMTlpndlRsQUx5a1UvYmQ5WUxEcUNYZXlo?=
 =?utf-8?B?MkRpMmx3aDJYSW1HZ0h6QndkRlVpdjg4VWdUQ1gwMjc5OFh0Si83cWJVbWxp?=
 =?utf-8?B?QlcrWUFNQkQ4bndkcE82Y3ZiSThkNC9TN3pXOTJiV01qdlNWTmN1VW4wcXF3?=
 =?utf-8?B?a3kyWUwzbFhlZnNhLzVTNU1qRzlmWUE3aDdQR2ROdmJvZDBzc1l3QVBEdlpJ?=
 =?utf-8?B?b0Npb0lQODhLMGV0OW1uV2gvd2RDYU5WdmJseGlsejc4Ym1zcXBDVEdDa21U?=
 =?utf-8?B?bS82ZlVjMVN3MkkycTF2K1dtWnZnUGpOS2JiaWFrbDI1RkVtR3NBQ2VZTTFB?=
 =?utf-8?B?TFRLVjJrR2dkQnZEYUJjN1pUNU5Qek5PQWh6VUp2UUJYeXBCQlFUNHFUUHlV?=
 =?utf-8?B?SXljVmZwc3NsNDBITEdDM0Z3YkdmZDFLNGhySGpSelJmSzNnelI3TFFPc241?=
 =?utf-8?B?WmxWVi9oRWR5SUN1STA1ZDZyMm5lWWZmSHh5S1pTTkEvUjRGWFkxSzJGUDQw?=
 =?utf-8?B?TDdIN01RVGVmemZKejNCSS93SStoTmlnbXJzcnFNYkJMVkpaQjVvRitPSlA4?=
 =?utf-8?B?a2F5dVZKT2hoTUw5elREYlB2bnUrOGl4bHF2UWVITmd3akVNb1IzZjJ6ejBD?=
 =?utf-8?B?WFEvaFpLVHd1QjVXZE1LUEE1citSMUFyZUsyM2FnUUl1YzhwOEk1dUFMelJQ?=
 =?utf-8?B?SWtVY1dIRjhlR0FiWGtaVWZ6Vkpvc0UyU1ZnZnVxc1YrdjlvaThpQkFGWlVW?=
 =?utf-8?B?QkF6NXltRUFGSko5anh5N2lYNTJBeTNOSnAyejFiQlF5SHk3NWV4UHA3UWNx?=
 =?utf-8?B?TnduN25FZmIrK0FQWEp5KzBoYmRJWjdvaElSb1JBcThJaFloaVVpU1BrbmZ1?=
 =?utf-8?B?T0JYME1JWlRZQzQwSzlRdzhBNktrVnRLU28ycVJwSDBvTngvTTdoRGRUWjBm?=
 =?utf-8?B?dTdhZFNwVkpkRkRBZkFNVjlja2R3UVZJZmdaY01VOERRMlFadEwzdU9MMGt6?=
 =?utf-8?B?VG5OVEZob3c3bThTUnV4SHJGZmR0azlZcFBJTlJkOW10MjQ4RjVRNTdwWFFi?=
 =?utf-8?B?MEZnNnRUWElBPT0=?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR12MB6526.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?TldNZk1JK0NtU0cyRXFHSmh4b3pEak1Va255a0FldTlHQXJJa1ltby9qZ05q?=
 =?utf-8?B?R010eGpqME5OM3hhcnRjQjhxVkliLzJtV1Z0aDN4WDhRekpsMUtqR3NkQ0V1?=
 =?utf-8?B?YmVQSGRZYmFyTUJjL08yUG9MeU14VDdEQStxOE9BZStLazlqc1lacTJpekdH?=
 =?utf-8?B?NnlXSkFwdStsY1EvVXoxdDF2VTl3REJRTXloRm1TMU82cmhoSlVKbmlqMVRz?=
 =?utf-8?B?ZnZkUHZWZUsxKzJSaWl5ZmpPZFRoNm1Bc3EwUjFJN0ZZVExPOENPME55Qjc4?=
 =?utf-8?B?NHF4bmtIU1p5NnNnRHQxak9ObDJ2MWhkdW9mbFBLcVY0MWt4NitTaFVIaEdo?=
 =?utf-8?B?TmJhMTJEaklCdHN3bzl1L3NabEljVmNRVGd5T1hhK09ocWNneStxYkl3Ukh2?=
 =?utf-8?B?aHliY0JSS1NMNkZhcXZjdTY4M2lDYkpWeFVSSWtaNlRBOHNRRUlwUXRCQjNM?=
 =?utf-8?B?TmExNFBLSFpHVllaRWxSUG1xaitWYlJXdVNhVjR2eVZkOENRckpiekxReUJo?=
 =?utf-8?B?UisyRWNQNjVDTmxFTkVyNWZQNlZOYkJVZ2wrQmFKazFzWllodHIwdVRBcTh6?=
 =?utf-8?B?alR0Wldnb2J3MTMxN1BKeHYyNUY5bWUyRm16STBnQk9hMkhxbWtyNjloT3lN?=
 =?utf-8?B?WFoyeWJYRmZmdFBhUEw1QjA0RkNXR01KblRwTGl5NXpmTmM0NkUvQXNDaUZw?=
 =?utf-8?B?QTRvM013MkZLRU5Tby9qdkhPUS9DR1duVmozMGJqV2dZVTgzOUNZZjdOZTAr?=
 =?utf-8?B?SGMrbWdEYllzbXg0TnIzY0hLcEkvdGJibnMyeGZmK0ZpSndoQ1MvME44MXJq?=
 =?utf-8?B?MWdBWkRxRHJ0ZndQdytmQ3VrMUtyZ2QrQTl1cDVWS0lWVUtqL00zK1NBa3oy?=
 =?utf-8?B?NXA3cWRoeWRCMStyWElWR1JGZ3BycG8yNVV0ZEdOVktiaG11Q0lqVkpjRFNx?=
 =?utf-8?B?cUhMQk5ac0YvS05ISVNIYlVUOUNVNkwyNUZXekJEcmxpMU1GRHUwdG5JZXBC?=
 =?utf-8?B?K0lzbU1wYi90VWlQQm9IL1R5YUVDUXdOOVMrMVAvMUZ0THZWbG5ncmRvTFlL?=
 =?utf-8?B?NVB5WENDZHRicGhqQ1ZheitUYThKUnFGK3RVY3dkWlNJZWU4cTlkTEhxMnE2?=
 =?utf-8?B?b2IycVF0WEFBUVB3aHR6ZDRhdWFWWFpWOVNrZ0Q2eWR0MWtNa0RKZlc5UTli?=
 =?utf-8?B?bjJ0VG9mVWF5TkpKMXhNSW1QYUhaMjhXdXhseVpzbHhMR2xrSjRyMWhjeDNR?=
 =?utf-8?B?Ukd5QzZzcS9yTHFDaWM0Mm8vcUFsTjRHL2x0NnVMcHEySHdjV0l4cFc4U0Jw?=
 =?utf-8?B?NUFMYlB1TjZZWkJicFdoYkF0b0hWRVRpd3VEVkJPMVE2VjdwY0FwMG8zN2Nn?=
 =?utf-8?B?OUxYelIyTEc1R0E2Z0lkWU00TXZSeDFSdlRKWThxUXk4clFlcjVwbS9mc0lk?=
 =?utf-8?B?NGRhOXdyTEY4WnFZT1NIdDlvSTlNMUxUOUNzdWpadUdyS0s3UjFVMXV3RDVQ?=
 =?utf-8?B?WUNRZWZPYmVENHl3WFdHdHRDYVIwMllXZWlsSmRORHdWa3Z0bjJhSGYzQ2o5?=
 =?utf-8?B?ZnpQMzZsbDI5UnFhWXJSdFEyK3NCajlXRy92U2l5TFlIMGdIcHJhUVIzM0JJ?=
 =?utf-8?B?UUlaUUpZR0pYZS8yNDNIaTNPbGxvNDR0QXA3Z3J4QnF3MzBqeFhsREJhZEpu?=
 =?utf-8?B?cndQai9CUkE5eHV3UVdEVC9rZTJWRWZ0QVNvMkhWVTNOUGs1bFk2VHdlVk92?=
 =?utf-8?B?TEdObDN4eExYeFZFaGNDNG52S1pwL1R2TzAwckN6Q01lMXN4OFExZmxITEdN?=
 =?utf-8?B?VkFOcWJBbTZ2cEJjS1NXMEhYRUNjUFh1RDBKSjhkUjlJZWpKMHh0dnFibWJ5?=
 =?utf-8?B?VlUvY1VhUjhocnU0TEQ2MDJYZXp6dys3MnFtUVU1UU0ySkIwRk5IeTByWVBS?=
 =?utf-8?B?OFB0Z2VkWDNGUkJnTnY2U1FSY2NCUUViVkZxRXlZb2RNbW8ycDVGNWtoUkhF?=
 =?utf-8?B?S0FVcURDSzBUZWI4cncrUmFYYi9GQ3UwYVBWa29WQTdrR0UxRDNTTEh5NWtp?=
 =?utf-8?B?b0lhMXgyejZCSjA2Slp4WFdQamVramRNa05TMVhOMjNMUkdYQzVFTlJqNVVr?=
 =?utf-8?Q?1BwQim1949IZ5Iaa3TYJ48ihH?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <03AA575EC205714A889CFFEED5D3076F@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY5PR12MB6526.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2e154e07-6191-4a86-fdc0-08dd8c18da81
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 May 2025 21:07:32.9221 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: E/jWNDwgw1y6CNGxJQmteRTvmaRfeO97hQBjURH+GBdSus90Eh9KdHxl4e2brOuS3MTlY24PCTP1Uyz9MPNqwg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7728
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

T24gV2VkLCAyMDI1LTA0LTMwIGF0IDA5OjM5ICsxMDAwLCBCZW4gU2tlZ2dzIHdyb3RlOg0KPiAr
c3RhdGljIGNvbnN0IHN0cnVjdCBudmttX2ZzcF9mdW5jDQo+ICtnYjEwMF9mc3AgPSB7DQo+ICsJ
LndhaXRfc2VjdXJlX2Jvb3QgPSBnaDEwMF9mc3Bfd2FpdF9zZWN1cmVfYm9vdCwNCj4gKwkuY290
ID0gew0KPiArCQkudmVyc2lvbiA9IDIsDQo+ICsJCS5zaXplX2hhc2ggPSA0OCwNCj4gKwkJLnNp
emVfcGtleSA9IDk3LA0KPiArCQkuc2l6ZV9zaWcgPSA5NiwNCj4gKwkJLmJvb3RfZ3NwX2ZtYyA9
IGdoMTAwX2ZzcF9ib290X2dzcF9mbWMsDQo+ICsJfSwNCj4gK307DQoNCkkgd29uZGVyIGlmIHRo
aXMgaXMgYSB1c2VmdWwuICBUaGUgUk0gY29kZSB0aGF0IHRlc3RzIGZvciB0aGVzZSBzaXplcyBp
cyBhdXRvLWdlbmVyYXRlZCwgc28gaXQNCmF1dG9tYXRpY2FsbHkgbWF0Y2hlcy4gIENvbnRyYXN0
IHRoYXQgd2l0aCB0aGUgRUxGIGltYWdlIHRoYXQgaXMgcHJvdmlkZWQgdG8gTm91dmVhdSwgd2hl
cmUgdGhlDQpzaXplcyBhcmUgc3BlY2lmaWVkIGluIHRoZSBzZWN0aW9uIGhlYWRlci4gwqANCg0K
TGV0J3Mgc2F5IHdlIHVwZGF0ZSB0aGUgZmlybXdhcmUgYWdhaW4sIGFuZCB0aGUgbmV3ZXIgZmly
bXdhcmUgd29ya3MgYXMtaXMsIGJ1dCBzb21lIG9mIHRoZSBtZXRhZGF0YQ0Kc2l6ZXMgYXJlIGRp
ZmZlcmVudCAoZS5nLiBzaXplX3BrZXkgaXMgMTEzKS4gIFdlIHdvdWxkIG5lZWQgdG8gY3JlYXRl
IGEgbmV3IHZlcnNpb24tc3BlY2lmaWMgc3RydWN0LA0KZGVzcGl0ZSB0aGUgZmFjdCB0aGF0IHRo
ZSBFTEYgaW1hZ2UgYWxyZWFkeSB0ZWxscyB5b3UgZXZlcnl0aGluZyB5b3UgbmVlZCB0byBrbm93
Lg0KDQoNCg0K
