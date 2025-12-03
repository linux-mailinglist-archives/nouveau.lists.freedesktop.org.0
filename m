Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 38DD3C9D732
	for <lists+nouveau@lfdr.de>; Wed, 03 Dec 2025 01:43:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 17F5710E6C7;
	Wed,  3 Dec 2025 00:43:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="WpPsXvQe";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from SN4PR2101CU001.outbound.protection.outlook.com
 (mail-southcentralusazon11012003.outbound.protection.outlook.com
 [40.93.195.3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 295F810E695
 for <nouveau@lists.freedesktop.org>; Wed,  3 Dec 2025 00:43:27 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TrvFXOYe1sglXbOMgPedg4FasdiNm4NijMZt6/NhyYPR+kGLJj/WMJ6gnBF2KImIeVf61a1xkY11nKEr68/5gNlrnBuS1nAkkxHj64AJHIsOfzS6QCuROb5wZnIRzxMq9pP6v3HUGoFt7iEeRIoylMpwk2UmJ3gr9aN9HSF2qQXEBRzFkM2trSMHO5zxKNfXeKhivMqb7UbZik7WsyN57WVQ2CeK+0JV2g/3FhUr2XrRjvoc5Ioz2oauItpbCnm0OZXduWSW6LazAVN6JFzdseMokkVNtJclLVCt07l8y4yWMoxQZffYYAG/vPO1jiCxnRjI2jPGMfD7fNxfzPoWRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DY4CpxyEfRgxO7P/U1AxHxZjsVifrBm5IGDiC1DzQaQ=;
 b=bfeQb1BvSCHyxyC6S/W0jSAPStYPRGm7j2esHndgYkqtOhoxtzreGVUrQiWbmWIT8umOOeFWXpg5yV/f/TCYgASFBi7VD7S3+ytJdP3Ulud7S9dcs1d6c5TuPkOXxSDHjVhjvF4CB4B0qF7e2PverCDcGtGYH8UhAnR4qO/8i9mpXasfu69gj6GF2dXIfZVyTuisN3oXbVfqiVSNUYohuqAYjn8IA946etSait/dwB/Tkp0KpSJUo25uGUfSmGOQFw4gZ7gLS0jMNkBVi3dWf/VOtx3KqBiUx8dWLDfBhtlRL9QBWhCJpOlUN93jAO8FxaiKiMEmjURqcI3zRGq8yg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DY4CpxyEfRgxO7P/U1AxHxZjsVifrBm5IGDiC1DzQaQ=;
 b=WpPsXvQeKtUihud80LknMT5C7R8MeMtrtpWHHs3wO/Sq5NGMNzSeaNLg661VbFhbogPF+HJi5w0LwQgwzgK8Bh9Y/rSaii4X4okQHhTuqm7xXRoTD30C8ahC6dHuU22RacfzB/96soJ/7FG5fyvLZiP1R53W7eDs1lu4Xu7HgdXMS29TERGDYt1yODxtHGiuYZAOc8qrKwMZOhTrbKgzU6i/1QWOSZtlzt9wXpkMcQvfR5RgzutLOl+g5PUqYLnxrqCIc0x4A+pQPR0K9XX2Ptm0RhgwTGg58t0qibVminZKd+rUcL0hWsVFShO5uQ4tViTSb3jxSonl2Siz6Yebrg==
Received: from SJ2PR12MB7943.namprd12.prod.outlook.com (2603:10b6:a03:4c8::10)
 by IA1PR12MB7663.namprd12.prod.outlook.com (2603:10b6:208:424::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.17; Wed, 3 Dec
 2025 00:42:10 +0000
Received: from SJ2PR12MB7943.namprd12.prod.outlook.com
 ([fe80::6a18:df97:8d1a:5d50]) by SJ2PR12MB7943.namprd12.prod.outlook.com
 ([fe80::6a18:df97:8d1a:5d50%4]) with mapi id 15.20.9366.012; Wed, 3 Dec 2025
 00:42:09 +0000
From: Timur Tabi <ttabi@nvidia.com>
To: "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>, Joel
 Fernandes <joelagnelf@nvidia.com>, "dakr@kernel.org" <dakr@kernel.org>,
 "lyude@redhat.com" <lyude@redhat.com>, Alexandre Courbot
 <acourbot@nvidia.com>, John Hubbard <jhubbard@nvidia.com>,
 "rust-for-linux@vger.kernel.org" <rust-for-linux@vger.kernel.org>
Subject: Re: [PATCH v2 12/13] gpu: nova-core: add PIO support for loading
 firmware images
Thread-Topic: [PATCH v2 12/13] gpu: nova-core: add PIO support for loading
 firmware images
Thread-Index: AQHcYxwHBSave/ae9k2hA2nYTiWDUbUO3YEAgAAYngCAAAgoAIAABaoAgAACDwCAAA0dAIAAAfqA
Date: Wed, 3 Dec 2025 00:42:09 +0000
Message-ID: <5f107927d9ee9dcc1ef02fd09f5e2e5ece3f13fa.camel@nvidia.com>
References: <20251201233922.27218-1-ttabi@nvidia.com>
 <20251201233922.27218-13-ttabi@nvidia.com>
 <581a1e44-e6a7-4ce1-8254-a92392d80cbd@nvidia.com>
 <aba0e260e8a2909c3c66a1aca07574c9192b0dbd.camel@nvidia.com>
 <cec4c58a-cdfa-4bf9-8d0e-7c47d8232697@nvidia.com>
 <df1e24cf-6983-4d17-8652-15adca8281ea@nvidia.com>
 <44986645d9ecb62887f8d3506533d4ef369af69a.camel@nvidia.com>
 <d94e68d7-84a7-4540-8de8-5f163d22d763@nvidia.com>
In-Reply-To: <d94e68d7-84a7-4540-8de8-5f163d22d763@nvidia.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.52.3-0ubuntu1.1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ2PR12MB7943:EE_|IA1PR12MB7663:EE_
x-ms-office365-filtering-correlation-id: 15514562-5362-4d4b-9857-08de3204cadc
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|376014|366016|1800799024|38070700021;
x-microsoft-antispam-message-info: =?utf-8?B?YjR3aTVTREF3Ry85WFVCVi80RkhTZ1dPUC9OSXpuRWlxMU5NL3JQZS92Nld2?=
 =?utf-8?B?VkZXR01wcjVWSlNtMWduWitXSWszSVAyeTZqMmZwWDRvMlkxV3BkTHI3QlBT?=
 =?utf-8?B?RVNYRTg2b0pXa2RiTlV5UEtzdXJjM0tiaXcwb0F1OFFLSlFwbEwrQ2xvMHAy?=
 =?utf-8?B?WjFPNzViMnFlb1RHemllb1d3TEFyUWo3QWhqT2NMTmdjczNZejVQdVlDZGsr?=
 =?utf-8?B?WDlYK2gyR2pSQXFBVklWcDRXZXhTSkQyam13UG1IbkUzcjU4dGxCN1lhMCt2?=
 =?utf-8?B?U1JIV2Z1Vy8zeGlLUE1OUjVZZUoyMzVXd0RINVI4WUNHTlIrL1dYYXZuU2l4?=
 =?utf-8?B?NSt6V2E1ZTJ1Rk5hY3R1MHJNSUFOWTJVUFg4RDZyczBoUGM4ODlHREdLd1dX?=
 =?utf-8?B?S0IxSGlJdGluRGlaR1VJRExsVTROWlJSQThvaVdUbjhWajNKQ1hJNXNtTERH?=
 =?utf-8?B?UzJMVXZHSnRzZGw1UzB3UVVvcHgySmpERUVKZEU5Ui9KNjdsbmtjZVdhNlZl?=
 =?utf-8?B?WEQ3ODZBWE1jOUtxd1JoV2ZDUktScldWWmdTaWh2NGJvVE42TDVqeHdHUGdU?=
 =?utf-8?B?ZGRya2w2RG1GZWVUYjdSOVR0VWxoUGhIQ3JnUm1RRWFNWVZiaktaTnh0SnJS?=
 =?utf-8?B?RDJTL29wRmpXYWVjd1hFT0o0R3U3eml4elJrMmxhLzJ4dW5jQzFrWUVWb1U5?=
 =?utf-8?B?aTFad1hxOXR3c3FMVmdlb2ZUSHVuRzZ2eklHczFTZFhwSU5kc1VZeFFWOW9y?=
 =?utf-8?B?MlptTUhVd29ZT0JNbnJUaE9YaVRsM2cxKzg4d2hDV0xvVTdCbWdSZzlUa0kw?=
 =?utf-8?B?MWczV2RwaVhBNlY2TEFkMW1UaExrRy9QYjNpelRGdEk1a2EzQU5iZk5oZ0FQ?=
 =?utf-8?B?Q2VSRVZ5d29IdUlYK2RZMWljY0Frc3FZOEJXN0pPTVEvb0tCWGhvUmJrOTZk?=
 =?utf-8?B?WmE3TXoxeityVXo4R3EzNmtaY0EwQ216K1FQZU1vbTQycUk1QW5WOEJIcmVN?=
 =?utf-8?B?NEZlS1htWkVEYmNPbHhheDk3YkhxRXVLSjZGcSticnFieFZ6Sytvb2RCYmlN?=
 =?utf-8?B?ZlRmd2IxK1F5eitiYTRYNmE3YVJEYzQwN3d5NkhkYUIvMmhWQWRZVUQ0WkFj?=
 =?utf-8?B?bzlORU9nMkxGdnpYQ3ZxamNJWnFSU1QraHFUNm5peCtSNHpmSHRxN0I4eXhy?=
 =?utf-8?B?SzJVYVFNbGJrY0xSOTVldjl1dHliT2dHUGhybDUxVGl5d2FLN2RZa1A4eDZN?=
 =?utf-8?B?MVN5TjZnWW8vVzc5eXFxbEdUWDBvbjRxYnhmWXMvQkNzQ2hPNFFxSG5jalVB?=
 =?utf-8?B?cHB1eG5sN3JjVk9pcVdPOWhWOXYxRGwwRUVGU0dNVjJPcTA4RUlpajhYU2Fr?=
 =?utf-8?B?YjJwZzUrUHdLMk9rRUpUUkNQUW5JSW1OQUYwVVBOL3FSNnZRSDBhOVJRVTVL?=
 =?utf-8?B?UitIZ2dhd1NGd3JhZTBUTlZFNk5TTjdkWFNyc1BFbzM1NjVDOGhiNjVSTkFw?=
 =?utf-8?B?QjZFdjVUZ3lWWkc0ZktzcWFNWDY0aElkdXltQ2s3Rno4VmsrNFhTaHRPbGhn?=
 =?utf-8?B?bGhacHlZMjd3enRHNzZoREFIUlNvWitsZHJ0dzJOSmpqTXkwcHBkdzJmYXc5?=
 =?utf-8?B?dXZEOWU1QnlrNEhPK2ZaOGlydlRWWEYxM2JtcEJFS2xLL2x4Y0Jtczd4cUVR?=
 =?utf-8?B?U0dXRXRkUVNGV3Q4Y2Y2NGJJRlcrRlRlZDYvNG85Q0x5Z0VVVldENDYxbWE2?=
 =?utf-8?B?ZTZDQmZHM2NCOW5waEwxbmpIQTEyVnB3QU05RUFaWkZ2Y0QzNktxZG44YlhC?=
 =?utf-8?B?N1ZGdFJ0YTZMZUF6ZUZ5YWNsdzF2ZDhlenZmSEdYVlFjUDlhanlEZk11YnRN?=
 =?utf-8?B?b0tQbGZ6RHBuWE9tdmNQdjVmSzBnbGF0L2UxSWs1VlFJZUpIcXdZZHEzRVNI?=
 =?utf-8?B?RHNyMEl2bDNaMnhtRG5HY3NjYnJ3c1ZQM01PTWVRVTNVVmlmWDZJOXhvVDlu?=
 =?utf-8?B?K2wxMzdCWnFPU3FmcEZhWkl4NWZ5Uk1vNHRYamZsRGxxSkluUzlVOFNGb2tV?=
 =?utf-8?Q?28a7L5?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ2PR12MB7943.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(38070700021); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?QXRKdTBZZlpiaGRaRVZDRTlpVVdIdTR0VzJKeVhlWlJXMGp6dlhVbThLUnMw?=
 =?utf-8?B?UWZDSnQ1R2o5Z0N4Z3gyUFNxRXlYZGVYSDBJUlI3bmNBeTBqdlRlVWZmaXFK?=
 =?utf-8?B?aDUvNklDZXNtQy8vQXZHaDFVVms3T0xuY3BsTE5USUI2MXpDRWZQakJBSFRV?=
 =?utf-8?B?bkRTeUpLeHhNbkJWODM3UGthVkIzbDM3cXFYZFBITllWWVBMYkVCTDJVT3VY?=
 =?utf-8?B?azRxeDVCK081ZHZtUG41aFB5ZXFqZXkvVVd0YkpuZHB5ZEFhdnczUDVpSzRG?=
 =?utf-8?B?ZHFuaGRiUTJwWElTUFljSlpQeXYvVWRYcTNvSk05ZWpvbkVheXVpbCtZa0NL?=
 =?utf-8?B?cUJxOWVSWTk1ektOckRUUzNodlBSS1FkSFJIR2hBNEJDdWVxZkVlVURMYXhJ?=
 =?utf-8?B?TWVudFVMT2krd0pTV0RnbTc0ZzdialV6UU5kQ2Y1NlJlQU1QT0lyMEt2b3Jm?=
 =?utf-8?B?SjF6R1lVQmRrZm5UVWJTQmlxdWUwZGQvUVdyZU1LV3Nqb0JRV3NPQS9xZ05D?=
 =?utf-8?B?bzg0RFVhdWNZUEs0WG9iSkFlSlcyUDdqbE81Vm5KekdmanJaRVgyUXVUcGtj?=
 =?utf-8?B?cnpERXEra0NzWE1JWGFDZ05CUERGak5hQTVKTEdvaGQvNXF3M0pVeXFqaVhx?=
 =?utf-8?B?SzViRy84WkorbktNQjN6TlRrSEh4d3h1Q3Z4YjFLMXVnQkV2QWJuem5LRVhY?=
 =?utf-8?B?R1crWkoxTFM4M1pxcGRxVzc1QkFUSllWdEVpN0VwNU15UTM4cUhBeS9JWWhr?=
 =?utf-8?B?U2hYLy93NmpBL3orblhQVGlIVVFYTHl1YW9QNkUwK1dUbE0vMVNJTkhCT09q?=
 =?utf-8?B?aFdPWE1hNjJleUFoTmVjOGhXL1Z2eTNtaEpNL2xpUFdrQmlHdjhoTm1vZmFZ?=
 =?utf-8?B?OU90UGk5N1VCc1RSdEl3T1Y1T0hUSUVJdUp0MmswaVY1eVlOQjU4WHpVZkpJ?=
 =?utf-8?B?VjBVWjVZQmo4KzdqZXBFcjd0OVVndUp6WUY5em5LdjRrbEt2dWFlMHl4emNo?=
 =?utf-8?B?cW1udnFuMnMvOUQydXArRXRNMVN5VTN2cUZLYW1ubWtvOWdHYlJPWGgwTjNl?=
 =?utf-8?B?Q0U5ZUpmVXF4eDl4aHQ0NlVENFVrdjQ1aDU0QWRqb1pNd08yK1JjQW00YjY4?=
 =?utf-8?B?d3B6VzIveXpPRStwMXhTemZKbEZkTjJpV1NYQWV0ZUtsZEZrMkxSaTdCVmU5?=
 =?utf-8?B?NGgxV3V3SXRWRURZVWdEQVp0bmRZM0o3eitVcUxJWHYyMktLRlZSS0FzVXdF?=
 =?utf-8?B?UVhLYUxBRUYzenMwMS9oZWVaazNaWXNUTGUza2xRc012QWdPR2ZSMnpZUzFZ?=
 =?utf-8?B?a2pQQXhCMXdydnZIWFZ4TE1OLzlBZmN1RmY2Snl3Q0p0RTNZb1g0R1IxUUNV?=
 =?utf-8?B?NlhuTUE4M3hvQVhGMVFtRmZVSE9JWXVYdnlRb1gzY21BWDBlKytCMXN0enE2?=
 =?utf-8?B?dVpFRTNpVkN5Rm4rOWRyd2IxZFhpT2RoL1JScG1RNXpnQStoRjBxNEZhWHEx?=
 =?utf-8?B?N1M5V3NhYW1wS3Y4NHNLNzB1bmFwdXJLOUlsUzZtaDFkQ3NJcyt5WGpaNHp5?=
 =?utf-8?B?bnk0emV4SlErNXExRDNCZGk0OTl1TjRIeFdqa0lLWEg3bVM3ZEtJOUFna1Ev?=
 =?utf-8?B?ZkZOZllnc1VhS1l3b3hDYWdjQjZYUkpIU3NDK3FqVkxwT0VlekR6TytFMEQz?=
 =?utf-8?B?aUQwTTlFUEVyejBHVnNNeWhNd2M3dWswN0ZsdjVqVzlhWnFmNkZmank5aERp?=
 =?utf-8?B?L1hQOU4wcUpxUVhjVnEzWm1wSENUK21oT01YanpwNXRYWVd5S2I5bmg5T2RK?=
 =?utf-8?B?bkhrcjU5U0xWdE05VlZzamtXcEVNSGNEMlRCMDN3TGVwUEtsVk1ubllYTG9X?=
 =?utf-8?B?LytUdE5Ib1ZML2J2cC9EWjRiQjBwN2xnTVVIYmZiZFlMRzROODNNbU51blVs?=
 =?utf-8?B?VmYvUUhjZUtGL3M2eldYc01BZW8zUGx3Zk93OUNFbUNZMjhHZmVkeEQ0SXFh?=
 =?utf-8?B?MWMvWVlqMGxlYW5BNmR1eWRoRGV2bXNvQVcrTWxVUTcwN0dPNHFxZzcwcmEy?=
 =?utf-8?B?VVdVTkdZZW1qSzc4YUZ2ZFRPYXhTTzlQcmxLWWs5NzhGY2NJWUsyQUZxTkNQ?=
 =?utf-8?Q?boQHxuhtCcWg8WL6ZlqiZeIgh?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <DC23F6593C3BEF4483B3635640F736B6@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR12MB7943.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 15514562-5362-4d4b-9857-08de3204cadc
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Dec 2025 00:42:09.7418 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 2KDiG+4kuHCOwZjeKRzor+XNnLgsc4o9xjErhpUCwr5GtW90XcKBB/PPXt1Z2xVjKULp4OZE6PcKa0ud31cM4A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB7663
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

T24gVHVlLCAyMDI1LTEyLTAyIGF0IDE2OjM1IC0wODAwLCBKb2huIEh1YmJhcmQgd3JvdGU6DQo+
IMKgwqDCoMKgwqDCoMKgIGZvciBjaHVuayBpbiBkYXRhLmNodW5rc19leGFjdCg0KSB7DQo+IMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqAgLy8gUEFOSUM6IGBjaHVua3NfZXhhY3QoNClgIGd1YXJhbnRl
ZXMgZWFjaCBjaHVuayBpcyBleGFjdGx5IDQgYnl0ZXMuDQo+IMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqAgbGV0IHdvcmQgPSB1MzI6OmZyb21fbGVfYnl0ZXMoY2h1bmsudHJ5X2ludG8oKS51bndyYXAo
KSk7DQo+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgcmVnczo6TlZfUEZBTENPTl9GQUxDT05fRU1F
TV9EQVRBOjpkZWZhdWx0KCkNCj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIC5zZXRf
ZGF0YSh3b3JkKQ0KPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgLndyaXRlKGJhciwg
JkZzcDo6SUQpOw0KPiDCoMKgwqDCoMKgwqDCoCB9DQo+IA0KPiAuLi5idXQgYWN0dWFsbHksIEkg
dGhpbmsgeW91ciB3YXkgaXMgYmV0dGVyLCBiZWNhdXNlIHlvdSBkb24ndCBoYXZlDQo+IGp1c3Qg
anVzdGlmeSBhbiAudW53cmFwKCkuDQo+IA0KPiBXaGF0IGRvIHlvdSB0aGluaz8NCg0KSSBhZ3Jl
ZS4gIEF2b2lkaW5nIHVud3JhcCgpLCBldmVuIHdpdGggYSBjb21tZW50LCBpcyBhbHdheXMgYSBn
b29kIGlkZWEuDQoNCj4gSSBmaWd1cmVkIHlvdSdkIGVuam95IHRoaXMsIGNvbWluZyBhcyBpdCBk
b2VzIGp1c3Qgb25lIGVtYWlsIGFmdGVyIEkNCj4gd3JvdGUgIm5ldmVyIC51bndyYXAoKSIuIGhh
aGEgOikNCg0KSSB0aGluayB5b3VyIGNvZGUgaXMgZWZmZWN0aXZlbHkgaWRlbnRpY2FsIHRvIG1p
bmUsIGV4Y2VwdCB0aGF0IEkgZG9uJ3QgbmVlZCB0aGUgUEFOSUMgY29tbWVudC4gIEkNCnN1c3Bl
Y3QgdGhhdCBpbiBib3RoIGNhc2VzLCB0aGUgY29tcGlsZXIgY2Fubm90IHRlbGwgdGhhdCBlYWNo
IGNodW5rIGlzIGFsd2F5cyA0IGJ5dGVzIGFuZA0KdHJ5X2ludG8oKSB3aWxsIG5ldmVyIHBhbmlj
LiAgSW4gbXkgY2FzZSwgd29yZFszXSBhbHdheXMgZXhpc3RzIGFuZCB3aWxsIG5ldmVyIHBhbmlj
IGVpdGhlci4gIFNvIEknbQ0KZ3Vlc3MgdGhhdCB0aGUgY29tcGlsZXIgd2lsbCBzdGlsbCBlbWl0
IGNvZGUgdG8gY2hlY2sgZm9yIHBhbmljLiAgSSBkb24ndCBrbm93Lg0KDQo=
