Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D26203167F7
	for <lists+nouveau@lfdr.de>; Wed, 10 Feb 2021 14:26:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 02F656EC79;
	Wed, 10 Feb 2021 13:26:27 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2063.outbound.protection.outlook.com [40.107.244.63])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 21BC16E067
 for <nouveau@lists.freedesktop.org>; Wed, 10 Feb 2021 13:26:25 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=l4l88NrLZChP1nrRt+tgBDp0Si7L5C0luoKr8nmd1FRdGAITGffb0/qbS5tp7Jfy6NfWfCsXEJY9ZMM39WBwAuT15dYpQ52nCNFWUby6Xhd3ZjoAlMURhnC0NEBly8FcqdY7TES6oUVovWF7mgViYnd3k4E4MTqn1vEOnCm31QXrfjIg5KufqjmaLg9FPrtd7Iuic/VPtCnlDlCiTsFSU3wijT0IEEIbn7+pGJP9J59AVQGFcu2ezei90e+e8TCt8V5FJGH++rDRJZrQiVHarlmVSvQf2zb3OVGWc2eo5j0TI0ZiLVBiZjfAwEyCT3Wbv5ZChOGw6KvN81IQ+z1wcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=g1yIoRkMKrs5AmiO0kg44JrW9Vza0Q1TtBEveyaLFmI=;
 b=lwW49ptgRfE0eJSUBme4TNzHPZmwlCN2z7DqEme5Z37sdZiGFEitrsC2aAe8InYfNxzeLcVhwVLqJ3cs/4FjhXPIYjAlwTXet7eqOYokOTmP3n1Fc+PTr63bKjfPkQbxkZwduyc8M7kPZ2bRv8hgL/DwXegEUI1pFszz1xndqy1V85cBDx3LC00j5Gg9c3FFrFydfJDj0lisW+aWttpnKuEogpLn0BWPgnsTGdNGj1cRjo/2gnvzBpDn85bt4WwG7EPsadTTsGc1KBG+LPu7mOi58/YXDOfrlJmmhNraOFOTm3ZIM4Y8b5M7UGDEBWwZPmR5a3UXVTkLD1cL0yEvCg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=g1yIoRkMKrs5AmiO0kg44JrW9Vza0Q1TtBEveyaLFmI=;
 b=Nh5AJLJIUmgXbuX1y4cGhuTiVCaUrjCSUk/k15lBhsW0svotUmMzjNasmvLaXtUp/pGu6yEd8OQ/h6Ot2ABWWqobRqaPinLcRsNWqOqZkOpCuwZaZlSZML9uLLoo4JH0Bdfv4keDr7Q+6XSYvW+qO3tDu+e0dIEwJkngTnIEHr8=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by MN2PR12MB4302.namprd12.prod.outlook.com (2603:10b6:208:1de::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3805.19; Wed, 10 Feb
 2021 13:26:23 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::c1ff:dcf1:9536:a1f2]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::c1ff:dcf1:9536:a1f2%2]) with mapi id 15.20.3846.027; Wed, 10 Feb 2021
 13:26:23 +0000
To: Mike Galbraith <efault@gmx.de>, lkml <linux-kernel@vger.kernel.org>
References: <1d663cd74af91e23f4f24ebbdd65ef3ba72c15fc.camel@gmx.de>
 <43924195-c4e1-fce4-5766-aaefe2d6f766@amd.com>
 <2793c200beb530ed4a8ac32c5eea0f5aaa53c7e8.camel@gmx.de>
 <bfd62492-e6a9-3899-dd7d-87b7800f45c7@amd.com>
 <41cc52bd57a466f29ea81676d42f57a7b9da7dd8.camel@gmx.de>
 <5df26bda-9ff8-168f-e5a3-0bb503ffcca9@amd.com>
 <eeea2d002142ec7f8737b9d0fb5128b0cdb2ae58.camel@gmx.de>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <468ec16b-d716-5bd4-db2b-fb79e6c72a4f@amd.com>
Date: Wed, 10 Feb 2021 14:26:18 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <eeea2d002142ec7f8737b9d0fb5128b0cdb2ae58.camel@gmx.de>
Content-Type: multipart/mixed; boundary="------------83B6694CF1556E52412EB55E"
Content-Language: en-US
X-Originating-IP: [2a02:908:1252:fb60:1e1:ad6e:a509:1753]
X-ClientProxiedBy: AM0PR10CA0083.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:208:15::36) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:1e1:ad6e:a509:1753]
 (2a02:908:1252:fb60:1e1:ad6e:a509:1753) by
 AM0PR10CA0083.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:208:15::36) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3846.27 via Frontend Transport; Wed, 10 Feb 2021 13:26:22 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 223fe746-a457-4da9-89fe-08d8cdc775d8
X-MS-TrafficTypeDiagnostic: MN2PR12MB4302:
X-Microsoft-Antispam-PRVS: <MN2PR12MB43026EE361D542F7D413C35E838D9@MN2PR12MB4302.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: EUetkyuW5WO6PFvFzLKmJ7D6KEHg85k5O7vOWsXAk5UZ5cUKdsbxRHAXnF5X9WVTUYLd/y4llkZKegn+Fd6OuENyqTN/FGv6i9xg62hbXSYAoG27NKrc844a3RG1BRbgQeum2IgFy2huneMBBUhobO6/dKf8TsKflY49SROTIQkM3oubW+I3C06CawZmQjgcMXJyDoluVmPs6EyEHzg/B/rO7LS/lr6lGfrUFNKhBdtJyRa1FC5gsgGPhBXrZdWt9UzRjFtl4EzSyG4qG/HHs2bv+6eyDeo56mkMP1O/4tWt228Cvy6+Zi4PJgSbdrWfPVd5Okpv9QpbfJBsiYWMcyXquxIwl1EOZJ7D7/IXQOT1uKlofhU4tOm8lsJU4sFQBVOp2U4LnDDXnj8wfPFLcBHDDBb+LjC/ihVFyoGcuAOhdUOQyvCdTJHkSLhUFnh6XAYcLAKynbfb2RMarFqMg+Iw42c/vf1TwoY/RR/lGE3M0zc9G8hgntIVdxsP01EoGD9Yd+2ZQvM+m6F63icxpLn2wjHclRex2a0uEw3rdkZX9S0rfVZ0kQ3AGYX9MLTNN5FbUNkZT1/x8qTcpVFuh4CNC2YkRyVMSl3/ctt3H3g=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(366004)(39860400002)(376002)(346002)(136003)(235185007)(5660300002)(86362001)(478600001)(52116002)(2616005)(186003)(31696002)(36756003)(16526019)(8936002)(6486002)(66946007)(316002)(110136005)(66556008)(54906003)(66476007)(66616009)(31686004)(4326008)(6666004)(8676002)(2906002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?iso-8859-15?Q?HNZZvF/Hx81r1E9DKDnoVzLgX3cnPHzXGYOF9IC4+27HAG2lMr/eZDZSt?=
 =?iso-8859-15?Q?SxBZJbw6vmrccWe5LjMQQ7gQxk6hpC8sHi9uimWGHEDdE8oIY4BEuVGe+?=
 =?iso-8859-15?Q?21jzPhGnpWlksybGKf1cB2Lv4wc9MeIdUCD7o1ka7BqA2tlbmPxNHsM1d?=
 =?iso-8859-15?Q?E+krgg1NmyXd6XBAOaq1c9ZnPtGZocVrQlFkxCCIU9fjZYMi6MEkxzESl?=
 =?iso-8859-15?Q?fSl1/ubxrzCYTi+RoXpK71Xkk0RIzcH/fz7Pdh+tcn1SQfsl+hKf3wGfh?=
 =?iso-8859-15?Q?6HpsyFlziWsqXeExyKdXRjr1fjOX7vNKgDphrIit3b7421aYwsdsO+k+3?=
 =?iso-8859-15?Q?1vWmZbiPqpuguUsVDQSw6QMlA5JVqRC9lJ1/iNpMPq5ahj7IMjyjRgNao?=
 =?iso-8859-15?Q?sUIfv4PfZmREWRjAtqZM86vIsVI8kgf+GaOzR/gYjsG6ZbBg5tkh1oknv?=
 =?iso-8859-15?Q?4bo+sbDsdzO4XzZ/kM3W3utBA3wUMGuZENNLyc0ozHfbrFUxpD7KnkfTD?=
 =?iso-8859-15?Q?mj0/JMDS9wGp9ry1axGLIbpt+CUd6Yc5NuUJ2olW7ngelscARpsNg3sqy?=
 =?iso-8859-15?Q?Q8mshQmnyvQoElx4vRD9FkVfKLHxFJapgvFkc3+Zg0Xg8dvRJSDcXu4tb?=
 =?iso-8859-15?Q?WI8plosdOdHn+JOWQRAzzlRWXFi7UMc/4eVoK9iUDs8KCYPB61LIWZnvS?=
 =?iso-8859-15?Q?FMPMBg+d9k9P0hzdPsi9TRPciVQ8qw+JttBbspL56kczm+5Vo2+ue0oWy?=
 =?iso-8859-15?Q?LXULbL2SIMTD+ljj1asSnAdQuoPugq5RX8CyNVbUbmtk3IvqWpxMEEYxD?=
 =?iso-8859-15?Q?IbG4ChBq5lBOMfrYYkKB07ueqKbYS4bWooH+ky94t4/wJxYk/IkfoJNNv?=
 =?iso-8859-15?Q?a8Cg+UoCJelE6hOQvXrK5zt1ww4mcRhMOb5n5gQf0BzFuBIVs4L1ojj6F?=
 =?iso-8859-15?Q?Kg+w6W1JiCoUPYISLopMtoVliGEr8nFHuBDwwQq8EV/iXtAgpozo+1WM9?=
 =?iso-8859-15?Q?WTeat4eHkpQ1Sbe/BjPZs2v3/GGmgG9NWgZKYpW/j/qz1MHR4h77ktYBj?=
 =?iso-8859-15?Q?34LjtNIAX+0Ps9+qbBldtk1jje50EulwL42a+tg4acOVJLjnWmtl4IcTi?=
 =?iso-8859-15?Q?+beFJEOJ7MDSg4rVe6Mu6YgzYXel1DUgabAtnLLJ0wWRk17F6P1W/Q1TX?=
 =?iso-8859-15?Q?3UobC+oxPXgqpuOiJHpkhdQyOskL3Dskq+YmCrkTSASMoZWvUcSMYylJO?=
 =?iso-8859-15?Q?FqiHUfwj550LLsUTY5C1C+UFPdp4rXat89Q3bXN1tWfOX/JZi7yycZN4n?=
 =?iso-8859-15?Q?GcJMsGEMXqQgon2x6B7wbHQpIc313NurYBmrNO1KN/VwRxf3wZmV4rhWB?=
 =?iso-8859-15?Q?6tSDKBQ+emUp9z8l76TLBKMtWv49/XFXnJ9Op3YKFJqGRoCX5DUq8KQAh?=
 =?iso-8859-15?Q?g96QBOKxptgcq466q/aDg2s6R5Ws01wFBiI5vdvO?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 223fe746-a457-4da9-89fe-08d8cdc775d8
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Feb 2021 13:26:23.5284 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ubaiarFUrIQ97/FO7uBcH8kMq/7NPPmNcMUN8IcHyVfAQxe1rF93dM16sJnv+kbb
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4302
Subject: Re: [Nouveau] drm/nouneau: 5.11 cycle regression bisected to
 461619f5c324 "drm/nouveau: switch to new allocator"
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
Cc: nouveau@lists.freedesktop.org, Ben Skeggs <bskeggs@redhat.com>,
 Dave Airlie <airlied@redhat.com>
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

--------------83B6694CF1556E52412EB55E
Content-Type: text/plain; charset=iso-8859-15; format=flowed
Content-Transfer-Encoding: 8bit



Am 10.02.21 um 13:22 schrieb Mike Galbraith:
> On Wed, 2021-02-10 at 12:44 +0100, Christian König wrote:
>> Please try to add a "return NULL" at the beginning of ttm_pool_type_take().
>>
>> That should effectively disable using the pool.
> That did away with the yield looping, but it doesn't take long for the
> display to freeze.  I ssh'd in from lappy, but there was nada in dmesg.

Yeah, that is expected. Without taking pages from the pool we leak 
memory like sieve.

At least we could narrow down the problem quite a bit with that.

Can you test the attached patch and see if it helps?

Thanks,
Christian.

>
>> Thanks for testing,
> Happy to.
>
> 	-Mike
>


--------------83B6694CF1556E52412EB55E
Content-Type: text/x-patch; charset=UTF-8;
 name="0001-drm-ttm-make-sure-pool-pages-are-cleared.patch"
Content-Transfer-Encoding: 8bit
Content-Disposition: attachment;
 filename="0001-drm-ttm-make-sure-pool-pages-are-cleared.patch"

From 1e623dc5c535de2d0af3c5c6107c08ffffa4fe07 Mon Sep 17 00:00:00 2001
From: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Date: Wed, 10 Feb 2021 14:24:27 +0100
Subject: [PATCH] drm/ttm: make sure pool pages are cleared
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The old implementation wasn't consistend on this.

Signed-off-by: Christian KÃ¶nig <christian.koenig@amd.com>
---
 drivers/gpu/drm/ttm/ttm_pool.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/gpu/drm/ttm/ttm_pool.c b/drivers/gpu/drm/ttm/ttm_pool.c
index 74bf1c84b637..6e27cb1bf48b 100644
--- a/drivers/gpu/drm/ttm/ttm_pool.c
+++ b/drivers/gpu/drm/ttm/ttm_pool.c
@@ -33,6 +33,7 @@
 
 #include <linux/module.h>
 #include <linux/dma-mapping.h>
+#include <linux/highmem.h>
 
 #ifdef CONFIG_X86
 #include <asm/set_memory.h>
@@ -218,6 +219,15 @@ static void ttm_pool_unmap(struct ttm_pool *pool, dma_addr_t dma_addr,
 /* Give pages into a specific pool_type */
 static void ttm_pool_type_give(struct ttm_pool_type *pt, struct page *p)
 {
+	unsigned int i, num_pages = 1 << pt->order;
+
+	for (i = 0; i < num_pages; ++i) {
+		if (PageHighMem(p))
+			clear_highpage(p + i);
+		else
+			clear_page(page_address(p + i));
+	}
+
 	spin_lock(&pt->lock);
 	list_add(&p->lru, &pt->pages);
 	spin_unlock(&pt->lock);
-- 
2.25.1


--------------83B6694CF1556E52412EB55E
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau

--------------83B6694CF1556E52412EB55E--
