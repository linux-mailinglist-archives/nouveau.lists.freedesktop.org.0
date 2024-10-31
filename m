Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C2E59B7CD3
	for <lists+nouveau@lfdr.de>; Thu, 31 Oct 2024 15:28:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C309E10E8AA;
	Thu, 31 Oct 2024 14:28:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="lFG6WJhv";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2054.outbound.protection.outlook.com [40.107.237.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6CCEE10E8AA
 for <nouveau@lists.freedesktop.org>; Thu, 31 Oct 2024 14:28:02 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ONdDTyScb2XjxJQkHgUSoKb3fYUJ4xoPpieg18yH5jnxCIzZ0ldd9FTotTKUhYP79pg3Z7dyhRJqTQEDXp7BkJE42TSeAOooo4hWjHmCWWDvNUys0YsAZCrqksZmaQs6cGJzZcCE83dkqYHsA5kWsIcolMfpwxuHeXsKq47eKaKET2xIqiKEauvRas8pz1w2koJaE9RP/vgL8vfMTdTDcubdVOqNNFXWN25oWUE1VO1r3YU9koG0E4xQcFWHW8uazB17u61lk9cvTkXOjOGWX/hxcB7svvgFmWHKKaYiZxD9xxRWBgg+1YLuSMiCod0OLpf/jxCwED+gOg4Hbhcb4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qxeeCNDBWTIed617YggZhKJdkdTdzCl+gC75Lio/rM8=;
 b=Yi9a22QwlRBzrVXKeSwktXtRkkKQq4bxrRgtvHfjup2WqfO25goP0xTtwTDIB6XH7PhwVkslVP7w5y330dc/2BIcNJG+Y/pGZDLwnK1R+B7K/j+AdMwAdSkET+qEzIBhfxvANr6ls22txU6iuZvVRSITqK0LY8ilOVzyBgqEUIZfoIGvSpWpCHHqLMGYjXnZzPdsBPHkxHsdyhtXPil/COv0ivbzpbd5ekW/JbKqZNIP5F8ACg8RuX6RkmGA0zVcHDqneHomJL5er25cRZ5wZGZhaPn/qLaVGt7fhA4vHFCgC+/XI2YduS45ZhLPpHe5YCLAzZwVbtkyfxrbKy6Gzw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qxeeCNDBWTIed617YggZhKJdkdTdzCl+gC75Lio/rM8=;
 b=lFG6WJhvviPjpa2WZZ32M81flK/dDKrFQKztHIXo9AHgbuLSOmpK5mN9R2bFhFqrBATTXbSaJZTLHReNV/1u07SA+O0cqOv3LWFVaG+YrMzcZaJQ6m5AEVRkGgBJyz2VOIQxaVLVMgqLpAynXPsiBZbDXUOvPq2T3t+wz7TqDwcqcGPAQscdqmjj/XksWe6eAk5+4fPnqS/TUoVtJDOpOX4VKEafVzQ3QaeBt8EgsZSAJgvWlYBGXaESf6rO8d8fPF0UUmg2nkchC88W64g74t7PPo0SYerG9Txe7XZobUg3ER8BIDjpL97C6kG6O0nYMSyhJEmSJZqGXBqI4ux0OA==
Received: from CY5PR12MB6526.namprd12.prod.outlook.com (2603:10b6:930:31::20)
 by IA1PR12MB7615.namprd12.prod.outlook.com (2603:10b6:208:428::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8114.18; Thu, 31 Oct
 2024 14:27:57 +0000
Received: from CY5PR12MB6526.namprd12.prod.outlook.com
 ([fe80::e420:4e37:166:9c56]) by CY5PR12MB6526.namprd12.prod.outlook.com
 ([fe80::e420:4e37:166:9c56%3]) with mapi id 15.20.8093.027; Thu, 31 Oct 2024
 14:27:57 +0000
From: Timur Tabi <ttabi@nvidia.com>
To: "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>, Zhi Wang
 <zhiw@nvidia.com>
CC: Surath Mitra <smitra@nvidia.com>, Ankit Agrawal <ankita@nvidia.com>, Andy
 Currid <acurrid@nvidia.com>, Kirti Wankhede <kwankhede@nvidia.com>,
 "airlied@gmail.com" <airlied@gmail.com>, "Tarun Gupta (SW-GPU)"
 <targupta@nvidia.com>, "dakr@kernel.org" <dakr@kernel.org>,
 "zhiwang@kernel.org" <zhiwang@kernel.org>, Aniket Agashe
 <aniketa@nvidia.com>, "daniel@ffwll.ch" <daniel@ffwll.ch>, Neo Jia
 <cjia@nvidia.com>, Ben Skeggs <bskeggs@nvidia.com>
Subject: Re: [PATCH v3 10/15] nvkm: refine the variable names in
 r535_gsp_msg_recv()
Thread-Topic: [PATCH v3 10/15] nvkm: refine the variable names in
 r535_gsp_msg_recv()
Thread-Index: AQHbK3JnKf7W7e8ld0qMIAyQpr5kmLKg60IA
Date: Thu, 31 Oct 2024 14:27:57 +0000
Message-ID: <c49355ab2b273d074e060671558f6a2bb6009c20.camel@nvidia.com>
References: <20241031085250.2941482-1-zhiw@nvidia.com>
 <20241031085250.2941482-11-zhiw@nvidia.com>
In-Reply-To: <20241031085250.2941482-11-zhiw@nvidia.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.52.3-0ubuntu1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY5PR12MB6526:EE_|IA1PR12MB7615:EE_
x-ms-office365-filtering-correlation-id: 517b4ffa-c053-4e75-453b-08dcf9b8372b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|376014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?MjRxcGVIZEJYZjIySEJtVzJTWEQ4QXlZMXJ5dWdiaXdKR0Z4cnVnNzNHc1Bm?=
 =?utf-8?B?TXJvNEVQdXFtNUl0L1JLc29xVkZONy94dmFCVXNDT2tXeHBZUzdROW40MWgr?=
 =?utf-8?B?emEvai9iWkVIb0s1VjFUZVNxdG8xUUN4VmpDZlZoUEs1T09hNmxTWTNWU21W?=
 =?utf-8?B?SktvQ3FOaEFwZWlqQm91OFV5M1YxbmllU3BlcnU0VmZpR2pWbGNXOWtwcDFO?=
 =?utf-8?B?THJzOS9OT08rMHQxdys3aTRmSTI5L1JPN1oxTDBzZHErNUduZEgxS3QrRGk3?=
 =?utf-8?B?Z1VtZzlWbUpGL2M1OE9BeHVYMUZyaHpSUVlNdHVRYXBpTk02NCt2M2FjeVBR?=
 =?utf-8?B?Yzl1OU5NNWdra3NDWGUxaWU4aVJveHBXL0QySStrNGhHamZPZzQvSXU1STJD?=
 =?utf-8?B?b0R3dVlKbFFDMlgwMTRIcTZkVlIxak9TdkNPbGNHbGRQRjJ1YlJOU2phdG1h?=
 =?utf-8?B?UU8zMFFKWWV3eXZJUGMyQVFjR2JMSDhPc2tqbklBQlVuVGxKOFVLa2RicVRt?=
 =?utf-8?B?bFBOdUxnRkZvOWRFdGZVUy9hMU9VaXBlSFFnbG9IK2FKVDlBVkdIRE51K2hn?=
 =?utf-8?B?TzBuUUU0RDBTS1h4TjRTTG9iSE9Ed3p4ZWJlaFFwTWEvY1VSTFBUZTRMeGdW?=
 =?utf-8?B?aGR6a0RKSlVWdm83R2pVRkFqMTc0czdOb2ZkdFczM1BCU3J2VTVucFVGZUFY?=
 =?utf-8?B?ejBUaGVXSXdVYVNQd3VCUE1FWEk4TGg1akw5aFQ4aUpWV01RdlFvMmlQa1Iw?=
 =?utf-8?B?OStsb2VlSjVJMTJhS1BaUm5yQjJzbjVmOVlBSVNjdDRTVVAvczAvbktWSkZN?=
 =?utf-8?B?R0xlWllpUjlIdXNVUmc0K2ZwZUpZUzBOd1lpeFlUZXdmeDZrSHdJcit2aTlj?=
 =?utf-8?B?WFVrYTY2bGVKUVRiVWtWMFp6Q1hrdnpYeVhjY2pDbkpyY3hnYzJDb3h5SHFj?=
 =?utf-8?B?TkpRZmltUjY4OEJzRFhXbUpLR1VvSjV4YlhzRUFnRW0wQmw4czZTOUJ3bEpB?=
 =?utf-8?B?bU1vSlhwWU9NY3Z1UlMvd0FiUHRZVDdkQU1qeWxta3lsbSsyM2lOWFJmbGdE?=
 =?utf-8?B?Z1RjYjArUHhPRG1mUGpMbFYxOGNOV2JjRklvNkFvaUdBankyQ2VEY3BMQ201?=
 =?utf-8?B?REZEWmlRUUlscVA3S1AyWWpUUUNCNml6TWhNbTNqOC9jem5MRUFPTHJFamlr?=
 =?utf-8?B?UnJ4L1gyallDdVVLMVJaVmJZWEtSUVBNSlh3YWV1N1hmQ1h0Y1M0eVJHZUUx?=
 =?utf-8?B?RlVPbUZVZ2ZPWGJjeitjQTljUEhYcjVpSXlDdlZYRVlHOUttazBqbXJqeUhD?=
 =?utf-8?B?L2NwOU5zdFVmZkpLUmIwS1p2cWpvSDloa2Nzd2l3Z1hldDd2L0tFL1lJNzVN?=
 =?utf-8?B?dExuZHUyY3pCV3puQlBzMGxkZlNicHcwaHcxZGJEZkdyNXg3a09MU1pYaHVE?=
 =?utf-8?B?QWU1QzJkQkd6ZW5kajhvMDBKOHkzbjJ3T0hVUmNpVmtZblovbXVWb1orVnJY?=
 =?utf-8?B?WDdnd01PWVFia0VRdjNVdUlCVnkrVG9yRXZYa3FZdUtuVEhaT1hTV09rMExo?=
 =?utf-8?B?ZStZQndaSU9ZeU9BaHV0L09uSFVoeHQweXZCOUs3Q3JlWFZPNXBOblhpRGpY?=
 =?utf-8?B?VytmZ1lWZnRVaVRKa28rWGlFd2ZnUE9Ma1B4L1lhMTN1Q1FzYkI1SnhWUjR4?=
 =?utf-8?B?NXZXcTgwU2lHeVpRTXhDMGF6dEErK2JvOWxUZ3RFeGlDbS9rRFEwK25BS1Js?=
 =?utf-8?B?VXM3N2wxNWVxTGNqY25FcG4rczE5N2QrZFR0cllVQkExWWZPekNkK2xmKzRi?=
 =?utf-8?Q?o6FLsFBkhJAyetsOwOTzy9/shz606oLgYQAyo=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR12MB6526.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?V3BXRThzK0dteHYybHo3K0NDQlVwWkkvN3RoeTA1VURQekw1MHFwTkZ3OFNr?=
 =?utf-8?B?NG4vQkx5dWZSbGlFMUQ3TC9CWTRpOGp1bnduVW5TbnZGSXRBd081TnBlaGpT?=
 =?utf-8?B?cTBsNW13NDdvcnloT0hVTHl2WllJTXJsZi9SWWFrZ2tMMVpzeEYzN3NqZytK?=
 =?utf-8?B?dnBKNHZoaExsbU4wQitRTE5GWTN5eGlJZWgvNXRhbWM0Y0Y4cS9vUUIvZmU0?=
 =?utf-8?B?MTh2T0F2WDFYZXFNNXJ3Q2Z1M0lBWHlkQTY4REpLOUlmVEdNZkhrTnNZUld1?=
 =?utf-8?B?alZsbkdPRzBjb1pGWU8xT0ZIQUhhYkYzUVVTaWp0WFVtNnViTk5icnEzYjlT?=
 =?utf-8?B?dUx3eXVBeUJGNGdCVHB1ZlNmaHNCd2NzVm9zZmo4RU42YXkwbW9OSGExZUth?=
 =?utf-8?B?cDVmSEI5WVdsV2w1c1BJZ1FLNnYwZkxkREJzd2FGSVE2QUVqWFBwbnBVSC9r?=
 =?utf-8?B?YTlpOWRZTmp6UnRGajl2SmFVb3FvdXg0dk9BSVhLbFA3RVUxNGk2b0JwTG0x?=
 =?utf-8?B?aDhXUmhhOHo3bFFOT09KeGIrbU8xT1d6anc1NVQvZE9zTUdMcWNzRVo4ZGxO?=
 =?utf-8?B?T0JQNHpNTlBvTC9MazlQY0tVTms4cFJia2txZEVsY090ektpNmVWeGVoQUt4?=
 =?utf-8?B?ZkVXcGdXdnd3NERmdzNMY0ZPanpPLzdrN1ZwUFVsTGUxWURDWDRrYUc3cjUw?=
 =?utf-8?B?YlRCci9TQ2RNQzIvcnR4UGlHK09TSEorOU1NcjRNcU1RTXdDQ3p5M1V5U1Vu?=
 =?utf-8?B?WWJ4TnpuMkJEb1RwVGdBUDNsQ1g2dkxZL1VZdm9JQTZDSTJnWWxzVW5EcE95?=
 =?utf-8?B?YVhSYThEQ2VidWdWZWxnQ1Y0STVnV3RaRUE1UU5aT0YyYmRDN0kwUnpoQk4v?=
 =?utf-8?B?NU5sTHdhMlJGRGM3SEg3NkR3TkR6cjRoZjc1UHNDSkJvSkh5dHpCRWpld2VU?=
 =?utf-8?B?VFdDNjNjdEJpK2hpRkN0UmlLOTc2ckcxRzVNVFBIQzZOS2liT3YwdDd5RmFa?=
 =?utf-8?B?NFFqMmkzZ1d6ekFFYmNpUkkySVNQaFJVK25ldDVzL1lWRXRwOUlkd3E5clg5?=
 =?utf-8?B?a3VUNnVNUFdyYUJ4dklNU2Y3ZkRlUW4yempIQUNzcDZPdG5rUEJ5Tmcxc3hy?=
 =?utf-8?B?NFRoZHNXbVoyWjVXVitPd1NEcHR5KzFKQ2VTbVFSQTVtM2tTTU55bXN6UzUr?=
 =?utf-8?B?OFRSMWNIVFg5ZnVyWngyTExTV1NYOVY3aHdQSForQ0VPcndycVpoUkNUTzRS?=
 =?utf-8?B?b2xZV05nNVpqbENnYzNHRlR5enhZRzRIb1VxdUZGUU1WNmhVTGhTaWhpMnhs?=
 =?utf-8?B?bTA4YktvVEtiUVNQbGdOWGRyMTBkeWhxcUg5K0xzZGw0RzBGZHgyZ09EbTk0?=
 =?utf-8?B?WTA1SGc1NkNsQ04vandFUncyRGFKV3BOY1FLTkFaTmZzYXc3RTM0TWhlVnBM?=
 =?utf-8?B?VzFoNWJuTExjK0pNM0ZGWmF2ck9vajhzaUxvd1dPUkhrZGJUMm5VcHUxS2xz?=
 =?utf-8?B?VWFzM0pOK0J2WDRLTXJzN0JVdGJ4MTUvdmhjMVVXNFZDWUdVeUNjOU9PdGFB?=
 =?utf-8?B?djYycS9vMHpqcEFiU1ExMzJ2OHZGMWVqZGh4R2RqdUswSHhFclJ0OU1vUWRB?=
 =?utf-8?B?MWNWRlVHNld1SWxaZjRJU1A5emRySHNncnpOcjVGdlZZbGgwMGhpZEJCSFli?=
 =?utf-8?B?TXJiVVNYbmFkTTRxSDg4M0JTV1BNbGRwY1VWK1c2Z1drVFhzcUpLa3VWV1Bq?=
 =?utf-8?B?MEUxc1JLTTJyem4vU1lZSkxSWXo2UUFWQWhGMU5WQ3NiOUYxSWtMUEpxbHF1?=
 =?utf-8?B?VHBHM2F5bnBMMVB1YTR3ckhkS3YzdjFaaUwrUWdidWdyT2kxcWpmNEhsQjgr?=
 =?utf-8?B?cnVuS3BoNkw4UnVoY1Yza0JDWDN2VGdvRkszNWgvdUxNZkNaN29XRU9ZYUM2?=
 =?utf-8?B?M25BMzIwM3Y3UklCczRXTlkyRUw1QmIvcVRzY0xKc0tsZUNKelVwek9vWGZ5?=
 =?utf-8?B?VGF3RE1ac0NQSlZORlozR3pFRGVGOHV5ZkxYa0UwSDc4Qmp6R2svdkVuNGpJ?=
 =?utf-8?B?a1EvSlg0ajFiZmZ1SGNPOFdLNG9hZmJjem1HZjBVZ0VGM250aElQNUF2MlQz?=
 =?utf-8?Q?wLCgZflU4LoeirX4rPRg5sUxF?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <F6BE9041424CE1419069D735CAEEB75E@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY5PR12MB6526.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 517b4ffa-c053-4e75-453b-08dcf9b8372b
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Oct 2024 14:27:57.4510 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: iOLVpRZsnXQO5W62/1ODGGUN3Un7G3MG7untSqZ7E9JArWcUskfB1DLn7OMf1eFl6Kxtxn2t6cMZ7gbeq0O7nQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB7615
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

T24gVGh1LCAyMDI0LTEwLTMxIGF0IDAxOjUyIC0wNzAwLCBaaGkgV2FuZyB3cm90ZToNCj4gQEAg
LTMzNiw1OSArMzM2LDYwIEBAIHN0YXRpYyBzdHJ1Y3QgbnZmd19nc3BfcnBjICoNCj4gwqByNTM1
X2dzcF9tc2dfcmVjdihzdHJ1Y3QgbnZrbV9nc3AgKmdzcCwgaW50IGZuLCB1MzIgZ3NwX3JwY19s
ZW4pDQo+IMKgew0KPiDCoAlzdHJ1Y3QgbnZrbV9zdWJkZXYgKnN1YmRldiA9ICZnc3AtPnN1YmRl
djsNCj4gLQlzdHJ1Y3QgbnZmd19nc3BfcnBjICptc2c7DQo+ICsJc3RydWN0IG52ZndfZ3NwX3Jw
YyAqcnBjOw0KPiDCoAlpbnQgdGltZSA9IDQwMDAwMDAsIGk7DQo+IMKgCXUzMiBzaXplOw0KPiDC
oA0KPiDCoHJldHJ5Og0KPiAtCW1zZyA9IHI1MzVfZ3NwX21zZ3Ffd2FpdChnc3AsIHNpemVvZigq
bXNnKSwgJnNpemUsICZ0aW1lKTsNCj4gLQlpZiAoSVNfRVJSX09SX05VTEwobXNnKSkNCj4gLQkJ
cmV0dXJuIG1zZzsNCj4gKwlycGMgPSByNTM1X2dzcF9tc2dxX3dhaXQoZ3NwLCBzaXplb2YoKnJw
YyksICZzaXplLCAmdGltZSk7DQo+ICsJaWYgKElTX0VSUl9PUl9OVUxMKHJwYykpDQo+ICsJCXJl
dHVybiBycGM7DQoNCkkga25vdyB0aGlzIGNoYW5nZSBpcyBzdXBwb3NlZCB0byBiZSBub24tZnVu
Y3Rpb25hbCwgYnV0IEkgZGlkIG5vdGljZSBhDQpwYXR0ZXJuIGhlcmUuDQoNClRoaXMgZnVuY3Rp
b246DQoNCglycGMgPSByNTM1X2dzcF9tc2dxX3dhaXQoZ3NwLCBzaXplb2YoKnJwYyksICZzaXpl
LCAmdGltZSk7DQoJaWYgKElTX0VSUl9PUl9OVUxMKHJwYykpDQoJCXJldHVybiBycGM7DQoNCkZ1
bmN0aW9uIHI1MzVfZ3NwX3JwY19wb2xsLCB3aGljaCBjYWxscyB0aGlzIGZ1bmN0aW9uOg0KDQoJ
cmVwdiA9IHI1MzVfZ3NwX21zZ19yZWN2KGdzcCwgZm4sIDApOw0KCW11dGV4X3VubG9jaygmZ3Nw
LT5jbWRxLm11dGV4KTsNCglpZiAoSVNfRVJSKHJlcHYpKQ0KCQlyZXR1cm4gUFRSX0VSUihyZXB2
KTsNCg0KU28gaWYgcnBjIGlzIE5VTEwsIHI1MzVfZ3NwX21zZ19yZWN2KCkgd2lsbCByZXR1cm4g
TlVMTCwgYnV0IHI1MzVfZ3NwX3JwY19wb2xsDQpleHBlY3RzIGFuIGVycm9yIGNvZGUgaW5zdGVh
ZC4gIFNpbmNlIGl0IHRlY2huaWNhbGx5IGRvZXNuJ3QgZ2V0IG9uZSwgaXQNCnJldHVybnMgMCAo
c3VjY2VzcykuDQoNClRvIGJlIGZhaXIsIGl0IGRvZXMgbm90IGFwcGVhciB0aGF0IHI1MzVfZ3Nw
X21zZ3Ffd2FpdCgpIGNhbiByZXR1cm4gTlVMTCwgYnV0DQp0aGF0IGlzIG9ic2N1cmVkIGJ5IHRo
ZSBjb2RlLg0KDQoNCg==
