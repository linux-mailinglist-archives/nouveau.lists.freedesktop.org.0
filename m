Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B3773A774D
	for <lists+nouveau@lfdr.de>; Tue, 15 Jun 2021 08:44:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A5B1389DDF;
	Tue, 15 Jun 2021 06:44:34 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2081.outbound.protection.outlook.com [40.107.220.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B71BF89DDF;
 Tue, 15 Jun 2021 06:44:32 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eLwxMwHWVehN/11n6BcluqTpiHGcROBTZd4e6SOO3SzKJofYWMHhvck1/CA0yS5rN1zpyZQxqSTC3W/RPmAaMKd6iL5QUI9pASojRAJk18XCTE5FMfYzpI4KPwILAJHUNjgU6oUNT7Zr8cPvUwSl29Kkeua434aGLBhUvaumfg6ZjTOcZpe/LcciPKD1GFvhvLEaOJed5NWFRxYrQcupkF8NT/a0+5gssJv7+cbvauBM0msElC/fe/ImvS+oREBboe6t/KDvVciB/dk39GbLSv+tD9SBP6Uox5n5xZ83sv5vs6IyXHQMUML3uHp2MIwZYmDIKYb6uOqlY8mDsegFBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bWHTTXXpMeSCLdh5AVcSSRzw99o4C63XWrcT8n8KWFg=;
 b=AuH59as8b/YGpOwkprm/TIwoTUUXvBWkbnmslb5eXBCdoaudcTkYn5qRIaYkTqbPPfBadWpLTtxBxk0qhr6Ev4lc6GBs4NpsYFkWQlAEB5XfEeX7dmyEKY3oml8/a2CZw0ibWYVc69KNZ9t4S4j63s+L6+szpBVtPsvMdF8PIhZChYMDdgWgn++gQQaaYiULYBoJo2m/Kn4d4Jz0Jz9EFxmuKbtAeSDa+AmaIas1Aj9spMJsoN9gNteomLYfRZkhy4LYUyaSh5HFxTDaZ1GCTnVXqFFONuN/oOweglYgiroFXIMxE/RcehQBgsPzUaIjMwfmStrkCbIv79i3sFS8oA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bWHTTXXpMeSCLdh5AVcSSRzw99o4C63XWrcT8n8KWFg=;
 b=IygDohQHiUnn0zOukKMPS2HPHeXEgm8j5gUGKNfU8GyHOEeJFKuNc7NraqVMGxBn/5mj9AmXENoFcXvBYtv6in+dr2IUU2OnTFUDUIfIYzHuorXxjhKaPQ04K0zQgN7GqqeC5LaAN3mnDV9IVcAKGp1VNs8hpwi+rnPjyeBU594=
Authentication-Results: huawei.com; dkim=none (message not signed)
 header.d=none;huawei.com; dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by MN2PR12MB3965.namprd12.prod.outlook.com (2603:10b6:208:168::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4219.24; Tue, 15 Jun
 2021 06:44:30 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::6c9e:1e08:7617:f756]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::6c9e:1e08:7617:f756%5]) with mapi id 15.20.4219.025; Tue, 15 Jun 2021
 06:44:30 +0000
To: Baokun Li <libaokun1@huawei.com>, bskeggs@redhat.com, airlied@linux.ie,
 daniel@ffwll.ch, sumit.semwal@linaro.org, dri-devel@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org
References: <20210525082511.580068-1-libaokun1@huawei.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <13227d03-d5d6-345f-5295-04bf9361bea2@amd.com>
Date: Tue, 15 Jun 2021 08:44:24 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
In-Reply-To: <20210525082511.580068-1-libaokun1@huawei.com>
Content-Language: en-US
X-Originating-IP: [2a02:908:1252:fb60:f438:4e93:3853:400c]
X-ClientProxiedBy: FR3P281CA0069.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:4b::16) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:f438:4e93:3853:400c]
 (2a02:908:1252:fb60:f438:4e93:3853:400c) by
 FR3P281CA0069.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:4b::16) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4242.9 via Frontend Transport; Tue, 15 Jun 2021 06:44:28 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 35822569-378b-4146-899c-08d92fc906dc
X-MS-TrafficTypeDiagnostic: MN2PR12MB3965:
X-Microsoft-Antispam-PRVS: <MN2PR12MB39650A858778597F0D942B0083309@MN2PR12MB3965.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:53;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: GEauWcnPFU1MhQokSoFr/m35yajBnNA/igRu5xVvykS2yB0hv7hRozJ8LHjo315z7oglXNJheFvY/5yBdWCkBR4pzGW0eB+SHSsGAVWk6WoUn/FmpVQWH6Ufi5FMmrByjRLLXmmOPzY91pByU4Qo6JtlvEKL/wcerdPC9Xz0AyG6AtcUN2rki3vKoNcbIEtvvnKypHgMLgO6DsiO8oBupcAIT2LwAnp9OeT10eil6yntabpogmbwLDsAZ6ERXQMeHeKInBQ7iVU81FgbrI8u5s0OCSUbaIuVvi4jq9JYY+ZaRS+GFMpgb3mUptnAbJDmXd3twLDbISpYfz+CGQdQcnA5PrjvN7owQCeSzOA9o8Ns/SJfBVAZqtFIRy1nEdCsggwUZ73+m8wDAfJZoI6a0YdPWYgLawXY+mm4exwYmw2ZEURxp/GiDj8O/0Gfc5AvbMVqmufUX740dcW5lCVPMJoCv+bgw4mKVwz/+9fRLMeheScfqwKbFKMJxau5i41cDRHOWqmZiYxIV2PtKHFGJlAtg+E08ykoXBT2W+dm+KYiCEkDimqtY08W6L5gBlXQa+BSmBEjis/EW1VSky6YbNcnGZPaCL4obzzoODpAD3FcO/b6xLnuvzEgqFu08Wkfawne11v7fEx+cgFOpddrae22ksMQdbV5vfTw3Pn9BPp/MupcXxWFjEB1DIxmibWmtmOayJb5hz77sm08kwJd5Q==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39860400002)(366004)(396003)(376002)(346002)(136003)(38100700002)(4326008)(478600001)(2906002)(83380400001)(31686004)(921005)(6666004)(66574015)(8676002)(16526019)(7416002)(5660300002)(186003)(2616005)(31696002)(36756003)(86362001)(66476007)(8936002)(66556008)(316002)(66946007)(6486002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VmVkRmR5a1BTdkNEelNZZG5hcWgrWHFUVUcyWHdvaG5zMnIxRFpUT1l6Tk5m?=
 =?utf-8?B?NTR4RDdGYVhGWk9Oa0k0THdpaHdHWC9DdFJPbE00a0xXaFUwZEp5bzB5S1RQ?=
 =?utf-8?B?dVhaR0dnNUhncTV4SVoxR0JLaFRUNkhaejV0cVl3WmZCcmY0ZmRzcyt4dkty?=
 =?utf-8?B?bHdIZ3Q3NjVoTVpHZEtPd2JZeFFoQ1hjOStOMXJNTDdGYXJHY2x3Q2xoc1pQ?=
 =?utf-8?B?RDIzVVlVd0Q3d3RhTklDRmtvMzJXYzkxaTBJbU1Fa29hdkViRm1wa1c0MVdT?=
 =?utf-8?B?UnVEcktyaklsOVY0NWxaMlp4RWM1ZXVKMjYyRHFHWGdOZi9sSnNpeEFHaEdk?=
 =?utf-8?B?SmNOMEdKUXk2cEg2aStnZis0QStaMW5OZ3ZsdVlCRzZGZDRDMmNWMXJLcUR6?=
 =?utf-8?B?QzhZNXJTeGxmOVNWL1NOZTQ5Znh3b2pIWGRiZTRrZ3JkdWwvRE5OcldJYlpE?=
 =?utf-8?B?QWJobDk1Um9XSHIxNkJablNqalpiS0V2TGhocmNZZUJzb0wzaGszUFovRmtK?=
 =?utf-8?B?Z3ljUTBsMldUYUR1TnM0UG1FeThwZU5aR05Jby92M2NMeWZxbFJua0hnb2VR?=
 =?utf-8?B?OUZEalRraEZtaHZrRnE1eWVWa1haN1FJQVUvZ21IbTFWdklZU3hVTG9mcStk?=
 =?utf-8?B?WGkydG1XYlBSdEhuVnJYeEJGcDdLQzJGM1duMUFSRVRvN0hVcFJjVCt5dm1I?=
 =?utf-8?B?cVpSYkFMK0VDM2RmZHEwSUo2OG1qRTBEMmNhYkNlOGphWWZiUTl4S2VTN3Jx?=
 =?utf-8?B?endYZmxRNHE3WmNnSFAzdzVuWjNIM1ZzVUFPbHZmU0FLekZZWFBXQ2V1YUdi?=
 =?utf-8?B?TU01ZkVtdE44Q3ZwaS8wb0I5UG83YmRDSGFRaGlGV2VUNzBKRGx6NnJyRGJY?=
 =?utf-8?B?enNBaW9JZGNhNk9vMVEyanNzRjQxKy9ZbTlwV05hWWg1d3d6NnBsUE9hMDBZ?=
 =?utf-8?B?Nm5WeThUR2VpajVUcjVkcU9lOGR2ZUpMUUpYK3Z1Nmw4SFJCU1RsMURSdDlC?=
 =?utf-8?B?bDg4ZFhXQnFMN0xqaFB3emtwa0JxSWNENlBDRi9LMjVQOG1rZWlOOHBHZ0Rw?=
 =?utf-8?B?cGlsL01kSWlJUldrMTlnN3FFODJhTUhXSUlNd0tBZjZKeWpIQm1sdEE5eUZP?=
 =?utf-8?B?SndOSlpUczhZNFBhTUlkc1lrSzJuZ2orUnRCVFpQZ0txMWc3TUVhaVZaQ0wv?=
 =?utf-8?B?aDNhOExBSmozOEJKSVJhdGR4WGdDY1czT1dkUE9TZk1qNUEwQUhEN2JpWWhj?=
 =?utf-8?B?WHpaaENOMVIwc0U1bFJRVmJtTm9iSTF2cmFZcWFDTjY5dUF6WlFOT29Kd2lC?=
 =?utf-8?B?N2NrNWU3TTVXU2RpQ0wyd0FEQitnVXhVYTBzUVIweHdkdHUxcmVMRTMxNkpS?=
 =?utf-8?B?VEVPSjZFKytHT2JEOFpobVdTNDFhQUhkenpHYVNjc2xmTTMyWGtCaDdubXpD?=
 =?utf-8?B?VVM5Qzg4NkdwcERnU1RZcW1NM1hoV3o3enF6U0ttTEJablEycTR3OG1sVEZr?=
 =?utf-8?B?bHI1cFNyWXpKV2pVaVlRTWdVWGc5cTFHMzhuYmtEd29MVXdPU0xDZTVMVkla?=
 =?utf-8?B?RzY1S3pMd2pVNDU5ZlExQ3Y1dk4yc284eDV1TXM5S3oyejMzQmhyRHp6SUJC?=
 =?utf-8?B?NVdFK2lQMnV0R3ZOSFh5bzlOOEZoOTdoLzMxbmQzUUpEZXhhRjBiVktNLy9Y?=
 =?utf-8?B?dktjUXcwZTdONXJ3aS9Rd1V6bmdqRHlBQkt2M0crbzdDYWgrRFBYdVNxT0lB?=
 =?utf-8?B?NXFvZkZsa2o0ZStWM1gwaTJqYWRCNlhiYW8rYmpGT2FnVTQyY2k4WlY2anEv?=
 =?utf-8?B?eU5ZWGF3S1RQL1haQUl2RlBHa0ZmOWlURDdtcUpDUGVIVlZNeFUyamc3bXVu?=
 =?utf-8?Q?ApDqhtbf7qj0i?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 35822569-378b-4146-899c-08d92fc906dc
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jun 2021 06:44:30.2292 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6ouqZBGFp+HIM5n2vV/lFPPZEWyJqOHSRe7cpFjR7C9nCCa6SRNBII7efoc7GUAH
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3965
Subject: Re: [Nouveau] [PATCH -next] drm/nouveau: Remove set but not used
 variable 'dev'
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
Cc: yuehaibing@huawei.com, weiyongjun1@huawei.com, yukuai3@huawei.com,
 yangjihong1@huawei.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

QW0gMjUuMDUuMjEgdW0gMTA6MjUgc2NocmllYiBCYW9rdW4gTGk6Cj4gRml4ZXMgZ2NjICctV3Vu
dXNlZC1idXQtc2V0LXZhcmlhYmxlJyB3YXJuaW5nOgo+Cj4gZHJpdmVycy9ncHUvZHJtL25vdXZl
YXUvbm91dmVhdV9iby5jOiBJbiBmdW5jdGlvbiAnbm91dmVhdV90dG1fdHRfcG9wdWxhdGUnOgo+
IGRyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L25vdXZlYXVfYm8uYzoxMjU4OjE3OiB3YXJuaW5nOgo+
ICAgdmFyaWFibGUg4oCYZGV24oCZIHNldCBidXQgbm90IHVzZWQgWy1XdW51c2VkLWJ1dC1zZXQt
dmFyaWFibGVdCj4KPiBkcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9ub3V2ZWF1X2JvLmM6IEluIGZ1
bmN0aW9uICdub3V2ZWF1X3R0bV90dF91bnBvcHVsYXRlJzoKPiBkcml2ZXJzL2dwdS9kcm0vbm91
dmVhdS9ub3V2ZWF1X2JvLmM6MTI4MToxNzogd2FybmluZzoKPiAgIHZhcmlhYmxlIOKAmGRlduKA
mSBzZXQgYnV0IG5vdCB1c2VkIFstV3VudXNlZC1idXQtc2V0LXZhcmlhYmxlXQo+Cj4gSXQgbmV2
ZXIgdXNlZCBzaW5jZSBpbnRyb2R1Y3Rpb24uCj4KPiBTaWduZWQtb2ZmLWJ5OiBCYW9rdW4gTGkg
PGxpYmFva3VuMUBodWF3ZWkuY29tPgoKQWNrZWQtYnk6IENocmlzdGlhbiBLw7ZuaWcgPGNocmlz
dGlhbi5rb2VuaWdAYW1kLmNvbT4KCj4gLS0tCj4gICBkcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9u
b3V2ZWF1X2JvLmMgfCA0IC0tLS0KPiAgIDEgZmlsZSBjaGFuZ2VkLCA0IGRlbGV0aW9ucygtKQo+
Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L25vdXZlYXVfYm8uYyBiL2Ry
aXZlcnMvZ3B1L2RybS9ub3V2ZWF1L25vdXZlYXVfYm8uYwo+IGluZGV4IDdhMjYyNGMwYmE0Yy4u
NTFmOWEyZTY1MzJlIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L25vdXZl
YXVfYm8uYwo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L25vdXZlYXVfYm8uYwo+IEBA
IC0xMjU0LDcgKzEyNTQsNiBAQCBub3V2ZWF1X3R0bV90dF9wb3B1bGF0ZShzdHJ1Y3QgdHRtX2Rl
dmljZSAqYmRldiwKPiAgIHsKPiAgIAlzdHJ1Y3QgdHRtX3R0ICp0dG1fZG1hID0gKHZvaWQgKil0
dG07Cj4gICAJc3RydWN0IG5vdXZlYXVfZHJtICpkcm07Cj4gLQlzdHJ1Y3QgZGV2aWNlICpkZXY7
Cj4gICAJYm9vbCBzbGF2ZSA9ICEhKHR0bS0+cGFnZV9mbGFncyAmIFRUTV9QQUdFX0ZMQUdfU0cp
Owo+ICAgCj4gICAJaWYgKHR0bV90dF9pc19wb3B1bGF0ZWQodHRtKSkKPiBAQCAtMTI2Nyw3ICsx
MjY2LDYgQEAgbm91dmVhdV90dG1fdHRfcG9wdWxhdGUoc3RydWN0IHR0bV9kZXZpY2UgKmJkZXYs
Cj4gICAJfQo+ICAgCj4gICAJZHJtID0gbm91dmVhdV9iZGV2KGJkZXYpOwo+IC0JZGV2ID0gZHJt
LT5kZXYtPmRldjsKPiAgIAo+ICAgCXJldHVybiB0dG1fcG9vbF9hbGxvYygmZHJtLT50dG0uYmRl
di5wb29sLCB0dG0sIGN0eCk7Cj4gICB9Cj4gQEAgLTEyNzcsMTQgKzEyNzUsMTIgQEAgbm91dmVh
dV90dG1fdHRfdW5wb3B1bGF0ZShzdHJ1Y3QgdHRtX2RldmljZSAqYmRldiwKPiAgIAkJCSAgc3Ry
dWN0IHR0bV90dCAqdHRtKQo+ICAgewo+ICAgCXN0cnVjdCBub3V2ZWF1X2RybSAqZHJtOwo+IC0J
c3RydWN0IGRldmljZSAqZGV2Owo+ICAgCWJvb2wgc2xhdmUgPSAhISh0dG0tPnBhZ2VfZmxhZ3Mg
JiBUVE1fUEFHRV9GTEFHX1NHKTsKPiAgIAo+ICAgCWlmIChzbGF2ZSkKPiAgIAkJcmV0dXJuOwo+
ICAgCj4gICAJZHJtID0gbm91dmVhdV9iZGV2KGJkZXYpOwo+IC0JZGV2ID0gZHJtLT5kZXYtPmRl
djsKPiAgIAo+ICAgCXJldHVybiB0dG1fcG9vbF9mcmVlKCZkcm0tPnR0bS5iZGV2LnBvb2wsIHR0
bSk7Cj4gICB9CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpOb3V2ZWF1IG1haWxpbmcgbGlzdApOb3V2ZWF1QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRw
czovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK
