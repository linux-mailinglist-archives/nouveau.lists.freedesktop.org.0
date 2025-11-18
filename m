Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BDC7C6A383
	for <lists+nouveau@lfdr.de>; Tue, 18 Nov 2025 16:08:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA25910E4DF;
	Tue, 18 Nov 2025 15:08:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="a5D1VRX5";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from SN4PR2101CU001.outbound.protection.outlook.com
 (mail-southcentralusazon11012007.outbound.protection.outlook.com
 [40.93.195.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 13B2310E4DF;
 Tue, 18 Nov 2025 15:08:06 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=j6LuVHW9aO5jtSntTOe1EE2Xm7jgNYDqsmh/KpP17O2EL632lBDxjDoz3C3FUEIljHszQjBlf8YUHKPkUtjHjOk0CnzTIxHPsE2eBO2Tiu1AoZr9UMd7cltpHtssKaUiuV1aXJ7/5AMvSFhXgUx35B021nV91Ae26EC6h3yPmfssJw8bbOY620HnL9qG1K+zcPtq9gniuhy2PlHzmFP/0jKmPYg9LcMyrMwMYF4vP/ZwgD0/3teECJdKnMaa4o/N8H3jgam+6xE+UZUvytZZCSKKAseG6j7waKD48/pxS/XxIlq5WIFSi3rsvJ7Jaxy2MZDRHrbDKjDb2m1sVg4e3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ngHGjF3FONVbdn5dZRGhD1lYBVUxr1ySvQb/J+WGE/U=;
 b=yY2AGHMb5KAkMlQ57ROZZp2P/PolUSHRTZUwbnppyR7qx9lUNJzO2A6Bgrkb75zolXQw8hWAhWRiqiy4h25xuUVH7Qsm6yQOH9ItmDYDz8MeCBJoP53t7+0mi4ZVuX1FNCEAAoHZ7HP0VIhGTGBapGPbYiCbaFKkx0scKdeRxSF3KgopX1tUtrFgRpOgspjp1aDPJgQr1WPR1OAo2s5XIlYmhpK7bnkVV6eLOTZtNf4i5iCTad9VkJT1Y+9KvrQxpJrvolOAd4s9IRRKngIoNXlZisuP6B17X8g4uAhG86OKUOTUC0msBMhWXug08fWXDSZJWHzO0RIO92KZSIeytQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ngHGjF3FONVbdn5dZRGhD1lYBVUxr1ySvQb/J+WGE/U=;
 b=a5D1VRX5pWkB+yJCutJ6SdFgVC2J7S4fTGuubYM/wXHgzI/RgAKt8ipu0W3HrBMkeuXWNGjX68gTRF6gG9JOaFm9RLHQUXCUGXFcFbDjMdBF/Xg+56NAVVH7tbUE2J5+7CeOjrh+0VIJY096+xsLth7iJVc3cGU6RGajIfhBMaMfdgdViSsYmbMMQ/PPpgrqqmi0OzM+BCE8Br3W76DzyCbh6c7rJt8YIZBwyQshdhanFUMwETYQEcWKitN2EIq0Tt6jkSsN5GaQwx/Ylygm273gi+NQR/1YCIO2wPuMx+Rjr6k1yNw+mEpOCoIWNWSlmEqAfcr0Ggluq3CrdCEXXw==
Received: from SJ2PR12MB7943.namprd12.prod.outlook.com (2603:10b6:a03:4c8::10)
 by PH8PR12MB8605.namprd12.prod.outlook.com (2603:10b6:510:1cc::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.17; Tue, 18 Nov
 2025 15:08:02 +0000
Received: from SJ2PR12MB7943.namprd12.prod.outlook.com
 ([fe80::6a18:df97:8d1a:5d50]) by SJ2PR12MB7943.namprd12.prod.outlook.com
 ([fe80::6a18:df97:8d1a:5d50%4]) with mapi id 15.20.9343.009; Tue, 18 Nov 2025
 15:08:01 +0000
From: Timur Tabi <ttabi@nvidia.com>
To: Alexandre Courbot <acourbot@nvidia.com>, Joel Fernandes
 <joelagnelf@nvidia.com>
CC: "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>,
 "dakr@kernel.org" <dakr@kernel.org>, "lyude@redhat.com" <lyude@redhat.com>,
 "nouveau-bounces@lists.freedesktop.org"
 <nouveau-bounces@lists.freedesktop.org>, John Hubbard <jhubbard@nvidia.com>,
 "rust-for-linux@vger.kernel.org" <rust-for-linux@vger.kernel.org>
Subject: Re: [PATCH 09/11] gpu: nova-core: add FalconUCodeDescV2 support
Thread-Topic: [PATCH 09/11] gpu: nova-core: add FalconUCodeDescV2 support
Thread-Index: AQHcVb7LsaijBVjUPUaIfyiPONlf3rT3gzwAgADpIwCAACJlAA==
Date: Tue, 18 Nov 2025 15:08:01 +0000
Message-ID: <7246f7239cef8a3e7dc6d3ca8ec9336821e88e6e.camel@nvidia.com>
References: <20251114233045.2512853-1-ttabi@nvidia.com>
 <20251114233045.2512853-10-ttabi@nvidia.com>
 <20251117231028.GA1095236@joelbox2> <DEBUBWW4AF8H.S54ZKX607FND@nvidia.com>
In-Reply-To: <DEBUBWW4AF8H.S54ZKX607FND@nvidia.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.56.2-4 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ2PR12MB7943:EE_|PH8PR12MB8605:EE_
x-ms-office365-filtering-correlation-id: 8a9b76f5-9004-4dfd-239d-08de26b44467
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|376014|366016|1800799024|38070700021;
x-microsoft-antispam-message-info: =?utf-8?B?TXBhUXVnUTNOZUg4MEN6ZHlKNmNWQTRJUmJTREFHV0IwZWYyclVlcVBpZEFR?=
 =?utf-8?B?Rzc3b0xuWDdpbVFESmhSa3pPdFhtSnVQd2JyZmlTbmFuQUFJWmpMM2R3UDYr?=
 =?utf-8?B?TnNFNGxRdkNNZG5ZS3RYV09XVWNDR3dvS05DajJ1VUpDek5QemU0ZkxuRUVr?=
 =?utf-8?B?bjdZbHNiZTU5S3dxREhpTVVyNU1WN1lrUXpCSTFLZlAwaUlFclhiL2xJUTN4?=
 =?utf-8?B?bC9obWI3K3MxU1d4bVpwTVlNdXI0TTlXUUJlTGpPcXdrMUd6bkFmcUtwZmpD?=
 =?utf-8?B?aENUV2tTK0VVQnRiTllWc2JUaUhSY1Nzb25seVVkMTh2WGdsbkQvNmZpUDl1?=
 =?utf-8?B?dUxTd3lwUUlOc0ZZa3RPdXExQkdGNnFvY0RIRWlya1BLWkNZbGRLUy9PazZO?=
 =?utf-8?B?UXlSVnR3eFAybHY1Qk12dWVNRy9pYjhTRUhxWFZhZkIzQVR0VEZtc2hxQ0t1?=
 =?utf-8?B?eXNxOHJGckJIdDJEZ1p0cldTaXN5dWsrb2kzbWZBdkJ6N0gxZW52a1VOY1M3?=
 =?utf-8?B?WExxZUtzVWJmMXkxY2o3ZDJ5RzlJMGpDUENwQ2poM2x5VDNUVlRJZ0NJcXZF?=
 =?utf-8?B?VHUwWlVuOFpZbDF6U29wbzhIWFpNS3FnbHAxYTEwUnR6OFdjcm5kaVk2T1hZ?=
 =?utf-8?B?c1dlZWVxbUdGbHlGbjRiQTJramFxdnJMSXJDUW52SkpsNGpkUmc5Wm9xSFZD?=
 =?utf-8?B?ayt6UC9rYVdkaEZyRUdjOXpsYWRJMHV6SWM1YytUbzVobXhlNXhWQmJyRnc5?=
 =?utf-8?B?djNhOGRFeGJkenQ4b3p0N09uWUJQUXBPTVljVUpDOVRnS3g5WXdvVFlNSWhl?=
 =?utf-8?B?YjBGMmpLd2NuWDcvNWJ5T2tkWkNxL1lZcWF4aFArSzlSRUJTV2pTd1ZLeGRL?=
 =?utf-8?B?SFNmeHppY2pqQTE3MVlqNXE3MEZYanNQZ3Z1dU4vb1cwZGtVNmtFNzJXbERV?=
 =?utf-8?B?MTdYVFBZWERycVlTZVRpM0Jta001TWgzeC8xVUVEZXBrb2xlVHF3cElERitk?=
 =?utf-8?B?cktCU3V0cnY2ZXRZK0c5Znc0ZEpyVFlpS283WUJiak5pWVFMM29qZHFxWFFK?=
 =?utf-8?B?Wm5Jdm5MY3JDUFFCYjJMdUlwSmVLbmdlYmhxMi9EQVBNdlRjeFNLTmFzRFBV?=
 =?utf-8?B?SnFlU0loT2xKZUM5MkR4Nmg4aHErQWtrSmRTMjc3UVFsYVhVUXpIQUY0SG1W?=
 =?utf-8?B?Y2wzdi8zQTRQYzg2bEV2R2JZa3pwaTBIaFkyclJaMVhuKzdDNzZ5TEVZUktr?=
 =?utf-8?B?TVBJVlA2aHJGeUdidEpWeVBXSGI0NVdXZjV6OFdTSHBzLzJabVhYK2RvOTl6?=
 =?utf-8?B?VysycDhETkwzVHdOQVNoTzAxMndnNEtJUGdDKzNQTVMvc1VaVjJvMituSmtu?=
 =?utf-8?B?eXFqUUhDYi82S0paUER0ZFo0Tk4xb3F4YkRhZmJ3M0pNL3lRM2Q1L3lST0lJ?=
 =?utf-8?B?Tlltb1BLMnBhNzRJQ1lGVUNsTFZXOVNHOElnaC9sMXZxbWMyRHdDOWJmemhs?=
 =?utf-8?B?SVVtWUlYcnNDM3g5VHdGNGd6VGpPTTQ1QVAvY283REw4NFJlR05UWGhQdDBp?=
 =?utf-8?B?TzVnVlpSQ2l5VU1NblpqcFFCVUFFTnVHK1hkaGZ6UUMvanYzUVk5K0VsUGlT?=
 =?utf-8?B?YkJObU5XOTlsZjJUQ2lONnNuQ3d4cEo5Y0czK2JXcVhvenRXZmExbzRiN281?=
 =?utf-8?B?R0p4SHVkMVk0ZGdVZVFraDFjK3BzdnpySkYrMDYyZmRBeTlPUGM4bnhzdkZk?=
 =?utf-8?B?QkxsSnFweWRLT3B2OXNIMXhRZytYTkdseTcyUlZaWkZEczNNNHFNZ0ZNdHJZ?=
 =?utf-8?B?ZmtNTkczUGpFcW5MT3hST0RERUo2SHNwalNCMTRwdlZOanl1Qk5iQ2xnekpC?=
 =?utf-8?B?OWVEbXhFWjV3dmMwSk0vUjZHUEhxcG5LZDJUUmFkWjFzcXh5ZHBUazllQUdp?=
 =?utf-8?B?Vml4ai90aFdiUGV3Tm41UGlsQWJXSUh0ekFTS0tUY3d3RWxNTUVhN3YySkpl?=
 =?utf-8?B?Yis0WG9pS0VBOXQ4azJTUUUyYTVtZUtSaWxaZDBLekk1b0JSOGhkdWxxUVN3?=
 =?utf-8?Q?At3Uwj?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ2PR12MB7943.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(38070700021); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?NkdRUnBkVHZPWDBCcEJScm92ZEwwMldQTmpGWkswNmlMVk1Xb1duTDYzalZu?=
 =?utf-8?B?MHZwWm1KQTE3YkplK2g2UEpPeXBhMkNqbUc1M3lsanZzZEtwOVZ2bjRhV0Zj?=
 =?utf-8?B?RWFBZzNTbUpCVnRZNmNWRUltc0hYUkRaRWxlWGdEczVzeXV1ZXdDTHphWlM0?=
 =?utf-8?B?Q0tRZkhmTHlRQlBqR0R5WG1CbDdxdTQzYTlOSGFkKzNoaFFVM1JTQzBqZlpS?=
 =?utf-8?B?NzllbjFoUElVRDh0SDh3R0Y0WTB4MlNvdW4vTkJ3bnpsek9TbnRaVW9OUXVx?=
 =?utf-8?B?clQ5ak1WS0FNejVpM09rUXFkR0YwZnlCZ2VtcW5xVWNqTjdRMXhleDQ2Wmp0?=
 =?utf-8?B?SlpIUlNZYkFQQmRrZXdiWm1jRGdwNytLVWs2b3dCZ09RT21uWmN5czBlc0dO?=
 =?utf-8?B?bW8rYjZWTVN0VXhKVFFlVUE1MVNqUzVYRXhMemRvN1ptRmpaTjhoS05FT1Jn?=
 =?utf-8?B?QTRuWVphSU9UODBvQ2Q5YUIvYWFSdEVhV1dwQklPUUQxMHRIMEtoN0o3K0RU?=
 =?utf-8?B?UU9tNXRIS1pSUG1WOEpHK0xyKzR3cmlFR245SGFlamQwalcrN29mcDZsMXd3?=
 =?utf-8?B?N3NtdUFEb1dnaGlaSlR2QVlVRkk2cERqRURSVkVITTc0MEJUY25NaUxNUmhl?=
 =?utf-8?B?WjA3TytjQlZHcS9QYisxTlFIM2gxMHVBWDJ6cWpGaDl6T3NUSGVsTU1xSk5P?=
 =?utf-8?B?VzE5a3pTOGtNMG1YS2wzM2pXYkhRTmtWcTVzT25pdmRMKzVxVGIzNXRHRXk3?=
 =?utf-8?B?NDFKWjdXTTJ1eFR4Zzh1TGhicVZiSnptRWpqaFJjckhoeDJkaDg3TDQ1RllU?=
 =?utf-8?B?cXhRYi91d1RRTlpFZnBDcDlFaDA2Zkd4dkZiQWpuZGY4dmRWTVRzOUtFSzkv?=
 =?utf-8?B?NVdQMWVCV0l1QjNhdVFMaHJxUzJxTVA2d3Z6emZNWHRZWWx6dk1BNGJQdWxs?=
 =?utf-8?B?blJxak9Cc0lEakR5MGxlcXViWGU5MS8xNlM3V0dTTC9JWmFmYmdMYzEwbWV4?=
 =?utf-8?B?N0h4Vll1ZnNkTG5LZC9kZUd1TkJsL1NjTTcrMURFL3F1NTBORDJPNzlkd0I0?=
 =?utf-8?B?UjRZbjJPQVl2elpEelNsVytXeUVrUnIxcGx4Rjd6eWoxTFVtK1YwWWIvRlFS?=
 =?utf-8?B?aEQxdmRtam1jaU80UlIzTHB1Q1FkMlk5Slp4TGdQZWU5ZG1hL1FmTjV4bTRL?=
 =?utf-8?B?T09OL0lXV1I2cDNuTkZhaWN4VlNkNlhkVEJHWWtyL0F6RmdOUy9YaDIxeThE?=
 =?utf-8?B?NEhYMTNjc3c0Y1d6ZUMySnBadU9xN2hpQnR0cnpFK0xYSjhzZ2RzOEltNGt3?=
 =?utf-8?B?aHdKRkUvZDBzcE82UlVWbjFmeXUzSHpWLy85b2RvaTRoMHFwbERMcnJoS2Jr?=
 =?utf-8?B?aXlmNm5jbFdUNFg5cGhPeDZldkRPYkFxUlZiamYzTmpNckxjcXZCMW1MNk56?=
 =?utf-8?B?ejZURXJ5RE1kQVJEaldUWHc4WkZJWkNMYldyeXlXOVV6QTRnZnN0NVRQQWpT?=
 =?utf-8?B?ZGZNcUFJSTJmVFBIc1BRRlVlMjV5U0dSUlVwM05ZUVBuR0JyZ3d5eURyK3A2?=
 =?utf-8?B?dDRHdzlQaHJuajBpeUhqTUFJaVhnVzcxQ2VudFJGVktXRnMzY0ZnZlk1MGFY?=
 =?utf-8?B?V1QzejBYSGdUQTVtOWFVVS96cjR1TXFybkNiZ2MxQnJuWmxqWUw4Sm9JM2xv?=
 =?utf-8?B?ZU5oVkYyRXNGWlNTS0c1QWpPQSt2VWcrQXd2djhyMEN3bDFtb1N2ZkNrMEZs?=
 =?utf-8?B?aE0xTDhMYlVoUFZLNG8wMUlUUTJKSnllWFVYTmlXMk5BQ1lXVWsvcFp3T21r?=
 =?utf-8?B?QmErYkNlOHNGb2tuSE15YXVQdWFweDhqSFZoaCtaRnBqcXJhRXhDcFo2MURr?=
 =?utf-8?B?dlE0emZIODEvMlpoK2djNmNpTjhWenVUNTdlV1UwZmU1a004a3BlR2Y0Y0lI?=
 =?utf-8?B?ZjF3OTBXUkxpWWlFUjdQVmF5bktkRWt1bWdjSkhQdVk3MWl6bG5iN1Z0WXZy?=
 =?utf-8?B?RTQzcXR4QUVnZExXUndZYnpjeXRpdDFHR1RsdldPRHg4bXptZk5hUU56aC9q?=
 =?utf-8?B?Nm1tWVl5NU01TWxhc2hydUpnSFJkNEExbEZrOTZhNVFjVFNyL0t5cENzRXVh?=
 =?utf-8?Q?Vx15n4rNQiE5fuu2iAEjZpbam?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <AF0FD67BFF07314C8527E59BED68CBA8@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR12MB7943.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8a9b76f5-9004-4dfd-239d-08de26b44467
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Nov 2025 15:08:01.6437 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: zwVZEQ5gPzS8h8Ph+rJvS1pngZrlIXCRsvb/fIUgW2R7wk5z0P5un3r6EPM0ohr4JoCi6g06mYbfgO8vy5XdfQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB8605
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

T24gVHVlLCAyMDI1LTExLTE4IGF0IDIyOjA0ICswOTAwLCBBbGV4YW5kcmUgQ291cmJvdCB3cm90
ZToNCj4gT24gcHJpbmNpcGxlLCBJIHRlbmQgdG8gYWdyZWUuIEluIHByYWN0aWNlLCB3ZSB3aWxs
IHByb2JhYmx5IG5ldmVyIGhhdmUNCj4gbW9yZSB0aGFuIHRoZXNlIHR3byB2YXJpYW50cywgc28g
d2UgbmVlZCB0byBiYWxhbmNlIHRoZSBiZW5lZml0IG9mIGENCj4gdHJhaXQgYWdhaW5zdCB0aGUg
b3ZlcmhlYWQgb2YgZGVmaW5pbmcgaXQgaW4gdGhlIGZpcnN0IHBsYWNlICh0aGVyZSBhcmUNCj4g
cXVpdGUgYSBmZXcgbWV0aG9kcyBpbiB0aGVyZSkuDQo+IA0KPiBUcmFpdCBvYmplY3RzIGNvbWUg
d2l0aCB0aGVpciBvd24gY29tcGxpY2F0aW9ucywgaS5lLiB5b3UgbmVlZCB0byBzdG9yZQ0KPiB0
aGVtIG9uIHRoZSBoZWFwIGlmIHlvdSBuZWVkIG1vcmUgdGhhbiBhIHNob3J0LWxpdmVkIHJlZmVy
ZW5jZSAtIGJ1dCBpbg0KPiBvdXIgY2FzZSB0aGUgc2hvcnQtbGl2ZWQgcmVmZXJlbmNlIHNob3Vs
ZCBiZSB3aGF0IHdlIG5lZWQgYW55d2F5Lg0KDQpTbyBJIHdvdWxkIHByZWZlciBub3QgdG8gcmV3
cml0ZSBldmVyeXRoaW5nLCBlc3BlY2lhbGx5IHNpbmNlIHlvdSBkaWQgdGVsbCBtZSBlYXJseSBv
biB0aGFuIGFuDQplbnVtIHdhcyB0aGUgcmlnaHQgYXBwcm9hY2guDQo=
