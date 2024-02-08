Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A009F84D6EF
	for <lists+nouveau@lfdr.de>; Thu,  8 Feb 2024 01:09:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A30910E2EC;
	Thu,  8 Feb 2024 00:09:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="VfobL85h";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2089.outbound.protection.outlook.com [40.107.243.89])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF61A10E2EC
 for <nouveau@lists.freedesktop.org>; Thu,  8 Feb 2024 00:08:58 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=X2d9uv8jNEbHVf20tiwd6aZCkT8YMk37LBWUJ0xIedNFZ98GS0z90SgfI/bQIOMHOqEhPFZi3FusvpJLpZ3fumyMZGmwcQBluE9uNX/ZHKjgbxmXCyJwhIKAv0ZpHUweiOViWliqrk0tgHFq2Fv90cfKSIU+hQgmyx7rtr6EqiEI2NG9B7M7DMbOTsEcgItNLTagR4i6Yl/+EjlBIiqpbRWBkCdTAggCmYf7HB2sFIEaUo2XFiNSlg/iSeozm+MukooKYKDhRBizCNgdor1Dm8GfgpZO8ci9BhWetMosogBFsVsfRlpIC8aHyONaU+R/aNWF1gEZbyJ9mow8fcKf7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VzIjS6+CNnhShsfVI7stpr8iil2JxkRsuxtERNLIg4k=;
 b=SJaLPM+u1d6Dyn1qYJPG2aTmHdeWCWTcRl/rPL0GmeB6dQeJv4dhWMcXVR2Ih87zDvf9h1ri8BIIO26rSSbj46ONaX3ZLWIVe6FrvnizPuaPl99FWFVEj/CugHYG41NO/0RtVsioPs8T96hahP/y03z9nWlF4i+ONbxJGpeZrL1BNXH1f04K5VDo+EIGcAtB/mYh/s9j/HGGme+8qJsRiItHisv8QFBVFYNPAJo9QGX3fCNWJ6HHFhUNl/ML5PVxb2KfkKPiVt+frQmlOTLOz4L2u8C3qnzA5FnbPVIEqLdSnBlaozMGFivm48vh06BkkDfq6qC7r/o9v98tPlWiJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VzIjS6+CNnhShsfVI7stpr8iil2JxkRsuxtERNLIg4k=;
 b=VfobL85h9yztgLsNTknfOwc+g5OpUC0vecp7YVibJcuCtYLsfB7Hv8qM22cQMKoIJdcZvgbZiBytQzjKgyy5Gx4QLh1WD3BSWslAhmIQco0JZ1sAPd3HatVE+kv0DTMLUC35roYorptx0QybsgDKRNuDEmsH/TwFacF62UwwIeRQCWz3Ic+aERkeWngsANdMfXTEHqs5AuTb1PtblyMeSp4On/ndNIyNme05bZ4S/1k/Vtr3w5T5vyX/6WM2rp4IZdKyoep0/5q+N2vywq5g7Pt6V9kMwFL6gdMxd+s/2y4460Mk/8W+yZlzKHO/OklwlZ/X9R/yqdik3jA3UDOw1Q==
Received: from SN7PR12MB8769.namprd12.prod.outlook.com (2603:10b6:806:34b::12)
 by DS7PR12MB5887.namprd12.prod.outlook.com (2603:10b6:8:7a::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7270.15; Thu, 8 Feb 2024 00:08:54 +0000
Received: from SN7PR12MB8769.namprd12.prod.outlook.com
 ([fe80::9f0f:632e:815c:f953]) by SN7PR12MB8769.namprd12.prod.outlook.com
 ([fe80::9f0f:632e:815c:f953%7]) with mapi id 15.20.7270.012; Thu, 8 Feb 2024
 00:08:54 +0000
From: Timur Tabi <ttabi@nvidia.com>
To: "airlied@redhat.com" <airlied@redhat.com>, "nouveau@lists.freedesktop.org"
 <nouveau@lists.freedesktop.org>, "lyude@redhat.com" <lyude@redhat.com>,
 "dakr@redhat.com" <dakr@redhat.com>
Subject: Re: [PATCH] [v2] drm/nouveau: expose GSP-RM logging buffers via
 debugfs
Thread-Topic: [PATCH] [v2] drm/nouveau: expose GSP-RM logging buffers via
 debugfs
Thread-Index: AQHaWf4fvmtQsaGgbk28Wo1OP4H4V7D/kgQA
Date: Thu, 8 Feb 2024 00:08:54 +0000
Message-ID: <a995c578e39c98acc8a1650883e445bb5b14fd57.camel@nvidia.com>
References: <20240207194433.3349496-1-ttabi@nvidia.com>
In-Reply-To: <20240207194433.3349496-1-ttabi@nvidia.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.44.4-0ubuntu2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SN7PR12MB8769:EE_|DS7PR12MB5887:EE_
x-ms-office365-filtering-correlation-id: a71ba37f-08f0-457a-27f7-08dc283a2372
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: DVxKIHuAooawQLy+PwpDdqnvwa5bPM0/66NbtFfHi9flSho9we+C58QHFKrc01dMFBTKer7JRVejJiuP6gGvO8xvh1ftKbf38CwlOKPfRu1BNeDXymrNYu2Gj6nGtsuUk/M4dsKK51F0VHLEBuJdmzixXf6MyYnUHVjzrNcKfXHVYmXUDZMwRv6sCuAk4DaRQcpX99GGnoNa8OT9G6m2gXp5bFj49j33WwyLPVa4dMBJt71bUyJ3GjdUEWk89oZ0E8fgrlKw6/6OZZY8/6j8Nmxu0Vb8yZzbuzI98z56nJb1CGzhap3UAYxk8waXHRzEUvdq71nR77TxMhCGO1xvPOO5uMceueg2eAZH6d6Vt+xu2WjlgBZNfHcYkhK888Nxtcddkni4+IWgqrNqSxVFUlVFSNAgRoYg0BK0TdlqSmhBPGBbkqLzQ1x3Ik2h9xw/axpKmAfE1iiVltbJgneie8whCtvY5GYF2dzhene4eaB0ZyrJg5GtDqyWitzy1OICzUrL3HAfc8w+QdaOhBce0QEoIgyHRI/jIpcgbv8KxpkUhwUpS7ONrbZ2xUl9epBggzFxRokKojx/dG5qw0TYBLxmLQ4JiSC2A4ERyzwZklojxsNHelTrVpagSgrPk+yj
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR12MB8769.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(346002)(376002)(396003)(136003)(366004)(230922051799003)(1800799012)(186009)(64100799003)(451199024)(26005)(2616005)(41300700001)(38100700002)(36756003)(6506007)(38070700009)(71200400001)(66946007)(6486002)(6512007)(83380400001)(122000001)(66556008)(478600001)(66476007)(5660300002)(64756008)(66446008)(76116006)(316002)(86362001)(4744005)(110136005)(8676002)(2906002)(8936002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?bUNLV0orc0N0OWd5WVVldVZTcTFncnkrMHRKWm8xNXZPd2xVdGpzVklndlE2?=
 =?utf-8?B?YjRZUFJpaml4Zk4yK3BZYkRZdDlzaWptV01tNmlETWQrZFliYk1MelBIV0JZ?=
 =?utf-8?B?djduaUgrdFMvTTVEdUxRdndBVXBrSzlsbWxZQyswa0dwaStObnF6ZFltSGg2?=
 =?utf-8?B?Nzg2QVlXS3cwMW0wR2dDc2dmVVJZLzdsU29qem1WNVluV2x5RTRBMTBnVXJV?=
 =?utf-8?B?Rm95dUMvaUI5ZzhyZEFraDJLWVdxS2ZEU1JjVzJUOWlSQUlxTndSSWVkNUxQ?=
 =?utf-8?B?ZmZ5NWVsd0RzVkphZ2ozNnczUFNTQ0hhTUNZRFR5R25HV2pzVm8xayt1dzEx?=
 =?utf-8?B?aG52MzlFR2xNeXBIakMyZ1RZM05vRXNKWW1qYVNRcURXak9jUVdtek1EUzJI?=
 =?utf-8?B?QmVGOWp1UTJad04xQndXbjI3SU93dGw2Z09GUXozRVRLWmFqeXlMcTJsbHor?=
 =?utf-8?B?SzVCR0NDOVZwNFNkRDB0WVhYNDJiNGV1QTlFNk1WZWVrRWRwMW0rUEdmUGNl?=
 =?utf-8?B?MENVd0ZBZGp5cDQ0NFY5eWNyQUozaFBONkY0U3JqR3VPcFlyRGtUMWRmYXFy?=
 =?utf-8?B?ZjhmeHI5WHZlVE5uazRLWWRQdVhJbFpWMWl6RGVGNGNveXUyOVFURUNaN3V1?=
 =?utf-8?B?R0o2Z0NKbW91K1BOYlZVS3J0VXJmRmxNS0VSQVdlQnlYYVJ0OVFmaUJTbTZS?=
 =?utf-8?B?ZWVZSG1DS25oMkVFU05hb01PSXcyWlk0TEJvVkZpYkZXckNWWlVBOEFGUHR1?=
 =?utf-8?B?QWJnLzhKYnRLd0hVWFVzam5uYlROZk0yRzl1TDRTeTVLb1pjOEtPL2FJZ09Q?=
 =?utf-8?B?RVczK1pUbVFlb0RHTGRuZFlJRGhvMkt1YThuWDNTRm5vMDFGTm56S21DeUpp?=
 =?utf-8?B?amtlcTBQOTlpejNmUW1XTURFdzBGdHJVQzVmbkhWc05DV2MzVzlrbnVyZ0JN?=
 =?utf-8?B?N0NveGRNUmxGUTYrMUZDMTFHTUZLaWlnTGlydmFYL1ZmREtMUGQrNTA4M2tz?=
 =?utf-8?B?RzBRVUIwNHlzZTFMVURsUEZncWtIQ0x1YVlKeHI4RXJQR29KdmlheXVoUldC?=
 =?utf-8?B?WjRZcjY3UFJPclFXNTQ1U08zTTh3WStqS0lvUElDVU5NMk95SnRkaXJwMHV1?=
 =?utf-8?B?TXZzTU1lMEhMMC95RE5MS3ROQ0pMd1dFakMyVUpQdkxiaGVBUk1pTUppU2Nr?=
 =?utf-8?B?ZnFOUHRHMW1XcThGSnZPS1Vmc0k0MzNHOW9yc2Q2eEdlSmtGcUFxRysrK3g2?=
 =?utf-8?B?VkhuaDVmZGFTbmM2NlVxLzNnS0lIcDhBZG1ERVJwQkx6K1Mra2xRdGdLVnFl?=
 =?utf-8?B?djV4dmMyNkRJUU40VW5ycW1YRDNjZGt4eU00cW95NjRNdUM1alE2bHM3dytn?=
 =?utf-8?B?VzhXTzB1c2Zad1FHMW4yaUNaNkZKbk1nSnBvU21hMEkydzJFaEpBdUxHR044?=
 =?utf-8?B?WUtSU0ZDTDRCZXNFeTA2RVROMktlbmFzU2lXdUFwWk1RSXN5UjAxQjhBcU1C?=
 =?utf-8?B?VC85aldDY3plbkp5b1FRbUlMbmFjN09laCtnc3RUbGdaNjk3Y1dZNjhuOUtT?=
 =?utf-8?B?THM2dDNoalRPZmM2ZEJDdGs2RTZCM0xqeXQ3UGVsSDJEcmxUZ0gwRWdlVTcx?=
 =?utf-8?B?bTRFaGE2UVFUZzRLMVhrUzdKeUJ4RXRQVFNkRklERU9rYjdlRzUxQ2dOWEZt?=
 =?utf-8?B?SjV2OGVnSzRMVjQrZm0vZm9mc1pNMm50ZUpRV0p4Zjg0dzFCQ0hLclBicTkx?=
 =?utf-8?B?NzNnenVvQytoK2NwMGJqc0VnUk5NcG51Vm1xYlNiYXpkSmpiZDJSemt2YldE?=
 =?utf-8?B?L1FxU3VGTnhZUjZ6cXJoNTlGM2RDZG91RVlSQkhuQ1IyYzNKbXhHN2lXRHZC?=
 =?utf-8?B?WTlSM0hRdDg3UVNDUWROOEtIRWtjbTNJeDBGZU5MNkJqSXBEQkVvUkk0UkYz?=
 =?utf-8?B?aVJtYVl5S253N2pRV282ZTVjZllYd3k4aEM3ejE5eTFtQWJkeklYKy9xc29o?=
 =?utf-8?B?R093RmhKajkwcTZpeFllOW53eUZXUm5yUFdxS1dJQTRBQ0trNkhmYWdCUlRD?=
 =?utf-8?B?eVZyc2Jod3RaUDF0S2w5czFSbmozWmxpdUlsYXR3bmVvelZCelNTci9vL0Vn?=
 =?utf-8?Q?4sVYJjeDbD/vSbDtGwdr70qk6?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <E7A79DC95644CF4196CE476304A2384D@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN7PR12MB8769.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a71ba37f-08f0-457a-27f7-08dc283a2372
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Feb 2024 00:08:54.7310 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 2CQi19H2SIIir9QOJp75jF25NOOXNFU//prPzIHJJY4VSFBgkQWehenGT4l7yI4dSMUyVeu9Yt/D22AgHbgcLQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB5887
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

T24gV2VkLCAyMDI0LTAyLTA3IGF0IDEzOjQ0IC0wNjAwLCBUaW11ciBUYWJpIHdyb3RlOg0KPiBU
aGUgTE9HSU5JVCwgTE9HSU5UUiwgTE9HUk0sIGFuZCBMT0dQTVUgYnVmZmVycyBhcmUgY2lyY3Vs
YXIgYnVmZmVycw0KPiB0aGF0IGhhdmUgcHJpbnRmLWxpa2UgbG9ncyBmcm9tIEdTUC1STSBhbmQg
UE1VIGVuY29kZWQgaW4gdGhlbS4NCj4gDQo+IExPR0lOSVQsIExPR0lOVFIsIGFuZCBMT0dSTSBh
cmUgYWxsb2NhdGVkIGJ5IE5vdXZlYXUgYW5kIHRoZWlyIERNQQ0KPiBhZGRyZXNzZXMgYXJlIHBh
c3NlZCB0byBHU1AtUk0gZHVyaW5nIGluaXRpYWxpemF0aW9uLsKgIFRoZSBidWZmZXJzIGFyZQ0K
PiByZXF1aXJlZCBmb3IgR1NQLVJNIHRvIGluaXRpYWxpemUgcHJvcGVybHkuDQoNCkkgbm90aWNl
ZCBhIGNvdXBsZSBvZiBzbWFsbCBlcnJvcnMsIHNvIEknbGwgd2FpdCBmb3IgeW91ciByZXZpZXcg
YW5kIHBvc3QgYQ0KdjMuDQo=
