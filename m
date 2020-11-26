Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 399D62C5457
	for <lists+nouveau@lfdr.de>; Thu, 26 Nov 2020 14:01:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9890E6E942;
	Thu, 26 Nov 2020 13:01:12 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2057.outbound.protection.outlook.com [40.107.92.57])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7BC906E942
 for <nouveau@lists.freedesktop.org>; Thu, 26 Nov 2020 13:01:11 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PcAOgurvIO47NGI8tqmpYbgj7Sb6aodvAAe3eL8JejEEf8BiUNfN/7GxZZ+/+kEuu4/weABV+w84WnehiCKQzGTiKbRjRE9oJacF6ipY4QGkXqSwvrmtHbRNBZiy7kav6edO2qELqKfMevOdqPldCDtcPBmA+zvEK8hjFhq6PUyP5kksD2KySqfMpaB/ANLEQWavNMwx2VdKc9yxVStJ6lnV538aIHDbbMNwWFlQhoTyhyQbRIreKlEJATOA6l54jl4ARia7XClslgQTT+iGBQPp4qmY718LXTA0OJhL7IUqpo6AD8UIoF97UKDDhYozWU4Unqq3V/e5qcTqu/JvQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=j7Y2iUCLUeV2fBAjVjkf3w1vjIXhrJeFpC4poyFfH/c=;
 b=cYPrUVdt4CLKpvIiHJmjTGmbfwdO+R5EWpYOBZU9Tg7WeHkxZTs9Xse6aEKSnPTpxSxl0FmIHfLFl9KyYALlYlJ4ly7YGK06tfnzaO0P5Vk2iNw+u9ixFGgNg+421Xv9mU0eQ4gKXxUN6Pwc2q/62TNbtMuQXcpF1aqAaGLSM2R8J9R6BtkM33Eu+dg4sJs1Ei4Fi9jGLBOwksvRUqQTVu3qrWQ9pUliI2KbRMXYMCfy0+TzzowWu/aVRmUSCA92s8XLh/CRH1UF+O9bWJZ+m/cc7Nw5QzVQwtjLQvzeLnA8uG090f4jTBAoGuE2zPNZ4cjldIF2a6cNMdg58Dfuiw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=j7Y2iUCLUeV2fBAjVjkf3w1vjIXhrJeFpC4poyFfH/c=;
 b=en95wE5q1joT3nm4mdpY/W0mIlMSf5gPd2sI6qk3vgC7U1rQxz8H3MgtPDoDriU0tkbTrt5zoufDan9+x4wBZ2aoN+Kt7qrbSppXpvpBxqkBjHTKllAge3k9413hDfdYWsrpvJFgLUbCaNZw8lglrqyWEHp+kXPcxBuQ+Uc57RE=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by MN2PR12MB3935.namprd12.prod.outlook.com (2603:10b6:208:168::31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3564.25; Thu, 26 Nov
 2020 13:01:08 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::1ccc:8a9a:45d3:dd31]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::1ccc:8a9a:45d3:dd31%7]) with mapi id 15.20.3589.032; Thu, 26 Nov 2020
 13:01:08 +0000
To: dmarkh@cfl.rr.com, markh@compro.net, nouveau@lists.freedesktop.org
References: <db0e5f78-8271-24b5-62f6-5473f69ac8d6@compro.net>
 <c2ee46af-79a8-9a07-b12d-b755017ee500@amd.com>
 <aa4e3741-b1b2-4ae2-6b35-880b40c985c8@compro.net>
 <e84a7564-921c-d852-b62d-80563bea99b1@amd.com>
 <3f22c4f6-83fd-ef11-ba1d-bc85d6a0d557@cfl.rr.com>
 <47ab20f6-dc56-8ade-29b6-f8fc684628d3@amd.com>
 <1d85e515-4d9c-30ec-c69b-217dacc1fa51@cfl.rr.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <22bdd617-abda-6014-55d9-1677066641ca@amd.com>
Date: Thu, 26 Nov 2020 14:01:01 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <1d85e515-4d9c-30ec-c69b-217dacc1fa51@cfl.rr.com>
Content-Language: en-US
X-Originating-IP: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
X-ClientProxiedBy: AM8P190CA0018.EURP190.PROD.OUTLOOK.COM
 (2603:10a6:20b:219::23) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
 (2a02:908:1252:fb60:be8a:bd56:1f94:86e7) by
 AM8P190CA0018.EURP190.PROD.OUTLOOK.COM (2603:10a6:20b:219::23) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3611.20 via Frontend Transport; Thu, 26 Nov 2020 13:01:06 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: df7c27d1-811b-49cc-5d78-08d8920b5707
X-MS-TrafficTypeDiagnostic: MN2PR12MB3935:
X-Microsoft-Antispam-PRVS: <MN2PR12MB39354D654EE6AABFB0611CF483F90@MN2PR12MB3935.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: AOlwVGSS1JxHnCn7mO2tcCvtG5/2phaZcPXXLOjkgkmbAkye22IdNP52DFYkXYay2w38qXYnOpSmvf4hJBwOXRSM6Rq5QVOOG8TxnSoIO+olIrwR9jAUGg222Vz/yuxwztzNt0P4tO8kezNksQh/CtBF8u6SHbgl73VNBZQJ5y+nDlOGOuQKw/YfycfORXpwu3wJjxF7S1DY0QHxh9IvSa9gtu8f6h2c0MSmRdU04HNlprZGREVwnNE8Flejc34ZgvBcMj7pgjgXTkjuuih7BR6GuOg26byq2WNTtmpj+A2QpHlnj9usXMPPYiT1j4zhnwOPwpMj/Cx54ngzhaoCHjh4VudSGFxqafTFf9lmFiDcEzPxUocCyZ7owdxsXv5X
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39860400002)(366004)(346002)(136003)(396003)(376002)(16526019)(478600001)(66574015)(5660300002)(36756003)(52116002)(86362001)(6666004)(316002)(186003)(6486002)(31686004)(2616005)(8936002)(53546011)(66476007)(2906002)(8676002)(83380400001)(66946007)(66556008)(31696002)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?RjVFenp1M1JFaFNmRTZ6eXFoVlJqVU1ZOUlXbndvbXZpcDNyNmVxbnVTK0lT?=
 =?utf-8?B?bXozeXJHQ002bDBqK05UNVNrVXA3QzJTUGpMNmx0QmpjRVVjbXhFMzRQeTBp?=
 =?utf-8?B?bmN4TjR5SXkzKzJ1WjZaeHBhNjVaOEc3TTAwdTJ4SFhtQzBHWisraE42ZE5U?=
 =?utf-8?B?U0V1c1dZUUFlK0Q5SElaNDRDSUV1K0prZHpuajJERmp6M2dPSGltMjJzZW5J?=
 =?utf-8?B?S00vNzE0RFN1bnJBWGtTaHJFbE1ybnc4UEdvZmNMd1cwSXE0SldXbk1PWXU0?=
 =?utf-8?B?Wk85c1VoU01qNXcrYzBLNkczUjNNNFVGMEg5RHVuVERFNGxyVUlJU2ZZUnNW?=
 =?utf-8?B?ZDNFbkdGN0xidDN3R0cxU2V2WjJNVm9EdWFjdDlRNjluc2dlUk9QYXByeE5m?=
 =?utf-8?B?aWdXM01kRWtWQ2ttUmxaWWlGcVZJUDg3ZjVsM2hpS1FuaEd3WWR5OGdiKzNT?=
 =?utf-8?B?eFB0Z3g2dkFRTG8wbTZQM1RtQ0ZMaDAvajErS0g4My9BdjRMbzI0cmpDMU1y?=
 =?utf-8?B?MXJNdGZVeXdGbU4zelpweEFZZG9BblJnVFV0dEtPeGZ4L1J6allOcHljRXNR?=
 =?utf-8?B?Wk15NHc5b3ZEUklTTFBGTnhMMjJwbGx2dzVqV2xmZVo5WmVnV3dJdWFUSEE0?=
 =?utf-8?B?WFQ0QmdIRDNxb0duRXN2ejJ2WWhxMWEydVJlZWlYY2hicXFPRXpEV09vdUY4?=
 =?utf-8?B?dVFpQzk5L29XN2h4V3hyS01vREloQUpqVXZqRVoxb0VlR01JR3lId2s4MTFO?=
 =?utf-8?B?Z2hBSVEvc05UYkFWa1pFMFp5emZ3Ty9leWxhbnhyeEEwRzg3d2o3dE1ueE1r?=
 =?utf-8?B?cGlVZHNzRlltVnNjYkJsajVGazNOM0lWOEQzL3o4SjNwNUtmZ09EMXJmV0du?=
 =?utf-8?B?Yi8xb1d6SENiR3BJZWZUNWZjTDlzZDFvWitvY3phV2FoaWJJU0pLU0dDL0ZD?=
 =?utf-8?B?Z1E1dVFwSlZ6YmhLNDBISlpONFNkbFE3TzFaTHVhNkw1MFVpTkV5NnhaMUJC?=
 =?utf-8?B?eE12cWV4NndhSzFGNzJhRnJ6VTQzM2JlTUlOREpuYkVWWjRSSjRQdUxic3Av?=
 =?utf-8?B?VXdUNFJ4eWhtN3F5MVRsOWRZNE5MZ01BNE96UEFGSGtUZ3VBaThQbkFvWXlM?=
 =?utf-8?B?TDg3VlpjVE9mTVAwV1U1UXJJaXV2SkdWcUJGR3IyMC9PUnM4eGhlNGdSRFZq?=
 =?utf-8?B?ZVRaM2xwc09UYWg2TnhYR2tOSjlNeUl0YnhweUFua0lyS1FaNVJjK0drMm9v?=
 =?utf-8?B?S09LbFM1ck1rZENtN0JJVThrakNBdzJDOC9xV0xFcDJyQWQ4UWpBS3F0VytW?=
 =?utf-8?B?aTdlUGpBOTlMNnFZV3VKVGtoWlR5TDBVUFI5NWFYRHVLMnBYNENKOFZzZ3Jw?=
 =?utf-8?B?a0szN2Q0cndMVklqRFhrMnVwRUhZc2UralVVNHN5eG9UYjAyNkxscXQvMXF4?=
 =?utf-8?Q?t7kCE/xT?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: df7c27d1-811b-49cc-5d78-08d8920b5707
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Nov 2020 13:01:08.0108 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: b5LICI7KWbdAeb4KdZGAkV1Zvscq6NLS4cPcYH7Qme69D1UrnGpNDAXbOp02cv1p
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3935
Subject: Re: [Nouveau] [BUG][NOUVEAU] G70 broken since 5.10-rc1
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

QW0gMjYuMTEuMjAgdW0gMTM6NTcgc2NocmllYiBNYXJrIEhvdW5zY2hlbGw6Cj4gT24gMTEvMjYv
MjAgNzo0MSBBTSwgQ2hyaXN0aWFuIEvDtm5pZyB3cm90ZToKPj4gSGkgTWFyaywKPj4KPj4gQW0g
MjYuMTEuMjAgdW0gMTM6MjYgc2NocmllYiBNYXJrIEhvdW5zY2hlbGw6Cj4+PiBPbiAxMS8yNi8y
MCA3OjA1IEFNLCBDaHJpc3RpYW4gS8O2bmlnIHdyb3RlOgo+Pj4+IEhpIE1hcmssCj4+Pj4KPj4+
PiBBbSAyNi4xMS4yMCB1bSAxMDo1OSBzY2hyaWViIE1hcmsgSG91bnNjaGVsbDoKPj4+Pj4gT24g
MTEvMjYvMjAgMzozNSBBTSwgQ2hyaXN0aWFuIEvDtm5pZyB3cm90ZToKPj4+Pj4+PiBJJ20gcnVu
bmluZyBhbiBvbGRlciAiTlZJRElBIENvcnBvcmF0aW9uIEc3MCBbR2VGb3JjZSA3ODAwIEdUXSAK
Pj4+Pj4+PiAocmV2IGExKSIgY2FyZCBpbiBhIG5ld2VyIEJJT1NUQVIgQjU1MEdUQSBNQi4gS2Vy
bmVsIDUuMTAtcmN4IAo+Pj4+Pj4+IGRvZXMgbm90IHdvcmsuIEkgZ2V0IG5vIHZpcnR1YWwgY29u
c29sZXMgb3IgWCBzY3JlZW4uCj4+Pj4KPj4+PiB0aGFua3MgZm9yIHRoZSBkbWVzZy4KPj4+Pgo+
Pj4+IFByb2JsZW0gaXMgSSBkb24ndCBoYXZlIHRoZSBzbGlnaHRlc3QgaWRlYSB3aGF0J3MgZ29p
bmcgd3JvbmcgaGVyZSA6KQo+Pj4+Cj4+Pj4gVGhlIGNvZGUgc2hvdWxkIGJlIGZ1bmN0aW9uYWwg
aWRlbnRpY2FsLCBpdCB3YXMganVzdCBtb3ZlZCBmcm9tIFRUTSAKPj4+PiB0byBub3V2ZWF1LCBz
byB3ZSBhcmUgbWlzc2luZyBzb21lIGRldGFpbCBpbiB0aGUgaGFuZGxpbmcuCj4+Pj4KPj4+PiBD
YW4geW91IHJ1biB0aGUgZm9sbG93aW5nIHRlc3QgZm9yIG1lOiBGaXJzdCB5b3UgbmVlZCB0byBk
aXNhYmxlIAo+Pj4+IGxvYWRpbmcgb2YgdGhlIG5vdXZlYXUga2VybmVsIG1vZHVsZSBieSBhZGRp
bmcgCj4+Pj4gbW9kcHJvYmUuYmxhY2tsaXN0PW5vdXZlYXUgdG8gdGhlIGtlcm5lbCBjb21tYW5k
IGxpbmUuCj4+Pj4KPj4+PiBUaGVuIGxvZyBpbnRvIHRoZSBzeXN0ZW0gb3ZlciB0aGUgbmV0d29y
ayBhbmQgcnVuIHRoZSBmb2xsb3dpbmcgCj4+Pj4gY29tbWFuZHM6Cj4+Pj4KPj4+PiBzdWRvIG1v
ZHByb2JlIHR0bQo+Pj4+IHN1ZG8gYmFzaCAtYyAiZWNobyAndHRtX2JvX2ttYXAnID4gCj4+Pj4g
L3N5cy9rZXJuZWwvZGVidWcvdHJhY2luZy9zZXRfZ3JhcGhfZnVuY3Rpb24iCj4+Pj4gc3VkbyBi
YXNoIC1jICJlY2hvIGZ1bmN0aW9uX2dyYXBoID4gCj4+Pj4gL3N5cy9rZXJuZWwvZGVidWcvdHJh
Y2luZy9jdXJyZW50X3RyYWNlciIKPj4+PiBzdWRvIG1vZHByb2JlIG5vdXZlYXUKPj4+PiBzdWRv
IGJhc2ggLWMgImNhdCAvc3lzL2tlcm5lbC9kZWJ1Zy90cmFjaW5nL3RyYWNlIiA+IHRyYWNlLmxv
Zwo+Pj4+Cj4+Pj4gUGxlYXNlIHRoZW4gc2VuZCBtZSB0aGUgcmVzdWx0aW5nIHRyYWNlLmxvZyBm
aWxlIHNvIHRoYXQgSSBjYW4gCj4+Pj4gaW52ZXN0aWdhdGUgd2h5IG1hcHBpbmcgdGhlIGZyYW1l
YnVmZmVyIGZhaWxzIGR1cmluZyBkcml2ZXIgbG9hZC4KPj4+Pgo+Pj4+IFRoYW5rcyBpbiBhZHZh
bmNlLAo+Pj4+IENocmlzdGlhbi4KPj4+Cj4+PiBJIGhvcGUgdGhpcyBpcyB3aGF0IHlvdSBuZWVk
LiBJIGRvIG5vcm1hbGx5IHR1cm4gb2ZmIGEgbG90IG9mIGRlYnVnIAo+Pj4gZmVhdHVyZXMuIExl
dCBtZSBrbm93IGlmIEkgbmVlZCB0byBjaGFuZ2UgdGhlIGtlcm5lbCBjb25maWcuCj4+Cj4+IEl0
IHdhcyBub3Qgd2hhdCBJIGhhZCBleHBlY3RlZCBidXQgaXQgcG9pbnRlZCBtZSBpbiB0aGUgcmln
aHQgCj4+IGRpcmVjdGlvbi4gSSB0aGluayBJJ3ZlIGZvdW5kIHRoZSBwcm9ibGVtLCBpdCdzIGp1
c3QgYW4gdW5pbml0aWFsaXplZCAKPj4gcmV0dXJuIHZhbHVlIGZvciB5b3VyIGhhcmR3YXJlIGdl
bmVyYXRpb24uCj4+Cj4+IFBsZWFzZSB0cnkgdGhlIGF0dGFjaGVkIHBhdGNoIGFuZCBsZXQgbWUg
a25vdyBpZiBpdCBmaXhlcyB0aGUgcHJvYmxlbS4KPj4KPj4gVGhhbmtzIGluIGFkdmFuY2UsCj4+
IENocmlzdGlhbi4KPgo+IFllcCwgdGhhdCBmaXhlZCBpdC7CoCAtcmM2PwoKSWYgSSBnZXQgYW4g
cmIgdG9kYXkgdGhlbiB5ZXMsIG90aGVyd2lzZSBpdCBtaWdodCBlbmQgdXAgaW4gLXJjNyBuZXh0
IHdlZWsuCgpBbnkgb2JqZWN0aW9uIGlmIEkgYWRkIGFuIFJlcG9ydGVkLWFuZC1UZXN0ZWQtYnk6
IE1hcmsgSG91bnNjaGVsbCAKPGRtYXJraEBjZmwucnIuY29tPiA/CgpUaGFua3MgZm9yIHRoZSBo
ZWxwLApDaHJpc3RpYW4uCgo+Cj4gVGhhbmtzCj4gTWFyawo+CgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpOb3V2ZWF1IG1haWxpbmcgbGlzdApOb3V2ZWF1
QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWls
bWFuL2xpc3RpbmZvL25vdXZlYXUK
