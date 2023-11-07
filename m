Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B3ED7E480B
	for <lists+nouveau@lfdr.de>; Tue,  7 Nov 2023 19:17:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E0BDE10E646;
	Tue,  7 Nov 2023 18:17:04 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam02on2062.outbound.protection.outlook.com [40.107.95.62])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C8EE410E646
 for <nouveau@lists.freedesktop.org>; Tue,  7 Nov 2023 18:17:01 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kdWmOlYD77yMQUpVhQnEcDg9MkCs3ju6qfGkeUhfq7OBcZh+1ZwoQBLssZp9fH1syN/uwVh/RaLMB4YjLphJlrby2YbU/sFDGlSbunlocn7PCvu2OgwCebAdHr47LlK79XKo/QUnEzgSq6V4Lfexhe7hhqEkayDyjv1UV5Y9VUrj5fxDIOJG4ZlcM9c22ygULH7Da7Sp9oq4/wlsQejNvC37e7JsWrGdW31FLRjWMwoPVVPbthqTdzQeGW/j8BZUnQ7gp+PkpGXabvhvoTySZyM2Jz674VKwzcXKvn15we4i/yEp79KWI7H8EXvChF6ZHQ6PFPx5BcZVq4JsFl1a/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ks52Lt1uIZliNXFZ4AwSA96GpQfaSM7EycVSqF9s1Jw=;
 b=RFrmrQkyuz/4iLg7Yu0fT8mkNp3BVQsk/0qGB7QGlmPdep1YjfmORruhYdejlhzZVGGqKwG2Q2GJ3Y9jbabmYnk2gPSqwEw6WnjL0cp9OWFU/xWdS9w0bXEz453QJ939hav9DuFZVfXxVJIpSbRGN1r1lSMxiOblg7TItzIoHwq0EzvifGXmpAVaRuxbzOy2WRQcgGUIfJsCH2D5auUkvh0bwYNzlvfuPYcX1sZTawWaECfoB2m69RXcQ/mTy2QyFeyABso/K5dstHD0FzFTJ6OtoF9mVCqP95XKB0uWl8XoIaIJ6acyO9M/mMFesqZuwRsPXeefBc0/Tb+SsKtRhg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ks52Lt1uIZliNXFZ4AwSA96GpQfaSM7EycVSqF9s1Jw=;
 b=B2UYgyNxA+LOdJJ2dBNZe8T1BCt4bu1XBVlprNkKRwzyLrbeJKVHoM9wryk7FBSBUqgbAg2f3uMIbXTQbTvj2Hn+Oq1X7AKjrtbhwQfYnlwXJAZvew9YEZG632c6Qj2/L0wWM6XNA9gRBmaHtJ/ZKKUncd6QEaKenn/wRTPfh1WGfVPboJqlpevmH7Qei3UrvsgRB2TKYA6BcDIUOMZnRLATSZ04kMlrErENu04TKk3O/s94wCZXS9fYbMpq/vvYn6YDoEzXcUj9IEBmbhcp4kgGS1BgT4URqWIlLC0VoxzfrqIfzqNMiv4iX7sTOyFLzWD4Z/dG7ioeDRB9+ysYiw==
Received: from SN7PR12MB8769.namprd12.prod.outlook.com (2603:10b6:806:34b::12)
 by CH3PR12MB8996.namprd12.prod.outlook.com (2603:10b6:610:170::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6954.28; Tue, 7 Nov
 2023 18:17:00 +0000
Received: from SN7PR12MB8769.namprd12.prod.outlook.com
 ([fe80::6799:dc7a:e121:1af6]) by SN7PR12MB8769.namprd12.prod.outlook.com
 ([fe80::6799:dc7a:e121:1af6%7]) with mapi id 15.20.6954.028; Tue, 7 Nov 2023
 18:17:00 +0000
From: Timur Tabi <ttabi@nvidia.com>
To: "me@dakr.org" <me@dakr.org>, "dan.carpenter@linaro.org"
 <dan.carpenter@linaro.org>
Thread-Topic: [Nouveau] [bug report] drm/nouveau/mmu/r535: initial support
Thread-Index: AQHaEYc4JuMOoJsr/E+gVFuDQ5PKvbBu9OYAgAADJ4CAADCfAIAAAXeA
Date: Tue, 7 Nov 2023 18:17:00 +0000
Message-ID: <ee63371a80c54c03793b872f1e33af410ecd3c88.camel@nvidia.com>
References: <b9a97887-9b58-4518-8dd8-3865afb9279b@moroto.mountain>
 <f9a53aa8399313a323232744be57c9908f674f1b.camel@nvidia.com>
 <f6381720-3b0b-40be-a705-0decdf0a3800@kadam.mountain>
 <fa523631-480d-496a-a370-ebda589b441f@dakr.org>
In-Reply-To: <fa523631-480d-496a-a370-ebda589b441f@dakr.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.44.4-0ubuntu2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SN7PR12MB8769:EE_|CH3PR12MB8996:EE_
x-ms-office365-filtering-correlation-id: c989c43a-c310-4c3c-afe1-08dbdfbdbc17
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: dNFi3Bz5jWTaa3w2q7l9f88Y0hK+NXjGeaJIVXzxKWQ+WtutJ0zMt2JxMbKjAoCrywJuP2sOt0jhAvl3LKRhtjy4G7cCnFxn8XENcwkv73vleKWKsFzpSzdcV5VNxHDaTEFQ3TMbReJFQoR2BXoBQkaaYBIyDp81HuTho5Go9RV7VJYEtO32qUN+qd6yINg3P6h4HCBtusLVsTYO1TI5ElS6PL5s+6Z0EWF2Wi6uGlh6JPgiheSso5XBJcrYEdknqXURPPVJG/uujHozsk4LsrK6i7MYTyF3OPmJhibRhl5V4T8hzNbRIsVF0SbwKvIwkBP7W68z8f1304xdrq/z1CMPp1HgSz38wEMAkLu65wOOdr1kGged71Q5d0vYK406cKCfk3AOQPE+QEU4BvfXjLCEz60YAziGv/drjjnUf7Q3AX7YYgvrL00cT/XQpjhkgt+74zaSnckd18XTgjBEt1wsyi+H9zUWvyWKUobGm3KLQB5nnIy9WjOZdF58mTwzcDz8zzPhtMBDNceW4gYn8sRBlvmOL/437Z1shkWjxTxj4kIhhjmK7LpIh6LQALcyOmcFcl/UTqewsdxwVS2COsC+IqfOFqcdTf0nXK3LQMQVxjQektFwaniNNsuQ309x
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR12MB8769.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(136003)(366004)(39860400002)(396003)(376002)(346002)(230922051799003)(64100799003)(1800799009)(186009)(451199024)(64756008)(6512007)(478600001)(6506007)(6486002)(2616005)(71200400001)(83380400001)(66446008)(66556008)(26005)(76116006)(41300700001)(5660300002)(2906002)(66476007)(66946007)(8936002)(316002)(91956017)(4326008)(8676002)(110136005)(38070700009)(38100700002)(36756003)(86362001)(4744005)(122000001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?a29iZURPQzJ5N1JIQTd0dDlZZ2g3dFdOeUJFMEJ6dUN1WmtsbFpub1UzK2xL?=
 =?utf-8?B?UENMWUZ6NnZPbWQzZWZScXVzM0ovSkNKV3hlcm9QOHBoVHNrK2ZVZ21yaWMy?=
 =?utf-8?B?K1ZiTnNHckl4K2drcjNzT2ZjWFB3dStMYWc1ei8vU3hLOGRrd0pPWEsrR0VZ?=
 =?utf-8?B?aVRQYW9adkoxOXBhaDJvQm4raDd6d1NoMnM5UHl6R2JxbEFsTXRGdS82eWlS?=
 =?utf-8?B?d1dJMWtlb2t4R1d1cm1id0I0ODZ3aVV6ajA1OXBMM1JhM2Z4SCsrSUpQa3Z1?=
 =?utf-8?B?T1h5S0U2YXg1Q0tQNmpZMUtiOTBuSnhscXVnZmhRRWJDWGNwQVQ1dTB2MUdt?=
 =?utf-8?B?Z0VzV2drb04yK09BcGZCUjRmYlV5cTcwb2pENWt2NXFoQlVlcFFkMGVVT2p4?=
 =?utf-8?B?c084MENoZVVjSXlwVEIvSnE1L3VGUUEyZGMwbmpTSllwNENmUmsxMHNkdTRU?=
 =?utf-8?B?RHhZcHJsRW9VWkhvK08zYmUrTHVueUxUSUhseFNFbnZFOXBYSThsV3Y3Smoy?=
 =?utf-8?B?UFpmajVTSHlsM3F5bmYzblVqQVJ1UmVNMkN3V2dYWWtiZ2M2OUZ3YjZCVmtj?=
 =?utf-8?B?bVhJb29UbFVmRTEwSmlxSFM0MzJZVnI3ZDNVMUJRMGQ1RFBqK29kNmlKL0lG?=
 =?utf-8?B?S25NTnBUcTZ1bExVeEZFejhlbVBBa3lmZllEdmxNMWJHQWJqNytEaFVCd3Ju?=
 =?utf-8?B?T2Q1dGdWbThrczFhL3FwYUdkU2FIRnJxVkpBSWN0ZjBoMERXWmQvcTJzblVt?=
 =?utf-8?B?WnFRTEQwSENSamlRVWdrYzJWaHFybzIydFVSdExZVjh3aFlzcy9wbXAvZnUz?=
 =?utf-8?B?OHR6ZWIwQjhlUmdkZlNvbkNZbDFRQkQwOHVxVW41NVNORDJwS0V2TXVFUFY2?=
 =?utf-8?B?c24weHl1UVU3YUdES0FBaHVkbU9RMUpRbWNUWUVyTUNnUE15NDZ3YnhhRk1U?=
 =?utf-8?B?amtvSFcyY1Rjci8wQk4wMXN3aGIrRGhsV3ZhL1hMWWprZlNnSzd2SE9Ia0ox?=
 =?utf-8?B?UUVWbGpWRWpiaW92N2VRSmt1ck5aZVNCUFR4ZkZ2ZmFtM0tqTmF1R250eWtj?=
 =?utf-8?B?Y1ZlaFVzNWRFZ2NlV0d6ZE5na0Q5LzVlOU9udDhFRjUrd05WM09kakVJZVU4?=
 =?utf-8?B?MlFkT3hYcFpvSmJTN25sOXhYZmpRQU1oR3RQeE1jSkwxRTgzYU50WGJHNXZo?=
 =?utf-8?B?cHN1Q2FuSEtEL3lSdjJjVVJTc0lCb1BGTXVsdFVKVTF0Q3NEUDFYTHBQakRM?=
 =?utf-8?B?N0xRc2lVQXN1bnpWYWJFWXhFdmw1NUYrY2ZDRDZUZ2Z2MGhHSzlDV1BnWkFF?=
 =?utf-8?B?QzlBbkZocUJhRStwQUhqZ05JRFR0UVBCa21ZdmtMZVlENVZicDlLN1MzWTdU?=
 =?utf-8?B?anRHcTM0OC9IRm5YNnhpMDB4dFQyU21qdVAwaElHenVYdjd0bWtoTmlDTkIy?=
 =?utf-8?B?MEhGMzZXNVUzWnlSWUdRNTVvTzdWTkJ0QVZDYUd2MGdUdE5JaGlLcllPK29x?=
 =?utf-8?B?dDRxb3c0dC8vYmdIWnpuaTExUGdkVDJJM1IrNHQ2ZG9BU3UrWkNZYVJOMjhQ?=
 =?utf-8?B?dU9zcWUwbFBGZS9mRThMbFYwRExTQUlYMnM5Rm1IMDExRjdyVzl0c1cxeHZr?=
 =?utf-8?B?M2E3VFBQUjVBbjhESWlDTDVaQW1QWmRHUkIwMkswY05uREhyTVVXeVFMYlVo?=
 =?utf-8?B?NmxaU2VXY2JZakhIb2tNanhwdUtoMzRzSENkSVFVUDVlNmtUTEM1YStMTEZI?=
 =?utf-8?B?dHBaclU3QkZvbFRrUnBBWVlGek5ZQk9xL1pCR2NPc2pvZXVDTDQxRUVDM2FY?=
 =?utf-8?B?RGF4dlRyUFhFVVBQeDZWWityZjBPRG56WTRzT3Fsb2xYdy9pNERjcUtRYVl3?=
 =?utf-8?B?M043dDlWbWVxWG9sVitjenpIR2k3eVFBMTBSQ1NGZVFhU0pOdzlFR2ZyY1Fy?=
 =?utf-8?B?cDByOVRDbVRQRExBNEM2NEMrdWZWdEhzZHNrRk1EeHcyUCtLZFVpK2tSMWJy?=
 =?utf-8?B?THpUMDVMaDd4UUR3UGN3NG1VbWpNQ3FXaFg4cUdtQTc0bnVKZEV2RlNrSTVF?=
 =?utf-8?B?bjkvQTgraG5zOXNsdkM0Lzk5VVZVWlBBUnNEa3dNVVZjMlpVVlVQS3lIVzdR?=
 =?utf-8?Q?y1ydMsM4Oh2WYxnSFl1GDLAfe?=
Content-Type: multipart/alternative;
 boundary="_000_ee63371a80c54c03793b872f1e33af410ecd3c88camelnvidiacom_"
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN7PR12MB8769.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c989c43a-c310-4c3c-afe1-08dbdfbdbc17
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Nov 2023 18:17:00.0257 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: qrDC5JgP+lbRvtX3Crs15gNgU+hgRtpjt/N7Sq5L76xPfAxZMtS7umuKMIlzUUvVClgcGNiJZ5HH5G6zwE4Mnw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8996
Subject: Re: [Nouveau] [bug report] drm/nouveau/mmu/r535: initial support
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
Cc: "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

--_000_ee63371a80c54c03793b872f1e33af410ecd3c88camelnvidiacom_
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

T24gVHVlLCAyMDIzLTExLTA3IGF0IDE5OjExICswMTAwLCBEYW5pbG8gS3J1bW1yaWNoIHdyb3Rl
Og0KSSB0aGluayB0aGUgcHJvYmxlbSBhbHJlYWR5IHN0YXJ0cyB3aXRoIGdmMTAwX2Jhcl9uZXdf
KCkgbm90IHNldHRpbmcgaXRzDQpwYmFyIGFyZ3VtZW50IHRvIE5VTEwgb24gZmFpbHVyZSwgYnV0
IHRoaXMgY29kZSBhc3N1bWluZyB0aGF0Lg0KDQpJc24ndCBpdCBzdGFuZGFyZCBwcm9jZWR1cmUg
Zm9yIGZ1bmN0aW9ucyBub3QgdG8gd3JpdGUgdG8gb3V0cHV0IHBhcmFtZXRlcnMgb24gZmFpbHVy
ZT8NCg0KR2VuZXJhbGx5LCBJIHRoaW5rIGl0IHdvdWxkIGJlIGJldHRlciBpZiBhbGwgdGhvc2Ug
ZnVuY3Rpb25zIHdvdWxkIHJldHVybg0KYW4gRVJSX1BUUiBvbiBmYWlsdXJlLg0KDQpBZ3JlZWQu
DQo=

--_000_ee63371a80c54c03793b872f1e33af410ecd3c88camelnvidiacom_
Content-Type: text/html; charset="utf-8"
Content-ID: <0D823B62AF35FB48A6B90E3B5CA0EBDE@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64

PGh0bWw+DQo8aGVhZD4NCjxtZXRhIGh0dHAtZXF1aXY9IkNvbnRlbnQtVHlwZSIgY29udGVudD0i
dGV4dC9odG1sOyBjaGFyc2V0PXV0Zi04Ij4NCjwvaGVhZD4NCjxib2R5Pg0KPGRpdj5PbiBUdWUs
IDIwMjMtMTEtMDcgYXQgMTk6MTEgKzAxMDAsIERhbmlsbyBLcnVtbXJpY2ggd3JvdGU6PC9kaXY+
DQo8YmxvY2txdW90ZSB0eXBlPSJjaXRlIiBzdHlsZT0ibWFyZ2luOjAgMCAwIC44ZXg7IGJvcmRl
ci1sZWZ0OjJweCAjNzI5ZmNmIHNvbGlkO3BhZGRpbmctbGVmdDoxZXgiPg0KPGRpdj5JIHRoaW5r
IHRoZSBwcm9ibGVtIGFscmVhZHkgc3RhcnRzIHdpdGggZ2YxMDBfYmFyX25ld18oKSBub3Qgc2V0
dGluZyBpdHM8YnI+DQo8L2Rpdj4NCjxkaXY+cGJhciBhcmd1bWVudCB0byBOVUxMIG9uIGZhaWx1
cmUsIGJ1dCB0aGlzIGNvZGUgYXNzdW1pbmcgdGhhdC48YnI+DQo8L2Rpdj4NCjwvYmxvY2txdW90
ZT4NCjxkaXY+PGJyPg0KPC9kaXY+DQo8ZGl2Pg0KPGRpdj48c3BhbiBzdHlsZT0iZm9udC1zaXpl
OiAxNC42NjY2NjdweDsiPklzbid0IGl0IHN0YW5kYXJkIHByb2NlZHVyZSBmb3IgZnVuY3Rpb25z
IG5vdCB0byB3cml0ZSB0byBvdXRwdXQgcGFyYW1ldGVycyBvbiBmYWlsdXJlPyAmbmJzcDs8L3Nw
YW4+PC9kaXY+DQo8L2Rpdj4NCjxkaXY+PGJyPg0KPC9kaXY+DQo8YmxvY2txdW90ZSB0eXBlPSJj
aXRlIiBzdHlsZT0ibWFyZ2luOjAgMCAwIC44ZXg7IGJvcmRlci1sZWZ0OjJweCAjNzI5ZmNmIHNv
bGlkO3BhZGRpbmctbGVmdDoxZXgiPg0KPGRpdj5HZW5lcmFsbHksIEkgdGhpbmsgaXQgd291bGQg
YmUgYmV0dGVyIGlmIGFsbCB0aG9zZSBmdW5jdGlvbnMgd291bGQgcmV0dXJuPGJyPg0KPC9kaXY+
DQo8ZGl2PmFuIEVSUl9QVFIgb24gZmFpbHVyZS48YnI+DQo8L2Rpdj4NCjwvYmxvY2txdW90ZT4N
CjxkaXY+PGJyPg0KPC9kaXY+DQo8ZGl2PkFncmVlZC48L2Rpdj4NCjxkaXY+PHNwYW4+PC9zcGFu
PjwvZGl2Pg0KPC9ib2R5Pg0KPC9odG1sPg0K

--_000_ee63371a80c54c03793b872f1e33af410ecd3c88camelnvidiacom_--
