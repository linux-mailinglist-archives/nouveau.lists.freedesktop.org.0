Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CA9A32EEE0
	for <lists+nouveau@lfdr.de>; Fri,  5 Mar 2021 16:33:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C4106EBA5;
	Fri,  5 Mar 2021 15:33:22 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2080.outbound.protection.outlook.com [40.107.94.80])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5461E6EB66;
 Fri,  5 Mar 2021 15:33:20 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dp/unaJtMuydSjj3Fjma7WlL0phqkLBt28R6CIWhPGEIfMW0aAJnkUue+l+MfeOj26gQXLqscVxVm8YUtUUcAfnVwXtjhPCRVbtYk08PnjVoU1hTSZEDq81R/TIhJid2ElmIuFgLiIGe1CDScFWVcmdVrlOjMGp4gWI6qPsiRy5HWEPSVci7qRVRSFuKs9IhlDE7jZV4bcWXYUeZTGD5m9XMgD9Fo+rG05i5potetbXqH5kRCM2LeMaW8Lvwm+wNu7tBNO1eIXkC2kp9BkKw0pJI9jm3p8Him0ew2Xb/2si3od6FdNjPCLvzBlZbdNB465eoSnbuo64f0UiH1yeN5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xvMtROSUQXU/cDEeD6TjEkNp+thd3pBUitxuZY+3kM4=;
 b=N8s/s6rAFV1jVIbGX904iT7idiVkZ1KjqEb3VTBp0hbMdXfacMlTXGkqmqaSo7CBi0HTAm1YyF1H43k1mHJKNsJXXUSToBi5tfI2QRrbI4Le12GCzuh9IPnC0e1wpfikC8OZGDhl/4zVH6O0dOgUCNIcjhZ6wkqAWJIMF4RrsPRHoNdfvh2r3AJ7tYOGCvrn42lJmnDXKuLOrhr7uuR59qX9ZXF3tzEAhRpDKqZa8jbqsLgsc4/V2isRFGBYLbXA4UY0az9P2UyJKvpyqimfotQhBRaNRQUyaUMhvDDGZz+/37t0+Gar1uqffBamDGQ3OadHMOBqDXRx438+KcVxPg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vmware.com; dmarc=pass action=none header.from=vmware.com;
 dkim=pass header.d=vmware.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vmware.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xvMtROSUQXU/cDEeD6TjEkNp+thd3pBUitxuZY+3kM4=;
 b=lDOwHscU6/Ar+6mkgxBMxdalaLGYU2WfVg/9S2dc05k4XgKeDX0xrsbFNZ+cUFmSdSwNjhjMkNjxuPYUffcc+eALNfHwGKu71DxAsSf8IPNzjMP0lCxgVOjVAESceny1j0T/4FuHX1fLM7aiYjs3LaTe1HThGupyUZYtJnF0pNg=
Authentication-Results: vmware.com; dkim=none (message not signed)
 header.d=none;vmware.com; dmarc=none action=none header.from=vmware.com;
Received: from SN6PR05MB5759.namprd05.prod.outlook.com (2603:10b6:805:103::19)
 by SN7PR05MB7616.namprd05.prod.outlook.com (2603:10b6:806:107::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3912.9; Fri, 5 Mar
 2021 15:33:16 +0000
Received: from SN6PR05MB5759.namprd05.prod.outlook.com
 ([fe80::24ea:f168:e288:980a]) by SN6PR05MB5759.namprd05.prod.outlook.com
 ([fe80::24ea:f168:e288:980a%5]) with mapi id 15.20.3912.023; Fri, 5 Mar 2021
 15:33:15 +0000
To: Lee Jones <lee.jones@linaro.org>
References: <20210303134319.3160762-1-lee.jones@linaro.org>
From: Roland Scheidegger <sroland@vmware.com>
Message-ID: <16d4300e-bf29-1e85-317b-53d257890cb9@vmware.com>
Date: Fri, 5 Mar 2021 16:33:01 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.7.0
In-Reply-To: <20210303134319.3160762-1-lee.jones@linaro.org>
Content-Language: de-DE
X-Originating-IP: [46.126.183.173]
X-ClientProxiedBy: GV0P278CA0067.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:710:2a::18) To SN6PR05MB5759.namprd05.prod.outlook.com
 (2603:10b6:805:103::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.1.125] (46.126.183.173) by
 GV0P278CA0067.CHEP278.PROD.OUTLOOK.COM (2603:10a6:710:2a::18) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3912.17 via Frontend Transport; Fri, 5 Mar 2021 15:33:06 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 86d4ed48-28f4-4b55-6714-08d8dfebfc4d
X-MS-TrafficTypeDiagnostic: SN7PR05MB7616:
X-LD-Processed: b39138ca-3cee-4b4a-a4d6-cd83d9dd62f0,ExtAddr
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SN7PR05MB7616376745FD6DF5AEB10A49C6969@SN7PR05MB7616.namprd05.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4303;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: FPAlYZdaQOpmA2U+rMMMcxHvtBW0VshuuhRzGHfRSPxRtDkdDJAI3CF2+W1GwmkXWTGm1Iw5rNdbNdnzdymREWShRMUIyMua0alrhdZoaVIis4SrToywjXeLohIHXKuveJNwv/krmvBW9bvkD+G9wg6y0Q/d5nxh0A0P1ND+A1Xu05mm//cBQPpJdTpxQwEnJ20dCTO8zPaJ07bVQHknki1EdDmE+eBwvDDVzucKg3niHk2rgfiHNUu2YJRgeAqhK7KDbwEKoVUXKpPnUxu9kr0k8IY96L/6b3/ULl9k9zVQXzoRj79GvhFxpzffPBGwRzf2NuzWe8/tVddsWFRPiYmZlHCDEQ69j8PjZSgUStD/nBQgw/QrFL9ifOtkfsJur2yMwt1Q4f2Mfp1cPZydwkwmz/yle5+OPN4LdmnEKFaWpWM/x1LqnGNz8EbVlx3QU80ZXovOScMkbl7kv4T3AWdnwI3TfRrAiNY2Aey2074uJHITJRk+oGEHsM67AcDJ4hD/6onC0lZig3FALsMepCL7AXeHSzV9YAB5eKgsDp08/Wb/ywGiL6AYyFlVJyfPpYTp3p+rwp3pUmesSzH5M8kBXeu8f7CIX0jWeQDy510=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR05MB5759.namprd05.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(366004)(396003)(39860400002)(346002)(136003)(54906003)(107886003)(26005)(2906002)(316002)(8936002)(8676002)(16576012)(53546011)(86362001)(478600001)(4326008)(2616005)(16526019)(186003)(956004)(6666004)(83380400001)(7416002)(6916009)(31696002)(31686004)(6486002)(36756003)(66946007)(66574015)(66476007)(5660300002)(66556008)(7406005)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?cm9uNzVFSU5meDVydnJNdHpkQXNDZ0RkNVBHV2tYZDRSdDJZTlRnc3p1bk91?=
 =?utf-8?B?NS9CbGVSemZBWlExU2ZhUGFoOUkyN2lvZmZTSkxCNE1YTTRRN2JIbStFL3JJ?=
 =?utf-8?B?Z0VwR01aRmZmVHp1NXkvY2pNdGcyS1pTTmdKYit3eGkxRGVUMVBGTEFsTUVh?=
 =?utf-8?B?cmtBOVRoWVhXRG9uRzFiNDFuN1p3dTRmdnIzRnppaDQ3aDVsd0NBV1ZuemNP?=
 =?utf-8?B?eEVPY3ZTT09zcU9qaVROYTEwY2F4Zk5KNVpta2VqSEZFSSsrV0ZzNUwwcFJv?=
 =?utf-8?B?WXdJbkRpSWxBOXNDSnNQamE0b29pakRkMjFDQ0R4empWWXVLOHJ2MGRrNlhi?=
 =?utf-8?B?VUpNeldjVTZNbFQrQU92dXp5RDJvOVdaTVlZL29LYlpBVWlRdjlJYXBjWTBq?=
 =?utf-8?B?WDN0TUozOUxHNWtyeUtRKzhRVCtaY2IxVnRBdUFwWnlUMkUyZ3FVNEM2Qmc0?=
 =?utf-8?B?V09UL3o4Ynd1bTdvQ3RoQWpVRThtaklNQlV5czVzSjdwd1NjcmJVRTV6dzBl?=
 =?utf-8?B?Q1FUNm9IS1VNcitvcU9VOGN3NEFkV3FmVXBCSXhvRTJkVUl0WTJZU3Z1Yjdk?=
 =?utf-8?B?ZnJvbmFPTGgrZ1RENWJLeG9zRTBuOHlONEVJMTlzSFFSZ3pGV01iaktabEZu?=
 =?utf-8?B?OTlTTE1GTDdSVURyQVNuenIyTHU1Z2dQbHBHV1EweUMxWFJ3b2lGUk5TclIw?=
 =?utf-8?B?OEZmbkovVTU4RXhEN0FVQkdQQS9QaVNmbWFEUnY3VnFWNVpzWEQ1bFJJUUto?=
 =?utf-8?B?bU5lemYxYVpkbVB1cWtkMzJ1MVRHVFNnU0c4Zy9LZFIwQ3hMK0hFdWtYNzRs?=
 =?utf-8?B?SWJyTmhVL3c5MzBBUXRLeHl4SUxSYXdKdjJHZ2hKOTN0RkJaQXJ2dHZ6b2lw?=
 =?utf-8?B?QnFSdjQvMFBmL1Boa3RjN0xMWGNZQ1JFSEkwaEQ0Q1pYRXQ5M0VVc3phYjhh?=
 =?utf-8?B?NGhsS1VQbFZuV3M3WURiTm03T05wbS9yVEdVbFMrMnhKUzBBRi9BS1lISVUy?=
 =?utf-8?B?amxic2R3MTRLVWtpTW5LNnVNUjl0U0tJTllDWFpKWjFsSytyci9rNUF3eERj?=
 =?utf-8?B?RUdzVTZUWEl3bVB0WHdzL0J1Q1VsZENOc3NhSmZuVXJ1Tm0wVElYZHpsZUVN?=
 =?utf-8?B?MUptdXV6TXhuMmVmOUc5V3pmU3FuWGFrUjJlTS9IdUlua3JObUFwa3dxNFB2?=
 =?utf-8?B?WGo0YVVCd3ViUFNpb09DSFVWb1Y0RnoxckZ3aWlVbnNYM0Fob21SbW5RWFFS?=
 =?utf-8?B?aTZndGpQb2dJUmNPME1zWTdmbmJ2dUpsRFJsc0x0YUV3Mnl0SSsvQW11eTFP?=
 =?utf-8?B?aXFuQjMzRFI0cnpDNVVZb3F6NjVIM1NmN2R0bGoxUHVKSVdHbHJsK0RsTDFH?=
 =?utf-8?B?ckRJYUY3d2IwbVN5UW9lRVdnODdMcDIrZktucG02NnlyaFE5RmZrMDE1RXFp?=
 =?utf-8?B?M3FJY1ltNXlTMy93N2dUcnJCSU5la1lsRzJpOHVHYjRtTENvdjRVampjdi83?=
 =?utf-8?B?RTN2UWJrY0s0WVU3YWt2WWZUZEhOTXNmR1VlQk1pQmJ5TU5LNlJWbkl3cGJx?=
 =?utf-8?B?ckM2YmlCZFp5VmcxUUh6YkwveG54ZGRDU0NvcW9XNnN6Y2lEWUl2K2llMnJx?=
 =?utf-8?B?SEFkNzI5N1VxSGJ5U2F3ZUhqTFlYYXdRSnkxMHV5ZjdrLzNFQTU3bTZ6SThi?=
 =?utf-8?B?UWJTRm82aTd6dFRlVXltK2ppZnc1ZTdNOTJ1VXlIUHF5RnFvdFc5bm5VUno2?=
 =?utf-8?Q?4nJZjCW3UIXCS/kRc7vWyqvqnJ/59+gRWL6ObzJ?=
X-OriginatorOrg: vmware.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 86d4ed48-28f4-4b55-6714-08d8dfebfc4d
X-MS-Exchange-CrossTenant-AuthSource: SN6PR05MB5759.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Mar 2021 15:33:14.9815 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b39138ca-3cee-4b4a-a4d6-cd83d9dd62f0
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: t+zYzSKNIyb4rKtJB7jm1X68fdxnQ976Noz/bHg36j6+Jln4yzsaTin1lx7G6EH6oSKQNSQLssyiKdCezqDn1A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR05MB7616
Subject: Re: [Nouveau] [RESEND 00/53] Rid GPU from W=1 warnings
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
Cc: David Airlie <airlied@linux.ie>, nouveau@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Qinglang Miao <miaoqinglang@huawei.com>,
 Anthony Koo <Anthony.Koo@amd.com>, Sumit Semwal <sumit.semwal@linaro.org>,
 Jeremy Kolb <jkolb@brandeis.edu>, amd-gfx@lists.freedesktop.org,
 Rob Clark <rob.clark@linaro.org>,
 VMware Graphics <linux-graphics-maintainer@vmware.com>,
 Ben Skeggs <bskeggs@redhat.com>, Dave Airlie <airlied@redhat.com>,
 Harry Wentland <harry.wentland@amd.com>, linux-media@vger.kernel.org,
 Leo Li <sunpeng.li@amd.com>, linux-arm-msm@vger.kernel.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, linaro-mm-sig@lists.linaro.org,
 Sean Paul <sean@poorly.run>, Kuogee Hsieh <khsieh@codeaurora.org>,
 linux-kernel@vger.kernel.org, Rob Clark <robdclark@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Alex Deucher <alexander.deucher@amd.com>,
 Colin Ian King <colin.king@canonical.com>, freedreno@lists.freedesktop.org,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 Zack Rusin <zackr@vmware.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

VGhlIHZtd2dmeCBvbmVzIGxvb2sgYWxsIGdvb2QgdG8gbWUsIHNvIGZvcgoyMy01MzogUmV2aWV3
ZWQtYnk6IFJvbGFuZCBTY2hlaWRlZ2dlciA8c3JvbGFuZEB2bXdhcmUuY29tPgpUaGF0IHNhaWQs
IHRoZXkgd2VyZSBhbHJlYWR5IHNpZ25lZCBvZmYgYnkgWmFjaywgc28gbm90IHN1cmUgd2hhdApo
YXBwZW5lZCBoZXJlLgoKUm9sYW5kCgpPbiAwMy4wMy4yMSAxNDo0MiwgTGVlIEpvbmVzIHdyb3Rl
Ogo+IFRoaXMgaXMgYSByZXNlbmQuICBBbGwgb2YgdGhlc2UgcGF0Y2hlcyBoYXZlIGJlZW4gc2Vu
dCBiZWZvcmUuCj4gCj4gVGhlIHZtd2dmeCBvbmVzIHdlcmUgZXZlbiBhcHBsaWVkLCBidXQgd2Vy
ZSBkcm9wcGVkIGZvciBzb21lIHJlYXNvbi4KPiAKPiBMZWUgSm9uZXMgKDUzKToKPiAgIGRybS9u
b3V2ZWF1L252a20vc3ViZGV2L2Jpb3MvaW5pdDogRGVtb3RlIG9idmlvdXMgYWJ1c2Ugb2Yga2Vy
bmVsLWRvYwo+ICAgZHJtL25vdXZlYXUvZGlzcG52NTAvZGlzcDogUmVtb3ZlIHVudXNlZCB2YXJp
YWJsZSAncmV0Jwo+ICAgZHJtL21zbS9kcC9kcF9kaXNwbGF5OiBSZW1vdmUgdW51c2VkIHZhcmlh
YmxlICdocGQnCj4gICBkcm0vYW1kL2Rpc3BsYXkvZGMvYmlvcy9jb21tYW5kX3RhYmxlOiBSZW1v
dmUgdW51c2VkIHZhcmlhYmxlCj4gICBpbmNsdWRlOiBkcm06IGRybV9hdG9taWM6IE1ha2UgdXNl
IG9mICduZXdfcGxhbmVfc3RhdGUnCj4gICBkcm0vbm91dmVhdS9udmttL3N1YmRldi92b2x0L2dr
MjBhOiBEZW1vdGUgbm9uLWNvbmZvcm1hbnQga2VybmVsLWRvYwo+ICAgICBoZWFkZXJzCj4gICBk
cm0vYW1kL2Rpc3BsYXkvZGMvYmlvcy9jb21tYW5kX3RhYmxlOiBSZW1vdmUgdW51c2VkIHZhcmlh
YmxlIGFuZAo+ICAgICBhc3NvY2lhdGVkIGNvbW1lbnQKPiAgIGRybS9hbWQvZGlzcGxheS9kYy9j
YWxjcy9kY2VfY2FsY3M6IE1vdmUgc29tZSBsYXJnZSB2YXJpYWJsZXMgZnJvbSB0aGUKPiAgICAg
c3RhY2sgdG8gdGhlIGhlYXAKPiAgIGRybS9hbWQvZGlzcGxheS9kYy9jYWxjcy9kY2VfY2FsY3M6
IFJlbW92ZSBzb21lIGxhcmdlIHZhcmlhYmxlcyBmcm9tCj4gICAgIHRoZSBzdGFjawo+ICAgZHJt
L2FtZC9kaXNwbGF5L2RjL2RjZS9kY2VfYXV4OiBSZW1vdmUgZHVwbGljYXRlIGxpbmUgY2F1c2lu
ZyAnZmllbGQKPiAgICAgb3ZlcndyaXR0ZW4nIGlzc3VlCj4gICBkcm0vYW1kL2Rpc3BsYXkvZGMv
ZGNlODAvZGNlODBfcmVzb3VyY2U6IE1ha2UgbG9jYWwgZnVuY3Rpb25zIHN0YXRpYwo+ICAgZHJt
L25vdXZlYXUvbnZrbS9lbmdpbmUvZ3IvZ2YxMDA6IERlbW90ZSBub24tY29uZm9ybWFudCBrZXJu
ZWwtZG9jCj4gICAgIGhlYWRlcgo+ICAgZHJtL25vdXZlYXUvbm91dmVhdV9ibzogUmVtb3ZlIHVu
dXNlZCB2YXJpYWJsZXMgJ2RldicKPiAgIGRybS9ub3V2ZWF1L25vdXZlYXVfZGlzcGxheTogUmVt
b3ZlIHNldCBidXQgdW51c2VkIHZhcmlhYmxlICd3aWR0aCcKPiAgIGRybS9ub3V2ZWF1L2Rpc3Bu
djA0L2NydGM6IERlbW90ZSBub24tY29uZm9ybWluZyBrZXJuZWwtZG9jIGhlYWRlcnMKPiAgIGRy
bS9ub3V2ZWF1L2Rpc3BudjUwL2Rpc3A6IFJlbW92ZSB1bnVzZWQgdmFyaWFibGUgJ3JldCcgZnJv
bSBmdW5jdGlvbgo+ICAgICByZXR1cm5pbmcgdm9pZAo+ICAgZHJtL25vdXZlYXUvZGlzcG52NTAv
aGVhZGM1N2Q6IE1ha2UgbG9jYWwgZnVuY3Rpb24gJ2hlYWRjNTdkX29sdXQnCj4gICAgIHN0YXRp
Ywo+ICAgZHJtL25vdXZlYXUvbnY1MF9kaXNwbGF5OiBSZW1vdmUgc3VwZXJmbHVvdXMgcHJvdG90
eXBlIGZvciBsb2NhbAo+ICAgICBzdGF0aWMgZnVuY3Rpb25zCj4gICBkcm0vbm91dmVhdS9kaXNw
bnY1MC9kaXNwOiBJbmNsdWRlIGhlYWRlciBjb250YWluaW5nIG91ciBwcm90b3R5cGVzCj4gICBk
cm0vbm91dmVhdS9ub3V2ZWF1X2lvYzMyOiBGaWxlIGhlYWRlcnMgYXJlIG5vdCBnb29kIGNhbmRp
ZGF0ZXMgZm9yCj4gICAgIGtlcm5lbC1kb2MKPiAgIGRybS9ub3V2ZWF1L25vdXZlYXVfc3ZtOiBS
ZW1vdmUgdW51c2VkIHZhcmlhYmxlICdyZXQnIGZyb20gdm9pZAo+ICAgICBmdW5jdGlvbgo+ICAg
ZHJtL25vdXZlYXUvbm91dmVhdV9pb2MzMjogRGVtb3RlIGtlcm5lbC1kb2MgYWJ1c2UgdG8gc3Rh
bmRhcmQgY29tbWVudAo+ICAgICBibG9jawo+ICAgZHJtL3Ztd2dmeC92bXdnZnhfZXhlY2J1Zjog
Rml4IHNvbWUga2VybmVsLWRvYyByZWxhdGVkIGlzc3Vlcwo+ICAgZHJtL3Ztd2dmeC92bXdnZnhf
a21zOiBSZW1vdmUgdW51c2VkIHZhcmlhYmxlICdyZXQnIGZyb20KPiAgICAgJ3Ztd19kdV9wcmlt
YXJ5X3BsYW5lX2F0b21pY19jaGVjaygpJwo+ICAgZHJtL3Ztd2dmeC92bXdnZnhfa21zOiBNYXJr
IHZtd197Y3Vyc29yLHByaW1hcnl9X3BsYW5lX2Zvcm1hdHMgYXMKPiAgICAgX19tYXliZV91bnVz
ZWQKPiAgIGRybS92bXdnZngvdm13Z2Z4X2RydjogRml4IHNvbWUga2VybmVsLWRvYyBtaXNkZW1l
YW5vdXJzCj4gICBkcm0vdm13Z2Z4L3Ztd2dmeF9pb2N0bDogUHJvdmlkZSBtaXNzaW5nICdAJyBz
aWduIHJlcXVpcmVkIGJ5Cj4gICAgIGtlcm5lbC1kb2MKPiAgIGRybS92bXdnZngvdm13Z2Z4X3Jl
c291cmNlOiBGaXggd29ydGh5IGZ1bmN0aW9uIGhlYWRlcnMgZGVtb3RlIHNvbWUKPiAgICAgb3Ro
ZXJzCj4gICBkcm0vdm13Z2Z4L3Ztd2dmeF90dG1fYnVmZmVyOiBTdXBwbHkgc29tZSBtaXNzaW5n
IHBhcmFtZXRlcgo+ICAgICBkZXNjcmlwdGlvbnMKPiAgIGRybS92bXdnZngvdm13Z2Z4X2ZpZm86
IERlbW90ZSBub24tY29uZm9ybWFudCBrZXJuZWwtZG9jIGhlYWRlcgo+ICAgZHJtL3Ztd2dmeC92
bXdnZnhfbGR1OiBTdXBwbHkgZGVzY3JpcHRpb25zIGZvciAnc3RhdGUnIGZ1bmN0aW9uCj4gICAg
IHBhcmFtZXRlcgo+ICAgZHJtL3Ztd2dmeC92bXdnZnhfa21zOiBVcGRhdGUgd29ydGh5IGZ1bmN0
aW9uIGhlYWRlcnMgYW5kIGRlbW90ZQo+ICAgICBvdGhlcnMKPiAgIGRybS92bXdnZngvdm13Z2Z4
X292ZXJsYXk6IERlbW90ZSBrZXJuZWwtZG9jIGFidXNlcyB0byBzdGFuZGFyZAo+ICAgICBjb21t
ZW50IGJsb2Nrcwo+ICAgZHJtL3Ztd2dmeC92bXdnZnhfZmVuY2U6IEFkZCwgcmVtb3ZlIGFuZCBk
ZW1vdGUgdmFyaW91cyBkb2N1bWVudGF0aW9uCj4gICAgIHBhcmFtcy9oZWFkZXJzCj4gICBkcm0v
dm13Z2Z4L3Ztd2dmeF9ibzogUmVtb3ZlIHN1cGVyZmx1b3VzIHBhcmFtIGRlc2NyaXB0aW9uIGFu
ZCBzdXBwbHkKPiAgICAgYW5vdGhlcgo+ICAgZHJtL3Ztd2dmeC92bXdnZnhfY29udGV4dDogRGVt
b3RlIGtlcm5lbC1kb2MgYWJ1c2VzCj4gICBkcm0vdm13Z2Z4L3Ztd2dmeF9zY3JuOiBEZW1vdGUg
dW53b3J0aHkga2VybmVsLWRvYyBoZWFkZXJzIGFuZCB1cGRhdGUKPiAgICAgb3RoZXJzCj4gICBk
cm0vdm13Z2Z4L3Ztd2dmeF9zdXJmYWNlOiBGaXggc29tZSBrZXJuZWwtZG9jIHJlbGF0ZWQgaXNz
dWVzCj4gICBkcm0vdm13Z2Z4L3Ztd2dmeF9jbWRidWZfcmVzOiBSZW5hbWUgcGFyYW0gZGVzY3Jp
cHRpb24gYW5kIHJlbW92ZQo+ICAgICBhbm90aGVyCj4gICBkcm0vdm13Z2Z4L3Ztd2dmeF9zaGFk
ZXI6IERlbW90ZSBrZXJuZWwtZG9jIGFidXNlcyBhbmQgZml4LXVwIHdvcnRoeQo+ICAgICBoZWFk
ZXJzCj4gICBkcm0vdm13Z2Z4L3Ztd2dmeF9jbWRidWY6IEZpeCBhIGJ1bmNoIG9mIG1pc3Npbmcg
b3IgaW5jb3JyZWN0bHkKPiAgICAgZm9ybWF0dGVkL25hbWVkIHBhcmFtcwo+ICAgZHJtL3Ztd2dm
eC92bXdnZnhfY21kYnVmX3JlczogUmVtb3ZlIHVudXNlZCB2YXJpYWJsZSAncmV0Jwo+ICAgZHJt
L3Ztd2dmeC92bXdnZnhfc3RkdTogQWRkIHNvbWUgbWlzc2luZyBwYXJhbS9tZW1iZXIgZGVzY3Jp
cHRpb25zCj4gICBkcm0vdm13Z2Z4L3Ztd2dmeF9jbWRidWY6IEZpeCBtaXNuYW1pbmcgb2YgJ2hl
YWRlcnMnIHNob3VsZCBiZSBwbHVyYWwKPiAgIGRybS92bXdnZngvdm13Z2Z4X2NvdGFibGU6IEZp
eCBhIGNvdXBsZSBvZiBzaW1wbGUgZG9jdW1lbnRhdGlvbgo+ICAgICBwcm9ibGVtcwo+ICAgZHJt
L3Ztd2dmeC92bXdnZnhfc286IEFkZCBkZXNjcmlwdGlvbiBmb3IgJ3Ztd192aWV3J3MgJ3JjdScg
bWVtYmVyCj4gICBkcm0vdm13Z2Z4L3Ztd2dmeF9iaW5kaW5nOiBQcm92aWRlIHNvbWUgbWlzc2lu
ZyBwYXJhbSBkZXNjcmlwdGlvbnMgYW5kCj4gICAgIHJlbW92ZSBvdGhlcnMKPiAgIGRybS92bXdn
Zngvdm13Z2Z4X21zZzogRml4IG1pc3NwZWxsaW5nIG9mICdtc2cnCj4gICBkcm0vdm13Z2Z4L3Zt
d2dmeF9ibGl0OiBBZGQgZGVzY3JpcHRpb24gZm9yICd2bXdfYm9fY3B1X2JsaXQncyAnZGlmZicK
PiAgICAgcGFyYW0KPiAgIGRybS92bXdnZngvdm13Z2Z4X3ZhbGlkYXRpb246IEFkZCBzb21lIG1p
c3Npbmcgc3RydWN0IG1lbWJlci9mdW5jdGlvbgo+ICAgICBwYXJhbSBkZXNjcmlwdGlvbnMKPiAg
IGRybS92bXdnZngvdHRtX29iamVjdDogRGVtb3RlIGhhbGYtYXNzZWQgaGVhZGVycyBhbmQgZml4
LXVwIGFub3RoZXIKPiAgIGRybS92bXdnZngvdm13Z2Z4X3RocDogQWRkIGRlc2NyaXB0aW9uIGZv
ciAndm13X3RocF9tYW5hZ2VyJ3MgbWVtYmVyCj4gICAgICdtYW5hZ2VyJwo+ICAgZHJtL3Ztd2dm
eC90dG1fb2JqZWN0OiBSZW9yZGVyIGhlYWRlciB0byBpbW1lZGlhdGVseSBwcmVjZWRlIGl0cwo+
ICAgICBzdHJ1Y3QKPiAKPiAgLi4uL2RybS9hbWQvZGlzcGxheS9kYy9iaW9zL2NvbW1hbmRfdGFi
bGUuYyAgIHwgICAxNiArLQo+ICAuLi4vZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9jYWxjcy9kY2Vf
Y2FsY3MuYyAgfCAxMTUxICsrKysrKysrKy0tLS0tLS0tCj4gIGRyaXZlcnMvZ3B1L2RybS9hbWQv
ZGlzcGxheS9kYy9kY2UvZGNlX2F1eC5oICB8ICAgIDEgLQo+ICAuLi4vZHJtL2FtZC9kaXNwbGF5
L2RjL2RjZTgwL2RjZTgwX3Jlc291cmNlLmMgfCAgIDE2ICstCj4gIGRyaXZlcnMvZ3B1L2RybS9t
c20vZHAvZHBfZGlzcGxheS5jICAgICAgICAgICB8ICAgIDMgLQo+ICBkcml2ZXJzL2dwdS9kcm0v
bm91dmVhdS9kaXNwbnYwNC9jcnRjLmMgICAgICAgfCAgICA0ICstCj4gIGRyaXZlcnMvZ3B1L2Ry
bS9ub3V2ZWF1L2Rpc3BudjUwL2Rpc3AuYyAgICAgICB8ICAgMTAgKy0KPiAgZHJpdmVycy9ncHUv
ZHJtL25vdXZlYXUvZGlzcG52NTAvaGVhZGM1N2QuYyAgIHwgICAgMiArLQo+ICBkcml2ZXJzL2dw
dS9kcm0vbm91dmVhdS9ub3V2ZWF1X2JvLmMgICAgICAgICAgfCAgICA0IC0KPiAgZHJpdmVycy9n
cHUvZHJtL25vdXZlYXUvbm91dmVhdV9kaXNwbGF5LmMgICAgIHwgICAgOCArLQo+ICBkcml2ZXJz
L2dwdS9kcm0vbm91dmVhdS9ub3V2ZWF1X2lvYzMyLmMgICAgICAgfCAgICA0ICstCj4gIGRyaXZl
cnMvZ3B1L2RybS9ub3V2ZWF1L25vdXZlYXVfc3ZtLmMgICAgICAgICB8ICAgIDUgKy0KPiAgZHJp
dmVycy9ncHUvZHJtL25vdXZlYXUvbnY1MF9kaXNwbGF5LmggICAgICAgIHwgICAgMyAtCj4gIC4u
Li9ncHUvZHJtL25vdXZlYXUvbnZrbS9lbmdpbmUvZ3IvZ2YxMDAuYyAgICB8ICAgIDIgKy0KPiAg
Li4uL2dwdS9kcm0vbm91dmVhdS9udmttL3N1YmRldi9iaW9zL2luaXQuYyAgIHwgIDIwNCArLS0K
PiAgLi4uL2dwdS9kcm0vbm91dmVhdS9udmttL3N1YmRldi92b2x0L2drMjBhLmMgIHwgICAgNCAr
LQo+ICBkcml2ZXJzL2dwdS9kcm0vdm13Z2Z4L3R0bV9vYmplY3QuYyAgICAgICAgICAgfCAgIDI1
ICstCj4gIGRyaXZlcnMvZ3B1L2RybS92bXdnZngvdm13Z2Z4X2JpbmRpbmcuYyAgICAgICB8ICAg
IDkgKy0KPiAgZHJpdmVycy9ncHUvZHJtL3Ztd2dmeC92bXdnZnhfYmxpdC5jICAgICAgICAgIHwg
ICAgMSArCj4gIGRyaXZlcnMvZ3B1L2RybS92bXdnZngvdm13Z2Z4X2JvLmMgICAgICAgICAgICB8
ICAgIDIgKy0KPiAgZHJpdmVycy9ncHUvZHJtL3Ztd2dmeC92bXdnZnhfY21kLmMgICAgICAgICAg
IHwgICAgMiArLQo+ICBkcml2ZXJzL2dwdS9kcm0vdm13Z2Z4L3Ztd2dmeF9jbWRidWYuYyAgICAg
ICAgfCAgIDE0ICstCj4gIGRyaXZlcnMvZ3B1L2RybS92bXdnZngvdm13Z2Z4X2NtZGJ1Zl9yZXMu
YyAgICB8ICAgIDggKy0KPiAgZHJpdmVycy9ncHUvZHJtL3Ztd2dmeC92bXdnZnhfY29udGV4dC5j
ICAgICAgIHwgICAgNiArLQo+ICBkcml2ZXJzL2dwdS9kcm0vdm13Z2Z4L3Ztd2dmeF9jb3RhYmxl
LmMgICAgICAgfCAgICAzICstCj4gIGRyaXZlcnMvZ3B1L2RybS92bXdnZngvdm13Z2Z4X2Rydi5j
ICAgICAgICAgICB8ICAgIDggKy0KPiAgZHJpdmVycy9ncHUvZHJtL3Ztd2dmeC92bXdnZnhfZXhl
Y2J1Zi5jICAgICAgIHwgICAyMCArLQo+ICBkcml2ZXJzL2dwdS9kcm0vdm13Z2Z4L3Ztd2dmeF9m
ZW5jZS5jICAgICAgICAgfCAgIDE4ICstCj4gIGRyaXZlcnMvZ3B1L2RybS92bXdnZngvdm13Z2Z4
X2lvY3RsLmMgICAgICAgICB8ICAgIDIgKy0KPiAgZHJpdmVycy9ncHUvZHJtL3Ztd2dmeC92bXdn
Znhfa21zLmMgICAgICAgICAgIHwgICAxNiArLQo+ICBkcml2ZXJzL2dwdS9kcm0vdm13Z2Z4L3Zt
d2dmeF9rbXMuaCAgICAgICAgICAgfCAgICA0ICstCj4gIGRyaXZlcnMvZ3B1L2RybS92bXdnZngv
dm13Z2Z4X2xkdS5jICAgICAgICAgICB8ICAgIDQgKy0KPiAgZHJpdmVycy9ncHUvZHJtL3Ztd2dm
eC92bXdnZnhfbXNnLmMgICAgICAgICAgIHwgICAgMiArLQo+ICBkcml2ZXJzL2dwdS9kcm0vdm13
Z2Z4L3Ztd2dmeF9vdmVybGF5LmMgICAgICAgfCAgIDE2ICstCj4gIGRyaXZlcnMvZ3B1L2RybS92
bXdnZngvdm13Z2Z4X3Jlc291cmNlLmMgICAgICB8ICAgMTAgKy0KPiAgZHJpdmVycy9ncHUvZHJt
L3Ztd2dmeC92bXdnZnhfc2Nybi5jICAgICAgICAgIHwgICAxMCArLQo+ICBkcml2ZXJzL2dwdS9k
cm0vdm13Z2Z4L3Ztd2dmeF9zaGFkZXIuYyAgICAgICAgfCAgIDEwICstCj4gIGRyaXZlcnMvZ3B1
L2RybS92bXdnZngvdm13Z2Z4X3NvLmMgICAgICAgICAgICB8ICAgIDEgKwo+ICBkcml2ZXJzL2dw
dS9kcm0vdm13Z2Z4L3Ztd2dmeF9zdGR1LmMgICAgICAgICAgfCAgICA5ICstCj4gIGRyaXZlcnMv
Z3B1L2RybS92bXdnZngvdm13Z2Z4X3N1cmZhY2UuYyAgICAgICB8ICAgMTcgKy0KPiAgZHJpdmVy
cy9ncHUvZHJtL3Ztd2dmeC92bXdnZnhfdGhwLmMgICAgICAgICAgIHwgICAgMSArCj4gIGRyaXZl
cnMvZ3B1L2RybS92bXdnZngvdm13Z2Z4X3R0bV9idWZmZXIuYyAgICB8ICAgIDIgKwo+ICBkcml2
ZXJzL2dwdS9kcm0vdm13Z2Z4L3Ztd2dmeF92YWxpZGF0aW9uLmMgICAgfCAgICA1ICstCj4gIGlu
Y2x1ZGUvZHJtL2RybV9hdG9taWMuaCAgICAgICAgICAgICAgICAgICAgICB8ICAgIDMgKy0KPiAg
NDQgZmlsZXMgY2hhbmdlZCwgODE4IGluc2VydGlvbnMoKyksIDg0NyBkZWxldGlvbnMoLSkKPiAK
PiBDYzogQWxleCBEZXVjaGVyIDxhbGV4YW5kZXIuZGV1Y2hlckBhbWQuY29tPgo+IENjOiBhbWQt
Z2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwo+IENjOiBBbnRob255IEtvbyA8QW50aG9ueS5Lb29A
YW1kLmNvbT4KPiBDYzogQmVuIFNrZWdncyA8YnNrZWdnc0ByZWRoYXQuY29tPgo+IENjOiAiQ2hy
aXN0aWFuIEvDtm5pZyIgPGNocmlzdGlhbi5rb2VuaWdAYW1kLmNvbT4KPiBDYzogQ29saW4gSWFu
IEtpbmcgPGNvbGluLmtpbmdAY2Fub25pY2FsLmNvbT4KPiBDYzogRGFuaWVsIFZldHRlciA8ZGFu
aWVsQGZmd2xsLmNoPgo+IENjOiBEYXZlIEFpcmxpZSA8YWlybGllZEByZWRoYXQuY29tPgo+IENj
OiBEYXZpZCBBaXJsaWUgPGFpcmxpZWRAbGludXguaWU+Cj4gQ2M6IGRyaS1kZXZlbEBsaXN0cy5m
cmVlZGVza3RvcC5vcmcKPiBDYzogZnJlZWRyZW5vQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwo+IENj
OiBIYXJyeSBXZW50bGFuZCA8aGFycnkud2VudGxhbmRAYW1kLmNvbT4KPiBDYzogSmVyZW15IEtv
bGIgPGprb2xiQGJyYW5kZWlzLmVkdT4KPiBDYzogS3VvZ2VlIEhzaWVoIDxraHNpZWhAY29kZWF1
cm9yYS5vcmc+Cj4gQ2M6IExlZSBKb25lcyA8bGVlLmpvbmVzQGxpbmFyby5vcmc+Cj4gQ2M6IExl
byBMaSA8c3VucGVuZy5saUBhbWQuY29tPgo+IENjOiBsaW5hcm8tbW0tc2lnQGxpc3RzLmxpbmFy
by5vcmcKPiBDYzogbGludXgtYXJtLW1zbUB2Z2VyLmtlcm5lbC5vcmcKPiBDYzogbGludXgtbWVk
aWFAdmdlci5rZXJuZWwub3JnCj4gQ2M6IEx5dWRlIFBhdWwgPGx5dWRlQHJlZGhhdC5jb20+Cj4g
Q2M6IE1hYXJ0ZW4gTGFua2hvcnN0IDxtYWFydGVuLmxhbmtob3JzdEBsaW51eC5pbnRlbC5jb20+
Cj4gQ2M6IE1heGltZSBSaXBhcmQgPG1yaXBhcmRAa2VybmVsLm9yZz4KPiBDYzogbm91dmVhdUBs
aXN0cy5mcmVlZGVza3RvcC5vcmcKPiBDYzogUWluZ2xhbmcgTWlhbyA8bWlhb3FpbmdsYW5nQGh1
YXdlaS5jb20+Cj4gQ2M6IFJvYiBDbGFyayA8cm9iLmNsYXJrQGxpbmFyby5vcmc+Cj4gQ2M6IFJv
YiBDbGFyayA8cm9iZGNsYXJrQGdtYWlsLmNvbT4KPiBDYzogUm9sYW5kIFNjaGVpZGVnZ2VyIDxz
cm9sYW5kQHZtd2FyZS5jb20+Cj4gQ2M6IFNlYW4gUGF1bCA8c2VhbkBwb29ybHkucnVuPgo+IENj
OiBTdW1pdCBTZW13YWwgPHN1bWl0LnNlbXdhbEBsaW5hcm8ub3JnPgo+IENjOiBUaG9tYXMgWmlt
bWVybWFubiA8dHppbW1lcm1hbm5Ac3VzZS5kZT4KPiBDYzogVk13YXJlIEdyYXBoaWNzIDxsaW51
eC1ncmFwaGljcy1tYWludGFpbmVyQHZtd2FyZS5jb20+Cj4gQ2M6IFphY2sgUnVzaW4gPHphY2ty
QHZtd2FyZS5jb20+Cj4gCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpOb3V2ZWF1IG1haWxpbmcgbGlzdApOb3V2ZWF1QGxpc3RzLmZyZWVkZXNrdG9wLm9y
ZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK
