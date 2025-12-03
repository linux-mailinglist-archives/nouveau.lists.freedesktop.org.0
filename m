Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E0537C9D8FB
	for <lists+nouveau@lfdr.de>; Wed, 03 Dec 2025 03:15:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E4F3410E051;
	Wed,  3 Dec 2025 02:14:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="SMLFYgNv";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from BN1PR04CU002.outbound.protection.outlook.com
 (mail-eastus2azon11010051.outbound.protection.outlook.com [52.101.56.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 97FF310E051
 for <nouveau@lists.freedesktop.org>; Wed,  3 Dec 2025 02:14:57 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WKRq8BFSlwkRaSjGsvW20ZMpFn3dakulBDvIbLcaAXNKbSfpS2frUw0UJCx0coAe3aWFCBiLTUEPoaVEQbi2OMsg4Bfin8QOFUbPeSUZ5v4dwoqQtD/nd8OoKkrzWVPfhOsQXSGsitxjs6o7OJu5MJpGCAPLrwgLN6+o5w+9k/FPXc2zK3newes6FL7n5V/9wRI6cYF5jjcW+qVGJQE6ymdDq1U3bfAPIqxUYEegNdNd9B+Q9C6BPtO9T8YGwVvSTKbcyqACzmjfiArsGSRmjIAhs6qBrcsFmkzPkl5MWcjeY4c9hTskeGQn0prcJZGD9ByA/hkD21CUO3ozRLYjxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ctI98e/BdJekOYjBdQITVaSoNyzfDK9YAp4/dhqttDQ=;
 b=MCQYlYgiJ18/Nu+s32X8meN2YNiFFAn2h5ExnU1ftWaDoI1d+Bzeg398PAivcikl3HacyreUACC4niZcHLo6jogdZ0d38VXz3WhSOenEP+Kt+9mRVUOpvKP2E0dNSeLjhfBs+VRtgkRF1XpQ99joCXZWM+hCuCiUTtdw9MLUhflSRZLW9+358/lfHbD8bkbpVrHXqSLW2Navmt+g2UM8zo7o+IgoXDE+F3LFwLKOBlR7VWfC5JBqAyI2iRvcV3nxg3n0uM1BbkT5l+lMzT2/RVTZMZu/3yqbyDmauWOD2l2yANANjD7lg+68fxJwt7OeKe1Ib45AjPG15ZCxIydNrA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ctI98e/BdJekOYjBdQITVaSoNyzfDK9YAp4/dhqttDQ=;
 b=SMLFYgNvgSz+Klr2zyhIQO0x4q6EvrDCHmKMk1G5HVkEZYFfepqxMmiM90MzJ3UxAR6mg4ZoGJKCO120fuFeptRQia11t3Gf1xlQ7+RmO/d5VjlDuaz10hkhcw7f8TibRJgs3Z/M+D+p5U0nQHX+9ewQDYCMjjj1TrAMf75esla75cOxdwQcXlPoVBhSg1oeLM4+owOTo5CU/gYPBOMT/wql32gT/nwNE5YPF448LXS9XETURW6T12D+L/fw41v22AJfZQHa5xnZ5YE9ALGe+pzCACUdukn9WJn7djLT8iob8n/IlLb2e8diPs2oJ5pvh8rILGSxNkcM3tIwJ8nN6g==
Received: from SN7PR12MB8059.namprd12.prod.outlook.com (2603:10b6:806:32b::7)
 by CY5PR12MB6058.namprd12.prod.outlook.com (2603:10b6:930:2d::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.17; Wed, 3 Dec
 2025 02:14:54 +0000
Received: from SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91]) by SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91%2]) with mapi id 15.20.9366.012; Wed, 3 Dec 2025
 02:14:54 +0000
From: Joel Fernandes <joelagnelf@nvidia.com>
To: John Hubbard <jhubbard@nvidia.com>
CC: Timur Tabi <ttabi@nvidia.com>, "nouveau@lists.freedesktop.org"
 <nouveau@lists.freedesktop.org>, "dakr@kernel.org" <dakr@kernel.org>,
 "lyude@redhat.com" <lyude@redhat.com>, Alexandre Courbot
 <acourbot@nvidia.com>, "rust-for-linux@vger.kernel.org"
 <rust-for-linux@vger.kernel.org>
Subject: Re: [PATCH v2 12/13] gpu: nova-core: add PIO support for loading
 firmware images
Thread-Topic: [PATCH v2 12/13] gpu: nova-core: add PIO support for loading
 firmware images
Thread-Index: AQHcYxwH0+1g9E7F+0GB0PD02zZns7UO3YEAgAAYngCAAAgoAIAABaoAgAACDwCAAA0dAIAAAfqAgAAA9oCAABj0og==
Date: Wed, 3 Dec 2025 02:14:54 +0000
Message-ID: <126CBF5C-01B9-43D7-B4D7-FD32E2D6D9C4@nvidia.com>
References: <20251201233922.27218-1-ttabi@nvidia.com>
 <20251201233922.27218-13-ttabi@nvidia.com>
 <581a1e44-e6a7-4ce1-8254-a92392d80cbd@nvidia.com>
 <aba0e260e8a2909c3c66a1aca07574c9192b0dbd.camel@nvidia.com>
 <cec4c58a-cdfa-4bf9-8d0e-7c47d8232697@nvidia.com>
 <df1e24cf-6983-4d17-8652-15adca8281ea@nvidia.com>
 <44986645d9ecb62887f8d3506533d4ef369af69a.camel@nvidia.com>
 <d94e68d7-84a7-4540-8de8-5f163d22d763@nvidia.com>
 <5f107927d9ee9dcc1ef02fd09f5e2e5ece3f13fa.camel@nvidia.com>
 <2a4a6fd3-05e6-4291-a0e8-65db73ae78e9@nvidia.com>
In-Reply-To: <2a4a6fd3-05e6-4291-a0e8-65db73ae78e9@nvidia.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SN7PR12MB8059:EE_|CY5PR12MB6058:EE_
x-ms-office365-filtering-correlation-id: 26c2c963-5803-4d88-0c6b-08de3211bf73
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|366016|376014|1800799024|38070700021;
x-microsoft-antispam-message-info: =?utf-8?B?Q29vVEJPVmdQaWl6MEtYdTlDMzgwRXhPSmsvTGN3aE5GeWVrandlUFdiZVZ0?=
 =?utf-8?B?M01la0lYeW1SZjRrSzk5cm03dDZISXMyaTJONCtYLzRIY0phNHFkalNWckRq?=
 =?utf-8?B?Si9wWE0zdW1QT1hZTmg2YzhPeFFrQzNkalZ5dzZ6eERCM2hPZGdERzh6STFW?=
 =?utf-8?B?Rjk2OFRSYjMySEdmbk9jalkzY1RiV1BmdFZHelQ0OU9OdlFIS3JMN1k5UU84?=
 =?utf-8?B?bkg5YzhwVlhGVzRVSStRd3phTlptc05VbExUdGFUbG1Ld3JvMk94YkFIb3Bh?=
 =?utf-8?B?VEdzZXU4ZVROcHI0SC93YURNdWZnZWVMK0pXMWZjVDZldk1BVVdUNkxxUXQw?=
 =?utf-8?B?ZjhiakZYa0JkQk9FMWZkcXpQTVBtN0FVZURBME9haS9YWWRrS3dCN09XVkdj?=
 =?utf-8?B?aGxoR0FnVmpNekFjWjc3QUhhT0YzNkFKRm8yWmpJRlltS1ZEQ1dLellhU2t3?=
 =?utf-8?B?alhQY2tqbmpLVExvbWRBcm9sQVVWdDZyS3J6amFTMzBLaG13QzQ5TEFXcmVU?=
 =?utf-8?B?YWNTNmNHeGdUcmdJZEg1YUI4Z2pOdS9hdVNLcFYzQS9jOURISmw0YVpSWks0?=
 =?utf-8?B?UGNNNnhPL1UrdUZSVXMxNzNsOEtqUTZNK0tyTW9VcVA2ZHB1Z1ArOERDU1NQ?=
 =?utf-8?B?UTYyaHM5YXNQdDNyY1ZLVVAzOEcxV2R2NUtrWUxvV25iWGJIRWliMCtvQTZK?=
 =?utf-8?B?YUVjN1hubExuTEN1amY3Qi91WnAvK1kvQkl5MUl2Vkx0QzhNQkFLbGpFdkpz?=
 =?utf-8?B?c2JVYldEaE9DbTBtYUlUYkFyakNBT1BoRVllUVpoWEwxUkNVcDd4bEpESU5G?=
 =?utf-8?B?bThxSUx2L0Y1T0I0aGY0ajgzaEhPQzI5TE1RZnNIMmZzc3Axb1kyYzhUNU5S?=
 =?utf-8?B?RXVaZzJGRWUrL1dIN2NLb3ovNkhGcVpqM1I3L0RMc1VEeW1EQWlQUDN5OTVj?=
 =?utf-8?B?Q1RiUjJmMVgrRXRPajZOOXRGNnQyNGY5ZUQvVFVHNy91RTF4ajJucThyR3Uz?=
 =?utf-8?B?MWJ0WDJDZFpOU0w3L0pZSytjZmRXU1BaOVNwcU1VcXFqcEJtTXAzcVRkVE9t?=
 =?utf-8?B?eDQrdUdYZStMZUtZRE5LU0paZjh1eVpXY2k4bnBHOWhPdW0wdXlRU3ZWUW91?=
 =?utf-8?B?ajRneXBITDdFMzA2bzhTUkVYZGxrSjFIWjZTUlAzY2IyVUFFNFNrWlFHOGZv?=
 =?utf-8?B?ZUY3SUJ6WFIzblEyaVU2ODNHaGJzTG5nYjFuZnIvQyt2N1Q4MkZPckF1WmhP?=
 =?utf-8?B?WDhYSzlhUnhWQ0E1em01UG9hRVpRL0J3cTQrbW5GQ3pTaUFHK29rbm1LV3hU?=
 =?utf-8?B?c1ZXWUNqMTY1QjlhTmJTZGlpWkNTSFprd1NncFp5U3JPOEhzY05iZXA5c0o5?=
 =?utf-8?B?SDMvemZ0WktrRThIL3hBb0JQZTloUVMwYVZUSjdJRStpd2NiMk9rMzU1cWVY?=
 =?utf-8?B?aTNSNS82eHhmTVpteU1WSEJqRVlBVkJ5RmZ5d3lyRjJwTjhIWCt4RFZYVk55?=
 =?utf-8?B?STFxZjdXODBsS0tBRDRvYUNQR0dmNmNLelBBMnN5MTVWelFKQno2NURXQ0lI?=
 =?utf-8?B?Z2hWNHQyaW1Od2orYnlCTnJwTnIzdmR2a0U0dnVTdGk2alBPZjlRbWVCQ0Jv?=
 =?utf-8?B?SmRxaHRRYko2dmExSDRraExvQ29ETU1rWU5VU2NMazN0WTd4SC9oaHlPUjFY?=
 =?utf-8?B?RWRUNDVHVlhyK3dVOGpweklSRjF2SVJYWVhZWDM2WExXVHFxeEpSUXpzODZa?=
 =?utf-8?B?ZkJtNXdodW9pZ2NwY0RYUUY4dFhUWGlxcFBlbWtHVkl0WDdseWt1c2xCa0NW?=
 =?utf-8?B?RzAxZi9VTEFHTk5MY3ZXN3gvWkp1dUk3ZVlZRVdXQXZSQ2x2QnNVRjMxVjZ6?=
 =?utf-8?B?QWF2UVJVNVFPakE1dDN4amtVdWw0OE04U2VWNVhvc1JBYllTd2lqcmcvM3ov?=
 =?utf-8?B?T1JnYUZWcXIybElSRnFIMnl4S1daeUpyenlraC9VRXhVbWt0azR6TlMzMTdE?=
 =?utf-8?B?eEFxblFPSy9IZHhhaW1PNlpzVW9PQ2ozTlNNUG9KS1llZm0xWkI5cHVQbDZr?=
 =?utf-8?Q?tou+U9?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR12MB8059.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(38070700021); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ejBnN2p6bUUxdS9YeFB4ZjNkeTZiSTBIZlVaaEdTQldlT3pTQXpvMCs5WDVS?=
 =?utf-8?B?NENXWVl0NS83Wk5DVmZjT1BFdlR4bkZxVlhWNkZrQUJOUmhTS2lsaDYveFpm?=
 =?utf-8?B?UklHTXJiM0tjMU52QVVXSXpoUVViZDhabTcvaXhPQWtaTEdqWWZrNnQxRjNY?=
 =?utf-8?B?SS9QV2lNZkNYdDFHNnVkbElZRjVVVkZNSVBHYVlUcVZmSFBGL0dSYkpaaUpp?=
 =?utf-8?B?UzlVc2YwNjhLVUdBdWZleUNNbnBBRW8ySXVsT2VtVHplMitVRVRoTjQwdGZ2?=
 =?utf-8?B?YXhGNFkwcWlnQ0xJYW1aS3pkRkVKa3lnNkVpclN1RmNKaVY3a2VGS0QrTXNG?=
 =?utf-8?B?UlZ1c2dYekFMcituWjR0TktFU2xiQ0xQR0VzY2pWVHdlRXBHdGV2bnhWYmQ1?=
 =?utf-8?B?ZWZpVm1wWjlxaVQxRGdMNXZrb0I0WSt3bnpxRG40WmptUng3dnhZWk9WTHR5?=
 =?utf-8?B?ZVgxSVNadG9MREgza1pYVVlpTkd3OEgrRnNEcEY5QTYxY2RPY0VDRi9MVDhH?=
 =?utf-8?B?NzZmby9xeVVoYVhVbWlIaWNFbWhPd3NpeTAzTFpkN2dsNDNET2hmam9YZThj?=
 =?utf-8?B?d3dMREQvdHlHNUVDa01TZUsvNVBPenFxMitaM3hPUUtBQVd3ZFpLbmdYS3Iv?=
 =?utf-8?B?V2hUUVk4b1p3dmdpbmJXbCtJYW9SejZLWklscE9TWUdDQzBsZ2RXR2pMS1pO?=
 =?utf-8?B?YVhqclZieUpWVEJ1eUVpOUJaTWpSRllsZmdteDNTQ0hIdGhZYUJkOFlVaW1u?=
 =?utf-8?B?VXAyeWZUVDhqQi9MdDZYZDhIZGhYQnBqRzA1SHFuY241Ti9hUXRtY0c0WW10?=
 =?utf-8?B?a3hQUlRZMmpuWi83U2dSK1FZTEZxNWMrU09qWDA0V3pXYkVPNWNBM2dma09p?=
 =?utf-8?B?eWlXRW1hb3ZMNlduVzA2dnNRSk50bG1uK1Ivb1Q1ZE5tRWtxV0hBcTg5NzRp?=
 =?utf-8?B?TDJzNWdSelpId0ZLYlVOV2QrWlFTaTM1eHg3dy80cjllYmdleldJQmpLYkcr?=
 =?utf-8?B?aVBLNkNvNGlQa0thUDZFSS8yVUR1TEFRSTlXTWg5RVZvSFpsSVE1M3J5T1ds?=
 =?utf-8?B?MUlaRDZMZW5qcFp1WmFMdnYyVWVDd0tscEpkd1BLem81VUZ0NTQxQTYxdlVE?=
 =?utf-8?B?WnQyRWxrbHFETTBudHdSQS9JSk5lNGxGQVhHYjFGeE00cVJROXFuRkRRSUlm?=
 =?utf-8?B?eFFtaHIvYlBtNjg5cVl5YW1TOWtCQy95ZjdDYy9wTWtVVjB6R05ZTzhHU0ky?=
 =?utf-8?B?d3NQZlhvN3RtOHlYUGV0U0Y1SzV2K0o1NXpUS2NSb216WUpVVHVUY1E2OXVV?=
 =?utf-8?B?MVorOXZRbE1PMXlDa28reGNENEFRVFhPQUhBUzBLeGtUZmxGdjVEeDNyZFk4?=
 =?utf-8?B?b2txQ0dKSkJxalJCYW9HUU9VTFdSMUZJMkxwWmtuU3VZayswVk11SU9QSEla?=
 =?utf-8?B?dy9qbHlaVUZQbHdtUEVlc0JzdmlycVcrdERURUtXcDViLzJXU2ozSzhTN08v?=
 =?utf-8?B?WlBaVzZhT1Zoa3FKenRaVGVCREczZ3ZMMUhablV3d0Q1NU5zQXhOektXWlRH?=
 =?utf-8?B?eVFyYlJraFEzSHg1V09ITmpFZjRiYW1jZHNiL3dOYVZsZ2VGOUxyUVFISFEr?=
 =?utf-8?B?V25jdHFMVHRZUnV6dHl6NVo1b0JhMVNhbXJPWlBKTG54T01ZYlgvb1J4R2Jy?=
 =?utf-8?B?MU16aHZsTjV6dVl6cmwvUTZEa2cxRWcvT1R3YTJCNFhIT2hOSGVoV3BFR29s?=
 =?utf-8?B?WXdGSi9KSUtNM3RyTm5oU2UzdW1ldHpXc0Y2VGxxa1dxaWNNQzFCQzg0QUtF?=
 =?utf-8?B?Y3hrQXJ5Qm5VWHVRbDUrZDBFWlNxeGhJR0RrS3hoL1JtWU9XTitjc2tSRmdG?=
 =?utf-8?B?NEt2cDlTNVhuZU1PcDk0Q1RUU3F5NDJObnRyeFQ1dFRjSU1VVTBmL2NTVlFS?=
 =?utf-8?B?TlNKRUVJTlpxSUZNdEJYN0xUUUdPbTlEU0lnQ0V2bGpPRVZqMEp3aVBLcXcv?=
 =?utf-8?B?L1R0MFg2aXF3L3o2VW1RaEUrbXlGWVpkSlNlM29pRTZUa3ZrbjloQUhONzZq?=
 =?utf-8?B?TTdKTm5vNXplMzczT3g4NzBTMFhhcTczV0p1UlRVYXozQmVMZ1d5YzZCdFF5?=
 =?utf-8?Q?1qpa5ZNd5H8qanTBIIaCgrmk1?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN7PR12MB8059.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 26c2c963-5803-4d88-0c6b-08de3211bf73
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Dec 2025 02:14:54.0725 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Yeb651PpzjZ76AzAaX2hX5zw1bhbpNj97xcaHsHuX4ziO8QDbSawb6TayHjLsS5WAVH+xAhk/ChAolcci+/20Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6058
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

DQoNCj4gT24gRGVjIDIsIDIwMjUsIGF0IDc6NDbigK9QTSwgSm9obiBIdWJiYXJkIDxqaHViYmFy
ZEBudmlkaWEuY29tPiB3cm90ZToNCj4gDQo+IO+7v09uIDEyLzIvMjUgNDo0MiBQTSwgVGltdXIg
VGFiaSB3cm90ZToNCj4+PiBPbiBUdWUsIDIwMjUtMTItMDIgYXQgMTY6MzUgLTA4MDAsIEpvaG4g
SHViYmFyZCB3cm90ZToNCj4+PiAgICAgICAgIGZvciBjaHVuayBpbiBkYXRhLmNodW5rc19leGFj
dCg0KSB7DQo+Pj4gICAgICAgICAgICAgLy8gUEFOSUM6IGBjaHVua3NfZXhhY3QoNClgIGd1YXJh
bnRlZXMgZWFjaCBjaHVuayBpcyBleGFjdGx5IDQgYnl0ZXMuDQo+Pj4gICAgICAgICAgICAgbGV0
IHdvcmQgPSB1MzI6OmZyb21fbGVfYnl0ZXMoY2h1bmsudHJ5X2ludG8oKS51bndyYXAoKSk7DQo+
Pj4gICAgICAgICAgICAgcmVnczo6TlZfUEZBTENPTl9GQUxDT05fRU1FTV9EQVRBOjpkZWZhdWx0
KCkNCj4+PiAgICAgICAgICAgICAgICAgLnNldF9kYXRhKHdvcmQpDQo+Pj4gICAgICAgICAgICAg
ICAgIC53cml0ZShiYXIsICZGc3A6OklEKTsNCj4+PiAgICAgICAgIH0NCj4+PiANCj4+PiAuLi5i
dXQgYWN0dWFsbHksIEkgdGhpbmsgeW91ciB3YXkgaXMgYmV0dGVyLCBiZWNhdXNlIHlvdSBkb24n
dCBoYXZlDQo+Pj4ganVzdCBqdXN0aWZ5IGFuIC51bndyYXAoKS4NCj4+PiANCj4+PiBXaGF0IGRv
IHlvdSB0aGluaz8NCj4+IA0KPj4gSSBhZ3JlZS4gIEF2b2lkaW5nIHVud3JhcCgpLCBldmVuIHdp
dGggYSBjb21tZW50LCBpcyBhbHdheXMgYSBnb29kIGlkZWEuDQo+PiANCj4+PiBJIGZpZ3VyZWQg
eW91J2QgZW5qb3kgdGhpcywgY29taW5nIGFzIGl0IGRvZXMganVzdCBvbmUgZW1haWwgYWZ0ZXIg
SQ0KPj4+IHdyb3RlICJuZXZlciAudW53cmFwKCkiLiBoYWhhIDopDQo+PiANCj4+IEkgdGhpbmsg
eW91ciBjb2RlIGlzIGVmZmVjdGl2ZWx5IGlkZW50aWNhbCB0byBtaW5lLCBleGNlcHQgdGhhdCBJ
IGRvbid0IG5lZWQgdGhlIFBBTklDIGNvbW1lbnQuICBJDQo+IA0KPiBZZXMuIEknbSBjaGFuZ2lu
ZyBteSBjb2RlIG92ZXIgdG8gdGhlIG5vbi11bndyYXAgYXBwcm9hY2ggbm93LiBUaGF0DQo+IHJl
YWxseSBpcyBjbGVhcmx5IGJldHRlci4NCj4gDQo+IA0KPj4gc3VzcGVjdCB0aGF0IGluIGJvdGgg
Y2FzZXMsIHRoZSBjb21waWxlciBjYW5ub3QgdGVsbCB0aGF0IGVhY2ggY2h1bmsgaXMgYWx3YXlz
IDQgYnl0ZXMgYW5kDQo+PiB0cnlfaW50bygpIHdpbGwgbmV2ZXIgcGFuaWMuICBJbiBteSBjYXNl
LCB3b3JkWzNdIGFsd2F5cyBleGlzdHMgYW5kIHdpbGwgbmV2ZXIgcGFuaWMgZWl0aGVyLiAgU28g
SSdtDQo+PiBndWVzcyB0aGF0IHRoZSBjb21waWxlciB3aWxsIHN0aWxsIGVtaXQgY29kZSB0byBj
aGVjayBmb3IgcGFuaWMuICBJIGRvbid0IGtub3cuDQo+PiANCj4gDQo+IEdvb2QgcXVlc3Rpb24u
IE1heWJlIHNvbWVvbmUgd2l0aCBSdXN0IGV4cGVyaWVuY2UgY2FuIGVubGlnaHRlbiB1cyBvbg0K
PiB0aGF0IG9uZS4NCg0KSWYgdGhlIG9wdGltaXplciBjb3VsZCBub3QgZWxpbWluYXRlIHRoZSBk
ZWFkIGNvZGUsIElNTyB0aGF0IGlzIGEgYnVnLCBwcmV0dHkgbXVjaCBsaWtlIGhvdyB3ZSByZWx5
IG9uIGRlYWQgY29kZSBlbGltaW5hdGlvbiBvcHRpbWl6YXRpb24gZm9yIGJ1aWxkX2Fzc2VydC4N
Cg0KSXQgaXMgd29ydGggY29tcGlsaW5nIGFuZCBjaGVja2luZyBidXQgSSBhbSBhbG1vc3QgY2Vy
dGFpbiB0aGUgZGVhZCBjb2RlIGZvciBhbiB1bnJlYWNoYWJsZSBjYXNlIChpbiB0aGlzIGNhc2Us
IHBhbmlja2luZywgd2lsbCBiZSBlbGltaW5hdGVkKS4NCg0KVGhhbmtzLg==
