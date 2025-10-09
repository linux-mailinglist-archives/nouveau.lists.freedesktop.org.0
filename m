Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7702DBC9D4A
	for <lists+nouveau@lfdr.de>; Thu, 09 Oct 2025 17:41:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 05B5D10EA9B;
	Thu,  9 Oct 2025 15:41:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="N4Pk0yGU";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from SA9PR02CU001.outbound.protection.outlook.com
 (mail-southcentralusazon11013062.outbound.protection.outlook.com
 [40.93.196.62])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F35E10EA9B
 for <nouveau@lists.freedesktop.org>; Thu,  9 Oct 2025 15:41:18 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Gb8fWUBm6epD881w/tZt6c7hxwERAhxk1ulCsS0sh6b3XNOrVORT2JujB2MbMlFvcuYdZuwP7ByJCGQVXzxz3iGlAqdkUHlS0IhDCtbS+4jwaptIVJQI6FxAvjYVVfOMArEwBETxuIZvPp53Tq8PuSo2H/Opz5ziFP1xjcY9MYZJwm8e6B6bZIaZNqwCcG/BS9rJowietZkRKx9ER+UJvdlkX2+I6P+EALjweybvQh2YBFD/BXbSlYw3gThuogpF6MUAatp2KOI/hrHK8/j+sNz30Lvh2lA6mDC04ksXX1aOF9tqXJ3KZ7Lz62LnQge/aTMR8WkMmGth5B9nqH5wcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=43wzYE9ChRnkYSBcSK+9IQVpAMRCTYAF5p3+FNWNCmg=;
 b=lhQBKURV3Suhr5Fr2Iryx+YqZ40cLl88iDt7E4ndvkgQg8DAKDl1PTW+19KIJOkKEv9r6FLkDMstNlr2o1nCWOhRVGi56P6izsBbixY59VP9+psHzfZGXSa5IZ6xOv/1vMILBSYoWWpc3efZr7+kYtjptdGbYQaJ8HgO3sVNvSF1Ypr1AI+FMcQcAwAae8/Q9m4OAR8UtBdRvv+/jRZxYG7SxfURhccuBFgDje6w1RGKMkJ3KcIJNAk4F9CaGp8VFltD+wqU2vO/jcUL/XizAUBTxs8EEKiGpaeH3AjRwGJHsCGL5y726Gn3ORvoZaHDg8tbIhdCWt+3NJgoX+munQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=43wzYE9ChRnkYSBcSK+9IQVpAMRCTYAF5p3+FNWNCmg=;
 b=N4Pk0yGUqKmXaP1+lUIH7/bKo/0HVpk1eud+1GG7cwffjKZNonqhP/J7HxHns358ly6ZKSRKZyEJo0exPVPmv741myulOOSqsJ+Xdm0DAyV6eCJY8/WcZp7OloUbdjGbDTlRVX26E4GtWjyaxEgZwg96HGnoPu3EgOVnqX48Y/9McAIWIJ4pMfc1WlSgkZ7rIXxycI4FqzCPTvKDUMvybtb+8k2jlnc3dP1sALB658U8UgwSNOLYUeZ5/D6ZPlB4FPLgCa15fN76BQo6qxXLVL4AMg97dVIX9Jc38KAI+k9XRyL5XXti0wNU134jm8Ic4Du8A7TcAIa2x+0P/MOR3Q==
Received: from SN7PR12MB8059.namprd12.prod.outlook.com (2603:10b6:806:32b::7)
 by SJ2PR12MB9163.namprd12.prod.outlook.com (2603:10b6:a03:559::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.10; Thu, 9 Oct
 2025 15:41:13 +0000
Received: from SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91]) by SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91%2]) with mapi id 15.20.9203.009; Thu, 9 Oct 2025
 15:41:13 +0000
From: Joel Fernandes <joelagnelf@nvidia.com>
To: Alexandre Courbot <acourbot@nvidia.com>, Danilo Krummrich
 <dakr@kernel.org>, Yury Norov <yury.norov@gmail.com>, Jesung Yang
 <y.j3ms.n@gmail.com>, Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor
 <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo
 <gary@garyguo.net>, =?utf-8?B?QmrDtnJuIFJveSBCYXJvbg==?=
 <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, Andreas
 Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, Trevor
 Gross <tmgross@umich.edu>
CC: "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "rust-for-linux@vger.kernel.org" <rust-for-linux@vger.kernel.org>, Edwin Peer
 <epeer@nvidia.com>
Subject: Re: [PATCH RFC v2 1/3] gpu: nova-core: register: use field type for
 Into implementation
Thread-Topic: [PATCH RFC v2 1/3] gpu: nova-core: register: use field type for
 Into implementation
Thread-Index: AQHcORl7vOfNRk0HukWQ+g/jfyRoq7S57W2AgAAGqCA=
Date: Thu, 9 Oct 2025 15:41:13 +0000
Message-ID: <D797D35C-C1ED-4AD5-8779-C3F3E0D6BC6E@nvidia.com>
References: <20251009-bounded_ints-v2-0-ff3d7fee3ffd@nvidia.com>
 <20251009-bounded_ints-v2-1-ff3d7fee3ffd@nvidia.com>
 <1ba060e1-a3ca-4570-a641-e1f09026b13b@nvidia.com>
In-Reply-To: <1ba060e1-a3ca-4570-a641-e1f09026b13b@nvidia.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SN7PR12MB8059:EE_|SJ2PR12MB9163:EE_
x-ms-office365-filtering-correlation-id: e22e7119-348a-482b-a4c6-08de074a4707
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|7416014|366016|376014|1800799024|38070700021|921020; 
x-microsoft-antispam-message-info: =?utf-8?B?OXZ6RzVmN0pTZkR4RnFyV09FMG1FeEErQXVKOGFXcGs3U3hGS0Y4aEFMK2RH?=
 =?utf-8?B?aXlFaWpNNXhnR2U3RlVqUWFJclFBUFErRHZqdXl4dUJiekI4bjlMQzU0Um5R?=
 =?utf-8?B?b1l0R3FzN0JxVFFRNVozbm5sT1JwNk8rb0I2MkRwd2xEMDBXQ0pIdkJGbnhu?=
 =?utf-8?B?OENMZXZUZ3BhUEluaXF3K1JHNDI2Z0JOenJsekZxelpIMmNQdit5OTRsV1dp?=
 =?utf-8?B?Snc3Nk5Bcm5RSlVEbjR1SFFlY1BXTEJocXJtdzczWi9iQmpuL0d1WUVyb01i?=
 =?utf-8?B?SzhNUktnZjZsbWUyZUcyOUhUT1ZkWUpVamh0bksyc3VpNThxL0ordFN1aitt?=
 =?utf-8?B?SFphTVAyaUNlWjVPRHVjaUVuS203dWJWaEhoUDR5ckxHRFhpNEo3cEoycjh4?=
 =?utf-8?B?NzJNS3oyNnRZbFpqK05ZaVRHdnJUNm1uUnpxbGZLRGZ1ZjdOZzA1MEZnMEJj?=
 =?utf-8?B?aEhwcUdISk5XMktWSldHRVJoUVZ5VzRzQ0d5Q3pWRXhkMlVQWUljOG1xQUFT?=
 =?utf-8?B?NWJucDA5NEtnR0xTSExEbUVmVHpPa0thRDNEb1Y3Q3hSY04yeGpTS2xVSlUv?=
 =?utf-8?B?L3NtNjFkVFlRS0h5eW41TmU5OWoxQ0l0LzQ5d01NSkJZejhnZUF1eXF6ZDI0?=
 =?utf-8?B?WjZtMDNGdjVDV1ArTklzVnlXNXdmVTRDN0c0alprNWM3NDZQVkxRYzk1TUsx?=
 =?utf-8?B?dUFPRGcyczE3ejd0VXd0WUxYYlpEUDNKbmJRamRsVjdKbGcrRSs3YkZQUW9z?=
 =?utf-8?B?QURLdHZEc2hiZzcvSnVvbVU1UUVnLzlTZW5kM2FtK0M2YnpqU2JHT05uRHFj?=
 =?utf-8?B?dVlsUHVRYUNtMW5Fa2pjZGU1TllERkJwMHNNUmYrT3RvNlBTQnpXZnVzZW1x?=
 =?utf-8?B?aTE0S2c2djc0UFkwSndwcUVQQ2s0bWoyV0FvZnNQRm9Jd2haSGdjQzIzdzcx?=
 =?utf-8?B?WHJtREh0TWNmUXA0dUhoTVlicFY2d0pEOU5BejZhZjl3U0s4V2h1Z1NTdnpX?=
 =?utf-8?B?MXF3cGxvVXJtZ0RSZ3dzenkzOTRuZ0N5NllkZG5zMVNFNVZ2OFJoUEU4UDAz?=
 =?utf-8?B?OTJGc2VVMm9GSjdtMzFqVVlGNmRwUkNsTlhMRjJDRmVSUmdSenpJSEFMSmY0?=
 =?utf-8?B?MzBZSlR3eFV3VzN3dGhSNmhnMGpwZ3laa2ZtR3NxMUZhZUVvQkZBMDlFMHJu?=
 =?utf-8?B?dllSZjZreExxa2c4NktVcHNtd3FBSWNCd1U1Mko0QXdSeHlXbU9ucHNNMk1F?=
 =?utf-8?B?cE4zM3VvMjgvOGdpUmRGMHc5RERPRVJnZEhtb1IyQWJqSFJwRnYyOXdERkFp?=
 =?utf-8?B?SG1EUEdCVmZxVllnUm9jUFU2ZVlTdCtNSnlpTXFkN05DdEpzRUxqSW55QVpE?=
 =?utf-8?B?a1FLTkdOWmF2YjNGRStqbmRCMk11ZEZicEF2Z0MxWjA5Sm5HcWg0VUh6eEJm?=
 =?utf-8?B?Yit6WnBxU3BBWWVCSE9MaFBFb2Q0am1hVGZSYkFxNjFuaHZaUHRNOUpNQlcr?=
 =?utf-8?B?Y0lhOU5ISkhoakZjb1VTS2dCYUc0bmhCMkFYc29YUG9xY1ZOS3RMR2ZIVnFr?=
 =?utf-8?B?d29GVHlKM3NRLzdPcys0TkNZK2lVNkNkOXZuMFk5UVlQOFp2eFY1VnZTS250?=
 =?utf-8?B?WDZ4dU5JOVNXQU5McEZVa21UQm9QbGxJcU5HWG8vdVArV3VkdE1iQTdtMU1L?=
 =?utf-8?B?SGZBaHU5c1Uwb0dRc0RXSVVLL21kdnZOcHNGOVVMRy9hYTdsQmVmbEtsdkJW?=
 =?utf-8?B?NVBUS1Q2ZTNrcGk4c3FJUHhTUUFiYkJvYjFXRGdzaXdMajVsa0FxKzBzaXl5?=
 =?utf-8?B?U3RjaFc2THZkdHh1MVBWekk5Zkw3ZjNoZzFUUU82Z0dLOVlsV0x0QmFtTk5m?=
 =?utf-8?B?M0F6RDRKa0pLcW1WNm9JeW5ocllaWTR6S2gwUFZkdERzaWRoVkxWTUJsRDh6?=
 =?utf-8?B?MmZwWmNMK3dkYzBLaTVPMVFPd1hhY0tqZW8yMno4eGtzaG9jSEN4RHJtQkxB?=
 =?utf-8?B?WFk3S045MjFtWjJtREtmdzY1RklXcW5DNnc5MHl2Q1ArQXBmeHYzcjh5MzdI?=
 =?utf-8?B?TFNXMmltb1VEY2NWNVhtaDkxUW9DTStxeHVXQT09?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR12MB8059.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(366016)(376014)(1800799024)(38070700021)(921020);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?MDdNUldCVnNxSFRZVEptL1RiMEpBUENiWHZtc1ZVWDE5RGZaM3Y0Rzd3cHk4?=
 =?utf-8?B?MjFReG9iVmRJdXo1Zm5uY3dyRVJBSnZtVTk0NzdaOXF3djNWbC90Wmg0TS93?=
 =?utf-8?B?U3pYV1RkS0p0WS80eTZBYXVOUzh1Ris0T3NaWVFpM29WaHNPdE56RlJrOFY5?=
 =?utf-8?B?L0hjdVA5VkozVitHN25waE1OVmVLWDJ2SHd5amZkT0FOWEMzRmwyRkIwM05v?=
 =?utf-8?B?cWpyaU9Pcm5IZzI1WGtVOGxnSHJlL0dpVVlZTUxWWFF5aHlJc3VISzdFTyt5?=
 =?utf-8?B?TEdnb0h6KzhlaFZ4ZDJVZGZ0Nk9CR3pJTnJKelF6WnFZU05NM3lJbGlObmVq?=
 =?utf-8?B?MUxNTTcvMDF3czJtanQxSndBVDlyK0FDVUN6SHIwVHNRTk5DSlp6L0E0ZVhq?=
 =?utf-8?B?ZmRjWVpZU2YwYWdBTUhYcmN0N3V6MTcvdzBHMnlnTTM5MGllODBmejhacG8w?=
 =?utf-8?B?V01MRnRoTE9xd244UWxQUGQ0a0JSemZwMk1nK1hWOUYxZ2xIdVo0R3gwYVdM?=
 =?utf-8?B?R25hdFhiZWJRZE85RUhYVm83YWJpTkU5QXdPeStmMVRjUytBRDNQYXNxSnNG?=
 =?utf-8?B?TTYyL1ZubEhpRkcvNkVzL3dqRFNhdThKTkNaUW5GUjlnd1R6WENoVXUyOW1I?=
 =?utf-8?B?UkN6Vm54cGdnTHFkVFM4WXhtQVI5RFJ6bkN5enJDVEZpeTBoNkRKOEpXZVVW?=
 =?utf-8?B?ZXJyS0NuWXhXdzFTRTlsQ095TFR6WkpubkNUV3VwOVh3Y09TcjM1SUpLNURJ?=
 =?utf-8?B?SXRpdXRFV3BUZ0piTGpDYW5ZdHVrMGNmUlp0bUpBNDUwQjlDeVN3ZFZhZnN6?=
 =?utf-8?B?WmJ2S25nNGQ1Tjc4R21MWGROLzRxQ043b0ROTDkvOVk5d0JwclVyQmhSdTBx?=
 =?utf-8?B?bU41VVUrZWQydlJzZUNMWEd0VHJJMFFFVHZrS0p4eTRFaGZyb1dDREdPd1oz?=
 =?utf-8?B?bnJLZFZtZFFaNEtXWUlKMWl1ZHZYcGQzUGxCclUyQ3BCZytnS0lQbVZERXRO?=
 =?utf-8?B?amp3dnVEcjNQNmhzV1Qxei81dmhOTjNuZnQwSjRGM3c0U2V2d1RjTExqSG9a?=
 =?utf-8?B?OHM5SThLdzlVS1VyQ3NXZGJqVDc2WXVwbld4dHk0ZHRhL3lnczhDWGNpY2ZL?=
 =?utf-8?B?Ym5lSTRZVEZrT0pvRWhvRFlwUEtDTG03ZW1VbDdRSllIMmNqOU5lV2FJVGtI?=
 =?utf-8?B?K0FRQXIzaHhpV1Z2WmJubStYWXB0dDRGNnYyaHNDUnNONFpCaEJYQzBJcVVt?=
 =?utf-8?B?Nms4RzdwSDV1S0JPTmRUbCt6dDdVZVZHTTJxQnVvbUt0bW1aOTVHUll5ZzJH?=
 =?utf-8?B?RUQ5WElxczQ2M3B2YWtoR3N0bDBieXhsRitDNW5XanBrT2o4MDZDcmZ0Mkg4?=
 =?utf-8?B?TElmV0tkeU1KaXJNdStJNEZ3d3Y4bEwzZzQwZnRnbnMxYVF0K1pFc1NGYXdR?=
 =?utf-8?B?bEcvMmtveWoyQVh2SE44eVNqZVFscXQ4NE80KzFtbnM2dGl0bnZFQ1I4QkJu?=
 =?utf-8?B?SnBMUkttdTNyak8yNHhqVXlqTk9mcnNvOE5GbThyN255N0k2dS9iK1hpai9s?=
 =?utf-8?B?c1AvU3ZVdU5pMUJqbGhUZUpkRmNhVDhuV3J0dTlaVlVEUkE0dXJCNngrZTBp?=
 =?utf-8?B?OHdySFVIRTlnU0xrVTl0K2l1bnQzdWxOcnNtZHM0N3VDSUMvdXlMakw4UWpl?=
 =?utf-8?B?Umw3NHQvaG9DaW1rK1dJU1daeHJjaW5EK0ZDTVQ1WW5EWEdIbEQzM1ZHdkhC?=
 =?utf-8?B?b1lyRmIxaG9kY1o2UVBoSlJ2LytOQkZhRXVBZXhMUi83cnF0U2dDL1p0V08y?=
 =?utf-8?B?ZWlGUGZiSWNsbzBITjB6cmlURFh1OEMxdjJDNFVZN3I5bkZoWmZnSURwY2tp?=
 =?utf-8?B?QlZlWWJ2KzV3ZjRVYk9TL1pxVVM4aWdMb25aZXlWdkRLLzdzcGFtZjd2VmRG?=
 =?utf-8?B?M3grdjZtc0thN0lGWEVzNEtRc2RSZ2wxNm5Gb1Q5T2FVWEF4OUUrNFloejBs?=
 =?utf-8?B?M2crakFaQWl3cFMxaHBBNUhjUHJvc2x3MHIrUWNvaXNBOVpkYTBWb3RicUxK?=
 =?utf-8?B?alNVRGNScTZIYWdDYzZzS1B6eURmaE5YMFlSNSt3cjNUOHBFS1lkZFg2d1ZI?=
 =?utf-8?Q?Q1GtXggRU4rxFLM8g/AnyfsUe?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN7PR12MB8059.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e22e7119-348a-482b-a4c6-08de074a4707
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Oct 2025 15:41:13.3591 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ug64oiqGO9zs1bpppNFSx0PMlIUxxLJDOsWqgxSvCBf6+cHwLTXSFr+Lpu0OyDazwP+0MipSQSIg2om1eOAU0g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB9163
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

DQoNCj4gT24gT2N0IDksIDIwMjUsIGF0IDExOjE34oCvQU0sIEpvZWwgRmVybmFuZGVzIDxqb2Vs
YWduZWxmQG52aWRpYS5jb20+IHdyb3RlOg0KPiANCj4g77u/SGkgQWxleCwNCj4gDQo+PiBPbiAx
MC85LzIwMjUgODozNyBBTSwgQWxleGFuZHJlIENvdXJib3Qgd3JvdGU6DQo+PiBUaGUgZ2V0dGVy
IG1ldGhvZCBvZiBhIGZpZWxkIHdvcmtzIHdpdGggdGhlIGZpZWxkIHR5cGUsIGJ1dCBpdHMgc2V0
dGVyDQo+PiBleHBlY3RzIHRoZSB0eXBlIG9mIHRoZSByZWdpc3Rlci4gVGhpcyBsZWFkcyB0byBh
biBhc3ltbWV0cnkgaW4gdGhlDQo+PiBGcm9tL0ludG8gaW1wbGVtZW50YXRpb25zIHJlcXVpcmVk
IGZvciBhIGZpZWxkIHdpdGggYSBkZWRpY2F0ZWQgdHlwZS4NCj4+IEZvciBpbnN0YW5jZSwgYSBm
aWVsZCBkZWNsYXJlZCBhcw0KPj4gDQo+PiAgICBwdWIgc3RydWN0IENvbnRyb2xSZWcodTMyKSB7
DQo+PiAgICAgICAgMzowIG1vZGUgYXMgdTggPz0+IE1vZGU7DQo+PiAgICAgICAgLi4uDQo+PiAg
ICB9DQo+PiANCj4+IGN1cnJlbnRseSByZXF1aXJlcyB0aGUgZm9sbG93aW5nIGltcGxlbWVudGF0
aW9uczoNCj4+IA0KPj4gICAgaW1wbCBUcnlGcm9tPHU4PiBmb3IgTW9kZSB7DQo+PiAgICAgIC4u
Lg0KPj4gICAgfQ0KPj4gDQo+PiAgICBpbXBsIEZyb208TW9kZT4gZm9yIHUzMiB7DQo+PiAgICAg
IC4uLg0KPj4gICAgfQ0KPj4gDQo+PiBDaGFuZ2UgdGhpcyBzbyB0aGUgYEZyb208TW9kZT5gIG5v
dyBuZWVkcyB0byBiZSBpbXBsZW1lbnRlZCBmb3IgYHU4YCwNCj4+IGkuZS4gdGhlIHByaW1pdGl2
ZSB0eXBlIG9mIHRoZSBmaWVsZC4gVGhpcyBpcyBtb3JlIGNvbnNpc3RlbnQsIGFuZCB3aWxsDQo+
PiBiZWNvbWUgYSByZXF1aXJlbWVudCBvbmNlIHdlIHN0YXJ0IHVzaW5nIHRoZSBUcnlGcm9tL0lu
dG8gZGVyaXZlIG1hY3Jvcw0KPj4gdG8gaW1wbGVtZW50IHRoZXNlIGF1dG9tYXRpY2FsbHkuDQo+
PiANCj4+IFJlcG9ydGVkLWJ5OiBFZHdpbiBQZWVyIDxlcGVlckBudmlkaWEuY29tPg0KPj4gU2ln
bmVkLW9mZi1ieTogQWxleGFuZHJlIENvdXJib3QgPGFjb3VyYm90QG52aWRpYS5jb20+DQo+IA0K
PiBBcyB0aGVzZSBhcmUgaW5jcmVtZW50YWwgaW1wcm92ZW1lbnRzLCBjb3VsZCB5b3UgcGxlYXNl
IHJlYmFzZSBvbiB0b3Agb2YgdGhlIHY2DQo+IGJpdGZpZWxkIHNlcmllcyBzbyBpdCBkb2VzIG5v
dCBjb25mbGljdD8NCj4gDQo+IGh0dHBzOi8vZ2l0Lmtlcm5lbC5vcmcvcHViL3NjbS9saW51eC9r
ZXJuZWwvZ2l0L2pmZXJuL2xpbnV4LmdpdC9sb2cvP2g9bm92YS5kZXYuYml0ZmllbGQuc3VibWl0
dGVkLnY2DQoNCk9uIHNlY29uZCB0aG91Z2h0LCBJIGNvdWxkIGp1c3QgY2FycnkgdGhpcyBwYXRj
aCBvbiB0b3Agb2YgbXkgdjYgc2VyaWVzIGFuZCBhdm9pZCB0b28gbXVjaCBjb25mbGljdC4NCg0K
U28gaWYgaXQgaXMgb2sgd2l0aCB5b3UsIHBsZWFzZSBvbmx5IGNhcnJ5IHRoZSBsYXN0IDIgcGF0
Y2hlcyBvZiB0aGlzIHNlcmllcyB3aGVuZXZlciBhcHBseWluZy4NCg0KRm9yIHRoaXMgcGF0Y2g6
DQpSZXZpZXdlZC1ieTogSm9lbCBGZXJuYW5kZXMgPGpvZWxhZ25lbGZAbnZpZGlhLmNvbT4NCg0K
SSB3aWxsIHJldmlldyB0aGUgb3RoZXIgdHdvIHBhdGNoZXMgYXMgd2VsbC4gVGhhbmtzLg0KDQoN
Cj4gDQo+IFRoYW5rcy4NCg==
