Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AD183C1DEA7
	for <lists+nouveau@lfdr.de>; Thu, 30 Oct 2025 01:31:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D64C10E22A;
	Thu, 30 Oct 2025 00:31:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="JmBBMgJ1";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from CY7PR03CU001.outbound.protection.outlook.com
 (mail-westcentralusazon11010032.outbound.protection.outlook.com
 [40.93.198.32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4436489A86
 for <nouveau@lists.freedesktop.org>; Thu, 30 Oct 2025 00:31:53 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=swFLnN1jPgGOikoXWl07BBdP8P+zfuORSf8vViczueeTUhWQPyG08N93HKvw2EDX7l8Rpu0tjVDTz7Ev3A3cIRzE454dnb5Iuvbu91eVvMpajuec3ztEuakfRpSE/+LUO0doiMQ7L3rM0OQPOaCQGgzHTMpfNPp9iAgz4Y/3Jgy1Z7IbBOg0i8MMRYzn7NME3ppBeq/QdGufvjeiPbYRB/y6NQUxYYCuDMH6W4z0WfFP/F3oi42ilCqjQSGMrxuENORGAHCrwjU9+68NBYN+ROhgrzFiBKdsHbpZx7vrtx3/CCfN0r85SnIDVradFJyclOGTF0DeABjj2C2fz8t8eQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/fDJOrPcxYobQvFOI14GPmazblowwEieKHjtOK3oPA0=;
 b=IduJXf9xxZd1q+LedtjMAsR41g41MtU4GFxW4ovM+LVZslkr3+NnE8egFpFdiC0ngHoFmVjaLoB0pGQ/FdY1Zo+oGX3slK3aSstjFdM9oGrspDWmiN47FO+RApnVpk4sO1Az/OLz41A2ULdSdmxBZhjsQH+rm9lnFxzFhUK4b8UJDPw/lc3EMz2b+Su6HQOFlTXxF+tZCWwperZQaXw45CDPnQ2YlGnclii61e+e6hHqDSF2nEQVIleJ7JC1Q0Svjpfxvinm3CZrGm8LbItgTfsPLdlWg/mFEtxsjGJG0zDU2eCWuHfzyqcoJ+bP3vqpNdESLh47X8K/B+CnVbI6PA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/fDJOrPcxYobQvFOI14GPmazblowwEieKHjtOK3oPA0=;
 b=JmBBMgJ1fGqEIim+xuh7+be/w/XhP2ZtGZKHGVV+lwkie1maRPYC2vd8j/s2mpvdiUm/ajkicnr+tXqQSs3Syd2sx9IZ9/9aFco9t4TNgcdnnBn+83h8vvCUSHflzZGYt5R4pWF8Bm4+3TkTeJlxSriO4x2mzNoOcZIKh7LX+377ynUJqxtkZ8noO7WfKKDo99sulep+dzw/JJEvNi9zNYtGbO1tZ6JZ/YWbRoUywX3djQPzoe0ZS/sL6W0nOD+tOa/IQO5FectUr1OOUNJQK1le3INSNSDHjIJVb3XjSCrmhdFGREBbBR8QPXVk+ok18lPGuM5Xur/cLhr6u1Y2UQ==
Received: from CY5PR12MB6526.namprd12.prod.outlook.com (2603:10b6:930:31::20)
 by MW3PR12MB4476.namprd12.prod.outlook.com (2603:10b6:303:2d::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.13; Thu, 30 Oct
 2025 00:31:49 +0000
Received: from CY5PR12MB6526.namprd12.prod.outlook.com
 ([fe80::d620:1806:4b87:6056]) by CY5PR12MB6526.namprd12.prod.outlook.com
 ([fe80::d620:1806:4b87:6056%3]) with mapi id 15.20.9275.013; Thu, 30 Oct 2025
 00:31:49 +0000
From: Timur Tabi <ttabi@nvidia.com>
To: "dakr@kernel.org" <dakr@kernel.org>, John Hubbard <jhubbard@nvidia.com>
CC: Alexandre Courbot <acourbot@nvidia.com>, "lossin@kernel.org"
 <lossin@kernel.org>, "a.hindborg@kernel.org" <a.hindborg@kernel.org>,
 "boqun.feng@gmail.com" <boqun.feng@gmail.com>, "aliceryhl@google.com"
 <aliceryhl@google.com>, Zhi Wang <zhiw@nvidia.com>, "simona@ffwll.ch"
 <simona@ffwll.ch>, "alex.gaynor@gmail.com" <alex.gaynor@gmail.com>,
 "ojeda@kernel.org" <ojeda@kernel.org>, "tmgross@umich.edu"
 <tmgross@umich.edu>, "nouveau@lists.freedesktop.org"
 <nouveau@lists.freedesktop.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "rust-for-linux@vger.kernel.org"
 <rust-for-linux@vger.kernel.org>, "bjorn3_gh@protonmail.com"
 <bjorn3_gh@protonmail.com>, Edwin Peer <epeer@nvidia.com>,
 "airlied@gmail.com" <airlied@gmail.com>, Joel Fernandes
 <joelagnelf@nvidia.com>, "bhelgaas@google.com" <bhelgaas@google.com>,
 "gary@garyguo.net" <gary@garyguo.net>, Alistair Popple <apopple@nvidia.com>
Subject: Re: [PATCH v3 2/2] gpu: nova-core: add boot42 support for next-gen
 GPUs
Thread-Topic: [PATCH v3 2/2] gpu: nova-core: add boot42 support for next-gen
 GPUs
Thread-Index: AQHcSICfwqqVMX2fo0egTMdmm17vE7TY/MCAgADaswCAAACzAA==
Date: Thu, 30 Oct 2025 00:31:49 +0000
Message-ID: <72be0fbab026191152154b1f04a45b32dfeb402d.camel@nvidia.com>
References: <20251029030332.514358-1-jhubbard@nvidia.com>
 <20251029030332.514358-3-jhubbard@nvidia.com>
 <DDURPPIWWIA7.27RFSM7KRLN7I@kernel.org>
 <a24876cd-1a41-488f-968f-38d2ebebdd39@nvidia.com>
In-Reply-To: <a24876cd-1a41-488f-968f-38d2ebebdd39@nvidia.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.56.2-4 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY5PR12MB6526:EE_|MW3PR12MB4476:EE_
x-ms-office365-filtering-correlation-id: 1f1cc4fd-788a-4304-d36e-08de174bb6f2
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|7416014|366016|376014|1800799024|38070700021; 
x-microsoft-antispam-message-info: =?utf-8?B?ZThiQlVCa2pzY0lLYzhSSWZBb3ZYZWlDZDJOMVVWMnhyYmRjRjVpcmZuUnhX?=
 =?utf-8?B?YVY1M1EwemdIVTNycHBGNGg1N0hTbGZuWEFCbjQ4TVk5dHlDTXlmTlRyVU5v?=
 =?utf-8?B?cVROZnA5NkRDMFpkWElWam5VL2tVeWJzZHc4MkdKR1l4UXViU3pRbEloVGdv?=
 =?utf-8?B?ZVo0R2NrVU96bDBQOWJHNEhxRFQwSmtUVEJGc1hRY0VqUzhjUXh3R3VVbDgr?=
 =?utf-8?B?UU9ybVVuR2hXSUdoSkprQmVRSC9jQ1lLSmpnUStTVnBrMkFrYktYTmY5VTN3?=
 =?utf-8?B?NHZKd2hKRGRmTHlEZDdEM1lkcFM1ellKdnhlREFuZ0hZRHNNTVNyTjQvemJX?=
 =?utf-8?B?bm16RmlSY0dXakJ3bVZVVlhZdVVyQXZad0wzY2N3QUZMUHcrSkFGdUZiaExC?=
 =?utf-8?B?LzdMVXZ2YmdPK3NSOVpCMVRRUjJMNTFEVWUxcWEwRk1VZWEzOWJIRHAzN3V5?=
 =?utf-8?B?dFE0MDcyaGg5N3BDMXNPWFRaVXBURHkzTE5DRGdENzkzcVJ5WnRCQnZDOVZR?=
 =?utf-8?B?bHc1QVdveXhVcXVjUmxnN1Arbnd4VEVUUkUzbm9FNU5Vdk1QVytUR1NYd2FI?=
 =?utf-8?B?Wm9hWDcrWVZiSFhzSjFiZnVSazIxUDZqZ0VQbzNwZDRMUUo4cERQRUxTeEZi?=
 =?utf-8?B?Ykx1MjZOWDJQREJNWFBNQWo0dkFCTVV5ZUJYUEd5eFdVdkFMRktnaHowWTdW?=
 =?utf-8?B?Z3ZpZjVHRXZXbVhlaVFWcU9yTDI4T05GRU43V0lUVXh1bVgrWlplL3NDT1RR?=
 =?utf-8?B?T1VFdmgxaklDNXlhQk5xTm5nNFRFY3lHdUVTYlIzc0J6MkhQQjIzVzFxMnE5?=
 =?utf-8?B?cEVKZWVQd1YvMUF4K3NUZjdnbjE4RURDRUxIcytJVE5PYWVTQmN2N0JLNExn?=
 =?utf-8?B?ZUtZNjgxR3FSSzRtYk91NjBzNnpKdUtKMkp5Z3hUdFNmMU9oMlkwejBZR0Y5?=
 =?utf-8?B?MWhxNDdjaXlFWFlwdjBwVkd1bWszcnFBMG16WS9FUHVmaHZaRW5RdWk1T1k2?=
 =?utf-8?B?MkpTOFBOZzdpaGRKZEFMV2NqaEFaS3Nsa1B3NmtTd3M4OFRDSUxIbWRRQmdX?=
 =?utf-8?B?Yk5yVWNXTy9IZ0R3NTdLMHB5blhNSVNoTHMrbWg3eUtkTi9NbG0xUGtweUxY?=
 =?utf-8?B?TjVVcFlqd3RDQUIvb0NvNThoeThnNGM1ZjBsMzdlMVM5WVJqQitLeEJvUEhz?=
 =?utf-8?B?Vy83SUZpZm9EQ2dFaURza28zdTJyWnJpVHdISlY5Q2RBTFFaeE5EdUxERk9V?=
 =?utf-8?B?NlZ5NTFWcmVrcTRieXdrY28rcnhXUmJaMHhJWC9INHVNVHlqMDdKdnpKbW1a?=
 =?utf-8?B?T2puYzlyRGZvdFNEeXF2K0RoaGJRenBwSU8vOUpOd0c5UXM1Zjg0TC8wV3Bw?=
 =?utf-8?B?Q0pPZHlJV01oOWc1bGVIRmxWbEt5TE1YMlhQUUNvTnFRcmJzNm9OSnhFNVBr?=
 =?utf-8?B?ckJUOHg0cC9IemNrZXV2bS92aE1JMU5OWEVjL3VNeVRFc0JtZVhEb0FkQW1Y?=
 =?utf-8?B?VnBCQWVmZFlENFpvVGg1MHZlaUFCajlCa2hxcDB3MFViM2taeUpSTWhJMXVx?=
 =?utf-8?B?ZGNyTVlYczE0MlN3b3lZeUU3MElGdVIwZVUzT1BKV2lxUUlKNU9EbkQzdzNL?=
 =?utf-8?B?SW9MbTI3cktseG9kNXV4K0pOdG9wQkR3MVNJcnUyb0NyYS9VMUEybWVpYWc0?=
 =?utf-8?B?MGZUTjBMUjBHR0JsNkdRWU9MNGlNZm1PWnI5eFJPRnNzTkNnV1VzSEZuYmFj?=
 =?utf-8?B?ekR3MndYcTdhSG1KdmZ2U2kyYXErN2tFVWZEWmRlTXRKNFhlc3lPcklQV3ZY?=
 =?utf-8?B?SEtjdlUycXdYeWplcTl1bTlXS2dCMTh4MzhZTmNva3daQlloVjNBYXNZbzh2?=
 =?utf-8?B?a1NuZkh0QUx1b1NWZ0NHYUMvYlhMeDV4SnhUckd0eCt1MHJlRkJwOUZaVElB?=
 =?utf-8?B?ZnVkZndudndYdkxKT3hWNkF0dXJsa0NkclBZSG82bEo1ZDhoOURIM1RzYlBo?=
 =?utf-8?B?YXJJdFFQWmpKWmVIRXg5SUkxTEh0OWQrUVVXT2pHUEJDS1p4V1RrQ3FUZ1h6?=
 =?utf-8?Q?tZDaOz?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR12MB6526.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(366016)(376014)(1800799024)(38070700021); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?U0t1SExobFE5WC9NU3hXRzNXUmNVT2ZCSTQzVFpKR1o0TTBrcVJpckhHV2NG?=
 =?utf-8?B?TGEySjVsUXNTaVFwNmRlNGRGS3lHNGxSVDdxZkFCcDY2d29IMVEwcFNBM3R6?=
 =?utf-8?B?MzV4VGRmSkdLbDdzNDBCYnhYUnZnbkt0dDdKcHF5ZFg2c3pSTUpXVDNiZ0ha?=
 =?utf-8?B?QldNY1dQRHhRb2ljSXJBR1dCVzNZWlh4eEYxdkhpRllBZjl0dzlmWjI1bGJ6?=
 =?utf-8?B?ajRuQnlwQTFqS2xuRzNMaGR1ZTRHWk04US8ycUt4NWlRRGJ4dHZKM1djQmdE?=
 =?utf-8?B?QUZBOGdBelhka1VCQ1VFYmtNRDRXZyszZTkrNXFLNHFnVjJSMW0xdTRFenBT?=
 =?utf-8?B?ZksyN0xzWUhESGlUSTNvVCtCTi9XSXNsSU5pUzByZ01iMzdIZlYyQnZvK01I?=
 =?utf-8?B?R2hFZlhnU1lZZGxhanJPeVo5M2FTVUZ6TlNCekNhNVJzVk1iVHpoNW1LdFJx?=
 =?utf-8?B?LzZ3NmhXY3VzN1pVOExDQzdMamNJeVJJVzBqVEVJalFIWEZGb1RnbGZweUpn?=
 =?utf-8?B?aVFVbWVTN015dStWcDlBTzNaWWMvYTJoYkgya29jSzZIM1p2YW4wSUlnejJQ?=
 =?utf-8?B?dXVlTlJHbHZrbU12Sm5tejZzMVdXTVV6OXpzQ0xYblRNZ2p6c1lBV3BPN2du?=
 =?utf-8?B?ZEI3ZmIxVlVmNzF3WDFGL2xaaUdINnlxTWI3T0U0WHorWXJoNDM4TUkvN3lp?=
 =?utf-8?B?SVJ3K0FwMUxIcVl0L2xERUZpTzNFMXB5L2ErRWRLWVhBWGJPNUZYNmtic2Jz?=
 =?utf-8?B?d3gyYmdmQXdzKzVVT1hiVlY3aUUyNnhlK3F0WkQ4Y3lkbDRLcDZzK2xkSFMy?=
 =?utf-8?B?VmtUN1ZTellEd0pQaGdPdjU0TjZvMCt4ZVk2MVg4MStSNXBWUmJkcE9zUkw1?=
 =?utf-8?B?UWs5eWVZY1NWUlplcTZ2d3JMQjdyT2pURG9DRW8wWkJ5S3pLbjhVazVSTjVY?=
 =?utf-8?B?cHhqVzdzRFV3ZWtEWnlYaXhzbkhPd05xeVllQjlRa0YzSURhLzFEWHNKZERW?=
 =?utf-8?B?cThCbEdJcmpUcXBycDF0OUpwbnJNekc4TnM4UHNzLzRweS9pa0JoUWdFUHF5?=
 =?utf-8?B?dVkzV2xkSE1PNmdIS1lnZnhFN2xWY0huc2hlMHg4WGhRY1NUUmFzTmJWVzVY?=
 =?utf-8?B?alIvSFNQNkRCdHh5M1hweERQZnpSQmNYejRjd0U5dWRMNE5ZWldpdmpTNFpD?=
 =?utf-8?B?TFE1L1ZCZkxqZlZNbGlYMXJhVU1zNXlSK2pwa1lBU2lnaWVBanpqR0h2ZWtl?=
 =?utf-8?B?K2JwSTBPelhoQ0cvSUNEamxwRElvbmIvN1haaGJyRVhnbjE5WnJJSjZyalN3?=
 =?utf-8?B?QTE3bVprcDhVU0MvR3JrVVNsL2RBdHNwbDgyWm9YM01yc200MWVQSVltb3M2?=
 =?utf-8?B?QThuTkk3UWNUc1hwSkFXaityV3UrMXRNeWg1czF4cDhrSTBHdGtxWUVmSGhy?=
 =?utf-8?B?ajIzTlZtUCtSS0lBbm5Cc2Q4TG9iS2NFdGNtMENpVXdzSmluZEVVaFMySnIr?=
 =?utf-8?B?NFo2ZkRPYTRxVUlTK2RQRmdOaEVVNDhTdkxsWEVmbVNJYThqMzMwSzJNUk5J?=
 =?utf-8?B?VUNybnFpNjFGbmlBeWlOK09FdDJqTkh6ZGNneGlpMFkrQmdxNEkxblNGRXNU?=
 =?utf-8?B?N3EyRmVXTHlFVlJGNUlnaXJXaVBrT3RiZCt1ODZjTVJOSEtpMmVNdmw3eHMw?=
 =?utf-8?B?UnhIRVRINjJVYUp0R2NHZVFzenV4NHVTc2pNQytORWcxMjMwWTZtYnlNV3dL?=
 =?utf-8?B?L2dubkF1Y0JNQ0dBV2RmaXZFZW4vckMxOHdOT0tBSzdrb0VkcTM2Q0kvc1hw?=
 =?utf-8?B?TXJ5R096T1pqNCtxMGZhdUxkUjgwclU3SFNYZnlKejl3Qjk5N29UMzJwejhU?=
 =?utf-8?B?Y2xXUjdKQmUrSGMweVgzWGZYWSs0L2NaNVhwS0pJSWVrbE1jRCs5ZjFQV3dP?=
 =?utf-8?B?VFpob0F6Zkpib2xObXIvelN3NDlZSjRiaG0rZExkTCt6ZHhuVXQybFJER0VM?=
 =?utf-8?B?T1FlOEU4NHlaVGM1end5UUJBYWtuYWNMQktrSGNqZzcxaHkvSWsreDJyRHNq?=
 =?utf-8?B?SHNiaFJqZm9VRCtmWkZFbVk2a0hwQnpIRWpPdFhaZVdqeHhZT2ZYd0NqVG9P?=
 =?utf-8?Q?o8J2znwFz1Ag22V9YMIzSm4gn?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <3BBB6A6E8176D441BAF06D53730CB599@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY5PR12MB6526.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1f1cc4fd-788a-4304-d36e-08de174bb6f2
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Oct 2025 00:31:49.2446 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: T8/wr6tvpIBcjXmhMfriWiEuxqOfzX0cv75ahs4tbXHg9KIqfTwqKcBuf7ktoH3FcJwTSD6k8e1c3jb5uEVMOA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR12MB4476
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

T24gV2VkLCAyMDI1LTEwLTI5IGF0IDE3OjI5IC0wNzAwLCBKb2huIEh1YmJhcmQgd3JvdGU6DQo+
IFRoYXQsIGNvbWJpbmVkIHdpdGggVGltdXIncyBjb21tZW50LCBtYWRlIG1lIHJlYWxpemUgdGhh
dCAuaXNfbmV4dF9nZW4oKQ0KPiBjYW4gYmUgbWFkZSByZWxpYWJsZSBlbm91Z2ggdGhhdCB3ZSBk
b24ndCBldmVuIG5lZWQgaXNfbnYwNCgpIGF0IGFsbC4NCg0KUGxlYXNlLCBub3QgIm5leHQgZ2Vu
Ii4gIFRlY2huaWNhbGx5IHNwZWFraW5nLCBCT09UNDIgaXMgImN1cnJlbnQgZ2VuIiBhbmQgQk9P
VDAgaXMgImxhc3QgZ2VuIi4NCg0KQW5kIHRoaXMgYWxsIGFzc3VtZXMgdGhhdCBCT09UNDIgd29u
J3QgYmUgcmVwbGFjZWQgYnkgc29tZXRoaW5nIGV2ZW4gYmlnZ2VyIGZvcg0KQmxhY2t3ZWxsKysr
KysrKysrKysuDQo=
