Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 857CD9B52FB
	for <lists+nouveau@lfdr.de>; Tue, 29 Oct 2024 20:50:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD65C10E6F1;
	Tue, 29 Oct 2024 19:50:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="PuksXCbK";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam04on2040.outbound.protection.outlook.com [40.107.101.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BCA7210E6F1
 for <nouveau@lists.freedesktop.org>; Tue, 29 Oct 2024 19:50:09 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FFyYSFOieU5obOhA/hCHd/VcBp3T3hm2QAPZFx0Dgv53I3AI5l0KB+BhOIK+VMusfVqZHt+ouNV9C3fD9eeRmMtj+VhxwZFsrU1oQwr/r0l94Z8KoaNnlvqMAXYvuZtVwkrVmVOp4H+th3Vo+OtL3lrOL4kqEOxdZ8cYDaSH9FWihihACO5FfDPmviNvrBn+qlaef6SJGe3oD7DcDkqmwsRONYPUZi1cd+t+BI60cx7Z67n/aQmsz0gtU6x3MVLDnvFn8g0mTPKz/sOAXDrKxKATI3xo4rcLCov5iRfTNYJgWxqDkD9Y6P4g1Bx94WiKDoS1rBXkyM+iIvT7wBke2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GGIsVti6Mb9W96Gp+nrmBfj/8Ke8B2EVy11LDAyZuos=;
 b=oODt2r41ZX3LMAlYbCjm79xCbyeTwNXGfSb6gd92bbAOCeh1oMNoe5FAF1GG3kC2MMmb6rO3dNaaMcSgg1QYf2KsoHsvOK3nuLVDJlOgXyMXDUG4LAaqNL9NAgqq6lhw+VW+SSxSyv9MlUNCyEEMIzqIm+Ma3qE0GbqwL+QW0dkRSiimMZtYb6spOR1o3DaVQ3xNgNUPYv/7XxN9p2JHCHAKiI23otGsl5aZ4F9GvloUhZkACfzDeiwmRcUoRAGzHxQJAMT7EXyxyyFq6xB29mchftl2zsKljSNHC5EQawIz80tyT3jXIt23jJQDEhsJD3MSctpC+oApP05oDQ2koQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GGIsVti6Mb9W96Gp+nrmBfj/8Ke8B2EVy11LDAyZuos=;
 b=PuksXCbKZit+FxcvlYEVDI4lEf8qbH1NDPamhPv+PbRD8AOYi8X78Cie1XS5zv6aSJP0+pP/YxcsVKPRZdidMDCfq2939CH49TcksfSIovJ+FUfQj5LV8s0KipNF07wdPJK8k0IDPmsROqXUNDcAzkVEFOfuXe9+Pf3VOZ79ej0/L8eDWuBleg7KOw1fm7y6XUynQMsgJk6lSHYx0FqGt+jZHlUQLNH/gya57LY9dQxkdPMrDNMw7CK+bRhdFpMzF3gnZpL1npZ7hqKdWXaNyZxcx4649MU5Ze7g9q54T/Q8O6x/Gb9eI92mmucnwkS2Cutx/iQNWCfWgMuVVEi5tQ==
Received: from CY5PR12MB6526.namprd12.prod.outlook.com (2603:10b6:930:31::20)
 by CY8PR12MB8298.namprd12.prod.outlook.com (2603:10b6:930:7c::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.23; Tue, 29 Oct
 2024 19:50:06 +0000
Received: from CY5PR12MB6526.namprd12.prod.outlook.com
 ([fe80::e420:4e37:166:9c56]) by CY5PR12MB6526.namprd12.prod.outlook.com
 ([fe80::e420:4e37:166:9c56%3]) with mapi id 15.20.8093.027; Tue, 29 Oct 2024
 19:50:06 +0000
From: Timur Tabi <ttabi@nvidia.com>
To: "dakr@kernel.org" <dakr@kernel.org>
CC: "airlied@redhat.com" <airlied@redhat.com>, "nouveau@lists.freedesktop.org"
 <nouveau@lists.freedesktop.org>, Ben Skeggs <bskeggs@nvidia.com>
Subject: Re: [PATCH 2/2] [v8] drm/nouveau: expose GSP-RM logging buffers via
 debugfs
Thread-Topic: [PATCH 2/2] [v8] drm/nouveau: expose GSP-RM logging buffers via
 debugfs
Thread-Index: AQHbA8xSp5yNleoyukirtg0ketFJ/rJ1tG+AgCi7eIA=
Date: Tue, 29 Oct 2024 19:50:06 +0000
Message-ID: <2ff5ae312ca85e26fb3f3aaa85fbf3739d9d14e7.camel@nvidia.com>
References: <20240910215616.1516679-1-ttabi@nvidia.com>
 <20240910215616.1516679-2-ttabi@nvidia.com> <Zv8ROwm6ynsKYouo@pollux>
In-Reply-To: <Zv8ROwm6ynsKYouo@pollux>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.44.4-0ubuntu2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY5PR12MB6526:EE_|CY8PR12MB8298:EE_
x-ms-office365-filtering-correlation-id: 84490147-2eae-4eb6-18f5-08dcf852e357
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?Nlp4UzA5QWwyU25Ma2lBTGl0YXYvZURtcXJhWHd5OW9aMDV4cHpmc3dCYXFY?=
 =?utf-8?B?T0Z2M0cwTFY2cDQxYlNWdEp1Y1NUbWNwdEt2eVFpbFZRVUtPaTNqU0hoeno0?=
 =?utf-8?B?bGk1OTh0QUpaT0hHTVBQbTB3YnFvaThnV1NYL05uWFZTT0hRUm5oMngwZTZR?=
 =?utf-8?B?ZzVUVlA5ZEx3YUNaSnFzbUhXOWNZa0xESmh3YUV0YWp1bldUMXBlZGo3SFVF?=
 =?utf-8?B?cUJnb0djRFV0bzJGZE95cElra2dMd1pjRXR1NmZ3bDZNblVTVFhiV01EQ0xJ?=
 =?utf-8?B?dG5GcWhGTklIN2hTK21sclRZRDFwT0RreFN3cEo1QTAzVGVER0R2Y0UrSkFV?=
 =?utf-8?B?dzN4Tk1lT295b2UyUG5UQ0tiQWRMQ2RZbWM2T3dsbVozOWNkZkw5NXlZMEdI?=
 =?utf-8?B?OGZ0dmpIN0FsamdVeFJxQlREYUsxTThmdVN4bEdWTUtYbXBBRjUvMHJFcndv?=
 =?utf-8?B?Mi9NWGp4Zmc0aTgvNW1Ka0xYNmRrdVNFNXg3cThhZmxDL0x3VVNTTTFmYkFa?=
 =?utf-8?B?TGlCZWszSURSWU5EOGwvUGdveFU1VDJSaWFLWWUrbXZEbGRTVVl5VXZWZktt?=
 =?utf-8?B?ckVpWTg2elFzaWZubFpaL2JpWHV2Ykl6dGQ1S1pwQVdDTURSWTFicnI4U2po?=
 =?utf-8?B?azRDYWhVbytadllMN2VucER1Tm5UMkY0RXYreUJiMkJjaGpMeGtzYUR0aTQx?=
 =?utf-8?B?bFJvZkhNTnJWaHRyQ1dra0JCVUlCNHp4V1lDZkYwbCtXWVdnQ0FRb0hqRFo1?=
 =?utf-8?B?djdkMUc2cWlCMmh2T1VkSGF4UnlJdDUyT2c0TEIrTS9DNStPQkhLRm9oUXhL?=
 =?utf-8?B?S0JiRXdELzlTWWVhTDdLY3VGZUhJNEp1ekZQc3RzUC84UnlFRWpiRStleHln?=
 =?utf-8?B?b0IvdGdIWGJiM1JSUWpaSE1HdVlxM0hNamlHM1BuMW9zbWNNdUhTK042MFh4?=
 =?utf-8?B?K0FrYjVKN3J6cjVONmc3Z1lNbWJPZ2czdTEzNzEzVmdxU3JBWXR3YW1EVHRU?=
 =?utf-8?B?bGxhaEZQb0pyRWc5dDY3bFZXdmNtYWZoU0NzN3ptTVdXT2ZTRmVTMWdVQUt1?=
 =?utf-8?B?dmNHYTdPMytieTVRNnVQOVpWN3pMUExqVHlKREFJeENPTFBsL0VQakRWNzFj?=
 =?utf-8?B?dlV4SzZZMTRvOXh1QTUwSVJocGZEMXRoL240K2RFS2N6a2plTkV0SXc4Z2ps?=
 =?utf-8?B?dkc3dGtjZVUwN2YxQ24vVUJrcFdqNDNVdnBldlhHaHlpUHhuUzVjQm5ad2VN?=
 =?utf-8?B?SnJxT08yQ0tsVEt3NWR2bG9SNDkwRHl5YUFNSlJmcXM0RnRFUzlSUWdSV0Mr?=
 =?utf-8?B?R0VnNXo4d2xvcm01N1F2WWc5YUQ5Uk9yUHVjTExnZkZIV3JSNyt3NlBmR0l4?=
 =?utf-8?B?M2VoRXQ2TGRTbi84Q1dRUFFkV1dvaVVwYkJPR3JaUkJnNW5TKzVvY295Z3Bz?=
 =?utf-8?B?NW5HR3JFVWRBU3E1ODFVTlQ2TmNyeFFkbzhzcGJ4M2JBTTYrbnFsNU9lWGJh?=
 =?utf-8?B?OEUwTkdmeEZEMHNHaWFmMnQ4R1NnOXNXR0puN2w0aHU3RG5ZTjdCa0R6VVVX?=
 =?utf-8?B?bEh1MTVHWitBV3NtSmxEMnpCQ1czc0FkaThZV05WbzArNVdzMWoycUtvZ211?=
 =?utf-8?B?N1JTS2lSNDJUNFFXa0dWVXh1SDk0NnptdWNsc3Q4UDZCZ2g2YktKQnIyWGk5?=
 =?utf-8?B?UkNGaVJ3VmNTcGxWNWNzTUVuWVJjYWhpcmk0WHVzOEtydGFtd1BXSUJONDFv?=
 =?utf-8?B?YWt4RC9jWUoySC93YkJtSUIvd3ZUcnNKYTAwUzQ0dktaR1hHNGFBL2ZlbDB3?=
 =?utf-8?B?UFNLRXZXYXNYdlh1RjB6bFVvTmlEMWVVZ3REQXJ1VjAyejdRUVFreG9VRnBn?=
 =?utf-8?Q?NvP1GNinLbVA9?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR12MB6526.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?RXJVNWRjMHlwLzNZcWdHYjFCOXZnRGJ6c2xweitzejVpVXFTQlN1OVVVQS81?=
 =?utf-8?B?MExSd0o3R1M0ZHF4V1Jia0tHR0dGYWVQZG42eVRod1hsZktDL05SMDBtY1Vh?=
 =?utf-8?B?ei9nMmJTTXlNcXlVN3NUL1NMT0pXaTRPUUk1UExEOVduSXdjM003aU9HT1ZP?=
 =?utf-8?B?VHdKSU5GS0pOc094QlNvdDFDMGY2b2dLMFlTOFoycXRiOU1xZXY4eG00bnc2?=
 =?utf-8?B?QUllVnZ6d2d4elZGQVVjUm1RS2JwbDBzTUh4SlpIaWJtYXloNDQ2QkZmbStL?=
 =?utf-8?B?VlNFc3l3blhiWStVNG5ua3FHa2RhbWsyRklUajRrZ0JSZFdlNmpWVVBnUHBp?=
 =?utf-8?B?YTNoelZQOTJzcitPTUtFTGpUNXh1ei9FM2xSakVBYkZlK05WdTZjTTk0VGlI?=
 =?utf-8?B?N1Nxclg0bENCMEtyTFA3ZSs4SVZ6Z0MvMkFUcWFvU0tLdlUwZGcxdzcxdDg5?=
 =?utf-8?B?ZHpMYkNGN0lNOFYvREZCaE9MOTkrTWNzL2NPZVc0WDBqMlFLMFE1S2VueHQ3?=
 =?utf-8?B?eS9LUmJJQWRSMmJZZW5SNDhMUURpdGlETTBDVUZyLzlGdnljQjdQT2liVm82?=
 =?utf-8?B?L0ViZW9aeWF5NjNzaTkzMWhteTdnM01jLzkrcWhGcWZBSnJnemxMcFlPRkFw?=
 =?utf-8?B?WVpneCs1MUZjdXBiZE55QUlCRnU5WTdiSExRNDJzTVdqbnVzWGlJdWQ0WlNs?=
 =?utf-8?B?YzFYcUR6cE8xUlBqMlg3SS9lSldGWm5HVHhveFJTY29lMUpEQ2tHbWVlbzlJ?=
 =?utf-8?B?N0xpeU9DOENYZ3R5Y3dXUmh3QmV1bG5xRE1LbWtOMy9FRS9qTHQ1RVdUTnlK?=
 =?utf-8?B?Z1ZieCtlUXcxTjRVdWNzWldraXNUeWx2WGtyclBXcWc5TmR4amd1NjBIUmVy?=
 =?utf-8?B?QkpzM3NrRkpMM250VmlpL0xubnhWanVxb1BRTHBoWTBvakZKbDhpNzAvM21j?=
 =?utf-8?B?cFdESmkzVlN1TGJDc3N1dTdIM2Nqbi9GdS9ETTJaMUpDei9Db09LQitZWXd1?=
 =?utf-8?B?UzVZWnY3N3FHT1B2bkttUXN2elJhV2gydFJsbVBQUko3WWdhc3FnUmFJVUxF?=
 =?utf-8?B?cXJ0OGR0VEdiUVBuK1IvTHlXc2c4b0xmbWFwVjdUcytiSE1UWXB5ejJPYWov?=
 =?utf-8?B?VTdIWjc1WGxTUXhHNUVsMFdkclhzQkpMYnRLaS9HeVNRcURGSmp2RE50cDd0?=
 =?utf-8?B?aml4TkZhNWtZVUlpSlViOHBEb1RGWWJmMGs1bXJnZ3ZlUGRqRTBKcXFmS2Yx?=
 =?utf-8?B?NDIwSjJKdkJ2anlFdHZyNEhuWWV6Wk1GZXQzcGtvZ1o5aU1FZ0lBMVlGKzM4?=
 =?utf-8?B?OXp3M0MweGJ2aFlPOEtnNzVhcWFxVWQ1ZDdOalVPcTdWSlkxdmJBdzdMRmdp?=
 =?utf-8?B?OHhmVWtqZXB6Qi9DamMxN2VoSTdrd3owQWMxdFJUdFZVcXdMaEhkQ3NhQWJH?=
 =?utf-8?B?V0NyQXFmdkNORXMrQ1NyQlk3TnRDYnVWbW5lQTBEeTN2VUtHeEVNTGFrVSt6?=
 =?utf-8?B?TjJGZnoxbFhOMFM0dEQ0SVc2UWRTRzdnQit0THMzZVA5V0R1dHlTZ1MrYkdX?=
 =?utf-8?B?NGIxUWFFRDVzdUdtYUlTaXdhNWxBUmg4MjhvVzZvdUlYMy9GM0s1ZWRPbDJT?=
 =?utf-8?B?b21JR1dMemZaU2tnU1hTNlNTMko5VDlmcVlqNjMyQjlLdCtiZW52elRkTWow?=
 =?utf-8?B?MEUwWlpBaEpEbkhlWVRmNTV3OUtyVGZyU0pIRzRlUVAxZjhKakpOLzBpTkFz?=
 =?utf-8?B?WUxBN2RxaUVHZWFRRjJvN3MydkJOeWhrN0RJQTJ2VlVCWUUwZ3JyaDNScW96?=
 =?utf-8?B?MHViRkVQbXpRUGUwbjBWWmRSVzBxUTZjNC9sRFJGQlFVODJLWlYydFFHTXM3?=
 =?utf-8?B?ZHIvWksyLzNkTHgyeCtNZ0UrN0FoUFk5T2VOc2gzakFHL0tGSTJwczdnRTRQ?=
 =?utf-8?B?UjB4REg5OE9JQlFQQmVpZUpmMTgrVzBIQ3dYNjkwTTR2eElnY0R0T0ZEdzZT?=
 =?utf-8?B?OVJlTDFWb3ZoL010a2NOUCtRRndlRDRhOWpJeTJjMDNFd3ZOZjZKVU1NSXVE?=
 =?utf-8?B?MitoenQ4OEVCRFZ6WkY5Sk9kTGxUa084NTFFQUVvZ0loeEdkZ3lFam4yYi9Y?=
 =?utf-8?Q?o3v29ZJknErlAyMmcJG3+Tawk?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <E53324588F7C1F4FBABCDA25266736BE@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY5PR12MB6526.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 84490147-2eae-4eb6-18f5-08dcf852e357
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Oct 2024 19:50:06.4477 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: KEfPZcYQI34+6cPhOrvjlf6mxuqR62y91NRueIjbI7su34D7roMYnzMPh5dL5j4kAosfkzO/lYJLUO7Kc6X8Ig==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB8298
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

T24gVGh1LCAyMDI0LTEwLTAzIGF0IDIzOjQ4ICswMjAwLCBEYW5pbG8gS3J1bW1yaWNoIHdyb3Rl
Og0KPiA+ICsjaWZkZWYgQ09ORklHX0RFQlVHX0ZTDQo+ID4gKwkvKg0KPiA+ICsJICogTG9nZ2lu
ZyBidWZmZXJzIGluIGRlYnVnZnMuIFRoZSB3cmFwcGVyIG9iamVjdHMgbmVlZCB0byByZW1haW4N
Cj4gPiArCSAqIGluIG1lbW9yeSB1bnRpbCB0aGUgZGVudHJ5IGlzIGRlbGV0ZWQuDQo+ID4gKwkg
Ki8NCj4gPiArCXN0cnVjdCBkZW50cnkgKmRpcjsJCS8qIFBhcmVudCBkZW50cnkgKi8NCj4gPiAr
CXN0cnVjdCBkZW50cnkgKmRpcl9pbml0Ow0KPiA+ICsJc3RydWN0IGRlbnRyeSAqZGlyX3JtOw0K
PiA+ICsJc3RydWN0IGRlbnRyeSAqZGlyX2ludHI7DQo+ID4gKwlzdHJ1Y3QgZGVudHJ5ICpkaXJf
cG11Ow0KPiANCj4gSSB0aGluayBgZGlyYCBpcyBjb25mdXNpbmcsIG1heWJlIGp1c3QgYGRlbnRf
KmA/IE9yIG1heWJlIGp1c3Qgd3JhcCBhbGwgdGhvc2UgaW4NCj4gYSBgc3RydWN0IHsgLi4uIH0g
ZGVidWdmcztgIGFuZCBqdXN0IG5hbWUgdGhlbSBgaW5pdGAsIGBybWAsIGV0Yy4/DQoNCk9rLCBi
dXQgSSdtIHByZXR0eSBzdXJlIHRoaXMgaXMgbGlrZSB0aGUgZmlmdGggdGltZSBJJ3ZlIG1vdmVk
IHRoZXNlIGZpZWxkcw0KYXJvdW5kIGJlY2F1c2UgeW91IGtlZXAgdGVsbGluZyBtZSB0byBwdXQg
dGhlbSBzb21ld2hlcmUgZWxzZS4NCg0KPiA+ICsvKg0KPiA+ICsgKiBUaGUgZGVidWdmcyByb290
IGZvciBhbGwgZGV2aWNlcy4gIE5vcm1hbGx5IHdlJ2QgdXNlIC9zeXMva2VybmVsL2RlYnVnL2Ry
aS4sDQo+ID4gKyAqIGJ1dCB0aGF0IHBhdGggbWF5IG5vdCBleGlzdCB3aGVuIHdlIG5lZWQgaXQu
ICBTbyBjcmVhdGUgYSBuZXcgcm9vdA0KPiA+ICsgKiAvc3lzL2tlcm5lbC9kZWJ1Zy9ub3V2ZWF1
Ly4NCj4gPiArICoNCj4gPiArICogV2UgdGFrZSBhIHJlZmVyZW5jZSBldmVyeSB0aW1lIGEgZGVu
dHJ5IHVuZGVyIHRoZSByb290IGlzIGNyZWF0ZWQuICBXaGVuDQo+ID4gKyAqIHRoZSBsYXN0IHJl
ZmVyZW5jZSBpcyByZWxlYXNlZCwgdGhlIHJvb3QgaXMgZGVsZXRlZC4NCj4gPiArICovDQo+ID4g
K3N0YXRpYyBzdHJ1Y3Qgew0KPiA+ICsJc3RydWN0IG11dGV4IG11dGV4OyAvKiBQcm90ZWN0cyBk
ZW50cnkgKi8NCj4gPiArCXN0cnVjdCBkZW50cnkgKmRlbnRyeTsNCj4gPiArCXN0cnVjdCBrcmVm
IGtyZWY7DQo+ID4gK30gcm9vdCA9IHsNCj4gPiArCS5tdXRleCA9IF9fTVVURVhfSU5JVElBTEla
RVIocm9vdC5tdXRleCksDQo+ID4gKwkua3JlZiA9IEtSRUZfSU5JVCgwKSwNCj4gPiArCS5kZW50
cnkgPSBOVUxMLA0KPiA+ICt9Ow0KPiA+ICsNCj4gPiArc3RhdGljIHZvaWQgcmVsZWFzZV9yb290
X2RlbnRyeShzdHJ1Y3Qga3JlZiAqcmVmKQ0KPiA+ICt7DQo+ID4gKwltdXRleF9sb2NrKCZyb290
Lm11dGV4KTsNCj4gPiArCWRlYnVnZnNfcmVtb3ZlKHJvb3QuZGVudHJ5KTsNCj4gPiArCXJvb3Qu
ZGVudHJ5ID0gTlVMTDsNCj4gPiArCW11dGV4X3VubG9jaygmcm9vdC5tdXRleCk7DQo+ID4gK30N
Cj4gDQo+IEkgdGhpbmsgYWxsIHRoaXMgc2hvdWxkIGdvIGludG8gbW9kdWxlX2luaXQoKSBhbmQg
bW9kdWxlX2V4aXQoKSwgdGhlbiB5b3UgZG9uJ3QNCj4gbmVlZCB0aGUgbXV0ZXggYW5kIGFsbCB0
aGUgcmVmZXJlbmNlIGNvdW50cy4NCg0KU29ycnksIEkgZG9uJ3Qgc2VlIGhvdyBJIGNhbiBqdXN0
IG1vdmUgImFsbCB0aGlzIiB0byBtb2R1bGVfaW5pdCBhbmQgZXhpdC4gDQpUaGUgcG9pbnQgaXMg
dG8ga2VlcCB0aGUgcGFyZW50IGRlbnRyeSBhcm91bmQgdW50aWwgdGhlIGxhc3QgR1BVIGhhcyBz
aHV0DQpkb3duIGluIHI1MzVfZGVidWdmc19zaHV0ZG93bigpLiAgDQoNClBsZWFzZSB0ZWxsIG1l
IHdoYXQgeW91IHRoaW5rIG1vZHVsZV9pbml0KCkgYW5kIG1vZHVsZV9leGl0KCkgd2lsbCBsb29r
DQpsaWtlLg0KDQo+ID4gKy8qKg0KPiA+ICsgKiBjcmVhdGVfZGVidWZncyAtIGNyZWF0ZSBhIGJs
b2IgZGVidWdmcyBlbnRyeQ0KPiA+ICsgKiBAbmFtZTogZmlsZW5hbWUNCj4gPiArICogQHBhcmVu
dDogcGFyZW50DQo+ID4gKyAqIEBibG9iOiBibG9iDQo+ID4gKyAqDQo+ID4gKyAqIENyZWF0ZXMg
YSBkZWJ1Z2ZzIGVudHJ5IGZvciBhIGxvZ2dpbmcgYnVmZmVyIHdpdGggdGhlIG5hbWUgJ25hbWUn
Lg0KPiA+ICsgKi8NCj4gPiArc3RhdGljIHN0cnVjdCBkZW50cnkgKmNyZWF0ZV9kZWJ1Z2ZzKHN0
cnVjdCBudmttX2dzcCAqZ3NwLCBjb25zdCBjaGFyICpuYW1lLA0KPiA+ICsJCQkJICAgICBzdHJ1
Y3QgZGVidWdmc19ibG9iX3dyYXBwZXIgKmJsb2IpDQo+ID4gK3sNCj4gPiArCXN0cnVjdCBkZW50
cnkgKmRpcjsNCj4gDQo+IEkgdGhpbmsgYGRpcmAgaXMgY29uZnVzaW5nLCB3aGF0IGFib3V0IGBk
ZW50YCBvciBgZW50cnlgPw0KDQpIZXJlJ3MgYSBjb3VudCBvZiB0aGUgbW9zdCBwb3B1bGFyIG5h
bWVzIGZvciB0aGlzIHR5cGU6DQoNCiAgICAgMTAgCXN0cnVjdCBkZW50cnkgKmRkaXI7DQogICAg
IDE4IAlzdHJ1Y3QgZGVudHJ5ICpkOw0KICAgICAyMSAJc3RydWN0IGRlbnRyeSAqZGVidWdmc19y
b290Ow0KICAgICAzMSAJc3RydWN0IGRlbnRyeSAqZGJnZnNfZGlyOw0KICAgICAzOSAJc3RydWN0
IGRlbnRyeSAqZGVidWdmc19kaXI7DQogICAgIDUwIAlzdHJ1Y3QgZGVudHJ5ICpkZW50cnk7DQog
ICAgIDU1IAlzdHJ1Y3QgZGVudHJ5ICpkZWJ1Z2ZzOw0KICAgICA1NSAJc3RydWN0IGRlbnRyeSAq
ZGlyOw0KICAgICA2NCAJc3RydWN0IGRlbnRyeSAqcm9vdDsNCg0KQXMgeW91IGNhbiBzZWUsICdk
aXInIGlzIHRoZSBzZWNvbmQgbW9zdCBwb3B1bGFyIG5hbWUuICBTbyBJIHRoaW5rIGl0J3MNCmZp
bmUuDQoNCkJlc2lkZXMsIGNvdWxkbid0IHlvdSBoYXZlIG1ha2UgdGhpcyBzdWdnZXN0aW9uIGR1
cmluZyBvbmUgb2YgdGhlIHByZXZpb3VzIDcNCnZlcnNpb25zIG9mIHRoaXMgcGF0Y2g/ICBJJ20g
bmV2ZXIgZ29pbmcgdG8gZ2V0IHRoaXMgcGF0Y2ggZmluaXNoZWQgaWYgeW91DQprZWVwIGFza2lu
ZyBmb3IgY29zbWV0aWMgY2hhbmdlcy4NCg0KPiA+ICsJZGlyID0gZGVidWdmc19jcmVhdGVfYmxv
YihuYW1lLCAwNDQ0LCBnc3AtPmRpciwgYmxvYik7DQo+ID4gKwlpZiAoSVNfRVJSKGRpcikpIHsN
Cj4gPiArCQludmttX2Vycm9yKCZnc3AtPnN1YmRldiwNCj4gPiArCQkJICAgImZhaWxlZCB0byBj
cmVhdGUgJXMgZGVidWdmcyBlbnRyeVxuIiwgbmFtZSk7DQo+ID4gKwkJcmV0dXJuIE5VTEw7DQo+
ID4gKwl9DQo+ID4gKw0KPiA+ICsJLyoNCj4gPiArCSAqIEZvciBzb21lIHJlYXNvbiwgZGVidWdm
c19jcmVhdGVfYmxvYiBkb2Vzbid0IHNldCB0aGUgc2l6ZSBvZiB0aGUNCj4gPiArCSAqIGRlbnRy
eSwgc28gZG8gdGhhdCBoZXJlLg0KPiA+ICsJICovDQo+ID4gKwlpX3NpemVfd3JpdGUoZF9pbm9k
ZShkaXIpLCBibG9iLT5zaXplKTsNCj4gDQo+IEkgdGhpbmsgZGVidWdmcyBlbnRyaWVzIHR5cGlj
YWxseSBkb24ndCBuZWVkIHRoaXMuIERvIHdlIG5lZWQgaXQ/DQoNClllcy4gIEkgc3VibWl0dGVk
IGEgcGF0Y2ggdG8gZGVidWdmcyBlYXJsaWVyIHRoaXMgeWVhciB0aGF0IHdvdWxkIGZpeCBpdCBm
b3INCmFsbCBkZWJ1Z2ZzIGJsb2JzLCBidXQgaXQgd2FzIHJlamVjdGVkIGJlY2F1c2UgSSB3YXMg
YXNrZWQgdG8gZml4IGFsbCBvZg0KZGVidWdmcyBpdHNlbGYsIHdoaWNoIEkgd2Fzbid0IHdpbGxp
bmcgdG8gZG8uDQoNCmh0dHBzOi8vd3d3LnNwaW5pY3MubmV0L2xpc3RzL2xpbnV4LWZzZGV2ZWwv
bXNnMjYyODQzLmh0bWwNCg0KPiA+ICsJZ3NwLT5kaXJfaW5pdCA9IGNyZWF0ZV9kZWJ1Z2ZzKGdz
cCwgImxvZ2luaXQiLCAmZ3NwLT5ibG9iX2luaXQpOw0KPiANCj4gSGVyZSB5b3UgdXNlIHlvdXIg
aGVscGVyLCBidXQgZm9yLi4uDQo+IA0KPiA+ICsJaWYgKCFnc3AtPmRpcl9pbml0KQ0KPiA+ICsJ
CWdvdG8gZXJyb3I7DQo+ID4gKw0KPiA+ICsJZ3NwLT5kaXJfaW50ciA9IGRlYnVnZnNfY3JlYXRl
X2Jsb2IoImxvZ2ludHIiLCAwNDQ0LCBnc3AtPmRpciwgJmdzcC0+YmxvYl9pbnRyKTsNCj4gPiAr
CWlmIChJU19FUlIoZ3NwLT5kaXJfaW50cikpIHsNCj4gPiArCQludmttX2Vycm9yKCZnc3AtPnN1
YmRldiwgImZhaWxlZCB0byBjcmVhdGUgbG9naW50ciBkZWJ1Z2ZzIGVudHJ5XG4iKTsNCj4gPiAr
CQlnb3RvIGVycm9yOw0KPiA+ICsJfQ0KPiA+ICsNCj4gPiArCWdzcC0+ZGlyX3JtID0gZGVidWdm
c19jcmVhdGVfYmxvYigibG9ncm0iLCAwNDQ0LCBnc3AtPmRpciwgJmdzcC0+YmxvYl9ybSk7DQo+
ID4gKwlpZiAoSVNfRVJSKGdzcC0+ZGlyX3JtKSkgew0KPiA+ICsJCW52a21fZXJyb3IoJmdzcC0+
c3ViZGV2LCAiZmFpbGVkIHRvIGNyZWF0ZSBsb2dybSBkZWJ1Z2ZzIGVudHJ5XG4iKTsNCj4gPiAr
CQlnb3RvIGVycm9yOw0KPiA+ICsJfQ0KPiA+ICsNCj4gPiArCS8qDQo+ID4gKwkgKiBTaW5jZSB0
aGUgUE1VIGJ1ZmZlciBpcyBjb3BpZWQgZnJvbSBhbiBSUEMsIGl0IGRvZXNuJ3QgbmVlZCB0byBi
ZQ0KPiA+ICsJICogYSBETUEgYnVmZmVyLg0KPiA+ICsJICovDQo+ID4gKwlnc3AtPmJsb2JfcG11
LnNpemUgPSBHU1BfUEFHRV9TSVpFOw0KPiA+ICsJZ3NwLT5ibG9iX3BtdS5kYXRhID0ga3phbGxv
Yyhnc3AtPmJsb2JfcG11LnNpemUsIEdGUF9LRVJORUwpOw0KPiA+ICsJaWYgKCFnc3AtPmJsb2Jf
cG11LmRhdGEpDQo+ID4gKwkJZ290byBlcnJvcjsNCj4gPiArDQo+ID4gKwlnc3AtPmRpcl9wbXUg
PSBkZWJ1Z2ZzX2NyZWF0ZV9ibG9iKCJsb2dwbXUiLCAwNDQ0LCBnc3AtPmRpciwgJmdzcC0+Ymxv
Yl9wbXUpOw0KPiA+ICsJaWYgKElTX0VSUihnc3AtPmRpcl9wbXUpKSB7DQo+ID4gKwkJbnZrbV9l
cnJvcigmZ3NwLT5zdWJkZXYsICJmYWlsZWQgdG8gY3JlYXRlIGxvZ3BtdSBkZWJ1Z2ZzIGVudHJ5
XG4iKTsNCj4gPiArCQlrZnJlZShnc3AtPmJsb2JfcG11LmRhdGEpOw0KPiA+ICsJCWdvdG8gZXJy
b3I7DQo+ID4gKwl9DQo+ID4gKw0KPiA+ICsJaV9zaXplX3dyaXRlKGRfaW5vZGUoZ3NwLT5kaXJf
aW5pdCksIGdzcC0+YmxvYl9pbml0LnNpemUpOw0KPiA+ICsJaV9zaXplX3dyaXRlKGRfaW5vZGUo
Z3NwLT5kaXJfaW50ciksIGdzcC0+YmxvYl9pbnRyLnNpemUpOw0KPiA+ICsJaV9zaXplX3dyaXRl
KGRfaW5vZGUoZ3NwLT5kaXJfcm0pLCBnc3AtPmJsb2Jfcm0uc2l6ZSk7DQo+ID4gKwlpX3NpemVf
d3JpdGUoZF9pbm9kZShnc3AtPmRpcl9wbXUpLCBnc3AtPmJsb2JfcG11LnNpemUpOw0KPiANCj4g
Li4uYWxsIHRob3NlLCBpdCBzZWVtcyB5b3UgZm9yZ290IHRvIHN3aXRjaCB0byB5b3VyIGhlbHBl
ci4NCg0KT29wcy4gIEkgdGhpbmsgSSd2ZSBiZWVuIHdvcmtpbmcgb24gdGhpcyBwYXRjaCB0b28g
bG9uZy4NCg0KSSB3aWxsIHBvc3QgYSB2MTAgd2l0aCBzdHJ1Y3QgeyAuLi4gfSBkZWJ1Z2ZzIGFu
ZCBjcmVhdGVfZGVidWdmcyBmaXhlcy4gIEJ1dA0KSSB3aWxsIG5lZWQgeW91ciBoZWxwIHdpdGgg
dGhlIG1vZHVsZV9pbml0L2V4aXQgY2hhbmdlIGlmIHlvdSBzdGlsbCB3YW50DQp0aGF0Lg0KDQo=
