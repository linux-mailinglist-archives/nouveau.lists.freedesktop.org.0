Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 768C6C42446
	for <lists+nouveau@lfdr.de>; Sat, 08 Nov 2025 02:55:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9543710E1E6;
	Sat,  8 Nov 2025 01:55:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="l50O1fUM";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from CO1PR03CU002.outbound.protection.outlook.com
 (mail-westus2azon11010014.outbound.protection.outlook.com [52.101.46.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C191B10E1E6;
 Sat,  8 Nov 2025 01:55:53 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=e1Rj/f4K19u1yCFnfTo1S6PNRvekp+3qm/UoKERXrQUbKTrGbPTp3bo5nMUNqzpbpBw2Ez2YAjee6f4br2gFo95NEeeRm6VYruaoCwn30t1kaODTs9QSilT5yCW4bfj+pUKyA6d1OUhlHwVYC+BSPp6dG1RbOsZW5eRrk1gSzMJNLKqorXAvHLV0glKVZL0z2tOLYh8Wx9WaZ8kBG4oDPPnJ0hBGjDSQ6K0jAxvtG4oVrZRey+fNZAaQmzn1Yjs3pHXbL3ZdjctJPARLRywtxLbDhjD9ibHYtArpO8FXyVI3N8APVpHYOZcpGbz8l5eZJMOBkhWHuZCyj21R2fWgcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Gmhlud1BBaDpDzibAO7YIs0UnDGejBjV+lE3Oz48T1g=;
 b=Y29WwSqL6iTuEYQHvBVNjLhuHSigANmOzSjJ5XiAW9kPfbo2A7KcoHut/3L0/1ce36LD35llYfzEdwNzw7arvO+B0r23b1Ye2M1fEX+jI/Q7Z9RIMBxfW1NFP7NhGAepv5ez9qAion6J+z8dwKmfAnVain8cBJNWh2sbyeU5g1WJNsHeVkHHzp7/gLZVqCTN/dMevffAOh6IaRgmwGQzwHzf53EFyBgFVTdesDWwH/F5rZFqOEoSMJlMl55wnmVdfofm/hbI0beVlPdUloEj+UBAdNTAKUyZreJmCj/aNoI4o4v1BFnwxqXnLZkwwriqt+onf1wU3154LYiWuK02Pw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Gmhlud1BBaDpDzibAO7YIs0UnDGejBjV+lE3Oz48T1g=;
 b=l50O1fUMGPYuB2jeE0lFpgOm84YnD9Q4D2xPAOEVe0BZYDSmR8Gi3MDJZkpNzNmvm8i71uhEqOwR3Q4UuiY1fQXRFh1l13N56R0phCWz+D8Gqa59rVEp3AjE3Q2JvoCEeu53WEXCE0XvyODwr6L/3OaVN7QpHHs6rFM99st7E8rEllAV7plX+o3uSusIiTbufOs8Hf04CnxpmRxuncPur8CApKoKl7r1g0LRrLVpFTsXtzAgnMEewPG15wuVeIR2E0eTY6BiabYkofdUFENPYlcu7tTu8w9yg1nGjcBnfTm5ll4e3qpjaiFd9f70KHGHSq1EkxSHH2ug/2QoIljXYA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by LV8PR12MB9334.namprd12.prod.outlook.com (2603:10b6:408:20b::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.12; Sat, 8 Nov
 2025 01:55:50 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9298.012; Sat, 8 Nov 2025
 01:55:47 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 08 Nov 2025 10:55:43 +0900
Message-Id: <DE2XU3M6FQLH.1SOIZBPALTHMN@nvidia.com>
To: "John Hubbard" <jhubbard@nvidia.com>, "Alexandre Courbot"
 <acourbot@nvidia.com>, "Danilo Krummrich" <dakr@kernel.org>
Cc: "Joel Fernandes" <joelagnelf@nvidia.com>, "Timur Tabi"
 <ttabi@nvidia.com>, "Alistair Popple" <apopple@nvidia.com>, "Edwin Peer"
 <epeer@nvidia.com>, "Zhi Wang" <zhiw@nvidia.com>, "David Airlie"
 <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>, "Bjorn Helgaas"
 <bhelgaas@google.com>, "Miguel Ojeda" <ojeda@kernel.org>, "Alex Gaynor"
 <alex.gaynor@gmail.com>, "Boqun Feng" <boqun.feng@gmail.com>, "Gary Guo"
 <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>,
 "Trevor Gross" <tmgross@umich.edu>, <nouveau@lists.freedesktop.org>,
 <rust-for-linux@vger.kernel.org>, "LKML" <linux-kernel@vger.kernel.org>,
 "Nouveau" <nouveau-bounces@lists.freedesktop.org>
Subject: Re: [PATCH v3 2/2] gpu: nova-core: add boot42 support for next-gen
 GPUs
From: "Alexandre Courbot" <acourbot@nvidia.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20251029030332.514358-1-jhubbard@nvidia.com>
 <20251029030332.514358-3-jhubbard@nvidia.com>
 <DDUV3MZ58O0T.229A7N13MM1HN@nvidia.com>
 <64018a2d-1c0c-4851-95d5-989f041d220d@nvidia.com>
 <DDXV1SHI0R3A.2A1HQNM843OR0@nvidia.com>
 <b8a8c217-954b-4ffa-bce3-9424134518c8@nvidia.com>
In-Reply-To: <b8a8c217-954b-4ffa-bce3-9424134518c8@nvidia.com>
X-ClientProxiedBy: TYCP301CA0037.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:400:380::9) To MN2PR12MB3997.namprd12.prod.outlook.com
 (2603:10b6:208:161::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|LV8PR12MB9334:EE_
X-MS-Office365-Filtering-Correlation-Id: 33833f42-ed45-42eb-e5c8-08de1e69ef2c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|10070799003|376014|366016|1800799024; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?OVZLOElRU0I4R3oybUdLZGlNaEViRUZ1OE4rb3phNENmNFR6NnA1cHMvUk9E?=
 =?utf-8?B?UW0xODBlZDFhRWZZMXo5amN0S2FjUzRYNkEzSkFPYTFoZU5BbjBkS3JVRjVJ?=
 =?utf-8?B?QnhRN1NabTJ4QUFjbFVlWlZrWElObXlCSmZNejRESGN6dnVGd2RzNmlzUWNO?=
 =?utf-8?B?eGpWak9aZ1pJbTFWWGdyYTFxTXVBTThrdXp3SjkwdFlKL3RZZmZjU3I3K1lw?=
 =?utf-8?B?YTJVU2dwM3VzZ2JxT3k4eDlqREdzemtJQktKNVFvUGs5SS8zaVZ0N0RvekJ5?=
 =?utf-8?B?K2xCOWRYRHl6Rk1kRWZoZTlnSWNhQUVuVTlIWHpXdXdQY2YvRWsyTDh4Umhu?=
 =?utf-8?B?OU5WU1hNcEQ5UnFQdmQ5OUdZQUcramtkTVl6SC9GMXd1TzFmYUhLcVRjd3I4?=
 =?utf-8?B?MHUzTjR2Wm8zeXlyeW5MUmZVU08yVnJNbHh1cXBvWXFFQ1ZSQ0V2MmZTMzN4?=
 =?utf-8?B?VDlycHE2c09YMWw2NnFCUTg2cksyL2tpejlld0hWZ2tobnRaQ0NnSnR5UFUw?=
 =?utf-8?B?bk0vNXJkMVJneUswL2Z2bGQxTjU3c3FmdHE2bzhnWE1KVkw0V25wUk9YSU1o?=
 =?utf-8?B?VS9XalpnYjhwNEcvSk9ocll5NmQxd2F4c1ZxWWo2WVNsWmpmZ3VCaE5qRzVv?=
 =?utf-8?B?cnhZdUtCRk5qLy9lOUpMUFY0Z0t0T1ZueSt0SEV2RCt5UUlBblArdmFNTGlv?=
 =?utf-8?B?eldLMVQ5dUFFY2t4dmxmdVhRRFdxVndUUFljbFNHa2ZhQkZIeGM5eTE1QU5T?=
 =?utf-8?B?UFhvUHRUaUNIOE5hRjdsOWJoYVlWaFd3Vk5VVlVPVVJVME15WkRsaXpFTTFR?=
 =?utf-8?B?Y256eW9rOSsxODhPR2NlTWhjNUd2T05scm0waWc1Nk8xS1RucW1QNkFCL3pm?=
 =?utf-8?B?dGtabjFDREVNMG5wMkMwNXFCclNFZWY4SCtmZExFaEpBNjhuTUZtRURPaUNl?=
 =?utf-8?B?SXk5UXNFRGZXMXBLQ0RmMlcyZ1FML1R6Z2xnc3dqVXBPZGJ0QndOZmRCd3ox?=
 =?utf-8?B?U3pCTUt5eHc5QXZPVGVlMzE1RGRCZG54VlJ2eG9DMGw3TGVXL0crdlJjM1Jx?=
 =?utf-8?B?Vy9SL0c5Yk5HMjcrY0ZUL01KRWVmdHQ5MzZMUTlJRCtPczRFTVVlOEpraUZk?=
 =?utf-8?B?Q3ZseHpVNk1GK3Z4T2s5Qm1DRkFsdUZoOVE2dHBnY1dmQ0pWMU8ybHRxd1Vs?=
 =?utf-8?B?YS9GY0xoMHNrbnpWaHd4WGt3ck9tRHdESFdrbTNENUpjRnNsOWRWMmdWcm85?=
 =?utf-8?B?Vk1ZOVlMcEtkeUJRLzEwc01OeEc3ZnU5bGZRd014cEZzMW5MVGkvSzVXai9T?=
 =?utf-8?B?Yy9WV05xZ2NLQVlFQ1NjWXUyamloSzVKZjBHWlRJM2M0M0JKNTdzT3pMSUxT?=
 =?utf-8?B?VDFFVWFoanp1TnpVRjUzU2daeThZK0ZEK0pzazcrK0JHS1h3T1Q3VjJjcGxL?=
 =?utf-8?B?ZWRzZ3FLT0xJRVNXbVVVblhFVnpXdTV1NTNuTk5jemNnSFI1YXNuSXJITGFa?=
 =?utf-8?B?YWI4L1dXZElrK2JQa0FKcmVYaVRuWms3YXBOV0xsR3dYR282a3lEY2dlaTRK?=
 =?utf-8?B?U1o0OXhNY3lBRVR1Y051NXVmUFREWHZjS0V6VDdpSjNYNGNUK3FFaW9jNDNx?=
 =?utf-8?B?Vks0aVFKZG83OGRRRVdYaXNhNUJoMVVsejFiNXg5VDhRUFZ1eHBGc2lxTE5a?=
 =?utf-8?B?ZW9lanZKVVBwUWxYUTdnOVJIZjNEdVdwV0ZvU2krRWxwaXJGN3JCVXZnN0Jt?=
 =?utf-8?B?N0hnM2lEWGt2NXJueDhIakY4LzRvRG1tUHF0WkNaS0ptcHlJcXVCdXRtL1ZN?=
 =?utf-8?B?RmNZaUhjOTYxa2syY0p5cmtpQVBwajNDd3licHlLTjdlUW9zT0Y0Wmg0YVdV?=
 =?utf-8?B?QzVPRkFhV2ZGVnc5bStoYUFQQ2pIaHppaEx0QjcyN0tzSHlYZlpwV0JaMkEy?=
 =?utf-8?Q?qaLfO1x9ytUkbABR5RTjf3ZsGgwVTwsT?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(10070799003)(376014)(366016)(1800799024); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Zkp2bWpHcGRMeGpwSXhSRGhlZmRCS2l4QnhoeVRCY0UyaXZGZ2JMMEpIR1FG?=
 =?utf-8?B?YnRGVE03bzcvRzBjYm90eXlRTC9pNHdvaEhDM1pOSUJGQXBqdVRXN1p0bEtR?=
 =?utf-8?B?dU9TL1NrdG95U3N2bGdrT1NFWG50b1RIUzJNZitZa2RLN3g3eG1SdGRHQ0ZO?=
 =?utf-8?B?bHRwdTNvbVZEZEVkZ0kxQmVlbllGRW5uWEI3YjZOcDhBRnlsc3NJWDN3TDF4?=
 =?utf-8?B?bk5wMXBjbnY0WUdrZnh1M1pqWTZ3d0NGSjlLbFJ2N0pHNEdtazBoaEo4WVYw?=
 =?utf-8?B?S2pydGVZNnBCUTNWdjI1dGZNMlgzWkNvK1F4R1ZxV3N0cXFzd0VuSE0wbnpk?=
 =?utf-8?B?SHlYUWcxdXR1WkIwaCt4RG0yMFZ1NnBCb0toeU0rSDhHSFBIbEUwUEF0TStC?=
 =?utf-8?B?OGZIUWJweC91amJEMEI0eityT0VqVEQ0TzN0RmcvNzF2QTQ0dUc5NzBEMzMr?=
 =?utf-8?B?cmhRVmNHRGp4a2VHSUhlRFpZdWQwdEJPTFlXdFlla3hpa1FoYU9BSkF6d2NM?=
 =?utf-8?B?MVY2LzFreVlPZHdkWHNMSndGYlYxcUEwWFpwTkZwWi9McDNEVDZHZHhjZDcy?=
 =?utf-8?B?T3Ric0wzdXprK244M3hEMk9zVlYxUFd1MlNacVRHZGtzemFNZjBYRVNXQ0o3?=
 =?utf-8?B?L1Rzb3paNFp3aWRVTzYrMXd4b2QyVTdhSE9FYkZkOUJsNWwxeTFBY1FWUnE5?=
 =?utf-8?B?L3dCckFsbHRRWlJsSmZXNDNMNE5wWnNiVG40QWR6TWU2NFpGMy85U0V3d0lH?=
 =?utf-8?B?TlNuMlN4UUZVWTI1VVNaV1BuNmJBbFh6aU9jRXNaU0JuRncxUk5Ybk5JUjlJ?=
 =?utf-8?B?RXhSRDdPRi9WcFJ2WmlRMWN6cFBLUmRYdUEvNERNZjhUUldLVUF5aFZYSHpr?=
 =?utf-8?B?cVBiVDBVNGd5aDZ5eDQ3cytnWm5iUm9HeUQrRDFIZm5aejg1SkJDcmc1SCtm?=
 =?utf-8?B?THB0akZDczlxbmQ5U3k1UC9TNDJaRTlqMGY2cHBUUkNpdU9adWVGV0EwTTBL?=
 =?utf-8?B?VDhWSGNrQWpTVXhEOHFNemdXRFM5Q0c5cURraDJoWmVXY0ErbDNPZVoyVkcw?=
 =?utf-8?B?M3JjcE92QmppdlZ0alp3aUFGb3FUQnpXZWFGZlBXVEdHNkRQc00yRDhlTWVa?=
 =?utf-8?B?dGFjVlEvTTV3bzN3ZTVBQlR2Q0J2cUo2UFczVFBaMmhGMXA0cTdvWWhhcitn?=
 =?utf-8?B?R1AzYnMvOS9uZkwxMW16RXJCcUZDemE0bzFTeitZWnZZRmhmb0pjdjAvTmRF?=
 =?utf-8?B?QWVkTjhQbjd6S3NrK2xTN1FrUVZhQWtLWjY2NmJFeFpzSWRodXI0b1JUUFkv?=
 =?utf-8?B?QkZjdHArRlNuMjlISkczRlNtSmNoR2ttd1hxcTRGNFllNkZJd2VWU3U1Q040?=
 =?utf-8?B?STN5WUFGc0RwQmJFaWhXcVQ1SGhMYzdhOU5CSVZqYjhka1dvZkRkNFlQN1Y3?=
 =?utf-8?B?Y1BBVGduYVpNZVRhTDhHbFNYWlpOOG05Qm9KZXhhUmxlY283akQ5L2lMOUFU?=
 =?utf-8?B?bTM0cElhQ1k4ODNObXNwTEN0TEl4NkhuOEhEbzJJdXN5RVF1MWtKbCsrTkpx?=
 =?utf-8?B?aVZCSEw4L2pMMkI3YXJRZFRkcVdXaVZlRHlIRW1iYXdGU29jUlN2Nm84aEo2?=
 =?utf-8?B?Z0NjRnRiWWpzdzZPWkZUOGRZb1FEY0dWSnhWZmhJM0dlSjMxNkRFMUhjM25k?=
 =?utf-8?B?UDBoWTZVYUFUQk15MElJdjk3eWp5clQ1dHk5bkRUV0kycG85RkJGS2xUMmo2?=
 =?utf-8?B?Yy93ZlJwZVdnM3hLRHJCMkdQK2ZrbHFFdGFjTnk0bExXOG5pdDJTVDliZXoy?=
 =?utf-8?B?d3pjTjkzaFQ1UVFlU2I0cVNOdG91MmhGZ1ZrVHEybDdCSC90R1BCNkMwWnhw?=
 =?utf-8?B?b3ZIdGw2Y250QkxHMXFhUC9YMGpMSVoxNWxRZjZ2OHNaMGdEWlpmQy9FTUdj?=
 =?utf-8?B?TmtIWko2eExJVHliWGhOdDRDUHBFNTJHVTJSd0pxR0doZC9ublBDUVRmWVMv?=
 =?utf-8?B?SDU0RXQyaHk4S1NOSThzUW9Zci9yMU9TNlEzdHpTdG16c3lmL2lMWFB3ZSt4?=
 =?utf-8?B?SWJKZjhBWTVtVXhJTWpSQkhZeHFtZEN0UTF3UUVxMGlXbmRWblFZSWJPUi9J?=
 =?utf-8?B?RUxlZ3NOVnFZcS9OeXB3akF5cU5FUXJZNmxkWHc5d2FaU3lvNHBkei9yVXNp?=
 =?utf-8?Q?w60srhfEbL+NiCow3Gpo+Zi85vB9R0sJ0Z3AnoJnIUfo?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 33833f42-ed45-42eb-e5c8-08de1e69ef2c
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3997.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Nov 2025 01:55:47.4937 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /p0UFnfrgyqX3ogdtUZUFB+wkp7kli4i3o22EI2vIgK/KlenNbq/u6/ZMoCTyNOPVgfmi83tx/lyJB+ipdhh7Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR12MB9334
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

On Sun Nov 2, 2025 at 12:33 PM JST, John Hubbard wrote:
> On 11/1/25 7:41 PM, Alexandre Courbot wrote:
>> On Sun Nov 2, 2025 at 9:34 AM JST, John Hubbard wrote:
>>> On 10/29/25 7:05 AM, Alexandre Courbot wrote:
> ...
>
>> We can always add doccomments in the macro, as in the patch below. These
>> will be displayed by LSP when one highlights or tries to use one of
>> these constants.
>>=20
>> If you think that's adequate, I will send a patch.
>>=20
>> --- a/drivers/gpu/nova-core/bitfield.rs
>> +++ b/drivers/gpu/nova-core/bitfield.rs
>> @@ -249,7 +249,10 @@ impl $name {
>>               { $process:expr } $prim_type:tt $to_type:ty =3D> $res_type=
:ty $(, $comment:literal)?;
>>       ) =3D> {
>>           ::kernel::macros::paste!(
>> +        /// Inclusive range of the bits covered by this field.
>>           const [<$field:upper _RANGE>]: ::core::ops::RangeInclusive<u8>=
 =3D $lo..=3D$hi;
>
> Will that let people know that they'll see something like
> IMPLEMENTATION_RANGE() for a corresponding .implementation field?
>
> I'm hoping we can somehow create clear and plain documentation for
> the various functions that the macro generates.

I did try to generate better documentation for these using the `#doc`
directive, actually posted the patch by mistake so I might as well link
to it:

https://lore.kernel.org/rust-for-linux/20251108-gsp_boot-v8-16-70b762eedd50=
@nvidia.com/

Unfortunately, the final documentation does not appear with
rust-analyzer/LSP, which drastically limits its usefulness. :/
