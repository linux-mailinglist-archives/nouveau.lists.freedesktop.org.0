Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0888B3916D6
	for <lists+nouveau@lfdr.de>; Wed, 26 May 2021 13:59:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 529BF6ECBD;
	Wed, 26 May 2021 11:59:47 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2043.outbound.protection.outlook.com [40.107.223.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 59EE66ECBD;
 Wed, 26 May 2021 11:59:46 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WgL6TUKaXl94AKFK46YmMMM/m0gI3ViasAa0hIo+i+JKOJ6iMpTD9bz1FtsJI3BiZ+8UA5eBd60FUbUwbxS4MRHBHAI2pCocS10hbWgeDRKty3VD9Taris0yTl3oqpAMV9NPUk9VVZTN+thC90yvaar14hsV1ZT1ixNQMM6tF7jMSLPEUvGGT+ROB4P9xVZ2yRgO+WKVjWDKnhNM9QCfBHq5gA3nPti31V/jmuLlnv3rd/YLloAVGks1/rzsDLfuolCXAtYoNF/+TusOVQs7HVzTQ0DL3BsIkhO4faTSdk1YWchmD5tE0ULxBVeuSqhUpMro0IAEe8+4bAboc6hnaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rsy08kn1VROKtfc0HRxoVYHtU1Fw47/XMQB/ow8VYn0=;
 b=heS7IfGGuANTQwFKkwBZc/spT3W3vQ58msgu5JQDbKhfv57J22B6B5uywdg7ZSMFR/ry6KeW4S8eqgzAiz1J7LwK7U29CdjNX85rlYisA4gFKLhrTTcuCGty4q3DMDlg8M7zJltxNUJCRYCdQV2caQEDQrBfgaR22l32H1edAKHmJb+oHeJ/UkLM2PfSqSVbUOXL1pcFgKOrY0mRUBfCjoSHMSRRCmmZT5hz7pDjBqOwhQws02jLnt53a6mb7GWb945eRHOn7GxADcdCxMJd1SBMzdieFSI4toaIReH42/VrC8rDUkkEZMDrgde2lNq2+8NXeGop4bSsOUsBAHjn2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rsy08kn1VROKtfc0HRxoVYHtU1Fw47/XMQB/ow8VYn0=;
 b=E1z0WlhmDSCD9jIHYXdC1FSZ9daSsa5JpjVfS3LWRp56J/kyeaWL1hgcUpOaWUo2+AFmGzK1KAFybb8ePUgHaD8A5CbAUQnPdkxUxCPTK389PUwaY6J39YLChYHZ+xsgWdkF9xqYAvvUmLOqOJ9rHEsd/5tFZ5rD71D/8rjUydY=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by MN2PR12MB4518.namprd12.prod.outlook.com (2603:10b6:208:266::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4173.20; Wed, 26 May
 2021 11:59:42 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::6d4d:4674:1cf6:8d34]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::6d4d:4674:1cf6:8d34%6]) with mapi id 15.20.4150.027; Wed, 26 May 2021
 11:59:41 +0000
To: Thomas Zimmermann <tzimmermann@suse.de>, alexander.deucher@amd.com,
 airlied@linux.ie, daniel@ffwll.ch, bskeggs@redhat.com, ray.huang@amd.com,
 linux-graphics-maintainer@vmware.com, sroland@vmware.com, zackr@vmware.com,
 shashank.sharma@amd.com, sam@ravnborg.org, emil.velikov@collabora.com,
 Felix.Kuehling@amd.com, nirmoy.das@amd.com
References: <20210525151055.8174-1-tzimmermann@suse.de>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <3e9a7a18-16e1-ed4e-137b-1065108dedf6@amd.com>
Date: Wed, 26 May 2021 13:59:35 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
In-Reply-To: <20210525151055.8174-1-tzimmermann@suse.de>
Content-Language: en-US
X-Originating-IP: [2a02:908:1252:fb60:3ecd:562c:67c6:4afe]
X-ClientProxiedBy: AM0PR01CA0095.eurprd01.prod.exchangelabs.com
 (2603:10a6:208:10e::36) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:3ecd:562c:67c6:4afe]
 (2a02:908:1252:fb60:3ecd:562c:67c6:4afe) by
 AM0PR01CA0095.eurprd01.prod.exchangelabs.com (2603:10a6:208:10e::36) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4173.20 via Frontend
 Transport; Wed, 26 May 2021 11:59:39 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 029a4e41-cd94-48ee-e53c-08d9203dbeb1
X-MS-TrafficTypeDiagnostic: MN2PR12MB4518:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MN2PR12MB4518F42323C9153F5D65310C83249@MN2PR12MB4518.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: GwC3AOKC7I2etp4MbSY4CuQXae1PuvxmOAZ8CdmCTGBUCWFtMRjP9S4g575DM+FInpUKd9Vzpo+t9qZu/r5YUP9ZwQMaDsjwJ3mQ1VZ+kkfGZSRoEIYOC8A+gFL5JYGJXShqoxFbskC+ZtWvUHmodfbs3CH8WfJDZ5L+uV6+nwBFPEu3RS4F+AZntwBYt79t//SSc4SpD/a2WvfibbzTuAVRSqohR2mT7KOnyKcjfvG8qVRKR4OqmtS235Wdv2n8RcOd/I1Dbb4j0hH2PozQQRdoIeTrjhd6MbqRITcQv5TV/IQs3pEioz52AIPTM5ZsaavvCXoeTS2KkQGjARhVRbr+ZRMXNo59Xfr6sIPQ08Ui2LhJ5qPgtTd6HLVNeTE+RR/iN6QRLJXJbJF5E2I0/LfImHdilMrTyt0v7O31Yt2o6Cjgtxck4Dg06AWSrNUAZ+0DSmyobQ9IJG8XtvLWZbQK0vgnbMxcCl4ZWHs9rYB0oiD2FDGDsAgFQ5ONVysHRXK1EnfECfZvCkWFv/zK0szkEtP/mkAORO44REJ6yWxvK9dVMnFo0IEG/CIkxmEkzj55brQJ52T+GXaOUBmLtE6+dfdtmyLgSTHWPTrxBkTyXtSVWEz/ZV3GpKRH89cpaE9+mtch8ejE4QbT27o92/SQ+EmAi6EoWAwtMNKMrq9LVUjgrVKj7vSSJ/FLu3jrAwsOwY0OGmRNDKqz51R+Hw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(376002)(136003)(366004)(396003)(39840400004)(66574015)(36756003)(7416002)(966005)(6666004)(2616005)(8936002)(83380400001)(2906002)(31686004)(8676002)(52116002)(4326008)(31696002)(316002)(5660300002)(66476007)(66946007)(66556008)(921005)(16526019)(478600001)(6636002)(86362001)(186003)(45080400002)(6486002)(38100700002)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?ditQU3Z1SERSZCtMbmh5RUJrSDY2Tzk4bEtPSVVtMDNkSGdZNDBYVHo5Umhp?=
 =?utf-8?B?cFFQUGFBdE9ibC9yZ3ZRL1YweWptTENVdG0rd2lpU2N4b3RnQlE0dWppRFhH?=
 =?utf-8?B?dnBzN0xPN3Rlb2xMNG94NDlsdWJrMThWZTJUN3EyZmJ6WXNwRWlxRFpPVEJl?=
 =?utf-8?B?VDRFeWdvaE12YVdmRDJEc0hlQ09RSUFpMnpGZ2ZvT1QyRkU3Vk84bFJrcy9a?=
 =?utf-8?B?cEZMZDJ3V1dLem1TWXBzN0pZajdnTTlWK1BQbWtQa0lwWmc4ZURUTE9NNXR6?=
 =?utf-8?B?MXF2TzJMVGZITWJod2I4MGEzbzVrOXVFZ0hza2lCcjhhNnRtanh5VFh4T3kw?=
 =?utf-8?B?bnc4Q3RPOG1qK0tpcGlWYXc0N0xkSkxDcEpHTXBKdlR0UG1wa2ozbkZ6RUVN?=
 =?utf-8?B?bHphNm5PS3ZRdkRpNDdWSzZLTUM2aEt2NVhLeUVNOUhOYi95UDUvOWY4STdW?=
 =?utf-8?B?SDRHQkJNZnJCUmVheDhxQmJKUzk3U1NhemYwYk4yWFZmVDJJOG55Q2pEMUJ1?=
 =?utf-8?B?WGRXR2FuaHhVUDl2bmhEM2FSYlorRTVEY2c2MERTUCs2bHNGMHdVa1hNK1Nx?=
 =?utf-8?B?Q000akZGTnlJNXlLWjIweHA2N1ZnNVNjczQzaHlCZ3ZWUXBsYmhxRzN0NkpL?=
 =?utf-8?B?S3VNRVh4d0d6UktGUDJvaDlmeWp4eldDMFpjNis1T2lBL1U5bmxmVEk1MDFX?=
 =?utf-8?B?U0gxTjJaa2FkT3FjL0ZtU1RlYlhndVNzVkhTOXdJajgyV3Q1ZXhtY0hsV2g3?=
 =?utf-8?B?ZERVUWR1eVlXcG9MOGhkU3l2eHoxL1J4cy9mc3pUcmx6ZU1QZDdydEZ1b1Bs?=
 =?utf-8?B?emNxc3RVc0lGQ0o3Z2h1OE5PajJQQ2VGWVRHT21pM2NDdlhnRkVTUUhrTFF4?=
 =?utf-8?B?TmxKUXVSN3dNTjEvMjBEMlp5SmtpKzlTMytNMmhobDdnUm9FaUhFMkhoV2Zy?=
 =?utf-8?B?dGNTcnRGUUJKRHlPdnU2SllSbDNKaGlpM1RxUnY2cU9sUDVLY0JLYmpXSndQ?=
 =?utf-8?B?d0RxVXluczd2QStnMmNlWlBjL2JRUnVhTXhEbHloWW93OFFLaVV0YnhjMk9F?=
 =?utf-8?B?TUpSNVNPUkNCMzZJa0p6SDNpbFFPc3ZNc2hkUkcrYm5ialpMUXZLZmI4WDRG?=
 =?utf-8?B?dXZtNllmcmVFOXZ4TWFrR0ZabXVjRzJyWm4rcGJjNllHTVlUWm1pK0Q3bExE?=
 =?utf-8?B?QlJYNGE5dEZtNWdFSjh4Y250V1lKS2d5VFZTckYzS0RyQ0JZNE1LRVE1M2Qv?=
 =?utf-8?B?VG9MTUhmSTdDZ0FYUzcxazkvNDNXRHprTCtlVU9kNXk4aFoyMEVWRnl5Z0FW?=
 =?utf-8?B?aENxZWo4TzBicU1JSGd1TXg3dkYvMlVoeUFXazliazhJMzRTR2wrWkUyL0RB?=
 =?utf-8?B?TkdDQ1h5L1JFcVVHNlNZTktvT25WOGxmT1M2VjVwOUVKR2hRZUs0RTVtY3Jt?=
 =?utf-8?B?dGNFZnAydzhYZnpVUkpxR2oxYS9mMS9ZNmNkWGd3UmVNNUhjTTJUUTV5NXJT?=
 =?utf-8?B?Wjc4Y2prWEVxbGx5aW5tRE9YMHNVZC9CRkRxbjVkMEVzVkM0K0JvOGtsSEln?=
 =?utf-8?B?d3pxcG5uQU9qclFlOFNXWFc2TWJ3L1J2elc2bnpQSGR0Z2JPZzdPWGoxbXJM?=
 =?utf-8?B?enZNaTY3dzMyQXQ3bmhqZWdHUHZMaGlBUi9FbTBjcGdTMFVISGxxdG95a0p1?=
 =?utf-8?B?VGFDUkJQTC9FSllaaUlmcjFjdTNCUytPRWVqRTRrODdnNmVnQTk1eldpZFdV?=
 =?utf-8?B?enJHeWozUUU0cTJqSVBQRXVWak5aQjl1SHhZWUNUVjFqSnZHOXE2VHVqb29G?=
 =?utf-8?B?ck9QNno0b0ttYk41d1JHbmJUNDZUWjRoMGZOQStnOHNsaFBvekhLZVMrd3E0?=
 =?utf-8?Q?l0pGZAi96JCQA?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 029a4e41-cd94-48ee-e53c-08d9203dbeb1
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 May 2021 11:59:41.8366 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: p8MD+sGXfzuB1EBOxmufJz41V5TX7PdYdFBb/uhdY1BuYh7QdB8Y0wOZtHMkbZCs
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4518
Subject: Re: [Nouveau] [PATCH v4 0/7] drm: Clean up mmap for TTM-based GEM
 drivers
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
Cc: nouveau@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

UGF0Y2hlcyAjMS0jNCBhcmUgUmV2aWV3ZWQtYnk6IENocmlzdGlhbiBLw7ZuaWcgPGNocmlzdGlh
bi5rb2VuaWdAYW1kLmNvbT4KClBhdGNoZXMgIzUgYW5kICM2IGFyZSBBY2tlZC1ieTogQ2hyaXN0
aWFuIEvDtm5pZyA8Y2hyaXN0aWFuLmtvZW5pZ0BhbWQuY29tPgoKUGF0Y2ggIzcgYWxyZWFkeSBo
YXMgbXkgcmIuCgpJIHdvdWxkIHNheSBwdXNoIHRoYXQgdG8gZHJtLW1pc2MtbmV4dCBBU0FQLgoK
UmVnYXJkcywKQ2hyaXN0aWFuLgoKQW0gMjUuMDUuMjEgdW0gMTc6MTAgc2NocmllYiBUaG9tYXMg
WmltbWVybWFubjoKPiBJbXBsZW1lbnQgbW1hcCB2aWEgc3RydWN0IGRybV9nZW1fb2JqZWN0X2Z1
bmN0aW9ucy5tbWFwIGluIGFtZGdwdSwKPiByYWRlb24gYW5kIG5vdXZlYXUuIFRoaXMgYWxsb3dz
IGZvciB1c2luZyBjb21tb24gRFJNIGhlbHBlcnMgZm9yCj4gdGhlIG1tYXAtcmVsYXRlZCBjYWxs
YmFja3MgaW4gc3RydWN0IGZpbGVfb3BlcmF0aW9ucyBhbmQgc3RydWN0Cj4gZHJtX2RyaXZlci4g
VGhlIGRyaXZlcnMgaGF2ZSB0aGVpciBvd24gdm1fb3BzLCB3aGljaCBhcmUgbm93IHNldAo+IGF1
dG9tYXRpY2FsbHkgYnkgdGhlIERSTSBjb3JlIGZ1bmN0aW9ucy4gVGhlIGNvZGUgaW4gZWFjaCBk
cml2ZXIncwo+IHZlcmlmeV9hY2Nlc3MgYmVjb21lcyBwYXJ0IG9mIHRoZSBkcml2ZXIncyBuZXcg
bW1hcCBpbXBsZW1lbnRhdGlvbi4KPgo+IFdpdGggdGhlIEdFTSBkcml2ZXJzIGNvbnZlcnRlZCwg
dm13Z2Z4IGlzIHRoZSBvbmx5IHVzZXIgb2YKPiB0dG1fYm9fbW1hcCgpIGFuZCByZWxhdGVkIGlu
ZnJhc3RydWN0dXJlLiBTbyBtb3ZlIGV2ZXJ5dGhpbmcgaW50bwo+IHZtd2dmeCBhbmQgZGVsZXRl
IHRoZSByc3AgY29kZSBmcm9tIFRUTS4KPgo+IFRoaXMgdG91Y2hlcyBzZXZlcmFsIGRyaXZlcnMu
IFByZWZlcmFibHkgZXZlcnl0aGluZyB3b3VsZCBiZSBtZXJnZWQKPiBhdCBvbmNlIHZpYSBkcm0t
bWlzYy1uZXh0Lgo+Cj4gdjQ6Cj4gCSogcmViYXNlIG9uIHRvcCBvZiBhbWRncHUgaG90LXVucGx1
ZyBjaGFuZ2VzCj4gdjM6Cj4gCSogdGlkeSB1cCB0aGUgbmV3IG1tYXAgZnVuY3Rpb25zIGluIGFt
ZGdwdSBhbmQgcmFkZW9uIChDaHJpc3RpYW4pCj4gdjI6Cj4gCSogcmVtb3ZhbCBvZiBhbWRncHUg
ZmJkZXYgbW1hcCBhbHJlYWR5IG1lcmdlZCAoQ2hyaXN0aWFuKQo+IAkqIHJlYmFzZSBvbiB0b3Ag
b2YgYW1kZ3B1IGZpeGVzIFsxXSAoRmVsaXgpCj4gCSogcmVwbGFjZSBwcl9lcnIoKSB3aXRoIGRy
bV9lcnIoKSBpbiB2bXdnZnggcGF0Y2ggKFphY2spCj4gCSogc2V2ZXJhbCB0eXBvcwo+Cj4gWzFd
IGh0dHBzOi8vbmFtMTEuc2FmZWxpbmtzLnByb3RlY3Rpb24ub3V0bG9vay5jb20vP3VybD1odHRw
cyUzQSUyRiUyRnBhdGNod29yay5mcmVlZGVza3RvcC5vcmclMkZzZXJpZXMlMkY4ODgyMiUyRiZh
bXA7ZGF0YT0wNCU3QzAxJTdDY2hyaXN0aWFuLmtvZW5pZyU0MGFtZC5jb20lN0M3ODJkMTk1YzVl
OGU0Y2E2MzUxYjA4ZDkxZjhmNGU5MCU3QzNkZDg5NjFmZTQ4ODRlNjA4ZTExYTgyZDk5NGUxODNk
JTdDMCU3QzAlN0M2Mzc1NzU1MjI2NjIyMzMzODElN0NVbmtub3duJTdDVFdGcGJHWnNiM2Q4ZXlK
V0lqb2lNQzR3TGpBd01EQWlMQ0pRSWpvaVYybHVNeklpTENKQlRpSTZJazFoYVd3aUxDSlhWQ0k2
TW4wJTNEJTdDMTAwMCZhbXA7c2RhdGE9WkolMkJJeDloRkJYelF1YllwRUtjT25nUkV0ampNS3dh
Q2h5SW9uS1NBQ0ZZJTNEJmFtcDtyZXNlcnZlZD0wCj4KPiBUaG9tYXMgWmltbWVybWFubiAoNyk6
Cj4gICAgZHJtL3R0bTogRG9uJ3Qgb3ZlcnJpZGUgdm1fb3BzIGNhbGxiYWNrcywgaWYgc2V0Cj4g
ICAgZHJtL2FtZGdwdTogSW1wbGVtZW50IG1tYXAgYXMgR0VNIG9iamVjdCBmdW5jdGlvbgo+ICAg
IGRybS9yYWRlb246IEltcGxlbWVudCBtbWFwIGFzIEdFTSBvYmplY3QgZnVuY3Rpb24KPiAgICBk
cm0vbm91dmVhdTogSW1wbGVtZW50IG1tYXAgYXMgR0VNIG9iamVjdCBmdW5jdGlvbgo+ICAgIGRy
bS92bXdnZng6IElubGluZSB0dG1fYm9fbW1hcCgpIGludG8gdm13Z2Z4IGRyaXZlcgo+ICAgIGRy
bS92bXdnZng6IElubGluZSB2bXdfdmVyaWZ5X2FjY2VzcygpCj4gICAgZHJtL3R0bTogUmVtb3Zl
IHR0bV9ib19tbWFwKCkgYW5kIGZyaWVuZHMKPgo+ICAgZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRn
cHUvYW1kZ3B1X2RtYV9idWYuYyB8IDQ2IC0tLS0tLS0tLS0tLS0KPiAgIGRyaXZlcnMvZ3B1L2Ry
bS9hbWQvYW1kZ3B1L2FtZGdwdV9kbWFfYnVmLmggfCAgMiAtCj4gICBkcml2ZXJzL2dwdS9kcm0v
YW1kL2FtZGdwdS9hbWRncHVfZHJ2LmMgICAgIHwgIDQgKy0KPiAgIGRyaXZlcnMvZ3B1L2RybS9h
bWQvYW1kZ3B1L2FtZGdwdV9nZW0uYyAgICAgfCA1NSArKysrKysrKysrKysrKysKPiAgIGRyaXZl
cnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV90dG0uYyAgICAgfCA3NSAtLS0tLS0tLS0tLS0t
LS0tLS0tLS0KPiAgIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV90dG0uaCAgICAg
fCAgMSAtCj4gICBkcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9ub3V2ZWF1X2JvLmMgICAgICAgIHwg
MTAgLS0tCj4gICBkcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9ub3V2ZWF1X2RybS5jICAgICAgIHwg
IDMgKy0KPiAgIGRyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L25vdXZlYXVfZ2VtLmMgICAgICAgfCAz
NiArKysrKysrKysrCj4gICBkcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9ub3V2ZWF1X3R0bS5jICAg
ICAgIHwgNDkgLS0tLS0tLS0tLS0tLS0KPiAgIGRyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L25vdXZl
YXVfdHRtLmggICAgICAgfCAgMSAtCj4gICBkcml2ZXJzL2dwdS9kcm0vcmFkZW9uL3JhZGVvbl9k
cnYuYyAgICAgICAgIHwgIDMgKy0KPiAgIGRyaXZlcnMvZ3B1L2RybS9yYWRlb24vcmFkZW9uX2dl
bS5jICAgICAgICAgfCA0OSArKysrKysrKysrKysrKwo+ICAgZHJpdmVycy9ncHUvZHJtL3JhZGVv
bi9yYWRlb25fdHRtLmMgICAgICAgICB8IDY1IC0tLS0tLS0tLS0tLS0tLS0tLQo+ICAgZHJpdmVy
cy9ncHUvZHJtL3JhZGVvbi9yYWRlb25fdHRtLmggICAgICAgICB8ICAxIC0KPiAgIGRyaXZlcnMv
Z3B1L2RybS90dG0vdHRtX2JvX3ZtLmMgICAgICAgICAgICAgfCA2MCArKy0tLS0tLS0tLS0tLS0t
LQo+ICAgZHJpdmVycy9ncHUvZHJtL3Ztd2dmeC92bXdnZnhfdHRtX2J1ZmZlci5jICB8ICA5IC0t
LQo+ICAgZHJpdmVycy9ncHUvZHJtL3Ztd2dmeC92bXdnZnhfdHRtX2dsdWUuYyAgICB8IDUzICsr
KysrKysrKysrKysrLQo+ICAgaW5jbHVkZS9kcm0vdHRtL3R0bV9ib19hcGkuaCAgICAgICAgICAg
ICAgICB8IDEzIC0tLS0KPiAgIGluY2x1ZGUvZHJtL3R0bS90dG1fZGV2aWNlLmggICAgICAgICAg
ICAgICAgfCAxNSAtLS0tLQo+ICAgMjAgZmlsZXMgY2hhbmdlZCwgMjAyIGluc2VydGlvbnMoKyks
IDM0OCBkZWxldGlvbnMoLSkKPgo+Cj4gYmFzZS1jb21taXQ6IDI4ZGRkYzBjOTBiYzY0NjRiZTRj
NWUzMjI0YTI5M2MwMjI1NjRhNGUKPiBwcmVyZXF1aXNpdGUtcGF0Y2gtaWQ6IGMyYjJmMDhmMGVj
Y2M5ZjVkZjBjMGRhNDlmYTFkMzYyNjdkZWIxMWQKPiBwcmVyZXF1aXNpdGUtcGF0Y2gtaWQ6IGM2
N2U1ZDg4NmE0N2I3ZDAyNjZkODExMDA4Mzc1NTdmZGEzNGNiMjQKPiAtLQo+IDIuMzEuMQo+Cgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpOb3V2ZWF1IG1h
aWxpbmcgbGlzdApOb3V2ZWF1QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK
