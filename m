Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 56891B1E577
	for <lists+nouveau@lfdr.de>; Fri,  8 Aug 2025 11:15:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B822810E1D0;
	Fri,  8 Aug 2025 09:15:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="crBg9N9q";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2085.outbound.protection.outlook.com [40.107.92.85])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2CCF610E1D0
 for <nouveau@lists.freedesktop.org>; Fri,  8 Aug 2025 09:15:45 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cVz5/egoJvUDHYdf787LH1L1s+bqh4Syla7FITvJhB3ETSdHHH55eXMg+tqG7hJwU/ieK7UeHCYP/Clmc+Zt2eoV5d172S4KmwojskFD/kkAbMRqhJnj5d458ENauJnBFbIlLBr9g79LOcorZy2YJvMK3nApvMJINqJviOf05XKwjaE3SBfBQ8XbqxRhO2ea/J8dDbkDX08aaOnbHWElBPUMgA84FJURaI6z05OVgyqeOkBzmMf8vk/CgYq/PHqCXyAEHsHZAvvTk7ljUklSGgQ5yw+BpZ4f9OKPaRIbDvCfwj8JxpOAU22jaiymh+1gTuX0C98Vwa1YKcx8NC09aA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UYJAgD3EUlfp79kLnA2AvPjVi+iBLAV5hJ/q5mzCKAA=;
 b=thpLKnNmGUh0nlD49TxW9lmzG/jjAE8nSfQmV+R4I4wPwRrwXjhZkggioPUYG2iNZi4u782o46b7JYI1h5GMArO1vhnOKEyKWNkQ/DFaqLo79UlmJLasn2Cxki+BIGIx6S5/+9W7Asi8Ub0ludTZA970NP5su7Te1mN3eWFPhh3tGpH6h5uNMY48Vss1uYxheabg2BC8YEwNiJO6i+jL7+jbLyGd/sVwjt3IC8Uo4H1MnsHrK6TSZiH0F+fzV0dLa8WlDXxWe/t1Pu9bXv0rRoc0epcOrX85/FIaG+2dvLN0FtJ3O6gZMrfJ57OjOUsBDGkHEfDZs9+MSWfrwffhVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UYJAgD3EUlfp79kLnA2AvPjVi+iBLAV5hJ/q5mzCKAA=;
 b=crBg9N9qYjW7HqbACwHoIRm/RrJOG/pUKaLMNp7gONR5wE3nLpMBwbSO9U6NaRktdJvxZs/bwPwJFvYrvm/dAQGPEbJL6rFWk4SXfF1caLTzh/Kzj1pYdTeC5X5rRIzpAV+3otnr86MV5t8LpwZ76L04pHogEkdKV/SYKTKfy5Ewugc1MDVkQ2qMqQRTTWvb/V9Wft0cS1fehOov3B+bPjFM97YlXFm2FKjp3gk4lA9/nzZ2qRIwxTzVnJchY29j8da73LX1lndSZ0MNdPB0HHEnApi2FDfBLMp+EaJ1YReWyrM9fDRmvUpqaelN3H1BQZlYnUGJPJq6oApktspKuQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by SA1PR12MB8118.namprd12.prod.outlook.com (2603:10b6:806:333::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8989.17; Fri, 8 Aug
 2025 09:15:42 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99%3]) with mapi id 15.20.9009.013; Fri, 8 Aug 2025
 09:15:42 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 08 Aug 2025 18:15:38 +0900
Message-Id: <DBWXKSVX1LZQ.11O609104SBQ6@nvidia.com>
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Jesung Yang" <y.j3ms.n@gmail.com>, "Miguel Ojeda" <ojeda@kernel.org>,
 "Alex Gaynor" <alex.gaynor@gmail.com>, "Boqun Feng" <boqun.feng@gmail.com>,
 "Gary Guo" <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>,
 "Trevor Gross" <tmgross@umich.edu>, "Danilo Krummrich" <dakr@kernel.org>
Cc: <linux-kernel@vger.kernel.org>, <rust-for-linux@vger.kernel.org>,
 <nouveau@lists.freedesktop.org>
Subject: Re: [PATCH 1/4] rust: macros: extend custom `quote!()` macro
X-Mailer: aerc 0.20.1-0-g2ecb8770224a-dirty
References: <cover.1754228164.git.y.j3ms.n@gmail.com>
 <c9637a605dd718ce25311c736d208ac9ecff18ad.1754228164.git.y.j3ms.n@gmail.com>
In-Reply-To: <c9637a605dd718ce25311c736d208ac9ecff18ad.1754228164.git.y.j3ms.n@gmail.com>
X-ClientProxiedBy: TYWPR01CA0021.jpnprd01.prod.outlook.com
 (2603:1096:400:aa::8) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|SA1PR12MB8118:EE_
X-MS-Office365-Filtering-Correlation-Id: e01d579d-5bda-4ce6-7893-08ddd65c25f6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|10070799003|376014|7416014|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?UHBOWGVFTEpNQzlDSnFQakxHR1VxM2s0Z25iT3pYRjBOa1RhU05kVVhCek5L?=
 =?utf-8?B?elJvUFBoK3N5bjBnNUFjSXBnMVNLNmpnVUpUYVZqQ3M4Q2VqTlFOcTJCdWtX?=
 =?utf-8?B?TW9ybUljREcrV2NuRVZtdmN3L04wYTJ0TjJXcUZKNi83a3FnTkJTK2lpMmJG?=
 =?utf-8?B?WFNnRFdSczlHZm9IbDMxclBoSCsyaVFGMWZ2MVQvNWxuWkFrVG80L3ArUHln?=
 =?utf-8?B?aGxweDR2S3JuajFRZ290WmNQNTJhZUVGdUNzL0gzWUVqenA1RnJZYzRjRHVP?=
 =?utf-8?B?RHlubE44WHJIUUYxVUViVWJLb2Q0SlZwMWZzd001VG9oSXVhcVpSbU4vUFky?=
 =?utf-8?B?ckxBcktLc1JHTGQ2ZnZ1ZFkxN1NEaXBxQmxQb1RSZnhTYkRPL051QjBKVXUx?=
 =?utf-8?B?a1B4LzlwekhYaG1UYldNSjcxWlUyQVo4SzJIL21XWEgwR0VhRHZ3WUtBZ0Zx?=
 =?utf-8?B?OG5GWTZsTGFiL3pHK3VIOWlFNEdZL3d4aW5EdStDclBiaXJOcjJFaGN0QjVm?=
 =?utf-8?B?VEFBTnQ0SVg5UHYvcjhvdGZiYWx1L002cVlMR25Kd1BIOVZRWUJoanp4UHI0?=
 =?utf-8?B?K0RNV2haMVAyRmdhZVM0bWpER1BLZXlZSG1wMlU0UkpZYUFtelVIY1I4MDdP?=
 =?utf-8?B?dnovSGNBQVJtaWh4OEprYklFem85cHJZRkU5bFliN2svOEQzdDFqMk1Sajlm?=
 =?utf-8?B?L3JGVFZjSHlBMHJ6L09oSWdzNXBPMU9lamc0bDE0cnAydXV4cE5Pdmd4UUZx?=
 =?utf-8?B?aVNKMHhPUGVwU3I4a1dSSHJEdjMzcWxPNTMxNDY2MHlra3YrV3VtallGYml3?=
 =?utf-8?B?aENBS1NTbUdHY3FYS3dqbGZFRmhhR3BrMUJNYmlzQ0Y2YTBldmtFRXZDWllG?=
 =?utf-8?B?LzVBOTd4Y1ZEbmI4ci9LZU1HOUZVZU9KVlBlRDVMVVNLOXhWZEluU0FqQUpm?=
 =?utf-8?B?MnZhVGRDYTFJSWZYV0tNME5wbDlIMUlaczNGeDZPVklXcVhoK0JJSFAvdUtF?=
 =?utf-8?B?bE1nRHZYb21PYkRZclZ4eG1zTGo2RE9FbjVidGpiUTNkU3VNQmp6MU1iN0lU?=
 =?utf-8?B?Qmx5SktIV0dJNmpWdkpSMktyZjVxUk5yU2htaTQxQ3VjREYyTlZtTDFWZnM5?=
 =?utf-8?B?cng5UDA5YlpvNitLbCtPekl5ckF2b2FMN21sWTZ5ekZ2NWsrd05SenhkeWlY?=
 =?utf-8?B?SXlCbkxwRnR0Q3BkTWo3SjVoaFBWWWpNQ1ByQ296LzBHZUYyNkZ3SE9Jazd0?=
 =?utf-8?B?bEY0ZkZDMEZaYk4vY0lBRFp3b2Q5SkloSmIyYUxZVVVuNDhhejFrb0lQZVZH?=
 =?utf-8?B?UlVnR1drd2U3dW1ES3ZDTDBsaU1GQ2JTbUtEaVFmNEVJRDQzMm0vbkx4ZFBQ?=
 =?utf-8?B?djVaUmpDZzQ2Qjh2VE1yelpScTM5eU04OXZDOTBVeExqT1V3a0NDZ1Z4WkJS?=
 =?utf-8?B?YUNMWitWdVg3UVNjU0o3a3IvajBuYmdGbXRJdkVNRVRhb0Y3QmY2aUdUQURL?=
 =?utf-8?B?UFRrb2JBN0NhNkF6aVFmdnBOVkdJQVprUTg5QTV0TWNxTlhBNlQzdkdGZ2dh?=
 =?utf-8?B?RitjWU50V2FBRDQzME1QeWxkdWVCRENHNjZRa3VOUW5zQ0p2VHRiQUtFUWh5?=
 =?utf-8?B?bmw0OGNmRlNJM0JUK1VLbmdvYm0reHFjSzJsblkzVlY3Z05RMjRPSDdTY2dG?=
 =?utf-8?B?dlAzd2MrZllZeXZ6MC9rK1Y3eWZHaFFiNnlpMWRiL0JRa0luUHVUYXgwZkF2?=
 =?utf-8?B?WGF4dFV4Z25VcGF2elpEM0JiQnl5ZUZoQUVDdTV2NEhGQUpUWTdtSHU4RGZB?=
 =?utf-8?B?Zk9weHk1T2pDSXlPZlVFUm8xdERLeUxFZHdsU0tFZFBVcUV6WWdCaEQxMURX?=
 =?utf-8?B?RG51ZW5KQkJqR2ZmeW16Vy9IOUJEdXZHVjVUUTQrQm9GNFFZd25RdHFiRTcw?=
 =?utf-8?B?U21QSFhwc1owcEpialBWUzlISGNPaUxZWFVUdFNFcVYwZ3BpWm1KeDZ0WXJO?=
 =?utf-8?B?c2VGRkJFb0JnPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(10070799003)(376014)(7416014)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dlA2Ly9vOVlRV2ltcHNLaFlOWVRUUlVoSSs2OE96WEE0dDBVL2pCbHY4dGl2?=
 =?utf-8?B?bVZBUDRKeGc4b3hBeVJVRHVLZ2VLdjJBS3JCaCtveXR5eFJvN3JFalRKbnVE?=
 =?utf-8?B?bXA4RUM2VDNBdDlLd2kzWHo1OVpic0NzcStLbkplMkFXVFBIdEdxM2JzUlBY?=
 =?utf-8?B?aisvUG55OGRsbkhweVl0cFhVMXVlcU9kcGxGVnFpSlhtY0NqVUxsV08wVE9F?=
 =?utf-8?B?VGNQeVpPeHpQMUpGUUFsWEQxOEZOZm5aN3VPSWdiRzNZMmp6eW1ZbXJkdW4y?=
 =?utf-8?B?ZVNLdUt5S3NvM0ZkK2l1eWp2N25LL3ZiTUNIRTlINlUyWVoxWEpLL21RUWt6?=
 =?utf-8?B?MHlNeFBqVzBkZUM3TUN5U0N2dzRYcCtVNEJxMER5OXlPelE2cTlCWmtyUE1w?=
 =?utf-8?B?R2ZIN1BUNmthKzNMeW9veUdMcnQ0UGdmckRJQ3FJUC92QVM4QkRkWVRoMDdO?=
 =?utf-8?B?NXVRRDg4Sk1sWURmSEMreGcxVWhUcDBjaHdmVUJwNTdNQUtsWU5hZEE0Szh2?=
 =?utf-8?B?cGdQTVlTdUtFeEsva2RYZkFQRk5JdFZ5VjF1WXJzSXdCeFp1c3g3ZXRRckNs?=
 =?utf-8?B?VjB1cUlrQWhGUmF5ZjZtUTkyL0pRM25VUjhmcTl0QVZiQnhMaUs2VzhxM3hB?=
 =?utf-8?B?RTc3ZEwrMUNGT2dGRlpXT0cvU2RMUkNWYkdoUUFLa2hQeXA4amFSNE5tQURt?=
 =?utf-8?B?RlVLL2hFeHBibTJKUm1OZk5EZ244RmVMK0FEWEgzVXFua2pyTThJTW16ejE3?=
 =?utf-8?B?WnduNTZRQlZBd2M5aHdzVEs4N2ZjMVdxc0pYL1hKTTVRTTkwc2EwS0wzV00v?=
 =?utf-8?B?MFhOQS81VXB5ZzdwZWsyTFEvQ1E1WVo4MnI5ajJvdWRWemRsbzVFQ1VVUVVr?=
 =?utf-8?B?LzAwSEcwSEczamRyT2JHRlZKNENwQ3lpRkRONy9HbE1pK0IrNlE1Tk8yUTdB?=
 =?utf-8?B?bHNWY2IyMU1odFFoMDJKWlFlckxXRFE1RnBwd0NSa3FNenJERndwaTZvYmdh?=
 =?utf-8?B?bUZsckxQVFZVZ211Z3kvM0hQR2MwejE5NG1sS3VMM0J0amNNdVRxZ01aSktI?=
 =?utf-8?B?ZlZUdnNwZmZlMENJTDdKbDJkN3orMVBucVRoM29xOFllM2poTEhWOHdQdGRa?=
 =?utf-8?B?cWtjS3NOb2ZlMy9EeFJMZ0k4emRmTnZpYnZJMVo3bEwxNEJlc1JtM3Zhc2Ey?=
 =?utf-8?B?LzFXb0RZckFPVnNPME51dDlrQ1FlbjZwdEYvMEVaWkhZMTZEZk5lbisyb3Zh?=
 =?utf-8?B?ZWVKZ1FQMkgwaEIxS2VrelpzUERuT3NvcnhtWmx1aEVqcWxUblRxYzYzclFS?=
 =?utf-8?B?dC9GU3hBUHdQaXQ0S0lPTDg2OTY3N1RkT0RLS1oxZWxJYTNNZnZMRHB1UFhw?=
 =?utf-8?B?WUpYYzhORElINnMvckpMTXVxaVhxS2N4dk1XakY1ZWp2cDlYTnBWUFl2cGpF?=
 =?utf-8?B?Z0JvTkg4WlNITi83Z3FYMk9NOFM0L2s0dUZaYXNJSkJMRlZaWEJlc2JvY2ww?=
 =?utf-8?B?UHE5QnVjRzk4L0JVUC9YeDl1MTEyV1FtSkVsSUErMjVyY0tYajJXRS9GOEQr?=
 =?utf-8?B?eTJaM0NuVWRFdXBrUDl1TzBqRFRVbWh2Sk1nYUhYOWJia05nUEZTUzFYdnE2?=
 =?utf-8?B?UVNTOHVyUGlMTnpzR2lPS1E4MkZzTGZUejcwbWpJOWpabnhadWFtSDM2ODli?=
 =?utf-8?B?S3dzUlFXZy9QT2tsbzVxaVFPU1VCd1dJOUp3UTM0cFJ1MWI3aUNtZFk4Q2hp?=
 =?utf-8?B?Z3RSUHQxdjF5K0dsaTRRczlNQTdncHozbkRWV2Z4Uko2cy9lU0U5SXJRRWNr?=
 =?utf-8?B?YXFwSmFuRjgwTmJaWG03SVhXMXI0aUFPajNIclM2bjgwaWl2Y1VWOHVjdzlU?=
 =?utf-8?B?U2psbjNHK2JCb2ZQeXJKbVBoemY3b3ltN2dON3p0Sk5JalVoMXBoN3FIZHh4?=
 =?utf-8?B?dUFEVVEzQWJnazNQN2d0ZzZ6K2tIczdmS1ozRHdqbWd2UkUvOU9qcnhzTURG?=
 =?utf-8?B?TUsxTnM5RVk3dG5QT3VqUXRlTkhwTnFVa2I4NGM3M1BIS0pPbWhxS1ZQTU1i?=
 =?utf-8?B?NTZPdnVQYmdwLy96aFhTbmhYWHIxUHcyT2tWaFNRaU5ZZlVOL1JkdmpySzRC?=
 =?utf-8?B?Q3hUSWNDMnJYU0xzOW1XakpWN2lOTkZ4NXB4N3pDV0xqeHFaSzQ2Q0tpVUt2?=
 =?utf-8?Q?qgBJUZSTd4Fg98iodwEozxgdG2vnw/Wg4EsNOH3JFC+5?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e01d579d-5bda-4ce6-7893-08ddd65c25f6
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Aug 2025 09:15:42.0101 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AOFrmJu1xe/RveRew2cdYmVOcnwSUOMf29wKu2t+RJmGneqNec4W7dxQZcXbPoZHUy4qKgMIFp8ge1nMFJ5/Vg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB8118
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

On Sun Aug 3, 2025 at 11:20 PM JST, Jesung Yang wrote:
> Implement the `ToTokens` trait for `&T` where `T` implements `ToTokens`.
> This allows users to use the `quote!()` macro with references directly,
> avoiding the need to clone values.
>
> Extend the `quote_spanned!()` macro to support additional punctuation
> tokens: `->`, `<`, `>`, and `=3D=3D`. This symbols are commonly needed wh=
en
> dealing with functions, generic bounds, and equality comparisons.

These two paragraphs feel like they should be split into separate
patches, as they are not related to one another AFAICT.

