Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0897CC6CCA8
	for <lists+nouveau@lfdr.de>; Wed, 19 Nov 2025 06:17:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ABAA410E068;
	Wed, 19 Nov 2025 05:17:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="KjhZru2r";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from CY7PR03CU001.outbound.protection.outlook.com
 (mail-westcentralusazon11010030.outbound.protection.outlook.com
 [40.93.198.30])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 12E9710E068;
 Wed, 19 Nov 2025 05:17:05 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=d7g4UAdr9iX2Yn0smGiRTLmzNB/b5ZFPVXlfnxIWEZFIheuLiFHBOfW7H3kw8wJJYaPVdxI2uJSBEbeQFndVE7Ripy4BdfT58Sw48FE/+J68+wsmzuGkjNnrZWJbtQnIiyd5XgAVwa45O7fxWZUty4aMLA7lKN/NK0bRE17zQH/A1UQ6xuTlQclorLK59tG1rmpF29fOGSA70Hhe6CGS/n1h13kucdHs6Ntjq/RSw5BryM3CQzJMt6QmZC4an0OPNB0JrXiq/hOWura8mL6AKEWRL/+q8JjOCbwZCiYGTBS8yU7qK1Jijjv89YPrcF9PJsr9hjkuORbLrHOg7gzQgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IlzQqIcXsI5RnVlIgli8DNJCzGIGH9kxycAdoyiNE3k=;
 b=YA32oDFq+tXvrf/WT238qQW7GWsr7VlMeLgYh6DLqtjU/Nvvhh2n41eodJsC3y/RmdUk2YlfNhjav1DDcPWC/SphdAzf1rF08svVTbmRomp6FSgL9DuFk6Ebjv+J799OQF0lNgIPPEJOB1w+GBGKmSD5CstDpAGuz2mkB6DT78hNz2GfTbwY5NlDTKpYfwlvkmv6F3Rf+tIE0/RXR1NCX6G0SIasJJEidc3mnRqG9Y3iHpVj5al4B2JsfVB4O4DE1Utg0RtN8x6VN1yr3NRZYYnP2YjmqsemSr+QM42HRUtnEUEXKsT9T3IStTdT5aOzo65sVYR4OFBhgWcgLFcy6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IlzQqIcXsI5RnVlIgli8DNJCzGIGH9kxycAdoyiNE3k=;
 b=KjhZru2rGOgF/7wjVWKQ9ZjKtrBPPWmd8sjyfbKHBJ84MN4xxO0WSE+3mhcAwPQMYBfl5fMZAEvvQLserD9JOtjq1IBcxRNrS566iyQsXlHNSxvzE59IjwIi7sAxSa1xqA3X23VWdeeA0PBmN4xHPFH7nBtr4+FTwhgfkjB4RcAOXaX/5VqJKDIx4SsU3UcwfEjwaa4do6v+rZPMfwMOmPazczvOc8r/j+UsMs/k0QCwbLK0H39zdM3gPBgV77BwlivbhPTzH+q+R3BKwR+Sv3mkfYhV5XJVLezAx3rguauqca6Jhqh7OL+Y2JJFxpUHJJbPIO7Dgd3eVw8G1txgBQ==
Received: from SJ2PR12MB7943.namprd12.prod.outlook.com (2603:10b6:a03:4c8::10)
 by SJ5PPFABE38415D.namprd12.prod.outlook.com
 (2603:10b6:a0f:fc02::99e) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.10; Wed, 19 Nov
 2025 05:17:01 +0000
Received: from SJ2PR12MB7943.namprd12.prod.outlook.com
 ([fe80::6a18:df97:8d1a:5d50]) by SJ2PR12MB7943.namprd12.prod.outlook.com
 ([fe80::6a18:df97:8d1a:5d50%4]) with mapi id 15.20.9343.009; Wed, 19 Nov 2025
 05:17:01 +0000
From: Timur Tabi <ttabi@nvidia.com>
To: "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>, Alexandre
 Courbot <acourbot@nvidia.com>, "dakr@kernel.org" <dakr@kernel.org>,
 "lyude@redhat.com" <lyude@redhat.com>, Joel Fernandes
 <joelagnelf@nvidia.com>, John Hubbard <jhubbard@nvidia.com>,
 "rust-for-linux@vger.kernel.org" <rust-for-linux@vger.kernel.org>
CC: "nouveau-bounces@lists.freedesktop.org"
 <nouveau-bounces@lists.freedesktop.org>
Subject: Re: [PATCH 04/11] gpu: nova-core: add support for Turing/GA100
 fwsignature
Thread-Topic: [PATCH 04/11] gpu: nova-core: add support for Turing/GA100
 fwsignature
Thread-Index: AQHcVb7FiecHzc26f06fYdOxDdpLoLT5VXQAgAAmhQA=
Date: Wed, 19 Nov 2025 05:17:01 +0000
Message-ID: <4d142bb92b11188bc0ee2a7ad7421a95c54a06bd.camel@nvidia.com>
References: <20251114233045.2512853-1-ttabi@nvidia.com>
 <20251114233045.2512853-5-ttabi@nvidia.com>
 <DECC2NFSLDLN.236BCLPYHUVNI@nvidia.com>
In-Reply-To: <DECC2NFSLDLN.236BCLPYHUVNI@nvidia.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.56.2-4 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ2PR12MB7943:EE_|SJ5PPFABE38415D:EE_
x-ms-office365-filtering-correlation-id: 2b767d9d-7769-446f-8bc2-08de272adef5
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|1800799024|376014|366016|38070700021;
x-microsoft-antispam-message-info: =?utf-8?B?QUk5b2Z1c0dycDZhbnd6a25CR0FPa0ZUWHZaMWVpM0IrUDRFcFBsSWxsS1J6?=
 =?utf-8?B?MEkxcDFhakw0eC9zalg3NG4rcVFCVi9kK2dQZ0pEdWVMZ3VtbXR1b3RBUzJN?=
 =?utf-8?B?eWNXS1d0bTdvTzJnYXJtUThOdGRWTmRiTmxITmQ0Z1gxRm9VV3ladGpmYWJY?=
 =?utf-8?B?YnhrcXA0NExDZWJPTFEwZ3dwZkNVa2dWNW9QTm5WdWZMM3NIVHlHYXVNRkdv?=
 =?utf-8?B?eG1yaDVGdU1IRjVKQU5EazBqSkF6UkUxTURhZkNKc3BWQTRKYXROaWwyTWpL?=
 =?utf-8?B?MDNUS1ZxZTNiMWxkeE5DcFJDb1daSzAwK05Mb2xxWjIwQXpXaTdRRXNhcTUy?=
 =?utf-8?B?L0R4eFNpcmFVV0hObGhKQTNtVXVLbGRCV0tXSDRmVDhWWVdjOG9HUjJwM0hZ?=
 =?utf-8?B?dG1Md3Y2c0drQ1prbGdUS3kvOWhuRW9pRGJoRWxSTHluSWJjdFE3cytqek8x?=
 =?utf-8?B?NkVEblBoSGNtbXVuWkdDRnlpMnYrcUJsYVJtTkFFS1NPTDhYb2cwTXZhRUVB?=
 =?utf-8?B?QUpHMElJdGovRWxudmpOc1FGL1g1citaT2tJMnFsazE2VCthc2hGRlJhYmJk?=
 =?utf-8?B?VzYrRmNKc2RXVE9iakpiVWZ3Qy9Dcm5OUWFpVXpNK2w3M3lZL2Znd21ZdEd5?=
 =?utf-8?B?NEFBU2JDcktLNGRZVXVpR0FDaHAxa1NVWHA4VnRPSjU1azlkV1Z3TEEzZGVo?=
 =?utf-8?B?NGdEbVE1SDF6NE5qVHBvUWtOTjQzK3RNc3FpMW5VTVprMGZ5ZHpVdGM2eEhR?=
 =?utf-8?B?QURjUXE3ZGhyK3Z5OG44OW1RZjhINkhtMUVtYVlXcElIMUFhZmdheURjcFY5?=
 =?utf-8?B?SEdaZkY5SGZpNDRoemFYZjRKTXNSSDRSclB0MVlBNTJVVENPdisxcnd1VHdn?=
 =?utf-8?B?TUV4NUEwdUtCdTlPYTVxcTBjeTBXQ253Lzl5WEFlcmpPUC9PbVZ4QjBLdzFG?=
 =?utf-8?B?bnByRVJodWZjdFNQWmxMTUNCN0lqS2FOREFTWjlYU0RqWkNmdlJOM3ZMMU5E?=
 =?utf-8?B?TStEbjV2RkpZTGtlUkIrd3RXZ3g3alZoVW9UM2hzSmhGeFpPWUdCaDBCK0pR?=
 =?utf-8?B?a3l0aU5ucTFJQ3VXYkdVUE5ELzVscnE1SWtnSXdJNGc0clRKM1VhdGJaQVRy?=
 =?utf-8?B?djFyak9jUm1wejZleTFrT3FXenR5SDQwbGpxTFhUQk9hNmphNXhjZWZuQ01a?=
 =?utf-8?B?dkhzYTROWVpDZ1UyUEhmS3YveFhHbUxxZS9aaWw1NU9ZR21PU2ZrNEwrWE1u?=
 =?utf-8?B?VWFoZGpPZFphNFRwV0ZQZnlmbElhN3Y1TG9SV05VeVN1YUkvRGsxZnJpOVZa?=
 =?utf-8?B?d01jV1ArWWQ4TTJwRVRrc05zbko2ellWaTg2cTBtZmsvYlhKUE1MMTltbG15?=
 =?utf-8?B?cXFYb1B5dHZNcDFlb3dBVWJZSjZ4NkhINVlPdmxmNUhYNkR5cFkvbTZRMGRQ?=
 =?utf-8?B?eTRHOGl3eHR1VnZxbmdIRDcwZHJBUlNUU1pYc1ozRGdIRm9GOWFJdzh6WU1u?=
 =?utf-8?B?OC82ZUEySEkzczhkVEZKNXA4eEVEUzlQajRXZzJFK215WXp0dWNjT2FSZm9T?=
 =?utf-8?B?WngxQzBhMllJL203QXlSTlpwMHNhREE4WnN0ZU5EOFVlM1c4QkdnclVGOWps?=
 =?utf-8?B?MUJKTnJtNE5iZ0UxZFl6TkppZ0EwTngzZnlid2xHNy9pTURkWklUNnFXOGZF?=
 =?utf-8?B?Zy9FQ3A1SlF0eFdRTGhUbjR4a3pFN0ZpbDE3dGpubFhkWE1BakVYZTBKSjF6?=
 =?utf-8?B?VU40RFlqVHBmOEM0NlQydm1ud1Avc0k1N1piRnpGSjBHQVRJbVdQU3BRRjd4?=
 =?utf-8?B?QmxhbEJEQS9ncTFsbGUzRWhVSTV4V1I0SlJzcGNPaEJIZzhxVUZRaGpERnJC?=
 =?utf-8?B?NFlNSVRDOHhnMjBlRndEOGs0WEMrUzJLaVBxNmpWVE9lMmc0dFY3YTFLOE9Y?=
 =?utf-8?B?amN3cjRCVnhnYVZnazhrZFZ6V1BlOUNUZXVYSk1rdVdoOFhiWlhBNEFFTW9O?=
 =?utf-8?B?ZUpkUTZ1MDBZRDlCSGR4aENIc2FpWEZRdmd2bWxBellhZmZ0UzNJbDF2d0pU?=
 =?utf-8?Q?j7Bikh?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ2PR12MB7943.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(38070700021); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ZXg2QTJsWWpudVp5R2VSMnpxU05sWGNSV0ZEMHNUbTVTUjgxTXpTSnYvODUv?=
 =?utf-8?B?M2piOElmQmJ1bFU3ZTZZTDViZEpCQzZFZmNDWk5wSW1KSlpZblM5eU9XaVl4?=
 =?utf-8?B?Q0pzYVc0NzNnSkpHWExSdGZDV1F4LzRlWG9KZmwxM2dtYXBSTHl6TEkyL3d1?=
 =?utf-8?B?KzRKbWRkQnFoSU02VHA2ejZ6Q2JTTzhhbzFsREdiNmphZ3VxNmdsS0xCeE9P?=
 =?utf-8?B?Ymw1SEN3MVRnK0JxZ2ZmMG1MYkhuL2svWVhicjVCSTNjb3RzUlN0Skg2QzJw?=
 =?utf-8?B?dW1ISjh0eS9WNFVaQTJIMGEyQ2pFYUhPZktXV2MyL2dRUGtLK09zQzE4TkNV?=
 =?utf-8?B?RlB4SEZ2dEV0aWxvYmhVMXM4M3NYQzQ0WHRSS3R3UWlaNG02VGczdEd0ZGtx?=
 =?utf-8?B?Q1ZiTEl2WDlobVVaQVV1TjNEenQ4UGVIcUM4dG1mUnpKZSs2UkxDbGxRajFV?=
 =?utf-8?B?VndzOWJ0RzlwMzRzNFRDRmxaV3drR2pVRDV0d2IrTWtSNTFWcHVOeTNSQzA1?=
 =?utf-8?B?WjgzTVJRdjJBY3BOTUNNdEN2c3JZNU82V0hVOXFCRnhVV3hZL3JiSW4wUU1G?=
 =?utf-8?B?Q2c3Z28xblZkVnNPQTRsbVJXMzRHUnczRlh3QUpSb1Uydk4yV0Y5V2hwYkx6?=
 =?utf-8?B?WTIwbGI4a0VNVXRHbkNTd3Z5SlY2UEMvdCtmbkNHb3ZTdHhQWlRMYmFwM0NW?=
 =?utf-8?B?cll4dkhxU3llc3k1UUpQTzZvZUNOOTlEWXppeTRDMVBuaUROOWpyNDk5OEVT?=
 =?utf-8?B?VjhHUytEMDJDdHpmSWJBV1IvUVlLbjhabFUyOXA3UXBIZXdTeStpKzk1bHJW?=
 =?utf-8?B?dG9RQnRpcWd4V05MSTlZQ1lETFpyTVBXMWZuT0c0RksxRlN5TFFRUEwwZUFE?=
 =?utf-8?B?REg0OXZvWGdCUWd1RTVvN0JBdWtXb1hsUTdSd0kvTmtvdk9KdlEyclJrU3B3?=
 =?utf-8?B?SzNTRDFmQVpWb1RIRVUvSmpUcWI1RlRKTWprbjZnRVY5N25lcWs1MkxjREts?=
 =?utf-8?B?TzY4eDNVcDkxSUhaR09RRXo4OFpKV3NoUThReHBsTEZBNCt0VWRFMkpSZkln?=
 =?utf-8?B?WktaelVWWmtMSW9UTXlKZ25xMHRlbkdTbW9SeHdVdUdFWVJmMWtTc0FOS2N2?=
 =?utf-8?B?Q1JzL1JGWDMxemlIcHpRWXJZVG4yVTFxNldjNWp5WFlmMWR5VGh5S0JzZC9G?=
 =?utf-8?B?dU90Y0Qycm5sb0FwUTVuekF5S2pDOThhd2hya2JMNWk2UXJjVkkzbWhCeXV3?=
 =?utf-8?B?SnY1NytyTDdNdlR0T3lLbGd5ZEQ4ZVJ4SmRsQ3cxL2FvNDRjTXRGM0R2OFM5?=
 =?utf-8?B?eVV0SzI2dG1pUXJjMStxL0IrZWovamxKOVJyRENlejJsZUE2L0FjN1FvQ3Ba?=
 =?utf-8?B?MlhVTDJtUXRjQ1UwSGkvS1RzeWwyRkl6bkpQbDZ4Z1VtQkdOOG1DZGxiWW1C?=
 =?utf-8?B?T3FoaTFUNWhPa2IvT251bkJxY2hSRHoxa1NUOTlJdzVZZHJLOTRlMHUxSFVZ?=
 =?utf-8?B?YmdwczRLTWJOY1RaTkhOZzBwU1JHeEYxYlBzdGFYS0lLd0NBR2RIM2M3alN4?=
 =?utf-8?B?aHRabVdNYWYwdnM0Vi9tNUNiUzFjOC96STNRSm1XdXJwS0tnNUF2aUNKMUZH?=
 =?utf-8?B?WHgrWW10ZDdpbWkrY0thMXlWQjZxZitraVkyb1JOdTNCY3dod3V2SFZrV05B?=
 =?utf-8?B?VWk1elVkU1pyeGlKR3U0aUdyNFFiY0E3VnhmZTUzMFlSQXpTV2JOTDZOdjh3?=
 =?utf-8?B?ZStSMmJpMmpaT1IvY1Jkam9iUW1XNHpLZ0xTN0VROGI5SDdveXNVN2E5MlVW?=
 =?utf-8?B?SFJUNmt0SFFsYVVwOHdsS2VKaEVSQlZSMExjbkc2L09FajF0d2paUFlFM2My?=
 =?utf-8?B?dW5SdDEwTzBUNW1mV0hQcEprZnRVcFZUNXRGamYvb0ZKZU4wRmhYYUtialdR?=
 =?utf-8?B?L3BEbWo4djlmbFR5dWdad0xZK2lmZjBud2ZZemg1N2hkOWNTZ01XUW0zdmlU?=
 =?utf-8?B?SDRpWEhpWW5ITHlNb2pkSWQ1aDcrY0drbStTUDhJQTFPVmJBSnpWV2Z0eHBi?=
 =?utf-8?B?YVZVdmtDWk5Pa0pHS004MUpmSVNjWFNFVy80MDlkSHBuM0xRNXMxRE9lbXlO?=
 =?utf-8?Q?nsZKClyauWlKbpA6jHrw28x0E?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <4111A8D9749F6A42AD9788DC105A687A@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR12MB7943.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2b767d9d-7769-446f-8bc2-08de272adef5
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Nov 2025 05:17:01.5409 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 72dLNhwOz9usJ3g5BaD7wgQ9ttP9FdcA4bG5ARWGWNjpnONlytbik0BnMmbgdVHWrytxh1cKcoG4IU/0e32x4w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPFABE38415D
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

T24gV2VkLCAyMDI1LTExLTE5IGF0IDExOjU5ICswOTAwLCBBbGV4YW5kcmUgQ291cmJvdCB3cm90
ZToNCj4gRm9sbG93aW5nIHVwIHRoZSBwb2ludCBJIHJhaXNlZCBvbiBwYXRjaCAzLCB0aGlzIGNv
dWxkIGJlIGFub3RoZXIgc2l0ZQ0KPiB3aGVyZSB3ZSB1c2UgYSBwb3RlbnRpYWwgYENoaXBzZXQ6
Omhhc19ib290bG9hZGVyX3RoaW5nYCBvciBhbnkgbW9yZQ0KPiBmaXR0aW5nbHkgbmFtZWQgbWV0
aG9kLg0KDQpUaGlzIGlzIHRoZSBzaWduYXR1cmUgZm9yIHRoZSBHU1AtUk0gRUxGIGltYWdlLCBu
b3QgdGhlIGJvb3Rsb2FkZXJzLg0K
