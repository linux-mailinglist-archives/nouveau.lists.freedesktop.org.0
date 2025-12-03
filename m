Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A70CDCA19A6
	for <lists+nouveau@lfdr.de>; Wed, 03 Dec 2025 21:59:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A06510E813;
	Wed,  3 Dec 2025 20:59:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="iohav9q3";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from DM1PR04CU001.outbound.protection.outlook.com
 (mail-centralusazon11010053.outbound.protection.outlook.com [52.101.61.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 265D810E813
 for <nouveau@lists.freedesktop.org>; Wed,  3 Dec 2025 20:59:08 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iTePI5AyGJmv7y4Gw64LLGTlNSgYhrhzOWJeWM8faX9IqiSA+1cEB/xHundkStk6d79Hpq8H6q6txXaH3WBUPNIfNrTvOFxlSFZ8+xS9ctF2m8geAJWTmf1Gd1652L0MK4BRPmRWj+gmhjwHzMFo19pU+zO7f5cD9us+vGplWArzWK3oHFIM7pL+YVYbnZkZmHaCbyZewTX/RfsLcUm0axv7T5bday9Qhe3z0S50zPkS5DkdjWRUuVGL9NrA1v5mIaSw+eAQoixhb3x66oK6gR2zQEOBtXARM5dJ1HoKa0aHgkqMb/Nvwx6iV6heQtJLTE4r7c0KA+lyiCqtfDNDww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JYBr0LkpmmaEp3XcCGnDEL7ni6UPSWka/DuR1PvDzCc=;
 b=zSjI5lpV722eledUKOIefNvvsX/eLE48vf5T78LVlLKGFqu852Z1w0qsuVowzxEDrxwEfl/tPwz+Euf4niBrviOTdw9+Yo6w7DaGOp5cKiAM0Mk0+YvbErhwxe+P2EJonphwlzfMC9BtjPu0zjjM9Bw7aVbSWFIsKUkprTb/IRuCA4Qu6YpqpkEgZz+0YjGhl3kt9JzcuGO7nIWyxu5z9hQZbwbfOMqjKcoyayr8KzsMtD/VhUkI7vu4tp+VM2QdA+Ty5m14jyE5nmKACBsRZxJYdemE/sOZxJ9bt5Pwwr3Ip9wgah72YcBMLsp0AEfE8kef4hc1VPs5j17ZMP9NPQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JYBr0LkpmmaEp3XcCGnDEL7ni6UPSWka/DuR1PvDzCc=;
 b=iohav9q3y/Y4533IzLchEp0OhDqyDkX/eADQu43sl0jAuotzA7c0JmAlF6zRYdHBYR5GixaQOjALWXRbtgyRNEh4W9dk5nWbl4KboqsCqsWgOJ0nW/JjRGEy12LIyyq1GB3a4qh8xIcwDvatR2TfuJeb9Q+QVJ6LXPW/xIYahRoGjO+V4AS10kA0/qZJaliaja+SUxZ8yCdz7fQKmNHeNWkm87KXj1pTFdO6NNpVQ9a5Sj+LGHrJhSP0B/PwMoyKk0tu9iIpebz5f28QJNI0nINQZbm1BIlOcxAF84Jm8C76ij3MbceXUFJsrLTnfNjpg/MmO3GUSkKeOtr2CTNY8A==
Received: from PH7PR12MB7937.namprd12.prod.outlook.com (2603:10b6:510:270::21)
 by PH8PR12MB6889.namprd12.prod.outlook.com (2603:10b6:510:1c9::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.17; Wed, 3 Dec
 2025 20:59:04 +0000
Received: from PH7PR12MB7937.namprd12.prod.outlook.com
 ([fe80::805e:c531:4f9b:57f6]) by PH7PR12MB7937.namprd12.prod.outlook.com
 ([fe80::805e:c531:4f9b:57f6%4]) with mapi id 15.20.9388.003; Wed, 3 Dec 2025
 20:59:04 +0000
From: Timur Tabi <ttabi@nvidia.com>
To: "dakr@kernel.org" <dakr@kernel.org>, John Hubbard <jhubbard@nvidia.com>
CC: Alexandre Courbot <acourbot@nvidia.com>, "lossin@kernel.org"
 <lossin@kernel.org>, "a.hindborg@kernel.org" <a.hindborg@kernel.org>,
 "boqun.feng@gmail.com" <boqun.feng@gmail.com>, "aliceryhl@google.com"
 <aliceryhl@google.com>, Zhi Wang <zhiw@nvidia.com>, "simona@ffwll.ch"
 <simona@ffwll.ch>, "alex.gaynor@gmail.com" <alex.gaynor@gmail.com>,
 "ojeda@kernel.org" <ojeda@kernel.org>, "tmgross@umich.edu"
 <tmgross@umich.edu>, "nouveau@lists.freedesktop.org"
 <nouveau@lists.freedesktop.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "rust-for-linux@vger.kernel.org"
 <rust-for-linux@vger.kernel.org>, "bjorn3_gh@protonmail.com"
 <bjorn3_gh@protonmail.com>, Edwin Peer <epeer@nvidia.com>,
 "airlied@gmail.com" <airlied@gmail.com>, Joel Fernandes
 <joelagnelf@nvidia.com>, "bhelgaas@google.com" <bhelgaas@google.com>,
 "gary@garyguo.net" <gary@garyguo.net>, Alistair Popple <apopple@nvidia.com>
Subject: Re: [PATCH 28/31] gpu: nova-core: Hopper/Blackwell: add GSP lockdown
 release polling
Thread-Topic: [PATCH 28/31] gpu: nova-core: Hopper/Blackwell: add GSP lockdown
 release polling
Thread-Index: AQHcZBoUkD2UvRGVR0imJSbQx9vw9rUQZxkA
Date: Wed, 3 Dec 2025 20:59:04 +0000
Message-ID: <c54382056317ee02de20827d403e8097b1551cef.camel@nvidia.com>
References: <20251203055923.1247681-1-jhubbard@nvidia.com>
 <20251203055923.1247681-29-jhubbard@nvidia.com>
In-Reply-To: <20251203055923.1247681-29-jhubbard@nvidia.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.52.3-0ubuntu1.1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH7PR12MB7937:EE_|PH8PR12MB6889:EE_
x-ms-office365-filtering-correlation-id: 5c549b0b-3e83-48fe-7633-08de32aecb22
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|376014|7416014|1800799024|38070700021; 
x-microsoft-antispam-message-info: =?utf-8?B?TlpadERGQlJyTWx3TVZiYi9HSWNGamhHK0w0c3FDWERGR04wMDZrUSt6Ylo0?=
 =?utf-8?B?NHN1K0NVVVdWRk1WeWkzalljNnJidjlpT0RibDFiNTk5SXVERFowMjVwWnN3?=
 =?utf-8?B?ZnVFcnVFY0dGU3UzVEo2NXJ6KzVUZ2VBelcxRUtvcEpjVkk4VXVwS2VGSytZ?=
 =?utf-8?B?RVpZTjRVNUJSTjRxbmVMNXY3U2NraWJxM0Njd1JIbllVeEg5YUFLOUdQS3Ex?=
 =?utf-8?B?SG5pNDJaalFLa2pFRERkeUdMam9URDdYSUR0ektmNHFWU2dER3lyUzJNQUUv?=
 =?utf-8?B?c0hGaG9ScjFDNjlrMmt1ckR3cHFzNkpmMzZmU3NpV1pSR3dPNkJVWm9JSldn?=
 =?utf-8?B?ZnlkU0pxNThMVnBsNkdPQmVFeUxRekwxb0MycnBTY29kSVg2VWxBLzI1dkx1?=
 =?utf-8?B?RXdmK2xJRklmY2R4NkduWVRaMitPZTRNbHBpZUN2QzFMaFIxMGFFVVpJWUta?=
 =?utf-8?B?QU44akFVcjMvaGNLZHNaN0J3YTFuTXRON05ud0pEMzJkWWhNL05HNjRGVjhr?=
 =?utf-8?B?RSs4VHIzZ1huYUNsQjBrY3ozNHZZV2Rmb1BxbXVSV0dIMG03TnpLTDNVeWgw?=
 =?utf-8?B?RzFVbkh5VTJQcFlZWGgrV1c0QVVNRTFmaXdTd2FFck1CUzVQQ2lFSUxKMWQ4?=
 =?utf-8?B?NjduNmtKSjBheFRPcFhwMEgyUUI2M1dUNmdTRVNicnZMQ0NjYVJ3NWs3bzAv?=
 =?utf-8?B?aTNzZ1o0RER3YTlxekExaWs0TTRjT0pLbXBRMnJzTWJWaHpSMHpaMTlCSFNZ?=
 =?utf-8?B?NWx2dzdkblJiblM2eHE3T2tqZkxIL2lMMzJNQ2dLUUxteVVYZzBSOHA2VENp?=
 =?utf-8?B?NEU5em4rV1FwY0RWZXQzMEFKeTBtRzFjRE1VcS9xY1ZvbHgzZFFzSjRhdDRv?=
 =?utf-8?B?ZVZaeUlmai8zYThQUFFoNDdmTGNORHY0R0NrR2M4RkRid2o1S0o1L25weDU0?=
 =?utf-8?B?U0RrZjRnUHprSCt6SThTUGhxeUV2T1NyMUdNM3VpK0JZMExBRkdzSkMwVW1L?=
 =?utf-8?B?SjZjanZ6Yy9oMG16blhjd1FiQTJ4bzAwNjNYS1hzVGc3aHdDVTRRNXUyYWF4?=
 =?utf-8?B?NG9YR0tLa2xqRk5kREZscUUyb2d2VEdUbEZ1ZEh0eVFGYjdxYjI0N3ZPdGxE?=
 =?utf-8?B?ZFBhbUVCMzlxT0pqRXl5VTFOeFVkSzhWa1dvOUd5WEVXbVNjNS83WlhUQjJs?=
 =?utf-8?B?eGk3Ym84TFlIY1dUVlZwMS9VbnRTRG9vR3BBUHU1WEZsRGJxMDdTNS9wbGpn?=
 =?utf-8?B?aTFLZ1BUWER2WTlYM0JtWHluSk9qaXJlVHdzeGlUZ2p4blVFdEZQdTRMcXZu?=
 =?utf-8?B?TUs0RDhnL1p5eEFVSDQzTXBlVmY3Y2U0K1V5Z0FaQWdzNzNNSFk0S3p4bjU0?=
 =?utf-8?B?SGMzNnNja3AySUlhaTdWM096QnV6c3dubTZESDhPR21mckM0SXZmakNRcGVx?=
 =?utf-8?B?N0l5SHJReDIvOWpkWmI0QVdCSlhwOUUwcFRDNjhrbHc5ZWVGbFlGM3BnS1A1?=
 =?utf-8?B?NUdGeTVlRENBcUhKQWp1TjFaVmJXMll4V09nUGRucVpyT3NhQTB5WXdZNkRt?=
 =?utf-8?B?N2pBYjFwZDBUM1NSMkRoTkJwaFpoQXFMdHF5R3p0eSt0djJMRkRNSEtrT05p?=
 =?utf-8?B?TWNXbWlPY2k0YWwxbFg1WkwzUDFROHZtMGc0bDh1VDZXMmYxR0ZQQ2tSQWhy?=
 =?utf-8?B?RlhoTW81MjNRM1RzaDNvM3FpbndSd2wzZUk0Tmh4Qno0ZTRjRjVPZU9PYUZo?=
 =?utf-8?B?dmY5eVpEbmRjSGdYVUN4Ykc3eGNwd1BQN3Yra1ZFMnA4QUhvYzhaRERjc2po?=
 =?utf-8?B?ZU42Vm1TcEJQNzI2Tk5hRSttQks2SjZkZGkzUmJoRTRNN2dpVGtRZzk2c1M2?=
 =?utf-8?B?NWNVUHFXUWJUcTBCejRta0tZdXhmeThLUVkydE9LT3d4dWhJMEhVeGxJNTVZ?=
 =?utf-8?B?eE1yRFgzQkNHTkZXeTRGQ3N0eC9meGdrWldBd2lpWW8wOU1TNmVEVWJRL05R?=
 =?utf-8?B?c0N1b0RtaE5MMERIc2VFbUc0ME5tNk9MQVlTWWZpWi9oWjFyNGxwOStBMHcy?=
 =?utf-8?Q?GFqn1M?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB7937.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(7416014)(1800799024)(38070700021); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?YlBaQklEc0tMekdIamsrY2RKNjZiZW50VTFKek90R25TVzZYUmFpMG9LWVJ6?=
 =?utf-8?B?bGtHbGcrUnBrOHlyUGV4dlY4eXJKT3M5WUYwVm56RlBUNG5zeCtvMVFSOXA3?=
 =?utf-8?B?ZkRBNXo1c05zZUdsMFFYQmxsV1ErMjN0d1lmcXNjMTVjYzBRT1ZqRWo0UVZJ?=
 =?utf-8?B?NHg5ZmIwREwzVlVSZE50UXVDdmVzWU80KzRkd2F1ZVVOdjdFWjQzQjdjSVJ3?=
 =?utf-8?B?cHV6MFJzNUkyWENZT0g5UHo4a3dITVcreHpKTjBGbEhtbDhwandqVTFOQklF?=
 =?utf-8?B?TXlPRldYaFFtcS90ZDh2amdTVm8vSlBpRnFVQ2FHbVQvWEx5VmdCdFA5MWpz?=
 =?utf-8?B?TmRUeEJlQXFFM1JvbkUrbC9ZTE9qakpXTlVETUt0b2ZPWm83UjBoemRUMWVv?=
 =?utf-8?B?c015M1l6SEFVaVZuSUtnWjVLRFNKU24rVnBCeW9lL3FJV1d2eFdFWmIxbGt0?=
 =?utf-8?B?eHgyZU5MOExhUURqVlFZT0NvV1ZOUTBqaTZ4cjMrNFFHZTQzS0F5YVFoZXh4?=
 =?utf-8?B?NlFHamRDWU5lZ2dILy9WOEdmUkF5cWxpQ1Fma0J2di9TSW9aY3NMNlN5UUZq?=
 =?utf-8?B?NGE5WUhJSmtWc05hc0YwelBpRjlJa3VSY1JNUVNmRmtqRHRhTTFMTW1oWTZG?=
 =?utf-8?B?M1VBSCtqR2RlY0VTTjNBTjgwQnNmd3h1R0JpQjFJVDhVci9zL1dsVTNPNXpj?=
 =?utf-8?B?Rm82UFYyd0djcFpTYUcwdTg0UGhhSmhtd3pNZXZrUlpESGZQbUlIZ0NtMEpC?=
 =?utf-8?B?NzBKd2QvRyszZDFYbVFNRlNOTkhvU0N2dnhCcHRTbEEvQXl0MDhDVnNBWk4x?=
 =?utf-8?B?RWxwakh3NWU2WjdaSFAybWt4VjZJQVZkRE9WbWJVSlk4cjYxcnlGUnQvYUw1?=
 =?utf-8?B?dm9kSDJsODBGa3RISlU0N0FQMXZGb09wdktZTDlmMWZWbkZLTW5kKzZYbG95?=
 =?utf-8?B?MjFORFd0Q29OSi9oT0c3eEdBNlJVYUQ3cnE0M0NqRnowZk9ORWtLcFVCajVK?=
 =?utf-8?B?OFB1ekRFWVdONkRsZXV6bEY1czhlNWZCZFZEUWdiRmY2a2Y4YXY1dG02YjZp?=
 =?utf-8?B?K011dGUvMGlqd1Z6dXNtS3RFUk5QQTM0NVBUOWRzNTA2cEIyQURqNFQrTVBv?=
 =?utf-8?B?Z2NPOEppZXY0UlpEV1RvdDVvKy9yOUpLSndKQmRma0RLSG50TVExMkhGbUh6?=
 =?utf-8?B?UEZucVBBQXlxM1BPUmI5S2xYTHBBazljY3E0WmQ0M1FrYkRjRDlZbVJ6U3Ni?=
 =?utf-8?B?YWcvZ3pzQ1ZhRmdKbUxGaFJuWUovcUJvSnNmUUZIcFJMQ3dCaUpHZTFDMDQ2?=
 =?utf-8?B?SVpEcXp6dVp1b3B3VndOZ21PbHFBRUIrcDY5YTcxRXk3STRFbUd5aUlSWkNr?=
 =?utf-8?B?Sk50MDVEQmxyZ1JydW1JbTFTNmgvMXNiRU1vcmVtajFKcjBxRU54STJnNUpw?=
 =?utf-8?B?ZWx3NWJwb1FpdjdmclhIck40cFVMY05yTnhGN0JRbEZwM3NiMlo4KzJmUkt6?=
 =?utf-8?B?eXJKSWJhQjBSbWYxQ3dPUzhqQzdva2NRSTdwd1I5eGRKTGRNUE85dlpEd1NH?=
 =?utf-8?B?NFozcjVEcmNIdXRiWmZIOGNBclZ2aGlhU1dyRk9vd2l3cEd4VC96cDlGR3VW?=
 =?utf-8?B?eFJ6ZGVXUHo2OFpGZzR5ZlZXZE02Y1hjRE9HUHM1UjNyZDRvSWcyMTRvbVdq?=
 =?utf-8?B?T1dDbVpwQ3BIRFRCZWE1NEozZXB1RWNoMlIrQm5nUWxaVmVvV1BJdVdsL0l6?=
 =?utf-8?B?cmhJdTNjaEdFSUVHQm5oWXhMK3FMc3ZySHBMVnIvejYrbUQzSmRQQW9DclNB?=
 =?utf-8?B?WGd3MWcxOWpiU2tyaFZwZFd2bll2MHRHTGl6VTBnbGVMSFdWbzdsekVtblFq?=
 =?utf-8?B?TWg3blVFeVFab2FobmNrVlE5U1NBYndiVDdaRys3b2VsT2MrWEs4OVlsR1FI?=
 =?utf-8?B?WENPSWwwVllaaHBTMGlyV2NOVmh5bkNEVTc0Z2ZRUms1VExJU2lkR0V1QUdt?=
 =?utf-8?B?Q0RUZFlBaE5WV3BNSUdKSDRIWFB6WmhoaGxndzhYbzAwYUlKTVZscktWNis5?=
 =?utf-8?B?bjhidzBuUlVHSmtDT3J3c2tscjliV0xLREltbnNhUXpEa1pJbFhxSDlKZmxF?=
 =?utf-8?Q?565jTVVBKSZm7p7/mHGBPEgPK?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <686B8924AA207E4E95AAB8B0BBE4789C@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB7937.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5c549b0b-3e83-48fe-7633-08de32aecb22
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Dec 2025 20:59:04.6341 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 5ZJDvt6dE+YBLZ13vBNwuOwA/zmPQsBPwNGuiTeJRCBRA3dPlGiwEH6ZncaneOCSX/pEu+GcdPVIlxHsW+kH3w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB6889
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

T24gVHVlLCAyMDI1LTEyLTAyIGF0IDIxOjU5IC0wODAwLCBKb2huIEh1YmJhcmQgd3JvdGU6Cj4g
K8KgwqDCoMKgwqDCoMKgIC8vIFJlYWQgR1NQIGZhbGNvbiBtYWlsYm94MAo+ICvCoMKgwqDCoMKg
wqDCoCAqbWJveDAgPSBnc3BfZmFsY29uLnJlYWRfbWFpbGJveDAoYmFyKTsKPiArCj4gK8KgwqDC
oMKgwqDCoMKgIC8vIENoZWNrIDE6IElmIG1ib3gwIGhhcyAweGJhZGY0MTAwIHBhdHRlcm4sIEdT
UCBpcyBzdGlsbCBsb2NrZWQgZG93bgo+ICvCoMKgwqDCoMKgwqDCoCBpZiAqbWJveDAgIT0gMCAm
JiAoKm1ib3gwICYgMHhmZmZmZmYwMCkgPT0gMHhiYWRmNDEwMCB7Cj4gK8KgwqDCoMKgwqDCoMKg
wqDCoMKgwqAgcmV0dXJuIGZhbHNlOwo+ICvCoMKgwqDCoMKgwqDCoCB9CgpJc24ndCB0aGlzIGVm
ZmVjdGl2ZWx5IHRyaWdnZXJpbmcgYSBQUkkgZXhjZXB0aW9uLCBiZWNhdXNlIHRoZSByZWdpc3Rl
ciBjYW5ub3QgYmUgcmVhZCBhbmQgdGhhdCdzCndoeSBpdCdzIHJldHVybmluZyBCQURGPyAgCgo=
