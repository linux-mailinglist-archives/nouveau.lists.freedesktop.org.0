Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AB882846296
	for <lists+nouveau@lfdr.de>; Thu,  1 Feb 2024 22:26:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ACD1210E7C4;
	Thu,  1 Feb 2024 21:26:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="ZWcL0trZ";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2074.outbound.protection.outlook.com [40.107.243.74])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B95510E95D
 for <nouveau@lists.freedesktop.org>; Thu,  1 Feb 2024 21:26:53 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mpUFgX6gXxmmz6FV3Ls0Y6unraXy6c5/7Fg5EL6J2SOUEWjvqFMkrsywVDoIGrJWyRTzsJwlOjYDOH8zRyA3BDu+nx9TWkfUpNsQiaNfsrx15dx79svKYvIP3CrrmI94QBDe9shxo28OisVSyki58XwwFAoFc1bb7q2QfpQQ59hJ2SwR6hAzkfCvBE6k9iz3ZEPlOipcHqpytcKVCt8amxpL7j55byQHpo9Z6ZvQM37IuPM6cgLJ5uxCF4PbUgwOL8FX0c9GqAS5dK2SbYXqavTLkeyi5VM6lWspNg6K6JnW8oCb6DZ6pF9wIUlDnreappd6hKsORNdYq4mhzOTtFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ADbFn265J91OH+sFeyXJZ31fUKzrWewDVh/YHseiBuo=;
 b=SZu43/fFajj6DzNb6an2g7gDEv+4d+VxlqzwaBKoBkFxMX7Uzdj/o5YELXwG6OG8ScQEGohX+UkBpReZmxOUN3dz2He3s80fkrZoL68pLmo07OyITva+u78gS20gMuiBYFvodFy5iQ1kbXNHFwr7NWVy57+9R64tQRZSlp+mpZ4hy7U1LXw53kwIpX6LUXk1m2KMcmmsZcugIfykS5A+bjPqQiNBc8+3rvinbWdBL48GCdSbkYroytaatcAd6fR06lu0aKn6RpQbzhi1b+xoNo2rw0+WrX6gKHBlmlytzYWy6Gp0p3s6yLEb3PJJbWuqqvaYGjgNsGLGaoR7b3laiQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ADbFn265J91OH+sFeyXJZ31fUKzrWewDVh/YHseiBuo=;
 b=ZWcL0trZGz4J+lyigdB/TPX1ybJZ7H7OEA+wDtOGLkrwQK2GGYW0alevPa2YoX7Tec1OZjPcblq+VGuV/1mMF9/DAxldkYvmuKvDaLlwKKGPY1/qdGdHh0HbLztJ/WfCV5vOKKWHPG9MRg7LtDRNyX9SA1t3FBTyvGOmlOqDpMNjgFSVCbsyNzSO6gtqHM/9yK/Nfh7vSAKBEhiVHGnipX8DHls9cBC/tmKyN3Buw/jzbqXFWBLo4y4/34j/BCYqhKj1OpRv/m0GkKQ2P5kRHJbdKvv4x0Xp5AyuUe3FABkzd7zGULjwzzBKEwgVCpRUY/n873BMGy9oNv8E1RMrmg==
Received: from SN7PR12MB8769.namprd12.prod.outlook.com (2603:10b6:806:34b::12)
 by CH2PR12MB4969.namprd12.prod.outlook.com (2603:10b6:610:68::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7249.24; Thu, 1 Feb
 2024 21:26:49 +0000
Received: from SN7PR12MB8769.namprd12.prod.outlook.com
 ([fe80::9f0f:632e:815c:f953]) by SN7PR12MB8769.namprd12.prod.outlook.com
 ([fe80::9f0f:632e:815c:f953%7]) with mapi id 15.20.7228.029; Thu, 1 Feb 2024
 21:26:49 +0000
From: Timur Tabi <ttabi@nvidia.com>
To: "airlied@redhat.com" <airlied@redhat.com>, "nouveau@lists.freedesktop.org"
 <nouveau@lists.freedesktop.org>
Subject: Re: [PATCH] drm/nouveau: fix several DMA buffer leaks
Thread-Topic: [PATCH] drm/nouveau: fix several DMA buffer leaks
Thread-Index: AQHaVUiZd14XnRH680S/yXd3SXn/vrD2ACmA
Date: Thu, 1 Feb 2024 21:26:49 +0000
Message-ID: <668e68a40a81d751682033684e049dda07ab049d.camel@nvidia.com>
References: <20240201195502.1706490-1-ttabi@nvidia.com>
In-Reply-To: <20240201195502.1706490-1-ttabi@nvidia.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.44.4-0ubuntu2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SN7PR12MB8769:EE_|CH2PR12MB4969:EE_
x-ms-office365-filtering-correlation-id: e13c4d49-01d1-48ca-3648-08dc236c805f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: NzOI+iXazIqJow8uhUzKuVRPYEJGvATZTi/GkwiQBZ2idQY/AJCrSbZZyD2kimLu1YbjuNNrWgkAXftpPSevQA2y8oW0UZN4SX6MBc0vB364Qnv+EA523P7Df29W2BEqm3fdZpMT/5liZtyf0c5t3lzsdFDOnlkmae3xMEY254afviwe5IhFpyW+wx13Xv4p/FupnRAiUcm5tpz0bR7uz9Qi9qmGXtewoNYmcr0wUmXaPTnaBundK5o64KrKgiAy2xXlE9YabKDscDU3QY6XGVroBlbDrwgVYoJF1vcGmiPiFPATV0XQoecS8pH4/LGlzQHKAKDKxoLlgn6i9zqVwyegk2zJcXlTOPHJ9GckPr1mDnAkBZiFOz1WxFEpAaJlybfqYxqem7LTmuyUu/qySRTW1v6P7N0JlOmr1xoN2b2h5jg/sKS7ER8SahA7VVXlyHkcIZ5kYqwPu9dp9aAuSzWTvzOeiCKiMp3Ov88I1lR1VJn87yGOVJzUoA0ls2XejiYJ+Y3pLLpCD7DfYt0q5waNkB7ZmBibt6vAn4YnvKEeldeOK6LBY1dbuBVUnLYDtqJhSaHm8pLkrc+Ef1PcVfTn++4G02TTUrbDSzrvitbKraVmxp96fDN6IqybD1/Z
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR12MB8769.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(39860400002)(346002)(136003)(396003)(376002)(230922051799003)(186009)(64100799003)(451199024)(1800799012)(83380400001)(41300700001)(86362001)(36756003)(38070700009)(38100700002)(122000001)(2616005)(26005)(6512007)(6506007)(4744005)(66556008)(66946007)(2906002)(478600001)(110136005)(316002)(66476007)(71200400001)(76116006)(64756008)(66446008)(8936002)(8676002)(5660300002)(6486002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Smg3eHVHU1g4eURpdG9wSGVlQWU5VWg1Z2owcXMxcE8yZEFsSWFJdXpXM05p?=
 =?utf-8?B?cXU4T3JYa3RBeWd1aHpVbDM4dnRiVEUyY0E3dE9wTFQ1S1ZYSy80Qkg2UlNQ?=
 =?utf-8?B?dXRMUGV2M0d6UjZTNzA4TE1FdVUwQW9PMW93SzljVGN0Z2syV29PcU9WWlNR?=
 =?utf-8?B?NDNac2VWTFdpZkxYT3gza2JIOUlzNEpVak9SQ2VoUC8ra2sySklrMUtKQlNL?=
 =?utf-8?B?K1o3dFdDKzk4MlJXMDd6ZnBvdElrLy80QzZ0Zy9FZzFrUHBQUjc2MlMzTmVz?=
 =?utf-8?B?c29QWGdCMHBBRFNnUnNaVzFxYnBGdzQ0ejcrUnFLZlBjMEJaWDlWOGlNbHpa?=
 =?utf-8?B?T3laMUlvNjJPcnJFOERvSUI2V1h4WFIxeDhweVlkMklzZnFnQ05ZQXNzOHhV?=
 =?utf-8?B?VVlTT0pyaVFxM0lsNU5QeWpKYTV3cHFBUHhZbEtIbE5JT2haYm5jTE5mTk9N?=
 =?utf-8?B?NDlnWU1aT0pQazVYMndqci9SQjc1Ri9VdkdoRmFadCs0V2V1TmplL0NFMk5S?=
 =?utf-8?B?OHhtbWVGdEptWjNaUEdxZ0RwQWRBNys1aTliVU14MnB2MitFNFBUend2QUNV?=
 =?utf-8?B?Q2F6RE1tNTJwQ1ozc1ZyenU3VzdtVkxsWjBTbUlEZTBzMjJ0TEVuQ3NaMmJ0?=
 =?utf-8?B?bXM4TW1CZXdoNDBGbFFhUEUzSXpvTXUraVF1N3FQTFdOLzJGNDlPOFprdWhO?=
 =?utf-8?B?YUpLRThISkNVK2FOZ1NZNjI3V3RuZVJYTkFpNlBJeXdWMVo0T0ZpcGZCcFlo?=
 =?utf-8?B?b0xMVHZ3WFJuTVVVNHM5WnFXN0F5YUIyOVk4WklSRE5Md0wreEVJU1NrQkZq?=
 =?utf-8?B?MGo3TTA4cUZGTWpqbG9KT05GV0VFYW1sWWwwckZZYWJMWUZobmxJbWorMm1n?=
 =?utf-8?B?QllBYzRiWVF2Ly8xamZjR3JzS0VpR2JIK1VremRyRzNhYXoxU1hrVVFtRUlz?=
 =?utf-8?B?NFIxR3JRbEsxNTJjWVlDaGQwWkxza3RtUmdWTWlJN05veEJHOWxTaWd2NUVj?=
 =?utf-8?B?MG5GRU9uZUxJYXJwYVJHWnZCR2swMldGd3lzRHY1YkExd2lnbTRiSmFrS2I4?=
 =?utf-8?B?amtmK0RNQnJFa21oZ2Fyek8wZFJDcWFNYS9VMW0vWmtaVU85aUF6VW9COExP?=
 =?utf-8?B?L0hzcFFOSTNwVzZTejFocFZ2VHppT2NLdmRkUkNtaGxBRnlzWGtCVTNjSjVn?=
 =?utf-8?B?YnhqRG9La1JyclJ5eG9qUnVjeVdJK0ZjWmhKV3QvK3ZoM0wwM0h6bm5XMzNy?=
 =?utf-8?B?ZTNGOWxad0w0SXRCSWxZV2FnSDJlUithNkVMZzcvaHJwc3QrbUlNbWRpaUY2?=
 =?utf-8?B?MnVOMEQvOWdjcGM5SCtudHdPTUtpREo3UXVJM3lHUWloVnMzMEQwbnF2WlJM?=
 =?utf-8?B?d3MwQ1ZmWE82UUd2bUl6c2M3c2VDaitWeXN0VGFoeDE0N3dqMXJ2aXh4dnFu?=
 =?utf-8?B?UDByN3JrYjM5RHNmNW02UmYyUjJyZ1dNSWt1VFpINGlQdEo0dFMraWQ5RzUv?=
 =?utf-8?B?b1JLUnZVdHAzb2EyQk5HS00vMG9IaTRCT0pFRlVrVmZkMmgxbXpyaU9lY0p4?=
 =?utf-8?B?NWtZWmdQdE5tWGtsSFpLQVBGdmsvNlpQNVlYcVovV3A5N0xLQXNySXN1ekJR?=
 =?utf-8?B?aEwrUWlGQUJicW9JNTlaeTZsQ1lqYXZjSkdvVFVmN0tjcmVTMzh0VzM4RnZL?=
 =?utf-8?B?OFJycG82dGRRVDZmbjdOTmJKNUU1Q0k1MzZOcWhMMVFBRC9GNGk1ZFU3TTJE?=
 =?utf-8?B?SzFEOWp3QVNpdXN0MDUvN3FPRlROZUF2bkx3SEJOZlUzejQ3aERpbHFOOTJ0?=
 =?utf-8?B?d3Y1QnlIN3ExOHR3TUxya3dDS2sveVZkc2hpQnB0MjQ1TFV5L1g5bjZEYndx?=
 =?utf-8?B?ME5JRzRFdTJQa0ZOTmU2cG16ejFDcXdmZHBqd3JWTWdpb244bHFCRXdJRHRY?=
 =?utf-8?B?VXNDQ3p0clN6TW9vandBUFdFL2phYVFuOXQzNFEyV3BndUJlS0M3Qm9YZjRJ?=
 =?utf-8?B?MVI1STZjUy9BMWNFYWFRcWRBM0ZvYjNhVWUvdTNad0JIN1k2TEx6S1BrLzVN?=
 =?utf-8?B?SThKMzErVFZyQTduWnB5YXI3SVE5U2R6bEZ6emszOXAyWmJCcnBVM3RQemhq?=
 =?utf-8?Q?dhRCHjwdhJfLX4d9MSyOrsmPh?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <7D04F46583D7D7468F63AA92D18BDC51@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN7PR12MB8769.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e13c4d49-01d1-48ca-3648-08dc236c805f
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Feb 2024 21:26:49.6663 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: tBXbFc+4fX/kAXhXFTdAvxSXVBm83jW5OdInK3tA5JYdTLP0kwT+pfhF13sZrMZfZ+8dohNW+k9qkAhZWpe9lQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4969
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

T24gVGh1LCAyMDI0LTAyLTAxIGF0IDEzOjU1IC0wNjAwLCBUaW11ciBUYWJpIHdyb3RlOg0KPiAr
c3RhdGljIHZvaWQNCj4gK252a21fZ3NwX21lbV9kdG9yKHN0cnVjdCBudmttX2dzcCAqZ3NwLCBz
dHJ1Y3QgbnZrbV9nc3BfbWVtICptZW0pDQo+ICt7DQo+ICvCoMKgwqDCoMKgwqDCoGlmIChtZW0t
PmRhdGEpIHsNCj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoGRtYV9mcmVlX2NvaGVy
ZW50KGdzcC0+c3ViZGV2LmRldmljZS0+ZGV2LCBtZW0tPnNpemUsIG1lbS0NCj4gPmRhdGEsIG1l
bS0+YWRkcik7DQo+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBtZW0tPmRhdGEgPSBO
VUxMOw0KPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgbWVtLT5hZGRyID0gMDsNCj4g
K8KgwqDCoMKgwqDCoMKgfQ0KPiArfQ0KDQpEYXZlLCB3aGF0IGRvIHlvdSB0aGluayBhYm91dCBk
b2luZyB0aGlzOg0KDQppZiAobWVtLT5kYXRhKSB7DQoNCgltZW1zZXQobWVtLT5kYXRhLCAwLCBt
ZW0tPnNpemUpOyAgIDwtLS0tLS0tDQoNCglkbWFfZnJlZV9jb2hlcmVudChnc3AtPnN1YmRldi5k
ZXZpY2UtPmRldiwgbWVtLT5zaXplLA0KbWVtLT5kYXRhLCBtZW0tPmFkZHIpOw0KCW1lbS0+ZGF0
YSA9IE5VTEw7DQoJbWVtLT5hZGRyID0gMDsNCn0NCg0KVGhpcyB3b3VsZCBoZWxwIHNpdHVhdGlv
bnMgd2hlcmUgYSBidWZmZXIgaXMgYWNjZXNzIGJ5IEdTUC1STSBhZnRlciB3ZSB0aGluaw0KaXQn
cyBzYWZlIHRvIGZyZWUgaXQuDQo=
