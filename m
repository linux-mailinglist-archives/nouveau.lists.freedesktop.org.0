Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A7B02C538F
	for <lists+nouveau@lfdr.de>; Thu, 26 Nov 2020 13:06:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7ED3D6E8CF;
	Thu, 26 Nov 2020 12:06:06 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2048.outbound.protection.outlook.com [40.107.244.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9390C6E8CF
 for <nouveau@lists.freedesktop.org>; Thu, 26 Nov 2020 12:06:05 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZdCJHOAlg4oZmv97fKTvv5e91H5W54WQql/BGOQEXWHJD5i6qPh7MtQMb+EdlaJrAwVLVM8zTS4vrWqZXUf9p5NaxliCkRoJZRe3NEPKgJ5Fm4FiVf+8GZSz+bgur9l9S+z7h+anqMCxvkjT2I2qHI+yIwgGPjW8lnJQPBxpIV/6dvAIzZQwy94nxhK6UeBwf8BWY1+t8GSW7MKFqDdG8hsMvwiIDNuhBvlAi6e/tg2pn5qveUtB5ydFNwve35N12alIIwUkOXML2VFfjX75EoeRNUokeZX5XUhDWlIsgMMyzePdIORBOiNX7SAfLWgGD7yrhRh1ldL5Y1lYbj61sg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=s0BY2DUZYsVeyOs6rhEOKBdaUYkA/csEFX/Pud/sNLc=;
 b=bOLdrlmSlQE3nIxOBtCGfN3Qt25qyPH/Go+ZDW5BFAfUtnHOQskGTaJnJJ1quld8BV8M8StoycInyavolAUqA2CtTJXCXsJXOyfwmdrsJhNXgn0GLu8GiXiPLF/ah5xyNqjiGBPT1ZqC/seg85o00h0DC0/k/8RAmG7h8byokwVqYwjNYb4B6n/mcgwMt9qGBdeUwDhLDUijhIv6BQkr5JHTJujnEw/QowH127jsa9RPBI5e6luBUHeHkVmvBIykGONxPHGnynRV9A/yOw3NOKW+d/EnCuOdQbM0dVxkpW9JdptZzqYK+LDeB7/Dwqx0zqylPKURFGbRQ9eR4q6S7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=s0BY2DUZYsVeyOs6rhEOKBdaUYkA/csEFX/Pud/sNLc=;
 b=Ntd5X81k/Mduwz5+arTBdBGlPmvb5Vc5W8+PMeukST/6cuu2xXsdDuueLpA9TxqAegc7wUjDh4p06LTkhXwqdqkq5JC2kYcGrpGS8Wyj739pCnA6dR9WFgdt/uc4MOxW51S0bLvOd077CxFl/m2z0H8TeYwMPoQbtYmBROZG58c=
Authentication-Results: cfl.rr.com; dkim=none (message not signed)
 header.d=none;cfl.rr.com; dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by MN2PR12MB4094.namprd12.prod.outlook.com (2603:10b6:208:15f::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3611.22; Thu, 26 Nov
 2020 12:06:01 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::1ccc:8a9a:45d3:dd31]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::1ccc:8a9a:45d3:dd31%7]) with mapi id 15.20.3589.032; Thu, 26 Nov 2020
 12:06:01 +0000
To: markh@compro.net, nouveau@lists.freedesktop.org
References: <db0e5f78-8271-24b5-62f6-5473f69ac8d6@compro.net>
 <c2ee46af-79a8-9a07-b12d-b755017ee500@amd.com>
 <aa4e3741-b1b2-4ae2-6b35-880b40c985c8@compro.net>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <e84a7564-921c-d852-b62d-80563bea99b1@amd.com>
Date: Thu, 26 Nov 2020 13:05:56 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <aa4e3741-b1b2-4ae2-6b35-880b40c985c8@compro.net>
Content-Language: en-US
X-Originating-IP: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
X-ClientProxiedBy: AM0PR01CA0134.eurprd01.prod.exchangelabs.com
 (2603:10a6:208:168::39) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
 (2a02:908:1252:fb60:be8a:bd56:1f94:86e7) by
 AM0PR01CA0134.eurprd01.prod.exchangelabs.com (2603:10a6:208:168::39) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3611.20 via Frontend
 Transport; Thu, 26 Nov 2020 12:06:00 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 3bd34c0a-eeb2-489d-00ea-08d89203a470
X-MS-TrafficTypeDiagnostic: MN2PR12MB4094:
X-Microsoft-Antispam-PRVS: <MN2PR12MB40940D2D74F5C2A3648A395F83F90@MN2PR12MB4094.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Q6t2Z4O4S178LKFaMgih0UPfjO8PYvW8tJXcW2kX6iN4kS6xbcFnbmnrjblAHuY7g++UgPm0WPXMC+i/zx0/bdhQ3vuG1zgm+UQskdBvpud5wT/ygqc828YmiT1qMolLXULF6qydgDITg1qtt4jyywWjcHEDNREVrGrdjger+797cSPaqnRAqWNfGXQZrEP4YVetN56dzNS7jOuO4gAnmU0dXWalenohi9PyUcIfMQ8YRtmSbaMoUFv82rMb/e2ZeBxov/coyWrchNFzmII0r1nHDWTURKNfvIUfeRr0YMxufEgOzAusnrjCtw3vkolSvWQhYbtP/p0+onHuZjhKkwdiccZGEzaIiZwDNJUvBieDQ+UxJTJJgGRFwAP3tkv6
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(396003)(376002)(136003)(346002)(39860400002)(31686004)(2616005)(316002)(31696002)(52116002)(6666004)(53546011)(8936002)(478600001)(36756003)(6486002)(5660300002)(8676002)(186003)(86362001)(16526019)(66946007)(2906002)(83380400001)(4326008)(66476007)(66556008)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?cEEwR2FTdzNIVGJSaU9seG0rUTd5YVBkSVhLV0FZVGVNWnVoNFB4L1VLczds?=
 =?utf-8?B?YUlJMnpZVEliU2hkRGh6YjNoN2lCMjNuYi9RZHF2RCs3Q3JEbGJxdmFNdVBE?=
 =?utf-8?B?bzZad2R3bEhzeXhVeUR5YWNYRGZDaEY4WGszZG1KK0lnRDlWVC95ZWdlRmEw?=
 =?utf-8?B?NEQyQlppcWZpdWNqcStpMHpEVVNreWZxdWw2emptcUlMbUlYQ2xTR2RQbTZP?=
 =?utf-8?B?MkU4Mm5VWVdWNUREdUl3VzU3Q1VnbThSemVlYXB6c0ZuTnlVVzViSE5jRTFP?=
 =?utf-8?B?UW83d3FNTERDTEt2OVB0MlZSaXlhOE5GUUhnSk5BZzJtdU93UThtM1BjQkJR?=
 =?utf-8?B?Q01Xd0hBZ0hTS0lQazN4dWh5RjBQQXF3b2RqdVluTHNmbHMzRkZPMkVqZTRW?=
 =?utf-8?B?U2s1QlZua2QxN2VZYzduNFFHdlhRWSt3T3lLVXd1b051d0RkbkVZdk8xdzN6?=
 =?utf-8?B?TEszT3ExdnRNU2l1R2lJcUsvcG1Odjh5dFY5SXdyWnBIZjh1NzYrYkJpWUg2?=
 =?utf-8?B?b3dqQ0JCR2s3QWJDVmsxeEJSMjdBdzVnZFBiVnY0dkxoTURrS3M2TG9MdFhj?=
 =?utf-8?B?T2pETGo0THMydzZrNGcwMFFYdFJlZG9WUHlhemJxbmgyZFlQRmtFYTltdFZB?=
 =?utf-8?B?WUwxVUIwTmMrSkgzQVJwWDlGL2EraFJuZ3BibTZYMmpZSmE4OVZuaGZhT0o0?=
 =?utf-8?B?VjVFSDJDaitQQWE3dVFqUzMxR01EM3N6S3dLSmZNUzRPdWk5U1BPMStGN1l2?=
 =?utf-8?B?Ym1DMkFXSkd1N25qV0l5VTBqdHF6eVFISDVyUnd5RFJGT2pra2Ryd2RyWmZQ?=
 =?utf-8?B?dmlSR0JRTk1lVkM3dVZwWElvNmtIMnhIMEpVTTlJbXh3WTFYRDgxdHk2WGFC?=
 =?utf-8?B?QTFSUmYycFp4TjZwTExJcDBXQkZvbEtEc25qVnVWZE80SzhESDJoRnFWa1g5?=
 =?utf-8?B?R1BYWlR5VnNLUk83TEpYRDVWVXZ6NDgyQnJpdkw1dkQ5cXRmYjVjM0NtZzV0?=
 =?utf-8?B?ZmJtWm5zRlpmUHlHTUNSMCtteWs1Z0lvWEs5WTZsc0lDcUdYekVJUkdvWkxS?=
 =?utf-8?B?QlZZTWcybXhRWlN1bGpZdHZZRkdPSDVJTy9MODBkY0NWbXRac05KZXNjSm1q?=
 =?utf-8?B?eDYyRkRMbCt0OWN4VGhyQ2hhRlhHbEpiWThtYmN4S1ZoeXlGMlJ1VFhlV240?=
 =?utf-8?B?cml0bkI3dkVUeW1OWUtnV2ZUUENjc3oyQ0lNNVhCK3N5T250VWgxS1JDYnVk?=
 =?utf-8?B?d1oveUV5N0FYK2krenpOWWgzRmpWdlBycUE4NWV6c0trUlEvOU13Zmp5cjJF?=
 =?utf-8?B?V3Y3OVJFeTdPN1FCTGdqbGV1VDduQzYxY25jNGs5bUtFaURsODhabDJiNXQz?=
 =?utf-8?B?TERaTXd2UTBKRXlEc2djQUduQ1Q1d2FmZmhuRG1hOStVZzN0dUU4UmxoQjQz?=
 =?utf-8?Q?ptnzs2Nm?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3bd34c0a-eeb2-489d-00ea-08d89203a470
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Nov 2020 12:06:01.6894 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WkTa937+DljrWHghNSlQB3Re8rM4yr1g7Z4W/SNfwCp5GJ9J9EMKI1OyWKFnUMlF
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4094
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
Cc: Mark Hounschell <dmarkh@cfl.rr.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

SGkgTWFyaywKCkFtIDI2LjExLjIwIHVtIDEwOjU5IHNjaHJpZWIgTWFyayBIb3Vuc2NoZWxsOgo+
IE9uIDExLzI2LzIwIDM6MzUgQU0sIENocmlzdGlhbiBLw7ZuaWcgd3JvdGU6Cj4+PiBJJ20gcnVu
bmluZyBhbiBvbGRlciAiTlZJRElBIENvcnBvcmF0aW9uIEc3MCBbR2VGb3JjZSA3ODAwIEdUXSAo
cmV2IAo+Pj4gYTEpIiBjYXJkIGluIGEgbmV3ZXIgQklPU1RBUiBCNTUwR1RBIE1CLiBLZXJuZWwg
NS4xMC1yY3ggZG9lcyBub3QgCj4+PiB3b3JrLiBJIGdldCBubyB2aXJ0dWFsIGNvbnNvbGVzIG9y
IFggc2NyZWVuLgoKdGhhbmtzIGZvciB0aGUgZG1lc2cuCgpQcm9ibGVtIGlzIEkgZG9uJ3QgaGF2
ZSB0aGUgc2xpZ2h0ZXN0IGlkZWEgd2hhdCdzIGdvaW5nIHdyb25nIGhlcmUgOikKClRoZSBjb2Rl
IHNob3VsZCBiZSBmdW5jdGlvbmFsIGlkZW50aWNhbCwgaXQgd2FzIGp1c3QgbW92ZWQgZnJvbSBU
VE0gdG8gCm5vdXZlYXUsIHNvIHdlIGFyZSBtaXNzaW5nIHNvbWUgZGV0YWlsIGluIHRoZSBoYW5k
bGluZy4KCkNhbiB5b3UgcnVuIHRoZSBmb2xsb3dpbmcgdGVzdCBmb3IgbWU6IEZpcnN0IHlvdSBu
ZWVkIHRvIGRpc2FibGUgbG9hZGluZyAKb2YgdGhlIG5vdXZlYXUga2VybmVsIG1vZHVsZSBieSBh
ZGRpbmcgbW9kcHJvYmUuYmxhY2tsaXN0PW5vdXZlYXUgdG8gdGhlIAprZXJuZWwgY29tbWFuZCBs
aW5lLgoKVGhlbiBsb2cgaW50byB0aGUgc3lzdGVtIG92ZXIgdGhlIG5ldHdvcmsgYW5kIHJ1biB0
aGUgZm9sbG93aW5nIGNvbW1hbmRzOgoKc3VkbyBtb2Rwcm9iZSB0dG0Kc3VkbyBiYXNoIC1jICJl
Y2hvICd0dG1fYm9fa21hcCcgPiAKL3N5cy9rZXJuZWwvZGVidWcvdHJhY2luZy9zZXRfZ3JhcGhf
ZnVuY3Rpb24iCnN1ZG8gYmFzaCAtYyAiZWNobyBmdW5jdGlvbl9ncmFwaCA+IAovc3lzL2tlcm5l
bC9kZWJ1Zy90cmFjaW5nL2N1cnJlbnRfdHJhY2VyIgpzdWRvIG1vZHByb2JlIG5vdXZlYXUKc3Vk
byBiYXNoIC1jICJjYXQgL3N5cy9rZXJuZWwvZGVidWcvdHJhY2luZy90cmFjZSIgPiB0cmFjZS5s
b2cKClBsZWFzZSB0aGVuIHNlbmQgbWUgdGhlIHJlc3VsdGluZyB0cmFjZS5sb2cgZmlsZSBzbyB0
aGF0IEkgY2FuIAppbnZlc3RpZ2F0ZSB3aHkgbWFwcGluZyB0aGUgZnJhbWVidWZmZXIgZmFpbHMg
ZHVyaW5nIGRyaXZlciBsb2FkLgoKVGhhbmtzIGluIGFkdmFuY2UsCkNocmlzdGlhbi4KX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBtYWlsaW5n
IGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVz
a3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==
