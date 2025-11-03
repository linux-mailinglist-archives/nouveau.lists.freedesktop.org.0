Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FE73C2A09A
	for <lists+nouveau@lfdr.de>; Mon, 03 Nov 2025 06:00:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2865110E04A;
	Mon,  3 Nov 2025 04:59:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="cQu993MO";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from BL0PR03CU003.outbound.protection.outlook.com
 (mail-eastusazon11012033.outbound.protection.outlook.com [52.101.53.33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 04DBB10E04A
 for <nouveau@lists.freedesktop.org>; Mon,  3 Nov 2025 04:59:57 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ILETZ+0X54q03VgN9E/py9x9Sduf/OEh4LfUuMXov8aAv01p2+BteGV1+R+FhTe6rwxIzuFUeR3iwmX9QyR/7k0YVrtS8V8hBhlvCFcHHWgwRRG4IymmwDkx3RZLD5oozAP0fHS4N+bnwT7HHWILTf8f2Ml2fPRf/puRE8j4luDf20ZQk3IRoVZ/wJgDUxrd+mnU9U3fkAjHLkS8t7t4zd7PnfxLsiQU+sjUPKN/xaA0BuiKIQmqFTyCrAgufEl7Rg7jmJ6ktJVuigb4Sf9pljQm7SwZPumq+BeGezh7WZ73ENGVV73rnn7mRG8HfUgdyfCHyiaYAuDkmRZkrXC99Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6HKsHkElqcLATgtYOZPxlfoz+UZVl2bzYLMPxNUFFDQ=;
 b=N5bJ2YIG9xYvGlxbQfhw6Qhgtk0x9oZZpQdJzfGYTZFLfAToL4g+bbND3c+ELg2NGv74xLQxNlVS/96E3WJ68xns89PD93wb/L8+MLpiumgYrfXHMQt6izyRBjlimfy/Ul20knWowIwKOQLZDTBJtuhHlXbeAUltHlGw9zL/VpGIq/ng/pV26fakW56b1tppaA5dHUPxqHPwXrm6ZTepvyyisot7T9+0XuEEOB7tBCHzunTMriVSEabUszCZey+JskkWKuSPSxZHx4jsbocbejeSlPcjKLTJyLeiAlINgMNdmrj59YcLNG1jeI2qdq/uYQei7HHFhkY1eY+HU47UiQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6HKsHkElqcLATgtYOZPxlfoz+UZVl2bzYLMPxNUFFDQ=;
 b=cQu993MOy0DlSBPSBiuDtR3hCF7th1zE+x2kvzejbe5Vs6cvni9dn0eplCXPPYfAGpIRvL7CsN8cNTNkwWN4qehpl31BXIysJPXGyF4epWLJdeUXkcunBfucHDi7qaScvYFdMqpzSNaOIJyHJPIRSu/D+geuHl2l9vOra5h7wtEozADXccs9p1iZDixh9POV19psh3Ovx4YrwK07PAG5TO/My56D4Boyw/scfgUqXajSUH0M5mTUgo42a7Ro3XZzcc6wGUJZ+ZCqKYVAtJlqtZt/AUTTLL7lEev//FAW9HTb3tWaSASdlBN6Lr49lqls6a1iiVDCW4UWmP3zG9jeEA==
Received: from CY5PR12MB6526.namprd12.prod.outlook.com (2603:10b6:930:31::20)
 by PH7PR12MB6418.namprd12.prod.outlook.com (2603:10b6:510:1fe::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.15; Mon, 3 Nov
 2025 04:59:53 +0000
Received: from CY5PR12MB6526.namprd12.prod.outlook.com
 ([fe80::d620:1806:4b87:6056]) by CY5PR12MB6526.namprd12.prod.outlook.com
 ([fe80::d620:1806:4b87:6056%3]) with mapi id 15.20.9275.013; Mon, 3 Nov 2025
 04:59:53 +0000
From: Timur Tabi <ttabi@nvidia.com>
To: "dakr@kernel.org" <dakr@kernel.org>, John Hubbard <jhubbard@nvidia.com>
CC: "lossin@kernel.org" <lossin@kernel.org>, "a.hindborg@kernel.org"
 <a.hindborg@kernel.org>, "boqun.feng@gmail.com" <boqun.feng@gmail.com>, Zhi
 Wang <zhiw@nvidia.com>, "simona@ffwll.ch" <simona@ffwll.ch>,
 "tmgross@umich.edu" <tmgross@umich.edu>, "alex.gaynor@gmail.com"
 <alex.gaynor@gmail.com>, "nouveau@lists.freedesktop.org"
 <nouveau@lists.freedesktop.org>, "ojeda@kernel.org" <ojeda@kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "rust-for-linux@vger.kernel.org" <rust-for-linux@vger.kernel.org>,
 "bjorn3_gh@protonmail.com" <bjorn3_gh@protonmail.com>, Edwin Peer
 <epeer@nvidia.com>, "airlied@gmail.com" <airlied@gmail.com>,
 "aliceryhl@google.com" <aliceryhl@google.com>, "bhelgaas@google.com"
 <bhelgaas@google.com>, Joel Fernandes <joelagnelf@nvidia.com>, Alexandre
 Courbot <acourbot@nvidia.com>, "gary@garyguo.net" <gary@garyguo.net>,
 Alistair Popple <apopple@nvidia.com>
Subject: Re: [PATCH v4 3/3] gpu: nova-core: add boot42 support for next-gen
 GPUs
Thread-Topic: [PATCH v4 3/3] gpu: nova-core: add boot42 support for next-gen
 GPUs
Thread-Index: AQHcS5kvDmmWDWjtwkmv1WTC8DlzqbTfsdyAgABycACAAEHiAA==
Date: Mon, 3 Nov 2025 04:59:53 +0000
Message-ID: <61b8cfb9d3ae088af4c9c19973db3266aa2bfa11.camel@nvidia.com>
References: <20251102013656.423235-1-jhubbard@nvidia.com>
 <20251102013656.423235-4-jhubbard@nvidia.com>
 <4c6df1aa00dab5b7e2a43c952180fc74e40f146a.camel@nvidia.com>
 <634b7879-055e-4d5c-aaa8-25f88bbdae75@nvidia.com>
In-Reply-To: <634b7879-055e-4d5c-aaa8-25f88bbdae75@nvidia.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.56.2-4 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY5PR12MB6526:EE_|PH7PR12MB6418:EE_
x-ms-office365-filtering-correlation-id: eaf2fd31-0a18-4c2e-462b-08de1a95d391
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|7416014|38070700021; 
x-microsoft-antispam-message-info: =?utf-8?B?dGlucytuL2RLUWYyanVlOHU4cHJjWUNZR0FBYXlWU2VlTm1ONTNhV21XcUhG?=
 =?utf-8?B?dENHbFVXMXVRWUhlL1lFMnNOdlo1Qm9tSE56RzU5elZJTWRSUjk0dUVsS3FW?=
 =?utf-8?B?UnZZbDVudU9IenQ3RFBFRmFZdmtYY1hGMWdIZGQ5TERacWRhRFFQRk5pSUJX?=
 =?utf-8?B?bjBKUUlTU3dKVjlYVWpad2RBN2U4QWpEdnlzYW95L3pOdWNic2J3VnlZZUUr?=
 =?utf-8?B?aTNtSFdIbGZYenBXY1hINUF2bk1ZSlJOM1BraEdHbDBPUVhtRXdLV0JETzBo?=
 =?utf-8?B?M056VURKbFJaMHlCRWwzYm5rWTlxS09oOTdXdDBnZnlVcHFxT1doeWJHVkhV?=
 =?utf-8?B?WVM2R0Q5T2Fzb3QxcDNPbTM5aStuSEhUY3lHeTdzUnlyZzNKTGhQemltai9r?=
 =?utf-8?B?SXpGc2pONUtxeWlNMFBVNnZHRkZNenB3L3ZYZk1nNnpOWm4xM1FsZEdZbEdr?=
 =?utf-8?B?RWVkRGtDUlNhQUtQK3FTNHJKZVNWWmJBYjU2Y2VENFF6T2ZFcEhNdE15U3NR?=
 =?utf-8?B?c2dyUmtaemNEUDBQTzF0QUsweWVEYktiQytDRDBxQW5xRnAyWExSZmZFTWpT?=
 =?utf-8?B?bk5oMzZPcmhVWHJndGlqbG1mc25WTDVsZGhvc0t0UEFsZm5ieHR6TTN2TEhO?=
 =?utf-8?B?N1hPWXZJdmRRSUg1aEluVEhlYXp4eEw3dkJJay9MK21PN3MwMXowZVF6MnJN?=
 =?utf-8?B?aVVrZHRhYXhTZm9ZU0NpUEJyblREKzRnVkVkU2NUbFZUOEtIQ2NUcXdOeGh6?=
 =?utf-8?B?aWpjZGtuNCtqRzZObVFmWnpqVUZQaWMxNGhhNEo2UU1KdlFKTDB3R09FN01L?=
 =?utf-8?B?cWZGWFJoWURhS3A4ZmNKNnZPZXZLTHBBZGEzYmlnSS81RkhrOC9WYTBxTlFk?=
 =?utf-8?B?K2ZSMnUyNU94WERPU05LZnJYRlFTWGl4Ui9JWUw0bU8zSnRjcitMaTdUMlVS?=
 =?utf-8?B?akpqTWIvc29QMzVGQjRURU1vTkFndFlkeWpLN25KVEo3N20ycG5aZCsrY0hu?=
 =?utf-8?B?VFpSbWhRRmMxSHpwMmM1MUFKU1hqN0U2QnpUWXFvamllL1pGcUZtNUZ2NUQ3?=
 =?utf-8?B?R2NOWWlNZ3Ztd2xVRHJmOEpncWpqY1hOMzZxUmMzcUQvdFZXTVJjV0JYVDNR?=
 =?utf-8?B?THZZdUdOUHZxVnp6b0hIQ3hnMXZDWUduVVUwOTk5VDh1NHU4QjdCbHpwUXk4?=
 =?utf-8?B?YTdMbkZhTitXVW5yODQ1MFNhMFdkeXdNdTdIVlY1YjlRS2E2dlcyOE10UUdM?=
 =?utf-8?B?TVJ0MWNiNWZpeVBHdXVFeU81dDU4MVFKbWNiTE1PdzREYkR3MktuK1ZRN2xs?=
 =?utf-8?B?bXVFNEhMdkgxNG94bmE0MUtUMDlZNG1yYjFwZ3FPZkk0cC9RcFFoSTFFbjNL?=
 =?utf-8?B?c3lYcXpjUjBjTU9KYXcxMFZkWU55SHZkQkNLMTV5ZzNZZ0NiNzJEWGtyaXBt?=
 =?utf-8?B?eUdsVGo0ekRZSFZ4SzFwOFlIUXBOOGNIVjVYTlArU1JzZnMzcVpNb1BYdHha?=
 =?utf-8?B?YlVRTElOSmhEenVYMEVFSStPNjBKeVZiQkxTQ2dXOWtlcS91MEYvTnNvYm5x?=
 =?utf-8?B?UjZWTysyWXdROEFPTUpUck5GZnB6VFY2bER3QnFUTFFVN051SjhobkJKSyt5?=
 =?utf-8?B?c0ErTmdVc3BkSHN1ZkloSGw2V3Zhazd1eThLQTlSWGRZT1RHeDBjbGgxY3kz?=
 =?utf-8?B?S1VJUzB1Z3FOakpqcTI3M0pxMXU4UFF2YkVpMWhIV1pCUklJSVBadVpOalh4?=
 =?utf-8?B?WEVFTU1iMkxLVC95VU5wYk1TMVFpSjlrVWxRSTA3UTRoY1kxaWp5bmVZTG95?=
 =?utf-8?B?UHBUQlNqdld4QWJxMlNmK21KU0luY1hzZ05kMEFUVFpMNmVZUC9nb05ua2ZX?=
 =?utf-8?B?ZHk1ekpJZ0R5NjlhSUxrU1FMbGtQeDNpYVE1a0dQd1lZc29RSTJTMHdpb3Yr?=
 =?utf-8?B?ZnlZVnVjK2trV05kUmZrU1JUanBlQjYxVk5xa3ltdnJqT2NhWmRvV0VqdTFw?=
 =?utf-8?B?MUZFQllKdWo1UVJJd0tIYkJCZUEydHRQOFJEcHdiVWZ1a0JXMGJGRy9WT25Y?=
 =?utf-8?Q?EI5/PZ?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR12MB6526.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(7416014)(38070700021); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?L3g4YWJ2UlFETTh3ay9GcG5rQ2ZlZkxoZ0pySFZmUENHYnRJbDVvZEJiT21p?=
 =?utf-8?B?OG0wUXUvQzFkTEFUQkpXYzNzQ2p0MGhhVjRqKzVPZTdkSXRlNkJseG5WcVZx?=
 =?utf-8?B?OTdqeDJxK3dkdnpWSjQ1TkQvamdMSXZqUTVvbExSVXA1aVVmQWhNcGVnUHUr?=
 =?utf-8?B?N2NaZ1FiTVFTdCtRUWJVR3c2VTljM0trYWlGeUVsaW9Ka1BOOWNXangrOW1i?=
 =?utf-8?B?cktad2N1U3Q5WkNZcjEyUDd4cEQvNGVhaGFpNDRBOExRcGNpVy9xOTRMZ2dT?=
 =?utf-8?B?T2Znc0lKbkx4QmtabWhLcFRmVjR2QkRxUDZUbFZMTWwyVFpUR1pXSTFCd053?=
 =?utf-8?B?RzdZTVhPWVFyNVZZaHZ3YVhCSU5KSlJFcEcrNUIzVzZZckdCZ0VkU1RzRmpj?=
 =?utf-8?B?WnZLTnZPN0R1K2J1Z3FDTU1hVS9FaTdSTGFzZXRIVlkzMlNRaFM3UW5odWZv?=
 =?utf-8?B?ZjZkOGFqeTJwMldqQm50b29yWTNGUVVXTEozRmJ5QTBIczVHVW5zNDZHRDhw?=
 =?utf-8?B?b1dmcVN5UmtzQTZ3WXRqQlpKNEtld0xXR3BlQmU3NWZzbzhtTUc2YzhPNk91?=
 =?utf-8?B?bGRQc0dURmdkanc5aU9JRFFMeVQyWmpiS3VJQTNtdFNjQU5qSGtUcXZhcDll?=
 =?utf-8?B?NmZnSnFyQ0VxbDZualNISzdHK1ArN29vR2VyS29MdHRua0x5dEFyWUFDR1lG?=
 =?utf-8?B?OHdSNFdFVWZra09YWStlVkJ1em93d0RReFJZdHV2M0hwMnh6ZGcyU2RTMUpI?=
 =?utf-8?B?dEN4Rm5GYWVTcHJ0OHEyaDdjU2RoRnVSelVoKzlFdjNJM1o3TGJqbGFzVXM3?=
 =?utf-8?B?dVBZc2tLNjhjZ3U0dWxTUFc2c3dSYjZDcUdXUHg3ZEhnSUc2VDZnaVFSc2Ix?=
 =?utf-8?B?Qzg2VXJ4citRd3pycGtaOGNDTE41clVrZ1dZNC9Nbi9mRGp0OGQ1WDE1cXlQ?=
 =?utf-8?B?VjVkb3pJcHdKZmxEbzBSVittOE1rMWs0UGN3bmc1RjVIRFpYancxN0ZNM281?=
 =?utf-8?B?K09tVldjOW9Bb0wzUXZjSEJDTi9kTTZUUS9xa2FENEFLVmQrK29rOXZrUHoz?=
 =?utf-8?B?TUJJVzBucXRZTnczekRVUEpGQklERk1zSnV2Mk9iSzRseUNIbjVrN2hnR3dt?=
 =?utf-8?B?STFkdEMwa0NUSDF2MHFNLzRHUVJaUk5hQTdDRzVPTlNpQmdZbkdibncvZ3Fy?=
 =?utf-8?B?dmIva2t3elllZ1pzbkc5MG9sVDJMMlVYUFdEaE5BamlENlFBS0ZZUU5vZ3BV?=
 =?utf-8?B?aEVBQXRwblJUWklIbUxZM1MrYXc3VEZ2VVJpTzkzc1lOZ1VIb0xlUUIwY0R5?=
 =?utf-8?B?UXFRM3VHOWtzZHNoVWVDOGtJbVEvRmREWGVXc2FjTlVvMXorUmZNdVlKRzFP?=
 =?utf-8?B?UklHUVVYNHo5RWRhU3EvRFJNZ1A4dStrK0kvSzFmZ3hSRVJoZjVJb1VBVDVK?=
 =?utf-8?B?MjcxN2tCVWN0NmsvTlY1QiswNDdMTWREZHp4S1YzT20wRW1LSzIxV2Jsa0Fa?=
 =?utf-8?B?S1ZSQUZqVTVJZmwxQXNKdHE2UzVLRm1tK0V0UXJ1SWlaNHRZQ24rbk5KYUZJ?=
 =?utf-8?B?dVdtaFU4MmNvU29LdVF6MTg4b1pwYWgweFFmRFlHTlk2dUt1bVYwVzY4YWtI?=
 =?utf-8?B?MDVYK2FDUVltQjBxc0d3UmJab1UzdXp1ZVRaWGZwVjlYcHFZVFJLUUNqMnlC?=
 =?utf-8?B?c05sMGpCUTcvOEQ5Q2paZGgrMVJ3anNoTVRBajV1RFNZMlBxRHEvRzcxNFZJ?=
 =?utf-8?B?dVMybE9TdUsvZ3JDeEVHSWVsdFp1RHkvcXEzdUFyZERMUnA0ZlUxelF2K3Zn?=
 =?utf-8?B?MGJhY2U5b1JjK3VjQW1DSWlSRFpvWGEzVG1qRjI5dWYxWTE0SnFHbExFNHNW?=
 =?utf-8?B?M3ZTN2tqUHJzRlBOZzZWOVlUUkVuMXc3bWVjVVM0anR2M2VhT2FxbE4zQUpa?=
 =?utf-8?B?K1hOZjZiWWtPV0dWWk83WVU2SnNiaEFxQUVlRlBXaXpReGxGaFFzbFZiQm1D?=
 =?utf-8?B?ejAyemYyTjVvVm1sTFFhN29oNUtpN280Ry9HbHpmT2pndmtqU1ZEb1VYTktW?=
 =?utf-8?B?TG5OcmMxcmQ3MFlrOERjUUVnbzhXaWJ1cWMzNjF5dGloT2J0bnZQU29DVDhu?=
 =?utf-8?Q?k1SNFYuPns8A6638VK4mHzALz?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <E6D78235ED562C4787AA4EB3C2387FA3@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY5PR12MB6526.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eaf2fd31-0a18-4c2e-462b-08de1a95d391
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Nov 2025 04:59:53.4714 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: rwRobJa3yFVTU+8LL/ibL98iytQyqBvxrw5+JtiYAK4DwjWQ7N3ZZg/9sy79/ve1P5RpSKITMevtwunaTHZYqQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6418
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

T24gU3VuLCAyMDI1LTExLTAyIGF0IDE3OjA0IC0wODAwLCBKb2huIEh1YmJhcmQgd3JvdGU6DQo+
IFRvIHB1dCBpdCBhbm90aGVyIHdheTogdGhlIGNvZGUgaXMgb25seSB1c2luZyBib290NDIgaWYg
Ym9vdDAgaXMNCj4gZW5jb2RlZCwgYnkgdGhlIEhXIHRlYW0sIHRvIGdvIHJlYWQgYm9vdDQyLiBB
cyB5b3Uga25vdywgdGhlIGZ1dHVyZQ0KPiByZWYgbWFudWFsIGxpdGVyYWxseSBzYXlzICJnbyBy
ZWFkIGJvb3Q0Mi4iDQoNClN1cmUsIGJ1dCB0aGF0IGRvZXMgbm90IG1lYW4gdGhhdCBvbGRlciBH
UFVzIGNhbm5vdCB1c2UgYm9vdDQyLg0KDQo+IEkgZG9uJ3QgdGhpbmsgd2UgaGF2ZSBhIGNvbmZs
aWN0IG9uIHRoaXMgcG9pbnQsIGlmIHlvdSByZWFkIHRocm91Z2ggaG93DQo+IHRoZSBjb2RlIHdv
cmtzLiBUaGUgb25seSBkaWZmZXJlbmNlIGlzIHRoZSBwb2ludCBJIHdyb3RlIGFib3V0IGFib3Zl
Lg0KPiANCj4gSSdtIGhvcGluZyB5b3UnbGwgYWxsb3cgbWUgdG8gcHJvY2VlZCB3aXRoIHRoYXQu
DQoNClllcywgcGxlYXNlLiAgDQo=
