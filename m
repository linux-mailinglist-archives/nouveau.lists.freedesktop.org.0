Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F0FE9A2E11
	for <lists+nouveau@lfdr.de>; Thu, 17 Oct 2024 21:50:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8CDC810E215;
	Thu, 17 Oct 2024 19:50:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="FAgqYwwa";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam02on2072.outbound.protection.outlook.com [40.107.212.72])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4FA8F10E215
 for <nouveau@lists.freedesktop.org>; Thu, 17 Oct 2024 19:50:29 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Xu1p4gJGs8QEqjspGds3gYj7CK2OQFhIbeaiUvDjHLown2Uvo8Ld7G1Ws5GNoV93L4uGPu4GgSuvJ2Pqh02cArQG5APUI8AlM2FJBm12U7eTMxXp6+2o3V7dHT0TDiC7YNgmCan9esw1ElopGEvw69tSTul85orE9vraPLntImI2a4Gbl+XPFNP5m0mG7sw+zq8ZcZhPynNSEpy/69gUAedzOIF9own+FjPnvKCMT2KgC2mLjDmaXSdplWPT3qEagviGHMNSiaW2RDDJ0CKKqeLOsLdOWaCBxdB66hNH+z5DBLsZJcyz8zyEOC5RwMp4MGf07iS8lRchKOSu8KOL3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wq6lSI/jYH/Wv4pMYRkV9LI2RKMazeSihxcGg4GHnYA=;
 b=Q8IZ14MsMqa/V8Kqyj/vnRTiPIpWdPJ8c3keOr4U/Zu86/3+Iod+uAs9voPziY4e46WH3HasAX7ePSrgFFCabiA72wg6FOKv1ENBYogITNuGMcsyqVepVAt1rsljDuWM4ioGNNRAE2XtkjGunSdXbCpRGLpubOWVBPbcQ3odFPDe/ORjpzMpMxBxRJ7grnPoW3OHUSQyQ1u6mafn8BO8pSBNHhKRpo/2Id4MerTtGqDOE+qENusGm8FsV/X5A6vpdAbLFo0+JKYwaCJChz5VCvQhyb0yh8HP10q0sS2ONwvwFZDQePsUkw2cEiwtvan/Kk5nQ8NZCG79SNdVzmwpmQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wq6lSI/jYH/Wv4pMYRkV9LI2RKMazeSihxcGg4GHnYA=;
 b=FAgqYwwaF+Fil3p+KJFRp6B7BQMsAC2Craz8yJZYVT1aF5jUYQQ5bkLhS4S4DInYU+UH+zDCNmd3LQrbo2UWXL0C8wxu9RMFIi4QT9l/fEC7Ig3eL1NvMWDtsyPO91NtlM6ON/p2owMKoRcRDsiTcXX46pTbkzumXFrU0QjFUvoXmRwtvjSzjdYvQkEoiDbXHfMDBjv2ClimtlhMO+LpGYmSEsNT0mvGsrPqqSbI1f7kS+9yVOBbuSuEoGPnrz9/0WeWAhNYJ0dnSyGmbIOwXu18sr44KKcQmUPfvh3A/E0wgw5aVjb1DSSuMrvxMR6naEg9JAnn9E5CNv0WTh3Tgw==
Received: from SA1PR12MB6870.namprd12.prod.outlook.com (2603:10b6:806:25e::22)
 by SA3PR12MB7859.namprd12.prod.outlook.com (2603:10b6:806:305::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8069.17; Thu, 17 Oct
 2024 19:50:24 +0000
Received: from SA1PR12MB6870.namprd12.prod.outlook.com
 ([fe80::8e11:7d4b:f9ae:911a]) by SA1PR12MB6870.namprd12.prod.outlook.com
 ([fe80::8e11:7d4b:f9ae:911a%4]) with mapi id 15.20.8048.017; Thu, 17 Oct 2024
 19:50:24 +0000
From: Zhi Wang <zhiw@nvidia.com>
To: Danilo Krummrich <dakr@kernel.org>
CC: "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>,
 "airlied@gmail.com" <airlied@gmail.com>, "daniel@ffwll.ch" <daniel@ffwll.ch>, 
 Ben Skeggs <bskeggs@nvidia.com>, Andy Currid <ACurrid@nvidia.com>, Neo Jia
 <cjia@nvidia.com>, Surath Mitra <smitra@nvidia.com>, Ankit Agrawal
 <ankita@nvidia.com>, Aniket Agashe <aniketa@nvidia.com>, Kirti Wankhede
 <kwankhede@nvidia.com>, "Tarun Gupta (SW-GPU)" <targupta@nvidia.com>,
 "zhiwang@kernel.org" <zhiwang@kernel.org>
Subject: Re: [PATCH 3/3] nvkm: handle the return of large RPC
Thread-Topic: [PATCH 3/3] nvkm: handle the return of large RPC
Thread-Index: AQHbIGTy7XEkoMZrmk+zAXj9aLfjlbKKzsUAgACMDQA=
Date: Thu, 17 Oct 2024 19:50:24 +0000
Message-ID: <02190350-b006-4ead-af11-8eb69b3f3ca2@nvidia.com>
References: <20241017071922.2518724-1-zhiw@nvidia.com>
 <20241017071922.2518724-4-zhiw@nvidia.com> <ZxD1BBUUeLQdvXVX@pollux>
In-Reply-To: <ZxD1BBUUeLQdvXVX@pollux>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SA1PR12MB6870:EE_|SA3PR12MB7859:EE_
x-ms-office365-filtering-correlation-id: 2eb6eb36-99fc-48c4-1359-08dceee4f0fd
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?bWpTVEYwQU00ZmdZdDVpejVaSzJMWjVIYS9FeGpVWkMraW03eENrRmtQUDVP?=
 =?utf-8?B?ZWNPSFh5MGtjMWU5bWZTeDJoVlVDQlJ3eUI4VU5DMWNQdEFMcmlCZzRzVXFY?=
 =?utf-8?B?RWs5NEZGRGlMWUQ0bzFnUHU3SFpNRlVaUVBhaERhQWxuREVGUDJUZWp3OXVV?=
 =?utf-8?B?V2lCUFpsdWJPNE9kaERIRlNVZDd1UFd2aXBpNXZ1SncyWm40OGRUMUhka0tY?=
 =?utf-8?B?eGVpTjlOeHJQVVl3WHo3b0NqcHlzcU5IU3c4a3NocDM5R0ZPTkxMWWFFT2M3?=
 =?utf-8?B?K2Z1ZGFCNUpqMzZ6N01lOTYwQUxtTHZUa2dhaXpGUVJJa25nNDB3RXJIRDh4?=
 =?utf-8?B?d1dCbm5QR2hHN0lFTlhEeHBROG5IY3JFNTdNMTlGaHA4c2gxUGQ1L1pFVTF4?=
 =?utf-8?B?VUdqZGttM21oUGV5ZlpYWVI2TkJZZFNmMWlFODRtV0FZOTJDLzVEWmRSTWh3?=
 =?utf-8?B?WXNmaGd5LzJ6d00xU2dySmhETy9Ld1dvTVZQQmpBeXFVV3c4dGozaWhQYnZH?=
 =?utf-8?B?M0QrK0o1MndEMVJzc3ZaYll6UUtFNHhQOEZwU2pMODdiMFd1dU10anoxdjFL?=
 =?utf-8?B?Ym5jVVhsVnM4OCt0elV2emNDUHVYZXE5MWpJVzEwcXM3UnUwZGhtY1R3dWJ6?=
 =?utf-8?B?Nnl4MGFQc2NrTkV6MHlYczkvUmtXc3FlN2wxaHRESzhLcE5ST1NKU3N0bURu?=
 =?utf-8?B?NS81dzFhOHZJV2w5bWFybEhSZ0VDWS8zYzN0NExrYmNZN0JTQXIvenBBdjE3?=
 =?utf-8?B?NVRJdStLc1YrUG9MSVRFMFZYdkRXblhXbllNdDFJQ1FNSE9RdXVENE5EeldM?=
 =?utf-8?B?aFFndm5EUndpY25INmdhWmgvVHdDc1IzT2l2bFpzV1BvTjYvam5tY3ZVRUNQ?=
 =?utf-8?B?cW5mNzBwK2tGQ2E1SEJUSFZZMFhRRXZ5QXN5SUwvRjU0cTlJRm1QbVRIdndz?=
 =?utf-8?B?TEs2aHYwODJyY0xhR3pjaHNmQXRrd2N0T3E4c0w3UTNmWE5uL0xnbDFieHpx?=
 =?utf-8?B?ZWpPeE8rT2ZUVkpzOWpocHNZZDBMTmpiZWg4M2tlWW93Vlo1R3U1REhVbmJv?=
 =?utf-8?B?bTVkZyt4ckYzS3J6QjZKNVdsU0VnMHBNdnhBQjFkaithVzlNYUs5TElUQy8y?=
 =?utf-8?B?TmZHc2lLcnFhb3IwU296enkrYXJ5Qzd1ZDhNaEZwbEtWVjhxdUZQYlJyUjNw?=
 =?utf-8?B?QUFKY1lLVmxzT2RCTU1JN3FMT29yMU9jUWVaLysvY2JrUXc0MC9XcHhQYUhw?=
 =?utf-8?B?c0xSNklGdy9Tb2ZTamxoMTluZTlXN1QyRzVFUXh0RVlINU9KMWk1Qjl4VWU0?=
 =?utf-8?B?OURUWmU4Tjk3VWdKdFo3Q1RISkp6QW44Vms0elZ1UFlkVDErMDRjU3JsQ095?=
 =?utf-8?B?YWZRUnVFdUlsVFA3UXdKRlp5T2NEdDJBT1pmdnBtcnhNejk1bGFPVjRwa2Yw?=
 =?utf-8?B?OElDaW4wSVRiMkZyaWlqc004Qjl3WVNsUzdUREFKMGlkcG1zSEszSDdqQmxH?=
 =?utf-8?B?anlsV0I4UklPWmVmbzJHMWVSbkg3c3lVYkpCRm9qQ20wam15clpoMVQ0UWhS?=
 =?utf-8?B?eDRYcVpRSlRhaEczMnorczFvcjdRd083anRibjRrcitoL2NjcDZoWHV1ZU1m?=
 =?utf-8?B?U0hoYjlGdjUzdy9DRTVvek14SVVQbzZjRjdQYmFOdG9KT1JlRzFZYkRrbkNs?=
 =?utf-8?B?UlhzQzZyYlpVemg5RGlIYmNLb0ZDbkFCYWFXYmQ5c0JQZEdSWStncnBoNURK?=
 =?utf-8?B?KzZnaDZ4WGFQTEVoZi9yaWlwVThaMTZ2bnpKWWt2NVZ1RzNwV2NYSElROE5Q?=
 =?utf-8?B?cWxnRDdlZmV2OGRTd1hEY2JDR1R3bkQvYzZwYXlhMzZpajN3SVdORS9hWXpH?=
 =?utf-8?Q?38eqLFN8O1hhw?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA1PR12MB6870.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?NysybDVYbFZyRmxnMU40c2Y5Rm0wMTBvZlUveGZWK2ZZbitLVlFiWmg3VGk4?=
 =?utf-8?B?Vi9BMWdEd0s5RVkwUlFsQTV0bTNDRkI0SkRxMmg3emlOOUV1R21TcWJoZGZL?=
 =?utf-8?B?QTZBOGRTR3hDR2JlUE1BU1ZmMks4THlXRU9Sa3pSWk05N1RQMkNCeU8yRFFz?=
 =?utf-8?B?TGxTWCt2RkNobUpBSFpDSElHV0ZENFo5dzQ5clJnUFBRdzhRSlhOU3RoLzF2?=
 =?utf-8?B?cTg3bW01eUtwRWZMYnlhWEFIcmx2WXh1WUJOZFA1N0thM0N6eGxVK0E1L2x0?=
 =?utf-8?B?ak5tMk5xRnVYUy9hc1NiMjhwU1NLYWNoeU1LT1Y4dVJOYjU2NjdwdFpmbkti?=
 =?utf-8?B?Qnd2NnZWbzFPY0UvOGxUQTFVV0VjWW9XdnVNODIzQkxGaEZ3cXo0OWlwRWZB?=
 =?utf-8?B?L09HTkFGaFZOc2VPL0Q5NFFSUHV0Y0FiSXhQMkdqMU1OSkJ2S3ROV3puVXZv?=
 =?utf-8?B?SWp6S010Sk80cFppV3lSV0YxNVdOdXQ2UmJJc0djV2pOcS9tRDE5bEZ3WC9x?=
 =?utf-8?B?UjRybVBHM3ZPSmIrVXhKR1MweVFyWmJpOUdadUp6bUd2ZmxvLzUyRXVGMThH?=
 =?utf-8?B?bXZvZURaZVRYUGtjaUcxUVh2L29EaU1NbmRIVWRRUlVxNFBNM29jbEppVjZx?=
 =?utf-8?B?MTFUelVNeUcwL2xHdUQrOHhUcWFOZmVYQmpjRjRIRGxRR0lhYmhxd0dmK3Ey?=
 =?utf-8?B?SXRZb1BHSlJNVTNpdVcva1A0OWszYTdZODBFU21XQmNxbFp2Qm02VVU1OGVO?=
 =?utf-8?B?ZzhxTGxUZHFJQThmZEFrZTJRaHhLU0dSWlN6SUd1TlNvRUtrVGNJUUROQ3Vq?=
 =?utf-8?B?SE9XemlUWEFHVkIrR3R2WGt4Snc0TVFxYkVLQ2J3bGZ4ZnN6RjVwcUh5b2pQ?=
 =?utf-8?B?bmZrdit0dE5rTHZ1QWdPcVluTnltN3BxSDN6S0RSVjJYK3dTT1BXUHh5aHFr?=
 =?utf-8?B?L3RnRlV5QXdEaEZMWCtST1Q4S0gvSFA1cmlvYUh6T2haWjNzWEN4ditoV2ha?=
 =?utf-8?B?ay9lZHB3M1I5MUE1QUc5RG1YSU5EcDhQelAyV2xic1BmSlQrYy81RUFEZGlB?=
 =?utf-8?B?WVl0bHd6RDVWNGJueHZMTnlkeEc5bTNhdUUyTHZ6ZXI0SzhyWTQ3Y3p1VVBm?=
 =?utf-8?B?WVlkUnBDdnkwakgvMGJ2elR6cUpNOXBiSjJlRFYxVDN3NXBaZVQ0V01NZmRn?=
 =?utf-8?B?QmxwNGhRemhBalJGQ2toNmFiN3EwOThIb2RQQlYxd0RqNXk1SUZWTXJJaWNs?=
 =?utf-8?B?U0JtbHM1amRQaFNWQ1RBNDdWbzZyVGxHRGMyZ0ZOSkh4MkRhRDJjeWZrZEY5?=
 =?utf-8?B?VXRuaFE1VndNQVp4MGNTQTUzVHRSSy9lNFJKT0xjcnRqSVJ4QVlKZGV1TWo1?=
 =?utf-8?B?c0U4VzZ6TjRKemNFVU9IbEx4c3BoZkV2S0tMckoxN1ljamxyRlQ2dWZBdGht?=
 =?utf-8?B?czljUjJaMGRHNVd2Q2tTMk1jaGYvKzN3WjBTejdaT0lZZzZnT2VabUFRbFpY?=
 =?utf-8?B?REZOZi9TYkRYbEhzN0NPQlpLVUFkaUVQd3lJdHpHRFVMNkdxcGlNZnJpb3Yz?=
 =?utf-8?B?dU5QOENJMklvKzNlYXovUTEvSXpmK3FsQm1neERUM0o0RnIzbldqNEEvcUFV?=
 =?utf-8?B?NFVUZVBBK2hMLzYwblBmMzV3SVRFdzRIR3JKeGd5MzJtVE5PdlZNUFFaVXg4?=
 =?utf-8?B?VkJQNHhnUHlJc0MxNUlvajVHNm50ckVQOGx0T00wMTBGdzFzUGowWnVkY1k3?=
 =?utf-8?B?V3JuUlNDc0NpK3pLUXJFQ2NsQU1URm16WEdjZUs5UW5UdFd1Ukh3WTZXK3ds?=
 =?utf-8?B?SmN3bEF3aUpwVU9oZ3pKUnloWmhwODd3ZG5nblE3MjZpMG1OR0RLYktlM1FZ?=
 =?utf-8?B?ajQ1Um5aRG96U3dhRGNZc3NHb3BGVElJNG80am1HWFpueWo1anh3MFR5MTlE?=
 =?utf-8?B?ODdveXlFRFp2b0Q5blg5L2pWSFFQR25qZVpUazd4NTV4dXhFeS9nS0FhUHEr?=
 =?utf-8?B?RFplWG12VzBjbk01VUFtZnE5cEN0Q2Q2UUdrT0N3ZmZSeHdkRTFQZjdmMmp2?=
 =?utf-8?B?aGQ0V2J1TzFTYzB0ODJIcU9IVldXbE5CWkx4SjlXNi9TQjVqeFMrOTAyVnJ0?=
 =?utf-8?Q?olIo=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <06D4949290D0714C9A7DAAB0FE8AB164@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA1PR12MB6870.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2eb6eb36-99fc-48c4-1359-08dceee4f0fd
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Oct 2024 19:50:24.2573 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: V/A2Yw1GKXXkWn9XQfRqVkGBMMh895t3L9u6WnLfMqONRATridM0Hnqst+7UjkZ/
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB7859
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

T24gMTcvMTAvMjAyNCAxNC4yOSwgRGFuaWxvIEtydW1tcmljaCB3cm90ZToNCj4gRXh0ZXJuYWwg
ZW1haWw6IFVzZSBjYXV0aW9uIG9wZW5pbmcgbGlua3Mgb3IgYXR0YWNobWVudHMNCj4gDQo+IA0K
DQpIaSBEYW5pbG86DQoNClRoYW5rcyBmb3IgdGhlIHJlcGx5LiBTZWUgbXkgY29tbWVudHMgYmVs
b3cuIElmIHRoZXJlIGlzIG5vIG1vcmUgY29tbWVudCANCm9uIFBBVENIIDEvMiwgSSB3b3VsZCBs
aWtlIHRvIHNlbmQgYSBzZXBlcmF0ZSBzZXJpZXMgZm9yIGxhcmdlIFJQQyANCnN1cHBvcnQgaW4g
bXNncSAoUEFUQ0ggMykgaW4gdGhlIG5leHQgc3Bpbi4NCg0KPiBPbiBUaHUsIE9jdCAxNywgMjAy
NCBhdCAxMjoxOToyMkFNIC0wNzAwLCBaaGkgV2FuZyB3cm90ZToNCj4+IFRoZSBtYXggUlBDIHNp
emUgaXMgMTYgcGFnZXMgKGluY2x1ZGluZyB0aGUgUlBDIGhlYWRlcikuIFRvIHNlbmQgYW4gUlBD
DQo+PiBsYXJnZXIgdGhhbiAxNiBwYWdlcywgbnZrbSBzaG91bGQgc3BsaXQgaXQgaW50byBtdWx0
aXBsZSBSUENzIGFuZCBzZW5kDQo+PiBpdCBhY2NvcmRpbmdseS4gVGhlIGZpcnN0IG9mIHRoZSBz
cGxpdCBSUENzIGhhcyB0aGUgZXhwZWN0ZWQgZnVuY3Rpb24NCj4+IG51bWJlciwgd2hpbGUgdGhl
IHJlc3Qgb2YgdGhlIHNwbGl0IFJQQ3MgYXJlIHNlbnQgd2l0aCBmdW5jdGlvbiBudW1iZXINCj4+
IGFzIE5WX1ZHUFVfTVNHX0ZVTkNUSU9OX0NPTlRJTlVBVElPTl9SRUNPUkQuIEdTUCB3aWxsIGNv
bnN1bWUgdGhlIHNwbGl0DQo+PiBSUENzIGZyb20gdGhlIGNtZHEgYW5kIGFsd2F5cyB3cml0ZSB0
aGUgcmVzdWx0IGJhY2sgdG8gdGhlIG1zZ3EuIFRoZQ0KPj4gcmVzdWx0IGlzIGFsc28gZm9ybWVk
IGFzIHNwbGl0IFJQQ3MuDQo+Pg0KPj4gSG93ZXZlciwgTlZLTSBpcyBhYmxlIHRvIHNlbmQgc3Bs
aXQgUlBDIHdoZW4gZGVhbGluZyB3aXRoIGxhcmdlIFJQQ3MsDQo+PiBidXQgdG90YWxseSBub3Qg
YXdhcmUgb2YgaGFuZGxpbmcgdGhlIHJldHVybiBvZiB0aGUgbGFyZ2UgUlBDcywgd2hpY2gNCj4+
IGFyZSB0aGUgc3BsaXQgUlBDIGluIHRoZSBtc2dxLiBUaHVzLCBpdCBrZWVwcyBkdW1waW5nIHRo
ZSB1bmtub3duIFJQQw0KPj4gbWVzc2FnZXMgZnJvbSBtc2dxLCB3aGljaCBpcyBhY3R1YWxseSBD
T05USU5VQVRJT05fUkVDT1JEIG1lc3NhZ2UsDQo+PiBkaXNjYXJkIHRoZW0gdW5leHBlY3RseS4g
VGh1cywgdGhlIGNhbGxlciB3aWxsIG5vdCBiZSBhYmxlIHRvIGNvbnN1bWUNCj4+IHRoZSByZXN1
bHQgZnJvbSBHU1AuDQo+Pg0KPj4gSW50cm9kdWNlIHRoZSBoYW5kbGluZyBvZiBzcGxpdCBSUENz
IG9uIHRoZSBtc2dxIHBhdGguIFNsaWdodGx5DQo+PiByZS1mYWN0b3IgdGhlIGxvdy1sZXZlbCBw
YXJ0IG9mIHJlY2VpdmluZyBSUENzIGZyb20gdGhlIG1zZ3EsIFJQQw0KPj4gdmVoaWNsZSBoYW5k
bGluZyB0byBtZXJnZSB0aGUgc3BsaXQgUlBDcyBiYWNrIGludG8gYSBsYXJnZSBSUEMgYmVmb3Jl
DQo+PiBoYW5kbGluZyBpdCB0byB0aGUgdXBwZXIgbGV2ZWwuIFRodXMsIHRoZSB1cHBlci1sZXZl
bCBvZiBSUEMgQVBJcyBkb24ndA0KPj4gbmVlZCB0byBiZSBoZWF2aWx5IGNoYW5nZWQuDQo+Pg0K
Pj4gU2lnbmVkLW9mZi1ieTogWmhpIFdhbmcgPHpoaXdAbnZpZGlhLmNvbT4NCj4+IC0tLQ0KPj4g
ICAuLi4vZ3B1L2RybS9ub3V2ZWF1L252a20vc3ViZGV2L2dzcC9yNTM1LmMgICAgfCAyMzcgKysr
KysrKysrKysrKy0tLS0tDQo+PiAgIDEgZmlsZSBjaGFuZ2VkLCAxNzcgaW5zZXJ0aW9ucygrKSwg
NjAgZGVsZXRpb25zKC0pDQo+Pg0KPj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9ub3V2
ZWF1L252a20vc3ViZGV2L2dzcC9yNTM1LmMgYi9kcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9udmtt
L3N1YmRldi9nc3AvcjUzNS5jDQo+PiBpbmRleCA1MGFlNTYwMTMzNDQuLjljNDIyNjQ0YzllNyAx
MDA2NDQNCj4+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L252a20vc3ViZGV2L2dzcC9y
NTM1LmMNCj4+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L252a20vc3ViZGV2L2dzcC9y
NTM1LmMNCj4+IEBAIC03Miw2ICs3MiwyMSBAQCBzdHJ1Y3QgcjUzNV9nc3BfbXNnIHsNCj4+DQo+
PiAgICNkZWZpbmUgR1NQX01TR19IRFJfU0laRSBvZmZzZXRvZihzdHJ1Y3QgcjUzNV9nc3BfbXNn
LCBkYXRhKQ0KPj4NCj4+ICtzdHJ1Y3QgbnZmd19nc3BfcnBjIHsNCj4+ICsgICAgIHUzMiBoZWFk
ZXJfdmVyc2lvbjsNCj4+ICsgICAgIHUzMiBzaWduYXR1cmU7DQo+PiArICAgICB1MzIgbGVuZ3Ro
Ow0KPj4gKyAgICAgdTMyIGZ1bmN0aW9uOw0KPj4gKyAgICAgdTMyIHJwY19yZXN1bHQ7DQo+PiAr
ICAgICB1MzIgcnBjX3Jlc3VsdF9wcml2YXRlOw0KPj4gKyAgICAgdTMyIHNlcXVlbmNlOw0KPj4g
KyAgICAgdW5pb24gew0KPj4gKyAgICAgICAgICAgICB1MzIgc3BhcmU7DQo+PiArICAgICAgICAg
ICAgIHUzMiBjcHVSbUdmaWQ7DQo+PiArICAgICB9Ow0KPj4gKyAgICAgdTggIGRhdGFbXTsNCj4+
ICt9Ow0KPj4gKw0KPj4gICBzdGF0aWMgaW50DQo+PiAgIHI1MzVfcnBjX3N0YXR1c190b19lcnJu
byh1aW50MzJfdCBycGNfc3RhdHVzKQ0KPj4gICB7DQo+PiBAQCAtODYsMTYgKzEwMSwzNCBAQCBy
NTM1X3JwY19zdGF0dXNfdG9fZXJybm8odWludDMyX3QgcnBjX3N0YXR1cykNCj4+ICAgICAgICB9
DQo+PiAgIH0NCj4+DQo+PiArc3RydWN0IGdzcF9tc2dxX3JlY3ZfYXJncyB7DQo+IA0KPiBTaW5j
ZSB3ZSdyZSBhZGRpbmcgdGhlIG5lY2Vzc2FyeSBkb2N1bWVudGF0aW9uIHRvIHRoaXMgc3RydWN0
dXJlIHBsZWFzZSBtYWtlDQo+IHRoZW0gcHJvcGVyIGtlcm5lbCBkb2MgY29tbWVudHMgWzFdLg0K
PiANCj4gUGxlYXNlIGFsc28gbWFrZSBzdXJlIHRvIGV4cGxhaW4gdGhpbmdzIGEgYml0IG1vcmUg
aW4gZGV0YWlsLg0KPiANCj4gRm9yIHlvdSBOVklESUEgZm9sa3MgaXQncyBsaWtlbHkgd2F5IGVh
c2llciB0byB1bmRlcnN0YW5kIHRoZSBjb2RlLCBzaW5jZSB5b3UNCj4gcHJvYmFibHkgaGF2ZSBl
eGlzdGluZyBkb2N1bWVudGF0aW9uIG9mIHRoZSBHU1AgaW50ZXJmYWNlLCBhcmUgaW52b2x2ZWQg
aW4gdGhlDQo+IGRlc2lnbiBvZiB0aGUgaW50ZXJmYWNlIGluIHRoZSBmaXJzdCBwbGFjZSwgZXRj
Lg0KPiANCk9vcHMuIFdoYXQgSSBjYW4gb25seSBzYXkgaXMgKDpwKSA6IEkgbGVhcm5lZCBhbG1v
c3QgYWxsIHRoZSBrbm93bGVkZ2UgDQpvZiBHU1AgcHJvY290b2xzIGZyb20gR1NQIFJQQyBvcGVy
YXRpb24gY29kZSBpbiBPcGVuUk0gWzFdIGFuZCBCZW4ncyBHU1AgDQplbmFibGluZyBwYXRjaGVz
IFsyXSBwbHVzIGxlYXJuaW5nIGluIGRlYnVnLg0KDQpJIGNhbiB3cml0ZSBhIGRvYyBiYXNlZCBv
biBteSBub3RlcyBhbmQgYXNrIHNvbWUgb25lIGNhbiBoZWxwIG9uIHJldmlldy4NCg0KWzFdIA0K
aHR0cHM6Ly9naXRodWIuY29tL05WSURJQS9vcGVuLWdwdS1rZXJuZWwtbW9kdWxlcy9ibG9iL2Vk
NGJlNjQ5NjIzNDM1ZWJiMDRmNWU5M2Y4NTliZjQ2ZDk3N2RhYTQvc3JjL252aWRpYS9zcmMva2Vy
bmVsL2dwdS9nc3AvbWVzc2FnZV9xdWV1ZV9jcHUuYyNMNA0KDQpbMl0gDQpodHRwczovL2xvcmUu
a2VybmVsLm9yZy9ub3V2ZWF1L0NBUE09OXR5Vz1ZdURRclJ3cllLX2F5dXZFbnArOWlyVHV6ZT1N
UC16a293bTNDRko5QUBtYWlsLmdtYWlsLmNvbS9ULw0KDQo+IFRyeSB0byB0aGluayBhYm91dCB3
aGF0J3MgbmVjZXNzYXJ5IGZvciBuZXcgcGVvcGxlIGpvaW5pbmcgdGhlIHByb2plY3QgdG8NCj4g
dW5kZXJzdGFuZCB0aGUgY29kZS4NCj4gDQoNCldoZW4gd3JpdHRpbmcgdjIsIEkgd2FzIHRoaW5r
aW5nIGlmIGl0IHdvdWxkIGJlIGJldHRlciB0byBqdXN0IGNob3AgdGhpcyANCndhaXQgZnVuY3Rp
b25zIGludG8gc2V2ZXJhbC4gSXQgYWN0dWFsbHkgY29udGFpbnMgc2V2ZXJhbCBmdW5jdGlvbnMg
bm93Og0KDQotIHdhaXQNCi0gd2FpdCBmb3IgdGhlIEdTUCBtZXNzYWdlIGhlYWRlciB3aGVuIHBl
ZWsgdGhlIG1zZ3EuDQotIHdhaXQgZm9yIHRoZSBjb21wbGV0ZSBHU1AgbWVzc2FnZSB0aGVyZSBj
YW4gY29weSBpdCBpbnRvIHRoZSB2ZWhpY2xlLg0KCS0gc2tpcCB0aGUgUlBDIGhlYWRlciBmb3Ig
Y29udGludWF0aW9uIG1lc3NhZ2UuDQoJLSBub24gc2tpcCB0aGUgUlBDIGhlYWRlciBmb3Igb3Jk
aW5hcnkgbWVzc2FnZXMuDQoNCj4gWzFdIGh0dHBzOi8vZG9jcy5rZXJuZWwub3JnL2RvYy1ndWlk
ZS9rZXJuZWwtZG9jLmh0bWwNCj4gDQo+PiArICAgICAvKiB0aW1lb3V0IGluIHVzICovDQo+PiAr
ICAgICBpbnQgdGltZTsNCj4gDQo+IFRoaXMgaXMgbWlzbGVhZGluZywgaXQncyBub3QgcmVhbGx5
IHRoZSB0aW1lLCBidXQgdGhlIG51bWJlciBvZiBzbGVlcCBjeWNsZXMuDQo+IEl0J3MganVzdCB0
aGF0IHRoZSBjdXJyZW50IGN5Y2xlIGlzIHNldCB0byB1c2xlZXBfcmFuZ2UoMSwgMikuDQo+IA0K
PiBNYXliZSB3ZSB3YW50IHRvIG5hbWUgaXQgInJldHJpZXMiLCAicmV0cnlfY291bnQiLCBvciBq
dXN0ICJyZXRyeSIgaW5zdGVhZD8NCj4gDQo+IEJlc2lkZXMgdGhhdCwgZG8geW91IHNlZSBhIG5l
ZWQgdG8gY29udGludW91c2x5IGRlY3JlYXNlIHRoZSByZXRyeSBjb3VudCBhdCBhbGw/DQo+IA0K
PiBUbyBtZSBpdCBsb29rcyBsaWtlIHdlIGNvdWxkIGp1c3QgbWFrZSBpdCBhIGNvbnN0YW50IGFu
ZCBsZXQgdGhlIGZ1bmN0aW9uIHRoYXQNCj4gbmVlZHMgdGhlIHJldHJ5IGxvb3AgZGVhbCB3aXRo
IGl0IGludGVybmFsbHkgaW5zdGVhZCBvZiBwYXNzaW5nIGl0IGFyb3VuZA0KPiBldmVyeXdoZXJl
LiBEbyBJIG1pc3MgYW55dGhpbmc/DQo+IA0KDQpUb3RhbGx5IGFncmVlLg0KDQo+PiArICAgICAv
KiBpZiBzZXQsIHBlZWsgdGhlIG1zZ3EsIG90aGVyd2lzZSBjb3B5IGl0ICovDQo+PiArICAgICB1
MzIgKnByZXBjOw0KPiANCj4gVGhpcyBzb3VuZHMgbGlrZSBpZiBgcHJlcGNgIHdvdWxkIGJlIGEg
Ym9vbC4gUGxlYXNlIGFkZCBhIGRlc2NyaXB0aW9uIHRoYXQNCj4gcHJvcGVybHkgZXhwbGFpbnMg
d2hhdCB0aGUgZmllbGQgYWN0dWFsbHkgcmVwcmVzZW50cy4NCj4gDQoNCkFjY29yZGluZyB0byB3
aGF0IEkgdW5kZXJzdGFuZCwgcHJlcGMgcmVwcmVzZW50cyB0aGUgYWN0dWFsIG1lc3NhZ2UgDQps
ZW5ndGggd2hlbiBwZWVraW5nIHRoZSBtc2dxLiAoZmlyc3QsIHdhaXQgZm9yIHRoZSBHU1AgUlBD
IG1lc3NhZ2UgDQpoZWFkZXIgdG8gYmUgdGhlcmUsIHRoZW4gcGFzc2luZyB0aGUgYWN0dWFsIEdT
UCBSUEMgbWVzc2FnZSBsZW5ndGggdG8gDQp0aGUgY2FsbGVyLikNCg0KPj4gKyAgICAgLyoNCj4+
ICsgICAgICAqIHRoZSBzaXplICh3aXRob3V0IG1lc3NhZ2UgaGVhZGVyKSBvZiBtZXNzYWdlIHRv
DQo+PiArICAgICAgKiB3YWl0KHdoZW4gcGVlaykvY29weSBmcm9tIHRoZSBtc2dxDQo+PiArICAg
ICAgKi8NCj4+ICsgICAgIHUzMiByZXBjOw0KPiANCj4gU2luY2UgdGhlIHRlcm0gInJlcGMiIGlz
IHVzZWQgZXZlcnl3aGVyZSBpbiB0aGlzIGZpbGUsIGJ1dCBpcyBuZXZlciBleHBsYWluZWQsDQo+
IG1heWJlIHRoaXMgd291bGQgYmUgYSBnb29kIHBsYWNlPw0KPiANCg0KSXQgd291bGQgYmUgbmlj
ZSB0byByZWZpbmUgcmVwYywgYXJnYyBhbmQgYXJndiwgc2luY2UgdGhleSB3ZXJlIHF1aXRlIA0K
Y29uZnVzaW5nIHRvIG1lIHdoZW4gSSByYW1wZWQgdXAgbm91dmVhdSBjb2RlLg0KDQo+IERvIHdl
IGtub3cgd2hhdCBpdCBtZWFucz8gSSBtZWFuLCB0aGUgc2VtYW50aWNzIGluIHRoaXMgY29udGV4
dCBpcyBjbGVhciwgYnV0DQo+IG90aGVyd2lzZSBpdCBsb29rcyBsaWtlIHNvbWUgZ2VuZXJpYyB0
ZXJtIGxpa2UgImFyZ2MiPw0KPiANCj4gT3RoZXJ3aXNlLCBmZWVsIGZyZWUgdG8gcmVwbGFjZSBp
dCB3aXRoIGEgbGVzcyBnZW5lcmljIGFuZCBtb3JlIG1lYW5pbmdmdWwgbmFtZS4NCj4gKCkNCj4+
ICsgICAgIC8qIHRoZSBtZXNzYWdlIGJ1ZmZlciAqLw0KPj4gKyAgICAgdTggKm1zZzsNCj4gDQo+
IFBsZWFzZSBleHBhbmQgdGhpcyBhIGJpdDsgdGhlIGZvbGxvd2luZyBxdWVzdGlvbnMgbWlnaHQg
aGVscDoNCj4gICAgLSBXaGF0IGtpbmQgb2YgbWVzc2FnZT8NCj4gICAgLSBJcyBpdCBhbHdheXMg
dGhlIHNhbWUga2luZCBvZiBtZXNzYWdlPw0KPiAgICAtIFdobyBpcyBzdXBwb3NlZCB0byBhbGxv
Y2F0ZSBpdD8NCj4gICAgLSBIb3cgZG9lcyBpdCBnZXQgZnJlZWQ/DQo+IA0KDQpJIHRoaW5rIHRo
aXMgd2lsbCBsb29rIGNsZWFyZXIgaWYgd2UgY2hvcHBlZCB0aGUgZnVuY3Rpb24gaW50byBzZXZl
cmFsLg0KDQpCYWNrIHRvIHRoZSBxdWVzdGlvbnM6DQoNCi0gV2hhdCBraW5kIG9mIG1lc3NhZ2U/
DQpHU1AgUlBDIG1lc3NhZ2Ugd2l0aG91dCBtZXNzYWdlIGhlYWRlcg0KDQotIElzIGl0IGFsd2F5
cyB0aGUgc2FtZSBraW5kIG9mIG1lc3NhZ2U/DQpZZXMNCg0KLSBXaG8gaXMgc3VwcG9zZWQgdG8g
YWxsb2NhdGUgaXQ/DQpyNTM1X2dzcF9tc2dxX3JlY3YoKS4NCg0KLSBIb3cgZG9lcyBpdCBnZXQg
ZnJlZWQ/DQpudmttX2dzcF9ycGNfZG9uZSgpLg0KDQpBbiBleGFtcGxlIG9mIGxpZmVjeWNsZSBv
ZiBSUEMgdmVoaWNsZSBjYW4gYmUgZm91bmQgaW4gDQpyNTM1X2dzcF9ycGNfcm1fYWxsb2NfcHVz
aCgpLg0KDQo+PiArICAgICAvKg0KPj4gKyAgICAgICogc2tpcCBjb3B5aW5nIHRoZSBycGMgaGVh
ZGVyLCB1c2VkIHdoZW4gaGFuZGxpbmcgYSBsYXJnZSBSUEMuDQo+PiArICAgICAgKiBycGMgaGVh
ZGVyIG9ubHkgc2hvd3MgdXAgaW4gdGhlIGZpcnN0IHNlZ21lbnQgb2YgYSBsYXJnZSBSUEMuDQo+
PiArICAgICAgKi8NCj4+ICsgICAgIGJvb2wgc2tpcF9jb3B5X3JwY19oZWFkZXI7DQo+PiArfTsN
Cj4+ICsNCj4+ICAgc3RhdGljIHZvaWQgKg0KPj4gLXI1MzVfZ3NwX21zZ3Ffd2FpdChzdHJ1Y3Qg
bnZrbV9nc3AgKmdzcCwgdTMyIHJlcGMsIHUzMiAqcHJlcGMsIGludCAqcHRpbWUpDQo+PiArZ3Nw
X21zZ3FfcmVjdihzdHJ1Y3QgbnZrbV9nc3AgKmdzcCwgc3RydWN0IGdzcF9tc2dxX3JlY3ZfYXJn
cyAqYXJncykNCj4gDQo+IEZvciBzdGF0aWMgZnVuY3Rpb25zIGl0J3MgcHJvYmFibHkgZmluZSB0
byBvbWl0IHRoZSAicjUzNSIgcHJlZml4LCBidXQgc2luY2UNCj4gaXQncyBiZWVuIHVzZWQgZXZl
cnl3aGVyZSBlbHNlLCB3ZSBtYXkgd2FudCB0byBrZWVwIGl0IGZvciBjb25zaXN0ZW5jeS4NCj4g
DQoNCldhcyB0aGlua2luZyBhYm91dCB0aGlzLiBXYXMgaXQgYSBnb29kIGlkZWEgdG8gaGF2ZSB0
aGUgdmVyc2lvbiBudW1iZXIgDQppbiB0aGUgZnVuY3Rpb24gbmFtZSBldmVyeXdoZXJlPw0KDQo+
IEFsc28gcGxlYXNlIGFkZCBhIHByb3BlciBrZXJuZWwgZG9jIGNvbW1lbnQgdG8gdGhpcyBmdW5j
dGlvbiBleHBsYWluaW5nIGl0cw0KPiBzZW1hbnRpY3MgYXMgd2VsbC4NCj4gDQpTdXJlLg0KPj4g
ICB7DQo+PiAgICAgICAgc3RydWN0IHI1MzVfZ3NwX21zZyAqbXFlOw0KPj4gLSAgICAgdTMyIHNp
emUsIHJwdHIgPSAqZ3NwLT5tc2dxLnJwdHI7DQo+PiArICAgICB1MzIgcnB0ciA9ICpnc3AtPm1z
Z3EucnB0cjsNCj4+ICAgICAgICBpbnQgdXNlZDsNCj4+IC0gICAgIHU4ICptc2c7DQo+PiAtICAg
ICB1MzIgbGVuOw0KPj4gKyAgICAgdTMyIHNpemUsIGxlbiwgcmVwYzsNCj4+DQo+PiAtICAgICBz
aXplID0gRElWX1JPVU5EX1VQKEdTUF9NU0dfSERSX1NJWkUgKyByZXBjLCBHU1BfUEFHRV9TSVpF
KTsNCj4+ICsgICAgIHNpemUgPSBESVZfUk9VTkRfVVAoR1NQX01TR19IRFJfU0laRSArIGFyZ3Mt
PnJlcGMsIEdTUF9QQUdFX1NJWkUpOw0KPj4gICAgICAgIGlmIChXQVJOX09OKCFzaXplIHx8IHNp
emUgPj0gZ3NwLT5tc2dxLmNudCkpDQo+PiAgICAgICAgICAgICAgICByZXR1cm4gRVJSX1BUUigt
RUlOVkFMKTsNCj4+DQo+PiBAQCAtMTA5LDQ2ICsxNDIsMTQ5IEBAIHI1MzVfZ3NwX21zZ3Ffd2Fp
dChzdHJ1Y3QgbnZrbV9nc3AgKmdzcCwgdTMyIHJlcGMsIHUzMiAqcHJlcGMsIGludCAqcHRpbWUp
DQo+PiAgICAgICAgICAgICAgICAgICAgICAgIGJyZWFrOw0KPj4NCj4+ICAgICAgICAgICAgICAg
IHVzbGVlcF9yYW5nZSgxLCAyKTsNCj4+IC0gICAgIH0gd2hpbGUgKC0tKCpwdGltZSkpOw0KPj4g
KyAgICAgfSB3aGlsZSAoLS0oYXJncy0+dGltZSkpOw0KPj4NCj4+IC0gICAgIGlmIChXQVJOX09O
KCEqcHRpbWUpKQ0KPj4gKyAgICAgaWYgKFdBUk5fT04oIWFyZ3MtPnRpbWUpKQ0KPj4gICAgICAg
ICAgICAgICAgcmV0dXJuIEVSUl9QVFIoLUVUSU1FRE9VVCk7DQo+Pg0KPj4gICAgICAgIG1xZSA9
ICh2b2lkICopKCh1OCAqKWdzcC0+c2htLm1zZ3EucHRyICsgMHgxMDAwICsgcnB0ciAqIDB4MTAw
MCk7DQo+Pg0KPj4gLSAgICAgaWYgKHByZXBjKSB7DQo+PiAtICAgICAgICAgICAgICpwcmVwYyA9
ICh1c2VkICogR1NQX1BBR0VfU0laRSkgLSBzaXplb2YoKm1xZSk7DQo+PiArICAgICBpZiAoYXJn
cy0+cHJlcGMpIHsNCj4+ICsgICAgICAgICAgICAgKmFyZ3MtPnByZXBjID0gKHVzZWQgKiBHU1Bf
UEFHRV9TSVpFKSAtIHNpemVvZigqbXFlKTsNCj4+ICAgICAgICAgICAgICAgIHJldHVybiBtcWUt
PmRhdGE7DQo+PiAgICAgICAgfQ0KPj4NCj4+ICsgICAgIHJlcGMgPSBhcmdzLT5yZXBjOw0KPj4g
ICAgICAgIHNpemUgPSBBTElHTihyZXBjICsgR1NQX01TR19IRFJfU0laRSwgR1NQX1BBR0VfU0la
RSk7DQo+Pg0KPj4gLSAgICAgbXNnID0ga3ZtYWxsb2MocmVwYywgR0ZQX0tFUk5FTCk7DQo+PiAt
ICAgICBpZiAoIW1zZykNCj4+IC0gICAgICAgICAgICAgcmV0dXJuIEVSUl9QVFIoLUVOT01FTSk7
DQo+PiAtDQo+PiAgICAgICAgbGVuID0gKChnc3AtPm1zZ3EuY250IC0gcnB0cikgKiBHU1BfUEFH
RV9TSVpFKSAtIHNpemVvZigqbXFlKTsNCj4+ICAgICAgICBsZW4gPSBtaW5fdCh1MzIsIHJlcGMs
IGxlbik7DQo+PiAtICAgICBtZW1jcHkobXNnLCBtcWUtPmRhdGEsIGxlbik7DQo+PiArICAgICBp
ZiAoIWFyZ3MtPnNraXBfY29weV9ycGNfaGVhZGVyKQ0KPj4gKyAgICAgICAgICAgICBtZW1jcHko
YXJncy0+bXNnLCBtcWUtPmRhdGEsIGxlbik7DQo+PiArICAgICBlbHNlDQo+PiArICAgICAgICAg
ICAgIG1lbWNweShhcmdzLT5tc2csIG1xZS0+ZGF0YSArIHNpemVvZihzdHJ1Y3QgbnZmd19nc3Bf
cnBjKSwNCj4+ICsgICAgICAgICAgICAgICAgICAgIGxlbiAtIHNpemVvZihzdHJ1Y3QgbnZmd19n
c3BfcnBjKSk7DQo+Pg0KPj4gICAgICAgIHJlcGMgLT0gbGVuOw0KPj4NCj4+ICAgICAgICBpZiAo
cmVwYykgew0KPj4gICAgICAgICAgICAgICAgbXFlID0gKHZvaWQgKikoKHU4ICopZ3NwLT5zaG0u
bXNncS5wdHIgKyAweDEwMDAgKyAwICogMHgxMDAwKTsNCj4+IC0gICAgICAgICAgICAgbWVtY3B5
KG1zZyArIGxlbiwgbXFlLCByZXBjKTsNCj4+ICsgICAgICAgICAgICAgbWVtY3B5KGFyZ3MtPm1z
ZyArIGxlbiwgbXFlLCByZXBjKTsNCj4+ICAgICAgICB9DQo+Pg0KPj4gICAgICAgIHJwdHIgPSAo
cnB0ciArIERJVl9ST1VORF9VUChzaXplLCBHU1BfUEFHRV9TSVpFKSkgJSBnc3AtPm1zZ3EuY250
Ow0KPj4NCj4+ICAgICAgICBtYigpOw0KPj4gICAgICAgICgqZ3NwLT5tc2dxLnJwdHIpID0gcnB0
cjsNCj4+IC0gICAgIHJldHVybiBtc2c7DQo+PiArICAgICByZXR1cm4gYXJncy0+bXNnOw0KPj4g
K30NCj4+ICsNCj4+ICtzdGF0aWMgdm9pZA0KPj4gK3I1MzVfZ3NwX21zZ19kdW1wKHN0cnVjdCBu
dmttX2dzcCAqZ3NwLCBzdHJ1Y3QgbnZmd19nc3BfcnBjICptc2csIGludCBsdmwpDQo+PiArew0K
Pj4gKyAgICAgaWYgKGdzcC0+c3ViZGV2LmRlYnVnID49IGx2bCkgew0KPj4gKyAgICAgICAgICAg
ICBudmttX3ByaW50a19fKCZnc3AtPnN1YmRldiwgbHZsLCBpbmZvLA0KPj4gKyAgICAgICAgICAg
ICAgICAgICAgICAgICAgICJtc2cgZm46JWQgbGVuOjB4JXgvMHglenggcmVzOjB4JXggcmVzcDow
eCV4XG4iLA0KPj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgIG1zZy0+ZnVuY3Rpb24sIG1z
Zy0+bGVuZ3RoLCBtc2ctPmxlbmd0aCAtIHNpemVvZigqbXNnKSwNCj4+ICsgICAgICAgICAgICAg
ICAgICAgICAgICAgICBtc2ctPnJwY19yZXN1bHQsIG1zZy0+cnBjX3Jlc3VsdF9wcml2YXRlKTsN
Cj4+ICsgICAgICAgICAgICAgcHJpbnRfaGV4X2R1bXAoS0VSTl9JTkZPLCAibXNnOiAiLCBEVU1Q
X1BSRUZJWF9PRkZTRVQsIDE2LCAxLA0KPj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICBt
c2ctPmRhdGEsIG1zZy0+bGVuZ3RoIC0gc2l6ZW9mKCptc2cpLCB0cnVlKTsNCj4+ICsgICAgIH0N
Cj4+ICt9DQo+PiArDQo+PiArc3RhdGljIHZvaWQgKg0KPj4gK3I1MzVfZ3NwX21zZ3FfcmVjdl9j
b250aW51YXRpb24oc3RydWN0IG52a21fZ3NwICpnc3AsIHUzMiAqcGF5bG9hZF9zaXplLA0KPj4g
KyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgdTggKmJ1ZiwgaW50IHRpbWUpDQo+IA0KPiBU
aGlzIGxvb2tzIGxpa2UgYSBncmVhdCBwbGFjZSB0byBhZGQgYW4gZXhwbGFuYXRpb24gYWJvdXQg
Y29udGludWF0aW9uIHJlY29yZHMuDQo+IA0KPiBTb21lb25lIHdobyB3YW50cyB0byBqb2luIHRo
ZSBwcm9qZWN0IGxpa2VseSBoYXMgbm8gaWRlYSBhYm91dCBSUENzIGFuZA0KPiBjb250aW51YXRp
b24gcmVjb3Jkcy4NCj4gDQo+IFBsZWFzZSBhZGQgc29tZSBkb2N1bWVudGF0aW9uIGV4cGxhaW5p
bmcgd2hhdCBjb250aW51YXRpb24gcmVjb3JkcyBhcmUsIHdoZW4NCj4gdGhleSBhcmUgZXhwZWN0
ZWQgdG8gYmUgc2VudCBhbmQgd2hhdCB0aGlzIGZ1bmN0aW9uIGRvZXMgdG8gZGVhbCB3aXRoIHRo
ZW0uDQo+IA0KDQpTdXJlLg0KDQo+PiArew0KPj4gKyAgICAgc3RydWN0IG52a21fc3ViZGV2ICpz
dWJkZXYgPSAmZ3NwLT5zdWJkZXY7DQo+PiArICAgICBzdHJ1Y3QgbnZmd19nc3BfcnBjICptc2c7
DQo+PiArICAgICBzdHJ1Y3QgZ3NwX21zZ3FfcmVjdl9hcmdzIGFyZ3MgPSB7IDAgfTsNCj4+ICsg
ICAgIHUzMiBzaXplOw0KPj4gKw0KPj4gKyAgICAgLyogUGVlayB0aGUgaGVhZGVyIG9mIG1lc3Nh
Z2UgKi8NCj4+ICsgICAgIGFyZ3MudGltZSA9IHRpbWU7DQo+PiArICAgICBhcmdzLnJlcGMgPSBz
aXplb2YoKm1zZyk7DQo+PiArICAgICBhcmdzLnByZXBjID0gJnNpemU7DQo+PiArDQo+PiArICAg
ICBtc2cgPSBnc3BfbXNncV9yZWN2KGdzcCwgJmFyZ3MpOw0KPj4gKyAgICAgaWYgKElTX0VSUl9P
Ul9OVUxMKG1zZykpDQo+PiArICAgICAgICAgICAgIHJldHVybiBtc2c7DQo+PiArDQo+PiArICAg
ICBpZiAobXNnLT5mdW5jdGlvbiAhPSBOVl9WR1BVX01TR19GVU5DVElPTl9DT05USU5VQVRJT05f
UkVDT1JEKSB7DQo+PiArICAgICAgICAgICAgIG52a21fZXJyb3Ioc3ViZGV2LCAiTm90IGEgY29u
dGludWF0aW9uIG9mIGEgbGFyZ2UgUlBDXG4iKTsNCj4+ICsgICAgICAgICAgICAgcjUzNV9nc3Bf
bXNnX2R1bXAoZ3NwLCBtc2csIE5WX0RCR19FUlJPUik7DQo+PiArICAgICAgICAgICAgIHJldHVy
biBFUlJfUFRSKC1FSU8pOw0KPj4gKyAgICAgfQ0KPj4gKw0KPj4gKyAgICAgKnBheWxvYWRfc2l6
ZSA9IG1zZy0+bGVuZ3RoIC0gc2l6ZW9mKCptc2cpOw0KPj4gKw0KPj4gKyAgICAgLyogUmVjdiB0
aGUgY29udGludWF0aW9uIG1lc3NhZ2UgKi8NCj4+ICsgICAgIGFyZ3MudGltZSA9IHRpbWU7DQo+
PiArICAgICBhcmdzLnJlcGMgPSBtc2ctPmxlbmd0aDsNCj4+ICsgICAgIGFyZ3MucHJlcGMgPSBO
VUxMOw0KPj4gKyAgICAgYXJncy5tc2cgPSBidWY7DQo+PiArICAgICBhcmdzLnNraXBfY29weV9y
cGNfaGVhZGVyID0gdHJ1ZTsNCj4+ICsNCj4+ICsgICAgIHJldHVybiBnc3BfbXNncV9yZWN2KGdz
cCwgJmFyZ3MpOw0KPj4gICB9DQo+Pg0KPj4gICBzdGF0aWMgdm9pZCAqDQo+PiAtcjUzNV9nc3Bf
bXNncV9yZWN2KHN0cnVjdCBudmttX2dzcCAqZ3NwLCB1MzIgcmVwYywgaW50ICpwdGltZSkNCj4+
ICtyNTM1X2dzcF9tc2dxX3JlY3Yoc3RydWN0IG52a21fZ3NwICpnc3AsIHUzMiBtc2dfcmVwYywg
dTMyIHRvdGFsX3JlcGMsDQo+PiArICAgICAgICAgICAgICAgIGludCB0aW1lKQ0KPiANCj4gUGxl
YXNlIGFkZCBhIGtlcm5lbCBkb2MgY29tbWVudCBhcyB3ZWxsIGFuZCBleHBsYWluIHRoZSBhcmd1
bWVudHMuIEFsbCB0aGUNCj4gZGlmZmVyZW50IHNpemVzIHF1aWNrbHkgYmVjb21lIHZlcnkgY29u
ZnVzaW5nLg0KPiANCj4gSXQgd291bGQgYWxzbyBiZSBnb29kIHRvIGVzdGFibGlzaCBhIGNvbW1v
biBuYW1pbmcgc2NoZW1lIGZvciBhbGwgdGhlIGRpZmZlcmVudA0KPiBzaXplcy4gV291bGQgeW91
IG1pbmQgYWRkaW5nIGEgc2VwYXJhdGUgcGF0Y2ggdGhhdCBkb2VzIHRoYXQ/DQo+IA0KPiBZb3Ug
Y2FuIGFkZCBjb21tZW50IGF0IHRoZSBiZWdpbm5pbmcgb2YgdGhlIGZpbGUgZXhwbGFpbmluZyBh
bGwgdGhlIGRpZmZlcmVudA0KPiBzaXplcyBhbmQgYXNzaWduIHRoZW0gYSB1bmlxdWUgbmFtZSB0
aGF0IHdlIHRoZW4gY2FuIHVzZSB0aHJvdWdob3V0IHRoZSBkcml2ZXIuDQo+DQoNCkkgdGhpbmsg
bWF5YmUgd2UgY2FuIGRlZmluZSB0aGUgdGVybXMgb2YgdGhlIHNpemUgYWZ0ZXIgdGhlIGRvYywg
d2hlcmUgDQpqdXN0IGV4cGxhaW5lZCB0aGUgR1NQIFJQQyBtZXNzYWdlIGxheW91dC4gU2hvdWxk
IGJlIG11Y2ggZWFpc2VyIHRoZW4uDQoNCj4gQWxzbywgSSBzdGlsbCBmaW5kIHRoZSAicmVwYyIg
dGhpbmcgY29uZnVzaW5nLiBJZiBpdCdzIGp1c3QgYSBzaXplIHdoeSBub3QganVzdA0KPiBjYWxs
IGl0ICJzaXplIj8NCj4gDQo+PiAgIHsNCj4+IC0gICAgIHJldHVybiByNTM1X2dzcF9tc2dxX3dh
aXQoZ3NwLCByZXBjLCBOVUxMLCBwdGltZSk7DQo+PiArICAgICBzdHJ1Y3QgZ3NwX21zZ3FfcmVj
dl9hcmdzIGFyZ3MgPSB7IDAgfTsNCj4+ICsgICAgIHN0cnVjdCBudmZ3X2dzcF9ycGMgKm1zZzsN
Cj4gDQo+IFBsZWFzZSB0cnkgdG8gYXZvaWQgbmFtZSBjb2xsaXNpb25zLCBzdWNoIGFzIG5hbWlu
ZyB0aGlzIGBtc2dgLCB3aGljaCBoYXMNCj4gbm90aGluZyB0byBkbyB3aXRoIHRoZSBiZWxvdyBg
YXJncy5tc2dgLg0KPiANCj4+ICsgICAgIGNvbnN0IHUzMiBtYXhfbXNnX3NpemUgPSAoMTYgKiAw
eDEwMDApIC0gc2l6ZW9mKHN0cnVjdCByNTM1X2dzcF9tc2cpOw0KPj4gKyAgICAgY29uc3QgdTMy
IG1heF9ycGNfc2l6ZSA9IG1heF9tc2dfc2l6ZSAtIHNpemVvZigqbXNnKTsNCj4+ICsgICAgIHUz
MiByZXBjID0gdG90YWxfcmVwYzsNCj4+ICsgICAgIHU4ICpidWYsICpuZXh0Ow0KPj4gKw0KPj4g
KyAgICAgaWYgKFdBUk5fT04obXNnX3JlcGMgPiBtYXhfbXNnX3NpemUpKQ0KPj4gKyAgICAgICAg
ICAgICByZXR1cm4gTlVMTDsNCj4+ICsNCj4+ICsgICAgIGJ1ZiA9IGt2bWFsbG9jKG1heF90KHUz
MiwgbXNnX3JlcGMsIHRvdGFsX3JlcGMgKyBzaXplb2YoKm1zZykpLCBHRlBfS0VSTkVMKTsNCj4+
ICsgICAgIGlmICghYnVmKQ0KPj4gKyAgICAgICAgICAgICByZXR1cm4gRVJSX1BUUigtRU5PTUVN
KTsNCj4+ICsNCj4+ICsgICAgIC8qIFJlY3YgdGhlIG1lc3NhZ2UgKi8NCj4+ICsgICAgIGFyZ3Mu
dGltZSA9IHRpbWU7DQo+PiArICAgICBhcmdzLnJlcGMgPSBtc2dfcmVwYzsNCj4+ICsgICAgIGFy
Z3MucHJlcGMgPSBOVUxMOw0KPj4gKyAgICAgYXJncy5tc2cgPSBidWY7DQo+PiArICAgICBhcmdz
LnNraXBfY29weV9ycGNfaGVhZGVyID0gZmFsc2U7DQo+PiArDQo+PiArICAgICBtc2cgPSBnc3Bf
bXNncV9yZWN2KGdzcCwgJmFyZ3MpOw0KPj4gKyAgICAgaWYgKElTX0VSUl9PUl9OVUxMKG1zZykp
IHsNCj4+ICsgICAgICAgICAgICAga2ZyZWUoYnVmKTsNCj4+ICsgICAgICAgICAgICAgcmV0dXJu
IG1zZzsNCj4+ICsgICAgIH0NCj4+ICsNCj4+ICsgICAgIGlmICh0b3RhbF9yZXBjIDw9IG1heF9y
cGNfc2l6ZSkNCj4+ICsgICAgICAgICAgICAgcmV0dXJuIGJ1ZjsNCj4+ICsNCj4+ICsgICAgIC8q
IEdhdGhlciB0aGUgbWVzc2FnZSBmcm9tIHRoZSBmb2xsb3dpbmcgY29udGludWF0aW9uIG1lc3Nh
Z2VzLiAqLw0KPj4gKyAgICAgbmV4dCA9IGJ1ZjsNCj4+ICsNCj4+ICsgICAgIG5leHQgKz0gbXNn
X3JlcGM7DQo+PiArICAgICByZXBjIC09IG1zZ19yZXBjIC0gc2l6ZW9mKCptc2cpOw0KPj4gKw0K
Pj4gKyAgICAgd2hpbGUgKHJlcGMpIHsNCj4+ICsgICAgICAgICAgICAgc3RydWN0IG52ZndfZ3Nw
X3JwYyAqY29udF9tc2c7DQo+PiArICAgICAgICAgICAgIHUzMiBzaXplOw0KPj4gKw0KPj4gKyAg
ICAgICAgICAgICBjb250X21zZyA9IHI1MzVfZ3NwX21zZ3FfcmVjdl9jb250aW51YXRpb24oZ3Nw
LCAmc2l6ZSwgbmV4dCwNCj4+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICB0aW1lKTsNCj4+ICsgICAgICAgICAgICAgaWYgKElTX0VSUl9PUl9OVUxM
KGNvbnRfbXNnKSkgew0KPj4gKyAgICAgICAgICAgICAgICAgICAgIGtmcmVlKGJ1Zik7DQo+PiAr
ICAgICAgICAgICAgICAgICAgICAgcmV0dXJuIGNvbnRfbXNnOw0KPj4gKyAgICAgICAgICAgICB9
DQo+PiArICAgICAgICAgICAgIHJlcGMgLT0gc2l6ZTsNCj4+ICsgICAgICAgICAgICAgbmV4dCAr
PSBzaXplOw0KPj4gKyAgICAgfQ0KPj4gKw0KPj4gKyAgICAgLyogUGF0Y2ggdGhlIG1lc3NhZ2Ug
bGVuZ3RoLiBUaGUgY2FsbGVyIHNlZXMgYSBjb25zb2xpZGF0ZWQgbWVzc2FnZSAqLw0KPj4gKyAg
ICAgbXNnLT5sZW5ndGggPSB0b3RhbF9yZXBjICsgc2l6ZW9mKCptc2cpOw0KPj4gKyAgICAgcmV0
dXJuIGJ1ZjsNCj4+ICAgfQ0KPj4NCj4+ICAgc3RhdGljIGludA0KPj4gQEAgLTIzNCw1NCArMzcw
LDMzIEBAIHI1MzVfZ3NwX2NtZHFfZ2V0KHN0cnVjdCBudmttX2dzcCAqZ3NwLCB1MzIgYXJnYykN
Cj4+ICAgICAgICByZXR1cm4gY21kLT5kYXRhOw0KPj4gICB9DQo+Pg0KPj4gLXN0cnVjdCBudmZ3
X2dzcF9ycGMgew0KPj4gLSAgICAgdTMyIGhlYWRlcl92ZXJzaW9uOw0KPj4gLSAgICAgdTMyIHNp
Z25hdHVyZTsNCj4+IC0gICAgIHUzMiBsZW5ndGg7DQo+PiAtICAgICB1MzIgZnVuY3Rpb247DQo+
PiAtICAgICB1MzIgcnBjX3Jlc3VsdDsNCj4+IC0gICAgIHUzMiBycGNfcmVzdWx0X3ByaXZhdGU7
DQo+PiAtICAgICB1MzIgc2VxdWVuY2U7DQo+PiAtICAgICB1bmlvbiB7DQo+PiAtICAgICAgICAg
ICAgIHUzMiBzcGFyZTsNCj4+IC0gICAgICAgICAgICAgdTMyIGNwdVJtR2ZpZDsNCj4+IC0gICAg
IH07DQo+PiAtICAgICB1OCAgZGF0YVtdOw0KPj4gLX07DQo+PiAtDQo+PiAgIHN0YXRpYyB2b2lk
DQo+PiAgIHI1MzVfZ3NwX21zZ19kb25lKHN0cnVjdCBudmttX2dzcCAqZ3NwLCBzdHJ1Y3QgbnZm
d19nc3BfcnBjICptc2cpDQo+PiAgIHsNCj4+ICAgICAgICBrdmZyZWUobXNnKTsNCj4+ICAgfQ0K
Pj4NCj4+IC1zdGF0aWMgdm9pZA0KPj4gLXI1MzVfZ3NwX21zZ19kdW1wKHN0cnVjdCBudmttX2dz
cCAqZ3NwLCBzdHJ1Y3QgbnZmd19nc3BfcnBjICptc2csIGludCBsdmwpDQo+PiAtew0KPj4gLSAg
ICAgaWYgKGdzcC0+c3ViZGV2LmRlYnVnID49IGx2bCkgew0KPj4gLSAgICAgICAgICAgICBudmtt
X3ByaW50a19fKCZnc3AtPnN1YmRldiwgbHZsLCBpbmZvLA0KPj4gLSAgICAgICAgICAgICAgICAg
ICAgICAgICAgICJtc2cgZm46JWQgbGVuOjB4JXgvMHglenggcmVzOjB4JXggcmVzcDoweCV4XG4i
LA0KPj4gLSAgICAgICAgICAgICAgICAgICAgICAgICAgIG1zZy0+ZnVuY3Rpb24sIG1zZy0+bGVu
Z3RoLCBtc2ctPmxlbmd0aCAtIHNpemVvZigqbXNnKSwNCj4+IC0gICAgICAgICAgICAgICAgICAg
ICAgICAgICBtc2ctPnJwY19yZXN1bHQsIG1zZy0+cnBjX3Jlc3VsdF9wcml2YXRlKTsNCj4+IC0g
ICAgICAgICAgICAgcHJpbnRfaGV4X2R1bXAoS0VSTl9JTkZPLCAibXNnOiAiLCBEVU1QX1BSRUZJ
WF9PRkZTRVQsIDE2LCAxLA0KPj4gLSAgICAgICAgICAgICAgICAgICAgICAgICAgICBtc2ctPmRh
dGEsIG1zZy0+bGVuZ3RoIC0gc2l6ZW9mKCptc2cpLCB0cnVlKTsNCj4+IC0gICAgIH0NCj4+IC19
DQo+PiAtDQo+PiAgIHN0YXRpYyBzdHJ1Y3QgbnZmd19nc3BfcnBjICoNCj4+ICAgcjUzNV9nc3Bf
bXNnX3JlY3Yoc3RydWN0IG52a21fZ3NwICpnc3AsIGludCBmbiwgdTMyIHJlcGMpDQo+PiAgIHsN
Cj4+ICAgICAgICBzdHJ1Y3QgbnZrbV9zdWJkZXYgKnN1YmRldiA9ICZnc3AtPnN1YmRldjsNCj4+
ICsgICAgIHN0cnVjdCBnc3BfbXNncV9yZWN2X2FyZ3MgYXJncyA9IHsgMCB9Ow0KPj4gICAgICAg
IHN0cnVjdCBudmZ3X2dzcF9ycGMgKm1zZzsNCj4+ICAgICAgICBpbnQgdGltZSA9IDQwMDAwMDAs
IGk7DQo+PiAgICAgICAgdTMyIHNpemU7DQo+Pg0KPj4gICByZXRyeToNCj4+IC0gICAgIG1zZyA9
IHI1MzVfZ3NwX21zZ3Ffd2FpdChnc3AsIHNpemVvZigqbXNnKSwgJnNpemUsICZ0aW1lKTsNCj4+
ICsgICAgIC8qIFBlZWsgdGhlIGhlYWRlciBvZiBtZXNzYWdlICovDQo+PiArICAgICBhcmdzLnRp
bWUgPSB0aW1lOw0KPj4gKyAgICAgYXJncy5yZXBjID0gc2l6ZW9mKCptc2cpOw0KPj4gKyAgICAg
YXJncy5wcmVwYyA9ICZzaXplOw0KPj4gKw0KPj4gKyAgICAgbXNnID0gZ3NwX21zZ3FfcmVjdihn
c3AsICZhcmdzKTsNCj4+ICAgICAgICBpZiAoSVNfRVJSX09SX05VTEwobXNnKSkNCj4+ICAgICAg
ICAgICAgICAgIHJldHVybiBtc2c7DQo+Pg0KPj4gLSAgICAgbXNnID0gcjUzNV9nc3BfbXNncV9y
ZWN2KGdzcCwgbXNnLT5sZW5ndGgsICZ0aW1lKTsNCj4+ICsgICAgIC8qIFJlY3YgdGhlIG1lc3Nh
Z2UgKi8NCj4+ICsgICAgIG1zZyA9IHI1MzVfZ3NwX21zZ3FfcmVjdihnc3AsIG1zZy0+bGVuZ3Ro
LCByZXBjLCB0aW1lKTsNCj4+ICAgICAgICBpZiAoSVNfRVJSX09SX05VTEwobXNnKSkNCj4+ICAg
ICAgICAgICAgICAgIHJldHVybiBtc2c7DQo+Pg0KPj4gQEAgLTczNCw2ICs4NDksNyBAQCByNTM1
X2dzcF9ycGNfcHVzaChzdHJ1Y3QgbnZrbV9nc3AgKmdzcCwgdm9pZCAqYXJndiwgYm9vbCB3YWl0
LCB1MzIgcmVwYykNCj4+ICAgICAgICBtdXRleF9sb2NrKCZnc3AtPmNtZHEubXV0ZXgpOw0KPj4g
ICAgICAgIGlmIChycGNfc2l6ZSA+IG1heF9ycGNfc2l6ZSkgew0KPj4gICAgICAgICAgICAgICAg
Y29uc3QgdTMyIGZuID0gcnBjLT5mdW5jdGlvbjsNCj4+ICsgICAgICAgICAgICAgdTMyIHJlbWFp
bl9ycGNfc2l6ZSA9IHJwY19zaXplOw0KPj4NCj4+ICAgICAgICAgICAgICAgIC8qIEFkanVzdCBs
ZW5ndGgsIGFuZCBzZW5kIGluaXRpYWwgUlBDLiAqLw0KPj4gICAgICAgICAgICAgICAgcnBjLT5s
ZW5ndGggPSBzaXplb2YoKnJwYykgKyBtYXhfcnBjX3NpemU7DQo+PiBAQCAtNzQ0LDExICs4NjAs
MTEgQEAgcjUzNV9nc3BfcnBjX3B1c2goc3RydWN0IG52a21fZ3NwICpnc3AsIHZvaWQgKmFyZ3Ys
IGJvb2wgd2FpdCwgdTMyIHJlcGMpDQo+PiAgICAgICAgICAgICAgICAgICAgICAgIGdvdG8gZG9u
ZTsNCj4+DQo+PiAgICAgICAgICAgICAgICBhcmd2ICs9IG1heF9ycGNfc2l6ZTsNCj4+IC0gICAg
ICAgICAgICAgcnBjX3NpemUgLT0gbWF4X3JwY19zaXplOw0KPj4gKyAgICAgICAgICAgICByZW1h
aW5fcnBjX3NpemUgLT0gbWF4X3JwY19zaXplOw0KPj4NCj4+ICAgICAgICAgICAgICAgIC8qIFJl
bWFpbmluZyBjaHVua3Mgc2VudCBhcyBDT05USU5VQVRJT05fUkVDT1JEIFJQQ3MuICovDQo+PiAt
ICAgICAgICAgICAgIHdoaWxlIChycGNfc2l6ZSkgew0KPj4gLSAgICAgICAgICAgICAgICAgICAg
IHUzMiBzaXplID0gbWluKHJwY19zaXplLCBtYXhfcnBjX3NpemUpOw0KPj4gKyAgICAgICAgICAg
ICB3aGlsZSAocmVtYWluX3JwY19zaXplKSB7DQo+PiArICAgICAgICAgICAgICAgICAgICAgdTMy
IHNpemUgPSBtaW4ocmVtYWluX3JwY19zaXplLCBtYXhfcnBjX3NpemUpOw0KPj4gICAgICAgICAg
ICAgICAgICAgICAgICB2b2lkICpuZXh0Ow0KPj4NCj4+ICAgICAgICAgICAgICAgICAgICAgICAg
bmV4dCA9IHI1MzVfZ3NwX3JwY19nZXQoZ3NwLCBOVl9WR1BVX01TR19GVU5DVElPTl9DT05USU5V
QVRJT05fUkVDT1JELCBzaXplKTsNCj4+IEBAIC03NjQsMTkgKzg4MCwyMCBAQCByNTM1X2dzcF9y
cGNfcHVzaChzdHJ1Y3QgbnZrbV9nc3AgKmdzcCwgdm9pZCAqYXJndiwgYm9vbCB3YWl0LCB1MzIg
cmVwYykNCj4+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBnb3RvIGRvbmU7DQo+Pg0K
Pj4gICAgICAgICAgICAgICAgICAgICAgICBhcmd2ICs9IHNpemU7DQo+PiAtICAgICAgICAgICAg
ICAgICAgICAgcnBjX3NpemUgLT0gc2l6ZTsNCj4+ICsgICAgICAgICAgICAgICAgICAgICByZW1h
aW5fcnBjX3NpemUgLT0gc2l6ZTsNCj4+ICAgICAgICAgICAgICAgIH0NCj4+DQo+PiAgICAgICAg
ICAgICAgICAvKiBXYWl0IGZvciByZXBseS4gKi8NCj4+IC0gICAgICAgICAgICAgaWYgKHdhaXQp
IHsNCj4+IC0gICAgICAgICAgICAgICAgICAgICBycGMgPSByNTM1X2dzcF9tc2dfcmVjdihnc3As
IGZuLCByZXBjKTsNCj4+IC0gICAgICAgICAgICAgICAgICAgICBpZiAoIUlTX0VSUl9PUl9OVUxM
KHJwYykpDQo+PiArICAgICAgICAgICAgIHJwYyA9IHI1MzVfZ3NwX21zZ19yZWN2KGdzcCwgZm4s
IHJwY19zaXplKTsNCj4+ICsgICAgICAgICAgICAgaWYgKCFJU19FUlJfT1JfTlVMTChycGMpKSB7
DQo+PiArICAgICAgICAgICAgICAgICAgICAgaWYgKHdhaXQpDQo+PiAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgcmVwdiA9IHJwYy0+ZGF0YTsNCj4+IC0gICAgICAgICAgICAgICAgICAg
ICBlbHNlDQo+PiAtICAgICAgICAgICAgICAgICAgICAgICAgICAgICByZXB2ID0gcnBjOw0KPj4g
LSAgICAgICAgICAgICB9IGVsc2Ugew0KPj4gLSAgICAgICAgICAgICAgICAgICAgIHJlcHYgPSBO
VUxMOw0KPj4gLSAgICAgICAgICAgICB9DQo+PiArICAgICAgICAgICAgICAgICAgICAgZWxzZSB7
DQo+PiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICBudmttX2dzcF9ycGNfZG9uZShnc3As
IHJwYyk7DQo+PiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICByZXB2ID0gTlVMTDsNCj4+
ICsgICAgICAgICAgICAgICAgICAgICB9DQo+PiArICAgICAgICAgICAgIH0gZWxzZQ0KPj4gKyAg
ICAgICAgICAgICAgICAgICAgIHJlcHYgPSB3YWl0ID8gcnBjIDogTlVMTDsNCj4+ICAgICAgICB9
IGVsc2Ugew0KPj4gICAgICAgICAgICAgICAgcmVwdiA9IHI1MzVfZ3NwX3JwY19zZW5kKGdzcCwg
YXJndiwgd2FpdCwgcmVwYyk7DQo+PiAgICAgICAgfQ0KPj4gLS0NCj4+IDIuMzQuMQ0KPj4NCg0K
