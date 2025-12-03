Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D05ECA16CC
	for <lists+nouveau@lfdr.de>; Wed, 03 Dec 2025 20:38:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D8EB10E195;
	Wed,  3 Dec 2025 19:38:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="hLgi+G+L";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from SA9PR02CU001.outbound.protection.outlook.com
 (mail-southcentralusazon11013051.outbound.protection.outlook.com
 [40.93.196.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E01910E195
 for <nouveau@lists.freedesktop.org>; Wed,  3 Dec 2025 19:38:55 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PtGrUzTxLZ9b/C+2M3sX3AActPlc2rhirzBg5GLXMKf6F5mTzrgcc8yVC7XymLJKzSyv2+eCQ+o1IrnScrVpC2M9H+jbjwjwI/eUymAsk/mGkwz4ayhNp4Amxmu5mj0ItaBtaz5hvZkKXr8sBdZhpgvK1t/hEhHc3cSu5MT7Kh3oZ49XgMK9iAnsuG9wjiIdO40ndWLXiiH19bDy6X952apbUGjT2/k65sQSV3D32QZKd5wEUWgq+1LEPEuqbCQuoW+W6hlKvs5DyTv6ieLD7xUiasP716QMKZabaKPhXU0rtoo5UKuLENmOTkwfHQACUwB9p+GhbHIAixPy09KIjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VJKqNP8oooY6/VybsBq8R711/Cz5/tQnA4h3iORQglc=;
 b=ghHdXbgCPUxJ4u5aTgQZE0N/4N1qS16BodJCkrjtIOcTSxA/YsxdPFVlc0UrhkzKgjnclvxJQfqJnA7mfetDmA/2GbxkHD2OcxGIOLxksgonVPZBZnhWdnsGMiwL0GQ/P/7oCzzC7DwIJW1KWBiqdvtxlVZBWRs1P/4NQ+dZlS/vnOAxqG9UUWrKyvimm4VUTg2vXbyaJ6UlJyJdy8LDSosYTddeZWLcnqNgAToNzflAOJzUQmyAr8pzY5q/rK/qYP+CntUU0bXpnbPGlG2EP/i+U4XQL5ouyAv8Jj0V/SdS3sG6KBYjmFF4HDO4BQkgCA+elGL6484oz/aUR0j63w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VJKqNP8oooY6/VybsBq8R711/Cz5/tQnA4h3iORQglc=;
 b=hLgi+G+LLkCPDyyxWk41M9AK9QiMwNZt/qKEcfdkM8pETkhY+F6/+LpdIqDK51bbFOTIVnOZ/7PNj/jYEyQMZNsqbHmnLYSwVCQvbC1LB3s+ynYhZAvpGMUl7+7UJgwBG8iWud0QInbH6XVDozuz/jM8P058baLOYUNlZb7MzqoHOj6DtWK85u94lbKWmUD9U7aaBueZZpBFvG52cUwlRu91BpkBxhs4iNgxm7/sKBT43cyC4oSUW6DjPbBe77N+rZ2XEOybaNV2WGzoibVj4v1NB4ccCQY0/Aa1HYcRm16Ak3p4VWI1jTs/RM7jK5N8+Vttl40OePENbIPTxuf2Fw==
Received: from PH7PR12MB7937.namprd12.prod.outlook.com (2603:10b6:510:270::21)
 by PH8PR12MB7328.namprd12.prod.outlook.com (2603:10b6:510:214::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.9; Wed, 3 Dec
 2025 19:38:52 +0000
Received: from PH7PR12MB7937.namprd12.prod.outlook.com
 ([fe80::805e:c531:4f9b:57f6]) by PH7PR12MB7937.namprd12.prod.outlook.com
 ([fe80::805e:c531:4f9b:57f6%4]) with mapi id 15.20.9388.003; Wed, 3 Dec 2025
 19:38:52 +0000
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
Subject: Re: [PATCH 05/31] gpu: nova-core: use GPU Architecture to simplify
 HAL selections
Thread-Topic: [PATCH 05/31] gpu: nova-core: use GPU Architecture to simplify
 HAL selections
Thread-Index: AQHcZBn/9Z9GuiLLxUKdM9g7vxrQsbUQULKA
Date: Wed, 3 Dec 2025 19:38:52 +0000
Message-ID: <831684dab42b6ad4208f74f3c1fa1ed390fc49b0.camel@nvidia.com>
References: <20251203055923.1247681-1-jhubbard@nvidia.com>
 <20251203055923.1247681-6-jhubbard@nvidia.com>
In-Reply-To: <20251203055923.1247681-6-jhubbard@nvidia.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.52.3-0ubuntu1.1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH7PR12MB7937:EE_|PH8PR12MB7328:EE_
x-ms-office365-filtering-correlation-id: 23372122-a050-4fca-3402-08de32a396b8
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|376014|7416014|1800799024|38070700021; 
x-microsoft-antispam-message-info: =?utf-8?B?a1gzTVcza3llRWlhdnhnRmQvTGwzL2I2TG56SFcyVU9ES3hjUEVWdzFIcE9m?=
 =?utf-8?B?dVE3TmhRQm91cDUxaTFaNlk0bmpOc0o1SmpxYVVGcXA5Qm40OUhJUWZ2OUt5?=
 =?utf-8?B?YTlpRHp3RGc0T3pYQnk0LzBsTUF0NDk5UDZUMU5IZFV3bUk0Nkc0NkhwdlNu?=
 =?utf-8?B?Vm94Z2FVQm5CMWcrd0cwL3JNc1ROUC9KYUwyMFB5Z2Z3SVdrK0FNdGFBSWFj?=
 =?utf-8?B?aTArWHRjMUljNHJlL2x2TTVvR1VNOE9iV0x5Uk1OQlJMR1N5UmxJa1B5NWpt?=
 =?utf-8?B?RERwM3Z0QW5MWHM3andIa1loRW1sSFVHYk93RGRjMkJKWlJDdWpoSVZMQ01o?=
 =?utf-8?B?WTJaOHBnS0JieUZiTlJPVXZvc1gwY1o2MytsNXpDZ21OcG9ZOVloUXJndmdx?=
 =?utf-8?B?VWhiMU5FQ01tckJqa240QUt2VW9YUjZ3eWtBZmJIckg0Q2hGN1hRSHZMZG5t?=
 =?utf-8?B?N2o3Z2djejlaS2c5bWNjelNmRlVIVEQxMG5pemcvbmZhYit6SFFURC95b0tI?=
 =?utf-8?B?ZHkvNHNvQ2RBdFR1NFpiTWQ5SjNuZlA0S29pZThIL2JXWnNqVnNyYkw0Q0VP?=
 =?utf-8?B?eWs5QmREUTdFMG4ycGM4dW5VbTN0eVhMVDFlVUVlUmJoaFlyNWxRRkJoR1V0?=
 =?utf-8?B?aVpsZWNmTGExOHUwZEZQd0d3VDNIQzdWQWh6RE1GMDdvUWNnRXVUYTZ6R0N0?=
 =?utf-8?B?L2R3REdpZyt5LzFiV20yaXZsTGZMT3B2V0lNa29FWVYvV0x0OWRzbUNPbWNY?=
 =?utf-8?B?U3ErelBWcDhGY0E4MjR5djI1UE9hUjVUMVdYM1l2c1ZiWGF2WXIrRm9SVkJo?=
 =?utf-8?B?MTJUbG9xaDh5WGVkYS9adFVFekYvMmtKbzRrS2tabWQrZEt3VUJaRWJWODBN?=
 =?utf-8?B?T09WS1BWdEtFejlvd2dmMExsNHNYZFpNWE9qVlFqcWtUUGxxWWVqc05SS1F6?=
 =?utf-8?B?T2h6ZCtRTGNnMEtZT3JnUEdVeWtvZVZBYUR1aVVUUEtUS0h0bmdnbU56RnQz?=
 =?utf-8?B?b0tXUWg1VTNVcWpEVUlrV21BbDFkK0NIYzB5MjQwOGVhTHhrT3RTaERVQ21S?=
 =?utf-8?B?c3c3aEUva3RIZThCSUpzMmxiRVlkRnp6ak03VXlHUWwyZTBzTkJjU01FQTk0?=
 =?utf-8?B?NkNwNDZRSXd3REsxLzcrUStlcEIycm1kSTJhem9xRGFLZTBpdkJjSURtdkU3?=
 =?utf-8?B?NWNxcWJFSzQ4NWUyNUtoWU5PS2ZraFp0Zm8ydy80eGlTY1ZOczF4NmphRkRn?=
 =?utf-8?B?TUhrb0Z0Uy9jcUhnbXdaODJNOWtyQTVFSkdEZkJReS9Sb0tJMDlZSnJSTDJI?=
 =?utf-8?B?RWdKUzhwWk1XOWJPcFpIRUUvTnR4Z2xMdWVRNTlHbGhlM2VLalVyb3ZBM0JO?=
 =?utf-8?B?RjYwQWZmTDR5M3ovN05LKzhVSEZ0R0szM1QyZ282UXh0OTc4MGNHb01rejdx?=
 =?utf-8?B?K1lZQk1CbSttU1pmMEtUU3NvdGI2cm9mUFN3OXhRelA4RUdUS1QvVjN3ZTdv?=
 =?utf-8?B?MkRuL1NlcXhyalFZUURBWlVRdXBSVHYyOUVlU3ZadVFrQmJ1Z1NNOTJudmZu?=
 =?utf-8?B?VEpCRkQ3SzNBa3Y4SlhuUnBrOExCdlFUZlFqSGU0bFJWUVQ4dDg2b0tFYTNj?=
 =?utf-8?B?M1lWTERvNUZMaktsY1o4cDV5dSt6dlZnZFRiK3JRZXpvZUFSOUJXZG9ReTVN?=
 =?utf-8?B?WkpzYnI5K3BYTldCMmk2ZjZBOHZoQ0t6N0hNU055SHVZUGI5TjNSbmVpemJw?=
 =?utf-8?B?cmdGRWxLdW15VmNPN3JPYUpNRHMrRnAzSlphcThISE1TRlMxVHJvL1JKUlhV?=
 =?utf-8?B?NW5rVW1yaDZKM0drdTRPZitXaTh6NEJZL3hOczRBNFhaeDJyS3hjWnRodVhR?=
 =?utf-8?B?UTNRaVVuZldxZTVvSHdaemtuK2p0Nk9oVkFtNmgvWkJjcExTeVJpaXkvTWRR?=
 =?utf-8?B?NkozTVRBU0pMY284T3N2OWNsZStQL0s2QThlU2dTWWxPdWxsa3dZS1NMcmRM?=
 =?utf-8?B?MnV3YmJzS1g1M3VrQnc3ZDNLT0FNdGZjbnF4UUlzRTlVdTlkODFFbjU0Zk93?=
 =?utf-8?Q?QTWTsj?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB7937.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(7416014)(1800799024)(38070700021); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?b09IUWRLMUhyM3lsRUd3M21sRXM5eERGVTdSU2ZjU1JQdlFzcnQzcGxKT3dL?=
 =?utf-8?B?NVpnaUdqSHl2WUowN2ZVRUFBWWdIRXlpYTJhV0VTTW9uTWpjMGRSUDdkTU5v?=
 =?utf-8?B?RFZBNTFlNDBtL3JjRU1BZ3o2WDIvWXlsV2FTQ3o0bERYWWtkeDVJNEwwM0RS?=
 =?utf-8?B?c0tnTklFemYwYytjWGNqdzF5TFhhWWxmemtUSkhKM2N2dkZGTEkzMlk4U1l6?=
 =?utf-8?B?d3pVRUpkUzhHVmJrN3BNdlJ6NWJhOG5QWlkvSE56VU02RDNJeU5vdzBQUlh2?=
 =?utf-8?B?aEczWUtiYzBBTWwwNVg2eVhCVGd5QS82V0hZVnVnZk95aWZLSExwT2IrM2Rz?=
 =?utf-8?B?VHBITWhIU3NrZkFPbWgrU25CMXdLUmV1cDdTQTczL1d0dzM1VlAvYlZxYmRq?=
 =?utf-8?B?d2V3bzRCRnMvVUxCdDdsY2s4enRoNHZwd0U5d1N4R3BKVStPaW5iQmRoM0FR?=
 =?utf-8?B?T2RtU3pMVFllYmcxamR2RktEcEJJR0hMR29KUHJrczY3L1VTTXcvT2NLSTVX?=
 =?utf-8?B?NVM3SmQ2Y1MzM2dPODJyNWJZcm9ZaGtHdE1BcU1WNTAyWTFoL2VhWHBydU55?=
 =?utf-8?B?aVZBU0xVOXBMMnljVDM0Yk5YYjFHaWRmdFg1ZFZkbGpNMEdpRW9lOUZOSU5j?=
 =?utf-8?B?OWNMK3JybThXeW1qN3JKNkFxMmhXRCs0cVMwTmQ2L0Y3QzE5bHU2YVh1REEx?=
 =?utf-8?B?aTFWVk5Ta2liWHM2TE9EekFBYkdoM1dndkJLTDZJakhyTGJaWGdDTE1OdzYv?=
 =?utf-8?B?V2NRNGpNNUpJV3MvbHJid1hKZnFCRjZpUnZtdWF0K0V6SGFNMlBVYjhBNnBK?=
 =?utf-8?B?TlNXVHBJVHFiQlIwTG00eWdFMWdyaUw1YmlRQlgzMzFvSGFZQUwrMFNubUQy?=
 =?utf-8?B?N092a1dSd25qeG55MHlFVzVFU05IbVgwdWFxaisveGIwQXVnaXV6ZkUyeWZR?=
 =?utf-8?B?bUV5TS90cHV1aVQ0bVAxN0I0VEVHUVhXdjJkcVlvK2tHUHFNcTJGdStUTisv?=
 =?utf-8?B?c1gvOEgvSzBEZHN5MUxvUnJMazNkSE9UTE9XVUQ5MmcwMXllZ2pzSEJjU1VF?=
 =?utf-8?B?NEtvRU1kdnNvRnBwVlNnQ3l4VHUrY2ZFS0VaV3U4Qm9hbThGRVVoV2tzbnBp?=
 =?utf-8?B?cU5FSjVpTFBNUU9rNkVsdmY0R2ZlMHppcklMMXZPZDFFbkRBQkF4Tk5MeDUz?=
 =?utf-8?B?eVJQOVg4R2xQZ0RNRThjRk9zZElrK3hWVUFtYjNMTWk2NW1FcXVXem5nY2dU?=
 =?utf-8?B?eDh1TGs5c005RkZXYkJGYmJSRWRuem5uVDd5d2tZdmJoWmdGczA3cmNsejkv?=
 =?utf-8?B?aGZlVUZpeFcrVHJ6Y1lLU2JEVHRoWk8yNjZnRGlSM2R1WUxxencxVUZKRGNs?=
 =?utf-8?B?aUtYWFpPb0RxVVRHMEQwczZYWFlCUjFFeE0zQlZQN0pqejloYWZFcTNyL2wr?=
 =?utf-8?B?aklXdmpLWE5PaElORXJSMkpQU1hEamM0QjVaVGtHblpSVGlveWFEYTlNa2tS?=
 =?utf-8?B?TnlqdUV6alJ5dTJXNG1EVWsxWUo3c1A0Qlh5ZGUzTGl6L3dEa0hDYWVYM3pa?=
 =?utf-8?B?blkvdW11cE40SEFrbitpSDVKbXRMOHdZd1BweUpqSW93L3pJR28wQ2Z6ZHla?=
 =?utf-8?B?UFI0UnAzOEZsYWlFZE9SSjY1aFFkVE13YlR0bkpDS3VmSTVGUXhvY2JVaGwy?=
 =?utf-8?B?dHZ5MWxzVzljSWtkTVU5ZGpub2xyVGQrM3lKVUp2dVBPaW1rdGVVS0tQV0pN?=
 =?utf-8?B?YXBMK2NCRE5TUHoxWFcwNHBSNTRxSmV5bndoWVJqaTR6STJPdEVYWnZwU0Zj?=
 =?utf-8?B?UlNFc1RQZlBrckJ4dXV6UmdEVFF2SHV5cDhqekpSbVNIanMvSlUrb0toTnkx?=
 =?utf-8?B?RzFMNUIxQXdqZ0dQQll4NWdEWnpaQXR4Y01WZm12UGorWWk2c2krVXZmTDFN?=
 =?utf-8?B?Unc5YWkyNjkyWkQ4UWtWV243ZU4rUUtIdXlIeTFFSGZlUkVCNmFaVkpVV0VR?=
 =?utf-8?B?YitNSjZSN3R6UWtZeVdiMjhURlhFWG5SRmd3bE9ZUVRHZXlmTHNiZ0dYaDc2?=
 =?utf-8?B?clRSZDlMM1BEdmxNSGoxY1h3YXZoSnVyb1FzR1NnUm9GWmdhbzJQT2F4bFZ5?=
 =?utf-8?Q?BaqYxaVc4g6ERiXGXmKMhf2Ps?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <D452B5C6B96DEC44BBBE3FEFC8D52B57@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB7937.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 23372122-a050-4fca-3402-08de32a396b8
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Dec 2025 19:38:52.2833 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: WcH5JYANKHHntbFd4Sk88YmTeUAdCbHNQTmtzL4p8w7JRGwqzPDpts8VJ7T7eFCuefcmskwBJwkdmc0J+iAvzg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB7328
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

T24gVHVlLCAyMDI1LTEyLTAyIGF0IDIxOjU4IC0wODAwLCBKb2huIEh1YmJhcmQgd3JvdGU6DQo+
IEluc3RlYWQgb2YgbG9uZywgZXhoYXVzdGl2ZSBsaXN0cyBvZiBHUFVzICgiQ2hpcHNldHMiKSwg
dXNlIGVudGlyZQ0KPiBHUFUgQXJjaGl0ZWN0dXJlcywgc3VjaCBhcyAiQmxhY2t3ZWxsIiBvciAi
VHVyaW5nIiwgdG8gbWFrZSBIQUwgY2hvaWNlcy4NCj4gDQo+IEEgdGlueSBzaWRlIGVmZmVjdDog
bW92ZWQgYSAidXNlIiBzdGF0ZW1lbnQgb3V0IG9mIGZ1bmN0aW9uIHNjb3BlLCBpbg0KPiBlYWNo
IGZpbGUsIHVwIHRvIHRoZSB0b3Agb2YgdGhlIGZpbGUsIGFzIHBlciBSdXN0IGZvciBMaW51eCBj
b252ZW50aW9ucy4NCg0KVGhpcyBtaWdodCBub3Qgd29yayBmb3IgR0ExMDAsIHdoaWNoIGlzIGEg
VHVyaW5nIGluIHNvbWUgcmVzcGVjdHMgYW5kIGFuIEFtcGVyZSBpbiBvdGhlcnMuDQo=
