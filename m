Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F0C3D9D6238
	for <lists+nouveau@lfdr.de>; Fri, 22 Nov 2024 17:26:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C9B110EC07;
	Fri, 22 Nov 2024 16:26:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="BLtnngpT";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2068.outbound.protection.outlook.com [40.107.236.68])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E19510EC07
 for <nouveau@lists.freedesktop.org>; Fri, 22 Nov 2024 16:26:21 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nAZiAZ9xbVpKc+yLeRadbfEzX3wa7mYI+LXaIQr4jj5jcXnfc/OlVlvNuqRc3CTN1PSLu64ml5vJL1EwqW8e4uLPKCukMVWgTkCTY/JJDh6d3QIE4PasWl5S+W1FGWNExHv3nGZfeg1uDWfAoNFna3B+8Irqe+JfHYGZffKmN6AXjWT0VJSs9dN72TMBAdqaFAUdl+vCIN+2tqEQp09tsffMrMlknELl1H6Mm95pJGQ/01KiuCsHVOjSMNyP+fpgTA3r2Ntn3TOSJqFkwW5XtT9NbGj8SIZOE38hw8A53XGAlkp3HlY9j6OiqmGfZs/z3T/4GEWx2X9JFtJk5atBjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pShpw6JYDx+ZHLRfU5CHyXxI3P8lHfB0bciP2ipkYRs=;
 b=V4xQSDdSSxNtNNlibSiK1n6G+QKeXJ/cCuX4EqFK+nxNxloo7ssnch03zoWwsye7Gs92JRx/7cOhJH7+Y4EGI0fT8fC4U5sEXlmJS30rXeDd5la2gcjbk2yf24kFUk4wZnhem0xF1UzOx7eH+ZJb+daPaaLwV6U2ZJTBPbOro71i/4guSZEzdWIcWecdHR8EIo/SfCyWactsZXStObdykSUmCGAYGIC56BN7ucOzk6w3jR0MlawUiIsEfud1/Imc0oFdbVazB6dFVFV+pWgvUW3UOZ8VUjJX6eTxj0sSH/vr8FrSHmvFIchHvxNIae029Aq2a3gvWEtLZspU9kH7Jg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pShpw6JYDx+ZHLRfU5CHyXxI3P8lHfB0bciP2ipkYRs=;
 b=BLtnngpToQLxH6cCSshid+eiAvBqNtzA9w1FXHR8rU9h1L55wq4qJOfTM27++Hk/5O/K2kpjSdkGhCTC0w7B7MSHJQO34zJ7mvLH27jmnaDAnCUmhPXm3QjReGukobT3vEUM8xuVDkgr2p99yXGNIUi4ihbHBs3wXg7GQPYpqDSTUAYKjil1ob+tTdA58cqfkDSEMRVpuB6avR/3oJVZs0C7cK1pd5WoBTtXOnv4I1/BoYhVFxGUDCPatcUCoQsIUTSfQK5o5Wjo2Uxvtk66bXwl6btTiquk+WcwRzSW3achClw+4BD5vPM6r/4Kpg6yqmnwqkB4hUJ8CNWEoQEzTg==
Received: from CY5PR12MB6526.namprd12.prod.outlook.com (2603:10b6:930:31::20)
 by PH0PR12MB7792.namprd12.prod.outlook.com (2603:10b6:510:281::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8182.18; Fri, 22 Nov
 2024 16:26:15 +0000
Received: from CY5PR12MB6526.namprd12.prod.outlook.com
 ([fe80::e420:4e37:166:9c56]) by CY5PR12MB6526.namprd12.prod.outlook.com
 ([fe80::e420:4e37:166:9c56%5]) with mapi id 15.20.8158.019; Fri, 22 Nov 2024
 16:26:14 +0000
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
Subject: Re: [RFC 2/8] drm/nouveau: introduce tu102_gsp_init_fw_heap()
Thread-Topic: [RFC 2/8] drm/nouveau: introduce tu102_gsp_init_fw_heap()
Thread-Index: AQHbPN4dszhOBgk0pEODl0E82N+ccbLDfMGA
Date: Fri, 22 Nov 2024 16:26:14 +0000
Message-ID: <61f98334c4bda1c5b4c02b0ab553a11585be600f.camel@nvidia.com>
References: <20241122125712.3653406-1-zhiw@nvidia.com>
 <20241122125712.3653406-3-zhiw@nvidia.com>
In-Reply-To: <20241122125712.3653406-3-zhiw@nvidia.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.52.3-0ubuntu1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY5PR12MB6526:EE_|PH0PR12MB7792:EE_
x-ms-office365-filtering-correlation-id: 3f426fbf-b860-44d5-3787-08dd0b1262aa
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|1800799024|366016|376014|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?YzZoRTlENitBM2ZTd05wcE1GWC8xSitrY04wOUZyNENOb2tldzVHREtRaU9r?=
 =?utf-8?B?NzdtTnBsbWxPSk8rNUhvSkFlTUUrcnhKOFNZTHBCRGZPbjdZNkl6a1Y5ZXg2?=
 =?utf-8?B?ZzRpdWpack9GQkpnUURscmxPbTRQK1pqQnBmOE9mMzBCTHZEbnlpRCtpaWhn?=
 =?utf-8?B?RzNKak04NTA3UkdXUjF1M29KaFpSWlRlak8zUlRrL2UxeUFkdjN6ZDA1ek1q?=
 =?utf-8?B?WDYrZTNuZjd0RndJWWhiTXA2WWRnalNJNURpV0VGR1hjamNhK295ZWc5Skpp?=
 =?utf-8?B?SlJNYVlnRzBrOG9QRTZ5VlVlT1Q5RUZPRTc0WUg1VithMHZscEFSYmdhd2JR?=
 =?utf-8?B?aHpLc2xrcUdQUy9heWJSVFNWcFBKOENjenpqaXNjUE9PS25nRldmQU4zSXYz?=
 =?utf-8?B?MEZ0UzNYMFRLVkkyTUV0cGxndHA3T21YL2xGUW9OQlloM0laNGNCckVhL2ht?=
 =?utf-8?B?OTAwUU1xSHI1TTE1dDhEby9lVFZXa0VCS2h1MlZSdjQ1T3d5bVdFZmpzc2RW?=
 =?utf-8?B?Z3FXNTJaTnFuc1pCWWtkbHo2dWdKOThuTm9zVTlKK2tvN1pkL2lCUmtENWZV?=
 =?utf-8?B?YU5ySUpzdloxLzg0TVY2ZTN3cDZrQy9UMVN5ZTI4S1psOXRuUm1JNVJWRU80?=
 =?utf-8?B?VmZsN2JZOXVmV0lTckVycFE2UWVFcDE0MGxSUXVZY3RNZWNQbStVd0FmWDdI?=
 =?utf-8?B?ZzNOdEZId0ZsVDZ2R25ob3M3RE9SZnpSSW9HRjUxK291TjRwemNEZnBtcGt3?=
 =?utf-8?B?b2d0U0FhUXVnZndFMmhRcFE0Q0kxcFNpYWhSZXZScXZJTENtYmlaZTBzU0to?=
 =?utf-8?B?QjNHYzRxSEtWMFpGOWc4M1JVZG8vcjhhWnp4VmRzZjlEOGZGaTlocnd6Mjh3?=
 =?utf-8?B?Y2Z2eUsrcVlnKzEzU1pHZ0RxRktTV01aS3JsSE4vUDVBL2k1MkZta2FFNmdP?=
 =?utf-8?B?UXVKL0pJd0xHQnl6Z21PeURibUszZ0lFS0FlQkJLN0QyWGxQWHFxaG93Vk51?=
 =?utf-8?B?bUZKcUpubzFha3R1bkJKZW5LV0c3MW9VUGtPMTVPcHdNdlFZYUQvOG9HR3Jv?=
 =?utf-8?B?bldMbmMvN0dtSWtQYmpmRFdiS3U1QnU0Sm9LM205N0VQZXk2bU9ZVWVFVk82?=
 =?utf-8?B?aEdQMjhKZzJEeG5iK2tSdEw1QnE2THNiQXFZZGIyTDJ6ZlJqSEFac2dEYjNq?=
 =?utf-8?B?TFZGcDVqNEROcUtMWmNvNkJNWDg3cTBmOWhUQlhWMVlqek5xM2hibDZCaTRN?=
 =?utf-8?B?dnp0OGwvd0R6RWdyQ2RsMjU3eElOZ2dtYWxjVlRRdXpzc2VkQmsrNWcrdVAz?=
 =?utf-8?B?eEMzejdBNU5ERTFHM1BvN3dnLzRGMlZMZlk0UHJmdVd4ZER6OThhWjlOT2l1?=
 =?utf-8?B?WnlPekswelhKL0s0dXowQmNEajZJQXpmUFRvSEQ3OC8zTjZoM1dKY1ZsKzhI?=
 =?utf-8?B?RUZSL0lnV3cxdUw0RnZKTXlpNDRYMXlYYUdWdGVuUGZzd1g1R3RRanhOb1pq?=
 =?utf-8?B?VUlzNWVqQUtRM09FcHBQTTg3OHo5WkdQNlM1SHUvalB3bG5ZSkwxcVA0SzFW?=
 =?utf-8?B?dkUrbjFBRTREajYxTERNSHhGTDFOTVk5MlkrZ3YzYnhtQlpQWU1NeE15WEgr?=
 =?utf-8?B?VHZpNi9ia1FRc3Fyd01GMXJpVDhxWG05V3dsWnVoNlEzcWlBbTI1NzRXVWJU?=
 =?utf-8?B?SFFTQ0pBeXRlOGVxSFQzRlU0OU5PREFyS2RYRC9zUFh1TW1aWk1JQmdKUmtQ?=
 =?utf-8?B?NzNEUzVpd1pZamxkQmJWNFpIY0dGa0MwT1lFMVBiSjZWNUdXOE9NR2VSZmJT?=
 =?utf-8?Q?fvpI9Z4HDzs6wE7lgedQ4adYGeqdaPYZ2hsQc=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR12MB6526.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?cStOblI5OVFTdGhpaU4xZTVacVcwUnVDWTRzK2xPa2p6WkZHYWVQRTFDMzFV?=
 =?utf-8?B?Zy95Z2FRYlR0Wm9IZFFoc2w2OHVRUmNWYWVNMTN6UjJxeEFWaExBZUlXRFA3?=
 =?utf-8?B?SXlZYW9Qc0VhbmpwblFZSmZ6KzkzRW9SNzBsYlRkalZ1MFEzNWdFdmR3U1Zn?=
 =?utf-8?B?cFBpM3Y5bDFoZUpCaDdzWmpONTZLeGo2cDVhOEViUVJBK1RuSG9KZTdubTJJ?=
 =?utf-8?B?MUMya05IeFVnMno2K3VldUM1dVI3SVR4OWFBczRSRGkxUlBXYW5nRDM0VnFL?=
 =?utf-8?B?MkNsdHFsTjJYNkN0VVUxMkFCMW4rNUdadThkWmhlaG5XazhoeFhmZXFUV0tL?=
 =?utf-8?B?ME5Rd0pWOFNWK2JwRVFmajNNVUJwdE53dm1nRWovSGsvcTMyT0FyREp4UWRY?=
 =?utf-8?B?RTgzZUlhZWF1dGdteklSZ3VxdDFaQi96ZHZRdHJmUHE5ZVlJZEFHbTVQeC9i?=
 =?utf-8?B?eHN6eVh1Y0MyQ09kYWVIa2RwMnBvcXM5cTQrQUlOMWtOOUZCZlZqRno3L1Nr?=
 =?utf-8?B?UUNleHRUeXZURTJ2VlRIcE9Vb05sU2JxMFhYaC9tRDNjSG82VVB4Zk85MWZh?=
 =?utf-8?B?YWQrWnhQT0ZHZC9vK0JkU24xNlFVMmpzbUpha0ZtdTIwbkg3emNtOGRsRFhP?=
 =?utf-8?B?Sjdrd1dkcVVaa2liSVdBMEJMNEEzYkxCeU1jN2NXNEt6ZE05c0dPWTlDS2dT?=
 =?utf-8?B?R2U1MGdTUzZ4cDc0OTBWcmZyZXpOOVZ5QnJlVUpaQldneWc5YVBvRUtZK2FM?=
 =?utf-8?B?YmdIMVNMU3FTdzJUQkhhbHArSjBNRkRUSDdjTHNwSElFUEtmN3VrdStGRVR0?=
 =?utf-8?B?bk9TNGdsa09BYU50eFJrQzJrM3FoQkhnQnowRmh3b1lucDYvaFZSbURlRVNt?=
 =?utf-8?B?c01raHp2d3NMUmtNNlRJb2hzL0dxYVF3M2lxdDNvSTFpR1NYYjhZTWFHczMr?=
 =?utf-8?B?dGZCUTc5VjV1SlZud09YTkNOcGh2cG5FWHVlbEErK1Y3R0RFdmYySlhLcEp1?=
 =?utf-8?B?aXF1cVRYUVlrQW1iR3ZkRi9CZXF5cm1EQ0s2L2VPdGJJczlya3hPbnpSbWZZ?=
 =?utf-8?B?d2hrMEFJQk5KTm1hTklkNDBUOGpjRUZRV2lKdVlKdkJKOWpLbjRIaUlmbDhk?=
 =?utf-8?B?V1RKdnNFOG5XcEFHZUZTTUJMbUx0cGc4Wi9pajlFR3IvOFdBR3hIMUhramN1?=
 =?utf-8?B?RGFBRUV3OGRhZzNlZE1SZHBOdDRLS2huQXJBeURWbGRTcGFGY2VxWkYyemJn?=
 =?utf-8?B?aFkyaDk0VzV0b1hDYWFTdVY4WlUyNGJiUEpLRUZCYkdCczBvVG1KN0ljTW1U?=
 =?utf-8?B?MFUrVGpYd0FRSForSjM2Tlp2YUpyRld3Q0N0U2xabExFdWVVVFA3enlmdWJS?=
 =?utf-8?B?aDNQdE9zVi9uZ3pKVDVobWhWMU0vckJaZEthQW1mb1FEWlQvank5cUIxOGN4?=
 =?utf-8?B?ZENoSHV3S0xFbnRXQ21WSVIxWkdCVGJvODRsWnFwc0ttRWFFbXZuMTRYbEhB?=
 =?utf-8?B?d2tyUU9qUVhNVEVHa2lNSS9JeXA0L3VWOXhXc1l5eTJNSEhiSnFSYTlEc2Y2?=
 =?utf-8?B?S0xmMWwxWmdKKzdJRGtmQzV2SEpEV1hudHk0eGJ3a3FvZ0FJTGJLQVNDaiti?=
 =?utf-8?B?M09BZitscU9DVmRCdTBkandnYlppVnh5d0dGcEhWcGtVdElTbFgzdWNUdkpJ?=
 =?utf-8?B?RHg4RnlEYVRJUk9OTXc3REhwakNqd25laTNJRWMrNVNIRnhVSlREVVFabVFu?=
 =?utf-8?B?aGRNUm5UT0VONFlSS0pib2dCSkZSamI1NzdXRlJCZnFmSThjOWp1cVgyeXQ4?=
 =?utf-8?B?ZDRTM2lKQkRzNjF4NGpOQ0VYdTRYU0k4My9XUHVGeXk0MDVYL0RMdStUUVU4?=
 =?utf-8?B?Y2N2azJpR1JSZ2tnYUxTNWNSTTZYOHM2djZyeUpRNUdQQ1BzWDdJRXdDc0dj?=
 =?utf-8?B?UDBuVEEzNmJKbThuVFNkTVVWQ1AzUXdkNnRNRXZMVGg0Y21CWEJnVFR5N01L?=
 =?utf-8?B?bmpiajRiaWJLZWxBVGlLbzl2Rk9vOXUzb1J3MGx0U0wwbDk3eERSUFFJZVVn?=
 =?utf-8?B?RzZRa29Hek5rUllOaDNUK0RmaXUxVDluY3pGUW4vYVMveVBpUEF3VWxUcW81?=
 =?utf-8?Q?/jXDQYdVTCTl/WlUrPrtLIHAc?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <212325622237AE4BA1EE628B6047EAF0@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY5PR12MB6526.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3f426fbf-b860-44d5-3787-08dd0b1262aa
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Nov 2024 16:26:14.9059 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: McFrNquuyua+szRq3nY8xOVjWWxWexMJCYLoz+8luNTUoAlJftJ2MFKg1XTmDtNpx8RIR2bToMyMmG/XmEDb2g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB7792
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

T24gRnJpLCAyMDI0LTExLTIyIGF0IDA0OjU3IC0wODAwLCBaaGkgV2FuZyB3cm90ZToNCj4gK2lu
dA0KPiArdHUxMDJfZ3NwX2luaXRfZndfaGVhcChzdHJ1Y3QgbnZrbV9nc3AgKmdzcCkNCj4gK3sN
Cj4gKwludmttX2dzcF9pbml0X2Z3X2hlYXAoZ3NwKTsNCj4gKw0KPiArCXJldHVybiAwOw0KPiAr
fQ0KPiArDQo+IMKgc3RhdGljIGludA0KPiDCoHR1MTAyX2dzcF9md3NlY19sb2FkX2JsZChzdHJ1
Y3QgbnZrbV9mYWxjb25fZncgKmZ3KQ0KPiDCoHsNCj4gQEAgLTE3MSw2ICsxNzksNyBAQCB0dTEw
Ml9nc3BfcjUzNV8xMTNfMDEgPSB7DQo+IMKgDQo+IMKgCS53cHJfaGVhcC5iYXNlX3NpemUgPSA4
IDw8IDIwLA0KPiDCoAkud3ByX2hlYXAubWluX3NpemUgPSA2NCA8PCAyMCwNCj4gKwkud3ByX2hl
YXAuaW5pdF9md19oZWFwID0gdHUxMDJfZ3NwX2luaXRfZndfaGVhcCwNCj4gwqANCg0KV2h5IG5v
dCBqdXN0wqANCg0KCS53cHJfaGVhcC5pbml0X2Z3X2hlYXAgPSBudmttX2dzcF9pbml0X2Z3X2hl
YXAsDQoNCg0K
