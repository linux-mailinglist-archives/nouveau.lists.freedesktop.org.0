Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AAE8BC99241
	for <lists+nouveau@lfdr.de>; Mon, 01 Dec 2025 22:11:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C0F6C10E037;
	Mon,  1 Dec 2025 21:11:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="TiJVivjo";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from CH4PR04CU002.outbound.protection.outlook.com
 (mail-northcentralusazon11013068.outbound.protection.outlook.com
 [40.107.201.68])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A16A910E037
 for <nouveau@lists.freedesktop.org>; Mon,  1 Dec 2025 21:11:08 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Rpu98BnprrW/+K+qel4UtRiGGlRsaVz8/zrdvaVK+VhPxdLtnUWUZTHUm7R55zEceLtiEL4fiQnMraCVG1qffyX/R+RiXTTsgLmRd+Dt8lnULybyNXho9giCJdVNTEsH8lhWBJv8ftRf9iyqXbCvmY9nswV51WsyyFP7HJgh+2J5WOJQNoUpR5LHkBPGrfoVli1wSqTtkyjTN6SFDiJT5OrFS9DPjNoOS2ELTBvejYbxbEuOVnDXNDWPllbwA4XLOPW7eG8Jerg+O9H+QyUHHoRX0h52WbTtBTL71FMrgG+Qsv3u4uMUjYHJ56Lg4pAdqmwSTzIM27ZpER9kTZQj0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1cBl3Kg7PzJRzhelthLylZR+c1IdnsVqZLDAThAZnIM=;
 b=Z6wyPYKKFdMOF5tF7qMYdB31enGtZbFnCs7d5pxDygcNMOja6ehtjwsZiHJ01DXDxN4xmEbtVpdfoCftavdA/cBdsaa4o143empvUlClQWvwZ842w/+gWmfn9N4WZ0WANAEuFZ+AzXQyje8drZGL0m9jmpf4VynWSdO7WYsu5zsUZm5gWO5dvtS5aYQqVjOfjvUdoUGl8Cgk/vzGmU+zcE9+rEgVtPo4kGiGXF0Z2suet0QXb+nT4otZhehXFJH81A8M991EI8JPzjI6Z0a8wJo/En9iqS9Z4kt3vi6gu28sB1S7ZZ9xxx6vHXrxtPf2/CoCtE+gn66Wm+8SWQrdzA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1cBl3Kg7PzJRzhelthLylZR+c1IdnsVqZLDAThAZnIM=;
 b=TiJVivjo4zjQVpVksyYfE804s6ZIH3PooMA+/Tz7KmVRahtV+RpIhu4uKMM7pBBlP/sJaoWnVjRrQ70OCceFDNo8sFSWnVxh61PCGtFelWkPjBd4pl1Zm4OiRdVFw6kK/HcAIIxmyoxtdcaOTFSt29d1RNWBFM9pqxK6r60s2AvElclmGLSB2eFvD69GPqgCX/ebZnfwji/LCJQeuZhvNAVazcHi+eju/SUPyoLszWOSLIGLUDUDCIbOG1DjL7ZSTlqEhGO4D3axLmSOUWLI70T8ELr+p4zWZXqMJZ95aOI+4xo5Rm7B26w1tKdpKVEDd9NynsNPZW1G3oDOTBXtbQ==
Received: from SJ2PR12MB7943.namprd12.prod.outlook.com (2603:10b6:a03:4c8::10)
 by IA1PR12MB6532.namprd12.prod.outlook.com (2603:10b6:208:3a3::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.17; Mon, 1 Dec
 2025 21:11:03 +0000
Received: from SJ2PR12MB7943.namprd12.prod.outlook.com
 ([fe80::6a18:df97:8d1a:5d50]) by SJ2PR12MB7943.namprd12.prod.outlook.com
 ([fe80::6a18:df97:8d1a:5d50%4]) with mapi id 15.20.9366.012; Mon, 1 Dec 2025
 21:11:03 +0000
From: Timur Tabi <ttabi@nvidia.com>
To: Joel Fernandes <joelagnelf@nvidia.com>
CC: "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>, Alexandre
 Courbot <acourbot@nvidia.com>, "dakr@kernel.org" <dakr@kernel.org>,
 "lyude@redhat.com" <lyude@redhat.com>, John Hubbard <jhubbard@nvidia.com>,
 "rust-for-linux@vger.kernel.org" <rust-for-linux@vger.kernel.org>
Subject: Re: [PATCH 09/11] gpu: nova-core: add FalconUCodeDescV2 support
Thread-Topic: [PATCH 09/11] gpu: nova-core: add FalconUCodeDescV2 support
Thread-Index: AQHcVb7LsaijBVjUPUaIfyiPONlf3rT3gzwAgBXfRQA=
Date: Mon, 1 Dec 2025 21:11:03 +0000
Message-ID: <7d061d3cab5aca6b74ae9e861ac8497c2cc4b3cf.camel@nvidia.com>
References: <20251114233045.2512853-1-ttabi@nvidia.com>
 <20251114233045.2512853-10-ttabi@nvidia.com>
 <20251117231028.GA1095236@joelbox2>
In-Reply-To: <20251117231028.GA1095236@joelbox2>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.52.3-0ubuntu1.1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ2PR12MB7943:EE_|IA1PR12MB6532:EE_
x-ms-office365-filtering-correlation-id: d25cc1b6-d861-41e4-df2b-08de311e22bc
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|366016|376014|1800799024|38070700021;
x-microsoft-antispam-message-info: =?utf-8?B?dDNCS0xsNEtrbnhKZ0FpQnBrUkNSTDR6V0ErQ1FZMWlJQm1Lekt3SURIMlRW?=
 =?utf-8?B?SUtpU0lwU1VtRys0NXB3NDhrRkxXVk1FUlF1bkhhUVUycW96TUF3TTJJeDlK?=
 =?utf-8?B?ODhOZyszRENaN2VVeE5telBvYUYzUGs5Z3plNVBJR3VaUitaK2JVaVQ5WGxn?=
 =?utf-8?B?dUJXaEkzSllGM1dVaXFVR3ZxV1NGeC9NcFl4WGgzdENobERicTdqVTQwS0pM?=
 =?utf-8?B?a2Y0dXhvM3FveWwrR1JPVERDK2RzdGVGSzc0SkFJeXZDOHhXTDZGcXRCd2g5?=
 =?utf-8?B?aXB5SkRhQjFLV1pRcVNUcXRyL0kyVjVLODZZUnhUTGFwOEd0aFh3VHk1MkZU?=
 =?utf-8?B?L3k0cjd0d2hsb044eEdGY0ducDhVRmdxWWJ6czNUTzkycmJFTWtiR2lGQ1R1?=
 =?utf-8?B?S2trYlRCZWE0YkVSNThpV3dRWDY3Y1JlNEozMkdaRDB4SWs5ODVMVzVLbDRw?=
 =?utf-8?B?ZFU1b2I1SW9rMHppbXBiSTVQQm5mUkY1K0ZqdkNLYVVvVEk2cHp0eUVlRG5p?=
 =?utf-8?B?T0RldEtGTmhMMHB5ajd3ZUMyYVlpUWdrN0VLY2J6OGlVMDlHQ1M3VFZyM2Iw?=
 =?utf-8?B?RGZTeTNXSHdPZFZCL28zNHRGSTQyeWlSNkxQWURySkhPNXgxcEdJYkRZa0o5?=
 =?utf-8?B?VDFENm5SeFJLekhWQmFsSFFmazBDOG1ocmEzVGtvS2pQZm1lUVl0aFF1b2Nn?=
 =?utf-8?B?eHI1Q1hiQUgxcFJCcWpLUGVSMVQ5WStSRmhGQVYzbG51QnJXT1c5N05SSVlP?=
 =?utf-8?B?dzVZdUZBd21DZjdtUkRUTTVLUThoWU9raEZNeWJLZ3NBWllRWnNYZHgvVGNM?=
 =?utf-8?B?MXJibExobmRZdU5ZTk1VVFY2aVpIU2dUWW5UNUVudW80Vk04N3lmNkFxbGtW?=
 =?utf-8?B?RmxxeFZBWHlOVnJnWFI4RitDcEczVE9ucFpvUmUrbkptVWF3V2Q0MjBRWEdy?=
 =?utf-8?B?ZW5ZQVVNakFRVDVPTmIwVnA1SGRIWXRHb2l4bE1zbUNhRWVESzByb2taUkNm?=
 =?utf-8?B?WkVrOUJGcUV4ays3ZlQ5QXFSMCtOc1ZQZUswRUdyM044QmEwOS9EY25hSk10?=
 =?utf-8?B?VXBmaDhYcVFoQ2NwRkQvaVVzRXhFMXBWN04yZSt4U2UwZTRWMERKY0g5MWVp?=
 =?utf-8?B?b0kwODZLUE8wVFdLMXpJSnhQV1JxZzVoWUZRUUVaeVNWUURXYUNFU0M5QXEr?=
 =?utf-8?B?Z1luZ0VxWGs3RWNPQ3V0Z2RmQXRQMzlGWjMrZ1NxZHhxbVMxU2JOZVVpbmVh?=
 =?utf-8?B?LzFOKzB3cVFrSk9uR2RtVFB2WmpPS1RkRTFaYURodTVoNWlockc1clUvVkZm?=
 =?utf-8?B?ckVpR3FEWDA0bDRXMDNrb011V1ZVNlE3czd2RlJmdlNSZDdjMVJxZklpandy?=
 =?utf-8?B?OFdlb0dac1dBd0NXYW9tWno4eEZyWVRpUzdpOTROMUxpMzFINWRtb1c5a0dO?=
 =?utf-8?B?M2FGSUg5TWdOakIydTF3ZjdMa0Y3NC9MQmxBL2MwSWdtUmxPTWhWOEdLOHNR?=
 =?utf-8?B?WW9pUzNNcXU0KzNVUjlFY21hY2ZIZTN4MmEvMjNtTzdoMDJ6aDV0eW5IREVP?=
 =?utf-8?B?U3QvNFFQT25McHVLVFZDNlprb2U5OTgrd3VINlRkRmRKcE5rc3ExUnZTZExq?=
 =?utf-8?B?R1p4YktsdHgxSXE4bUs3eGR1akc2dDRNNTdxZTZGSXpBUHc3b1hjNnVmeEpN?=
 =?utf-8?B?ZXdDN0NmTE5RZ0lPWmZzOXNLdyt0NlY3ZnBFOXpSQnJtNG9oamtMZFB1ajlL?=
 =?utf-8?B?YTF1OFRvYk4xbE84UlVibXhQK0l0SStVc1VXbHlGa1dBYmk4ZW0rVUhVWktt?=
 =?utf-8?B?ZDQyOUVhNGFCNzdQblNjeHd1OUFPV1RmM3ZhLzI5UEl5MVZJNzl5bjdFUGNW?=
 =?utf-8?B?dkxKZXBKNUtpTzdSdzFVL2VzSTg5ZWE2c0U2SVU5U3N1RVV5TmQxZjNuTW1r?=
 =?utf-8?B?aDl2Qk4yUkR6em1scDRHazRhanN5eGhvWjRIbFlPelhJRmZXeXIwV0RQZy80?=
 =?utf-8?B?d1lDUTFMdUg0bmJrczBPUmNMYjR3c29JcDlPLzJFSDdLZVpVM2VIT044OE93?=
 =?utf-8?Q?osOPws?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ2PR12MB7943.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(38070700021); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?UExYWXU4RlFhYmNwZHEySmtMYy9HbXhaWHVUR29hK09iNDVmVzZlN1NUM0x0?=
 =?utf-8?B?QWtHWmo0UDVUK041eTlzbFpYVDZBbTdCd0RZWXUyZnNCSFYxSms0YmVzSEV2?=
 =?utf-8?B?WUF3OG5EMWczenNXYWJzTWZJdjFRd0VTY2NUYTc0eU9KMThKRGpqUE00c2k3?=
 =?utf-8?B?M2NGU1pTMjZkYUw0UENjUnh4WHdaL1NBK29tUG4xblJjWDZTSk4ydWk0Mnhv?=
 =?utf-8?B?dmFGN1dlM1BiL29lUDBxWWlHamRLemdTVkVKYXhlQkJTY1pKcXlTelVIWkxU?=
 =?utf-8?B?TVdFclB1YTVoYnRhYWhXelFvTzEwTlZBdW1PdTdJQTdva2hUOUpTQkVGNWIz?=
 =?utf-8?B?K0hvVlZFN0VXcGdvUm55cU45WXF4VmN4SXlBbCtHbzM4b2JBcTY2QTBRdjRU?=
 =?utf-8?B?TER6U0x3cnBsVHNmOHM2RHdodnZtVUNnVmMxOUExQUNJSXJsMGp6ckhoVEVL?=
 =?utf-8?B?ekl0WmtST29NVHcrMlcrQlovbXVhelRTUEw3cFJhQ1lDRzg3S1BGcU8xakQ2?=
 =?utf-8?B?Q0gxcHpMMXVmRG1wVXViOFVXQnZaYTJNUTh1TEZFdFp6c0s4aHMxVkNzTUNB?=
 =?utf-8?B?dE1tRC8vNXR4WHM2VU9BaGNrcGlmSjZMYVZHN0h5K1huVGFvUjUwbmNqYy8w?=
 =?utf-8?B?QklXRTZQZHV2dXVNVWhubXkwUkZFZm9kNzdIK0h5U0FJRkJxek84TDV4WU5l?=
 =?utf-8?B?SUt1NkJjVFY3L2FObk9GMHk2a3M4Yi82dXFQNXZNcFdDV25MOW1GUjRoZnRv?=
 =?utf-8?B?M2VzYWc3SXQzVERaZ3BZRVRBOVFTMnFYU3Q3SlZCSnhNUmJrNjY2dXpwQVB5?=
 =?utf-8?B?S0E5N0xRUUltUGlHNUVvNE0yc1JlcUg2cXkzM0hEcHdUcDJNQ08zaHNnL29n?=
 =?utf-8?B?Zk12MnhIM1VPZTBtb0dybGhlbUdFL0RnckNMU2hsTmFkdVlYamFPNW1tWnAz?=
 =?utf-8?B?N0drMXptelRDS2hPWEo2eFg2Zk15TkdGdGpTb3l6dnRCbmVyKytsQzlUQ0J5?=
 =?utf-8?B?cWY1QWswSVpSaURsS1FMNHlnaDcwRG1BMkpjcnpoQ3J5UDI0Ymd4YlQwaGFS?=
 =?utf-8?B?UThZcUgzZG5nMlFkOXU1Q3hLRWpLVTQ3Ny8yblQ2TUFhTS9MTHAwY0VaVzM1?=
 =?utf-8?B?L1VySVhLTTRCdi9WTUw2RkpkeDFUSkhuN2ZHUnJzSXQydnR4VmtLY0wyZU9r?=
 =?utf-8?B?eisvWFVPekRwU1IraWNlL2Z5VGZnMVQzZUsvTDVjbkZOc09UNVhlZ3BQdHEr?=
 =?utf-8?B?TjRhQmJhdHozUDRabTNCOUkxZHJqNVZqOUZtTlNoenhYSHE2SVZlaUxlcnIx?=
 =?utf-8?B?WG1ON3ROVW51OHQxTGpKeXBxUUpKeXlEeld2TVFoMG5nVU5FRTBKT3NOUGVP?=
 =?utf-8?B?dElWaXZSZGg5RVVyRXN1MWY0YWhMZTY5b2dxZkNRazQ5THJkbmVIdUgwaG9m?=
 =?utf-8?B?bktaaE01OVNoUmNwSHl4eXNYTkpucmtCY1BpMFBjaCtvazJNclNMU2crTUZm?=
 =?utf-8?B?Q0RvOTRnL1lTNDF6UU9lcHlLR1M0SFBqL3lmVEhQZlNtR1FJdWF5MDhVTjBL?=
 =?utf-8?B?QXJWSkJUdWZkMVZYc2plS3FQZ2d1MGIzZFZlY1hJbU4wdVRCVnMrSzQyUFFo?=
 =?utf-8?B?SnFjaEVqazUvdDdwUlM4dmpzb0tYQXpTYUMvNHVyOTFPQkVKNkZtb3J1SHlW?=
 =?utf-8?B?eWJDelVnSURnTGVjNXV2MWJncDBtdVlNNVA5aStDS2xiakJqaXBaSlBtRFoz?=
 =?utf-8?B?SjlkUitKQ293b2xXVmRadkJBa2VKNDFWRFY3a2EyOXlBWjRvb0NMNzgrY3h0?=
 =?utf-8?B?SCtTd0JUMWpid1pzVDUvSjU5SEYwYzZXdHpZMExyR0FLNnpsbFdPaXNnells?=
 =?utf-8?B?d1AvanJkR2R0Qm41anhqSnBDNSs4ZndLTktGdVBBYzBWQ0dqWlFPS042NHNQ?=
 =?utf-8?B?UkJJakRzdDFCSDBVWVQ0TDZLM2QwdTNqTVRFS0dkYmZKZXBBcWFKODE4VmZw?=
 =?utf-8?B?aUVZbGtZYnlFLzVBWVRZUUpKUTZGS05CWmxDWjdEa0J2L3Y2MFhiOVVQWmQ2?=
 =?utf-8?B?YkREblIweWFnemdRQit2TjRZUS9jajFpcEFyMU0xSURBaHI5SE5YQUpSV25M?=
 =?utf-8?Q?SjJi8970run5xJtP948dsjuwT?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <30F6D90A6EB5D0438FA11CDCFC102BC4@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR12MB7943.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d25cc1b6-d861-41e4-df2b-08de311e22bc
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Dec 2025 21:11:03.4338 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 69UboBdOXcwlWoQRUh7OCfmIk0t7eIZxwjyHEsA4ZHsatUK8onq3un98Geo3um4KqVfXIZMGDZt02nx1KQm9BQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6532
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

T24gTW9uLCAyMDI1LTExLTE3IGF0IDE4OjEwIC0wNTAwLCBKb2VsIEZlcm5hbmRlcyB3cm90ZToN
Cj4gLy8gVXNhZ2UgZXhhbXBsZSAtIG5vIG1vcmUgbWF0Y2ggc3RhdGVtZW50cyBuZWVkZWQhDQo+
IGltcGwgRmFsY29uTG9hZFBhcmFtcyBmb3IgRndzZWNGaXJtd2FyZSB7DQo+IMKgwqDCoCBmbiBk
bWVtX2xvYWRfcGFyYW1zKCZzZWxmKSAtPiBGYWxjb25Mb2FkVGFyZ2V0IHsNCj4gwqDCoMKgwqDC
oMKgwqAgRmFsY29uTG9hZFRhcmdldCB7DQo+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgc3JjX3N0
YXJ0OiAwLA0KPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGRzdF9zdGFydDogMCwNCj4gwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoCBsZW46IHNlbGYuZGVzYy5kbWVtX2xvYWRfc2l6ZSgpLA0KPiDCoMKg
wqDCoMKgwqDCoCB9DQo+IMKgwqDCoCB9DQo+IH0NCg0KVGhpcyBkb2Vzbid0IHdvcmsgYmVjYXVz
ZSB0aGUgY3VycmVudCBjb2RlOg0KDQogICAgZm4gZG1lbV9sb2FkX3BhcmFtcygmc2VsZikgLT4g
RmFsY29uTG9hZFRhcmdldCB7DQogICAgICAgIG1hdGNoICZzZWxmLmRlc2Mgew0KICAgICAgICAg
ICAgRmFsY29uVUNvZGVEZXNjOjpWMih2MikgPT4gRmFsY29uTG9hZFRhcmdldCB7DQogICAgICAg
ICAgICAgICAgc3JjX3N0YXJ0OiB2Mi5kbWVtX29mZnNldCwNCiAgICAgICAgICAgICAgICBkc3Rf
c3RhcnQ6IHYyLmRtZW1fcGh5c19iYXNlLA0KICAgICAgICAgICAgICAgIGxlbjogdjIuZG1lbV9s
b2FkX3NpemUsDQogICAgICAgICAgICB9LA0KICAgICAgICAgICAgRmFsY29uVUNvZGVEZXNjOjpW
Myh2MykgPT4gRmFsY29uTG9hZFRhcmdldCB7DQogICAgICAgICAgICAgICAgc3JjX3N0YXJ0OiB2
My5pbWVtX2xvYWRfc2l6ZSwNCiAgICAgICAgICAgICAgICBkc3Rfc3RhcnQ6IHYzLmRtZW1fcGh5
c19iYXNlLA0KICAgICAgICAgICAgICAgIGxlbjogdjMuZG1lbV9sb2FkX3NpemUsDQogICAgICAg
ICAgICB9DQogICAgICAgIH0NCiAgICB9DQoNCnVzZXMgZGlmZmVyZW50IHZhbHVlcyBmb3Igc3Jj
X3N0YXJ0IGFuZCBkc3Rfc3RhcnQgZGVwZW5kaW5nIG9uIHdoZXRoZXIgaXQncyB2MiBvciB2My4N
Cg0KSSd2ZSBpbXBsZW1lbnRlZCB0aGUgdHJhaXQgb2JqZWN0LCBidXQgSSBkb24ndCB0aGluayB0
aGUgZW5kIHJlc3VsdCBpcyBhbiBpbXByb3ZlbWVudC4gIFN1cmUsIEkndmUNCnJlcGxhY2VkIDkg
bWF0Y2ggc3RhdGVtZW50cyB3aXRoIDEsIGJ1dCBJIGhhZCB0byBjcmVhdGUgdGhlIHRyYWl0IG9i
amVjdCBhbmQgdHdvIG1vcmUNCmltcGxlbWVudGF0aW9ucy4gIFNvIEkndmUgZGVsZXRlZCAzNyBs
aW5lcywgYnV0IEkgaGFkIHRvIGFkZCA1NC4NCg0KSSB3aWxsIHBvc3QgdGhlIHRyYWl0IG9iamVj
dCBjaGFuZ2UgYXMgaXRzIG93biBSRkMgcGF0Y2gsIHNvIHlvdSBjYW4gc2VlIGZvciB5b3Vyc2Vs
Zi4gIE15DQpwcmVmZXJlbmNlIHdvdWxkIGJlIHRvIGRyb3AgaXQsIGhvd2V2ZXIuICBBcyBmYXIg
YXMgSSdtIGNvbmNlcm5lZCwgdGhpcyBpcyB5ZXQgYW5vdGhlciBleGFtcGxlIG9mDQptYWtpbmcg
dGhlIFJ1c3QgY29kZSBtb3JlIGNvbnZvbHV0ZWQganVzdCBiZWNhdXNlIGl0J3MgYSAibmVhdCBm
ZWF0dXJlIiBvZiB0aGUgbGFuZ3VhZ2UuDQoNCg==
