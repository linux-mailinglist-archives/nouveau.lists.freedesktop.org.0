Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 46E83B09029
	for <lists+nouveau@lfdr.de>; Thu, 17 Jul 2025 17:06:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 99DD210E301;
	Thu, 17 Jul 2025 15:06:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="j+526F8Q";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2071.outbound.protection.outlook.com [40.107.92.71])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 537E610E83F
 for <nouveau@lists.freedesktop.org>; Thu, 17 Jul 2025 15:06:30 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EsK/FlddzwKJ02bL6WNPINJ0XSQUqxShL9OW1OMv2AQRp/Ii0SOoXYrboJr36XAfLeSLJduTifThGrC0+KKMyJyxh2Ob4eD8e97HnNg4mDkMx6VglEWPvbHMug1lmPy0MkjOYXge9QRfiOL8fUJdHCNf6kJnk0rA4U1RWRvt5WJGM6lPyqHMNgAQE8PKaEug/P/M2jznJ2fgigVWrlAIPZjsSSqNW9zr2cK9ZTfFDGnYL9tYtlLUcDxDN+i6PGpEPWiqWmdRbAP3Jp6cmpDZaC3ktJuUoe9VhXTq1J8gFqxnWxX5aotIK36lMPcarDC3am/ORIFUgY1AhTb0CsBq1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=S+tafOUa37dZIq3r1pwpDx7Vx/b7mCG7oKikl5pLBTY=;
 b=sYqlKMxKEkM9w5xbL5uFduEmzw4lRhqY37AraA34vp/1z/j72VLJ4gGRYHAvjPxQk0JvfuXSTkJKK3jfwYxeaCY718ArpP6RvlyLuMrlRieKkTc81d/Rtrsx6qw+D13yTOZ3FPkC5wtgiibUOkvQCe5JFLbEf03WuWuNYreJtbMRfMa06f+vooUJS8EIPlQmE647mDgUuSz7ZtbKgIWITyQzjN5NtIEzUPPlT0VbzsjIT97435rN9PEA0p6SAW9dM7RK49Yga7JJuJSPk0lqqQF9e6UXPAXI4FcUcgIuzUko/9lXhoxw6KsXtOxZkH4F3Qg6NgGfmZlR6cKnj8qzug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=S+tafOUa37dZIq3r1pwpDx7Vx/b7mCG7oKikl5pLBTY=;
 b=j+526F8Qq2fM3lcCVmHpQO3Jud1GZjWR21JbjfbqlMEfK01Qi5pB/eI7TCbJ8KpRRiI01Glph9h75W/I/ESvYJhV+XIbkx62T31nRoIPZsOZuIV33wSCGTnrOnmLvn0DxWpl3yZW0DIU/7GgcF36pKEPV7rqFwngyN/Q2YT/XsKlEuv7b6YbL3kEvpCR0ivlzNrR6iTMl3Rdq9STM0fIJhIkEpdFkl1eGiMS4s5xGa8Rzyw4D7TBzSdCGWc7yNpgPTXill8BoRX6ZcyCbOzNSnUTMiIxy/csuMHFKtA/16EeX1/hibhl/GACoQ0nRv2nIiWqSswjUhnWCmxJUGnimg==
Received: from CY5PR12MB6526.namprd12.prod.outlook.com (2603:10b6:930:31::20)
 by MW4PR12MB7439.namprd12.prod.outlook.com (2603:10b6:303:22b::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8922.39; Thu, 17 Jul
 2025 15:06:24 +0000
Received: from CY5PR12MB6526.namprd12.prod.outlook.com
 ([fe80::e420:4e37:166:9c56]) by CY5PR12MB6526.namprd12.prod.outlook.com
 ([fe80::e420:4e37:166:9c56%5]) with mapi id 15.20.8901.021; Thu, 17 Jul 2025
 15:06:24 +0000
From: Timur Tabi <ttabi@nvidia.com>
To: Zhi Wang <zhiw@nvidia.com>
CC: "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>, Ben
 Skeggs <bskeggs@nvidia.com>
Subject: Re: [PATCH] drm/nouveau: remove unused memory target test
Thread-Topic: [PATCH] drm/nouveau: remove unused memory target test
Thread-Index: AQHb9cxaUCrbyr88bkyhx2kLBD9+m7Q1+J4AgAB0gYA=
Date: Thu, 17 Jul 2025 15:06:24 +0000
Message-ID: <6b65fd5f25f3a8d91222025cb0a6bbadf7e8604a.camel@nvidia.com>
References: <20250715210559.1188776-1-ttabi@nvidia.com>
 <20250715210559.1188776-2-ttabi@nvidia.com>
 <20250717110924.3bd285ea.zhiw@nvidia.com>
In-Reply-To: <20250717110924.3bd285ea.zhiw@nvidia.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.56.0-1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY5PR12MB6526:EE_|MW4PR12MB7439:EE_
x-ms-office365-filtering-correlation-id: a49a6d39-980a-45b0-e821-08ddc5437f4d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?NUpYZzk4WUZuZUR4ZnIrMkErRTNQSWRuNlBKYmJkY2JPUHVxNmhvMG1KUmV5?=
 =?utf-8?B?SXlNZU1jUURZaUV5L3Q2VTQ5VEhvSVVXY2RTK2FCeU9MQzluTjI3UGpNZVBY?=
 =?utf-8?B?Ylo3czVuMXljK1JyUTlzS1o1WFJ5bU5hWmdSUXdWUEZoNXFBR0N1c25KQklk?=
 =?utf-8?B?b3ZtQmIxUllMa3dFZGNJUFFORHV0QmwrRnA3YTRVVHZJRmxSZXRaV0FhVFQw?=
 =?utf-8?B?ekNzejdjWVFFTllwbXdXUElqeHdWY3BKYmhsVGdEa2VRSUhXSW51SENPalNV?=
 =?utf-8?B?M25PR2h5TnY0a0Z5Zzc5YjJqTGpLTTZvUm44K0pyNXlhUy9NOU4zakxRSWVy?=
 =?utf-8?B?R1J4V0UrMTJQNkM3eVMvU2szTER3dGt3dFg1ZEpRS2JTQUFLQlhGZTBkWXZH?=
 =?utf-8?B?VzMvRVlQSVpBc2gvRVlRem5yTnM1aGwwcWt2RlJXeWgrdUxWcERmdHJyclF5?=
 =?utf-8?B?aUhCQ2ZDVjZkZjNSSml5Y215bHBSZUFRMGxnZGpkN0Y4OFpROWExMHI1ZU9B?=
 =?utf-8?B?WHpNS2p6dmJ5MTVDSzVnTGxTR1dCSzVrbW50SGk5NjRDZmxIWTd3MFp3N2Rh?=
 =?utf-8?B?em9tVjJFWkpOc0p3Z0VjVHU2QjlMbFp4dEphUnNha2l2aUJRSmJyVmRmRDZ0?=
 =?utf-8?B?ZnQzMXdyUzBpbEQ5RThhWVRDMmdkaS9KaGN3c0MzbEhGdnJqeHgwOTA2TzFO?=
 =?utf-8?B?WFNSZW5MU0doU2Z3VU1jY2dRMHdianYvUHdtZmhiT3A0aUp1VEZUdUk5ZTZD?=
 =?utf-8?B?R05aTkp0eTM5cVhPME1WZ0VkU3lHeWE1dm1YTVVDRk1LeHVIU2RRZWZaQTVq?=
 =?utf-8?B?SGd1Nmc2UVdLRDlJdDNvN1lydDVZK3hTd2g3NTMvWUZDcDY0Tk14bi9XdjBE?=
 =?utf-8?B?cE9NRktDdzRBUzVUcldlQTlFV293S3lGZ2NsS21ySnBURTQ5ck10V1Rocmo1?=
 =?utf-8?B?SElLNnF1aVNlL1lobitnbnJZbXZWQ1k5UmNUajNKUEphYW4wbnkxTjVKMTVz?=
 =?utf-8?B?bWwva2tYZDAwSUZvUUtXaHRZZ2IvRTZJSExoczYwRFBabU5Rd0hwM3AyVnhZ?=
 =?utf-8?B?UzFsT01lTDI2dlhyK1dzOVQ5MVIvN2I3YnF1R29wZWx6VWtPYWd5TGdyUUp3?=
 =?utf-8?B?bi8xakgrQXpuQ3pDbmFEQkt4ZXAxRUdWUWFXcy92SGhoMzhKQlZsOEgxVzlN?=
 =?utf-8?B?eXVNK05xalJVaCsrOFVsUHd5bncrVkM0bzdnWndnY3ZqNUt3MXhSSW9nRVpl?=
 =?utf-8?B?bDhXN0ZrZi9zSUlBM3RBZzJneDlsSm5ieUxrZzlXdUVWTE1IbUJrdDdPdUQ5?=
 =?utf-8?B?WGhLVmMvbWZQdzljcU1GbEdzaVRMa1JRWmpBRjFRWXlPUHRLQTF5UEROUzQv?=
 =?utf-8?B?akZUczV4QmRBL3JqNC9zTmd2T1hmTGVxd1JONGVZS0xlSkVEVnNNMFlQYlVz?=
 =?utf-8?B?aWZya1Zlb2I2NHFMeGhWQ3VFdHVQNzBzZ0hCQVE2RjdwcDdjakg5eE1yUFBX?=
 =?utf-8?B?WUFOOUVBcWs0OFBxSXRNMkdGcm9yWHdlWjdOUVNJNlRxenV5eEV4Ym16Tlk4?=
 =?utf-8?B?eGNzQlJzMGpUV3FEd1MrWGhvT3Nnb1diZjZmak16d0FxdlVMT2prdGVjZkVC?=
 =?utf-8?B?RkszUnliNkIybWlLZ1BjZU91bVRZa0JmMmN0Z3daMnV1ZmpWUFJmSkFaNk9y?=
 =?utf-8?B?NmZ2K0pvUXJNbzlkTFhWMFFZb0FLVFRmZmJBOW9YN3JmbzRNbWZmMHdRYkRB?=
 =?utf-8?B?d2ZPakczZU9Sa2YrcE02Q09IdW9GTForVTEySjc5STU3dTg4dmdtRHJEQmov?=
 =?utf-8?B?cWFuSVZNZFJyNXFHK1IrS2dWVnJyQjlMdjNIbUJDc2ZuWFRGNE90Yk82TE9I?=
 =?utf-8?B?THExK1RSWjFwS3FiSlU3OUgvSGJGVVJwdDlIdEwraEwzaEp3akY5MjFZTnNH?=
 =?utf-8?B?YUpEMEtCQ0h0M2N5ZWhtbmJ1YjBkYnk5dHZjblRleXl1TnBPb3M0T0p3WGRC?=
 =?utf-8?B?U0ZVeUhxSGtnPT0=?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR12MB6526.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?LzFETEVJanZTMitPOHFnMXl0UUFUdCtZVlFmb0ZqVWhqVXlFMjVVRkFlMDZE?=
 =?utf-8?B?YVFDMkVyN3E1Rlp2V0J3NUFJaXQ4RURMUXhhTk1JUEZaT1JNcmQ3M1JndldV?=
 =?utf-8?B?ODJBa09sMXY4SHlwYnJrcVkvVTRuWkxwZU5peXA0RVhJckc2WjBIL3JsNVQv?=
 =?utf-8?B?K2I1RXQ5OS9xSndQWFZhMythZXB4Y09uMGFib010OGNxa3BXalRhQmVDbFBF?=
 =?utf-8?B?L0hUTzVFQ25PbkFUbVJHdno0c2J2SWpLNjZPbUdOUm5KMEpEZGE0Sk5NMHNG?=
 =?utf-8?B?Sm9YYk0vc3FUMTYyUjBRcWoyQlNtRkx6UUM3MEZnbTJyQW95VWxtL2sydFdp?=
 =?utf-8?B?Rk1pUHN2d3ZQc0psWkhuSDhXemRIRnNXempZQXpFMUVJN1Fvb2pvN2dZR3pp?=
 =?utf-8?B?Q0NsQzNsQjZiRnFGZmdTVVFMUDdRYVlPOHdkQXo5ODIyUmxhcjJhKy9HZ1VT?=
 =?utf-8?B?SFlyUTJVRWF1VFFFcVkyWjB2OXJTdXo3amJZbTVPTTFzN3IzTngwWDlRakZq?=
 =?utf-8?B?L2dTaTFYVzNrNlp4OUhyYmZiLzR4SGd0MDRyOWI1U045Nno2dWMwckVUSWFl?=
 =?utf-8?B?Q2lFZXZ0Q2tuRXhxeWx4cmFGVmdBcWI4eXZTZ3FpTEFtSEdWcW52OTdTU1gy?=
 =?utf-8?B?K2FkRTRLQkZSZndqTXN3S2pGWG1ZMmFiK1VzMU45bUZrVGRSTEwzK3h5N1NT?=
 =?utf-8?B?M2o2K2c4bzBFTzRlV01ReGpjYlRmRG00eHovVUtibDllUGJtVHRTVDNiRU94?=
 =?utf-8?B?ZzZIYjV6WlAvMDVQK0JOWk9VSHR3YXBSZzNTRjQwQUZ1cHBRT3p3aFpGdkxK?=
 =?utf-8?B?cXBzbmdIdEFlYVA1c1lzdlhZMnhZN1JGUVBiZlgySUNNRGdHdUZnNVhPMFZk?=
 =?utf-8?B?TjY1dXkwZDY3cVp5RHhhN1lOM21HVkthYVhyMVNKbDRGUjZpWDY3N0lmcTYv?=
 =?utf-8?B?THdpaGVLTjNhK0kwZ0RpdWpPelp4RWxJMThSa2NkMHk2RXVRVnppTFJqWkhh?=
 =?utf-8?B?UHVWUTJ5T1UxR0xncnNYaSsyR3pERXZvSUhodFBqU1Q4bGNjNWcvMXJnbEs4?=
 =?utf-8?B?RE14czl6RFZkU1d0Z0U4NHB2MkNEdk9UMnZsV3NmdnZVRHFlMkdIRHk5c3Nn?=
 =?utf-8?B?Tm9ObHUzU3BHd09GQVJKaFBiY1VpdjRaTWpjeEJ1N1BjZnZkb1RicjQ1eEln?=
 =?utf-8?B?SkFZZ3FrNTVqMTBUMWU1MW1lQXZsVjEzb1hiejdhVGl0bU9saGdldkdVNEE1?=
 =?utf-8?B?ZHFGbVhLRFJYbWUwbHd1UWRWVmd4blJSL1dXY3BvWEZZQTM0RHFKNVpkTFNu?=
 =?utf-8?B?WlNqNW00VEdkTHd0Qlc0UHhUMkNvU1NtREs3RUkxZG5VREt0U2Q1MkhPcHRi?=
 =?utf-8?B?K1FuZjNabTZGeUhJWlBWRm9zN3VRMVA5WWFoTlpucXRLSTFNZ0lBVUtLVVli?=
 =?utf-8?B?dlJJNWdMcXozNVRSajhzeURlNm5KMHZBK1poNnhETGpQRjVsQzZYN3dUZjBr?=
 =?utf-8?B?ektSaHQxbHg3VUprcjRvd2JjOG1vTkNMRHhCd2pBOGFVeFM1QVhVZnExUDVB?=
 =?utf-8?B?V0hFam1sK0R2UGlZNGl6SXdPby8xYTNnRVozVWZqUlBLaXdUUGthUE1USCsw?=
 =?utf-8?B?K0NzME5kMHRsNmVkSWtxZnV4NzRXSUhpUlkvd3ROR2ZwQy9jdnNEczl1a0o0?=
 =?utf-8?B?c3MrUWEwRzRFQytvbFl6RkJoNE9WLy9RR0EzRFAxZCtCRURmaUZCY1Q1a0Ni?=
 =?utf-8?B?QUhSMVBYMmhtSVdON3RKRlNIWXBRRmJKZ2FaWmxnOTZEOTNDM2NjVmlaTEk5?=
 =?utf-8?B?THV5bTlKWFZrYzN4c1YxWDFSclhGRzBIdDd3cE90ank0VS9YRTRDdE0rQ0dJ?=
 =?utf-8?B?Q2M0SXRjcE9SZVVBQmxEcFdjOU9yMzg5Z28yZE5vbmJRODZTNjdzRHBDTlkz?=
 =?utf-8?B?YkVuQ0dyOERmUWcxMlM0a3hDU2MxR3J3d2JIUnE4d3VyUjF1V21JOGZtUExL?=
 =?utf-8?B?REl0QWdiYm05VTNsajhDRGlyc0lXWXAwTVh2R3BmdmZiY0dHNFY1UDdOeVhE?=
 =?utf-8?B?SUEwVnpaZ0UxM2hnaWkwZzllNFp0anMxT2UxY2Iya0pHR3AxOThGSzJEK2V1?=
 =?utf-8?Q?dvxMXYOdYQb4rcrknIbI62XF7?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <654ADDEA2AFC134A8A586E3E580A5028@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY5PR12MB6526.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a49a6d39-980a-45b0-e821-08ddc5437f4d
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Jul 2025 15:06:24.5263 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 51h4rfUku6iCyNNnbYERMiUCh38m8ERhHL+2BCnR2WlXL5wyDHMYnKqzGg0gjrm9tDlgblxL6tHCs/DMg6OhRg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB7439
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

T24gVGh1LCAyMDI1LTA3LTE3IGF0IDExOjA5ICswMzAwLCBaaGkgV2FuZyB3cm90ZToKPiBPbiBU
dWUsIDE1IEp1bCAyMDI1IDE2OjA1OjU5IC0wNTAwCj4gVGltdXIgVGFiaSA8dHRhYmlAbnZpZGlh
LmNvbT4gd3JvdGU6Cj4gCj4gVGhlcmUgaXMgYWxzbyBhIHNpbWlsYXIgY29kZSBibG9jayBpbiB0
aGlzIGZ1bmN0aW9uOgo+IAo+IMKgwqDCoMKgwqDCoMKgIGlmIChmdy0+aW5zdCkgewo+IMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBudmttX2ZhbGNvbl9tYXNrKGZhbGNvbiwgMHgwNDgs
IDB4MDAwMDAwMDEsIDB4MDAwMDAwMDEpOwo+IAo+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoCBzd2l0Y2ggKG52a21fbWVtb3J5X3RhcmdldChmdy0+aW5zdCkpIHsKPiDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqAgY2FzZSBOVktNX01FTV9UQVJHRVRfVlJBTTogdGFyZ2V0ID0g
MDsgYnJlYWs7Cj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGNhc2UgTlZLTV9NRU1f
VEFSR0VUX0hPU1Q6IHRhcmdldCA9IDI7IGJyZWFrOwo+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoCBjYXNlIE5WS01fTUVNX1RBUkdFVF9OQ09IOiB0YXJnZXQgPSAzOyBicmVhazsKPiDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgZGVmYXVsdDoKPiDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIFdBUk5fT04oMSk7Cj4gwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCByZXR1cm4gLUVJTlZBTDsKPiDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfQo+IAo+IFNob3VsZCB0aGlzIGJlIHJlbW92ZWQg
d2l0aCB0aGUgc2FtZSBwdXJwb3NlIGhlcmU/CgpObywgJ3RhcmdldCcgaXMgYWN0dWFsbHkgdXNl
ZCBpbiB0aGlzIGJsb2NrLiAgVGhhdCdzIHdoeSBJIG1vdmVkIHRoYXQgdmFyaWFibGUgdG8gaW5z
aWRlIHRoZQpibG9jay4KCglmYWxjb24tPmZ1bmMtPmJpbmRfaW5zdChmYWxjb24sIHRhcmdldCwg
bnZrbV9tZW1vcnlfYWRkcihmdy0+aW5zdCkpOwoK
