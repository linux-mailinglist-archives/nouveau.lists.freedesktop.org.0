Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CA9E099C37E
	for <lists+nouveau@lfdr.de>; Mon, 14 Oct 2024 10:36:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 34F8210E3CE;
	Mon, 14 Oct 2024 08:36:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="lHrkeewI";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2081.outbound.protection.outlook.com [40.107.237.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 06AFC10E004
 for <nouveau@lists.freedesktop.org>; Mon, 14 Oct 2024 08:36:41 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=P2CA9HZHoxhpn0DA/YzUhb1UHg1EwMxcveVRp6NPbhlsqVaLhpGQK3pJkttQcmSQeBjXCkOwovQUpGKWf3l9IfcXT4sM4iofJHI9qa52KLOTAOpe6Vu7pmWwGzj8ck2JZRPC6yI1inyJXmIrlRblJCOA7uH+wnWlB+DBpRyI8AwrQGVkGzlACNuusF5aD0dGeEljYluX3sHMReQhp6wjYIkR+0FigQH2CXcDKylTj/Q0HYv5j+9Rssqzqe7upWGy9H7/8znFrY+tdoLqxvBA64j5YhEGpM6x0xTQF67BMN4+F2F3+yZaiwrP2UWc57ZV6/fJY+ukFioF17+MjqpTEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7CtW96DpnFfYSAEn2AbObV32uuhalxJmbhD1nJxNhRI=;
 b=WY18dEN5TTJh7t/N0whEJPBiwcTdazefVgCsqBzdTEhx+R4v4rcXeIB0YY+Fxf5X7JIaDCfxAoumcGZODKOMHI+KwJ3BNT3ABzixzAjMfDk40SK6SLUnZtFFxS9e09GfLVhkP4zYdLwAgosZokPFYJC3rRUC5NtJIDSvErVC254LoWZOc0JTQnYx0YFlMTd6ghwn0h2FblfgmwYVQJezcyRvFkov+qnqYFMVQr1vof7n9bx1UfoAcWURzhLqnKQaSbmV0WlY0v3ATYFFqfKIfJ6GnHQv1LBeKpZBm+ZKBr4bz5xAlJhIste5ifLuqZG1RPM+tGvaCxcnAvoSk9oAfA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7CtW96DpnFfYSAEn2AbObV32uuhalxJmbhD1nJxNhRI=;
 b=lHrkeewIP6YqX80g/R3tkWtBK6t3PFdyR2SeXMEuqyUtYBNh70Lqt1V3dziil8XMZ1a0iPWsUilPPnIrB7cLWIIWy9KoeQuQrR3nQN4zuqaXXkLEIwv0k5v2Pz5A+nSl3Zdteh/r7O2xn7FPslxLofEzLNZQBNczhuf4s4TjKAQ4+SDn0QTtuBVnbkde0raHv4m/kUURqVtibTnLqOmBgvZrEufGan7ME7pHjILjoi2Io8uO+2MGIM2oOQwYobAQXkzDL+6uBShmMNS8DK8B1+1BLiCC24OTEM2i8TzXDcnmbD1e2QJQNEM8307LHpXhY3JMR1meYgyliiHMfi1R8A==
Received: from SA1PR12MB6870.namprd12.prod.outlook.com (2603:10b6:806:25e::22)
 by SA1PR12MB9470.namprd12.prod.outlook.com (2603:10b6:806:459::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8048.25; Mon, 14 Oct
 2024 08:36:38 +0000
Received: from SA1PR12MB6870.namprd12.prod.outlook.com
 ([fe80::8e11:7d4b:f9ae:911a]) by SA1PR12MB6870.namprd12.prod.outlook.com
 ([fe80::8e11:7d4b:f9ae:911a%4]) with mapi id 15.20.8048.017; Mon, 14 Oct 2024
 08:36:38 +0000
From: Zhi Wang <zhiw@nvidia.com>
To: Jason Gunthorpe <jgg@nvidia.com>
CC: "kvm@vger.kernel.org" <kvm@vger.kernel.org>,
 "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>,
 "alex.williamson@redhat.com" <alex.williamson@redhat.com>,
 "kevin.tian@intel.com" <kevin.tian@intel.com>, "airlied@gmail.com"
 <airlied@gmail.com>, "daniel@ffwll.ch" <daniel@ffwll.ch>, Andy Currid
 <ACurrid@nvidia.com>, Neo Jia <cjia@nvidia.com>, Surath Mitra
 <smitra@nvidia.com>, Ankit Agrawal <ankita@nvidia.com>, Aniket Agashe
 <aniketa@nvidia.com>, Kirti Wankhede <kwankhede@nvidia.com>, "Tarun Gupta
 (SW-GPU)" <targupta@nvidia.com>, "zhiwang@kernel.org" <zhiwang@kernel.org>
Subject: Re: [RFC 18/29] nvkm/vgpu: introduce pci_driver.sriov_configure() in
 nvkm
Thread-Topic: [RFC 18/29] nvkm/vgpu: introduce pci_driver.sriov_configure() in
 nvkm
Thread-Index: AQHbDO4P31Y+kUihTU61ZqQfAXOF0bJqtLIAgBtZ0AA=
Date: Mon, 14 Oct 2024 08:36:38 +0000
Message-ID: <86ea6768-cb94-45eb-ae57-e6757fad97fa@nvidia.com>
References: <20240922124951.1946072-1-zhiw@nvidia.com>
 <20240922124951.1946072-19-zhiw@nvidia.com>
 <20240926225610.GW9417@nvidia.com>
In-Reply-To: <20240926225610.GW9417@nvidia.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SA1PR12MB6870:EE_|SA1PR12MB9470:EE_
x-ms-office365-filtering-correlation-id: 70329fed-54e6-41a2-0b56-08dcec2b51e7
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|1800799024|366016|376014|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?U21VV0pCMmM1eUFwSEdJeVZzb0tXZnNGaHVQR09wakp4cTV5QitYMzRJVVpI?=
 =?utf-8?B?cFlyV3dMdk81UUtjMWI1SW45TlVMVThrdVc3akdRNGFvVHNYQnh1TXdXbmlU?=
 =?utf-8?B?OEd3OWtBUGNiMjhSUmdhR0Z6QVBIYlMvWU5Dc2w3MGRZMjN1K2dhcE10NE1a?=
 =?utf-8?B?SVBuT29XNml0aGUxYi8rMG9La0QxYVo3aFRRWDRHOCtZWXArazNFZEtsZXNk?=
 =?utf-8?B?N0tQSFVuSlRyakIwNWFNY2VXVytmOE51cnhqNVQybG9DaGpkYjZTY0RrTnk2?=
 =?utf-8?B?bTljTGxOaW15OElYa1l2eVpmMXFTZjJVZDBrYnBlb1ZLV3V0WE5HY0o0UHdr?=
 =?utf-8?B?MFhhQVNTV0h3TGJlVmc0ZWdJZTJxQ1UyQmV1RmJwSHBNZnlhM0MraVRzblo5?=
 =?utf-8?B?c2N3RUhjWVZkclU3Y3RSQWJzTStIc3ZwN09iMHFSTXAvUVovTlVnVDlCOTZY?=
 =?utf-8?B?ejBNKzhlSURzQ1ZRdG1SMVJMdmVZY0FJUXRkN28zd3pOdUo4b3MwUEw3ekZs?=
 =?utf-8?B?cER5b1Yxa0hvbFV2NXo3UlBOYVRVblVNRkFxSWFoK2xyMnNMMDVqOXlYZDQz?=
 =?utf-8?B?a2lxYUxnUTNtcC9XWHZUR3NqMGk3VjliR1NNd09vOEw3WXNsVEVlNnE5VnY0?=
 =?utf-8?B?OWJ0TndYMGZLZDlaWmRnUjJ3OFRhbTF4RXd6TXVnc2krekJPVkJrNTIveVNG?=
 =?utf-8?B?Z3o1d3ZHbVZmeU9SNk9QTndCUTIrZThENmEyeDVhTFpjQnV5NG9HMmJxekM3?=
 =?utf-8?B?U08vRjJ0YzdqZGlsUG1TbWdPV1hIMzIwYnM3ZDZEMFppaGowQ2JaQlQveGRH?=
 =?utf-8?B?QTlKRFV0RjBmcFc4RllKY21oVnF6ZFRwN1BKZ0duZUxWZ3Z3QjlxdkdZZU4y?=
 =?utf-8?B?cXNWdlNvemNlWjRDRkliL2ZqZzFXZmhXd2RXd3JGTXcyRU5tTURUNEQ1RWM5?=
 =?utf-8?B?eGtPWGppWDJscHdyQXFTOUR0RGxGMXFlNHFHSmd5OTlvVjZGK0dWT01PZTNP?=
 =?utf-8?B?bWlWMzduQjA0aFFYcmdpWFBySVZuMWQ3UlFZK01Cd1ZHdzVCaENhY3hlQVMx?=
 =?utf-8?B?Wm5zWm9OejE0Q2tTUmoweTZWdFhCcm8vNXlLUUNLYU5BUm9GMzJhdFROa1RN?=
 =?utf-8?B?dktjV1RDOHE0R3JHYzVVazFxV3FNNzVaT25Qd25lWjRIZm1Za05ocGxFbjlr?=
 =?utf-8?B?NDU3cEpCZDN0NE5ucnlkTjdWWkJ2b3pzU0tVL0tLY1ZaakthS0lHbnNwQnFx?=
 =?utf-8?B?ak9sL1Zhby9vNUcxQWs0YnF5R3VhRXJDaUFIQ2F4ZlpBQldYY3hmbEttOTRz?=
 =?utf-8?B?UVdxVUZyZFVFcC9tMlE0S21wckhXc3lPbmkrQXVVeVUrQkNXaW1JbVF6dVZZ?=
 =?utf-8?B?NW1BWXl0VGNObmI4QjdZZXVlUTgzS1BjTzF6eHRLeTU3cVRFSEp5b2txaUxZ?=
 =?utf-8?B?blNtN203N1NDbTI0dW84T0tLRitLby9rVWM2R2h4am5TUzRTd1B1Mk80Um5w?=
 =?utf-8?B?ZlIvM20rUDZrekZCcm9uYzBXaHVaRXMzd2VUZjVCdmZLWVNQMEloUTFjcTFS?=
 =?utf-8?B?enR5cUVHT21TWGpLVjJlRno3eE5naS9EUDd1OFI3cnE0clMyQWN0ZTlsWnZJ?=
 =?utf-8?B?cmxlVExBcG43K3JvVElyVXJiQ3dmeENvTHNmK0d3ZWUveXdwMHBtTVpvRms1?=
 =?utf-8?B?KzUxckJXWksybXlhV1BiWTNFdjVHS3QwdWpJd0EzVFhIbnE0ZE5ra0hQYWRa?=
 =?utf-8?B?dXJLeFE1c2o4NjdBVU9CUnljRG4zR2RSS3pkdUZOZkUxUFFuVlFZRUNFSXdU?=
 =?utf-8?B?WFdDVHlGOVQrN1RDQTNRUT09?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA1PR12MB6870.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?QzZNY1ZWenRBamRuc2VHZEFsMGU1L1ZGV1AyZ3hUN0lHM1Y2ZlJsTmZVRWFZ?=
 =?utf-8?B?QzNzN3BKUTVtM0xVNFVHcTB0STQ2RGNRWVg2L1pIb05ES0NCQ3NadFBiajYw?=
 =?utf-8?B?VUJVNzI4UkhlT1hRUDlZaUc0dHlyMmg0aGJRTU1QdEIvdWpXK28yRzBrZDhk?=
 =?utf-8?B?NXN2WFdWQ1Y4RDBheWNnM0tTd3FJTlVzNDRHa0JXeCsrcHpQL0haZnhJUzlE?=
 =?utf-8?B?VFFSSEVncmpyTkJFb2FDSDRBNFVJQnhwVjY1cUJibHhWODYwaExJMXBBVjBN?=
 =?utf-8?B?aS9LYW9kdnFUU1lHRFEzeUVHV2tLTkxEcExDRDVDSDVPWFNjUEpzbGFkTnFN?=
 =?utf-8?B?RWJtcGRNMmxsKytqWlBqaWNiNE5xeDA2SGJveUNRSFQweTR3cUdQMnVoVU5P?=
 =?utf-8?B?TzFRYlNBcHcxSUNPa2FuajZIN3FVU28zRndVY2VNWjcxMGZ0QVRTODBreTRN?=
 =?utf-8?B?d3hHUk1KWFgwdXM5NXlBeUZuckNNbzhoU2NpcmpXZldMZmRUZ2lwRU9mTVlC?=
 =?utf-8?B?VXVoM09haGRVOUdCcHlIWEp0Zkd6V0drRS91OUs3anYvZnI2b0RpWWZ4cG9Z?=
 =?utf-8?B?djdqb3V0ejlLSTJ3WFl3M2syQkZPZVhYeE81NnpqSDFmY2RkdC9oUzVLb3Ju?=
 =?utf-8?B?ZmhJSGJacU1BQ3lWTm0xaGZXanNNRHlqV2Z3OEFyZ2liWW1Zd2xOZHZIL2RR?=
 =?utf-8?B?MUZUOW5zQTcxUmp4REtzSVIyVXBLVWI1RVpQZjRFRnU2QzZqYmtwdzdMekc1?=
 =?utf-8?B?RmE5bHpzYUhObG52Uy80bWx3eFpWUi9CbU0wTGRFdXRRbjFnNThuVjRpRFdq?=
 =?utf-8?B?Z1hOeTMvUUlwaTl5UU1RVFNRdmFNdDdvWHI0OW1HV2doZ0Y4UHFJSFNPd3M5?=
 =?utf-8?B?aFJzL2hHSjFOMXBSbWlkc0VseDNSZW96YWNWdkdMNkZqalNKL0lpRU9ocFUw?=
 =?utf-8?B?dFNqdVdEUk5VRU1CVWhPZ1N0Uk1Xa2VBMW5BVGJjOWlTWmFsdWFZNlZjTTRS?=
 =?utf-8?B?RXVydFhUZmppVDg3TVdHSFhlaVh5TEczajBkM3pENVQ5aFp1WXREZzk3SlN5?=
 =?utf-8?B?ZHE0NWFnd3RiRGpUc2hNTC9ETTcrTmJoVzJFYm1tUEFwN1laQy9uQUNjb1Z6?=
 =?utf-8?B?MXpzVWpjODZHM3lkdTluS3dSbHN5OWRqNjE1Zk9WdFhac3ZZVVExeklOOHZJ?=
 =?utf-8?B?SUdwR2paaUlsNkYvYjBONnFPVnFzb3ZwbnJWUlkrY2JpWWxlcmd3U0R4aEw1?=
 =?utf-8?B?TlViOEFtOFUzOFZDTGZEcFNDVnEvNUFxek1OUmRKVE5PODJ0MDdZLzRPTW9X?=
 =?utf-8?B?dXh5SldsNktCNTF1OExCQis2QjYrbnpic25ieENwaXNRUHFhUEc1WkVqcWtE?=
 =?utf-8?B?Yzdhc05LODFkNE9yT3dJN0Q0Z0hDQW1USXVQYnFBWGtmS3BiZmxJTXZrblA0?=
 =?utf-8?B?VzlURkpjVG5FNFNKNmsweEFqTkh4QU9DRDY5eTNmZ1JPVml2VTU2UEt5Smpx?=
 =?utf-8?B?WnI4aEVlR3cxUmlMaGQ4T3NmeWsxQ3UrdWZkczNPenFkTUhwdFZyVmhzQmsw?=
 =?utf-8?B?RDdiVmFXb05wSGFWWTRHaHdvZG5iYlBqNWt5dy9lZHdTUEIvMnBnclM0RVlm?=
 =?utf-8?B?MEtEOXI5U0lqUitOc0N5WHVDcEhORDlMMDBadjE1R2xGdURYWlkxeUxCQ2pr?=
 =?utf-8?B?ZlltdGFHUVVwd0d1U1VkV3ZVR0p4SkxjL3BsemlkZmYzai9QU1E5TVR1YUg4?=
 =?utf-8?B?U2kyTCsyL2h1ZGo4blExaXBDTmU5SG9YTjdTc2VFYjBteHA4VE9vWEsvWXZ2?=
 =?utf-8?B?dVlFUEFUa2s0Z1daT1gwbzhOeG4yOC90ZTg2eE5KQXRnOS9vZW5icE0wbHRO?=
 =?utf-8?B?bEVUVzZKbGpzVExpN003UWVlZXFLV0NCbU41WE9UQ09FMXRRMWIxNVRxWWpI?=
 =?utf-8?B?KzNJSXBaaW5lRk5kMUxjcXdPbHF2dDJWdmtCYnJ5V05qVTYwbjZzNnFvV0xu?=
 =?utf-8?B?ZS9VZUtoRXZXSGJqVG5NRmpjNjI0b1FSY3lRNENESEU5M3NmamErT0x1L0dm?=
 =?utf-8?B?RUVvblBCeE5IaTI3bnhjazlMaXQvQTluWERrVURVSWt6N3E3SHIveUFXMGxy?=
 =?utf-8?Q?8CF0=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <B8D410AEEE4E4143AFDE9EB7F178F079@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA1PR12MB6870.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 70329fed-54e6-41a2-0b56-08dcec2b51e7
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Oct 2024 08:36:38.1255 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: PEqvp5nQzS/khhhJ10st8U2IjOB3mLpNDuKWW3NpD4wk0QfY0+O+H/dDTCoOVN59
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB9470
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

T24gMjcvMDkvMjAyNCAxLjU2LCBKYXNvbiBHdW50aG9ycGUgd3JvdGU6DQoNClJlLXNlbmQgdGhp
cyBlbWFpbCBhcyB0aGVyZSBhcmUgd2VpcmQgc3BhY2UgaW4gdGhlIHByZXZpb3VzIGVtYWlsIHdo
aWNoLg0KDQo+IE9uIFN1biwgU2VwIDIyLCAyMDI0IGF0IDA1OjQ5OjQwQU0gLTA3MDAsIFpoaSBX
YW5nIHdyb3RlOg0KPiANCj4+IGRpZmYgLS1naXQgYS9pbmNsdWRlL2RybS9udmttX3ZncHVfbWdy
X3ZmaW8uaCBiL2luY2x1ZGUvZHJtL252a21fdmdwdV9tZ3JfdmZpby5oDQo+PiBpbmRleCBkOWVk
MmNkMjAyZmYuLjVjMmM2NTBjMmRmOSAxMDA2NDQNCj4+IC0tLSBhL2luY2x1ZGUvZHJtL252a21f
dmdwdV9tZ3JfdmZpby5oDQo+PiArKysgYi9pbmNsdWRlL2RybS9udmttX3ZncHVfbWdyX3ZmaW8u
aA0KPj4gQEAgLTYsOCArNiwxMyBAQA0KPj4gICAjaWZuZGVmIF9fTlZLTV9WR1BVX01HUl9WRklP
X0hfXw0KPj4gICAjZGVmaW5lIF9fTlZLTV9WR1BVX01HUl9WRklPX0hfXw0KPj4gICANCj4+ICtl
bnVtIHsNCj4+ICsJTlZJRElBX1ZHUFVfRVZFTlRfUENJX1NSSU9WX0NPTkZJR1VSRSA9IDAsDQo+
PiArfTsNCj4+ICsNCj4+ICAgc3RydWN0IG52aWRpYV92Z3B1X3ZmaW9faGFuZGxlX2RhdGEgew0K
Pj4gICAJdm9pZCAqcHJpdjsNCj4+ICsJc3RydWN0IG5vdGlmaWVyX2Jsb2NrIG5vdGlmaWVyOw0K
Pj4gICB9Ow0KPiANCj4gTm90aGluZyByZWZlcmVuY2VzIHRoaXM/IFdoeSB3b3VsZCB5b3UgbmVl
ZCBpdD8NCj4gDQo+IEl0IGxvb2tzIGFwcHJveCBjb3JyZWN0IHRvIG1lIHRvIGp1c3QgZGlyZWN0
bHkgcHV0IHlvdXIgZnVuY3Rpb24gaW4NCj4gdGhlIHNyaW92X2NvbmZpZ3VyZSBjYWxsYmFjay4N
Cj4gDQoNCk9vcHMsIHRoZXNlIGFyZSB0aGUgbGVmdG92ZXJzIG9mIHRoZSBkaXNjYXJkIGNoYW5n
ZXMuIFdpbGwgcmVtb3ZlIHRoZW0gDQphY2NvcmRpbmdseSBpbiB0aGUgbmV4dCBpdGVyYXRpb24u
IFRoYW5rcyBzbyBtdWNoIGZvciBjYXRjaGluZyB0aGlzLg0KDQo+IFRoaXMgaXMgdGhlIGNhbGxi
YWNrIHRoYXQgaW5kaWNhdGVzIHRoZSBhZG1pbiBoYXMgZGVjaWRlZCB0byB0dXJuIG9uDQo+IHRo
ZSBTUklPViBmZWF0dXJlLg0KPiANCg0KQXMgdGhpcyBpcyByZWxhdGVkIHRvIHVzZXIgc3BhY2Ug
aW50ZXJmYWNlLCBJIGFtIGxlYW5pbmcgdG93YXJkcyBwdXR0aW5nDQpzb21lIHJlc3RyaWN0aW9u
L2NoZWNrcyBmb3IgdGhlIHByZS1jb25kaXRpb24gaW4gdGhlDQpkcml2ZXIuc3Jpb3ZfY29uZmln
dXJlKCksIHNvIGFkbWluIHdvdWxkIGtub3cgdGhlcmUgaXMgc29tZXRoaW5nIHdyb25nDQppbiBo
aXMgY29uZmlndXJhdGlvbiBhcyBlYXJseSBhcyBwb3NzaWJsZSwgaW5zdGVhZCBvZiBoZSBmYWls
ZWQgdG8NCmNyZWF0aW5nIHZHUFVzIGFnYWluIGFuZCBhZ2FpbiwgdGhlbiBoZSBmb3VuZCBoZSBm
b3Jnb3QgdG8gZW5hYmxlIHRoZQ0KdkdQVSBzdXBwb3J0Lg0KDQpUaGFua3MsDQpaaGkuDQoNCj4g
SmFzb24NCg0K
