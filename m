Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D73BA2C1B3D
	for <lists+nouveau@lfdr.de>; Tue, 24 Nov 2020 03:08:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1EF986E194;
	Tue, 24 Nov 2020 02:07:55 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2063.outbound.protection.outlook.com [40.107.93.63])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA478895B4;
 Mon, 23 Nov 2020 11:52:53 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IbcARMEDh8LjJ6WVMIOSrNM0HVNjD1Ju+qhk+NVBx9A+yFTn2Yk7msEer39VZde/GCD0VfIPw7RhTz53i2HD0m+DqoXHvsir0ebGPx+E+dQnu3Sf0cirIRk4YkNZfZpww/gj652S1+K+UKzIRPvrTf1FosXcN55WKp3j7M9ddqf/LEizA/1TuPI/v1DwVBU4hEqpSpK9QSAxlJbbraN/0xdD9H8xSKea+TTHOK9rBuSgAXN+iUbAZkJ8rJ29NhuWYFTgSYlbitldM7GL79+GmbAZpWnt8I2bseM5JK28dXzhcbi05zsaQA9B/oxg9MqYtDOvHbklze5B6GSnpSaFGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=O2UqfUcJUN3AKI5fYjjOMDFx/xGxNzc+Dmq0EqpX1/s=;
 b=F3PkOxTyLTQ6ys/hZr9XkwoD4r1tzF0DBVgAo4zgnq0u4xjtzZuFMyTzchkEcPanykUuTYzV7qqTdhOU2KsYtHPraWjdmozThnvu7tdpw12L3RxSW5aZWVBNjLf/ev34HvFzXlJJl8csLNh4znuciXoLnuMh3D3ujBz04eAjysSWv57EGwcGjoYNJYnNsV6ACFZr9URrEP0uIjiZnla9XnYvM+Z+Gi3olt9PqSraPeCKemHCe0Q+LdjWU3GXr58lFkZbJFuh+brCWLWwPgurHH3iEK+lPNrCcDiK9YfhQFYdCFSxH10S8rBVPpObL+eYLek2MuPoomz65hgzzAyZHA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=O2UqfUcJUN3AKI5fYjjOMDFx/xGxNzc+Dmq0EqpX1/s=;
 b=mc+/qOirh6MPN+QIg+xjn44/EfE2Yi9xnKXia7bETfU5N+KiW/jLFZoWLCRfCp1BKYHhcudps0lxsEXoa/nLIKdPzzGhGQ0jAenhmiiwglwDoNyO8G7hCUT5EulafcrEBQ5wQZplhpS1jFoZ+Hh2zNk4+3tIp2WRfvR4xM4j7cg=
Authentication-Results: amd.com; dkim=none (message not signed)
 header.d=none;amd.com; dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by MN2PR12MB4253.namprd12.prod.outlook.com (2603:10b6:208:1de::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3589.22; Mon, 23 Nov
 2020 11:52:51 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::1ccc:8a9a:45d3:dd31]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::1ccc:8a9a:45d3:dd31%7]) with mapi id 15.20.3589.022; Mon, 23 Nov 2020
 11:52:51 +0000
To: Lee Jones <lee.jones@linaro.org>
References: <20201123111919.233376-1-lee.jones@linaro.org>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <feda98c5-a677-7bf5-c1e7-2bf311ba8097@amd.com>
Date: Mon, 23 Nov 2020 12:52:42 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <20201123111919.233376-1-lee.jones@linaro.org>
Content-Language: en-US
X-Originating-IP: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
X-ClientProxiedBy: AM0PR10CA0096.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:208:15::49) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
 (2a02:908:1252:fb60:be8a:bd56:1f94:86e7) by
 AM0PR10CA0096.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:208:15::49) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3589.21 via Frontend Transport; Mon, 23 Nov 2020 11:52:46 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: b4545c6a-2257-4798-5d3f-08d88fa64dab
X-MS-TrafficTypeDiagnostic: MN2PR12MB4253:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MN2PR12MB4253068F62324FA631365AFE83FC0@MN2PR12MB4253.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3631;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 01u/96N2kPMIwQk1vyLAenWpejMhU93MLr3wMYnxbPiTuNiIeRpCiUhMpbD5GG0b659s9p/QwLQqiOM27VUPLUFOe9LhRh49NLOi00ofaVFOSy0FxqIyevl9+mXyLezw3OCyLkwKAYmF7KUJ1nJ/aZZqWV8Urvytb/2fl4NyjXajNRVsMHg56jt2uICxZqfZsg1Ft0jn3QVaClQ5IrAOR3J/ZXjGCi/yuMrpMufyD9ZAdZUI1lxI0x1eamv1rEg6iibSc8L2kSi9CFjPWM+Y7Cp9aL0l9iSwe8IWN9pnJQ4J9Y9I/dn3vSg3RPAtUeTlJKQauazwv5w+xf1AIyo2qy57P/yL2UjqCKFxj5dCuA7sGac4SpDuNY4G3wT5w4JL
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(136003)(39860400002)(346002)(366004)(376002)(52116002)(8676002)(478600001)(8936002)(66946007)(36756003)(86362001)(4326008)(66476007)(66556008)(7416002)(6916009)(83380400001)(2906002)(2616005)(186003)(16526019)(5660300002)(6486002)(316002)(31686004)(6666004)(66574015)(54906003)(31696002)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?Z3RBU0JGY05odXZNVTlDb1J5OHJWV0lvSU1QVi9XNVBQUUhjOUZtRjB1L2VZ?=
 =?utf-8?B?WGZzaHpmMHpkck5jSmhqellsREJjZHJIK2poU21FaHYrRVFVWTIrNTkwSWR1?=
 =?utf-8?B?UGdxUXV3bXpLb0hIUnVUV1JWVTh3MHRlZ20waEE1SDVtQVRrWk9zckFlUUtn?=
 =?utf-8?B?V1d5U1pYZlJzdFg3RXozWmdEMUJCdXovY1JzSHlMWjFWblkyRldubjBnMFBT?=
 =?utf-8?B?a0JSbDIvLzVPUzJvdEpvbVl5NC9sa2hHUFVaZ1dEY1BZYlliVnMwL1JVc3pO?=
 =?utf-8?B?eURsMGQ0OWVQVEtLeXkxUDJ0bnBHUnJmV1FhVUF2a2ZKODZoeW9BQnk3eXFS?=
 =?utf-8?B?bXRDdVZmMXY0T2puV0czQW1jellzV1Exbks3M3dGYXpiUnU3R0phOVJZV3ZK?=
 =?utf-8?B?UldxY0pZSC95THRLdkQybFBsWTBrYlZVTWUrQmxHcm9iTTI0bUtLS0hMd0Zy?=
 =?utf-8?B?TkVYWWJHeUdFWVp6a0k1T096YVM0ZVRncU1DV0l0RXZadXNKMUhJVWlnSjEz?=
 =?utf-8?B?K2Q0MGhqQ2k2cUJXaUE1WFN3VzdWaTdtOCtmTHdPMHRjSnhiZmZlS0tzNk03?=
 =?utf-8?B?YkhTTCtPWmdLZHUvRkh5WDRWNlVNTWlXR0ZHaGN1RTV1ZmMva1ZtdVBnUGpC?=
 =?utf-8?B?OVdveFNwT1N4S25EZmRNU2tkZjAvUmxvRjhWQXErbFA2RG80WkNHMHJnRUFO?=
 =?utf-8?B?Mkdwak9BeGdld3JuVXM1YmZ3UDBSL2lrNE9yb2VCbEJEaFhUeXErZVJxMU5I?=
 =?utf-8?B?eUpkbFFnWitJZitqZjNSREM1K3NYK281NTZEU25ZZlF6ZWxzVnFCQWlsald3?=
 =?utf-8?B?UnplS0o0Vmd1bXVJTkZIdEZqdWZKSWhUWWhLOEVjQVBuVjN4N0s4VG5lM2x4?=
 =?utf-8?B?U1VLYUhmRzUwdjJyUUJoTGg2SUxKazh6SElvVk5pMWFXYnN5SE01bWxCVTVk?=
 =?utf-8?B?OTc0SzNvWVFwcXZQelFiUTRuTGlvbkNJb0Y2UCtGOS9QcUNqTGo1d25SRWZP?=
 =?utf-8?B?VXFtUkR4aVhmdldIbERoNFRGRU9TZ0xlOFNzUXlQa1RjdmwwSlpSQmtBTGhO?=
 =?utf-8?B?R0JKRDJydW1GZUtKS2VhRzBOTXR6SDd4THY1YktIMkpjRDlVSTNFVHhkWENq?=
 =?utf-8?B?bkJlc2JEQmhsNXNDZ2tYQkxpejFQZ2JrZC96VWZ4UE5xcHBqdlowczYwc0Zn?=
 =?utf-8?B?MXlqK0E5UndDMmxLQ05aRVVvckFPVEplQlY5UkV2SDlKeVRKbng1SXowR3FL?=
 =?utf-8?B?UmNNbDZpS3Y0K2J4VDBkNHFTcUJzbnlaT3BEYzEyaitCS2o3UT09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b4545c6a-2257-4798-5d3f-08d88fa64dab
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Nov 2020 11:52:50.7681 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 72ca23NHRM+6fJd1PNpDCwUfyIWtXq6ebyA/OMF5QifwEXoC8lFSFOHfxgr03dwq
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4253
X-Mailman-Approved-At: Tue, 24 Nov 2020 02:07:49 +0000
Subject: Re: [Nouveau] [PATCH 00/40] [Set 8] Rid W=1 warnings from GPU
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
 Tao Zhou <tao.zhou1@amd.com>, dri-devel@lists.freedesktop.org,
 Sonny Jiang <sonny.jiang@amd.com>, Huang Rui <ray.huang@amd.com>,
 Qinglang Miao <miaoqinglang@huawei.com>, Likun Gao <Likun.Gao@amd.com>,
 Sumit Semwal <sumit.semwal@linaro.org>, Jonathan Marek <jonathan@marek.ca>,
 amd-gfx@lists.freedesktop.org, Luben Tuikov <luben.tuikov@amd.com>,
 Ben Skeggs <bskeggs@redhat.com>, Jiansong Chen <Jiansong.Chen@amd.com>,
 linux-media@vger.kernel.org, Fritz Koenig <frkoenig@google.com>,
 linux-arm-msm@vger.kernel.org, linaro-mm-sig@lists.linaro.org,
 Alex Deucher <alexander.deucher@amd.com>,
 Kalyan Thota <kalyan_t@codeaurora.org>, Sean Paul <sean@poorly.run>,
 linux-kernel@vger.kernel.org, Jerome Glisse <glisse@freedesktop.org>,
 Rob Clark <robdclark@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Drew Davenport <ddavenport@chromium.org>, freedreno@lists.freedesktop.org,
 Hawking Zhang <Hawking.Zhang@amd.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

T25seSBza2ltbWVkIG92ZXIgdGhlbSwgYnV0IG92ZXIgYWxsIGxvb2tzIHNhbmUgdG8gbWUuCgpT
ZXJpZXMgaXMgQWNrZWQtYnk6IENocmlzdGlhbiBLw7ZuaWcgPGNocmlzdGlhbi5rb2VuaWdAYW1k
LmNvbT4KClRoYW5rcywKQ2hyaXN0aWFuLgoKQW0gMjMuMTEuMjAgdW0gMTI6MTggc2NocmllYiBM
ZWUgSm9uZXM6Cj4gVGhpcyBzZXQgaXMgcGFydCBvZiBhIGxhcmdlciBlZmZvcnQgYXR0ZW1wdGlu
ZyB0byBjbGVhbi11cCBXPTEKPiBrZXJuZWwgYnVpbGRzLCB3aGljaCBhcmUgY3VycmVudGx5IG92
ZXJ3aGVsbWluZ2x5IHJpZGRsZWQgd2l0aAo+IG5pZ2dseSBsaXR0bGUgd2FybmluZ3MuCj4KPiBP
bmx5IDkwMCAoZnJvbSA1MDAwKSB0byBnbyEKPgo+IExlZSBKb25lcyAoNDApOgo+ICAgIGRybS9y
YWRlb24vcmFkZW9uX2RldmljZTogQ29uc3VtZSBvdXIgb3duIGhlYWRlciB3aGVyZSB0aGUgcHJv
dG90eXBlcwo+ICAgICAgYXJlIGxvY2F0ZWQKPiAgICBkcm0vYW1kL2FtZGdwdS9hbWRncHVfdHRt
OiBBZGQgZGVzY3JpcHRpb24gZm9yICdwYWdlX2ZsYWdzJwo+ICAgIGRybS9hbWQvYW1kZ3B1L2Ft
ZGdwdV9pYjogUHJvdmlkZSBkb2NzIGZvciAnYW1kZ3B1X2liX3NjaGVkdWxlKCkncwo+ICAgICAg
J2pvYicgcGFyYW0KPiAgICBkcm0vYW1kL2FtZGdwdS9hbWRncHVfdmlydDogQ29ycmVjdCBwb3Nz
aWJsZSBjb3B5L3Bhc3RlIG9yIGRvYy1yb3QKPiAgICAgIG1pc25hbWluZyBpc3N1ZQo+ICAgIGRy
bS9hbWQvYW1kZ3B1L2Npa19paDogU3VwcGx5IGRlc2NyaXB0aW9uIGZvciAnaWgnIGluCj4gICAg
ICAnY2lrX2loX3tnZXQsc2V0fV93cHRyKCknCj4gICAgZHJtL2FtZC9hbWRncHUvdXZkX3Y0XzI6
IEZpeCBzb21lIGtlcm5lbC1kb2MgbWlzZGVtZWFub3Vycwo+ICAgIGRybS9hbWQvYW1kZ3B1L2Rj
ZV92OF8wOiBTdXBwbHkgZGVzY3JpcHRpb24gZm9yICdhc3luYycKPiAgICBkcm0vYW1kL2FtZGdw
dS9jaWtfc2RtYTogU3VwcGx5IHNvbWUgbWlzc2luZyBmdW5jdGlvbiBwYXJhbQo+ICAgICAgZGVz
Y3JpcHRpb25zCj4gICAgZHJtL2FtZC9hbWRncHUvZ2Z4X3Y3XzA6IENsZWFuLXVwIGEgYnVuY2gg
b2Yga2VybmVsLWRvYyByZWxhdGVkIGlzc3Vlcwo+ICAgIGRybS9tc20vZGlzcC9kcHUxL2RwdV9j
b3JlX3BlcmY6IEZpeCBrZXJuZWwtZG9jIGZvcm1hdHRpbmcgaXNzdWVzCj4gICAgZHJtL21zbS9k
aXNwL2RwdTEvZHB1X2h3X2JsazogQWRkIG9uZSBtaXNzaW5nIGFuZCByZW1vdmUgYW4gZXh0cmEK
PiAgICAgIHBhcmFtIGRlc2NyaXB0aW9uCj4gICAgZHJtL21zbS9kaXNwL2RwdTEvZHB1X2Zvcm1h
dHM6IERlbW90ZSBub24tY29uZm9ybWFudCBrZXJuZWwtZG9jIGhlYWRlcgo+ICAgIGRybS9tc20v
ZGlzcC9kcHUxL2RwdV9od19jYXRhbG9nOiBSZW1vdmUgZHVwbGljYXRlZCBpbml0aWFsaXNhdGlv
biBvZgo+ICAgICAgJ21heF9saW5ld2lkdGgnCj4gICAgZHJtL21zbS9kaXNwL2RwdTEvZHB1X2h3
X2NhdGFsb2c6IE1vdmUgZGVmaW5pdGlvbnMgdG8gdGhlIG9ubHkgcGxhY2UKPiAgICAgIHRoZXkg
YXJlIHVzZWQKPiAgICBkcm0vbm91dmVhdS9udmttL3N1YmRldi9iaW9zL2luaXQ6IERlbW90ZSBv
YnZpb3VzIGFidXNlIG9mIGtlcm5lbC1kb2MKPiAgICBkcm0vYW1kL2FtZGdwdS9zaV9kbWE6IEZp
eCBhIGJ1bmNoIG9mIGZ1bmN0aW9uIGRvY3VtZW50YXRpb24gaXNzdWVzCj4gICAgZHJtL2FtZC9h
bWRncHUvZ2Z4X3Y2XzA6IFN1cHBseSBkZXNjcmlwdGlvbiBmb3IKPiAgICAgICdnZnhfdjZfMF9y
aW5nX3Rlc3RfaWIoKSdzICd0aW1lb3V0JyBwYXJhbQo+ICAgIGRybS9tc20vZGlzcC9kcHUxL2Rw
dV9lbmNvZGVyOiBGaXggYSBmZXcgcGFyYW1ldGVyL21lbWJlciBmb3JtYXR0aW5nCj4gICAgICBp
c3N1ZXMKPiAgICBkcm0vbXNtL2Rpc3AvZHB1MS9kcHVfaHdfbG06IEZpeCBtaXNuYW1pbmcgb2Yg
cGFyYW1ldGVyICdjdHgnCj4gICAgZHJtL21zbS9kaXNwL2RwdTEvZHB1X2h3X3NzcHA6IEZpeCBr
ZXJuZWwtZG9jIGZvcm1hdHRpbmcgYWJ1c2UKPiAgICBkcm0vYW1kL2FtZGdwdS91dmRfdjNfMTog
Rml4LXVwIHNvbWUgZG9jdW1lbnRhdGlvbiBpc3N1ZXMKPiAgICBkcm0vYW1kL2FtZGdwdS9kY2Vf
djZfMDogRml4IGZvcm1hdHRpbmcgYW5kIG1pc3NpbmcgcGFyYW1ldGVyCj4gICAgICBkZXNjcmlw
dGlvbiBpc3N1ZXMKPiAgICBkcm0vYW1kL2luY2x1ZGUvdmVnYTIwX2lwX29mZnNldDogTWFyayB0
b3AtbGV2ZWwgSVBfQkFTRSBkZWZpbml0aW9uIGFzCj4gICAgICBfX21heWJlX3VudXNlZAo+ICAg
IGRybS9hbWQvaW5jbHVkZS9uYXZpMTBfaXBfb2Zmc2V0OiBNYXJrIHRvcC1sZXZlbCBJUF9CQVNF
IGFzCj4gICAgICBfX21heWJlX3VudXNlZAo+ICAgIGRybS9hbWQvaW5jbHVkZS9hcmN0X2lwX29m
ZnNldDogTWFyayB0b3AtbGV2ZWwgSVBfQkFTRSBkZWZpbml0aW9uIGFzCj4gICAgICBfX21heWJl
X3VudXNlZAo+ICAgIGRybS9hbWQvaW5jbHVkZS9uYXZpMTRfaXBfb2Zmc2V0OiBNYXJrIHRvcC1s
ZXZlbCBJUF9CQVNFIGFzCj4gICAgICBfX21heWJlX3VudXNlZAo+ICAgIGRybS9hbWQvaW5jbHVk
ZS9uYXZpMTJfaXBfb2Zmc2V0OiBNYXJrIHRvcC1sZXZlbCBJUF9CQVNFIGFzCj4gICAgICBfX21h
eWJlX3VudXNlZAo+ICAgIGRybS9hbWQvaW5jbHVkZS9zaWVubmFfY2ljaGxpZF9pcF9vZmZzZXQ6
IE1hcmsgdG9wLWxldmVsIElQX0JBU0UgYXMKPiAgICAgIF9fbWF5YmVfdW51c2VkCj4gICAgZHJt
L2FtZC9pbmNsdWRlL3ZhbmdvZ2hfaXBfb2Zmc2V0OiBNYXJrIHRvcC1sZXZlbCBJUF9CQVNFIGFz
Cj4gICAgICBfX21heWJlX3VudXNlZAo+ICAgIGRybS9hbWQvaW5jbHVkZS9kaW1ncmV5X2NhdmVm
aXNoX2lwX29mZnNldDogTWFyayB0b3AtbGV2ZWwgSVBfQkFTRSBhcwo+ICAgICAgX19tYXliZV91
bnVzZWQKPiAgICBkcm0vbXNtL2Rpc3AvZHB1MS9kcHVfcm06IEZpeCBmb3JtYXR0aW5nIGlzc3Vl
cyBhbmQgc3VwcGx5Cj4gICAgICAnZ2xvYmFsX3N0YXRlJyBkZXNjcmlwdGlvbgo+ICAgIGRybS9t
c20vZGlzcC9kcHUxL2RwdV92YmlmOiBGaXggYSBjb3VwbGUgb2YgZnVuY3Rpb24gcGFyYW0KPiAg
ICAgIGRlc2NyaXB0aW9ucwo+ICAgIGRybS9hbWQvYW1kZ3B1L2Npa19zZG1hOiBBZGQgb25lIGFu
ZCByZW1vdmUgYW5vdGhlciBmdW5jdGlvbiBwYXJhbQo+ICAgICAgZGVzY3JpcHRpb24KPiAgICBk
cm0vYW1kL2FtZGdwdS91dmRfdjRfMjogQWRkIG9uZSBhbmQgcmVtb3ZlIGFub3RoZXIgZnVuY3Rp
b24gcGFyYW0KPiAgICAgIGRlc2NyaXB0aW9uCj4gICAgZHJtL21zbS9kaXNwL2RwdTEvZHB1X3Bs
YW5lOiBGaXggc29tZSBzcGVsbGluZyBhbmQgbWlzc2luZyBmdW5jdGlvbgo+ICAgICAgcGFyYW0g
ZGVzY3JpcHRpb25zCj4gICAgZHJtL2FtZC9hbWRncHUvZ21jX3Y3XzA6IEFkZCBzb21lIG1pc3Np
bmcga2VybmVsLWRvYyBkZXNjcmlwdGlvbnMKPiAgICBkcm0vYW1kL2FtZGdwdS9nbWNfdjhfMDog
Rml4IG1vcmUgaXNzdWVzIGF0dHJpYnV0ZWQgdG8gY29weS9wYXN0ZQo+ICAgIGRybS9tc20vbXNt
X2RydjogTWFrZSAnX21zbV9pb3JlbWFwKCknIHN0YXRpYwo+ICAgIGRybS9hbWQvYW1kZ3B1L2dt
Y192OV8wOiBSZW1vdmUgdW51c2VkIHRhYmxlCj4gICAgICAnZWNjX3VtY19tY3VtY19zdGF0dXNf
YWRkcnMnCj4gICAgZHJtL2FtZC9hbWRncHUvZ21jX3Y5XzA6IFN1cHB5IHNvbWUgbWlzc2luZyBm
dW5jdGlvbiBkb2MgZGVzY3JpcHRpb25zCj4KPiAgIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1
L2FtZGdwdV9pYi5jICAgICAgICB8ICAgMSArCj4gICBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdw
dS9hbWRncHVfdHRtLmMgICAgICAgfCAgIDEgKwo+ICAgZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRn
cHUvYW1kZ3B1X3ZpcnQuYyAgICAgIHwgIDEyICstCj4gICBkcml2ZXJzL2dwdS9kcm0vYW1kL2Ft
ZGdwdS9jaWtfaWguYyAgICAgICAgICAgfCAgIDIgKwo+ICAgZHJpdmVycy9ncHUvZHJtL2FtZC9h
bWRncHUvY2lrX3NkbWEuYyAgICAgICAgIHwgIDE4ICsrLQo+ICAgZHJpdmVycy9ncHUvZHJtL2Ft
ZC9hbWRncHUvZGNlX3Y2XzAuYyAgICAgICAgIHwgICAyICstCj4gICBkcml2ZXJzL2dwdS9kcm0v
YW1kL2FtZGdwdS9kY2VfdjhfMC5jICAgICAgICAgfCAgIDEgKwo+ICAgZHJpdmVycy9ncHUvZHJt
L2FtZC9hbWRncHUvZ2Z4X3Y2XzAuYyAgICAgICAgIHwgICAxICsKPiAgIGRyaXZlcnMvZ3B1L2Ry
bS9hbWQvYW1kZ3B1L2dmeF92N18wLmMgICAgICAgICB8ICAzMyArKystLQo+ICAgZHJpdmVycy9n
cHUvZHJtL2FtZC9hbWRncHUvZ21jX3Y3XzAuYyAgICAgICAgIHwgICA3ICstCj4gICBkcml2ZXJz
L2dwdS9kcm0vYW1kL2FtZGdwdS9nbWNfdjhfMC5jICAgICAgICAgfCAgIDUgKwo+ICAgZHJpdmVy
cy9ncHUvZHJtL2FtZC9hbWRncHUvZ21jX3Y5XzAuYyAgICAgICAgIHwgIDM4ICstLS0tCj4gICBk
cml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9zaV9kbWEuYyAgICAgICAgICAgfCAgMTQgKy0KPiAg
IGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L3V2ZF92M18xLmMgICAgICAgICB8ICAxMCArLQo+
ICAgZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvdXZkX3Y0XzIuYyAgICAgICAgIHwgIDEwICst
Cj4gICBkcml2ZXJzL2dwdS9kcm0vYW1kL2luY2x1ZGUvYXJjdF9pcF9vZmZzZXQuaCAgfCAgIDQg
Ky0KPiAgIC4uLi9hbWQvaW5jbHVkZS9kaW1ncmV5X2NhdmVmaXNoX2lwX29mZnNldC5oICB8ICAg
MiArLQo+ICAgLi4uL2dwdS9kcm0vYW1kL2luY2x1ZGUvbmF2aTEwX2lwX29mZnNldC5oICAgIHwg
ICAyICstCj4gICAuLi4vZ3B1L2RybS9hbWQvaW5jbHVkZS9uYXZpMTJfaXBfb2Zmc2V0LmggICAg
fCAgIDIgKy0KPiAgIC4uLi9ncHUvZHJtL2FtZC9pbmNsdWRlL25hdmkxNF9pcF9vZmZzZXQuaCAg
ICB8ICAgMiArLQo+ICAgLi4uL2FtZC9pbmNsdWRlL3NpZW5uYV9jaWNobGlkX2lwX29mZnNldC5o
ICAgIHwgICAyICstCj4gICAuLi4vZ3B1L2RybS9hbWQvaW5jbHVkZS92YW5nb2doX2lwX29mZnNl
dC5oICAgfCAgIDIgKy0KPiAgIC4uLi9ncHUvZHJtL2FtZC9pbmNsdWRlL3ZlZ2EyMF9pcF9vZmZz
ZXQuaCAgICB8ICAgMiArLQo+ICAgZHJpdmVycy9ncHUvZHJtL21zbS9kaXNwL2RwdTEvZHB1X2Nv
cmVfcGVyZi5jIHwgIDE3ICstLQo+ICAgZHJpdmVycy9ncHUvZHJtL21zbS9kaXNwL2RwdTEvZHB1
X2VuY29kZXIuYyAgIHwgIDE1ICstCj4gICBkcml2ZXJzL2dwdS9kcm0vbXNtL2Rpc3AvZHB1MS9k
cHVfZm9ybWF0cy5jICAgfCAgIDIgKy0KPiAgIGRyaXZlcnMvZ3B1L2RybS9tc20vZGlzcC9kcHUx
L2RwdV9od19ibGsuYyAgICB8ICAgMiArLQo+ICAgLi4uL2dwdS9kcm0vbXNtL2Rpc3AvZHB1MS9k
cHVfaHdfY2F0YWxvZy5jICAgIHwgIDc1ICsrKysrKysrKy0KPiAgIC4uLi9kcm0vbXNtL2Rpc3Av
ZHB1MS9kcHVfaHdfY2F0YWxvZ19mb3JtYXQuaCB8ICA4OCAtLS0tLS0tLS0tLS0KPiAgIGRyaXZl
cnMvZ3B1L2RybS9tc20vZGlzcC9kcHUxL2RwdV9od19sbS5jICAgICB8ICAgMiArLQo+ICAgZHJp
dmVycy9ncHUvZHJtL21zbS9kaXNwL2RwdTEvZHB1X2h3X3NzcHAuYyAgIHwgICA0ICstCj4gICBk
cml2ZXJzL2dwdS9kcm0vbXNtL2Rpc3AvZHB1MS9kcHVfcGxhbmUuYyAgICAgfCAgMTkgKystCj4g
ICBkcml2ZXJzL2dwdS9kcm0vbXNtL2Rpc3AvZHB1MS9kcHVfcm0uYyAgICAgICAgfCAgIDUgKy0K
PiAgIGRyaXZlcnMvZ3B1L2RybS9tc20vZGlzcC9kcHUxL2RwdV92YmlmLmMgICAgICB8ICAgMiAr
LQo+ICAgZHJpdmVycy9ncHUvZHJtL21zbS9tc21fZHJ2LmMgICAgICAgICAgICAgICAgIHwgICA0
ICstCj4gICAuLi4vZ3B1L2RybS9ub3V2ZWF1L252a20vc3ViZGV2L2Jpb3MvaW5pdC5jICAgfCAx
MzYgKysrKysrKysrLS0tLS0tLS0tCj4gICBkcml2ZXJzL2dwdS9kcm0vcmFkZW9uL3JhZGVvbl9k
ZXZpY2UuYyAgICAgICAgfCAgIDEgKwo+ICAgMzcgZmlsZXMgY2hhbmdlZCwgMjc3IGluc2VydGlv
bnMoKyksIDI2OCBkZWxldGlvbnMoLSkKPiAgIGRlbGV0ZSBtb2RlIDEwMDY0NCBkcml2ZXJzL2dw
dS9kcm0vbXNtL2Rpc3AvZHB1MS9kcHVfaHdfY2F0YWxvZ19mb3JtYXQuaAo+Cj4gQ2M6IEFsZXgg
RGV1Y2hlciA8YWxleGFuZGVyLmRldWNoZXJAYW1kLmNvbT4KPiBDYzogYW1kLWdmeEBsaXN0cy5m
cmVlZGVza3RvcC5vcmcKPiBDYzogQmVuIFNrZWdncyA8YnNrZWdnc0ByZWRoYXQuY29tPgo+IENj
OiAiQ2hyaXN0aWFuIEvDtm5pZyIgPGNocmlzdGlhbi5rb2VuaWdAYW1kLmNvbT4KPiBDYzogRGFu
aWVsIFZldHRlciA8ZGFuaWVsQGZmd2xsLmNoPgo+IENjOiBEYXZpZCBBaXJsaWUgPGFpcmxpZWRA
bGludXguaWU+Cj4gQ2M6IERyZXcgRGF2ZW5wb3J0IDxkZGF2ZW5wb3J0QGNocm9taXVtLm9yZz4K
PiBDYzogZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwo+IENjOiBmcmVlZHJlbm9AbGlz
dHMuZnJlZWRlc2t0b3Aub3JnCj4gQ2M6IEZyaXR6IEtvZW5pZyA8ZnJrb2VuaWdAZ29vZ2xlLmNv
bT4KPiBDYzogSGF3a2luZyBaaGFuZyA8SGF3a2luZy5aaGFuZ0BhbWQuY29tPgo+IENjOiBIdWFu
ZyBSdWkgPHJheS5odWFuZ0BhbWQuY29tPgo+IENjOiBKZXJvbWUgR2xpc3NlIDxnbGlzc2VAZnJl
ZWRlc2t0b3Aub3JnPgo+IENjOiBKaWFuc29uZyBDaGVuIDxKaWFuc29uZy5DaGVuQGFtZC5jb20+
Cj4gQ2M6IEpvbmF0aGFuIE1hcmVrIDxqb25hdGhhbkBtYXJlay5jYT4KPiBDYzogS2FseWFuIFRo
b3RhIDxrYWx5YW5fdEBjb2RlYXVyb3JhLm9yZz4KPiBDYzogTGlrdW4gR2FvIDxMaWt1bi5HYW9A
YW1kLmNvbT4KPiBDYzogbGluYXJvLW1tLXNpZ0BsaXN0cy5saW5hcm8ub3JnCj4gQ2M6IGxpbnV4
LWFybS1tc21Admdlci5rZXJuZWwub3JnCj4gQ2M6IGxpbnV4LW1lZGlhQHZnZXIua2VybmVsLm9y
Zwo+IENjOiBMdWJlbiBUdWlrb3YgPGx1YmVuLnR1aWtvdkBhbWQuY29tPgo+IENjOiBub3V2ZWF1
QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwo+IENjOiBRaW5nbGFuZyBNaWFvIDxtaWFvcWluZ2xhbmdA
aHVhd2VpLmNvbT4KPiBDYzogUm9iIENsYXJrIDxyb2JkY2xhcmtAZ21haWwuY29tPgo+IENjOiBT
ZWFuIFBhdWwgPHNlYW5AcG9vcmx5LnJ1bj4KPiBDYzogU29ubnkgSmlhbmcgPHNvbm55LmppYW5n
QGFtZC5jb20+Cj4gQ2M6IFN1bWl0IFNlbXdhbCA8c3VtaXQuc2Vtd2FsQGxpbmFyby5vcmc+Cj4g
Q2M6IFRhbyBaaG91IDx0YW8uemhvdTFAYW1kLmNvbT4KCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCk5vdXZlYXUgbWFpbGluZyBsaXN0Ck5vdXZlYXVAbGlz
dHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4v
bGlzdGluZm8vbm91dmVhdQo=
