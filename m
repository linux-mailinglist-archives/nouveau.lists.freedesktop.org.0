Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DF17CEB393
	for <lists+nouveau@lfdr.de>; Wed, 31 Dec 2025 05:26:35 +0100 (CET)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 3551010E958;
	Wed, 31 Dec 2025 04:26:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="BlSI2UCB";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 2E4A044C67;
	Wed, 31 Dec 2025 04:18:34 +0000 (UTC)
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1767154714;
 b=LY0yLUDGa5bLbXHM3JUOlBErhll1PxIgceMG5Z/v7czKc0FYvFmuYukRcSGSMIkdc4hDH
 d1oPlT77JqxnwTpHlQkXmbO/phRHCbYE8wfNrVK6IFTcbfLbNEjZfk0KEFXkqJT4KnvQwSR
 6HckZfm5r6co0ZphTJxOYdmy4GgzW48oFn7qGGp1zZXA5WgOXqmvx2ZI/nvrM2DrGuq7pgH
 HHbkFuxhuVDRZJsmKYjHKwHscfG/hn/hX9pI8rBbX/0IWp6SFI8Fa7Np/wDL8+AeL9bftQs
 QrejinZsVUyYA1emClO3x0U971O5P01A/HMrUaeRAemQEMD9nWM2nBzqvUeQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1767154714; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=Y1Av03PekP9V8JctHdqvUfo7SU6SeFkx+0yEF/2f5zY=;
 b=uF5B9CNJORwfZjA1N2qWrSlDGl0CIt2u1lnDQglqHNILi/dqlzOG2VqSheaxInFGsl8c0
 mYqDN9Ce5MKHEDU8ZmiDQWvmeTL2tJ9JG45G0gLURd7Ye7Xg+w9hnTyPAoql9O4m9+hanx9
 rD1qeqs7oi2eJvRIwNQoOsYzVI89ZYg95uUBEgR4ng+wZH29jn99JkmcRXiXexV4838H11N
 ZkmZKetK5hNC9661/hEZ8JkPiDIVmGOvOEsXCE5dl/GOjYDpQKtTCAyedNDa8wMxpoo4GIP
 ZJ8QQBQPEhBahVbYbcitKqN7e8DQdnxWRzTd8XiZmg8bkAzGcVSwf+w5IgDA==
ARC-Authentication-Results: i=2; mail.freedesktop.org;
 dkim=pass header.d=Nvidia.com;
  arc=pass;
  dmarc=pass (Used From Domain Record) header.from=nvidia.com
 policy.dmarc=reject
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=Nvidia.com;
 arc=pass;
 dmarc=pass (Used From Domain Record) header.from=nvidia.com policy.dmarc=reject
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id E1738400F9
	for <nouveau@lists.freedesktop.org>; Wed, 31 Dec 2025 04:18:31 +0000 (UTC)
Received: from CY7PR03CU001.outbound.protection.outlook.com
 (mail-westcentralusazon11010013.outbound.protection.outlook.com
 [40.93.198.13])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 8A80D10E095
	for <nouveau@lists.freedesktop.org>; Wed, 31 Dec 2025 04:26:30 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IIxZvBsRJwY1Ft+1yAakQ6cZWknFr8Eu8YzgaXZz7fLL1h6S8Qij4lPbOVZ50rtqNz3JnPoQ/WB6C+cnetHGLenldRWcAx0NU63WNAP4vmewVTob/g7w6389OAjJA/BIofCcOenrprkaKAWTzK0YAwuD3TcAgBX+N2aWC5S4u8AFNvAlrgIL4gNAlGe1uKvTfwEH+x4Q36tdt+lEbulRLDkOsDjJimQYNi+/yR5nqygPUzeu4atKfLM1FNKRvQ0IYfEqTv5NE8S3jBZfJMPG816BtsmAdfKutX/9hwNakwDS4riaIpcciAPoXkKY0SEMcF8Lv1VMa9UCPl2nFOG5jg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Y1Av03PekP9V8JctHdqvUfo7SU6SeFkx+0yEF/2f5zY=;
 b=dIao581udIvn6hEzSPrYV6Rg56PKSlwF/RxYkOAUJJ/c8SAtg19dzX46TYdZalSaQZfKeSg0FBQoQ8eieaFJqSe703c/wLEff+CEzoPwiUh8nXlUU50erO5OE8i9WgHJOetglrATEIZrjBtrRfFbOEwWWm8zzT5A/ZvjdBVSW63/3S8t0ooMnEgt93SYnKqjujluMlGst/EJPBXnVPpBsrturXpOfjZbTeg/5L2yoKm+mDVJ6ks/vFMRdMoHDv7n7B9C1b0ZPEWGBm5vkAocujvo7XEezHgCCUrPN+ldNhYDY+omm1Jk+BCgoGwK0WFNovcS+IzzEhXS8snraCuIcQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Y1Av03PekP9V8JctHdqvUfo7SU6SeFkx+0yEF/2f5zY=;
 b=BlSI2UCBhdkWRt1yAk5yg2swe6J+TRFmp+YmzFMeQSNtgF8lWoWXl/36VCGeDCBnPRthy0WM6cy5pZrYQ8jFSlPv1vOc3L82cQEnTb1bRx8JrF8OocHXTcrQSK8XnIKPNnyrfUV4doznqzuPuOBSOC7tI/UNIOu8nHdK0HAO9a2GuIzilelj8HhclYcQkP+kqBFcxpDbPGgVWssmK41xya9KFq1pRKM9fYZiL2oZFG+52yhFfSsgirXMVS2qGd3N5b76UphHuyxYS+KX98Sslpt0Vr6FkkuhSHVh788WMEozwgiODfqudMFN2pvL1zwxEens6Stzr7/nxyTd4StA/w==
Received: from SJ2PR12MB7943.namprd12.prod.outlook.com (2603:10b6:a03:4c8::10)
 by DS7PR12MB5933.namprd12.prod.outlook.com (2603:10b6:8:7c::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9478.4; Wed, 31 Dec
 2025 04:26:27 +0000
Received: from SJ2PR12MB7943.namprd12.prod.outlook.com
 ([fe80::6a18:df97:8d1a:5d50]) by SJ2PR12MB7943.namprd12.prod.outlook.com
 ([fe80::6a18:df97:8d1a:5d50%4]) with mapi id 15.20.9478.004; Wed, 31 Dec 2025
 04:26:27 +0000
From: Timur Tabi <ttabi@nvidia.com>
To: "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>, Alexandre
 Courbot <acourbot@nvidia.com>, "dakr@kernel.org" <dakr@kernel.org>, Joel
 Fernandes <joelagnelf@nvidia.com>, John Hubbard <jhubbard@nvidia.com>,
	"rust-for-linux@vger.kernel.org" <rust-for-linux@vger.kernel.org>
Subject: Re: [PATCH v4 00/11] gpu: nova-core: add Turing support
Thread-Topic: [PATCH v4 00/11] gpu: nova-core: add Turing support
Thread-Index: AQHcb86jUh4zxo0ySUOi4HmApuhn2LU7IyUAgAAYf4A=
Date: Wed, 31 Dec 2025 04:26:27 +0000
Message-ID: <4f83e5e3a7e32ccccb94651ea4cf2a6e0eab8ca9.camel@nvidia.com>
References: <20251218032955.979623-1-ttabi@nvidia.com>
	 <858af758-e5a8-4c9e-99ed-65ddffef4c31@nvidia.com>
In-Reply-To: <858af758-e5a8-4c9e-99ed-65ddffef4c31@nvidia.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.56.2-4 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ2PR12MB7943:EE_|DS7PR12MB5933:EE_
x-ms-office365-filtering-correlation-id: b5decd59-6dbd-48af-b236-08de4824c3e8
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|376014|38070700021;
x-microsoft-antispam-message-info: 
 =?utf-8?B?VlRkTGpKczl4RFByaDdLa01Fa2p6dXN1aFo4Uit3eU9FcDZ4cDY0RGJuNDJi?=
 =?utf-8?B?dS9mYzdTRWVEaDgzbExRL1h6Q2xJVU5WQ2NOUlppMmg0SCt5VTN3NHJLTkNa?=
 =?utf-8?B?MGMrRllQa0M3a1orbXI0M0R6bjlWR3FzN3RibnJKbmxKZWdlcktBYkdQQ1pj?=
 =?utf-8?B?K1BQMWVFZU5LQVZ3aTFhS1NQRjR4UzY4MnJQYTI0dUcwR3ZBUk5ST0g3dFFj?=
 =?utf-8?B?aFVlbmJvOVR5dzd3UHBMeGI1Rm5QSXZEM0g0MlYyMkpiWlI2KytLTGZvOXQ0?=
 =?utf-8?B?akljZ1lScTI3Nlo0RFhTaDZSbWJCNUVDYlhzSVRuYVhVd2tVeUl4bTZINzNj?=
 =?utf-8?B?WDY0eDQ2Skl5b0FEdkFBMDQzbzVjTHN4K0poeThzL29pd2pkdjVBUm5WQUMv?=
 =?utf-8?B?aEdIcEFFZDBNV2NLOGxzbTZQYlJ2VEU4STQyWkZ2WFFOWVlaZGJVOWZCM2pq?=
 =?utf-8?B?dVlJK0g1aVo5Zk9UYWJzVlRFMENheDkzK00vZFdSamxhd08yL0RQejZWc0FL?=
 =?utf-8?B?YTJ1Qkd2TjdFTGc5YTJBaS9RS3JHSFZWMEdtcm9Yb3V0WTRvdG96Wk1DQ3lN?=
 =?utf-8?B?QVo0VTFtMGJNSU5meUUyMGdUT1dWMHlnbmJqZVlSVnJ6R1dMWEMxNWtrYkQ2?=
 =?utf-8?B?bmtKTE5qM29ldjdxVzVmMmMvWHZ3RUtaTG1MQ05mYlRvNUdZem5KVlMxYjZi?=
 =?utf-8?B?am1iQndHQ2RSeVArMW5RUTIwTzdRQ005ZGMrNkoyQ3hGVW16aHhJTEJSUUJG?=
 =?utf-8?B?UGRRaGY1a29CU2lieG9NTWpBeFZ0Rk04R2xsR2lmbnI0TDFhc2pjS3dVTWJH?=
 =?utf-8?B?WEhqN0FyMm5INGc0SEN0SFJYaVFXTWxzSmZ4QjVFWUxzSURIbUk1NW9pWSsw?=
 =?utf-8?B?cWlhYTAwcEZubDVSU1h2Ym5zdTBuOFU3VFNYRHgwWHlnamJyTmg3U2Y0Y3hn?=
 =?utf-8?B?eWxwVmd5YzJTY0IyckRKNGxwcHJQVlFaQWFxamhNcXMxbGJJUC9TWlZDR2JG?=
 =?utf-8?B?MmxrTWpWQjNtL241TmhwK0JDL0lQT3dmSDZjQit3eEIxK1cwMWVRblk0OWpB?=
 =?utf-8?B?dWVuZDlla0RORWtBSWR3VVA4WnlsMkdoRE5Jb0t3eUoxb0UwZFlqSFM3dXJP?=
 =?utf-8?B?M1pmY0JyanJYSDdpdlptTWk3dTFVMVZ4ZDk0Q1c0dS80dTVTOCtvZ1BhSk83?=
 =?utf-8?B?Y2QvbGl2MFNpV0E5WUVEVTJmN3hmNnF1NXQ4UFBUU3paV0EzZ2ZTZW9rSVRC?=
 =?utf-8?B?RUFwbTQ3bHdOQ3psT1N2N3UwK0w3Y3pyNG9ic3JQbWl3Q21Sc0lKMGdGYkFT?=
 =?utf-8?B?c2lOTTVjcDMweEhkeE5vOUxDTmtoUGYrR00wbVJQMzBnQ01NRVYyWVgrNCs1?=
 =?utf-8?B?Znh1MjNtQnBlR0VYMzJoZjN5UVVxQ3FZd0R4alBBb1FOdEZudTZnV0lpMXFm?=
 =?utf-8?B?RlZ4ZUYvSE5wMmVDNE9qK0RUQnd3dm5zU2R4d0ZwRU1Fb1QvV1gySUV0NnR3?=
 =?utf-8?B?bmVSZUQvMkMwVk44aFVoZ1U0czEvcDd1UThFdlg5TklSaFh4MzNUWS9wNSts?=
 =?utf-8?B?aWYwQ0lkWGRqMGVQeXRXSmprUm16UXZXUW9NLzJOelhnL2ZDblgwOTBHNndX?=
 =?utf-8?B?VmUySnhuamRydXJVem84K3V4TysyWGkzcm94TUttREdaQ2JLNkJDakEyL2p6?=
 =?utf-8?B?QWpYNWNrbUxGZ1EvNHQ0NHJ4VlM0dWwyN3pLRngxWE9nMllsRnRyU0pWZ0JX?=
 =?utf-8?B?c0VQOGxlQWxLbVpJaDNBUXhTZEphUDdjK1dRK0tSMDhiRG5MOVNNVjBxZk9P?=
 =?utf-8?B?QkxBTGcrMGhTVXJ5bm8rRGNuRm5RN2lyVW11cUxHKzdzYW9jMEppZFNxWkJF?=
 =?utf-8?B?UlVISWRsOFgxTVBsY2lOcGJhbG81clhHZHNYdUkxT3VwVW9xZkE0TVNLajc2?=
 =?utf-8?B?cUJiRFdiWFg5TzFGejNPdXNFUlREU2RRRmtxTUMzWmFpNzBHY2RKazRwM0Ez?=
 =?utf-8?B?R0s1QXpFbDdtN2pySmFwMGp3V21qanhNK3JsbnUyalgwVzMzMWlaZlViT0t6?=
 =?utf-8?Q?YrR4GZ?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR12MB7943.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?RWpuS2d4aEU5bnRLdWhFZnR3STc0dllaTnVscS83T2xkOVhSWDFhQkJFRmtP?=
 =?utf-8?B?KytKajkrN2lWbHYyUE5FRGFUMlc1VHExclR2WlY2Q3I2bURZaE00ODhqNS9S?=
 =?utf-8?B?Z2FFSE52aUkxTnpOc3JBSGpSU21HTDNtUTFaeXJQRFN1RUoxOG9ybWtPVW9H?=
 =?utf-8?B?anJNUU45WThqWjNUMXB6V1N4UElwbEtUVVZySjBPb1dxNDBONVhFYmpPdnhU?=
 =?utf-8?B?azVUUTFVdmp2cmF4QzM2ZlExaFRwcTRmZnFkeTg3bTlKRC9xYW9wb3J4dnFW?=
 =?utf-8?B?RVYxcUhaUXVMS09TQkNoUDlRMk8rbDh5N3RGMWRBMTBndW5KUjlhZFJWZmdI?=
 =?utf-8?B?Z0htMjJRNmpsVk1nQkZXSWxvNklkdDkyWXVvMXBocGxHclpVeVB6SFgzcVpZ?=
 =?utf-8?B?MDRXdklTRDF0WXZsYVhRa1FZTnpZZGhWOFpJU2ZSdHdkOWl0anpjaHcrYnZl?=
 =?utf-8?B?M3FwbFJmZ1BVMVRNc1lNVHlpQ01nRWpaWmErWmZVSC9qK09ySllpcHU5NkRk?=
 =?utf-8?B?VHFXMTlGclNvMEQxd2FIS09GNGxKUEcxSDBMcG9yVDEraWxQQXRwUG1ReWRm?=
 =?utf-8?B?VW1TZFhtcCtucjFiV3NYeHY5aGROYU1iWFBOTTNoUzdSZWt3SFhYOXlDeEQ4?=
 =?utf-8?B?ZWN6THlGcUp3ZVcrdjdPMkhnbUNJR21IZ3pkaG04cHFBSjBWaXRxQ1Z4M0Vt?=
 =?utf-8?B?azhXL0U2WVVodnRyeHBCYklSVlNDalQyY0Z0dDlSaVJKakQ5WnZFby9qOGd5?=
 =?utf-8?B?MWwzWlBCR3kwYTJoUmdhaEFZdklqQldRV1RUNExoRFlSTS9iSkh0bStHaklZ?=
 =?utf-8?B?UlZpNWZaSUJFVmgzVVZSVnFyQU51c1NhNS9TZ1Vsdkx4dTFHUGQxazFjR3Na?=
 =?utf-8?B?cFNpV0FSd3FoTCtuWDRCeENPYURtMFh1RW41Kyt5VGo4cEMwV0ZaYWxsYjVw?=
 =?utf-8?B?U2RSNVdQdmV6TlF2djU2NTM5Z1BaR2lOQWM1MEJ0YkdvdGdhODNDdzJVQnNy?=
 =?utf-8?B?V3hHNHNjMzhFZXZrY011MlhkRXFoOTZjVnhIQVoxb003c01qZ0FMRWpVa2px?=
 =?utf-8?B?R1JRNnBjUUFXSjhxWDRFdUpHY3ZvdGFPbVdoRFdrNTVwK09HMS9IUkMxbkhw?=
 =?utf-8?B?KytMcVpna0pqUHM0dEVPUUtsZnVlTXZkYkVadjREeTRQVlV4VkVxYzBCamdX?=
 =?utf-8?B?UVZBUlQ2ekdqaXZMVjBMTkdsZ3BmeEt1WTBlLytUamRXeXBTOERzUHcvVjMx?=
 =?utf-8?B?N1JLVnlNb1hBVGtjek9KbEhZTnd5Qnh1OXY2Nkl6TnhSNURBaCtGVUhhMm5u?=
 =?utf-8?B?RDEySUdHWHhhRVZpYncvaTRmbko4M0tEekpZVlJkM2l1Z0hBTWNHZFMvZldW?=
 =?utf-8?B?SEtueDNDY0tSUlY3UmI3eDR1OW1yd3hWVy9rbmhhbUIrcS9hZnpYblAvbmFk?=
 =?utf-8?B?bXFGZ0ZueW90cFp6SVp4NEtTV2tJdWtnQTRGdFZYWERQRXhnbjkwY0ZhL0pT?=
 =?utf-8?B?VHVEV0tRVU4zYmZHK2lmdEtFODdnKzdkYkhFNFlxNkcwSDY3VHdtdkRTMXNW?=
 =?utf-8?B?VUNWQ2d1RDVWVkp6ek84ZEFWL1JJWG4yOUNJTEViNVF6NU5SNzhTOEZLeHhM?=
 =?utf-8?B?ZHRzKzhlM2ErSTV3cXRjVU45clpaMkVIb2dMSDBKN0hVMStQNW1kN1dGOVlH?=
 =?utf-8?B?NkdOcmhvR0I0ZlBrNzJ1VzBaRXFYZXZWaXJaejNaNlIwQ1dNeFk1UkhWNDB1?=
 =?utf-8?B?VGt5d3hmeDJtWkJRTmhHSmVRSEUxK25nMGlXcUdicDk2SElPNXZ4YmpzYUM0?=
 =?utf-8?B?ZDBmL3dZdEx4Sk5hVU4xWDY2UUlic056and1MXBqT1BpLzZtZUNjQ0pqa1dQ?=
 =?utf-8?B?ZzNnZXorU1ZyMkZHZFQ0VGpJNFBZNnBac3l1WFRHZS9hTTlWWEdUcHRxWUNF?=
 =?utf-8?B?M2Rray9aSmJwSGZ2OVZ0TVA4Wll5OHB3RHRQcVBGdE8yK3Vpb21DK3pjcm9H?=
 =?utf-8?B?Nnp6WWtrelVtdEh2MmJ6VStnZGZoTGdQVTVlSThWZ01mWXBvM0F5cUYxMFBT?=
 =?utf-8?B?RTBHV2lobFJxSTRscElsQXlaa2Q0cVVIZTNIWTNpc3VOZGg3RWpKU2VTQlhS?=
 =?utf-8?B?ajFqaFlqSk9tUlp1STBZQ0drTmJaM2sxZ3MzN0hKaE5ib0ZoTW9hazZRTmZB?=
 =?utf-8?B?Y1lNY1VHeE5LUFpYd013TlF4VXBxSEZaOUhWeDFicVRoQXNiRldKSWs1eG5j?=
 =?utf-8?B?K2lNd2lsYjRJTC9RRXVWeGowaGwyQXZIRlBPZkZrTjNwUHR5clFNd2tCb05F?=
 =?utf-8?B?T1NlOGFiUWVZNThEemJyT0dldmg1YjRSU2JpKy9Gc21uYStYTlBpQT09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <26E2A70ABF206C4BAB52691BBEE1FB8C@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR12MB7943.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 b5decd59-6dbd-48af-b236-08de4824c3e8
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Dec 2025 04:26:27.5855
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 
 iN2QfH2A6Zy+n3MqKU3wziStWKtD22/h8igPOYxDRmv1lpCQcU5VixWT3Ay5w30WdlsW2Clb6Kghk7iaEJFcPQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB5933
Message-ID-Hash: KFKXMQ5OHF2GPGWBB5FW3VM2S3VOIG3Q
X-Message-ID-Hash: KFKXMQ5OHF2GPGWBB5FW3VM2S3VOIG3Q
X-MailFrom: ttabi@nvidia.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation; nonmember-moderation; administrivia;
 implicit-dest; max-recipients; max-size; news-moderation; no-subject;
 digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/KFKXMQ5OHF2GPGWBB5FW3VM2S3VOIG3Q/>
Archived-At: 
 <https://lore.freedesktop.org/4f83e5e3a7e32ccccb94651ea4cf2a6e0eab8ca9.camel@nvidia.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

T24gVHVlLCAyMDI1LTEyLTMwIGF0IDE4OjU4IC0wODAwLCBKb2huIEh1YmJhcmQgd3JvdGU6DQo+
IE9uIDEyLzE3LzI1IDc6MjkgUE0sIFRpbXVyIFRhYmkgd3JvdGU6DQo+ID4gVGhpcyBwYXRjaCBz
ZXQgYWRkcyBiYXNpYyBzdXBwb3J0IGZvciBwcmUtYm9vdGluZyBHU1AtUk0NCj4gPiBvbiBUdXJp
bmcuDQo+IA0KPiBIaSBUaW11ciwNCj4gDQo+IEkgZ2F2ZSB0aGlzIGEgcXVpY2sgdGVzdCBvbiBU
VTExNywgYnV0IGl0IGlzIGxvb2tpbmcgZm9yIGEgZmlybXdhcmUNCj4gZmlsZSB0aGF0IGlzIG5v
dCBvbiBkaXNrLg0KPiANCj4gU2hvdWxkIEkgYmUgdXBkYXRpbmcgbGludXgtZmlybXdhcmU/IE9y
IHNvbWV0aGluZyBlbHNlIGlzIHdyb25nPw0KDQpJIG1lYW4sIEkgbGl0ZXJhbGx5IHNheSB0aGF0
IGluIHRoZSBwYXRjaHNldCBkZXNjcmlwdGlvbiwgYWJvdXQgdHdvIHBhcmFncmFwaHMgZG93bjoN
Cg0KIFRoYXQgbGF0ZXN0IGxpbnV4LWZpcm13YXJlLmdpdCBpcyByZXF1aXJlZCBiZWNhdXNlIGl0
IGNvbnRhaW5zIHRoZQ0KIEdlbmVyaWMgQm9vdGxvYWRlciBpbWFnZSB0aGF0IGhhcyBub3QgeWV0
IGJlZW4gcHJvcG9nYXRlZCB0bw0KIGRpc3Ryb3MuDQo=
