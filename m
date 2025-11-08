Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DDC4EC42C0A
	for <lists+nouveau@lfdr.de>; Sat, 08 Nov 2025 12:42:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 43546890FE;
	Sat,  8 Nov 2025 11:42:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="QyVWqd+/";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from SA9PR02CU001.outbound.protection.outlook.com
 (mail-southcentralusazon11013056.outbound.protection.outlook.com
 [40.93.196.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D1F1890FE;
 Sat,  8 Nov 2025 11:42:05 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iInxSi2mPnEUOwVf+2paSocpZS+EdaCSR91YrylFkRYkrsHuFUhMk1k2iCmD9iP0DnPZtr1jTCmBpWEg+8c2sfXqF9IOlQgriHrVjW02m99HN2M2dGQQH24DN/KA5Hcbkrh1Xf8uO2h1an2149YUQAxkZE4uNuJQsu3+TtQhOrCQpGLvVIVYCbz7pubOkZPYiB/3yNMKob7dGst5Ko22+WsUvOjHqiqBZxcKKNHJglgh51kqyG84H9KtQHsEUAu18vF3uAl5g+Ov2BbzO0T/B4L6uuu2b+L7S+A7KfKruiarzx5Fj96Je4a/X5pV+pbG6htKK820IYYlZLBRgLhrlw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sUP1/coZAuAyVS2VnTK79AAAh3aJL0EpxIiKVYfSfVY=;
 b=GlHOdBViHDMeaCQf7GH+wg5Q+urvAAeVVuWgyi6ftyL6tSYTXX0MRbOVzbs3cPOZ5c4nUOhUH5zm/YMB4anzZqTIwzuKECfsryds9qrjyXdKxNgvcjnAKibVaXgtYDxo+GKmgqz8Z6ZZ4cIt2uR0JzCvE+p1UA8e+/wSDEpOUmbCn2PLog4peBJ2nPxlO29psNHIorqn+HEAnyT9QXP4PKvUdsXgSZDg5W5Rpvtm0zUEn96tnr/DVhou7uvEskvM49q+lzMF5XG1VKF7Jaw6e7RFpZneLfCnLb0X41JWn/aa0fY4wSU5z8eSc2CDootBapIKwZwHIZ6/pFVWtwiLYA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sUP1/coZAuAyVS2VnTK79AAAh3aJL0EpxIiKVYfSfVY=;
 b=QyVWqd+/9975D0E7UPwfsi9LG/7R99mI0TtGmAti1nigTUwvDHWLN/nrXhCviOAsgwN4+d1NrgL1mYCmeq1xve/1mhiaO/XbBF5slRDgQVnLjELSaIJTXIlm8Wa5cffQqI8Yuq+LETdEcXwvp5YBfHZe9QDUd9Do/ZKn/QXSLanzrIjWIczzNqv9he7hgPsenvZGaMZpOlOyGkJv8pzoovK6l2d5t8KvBmdXIzaVyrvwYZW2fvqd+LyscmxaPf3FPvJZ/2wWU4Zou3kyQu79C5ypTgNkcLAIEh+EKocMpRw6T2jbgt0VsDOWjX1mBPOTJntbXEuUsEIPCEFBvBljgA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by DS0PR12MB8574.namprd12.prod.outlook.com (2603:10b6:8:166::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.13; Sat, 8 Nov
 2025 11:42:02 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9298.012; Sat, 8 Nov 2025
 11:42:01 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 08 Nov 2025 20:41:57 +0900
Message-Id: <DE3AAYKKI0HN.2QTWD76BN3LMO@nvidia.com>
Cc: "Alexandre Courbot" <acourbot@nvidia.com>, "lossin@kernel.org"
 <lossin@kernel.org>, "a.hindborg@kernel.org" <a.hindborg@kernel.org>,
 "boqun.feng@gmail.com" <boqun.feng@gmail.com>, "aliceryhl@google.com"
 <aliceryhl@google.com>, "Zhi Wang" <zhiw@nvidia.com>, "simona@ffwll.ch"
 <simona@ffwll.ch>, "alex.gaynor@gmail.com" <alex.gaynor@gmail.com>,
 "ojeda@kernel.org" <ojeda@kernel.org>, "tmgross@umich.edu"
 <tmgross@umich.edu>, "nouveau@lists.freedesktop.org"
 <nouveau@lists.freedesktop.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "rust-for-linux@vger.kernel.org"
 <rust-for-linux@vger.kernel.org>, "bjorn3_gh@protonmail.com"
 <bjorn3_gh@protonmail.com>, "Edwin Peer" <epeer@nvidia.com>,
 "airlied@gmail.com" <airlied@gmail.com>, "Joel Fernandes"
 <joelagnelf@nvidia.com>, "bhelgaas@google.com" <bhelgaas@google.com>,
 "gary@garyguo.net" <gary@garyguo.net>, "Alistair Popple"
 <apopple@nvidia.com>, "Nouveau" <nouveau-bounces@lists.freedesktop.org>
Subject: Re: [PATCH v6 1/4] gpu: nova-core: implement Display for Spec
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "John Hubbard" <jhubbard@nvidia.com>, "Timur Tabi" <ttabi@nvidia.com>,
 "dakr@kernel.org" <dakr@kernel.org>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20251108043945.571266-1-jhubbard@nvidia.com>
 <20251108043945.571266-2-jhubbard@nvidia.com>
 <673640f6b26617bc5e1f4962bc2f9f7257346efb.camel@nvidia.com>
 <46c4877e-2af3-440b-b8c5-fa9078a5cf9c@nvidia.com>
In-Reply-To: <46c4877e-2af3-440b-b8c5-fa9078a5cf9c@nvidia.com>
X-ClientProxiedBy: TYCP286CA0185.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:382::20) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|DS0PR12MB8574:EE_
X-MS-Office365-Filtering-Correlation-Id: 281e7ce6-19bf-4f21-ac86-08de1ebbd4e0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|7416014|376014|10070799003|1800799024|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?UDVGaC9HYTlCeGZIUXM4a3hXK1N0cGpXUjFKTm12bjdFVDRQTnVJRGtUUlI5?=
 =?utf-8?B?eWNRdkFxZ2JXeGxUR3ljZmhmbnlHeDVpMjZWVFZvSzVBNHBNMm9IK2RiRGJE?=
 =?utf-8?B?Tzkxd1pTdWlaY24rVzZKT2I1WXN6MzNsSGVCL0JrWktuVzQxZTFpRXNGZFQr?=
 =?utf-8?B?eEl4WHB5alVyR3lEL3pWYkJ0ZkpRY2dFRHFsOWFPV2dtUzNLd2tEcW5Qdjlq?=
 =?utf-8?B?T3VnMUtIbGJXeFBKaTM0VXR6UHZjVVhsazI0V01zZXlXYldLSGtHTWFPK2tS?=
 =?utf-8?B?d3gyZUJIc2VqLzQ2Wlkvd012K1QwelN2U0puczVDd2ZScEpDalQvN0RXREJn?=
 =?utf-8?B?RUN3Y3QzZWtjc1pnVHN2Z2FVMVdHeG5Qam1NYjZoZUE5ckl0NDZZdGxMKzN4?=
 =?utf-8?B?NW5OcEZhMnpUd0l6WUx5ekMyeVVLZC82eU5NVlNlOUovSnBOQUFVcmMvVHYx?=
 =?utf-8?B?V2tLTjFEb3hwMjUzQ0c5U1F4NUVqTFpHeDMwQ1lWSnhRMzVLTTU5UjlyakR3?=
 =?utf-8?B?VHprT1Y0WWdGWlYxS3BOS0IwM0ZETEZ2SFJVWW0wajJnNDV1b0hZNU9EOUs3?=
 =?utf-8?B?a2M1VUlzMU5xSHlxN0VDM0dNWTRKS3ZVbFRPczgyNVNUcXZpTWQwZHpHQTBz?=
 =?utf-8?B?bldKdVdIK0N2cXZDd2orbnZScDZLZjhhNUhMblRMVW1ZUUFlWDZsTWNFMXhW?=
 =?utf-8?B?VE1JdlpqN25idmwzVGRvMDFIcFdNd3ZpNit0aG1XRXhsaFo1VlF4VVhLWjFh?=
 =?utf-8?B?RUNOVkZxK0pxcjJ3TEJCYnJYU0lPZmZDZ0FnMmJUV1NKU2hGNmVYVFRsOXhu?=
 =?utf-8?B?am4raTVvcUcyMzVJTmREQ1dzdkF3Tm10WVZ1SlV0T3dZOUtJQ0hhSkR1RFg2?=
 =?utf-8?B?aUZuR1h3VDlDczFVcGNBck1lbkwxSS9VVnBGOTVGTVV6cE9LWVczNW8vUUpB?=
 =?utf-8?B?V2pQWjBxWUhzNHBaMFVwZ3NCOVNaNFBHVCtOdURJSXNGZFdqS2pVS201TW1j?=
 =?utf-8?B?NndTSkFZVHFPTDIzTGdkZHJLZVFIeXcvc3h3NVdORVU2YktBQ0ZQelZLcHlr?=
 =?utf-8?B?V2xtVndjSVBSZ0ZLYVNlcHBlSHpwY2pnemkvMDNyVXZmQlpxcGlkYXdtU3ZS?=
 =?utf-8?B?RVYxQ2hoemdDNGRNcVAwdXBQNGxIYnBIb0dMRjA0aUdYcG9NUUNqU2xEeUxR?=
 =?utf-8?B?TmM2aWRUa01Xa1RnY3pZaGx3bDJpK0YzMytQZW11cEZxU1NLeGRjYXBMcHVv?=
 =?utf-8?B?eUZwWmRRdXdVTnJDN1h5bnNGemw1a0F0NkhQVWtldXBpYzFjWjZ5Mi9sSytH?=
 =?utf-8?B?TERhTGhDZlVqZ1pKV2Q3WG1NSUpxSWV6MTcxSjE5WkhvS01xYnZzNHlITzhS?=
 =?utf-8?B?cmNIZnh0NkhBdHFaSzNtcHZublFPRm12RHlEeEgrK0FvUVdjYVNPazY1Sklv?=
 =?utf-8?B?VjJWNTIzMlNqVWsxMDc5RkZwTFUyYk1XY3c1bnNFczFOTnZ5RnJVNHkwN3BQ?=
 =?utf-8?B?SzlzWVlwUlhzWU5mWlpWOCtMdXNjNEQwZmlVTVBRamd6c2VvQzQvdHBBdHMr?=
 =?utf-8?B?Y0s3Y2M4cTdDVTB4UkY4YmI3RkZoUXVRYldDTDVrTGl3VEJjaTNvTGxjeWlh?=
 =?utf-8?B?OWUwSk5LaG9jNFVCVi9mTFNVcXZKZW9jWUMvTVhQZWovTHl3elVMYzZkcXJN?=
 =?utf-8?B?N3B4NDMrWGhZb01yUlhMcHc5TmZlVDBBMWtpN3FWMW85RTRxQ0p1SjA2d0dU?=
 =?utf-8?B?cGRyTEFHeFpDdk82aEdadXhORWorc1VpYkJ6Rk1xK01JWVk4eU9NbDZJN3pl?=
 =?utf-8?B?M3l3M3hDbmRRSG1DbWVaVUhlZFlwZ2kxRjdDb29lZkRPNTI0SWR3RGpyaDBl?=
 =?utf-8?B?ZEJ2eFVzUFFnT2NyN1BTeHpMaDVPclh2Q3hOVGgyQ1pwK2FBVEdkajVXQUdI?=
 =?utf-8?Q?6c7tLyHfXbto0SLOE1mbDQoNLKYlA6cM?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(7416014)(376014)(10070799003)(1800799024)(7053199007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?U2RKQldqWUZFU2tWdkhLSlhXN0xHM0xvRy9wV3dNWWppS0d5NTRWTzhhWkZM?=
 =?utf-8?B?VzIzSmRvaWdweTZKSWUvYkd4RlhhWTlNcjJZRlI3NUNKcENSQ3dBa1IwcnFh?=
 =?utf-8?B?S2tkWHE5cE5Jb1p4OXFHd2xHVzMxM1dhQ1JodERRNDNGUkQ4VUpvVENxOVZL?=
 =?utf-8?B?cXNEQnI3eUg3NE84REtMR0pNbW04UFp1dWoxbGZ6MTZiVStnM1gzOEl0TVJ4?=
 =?utf-8?B?TWpKUnVoZFgrTlNIV21PRzJRbUZKZ2p2NWZNK1J6OWgyMkphVEhLcVFBMkxE?=
 =?utf-8?B?TmllcUNHdVdxNjV2Qzc0WnQ2bGZ1NmROdjNZZkhMWDZUMy9WZVI3dGdCQW1E?=
 =?utf-8?B?bjFRY0JFcU9pZGxucUNjQUFoQm1uREgvWTUxQkVVc054UUZOT1A3aEpXa1Mw?=
 =?utf-8?B?ejJpc2VaaFB4SFYwd3l4VDV1NzVPTkJvajdhSHpMd1RWL3hXSmdCa1RqRXVw?=
 =?utf-8?B?ZlZQYUdXNW1vcFVjUkJGalhwSmZkMHkreUwxclJYQXBNMXRMSVpTdFd5SWpj?=
 =?utf-8?B?RXNnZmdYUkxQUGNKYmZGUndsSTZQK21MbFNOeEdkNVhqQ2R6UTlPejV1Rllr?=
 =?utf-8?B?eWxDeVpGYW5vRTZBQ0dPUkFPVGp5Z3RFNW9SSXVGaWtYMmJpRUhweDJlMUtD?=
 =?utf-8?B?MllUbTZSVHVJcUhIVnRrZHpiMWI0aENLS21HQTRFVG4vY3Y0NjNwRE5uclFD?=
 =?utf-8?B?cUoyZUFzV1dVTFQ1V1FXVDNZRGFhVjhVMElRSElZSW1xVWVnYXJVUlJHcGIw?=
 =?utf-8?B?R3pja2c1VjN4aGlTc0tScjc2T2FVTHlhNVJIUUJRU2EzdWNZWTl0T1liVWZQ?=
 =?utf-8?B?cmh2TTNZeGNMMWFFbmc4NmJUU212R2RmTHZCenQvOXQydE9Ic3VQMEM2M0hO?=
 =?utf-8?B?S2xMWjkvdnBma29MOVE4R1hmemMzQXZmalh2akJyUlBIMWF2U0VQWlhHVjZs?=
 =?utf-8?B?Ui91Y1pkMDFaMWd0dU9PUytTMmRhODdxOHBraVFlY0MyUFZ2TWxBNkZGOWps?=
 =?utf-8?B?czBzTE5iTjVJYkRpWitWWnk0QU1nQnlMbHlCZzhvUENWeEhLaHBNdzYreW9s?=
 =?utf-8?B?ZEdzK2c1aHFpSWJTaHNJZW95V3VjSTI3b0tmZUxGYWxqNm1KenNBQlZWbkty?=
 =?utf-8?B?NjMvMk9zdy9TajZXRWFqZTlaSDVIM3BiOEhYZS9QTG5YRWtvUGwzTmhBdjlC?=
 =?utf-8?B?NHdWSWdXeHNJRFZockl3MThhTkgwYjFjNitVVjBQdkFKeEc3cmJWMWhTbzZn?=
 =?utf-8?B?b3NSZlkrWXNjWit3bGFWNDBYRXZqTFNYdEs4Vm9pTHlqM3V1QlVXZk91QkxO?=
 =?utf-8?B?YTNJT29WYTFVcGVzckdFdXYyM2pGQktMZDQwUGU1Z1RIRGsrNmc4R1FlRUYv?=
 =?utf-8?B?Z0VQaGRvM1pMOElrWnJZTDVFK0tET1A5RUx6OWhrWkdGV0pER0hnczg5Z0o4?=
 =?utf-8?B?ZzlCZUgvYlg5THVoaGVqSk9DaGdkL1V0aFZLY3pRdXZ5SmFXWlZ0TVJaVkZ5?=
 =?utf-8?B?RGt5cVVxNktVNDc2UVU4SjVjcW55cXZSYnM4dUhleUVWdGc1cTNiMmlNbFov?=
 =?utf-8?B?SUE3djM0MXlianFtUjMweGVZRVp6Yy9UbURUSFphcmxteFhTUTQ3ZDFEUlhV?=
 =?utf-8?B?M0wzL1JFUGZwanRFYlNRV3g5d1ZrNWl5MnR6cjFyamV3WDZsOExoU3ZWZDh5?=
 =?utf-8?B?TVJTdW92SVZNYm5mUHlRUkMwc2tDUU4xSERCWUd3WXZUTXlUZVpqb05DVDAr?=
 =?utf-8?B?U0lrK0YzdElmVjVSYlBnaldEdGJaSWhXcTk1QmhCdCszYmNMMTlHQjRhTk9G?=
 =?utf-8?B?aEFycGZseHp6cEkyK0gzakIwazJxbWxwOWQzYi9KWi90eXl3aTI1Q3YraXJr?=
 =?utf-8?B?ajZzOTFqWVAvc2dsdWt5T0s5OHR1VjdLekg4c2ZNTlN3K1JwSXFHMmFEWHo0?=
 =?utf-8?B?bk9pTWgzS01iS0hVRWNrN3N5Tjc4U1JmT0pYb0lRV0tMdkszQ3FvcWllaUdL?=
 =?utf-8?B?YW9zNk40NEt3N1JlTnluMjA2eUlsVHN5WU5ycVlmUlphcG8vV3k3QTZWYVlV?=
 =?utf-8?B?Vlk4VFlQK1ZOTWdPbHRuTmw3ZGZxZ2RGZVJDditwUzFiSXYwazNFZWtaVzlG?=
 =?utf-8?B?VG03QjhnUkxCdk9rcGFKQlJBOXA4NnRWMVVDOWxybWxRMWk1dlhaWDFWMVYv?=
 =?utf-8?Q?9dzGsR+vYDF0SJYD9sm4F1n+U6smLCA05xgSIdrxT5UK?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 281e7ce6-19bf-4f21-ac86-08de1ebbd4e0
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Nov 2025 11:42:01.4566 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: q1AlDt82YjwXJqIRzwM+M1C15dS+qiEaKK3Ljzj0Q9ZlGpKr1fygvGJ+7c6Qg6EZ1cR+yfaYj0xvI1Pr8Msglg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB8574
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

On Sat Nov 8, 2025 at 2:10 PM JST, John Hubbard wrote:
> On 11/7/25 9:02 PM, Timur Tabi wrote:
>> On Fri, 2025-11-07 at 20:39 -0800, John Hubbard wrote:
>>> Implement Display for Spec. This simplifies the dev_info!() code for
>>> printing banners such as:
>>>
>>> =C2=A0=C2=A0=C2=A0 NVIDIA (Chipset: GA104, Architecture: Ampere, Revisi=
on: a.1)
>>>
>>> Cc: Alexandre Courbot <acourbot@nvidia.com>
>>> Cc: Danilo Krummrich <dakr@kernel.org>
>>> Cc: Timur Tabi <ttabi@nvidia.com>
>>> Signed-off-by: John Hubbard <jhubbard@nvidia.com>
>>=20
>> I'm okay with the entire patch set, but I do have a few questions.
>
> Great!
>
>>=20
>>> +impl fmt::Display for Spec {
>>> +=C2=A0=C2=A0=C2=A0 fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::R=
esult {
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 write!(
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 f,
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "Ch=
ipset: {}, Architecture: {:?}, Revision: {}",
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 sel=
f.chipset,
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 sel=
f.chipset.arch(),
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 sel=
f.revision
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 )
>>> +=C2=A0=C2=A0=C2=A0 }
>>> +}
>>> +
>>> =C2=A0/// Structure holding the resources required to operate the GPU.
>>> =C2=A0#[pin_data]
>>> =C2=A0pub(crate) struct Gpu {
>>> @@ -206,13 +218,7 @@ pub(crate) fn new<'a>(
>>> =C2=A0=C2=A0=C2=A0=C2=A0 ) -> impl PinInit<Self, Error> + 'a {
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 try_pin_init!(Self {
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 spec: Spec::new(bar).inspect(|spec| {
>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 dev_info!(
>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 pdev.as_ref(),
>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "NVIDIA (Chipset: {}, Archite=
cture: {:?}, Revision: {})\n",
>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 spec.chipset,
>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 spec.chipset.arch(),
>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 spec.revision
>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 );
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 dev_info!(pdev.as_ref(),"NVIDIA ({})\n", spec);
>>=20
>> I believe that this is the only place where a `Spec` is actually printed=
.  Does it really make
>> sense to implement Display for a single usage?  Do we generally want to =
implement Display for
>> new types?
>>=20
>
> I agree that it looks a little excessive, but I defer to reviewers
> who have a lot more Rust experience, and they requested this during
> a review of an earlier version.

I think this is the correct way to do; `Spec` should be the one to
decide how it is displayed, and from a maintainability perspective this
ensures that other sites that will want to print a `Spec` in the future
will reuse this implementation, instead of either rewriting one
themselves or having to figure out that there was already an existing
site and factor it out.

Iow, this code is proactively doing the right thing.
