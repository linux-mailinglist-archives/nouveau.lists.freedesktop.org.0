Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DC5EAE1BD2
	for <lists+nouveau@lfdr.de>; Fri, 20 Jun 2025 15:15:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5949210EB55;
	Fri, 20 Jun 2025 13:15:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="p3HEpmoq";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2059.outbound.protection.outlook.com [40.107.92.59])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4EAD410EB55
 for <nouveau@lists.freedesktop.org>; Fri, 20 Jun 2025 13:15:16 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RU/0oLX3b8Jxr7j2DCzW+0d5jg+OLZiXbtGlDY5iipIdeMyCgTNrwQoKGyrSSAs8FQDZ8IVL2QT0mKHM1CjRP7wVe2g9p/nGqJViFJp59eM5KAkxEi48RskxvBwJuEpS4sG37xfhWbclNrlKYI0/Lc+ULR0USctFF+6nsopTy9RDGSlPJBH+GoVBoZD5zHzSDS//r1UROIAUA6+d46HRQ8rKgc0mkTRqI0cCJZlx9YcN/4xTj7UED9UOLQw+zYOKiAUXR4/LsBM2FzYb4AfXkS1NMyOuAycuCrQ+xdSK7jWq56CUETKVfzh49p9MDLF+cpJIQAId38W9vDVvAni/Sg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sxINqXmFm7uHIEYFDX2qSXVcV30MT4vfU6i7tn0CUG4=;
 b=a+9VtVQt3T5IAkm9yycg8NP1/fn/Q6m5nSPSkFnzlvL2MLxvvWlLKMelBeDmuwpXbparpkffbHTWRhbR2MijJ7Ssy0/KlhXxiisPUedgChm6reXLojMrZdHr5y5ma01MGEm6U4VZl/RpKsrsdACylzsvvNif1NaggidSnEzopZ+hWNA85DswkQTLdgRF+yLVWHAv51MR10LUVvpSQfYR8rxk0q4E4WfUw6TmJzygQLPCCNL2yf52YCHSOKgJ7lufxFaVS4Na9y3PG9RsBeoLn8zOEPT/k5it0RtjloOrTjNP0ZFe/kgAqJYP+ydGSLLwZTNJbIBlLb+I/SH2fIqhtw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sxINqXmFm7uHIEYFDX2qSXVcV30MT4vfU6i7tn0CUG4=;
 b=p3HEpmoqzbHqMZ/WNVNFe1aTj9OV8USeP3u0ctnJmHQOg2zV6I/SavEfzP8Ds3ei663SP5KUXL+OHeFxg1hSJLEZTdl3QzqEWfz1870jf2/cefsZk89fPUAfRAbwFWmX5r44ifoNA+AT9Lq8Z+ESL/fuvESIHexZ4LucHCh/Mv4B8F5mXj3NLdqt0NfiMeG9CsxGZw2avQT2omtfziuS0NUGd203AibjwZkM0DtHrqWPbk5Yc23N2XpSYqT5e1w4FUtnkvH2KDkpmJJNy8rwaAma2BMNeB1slE417WGiAC/jx3BIUQV3PUbOC8hoBIGx50hhw+cjE59K99yIF44hCg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by PH7PR12MB8426.namprd12.prod.outlook.com (2603:10b6:510:241::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.29; Fri, 20 Jun
 2025 13:15:09 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99%4]) with mapi id 15.20.8857.019; Fri, 20 Jun 2025
 13:15:09 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Date: Fri, 20 Jun 2025 22:14:51 +0900
Subject: [PATCH 1/3] rust: add `num` module with `PowerOfTwo` type
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250620-num-v1-1-7ec3d3fb06c9@nvidia.com>
References: <20250620-num-v1-0-7ec3d3fb06c9@nvidia.com>
In-Reply-To: <20250620-num-v1-0-7ec3d3fb06c9@nvidia.com>
To: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
 Danilo Krummrich <dakr@kernel.org>
Cc: linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
 nouveau@lists.freedesktop.org, Alexandre Courbot <acourbot@nvidia.com>
X-Mailer: b4 0.14.2
X-ClientProxiedBy: TYCP286CA0182.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:382::9) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|PH7PR12MB8426:EE_
X-MS-Office365-Filtering-Correlation-Id: 88decf0a-f560-425b-862a-08ddaffc7b9f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|7416014|10070799003|1800799024|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?TGRGRmxQc050WlRjZmpiWnVGRDd4bEFCbVdQb0dXbXAxa0NBeVhSalhUMHpy?=
 =?utf-8?B?Ui9TZ0Zxa0pKTXJNZDczQ0FablNDbWFaZzJHdGZrd2xNNEdjY3ZYa0Z0WlJv?=
 =?utf-8?B?OXNYdm11ZmIzb2hGSmQxbkJjamVpTVMyTVFQd2xWUnZOdmJicEdCQ1pNUVVk?=
 =?utf-8?B?U1dPMVdqbmt5bDJhcDVoS2hqKzQvLzlsaTZXV1RyYzlnQTdScXdycTBDZ0xk?=
 =?utf-8?B?S0kzYm8vTE1iZnpxcFVzN2lqRzd5SWl4bFQvY29BeXpKTVFubkp2OXdwLzkr?=
 =?utf-8?B?eFJnTDFISndJeDhxT0tTamFZRE1GUTZnVFc5V1dIZHBlcTlmNHFIcFZRUmdV?=
 =?utf-8?B?V3ZSTUtiSzhCZVpleFBTVytYNEoycjVQZ1JUamJ4N1U2Wm1OZktuQVdkaDRa?=
 =?utf-8?B?WEozTGNEVWE5aEJQUHg2RmdFSWoraE1GUVVWcXlwS3o0emFueUYzQ0FQQUlI?=
 =?utf-8?B?YjZ3M2VldVdZSHVPbytqYXpLbVgwUy9oOTN0SzFmaVQzWUdpSFhFRVFnbUVT?=
 =?utf-8?B?VVpXMGNKcm0vZWlpbHZCdU5uOGk2ZXJIeXNJekdGODFlZXlkZjk1cE1SUmt5?=
 =?utf-8?B?TWVrM3lUNHVzb3BLdU1aQ0xCLzdYWGpLSVYvclBYZjJ2MkVUWjlaUm1sNDFR?=
 =?utf-8?B?Nm9VRmxRcXNic0NkRkNSdXY3amVDRmJWSlllZ1FNcWFoVktDUW9nN0xjVnBm?=
 =?utf-8?B?TU1nSi9XWGxtNU4zMTU1S0hMQU1EMVp6RkF3Qmh4ZjFxMUFyaEsxZUh1Y3Rn?=
 =?utf-8?B?d3YzWWxoL3FoZWI1Q2xma0FwbHcyTmkwR0pYYU93RTN1MkdXSG4yMEtSM05x?=
 =?utf-8?B?QWhqUm1qaHppWUZXT1JVeVNVZEVraXVJR1cvUnpwQ3NFQ1FIWEt4SG9nQ2JP?=
 =?utf-8?B?Z0FVYnl0aTFhekVWWDRIa3g4NHBGQzhQdXorcGxFMCtTaWlJYzZBbnNSekYz?=
 =?utf-8?B?TFA5YWZsMU8wbDdTd2F5RGZjWjFtSVc5cy9kUUxNeU55ZU9CVzc5SEtkTW5s?=
 =?utf-8?B?T0NPd2JxeWh6bTVvc3hMaXNsbXdybnR2Z1pVcnR4SHd5ODZNWFR2SzdjWVFu?=
 =?utf-8?B?Mkh6ajdqaVc2U3dhZjdSanUrY3lENDljSkRzd1gxWndMZnd5d2dwSlhoNWhz?=
 =?utf-8?B?b0VUd2c0bFBONU15VjY0YjU5NjhjdG5rNHF5a0JSQmJ4RWQ3bEdISFZLaWRu?=
 =?utf-8?B?R0pPU3pPaUtERDdaNU5FeXh2WkM0YTcySHU4bGc0SWJEcnp1S0dwVzRES3BP?=
 =?utf-8?B?S2YvL1Y5djlxM2JIZEl4YkNlQjc5SmNOSktkeG1BODlsOXZ5aG12NFoxWXpK?=
 =?utf-8?B?QW95bzZxTG05RmhFdDdVMUZRTFZxV1BXQWJ0b1A3MDdQaHRYSDdlSjRFczQx?=
 =?utf-8?B?RzJ1YW1pZTg0NnJ5TkY1MkJJVHlESHVINGw2SDB5MDRNL3c0WXpEek0vSCtQ?=
 =?utf-8?B?eGUxUmV3a2hTYnpiTU1GWFh5ZmVtVFlwSElzOFNlekNTaGM0SjhQVjZmZ0VJ?=
 =?utf-8?B?VFlIOHZUV0R3Y1hBYW9UczgyKzhjNHAyQ01wN3RlRlZtRU5CSFNFTUpvWmpv?=
 =?utf-8?B?VXp2YnRodlZoRmNIV21ETFlYVkJyVWpFUkYxYTJjNmNndmhtOWgxcTUxNVNt?=
 =?utf-8?B?L0RoNmJQVk1WbXJ3SWJTZWJ1cUtJMzV1YXdZSWxWR2d0cHcrTkRVZ2pXM1lN?=
 =?utf-8?B?bVZ0dXRmTTFvaGJwbEZTYmNjQ3p5RzVpSFkzRzBFNE9aTDArUmgycUxVMERU?=
 =?utf-8?B?bzJEV1dzL0szckVaRld0Y2gzZ1hKTjlUNkJSeXVzUllHNmc4bXJXejdhMXlm?=
 =?utf-8?B?cW9IS3dmVnQ1UGdkelE5ZXY1Y242QTdwdjhDNUFLamNPYnAxZi9YSGdYV1Zq?=
 =?utf-8?B?SzlkdkZmRmlZV3VjbS9mQW0yTkNEQWp6SGw2SmZLY1hFektUOVV0aGplY1d6?=
 =?utf-8?B?TFJlWjNUTDdkckdja0h3MjVBRnh5YW1WOHBOdHZEZGJMK2pZV2M1ZEhkcFBv?=
 =?utf-8?B?Rld6MkFobnV3PT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(7416014)(10070799003)(1800799024)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bW5BUlJvQkhHVjlRaFBlMitmcnVvOFRDNkpOQUdNa1FKSjNGdzB3bm1MWnVx?=
 =?utf-8?B?WWNPMG0rekprK1VtQ0o3eDdlREkvcXdZMHhNSFNsMU1ZNDFMeXFoUmM2eGha?=
 =?utf-8?B?NjF4VHhhWFA5eTRndzI0SnFkY0J4MWdmUDB0Rms0WjFSbkJEcW9MNTNnTEkr?=
 =?utf-8?B?d0RRUk1QQ1E0QU1QZ2JLQWl2WkR6UFhPMkRPTEJ2ZGR3VHU2cGRHRkdwWHpy?=
 =?utf-8?B?U21DdnR0NUY5Z1IxclVTaitFWVBIellTQ2x2a0ZQbjZtclNVRVM5enl3Sk03?=
 =?utf-8?B?UEpnZ2xSYit3S3dOS1BDdHJXOWFyY29pdEtsTjBodkVZTkhGbkNyWXlIajVJ?=
 =?utf-8?B?MjM2WklKSWJXSWRXTFlFbDdlU2JnZzlLQUNCTEJrNzAxVW5qVnZTbmFMa295?=
 =?utf-8?B?V00ydVNoQzhHR3FVOEEyVUU5YTVtNVBmNEEvZkczTS9oVDNPZ1ZOeDlENTFK?=
 =?utf-8?B?VDJwZlJ3ekdVTFp0QzZWRDYxSkI3THhudHc0N1prbW5qL3lYYlhTTkRCdFZD?=
 =?utf-8?B?SUlZOEFlOG1pdXliZjRoK0JvUWFsNzQzbEtSY2ZkY2xUREQ5Y1orbGFjWVN2?=
 =?utf-8?B?bXc4V3h3Z1lUK1dPRVR3dGk0MnZqZjVoNFRFd0VNVld4SE85aXJ4MWRtN2Fo?=
 =?utf-8?B?Mk1Sb1FSdmwyckRQckFxaGFveTFPNlFnMUdqeitjeC9kbWt1eEhRK09QZjJm?=
 =?utf-8?B?VWlYYXZwZmZMbTlWWFVIUEJ0UWhsWWV1VXdZSWZEa3dYNmJhR1A5MUk2b05Z?=
 =?utf-8?B?RWs3Z0x5WTdxZkxNT2IwMHo1Qko3amVpbUk0dVU1WWVWTFZjUE1XaGxsa2ZD?=
 =?utf-8?B?NW5HS0RURGRqTk5yaDY0bEx0N3ZQU0dZaWd6K2JyUHd2NkpQTTRPbjdSam15?=
 =?utf-8?B?Sy9OellnelplS3h2c1ZHTFBYVjlUQlBPV1ZuSlVOWWtpSVM4Snk2WlVEMGJU?=
 =?utf-8?B?TzZiQjNFQ2I0YUd4WVhNaXBoUVEwMVVSVDFnelZUMTA4WTlCblRHV1pHNXNu?=
 =?utf-8?B?eU5EaldCTzhTeTA2cXBKSkh2L1BBdVVyQisxaitTSHdaSUxUcURuN3BsOXFN?=
 =?utf-8?B?emhYc2xrUEJRUzl2eGdNWXJsU3dXeWhTSmF6c0dJdC9GbklBZmQwdWlKWUlP?=
 =?utf-8?B?WGxPV0pqNGJNN29pTmJiblJBa0o0alJGNWZiMWMyTXNFVVY0cWtzQzdpdjhw?=
 =?utf-8?B?bXJnOHNCSXEvOVk1V0dkK0o0d3JpWE1ZdHVFWmZvalFBUkI4OGRISHczR3dE?=
 =?utf-8?B?NitDWDB0RlAyd1J4akNJRXdRS240ODMyTjVoYXF2OFdDdWFIdnFyeTJpd29D?=
 =?utf-8?B?bkhvZWdnWTdPcUo1RXVCalhGaDJQdmd1dFBZN3hFN0lneXE5WXJKUjJUY3B5?=
 =?utf-8?B?MmxCZ1pVcWRMS2lUV01pZ1UrZ0swcFRzUTlieXdxRE5teDVKKzZvL3JsMmh4?=
 =?utf-8?B?RmlYVjNLOGs3MWtZTmpsL3gvZFBmTEVQNDgva05aWFFISGV5RzVNeWJrSHU3?=
 =?utf-8?B?aGppTllxdmYwQnBzdnM2QzBGZWgya2Y1dmdCb0xEbHJXNnJkcVlpUXJ1MTlZ?=
 =?utf-8?B?NEFrTDBkOExTck9PdHlsK2Y4ajhKSytPWVFUNlpFV2JzVGkyTDJ0V3hFUHRt?=
 =?utf-8?B?dElKaEdzZnhJQ0t3aEEyVG9LSnZhVFkvVnk5Q1gycDRvQjF1aDRwTGw1ejZr?=
 =?utf-8?B?TnQ3bW5yd1hKNWFFWU1vTnN5MGt1Qno1YnlDU09ZUm55OHhod0VZejM0TVpr?=
 =?utf-8?B?MUl1bVhLRmZlRzg5QVhsdS9VK0xob1YyV1ZhUm5RMUk3bUVCbWxHdnpaRldU?=
 =?utf-8?B?dmVmNjluMGVkZXMvd2RUd3VZMDFob1prcWJ0YzdHNGZhaG9nYTBPVU5vU01s?=
 =?utf-8?B?U1huQjFqWjJCSk81QldsSWdFcXlJRmhDeGs1Ny92S3R6QTRDQ3hIVFRCRVQ0?=
 =?utf-8?B?cDJlSXpZUDJYdGxKN2todklHTXQzR2kwYmFrRWU5bTlaYWpvcWFKaXBIVjQ4?=
 =?utf-8?B?SUQyWGdvS1M1dTM3SHczUFJzdW9qeEVuREVzeUlaL285OW5QbFFwY0JaZkxG?=
 =?utf-8?B?Q3RQeEVUWVdDeEdSVldKclptdGl5TzdodWVmeCtMOWdkWVo1OEtDd09TcE96?=
 =?utf-8?B?MUpRWURjTDRKNWkvdkcrZnFNQkxjZ0tldElqMTVvcFdaaS9UNGlxRFdac2Rk?=
 =?utf-8?Q?Z2daYpSdN9HHrQHaYRJKFc8Nw8spwmDHZiPJlOwPhuUN?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 88decf0a-f560-425b-862a-08ddaffc7b9f
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jun 2025 13:15:09.8478 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: B1i3fupYTQ7pR3BblS9OVgmigGtVlGOTCGPFDAr8Zupii+P9ppoERRWGg8WxkrMnzB9PVlouOpdm+i4H9rZudA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB8426
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

Introduce the `num` module, featuring the `PowerOfTwo` unsigned wrapper
that guarantees (at build-time or runtime) that a value is a power of
two.

Such a property is often useful to maintain. In the context of the
kernel, powers of two are often used to align addresses or sizes up and
down, or to create masks. These operations are provided by this type.

It is introduced to be first used by the nova-core driver.

Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
 rust/kernel/lib.rs |   1 +
 rust/kernel/num.rs | 163 +++++++++++++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 164 insertions(+)

diff --git a/rust/kernel/lib.rs b/rust/kernel/lib.rs
index 6b4774b2b1c37f4da1866e993be6230bc6715841..2955f65da1278dd4cba1e4272ff178b8211a892c 100644
--- a/rust/kernel/lib.rs
+++ b/rust/kernel/lib.rs
@@ -89,6 +89,7 @@
 pub mod mm;
 #[cfg(CONFIG_NET)]
 pub mod net;
+pub mod num;
 pub mod of;
 #[cfg(CONFIG_PM_OPP)]
 pub mod opp;
diff --git a/rust/kernel/num.rs b/rust/kernel/num.rs
new file mode 100644
index 0000000000000000000000000000000000000000..6ecff037893dd25420a6369ea0cd6adbe3460b29
--- /dev/null
+++ b/rust/kernel/num.rs
@@ -0,0 +1,163 @@
+// SPDX-License-Identifier: GPL-2.0
+
+//! Numerical and binary utilities for primitive types.
+
+use crate::build_assert;
+use core::fmt::Debug;
+use core::hash::Hash;
+
+/// An unsigned integer which is guaranteed to be a power of 2.
+///
+/// # Invariants
+///
+/// The stored value is guaranteed to be a power of two.
+#[derive(Debug, Clone, Copy, PartialEq, Eq, PartialOrd, Ord, Hash)]
+#[repr(transparent)]
+pub struct PowerOfTwo<T>(T);
+
+macro_rules! power_of_two_impl {
+    ($($t:ty),+) => {
+        $(
+            impl PowerOfTwo<$t> {
+                /// Validates that `v` is a power of two at build-time, and returns it wrapped into
+                /// [`PowerOfTwo`].
+                ///
+                /// A build error is triggered if `v` cannot be asserted to be a power of two.
+                ///
+                /// # Examples
+                ///
+                /// ```
+                /// use kernel::num::PowerOfTwo;
+                ///
+                #[doc = concat!("let v = PowerOfTwo::<", stringify!($t), ">::new(16);")]
+                /// assert_eq!(v.value(), 16);
+                /// ```
+                #[inline(always)]
+                pub const fn new(v: $t) -> Self {
+                    build_assert!(v.count_ones() == 1);
+                    Self(v)
+                }
+
+                /// Validates that `v` is a power of two at runtime, and returns it wrapped into
+                /// [`PowerOfTwo`].
+                ///
+                /// [`None`] is returned if `v` was not a power of two.
+                ///
+                /// # Examples
+                ///
+                /// ```
+                /// use kernel::num::PowerOfTwo;
+                ///
+                #[doc = concat!(
+                    "assert_eq!(PowerOfTwo::<",
+                    stringify!($t),
+                    ">::try_new(16), Some(PowerOfTwo::<",
+                    stringify!($t),
+                    ">::new(16)));"
+                )]
+                #[doc = concat!(
+                    "assert_eq!(PowerOfTwo::<",
+                    stringify!($t),
+                    ">::try_new(15), None);"
+                )]
+                /// ```
+                #[inline(always)]
+                pub const fn try_new(v: $t) -> Option<Self> {
+                    match v.count_ones() {
+                        1 => Some(Self(v)),
+                        _ => None,
+                    }
+                }
+
+                /// Returns the value of this instance.
+                ///
+                /// It is guaranteed to be a power of two.
+                ///
+                /// # Examples
+                ///
+                /// ```
+                /// use kernel::num::PowerOfTwo;
+                ///
+                #[doc = concat!("let v = PowerOfTwo::<", stringify!($t), ">::new(16);")]
+                /// assert_eq!(v.value(), 16);
+                /// ```
+                #[inline(always)]
+                pub const fn value(self) -> $t {
+                    self.0
+                }
+
+                /// Returns the mask corresponding to `self.value() - 1`.
+                ///
+                /// # Examples
+                ///
+                /// ```
+                /// use kernel::num::PowerOfTwo;
+                ///
+                #[doc = concat!("let v = PowerOfTwo::<", stringify!($t), ">::new(0x10);")]
+                /// assert_eq!(v.mask(), 0xf);
+                /// ```
+                #[inline(always)]
+                pub const fn mask(self) -> $t {
+                    self.0.wrapping_sub(1)
+                }
+
+                /// Aligns `self` down to `alignment`.
+                ///
+                /// # Examples
+                ///
+                /// ```
+                /// use kernel::num::PowerOfTwo;
+                ///
+                #[doc = concat!(
+                    "assert_eq!(PowerOfTwo::<",
+                    stringify!($t),
+                    ">::new(0x10).align_down(0x2f), 0x20);"
+                )]
+                /// ```
+                #[inline(always)]
+                pub const fn align_down(self, value: $t) -> $t {
+                    value & !self.mask()
+                }
+
+                /// Aligns `value` up to `self`.
+                ///
+                /// Wraps around to `0` if the requested alignment pushes the result above the
+                /// type's limits.
+                ///
+                /// # Examples
+                ///
+                /// ```
+                /// use kernel::num::PowerOfTwo;
+                ///
+                #[doc = concat!(
+                    "assert_eq!(PowerOfTwo::<",
+                    stringify!($t),
+                    ">::new(0x10).align_up(0x4f), 0x50);"
+                )]
+                #[doc = concat!(
+                    "assert_eq!(PowerOfTwo::<",
+                    stringify!($t),
+                    ">::new(0x10).align_up(0x40), 0x40);"
+                )]
+                #[doc = concat!(
+                    "assert_eq!(PowerOfTwo::<",
+                    stringify!($t),
+                    ">::new(0x10).align_up(0x0), 0x0);"
+                )]
+                #[doc = concat!(
+                    "assert_eq!(PowerOfTwo::<",
+                    stringify!($t),
+                    ">::new(0x10).align_up(",
+                    stringify!($t), "::MAX), 0x0);"
+                )]
+                /// ```
+                #[inline(always)]
+                pub const fn align_up(self, value: $t) -> $t {
+                    self.align_down(value.wrapping_add(self.mask()))
+                }
+            }
+        )+
+    };
+}
+
+power_of_two_impl!(usize, u8, u16, u32, u64, u128);

-- 
2.49.0

