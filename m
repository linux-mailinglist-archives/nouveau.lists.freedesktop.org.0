Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 797199B7EFA
	for <lists+nouveau@lfdr.de>; Thu, 31 Oct 2024 16:49:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 24CFA10E8E8;
	Thu, 31 Oct 2024 15:49:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="Qb6NPHKk";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2056.outbound.protection.outlook.com [40.107.94.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 40A9710E40A
 for <nouveau@lists.freedesktop.org>; Thu, 31 Oct 2024 15:49:42 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LhsjzAoxa796HvEKTu1YSAZNBBOfXfoPDe0oKLuhIPcMfAUsk49zk7nhtLGnrDd7ZpPcgKSDuTWcmKJW8x3BFnJdpMOhl5oZwCXTIp0mpyDk8EPVF2YJ/By+suj7lfasJxUAbd1nT/lVWESCUZMI1ndnV4S0ZcQx0kHjf3UV4o0TYCc1QvGpO7KNT1vplT15Ep+WNROn5Bmg1RzpuMSMcoOp5piOJ7qzfHz/5BML81sMsY41wcbb9QkUel05rbFkTtpjkmqyucgs2A5NKPKy1KPOTEMHYf/WTenNJRWCZKSpTsY4Yt2ywtK33PPXY/ob/Lq1PcGqeTmzO9ZwNqKQJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GkwIkxlH4DloZNXtwEvFfcsa3le+sBanQmviq9subcU=;
 b=SL3YHbQlaQnjsRzjegvrUInS7/KFS1msznmDrmwP+ClgXzaLBkFUhB+8kH89uPuuj45mmLq9/GdAxXpbZfpfeHRY5tMbgCuFwX2xcT6e2WxCqBo/Mcydpj/W6zpFGQkoRBDK9jBX8egy2ksW9Y5Fos89PL495pdOKAmJOsVnSWHlInnCSW3wz4Uc2J0OdPQoq1ViI4IKD+FuHh7gMHQslUuAWeuLVRvKao4+XdnRWLK9Xs5wAuADNw8Ve6dzKxN1vF6i+BNVu/nuPBEO+J7xyDbxbOe67UIBXRDr9ykGUYtlIbZ3hNr6fhjLtz10c6snyXledJ4U1XzeNbeJTbOong==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GkwIkxlH4DloZNXtwEvFfcsa3le+sBanQmviq9subcU=;
 b=Qb6NPHKk3SvfArcy19MC8vF63Tylj6txqyW+5Vt6kVR2ccH3vrrhbN7k1nDD7ssKSh3kgFqv/o591tBlQa3YX+RleZ1dbN+TcpyA3AjUdHL8ohyOG801enpOkWRp0+ADlQ53vgtopOL1/MIOI6dkAiKRwJYuu8046MDzb+QIx8H21LBfqniSxTK8GBy9SHNx82HWS6fqZU+GYU74Xqg8cNuk8FI7/mBo3VE5K45tG+sv8fvHpxsos8f1+xV87OcsZvCtoDcO/mmmaNzv+b48r2XoCuqr3w2M/olmYDp3TZS3/BHdXYdbQxwAozyotTt2H+Po7FklooDSC/NLgtCjNg==
Received: from SA1PR12MB6870.namprd12.prod.outlook.com (2603:10b6:806:25e::22)
 by LV3PR12MB9143.namprd12.prod.outlook.com (2603:10b6:408:19e::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8114.23; Thu, 31 Oct
 2024 15:49:36 +0000
Received: from SA1PR12MB6870.namprd12.prod.outlook.com
 ([fe80::8e11:7d4b:f9ae:911a]) by SA1PR12MB6870.namprd12.prod.outlook.com
 ([fe80::8e11:7d4b:f9ae:911a%4]) with mapi id 15.20.8093.024; Thu, 31 Oct 2024
 15:49:35 +0000
From: Zhi Wang <zhiw@nvidia.com>
To: Timur Tabi <ttabi@nvidia.com>, "nouveau@lists.freedesktop.org"
 <nouveau@lists.freedesktop.org>
CC: Surath Mitra <smitra@nvidia.com>, Ankit Agrawal <ankita@nvidia.com>, Andy
 Currid <ACurrid@nvidia.com>, Kirti Wankhede <kwankhede@nvidia.com>,
 "airlied@gmail.com" <airlied@gmail.com>, "Tarun Gupta (SW-GPU)"
 <targupta@nvidia.com>, "dakr@kernel.org" <dakr@kernel.org>,
 "zhiwang@kernel.org" <zhiwang@kernel.org>, Aniket Agashe
 <aniketa@nvidia.com>, "daniel@ffwll.ch" <daniel@ffwll.ch>, Neo Jia
 <cjia@nvidia.com>, Ben Skeggs <bskeggs@nvidia.com>
Subject: Re: [PATCH v3 10/15] nvkm: refine the variable names in
 r535_gsp_msg_recv()
Thread-Topic: [PATCH v3 10/15] nvkm: refine the variable names in
 r535_gsp_msg_recv()
Thread-Index: AQHbK3JjGqzo8eHFVkW0vEp9skMUH7Kg60SAgAAW0AA=
Date: Thu, 31 Oct 2024 15:49:35 +0000
Message-ID: <dae97b53-7ecc-484c-ad34-a5a649145862@nvidia.com>
References: <20241031085250.2941482-1-zhiw@nvidia.com>
 <20241031085250.2941482-11-zhiw@nvidia.com>
 <c49355ab2b273d074e060671558f6a2bb6009c20.camel@nvidia.com>
In-Reply-To: <c49355ab2b273d074e060671558f6a2bb6009c20.camel@nvidia.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SA1PR12MB6870:EE_|LV3PR12MB9143:EE_
x-ms-office365-filtering-correlation-id: 2fd1a69c-d28d-4bff-2316-08dcf9c39ed7
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?YjAwdkJtM1lzRXRURzNCblR3c0lYUndzRG11YUJKemt2ZXl6YXd4MkRCbjJI?=
 =?utf-8?B?aFVqWEtpejVDSUQ2OXpIV2VvK1pZeE03ZTl5dFdXTmYwMkI4ZUZWWFkwVUpU?=
 =?utf-8?B?M01YeE5LSmIxV2Q1OWtLMlVDdEVtb0pmNm01MXc1OVUxTk95aFNMU1lFcG0r?=
 =?utf-8?B?TGNmdGxkVFN4aVlTN2lDWXpMQ3M2S1BwenpWRVdyQkNaWDVZWXNIaDJzLzdN?=
 =?utf-8?B?NmFDdGcxQzE5dG54anhIVnFpRDNhSXdoeS9SL3FtYUFzeEZoeDRpeVcwem05?=
 =?utf-8?B?UmZIZzhONThsTkJBd3dTYmNocGc4VWtWVk9ENnRORkIzSWhhMTJmbVp0bytH?=
 =?utf-8?B?VGVaZU9sWlpwOGJNZUFTYVZYTHdWV2o2NUpRVmVkVHpVcUpyL1BwUjhjeWJJ?=
 =?utf-8?B?cmpmbEpDckZDMlhwWlNSWjh3Ujl2MEdlUzNrNG9aSzgveDRlRXZzbVJsK2ZR?=
 =?utf-8?B?ckhWcHBzQkY5Z0NMYXVmc3hyVlpkQlhCZmdDUmhUNDRBQW1URmhqL2tsaW5R?=
 =?utf-8?B?M0wzd0pHNGdGbEozMngzYjIrVXZYcHdUR09MUVdyYzBseVhwcGlXNk9EMk5x?=
 =?utf-8?B?cTMxNHp0MHYwMDBkNmFjUmk1M3Erd2s0RXJBeGpnd0lyV282eFhwcHhDdzB4?=
 =?utf-8?B?aEtJSVBIUmZNajUxMHF4THBxVThUNUo0TTc3L0pEbmJ1b1ovYVduckRxUHkw?=
 =?utf-8?B?eTRjaFBseCtRSGtpOE9HVUo1Ym1CZkdzR1ZMa1g5SlNXQ0Z1TFVOa1VKcTlo?=
 =?utf-8?B?dTk4R0F5NVRpSWYzUXkvZStpeEpQT0NKNDA2MGNCTUdoK3Y0blo1enJxbXFT?=
 =?utf-8?B?MzNNLzZraituVmkwcDBxVFhVUUtJK1NPS0drWng0ckUxMWtEbkZaWXFsSkV4?=
 =?utf-8?B?SFN2Ym1WWk5rc3htVFNSYTBoM3F0QXRDZEFkek1jWGxEcEQ2d2RVSTVrakl3?=
 =?utf-8?B?WjNTeVNpWlNnMWVWQWFiajhkM1ZETUZqdkczUEUrM1lJTWx1YU1VOE1PTTdi?=
 =?utf-8?B?c0p0aTBTYWhsRU00VTZubmI3cldyT29LRWlvQzBlRFFDY3BqejM3Tk5GN2xw?=
 =?utf-8?B?T3hjN1VuOW41MjBIQ0xKQVNZR0Z4aWpXZXUxVk80ZGgyYS9aSGpTOGZmbkND?=
 =?utf-8?B?ODFyN2dOWEh1aytDbFk3Ny9nWjk0dEsyTi9SSEQ2SzJOYlNlYnlKd0lmcjNW?=
 =?utf-8?B?encrNDZoaWlMYkRJNE9lZi9QcUh0NThXTkNjbXAyQVBIa3MxYU95d2k0UnlI?=
 =?utf-8?B?NjNoVG5jN2t5b2pnb1ZISDg3NFR0MGh3WWkyUXgzTTNSWXd3eEhOUkk0bUo0?=
 =?utf-8?B?ZjdjWFV6ZUg2RE9raXVpSHNEazc0L1BJUFJ3eE1uV3VnT0piektobFUrZHMz?=
 =?utf-8?B?b0cxVHV4cG9tbXVGNS9ubmpOY1JxQ2Y1NWUwaWxjWW14NUpKK29CUmNjTGVV?=
 =?utf-8?B?VDErQlkvTDN3bE5kRkNQZE42NmtVTHg4THNIS3h6VEw2c1E5aldZS01TZVFM?=
 =?utf-8?B?a1A4Szc1WkZxSE5UTVZ5V3hrbmU2QXF1V21ValFuRDIvOUI4eXpyR3plSE1M?=
 =?utf-8?B?VzhSSG81SW5uRFhiQmNsSldQTHdyb0dxQTNhTDc1YU9JUDhGenMrY3RxSjA2?=
 =?utf-8?B?VHo0M3haL3ZJQVJ6VW9PazQwbFBybGF3VStmUnh2cjkvZVl3S1pTSlY5ZVlr?=
 =?utf-8?B?MDdmUi9HV1BEdForMjRDRzN1NGF1RFpnMjJqRjBUaVduWlZmM3IyOWlrU2Z4?=
 =?utf-8?B?dVpzYk92WmF2bnB4QWdWQ0ZlVGJaSEtOZlUzK3ZBTEdiWUQvdUpJUGhpU3JR?=
 =?utf-8?Q?r/XfcUTgQbHBjuWOFtCc3q8RxZzA910Yr1mSg=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA1PR12MB6870.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?WVZKV3JwcFlrVk1GTXhMZUwwa01RcWdoN2lRQzk3M2RtSGFRYWZVVGRESzkr?=
 =?utf-8?B?b1p0VFFBbTJ5Z2ZQNmQvSGhZekRVaGtzcHpZdEVFcDV4bWVXQ0oycXo1by9Y?=
 =?utf-8?B?U2UyRUUzMHBWbTNtRDdoblpTcXBMVTVMTC9IMzV2NXR3Rm95bTJuRzlwUWt1?=
 =?utf-8?B?OVdlWUlzdnI3MzArRkNLdG9VclBlV1kzWlM5K1l2dUhFTzNsbGdJeko2eVJN?=
 =?utf-8?B?eFc4aEVSUjdpeC9ja2MrUC83c3dkRUVCOCtOMk5ab2RwaW1udzRuZTV0NHg0?=
 =?utf-8?B?bHNuT3NkTVYycHptd0JVY3hxa3l1WWFuWkhCeExZWnZreDExQktGbkVBRkVz?=
 =?utf-8?B?cXV4eVpoMklBOFphd0YvNGhRMDVxcDJmWk9LOTJxVnl2NnZwRFhBbmlML3R0?=
 =?utf-8?B?WkJyS25uTENBN0JFYkR6WWptTG1aTXVZWG44MTFuZG9LbUVocEVlYkIrTTNr?=
 =?utf-8?B?SkdYNWszbmd6VGl6ZWVTVWJROEhWcnRWR3NKMzBzbU5GTUtFVy83UVpHdXU5?=
 =?utf-8?B?ZkFKcEpQY0NGam5PWmRTbUNvcHdUc3o3cjdnVHJ6eUhld2J2ZFRwZ01wbS82?=
 =?utf-8?B?TUhReGtQNTFzODBReXFtcXNGRkRIbFJ0Sm5PS2VIamFDWkxTR2xic0hmandp?=
 =?utf-8?B?ZXUyd3Y3SllIaG1lSzZhcFMyUjFidXNjaVI0MWJIdkFvZVQrMk0rc05RQzly?=
 =?utf-8?B?TzZrZXphYW5RS1FvNFY4RG5iMHdQTmVTbUw2TDdkSzBxTDRPZ2E4UStCZ1dS?=
 =?utf-8?B?Mm1VU2pyQi9TYW9zbWlPbEE3cEdtNnE1c2V6bWs5QVVrNCtwYy9vbWhUK2M1?=
 =?utf-8?B?dzA3NzhhSGdaaWxhZWt6czNqTnVuRDRHN3R2d1JmNEhiTlRxSWdTSmErS1A4?=
 =?utf-8?B?cnA5WjFNTHVoS2YyK1JaRCt1cjA4QlNxNU5RcHEvWlgvTVdGblNDeFhUTXZ6?=
 =?utf-8?B?VUlON1FRT3JYZDVtK3FqSXczVEdxQng0OFZ3aFdGTGwzVXJsTUc4a3Z0MVRT?=
 =?utf-8?B?RjZzWll6KzRESzhsQWZHZFQrVGx4Y1hzelFjYStmRUY4V1djeVNzcEhpQ3Mx?=
 =?utf-8?B?enhpOWw3K1hMMzFVZnNOSUlteTZubXpkWDdVM2pWbmg0MkJocytpWmNmdVVt?=
 =?utf-8?B?RWlRUFFsUm9NM3F2dWxSWkRtbXJwRlh2Zk9EZ0RsUkM4dkVHNVhSR1h6RVhO?=
 =?utf-8?B?Z1Z5L3hKOHh6VlpyWHBPbXFLSVN5dW1xdnNOdTZ6SmVzSXNBc0ZKV0ZVOHhN?=
 =?utf-8?B?eWlXR2M2aWtiYVRQK09JMXZOd0pJTmZPS2JObFd3ajljb0NQMkxXZTljUlZ4?=
 =?utf-8?B?eXRzWkR3NURBYmJLaG1NSi9TS1V2Q3ZZUkt5Q0NJUUZ2N1J1SU9PUFJHRHQr?=
 =?utf-8?B?eSt2clFvREcvZlNzV1hXNDVSb0lOTFdVVU5ma2NOQmRlRWNqYXlxMklqNmdT?=
 =?utf-8?B?NjJuankva25TcXArdEdEOEN2Z0VVVzR6cjVIYll4YXZSZnRGT1JlK0lmOHp5?=
 =?utf-8?B?YVdnT0gwcjRuYlVrTjRyTE8yczVwd1lSVEp2cE5kNUlDcDFoeHFZQVMwRjFp?=
 =?utf-8?B?aEI3UzRWYTlUNmYrWFUrMVNwQ1lwaW5hS2dvK2Z6SlM1UGNxd3VlQm03cE13?=
 =?utf-8?B?UlU1cG1aSmErQ2pweHRESGpSQkViOGZwQU5WS3BMV09HdXpJd3VlYmxGb2Z2?=
 =?utf-8?B?bTZ5MEJLMmRHcERkVy8wTGxPZG45VHo1ZTFZTWMzZFlaMjFOYmpySnRsT09t?=
 =?utf-8?B?RFFFazBoU1Q0MTk4YWo5SDZ6TzZlZVJLMExHWVNBZWlEZE9uL0Y4OFdra2Ew?=
 =?utf-8?B?UlZKSk9vVUFsMmdGeGE2YzlvNnR2elYrRkNWMHpkNjkzK1ZNcm5qd1d1dVBz?=
 =?utf-8?B?em5ZNlJMY1JpVCtpRUgrSlVYdUFjejc1cjM0NTFiQzJ1THhZd0IrbkVZZXBa?=
 =?utf-8?B?dTFuMTVFZUxramVjWEJ6L2dEZGhTNkZSL0xzR2NUOHE3b0k1UWh3VTBnTkRD?=
 =?utf-8?B?S3h3UW5DeGhJWkNQMzhiZWNxUllZdGlrNEhXek5PT2pDSStiZlc2Nk1TbUp3?=
 =?utf-8?B?clg5ck9GZmVFcGdVS2t0NmJxVGJ0WnlVOGsxNm1hcDR1cFpSV3JQZGgzTlNU?=
 =?utf-8?Q?jhbM=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <4C6743B4B117994291B0423D2D114080@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA1PR12MB6870.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2fd1a69c-d28d-4bff-2316-08dcf9c39ed7
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Oct 2024 15:49:35.8507 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: +wK3gpLwP9x1TfSFbI3AN/PGJDXIBKngHUzfNkc6rDq4Bd064I1WM+P9aeBtZ6KL
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR12MB9143
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
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

T24gMzEvMTAvMjAyNCAxNi4yNywgVGltdXIgVGFiaSB3cm90ZToNCj4gT24gVGh1LCAyMDI0LTEw
LTMxIGF0IDAxOjUyIC0wNzAwLCBaaGkgV2FuZyB3cm90ZToNCj4+IEBAIC0zMzYsNTkgKzMzNiw2
MCBAQCBzdGF0aWMgc3RydWN0IG52ZndfZ3NwX3JwYyAqDQo+PiAgwqByNTM1X2dzcF9tc2dfcmVj
dihzdHJ1Y3QgbnZrbV9nc3AgKmdzcCwgaW50IGZuLCB1MzIgZ3NwX3JwY19sZW4pDQo+PiAgwqB7
DQo+PiAgwqAJc3RydWN0IG52a21fc3ViZGV2ICpzdWJkZXYgPSAmZ3NwLT5zdWJkZXY7DQo+PiAt
CXN0cnVjdCBudmZ3X2dzcF9ycGMgKm1zZzsNCj4+ICsJc3RydWN0IG52ZndfZ3NwX3JwYyAqcnBj
Ow0KPj4gIMKgCWludCB0aW1lID0gNDAwMDAwMCwgaTsNCj4+ICDCoAl1MzIgc2l6ZTsNCj4+ICAg
DQo+PiAgwqByZXRyeToNCj4+IC0JbXNnID0gcjUzNV9nc3BfbXNncV93YWl0KGdzcCwgc2l6ZW9m
KCptc2cpLCAmc2l6ZSwgJnRpbWUpOw0KPj4gLQlpZiAoSVNfRVJSX09SX05VTEwobXNnKSkNCj4+
IC0JCXJldHVybiBtc2c7DQo+PiArCXJwYyA9IHI1MzVfZ3NwX21zZ3Ffd2FpdChnc3AsIHNpemVv
ZigqcnBjKSwgJnNpemUsICZ0aW1lKTsNCj4+ICsJaWYgKElTX0VSUl9PUl9OVUxMKHJwYykpDQo+
PiArCQlyZXR1cm4gcnBjOw0KPiANCj4gSSBrbm93IHRoaXMgY2hhbmdlIGlzIHN1cHBvc2VkIHRv
IGJlIG5vbi1mdW5jdGlvbmFsLCBidXQgSSBkaWQgbm90aWNlIGENCj4gcGF0dGVybiBoZXJlLg0K
PiANCj4gVGhpcyBmdW5jdGlvbjoNCj4gDQo+IAlycGMgPSByNTM1X2dzcF9tc2dxX3dhaXQoZ3Nw
LCBzaXplb2YoKnJwYyksICZzaXplLCAmdGltZSk7DQo+IAlpZiAoSVNfRVJSX09SX05VTEwocnBj
KSkNCj4gCQlyZXR1cm4gcnBjOw0KPiANCj4gRnVuY3Rpb24gcjUzNV9nc3BfcnBjX3BvbGwsIHdo
aWNoIGNhbGxzIHRoaXMgZnVuY3Rpb246DQo+IA0KPiAJcmVwdiA9IHI1MzVfZ3NwX21zZ19yZWN2
KGdzcCwgZm4sIDApOw0KPiAJbXV0ZXhfdW5sb2NrKCZnc3AtPmNtZHEubXV0ZXgpOw0KPiAJaWYg
KElTX0VSUihyZXB2KSkNCj4gCQlyZXR1cm4gUFRSX0VSUihyZXB2KTsNCj4gDQo+IFNvIGlmIHJw
YyBpcyBOVUxMLCByNTM1X2dzcF9tc2dfcmVjdigpIHdpbGwgcmV0dXJuIE5VTEwsIGJ1dCByNTM1
X2dzcF9ycGNfcG9sbA0KPiBleHBlY3RzIGFuIGVycm9yIGNvZGUgaW5zdGVhZC4gIFNpbmNlIGl0
IHRlY2huaWNhbGx5IGRvZXNuJ3QgZ2V0IG9uZSwgaXQNCj4gcmV0dXJucyAwIChzdWNjZXNzKS4N
Cj4gDQo+IFRvIGJlIGZhaXIsIGl0IGRvZXMgbm90IGFwcGVhciB0aGF0IHI1MzVfZ3NwX21zZ3Ff
d2FpdCgpIGNhbiByZXR1cm4gTlVMTCwgYnV0DQo+IHRoYXQgaXMgb2JzY3VyZWQgYnkgdGhlIGNv
ZGUuDQo+IA0KTmljZSBjYXRjaCENCg0KSXQgc2hvdWxkIGJlIGZpeGVkIGluIHRoZSByZS1mYWN0
b3IgaW4gUEFUQ0ggMTIsIHdoZXJlIA0KcjUzNV9nc3BfbXNncV93YWl0KCkgYWx3YXlzIHJldHVy
bnMgYW4gaW50IChlcnJvciBjb2RlKS4NCg0KPiANCg0K
