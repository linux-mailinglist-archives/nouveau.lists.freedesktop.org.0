Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 80EECC1AFBF
	for <lists+nouveau@lfdr.de>; Wed, 29 Oct 2025 14:54:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 77A8D10E7B1;
	Wed, 29 Oct 2025 13:54:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="SdjtVdXO";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from CO1PR03CU002.outbound.protection.outlook.com
 (mail-westus2azon11010064.outbound.protection.outlook.com [52.101.46.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6CA1C10E7B3;
 Wed, 29 Oct 2025 13:54:27 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FV0RDTQb5juP3YrL9hWiPa+vwhmktrXNMXX6KENgnY8pAcx6r77SD9ZekdWYRvT6dcu+gM1VBbxzBVi75pMsYm/56IymXxjEXWwhIipHEFULaSUf3VFWuZAxbfuV6yQT+QINX2VyCVLwCKX8c4bNxf+ZDF3ZjfMUulalI6l6kfqzfFlDZildOZ0d/ONf7Tk+EGsq8SVKZWvujN93QbxPrx174f6ScWQOUNnkN+xt6/tUBlkQb1VvHc7zhcTS4DiASTqPgekxsOYsbqjim6iwEtMN0f1ZAY3u60KHSVZtZzQ7FbFoCkXLZdZeYhvMmaqTcwXZh9wC2TvATWu32xsv+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=g6Hd6475qHziokJnEX/3tFyLhMrD4HERqib29nc2Gyo=;
 b=Ix9snYbiyk4l6ZzURdb7wjP/Cauw4zdhgE6An63nSoZkcHzUGxHuCqCmAWv4jQh9Ipm6prHvYFzjjTGimXXt/SC/7mRySwIhIQMPL4ajt4gxg490yt4I+2zR2JsieOwJqz4TRQ+CwVC0mIAGKnLioUo2wDvcsuqfpEfbsbOnDzQAbeejEOHrHNAL+jnIUvwM7A9bLLj1nGGtc56S9qzAMQIdQvrMxXwoTCSZhrl1F4DQQyF+7qLxdg/UxgYsgJgn4+hfRxrw3rs/nQNzl+0vMAqm1po3cc/1c13uWaIu78znBkKwXcIWIFAyHCygJqTYfMIx9OfFbHJ11mkkfvIAYA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=g6Hd6475qHziokJnEX/3tFyLhMrD4HERqib29nc2Gyo=;
 b=SdjtVdXOXLeKYNSsNCzLantxXuC6vRzDi807uWHYpoV6qqZasGNIjpYiCKeswPNH5rJCCRJv940WAhBgouhmScoFW9EhcYVmE2rz9b5Zm0y3P/vAv/rtG5PHd44KbnS0Xin2Tcz/SYnP7Y05dt5mtBqfmZ+pDRgFUagX01QTAkWQo2MDcR6EnQ0bw1QziIa0P3QOt6xECKwFlqaejnOWYFUI0X0Xo137yBH51M7NKPLG3whC4j1OoWUuXhlZr1bqDn6XD1xtx73M3CeN2hD7oFgSlO0M+1HlutCPLUezIcrARFO+elIOzYRk+1xc9z0Bn+K2AtwdBX+A7xYD5dZliQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by PH8PR12MB7376.namprd12.prod.outlook.com (2603:10b6:510:214::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.12; Wed, 29 Oct
 2025 13:54:23 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9275.013; Wed, 29 Oct 2025
 13:54:22 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 29 Oct 2025 22:54:19 +0900
Message-Id: <DDUUUUL0GXAM.2LNWCIEW124JY@nvidia.com>
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Danilo Krummrich" <dakr@kernel.org>, "John Hubbard" <jhubbard@nvidia.com>
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
Subject: Re: [PATCH v3 2/2] gpu: nova-core: add boot42 support for next-gen
 GPUs
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20251029030332.514358-1-jhubbard@nvidia.com>
 <20251029030332.514358-3-jhubbard@nvidia.com>
 <DDURPPIWWIA7.27RFSM7KRLN7I@kernel.org>
In-Reply-To: <DDURPPIWWIA7.27RFSM7KRLN7I@kernel.org>
X-ClientProxiedBy: TYCP286CA0318.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:3b7::6) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|PH8PR12MB7376:EE_
X-MS-Office365-Filtering-Correlation-Id: 64c6f270-ed5f-4a6e-a1f0-08de16f2a9c4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|10070799003|376014|7416014|366016|1800799024; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?N1RoSmlWTEtGQnFKbTVUTnlIWlF2cGFDOStrZ1c5QlNpTlVJcTM2NDh5L0Ew?=
 =?utf-8?B?ZlhYU1R5WXcrVmhBWjJnWC9qbVhvL2M5RGY4V2EyaWZZY04rU3pSc1JmUWJa?=
 =?utf-8?B?cEhBQzJBL0FYa3BLcEk5WVE4ZmtRa1VyVmwwUDFZeWJJQkZKeHBESXdzR2lB?=
 =?utf-8?B?V0ZTVXpNT2oyamxtTWo0SmtVUnB6TUV2YkIrbkVPa3UyTDBSN2R4cnF5MEVP?=
 =?utf-8?B?b0lNR0dHK1hkOExIMEhGeG91TC90c1lmQXU1bUpmUng5K3RIUDdFVEdxVUxa?=
 =?utf-8?B?OFFNLzI5WkJzUFpnZHFLcWZMQThYQklzdE1MMytuYW9SLzhzQ1RYcmFFL1pO?=
 =?utf-8?B?Mi9BWFZzUzNmRDV0eXc4VkRBV1d5NmtCWFo5RG1aY05zWk4vUy9xa1h0bzRu?=
 =?utf-8?B?ZFB4V25NaCtlNWxYQmIzZit6bVJrR2NKanJ2OWxBOVdCa1hYUllXYmxQTkNE?=
 =?utf-8?B?VUxiQm8zdWtYTGtwT1QzeEJUc3NQN29aSFBHb2JkNWJITGtabW5NOEpHYUFR?=
 =?utf-8?B?ajFyckIxSlQ5Q0dIdWxUQ21ya1k1UGVvUUhqcVh4QmR1dE5BMG1uRTFQL0ll?=
 =?utf-8?B?cjU3by9zWDdLQmxrb1JsK0FTdEpoK0VMeEhEMGpIdFVrRWRlWjRCQXhENGI0?=
 =?utf-8?B?enNySi9SOFEwa0FmNUtRUThKVmRHZ3dPZVI4Y1FhcDhZU2E0dEpVaXIxbFlm?=
 =?utf-8?B?U2FMOW5yUkNORW5VRGg3dTY5TkhGTEZHM29wVEN4aFozeHpVR2szRUI0RG5S?=
 =?utf-8?B?TEc2YU9zaFdqUGhJeWxldDZjNWdabzU5elJEekdYZWR0dHBMaDI4Z3VSU00w?=
 =?utf-8?B?U0pQME03K29nZHBHNXdzNXFwd2dvbG9kb3V1cVBUd0orK3hHUTVkSWpsZEN5?=
 =?utf-8?B?N1VKaWRGL2JlRTE0dFZXWjcyamJDY0FXUXQ4M3MyZ2s1clVGeUxOaFE3ZWM1?=
 =?utf-8?B?QjBvcTlMNlZLcGluNG1hNVVVNTJYR3hzbDRoL3ozQlc2VTF2V2dlM1JDMXc4?=
 =?utf-8?B?NlFBdWl0S21nRlFiaUpWcDlGV3RqZlc2M0U2eUxOT0F2c0RBN05PdkRXbk02?=
 =?utf-8?B?L1RPOHBuUzMyQ1l5NzZpMTFCdU5FY05rUEZDMmJaQUZPdEZSVmtkbU1WMXY2?=
 =?utf-8?B?NENwcklLaVE3U0lpdlM1bmNSTGJOckI0a1FiWDZwRW1pZGdDNnNjVkUyT3Ji?=
 =?utf-8?B?TnkzaW5lZU1rTjNmK2dpc3lxbEUyQTBpK2hvMmhNVExxNlN4Sjl3RmYrbmNi?=
 =?utf-8?B?MjB4RkNFU2xpOS9TTXNaSldBVjJkeW1MZU9QWDQ0dHR0VmFjbzd3MUVVVjNJ?=
 =?utf-8?B?cnBaT3lDSVZGOUE3Znh4MjFqMFhpcTVUcFkxeHloZGVXa0hsaTRSVGFJaHBK?=
 =?utf-8?B?dTQ4VlJxTEV0ZXVnNVlxS3loSFdjdWhmMHVDOXJhN2kwMFRVY0JGWURLWVlO?=
 =?utf-8?B?QmVrYTdqdnBXcGRmeC82a2NWL3pqQUNRRXFBQmFEcGZvcU96MEowTldvdlpa?=
 =?utf-8?B?cjByak9ZUVNibUVCRUVnaDdpOFprRU9CS0tpR2hsbXBicTJPeTM0TDkrUmlT?=
 =?utf-8?B?c3o3SGlmRTRNZDNSMGdGdzNpUURtL0tFRkNORE5kS0tKaDVPMjZESm0rRzlL?=
 =?utf-8?B?aHMrOXZRNGR6S1hQSW00dkdTNjByK2ppYm5ITDdocGVINGw1eXcvVEUydHAw?=
 =?utf-8?B?djFlMWVVejBOamlHd1MvR3N5ZXErdUUwQ2VJRTVZZXZpd2pBT3hLRjZqRlhW?=
 =?utf-8?B?aFdwN2tENjc3cUdBdndTcTZVREcvWGp2MC9Eb3FMQ0k4bFVvTWlXcnNkWVVV?=
 =?utf-8?B?STl4RDNWc3lwQWtqNTJ2NzlNMUdkOUZaK1hUVW1JMmJzWDVVYzdLMUxKUVJ1?=
 =?utf-8?B?b2ZYM3ZCd3paUDhkRVNPOTduWUE0UVNFdXc4a2JxMGVPZDdtTFRsR2VHM3My?=
 =?utf-8?Q?CYARRqDg7/X4Eu8U90LRgOElJkoH9HBs?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(10070799003)(376014)(7416014)(366016)(1800799024); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eGJ5TEdkYnZ3cENwMlZsS0ZIbG53bkFXNEVpSWJQYlRSbnFQU0VhNkdxcEM3?=
 =?utf-8?B?SnQwRlNHN0xrZExRSGhGRExrTElld0VaaFJqemFEWW96UjJHQXBiWEF0d2FE?=
 =?utf-8?B?TTg5NmxYM0tEaDZ6cVl2blVRLzNlNHdISW8xaUIzRHFYdElzZ1N3RzBoSk5V?=
 =?utf-8?B?NkhmaWtUOERrTGtRMVJNQmQ2SFRHeUVJd3NxTEFza1NFSnhaSVhsR2JmbDRL?=
 =?utf-8?B?ZFpWOXZEMjB5VWVFRHdPcU5SK0lLNStqRG1SVktTRnV1cVRramdTMmRKZW14?=
 =?utf-8?B?dGErRkRqNTNFN2grUFBkQkRjSVJyTnlhSnVyR3FCUTFzZldlZHZuTjFmRnpo?=
 =?utf-8?B?bmZBVGdhU2xwN25pd2FQWUl5ZndwNE03WGlKN1JKblBaYkpjdHFhUEprSi9O?=
 =?utf-8?B?TVN5WHcvTFJiTjluVmVMTGdNaTFDeHMyNEJnQkZxaVl0RnFJZUxhWG9yQXRN?=
 =?utf-8?B?Z3dxQ2x5bmR1aXE5VkFkUkFxWm0rbVJleUtkNUg4Tms4RFFSUGRtVEVoeDZy?=
 =?utf-8?B?Qmh6dmh0NmlrL3B2cnJlY1VmeHF0VXhwa3lyY2prUmJYU0tsZEEvOTYrTk5z?=
 =?utf-8?B?ZmVYY28vcGxaTGFLdkd5N0FNV1MzbUxlZnBZcWNYdFh4cjQwVk9mbHpZaHRY?=
 =?utf-8?B?Tk42U0VGREVWZlEvYnpiTXptTkgzOXRhNHBwNUdjZG9UYXNkS2ROWlhEWmlF?=
 =?utf-8?B?WWZMUWpVUnlyYlZPd3RWNVBkVGhSc1oxQ0NKSHlHYU5rQ2RaNGlBd29Lczl3?=
 =?utf-8?B?bk9jWmZJZTF0ak1ZN2RkcHVuWGo0RzVMeks2djJ2bWY5UHFiYWtaRWVROVda?=
 =?utf-8?B?bzdMcUM1b3NDdFBoWTV2QWFmSkVyRkFrRFpVeWROTys1bFFZdzZQRzhtRVJR?=
 =?utf-8?B?K1hSQkhLK3lPTFRMNkZNOXFac21UZ0h5OFY1Mmg5MVR0dnBLWHZ1TDltQ1Yx?=
 =?utf-8?B?NGZyUjNqWVZVczE5ZVN3SnMxZGVlNzFTcVZ1Qmx0L2Y2NnNNZyszM3dXdW01?=
 =?utf-8?B?bkRZcGFkQTRQcVFuUld2Y3oxc09GMnY0MER2bUtTZVJyclRRMXY4OVY1dUxl?=
 =?utf-8?B?MDQzRDZlbkFibC9HNjV1ekV6RVFRck9EbXc4ajNYcWtOblVMWlhZb2NNYlp0?=
 =?utf-8?B?VlFMZ2JkSVpqSmY4TklubmxHdFZSUWpQbmFJemsvc1hpY2hHK0duRUo1eFVy?=
 =?utf-8?B?MmJib3NFNkxiMkJmVmR5c1IzSklNZTYvbEVQdlEzdmNJTXhkQmw0aVhjd0Vj?=
 =?utf-8?B?dy9wQmVTQmVSSVd5WU1zYjhqYVEveS81UmlENTZKLy81NlhGaHNJZlB5R1E0?=
 =?utf-8?B?aVc1ODhTMXpPSlFLWW1pUTZIdVBTcis1S1RkUmMzQjhMdm42RDJLenFPTldw?=
 =?utf-8?B?VEk3eWVmSlBkczZIeHFOc2VkU2RWQk5DQmwyNXk5bXVyTk5MV2M1endPLy93?=
 =?utf-8?B?K0MrcVlmV0xGREF1T0QvS0tOZ3lPaFlUR0RuWXRhL29SWmxKTXRWeXorUXpw?=
 =?utf-8?B?Nks4VkcxeHFjek04Z0diVmdZMkpTUXNzQzZ0T0xVRTFTelNmSHYvTkdEdCtU?=
 =?utf-8?B?ZDNIZjR2RmRYbnpseGlZTC85SGEyRS9vT3FQWXZzd2x5ZUxyRkwybVlGZFpz?=
 =?utf-8?B?aXpGbE03RHlHWm84VEFDT0VMTEVldnRpL3FCTVlDbjJmQld3dUxjb1d0b0h5?=
 =?utf-8?B?WkUxT1NzbDE2TWp1YW1nNVVSYWNkOXlQTFZ6TkNlamErdmdURmswMldwS3My?=
 =?utf-8?B?b2xlVEh5SHl6WnpvbDhuWDNodFVBNThHSTltQmxDQk8zV2IzUkJxY3RtNW14?=
 =?utf-8?B?UVROKzVxdjFJS3hiVzNCRDZFQ1ZlczNjL2c2WEVaZmkzTnVLQUVaVzdIMUtu?=
 =?utf-8?B?NGtHYjZQU3MwSDMrUUJlQW55L0NmUlhkOE9scHdTZFlZUHU3ZHY1TjNiUVFO?=
 =?utf-8?B?V1dvMnlvVDBJWVNocnNabHJDWmsyUUhJV2EyeTNIN0ppKzNGM1NBUmtzU0Vr?=
 =?utf-8?B?Ym5uTnQvcFBEYmRNb1hLcUVlWmJUSWQrR3lFZWlLV09lN2I0bjZReWkySmlY?=
 =?utf-8?B?czJEc25tWFdlMnNoSXMrWjhJVVJPb3FKTEVwZFBydlpEaWY1bFBja1FyNUtS?=
 =?utf-8?B?Z1VPUTdLNHVKUWY1UWozRkpqMkQxamRnR2Vnd3FNR0lrS3gxQ085eGRWdFhx?=
 =?utf-8?Q?Ac4kMIgA+8VOkmtD+CM3d5PocEpC8Ofklj6tBhY4gg5j?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 64c6f270-ed5f-4a6e-a1f0-08de16f2a9c4
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Oct 2025 13:54:22.1540 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hQZSiKTNHiufx38fnU/Beph/vuC2ABxZy/Q8d3mMbB0zTW4m7PY9Pkgp/GD5MHcF1iGMHntGiX2FlxqYzsYGKg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB7376
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

On Wed Oct 29, 2025 at 8:26 PM JST, Danilo Krummrich wrote:
<snip>
>> @@ -151,13 +179,43 @@ impl Spec {
>>      fn new(bar: &Bar0) -> Result<Spec> {
>>          let boot0 =3D regs::NV_PMC_BOOT_0::read(bar);
>> =20
>> -        Ok(Self {
>> -            chipset: boot0.chipset()?,
>> -            revision: Revision {
>> -                major: boot0.major_revision(),
>> -                minor: boot0.minor_revision(),
>> -            },
>> -        })
>> +        // "next-gen" GPUs (some time after Blackwell) will zero out bo=
ot0, and put the architecture
>> +        // details in boot42 instead. Avoid reading boot42 unless we ar=
e in that case.
>> +        let boot42 =3D if boot0.is_next_gen() {
>> +            Some(regs::NV_PMC_BOOT_42::read(bar))
>> +        } else {
>> +            None
>> +        };
>> +
>> +        // Some brief notes about boot0 and boot42, in chronological or=
der:
>> +        //
>> +        // NV04 through Volta:
>> +        //
>> +        //    Not supported by Nova. boot0 is necessary and sufficient =
to identify these GPUs.
>> +        //    boot42 may not even exist on some of these GPUs.boot42
>> +        //
>> +        // Turing through Blackwell:
>> +        //
>> +        //     Supported by both Nouveau and Nova. boot0 is still neces=
sary and sufficient to
>> +        //     identify these GPUs. boot42 exists on these GPUs but we =
don't need to use it.
>> +        //
>> +        // Future "next-gen" GPUs:
>> +        //
>> +        //    Only supported by Nova. boot42 has the architecture detai=
ls, boot0 is zeroed out.
>> +
>> +        // NV04, the very first NVIDIA GPU to be supported on Linux, is=
 identified by a specific bit
>> +        // pattern in boot0. Although Nova does not support NV04 (see a=
bove), it is possible to
>> +        // confuse NV04 with a "next-gen" GPU. Therefore, return early =
if we specifically detect
>> +        // NV04, thus simplifying the remaining selection logic.
>> +        if boot0.is_nv04() {
>> +            Err(ENODEV)?
>> +        }
>> +
>> +        // Now that we know it is something more recent than NV04, use =
boot42 if we previously
>> +        // determined that boot42 was both valid and relevant, and boot=
0 otherwise.
>> +        boot42
>> +            .map(Spec::try_from)
>> +            .unwrap_or_else(|| Spec::try_from(boot0))
>>      }
>>  }
>
> Without the comments this currently is:
>
> 	let boot42 =3D if boot0.is_next_gen() {
> 	    Some(regs::NV_PMC_BOOT_42::read(bar))
> 	} else {
> 	    None
> 	};
> =09
> 	if boot0.is_nv04() {
> 	    Err(ENODEV)?
> 	}
> =09
> 	boot42
> 	    .map(Spec::try_from)
> 	    .unwrap_or_else(|| Spec::try_from(boot0))
>
> Which I think is a bit heavy-handed. Let's simplify this a bit:
>
> 	let boot0 =3D regs::NV_PMC_BOOT_0::read(bar);
>
> 	if boot0.is_nv04() {
> 	    return Err(ENODEV);
> 	}
>
> 	Spec::try_from(
> 	    if boot0.is_next_gen() {
> 	        regs::NV_PMC_BOOT_42::read(bar)
> 	    } else {
> 	        boot0
> 	    }
> 	)

I don't think this will work because `NV_PMC_BOOT_0` and
`NV_PMC_BOOT_42` are different types, so we cannot alternate them in the
same call to `try_from`. But the following should:

    let boot0 =3D regs::NV_PMC_BOOT_0::read(bar);
    ...

    if boot0.is_nv04() {
        Err(ENODEV)?
    }

    if boot0.is_next_gen() {
        Spec::try_from(regs::NV_PMC_BOOT_42::read(bar))
    } else {
        Spec::try_from(boot0)
    }

