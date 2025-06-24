Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 46BB4AE6DE1
	for <lists+nouveau@lfdr.de>; Tue, 24 Jun 2025 19:52:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A8C910E613;
	Tue, 24 Jun 2025 17:52:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="tIiSfk5a";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2073.outbound.protection.outlook.com [40.107.223.73])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C70210E612
 for <nouveau@lists.freedesktop.org>; Tue, 24 Jun 2025 17:52:40 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=n4+KSCR2XoKsHYPgucNJvwZg7kDN+9FhsFFog4ct+6CJmcbd7HGWIpOtiDOumE2qHJGb+RC4IrdoBpbdt+GRPaX9IXqzdNhZ0RQLoVzQmabN/YwzYBySuinKDUzGez4b5eOYpY4t1HNALVgfO5QxlUalh5HZ7WU6KXy4TarQ3plEZnukvrDSjVKvipVPchaIuRMXHbmvSs5B7Z/imzfz7rxr8E00Q+/uzkZEIGAmlf3r8d9bwI3dcAam6+Awjs1MlYTTLZp0PDJUKuD8BpjYpDuk9Xg5lOur4p+kBF8pSVBUQN4WDmqQzB9W3EvJlo3wqY6RqtSAqufTV8jivnxr8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+kyl5aHc7l0IcsAgVSN1/GLSQD/dY7TKcPFBCxqRlVI=;
 b=QXxMnZ9yLbcV2fJm2iXywxlamUhkcATwWLaCiZlfhcwORsis8b5bBud9HrRHGbqS26k8yJDIvdXbJlNebnb8IDu1lAiLQFrmZgdx0pcBuhOLX45qXw4c/K0YjGeZgBvHwyhQIM+xlHJoIHwpZfqml2VkASyPfSTZwQtIbWXKyLDojB7tDIHq/ihyTFnQ8gzRKrC9B1CXhLWjfaLH3pIVJXIUge/tomwkn0xQWfrh4D8FfEqnAA+xWYnwBafaiRTKacmHLKd+r7fIn0vLqoE4fkFhWFRKWLBkmSrbjh05p6iW2nWxO6Z2SXyczRS1EhmtWDwJLOwfHb2Bhz8eUON6BQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+kyl5aHc7l0IcsAgVSN1/GLSQD/dY7TKcPFBCxqRlVI=;
 b=tIiSfk5aJPvnojWl3FBq2bpx2OU+729vEspUSYg6Yqj65TWNW7mY/5y6JdWUeUfP9VC5pXBeAnzQgqMPhHW2DmQGwYSzrB9g+k75l5FZxbizq1dtdFw53oM+4+TkEj2wY/uPZPcFzY4dTWTAPA007bjIB2L3UshSDa7Udo7hFWJs66dgY+V3f8MIeehd2dOW1C5kXmE4myuBZ4cW+pNn3w4na6Ed2cgqyJULQQMydwU0VTgVSm6wcRu8veQDA+n/umqXKtIKNJ57dpkyvK4Pasotj9XHKKI2C4NFcv985XeO3vUE/GnJCuNe1zrD4/a4yJW3wtPVw8i9xFbFZk3oqw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV2PR12MB5968.namprd12.prod.outlook.com (2603:10b6:408:14f::7)
 by MN0PR12MB5955.namprd12.prod.outlook.com (2603:10b6:208:37e::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.25; Tue, 24 Jun
 2025 17:52:34 +0000
Received: from LV2PR12MB5968.namprd12.prod.outlook.com
 ([fe80::e6dd:1206:6677:f9c4]) by LV2PR12MB5968.namprd12.prod.outlook.com
 ([fe80::e6dd:1206:6677:f9c4%4]) with mapi id 15.20.8857.020; Tue, 24 Jun 2025
 17:52:34 +0000
Message-ID: <2c15aca7-ff91-408a-a0f2-5ada14d775f2@nvidia.com>
Date: Tue, 24 Jun 2025 10:52:31 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] MAINTAINERS: Add Alexandre Courbot as co-maintainer to
 nova-core
To: Danilo Krummrich <dakr@kernel.org>, acourbot@nvidia.com,
 nouveau@lists.freedesktop.org
Cc: airlied@gmail.com, simona@ffwll.ch, bskeggs@nvidia.com,
 joelagnelf@nvidia.com, ttabi@nvidia.com, apopple@nvidia.com,
 sbaskaran@nvidia.com, rust-for-linux@vger.kernel.org, ojeda@kernel.org
References: <20250624170517.105148-1-dakr@kernel.org>
Content-Language: en-US
From: John Hubbard <jhubbard@nvidia.com>
In-Reply-To: <20250624170517.105148-1-dakr@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BY3PR03CA0008.namprd03.prod.outlook.com
 (2603:10b6:a03:39a::13) To LV2PR12MB5968.namprd12.prod.outlook.com
 (2603:10b6:408:14f::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV2PR12MB5968:EE_|MN0PR12MB5955:EE_
X-MS-Office365-Filtering-Correlation-Id: 1db2f982-ad00-4df6-0400-08ddb347e5f1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?eVZkYUQrdk0yT3JIUThSL1VkQXZnUjVQL0RhMmlpemovdmk5MnZTVHBNeUds?=
 =?utf-8?B?UUlYdTlOYjJIaEFLclc1WVZMMHh3M2tZaXhDSncrdlBEQXJNTUVDc0NwTklj?=
 =?utf-8?B?NGh2NjlIKzZxbDJoMXIxSVhlcVNsV25VRUp3WTlIaE5mejRESVlFWTFSRGV0?=
 =?utf-8?B?bk9BeFVjclBGdmJMWUhYbXRNT3Rra1hpbUlIVXBnM2xkc2x0RVNsQmhCWFpq?=
 =?utf-8?B?djczVys2UWZhOHBWODhCeGQyM0dsS0ptSFQ4bVhHL2JmREZucWswbzJDdFNJ?=
 =?utf-8?B?M0d2ZjhkZitGa2hGV0ZnWTJOWDlRUFVLWGo0V2g5R2MzMm50RXNERW0rOUVs?=
 =?utf-8?B?dEdpRHVQeTJEK1VMVEd3aWdzbzhZK0pLM0tQTFhIWUlmRXYwaDJoYXUyT2dV?=
 =?utf-8?B?M0I4a0YzdVFCdnQrN3FxRWExL2xWMURLQS9iZHNxWjltWFUraXVlVUVSdlJT?=
 =?utf-8?B?OSt5am00WnFiTDdKUVJBY3Uvd1MwaU1kM2w2N1BNaktoYUJRa0hRS0JoaGpX?=
 =?utf-8?B?ZUhOd3hMSDdqanlROUNqOEZiNW96TVgvaFFoc3YvQUFLb0RPNkUxQnFLS0lk?=
 =?utf-8?B?UWtZS0lzSlNqRVJzSVFtUjhQUFpvQXlDVG1PVGE4cmpxR0hncWREU29xemtO?=
 =?utf-8?B?dGtBK3lCcEY4cmR4RmZ3dUJSeVRQbk5OZGd1OWVsYUYrM3h1eEorVExhS29x?=
 =?utf-8?B?dklpamFWVHV6cWZFbTY0eWNtZWpHL1RrZUZkb2RvbHBwYk8ybWcwemFrVFA4?=
 =?utf-8?B?WWlFZGJCSWpwcWdNWDRPa3phdWV2WUIyMU5kUENQM0NVcnNNelJPK1RyQ0Ju?=
 =?utf-8?B?b1NqZnZxd25OQ0lyQ2pmMnd1Rk1lUHlja3JmcmxjcE40NGtOa3pOTFpKWW9S?=
 =?utf-8?B?d29vVHVxRHdQWGsra2RmcVlWUDdEWDlValZwSzl4dEFxVmt2UFg0T1ZVTDVp?=
 =?utf-8?B?RHlsQzdQQStaMVdwejdoQ2YwZmNVUnQrZElHMDE4K3VtSSszb3ZPRlhudlVG?=
 =?utf-8?B?TFBTMFVpWVFhVzRKWFo5bklHZG1sQVNNOXEzNFBIVVN6UmZyZnduR2pCMTRT?=
 =?utf-8?B?bGxYM0RuVVMvNDl2RVh0dkx1RXhzUjQ0QllnT1N0N01XeGRGY25uT09KSkpo?=
 =?utf-8?B?NmxnZzBZMjR1WjY1bWdwSk43aHdWNHRVeFpHOVBwdjJ5QUFPTU15bDBjUnBQ?=
 =?utf-8?B?OVkrOW02TmZ0Mm1XQUtENXp2WEkzTWhkdUgyeGJoaU42QUZxRFpmejM5cEda?=
 =?utf-8?B?UXlScEtLRGU3RWVSWHdYNWZnZVBmLytiQ0hOSnRKNzhNaS9XdDBSWjVyY0JV?=
 =?utf-8?B?ZEpvZWswM1dTbnZsRzJFYUdlRHl6cGJJT1U2MjRub2c0Tk1ETjZwTnlYVDBD?=
 =?utf-8?B?NFZyV1Mvb2NCU0VZcUpmTlBpaDI2Y0h3N0tLbWl0NzI3cFl0a0ZXU1ZGZ3lX?=
 =?utf-8?B?b0xsbnJMMHhhR0l4OUZzM1FlcWF0aUdKNCtmQ2RnWHBmc0E3T1Exek50SkM3?=
 =?utf-8?B?aGhteUdOeVlLSVpyL3U0Nm1RN2NXcmEvNUorVUdTMENFMG1QSC9rOGF1eXlV?=
 =?utf-8?B?bUpZUTd0Sk1BejRYaTVSM1NzQ2x3ZjV1T3EzVUJxdHJ5clVsV0VNdVU1RWJL?=
 =?utf-8?B?VllrTjlNS2FSY3NaeENqUmQ1R0RZV0hZZUxweXlhNU9pVktGUE9ZOTdZWFcz?=
 =?utf-8?B?NDd3SERFRXlGUlpMcnhjRlpXUE1uK0l5d0gxdW9GU0RjNlhGTitiWHp6U2w5?=
 =?utf-8?B?TFVvUTRWYlBWTTlkYTV4KzRaK3dLZnk4NXRRbTRTYmJjZlhxZUw0Vit2THoz?=
 =?utf-8?B?R05DK21PQ2ljQ3VJb3F5eGNVNXhpUVJxSGMyMVFVYVFRTDU1T05EUWM3QXQ3?=
 =?utf-8?B?anNTdFhJZE9pMks5dFI1MnV3RzFnMGIyNmI1bXA0blpHeGtpaldCT3lkQjhx?=
 =?utf-8?Q?vAHC8U1sgQg=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LV2PR12MB5968.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?K2FxQlJCdHRnenNUKzBXelpmM3RZSkQ0REJaQU10WGNyY1oxR1E1K2s1U3Bk?=
 =?utf-8?B?MTJWSjhtcHF4cG40c3NVRkZ0S1Q2VVU4OG5wMlBjUjcyRG9abjR6Rm1BTWg1?=
 =?utf-8?B?SDNpVnhudEkzZFpXVWlHaW56bmRjTFR2SW12ZC96R2FicytlYU9Fem1wUDVn?=
 =?utf-8?B?ejloNlFjeVVFWVczdEI0dXJnQUJZSjB4Sk1udmlNOWtpbi9hZi9jR2RlbE1j?=
 =?utf-8?B?aXZVM0VxNnRHbTlmVnkxQjVrcTk3NHNYWC93Y3JXYkdoMFFWQTQxVTVMbmU1?=
 =?utf-8?B?SHl0b2RtTmc3a2wxZWlkU2dnQzRUeWFXL0syaGdKNnp4S0Z6WGZOMU8vcG1B?=
 =?utf-8?B?NFJNb3hXQ1JsaVhZdUhnT0hxRFZ2SG5peWZxRDRqY2Z6ODJNd2dZa1BhN2Uz?=
 =?utf-8?B?eSs5VE1WRkxnUVpBSytDdWZLM1FMemFRNFk2d3lhUksxWUlkNllSSUFJaTJw?=
 =?utf-8?B?WE95aDByN0sxV3FZb24rajJ0T2lycloyOE9nUW5Vck5pcE0vWG8ra2ZtQytr?=
 =?utf-8?B?a2FDOGsvZDB1NWdaVDc2THQ1SG13MFloV09lVHE0bXArNmI0aVVMMmpOU24r?=
 =?utf-8?B?Y2pxTUhFWG5JaTM5RzFIaCtHVklDWGx2MGFPZ0hxMkFyRDh2SXJWTG84TXNO?=
 =?utf-8?B?d2Ziak54ZmtwV3cyTjJJSlJSaEc0UTBTZW0ra0U1bExiNHhxdGdCSWZXM2pJ?=
 =?utf-8?B?eStnRHBHbjV1ZndLUVhZNzgwZ2VFL2NwZ1dyRFVobjd5K3FENW93dFdKbVg3?=
 =?utf-8?B?ZjR5TFJuYmI4bnF0Rmd6NWZIR1gyUHdtUzRTU1ZLSE4zWFZrMnM4K2wxN2R1?=
 =?utf-8?B?ZUlWMG82dkVqc0cxOURxQW1SaVZsYUtvbmZleTlTUkg3TlFoemZpaVBlMGxC?=
 =?utf-8?B?OHpSRnlJaTVRZUUvcktOb3FsbVJlemp1a01MaForRVpWZUt0bTIwNHRRaDJF?=
 =?utf-8?B?YTYyVUtXRWNqdWtWQStzZHI1eTVoVlY1QmJmWk5LaTBiaW95TEQvdFRjZDhj?=
 =?utf-8?B?WkFkQlRYajRPa3RJckg5YkRnbkFQOUJtemI3VzA3OStKbHgvOGhwMHlUdFNF?=
 =?utf-8?B?ZngrVVZLaEhSalhuYUxBSnhKeTRLWENqcUwxbDdpWmRzc0txWVE4aTdVWjgv?=
 =?utf-8?B?SXVlRXZyQVhXVE50NFZTMzVVSlk0anBtVFovTGNsZEhIRU9MWGhseFY4S0c5?=
 =?utf-8?B?bmRrbjhyK2d2S3ZBUXYrTGU3WCt6ZmJTdVlBb0dmTTlSUUw3SW04S2wvK21M?=
 =?utf-8?B?OE0vSjN4V2VrT2I5c1Vsd2ZzQ0RuZGlxclYzalNObStSYkRJS0lSWVljcksv?=
 =?utf-8?B?Z0NqdnVDZU9qK0ZzU2FlUE5ZWGNjSURRU1J1dmcyMnpycUFvNjlpQmtYdjdx?=
 =?utf-8?B?R3pPSkk5blQ0MW03dS9tUGFscmhzV3hCNU4zWFl1QXlqWjdWeUFvQWpqODIr?=
 =?utf-8?B?TFNnbmQ2KzJFWkdjekdnUFNRTzdtcVdCSnJuZHhqcyt3SkJTcGh6ZGVHWmNz?=
 =?utf-8?B?ODhDK1kzS3FNcUVEMzJSV0hOeGl0aWMzSmVqWW9UNFRDVjg4OFFua056Qzk0?=
 =?utf-8?B?WXA1VGlKaVl6bXpodnFXMnd5Sm1SSnJwVjJod2orVXVRNDU3OXZTS3c4TTA2?=
 =?utf-8?B?aGVGMHplalRrb2FoRCtGZGpxaTFVektYSSs2MG9YZHYrK2tid0Z5S00zTzdl?=
 =?utf-8?B?dUVBbWltU0dBblVFVHEzVWJUOUtPd3FPTmYrbE1sMGlwckxwN3Zhc2ppV3E2?=
 =?utf-8?B?RjdmbmRHOFdNL2xpU1pLM3VHTGs0NEsxeGtMMWw2cWpwMzBHcUl2SmJLdGMw?=
 =?utf-8?B?Skx0cnVhcExsMzNVdExHUnVnK2ZKVHJHOUZ2cVRVQk5pNk1jcGovVDNNQTVF?=
 =?utf-8?B?WngvOE10bGNTdmtwUTl1T3RrZmtidDUwb29yS3ZEYXhhbzBRUDB6R0RQK2Y5?=
 =?utf-8?B?RUluK2w5VVlVa3lrTGVuVE1nKzdJMmlYVDJtWlVrcE8vSTd3T2gySml5Nmhm?=
 =?utf-8?B?TzcyMG9zQlVmOWFWTE1QSlBPYUg1WVZjNW4zcis4YmRFV1JnSkRGcUJlMVkv?=
 =?utf-8?B?SHZtUHBFNWRFSnR6eDcyV3hENGwxV3VvRlRjYWtuNkxvVEp0M1M2d1c1WnF2?=
 =?utf-8?Q?cow0CkViQ/Vs1SjKIJZXKNhts?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1db2f982-ad00-4df6-0400-08ddb347e5f1
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5968.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jun 2025 17:52:34.0043 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: o2qjF0B1KVsc4iia/+fNhN1FM4R9BeILzfu/kAEfV2oxWiHh88CHWrbJKP/e7kAzvIpNLp/INJDPWNgPfGjAaA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB5955
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

On 6/24/25 10:05 AM, Danilo Krummrich wrote:
> Alex has extensive experience with NVIDIA GPU support, is closely
> involved in nova-core development, and brings valuable Rust expertise.
> 
> In addition to his technical contributions, Alex is actively engaged with
> the broader community. He works closely with contributors and
> stakeholders to identify and solve issues, fosters collaboration, and
> helps ensure that the Nova driver evolves in alignment with the
> community.
> 
> I trust him to take a key role in making the Nova driver a successful
> upstream solution for NVIDIA GPUs in the Linux kernel.

Congratulations to Alex! And thanks Danilo, for working closely
with...well, everyone, to get here.

Please feel free to add:

Acked-by: John Hubbard <jhubbard@nvidia.com>

thanks,
John Hubbard

> 
> Cc: Alexandre Courbot <acourbot@nvidia.com>
> Signed-off-by: Danilo Krummrich <dakr@kernel.org>
> ---
>   MAINTAINERS | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 0c1d245bf7b8..e694d06dc69f 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -7718,6 +7718,7 @@ F:	include/uapi/drm/nouveau_drm.h
>   
>   CORE DRIVER FOR NVIDIA GPUS [RUST]
>   M:	Danilo Krummrich <dakr@kernel.org>
> +M:	Alexandre Courbot <acourbot@nvidia.com>
>   L:	nouveau@lists.freedesktop.org
>   S:	Supported
>   Q:	https://patchwork.freedesktop.org/project/nouveau/

