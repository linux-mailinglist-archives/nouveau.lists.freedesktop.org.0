Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 60197845D05
	for <lists+nouveau@lfdr.de>; Thu,  1 Feb 2024 17:20:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 66B0710F09A;
	Thu,  1 Feb 2024 16:20:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="YWqbz90g";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2067.outbound.protection.outlook.com [40.107.223.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2E6E410F09A
 for <nouveau@lists.freedesktop.org>; Thu,  1 Feb 2024 16:20:41 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=d5QY5FVrtAxDJ4qp24XuxOmX7Ut0YzI809mq6Ou8MmakJay9RumY+c8F7VNWyWjTa57+z7oE/SWvIOY5jL8FE0b5dOrmQsLtvRm0zddNc4roxf9wbG8U3M1CsXjkYQ8kEj0IVePs7Wd2qg5VbR84QaN6gE0snPd/AIh9KMBR/UfQJgRgL6i8Uus0+tcN598neXo/a9InU4jQ8eCY+f3geV63CieDmtdUlAEbfJ+Dx9JibzpaaJnCpx4056awJdtjCYgqhjHFeUtb5Z8L+ZIFrGhfAdIxmV33xzk4M55XOEojejqkzwBVNETMI6d/LyP5q3Eo4Dwx7vxDKm7zhgI0sg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ms7FKHcTkJHivqINK89P+RbUuQXY44whgtyd//Y8m18=;
 b=aDHIbTaH+iwZypCasIWIaQU18MpPA/sWPqKjDsVX24VsT1JPdaOR2q14JuOUWQLCbBeOc59TyO98+mCQfYnoD1SVojO0WkNV9w7Xb1S0N0jzBQOLfMdfPLz6gcA4cw/p4Vp0gONjyw6ySPx2wQXfMkPOTcbMg/6gddpxEPi+X+3brbyvQz/sv6BK4EHuxfWnePGk7YWRYd9cJkoIljn2HFh8z+5Qsx4lfLJuwGVoMSxMiFmWVAqHWcTCyGREzcQYS+pECAzvRD95azwZmfI7jHGm3oqS6FEuyHyzkTuaCQRdtc7n6EvoMQS8cJ86L0ve8pBmtHSyT7dVmt+bHthzVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ms7FKHcTkJHivqINK89P+RbUuQXY44whgtyd//Y8m18=;
 b=YWqbz90gPy1sKP9y9/VM1UWmAPRglLDYBUVrHtnIsDCVjrldPqzzoyai9Hy0F83XVaAs7Bbz6oO14Dodm0tFd8yvlnH0n9XFiVEIfvMQqNToAY0tM2rpMkfAQOEY8UY166MmqdjsKNaM44MkiZ8jP7aabGWrpQ3o2uwv+GnZYRNAh6WFyU+W7GoIWGdKttdSWR6V1hHp+VXhjstbGLDkLo+FwmO237uKQNLffswCCuwQgQYTvxK+wlr+Tb114JkgLjdT554npQyfIsCmU5dJluweLPbfhITwTU2wJDqqQBjmmmvzQy90qhnX7DeEfAap1wUx2FZeNeqB5HX/0lf6/g==
Received: from SN7PR12MB8769.namprd12.prod.outlook.com (2603:10b6:806:34b::12)
 by CH3PR12MB8457.namprd12.prod.outlook.com (2603:10b6:610:154::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7270.9; Thu, 1 Feb
 2024 16:20:36 +0000
Received: from SN7PR12MB8769.namprd12.prod.outlook.com
 ([fe80::9f0f:632e:815c:f953]) by SN7PR12MB8769.namprd12.prod.outlook.com
 ([fe80::9f0f:632e:815c:f953%7]) with mapi id 15.20.7228.029; Thu, 1 Feb 2024
 16:20:35 +0000
From: Timur Tabi <ttabi@nvidia.com>
To: "dakr@redhat.com" <dakr@redhat.com>
CC: "airlied@redhat.com" <airlied@redhat.com>, "nouveau@lists.freedesktop.org"
 <nouveau@lists.freedesktop.org>
Subject: Re: [PATCH] drm/nouveau: nouveau_sched_fini() should check for init
 failure
Thread-Topic: [PATCH] drm/nouveau: nouveau_sched_fini() should check for init
 failure
Thread-Index: AQHaVI3+W441+uFKck219sU+KV3DkLD1c4gAgAA4h4A=
Date: Thu, 1 Feb 2024 16:20:35 +0000
Message-ID: <036b1f1d704d02b2681a366f70ad93bf3143e8d0.camel@nvidia.com>
References: <20240131213917.1545604-1-ttabi@nvidia.com>
 <cf79b780-2add-438e-aac0-e29b08799314@redhat.com>
In-Reply-To: <cf79b780-2add-438e-aac0-e29b08799314@redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.44.4-0ubuntu2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SN7PR12MB8769:EE_|CH3PR12MB8457:EE_
x-ms-office365-filtering-correlation-id: 2d9a88e1-7510-4393-83c0-08dc2341b8ac
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 3R5W3tlZwm2jjgHzA+zQU9hjW4TwU2Z1cZEyYgKoWe24ipd/uF1/xLtsRWP7BJp/bCo4dmlMn6qdMDhMLNjhzcevof4aerjB6QOQ0oMHbhcMznjiuP5q/j48fdXaYZmXge+wg4gf32OLJCf3Au9pEI9q2ah1FQDL2madTNIL+qCDppRFivamO93ycQ7wECDNGFEDm7+Iv0q8acQs085L4j5QBT2HQ33aywAWvpYD4CvYfF+lfmb8Tztptc2PtgweCpy0ufZq2JdL+eJCcP9ekNVxGLO8GQ84bcIblM8815PX79QFtHA914XglT6kl4RUzcK+56WGl2Ou4LJhH5hs70YifzNv6ESycMU9NRlVhpUIhhMAldaI7mgL8SL8AQUKZryWS+GCG3LdAxVHIIlxTEuteIvv3AG9uWItRfpd4BLda2KE/WuS1LAOHwUDNwIsCXL6aWXuLQo6/KRxPaQ/gpvqxXQjQ3DStQLO9KuX/2v+XXo0HluzByqZO7m+uOyStpE1yWr1gluOrf/mIw//2f7iscYKx+U1HQkLdKX/vx2eu95kMP69KJFSD7hcnfglsDWdTNdCF7TH2HAvMI0PasnH0fJOPRNAOcIoOqe3OWkK2+TiXek4vgo/feARN6Ue
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR12MB8769.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(136003)(396003)(39860400002)(346002)(376002)(230922051799003)(186009)(64100799003)(451199024)(1800799012)(66476007)(86362001)(41300700001)(36756003)(38070700009)(122000001)(2616005)(26005)(6512007)(38100700002)(6506007)(6486002)(2906002)(478600001)(66556008)(6916009)(66946007)(76116006)(316002)(66446008)(54906003)(5660300002)(64756008)(71200400001)(4326008)(8936002)(8676002)(4744005);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?R2F3OXhEeXNZZlNXSWxYQUNMZXRpV3FKRHM3OThiZE9mU2Y0cC9qY0FiUTlh?=
 =?utf-8?B?emlUUlhZWS9lY09VSzV4cGRmcVZ4R1F1enZ4cW5KcWVzOGFFMWY4TGhmVDgr?=
 =?utf-8?B?MWNvS2tpMytGaEtqT2IrZzljZis0RzhUSzBuRk94UTJTaEZXaldTdXRDa2Jj?=
 =?utf-8?B?SjVjeXNYbjBYVFlXNGFPVENNa2kyaS94NVpSTnJPNE8wT3BnelBNMnFQREVL?=
 =?utf-8?B?Q2lTbFdIWUh0WW9PSFhCRnhuZnZlU1VWeGUxRm1MZm5ZZ0NqMUNFVVdGWVBD?=
 =?utf-8?B?ekh6NTBZT0R3V3RraUpSQXp1OGFUQTJPREhKSTYyYzc2Sm03NlRWWC84dmFm?=
 =?utf-8?B?dVFXeWRRQzNLVHN0MnBVcHhUV2lSZEFRZDRiMk9JTlpSZlhscUpKMlpjL2JZ?=
 =?utf-8?B?NXdOekJlLzVZM3pHMWFTMkdPZ1lLNDNNWXVnNSswd0o2UUxFalJveXpYWUpL?=
 =?utf-8?B?REdZMVhLbDN4VUIwVXoyblRpSWJnZmU0M01oUG5vaCs4dFYrdGF2UlphZ2cy?=
 =?utf-8?B?anN5YVdTcWJmTmRVdWFGM3VGbXFGdmF5eFBtQmI1VVFvNHF0cGlxMFp6Q3lk?=
 =?utf-8?B?dEI2UlczbzlOazJBREhjM2h2dktEeHVuSWZZbnZaN2l3R0c5elFZOW91SEpQ?=
 =?utf-8?B?a2N3NEhSNkJScCtod3Q1anA5azZyY2FqbTQ1VjFrdlJNWWR5V1pIZmVsWDRh?=
 =?utf-8?B?QVBhbk9xTjI5TjJZZGdoYkhsM3pOTTBORmMva09vRVRlQzBqYmxlQlJlejVi?=
 =?utf-8?B?bWhEM2d4YTAxVUkvYTZHMk9yWk9Tb1E4c0hKaHFwRW11QzFURjRQREhQNnZV?=
 =?utf-8?B?cE1VZnBjMzVVbnM3WFlDWm1KWVY3QUs0Zk5NaWVjRUI2b3RUVXkvb2VDek9Q?=
 =?utf-8?B?WldyQnVTK3dTRTJUMTJ0SVNscGF1L3l0dTZZOU5sbHNiUG1pL0E1TWN4MG5L?=
 =?utf-8?B?ZVJnQjJvT25TeVErd1hWTlYyS1ZWdGdFUEl0b0sxNDNYRTB4NEJOZlp2aVgy?=
 =?utf-8?B?NHl6T3BJbEM2Vkk0cHBKREhtOHZwYTZCNC9IaEoyRFdLOFM2aEJPenl1dW5t?=
 =?utf-8?B?SjhWczdWVVBpL29pNEplQkJISlhLbTAvdkZuQ0VEa3BYOHlVbk90RVRkQ29X?=
 =?utf-8?B?WXNTVnlOMG8yZkJJN3FIRkJ3a3czeWNsbkc3ZVJnSU1PbU9XZ2Y1bXBsODZE?=
 =?utf-8?B?Ny9BTjdOQ1EzbTJzaFN1NTZ0UVRTS3NKNHU3Y3FZaGJybHFVWlpBVUZVL3ZB?=
 =?utf-8?B?Rm8yY29HUWV6Y3dycVRTNkhiTjhVSHlTUi9nL1FaSzFZRDdLVk9hcGI3SENu?=
 =?utf-8?B?Kysvb3d5ZFd2MFI0ZEhhUU1hd0kxR1JkdXNHMWtEWkxjczlLQ0dhVDJQU3M2?=
 =?utf-8?B?M1RROFBsejJHMUZ6SVNwNE8vYzQ3b0RTMkVWajg5NVRVamd5b1VYaSt1NjdB?=
 =?utf-8?B?VWhTcHo3T0tnVm5CNmZGY2NlSXdCSTFkcGdQR3BlRzJFRUR2RFlpRlNQV0Zs?=
 =?utf-8?B?T2dvNWZHQVlIajhWYTJiVHJUdGgzQ0VEdTA1SFpuRTM0c1B2N2FPYmJDN3FR?=
 =?utf-8?B?cGVVZC9YQ1hhMnBNUDRGS0lET2kvcXJCanZJenJmQnhwU3RpMHQ4a1RPanhY?=
 =?utf-8?B?TG0wTmhhUU8xRXAzbkF0YWEvMzZKMjJyN1dPSS9YNnoyRy9qQ29MWUl6dmRD?=
 =?utf-8?B?aUhsQUtaS0k3L0hXcXRSQkpBbU5pUmJwRzNpbG9OdjNIQXFCVEpQWExTSURi?=
 =?utf-8?B?S3VYTFRUT01QZzVXdlZZSkhrWmljNjdtK0QvMzJhNGkvODVWRnU2WkNUckM5?=
 =?utf-8?B?L1hKd2srNWNnU0lPRjVRMGJuRGo0Z2Y1RDMxMGhkcGhwa0ZLc0pWdkJOcUo4?=
 =?utf-8?B?VGdWS1ZUZHpKajR4WkNsTVUwbzE4dlJoR01kQWUzT3MwRUJjR1pzYk93VXA2?=
 =?utf-8?B?azJXcXorUVZLRzd4M0E3UU10S0RtNFI5bzdydGV6YzRMTEsrWHRwdVR5SmVw?=
 =?utf-8?B?SGF0Vk9EckI1N3VJc1ByMFd1cW8rT1NORjFKSXE1YUZPSU12LytYaUNQTlNh?=
 =?utf-8?B?c090bWcxdHk5T3JKdGZUaVVsNno1eFBVdGxVbUlnc2FYMGVIaGIvZmhKaTZJ?=
 =?utf-8?Q?opUGDFMKVOsi1O7vBIrz5HlU3?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <08638A561B88F241921BB4BC5D5E72D9@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN7PR12MB8769.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2d9a88e1-7510-4393-83c0-08dc2341b8ac
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Feb 2024 16:20:35.7700 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Cx/nRmcHXPWlHkBjvfvBoc75IafKFZf71a4Mom1N927k8ipuML3jxC9Br7l6TEGJg7j+pLtkBciCg+1W1QA/0Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8457
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

T24gVGh1LCAyMDI0LTAyLTAxIGF0IDEzOjU4ICswMTAwLCBEYW5pbG8gS3J1bW1yaWNoIHdyb3Rl
Og0KPiBJIHdvbmRlciBpZiB3ZSBzaG91bGQgYWxsb2NhdGUgc3RydWN0IG5vdXZlYXVfc2NoZWQg
ZHluYW1pY2FsbHkgaW5zdGVhZCBhbmQNCj4ganVzdA0KPiBjaGVjayBmb3IgTlVMTCBpbiB0aGUg
Y29ycmVzcG9uZGluZyAqX2ZpbmkoKSBmdW5jdGlvbnMuDQo+IA0KPiBBY3R1YWxseSwgaW4gbm91
dmVhdV9hYmkxNl9pb2N0bF9jaGFubmVsX2FsbG9jKCkgd2UgY2FuIG9taXQgY3JlYXRpbmcgYQ0K
PiBzY2hlZHVsZXINCj4gaW5zdGFuY2UgZW50aXJlbHkgaWYgIW5vdXZlYXVfY2xpX3V2bW0oKS4N
Cg0KSSBhbSBhbGwgZm9yIGEgYmV0dGVyIHNvbHV0aW9uIGlmIHlvdSBjYW4gdGhpbmsgb2Ygb25l
LiAgSSBkb24ndCByZWFsbHkgbGlrZQ0KdGhlIGlkZWEgb2YgImJvb2wgaW5pdGlhbGl6ZWQiLCBi
dXQgSSBjb3VsZG4ndCB0aGluayBvZiBhIG1vcmUgcmVsaWFibGUgdGVzdC4NCg0KDQo=
