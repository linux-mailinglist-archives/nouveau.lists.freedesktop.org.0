Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B5B33163EC
	for <lists+nouveau@lfdr.de>; Wed, 10 Feb 2021 11:34:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 330EF6E20B;
	Wed, 10 Feb 2021 10:34:56 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr770070.outbound.protection.outlook.com [40.107.77.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7192A6E20B
 for <nouveau@lists.freedesktop.org>; Wed, 10 Feb 2021 10:34:55 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bdu4evIs3erYfMUx1woR1Ar7oh0+A1uwoTAKiSP8Zrr0G9+Ln+P2Nu8zAOExLZ6VC6QSrB3JIgyJtnigNPoFB74+EXKblnom6ISOTE/SrFzpRRtYns4C5Q6Scf2zoFDPhVkaEyebqNWBCdPAi3xytFNwn91zVUSsfEB5YlsWoB80uHRKGB8QQAjF+iMeNI+zdBuIDBbx1dIZVwoBe802mwRM9T2nt5xxu8H8qm8DeokqXbqBo8BvuWv3H9patzdkhMu3ErvS/SuwMZCkjy+pDKzBf/nns6DPjae/g37WZfnDE7Ty5Hk8L9V4fXACsivsr5sy8yy17oboCbCpUQBrAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bto4WmNPcgXD+wz5UMt6QkHg3rPgG8ycjqyoeNdN/UI=;
 b=hDbXXtwPCxsvJ0tC2tYOKNapaTCeg4NVAmKqHDJG7xsEeJIrmMnC58odwfX24pbNetjPv9oe7G7A4yC9iFugmO6R/RgJ1QGRGj6anKqZeRmN8SmJp/YXqE17JOYg1HkQDObzOU6WAeRNADPH8bWp4OFNEOOLiwOtIBnO45fLzXFfxtKy1DoFTsnEDBeAtoMj3ai/CBM779k6i0zFgVGnP5t76Xq3TGh5ebqscnK09pdVqMpD/ESmdD0edSuw3Ui4+tU3QHfskfAomezLue8IP5NDsVJqy3+DcCjf0AIyfRsNu0+BaxWNOOBA+7BOOfb2RbAxP0/aCzZFgoUGygex3Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bto4WmNPcgXD+wz5UMt6QkHg3rPgG8ycjqyoeNdN/UI=;
 b=jTnQ8OdY2BO4tFfxagU9m69rwco/2/kbkdzNSh0SSaqodPr+6jGTLy42IZTJ4HnisMo1Yl6gRXbgyVpYY/PweRD04oNYCWk5Kf1mmXg9i8e8+jaNed0I5bkRXhr1gy0SCau0VPTiwOTwDGD84EaBfp8h+Oiz+ZcSuHCsuKCwjh4=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by BL0PR12MB4739.namprd12.prod.outlook.com (2603:10b6:208:81::29)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3846.25; Wed, 10 Feb
 2021 10:34:53 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::c1ff:dcf1:9536:a1f2]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::c1ff:dcf1:9536:a1f2%2]) with mapi id 15.20.3846.027; Wed, 10 Feb 2021
 10:34:53 +0000
To: Mike Galbraith <efault@gmx.de>, lkml <linux-kernel@vger.kernel.org>
References: <1d663cd74af91e23f4f24ebbdd65ef3ba72c15fc.camel@gmx.de>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <43924195-c4e1-fce4-5766-aaefe2d6f766@amd.com>
Date: Wed, 10 Feb 2021 11:34:48 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <1d663cd74af91e23f4f24ebbdd65ef3ba72c15fc.camel@gmx.de>
Content-Language: en-US
X-Originating-IP: [2a02:908:1252:fb60:1e1:ad6e:a509:1753]
X-ClientProxiedBy: AM3PR07CA0093.eurprd07.prod.outlook.com
 (2603:10a6:207:6::27) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:1e1:ad6e:a509:1753]
 (2a02:908:1252:fb60:1e1:ad6e:a509:1753) by
 AM3PR07CA0093.eurprd07.prod.outlook.com (2603:10a6:207:6::27) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3846.11 via Frontend Transport; Wed, 10 Feb 2021 10:34:51 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 04d43ea8-8939-49ac-236c-08d8cdaf8042
X-MS-TrafficTypeDiagnostic: BL0PR12MB4739:
X-Microsoft-Antispam-PRVS: <BL0PR12MB4739014B304D993A91487402838D9@BL0PR12MB4739.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2512;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 8SiuGOe0UQZZvL/Dr+mCRwolDs7MTi/w77waf39t+BSpuxjON+qvp/Rhsj6ysH6Fs3lLBiHOz+XYn0x3rMkct2vRVZU6ggSwsL4zS8cQtcNb55rjy/jivSKxlMtMEbpbyWmAmfnGMGpEMuTkF/2IR9bGt03o7/dpbTM5Yb3XaSEeN7qHIHH6wIMjOXWYHS3BVB1uDvmP7yww4zW2FfgypyAv7ZPJhq2x4IKkj+sz9i38Hz6Z9MoqEIBhecUraYEvlAqCZXKJQ7PXWA1747Wo//Y/2vgDRaiR2dbKn5Z4tU4w069GeQLRBy/KrlDqsyG5cZkj8P4fb7UNeXsKGqN0FZTk1EP/i5Nyrr6ZMOJOFZz0DZ1n33klyQQ5Fhg+HaWfFyaY2+gZjjJeuhB5NC+Kr8nQe8shhkHIte/JK7hzjd2jz/tgQtMeETG8+Bwo0y2tYFgpawski/3UC6OyxP4e1Vr/tthPqaf5Jsq+fp3DOd5c6RLRKmzSCWsdBCehe0W2lvCGGSv3u3JtWn5kFXRqbYG1LJSP5IXgZX82zDuvkbT7MoQGUFfCxxSuM/Z5i6j6UTm4zz8tQITARo7VHE0TRvoU1NoV4VTvctfpL+NPaU5O9A3C+muw7Y8XqrkZKO9DoYCwdAGdpjPV6z545ElYBA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(396003)(376002)(136003)(39860400002)(366004)(5660300002)(83380400001)(8936002)(8676002)(45080400002)(86362001)(31696002)(52116002)(2616005)(66574015)(54906003)(66556008)(186003)(16526019)(2906002)(66476007)(4326008)(478600001)(6486002)(316002)(66946007)(36756003)(110136005)(31686004)(6666004)(966005)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?iso-8859-15?Q?iuti1pbmkGAuTKBh5PC9GBsaizprYyX3gBTWlidGHv3BL+c1ABazmHQrM?=
 =?iso-8859-15?Q?hcudwL20FA9AydOqSUpTi3dJhGSXASipQ79aph2RbbCjUCMPfXjJWOpOS?=
 =?iso-8859-15?Q?/57os1Ik4sTmwy2upZwh9UG9nbv5hW/zCsTBWMcOMOKQMNH+3IcXYgpU4?=
 =?iso-8859-15?Q?AFCszOYytb/+nmzyAqh3fSuhDYq+DltOLTI+aS+UA1fALEVE0fwknHsMr?=
 =?iso-8859-15?Q?Nto5xZzgQxAmLOeyAtIvXUaBWMj6FADiYl1MK1BpkYsjDCUNlcgN240wp?=
 =?iso-8859-15?Q?lKlNT2FMKdzdKDCi8SnPG7JTVM2lY0D75ku22EwzKx6AquEIVHugMZ64e?=
 =?iso-8859-15?Q?i1ZVMRmsgs/JcalxGKnXZ01z4zAp7/3vD1qz6GlNdIiCyzh7jHsbYj/jK?=
 =?iso-8859-15?Q?R3+tmRKcG0Wkt3xXaeu+WY5kCA4JRrlSwj3ODJb8JHWZPvKZQ5F4l8g5I?=
 =?iso-8859-15?Q?86X9PtzUmjCgl1uVSeUwUGST9g3rs0KcfXmk+GHZG4RyhMP0WDrBWlrs5?=
 =?iso-8859-15?Q?2T2KuE182uGQaw/cB0HlFAh0Ivcrr0SERDi710faT/xEJEOt+xzgQdG9K?=
 =?iso-8859-15?Q?of7yn4M1zyZsFFrLQR2D8sOeFIF+gj0fJZYrbe5pcxmnCLrICQAGbld4h?=
 =?iso-8859-15?Q?dqZuf2vvM7NeqS3AFIimxYGODxjA4Ht2SBjAwWM4PHwajpIKNAkHVv3rQ?=
 =?iso-8859-15?Q?y6J7rbCX1gR9KWfWy7H3e2yfoVUQIN/nK4aqDgdnLk6e7nLrI201un0BD?=
 =?iso-8859-15?Q?abOxx3trAEzHrTz5WjgZIFP/AH5aVmUBYmp7vHTs28SN+YhdVlyaAF26U?=
 =?iso-8859-15?Q?oFdsiS0qDK7kb0+Fg6gaus0qeSzPc5tX4wRl4zm8LOZcayesi2JO3znCR?=
 =?iso-8859-15?Q?ACvffwct2zkVxO2biWLc22/9EYVhc6WN+5T6dMgOCSger3T5/C9ZUML04?=
 =?iso-8859-15?Q?QhbKQRg9/Sf13wkVw0CgHEayhDedMOp6NwP4LmHgugDvOzMeWzAuJbBLR?=
 =?iso-8859-15?Q?xsxaUqHZYKw+vNB+MRKP47ZhTLo7UrHqjLtJpCPQQHg2So7TkSE4GB3PP?=
 =?iso-8859-15?Q?QvMZ67cZEx9Ndk5MsG6VqUFY1C6/Y/RpufgvWd9lVOuSEM/t90NaNm+Vw?=
 =?iso-8859-15?Q?/TvaLwUMA+k48KxjKyP184Gip6I1v51VVSrAiyoO7z4/kXQ51YYNsqDcT?=
 =?iso-8859-15?Q?w0BfxB4N1zgK2EWkbi70oeS+9QQ8li3b/ItoCJJ+b/TCVGyB4GGPj2UBu?=
 =?iso-8859-15?Q?WYxT+i95piAXVs702alcSH0zk4d41IZvQ2To4Dc/8n3Qzs0aibiBsNnHj?=
 =?iso-8859-15?Q?XlTXIUv7xV5/t5vIyAlaQDUhdXpWDTc1+RuQi3SbuSJoyn7rO0ANdahN3?=
 =?iso-8859-15?Q?6Rb0Xy9Liy/IcrbhWwKCzFcNdohi6Y3Aay1PIe8Oh/4VuUBrcQ7FLu2Kr?=
 =?iso-8859-15?Q?ZWL8xp+I1KqCIkURF8zdXIusEXRVfsVAbVT9eb0d?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 04d43ea8-8939-49ac-236c-08d8cdaf8042
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Feb 2021 10:34:53.4380 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ArQ7bB6Dxwk/GllfYWlMaLQVwHhibRIRmx0DO3+vs94HWcH+RFLLL3hcCiWvJvZ1
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB4739
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
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-15"; Format="flowed"
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

Hi Mike,

do you have more information than just system stuck in a loop?

What seems to happen here is that your system is low on resources and we =

just try to free up pages.

Previously the allocation would just have failed with an out of memory =

condition.

Regards,
Christian.

Am 10.02.21 um 11:13 schrieb Mike Galbraith:
> Greetings,
>
> The symptom is tasks stuck waiting for lord knows what by calling
> sched_yield() in a loop (less than wonderful, sched_yield() sucks).
> After boot to KDE login, I immediately see tracker-extract chewing cpu
> in aforementioned loop. Firing up evolution and poking 'new' to
> compose, WebKitWebProcess joins in the yield loop fun.
>
> Hand rolled reverts of 256dd44b "drm/ttm: nuke old page allocator" and
> the fingered commit cures the problem for me at 207665fd in the bisect
> log below, and at master and tip HEAD.
>
> There's a "things that make ya go hmm" aspect to this thing though.  If
> you look at the bisect log below, the starting "bad" is 207665fd.  That
> commit DOES NOT exhibit the yield loop symptom immediately out of the
> box, but DOES after applying the much needed fix...
>
> 	660a59953f4f "drm/nouveau: fix multihop when move doesn't work"
>
> ...to prevent an earlier regression from quickly appearing, one which
> Dave will likely recall having fixed.  Relevant?  No idea, but seems
> worth mentioning.
>
> Box: aging generic i4790 box with its equally aged Nvidia GTX 980.
>
>
> 461619f5c3242aaee9ec3f0b7072719bd86ea207 is the first bad commit
> commit 461619f5c3242aaee9ec3f0b7072719bd86ea207
> Author: Christian K=F6nig <christian.koenig@amd.com>
> Date:   Sat Oct 24 13:13:25 2020 +0200
>
>      drm/nouveau: switch to new allocator
>
>      It should be able to handle all cases now.
>
>      Signed-off-by: Christian K=F6nig <christian.koenig@amd.com>
>      Reviewed-by: Dave Airlie <airlied@redhat.com>
>      Reviewed-by: Madhav Chauhan <madhav.chauhan@amd.com>
>      Tested-by: Huang Rui <ray.huang@amd.com>
>      Link: https://nam11.safelinks.protection.outlook.com/?url=3Dhttps%3A=
%2F%2Fpatchwork.freedesktop.org%2Fpatch%2F397082%2F%3Fseries%3D83051%26rev%=
3D1&amp;data=3D04%7C01%7Cchristian.koenig%40amd.com%7C8af0b5f635fe41d2eab50=
8d8cdac7c5c%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637485488031207323=
%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haW=
wiLCJXVCI6Mn0%3D%7C1000&amp;sdata=3D7%2Bi9YU1C7NpS%2FMC0FDrpcVtsZU6MHRUrvPP=
zdq6Q40A%3D&amp;reserved=3D0
>
>   drivers/gpu/drm/nouveau/nouveau_bo.c  | 30 ++--------------------------=
--
>   drivers/gpu/drm/nouveau/nouveau_drv.h |  1 -
>   2 files changed, 2 insertions(+), 29 deletions(-)
>
> git bisect start
> # good: [2c85ebc57b3e1817b6ce1a6b703928e113a90442] Linux 5.10
> git bisect good 3f995f8e0b540342612d3f6b1fc299f5bf486987
> # bad: [207665fd37561f97591e74d0ee80f24bdf06b789] Merge tag 'exynos-drm-n=
ext-for-v5.11' of git://git.kernel.org/pub/scm/linux/kernel/git/daeinki/drm=
-exynos into drm-next
> git bisect bad 207665fd37561f97591e74d0ee80f24bdf06b789
> # good: [f8394f232b1eab649ce2df5c5f15b0e528c92091] Linux 5.10-rc3
> git bisect good f8394f232b1eab649ce2df5c5f15b0e528c92091
> # good: [b3bf99daaee96a141536ce5c60a0d6dba6ec1d23] drm/i915/display: Defe=
r initial modeset until after GGTT is initialised
> git bisect good b3bf99daaee96a141536ce5c60a0d6dba6ec1d23
> # good: [dfbbfe3c17651fa0fcf2658fb90317df08e52bb2] drm/amd/display: Add f=
ormats for DCC with 2/3 planes.
> git bisect good dfbbfe3c17651fa0fcf2658fb90317df08e52bb2
> # bad: [112e505a76de69f8667e2fe8da38433f754364a8] Merge drm/drm-next into=
 drm-misc-next
> git bisect bad 112e505a76de69f8667e2fe8da38433f754364a8
> # bad: [49a3f51dfeeecb52c5aa28c5cb9592fe5e39bf95] drm/gem: Use struct dma=
_buf_map in GEM vmap ops and convert GEM backends
> git bisect bad 49a3f51dfeeecb52c5aa28c5cb9592fe5e39bf95
> # bad: [d7e0798925ea9272f8c8e66ceb1f7c51823e50ab] dt-bindings: display: b=
ridge: Intel KeemBay DSI
> git bisect bad d7e0798925ea9272f8c8e66ceb1f7c51823e50ab
> # bad: [c489573b5b6ce6442ad4658d9d5ec77839b91622] Merge drm/drm-next into=
 drm-misc-next
> git bisect bad c489573b5b6ce6442ad4658d9d5ec77839b91622
> # bad: [8567d51555c12d169c4e0f796030051fff1c318d] drm/vmwgfx: switch to n=
ew allocator
> git bisect bad 8567d51555c12d169c4e0f796030051fff1c318d
> # good: [5144eead3f8c80ac7f913c07139442fede94003e] drm: xlnx: Use dma_req=
uest_chan for DMA channel request
> git bisect good 5144eead3f8c80ac7f913c07139442fede94003e
> # good: [e93b2da9799e5cb97760969f3e1f02a5bdac29fe] drm/amdgpu: switch to =
new allocator v2
> git bisect good e93b2da9799e5cb97760969f3e1f02a5bdac29fe
> # bad: [461619f5c3242aaee9ec3f0b7072719bd86ea207] drm/nouveau: switch to =
new allocator
> git bisect bad 461619f5c3242aaee9ec3f0b7072719bd86ea207
> # good: [0fe3cf3a53b5c1205ec7d321be1185b075dff205] drm/radeon: switch to =
new allocator v2
> git bisect good 0fe3cf3a53b5c1205ec7d321be1185b075dff205
> # first bad commit: [461619f5c3242aaee9ec3f0b7072719bd86ea207] drm/nouvea=
u: switch to new allocator
>

_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
