Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3684FC9D3E0
	for <lists+nouveau@lfdr.de>; Tue, 02 Dec 2025 23:51:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 19FA310E043;
	Tue,  2 Dec 2025 22:51:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="M2tPiyPV";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from MW6PR02CU001.outbound.protection.outlook.com
 (mail-westus2azon11012058.outbound.protection.outlook.com [52.101.48.58])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 45FA610E043
 for <nouveau@lists.freedesktop.org>; Tue,  2 Dec 2025 22:51:21 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xtmswdtj6ffQfBXk0Tpdtb79L9mWXxotyFXXUe5H0VlCqUJq5DVjKTdO2WllrofKBk321t7vXhgspxKWunqQspzpphRQ9SNbaNozEAT+/mMpZnFmdSSbLqInBQjBzJDJ20D9A+bOOHrYEZL4L9i72FK+ERqbY3C2cV+RQJxbtRfeO93qxZaYeIP4oDfIz2a0E8HTopfxvz9P13nCgbj7bYuvKw9VMNV7QmjarqH5r2mwUCfgTj/0jtjkolu6Oo3ohjlYpa7ZCAZW9o0Ljxsz7ATzdYTfmXELtO0+IkYSnO7nh5jRXnGe+joR5ngWLqUvIAIm47arE9iGYvAjWnkw3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pOE4FdiRKT3ewAXYHap0kHmCD7LsmCOJKQKYqzHLCic=;
 b=M0zuZGUIzWDiUnR2ZgUM49Q+SONj/YXk7UZQcrcf+UKE6yuNKMkEM6Ql18aRQxpf0NMjgDzHyffKme5X00PaSdEo8ul7DGSPrtGfUOgUGK8X1STvG5sFuHEh9Sgv+MsXJqfyqv+CmaqLOslFKY2RcR/nHi7QQPqaAoBt2JM6ooLEG2Y2QmW65KWfDYmtkiJ2cLwzHg1xC+UgQmD2GN5/klexsIHsXWjQx0xZHGnBMJnPV57k0DObBMIuaAVkwhnDyj17mNoODzjQxdimVMuXCMyDpjx91OaZOXMd6LB7HvlEFLka3D/rSKMqqGYfc1yNgrGfGIMu3GyLkRXKAFaVhA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pOE4FdiRKT3ewAXYHap0kHmCD7LsmCOJKQKYqzHLCic=;
 b=M2tPiyPVjr88LUHcFQeG7HBIIwdLSJRlIzIt6PfM7MEdrwhn85gclh6n+05qNBhwbpQIeCP/Hk1xe+j1FkSWjCAqlshKR5cy1yKz9g7cOpk5QLM7aQ8g4I2IYnj+L56K7AmcdccJIOYETm6hrmIGWIvu1tCPnsHeI82dzieef6kvlezREgAb8qeVUTP36JNoIM8kydMlRQykr6yjWJNiDbSD/pdOoG/+/GCxDDXAuxb5deVS4xtxbYtWd2FczVS+llZcTU/ziCjP+9YOkUJKVmVDJg5Wc0uwFKA18rd3iS3PaFBGh2s1SIPdB26TdZ3DtggVWsziaF061qfGim51ig==
Received: from SJ2PR12MB7943.namprd12.prod.outlook.com (2603:10b6:a03:4c8::10)
 by MW4PR12MB6825.namprd12.prod.outlook.com (2603:10b6:303:20d::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.17; Tue, 2 Dec
 2025 22:51:18 +0000
Received: from SJ2PR12MB7943.namprd12.prod.outlook.com
 ([fe80::6a18:df97:8d1a:5d50]) by SJ2PR12MB7943.namprd12.prod.outlook.com
 ([fe80::6a18:df97:8d1a:5d50%4]) with mapi id 15.20.9366.012; Tue, 2 Dec 2025
 22:51:18 +0000
From: Timur Tabi <ttabi@nvidia.com>
To: "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>, Joel
 Fernandes <joelagnelf@nvidia.com>, "dakr@kernel.org" <dakr@kernel.org>,
 "lyude@redhat.com" <lyude@redhat.com>, Alexandre Courbot
 <acourbot@nvidia.com>, John Hubbard <jhubbard@nvidia.com>,
 "rust-for-linux@vger.kernel.org" <rust-for-linux@vger.kernel.org>
Subject: Re: [PATCH v2 12/13] gpu: nova-core: add PIO support for loading
 firmware images
Thread-Topic: [PATCH v2 12/13] gpu: nova-core: add PIO support for loading
 firmware images
Thread-Index: AQHcYxwHBSave/ae9k2hA2nYTiWDUbUO3YEAgAAYngA=
Date: Tue, 2 Dec 2025 22:51:18 +0000
Message-ID: <aba0e260e8a2909c3c66a1aca07574c9192b0dbd.camel@nvidia.com>
References: <20251201233922.27218-1-ttabi@nvidia.com>
 <20251201233922.27218-13-ttabi@nvidia.com>
 <581a1e44-e6a7-4ce1-8254-a92392d80cbd@nvidia.com>
In-Reply-To: <581a1e44-e6a7-4ce1-8254-a92392d80cbd@nvidia.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.52.3-0ubuntu1.1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ2PR12MB7943:EE_|MW4PR12MB6825:EE_
x-ms-office365-filtering-correlation-id: 0d5b528d-ff76-43e3-5afb-08de31f54e87
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|376014|1800799024|366016|38070700021;
x-microsoft-antispam-message-info: =?utf-8?B?TnIwcndTYk9MVG1ueXdGN00zZjRJSXhIZDY3KzBqNjE2WjlvUU9Xa0UzVXdr?=
 =?utf-8?B?dCtrMVdSUldWOFBveDcyakdlME9IVWU1dGJOK1pYTTBuOFRSSTVXWVFBc3h0?=
 =?utf-8?B?N3d4Tm9YZ3oraHBYZFhyTmtDZ1dWUFpvT3pRS3FEY21ZZHR5Z0c0eHFMQllU?=
 =?utf-8?B?dUtQM1lod3JNd2RFS0M5dlZzbE4wYXVWWUpqVDFVd1dGRkR3QmM0VjU2MGNw?=
 =?utf-8?B?U096dGJ3Znl6VXJCaDVmWUFuWjFGbG1pNUpURC9kN3R2bmwyZW5KZDNkcFJU?=
 =?utf-8?B?eUxEbi93SHBQNlVjZlRqL3U0WFJwWUd0c0Z3ZE5ZVU5kWlFUUWNoRzMwcDY2?=
 =?utf-8?B?R0ZpY1JzcDRpakhjeGNSQmNHS2NHUjlnWlFlbW5JeUFtVERaYjZ2QnpteVlB?=
 =?utf-8?B?V2x4ZHVWem5BWERXcVJ0dTYxOTZOSkpQZ2o3ZWlFWnFrdUtvelhyWjdCWGlw?=
 =?utf-8?B?ZUFsOU1kN2VySWExMmh6R1VWR3RDZHF3OVZ3eStJTnhrV3ZHSitBZC9Sb3dF?=
 =?utf-8?B?NzBmRmJXOVl1ajhLSEQyVHkwSG5iWXBTRHZaY0VvVVFOTU1STC9ObGRDT1FY?=
 =?utf-8?B?Z1F3ZUdoSThBSzBCbHN6bXdidUpHNmtNV2ZudXZJdmUreVUvTDMxSWNKelF2?=
 =?utf-8?B?bjhNTms0dVc5NnNNeEFGV2l1bmZuampQR1VsTGhCcS96cmtXVk1HM1BmZExT?=
 =?utf-8?B?clJnZEcrSUNIcFdMQ1ViY1lnOUVVaUgrSmpZZnhyVi9RVWU2NCtNcnlBYVl1?=
 =?utf-8?B?Tmt0VDlUS29XTVBqQ0pteWVJakN2cXBJaVpkcmx5MUdZM0F6L1drNjRGK2p2?=
 =?utf-8?B?Tmdta3kzYUluZllmQ2ROMUZGQ3pyMFdZdDVIZ2MycEZOWS8yNERKb2wxSUJs?=
 =?utf-8?B?Mzd3RnEwT3VVWkdkb0MvRXQ2cVVHRlVVRTVPOUxCZnhVNUVxSTdiNWMvYXl3?=
 =?utf-8?B?dGYwd1FzRm4wbzkrSjhvdlptT2VRSE9DS1ZmZVZxaUhPSzE1QUJuYzQvRHBl?=
 =?utf-8?B?dTdUKzREbzFETDR6VzJ5MXRlbVpJSTF0YmZIMkVjM2h4K3ZVbDdVd1h4Vnp2?=
 =?utf-8?B?WmdzTjBoeGZRYlg2RXN6YUZoVmpocjN2Q0hTS3dHaWE5dEROZm4xQmFiRkNP?=
 =?utf-8?B?a05YY0EwSUpmMzhXTnJrWEJoV0pSK2doQXZYVzNlWUN2dzhqcXQxSUlzZHRn?=
 =?utf-8?B?Y3N5N0hYbG5MdDAwZk1kWWkya2VKTGpqRmpRNytxVDVSZ3lVTHNnT25nblBq?=
 =?utf-8?B?bm0rWTFwbjR5aHBmL0pxc1NlMzU3Q01mTmFyWHhEa0JDMXFJR1lxbG5heDdQ?=
 =?utf-8?B?SDlmRzMvNWticDNPd1BvQjNlTEhNb0c4cldleEpzMGppRGFFeDcrVk9sTHk1?=
 =?utf-8?B?eTNDY3QvVjJlOVZaMy9NckdpK21wNE5wQWROQ29zOStJbEdZKzVmejN5RDJG?=
 =?utf-8?B?ZUZQT2ZGUDdhWmVHZ1ZBQm9vVmZXVTM3ZlY2bmc1MktXU0VjZU1TSlVUOHNU?=
 =?utf-8?B?YkdqekNBRXE4Ky9ZWTdKNU41ZFZSN3pjVUJyeTZxZmI0b3ppTkFkcGMxaUYr?=
 =?utf-8?B?ZHlzdFVoT200aG92L3g3emJMVDJZbC9FNEJyM05CYklDeVVEV09HYUhIOTVm?=
 =?utf-8?B?ODNQd1pJWlNjeTZPR0xpM2ZsMDIyZGFsK0NsV0U1ZGFlNFFWQzlCc1BzZTIr?=
 =?utf-8?B?c3hhekpkN1Z3VFpJbDkrYnhSWGVGRXFEbUFNYUNOVjJpRDFFMXBGNndad1BZ?=
 =?utf-8?B?YVZrT0J0T1BUUDVOUnowVStZanA3Nlg3VFY2OG9rUUxGaFFPcTMxSm5QQzFR?=
 =?utf-8?B?c3NkUVB5MG5wVTExd3V6azdXYnRHNGRYeU9BRHBvVzdyMWtualpTT3dJVW5m?=
 =?utf-8?B?TDJGVGNrNUZERTBVWXU4bk1Ibm9kanRrak9uWmhXSlF4R1dwcU9zSmJ3ZGIw?=
 =?utf-8?B?eG9kb3pSeW91bXZKa0p2Q2JzbmVPWnZhQm9ZY3ZUbWtmQ3d5bEpTSVhIWTVT?=
 =?utf-8?B?NFBSWGI2S1pEaUVhV0FrMXRKZ003dVNURVk2Vit2QzV2Z0JscEVsRDBpQWM3?=
 =?utf-8?Q?bUMrtH?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ2PR12MB7943.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(38070700021); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?TDc4SzVVTnA5Wm5Yd1hiQVNWN09iT3RnRkJkOU1uMHVReXh2NllzOHExTFd4?=
 =?utf-8?B?R0Zkc3lUb2haTjZtL0FYM1N2RnVUZzFSVkRMeXJuSU9VYnplUExFcnpKWlM4?=
 =?utf-8?B?Wng2T09RcGNuMHJzRUorb1NDNi9DeVVwUmkwdlpZMm52NkIrRTNnTjhOV3VN?=
 =?utf-8?B?R3FtTTVldHpRNUo2bXNJdWM5a3I3VUpwMzA1M2xET2ZYaTZDRVRlN293emxO?=
 =?utf-8?B?bWJwV00vM3p1WFNBaUlSbHVvL1BMelMvZXJkZXc2b2ZHNVdHTDBzWTkvWmRT?=
 =?utf-8?B?VXdQWlVsbGN3NGVzeEtUSE9uRjVmZWxmUElLQnRaQ2p5aDNYaENucEMwL2VO?=
 =?utf-8?B?YlpPZ2ErOFFHQzNrWmowcG5uc0hYNEdrZENCcE5BYVpUTDg4WVVqN0laZ2pV?=
 =?utf-8?B?QXZ4em04ckdiMlZMMW1iN001S1JqQXVvY25ubmpRSy9GQnZRYStRRTBIYzFz?=
 =?utf-8?B?YXdMdFlXNVU1ZGZ1WjRDekJhMStFSTIrUmtDVXl5M1hkOTBHVDZuMnR5TFAy?=
 =?utf-8?B?SUwzNFh3dmVOQjZ0RVNGY3VRT2pDVnp6S2g0ZkF4UW1DaWlYaC9nRkE4S0s5?=
 =?utf-8?B?a3hNeXRRUWRjMnoycDc5VHpuLzZkbVZtekRheUFTWVNtYkFFRnVyaFdRWjJM?=
 =?utf-8?B?SzZUdE0wOXJmY1NHZk9xaUk4c2lGRWV4MGxQRDZxWFZDQ21jUm9jTnFmcUN5?=
 =?utf-8?B?VFBvSHhJbGhnZ1MvWC9ZL2dRTlltZlhWQS9iMXVsWDV4UDVIR3JIZHJqMUdK?=
 =?utf-8?B?WnpNRytEbzd3RS8zQU5GS3o5UEkzUFQvQVdQQW1uTjkwdExIcG1tb2lHVHQ3?=
 =?utf-8?B?N3JGSHRiMkpXTnlIWDR5a3Y2TkVTbEJLTWxuL3BjV1l0LzdKVmRkKzBjQ1d3?=
 =?utf-8?B?ME5SYWVMMDcrMzhteU02TVdmK1pqejhUbUY3YWdwdkpjTlRtSHRUR1pTUnlB?=
 =?utf-8?B?MXRVcEp4OE1Va2IyVVdKSGcyVmxRVlRGZys4S0wycG9PZGtVRDFUc00zK2VF?=
 =?utf-8?B?bU5qTEo0ZXBhbmNramZUZytHNXQ2T3k1TmFheUZ6dTBRNWV3TjN4elpQTHhv?=
 =?utf-8?B?NkVSb1d5N29zWDVzYVRMc1hzeDVMYkk4VS9IcDU2cFdDQzhGc0o5K2Y2VWVH?=
 =?utf-8?B?QkZnVWlITHFlKzJzYm5YQU9GbWNQMnpJVnV4MGF4MG5YRUlpNmpiMlNjcVB0?=
 =?utf-8?B?a01YUWFMK0JxU1lFc1dVcnFKb1ZPclFwcmE4eDFYcWRDdmppMVJjYTlWVC9H?=
 =?utf-8?B?RmNBVUZ2VXhQQUYwS0RFNDJEOGhCZzJFZG1mVVhFVHloQUoxR0tRNEdyRER0?=
 =?utf-8?B?dXJwd05nL2NsRjJteFBpOURYVGdmVGRjSWhRQklHaG1nV2ZLRVIxejhRczVP?=
 =?utf-8?B?NXdsM3FjWXRXcHN3eHRZZThtblpwclNWZ0Y0SERmYUozQmc4SGtPd2RGcy83?=
 =?utf-8?B?dFd1R0gyOEdvRUQxQk96VTdKTFZPWm8vL2pLR3JPOU1VUFlGRW1xdGdKbGNY?=
 =?utf-8?B?NCs1elFWNHQ4bFdSSHZUNllsdFhYSnZKanY4V2g4S0t3YUdmRXk4OGtYbmN3?=
 =?utf-8?B?T2l0ZkxNUXh1dEZnaGlQc0MzdFl4TFFzMFRTZmdjVFRrVWZ2NFF1eisxQlZK?=
 =?utf-8?B?NnBuTG9HZzNFcFdOcVg5UlJSR1UzRlZWSFhsbDdwakZPdU5TM1o1K2JVWUl4?=
 =?utf-8?B?T1R0cUpoellYNm5zNmFqZTc4clJhSXlrdWJWQnBWZ3NXdk14SnZRMjlWelhn?=
 =?utf-8?B?bkxzdHBEenpUbGdoTnhUbjEvTHN3azVUK3FDb1FicWR2WURVYkVuWTQvRFUr?=
 =?utf-8?B?amdTZTU5Ynhva0lZVTBSaVJ0NzBkczV0dUJhUFExaUxNcmNQWVpGSHhGUlF4?=
 =?utf-8?B?UTlqSDNWQnQrR1BnRWczTXcwVjVIRG1iSjBIOHBrTHVRdDBlM2JJdmV3ZnRh?=
 =?utf-8?B?UjVweTZTNmx6NjJQMmdKcDdyYkpYRmxLVVJTcmswcng2MDRoSG5jK3hQWFFE?=
 =?utf-8?B?TnFLZ0tNbXZXdUNKRFg3dm5KUyt4clJMbHdhVHc4QWNnWDJ6MWhSdjkrb2pF?=
 =?utf-8?B?Q25CdFYzTmFIMzlSZDBhWGZicEowSy93WmEvNnRkZkJWczdMOE5aSmZiSWJ4?=
 =?utf-8?Q?QoR1paEXXFnCbVSgM4RUm05Dk?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <45B2CC1DB6C83D429146EAB58DC4559E@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR12MB7943.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0d5b528d-ff76-43e3-5afb-08de31f54e87
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Dec 2025 22:51:18.6930 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: GzxvMj/IKXmjoulMCRLfL1xlPIZ3UNidnrSBsVVqXK28+emy1YRcnZYHE9bOvdZWAs8IpMmC8bYyIe1Epj9VMQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB6825
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

T24gVHVlLCAyMDI1LTEyLTAyIGF0IDE2OjIzIC0wNTAwLCBKb2VsIEZlcm5hbmRlcyB3cm90ZToK
PiAKPiAKPiBPbiAxMi8xLzIwMjUgNjozOSBQTSwgVGltdXIgVGFiaSB3cm90ZToKPiA+IMKgCj4g
PiArCj4gPiArwqDCoMKgIC8vLyBTZWUgbnZrbV9mYWxjb25fcGlvX3dyIC0gdGFrZXMgYSBieXRl
IGFycmF5IGluc3RlYWQgb2YgYSBGYWxjb25GaXJtd2FyZQo+ID4gK8KgwqDCoCBmbiBwaW9fd3Jf
Ynl0ZXMoCj4gPiArwqDCoMKgwqDCoMKgwqAgJnNlbGYsCj4gPiArwqDCoMKgwqDCoMKgwqAgYmFy
OiAmQmFyMCwKPiA+ICvCoMKgwqDCoMKgwqDCoCBpbWc6ICZbdThdLAo+ID4gK8KgwqDCoMKgwqDC
oMKgIG1lbV9iYXNlOiB1MTYsCj4gPiArwqDCoMKgwqDCoMKgwqAgdGFyZ2V0X21lbTogRmFsY29u
TWVtLAo+ID4gK8KgwqDCoMKgwqDCoMKgIHBvcnQ6IHU4LAo+ID4gK8KgwqDCoMKgwqDCoMKgIHRh
ZzogdTE2Cj4gPiArwqDCoMKgICkgewo+ID4gK8KgwqDCoMKgwqDCoMKgIGxldCBwb3J0ID0gdXNp
emU6OmZyb20ocG9ydCk7Cj4gPiArCj4gPiArwqDCoMKgwqDCoMKgwqAgbWF0Y2ggdGFyZ2V0X21l
bSB7Cj4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBGYWxjb25NZW06OkltZW1TZWN1cmUgfCBG
YWxjb25NZW06OkltZW1Ob25TZWN1cmUgPT4gewo+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoCByZWdzOjpOVl9QRkFMQ09OX0ZBTENPTl9JTUVNQzo6ZGVmYXVsdCgpCj4gPiArwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgLnNldF9zZWN1cmUodGFyZ2V0X21l
bSA9PSBGYWxjb25NZW06OkltZW1TZWN1cmUpCj4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqAgLnNldF9haW5jdyh0cnVlKQo+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgIC5zZXRfb2ZmcyhtZW1fYmFzZSkKPiA+ICvCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAud3JpdGUoYmFyLCAmRTo6SUQsIHBvcnQpOwo+ID4g
Kwo+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBsZXQgbXV0IHRhZyA9IHRhZzsK
PiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgZm9yIGJsb2NrIGluIGltZy5jaHVu
a3MoMjU2KSB7Cj4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgcmVn
czo6TlZfUEZBTENPTl9GQUxDT05fSU1FTVQ6OmRlZmF1bHQoKQo+ID4gK8KgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgLnNldF90YWcodGFnKQo+ID4gK8KgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgLndyaXRlKGJhciwgJkU6
OklELCBwb3J0KTsKPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBm
b3Igd29yZCBpbiBibG9jay5jaHVua3MoNCkgewo+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgbGV0IHcgPSB1MzI6OmZyb21fbGVfYnl0ZXMod29yZC50
cnlfaW50bygpLnVud3JhcCgpKTsKPiAKPiBJZiBpbWcuc2l6ZSBpcyBub3QgYSBtdWx0aXBsZSBv
ZiA0IGJ5dGVzLCB0aGlzIGNhbiBwYW5pYyByaWdodD8KCkkgdGhpbmsgc28uICBJIGp1c3Qgbm90
aWNlZCB0aGF0IEkgdXNlZCBjaHVua3MoNCkgaGVyZSBhbmQgY2h1bmtzX2V4YWN0KDQpIGluIHRo
ZSBEbWVtIGxvb3AgYmVsb3cuIApJIG5lZWQgdG8gbWFrZSBpdCBjb25zaXN0ZW50LgoKY2h1bmtz
KDQpIHdpbGwgcmV0dXJuICZbdTg7IDNdIGlmIHRoZSBidWZmZXIgaXMgc2h5IG9uZSBieXRlLiAg
Y2h1bmtzX2V4YWN0KDQpIHdpbGwgc2ltcGx5IHNraXAgdGhlCmxhc3QgMyBieXRlcy4KClRoZSBw
cm9ibGVtIGlzIHRoYXQgaXQgaXMgYW4gZXJyb3IgZm9yIHRoZXNlIGltYWdlcyB0byBub3QgYmUg
YSBtdWx0aXBsZSBvZiA0LiDCoFN1Y2ggYW4gaW1hZ2UgaXMKanVzdCBub3QgdmFsaWQuCgpTbyBp
dCdzIGEgbG90IHNpbXBsZXIgdG8ganVzdCByZWplY3QgdGhlc2UgbWlzYWxpZ25lZCBpbWFnZXMu
ICBUaGUgcHJldmlvdXMgdmVyc2lvbiBvZiB0aGlzIGZ1bmN0aW9uCmRpZCByZXR1cm4gYSBSZXN1
bHQsIG1heWJlIEkgc2hvdWxkIHB1dCB0aGF0IGJhY2suICBJdCBqdXN0IHNlZW1zIHdhc3RlZnVs
IHRvIHRlc3QgZm9yIG1pc2FsaWdubWVudApvbiBldmVyeSBwYXNzIG9mIHRoZSBsb29wLgoKV2hh
dCB3ZSByZWFsbHkgbmVlZCBpcyBmb3IgZnJvbV9sZV9ieXRlcygpIHRvIGJlIGxlc3MgcGlja3kg
YWJvdXQgdGhlIHNsaWNlIHNpemUuICBJZiBJIGdpdmUgaXQKJlt1ODsgM10sIHRoZW4gaXQgc2hv
dWxkIGJlIGFibGUgdG8gaGFuZGxlIHRoYXQuCgo+IEV2ZW4gaWYgaXQgaXMgdW5saWtlbHksIHVu
d3JhcCgpIGlzIHF1aXRlIGZyb3duZWQgdXAgZHVlIHRvIHBvc3NpYmlsaXR5IG9mCj4gcGFuaWMu
IEknZCByZWNvbW1lbmQgc29tZXRoaW5nIGxpa2UgdGhlIGZvbGxvd2luZyBzaW5jZSB0aGUgZnVu
Y3Rpb24gY2Fubm90Cj4gcmV0dXJuIGFuIGVycm9yOgo+IAo+IMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgbGV0IHcgPSBpZiBsZXQgT2soYnl0ZXMpID0gd29y
ZC50cnlfaW50bygpIHsKPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqAgdTMyOjpmcm9tX2xlX2J5dGVzKGJ5dGVzKQo+IMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfSBlbHNlIHsKPiAJCQnCoMKgwqAgLy8g
Y2FuIHByaW50IGEgd2FybmluZyBoZXJlIHRvbyBpZiBuZWVkZWQuCj4gwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGxldCBtdXQgYnVmID0gWzB1
ODsgNF07Cj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgIGJ1ZlsuLndvcmQubGVuKCldLmNvcHlfZnJvbV9zbGljZSh3b3JkKTsKPiDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgdTMyOjpmcm9t
X2xlX2J5dGVzKGJ1ZikKPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgIH07CgpXb3VsZG4ndCBpdCBiZSBzaW1wbGVyIHRvIHVzZSBjaHVua3NfZXhhY3QoKSBh
bmQgdGhlbiByZW1haW5kZXIoKT8gIFRoYXQgd2F5LCB3ZSB3b3VsZG4ndCBuZWVkIGEKdGVzdCBp
bnNpZGUgdGhlIGxvb3A/Cgo+IEJ0dywgSSB3aXNoIHdlIGNvdWxkIGVuY29kZSB0aGUgc2xpY2Ug
bGVuZ3RoIGNvbnN0cmFpbnQgaW4gdGhlIHNsaWNlIHR5cGUgaXRzZWxmCj4gKGkuZS4sIHRoZSBz
bGljZSBsZW5ndGggb3VnaHQgdG8gYmUgYSBjZXJ0YWluIG11bHRpcGxlKS4gQnV0IEkgdGhpbmsg
dGhlcmUncyBubwo+IHdheSB0byBkbyB0aGF0IHdpdGhvdXQgaW50cm9kdWNpbmcgYSBuZXcgdHlw
ZS4KCldvdWxkbid0IGl0IGJlIGEgcnVuLXRpbWUgY29uc3RyYWludCBhbnl3YXk/IFdpdGggdGhl
IGV4Y2VwdGlvbiBvZiB0aGUgQm9vdGxvYWRlckRtZW1EZXNjVjIgd3JpdGUsIAphbGwgb2YgdGhl
IGNhbGxzIHRvIHBpb193cl9ieXRlcygpIGhhdmUgbGVuZ3RocyBvbmx5IGtub3duIGF0IHJ1bnRp
bWUuCgo=
