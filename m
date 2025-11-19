Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F33E2C6CCA4
	for <lists+nouveau@lfdr.de>; Wed, 19 Nov 2025 06:16:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 40AD910E570;
	Wed, 19 Nov 2025 05:16:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="RkUHCnsb";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from SN4PR2101CU001.outbound.protection.outlook.com
 (mail-southcentralusazon11012070.outbound.protection.outlook.com
 [40.93.195.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 34D9710E570;
 Wed, 19 Nov 2025 05:16:23 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RB2FEY2N5LlUECjHIQGblWafLCunMRirnbV9ieSraxkRt2U7Xwl9vx6OR6deZ6aR3WQCJXE5mXChL6Vy8t+iS5AP1CIi8t2bfirLFRqI5fSUPb+IdU6kzwNLjCNOriNo5Mll3EQ76OL3smyNr7N7CMhnRWB6niKMY7mFt5+dd1Yz+G2rwUxqJWhjHntDwUYR1mF3gSdDQnxPo/XLEJuVuU8n7kVsyLMKZpPx17FZHmClCG4ISOdm4k2jOa1pIslIQTKDV5rA2QduWw87tVEGXm6dCrKxbpYFgi9SFk+P38wofl3n9OFkIAUh7ly73OE/OdQtwgpoXenMwO/IDtTYUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=y7KU+OkfuzrdtBkEtndyK0/bu79vgGsDnrGWKzoWFB8=;
 b=MmuzOpvUfbgABSZPFgvc4c3CgnxO/vujtt4Vql8tQ9i9q7iBSyHNOUkOiijlyrs4NdgHyubdmYkWrg/psxB8sYhMMMo9nKQMLUyGnZ3AeJHFXI+K298t6bqhT7lPupIwS/ZF3wB058LGtvKeV3sn/uAHkTht5XFwPiWSmOT1n6QQu0ENym1irlTyd+uoa41atYNGUM2QQrtXbaDjorDSOvIWjeCiDh/8sXIjJ5LhER27jpfzZXbW75H7VTrJmRNFOYsFveDqvih+zIgU5PkLLP4LOjdgagGEq/AZduQXCFvovPihfF2YZW4jUJ3UXrTdgcGeZLGtXJEwSUdRiDTwFg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=y7KU+OkfuzrdtBkEtndyK0/bu79vgGsDnrGWKzoWFB8=;
 b=RkUHCnsbpiYRiJEyirz0EUy0K3d8o6gMhXOKDnnpvwd4OSP8EqEb2tYob7/C8zRmUGAqIVrlXCCGZRZxZ/3GBCKUw3vxch9qHUE5jI3ybAGiqzy3zsZtsTTclxBq239bPTZo2VHEu854EjTMC66olp8yTNR+f8ks/4vLFFGsXmrHR0L/1X6UB6slyg065mfkbsswQb7kCpVmcQ6rvn+hHZjajPa3z5ssFt4wyAQQyBLwViRu0+xsls5E9Up6M82qQdfUoGBXBl0k+nadj5w0cDyemSiAt33z6I/TlQh6iKhg7XF0ft5utu5b8q362GAYYXKrqvxhGK2SAzY+DkK+0A==
Received: from SJ2PR12MB7943.namprd12.prod.outlook.com (2603:10b6:a03:4c8::10)
 by SJ5PPFABE38415D.namprd12.prod.outlook.com
 (2603:10b6:a0f:fc02::99e) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.10; Wed, 19 Nov
 2025 05:16:20 +0000
Received: from SJ2PR12MB7943.namprd12.prod.outlook.com
 ([fe80::6a18:df97:8d1a:5d50]) by SJ2PR12MB7943.namprd12.prod.outlook.com
 ([fe80::6a18:df97:8d1a:5d50%4]) with mapi id 15.20.9343.009; Wed, 19 Nov 2025
 05:16:19 +0000
From: Timur Tabi <ttabi@nvidia.com>
To: "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>, Alexandre
 Courbot <acourbot@nvidia.com>, "dakr@kernel.org" <dakr@kernel.org>,
 "lyude@redhat.com" <lyude@redhat.com>, Joel Fernandes
 <joelagnelf@nvidia.com>, John Hubbard <jhubbard@nvidia.com>,
 "rust-for-linux@vger.kernel.org" <rust-for-linux@vger.kernel.org>
CC: "nouveau-bounces@lists.freedesktop.org"
 <nouveau-bounces@lists.freedesktop.org>
Subject: Re: [PATCH 03/11] gpu: nova-core: support header parsing on
 Turing/GA100
Thread-Topic: [PATCH 03/11] gpu: nova-core: support header parsing on
 Turing/GA100
Thread-Index: AQHcVb7G2n7lcTwiZ0ixsrXV3K+7w7T5U1aAgAAocQA=
Date: Wed, 19 Nov 2025 05:16:19 +0000
Message-ID: <fb673d50111ed0989ec8ba2a245e89eecaeb1864.camel@nvidia.com>
References: <20251114233045.2512853-1-ttabi@nvidia.com>
 <20251114233045.2512853-4-ttabi@nvidia.com>
 <DECBWUFEHV5D.3O0TH2AL775C0@nvidia.com>
In-Reply-To: <DECBWUFEHV5D.3O0TH2AL775C0@nvidia.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.56.2-4 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ2PR12MB7943:EE_|SJ5PPFABE38415D:EE_
x-ms-office365-filtering-correlation-id: c9b4132a-f178-4f44-c22e-08de272ac5ff
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|1800799024|376014|366016|38070700021;
x-microsoft-antispam-message-info: =?utf-8?B?ZnFrY0hmSGNvYzBTaWo5MVA5M3E2VWZjN3VkSENsa2lKZGh3c3lJeGYxZzJD?=
 =?utf-8?B?ckJMYTFBWVdES1ZBem1xTWQ1OFV6UXlDSE56SXpFbWJhL2VaT3VJN3VXU1dF?=
 =?utf-8?B?QVVyZmxJR2FGK3dzdm1GZmZPWlA3b3kwRmpxNnp2UXVBajIwTDV6V3Jwalhj?=
 =?utf-8?B?VTFpRk5LcWtEdEdkVWdXMkM0dEdFVnEycjZUdXNCdVFCekJYNDZDbFpwY3kw?=
 =?utf-8?B?OXdqeFdVSVdVTjBjaTd6bGp0TDdEcGRuMVZBYjhkS0lDejZYT1o1dXI4b3k3?=
 =?utf-8?B?ekxjWHVYQVlWWkc1MWI3NWwwZmxaLzlUU2dVcUlLWmtzUk9EL3RtL0lWOGkr?=
 =?utf-8?B?eVAzai9GRmFLVFFiWm9zQW9jRnlJZkNMU2ZlcytVRUdsLzk5bWdjcGhIdmJh?=
 =?utf-8?B?WlhVNkQzSFlWMlA5ZkEzWUlzaDNUNm9ST0JQNlZyZVF6QUxPMFE1a1hia2hD?=
 =?utf-8?B?ZkZSNk1odnp2OEJ6VFUzaFBoNkVVdDg2ajJUOWErUm1oVUQ3bXlRd0FMWk5I?=
 =?utf-8?B?d2ZQdnoyTU11NU9BM0FuRXFIMS9DWWpOUXVXY2J4MHZSRWw1cHpLRFdMeXRW?=
 =?utf-8?B?SW1jdnNjWUdiY1pHazNEMnRheWd6dG5CMUMralF0bGM0ak4vM1VRdHVHUFV0?=
 =?utf-8?B?d2VoZ1JRZ1J1V2lIbllMZXNLbUVrRlB6U0c1cFZBa240VnRSNENYSWhkeVQz?=
 =?utf-8?B?ZVgySzloamJ3ZU1QaHdWd09xQ0FQN09sYXhiYWVVME5aZ3p6K29oV3BwVllh?=
 =?utf-8?B?SWVnSnQ5VmliRkMxRUxpNnZRenNmWjVCMHQvSXF3Tjg5T1lTbjFKeTd5ckFp?=
 =?utf-8?B?UlJWMVcxZkhGVmk3emt5SXVXWTJUTEpGaVdEd2JjS0M4KzNHeFlKL052QytI?=
 =?utf-8?B?NjNLMkFQMDhGbTJXKzlnSENMRkJVNzRId0toVDJ3ZE1xUXZkamlGSURrczNu?=
 =?utf-8?B?SzdxL09aOTBVQjlVcml5ZVFpSjFpR2R0VzFGMGtGbitqT1VqeGJBNHcrcWdr?=
 =?utf-8?B?Um9iUk42a1Viby9ZQ0JQR1ZCOHRrMW5NS1JiNTlZUlkyTEdCUUVsVHk1TFVv?=
 =?utf-8?B?MGRrdzdTVmVidFlXNmp1UzlDS2NQTDdiUU5hZ2VHNno4TzJBS3pkZjh5RGxQ?=
 =?utf-8?B?dzJ3K3VrUnVzS0lCV3VkSFlBZEpLTSswTGdsMzkxL3lvTm9OM2o4WjViZWdM?=
 =?utf-8?B?MjBBRWlYdHZOWVlFT3VRbXVGRWV0NmZQQzRhVVpXejI2UWVTZTA0SjZ1dEQ5?=
 =?utf-8?B?UXlGcWlBTlNoOG1aVlZvWGw1YjA5citRcEFhOUZRL3VXR3IwdEQ1OXVhVEQ5?=
 =?utf-8?B?cm0wOTdBNzhVTmtyOGJZVUEzK1VqVE9VMnFzK3B3ZS9DOFp0U2NzczBNTTdT?=
 =?utf-8?B?bkRPWVI5N21JWjhORzVBZjFVczBsTExiWllnYVUrcjkzSmtSMk91V2dZMzZP?=
 =?utf-8?B?SWh5UDVmeUV4b3liWFFhVXFaaldTeHpubC81MTB1NEx6N2VETW1pY2NaaWI2?=
 =?utf-8?B?WGlzSENvYkRPR3ovRHZDVTM5UjV2WUo3ZXdpWjNXT2xwZlMyQ1FMUE90Q2xi?=
 =?utf-8?B?ZEFsVTZOT3F5UlVuMjJpVnNEVHVBMWVWOWhwSHVmRnZ2ODVWb1VyTWNJUWo3?=
 =?utf-8?B?QVNjVGFBN0taZWJJVjFlVDAyNFJnUGRWNVpHVHhxN3BlWFRvSENCV2IyVkZZ?=
 =?utf-8?B?NXNMWFYrbUdjMVpBQ05US0NwZ2RYUUtzVkVjZURmWDkzQTI4MFVKNjM3Tnk2?=
 =?utf-8?B?MEI0aVhMNVVLOTVJNzRETjNkNFFmc2tRYmgyVnpJMUJYdlQrVS9leEZkQ29j?=
 =?utf-8?B?djN5WThZMWUwSFNmVThhS1NJcFg2REg0Y1RRUjZpQXRITkFSSEs2UHMzTlA0?=
 =?utf-8?B?M3ZLQzdKNDZhcThQK0Evdlh0QlVHN2xsOVNneUVqVnRXNUNtSXlNYkxMNE9m?=
 =?utf-8?B?N3hIWmNGcjU1UXp4bVd6TURQVHQzV0ZkcmVKS1ZtT3RBSUFnWFZIN1FNVEtq?=
 =?utf-8?B?ejFoVUtianJWVzZSVHk3YnMzaVE2SklRWmRmb01DVEFRQXNMVlBtVzFuZGZ2?=
 =?utf-8?Q?MiWLPP?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ2PR12MB7943.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(38070700021); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?d29SUVF0cWRsamp2VG5YeWJVZHdFOHVLWWtLK2xpV0paYUlsVWE4cWlrSWlD?=
 =?utf-8?B?NDQzdUx4aGE2ZnRSemhyS2U2T2lKVGkrbkY0RjRQT0RYZlBqblpxc2V6NHZQ?=
 =?utf-8?B?TEw2bk4wdDhGT0NlYWpyK1JSemJnNlNpTUxLUE1vTHNOVnNQWXl2aVk2SGpE?=
 =?utf-8?B?UWNrdTZZcE5Nb1JXLy9BTEx4akxpZXI3UXRrT1YzbTFRTDRRd3ROZXh0Zjh0?=
 =?utf-8?B?bmRrMjljQ01sU0tSWGxWbkg4ZDBNTUQ4c0R0RnB4MERoaEp4azlVMTlST2pZ?=
 =?utf-8?B?YmRYQTNDd3l3TGRLa01yd3NOUmNiem1HZ3NybDdWcmdYYlFHWHpJelFtaVI5?=
 =?utf-8?B?MDZUU0ZUcG1XWkVqNGtaeTZMTEE4Zjh3dnFDZnkxaG5XblMxSzZ0bWgzME5x?=
 =?utf-8?B?ZUJxblR5ZDRtd09RcE9CSVFkZENnZjhiVkFCek9DUkNNcmhFbUlHbHE0WVAx?=
 =?utf-8?B?T0QxYWl3MDl1bWV2MGVRS0I2eVpwdDExL3NKQ1ltQ0ZsMUl6NXZYaEgweFN2?=
 =?utf-8?B?L2haMG5tOGJpbmprM3FaN3hhTmViTUtHMzBDVFJWRDFEdmpKZVlhWCs5emEw?=
 =?utf-8?B?Y2lvSFUyOVhKMFJuT2thNFEraDNZSTNoaHhwMnVoSC9ROW15dStudVVjdGtk?=
 =?utf-8?B?dVpPNkd6OEg2NmYzUG1KTXRpZWp6WldCbnVNbGl6eTJFTnZZdm1nQ2J3cm1Q?=
 =?utf-8?B?ZzdiVDZyOVl2aTlmWVUxeHdlRXZMaWgwUVJsQ0puSmg0MHIrekF6b3NzL2VJ?=
 =?utf-8?B?VVJWclQzbGpURjcxY0ZGYmt6ZjdIeEhOendySHUzdHhxOWRLeTUvUm9pUnRJ?=
 =?utf-8?B?R0tjMFNZbldwdzF5UFVkUVB0QjRldUtlMEl2ZlZINXhhYW1XSCsyN0dGZ2gr?=
 =?utf-8?B?a0gvUExlZnVzemQwYytQU0pjbmswb3Z0TEFyZzBUV2VWRmxqZkJQNHduUmo1?=
 =?utf-8?B?MHZSby92SWpZZ0h4eGdVRm50Y0puRTVDOHB6YVpwYVlrRk5qL2JVemdPbVJy?=
 =?utf-8?B?N0ZtWkRZL05Uamt1MFZ0Qy9ES1lFMzV3eWpjU2hqMHdsZXV5VkxlVENpSnY0?=
 =?utf-8?B?bHBveXIxTHp4NzlJekQyNkRSVUVLTlNCVU15RS9lZ2JXS0VXVm90QXNQY2Vw?=
 =?utf-8?B?dFo1UGc4a1hsZklXTkEzbkdBVzVoN0xTb0psQy8wbGNqQmlaUllYaHdpQXhE?=
 =?utf-8?B?Q25ZWDcwdGpySGlNYjJ5eDhUbU0xL0dYWmdqRWNCVThGMEluNDNaUCtvaVcx?=
 =?utf-8?B?T1hvOG5HZ2hDaGFtdDUxSXN0SkhiQmRNenhDbnhoT1N3dVFPRlE5RE5HSFpx?=
 =?utf-8?B?b3hzZUZGZGVhMVBVckxXZE12eEJhbjRudUtkVlhIOFVNczNTWG9SMkRudzAz?=
 =?utf-8?B?eDgxZUNCcXh5RnpMMENSN0dDTGZ1b2VVSGJXSGp3d1NERTdOS1lqV2FSUnZK?=
 =?utf-8?B?RkRpTFpZSGQ5RWVTbnJVckl6RWpmSWJVR2J1TkdUOThMdmIwRzVCeUpSOWpz?=
 =?utf-8?B?Q29LeWFMUUJwQTArZ050U0xzMjg2TS92NFAwWnQ4SzBra1VVR3MraldFWXM0?=
 =?utf-8?B?dVdUR081a05XNWRsQU0wVTd6Mmpyd1R2dFd2TmgrY256SHgzM0hZUGFCN3lj?=
 =?utf-8?B?YW4veTVCTzVTb3ZaOUpyZ2ZFR201ZWI2NWcxSmZiV0pGblZTUkh3MWtHZVJF?=
 =?utf-8?B?cDE4cW0xaE83T1JuSWNxb01xbzJ3N1JyemF0am9tQ2xZY3ZZa2xwbnp6OStx?=
 =?utf-8?B?U0F0WHVtSmhrUHhONHRwUmxEL1d4QThuOFkzOTNnWDQxcUxHZmEzYVZzTUVt?=
 =?utf-8?B?ZGxlYVNBQ2txKzA2akt5L09ZSGcwZ3ZLYmRkY0F1TTR3Y3lCSVQxNFU2Q1J0?=
 =?utf-8?B?WG4rdkZMclZiSkFGamVWRzZJTTRSMzFwazhWcWk5bEFQaTUwSVBrS3d2K0tn?=
 =?utf-8?B?NFRhQURJQ3RIQkszYnRqOHdTWWRhQis2TGNMUFJYY1Z6cjJqTlNPdWtaMVdG?=
 =?utf-8?B?bitPSFp5VnVtSGJBWTBNc0N6RWpOS2U4a1ZCOUUzSW45RGRIZFBQNGtYMUdQ?=
 =?utf-8?B?UGJrQTVZUStEbUh0MlFwYkl3RWZzRDF6QWZEMWhCRE9SYS9KZWY5K0lsRFlu?=
 =?utf-8?Q?+r1tmlNcqoRvhthhA97eIAPzm?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <108AB0EC0366324F95371831A0017B08@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR12MB7943.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c9b4132a-f178-4f44-c22e-08de272ac5ff
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Nov 2025 05:16:19.6766 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: XxwkBuqt25HR1UFujdrVkQ5vryRT7Xi7qOjQLzHv9Ro3C8znJTKz/2Njyy/gCVlscjvEitYDQzukxA7QK+VvwQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPFABE38415D
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

T24gV2VkLCAyMDI1LTExLTE5IGF0IDExOjUxICswOTAwLCBBbGV4YW5kcmUgQ291cmJvdCB3cm90
ZToNCj4gSSdkIHByZWZlciBpZiB3ZSBjb3VsZCByZWFzb24gaW4gdGVybXMgb2YgZnVuY3Rpb25h
bGl0eSBpbnN0ZWFkIG9mDQo+IHNwZWNpZmljIGNoaXBzZXQgdmVyc2lvbnMuDQoNCklmIHlvdSBj
YW4gZmlndXJlIGl0IG91dCwgSSdkIGJlIGhhcHB5IHRvIGNoYW5nZSB0aGUgY29kZS4gIEkgd2Fz
bid0IGJlaW5nIGxhenkgd2hlbiBJIG1hZGUgdGhpcw0KY29tbWVudDoNCg0KICAvLyBUaGVyZSBh
cmUgdHdvIHZlcnNpb25zIG9mIEJvb3Rlciwgb25lIGZvciBUdXJpbmcvR0ExMDAsIGFuZCBhbm90
aGVyIGZvcg0KICAvLyBHQTEwMisuICBUaGUgZXh0cmFjdGlvbiBvZiB0aGUgSU1FTSBzZWN0aW9u
cyBkaWZmZXJzIGJldHdlZW4gdGhlIHR3bw0KICAvLyB2ZXJzaW9ucy4gIFVuZm9ydHVuYXRlbHks
IHRoZSBmaWxlIG5hbWVzIGFyZSB0aGUgc2FtZSwgYW5kIHRoZSBoZWFkZXJzDQogIC8vIGRvbid0
IGluZGljYXRlIHRoZSB2ZXJzaW9ucy4gIFRoZSBvbmx5IHdheSB0byBkaWZmZXJlbnRpYXRlIGlz
IGJ5IHRoZSBDaGlwc2V0Lg0KDQo+IElJVUMgdGhlIHJlbGV2YW50IGZhY3RvciBpcyB0aGF0IFR1
cmluZy9HQTEwMCBoYXZlIHNvbWUgbm9uLXNlY3VyZQ0KPiBib290bG9hZGVyIGNvZGUgYXMgdGhl
IGVudHJ5IHBvaW50IG9mIGJvb3Rlciwgd2hpY2ggR0ExMDIrIGRvZXNuJ3QNCj4gZmVhdHVyZSBh
cyBpdCBpcyBjYXBhYmxlIG9mIHN0YXJ0aW5nIGluIHNlY3VyZSBtb2RlIGRpcmVjdGx5IChwbGVh
c2UNCj4gY29ycmVjdCBtZSBhcyBteSB1bmRlcnN0YW5kaW5nIGlzIHByb2JhYmx5IGluY29tcGxl
dGUgaWYgbm90IG91dHJpZ2h0DQo+IHdyb25nKS4NCg0KVGhhdCBzb3VuZHMgYWJvdXQgcmlnaHQu
ICBUaGVyZSBhcmUgc2VjdXJlIGFuZCBub24tc2VjdXJlIHNlY3Rpb25zIGluIHRoZSBmaXJtd2Fy
ZSBpbWFnZS4NCg0KPiBXaGF0IGlzIHRoZSBIVyBvciBTVyBmYWN0IHRoYXQgcmVxdWlyZXMgdGhp
cyBvbiBUdXJpbmc/wqANCg0KSSBkb24ndCBrbm93IGhvdyB0byBhbnN3ZXIgdGhhdCBxdWVzdGlv
bi4gIFRoYXQncyBqdXN0IGhvdyBpdCdzIGRvbmUgb24gVHVyaW5nL0dBMTAwLiAgSSB3b3VsZA0K
bmVlZCB0byBzdGFydCBhbiBpbnRlcm5hbCBTbGFjayB0aHJlYWQgdG8gZ2V0IGEgYmV0dGVyIGFu
c3dlciwgYW5kIEkgZG9uJ3QgcmVhbGx5IHNlZSB3aGF0IGl0DQp3b3VsZCBnYWluIHVzLg0KDQo+
IElzIGl0IGxpbmtlZA0KPiB0byB0aGUgZmFjdCB3ZSBuZWVkIHRvIHVzZSBQSU8gZm9yIGl0PyBX
aGF0IEkgd291bGQgbGlrZSB0byBhY2hpZXZlIGlzDQo+IHJlbW92aW5nIG9yIGF0IGxlYXN0IHJl
ZHVjaW5nIHRoZXNlIGNoaXBzZXQgY2hlY2tzIGludG8gb25lIHNpbmdsZQ0KPiBwb2ludCwgd2hp
Y2ggaW4gdGhlIHdvcnN0IGNhc2UgY291bGQgYmUgYSBtZXRob2Qgb2YgYENoaXBzZXRgIHRlbGxp
bmcgdXMNCj4gd2hpY2ggbG9hZGluZyBtZXRob2QgdG8gdXNlLiBCdXQgaWYgd2UgY2FuIGZpbmQg
YSBkaXN0aW5ndWlzaGluZyBmYWN0b3INCj4gaW4gdGhlIHBhcnNlZCBieSB0aGlzIG1ldGhvZCwg
dGhhdCB3b3VsZCBiZSBldmVuIGJldHRlci4NCg0KQm90aCBPcGVuUk0gYW5kIE5vdXZlYXUgdXNl
IHRoZSBjaGlwc2V0IHRvIGdhdGUgb24gaG93IHRvIHBhcnNlIHRoZSBoZWFkZXJzLg0K
