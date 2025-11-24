Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DAB4C82CD0
	for <lists+nouveau@lfdr.de>; Tue, 25 Nov 2025 00:25:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2586A10E26C;
	Mon, 24 Nov 2025 23:24:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="CONuyVjr";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from PH0PR06CU001.outbound.protection.outlook.com
 (mail-westus3azon11011052.outbound.protection.outlook.com [40.107.208.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 876DA10E26C;
 Mon, 24 Nov 2025 23:24:56 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fzNRf6/MF4I8+0AXEl0MCzsFyVa4xu0aANkDRspuikgXBf6aRjtoDUUryOM/oxPw6KTTPTnbOSraUvacuDROMlee816M/GpVs4L1q648Zh1saA4hoXBFz17vrySBkBw0th7DGRVNDVAsUP1ghksO31kRyFHt6Njn2b6qembjRCoTkPvFF8/KZsSuOVgiUOSEOiMsfkSr24rjCIo0YIpH1cc3Tpwk3KoC9M9x6oe4oXSgQyfFP2RSkdEM5wSmLWJFsEBYrurgZFlR33I/gld1KiUYFB46xcWCMkRgFORPMcT4EVbg24vwJSximdfYL633/8MjymI9+9pDiWzoaAIyRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dGMBPNdpmhYmhbRi3llnYS86CDjOuDW7qtoVIC52Sas=;
 b=KSPU1LGi1gs52BmsacjjedZTdez5yzouMFit+Z6nGFPmmdmKrUe1GEUmIxE5GXr7eQKgEKqv0aj+1jkUCIuMD+66CTCroQ0/SR8aGsjtcdFcf6d3zrgvVJ9H6itIdb7OYGWqrOsh1CHtYfFamS77V4ft6fyKbb5OY0VsrFcJiCZApK3fU4kaL3XzbTAZUdxxSMQHE/trtFAaZwQSM9jTEn7mJFrd7apSKdjTqzWzOuDFPGHh/mB4kvERidfFwbOD31AmR4yvO1uIDVB/DMcZocZTfTU4eXtI841rxlXUJnEeL8Qnp+GL31n0m8U4jMz9XMj7q/8m6EjTWc7C9StE+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dGMBPNdpmhYmhbRi3llnYS86CDjOuDW7qtoVIC52Sas=;
 b=CONuyVjrXtoKcLxZ5Oh3TD5H4gEY0wMca1YZa1gNxIIypGIioAjqfdkjmeJvD0wqMFgPIMt6lepC2poitHRNvcYspr8nuwKVScXikXZsTPJ8Of+LeXcAUm/YkUHbuhNNfgCFsJhjxDCLizRIRuN6Vh+m07q5bmJlMyXQ6n6xA3I2XbiWEFcRGV+qnAFDoKOhAPJFV0Tz743w797Uau1ZBhpr5aJDakPOinj2IjfkXi6o8Z6jAniiA6i4uUnIf1iRiW2zCFQItSov89ywcAxh2VcRl20zcNv6ozJMP1nDSz0qm04vbW6SI5WLlio6Hr88ikdq+YN3zON7QjVEjPfhiA==
Received: from PH7PR12MB7937.namprd12.prod.outlook.com (2603:10b6:510:270::21)
 by MN2PR12MB4336.namprd12.prod.outlook.com (2603:10b6:208:1df::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.17; Mon, 24 Nov
 2025 23:24:52 +0000
Received: from PH7PR12MB7937.namprd12.prod.outlook.com
 ([fe80::805e:c531:4f9b:57f6]) by PH7PR12MB7937.namprd12.prod.outlook.com
 ([fe80::805e:c531:4f9b:57f6%4]) with mapi id 15.20.9343.016; Mon, 24 Nov 2025
 23:24:52 +0000
From: Timur Tabi <ttabi@nvidia.com>
To: "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>, Alexandre
 Courbot <acourbot@nvidia.com>, "dakr@kernel.org" <dakr@kernel.org>,
 "lyude@redhat.com" <lyude@redhat.com>, Joel Fernandes
 <joelagnelf@nvidia.com>, John Hubbard <jhubbard@nvidia.com>,
 "rust-for-linux@vger.kernel.org" <rust-for-linux@vger.kernel.org>
CC: "nouveau-bounces@lists.freedesktop.org"
 <nouveau-bounces@lists.freedesktop.org>
Subject: Re: [PATCH 03/11] gpu: nova-core: support header parsing on
 Turing/GA100
Thread-Topic: [PATCH 03/11] gpu: nova-core: support header parsing on
 Turing/GA100
Thread-Index: AQHcVb7G2n7lcTwiZ0ixsrXV3K+7w7T5U1aAgAAocQCAAB4CAIAI7cmA
Date: Mon, 24 Nov 2025 23:24:52 +0000
Message-ID: <8026f53d6685374bfc086621326e9d7c52009d4c.camel@nvidia.com>
References: <20251114233045.2512853-1-ttabi@nvidia.com>
 <20251114233045.2512853-4-ttabi@nvidia.com>
 <DECBWUFEHV5D.3O0TH2AL775C0@nvidia.com>
 <fb673d50111ed0989ec8ba2a245e89eecaeb1864.camel@nvidia.com>
 <DECH9WO4EGMP.24N37TGWZV4NL@nvidia.com>
In-Reply-To: <DECH9WO4EGMP.24N37TGWZV4NL@nvidia.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.52.3-0ubuntu1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH7PR12MB7937:EE_|MN2PR12MB4336:EE_
x-ms-office365-filtering-correlation-id: 90b17f0e-b038-47b8-56be-08de2bb0ab54
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|366016|376014|1800799024|38070700021;
x-microsoft-antispam-message-info: =?utf-8?B?cDNtdjUyelhuK0ZOS1NBZGpXeVpHd0tiVGVZem90T1B1bWk3MjFqVmtZMEpp?=
 =?utf-8?B?TUpuQ2I1L3pMM0ljR1h1ajdQQjFTTzBydlkvSExjUHdFWXIzVHZFTW1RN3gv?=
 =?utf-8?B?d2ZwbEVKeEkwYkFwRGxnRUhCSStzbmhLTTNFQURJVCtxNXdGaVVVZm1LYi9Z?=
 =?utf-8?B?bFI0c0c3aDdvMHQ3TFRvRGNaaHIzM1ZPbnZuK1A3Ti9VVjVQcWNraXRYaU5y?=
 =?utf-8?B?QzdYWTlKVzd6VHVyMFNhQndSbWdPc2FzTHdyRGo2RmFuei9PLy9IL3ZNT2Nt?=
 =?utf-8?B?NWlxakttVjExcUcwbWlhNnFVVytzVGpBTTZVcVd0cGpEMkJUVUVzb3JiSm0y?=
 =?utf-8?B?dks4M0dKV3NlRWtUdzVqY05kSFQ2dGFVQUlkcVl4Mmh1NXVoUXNYT1FtTUVW?=
 =?utf-8?B?dGp2ejlRcEZ1Z08zMmZsQkhHWVFjRVZUY0hFallNZWNKdTlSQkR3UnF4TnAx?=
 =?utf-8?B?dU5YblMzUVAyc2l4OW1GSy9hQ3dMMk8zOVBQR0FLOU15azR2MU5lYXVGTUx1?=
 =?utf-8?B?NTRnT1Q5dHNlUnlaMHdXcU5rVWZNZUxueUlXc3BiektSdE9udmtqSnl5d0F2?=
 =?utf-8?B?YlBZY3VvRkxUdVVPK3Jod2h3NGhpblFibzRGWDdSUTIrbHZaWXhUL21helJa?=
 =?utf-8?B?YmdGUmFwYzNGSXJQR1lCR0lKNzJrQzlaTGpVanZkNUV3TGRKUWROYXp1RStr?=
 =?utf-8?B?UXROQnR1b0dFL05yV3hBMlFOVHNpZEFMczZrRlFEQ1Nha2t4SEtlZXl1bHZZ?=
 =?utf-8?B?MnVBSGlmek1raFRzZW82c1BrL0ZOajZOVk1FMnBWMTlyQk1pSTB4US9PdEJF?=
 =?utf-8?B?TWNMVFB3QVFwSzJoVzgrcEFLdFRKOXdjUGJObDNKdXcycFVNUEp6Q0hkU1NO?=
 =?utf-8?B?Wm03RnFWMVVLRU1GNHZFM2FiamxvNXBzTVJ2VjMxS3EyQmZDb1ZRa1FqY2Zt?=
 =?utf-8?B?R3hBTGY5WlIrQ0R4WlgxSWc4bVg5bWlMd1FOTHl2ZGJOV1RiSW53bFJNak5y?=
 =?utf-8?B?UzN5dUloVnY0SklZNmF4dFV0MkpzekxYTGo1c0VoMElUQmlDSGZWZ1JpOS8z?=
 =?utf-8?B?NjFPeUVsUzNycWtLbWtpL3IwWUhTNUM3UG5mZTVSOUlTY2xLUDBNcWNiVmtk?=
 =?utf-8?B?TEFNTFladWErdlZSbThxeEhoSXRiQ3pZVm0xc2RtcUpTbTdveWZPNnRvREQw?=
 =?utf-8?B?L0VRQzNEcTRib1pwSy95cUtyOXNBc0w3VFhwNEZGRHcvQXduckNWcFZZTHBs?=
 =?utf-8?B?TjBjcFNUem4walNFeTIxWlk3RVBLNlBQd2FuT2hsRXpUSDNyUGNjSml5WFJi?=
 =?utf-8?B?bkJlZGVSRkthTE91azZGZ1FzdHNLUWdPNmhSMThiVmdhbURkRHpvbTl1WE5p?=
 =?utf-8?B?VjRBbjdvMlI2aW83SHphMFYxajBDeGNQeUd0bHlCd3JFdjVXMTFqT1FQSFhl?=
 =?utf-8?B?a1dlaDV6ZlZxZWp5MGtlT3dXR1RMR2UzNnBpaWd1RHBRNE42Qit3MG1JWVA5?=
 =?utf-8?B?enJBdEVNSkQ5T2NoSkR5aGEzNi9OV2U1VTlEaEJBRHhyNXRLNUFrNG1YV0lB?=
 =?utf-8?B?L1dxNkhtYldmV3VELzFLSXRabGk4bXFTdElsLzBWallraTgvb3JsUVRiaUhI?=
 =?utf-8?B?dzNoVHM1UTAwSUFBdUVPd2h4ZWp6eGprRE9aalhGRzBvZ1RCN2lpejdxVlR4?=
 =?utf-8?B?aVFpQ0ViSzhqNnlyZjlwRFRha091WVE5T0l0WFRQYnQ3RW1IK243dFpmTHA3?=
 =?utf-8?B?M1lUZ09jaGo2YnlHWGJ2OTNEekRpTGV0VTNvcDN5Wnk2S1NwM2dMRElhL2ls?=
 =?utf-8?B?NWlNbkZESG1SVGplallIUTFla1pQUzh5dFFNOUVhcUk2WHQxSWFCWHhYL0R1?=
 =?utf-8?B?WlA5bGNpMEwvRlcxWThIUEVsV1FNbVJlYVh3M01obk9lWlJ4Zm5TbkN0azlY?=
 =?utf-8?B?czJEaGpWUUxrY2MvWWRjcEZHck1lMFMvOVJrT0R2SVE0aGloZ0ZESWQzTUVB?=
 =?utf-8?B?dEkxeno1TmZ2TXVuWFdISmh3TnBKRkR5Z3luUDVvWHBqK2FOckR4d3Zaajdu?=
 =?utf-8?Q?/LppEE?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB7937.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(38070700021); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?aWl4QkpGdDF4eEMyMVgzd3dDcTJaYldBeHdIVks0R3JPTzZhRVduNTBUNnMx?=
 =?utf-8?B?aWJZWW5ZVHdwWUQwLys0VzNSdk11YWcwMnBrQnpBNncvNE40azE0RWYxcGN2?=
 =?utf-8?B?YStVMDNEVExpV1dycDc3dzRQY0h5MmhUWnJCUkpTZ1FBekRWc2ZLZ25qVmQ1?=
 =?utf-8?B?YnVQcDgvUjcwL3BwNWxyMVlYVTYxQWtvbUNVTlRxanFTRE83a1ZnZG5TZC83?=
 =?utf-8?B?NFNpK0hObTQzTFU5MlBDMWppL1BubXBCVS9GYXlUb0dKdUxBcE9OWlMyZHpF?=
 =?utf-8?B?aUwyWEV2R1dINjMvaktPdjZ0NUcvc0dIeWdlRHhVZDVVOFRnanZMUzYzSGpp?=
 =?utf-8?B?S3paZkxrQlRja1gwZFVVdi9WcGxwd0duai9NcCtVNHNBYWhFTkJFeTNYWkxM?=
 =?utf-8?B?TS9SQkN4WlVWUlJMcEcwbWF3aGs1Nlp5Y3IxQXRwekloKzNPOW14L2trVGp6?=
 =?utf-8?B?SVRKeHRwVWlxNW9vVHhkT0pzbEpMQmkvQjZ6eDY0YVBNZnNpK2RvMWxqNUh2?=
 =?utf-8?B?SHIxdzJ6M3BDYjNDT1dsd3YrNjdhM2tGUStkNjVLNmhBVDFkS2RQYnFZaG1t?=
 =?utf-8?B?bHpqdzlVVlFZcXVOTXRjdFVmNVhSbXBEM1ZGa1Q4OVl3QWFhc0ZJT3BiemhS?=
 =?utf-8?B?dWI5NmZLSWtnU1J0b1RtcWZnVkM2SFo1R3BZSWRZSEM1YTQrQ0h3V3A2VHN6?=
 =?utf-8?B?RXR3aHRRdzhGNjdDbjZtaUdzd29zd1VEUDJ2cGNYV2hpN1VUcXFPb0VzUWtT?=
 =?utf-8?B?L2tZVlJMTEN3NW1TQXFxSDZXc0VET0xzWWZvd0hkRVhNV2FvaTVyRnMwS1Uw?=
 =?utf-8?B?Zmtmd3h1QWdBTEV0RHBWVlBNM055R2lQcXNPQ1RRZTJiY1BqWHUvS2JPd0JG?=
 =?utf-8?B?SWNsbURnMHIrOGxtSmk3UFJGQzR6Vitldnl3OUZEOWtuVlFrYTd0K3gwcENO?=
 =?utf-8?B?b243YjFCMEprby9YeDNYcmVXeUxNRDQwVTYwQXcrV0xWRkRnZXlmZzlQZ1d3?=
 =?utf-8?B?cWJDdlVoaFh3RHRZeXpxaFpVaDVFRnhQejZXNmFLb0VzSjBIclRJY2tnTHFT?=
 =?utf-8?B?aGh1WER2VEFPUms4cDd1S1hZWHBHOTRwK3VlNTBiZFpvMEt6b1lKby9waFRL?=
 =?utf-8?B?SzZXNTZ2bG9GQ3RGbzdsSmFjOVhmVG5NK2Z1VnVSUmlGang4bXZ4ekpSYXR0?=
 =?utf-8?B?UGRBZmdSOUIwM3FVSFNUMWVjMDBlV3l1VWhVbXBXYXpEb05wdFBzR0paUklL?=
 =?utf-8?B?MWZGbDVXUVBtLzYzOUFJeDEyaEV1SEx4eTdUaGZ6dEhIWEN6dlJiVE12SHhr?=
 =?utf-8?B?UDFiaXpVajZJQ2xHOVZsUlNsSkhtT21lbERvYlBGSDUxbUV6OUN1dGpGdTZH?=
 =?utf-8?B?bmtuTGJvRlVqYUw5WEUwSjVwZ0pFTmoyQkx4ZFJTK1ZlYVNjUHVXcVd6Q2Nj?=
 =?utf-8?B?SWFTUlozc1dWV2xFSmMydG93TGhubmx0cExMNmE0MjlBSTREa2lNYVJtc0px?=
 =?utf-8?B?NzQ4WjlQTHUzWEsyZHg5bFBvM2haNlYvWEx5aGkyczk5Y2hsVmEvMU5JVnEx?=
 =?utf-8?B?MGhHQXNpd21JdW5XYlFBdDdnMkdRS2g4cG0xVnQrZWxEa0NiSHZHcWp4Zzgw?=
 =?utf-8?B?dE94Z0pOOVljL3J5OXRYUGdsNnJYcHNJYXlsUmtrS1VYSWw4bkxiQkp2cU01?=
 =?utf-8?B?WmFualZrakN4SmlrNG1YMGgxeDZvRWhJcVFQdlEwZWRCd1dIY2N6MDlqdm1Z?=
 =?utf-8?B?Q29FNjhQbUJFMW5NUHhsYy92RlNpNXlOeXAwNEpNUy8vckNnVEpRcnppRVpH?=
 =?utf-8?B?MjB6VXZnR09FTEIxN0JBMnRiejlTRE9mamp6UW1Qc1RkVFV4eno3WEZBUE9N?=
 =?utf-8?B?Mmt0eTREOEJnOVlXTTJ1bTc2VFoxdHJKaDI0T2JVT1J5VTdyVmI0Sk5KU3lT?=
 =?utf-8?B?dlIrVnhDK1ZKWGpQd21YZjhza1I0QTBiREd2akZ4d3A0WmhlYUhMaG5EOHha?=
 =?utf-8?B?aHdYSEdqWWZRb0M1aGtXMVRYL05XdEY4Y3EwMEV6UVFscit5d292UERiSWFw?=
 =?utf-8?B?MzlDbEtDcElza0J1cFAxcW1RMW5ud0RkNU5FNmJZSlNqaEJ3RUVON2tZem1a?=
 =?utf-8?Q?11skYqEyL9Hnz6wkbrXEPRbuJ?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <6567AD89AE773747B1DFC2035F6CC2A7@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB7937.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 90b17f0e-b038-47b8-56be-08de2bb0ab54
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Nov 2025 23:24:52.1468 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: FC7qSDCcd0R8zOCQGyf70gk5f6rbnWfY4kRQ6hhprQBl9TN48ffuOhovfooZyKLiy1f0tZXsUkdStTLMhNiR0Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4336
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

T24gV2VkLCAyMDI1LTExLTE5IGF0IDE2OjAzICswOTAwLCBBbGV4YW5kcmUgQ291cmJvdCB3cm90
ZToNCj4gSWYgaXQgY29tZXMgZG93biB0byAiVGhpcyBpcyBob3cgdGhpbmdzIGFyZSBwcmUgYW5k
IHBvc3QgR0ExMDIiIChhbmQgdGhlDQo+IGV2aWRlbmNlIEkgaGF2ZSBzZWVuIHRvIGZhciBzdWdn
ZXN0cyB0aGF0IHVuZm9ydHVuYXRlbHkpLCB0aGVuIHNvIGJlIGl0DQo+IC0gd2UgYXQgdGhlIHZl
cnkgbGVhc3QgZW5jb2RlIHRoaXMgYXMgYSBtZXRob2Qgb2YgYENoaXBzZXRgIHRvIGF2b2lkDQo+
IGhhcmRjb2RpbmcgY2hpcHNldCB2ZXJzaW9ucyBpbiBzZXZlcmFsIHBsYWNlcy4NCg0KSSBjb3Vs
ZCBhZGQgdGhpcyBtZXRob2QgdG8gQ2hpcHNldDoNCg0KICAgIHB1YihjcmF0ZSkgZm4gc3VwcG9y
dHNfZG1hKCZzZWxmKSAtPiBib29sIHsNCgkqc2VsZiA+IFNlbGY6OkdBMTAwDQogICAgfQ0KDQpC
dXQgc2hvdWxkbid0IHRoaXMgYmUgYWRkZWQgdG8gdGhlIEhBTCBpbnN0ZWFkPw0KDQpUaGVyZSBh
cmUgYSBmZXcgdGhpbmdzIHRoYXQgYXJlIGFyYml0cmFyaWx5IGNvbmRpdGlvbmFsOg0KDQoxKSB3
aGV0aGVyIHRvIHVzZSBQSU8gb3IgRE1BIHRvIHRyYW5zZmVyIGZpcm13YXJlIGltYWdlcyB0byBG
YWxjb25zDQoyKSB3aGV0aGVyIGEgR2VuZXJpYyBCb290bG9hZGVyIGlzIG5lZWRlZCBmb3IgbG9h
ZCBGV1NFQw0KMykgd2hldGhlciBhIE5vbi1TZWN1cmUgSU1FTSBzZWN0aW9uIGV4aXN0cw0KNCkg
d2hhdCB0aGUgbmFtZSBvZiB0aGUgc2lnbmF0dXJlIHNlY3Rpb24gaW4gdGhlIEdTUC1STSBFTEYg
aW1hZ2UgaXMNCg0KSWYgSSdtIHJlYWRpbmcgaXQgcmlnaHQsIGJvb3Rlci5ycyBjdXJyZW50bHkg
aGFzIG5vIGNvbmNlcHQgb2YgYSBIQUwsIHdoaWNoIGlzIHdoeSBJIGdhdGVkIG9uDQpDaGlwc2V0
LiAgSSBhZ3JlZSB0aGF0IGRvaW5nIHN0dWZmIGxpa2UNCg0KICAgICAgICAgICAgICAgIEZhbGNv
bkxvYWRUYXJnZXQgew0KICAgICAgICAgICAgICAgICAgICBzcmNfc3RhcnQ6IGFwcDAub2Zmc2V0
LA0KICAgICAgICAgICAgICAgICAgICBkc3Rfc3RhcnQ6IGlmIGNoaXBzZXQgPiBDaGlwc2V0OjpH
QTEwMCB7IDAgfSBlbHNlIHsgYXBwMC5vZmZzZXQgfSwNCiAgICAgICAgICAgICAgICAgICAgbGVu
OiBhcHAwLmxlbiwNCiAgICAgICAgICAgICAgICB9LA0KDQppcyBub3QgaWRlYWwuICBUbyBiZSBo
b25lc3QsIGl0J3MgaGFyZCB0byB3cmFwIG15IGhlYWQgYXJvdW5kIGFsbCBvZiB0aGVzZSBvZmZz
ZXRzLiAgSSdtIGNvbnZpbmNlZA0KdGhhdCBtb3N0IG9mIHRoZSBjb25mdXNpb24gaXMgdGhlIHJl
c3VsdCBvZiBSTSBkZXZlbG9wZXJzIHRyeWluZyB0byBzaG9laG9ybiBjb21wbGV4IGZpcm13YXJl
IGltYWdlcw0KaW50byBsZWdhY3kgZmlsZSBmb3JtYXRzLiAgSnVzdCBsb29raW5nIGF0IHRoZSBh
Ym92ZToNCg0KT24gVHVyaW5nLCB0aGUgc2VjdXJlIElNRU0gaW1hZ2UgaXMgY29waWVkIGZyb20g
YXBwMC5vZmZzZXQgaW4gdGhlIGZpbGUgdG8gLT4gYXBwMC5vZmZzZXQgKDI1NikgaW4NCklNRU0u
DQpPbiBBbXBlcmUsIHRoZSBzZWN1cmUgSU1FTSBpbWFnZSBpcyBjb3BpZWQgZnJvbSBhcHAwLm9m
ZnNldCBpbiB0aGUgZmlsZSB0byAtPiAwIGluIElNRU0uDQoNCldoeT8gQXBwYXJlbnRseSwgYmVj
YXVzZSBvbiBBbXBlcmUgd2UgY29weSB0aGUgU2VjdXJlIGltYWdlIHRvIG9mZnNldCAwIGFuZCBp
Z25vcmUgdGhlIE5vbi1TZWN1cmUNCmltYWdlLiAgT24gVHVyaW5nLCB3ZSBjb3B5IHRoZSBOb24t
U2VjdXJlIGltYWdlIHRvIG9mZnNldCAwIGFuZCBjb3B5IHRoZSBTZWN1cmUgaW1hZ2UgdG8gb2Zm
c2V0IDI1Ni4NCkl0IHdvdWxkIGhhdmUgYmVlbiBtdWNoIGVhc2llciB0byBjb3B5IHRoZSBTZWN1
cmUgaW1hZ2UgdG8gMjU2IG9uIEFtcGVyZSBhbHNvLCBidXQgdGhhdCdzIGp1c3Qgbm90DQp3aGF0
IGhhcHBlbnMuDQoNCkZvciBzb21lIHJlYXNvbiwgb3NfY29kZV9vZmZzZXQgYW5kIG9zX2NvZGVf
c2l6ZSBjb250YWluIHRoZSBzYW1lIHZhbHVlcyBvbiBib3RoIFR1cmluZyBhbmQgQW1wZXJlLA0K
YnV0IHRob3NlIHZhbHVlcyBhcmUgdXNlZCBvbmx5IG9uIFR1cmluZyB0byBob2xkIHRoZSBOb24t
U2VjdXJlIHNlY3Rpb24uICBTbyB0aGUgZmlybXdhcmUgaW1hZ2UNCmhlYWRlcnMgc2F5IHRoYXQg
dGhlcmUncyBhIG5vbi1zZWN1cmUgSU1FTSBzZWN0aW9uIG9uIEFtcGVyZSwgYnV0IGl0J3MgYSBs
aWUuDQo=
