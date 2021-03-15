Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DCF8533AD05
	for <lists+nouveau@lfdr.de>; Mon, 15 Mar 2021 09:05:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 52C7F89D9A;
	Mon, 15 Mar 2021 08:05:20 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM04-BN3-obe.outbound.protection.outlook.com
 (mail-eopbgr680065.outbound.protection.outlook.com [40.107.68.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DCE6689D9A
 for <nouveau@lists.freedesktop.org>; Mon, 15 Mar 2021 08:05:18 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cKxQgBYnAMumsNUeAPGHnzitQ6BqhrhYoD9QifzTIoyHsHtK2Bu2ZCVoyaNaPekusSG3nr7TftwLUJuXbtNDg0LOD4VI67+fioH4iDBTIH7uAIACFbIFRqgHCfrhda9kbLlGnDZeg11tK0ifqpYF249A6xf0n1KAJkk/tYVCAZlqXahtvbi/UnTQcWuIFUaa00RqtqVBnSr1s+PmGqt17okfrSyUEUeZgVKxzfndVSWu9zVVsWlkqFFsgmH2YlJSWHMh02EdE+aXdXvdKD5JNKn62jRq0VtTk2PgvEVt/5yY9CUPrXXXsr1UMVaBUyd2MrcNMvzIrM74in7JsjVPUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tsEVu8XkI2SX4QUOa9PXDUgEh0uNyIOVFpUU2fMF6KQ=;
 b=H3A0cL/u2wCyGcWNTiqEDBhd2h9Jr3fSd/SvxqZBu2xh2OjUlEAwH5ttgzcd4ea5ywY9k4kPXJvHr/PSrGl15hD2WD5pRGolIoGN+Vfcu0JrhivymD/mhHoVu1pkKb3Dgj33CM5baAsYNeSTvKri97t8bCgiC7pv3yslm9rQ+AWk2X3Zl5nFWicw4YTtOGS32GkC804YbcPKpJNS4QcMTC4rKq+Zpko8txxyxajIE/qSvzBOq5cCsSNCZGG212xdTASufhN8JOiFZSc1MDJe193Wx668vy+bn5dT0in/5zvIYwzYxia7PcxgZCtrYHEmP/ZeaYJUkyRaxo76fUmR/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tsEVu8XkI2SX4QUOa9PXDUgEh0uNyIOVFpUU2fMF6KQ=;
 b=y990M+iS8hoknKEyXhxqoDjIxxJLVkDdTneiVvZ9tOWAHHJwxs6jD+dF/5HtJngaGaWkllc2wSnFy+FwlcWFqLaEIS6IgnBHwFHXdWGMHzPIMHHS37wAkDfHJ2NLKiIMsAEHwPZ4BmyL+yl+B1adaMSSybwo87RbmLdF6+4KExY=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by BL0PR12MB4900.namprd12.prod.outlook.com (2603:10b6:208:1c1::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3933.31; Mon, 15 Mar
 2021 08:05:16 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::c1ff:dcf1:9536:a1f2]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::c1ff:dcf1:9536:a1f2%2]) with mapi id 15.20.3933.032; Mon, 15 Mar 2021
 08:05:16 +0000
To: Mike Galbraith <efault@gmx.de>, LKML <linux-kernel@vger.kernel.org>
References: <987bd1ca15545ca896c4e1c115e89a1bba0ad306.camel@gmx.de>
 <95c41bb3988882c202a2b7d6802f7528682e26b1.camel@gmx.de>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <9947f244-762d-0937-f77b-9f650f3df4cf@amd.com>
Date: Mon, 15 Mar 2021 09:05:10 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
In-Reply-To: <95c41bb3988882c202a2b7d6802f7528682e26b1.camel@gmx.de>
Content-Language: en-US
X-Originating-IP: [2a02:908:1252:fb60:bde2:57eb:9d60:81da]
X-ClientProxiedBy: AM3PR05CA0088.eurprd05.prod.outlook.com
 (2603:10a6:207:1::14) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:bde2:57eb:9d60:81da]
 (2a02:908:1252:fb60:bde2:57eb:9d60:81da) by
 AM3PR05CA0088.eurprd05.prod.outlook.com (2603:10a6:207:1::14) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3933.32 via Frontend Transport; Mon, 15 Mar 2021 08:05:14 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 058a3fcb-dbe6-4aab-6987-08d8e78910b6
X-MS-TrafficTypeDiagnostic: BL0PR12MB4900:
X-Microsoft-Antispam-PRVS: <BL0PR12MB4900110B08050883CD4BDDA1836C9@BL0PR12MB4900.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1107;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ByeDGKfRpnLbKKqucVCGsFQNGVsyPhRf/U9TWg/ey8aWjvUpq6h0znx3bU2kDnK5P6wTkk3zhVUHSC1GqI2AkyUnAy2v9e7TypbrjNKiYoLXdpTimaJX9jxcgYkLP7oFY/Mx5W6QA9HYPbvZtGxogd4R+LIL5nrBlZFMnm/LmduoqvoCIDDy6F0+lDq2ZaCL8+i9dRVAGVWSJL8BI4RI/bKnAzmTYtRol7vwjkbNz4D3m8ceCYpL7Jtd+RpxwKKaGJih/sizhxP+5IKKl0vTLILoewod2g68O9Zb8+hACS6QEMDMLVfmX+dH/1TuEhOeE2aCD/z0KlCfGmUi2d6DiBNR+GUWvak8sMI6khMVgE9grIZcwGxwPIhZwqG5VT7PVUugJnARPnxL0VIt0Hv5Snoqrvqzwf6Tm9jHD+QF2Egdo/LYjpE3IC3lxHXbzCkGSQNpBcqtomm/zvTLzpymOziiVEw8Uw2qTL1aHc5Kri3SRg9rwNAILc9ybRZNkn5QYYwRBY0B8eieLWUEpMqh3ytIbZbpS1lFPdcWaedk7qV8VhtiKq6TPpKqoETDn8J/RAKMZSMRYXJDHUxV5N+aClpedwJ4l41cvQQ7q36BjsctsMihjSFd50yiFF+aOOz0CzxP040Xobr+IAiVnEq0PQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(396003)(39860400002)(376002)(136003)(366004)(5660300002)(316002)(4326008)(8676002)(110136005)(83380400001)(31686004)(86362001)(2906002)(186003)(8936002)(54906003)(66946007)(478600001)(2616005)(6666004)(52116002)(31696002)(66556008)(66476007)(36756003)(6486002)(16526019)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?iso-8859-15?Q?SfTIySYPyd1fPvGkT9iTBDssF96FXuoSsjPN/rvopZEMNwyzrSfBZcOCT?=
 =?iso-8859-15?Q?Eol/mRCl8dNsBbEsj1uHGYKEVoV2QL0HMoDavwgcSM471znR4ToaHDI/K?=
 =?iso-8859-15?Q?T9xHb5ZCfqgwKiZg/o4aybT0UO6AIYtQeORCZswus6z2Y77Zsa6zw4hzJ?=
 =?iso-8859-15?Q?Eu1Ir0MFslZxRPKDxvgTDl94X8aEy3tDthOLJwpHsa+oSwQgnqDZyH3cc?=
 =?iso-8859-15?Q?NgIBfeYdhwMJNdtRGpvXjZZKBHsmKoQyZyQbfHyxrd5EyfQPuKio1Dcja?=
 =?iso-8859-15?Q?OU0vz+YnbiEmdtZW2uxZDe0dAOO+dwprxYj3igyDJJcwAYnYhBD27I81i?=
 =?iso-8859-15?Q?CUSrzjkrHsIV2BslBNED5V6rXTlxOgG1XYuXpVphlqM3NW7tkQ2C+PxSp?=
 =?iso-8859-15?Q?LgkwJCPaWBHvm625kGON93khUAmIQlnaptb6neP7L4yi3LZ5ChxjOunZp?=
 =?iso-8859-15?Q?Mknurni9xjflnW/WflzxiE79funQGXVd1uZ6qeYXBcpeYzS+2z7uu3IYM?=
 =?iso-8859-15?Q?HIHN2MLzvhrqSrEW9bUrDgkeop18wjFIKiH3qZm2rtL+sZI2dYWnA9p1Q?=
 =?iso-8859-15?Q?0W3LuDPq7vbCfeaiwVDMSbK/+R6RI7m8uYEz4ENeMwLcs4A570v18sh75?=
 =?iso-8859-15?Q?5IgI/Vn4/8fF3OkJQ1+3EJVDCZl2sazCbg4IZwzegldNaL4QaDfAKfJjT?=
 =?iso-8859-15?Q?/yJ1G1tBGSONuC1LuUuoRrTkc/ljrF42kTw5+VifCFhblUm9cCB2QIaxU?=
 =?iso-8859-15?Q?g3sYrbBdUS4rO8oqOqzkJfJOhciIgd4XjivHeZh4asYD0dOyKQK3pb15D?=
 =?iso-8859-15?Q?SA34W/LG4U67dSWVp+Ol++pdHUz4iKurpWl/v+o23mVjJaBvRkvW2Q8WW?=
 =?iso-8859-15?Q?xaR/15kfJ25OwbFFRzARTIgEY+rOWTfIxkT6Glxi3PvFlqOqYdJCU19t5?=
 =?iso-8859-15?Q?abxSXA/e71DDAbKwIG/jxxQLwMg1MAnJO90kNOO8YcuPSpmCdbJ7V/s1i?=
 =?iso-8859-15?Q?RCYZwj24JrhWuoTkfpZJ+ZL3xfTTp6wEkp1PC9FdTqFRePJtaDRdTjpnr?=
 =?iso-8859-15?Q?t3tY9OUWXG7MKzjoMCPQ46M2IZEIgiYMKG2QWaG2jZKf5lXQ4zBZIOEFT?=
 =?iso-8859-15?Q?uCGaLbtB+2thaE1XZ0iszX50xPovzyNO+AeYhn5rTZzkrMbS6xoBMsaLB?=
 =?iso-8859-15?Q?VY6FmeFZCXbgUwpSHmSgeu7YgkJNGbnAVHMKKyoJJV4jc52bgQS5JmmSe?=
 =?iso-8859-15?Q?WUWozJ/Wwtrm5r9PFL2pXlDHuJxECsvqfaHGE8jvmR4dQaiwH6m8j0Zvf?=
 =?iso-8859-15?Q?+SQZg8qjWC7JJJq/5w3vtQtbsVfubFL3xSnpqR7bUM2x+l+ETUM/15CRJ?=
 =?iso-8859-15?Q?Tu220ZpvSU/R/EAnYeTY69cXOla5cEoI4rRggdd85C5a8GOBo5kOOUjrX?=
 =?iso-8859-15?Q?Fmz7mbqM3U2e6rsNA5CkaCSdFY+zbWGNJSTYZd2p?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 058a3fcb-dbe6-4aab-6987-08d8e78910b6
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Mar 2021 08:05:16.4832 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PuVhxeXqGDqTOrlP+QDXequVRry/v6tp7qlNjR/ITlTpT44KtxYGqyudR46f6D4q
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB4900
Subject: Re: [Nouveau] [bisected] Re: nouveau: lockdep cli->mutex vs
 reservation_ww_class_mutex deadlock report
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
Cc: nouveau <nouveau@lists.freedesktop.org>, Ben Skeggs <bskeggs@redhat.com>,
 Dave Airlie <airlied@redhat.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

Hi Mike,

I'm pretty sure your bisection is a bit off.

The patch you mentioned is completely unrelated to Nouveau and I think 
the code path in question is not even used by this driver.

Regards,
Christian.

Am 14.03.21 um 05:48 schrieb Mike Galbraith:
> This little bugger bisected to...
>
> 	b73cd1e2ebfc "drm/ttm: stop destroying pinned ghost object"
>
> ...and (the second time around) was confirmed on the spot.  However,
> while the fingered commit still reverts cleanly, doing so at HEAD does
> not make lockdep return to happy camper state (leading to bisection
> #2), ie the fingered commit is only the beginning of nouveau's 5.12
> cycle lockdep woes.
>
> homer:..kernel/linux-master # quilt applied|grep revert
> patches/revert-drm-ttm-Remove-pinned-bos-from-LRU-in-ttm_bo_move_to_lru_tail-v2.patch
> patches/revert-drm-ttm-cleanup-LRU-handling-further.patch
> patches/revert-drm-ttm-use-pin_count-more-extensively.patch
> patches/revert-drm-ttm-stop-destroying-pinned-ghost-object.patch
>
> That still ain't enough to appease lockdep at HEAD.  I'm not going to
> muck about with it beyond that, since this looks a whole lot like yet
> another example of "fixing stuff exposes other busted stuff".
>
> On Wed, 2021-03-10 at 10:58 +0100, Mike Galbraith wrote:
>> [   29.966927] ======================================================
>> [   29.966929] WARNING: possible circular locking dependency detected
>> [   29.966932] 5.12.0.g05a59d7-master #2 Tainted: G        W   E
>> [   29.966934] ------------------------------------------------------
>> [   29.966937] X/2145 is trying to acquire lock:
>> [   29.966939] ffff888120714518 (&cli->mutex){+.+.}-{3:3}, at: nouveau_bo_move+0x11f/0x980 [nouveau]
>> [   29.967002]
>>                 but task is already holding lock:
>> [   29.967004] ffff888123c201a0 (reservation_ww_class_mutex){+.+.}-{3:3}, at: nouveau_bo_pin+0x2b/0x310 [nouveau]
>> [   29.967053]
>>                 which lock already depends on the new lock.
>>
>> [   29.967056]
>>                 the existing dependency chain (in reverse order) is:
>> [   29.967058]
>>                 -> #1 (reservation_ww_class_mutex){+.+.}-{3:3}:
>> [   29.967063]        __ww_mutex_lock.constprop.16+0xbe/0x10d0
>> [   29.967069]        nouveau_bo_pin+0x2b/0x310 [nouveau]
>> [   29.967112]        nouveau_channel_prep+0x106/0x2e0 [nouveau]
>> [   29.967151]        nouveau_channel_new+0x4f/0x760 [nouveau]
>> [   29.967188]        nouveau_abi16_ioctl_channel_alloc+0xdf/0x350 [nouveau]
>> [   29.967223]        drm_ioctl_kernel+0x91/0xe0 [drm]
>> [   29.967245]        drm_ioctl+0x2db/0x380 [drm]
>> [   29.967259]        nouveau_drm_ioctl+0x56/0xb0 [nouveau]
>> [   29.967303]        __x64_sys_ioctl+0x76/0xb0
>> [   29.967307]        do_syscall_64+0x33/0x40
>> [   29.967310]        entry_SYSCALL_64_after_hwframe+0x44/0xae
>> [   29.967314]
>>                 -> #0 (&cli->mutex){+.+.}-{3:3}:
>> [   29.967318]        __lock_acquire+0x1494/0x1ac0
>> [   29.967322]        lock_acquire+0x23e/0x3b0
>> [   29.967325]        __mutex_lock+0x95/0x9d0
>> [   29.967330]        nouveau_bo_move+0x11f/0x980 [nouveau]
>> [   29.967377]        ttm_bo_handle_move_mem+0x79/0x130 [ttm]
>> [   29.967384]        ttm_bo_validate+0x156/0x1b0 [ttm]
>> [   29.967390]        nouveau_bo_validate+0x48/0x70 [nouveau]
>> [   29.967438]        nouveau_bo_pin+0x1de/0x310 [nouveau]
>> [   29.967487]        nv50_wndw_prepare_fb+0x53/0x4d0 [nouveau]
>> [   29.967531]        drm_atomic_helper_prepare_planes+0x8a/0x110 [drm_kms_helper]
>> [   29.967547]        nv50_disp_atomic_commit+0xa9/0x1b0 [nouveau]
>> [   29.967593]        drm_atomic_helper_update_plane+0x10a/0x150 [drm_kms_helper]
>> [   29.967606]        drm_mode_cursor_universal+0x10b/0x220 [drm]
>> [   29.967627]        drm_mode_cursor_common+0x190/0x200 [drm]
>> [   29.967648]        drm_mode_cursor_ioctl+0x3d/0x50 [drm]
>> [   29.967669]        drm_ioctl_kernel+0x91/0xe0 [drm]
>> [   29.967684]        drm_ioctl+0x2db/0x380 [drm]
>> [   29.967699]        nouveau_drm_ioctl+0x56/0xb0 [nouveau]
>> [   29.967748]        __x64_sys_ioctl+0x76/0xb0
>> [   29.967752]        do_syscall_64+0x33/0x40
>> [   29.967756]        entry_SYSCALL_64_after_hwframe+0x44/0xae
>> [   29.967760]
>>                 other info that might help us debug this:
>>
>> [   29.967764]  Possible unsafe locking scenario:
>>
>> [   29.967767]        CPU0                    CPU1
>> [   29.967770]        ----                    ----
>> [   29.967772]   lock(reservation_ww_class_mutex);
>> [   29.967776]                                lock(&cli->mutex);
>> [   29.967779]                                lock(reservation_ww_class_mutex);
>> [   29.967783]   lock(&cli->mutex);
>> [   29.967786]
>>                  *** DEADLOCK ***
>>
>> [   29.967790] 3 locks held by X/2145:
>> [   29.967792]  #0: ffff88810365bcf8 (crtc_ww_class_acquire){+.+.}-{0:0}, at: drm_mode_cursor_common+0x87/0x200 [drm]
>> [   29.967817]  #1: ffff888108d9e098 (crtc_ww_class_mutex){+.+.}-{3:3}, at: drm_modeset_lock+0xc3/0xe0 [drm]
>> [   29.967841]  #2: ffff888123c201a0 (reservation_ww_class_mutex){+.+.}-{3:3}, at: nouveau_bo_pin+0x2b/0x310 [nouveau]
>> [   29.967896]
>>                 stack backtrace:
>> [   29.967899] CPU: 6 PID: 2145 Comm: X Kdump: loaded Tainted: G        W   E     5.12.0.g05a59d7-master #2
>> [   29.967904] Hardware name: MEDION MS-7848/MS-7848, BIOS M7848W08.20C 09/23/2013
>> [   29.967908] Call Trace:
>> [   29.967911]  dump_stack+0x6d/0x89
>> [   29.967915]  check_noncircular+0xe7/0x100
>> [   29.967919]  ? nvkm_vram_map+0x48/0x50 [nouveau]
>> [   29.967959]  ? __lock_acquire+0x1494/0x1ac0
>> [   29.967963]  __lock_acquire+0x1494/0x1ac0
>> [   29.967967]  lock_acquire+0x23e/0x3b0
>> [   29.967971]  ? nouveau_bo_move+0x11f/0x980 [nouveau]
>> [   29.968020]  __mutex_lock+0x95/0x9d0
>> [   29.968024]  ? nouveau_bo_move+0x11f/0x980 [nouveau]
>> [   29.968070]  ? nvif_vmm_map+0xf4/0x110 [nouveau]
>> [   29.968093]  ? nouveau_bo_move+0x11f/0x980 [nouveau]
>> [   29.968137]  ? lock_release+0x160/0x280
>> [   29.968141]  ? nouveau_bo_move+0x11f/0x980 [nouveau]
>> [   29.968184]  nouveau_bo_move+0x11f/0x980 [nouveau]
>> [   29.968226]  ? up_write+0x17/0x130
>> [   29.968229]  ? unmap_mapping_pages+0x53/0x110
>> [   29.968234]  ttm_bo_handle_move_mem+0x79/0x130 [ttm]
>> [   29.968240]  ttm_bo_validate+0x156/0x1b0 [ttm]
>> [   29.968247]  nouveau_bo_validate+0x48/0x70 [nouveau]
>> [   29.968289]  nouveau_bo_pin+0x1de/0x310 [nouveau]
>> [   29.968330]  nv50_wndw_prepare_fb+0x53/0x4d0 [nouveau]
>> [   29.968372]  drm_atomic_helper_prepare_planes+0x8a/0x110 [drm_kms_helper]
>> [   29.968384]  ? lockdep_init_map_type+0x58/0x240
>> [   29.968388]  nv50_disp_atomic_commit+0xa9/0x1b0 [nouveau]
>> [   29.968430]  drm_atomic_helper_update_plane+0x10a/0x150 [drm_kms_helper]
>> [   29.968442]  drm_mode_cursor_universal+0x10b/0x220 [drm]
>> [   29.968463]  ? lock_is_held_type+0xdd/0x130
>> [   29.968468]  drm_mode_cursor_common+0x190/0x200 [drm]
>> [   29.968486]  ? drm_mode_setplane+0x190/0x190 [drm]
>> [   29.968502]  drm_mode_cursor_ioctl+0x3d/0x50 [drm]
>> [   29.968518]  drm_ioctl_kernel+0x91/0xe0 [drm]
>> [   29.968533]  drm_ioctl+0x2db/0x380 [drm]
>> [   29.968548]  ? drm_mode_setplane+0x190/0x190 [drm]
>> [   29.968570]  ? _raw_spin_unlock_irqrestore+0x30/0x60
>> [   29.968574]  ? lockdep_hardirqs_on+0x79/0x100
>> [   29.968578]  ? _raw_spin_unlock_irqrestore+0x3b/0x60
>> [   29.968582]  nouveau_drm_ioctl+0x56/0xb0 [nouveau]
>> [   29.968632]  __x64_sys_ioctl+0x76/0xb0
>> [   29.968636]  ? lockdep_hardirqs_on+0x79/0x100
>> [   29.968640]  do_syscall_64+0x33/0x40
>> [   29.968644]  entry_SYSCALL_64_after_hwframe+0x44/0xae
>> [   29.968648] RIP: 0033:0x7f1ccfb4e9e7
>> [   29.968652] Code: b3 66 90 48 8b 05 b1 14 2c 00 64 c7 00 26 00 00 00 48 c7 c0 ff ff ff ff c3 66 2e 0f 1f 84 00 00 00 00 00 b8 10 00 00 00 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 8b 0d 81 14 2c 00 f7 d8 64 89 01 48
>> [   29.968659] RSP: 002b:00007ffca9596058 EFLAGS: 00000246 ORIG_RAX: 0000000000000010
>> [   29.968663] RAX: ffffffffffffffda RBX: 000055da9d0c6470 RCX: 00007f1ccfb4e9e7
>> [   29.968667] RDX: 00007ffca9596090 RSI: 00000000c01c64a3 RDI: 000000000000000e
>> [   29.968670] RBP: 00007ffca9596090 R08: 0000000000000040 R09: 000055da9d0f6310
>> [   29.968674] R10: 0000000000000093 R11: 0000000000000246 R12: 00000000c01c64a3
>> [   29.968677] R13: 000000000000000e R14: 0000000000000000 R15: 0000000000000000
>>

_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
