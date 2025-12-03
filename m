Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 66508CA0FEA
	for <lists+nouveau@lfdr.de>; Wed, 03 Dec 2025 19:31:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E1F0F10E7F6;
	Wed,  3 Dec 2025 18:31:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="te4GCNut";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from CH1PR05CU001.outbound.protection.outlook.com
 (mail-northcentralusazon11010062.outbound.protection.outlook.com
 [52.101.193.62])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C50DB10E7F6;
 Wed,  3 Dec 2025 18:31:32 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OFCZnQ1Secz1ObdbeHE1ppXdHJaBmM+2TVJD8XyMUGHUdf3ZJrdz0w3+xJBNuAeh1vdkJcE7JIMbOxgox7lH4SP8FaxZECbz7WFHbdWGtETeIv8uyscVV1aPEZtAP20NnVoHKh52vNbZKCBJLf1uLu3K82nRgpxv3wL/DqvesjL+rJdiJkAO6RXc38K2y4sW4YlJz4ZmwpJU+2WLWf0kOkCPY1tMjqW4AejUfINOzP7AA5Z6uX/5EKgC7n9bfbHAYwPmix0tKi+kWXTDnHyLl5crynIx/2UWXIhUkCqdyjr/daFPlTkXaqDZlh+9lZ/1LVrF75NwrQ3auL3clWKhBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Wd30DVUDDSTBL20ZqO155GOVe/esWcQUyuTOxE1LCOI=;
 b=LIxmYL16XfEW39awu5lcqFsvXIXrOdjOx4YNo2+DgE30q28vuhGtdpL3NlPLZZq12+i07s5kXQ5TCKcNT3j71UoIlQEOEIxVhHvykn5IRoRjx03uLFoGw8YBMTmKH9U+C5LlVVpJjlv/x+F+4vodhZo4jEJ/llJTPC09qkGFEJLI6dTFdoeDeTdqfIr7Ri5gRyrQy5uoXGb672pnLzjPdgj536cHRTUcb8qKwMv/akUFsrzprcgI5smIFEx/rNwxVjdvyRl/r/h3JGW3gojWwhPlv21d8BCY5yOdKRItH1//VM9+uuOJbA3s9oyXXTHhQRXjqhI3Qwq59bTd/2/Lhw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Wd30DVUDDSTBL20ZqO155GOVe/esWcQUyuTOxE1LCOI=;
 b=te4GCNut11xzAN3qOg1/k8M6agQZRv+JYJLmydGYiLbJFLoKINBieHlUUD+Po7gJ7oX+/otAILtgx8bLeqVjRjfWVAyAPEZhJ1brQWm9M+667hPzVmyANKZGkF4EnGcC5TRO1bRW6n+ZJs7GdFC4jAtxe6TZPcuu4/aZIc4ihO+zEdCOHr9ArQPCXfC3MVK3f3TextqUUV1Nipg9DfsDexK2bChYCk48KIcmCr8C5UmKXFdCqT45YPttSB3KIVVRxxpu7FndDyY46KCR5eY1+k0JM6aSNQ5Kv/T1VFsBOYS1Z9SOo1VyoOSEWUVkm11d5tBAKsCpE9aB5tVjVmi5sQ==
Received: from PH7PR12MB7937.namprd12.prod.outlook.com (2603:10b6:510:270::21)
 by PH7PR12MB7937.namprd12.prod.outlook.com (2603:10b6:510:270::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.9; Wed, 3 Dec
 2025 18:31:29 +0000
Received: from PH7PR12MB7937.namprd12.prod.outlook.com
 ([fe80::805e:c531:4f9b:57f6]) by PH7PR12MB7937.namprd12.prod.outlook.com
 ([fe80::805e:c531:4f9b:57f6%4]) with mapi id 15.20.9388.003; Wed, 3 Dec 2025
 18:31:29 +0000
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
Thread-Index: AQHcVb7O8BOTeMMK20yX23bEM4/ssbT5X+OAgBQoLwCAAmObgIAAbumA
Date: Wed, 3 Dec 2025 18:31:29 +0000
Message-ID: <df975795b0dbe58214ad302d7182ce6fe92e5fd8.camel@nvidia.com>
References: <20251114233045.2512853-1-ttabi@nvidia.com>
 <20251114233045.2512853-11-ttabi@nvidia.com>
 <DECCV8XB5U56.1NBFD1KFJ59LU@nvidia.com>
 <b28cff274d79de78496c7f0fcc3627b2f816d3dc.camel@nvidia.com>
 <DEOK871CSNZB.W94R3SDUDZ22@nvidia.com>
In-Reply-To: <DEOK871CSNZB.W94R3SDUDZ22@nvidia.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.52.3-0ubuntu1.1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH7PR12MB7937:EE_
x-ms-office365-filtering-correlation-id: 48658a5e-d3d4-40d9-2ce6-08de329a2d11
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|366016|376014|1800799024|38070700021;
x-microsoft-antispam-message-info: =?utf-8?B?MGliVTFBVjYzK3NKSytQM3RZZFhHMHR5OFpLbGFJd0Y1VDhFR3g1Rks2ZUli?=
 =?utf-8?B?Y1UyaE42SG5NNTJmNnY0KzBVT2RwU25FQ21Id2J1Zm40SHFFZEZyOVd2Y3FG?=
 =?utf-8?B?blpYMmpJSGdYZnl6eGYxOE1KaGtFQlltU0t5OTJldFBaOFFFUk02V1Q0aFpr?=
 =?utf-8?B?bGdPY0M5d0k3U1dUOUJwVEFwa2pYZEp3dGxzODBmNlFYa3RFaDFkOVlvdVRO?=
 =?utf-8?B?Q09CV1FyemdyQWc2Wi9OaXBBN09nTVZJRTl3Vms4aEdTZ3huUkQ1ZG80MDIx?=
 =?utf-8?B?UDdoQnZSVENLdWk3SzFyR3A5cGJEbklWYldQSDlNRWdYSHoxZFpWdVlVNGo2?=
 =?utf-8?B?WlN1MlJCNlpPVW91eVdBMmxCNzUrK2tkTE1tTWdheXU2STZIOXlGYW5mTWFw?=
 =?utf-8?B?QUZQSDVhMTVxTFlMNUVwdXFyWndaYmRKWjlCZkQwRHhtZ0l6WXZlcUlOTnNu?=
 =?utf-8?B?TFRoRDhSL2tZU2ExeEoyN2UrdmtYM1plWjJjNlZpQU9ERmcvYXQ2TzVnRkJ0?=
 =?utf-8?B?YjFkakZTY2t2UDQxazk2VXdtd21Dc1dkMkwxem9BaHQ3aWtGbUtGWkplU2k0?=
 =?utf-8?B?S0dPaE11ci91bllUOXBpMithdDl6QXlWaEZ0Z3JramJiem11cVQ5TE56aFl5?=
 =?utf-8?B?M01UMnliVmZRbHdhaDFVYlBWZlVTKzNGVlhwQmpYeVUyVmJSd3Voc1RqNnQ0?=
 =?utf-8?B?YVZHR0FRKy9SdTMzZ3c3Z3N2bmoxYUhzNTFNeXh3SGpDSHh5b1VNOUllNmtO?=
 =?utf-8?B?TDBjVDhaQXU2UW9XUTArYisvbUxiRU9wTjA3SFFjT0hrd09RSlRpMzVCOU9r?=
 =?utf-8?B?UHB4SGpFNTYwQjljc0ZYTS82aGpjS0g5WlZ0eVNqWk1VazYxVGV3bFVrb1dG?=
 =?utf-8?B?b1p6N3VJU2hjWkF2VmhEbmVWMGRDYmJqaDJIbWJ6aXJlSHVFalgxRUdqcEF2?=
 =?utf-8?B?MXBMWlJUOVFpN0dzZ2I5OFlGYndSUXZ3d2d0ak1jWkw3ZDk3akdRcm9ZZmcw?=
 =?utf-8?B?OHE5T1g1eDgwY2E1TXRZUWcwMTIzUk1EYUJ5WmtyOWdaZS9ta2lPd2JFanl2?=
 =?utf-8?B?Z1F0M1dvSy8vOW9TaDJWWFBaYXBOR0xENVBUUHFPclloTHdFMEY2VXZqamEx?=
 =?utf-8?B?dmNodmdIKzRYbk9wZ1hqWW9iSFMyL3lPV1pRcXZhOUlOOTk3R0FiTXByQjlW?=
 =?utf-8?B?eUFQdFJ6WUcxSDZpWlFnbFNjODB1YytNeExJNHhFVnVxdjNwalpGbXlQcHpM?=
 =?utf-8?B?MEE5U1pTM1BnWTVlQ1dUazJoQVVDaDlYNHgzNEpUN0hrNnJFMVd3Ni9nOStH?=
 =?utf-8?B?cFM0VXNwbUVTN01mNFJkTTdsRmxVaXpFV3Ard3V2Ny9HWTFqTWh0UFhoQUk2?=
 =?utf-8?B?TUhHdTZINnUrZUR2Wk5vOGsvVGVvRFh3UlhOSmVkaHRIL2Q5aTZOeXNmckNn?=
 =?utf-8?B?TFkzcmlCVDNoSEtDbkV0SGRIZ1VyQ3RVWWdha3cwOGVmeHk3NEthNGJiWng0?=
 =?utf-8?B?S0Z5UytWaXdjMmdOSmxzZCtQNDlVOTliTUJYZUJYVzFNd3UyVWNpSzBMR2px?=
 =?utf-8?B?aDdNaGd6UVdTNGxXaW8vblVzWkM4VHpINWF6MGZpcUpkRzl5ejJlSmprODl5?=
 =?utf-8?B?UTBvYTR3VUhscGRXaldrcm5aWVFySTdtcllhOTM0ZUhhQU90QVBYdDExYy9O?=
 =?utf-8?B?U3JQdG5Eam5Sc0xlUVk1RXNCTWZBTmhKOGkzaStNNmZQL0VYRFY3cDQ5UHoz?=
 =?utf-8?B?Nm44TVJGNDVwK2xkeVV1ZSt1eEU0Q1p6bklWRTdqcnZUWW5aOFVFMjU5ZTFX?=
 =?utf-8?B?aEkzZXJWaFV2eHJ1U2NFZGtoWE9GMnJRekNib3gxU3h6WndFcVZ1Z3g1TWln?=
 =?utf-8?B?cXRJSmk3NG1wMnk3ZDA3L0N0TlZpRC8zbVJIV3NiS3o2ejhKMHNFUUxLTWgz?=
 =?utf-8?B?YW1mU3h0eG1KV0J5UzJKNVQ1TzBRVy94L0VQcU80Nkg0VVk0YzA5QW5VM1ZF?=
 =?utf-8?B?SlZXYTZVNGM2WFRFU0NsTU40QVlCeG55TWNvVElZS2c4a2lzWlFvRkhYcmE5?=
 =?utf-8?Q?usnxfd?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB7937.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(38070700021); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?VTNJZFdoTmRPbTlKWWlzQVVwOSs4cFBRSFUwOXpuSnJOcnNOT0FWd0RPeisv?=
 =?utf-8?B?VHExcGxaRHZFNmNDaDhHQzJWZHFVeFBZVnVCd2ZvcFd6a1J3OTV5VlpZQWV3?=
 =?utf-8?B?bVcxbG1ucHdJc2N0MUMwTlM0cVlTeSs4NzBUMy9FZjZ6MitMWVgrWjIzUGlu?=
 =?utf-8?B?OFVuSEtzajJQUC8xWnZHRUxraHJxMnNYUDA2Q3dueFFILzIvOEhxdzhqY0x2?=
 =?utf-8?B?eXVCeTMwWStEMFRyQmVHemRIcW1qNitaY1pCUGwvdnl3Z042RjhnR2crbGVh?=
 =?utf-8?B?NktrUktCdTIzRkZCcXh4aFZCZUNuK2kxY3N1V0pabHpJQmt2S0M4OS8xemRx?=
 =?utf-8?B?b1pLYktjVnFUSGVma3NYalg2eE8wWmRnRS9YV29Ia0VVOUdQZ1c1M1dwY1hZ?=
 =?utf-8?B?YmhvNGJROWo3NEY0RkhlM1VPUVF6MnZLMEpiQnNSaVg0emdNRjMyWStmSkVy?=
 =?utf-8?B?bC8zdkphVHFGaldSSXJib1Q4VVpXSi9oQXBERWZLbzVDR085dGdLVVgyTDVG?=
 =?utf-8?B?QXpwdFUzeDN5RGNCeHpsRGZ2SXR1cDhVRVhQVTh5YjhFTmVRSHhaY0gxUktV?=
 =?utf-8?B?Y3RUZXJSQkF6V2d2WGk2UCtRSnB1N2FXT05iVURxTkRqMXJ5N1dKWjJOT3lh?=
 =?utf-8?B?SGtsZXRIV0puWWNBS0UyMTRuQ3BBamQzenNEWldZaEJVRDEwcExBRVF5NnZ1?=
 =?utf-8?B?eTJYcC85R2NOeWtUY2cwNkFvbTZiOEkwZWhweDRVM2wzaWRPY2RYc2tpVzda?=
 =?utf-8?B?QUN2V2x0aGtXUWh6Z2ZwNnFnK0RDbFpwVjZKMmNmTHhzZVBUR2x4RXhwM21m?=
 =?utf-8?B?NFpSL255dUlORjJwa2JTTGo0S0dkQmNWSVVOWHZPZ01raktNcllCVXJHYWdH?=
 =?utf-8?B?NHhRU05nZ013RVg4bmpHVzBYM2REOStQaGtRYW01YzVxWjh2ZG9RV1Y3MGdn?=
 =?utf-8?B?WkU0bGxRcjVtSCsvMS91Q0J1WjlCZmR4dHp5KzhDZGNqcWtzbFdsclp1UGpj?=
 =?utf-8?B?WUNOd054WnRrZHBHK2xoZFAzVU43QnlrSW93NG5JS1Q3dGFwdXNBOWdWUEtP?=
 =?utf-8?B?dGFtOSt6TmtPQ2xteUE4emNnU1RtZ3VubGd3UG5ydUs4YlRoR3YwVW52TWhv?=
 =?utf-8?B?d2hWWEVneTBNaHh2QUtRNG0wZ1FMbld3YVNpaWl2dGdyQlZqSGlVRU1wY3NI?=
 =?utf-8?B?MWlldVdvcUF1Wk13TmtLbkc1MGc5djBSTmtGQzV3b2xYbmwzV05OcnFsMCtz?=
 =?utf-8?B?WkNDT2V0K2czd2RPaXZXL0hSUlNVemt3SmxCbG1rSlhYQjMyRVNzRjdLY2lV?=
 =?utf-8?B?MkFPT28vVlN5clRLb1Z2TnB5UzlmTHA0LzdORVZ2UWM0bHk2ZVNoWnRBcjhz?=
 =?utf-8?B?L0VxNGhGTnFZNlhTOFA0TUdBenZDQnpNM0xKOWFZZVBPejRFV1J0QVVQS3Jy?=
 =?utf-8?B?RncyWHVrbERMMlVWQWZYWjBRUjdKVml4ZlBwMi8wNnJQbE9kSHNKM2NISjE0?=
 =?utf-8?B?Z3VQSmFnbnVXTGNQbVNWQXBpRzlGM3ovQWRmMGRyWEhnTFdPZ2hhZXlLNDZD?=
 =?utf-8?B?N3hCbFZEb1BKandtQjZsZFdYdjJZT2ZWTzgrc2NCekVXVFRieWs5TS9SMGVs?=
 =?utf-8?B?dkdHYTdXQkE3MUltYlNUL1dDQkJMMUFRNzB2Q1k4YitzbGhVdHZJQ1V2U00v?=
 =?utf-8?B?WXdTeUdyN3d5alV5M0o5anUySGVDZHI1NUdDNGtyTDdNZFBaSWNQSVozM2hq?=
 =?utf-8?B?WG5nMG9QUy9acVdLanVaVXF2WUNrcnA2TXQ1c1NLNFpSb3lRVHcyVkI3SCtP?=
 =?utf-8?B?REd3MUVibFhJYkNDY1cxK1NpdFMrbTRFdUNlUFAzelRzSDlKV3BCdW52ZWtq?=
 =?utf-8?B?cWI2WFZZV3FISy84U0JuQXlFVFB6azhVTHZVWFdDaXFsalZvaThQS29jb2hM?=
 =?utf-8?B?bk9RU0l6RjlxeU4xaFpOemJyRjNTTCtpYytSVE5iZC9JMUE5UW9KbXdIemRn?=
 =?utf-8?B?QzU4RkU2M3owL1JJR3dFWmxYSFJkSC9wdkpYdm1vd1F6NkRObjFuOVlEcm5B?=
 =?utf-8?B?Ym5ja1FVaGRpSDJJM3l3ZzZHWi9jV0tVYnlTTXUrSThid296L2VYMWltbDBL?=
 =?utf-8?Q?KmOT480fKIuc/2VTOuqbjQDPx?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <407781B15E6C3F468105B2FE586CA183@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB7937.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 48658a5e-d3d4-40d9-2ce6-08de329a2d11
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Dec 2025 18:31:29.5563 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: rCxD2+ZfWGa2i0fjA0sKexCMmOsp/YN5GuqmV8nFFrJjCYaOBUSo99+ZUZ8MbHq/x9dmCiY23vFpod2mZQokQQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7937
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

T24gV2VkLCAyMDI1LTEyLTAzIGF0IDIwOjU0ICswOTAwLCBBbGV4YW5kcmUgQ291cmJvdCB3cm90
ZToNCj4gT24gVHVlIERlYyAyLCAyMDI1IGF0IDg6MjUgQU0gSlNULCBUaW11ciBUYWJpIHdyb3Rl
Og0KPiA+IE9uIFdlZCwgMjAyNS0xMS0xOSBhdCAxMjozNiArMDkwMCwgQWxleGFuZHJlIENvdXJi
b3Qgd3JvdGU6DQo+ID4gPiBZb3UgY2FuIHVzZSB0aGUgYEFsaWdubWVudGAgdHlwZSBoZXJlLCBh
cyB0aGUgcmVzdCBvZiB0aGUgY29kZSBkb2VzOg0KPiA+ID4gDQo+ID4gPiDCoMKgwqAgbGV0IHNp
emUgPSBudW06OnVzaXplX2FzX3U2NChvYmouc2l6ZSgpKQ0KPiA+ID4gwqDCoMKgwqDCoMKgwqAg
LmFsaWduX3VwKEFsaWdubWVudDo6bmV3Ojo8R1NQX1BBR0VfU0laRT4oKSk/Ow0KPiA+ID4gDQo+
ID4gPiBOb3cgYGFsaWduX3VwYCByZXR1cm5zIGFuIGVycm9yIGluIGNhc2Ugb2Ygb3ZlcmZsb3cs
IHRoYXQgd2Ugd2lsbCBuZWVkDQo+ID4gPiB0byBwYXNzIGRvd24gdG8gdGhlIGNhbGxlciBieSBj
aGFuZ2luZyB0aGUgcmV0dXJuIHR5cGUgb2YgYG5ld2AuIEl0IGlzIGENCj4gPiA+IGJpdCBhbm5v
eWluZywgYnV0IGJldHRlciB0aGFuIHRoZSBiZWhhdmlvciBvZiBgbmV4dF9tdXRpcGxlX29mYCBp
biBzdWNoDQo+ID4gPiBhIGNhc2UsIHdoaWNoIGlzIHRvIHBhbmljLiA6KQ0KPiA+IA0KPiA+IEkg
c2VlIHlvdXIgcG9pbnQsIGJ1dCB0aGVzZSBhcmUgdTY0cyB0aGF0IHdlJ3JlIHRhbGtpbmcgYWJv
dXQuwqAgVGhlIG9ubHkgd2F5IG5leHRfbXV0aXBsZV9vZigpDQo+ID4gY2FuDQo+ID4gcGFuaWMg
aXMgaWYgb2JqLnNpemUoKSBpcyBncmVhdGVyIHRoYW4gMHhGRkZGRkZGRkZGRkZGMDAwLCB3aGlj
aCBpcyBub3QgcG9zc2libGUuwqAgDQo+ID4gDQo+ID4gSSB3b3VsZCBzYXkgaW4gdGhpcyBjYXNl
LCBhIHBhbmljIGlzIHByZWZlcmFibGUgdG8gYSBjb252b2x1dGVkIGVycm9yIHJldHVybiB0aGF0
IHdpbGwgbmV2ZXIgYmUNCj4gPiBleGVyY2lzZWQsIGJlY2F1c2UgZmFpbHVyZSBoZXJlIGluZGlj
YXRlcyBhIGNvZGluZyBlcnJvciwgbm90IGFuIGlucHV0IGVycm9yLg0KPiANCj4gVGhlIGlucHV0
IGRhdGEgaXMgYSB1c2l6ZSwgc28gdGVjaG5pY2FsbHkgd2UgY291bGQgZ2V0IGFuIGlucHV0IHRo
YXQNCj4gdHJpZ2dlcnMgdGhhdCBlcnJvci4NCg0KQWN0dWFsbHksIEkgc3RpbGwgc2F5IGl0J3Mg
bm90IHBvc3NpYmxlLiAgDQoNClNheSBJIGNoYW5nZSB0aGUgY29kZSB0byB0aGlzLCBzbyB0aGF0
IC5uZXh0X211bHRpcGxlX29mIGlzIGNhbGxlZCBvbiBhIHU2NCBpbnN0ZWFkIG9mIGEgdXNpemU6
DQoNCglsZXQgc2l6ZSA9IG51bTo6dXNpemVfYXNfdTY0KG9iai5zaXplKCkpLm5leHRfbXVsdGlw
bGVfb2YoR1NQX1BBR0VfU0laRSk7DQoNCkFnYWluLCB0aGUgb25seSB3YXkgdGhpcyBjYW4gZmFp
bCBpcyBpZiB0aGUgYWxsb2NhdGVkIG9iamVjdCBiZWluZyBwYXNzZWQgaW4gaXMgYWxtb3N0IDE2
IGV4YWJ5dGVzDQppbiBzaXplLCB3aGljaCBpcyBwaHlzaWNhbGx5IGltcG9zc2libGUuDQoNCj4g
SSBrbm93IGl0J3MgYSB2ZXJ5IGVkZ2UgY2FzZSwgYW5kIGNsZWFybHkgaW5kaWNhdGVzIGEgYnVn
LCBidXQgdGhlDQo+IGdlbmVyYWwgcnVsZSBpczogZG9uJ3QgcGFuaWMgdGhlIGtlcm5lbC4gQW5k
IGluIFJ1c3QsIGlmIHBvc3NpYmxlLCBkb24ndA0KPiBldmVuIGxldCBtZSBjb21waWxlciBpbnNl
cnQgcGFuaWMtaGFuZGxpbmcgY29kZS4gSWYgeW91IGRvbid0IHdhbnQgdG8NCj4gY2hhbmdlIHRo
ZSByZXR1cm4gdHlwZSBvZiB0aGUgbWV0aG9kLCB0aGVuIG1heWJlIHVzZSBgdW53cmFwX29yYCBh
bmQNCj4gYGluc3BlY3RfZXJyYCB0byBwcmludCBhbiBlcnJvciBiZWZvcmUgcmV0dXJuaW5nIGUu
Zy4gYDBgLg0KDQpIb3cgYWJvdXQgdGhpczogaWYgLm5leHRfbXVsdGlwbGVfb2YoR1NQX1BBR0Vf
U0laRSkgZG9lcyByZXR1cm4gYW4gZXJyb3IsIEknbGwganVzdCBhc3NpZ24gc2l6ZSB0bw0Kb2Jq
LnNpemUoKSBhcy1pcz8gIEFmdGVyIGFsbCwgYXQgYWJvdXQgMTZHQi9zZWNvbmQgZm9yIERNQSwg
aXQgd2lsbCB0YWtlIGFib3V0IDMxIHllYXJzIHRvIERNQSBhbGwNCnRoYXQgbWVtb3J5LCBzbyBJ
IHdpbGwgaGF2ZSBsb25nIHNpbmNlIHJldGlyZWQgYmVmb3JlIHRoYXQgYnVnIHNob3dzIHVwLg0K
