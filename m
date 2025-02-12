Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A611A31F8D
	for <lists+nouveau@lfdr.de>; Wed, 12 Feb 2025 07:57:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 44F3110E7BB;
	Wed, 12 Feb 2025 06:57:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="B0fkIi71";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2044.outbound.protection.outlook.com [40.107.244.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E82010E7BB;
 Wed, 12 Feb 2025 06:57:46 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ilxw3znp/5LDxb3KFSSGSPxccLZncWy37HrUq/3I6yeyR/spfy4BIma5J/8OI1dK438z8oIzqR6/aDbU2IPTvqj3WgUfWN8j4HLPHNktBoPhDYjvG03sGNJCkGWwWVaYgcM3OlvXZ64PkSS3mWmC0f450FYsODPYn9SHsTEDolEhVVvMC7Z32fDZDai5I9g4ubdqt5O3B4cpoNRetCGMSTsS09eONUrxRi0lidL8yErJeyOC4cjQaLkUKUTkNNEjDblAKmhORAYvfjuIwdHRa3YX1Sp7JaxyBS6toy1YiYOxbBMnfy3gDcA7GiPxc8IHEDtAzEh2wyzxb00/U6GxZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kRM27UkwxfZNOVEJ1nmu3UMwdQxX6M+6gwxdTBN6B+Y=;
 b=N/PSSSk+kO+afxfXxooJ2b7zB2DjnCNx+4eQTa3de7wMHykAWEdHgrM6Ygpfmn5UpjvzH3Hj4b9rtohEl8qkQekaQs/mu/G7c+zSt2tJt6mlB2QoIp/BQw8ZknNjyjM9VvzHyuMtjC3sk5OoyPMY7akg4c83mvD7bJRN9p/2INNrKBGWMFGG7s7NgMvmhVyIGXL6Vj/ZiAIw+NLwXH0InX3gl6fs5fP/eOlyJ6BJjglBAWf+cv90/iMbC78+rw+SE9LqocQMudH6Rr64UyMyGtaZL0/fNxR0hllkCQR+NCzMbwcWfB33CAPt5//jfckvYoigGGIG2NyT/lPvs8FHsQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kRM27UkwxfZNOVEJ1nmu3UMwdQxX6M+6gwxdTBN6B+Y=;
 b=B0fkIi719/hSiYZJO9cGnJtCeGVzgi6pq52VMbuHf8EbW0s44lyIq0bnjyUJkWPTIY5FsugRp9ea3AKnScgtnF7ixEZSggNclp2EZsVlcSSee5rzjHMogiRnZT+ExTI1i0XxT0VmTPtdAbqTgNjVSS3xSuOgQwe76ABWI+nm8y7KMcyqqwq8wb6zX8lyfMzQRwJKNhN8r0aXcL1K8AtbYQuHCl1kiToommOoZa5c8EiCHuB6lpYh/Bh2M/Gj7Wfv67HWjWg6R2p0nIjyj15rySVbD1Ej/WSMD3KS9CuxHlQRmoPhGwg4YrMn3Twa9aBJjJYeV58qH5G4ADYAe7VnXw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by MN0PR12MB5980.namprd12.prod.outlook.com (2603:10b6:208:37f::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.18; Wed, 12 Feb
 2025 06:57:43 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99%4]) with mapi id 15.20.8422.015; Wed, 12 Feb 2025
 06:57:43 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 12 Feb 2025 15:57:38 +0900
Message-Id: <D7Q9SQ3YZD6V.1QXQ18Y0EVOML@nvidia.com>
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Zhi Wang" <zhiw@nvidia.com>, <nouveau@lists.freedesktop.org>
Cc: <airlied@gmail.com>, <daniel@ffwll.ch>, <dakr@kernel.org>,
 <bskeggs@nvidia.com>, <acurrid@nvidia.com>, <cjia@nvidia.com>,
 <smitra@nvidia.com>, <ankita@nvidia.com>, <aniketa@nvidia.com>,
 <kwankhede@nvidia.com>, <targupta@nvidia.com>, <zhiwang@kernel.org>,
 "Nouveau" <nouveau-bounces@lists.freedesktop.org>
Subject: Re: [PATCH 3/5] drm/nouveau/nvkm: introduce new GSP reply policy
 NVKM_GSP_RPC_REPLY_POLL
X-Mailer: aerc 0.20.1-0-g2ecb8770224a
References: <20250207175806.78051-1-zhiw@nvidia.com>
 <20250207175806.78051-4-zhiw@nvidia.com>
In-Reply-To: <20250207175806.78051-4-zhiw@nvidia.com>
X-ClientProxiedBy: TY2PR06CA0046.apcprd06.prod.outlook.com
 (2603:1096:404:2e::34) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|MN0PR12MB5980:EE_
X-MS-Office365-Filtering-Correlation-Id: 0154eb5e-ddcc-4d5d-279b-08dd4b328c9a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0; ARA:13230040|376014|1800799024|366016|10070799003;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?N2dYZjRsbEl3TFVvcWVBNEFjL2NnMXQ2ZFc2dWs0Z1dPQTExMklQVEhJOGVk?=
 =?utf-8?B?RVRWaG9peGFKOGhVOWtKU2JXUDhQdXQxQ1o1WmtWSmlKZ3UzUTZrTGdCQWxL?=
 =?utf-8?B?MFE1YzB6akdqOHJLZVFxOEVXZEIrYitlaktzK2lTNk13TnRjUmMreXdpQ0Rw?=
 =?utf-8?B?clBOeVZpcERkQnF5enpBSkp1c0grdGhjRytTZUR0MGpUMnA0MWJ6T3NJMkov?=
 =?utf-8?B?YXU2RGY2a05nRlNWOUI3WW1CNmhZSUlzOUVTdHIyNGNxT1FNa2o1NGlmZ3Q0?=
 =?utf-8?B?cWcvSzVBZ3czU00xaUZtNnM3UmtEdlRMcEd4emFDaVJ2TkFHTHdWZFdUWXRX?=
 =?utf-8?B?WEtnZEh0R3ZMY21qbFlSSTB2U29JMW9EVWpPMGV3cnE3NjlMTEtnclNXU1Jw?=
 =?utf-8?B?UWRpdEs4cDcrTnhwNXIrbFJHb0lTb3NyVlRSNVdHbTBrTjZXSTd1bi9uM09D?=
 =?utf-8?B?QXhQcTVUR3BvWEhCejdDek91RzFCNjRiZTNqSlQ5MTRwTEorL3Z0WEwyZEdT?=
 =?utf-8?B?RS9lKzJLZ0xjWWYwOW9oTGtoMlhIVDJFcWxDUS9jNFN5cFFlTUpnOTdZUnNO?=
 =?utf-8?B?VlNjVUR4d21oUlZnQUVsbWlyY0Y4RWxTQzEweTNKTEJlb1B4NklqMitBZVcz?=
 =?utf-8?B?aHhPelY5WjIwWFhZWnhLbDVOMnhVQ2Y3L0QvMG4wTEROQ2QvUW1aT0EyVDdD?=
 =?utf-8?B?UUtKSTNEK0pjK3poR1ZNOEtkWVVMMU1nQWcvc2tqcmYxdzd6alhDUi9yL3hN?=
 =?utf-8?B?WE9FdkhJOHRreWFOOVlsWEkwblpxQUpYVFRWNUpPY0tKMjFzaDJVMThYTjA1?=
 =?utf-8?B?RlU3Z0hJaUx2ODJObWQwV01zaks5Q2U5ZW51blNkd082REFqV1JtWmRCYytx?=
 =?utf-8?B?NVM2b2VqdWcyYXJkaEZ4bzVBRFQzOCtKb0xJYm9MNUtMcFloVzlDa1g3d1E3?=
 =?utf-8?B?YVRUdmdTQ2NFeDg1M3hFdGR2aStONUZuQzVERnBrZWV6dU5hbWtUelF4N3JJ?=
 =?utf-8?B?aW1LR2lZU0dYb1FiUGhLdG1NVDgyWlJJaDBGeEpSRzRjUUhZUDltV2Nvenps?=
 =?utf-8?B?ek1HL2xQL3BWMEdTTnM5QkR3WVNSaUlMbzk0K0dBZnNhRWNqN05kMzZzRkVM?=
 =?utf-8?B?UVZvMStDSjVRSHBUcG96NzFNUzcwRFJVM0owRTdXUjZSc1pYU2lKeGE1YWt1?=
 =?utf-8?B?bk4rb0tVa0lMMkkraFVTZ0p2VlMvNHU2d0hkT3lTVmM0RFVnZFY4V3I3MVJH?=
 =?utf-8?B?M1c0SWZZNEEzbUNyNHFUVGdWdnhwajBjWTNaK2Q1Q3c0WWFXKzRXNDNBUkFS?=
 =?utf-8?B?NFJ2WnA5VmNqZDFZWFcxcnU3TXpCT0YyYTMyRE1lZEd6UTFqMmpackJiaHh4?=
 =?utf-8?B?czZPb3FMUFo1ZXNyS0RQZ2tqWk05aDNLemVxVzQwL3l5V3VoODdPZDdHa3Yv?=
 =?utf-8?B?dTFUZnNiZlUwUUxENXNPNW9KQVIyMjlwZzFQVmFTUDRiM3kxSlZrTE00VG91?=
 =?utf-8?B?VGh1N2VsaUVTOUY5ckJPR3dQRWhzS0kxK2Q0YzU0ekwwSGZURXN0U2FGVngr?=
 =?utf-8?B?QVRpYWZDYUFVaG9PQ0xvNzduNTlKdkw1U2RiM3BUSlNnY2x3dGVNbFpZRkta?=
 =?utf-8?B?UFcrZ3Q4b2ZCQ1BmNW1RZHVzdkQzVmxUckpUNmZiZ01HUFY3Vzg3U2UyR1NW?=
 =?utf-8?B?dnN6ZUh6ZVJoN1BjTVkzUjFvbkFQcmFlYkpZZkJGVWJYVUFmMFozaXhIeGE2?=
 =?utf-8?B?RGpFWWgyaG1JdzFZeXlJS2Z0ZmwxRjR4Z0l2YU0vcnpiSVNLbGdNRnpTbmNz?=
 =?utf-8?B?anN6V3NMaHBDbm9mTjNCUTVCNHNxeHdjRWkrU0pmYmJCMXVERmt5SVpGWFRr?=
 =?utf-8?Q?1n35W49OLD/Zo?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(10070799003); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bHdpM2NmbExXMTVhUTk3R1dDL0hIem9MK1AvSjVqUDhBWHFPMUZuWit2cnAr?=
 =?utf-8?B?aTdFNkFXTzRBejAxNy9mYlhoVTdZSkpsMUdTb2NRS0V0WER0TjFPRU9WZ2or?=
 =?utf-8?B?czlYaWd6eHhieFp3M3MrUkl3RGVJSFpNYnVndjlKNmZnY2w0RnZvTGlDejRL?=
 =?utf-8?B?aGJYTCt0V3V5R3J4NTY4UmtNY3Q5dlNzUWxaQmpPN3hXdVNLenJPeHU2bHlX?=
 =?utf-8?B?dTYweWRKOW4zNEZGQUtYNC9WNFY3RjRzZ282U1RpcWVVZXJYTXl0VGhOa0My?=
 =?utf-8?B?SFFFNmEyaUgrVGU0SmkrY2xZNmY2eTdyZHRMWDBXdzVOd3dXSU9OL2lNMWJ5?=
 =?utf-8?B?MDZrSlNjWUtUalNXUUY0U1Z5YTdiOTg5V1FUdFhUZUdpK3hlanlWeGt4cEhi?=
 =?utf-8?B?Ukt6TjZtMHRLK2YwelFZOTBCSnRmYWtuNVV2cWRTV1dPTGppMDBIK3FjMUZP?=
 =?utf-8?B?RnZnakpqem9jOFFINWg0YTlpb1UwaHdjQlZsaUJubWdDeU95UldaSElSMG9R?=
 =?utf-8?B?cmxJQVRGUTR2Z3BCdjg1OG1LdXRaL2JvTEN1dEF5VlQ0RTBiMEExNVNGNVlh?=
 =?utf-8?B?aU9JSkpCRXJySXJnRVpmcVNsTkNQV1BmNHVHR21CbkcvMzZtcEFkeTQ5QjlH?=
 =?utf-8?B?UE9hZFRoVnR1R3A0ZFJLSzVWb0swQU9LQy9xM202UHpSK3BzWVNsTlZhSnR1?=
 =?utf-8?B?WWFpSkNLclQzMW1hcEVnRFBmVmsyY0UwdWltVEdNdFhSeDBTWTNiTnVBOG84?=
 =?utf-8?B?Y0ZKenVVQy9pVnZMalcvQXcvcGkzVnUwRmdyVzVsdjhyVHVITWIrNVdHanhM?=
 =?utf-8?B?bDBLaDVsejdKeDkrNnlIMjFWLzY2RkJLbEdCY0FsSnhCRUJBYTdmTmk4RmdG?=
 =?utf-8?B?N3ZMZ0VLQ09UNVpqazZ1ZFBNYWpKclp1RW8wclYrYTZPMGE4M3ZZMjBRdG1U?=
 =?utf-8?B?NGtIdGhVNmdrWjJmblhYVFAxNStZamNRcVZHOEgxRGg2ZTFmanlFNXR3aHdq?=
 =?utf-8?B?WkNJYzZGZHZaWkVRbHJ5TVhnN1dYRjkwOHMrZ0ZpNmJFelZYSERrN0MxbEZy?=
 =?utf-8?B?Zjc3ZDFoai9sTEpOaU1vMitMZ0F3TEg5RUpDRjNmeVVGTm55Z3dwV0ZTNnd5?=
 =?utf-8?B?ZGpyTFhsaW9HbXdQbExzNXliaTNUS3l4Qy95b0FLRm9qeFdrYVBUYzRJTkVM?=
 =?utf-8?B?U2hTOUR2WXRqVnNVRW5uWExodDdGeWZFektuekxTTjVsZm9nYlpteTBNVkgw?=
 =?utf-8?B?dmNyOTJPMDZueGMxcVRQLzFjSEJ5MHk5WVR3U2VUTHpJd01kMlRZaXhEWGJv?=
 =?utf-8?B?M0xPajZCdFZqM2FoOTRmUE5CdXJiSmpGMWhVWmNac2dCajhTWmxvUVhLOG9a?=
 =?utf-8?B?dWs1TUhuNTU5YTVEc2h4U1NTNmlFM3FwbUZucnNYQ3dpRU9aaHNEZHFjYzRW?=
 =?utf-8?B?Q0hkby9RckhnQ3V1NHNlemh0U1F0YlNGR0ZPekM2NjZNMVkxUXBtNlhtR0R1?=
 =?utf-8?B?T3ZCbit1VFpDNnVweXhlcEJ1ajRkenhjYzgvMzZGOTVaR1Fsc3lCTm41cUpu?=
 =?utf-8?B?RUVtZloxQ05DOGsvOUN0c09RcUtRL3pRNFA0cFJybGJub2N4anJCcUN1N0t4?=
 =?utf-8?B?MlFLMy9xS3pZOCtNTUJHejJhMFFSUWZ2aGlJWlJCNjl6THZ3MkdZQjF3eWUr?=
 =?utf-8?B?RUtGbVpBdmV4QTZLamhNY2xRS3dhNDY2bUt5UFYzVUNtUmc3aG9TVU9yZUdw?=
 =?utf-8?B?dC8rbDE0djBhYUR2MEtMQkhaVGNodm0rT3lKcjQ5cFdnL3NZYzMxQWM5SnNX?=
 =?utf-8?B?clNUWUtoS2l4Y1FhUThFc0pSNmlla1hMRkJmYUNBUGdMd2w1Q0E0WEthMjMw?=
 =?utf-8?B?ZEFLQ3YzTzUybEtaRTNxcmkrR1BlaTdPdUlWeTJwaXBXZ0g4K0wyUUpsQzM2?=
 =?utf-8?B?S09SbGU4a3RvZk5vUE1Ea3RGT2xLSXFOZXB5WDF1b1FFWVNGOTcvc3RlTGxs?=
 =?utf-8?B?MGpsRW9VYS8rUlZtMCttVWwvZHhhQmRBRzgvc0NBMG41d2dMMVdRcVViZWt0?=
 =?utf-8?B?Snh0Z1dHQmZ1NWNiK3JVZGpGS09kQ2pnMDVkcHorcXp6SmxyWjJMSTgwdXV4?=
 =?utf-8?B?Si9ZZ0FBTkM4QmRiSjJISXhSRkJZTndIZFVRVlVOdEpEQk9RZG80aVhwcWpz?=
 =?utf-8?Q?lxipcyYmnzNupdcIlSr+PmOxAwkW5Fu2IoZR8j4sdawt?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0154eb5e-ddcc-4d5d-279b-08dd4b328c9a
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Feb 2025 06:57:43.7056 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /lW14fbVisSQpHAOEzmX64Wwkp7CHETLauGtm05WNG+/hgJN9jMiuWD8N0K07xuFMY/45MUmEHrxxh8hct5AgA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB5980
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

On Sat Feb 8, 2025 at 2:58 AM JST, Zhi Wang wrote:
> There can be multiple cases of handling the GSP RPC messages, which
> are the reply of GSP RPC commands according to the requirement of the
> callers and the nature of the GSP RPC commands.
>
> Some GSP RPC command needs a new reply policy: "caller don't care about
> the message content but want to make sure a reply is received". To
> support this case, a new reply policy is introduced.
>
> Introduce new reply policy NVKM_GSP_RPC_REPLY_POLL, which waits for the
> returned GSP message but discards it for the caller.
>
> No functional change is intended.
>
> Signed-off-by: Zhi Wang <zhiw@nvidia.com>
> ---
>  drivers/gpu/drm/nouveau/include/nvkm/subdev/gsp.h | 1 +
>  drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c    | 3 +++
>  2 files changed, 4 insertions(+)
>
> diff --git a/drivers/gpu/drm/nouveau/include/nvkm/subdev/gsp.h b/drivers/=
gpu/drm/nouveau/include/nvkm/subdev/gsp.h
> index c467e44cab47..bc16510261b8 100644
> --- a/drivers/gpu/drm/nouveau/include/nvkm/subdev/gsp.h
> +++ b/drivers/gpu/drm/nouveau/include/nvkm/subdev/gsp.h
> @@ -33,6 +33,7 @@ typedef void (*nvkm_gsp_event_func)(struct nvkm_gsp_eve=
nt *, void *repv, u32 rep
> =20
>  enum {
>  	NVKM_GSP_RPC_REPLY_RECV =3D 1,
> +	NVKM_GSP_RPC_REPLY_POLL,
>  };
> =20
>  struct nvkm_gsp {
> diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c b/drivers/gpu=
/drm/nouveau/nvkm/subdev/gsp/r535.c
> index bc8eb9a3cb28..af2836cca38f 100644
> --- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c
> +++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c
> @@ -601,6 +601,9 @@ r535_gsp_rpc_handle_reply(struct nvkm_gsp *gsp, u32 f=
n, int reply,
>  		else
>  			repv =3D msg;
>  		break;
> +	case NVKM_GSP_RPC_REPLY_POLL:
> +		repv =3D r535_gsp_msg_recv(gsp, fn, 0);
> +		break;
>  	default:
>  		repv =3D ERR_PTR(-EINVAL);
>  		break;

I suspect patch 4 can be merged into this one, so we introduce the user
at the same time as the functionality.
