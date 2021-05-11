Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 62C9237A2B8
	for <lists+nouveau@lfdr.de>; Tue, 11 May 2021 10:57:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 00D006E9FE;
	Tue, 11 May 2021 08:57:28 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2067.outbound.protection.outlook.com [40.107.93.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 542A06E9FE;
 Tue, 11 May 2021 08:57:27 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JzL/+4SQHzpPPF2jaJVJhuNi6Ucyv/YrRuJ5nQJ7n/lElXVz+GVeQoZ/F6e3WjHu5Ug2kLoFG524zCdrAewR8cftpbkwHzDNHIkiOCthdYOn/3fDpVnNWXGBcdDcvTfob5hoLMRCcgEVFsMOA/XRhMv2qk70IbbVmZz7FrU47ND20bI/ZCZp5NaRzU47PfLyeFKeH56Etod9HkGVYeXGjHyz8T4BhITaXgEmQghUKd+cNvZiAKQTZlRG5tMIf+XpZVfkCITSwy4Ulr55Zaz9i9MzuqJmX7ecdN7Tgwd8Bl+9eH4Ed1GyLYeyC5w71sO8eQiSUiXZTsOkDhrhrHd9+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6B5bPg0JyaOhVeALKCw6RAdr9+R0mCO29u16YZGbuTc=;
 b=PY4c6H3PiAxheel2RN6b/AtdCk88uPSDPjvz4xfjZdf1iKRtiCLWvd6Gx75vKwOQo6u98Sa/mJOdWu8SrDmk0vPu8xpcyUua7RqNs9fj0p3Jhz2PjZcDkama5Gyhx6HiuLNFDAeQqJdfScwvMCJFKp0RfzlzLQLE/EtqYOaHX64KwRGe62K/KIiU09WFFchP++GTfFh/i/SIcnE5uVvJr7Pyt1U1SEnr14zxo7e1uN9InpxjbVn+4EwTDPUICLrS0RcySBToAr3Mc0ZOdHoQSWK9awyLc2Hlav5p3hrM2OmrXzrPJ/Xz+q0LOfefr2Lt43iJ1cXME/YaYZPtYcTF/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6B5bPg0JyaOhVeALKCw6RAdr9+R0mCO29u16YZGbuTc=;
 b=UA7bAuTyWjdgc8PrNvucx5TdgIcZi6a9apZT6FeATppPmZRADUKgmknkQzbfFLrGeMgih7Hu+11bh3PoC7FfVYuzyL6qbvFykVqslQzBIEtWK/nBrPNQDXWUl/exO4nLy5Ctums/msZTVUseqtOv78XSU5YIPl8j1aYfReRqeuk=
Authentication-Results: lists.linux-foundation.org; dkim=none (message not
 signed) header.d=none;lists.linux-foundation.org; dmarc=none action=none
 header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by MN2PR12MB3949.namprd12.prod.outlook.com (2603:10b6:208:167::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4108.24; Tue, 11 May
 2021 08:57:25 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::6d4d:4674:1cf6:8d34]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::6d4d:4674:1cf6:8d34%6]) with mapi id 15.20.4108.031; Tue, 11 May 2021
 08:57:24 +0000
To: Christoph Hellwig <hch@lst.de>
References: <20210511060514.3956745-1-hch@lst.de>
 <20210511060514.3956745-2-hch@lst.de>
 <d2a72848-8273-d0b6-0250-3fe88122246a@amd.com>
 <20210511085011.GA14477@lst.de>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <2af7d79c-4a9c-1b35-2a5a-c86e3a8df8d0@amd.com>
Date: Tue, 11 May 2021 10:57:17 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
In-Reply-To: <20210511085011.GA14477@lst.de>
Content-Language: en-US
X-Originating-IP: [2a02:908:1252:fb60:d03f:5642:6cf7:fcb]
X-ClientProxiedBy: AM0PR04CA0046.eurprd04.prod.outlook.com
 (2603:10a6:208:1::23) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:d03f:5642:6cf7:fcb]
 (2a02:908:1252:fb60:d03f:5642:6cf7:fcb) by
 AM0PR04CA0046.eurprd04.prod.outlook.com (2603:10a6:208:1::23) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4108.25 via Frontend Transport; Tue, 11 May 2021 08:57:22 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f6c6c2eb-b9fa-4ca6-1441-08d9145acba3
X-MS-TrafficTypeDiagnostic: MN2PR12MB3949:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MN2PR12MB3949B13196C0C68A9AD0046783539@MN2PR12MB3949.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: u78Up7ZF/kwLlWZVo0KTAw7ExyVyclFPaWYa8hUfFP0E6WUfP18JOgiV1vP61L00wzaI9X6VO4/z8ScS8WBwauqwf1Pk2o/KPqmI5ryMpzFof26eMkbrCEU+IiYjEDnzjEAamZvISKmQTHaexOenm2nJxMn2lRHV6wD6h/yVVecbWu/a8Kuc7zaD8zKFS0V6vgADmpOHsqKaZe0yRHsjtaiIMA5KoatdFBodbp8vIx5fx/7PlhZ4axbwCI36Te9Xlq8ShTn3m5w0pxAOwakpv6kLDlFcRD/snRivlAedM0ucTXII6cZnLW34kIJWfCmRcOU6Y0+0axfRaxYNF/AkKd1RF7d4lJ40rRjmeF0goHbj6NhPgbz1Mh+tPEGRx8vicjz/nTx58uMzufYEqUoyfkiWkI+c4vN8D5ooYQ5LXlbB5nWy32RNJPsZe7lDcx6q1LDDNsbTTn7FERZ0a1d1M+GThFaOCdklHnL7XhElptdnSFMFREu//odDnQunQeCcJAzZrN3L6QyrSe1rMU9MTYNIehqqcKJcm0IsK+7+rsIL3vWhSmjYtS5mQQ84snvNmsVCILaQJr668LWJThRqQP3uQRs0son3P0UPdz/KkbqCNFpN/FrUTeltBxYlb3EtGFlSGy0qAxjqWnxSU1ZXF8AE4AVy6f9IGTgo3gqu/MWO7J7UVxBTrYaV40BMcrKW
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(366004)(376002)(346002)(136003)(39860400002)(38100700002)(66574015)(478600001)(16526019)(66946007)(86362001)(186003)(52116002)(7416002)(66556008)(4326008)(2906002)(66476007)(316002)(8676002)(2616005)(6666004)(83380400001)(8936002)(54906003)(6916009)(6486002)(31686004)(31696002)(5660300002)(36756003)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?Z2ViMWVkVGRieUJkSURMbmNhR0xJcmNzdGwzaTZYOE9IUkdieHRSQkNlTXZK?=
 =?utf-8?B?Uzh0dldjdUZhN051UHp5VllqeVdWU0VaV1lNdjFVV0Y5S1REMnVQUUpOdll3?=
 =?utf-8?B?RVdoWlIyNXZqcElVWG9Wd2lWcndpM1p5bHFTS1JML3F6UXM3ODVXSUdSVGVR?=
 =?utf-8?B?Vlh5djA5TGhsenBjek5ZWktkMk92STB5dlJzSmJLb1lxWmQwUXhDYWFoSXAv?=
 =?utf-8?B?RGw0b1laVGw1RFNBZkVwY2c4dUhjNElQZkdQOEZEK09INHZaU2s1ZnRadHF0?=
 =?utf-8?B?WlRhU1dKWDNVSGxTbUVMcDlRMGVlZDdwc245Z1FjSGJPK1hlY2M5dmw3aGwz?=
 =?utf-8?B?cUwxZ1FnSGxDUldNOEl5N1FiUk1qOFpocUlNS0pnUUhqQTJtZjVYUGx1aGI4?=
 =?utf-8?B?b0xqYlZNM3FBSmQ1WDJGTDRsaVBNZjFjcTJnOUlBRkhUb2x1L1hvNDlHSWxB?=
 =?utf-8?B?NXFnbGdXa2hTa2VBN3VRWGJOZGxJYmFZL3VjdlVkMzNMaTN0dk9pS1BpWWla?=
 =?utf-8?B?WFl5VlljM1lFYXVWYU00aVVTQVpPTnVraS9seVdGMmV4YzllcEMvNCsvTEY4?=
 =?utf-8?B?T1ViRXN6NytuM01QR3M5azdDMk9TdW1VTUpDTTkwWXEyb1l6cTlmc000QlZF?=
 =?utf-8?B?Uk9kdDZMNWQ4bm1vVCt0SkE2YmRqSXpFcGIydmUyNkJsam9NN3B3SUNhSkN3?=
 =?utf-8?B?WngvNjF3U0RJSlNaZW9qOXltT0cxQlMwZWdqbW1hOG1zdVgwYVBGWkxlT3J6?=
 =?utf-8?B?WTdSOTZtekR1RkVjWFNHVWs1REdJQVgyZEJzYTVBUHJuMzdWSEhnaEEzY0dN?=
 =?utf-8?B?ZTFtVUQvV29Dd3ZnWW9XcFhZQXZkeTFKOER3bURmUzM1cFJyVTBUSVdSRTBE?=
 =?utf-8?B?MU90UHBlYWxVRHAxSHNkY1JkN1c1RTZlMWNPZjBFWjh2a21SOUoyRU03Yy9i?=
 =?utf-8?B?NXM2bE51dm1pM093UXdCTHZXSkdkOFZjeHAyQmlyOTVDNGRxSlZ3cXpzbzRC?=
 =?utf-8?B?NkMxZEtHOUVDQ1ZQSW1FTUZNQktLOVpFWTdrRDF0d3d0emJ0S0lGNUZKYkNa?=
 =?utf-8?B?WCtkUFpVUys2MURZNlp4OWVZdE41dnFOZmExR0F2YmJDeUdDbmxZaWtXTmRq?=
 =?utf-8?B?QmdVMm1kRTMrdklkOVpPdUowem9HUERlL2VMaW1uNlBQc3BJYWdzd3kwSHlj?=
 =?utf-8?B?Z2tzUlk1ZGlxWlV2ZUxqbEdDeDVNblpmOFpKSXNUL3dqMytXdHlvbGpibFd0?=
 =?utf-8?B?bllZZ2ZwTVZwOGJmaFlqNWtpNTJhdmVlbDJVYlJ0SmFUQWc0YXZtV2tnZzFn?=
 =?utf-8?B?TTUxbEdRV0h1dndVbnpraGJkS2tRS1VsemI5dW9hSjNKTUREa2lNWnlNM0pu?=
 =?utf-8?B?dm5PNEVPajhLN1U0ZXh3QWR0ajlMSGFQaEpucmJiUUJVUzVBS01yS010bm05?=
 =?utf-8?B?VXVyUmlZNUhkakdnRU1CRFpBVUVIcDRyNFl0NzM3YnZtRFZtZk1BYlVtZHc1?=
 =?utf-8?B?a1FRYTg2OENnNytucXJQU29VR3BOQ0dScmlTdGIwQVZmcjdETHdVYnZpRDBI?=
 =?utf-8?B?RFl6ZHlzam5wUUVRYjdkRU1UVmwrUHYwWklFcWZsVzZ0K08xQlNVTGg1dnZY?=
 =?utf-8?B?UFVralRTS1Y0WU1FM29vaE1KamQyYlhKL2hGMTcyaDNKSWFFbGpnaEY2cUYr?=
 =?utf-8?B?MkxDTzVaSWpMTlpUR2lldFk4R2xuVSt5aXJJdUlJalliUUczeER2NU02bE0x?=
 =?utf-8?B?d0ZhUmorNm41MWpscy9VVHlkUFEvMW81QnlXVVIvQkRoUE80dEhwTGhMcXZF?=
 =?utf-8?B?ODBOb05aekMvMWJKN1BOYWJHMk5heUJpdXVYZEo2RkhsNTR3MHpIMG9PcGRH?=
 =?utf-8?Q?N6hYoBnKzftzq?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f6c6c2eb-b9fa-4ca6-1441-08d9145acba3
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 May 2021 08:57:24.7869 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1MBravLZ+sfH2Auc8JOisOxJszU4DrnSFdLSCuUBuxJr0NqdgInH46qvnh1Ypuc6
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3949
Subject: Re: [Nouveau] [PATCH] drm/ttm: use dma_alloc_pages for the page pool
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
Cc: amd-gfx@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
 Roland Scheidegger <sroland@vmware.com>, dri-devel@lists.freedesktop.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, virtualization@lists.linux-foundation.org,
 iommu@lists.linux-foundation.org, Huang Rui <ray.huang@amd.com>,
 VMware Graphics <linux-graphics-maintainer@vmware.com>,
 Ben Skeggs <bskeggs@redhat.com>, Daniel Vetter <daniel@ffwll.ch>,
 nouveau@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>,
 Dave Airlie <airlied@redhat.com>, spice-devel@lists.freedesktop.org,
 Zack Rusin <zackr@vmware.com>, Gerd Hoffmann <kraxel@redhat.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

QW0gMTEuMDUuMjEgdW0gMTA6NTAgc2NocmllYiBDaHJpc3RvcGggSGVsbHdpZzoKPiBPbiBUdWUs
IE1heSAxMSwgMjAyMSBhdCAwOTozNToyMEFNICswMjAwLCBDaHJpc3RpYW4gS8O2bmlnIHdyb3Rl
Ogo+PiBXZSBjZXJ0YWlubHkgZ29pbmcgdG8gbmVlZCB0aGUgZHJtX25lZWRfc3dpb3RsYigpIGZv
ciB1c2VycHRyIHN1cHBvcnQKPj4gKHVubGVzcyB3ZSBhZGQgc29tZSBhcHByb2FjaCBmb3IgZHJp
dmVycyB0byBvcHQgb3V0IG9mIHN3aW90bGIpLgo+IHN3aW90bGIgdXNlIGlzIGRyaXZlbiBieSB0
aHJlZSB0aGluZ3M6Cj4KPiAgIDEpIGFkZHJlc3NpbmcgbGltaXRhdGlvbnMgb2YgdGhlIGRldmlj
ZQo+ICAgMikgYWRkcmVzc2luZyBsaW1pdGF0aW9ucyBvZiB0aGUgaW50ZXJjb25uZWN0Cj4gICAz
KSB2aXJ0dWFsaXp0aW9uIG1vZGVzIHRoYXQgcmVxdWlyZSBpdAo+Cj4gbm90IHN1cmUgaG93IHRo
ZSBkcml2ZXIgY291bGQgb3B0IG91dC4gIFdoYXQgaXMgdGhlIHByb2JsZW0gd2l0aCB1c2VycHRy
Cj4gc3VwcG9ydD8KCnVzZXJwdHIgZ3JhYnMgdGhlIHBhZ2VzIGZvciBhIGNlcnRhaW4gdmlydHVh
bCBtZW1vcnkgYWRkcmVzcywgbWFwIHRoZW0gCmluIHRoZSBJT01NVSBhbmQgdGhlbiBleHBlY3Qg
dGhlIGRldmljZSB0byBoYXZlIGNvaGVyZW50IGFjY2VzcyB0byBpdC4KCldoZW4gU1dJT1RMQiBp
cyBpbiBwbGFjZSB3ZSBuZWVkIHRvIGZhaWwgdGhhdCBncmFjZWZ1bGx5LCB0cnkgdG8gbm90IApl
eHBvc2UgdGhlIGZ1bmN0aW9uYWxpdHkgb3IgZXZlbiBkb24ndCBsb2FkIHRoZSBkcml2ZXIgaW4g
dGhlIGZpcnN0IHBsYWNlLgoKPj4gVGhlbiB3aGlsZSBJIHJlYWxseSB3YW50IHRvIGdldCByaWQg
b2YgR0ZQX0RNQTMyIGFzIHdlbGwgSSdtIG5vdCAxMDAlIHN1cmUKPj4gaWYgd2UgY2FuIGhhbmRs
ZSB0aGlzIHdpdGhvdXQgdGhlIGZsYWcuCj4gTm90ZSB0aGF0IHRoaXMgaXMgc3RpbGwgdXNpbmcg
R0ZQX0RNQTMyIHVuZGVybmVhdGggd2hlcmUgcmVxdWlyZWQsCj4ganVzdCBpbiBhIGxheWVyIHRo
YXQgY2FuIGRlY2lkZSB0aGF0INGVZW5zaWJseS4KCkNvbXBsZXRlbHkgYWdyZWUsIEknbSBqdXN0
IG5vdCBzdXJlIGlmIGV2ZXJ5IGRyaXZlciBnZXRzIGl0cyBjb2hlcmVudCAKbWFzayByaWdodCB1
bmRlciBldmVyeSBjb25kaXRpb24uCgpNaWdodCBiZSBhIGdvb2QgaWRlYSB0byBkb3VibGUgY2hl
Y2sgdGhlIGNvaGVyZW50IG1hc2sgaW4gbm91dmVhdS9yYWRlb24gCndoZW4gdGhleSB3YW50IHRv
IHVzZSBHRlBfRE1BMzIuCgo+PiBBbmQgbGFzdCB3ZSBuZWVkIHNvbWV0aGluZyBiZXR0ZXIgdG8g
c3RvcmUgdGhlIERNQSBhZGRyZXNzIGFuZCBvcmRlciB0aGFuCj4+IGFsbG9jYXRpbmcgYSBzZXBh
cmF0ZSBtZW1vcnkgb2JqZWN0IGZvciBlYWNoIHBhZ2UuCj4gWWVhaC4gIElmIHlvdSB1c2UgX19H
RlBfQ09NUCBmb3IgdGhlIGFsbG9jYXRpb25zIHdlIGNhbiBmaW5kIHRoZSBvcmRlcgo+IGZyb20g
dGhlIHBhZ2UgaXRzZWxmLCB3aGljaCBtaWdodCBiZSB1c2VmdWwuICBGb3IgNjQtYml0IHBsYXRm
b3Jtcwo+IHRoZSBkbWEgYWRkcmVzcyBjb3VsZCBiZSBzdG9yZSBpbiBwYWdlLT5wcml2YXRlLCBv
ciBkZXBlbmRpbmcgb24gaG93Cj4gdGhlIHBhZ2UgZ2V0cyB1c2VkIHRoZSBkbWFfYWRkciBmaWVs
ZCBpbiBzdHJ1Y3QgcGFnZSB0aGF0IG92ZXJsb2Fkcwo+IHRoZSBscnUgZmllbGQgYW5kIGlzIHVz
ZWQgYnkgdGhlIG5ldHdvcmtpbmcgcGFnZSBwb29sIGNvdWxkIGJlIHVzZWQuCgpZZXMsIEkndmUg
Y29uc2lkZXJlZCB0aGF0IGFzIHdlbGwuIEJ1dCBJIGRvIG5lZWQgdGhlIGxpc3RfaGVhZCBhbmQg
ZG1hIAphZGRyZXNzIGF0IHRoZSBzYW1lIHRpbWUuCgo+IE1heWJlIHdlIGNvdWxkIGV2ZW4gaGF2
ZSBhIGNvbW1vbiBwYWdlIHBvb2wgYmV0d2VlbiBuZXQgYW5kIGRybSwgYnV0Cj4gSSBkb24ndCB3
YW50IHRvIGdvIHRoZXJlIG15c2VsZiwgbm90IGJlaW5nIGFuIGV4cGVydCBvbiBlaXRoZXIgc3Vi
c3lzdGVtLgoKSSBoYWQgdGhlIHNhbWUgdGhvdWdodCBhbmQgYWxzbyB0aGUgc2FtZSBjb25jZXJu
cywgY2FuJ3QganVkZ2Ugd2hhdCB0aGUgCm5ldCBjb2RlIGlzIGRvaW5nIHdpdGggdGhpcy4KClJl
Z2FyZHMsCkNocmlzdGlhbi4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KTm91dmVhdSBtYWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5v
cmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1
Cg==
