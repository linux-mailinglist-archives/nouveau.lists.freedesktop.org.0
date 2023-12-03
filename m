Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EDC2E802093
	for <lists+nouveau@lfdr.de>; Sun,  3 Dec 2023 04:50:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 575D710E161;
	Sun,  3 Dec 2023 03:50:32 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam04on20628.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e8d::628])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C97B10E161
 for <nouveau@lists.freedesktop.org>; Sun,  3 Dec 2023 03:50:23 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gzk74l8nqGAC0j1MGT35hYKM+CedFUIKgKtt6GXBuXHloE6wV4fyBLp9SrFU4IWdgyj0opAU70yieKAeD4WVvgVDyge1oa5nCsWZEhCEImFzG3b9uWZuF5nscq9z3MyH2Rl6wsVEu7RA4kiT/QpuKa3+sJzyjwJZ7oPN96aKBaO8VSJEA/K5R+tBvlLHGlcIXJfBi2leNXGy182MglNsI5i0/HWCooatA2qjTwvxpfyYWCvkmPlIH27UsYXRMk/NE/JomQf09iMkvY91GrL97ooeqMk6hvWKscbspoD2/BtFy4Zw/kr/HBgvbLj+8MNr07LOvanMhcZH9+qPfugn2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KVen6QFshwgUSq4J9EBCgUPbJAAf3TM208vXpix/qqI=;
 b=ftuZRF7G1AccEI7dopgbx0UW47BATHL/Y806d90NzS6q/BOieZCZkkVdd6b10BX2815xUWy0dHNLbO4YkdNadidzyXRXv9XC1LLP4xF3igrW8kRYLAbQmdra2tBCaBn77BzlkD7lrxTUO7RDzA7jVebckNjA5yJYLVV0Z8h+OZ7VP8QecPVeNBHmoCrIoDMQCKPd2ur2WEUjRp28MMKwHiwtpjJdCYLSFvEZVy/gLhGG1VyuxLVOvNB53GTZV/6Oxekd0pDDCTW1zUBVEew4TbI2EmXQ/9KRQbij4pP+M9t+uQg05tT6bZg5dcmcL1uAjQdJhe0jG7aEKh3z5RkrFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KVen6QFshwgUSq4J9EBCgUPbJAAf3TM208vXpix/qqI=;
 b=F7YoQmUgaGvsMbJ+2Y1n7nZ/D8QW4MOm38umYKux1veHopKQQv/TLJpoeL6FX22Jf6J9eX7reNAVnZ5ExkmAueuq1pgMBegCozDx8oXn6CI/nJ8nHHsNTHfr3FBPSaHn+xfvnHAfybacM/EMnoZ6+cjOTTquUhZVDoCetY09DkLUfvGOkEHNto+42ljL+gGaMSdqeLT3XwR4dJstX4FJCf85IJJKbWQ9Fwg6DmTeosmHVzAJZR6DiURXsynhcQS9OXBnLXnweWw7S+LzS28INbiue4Trf6yDW0tonjymn5QZ2G18z8NF2xoVNbMLjNmzQbSLxSAS+9dFEvaZdeX9lg==
Received: from SN7PR12MB8769.namprd12.prod.outlook.com (2603:10b6:806:34b::12)
 by SN7PR12MB7022.namprd12.prod.outlook.com (2603:10b6:806:261::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.30; Sun, 3 Dec
 2023 03:50:18 +0000
Received: from SN7PR12MB8769.namprd12.prod.outlook.com
 ([fe80::6799:dc7a:e121:1af6]) by SN7PR12MB8769.namprd12.prod.outlook.com
 ([fe80::6799:dc7a:e121:1af6%7]) with mapi id 15.20.7046.028; Sun, 3 Dec 2023
 03:50:18 +0000
From: Timur Tabi <ttabi@nvidia.com>
To: "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>,
 "dufresnep@zoho.com" <dufresnep@zoho.com>
Thread-Topic: [Nouveau] How to set debug parameters to get the information I
 want?
Thread-Index: AQHaJV7DAm4BXhFt20atLkPeUdfy2rCW7OsA
Date: Sun, 3 Dec 2023 03:50:18 +0000
Message-ID: <415889e4382d8d2b01e329fa4ef52a8ede2581c3.camel@nvidia.com>
References: <18c2c2de15d.455f53a281608.187456526925211202@zoho.com>
In-Reply-To: <18c2c2de15d.455f53a281608.187456526925211202@zoho.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.44.4-0ubuntu2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SN7PR12MB8769:EE_|SN7PR12MB7022:EE_
x-ms-office365-filtering-correlation-id: 59cdf48c-23ab-4367-7daf-08dbf3b2f750
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ueLWDIsX8bVg4IbUUlLOL8tGlx6PHPK9Rkvsdmqe7JrBrziAeimHL/LMOU5DkD6cbUEKSwLaJCN+08nKDRLQSJryci3Cd3xff0gQoIS8SZJQBdmb4mPXucMME5XsksQv+T1gNSjkrvqkcn1sMmaby3xCGL22UL2hk33oUmYJgP7Gk+1RO+kCYVSdpyBAbbWBBBbbEsKjLQtYo28lYW25QTnhYCav6fvVrBbf/Vov6t4fuxvEMNj1OcOsAnNpCot7AfAToFT/U6TIjEB6OOmz472Ifh39JzhZiJD0e3k9BpSB7QqbB3qfTs4eSf0EdBmKErksAa4s1EITxIK8I/S1zt2Do2sHvpdwiQN25VnO4kj18MsIc++yW7C6KDx7xizmrWIpkcWiRYku1jj4YwZSwCGW/4rC0tItAo8vVEmiTl7BV8VV2o7eDLKOxSV0JJpjlyEegpKa34Mjc7grnMZ+zsM1C0kk2f7WcwS8T57j4Ll4qMRMOH/HcgGnz7kmLzV4WNY0S6ynw2V02a4abf8yWQHGzBriED0Vygm2IzgW5tGPsK4WKvuPiQbxRvNVGp76SAFNfYE5uGbRlvFsxyqXVAgTNrCu2s7AKqpsOuLK1wlHVIKr6JOrFqY5RHfwTYPpstEu85t3E2XQW2NDJllUcQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR12MB8769.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(136003)(396003)(376002)(366004)(346002)(39860400002)(230922051799003)(186009)(64100799003)(1800799012)(451199024)(66556008)(110136005)(76116006)(66476007)(66446008)(66946007)(64756008)(316002)(478600001)(71200400001)(6486002)(5660300002)(38070700009)(41300700001)(36756003)(38100700002)(558084003)(2906002)(86362001)(8676002)(8936002)(122000001)(2616005)(26005)(6512007)(6506007)(15583001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?emRnTXA2eU5TMVNYZUlHYjNQOTByR2UrTEQ2SHVpMlV3U05lQjFhZE1jN0Z2?=
 =?utf-8?B?cVZxaEMrcTJPL3JqZWltQjZsSkt6MVdyOVFmNTN0amdybDNDMDk0dEVhVkJC?=
 =?utf-8?B?VDZPbWowejhWdzN6NFdIMkhTN0ZWQ24xVE9Gd3NPaGdwKzZBT1d1SkVkYnNa?=
 =?utf-8?B?QURUQnk4Rk9FQTVHYmo5c0oya29iTkdHNnJvMUxuZ0YwOWc3aXZRTDRKT3pv?=
 =?utf-8?B?QjJFQ3dnU0ZtQmFtME5EbXNwTjQyRlZLM3RKYVFXVktMdUlId0pTSERuV2JE?=
 =?utf-8?B?WFlrZmY1aWw2bk5laXJ1TFVRZmJsb3N0MFRCRGZqaE9kQjRGd2pBWFhZR0gy?=
 =?utf-8?B?cWY0bWR2VGczdm13aWRlRnBmNXlLY0lVTWhXdUY0WWsybTlyREZsWmVueWZs?=
 =?utf-8?B?NXBYdXRxbDNvelcwRCtkeHlyaVU4S3Vkc09tdmQ2bHRQb0h6Tzg4Q1JITmlJ?=
 =?utf-8?B?UUJia3FhTjZ6MTZ6dDIrOTVCdHFYQmkxME1SaGpHUGFNV2hBMzI3dTFNTXFT?=
 =?utf-8?B?VWFIWkpSYTdFVWlKTnFCclY3TFJuWlpaYzR3N3pjZkw4YUlPV3pvaVlPK1p3?=
 =?utf-8?B?b3orTGtnQW1Ia0xzaTZqbjVKVjNrck5kL0NHdXFabXluMHh6c0N0MjlmaUtH?=
 =?utf-8?B?RDVQbWlkNkc2K1duUEhJRGNWQlBVdkl0TlQ2ZHlyTjdiV1loQkZxby9PNVJB?=
 =?utf-8?B?amgwRHY5eHhJR0FSeWVGbTV0VDQ0K2s4R2hndVYxbXZoOWFFeVpCblFhVzlN?=
 =?utf-8?B?TkluTmQrOXVRQVNxaGRGSFRMVHEvbzJJaWRZUDRMODdRTkh2UEFiUEx5cVZM?=
 =?utf-8?B?UyttZjhKNUEwVXVtUGhSaGg1Zkw2UFJLNytqOVd3Qjc0cDFPYUJlRTl0WDEw?=
 =?utf-8?B?Y0N0Q084STBPVTVYOWhqdHEyS202N2YzRENDTU9LT0NMR2JJaDd1SjVRamp4?=
 =?utf-8?B?dlhJMUE2VGNqbVNOZFM0MWpNR0pPRjVrTWlLaUd3bk9Fb1RrUWFOdmd4Nk5t?=
 =?utf-8?B?czdIblRVaVZxM1pxUzVvMGIwSzE4Y2Rhd0J0V3MrOThIQ1dpMUNkRUtYZmpS?=
 =?utf-8?B?czV0Y2kyT3E3Smt0aHNMR0dLMitzelFSUGlTOFhkbVMvL1dXL3l4NzY3dG01?=
 =?utf-8?B?UGozZXlheWV5alBJc2dEWHpKenlNTU1TRFdVNGtvbHdXV0w0QWs3YnJFN0Jq?=
 =?utf-8?B?Q1J4TEVOOGlWdW1hajc2cW9GQi80S0NQbmpsaTdnR0hBRWd5dDFINTcwNE9q?=
 =?utf-8?B?SHdjTjA3T0NoOEp0MnExdnc4M0tnRlJsWXBnMWdmYUloYUxNQnpLUjcxRjlk?=
 =?utf-8?B?VWVNUUJqWVhQSGhlUGxrNTFNVDJnQ29JdkMwTm5qMThJRTN4RFpGK1VlVFFC?=
 =?utf-8?B?TC96K1laa294UXRDVGR2dTNTeUd2bmtWZ3N3enVkTTdEVWxUSEcrRTc5TjNh?=
 =?utf-8?B?ajVzMFVVUUpWb0htQUlKakMzdXFEMjZ2MkxieGdDS1pvQXdNVTc4SVhCZUZS?=
 =?utf-8?B?azhaT1AyOW80UTJsUXFrTzBOOGQrTkEyL2tMTnZJTmZ4REhRNXpCbGdPOVVU?=
 =?utf-8?B?enV1RUJkM3RYc0pKRWlaR05uYUZNSTB0VVBiVm5IeFY1L1dtMm5zN0FQbHBQ?=
 =?utf-8?B?NG95aWxlNHBFc0JsQUd3Z0ZBb24yV0dwcXF0TDM3MWRTcm4xSlh5dEV3c0Zk?=
 =?utf-8?B?LzcxK1RUNU9YcVlvTDExU1RUZ0JNQWN3YTNiNlVRYTFXV09UUGxvSTR5a3RU?=
 =?utf-8?B?d29FTVZiM3dDY21YMzNKemRsWElKSWRSK0VSVklxQ3B1cVhXY0ticmNHZlMv?=
 =?utf-8?B?OFprbDBVbDN4LytuaXJMckljNnFISVAwNDJrd21keDdXdUxLQll2aHhOQkFm?=
 =?utf-8?B?YURORWlEQ1Ava1NDSTJQTEJmU3BXc1NKaFZQVmFyY3pweTRWVFVRUHB2d3Qr?=
 =?utf-8?B?Uytva0NrUlBnMnRhRzNnSUhueWVOMm5GUFpQQlZKYTc5R2ZoMVR2NFBSMVFG?=
 =?utf-8?B?NmlnVHowWWpKTXdlSnJZQm1XVGVsZ3pmSjBIOWVwNnBMaTZrcHhuemZFRGNH?=
 =?utf-8?B?OXBidU0xRXZDMVcvalNUZ0o1ZHZmeUtMVVBLTU9MRUYvczFvWGU4VGtyT0JT?=
 =?utf-8?Q?Iykqjk1ccRQIbgNsU+zUvdh14?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <F25D856BDE7BA749BBCBCBD0E8215597@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN7PR12MB8769.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 59cdf48c-23ab-4367-7daf-08dbf3b2f750
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Dec 2023 03:50:18.1478 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: f+I3AFxAbQRGrConUI4Dwi1ldMq8ALmZ+8pmaE0OPThVycTKkupe7s6YR2EPhuDVCCueYT2PvoUm5FUO+6zINA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7022
Subject: Re: [Nouveau] How to set debug parameters to get the information I
 want?
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

T24gU2F0LCAyMDIzLTEyLTAyIGF0IDE1OjE3IC0wNTAwLCBQYXVsIER1ZnJlc25lIHdyb3RlOg0K
PiBub3V2ZWF1LmRlYnVnPWluZm8NCg0Kbm91dmVhdS5kZWJ1Zz1kZWJ1ZyBvciBub3V2ZWF1LmRl
YnVnPXNwYW0NCg==
