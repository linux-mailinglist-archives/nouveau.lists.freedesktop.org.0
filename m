Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DEC48356B24
	for <lists+nouveau@lfdr.de>; Wed,  7 Apr 2021 13:26:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE63C6E905;
	Wed,  7 Apr 2021 11:26:07 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2075.outbound.protection.outlook.com [40.107.220.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4DD266E0C8;
 Wed,  7 Apr 2021 11:26:06 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JG0TlfqfK8bjEUM+Wm2KTJzwGebWIEh0KiimSTbTb7vxKfXz9qUo0NYZnGy0Ntj+DjVVr/U/UQ0g+hz7OHSFnOjM7fxJA0yxllO7tm7RZk9yOLCtgdWYSUJWFNczu/ZYWBqUUXR/b5t9NIpKvktTfSb5uO+qZbOJatiEQBmoq2QM+icoTWp4zx7ByJOPp+uKmyCODGcHBDR/ipTbVT28V3hqXjQbG9y8/4KLTQwdOUZqGQf0UAsgkOlVojGZMiRSvgt+tPZSyEDwx8jzp5Bt6jmKR0cTarG+30Kv1pixG1xs+gb3/7vMYe/E285cxwOHDG4BvMfm6NglwsedD/+i4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nobi6Pp8j7FfwKe0KHDMKWIcBcqVJF3AkVlyanBTuC8=;
 b=l02Ea3dQAUC7neynmZJ5hXL21IfJAhwSEUkwK+JTvjJlEvgF+9BFyr/8JsqVI24qApTK6gdrnseISpNgSvDXI0L6gAZH2SbYuNrPizoJ91LD95M+EA275i3fi+bT1Wkt/iu3xj3bxq9DDoOLXtsEbmZOrOOnAzR3Z9RsqB6q4mUKDqBtU49LDVe0aR6znJmtj0h+yoHFp0BokmX/d37LzMc4czMUDQhy2pV93sM8olLTX925/vschL80PZZZ57GrXpeUyqi8dc6pJIxlP5w3eL62LbeAbJh8pfP0Df01ymtVrAGelCswc3EK+zk2sAnrctr+mUNQJs+yPLBBI6t2PQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nobi6Pp8j7FfwKe0KHDMKWIcBcqVJF3AkVlyanBTuC8=;
 b=JTRdPGwty1p3cJRFWmZCf674Tfy0DK2TljAO4/qSPPxmwsf89OfIt0KX2VZifGCgocnnPLxmpxrkKqcA6b27zFyoXbN5aV9QxPOwOs1HI7FLD2mTy8uj0G811DGQghMO/9XdSceTM6qbvwVhV6mu476TeTf1/5AsFAc94Qt99Wk=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by MN2PR12MB4222.namprd12.prod.outlook.com (2603:10b6:208:19a::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4020.18; Wed, 7 Apr
 2021 11:26:01 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::6d4d:4674:1cf6:8d34]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::6d4d:4674:1cf6:8d34%6]) with mapi id 15.20.4020.017; Wed, 7 Apr 2021
 11:26:01 +0000
To: Felix Kuehling <felix.kuehling@amd.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, alexander.deucher@amd.com,
 airlied@linux.ie, daniel@ffwll.ch, bskeggs@redhat.com, ray.huang@amd.com,
 linux-graphics-maintainer@vmware.com, sroland@vmware.com, zackr@vmware.com,
 shashank.sharma@amd.com, sam@ravnborg.org, emil.velikov@collabora.com,
 nirmoy.das@amd.com
References: <20210406090903.7019-1-tzimmermann@suse.de>
 <20210406090903.7019-4-tzimmermann@suse.de>
 <6b261dab-4a4d-f0c6-95c0-f720c7df12c1@amd.com>
 <b76d1922-c9a5-8533-657a-2c1149832347@suse.de>
 <9db18654-770f-459b-a89a-c57dc8a21bac@amd.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <573dca0f-d017-3614-5e4f-d8d0b6bc413f@amd.com>
Date: Wed, 7 Apr 2021 13:25:55 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
In-Reply-To: <9db18654-770f-459b-a89a-c57dc8a21bac@amd.com>
Content-Language: en-US
X-Originating-IP: [2a02:908:1252:fb60:c8cb:bea6:b85a:47d0]
X-ClientProxiedBy: FR0P281CA0055.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:49::15) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:c8cb:bea6:b85a:47d0]
 (2a02:908:1252:fb60:c8cb:bea6:b85a:47d0) by
 FR0P281CA0055.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:49::15) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4020.10 via Frontend Transport; Wed, 7 Apr 2021 11:25:59 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6321008d-83d6-4c80-0c22-08d8f9b7ec5f
X-MS-TrafficTypeDiagnostic: MN2PR12MB4222:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MN2PR12MB4222049FA98C4694A82B1DB283759@MN2PR12MB4222.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: z8LkTttBTJaU223uf/Tsw3uB9qKweC1i2eFuxdY/JwTJUDE5MDyvE9RCO/iqj/pWRg1DbdeC9tdWqGV1vNakmTmWJ+/9gWCBSPUTOsIrPnH/27PptVo97bj7bOzSILSDthR10K4wpmdWe5CJGoZtkqMzZxWJGflhnesCkIHTQRCsElr6Xf5ed0Rux8w2zPXs0Lx0yW6QVUeypuWQGMIcsxX/eGRX5yf9r6ZgxgRxeyQW3zGmMAlRTNEiXJVh/f0JolxQBLNNkrkNrBArE8z1MzTQDJrm9m7sshyimbPeeYg2HJ7NYtGgNhAGPGOBTY3bzSpcRnid36w8OqxjbIHAiVIDTWlIlD3aZqbkrJtmVThFyHCmlRljFJexSOEGduYuknF2l4SlPOKuBJFcpu5vo91bv5D4n7AkijnfYjUsheDBQ4bBhUQnL38dIq81CXEw++rQuqiFFOlyvCAxhqa1QtcH0vqOK5jInipXZp+VizorunxEq2MiGdpPQGoegE4rfaQ3/KOM+f76mSXcqHjHsQwfB0YjvIu/EXul57xJOsQeG/24qGfXDoh8Ga3uc5FKFaXGPZ8sTg3QMUtd6LZhkHRGv9m1BB22e8LOIeYGA1YRAyoE5/G+kGf7ThIbXrrUZNhiPioFzUcOxFqRfTF0P9XFyD0g+B3F4lwckyhYv4B/OMnHWkGYArfyu75T51dzn3oJabb7WNnPoIY1KCaZ25S2LdBY87+c+/2H/MF90iptfKCs7jYFvrtQEUjXjNzFAy1e3OcAMhoXzzgWHCJfFw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39860400002)(346002)(396003)(376002)(136003)(366004)(16526019)(186003)(31686004)(7416002)(83380400001)(31696002)(4326008)(66556008)(66946007)(66476007)(5660300002)(66574015)(6666004)(30864003)(2906002)(36756003)(86362001)(478600001)(52116002)(8936002)(6636002)(8676002)(110136005)(2616005)(921005)(316002)(6486002)(966005)(38100700001)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?STVRZHBqSGI0V1dybURiOGczS0hGU3M4VGEyWDBIREN0MlpTVFFNcG5HK2Rv?=
 =?utf-8?B?L215Yk9hUDJRUitlWWUydEk5RTBTTUJuSmwzTHljcUJCMDNGMGFOTXh4L3JB?=
 =?utf-8?B?ZDFNQktCNkFvYWtGYWRLWjYxb2xQYmtoM0ZWQjV5RjdtbHZLcXZlNzdVNHY3?=
 =?utf-8?B?Y2x6NWhsVEtqOUpZbm12Z3g2M21GMDg2dnoyVmlUSkdubU5ScWxzT3lMMEdX?=
 =?utf-8?B?UHVna1ZZcWR0MGFPN29UK3JFbTF4YnRiaHJ3TEdxQlErYWtHcmtQQnVicDBU?=
 =?utf-8?B?UUFmeU9PUVhrU3IyakxPMnFEZzZIbjJ2cllFUGNhc1VObTdzS1JibDkwTHZI?=
 =?utf-8?B?clpvWVhtYyt5dVMrMkJNWEd1MGJyWk1TZmQxVklwU2tCZ1RULzhuaHoxVmVB?=
 =?utf-8?B?cml3NU5RZ05wNlpreSthaXdmS1NYa0J4RjgwVHFmNnpBVHZBYnhZM01NajJ1?=
 =?utf-8?B?MWxyNnVKZ1BseVRXNFNZbXk5ZEcxSm9OMW1NRWRqekFqSDNBckJiUHg3UVRs?=
 =?utf-8?B?OUpuK3NsenVtN2w2RU5yeittMUx6YWlCODJrZ3dQMFFxdEg5U2JvTGxkWFVH?=
 =?utf-8?B?STFCbG92aWtUN044Zzc1MjZCQWd1Y0Z4ZXpwSC9MME04SXdhcUYwY29jZHov?=
 =?utf-8?B?ZFlvUmY3T3g5YlMrblJGaFZWV2piUDZZekF6ZHR1UlEyU2FPQUxFVDQwRk5O?=
 =?utf-8?B?NjhQVHZHcFhyd1N3L0lveGFjNEprZnZicVlSUU1kNFcvS3lrd1B4TUQ2TzNo?=
 =?utf-8?B?K0lJUWxycURYdlBOa0g4UmtUY2lmbkhSM0UvQzM3Z0ZMRk5jeVJSRGs2eGpq?=
 =?utf-8?B?dm5sU0FMVWZFQWM4N2pQSENMZzE4UzhYQmJjL2pZclc5ZnI1SVFWUDBQSjdC?=
 =?utf-8?B?Uk0zUStlYzM1enNqWWVLREpJbGRIbjlsdU9DWm83bE52ZklEaE13TWxKRm9U?=
 =?utf-8?B?c2lXYUthOCtYVnp1QVB1YXFXSXJScnR1S2xyYW9LVlVTaWxZUmw0SnpuT0V4?=
 =?utf-8?B?c0F5dytvdS9zWHBDT1BNRDlFZmZ2QWF0enNMVXRCTUFhVjZSb3k4Mkk1YUdt?=
 =?utf-8?B?c2ZDOWdNQUhDNlZjcjVDN2h4aVc1L21NWkxpcXNlWjFTYmtZdXhhZ1ROYWh6?=
 =?utf-8?B?T3hDODZJME9WWjF6a0RUaHhzdVN1OUpTZTNhcDUrdVBoUXFOSUl3NkJidXh2?=
 =?utf-8?B?ZUVMZnl2Yjc3c1ZWelpVN0dFQTdNd3hKaHMyWThNbEFXeXJ1cWtidi9ia0hr?=
 =?utf-8?B?bnVNa1M4MnBmbXh2VXZhbHFEc3RWendaRTgxemhadCtOa1RyK0JBRGJTWnFy?=
 =?utf-8?B?WGl2K3BzNmw1aHRJS0JzWXV0RFpHUS9tZWdCNDBZUngrOE5XMEM2MHFvRUsv?=
 =?utf-8?B?UkJkMnZ2b0VOQVFYRTVTalowK0xZQlRCMklGK2JSSjFMQnBPRkkyN3NlU3l0?=
 =?utf-8?B?M293WjhiUHpSWTdvNWl6NUFraUZhMm5mejM2Y095djdIeWFRdHF4T3NoWXdW?=
 =?utf-8?B?S1JGcWNVYWVaT1N5Z3RWSkNQV3Y3bWNMeU9RdmxrZ3BKRTFZM3RLZ0grc2dx?=
 =?utf-8?B?OVhKV1V0OVdSR1pVQ3hJN0pRY0ZFWStiQ05LM0tvd0dvYkdwQVNIT0JybDhJ?=
 =?utf-8?B?dzNkeG1iMVgyNGtTb0VYcUg2NWtpcmw3d0lVMGNmNERyejgrL3NXaXZxbVdj?=
 =?utf-8?B?LzhORTZnSWFocGFoRmJibDZ1Zmk1YzE3YlBGckh3UjJWQjdNZ2ZFSUhPUEdn?=
 =?utf-8?B?ZjJoRHJ1aWE1YUcwNHorUjNENWd4eVVjekhiVEtJV0lsdytoRjkwNmhkNHEw?=
 =?utf-8?B?N3dqT0JSMTdobDRPZm5MaEJ4MUhBdGtxMlpTNVBSejJYekhMN3FBeUxOSVlX?=
 =?utf-8?Q?H88Ijzpioqg09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6321008d-83d6-4c80-0c22-08d8f9b7ec5f
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Apr 2021 11:26:01.8125 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EEcSQwnxhVa7/rEEBe7yVFxhFMpjK0ZDJ/4uj9IJ5Gn+4pmHmrTLlWGhHq5Jazmr
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4222
Subject: Re: [Nouveau] [PATCH 3/8] drm/amdgpu: Implement mmap as GEM object
 function
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

SGksCgpBbSAwNi4wNC4yMSB1bSAxNzoyNyBzY2hyaWViIEZlbGl4IEt1ZWhsaW5nOgo+IEFtIDIw
MjEtMDQtMDYgdW0gNjozOCBhLm0uIHNjaHJpZWIgVGhvbWFzIFppbW1lcm1hbm46Cj4+IEhpCj4+
Cj4+IEFtIDA2LjA0LjIxIHVtIDExOjM1IHNjaHJpZWIgQ2hyaXN0aWFuIEvDtm5pZzoKPj4+IEFt
IDA2LjA0LjIxIHVtIDExOjA4IHNjaHJpZWIgVGhvbWFzIFppbW1lcm1hbm46Cj4+Pj4gTW92aW5n
IHRoZSBkcml2ZXItc3BlY2lmaWMgbW1hcCBjb2RlIGludG8gYSBHRU0gb2JqZWN0IGZ1bmN0aW9u
IGFsbG93cwo+Pj4+IGZvciB1c2luZyBEUk0gaGVscGVycyBmb3IgdmFyaW91cyBtbWFwIGNhbGxi
YWNrcy4KPj4+Pgo+Pj4+IFRoaXMgY2hhbmdlIHJlc29sdmVzIHNldmVyYWwgaW5jb25zaXN0ZW5j
aWVzIGJldHdlZW4gcmVndWxhciBtbWFwIGFuZAo+Pj4+IHByaW1lLWJhc2VkIG1tYXAuIFRoZSB2
bV9vcHMgZmllbGQgaW4gdm1hIGlzIG5vdyBzZXQgZm9yIGFsbCBtbWFwJ2VkCj4+Pj4gYXJlYXMu
IFByZXZpb3VzbHkgaXQgd2F5IG9ubHkgc2V0IGZvciByZWd1bGFyIG1tYXAgY2FsbHMsIHByaW1l
LWJhc2VkCj4+Pj4gbW1hcCB1c2VkIFRUTSdzIGRlZmF1bHQgdm1fb3BzLiBUaGUgY2hlY2sgZm9y
IGtmZF9ibyBoYXMgYmVlbiB0YWtlbgo+Pj4+IGZyb20gYW1kZ3B1X3ZlcmlmeV9hY2Nlc3MoKSwg
d2hpY2ggaXMgbm90IGNhbGxlZCBhbnkgbG9uZ2VyIGFuZCBoYXMKPj4+PiBiZWVuIHJlbW92ZWQu
Cj4+Pj4KPj4+PiBBcyBhIHNpZGUgZWZmZWN0LCBhbWRncHVfdHRtX3ZtX29wcyBhbmQgYW1kZ3B1
X3R0bV9mYXVsdCgpIGFyZSBub3cKPj4+PiBpbXBsZW1lbnRlZCBpbiBhbWRncHUncyBHRU0gY29k
ZS4KPj4+Pgo+Pj4+IFNpZ25lZC1vZmYtYnk6IFRob21hcyBaaW1tZXJtYW5uIDx0emltbWVybWFu
bkBzdXNlLmRlPgo+Pj4+IC0tLQo+Pj4+ICDCoCBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9h
bWRncHVfZG1hX2J1Zi5jIHwgNDYgLS0tLS0tLS0tLS0tLQo+Pj4+ICDCoCBkcml2ZXJzL2dwdS9k
cm0vYW1kL2FtZGdwdS9hbWRncHVfZG1hX2J1Zi5oIHzCoCAyIC0KPj4+PiAgwqAgZHJpdmVycy9n
cHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2Rydi5jwqDCoMKgwqAgfMKgIDQgKy0KPj4+PiAgwqAg
ZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2dlbS5jwqDCoMKgwqAgfCA2NCArKysr
KysrKysrKysrKysrKysrCj4+Pj4gIMKgIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdw
dV90dG0uY8KgwqDCoMKgIHwgNzEKPj4+PiAtLS0tLS0tLS0tLS0tLS0tLS0tLS0KPj4+PiAgwqAg
ZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3R0bS5owqDCoMKgwqAgfMKgIDEgLQo+
Pj4+ICDCoCA2IGZpbGVzIGNoYW5nZWQsIDY2IGluc2VydGlvbnMoKyksIDEyMiBkZWxldGlvbnMo
LSkKPj4+Pgo+Pj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRn
cHVfZG1hX2J1Zi5jCj4+Pj4gYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZG1h
X2J1Zi5jCj4+Pj4gaW5kZXggZTBjNGY3YzdmMWI5Li4xOWM1YWIwOGQ5ZWMgMTAwNjQ0Cj4+Pj4g
LS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2RtYV9idWYuYwo+Pj4+ICsr
KyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9kbWFfYnVmLmMKPj4+PiBAQCAt
NDIsNTIgKzQyLDYgQEAKPj4+PiAgwqAgI2luY2x1ZGUgPGxpbnV4L3BjaS1wMnBkbWEuaD4KPj4+
PiAgwqAgI2luY2x1ZGUgPGxpbnV4L3BtX3J1bnRpbWUuaD4KPj4+PiAtLyoqCj4+Pj4gLSAqIGFt
ZGdwdV9nZW1fcHJpbWVfbW1hcCAtICZkcm1fZHJpdmVyLmdlbV9wcmltZV9tbWFwIGltcGxlbWVu
dGF0aW9uCj4+Pj4gLSAqIEBvYmo6IEdFTSBCTwo+Pj4+IC0gKiBAdm1hOiBWaXJ0dWFsIG1lbW9y
eSBhcmVhCj4+Pj4gLSAqCj4+Pj4gLSAqIFNldHMgdXAgYSB1c2Vyc3BhY2UgbWFwcGluZyBvZiB0
aGUgQk8ncyBtZW1vcnkgaW4gdGhlIGdpdmVuCj4+Pj4gLSAqIHZpcnR1YWwgbWVtb3J5IGFyZWEu
Cj4+Pj4gLSAqCj4+Pj4gLSAqIFJldHVybnM6Cj4+Pj4gLSAqIDAgb24gc3VjY2VzcyBvciBhIG5l
Z2F0aXZlIGVycm9yIGNvZGUgb24gZmFpbHVyZS4KPj4+PiAtICovCj4+Pj4gLWludCBhbWRncHVf
Z2VtX3ByaW1lX21tYXAoc3RydWN0IGRybV9nZW1fb2JqZWN0ICpvYmosCj4+Pj4gLcKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgIHN0cnVjdCB2bV9hcmVhX3N0cnVjdCAqdm1hKQo+Pj4+IC17Cj4+
Pj4gLcKgwqDCoCBzdHJ1Y3QgYW1kZ3B1X2JvICpibyA9IGdlbV90b19hbWRncHVfYm8ob2JqKTsK
Pj4+PiAtwqDCoMKgIHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2ID0gYW1kZ3B1X3R0bV9hZGV2
KGJvLT50Ym8uYmRldik7Cj4+Pj4gLcKgwqDCoCB1bnNpZ25lZCBhc2l6ZSA9IGFtZGdwdV9ib19z
aXplKGJvKTsKPj4+PiAtwqDCoMKgIGludCByZXQ7Cj4+Pj4gLQo+Pj4+IC3CoMKgwqAgaWYgKCF2
bWEtPnZtX2ZpbGUpCj4+Pj4gLcKgwqDCoMKgwqDCoMKgIHJldHVybiAtRU5PREVWOwo+Pj4+IC0K
Pj4+PiAtwqDCoMKgIGlmIChhZGV2ID09IE5VTEwpCj4+Pj4gLcKgwqDCoMKgwqDCoMKgIHJldHVy
biAtRU5PREVWOwo+Pj4+IC0KPj4+PiAtwqDCoMKgIC8qIENoZWNrIGZvciB2YWxpZCBzaXplLiAq
Lwo+Pj4+IC3CoMKgwqAgaWYgKGFzaXplIDwgdm1hLT52bV9lbmQgLSB2bWEtPnZtX3N0YXJ0KQo+
Pj4+IC3CoMKgwqDCoMKgwqDCoCByZXR1cm4gLUVJTlZBTDsKPj4+PiAtCj4+Pj4gLcKgwqDCoCBp
ZiAoYW1kZ3B1X3R0bV90dF9nZXRfdXNlcm1tKGJvLT50Ym8udHRtKSB8fAo+Pj4+IC3CoMKgwqDC
oMKgwqDCoCAoYm8tPmZsYWdzICYgQU1ER1BVX0dFTV9DUkVBVEVfTk9fQ1BVX0FDQ0VTUykpIHsK
Pj4+PiAtwqDCoMKgwqDCoMKgwqAgcmV0dXJuIC1FUEVSTTsKPj4+PiAtwqDCoMKgIH0KPj4+PiAt
wqDCoMKgIHZtYS0+dm1fcGdvZmYgKz0gYW1kZ3B1X2JvX21tYXBfb2Zmc2V0KGJvKSA+PiBQQUdF
X1NISUZUOwo+Pj4+IC0KPj4+PiAtwqDCoMKgIC8qIHByaW1lIG1tYXAgZG9lcyBub3QgbmVlZCB0
byBjaGVjayBhY2Nlc3MsIHNvIGFsbG93IGhlcmUgKi8KPj4+PiAtwqDCoMKgIHJldCA9IGRybV92
bWFfbm9kZV9hbGxvdygmb2JqLT52bWFfbm9kZSwKPj4+PiB2bWEtPnZtX2ZpbGUtPnByaXZhdGVf
ZGF0YSk7Cj4+Pj4gLcKgwqDCoCBpZiAocmV0KQo+Pj4+IC3CoMKgwqDCoMKgwqDCoCByZXR1cm4g
cmV0Owo+Pj4+IC0KPj4+PiAtwqDCoMKgIHJldCA9IHR0bV9ib19tbWFwKHZtYS0+dm1fZmlsZSwg
dm1hLCAmYWRldi0+bW1hbi5iZGV2KTsKPj4+PiAtwqDCoMKgIGRybV92bWFfbm9kZV9yZXZva2Uo
Jm9iai0+dm1hX25vZGUsIHZtYS0+dm1fZmlsZS0+cHJpdmF0ZV9kYXRhKTsKPj4+PiAtCj4+Pj4g
LcKgwqDCoCByZXR1cm4gcmV0Owo+Pj4+IC19Cj4+Pj4gLQo+Pj4+ICDCoCBzdGF0aWMgaW50Cj4+
Pj4gIMKgIF9fZG1hX3Jlc3ZfbWFrZV9leGNsdXNpdmUoc3RydWN0IGRtYV9yZXN2ICpvYmopCj4+
Pj4gIMKgIHsKPj4+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1k
Z3B1X2RtYV9idWYuaAo+Pj4+IGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2Rt
YV9idWYuaAo+Pj4+IGluZGV4IDM5YjViOTYxNmZkOC4uM2U5M2I5YjQwN2E5IDEwMDY0NAo+Pj4+
IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9kbWFfYnVmLmgKPj4+PiAr
KysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZG1hX2J1Zi5oCj4+Pj4gQEAg
LTMxLDggKzMxLDYgQEAgc3RydWN0IGRybV9nZW1fb2JqZWN0Cj4+Pj4gKmFtZGdwdV9nZW1fcHJp
bWVfaW1wb3J0KHN0cnVjdCBkcm1fZGV2aWNlICpkZXYsCj4+Pj4gIMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHN0cnVjdCBkbWFfYnVmICpkbWFfYnVm
KTsKPj4+PiAgwqAgYm9vbCBhbWRncHVfZG1hYnVmX2lzX3hnbWlfYWNjZXNzaWJsZShzdHJ1Y3Qg
YW1kZ3B1X2RldmljZSAqYWRldiwKPj4+PiAgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoCBzdHJ1Y3QgYW1kZ3B1X2JvICpibyk7Cj4+Pj4gLWludCBhbWRncHVf
Z2VtX3ByaW1lX21tYXAoc3RydWN0IGRybV9nZW1fb2JqZWN0ICpvYmosCj4+Pj4gLcKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgIHN0cnVjdCB2bV9hcmVhX3N0cnVjdCAqdm1hKTsKPj4+PiAgwqAg
ZXh0ZXJuIGNvbnN0IHN0cnVjdCBkbWFfYnVmX29wcyBhbWRncHVfZG1hYnVmX29wczsKPj4+PiBk
aWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2Rydi5jCj4+Pj4g
Yi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZHJ2LmMKPj4+PiBpbmRleCA3NmY0
OGY3OWM3MGIuLmU5NmQyNzU4ZjRiYiAxMDA2NDQKPj4+PiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0v
YW1kL2FtZGdwdS9hbWRncHVfZHJ2LmMKPj4+PiArKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Ft
ZGdwdS9hbWRncHVfZHJ2LmMKPj4+PiBAQCAtMTY1Niw3ICsxNjU2LDcgQEAgc3RhdGljIGNvbnN0
IHN0cnVjdCBmaWxlX29wZXJhdGlvbnMKPj4+PiBhbWRncHVfZHJpdmVyX2ttc19mb3BzID0gewo+
Pj4+ICDCoMKgwqDCoMKgIC5mbHVzaCA9IGFtZGdwdV9mbHVzaCwKPj4+PiAgwqDCoMKgwqDCoCAu
cmVsZWFzZSA9IGRybV9yZWxlYXNlLAo+Pj4+ICDCoMKgwqDCoMKgIC51bmxvY2tlZF9pb2N0bCA9
IGFtZGdwdV9kcm1faW9jdGwsCj4+Pj4gLcKgwqDCoCAubW1hcCA9IGFtZGdwdV9tbWFwLAo+Pj4+
ICvCoMKgwqAgLm1tYXAgPSBkcm1fZ2VtX21tYXAsCj4+Pj4gIMKgwqDCoMKgwqAgLnBvbGwgPSBk
cm1fcG9sbCwKPj4+PiAgwqDCoMKgwqDCoCAucmVhZCA9IGRybV9yZWFkLAo+Pj4+ICDCoCAjaWZk
ZWYgQ09ORklHX0NPTVBBVAo+Pj4+IEBAIC0xNzE5LDcgKzE3MTksNyBAQCBzdGF0aWMgY29uc3Qg
c3RydWN0IGRybV9kcml2ZXIKPj4+PiBhbWRncHVfa21zX2RyaXZlciA9IHsKPj4+PiAgwqDCoMKg
wqDCoCAucHJpbWVfaGFuZGxlX3RvX2ZkID0gZHJtX2dlbV9wcmltZV9oYW5kbGVfdG9fZmQsCj4+
Pj4gIMKgwqDCoMKgwqAgLnByaW1lX2ZkX3RvX2hhbmRsZSA9IGRybV9nZW1fcHJpbWVfZmRfdG9f
aGFuZGxlLAo+Pj4+ICDCoMKgwqDCoMKgIC5nZW1fcHJpbWVfaW1wb3J0ID0gYW1kZ3B1X2dlbV9w
cmltZV9pbXBvcnQsCj4+Pj4gLcKgwqDCoCAuZ2VtX3ByaW1lX21tYXAgPSBhbWRncHVfZ2VtX3By
aW1lX21tYXAsCj4+Pj4gK8KgwqDCoCAuZ2VtX3ByaW1lX21tYXAgPSBkcm1fZ2VtX3ByaW1lX21t
YXAsCj4+Pj4gIMKgwqDCoMKgwqAgLm5hbWUgPSBEUklWRVJfTkFNRSwKPj4+PiAgwqDCoMKgwqDC
oCAuZGVzYyA9IERSSVZFUl9ERVNDLAo+Pj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0v
YW1kL2FtZGdwdS9hbWRncHVfZ2VtLmMKPj4+PiBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1
L2FtZGdwdV9nZW0uYwo+Pj4+IGluZGV4IGZiNzE3MWU1NTA3Yy4uZmU5M2ZhYWQwNWYyIDEwMDY0
NAo+Pj4+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9nZW0uYwo+Pj4+
ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9nZW0uYwo+Pj4+IEBAIC00
MSw2ICs0MSwzNiBAQAo+Pj4+ICDCoCBzdGF0aWMgY29uc3Qgc3RydWN0IGRybV9nZW1fb2JqZWN0
X2Z1bmNzIGFtZGdwdV9nZW1fb2JqZWN0X2Z1bmNzOwo+Pj4+ICtzdGF0aWMgdm1fZmF1bHRfdCBh
bWRncHVfdHRtX2ZhdWx0KHN0cnVjdCB2bV9mYXVsdCAqdm1mKQo+Pj4gUGxlYXNlIG5hbWUgdGhh
dCBmdW5jdGlvbiBhbWRncHVfZ2VtX2ZhdWx0IG9yIGFtZGdwdV9nZW1fb2JqZWN0X2ZhdWx0Cj4+
Pgo+Pj4+ICt7Cj4+Pj4gK8KgwqDCoCBzdHJ1Y3QgdHRtX2J1ZmZlcl9vYmplY3QgKmJvID0gdm1m
LT52bWEtPnZtX3ByaXZhdGVfZGF0YTsKPj4+PiArwqDCoMKgIHZtX2ZhdWx0X3QgcmV0Owo+Pj4+
ICsKPj4+PiArwqDCoMKgIHJldCA9IHR0bV9ib192bV9yZXNlcnZlKGJvLCB2bWYpOwo+Pj4+ICvC
oMKgwqAgaWYgKHJldCkKPj4+PiArwqDCoMKgwqDCoMKgwqAgcmV0dXJuIHJldDsKPj4+PiArCj4+
Pj4gK8KgwqDCoCByZXQgPSBhbWRncHVfYm9fZmF1bHRfcmVzZXJ2ZV9ub3RpZnkoYm8pOwo+Pj4+
ICvCoMKgwqAgaWYgKHJldCkKPj4+PiArwqDCoMKgwqDCoMKgwqAgZ290byB1bmxvY2s7Cj4+Pj4g
Kwo+Pj4+ICvCoMKgwqAgcmV0ID0gdHRtX2JvX3ZtX2ZhdWx0X3Jlc2VydmVkKHZtZiwgdm1mLT52
bWEtPnZtX3BhZ2VfcHJvdCwKPj4+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqAgVFRNX0JPX1ZNX05VTV9QUkVGQVVMVCwgMSk7Cj4+Pj4gK8KgwqDCoCBpZiAo
cmV0ID09IFZNX0ZBVUxUX1JFVFJZICYmICEodm1mLT5mbGFncyAmCj4+Pj4gRkFVTFRfRkxBR19S
RVRSWV9OT1dBSVQpKQo+Pj4+ICvCoMKgwqDCoMKgwqDCoCByZXR1cm4gcmV0Owo+Pj4+ICsKPj4+
PiArdW5sb2NrOgo+Pj4+ICvCoMKgwqAgZG1hX3Jlc3ZfdW5sb2NrKGJvLT5iYXNlLnJlc3YpOwo+
Pj4+ICvCoMKgwqAgcmV0dXJuIHJldDsKPj4+PiArfQo+Pj4+ICsKPj4+PiArc3RhdGljIGNvbnN0
IHN0cnVjdCB2bV9vcGVyYXRpb25zX3N0cnVjdCBhbWRncHVfdHRtX3ZtX29wcyA9IHsKPj4+PiAr
wqDCoMKgIC5mYXVsdCA9IGFtZGdwdV90dG1fZmF1bHQsCj4+Pj4gK8KgwqDCoCAub3BlbiA9IHR0
bV9ib192bV9vcGVuLAo+Pj4+ICvCoMKgwqAgLmNsb3NlID0gdHRtX2JvX3ZtX2Nsb3NlLAo+Pj4+
ICvCoMKgwqAgLmFjY2VzcyA9IHR0bV9ib192bV9hY2Nlc3MKPj4+PiArfTsKPj4+PiArCj4+Pj4g
IMKgIHN0YXRpYyB2b2lkIGFtZGdwdV9nZW1fb2JqZWN0X2ZyZWUoc3RydWN0IGRybV9nZW1fb2Jq
ZWN0ICpnb2JqKQo+Pj4+ICDCoCB7Cj4+Pj4gIMKgwqDCoMKgwqAgc3RydWN0IGFtZGdwdV9ibyAq
cm9iaiA9IGdlbV90b19hbWRncHVfYm8oZ29iaik7Cj4+Pj4gQEAgLTIwMSw2ICsyMzEsMzggQEAg
c3RhdGljIHZvaWQgYW1kZ3B1X2dlbV9vYmplY3RfY2xvc2Uoc3RydWN0Cj4+Pj4gZHJtX2dlbV9v
YmplY3QgKm9iaiwKPj4+PiAgwqDCoMKgwqDCoCB0dG1fZXVfYmFja29mZl9yZXNlcnZhdGlvbigm
dGlja2V0LCAmbGlzdCk7Cj4+Pj4gIMKgIH0KPj4+PiArc3RhdGljIGludCBhbWRncHVfZ2VtX3By
aW1lX21tYXAoc3RydWN0IGRybV9nZW1fb2JqZWN0ICpvYmosIHN0cnVjdAo+Pj4+IHZtX2FyZWFf
c3RydWN0ICp2bWEpCj4+Pj4gK3sKPj4+PiArwqDCoMKgIHN0cnVjdCBhbWRncHVfYm8gKmJvID0g
Z2VtX3RvX2FtZGdwdV9ibyhvYmopOwo+Pj4+ICvCoMKgwqAgc3RydWN0IGFtZGdwdV9kZXZpY2Ug
KmFkZXYgPSBhbWRncHVfdHRtX2FkZXYoYm8tPnRiby5iZGV2KTsKPj4+PiArwqDCoMKgIHVuc2ln
bmVkIGxvbmcgYXNpemUgPSBhbWRncHVfYm9fc2l6ZShibyk7Cj4+Pj4gKwo+Pj4+ICvCoMKgwqAg
aWYgKCF2bWEtPnZtX2ZpbGUpCj4+Pj4gK8KgwqDCoMKgwqDCoMKgIHJldHVybiAtRU5PREVWOwo+
Pj4+ICsKPj4+PiArwqDCoMKgIGlmICghYWRldikKPj4+PiArwqDCoMKgwqDCoMKgwqAgcmV0dXJu
IC1FTk9ERVY7Cj4+Pj4gKwo+Pj4+ICvCoMKgwqAgLyogQ2hlY2sgZm9yIHZhbGlkIHNpemUuICov
Cj4+Pj4gK8KgwqDCoCBpZiAoYXNpemUgPCB2bWEtPnZtX2VuZCAtIHZtYS0+dm1fc3RhcnQpCj4+
Pj4gK8KgwqDCoMKgwqDCoMKgIHJldHVybiAtRUlOVkFMOwo+Pj4+ICsKPj4+PiArwqDCoMKgIC8q
Cj4+Pj4gK8KgwqDCoMKgICogRG9uJ3QgdmVyaWZ5IGFjY2VzcyBmb3IgS0ZEIEJPcy4gVGhleSBk
b24ndCBoYXZlIGEgR0VNCj4+Pj4gK8KgwqDCoMKgICogb2JqZWN0IGFzc29jaWF0ZWQgd2l0aCB0
aGVtLgo+Pj4+ICvCoMKgwqDCoCAqLwo+Pj4+ICvCoMKgwqAgaWYgKGJvLT5rZmRfYm8pCj4+Pj4g
K8KgwqDCoMKgwqDCoMKgIGdvdG8gb3V0Owo+Pj4gV2hvIGRvZXMgdGhlIGFjY2VzcyB2ZXJpZmlj
YXRpb24gbm93Pwo+PiBUaGlzIGlzIHNvbWV3aGF0IGNvbmZ1c2luZy4KPj4KPj4gSSB0b29rIHRo
aXMgY2hlY2sgYXMtaXMsIGluY2x1ZGluZyB0aGUgY29tbWVudCwgZnJvbSBhbWRncHUncwo+PiB2
ZXJpZnlfYWNjZXNzIGZ1bmN0aW9uLiBUaGUgdmVyaWZ5X2FjY2VzcyBmdW5jdGlvbiB3YXMgY2Fs
bGVkIGJ5Cj4+IHR0bV9ib19tbWFwLiBJdCByZXR1cm5lZCAwIGFuZCB0dG1fYm9fbW1hcCBkaWQg
dGhlIG1hcHBpbmcuCj4gVGhpcyBpcyBwcm9iYWJseSBhIGxlZnQtb3ZlciBmcm9tIHdoZW4gd2Ug
bWFwcGVkIEJPcyB1c2luZyAvZGV2L2tmZC4gV2UKPiBjaGFuZ2VkIHRoaXMgdG8gdXNlIC9kZXYv
ZHJpL3JlbmRlckQqIGEgbG9uZyB0aW1lIGFnbyB0byBmaXggQ1BVIG1hcHBpbmcKPiBpbnZhbGlk
YXRpb25zIG9uIG1lbW9yeSBldmljdGlvbnMuIEkgdGhpbmsgd2UgY2FuIGxldCBHRU0gZG8gdGhl
IGFjY2Vzcwo+IGNoZWNrLgoKT2ssIGdvb2QgdG8ga25vdy4KClRob21hcyBjYW4geW91IHJlbW92
ZSB0aGUgZXh0cmEgaGFuZGxpbmcgaW4gYSBzZXBhcmF0ZSBwcmVyZXF1aXNpdGUgcGF0Y2g/CgpJ
ZiBhbnlib2R5IHRoZW4gYmlzZWN0cyB0byB0aGlzIHBhdGNoIHdlIGF0IGxlYXN0IGtub3cgd2hh
dCB0byBkbyB0byBnZXQgCml0IHdvcmtpbmcgYWdhaW4uCgpSZWdhcmRzLApDaHJpc3RpYW4uCgo+
Cj4gUmVnYXJkcywKPiAgwqAgRmVsaXgKPgo+Cj4+PiBDaHJpc3RpYW4uCj4+Pgo+Pj4+ICsKPj4+
PiArwqDCoMKgIGlmIChhbWRncHVfdHRtX3R0X2dldF91c2VybW0oYm8tPnRiby50dG0pIHx8Cj4+
Pj4gK8KgwqDCoMKgwqDCoMKgIChiby0+ZmxhZ3MgJiBBTURHUFVfR0VNX0NSRUFURV9OT19DUFVf
QUNDRVNTKSkgewo+Pj4+ICvCoMKgwqDCoMKgwqDCoCByZXR1cm4gLUVQRVJNOwo+Pj4+ICvCoMKg
wqAgfQo+Pj4+ICsKPj4+PiArb3V0Ogo+Pj4+ICvCoMKgwqAgcmV0dXJuIGRybV9nZW1fdHRtX21t
YXAob2JqLCB2bWEpOwo+Pj4+ICt9Cj4+Pj4gKwo+Pj4+ICDCoCBzdGF0aWMgY29uc3Qgc3RydWN0
IGRybV9nZW1fb2JqZWN0X2Z1bmNzIGFtZGdwdV9nZW1fb2JqZWN0X2Z1bmNzID0gewo+Pj4+ICDC
oMKgwqDCoMKgIC5mcmVlID0gYW1kZ3B1X2dlbV9vYmplY3RfZnJlZSwKPj4+PiAgwqDCoMKgwqDC
oCAub3BlbiA9IGFtZGdwdV9nZW1fb2JqZWN0X29wZW4sCj4+Pj4gQEAgLTIwOCw2ICsyNzAsOCBA
QCBzdGF0aWMgY29uc3Qgc3RydWN0IGRybV9nZW1fb2JqZWN0X2Z1bmNzCj4+Pj4gYW1kZ3B1X2dl
bV9vYmplY3RfZnVuY3MgPSB7Cj4+Pj4gIMKgwqDCoMKgwqAgLmV4cG9ydCA9IGFtZGdwdV9nZW1f
cHJpbWVfZXhwb3J0LAo+Pj4+ICDCoMKgwqDCoMKgIC52bWFwID0gZHJtX2dlbV90dG1fdm1hcCwK
Pj4+PiAgwqDCoMKgwqDCoCAudnVubWFwID0gZHJtX2dlbV90dG1fdnVubWFwLAo+Pj4+ICvCoMKg
wqAgLm1tYXAgPSBhbWRncHVfZ2VtX3ByaW1lX21tYXAsCj4+Pj4gK8KgwqDCoCAudm1fb3BzID0g
JmFtZGdwdV90dG1fdm1fb3BzLAo+Pj4+ICDCoCB9Owo+Pj4+ICDCoCAvKgo+Pj4+IGRpZmYgLS1n
aXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfdHRtLmMKPj4+PiBiL2RyaXZl
cnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV90dG0uYwo+Pj4+IGluZGV4IDFjNjEzMTQ4OWE4
NS4uZDlkZTkxYTUxN2M2IDEwMDY0NAo+Pj4+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1k
Z3B1L2FtZGdwdV90dG0uYwo+Pj4+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2Ft
ZGdwdV90dG0uYwo+Pj4+IEBAIC0xNTIsMzIgKzE1Miw2IEBAIHN0YXRpYyB2b2lkIGFtZGdwdV9l
dmljdF9mbGFncyhzdHJ1Y3QKPj4+PiB0dG1fYnVmZmVyX29iamVjdCAqYm8sCj4+Pj4gIMKgwqDC
oMKgwqAgKnBsYWNlbWVudCA9IGFiby0+cGxhY2VtZW50Owo+Pj4+ICDCoCB9Cj4+Pj4gLS8qKgo+
Pj4+IC0gKiBhbWRncHVfdmVyaWZ5X2FjY2VzcyAtIFZlcmlmeSBhY2Nlc3MgZm9yIGEgbW1hcCBj
YWxsCj4+Pj4gLSAqCj4+Pj4gLSAqIEBibzrCoMKgwqAgVGhlIGJ1ZmZlciBvYmplY3QgdG8gbWFw
Cj4+Pj4gLSAqIEBmaWxwOiBUaGUgZmlsZSBwb2ludGVyIGZyb20gdGhlIHByb2Nlc3MgcGVyZm9y
bWluZyB0aGUgbW1hcAo+Pj4+IC0gKgo+Pj4+IC0gKiBUaGlzIGlzIGNhbGxlZCBieSB0dG1fYm9f
bW1hcCgpIHRvIHZlcmlmeSB3aGV0aGVyIGEgcHJvY2Vzcwo+Pj4+IC0gKiBoYXMgdGhlIHJpZ2h0
IHRvIG1tYXAgYSBCTyB0byB0aGVpciBwcm9jZXNzIHNwYWNlLgo+Pj4+IC0gKi8KPj4+PiAtc3Rh
dGljIGludCBhbWRncHVfdmVyaWZ5X2FjY2VzcyhzdHJ1Y3QgdHRtX2J1ZmZlcl9vYmplY3QgKmJv
LAo+Pj4+IHN0cnVjdCBmaWxlICpmaWxwKQo+Pj4+IC17Cj4+Pj4gLcKgwqDCoCBzdHJ1Y3QgYW1k
Z3B1X2JvICphYm8gPSB0dG1fdG9fYW1kZ3B1X2JvKGJvKTsKPj4+PiAtCj4+Pj4gLcKgwqDCoCAv
Kgo+Pj4+IC3CoMKgwqDCoCAqIERvbid0IHZlcmlmeSBhY2Nlc3MgZm9yIEtGRCBCT3MuIFRoZXkg
ZG9uJ3QgaGF2ZSBhIEdFTQo+Pj4+IC3CoMKgwqDCoCAqIG9iamVjdCBhc3NvY2lhdGVkIHdpdGgg
dGhlbS4KPj4+PiAtwqDCoMKgwqAgKi8KPj4+PiAtwqDCoMKgIGlmIChhYm8tPmtmZF9ibykKPj4+
PiAtwqDCoMKgwqDCoMKgwqAgcmV0dXJuIDA7Cj4+Pj4gLQo+Pj4+IC3CoMKgwqAgaWYgKGFtZGdw
dV90dG1fdHRfZ2V0X3VzZXJtbShiby0+dHRtKSkKPj4+PiAtwqDCoMKgwqDCoMKgwqAgcmV0dXJu
IC1FUEVSTTsKPj4+PiAtwqDCoMKgIHJldHVybiBkcm1fdm1hX25vZGVfdmVyaWZ5X2FjY2Vzcygm
YWJvLT50Ym8uYmFzZS52bWFfbm9kZSwKPj4+PiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgIGZpbHAtPnByaXZhdGVfZGF0YSk7Cj4+Pj4gLX0KPj4gSGVyZSdzIHRo
ZSBvcmlnbmFsIHZlcmlmaWNhdGlvbiBjb2RlLiBJdCBnaXZlcyBhIGZyZWUgcGFzcyB0byBLRkQu
Cj4+Cj4+Pj4gLQo+Pj4+ICDCoCAvKioKPj4+PiAgwqDCoCAqIGFtZGdwdV90dG1fbWFwX2J1ZmZl
ciAtIE1hcCBtZW1vcnkgaW50byB0aGUgR0FSVCB3aW5kb3dzCj4+Pj4gIMKgwqAgKiBAYm86IGJ1
ZmZlciBvYmplY3QgdG8gbWFwCj4+Pj4gQEAgLTE1MzEsNyArMTUwNSw2IEBAIHN0YXRpYyBzdHJ1
Y3QgdHRtX2RldmljZV9mdW5jcwo+Pj4+IGFtZGdwdV9ib19kcml2ZXIgPSB7Cj4+Pj4gIMKgwqDC
oMKgwqAgLmV2aWN0aW9uX3ZhbHVhYmxlID0gYW1kZ3B1X3R0bV9ib19ldmljdGlvbl92YWx1YWJs
ZSwKPj4+PiAgwqDCoMKgwqDCoCAuZXZpY3RfZmxhZ3MgPSAmYW1kZ3B1X2V2aWN0X2ZsYWdzLAo+
Pj4+ICDCoMKgwqDCoMKgIC5tb3ZlID0gJmFtZGdwdV9ib19tb3ZlLAo+Pj4+IC3CoMKgwqAgLnZl
cmlmeV9hY2Nlc3MgPSAmYW1kZ3B1X3ZlcmlmeV9hY2Nlc3MsCj4+Pj4gIMKgwqDCoMKgwqAgLmRl
bGV0ZV9tZW1fbm90aWZ5ID0gJmFtZGdwdV9ib19kZWxldGVfbWVtX25vdGlmeSwKPj4+PiAgwqDC
oMKgwqDCoCAucmVsZWFzZV9ub3RpZnkgPSAmYW1kZ3B1X2JvX3JlbGVhc2Vfbm90aWZ5LAo+Pj4+
ICDCoMKgwqDCoMKgIC5pb19tZW1fcmVzZXJ2ZSA9ICZhbWRncHVfdHRtX2lvX21lbV9yZXNlcnZl
LAo+Pj4+IEBAIC0xOTA2LDUwICsxODc5LDYgQEAgdm9pZAo+Pj4+IGFtZGdwdV90dG1fc2V0X2J1
ZmZlcl9mdW5jc19zdGF0dXMoc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYsIGJvb2wKPj4+PiBl
bmFibGUpCj4+Pj4gIMKgwqDCoMKgwqAgYWRldi0+bW1hbi5idWZmZXJfZnVuY3NfZW5hYmxlZCA9
IGVuYWJsZTsKPj4+PiAgwqAgfQo+Pj4+IC1zdGF0aWMgdm1fZmF1bHRfdCBhbWRncHVfdHRtX2Zh
dWx0KHN0cnVjdCB2bV9mYXVsdCAqdm1mKQo+Pj4+IC17Cj4+Pj4gLcKgwqDCoCBzdHJ1Y3QgdHRt
X2J1ZmZlcl9vYmplY3QgKmJvID0gdm1mLT52bWEtPnZtX3ByaXZhdGVfZGF0YTsKPj4+PiAtwqDC
oMKgIHZtX2ZhdWx0X3QgcmV0Owo+Pj4+IC0KPj4+PiAtwqDCoMKgIHJldCA9IHR0bV9ib192bV9y
ZXNlcnZlKGJvLCB2bWYpOwo+Pj4+IC3CoMKgwqAgaWYgKHJldCkKPj4+PiAtwqDCoMKgwqDCoMKg
wqAgcmV0dXJuIHJldDsKPj4+PiAtCj4+Pj4gLcKgwqDCoCByZXQgPSBhbWRncHVfYm9fZmF1bHRf
cmVzZXJ2ZV9ub3RpZnkoYm8pOwo+Pj4+IC3CoMKgwqAgaWYgKHJldCkKPj4+PiAtwqDCoMKgwqDC
oMKgwqAgZ290byB1bmxvY2s7Cj4+Pj4gLQo+Pj4+IC3CoMKgwqAgcmV0ID0gdHRtX2JvX3ZtX2Zh
dWx0X3Jlc2VydmVkKHZtZiwgdm1mLT52bWEtPnZtX3BhZ2VfcHJvdCwKPj4+PiAtwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgVFRNX0JPX1ZNX05VTV9QUkVGQVVM
VCwgMSk7Cj4+Pj4gLcKgwqDCoCBpZiAocmV0ID09IFZNX0ZBVUxUX1JFVFJZICYmICEodm1mLT5m
bGFncyAmCj4+Pj4gRkFVTFRfRkxBR19SRVRSWV9OT1dBSVQpKQo+Pj4+IC3CoMKgwqDCoMKgwqDC
oCByZXR1cm4gcmV0Owo+Pj4+IC0KPj4+PiAtdW5sb2NrOgo+Pj4+IC3CoMKgwqAgZG1hX3Jlc3Zf
dW5sb2NrKGJvLT5iYXNlLnJlc3YpOwo+Pj4+IC3CoMKgwqAgcmV0dXJuIHJldDsKPj4+PiAtfQo+
Pj4+IC0KPj4+PiAtc3RhdGljIGNvbnN0IHN0cnVjdCB2bV9vcGVyYXRpb25zX3N0cnVjdCBhbWRn
cHVfdHRtX3ZtX29wcyA9IHsKPj4+PiAtwqDCoMKgIC5mYXVsdCA9IGFtZGdwdV90dG1fZmF1bHQs
Cj4+Pj4gLcKgwqDCoCAub3BlbiA9IHR0bV9ib192bV9vcGVuLAo+Pj4+IC3CoMKgwqAgLmNsb3Nl
ID0gdHRtX2JvX3ZtX2Nsb3NlLAo+Pj4+IC3CoMKgwqAgLmFjY2VzcyA9IHR0bV9ib192bV9hY2Nl
c3MKPj4+PiAtfTsKPj4+PiAtCj4+Pj4gLWludCBhbWRncHVfbW1hcChzdHJ1Y3QgZmlsZSAqZmls
cCwgc3RydWN0IHZtX2FyZWFfc3RydWN0ICp2bWEpCj4+Pj4gLXsKPj4+PiAtwqDCoMKgIHN0cnVj
dCBkcm1fZmlsZSAqZmlsZV9wcml2ID0gZmlscC0+cHJpdmF0ZV9kYXRhOwo+Pj4+IC3CoMKgwqAg
c3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYgPSBkcm1fdG9fYWRldihmaWxlX3ByaXYtPm1pbm9y
LT5kZXYpOwo+Pj4+IC3CoMKgwqAgaW50IHI7Cj4+Pj4gLQo+Pj4+IC3CoMKgwqAgciA9IHR0bV9i
b19tbWFwKGZpbHAsIHZtYSwgJmFkZXYtPm1tYW4uYmRldik7Cj4+Pj4gLcKgwqDCoCBpZiAodW5s
aWtlbHkociAhPSAwKSkKPj4+PiAtwqDCoMKgwqDCoMKgwqAgcmV0dXJuIHI7Cj4+Pj4gLQo+Pj4+
IC3CoMKgwqAgdm1hLT52bV9vcHMgPSAmYW1kZ3B1X3R0bV92bV9vcHM7Cj4+Pj4gLcKgwqDCoCBy
ZXR1cm4gMDsKPj4+PiAtfQo+PiBBbmQgdGhpcyB3YXMgdGhlIG1tYXAgY2FsbGJhY2sgaW4gc3Ry
dWN0IGZpbGVfb3BlcmF0aW9ucy4gSXQgY2FsbHMKPj4gdHRtX2JvX21tYXAoKSwgd2hpY2ggc2tp
cHMgdmVyaWZpY2F0aW9uIGZvciBLRkQgQk9zLiBUbyB0aGUgYmVzdCBvZiBteQo+PiBrbm93bGVk
Z2UsIHRoZXJlIHdhcyBubyBhZGRpdGlvbmFsIHZlcmlmaWNhdGlvbiBmb3IgdGhlc2UgS0ZEIEJP
cy4KPj4KPj4gVGhlIG9yaWdpbmFsIGNvZGUgaW4gYW1kZ3B1X2dlbV9wcmltZV9tbWFwKCkgZGlk
IHNlb20gdmVyaWZpY2F0aW9uLAo+PiBidXQgZGlkbid0IGhhbmRsZSBLRkQgc3BlY2lhbGx5LiBJ
IGd1ZXNzLCBQUklNRSBuZWVkcyBHRU0gYW5kIEtGRCBCT3MKPj4gd291bGRuJ3QgcXVhaWxpZnku
Cj4+Cj4+IEluIHRoZSBlbmQgSSB3ZW50IHdpdGggdGhlIHNlbWFudGljcyBJIGZvdW5kIGluIGFt
ZGdwdV9tbWFwKCkgYW5kCj4+IGhhbmRsZWQgS0ZEIHNwZWNpYWxseS4gTGV0IG1lIGtub3cgaWYg
dGhpcyByZXF1aXJlcyB0byBiZSBjaGFuZ2VkLgo+Pgo+PiBCZXN0IHJlZ2FyZHMKPj4gVGhvbWFz
Cj4+Cj4+Pj4gLQo+Pj4+ICDCoCBpbnQgYW1kZ3B1X2NvcHlfYnVmZmVyKHN0cnVjdCBhbWRncHVf
cmluZyAqcmluZywgdWludDY0X3Qgc3JjX29mZnNldCwKPj4+PiAgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqAgdWludDY0X3QgZHN0X29mZnNldCwgdWludDMyX3QgYnl0ZV9jb3VudCwK
Pj4+PiAgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgc3RydWN0IGRtYV9yZXN2ICpy
ZXN2LAo+Pj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVf
dHRtLmgKPj4+PiBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV90dG0uaAo+Pj4+
IGluZGV4IGRlYzBkYjhiMGIxMy4uNmU1MWZhYWQ3MzcxIDEwMDY0NAo+Pj4+IC0tLSBhL2RyaXZl
cnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV90dG0uaAo+Pj4+ICsrKyBiL2RyaXZlcnMvZ3B1
L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV90dG0uaAo+Pj4+IEBAIC0xNDYsNyArMTQ2LDYgQEAgaW50
IGFtZGdwdV9maWxsX2J1ZmZlcihzdHJ1Y3QgYW1kZ3B1X2JvICpibywKPj4+PiAgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqAgc3RydWN0IGRtYV9yZXN2ICpyZXN2LAo+Pj4+ICDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoCBzdHJ1Y3QgZG1hX2ZlbmNlICoqZmVuY2UpOwo+Pj4+IC1pbnQgYW1k
Z3B1X21tYXAoc3RydWN0IGZpbGUgKmZpbHAsIHN0cnVjdCB2bV9hcmVhX3N0cnVjdCAqdm1hKTsK
Pj4+PiAgwqAgaW50IGFtZGdwdV90dG1fYWxsb2NfZ2FydChzdHJ1Y3QgdHRtX2J1ZmZlcl9vYmpl
Y3QgKmJvKTsKPj4+PiAgwqAgaW50IGFtZGdwdV90dG1fcmVjb3Zlcl9nYXJ0KHN0cnVjdCB0dG1f
YnVmZmVyX29iamVjdCAqdGJvKTsKPj4+PiAgwqAgdWludDY0X3QgYW1kZ3B1X3R0bV9kb21haW5f
c3RhcnQoc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYsCj4+Pj4gdWludDMyX3QgdHlwZSk7Cj4+
PiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+Pj4gZHJp
LWRldmVsIG1haWxpbmcgbGlzdAo+Pj4gZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwo+
Pj4gaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2
ZWwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCk5vdXZl
YXUgbWFpbGluZyBsaXN0Ck5vdXZlYXVAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vbm91dmVhdQo=
