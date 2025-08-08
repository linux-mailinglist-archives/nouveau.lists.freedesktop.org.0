Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AFD52B1E56E
	for <lists+nouveau@lfdr.de>; Fri,  8 Aug 2025 11:13:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB8CC10E1D7;
	Fri,  8 Aug 2025 09:13:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="e8j0u1QF";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2045.outbound.protection.outlook.com [40.107.93.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BAE2B10E1D7
 for <nouveau@lists.freedesktop.org>; Fri,  8 Aug 2025 09:13:47 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=y3ao/qd+2QIHT69m5CgYIN0hitareg0hA/nnnO7ORFR7cy5i9oXHi0l3svNnyFvaYDfeaiwJQGWlbh1ckNNgys79xwtCKtBMunwrnMeD71L2VGMigPUnsIYsrRHDV+5EZolwxqJwafCbIM8S8pzb2xiVxNr6vGRC/c1c6Pq1fFRC8WVxaEqdgDTZR8a5xWqzZ+GHSE7sAMNYyZlvFV8KVq7dhbitHnGTMQz8nzO/oMrr3i28kKjN7OOeRP9h2V3QpQ24xCfkTcbaeMxhaWmp3XoxXlPMQGa25d1mRL75nyGjmfqywQe8acTDe9iZ9AR77/um56nBJLwTjANiqm7WZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7LgWPijuJSAI/NN/2aWzjTyLt/KV5fvRlWhUR3vrYu0=;
 b=iyBjJv4UW8J/8Ovbj1iY2FcfcmRwFrjnRa3naVxx3EzvP8Qph0kJXG8WCI6LVAAJaXztbLvQUa04qwqmeJU1+xertWbNTOghXdS4xYjGtosXjMPRPt9tvZRzVu88nZeX9m1/WWVyN46vw6sLJblALZ/+Aume04pXmUaCvnU3l6cukaNHHC0F4/zZ4EWK/6H1eKD2sSZXQNE72UVRfls3JhlgTih5wauBDKj7+0FRfDz1Fi90I5p7R2gzjGhQ5gOP+xDqBqXGv4g33SYkaJ6pDLuexwNQXnKUAUxg55QNe3qcdBj8mXlJZQu/2tpeqMXbjM6hz0QYqxLgc4ulkaB1cQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7LgWPijuJSAI/NN/2aWzjTyLt/KV5fvRlWhUR3vrYu0=;
 b=e8j0u1QFW5kQSIObk5A1cijT0sqce4H/ykNl6Dj9/lty4IFnm3Fm9yVlzoLisR/B5Hv8ojaf+HIHJ5VXFbLpOeKjEJVe6b5q1g5cQ0zimjK0IwV0PFswZqErO7Q+caJlivYHCJP2BNP759JaPjHJISFEEgxlJULG5klFJKr2APSmbmJQ9UJUdU/A7uLivmAZcQC4B7YORw/94RS3+4HAwqQ2HUh3NsgPrTh8alBv4JGW7EJotNfToBdB8n3B7WGQq5Gcqt206u6cyHnUzAeVUyatIpDa8L3dqGmOyJQAa/iOPRkmYUPGaT01jj7oJP5lLLw9JzXXybBVR0uFwUtYOw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by SA1PR12MB8118.namprd12.prod.outlook.com (2603:10b6:806:333::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8989.17; Fri, 8 Aug
 2025 09:13:44 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99%3]) with mapi id 15.20.9009.013; Fri, 8 Aug 2025
 09:13:43 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 08 Aug 2025 18:13:39 +0900
Message-Id: <DBWXJA6XF1VS.3PNHRWH030H0J@nvidia.com>
Cc: <linux-kernel@vger.kernel.org>, <rust-for-linux@vger.kernel.org>,
 <nouveau@lists.freedesktop.org>
Subject: Re: [PATCH 0/4] rust: add `TryFrom` and `Into` derive macros
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Jesung Yang" <y.j3ms.n@gmail.com>, "Miguel Ojeda" <ojeda@kernel.org>,
 "Alex Gaynor" <alex.gaynor@gmail.com>, "Boqun Feng" <boqun.feng@gmail.com>,
 "Gary Guo" <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>,
 "Trevor Gross" <tmgross@umich.edu>, "Danilo Krummrich" <dakr@kernel.org>
X-Mailer: aerc 0.20.1-0-g2ecb8770224a-dirty
References: <cover.1754228164.git.y.j3ms.n@gmail.com>
In-Reply-To: <cover.1754228164.git.y.j3ms.n@gmail.com>
X-ClientProxiedBy: TYWPR01CA0025.jpnprd01.prod.outlook.com
 (2603:1096:400:aa::12) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|SA1PR12MB8118:EE_
X-MS-Office365-Filtering-Correlation-Id: 880719bc-f88e-40ad-2eb3-08ddd65bdf05
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|10070799003|376014|7416014|921020|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?U25sRzNTQUh1cysvZldWUEozYTFqYTd0TXB4R1lZTnB4UlhYTDZLVDdKbG1U?=
 =?utf-8?B?ZE5lKzVoNHBERzl1MTJRQ0s5ZkZndmEzOTJUaFlKVERkK3dOdVZTQUttVEpu?=
 =?utf-8?B?QTBMYTU4b2JObVdnT3F3RHhFdVJrbE11OW1xeXFBVVI3dmJDak5Yc091SHgw?=
 =?utf-8?B?OVpISDJMSTBXRlhFTzRoSU0xWGhnS0FBci9EbUJ6ZUkzQTZIWnFXQnhtb2xn?=
 =?utf-8?B?c0FYUEJJTnVDbFh0TFBkelNUSlo2dk1uY2R5N0dtMnlXMFhuczRNbVFWQXE5?=
 =?utf-8?B?ZTZaOXNnZ1UraEN6cUFuOFB1cW5xSWU2WWhBU05QNU1kLytmUGpWNmRPaFBt?=
 =?utf-8?B?NzdJeldzNmMwSW9PV1RsTEVDWVRlMTNmcWlZVzNMaklDbUZmei80WW8yUjl2?=
 =?utf-8?B?ZSttZ29BMktLTHRBVzBsaXJrNEVHbDJlQjFkVXZ2SUM1WkVnRXhLZ0JOMXR4?=
 =?utf-8?B?MWFWeWp4ajdRQlhDa09KM3RIOE9WSm9Sc1RyQjhxNy9oUTdaVzdGaHJDellW?=
 =?utf-8?B?VHkycEdjY25UMzJsZXhKVDl3NHVNaEFsSFo0ME9jSW1yQXhOYTNXenhvQ3Zx?=
 =?utf-8?B?dTBSUWgrV0dPczVPZDlySEtYR1B4VDFrNE1wZDY5UERkclpwdnRsZkRnVkJy?=
 =?utf-8?B?OVVjTG9yeHlXMHhMZVROQittRllzZlhmZS9PK2xJOGd6TzBwYUkzUlc3K3Zj?=
 =?utf-8?B?L2dHQ0REeTNRbG45M2QxNDZQNEpRdGxrQWt6RjNmWTkyeVd2ZTgyRzNvUm9z?=
 =?utf-8?B?YTg5Wi9BeThhNERwVWxRUThSQWRmZVNoS20xeFppZVJrdEE2clpUNkJiRnI1?=
 =?utf-8?B?MDVrRkdieXhMQVJ0MUJMaUc4UFV3WG9ZbkZKVXpGcU10M3dEVldZSTF2NjZV?=
 =?utf-8?B?aEQ3bDhCYklBUjlUT09NZDZWYS92cHpJaDljMWR0MnZuWFpKZSt5bjlEOTYv?=
 =?utf-8?B?Z3lzS1R1WlJJRldHVDh0dHNPNHdhUnlmcG5zVldiYmxVVG92dnBwN0ZrN0pC?=
 =?utf-8?B?eEFJamd6Rm5NeTJ2aEdhMXFValRKV3JDZnNrcEJTdTJnWDh1MmNVVU5TMlpt?=
 =?utf-8?B?Q1lQN1BwZ1dzM3RHQlowMURHeEh5N210QWs3M0M4dTlhNEo1NU9EbkRzeTVJ?=
 =?utf-8?B?SUNiazAyYkY1ZzFMdkQyYjJpQ3JKblljSjVoOFpoK1kyYU5YK1FheTFiZnRR?=
 =?utf-8?B?NmI2bUpvckdBRGRESUF0TklOOTN6eDROa3I1cUJHSnZtVFNoMk4vMjhPaVha?=
 =?utf-8?B?Y1FZWTVuR0VtMll4YUtGVEREd1RrckpTRStXSGZiNTMwTGVvZGVUcnNuajdn?=
 =?utf-8?B?UU11OE9QemNJL0dIQ0JIaEVpeVFUang1YmRURGNXditrREFkMklYVlhET1o4?=
 =?utf-8?B?cUNJK1RJMkFJRHZvVGMxdGdiR0EyNnBEekRBNWxsKzRXZkRaU1dOaXUzRE44?=
 =?utf-8?B?MnlaM0NpRjJmVmZzZXREa01nNWo1WjUwRWdQZkQxNzR1eG0vYWxGQkloVTBa?=
 =?utf-8?B?VFdyUjVsQVV2eWNCMkVCbHdSd1RKZzdhTWxueTJTUGo0SnlxbmdSdkZlZ0xW?=
 =?utf-8?B?dnJVdzluL3J3NGR4RXFhNURQa2VsOFBqdjNXblBJNmZKYnVKWG4yMzF5VHdw?=
 =?utf-8?B?cituK0wvSEY2MTdtTERBU3BGZG81OEZSaUQzVmxJd0YrMFRXQXNrYTdybTVy?=
 =?utf-8?B?aHVwYjNWUVNVZ3I5bDVOSnRzRU8zOHV1b0Y2U2hwN0V6YlJEemdVTmFDcXpj?=
 =?utf-8?B?aUpDajA2Sll5TEhXYmxmN2JDdzlaQk1aaU1FOVRBakkwcEh6UUVxcVdSM2FW?=
 =?utf-8?B?NjBTVjBXU0NDNkVSd3dqV3VzTG0ybmhEK1QwYUtHcHBjcFU2QTlZamFBWmJh?=
 =?utf-8?B?VWlBbzJIOVdPTGgvNmhvMGNua1dVUzdTR09DcnNCMTIxaWRnRlg2aU9GMVdm?=
 =?utf-8?B?NzF5RXNrN1p1RVJTWGZuM0NDd3VnVGorakhKemp3OWpQckJQRU5LSFZkcExD?=
 =?utf-8?B?UmZSSHRIUFlBPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(10070799003)(376014)(7416014)(921020)(7053199007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?U3N4MXRHUjNFR1lyWEJNV3pSMUVxM0I3ZkZwM3h5eGJuSjdhK0ZkR3oyL1Na?=
 =?utf-8?B?aW9LQVVkakVPdXc4L2dVdHg2Si84NlE1c1pKd09SSzg4L0t6UkFZbmZuWHRM?=
 =?utf-8?B?QVI1bHFuc3RueFdZNHhnOHFRL25KdDlnR3NMR2thMUl3ek96eUF1eDVZbkVL?=
 =?utf-8?B?TzBvTlkxbUFwQjZiQzdzRS9nTzZ6REFScjZqZk03MVFKeWJhT2dpTVBtL0pp?=
 =?utf-8?B?R2ZNVTcwaGxZVzBudXNldzB0cnR6Mk02S0xKTDNXR0M2ZU5ndTltNldlQ2c0?=
 =?utf-8?B?cEdWWTMyekVRLzVZby9WdExiOWk5dkErN1JmMWxKM1lRd3JBeWpQMXZyZ2Nn?=
 =?utf-8?B?M2JRUS94QW03N0kyV1NWVktmbVdGSi9OS3hybEkreXFrczdlR1RnZnlFNyt2?=
 =?utf-8?B?dXEyUnFMU3NTZVdJYnQxRjEzOWREeWtMblo1eVhRbXZMTlRrZWZnRnlTeTZw?=
 =?utf-8?B?ZUI2NkZ1ZVRHZDd0RkJOYnBTNklXYnNZUTZnTTF5QXdQd1ErV2laa3pJMEhl?=
 =?utf-8?B?dDZUWWpoNzhSTzN4MTRsUEhWaHMvdnpWTGVFcTBOS3hpM3FtbVJ4NWNLaXhF?=
 =?utf-8?B?LzFqcnZGV3hySVhNMkg4MzVqNzE2QTBQZHFEYmptOTQrWFBQZFY0MUtaU1pG?=
 =?utf-8?B?Q0lVUkc0K1dKV0tzTDFQc3Y1UjRjb0Rva0QvYmZubGNTcU5XWGZydFZZR3pR?=
 =?utf-8?B?Z09MeFRQaGs3NVhVYlpTbDNhQUY3eURzTnQyMEdLMUgveW0zMmtGeG5HT1Jq?=
 =?utf-8?B?U2J4dmtEUkFzNVNTT1kyT3lMYkVzYVpBNm92V054d3JYV3NKWHhEMzVmM2Y3?=
 =?utf-8?B?S3kySGhLQ0d2NWxqQVZiWEpObmFRY1lSN0c4UmdReFRFZmtkOGs1Rk5sWEFY?=
 =?utf-8?B?MURqL3IxRzk1WER2NnYvT3NzQzB3MW5jWEsycis3VVhHV3I4ck1SNGFtVDY5?=
 =?utf-8?B?bmZXRGRrNU15UDFVYSttTU5jR3J1ZTIzdzMrb1YzeWl5by9YQTczaEp1Z2tw?=
 =?utf-8?B?Zyt0YjZhMEgybnAvaithT3lUTjhTZnFpQ2VOUkhYU3ZrK2xaWDNNRXRnc1Uw?=
 =?utf-8?B?Q2dWbzNzM2J0djBBMEh3UU1DR0VqejVNMkVDNk9ranpMTHh6ZVZDUjZ4ZlF6?=
 =?utf-8?B?Nk13ZVpxd2xnbkcvay91SDMwVEQyTHcyaEthL1h2a0h1Ylp0YWJSbVRPTldl?=
 =?utf-8?B?b2xRc0syUytMa1pITVFKNzhiNGFKMGtvVXhERnJUVGkrM1NjSXZKZm9mcFFT?=
 =?utf-8?B?anNWR2ZHeW1KZDVyWVJQT0xVZGtFNHBiZWEyaWdKSlZlOVdPaCtCZmJFUXN4?=
 =?utf-8?B?cDlvUUtsVlQrdjVuYjJpbGc0bG04RGdoaVZFSjliWXAwM0FGSEU0ZEx0MXFF?=
 =?utf-8?B?VHlScGhaYmpvL2JvWkdGN0F4cUk5UFVzZ3RxKzQ4Ykd0KzNNTXloZGtZVDgy?=
 =?utf-8?B?MFhHbVF5YlIrM0RqQ3dHa1lsKytTVFA1RWZCUXlKL2dGOElteG1GWU9zQ2ow?=
 =?utf-8?B?WUg2VWJwQnQ4SDJnc1lTdDlYMTBadmlqSXA5Rldma2VWelBVU250cUlrdVdC?=
 =?utf-8?B?dlRYT0RRMWJrRWgyT3ZJTFVGSDJpTVZHUER6cStvSTZTU2lWVmxtWXY5QWRQ?=
 =?utf-8?B?ZDVuV2dVSktEcUVBZ3k0dTdhNzlTVzVJS3Bsa2NINXA5SU8rd0NPVFQ0Qk5T?=
 =?utf-8?B?QW5COXU2VlkxS2x0Zm9kZ3RZU3l3bDZQcGdWVkFOTEViM1VSVWRxV3BScUNI?=
 =?utf-8?B?SVdqd08yaGQvWStPaEczM000Zm5lUFlsU09uWjNiODZVOGZkNUtIYVhVUkw1?=
 =?utf-8?B?OTZDYkFieUdrMElFK3FlSEcxSHJvZ2UvZGMyeUdFK205S0VSVDdsN0VZMzFX?=
 =?utf-8?B?cVRYWFAvdFV0MGh5bzBsVmtmTm42WjRSbVo0V25hVFVsaHo2eXRkeHRFRjVC?=
 =?utf-8?B?anJrUU1QWnB4Sk5tZU1kK2NlaitYZ3BIbGgwMkZ5aUdIQlVzM1lIaXVvemF5?=
 =?utf-8?B?aDRqSGJlU3FJVlBmTVZTQTBBUjZaYTlrblcxSm1xQyttUlBVTEVnSTNPZGFT?=
 =?utf-8?B?L3dNTFZqS3N6eGtrb0pzaWVGUFgvcWx5R1ZidFo4TWhFRkFhYWR2SHNoRlAz?=
 =?utf-8?B?TkZRSG5FVDlSUW9Yc1JiTXZkOElFZVVyUEU5RHpEd0VwTlpEUXhuajAwRWov?=
 =?utf-8?Q?6T1Yf2xCXKH9NVK1fBh3CiQdQvjERq433B3WgofPRg/3?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 880719bc-f88e-40ad-2eb3-08ddd65bdf05
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Aug 2025 09:13:43.2203 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Z75w/1bQUTzjb/iJJ2wFwHfjBujIvyKwI3XPtBMVxRcPYTZBYTGlPUtpY2EH5rYFMM0HN0lFl5ZCc23VzPqnTQ==
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
> This patch series introduces derive macros for `TryFrom` and `Into`
> traits.
>
> A few enhancements were made to the custom `quote!()` macro to write
> the derive macro. These include support for additional punctuation
> tokens and a fix for an unused variable warning when quoting simple
> forms. Detailed information about these enhancements is provided in the
> relevant patches.
>
> This series builds on the previous work [1], where the `FromPrimitive`
> trait was considered too heavy for the current use cases. In response
> to the emerging need for functionality similar to `ToPrimitive`, this
> series also implements the `Into` derive macro.
>
> The original discussion can be found on Zulip [2].
>
> [1] https://lore.kernel.org/rust-for-linux/cover.1750689857.git.y.j3ms.n@=
gmail.com/
> [2] https://rust-for-linux.zulipchat.com/#narrow/channel/288089/topic/x/n=
ear/524335626

I have tried this series on nova-core and it allowed me to remove 150
lines of boiletplate just like that. As far as nova-core is concerned,
this is a perfect fit.

For the larger kernel, where using the right type is essential and where
we want to avoid error paths whenever possible, I also feel like this is
a much better fit than the initial `FromPrimitive`. But it would be nice
to hear other opinions on the matter.

I will try to review as much as my proc-macro knowledge allows me to,
but for now:

Tested-by: Alexandre Courbot <acourbot@nvidia.com>
