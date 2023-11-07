Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id ED6547E42B4
	for <lists+nouveau@lfdr.de>; Tue,  7 Nov 2023 16:06:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2411A10E0E7;
	Tue,  7 Nov 2023 15:06:31 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1nam02on2086.outbound.protection.outlook.com [40.107.96.86])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 65C9C10E0E7
 for <nouveau@lists.freedesktop.org>; Tue,  7 Nov 2023 15:06:29 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PqSg4QRfvNMpl5UNVSjApEPxPrwe2MTAxcuUjsN00ygcfLZ+kgWjXtLcNTqQBRPl/Qrf5Rj1k8XTgIKeDc3d+xjIwXnqjLQBMZqE8Lm3m6DHSG4cjBWGmE350NLAvVUsVqWZHZtEYcZJb1y+zjzeJHn2Z2YnxLE6L19cWeiWxMylavm5wGqOK8zVLVcjRGX6qrFAFY3n49P6/bPUF1NZ6B3A3F1cM4SH4/fm9s4p0GQGO/AOkihU1M+GjYQ1pdHJhhCM8SAYcPyYtnwxz3su6EIR/h3ZStLisdBuq4h2YK86AFZCOsti9ldNErTr+zgnPp9K/MngwXYS9hQZONfv1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lplGmU+NmNK2KbNUHJxXizUXSyVlp4VNJ56Ep4z0tzI=;
 b=cUML+hPQIv52EzWLg7wFDeOv3QUpmMBk9tyQ8ZCJeDRIWjAiUDUCjPSbbHDip3sLzbbwyVYTQUC8KIpdju0mwh9xF1lWOs825SKjJtBJpaOY7N8JCe0tIiXqZifr1GDN2BNFfgV4meivs1/lkxfHeiwSiewUDfdjNUTVWtPYQI2ulAVfjSiNVpRrJnFCXtK7JVJhWb0msGU9rOcxdp3sVYdOHxuY2fEhCL4F4Oq3xI0vR6FHDCwPRmx5t3sP9yuExWah4AY575afF12Zu9YpXRiVanuM74nEeHo33zHP4y4VWyZ2c7DxH4sdGMKxkgNlsTB0319yKdAN8q9dQPyWqg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lplGmU+NmNK2KbNUHJxXizUXSyVlp4VNJ56Ep4z0tzI=;
 b=jeCro3H0hhmXmCzb1B/9fQoXIl317JmctC+oCf04kBh86NagbCtMI5DHCuqj8gPM2RlGLs+/er0NjTD4zjsWeb2a5mv4QiNh8KLIWd9XUs0qofa+CNSMuoXEs/PNAAI5kDxKvBv3dtNk4lImhVOt0F2gUqj0OZUGACUImjfxyGgqQS3Ft3mgiz013khUQByadGSbwYztecby/2Oo03O5rUe2eypkL5qS2N9VVQfYMIDSxEeXQ7Nhj3H0BAdwGDgVUMRO5IpQvcFR8libFdiYN8w6PrSlpJtTrFNPvlvyEthIDh5HPQqvtrrxq3mIIg6+4X9J+q7oIx4mmsx8FwElgQ==
Received: from SN7PR12MB8769.namprd12.prod.outlook.com (2603:10b6:806:34b::12)
 by DM4PR12MB6472.namprd12.prod.outlook.com (2603:10b6:8:bc::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6954.29; Tue, 7 Nov 2023 15:06:27 +0000
Received: from SN7PR12MB8769.namprd12.prod.outlook.com
 ([fe80::6799:dc7a:e121:1af6]) by SN7PR12MB8769.namprd12.prod.outlook.com
 ([fe80::6799:dc7a:e121:1af6%7]) with mapi id 15.20.6954.028; Tue, 7 Nov 2023
 15:06:27 +0000
From: Timur Tabi <ttabi@nvidia.com>
To: "dan.carpenter@linaro.org" <dan.carpenter@linaro.org>
Thread-Topic: [Nouveau] [bug report] drm/nouveau/mmu/r535: initial support
Thread-Index: AQHaEYc4JuMOoJsr/E+gVFuDQ5PKvbBu9OYA
Date: Tue, 7 Nov 2023 15:06:27 +0000
Message-ID: <f9a53aa8399313a323232744be57c9908f674f1b.camel@nvidia.com>
References: <b9a97887-9b58-4518-8dd8-3865afb9279b@moroto.mountain>
In-Reply-To: <b9a97887-9b58-4518-8dd8-3865afb9279b@moroto.mountain>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.44.4-0ubuntu2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SN7PR12MB8769:EE_|DM4PR12MB6472:EE_
x-ms-office365-filtering-correlation-id: 670bd0b9-93e1-49b4-eca5-08dbdfa31d80
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: OX8C0ZmE+egU+65laf37RorrIRd7rEegKou7HfD2KC6o5wHTMVa7liZQC/XL1+TyAyUkE+BX3wymq3wa/DQQ42MIUaEvBI+UTgDJD68Pze1gmUXc/+PQLkP4DLYnNSHeyXHClcd/yORixK6qljJZwyxUT99hgyc8wbr/cPYiinNbRGeGh/eLKz9F5S1rOcMHdRAIor1r76KRAze3BJYUOpJ+okGCaRzqz6G+Lu5rn2XJZy0GGIrtt55B0Es2uRorRtSuArxyJDB/fePdAEgB6iK7RDKugQ90mylxY5URuhB/0Eq4j2Fy/L2fxbF+koszzxhTr9o0TWBta/ZGcYF7s3uvDcnkW3TM+XJgfFGQaEPvnca0feaDjl6OUCZeRaMVSFF1qSonYOOdfPkPBBQgbuleAbEUqGoGEE65ktMuLsWuzDYZUMvIM00aJtG4DPeDowoL1qAxx5rO6bLlkhc7X3JMzcNpoSTcoYYZuWir8zkr2HShhJkhj9YvMF7moXujgG/EW/0kPRapLsNdiukNET2G0S4ah9TI6yRAcYdmjUM+mYoQFW1pgCwvOynlWlJ3PDNoSwm66kj+zNclU9z/WJqzYpxeYigJcDgGrP3g4OZm+pa0sVgNTp1ZBQEVoU38
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR12MB8769.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(396003)(376002)(346002)(39860400002)(136003)(230922051799003)(64100799003)(1800799009)(186009)(451199024)(478600001)(6486002)(6512007)(2616005)(38100700002)(36756003)(66556008)(76116006)(64756008)(66946007)(66476007)(26005)(66446008)(6916009)(316002)(6506007)(71200400001)(122000001)(8676002)(4326008)(8936002)(4744005)(2906002)(41300700001)(38070700009)(86362001)(5660300002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?K1hKWlVKb3lvYXVqSmorQXVjcXoxK0x6MlhqcDdDeHVmOE41MjV5bHVzRStE?=
 =?utf-8?B?UWlIeTRUVDdqMklUaFdwZmViQ0ptL0dVTkJHNnEwa3Q0bmNIVXNQS3pESEEz?=
 =?utf-8?B?c20yd3djZXhmZXRwQVJVOG9lNTJ0dlhvQXluZDJNSGJGdEVCNWtnUnA2Wm4y?=
 =?utf-8?B?eG5EWFVpa1RmQ3ZKQ3lBSDhQTGMxbytxODFHY01jZDliVHdwZ3ovM3lpaHhY?=
 =?utf-8?B?NXpwaFIyck0vMDVzZkFSTFk0ei8xTG5CdDRCNHFmb2w3ajA5ODBxMTNac1Ax?=
 =?utf-8?B?STFmUEdrNjJIdjRSTmRFMjg3VkZYVytqSm95S2ZYQmlkalFRd3hvcFJrQmQ3?=
 =?utf-8?B?MU9yelZUWm9QZHlnRzltMWxFM1oya01aMjkvTktlc25NcXhEZ3BxSmh5Ykcx?=
 =?utf-8?B?SjNXemd5M2cvQ3RXam12MGw0cWFBS0pkRHhaVHBZSm5UUWhiYi9BY29SOGxr?=
 =?utf-8?B?VzNPMnluQXdKM2lXanh4d1FGZzN6a0U2ZjdBUU1YUlA0ZnFLRHJmcmZ3dnJr?=
 =?utf-8?B?YmNWaWlxYlZnaDdIMjhqalJNTUxCTXFPZkYweWJiWFdudXJFczF1WmtQaStp?=
 =?utf-8?B?b0Q5RFlpQjRRVGFqNGlBc2RrNFhLanFvSkF3RW5sTExVNFVISFR4djdQdjFX?=
 =?utf-8?B?and3V3VvdkdDMzlaczFuWldic005Z0hpOW1RdW14KzAzbUZGcmlKZlZKS1ZX?=
 =?utf-8?B?NmdZZEptUFVHZ2o3RkFkWG12VHVQTHVNT0ttNHhvd2VscllqY2JoVng0OTV6?=
 =?utf-8?B?SkFjZS9QMGViSC9jM1poYU1KWWFEeE5Lai9QKy96bk9MUVR1VkhmYlkxV0Z2?=
 =?utf-8?B?R3FYcUEwZWpJdTRHdDJaMFZBbE5WVDJ4Qk92QUl0dVBKNURIVk8yTVNvbDU1?=
 =?utf-8?B?ckRCcHhwcDB3THgyaVBJcnJDbmtHdXp2Mzh2WnMyWm5zMGxrS0lKcm5YTzZC?=
 =?utf-8?B?djdmeEVzTXplQ2s4dnpjYUhtU0JJaUVGeHE2dTV0ZDZaK09wT2s4Q3lYc3VE?=
 =?utf-8?B?MVUwS0hMdFBxWDFwV0ZHQ3UvRmxsS001WkpJRFVybC9nTGlZK1VMNTRxVGFU?=
 =?utf-8?B?MGJGNzVYZXlDei9iOWJ1amRvS1dwTVoySDBORTNyZ0l1MDZieDlDdE0yQ0Zv?=
 =?utf-8?B?c3paVTlGS2ZSWkcrcHF5WjA5amRTbWxabVViK2lCek9yaGRQVjNwNWV1Z0N1?=
 =?utf-8?B?RVdIdy9jYzlmVzYxcFNla1dDV29oU3diRk9TRmZXNXplMEl1S0FKd21aeTRU?=
 =?utf-8?B?alFyaFZwWlV0d3Ira0lXUlFYbURHOVJvU0V5Y3RNVUtWaE9mSkRMSDc0ZjlH?=
 =?utf-8?B?bGIwcWxoclAxbkpoNmRtTUNid3BkY2t3a1dLejBqSGJnZ2lmenRmN3B4WnZL?=
 =?utf-8?B?blcvQW1IdFVQTWlQaThJSGRBZmhSQ3VHS1hhN3NqOWNFeFNQT3Y5YUloc3BW?=
 =?utf-8?B?YkJEZjM1RkdrZ3RIMXI0ZElQSkMvaXhvSHdwOG9XUDdJaWs3elFBQTg0amhs?=
 =?utf-8?B?L0tyVDhCakFIcEdKOFJtWjVjbFdKaFJnTnhwR1RwdkJyd1lFREErOEJ4c2U1?=
 =?utf-8?B?U1I5ZStYQ2hrcUxWbzVsMkx2MlkyWFlKNmVSYjFOSlpBTTFuRjZBTXM3N3R0?=
 =?utf-8?B?eldLTTM2WG1wNFZaWUZHbDhENExGRm9kcEdlcHhpeFNsYlNiZ0FsTXhnM0Zs?=
 =?utf-8?B?TElKVU1NUExpaHN0dGNHSGlWNlVzVFRTbmxWVTBZVWlWOEJGZGFPQkpxZWdp?=
 =?utf-8?B?TGJFVzc0elU0dXBmSktnbGpFUlRRN09OV1Y3OWp2WTdzOEVuQnhCSWlIZjRR?=
 =?utf-8?B?VWw1L2UzaFFtaHBUMDg3UTJQUTVIMzR3SnA1S2tNU0tlZExlc3gwbEJtWUNh?=
 =?utf-8?B?d2F3RkcrUDB3c3M5NGZFK1dZU2lBYTlVNExSdzRKNlFuMmpxVDY3N2MvOUVO?=
 =?utf-8?B?NytzVTM5cC8wMXVhdjdhWjdoOFlTU0NQODZQZ3A0dldPMUYxY0YxUzlSM1N4?=
 =?utf-8?B?RGdLZTVwVTB5NFF5SEJZZTN3d2xsc1QwbnVwaG01R1k2NEZZTjZxbVBPUW5Q?=
 =?utf-8?B?K0h2dlVxZDBBZzJhY25VUDNxVnk4TGFEc2R0RDVTWkJhd3lpUWxESXk2SkhH?=
 =?utf-8?Q?Oaa7VEwTVN/V8+F5/qWt4y2Ed?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <E4C5B2C98306264EAE2C3289A909C104@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN7PR12MB8769.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 670bd0b9-93e1-49b4-eca5-08dbdfa31d80
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Nov 2023 15:06:27.0296 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: lzaVmNVsrj62PqPlJtrofT3TEcUGoz6tKuKItJ6HW8S9vUjWOwVyp49VCf72xCX2gDGTJWA3awXhTG7UBPdyLw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6472
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

T24gVHVlLCAyMDIzLTExLTA3IGF0IDE3OjMyICswMzAwLCBEYW4gQ2FycGVudGVyIHdyb3RlOgo+
IMKgwqDCoCAxNzDCoMKgwqDCoMKgwqDCoMKgIHJldCA9IGdmMTAwX2Jhcl9uZXdfKHJtLCBkZXZp
Y2UsIHR5cGUsIGluc3QsICZiYXIpOwo+IC0tPiAxNzHCoMKgwqDCoMKgwqDCoMKgICpwYmFyID0g
YmFyOwo+IMKgwqDCoCAxNzLCoMKgwqDCoMKgwqDCoMKgIGlmIChyZXQpIHsKPiDCoMKgwqAgMTcz
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgaWYgKCFiYXIpCj4gwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIF5eXl4KPiBJZiBnZjEw
MF9iYXJfbmV3XygpIGZhaWxzIHRoZW4gYmFyIGlzbid0IGluaXRpYWxpemVkLsKgIERvIHdlIHJl
YWxseQo+IG5lZWQgdG8gaW5pdGlhbGl6ZSBiYXIgdG8gTlVMTCBvbiBlcnJvcj/CoCBJZiBzbyB0
aGVuIHdlIHNob3VsZCBkbyBpdAo+IGJlZm9yZSB0aGUgInJtID0ga3phbGxvYygpIi4KCldlIGNh
biBqdXN0IGRvIHRoaXM6CgpzdHJ1Y3QgbnZrbV9iYXIgKmJhciA9IE5VTEw7Cg==
