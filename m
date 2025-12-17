Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 13802CC63B8
	for <lists+nouveau@lfdr.de>; Wed, 17 Dec 2025 07:24:08 +0100 (CET)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id C6C4210EB85;
	Wed, 17 Dec 2025 06:24:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="R2WAQYLa";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id A6BC545617;
	Wed, 17 Dec 2025 06:16:37 +0000 (UTC)
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1765952197;
 b=tMs/PAWAvGN8ydz80Nr4kOFoGJ8Hd9Mshm6WauobxuThTZqHRDAIDjvMA2i+Y9+qQHUqc
 ZzW3SwYFddt4C5nv563e+pLmKf55fIYce0CXhMm3Oh6IzC06tBQGepzGzl/FMKSQTZb69Jk
 i6/aEtCYNeKyHBiWwXhtSR+ohK8tzah1SstecfHo821EiUWEsAPDrHPXUaJgfoOn7jWg85N
 rVwQ8kQyPNMLqZQR7byYUVRTuGIIz5ofmAfqv+Vl522ETSd3WUhvemghLiC4CMy0ClCor3B
 hyBHWjZict4wLNmisIB2usqsPoztgq0i8WZ0UNlZ5t/odnvtXP5HN+jO5aLw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1765952197; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=s2L+0e1slxOnN2a88578zW9X9aQTnap7I8EqOM5eZYY=;
 b=SS+oYArXoYDxy6uvgqtX2qt2iqDANE+AAHT1REk42AgmKM6WHIpnBc3d9qlxpYy7k0Jmu
 WzTac3PJajdMr2SUwNKsRO8WoaoWdDopRFGccFk98jjOfj1bs0eGgJWBxoRU3ta1sMfTaXQ
 ensHcQKWO/aR3p8oj0Uz1rfpzTXKxvlpiUyhT+28JmoqpqrUpV8rZcycpkLFZ6ET8xhxBg6
 j9fbt9aYfROX5YFcXVBoAoMX7zpLzqoZHr/zJUTgXPqLZ1/aCwfkv+LauWZca0rxyLz+YBD
 y3FofzaK7CcyMC6whQajxrmkwTO8j1tBJ8Ak5rG/Bf1s7oMbkQE3Ybvk9MvQ==
ARC-Authentication-Results: i=2; mail.freedesktop.org;
 dkim=pass header.d=Nvidia.com;
  arc=pass;
  dmarc=pass (Used From Domain Record) header.from=nvidia.com
 policy.dmarc=reject
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=Nvidia.com;
 arc=pass;
 dmarc=pass (Used From Domain Record) header.from=nvidia.com policy.dmarc=reject
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id 66464454F7;
	Wed, 17 Dec 2025 06:16:19 +0000 (UTC)
Received: from BL2PR02CU003.outbound.protection.outlook.com
 (mail-eastusazon11011006.outbound.protection.outlook.com [52.101.52.6])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 0391F10E197;
	Wed, 17 Dec 2025 06:23:46 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Fipdbuwwxff059Q7JyG+7KS/8XK7ysDwjCkgkRe1u3HziM99+nwfb08QawznN44OOyf5f7jF6pVPe7cZTHmjK1Bgva6+tglD0fDFJ/+zPboV3I5Cw917yE2KQjGoMYFQ6MHRtIT8Cc6Uh1l6cEmIb7Vv1zdga+r/rbBITezshyqCILWNMVsLh6VQajhDCCcAAsr8LX3lrcgUrjjNm+IQlq9u+eJD9KtiiEy8mkyrDrz9b3f2U4gqavGGXecJGDEdeeE8YnmjBFwydCqtV63p5/CX8L5ZODvMUtq0EEfeJ1e9ZsFZFZRE7z3/dGVCJT36WjDIyuvlsj/9HI1lPBT50w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=s2L+0e1slxOnN2a88578zW9X9aQTnap7I8EqOM5eZYY=;
 b=sjSqQBz52o03lB/KyIYB1SPf8Q0VzSFfHHV+ubo1K/lIzK1edIw8U1S/hzocNZJjmlR+UbM+zI+iyXuQwHuU3HzKPWJAFs176uy8KbtZt7gMtjBKjHsfvk8aaWwAaCQrebTKUHzuLGFD4Uo0sFK4vHA2hkowzm/5cG/qJhqadFQtZ77W7axzFBRc1Q3MGiwtIQsPthFVJ687TlDErKzETP9x3ofF96WvK07qZExiJNXPXXWv40Fe/iCelt6KMvakuAr5MOHWIgi3WwHe5FETFR1UU0brtmWWt9+xsWGLzAhal5Bi2Gwdk7Znq++qV1Kfj6LFXnQGLukqIyz9+MhGew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=s2L+0e1slxOnN2a88578zW9X9aQTnap7I8EqOM5eZYY=;
 b=R2WAQYLaBLMN8j3PkRUByZdSdQmNlYP/JXNakZaYZNDsVqBHNZGcBW8uZ5CY0d8UBtcpf+In37hpq9uf4hQ1lv+zvZsmiCwbmBt9I76K0sk65impeTOtlBhElX1VtIIBT34G+p27AyK8YL/WUDets6leFGxNELTYhE8Q4Y/SkQlrUS/3p9ALlffUeIwsKEF2wRrlcaWtudOvcR/zswXAd+D+VzK+mPUZM2hc93kyRz6NTcUn0/4RwIrDIRa2Q+5upNRX75aNiIlpLWO8uUXAxkTr1Ov+bsTTorgxYJo9M/KI4Sl2sY6KhbZUZl9GGeMwpAw9TzvC/ANC2CNhoM85xQ==
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by IA0PPF95ABFC125.namprd12.prod.outlook.com (2603:10b6:20f:fc04::bdb) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.6; Wed, 17 Dec
 2025 06:23:44 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9434.001; Wed, 17 Dec 2025
 06:23:37 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 17 Dec 2025 15:23:33 +0900
Message-Id: <DF09YET9UFY1.209KXGTYK2485@nvidia.com>
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Timur Tabi" <ttabi@nvidia.com>, "Alexandre Courbot"
 <acourbot@nvidia.com>, "Joel Fernandes" <joelagnelf@nvidia.com>, "John
 Hubbard" <jhubbard@nvidia.com>, "Danilo Krummrich" <dakr@kernel.org>,
 "Lyude Paul" <lyude@redhat.com>, <nouveau@lists.freedesktop.org>,
 <rust-for-linux@vger.kernel.org>
Subject: Re: [PATCH v3 03/12] gpu: nova-core: support header parsing on
 Turing/GA100
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20251208231801.1786803-1-ttabi@nvidia.com>
 <20251208231801.1786803-4-ttabi@nvidia.com>
In-Reply-To: <20251208231801.1786803-4-ttabi@nvidia.com>
X-ClientProxiedBy: TYCP286CA0035.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:29d::8) To MN2PR12MB3997.namprd12.prod.outlook.com
 (2603:10b6:208:161::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|IA0PPF95ABFC125:EE_
X-MS-Office365-Filtering-Correlation-Id: af567642-f139-404c-e796-08de3d34cfb7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|10070799003;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?ZGFURHkveEFxdmZDWTdSOENNQ1VXclNPK3VtQUwyeVZia3UzSFBoNXFjcGlW?=
 =?utf-8?B?RlNnWmwxUVp4bzRyNkdPY3B3b1huZHI3Rys3eDVlaGlUSFdZV202RWZXQmhM?=
 =?utf-8?B?WUd3aEV4cmVCZmthTFpqRVdtL0lwaXg0aHBRcFNXeGJibHJFcDhYZ21SeHk4?=
 =?utf-8?B?NjlncG5vcGRoZmtKd2J0WTdxazZvQ3JCZGUwM3M5c0ZwTk5KUktsRlh3MG1M?=
 =?utf-8?B?MEpZaVJXa3pvQ3RXRmdDb3g3THpJckFUT1dKeGVHSEZWTTZiR3VwOTFQWGdH?=
 =?utf-8?B?UnQrb1BYajZjaVorb2lsVFZwV1p2ZkVXS3RnNmJYVjRqOVd2dmpoUjkxbjJG?=
 =?utf-8?B?VU5sUXg1SFdKTCt6dU9QblV5Vjk3cXpiaC8zcGIzSC9RZlNTanVQdm0waWVj?=
 =?utf-8?B?OU5DelZWeHVlTXAxNXpIYjdzMklkbmZvcnJZck1IMFJodDZIc1lKNUFhNWZT?=
 =?utf-8?B?MXFYU0VFdnp6S3VBeG1ybWRlVVdQaHRjdzRvQTdXZk85Z3pzTmNoNDkrdERY?=
 =?utf-8?B?YVVhMWRXZzJZdXJtZ3J3SUMxQWIrZkhvaVlrZkZWTUFueEJjUm5zWjcyQ0x6?=
 =?utf-8?B?Y0dodmg4eDZma0QydGZWZ0U4WGpNNE1vV0lnQWJRMENRT2FZdmdneHVyVGRJ?=
 =?utf-8?B?NTY4a1FoMVBVSjA4M2xCQ1VLNGxWM1o4TWpmVlMxVW9WWnRJaWUwK2NqeU9l?=
 =?utf-8?B?YUFtM3plOEFpRCt3ejhSYjN4QlNCM1oxZmZ2WG5vemIxazJBeklyTXBMWUsx?=
 =?utf-8?B?QUxTaWtuQm9Fem1wU0FMeXhQNFBmYVpLUG9aWFBMY21ERisvMXRQUVdMSnpn?=
 =?utf-8?B?TS9rOW1lY3VtZkd0V20yVENwTkUvUlBxOThzd1dhR1p6QlNORFlEM3kyaXBY?=
 =?utf-8?B?aytSK25SQmNBSFNmYzZhYndRdjhJaFdwdzhZeVJtekxCZWd4MW9zOEdXZjFH?=
 =?utf-8?B?cHRJemZlZURFZStvM3lCRFBKVU9MNGJpWGxYUjNpbS9wY0RXM0U1TUpmenBM?=
 =?utf-8?B?OHFHakhHQVgreXhCeWJsT0RuRjBVbDlKczJhb3Z2Q0diRTNJa1pHbXF1SXhv?=
 =?utf-8?B?UHZzTHJaYlZHckNqclJ6RS9zRnJkaVlDcVgwQ2JJN056UkhIVG1vZktSQnAz?=
 =?utf-8?B?YmpNSU9vM2thMk0yZjQ4WXFHNGtTQUFtVTRoOFE4VkY1NWlvaEV0SE5MWlNx?=
 =?utf-8?B?TDdJVHR3SWVzbkpPYmR3b3FYVzN1Uk40V3EwY1JoSVY1aU41My9PSUFGMFk0?=
 =?utf-8?B?eFEweTN5UDJwbFhLSXUvNldXUWhWWFpSajQyMWg0aEppdENNaEpSUnV3N1ps?=
 =?utf-8?B?TEZ6VFlpdHJSN000cG5id3VwYk1tV3hkSS9WemhnMUJvS21TN3pwYU5zS2tm?=
 =?utf-8?B?elpYajZHTUdsdzFTQ3M5YXBDRjJhSWs4Wk0za3Zoc1FPeTQ5T2VNaGxkN2FW?=
 =?utf-8?B?d2dkcC9aRW9Cb2ZjOVh0NHRucFV3RGkvQlZLcEllaUhTTmNlaDI5azZ3dnZH?=
 =?utf-8?B?c0luakIxS3YvZG5JNitjRXRyaWJWNWdsVWM1aUxqQlhkM1kwT012a0lidkxm?=
 =?utf-8?B?Rk1LS3hqQlV3OFFjMUpxZFFxZm5POHFRdkFONEozbGROa3RsaEpaWUFjaUk2?=
 =?utf-8?B?SXpLTytMVkh6bENmeXg1WUltUTg1S21oQ2NQTjA2WGFuVGFZeDNEU0RYYmd6?=
 =?utf-8?B?SDRKVE9kSkEyclU1SE1FU29EWjg2dTFiWnF3TS9QUyt1MnA3VzYxYVNLc21l?=
 =?utf-8?B?V3FRNHhsNXgzYWRtV2tmWmwybUp1eERvcmYxOVFJS0pBT1pkUW5nQjBKZ08r?=
 =?utf-8?B?NnEraU84MEVkYUVIckd3dGU0U0VWeVlhRUg2aUVGMnlSakZjSlc4dW9EWHFE?=
 =?utf-8?B?bWN3SDY4UUlSMERuMUxkNWlMS1FLK1NQbUVKaVVFTkxZYTNLMmc1dUpBYW9n?=
 =?utf-8?Q?2a1kvbtdqGs4CvlHEcqpcEOdXz1/m37R?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(10070799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?Z0tMaVVURnQveW1uVEFOM2xTUG5xMEJsMHNjK3FYRkhzZHBkb1A2bFd4Yzlp?=
 =?utf-8?B?YWxqVFEwL24vODhGNXlMQTlhS0xRLzJ4dU1rQjcxNWNiVkZabDZWYWtHcUhi?=
 =?utf-8?B?RGJOUDN6SWZaR0RDNlhJc2FaY1BsSEJGVzVBdFFjenNqaXB3TSs1SW5xK2xu?=
 =?utf-8?B?UGxLZ0N0SkJzdlVzY1I1YnZYU1pRWFRTUnRodDZmeEtkYmdNYkpocEdxU0Y3?=
 =?utf-8?B?dDdRYktPaFNvY3VWMGJodnhzejJUN2x6cElGNEFmWXl0TThSV2poYjZSRU5H?=
 =?utf-8?B?STdJT2czNnZtOUNoYmgrTngycVdRWFRUT3pHWVVvR3pRQWxNVWpWSzdKNTlN?=
 =?utf-8?B?MXk4SmlqWTNQY08yaHVnam9reGVydGhRWEF5MGtWbHJyNTlOUjVzZ2dFeTM3?=
 =?utf-8?B?MDRiekRLTGFIcGV1K3FVWjJ4SENHRDFJUmNJZmU5ZWJOWjdyRE12eWRvYWZs?=
 =?utf-8?B?N0VZY3dhcjZVcWtXaVd1VGxsUzJGRnlHVGQ0ZG1MT2ZlOFhRNUphNGdLZUYx?=
 =?utf-8?B?aVpIeTNFZHd3Yys0aEVkN2YzeUc0Unc1YmJSUGxsZGtNM2FtUTJCc0VGODZY?=
 =?utf-8?B?WVcwZy9vcFMyUzFMb2RwUTdkVVNuWFpTenRTYXF3M2ZPa1I5MnBESTlOV2Uv?=
 =?utf-8?B?QzdLZ0JsZVFuczB4MExSSmZBdW14cU9tSWExYmJ4cU45a3lZeERPQm5yUjRm?=
 =?utf-8?B?SFcwbjBvcy9qOXBEVktRQ1JxNXdlQTI0UklHYzJkZWdCeW50Um5MLy9ZVDZZ?=
 =?utf-8?B?Z2dZV3NVN3NrTG9zQkdWbHdyV0FzS1lLeU1iTkcvdHRZelREV0ZDa0JNWlJv?=
 =?utf-8?B?R29VcElMV2xoNkNyS0hGVTUrMmkwZmkxL3BNVUlIOGo2d3lCR1BNYkxBWUgx?=
 =?utf-8?B?RjZtWU5ycXZyeTNJRmRSd1FjVFp6US9SRkcrVGJ3V1pUTy9MakxKcUZScFdj?=
 =?utf-8?B?VXFOU1c3QmpQd05HSzVLKy9HN1JMQkx3N0thYjEzdXJ3bHZYUmROSTZQZzJr?=
 =?utf-8?B?cXNZNC82UllVTjBvU3ZuQmdTQnVTWTdMWjN6bHJGNHd0eHZvSGZsbXM0QXNL?=
 =?utf-8?B?TFFpYXdOaWxndW82cG83L3ZYNmJINXM4NWl3ZVlGYXNBUzNYSjVORS9mTEZS?=
 =?utf-8?B?Wm9aR2NPakdvY3FHYkt4ZDVjRDhDRjhVRTIxRFdDUXI1WGRTTnBBRkZGRkZo?=
 =?utf-8?B?TjZGMlBlemEwV3hibFpzMnJpeERHaHdKaTJyakpVdmE2dkU3VXRxQUYzeDBa?=
 =?utf-8?B?VzFTMlVxdkdaVTJuSHJQclkzbC9lNG84SGNBaXh3RVdmcXBwVmNkMXdNbnR5?=
 =?utf-8?B?TTllTFYycmJ0L0tmWjMyUG5JN2o4K2dQSG5CQjJENHQrQTREbHd6SXVGem5U?=
 =?utf-8?B?U1AvbGF6MG1lYnU2T2VrcDZkdUpEcTBmb1JOdm93RUR2MHZYOG84WnN3NzNP?=
 =?utf-8?B?b0QxRGp5d3ZXb211V3ErV2VPTzBqZlozQUorTUFNUU1rcWZhSkVGRTZCZVcr?=
 =?utf-8?B?RlFIQ2ZHaWxFaVNURndQRHpuTGFnOGNwbElvZ0N0SHZQbmkrczA0ZHlndWMv?=
 =?utf-8?B?ZnhsMjA4RFhuYUpjWXZKNnFGWDlyNW9iNEpua1JnOS9IZFR0YXV0TVM2MU8z?=
 =?utf-8?B?OXk3NVMvd1lkK21Sai94UHdWTHBWSlEyL3d3blN2TWhxcERDSzZjZkFtU1ZX?=
 =?utf-8?B?ZHhpSG91a2YxbndvVlZkKzVJQjQrSU1OeXd1TGFGcmVldzR6N1lJU1dKNTJX?=
 =?utf-8?B?MUJ5SlY5UU1Ed2EvTnZ1MkNrZHFrdHB2a0RFbWNMQnRmTHVpeTJSVXN0bXpN?=
 =?utf-8?B?Q1hPUUJNOEhYakszYTUvS3JQSkcyV2RUNjlWYk10K21NOXZjQWQ4LzJOUXZr?=
 =?utf-8?B?cStSVFpodXA0cHBFSmx1MDA0NWZHTUZjODhSbXd6dmNxYUQ1TmFxM20rNUFC?=
 =?utf-8?B?YTFRNmdqeTVQcGlPWjIrZVQrL203TW9TOEVSQkd4REpUaEU5RmI0UkpBcGIr?=
 =?utf-8?B?dVdSdE1CTm9wNG1RMHJFMkhnZnVIWkREMFpPbUhCTTZaaVdXNnR4VStZT0Fx?=
 =?utf-8?B?bWpMTjBrSkhsb1g4S3A1blpRenJTNE41b212SGttNWtyVjY1Y1FoQUVxek81?=
 =?utf-8?B?Yzg2VHNaL0hnT2cybHZoa2VraUZLUFJnQjFZdi95Zk1MTHJJdE5rSWxIdzhK?=
 =?utf-8?Q?9Rx91UIaPayRBiT/9/XhULfGHiF9RhM7nkQlMeMfmH6v?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 af567642-f139-404c-e796-08de3d34cfb7
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3997.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Dec 2025 06:23:37.6943
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 +ZMtXm2olsLeFGvwQLq6ut3DmgL9rKF1BLSuuCRuOuP61hE7YD3brrxlf2x6oaEn4ETk1bpepOT/cuHblekcIA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PPF95ABFC125
Message-ID-Hash: XJVF45CFGPMVN5RQO5VIYN5UGSTRQR3I
X-Message-ID-Hash: XJVF45CFGPMVN5RQO5VIYN5UGSTRQR3I
X-MailFrom: acourbot@nvidia.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation
CC: Nouveau <nouveau-bounces@lists.freedesktop.org>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/XJVF45CFGPMVN5RQO5VIYN5UGSTRQR3I/>
Archived-At: 
 <https://lore.freedesktop.org/DF09YET9UFY1.209KXGTYK2485@nvidia.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On Tue Dec 9, 2025 at 8:17 AM JST, Timur Tabi wrote:
> The Turing/GA100 version of Booter is slightly different from the
> GA102+ version.  The headers are the same, but different fields of
> the headers are used to identify the IMEM section.  In addition,
> there is an NMEM section on Turing/GA100.
>
> Signed-off-by: Timur Tabi <ttabi@nvidia.com>
> ---
>  drivers/gpu/nova-core/firmware/booter.rs | 33 +++++++++++++++++++-----
>  1 file changed, 26 insertions(+), 7 deletions(-)
>
> diff --git a/drivers/gpu/nova-core/firmware/booter.rs b/drivers/gpu/nova-=
core/firmware/booter.rs
> index 1b98bb47424c..7ceea7cc9a87 100644
> --- a/drivers/gpu/nova-core/firmware/booter.rs
> +++ b/drivers/gpu/nova-core/firmware/booter.rs
> @@ -356,14 +356,27 @@ pub(crate) fn new(
>              }
>          };
> =20
> +        // There are two versions of Booter, one for Turing/GA100, and a=
nother for
> +        // GA102+.  The extraction of the IMEM sections differs between =
the two
> +        // versions.  Unfortunately, the file names are the same, and th=
e headers
> +        // don't indicate the versions.  The only way to differentiate i=
s by the Chipset.
> +

This comment begs for some code following it, and I notice that below
the same `if chipset > Chipset::GA100` test is repeated twice.

How about doing the following:

  let (imem_dst_start, imem_ns_load_target) =3D if chipset <=3D Chipset::GA=
100 {
      (app0.offset, Some(FalconLoadTarget {
        ...
      }))
  } else {
      (0, None)
  }

... and using the local variables to initialize the result?

That way the code relevant to the comment immediately follows it, you do
the test only once, and the complex initializer below becomes a bit
simpler.

>          Ok(Self {
> -            imem_sec_load_target: FalconLoadTarget {
> -                src_start: app0.offset,
> -                dst_start: 0,
> -                len: app0.len,
> +            imem_sec_load_target:
> +                FalconLoadTarget {
> +                    src_start: app0.offset,
> +                    dst_start: if chipset > Chipset::GA100 { 0 } else { =
app0.offset },
> +                    len: app0.len,
> +                },
> +            imem_ns_load_target: if chipset > Chipset::GA100 {
> +                None
> +            } else {
> +                Some(FalconLoadTarget {
> +                    src_start: 0,
> +                    dst_start: load_hdr.os_code_offset,
> +                    len: load_hdr.os_code_size,
> +                })
>              },
> -            // Exists only in the booter image for Turing and GA100
> -            imem_ns_load_target: None,
>              dmem_load_target: FalconLoadTarget {
>                  src_start: load_hdr.os_data_offset,
>                  dst_start: 0,
> @@ -393,7 +406,13 @@ fn brom_params(&self) -> FalconBromParams {
>      }
> =20
>      fn boot_addr(&self) -> u32 {
> -        self.imem_sec_load_target.src_start
> +        if let Some(ns_target) =3D &self.imem_ns_load_target {
> +            // Turing and GA100 - use non-secure load target

This comment is confusing - the logic is clear and doesn't mention the
chipset, so let's remove it. Ideally we can limit these chipset-specific
things to a single place and a single comment.

> +            ns_target.dst_start
> +        } else {
> +            // GA102 and later - use secure load target

Same here, the code is explicit enough and doesn't mention the chipset.

> +            self.imem_sec_load_target.src_start
> +        }
>      }
>  }
> =20

