Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1322D942259
	for <lists+nouveau@lfdr.de>; Tue, 30 Jul 2024 23:49:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E9B2F10E057;
	Tue, 30 Jul 2024 21:49:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="nq96PXGx";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2042.outbound.protection.outlook.com [40.107.92.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EAFDA10E057
 for <nouveau@lists.freedesktop.org>; Tue, 30 Jul 2024 21:49:22 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=L5lJMDrbzwhZp0jmW0EF8JUeGYmzZjgJMLDRQ6vNGSiXSK6/fDh2K8ehdh660jiqoowKliU8Ch46JSqYn9pn42eHeDT660pFZGA7fw5T88EsEZBGwpVl2Q619zac4+gqJFC3jjs5NW3ARXjdoCuIk9bSR139lGep1iEo30si9QG9WTSSas3MgFwBlF4VEKa9n4EGpkyd4j2ptlgWrn/v4FI94VWUzXeLj21qhWC8nmb/I8TC51+FdcwK5A2RksH1F1BNlIWkBMT8Upa2nEZ1vHJybh8vlR68wBRUBvKYgEW2lJ6QiItU/FbDjVuNc1rilorn5UYr4bwRJ2ndYx5jSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=H4OhhcO58/z5GGFUJlQDTC+obzwbKm4Y7DSTAFZM9+c=;
 b=WSznwBMFr4gkAFcI5SuzlIdW3WKNmlrvkHi2luszjzFQY0u5Gem1elRFTt9wXOz7ef2ixvT1uxaRgQM5e04rnmlwvFpmPAbYKKgrjYltBZB6Z3WMGk8ltZ02TMWsxJDqaWOLuoF1XK8lavtJLJnsSvLsgkAgX5WEkvt1BTVuWM7jpW21771ZTsih1NNZ6AgYZSBVQdfZHEv8zpW0uu3JDDNPISInNR5zKpLT56CP4ruBqdWlLBXgqiZpuNwhGJZgzM/LDqGzh7m4h3Sgzgz7WH1Z5j0nSV2uVbOf1ATW0d6i5eSv86LjYHnKlTIXC6QWP8pm/xg7ah/JKS20Wffndg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=H4OhhcO58/z5GGFUJlQDTC+obzwbKm4Y7DSTAFZM9+c=;
 b=nq96PXGxLAT3UJNiBWoqKA9v9FbYOlhNXgHpXOA1Z0Dy9Y8nzTcjVVPBwhIpIzCmx08nOu3BFbuDPw0/fNVcoLgccKQifXJKc5xgXE9NTZg458E0H5xZOX+YsVro8Gra9NtwJR1SE0qgOFHePUbOLJLmc/6DxqB2t5YFA0+zAc6SyfRmOWTYcQle6h2Ce5/FPLbd8AB4qpWc31j4DR6cy7xmLQrKDajIfYrj9lGJA25e/2MDYz157rl8nojE6XM5NascCmIMhIEQg2BuYxfwzsKowKV+4+EnYysmxWMtu6XGL6N162X3ceukY/Z+xbbU3QhaCHX+2CxVasaD1tcu3w==
Received: from DM4PR12MB5277.namprd12.prod.outlook.com (2603:10b6:5:390::7) by
 DM4PR12MB6061.namprd12.prod.outlook.com (2603:10b6:8:b3::5) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7828.20; Tue, 30 Jul 2024 21:49:16 +0000
Received: from DM4PR12MB5277.namprd12.prod.outlook.com
 ([fe80::9ab:5367:ba51:af6e]) by DM4PR12MB5277.namprd12.prod.outlook.com
 ([fe80::9ab:5367:ba51:af6e%3]) with mapi id 15.20.7807.026; Tue, 30 Jul 2024
 21:49:16 +0000
From: Timur Tabi <ttabi@nvidia.com>
To: "dakr@kernel.org" <dakr@kernel.org>
CC: "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>, Ben
 Skeggs <bskeggs@nvidia.com>, "airlied@gmail.com" <airlied@gmail.com>,
 "dakr@redhat.com" <dakr@redhat.com>
Subject: Re: [PATCH 2/2] [v6] drm/nouveau: expose GSP-RM logging buffers via
 debugfs
Thread-Topic: [PATCH 2/2] [v6] drm/nouveau: expose GSP-RM logging buffers via
 debugfs
Thread-Index: AQHa4gwhumoUirve7kybvFxJvluwnrIOaOIAgAFnqYA=
Date: Tue, 30 Jul 2024 21:49:15 +0000
Message-ID: <80882b5b7726af1a7a861dccb437e9cb0c84370e.camel@nvidia.com>
References: <20240729230720.1305760-1-ttabi@nvidia.com>
 <20240729230720.1305760-2-ttabi@nvidia.com> <ZqgyJlXclrP19bNe@cassiopeiae>
In-Reply-To: <ZqgyJlXclrP19bNe@cassiopeiae>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.44.4-0ubuntu2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR12MB5277:EE_|DM4PR12MB6061:EE_
x-ms-office365-filtering-correlation-id: 6c49db1c-87f9-4a49-4689-08dcb0e17535
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?RndHdHNGc1BoblhWeDJYMEowSCtuc3VJM3dpUmd5YmtuWVppRUgxdGZLa09K?=
 =?utf-8?B?V2Q1Z010VExaYWtHbFZxeERxbkppdXVLSDl4OVZzUkNSSGlLNXdKaTRZQ1Fn?=
 =?utf-8?B?aXhyU2NLeGZtUWZkdHJtK2tUNWpndUNrYkkzbEJJeno1SGREMUdNQk5VK1Z2?=
 =?utf-8?B?cS9SeTdZaTY2NlpOYmk0S25BN1NHU2szZmpsc3VPdUQxNFVUbG84YnpGYVQ5?=
 =?utf-8?B?N1V4dGxPMEJmRkhpcFphZDFGRnpsSEE1UWJlbWFlTlZhWWo2b0RLOXVPNE1X?=
 =?utf-8?B?TnFXd1NSMUJmYkwwZmFRZHlKdDdVR0hESFAzR241RVJmS0IvUXdrS1V5cGlL?=
 =?utf-8?B?UmIyQkY1ZlRlaUlvQ2VWdWtQejdnaStsRzJMY2gvSUEvdmJ0TmtZVkV2RlRk?=
 =?utf-8?B?S0ZmK2RDMjBLM0RxTno3VTFBdjhxL3JwN2ozNVFvRVYybDNHR1hCYkV2SzRt?=
 =?utf-8?B?YTBiZ0paNEpPVFhTWkxYNkFHamJLY0IvY3RHU2VReWVZakVRTGpDZDBsWjJt?=
 =?utf-8?B?V2tQbEhMZkJLMEJLMnU1UGpWWHkxcGl0WUg4Tkd5NUkwSlZodGRDOW9nL3VJ?=
 =?utf-8?B?T1lXNkEyR2NIQXhXZS9PNmwzT0ZRRGVTSHFkd3lMRDBPbnd3RlhsR0FKNFhh?=
 =?utf-8?B?Z1Qzb1hiZlBseWdVUm9jOW9tT0NvazJHOE4xY3Bac3RjMXVXdFhVNngzdks1?=
 =?utf-8?B?RjlNZkJtbGZRSXd3Z3ZDRUFqT3R0MU96REcrWDVyaXg2bXJOTDRnbFJuNVMx?=
 =?utf-8?B?V1BiWVlHNzRManh5OE1BNWphVFJobHFQeW9OZWtieXQ2b0NqdmE0UFQ1L1N5?=
 =?utf-8?B?VzQrT2ZsNU1qRVBvc0xVVW9RLzFNMlAxdnNybXJxM3ZqMFV0SXRxK3BYaTZa?=
 =?utf-8?B?OWN3QWlCUkVSQVNxVzkwMFQ1MzNkWlpLSEpVMVd0VDZDYXRhT0VTWURaVVpB?=
 =?utf-8?B?L0M3anExRVJscUwrajNTMjU0SVpKbHgvWmhsZS94STNuaHVpczlBZEZGcXJv?=
 =?utf-8?B?RE80Q2N4MXBCUmNKRjZock94aHNlVUl0dlFoRitkSmdGMjMvMWRuNlVJQjBO?=
 =?utf-8?B?emlFc1NqTzZjVDVybDVOVGx1NXdlTno1U2pZeFdpVmF0dm5kTFkyMWtwZzl6?=
 =?utf-8?B?empIT2xVR0lCSWNuVW1MejhxTFB1TFRLSEdxVkh2aTBTOUdmL0c4THF6bmd1?=
 =?utf-8?B?RzMzcE91MGhjUWVaWUNhMjNWU3NLcklYTHZuV3NhWDRQR2lwQ04wWmxNR2p1?=
 =?utf-8?B?RGN3KzZ1NTR0UUZzclUyZnlCcWFZM0ZQYUhWMlBGSXV6MHJ3MmY4cmZIbkJ5?=
 =?utf-8?B?NnlvdUxubGJHNXloMGpnNklmNDYwMnRqMnlUY1MvU21SbHhmemlmTkF0UGhW?=
 =?utf-8?B?M05HOFFhdC95aGRSVUo5T2ZlM0M1MklHOUp1TE5aTXZYM243N1MyMkltUEs3?=
 =?utf-8?B?L1hXOHlGZCt2SkY0VlpvSmZuOVFzWGtVUmQ3cERPS201QWs5M05rSXlZeHFv?=
 =?utf-8?B?K2g4T1JNWUJuWDRZQndvSXlEay9KdWFUUHR0NWVER0IrZEp6RTluUVdTOUx2?=
 =?utf-8?B?SVk1aUZ4cm9zWFFnKzcrTUpjZWdHMC91Q01QQ21td0VZb1g1cEVmZ3ZmTkZB?=
 =?utf-8?B?M1FnRDQ1VERnWVNKbUgvU0s0c0doenZFVGdGV0l0b2ROY3NnTmlHOGJoMGZa?=
 =?utf-8?B?aW12MTBuN1BnSTRCZ0F4MWowMExUS1pXSzQwZkplSU85Qm1CbFhnajk4bEFR?=
 =?utf-8?B?aGhJY2t2RURHMmxMTExlcFVhbWV3TkRmOERka1M0VFBiYnFobC9aUGxITEtN?=
 =?utf-8?B?SStYM2IzWDdJSjZ5UldBempnUURPZitrRFlsZWZ6dDFPYm9lZWlGSHNIMk1M?=
 =?utf-8?B?c1V1T1ExekhkQUViOXdqV3pzeWxxRUtlQm9nRWtQUkRBWmc9PQ==?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR12MB5277.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?MWhjRno2VVEva251ckEzZkVXMTRaUmx4RDNUdDZWVkFMN0xGM3hzcGFoUXND?=
 =?utf-8?B?bXlCbUN5Wjl3TjF2SHhveTd6RXRtZytVbVQ3Q0hGVGRCTDVVcm9MMmtLZ1o2?=
 =?utf-8?B?dnNwZTNEdnZTbnA2a1NHS2dzT0oxUUNObDlxSHBSWjBUR3ppc1I0czR2ZCt5?=
 =?utf-8?B?WGJLOWdoS1huOTRPeFEyUkZrSEdKTlpMT3hXUDlWRTdteGpUa1R2Uzd5YWQv?=
 =?utf-8?B?UVVvK1ppNXM2QlE0YkJGREVlRmNIYnI1Q3NiUGVqcnBBSG9JYTI5SStibWhH?=
 =?utf-8?B?eHFCSDlDa2RMWHZlaW10UmdWNi9vVmRLM0hMTnhoS2hmNnRHTnloZTViMVZJ?=
 =?utf-8?B?Vm1XUVpBMnlpMVFteVZBYktubFcxTjhtR2R6NXRGK1pEWjN2UTliaDdVSG9L?=
 =?utf-8?B?c2pFcFNjNlplMzYyZy9xbjBqYU9yZVBGaEhMcGJFT25WcDVIWUpveit1RVNv?=
 =?utf-8?B?K0toTmNrTWtFRDVDOEhxc01oRUlLU0F1WHNCdkhLTjE4bStwS2FvWmNBRFc0?=
 =?utf-8?B?N0ZsNFBpc2d2Nm92YlpjY2F2ZFNRWXdCenlXUG12dUlhS1JZQ2tleHZjMGlw?=
 =?utf-8?B?Q0prSVI0ZklDZkk4QzhqL2JvSytnamR3clFUdWs4eDdMSDFLS2E3LytTaE1h?=
 =?utf-8?B?aEpCSVZQWVBjaUpDNDk4L3U4RS9JNFhaWWNsUnpMdm43aGhhSXB0UCtzVG1k?=
 =?utf-8?B?VE43cVJ0cmk4bmFCcExqK0EvakhhSytlSVhvK0ZoWk5QaTR4MFJ3V3hXQzZH?=
 =?utf-8?B?Skp0Vy9mVGdyZlBTd0NFR3FNeUU0QnB4RGt0SmF2T2k3bjZlZXJqRWs4dHZE?=
 =?utf-8?B?K1NSc081N2VmUjVqZlhFaEZ6am9CdzFxRVh0a3B3L0NPYlRaS0V5TkJnWlVt?=
 =?utf-8?B?d0N1Z1h0aGxwNkdtcEdScWVEcVd6eXZhYjd3aVlwQ3dUckI0TkQ0UzhtOE5I?=
 =?utf-8?B?WTg5ekovTzdBTEtjWTVINC9xNFN3VmNJZFVqSGRpMnIrRmIweUZxWkZ0R1Rh?=
 =?utf-8?B?M2xXZThwcTFYSVd3TTF3ai9TMS9PZFovSGhla1dvRkZ1SzFxQmV3YkNYczM1?=
 =?utf-8?B?dFl3OFVGMjFMR282ZU5zWERtV3lzZ3JyVnJuQzRJVE1wOU1lU1lLc0QzYXIz?=
 =?utf-8?B?OUQ3Q0xKRmphMjBKdzJ6VEEySVlnUmdtRHFIT0hZRDVTbEdyUVk2QTA5UGE3?=
 =?utf-8?B?TUV4MkQwTVhzekgwSHREbitWL1dOMWlIT0VJM2Ivemlidm8yNFZFd1hLYmdW?=
 =?utf-8?B?UENqTUo2UFRuOXUwbEFlZkN3dHo5TXFkU2xVRTE1UkkvdjNGdXQrd2FONGY4?=
 =?utf-8?B?d2ZXR2JyT2N3K1JaRktyTzB5MllBRFZrTFljZ3F5YVphNExjUC9FeGNFeDNP?=
 =?utf-8?B?eWg1LzNVOURqUjNZUU1PeTJublBvQklEMllPQWsreW1MU29YMmYzSUFYcVIr?=
 =?utf-8?B?RngxZkZ5S1A2S2JNU0ZoZ1BjQkJ2UVpzZTdyLy90WE1ERnRhMzJBMURhVkRi?=
 =?utf-8?B?amI1Q2VpRkNJdWxQMmhqTTI2U3dPU1pNUEcza3BITXY3Wm9GSEE0dFR6Nlpo?=
 =?utf-8?B?Nytza3p3blRyeU4wWG9YRVNNVlJ0RUx4cTFtVVFlWkp2Z0w0R2F5djZTeEV4?=
 =?utf-8?B?bzg0Nkp4MFRPalV2SFd2ZzZiWVNkclpzMmdGYzlrUDJOQkswOHpVMklVMjBU?=
 =?utf-8?B?R2tsTGFXRk9ramoxTHZ1Q1hNaXN4WWZLRndKUSt4Z2MybUNYRE1YTUpjQlhL?=
 =?utf-8?B?VUJRWmF1MEk3TFpYM0wyNnZwQ3dUYnlDTXZyRXlmUHNMcFMvR25iS3RVYVlL?=
 =?utf-8?B?QWpUUkpJN0E1R1RRSWw3bk9GMklicy8xeUtnOHFjMXJ4bFhNOVJpOUZidGlP?=
 =?utf-8?B?WE10MDU4SWNIaWR5c0RKcUJHbG1kZ2J2ZklNK3granF6czZHNGExL2ViMVVB?=
 =?utf-8?B?MGc1bnE5UHVNTW1CWDRMdUk0eUxtenBoRnYzNmxQQlVGVC9vTm1CYzdhYmVW?=
 =?utf-8?B?N0J2eWxoMmpmQ1pZeWtrclRTNEx6UHRhM2NkR2M3cjBZQmViSCt6eS9XSFAz?=
 =?utf-8?B?Z295L1c0Y0REYy9CdWxKSWY1d2VZTlV4eWdGVUlJVDV4THRjNWRKVTVBOTB0?=
 =?utf-8?Q?WWm6P353wjGmAW8NXFuUrd/Dk?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <0D2519676AB3B6468B5F359507B3C164@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB5277.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6c49db1c-87f9-4a49-4689-08dcb0e17535
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Jul 2024 21:49:16.0181 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /GxFBJtrxxrRtCaodUSxXwuzqO9y4YeUfMWGhXXc0vs8KPhZ4NnrOAKj9CHOQLKEmwuRBBm0gP9s8eZmC8LnGw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6061
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

T24gVHVlLCAyMDI0LTA3LTMwIGF0IDAyOjIxICswMjAwLCBEYW5pbG8gS3J1bW1yaWNoIHdyb3Rl
Og0KPiBIaSBUaW11ciwNCj4gDQo+ID4gVGhpcyBtZXRob2QgaGFzIHRoZSBhZHZhbnRhZ2UgdGhh
dCBpdCBhbGxvd3MgdGhlIGJ1ZmZlcnMgdG8gYmUgcGFyc2VkDQo+ID4gZXZlbiB3aGVuIHRoZSBs
b2dnaW5nIEVMRiBmaWxlIGlzIG5vdCBhdmFpbGFibGUgdG8gdGhlIHVzZXIuIEhvd2V2ZXIsDQo+
ID4gaXQgaGFzIHRoZSBkaXNhZHZhbnRhZ2UgdGhlIGRlYnViZnMgZW50cmllcyBuZWVkIHRvIHJl
bWFpbiB1bnRpbCB0aGUNCj4gDQo+IGRlYnViZnMgLT4gZGVidWdmcw0KDQpPaw0KDQo+ID4gZHJp
dmVyIGlzIHVubG9hZGVkLg0KPiA+IA0KPiA+IFRoZSBidWZmZXJzIGFyZSBleHBvc2VkIHZpYSBk
ZWJ1Z2ZzLiBJZiBHU1AtUk0gZmFpbHMgdG8gaW5pdGlhbGl6ZSwNCj4gPiB0aGVuIE5vdXZlYXUg
aW1tZWRpYXRlbHkgc2h1dHMgZG93biB0aGUgR1NQIGludGVyZmFjZS4gVGhpcyB3b3VsZA0KPiA+
IG5vcm1hbGx5IGFsc28gZGVhbGxvY2F0ZSB0aGUgbG9nZ2luZyBidWZmZXJzLCB0aGVyZWJ5IHBy
ZXZlbnRpbmcgdGhlDQo+ID4gdXNlciBmcm9tIGNhcHR1cmluZyB0aGUgZGVidWcgbG9ncy4NCj4g
PiANCj4gPiBUbyBhdm9pZCB0aGlzLCBpbnRyb2R1Y2UgdGhlIGtlZXAtZ3NwLWxvZ2dpbmcgY29t
bWFuZCBsaW5lIHBhcmFtZXRlci4NCj4gPiBJZiBzcGVjaWZpZWQsIGFuZCBpZiBhdCBsZWFzdCBv
bmUgbG9nZ2luZyBidWZmZXIgaGFzIGNvbnRlbnQsIHRoZW4NCj4gPiBOb3V2ZWF1IHdpbGwgbWln
cmF0ZSB0aGVzZSBidWZmZXJzIGludG8gbmV3IGRlYnVnZnMgZW50cmllcyB0aGF0IGFyZQ0KPiA+
IHJldGFpbmVkIHVudGlsIHRoZSBkcml2ZXIgdW5sb2Fkcy4NCj4gPiANCj4gPiBBbiBlbmQtdXNl
ciBjYW4gY2FwdHVyZSB0aGUgbG9ncyB1c2luZyB0aGUgZm9sbG93aW5nIGNvbW1hbmRzOg0KPiA+
IA0KPiA+ICAgICBjcCAvc3lzL2tlcm5lbC9kZWJ1Zy9kcmkvPHBhdGg+L2xvZ2luaXQgbG9naW5p
dA0KPiA+ICAgICBjcCAvc3lzL2tlcm5lbC9kZWJ1Zy9kcmkvPHBhdGg+L2xvZ3JtIGxvZ3JtDQo+
ID4gICAgIGNwIC9zeXMva2VybmVsL2RlYnVnL2RyaS88cGF0aD4vbG9naW50ciBsb2dpbnRyDQo+
ID4gICAgIGNwIC9zeXMva2VybmVsL2RlYnVnL2RyaS88cGF0aD4vbG9ncG11IGxvZ3BtdQ0KPiA+
IA0KPiA+IHdoZXJlIDxwYXRoPiBpcyB0aGUgUENJIElEIG9mIHRoZSBHUFUgKGUuZy4gMDAwMDo2
NTowMC4wKS4NCj4gDQo+IEkgdGhpbmsgdGhpcyBkZXBlbmRzIG9uIHRoZSBhY3R1YWwgZGV2aWNl
IHR5cGUuIENvdWxkIGFsc28gYmUgYSBwbGF0Zm9ybSBvciBldmVuDQo+IGF1eCBkZXZpY2UuDQo+
IA0KPiBObyBuZWVkIHRvIGFkZCBtb3JlIGV4YW1wbGVzIHRob3VnaCwgSSB0aGluayBpdCdzIGVu
b3VnaCBpZiB3ZSBqdXN0IGNoYW5nZQ0KPiB0aGlzIHRvOg0KPiANCj4gIndoZXJlIChmb3IgYSBQ
Q0kgZGV2aWNlKSA8cGF0aD4gaXMgdGhlIFBDSSBJRCBvZiB0aGUgR1BVIChlLmcuIDAwMDA6NjU6
MDAuMCkuIg0KDQpJJ2xsIG1ha2UgdGhlIGNoYW5nZSwgYnV0IEFGQUlLIG5vbi1QQ0kgdmVyc2lv
bnMgb2YgVHVyaW5nKyBHUFVzIGRvIG5vdA0KZXhpc3QuICBFdmVuIHRoZSBHSDEwMCwgd2hpY2gg
dXNlcyBhbiBudmxpbmsgZGF0YSBjb25uZWN0aW9uIGJldHdlZW4gR1BVIHRvDQp0aGUgQVJNIGhv
c3QsIHN0aWxsIHVzZXMgUENJIGZvciBjb250cm9sLg0KDQo+ID4gDQo+ID4gKy8qKg0KPiA+ICsg
KiBudmlmX2xvZyAtIHN0cnVjdHVyZSBmb3IgdHJhY2tpbmcgbG9nZ2luZyBidWZmZXJzDQo+ID4g
KyAqIEBlbnRyeTogYW4gZW50cnkgaW4gYSBsaXN0IG9mIHN0cnVjdCBudmlmX2xvZ3MNCj4gPiAr
ICogQHNodXRkb3duOiBwb2ludGVyIHRvIGZ1bmN0aW9uIHRvIGNhbGwgdG8gY2xlYW4gdXANCj4g
PiArICoNCj4gPiArICogU3RydWN0dXJlIHVzZWQgdG8gdHJhY2sgbG9nZ2luZyBidWZmZXJzIHNv
IHRoYXQgdGhleSBjYW4gYmUgY2xlYW5lZA0KPiA+IHVwDQo+ID4gKyAqIHdoZW4gdGhlIGRyaXZl
ciBleGl0cy4NCj4gDQo+ICJEcml2ZXIgZXhpdCIgaXMgYSBiaXQgb2YgYW4gdW5kZWZpbmVkIHRl
cm0sIHRoZSBjbG9zZXN0IHRoaW5nIGlzIHByb2JhYmx5DQo+ICJkcml2ZXIgZGV0YWNoIiAoZnJv
bSBhIGRldmljZSkuIEluIHRoaXMgY2FzZSBJIHRoaW5rIHlvdSBhY3R1YWxseSBtZWFuDQo+ICJt
b2R1bGUNCj4gZXhpdCIgdGhvdWdoLg0KDQpZZXMsIEkgdXNlIGRyaXZlciBhbmQgbW9kdWxlIGlu
dGVyY2hhbmdlYWJseSwgYnV0IEkgZ3Vlc3MgdGhhdCdzIG5vdA0KYWNjdXJhdGUuDQoNCj4gPiAr
ICoNCj4gPiArICogVGhlIEBzaHV0ZG93biBmdW5jdGlvbiBpcyBjYWxsZWQgd2hlbiB0aGUgZHJp
dmVyIGV4aXRzLiBJdCBzaG91bGQNCj4gPiBmcmVlIGFsbA0KPiANCj4gU2FtZSBoZXJlLg0KDQpJ
IHJlcGxhY2VkICdkcml2ZXInIHdpdGggJ21vZHVsZScuDQoNCj4gDQo+ID4gKyAqIGJhY2tpbmcg
cmVzb3VyY2VzLCBzdWNoIGFzIGxvZ2dpbmcgYnVmZmVycy4NCj4gPiArICovDQo+ID4gK3N0cnVj
dCBudmlmX2xvZyB7DQo+ID4gKwlzdHJ1Y3QgbGlzdF9oZWFkIGVudHJ5Ow0KPiA+ICsJdm9pZCAo
KnNodXRkb3duKShzdHJ1Y3QgbnZpZl9sb2cgKmxvZyk7DQo+ID4gK307DQo+ID4gKw0KPiA+ICsj
ZGVmaW5lIE5WSUZfTE9HU19ERUNMQVJFKF9sb2cpIFwNCj4gPiArCXN0cnVjdCBudmlmX2xvZyBf
bG9nID0geyBMSVNUX0hFQURfSU5JVChfbG9nLmVudHJ5KSB9DQo+IA0KPiBJZiB5b3UgZGVjbGFy
ZSB0aGlzIGFzDQo+IA0KPiAJI2RlZmluZSBOVklGX0xPR1NfREVDTEFSRShfbG9nKSBcDQo+IAkJ
c3RydWN0IG52aWZfbG9nIF9sb2cgPSB7IExJU1RfSEVBRF9JTklUKF9sb2cuZW50cnkpLCBudmlm
X2xvZ19zaHV0ZG93biB9DQo+IA0KPiBhbmQgY2hhbmdlIHRoZSBzaWduYXR1cmUgb2YgbnZpZl9s
b2dfc2h1dGRvd24oKSB0bw0KPiANCj4gCXN0YXRpYyBpbmxpbmUgdm9pZCBudmlmX2xvZ19zaHV0
ZG93bihzdHJ1Y3QgbnZpZl9sb2cgKmxvZ3MpDQo+IA0KPiB5b3UgY2FuIGp1c3QgY2FsbA0KPiAN
Cj4gCWdzcF9sb2dzLnNodXRkb3duKCZnc3BfbG9ncyk7DQo+IA0KPiBpbiBub3V2ZWF1X2RybV9l
eGl0KCkuDQo+IA0KPiBBZG1pdHRlZGx5LCBtYXliZSBhIGJpdCB0b28gc25lYWt5IHRob3VnaC4g
OikNCg0KZ3NwX2xvZ3Muc2h1dGRvd24oJmdzcF9sb2dzKSAtLSBhcmUgeW91IHN1cmUgeW91IHdh
bnQgdGhpcz8gwqBUaGlzIGlzIHNvbWUNCndlaXJkIEMrKyB3YW5uYS1iZSBjb2RlLCBJTUhPLiDC
oEkgZG9uJ3QgdGhpbmsgdGhpcyBpcyBhbiBpbXByb3ZlbWVudC4gIEknZA0KcmF0aGVyIGtlZXAg
aXQgYXMtaXMuDQoNCj4gPiArLyoNCj4gPiArICogR1NQLVJNIHVzZXMgYSBwc2V1ZG8tY2xhc3Mg
bWVjaGFuaXNtIHRvIGRlZmluZSBvZiBhIHZhcmlldHkgb2YgcGVyLSJlbmdpbmUiDQo+ID4gKyAq
IGRhdGEgc3RydWN0dXJlcywgYW5kIGVhY2ggZW5naW5lIGhhcyBhICJjbGFzcyBJRCIgZ2VuZXJl
cmF0ZWQgYnkgYQ0KPiA+ICsgKiBwcmUtcHJvY2Vzc29yLiBUaGlzIGlzIHRoZSBjbGFzcyBJRCBm
b3IgdGhlIFBNVS4NCj4gPiArICovDQo+ID4gKyNkZWZpbmUgTlZfR1NQX01TR19FVkVOVF9VQ09E
RV9MSUJPU19DTEFTU19QTVUJCTB4ZjNkNzIyDQo+ID4gKw0KPiA+ICsvKioNCj4gPiArICogcnBj
X3Vjb2RlX2xpYm9zX3ByaW50X3YxRV8wOCAtIFJQQyBwYXlsb2FkIGZvciBsaWJvcyBwcmludCBi
dWZmZXJzDQo+IA0KPiBJcyB0aGlzIHN0cnVjdHVyZSB2ZXJzaW9uZWQ/IElmIHNvLCBkb2VzIGl0
IHJlbGF0ZSB0byBhIHNwZWNpZmljIEdTUC1STSB2ZXJzaW9uPw0KDQpZZXMsIHRoZSBzdHJ1Y3R1
cmUgaXMgdmVyc2lvbmVkLCBidXQgaXQncyBhIGxpdHRsZSB3ZWlyZC4gIFdoZW4gYSBuZXcgUlBD
IGlzDQphZGRlZCwgdGhlIGRldmVsb3BlciBjYW4gY2hvb3NlIHRvIHVzZSBhbnkgdmVyc2lvbiBu
dW1iZXIgdGhhdCBtYXRjaGVzIHRoZQ0KImN1cnJlbnQiIFZHUFUgdmVyc2lvbiBvciBlYXJsaWVy
LiAgc3JjL252aWRpYS9nZW5lcmF0ZWQvZ19ycGMtc3RydWN0dXJlcy5oDQppcyBnZW5lcmF0ZWQg
ZnJvbSBhIHNwZWNpYWwgImRlZiIgZmlsZSwgYW5kIHRoZSBkZXZlbG9wZXIganVzdCBjaG9vc2Vz
DQp3aGF0ZXZlciBudW1iZXIgaGUgd2FudHMuICBUeXBpY2FsbHksIHRoZSBkZXZlbG9wZXIgd2ls
bCBjaG9vc2Ugd2hhdGV2ZXINCnZlcnNpb24gdGhhdCBWR1BVIGlzIGF0IHdoZW4gaGUgc3RhcnRz
IHdvcmtpbmcgb24gdGhlIGNvZGUuICBCdXQgc2luY2UgdGhpcw0KaXMgdGhlIGZpcnN0IGFuZCBv
bmx5IHZlcnNpb24gb2YgcnBjX3Vjb2RlX2xpYm9zX3ByaW50LCBoZSBjb3VsZCBoYXZlIGNob3Nl
bg0KdjAxXzAwLg0KDQpTbyAicHJldmlvdXMgUlBDIHZlcnNpb24gKGlmIGl0IGV4aXN0cykiIDwg
Im5ldyBSUEMgdmVyc2lvbiIgPD0gImN1cnJlbnQNClZHUFUgdmVyc2lvbiIgYXQgdGhlIHRpbWUg
dGhlIFJQQyB3YXMgY3JlYXRlZC91cGRhdGVkLg0KDQo+ID4gK3N0YXRpYyB2b2lkDQo+ID4gK3I1
MzVfZ3NwX2xpYm9zX2RlYnVnZnNfaW5pdChzdHJ1Y3QgbnZrbV9nc3AgKmdzcCkNCj4gPiArew0K
PiA+ICsJc3RydWN0IGRlbnRyeSAqZGlyLCAqZGlyX2luaXQ7DQo+ID4gKwlzdHJ1Y3QgZGVudHJ5
ICpkaXJfaW50ciA9IE5VTEwsICpkaXJfcm0gPSBOVUxMLCAqZGlyX3BtdSA9IE5VTEw7DQo+ID4g
KwlzdHJ1Y3QgZGV2aWNlICpkZXYgPSBnc3AtPnN1YmRldi5kZXZpY2UtPmRldjsNCj4gPiArDQo+
ID4gKwkvKiBFYWNoIEdQVSBoYXMgYSBzdWJkaXIgYmFzZWQgb24gaXRzIGRldmljZSBuYW1lLCBz
byBmaW5kIGl0ICovDQo+ID4gKwlzdHJ1Y3QgZHJtX2RldmljZSAqZHJtX2RldiA9IGRldl9nZXRf
ZHJ2ZGF0YShkZXYpOw0KPiA+ICsNCj4gPiArCWlmICghZHJtX2RldiB8fCAhZHJtX2Rldi0+ZGVi
dWdmc19yb290KSB7DQo+IA0KPiBJIGRvbid0IHRoaW5rIHdlIG5lZWQgYW55IG9mIHRob3NlIGNo
ZWNrcywgcGxlYXNlIHJlbW92ZSB0aGVtLg0KDQpPaw0KDQo+ID4gKwludmttX2RlYnVnKCZnc3At
PnN1YmRldiwgImNyZWF0ZWQgZGVidWdmcyBHU1AtUk0gbG9nZ2luZyBlbnRyaWVzXG4iKTsNCj4g
PiArDQo+ID4gKwlpZiAoa2VlcF9nc3BfbG9nZ2luZykgew0KPiA+ICsJCW52a21fd2FybigmZ3Nw
LT5zdWJkZXYsDQo+IA0KPiBudmttX2luZm8oKSBpcyBwcm9iYWJseSBlbm91Z2guDQoNCk9rLg0K
DQo+ID4gK3N0YXRpYyB2b2lkIHI1MzVfZ3NwX3JldGFpbl9sb2dnaW5nKHN0cnVjdCBudmttX2dz
cCAqZ3NwKQ0KPiA+ICt7DQo+ID4gKwlzdHJ1Y3QgZGV2aWNlICpkZXYgPSBnc3AtPnN1YmRldi5k
ZXZpY2UtPmRldjsNCj4gPiArCXN0cnVjdCBkZW50cnkgKnJvb3QsICpkaXI7DQo+ID4gKwlzdHJ1
Y3QgcjUzNV9nc3BfbG9nICpsb2c7DQo+ID4gKwlpbnQgcmV0Ow0KPiA+ICsNCj4gPiArCS8qIElm
IHdlIHdlcmUgdG9sZCBub3QgdG8ga2VlcCBsb2dzLCB0aGVuIGRvbid0LiAqLw0KPiA+ICsJaWYg
KCFrZWVwX2dzcF9sb2dnaW5nKQ0KPiA+ICsJCXJldHVybjsNCj4gPiArDQo+ID4gKwkvKiBDaGVj
ayB0byBtYWtlIHN1cmUgYXQgbGVhc3Qgb25lIGJ1ZmZlciBoYXMgZGF0YS4gKi8NCj4gPiArCWlm
IChpc19lbXB0eSgmZ3NwLT5ibG9iX2luaXQpICYmIGlzX2VtcHR5KCZnc3AtPmJsb2JfaW50cikg
JiYNCj4gPiArCSAgICBpc19lbXB0eSgmZ3NwLT5ibG9iX3JtKSAmJiBpc19lbXB0eSgmZ3NwLT5i
bG9iX3JtKSkgew0KPiA+ICsJCW52a21fd2FybigmZ3NwLT5zdWJkZXYsICJhbGwgbG9nZ2luZyBi
dWZmZXJzIGFyZSBlbXB0eVxuIik7DQo+ID4gKwkJcmV0dXJuOw0KPiA+ICsJfQ0KPiA+ICsNCj4g
PiArCS8qIEZpbmQgdGhlICdkcmknIHJvb3QgZGVidWdmcyBlbnRyeS4gRXZlcnkgR1BVIGhhcyBh
IGRlbnRyeSB1bmRlciBpdCAqLw0KPiA+ICsJcm9vdCA9IGRlYnVnZnNfbG9va3VwKCJkcmkiLCBO
VUxMKTsNCj4gPiArCWlmIChJU19FUlIocm9vdCkpIHsNCj4gDQo+IEkgZG9uJ3QgdGhpbmsgdGhp
cyBjYW4gZXZlciBoYXBwZW4uIFRoaXMgZW50cnkgaXMgY3JlYXRlZCBpbiBkcm1fY29yZV9pbml0
KCkuDQoNClNvIGZpcnN0LCB0aGUgY2hlY2sgaXMgd3JvbmcuICBJdCBzaG91bGQgYmUgImlmICgh
cm9vdCkiLg0KDQpIb3dldmVyLCBJIHRoaW5rIGl0IGNhbiBoYXBwZW4uICBkcm1fY29yZV9pbml0
KCkgZG9lcyBub3QgZmFpbCBpZg0KZGVidWdmc19jcmVhdGVfZGlyKCkgZmFpbHM6DQoNCglkcm1f
ZGVidWdmc19yb290ID0gZGVidWdmc19jcmVhdGVfZGlyKCJkcmkiLCBOVUxMKTsNCg0KSXQgZG9l
c24ndCBldmVuIHByaW50IGEgd2FybmluZyBtZXNzYWdlLiAgSXQganVzdCBrZWVwcyBnb2luZy4g
IFNvIEkgdGhpbmsNCnRoZXJlIHNob3VsZCBiZSBzb21lIGVycm9yIGNoZWNraW5nIHNvbWV3aGVy
ZS4NCg0KSSB0ZXN0ZWQgdGhpcywgYW5kIGlmIGRybV9jb3JlX2luaXQoKSBmYWlscyB0byBjcmVh
dGUgdGhlIGRlbnRyeSwgdGhlbg0KcjUzNV9nc3BfcmV0YWluX2xvZ2dpbmcoKSB3aWxsIGp1c3Qg
a2VlcCBnb2luZyB0cnlpbmcgdG8gY3JlYXRlIGRlYnVnZnMNCmVudHJpZXMsIGJlY2F1c2UgYSBy
b290IG9mIE5VTEwgaXMgYWN0dWFsbHkgdmFsaWQsIGFuZCB0aGUgZW50cmllcyBhcmUNCmNyZWF0
ZWQgaW4gL3N5cy9rZXJuZWwvZGVidWcvMDAwMDo2NTowMC4wLyBpbnN0ZWFkIG9mDQovc3lzL2tl
cm5lbC9kZWJ1Zy9kcmkvMDAwMDo2NTowMC4wLw0KDQpJbiBmYWN0LCBJIHRoaW5rIEkgZm91bmQg
YSBzbWFsbCBidWcgaW4gZHB1dCgpOg0KDQp2b2lkIGRwdXQoc3RydWN0IGRlbnRyeSAqZGVudHJ5
KQ0Kew0KCWlmICghZGVudHJ5KQ0KCQlyZXR1cm47DQoNClRoaXMgc2hvdWxkIHByb2JhYmx5IGJl
ICJpZiAoSVNfRVJSX09SX05VTEwoZGVudHJ5KSkiLg0K
