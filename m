Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CDA0AE1CF2
	for <lists+nouveau@lfdr.de>; Fri, 20 Jun 2025 15:59:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E849810EB6D;
	Fri, 20 Jun 2025 13:59:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="Ioi/TDo0";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2079.outbound.protection.outlook.com [40.107.220.79])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF25310EB6D
 for <nouveau@lists.freedesktop.org>; Fri, 20 Jun 2025 13:59:25 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ElpSlhr0C/pTDQiTAk4d44gLP+CMQPp6FnFaAVqb7gMHXtOvD40yNror8J0JuJqvBROzqgebEYS/prai+vYGa4rD0LChjadrw/pPDZaRCKewfO5qT7/GLdJpzdJiO1+TUJ1PVlukPk/Z1g4I4by6/rsfuL/JEDj/08OgLvdZUQsGRnXayu5CccShSXK5uV5wdIUyhWHoqeI/8p9EBAR4lp9x6+TCCUOAK619uquZeZvHIE34Mz+7Rpg01rZ+CeTQSs6J2n+5ftcqFjc2fATcZ8yP4mCwYF9Jsb/49mxn/MYYQInCnH87N845e3N8eakLfcyA5gSHi4TIk5BVAPua8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=K1yY0dwSbRNI2FE3OQiN8qNBY+4PNzpbJeCL1v17Vhs=;
 b=MlWj0Rm0qIHgL8CI+JW5PMbJCneefC68TCh5oHItkN5OywHSPQ/o3WBLQF8tWV7I7oXWfuk2LK/ArWgnSga9G3MQ0itRhU5X+E00OefUjnoRVqug0VXQFl7gjnKSzJRdIuQVjqhTkZCkEx5dI+RE4Q56gHRVGL8kAv4Dx1P92UPrU2gCUqf3+/wFrGRz0RuW4PlnkIRd1TX6J+u3IU+vLLIMFUXP2hpC6hRYFKlKNhqNyCz08f9L1dkwrWxq3WvWXW6ecG78/iVLc7gg1OmDjrLXR1O2LsvElwEqlsQ/ho6+D//ximJ8r7tsQLmBnDoQcyEGXKww2RZD6kvBcHAPbg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=K1yY0dwSbRNI2FE3OQiN8qNBY+4PNzpbJeCL1v17Vhs=;
 b=Ioi/TDo0IbknEEIkJJYzt1uvbmASRacNuZ3aFQNdpBXxa4farKzKvqSrMCpgOapwa3/C8bxXmvewTfBt67MkuvkdOcnGHc9f6Lotl1E0f+3LLt/ws1Q95glWL5Cx6FmbYH21BFJ2b09jd5j06I41vW446ahAjjYg9yfngVEm+A4egPiySKtHUJ2RdiDZV34DvemYkIphFcr15la1Cqi7/1ze80NeP3Ljslctb+c+iDNeuHsuJfRBmdxkvyPymHlSpWOD+CI9J+jwdsrH3eyIEAeRSwyVt6SmrahgzexYdOolXxXyZK6gTliiyCuiQsQDYmO3e3vMADiaiQuugimSrw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by MW6PR12MB7069.namprd12.prod.outlook.com (2603:10b6:303:238::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.35; Fri, 20 Jun
 2025 13:59:22 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99%4]) with mapi id 15.20.8857.019; Fri, 20 Jun 2025
 13:59:21 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 20 Jun 2025 22:59:18 +0900
Message-Id: <DAREXAUV51B6.7X7TPOJKK249@nvidia.com>
To: "Miguel Ojeda" <miguel.ojeda.sandonis@gmail.com>
Cc: "Miguel Ojeda" <ojeda@kernel.org>, "Alex Gaynor"
 <alex.gaynor@gmail.com>, "Boqun Feng" <boqun.feng@gmail.com>, "Gary Guo"
 <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>,
 "Trevor Gross" <tmgross@umich.edu>, "Danilo Krummrich" <dakr@kernel.org>,
 <linux-kernel@vger.kernel.org>, <rust-for-linux@vger.kernel.org>,
 <nouveau@lists.freedesktop.org>
Subject: Re: [PATCH 1/3] rust: add `num` module with `PowerOfTwo` type
From: "Alexandre Courbot" <acourbot@nvidia.com>
X-Mailer: aerc 0.20.1-0-g2ecb8770224a
References: <20250620-num-v1-0-7ec3d3fb06c9@nvidia.com>
 <20250620-num-v1-1-7ec3d3fb06c9@nvidia.com>
 <CANiq72=BSnom-nQgzLvv-cqwSknK1uJ=CXGP51r0WRj1Y553Ew@mail.gmail.com>
In-Reply-To: <CANiq72=BSnom-nQgzLvv-cqwSknK1uJ=CXGP51r0WRj1Y553Ew@mail.gmail.com>
X-ClientProxiedBy: TYCP286CA0204.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:385::8) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|MW6PR12MB7069:EE_
X-MS-Office365-Filtering-Correlation-Id: 9274eb58-07a7-4ea8-04fb-08ddb002a7fc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|376014|1800799024|10070799003|366016; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?SG9aeHkraFpsTm80dGJBV1RhL08zK2ZHMkFBZFp0aW9KV1cxRlpINGJVdXhv?=
 =?utf-8?B?U1ZTRFBUSlJ6YVRWdTdUSzE0QStweC9EczBYV3VTRUp2UzdVK0VMWmx1eVJv?=
 =?utf-8?B?TEhZVlhTa0FORy8yMk9WWnlNMDdpaUFiVUZBWmJuOG1rTXJSUk96Z3pPZjhJ?=
 =?utf-8?B?Mk1KdEtucnlBYmhuQ1lxSnN1UnNPazdtL2lUcG5FUXhuSjVML3VJWUJZeGE0?=
 =?utf-8?B?UXVFc3l5TDE2TUFRTHRlQ2xwZ1RZV01lMnl0SC83UVJRcUE0V1FwQllTSEUz?=
 =?utf-8?B?TVk3S2kvWU5oRFFZM2VhQk5GL2k0TjltUEdwd2VFdlZTUGtHMTV1L0tqdlZ0?=
 =?utf-8?B?TU5nMmFoYnpDNVFPNHJGeUsvdkVpU3BlRjRYOE83Yk5EWFRwQk1seUZjam9q?=
 =?utf-8?B?Q01iUysvTU9zSTA3MlIyemxqQlgwN3FnN1dqbWsrT3ZwcDU0dFZpV2xCdWJ3?=
 =?utf-8?B?MmYwR25GUHF2ZlI1WUVmUUtjb1BQQVhBYXd1S0NIT09hMTlXTFNNY05IZEVZ?=
 =?utf-8?B?RGZhOEpYc3ZRaFc2Tm5tbklHbTBCaUovZnJNSm5telZYRkg5T2lJc094SXFp?=
 =?utf-8?B?YVdqNkszb0RZRGtva2Q1SS8xOEhKeDBhTXV0Y2pzNXUwSzhjOGE1L09hWlc5?=
 =?utf-8?B?OFNhZFh5YXY2SCs2NzhVYkdOYmtaT2draFR6YVVEV0VDUis4Y2VqMkY0MGN1?=
 =?utf-8?B?dlMzalZSeEJlWHdZYzhHMlRxQmpTN2tqZG1mQmR0Z21IdXpuYnJSZldaNWNS?=
 =?utf-8?B?dmVldjhJcXFRbHZTL1VhL0JHZDQzMC9WY0NMWGxKOGxaZ1REbGNnZHlSZzJX?=
 =?utf-8?B?akdsYndhN1BtWnJEZnBHY3FiVjdBMEhlVmhpbGNhczU0ZFpUT1Z3aUVjemxH?=
 =?utf-8?B?MTVOQ3JzamVPeXBRcVJPMFdzTnlPOVF5YTR5emovaGpZQW9aTVM3UE05djlF?=
 =?utf-8?B?amlZVXg0a2RFM2ZMRGVlQ3pyTzhIWjdyZUtnT3MyUUFxcUdqdndpa3NDU3NN?=
 =?utf-8?B?UkVBcGVVaHovMmY4ekdGcWd2K05oWnorVnNnZTkyVHNGT1AzOCtXR1hSUzlB?=
 =?utf-8?B?ZmZXSk5UZnoyaGF5aDg1ZFdIM0xmU3JLanZ3MGNGdmxTQ1VIQ0diTlBCajI2?=
 =?utf-8?B?cUVsWnF0bTlnNFZwSEhrN0R1VnFyaWwwVlUxZUpVbWNvMldzOHdQY0lzSnhD?=
 =?utf-8?B?N2tybXZJMjZwK3lRcm5jMkNVRVVwZmFndUhPQXkvNUErYkN3MjhuNHB5NXVP?=
 =?utf-8?B?d1RmeDJuakhMYy9EWERUeHFlWWZncmxLTVFIcVFqMW04a2xVMW5YR2ZwSjc4?=
 =?utf-8?B?cmZ4U25Od29DWkdPU2JRd2lEREZZaXlFUS9oUmJ0bDdPbXp3SUx4clk5RHpV?=
 =?utf-8?B?NGZUUmd2ODhtaVR2QTY1S0JOdkpPUzVFWnpNMVZtZ0REMG1VV1ZJWTJRdFhD?=
 =?utf-8?B?Q1REVnZGTFp3MUkrd2dUV3g5eEt3bkRoRTNyRmhOZE5iY3NzRFFqc3J6QXFB?=
 =?utf-8?B?bStzalN5U09EMVR2QmNyelRzKzJiRWJQdldKNFd1R1VMdEtSZHFubFFxTEdk?=
 =?utf-8?B?d1BSdnB2VzNoZGcxQUVoeFZCbGZQSEtOT1NacWx0dU9XS2N4b1hjckJxODdk?=
 =?utf-8?B?TndxUE9XZ0gyM1Q4RVdIYUhFbFI0WVBRS0cyS1c2SkZUYU1EWnEzRUg1Zjgy?=
 =?utf-8?B?TmpqaHI4U1IvamV5SGNpdE9Fa0w0bkJkOXJlbXdSUnJheVo2UkJDNzhxZG5p?=
 =?utf-8?B?b0RZNVFSenZId0J4OWJJRnUxRnN2ak5VN0ZmS0JjMDdYRThKamlkVjRCa2hP?=
 =?utf-8?B?alI5MjdXN1FxUzJXZDZUdTdUU1JxYTNxUEJoNjFZRTB6T2sySWR5YkR3N2dF?=
 =?utf-8?B?SWJNTG40TklZV2JuRlpnQm4wU3JabGFZMUhEOWtabzBSb1puT3JWS0MxV1Fm?=
 =?utf-8?Q?HpTHPyXCRjE=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(1800799024)(10070799003)(366016); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WDBqUTd0YnlRbStyWHpTVnBHNEFHejRTRmpSRGQvbU5zRDQ1YWFGVHQ1UG5t?=
 =?utf-8?B?MGlPejk2blpwK2kyNVh2b0JqN3l3NUhQdk00QU5HL3o2dGVDMTNiNXhDYThL?=
 =?utf-8?B?YXpnWjVHQUQ2ZG5zcUFFZ1p6cjNhM25FclpSakpuNjh6dkdySzk1dXpaQUR0?=
 =?utf-8?B?dFJ3bHhJRkRpT0t3Qk03ZjQ5S0kvOHAwZUR3MklKQmpxK0hFeVpoOGlUb2pI?=
 =?utf-8?B?dS8yWnVWd3pYVnVqdm1mNys0MFhmcFdIZjlLcVJYT3VGUStSRlF4MkRBaHoy?=
 =?utf-8?B?eUFQK1dpRm9YV21ueFRnaTdxUmpjR1QxeUVINTJYT0JYNWxtZitoTW5ybnJw?=
 =?utf-8?B?WlpZL1VhdWtNMDI5V01DMElPYnozNUlFUDgvbUpQd3A3U2RqbmdCRXh1ZUFN?=
 =?utf-8?B?N1VOSnlMbllIUGxIamdHajRYLzdBeUg4d0YwblkyNVFsOVFVWFl2L2NLSUxE?=
 =?utf-8?B?UGZBSjlxUlM5UFcyZkU5VHdEK1lTNVJZbkpIdTU5Qm1qNnZyQUNnbndWVGFk?=
 =?utf-8?B?WWk1VjY0ZklpaTE2VkorbnNPVDcxQVFpVlhFeUw1d1VENlJ6MUdSZ1BXNkdY?=
 =?utf-8?B?dXRPQllja2JHWmptV0NwRHo4NStIYisxQjZWMWlObUJYOVcra1ZGbVA4dy9B?=
 =?utf-8?B?WjUzVkwxREV5OWppdFJsTlllcjExRDJ3TGg1Vk5KYnIzVlRKKzhBMDVFUlVr?=
 =?utf-8?B?SWdwSnQyWmRQaGwyY05HZXV0bUFpNzJnSlJlWmNpMTI5WmZDSGNIMWRtbHNq?=
 =?utf-8?B?NHdxei9Hdzc3bHdSNHVZdDNEZ2ZlKzRQUVQ5UnpqSUFPK1Eya1prYkkzZVor?=
 =?utf-8?B?MFNnK0EzQTlCK243ZkFjWW5mdzAyanYxNFQ4WWRQM2dhSDZQa1hiUjZsZXhm?=
 =?utf-8?B?Y25uaHFNbjNSL1Y1M1FNWlZwWGR0bGZOOWdhNVJNSW9DZjVjc0ZXMnhSV0FI?=
 =?utf-8?B?dktQTVhlZm9TQkhGYU5tRTArMFBDRjZWSVd5WmQzVkJPdkRWcm84d2xuVEJJ?=
 =?utf-8?B?UVNDRzk4L1d2T3pPekgrZnNZdjJ5b21BRVo2Ym43NGQ1VU5ZanZocm5QaTMr?=
 =?utf-8?B?bEEwaDFweE9KTkJKOWJVenhabHl3UGZwWFVXL3NEUTlvVVB0dFp3V2Q5bkZ3?=
 =?utf-8?B?b0FwNlFDY3JSVmtPTmhtYXJGN0k5QU1RbHVIUXgyc2NrMWJaeVZ6NjRNbTNH?=
 =?utf-8?B?elB6T1hFZHVHWldnNUgvMnZIdGh1MytqOEtrU3FtMzV5aE5nSTZoYU83b2li?=
 =?utf-8?B?bng0c1F2VzZ2QUhvaWtUZUx0bnZ1SEhwcWZNN01UOUVzVE05aitROFJyejhT?=
 =?utf-8?B?Z1FuNkxZeWJMSFpqdEJOc3A1Q3E3N3dZOXZZSUgzZTJDZGNUamcvZDE3eTBW?=
 =?utf-8?B?ejBUWEQ5RVFGM1RzekZUUG4yaDFVN25EM2hBWUdzanZpa2ZRM3RQdjN0cDBi?=
 =?utf-8?B?aHdyYmhkSm8vc3hMZFZQV2tEZVVsVXV5dEwwdFpYNEQ3cUVpT3NubkwyeG9G?=
 =?utf-8?B?aXZ0U0V4OEI5WXprY3gwVytnRzluWlNCdUZ6Q0xyRjZVd1lEY1dqbGllTm9R?=
 =?utf-8?B?V3dkQ0o3RlZ2K1VFWkk4MUlGTEprcFlxdjlpYXZ1WUhDbTBvdVR2R2VIUnJF?=
 =?utf-8?B?WTZPRThLKzI0VDRDd2FzU1hJZzlQbS93TU54Q0tWM1pPbE5EY1ZWeGUwT2cy?=
 =?utf-8?B?SUYvWkpyT1FxWkx1ZkdjU3ZvclVIaVNjeGt5YmFaMkVQS0h6Zjh0REV5WjdI?=
 =?utf-8?B?WkVpcVRpcjUzK3NsN3ZkQkxDQzdGN25tMmY0MC8zU3l3ejJwd25BR09nZFdN?=
 =?utf-8?B?T1hPZGNIekFmblRjc0VDb214OUphSFh2VGhmTFdPL2NLQmVJYlh5bHZjUVd0?=
 =?utf-8?B?QzVnblRNb2FpSHhhN2lsSkFBZ2pMTDhVQ0Z4MlJKUEZWd29zZURjVmRRcVhJ?=
 =?utf-8?B?b3FqWHg5YTNuZzlyaWhhWEFjYkJma00wTm5KVjNkQnpGRnNLNHpwWVdPa29x?=
 =?utf-8?B?SEh5SVZwNFVrUktycjRLNkZSUXlteWpBVldoY2U2WGp5M1ovYkVXMUNFN1Vq?=
 =?utf-8?B?UjhyMGFrNnY3Tlk0RElSUFlRTkZVYzVvSTNVU3lrRGxIY1pJckxub0FScjFS?=
 =?utf-8?B?dFlmN29Nb0NndFZ1ZTBXZ0dyc3BxeDUvOStVVnNOR3ZUK2t2NStUaXhTVy80?=
 =?utf-8?Q?1ZWJGF/kVQ/cq0m9ZIrL2xbpbWDPxU8cH212viVH2qIF?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9274eb58-07a7-4ea8-04fb-08ddb002a7fc
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jun 2025 13:59:21.2657 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rceOgoE3A/718Jp6pp7jlDOJB0+VEaCGsDYnL8kIA7eLmYmLkC9QzYjVrx1ndiTGgDwUYN7WXNv5Dn8IfjHLkA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR12MB7069
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

On Fri Jun 20, 2025 at 10:35 PM JST, Miguel Ojeda wrote:
> On Fri, Jun 20, 2025 at 3:15=E2=80=AFPM Alexandre Courbot <acourbot@nvidi=
a.com> wrote:
>>
>> Introduce the `num` module, featuring the `PowerOfTwo` unsigned wrapper
>> that guarantees (at build-time or runtime) that a value is a power of
>> two.
>>
>> Such a property is often useful to maintain. In the context of the
>> kernel, powers of two are often used to align addresses or sizes up and
>> down, or to create masks. These operations are provided by this type.
>
> Before I forget: the other day in a call we discussed powers of two
> and I mentioned that there is `Alignment` in the standard library:
>
>     https://doc.rust-lang.org/std/ptr/struct.Alignment.html
>
>     "A type storing a `usize` which is a power of two"

Haha, I wasn't aware of this effort, and am quite amazed by how close
its API is to my own design. This is reassuring; maybe I am finally
starting to grok Rust after all. ;)

>
> So it would be nice to ask upstream the following if they have plans
> to stabilize it, and whether they have considered a generic
> `PowerOfTwo<T>` type like this one, rather than one just for alignment
> purposes (possibly with an alias or newtype for `Alignment` if
> needed).

Mmm indeed I don't quite see the fundamental difference between
`Alignment` and `PowerOfTwo`, although `Alignment` might better capture
what we are doing with our type anyway.

>
> Similarly, if they stabilize the `Alignment` one (only) and we end up
> only using our `PowerOfTwo<T>` for `usize` and those use cases, then
> we should consider using the upstream one (and adding any/all methods
> that we need).

`Alignment` is very close to what we need, so I don't see a reason to
not adopt the same name at the very least.

This reminds me that I should also check whether upstream Rust would be
interested in `prev_multiple_of` and `last_set_bit`. The docs I've read
for contributing looked a bit intimidating, with RFCs to write and all.
Would you have a pointer for where I should start? Maybe a Zulip thread?

>
> So I will ask them the next time we meet. I have added
> `ptr_alignment_type` to our list (in the "nice to have" section).
>
> (Apologies if this was already discussed!)

I wasn't aware of this, so thanks for bringing it up!
