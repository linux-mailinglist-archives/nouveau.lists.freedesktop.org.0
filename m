Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ADDF1B1B4DE
	for <lists+nouveau@lfdr.de>; Tue,  5 Aug 2025 15:26:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C34D210E13D;
	Tue,  5 Aug 2025 13:26:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="gRHdmqE9";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2074.outbound.protection.outlook.com [40.107.237.74])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 31B9610E13D
 for <nouveau@lists.freedesktop.org>; Tue,  5 Aug 2025 13:26:41 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vy2c79Xf0Hck06iBRz7ICLeLVbXd4XtgP9t4JaQjZAdiioOOQRs3iILcHP2H5w8XZCBpNRnhF7v4WltZ33VkJUnCUB9VUaCZrBQseNT7mFCVRJ2+CQEste7im9cZGTr7QsCLhcN+/7qRgMoEyzmF7h24X/dDon8hC9eSJ4UbZFojatx2Oy4WbTDGThJK4KMkZoUdmW6o9QeEVXtuImiaB0LIQZ8DTwQ95MkAMLVDZXH2q96lm1LL3mnNQN/IzMkT8eTdIyhKypvMzKDQ2PbQIVa4CUglvGiBH/6n5YhpqUhrtAij62XMYYOH15TSOBL8b0IwaXfdenblMZq3FmMk5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8JaEB+/HZpTNyKt6L4xLw29dBrxGOYf0U50TsRLKO5U=;
 b=gnR1Fnt7kxpoNj3ljSqXDWvIPmnStSZKexoy7r55B9wSiPK4Cq01QUmG1zGqqWqB97KB2Nmwi6cd9u/SyN1fzvhTDmCxPtlJtFHLrwcao8v7cuDs2OGXJWqjHyoqdHh/x0XhJpX0H32BUahhXtqnjLTmPzb8Xtg1y2h1kHpR3usWD4b5LC8ctnrGT9rACIOmr8fdj3BwH/IzZGO7ZFYJiTus0oltALHRJzx0MuJULnE1sZbw8Un9JsSllgVd9l4ip4RUD2RJF+qUV9Im8flXRwmi41X9tIKP/mxp1G37r+y/NmPbGyaQH/Tq8GejLF+CsZwHwyhIhbVJpDBong5t+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8JaEB+/HZpTNyKt6L4xLw29dBrxGOYf0U50TsRLKO5U=;
 b=gRHdmqE9p02/uFWFe9USFgBrFC1xoIOH1b9Cp3g0aoC6sC4vjjiWSRDaL5L4FBp+foM51QnzNKxwXnHZpTNtcLMz/rSdF7YuKkebjWAepyBO/2q4ajyqTNqfDKXdVu98n5lmBypHFp2l1wpYyTHUe3udXLMETnZULlno9XrJkbX4ehOov2rSrvfRIOHtQcnosxUqnJxBYDleSrIGEvbJV9TLaY2Evo35dSaOs8G5/FMmf6UPWgvCIcf1ztgwAIWb4fv9to5RXTAzy1MU7iea8iZZ6RAaAAtEdz8W7uduTANBNai+qLVRUz2WqHBuZ1S9fGb4Au84f8wfAvknxQvQuQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by LV8PR12MB9081.namprd12.prod.outlook.com (2603:10b6:408:188::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8989.21; Tue, 5 Aug
 2025 13:26:36 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99%3]) with mapi id 15.20.8989.020; Tue, 5 Aug 2025
 13:26:35 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 05 Aug 2025 22:26:32 +0900
Message-Id: <DBUJ19RTU4F8.2XAILWW3HMAWQ@nvidia.com>
Subject: Re: [PATCH v2 0/4] rust: add `Alignment` type
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Miguel Ojeda" <miguel.ojeda.sandonis@gmail.com>
Cc: "Miguel Ojeda" <ojeda@kernel.org>, "Alex Gaynor"
 <alex.gaynor@gmail.com>, "Boqun Feng" <boqun.feng@gmail.com>, "Gary Guo"
 <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>,
 "Trevor Gross" <tmgross@umich.edu>, "Danilo Krummrich" <dakr@kernel.org>,
 <linux-kernel@vger.kernel.org>, <rust-for-linux@vger.kernel.org>,
 <nouveau@lists.freedesktop.org>
X-Mailer: aerc 0.20.1-0-g2ecb8770224a-dirty
References: <20250804-num-v2-0-a96b9ca6eb02@nvidia.com>
 <CANiq72mEDhT_OvSo1b=z4Z4VhND8+DFzeGBY_NNfXhq9jy5GhA@mail.gmail.com>
In-Reply-To: <CANiq72mEDhT_OvSo1b=z4Z4VhND8+DFzeGBY_NNfXhq9jy5GhA@mail.gmail.com>
X-ClientProxiedBy: OS7PR01CA0048.jpnprd01.prod.outlook.com
 (2603:1096:604:254::18) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|LV8PR12MB9081:EE_
X-MS-Office365-Filtering-Correlation-Id: 33638343-b08d-4786-b2c3-08ddd423b36f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|376014|366016|1800799024|10070799003; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?cUZPTWk2cjBDaWdaVnhBaWE0cEtNcjJZdThERm9veEM5eWhIazg2bmpxV056?=
 =?utf-8?B?SWxtVmxuSjVCSEd6MGRxM3NvSFVRK3FiUHRTWGEwRFRiRkdUR2o4RXZNZnpE?=
 =?utf-8?B?VUtOMDBOSzVEK1c2K0ZJZ3BCSG53K3A0elJzVEVITzhJR3YzamVTbFdoSjI0?=
 =?utf-8?B?ZG1QeFZlWUk5dnptRis3WW5NVWtoYWZvRmg3L0tlSEFFTjhzbDZBVUU3M01o?=
 =?utf-8?B?ZTBOTGVwNWphM0FnYXV5b2RrRFcyTWFGRml0OVNvOGI4QyttMkIrNnlnc05y?=
 =?utf-8?B?WGxzM1VETWljU0VIWXJjT2NZRXJMaUJhQWV6UUxqcnBBdHRIT3ZJQWNEejV6?=
 =?utf-8?B?U1FvMmdDL1I0OHFQazRxT081ZzVpeXBLNHErc1FTZ1BRNWhxWWZsTWthRmtP?=
 =?utf-8?B?WTRxTnB2TlVjMU4ybzFnNERQdDRWdXRFWXFadllObzVCR2VJSWs5MVpHVk9C?=
 =?utf-8?B?bENoU29CZWpsQTFHTStyaW1uN2c1bkpUSHlDbWRZMFFCQThEWTJDMjFoR3Yy?=
 =?utf-8?B?eGdZWi94ZlIybEp1K1ZEZStlcUNnL1I4aFhqQURpUUh6SEJaVXd2d0ZxMThR?=
 =?utf-8?B?TVZjbEZzRllkUzBTYmdPTUY1dzMyU2FJaVpiYlY2Q1JSdmZzcFBINTdoUzEw?=
 =?utf-8?B?SnNKU2g2NWlkL0hQU0t1amNXZmV0VmI3M0VtV2w0T1VUclNBQVhkdk00Wktk?=
 =?utf-8?B?U3FBLzQwNXZKV2FNRzdyRjI4TjFaZ2NFTTlpcEpxQWZ4clZhREpPclBkWTgx?=
 =?utf-8?B?aWFoMi9LUHl6RThlZHExUVJLd0JBZjJvQUpDTUF1Mm05YnBHTGxYZ2hrUzFE?=
 =?utf-8?B?RnpCZkxuZUhHSFVQVVIwNSsyMlVOd3AzbzRPc3AxRjhuMzdmb3ZCeWlDaFhS?=
 =?utf-8?B?ZkJ2MTFVcnNDYmN4VjFnZk5jSXo0Rndnd1pHaXpBdFdlRHBnRFVUby9VU2tr?=
 =?utf-8?B?ZUFuaE1CcXZDNWg5VElNUGRnYjdobis3aGNyeUF0ZStSNmtaOFdXRVRPR00r?=
 =?utf-8?B?TGtZK2lySEt0VFM4T0ZwSjBjSDlSYjNycmVKRWhaMWprdGZCSHZ6bG90VUI4?=
 =?utf-8?B?bHZsSXdRUjNScmRldFNKckt2KytPQ0lpUWJqUHRucm11c09EY25sOUhGYUNT?=
 =?utf-8?B?RFNtbGR3R1I4TDIrSVArQjNGa3hRMTJZdTVCWC9YNmttQjRKN2doQzQxeVJm?=
 =?utf-8?B?b2gzMVVEdDNmbVZXMlNpMWhWeHNDcFlaV2lxdmRRMGUxSEEzL081dk4zRXN1?=
 =?utf-8?B?RTRXL0NmQm51V1oxVDJoN01DZTVhaDRxOWV6YkpqaVJuNEIwV01UUWJSNC9o?=
 =?utf-8?B?dHpEWGU3SVNzOW8zcFovaE40Zy9oM2pPZGZvRlZLTVBEWG5nZHh0ZmdpcUVq?=
 =?utf-8?B?ZVFyRldKbXhIemV1VUl4WXErdkdob2w0RThURnFSMEUrcENYNkl4bnBpNjhR?=
 =?utf-8?B?UzRib2g0S0RDTXRIMWUrTmV4UmNLanE1MWY0YlRvTUthSEpwT3c2K3NZRGV2?=
 =?utf-8?B?UEhQQVZQQnBzbDRyZDhqNXgxeTNBSVRzWThHNGdJZVFzakpjNHdsRWN3Nkpi?=
 =?utf-8?B?b1NpczFQLzZYSkpNODFEMFNPZC9zalZXMVBvbG5ucTNqVm4wdUloSWJKYUlt?=
 =?utf-8?B?dXA0aXVuaC83Z3pUQkEvV3YydGY3dVRNT01YMEh0NmhVSDhxbVRoSHZZaUps?=
 =?utf-8?B?Rm5RWXZQaVpldGRXOXhuNHVHcGpsWjlOeXdDS2x4d3BjNlhPVWV1OU9PRGVi?=
 =?utf-8?B?ZFRTbGMzVnpOUm40TkpZZFJvNHZTZjdiakxsaFhmdmpldEh1NWdsMzc4K0x4?=
 =?utf-8?B?UUVIZ21PeTMwT1BsVzEvR3NZc0dtaUZEVnU4RU5WeXRyc1dLWnh2Z2NST0h1?=
 =?utf-8?B?Zys5TUswTHpTMS9aZVprWWJ4NW1BMjk1TkNUOFpyMjdPbzJaazFMOHdRdUFC?=
 =?utf-8?Q?/8+u/iXF1/A=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(366016)(1800799024)(10070799003); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?a1d0djlCREk3OWtQTXRieklTRnVtSEhlZ1FPTFZ6anhMTVFlWllwcEZ4Wlll?=
 =?utf-8?B?bTBvc2diclRVUzVXTmdRdDdXTDZrQ2xZL1o2cDhqTVF2azJiQmxiVzdiakNO?=
 =?utf-8?B?bk5CbVZhQmlnV25FSEZVOEFtSU5xZ3VQeGdxNVljZGFUNUN6NnBiaUZWczJm?=
 =?utf-8?B?U29RVDNrMmRmS1VoVm1UT0JhU0N4MitDNURmekZUMmNvNWw1S1VjZUlZZ3l5?=
 =?utf-8?B?MExxTzlMb3B1OG41WU9OendxYTYrcUVhbkluaHVDbGwwSSt2NHllWThuSHF2?=
 =?utf-8?B?WS9ON0M0WGJocFd4N1IvSFI1Y1BlZXMxRnF5V3pXSzRqQldUQ0Y3ZHF2SnB5?=
 =?utf-8?B?RVlNTDRYNUEzWTlzWTdaZWZUck13eGp5WGJKMEhUVzIybmJVOG8ycmwvQmIy?=
 =?utf-8?B?SWQyZHBFR2JMbVJ6SjB5ZXRVQUkvQjlTbHRFVXNiSzlzVE5VOFVaaW8wbjBG?=
 =?utf-8?B?WE5kbEdETkg3djV0R0ZwQnV1UWJnTUN1Y2VFbEJxRjZPVC83aTd3eGZ5M2hz?=
 =?utf-8?B?YXN4c2xCUjFpZk1XVDlwVG9zaXpBb2M0S2YyR2phYVZFNjA1QXJUR000aTk0?=
 =?utf-8?B?VmRhZVF0U3QvZXNuOFRmTzBBdWxaTFdzQk94ZEE0UXRaQktVUW90NnRDVWoy?=
 =?utf-8?B?bXNKSmIwUi9raXc3S2d2UHQzZmIvWVQ1Y1FVMkp1MENnRnNEdzBacWJhbWo5?=
 =?utf-8?B?TVdzS2dlVHRyV3ZvUksvZ1liSFJTWnl2QjdTaEowZ1pSbHIxQTB3TGZrY1ZV?=
 =?utf-8?B?SzRSR1VsS1BSOFJlMTljNHR5RnZMMFMyTTJYMkphdTViNVB5UWNUWXBYZWs0?=
 =?utf-8?B?SFBFMlJzZHpveFlBK09PZFdaejFweFJZVkUwcm9wSCtWSGR3UldYbUo5cXBx?=
 =?utf-8?B?aHJsUk1mWTkzNWdLbllzZW0xNG14aW5McFJIZ1YyOE0vTGQyQU1wU0Q2Nzli?=
 =?utf-8?B?VmN5dG5IZjZPc0Y2NXRGU2RUZzR0RG5zcHhwdGNMSVcwMzVCMnlYTGg1Wkt5?=
 =?utf-8?B?SGRpdGx1eklsbXdRbGZRZTNKa2RCcDNGdkJEaUVUdG1TYlIyekNMU1phM3dm?=
 =?utf-8?B?ZmZnNzBLK1pNZUNoV1NZcEtyVzJGN0VSdWY2Zlp2SG9aa2M2UnJ3T0JNYVYx?=
 =?utf-8?B?YU9mVVlEdzRqdHV6M1VRT0ZFNVhaTVRjTGdLV2FwMytZeTI1Wk9UcnZubWpk?=
 =?utf-8?B?VjkxeFJNT1JzRGdrQW9BZjBib3MydTd4NEMyL1NwU0JkekF5L1pFeUF4REoy?=
 =?utf-8?B?cGhUVFZNcEhSeU5IK01namFEeUdUbUh4TWszZG1yM2d0L3NYbExBVjdhUzk4?=
 =?utf-8?B?VzJKNnhwYjlmY2dsOWtCMHZSTElyWC9NV0NQUjdxbHNqdDFCcXFRRDRmZk1t?=
 =?utf-8?B?OC9mMm5iOUxrSVJJZjMxQ2RJUmkwOC9GazB3OGJsaWF4ZjNzT21ZbWpoSG1s?=
 =?utf-8?B?Vk9FMC93WHc4MWkzZjdxSEc4WDZyQjc4R3FINFdaZkJyTVBnNkc2R3ozZGxR?=
 =?utf-8?B?bWFxdkdoQ2lMV0FIdHdBTC9lZHFwZmtvcVZLZ0lnbmxucUg1ZWk0ZDNsN2NL?=
 =?utf-8?B?eW1pNzFiY25XeUhGb0RCMmxPbjF5c2NXaHBCQ1dPMmN5SDZyR1FKckhLZ1lL?=
 =?utf-8?B?dmpiaC9GL0hPbXlxLzRpMHNRN3Y0emdVeEZQNjllaGZnVWw0Q1Y3UEV4bHor?=
 =?utf-8?B?aUxxbm5za1lKVGdTSVdYU05KUFpyZzBsL0ZsVkFoLzlFLzdUVnhucmlpclR4?=
 =?utf-8?B?dC9rcXkxQU9OWFpCUDJjUnIzTzNCN3JyaFdSb1FUeDZnSndOaFRZT0FoUGJn?=
 =?utf-8?B?Um1KQ0RsMVNuNXRQRlRoaW1SVHZNdENEYjlBMDBTc0pUMTVBNlREaE9IaGZm?=
 =?utf-8?B?TlVKWUVPOVRnZzkzSmZqNnJxbGZVOElPeXdhVXZYS2VydDcyR01odXhKb2lk?=
 =?utf-8?B?T3dCUjhNVW5OSnZOZkZGU3QzKzRZdXJCa0F5MmpTcDlSLzF4cVFzamJaUXQ4?=
 =?utf-8?B?SnRBamxncHZKc2t4NUVudzhFU3BxOFZ0MjJFaFBmamk1ZjNQZ3RJZFVyUVRX?=
 =?utf-8?B?R0c1anVDT2xqK2FrVktGVGpDMnVzL3hWVmFzY1hSRUZ0VGdESmFkY2VJL2hN?=
 =?utf-8?B?RFA1ZzRGMk1KalYvMU9jcU0xTzBtQUtPeGlXUzlUdkhzMmRWRHNQYlkzb1VX?=
 =?utf-8?Q?cwt1JXYkbf6613vpqbJMy3/jfjMogRZBb5qXSttNruKX?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 33638343-b08d-4786-b2c3-08ddd423b36f
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Aug 2025 13:26:35.7246 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UUbxSCVtOsasxUSZVXJLZyQmFRcaoESIFcQllF7tvN1V4T1/J50M0t3XcIkpuQ5uHqhymOm68a14LwGLGdXtew==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR12MB9081
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

On Mon Aug 4, 2025 at 11:16 PM JST, Miguel Ojeda wrote:
> On Mon, Aug 4, 2025 at 1:45=E2=80=AFPM Alexandre Courbot <acourbot@nvidia=
.com> wrote:
>>
>> - The `last_set_bit` function is dropped, with the recommendation to use
>>   the standard library's `checked_ilog2` which does essentially the same
>>   thing.
>
> Yeah, let's see what people think about this one on the kernel side.
>
> I don't mind either way, i.e. to have a few wrappers with slightly
> different semantics if that is more common/understandable.
>
>> The upstream `Alignment` is more constrained than the `PowerOfTwo` of
>> the last revision: it uses `usize` internally instead of a generic
>> value, and does not provide `align_down` or `align_up` methods.
>
> `PowerOfTwo` seemed fine to me as well (or even implementing one in
> terms of the other).

`PowerOfTwo` has little prospect of existing upstream, and I think we
should be able to live pretty well with `Alignment` thanks to the
suggestions you make below.

>
>> These two shortcomings come together very nicely to gift us with a nice
>> headache: we need to align values potentially larger than `usize`, thus
>> need to make `align_down` and `align_up` generic. The generic parameter
>> needs to be constrained on the operations used to perform the alignment
>> (e.g. `BitAnd`, `Not`, etc) and there is one essential operation for
>> which no trait exists in the standard library: `checked_add`. Thus the
>> first patch of this series introduces a trait for it in the `num` module
>> and implements it for all integer types. I suspect we will need
>> something alongside these lines for other purposes anyway, and probably
>> other traits too.
>
> This part could be avoided implementing them the other way around,
> right? i.e. as an extension trait on the other side.
>
> It may also be also a bit easier to understand on the call site, too,
> since value would be first.

Yes! This is much better and more intuitive.

>
>> This generic nature also restricts these methods to being non-const,
>> unfortunately. I have tried to implement them as macros instead, but
>> quickly hit a wall due to the inability to convert `Alignment`'s `usize`
>> into the type of the value to align.
>
> I guess we could also just have one per type like for other ones to
> have them `const`, like we do for other similar things like
> `bit`/`genmask`.

This leaves us with two viable solutions: `Alignable` extension trait
with `align_up` and `align_down` operations that take an `Alignment` as
parameter (with the caveat that they could not be const for now), or a
set of per-type functions defined using a macro, similar to bit/genmask.
I am fine with both but don't know which one would be preferred, can the
R4L leadership provide some guidance? :)

Thanks,
Alex.
