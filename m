Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 50233230349
	for <lists+nouveau@lfdr.de>; Tue, 28 Jul 2020 08:51:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 10F136E17F;
	Tue, 28 Jul 2020 06:51:10 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2074.outbound.protection.outlook.com [40.107.244.74])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3FBB76E126;
 Tue, 28 Jul 2020 06:51:09 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iS+uYCXGzwq6fPZWJt/7/b+COZkrHUU671RBL+MDw7wpSf6SPuSu4I146h3hWV0Xl6Rshz4V+tKu7Iwgwir390ReWhnhsqW4Q89zDJHNv9ove7xB+gdeW14F+BngRlHPPx619qbIAzRVQF2WEk1fBAXKmg/PZ7JVdcUi18tkwPSf4H/DEZuM8kvZLLfJMlZNhbPLeN5NLbwQFwXg544cTA58BKKft8rshVJQEX7hMkmUGKxQ04PdGF2q8AmsN3l7fa0lv8eaqE4zloy8CLn+yd5z9d6bwBDSEkCY87Z1eB8KiU9BXG0hwcqc/fzdk4DVJFZ3j8abvvhpMnT3vsv1Aw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qF0e3d0cLqjpkqmk31xs0LgKnP8VW3cRuFu/frVpAes=;
 b=iJMwtvEqsfQ+Usv0yNrZOoyspYYKR851ieOS3G3DgxhERkBKIZs/ex3k7HErHXZyuJpGs054bvux2huWuxQZsiJcnd6PKyAWUBZoWzYy8Z8kS2KiRtDckc5RX8+GVxCkb9qJcnwKb4m6fCFAOBLWYwAeNOJ+3wWFaXzfBnXnyrfSQP/+VkrtI1veKJjmukVkfDiwxWLd3h3vyBgJb8lPf3qbAoKHL5nWQXBlQeYP+tSNyKNUN9ZltHCx25DyDiN1abQf2QvuE8uE98AkClWh5SMfoGrgzMAD7FuNOUgzFWOtzJ24Q+BemHNz65l9rSEwDtZDwullK0l5LDqj0k0oEw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qF0e3d0cLqjpkqmk31xs0LgKnP8VW3cRuFu/frVpAes=;
 b=O/jwnzc6+yCzxJ46eOBwn7JKjPIm5Ch+3ac402KbaM/1iUFtEL1dpCYIDe3jo7QCwXMvOCRwCCsx56jP1y0/U0i8NkpSANjXS3JOFZClMbVabVudTXi6SdwV/9t3H1iBomqOAAdjRx0bBylSrYyeE/ykroM5+C7KRJdoQjEz+vA=
Authentication-Results: amd.com; dkim=none (message not signed)
 header.d=none;amd.com; dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by MN2PR12MB3838.namprd12.prod.outlook.com (2603:10b6:208:16c::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3216.23; Tue, 28 Jul
 2020 06:51:02 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::a16e:8812:b4c0:918d]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::a16e:8812:b4c0:918d%6]) with mapi id 15.20.3216.033; Tue, 28 Jul 2020
 06:51:02 +0000
To: Daniel Dadap <ddadap@nvidia.com>, dri-devel@lists.freedesktop.com,
 intel-gfx@lists.freedesktop.com, nouveau@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, jani.nikula@linux.intel.com,
 joonas.lahtinen@linux.intel.com, rodrigo.vivi@intel.com, bskeggs@redhat.com,
 alexander.deucher@amd.com, david1.zhou@amd.com
References: <20200727205357.27839-1-ddadap@nvidia.com>
 <20200727205357.27839-5-ddadap@nvidia.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <3c355e4d-b9ff-66b7-e9e3-86027deeba6d@amd.com>
Date: Tue, 28 Jul 2020 08:50:56 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <20200727205357.27839-5-ddadap@nvidia.com>
Content-Language: en-US
X-ClientProxiedBy: AM0PR10CA0020.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:208:17c::30) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
 (2a02:908:1252:fb60:be8a:bd56:1f94:86e7) by
 AM0PR10CA0020.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:208:17c::30) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3216.21 via Frontend
 Transport; Tue, 28 Jul 2020 06:51:00 +0000
X-Originating-IP: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 99fce547-d8a5-4f8b-14f9-08d832c29765
X-MS-TrafficTypeDiagnostic: MN2PR12MB3838:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MN2PR12MB3838ACC1E29E51A843C8869883730@MN2PR12MB3838.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 5bDWu1Zicur0EtGVH/+02XlXfY4QBsvyOHl0gvvwNnaLbsNKoS+j12w80ZZxzWPZ2W6IPey9uiujMwIKvhVDbIB1yzC2oaZBlh6pBrX3WfuPBYj8CxD9dfS/vdDcvMHYRFsd+H360RxehQwKcjSdXbBJM6ZWX80bfXOyabUKDpZRlTGEwd377WgdyXvFIu5WU0PQa7anHihslsZ29rrmjG7BJDtsXIH6soLL0lDYjhreLW3F53yIYM4u7V2Il57mbVSUeasO2p1zI9gWtOv//1r1vKjR7MyzN5FCDiBqA/kFmGxW/VqByiVaiZtuILFutGzYn02ICce61gBZEm6LijghrqKlClyHfXvOcOk90Drbf7yFGBH+p0RABg8rJqN4+QOrqQkLT4K0S1WiHJ59Sw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(376002)(366004)(346002)(136003)(396003)(39860400002)(6486002)(5660300002)(6636002)(52116002)(316002)(2906002)(31696002)(8936002)(2616005)(36756003)(66476007)(66946007)(31686004)(16526019)(186003)(6666004)(86362001)(66556008)(478600001)(83380400001)(8676002)(921003)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: Q1FysMdS1DgEAmaMiqJrRKpxSLowvAyixxmGQ3ZDA6zhDF+QUTrT5VeJkI9OYyaU51kq+q/rVwy5qQWjg/4nUypF90AEmdY+mqbwOW/+Tuil0eK2Jh85D5rM4vsFkn4FmRklyDQxLw0MPnmo5ry61bpNhHm2+VW7LAoYE52nxkXyOTepoleDNqii6Fp1C6BaKM4zSjPiq5Eyl5SfSwSDziZlYbtraHtllQyMNm18UU+w4OQXzTZOffTzNFPLOrU/gMsiSd5hkHJhU5lrKKa+b4kTfkwguWBYudhsMtYjLMquxV0O1IEK+ANs8/6m3G+Pze4bgNqk7n/CjDx4hRp0i2fM2z5CFPeE9awtzjCNWu1BQXdzHmB2FHBcLGoBdPgTdA/Zmm0Yp294+zzcj5BIwWtEHg79Wecj1/dmhljxwLX1BprUMwbGk2+K4nrVq4gjST9YC8KohW71JVGrYKoe3sg/7lLbvtMPsg5SINYpsRhMHKTFShYQpmNKjseow3fC+v0cSP+mEKiOcjsxDGtOqycEAVHYEz8u5ldTwarfcCsl7J2+ltj95fMWSjq+52GY
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 99fce547-d8a5-4f8b-14f9-08d832c29765
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jul 2020 06:51:02.1201 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2ivN1HVlL7LGnZudE4RvOGlLDjy3EC3oWMXSnGgFXeBNJ6/iXfVqSObkBb+H4nx3
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3838
Subject: Re: [Nouveau] [PATCH 4/4] radeon: fall back to ACPI EDID retrieval
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

Am 27.07.20 um 22:53 schrieb Daniel Dadap:
> Fall back to retrieving the EDID via the ACPI _DDC method, when present
> for notebook internal panels, when retrieving BIOS-embedded EDIDs.
>
> Signed-off-by: Daniel Dadap <ddadap@nvidia.com>
> ---
>   drivers/gpu/drm/radeon/radeon_combios.c | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/radeon/radeon_combios.c b/drivers/gpu/drm/radeon/radeon_combios.c
> index c3e49c973812..de801d9fca54 100644
> --- a/drivers/gpu/drm/radeon/radeon_combios.c
> +++ b/drivers/gpu/drm/radeon/radeon_combios.c
> @@ -401,9 +401,8 @@ bool radeon_combios_check_hardcoded_edid(struct radeon_device *rdev)
>   struct edid *
>   radeon_bios_get_hardcoded_edid(struct radeon_device *rdev)
>   {
> -	struct edid *edid;
> -
>   	if (rdev->mode_info.bios_hardcoded_edid) {
> +		struct edid *edid;

That's an unrelated an incorrect style change. You need a blank line 
after declaration.

>   		edid = kmalloc(rdev->mode_info.bios_hardcoded_edid_size, GFP_KERNEL);
>   		if (edid) {
>   			memcpy((unsigned char *)edid,
> @@ -412,7 +411,8 @@ radeon_bios_get_hardcoded_edid(struct radeon_device *rdev)
>   			return edid;
>   		}
>   	}
> -	return NULL;
> +
> +	return drm_get_edid_acpi();

In general a good idea, but I'm wondering if we should really do this so 
unconditionally here.

Regards,
Christian.

>   }
>   
>   static struct radeon_i2c_bus_rec combios_setup_i2c_bus(struct radeon_device *rdev,

_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
