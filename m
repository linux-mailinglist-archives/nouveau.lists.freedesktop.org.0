Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id ECD0F3A193E
	for <lists+nouveau@lfdr.de>; Wed,  9 Jun 2021 17:22:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E4376E5BF;
	Wed,  9 Jun 2021 15:22:07 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2070.outbound.protection.outlook.com [40.107.236.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF1DD6E519;
 Wed,  9 Jun 2021 15:22:05 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jGGKIW6iF1bhEyQV+HXFII+mZf8BZq8G8plMWDQ/fV7X2ieDamoEBBEm0aA0SMw81FO7hY9ROPR67QL7/+mmtKdU0YYVRYm9OgrarsRZ3n6ylIuk5Gr2UkOw5aI32ZdMYqXZO100zQKfXLBXD0If7zMCWhToeGRXExdKd0F5uZOrOjQP2KH4glktJPIyB/eeux1+FfIhvLZowQBQw1lrN3l7yOwNZkNjh6rd46+JawIBwtDtQ1fSuZNhFiHLmG2OQymyC8NeDgNsBmr5P7RmYrHX/tHRThKko3hV/lJXyYCvtweYgYxR0HrRTJJUwxYvEJc5/RCnUfvPao1UBMBy/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XPYo3SYryshXFR1+ZCxlT7E93wvokAIMWZIFKmFrRSY=;
 b=DtzTOrep3h4QbbW77UbqFyorfi0rUblLhfnY+VXZ55QbO6O6bck1Ri7qGu1tG3g4NENfo2HIhrLiCze4wuOPySe0LLbbNzuILt9J1rKib/68B2AU+U4YvwJiqVneqLDsg6qrrleqJwl3D4Xgy5S5qps35IrorQM0zuTGkBk/xlRmBQb+f9t4iX+w8HyaGgkhiBJ7lnc5xpHIZiDV0POHQdx5sck1jjPaVT6ttlEJzBp95GYsmxjiXGj+KRnrdpevRGw7sfDQYNyXWIz3ei8pCbXearqoMPtL073WuXo4hByxqXj93OfHLCHaiT+wNtBmXRf7iKcLoSNRRkEHHEE+iQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XPYo3SYryshXFR1+ZCxlT7E93wvokAIMWZIFKmFrRSY=;
 b=jkr0Lf5w5Q/gc1Dm1HozJbqsDZSg/XBZ0O2C6pRSG/qnefau8tbVt+udrb3lMO8KDi6w+tPHGlKeIJlaIminsIAZ5G7qB4SkzvdIqdruDNbmgd5/kjqZqrmEXSpry5gSb8AixAMCbW0aM4V/SGfPbHw9vD/CtyZ66bvijvPlPwI=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by BL0PR12MB2451.namprd12.prod.outlook.com (2603:10b6:207:4e::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4195.20; Wed, 9 Jun
 2021 15:22:04 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::6c9e:1e08:7617:f756]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::6c9e:1e08:7617:f756%5]) with mapi id 15.20.4219.022; Wed, 9 Jun 2021
 15:22:04 +0000
To: Ilia Mirkin <imirkin@alum.mit.edu>
References: <2e4987b0-7fc9-d217-450c-943de430dbd1@kapsi.fi>
 <816b619b-ff20-009a-ea05-504497c1946b@amd.com>
 <CAKb7UvjrxXyvr9qpLbkoDQ2eScj4YdayP6OnG8rZnmEn1hyKvw@mail.gmail.com>
 <1c9bdd1b-abea-872c-e23a-8a0e1e777a02@amd.com>
 <CAKb7UvhX9mABdtOnq5Uu4zmKW6HLaJzfFakcXVB008U4hRsgng@mail.gmail.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <367d42e1-eb7f-3dba-f33c-1fa0e555eebd@amd.com>
Date: Wed, 9 Jun 2021 17:21:59 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
In-Reply-To: <CAKb7UvhX9mABdtOnq5Uu4zmKW6HLaJzfFakcXVB008U4hRsgng@mail.gmail.com>
Content-Language: en-US
X-Originating-IP: [2a02:908:1252:fb60:3e79:91ff:ea38:2624]
X-ClientProxiedBy: FR0P281CA0053.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:48::17) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:3e79:91ff:ea38:2624]
 (2a02:908:1252:fb60:3e79:91ff:ea38:2624) by
 FR0P281CA0053.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:48::17) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4219.12 via Frontend Transport; Wed, 9 Jun 2021 15:22:02 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6beec4c8-5cf8-4bdb-4f5f-08d92b5a55d1
X-MS-TrafficTypeDiagnostic: BL0PR12MB2451:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BL0PR12MB245167985EE3A30BC084562883369@BL0PR12MB2451.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1303;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 2GYEGohwZw5sI8SABgpFk8XNyF3qw3P2uOe+gHt3/buVmalWxNPZYF/KsXx3aJY2LIO8iczbJ+YOiQoaYyF/8xMN5W1BV9NALnAGgH0DplSqxsw0BASyPKuZB23UcNhK51p0NCP56T+EreZT3Ubw45ojE736C3g9HIe5/b2a+tw0HTkY67u49wSgjJdigNeaQU/+Ex8ALPlP21YYZHTewFUQ6nA3NJcw4rNMy1bgKuOJ9k90WGIpDwpt6+lhh2Fzkn5yyf6JxjX3bbiEcpmGpWXlN3Fdrcb8sTimkUyAdvjA+fDv6FJvHb9te3tnTUbI5kVQGR3tT/oLgATz1pAvoSSXtlkiTtFwh8inqSpdjkv+xcW89oRkNKoUFKdDuGvcP7R/LDBJbNZ0sE5ixWGInpx9P151CB/hP64BPU3BcY7fRfOu1tMO4Y0h8Exp4Xewirke4PLprY5/OyzRZpoqFmGdIsYn8+fOqDX6XVedpGvootuEFyS9Tw6VdJ6spdySgvW9RcbJKFdVzxr1NCatrxa4GUbAfIVrqecUryTgdoPzR2WK1VKT4EbsV+uW+qiwPwtWBbaBQg5BFNhqk++jSfvHEYfRzybzXECT6Hisugfyw70nF/bmvO/oqiJqU0vnkgZsxg6HY9lPGwHq28HUuG2Y+FmcYpxnzSAoe3F+8rfwGc6VDBbAO3MU5ZQagqOIFa9hh4oRhTCWCf5ncI+FXOeklVQtES7+hsWxEBycsc8=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(346002)(39860400002)(396003)(376002)(366004)(966005)(478600001)(31686004)(38100700002)(54906003)(45080400002)(5660300002)(53546011)(2906002)(6916009)(6666004)(8676002)(66476007)(4326008)(8936002)(2616005)(66556008)(66946007)(6486002)(83380400001)(16526019)(31696002)(186003)(86362001)(36756003)(66574015)(316002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?d0U5VEtuQUNicHQzVWUzTVl3NG9VM2Uyamx2T1BhVnoyK2Y2K3QyMVFwMWkv?=
 =?utf-8?B?SHJORjBnNlpRNkdETlBBVE00TWJWZ3V2K2MzRDlDOERjUVZrTkkwQlMxSGRT?=
 =?utf-8?B?MzN4Z0kzWkt4SFFuSmYwcHhwbHY3S0VrN3U4dzFoRnRpYkdnK2R0dFFvSmUz?=
 =?utf-8?B?MnZXMDZ3TFA0Smd6cmszWXI1NzNrN1Z0ZVljc3N4RitsS1h1bXNZUFBnNnQx?=
 =?utf-8?B?Q0x4aHdpU2Q2WDFSYXVXSDZVZXhralFvR2lMZVZ3VE9uN1hyWVkwV1F1b05q?=
 =?utf-8?B?TkJvdUd0S2pWT1BmRm95NDNnekJzYTlaNXlPTUkyazdmcW5jQjRDa2xiRlBn?=
 =?utf-8?B?Ums4NU4wSVBxdW53ZUtETVhEUUtzWlN3YkVkbG9sNkFlQkRXMmcxa1RaVGZu?=
 =?utf-8?B?bEowVDh3bzJQY1BFUVNEa21WSVZIVnVNVHlzS3VOQzV6M1VDR0VVVlBUU2NN?=
 =?utf-8?B?YWFNUVVuZ05sZ1QvUGdSck1PbHkvdWdZNDIrM0s4NmtQMWtDWlhSSFJEeXdX?=
 =?utf-8?B?Sy9mUGUvd2I5N3M2NlBVbWlUUEt4aVdlQ3hIMm1ZeHFYZEVCTnZlM1RhN2d6?=
 =?utf-8?B?b2FRMkdXSGpNbEZpSTcvWmQxUXdPeW00ZHUxYmhRODFuL1h3RkpTRkFncm44?=
 =?utf-8?B?cjZuRmw5RmVCYW9CRlBCWXlXL0xDU2ZiZ3RJWWkwZEFGNnRKOGR3WEtUczUx?=
 =?utf-8?B?OGs5TTBoa0xuNjZrYWhTVGpxVHU4UUtlU29tMU9hVXFnYzltOU1TcFVUa2hE?=
 =?utf-8?B?VGV6TDNlNlU1NWpacThVN0g0VU5nOE1zS2trWTZycHNxMjJobG5jOHNHOHZO?=
 =?utf-8?B?OUZxREhHbVlJT1Y4RkhUSk02UFg0RFcxb01iNnR0T3VUWGNMb2NhY1BXSDNx?=
 =?utf-8?B?YVZ3WUFnTHhpMWROOXRxdXYyWGttMk01VGVqVTBJVXlZL21STkJEVkZrOC95?=
 =?utf-8?B?ZFRnYkVNTEwwODJCVENSNWhmSkIrdmNRVEF4Z3NUTGUycUlOMkhuMjk1YWlB?=
 =?utf-8?B?WWZucEFnWEFIb082V3FWMjZ2dEp0TUVhQUdnT3FtdnUvZWJxbnVDekgxRG42?=
 =?utf-8?B?RWR5T0o0Sk1nMFFJNDJSbWMrS00zOVBnQXgxaEM3L1o4dlBBaEhtVkJORzZr?=
 =?utf-8?B?ZmErMWhmSWJWeFFIOVdZUEUzc3F5VmNXUG1iVCs5bE1za0lBaGVXTjV3dWZ3?=
 =?utf-8?B?ZnFEQWM2WXpFNE5IWE1hMjRsa2VNWXV1eDdhSkhONFZ3bVNGTmNETEFCTXA1?=
 =?utf-8?B?MUcxRUlnU2JLZW1MK2cwbDBzbk44ZVBuYytmRC9lejJrSUhxNDVkVTNSUzZL?=
 =?utf-8?B?S2ZubjFrUXduK3R2OVpBbFVsTkY0S2tNaHlqYkRSMmNua2pFd3B2ODVIV2xw?=
 =?utf-8?B?MW5NdHUyYnF4R0ttUTQ3Y0lWL0Q3RnNoS0VFbmJScUlzVjUyWXVzU3owUWYv?=
 =?utf-8?B?dUlHT1NYNENEYW41N3d6Q1U5QmlkTnlvWkpZcVRpRyt6TjlOaGNST2RXbUsw?=
 =?utf-8?B?Q1BCdjA0Wi9LZVNZZldGQnhxNnFzK0dLY0lYVDhRQTZxV0UzZlVQYVc2azYz?=
 =?utf-8?B?K2hCdjNqWnVubFFQeldCb09BNTlKcTFNZ1A2U1hBL2xNS3lKK01rMlh2T05x?=
 =?utf-8?B?MURwWHRHVFZkT0hOUzd0MFJLNmVrWjU4c0lodDExcVh1QjAyUGF6aVdZNXc4?=
 =?utf-8?B?VjAzRGZlY25SckxhMzZEanIzWnN3RDRrZnJzWEdqOGdPM1RFQnRxbmIvbFBi?=
 =?utf-8?B?K3lYd2poaEE4OFNvd20xT2xUQndzS21ESDhFallnUEdDck8yc3hHUjVBMlgy?=
 =?utf-8?B?d0JGY2pDOXZvWlB6bXVjcXZNOFhqOGtZeXB3VnlnaHNMUXdrNUEvWDF6OG5Z?=
 =?utf-8?Q?P9amSjhveRM2k?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6beec4c8-5cf8-4bdb-4f5f-08d92b5a55d1
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2021 15:22:03.9315 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VdxRVSOP6PCrohQ0dUb+xGzxrodelJO3hda1eCGU2xZlSQ0vUPdanRRGZ3hRE4rV
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB2451
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
Cc: nouveau <nouveau@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, ray.huang@amd.com,
 matthew.auld@intel.com, linux-tegra <linux-tegra@vger.kernel.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

WWVhaCwgZXhhY3RseSB0aGF0J3MgdGhlIHJvb3QgY2F1c2Ugb2YgdGhlIHByb2JsZW0uCgpHRU0g
b2JqZWN0cyBhcmUgdGhlIGJhc2UgY2xhc3MgZm9yIFRUTSBCT3MgZm9yIHF1aXRlIGEgd2hpbGUg
bm93LgoKU28gd2UgYXQgbGVhc3QgbmVlZCB0byBpbml0aWFsaXplIHRoZW0gb3Igb3RoZXJ3aXNl
IGF0IGxlYXN0IHRoZSBzaXplIG9mIAp0aGUgb2JqZWN0IGlzIG5vdCBhdmFpbGFibGUuCgpHb2lu
ZyB0byBzZW5kIGEgZml4IGluIGEgZmV3IG1pbnV0ZXMuCgpUaGFua3MsCkNocmlzdGlhbi4KCkFt
IDA5LjA2LjIxIHVtIDE3OjEzIHNjaHJpZWIgSWxpYSBNaXJraW46Cj4gR0VNIGluaXQgaGFwcGVu
cyBoZXJlOgo+Cj4gaHR0cHM6Ly9uYW0xMS5zYWZlbGlua3MucHJvdGVjdGlvbi5vdXRsb29rLmNv
bS8/dXJsPWh0dHBzJTNBJTJGJTJGY2dpdC5mcmVlZGVza3RvcC5vcmclMkZkcm0lMkZkcm0lMkZ0
cmVlJTJGZHJpdmVycyUyRmdwdSUyRmRybSUyRm5vdXZlYXUlMkZub3V2ZWF1X2dlbS5jJTIzbjIy
MSZhbXA7ZGF0YT0wNCU3QzAxJTdDY2hyaXN0aWFuLmtvZW5pZyU0MGFtZC5jb20lN0MyMjg3ODhi
MWM4NTI0ZmE4MTI4YjA4ZDkyYjU5MWI4MSU3QzNkZDg5NjFmZTQ4ODRlNjA4ZTExYTgyZDk5NGUx
ODNkJTdDMCU3QzAlN0M2Mzc1ODg0ODM5ODM5MTkxNDclN0NVbmtub3duJTdDVFdGcGJHWnNiM2Q4
ZXlKV0lqb2lNQzR3TGpBd01EQWlMQ0pRSWpvaVYybHVNeklpTENKQlRpSTZJazFoYVd3aUxDSlhW
Q0k2TW4wJTNEJTdDMzAwMCZhbXA7c2RhdGE9ZiUyQkZGblBFQUVvZXVEOGJLdG5HdEw1WlUwSEJZ
cEpBanFLcUQyOVhuOUt3JTNEJmFtcDtyZXNlcnZlZD0wCj4KPiBOb3RlIHRoZSBibyBhbGxvYyAv
IGdlbSBpbml0IC8gYm8gaW5pdCBkYW5jZS4KPgo+IEkgZG9uJ3QgdGhpbmsgdGhlcmUgaXMgYSBH
RU0gb2JqZWN0IGZvciBpbnRlcm5hbCBhbGxvY2F0aW9ucyBhdCBhbGwgLS0KPiB3ZSBqdXN0IGFs
bG9jYXRlIGJvJ3MgZGlyZWN0bHkgYW5kIHRoYXQncyBpdC4gUGVyaGFwcyB5b3UgbWVhbnQKPiBz
b21ldGhpbmcgZWxzZT8gSSB0aG91Z2h0IEdFTSB3YXMgbWVhbnQgZm9yIGV4dGVybmFsbHktYXZh
aWxhYmxlCj4gb2JqZWN0cy4KPgo+IENoZWVycywKPgo+ICAgIC1pbGlhCj4KPiBPbiBXZWQsIEp1
biA5LCAyMDIxIGF0IDEwOjU4IEFNIENocmlzdGlhbiBLw7ZuaWcKPiA8Y2hyaXN0aWFuLmtvZW5p
Z0BhbWQuY29tPiB3cm90ZToKPj4gR29vZCBwb2ludCwgYnV0IEkgdGhpbmsgdGhhdCBpcyB1bnJl
bGF0ZWQuCj4+Cj4+IE15IHN1c3BpY2lvbiBpcyByYXRoZXIgdGhhdCBub3V2ZWF1IGlzIG5vdCBp
bml0aWFsaXppbmcgdGhlIHVuZGVybHlpbmcKPj4gR0VNIG9iamVjdCBmb3IgaW50ZXJuYWwgYWxs
b2NhdGlvbnMuCj4+Cj4+IFNvIHdoYXQgaGFwcGVucyBpcyB0aGUgc2FtZSBhcyBvbiBWTVdHRlgg
dGhhdCBUVE0gZG9lc24ndCBrbm93IGFueXRoaW5nCj4+IGFib3V0IHRoZSBzaXplIHRvIG9mIHRo
ZSBCTyByZXN1bHRpbmcgaW4gYSBrbWFsbG9jKCkgd2l0aCBhIHJhbmRvbSB2YWx1ZQo+PiBhbmQg
ZXZlbnR1YWxseSAtRU5PTUVNLgo+Pgo+PiBHb29kIG5ld3MgaXMgdGhhdCBJIGNhbiByZXByb2R1
Y2UgaXQsIHNvIGdvaW5nIHRvIGxvb2sgaW50byB0aGF0IGxhdGVyCj4+IHRvZGF5Lgo+Pgo+PiBS
ZWdhcmRzLAo+PiBDaHJpc3RpYW4uCj4+Cj4+IEFtIDA5LjA2LjIxIHVtIDE2OjUyIHNjaHJpZWIg
SWxpYSBNaXJraW46Cj4+PiBDaHJpc3RpYW4gLSBwb3RlbnRpYWxseSByZWxldmFudCBpcyB0aGF0
IFRlZ3JhIGRvZXNuJ3QgaGF2ZSBWUkFNIGF0Cj4+PiBhbGwgLS0gYWxsIEdUVCAob3IgR0FSVCBv
ciB3aGF0ZXZlciBpdCdzIGNhbGxlZCBub3dhZGF5cykuIE5vCj4+PiBmYWtlL3N0b2xlbiBWUkFN
Lgo+Pj4KPj4+IENoZWVycywKPj4+Cj4+PiAgICAgLWlsaWEKPj4+Cj4+PiBPbiBXZWQsIEp1biA5
LCAyMDIxIGF0IDEwOjE4IEFNIENocmlzdGlhbiBLw7ZuaWcKPj4+IDxjaHJpc3RpYW4ua29lbmln
QGFtZC5jb20+IHdyb3RlOgo+Pj4+IEhpIE1pa2tvLAo+Pj4+Cj4+Pj4gc3RyYW5nZSBzb3VuZHMg
bGlrZSBOb3V2ZWF1IHdhcyBzb21laG93IGFsc28gdXNpbmcgdGhlIEdFTSB3b3JrYXJvdW5kCj4+
Pj4gZm9yIFZNV0dGWCBhcyB3ZWxsLgo+Pj4+Cj4+Pj4gQnV0IC0xMiBtZWFucyAtRU5PTUVNIHdo
aWNoIGRvZXNuJ3QgZml0cyBpbnRvIHRoZSBwaWN0dXJlLgo+Pj4+Cj4+Pj4gSSB3aWxsIHRyeSB3
aXRoIGEgRzcxMCwgYnV0IGlmIHRoYXQgZG9lc24ndCB5aWVsZHMgYW55dGhpbmcgSSBuZWVkIHNv
bWUKPj4+PiBtb3JlIGlucHV0IGZyb20geW91Lgo+Pj4+Cj4+Pj4gVGhhbmtzIGZvciB0aGUgcmVw
b3J0LAo+Pj4+IENocmlzdGlhbi4KPj4+Pgo+Pj4+Cj4+Pj4gQW0gMDkuMDYuMjEgdW0gMTU6NDcg
c2NocmllYiBNaWtrbyBQZXJ0dHVuZW46Cj4+Pj4+IEhpLAo+Pj4+Pgo+Pj4+PiBJJ20gb2JzZXJ2
aW5nIG5vdXZlYXUgbm90IGluaXRpYWxpemluZyByZWNlbnRseSBvbiBsaW51eC1uZXh0IG9uIG15
Cj4+Pj4+IFRlZ3JhMTg2IEpldHNvbiBUWDIgYm9hcmQuIFNwZWNpZmljYWxseSBpdCBsb29rcyBs
aWtlIEJPIGFsbG9jYXRpb24gaXMKPj4+Pj4gZmFpbGluZyB3aGVuIGluaXRpYWxpemluZyB0aGUg
c3luYyBzdWJzeXN0ZW06Cj4+Pj4+Cj4+Pj4+IFsgICAyMS44NTgxNDldIG5vdXZlYXUgMTcwMDAw
MDAuZ3B1OiBEUk06IGZhaWxlZCB0byBpbml0aWFsaXNlIHN5bmMKPj4+Pj4gc3Vic3lzdGVtLCAt
MjgKPj4+Pj4KPj4+Pj4gSSBoYXZlIGJlZW4gYmlzZWN0aW5nIGFuZCBJIGhhdmUgZm91bmQgdHdv
IHBhdGNoZXMgdGhhdCBhZmZlY3QgdGhpcy4KPj4+Pj4gRmlyc3RseSwgdGhpbmdzIGZpcnN0IGJy
ZWFrIG9uCj4+Pj4+Cj4+Pj4+IGQwMjExN2Y4ZWZhYSBkcm0vdHRtOiByZW1vdmUgc3BlY2lhbCBo
YW5kbGluZyBmb3Igbm9uIEdFTSBkcml2ZXJzCj4+Pj4+Cj4+Pj4+IHN0YXJ0aW5nIHRvIHJldHVy
biBlcnJvciBjb2RlIC0xMi4gVGhlbiwgYXQKPj4+Pj4KPj4+Pj4gZDc5MDI1YzdmNWUzIGRybS90
dG06IGFsd2F5cyBpbml0aWFsaXplIHRoZSBmdWxsIHR0bV9yZXNvdXJjZSB2Mgo+Pj4+Pgo+Pj4+
PiB0aGUgZXJyb3IgY29kZSBjaGFuZ2VzIHRvIHRoZSBhYm92ZSAtMjguCj4+Pj4+Cj4+Pj4+IElm
IEkgY2hlY2tvdXQgb25lIGNvbW1pdCBwcmlvciB0byBkNzkwMjVjN2Y1ZTMgYW5kIHJldmVydAo+
Pj4+PiBkMDIxMTdmOGVmYWEsIHRoaW5ncyB3b3JrIGFnYWluLiBUaGVyZSBhcmUgYSBidW5jaCBv
ZiBvdGhlciBUVE0KPj4+Pj4gY29tbWl0cyBiZXR3ZWVuIHRoaXMgYW5kIEhFQUQsIHNvIHJldmVy
dGluZyB0aGVzZSBvbiB0b3Agb2YgSEVBRAo+Pj4+PiBkb2Vzbid0IHdvcmsuIEhvd2V2ZXIsIEkg
Y2hlY2tlZCB0aGF0IGJvdGggeWVzdGVyZGF5J3MgYW5kIHRvZGF5J3MKPj4+Pj4gbmV4dHMgYXJl
IGFsc28gYnJva2VuLgo+Pj4+Pgo+Pj4+PiBUaGFuayB5b3UsCj4+Pj4+IE1pa2tvCj4+Pj4+Cj4+
Pj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPj4+PiBO
b3V2ZWF1IG1haWxpbmcgbGlzdAo+Pj4+IE5vdXZlYXVAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCj4+
Pj4gaHR0cHM6Ly9uYW0xMS5zYWZlbGlua3MucHJvdGVjdGlvbi5vdXRsb29rLmNvbS8/dXJsPWh0
dHBzJTNBJTJGJTJGbGlzdHMuZnJlZWRlc2t0b3Aub3JnJTJGbWFpbG1hbiUyRmxpc3RpbmZvJTJG
bm91dmVhdSZhbXA7ZGF0YT0wNCU3QzAxJTdDY2hyaXN0aWFuLmtvZW5pZyU0MGFtZC5jb20lN0My
Mjg3ODhiMWM4NTI0ZmE4MTI4YjA4ZDkyYjU5MWI4MSU3QzNkZDg5NjFmZTQ4ODRlNjA4ZTExYTgy
ZDk5NGUxODNkJTdDMCU3QzAlN0M2Mzc1ODg0ODM5ODM5MTkxNDclN0NVbmtub3duJTdDVFdGcGJH
WnNiM2Q4ZXlKV0lqb2lNQzR3TGpBd01EQWlMQ0pRSWpvaVYybHVNeklpTENKQlRpSTZJazFoYVd3
aUxDSlhWQ0k2TW4wJTNEJTdDMzAwMCZhbXA7c2RhdGE9ZG4wJTJGUkFPS0tkZEZRYmhKY2pkM3Yx
TCUyQkhjNGhHbHBXSVVSUFRHMzNnNTAlM0QmYW1wO3Jlc2VydmVkPTAKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCk5vdXZlYXUgbWFpbGluZyBsaXN0Ck5v
dXZlYXVAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
L21haWxtYW4vbGlzdGluZm8vbm91dmVhdQo=
