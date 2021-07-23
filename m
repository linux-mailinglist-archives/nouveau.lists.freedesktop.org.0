Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5194D3D4126
	for <lists+nouveau@lfdr.de>; Fri, 23 Jul 2021 21:54:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A87E26E9D0;
	Fri, 23 Jul 2021 19:54:12 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam08on2043.outbound.protection.outlook.com [40.107.101.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C5DBE6E9D0;
 Fri, 23 Jul 2021 19:54:11 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bGRNTTP2ylXnng1n7nWZFG8hdNk49YXxdmD+62Yd9wridNUC1+SJ0Ug1hlvBJ7EEzxMTT1bh1xOL1IMpB7/IUzXmt2gCgTvvLnNeo79+J2wnRchzqekCEX+Z6Aqe1vCc/g/FRHfZKTSr/0qF6AlpM4VLq+UMNJW9ZCdbd+8cEebYCK7i2HCjDObI4QRQOA1h/MYqD2+O1KPlhWf0nLeN9qX4VYMwW6BlAD6yKtUjQcJ/s51SEq9PLu71IJt88W1GijF1MkX9alsOxviLnXgyHXPXaiTchQE8HH+onVFaTQG+DxmG7cRmAPKbdz2bvoaBTqst07ifxriAr/S2m86TKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZT1lqFbWotTb4Zt5rcxRrMltR8mTNsb3ffbQ6PzFMTQ=;
 b=MgdqUsTliK3pXQdBvceIZLerNeMHhGti9NZ0G2tCUIPvuyYTFOZT/BN3IaQTHKAT+Xil28WNMRqAQ6B+jM9b+JiKc/6XeI0LUfN8N8M4zfzq6742B7W+evE1Is97DzRwPyQlPvyc3kBq/s7FRcuP7xv2w5+bdS6XalCuZv3WWLM0VadR+M70HES6xHi6SqL7N7lKC/BeATw5WPSuWO19txVd1lQtR7I446SdQ94MZI6pKiUcUTfGRI6vU0kyyISIjcO0DrnNfdQHjV0nuRqYSwEFJyJo5sYNgawYfbiMd4ZViW0LPym2VF6aLf6QP/s/BNM9bEYCy3uic7AxQygjoQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZT1lqFbWotTb4Zt5rcxRrMltR8mTNsb3ffbQ6PzFMTQ=;
 b=QTnXXUxYz5zgQhwpYPyJyT5jBN/8B9wVjjRUuqJxSI9NjZGVUEitI3aqrjjpFEbaEGr+feT3RT52lYR9gDLarO6M0XqrPahSxKP9TQ21F9FBaDR/XoU1YdNmls1mDE91qemYmMfd/xN65CGSY7XHFpRHglMt1NBHtE48f5nmv8c=
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none header.from=amd.com;
Received: from CO6PR12MB5427.namprd12.prod.outlook.com (2603:10b6:5:358::13)
 by CO6PR12MB5425.namprd12.prod.outlook.com (2603:10b6:303:13e::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4352.25; Fri, 23 Jul
 2021 19:54:10 +0000
Received: from CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::39db:7a51:9e0d:9b19]) by CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::39db:7a51:9e0d:9b19%5]) with mapi id 15.20.4352.029; Fri, 23 Jul 2021
 19:54:10 +0000
To: "Cornij, Nikola" <Nikola.Cornij@amd.com>, Daniel Vetter
 <daniel@ffwll.ch>, Arnd Bergmann <arnd@kernel.org>
References: <20210723091534.1730564-1-arnd@kernel.org>
 <CAKMK7uHG0T7kgHzrkxoGj+Cv1-5f=GaH1CviunoZd_wEL5G4YQ@mail.gmail.com>
 <CAK8P3a3xjS-zJFiQgjYDz2Gja4KBeHWyrQX4PrbkkZfEV2OJgg@mail.gmail.com>
 <YPre51p6TirescUu@phenom.ffwll.local>
 <DM5PR12MB467963EB0A4E98B2182C6745EEE59@DM5PR12MB4679.namprd12.prod.outlook.com>
From: Harry Wentland <harry.wentland@amd.com>
Message-ID: <d59abe80-ab45-1b66-48c9-1d56075232d4@amd.com>
Date: Fri, 23 Jul 2021 15:54:07 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
In-Reply-To: <DM5PR12MB467963EB0A4E98B2182C6745EEE59@DM5PR12MB4679.namprd12.prod.outlook.com>
Content-Language: en-US
X-ClientProxiedBy: YT1PR01CA0001.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01::14)
 To CO6PR12MB5427.namprd12.prod.outlook.com
 (2603:10b6:5:358::13)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2607:fea8:3da0:edb0::4137] (2607:fea8:3da0:edb0::4137) by
 YT1PR01CA0001.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01::14) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4352.25 via Frontend Transport; Fri, 23 Jul 2021 19:54:09 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 587c873d-627d-4554-5284-08d94e13a37d
X-MS-TrafficTypeDiagnostic: CO6PR12MB5425:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <CO6PR12MB5425CCD677A391D95CA8923A8CE59@CO6PR12MB5425.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4714;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 7yLomdrMFtgAL5iYesuggg5er0vuCwMBvZkHCaKywrK4AUBtz9DdaN/6b3ZLzV3pcHgK6r6lcvFotXztP4gso8xyROJJQ752x588q7JzqVDnfVc4Q7pOER77GnWmHQTYs1ogvVH11NFQYE0+x/qjCCg6ZksDTmQtth9AUGtP9cz9Vg3Mp0X5lFUv/UzufwUeKLUK4J9UdF7FUBmX/sD5pRVioaklGvgoBySoc8Lyv/khgzvWcogS6HpGPh3baXkvjWNkoNp1DiYs97oN/arpLmUAu/89sQJE+y8jIqwN8bCE6BFDQsamdjIy/U1FB43MT1uCTN8lHmd0GH3+8ZtV6190TAjHPe0fOPwIFtMEczUAQP+RxJK4oCUXUaCxNARHAZavyiZaexj1ufoW/N3u9/duR7j5F0nV3lEbQJRD7vW1Nhta84hd1xxTcepH4YzANmWqO5ltu3JP+qKCtyV1TywV1SZ9fb6GCawKug+ionTkl1vSICY8kaXADv0Ids8BSdZKeR5Xw6k6j563g45wYP0couyC8ZclPgP7JYf4xf27lYJq1hEvo5s7a39DB/8SyBebSgXrhIxcfCFZJqI1amFkrBfhvJznKwaN76dcaRT+YMZgrf4NiMaxE+64yTfDA13r9agyVPy35ZmFRtWZWlfkoZt6r0PSbRUP1ZnvBqPQ/A6bEUR+2xUHI70VKTuW3d3bfwkVQNTJLhwZ9tmRnqVxiz3Wa+aUuFECFGsyk1pqGVaJbo9BvnoRHwKm4+ZivckLND6TlK6F4UXdqXTeuE6QhtAk9jOmfCguPXibF7EPSVPrtgF+oq5GNF/tYkNC8VzYG7g0JXxWd1btXVnGAg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR12MB5427.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(8676002)(53546011)(508600001)(54906003)(31686004)(31696002)(83380400001)(86362001)(966005)(186003)(6486002)(66574015)(36756003)(2616005)(7416002)(110136005)(66946007)(2906002)(316002)(38100700002)(66476007)(44832011)(5660300002)(4326008)(66556008)(8936002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cHJIcWlzOUlyWnZxQUNkV09iVm1XUURtTWNlcVFET0tSeEdQengwaWw0a3d2?=
 =?utf-8?B?K0U1SHRNaG80Nkc2eHdrblBsRnRJZ2pHWkNjNHpmSHFhakF3bGJlR0xxTmQ4?=
 =?utf-8?B?dlA5Tm91bHd2KzJyNTNQdmMwKzk4Tm1pcDM4ZzhZZWhKaURON1V3ZTZvcHBy?=
 =?utf-8?B?eGRUZlp0aXhtOG5pc0paQkRCOGZkSUZFSmkxMXJudEpvaXFHVk9GUWpQcStQ?=
 =?utf-8?B?ZWF3SlFuNGpLUVNYeUFPTmxhemptSDBkNGp6MFB2cDZ3TEkva0pkVy9qZDJF?=
 =?utf-8?B?eFJNZ1M5ZUVWNGFEbmQ4NkF2L0ErSXpnU29LYXVxMFBPNjh4Nk1zYjRWeVIr?=
 =?utf-8?B?c25DQUlnUWN4M3RuT1dVMGNhaVo1SXdBTzQ1QTFWZzFNdDQzc1Via3NDeXh6?=
 =?utf-8?B?WVRRUGY2TlJtSE5KQ3RRazVMTjk5dm95VFNIMGd4bngvMDk4S2hOUkc4THhz?=
 =?utf-8?B?aGNTbmJKSFQ0RVgzV043NDJyN2ZjbTg5L2VJUHVNaXRZOFNKa3g3QmpTVGMx?=
 =?utf-8?B?SHg1VzV3b1hQTEY3bWhucTdLOVdLWHpubjdBU1kvaG1jT0ZHS3B2ZW42MktV?=
 =?utf-8?B?UDNqbkVQeWJZZGZXdk1XN1hTektmMWFtR01jR0ZNU2hRd3VaMU1qNXlpT29o?=
 =?utf-8?B?eFlocEZrQXl6UnpFVFlUZksxN0V1cWFiK1Z6ZXZKNUNxSHlIdjNxYWpjWE5a?=
 =?utf-8?B?RUpYZFVKN0FHaWxOUkVEODJoR3cxRjE5R1ZXZUNUQ2U2RnU5QWx2citQbERw?=
 =?utf-8?B?Qk5EMkFNN09BbXo5RW5URDkwWE9na1hYd1ljcjEwenpSdFpIYkdOMU0vM0Ro?=
 =?utf-8?B?MkdNRWo3NE1tQSs5ZTdpN1RMM0JtQkJ5NSsvM0x3RWoxRU5QK3hSYzZvazda?=
 =?utf-8?B?K1BFaE9icmxaN0d2VnhObkxveVlhZjlrc2JoRXA4M3ppYjlrZVFIWUVTMzdz?=
 =?utf-8?B?WVU4UmtjeTFmTG1nUlZISnpzR2RvaExBTllweGx3ZEIyNHBtWFJYUzBsWVpE?=
 =?utf-8?B?UnRLK0pTNzYrZnR2emc5VmNsNVN4SDAzcUx0NHorV05icGVRekw3OEZ0N0Fs?=
 =?utf-8?B?d0w4K0tlVWxJaGQ0YzFKbUJKSTh2UXA2akxzRFk5K3dDSkhhdlhmWDIrcTAv?=
 =?utf-8?B?L2JaWElycUpBRm9iR0FZWXBSZ21vaGZBcVJpdzBTY3pIMEtmQXY3ZWhMNEFj?=
 =?utf-8?B?Ynl1eHM1WnFjMCtsWTMzM0RKdVVqQUgzZnpUb0tFSlQrTXV2SnNqYTJKektz?=
 =?utf-8?B?anpET3htRUJDNkJUZmpNNzZ1U1pIdjA1SE5ncFEzQXJXQXB5WktwSXNkcjVK?=
 =?utf-8?B?a2ZrZDJtU2RadXlVVUFOYWp2clhsc0o5UVJuR1NhWitzbFM0SVlqY2p2VkpF?=
 =?utf-8?B?ZzRESzcyQWpDR2xOaFl4b2xNZkxLSnVJNnhUeUYxWXhMN2lyVnhGcnpsVmVP?=
 =?utf-8?B?b0RjRFpaR0p1L1NzcDNyZU1qTGNwbENYcm9TaUlNYmRXcGJHdDkrU0lnVmFa?=
 =?utf-8?B?eTNPN3g4cktRTnA5am5HQVcvR2xweHRWQlZvTFBMRXVEYk9BUkY3OEIyUmRq?=
 =?utf-8?B?Qm1ua0xtcjRLM2pOcjZEaUpvb0ZyaUhuWHU2MzJ4c0twbVB1VmtPR3QzZFBo?=
 =?utf-8?B?bTdVVkhvUEdWeVRPandIWkZpY042Rjd3M3RnbC9tTjl5SExROTEyY3RHNHRU?=
 =?utf-8?B?dTFpWktrN1M1N1dJMVRTWWJBWkdjbzNMZXFRRys1eHhDMzNremV3S0Q5WE53?=
 =?utf-8?B?RnFOVzdaSFZlN2VqdEhPMThDRmtRZ1BubFBMT2h1UmlzRWdaU0IwdjI1NVky?=
 =?utf-8?Q?UAokL/OzqgO6v9ctbMdnFAN4bhcwlCZJVjIFI=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 587c873d-627d-4554-5284-08d94e13a37d
X-MS-Exchange-CrossTenant-AuthSource: CO6PR12MB5427.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jul 2021 19:54:10.5811 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QX4T7zHbQVvpsjEiV4wy5YFR/997qnqmQfjXWnQFVV1MRZgl/G1ell/K1sF8EEdEVBJzfDRcH0087P1x4B7r3g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR12MB5425
Subject: Re: [Nouveau] [PATCH] drm/nouveau/kms/nv50-: fix build failure with
 CONFIG_BACKLIGHT=n
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
Cc: Arnd Bergmann <arnd@arndb.de>, David Airlie <airlied@linux.ie>,
 Nouveau Dev <nouveau@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, Ben Skeggs <bskeggs@redhat.com>,
 =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

CgpPbiAyMDIxLTA3LTIzIDM6MTQgcC5tLiwgQ29ybmlqLCBOaWtvbGEgd3JvdGU6Cj4gW0FNRCBP
ZmZpY2lhbCBVc2UgT25seV0KPiAKPiArSGFycnkKPiAKPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2Ut
LS0tLQo+IEZyb206IERhbmllbCBWZXR0ZXIgPGRhbmllbEBmZndsbC5jaD4KPiBTZW50OiBGcmlk
YXksIEp1bHkgMjMsIDIwMjEgMTE6MjMgQU0KPiBUbzogQXJuZCBCZXJnbWFubiA8YXJuZEBrZXJu
ZWwub3JnPgo+IENjOiBEYW5pZWwgVmV0dGVyIDxkYW5pZWxAZmZ3bGwuY2g+OyBCZW4gU2tlZ2dz
IDxic2tlZ2dzQHJlZGhhdC5jb20+OyBEYXZpZCBBaXJsaWUgPGFpcmxpZWRAbGludXguaWU+OyBM
eXVkZSBQYXVsIDxseXVkZUByZWRoYXQuY29tPjsgQXJuZCBCZXJnbWFubiA8YXJuZEBhcm5kYi5k
ZT47IFZpbGxlIFN5cmrDpGzDpCA8dmlsbGUuc3lyamFsYUBsaW51eC5pbnRlbC5jb20+OyBDb3Ju
aWosIE5pa29sYSA8Tmlrb2xhLkNvcm5pakBhbWQuY29tPjsgZHJpLWRldmVsIDxkcmktZGV2ZWxA
bGlzdHMuZnJlZWRlc2t0b3Aub3JnPjsgTm91dmVhdSBEZXYgPG5vdXZlYXVAbGlzdHMuZnJlZWRl
c2t0b3Aub3JnPjsgTGludXggS2VybmVsIE1haWxpbmcgTGlzdCA8bGludXgta2VybmVsQHZnZXIu
a2VybmVsLm9yZz4KPiBTdWJqZWN0OiBSZTogW1BBVENIXSBkcm0vbm91dmVhdS9rbXMvbnY1MC06
IGZpeCBidWlsZCBmYWlsdXJlIHdpdGggQ09ORklHX0JBQ0tMSUdIVD1uCj4gCj4gT24gRnJpLCBK
dWwgMjMsIDIwMjEgYXQgMTI6MTY6MzFQTSArMDIwMCwgQXJuZCBCZXJnbWFubiB3cm90ZToKPj4g
T24gRnJpLCBKdWwgMjMsIDIwMjEgYXQgMTE6MjUgQU0gRGFuaWVsIFZldHRlciA8ZGFuaWVsQGZm
d2xsLmNoPiB3cm90ZToKPj4+Cj4+PiBPbiBGcmksIEp1bCAyMywgMjAyMSBhdCAxMToxNSBBTSBB
cm5kIEJlcmdtYW5uIDxhcm5kQGtlcm5lbC5vcmc+IHdyb3RlOgo+Pj4+Cj4+Pj4gRnJvbTogQXJu
ZCBCZXJnbWFubiA8YXJuZEBhcm5kYi5kZT4KPj4+Pgo+Pj4+IFdoZW4gdGhlIGJhY2tsaWdodCBz
dXBwb3J0IGlzIGRpc2FibGVkLCB0aGUgZHJpdmVyIGZhaWxzIHRvIGJ1aWxkOgo+Pj4+Cj4+Pj4g
ZHJpdmVycy9ncHUvZHJtL25vdXZlYXUvZGlzcG52NTAvZGlzcC5jOiBJbiBmdW5jdGlvbiAnbnY1
MF9zb3JfYXRvbWljX2Rpc2FibGUnOgo+Pj4+IGRyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L2Rpc3Bu
djUwL2Rpc3AuYzoxNjY1OjU5OiBlcnJvcjogJ3N0cnVjdCBub3V2ZWF1X2Nvbm5lY3RvcicgaGFz
IG5vIG1lbWJlciBuYW1lZCAnYmFja2xpZ2h0Jwo+Pj4+ICAxNjY1IHwgICAgICAgICBzdHJ1Y3Qg
bm91dmVhdV9iYWNrbGlnaHQgKmJhY2tsaWdodCA9IG52X2Nvbm5lY3Rvci0+YmFja2xpZ2h0Owo+
Pj4+ICAgICAgIHwgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIF5+Cj4+Pj4gZHJpdmVycy9ncHUvZHJtL25vdXZlYXUvZGlzcG52NTAvZGlz
cC5jOjE2NzA6MzU6IGVycm9yOiBpbnZhbGlkIHVzZSBvZiB1bmRlZmluZWQgdHlwZSAnc3RydWN0
IG5vdXZlYXVfYmFja2xpZ2h0Jwo+Pj4+ICAxNjcwIHwgICAgICAgICBpZiAoYmFja2xpZ2h0ICYm
IGJhY2tsaWdodC0+dXNlc19kcGNkKSB7Cj4+Pj4gICAgICAgfCAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgXn4KPj4+PiBkcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9kaXNwbnY1MC9k
aXNwLmM6MTY3MTo2NDogZXJyb3I6IGludmFsaWQgdXNlIG9mIHVuZGVmaW5lZCB0eXBlICdzdHJ1
Y3Qgbm91dmVhdV9iYWNrbGlnaHQnCj4+Pj4gIDE2NzEgfCAgICAgICAgICAgICAgICAgcmV0ID0g
ZHJtX2VkcF9iYWNrbGlnaHRfZGlzYWJsZShhdXgsICZiYWNrbGlnaHQtPmVkcF9pbmZvKTsKPj4+
PiAgICAgICB8ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgIF5+Cj4+Pj4KPj4+PiBUaGUgcGF0Y2ggdGhhdCBpbnRyb2R1Y2VkIHRo
ZSBwcm9ibGVtIGFscmVhZHkgY29udGFpbnMgc29tZSAjaWZkZWYKPj4+PiBjaGVja3MsIHNvIGp1
c3QgYWRkIGFub3RoZXIgb25lIHRoYXQgbWFrZXMgaXQgYnVpbGQgYWdhaW4uCj4+Pj4KPj4+PiBG
aXhlczogNmVjYTMxMGU4OTI0ICgiZHJtL25vdXZlYXUva21zL252NTAtOiBBZGQgYmFzaWMgRFBD
RAo+Pj4+IGJhY2tsaWdodCBzdXBwb3J0IGZvciBub3V2ZWF1IikKPj4+PiBTaWduZWQtb2ZmLWJ5
OiBBcm5kIEJlcmdtYW5uIDxhcm5kQGFybmRiLmRlPgo+Pj4KPj4+IENhbiB3ZSBqdXN0IHRvc3Mg
dGhlIGlkZWEgdGhhdCBCQUNLVExJR0hUPW4gaXMgYSByZWFzb25hYmxlIGNvbmZpZwo+Pj4gZm9y
IGRybSBkcml2ZXJzIHVzaW5nIGJhY2tsaWdodHMsIGFuZCBhZGQgZGVwZW5kcyBCQUNLTElHSFQg
dG8gYWxsCj4+PiBvZiB0aGVtPwo+Pj4KPj4+IEkgbWVhbiB0aGlzIGlzIGEgcGVyZmVjdCBzb3Vy
Y2Ugb2YgY29udGludWVkIHBhdGNoIHN0cmVhbXMgdG8ga2VlcAo+Pj4gdXMgYWxsIGJ1c3ksIGJ1
dCBiZXlvbmQgdGhhdCBJIHJlYWxseSBkb24ndCBzZWUgdGhlIHBvaW50IC4uLiBJCj4+PiBmcmFu
a2x5IGhhdmUgYmV0dGVyIHRoaW5ncyB0byBkbywgYW5kIGVzcGVjaWFsbHkgd2l0aCB0aGUgYmln
Cj4+PiBkcml2ZXJzIHdlIGhhdmUgbWFraW5nIGJhY2tsaWdodCBvcHRpb25hbCBzYXZlcyBjb21w
YXJpdGl2ZWx5IG5vdGhpbmcuCj4+PiAtRGFuaWVsCj4+Cj4+IFllcyEgSSdkIGRlZmluaXRlbHkg
YmUgaW4gZmF2b3Igb2YgdGhhdCwgSSd2ZSB3YXN0ZWQgd2F5IHRvbyBtdWNoIHRpbWUKPj4gdHJ5
aW5nIHRvIHNvcnQgdGhyb3VnaCBkZXBlbmRlbmN5IGxvb3BzIGFuZCBvdGhlciBwcm9ibGVtcyB3
aXRoIGJhY2tsaWdodCBzdXBwb3J0Lgo+Pgo+PiBNYXliZSB3ZSBzaG91bGQgbGVhdmUgdGhlIGRy
aXZlcnMvdmlkZW8vZmJkZXYvIGRyaXZlcnMgdW50b3VjaGVkIGluCj4+IHRoaXMgcmVnYXJkLCBh
dCBsZWFzdCBmb3IgdGhlIG1vbWVudCwgYnV0IGZvciB0aGUgZHJpdmVycy9ncHUvZHJtCj4+IHVz
ZXJzIG9mIGJhY2tsaWdodCB0aGF0IHdvdWxkIGJlIGEgbmljZSBzaW1wbGlmaWNhdGlvbiwgYW5k
IGV2ZW4gdGhlCj4+IHNtYWxsZXN0IG9uZXMgYXJlIHVubGlrZWx5IHRvIGJlIHVzZWQgb24gc3lz
dGVtcyB0aGF0IGFyZSB0b28gbWVtb3J5Cj4+IGNvbnN0cmFpbmVkIHRvIGRlYWwgd2l0aCA0S0Ig
ZXh0cmEgLnRleHQuCj4gCj4gWWVhaCBJIHRoaW5rIHdlIGNhbiBkbyB0aGlzIGVudGlyZWx5IGFk
LWhvYywgaS5lLiBhbnkgdGltZSB0aGUgYmFja2xpZ2h0IHdoZWVsIHdvYmJsZXMgb2ZmIGFnYWlu
IHdlIG5haWwgaXQgZG93biBmb3IgZ29vZCBmb3IgdGhhdCBkcml2ZXIgd2l0aCBhIGRlcGVuZHMg
b24gQkFDS0dMSUdIVCBhbmQgcmVtb3ZlIGFueSBsaW5nZXJpbmcgI2lmZGVmIGFsbCBvdmVyLgo+
IAo+IElmIHlvdSB3YW50IG1heWJlIHN0YXJ0IG91dCB3aXRoIHRoZSBiaWdnZXN0IGRybSBkcml2
ZXJzIGluIGEgc2VyaWVzLCBJIHRoaW5rIGlmIG5vdXZlYXUvYW1kZ3B1L2k5MTUgZm9sa3MgYWNr
IHRoaXMgeW91J3JlIGdvb2QgdG8gZ28gdG8ganVzdCBjb252ZXJ0IGFzIHRoaW5ncyBnZXQgaW4g
dGhlIHdheS4KClNvdW5kcyBsaWtlIGEgZ29vZCBpZGVhIHRvIG1lLgoKSGFycnkKCj4gLURhbmll
bAo+IC0tCj4gRGFuaWVsIFZldHRlcgo+IFNvZnR3YXJlIEVuZ2luZWVyLCBJbnRlbCBDb3Jwb3Jh
dGlvbgo+IGh0dHA6Ly9ibG9nLmZmd2xsLmNoLz4+IAoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBtYWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0
cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9ub3V2ZWF1Cg==
