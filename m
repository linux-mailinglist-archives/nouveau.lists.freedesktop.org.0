Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D6E68A2422B
	for <lists+nouveau@lfdr.de>; Fri, 31 Jan 2025 18:45:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DBE1110E40C;
	Fri, 31 Jan 2025 17:45:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="oRjF6vT0";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2064.outbound.protection.outlook.com [40.107.220.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0536010E40C
 for <nouveau@lists.freedesktop.org>; Fri, 31 Jan 2025 17:45:45 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RKNHWxj/m65AcZgHEeD7PdNVmJz4oVD/86Ey+FvnFQtyjnQuNrStMnsIBXs3/4Dr/e72yko73sFQujE0l6+ywpkPbV1iqTrdAGJFYTsWWevCrlOM89EqwJRrLNUvZ8TVSQdPsrAT88K34trnqarBTBjYcr2wG+CqDUocqrbJD18ZMcO9Ylt9T4SSaNOpEhRHJtObxWbsMk4wjUkKNzFSKZcrC8gsYh1PhvHAY4QDuU1KZ8WhdiV6mcbpldFEvgMeMxWk3KZWIq1QSewwRtqa2yo8fnk77GqIatu4/pTboviaLdfnk74L2/mppkhxg7A5DDV0A+4yJ192NnOgeH3d8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Fmo85lkWascIvuuPSPvqyT4pu6QjcRzALVKqH3DwqO4=;
 b=LtEd1uayn//UYceXn2d9Evh8ezaQoJDohnKW4AflebnQhq7s2lOhXyQhOjycl772Z92Y/YbLkravfbdkli2cwNfDXSu54SSacw+MMX148xBSqCdlj/Va0hhZLu4l1HOq4fAcQ+IFCNL63UY0qKId07GC7mj/DvfTgpkdaiNAbzTPaJtskx9LH0XxaELm7VSeeIfc9KfKmvh05KOXEvtMFixbH2B4iEwerbDgL0BLj9TEGmCi30lsF0UfPxHsRoAZaqb+RL8Cxeu4VDBZ8fzWmDh/jAqCyaKb629s8m1j1DyIzsvr9tmvwjLnWMWbhQi9o5GHmsL5tTluOLtNSfphYw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Fmo85lkWascIvuuPSPvqyT4pu6QjcRzALVKqH3DwqO4=;
 b=oRjF6vT04emtsMLt0g3FfHoAd/KwTf0JmVs5WGVk6RPuk+1azG9j00MH+3pUzb5grdTgKFgNbcwH1D5pkMEvu930Vs9MZoFIL9KKpXSnN7jiFHWYwq4EHOMZn9pjebU1VFtrg6yom8ykyVxnTlKHt5sfdkbYJqSHInfvz7YevD0FRbjQCe0WxaNFb1/OIchV6+BhAfj+sTgLxH6HCTAkXVUyTXsimQ2ajF4wDC0RWPPwQ4SkHcm+eb1AKSNjrr4ohHbq2v4Hrrj+ZOhTohKxGbgZ3ctvVYhn3/tgETVwY0jjo+lD3omEadEPTI311llpJVoGTGNfGq+6CEKzWm6jzA==
Received: from CY5PR12MB6526.namprd12.prod.outlook.com (2603:10b6:930:31::20)
 by SA1PR12MB8600.namprd12.prod.outlook.com (2603:10b6:806:257::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.20; Fri, 31 Jan
 2025 17:45:42 +0000
Received: from CY5PR12MB6526.namprd12.prod.outlook.com
 ([fe80::e420:4e37:166:9c56]) by CY5PR12MB6526.namprd12.prod.outlook.com
 ([fe80::e420:4e37:166:9c56%7]) with mapi id 15.20.8398.017; Fri, 31 Jan 2025
 17:45:42 +0000
From: Timur Tabi <ttabi@nvidia.com>
To: "kernel@dakr.org" <kernel@dakr.org>
CC: "airlied@redhat.com" <airlied@redhat.com>, "nouveau@lists.freedesktop.org"
 <nouveau@lists.freedesktop.org>
Subject: Re: [PATCH] [drm-misc-next] drm/nouveau: fix kernel-doc comments
Thread-Topic: [PATCH] [drm-misc-next] drm/nouveau: fix kernel-doc comments
Thread-Index: AQHbYicxFxNrUX4A3UiR1e5Ij7zkNbMOzykAgCJ8bIA=
Date: Fri, 31 Jan 2025 17:45:42 +0000
Message-ID: <324b39465c96709c131b9cda3ab049302929a787.camel@nvidia.com>
References: <20250108234329.842256-1-ttabi@nvidia.com>
 <dc9f1703-34a2-4c9e-8df7-2c85092d56c2@dakr.org>
In-Reply-To: <dc9f1703-34a2-4c9e-8df7-2c85092d56c2@dakr.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.52.3-0ubuntu1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY5PR12MB6526:EE_|SA1PR12MB8600:EE_
x-ms-office365-filtering-correlation-id: d2b38ee2-4d3b-48b0-f031-08dd421f1579
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|366016|376014|1800799024|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?UHFhTDlCcFNreEloM1JOSG9YbVpMVlJuT3JSKzByR2ZzV3dKMVpvWmlXZ1Rs?=
 =?utf-8?B?RGtYc05jaHZpSkVxRVVjRXNqRWg1SmVhZkNMSXlPd2orZDBBeDNzU2lxeFZT?=
 =?utf-8?B?cWgvVk1DcW1mUFZ2OVdwSE9kMS9zdU5QV3dlZ1VLdSttUGptVm11SVUwMnJ4?=
 =?utf-8?B?cjZzYjcvSkRQMENTU09HUDlJSXhLaWNFRXBVZTRkaWM0MUZJWjNHeHgybWFz?=
 =?utf-8?B?OVFiR3RyZktCRkFqREN2emtFa2w4ZWVOMEluQWp6V0NxWGMwRDdwL1hIMWMy?=
 =?utf-8?B?c3EzUzFQV3RjU28yclB0NEVyM0IzZVFabzc2MnZtUVFOeGdPUDI1SS9xSllR?=
 =?utf-8?B?dmN6cFNHb0lRZFQ0SFpzU0VZK1RJRU9rZDFQeGpVUmNoZjdDOGw1NjlNd1Fi?=
 =?utf-8?B?aXFHRzRLR0UwQnJOQnhWY2Yvc05IYjRpK0NXSmVWSURpVkVVYmtZTUZzUXps?=
 =?utf-8?B?L1pFTWdrRlR0RlV1aXFMaG1qSEp1cERTTlE2TUxpSW1sQ3VyYzlYWElsTlBv?=
 =?utf-8?B?SHVhZzZHNU5UWk03N21FMisxWUZHbFpxM2UzcUUzSmVBM3kvei9KOHJwcFJX?=
 =?utf-8?B?MWY3SlJtZWRiTHdHaEpQTXJyK29ZVUd1VUt4anljS2hIWTRqQ3RmdDFVUUVi?=
 =?utf-8?B?T3ZHZ3BpMENrUW15QWZ0Q0h4NmNKb3JrU3oxOVBBYXZQaXRjTEMySy9OKzVV?=
 =?utf-8?B?eTlOY0tpcUtOOFBPV1dWSGpBdDc3VGVOK0pMQjNad3FrOTBqZk80R1JnQzRr?=
 =?utf-8?B?TlozZHJvK2VocTkxUllpV1FDNTMxeHVQRmtXUCtnTnJrbFdzQXlIVmdiR1N5?=
 =?utf-8?B?QUdJMmtsM3ZxM2JZemVmNi81RDdVbm9yN1dGaTA5eFEzOWN2MGZxMXhtYS9q?=
 =?utf-8?B?SDNlVG8vTGM4R0hpZnFBOGFLRCt4eG5vQWl2OVZNQTRKdmFMYkltcEd5L3Rr?=
 =?utf-8?B?V3AxKzJ2ektXMU5VYTB3TFdQUkxMN2NKWXBLMG9KTUpJTC9XRXJjcXd2YUQx?=
 =?utf-8?B?T3JDYWZoQ0FFK2kwTmpISHpPN2V6MlBDbHBBRTNGb0pEaW5oRXh2YUFaZVk2?=
 =?utf-8?B?YnlKWFJnUDg4ZXNwMGV1dXZpN1JhdFNZWmFzV241TjRhaERIS3VqZlVNRHV1?=
 =?utf-8?B?WlRteTJVa2RwL3dLTTJ0dGsyTzNWZXJ3K0dDazhYOHZjODRBMXJsUnZIWmp2?=
 =?utf-8?B?THAyZU5pK2lOeTVYZzdQUW9WRVVNUks2Tk9QSUxFbTBWUEZ3dU5zV2RDZk9w?=
 =?utf-8?B?MjhOUTFSckxYUTZYUTg4cldEUGNYMHdieWpzdi9yNE1JSTNoTytkQVZySGxq?=
 =?utf-8?B?MmFwQWdHa2ZjZnFhWkRtVmk1SkhpVjhjRmdtNXJ5RXIyTlMxM1FqcFNpcnI3?=
 =?utf-8?B?N0JKMXl3VTQ5akM3NnZ2QjZvNi9xbUxzYTh2SS8vaEtMOVpHSFN3OVM5QzY0?=
 =?utf-8?B?U3NVamVaNzduSU1LNU51cGhpZGt3bEdZMWprdUZ2K3hndFBkM1ZZU01CbXdv?=
 =?utf-8?B?RVRKTk1nSFlEUmlMRDJUTU13L0JKcDBxK2lvSjkxdHhuM1UwOW5DT282NndT?=
 =?utf-8?B?c2xaSVFxZEZySU8rTjlDYkRteFRIeUNhQ25Gd2cwN0NSd0N5aXVMOGJVcWJx?=
 =?utf-8?B?L3c5dndDUVFSQnA4RkZvZzFvWWRnUHhaTkZvUU5JWUlKczZLMHU0Tk93TjY5?=
 =?utf-8?B?NHViVHhqZGJ5b1VXZWR3YUF4Q1orWGJ3WkhPWXFXNlJNRFFZSEpNTEEvVHEz?=
 =?utf-8?B?ZEpKaUFTWjJyUzhuVnNreTN2Q1ROZ1V4ZG1KeHl0SWRncjhjeDl6ekZvcldY?=
 =?utf-8?B?aUtXZDNQN3JBL04xVW05QWlmVnkrRVhwdlBQS2Q4cUZrcUdZRWs2RE0vZ1Fh?=
 =?utf-8?B?bmpDVjIxampueUQ1WFZWYlppTTdlRnQ5S1NhUWhwU2IwUjZlenpNREpnNXZY?=
 =?utf-8?Q?9Qfh96tOSs4/BgFArFrnTQt2fDzF4cK5?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR12MB6526.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ZVJ0SzlwcGJyZTBZbnNNWDJZQVhFTTJpNTFra1JISmFRRkdwMVJVcGJtRlN4?=
 =?utf-8?B?NGFsVVVVaFhxNDM5YW5ZeG5FcWJXbUpMbGJBZDZwTVhtM2pWb25iUWY5NHRU?=
 =?utf-8?B?SDJNUXRxTmZNOWdaUVpNV2QremRaVVY0SXRuS1hvNDlXT3A4S2M1OWI0YXpi?=
 =?utf-8?B?c25paVVCSENsUDZqczdNNkd4cjN0bUg5cnVQWVR6MkFjdjhBUVM2ajBUWWRY?=
 =?utf-8?B?Y2xuSTJaRjZoWXpZb29jL2tqYlZ6TFZVV3VkTzJLUzZ6bkVQeW9DMmllM1ZP?=
 =?utf-8?B?cDgyNmNQd2ZZellURENXell6b3dCOEV1STRYaWpENG12ellHeWlwSEV3ZlE1?=
 =?utf-8?B?UmI4UjVjUnAvbkdnS2FtcFFNSkVzeTRFcjZCbCtyWi96aFJ1d01BL2tjb1M1?=
 =?utf-8?B?REhqTWtFL1dXYUI2aXQwNGtyNW11aVV6VzErLytmbjZuSWZnVzRVZm1NSGti?=
 =?utf-8?B?NGJOdE91Y2ErRmdjSzZta21SRXkxSGVOQVMvVVdpdG4vYzloWG55WnFzNW5I?=
 =?utf-8?B?N0hIdHZ0TU4yaVVNWGpXNkFFc213Q1JVdG9iQ3hMVlU1Q0dpMW5ONGpRY25T?=
 =?utf-8?B?aGUyb250akJpdys0Snp6d2U3Z1lYY0pzc1hYRzVaMGhUTGJWNis2YlJhRVZU?=
 =?utf-8?B?TEQ3S3RmV09RQmh0SE1va0hMNC94VFdPUFMyZWZnS2hNR1h1ekxGTXJqcjVy?=
 =?utf-8?B?UGUxZnQxM1AyMkErbnFVYU00Uzg2T1NmckFnZkxtYmFiemZZd3dMaWJpaktz?=
 =?utf-8?B?MUhuaVdQVkVZN1JzazEwbDU3aTZOSlZMYmZlQklxUUM4d3pjMExaWlF5MXdJ?=
 =?utf-8?B?N28zdmxqblp3TzdCUjcxUkxTVW1FWGtBaEVMVHRqVURQUGNad2ZSSGJwWFRr?=
 =?utf-8?B?WGFBeDk2bFZhYkh3QTcrK3lRbGJsdnZvS29WUTNXaW5MM1BFdDVEY0lGc1FT?=
 =?utf-8?B?UDZYQmlrL1hvWkI1OTE5Q0ZLT01QUmVJWXZCOEt4QXkwdGh6WW9NUXBpdnVs?=
 =?utf-8?B?ajFkbHExSzNWQ0ExQ0VDMWJFbnVQZnl5T3FmOVl4UEE2LzBhVTRZa0JtRTFX?=
 =?utf-8?B?WnFPQTZ0ZVg1Ym9McEgxVnZDR2l6QUlydHZNaG85enVIUWVDa1dkaEg3MEVQ?=
 =?utf-8?B?V2htdGJhZDNBSlUzb3YwSkdTUDRocmFtMEVjQmp2amp3RlNtWFNWd0lBM28z?=
 =?utf-8?B?S1pnbUhlSU5GVzNyclpiRCtkZ2VxZVFrNlBaZmxJRCtTMkY2OHlGT3A1SVo4?=
 =?utf-8?B?eitaMXIwUXF4by9RU203SzAyY2RPb3lyMjlMUVZDd1V4eW5tK3JXQVVSUXB2?=
 =?utf-8?B?NnMzZjUxQnBjU2JQWEprNzdTTEc1NzMrZnowUys5UmU0a0V2TWdvcE5Ed3V5?=
 =?utf-8?B?U1h5MS95RlhkY0YzcjE0cCtXamY2RmdWQUNkenJnN1ZiZGF2eGppcGkraWN2?=
 =?utf-8?B?T3JqbzhOaWZQSWgyTTl5REJKT0kwNzRlSkhXUzFwYng1bGZmN21mOGl5cExh?=
 =?utf-8?B?S0VxNWxoUXY1RXZUWkd5Q2xaR1U4TFgvRkpyYjZiTWtrVFhGMG5hTDdJTTlE?=
 =?utf-8?B?YVBhOVhtdUdKKzBSV1daY1J4Q1Znc2QxTXFXVHErQjlBdWVxVlpKSzRHaVRP?=
 =?utf-8?B?QVNUeDNHWXNQd1VKeTFSVlc1SkFLYWFVN21oR3B1SGtPZGlkSGRxS0NtZFVG?=
 =?utf-8?B?enNmbS81RVZOMVNqdFBKNE1rY0FtZjlRQ0JVSGFiT01lSloyODV6Z20rVDNO?=
 =?utf-8?B?SFBZek5uZVJVT2xjTi9iZ0txZ0VTMCsxcjBLNzRSL2NkRlpqdit0VmxxbnAv?=
 =?utf-8?B?ajV0WlRoTGptMHQySGV6SUFZaUNKT3JCbk1NOUZXK3IrMGpMdE9jcGd4MU9Q?=
 =?utf-8?B?VkQyQm9KTFRLdHB6SVdLc0I3Qi9MQWZsZEFlSnFrbS9lc29SQk9sZ29RcU9j?=
 =?utf-8?B?WVBuRHI3RDRVZ2t3WDNreWptcVJSNU9nR2V0UzZocnFaVSsxOC9zb2JPMEtN?=
 =?utf-8?B?N2wydktNV01iSUE0bHQyb2FJQ3dRNC9pTnJEYTdLYlg0STIxRlNRRWlZbHJ5?=
 =?utf-8?B?QXg2b3RlUEdzMmdWd2ZRTFZMZmlDcEJzUU9XeGlnTWIxTlEzVm42YWh2cVFk?=
 =?utf-8?Q?EpbD+92yLMlruUaV7+ePFIMYt?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <6A53CDD858AC3E4AA86E3F06DD9038AF@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY5PR12MB6526.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d2b38ee2-4d3b-48b0-f031-08dd421f1579
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Jan 2025 17:45:42.8025 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 1bLzfSksMi6aKjl21Si2oAl/DWTlXlLmpZQMNAhYqdQMrArIvL26IwEAKdMMCbJKjSVXdf+5TExhvw/uQ4+bPQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB8600
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

T24gVGh1LCAyMDI1LTAxLTA5IGF0IDIwOjA3ICswMTAwLCBEYW5pbG8gS3J1bW1yaWNoIHdyb3Rl
Og0KPiBPbiAxLzkvMjUgMTI6NDMgQU0sIFRpbXVyIFRhYmkgd3JvdGU6DQo+ID4gRml4IHNvbWUg
bWFsZm9ybWVkIGtlcm5lbC1kb2MgY29tbWVudHMgdGhhdCB3ZXJlIGFkZGVkIGluIGEgcmVjZW50
IGNvbW1pdC4NCj4gPiANCj4gPiBBbHNvLCBrZXJuZWwtZG9jIGRvZXMgbm90IHN1cHBvcnQgZ2xv
YmFsIHZhcmlhYmxlcywgc28gY2hhbmdlIHRob3NlDQo+ID4ga2VybmVsLWRvYyBjb21tZW50cyBp
bnRvIHJlZ3VsYXIgY29tbWVudHMuDQo+ID4gDQo+ID4gRml4ZXM6IDIxNGM5NTM5Y2YyZiAoImRy
bS9ub3V2ZWF1OiBleHBvc2UgR1NQLVJNIGxvZ2dpbmcgYnVmZmVycyB2aWEgZGVidWdmcyIpDQo+
ID4gUmVwb3J0ZWQtYnk6IGtlcm5lbCB0ZXN0IHJvYm90IDxsa3BAaW50ZWwuY29tPg0KPiA+IENs
b3NlczogaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvb2Uta2J1aWxkLWFsbC8yMDI0MTIzMTA4MzQu
anRDSmo0b3otbGtwQGludGVsLmNvbS8NCj4gPiANCj4gPiBTaWduZWQtb2ZmLWJ5OiBUaW11ciBU
YWJpIDx0dGFiaUBudmlkaWEuY29tPg0KPiANCj4gQXBwbGllZCB0byBkcm0tbWlzYy1uZXh0LCB0
aGFua3MhDQoNCkRhbmlsbywNCg0Ka2VybmVsLXRlc3Qtcm9ib3QgaXMgc3RpbGwgY29tcGxhaW5p
bmcuICBTaG91bGRuJ3QgdGhpcyBmaXggaGF2ZSBnb25lIGludG8NCkxpbnVzJyB0cmVlIGJ5IG5v
dz8NCg0K
