Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A3F5C3BD63
	for <lists+nouveau@lfdr.de>; Thu, 06 Nov 2025 15:44:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A60010E90B;
	Thu,  6 Nov 2025 14:44:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="oYjHxUqD";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from CH1PR05CU001.outbound.protection.outlook.com
 (mail-northcentralusazon11010059.outbound.protection.outlook.com
 [52.101.193.59])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3AD8610E909
 for <nouveau@lists.freedesktop.org>; Thu,  6 Nov 2025 14:44:41 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vtEhBaZ++hweTRKTPtTz2ba8GZwbp5Czriw52fjuZrecq3QZpTB/4Jwm4xMso/6gQ+Rr9kNhD2FanRraxIcZulfa+u3lrJhJv+6V/P5Xmex4k0kvKYpmdK84E4RUnxPiNbM+QhCLxsA2GCKzKL4VNqjvDoAQK9sVr/hxvPFgzEzS3bj3CI9sejfbNQRrJs6NX8i35OQdCpPhQKG4e6Z+xd13Rh3w2fhOtMAHiw/ONi6tMEzHLzatroH+il81LhgcHnoUUv1Lin/d0xhNWcsVq+PjoPZz3J6x1uQwFuIxg3KdHXb1RjTAkW4asyuOsaBPoQo80IDGDDIqAv4okJ+oRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eKHbRJ+42ZivE4SAE3k/a6OsmeBgxYzUZzL2lmUPICw=;
 b=itg86oxR0aAip2W7nrV1vN3h3vOwcflCbbXMLomkvK+ShqROnk+0CttxckDcLX1ykrwQA9STumLXV5ErXphBvW5fKnGDlEbfu90zjRlfbo1MxgjtFzmCI0KLBSUGGQWRRjtUQ1Mgmxl58xsRFaJCPZSbxATkvwMhcEaRj6HACcQ1G78lgJ5D7vcul1shJEm0IPEhGMpRb09pkoYR4NQ2GqnmLmMTW01f0VoS/C08Omzxz3a3YDLVODKsrACcjOJR8HdbmTmRGiSkjwczXaF4pLtFF1dzczi3Aclm2J+4T/RETnm34AVeKkrgvNF5heHuvRgWHlOWxxQaujsgoi10YQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eKHbRJ+42ZivE4SAE3k/a6OsmeBgxYzUZzL2lmUPICw=;
 b=oYjHxUqD8jSLgeOhw9KdX7oqq1gw+4f7r2nR/uPo7pqN+15XIvlHeR5O4Oo8xSGrawC/4JBtjxff0Mkfxx4Ea4WBDTWXcn0ytRygvqmORqk95SaD5vxwZ0zYvLYx91FnzTWlJbzfzjip9o63MbqjF9KZUnovbGC4+N+V8MzpKv8tuC6ux/l5e88DNg44tnofInT97wXKB9mj8A3QnfN4tRlKdcKaf5I+zBpqx/5dchUg579pJ4TiYXybT983nmMfeiSiqHFXRO6BFHkJCCVn8shPmnnkjA6ciDUp5G8nVlPlck5JX5/8qFyAy/FofbCuj1nTS2dCu4wQkK123+GTZg==
Received: from CY5PR12MB6526.namprd12.prod.outlook.com (2603:10b6:930:31::20)
 by IA1PR12MB6044.namprd12.prod.outlook.com (2603:10b6:208:3d4::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.8; Thu, 6 Nov
 2025 14:44:36 +0000
Received: from CY5PR12MB6526.namprd12.prod.outlook.com
 ([fe80::d620:1806:4b87:6056]) by CY5PR12MB6526.namprd12.prod.outlook.com
 ([fe80::d620:1806:4b87:6056%3]) with mapi id 15.20.9298.010; Thu, 6 Nov 2025
 14:44:36 +0000
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
Subject: Re: [PATCH 3/6] gpu: nova-core: Blackwell: basic GPU identification
Thread-Topic: [PATCH 3/6] gpu: nova-core: Blackwell: basic GPU identification
Thread-Index: AQHcTtEVlb/6BUvkPEGVb0orsj/9GbTluhqA
Date: Thu, 6 Nov 2025 14:44:36 +0000
Message-ID: <ec49facbd969b1ad00acbaec1c719d3b30e0151d.camel@nvidia.com>
References: <20251106035435.619949-1-jhubbard@nvidia.com>
 <20251106035435.619949-4-jhubbard@nvidia.com>
In-Reply-To: <20251106035435.619949-4-jhubbard@nvidia.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.56.2-4 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY5PR12MB6526:EE_|IA1PR12MB6044:EE_
x-ms-office365-filtering-correlation-id: 8a1662e5-e74a-4c80-f663-08de1d4301d9
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|7416014|366016|1800799024|38070700021; 
x-microsoft-antispam-message-info: =?utf-8?B?a2VIRk91UVpvaVRuY21uOGxEQ20wemxpRHlxbFVzU2VmbFF1bzluY0plemJE?=
 =?utf-8?B?NlV1aUt4WVFUOFVSV2xOYzVqbXZSUWRDSWt3NVU1amlrQ3NReFZjSHVudG8r?=
 =?utf-8?B?bjlNNjMwNGdUcGxzODlHY3dZVThNN1ljc1k3U2hhMzRsVndDV2VBTzFUNVI5?=
 =?utf-8?B?OGtzZEFpbW93MlRpOVhIbS92ZjlsL2NvM3lzUXVIZVdnRjJxT0FsNWNjR1U0?=
 =?utf-8?B?bTk3SGJwREJGMWhSTGV0V2hEK0lmSi9pWCtPN0p3b1llQTdnL0I2SXNLMVA2?=
 =?utf-8?B?QTlaY0VCcXJSTFNDY0JmMjRQUUFQaDNIK0VUdXVGYnNFUERpMWxKNmtDelJh?=
 =?utf-8?B?dXk4b2RuZVZBbjIxaXNWYWs5UGVSSTZxOGJvaHpqc0V0d1ZYU2hmcjFBT2ww?=
 =?utf-8?B?YnNDRGxEWWhsWHNnclBFM0JaWFVmb1d1eElPS205c21tR0I3ekFUU2h5eVVn?=
 =?utf-8?B?ZE1BUWhDc1ZQejcxY250N3p0akVHY0ZQa2N0eC9xa3hpK3VDQUQzRTY0c08z?=
 =?utf-8?B?Uk9LRnZTM0gxenhvbEVTaXU3MlJDZnFxdEJlRjhRQXFPSzI0MWhpL1BaM0Zo?=
 =?utf-8?B?djhvRzFTS2lPa3c3MFh0UHRqSFZqREpndUxySXZDNDZUcmRKSUl5c3U3ZlBR?=
 =?utf-8?B?NlFRTFU1SzlWVXhyQnQ5U25VZjBnMlFWQU1UR2w4V2ZaRWNaVFhKbzNMSGxp?=
 =?utf-8?B?NUc3V20zWGh4Q3BsdmdUNW1Fc3BOdWFXYzFEVmNCODJnaGtFVytUU1Zad1ZF?=
 =?utf-8?B?bG5xSUxwa0VxbGpwQlNnMkF1MGt6VVZxbUdwRnB0S2VVajBMRlo4Yk9BbHMw?=
 =?utf-8?B?R0hkZ3dOeXVtdFR1bEVhUEFhQ1VYODliVmpjNXNPUklnb3dUTjU5RHlkZ1VX?=
 =?utf-8?B?NlVtUVpVY1daTEVLWTQ3aVZhazFFc2NnaGNUM0owV2VSL0pNNm1adEs5QzM5?=
 =?utf-8?B?ZStjTTdreXdJRjlFUmZVRnBubUJrZGxJdUJwdHNBVzQyaWVhTXcvcDR4N2RD?=
 =?utf-8?B?QmlFM3doazdZMS9KaXZsd1VSd0F1R3BzckgyTHZPbzhGeVFXbFU1Nm43d1Zj?=
 =?utf-8?B?OUxMekpVbHNBYUZudTFEcFU4bjBFVEh2bnlQaHVKdGU0Nmlsb1J2aWN1WFdD?=
 =?utf-8?B?aGxhZmt1RDBveElSdUVlcUxta20zdS9pV2lqMVpBN3psQWRmSTdKRW5oM1FR?=
 =?utf-8?B?NTQ5d083TmZmTGNqSm5oK1BqUFhEMk1PTjdJVWQxbEc0WmJnbWU3OUhOVkY5?=
 =?utf-8?B?dXhENFJaeXVRempTOXl4d1R3cWFWY1ZRL1RoUGxjRld5ZlhzRE5rQm0xSnVj?=
 =?utf-8?B?ejBubkgwMEx6RWR1Q1hBdy95MncyL094R3gxWFhVMU5RTjUvWDJLbVErUkxO?=
 =?utf-8?B?SkkzNUFPWEIzZ1A5YmFBb1g1MnlWOXE5Znh5aHdTQVlsRDhKZjVaRG5pNWxR?=
 =?utf-8?B?TDRHQWszeFJ3ZjQ1c2pGdU5TMVowTlpOVWtlQVR4M3ZxWWhFRDUwLzRoeWVv?=
 =?utf-8?B?ME1TUzhlRm0rQXdSWDRxSnpJbEFXRXZwNWZqWjkxTWY3bUpzcGl1NGJuYVFL?=
 =?utf-8?B?R254bWo0cWVkT1I2RUJNc05VdU5yM0VQeU5mYmoyQVNvaUpzTDZ3QkVSQjM4?=
 =?utf-8?B?WWpzZWVoeExpWkMyY3A0TFBxeUM5QnhsMU1mZnBIaEZSS0R1TGdhRVZlNEtk?=
 =?utf-8?B?SjN4SE1PaTNpNlZnaFhJb1dNQnJ4NFVaYmxzaXZwRytQaE1qSzBYMzRFVjZQ?=
 =?utf-8?B?OG5GQ3p6TVFsZHF4VjJSekVUZURQcnFHU0dDMFhnOGZsbC9kVUFWTU5YMXVm?=
 =?utf-8?B?K3pmSUN2ZVBjb1FuT2xnZm9Ud3NHSjNFVGszVkZNUjc2NndxK0psaXAyL0RH?=
 =?utf-8?B?OXdaWm40VzhUVzl5QUsxdXZOWmIxeWl5MkU1OUFHMlVpa2JGNXpUYmhlR0Rm?=
 =?utf-8?B?NzVoT2lvc0tZZFhNdkNuQ0dxeWsyQTNOb3ZlUEFYWGxndEFONTJ4cXFTMklV?=
 =?utf-8?B?S2toRFhtOHVPMlBTaVZEM0U0MWJFQ1BFKzZSTzJIdDU5U1dMaHFVdUNhVkZC?=
 =?utf-8?Q?RFlk4O?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR12MB6526.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(366016)(1800799024)(38070700021); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?eHVxZDRrZXVhVm1rUEpSRXoyZENuOUpUUklQUG1tNURBbUhpSUNKVmsyVFA0?=
 =?utf-8?B?MGFRNTlEa1lRditNRmNkZC9pc243NU9mbmpsejBsT21JcTEzekdueUw2UlJw?=
 =?utf-8?B?bnZKcm52VzhtQnlwR2VXeDhOYUduQWFkbDFSUXA2ZXd1Nm1DTkRHbHdFY1pP?=
 =?utf-8?B?Ry9wM2VhbDZFU2prTG9SMTZHVGl5bGdMaWdHakFYaklwRnNhcG5vUlRoTXJo?=
 =?utf-8?B?ZmdPNkhQT3ZZQkEyWENnZFp5clFVQ1poT09wVmtzUFVIYWRqZjBYSGVKL3lh?=
 =?utf-8?B?YnB6YXBGdFNGM1lMemRjbDVPT2hubFFhNXlmTHNObkt1ejYwYVBVRmRmUzE3?=
 =?utf-8?B?V0JMbTZSUHVlV3VzVjJYNEhOdUJMQWp2b3BmUkJ3SlFOOVphS2VqRG00b2V6?=
 =?utf-8?B?Yi9Ia3ZpZllaMzZ6VTRXWHdaa2wvcEpWd0hLMHhZTFFvVzZzWkRCTVBCaGJO?=
 =?utf-8?B?YUxDLzlURHBGemVGamlWZ2J3YjQweG1iWVp1UitHbnNHczZMV0RHUlZOUk1w?=
 =?utf-8?B?QjdEOExLaGJJMDBXaExETk92M2hqZzJ0SU5VOStxT05GcjJWd2dLQm5SZlBQ?=
 =?utf-8?B?Wnl1dlFpenc1OVNSaWJwMjVleFZ4NGxCZVFkeFVOaEJXTWRCdWFKdUtEbGRC?=
 =?utf-8?B?RlNWdnNnQ1c1elY2d09wQlB5QU5VUkNEOVk3eHZhb09peDhhcnk2a1JpNHd1?=
 =?utf-8?B?Rk9TTDhoOHY5b2Z2VnNwNmI5RlBKMlB0blpsa3NZbE9EWFdML1lWL2FqQnBB?=
 =?utf-8?B?MVR2R2J5VHUrTUNIVUljazU5N2R5THBCODBsdmcvbGV5Rkp0MjFlYnV3OGlk?=
 =?utf-8?B?UzFlNU1uUDdIZEhzbEhKWXFpUFJWSE1jU1VxTnhKRzEvV3NEMWhwc21tR2c3?=
 =?utf-8?B?amFNV3gwcEJFbnh1SU0xN2VIcHJyczhVQmtNS0RWWVBTR3RXWTRjU2xmTGpN?=
 =?utf-8?B?Sm5mTklNU1VaN3hLNzRvMlgwcTl3emxxMzY3TWdudFdEdlVJWjlZUzY0NmhU?=
 =?utf-8?B?VTBmV2h3VWJqeHJhMTZrQ3ZzcGkvd2tIZVU5eHJyMld0czhtbGMzeisvUis0?=
 =?utf-8?B?T05tR05kM09GTWNTTmI3Nnd6WnhEdHQ1ZC9leDZ2NUhMQXVnODA0eXdvUlE4?=
 =?utf-8?B?aURWWUNHNjAzcG9rRDRKV2hjckRYTnc0SlBSUHE1cjlDcW1FanhpckQ4Wkhz?=
 =?utf-8?B?MHpCdUQ2VEp6T3luVitHYldNcEFWR0NKMGZwZEl4SGMvL1R2N0tEdmVDcTBQ?=
 =?utf-8?B?L05RaWpCRGloQ29BNCtOK1doSGQrK1VXbEJmUVJpUHBBVmp6dWJJUkRDMmd1?=
 =?utf-8?B?bWdPcE5sVmthUXVmeWxYWlFlRG0yYmNwTGRLNTFlNFlMVDJQTEFWZEx3VGFK?=
 =?utf-8?B?SVd5Q3dWYzNOOHp3dTVLNW56Qlg3d3l3Z25wanNYT2VLYStFR2dGTHlyRHhT?=
 =?utf-8?B?djBNNDZvd0NoZWlrVThwV29yRHpPWVZtUGtoQmJVZ3hrZEJGamtjV0VDWFJS?=
 =?utf-8?B?Rm5Fa28xZjY0SzdUQ21qUjNDNHNidUxLVkhaaVpxelMzRUJoN1cwNXNtZGRp?=
 =?utf-8?B?K0JuQ1VhMGN0OURjMW5Pb0pST05zY3pTcWhwV2p3ZDQzdW1VM09hVm9Xamdw?=
 =?utf-8?B?bHJxMnlkeDR3VVUwNXZrQ3dMeWFHWGtBRWVNY01OdWc0cVdBYXZvdStsTjNL?=
 =?utf-8?B?NDYvbWFDSUJDZ25VWWd3amk5SitOYVA2alpWekJYSm9yMTBwaHMxcTh6b0Np?=
 =?utf-8?B?cFUrZ3VhanJxL0NodWk2aXVBQU5nL2lnUFg3WExHVWJDcjhvOE85MHVSclFC?=
 =?utf-8?B?S0NhcVNiRERLOUQ1OWNQTGZaZXNPeUZiQ1pTQzczb2JNRFZ3aURJM0krOWRL?=
 =?utf-8?B?bWRHYXdvVWRocithdzYyOE1pby93YUw0SFdUT0dYT0R4QWtQdW9VSEMzNkp1?=
 =?utf-8?B?N1lDN0pZQkZIR2hMVGxoeWZvd1NnU1g4ekRRYkIvMHNDMDJ1aENXbFFRT0t2?=
 =?utf-8?B?Zm1YRGVkcXdwVlVXZlRXTk5GUUc3UWJYVWlJUi9rbm8vZThGcG9samlqcWdH?=
 =?utf-8?B?anh4M1Q1RlBCVnByRW0wd3JHZ0tGN0dqcE5YaVozWTQ3SnI4NnBsbzhOVVAx?=
 =?utf-8?Q?AbYLc2qgnTSvQNRtPFvjpxgNF?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <C603156723423B4A98CF56A75840E5A5@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY5PR12MB6526.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8a1662e5-e74a-4c80-f663-08de1d4301d9
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Nov 2025 14:44:36.3791 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: p8DdnT8iC5C8/29m8QLzLR2NvXhHJVx4OSU8g0/WrQv4VBp0a2YyA41XeEpProXE//NifBPLJcMLi4pn6XwK3A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6044
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

T24gV2VkLCAyMDI1LTExLTA1IGF0IDE5OjU0IC0wODAwLCBKb2huIEh1YmJhcmQgd3JvdGU6DQo+
IMKgwqDCoMKgIGxldCBoYWwgPSBtYXRjaCBjaGlwc2V0IHsNCj4gLcKgwqDCoMKgwqDCoMKgIEdB
MTAyIHwgR0ExMDMgfCBHQTEwNCB8IEdBMTA2IHwgR0ExMDcgfCBHSDEwMCB8IEFEMTAyIHwgQUQx
MDMgfCBBRDEwNCB8IEFEMTA2IHwgQUQxMDcNCj4gPT4gew0KPiArwqDCoMKgwqDCoMKgwqAgR0Ex
MDIgfCBHQTEwMyB8IEdBMTA0IHwgR0ExMDYgfCBHQTEwNyB8IEdIMTAwIHwgQUQxMDIgfCBBRDEw
MyB8IEFEMTA0IHwgQUQxMDYgfCBBRDEwNw0KPiArwqDCoMKgwqDCoMKgwqAgfCBHQjEwMCB8IEdC
MTAyIHwgR0IyMDIgfCBHQjIwMyB8IEdCMjA1IHwgR0IyMDYgfCBHQjIwNyA9PiB7DQo+IMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoCBLQm94OjpuZXcoZ2ExMDI6OkdhMTAyOjo8RT46Om5ldygpLCBH
RlBfS0VSTkVMKT8gYXMgS0JveDxkeW4gRmFsY29uSGFsPEU+Pg0KPiDCoMKgwqDCoMKgwqDCoMKg
IH0NCg0KTWF5YmUgY29tYmluZSBwYXRjaGVzIDIgYW5kIDM/ICBBbHNvLCBtYXliZSB0aGlzIHNo
b3VsZCBiZSBhIHJhbmdlIGNoZWNrLCBpbnN0ZWFkIG9mIGxpc3RpbmcNCmV2ZXJ5IHNpbmNlIHZl
cnNpb24/ICBJdCBzZWVtcyBsaWtlIGV2ZXJ5dGhpbmcgcGFzdCBHQTEwMCB1c2VzIHRoZSBHQTEw
MiBIQUwuDQoNCg==
