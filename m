Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 712CE9F0EAA
	for <lists+nouveau@lfdr.de>; Fri, 13 Dec 2024 15:11:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2065C10E0B0;
	Fri, 13 Dec 2024 14:11:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="V6xdtSup";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2062.outbound.protection.outlook.com [40.107.244.62])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5757E10E0B0
 for <nouveau@lists.freedesktop.org>; Fri, 13 Dec 2024 14:11:37 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=w/AzkhR1wcDlhMDtrB5m0qc7hgWLPiOo9U01aBihDGEk8di+bfLFcCAJyyDj9eQAeBk2cR77GLhCsWblwMxgWsW4KJAVW65+qmUEE4+qD8h6CWY+QX9rdWFXkvGhCMHVq1wUJHmqVTZt+RUV7lKiYPE4mHldHhoQozZOE2tHGXariucN3Of6NYs5OSvoGN2hHAlVUf53kJqoCxeVE97NztQtcBDxRh04gVjrKKk5SoejAg3xw2e3FL7kgGmer2B/VW1dAlmt74InP0mN1BS6xMhcmYpyTUICg4WsQZlQY2vPQyoCG80HXrPVrvn30i1GpAtmbvSgAlcpqkYn9JSCrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=B403adDU+w8E/3lwVYtQ3jPR52bm5TN634s9BB+DA3I=;
 b=PyO9Jf6sxKAK6Xe87ZYgzUs1AjubpXUsJRyUmH+l0+6NBGrn5dgLbvVBk9tOfZFaJTb50gjFodcJIhTxVmnIOMBn+2WMX60HbgfTakvB1x6gwj9N8TfF7vlUp18jS5V+i1BtmZ/XLkeD6dfpQryoDcYUskYM6edCtHjtnaV1DQQladtu4meUJUnc0/bNiW3xU+qTOsxuB/LJ+pno/wd4RwDXElM+VBad/Qn+Ib+3MAo/L5QGxkJpwuNKwOvbP1nczVAMfcxm2+uTXPiDy4YQIdi1tl54wUKAb+zdBwXt5L0jBem2OdiLZdWTexNtQHYbHZjgBdGYkxyGfHAcJJTA+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=B403adDU+w8E/3lwVYtQ3jPR52bm5TN634s9BB+DA3I=;
 b=V6xdtSupwVnNVD638g0PG30yfOolp+sqJ6NkW+zzRyf8aZ/8OxmuQwH3kiriRcWr/7lfhRlEJaS40KgXs+hFSqoJUdjSKBxAodOX+aHZ7+YfXvZWHt9ssB/4WrM6F12m51itvStEV4JZIvPV8Hki4zV9qH+wr0USuMm974MWC3rnebo3sMgnJUspMXgOcCPBTVlKI1Hmn0kYWcLKRmNYgjO6ah4M4SLatUHf5UslQG9NCyRSWECnJ7SAViSgzyrPHkuwOTSmCtqin1GbH6/tHuE75uDN0eJKcekITzxa0gnNgsWgbJFApf+4mhMzFyH2Gx+qig66hPhLMYMEqwfvBA==
Received: from SA1PR12MB6870.namprd12.prod.outlook.com (2603:10b6:806:25e::22)
 by CYXPR12MB9320.namprd12.prod.outlook.com (2603:10b6:930:e6::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8251.18; Fri, 13 Dec
 2024 14:11:34 +0000
Received: from SA1PR12MB6870.namprd12.prod.outlook.com
 ([fe80::8e11:7d4b:f9ae:911a]) by SA1PR12MB6870.namprd12.prod.outlook.com
 ([fe80::8e11:7d4b:f9ae:911a%4]) with mapi id 15.20.8251.015; Fri, 13 Dec 2024
 14:11:33 +0000
From: Zhi Wang <zhiw@nvidia.com>
To: Danilo Krummrich <dakr@kernel.org>
CC: "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>,
 "airlied@gmail.com" <airlied@gmail.com>, "daniel@ffwll.ch" <daniel@ffwll.ch>, 
 Ben Skeggs <bskeggs@nvidia.com>, Andy Currid <ACurrid@nvidia.com>, Neo Jia
 <cjia@nvidia.com>, Surath Mitra <smitra@nvidia.com>, Ankit Agrawal
 <ankita@nvidia.com>, Aniket Agashe <aniketa@nvidia.com>, Kirti Wankhede
 <kwankhede@nvidia.com>, "Tarun Gupta (SW-GPU)" <targupta@nvidia.com>,
 "zhiwang@kernel.org" <zhiwang@kernel.org>
Subject: Re: [PATCH v3 01/15] nvkm: add a kernel doc to introduce the GSP RPC
Thread-Topic: [PATCH v3 01/15] nvkm: add a kernel doc to introduce the GSP RPC
Thread-Index: AQHbK3JVIiVV8l62tkWCfpFn05i6vLLhE+YAgANnCIA=
Date: Fri, 13 Dec 2024 14:11:33 +0000
Message-ID: <22cb44f3-368d-42d3-adb0-beb4eb3287c8@nvidia.com>
References: <20241031085250.2941482-1-zhiw@nvidia.com>
 <20241031085250.2941482-2-zhiw@nvidia.com>
 <Z1ll6LMzGNlQuR0O@pollux.localdomain>
In-Reply-To: <Z1ll6LMzGNlQuR0O@pollux.localdomain>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SA1PR12MB6870:EE_|CYXPR12MB9320:EE_
x-ms-office365-filtering-correlation-id: 63357223-beff-4af1-3a31-08dd1b800c91
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|376014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?ZVBoVXFRellvTEsrRjMxZHY5U01sNEswM2gvMDhSY3U2N2kreGM1b29sMHBF?=
 =?utf-8?B?ZlZiQllibzdVUmdUWWZRaVlpNEZWY01ybXI2RERkNXZHTi9TTUlOWC9lajln?=
 =?utf-8?B?cGdUeUQwS3BVT2g5MHlvempNaTN3aGthKzVEK1FmOEdjOExvSDZmbWozcnhZ?=
 =?utf-8?B?ZCt1clR3VHNpT3MrMDJVS2p4VHdIeklvTUNWRXBsc0lmNmJWcXdYb0lvcTRB?=
 =?utf-8?B?NmppL2x0b2xYK2hLOTZlRkNibE5JZ3N1NC9QeTZNV0dTWGtKWk5aSUJpWENw?=
 =?utf-8?B?VitXT1E3bVE5dHdlcU1rVlBEU3owWWwzS2hiUnRLM3I2UERhR3NSdGNvMVlZ?=
 =?utf-8?B?NHlPeThvcHVQZDlTVEZRVjEyUThxUy9Qc3RlU084YmdHLzVJZm5iRVpnSm5w?=
 =?utf-8?B?Q2thM1hFOWgrWmNkancyS0Q5NXEvejZkWEo3Ly9TTkRoaGRJNmJvcHczL05s?=
 =?utf-8?B?Yy94UUl0S3A5TmNMeTBIT3F4bUZ4Tzl0RXBIVjcxcVI2aW1nbUw1VkNwTXFF?=
 =?utf-8?B?WUZUVkxlUzdwUEZIa3lrcFJrTTNoekR1dEhlby9VUWJNZzRtdXNHeXYwVlN5?=
 =?utf-8?B?VnpKMHFtYnJLVnFtOGdiYStlNmlqME1zcStsSjd6cU5jZTZWWnBYdmVSQXVY?=
 =?utf-8?B?OFpRRXBCOUFYNWlzamRidnlJMHdBaTRRMVUzbENGTlBjd3UyWUlGTG9INHpX?=
 =?utf-8?B?N3ZXcHQ1QXZIQ09mYXdyRkY2ZkU2anVHc3RyNnhkNC9wamFkSjlBVkZDTzF2?=
 =?utf-8?B?eFhRUCtHZ01CWlYxUHZpcU96SWhLcjBqTjMwallxSnc0c1Vqd1Z4ZlF1VFVD?=
 =?utf-8?B?dlMzL2h1bUNTY1M3ZGtGV0NQS3NnWTZ5eEs3WEdWMkpMMDVJdnBiSG45NmhC?=
 =?utf-8?B?aHc5ck5wN24wSEs3bkhWenRSR3V3K0d5TnVreGVrbzVoNWwxUktVM0ljZmVy?=
 =?utf-8?B?L3B3K0s5a2pqSm9RUUgzYmpwOUVqZzM0ZC9XZ3BSWUFSYnFQSlBNL2U5ZzVV?=
 =?utf-8?B?Z2lQY2hYVVN1SkZRdTZNNUEyRml2Mld5S1FoelBnU1gyeGkwUytTdXpTbVZm?=
 =?utf-8?B?SmtudVBXQ2FmV3FlY0RoTnBOZExCNDdzSjdrRXdmVmNYdnlvZzgrQlVVSDhS?=
 =?utf-8?B?OFBWY0hwN1JYQm5oWEt3RVh0TjJBTVRFTHhTd1Y2OUNCcW9reTY2Y3BUMzIv?=
 =?utf-8?B?N3lSem9DYlRMMUtQblFZOURVRmUyUmxqbmg0ejdRd3RzK21lWlJpeEdkdHZ6?=
 =?utf-8?B?MiszMzZyaGF0ZWladHlwUTRvU1V5cklkTVV1cFJyU0MxZmkvN2pRUjgvWmlv?=
 =?utf-8?B?WVRHeE02RnRVbzJ0ckc1Rmo5NlZiaXJYWFR2a0x0UGs5d1REZTV3b0h5eHY3?=
 =?utf-8?B?OGhZUUNMWS82VlRkSlBoZUlnYmIySmxLMWUyNGhhblR4YjEwVDFqNkxnTlpY?=
 =?utf-8?B?aG1NVUJ6NFY1b0IwWUk2TWg4a0U0eDB2TXRwS3l3bzZ1R2dQMG1JSkNsMUVh?=
 =?utf-8?B?aG40VmJZbHhtSjNxeU9QTXArdVFiZ2RuejZaMGFQbUIwaXA1UW9ySXAvVnFj?=
 =?utf-8?B?dUZGQkFRYUtOancyS1VLUktQd0U5Q1E5QVVOWjZYejZ5RTdSQXdocGErQjVl?=
 =?utf-8?B?Vlp6YnpjVlkvaXhFK2NPNG5SM1ZGQWdIZ0ZvOTZVdVE0QkE1VVMzSGxEbE5k?=
 =?utf-8?B?WTZGQTlkT3lIMG9FTVBlL0dBTURMWHdrUGdnQ1ZRM0ZocGlOaXpuUlo0NHA3?=
 =?utf-8?B?cmY2S2d2VXFGRGY1VWtEMzhSOGRKMjRjV1R0cEQzMjBkOWtqYy8xcDZabUM5?=
 =?utf-8?B?YkVWRVhSazQrdzJwZW0vd091dGh1YXJtZXdQWXErN05Sb2xQTW83Wng3WXgw?=
 =?utf-8?B?UTM3MzVkU05BeFpPbFhlYmw1QXN1TzU1ZGRCc0N3eFFDZUgrK051Z1BNazRW?=
 =?utf-8?Q?PSzhSGEy1VNKZgj5By6dBKU8tXYQ4Ec1?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA1PR12MB6870.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?eXhxWFB5UzJPTzFZbkdSNnVNQUpmc1N2TW12YVhRWWZDZ3R1S3NQREc0QU90?=
 =?utf-8?B?RXJiVUttR0Vrb3VzeEpSbUpRbDZLaU1GZTFGcm1CYjZoSkM4M1FJL1RpV2Rh?=
 =?utf-8?B?TGRBYlE3emYzMVE4NkV5Mm1GNzNJaXNTYzdLQVFlbnFyTWtvSnNQZnJhc09B?=
 =?utf-8?B?WU1aL2xsT3FiRjF6WTRPSk9vS0FyeTQ3QlJQbmtLYVFyZ0Z5THcvY1RpRzNN?=
 =?utf-8?B?TTFWQXZFd3pDeWdyV1B1NE9DemQ1VHVaZTlhOFdpTUIrZ281cmlFR0lYUWJh?=
 =?utf-8?B?U21TMmYwaUg3Z0h5L3FsbEFDeTNPejNEMU83aG9QcmhiMDJMQ3NZdVliSGxy?=
 =?utf-8?B?WTlnaEhNL1ZyVDlyck1qNlJmaXFHQWVwTTJaM1FsR010UHFSeEIzQVF1Zlkz?=
 =?utf-8?B?blYrNnRvc2RsL1Z0MVlJQ0pzenorVVM4Yld4LzNCOEptdkMvM3U1RERrYkY4?=
 =?utf-8?B?TmJlWm1JdkdyYjJONmUzdXpHdkxJU1BRNEViSEFhcHc4ZWZNc1pDdUVrakRE?=
 =?utf-8?B?Vzc2V2F2MW5vNTk4THJySEt3QmZYQzg2VExRdDhldklpV2MxMTZFRUQvckNM?=
 =?utf-8?B?QjVpMHRjdFB6Y05sR3VxRGdEdlRzbThZdmtoRnlGaUwzREorQkRnUnV0TGdM?=
 =?utf-8?B?Q0owNFMvcUQyY2ZlbDVJZWFOdDhyZkdzUjVYTUh2dmlnMDVCUTZQYlZkZXZW?=
 =?utf-8?B?VUoyelIrVk9vMzNrdmRiTkJqNUpNVmUydDVVTU5hcXVZYW9SVFNkMlo0ZFgv?=
 =?utf-8?B?dkJHcWxrS1hZMFgzVTR2WkRrazVmVDJzQlFMWlBlQUFPWFVZRStsRWQvN3JC?=
 =?utf-8?B?dk1SZG9Wa0QwTFJuYWpWRG9HODQzQjRoZDVpY01QdWJhbWd4L2x0QkIwelZF?=
 =?utf-8?B?R0VycTJBRWl6eERhRVVyZTFNNnBGelRMWXBSeU0xazZiMGlrQnVtb0NiZGZG?=
 =?utf-8?B?SVpQcmM3WnlReXFUa1creDF3T3FnNzlydDEzRWhiNytCaGpRTlZSeER5amNE?=
 =?utf-8?B?cFNZYWpOYkgycTV0eGRLVVRKaUZNemNmWjNrZU1hM0x2NEQ0VVpraXY3d0g3?=
 =?utf-8?B?YlIzcHZPbnpBbDJTaUJ3c0orTHUweXM5U21EeFpFWk5KNDdEdkJZL1IrZWwx?=
 =?utf-8?B?SVA0ZzNoUmVEUnNOblc2bTlueVI2NmE5eDFRdm9BZXFBQW1KM3JJSC9JTHJK?=
 =?utf-8?B?clV4YlRyVFB1SmVaSitSdGpSRCs2ZXRLVGwxTkRSaUNSajNqOHpyTy9XYSs4?=
 =?utf-8?B?OTBzTTQ1WGVBbmVpZ0hFVVkxN1BEWW82NkN4cUVncDZlTkFTa3JzNmpFNnNv?=
 =?utf-8?B?aUFRVWRkbTNkQ3l0ZGNlTjRjdE1YMFVKVVEycnEyaVFMVXEzaTNONko4TTdx?=
 =?utf-8?B?VDN1eWpvZ2tNa3BWSmpxanhHdmVtYjVKWngzU1o1eDBkZ3dNaWFlWXk5Wm5m?=
 =?utf-8?B?MitvVCtXdUVWTWpnSEgrb2pNaTVvUTl3RDdmY2RoNHo1R1ZSU2lLSWcwcGh3?=
 =?utf-8?B?b1JFenVHNEw3V0JhdE9TT2IyaFN1VERkaGM5akc3SzZrTUhadm5BY3NEVnEv?=
 =?utf-8?B?aFYwY0U5K1hSQkFTS1BoLzdKWUJyTnlsaFpmcW01YkJFSlNyMTZVZHNOTjYv?=
 =?utf-8?B?Z25vb2pYWEp6VmwrV3hpUy9GenJNWjczdzBXOGZTMW1zaXU4cHZqajJKMERj?=
 =?utf-8?B?Uy8rcFFSaDVEbERUN2hyNlAzVjQ5bU1ld25Vc0pBbklwQ2RGV0oydGVJWXpI?=
 =?utf-8?B?MHYzbEEzT1Y1QkIzandOaE40VGpiTC9sTFJhbGZSUlFSRzIxalJqbWtObysx?=
 =?utf-8?B?b09ZNkNGeldXcHpZVlp2SUJmMkt5dEk4L09nQkZSd0F6NDc2RGR5TmI1aXJD?=
 =?utf-8?B?Zlc1Yzc2VFQzaUhtSFBweTJVNkc4ZmtnckRPR2dRMzdnM3JpSGhTbTBoRGNY?=
 =?utf-8?B?MXJsVGo0aGZWMTdQd0tVV05IWDF5MDZ1dXVjLzN2aXlRSFFPMEwrR0Jsakd0?=
 =?utf-8?B?ZHFhQkxhNnJCTHVBTVc3YWpSYVd2ekVCTmEvaHc4M3V3S1lhRDY1aEtYQWpX?=
 =?utf-8?B?enhmSUtldEVwdGVnN2pkaVU3a1BvSEwyaFMvL09pd1NPZFFvWG9ueitObnJV?=
 =?utf-8?Q?EEpk=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <8CC757A000B5544FAE84C0EA7E380590@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA1PR12MB6870.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 63357223-beff-4af1-3a31-08dd1b800c91
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Dec 2024 14:11:33.6560 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: tRNZjLdBG7OZpZBjd6WHozQF3+gGwhja7WjRvFhzwrP4oSX6/ov2s1fyTAzpBsTp
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYXPR12MB9320
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

T24gMTEvMTIvMjAyNCAxMi4xNCwgRGFuaWxvIEtydW1tcmljaCB3cm90ZToNCj4gSGkgWmhpLA0K
PiANCj4gT24gVGh1LCBPY3QgMzEsIDIwMjQgYXQgMDE6NTI6MzZBTSAtMDcwMCwgWmhpIFdhbmcg
d3JvdGU6DQo+PiBJbiBvcmRlciB0byBleHBsYWluIHRoZSBuYW1lIGNsZWFuLXVwcyBpbiBHU1Ag
UlBDIHJvdXRpbmVzLCBhIGtlcm5lbA0KPj4gZG9jIHRvIGV4cGxhaW4gdGhlIG1lbW9yeSBsYXlv
dXQgYW5kIHRlcm1zIGlzIHJlcXVpcmVkLg0KPj4NCj4+IEFkZCBhIGtlcm5lbCBkb2MgdG8gaW50
cm9kdWNlIHRoZSBHU1AgUlBDLg0KPiANCj4gVGhhbmtzIGZvciBhZGRpbmcgdGhpcyAtLSB2ZXJ5
IG11Y2ggYXBwcmVjaWF0ZWQhDQo+IA0KPj4NCj4+IFNpZ25lZC1vZmYtYnk6IFpoaSBXYW5nIDx6
aGl3QG52aWRpYS5jb20+DQo+PiAtLS0NCj4+ICAgLi4uL2dwdS9kcm0vbm91dmVhdS9udmttL3N1
YmRldi9nc3AvcjUzNS5jICAgIHwgNDYgKysrKysrKysrKysrKysrKysrKw0KPj4gICAxIGZpbGUg
Y2hhbmdlZCwgNDYgaW5zZXJ0aW9ucygrKQ0KPj4NCj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dw
dS9kcm0vbm91dmVhdS9udmttL3N1YmRldi9nc3AvcjUzNS5jIGIvZHJpdmVycy9ncHUvZHJtL25v
dXZlYXUvbnZrbS9zdWJkZXYvZ3NwL3I1MzUuYw0KPj4gaW5kZXggYTRiODM4MWM0ZTNlLi4xYTA3
YzAxOTEzNTYgMTAwNjQ0DQo+PiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9udmttL3N1
YmRldi9nc3AvcjUzNS5jDQo+PiArKysgYi9kcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9udmttL3N1
YmRldi9nc3AvcjUzNS5jDQo+IA0KPiBJIGFzc3VtZSB0aGUgaWRlYSBpcyB0byBhZGQgdGhpcyBk
b2N1bWVudGF0aW9uIHI1MzUgc3BlY2lmaWNhbGx5IGFuZCBmb3IgaXQgZm9yDQo+IG5ldyBmaXJt
d2FyZSB2ZXJzaW9ucz8NCj4gDQoNCkkgdGhpbmsgaXQgaXMgdG8gZGVwaWN0IHRoZSBnZW5lcmFs
IGlkZWEgZm9yIHBlb3BsZSB0byB1bmRlcnN0YW5kLiBGb3IgDQpuZXdlciBmaXJtd2FyZSB2ZXJz
aW9uIChqdXN0IGNoZWNrZWQgdGhlIGNvZGUgaW4gb3BlbnJtIG1haW4gYnJhbmNoKSwgDQp0aGUg
aWRlYSBpcyBzdGlsbCB2YWxpZC4gU3VwcG9zZSB0aGUgbWlub3IgY2hhbmdlcyBvbiBzb21lIGRh
dGEgDQpzdHJ1Y3R1cmVzIGNhbiBiZSBzZWxmLWRvY3VtZW50ZWQgYnkgZGVmaW5pdGlvbnMuDQoN
Cj4+IEBAIC02MCw2ICs2MCw1MiBAQA0KPj4gICAjZGVmaW5lIEdTUF9NU0dfTUlOX1NJWkUgR1NQ
X1BBR0VfU0laRQ0KPj4gICAjZGVmaW5lIEdTUF9NU0dfTUFYX1NJWkUgR1NQX1BBR0VfTUlOX1NJ
WkUgKiAxNg0KPj4gICANCj4+ICsvKioNCj4+ICsgKiBET0M6IEdTUCBtZXNzYWdlIHF1ZXVlIGVs
ZW1lbnQNCj4gDQo+IFdlIHNob3VsZCBwcm9iYWJseSBpbmNsdWRlIHRob3NlIERPQ3MgaW50byBh
IERvY3VtZW50YXRpb24vZ3B1L25vdXZlYXUucnN0ICh3aGljaA0KPiB3b3VsZCBuZWVkIHRvIGJl
IGNyZWF0ZWQsIG5vdyB0aGF0IHdlIGFkZCBkb2N1bWVudGF0aW9uKS4NCj4gDQoNClNvdW5kcyBh
IGdvb2QgaWRlYS4NCg0KPj4gKyAqDQo+PiArICogaHR0cHM6Ly9naXRodWIuY29tL05WSURJQS9v
cGVuLWdwdS1rZXJuZWwtbW9kdWxlcy9ibG9iL21haW4vc3JjL252aWRpYS9pbmMva2VybmVsL2dw
dS9nc3AvbWVzc2FnZV9xdWV1ZV9wcml2LmgNCj4gDQo+IElmIHNvLCB0aGlzIHNob3VsZCBub3Qg
cmVmZXJlbmNlIHRoZSBtYWluIGJyYW5jaCwgYnV0IHJhdGhlciB0aGUgY29ycmVzcG9uZGluZw0K
PiByNTM1IHJlbGVhc2U/DQo+ID4+ICsgKg0KPj4gKyAqIFRoZSBHU1AgY29tbWFuZCBxdWV1ZSBh
bmQgc3RhdHVzIHF1ZXVlIGFyZSBtZXNzYWdlIHF1ZXVlcyBmb3IgdGhlDQo+PiArICogY29tbXVu
aWNhdGlvbiBiZXR3ZWVuIHNvZnR3YXJlIGFuZCBHU1AuIFRoZSBzb2Z0d2FyZSBzdWJtaXRzIHRo
ZSBHU1ANCj4+ICsgKiBSUEMgdmlhIHRoZSBHU1AgY29tbWFuZCBxdWV1ZSwgR1NQIHdyaXRlcyB0
aGUgc3RhdHVzIG9mIHRoZSBzdWJtaXR0ZWQNCj4+ICsgKiBSUEMgaW4gdGhlIHN0YXR1cyBxdWV1
ZS4NCj4+ICsgKg0KPj4gKyAqIEEgR1NQIG1lc3NhZ2UgcXVldWUgZWxlbWVudCBjb25zaXN0cyBv
ZiB0aHJlZSBwYXJ0czoNCj4+ICsgKg0KPj4gKyAqIC0gbWVzc2FnZSBlbGVtZW50IGhlYWRlciAo
c3RydWN0IHI1MzVfZ3NwX21zZyksIHdoaWNoIG1vc3RseSBtYWludGFpbnMNCj4+ICsgKiB0aGUg
bWV0YWRhdGEgZm9yIHF1ZXVpbmcgdGhlIGVsZW1lbnQuDQo+PiArICoNCj4+ICsgKiAtIFJQQyBt
ZXNzYWdlIGhlYWRlciAoc3RydWN0IG52ZndfZ3NwX3JwYyksIHdoaWNoIG1haW50YWlucyB0aGUg
aW5mbw0KPj4gKyAqIG9mIHRoZSBSUEMuIEUuZy4sIHRoZSBSUEMgZnVuY3Rpb24gbnVtYmVyLg0K
Pj4gKyAqDQo+PiArICogLSBUaGUgcGF5bG9hZCwgd2hlcmUgdGhlIFJQQyBtZXNzYWdlIHN0YXlz
LiBFLmcuIHRoZSBwYXJhbXMgb2YgYQ0KPj4gKyAqIHNwZWNpZmljIFJQQyBmdW5jdGlvbi4gU29t
ZSBSUEMgZnVuY3Rpb25zIGFsc28gaGF2ZSB0aGVpciBoZWFkZXJzDQo+PiArICogaW4gdGhlIHBh
eWxvYWQuIEUuZy4gcm1fYWxsb2MsIHJtX2NvbnRyb2wuDQo+PiArICoNCj4+ICsgKiBUaGUgbWVt
b3J5IGxheW91dCBvZiBhIEdTUCBtZXNzYWdlIGVsZW1lbnQgY2FuIGJlIGlsbHVzdHJhdGVkIGJl
bG93Og0KPj4gKyAqDQo+PiArICogKy0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLSsNCj4+ICsgKiB8
IE1lc3NhZ2UgRWxlbWVudCBIZWFkZXIgfA0KPj4gKyAqIHwgICAgKHI1MzVfZ3NwX21zZykgICAg
ICB8DQo+PiArICogfCAgICAgICAgICAgICAgICAgICAgICAgIHwNCj4+ICsgKiB8IChyNTM1X2dz
cF9tc2cuZGF0YSkgICAgfA0KPj4gKyAqIHwgICAgICAgICAgfCAgICAgICAgICAgICB8DQo+PiAr
ICogfC0tLS0tLS0tLS1WLS0tLS0tLS0tLS0tLXwNCj4+ICsgKiB8ICAgIEdTUCBSUEMgSGVhZGVy
ICAgICAgfA0KPj4gKyAqIHwgICAgKG52ZndfZ3NwX3JwYykgICAgICB8DQo+PiArICogfCAgICAg
ICAgICAgICAgICAgICAgICAgIHwNCj4+ICsgKiB8IChudmZ3X2dzcF9ycGMuZGF0YSkgICAgfA0K
Pj4gKyAqIHwgICAgICAgICAgfCAgICAgICAgICAgICB8DQo+PiArICogfC0tLS0tLS0tLS1WLS0t
LS0tLS0tLS0tLXwNCj4+ICsgKiB8ICAgICAgICAgICAgICAgICAgICAgICAgfA0KPj4gKyAqIHwg
ICAgICAgUGF5bG9hZCAgICAgICAgICB8DQo+PiArICogfCAgICAgICAgICAgICAgICAgICAgICAg
IHwNCj4+ICsgKiB8ICAgaGVhZGVyKG9wdGlvbmFsKSAgICAgfA0KPj4gKyAqIHwgICAgICAgIHBh
cmFtcyAgICAgICAgICB8DQo+PiArICogKy0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLSsNCj4+ICsg
Kg0KPj4gKyAqLw0KPj4gKw0KPj4gICBzdHJ1Y3QgcjUzNV9nc3BfbXNnIHsNCj4+ICAgCXU4IGF1
dGhfdGFnX2J1ZmZlclsxNl07DQo+PiAgIAl1OCBhYWRfYnVmZmVyWzE2XTsNCj4+IC0tIA0KPj4g
Mi4zNC4xDQo+Pg0KDQo=
