Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 86334B4A470
	for <lists+nouveau@lfdr.de>; Tue,  9 Sep 2025 10:02:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3790010E642;
	Tue,  9 Sep 2025 08:02:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="ujABjr6v";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam04on2082.outbound.protection.outlook.com [40.107.102.82])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3657010E642
 for <nouveau@lists.freedesktop.org>; Tue,  9 Sep 2025 08:01:59 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hW+GgWqMe3Nf7dM7EzUAJo6HbxMrAHWu3oMqvKaFed4jJBKaYJ+Aqh89vYqKRIiDekjLBNHenzmvus+p+0X8EOMhltnhHhaLKrW+YpLc2RgtemS/5w+VYT39Ikt2jWXOpCH24ifmojlwXUZ3pkm1yTvLkNeS65wkWSePnBI58bvNWC0zYSLKymrEGGol8QyoteDyyxVcNQKouUqQxrxRsCNLBR/NnpxR+OzqFgfo5Tq6bu4DAoivI4C7GiINyv92CQfuqtSMhv6xZI8aI98G7V9IAf9fXBqgSX+a1emqPe8oApkh5weFcigvYt/kTSLf9Gf22PKsRfqSYi2X5lxwLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ENXg6YjkybWHm92OgGnT+KAWkCciH2yK4UVv2GnUmos=;
 b=gLKLIF20rY8xYmIwRPZWpseGZLSyZ0A+7miqhjhAgCvcWOD95LJZu1fWfg4ktiPXu/WilT2fN9+0GSj9Bvh3ZVeKdYpR/KFHlTT84bDqk0xcQAb0PB5pSQKEEXqNizf7+J03au6BlA/SY0vIfkc6X5Rwhp1kanfaWOHJRPblG4qQx4WbvsUWoXLHwM2zY2bEk8+9nYkikH5TzDhnEdVoWWKz6xhk9gyPvWaHlNoXiga84V9LckaeedwsnM1Jb0amI3SwEaoC3Cn4I+2mYz2IBipPC3vMg62a4s6orQYcWq4vJ0AlKB/bmEqAzH/hd5ci6cwCEj3GWl/14iqfiGhPPw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ENXg6YjkybWHm92OgGnT+KAWkCciH2yK4UVv2GnUmos=;
 b=ujABjr6veoCn+qElNVLw4F+bMc5dnhehcswkFuXxWWbYma2Po8gMJnc5hgqZwo9mna14gRGu3Bq8wFNjI1eDcvKX2eKDO6If1zzWYkXss405tjyMZ+VvdkS02eFoh/rCvM6JbdKGnvowluTyHECwRkhx7E9OWV61EePTbQU+MM9y9WEhMFUVRn8pCAaBcncDehwL+FUkD5LIZl+eZPwxlZPBRVwUhv5s8bzKiugCpFX9ZH6U8uP5j/mpcvrsPwa9grexw6YXaEuhQpSeDorKq2k4pZ7H4j1HLM2+3aoRz0yK1UTgdHcTnr1dwrhacxsSz3HwAniQxuqKhnJeZ5egkg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by SA3PR12MB9180.namprd12.prod.outlook.com (2603:10b6:806:39b::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.22; Tue, 9 Sep
 2025 08:01:54 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9094.021; Tue, 9 Sep 2025
 08:01:54 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 09 Sep 2025 17:01:50 +0900
Message-Id: <DCO41QCYSBPS.KG2XPSWJSC6L@nvidia.com>
Cc: "Miguel Ojeda" <ojeda@kernel.org>, "Alex Gaynor"
 <alex.gaynor@gmail.com>, "Boqun Feng" <boqun.feng@gmail.com>, "Gary Guo"
 <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>,
 "Trevor Gross" <tmgross@umich.edu>, "Danilo Krummrich" <dakr@kernel.org>,
 <linux-kernel@vger.kernel.org>, <rust-for-linux@vger.kernel.org>,
 <nouveau@lists.freedesktop.org>
Subject: Re: [PATCH v5 1/2] rust: add `Alignment` type
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Miguel Ojeda" <miguel.ojeda.sandonis@gmail.com>
X-Mailer: aerc 0.20.1-0-g2ecb8770224a-dirty
References: <20250908-num-v5-0-c0f2f681ea96@nvidia.com>
 <20250908-num-v5-1-c0f2f681ea96@nvidia.com>
 <CANiq72kUsG10+E-W6zhFXhexZV+O_a-K1Px0kGkWPKvMMhAztQ@mail.gmail.com>
 <DCO2UHSV1FJH.146QJD3UR8FVR@nvidia.com>
 <CANiq72khp7PVeKmbvM=ima7Tp7o1zPfjNY6dRK79aAQZsOvBPw@mail.gmail.com>
In-Reply-To: <CANiq72khp7PVeKmbvM=ima7Tp7o1zPfjNY6dRK79aAQZsOvBPw@mail.gmail.com>
X-ClientProxiedBy: TYCP301CA0029.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:400:381::15) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|SA3PR12MB9180:EE_
X-MS-Office365-Filtering-Correlation-Id: 52c76b37-ae02-4853-4bff-08ddef772416
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|10070799003|366016|7416014|376014; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?L2RhOVJVSjEwRFgxUlpyTlRIUTFJbzlHZ3lkaFpIK0hTN2JEU0J1cHo1a2tV?=
 =?utf-8?B?TnpjYVVETEtIRFpHZXNEODAzbTU0c3RHQnJnN2tWZ0ZmRkwwVHNIV2dRMWZ2?=
 =?utf-8?B?dXJHcG40R05yWEUxSzFlQkE1UkNKL2VhaGZwbEZQVEhuUUpmRGNtdGJMU1hJ?=
 =?utf-8?B?RGpaQ09JOFh2LzQ4SU1rSlIwRGU2b2JqUXV0d0VCdThnMFFPa2QvRi8vbi9p?=
 =?utf-8?B?aTZxSDVTVW5ibG5CdVIwS0Nwa3RScllsanlYQkJDRzh5YUJnZTRMUjA5ZHBL?=
 =?utf-8?B?Vmt0QW5BYXh3QUcrVDU5c1ZKUGJTQytZMmlLQkZJSmRKUGJEVjROOVhqdllx?=
 =?utf-8?B?M1VpaTd1NXdNQ3k0cTF5bUM0dnpJcGIvRUlqdW05eWZRM1dIL1NyTFRRcHlj?=
 =?utf-8?B?TFJjb1Zud3VuVGdLNDErV29waEJodDh5aFVERjN2V0dlU2d1R2k2d0MrYnRx?=
 =?utf-8?B?NFBlU0YxdktDWGlYcXZQeVQvemV6NS9BQlQvM3B5a3oyR012eENwcDZINVVV?=
 =?utf-8?B?eWNINVhDd0sxU2diMGRvRkVHbEFHdEV2c3l2cDkwQWxQR05VMGlrQnlBSDZZ?=
 =?utf-8?B?UWM3YTZEd2k2aXE1WEhOWlYwVmFVMWx6YVZESEJDaThmakdacWlUUno1RVBO?=
 =?utf-8?B?WXZTaElMblNhTmJyTXV1ZEV3ekVkU1MrVk9JWFNxUlFMRXdsODhVZXk2dEZa?=
 =?utf-8?B?ZFhCYUUwUDY5UzlWaXI0NkQrSnZLZncxOC8wQnM4dG9zK3VMdjNGUEJXeEND?=
 =?utf-8?B?VHJEeFhwNS9uQmRZK0pxcm15RHdvNHZaZUZUQ01aWWZCNkpUdnlPYnRwRUNw?=
 =?utf-8?B?UnFpanN2ZXJhNVM3TjdaVjcveUVRYldzaE81QnozMFEvd2srczErSnZKOUpE?=
 =?utf-8?B?NlhJM1YrdFdyanB1ajFFQjQrenFhL3dGZG5BaGVKdS94enVac0s5azhGSjJ3?=
 =?utf-8?B?dXh5WXZxSStqb2FlMEgyZzErM0F1dlozK282SUFxQWo0NlQ5bUkzNCtxNWcy?=
 =?utf-8?B?aHlHN2x1VWpRaHVXNzVVNm8xM0VuWXZJc3ZKeS9ReUhjUUhsaTVFYjVhRVVr?=
 =?utf-8?B?c0loZlpGcnRMQTZjSnBPWW1DQ1daVUFaQVVOR04rTXprZTdKcms5NktSMlFK?=
 =?utf-8?B?ZDg1Sndpajlrby85dVJqZTQ2QUJ0dFlEamtRRHlNbW9xS3hhKzNCdjV4QU9s?=
 =?utf-8?B?ckg4Y2lWZlRueHNlbi96SEtLZXF5S01vc3VybHNySWNJdDV1N0ZCa3pGNWQ3?=
 =?utf-8?B?bFBMRlpXU1V0bGtkK2NoSUpEUGtYQlFqMFFHRkpXeVVjZkd1bVNEYUo0dVJ4?=
 =?utf-8?B?K0V1K2lSZnN3dmhvbG1NbWtIUVZWeEw5SzFrNkVGc280cDFIQkNHQ1NHUFJr?=
 =?utf-8?B?dEJNUU8yOW83bnJ2ZUo4Y2pCUjZVTHo5YkVQejBIb0RYaExTNGg2dFc1QWRE?=
 =?utf-8?B?VU1pQWFYMVUzV0x1Wi8rVmdGazQ1UnVDdWtPTzh0ek0xUTFyT01WUW4yZnB0?=
 =?utf-8?B?WTFYVEdYQ2UxQ2dzMWd4V3BMaUY5TXo3YWYrZEVjcTZLQlFmRG5TVUxFbVpj?=
 =?utf-8?B?eXdJMitVNHdGUEVkTDJtZjczTzN3ZVZVY0FQblNKV2VRRUg1Nnh0NGdpQlVs?=
 =?utf-8?B?TDVEVUN0MGoxeGNiQkJrRDBUSklQM1JyTkc3NWJydnI2ck44aGtyZ29aMFp2?=
 =?utf-8?B?MzZuVGRCckxkTUo2VjRzK000NTFsRGt3SEFFQzVjT2pBK2NwTHhodWRqa3BL?=
 =?utf-8?B?bG5jTTQrTlBWeE9IQitNV1hkYm8vK2V0dmRDMjZIeWxXZ3ZBOGJ4cSsrMkRh?=
 =?utf-8?B?dmRMOHpLb09pM0ZaaGpkVkNBQno4ZmdsMVZQc3hNblJ4dUZHakxCUTcwMm05?=
 =?utf-8?B?YWU3ZEFDZ2pmWE5pUFJFN0dpYXFZaWwyM2hyc3E3L3ZZMkJXanVWbWs1N2xL?=
 =?utf-8?Q?72Hz1fF4bO0=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(10070799003)(366016)(7416014)(376014); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UHlJbDlWZWVvVDU5dkNodXVENWVrelpISTd2WU9LTWVzRGFYN2dxMzlhS2Yx?=
 =?utf-8?B?Z1NrdDJwQXI4bEhVNURWT1pZbUlZSGxoVTNaaWQrR2k1Umk1R1owNUlqVElJ?=
 =?utf-8?B?NllwUFU0NWJLWndra21LZCtaVW0weElESy9aVlZkT2V2dlFhTFd1V1RDUGFw?=
 =?utf-8?B?ODVudUZLL1cxNk5sUk5LZEZXdW1qU2JPU0cyOXh2VDg2cVFDS3pnMW5VQWsv?=
 =?utf-8?B?T1hNZDBmTk9WaUlwanNOd2NUUmhUYlpmVEFpSHFwUVQ0bjZ0MXFONE0xSmpu?=
 =?utf-8?B?Y2pJdWtUcmttcjM5Z2hVNXFDRm9PMGRYRFA5UVNVK0JBcmp2V1QyU2FXYmV5?=
 =?utf-8?B?SUIzQ0tHY0FtUkIwSWg0SW1paHVyWU05RlNRSXBEb2VxOVhpaUF5dlc4WTJi?=
 =?utf-8?B?dVp4VXZWKzN1eXV2aFBwbi9adHJ6NjFYUG9YVFZJMXVPUHQ1bTc5VnZydTB0?=
 =?utf-8?B?QzQyUjV4YzEydlhkZGVGYkJZM2VRLy8vOWF3azJIS09EYW15MUVWYzRLbHN2?=
 =?utf-8?B?V0VFVlV5QmZTZ0E5cTFWWmh1QTNXdkF0Vm95WS84SzJpNmthNW1jdDMrbTVz?=
 =?utf-8?B?bDNxa1c2bkJCdWpDMUZ2dHdkMTlzMmdrY0pMaGVVNmNKK1B0VTk1REt0M09r?=
 =?utf-8?B?QXZQWkkxN1YzU2hYRXg0NTFabFNZTTIybjJkbGRvZ1V5ajRJWDBzMVBnMXYy?=
 =?utf-8?B?djdRL2tTZTJJRk40UkRKRnVuNXVGblBVN2RRSkVDVmJkWjFYUjhWeExjYjlD?=
 =?utf-8?B?WjNBNTFucWtWTUppcTU1OTVrbjNwUWJxbXlmcW5PSnhFTmU4eXFkbk9qSkI4?=
 =?utf-8?B?VjVSeC9LeFhVK0dSWVdSY29NQ3RSdXJEMW53MkRMR1RSNThpazU1cngwUHlp?=
 =?utf-8?B?a1BySW1aY1NmR3hUdmJBOVVvNTVsSnJWdEhHdVRWNllFWVVyRHloT04yR3o4?=
 =?utf-8?B?MmRrbGJBci9tbEFjSG0wdXg4OERGdytWc2p0RXlCMTRpUVNvRCtvN2paYjNp?=
 =?utf-8?B?L0JIbDhMOVhHSnZoeTNZODBWV3BWRWVaa2haZ3hQRHlQbjE4WUxWN2FJWjBG?=
 =?utf-8?B?VmowZ3B2MEg1ZGRYTW9pTjIwaVFSaE5MTnlpY0R1azE0dTdURTZNanBYdEFt?=
 =?utf-8?B?QkdaVWRGWnZLd1ZVMDY2S0xKVEdYQ3A1Y09SUXZtY0J5K0hRTUhVVC92ZzdU?=
 =?utf-8?B?K2xORnFSYllzREtVdzVyS0RSS3JuU3JwelpqUGx6NGU2WktUTEUvOXFuMytI?=
 =?utf-8?B?WTR2ZVdlQ1JJU3ZuZSsvdHpRM1ZOVVJ3c1UxdnRWRm15d2tjRWpEMjNxT1lT?=
 =?utf-8?B?L0JEdGZQK05oWGJnOXcvNTVZRGcyMTJ5TFkycEhvT2pMVUdZejl3bFRnS0Uw?=
 =?utf-8?B?LytCNktmWGF3M1dSRXZScmZPcSttY0cxcnJnbUlkeVVSSDdQdkV2blZwTzcv?=
 =?utf-8?B?WnM3WEN0eTZkTmJnOG5WeGVYVElpTi8zLzBrWHNjdEJDMlJOM0NDcE11NDd6?=
 =?utf-8?B?eFNLWVNaS2JIZnVMVmZrRHNZYlhqbjcwNXRrelJaVEtiaGZsWnNEN3BWR1lV?=
 =?utf-8?B?N2N0cCtGZldpOUxrdG11QWVSdjZ2ZlViYmViN2pSTjlycm9kTEtGbHpLVzhR?=
 =?utf-8?B?U1kycEdJM3hLT1IxcDBGZ3h0alcwS3N2blZRdlVRNU9KaUtqcCtzY1V6OTRo?=
 =?utf-8?B?T3pqOFRBck9RcExXQzBUVzFEYXd5b0d2MmxCWjZSelA5dkZKVG5sWmlieUpY?=
 =?utf-8?B?UmlNb2RobjFJYUZtRWtHNEVvdG9jeGQrWTJUV0xTL3BWQ2hXSVEwdStqdVdE?=
 =?utf-8?B?THQxMkJrQjY1dEM0aUtKSHF0RW5lM2Y2cGZsbUVuTy9uSzgxUTd6NitPeFdZ?=
 =?utf-8?B?WmZ2ai9VK1ViM3VnNkMxZjlYQkNncnhBcXpGNUI4WGtFR0pSc1FWYng4R2lj?=
 =?utf-8?B?bkwvUUlzdmFtZmtJMFZ6WEh6aGJYNlBScXJCamRtcGJUUHQ1R2FxcklCRDFX?=
 =?utf-8?B?amdJY0V4Qkw3WThyeE45WmxOWHNlKzZ5RXg2TzRjUXp6NnZmMXU5azcvaGpi?=
 =?utf-8?B?c3p3bjI4T2dDajlwRUwwMkZ6YXRXM2Y0c09KaVFGQzczanc4eUNubkduWEpU?=
 =?utf-8?B?Um5nQkhzWDY5Sm16b1QvdmNHQ3VSOTNENkRMSnlwMDVpTkVlaGcvTU53RmpO?=
 =?utf-8?Q?jr63V1Am65EeQNc3GZ00QMImgk4aBSOhTIJVBPyxLASg?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 52c76b37-ae02-4853-4bff-08ddef772416
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Sep 2025 08:01:54.5965 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1aNfFPfbPSyHPgYP2+rVJli22OLSlme8fv5LW8q82ldZpMi1c0656et0PFKVuNX+6BFqsW4kkcpVzCcmEwt2QA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB9180
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

On Tue Sep 9, 2025 at 4:21 PM JST, Miguel Ojeda wrote:
> On Tue, Sep 9, 2025 at 9:05=E2=80=AFAM Alexandre Courbot <acourbot@nvidia=
.com> wrote:
>>
>> With -rc6 approaching, I don't think we will merge any Nova code taking
>> advantage of this for this cycle, so please feel free to take this
>> patch. We can then merge patch 2 through drm-rust after -rc1 is
>> released.
>
> Sure, sounds good. I can also take patch 2 already as a user of this
> if you prefer (ideally with an Acked-by).

Ah right, you will want to introduce a user for this new API. Sure, feel
free to take patch 2 as well!

Acked-by: Alexandre Courbot <acourbot@nvidia.com>
