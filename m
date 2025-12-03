Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 060C9CA16A8
	for <lists+nouveau@lfdr.de>; Wed, 03 Dec 2025 20:35:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A74C10E80F;
	Wed,  3 Dec 2025 19:35:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="NfBKdE6X";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from SA9PR02CU001.outbound.protection.outlook.com
 (mail-southcentralusazon11013069.outbound.protection.outlook.com
 [40.93.196.69])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1064010E81D
 for <nouveau@lists.freedesktop.org>; Wed,  3 Dec 2025 19:35:48 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Y8ugH7iyz3kLvopYYlJVCL+OC9l8Rp0+v0jUF8yndS6szMeaiYiCUOj2mVn/sYPhwSPA10CE4bVTtm6ikld/PtNQNwSfLUm8B//bY0XgKOGlb/OSLe+aw/xqInJpF8EZPUMsehQ1IEjP/7ZdxpuUfa8qsGifiWBK1So7XNmi1vkcw2d0XICrnpmUnvIFklwQoHpr+akMVqBExy4BwwQuuIfETZTv0ZMCKu2on6nnEYcIdcXPYAYmm2igUmBmbew4GsAGEVEsQFUHG6spYcUSyxuY1HjoeDqsfjZFuJ8pEg8BF+KmrKyMsCwe6y9aT/a9Ogy9Qx9lXerLEzflHXmDXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TdCVlRpk6WxgG7b3/b7TrzbPNkZyZtaTfM5gLMrU5Kg=;
 b=hWjoI0Qp+2XAD6GmqtSbpttXomQzncH1Whc9OZJ3fnlGYvk+QuWs5uDcdaRsnVsDeCZqTeAQgEUlA63MYvwv/tKXEPyXz5eIj4uK31twMbqJ9Hnyjk1axLiNndNBFVfkFu3VdoxUOIuX6nkHOxXA6gmWLMeCAjwuUHoZpZWiehZISSX8pik85Uw6tgCcZoSc78yKMSG79PjtoKg5vz0r8mKhujIYUhZzYdmv0qHPr0ENj7v/Hq5Km6ITCCYn18WvyLt6ebhVTpIHJrfF8RGRw8OToZFTqWS9g9z9fgHk7GIRcE/gHFufYheklyflRiDEpS34fkiIDL3wT+XDstBp5Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TdCVlRpk6WxgG7b3/b7TrzbPNkZyZtaTfM5gLMrU5Kg=;
 b=NfBKdE6XKIqUuxVjR75EEeavvyNxzWyi7IuEgQ4NS4ymXreQBvzjmhkVkOZYDfWXKEX5ugDnlkqtUUNZAmSYf0JL03z6HPAYX115vgSCrC9obXjeLdnpvLTbM0xo/zsTHX+c08nS3mkaPAy19SPkZ4JEJABpxUPxqKztY8SuPuY3YwArokMg+TZUi4aXL426GP/upEvurjLqZrlTJHf/dHWXTT5xoBzzUNJAJQ29w/t3FAmmO1Kyrw8y7/7B/ynLriLI3eebfYsGfQKR5Vx0w3rL2zOcWp2MB1e6as6dS39Ogbja11BS6gtbvW1fRwMiQCQglHuKpjgMn50vYCJh9g==
Received: from PH7PR12MB7937.namprd12.prod.outlook.com (2603:10b6:510:270::21)
 by SJ0PR12MB6879.namprd12.prod.outlook.com (2603:10b6:a03:484::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.17; Wed, 3 Dec
 2025 19:35:43 +0000
Received: from PH7PR12MB7937.namprd12.prod.outlook.com
 ([fe80::805e:c531:4f9b:57f6]) by PH7PR12MB7937.namprd12.prod.outlook.com
 ([fe80::805e:c531:4f9b:57f6%4]) with mapi id 15.20.9388.003; Wed, 3 Dec 2025
 19:35:43 +0000
From: Timur Tabi <ttabi@nvidia.com>
To: "dakr@kernel.org" <dakr@kernel.org>, John Hubbard <jhubbard@nvidia.com>
CC: Alexandre Courbot <acourbot@nvidia.com>, "lossin@kernel.org"
 <lossin@kernel.org>, "a.hindborg@kernel.org" <a.hindborg@kernel.org>,
 "boqun.feng@gmail.com" <boqun.feng@gmail.com>, "aliceryhl@google.com"
 <aliceryhl@google.com>, Zhi Wang <zhiw@nvidia.com>, "simona@ffwll.ch"
 <simona@ffwll.ch>, "alex.gaynor@gmail.com" <alex.gaynor@gmail.com>,
 "ojeda@kernel.org" <ojeda@kernel.org>, "tmgross@umich.edu"
 <tmgross@umich.edu>, "nouveau@lists.freedesktop.org"
 <nouveau@lists.freedesktop.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "rust-for-linux@vger.kernel.org"
 <rust-for-linux@vger.kernel.org>, "bjorn3_gh@protonmail.com"
 <bjorn3_gh@protonmail.com>, Edwin Peer <epeer@nvidia.com>,
 "airlied@gmail.com" <airlied@gmail.com>, Joel Fernandes
 <joelagnelf@nvidia.com>, "bhelgaas@google.com" <bhelgaas@google.com>,
 "gary@garyguo.net" <gary@garyguo.net>, Alistair Popple <apopple@nvidia.com>
Subject: Re: [PATCH 01/31] gpu: nova-core: print FB sizes, along with ranges
Thread-Topic: [PATCH 01/31] gpu: nova-core: print FB sizes, along with ranges
Thread-Index: AQHcZBn8ixjqr6V/L06iu5vQLLf0zrUQT9EA
Date: Wed, 3 Dec 2025 19:35:43 +0000
Message-ID: <049fe68f61f354236a68580d82dce214f7d927c1.camel@nvidia.com>
References: <20251203055923.1247681-1-jhubbard@nvidia.com>
 <20251203055923.1247681-2-jhubbard@nvidia.com>
In-Reply-To: <20251203055923.1247681-2-jhubbard@nvidia.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.52.3-0ubuntu1.1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH7PR12MB7937:EE_|SJ0PR12MB6879:EE_
x-ms-office365-filtering-correlation-id: 3f0df653-66fd-4f88-d77d-08de32a3261e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|7416014|366016|1800799024|38070700021; 
x-microsoft-antispam-message-info: =?utf-8?B?ZGlHeWVoMkpRQUNkOWtBaE5oVlNLTmFUM08zcCtGWndGNUJoNFhQY0pqT2xy?=
 =?utf-8?B?QjRqOEx4WUdPU0tTYWZsVU8rUVZQM1I4RGcwYjNnR0xONEZuMHIrNmlaWlZC?=
 =?utf-8?B?R1I2N3VRUDF0SWRFeklVSmdMcStzMzFKaTV1bUpYRlYzNWtxUVVvYkttYkNm?=
 =?utf-8?B?STZPMytVb09VTzFPcW1jTXBEa3hlU3JUcnNDeHliMW5LdmxwR2JsOWhSM3Fl?=
 =?utf-8?B?MHNwUWVBYk0wVzF4KzlWUngzalNHa3k1d2NzUFJNVlNxUW1xQ0E4MG1jUWFC?=
 =?utf-8?B?ZTdTbkxPanlkSWJnVVFjekczTUlEODR4NlQvUE5EVlU5c1hPVFB5WllJRHFJ?=
 =?utf-8?B?bTBCOEdzU3psSnVCc3FJSjY1OEEzckxldEFQTnQzU1ZYZ3NBTEZLUUhraEll?=
 =?utf-8?B?WThBRWt4b0RDeUl1YW1VVmozSVRrQ2FNRFd6ekkwaVdvNHdabnBXa0FWV3c2?=
 =?utf-8?B?UFZmMWl6bW5qNkRyNVQ4NXV3UjBxczlWVXFiMDNuc0hFUU9zVWpwRzRlaXFE?=
 =?utf-8?B?TFZySnFqTmNHMG11RVc1OCsyQjV6Z0pPY0hZLzZ4Nk1TZEZNNVNSeFJ6SnM5?=
 =?utf-8?B?R2JKc3UxVVh2QzVkaGRHbFN6WWZMSGJJaHplSnlvUmp0dVhzZCtYWklnK2ZF?=
 =?utf-8?B?cWlRS2FLV2RqR0w0SjFydnh1LytQRDRhb1A5bjcyRzNWZ1hGaTdxOWFiazNj?=
 =?utf-8?B?RFVpOUM5SW4rUlI1dU55UlFUMVM5MTRGay9QcXh5RDBMekpQc09nYzlkNCsr?=
 =?utf-8?B?OFA5OHlVZDA1QU93RGdMV281OU4wK1VLVXRJeWdybHZUWkVUOW1jTGF6UTFS?=
 =?utf-8?B?RXdlMkZiTWxUZGZoL0hPSWxDN21iUGZhbWFOL3VBNmpJUjMvYmZqRGhWYmxZ?=
 =?utf-8?B?NHRKb2FCTEpEUmZJOFlyQlZCTzNGVXo3amo2bEczUG1tN0JGRzIvbFluWTZu?=
 =?utf-8?B?b08yTmxvdURMUGtIWTBrVVZzRFdiUWp5TFEyUkh5SHBwejROVzdOUzlteG9o?=
 =?utf-8?B?dFMrN3RJd2VVWEQ1QWZHYmhVUlI0NkhIVmdvTmhoa0FhYWtwMEl6dldQMmRB?=
 =?utf-8?B?cDQra2pmTTRTdjJnMy90TUo1dW43ZkZKSDRVVkFyNXZJcVZyMzFSTEpWc2Jr?=
 =?utf-8?B?Mmg4N09ZOElneUJ0WGpBUmJOb0JRVlBIbVpUd3hBZllEUTBPUXU4blJTM3F5?=
 =?utf-8?B?aGgwN09HZW9QK1Q2SlVJM0tsNWxkWStOZ2JhU0NHUlVLUUQrVXJPVC8ycjZy?=
 =?utf-8?B?SkRxR3VyMnZHNFpNVEZ3bVFEWkN4bFpoRzJOaGo2UFlHMklSSDQ2bWRPRlR3?=
 =?utf-8?B?OXBWdU1zOHBOaWlWWWNNcXBVVWR6YW91UlkzSlVXb0tubjJKMHUzVGQ3ZU1V?=
 =?utf-8?B?RVN4RGExMlpRZnBEdmM1cnVZa2srOFpaYXlzZ1BLbEJiSHhBWVhxQ2dySE5Q?=
 =?utf-8?B?NE12T2FZd3N3RlNxdUtYVGpqdVhxaFNSY1pYbDdvTjM0OWRqcXhacHg3MDZR?=
 =?utf-8?B?UVlBY3dnTnZhZzAvdnc1NUdxSXZMbEQxc0Y2c2Nqejd5d3J0S2xWMk9TVXpK?=
 =?utf-8?B?N0ZoTysrS3E1a3NjdEQyUkZzRW5Yd1dzUGRXRjBhcy95RGRLaXFXNVlkcWo5?=
 =?utf-8?B?dWxYR1dLREpZSDVmRU9RaGhPZS9HU3ljTm4rWUJ5YUtlWXRoN1hFWE1SRHl6?=
 =?utf-8?B?eFR5WXQyRkt2RDFsc3AxSDRva0YrNDV4U2NoU04vQ0hZVzI2d0tKejBzK2Rs?=
 =?utf-8?B?ZnVmOXRJV0plSU03bktMSE1CSDhjUmF1MVJNWElrZ0dtY2pCbmsvcGthV3Jm?=
 =?utf-8?B?QWhiZEZSaitwMTNJVkZkU3cvbFFtWHFSTXFYZEs4azlZY1RLcmZpKzlHOWFq?=
 =?utf-8?B?ZklQYTlBOUpudWFhM3RLajMzSEh0SDBjcGNiTVlnWVFrRWNHSDZiQnZVaEdp?=
 =?utf-8?B?UEhMWmNJTzByVW4vYTFiYzRQVjZzZVU0RGhIQmVFdmo4YzI5WTdwK1IvWXpV?=
 =?utf-8?B?d3BKMnYzZTFYN0lNUjdsOHdUb2Vlczd3SlRsS0ZGd0hITnBBUWhzcTgvbExE?=
 =?utf-8?Q?wKBejW?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB7937.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(366016)(1800799024)(38070700021); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?dS9QTHNhaXQxeXFFV3JFNXU0OHJwa1JVVjUxYlB0enAydmtkd29IcEpFaU45?=
 =?utf-8?B?dFB6REIxcXNES3IrcEovMStZM3VOYmFHcGFTclQ5ZlZzeENPTDhyUHJRQ3Za?=
 =?utf-8?B?SzV0QTJDRzlhN1ltYk1qa2VqQ0NOdldJT0RveE9pdTJsaWMrbXZBYVBrWGNQ?=
 =?utf-8?B?TVhmSW1XampMZ1ZNcTVBOVI4STNiTGNnd3dKbFlJQnFLcitVeGVvbzgrQTAr?=
 =?utf-8?B?TDhkVmJLMjhxRW5sQTdHSGVXeHhzd2lMY3RseG1FZ1A4Q0JtQ2t0cit2bjh2?=
 =?utf-8?B?ZGV0ZVlUKzRwREk5U1pEN3BCT0dzVXJzSXZka01OQnIyUDdzZE5yazZaenVh?=
 =?utf-8?B?eHBvTXBKY1A5cGhYSTFMYnRELzJ2UkdZaFNvanlzQXQ3cmtVVncyVW9FUlh0?=
 =?utf-8?B?ZFRNVTIrM3pjeDBNalRuM0xZZmFwaER4ZmdHbHhucDVzWURCWmR6NjNkTUFY?=
 =?utf-8?B?aU9hMnVFT2JHWGFNQ1dzcVovbzFXK2NBamszWUNueTFuL0gyOUswS05iZXVP?=
 =?utf-8?B?bzdSTFNiUWZJYUFGZ281SHhUWlhTNE11TDBsRkUzYVNpMXI1a0tlcHJxTjkv?=
 =?utf-8?B?ejZJY0NvU1ZzdFlESGI2TVZYWnIvSlV5YUNOeVVSelM5cGtMaEdRZFFiS2Qw?=
 =?utf-8?B?MzJmc0V2aVBMR29sOEExWEh4R0FRWTYzVHZFaHNXQXA5REhSZUt2NENsUG1x?=
 =?utf-8?B?UE94LzZBVDgyQnNRMEZEbDg3NzhRTm8xOEpLV0taNHNsMzh2dEVybk9Yd3RZ?=
 =?utf-8?B?TWlWeWg0cm1PVFBDZFp5THFTZGhCRFJ3TUh1MjN5YXhvc2hMclBSd1hNMmc5?=
 =?utf-8?B?RHRYRktZNmp3V1NCdm9BRGlmWW9ZZ1p3U0RLOFhZSit4dWRoNlRyNkxjMGVL?=
 =?utf-8?B?MjNaWk15YjRHdWRsOW0raldwV1NLdjNqTlFqajhhQ3RyWUZhaDVkY29BVXcz?=
 =?utf-8?B?RnlLZ3dvRFdzRWxkN2ZMSlk4eWhnVHExcnhvYS9Rdm00SEZtblZOSGoyMTYw?=
 =?utf-8?B?UWRpUUdTaTQvZndZL0FpbWVjeUhsTUtXMFpPUGpWbUhSekk4eFlScGw1RVdy?=
 =?utf-8?B?M1N3RzRMNjJLWE5OMkJmeU5OQjFDenJhTGdyQmdzN2I0cVk1YjhCUFVwVzhU?=
 =?utf-8?B?cEtHdDRTcEVDeEdkUGVzbjVhQ0NFaFJ4Ymc2Um9TbXFJdW5MQWEwenc4bytN?=
 =?utf-8?B?dVdsdEdtd3ZwUGJUa1I4cW1xZElpQXd5ODZVVUZYSk1DVlRvMDREZ1A2K01o?=
 =?utf-8?B?cUZaN0oyT1Zpb013YnEyb3lRVnBLLzI5NDRQSFNTS3JUWTZpMXltWWhIekQ5?=
 =?utf-8?B?NEZGaXp6a3Bab29CRWRTUkMwWjFpVFgzSHMzQ1c2KzBVc1VSZFM5QytROVMv?=
 =?utf-8?B?UjlQRGlmYXoybnlPTEExaS9XTlAwUmZXZWhkenJYWDk1cjl5YXFXL25qUnFh?=
 =?utf-8?B?S1JMVmpwR29uaHd0VlUvUGM0TytWZER6YkJSY3BDS2dsOGtBNWlvUlFQTXdU?=
 =?utf-8?B?Ylh3T2R2ZnFPLzVoeGt2Tm1rVEhyMmVzQkVkNjZINHFXOWRNTHFVemJ0WXly?=
 =?utf-8?B?aHo3R1RHL0x5WUJCWSthL24vRTNHT3dVSXpmR1J1Y0FLa1RKTzhGcjk3TXVE?=
 =?utf-8?B?M3ZpMSt5a2JNV0R4endmcjZEVENVcGcyQmx5eE85UEYrcFA2ZWJXVUYxZjRU?=
 =?utf-8?B?b0dlNXB5ZzFvYm5GNVFhU1I1MnNuVndMbTBBdnR0d3oxdUJRMi9OL1ArZFRa?=
 =?utf-8?B?d3d5a2NWRCtiM1JpQmZPeUZsV2ZCWTBwYmxiaEc4bjhFZFdzZmJuM2I0aGRn?=
 =?utf-8?B?Y0pzbS9DT0tiRG43aTltY1dCalNDaFNyeHU0V1d4QWxhQkZ4V3RTQk9JVCtJ?=
 =?utf-8?B?MlFCbkZOYzF3R3IzNE5sdkJyY21rR3dZenNoSHhIbUtueUFDd2RyTG84czFB?=
 =?utf-8?B?dThkQlhaZzZXR1BTSllCNmNNU0pMdlZ1NkZoNzczSmpCOEpONEJCRGlsUHhD?=
 =?utf-8?B?ZEE3Y1dUdDVGeEw5UzZLK2lkUjRoUXN0dFd3b3VrdjBpWkJiQUYvQ0lqb2k3?=
 =?utf-8?B?SlNHKzZHL3NFWEUwMXFRWURKbHFhN3A1OWY3bXVGajdrRmMwUWNiMXNIV2lK?=
 =?utf-8?Q?eTNuiOSGaUOe+bjPUsfwg4zwS?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <C76E14081EA8D443956BE3647BB12F80@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB7937.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3f0df653-66fd-4f88-d77d-08de32a3261e
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Dec 2025 19:35:43.3581 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: KHg5Sdz0Hms/K5sh0t/5BMTK7Vd3tgP30pcr/0xSuClyNYbriy8RGjL+XGT9YLL3DNXPmXGiURsirKM3ufr64w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB6879
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

T24gVHVlLCAyMDI1LTEyLTAyIGF0IDIxOjU4IC0wODAwLCBKb2huIEh1YmJhcmQgd3JvdGU6Cj4g
K2ltcGwgZm10OjpEZWJ1ZyBmb3IgRmJSYW5nZSB7Cj4gK8KgwqDCoCBmbiBmbXQoJnNlbGYsIGY6
ICZtdXQgZm10OjpGb3JtYXR0ZXI8J18+KSAtPiBmbXQ6OlJlc3VsdCB7Cj4gK8KgwqDCoMKgwqDC
oMKgIGxldCBzaXplX21iID0gKHNlbGYuMC5lbmQgLSBzZWxmLjAuc3RhcnQpID4+IDIwOwo+ICvC
oMKgwqDCoMKgwqDCoCBmLndyaXRlX2ZtdChmbXQhKAo+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
ICJ7OiN4fS4uezojeH0gKHt9IE1CKSIsCj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgc2VsZi4w
LnN0YXJ0LAo+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHNlbGYuMC5lbmQsCj4gK8KgwqDCoMKg
wqDCoMKgwqDCoMKgwqAgc2l6ZV9tYgo+ICvCoMKgwqDCoMKgwqDCoCApKQo+ICvCoMKgwqAgfQo+
ICt9Cj4gKwoKSG93IGFib3V0IHByaW50aW5nIHNpemVfa2IgaWYgc2l6ZV9tYiA9PSAwIG9yIGlm
IGl0J3Mgbm90IGFuIGV2ZW4gbXVsdGlwbGUgb2YgTUI/CgpBbHNvLCB3aHkgbm90IGp1c3QgYWRk
IHRoaXMgZnVuY3Rpb24gdG8gUmFuZ2U8PiBpbnN0ZWFkIG9mIGNyZWF0aW5nIGEgbmV3IHR5cGU/
Cg==
