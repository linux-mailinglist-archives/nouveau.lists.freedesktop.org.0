Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AF32A31EF4
	for <lists+nouveau@lfdr.de>; Wed, 12 Feb 2025 07:32:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 034A210E0DC;
	Wed, 12 Feb 2025 06:32:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="jnD02dEc";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2088.outbound.protection.outlook.com [40.107.243.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C4B3510E0DC;
 Wed, 12 Feb 2025 06:32:28 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VdJRHqWAswwuWsTkKtI6yKxxoO3dkQLd8BXFqtpszSrYAcHCPmybzqR62AAJoEmWmyGLBFReK+rZ9lfaBr/yKs5EKJbvMh6/pcca6lASvo3yCQg/3gzKQ98w4OeKlW1xHRHdpVzeLlI8WiU9DOASF+E2kyfN8jU3IAXNb6ZzSxwPbLZVnt75P3vXu0Efj2iKaVrll68UuBG9x/mNTg2ckBLvSAvBw11sllsaICggqB0IX405rPgdEklAkNRDtg+FXV/sI3eJyqr5vt8OUpVv0uO46WR1lnU8mGo1j3sCDgt6F9kZPE/WIZwDHYYuebv8H5GmgEhA7mGNRHP92jAvpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Bptodw+5eSOaLubklkaOVoQcj7s5xvud2HGgeKEVhTE=;
 b=twFiJEK814sMSvLVhB3cUcCpfwH0wzzpJw2fWg0SPp+2lztXuSrO+KSn5JNBtXQhKn6r5Ah/iFbXYGBHDqArCVmm74xTqiVVbm62OaFS/FMiOGbvs0Pqxkwrr55377dc/joMO69dX3m+TO+nItt8nEspEdWO9jjqVFJkukWi2PBBoLrpyM8ffgykiTKj8PaSm5Atas5JpUjrl6upUHhhfXs+MlpJanVMqgGJUEtjwTSU5MJdkQZth0zh3Eo6V3dTS86gcV/qk05UaD+PdiWM2F5znhn/1dPfn3xImpLwnGUA+BgIU9uO0Ff8XS6yNtoPdUM1agD6D90GTKPHPWAEag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Bptodw+5eSOaLubklkaOVoQcj7s5xvud2HGgeKEVhTE=;
 b=jnD02dEcTn2/vJ60a60IDItSKRcP13BOym2k2N43e3pRTJwrEE4rtaPYwL1SJgeVe6gnuzCj/eGXjKyifltyQL1FMKLl18GwT//3tDKTrjVyILOnuATXiQynJ0k/ZiGxA+rgKkzAu8zqUgZ7VNqpb4dB1TM5czHqUl+iS/m4MVb+6OEumQCreWayFitBeozVysFt0i8FA9U7KTe432fOopIRLwqr2Ee5yfLiNo+WgE8FljzO2oW0V5EtT6XdPB0pTObuUT36+3Ok8VbXz2WwR8uZCdVDmZHD0RLjkEKYEFdaeb1q01hHsHFPBjcZpfChoJKlckJKCCC9RRJg1F/3ww==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by SN7PR12MB7228.namprd12.prod.outlook.com (2603:10b6:806:2ab::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8445.11; Wed, 12 Feb
 2025 06:32:26 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99%4]) with mapi id 15.20.8422.015; Wed, 12 Feb 2025
 06:32:25 +0000
Content-Type: text/plain; charset=UTF-8
Date: Wed, 12 Feb 2025 15:32:17 +0900
Message-Id: <D7Q99AZ73AAQ.WV5WM8EFC0C@nvidia.com>
Cc: <airlied@gmail.com>, <daniel@ffwll.ch>, <dakr@kernel.org>,
 <bskeggs@nvidia.com>, <acurrid@nvidia.com>, <cjia@nvidia.com>,
 <smitra@nvidia.com>, <ankita@nvidia.com>, <aniketa@nvidia.com>,
 <kwankhede@nvidia.com>, <targupta@nvidia.com>, <zhiwang@kernel.org>,
 "Nouveau" <nouveau-bounces@lists.freedesktop.org>
Subject: Re: [PATCH 1/5] drm/nouveau/nvkm: factor out
 r535_gsp_rpc_handle_reply()
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Zhi Wang" <zhiw@nvidia.com>, <nouveau@lists.freedesktop.org>
Content-Transfer-Encoding: quoted-printable
X-Mailer: aerc 0.20.1-0-g2ecb8770224a
References: <20250207175806.78051-1-zhiw@nvidia.com>
 <20250207175806.78051-2-zhiw@nvidia.com>
In-Reply-To: <20250207175806.78051-2-zhiw@nvidia.com>
X-ClientProxiedBy: TYCPR01CA0059.jpnprd01.prod.outlook.com
 (2603:1096:405:2::23) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|SN7PR12MB7228:EE_
X-MS-Office365-Filtering-Correlation-Id: 03b6d087-68d2-4ecd-c12b-08dd4b2f0181
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0; ARA:13230040|1800799024|376014|10070799003|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?T1FkcjVyK0pobHVmS0NHblJzODZZYlFaNFRiY1RCOUJhd085dDYxWDJWeTFT?=
 =?utf-8?B?U2duTlBwWU1QVjZvM2Y5UVVMUUlTZXFGRWkvNTlVVjdBSjV0aWorRWJnakFG?=
 =?utf-8?B?VHpqeERET3ZER1ZxalRUN1hxT2wzOWJiMGQwakNZMTNsR1dqUGRIT1c3R3FZ?=
 =?utf-8?B?Q2VtOE9PVENUUUl1YTJOWUdRenFhMjVNVndhODg1Qlc0MUwxNHZMbVAyMHVk?=
 =?utf-8?B?c1hqUi9CczZJUk15dW80eEZNRGRYOWZmNkJ0d0RrUis5THh2ckY2NXJPeFpI?=
 =?utf-8?B?clBDT05SZ2tSVXlYRzU0ZXcxV2w2NXFseWR0U2NGdHNJRXlURUp6bWtRYzIx?=
 =?utf-8?B?emxEc2t1cEZ0bVd5SjlPWHYxem1qTnFBVnlPa1B0N0NYUTA2dVpRejRIVWxx?=
 =?utf-8?B?c3Y3YXBqbDJOQVFqazcxTGhMdkRBQTVBcmdFK0EyaGgrbC9UK1BqUzlxZ0Jl?=
 =?utf-8?B?TjdKZk5MQjcvRDlmemw2eGlPQWluMVUydXBOQ1RLYVdCTm9QNENpWnM3aGd0?=
 =?utf-8?B?czBtcDhSNU04aFk1Q3NXU2lqUEx5bit1OEJKd2t4SkNtay9sMW1JUTNEUURh?=
 =?utf-8?B?THdOc2o4NVcyc3dQbTZLR3cwVFR3ZTdVK2wrNVp0aUUweDNXS1g3K0R6RFUz?=
 =?utf-8?B?aVlFWEo5UFUzZGZmOS8rSHNlSzg1VHlsYlpBSWxac3dHRnVrd2RQRWxka2VG?=
 =?utf-8?B?dVBzRCtWZlBtSzNVd1BIWWsyNVhFL25BNzk2YWdDNU9LWG5PaldaSWh2dUdH?=
 =?utf-8?B?YWxBQUhEOHNRc3ViTWhSVElIN21SWXEvRzdqdm9BdlFMSFVOUCtVbzZUNVR5?=
 =?utf-8?B?aFhLYjlRK2lQQ0ROOUhzTmNlZSs4QVdSVGhKMzJhYnVFRkdJYUh0dUcxS3pU?=
 =?utf-8?B?NDlXY01MWG5ObGh3Q2gvSm10K2FqTG1YL3BSZUpsMDFlc1NBNVhkN3lIMEVS?=
 =?utf-8?B?eEd0ZktyRDVjWUNzS0VYMmxoWVIxS2tPMjh0eWhuQncrbVNSK29UY3VZaUxu?=
 =?utf-8?B?Sm9ZS3ZUZU1SYVdpcllPYWNLQS9USHNmSmordW1hSEtJVjZiclhzOWNNRHhw?=
 =?utf-8?B?RmpMRWZlVkRmWFExZGNLTksxVnRhYjRaZlllWm9ONXNhaDFtWFV3QmpFVmFa?=
 =?utf-8?B?Ny8xR3IzMGpRNFJPODEyUTVMcTkxQlM3R3JkaVk5WDltZmovZkFzMGh2dlVV?=
 =?utf-8?B?QzUxeEFYeDY0eFV0eTNEbG1MZzZvTGdMaE93RWdYcFdsMjd6RDhoclVZZ3ZR?=
 =?utf-8?B?cW1vU25XZnptTWhZZ3pPdGNabUorQS95K1VnT1VoNTJZeFIwTmFzQ1BMeWVZ?=
 =?utf-8?B?ZjdzbnpZekN4REd2V0o3a2JVSnZNajVYeVF6QklvaGRlM0lCNlU3RmFVN01x?=
 =?utf-8?B?dkdHelVlajhmbXdadnkya0p4cXU5L1hjU21mTEdrb3gxeUlqbVl2dEpMdFlh?=
 =?utf-8?B?K2ZjbjRZZVY0NEorOG04TW5ONkhzWDEyMFl3Wm9hWmNseWxzSWZyVmNkR0Jq?=
 =?utf-8?B?NWZ4Y2VnU3ZZbjJvS3IzQzM5MG5aSHpaMkZhbGxNNWp1M1hyVHNEUkdwWTJO?=
 =?utf-8?B?UUVmWUoxWXdPTkNVZk5OVnJLbURPVjR4L081UThpaW12TVpaTVBUQXBhZ2tL?=
 =?utf-8?B?RjZlcVB0QXhUZFN3YkxmbG9BSlVBRHB1eDg5clRZMmdvRVZSbUg4dlhKa3J4?=
 =?utf-8?B?b1RSVllKMFQzT2Z2SGZ2NElYZjVHL0wrVmFieXM3WE85cklxRisvZUhKanVp?=
 =?utf-8?B?empmeE5SVkxLZTNRRytSOTRYdnkyYnRQUk41L3EwTmJxamZOZUlUNVpYa3c3?=
 =?utf-8?B?eUR1RVN0d05JbERGY3MvVVlkampLYnJHQ0NQeWhibVBNM0M1UGVnTjNzZllq?=
 =?utf-8?Q?f9nuRvMpRto9O?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(10070799003)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bkdpT3lVdCsrSkJIVG8wWERFWlZYaHk5NnVVbFRIdlZBS3FrQy9DQVZOVDBl?=
 =?utf-8?B?SHcxMEdlNjVWWkh3NTdqSWY4ZTFmbk12djhHbEhUYlAzNlhmSkxtSHZzK1o2?=
 =?utf-8?B?Q0NPdTZCK2tHYnNGbW90VWtaOHJ1M0NCR3JadzIvVldyVjFrQU81cERJVnlQ?=
 =?utf-8?B?M3Y5WHl1UEt4YVlrZElkTW1KSEEzbDJTVU9CbHFKV00wT1lIWUg5Nzl4eDdQ?=
 =?utf-8?B?TiszL1RVZEdueGpvNlNuKzhPSnlmaWVDQ2VqV2tuVWhtVWNkL2FmaTVINjdr?=
 =?utf-8?B?S2RrNCtwNkUwQVlBV2xOOGlZZTZQR2hkSmZqelBCR3FzUHI0eDZudHdxMFdn?=
 =?utf-8?B?OCsrWnpmMDJnWnB6c1NxcFBVUldvNjNSZ0lWOEhGWXpHR1BQSDJwMUtrM1BH?=
 =?utf-8?B?eTRiWVJsVWhoZnU4dFpRRGhHTmM5dnc3U2hLM2lKcWZLTWJtR1pPb3c2OXQ2?=
 =?utf-8?B?OUR1U2x6blJHRWxqMzFQekJGZzhkZ1YrUTZrYjVsUm1wTXFrVEtJTms3WUx6?=
 =?utf-8?B?SUtQRmtDNEd3VG92NlI2T05ORVZINnZYVVNEUDlwSDRqUVRiY0RPZVVvVjY2?=
 =?utf-8?B?WGU3eWlxYS9KWVhncW91bmNZT0EvNUZJcjFaYmcyakVlYm9Cdkl2ZGh6dVVY?=
 =?utf-8?B?OGNLejdKU2cxK1M4Q2tqa1JNSWMzdmVWUEV5OEoxTTJsTGtKbHllLzkwUDVk?=
 =?utf-8?B?Vy9aQVJSNFNWSWVMaGFuOHcvVkJjd1JvWmJjTlFVVjFoYW9mb2dpZHVKeHVh?=
 =?utf-8?B?ajFrMVl1eE1iRENxU1l1MkNLSEEyaTZQS2w1SjA0UmsxaldOS09TNW5EUXhC?=
 =?utf-8?B?V0RzVitzYmdPSml5Wnp1TFQzalFwRlBhL0VqVkphRk1hRk4rLy83OU9DL0Z2?=
 =?utf-8?B?cDBPd2ZCZzlPZ3E2ekx2NUxmRU5IaXZ0WmNSdkF0bHVsUzlrMjR1QjlZZUtI?=
 =?utf-8?B?eENGcThDQmZKOTdJNVhoZTNYNkE4RWJiQ043S1hHektuaXZ2U0gxR1ZScDRZ?=
 =?utf-8?B?NHlwYmlsN045NG9VQ2wzWEtGMktBdG1Uc09FMUV0bFIwd1IzekdjcGdjcld2?=
 =?utf-8?B?ck0wTXFBRTAzSmUvdGdNcUZjb3NGZ0hrSXNVeHVsK3dMQXhVcStTdDRUSms2?=
 =?utf-8?B?VWJjOW1JQ25aSWhRbEJjem5jMCs2dGJ1UFhwQUhEM3V3ZXlhZk9kcExJYkZn?=
 =?utf-8?B?Nk5PZWtqVVBtOUZPZ0J0a0JTQXhldE9sTEEvN01QQkc5d2hiWGdvODVPeUNk?=
 =?utf-8?B?aTczV21zUkVrQlVKN1RlQ2VHQUx0aE56TmIrbXNEWFE4SzEzaGJTZnY3anZx?=
 =?utf-8?B?NVlYcFU4dVYxc013OFpYK3kvZlJETWxxMXRqK2tCNmwyOHpySlBQck1mMGt0?=
 =?utf-8?B?SXlnQzdKcXlXQmZqOGY3dExFM002clU3RGZrL3IzK0VvSERyT0dOY3R5bXYv?=
 =?utf-8?B?dlU2anBsK0VINHJoOThoekdtTVFIdzlubExvWVVQYWZtbEFLREt1N3VzNUVK?=
 =?utf-8?B?TWxzZXZJSjVtSzJTL1hlR2FmOTJpS296MFU4UUJqd0VmcEl5bzRSeWZuYVRs?=
 =?utf-8?B?N2pBaUZMREpGbExTN1ZQMFRHTUQrVllyTFNpSnZ1cHJYQmoyRktKMXZXaFdH?=
 =?utf-8?B?MDN3MS9uZSszVlpPWHBWbmtUT2RaQW9sN1h1U2x2UWlJL1ljRDRiaElqaVdq?=
 =?utf-8?B?Y2d5M1J6d2JNRFhBSjkyMzZOWCsvVk41cURjVjIybzAyKzM5MjgzK0NxT0FU?=
 =?utf-8?B?aDJsVGRsY2hIQ1BTZEEveUx4cGxLRVlUMUVuSzc4SVp2UVBmKzlVVzlKcW9Q?=
 =?utf-8?B?aUxtQ3BJaWoyUWhZWFRvZFZUM2MxemNJZ3Q3UUZ2ZTVrSkNKZklLMHRYN2l5?=
 =?utf-8?B?cEFwN1ZhQjAxL3ZPREltQ1M0NUcxcnJSTXk5YkRIaHJKR2xrSjNPVk9DYkdz?=
 =?utf-8?B?L3ZCdnk5ZXVmZm1DbUlwRVRFd0xrcjlXcWhNQ01NM1IvNS9TTkJOWnMxeTV2?=
 =?utf-8?B?NnIyeWJjYzRxeCtEdjFRb3FmSzMvRThKTnVaUVFwWDgwNmt5UHNqeGJGcFdR?=
 =?utf-8?B?TzNlWXVETXQrZHNvcGdUYTZoV2pzak1kaVRlOW0xZWZTMlZGNitIOUs2cHZ4?=
 =?utf-8?B?WWszVmVVcTBqMkJVUVdldklkNEVHUFN2SkZEOU94bUxMNXl6YytYMXRGcnAr?=
 =?utf-8?Q?PNwsqfhzRNdRoyJ/TdNqhYYCwQPmrfTFbvNjyMqDQm/X?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 03b6d087-68d2-4ecd-c12b-08dd4b2f0181
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Feb 2025 06:32:25.1797 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lvtFHqIi5gBQvUDkAilb3lNFF1LJKkXC/OHK8VgnoplfLE5ZJcPSO3X/LQRv/U4voipOxJN8XF21wOEjZclHGg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7228
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

Hi Zhi,

On Sat Feb 8, 2025 at 2:58 AM JST, Zhi Wang wrote:
> There can be multiple cases of handling the GSP RPC messages, which are
> the reply of GSP RPC commands according to the requirement of the
> callers and the nature of the GSP RPC commands.
>
> To support all cases, first, centralize the handling of the reply in a
> single function. Factor out r535_gsp_rpc_handle_reply().
>
> No functional change is intended for small GSP RPC commands. For large GS=
P
> commands, the caller decides the policy of how to handle the returned GSP
> RPC message.
>
> Signed-off-by: Zhi Wang <zhiw@nvidia.com>
> ---
>  .../gpu/drm/nouveau/nvkm/subdev/gsp/r535.c    | 48 +++++++++----------
>  1 file changed, 24 insertions(+), 24 deletions(-)
>
> diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c b/drivers/gpu=
/drm/nouveau/nvkm/subdev/gsp/r535.c
> index 2075cad63805..1ed7d5624a56 100644
> --- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c
> +++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c
> @@ -583,14 +583,30 @@ r535_gsp_rpc_poll(struct nvkm_gsp *gsp, u32 fn)
>  	return 0;
>  }
> =20
> +static void *
> +r535_gsp_rpc_handle_reply(struct nvkm_gsp *gsp, u32 fn, bool wait,
> +			  u32 gsp_rpc_len)
> +{
> +	struct nvfw_gsp_rpc *msg;
> +	void *repv =3D NULL;
> +
> +	if (wait) {
> +		msg =3D r535_gsp_msg_recv(gsp, fn, gsp_rpc_len);
> +		if (!IS_ERR_OR_NULL(msg))
> +			repv =3D msg->data;
> +		else
> +			repv =3D msg;
> +	}
> +
> +	return repv;
> +}
> +
>  static void *
>  r535_gsp_rpc_send(struct nvkm_gsp *gsp, void *payload, bool wait,
>  		  u32 gsp_rpc_len)
>  {
>  	struct nvfw_gsp_rpc *rpc =3D to_gsp_hdr(payload, rpc);
> -	struct nvfw_gsp_rpc *msg;
> -	u32 fn =3D rpc->function;
> -	void *repv =3D NULL;
> +	u32 function =3D rpc->function;

Is it necessary to rename 'fn' here? You don't do it in
r535_gsp_rpc_push()...

>  	int ret;
> =20
>  	if (gsp->subdev.debug >=3D NV_DBG_TRACE) {
> @@ -604,15 +620,7 @@ r535_gsp_rpc_send(struct nvkm_gsp *gsp, void *payloa=
d, bool wait,
>  	if (ret)
>  		return ERR_PTR(ret);
> =20
> -	if (wait) {
> -		msg =3D r535_gsp_msg_recv(gsp, fn, gsp_rpc_len);
> -		if (!IS_ERR_OR_NULL(msg))
> -			repv =3D msg->data;
> -		else
> -			repv =3D msg;
> -	}
> -
> -	return repv;
> +	return r535_gsp_rpc_handle_reply(gsp, function, wait, gsp_rpc_len);
>  }
> =20
>  static void
> @@ -996,18 +1004,10 @@ r535_gsp_rpc_push(struct nvkm_gsp *gsp, void *payl=
oad, bool wait,
>  		}
> =20
>  		/* Wait for reply. */
> -		rpc =3D r535_gsp_msg_recv(gsp, fn, payload_size +
> -					sizeof(*rpc));
> -		if (!IS_ERR_OR_NULL(rpc)) {
> -			if (wait) {
> -				repv =3D rpc->data;
> -			} else {
> -				nvkm_gsp_rpc_done(gsp, rpc);
> -				repv =3D NULL;
> -			}
> -		} else {
> -			repv =3D wait ? rpc : NULL;
> -		}
> +		repv =3D r535_gsp_rpc_handle_reply(gsp, fn, wait, payload_size +
> +						 sizeof(*rpc));
> +		if (IS_ERR_OR_NULL(repv))
> +			repv =3D wait ? repv : NULL;

I'm not familiar with this code, so maybe that's nothing, but is it ok
to drop the call to nvkm_gsp_rpc_done() that was done in the original
code if wait =3D=3D false?

