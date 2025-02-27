Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C427DA47180
	for <lists+nouveau@lfdr.de>; Thu, 27 Feb 2025 02:46:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC9A810EA03;
	Thu, 27 Feb 2025 01:46:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="bXnq7QIS";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2085.outbound.protection.outlook.com [40.107.236.85])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E08110EA03
 for <nouveau@lists.freedesktop.org>; Thu, 27 Feb 2025 01:46:27 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uAWaB9v70jMthFgux+W0OvafaOglW79GI02xfA6a1bL6BaqS0iew9qrgzgnmSVG3lAhP4STnTJVoWk7EgTxLYwsAF5l42TN4zDRE3cjYN3Yz1eoOHAMCk9hFbiZUeL08kjDfWNvEB72FLTnncjDmparorwlPFjfqEfnvNtVQ6vy9VE+ed7TAbrgPGlreJ8cEuKmiH80K0ZPC+odz+/aeI8v7H4ZOzv0REujoJ1vnAOpr3l/AuWzudKDGmw3V0sysMYTrSYRfaziE+WGY8bgDO2+gnoEPf7psJE1/vB2LvfvBjhUvq3zod5ftRC7pUOuObBv7GJmKvfai94FJpMysuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SmePRdSWXsGAcVmDVYH1PPNfqH6DMyhLjOqpH2k9bp8=;
 b=tUwNbkFMt0C2GJuwh1+bZGPMnD02E9hCdzitxVQDMuvlhhv+GiZFGc9N4DJn698h5eq+Hj/F51Whjjy+/56pf/4MqsR4ia/NEMPCXGKdOnx6gPYKBA8Mi1B4cw/qKWzm3b7EO8eZnBvtVKEd5Kowe1v72fZYYyoLDTkxsQyM4Z9VhOabEKOKOOf/YUoyJSfvsiheoq3duB9vQPWSjKkUk2nodynizkqbeQpBzauJ3KDKIiYXuA2snjBYsUg4cDoj1BzJcDfMD0WWkuvwp/qOz67J8Z/OFm4PWDd4HQuQWVoLfOPmgtrPwYYuxUSGz4nGXuWFhS9Hh83ojY7YFxC2yA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SmePRdSWXsGAcVmDVYH1PPNfqH6DMyhLjOqpH2k9bp8=;
 b=bXnq7QIS6E5rJdoNqDwQFDo5vfhHWWvY5JxRd5oKePGtZoR9FfL5ncxZAJ/793presInp3c+HEdqFSJ0nt+v0PZ506IpYOWkY/OsNHMmDbI3MQcm/XDCVxhD2dL59ztCqPktEnBUFDX6ZKkaXgA5hyjFBmxMgoYccFH3qsftaFpDqcfGwCPWTWj81DNz0mal/DqC8yQuPYBtJ3AjELLn+p7mkcbApremwYXH/rHESghzSRCFhrFlx3tJvEJXyUWnxq9dc89RUsTSq9/Jd1PHv0uEwxX40+iKG/ae42NSE5v95SAlrhsQ8HmMc6tyYJimQYvn9cS3sNfIqnnAhoas4w==
Received: from CY5PR12MB6526.namprd12.prod.outlook.com (2603:10b6:930:31::20)
 by BL3PR12MB6620.namprd12.prod.outlook.com (2603:10b6:208:38f::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8489.18; Thu, 27 Feb
 2025 01:46:24 +0000
Received: from CY5PR12MB6526.namprd12.prod.outlook.com
 ([fe80::e420:4e37:166:9c56]) by CY5PR12MB6526.namprd12.prod.outlook.com
 ([fe80::e420:4e37:166:9c56%4]) with mapi id 15.20.8466.016; Thu, 27 Feb 2025
 01:46:23 +0000
From: Timur Tabi <ttabi@nvidia.com>
To: "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>, Zhi Wang
 <zhiw@nvidia.com>
CC: Alexandre Courbot <acourbot@nvidia.com>, "zhiwang@kernel.org"
 <zhiwang@kernel.org>, Surath Mitra <smitra@nvidia.com>, Andy Currid
 <acurrid@nvidia.com>, "lyude@redhat.com" <lyude@redhat.com>, Kirti Wankhede
 <kwankhede@nvidia.com>, "airlied@gmail.com" <airlied@gmail.com>, "Tarun Gupta
 (SW-GPU)" <targupta@nvidia.com>, "dakr@kernel.org" <dakr@kernel.org>, Ankit
 Agrawal <ankita@nvidia.com>, Aniket Agashe <aniketa@nvidia.com>,
 "daniel@ffwll.ch" <daniel@ffwll.ch>, Ben Skeggs <bskeggs@nvidia.com>, Neo Jia
 <cjia@nvidia.com>
Subject: Re: [PATCH v3 1/2] drm/nouveau/nvkm: factor out current GSP RPC
 command policies
Thread-Topic: [PATCH v3 1/2] drm/nouveau/nvkm: factor out current GSP RPC
 command policies
Thread-Index: AQHbiLgH0i/he/AtgUKJdserHXWKj7NaYV4A
Date: Thu, 27 Feb 2025 01:46:23 +0000
Message-ID: <80a713c8d9b6206c1c57b3447746157ea7065c33.camel@nvidia.com>
References: <20250227013554.8269-1-zhiw@nvidia.com>
 <20250227013554.8269-2-zhiw@nvidia.com>
In-Reply-To: <20250227013554.8269-2-zhiw@nvidia.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.52.3-0ubuntu1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY5PR12MB6526:EE_|BL3PR12MB6620:EE_
x-ms-office365-filtering-correlation-id: b95deb27-089e-486f-79f0-08dd56d08a9e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|366016|10070799003|1800799024|38070700018; 
x-microsoft-antispam-message-info: =?utf-8?B?VnZzR1Q3ZWN3cEtxRmpIY2hIeU5zZ056V0dOUEwwZWlob2NwRXI2Z1ZVeUZa?=
 =?utf-8?B?Mzh1NHlvQncyT1I5RVJkSmxISFZMRCt3UHhKSThMNnpEcGN2TU1zTVZJQ0M4?=
 =?utf-8?B?ekRKenErMTFQbjV2SStHZlZtalVoNWgvcmF0TmNmcWw3Ry8xTUNFOFUrQUxZ?=
 =?utf-8?B?U2wxMzdxYnZPdU1CMkx6WlJCbGxXb3lkNythVFpKMlVNaDkyY0xWeGJwUk5O?=
 =?utf-8?B?Wmt2SmZqY2ZXQnlVb3dJZU5xdFpkQXF3QS92WG5DV1FzQmpJSytyWkFvMzNi?=
 =?utf-8?B?dmx0YmlEdzZyL09tYnVxU0FWbEp1TGlBbVU1VGJFNzFXRlBnWFF3MVUwZ3JZ?=
 =?utf-8?B?Wkt4UXhHdWNtWFVaNFRSd0d6UTcyclpqY21DZWQzZWtkWjhsQVR5SWcwUys2?=
 =?utf-8?B?bXdiNloxQzQ5TlJDU3cyWllROFRibk1JOHZMWFZTdEx1ci94S3lBZmUxbTRS?=
 =?utf-8?B?N3VHVGZwNjlvWGIzOGY0WEtCS2pxbGcyU3Rua2dIeXRZUVNYZFd0dTl6STFv?=
 =?utf-8?B?Mks5Mi9CZ2tsaS8yQ3R4MmFSMjI0Y3VLZWFVUHI3Y0ZWbmN3bWowUFpkRitn?=
 =?utf-8?B?QXA1NWppekZkTDRYU3hNaG9jY24zMGVLcG4zUi9QaW03SjNyVFlrUXBndlFh?=
 =?utf-8?B?YWdGV2VTbmRyRll2d0hkQ2dmVVI0TVJHUkszdnZjTVNhVy9iZ3AwQUtnaHNM?=
 =?utf-8?B?K0duVDFLQm15aC9scnkyZkJGVzdwVUVDcWc5QjNqZnp0dUVRNUpOUFRRcW00?=
 =?utf-8?B?Y2RMeFlNakt5cWlab0R6c0FmdFhmaW02T0xxM21RWWplakJQV29JZzZaT1ZR?=
 =?utf-8?B?ZVo5bUIyZDkzcXR3am5idWNaSElHdmlReDR3ZkxTRnRTaWNPNm11Um1NR21E?=
 =?utf-8?B?RmhIaU4vUmpnVkRCR05sZTloTnFmVXVWeDRQRlNMdXVzQXBiMlBCZUR3RWhH?=
 =?utf-8?B?TEF5TUFWOFBsRVR4a0dPVXdEcnFzLzlubTJpTkd4N3lOM1JQbGJPQzhpaytY?=
 =?utf-8?B?Z3AzWk5nTkRBei9WM1IvQkwwV0YvQ0YxazZHSjNoSjQ2VWlrZm9NZ1BWUXZT?=
 =?utf-8?B?OS9ubFIrTDhITUtTZy9jQktuYk5ERFFMYW9wOENwRUVLbC82WlVRNm8yWU5x?=
 =?utf-8?B?U2xtZ2VFdXZHVFlBbHZEb1pIbW8ra21kaG1rcFp0dnFVTmR0QjZCRlpGUVZk?=
 =?utf-8?B?S3JiZXNydXZxaTMwdjhFMWJLU01NOTFtOW16dEZiSVl3cmVxdVErc0tLaEFR?=
 =?utf-8?B?QnRYelhaN0F0QmpIcHROYm40NkdYTFRJZjN6d3BSZVdPSlNTbkhpU1lkWHNN?=
 =?utf-8?B?ZHhuYU81VGdhbHp2Rzgxc2NqMnBUdnhDK1k3cVU3ZmZLdXJNVkN1a29pQ1hv?=
 =?utf-8?B?Sk04YVpUTy8wdTByazQzYm5BRmtlVjMyYVNoYS8xcVN1dHRCakEwUnBoeEl4?=
 =?utf-8?B?Wm1CYUk1dlIxTmNzNWVDT2d3aTFvRVBBRlJNeWIwVUhPbEMySEI3OEFXSUVy?=
 =?utf-8?B?WmNhTE5iazlMeE5CckNRM3dDOWhnbnBjWktPM1gxQ3dxaWpTdjdXV3VkVWdo?=
 =?utf-8?B?ckFmMEdYOEJHWWJuajNpRVNtQkpweDBZR2pRZkY1SG1LQmE4Y0VSOFFDYkNl?=
 =?utf-8?B?NWJwZDVsSVNYbEozMmpjUXZWaGpkV3NXMy9DQUNESXdDbldJOW0rUzZyT28x?=
 =?utf-8?B?UEF1eE5BckNGaFEzZ1BuTmdtbyt6b0tjNFZDdEU1RS9aVHdsZ05wWDhXMHNq?=
 =?utf-8?B?Smk5dmNGN1BEMGJZRFZDWERUcmhkUGNBUWhTK2VLVDZjVU9ra1dmaFFlMWVO?=
 =?utf-8?B?NGY5TTJlQTd0MDNHZC9jcXRRSFYxOVJndjBubnZEUFduOFpnbUNwdWY2aFoz?=
 =?utf-8?B?NUFNWGh1SXVLRHZ5V3YzNnpxN2VpNGIzeTRaWDEzby9TQ01VTitINDlDVG5W?=
 =?utf-8?Q?SmOZs7lhzfqX/73Nkfp56W/vyVClzMw/?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR12MB6526.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(10070799003)(1800799024)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?NzBhdm9NTzV2dTNGTmJMNGM1Q1o0L005M1pkcng2cXFFaTh3SCtsQlk1VWx1?=
 =?utf-8?B?RlVKTWJ6aUtqVG51SlQ1aGJQL0V4bitnQ1d1UGUrRGJVNFZiQ3Q0QklhUTJD?=
 =?utf-8?B?R0RjWmVGQTFpT1JYMGVod3BYbUhzTXZrYVM3dFNZWTRHaURqRk5yeTRJRUR6?=
 =?utf-8?B?cHM0WmVsZllaYWg2MFpoTkt1TGxhT3VwOG1UdVl5djE1dnlabFY3U1hzM2hD?=
 =?utf-8?B?bVByQTZ5cUU2OFpHSVFVQ3c4dnZHM3dodTk1amtHK2pnVTZ5cXM4bWZYZUhq?=
 =?utf-8?B?R29ld2xROG5UVFVkbHpmNTE2dm9neldWeEowUml1cFJIeHMrcFJjcGlrNnc4?=
 =?utf-8?B?VDEydkIzQ0FyRVAveGxyZVJVbmFiSDZBK1VuNTBIdC8zbGswcm12cFVIcjVu?=
 =?utf-8?B?VGo4WlYxNGhxYUUvT0Z5Tmg2djdmbjZQZk9qTlA1a3R6QUU4dWx5d3Q1czVY?=
 =?utf-8?B?b2tEMnlJRExJTVpCRlM2a2VvVTYxYjZwMWFuYmtrYnh1dmJqeENjc1NWQmFn?=
 =?utf-8?B?YVlaT2tzNDZBU0NOY1hTNEhlbzBHRHVQMXNxSXRIam9RT0tId3EwZEF2bklN?=
 =?utf-8?B?cGl4OU1DaFhCZnZUQUMvbjh1MlZCaW00VjJ5Qzh4TnZZYnZQMXd1L0xVREF2?=
 =?utf-8?B?NXVnNGxHdlRweTRzYSt4U0pUcERVWXR3LzNmcTEzM20xNlprMzRQeUY1ZSs3?=
 =?utf-8?B?T3dNbjhpcjVjVDNlaU1YNGljMVFZNGJBZGhLdWdZOVNXRWhadDFyZTVjL0VX?=
 =?utf-8?B?UStqMmFTaXh5NWJxUEpqSkRONjhUcXlXeW9rdmV0VElwYVFBNTZHcHNhNVFk?=
 =?utf-8?B?R2E0eGpvUVpQeERQUVZPYlVoWTEyOFpYQS90SHJTU09oVFFxS2NmVm5CU3lR?=
 =?utf-8?B?STNmSHVFbGx2czJTbmhLS0RhdnUraGpXZlBBNWwrKzVhRGVYbUVSdmtxOW9i?=
 =?utf-8?B?UW9MMkZBanVkc3AzSWgweXZlU1JxVWorTzh1SFc3MnIzempHYXo2ZVJYcUhr?=
 =?utf-8?B?RzMzYU9EU2tYdmJGSml6KzNqWGFCSHBIRmNlSHhzQ0V3UmdlRWhXUzU1WXJ3?=
 =?utf-8?B?cTQvMW05c3hueTZaSFpnYnVaYk55V1dSS2ZMRkMzODJTNVBEQ2hhUmF3OERz?=
 =?utf-8?B?d2cvYVc3dnp6ZlUwbDRBVzUvNjVyd1RCTTdHRTNCSTFxUDJCWU5aeWdOWThD?=
 =?utf-8?B?VTN2bnRLaW1lRWc2MTJidUs1WHcwY0ptT3ZDWldNd1ZjM1hXbHRCRVpkeHhY?=
 =?utf-8?B?NWloa2RoQmtzWVpnRzVwVDc3bGdUa1B6MW1qbVkxSWdib2NXb0hRNHZ5bDhp?=
 =?utf-8?B?S3lLQW5lL3VCVkZoZndhL1hYajMweUt6RjhLeWVJT0RaYWVIR044ZnI0WVQ0?=
 =?utf-8?B?WGdQUjBobnZ6UWdBWkdpNmt6MVgrMnNzdkRYMDkzOUZ3Z3MzYTh5SXptT3VW?=
 =?utf-8?B?V1JVaTExUXA3UnV4M0lzdDFKZ2crSWx1eGZFRkRpWEFWMDFKWTMzT1lyNHRt?=
 =?utf-8?B?L2FKck9GWUhZV0FFUFgraEdqT2VYbG9wRms5MVN2bmxUZ2JMOHZzZWtSekdu?=
 =?utf-8?B?QnB0ZHdlejRPeis3dnlsejBwSzRNWE9VRVBQcDltM05pWlRDZVBxR2cyRS8x?=
 =?utf-8?B?VUVxQ0xpM0FZcE1EcjMxNW1aejdoN1lmdDRZU0UyN0h2N05ub05xckVpSVFE?=
 =?utf-8?B?cEFzRGhwVHd0UnM2enBlMDhqOHpsTHU1OW0wZnJzcTNXTjFZMG1rRTFDMEdh?=
 =?utf-8?B?SHhoZDVNTzg2UzhIcml2c052dFJ6QVJmNlNpSzUvMVVaN0NzS0R6MlQvdEF6?=
 =?utf-8?B?blJOUUtubm5wZjd2QkxEYXJITWJoM3NkNUJBRFJHRTFsZkcxWDlicWJ4a1Z3?=
 =?utf-8?B?OVlzU2dreHdha3grY0QwQUROLzg4VkhFMEpjVzdieWM2WHR3QmFTb3hRWHgx?=
 =?utf-8?B?dlFhaUJ3ZklMN2pQRlRtTGtjRTV6SzNDYTZETXdRVUtEY2xxTFQ2MERCVXFE?=
 =?utf-8?B?Q0YvWjVoMytUVFM2bFBmYWxpeG4vcGFpcG1rNm1SaEFGNEJ0ek80MUVyOTE3?=
 =?utf-8?B?TklZMlZkaTc0TmVHM25qR3JnZTBEN0NBVUViU2lRVlpwUzZmRGMydEgrd0k2?=
 =?utf-8?B?azFkaEpKdHAxZHV3cVdqb2V6UFBNZkk5eWJ1cFRMSEtJaHcrM2VQZVE2VmZt?=
 =?utf-8?Q?G7EONY8+EpEC8JC9y0Ok22OTwLIDDCwT1JYv5mmtkDvL?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <B96F06E51C1A6C419143D7424A0C766B@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY5PR12MB6526.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b95deb27-089e-486f-79f0-08dd56d08a9e
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Feb 2025 01:46:23.4951 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: BTDIQDJjtSD57qNLsVKdQ4eOcKjKDKCuuNfKdGVGgIVj02WJqySXpbcGwl8e0l5gO7vgiEGNUapor0XZjVGaHg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR12MB6620
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

T24gVGh1LCAyMDI1LTAyLTI3IGF0IDAxOjM1ICswMDAwLCBaaGkgV2FuZyB3cm90ZToNCj4gKy8q
Kg0KPiArICogRE9DOiBHU1AgbWVzc2FnZSBoYW5kbGluZyBwb2xpY3kNCj4gKyAqDQo+ICsgKiBX
aGVuIHNlbmRpbmcgYSBHU1AgUlBDIGNvbW1hbmQsIHRoZXJlIGNhbiBiZSBtdWx0aXBsZSBjYXNl
cyBvZiBoYW5kbGluZw0KPiArICogdGhlIEdTUCBSUEMgbWVzc2FnZXMsIHdoaWNoIGFyZSB0aGUg
cmVwbHkgb2YgR1NQIFJQQyBjb21tYW5kcywgYWNjb3JkaW5nDQo+ICsgKiB0byB0aGUgcmVxdWly
ZW1lbnQgb2YgdGhlIGNhbGxlcnMgYW5kIHRoZSBuYXR1cmUgb2YgdGhlIEdTUCBSUEMNCj4gY29t
bWFuZHMuDQo+ICsgKg0KPiArICogTlZLTV9HU1BfUlBDX1JFUExZX05PV0FJVCAtIElmIHNwZWNp
ZmllZCwgaW1tZWRpYXRlbHkgcmV0dXJuIHRvIHRoZQ0KPiArICogY2FsbGVyIGFmdGVyIHRoZSBH
U1AgUlBDIGNvbW1hbmQgaXMgaXNzdWVkLg0KPiArICoNCj4gKyAqIE5WS01fR1NQX1JQQ19SRVBM
WV9SRUNWIC0gSWYgc3BlY2lmaWVkLCB3YWl0IGFuZCByZWNlaXZlIHRoZSBlbnRpcmUgR1NQDQo+
ICsgKiBSUEMgbWVzc2FnZSBhZnRlciB0aGUgR1NQIFJQQyBjb21tYW5kIGlzIGlzc3VlZC4NCj4g
KyAqDQo+ICsgKi8NCj4gK2VudW0gbnZrbV9nc3BfcnBjX3JlcGx5X3BvbGljeSB7DQo+ICsJTlZL
TV9HU1BfUlBDX1JFUExZX05PV0FJVCA9IDAsDQo+ICsJTlZLTV9HU1BfUlBDX1JFUExZX1JFQ1Ys
DQo+ICt9Ow0KPiArDQoNCkkgZG9uJ3QgdGhpbmsgdGhlICI9IDAiIGlzIG5lY2Vzc2FyeSwgYXMg
aXQgZG9lc24ndCBtYXR0ZXIgd2hhdCB0aGUgdmFsdWUgb2YNCk5WS01fR1NQX1JQQ19SRVBMWV9O
T1dBSVQgaXMsIHNpbmNlIHlvdSdyZSBub3QgcGFzc2luZyBpdCB0byBHU1AtUk0gaXRzZWxmLiAN
CllvdSdyZSBvbmx5IHVzaW5nIGl0IGFzIGEgc3dpdGNoIGV4cHJlc3Npb24gaW4gcjUzNV9nc3Bf
cnBjX2hhbmRsZV9yZXBseSgpLg0K
