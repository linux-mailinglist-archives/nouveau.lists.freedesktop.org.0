Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 45AB4C431ED
	for <lists+nouveau@lfdr.de>; Sat, 08 Nov 2025 18:28:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B059310E10A;
	Sat,  8 Nov 2025 17:28:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="TW4wWq0+";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from PH7PR06CU001.outbound.protection.outlook.com
 (mail-westus3azon11010011.outbound.protection.outlook.com [52.101.201.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BFC3E10E10A
 for <nouveau@lists.freedesktop.org>; Sat,  8 Nov 2025 17:28:44 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rK/r+NJoytbbiW3O5Gqd8XuOItQDG5SNgGzt93FVu4kv0+m9zIyrMn3FrUdM3XE8HuwokVVIqzNAFGyZfhkjCn/FTNCJs2AyMgjFqQYLXopev4Ss0CMsHfHiCDWhArFV9e5/wnu/guDwBmY029McKhBLASIbZijtqi1/ErhBNPrIrtxr5C+RkEXrNURlgegutmV5yAtoX9gxnnl7qtWg90xpJ30ZKLcwu0AdM3Jl/33n+ZMf1gafRp+P/kf+S9+ivItuVpAKx8igAdMIaHWqaNvgEb8PymrpZxMYNNuKQ2g6UMpNl/OIFL9jxLXmF4bQrXn1JyadFznaSUBrzqPocA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bTj9PgrkT+mGuBfEYRBVa6xuugRfjo32xYduEoBTmZ8=;
 b=Zdzacv9TKuCElfd/3e5xBjODkcQgUTeE5utgmJa2yBq3OA7ApubJHbPNu7DGQIywxvtal9wmwYokudYZHlzThOeEUPISJyE3Uhje5M6rhCFCd49+AyZi5sFUySimEQs8TtHtsYpp6/NJ0TlJfd+QLKtZkeN95aZq45cZMqupWOKUydxf8XjqCU3XWnPPh9IcqgNHvf+dIvKyt78VptpOwHxbnArl1u1SWQFWtas1F3VVHFvTnf2lpOW2TfjsnPnNSEcROBqSIX6bqpVXVb85gHlRSFO2EWCsWZ46ocp6QYoJ2HnPo1xZEXmGWq1nR9WlVGWOJsnV3Qe/5OtvuTy64Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bTj9PgrkT+mGuBfEYRBVa6xuugRfjo32xYduEoBTmZ8=;
 b=TW4wWq0+FrJBN4KclOElZ/FtSD5ydaV3dHNN8V+VKuZM8Mu7lIBHW4T7TLv7WFffRlyzRSnUsYETy8nysr7/Seq5BvX4l9D9ahMk/FIJ69IJAu8Bqe4S/3GBMbUEJhalSV53Y7XP7TFsDjqQizhSCTo4nzOPBBEpNTgxO1k8agKMvkle29ypUDDOaI2sNc0yuu6LxJQaQnd9IQY+Tbw37gbdwGj5L9Qvopt3/ak/8/9EZXXjjkVIghjR2N4winRgfmXu5yeJpKHNXTzqfHl/yC+kqwmcsGMeldcXnocTCIUO81ARPGqpJQdvAmj6jWxaV7xM3yKIiw/RfqUm5c+QqQ==
Received: from CY5PR12MB6526.namprd12.prod.outlook.com (2603:10b6:930:31::20)
 by BL1PR12MB5804.namprd12.prod.outlook.com (2603:10b6:208:394::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.16; Sat, 8 Nov
 2025 17:28:41 +0000
Received: from CY5PR12MB6526.namprd12.prod.outlook.com
 ([fe80::d620:1806:4b87:6056]) by CY5PR12MB6526.namprd12.prod.outlook.com
 ([fe80::d620:1806:4b87:6056%3]) with mapi id 15.20.9298.012; Sat, 8 Nov 2025
 17:28:41 +0000
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
Subject: Re: [PATCH v6 4/4] gpu: nova-core: add boot42 support for next-gen
 GPUs
Thread-Topic: [PATCH v6 4/4] gpu: nova-core: add boot42 support for next-gen
 GPUs
Thread-Index: AQHcUGm5uy/mFRJmDEqKxXIFnPJjUrToOt4AgAACxwCAAMvGAA==
Date: Sat, 8 Nov 2025 17:28:41 +0000
Message-ID: <71a9cb70494c3be9596292f7bfec88edb3a2bc1f.camel@nvidia.com>
References: <20251108043945.571266-1-jhubbard@nvidia.com>
 <20251108043945.571266-5-jhubbard@nvidia.com>
 <0c3630727945f806610da8c43211242b9c6162d2.camel@nvidia.com>
 <b45a419f-a91a-4238-97f3-480491d12543@nvidia.com>
In-Reply-To: <b45a419f-a91a-4238-97f3-480491d12543@nvidia.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.56.2-4 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY5PR12MB6526:EE_|BL1PR12MB5804:EE_
x-ms-office365-filtering-correlation-id: 7a7a5095-cce4-4991-f964-08de1eec42f1
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|376014|7416014|366016|38070700021; 
x-microsoft-antispam-message-info: =?utf-8?B?UXBrTDVybmJrSkRSRDFlaG1uYW5UdDVORS9HbndGakpGUlE5VUhhdTZwNlhp?=
 =?utf-8?B?OEZuMUtnMVRXZnVrOVNZM1BZaUo5dHd3ZkZ0Szd3Vm9FaGRscFp3dnVYY2gx?=
 =?utf-8?B?eEVHVVlxd2RtSDlvWUZPdEFNbTlTS0xodzJ1Q2xHVElleE9wei9ZSDBSbktm?=
 =?utf-8?B?a2ZYSVhLZzhwN1FCRS81Z0FoWStGalFJM3FCRkRnYUdYd3BtU0FsbVJvYkRG?=
 =?utf-8?B?UnVsbzE3bVFBWG5wcGQ2Q3VPM2xUYXRhaUFEN21WeStwSEUvYjFXMEhOeE4z?=
 =?utf-8?B?K2EvVlJKNE94N2JtZmovckw4TjE0NEJDVmY1RWFFVHFTVkFyWitMU25sdmEz?=
 =?utf-8?B?aE42azRGdkExZ0MxRUlTT1lUNzEvQ1llKzVhS0Rkem1jYUJkWGdKUU5VUGw4?=
 =?utf-8?B?OWVlMDdheW9yVnhublFpZExUZmp1LzFVV3BMZHdYWnc0RU9XV0pQd1RNYjBt?=
 =?utf-8?B?TG9LYjdXenUwdUNYTkpIWmF4eFdmUWwwS1hlaWFxNHlCSnVCN25vWEg0L1BJ?=
 =?utf-8?B?K3RsMGUvZnVteEFpWnh0SlYzWHFQZUdOekE3c1BIZU85eVhNTDMxcmZmVmR1?=
 =?utf-8?B?N1ZVa3kwREZVMjhtUURaTWtrbER4V0ZJSEQzc09vbk1uK2xNaXNvTzNPeDgx?=
 =?utf-8?B?VjFNYldPQXdPL0Q2R3VtK0VyTkZqREJYNXI1WE9PdDE1eUVlMlloYnlYUlFs?=
 =?utf-8?B?dnN5N2tEekM0RWV3bHVTK05nU01BZmlZSUVWVDBWNWJBRU55eUNJNUs3eHlC?=
 =?utf-8?B?dG1OUi9TWGMzWXF3aE82a2xvQ2FCNTM5aGpHNCtadnN5WkJrcHlNKzRCOXJL?=
 =?utf-8?B?SXZZNGZaekNyNENrQWN3Zk93L3VTM0FnTi9HelBFbC9JYVlDKzQwbkRzWVZZ?=
 =?utf-8?B?ODlXTitqa0p3YVBwUnROS3F2blNZRGYxKy9RTEc0bkNZbXFzNFFHT3pYd3No?=
 =?utf-8?B?eFh4Q3A2SnJzNTdKaWQrVUFtWWxkd3g1aUo2MXVQb0l5eGtWQ3lsMENCWjln?=
 =?utf-8?B?MTFJUjA4YUZvYmIzcGphcllDTEVuQ1FhS1F6WmVHSWxpV1VpMHVpbG1UclE4?=
 =?utf-8?B?OVlrMFF1TEYwOTViQ3FjbGlMK1ZqYTB6d3lTZDdTRWNuNkdhVVAyb1hmUGI5?=
 =?utf-8?B?cFJMT01HdVdMNHJSVW51L2NlYUFVVWVtQ3dyR3hlVTJmM1FjVFh6M3p0dmxy?=
 =?utf-8?B?QmJHNlB6aTZpMUU4V21LSTY4UjEwQVBYemFYS09sYWRNbjBPNUVxTFQ1SkE3?=
 =?utf-8?B?aFVWUVZXdzFxWE5JUlBHcjNTYjlvcENPdHhuenkrSFJlRW02bnF4N3VhcDI3?=
 =?utf-8?B?elNkbml2RHNrWUVGVGV0MFdZcStiemJ3Qk04cG91UzZvdGE1VTkxWlhrb3Nm?=
 =?utf-8?B?SHpiNGVVY0VTcVFPYTdMdGJVWkEwM1g1dStIbSt1aHZKVFZkd0NhdG9McVZG?=
 =?utf-8?B?VVR4RVlaUURMNCtBUURPTmJ2cHFzQ2huUzJHbk5JN3pXVUxEcDBDZ0p4NXJW?=
 =?utf-8?B?VlU1Q0N4ZkNxTEFreFFBWThGTTV0QXVKN0hiUmVwWEo0Q3VpdHgybEdPMUZP?=
 =?utf-8?B?ZnRDeXBlZXdMajRQWWpsKzE2NlZRY0laeHFNQjZLSkJuWmR6dVlMVC9MUndO?=
 =?utf-8?B?QUxzcU1PeDQ4R0FkQzhoKzJtWUhHV3FUUG5vRWZNZVFPeXkyMGtJNFRkM2RB?=
 =?utf-8?B?enNkazd6Z0dZV2N6M2RFQm5DYWFnNy9OSTM1d0tlZjhKNEZQWUowS0FraTVi?=
 =?utf-8?B?ckFaMnRmbVNZRHFaVnVMUHRJYkVDU2FUKy9sUXBPQTVXREVGamVDWm1zZHdh?=
 =?utf-8?B?enF4a0w3MGE4ZjBMK2JvWVNTY3hYcFZwWEJuaEhtUTd6eHhDbU1MZjNGcUN1?=
 =?utf-8?B?RWRyVDZIYTBJTng2dmFsV1NMYUdiRjFidHA1ckwxbFFxSjhCWHBnVkhLMzEr?=
 =?utf-8?B?MnRXZVN1YVJwTzg2eFpUZGpLVnBheUFaZWpGenM0NUFmT3ZyZDZyL25iODlB?=
 =?utf-8?B?QXNoLzBZNG05UTdQKytsVmV5K2g2WTR4TE0vcklLVGRvbjBtd1k2VVcrOUtv?=
 =?utf-8?Q?uuktmo?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR12MB6526.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(7416014)(366016)(38070700021); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?VFNaTDFvL0dlMFBma2VSWm1iL1ByTVJlYlRsVE5LZFA2dk1NM2dOQzZwU09O?=
 =?utf-8?B?YU1GM1JHakJ0eUxFeVJHWTlPT1dhQjV6OU0vVVMyUG5pQzVkU0ZvcFRBVXFQ?=
 =?utf-8?B?UjdmamNqL29aQnU5SDQ1L2p1eERXRjVhQ0xLYllUNk0rTU5SRk5OcU5kUjdn?=
 =?utf-8?B?R0ZubnRCcHFpVHgyZXI2ZkFMQS9JenJqZ2xXMkhoRXFvWnRxWEw5R3Z3RUVT?=
 =?utf-8?B?bURRQTZRdDhSRmlZQjdIcFYzRVd6eU9vTHZWa0hZSmQ2R01tSHFwUHk3OFhR?=
 =?utf-8?B?RUZPSmxBdVBVVzNJbnhzVWw0RmM1QTZ0a3dBRnFMZGZNUlVIc0NYUEhCZkpK?=
 =?utf-8?B?NnJOUjdEeDVMaldHTEtYSzVFbkpacXh1U1JZSnIzVzUwekN1MGpBb0cwYmc5?=
 =?utf-8?B?MU5ObU44bDV1bnFBQk9zN1pIKzhlZ2paMTFNQUpNTUhZUFdmRFQxVi9hUVUw?=
 =?utf-8?B?YUEraFdQWkhEc1dTK2dZK3FQcUlLdTdHSHF1YkloamQwRFhLTm1wZ3NLZy81?=
 =?utf-8?B?S0IvbUUvWWwzcHFyM0x4MVNqbGpRM3o5RUEvQk9yNGxudSs1YXcvWFFhUzJx?=
 =?utf-8?B?dXhEbVg1dUY2TnQrWVNQS24yeHNlVkZqS0JrMU5RcEpGTGdCbUt3Z1l6cmkv?=
 =?utf-8?B?MXBSNjVvWGxPNmdxT1d4QXllb05UN1BsY205aWlqNUJMZmRsQys2T2s5L2xa?=
 =?utf-8?B?WXRJL2pyeWV4dTlnMzlBRWpsUEoxek0rZWMwUEtqSnZJNlplVnl2Q2VsRUFL?=
 =?utf-8?B?SkxwVGZvb2o4aVhwb0lOQjRxL2pYQ0NLWUFHUTA2bDY1cnpNb1FicnNDbXhn?=
 =?utf-8?B?UU80YTRGM2JEdFVyL3hUYUZUKzMyZHRNTTQ0ekcrVlVFMXc4NFB0b0JNQWNa?=
 =?utf-8?B?bVk1TWFuWFJ3eW1Ua085Njh2Qng2d0J4b1R0N0tiZnZ0d2NkMlpiY1ZhM0Fn?=
 =?utf-8?B?T1VFUEJQYnZyVWVqUDlZQmxua25sRUtEanFZRGxubXp3T01PQkk5dE1lRmdO?=
 =?utf-8?B?VWowWVZXRzRPRDNrNFQyd1V5Z1pISDJ3YmVyMUF2Zm1FVFhkT1JoaWQ3Rklz?=
 =?utf-8?B?WFdMY3B5ejBIVHE4ZG5UMW1XZ3g4ZDY4c0Z3NFJKbFJpSWJGa2ZLdHdjSWh5?=
 =?utf-8?B?L3BvWnBveUpOUmZkblZRYVpRTzVyUHhlL1pzWXBSQ2FhR3EvU1hRdTBSSFo3?=
 =?utf-8?B?VWZodDBkdEE5MTFGemtjZmkvVG95T0libDU1UHUvWUk4bm9KSUYrR1BzUHMz?=
 =?utf-8?B?aVR0M3VRbVRUSVZPcDB6eW1jUnhISTRwN0hiUE9xMjZmbVpidUg0Y0tTaVBs?=
 =?utf-8?B?V3FHcnBHNVNBMWFmTEZoSXBHbjlGalV1T1NkalFGZEtnYlhKNTQzUk8rUnN1?=
 =?utf-8?B?MThPVUdNUi8wWEhnVmo2RlFnTk84a1ZjdlhvakdCV3FBVTNzZ3lRbndwQjB5?=
 =?utf-8?B?RnljOWxwbnhYMVNJYkZ2L0pEbXJKcVp2RmtxcGdUeTluamo4MU1PQzAzbjBO?=
 =?utf-8?B?VXR4VGliSkQ0RjF1QnVaOEF3bVhCSzVvS0ZsT0V4OVN2T1BjWm1KeVNNTGFq?=
 =?utf-8?B?eFAwOVpCQ3VIWWhUbUZYU3dUSGptMjE5TnJVNXEvQjlYaGNWVHlhblVMVFhO?=
 =?utf-8?B?ZlA5RXoxaEdmSGpqM0trS0tYUDQxVzllTVRMWXlqMy9BeDlUdUUxRFFYdXVy?=
 =?utf-8?B?OHVpWVFPeXZ2anhvYlFLd2Mra1RoYmtHY1l4VXNwSTBCVDkxWVJiK0czV2ZR?=
 =?utf-8?B?NGpvNWhxYW93ZkJwd3Zudy90QUpSRGFUWHNXN0ZVbHREQklYcjF2bG5NaEZ4?=
 =?utf-8?B?RmVNL2wrSE1ta0tXTU42ejc0ZmNwRXNSbnVaNlpRRzNicHFPam9jVE5HNzJ0?=
 =?utf-8?B?VkR3K2kwd0RPTG9SeVNEa040V2JndEVqbWNscUE4c0x5Z0xHUktHM1hZZXNt?=
 =?utf-8?B?NE42WkduZUREeXlGeG1UTVUwbEZ3RTRxVXNvWDlCY3Q1QytFVkdJczRGM2lv?=
 =?utf-8?B?REh0RGJrbjFmTnJ4d2lwaUZYdVZoaEV5NEpGMENXSmUwQTVpODg2eEVUZFBp?=
 =?utf-8?B?eWgvRFAwOUV4TWF4c3FORjN1Nlo0R25LekY2WVR2VjhXQyt3dVg2ZnF6NXlH?=
 =?utf-8?Q?5LB4dDRnaXXudm1BgTENKcYBZ?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <3F3FC213E91C1D43A477FE9830383DC0@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY5PR12MB6526.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7a7a5095-cce4-4991-f964-08de1eec42f1
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Nov 2025 17:28:41.7305 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ++FWQbt22nqeHsECbZcxa89uJCP7V81YVwIc47kykmb6saXx+3pPDK/5M8AWa62CYGZBx0rhgrCPoXdfmwbYBA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5804
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

T24gRnJpLCAyMDI1LTExLTA3IGF0IDIxOjE5IC0wODAwLCBKb2huIEh1YmJhcmQgd3JvdGU6DQo+
ID4gDQo+ID4gU3BlYzo6dHJ5X2Zyb20oYm9vdDApIHdpbGwgYWx3YXlzIGZhaWwsIGJlY2F1c2Ug
d2UgY2FuJ3QgZ2VuZXJhdGUgYSBTcGVjIGZyb20gYSBwcmUtVHVyaW5nDQo+ID4gR1BVLA0KPiA+
IHNvIGl0IHNlZW1zIHdlaXJkIHRoYXQgd2UgaGF2ZSBpdCBhcyBhbiBlbHNlIGNvbmRpdGlvbi4N
Cj4gPiANCj4gPiBJIGRvbid0IHRoaW5rIHRoZSBjb21tZW50IGFuZCB0aGUgY29kZSBhbGlnbnMu
wqAgVGhlIGNvZGUgaW1wbGllcyB0aGF0IHNvbWV0aW1lcyB3ZSdsbCBiZQ0KPiA+IHVzaW5nDQo+
ID4gYm9vdDAgdG8gZ2VuZXJhdGUgdGhlIFNwZWMsIGJ1dCB0aGF0IGlzbid0IHRydWUuwqAgSG93
ZXZlciwgdGhlIGNvbW1lbnQgbWFrZXMgaXQgY2xlYXIgdGhhdA0KPiA+IHdlJ2xsDQo+ID4gYmUg
dXNpbmcgYm9vdDQyIG9ubHkuDQo+IA0KPiBIbW1tLCB5ZXMsIHRoZSBuZXcgdXNlX2Jvb3Q0Ml9p
bnN0ZWFkKCkgbG9naWMgbWVhbnMgdGhhdCBtb3N0IG9mIHRoZQ0KPiBib290MCBsb2dpYyBzaG91
bGQgYWN0dWFsbHkgYmUgZGVsZXRlZCBub3cuIE9LLCBzbyBJIGNhbiBhcHBseSB0aGlzDQo+IGRp
ZmYgb24gdG9wLCBhbmQgZXZlcnl0aGluZyBzdGlsbCB3b3JrczoNCg0KLi4uDQoNClRoaXMgaXMg
bXVjaCBiZXR0ZXIsIHRoYW5rcy4NCg==
