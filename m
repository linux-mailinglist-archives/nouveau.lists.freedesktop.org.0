Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E693C6CA20
	for <lists+nouveau@lfdr.de>; Wed, 19 Nov 2025 04:36:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6087710E561;
	Wed, 19 Nov 2025 03:36:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="Ux5sHT+i";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from SN4PR2101CU001.outbound.protection.outlook.com
 (mail-southcentralusazon11012057.outbound.protection.outlook.com
 [40.93.195.57])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE6D010E560;
 Wed, 19 Nov 2025 03:36:37 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FmDqjf9RXxAbcJbTG2yzK3gx8tWJm96KIH0awl6xQE5NCgvzvdPdwPOR1nYgS9Z4hSdFx2ouv9cD9K4T4h4O98K6kU2M5sinihbib8visMCT5Muz68zUT6x3c0HH02mWmMLWRpv51CMh4L18Jp5UsLCkdDpr1U7+u/Ph//TrtUu2A7qajbfpAhjOI/bKMEA3CEKTXcZ1ojbeVCe6YiJPigJooDWj4kpJgmklcVj8pSs5/ofiZyANsjKdj6t321ve7anXYm8R/96zD1JNTMdvlefiDzCDSa4l7/F+p0UQOTv6u2tP17NPHmLLi0q+prm39dclkW9gYouLNCZDZyue6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=exoAHowWNjxQcdvlnL86txlpcxfk6E4sDgRj95ksdZg=;
 b=ObNcpPsm000sce6uHIwZN6asP0rN+x0S4/ILgl1DGKt7CwA2k4eo6ISV8QpdC4NySniw2H6mTriS5TS6Jkt97YS6+mzvAWLT1abSFJGiEMwCvbmOLZd8vSzJT4f04OzAzXnNyGcuekmjMl68L+nX6gbz0HivzEm25u7nozigWPHufbbrVxr2Br+6UOFbhFRkzrhWUq9VgTBI9XLedNI91vwagzXebjQ49AVCn7PGbXb0/YBkV9dAyH9q3TYoQbxgrwGRDyxEMc/HGAZulZ2V5tHgc3ESm4Q9+yoM9jglafFGNr/v3hs9OAUgyAKU9utW6ITcgzmElVbiTGNTg8pHhg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=exoAHowWNjxQcdvlnL86txlpcxfk6E4sDgRj95ksdZg=;
 b=Ux5sHT+iq6WY/c37AfwzHcVbQA61JZj20gRZmH5lMfCaHMga0NKNyvaS+lWLkJdZqABqonn2zoQQiPA7VLICCvBqVUrTlSkzZnWqW6jWv+Lx+0EojgR22stp4lmZRKmsiNbijsOrO0sKX7KcdDnsGVaV98qs6bjKZtXCORT/uQgZaQDegFiWE7PSWdWpT5srxxuBCrT4lKVTtByhtilMiBbdqgl590u4VtdtLz6GGU3b5LGxA1pXIMQEEwUGjJ8BlmoKnYJLlq0QFyESY1YxKmr8bzShcR2dqfOfOhoRQHFb4Os2lg3ZtV8JHjOscc9Ht4XeR3lO3kSLDGixNDKxYQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by DS0PR12MB7558.namprd12.prod.outlook.com (2603:10b6:8:133::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.22; Wed, 19 Nov
 2025 03:36:33 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9343.009; Wed, 19 Nov 2025
 03:36:33 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 19 Nov 2025 12:36:29 +0900
Message-Id: <DECCV8XB5U56.1NBFD1KFJ59LU@nvidia.com>
To: "Timur Tabi" <ttabi@nvidia.com>, "Danilo Krummrich" <dakr@kernel.org>,
 "Lyude Paul" <lyude@redhat.com>, "Alexandre Courbot" <acourbot@nvidia.com>,
 "John Hubbard" <jhubbard@nvidia.com>, <nouveau@lists.freedesktop.org>,
 <rust-for-linux@vger.kernel.org>, "Joel Fernandes" <joelagnelf@nvidia.com>
Cc: "Nouveau" <nouveau-bounces@lists.freedesktop.org>
Subject: Re: [PATCH 10/11] gpu: nova-core: LibosMemoryRegionInitArgument
 size must be page aligned
From: "Alexandre Courbot" <acourbot@nvidia.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20251114233045.2512853-1-ttabi@nvidia.com>
 <20251114233045.2512853-11-ttabi@nvidia.com>
In-Reply-To: <20251114233045.2512853-11-ttabi@nvidia.com>
X-ClientProxiedBy: OSTP286CA0001.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:604:223::9) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|DS0PR12MB7558:EE_
X-MS-Office365-Filtering-Correlation-Id: 92bcc140-162b-44bc-7bdd-08de271cd5ab
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0; ARA:13230040|376014|10070799003|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?RlhjV3EwelBFQ0MvUFBjcHRqU0ZJZjdpVEVpNC9yZ0tiWEo5UkplZUZTczY0?=
 =?utf-8?B?T1M5cnl3VHpkaStYNnBkUHVJVWhtNlV5amlKdnZmWm8za2F6dHpTNWF2QlhR?=
 =?utf-8?B?Z0VvdEp0NmtYbzRxbUQ3bEcveHRWMjQ3NTBpQm1qVUljeEJOMjBhb3ROTnFL?=
 =?utf-8?B?UGpBODY3cUpHc3M0MWNFUVFmNU84MHdxQm5hbzJHWVRqckZaVWRiU2MzUEpi?=
 =?utf-8?B?MXhucWRsRVRPQW1VZ09uZWd0TGFTR2VpSEdaR0NJamZxMTNvWHhNM0J5Vlkv?=
 =?utf-8?B?QWRwMFFkSjJvWm9tNVlQZ3dkd0NLZlVUWm9GeWJ6bTFYcUhUQzc0N3htR2ZG?=
 =?utf-8?B?REoyYkEvNVJGakk5WG9YODVSYThlM01ZNk9mRC9hd3hLSWpiQXV5SlgyQWNt?=
 =?utf-8?B?cWJMUTFXSDNRdGRrQ25xeDM3R0xnNkthRjlXZjVhOTIvelJjYXREUEFTbnpt?=
 =?utf-8?B?cGJ3WDc3TllXSjMyR0xZWFRwdmw5ek1XdFk2RTIvdFFnMVA2OXlvNlNxcWNS?=
 =?utf-8?B?NnFWVGF3Ulljb0RBb3d1elpraWRmb05qN1lxR042akhtNnZZQjFnS2hvOGRC?=
 =?utf-8?B?YjFabERTNlliVGRKNkhWSzBja3ZGd2lCZ2F1a29naWtFNkRzOEg4dVMyWEI1?=
 =?utf-8?B?VFpyYnNMenZXZEp5NStlL0MxNzRvMFIwUjB5cHVocDR3cjQyMExSRkZYY3JK?=
 =?utf-8?B?ZXJQYVd2YUNMK2s5elNmSHNrVzRFSkw2VnpJMHFYU1ozMkpHK200dDUxME9J?=
 =?utf-8?B?eDZ2VXNzdVF1OVlQbUJ0K1dDYm96WWRDRjdhZUtkU1BOQVBKUDByRlhNbnNK?=
 =?utf-8?B?K2NjdVJkWWxCVnppSUp2SU5iZWMxeUdpa2o4M3UxWlljeVNQQXN5aUNabDBS?=
 =?utf-8?B?QldZeElmaWZZUnc0L09yU2dqN3Y0SWNKaG9iSHpHeHltMGxxZFU3VjB2MnRD?=
 =?utf-8?B?d1Q2ZW5USjVuUzV6WlN3cTFWN2QzdkZxSm5PYTJ2MGRXMjQ0S2s5UGJvVFNE?=
 =?utf-8?B?NkFib0phMUFad0lLSmF6Q3VrOHBibkFsV1FRNzRSclI2ZjU0cVpUcUpDMVdV?=
 =?utf-8?B?SWNuUlZjVzZFRkpINUdyOWdMM3UzN0xENk1hM3RyTVp4TGVTbjBPTU04S0dX?=
 =?utf-8?B?QWJnUnN1NWxCWSt5a0s0Tzdack0yWDJNV0p3a1o3bzdKcjhTNmlkZnV4dUYx?=
 =?utf-8?B?eU1POW8zRFVISThONDYyRUduRDZWWTNScXEvS3NNNFJPVnpQMzNjRG1aekVG?=
 =?utf-8?B?cnZTNEU4dzZDdE5TNzZ5bUJlZzVDQ2VvMnZTb2MwN01SRDdYU0NMaHE3Y0dK?=
 =?utf-8?B?UCtwUUI2eHpsN05EZVl5bkNIRGVVdmtlYWRJbGJ6cUFpYW51MUFUTmJKbS9Z?=
 =?utf-8?B?NnVuNzVkVEt1cWR4SGZqYTdqb0N3QzBvWi95dkNZdnU2azk1bzFNUWphcktB?=
 =?utf-8?B?YzZYb3pJTnYxOS9PK3AzQnhEMHNzSHZzSWs5NXlPUWN5VkRwYTBINTZzUE40?=
 =?utf-8?B?Y3NuQmJHTjg1c0Z1NENETEpRWEorWUErZDYyYnd6N1QwNHlBd1ZsdFd2YXls?=
 =?utf-8?B?TE5rbE5DM0Vwc3NDeXMrNDZOSVVOZ1lvUEZMb0cwbEJha09DWmZBdlp1VmVq?=
 =?utf-8?B?UlpjRHhpdTgzdi9DNDRSSUR1TFNqYkVIZ2VNS0t0aWRIbm5PZU9WcTJMNWcw?=
 =?utf-8?B?SUcvNi9JSXZHLzRRTlNhdnBLcVQ4bkIrZlJuWEtlb0N1K2phU2NRZ1FlOEFO?=
 =?utf-8?B?VlVxdWp6SG1yTDRpeTR0bDAzQTZjb0hidFVOVWJvUnp3L1pjaFR3OWJGVlk5?=
 =?utf-8?B?S0tKRFhmcnBZblcxcjlyUURiSXZ2a1FWbnVieXFSMG1IQUZiWjY4eU9JbWU3?=
 =?utf-8?B?ZW1qcDg4V0FlS0tJdUROYm5sa3ExOG5vUTk0Umw3UmYydGV6bEJ2WDF1N0Q3?=
 =?utf-8?Q?9vz/xBd6/7xYp+owl+w+qjKd1kIxAw9m?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(10070799003)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YTM1OXdmQmw4MjdiR2xtSUxmb0lCMTRWMUcvdGFZaTVtME04bzZ2bFV5MjFU?=
 =?utf-8?B?RGwzOVpFMzFEQUlsL0xYMTc3NENyS2dXL0RHRXdOQTNoZTBwNEZ5eFc2MG0z?=
 =?utf-8?B?YzF1RGN4MTVpeTJWOEZpWlB6RCs2UDJjYVlHRCtaNTlKY1N2R0IwbzZEMUhj?=
 =?utf-8?B?RjNFY1dNOEkwK0laY3R0SGxtZk1Ca2h2aHdPSWZDb0xzdjNERTVPcnhMYTZG?=
 =?utf-8?B?Zm1DWkZiaDA3YXlKZENtU1R2YzN2MlRzMWZJS2FkM3RRVVpmd2QyRFBQYlpn?=
 =?utf-8?B?QnNaZWMxWnlGOHhmeFl6b0VoWHpPd0pzU0JiajdiZkozNEd2MW9IR2g1SHc0?=
 =?utf-8?B?MUxtUXNXQndvOUFZR0dsblBGNTVES1U0SnNydGhtQ3liMm5oMXA2aHJBYm94?=
 =?utf-8?B?VFJiV2RReW9oOStnWHl3SmdWMGpMQm9pVXhUODNCdlE2Z21VVmFWb2RnQ3BY?=
 =?utf-8?B?RmdZK3JYcHBUYVRSUldua3ZyMFJqdHZqTkRsaXJOUFFPYUhrTVZqT1dFN01u?=
 =?utf-8?B?ZFB5TmZrSG8xRjhTVXFyL2dIN0RDUEowR09ING82NGVLa3BHSmxyNGVFdzM2?=
 =?utf-8?B?bkhaVmZxa3FmaStmSDBUSmhHb2wrYUY5V1pzdUVNRFYwcERDNnBWRGRCU2ZK?=
 =?utf-8?B?TDU0cjFLSVdDcjV5NTRyRzBKdGEyUFRDdHZaYVBUOUpJTzJQZTgvYlk0Ym9L?=
 =?utf-8?B?YjVNNkQxUnFRcWIxMXVSQjJrMjFSK2JOem5VdDlkb20weXI0aStnanhta1lw?=
 =?utf-8?B?ZGVDZE9yazhZdlptUlkzSjRvaVNQV3B2UW5mN0ZoZHVURmRIV1ZDZk5vT2NJ?=
 =?utf-8?B?cnRhUmhVdVRJSXRuNU9CRmd6dGY0bEVlTytsdDVLUzBhYmVYU0VLNnVkVnkw?=
 =?utf-8?B?Y084YXc0d2lmQ0VUSTRWVFAyaVlqNjI3ZDFWYUkxWGNCWEd6a2huSFExTm56?=
 =?utf-8?B?Sm1xSjJqRmthNGsySjkvUm1hN2pWUVltdTUwMXM3OUhNc3RJZ1lOYit1eDZ0?=
 =?utf-8?B?eFFDNExWMUNnNHp3MkxrSlp6NUpmMDBGME5CUTBLd2RnbjhmOUVSM2dLWCtW?=
 =?utf-8?B?WUFhczY1V1VWZllXUlNhSUlOUi9MM3QyRG9FQzgxd0I4M1RzQ055dzdhdnhQ?=
 =?utf-8?B?ajIreEM4TytNclh4bjdUWDQ5UHUraUJ3OGgrelpXMTRjWG1NaUVEbklSNmFx?=
 =?utf-8?B?VnlUNmFXbC9tMnEwY1ZQT3dFVjkreVRNMGc1T2drRkdvT3lpaVZOS0JqTnZ4?=
 =?utf-8?B?b3BoSmVZRnlFbXllUUdrQXVvMDA2R3AxczBQQW1oWit0NzZqVFRla2IzWEdM?=
 =?utf-8?B?SlJkc0dpbHJmMlIwU3AvZXQ3a1dwSENIbEZzR0d2VUtyc24wK1AyUGMvL3Rh?=
 =?utf-8?B?WDIwZkJOYmljVW91RkR0ZlNTTGVXMEF3RE40OEdZRjgrME9nYVFTdWliYUZS?=
 =?utf-8?B?bHpEQkt0TzNYWDFWU29qa2ZJWTFJczFXUDZWVEhId2V0c1RCVjNSYUJCSkNi?=
 =?utf-8?B?R29jeWpNd3lIYUpNSVFhVHFPVXg0UEpQUkhBclUwU2VrWnVoNFpHdEE1RENF?=
 =?utf-8?B?eFUwWmxPS3haRTFNZkpzaXB2eklPYmp3WVZtbERWUiswbFFqMzVIcFB2MlVz?=
 =?utf-8?B?eVU0V2xoR2JFQnRyUWhzQ3AyQmJTY05sZFBsU0ZxdUpqRGwxOTN2aXREWVgz?=
 =?utf-8?B?Vkp4MC9XVEdmdDlOWWF5ME81Qnl6N2JETDBNV0RjUGtLc0J2OU4vNVNiSlBr?=
 =?utf-8?B?bkJuYVRHN0FIeHFxMzVOYUdjZXZtaEFNcG1yd0hqb1VTS2c5cEkvWDVOVHhs?=
 =?utf-8?B?TjZ5NDV4a1RmV0VBNFFRUmp5T0kxbC9RYWxQdUk1K2wwNW5sQXhzRytyT2Nq?=
 =?utf-8?B?QWk4ZTF5bjhDYTVxNjlKVmxGRm5WVHZ0TjRkRzJHTEJGRVhhRVlFK3VJOWhU?=
 =?utf-8?B?V29LNHNBUVJKMUZNL0wwS0M1ZHZiK1lnMkgvRks4anJWWFBDNnZRNGdaZmF4?=
 =?utf-8?B?WWkrQjZ1UlhRKytXUkc0cTUwRWpFZENWK1NNcWxaVG9FdTNPNk9xc0EyYUta?=
 =?utf-8?B?Qnd3S1ZybXMvdzI2YVljR0w3WHBwS0ZuV2FGZ0s1WFEram0xaFhFdVNBeFRk?=
 =?utf-8?B?eG52TmlWYlRySWQzeXAzK1NJamFmUHZSbmxWNyt1emNKblVSU24zR211a3pO?=
 =?utf-8?Q?EQQFZP2PdaGBGqHMAv2ZHZIzo7Jvstl09ofOwktn1ZrU?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 92bcc140-162b-44bc-7bdd-08de271cd5ab
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2025 03:36:33.4446 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WunzDHTlghGjfniM//NNrOGDwxfMBG5fycowYWTlZARttXHlB9sjpud05j2y8+cAZVeW0SjCZ8VJHQvtgmnEbQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7558
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
> GSP-RM insists that the 'size' parameter of the
> LibosMemoryRegionInitArgument struct be aligned to 4KB.

(nit: use imperative style in title, e.g. "gpu: nova-core: align
LibosMemoryRegionInitArgument size to page size")

>
> Signed-off-by: Timur Tabi <ttabi@nvidia.com>
> ---
>  drivers/gpu/nova-core/gsp/fw.rs | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/nova-core/gsp/fw.rs b/drivers/gpu/nova-core/gsp/=
fw.rs
> index cacdfb2d4810..0104395e04d7 100644
> --- a/drivers/gpu/nova-core/gsp/fw.rs
> +++ b/drivers/gpu/nova-core/gsp/fw.rs
> @@ -355,7 +355,7 @@ fn id8(name: &str) -> u64 {
>          Self(bindings::LibosMemoryRegionInitArgument {
>              id8: id8(name),
>              pa: obj.dma_handle(),
> -            size: num::usize_as_u64(obj.size()),
> +            size: num::usize_as_u64(obj.size().next_multiple_of(GSP_PAGE=
_SIZE)),

You can use the `Alignment` type here, as the rest of the code does:

    let size =3D num::usize_as_u64(obj.size())
        .align_up(Alignment::new::<GSP_PAGE_SIZE>())?;

Now `align_up` returns an error in case of overflow, that we will need
to pass down to the caller by changing the return type of `new`. It is a
bit annoying, but better than the behavior of `next_mutiple_of` in such
a case, which is to panic. :)
