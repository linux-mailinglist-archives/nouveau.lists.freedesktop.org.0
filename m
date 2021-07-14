Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A4DF3C84F0
	for <lists+nouveau@lfdr.de>; Wed, 14 Jul 2021 15:02:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8656E6E288;
	Wed, 14 Jul 2021 13:02:30 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam07on2058.outbound.protection.outlook.com [40.107.95.58])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4793A6E284;
 Wed, 14 Jul 2021 13:02:29 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lke9raxVp7dFkSkQJ8X4+KBmzE6evDhoLGaZmkBCahXjKPsZtljqwptC326cLWh85iOFZaKh9xt/TBkt2jIGzUq6evVsJr6PQAvd9FM7jTXaoBKRTi7EuXOK/SWmerIo/Y/tMHE8QTC3YbGyr5z/I8wpLxtDpbYqJHT3uYFFdy2vvkEqedktgGW1uWN4ab+hq2dTqkXVZMfqB+zLAppx5Wjr9UNuPqAokvMYBnXf25kbBAys8uBiodXTAVdvoVe0/soLTchvxBjLFJn4xd8jF1OmpRXAGZlX7rBWa1sAAW18pKrHPN1WgZI2vd54K0uI+L6VpN74C8JwCKQOuEOofQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BNWAGlZc4AT89Geh4/FDb+TU4RQmdGGUEhprZygWLmU=;
 b=La7FC4s6/j3irsEXeDuGneiB5lLkDPIjXDgBlAFng5nspuXWipqiwHfs5T3A+hqaojZd1BttoT6Fy/tHO9La3wB6RrdHEYp9Z2XtMmP8X4bjOTl5AzjoN3tuZvGEOP1rwNFd476wutPaWNSxR91HQETmj8xtG85N6r/+RQgzT49V2G8eH0uGvB5qfHylg4oDeP5jirnZ6c9zZsva7bp1CYRwqVr8eD8x6ZGDx3omT+GYA4juOH/1PExugINc4QdgMFkyKHhlLKbYAYuaKGqcSwZSG9QPZJwTm+n+b7Whre8TNdRK/TjsEMIy8jxlX7lYnN0qSlQqP8b7M1NtpFQFdw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BNWAGlZc4AT89Geh4/FDb+TU4RQmdGGUEhprZygWLmU=;
 b=IUhVro7LagEde7BgyiYgW1r9vJ5XsFrk1OXjYL90XvF1fOxRSTNwqxc7Ap/UB2rAerUpA5Hw60MjCSW0ncnPtO5lqpztJp5ykiRm6TmevRHYgiJwIV+r5FmZ0nuAq0sF2zf3rU3ugqSnFlLokWqxvt2uv4GnQPSla8FxBFYMN/4=
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by MN2PR12MB4253.namprd12.prod.outlook.com (2603:10b6:208:1de::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4308.21; Wed, 14 Jul
 2021 13:02:26 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::6c9e:1e08:7617:f756]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::6c9e:1e08:7617:f756%5]) with mapi id 15.20.4308.027; Wed, 14 Jul 2021
 13:02:26 +0000
To: "Kirill A. Shutemov" <kirill@shutemov.name>, airlied@linux.ie,
 daniel@ffwll.ch
References: <YOC4uekpD7iA3xPi@Red> <1682547.0nLxAY2a9E@nvdebian>
 <dace0dea-7ca9-99cb-ad80-106824cb5e3f@amd.com>
 <20210714125652.eohw2s2pncplxovx@box.shutemov.name>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <8fd70eb5-7306-89a3-57f9-d633243c9df5@amd.com>
Date: Wed, 14 Jul 2021 15:02:21 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <20210714125652.eohw2s2pncplxovx@box.shutemov.name>
Content-Language: en-US
X-ClientProxiedBy: FR0P281CA0086.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1e::22) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:fe2b:fec6:eeb5:c7dc]
 (2a02:908:1252:fb60:fe2b:fec6:eeb5:c7dc) by
 FR0P281CA0086.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:1e::22) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4352.8 via Frontend Transport; Wed, 14 Jul 2021 13:02:25 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9409b8bf-a30d-423f-c6bd-08d946c7a121
X-MS-TrafficTypeDiagnostic: MN2PR12MB4253:
X-Microsoft-Antispam-PRVS: <MN2PR12MB42532A51C12DEB23903D9FD783139@MN2PR12MB4253.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1186;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: UGQMjTMocqoIux2OYkxmU2aZwAav8C0gkYUufNuSMqeDOF+BTPqs9gVs94QODhSrVkvCZIjnzv1lBwMhtFNjF1uXChIGyWSxNJznvds4aHXpA2j/WMp3M6dGzXVdDO6kV8/0tLk7CgdETsMymGsmnrvpwV1cxSbTfo5NSwd35r+IuSn3+8uPlKKCMaJNEwlNGwJ8dpWQHx7mQfZgC7wA/FtxCsGO4eO6xefBARzk2wOtMUPRG/j7nZSfYzWN32wYPrZnUnr705Iaago50h9kHzwuUwY0uffGqtCbH0ZrAU9oAg/yZos5eQGtWB5b3inSgUoMOOWATlf7vEKyit23KKpbRIdWjJJq61cazeoQ/k0qLpvRzDUhRAmtLMpH5UjiKOVoD1g/9z8wro2RUFiTb4OMFPcBh8r75pgskXW72q8u0Pa3wmJtxCgNZzBUSc46kEiWhSPOVOR87HjqVEs7LbqvzeiULLFBddtqZlUOIAYFo2SLOfM/eCyBu/q1pcD5Ne3054WUSO3KObc5gnTOkpCd5ZRMe9/EwP/a+ZuOkejFdri6pGMeIA7ubNpYJcUJM0sm4UXw3hu0Z/H3CR/SzvJvrilcc+E+ybLjpUgDShRQBRQA59wBez4+JHA5oOul9db5MrpuqNhZ+dVyJFGXZGaehfb8Rp+29Hqvgt3jhIc0CLM6fg4btA2k/87CS3RtL48zRvJ+4ABdsdOgmoQNdHSS7wfkX6+xtoutUf0PPBGSWNF3nrmX38Yvta+zCJTP
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(346002)(136003)(366004)(39860400002)(376002)(31696002)(2616005)(54906003)(316002)(8936002)(478600001)(6486002)(5660300002)(38100700002)(4326008)(8676002)(86362001)(66574015)(36756003)(66556008)(6666004)(66476007)(66946007)(186003)(31686004)(2906002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UlpJamptSjRPNjJDN0Fwb2Zra1VwVHdXZDNiNkh4ZC8wUnd4Tkk2c0VMTUk4?=
 =?utf-8?B?R0ZJWEt5MHdyS0ErdktscXR2SGVoRXlMREtJRTR2Mk9kMzF4K0V0NmRzN0Ft?=
 =?utf-8?B?QU9KYmFOVTR3VUVxTXRpTWJoZHhtR2pHcEp5WGdzSnJxTk5GMU9lYjZ6Lzlm?=
 =?utf-8?B?N1hqR1gvYktpM0JNU1JnSUdnYXdWOFdtM1VNbHROVTRobmFMNE5hbkV0ZGtG?=
 =?utf-8?B?dy9ZM1laUjN1MHhYNVl4eUJ3WDdCRklCV0tCQjFrNyt2SnJQeG5Ba2J6UXpE?=
 =?utf-8?B?akp0YkF3WEREcnBOSkpLRWQ5THpMWEFjcDZKUTNKYmNIRDBoTTR1TkpZV09x?=
 =?utf-8?B?NHluNWdaSnF6eWtJOGc2N1hNL3dCQXNqTU1nY1U0Nk5vT2JzZzlsRDNmdGFK?=
 =?utf-8?B?WlEvaUFvRjNwc0swMkZWQ3B5dnF6NEU0WndIa3JHdzBDbDUvY2s3a1cwOWFM?=
 =?utf-8?B?Wk9pZnBwZXBEVitycWNLQVYrcjR4SEorTlpnL1FlV3VPMzcwTUJpQjllbFhS?=
 =?utf-8?B?d0pMVkgrUHQyc3QrQ05FWVN3emJSd2IzQStiSStWVXFiSm9PSm95UFJTRk9y?=
 =?utf-8?B?YzBWZzQ5TWVUcG5lbHRWQitnd0dFZUFscTFUdW5VWWVUN1NQczNjR2tjcHgy?=
 =?utf-8?B?U3N0RWl6RnRKMVF1ZjVoY1dEM2hBcVVRQ0QvbkVxbzJDdFY3azdZSW5YTUZI?=
 =?utf-8?B?YzU1ODBEQUtPMDdCNjIwMGZHV1dqalJxTWpaNkkyRTJzOGlncHlOWGtvZFJs?=
 =?utf-8?B?cHE4NFA4aDRuRWtGR21aOFIwUm9sN1V0MkpFU0k1SGxnRUNNdFF3Tit2M3dQ?=
 =?utf-8?B?TzIrakZxMWIrUVVtQ2UwTEJlUVZrdzd3NGcybGtDS285Zk5oajF6RElhVWY5?=
 =?utf-8?B?VkRxMGx4WXNLaWdZOVlrUzRZc00vZTRIYnRZYXNLT3h3RlRZeHIyNGk4SThi?=
 =?utf-8?B?OEJQT3FBN2VSb3FZQUo0OWs5dVJNWlhpdWVXVHNzblRhWWF6YWVhdmEvRWxH?=
 =?utf-8?B?QjRLdDRtS2Z0L3BPMVVnM01FVDNsVUlLVWVwYVV0Mk9ZOFR1Tjlydjd0dE5C?=
 =?utf-8?B?UXN6THpTUkZYcENOZUFCSm0wVCtmR3ZVQmw3MllZT0M3L2R1MXFzb1R1LzFx?=
 =?utf-8?B?ejZzNnRiUmlOWjd2RmxXc2xubkE0TG5aczFNWm1sZkNmem9CYW5OazByeGt5?=
 =?utf-8?B?TzBpTUF3MGlxQ0ZtSUQ3aDRiM25FV01pMnMweURaRjdILzB1V2lOaE9WVW43?=
 =?utf-8?B?dUtzRGkzV0NRT0RDVWxwQXQybWtwWkVkMzJ2SCsrMDUvdjcrcUtpZmNWNFp1?=
 =?utf-8?B?T01nZTA0eGo3SVJrWmZubzhHcnZKVlEvcTRmQXdjRjFWaU9wRGNRWnJvYkxn?=
 =?utf-8?B?Y05GS3k2bERISVBsV0FpWnpuUlpWbjUxNTEzUnFsQW5DVGJtYjU2dTYxZmQy?=
 =?utf-8?B?NS94dWRERHVmK3IxUHN4QzJEaUVFZ0REbWFwM2xNSXRRREhDT0lEcmEyeFhY?=
 =?utf-8?B?TWs0RjJLSm1BYVpmbC82UnZUU2pUd2Myd2ljSDZ2ZGEzaWlvWGdmQlAvT3dv?=
 =?utf-8?B?Zk9JdU00eTJwR3htaU1wSWhHZzg4eTZwVmkyY0dGdFBxR1RreSs5cEMwd2xB?=
 =?utf-8?B?bFZHbDRjQ1dZSjN4UkJiVHBHMXlzVnVhMWhwbi9CcGxRMzJMSkRkVEdnM2ZI?=
 =?utf-8?B?SFU4aU1LL1gxUWhQYzNHNk8zVXJudklzTW5iZVJmZnQyam03RHhvL1ZZSjVu?=
 =?utf-8?B?YUlUYjM4Q0ZUZUpjUUtGTm1ORGE5TDRIWk4yOEtBNHpPVlFlWVhLZ3pZRUht?=
 =?utf-8?B?RUtIRG4vNVpMUStZcndaVmZFa3JXQWtJdWQzRnV4UGlIZXBGK0MzRTZJN1o0?=
 =?utf-8?Q?KdoNm7RTWFyDu?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9409b8bf-a30d-423f-c6bd-08d946c7a121
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jul 2021 13:02:26.7486 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: l8Lyl4w6pzJsbDqNrMQlVz3YG5p48AKwttPoWG4mO82+fAH9Edw2tKL+1N215Q3N
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4253
Subject: Re: [Nouveau] nouveau: failed to initialise sync
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
Cc: nouveau@lists.freedesktop.org, Alistair Popple <apopple@nvidia.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Corentin Labbe <clabbe.montjoie@gmail.com>, bskeggs@redhat.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

QW0gMTQuMDcuMjEgdW0gMTQ6NTYgc2NocmllYiBLaXJpbGwgQS4gU2h1dGVtb3Y6Cj4gT24gVHVl
LCBKdWwgMDYsIDIwMjEgYXQgMDg6NTg6MzdBTSArMDIwMCwgQ2hyaXN0aWFuIEvDtm5pZyB3cm90
ZToKPj4gSGkgZ3V5cywKPj4KPj4geWVzIG5vdXZlYXUgd2FzIHVzaW5nIHRoZSBzYW1lIGZ1bmN0
aW9uYWxpdHkgZm9yIGludGVybmFsIEJPcyB3aXRob3V0Cj4+IG5vdGljaW5nIGl0LiBUaGlzIGlz
IGZpeGVzIGJ5IHRoZSBmb2xsb3dpbmcgY29tbWl0Ogo+Pgo+PiBjb21taXQgZDA5ODc3NWVkNDQw
MjEyOTNiMTk2MmRlYTYxZWZiMTkyOTdiOGQwMgo+PiBBdXRob3I6IENocmlzdGlhbiBLw7ZuaWcg
PGNocmlzdGlhbi5rb2VuaWdAYW1kLmNvbT4KPj4gRGF0ZTrCoMKgIFdlZCBKdW4gOSAxOToyNTo1
NiAyMDIxICswMjAwCj4+Cj4+ICDCoMKgwqAgZHJtL25vdXZlYXU6IGluaXQgdGhlIGJhc2UgR0VN
IGZpZWxkcyBmb3IgaW50ZXJuYWwgQk9zCj4+Cj4+ICDCoMKgwqAgVFRNcyBidWZmZXIgb2JqZWN0
cyBhcmUgYmFzZWQgb24gR0VNIG9iamVjdHMgZm9yIHF1aXRlIGEgd2hpbGUKPj4gIMKgwqDCoCBh
bmQgcmVseSBvbiBpbml0aWFsaXppbmcgdGhvc2UgZmllbGRzIGJlZm9yZSBpbml0aWFsaXppbmcg
dGhlIFRUTSBCTy4KPj4KPj4gIMKgwqDCoCBOb3V2ZWF1IG5vdyBkb2Vzbid0IGluaXQgdGhlIEdF
TSBvYmplY3QgZm9yIGludGVybmFsbHkgYWxsb2NhdGVkIEJPcywKPj4gIMKgwqDCoCBzbyBtYWtl
IHN1cmUgdGhhdCB3ZSBhdCBsZWFzdCBpbml0aWFsaXplIHNvbWUgbmVjZXNzYXJ5IGZpZWxkcy4K
Pj4KPj4gQ291bGQgYmUgdGhhdCB0aGUgcGF0Y2ggbmVlZHMgdG8gYmUgc2VuZCB0byBzdGFibGUg
YXMgd2VsbC4KPiBUaGUgcmVncmVzc2lvbiBpcyBwcmVzZW50IGluIHY1LjE0LXJjMS4gQW55IGlk
ZWEgd2hlbiBpdCB3aWxsIGhpdAo+IHVwc3RyZWFtPyBJIGRvbid0IHNlZSBpdCBiZWluZyBhcHBs
aWVkIHRvIGRybT1uZXh0LgoKV2VsbCB0aGF0IHF1ZXN0aW9uIG5lZWRzIHRvIGFuc3dlciBEYXZl
IG9yIHNvbWVib2R5IGVsc2UgZnJvbSB0aGUgCmRybS1taXNjIG1haW50YWluZXIgdGVhbS4KClRo
aXMgZml4IHRvZ2V0aGVyIHdpdGggc29tZSBvdGhlcnMgYXJlIGFscmVhZHkgaW4gZHJtLW1pc2Mt
bmV4dC1maXhlcyAKd2FpdGluZyB0byBiZSBwdXNoZWQgdXBzdHJlYW0sIGJ1dCBpdCBsb29rcyBs
aWtlIHRoYXQgaGFzbid0IGhhcHBlbmVkIHlldC4KCkV2ZW4gTGludXMgYWxyZWFkeSBwaW5nZWQg
bWUgd2hlcmUgdGhlIGZpeCBmb3IgcXhsIGdvdCBzdHVjay4KClJlZ2FyZHMsCkNocmlzdGlhbi4K
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==
