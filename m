Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BE912C508F
	for <lists+nouveau@lfdr.de>; Thu, 26 Nov 2020 09:35:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 82A056E825;
	Thu, 26 Nov 2020 08:35:54 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2056.outbound.protection.outlook.com [40.107.236.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 355226E825
 for <nouveau@lists.freedesktop.org>; Thu, 26 Nov 2020 08:35:53 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fKB5Xu6GKSlJ2mZLS3+I8AdRJOvoS2r39Hltjm2b0CrNwZK/nA8cmG/0Y9ak+nHBAXI/9kXz0W7DNEHekhy5A9PX8HhUdyc2S47xgztxk6bxgI1NL0HvJvTKwuSjKj28VwsjpwG124IT7yY2z8OXmFX0ABkKJcU2O+gBOQKAEfYspyoeDgeCAGLhVGb7e6mq8OasQBdIeNTQPT2oRksnzqmhtbYrXFVNdSn2WtCTu3A0OiSqLHFiwkMpnl5II22MQCkHDg04ecGHKfezSTLgYzRyib0eKKf4obFzplMqf2YPbEFXyuWY22fToIHZQR5slYu5czxZpUSCOd83YLoq/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wSh1L+e/FH9ELEjakfsjbLquoOxN3LTzf+jolgxIeSM=;
 b=YtFB+fqOJTautaZ96OMz7akfkArjpoBfqJLUI4XQ6HtYGZMCavFYMAfSpuTl3LOn0QRJ2iHNC699hb21FXFxUrxeQs5Rn12hXBxtoVEDceWAv+7h1PdpabKnbwk3TWRrRW0BGwuyErOAd5go487/1zrvunSj3o4kZPwv8621EZhsMESza9gB7SqnmYSvbu61H6TDZqLkRbPqtNpWet7rWvdACyN3eKU//dS6Kt2PojWHR6YZhyPL05zkyAcmfEWp7+WBAMv0vc+N0TG7esO2Wi9s9FqhyoJ4o7L0g3w2Rq4ETYXyngqFR5+jzjeU+T8mNEdPW6SjhqQZZYr4PeAMYg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wSh1L+e/FH9ELEjakfsjbLquoOxN3LTzf+jolgxIeSM=;
 b=xq5+V9Or19l1HV5AW+baLAIffZQg1WB7vU1CgofMDuoqD6JSYtCJ0pu3svox2p/PdKNTCKEsdSP3qGG33TpImRU66VUz0wBonUKhPppDhWqaoG+yb6Txz6P3JwLC9Fpa5237bD6Yckw8lpcck1FjrJ2++zh2B+GtAyO5E4x+zTw=
Authentication-Results: cfl.rr.com; dkim=none (message not signed)
 header.d=none;cfl.rr.com; dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by BL0PR12MB2418.namprd12.prod.outlook.com (2603:10b6:207:4d::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3611.23; Thu, 26 Nov
 2020 08:35:51 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::1ccc:8a9a:45d3:dd31]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::1ccc:8a9a:45d3:dd31%7]) with mapi id 15.20.3589.032; Thu, 26 Nov 2020
 08:35:51 +0000
To: markh@compro.net, nouveau@lists.freedesktop.org
References: <db0e5f78-8271-24b5-62f6-5473f69ac8d6@compro.net>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <c2ee46af-79a8-9a07-b12d-b755017ee500@amd.com>
Date: Thu, 26 Nov 2020 09:35:45 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <db0e5f78-8271-24b5-62f6-5473f69ac8d6@compro.net>
Content-Language: en-US
X-Originating-IP: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
X-ClientProxiedBy: AM0PR10CA0127.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:208:e6::44) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
 (2a02:908:1252:fb60:be8a:bd56:1f94:86e7) by
 AM0PR10CA0127.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:208:e6::44) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3611.22 via Frontend Transport; Thu, 26 Nov 2020 08:35:50 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 7be289fc-fcd7-461f-1048-08d891e647eb
X-MS-TrafficTypeDiagnostic: BL0PR12MB2418:
X-Microsoft-Antispam-PRVS: <BL0PR12MB2418EBCB8F1AE0355E09244E83F90@BL0PR12MB2418.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: pDg7PpY+Q8B2k/Ax7hwTjUg6TzqLj38Yeg1smF6A/Sh+ubNsPtRnHJ8NGLqNOxBW99ng7uhAf1F4/ytFNkDEM08PZiVjRnhl1ytrZZcHVWwOH10KnhCP61yQIUHIruw0qa0SW685nBkoWcA8g27wYXKQWdu7Jm9yhZJ+AO2eXCwR6Y2tr3eIjullFg43sZOQXSk0yn4/OT8jebG5IIRAS4MOKR7YtThHlOOmNX4ArDsfUGGyBskhtqr+NZm8VFU+2px8KFmUXPcCMZsRzCMJpw6hL+9s7UvPa6tEwQZeK4nT6YzkMSfYU3Q3MFHlM7aQIVPPPpS9DbGXzX+QYYpbaO4WmFtnjSCDb6fZ/773+YTHAOzvqyNeM/SIT7eYkKBBWqoHzZ2OgT3GUMcmeBO+FfMSVDGGkee2WzvqKoY54kg=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(136003)(39860400002)(346002)(376002)(396003)(66476007)(66556008)(66946007)(2616005)(2906002)(6486002)(83380400001)(31696002)(316002)(478600001)(45080400002)(16526019)(8676002)(186003)(8936002)(36756003)(31686004)(4326008)(86362001)(966005)(66574015)(5660300002)(6666004)(52116002)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?UFVkWW9nVk9Hd3lNd0lMdW9qZWpqbDllVXM0L3hLcXB2Q0UxZmVNUEI0NjJ5?=
 =?utf-8?B?YjdjMHlhMzRBcG5kTEdBcXE2NWdCWldoam9wcVR5anBtUnlRTUJER3lYU0VY?=
 =?utf-8?B?cVVRTDVGekFLVGwzU1dBZUNBWDlldUx4VG81YlJzTDlhNTZYY1RQSmVqOEV1?=
 =?utf-8?B?aGc1M2JGY1FvR0ZaM0c2TER4ZGQ0eUdMa0lDVDh6clRjeUZLTUY4RmdlNkYw?=
 =?utf-8?B?Rm9VUXMwRmtIdGlEQllRUHFNRGhCY3BWZjMxUFRYU0c4dzlZMkNJbFd3QjBE?=
 =?utf-8?B?UHB4eitCZ2NlL1BGMFArOWVjZ1RWbmJML2JxQ0dLeWphQ3Z0Si9mc1lQcllh?=
 =?utf-8?B?TkFaeE8zVW8weDNDSTVzc3RWZzJqanVqZTFyWGpFb211Z0lGemxXeGZFOEdQ?=
 =?utf-8?B?cVZjTzZOdU1nOUJWNjhCekMxYmt3ZzBGLzNOc0hhWVppNGR2bTN5bStld3Va?=
 =?utf-8?B?cmxBVngzSmtFUGVNNTJFOENCUmh3ektteDVSWW41cTZJd0djZnlIUEtQQ3FN?=
 =?utf-8?B?TFJjbzRFVUlqbGhDeGlHKzJ4ODNtek5DTWdsR1ZZcjYvMlh5aWJJZlZ5cDJW?=
 =?utf-8?B?aDJnTXNUZmtXaHM3TUIvdStLRHVITmNKMCtDV0F5dzMwMXNSdzZUSGordDBB?=
 =?utf-8?B?eUtQRHJrcElIaEhkT0FZQnl1aHNzaDR2SzZFUkNDRDRNOUVyZk1WYUtKd0dp?=
 =?utf-8?B?VDVjaHJpWjc1SjF1Z3JaaGR4OXZHbWJaQkgxM2wydjNZR0NvOTBMY3RCaG9r?=
 =?utf-8?B?L011cVdFYmdmNW5VT2NQTnZYbzc4b2N5ZnpqTVRmeUtyenlyWkdxWmwxdWh0?=
 =?utf-8?B?byt2R1BJd2xHR3NzRmdXSEF1d1oyMEFtRDRTMGJZbUlqejIwYThsZGYyclIz?=
 =?utf-8?B?Qkc5YWdNckkxb2RPbnNkcUZuQXBZZG1rSnZBNStVK09UajlYRFBaTUVDbk45?=
 =?utf-8?B?MWp2Q2VRZTFpcmdyZUNsNVM3eUN4VzBqN0NYUm5oMGdIc2Yya2NjTlFIM2p6?=
 =?utf-8?B?Vzd3Z1dkeUdXemFJdVhQK1RHU000RG9SYTFiK24wb1RzdW1NMnU3YjU0UC9L?=
 =?utf-8?B?TVB4bFh4MFczWXNzK21IQUIwVGYyeTh3TnFpUWFIclEwQm8wVzRXaDFiZWJB?=
 =?utf-8?B?bEVwYm9iNUdBTUpJMXRLVmVoZUs1WHVXTkIyYU9VS1h6WU9xQ1JtaERYNlM2?=
 =?utf-8?B?Nitoc09DVkpUcEpzZlk4bzlxWEdiZ3hRall2U3RBQnF0d3JlM0g5QU5MQWhv?=
 =?utf-8?B?MHhZYmIxcnZEcCtNU3RTK2Rad2x2aWVxOXU4WmxkUXVsTnVWdkFwSFBxOElX?=
 =?utf-8?B?Szc5QlZNVEtJR2tnb3hDdzh0eWlCQmpxSFBqaXEvTDFlc3huNGJxNXF4enVi?=
 =?utf-8?B?Y1N3OW9SQWh6N2hLMWlYVmFwMllXYzZRQ3Q0STBoL2ZTZUFDOXQ5eFF3T1N2?=
 =?utf-8?Q?B0mEgoTu?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7be289fc-fcd7-461f-1048-08d891e647eb
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Nov 2020 08:35:51.1386 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ud69f8CXYSspgSnnGIgTgN1JMJI0RsGuN5ZRyXEBDR3FIv6fBdEOtn/ChgDTTVZl
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB2418
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

SGkgZG8geW91IGhhdmUgYSBmdWxsIGRtZXNnPyBUaGlzIGlzIGEgYml0IHNob3J0LgoKR29pbmcg
dG8gdGFrZSBhIGxvb2sgbGF0ZXIgdG9kYXkuCgpUaGFua3MsCkNocmlzdGlhbi4KCkFtIDI1LjEx
LjIwIHVtIDIzOjE2IHNjaHJpZWIgTWFyayBIb3Vuc2NoZWxsOgo+Cj4gSSdtIHJ1bm5pbmcgYW4g
b2xkZXIgIk5WSURJQSBDb3Jwb3JhdGlvbiBHNzAgW0dlRm9yY2UgNzgwMCBHVF0gKHJldiAKPiBh
MSkiIGNhcmQgaW4gYSBuZXdlciBCSU9TVEFSIEI1NTBHVEEgTUIuIEtlcm5lbCA1LjEwLXJjeCBk
b2VzIG5vdCAKPiB3b3JrLiBJIGdldCBubyB2aXJ0dWFsIGNvbnNvbGVzIG9yIFggc2NyZWVuLgo+
Cj4KPiBNeSBkbWVzZyBzZWVtcyB0byBzaG93IHRoZSBjYXVzZToKPgo+IFvCoMKgwqAgNS44MjU3
MDJdIGZiMDogc3dpdGNoaW5nIHRvIG5vdXZlYXVmYiBmcm9tIFZFU0EgVkdBCj4gW8KgwqDCoCA2
LjI0Mjk5MV0gbm91dmVhdSAwMDAwOjE0OjAwLjA6IHZnYWFyYjogZGVhY3RpdmF0ZSB2Z2EgY29u
c29sZQo+IFvCoMKgwqAgNi4yNDMwNjZdIG5vdXZlYXUgMDAwMDoxNDowMC4wOiBOVklESUEgRzcw
ICgwNDcyMDBhMSkKPiBbwqDCoMKgIDYuNDQzNjcxXSBub3V2ZWF1IDAwMDA6MTQ6MDAuMDogYmlv
czogdmVyc2lvbiAwNS43MC4wMi4xMy43Ygo+IFvCoMKgwqAgNi40NDM5NDhdIG5vdXZlYXUgMDAw
MDoxNDowMC4wOiBmYjogMjU2IE1pQiBHRERSMwo+IFvCoMKgwqAgNi40OTgwMzldIG5vdXZlYXUg
MDAwMDoxNDowMC4wOiBEUk06IFZSQU06IDI1MCBNaUIKPiBbwqDCoMKgIDYuNDk4MDQxXSBub3V2
ZWF1IDAwMDA6MTQ6MDAuMDogRFJNOiBHQVJUOiA1MTIgTWlCCj4gW8KgwqDCoCA2LjQ5ODA0NF0g
bm91dmVhdSAwMDAwOjE0OjAwLjA6IERSTTogVE1EUyB0YWJsZSB2ZXJzaW9uIDEuMQo+IFvCoMKg
wqAgNi40OTgwNDZdIG5vdXZlYXUgMDAwMDoxNDowMC4wOiBEUk06IERDQiB2ZXJzaW9uIDMuMAo+
IFvCoMKgwqAgNi40OTgwNDldIG5vdXZlYXUgMDAwMDoxNDowMC4wOiBEUk06IERDQiBvdXRwIDAw
OiAwMTAwMDMwMCAwMDAwMDAyOAo+IFvCoMKgwqAgNi40OTgwNTFdIG5vdXZlYXUgMDAwMDoxNDow
MC4wOiBEUk06IERDQiBvdXRwIDAxOiAwMzAwMDMwMiAwMDAwMDAwMAo+IFvCoMKgwqAgNi40OTgw
NTNdIG5vdXZlYXUgMDAwMDoxNDowMC4wOiBEUk06IERDQiBvdXRwIDAyOiAwNDAxMTMxMCAwMDAw
MDAyOAo+IFvCoMKgwqAgNi40OTgwNTVdIG5vdXZlYXUgMDAwMDoxNDowMC4wOiBEUk06IERDQiBv
dXRwIDAzOiAwNDAxMTMxMiAwMDAwMDAwMAo+IFvCoMKgwqAgNi40OTgwNTddIG5vdXZlYXUgMDAw
MDoxNDowMC4wOiBEUk06IERDQiBvdXRwIDA0OiAwMjAyMjNmMSAwMDQwYzA4MAo+IFvCoMKgwqAg
Ni40OTgwNjBdIG5vdXZlYXUgMDAwMDoxNDowMC4wOiBEUk06IERDQiBjb25uIDAwOiAxMDMwCj4g
W8KgwqDCoCA2LjQ5ODA2Ml0gbm91dmVhdSAwMDAwOjE0OjAwLjA6IERSTTogRENCIGNvbm4gMDE6
IDIxMzAKPiBbwqDCoMKgIDYuNDk4MDY0XSBub3V2ZWF1IDAwMDA6MTQ6MDAuMDogRFJNOiBEQ0Ig
Y29ubiAwMjogMDIxMAo+IFvCoMKgwqAgNi40OTgwNjVdIG5vdXZlYXUgMDAwMDoxNDowMC4wOiBE
Uk06IERDQiBjb25uIDAzOiAwMjExCj4gW8KgwqDCoCA2LjQ5ODA2N10gbm91dmVhdSAwMDAwOjE0
OjAwLjA6IERSTTogRENCIGNvbm4gMDQ6IDAyMTMKPiBbwqDCoMKgIDYuNTAyOTQ5XSBub3V2ZWF1
IDAwMDA6MTQ6MDAuMDogRFJNOiBTZXR0aW5nIGRwbXMgbW9kZSAzIG9uIFRWIAo+IGVuY29kZXIg
KG91dHB1dCA0KQo+IFvCoMKgwqAgNi41ODU4NDVdIG5vdXZlYXUgMDAwMDoxNDowMC4wOiBEUk06
IGZhaWxlZCB0byBtYXAgZmI6IC0yOAo+IFvCoMKgwqAgNi41ODU5NDldIFtkcm1dIEluaXRpYWxp
emVkIG5vdXZlYXUgMS4zLjEgMjAxMjA4MDEgZm9yIAo+IDAwMDA6MTQ6MDAuMCBvbiBtaW5vciAw
Cj4KPiBUaGlzIGNvbW1pdCBjYXVzZWQgdGhlIEJVRwo+Cj4gMTQxYjE1ZTU5MTc1YWExNzRjYTFm
NzU5NjE4OGJkMTVhN2NhMTdiYSBpcyB0aGUgZmlyc3QgYmFkIGNvbW1pdAo+IGNvbW1pdCAxNDFi
MTVlNTkxNzVhYTE3NGNhMWY3NTk2MTg4YmQxNWE3Y2ExN2JhCj4gQXV0aG9yOiBDaHJpc3RpYW4g
S8O2bmlnIDxjaHJpc3RpYW4ua29lbmlnQGFtZC5jb20+Cj4gRGF0ZTrCoMKgIEZyaSBBdWcgMjEg
MTY6MDY6NTAgMjAyMCArMDIwMAo+Cj4gwqDCoMKgIGRybS9ub3V2ZWF1OiBtb3ZlIGlvX3Jlc2Vy
dmVfbHJ1IGhhbmRsaW5nIGludG8gdGhlIGRyaXZlciB2NQo+Cj4gwqDCoMKgIFdoaWxlIHdvcmtp
bmcgb24gVFRNIGNsZWFudXBzIEkndmUgZm91bmQgdGhhdCB0aGUgaW9fcmVzZXJ2ZV9scnUgCj4g
dXNlZCBieQo+IMKgwqDCoCBOb3V2ZWF1IGlzIGFjdHVhbGx5IG5vdCB3b3JraW5nIGF0IGFsbC4K
Pgo+IMKgwqDCoCBJbiBnZW5lcmFsIHdlIHNob3VsZCByZW1vdmUgZHJpdmVyIHNwZWNpZmljIGhh
bmRsaW5nIGZyb20gdGhlIG1lbW9yeQo+IMKgwqDCoCBtYW5hZ2VtZW50LCBzbyB0aGlzIHBhdGNo
IG1vdmVzIHRoZSBpb19yZXNlcnZlX2xydSBoYW5kbGluZyBpbnRvIAo+IE5vdXZlYXUKPiDCoMKg
wqAgaW5zdGVhZC4KPgo+IMKgwqDCoCB2MjogZG9uJ3QgY2FsbCB0dG1fYm9fdW5tYXBfdmlydHVh
bCBpbiBub3V2ZWF1X3R0bV9pb19tZW1fcmVzZXJ2ZQo+IMKgwqDCoCB2MzogcmViYXNlZCBhbmQg
dXNlIGJvdGggYmFzZSBhbmQgb2Zmc2V0IGluIHRoZSBjaGVjawo+IMKgwqDCoCB2NDogZml4IHNt
YWxsIHR5cG9zIGFuZCB0ZXN0IHRoZSBwYXRjaAo+IMKgwqDCoCB2NTogcmViYXNlZCBhbmQga2Vl
cCB0aGUgbWVtLmJ1cyBpbml0IGluIFRUTS4KPgo+IMKgwqDCoCBTaWduZWQtb2ZmLWJ5OiBDaHJp
c3RpYW4gS8O2bmlnIDxjaHJpc3RpYW4ua29lbmlnQGFtZC5jb20+Cj4gwqDCoMKgIEFja2VkLWJ5
OiBEYW5pZWwgVmV0dGVyIDxkYW5pZWwudmV0dGVyQGZmd2xsLmNoPgo+IMKgwqDCoCBSZXZpZXdl
ZC1ieTogQmVuIFNrZWdncyA8YnNrZWdnc0ByZWRoYXQuY29tPgo+IMKgwqDCoCBMaW5rOiAKPiBo
dHRwczovL25hbTExLnNhZmVsaW5rcy5wcm90ZWN0aW9uLm91dGxvb2suY29tLz91cmw9aHR0cHMl
M0ElMkYlMkZwYXRjaHdvcmsuZnJlZWRlc2t0b3Aub3JnJTJGcGF0Y2glMkYzODg2NDMlMkYmYW1w
O2RhdGE9MDQlN0MwMSU3Q2NocmlzdGlhbi5rb2VuaWclNDBhbWQuY29tJTdDMDM0MzhjNDA0YzYx
NDQ0NzJmOWIwOGQ4OTE4ZmI4N2UlN0MzZGQ4OTYxZmU0ODg0ZTYwOGUxMWE4MmQ5OTRlMTgzZCU3
QzAlN0MwJTdDNjM3NDE5MzkzNzcxNTkxNDI2JTdDVW5rbm93biU3Q1RXRnBiR1pzYjNkOGV5SldJ
am9pTUM0d0xqQXdNREFpTENKUUlqb2lWMmx1TXpJaUxDSkJUaUk2SWsxaGFXd2lMQ0pYVkNJNk1u
MCUzRCU3QzEwMDAmYW1wO3NkYXRhPWJzYXBKQkRaOUZ5V1NIJTJGb3MxanhYY214Z0p5JTJGbUYl
MkZpRk56V1EzWDF3QXMlM0QmYW1wO3Jlc2VydmVkPTAKPgo+IMKgZHJpdmVycy9ncHUvZHJtL25v
dXZlYXUvbm91dmVhdV9iby5jwqAgfCAxMDEgCj4gKysrKysrKysrKysrKysrKysrKysrKysrKysr
LS0tLS0tLQo+IMKgZHJpdmVycy9ncHUvZHJtL25vdXZlYXUvbm91dmVhdV9iby5owqAgfMKgwqAg
MyArCj4gwqBkcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9ub3V2ZWF1X2Rydi5oIHzCoMKgIDIgKwo+
IMKgZHJpdmVycy9ncHUvZHJtL25vdXZlYXUvbm91dmVhdV90dG0uYyB8wqAgNDQgKysrKysrKysr
KysrKystCj4gwqA0IGZpbGVzIGNoYW5nZWQsIDEyNyBpbnNlcnRpb25zKCspLCAyMyBkZWxldGlv
bnMoLSkKPgo+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpOb3V2ZWF1IG1haWxpbmcgbGlzdApOb3V2ZWF1QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRw
czovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK
