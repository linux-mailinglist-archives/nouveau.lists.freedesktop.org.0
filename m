Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 89FAAC606C0
	for <lists+nouveau@lfdr.de>; Sat, 15 Nov 2025 15:14:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D897110E29F;
	Sat, 15 Nov 2025 14:14:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="J9jHTUK5";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from CY3PR05CU001.outbound.protection.outlook.com
 (mail-westcentralusazon11013068.outbound.protection.outlook.com
 [40.93.201.68])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8310F10E041;
 Sat, 15 Nov 2025 14:14:08 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YRh52T5DllnoR/h3oIgWRGViXQBBsjbflaZ0amtoKMJxeGoQa9YMcg4lt3movYZ1BOCx3mLfOzlDBRFAclhb2quVQai4Sc2hsnV0iGkrzh85VqjGm5lgt1k4l6ik27AoTfmbq9OIYCgSrpd3dxlBIqmawzis+fHdrJjS+o6DUBSnw47ODRfiOhAh/BhibD59ck2R/m6vEWIGiRu4Ifpu29DG5pG3KnIpiyJRonvVEdSpQCXXou2StkbVJbFEbNY1Rwxt89UfZ/XkQuPTgsixFb2BbLUQcnt+OEhbKyYgZL5hVrp2sBP63JQy2RRroY9xiZYR2DGp+JZvXNLZdqMBzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KTkSKj60eysGEctLFFlUI3Dva4ZKtcmKXkli0KQy1RU=;
 b=igLW1PlL+uVwp6u0eh3ey8RkblEhROME0KKkE7yRgDXYCccAxnkCdeqABHUU76hBW2bAaYdlvopzjr4aFVhnjXSRJAlugNKq4cBYaTt6tJzUa27WtXLM51EJlP3MA+0dvVAzgb19/Zum4R/vxJya+eMtrdGDg9WaaplPM7/hD+WC2j651IPFt8dok/AINzG23JRX8T98s0fOXB3xRgNRsQQWxRaItAxY5hDMtxzyz5NTcO1MLja0VL88Gd8IyZQIi5zLNs4PXf4OeeuoxJ+fyfmuXqne88hLRo9VTSngp66IUs+t9f+ax0vHdXvWODf5OwSuClgUoLQoXssFJmdawA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KTkSKj60eysGEctLFFlUI3Dva4ZKtcmKXkli0KQy1RU=;
 b=J9jHTUK5Q1QU+9fZHjLINhgottfbuUMZuTP1mSeNwvkFZhr5oaHBSw2dQmUl01Es4L2OF7cHxHP2SVyBe79guo99PliDle5NOFB7H6iMcdJErRu3g6R5uwO1ZH7yQOzlWXz4dGZGg0l4xgVFr1KrTIyX6z9M8RAZzp9BsN8RKDPODp/sEKEsENwdjbefdjbH2OE3pWkJ8PKvnpRK/NzCfc3hfRee/j0Luds7dR+nGPvjQj0YNgWmXV3mMx6ONBuetmsM98p4sHCcYkUb1EdB1GaViwTU9sjyiF9wwNZVJrBXQhitYksLTWRIDCy4iK+aj3TIVEQfNrNXtVqGV5ViIw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by SA1PR12MB6822.namprd12.prod.outlook.com (2603:10b6:806:25d::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.9; Sat, 15 Nov
 2025 14:14:04 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9320.018; Sat, 15 Nov 2025
 14:14:04 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 15 Nov 2025 23:13:58 +0900
Message-Id: <DE9BX5WH9EK0.28FKC927YDCJP@nvidia.com>
Cc: "Alexandre Courbot" <acourbot@nvidia.com>, "Joel Fernandes"
 <joelagnelf@nvidia.com>, "Timur Tabi" <ttabi@nvidia.com>, "Alistair Popple"
 <apopple@nvidia.com>, "Edwin Peer" <epeer@nvidia.com>, "Zhi Wang"
 <zhiw@nvidia.com>, "David Airlie" <airlied@gmail.com>, "Simona Vetter"
 <simona@ffwll.ch>, "Bjorn Helgaas" <bhelgaas@google.com>, "Miguel Ojeda"
 <ojeda@kernel.org>, "Alex Gaynor" <alex.gaynor@gmail.com>, "Boqun Feng"
 <boqun.feng@gmail.com>, "Gary Guo" <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Benno Lossin"
 <lossin@kernel.org>, "Andreas Hindborg" <a.hindborg@kernel.org>, "Alice
 Ryhl" <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>,
 <nouveau@lists.freedesktop.org>, <rust-for-linux@vger.kernel.org>, "LKML"
 <linux-kernel@vger.kernel.org>, "Nouveau"
 <nouveau-bounces@lists.freedesktop.org>
Subject: Re: [PATCH v9 4/4] gpu: nova-core: provide a clear error report for
 unsupported GPUs
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "John Hubbard" <jhubbard@nvidia.com>, "Danilo Krummrich" <dakr@kernel.org>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20251115010923.1192144-1-jhubbard@nvidia.com>
 <20251115010923.1192144-5-jhubbard@nvidia.com>
 <a467f1e6-4e18-479e-a165-68a5b5ea5db8@nvidia.com>
In-Reply-To: <a467f1e6-4e18-479e-a165-68a5b5ea5db8@nvidia.com>
X-ClientProxiedBy: TYCPR01CA0208.jpnprd01.prod.outlook.com
 (2603:1096:405:7a::16) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|SA1PR12MB6822:EE_
X-MS-Office365-Filtering-Correlation-Id: cc1cc8c6-a29f-4641-6c08-08de245139fe
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|7416014|10070799003|376014; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ZmQ3VUhUOHlaV0Mwbm8rVTY0YWg3WDlvZFpreTdQcFBudURERWd0SEpkNlVO?=
 =?utf-8?B?U1F6Zit4U2pYSk5jbW96bzFUSnFaUjRuTUt6N2J6Ykh2K3JtVTAvV0tqa2RY?=
 =?utf-8?B?UUJ0VGd4Ykt1dlVKWXhKUGVySW5sby9yb3Ira01adVFCdUZSeG9XcXhLMG5a?=
 =?utf-8?B?VkprbG5zakdjRmR1V3NZL05DS1kwMzM1aU1GV1JZcFBTQklqMDZkbzkrWFcy?=
 =?utf-8?B?cnl5ZmhOMGNZK0V1ZnZOWVR3a3A0d1FZdXJ3VDFROElxSFNXVFRlYWFzNDhs?=
 =?utf-8?B?V2QvOGVLdTI2SG5vdVlXT25GVG1sRlFCdTdFK28xSFRnMG9aUHl3NjF6S3pm?=
 =?utf-8?B?OUZzSUxWRHhJOS9MeWE3QWppcE03UXJkQzk5aVdsOWI2bW9ndWVqK3dDYnVV?=
 =?utf-8?B?dnFqNGJjYVR6SnY3bHpZOTJ3b01RRUFxZng2ME52bm1adm5UU3RMZUw5S0RN?=
 =?utf-8?B?allJdEIwVlBYcTVHWGFxVkszOFFNbGZCVWZlaEhaRndZWUhTWkp0U1JEZ3A5?=
 =?utf-8?B?eFpYZDRSMFpjc3U1dnRnUVBBdmNwcmJndjhtdFpleHh0Sml2a0FuY0RPQXpy?=
 =?utf-8?B?ekV0OWU0NjJoR0luZitVa3NMWGJ2Q3VmcVhGYzlDMm5EU1hQMzJUN3dMdGFx?=
 =?utf-8?B?ZmNBbENtUWZrTzc3QVpONzNaUHBkaWVuYVY4cGtkNjJxZGZHWmFVOHhWWnpS?=
 =?utf-8?B?d1A5STcrbW50dkhUSXJDb3BuNnE3cUJNTlNtdFlPd0hLS2YxUEhOS1YwSk9n?=
 =?utf-8?B?akU3YnBxMjFTTGJ5azRxSkt6WU55MGlCOVBUVlFpNDRrSHF0cHA2cEIvcWRD?=
 =?utf-8?B?RUdsTlhvVnBoR1E2UTFCY0F6Q21LbXJNYVdDMDZPUGVJRXM2N3hNMS9VdUY5?=
 =?utf-8?B?YVRzcjA5Q3ZiY21LNjJPWGtCSEN4cDcxRUtJRHlIK2ZwQVRSN3ErQzRoNEov?=
 =?utf-8?B?R0p2VEtqdjJQWGl1cmN5bEswMEJUMUVWU2d1QkhFS2FlSndFZy9FeGRleDhB?=
 =?utf-8?B?ZEJ0enNlejQ4dmQ1TGtjalJTQlM0dmpYb2lVcEhndFhTYnJzRXdIeDhpbjZZ?=
 =?utf-8?B?ZUJqS29aUTlLdnBCUUhjYkZGWlpRZXlYTVUyRVRRMEtYZXJ3QUxkZHlLSUc4?=
 =?utf-8?B?UW9wT0MyM0dzRGxZV0tSRy8wdmp0VzM5WWFleWlnT3dPZ1VBaFh0eFdlY082?=
 =?utf-8?B?MVpkWXpJb1pZd25pdHpkZ3JWUXZUNHpxOTJvWnVmVmxVVkhYR2pYNktMa20z?=
 =?utf-8?B?ME81SDRSdkxhcmpzSVpDOXFWamh3b2NGZjFUbUJrNFNvQlpIdGNDWFo0K3B5?=
 =?utf-8?B?aURCYUJHK3oxbE1sVllJTUJzUm5mRjd5aFRIK1ppYkVPN0VIczhHbG8yUmFq?=
 =?utf-8?B?MFRtOUZQbjZwRi94ZDZqbmhNeDlXUUEvbWNBckNLMFFYS0N3Z0hJQ3pVTklV?=
 =?utf-8?B?d1VwWDR0SE0vWjR5R0psbFFDdXBZVk44dE44Y0RZelRtOTN5WDhsUlR1L1dK?=
 =?utf-8?B?K29SYnFOS2RtZTBVanN2cUlReVlQcDVNL0NqelcraHpuQ3NiUnJwdE5UMWo4?=
 =?utf-8?B?eE5WanErYUhjZ2N4dGY2NC9NQTJZNVZDSWw1ZjN0STVheDlzZHBEV2dvTnZn?=
 =?utf-8?B?Y1ZKakVxWUJYemlOa0psNUNRN2pobjRESVRSSDNicmpZNDlqTlpQd2lWYTlZ?=
 =?utf-8?B?RGxJUEtOZEt5b1NzVG5KYkRvRlFGbVBRd2RlcENnM2ZyYlJybHZiREsydVpI?=
 =?utf-8?B?NFUzcXhRVjF1bXIrNEU1ckJ0ZWtHUUpxbndzdHJsODN5R2VjMWJobjV1cGlO?=
 =?utf-8?B?WDhmNnFJL0lpTndzMGRCb2dsdjZpNUQ1a1JhMUdIRFhrelU2Q0tyWjlXN3o0?=
 =?utf-8?B?UHVRdDVkUUhVeXVzSGNYSnBaS3dJdUFJdTdINjExNitrbzhrZW95WDRwZytN?=
 =?utf-8?Q?Lrmyi5IIrAVPyjS2sY5w+HP/Td93uQ/6?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(7416014)(10070799003)(376014); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aldLSjZzRTNla1pzcGNCQXpnSlpBbmVndkY4R3ZsOXRob1oxWjlKN2VJclZm?=
 =?utf-8?B?ZGs5bEZwb1lhUkJvTStkMFZDZ3F6NXFMekRpbllFZURMZ1Uwc2hqODNZclNL?=
 =?utf-8?B?bExpWGk0R1ppdE9nb2tObU9NL1ZZWFF5WjF1d2F0QWs5eWpXU2dvdk0vUWhK?=
 =?utf-8?B?amZPUWdkQjdLcGZkNm16WGtYUVFjb0ZGYWdCdjl5eTdyWjBjdEp3c3VtRXVS?=
 =?utf-8?B?SEdjWHhiTDFtU3dyNTloTCtVTFBEbDJzSm1yQXBLT1FMWURRdk0vK3FpZTdh?=
 =?utf-8?B?a1hLVkhyRGtFSHhEWnBMODdRbVVLazlxckRsYmFjcWVaanVxSmY2bzZmTStp?=
 =?utf-8?B?bk1FSGJOVm9RRjhpOE1JaGJwSHJOWFlRdHM3TVFZZEdhZ3dCVFE1U1MyUFl1?=
 =?utf-8?B?S3E4KzhpM2NJam5CMDN4TzR0Z0VXaVBsVkU4WnByd3VQNFpkL1JlMjV5eG84?=
 =?utf-8?B?UWFvWVRWcU1zRzcxR1psR1hrNGp4TnZ2Z1BUSjYyQ3B4YmJaREtLSHp2NDli?=
 =?utf-8?B?YWlJZS9NSWpjTWpObFE3dWU1ZEFGd1kraUtRMnl3dm1oZ21QQ2FPZUVjRlpl?=
 =?utf-8?B?OG9Xd3lFUGpGTVdMd3hMaXJaTHpMekRyRWFGb2Q0V0k2bUtvRjh4TkdkVG8x?=
 =?utf-8?B?U256TDg5R25EUlhXMDYwOHNuUzQ2WUQraUNBcnFaVE1UMG1BSWh5TERrN3dM?=
 =?utf-8?B?RkZTRnl4UHVRVUtnNDdJZnJlbSt1czliY1h4T0JPU3ZnTE1DYkxiOTF1RjY1?=
 =?utf-8?B?dDh6dnlvc3RXUEFrM3NoNDJSTzAyRE5KeCsrV1lHb3dSdWw4YzJ0c3hnUHhI?=
 =?utf-8?B?N0d1RnpYVy9FNFpaSGNMbzl1KzJJNFNEOWRvSlVnUTJEMFg0OGxkc1c0cWV5?=
 =?utf-8?B?UEs0NzV3bjBHd01OanI4WE5rK0Z2dGZ1OVBqUmJvRDF0aEdyRjZWeW1HY3JR?=
 =?utf-8?B?V1hMMHBETDZVNkY1SlQ5ZytaR29LcmdDeFNrbGM2UE1ZMHhkWERSb054c21t?=
 =?utf-8?B?TiszeXZ6SDdmWkdYZlF6eFhBUzRzaHlmZS9rWnhYcklUZklRNXhuWnU3aDFU?=
 =?utf-8?B?VmNma2VGVmJZVnA2RDFSODM0NC9TQTlkVTlTV2tZZXBQVU1iUXp5TlY3dVNt?=
 =?utf-8?B?RXlzWS9TSmlmN1B3dFpVbEFKd1I4NlJwOXQ2dHJYcitIRkJQa0M4QXJOVm5q?=
 =?utf-8?B?d1RhSnZnLzQweWtDTWcvT0ZGbnhJWUUxQmRPbTg1U1BmM2F2aTlRTzJIV0Fa?=
 =?utf-8?B?dG9HNWx6UW5SY1FyTzE1V2NWYXRuOFRyU3FSS3Flck9PZXZLbW0xL0hGYjI5?=
 =?utf-8?B?OFRoK2VjWGUweFY1ZnN4c01JV014OHAxVmh1blhnZklVTkJHWjkrNHNXUVo0?=
 =?utf-8?B?R09WSDFwaDN5UmhuYVJrSCs1QmYzaC93Z3NXdmpYeTk2N0ZnMzBGdWVqeW1Y?=
 =?utf-8?B?UWxZKzZRUFptRUxma2tuelZLYzVvNjByWGFnTzNSKzBtT1ZVZjJTc29YNVp3?=
 =?utf-8?B?eXorMXl5NlFQRzhIbmRoMXJkSnowdTlWRzFUVThCcHpDRnkrSm5pa1dYaHBE?=
 =?utf-8?B?LzY0TDlvWEVhdno5ZGNOajhHTmJxSjg4QmV2QzVTYTJNNjc5S2pTNXoxZVBS?=
 =?utf-8?B?MUFVMmZ0WVI1UFgydkZHNVlYUm9Xc04zYWlHVTJrdVV3Mk5HeUJ5dDBTdXcw?=
 =?utf-8?B?OFRUT3d0dDBzRE1mRXJJSWJvSW9FMVZBdmxIRml2RkQ5Y3VPQXZZblQvNklr?=
 =?utf-8?B?SFJrMXdpTTlRNGVXbTdVNHIrS3pxbUtrclNBeWs2TUpyVDJlL1QvV2QxT1du?=
 =?utf-8?B?SXhKQXFrRy9zajcxM0Jzem85dkk4bSt0R051cnJ3SzduUlBMeTFrd0V1Yk9S?=
 =?utf-8?B?c3JSZEpuWm1qUTJVTVhMalFUb0JSclYra2hCak1RUDNhMW9XWHRvUmN1WTVV?=
 =?utf-8?B?Q0lkcHliVk95SjFnSVZtMGNkUUg2cGNLRnlpNjMxUWFVVmRyQXlFa3A3cXY5?=
 =?utf-8?B?RlNsY1IvYTRqS1d4dU00Sk5rUXhwTnZUVDRZSnBzbHl4S3BDL1ZyVm9oVlcx?=
 =?utf-8?B?cG9Ca2JISlZEMk1vQ05FT2V5c081N1hLSFE1VzhiV0RNaWd5Y0VIR3FzTWdE?=
 =?utf-8?B?ajZVREJMcnNZRWxQRGdkbTlYZHlIWE1XODZVSWtPR05yWTg1dDQya2NDVnFj?=
 =?utf-8?Q?RUKQaFDrU4V1EU+XpOuh5bJ9VW54IxjSMF19NcV3KZx+?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cc1cc8c6-a29f-4641-6c08-08de245139fe
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Nov 2025 14:14:01.8237 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: p9ge8BKq9xoMmyDGiTFUENJvsVh/gL/uzIfQiCdbvYJ5JzQFFWAoVjSrAcaTlDvIjogO5X16GFybanNmGRQZ1g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB6822
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

On Sat Nov 15, 2025 at 10:12 AM JST, John Hubbard wrote:
> On 11/14/25 5:09 PM, John Hubbard wrote:
>> Pass in a PCI device to Spec::new(), and provide a Display
>> implementation for boot42, in order to provide a clear, concise report
>> of what happened: the driver read NV_PMC_BOOT42, and found that the GPU
>> is not supported.
>>=20
>> For very old GPUs (older than Fermi), the driver still returns ENOTSUPP,
>
> ENODEV, actually, now.

Fixed before applying - I was wondering actually, so the clarification
is welcome. :)
