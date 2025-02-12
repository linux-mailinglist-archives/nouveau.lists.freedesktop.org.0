Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DA93FA33046
	for <lists+nouveau@lfdr.de>; Wed, 12 Feb 2025 20:59:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E82D10E97D;
	Wed, 12 Feb 2025 19:59:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="DbhicyK8";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2061.outbound.protection.outlook.com [40.107.223.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1CE4E10E97D;
 Wed, 12 Feb 2025 19:59:26 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=g21Zp4SNVhsWNiR0pcFRL325UD8Fjq69qMI84gKGzvhSvIl0F9vWI4AA8NIp0dNkIWz8h6yym+MGgPyO03R9MrvKCuqOcGMbe5NnDzaHTg7qk2CPvkuSOpR0vdJsTBy4HUVMMGNDl6Vx/XNaJ3TBeNcK8u1tW+WW8a7ZUgxUlvYrgywas7iqBuAv7/XzEH5T5zCyqZfJwDL3KE81Jige2JSP5agOdOfeL+w3lhhZgRkDK3US7oYsJBHJo9UGrmZVYB7zj8YUxT+KVNTOGE8xt8BqL5qb3H1yCmoG3XWwq8bPptsOrk0UujvuGmxFimMlcDoLsoQiAN+IaAQlhww5+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=c3N1ukmyon57zNd0wlpgIwGLnjJAtD2NnhpWVDUExoI=;
 b=QW4ZSUZntIWyvCYY6T8pak8t9fwd41Zvq+m1nQewXbU2Hq+MqVEADRRjl85Sxnczgspf9A+ImWv/+rDEU6EUxk4UcE5BCUIpl1oHUmJWtQFXRk9t1422+kDcgEReOhoha/64Xl+Jb4bwLxd/vcQDzgN201WWhmDUTrlthBbXzcEq7Z/xOWUdWqYNNw5ukRjTNShwrK+3l/99HGm4o5njIkvkRf0fIhfgPYDwQLPVJM9YAqkDb7u7Q/8Yp9+8vk5FFO9tmZGf61Ct+t6mbgQ9t1An9h1yzhuM4dD8LgUfLexvf1lp6k4hQhKLVWokBVxZxVZZWc2RbanvJGoyS01cfA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=c3N1ukmyon57zNd0wlpgIwGLnjJAtD2NnhpWVDUExoI=;
 b=DbhicyK8NbuWIBxRCv1AgwBvl+onX6T1T5OwudOdio5wOpMtgKvwZLREPpPQ51qUOd7DaT0yxFzQ5s1743h3qzEhm0R3CATo+LcDn6aplhx3nOmOpPLm5omWOHAJJsGRL1YuFzu9fLshlp2g/jolOMkxdHDN6VhO6BlMK4X5cIYRvy9X+kfIQaBC465f++oeOXuPv3Vq/gilidB0JPSUALylCNovy21snmdPPVW93yqlKQYumKJLPxSfH7uJVADNc4tbKWx7LZjZZilLWThyiHqcgGPINvupTXPJWWDMfvn9mpKdkZK36irztsrBMWj8f2jI+cHFx//qwye5VZ0YWg==
Received: from SA1PR12MB6870.namprd12.prod.outlook.com (2603:10b6:806:25e::22)
 by CH3PR12MB7522.namprd12.prod.outlook.com (2603:10b6:610:142::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.18; Wed, 12 Feb
 2025 19:59:21 +0000
Received: from SA1PR12MB6870.namprd12.prod.outlook.com
 ([fe80::8e11:7d4b:f9ae:911a]) by SA1PR12MB6870.namprd12.prod.outlook.com
 ([fe80::8e11:7d4b:f9ae:911a%5]) with mapi id 15.20.8422.015; Wed, 12 Feb 2025
 19:59:21 +0000
From: Zhi Wang <zhiw@nvidia.com>
To: Danilo Krummrich <dakr@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>
CC: "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>,
 "airlied@gmail.com" <airlied@gmail.com>, "daniel@ffwll.ch" <daniel@ffwll.ch>, 
 Ben Skeggs <bskeggs@nvidia.com>, Andy Currid <ACurrid@nvidia.com>, Neo Jia
 <cjia@nvidia.com>, Surath Mitra <smitra@nvidia.com>, Ankit Agrawal
 <ankita@nvidia.com>, Aniket Agashe <aniketa@nvidia.com>, Kirti Wankhede
 <kwankhede@nvidia.com>, "Tarun Gupta (SW-GPU)" <targupta@nvidia.com>,
 "zhiwang@kernel.org" <zhiwang@kernel.org>, Nouveau
 <nouveau-bounces@lists.freedesktop.org>
Subject: Re: [PATCH 3/5] drm/nouveau/nvkm: introduce new GSP reply policy
 NVKM_GSP_RPC_REPLY_POLL
Thread-Topic: [PATCH 3/5] drm/nouveau/nvkm: introduce new GSP reply policy
 NVKM_GSP_RPC_REPLY_POLL
Thread-Index: AQHbeYnrJDswru3M/UGEi8kjzYJj9rNDQ7kAgABuiACAAGvgAA==
Date: Wed, 12 Feb 2025 19:59:21 +0000
Message-ID: <76373d52-0356-4a8b-b73d-953f9af830ec@nvidia.com>
References: <20250207175806.78051-1-zhiw@nvidia.com>
 <20250207175806.78051-4-zhiw@nvidia.com>
 <D7Q9SQ3YZD6V.1QXQ18Y0EVOML@nvidia.com> <Z6yjGoOPkZdjXRrY@pollux>
In-Reply-To: <Z6yjGoOPkZdjXRrY@pollux>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SA1PR12MB6870:EE_|CH3PR12MB7522:EE_
x-ms-office365-filtering-correlation-id: ef6a183b-84ad-49cb-a4cb-08dd4b9fbe07
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?dG5Ic3d1RHhBV3NhV3RRdVBUaDI3QXYvZmhSWnBJampNSGpnZDRMTDgrTzBE?=
 =?utf-8?B?a256OEVOZU96VkdKcFpBNzJpMG8yb1huQjNsKzczTWViUlRRWGNJV1lTYTVo?=
 =?utf-8?B?Tk9Ecm9Xc3J4ekRsRnlwakkvZjdDSlRwZVhKaXByQ0hvUDFLeFVNR1NpVEJH?=
 =?utf-8?B?czRiWWUvSzZzZk1xRVd3bHhkUlRITkpQYkRDT2MzT1BXNVpFK1l0Y0xrMEJo?=
 =?utf-8?B?VHR4S2piOXNaRzQwSXAxL1preURJUVJqSHlqVklDbDAyb1NKZzU3R1VqRDdK?=
 =?utf-8?B?WlBqWWlmalYxa3daU2pudUE4cXVNU21JZWFhM01uQWwzR2dEbXFTYndjTDd4?=
 =?utf-8?B?V1ZabkM4NE4xWDR6OFl1WEk1YU9IbmpJcTF4cDVhRjcrK0ZwMElVN3dySGJo?=
 =?utf-8?B?MWd4K3FwdExEY3ZoVmluWCt5TStUS01zOWFBazhyK0dVMFQwOEdxU3YrMk1u?=
 =?utf-8?B?WHozOHpwM29TOC9KanRoU3pUMHd1dTByWlA4Qy9SanFrY1dnZjBYRDNVWlJv?=
 =?utf-8?B?WXdpUXNNS0xRM0ZIT3hLaVpvL2t0VjJsdWR6OG9LcjVOSUJ5RHllVEhnckR4?=
 =?utf-8?B?NEp6TEdpc2pweDRXNGYwVmh5eDlncHpVTEN4Z2QvZmlnSEE4ajhBdGFpYVZ3?=
 =?utf-8?B?Y3NGWDV1VkRIVW1YUUpXdTh0TGpiczVhSk40ZytiQnRDUDlEOFljaDJKSFV3?=
 =?utf-8?B?cmswNTEzSTh2aGRWNjVVUHJkKyt4UUNxaEVuNUpzbWZjeXJjcDdkMG5NZzN1?=
 =?utf-8?B?RVdRQzVnb3FpZlpXeHVwaktuY1E1cDRkQXcybnhtOUNKM2h6RFh0NHMvSmRj?=
 =?utf-8?B?Z2U0WmtDWlcvVWZtTC9UV0ZXZ01tSU1LVmtkaENxdmxpczU1elhlTzlmVnNW?=
 =?utf-8?B?cFFKSng0OHE1UEZETzRtZGc0UjRNK3FtbktZcElDRFR5ejBseDQxUENJVzJJ?=
 =?utf-8?B?M0JJTjVhQU9xVGIxT3MwLzI0U3RBYVlRSEtiek1kT2kvaHFHaTRqYnVtYSt4?=
 =?utf-8?B?eVc0ZG1QUlhja1FaUEZEa0t5RERydXpBY1lGdmtQV0UveSt6RWc4cDNkR3Vw?=
 =?utf-8?B?ZEpydkNFUU9GbWJLZ1RhN2FsdUtsV1R1NlpCQWJjSmcyM3ppbENLNm5UNGFw?=
 =?utf-8?B?NmdBRW9CMTB3VHRrbk5RSytOaTRERDRSMFpXVktSdXJHNkVYT0VRdEFwVE1K?=
 =?utf-8?B?Ly9oeUpWbnRLU2JDM0JQcCs3QzFFZUk0S0JzWjQxclNBNXVySUV3K2N4a3g3?=
 =?utf-8?B?SHFtTHRETkdUTjhUdUNlRGt3cmtiYUN5S3Y0QUt4bkNmZmRoWjZJZ3g1NDNZ?=
 =?utf-8?B?MUoxOGt4TXYyRlRGdU1HQ091U0JGQ21SQ1VhUjF2bkpId25RZjRSb1pseGZl?=
 =?utf-8?B?OUsxVDFhTWRqMk9COVVrOGZZWUJDak0vMzVFOW5ob21OZnJYQ0VFSTg4RHFR?=
 =?utf-8?B?UGwrMmRiNnVrZWZwbUhuZHQvcUV6Y2pLZEd5alNHcDY1Z25ZNEE1U2hBMzlP?=
 =?utf-8?B?WG9KaTBHQUQwajRjQnhWY0tzK1JjbDBYSkRieE5ncFM0K0pGYVFIbXl3dHBQ?=
 =?utf-8?B?S0djMk1tWktFKzhJRStibi9QRkJSN3AvQ243OVRkUkJlN2JlWThieVBGajJ1?=
 =?utf-8?B?amhPV1hHWFJSWUZ1WExQVU1tbkRZUW4xL3ZadE91cG03bzczR1FPRjBmZjRu?=
 =?utf-8?B?TlZ1WXo4cFJRYXdBZ0hsUlhWQ3Y1dVBYYTZqYjhIQkdIVXR0eEhhZzlCZXpo?=
 =?utf-8?B?WFExTnYvQUNvL2hPZnlwL1hGUEdEbFI2NVRhdWtZcnNkekdWczh3M1RqUkVH?=
 =?utf-8?B?TVYySXVWdVkrd0JCZTlhc0tsYjc2ekVIb1R6ZWlIYVBhck4wV2crUlJhZXlU?=
 =?utf-8?B?a2dUakhRbmRtcFFFWHBGNnRwUm1sNFVFQXl0NzZacTdGVXRqVHkwTTRqYzl4?=
 =?utf-8?Q?ZbQBhfWWQ/y1fptAwDGfmWvAYdUIBkFt?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA1PR12MB6870.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?bzQ5dDUyWWNrclkzUWR1WHBFZ0Z6K09LWE1UbE1RTDFYRG1odnRTK2VlVHpr?=
 =?utf-8?B?WHQrOWc3Q3l2cVU2dXhpM0Zuckx4ZXJNUytwYm0vNE9Cb01FRGZHQllKS1VX?=
 =?utf-8?B?Wnh2YzVuZU9xamFQeTU3UUhqKzZKcVJYaW8xRUxaa0hmZEtxTGVVMGNHTWQ4?=
 =?utf-8?B?Q3NQNUQ2RXZmTElodDNyMWtybi9id2czOE0rMnZwSFJ3K0VqZ080MmJPU1Zh?=
 =?utf-8?B?eEloZjFidHRUd2xtM3A2WTNsR2d6K3hEWkJTL1NlUzRtNUEvTHQxSVM1MEZu?=
 =?utf-8?B?ajRhNzJ4MEU3REorV0dLc0hMSHdSMFBWcCsyd21uNEpIVDBIbk51NDFMMWNm?=
 =?utf-8?B?dnRUdWs0RklKS1RhbklrTzFUOVEwT2RlaU9CRzdlU0E3aFpXRWhVTDBEVjlh?=
 =?utf-8?B?cjdmbUVPV2tEWHVWYmN0SFdnMHlZLzZsRjkyZEE2a0NvcVBKei80bUVFLzRV?=
 =?utf-8?B?VXozY3FEOVRZemIyZjZBcFFmT0RzUVBKNXVHdUtmcE1XdytVa1VPUjN2S1ZM?=
 =?utf-8?B?d0ZpaWRoS2hFcXRqK1ArZXlMcGVOOWxEcjh5NTFoZDhqV2x3bjZtbFBIYU5a?=
 =?utf-8?B?dHFoRnB4T2dsOThSNDQ5YnVDM1BaRHFZSHg0NDUrYk1WZVJNOFlhY0EvWllK?=
 =?utf-8?B?VzZjaUpuNmtoYzJuV0ZxejBSRlVMaE44bG9nNGpRekI0OCs2REpLNVUrVFNJ?=
 =?utf-8?B?a1A4bEppN201TnlsZjY0SU51OEZxL1EveW5GQkR5bHBVa2JUOUZwUkR6MkRU?=
 =?utf-8?B?cDJOTXhjQVhvOHFLRkl2QSt6RDNzNVNUUHRUTkxzVDI4eU5RcFNFMDZvdjJQ?=
 =?utf-8?B?UXE3NEdNQTNGMERFZ3dGVEtpS2xrVnh1M2xmUmN0YTBOSUY2SGYxZ2JOQ0pm?=
 =?utf-8?B?YkhxQ2U0M2lqY0s2VTd1dUd6R3JRbWZZMEM0WGVRVjR3VEVPUGZWVHMzNnNU?=
 =?utf-8?B?S3pwcm5HZkZtRndEcGJldEY3TDRIQUR3Vkk4YzJiNDFlY3lDOGhrNlN5ckly?=
 =?utf-8?B?ZXVmMmpSZ1R6disrZnZFZlVPcDNqdVROb0NMelRDNGh4OW1VenFMQXpBZ09k?=
 =?utf-8?B?T2NPWDk2WE5hRDEvL1Bxbno0YkpPQlY5ZGVsUDdrV0xCZ08va0c0TDh3akt5?=
 =?utf-8?B?OVNKRWFKODdtUjhyU3VXYXA3MHczbUtuM1BmVXU5V2tZWUY0dERKK3g5ZUxZ?=
 =?utf-8?B?NFRjRDQ5SVVkOU9qMUw5aFhTaExSK3QxQU5sZThTOUd3S1ZlVXVibTl5eFpQ?=
 =?utf-8?B?RmhRU1hNZEhNQkNYa2lxTWFqazVnbURuTUtNSmF3dC82bEZGOXlIRXUzN0RT?=
 =?utf-8?B?OTE0MUx4aWN5a2VTRml2TldFVmpEKzMvbEJJcEhoUk91TDF4czF6UDd5cFZE?=
 =?utf-8?B?bU5xbHVYZTZRL0dUUVhDQXBZOGQwcGZYT1NDMFdKUlZmdDVOaE50TjVnSTND?=
 =?utf-8?B?Q0dVNG1lQ3gwUFM5dURIVXRzMVlEc2dhRFpxczYwQ3M2d1N6YnJ4QncvWXBa?=
 =?utf-8?B?d3paODk1bHZFVmg2Qmh5ejdLajdRY1kyRHJwemUxMnhlcUJXVDJ6WU9aYTIw?=
 =?utf-8?B?T2lDVGdsSmpnYktCRWRNQ2VKTnNIK2F5M2krOXZNWDcrUWJGdnFHSVBnMk02?=
 =?utf-8?B?UnhMb3VEdXd4M1JMbm5HMFpDYmxxbmRwQlc1dlc0QnI1YVlqTVBUK3RNMzJU?=
 =?utf-8?B?TkhwYVJRdUl4TEhtb2RXSVQ2QXFqazRyRC9sSU9hcVlub2VEOHJKQkgrNWRR?=
 =?utf-8?B?MW1sdndzb1Vxb3RZYm55Zi9HQTZjeityYVpNVnhjUkJvdjNpZng1QVJYVk9o?=
 =?utf-8?B?ZVl3VklZdUcyVitRb2FYS3ZCeTlrYWxEVnVlZ0JyZ2c0d25DaWQ3dXRTcEFv?=
 =?utf-8?B?ZFZSb25BSm9hUkNqekpxRWJRVmhFdE5MVUVpZWpkY0lHUWYvMUhRZjF2L0pq?=
 =?utf-8?B?UDc1M0RWZmpTUXF6UVhCL0xxd013WnpiYXNHdC9vZkZQQ25TdWpUb1NPZCsw?=
 =?utf-8?B?ZElsWXZJU1JZMlB4REpybnV4NXlBOUl4eEFRb1gyZFJ4aG1DT0dUR0dFa2xY?=
 =?utf-8?B?RUp6eHMwNDNJdWZuTWxOWDZRcHU4dHEwWnd5bjNxTGw5UlIvV0ZiMGVNZU9j?=
 =?utf-8?Q?Fnyg=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <099E912B2AE541459055A2D19A6AF814@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA1PR12MB6870.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ef6a183b-84ad-49cb-a4cb-08dd4b9fbe07
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Feb 2025 19:59:21.6444 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: OxlfNiN8YYN5K8pKMjgwPRqAp49kdCJnOfTH1THWgFR/zmxslJXMkB8UUlW0qduS
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB7522
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

T24gMTIvMDIvMjAyNSAxNS4zMywgRGFuaWxvIEtydW1tcmljaCB3cm90ZToNCj4gT24gV2VkLCBG
ZWIgMTIsIDIwMjUgYXQgMDM6NTc6MzhQTSArMDkwMCwgQWxleGFuZHJlIENvdXJib3Qgd3JvdGU6
DQo+PiBPbiBTYXQgRmViIDgsIDIwMjUgYXQgMjo1OCBBTSBKU1QsIFpoaSBXYW5nIHdyb3RlOg0K
Pj4+IFRoZXJlIGNhbiBiZSBtdWx0aXBsZSBjYXNlcyBvZiBoYW5kbGluZyB0aGUgR1NQIFJQQyBt
ZXNzYWdlcywgd2hpY2gNCj4+PiBhcmUgdGhlIHJlcGx5IG9mIEdTUCBSUEMgY29tbWFuZHMgYWNj
b3JkaW5nIHRvIHRoZSByZXF1aXJlbWVudCBvZiB0aGUNCj4+PiBjYWxsZXJzIGFuZCB0aGUgbmF0
dXJlIG9mIHRoZSBHU1AgUlBDIGNvbW1hbmRzLg0KPj4+DQo+Pj4gU29tZSBHU1AgUlBDIGNvbW1h
bmQgbmVlZHMgYSBuZXcgcmVwbHkgcG9saWN5OiAiY2FsbGVyIGRvbid0IGNhcmUgYWJvdXQNCj4+
PiB0aGUgbWVzc2FnZSBjb250ZW50IGJ1dCB3YW50IHRvIG1ha2Ugc3VyZSBhIHJlcGx5IGlzIHJl
Y2VpdmVkIi4gVG8NCj4+PiBzdXBwb3J0IHRoaXMgY2FzZSwgYSBuZXcgcmVwbHkgcG9saWN5IGlz
IGludHJvZHVjZWQuDQo+Pj4NCj4+PiBJbnRyb2R1Y2UgbmV3IHJlcGx5IHBvbGljeSBOVktNX0dT
UF9SUENfUkVQTFlfUE9MTCwgd2hpY2ggd2FpdHMgZm9yIHRoZQ0KPj4+IHJldHVybmVkIEdTUCBt
ZXNzYWdlIGJ1dCBkaXNjYXJkcyBpdCBmb3IgdGhlIGNhbGxlci4NCj4+Pg0KLi4uDQo+IEkgYWdy
ZWUsIHBsZWFzZSBtZXJnZSB0aGlzIG9uZSB3aXRoIHBhdGNoIDQgYW5kIGFkZCB0aGUgY29ycmVz
cG9uZGluZyAnRml4ZXMnDQo+IHRhZy4NCg0KVGhhbmtzIGZvciB0aGUgY29tbWVudC4gSSBzYXcg
dGhlIHByZXZpb3VzIHBhdGNoIGlzIHN0aWxsIG9uIHRoZSANCi1taXNjLW5leHQsIHNvIEkgd2Fz
IG5vdCBzdXJlIGlmIEZpeGVzOiBpcyBuZWVkIGhlcmUuIFdpbGwgYWRkIGl0IGluIHRoZSANCnJl
LXNwaW4uDQo=
