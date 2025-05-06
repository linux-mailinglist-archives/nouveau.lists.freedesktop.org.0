Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D0A0AACC16
	for <lists+nouveau@lfdr.de>; Tue,  6 May 2025 19:18:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E8F7E10E029;
	Tue,  6 May 2025 17:18:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="fcASUDid";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2043.outbound.protection.outlook.com [40.107.92.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D08D10E029
 for <nouveau@lists.freedesktop.org>; Tue,  6 May 2025 17:18:18 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HNWcl3gMTPJEMwN5KP1l36GHWnWlqGNYItXQgWz9ogt0YRL8SSKPOEgRNRsTQSt6aTO3j/9G0tvepgx217r2k2i7Mv6oZrF9GDPBmtKxTbHpAq6jphA1qrOR88mY5h+OAkxKvCRvcnGdL18dSsTCG4txh+xxnLe4RofikAcIiE0hEfIdC001kLJgC30b9uM0w2kqkxGyH7463IEQdf8OF5xxsRB3XcR7j/0B6nxZU0ta16FiZiI3kR4kKWYI+CBbn9ljhOT70QbczBW49VFvHy2jzrAEEEg7RL3ddjMLpEzwxnz3cWFpS1HIqFJLeBdTlLzIXq3mmGaTpDP4R3TkVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rC1MlZSx0F0VCgGgc5u/Z17Z0rMsc6ege8zWbVnDPuM=;
 b=Ir0CjKk+lRHjZvRt8qspQgnTKO99cQuQFFMxBs2QGBj58Hk0HEzqWJoaTbGlpJOtVC41hd0RSmK9MTSuTVAsNf2Vyk0NCRfxe44VfTfb1MYbspySQRQK44oeNfL78SxCDkARWTrSdnKjzm93QYnrWGJORm08FaQtstqqMCcrDKGu82DWfYwqk3iFM7htoEn+z1XL0NMnLVTWpsd7G2WyvqCN28rkAnvgOAYq9TQkeQdZUko5Oh6p10y7a/FTRlhrXvayEw6PWwYKNk/Th8ulBCoU4WUeiTMAUEg3Uv78ABXOu4RvuIQqBh7eN342JAH1ULgWAuZ8EnVPow3/wijCzg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rC1MlZSx0F0VCgGgc5u/Z17Z0rMsc6ege8zWbVnDPuM=;
 b=fcASUDidZyh+aCVF9667W/s/0WXvy3/qKUAeF55w6J1E3yjHXxWaMgdl2MqcMD+o0W/nvRuztD7MW9NnDALdFNWSalbv2gWz9tFfCwTVwXhI02UuclLT+GQGRVjEuYKsmk1ICBfAbxgYzwo94bg6OSwAnczeY2+wmc1FwPDlqIMeXNnLkK2rMoqyhn2PtHlIyiaI5uTiN6hL8xBo/0bbkvcS8fl6njT3OWo5Ubxy4jRfqsIzOrABqGlpC7c2b7wH2xpXwcB9mXgNkV80diXGYG6+HokkpAlEw6MPqbCFTwZyaYS5QQdm300f0jQ4/Z0eyV9Ne+LKM/cpjEf26jBBGg==
Received: from CY5PR12MB6526.namprd12.prod.outlook.com (2603:10b6:930:31::20)
 by DM4PR12MB6375.namprd12.prod.outlook.com (2603:10b6:8:a2::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.23; Tue, 6 May
 2025 17:18:04 +0000
Received: from CY5PR12MB6526.namprd12.prod.outlook.com
 ([fe80::e420:4e37:166:9c56]) by CY5PR12MB6526.namprd12.prod.outlook.com
 ([fe80::e420:4e37:166:9c56%5]) with mapi id 15.20.8678.028; Tue, 6 May 2025
 17:18:04 +0000
From: Timur Tabi <ttabi@nvidia.com>
To: "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>, Ben
 Skeggs <bskeggs@nvidia.com>
Subject: Re: [PATCH 52/60] drm/nouveau: add support for GH100
Thread-Topic: [PATCH 52/60] drm/nouveau: add support for GH100
Thread-Index: AQHbuWA1/0hz3ys/+UKGRgVa+2r/tbPF4uWA
Date: Tue, 6 May 2025 17:18:04 +0000
Message-ID: <fc998d5fe1dcf4d7e3acbe4f5f232954201927a7.camel@nvidia.com>
References: <20250429233929.24363-1-bskeggs@nvidia.com>
 <20250429233929.24363-53-bskeggs@nvidia.com>
In-Reply-To: <20250429233929.24363-53-bskeggs@nvidia.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.52.3-0ubuntu1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY5PR12MB6526:EE_|DM4PR12MB6375:EE_
x-ms-office365-filtering-correlation-id: 8d1dffe4-295b-48f7-8984-08dd8cc1f60c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|366016|376014|1800799024|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?QlNmRWd4aE1ZODlzZ0M0VWdYb2k1ZFJ0V1Blei84WXZMdExvNi9lYm1qd3M5?=
 =?utf-8?B?N2RRQ3Fja28vZ3lsbU9qUWpZNFdsa3VMQ0xTdThkaU10aVhVcThCdGhOcW5R?=
 =?utf-8?B?MGlaakJ1S3J0dDVMTXVtb3RyNHN5aFcyZjlLa011eVdpMk9lRmYvUFkrWXBw?=
 =?utf-8?B?MmtaZkNWRC8wak1qbFA3NnZiajdNaldBUDVPZlo4VW5NM3ZzQWl1b0dXUXNh?=
 =?utf-8?B?clpqK1RjZHdWTjFWSE05YVFxdFZaemZkcmQ5NmZUY1VCN3ExanhkMGZxNGU3?=
 =?utf-8?B?QXRvemZXbXhJTnB3Wm1GdU5RVFE3WlVTT2VaZnM2SHlvOHk2WFArd2wzZ1lj?=
 =?utf-8?B?ZzV4bENVdis1SEQ3aDdDOVMwTjZYRHFBdWwzOTVoWEQvdzkvcFdnbXJOajI2?=
 =?utf-8?B?Njd1dHl5V2ZiQUYzSHlVMFdYcG1aVDZHQytnbnJUbDRqc1JrakJYdXlpRWxT?=
 =?utf-8?B?UW1xSUNaZk4ybEtSRkoySzdCcklhZjc3L1NCeU1qRmFZTWlYM3Q0T1BwSVpB?=
 =?utf-8?B?RHVJY3VkVHJsdUw2VW01ZDZtWnhUcmRDWC96VklDeVlWQzdDcTcxNHNibVFs?=
 =?utf-8?B?Q0xLRzhtejZSbTJNMzQzZ2Z3OHpGK3A1S1dNTGUrbE03RzJZcGI3Rmt4M1p5?=
 =?utf-8?B?dlZzVThMQVNyUkQzNHNnZTUvbjl2eUdqS2JyNjJ4MUN4TWtGNXdabVpLOFJG?=
 =?utf-8?B?UHY5Q3Q4RWFBSldJWnVxMEtsNVdrenNEUFFOSEZUWkdIcTNRdUM4TlVVR1dH?=
 =?utf-8?B?NDlTZVRuL2h1ZXJ1VTdrS21EanFtd2tEa3c5WWd4WnpGZ1lWUlBGN29QZzE4?=
 =?utf-8?B?TTdKcXNvaEc2WXRJckl6SnFJbkJpby9FU0t0VlhSaS9NQlZueEp6UCt4RGxi?=
 =?utf-8?B?cHVhd2xhMTJwdCthbnVHM3VlVXkrbjlJYUh2QU5Zd0w2VDZZRlhCUmdVSmVx?=
 =?utf-8?B?ckVsNUtBL1I1R0N1aEUwM0FrQjN2elh3RStLTXoyaWJBeGpKSGVaM0NUTjlD?=
 =?utf-8?B?ZzBVT2owemg4dDI2bXlEdS9penI1YjB4dFRMR0NUWndGU3hicVV1bVlUWFZa?=
 =?utf-8?B?MGJKV216VWRQUFk2NWNwU0pWbWd1K29HT2FjeUNCa3BTU3JQRHJxMVpoVHcy?=
 =?utf-8?B?Nlg1OWVmWSttNTFyZ2tkMUFqRlkyZ2JqckR5QVRGMGtXNFJLMmpFb2paUGFY?=
 =?utf-8?B?R0d2MTIwSnUrS0YrKzVGOTJrOGwrSVgyeXZYY3EyZ09jS0xieC9Xb2t3WG1z?=
 =?utf-8?B?Yk43a29jN1Z3YlRsUHRjVURBY0FhUjhLbkdkYUt0K0JmY1d2ZVhXTndiTWVw?=
 =?utf-8?B?RHM0MjIrdnNzOG56d205a3hueGpWV0RhbDZFVVYrQnAydFM3eVArYVpZcnFr?=
 =?utf-8?B?V2R5VmRqZjhQT0VHY1p4NmFOYmVSKzZ6elR1K3Via3VRY3gxUEVZbXdGajgw?=
 =?utf-8?B?QlFXOWRlUUR4V2hhNmNxVW9YdjVtbzJScjg0bW83MytYMnlWeWxoQ1Yramp2?=
 =?utf-8?B?OXVSZ0V2RlpsS3VEUERRNGoveHMxL1lnSmdQcFhMdFJQNjY1ZWF3a1VLSUtC?=
 =?utf-8?B?VExUa2l2dUZFdHEzVnV4N0hFZUpDVkp5d2JzSUc1UjcrQXNXOGY0MU51ZlJw?=
 =?utf-8?B?dG9VUUI4Zk1sYlROakpJdFFoeXVxMHRON0RnUEdYZkRaNFVDZmtVaUUrUzVs?=
 =?utf-8?B?QUtmRU9HSnl3MHlLSmExTForU1BlSzZkSmVGNmNxZnB1dXo2VitvNnFWSElt?=
 =?utf-8?B?M3dJVXB1Uy9DRkRyNVBYbDV1d01NQzVaSndmanY0UlIyQVRTSWhJN1pSQW9L?=
 =?utf-8?B?VjJXY2pNUU9nMndqVm14RnRqdHFmWDMwck5kTktsZnVmU0tTUS9HcC9SazBT?=
 =?utf-8?B?N1dTL0dCZUJrNEx5cnBiamxJVG9Qd3VpeGJwM2hab2FmK3ZpdnZUOWtLSWRC?=
 =?utf-8?B?R0xralR2TmVGMFl0T2l0MHJFYzUwSWxXMkF4RzhReTU5dmkzR1FhR29xc2pl?=
 =?utf-8?Q?+rhTkfoM3RHJakgD+5bvh/WLrFTY8k=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR12MB6526.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?T3JLQmR5Uk9GUHpJZXFsd1JlM1UvNFNCYUo2YjJ1RGJpaG1tVnFCZDc0clBn?=
 =?utf-8?B?SlczZVhFRk5Kc1BlSHZRQjJGSmxJb1FGNDhSaTVJYnhIdGdyODlmU0Rib01W?=
 =?utf-8?B?SE5PNmFJRG5PbDZKbE95WFRIYi81Rzh6V1VVeWJqWUQrbHJCNEp0WlA2cFlU?=
 =?utf-8?B?Z3RIcDB6WHlicVZJbEJaazMxK0lITDdaL0U3YW95eFNwM28zWVc2WktEdlVw?=
 =?utf-8?B?RDd4dHNnRjdZZlMwQlEwbmZnRzY0YS9pcUcxakw1ekl1SW5mcURLbXpITU4w?=
 =?utf-8?B?ZUZCV3F1ZGMwVm9sYzhMUVhOYUhBaXI5MHRDb09rVGh2aHdtdkdsSHRzRmd3?=
 =?utf-8?B?ZFJGWFVhc0hBTlNiT0N4dUxuQ091ZkMyWTZuMkxQSlQ0TzNiUUtKK0JucFFs?=
 =?utf-8?B?bWhLSk56dE41ODA5SlVJK0NHQUUxQWphcmVmZGZGVDZxOTRidCsxUUVRc1lz?=
 =?utf-8?B?V1paNWRobC92ekE5cGZlRkNmMWtUNmkzaFJhNXQ0QWdBYnp2M0YxRXBRTXpW?=
 =?utf-8?B?VjRQYXNJa1E2U0M4WWZtTnk4Y3M1SGhvNzBhbFpzcWJMK3ZRSFN0aEVtclow?=
 =?utf-8?B?RkVvUW8zU2ViYzlPb1djUHF4T3BVQ09tbHllc3lITTZiV3BldkZkUzJaaUln?=
 =?utf-8?B?Y3dxcVJWMEUzR1VwQVV4dGIzVDlWM0k5c0JsVC9Xc1lYeDkxd1gvazNpY2hO?=
 =?utf-8?B?bzVDc3d4cDQzZVQyemVBZXV1WFJpcmsvRW5ZNkIwT0xWMnd3TitpTlRWOXFT?=
 =?utf-8?B?eTYvMHZXNnB6YUxERnhEMnladFgvWkJmdVBST3hBckNyK2Nzd3grMzA3RUN2?=
 =?utf-8?B?RkwwRVNxZ2sxUU54amRFcGZzVjRycVhpSm16QWt0WEMvdEFkZTZIc2VITEw1?=
 =?utf-8?B?OXJFZ0J6ejByK21UK0VTYlJaYnJ0KzcrU2dteHhrL0x4T0VOOTBHbGYwSEpk?=
 =?utf-8?B?R08vRThOQXlRcVZGYWIrY0VPTVdBcG9HbzFNNmZwcDRMVmdkTmdMc3FubWUy?=
 =?utf-8?B?QTRVWFNVKy9YSytReG4zZnJaUGphdFd4ZnNJVFp4dnllRExDZDF5YjhpR0tG?=
 =?utf-8?B?QVBFdXZYOGFyaUkyVEYrUW9KVmNDMi9Ob1g0V2lFKzZaR2YvVVVoNFJ6NHB0?=
 =?utf-8?B?RWVCR3dML2liaHNtSG1rd1RYdnhRQnY1cm96UU12QjFWNTVsK25RaTFTNi9U?=
 =?utf-8?B?NHhhUFJKRmt4Y2pqQlFZSEVKQ1ZGVmptcldwNmtpRFNyWG5TVjVlWForK0NS?=
 =?utf-8?B?UExUWUZ3d2RUamRTbnhFWTgrdXZhS1hrU2ZkeVRiQ0d2Z1dtdHZPQVJ6alBK?=
 =?utf-8?B?Zit1cXNzOVVrbzNHNE15eHdNQk0wVnp4WjcyNVhPQTJuTVNVK05kK1RUT1Ux?=
 =?utf-8?B?YXk1Yng1d2g0ZFVRQ3JVU1hqVWVuRzlkczN2QW9xd1l1VnRNQkVvZmQwclZo?=
 =?utf-8?B?a1lJMHdxeXp0cnZqUUhuSEVMRFBIRTBUSjU5WElHaEJ1OFVuby9CYWJHZEti?=
 =?utf-8?B?L0hKMVFmOTIrNDNnVzRFdWg0U1p0UDNaczY1U29ieExjRUVGYTErVWJlOWZW?=
 =?utf-8?B?YkZSeklzM1c2T3JMK1RHWnM0dml0cG4vMmtjSVNGZGRsUjViYitLWUhLa1B3?=
 =?utf-8?B?N0IzbFhFeFZQeUk2eXdqd3VyY3R0R1U3ZXh2aldWMldXTm91YU0yZVVvOWda?=
 =?utf-8?B?L21ncUYwcVgxYnRIVmZsd00xNmJUNXJ6ZGM1YytWNlQ5S0xWK1lWbTdwbEZR?=
 =?utf-8?B?N3hZd1VIT0U1VER2RWdmMzV6K1BiNnFKSlI5dnFDVkQ0TzlsMXhWRVgxMm44?=
 =?utf-8?B?dENiMlRsVC9oSEpoM1Z4VXNTbkpPWlA1eUFUU3RXYmRJcU9aTVZUNmZJbjdr?=
 =?utf-8?B?ZFJ1WnJ0OEJzNE9wYkpvS0d3cWNaK1NqZXphOEVjVjFqNTlxU2E0amJ2Yytt?=
 =?utf-8?B?VmttalpxeFdGVUtPTXlJRmpYVktCV0haRnNXQ2EvN0VpdElwRko5bVViRjhQ?=
 =?utf-8?B?dDk0SEZCak9pbFdLdlg4T09NMmh2VzdqOGhDNUpnQi9hQU15Z0lrdHpzbTlP?=
 =?utf-8?B?cXJ2czEwRU5jRGlleE4yanRoaWpIcnIrd1R6aklPZGlUdGVMRlNiWDhTcjAx?=
 =?utf-8?Q?SLF771b8PiK3+8PKpVS5ielO2?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <7C40F3966413314E97373FF41C6C21CD@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY5PR12MB6526.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8d1dffe4-295b-48f7-8984-08dd8cc1f60c
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 May 2025 17:18:04.0835 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: gir+rHou0zbfUCwoHpaWNo3IwsqljG2RUMSNwvkoE9ySmj1WkdHs4LAJ/hYb8QIo1QljWs1VtjZpu5QzeRW1Yg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6375
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

T24gV2VkLCAyMDI1LTA0LTMwIGF0IDA5OjM5ICsxMDAwLCBCZW4gU2tlZ2dzIHdyb3RlOg0KPiBU
aGlzIGNvbW1pdCBlbmFibGVzIGJhc2ljIHN1cHBvcnQgZm9yIEhvcHBlciBHUFVzLCBhbmQgaXMg
aW50ZW5kZWQNCj4gcHJpbWFyaWx5IGFzIGEgYmFzZSBzdXBwb3J0aW5nIEJsYWNrd2VsbCBHUFVz
LCB3aGljaCByZXVzZSBtb3N0IG9mDQo+IHRoZSBjb2RlIGFkZGVkIGhlcmUuDQoNCi4uLg0KDQo+
IC0tLSAvZGV2L251bGwNCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL25vdXZlYXUvbnZrbS9zdWJk
ZXYvZmIvZ2gxMDAuYw0KPiBAQCAtMCwwICsxLDQ3IEBADQo+ICsvKg0KPiArICogQ29weXJpZ2h0
IChjKSAyMDI1LCBOVklESUEgQ09SUE9SQVRJT04uIEFsbCByaWdodHMgcmVzZXJ2ZWQuDQo+ICsg
Kg0KPiArICogUGVybWlzc2lvbiBpcyBoZXJlYnkgZ3JhbnRlZCwgZnJlZSBvZiBjaGFyZ2UsIHRv
IGFueSBwZXJzb24gb2J0YWluaW5nIGENCj4gKyAqIGNvcHkgb2YgdGhpcyBzb2Z0d2FyZSBhbmQg
YXNzb2NpYXRlZCBkb2N1bWVudGF0aW9uIGZpbGVzICh0aGUgIlNvZnR3YXJlIiksDQo+ICsgKiB0
byBkZWFsIGluIHRoZSBTb2Z0d2FyZSB3aXRob3V0IHJlc3RyaWN0aW9uLCBpbmNsdWRpbmcgd2l0
aG91dCBsaW1pdGF0aW9uDQo+ICsgKiB0aGUgcmlnaHRzIHRvIHVzZSwgY29weSwgbW9kaWZ5LCBt
ZXJnZSwgcHVibGlzaCwgZGlzdHJpYnV0ZSwgc3VibGljZW5zZSwNCj4gKyAqIGFuZC9vciBzZWxs
IGNvcGllcyBvZiB0aGUgU29mdHdhcmUsIGFuZCB0byBwZXJtaXQgcGVyc29ucyB0byB3aG9tIHRo
ZQ0KPiArICogU29mdHdhcmUgaXMgZnVybmlzaGVkIHRvIGRvIHNvLCBzdWJqZWN0IHRvIHRoZSBm
b2xsb3dpbmcgY29uZGl0aW9uczoNCj4gKyAqDQo+ICsgKiBUaGUgYWJvdmUgY29weXJpZ2h0IG5v
dGljZSBhbmQgdGhpcyBwZXJtaXNzaW9uIG5vdGljZSBzaGFsbCBiZSBpbmNsdWRlZCBpbg0KPiAr
ICogYWxsIGNvcGllcyBvciBzdWJzdGFudGlhbCBwb3J0aW9ucyBvZiB0aGUgU29mdHdhcmUuDQo+
ICsgKg0KPiArICogVEhFIFNPRlRXQVJFIElTIFBST1ZJREVEICJBUyBJUyIsIFdJVEhPVVQgV0FS
UkFOVFkgT0YgQU5ZIEtJTkQsIEVYUFJFU1MgT1INCj4gKyAqIElNUExJRUQsIElOQ0xVRElORyBC
VVQgTk9UIExJTUlURUQgVE8gVEhFIFdBUlJBTlRJRVMgT0YgTUVSQ0hBTlRBQklMSVRZLA0KPiAr
ICogRklUTkVTUyBGT1IgQSBQQVJUSUNVTEFSIFBVUlBPU0UgQU5EIE5PTklORlJJTkdFTUVOVC7C
oCBJTiBOTyBFVkVOVCBTSEFMTA0KPiArICogVEhFIEFVVEhPUlMgT1IgQ09QWVJJR0hUIEhPTERF
UlMgQkUgTElBQkxFIEZPUiBBTlkgQ0xBSU0sIERBTUFHRVMgT1IgT1RIRVINCj4gKyAqIExJQUJJ
TElUWSwgV0hFVEhFUiBJTiBBTiBBQ1RJT04gT0YgQ09OVFJBQ1QsIFRPUlQgT1IgT1RIRVJXSVNF
LCBBUklTSU5HDQo+ICsgKiBGUk9NLCBPVVQgT0YgT1IgSU4gQ09OTkVDVElPTiBXSVRIIFRIRSBT
T0ZUV0FSRSBPUiBUSEUgVVNFIE9SIE9USEVSDQo+ICsgKiBERUFMSU5HUyBJTiBUSEUgU09GVFdB
UkUuDQoNClNob3VsZG4ndCB0aGlzIGp1c3QgYmUgYW4gU1BEWCBjb21tZW50Pw0KDQo+ICsjaWZu
ZGVmIFNIRl9TVFJJTkdTDQo+ICsvKiBUaGVzZSBtaWdodCBub3QgYmUgZGVmaW5lZCBpbiBlbGYu
aCAqLw0KPiArI2RlZmluZSBTSEZfU1RSSU5HUwkJMHgyMA0KPiArI2RlZmluZSBTSEZfT1NfTk9O
Q09ORk9STUlORwkweDEwMA0KPiArI2RlZmluZSBTSEZfTUFTS09TCQkweDBGRjAwMDAwDQo+ICsj
ZW5kaWYNCg0KVGhpcyBpcyBubyBsb25nZXIgbmVjZXNzYXJ5Lg0KDQpodHRwczovL2dpdC5rZXJu
ZWwub3JnL3B1Yi9zY20vbGludXgva2VybmVsL2dpdC90b3J2YWxkcy9saW51eC5naXQvY29tbWl0
L2luY2x1ZGUvdWFwaS9saW51eC9lbGYuaD9pZD1iMGRiMWVkMTc2NDViNTM5OTNiYWUzZGQyYzRi
ZTcwMTM2MDAwODRmDQoNCj4gKy8qKg0KPiArICogZWxmX3ZhbGlkYXRlX3NlY3Rpb25zIC0gdmFs
aWRhdGUgZWFjaCBzZWN0aW9uIGluIHRoZSBGTUMgRUxGIGltYWdlDQo+ICsgKiBAZWxmOiBFTEYg
aWFtZ2UNCg0KQGVsZjogRUxGIGltYWdlDQpAbGVuZ3RoOiBzaXplIG9mIHRoZSBlbnRpcmUgRUxG
IGltYWdlDQoNCg0KPiArLyoqDQo+ICsgKiBlbGZfc2VjdGlvbiAtIHJldHVybiBhIHBvaW50ZXIg
dG8gdGhlIGRhdGEgZm9yIGEgZ2l2ZW4gc2VjdGlvbg0KPiArICogQGVsZjogRUxGIGltYWdlDQo+
ICsgKiBAbmFtZTogc2VjdGlvbiBuYW1lIHRvIHNlYXJjaCBmb3INCj4gKyAqIEBwc2l6ZTogcG9p
bnRlciB0byBzZWN0aW9uIGhlYWRlciBmb3IgZm91bmQgc2VjdGlvbg0KDQpSZXBsYWNlIHRoaXMg
bGFzdCBsaW5lIHdpdGg6DQoNCkBsZW46IHBvaW50ZXIgdG8gcmV0dXJuZWQgbGVuZ3RoIG9mIGZv
dW5kIHNlY3Rpb24NCg0K
