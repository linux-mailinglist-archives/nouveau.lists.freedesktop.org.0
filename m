Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 930DBC4417A
	for <lists+nouveau@lfdr.de>; Sun, 09 Nov 2025 16:47:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F0D710E24F;
	Sun,  9 Nov 2025 15:47:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="mzd6sEc3";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from SJ2PR03CU001.outbound.protection.outlook.com
 (mail-westusazon11012009.outbound.protection.outlook.com [52.101.43.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4583610E24F
 for <nouveau@lists.freedesktop.org>; Sun,  9 Nov 2025 15:47:51 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=t3CbnZtP7wuJo7xV4P05jKztcpcFLvnDmCI7OOjkUrGiAfyk3h14vW7hFJGjAbdybsb0ROKsLL+mVwaYTs7eFAn0r24g4TPnDEpnIAzYfF4ZBBImnDKVoMj1M3fnAOqZoTxBGrsCCgY/2/7+6IgM8qlgYGa1Y4Vz1dDJOY6Fo1SRTwBlknVC+2d32l1zhlS9L0yJxP1zqXxrH1ZtKcKQykXKbZ2Qk88+5WE/aGr+2iCgWp9H5DC71hJytBVzNgvoLTCLfGWsb0GlNkjBBuLAwHGNHoEngpLvQhjE+Ye20JiLwlJ3B6DFS3FVfihcLs6worPaErVFWNHAfOyHBhNv0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QDCly7UjKY9s4WYb3z3+S8uFAFb6wa7m04fvhhF1AKY=;
 b=aIyzzBnhzcjPEZPwhSX3/QV/HjyST9ghzSUD2EMIoV217dWXwX0K2IIf5jVqFcC3VV37l1FPijGIPNbgfMaR2H/z67gTxPnBdmkWh6U92sprIGbAG4Rbl2aUjAFgjnlv+OSIR+B+tTDCm0gNt+c+++llaT6b/VxnOVyHvy5W8qsDYk2pXDlPayBRgKOirsEvPn6XC+DjkuRD4d/uKNe2seNKmL0kuzIX4d6bCYkTwyg/64Kgm4yFxcRKKr9Dw7A+ybK0EUorgAVwwEj4IQtDExlGD8aUYSeb+RVI0LUussMgiWiGNa8EGN+sxKq/qeZQ6B0+yiffUgicBsn22KanyQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QDCly7UjKY9s4WYb3z3+S8uFAFb6wa7m04fvhhF1AKY=;
 b=mzd6sEc3LYwGCtKOe4MTHTZXkNoyUSKZA1GOMlbNFo903wPgujyPYZ0M+5bxuiFx23nQg8JlveeO4IpvOvr7qqcfSvFt4CKse9g3Sd6fjnuXKMzpmjAKltt7oZjYg6kRvngn5Oep27JF4xWaAiD3J06jJvH934tYW6zSOZVsZd4Nfd0nPtYF9/dpnqhN7Ba4Ga88v376UXMpfQqk8eRyfyC81sZTn1UXNg0WUeJDRQm/xK6L5n95GHzgt4I303nAXdWAOExYfu8t/U29E705cgRngJLFUtCfxI/4cn5zQ0opoX+zm5rg+C8LOgYy16DbUjs1pj5BfteX79bxuYZpGg==
Received: from CY5PR12MB6526.namprd12.prod.outlook.com (2603:10b6:930:31::20)
 by BY1PR12MB8446.namprd12.prod.outlook.com (2603:10b6:a03:52d::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.16; Sun, 9 Nov
 2025 15:47:48 +0000
Received: from CY5PR12MB6526.namprd12.prod.outlook.com
 ([fe80::d620:1806:4b87:6056]) by CY5PR12MB6526.namprd12.prod.outlook.com
 ([fe80::d620:1806:4b87:6056%3]) with mapi id 15.20.9298.015; Sun, 9 Nov 2025
 15:47:48 +0000
From: Timur Tabi <ttabi@nvidia.com>
To: "airlied@redhat.com" <airlied@redhat.com>
CC: "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>,
 "stable@vger.kernel.org" <stable@vger.kernel.org>, "lyude@redhat.com"
 <lyude@redhat.com>, "ardb@kernel.org" <ardb@kernel.org>, "dakr@kernel.org"
 <dakr@kernel.org>
Subject: Re: [PATCH] drm/nouveau: set DMA mask before creating the flush page
Thread-Topic: [PATCH] drm/nouveau: set DMA mask before creating the flush page
Thread-Index: AQHcSoEh8dWTlveQmEOccXmfjOLePbTp7IaAgACe24A=
Date: Sun, 9 Nov 2025 15:47:48 +0000
Message-ID: <aa13eb6b2238b6c2ef9750c2433387557b82c2bb.camel@nvidia.com>
References: <20251031161045.3263665-1-ttabi@nvidia.com>
 <CAMwc25pOob3aXPH8u2ON7HZ-Bk+a_d9JWg0+wLNOycnFsVWHSg@mail.gmail.com>
In-Reply-To: <CAMwc25pOob3aXPH8u2ON7HZ-Bk+a_d9JWg0+wLNOycnFsVWHSg@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.56.2-4 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY5PR12MB6526:EE_|BY1PR12MB8446:EE_
x-ms-office365-filtering-correlation-id: ffefc78b-83ce-4e74-5e8d-08de1fa75547
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|1800799024|376014|366016|38070700021;
x-microsoft-antispam-message-info: =?utf-8?B?T21NWDhJMjlFWWdFM0dNY1JNaDQ1T3lMclVZUUNIZWhEYUpZbGJ3TFdsYisw?=
 =?utf-8?B?dmdrZlJ6SG1mamVOUXJlbWlERXNDL3g2U1JHcjFUOFFHMzRtWEs5TnJUS2k3?=
 =?utf-8?B?MTErY1gxMDFpb3JNdC8vUWQ5cEhSSlpDZ1dWaHIwWVFtR0dVVkN1MUgvNTRm?=
 =?utf-8?B?YWRoVk1NU3psaGg4UEtLZnRpUGEra0ZTa05zb0Y1SnN5ck4ycGthVkxSZ3d4?=
 =?utf-8?B?Y3JuRExhd2FmWUJIdnBobGRHd3gyeFVsYk55L2FEWUd6ZThIeXB6NHBVS0JT?=
 =?utf-8?B?RmNJMjdrYklncER0VGk5NDBCUTBTNjZwMUlDRUJ1OG9WZ1hCY0JBNzlVOHFY?=
 =?utf-8?B?bXlsdFZEemNZTkJmVGUyQm5qdTZvTTRSUVlnRC9CTm9ybmdEZlNaejhKUDNY?=
 =?utf-8?B?VFpnQUd2aFRQNDNaK1AzN0Zid2hLWCtOc0NMQ0FINWpQRDRnQm1hZk5teUJ6?=
 =?utf-8?B?UzVHQnUzZ3NhYkV4MThaSnE2M3ZEMnhFSVdFQWh2NllNM2FuQ0ZMdmdJQzd5?=
 =?utf-8?B?VU5TY0ZMZWNUY1QzM2dGZ0ZqUEpyUzJleE1ab0dKY2gvbjZGRm9uSnNHMXRU?=
 =?utf-8?B?NEJaUkl1L1M0SFJTRWJJZHBlTG5vclVadUh6YzVmejVrZnpUOUJVcytKREQv?=
 =?utf-8?B?V1BEeUZWdWJIOW93WElneU1OSDRRNUxHMG5WVDA5NEUxdHhKMnBBMkhGZUFl?=
 =?utf-8?B?eFh4ZmlKMjZTUWZ2WEF3SnBzVVVaVTV2emJ5bGJCcVJPSjZBUHFNQlhNVG8x?=
 =?utf-8?B?M0NyWE9McmI4VDVmanhZV1gzZng0WFlQeXQ0Mm91bkd1NjQraEwxaC9sbFNQ?=
 =?utf-8?B?RmorU0dzOGVjUnVkY3VVUWhvMWc5dW5nbG0rMk5NNW9jT1IyRitvbjJFQzZU?=
 =?utf-8?B?dlBnUldsdTdNREpHRVBhaVp5TTZaVG9ndENXQXlEeGk3T25aV1BVa1lhbzho?=
 =?utf-8?B?UDZPZ0NJMnJBeXpYVFBrT1lscHRmajNKUGxzLzhhSFFIU2xHZlhla3NFTkx2?=
 =?utf-8?B?aDVaaWxRTm5NeTBXdDBCbnhlK1E2NVRjelZMUCs0WDBTWDlGRWNkMGNYdE1i?=
 =?utf-8?B?TTNsL2R4YWxRVTdDTVVoN00zREJUMHVTanBoNmlyY0lLVWp2YlZmUzAvUENa?=
 =?utf-8?B?bVo1Qkc5YndjWDkwdjI3WUFwUUxkS1JGamhCbm5YQU5oMWdMeDArU1NUS055?=
 =?utf-8?B?R0NPdXMwTnZvWlA5UWladWl1WlZ4aG0vQmQ3QUFGYVk2U2Q1WnNRNk4vWjAy?=
 =?utf-8?B?Q1hkZTE3cS9yQ3NCemN5WUF5NUFlSkdMd0h3LzdMKzVzOENlcmk0UWcwc1FW?=
 =?utf-8?B?SlhKT1hkV3g3cDNpem1kYUlYbnV1RDlNK21XU0NjRlNHZkpQMmJnZ3ZRRlJs?=
 =?utf-8?B?WXBqOFE5UFVabnRqc1VkMEcyRGZWK05UOW1zT1dUZ1pja1Bkby9DNVc3TGhV?=
 =?utf-8?B?TURXeVVzWVJ5WHFEZFdrV2Q0YUZnblNvckdIVXAwcUZ1MGJ2MzJGVEpSQm9y?=
 =?utf-8?B?Sy9lYm4wR0tXdzVLamxhTHhvNG9WMS8ySk9UQXRwSlJLUHc2WGdQdEFRVW5x?=
 =?utf-8?B?c2lNbUxiNXM4SVo3RW0vTUQ2YlB4UFJyOHY0L3lTSzIzZlJLM0k4bHArMERY?=
 =?utf-8?B?ZzBaZmRXblJKTnZmWUhJMjhITjZ0TG5PaHRBaVhlR0ZSeG5yeFZsa0sxaVpo?=
 =?utf-8?B?cnhFVHIzdys0aDk1bGVMSG9JNXN5eklPY0U1ZkZrck5ZSFAvclo5WXg3WHFx?=
 =?utf-8?B?RG04TkF3SUl6Z2hEZy9veUE3djhwUFB0a2s5SVhGQUVNSFVDYWRuYzkrTTRh?=
 =?utf-8?B?VkVFTmN4cVFHWUQyMEdlYmVDa25DTXFEcUVoOHJGb09CTVdYRnV5UFlBWTls?=
 =?utf-8?B?UXMvcGNQb2hCbGVUUnpubmZYb1UwS05lTmJtY2NIOGh6OWQrb3Q0dDlVR2FD?=
 =?utf-8?B?dldOaWhSNE9FSEpPdG1BM1JzZEg1ajRiVnpQcSttUkRqZVZZOFZmTlgvZUw1?=
 =?utf-8?B?R0F0T0ljdnRIbzZBdGZoYWJyTlliTkxTUUk5Smd3ZnFYUjFRY2dCOW0xMUJH?=
 =?utf-8?Q?4uG42b?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR12MB6526.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(38070700021); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?U05jNEN3OXBvMFhocnpIcDNoZXp5QlR2WkZNWVpOMmZOQjRkdlpsNk1xT1Bp?=
 =?utf-8?B?b2hkUE9lc2hKaDAwUjkydjVodTJNT2R2L3BiRlF4STlyWlZkbEp4dUlpYytr?=
 =?utf-8?B?YkZydktvbnVPUVQ5NE9GUXFxeVN2ZHdQV3dNZGMzdmxnMzVQdExteUdFZklC?=
 =?utf-8?B?d0ttTXpGaVBndDh1YkxpS1RLUWZnT0VqSzJKcHZFei9wQkJaUU9hNnYrZHJu?=
 =?utf-8?B?NC9ocUR5V21oNGpzazRrUTFraHlDelpFazY1UDdVZ2VXVStqTEZRckxodTQ5?=
 =?utf-8?B?N1RUeFJ5YklnRjFUaDAwOHk5QW5ucm1jdzIyTDhJQ2lBT1djUXg1a01tZDUy?=
 =?utf-8?B?a2dkMGpFRlE2dWtGbll6QjB6eWVCcTBYbnNBMWtWdnBDZjJ4NFhyVWE4OCs0?=
 =?utf-8?B?bXdOSlVjT0w2QjRXOVphd1pwSU5rUUxuQWNnamNDR1RXZzdTOUZiVlcwN2g3?=
 =?utf-8?B?b3RMVXpYWmFqQkJYdU1hMEtTRXY0TEFDYnFvMnE1TFJKKzliOGRNcHlaYThY?=
 =?utf-8?B?eDJSa1BBOTNSVE5FaTZ0Zyt2ekdOT2tFbElpOTNyUkdyMG5qVEJpZEVRN2Zi?=
 =?utf-8?B?ME1SWE54Y2RhNkdyODVUMDA1Vk9LNlBRODlSLzFpZFlqaXJMcE04MDVqM0pB?=
 =?utf-8?B?MlVzNG9GZFpPSkNsNzRZaEVpS2krMko5SVZFVm5GY2hCc3RuUkVNOVYreW9j?=
 =?utf-8?B?aWtHRXRkNmdIbUhPTzVZL0tQMCttV0c4a29xb3F4dlRmNFozN2t2SnlIdEtr?=
 =?utf-8?B?NXFlaEtocG93blNtTXlsRGFrY0pPU2JoRlovSDZwbldKTW93azhmT1RlT3k0?=
 =?utf-8?B?cUxJaVpQMGxrQ2ZnMlhFMWpsZWl2UnZYQ0xRODU0TTVmTnRFaTUxeDJ0cUNT?=
 =?utf-8?B?R3JMTWRWVGVFNGxDUy93ZU90QjNSdjZPaDVJMW1BUElzSDNLcktPaVNHTy9v?=
 =?utf-8?B?Zm52MytvMHk5YU16UkxZb1BUUmRWckNrKzIyam82eUpCcWdRaDVvc21jVnhm?=
 =?utf-8?B?YUZ0aUVyRmlsYmpveC9rRlBXQ3VLR3RHZEVpUTVEQ0REYUFoL0ExbStVMkNK?=
 =?utf-8?B?STlwQ2R6Uzg0Ly83T0cwRUh5cWszcS9haGhPVVBkZHNtcmYxYmdzRFpVbFB4?=
 =?utf-8?B?OXF4L2YrOTdNNXFIZEFjenZsWHRRelR4ZWJGdkxYdXpxUWphemREKzk1bVo4?=
 =?utf-8?B?S1N3VHdKakE2bUZSYXV1M2ZkeEx1bkVKNU51TVkvSEgxeUE0ODV6WG9NSDQr?=
 =?utf-8?B?enFvNmhzT3F3MnlzMVkzRjl0M2Z2RnJNRVVEbTRjc1pmZzgxeTNWVGlOSWww?=
 =?utf-8?B?dzkwYkdnM1BOS3Z5bFdaSy9yRERVMk1NZHdaWXlaa29hblJuRXFiU0tnYmxH?=
 =?utf-8?B?M3luU2RDbFIveldGcUFLeTBmQ1ZNbjRML1RQd3QweU1hbDlwbzlXWmFzbWt4?=
 =?utf-8?B?TllOMzRwZlBzQWhVb0hPZHFYdHBSK0Y4NFgyOUxBNnVmMitJZWlWem9PUTgx?=
 =?utf-8?B?bEsvRjVLc2pFTDk3clVLcFpNUzFKb3VXSC84cjh3VE5RV1hzMFJPUm1ZNFNL?=
 =?utf-8?B?THBnUjJJK1dqT2RSQjdNV2lYTnpsL04zSFloU2J3ZFZMTTMrVUhtU2VpYUda?=
 =?utf-8?B?a0FLVDhnZG92N2NUVEpOcWRzQWk1Qm9lWkY2UFdaOFlTSHJsL1ZpZy9kL3J0?=
 =?utf-8?B?aXhKbkJtYjJ4MEpBNUFTVjNOVjFPR2J6RS9hS0VuNGlJamdmOVl2b2VHOUU1?=
 =?utf-8?B?TENTZ1JWa2VMR3NTVmxFenFSdjlXWGdTZ1ZvaHpXVVNHcUh5RUp0Z2Z4cU9h?=
 =?utf-8?B?N2xrTS9JZ1YrYXRNd1dMSFE1NFo5Skw4Rk1mWUJ2RU55amRSV1ptQ05rUzVi?=
 =?utf-8?B?djVCbXM5QjVFVDdYeFUxQ1E4WlFmb2krVDdIOGgyaWVrQmJ1U01jT0JrYTdy?=
 =?utf-8?B?R1BJcXZicThOY3VNdGUyallnaWhGWTJkNE56MmNCclpoN1piSzExYkpPR0hZ?=
 =?utf-8?B?Sk5kNFRycEpub09Td3dJUjJLZnU1dTZ6N1dGQzBCNk1tM1dyL2kzUEQvS09j?=
 =?utf-8?B?MnFwcllHQStLdmV2cDhQK1hPUytlcFB0Q3BtYkdJVVFJaDk2a3o3cGlFRzZW?=
 =?utf-8?Q?kJMgcLZt6R+A/8yhz08XUMf8n?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <E064A130982E8E4ABC5593670FED80CF@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY5PR12MB6526.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ffefc78b-83ce-4e74-5e8d-08de1fa75547
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Nov 2025 15:47:48.2957 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: gVsvONjaq885ydSOtpl9Rs7IOH9nLHKDLN/qaIog3yYkI/6/4miMeel4TK62ZIhSBIegGzLq+ATAlUvfdpAopw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY1PR12MB8446
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

T24gU3VuLCAyMDI1LTExLTA5IGF0IDE2OjE5ICsxMDAwLCBEYXZpZCBBaXJsaWUgd3JvdGU6DQo+
IFNvIHRoaXMgY2F1c2VkIGEgcmVncmVzc2lvbiwgYmVjYXVzZSB0aGUgc3lzbWVtIGZsdXNoIHBh
Z2UgaGFzIHRvIGJlDQo+IGluc2lkZSA0MCBiaXRzLg0KPiANCj4gbG9vayBpbiBvcGVucm06DQo+
IHNyYy9udmlkaWEvc3JjL2tlcm5lbC9ncHUvbWVtX3N5cy9hcmNoL21heHdlbGwva2Vybl9tZW1f
c3lzX2dtMTA3LmM6a21lbXN5c0luaXRGbHVzaFN5c21lbUJ1ZmYNCj4gZXJfR00xMDcNCj4gDQo+
IFRoZSBwcm9wIGRyaXZlciB0cmllcyB0byB1c2UgR0ZQX0RNQTMyLCB0aGVuIHVzZSA0MCBiaXRz
IGFuZCB0aGUgY29kZQ0KPiBpcyBhbGwgaG9ycmlibGUuIEl0J3MgcHJvYmFibHkgZmluZSBmb3Ig
dXNlIHRvIGp1c3Qgc2V0IHRoZSBkbWFfYml0cw0KPiB0byA0MCBoZXJlIGJlZm9yZSBhbmQgdGhl
biB0aGUgZnVsbCByYW5nZSBhZnRlci4NCg0KT2ssIEknbGwgcG9zdCBhIG5ldyBwYXRjaCBvbiBN
b25kYXkuICBUaGFua3MgZm9yIGNhdGNoaW5nIHRoaXMsIEknbSBzb3JyeSB5b3UgaGFkIHRvIHJl
dmVydCBpdC4NCg==
