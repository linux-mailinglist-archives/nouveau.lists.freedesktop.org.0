Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 54803CA99CC
	for <lists+nouveau@lfdr.de>; Sat, 06 Dec 2025 00:22:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 25CAE10EBD8;
	Fri,  5 Dec 2025 23:22:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="j3b5bNoU";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from CH4PR04CU002.outbound.protection.outlook.com
 (mail-northcentralusazon11013010.outbound.protection.outlook.com
 [40.107.201.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3188110EBD8;
 Fri,  5 Dec 2025 23:22:08 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FqnTl0DmcbbA4cpzNi233KZeGT55Q8TIoF1cvePN6/EKDY0r/mI1+z3oTi0r/nB4mIAX0rQ6BRzJgI1MI9tTjTZcYqwQBUvDt1tjAXLIRccQf6U2ZZq9VwhX9TEvY9hJhZGx+unlaVKMirAKrMGUbRP1qNBrnOZcnsXUAUXb7Es+DMzW0Sp4bQGZezaDPFwCj1aHCZm2B6tPLUa8EMX9pOKxyzv+KTrJQktw364sGw0kRYaWjpXVYlAY8bqAAorcbAuJOuI0e5BpL2+gFq247Jh9ehhV6NNhjUFXuM/25u8ogwuo6awHL5G+avN7LOXxyqPsy7wjzs9VyqhOkY5GOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lR0SnIWgaiY7F7hQWgJWNO6+MRYcJXvEZMPcnokMP40=;
 b=kyqtZl7NIURbT+JmusBSW06rIpQ8Sd9mA8XfV+tRVVfqBTrEeb0/hqy1RQSGsoZfjBz8fE4JkQmivMWJCafF7ZYH+l9LI5OJ1QDWGf0MOvwI6cnkAdFjOhe+IcAk9I8/NkUfp6WR0kQm6WhA/gW9bOZCW1KC+KOmM+kbLsGassnouKGkFnh3/Y6are6qaiUe83tumdLSXnPgv87ios/y466+69/qQLIx93DZsaJcQTm+N/9TCTCwX3H5WYvcE0GMJAEbLcO1smROUbaGqgI8YPxyi7JGFmx9VHXu6lJchTHdA5DscF4Dq0fi89pycx3TLPWJCy9CwIlyjdri1HWfcw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lR0SnIWgaiY7F7hQWgJWNO6+MRYcJXvEZMPcnokMP40=;
 b=j3b5bNoU53D1Ya8kRTp7b7JVi7lyEhmmlPIMe00UcONxgw4aQaytKP/rzZ3B3uTw7IMijzZ9IHgdPRGDuNMtDjI7jY+SrBQwAWYajIUEKaqmmnN5uOgaUSODfX1V39ZMkq18QwvHEjfGlQSIOeIQBNZya0/To7acOO4ISC3QGnqvvnjbPK6qp3AdJK5Dyaz/wdqa4ui9zjpEfFpqz1TlyAxgX/VVfKzU4RhFuO4SAlPX6vZutOixvFIk+z5GaniuJRQEn94r/S36YvKUrviPld0N7LW9PY/UAaP+Uq+uCJKrCJQ4azX0NDnFZBWFw4DvRlKZYP2SaOJwxlzTHNneDw==
Received: from SJ2PR12MB7943.namprd12.prod.outlook.com (2603:10b6:a03:4c8::10)
 by IA1PR12MB8190.namprd12.prod.outlook.com (2603:10b6:208:3f2::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.17; Fri, 5 Dec
 2025 23:22:02 +0000
Received: from SJ2PR12MB7943.namprd12.prod.outlook.com
 ([fe80::6a18:df97:8d1a:5d50]) by SJ2PR12MB7943.namprd12.prod.outlook.com
 ([fe80::6a18:df97:8d1a:5d50%4]) with mapi id 15.20.9388.009; Fri, 5 Dec 2025
 23:22:02 +0000
From: Timur Tabi <ttabi@nvidia.com>
To: "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>, Alexandre
 Courbot <acourbot@nvidia.com>, "dakr@kernel.org" <dakr@kernel.org>,
 "lyude@redhat.com" <lyude@redhat.com>, Joel Fernandes
 <joelagnelf@nvidia.com>, John Hubbard <jhubbard@nvidia.com>,
 "rust-for-linux@vger.kernel.org" <rust-for-linux@vger.kernel.org>
CC: "nouveau-bounces@lists.freedesktop.org"
 <nouveau-bounces@lists.freedesktop.org>
Subject: Re: [PATCH 10/11] gpu: nova-core: LibosMemoryRegionInitArgument size
 must be page aligned
Thread-Topic: [PATCH 10/11] gpu: nova-core: LibosMemoryRegionInitArgument size
 must be page aligned
Thread-Index: AQHcVb7O8BOTeMMK20yX23bEM4/ssbT5X+OAgBQoLwCAAmObgIAAbumAgAFSlYCAAG55AIAAB2+AgAAvoACAAX2qAA==
Date: Fri, 5 Dec 2025 23:22:02 +0000
Message-ID: <5c0eddd0aeb573ea7f73a285924acd1732a71c56.camel@nvidia.com>
References: <20251114233045.2512853-1-ttabi@nvidia.com>
 <20251114233045.2512853-11-ttabi@nvidia.com>
 <DECCV8XB5U56.1NBFD1KFJ59LU@nvidia.com>
 <b28cff274d79de78496c7f0fcc3627b2f816d3dc.camel@nvidia.com>
 <DEOK871CSNZB.W94R3SDUDZ22@nvidia.com>
 <df975795b0dbe58214ad302d7182ce6fe92e5fd8.camel@nvidia.com>
 <DEPIFZFMH34K.31NETCKSPOIEL@nvidia.com>
 <3c6219f90ca9e1d548c98ab1c54857a63a5d94cb.camel@nvidia.com>
 <ae07b871896b79e3d6180874dfb07d4d3aed4bdc.camel@nvidia.com>
 <DEPV1LDH9K7I.2GGJ4YQ6UMGMS@nvidia.com>
In-Reply-To: <DEPV1LDH9K7I.2GGJ4YQ6UMGMS@nvidia.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.52.3-0ubuntu1.1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ2PR12MB7943:EE_|IA1PR12MB8190:EE_
x-ms-office365-filtering-correlation-id: b648d4f8-a1cd-4a14-38a0-08de345518d4
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|366016|376014|1800799024|38070700021;
x-microsoft-antispam-message-info: =?utf-8?B?cnVsaXpETTBBVzJVbnV1NmU5Z1A1WjB6SUZnMGgweS9aeG9ZdWcxMlRrMnVT?=
 =?utf-8?B?M2NDTHNEbVZuSHhteUVpSTFZWVRBTlhaZ0lJRDNMbWFPTlkwVlA2NmxhWnVL?=
 =?utf-8?B?bmh4eDhCaEd0UEZNNVhUaDh4eGg3dndNZ2FRUHMyNDVhNFZmTTltRUR3cXlP?=
 =?utf-8?B?NldJb2JPZWRFeHBRNUx6NWpZZXM1SFBrQS84blpSSmJXQWF4NmR5RUNpUXFn?=
 =?utf-8?B?bnRZUXA4UU53YVFtcUtxVHczSHowSXY2SzVLV0Vra1p2OW9yQ01zVFB0aVNj?=
 =?utf-8?B?VkhodFA2NTVtbXdjdlBYT0NXc0Yya3g5KzY5eklWck5QdkRrVUdxdWRlL082?=
 =?utf-8?B?N2tUcXVGT1B0bTVCOGY3UVZrQS9kakNkRy81aDVsZmFHRWs1S3hmZ0Q0bEtD?=
 =?utf-8?B?WkE4NngxVVpQZkE1QUREVHlJYUY3Vm1jODRiMFBwK3ZEY2pEdHVnVER4UWhm?=
 =?utf-8?B?NlMvL05ySmZpdkxsUnN4dDJzbEV5aFZuVElMUytuYnY5TVExVkdMVjFvaGdQ?=
 =?utf-8?B?Tzh2bFpkcUFLUjNRRk04eFo5YU0xS2dwK1k3dUdMWjFBeGtYTE9rcjdsbVU1?=
 =?utf-8?B?bktKQ05WeTNNYkdXT2JWVk9ML1VvVjhpRUI1NTNQa1dQZ1hjV1hNRDRyVnZs?=
 =?utf-8?B?S2pNNDQ2OEJ3UVJaVWV0anNQbjViemIyK3V5STkyWHRqalY0RTBQSTRydDhZ?=
 =?utf-8?B?dElYQWJWOUxMWnZINTl4bklOZDJTbmFsSUdHbk5uSUl5aCs1cW1ZZDFSNDNo?=
 =?utf-8?B?TzB6eEY3NXRqMHRrSm1OeVhnVWZGWHJVcEhxQkFKODd0aHJ2cTVEM3FJc2Fi?=
 =?utf-8?B?UVB0eHM4YzV6RXdjRHluQ1NTNFdJOXFZOFFGSklIbmkwSjJlV3NaSWRHRXVE?=
 =?utf-8?B?akJ3c1lvOFhtTkhpQUtuM1ozcTRBaW4wUFpldklNdzVkUkJnZHF2N2VHRG5o?=
 =?utf-8?B?WEdFaDlnLy96SHNLaVdac0Z2VjJIbjJBZ2pGMmNIRXlWM1pSYkxSUlo4elNn?=
 =?utf-8?B?TEFjb0hVaXNHK3FzcUdoeE9EbGRZcG96VEpFMmhoazlxMWpGWFY5RzRpWW1O?=
 =?utf-8?B?YkRpTno1cVZwcUR4NVJMNzVPcUVSQ1BsYkF0d1dUSG5JdWV5R1ZGdmlsQ2Zr?=
 =?utf-8?B?OGlTa09SZm9aNFBVZTQrK2ZEWm5pejROT3pNeTVkSWpBUnpDRldJcGhNRTV2?=
 =?utf-8?B?bW84RHg2Zi9oWEJYTCt0dHQyWnBWUXhNbTJKK0RIKzd4T0lTZFUvdWNtM2tO?=
 =?utf-8?B?bU0vWU9vZW5XRjJzdnltaGdTSXQ3cVB1OVF6MWMrSUgzcHdkQVhEM3VFUTJq?=
 =?utf-8?B?QTJ0UklRVlN2MVVEbUhPR0xSandoY3c2ZVNpcGpubGJCSE5tbGJZZEh5bUlJ?=
 =?utf-8?B?ZElqbG1kRThQWlhuWDM0YkkzQnJyUjY4akVVTWtwNzVMYUVSVnM4aTh6QnY0?=
 =?utf-8?B?K0tHUkw0blRFcGRGVnlxN0JrVmlJWlc5cHhmRlhoK3lWOXJlV2hoZTIrcSta?=
 =?utf-8?B?U0VBZVM3MWRmSUozSThMZDVEdmZ5KytMb2tOdy82UGV6Z2twSDUwb3BFRFJC?=
 =?utf-8?B?MUNTMFpuSTNYQ3d5RHhOaFh5WW90Vm9WMmRoQk5YTFVOZmdocGE2eHRDMnNC?=
 =?utf-8?B?MmZsWGNZbHV0ZHl2bWpkdzZqYnlJNHl4ZUg1L3VvSFh0WHdQRVczNzYyZFZ6?=
 =?utf-8?B?QmpsTVN2K1NwRmtzU2ExTkY1TzFHdTRXSG9IYWVSL1RpMS9pRm5RVHZBN2NY?=
 =?utf-8?B?ZTdFbXRvcG9SdzlDVlZOcWxhQnB6TnZFNG5pbEdadDdXUitQU1oxTzYweWwy?=
 =?utf-8?B?Nk5TK1hCdXFTYngyTGJ2T2loVEFUdkZvU2duUXNJaTlrU0V3MVFFbUtIbi85?=
 =?utf-8?B?TkMxTWtmeDhWTGZPcHM0WGZvREJTUVBHbE9Cd0tWT3VJUnRPY2V2dEVXdnA5?=
 =?utf-8?B?TU93dlpyMHpkbHFIT2ZqV0NoWlJWU1BrVlZ3WDFYV3VET0drUU5GUmkyZmU5?=
 =?utf-8?B?Zk56cVl0M2ExbmVSVWdyenVUOFVzTUpQL2hJVnkyekFraXE1c1ExcTJOR0xH?=
 =?utf-8?Q?KxTNsu?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ2PR12MB7943.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(38070700021); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?enBsRVQ4ZGtnTmlFZzJST2w5QjRmc3lDNjlmc2dZS1oyNXJHSmQ0YWNOUkt5?=
 =?utf-8?B?NEFQZjE4cW5hZGhVdEdLS2t0aER5RGVBVjMvOVg0dnNUS1lpRnNPcUlPQmdQ?=
 =?utf-8?B?UzFIcUppWkdKZ0FMQ1JvQ1BvS0lRTXo0eUo1SzkwWm1oQ3pZVnZETDh2VWdF?=
 =?utf-8?B?UGE1VEs0WTd4cVlpTER2a0tIdzdqWmFQR3B2b2NZKzhqdFB3NERmQWwyVkFD?=
 =?utf-8?B?WFdFYmJYZDFUQitVRDhSV2Z5T3BnWXQxSjlTdzhZWXRPNlJpbW4wWUJxK2l0?=
 =?utf-8?B?SWRGNnFOS1hUOXF1NGtSU1lDRndYOGFOVjE2cHpNVWNKaUo2ak8vanU3Wkkx?=
 =?utf-8?B?UGNabjlvSFR5OTNBM0pJakl2bzU4ODY2OWhBMmxya3dxbVhZYWh6N0ZxV3cz?=
 =?utf-8?B?WjQ5K1U4VFBmdmNVMkdXUEJSOTVyQ3RQZnpTVE5DTGRZaTJFb3RoOGM0TEVW?=
 =?utf-8?B?Y2dabUExQ3NoSkVPZERzVTV5M25tK1FJSnN6bnNIUE54RlhXVVhkaVlRS3Qw?=
 =?utf-8?B?ZUpqRWJWS3ZhSTM2bmxESDhqRGVZcEVZSHZYUHJ1WHVmVnlvWlVPUnVyMkZR?=
 =?utf-8?B?UEk1aFBCWnNXekNrZzBDL3gydzZFd0R2cUh6MHU2elQvUURrbllHUis1RmZp?=
 =?utf-8?B?Y0RXV0xRbFdFc3pNajlPSktkdE1pMXNPNVRxajlOZkJxRUFRb1BwckRsRUdv?=
 =?utf-8?B?OEp5dm12MkZJUFJVZXJ5L3FoRGJ6djF1WDQ1MjlYZ2VDVzVJNEQvcHVFRjBG?=
 =?utf-8?B?a3hKSkhQcENNdGY5VmJvRDE5Mmcyb2dvZG5rUWNvbXJ3MzdTd1ltVDZCZnZU?=
 =?utf-8?B?NkhXU0FRT00rd1lCMWxRNjBuYll5NjdiTEovK0ZZNCtRUCtxazQwVWNpQlJy?=
 =?utf-8?B?d09FZ2M1VUh4K3lyVzZhVDlSMDJxeFZ2VHBuNVZFNnRIN0NDK2RSZ3FFRWZR?=
 =?utf-8?B?OXVFbXpNL0Z0VkFMVlVTSm5HNFNqR3N2bk83UGJVU0o1eTVQYjNFSm85aGdu?=
 =?utf-8?B?U241cGdleHFFcmRTRFFmeENKUE5iZDVjMFdMNUxlYVFtUzlZTURLRFhVZzhp?=
 =?utf-8?B?RnFIRGQ4YmlSTm1QWm9sK1NPeG4yR20rcXBUK1ZTdk5XekdHSUdLYVlaV3Vj?=
 =?utf-8?B?NUQ1VjVBTEdmZTVrb1g0b2xjRCszRThsTXJMNEkvWUNRZ3JBbUVKS3lxMzU1?=
 =?utf-8?B?R0J4OXlEUXZqN1ZXcjhHUkQ5dVZwWGRjME1oZWx2ME4zc1RKaWthZEtRa2lB?=
 =?utf-8?B?TDFIeDV4b3RRSVBWNEYwcW02T202WnlxWElvRFZBV0ZFRHFtdnZ3WTU5RnFP?=
 =?utf-8?B?N1QyWlMzalVwN3U5VlRLd0xLTStRd2xPN2pvMG5RdTVVRHRGcjN3L3ZrdGkx?=
 =?utf-8?B?WEZrWjNLUXplRk1tM3E5U0FlSlBkamFOc2d0M0RDQkhLS2tSeWpObkR0aDgv?=
 =?utf-8?B?YS9MaXM0K0tVSzZ5TGppcUVPdS9ZVGZCWVFCd0tTcDY4UWdqTkZNVmlqclhM?=
 =?utf-8?B?S2pvdDdkTitSSFVvbXc4K0x6Y2o4dWhLN0VKbmF4OGpzckcreDZqUmhvbnZs?=
 =?utf-8?B?eWRPd2kyV2pFMjZRTVF1c1dyQmJoVVNicU95cm1JSHZ3RUdEYVFLNmhIdHY0?=
 =?utf-8?B?RUJwcXhaUWcrSzRJMHRVM3BjbUFQaVArQUMxRnVxZjJnaGxOK3Npa0VnMVFB?=
 =?utf-8?B?VWtTaFF5QVJBL2lsdUttR25lTTNnRTk2YkF2OEtTWGtlZ2tUQnNUSEdjVkw3?=
 =?utf-8?B?cE82Umplak5MS0VmRXlsZ0lLd1ZXNlNxcVY4TWFyQmJZUGFQL0dVOENJMVIw?=
 =?utf-8?B?ai83UGZvdE9pZmN5b24vd21lN2JZYmRaTzlnbCtsYVg5eWFzdW9GREdXQmVG?=
 =?utf-8?B?ZHltYXVQU1JGOTlmeHNXOVJzRHBBS1lReW9obmNla0habGMwNGI2aW00cGxI?=
 =?utf-8?B?LyttQXphdU81aEdGcjJnZE9TbWhUT3V3MlBTYnhYNmxhU2cyM1pUZFZSQmIv?=
 =?utf-8?B?WU40N0k4Z2lCSUJIMXZVZG1kQVNoRmEzbGNUWFNnVXpIZ2d0V2dmMU5YeG1G?=
 =?utf-8?B?M25TRHMrVm0ySW93aDd4OUw4M0JPTWdORGFDZmhwbmZSNGpieWx5RUozM0s2?=
 =?utf-8?Q?goHZ01FIQcDvhyc5EvLenUSdl?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <246CEB87453335489BD52CEBDE2BB1AE@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR12MB7943.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b648d4f8-a1cd-4a14-38a0-08de345518d4
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Dec 2025 23:22:02.6286 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: klDzmTtF0ubmCV7EVlBlnKRklt5b2PUm2Zld0n6CWseDvoUU8GYkr5q//pyvaEYJajC7BMsmtdWSxeeZcGlccg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB8190
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

T24gRnJpLCAyMDI1LTEyLTA1IGF0IDA5OjM1ICswOTAwLCBBbGV4YW5kcmUgQ291cmJvdCB3cm90
ZToNCj4gV2l0aCBvbmUgY2F2ZWF0OiBgbmV3YCBub3cgcmV0dXJucyBhIDRLIG9iamVjdCBvbiB0
aGUgc3RhY2ssIHdoaWNoIHdlDQo+IGRlZmluaXRlbHkgd2FudCB0byBhdm9pZC4gU28gbWF5YmUg
d2UgY2FuIGhhdmUgYSB3cmFwcGVyIGZvciB0aGluZ3Mgd2UNCj4gd2FudCB0byBhbGlnbiB0aGUg
NEs6DQo+IA0KPiDCoCAjW3JlcHIoQyldDQo+IMKgIHB1YihjcmF0ZSkgc3RydWN0IEdzcFBhZ2VB
bGlnbmVkPFQ+IHsNCj4gwqDCoMKgIHB1YihjcmF0ZSkgaW5uZXI6IFQsDQo+IMKgwqDCoCBwYWRk
aW5nOiBbdTg7IEdTUF9QQUdFX1NJWkUgLSBjb3JlOjptZW06OnNpemVfb2Y6OjxUPigpXSwNCj4g
wqAgfQ0KDQpUaGlzIGRvZXNuJ3Qgc2VlbSB0byB3b3JrLg0KDQplcnJvcjogZ2VuZXJpYyBwYXJh
bWV0ZXJzIG1heSBub3QgYmUgdXNlZCBpbiBjb25zdCBvcGVyYXRpb25zDQogICAtLT4gZHJpdmVy
cy9ncHUvbm92YS1jb3JlL2dzcC9mdy5yczo4OTQ6NTYNCiAgICB8DQo4OTQgfCAuLi46Om1lbTo6
c2l6ZV9vZjo6PFQ+KCldLA0KICAgIHwgICAgICAgICAgICAgICAgICAgICBeIGNhbm5vdCBwZXJm
b3JtIGNvbnN0IG9wZXJhdGlvbiB1c2luZyBgVGANCiAgICB8DQoNCkkndmUgdHJpZWQgZGlmZmVy
ZW50IHRoaW5ncyBhbmQgdGhleSBhbGwgZ2VuZXJhdGUgdmFyaW91cyBjb21waWxhdGlvbiBlcnJv
cnMuDQoNCkknbGwganVzdCBwb3N0IGEgdjMgd2l0aCBteSB2ZXJzaW9uLCBhbmQgdGhlbiB5b3Ug
Y2FuIGV4cGVyaW1lbnQgd2l0aCBpdCB0byBzZWUgaWYgeW91IGNhbiBnZXQNCkdzcFBhZ2VBbGln
bmVkIGFsaWduZWQgdG8gd29yayBvbiB0b3Agb2YgaXQuDQoNCj4gDQo+IFdlIHdvdWxkIHRoZW4g
YWxsb2NhdGUgdGhlIENvaGVyZW50QWxsb2NhdGlvbiB1c2luZyBhDQo+IGBHc3BQYWdlQWxpZ25l
ZDxHc3BBcmd1bWVudHNDYWNoZWQ+YCwgYW5kIGluaXRpYWxpemUgaXRzIHVzZWZ1bCBkYXRhDQo+
IHdpdGg6DQo+IA0KPiDCoCBkbWFfd3JpdGUhKHJtYXJnc1swXS5pbm5lciA9IGZ3OjpHc3BBcmd1
bWVudHNDYWNoZWQ6Om5ldygmY21kcSkpPzsNCg0KU28gSSBhc3N1bWUgeW91IG1lYW4gdGhpczoN
Cg0KICAgICAgICBsZXQgcm1hcmdzID0gQ29oZXJlbnRBbGxvY2F0aW9uOjo8R3NwUGFnZUFsaWdu
ZWQ8R3NwQXJndW1lbnRzQ2FjaGVkPj46OmFsbG9jX2NvaGVyZW50KA0KICAgICAgICAgICAgZGV2
LA0KICAgICAgICAgICAgMSwNCiAgICAgICAgICAgIEdGUF9LRVJORUwgfCBfX0dGUF9aRVJPLA0K
ICAgICAgICApPzsNCiAgICAgICAgZG1hX3dyaXRlIShybWFyZ3NbMF0uaW5uZXIgPSBmdzo6R3Nw
QXJndW1lbnRzQ2FjaGVkOjpuZXcoJmNtZHEpKT87DQo=
