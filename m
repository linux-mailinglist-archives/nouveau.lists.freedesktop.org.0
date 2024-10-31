Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A5289B7FB2
	for <lists+nouveau@lfdr.de>; Thu, 31 Oct 2024 17:12:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6BC5010E097;
	Thu, 31 Oct 2024 16:12:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="ja+yoKiF";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2054.outbound.protection.outlook.com [40.107.237.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 928C110E097
 for <nouveau@lists.freedesktop.org>; Thu, 31 Oct 2024 16:12:05 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SM86JZ+Lwvl7Texw+wv0AczXaSMNZsWj9vqt1ko0kIBNYnaF0RSsgTOdjoyWtvpaaN9ZRtVY0Q2Gx7hd5afEtSXHgCY87pMg6oTe+IVwGnD1TmIUaOraQSCZ6Uc36UmQejCF9rFqaGSAIUsra1Hm/zQZ2tzdoNTf9HRsNu8Xui92hMohfC4ibgy40lDKU6L0B6gsepqU79dNMbtmKc2KHSV8UyFYwWMTBTpYbH8dcjCwNzPRO4cVZzYHSn4gI4tS2ZcOTRUGSsrfUewVX0GO58iz0o7VbjV/rF+586O/EYqtrlSm5RacwMnFHOg8+JrniMmDVJh7+Dxd6TdAZ0XsJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RB5X9qi53i1t4CWxN2tO5BMX9LT59qc0ovzEIUyEKaw=;
 b=egpCotB6AD4x3s4OriYouTxxSnc760tMbpUJr9uKuroSRotr0KOyMx3DZuDoV9aw+9uwhR1xGAN3EAJ8oKbtgUrTbyRCGSvmlRC/pVzXPxyiTR+nfZIicJ5360BZ5ctNMdgsiHMpeS4yBFdgtER2nb3zdT/85JvZSGAw3v6yMuerMV03cMCD90cfUSWyCHSZazNgJ2YuvLsqIrMVgiWEuxLwpykCYzRjtQK2UGG9NdCM6T8joUk1ijP/5QEsuzQl35NIc3Pa1LvU/Hf7BLHtnG+O9XMeuF0BhrhCwGgDsVTw6xbbSxmGVoGFeOcWOA2vIqsArwmpOnWj6ycgtGVKQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RB5X9qi53i1t4CWxN2tO5BMX9LT59qc0ovzEIUyEKaw=;
 b=ja+yoKiFWDY2wLwgUMmq5u/erLVjmV3uvWl05hw/fOdxM0u39RDVyn4MJMv/YhHQBzIsb/R8meekPTMPvJbg6l/cVVC3F/VSU2QfVwHCau1DS9p88VRVUk3WRiz4zURxiWvVtcOxPwWwG7NlrqakWLcgDVZ974TmgXHjarMGbYkFKlLcHATVesrCmwl/beLHqv9nVJelSfhffs0U0ccqUeqp7AqodYA8o+vv8/mrXHK1iB9QRTkp1QvGW07DC4mThUGfKMVXpEwQbnxFmB5jTlUuhfMbAVY/049MHm/BIuU65zEoKRbCa5L4gXC0KJiDNu/tMbuK5D0bFR09CBVbmw==
Received: from CY5PR12MB6526.namprd12.prod.outlook.com (2603:10b6:930:31::20)
 by BL3PR12MB6452.namprd12.prod.outlook.com (2603:10b6:208:3bb::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.28; Thu, 31 Oct
 2024 16:11:57 +0000
Received: from CY5PR12MB6526.namprd12.prod.outlook.com
 ([fe80::e420:4e37:166:9c56]) by CY5PR12MB6526.namprd12.prod.outlook.com
 ([fe80::e420:4e37:166:9c56%3]) with mapi id 15.20.8093.027; Thu, 31 Oct 2024
 16:11:55 +0000
From: Timur Tabi <ttabi@nvidia.com>
To: "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>, Zhi Wang
 <zhiw@nvidia.com>
CC: Surath Mitra <smitra@nvidia.com>, Andy Currid <ACurrid@nvidia.com>, "Tarun
 Gupta (SW-GPU)" <targupta@nvidia.com>, Ben Skeggs <bskeggs@nvidia.com>,
 "zhiwang@kernel.org" <zhiwang@kernel.org>, "airlied@gmail.com"
 <airlied@gmail.com>, "dakr@kernel.org" <dakr@kernel.org>, Ankit Agrawal
 <ankita@nvidia.com>, Aniket Agashe <aniketa@nvidia.com>, Kirti Wankhede
 <kwankhede@nvidia.com>, "daniel@ffwll.ch" <daniel@ffwll.ch>, Neo Jia
 <cjia@nvidia.com>
Subject: Re: [PATCH v3 10/15] nvkm: refine the variable names in
 r535_gsp_msg_recv()
Thread-Topic: [PATCH v3 10/15] nvkm: refine the variable names in
 r535_gsp_msg_recv()
Thread-Index: AQHbK3JnKf7W7e8ld0qMIAyQpr5kmLKg60IAgAAW0ICAAAY9AA==
Date: Thu, 31 Oct 2024 16:11:55 +0000
Message-ID: <cd6253517fac8a1eb8065c8c58d88a588f43e27d.camel@nvidia.com>
References: <20241031085250.2941482-1-zhiw@nvidia.com>
 <20241031085250.2941482-11-zhiw@nvidia.com>
 <c49355ab2b273d074e060671558f6a2bb6009c20.camel@nvidia.com>
 <dae97b53-7ecc-484c-ad34-a5a649145862@nvidia.com>
In-Reply-To: <dae97b53-7ecc-484c-ad34-a5a649145862@nvidia.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.44.4-0ubuntu2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY5PR12MB6526:EE_|BL3PR12MB6452:EE_
x-ms-office365-filtering-correlation-id: 3a84367c-1b55-419f-0a5c-08dcf9c6bd57
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?bzZWTC9Pc0RMQm9YaE1VOUJCeUVuSDU0NlQvQXdGaFY0aWJLS01zV1FLLytZ?=
 =?utf-8?B?V2hIZnRxOVQ0TWFjRm1xdXJWLzZrRWgxSkdOM044UkQ1cWJZY2lxNng5cmIz?=
 =?utf-8?B?RGV3WDU3K0dIOCtIVytzQStoVVlvSmg4Nkdvc1JqSTN4QkU2bXFxL3N6WldO?=
 =?utf-8?B?QkY5RS81d1B4L3ZvY1BQblQ4dUdBNHpUYlVrWkh4TXhQYlJBNDM4djJBWGM0?=
 =?utf-8?B?YTVSQ2dMejhWc2lRSmJnTVFGUlhodmg3Z2RIU3Q4bDdDdkh2Z2VYaHZNVk0y?=
 =?utf-8?B?dHJyN3o4SlhabnRUTGozSnpYT3Ruc0tNcmVGbjgwOUxHYXlFdmFKY04xYWQx?=
 =?utf-8?B?ajZKcmdWY2p6R08rNnpmNHVjeDJuQTRBVEs3aHlXbExFdmk2a0NZU1h3Q3ZF?=
 =?utf-8?B?dXFvUHdOZnBrNmpmSW5uUU1pQXN2SEJkUkE4dGFzVElMYUd2QjcxTXhNVDhR?=
 =?utf-8?B?TU1UejVINkpVTXBqTTRlK1gwVStKQWQ0OFd2TW50YURSem5ZVEN6V3EvZy9j?=
 =?utf-8?B?K0hCSm5DeTZZWDhRVU94azEwa1lWNzNKVDJsU3NBUmNWZDU5QmFZZkgwMXBs?=
 =?utf-8?B?ZXlZSjRQUWVRNzAxS1dYVUFGMVpKZkFJWGNObk9jZ1dCZ3BNYzBoODNGdVNN?=
 =?utf-8?B?RDRrT1ZrWk1haUI3V3ViR0E3eXVSekd1SFRvTnZqTXF4dFJnMnJTcm91cVFU?=
 =?utf-8?B?aHNxbERPKzRMYU50clllUXpmTUFBZHNuVE53VHE4ZmhrU0ZkY1lHSFEyK2tQ?=
 =?utf-8?B?ZERaTHFFODlhaEUrVjRvNVhmUXZwSVFBUWFmOTZGeU1TZ0g4WFpUK1RWNEdy?=
 =?utf-8?B?b2w1OEVQSmJpTGJLZFp1ZE54K0xJaGc5M1NjUmVCRTBWL2FoK2ZqdTlnYTBH?=
 =?utf-8?B?emQwdFdaZjNDeG5nV3JhUXlvdFB2R2c2SVlHYkMwZEZ5UVJCTGpxaEdzUWZB?=
 =?utf-8?B?UnFMMXJpcVRYbmZsR0NUWjR4NHRBN3k5Kzl2aGVZTHFBOHZrM2V3OEl5cmUr?=
 =?utf-8?B?ZW9ZK3ArOFVyVE12VU8xMmRiTlRPcFNKbXR3ZVpQNlZOOE5jSHhrYjZ6cmtq?=
 =?utf-8?B?UllrWGphTWpVeFZnazhIbml2SkRRQ2lMTHVrYTk1WWlUREx0RU1lb0w3TDBL?=
 =?utf-8?B?MGRaY0o2ZlNqYnJ4a1dsQTBlN2V5VGdBTndvU1BRb1plWHJwOXZyemQ1dVN6?=
 =?utf-8?B?Zm04OENxZldmQ2pqalVoTkxoZTFGYnY1L3dCSW96MngvTlQ3MkpEV3M1UVVE?=
 =?utf-8?B?a2VIOVFpb3ltYUNtb0JSc3hEQUJxNm1JYnViZkpYVWhzaUhRWEZSYTMyNXFh?=
 =?utf-8?B?TWhRc0VudlZjdkRpOEszam4yOGtoM3hMTE9rLzZYUHRVS3NpQVpWcTVCTFZX?=
 =?utf-8?B?dHhaQzB2L1pYbG5mcUZ3dFhYeXJ6a0ZuVmFEeEVkazdMTURTcXdSbm5GeDI3?=
 =?utf-8?B?dXZMeHhJc2N5MGVuNkp4UG5QUVgrbTJaZkVUdHNUc1UxL0lPYVpGdDBJVjNT?=
 =?utf-8?B?czM5UUMwaFJ2cCtXU3FUMVdHVTcxZlpXVzhUeERGR1pFWjNOQWw1SlI2c0RS?=
 =?utf-8?B?YmdNdFlkWWZnSFY4VWptTHVSc2hrSFpuSkpYQ1VscnBzRk5BODNPalFCdGh1?=
 =?utf-8?B?RUoralJObFZ4eVNLKzlnQXdhV0FMa1Y1eElaVGszU1pmbEs5VGhZZ3lRVC9n?=
 =?utf-8?B?eE01Tnljdlh4dm14LzQxNXV2MHdHZVMwTlczZlE3c1hrS0hrQjVyNEZTU1pY?=
 =?utf-8?B?V04va3R2TDBndGdlaVJuOVlleW45aXhreFN6ZGE3SUJyZjA0R2hKcVdwM09k?=
 =?utf-8?Q?o8biDqFcdanyeWrKsanGbIR3z5ZyCoERcUGww=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR12MB6526.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Z1YrNE1XVndaVGprNW5vMVZ0SlRMaE1nalgrdUhwNldBYTdVWlZKekdIb0Nj?=
 =?utf-8?B?VmxjWkFLaStCYi9PaUdaUHpidjhzQ1BWbGNqbU0rMUgrYkVuQ1ZoWDcvYi84?=
 =?utf-8?B?aklnbXM2bk9KQ0p2R25ROExVMmhhZGRubXRxNUxOelh4RzVaaEFpcEt3WGRZ?=
 =?utf-8?B?ZTQ0RW1IUTdqT1NlK2IvOWhtbEpJYjZqZjRFYjNWWVFSQ1A1OE0xQmZaVGpu?=
 =?utf-8?B?bmpoWVhUL2ZDcTJMY2ppdjBkUmQxamVFb0h1czgwd2dGTm1LcHBaZ0x1Q21P?=
 =?utf-8?B?c1BqdlMzd2RSL2tkQlpFc0tXTG50ZVJFVHlrMSs3cmFscVJTL0oya0daNUtX?=
 =?utf-8?B?c1hMbTMwMzM3dXorZnViMTFZMzJVbkd6RnVFTVMxZ3pEcVgxSmtnQXk1NFpw?=
 =?utf-8?B?K1ljd2YyZlhFMFhwUDczTEg2ODdabW1qcTNsNldzOVVPV2MxUEZDUnYyTXFz?=
 =?utf-8?B?RU5qQlQwODJkVWRvU2NyeHB4Z1FOT3BpOFM1bVBmd2V5N2dxOXB2QTNuR0Vh?=
 =?utf-8?B?WFNibTNiaDI4NmsySHo5THMxbE9KQ1RtSzhFdE9Rb3pxYm5RY0pBbFhBYmhY?=
 =?utf-8?B?TEllc2Z6REhWRW1tSzRvdHRsTUZjQ1FFd1FnU256RVEySE50ZkNHMnE3bm9P?=
 =?utf-8?B?QmhIYnBxL0JGaC9ZQTN1QlpyWXdIamFaZmdKdG1peGJ0UW9NREFFSUNVWVhr?=
 =?utf-8?B?RjdJcWFzYnpPYjNPZS9tVThBb1licEo5cVY2TCtuZ0ZjS21tSTByWGZSQTQ0?=
 =?utf-8?B?UTU3Z3JxRVRCaXpDQlVwTE16KzZJcUdyRnZna2lzMHNlNUpXNUh2OE9wS1Ev?=
 =?utf-8?B?b0cxL1VDeW1kVzFOS09DbjBCbnRlK3BYRGtoUmkrZXhIL0w4b09IRmUwVzZa?=
 =?utf-8?B?UDJKTEZkYnpHWUVFZG9YYWNWYmwrdGxLOG1NbEtGSWx5WEZYMkw5azB0QXVR?=
 =?utf-8?B?SmQvc3JTc3IwTXFFZ01yK2pIYXlMNFI3T2hIQkNxb04vRlY2MTRBVnRXVUdu?=
 =?utf-8?B?NDh0Z3Z0RjNsUlNJSklWd2NQeWw4V1RWUWNoNVg4ZktVUVg0ampPVjBORVFm?=
 =?utf-8?B?QmszRmpVVlh2dHYxQkg4d05UbTVHa0NSZmdXeDN6WFJWOE5hbVNoK3IydzJr?=
 =?utf-8?B?TW12MEx1NlJiNmdCVUQ0OXpJblljSC9CQk82RDJvVXFpQTJLZGNvckhwM3ZS?=
 =?utf-8?B?anFhdnlGOWR4VnA5TDd5RCtFRVRGb1RuY2NYaytNdGpDODdIelg2ZlJRWDkz?=
 =?utf-8?B?NC91cCtsd0ZGMW8rZWJBVUlWOGdIZFlEOFBGd3FOanpLUjJzL0RUNEVvNkZR?=
 =?utf-8?B?cURQa0w2YVVnZjRXZ0lIM01helFRY3hVQk0ybjdSeUIwVmlUUU5zbUFoNVFU?=
 =?utf-8?B?UE5CNGFXWm15NzNXSW9kTEVPcWNyZmZVbmcwQjR2QTZ1OHRsZUd4Y2pFa3pR?=
 =?utf-8?B?dUNNV1RBbTExY2pUSkRHdnA3cm5hSDdlMXhOUTF1VkZhOFJ6c3JqTmc0N3Q3?=
 =?utf-8?B?TG55ZXk4Q2JrazlWcG5rMGxvTWp5K2d2RkxBSzZEQTNMLzh6UWxYNmVwREJM?=
 =?utf-8?B?Wi9NcG9KSnRjZStlVjVUUGxzcHdwajhscUF2Z2kzZjUzZVVDdk95V2pQdC9U?=
 =?utf-8?B?RkdwZFk0RnhrelZDYk9UalFuTnZkU0srN1NoQnpKMVNhRVBDUCs5UHpWS0V4?=
 =?utf-8?B?VjRHZnZ4R1FuYlR4YnhMaHU4V3RKd3NxcXg5dFZGWklDeDJJZjBIMjRaTFJv?=
 =?utf-8?B?VWZGelFEV1UvN0NVSWVIdStKak51SHQrRWtZN1BKZzh1cWdvRkJSVkR0MXRz?=
 =?utf-8?B?L1B6bFdJZC81MjFSL2NQVkQ3VExVd0FueVBrMWJLZXVZWU5tSjVEekV0WDVP?=
 =?utf-8?B?VmtZbDUyWDdRK1JxZXBQcTFCa0EzVVFvRFBRTmVycDMxRFFnVWpEZ2dkSGcz?=
 =?utf-8?B?SGZGdGRiUWd4bVBvZjkycnMxY0JKa09Wc3FVK2NwSEJzemJpYjJvcDZSbENS?=
 =?utf-8?B?L3NXOGVBcHMxaCtKbm9XOWZkUXQ3SWVjcmFJZzdBek81bVFsdWJLN3ltVTIx?=
 =?utf-8?B?a0JOMDI1NVZCTk1icUNUaE15NWJRRlA4ZHdWYk9pQzRZTHRSRVlMQm1NME40?=
 =?utf-8?Q?B/7HR3D7cg00ceA8lYyWSqWCK?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <427BB4AB0B1779439F992CC35F291419@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY5PR12MB6526.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3a84367c-1b55-419f-0a5c-08dcf9c6bd57
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Oct 2024 16:11:55.4853 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: DY6Qk4ZQ2YfAs0/reCm22j+EyAjGhK/WszG2TfqrM4WVLegsKD0g0mTtLop+mQWhrtOYO1PPEwv05nkMWkQnkw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR12MB6452
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

T24gVGh1LCAyMDI0LTEwLTMxIGF0IDE1OjQ5ICswMDAwLCBaaGkgV2FuZyB3cm90ZToNCj4gTmlj
ZSBjYXRjaCENCj4gDQo+IEl0IHNob3VsZCBiZSBmaXhlZCBpbiB0aGUgcmUtZmFjdG9yIGluIFBB
VENIIDEyLCB3aGVyZSANCj4gcjUzNV9nc3BfbXNncV93YWl0KCkgYWx3YXlzIHJldHVybnMgYW4g
aW50IChlcnJvciBjb2RlKS4NCg0KSSBzdXNwZWN0IHRoYXQgdGhlcmUgYXJlIGEgbG90IG9mIG90
aGVyIHBsYWNlcyBpbiB0aGUga2VybmVsLCBhbmQgbm90IGp1c3QNCk5vdXZlYXUsIHdoZXJlwqBJ
U19FUlJfT1JfTlVMTCgpIGlzIHVzZWQgaW5jb3JyZWN0bHkuDQoNCkp1c3QgbG9va2luZyB0aGUg
a2VybmVsIGNhc3VhbGx5LCBpdCBzZWVtcyB0byBtZSB0aGF0IG1hbnkgdXNhZ2VzIG9mDQpJU19F
UlJfT1JfTlVMTCgpIGFyZSBzbG9wcHkgYW5kIHNob3VsZCBiZSBjaGFuZ2VkIHRvIGF2b2lkIHRo
YXQgZnVuY3Rpb24uIA0KUmV0dXJuaW5nIE5VTEwgc2hvdWxkIG1lYW4gc29tZXRoaW5nIGRpZmZl
cmVudCBmcm9tIHJldHVybmluZyAtRVJST1IuDQo=
