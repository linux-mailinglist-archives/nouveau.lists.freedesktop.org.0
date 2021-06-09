Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D88E93A16EF
	for <lists+nouveau@lfdr.de>; Wed,  9 Jun 2021 16:18:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D821A6E4AD;
	Wed,  9 Jun 2021 14:18:02 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2043.outbound.protection.outlook.com [40.107.92.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 427956E4E3;
 Wed,  9 Jun 2021 14:18:01 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mrrFdLsVgqJ+L58cTrGpyRdu+Sz8gy9VHj8nDxrmzwi7FQohXD+xgAIEuCis5sSUOawyJpiAgKSYP1DoWhGIdYQ//5GlxKxHziSbgAqbMzrBxm2c5dHXANMkNje6pP9zJyrDuCQq8R+Yw43RxdJSGyADd/EiDqyKCuDl0phUxwG4+9KgMOy7GmHNz6nAaxhBzdpWVAHoQNpvW5v96OTZswCFaJt6PzLEtgA1HjlQYNFnSepVvis5crPCBjPcE3trZ9H55BTbwz1MzmFgPJYlxlPS2MZv2jb1vU7u5iB8PPtH8xWduuCErw0E8uF0iNpzHr8NStExqlYlqgOL6q1SHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=opJFhbYtoNjag0wqv6IWmVtTMd0e2q8+Z1Fa63lqZhE=;
 b=G8uXye9S9P33xaybYGVEufppFHbFAhgf1K4lvgs0dkoGXjVShMEHQvOqY8NLoh5a5iPJw7HZqHbdzi1JPstnzQzGWJqgnaKtheOpnrfXANb8BITMl8jJXG4CPr0HW54a23Y+AJbah10ptGFyTTXRc0Gi4ycmDZFhI8SWnLlD1vgKxgcNYBMcH0xEgH/gSOArFWpv4rguR24585UEeJgHX11banAnLRWlgQrpV4o+SeHmMrcfx9sGHcpAPmwDmYFWcQ5RhUjpg9v3X/npweAu6oISZTBsAhXNa4WDzy44Tu6zAFHfpHEg46DUdzS55zRGTz1v6YBHppDVMqL0ta0Kwg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=opJFhbYtoNjag0wqv6IWmVtTMd0e2q8+Z1Fa63lqZhE=;
 b=Rdy2eHJlk/iLbPTSogXGJ1R7rsyrMj3tM7vukIGipoBW28+G0cSJBkAudlW9zB0jKAn1iOnPfGrwOttiX5retAG0a13LuLolEV6JiVjRCGSI5R2GUw2CiQulUi0oPrmg4plfWAmXMsoWmDrxYVB5HHLguxqlAQ4IV50gjYyoLxo=
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by BL0PR12MB4932.namprd12.prod.outlook.com (2603:10b6:208:1c2::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4219.20; Wed, 9 Jun
 2021 14:17:59 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::6c9e:1e08:7617:f756]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::6c9e:1e08:7617:f756%5]) with mapi id 15.20.4219.022; Wed, 9 Jun 2021
 14:17:59 +0000
To: Mikko Perttunen <cyndis@kapsi.fi>
References: <2e4987b0-7fc9-d217-450c-943de430dbd1@kapsi.fi>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <816b619b-ff20-009a-ea05-504497c1946b@amd.com>
Date: Wed, 9 Jun 2021 16:17:53 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
In-Reply-To: <2e4987b0-7fc9-d217-450c-943de430dbd1@kapsi.fi>
Content-Language: en-US
X-Originating-IP: [2a02:908:1252:fb60:3e79:91ff:ea38:2624]
X-ClientProxiedBy: PR3P251CA0001.EURP251.PROD.OUTLOOK.COM
 (2603:10a6:102:b5::14) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:3e79:91ff:ea38:2624]
 (2a02:908:1252:fb60:3e79:91ff:ea38:2624) by
 PR3P251CA0001.EURP251.PROD.OUTLOOK.COM (2603:10a6:102:b5::14) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4195.15 via Frontend Transport; Wed, 9 Jun 2021 14:17:57 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: de66b01c-5bd0-4587-1152-08d92b51625a
X-MS-TrafficTypeDiagnostic: BL0PR12MB4932:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BL0PR12MB49329150FCE9CD1D58DDF9AF83369@BL0PR12MB4932.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2043;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: pjOK1xGJIfAHM0NuE4/ieLtpcC1C0QYbrL2D04cUGmmMewGC0//nk4kgYnt4Zg/soT8tP9XMWi15bukzVm+wAdqvhFyxg+zcPZS4WOtEt9wq/mAfmIppTtfFOkj27NpVIQ5GDCI/UKr63ar0GzwvFaGTPVEl3qE17mX6RP6mXMdV/SvA+++WH1XkhCZ4a+OoGW0PEvYSHcXUa95+6yU806HYMXdeirrEcoTTqiCw+AajLsCRnDsEUAbOk1BFvl+4MpY5LZyiykp5ZU5ONuNhip+TufRx6HaoO8M8tffJ4ZuBIBMoobVHA41Yyv1O17qaN9IWwQ84VsxZe5WKDQpzYm7OtDDp+RZa55VQb/lJxy67p8Y0MbnbBn3Ngn7aVCXcx8a3tZUlk99MSz94jvfBgMn6+xWHznxuy977QMl4bbT2v1B1BxauuVrScjm91Q1F9ggyk9dWqF5KWlmJKRXpEHpHDJmcWGunJwrY++R3ViAsFlF5k5l3ognjH0tPVVeB2Oaisya51brmKpkvqwMajPGrFSLHApBbLEpyoMPITBhkrh2fKi5BI/5/HFALZQTCAsU7GwVr5PMwohXq+nsfLdmZXiTviyA8XbZedxaJp/XtAfkjq+f/Cg0OBY+sX3porp+EhYysVAj/XqQkv10RJFI8WHKCFpLHricKi9MlaemHi7fxxBdk4Dh9KwD+ais3
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(396003)(366004)(346002)(39860400002)(376002)(31686004)(8676002)(2906002)(66556008)(6486002)(54906003)(186003)(16526019)(5660300002)(36756003)(4326008)(2616005)(38100700002)(316002)(478600001)(83380400001)(31696002)(8936002)(66476007)(6666004)(6916009)(66946007)(86362001)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RXM2cmZVVXN0UU56ckQ2Ym1ROU51VnkweHlsMHhUL2QrK1JIUW1QMk5halN5?=
 =?utf-8?B?c05GeUlPQ1NFSGNucG04L0hmcnI5em9sQ3g4ekErVDhJT3lsVnFMMVFValpJ?=
 =?utf-8?B?dDM2ejNrcjkwNjVtRTJOOTdqYjdXMnI3OElhazM0TXhTM01YNEN0WCtxcnhq?=
 =?utf-8?B?ZDRpcldDelhIbUIvSlJ5OUJEUXRVZUo0bEF2OXVzd2NBcE5nQUxuYVl1bjJR?=
 =?utf-8?B?bXJDQndGbWRVc1JhbEFnbEcvSDBERmwyY0VHaCsxeHMyejVnNUI1MThBRkVm?=
 =?utf-8?B?YTlhM1h1MDFTcUlrWVNKU0MzajNaUWhwZFhDT2syK3BKRHd6QWlzWHlIbzMz?=
 =?utf-8?B?cUZlNmxPNUlia3hNeHZWQ1lFVDhZdGFMc2l4RzIrRjB1anN2RzAvZjVsVWxK?=
 =?utf-8?B?SXRsZUNDQm4wN2xvVGdCWFdIV2cydTZJVEJtelFVZkVKOUF3MmlKN0RyTXpm?=
 =?utf-8?B?NjBtdC9WZjU1V1pTVUNZejQveDZFM0lDOFpyeFF2U1FRQ0gzdXZVTFArbjJr?=
 =?utf-8?B?RExPNzBFNVVrM0xLc0YzUmxVa29lZWN0NTFFNURrL1hWMzNDb1VLT0VXTmZL?=
 =?utf-8?B?eHAxT3MrMlRFTWg0UkJ4azBwcm8xOGdyczhscDI5RTM4YzlCR2FlKytITmx5?=
 =?utf-8?B?VTdNbTkrT0RzYjFtZGhJc3p1cWh0c252eU9nbHVkbmJBempuTUFIYW9rM1o3?=
 =?utf-8?B?QmxpV1BCV0ZrdFFYdDBWY3lONFNqK0ZLdjNVYjJGS2c0VzVWNndUMXhaeUUy?=
 =?utf-8?B?VEJFRUQzK3JPZHkxZksvY3hXMWh4aVZlNGlOdzllY0dLZEV5azVxNm1CNXll?=
 =?utf-8?B?aWI5Q2hLRFVIOUhWNEpjaEozWXY0TmwrWVRkdSs0RXpwdWpyVnduZ2JSa2Zi?=
 =?utf-8?B?QU5jUzEzSFI3NHYzVnBsZWs3S284NlZwRHp5b2JmTkk3SXRlVFo4WlpYMzc2?=
 =?utf-8?B?R2dhNUR2VC8zUFh0d1lmcU84ZUs5Vi9IYTRpWjhpZlBnYU8yR0h2NVBCSTlN?=
 =?utf-8?B?TmZucHRjeHlZSVZiOE5aK2FMRDV0TjB5NkQzb3dJL2owVkNoa0J1a0k5c0dY?=
 =?utf-8?B?Z2tmazNTYXVCQk9EbGdKWnUwK0tDK1JydFVicEg2VE9qZ3hieC9aWlg5blpH?=
 =?utf-8?B?elVFdHBWMk1IdmU2bDZXYXIwbGhSd3RLTFYvYlBVa3NEOUhybnVaQU5PYjQ3?=
 =?utf-8?B?RTNnMUV0a0ZkcjdnVi85cnROWlN6bVE0M1FDQlJ4Yy9EdHlLWnlFdUFyQ3Bu?=
 =?utf-8?B?TllPaWpQRDEySG0zcHp6ZEViaHpWY3RZU2RNcnJXeFNJMjM5MkNtbFArTm1z?=
 =?utf-8?B?RzZFRzRGZ0E4R0lSLzJKV1ZUY29ubVM0QmZGdnVWb3RuM21nVFZTUUdDMEdn?=
 =?utf-8?B?NDNmdlJRNURjZXpJbUorNFN4K1FzNTdsck9CUVIyRzlRZWkzckRQNXJVN3Vh?=
 =?utf-8?B?anVXMndPOTBlSXFBV3o3UWN4djNEM2xJeVlwdERFR3lPdC9TTUpxTzdrMnRZ?=
 =?utf-8?B?M2FQaWlVelk3ellLTE5uZUZWTWRsNEV5eXI5VGFXRXFTWFZyQ1BtVDlrUVZH?=
 =?utf-8?B?UlZQS2lNc1lTYmI3a1pqRFFFdXhBZXdUVXhzeGVCR3JmZDhCT0ttVXFSa2hh?=
 =?utf-8?B?RlFyOFB0dEc4aFZrandUTGM0c2Y5ZUVvWlpLOEdGK3NlanJ0U3JCZ3V2VTQ4?=
 =?utf-8?B?R1FlVzY5UDF5TE9rVXhiMEQzd0FTbVFYSDdhWXpNNHVKczM4STYwSVNUK29w?=
 =?utf-8?B?UzkyN0lXcDBvbkU5eFRNNzBWb0k2SmxETkgwZE9reWpQbFZKRVgrb0hYK0E5?=
 =?utf-8?B?NjdLNlp0UG9PVU5vU2hMYUUvVFZIY0h1alZBYTNOZHI2K0hxSmF0ZUdOTm90?=
 =?utf-8?Q?we5jmjHY0Zn2E?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: de66b01c-5bd0-4587-1152-08d92b51625a
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2021 14:17:59.4229 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pAgDE63dlyXzQp2AhrxpDnqDuVFVlJ44F7KLr6RsTH776cY+kST5bClwi6Q03ChC
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB4932
Subject: Re: [Nouveau] Trouble with TTM patches w/nouveau in linux-next
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
Cc: linux-tegra <linux-tegra@vger.kernel.org>, nouveau@lists.freedesktop.org,
 ray.huang@amd.com, matthew.auld@intel.com,
 dri-devel <dri-devel@lists.freedesktop.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

SGkgTWlra28sCgpzdHJhbmdlIHNvdW5kcyBsaWtlIE5vdXZlYXUgd2FzIHNvbWVob3cgYWxzbyB1
c2luZyB0aGUgR0VNIHdvcmthcm91bmQgCmZvciBWTVdHRlggYXMgd2VsbC4KCkJ1dCAtMTIgbWVh
bnMgLUVOT01FTSB3aGljaCBkb2Vzbid0IGZpdHMgaW50byB0aGUgcGljdHVyZS4KCkkgd2lsbCB0
cnkgd2l0aCBhIEc3MTAsIGJ1dCBpZiB0aGF0IGRvZXNuJ3QgeWllbGRzIGFueXRoaW5nIEkgbmVl
ZCBzb21lIAptb3JlIGlucHV0IGZyb20geW91LgoKVGhhbmtzIGZvciB0aGUgcmVwb3J0LApDaHJp
c3RpYW4uCgoKQW0gMDkuMDYuMjEgdW0gMTU6NDcgc2NocmllYiBNaWtrbyBQZXJ0dHVuZW46Cj4g
SGksCj4KPiBJJ20gb2JzZXJ2aW5nIG5vdXZlYXUgbm90IGluaXRpYWxpemluZyByZWNlbnRseSBv
biBsaW51eC1uZXh0IG9uIG15IAo+IFRlZ3JhMTg2IEpldHNvbiBUWDIgYm9hcmQuIFNwZWNpZmlj
YWxseSBpdCBsb29rcyBsaWtlIEJPIGFsbG9jYXRpb24gaXMgCj4gZmFpbGluZyB3aGVuIGluaXRp
YWxpemluZyB0aGUgc3luYyBzdWJzeXN0ZW06Cj4KPiBbwqDCoCAyMS44NTgxNDldIG5vdXZlYXUg
MTcwMDAwMDAuZ3B1OiBEUk06IGZhaWxlZCB0byBpbml0aWFsaXNlIHN5bmMgCj4gc3Vic3lzdGVt
LCAtMjgKPgo+IEkgaGF2ZSBiZWVuIGJpc2VjdGluZyBhbmQgSSBoYXZlIGZvdW5kIHR3byBwYXRj
aGVzIHRoYXQgYWZmZWN0IHRoaXMuIAo+IEZpcnN0bHksIHRoaW5ncyBmaXJzdCBicmVhayBvbgo+
Cj4gZDAyMTE3ZjhlZmFhIGRybS90dG06IHJlbW92ZSBzcGVjaWFsIGhhbmRsaW5nIGZvciBub24g
R0VNIGRyaXZlcnMKPgo+IHN0YXJ0aW5nIHRvIHJldHVybiBlcnJvciBjb2RlIC0xMi4gVGhlbiwg
YXQKPgo+IGQ3OTAyNWM3ZjVlMyBkcm0vdHRtOiBhbHdheXMgaW5pdGlhbGl6ZSB0aGUgZnVsbCB0
dG1fcmVzb3VyY2UgdjIKPgo+IHRoZSBlcnJvciBjb2RlIGNoYW5nZXMgdG8gdGhlIGFib3ZlIC0y
OC4KPgo+IElmIEkgY2hlY2tvdXQgb25lIGNvbW1pdCBwcmlvciB0byBkNzkwMjVjN2Y1ZTMgYW5k
IHJldmVydCAKPiBkMDIxMTdmOGVmYWEsIHRoaW5ncyB3b3JrIGFnYWluLiBUaGVyZSBhcmUgYSBi
dW5jaCBvZiBvdGhlciBUVE0gCj4gY29tbWl0cyBiZXR3ZWVuIHRoaXMgYW5kIEhFQUQsIHNvIHJl
dmVydGluZyB0aGVzZSBvbiB0b3Agb2YgSEVBRCAKPiBkb2Vzbid0IHdvcmsuIEhvd2V2ZXIsIEkg
Y2hlY2tlZCB0aGF0IGJvdGggeWVzdGVyZGF5J3MgYW5kIHRvZGF5J3MgCj4gbmV4dHMgYXJlIGFs
c28gYnJva2VuLgo+Cj4gVGhhbmsgeW91LAo+IE1pa2tvCj4KCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCk5vdXZlYXUgbWFpbGluZyBsaXN0Ck5vdXZlYXVA
bGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxt
YW4vbGlzdGluZm8vbm91dmVhdQo=
