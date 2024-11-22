Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D6929D626B
	for <lists+nouveau@lfdr.de>; Fri, 22 Nov 2024 17:38:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 425BA10EC1B;
	Fri, 22 Nov 2024 16:38:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="s+bmp3pa";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2048.outbound.protection.outlook.com [40.107.93.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B3C0310EC1B
 for <nouveau@lists.freedesktop.org>; Fri, 22 Nov 2024 16:38:02 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kwjJozIpzOYBeqiTumDes0jwyIgVeMhadwXOKsdF0Jzaej28qp4QSz4jK4fdGLdaLVbLaWAOnRCJsNs/HJ5cn51Mh44sl01MMooeynxa+Q7LIDcnKTJCD/vVtaN7Q06sTvTJtjByCKNJ08IP60TfTN/jxVADM87kr7k26FucytoRiwbTOEQ0890U6xJQ0g5f8WcXCmohnqdCs/4IbPT5+lqsgntvy2G4X3FTpA70IJUqoExmbKKE6PwylzaN8EmDX+mjOhriliJq9F78yXtIli7Y5vE3yCYxtCLHmrEq52v/gTReh6py2bgEsY2qYIBF20/txbenz97lkhgIxoFYgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6AOPZcGHH1FWeBCchwz38SyenK4xYlfv6lRF4aeDjSg=;
 b=JAPHATqmj0R9A2ofOcOZFsl6VW1OKPWjXhgj0a0F1Fu2GdK+JT3pakwjcslYNpqEUe5LWqfhRHYgaZa7aTZ5JzOB3prcv2+NVgylNFh16Nj9OIs5Ld+jBpsUM13rZ9uzorJ2axlFzfWw6JccSezg2PkX+Xx+ynhIG4bxUyz4F4RA5/U/2jU6g0g5SCegxG0q7OvjylL7jZEpozeEXyC7jF9qtyLTmFHscIlyfs7M1/iJqmoC42b01dh3QE9xHthbsbLQ3CGrtkhbNW4xhBbPPykRMfmgDZ6G3n9LzIYzLfc73n9qsYyhN2hSYXc+CXJ/3FSzEhM9Ik+VrOooEdmVEA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6AOPZcGHH1FWeBCchwz38SyenK4xYlfv6lRF4aeDjSg=;
 b=s+bmp3pa9QvpazJFn9bzEI/gkWD5jMBZQz8sRtXYDSmCv+YYui5KKkBXfOkjhBNhQ+umyrttz1bcuoRYgxkkaZMuI/MftigVayhUCoNoQSCaV6j2oQizIypcjwsPUncjxnoMbL9YuxwXjeqgrnxQMoSk5AshZAlQyAAWCPICze/IIh0xVAhHEzL22oKpOYe68G62HDLGKH0HEzATryxtPZUmqQe62oicb+JMUjEdWJ76Sfigk9Rqao+AparpJMyU1DY1Fho/FNLPG4fGxGhZkiZ696JqlmUYU7S7hszs638zybtPnQHKg0Bn85RtgMVADAnJ7jkxA/e/jCHJ5lLCbA==
Received: from CY5PR12MB6526.namprd12.prod.outlook.com (2603:10b6:930:31::20)
 by SN7PR12MB7978.namprd12.prod.outlook.com (2603:10b6:806:34b::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.27; Fri, 22 Nov
 2024 16:37:59 +0000
Received: from CY5PR12MB6526.namprd12.prod.outlook.com
 ([fe80::e420:4e37:166:9c56]) by CY5PR12MB6526.namprd12.prod.outlook.com
 ([fe80::e420:4e37:166:9c56%5]) with mapi id 15.20.8158.019; Fri, 22 Nov 2024
 16:37:58 +0000
From: Timur Tabi <ttabi@nvidia.com>
To: "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>, Zhi Wang
 <zhiw@nvidia.com>
CC: Jason Gunthorpe <jgg@nvidia.com>, Kirti Wankhede <kwankhede@nvidia.com>,
 Surath Mitra <smitra@nvidia.com>, Andy Currid <acurrid@nvidia.com>, Ankit
 Agrawal <ankita@nvidia.com>, Milos Tijanic <mtijanic@nvidia.com>,
 "airlied@gmail.com" <airlied@gmail.com>, "Tarun Gupta (SW-GPU)"
 <targupta@nvidia.com>, "dakr@kernel.org" <dakr@kernel.org>,
 "zhiwang@kernel.org" <zhiwang@kernel.org>, Aniket Agashe
 <aniketa@nvidia.com>, "daniel@ffwll.ch" <daniel@ffwll.ch>, Neo Jia
 <cjia@nvidia.com>, Ben Skeggs <bskeggs@nvidia.com>
Subject: Re: [RFC 0/8]  drm/nouveau: scrubber ucode image support for vGPU
Thread-Topic: [RFC 0/8]  drm/nouveau: scrubber ucode image support for vGPU
Thread-Index: AQHbPN4brz2GFx5i/kqZQiutw1OwBrLDgAmA
Date: Fri, 22 Nov 2024 16:37:58 +0000
Message-ID: <dbd3c3476667d3c6dcc532e1f181a88f611c1852.camel@nvidia.com>
References: <20241122125712.3653406-1-zhiw@nvidia.com>
In-Reply-To: <20241122125712.3653406-1-zhiw@nvidia.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.52.3-0ubuntu1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY5PR12MB6526:EE_|SN7PR12MB7978:EE_
x-ms-office365-filtering-correlation-id: 9d520c25-7d8e-4084-1bce-08dd0b140629
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|376014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?SDMzb1VZUEx3VGpPdWlKWXBxUS9LNUQwZDd5U2ZaV0FDalNLTVI3WlVxOEMw?=
 =?utf-8?B?SjZyb28vdDFOVjl4dHpMbW8xVkpiQkV6ZnFEVFYwZ1hBZ1dZUWJQWHBObjdp?=
 =?utf-8?B?RU5QLzBzQUdicEp1aWdXM3lyM0RRMFlpaFhHVHJqdzF4emF3QTRjamdyY29S?=
 =?utf-8?B?cHdpWmxuS0NvNy9KWTBxUXRNRjdCUFgwaWhBR05DZHdQT29mR3NSYjZ2L2lw?=
 =?utf-8?B?QWkxRDl0VDQrbS8rbEJVSTBTaGNBQU1rLy9ENHdrcGxVaThDeVY4enVTRExX?=
 =?utf-8?B?L0FYOE1PTXVYV0I3NlVQazN4QmFoa2h2K1Vzbk9ienBySkdPdnRQeU9LV0xG?=
 =?utf-8?B?ak5XQzBiRTZRVjdlYTErNkMySUpSTlBlT1RNald5ZUxmWDVZYnBuUzlBTDRi?=
 =?utf-8?B?Sm9TYW5QcWIxYlk4eW56OWZUME8zQzJkdW5RSzZaVmt0RTZIQ2ZYK3Y3NjVH?=
 =?utf-8?B?cENqL1dFM3NBUDRNZDBiVEVRMDJ5K2ZRd3BSL1poUDNIckVQMFphbVNUcEwx?=
 =?utf-8?B?aTBnUndVLyt1UFJkTDdzSDBYeVIzd3V5VTd3ZE9oMlZJTnlZZ1N4OXQyQ0Yr?=
 =?utf-8?B?T0YyOE1QbHhIbHpJUWhPZjU0UFhybXNvNGtiR2VabzlxTm1lYnB0N3FleTRC?=
 =?utf-8?B?STVJeFl6amhDMFZReEJobStaTWV3alQrMzY3L0lPeGwvV2xxT3ZCMmMyT2N2?=
 =?utf-8?B?Zi9wWnlSQXJVUlMxcnp0bW9KSnZ0cWFuUGU4QnRmZnY0UWtjalFMaUJhc1ov?=
 =?utf-8?B?TjNYTjcwcDcxNEVoVnIxVWdESE5PRXhaRTdaaUlGTmREaVJhK2JmcU93SUtZ?=
 =?utf-8?B?UTRxL0VpYldIa0JhSDUyaS94QldEdDNLaitSOTVFdTQyNUE1MGs2U2FoQ2tk?=
 =?utf-8?B?MVRpODNwcVVOb2tDN3ZPZ2NZUVdnbkpPamNKWGppaTMvb2FicHFTOElObE94?=
 =?utf-8?B?ejE0QXk1QVF5c20vWUErVW11TCtsZzM3OTg1Z1RNVUtjaEMwRGxDSFFBcEtJ?=
 =?utf-8?B?YzRGbEp4Q1VidWJLdnA0a0xhY2RGK3VSaEZnb2tjeExyaUFRSFRzd3V4c1Z3?=
 =?utf-8?B?L0l2dWlMZkVtZ1NkZmMwMWUyVjA2Y1lEM0xoSVJFNmdmRXQxM01rdm1LN0Q5?=
 =?utf-8?B?eHpjNEt4MXFaQjNnSlpoWTlDZnNEa3ZNVEVsREFDYjBmUUZRcmgxSzN2Zmd2?=
 =?utf-8?B?RW4vdG82cHJBWmx4cWhyRXU3Tk1iQUxxVDVQU0l0c1V2QmRUaUYwZjhGMkZk?=
 =?utf-8?B?S25hN1Vwb2NOdE1TWHYxNi8wS2pZMC9nSkxmWERSbUNZdUxFR1VHaENoekcz?=
 =?utf-8?B?N1RQQ3pOdXRUMjdxRm9LR1JnZjg3Z1lqRFo1ekRRcWp6OUpMbGdybHZZVkt3?=
 =?utf-8?B?ZVVOcFB1bFg5TjhXZkJ1VVZ4dVpvMXJtYWNNeEwxQ0lXYUlPNVNLeVdQTzho?=
 =?utf-8?B?QjgyUjB6MjQ5cTAyZm9iWW9reXRXdDlUNDN4MTluRHNZV3JOclpWWnkxeUZO?=
 =?utf-8?B?SW5HSkZTa0R2OTIwT25ubXhMQjBaSmFlMERBQjVJSFF5d0t1L2RRMDEwOTBM?=
 =?utf-8?B?OVppSHZKbHFrMG03UTlhRjVSRHhzTVgveXVBTmlnOGt1Znl6S0NwTFM2eGVl?=
 =?utf-8?B?VHc0VUFzUVZaQTVlRzdtbVlOTTNkdFdGTWxzcnZDa3hyRm5YWGJabGRnQ3dm?=
 =?utf-8?B?RFFKN0xqUk1hdklQb0xJMFdvSFU1ZXN3Qk5LbmJKODdnZk9WbXQveERyZC8w?=
 =?utf-8?B?ZHpJaXU4ZTdQQTFFNXEzdFlSNnhlRC9KT2NVNXBrZ3NyUHVCOURNSGltNWhR?=
 =?utf-8?Q?hf1NB/QjyuHO8vP6oRjvTkKWcc2NPZoqxlOdg=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR12MB6526.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?N21tbzZ5c2FzR2t4ZHBkazZPNmZTOGxxTGRwWEdUeFZsNVEvQWNmbWx5cjR6?=
 =?utf-8?B?MkdDcnMzU3JtVzFSMy9laVNXRjFZL0FLSkg5L3VpMWp4MFlwb2ppMXl5Z1Fl?=
 =?utf-8?B?a1pTamlERG95UW1UUWc2WXBMSktobnB3RlRPR0hoQ3JRcU5Md21za0NKM2NW?=
 =?utf-8?B?aWhudDUydUJJWThXVklrY1JFUFRjeEQ0bWNhM1RtbHFYaFB5UVgxL0txM1pS?=
 =?utf-8?B?RytkRXVuZnlqNHVSWjhiMUYxUFZldEZyUVlvNnllRnJGN3Y4VFFYcXJodkJT?=
 =?utf-8?B?eVZyeUhGRy9qdlhEaW1MWFNiTU5SVHd0SVhnRk5OcThtbW9yYmUxT0JpUHBp?=
 =?utf-8?B?a21LTDRBYWZNOThTSzVMMU5vdTZpMXprM3haVjlIV2hzb1NCT05KVXUwblZD?=
 =?utf-8?B?Y2NyUUcxRkxxNW1wRzlYU1NzUHdQb0JyNDNGK2g3STJxN2ZaNzlQYlBVVWNh?=
 =?utf-8?B?U0JsQzlyak16THY4TUJvaXN4WENMdkJrdDhXOUE3Y1Nsekh6YWdhTzI4S2VF?=
 =?utf-8?B?RWpleFFzMnhGNDFpd2VDU3ZQMURQc0JQd0U3L3NBOGEzdlR3bXR3K2o4U1pH?=
 =?utf-8?B?eHNPMG5lOGp4RWhpOVJoQ2ZWNTFEYTkrY29ESll2S3h5MDFCN09pWkFDa3hH?=
 =?utf-8?B?dmJNTlVGbHNwRjVCb0hDWnE3OGZuYjUxa2Vjc1NqU3E0dnNIdzI2Nm1VZWkr?=
 =?utf-8?B?UmhvZVJCaGtQeHEvOEdhRmhhVlZrTEU1MlVyNUdOV2g2OEJhOUhFMmJiZEda?=
 =?utf-8?B?ZjhvbWdCM1A1cGlvTVkzN1NlZThITzNadXpsb1UyQnBrNlQya09jdHoxU3lL?=
 =?utf-8?B?bWpseTdMaW81M21GZTZ3QnJpQXNaTXhPa3lRWFpsLzM2K0R6N25rVVF5OUhG?=
 =?utf-8?B?UHhlYm5jTVJIWXRpaVl5S3Z6RUtYYXJaWHREN1d4WGYwVnlXOWd1MU9Wclhu?=
 =?utf-8?B?cGNoaWJqL3VWMFUrUkJzVlRjc2cvVkt2Mmo4RlNhL3dsNUE3OFp6K1l4RHF2?=
 =?utf-8?B?N2wxRDRmL2oxVVZuM0NpMFd3cEZtcjlHbU13dWloNStwSC9OOUw1dEdRWHEx?=
 =?utf-8?B?OUhxdXBjSTdubWZ3MXEvL0lxbUxKQU0xTzNPSE5FdDlRb3QzdGlSckJoY2NM?=
 =?utf-8?B?VDhVd0plQVJ0WTRrYzh4NTdJaW9PZHc1RDg1ZmR5dkw2NVU1OFZKbDFyU3B1?=
 =?utf-8?B?dXppT3Bzd1RIK1dYTDJYaVdPWUhEZFIrcnQvWjZIQnVRbVFIRzNWUlZhTkF1?=
 =?utf-8?B?M0pRQktvL2JFRWcxWUlCS3ErOHhkVTFCanhIVzYrZGprSUlmSHFIb0tlTjBP?=
 =?utf-8?B?U1F4bzIxNkdNaDRzdmZ1NnBCejRVOGJkUkk0cjlaR2FrRXNsNGlJQmF4Q0pk?=
 =?utf-8?B?am1aT2xaTDZCUThkT2luMS9SQmIrbm5WTm02cm5EZ1ZTSHdaRkdGY216TDdQ?=
 =?utf-8?B?TFFxL3NDVW1mZUVlRVhqMVpid1VYSlIvejZWUEFYSTUxOEZUem5Sei9KdmR1?=
 =?utf-8?B?VHNndWZhK1QyYTVZU25CcnJSSXJwaEJLazU4cEtTZE96MUVobmYrcm80YjZ4?=
 =?utf-8?B?b2Foa0RiWm9nUlQxRW14UWR5NDhEWi9WTWVIZTRqWmhidjEranhMbm1JNCtG?=
 =?utf-8?B?NVRuSEJlMk5YNm9oMnRFUHR6RUdWZGFnZTRBMCt4K1h2c2VXQWRBVG5kWG40?=
 =?utf-8?B?VzFHMTFrYklQOTlrY0FwcUh4WUNJcGF4NXZ6b2N0a1MrVTFkTDZiY2RpOGNn?=
 =?utf-8?B?TTJsV1ZXVS9CSmIwaGxpc2M2TER6dUV2TU5tQk52NHI1MW56enFzM0tsQlB5?=
 =?utf-8?B?bkl5MW5XTVl0S0F1UTV5R3NRODRDYkZwanVqOXIxNWh3UkJWV1F0MkMxb1Q1?=
 =?utf-8?B?VFNPR1cySDJwcjhLK2xleGxjODZyNDVDVVdKMUcxOEY5cmZYRGRNNW1QRmJk?=
 =?utf-8?B?S2g1N0VOc2VuazVRT2ZIN0d6QnUybTZqMmJlUHFldkwrUy93T2NhVVRhNEha?=
 =?utf-8?B?YVI4NHp1SGNiV3ZQbHk5cWU0UTluTFhxbjdjbyttUHVwclJKRFNMUkx5a2Y5?=
 =?utf-8?B?VE9wdFMzVnRXZFpvT2JCUFE1cTRYVmxmTEY3L0ttcitnelUzelZJNXF2dDRu?=
 =?utf-8?Q?YwXNXU5qS9HTw9p81+37veTPN?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <05D193708E477A40A12ACD718D7C9726@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY5PR12MB6526.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9d520c25-7d8e-4084-1bce-08dd0b140629
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Nov 2024 16:37:58.7074 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: aQK5Co5QKoXJjKb8CWFOKp48cSFaWjNfT9TYynet9rON3d3MhcrC6tSteD+FbufDWdHmCRuBqSgwDLBYc0P/Zg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7978
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

T24gRnJpLCAyMDI0LTExLTIyIGF0IDA0OjU3IC0wODAwLCBaaGkgV2FuZyB3cm90ZToNCj4gZGlm
ZiAtLWdpdCBhL25vdXZlYXUvZXh0cmFjdC1maXJtd2FyZS1ub3V2ZWF1LnB5IGIvbm91dmVhdS9l
eHRyYWN0LWZpcm13YXJlLQ0KPiBub3V2ZWF1LnB5DQo+IGluZGV4IDgzN2VkYzhkLi42MjY4OTM0
YyAxMDA3NTUNCj4gLS0tIGEvbm91dmVhdS9leHRyYWN0LWZpcm13YXJlLW5vdXZlYXUucHkNCj4g
KysrIGIvbm91dmVhdS9leHRyYWN0LWZpcm13YXJlLW5vdXZlYXUucHkNCj4gQEAgLTMzNSw3ICsz
MzUsNyBAQCBkZWYgbWFpbigpOg0KPiDCoMKgwqDCoCBib290ZXIoImFkMTAyIiwgImxvYWQiLCAz
ODQpDQo+IMKgwqDCoMKgIGJvb3RlcigiYWQxMDIiLCAidW5sb2FkIiwgMzg0KQ0KPiDCoMKgwqDC
oCBib290bG9hZGVyKCJhZDEwMiIsICJfcHJvZF8iKQ0KPiAtwqDCoMKgICMgc2NydWJiZXIoImFk
MTAyIiwgMzg0KSAjIE5vdCBjdXJyZW50bHkgdXNlZCBieSBOb3V2ZWF1DQo+ICvCoMKgwqAgc2Ny
dWJiZXIoImFkMTAyIiwgMzg0KSAjIE5vdCBjdXJyZW50bHkgdXNlZCBieSBOb3V2ZWF1DQoNClNo
b3VsZCBJIGdvIGFoZWFkIGFuZCBzdWJtaXQgdGhpcyBjaGFuZ2UgdG8gY2hpcHNfYT8NCg==
