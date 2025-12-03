Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F0B35CA1991
	for <lists+nouveau@lfdr.de>; Wed, 03 Dec 2025 21:53:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB75110E164;
	Wed,  3 Dec 2025 20:53:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="LFeLsntJ";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from DM1PR04CU001.outbound.protection.outlook.com
 (mail-centralusazon11010034.outbound.protection.outlook.com [52.101.61.34])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA83410E164
 for <nouveau@lists.freedesktop.org>; Wed,  3 Dec 2025 20:53:14 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qF1FTjyWIXliIaloKw852AlQ0gHKxNn6Zd3eVmngiLFlWzGkVAryObFi2BzJ02cOJce/reqhUsYX5vgjjDe1euEER9p2iN5/jGA9033Gwfu6arYLbvg5E9JAKFEAvLUGD8fp6Onyq8McY/RK0qh67Z1N977LH+UqlJQZ2cq3kTYRzAC4iKWU4g/51HS9RaRCbboZ2yeA9RiJqP6Ao9dNLcVlV6yYta/BSABkcVErG67Gt8yvx7yq5Mf8PvMCgkrKJaILgx/d2YByhbmuVP13SX5vaZSsSsZvIwfyraigwO/ut/q0DmOY1PIo0zCSskXQCOQ7YYTkFL+02cZehYw61Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vAnas7NOCEZOdOb8Wwq9lz3cLUusjypkcWAJDbMCAUQ=;
 b=vVVpBqTWfpquLC1E16wnjeWf7/jiM0e8fX2cJ/6y4tzvM6NUsm5cxAKpmT9e3tXLuBZDBElwbuHAkos6Sq1+WtVDl4LjUJLI/CZBvJLzfZuU2muhyW/taC9NI+raA+dEDoYxn+ME7uB30f2QWwrgTHs37VRQtxy6bqluYzKmNl8udRP3tPNeNIh0Slp8D5UkFs3+/XYZSAXX5tEsqKQq6fwCOcTCrXiqo1PjEgbEuv7InBQdriyFUhJ2f76ai6WPSx9n8gMZLTiyls2YLfQHAYxFp3LmdjYuIwinXN4i2XAgXyKIykfAGK31zB/0ip/r2CN5np6c+PG4bt9j+UHNBQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vAnas7NOCEZOdOb8Wwq9lz3cLUusjypkcWAJDbMCAUQ=;
 b=LFeLsntJwbJ/L23ZCNe/epkUG3wZA4CwH7jNPgFVq/wkr3rHhKpP+6EV90ok4ZjwC4lQLAhahoORDm1XAmsK+kK/wAmThqjt9VTHzIuG+b2tfcIXkf5rToNZpGGznOyJhHvf3oM/ShFItEeZuV3N7PSF5PU+dDnR8bl4/onnXcus5K3GfGPn28LsBbkE5Y+4jrdT0+lLAXNRXqBwv0EzYhqDYTtEJi/F/n/PdGyzJgQsNHjMi3NodM6GsNXaIV2aFnDmv/+FUW/P3D1QTthyHmOqB8evG3QG9qt6/jxcY7kSf7zq0TTXcp3kapAg9ecQJT9jNhDFaEeNg3SXbUO4uA==
Received: from PH7PR12MB7937.namprd12.prod.outlook.com (2603:10b6:510:270::21)
 by IA0PR12MB7674.namprd12.prod.outlook.com (2603:10b6:208:434::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.9; Wed, 3 Dec
 2025 20:53:09 +0000
Received: from PH7PR12MB7937.namprd12.prod.outlook.com
 ([fe80::805e:c531:4f9b:57f6]) by PH7PR12MB7937.namprd12.prod.outlook.com
 ([fe80::805e:c531:4f9b:57f6%4]) with mapi id 15.20.9388.003; Wed, 3 Dec 2025
 20:53:08 +0000
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
Subject: Re: [PATCH 26/31] gpu: nova-core: refactor SEC2 booter loading into
 run_booter() helper
Thread-Topic: [PATCH 26/31] gpu: nova-core: refactor SEC2 booter loading into
 run_booter() helper
Thread-Index: AQHcZBoSbc2FS9K/dEGkEtfPTJSzqbUQZXMA
Date: Wed, 3 Dec 2025 20:53:08 +0000
Message-ID: <7746f9aa282db48600b2c1432bd4c14df585541c.camel@nvidia.com>
References: <20251203055923.1247681-1-jhubbard@nvidia.com>
 <20251203055923.1247681-27-jhubbard@nvidia.com>
In-Reply-To: <20251203055923.1247681-27-jhubbard@nvidia.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.52.3-0ubuntu1.1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH7PR12MB7937:EE_|IA0PR12MB7674:EE_
x-ms-office365-filtering-correlation-id: 2d334851-5754-4eab-eb4f-08de32adf715
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|376014|7416014|1800799024|38070700021; 
x-microsoft-antispam-message-info: =?utf-8?B?ZzVIRlNSdXdGYVNnclJkdThJUllPeVgxTXlmeG95WnU1QVJSUy9sN2MwYjFa?=
 =?utf-8?B?aGFrYkFHNy9ZdUx4em4yZFh3bkRnc084VHBpa3d6bmxKQ1l1RWRjdGJIc09n?=
 =?utf-8?B?NTFUR0xPR0x3R1psbnNDbnQwUUxEVUpCWW9DbEVpRUpmVWdoNU5OR1lDdE5X?=
 =?utf-8?B?NHk2NThJS2FUK1k3ZEZtSzV5Mm1vVWowZmVxTUlSeG1TdDd0OW1ubUN5WkxK?=
 =?utf-8?B?dXNTNFRldC9zUWZqQXNUc0EvQng0c2ZXZDhHYXZPQ2VTQlRFdXp4enJoZ24y?=
 =?utf-8?B?UWZGY1cxYzRBS1Vza1M2Kzk0cnpkRTY3d0lyT3RzcGRrcFVrOXpneUJzSXB6?=
 =?utf-8?B?em5hTzhqcGRGNS9ycXgvaVpiaXJObDhpbVgrVnExMWdBVjQxYzN2YXN5aTFj?=
 =?utf-8?B?eWhLUnp2NXpScFVoeXNFbk1aT1lFQmpDN0tyZTdvMHJPNHh4UXltTWh0bWJH?=
 =?utf-8?B?OVZwVHlEckxGQzBObjJZanFZcmNwb1lud1EyWDFySGY5cFhnK1JOaElZekow?=
 =?utf-8?B?V1RGalBjQWowNTRDM3dxdkJKMTdObW1ma3Z2bC9VZnlJQ3RhU1Z3YjNweVgx?=
 =?utf-8?B?RmR3bFpjR2FwV1lpcnBNbE5lanFuQkFrWlNCTVRNd0k5aG1wWG1DZUJBSUdK?=
 =?utf-8?B?eHFQTm96QU5RZnFWd0tPRlRaTXpJWE9xMzBPNy9iOXhMQnVYRXlodzRKQzZZ?=
 =?utf-8?B?YTRGRTVzaDV6RDBuVkloeVVMbEJobHY3UDY0ZXpma1gzRkRqY0szelQrNGVS?=
 =?utf-8?B?ak5DLzZQTVg4dW9zazJqbXYxUGxrVVB0RVdyYVFvWkU5NTloblpuS05yc3g1?=
 =?utf-8?B?Tk93U09YUm1PcUJVWm1Mc285bFBsMlUrbHgzUjg2cXJJWWpTWXEycGw1L1dj?=
 =?utf-8?B?eFBuc2RVQXdGbDZpZ29zRVBtcXBpTnlFRSt0WXhFOVA0WVgrSFNiOFhMb0tX?=
 =?utf-8?B?UTZ1L3NyRUJ0R3NVM2Y1T3B1RkJoUWJJZHlCblNtV0FSL0YwMjV3OXhmWW0x?=
 =?utf-8?B?ZmlBcjd2WlNucHJOMXd4aGhjV25Wcmg4RWppb1ZZb21Mc0dUVWJ5bU5RWGxU?=
 =?utf-8?B?M2RjTFZxdVozK1UxRlBvckdlNS9NdXBxeUJMTzF3MmxXNlhQTTlvdzNjV0JN?=
 =?utf-8?B?TmwwOEN3N25DR0ovckZqOVBKVENNSDZqeTJ4L3dtNzdCSFo1VUN5YjZZT003?=
 =?utf-8?B?Y1hBa0tSWEhPUGhPVE1sMnFYcFJkaHA3YXY2SFVxa3Q2cGtQVUZNTU1FQzBK?=
 =?utf-8?B?cEVpZnY3TUZjZ2RDa0RyZUczT3VKZnd2cEY5c2NaaTNVWXo3c29nRDhvdFds?=
 =?utf-8?B?TXJMaXpTOXZYZlVTdlFzUFMreUdvdHM3MXRDRGtneWxHcXM0ZExNYWRMRUtk?=
 =?utf-8?B?OEdEanJjUnVOZWRodkFtc2Q0UTlrVkxDcDMzNFRYNlBtSEc4dWZpNVh1R2h4?=
 =?utf-8?B?aHdHM2xUWmhqQmorU2svZjUxME5Ua3ByVXFNaGFRSmVCMWwwUk1mM3ZqZE52?=
 =?utf-8?B?NDQ5VlcybXh5ejltTm9GZTBOczgvYkdoZ3ZlWUhUQUxLZml4M0Z5YzZJckxs?=
 =?utf-8?B?QzlmaWFxbFdBd09TemtsUlpCSEpjaWR4RGRrN1pkRUVadGZRTDVFMnFRWDBF?=
 =?utf-8?B?djB6N0N3ZnowQnJZbmI0NnZXQXRjTFM2amZTa2haclVERzJCZ3ZFVm1PR0JJ?=
 =?utf-8?B?aHlpY1FPTjRvM3NHT1lmKzlCSWZaM1dDQ3pkK2xsZitVcWlpMVYrZXJvOTBy?=
 =?utf-8?B?RXIxSzdJd1RhN0NTQ204WGswU1dFZTg3MlJoUDExbGhqM2hNMXRBemJCdXBs?=
 =?utf-8?B?Q2lydDlnT0YraGNTL2o0aXRLS2VhZFo4dnpnZmsvQlF6R1RqVjBtNTV5MHo5?=
 =?utf-8?B?cXc2dXJqWUJKemVqbWxyRVBnYjQ4SG00dWVQSkIyTGt0ZkJuOG1jc0I4OTBO?=
 =?utf-8?B?c2FINUtxUnhCUkJMbFovblovRFp3UFhQRnR6U1BUcERvZFVyK2NMQmdPemVu?=
 =?utf-8?B?bGs2U3NyN2Vpb1JZY0l4Y1JxamNoRk5RMzRuY0s5VHJrR1JtL21FMzRPclRG?=
 =?utf-8?Q?QrIijC?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB7937.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(7416014)(1800799024)(38070700021); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Q21PbFZSdCtTRGFNeG9teWNEQ0FTSWVRUG1OYWp5RVMvaU91UCt6Q0h6c3VQ?=
 =?utf-8?B?ZzZHaExpV3JyVnl1T3ZVdG1TUkxGR1NCNlgyZWNVQjJqbytlbEtQaXZVWTMz?=
 =?utf-8?B?eGJLSy8vczBOK2VienQrSk1OTDZ6cmJ2WnNIS3hhcnZ2WklXV3FIa1prRE1l?=
 =?utf-8?B?dTF6S2RTcFZRanBvaTJFaDdic0h0aE1sSG5Hd3hpY3VmUldIMWt3T3ZvbXJk?=
 =?utf-8?B?bWJaZ1hNTkFFT0Y2OXNwdGEwb1oxMjR1MEhna1lsNDlCeWxYZnF0YmQ1UGg5?=
 =?utf-8?B?aGF5NjRrek9nRVRtUG1UcGJCVlJaVWpFL1JSazdzNVlMamx2djBqZ29BaTVM?=
 =?utf-8?B?clRzelZTenN1QUZFZEgvL09wWUQxZDBjVjJpYVFsTjdqeVRMWDBVU2ppaEdX?=
 =?utf-8?B?S0ZyOWgyMTh4Qng3YnJjaE5kTWo3dTRJazV6NjNBY2M5M1RyT1BxYTNGTGxL?=
 =?utf-8?B?dGtmZzA0amp5aEs3L2dYM3Nja0FOY2FDZE55QlA0dytqaGQyTlZMQ3VMZjAy?=
 =?utf-8?B?cXZXY3RqTXl1MENGbUkrUnp5cUlmWTZrQmFtNm5kSEk2ZXNaaXNobTNUcmNE?=
 =?utf-8?B?UnpUb0xPczBhaEFmcUw4U1VnZ2JzejB5TW92QVYvdlpxUlNtSVZYcWNVNFho?=
 =?utf-8?B?WG4vdlVvaGdKUFFSaEdtcVFXdUI5S25saVlQZ21EYWhxM1pGWWE2NzQwNHJ3?=
 =?utf-8?B?VVdValcva2k3ZUxJaUxGWXo1UURPWG9XOGpCSFRtb29BNitoc0wvbStxOG56?=
 =?utf-8?B?M215SmdHbnpjMzg2M284KzBQdmNrcVN6N2hWVTA2cHRHcDd5MDg0MGs3UlVN?=
 =?utf-8?B?eUdPUGNaRm9aL0JRdTlheEZQYXdBNWEvZHdlVGdRTUhqSVhzQll2MlRKc3B6?=
 =?utf-8?B?R1FRaDFFd1VZWXBxVlhrcGZ6TEdPNFcrN3dOZmZLOHNqODY0NStsZEpqQW9V?=
 =?utf-8?B?L3NxVSthdWxkelpvOW1SWDlDSG12OEMwWHNvVXZaeDM1Y05ZRms0ZjluODFw?=
 =?utf-8?B?ZGFiMHpzYi8xTjI1NVY4SjlmTHRodmhkY2lma3RpdG5iUit0VmhXek1JN2tl?=
 =?utf-8?B?Z1RTSnVpT3RtRnZSRjVsWTdnbWd0MWxDdTJHVnN5Z1Y1TWdJcGZsMDUzeXkx?=
 =?utf-8?B?WWJxREk2Yjk1aWFLNERSdUM4OXpvb0FXS2ljdXY2U3VEZ1g4V3hmZGh3QUNh?=
 =?utf-8?B?ZWJVY3pSZmdjMkFubDVKaXN0M0JwV0ZnY1RpR1BXS2VQYllWZTc3ZWlWY3dZ?=
 =?utf-8?B?cVVQNFpTUTliMk5aRUkrRStXQzV2QkUxSVNTME1kOVN0Vk1FZ3NYbVovbHJV?=
 =?utf-8?B?QjZlZW9IdkZLbmFuS2QvbDVIaEZlaWJzVFc1bUxCY3M5SWZEWU9PNkx4UVdx?=
 =?utf-8?B?QzhMRitiMEY5Uk9PZjhyeDZUdjJFSVVNOWRUV3RIanFiR1ZCUUFUaUVSaVJS?=
 =?utf-8?B?WUpsUWdrSDd0b2ZURjNQd1FCdnBhUkcyTUhwbmJST05oTkRoTi90MjRnUGdq?=
 =?utf-8?B?ZXF2UnJGUWJ0a3UwK2hvYm1jWHdQQUtxbUZLeFVrc1YzUHRHUjdKbGR2MXpL?=
 =?utf-8?B?R0JTT0VBM0tSNG1TbjJxUlFZVmhBenN0MjR3MnpKa3luT3cxOFZWUmRZSVl4?=
 =?utf-8?B?QkdwK2g0SmREaCtQaEZCbTJLRGwwTVBzdDc3N2NNVVdoK2Z2TWtPeFdMbjBE?=
 =?utf-8?B?WS9CTDlySG50Z29PUVI4OVEzcllxTFQ4dXYxR3c0cTdPQmp5Qmw1bVk0T1dy?=
 =?utf-8?B?anRNWU5xRFdnMC9WY3AzMW1jZmIzeTRkazlKdlZjOGtYTTJXS1dtQkh0ZVps?=
 =?utf-8?B?RE1KaWZEdGZPR1h0SU0yWElwWnhoaDFzTTRiWm1ubEs5MUdPc2VnL3owNll4?=
 =?utf-8?B?RnNlZWMyaExWTit0WkZaT0lQVVdHZDlKZUtaR1p3K0pkbGdlY1FzVndEMktv?=
 =?utf-8?B?QWMrK001dElvTXA0STBTZzhKN1NjbFhVTjd5bzMwUGxCVWRjeGZIOGxJMWJG?=
 =?utf-8?B?TGtqbU5BOHRLQ3krS1ZoNndoT3pGU2VIcTFDaHJPcEFDQVFwR21hRDRyYndz?=
 =?utf-8?B?OFZIMmwvNUlCRjdhbHQzRVZiUTNSaUdlVEJjbmRiZWIyYUZwR2NzTzk5SXhL?=
 =?utf-8?Q?gALUTvyebTissfEZ1wiJ83e+H?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <E554F2A595987B45A3E7A88ADA5F8F4A@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB7937.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2d334851-5754-4eab-eb4f-08de32adf715
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Dec 2025 20:53:08.8797 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: NbTNV8p8xpGaf9DmsW0GhGgwnI/qPnZCSk/Wtqv/zKa7imXAMF9gmhh6o9Y6GrRklY7Nq/oz2INbT+okQVc7qA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB7674
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

T24gVHVlLCAyMDI1LTEyLTAyIGF0IDIxOjU5IC0wODAwLCBKb2huIEh1YmJhcmQgd3JvdGU6DQo+
ICvCoMKgwqDCoMKgwqDCoCApPzsNCj4gK8KgwqDCoMKgwqDCoMKgIGRldl9kYmchKGRldiwgIlNF
QzIgTUJPWDA6IHs6I3h9LCBNQk9YMXs6I3h9XG4iLCBtYm94MCwgbWJveDEpOw0KDQpXaGlsZSB5
b3UncmUgYXQgaXQsIGNhbiB5b3UgZml4IHRoaXMgcHJpbnQgc3RyaW5nPyAgSXQgc2hvdWxkIGJl
ICJNQk9YMTogezojeH0iDQo=
