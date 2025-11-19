Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EBCF5C6C885
	for <lists+nouveau@lfdr.de>; Wed, 19 Nov 2025 04:12:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B608B10E55E;
	Wed, 19 Nov 2025 03:12:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="pDOq9Imm";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from CY3PR05CU001.outbound.protection.outlook.com
 (mail-westcentralusazon11013031.outbound.protection.outlook.com
 [40.93.201.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 17F1410E560;
 Wed, 19 Nov 2025 03:12:01 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Fo7FSdpTXln0uAiHVeingzj58luZj3OiGqJvf2ouAPnY0o+ccpAZfV/5y/9rc6gpNc4yW/CsvdvBIYlH9E8u2WeXkkWXgQuAHgsX03w4n/g+2v0Dr1paFbAQKXe1T5ZIPIOLgERr3R3f3eTn0EA0paJJgseVqI06vWmh/NqbznET3zAluWsQZo+J/bEWOnxTFfp5DEksyhK8y3A6fMGaWSBW9nox3RAHVRFejzCCKxlsSsAXD9YBDtU1PASUlIk63zrqgfUSaaM4x7vGmooHrdd5sCxhVx3ycXDoA5B6ZklOHXWvY1f/1JMbcSmZ1G8mFkYSINtdWEcvalmfC90Suw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BJpqmQSDH6x3vCZY5DRKKNfzkmFa/IfOeUfuVAgzQDY=;
 b=UhdfIcKzC08wU4JBCn0DdWXO6Tm4jCOM783ssEwB9ort+BcSfwPHQnyVgmbnc789QCQJdCIFrA2/To418mYHVGPBfCHur+kG5G/B/KxFPCJlgWdtJk9amZ3N4ox8HsXNKdI67KC3cf1VBrgPVk31GMAy+DJWQopRPC3qSQqY+V5KzgzRGJaZzl8nDg5OXGXeinAFvUgCfnrsnQxV7+WRtkBhKt0WT/D8+bRlGiT8X8Y5oB8gAUSzzPfboZhugCEypyePUC2Ok8Dsd78jzgiFlQ0atPzSWerCv5TLOVP7cbPuB8IQch+PWUCb4sM4ma01nUTElsSgWW+TGRLuUYO6PA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BJpqmQSDH6x3vCZY5DRKKNfzkmFa/IfOeUfuVAgzQDY=;
 b=pDOq9ImmyLT36Dljxvr0tC8BFOgcPp2B04DizINDSDMA2qXrQGr57Fapf1J5bsDa7BUjpvSw5FdhZzlsITCUTWYqlNI811wQihaKPq+JJnrDOuAablTrFSKWCYcd90E5FGhbP163Ki+3ZRolZHDhX2i69J0gVud1XgQs5GFZ9DewsmeeGvwDdfye9QPlMMwOekEwaIXvoGYONg8bO/HmK4wnzdcl6bUruYGCtnazjUrbom21OLBua3yhff6YGw0FiT2I9eB9MFIjnPnYd1MnY9s4aYyz2/PsTHjtGJKJrkI/nrz+MO0j/B0hrTdsszidoMMphaK6+nuuobcb38qsrQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by BL3PR12MB6427.namprd12.prod.outlook.com (2603:10b6:208:3b6::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.16; Wed, 19 Nov
 2025 03:11:58 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9343.009; Wed, 19 Nov 2025
 03:11:58 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 19 Nov 2025 12:11:54 +0900
Message-Id: <DECCCFCUV098.3DF72GRM18SCT@nvidia.com>
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Timur Tabi" <ttabi@nvidia.com>, "Danilo Krummrich" <dakr@kernel.org>,
 "Lyude Paul" <lyude@redhat.com>, "Alexandre Courbot" <acourbot@nvidia.com>,
 "John Hubbard" <jhubbard@nvidia.com>, <nouveau@lists.freedesktop.org>,
 <rust-for-linux@vger.kernel.org>, "Joel Fernandes" <joelagnelf@nvidia.com>
Cc: "Nouveau" <nouveau-bounces@lists.freedesktop.org>
Subject: Re: [PATCH 08/11] gpu: nova-core: Add basic Turing HAL
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20251114233045.2512853-1-ttabi@nvidia.com>
 <20251114233045.2512853-9-ttabi@nvidia.com>
In-Reply-To: <20251114233045.2512853-9-ttabi@nvidia.com>
X-ClientProxiedBy: OS3P286CA0106.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:604:1a4::17) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|BL3PR12MB6427:EE_
X-MS-Office365-Filtering-Correlation-Id: 5ef67ae7-97ca-4ae2-529d-08de27196680
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0; ARA:13230040|10070799003|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?UXRoTjc1TnNTMFZ6VWNnZHkzZ0YrU000K1NUU1VIRzh2UzZvU2J1Rk8yWGFj?=
 =?utf-8?B?UmNldWVwblNHWkkxeXpySFBtZFRndW9TdnNyb29nKzM5akFxcE5JdGswK0lN?=
 =?utf-8?B?MjVOOTMvbVp0eDAxRWlNTU9Ec0VPU3BGckhEUklWRFRBTDBRUFpQOHYwS2wy?=
 =?utf-8?B?cTYxNXlHUjJPOGxyTmM0bVJFbVJvU3pEOHVVYXFTVlc1d3hPU3dDY1dYU2cv?=
 =?utf-8?B?U1dRcGp2VFVHSUR6dTY4V1dHblRwLzJuajVGTE9aK0V5UnNQdWtHSElKaEhz?=
 =?utf-8?B?L1hlYzFoVTdxM0t2YXFWTDFPaXM0SGxQcnZIcWZRVm50ZmZ1citnTFZLTm0y?=
 =?utf-8?B?Q1M5Y1FTaWRCYlNyaVBkYlhLRnhFMy82RVVqOXpsbGROeldEK0t6QURtNWds?=
 =?utf-8?B?aGxFT0pRajV2MGtZdWE3VVZDcVp6NU5yRFlGM0lTc3dpd2hobHRQRGpuOEQ3?=
 =?utf-8?B?eHBkc3B6YlE5UjNleFpvQ3VWbVFjTFVkQzgxVmtqZTRaNXoyc3VqcTRYQXhZ?=
 =?utf-8?B?QkVPc0NjSURkSGNhcWJuclYrLzNjTmtVMkFGRmRLN3VJQkE1WnRSSE91VnZU?=
 =?utf-8?B?alhpczQrS2VnK1c3Qnk2aG54UlFQM1hDSDUwUTBkK0h0dE03bEw1Y1JFMUdV?=
 =?utf-8?B?dUtUWTFpa2RqbWpMdzZ5MzlUc01tSVJ4TXJTOUtHd1E4RnU2UjhmbU9Pb2NJ?=
 =?utf-8?B?d25IMkVRMWZaOE9obVQxZGxKd1NPT3lISFRzQUtJNCszam1aWUE5NWZybGVS?=
 =?utf-8?B?QXR1eXRyMFp4M0lWZGk3WGRFSmx2L0RkTVNTTUpXNFZQN3hQKzBHKzVQYVdT?=
 =?utf-8?B?QkxIUmFrWTA3TmFPY1doRzJYRUdIWDViTE1QbXJIbmhkaTRrK05UVEVMNHdF?=
 =?utf-8?B?U04wSFRlU3VVVU8xUjlvWU9OVzN6MlBtYkM5QUZ0NVkvUkR1TVYvM1VKUmRo?=
 =?utf-8?B?WWdlZGJyVi9FTS95RUN6Z0VVQVUwbzhaTDFhOGdpL1YzMkRpUjZOV0pwMjFq?=
 =?utf-8?B?WEg4RHJudXloNWd2djM0UkE3Q3dEVFJtcWNnZldIQlhxcFdTc2FjNndVNmVZ?=
 =?utf-8?B?dWZiYU8yZ0xVZWpFUC9EOXB2OXVUN0trOW9BWG54WlNoNTZMKzg2Qkh2Zkxa?=
 =?utf-8?B?elRZdTZsMTBlaC93WkFUSWNncnEzWjZIZ0ZCWEdSQTVicjdxZVNhM3hSaU93?=
 =?utf-8?B?dVk4UnZFdVl3eGpPb0YxOHZPSnY0emErbDV5cGI0UGtINTYwczJQWm0zQUhE?=
 =?utf-8?B?aldUU0l4Zm5OL2EzSkk1RkVrRHlIdVBHN1c2UENzRUYvTUJ6cWMvcCtnbis3?=
 =?utf-8?B?aW9vODRORWRpN3RRY2d3c0diQ3Rxby9PbDR6SFpWSGxOb05nQ09pK2ZhTFlK?=
 =?utf-8?B?RFBKdE9oMUtaSlJ2alJ3TjQ5STJ1UU8vdGlEaFlqMDYwbUxzRG5DWjZxb0Uw?=
 =?utf-8?B?ZEM3RVFpc0pTRlhlZXljTnVLOEdpRy9OUUo0ZGZFNjRWWHlOcG1GRFNmdWVI?=
 =?utf-8?B?V1lMejhxYVN2UHA2b1hubyt6ek41QUkxRkpDdzFLWU1xSmU0YTM0TnRmekV0?=
 =?utf-8?B?NjBZZ2xqQmFuK3ZScDAzOUcrUHQ3dDFKUTFMdGM2c0FuMHpUdGJCN2xtU1Jw?=
 =?utf-8?B?UzhqbldFRktNNU10VXZISFVjaG9zZmN4QnppeGEwSm9rUHdJV09pUXlEK3dq?=
 =?utf-8?B?UUlGOFhITjZDdDNDSWcrZ2RzZVQ2aFdYNThKaXJPbkhrMjVQdThwUU1HamlC?=
 =?utf-8?B?TXE4bGl2K1NUbjhvRVQ5QnpVWjdwd2JYYjNlenhUTmN1Ry82K0dPQjQxdlJP?=
 =?utf-8?B?T0hBWWtsZnRYMXFwbktzN1g5Zm9PcFN3NlA5MXAwbCtCb0psRzIzd1cyUHIr?=
 =?utf-8?B?aVd5eVlrV09QWlU2b2U5MXYrVzh1N0JONGZuN083SzFXdG1rRzN6dGduUVBj?=
 =?utf-8?Q?788UTJpwFBQHIhGlLd5XyFasdkW+3zvP?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(10070799003)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RUh4dnVIdmFvbmp1dzZWa29wTFU2T1FSS1l5NGs5RDE2N1lkTDlvNEhOV0xp?=
 =?utf-8?B?RU5peGhYeFNMQW1uVkRNdWNLRnhqU2Ztb3Y0ZDJRUzgvMzBqcWl4ZEdXbFUw?=
 =?utf-8?B?Nytyenl3MXpkSzgyaDBUZ3JqRnQ2bG0zTVpmZnVFTFd4eXJubWthK0EyOUVo?=
 =?utf-8?B?QzJjVDk0VVRORGVlZlpvOFYrcHBMQmZLVTR1R3Yya2pFWUJmTlRNTzI2VkJz?=
 =?utf-8?B?TXh0akY2QklmQkVDN0dMa3NiaXI2ckdhZ1ZCb2JWaGE4aEhjMnVsRXEwZXkv?=
 =?utf-8?B?MS9HaGNDK05PQzRBN0wrSEhxSDd5eEE2QVFQK2tOb3hlOWhWcHRlRExyLzRS?=
 =?utf-8?B?M2J1aTZ5SFFoa1kyQzZtYVc5VEJRaDB4b21vbTZIRDY0QXh2R1o1ZTVhaUNu?=
 =?utf-8?B?SVhhQktoc3hrakRiOFdRS01OdmRzbjg1NmU3U0FBM3pucVVEbk8rbWJaQjAz?=
 =?utf-8?B?dVZsWFZEejVVb3NZYUVyTEZUQTFTZFBPbjV4RmYxaHZ1RmJwTmowajJ0eXl4?=
 =?utf-8?B?bVhhRVFJUi9RTzVHSWw4VXhiM1NqVlcrY0NhYit3YTQ5WVluQmtjdDVkZFpI?=
 =?utf-8?B?K3I1TEtxa3V6bWl4TTEzcjZ2WEFUTDNDNXlkaUxrNHlLcnc0WEE5Q2QyUHdQ?=
 =?utf-8?B?UUZpbWh2WkhER3lTSFY4NkxFRFlkVjJ5ZUZDMGZOcHY5ZjUyc1BRK3ArNGhq?=
 =?utf-8?B?azd4SmVzeU1wdUh4OG5oNHNRZk5RNkQrejdsS2k2eU1HM1NaUEtNVDZMYWY5?=
 =?utf-8?B?Q0p1clhDZnhtd2JoeFB6WmhaZGFNMXBocHo0UHNFa0JPL0hqWWVjRW05NFdW?=
 =?utf-8?B?Q0pwSHcvelRpRlVuZWJEZDBsUHBQTGhGOVZiSU41ejRscHNKSTh1WmYwUDBm?=
 =?utf-8?B?MHd2Nmo2YUNrRGp0Q2xsYjdXUVhuQ0E5eFFKcG0vWFU2T2tybDJ2TFBpdmdQ?=
 =?utf-8?B?V3dMbGhBVGo5RWc3WTYrbFlabS83VjNtWFZpZFF4dStCSk9DUnhQS1hwVFk4?=
 =?utf-8?B?MkVDQ3Qxd2NNSXp6S0ZSTnNhRWJ6Qk5pWUE2WlAzQzZFRWJta2pKRUZDUldr?=
 =?utf-8?B?SzN3TVcxN1BLaHYvdVRCYlFXNFRCWE5rZ1pNeHRPRk42a1ZxV2g2QVBvYmdZ?=
 =?utf-8?B?YzI2WkRKaWlnd3hoRlRKSXhLcGZzRTZxM0diYjFzVnNvS2RUT25MNVhmTm1T?=
 =?utf-8?B?c2xkRUErWjhYVUJleno5RHBPZjVUZzZIM2JKYUdaQndFakVBYVZ2TGZkZGVx?=
 =?utf-8?B?a2RNK0kzZ083YkRoRU1sREs0Q05CcmJGbk9tR1NGci9kNEJ0RGN0cVFsV1Bw?=
 =?utf-8?B?N1FuSkkxMzB4S3NCTzRaVFpJZzZiWjNCTmwyeXdGTzRtSDNLRis3NitGUXBy?=
 =?utf-8?B?dXBubmdQaTZ5SE03dy94SUdSUFg0NnlSVVhJVjlmb2xRWTFuWkpYUTFxWHNV?=
 =?utf-8?B?R1pxTkRLTHdHaWRjNWY1RUlSMkErbHloR2R5N2JEZm5WQ2VGSldLcUFxenVT?=
 =?utf-8?B?US9taSsyN0kzNXJQU0ZXNlZiQ0kydVovWThjQnp0djZxY2lvVlcvQVc1YlFj?=
 =?utf-8?B?TVBiZ3RUVC9YbFAyL0lMejAxTFA2cUJvamxiVitES0w0N2xVTDZBK2w3WjJp?=
 =?utf-8?B?U0s4S1BYeHdPbHNUR3djSlM4dzhGM0t5TlpUYm5XeWxORWhqd2tCandPRWh4?=
 =?utf-8?B?VVl5ZTY2eXpUelRrOEtSQ2NQbCtwK1BhSGNqeGt1b1lWenhjVGp6eUExbWdJ?=
 =?utf-8?B?N21ZNFpkTFJiQmp1c0lLaXJ3cmJia2VYYXE1bldYVUIzbkNUak42K1VWa1Bo?=
 =?utf-8?B?Vmd0NEdUblJJVjZDSHhoYkZFbUZIbzZVakFQUzJXUGNkRG85YWYweVp5VGlX?=
 =?utf-8?B?MFljMndRejlmalA3bWw0ckVhaWtjYWxPOXVVN3lBaWJNWk90bjB2NzM2QUY0?=
 =?utf-8?B?K3NjeDNrRkt0NGxaWDZZaFpTRjRjNUJGMHpHYXFlQURsVzYwQkNKTDJZVVls?=
 =?utf-8?B?SlhScWxOdEcyOEtPT2RFWUxUckNXaE5vZUZla00vcUhqZkM3dTBNc0VoTXo5?=
 =?utf-8?B?eVRrMkNhRUI1VTFNWnN0bmdTZmpTNGJGSVk1czdqS0dmTCtrVW1Pb3E0SmtM?=
 =?utf-8?B?ek9Fc05hRm5nMjBId2tQSnRuci93UnhwdnJ2b3NYeDI1YWQ5NjBOcU45NVZp?=
 =?utf-8?Q?Z1Z2INqeZyXuSfRkopPtuzt+eHW6s2pKJX0gD+t47MfV?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5ef67ae7-97ca-4ae2-529d-08de27196680
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2025 03:11:58.2012 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: O4Q6BY4LzeldrHSSNsXn+xTOrPSTsQLs/cFS3BMXLS+MMy66eHH6POHDgsmmxmRUsbTGPU66mq1ahs8eQkbpxA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR12MB6427
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

On Sat Nov 15, 2025 at 8:30 AM JST, Timur Tabi wrote:
<snip>
> +    fn reset_eng(&self, bar: &Bar0) -> Result {
> +        regs::NV_PFALCON_FALCON_ENGINE::update(bar, &E::ID, |v| v.set_re=
set(true));
> +
> +        // TODO[DLAY]: replace with udelay() or equivalent once availabl=
e.
> +        // TIMEOUT: falcon engine should not take more than 10us to rese=
t.
> +        let _: Result =3D
> +            read_poll_timeout(|| Ok(()), |_| false, Delta::ZERO, Delta::=
from_micros(10));

You can now use:

        fsleep(Delta::from_micros(10));

and remove the TODO item.
