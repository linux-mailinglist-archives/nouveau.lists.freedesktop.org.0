Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AC5A5A31F89
	for <lists+nouveau@lfdr.de>; Wed, 12 Feb 2025 07:55:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B991410E7AD;
	Wed, 12 Feb 2025 06:55:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="igE9o5fP";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2086.outbound.protection.outlook.com [40.107.244.86])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8CF1310E25C;
 Wed, 12 Feb 2025 06:55:17 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ibGxZLslf6qRlsXav+sjuA+DNDfQVqt2BJja2oNM11OxTFZa1XCBBWegaWfDBBO8NcjJ0f85HskuqjmXemDZTiqcQ3+GWNBR+DN8kyxgMA91zwoCJ93t76Q/aeupN5oJyDvdic6CDwL3l7NwhBQWehzTb0tZyciDkEkaJv6z7zuy+uJMzcXpOiV8jnJZQyxBNAzMCDg3ubnBKchT63HHoIB+wSPh+0Bk2zP65j0VjUrgaddx5QhOpesv0550rJ0ZO8D06+vrRlL6MB8dIOrJwPG9ed5kA3yZ4pMtfBjVnGVs/XsEIiLbnvIh8E46ybo1Z+UcyTXcPd3hi3RhM3FRpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YGA/nt+eY2Pb3ynnG7F/cLU60e2WIctkjIviLK/L8hw=;
 b=nufaHL5FbGPd2IHYkVE+IV+yrK3CKWeSFQ2EvbOfBWEorm3yqAqdQxaOuQrGtto3nZNgTJDbNd0OOIK2DxCtEwjUtEANQ7s3Yemu4pvWOpeO8cBjLLuX7R25Lwn5BJ9zdGZichXdz3O2V453ytMpx8jdH9uo6xU7wcOTlmWJZEBbDh4+PhE5au+M/CoeXCKIffYOEyle+/uJDTmggFIWr6s4UpDfgPZlQVlc53obJH0GcM2FVA5XpF59ZFT2k+kU8QJLiOGj3OEe1JUFsl6N6Ef9KnkE6CosQJBnaxCowj0mZnH6Tvy4mExfZVGdIsmU6NxxZ4f8TVGe1QCm+qUBBA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YGA/nt+eY2Pb3ynnG7F/cLU60e2WIctkjIviLK/L8hw=;
 b=igE9o5fPkNFCu3rrbHUrMzpkb8+/E/SMeVWVcdowW6np+zJUuMhr6JYrZZ0arjze/dA+5oB85auvJu+FUciC8/H+ga/jMueNPWgsPLh++4EPUv5LMTo2qc7xU0RUnAlHCKbValgn5D1pQ7n0X9Gih1twLpI/ducUKA+MEhserB4kj12i7IDAVM67HNNLilDDxGq96BNz0Br99eT/r4An7AA1cADtt4Fp5kyPm6K057tMHkKGUCTZm/GUAphq5noxPMIRKuPAVqHNAD7VPRpVLR42e27SFjRsFlDe0uTKowY5+uXonN2eLyJbq5OetHDdr2VFc2atvgN3E9Ut1TsAlQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by MN0PR12MB5980.namprd12.prod.outlook.com (2603:10b6:208:37f::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.18; Wed, 12 Feb
 2025 06:55:13 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99%4]) with mapi id 15.20.8422.015; Wed, 12 Feb 2025
 06:55:13 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 12 Feb 2025 15:55:08 +0900
Message-Id: <D7Q9QSYHW7D7.2GCEXYDRVSMUR@nvidia.com>
Cc: <airlied@gmail.com>, <daniel@ffwll.ch>, <dakr@kernel.org>,
 <bskeggs@nvidia.com>, <acurrid@nvidia.com>, <cjia@nvidia.com>,
 <smitra@nvidia.com>, <ankita@nvidia.com>, <aniketa@nvidia.com>,
 <kwankhede@nvidia.com>, <targupta@nvidia.com>, <zhiwang@kernel.org>,
 "Nouveau" <nouveau-bounces@lists.freedesktop.org>
Subject: Re: [PATCH 2/5] drm/nouveau/nvkm: factor out the current RPC
 command reply policies
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Zhi Wang" <zhiw@nvidia.com>, <nouveau@lists.freedesktop.org>
X-Mailer: aerc 0.20.1-0-g2ecb8770224a
References: <20250207175806.78051-1-zhiw@nvidia.com>
 <20250207175806.78051-3-zhiw@nvidia.com>
In-Reply-To: <20250207175806.78051-3-zhiw@nvidia.com>
X-ClientProxiedBy: TY2PR0101CA0027.apcprd01.prod.exchangelabs.com
 (2603:1096:404:8000::13) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|MN0PR12MB5980:EE_
X-MS-Office365-Filtering-Correlation-Id: 91d1e86e-da90-429b-8b6b-08dd4b323303
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0; ARA:13230040|376014|1800799024|366016|10070799003;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?S0V0WEt6N2RNNlRpZm9IR3FPTWIxU1k0UlBVRnZaTURsWUZ2UjZxVjFwOWdk?=
 =?utf-8?B?Mkk0Z3NyOGlObVpMMkR6Qjh1ajVyRGtmdDhsQTU3MEhwZithWTIvZ01XaFps?=
 =?utf-8?B?ajllSzUvazdlZjZLYloxdEpJUTREUDhTaXZ6SHU3eDJHcUIyNTA1dmtIcDlj?=
 =?utf-8?B?YjJmZ3lzMGRuK1k5ekdXOWoyRTlMZWVldEFRNHpLck1vTEh5dCtIaFp1ZWx2?=
 =?utf-8?B?VUZ6OVhxc1lpMDZoMWlaWEV2ZzlpeSt5OE54UWxYSkxwS2hsTlc5c2tZaUJ0?=
 =?utf-8?B?RkxZdDl4OVcrTzBVK1hPeW9taTVsTVlTS3gwaDBKZjNSZE5uVFl6cVVKR3Bo?=
 =?utf-8?B?c1ViM2Z6akFkbVZwNFE0Y2VqcEREbWFNTlFsWFRlNG1nZEZBSnZQbTRKRTZK?=
 =?utf-8?B?cDhLS2JrTi9uWWVQY3FURWZWLzZEejlTV1djalB1cHNOeFkzbXhaRy8vdHNi?=
 =?utf-8?B?Q01sWGtsOEtpNXNJVUYrWWQ0N0dOWDNISGVMbHhxZlpQcEdZYXltZHVZUkk3?=
 =?utf-8?B?WitNVENJYnB0aEF2VDJsTHRISFk0MHFnc1BXOFNXdWhYc3R2WUJnQ0I1N3JU?=
 =?utf-8?B?VkJYUXF1Z2NjME5acGthcmdzMk5oV2xtb2hzZi9aUWVScnk0eG1XNXpWVStu?=
 =?utf-8?B?QUp2MXZQUDJMWXNxQTJsUDRxWUx0VG1Ealg1N2kxbHY3bm5lVmNQMWY5cEly?=
 =?utf-8?B?MzJJTUlmL2MxZy9Lb29lQXF6d3ZIRmJxcDBBc1h0TU5sSDEwdElyYldCbk54?=
 =?utf-8?B?YWVEcmdBTFplbnNqeFBSVGkwQ0ROcWRsYVNCd0JyUVNpdU5sem5TZTd2dmpG?=
 =?utf-8?B?M2VuYTZNUkxXd0ttRjdtNS8zSWZNZ21iaU1RemtNa0J1Q1hWY01OSzQ5Vkk1?=
 =?utf-8?B?K1dwWGRlQ2tya0grV2lVRkVZU285OHFwN0hGZ2U1YTBPUXhOMnJFQTJTbFBS?=
 =?utf-8?B?SDRPV2NGaXRPell1NFdUdEUyejEzdHRTaU9VdEg4aHRnYnF4VDVZcDBqOWdm?=
 =?utf-8?B?UDEwNHJScW9tQUFSS2ZtWFBzYm91UnJWWkhYa2p4RS9ERkNJUmc4aUpjMm55?=
 =?utf-8?B?dkpFYmNvRkpuU0VNZ2NKNHNrbFlZaEJmMzdJa3JKbG5OQzJ1LytGcEtWV0hI?=
 =?utf-8?B?bkM2Q1JaZENTck1UNTJ0dnlvMHZrWFViT3FwNTlVNWkrMFhNeC9xS1QzYU8x?=
 =?utf-8?B?S2xVNHd4ZzhkM3JOb2gwZVJEMk5GMGlXdkMrcDdvaUFCSmpsWXZxbk8rWVBH?=
 =?utf-8?B?ajRBRDMwYkR3cjdGLyttaTl6SDNCUVova0xZZWIrd3FnakRmMHFwWWVKRGQx?=
 =?utf-8?B?NUdDMHdDeng4bUt0bGMvUVNFQjFCNWFyd3ZIY0d5N3p2aXdyM1ZHWW9tSGo0?=
 =?utf-8?B?ODQ3elZVMFBTRGdnV293eUQ1aUNtNGQ1NGpib09PUTFRV0xWbWtkV3RMblhQ?=
 =?utf-8?B?ODhENVMza1BHNHRrd2RvYkpGYTJRaE5ST2dmbnVLU1JTL2JsMmNSMW9HUURa?=
 =?utf-8?B?aG5iM1lhdGkvNEtIVUpvMDF1TVdKdXNuTE9helRxdGNtT0lnazgrd1ozRldV?=
 =?utf-8?B?RURySGlZUnVoMHFVUXZvUGEyWk1iS2RGTWlrRlZBZXJZTG5Vblp1UFJ6VjdR?=
 =?utf-8?B?MWh1RVdlYkxHaFNhU3g3TERRektXZkFqb25adTBlMndtcFhpYnVBRE9FTHNE?=
 =?utf-8?B?Q01FZW9wSFppWUJ1TmRIaXhlOERmQ3cyV3RsUDh1Z0ZkbVhrSUVZZWRrRDRC?=
 =?utf-8?B?NWdSNkV6QTVOWThlKzZvRjdtd0pKKzIzRWRVMnJPZkVsaWw2dXY1dnR0c240?=
 =?utf-8?B?NUxXU1FRNTFRYUtEZWs2VVpRMmd0Ulc1K0NyVWlKVG5uUGFZSEJXalVVTDly?=
 =?utf-8?Q?hbjwJk6YDs0+P?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(10070799003); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YWRIK3ZMQk01aFM1OHBjbnhLRERCaUhldk9MNHZjU25jMktWNWNHUDNROHhY?=
 =?utf-8?B?NjZIeWI5VjBuTzJIM1FsM1hRMTRqdTJSMlgrRnJhbTRrWjErUytSUWZvb1Fs?=
 =?utf-8?B?eGFaYmRtMytodjdNQkNoYjlwQVFUb2NVQTc4c0xlRUltYUZLQmFrSnZSRTdY?=
 =?utf-8?B?K2hDQjU0bmZ1c3lyd2V4eWNLTldFMGJQMzZVeTFsL0o5SlBrLzNldkVMdVFI?=
 =?utf-8?B?MjB0OGd6SWJLY3MrKzRMcDRJVEpQSGo5OVRkTC92TW9IamVJZG5YaVlwaEd5?=
 =?utf-8?B?SWVmaGxFL3E5amxoa0hjMEJyVjR2bWt3N0ZleHJjZEhjaEpmT1FNVlF3VnB1?=
 =?utf-8?B?YzlmWldQTHYyeHFqMzFTelEyR2dKbGFkTWlzaXQ3R2tlUDFQN29GdG9LcVhj?=
 =?utf-8?B?eUtSa2FaR21WblVtRWtjSmw4VklWOXRNTDdMNlNKNHdpQnpsdWh4MUZZTlhu?=
 =?utf-8?B?ZmZBSEJiRHFWcG41TWo2MTR3aTgvWmNSNnB6UFRndDN3L1BqSjFTSldsdTFB?=
 =?utf-8?B?ai9EVWx3TWIyN0tpbFJCdXVWclZCSk52c01UK1dhUk9NWlpycTY3aEZmcHkx?=
 =?utf-8?B?SER3R2lMdFZic1Naa0NUWXBnRXRBOFN1UnpiUmU3YTVIQUhXUU0vZENDOVlW?=
 =?utf-8?B?V2NGK1NQYzBDUmQrZ1FjSXoyajluNmlpbUFoZnRTQUlrSVpKRWk5cGNrd3hy?=
 =?utf-8?B?bXRhTVVBb04yMHAwcTh0TVdGbTI0WFhwRDJUYVNNajRtQXloWE55VWNiKzVC?=
 =?utf-8?B?RXViREZmNTRNMm8zaFhMTEI0QTNCMURKZE9Dc2hMdFYzdG91b1NidWhDZ3dk?=
 =?utf-8?B?T1lnZFphdTFWeVQ0K0pvQmg0NEhvSy9QTWdXT0JHTUJFNzIvWDBhSzVGUER4?=
 =?utf-8?B?WFRjWmFRRGltamxnUzVjd2tnckNBbVRMSG5BUFI4Z0VHWFhUejIwZEwxb1Ji?=
 =?utf-8?B?bk9wY2lrSFdQQmNxTEM1ZWdhVGFGWUs0UUZaQW9BMHlWYWJUTHRGcUhRSWlu?=
 =?utf-8?B?TEpvV0hsbTJxODNoeDBqTHZVaVlyaEhxMkt4dW10UE5GeGduNHI1TDRSQjdQ?=
 =?utf-8?B?eGVrOUFzN3laYm8vM1hXM3ZkcWg1bENqZ3E4dVc4RGc0Tlo2MkJTemRIemo1?=
 =?utf-8?B?MVBXWXlLdnBtWmx0OWZHMEY2eXFMMWRzRFp6eGF3T3grU01mM21FYWlBNmw2?=
 =?utf-8?B?eVhSang5bWlOZXk4OW9TM0lCSCtHdnhhdmRnT2V1YVRnY2hsN2FCL0xUQkpR?=
 =?utf-8?B?M0drelAyZFN0MFdzclBEZ2o3dHNxaG9wVzYrY2RnNnRyaVlIUFVOVlpPRXlG?=
 =?utf-8?B?dHI1UDZEcG9YK293VEtHODRGcEZDRWpvSHdPNm52aHRHNElTQkQwWVhZeXFV?=
 =?utf-8?B?YzhERVFRK2FFMk9kNEs1enRGZU5QSW9ERE1kRytmS05kSTFyNlMwWWQ4d3gx?=
 =?utf-8?B?NkRQR2xnZmU4RmNOWEdkTXJpcWd0N09FZ2h5VkQ3TEhQWmtSOUlJNXpxZEM1?=
 =?utf-8?B?UkVmdzJLdFV2NnJ2Mk5IWEttOUZRSUJOcS9zdWJnRjhYb1dOWHlMYmdYQnBn?=
 =?utf-8?B?dlhlTjJoVmduWWhoZkhmSFB2TWEraEt4VS8weGxqU2c0bmllYUFnSCtiZWxK?=
 =?utf-8?B?SVEvdzRUajJQM0NZSTRpbFRMRHpRK2VldGgxZnNuaHZBeUVCLzRNYU5WZkha?=
 =?utf-8?B?cHpmbm96L3FQR21IeVd1UTdWVngyWDJKeW5GSE53SHUwNkZrcXh4cWhaOUth?=
 =?utf-8?B?bU12VmhaVnRVVEQ1ckVmSURLN2xRUkl3WXczdU82anpLS0xqT0hvZ09Fa2pK?=
 =?utf-8?B?UDY1TzFZaVQwQW1ZV0VYNFNyWlFTbndHcHF3VWdYWDcwTG1CWmIyQng0T2M1?=
 =?utf-8?B?QzFoVXM2TFc1cnBNOXkrVGNIYmwyTXRTdnJUTlMrSUpIbS92YitxRG9jNUE4?=
 =?utf-8?B?TGlZcVBPYlk5L0Z1aHJBNjJ4N2tGbWJHRWFzSHJEWXY1ZnhmV2xtRVNSL1Zs?=
 =?utf-8?B?OUNhQmhlU29JVFp2bkVzZ3BLRGZmRG53WjhlNUdETm41VlZBTVVZZHpBcnZS?=
 =?utf-8?B?U3FUK2RrRkFLcmJYSXoyZEZBVDArWjlraTN2YjVIMHUvQ215TDBjdEVRZlZE?=
 =?utf-8?B?cEh6UXhrNGZFazhKODB0SEFSMFhRS3VoRVlDYi9VYU5aamFBT2ZIWWxWVStG?=
 =?utf-8?Q?9wuvb/5T4U/ENrM5bEOsQl5EDEejWZ06iMCmwZkPDmIZ?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 91d1e86e-da90-429b-8b6b-08dd4b323303
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Feb 2025 06:55:13.5097 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GtVM63J6vRFXoFGZwx6WxP9VWHDpMLerYCmwQyBixLOIcjwNtSKLSfz8XSy68dK3WTseSKqdHejaQej0O2h22g==
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
> There can be multiple cases of handling the GSP RPC messages, which are
> the reply of GSP RPC commands according to the requirement of the callers
> and the nature of the GSP RPC commands.
>
> The current supported reply policies are "callers don't care" or "receive
> the entire message" according to the requirement of the caller. For
> introducing a new policy, factor out the current RPC command reply
> polices.
>
> Factor out NVKM_GSP_RPC_REPLY_RECV as "receive the entire message". If
> none is specified, the default is "callers don't care".
>
> No functional change is intended.
>
> Signed-off-by: Zhi Wang <zhiw@nvidia.com>
> ---
>  .../gpu/drm/nouveau/include/nvkm/subdev/gsp.h | 16 +++++---
>  .../gpu/drm/nouveau/nvkm/subdev/bar/r535.c    |  2 +-
>  .../gpu/drm/nouveau/nvkm/subdev/gsp/r535.c    | 41 +++++++++++--------
>  .../drm/nouveau/nvkm/subdev/instmem/r535.c    |  2 +-
>  4 files changed, 36 insertions(+), 25 deletions(-)
>
> diff --git a/drivers/gpu/drm/nouveau/include/nvkm/subdev/gsp.h b/drivers/=
gpu/drm/nouveau/include/nvkm/subdev/gsp.h
> index 746e126c3ecf..c467e44cab47 100644
> --- a/drivers/gpu/drm/nouveau/include/nvkm/subdev/gsp.h
> +++ b/drivers/gpu/drm/nouveau/include/nvkm/subdev/gsp.h
> @@ -31,6 +31,10 @@ typedef int (*nvkm_gsp_msg_ntfy_func)(void *priv, u32 =
fn, void *repv, u32 repc);
>  struct nvkm_gsp_event;
>  typedef void (*nvkm_gsp_event_func)(struct nvkm_gsp_event *, void *repv,=
 u32 repc);
> =20
> +enum {
> +	NVKM_GSP_RPC_REPLY_RECV =3D 1,
> +};

Let's turn this into a named type and add a variant for the 0 value, e.g.

enum nvkm_gsp_rpc_reply_type {
  NVKM_GSP_RPC_DONT_CARE =3D 0,
  NVKM_GSP_RPC_REPLY_RECV =3D 1,
}

and use this type instead of an integer in the client code. This will
make the compiler warn us if we try to pass an unexpected value.

(DONT_CARE needs to be defined to something less ambiguous, I left it
as-is because I don't really understand the intent behind this name :))

> +
>  struct nvkm_gsp {
>  	const struct nvkm_gsp_func *func;
>  	struct nvkm_subdev subdev;
> @@ -188,7 +192,7 @@ struct nvkm_gsp {
> =20
>  	const struct nvkm_gsp_rm {
>  		void *(*rpc_get)(struct nvkm_gsp *, u32 fn, u32 argc);
> -		void *(*rpc_push)(struct nvkm_gsp *, void *argv, bool wait, u32 repc);
> +		void *(*rpc_push)(struct nvkm_gsp *gsp, void *argv, int reply, u32 rep=
c);
>  		void (*rpc_done)(struct nvkm_gsp *gsp, void *repv);
> =20
>  		void *(*rm_ctrl_get)(struct nvkm_gsp_object *, u32 cmd, u32 argc);
> @@ -255,9 +259,9 @@ nvkm_gsp_rpc_get(struct nvkm_gsp *gsp, u32 fn, u32 ar=
gc)
>  }
> =20
>  static inline void *
> -nvkm_gsp_rpc_push(struct nvkm_gsp *gsp, void *argv, bool wait, u32 repc)
> +nvkm_gsp_rpc_push(struct nvkm_gsp *gsp, void *argv, int reply, u32 repc)
>  {
> -	return gsp->rm->rpc_push(gsp, argv, wait, repc);
> +	return gsp->rm->rpc_push(gsp, argv, reply, repc);
>  }
> =20
>  static inline void *
> @@ -268,13 +272,13 @@ nvkm_gsp_rpc_rd(struct nvkm_gsp *gsp, u32 fn, u32 a=
rgc)
>  	if (IS_ERR_OR_NULL(argv))
>  		return argv;
> =20
> -	return nvkm_gsp_rpc_push(gsp, argv, true, argc);
> +	return nvkm_gsp_rpc_push(gsp, argv, NVKM_GSP_RPC_REPLY_RECV, argc);
>  }
> =20
>  static inline int
> -nvkm_gsp_rpc_wr(struct nvkm_gsp *gsp, void *argv, bool wait)
> +nvkm_gsp_rpc_wr(struct nvkm_gsp *gsp, void *argv, int reply)
>  {
> -	void *repv =3D nvkm_gsp_rpc_push(gsp, argv, wait, 0);
> +	void *repv =3D nvkm_gsp_rpc_push(gsp, argv, reply, 0);
> =20
>  	if (IS_ERR(repv))
>  		return PTR_ERR(repv);
> diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/bar/r535.c b/drivers/gpu=
/drm/nouveau/nvkm/subdev/bar/r535.c
> index 3a30bea30e36..90186f98065c 100644
> --- a/drivers/gpu/drm/nouveau/nvkm/subdev/bar/r535.c
> +++ b/drivers/gpu/drm/nouveau/nvkm/subdev/bar/r535.c
> @@ -56,7 +56,7 @@ r535_bar_bar2_update_pde(struct nvkm_gsp *gsp, u64 addr=
)
>  	rpc->info.entryValue =3D addr ? ((addr >> 4) | 2) : 0; /* PD3 entry for=
mat! */
>  	rpc->info.entryLevelShift =3D 47; //XXX: probably fetch this from mmu!
> =20
> -	return nvkm_gsp_rpc_wr(gsp, rpc, true);
> +	return nvkm_gsp_rpc_wr(gsp, rpc, NVKM_GSP_RPC_REPLY_RECV);
>  }
> =20
>  static void
> diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c b/drivers/gpu=
/drm/nouveau/nvkm/subdev/gsp/r535.c
> index 1ed7d5624a56..bc8eb9a3cb28 100644
> --- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c
> +++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c
> @@ -584,25 +584,32 @@ r535_gsp_rpc_poll(struct nvkm_gsp *gsp, u32 fn)
>  }
> =20
>  static void *
> -r535_gsp_rpc_handle_reply(struct nvkm_gsp *gsp, u32 fn, bool wait,
> +r535_gsp_rpc_handle_reply(struct nvkm_gsp *gsp, u32 fn, int reply,
>  			  u32 gsp_rpc_len)

So here 'int reply' would become 'enum nvkm_gsp_rpc_reply_type reply'
(and propagate to other callers).

>  {
>  	struct nvfw_gsp_rpc *msg;
>  	void *repv =3D NULL;
> =20
> -	if (wait) {
> +	if (!reply)
> +		return NULL;
> +
> +	switch (reply) {
> +	case NVKM_GSP_RPC_REPLY_RECV:
>  		msg =3D r535_gsp_msg_recv(gsp, fn, gsp_rpc_len);
>  		if (!IS_ERR_OR_NULL(msg))
>  			repv =3D msg->data;
>  		else
>  			repv =3D msg;
> +		break;
> +	default:
> +		repv =3D ERR_PTR(-EINVAL);
> +		break;
>  	}

With the introduced type, this would become:

switch (reply) {
  case NVKM_GSP_RPC_DONT_CARE:
    /* Works as repv is NULL already */
    break;
  case NVKM_GSP_RPC_REPLY_RECV:
    msg =3D r535_gsp_msg_recv(gsp, fn, gsp_rpc_len);
    if (!IS_ERR_OR_NULL(msg))
      repv =3D msg->data;
    else
      repv =3D msg;
    break;
}

I'm not sure whether you still need a 'default' arm? The compiler is
happy without it, and since you control all the call sites nothing funny
can happen without a dirty cast.

> -

No need to remove this separator line IMHO.

