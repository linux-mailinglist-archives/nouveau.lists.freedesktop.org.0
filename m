Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1627E262E90
	for <lists+nouveau@lfdr.de>; Wed,  9 Sep 2020 14:32:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 824796EE7A;
	Wed,  9 Sep 2020 12:32:32 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0EA506EE7A
 for <nouveau@lists.freedesktop.org>; Wed,  9 Sep 2020 12:32:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1599654746;
 bh=ZmcmNuf+aCLdbzvgwCLFB50F3JeTe0WOU1Tla4FEgEE=;
 h=X-UI-Sender-Class:Subject:From:To:Cc:Date;
 b=B1W9pGYynVK0V1haI3gbPT5sFiboQNT6oVvFCTv9q86g0AKGCLAyWwtSoZToy3byh
 8glwHFYYDxS1DcOU5fpp1NAAESgzt/5cQWSCRj+/B2zllRBiUeIC6IYjG4wJHcd3w4
 XHleB3qJGXS+mlDQMU6z4f5YbNZpNpV44R1Tvw20=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from homer.simpson.net ([185.191.217.72]) by mail.gmx.com (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1N63RQ-1kZcZ506iu-016P6D; Wed, 09
 Sep 2020 14:23:35 +0200
Message-ID: <1ea7646a7c641b9c7495d21a5e00b903cac307dc.camel@gmx.de>
From: Mike Galbraith <efault@gmx.de>
To: lkml <linux-kernel@vger.kernel.org>
Date: Wed, 09 Sep 2020 14:23:34 +0200
User-Agent: Evolution 3.34.4 
MIME-Version: 1.0
X-Provags-ID: V03:K1:NIRTQgXfMuNJ2jYLTGIbJxUPRKSrucq8G3eVHDSVCOlZtpZgbcW
 tJo4YWQdMHC6lG3YezC9mE/rT7alv7bDPfTspRQ8FfXC7PsixmzeK5gWxCsWLFcdw8RWJ1g
 kS8wFJEzQazmIjIehC72GHsN0XC1JdenwXoDcwqK8RQdVknLWly7B27gS2ayd5uz2MqMdz6
 7mLCYwl8Gt+iidmOmPmBw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:aXLgEIkjX5I=:Hvjjbr7y+qPB0CeRer/YVn
 i5FRZ3gW6E59MdZCkbCtQUYn5fj47e9N7ekj6h2lZu3tsx+LyrfuIyEun0modsexgqoMCi/TO
 ko+9Cl1X13NCeVNoQJsgtJS4npXOped1+DhA5zUjh0tcqKGnz6MPZ1r1KVVABhZ/NlIQqinVG
 PfPo4Rv5yG0Gq9Eoo6ni6hlA4ebcCOb+P/iLfWTctJswvfwfLVrzSwFoM7PrT0UtU1q7LTaZM
 KG7bILfnWDaK2C5jH1KRXDx+sBJPmXozEHQNGcTFg5lwj/I3cwK3f5Zd9Ue/Rc5ULPr51cluG
 EafNOGW2YcKuxv65QwvJi5yWbulyM3rzZvL7blRAZ6v2EgnastUOd9tCrN0c1qCJiPW3ONwv1
 N2uqGQFBc86JXtWuMj/FAFffRAE+rtJb88tpiRKiIr1OU4VZLqMbo+qZ6HDdd+dn/OdU02ICo
 kwS/mgwRIWiw9dd0+YpsDPpY8mZNdwdu3DKcIu9FWZ5hS5+7WMG6GI5ibssFNIHW/dtJ/9EZq
 tM9zsI6DHxpBJKSdDFvQSofMTmyq0XEsir/97p419gSYdGwGnrjXGra4Hgq/yj6RZqhuCHkmk
 OnShVdkhq/Ea61O99oV3igtTQEvRUnYD5ROzm6jw8dhHzXqxREzHQoyALhIlEgc+9Qd/HJdO5
 Qz6RpohQNQ8OVTWCerAGrhfGljq+vsQ1TtH1D7B1GbWsfln3syfIHeuUQMuLgvkFaSzxLbu9J
 7y3IQyERyXCY9KQSWbw818nBV67n2+vmhg+yt/izfEzn3JVUZnhe2rlAc248XhFiABMMFoxku
 Fq4dVKWlPyLPkaTvvB42nek9+AUZQ4+JSxAZBD9MiZa9UlAy15MCQeMRcYYXtorL4R3i0r7/x
 HG127E+pCUkX6S3elNvFFseBvYk1uTWT4LvezKtkHvVUeF5gVtXN+lAQclpLt5bg7evh2oeOI
 uaBOkVPRnLcVq1Q2YM2TJuqeW1LNIhmld7b62MNREwJk23QjHn0K8YHuoBvJpWwkpa7qu4bfb
 1w0y+tyx1h7scrn6HlGvomzQZVB87qXMJ+8Ox1XGcJZcJ4GGCfV1zwQTNhNJzBP82glZxn3JF
 kqTjal/WbjTmL70lXZYY40uuAFabhAhwYrkocsV3011sD4VeP2j2UF5mJKRSDOHIBp/2RG3wK
 0IidPtkU7ULDFhmsgdAw8/RxqSgo9Q8Ql8cIHvGVl5QgXdPOGXFpLwoixOqDBzsx7a8Ya55/0
 dckNNPS6kXRh5yG0E
Subject: [Nouveau] nouveau: BUG: Invalid wait context
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
Cc: nouveau <nouveau@lists.freedesktop.org>, Ben Skeggs <bskeggs@redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

Greetings,

Box is an aging generic i4790 + GTX-980 desktop.

[ 1143.133663] =============================
[ 1143.133666] [ BUG: Invalid wait context ]
[ 1143.133671] 5.9.0.g34d4ddd-preempt #2 Tainted: G S          E
[ 1143.133675] -----------------------------
[ 1143.133678] X/2015 is trying to lock:
[ 1143.133682] ffff8d3e9efd63d8 (&zone->lock){..-.}-{3:3}, at: get_page_from_freelist+0x6ed/0x1e10
[ 1143.133694] other info that might help us debug this:
[ 1143.133697] context-{5:5}
[ 1143.133700] 4 locks held by X/2015:
[ 1143.133703]  #0: ffff8d3e562d30c0 (&cli->mutex){+.+.}-{4:4}, at: nouveau_abi16_get+0x2c/0x60 [nouveau]
[ 1143.133756]  #1: ffffa9a6c0c57d30 (reservation_ww_class_acquire){+.+.}-{0:0}, at: drm_ioctl_kernel+0x91/0xe0 [drm]
[ 1143.133785]  #2: ffff8d3e3dcef1a0 (reservation_ww_class_mutex){+.+.}-{4:4}, at: nouveau_gem_ioctl_pushbuf+0x63b/0x1cb0 [nouveau]
[ 1143.133834]  #3: ffff8d3e9ec9ea10 (krc.lock){-.-.}-{2:2}, at: kvfree_call_rcu+0x65/0x210
[ 1143.133845] stack backtrace:
[ 1143.133850] CPU: 2 PID: 2015 Comm: X Kdump: loaded Tainted: G S          E     5.9.0.g34d4ddd-preempt #2
[ 1143.133856] Hardware name: MEDION MS-7848/MS-7848, BIOS M7848W08.20C 09/23/2013
[ 1143.133862] Call Trace:
[ 1143.133872]  dump_stack+0x77/0x9b
[ 1143.133879]  __lock_acquire+0x629/0xbd0
[ 1143.133887]  ? try_to_wake_up+0x250/0x860
[ 1143.133894]  lock_acquire+0x92/0x390
[ 1143.133900]  ? get_page_from_freelist+0x6ed/0x1e10
[ 1143.133908]  ? __mutex_unlock_slowpath+0x124/0x280
[ 1143.133915]  _raw_spin_lock+0x2f/0x40
[ 1143.133921]  ? get_page_from_freelist+0x6ed/0x1e10
[ 1143.133927]  get_page_from_freelist+0x6ed/0x1e10
[ 1143.133937]  ? lock_acquire+0x92/0x390
[ 1143.133943]  ? kvfree_call_rcu+0x65/0x210
[ 1143.133949]  __alloc_pages_nodemask+0x173/0x3e0
[ 1143.133957]  __get_free_pages+0xd/0x40
[ 1143.133962]  kvfree_call_rcu+0x135/0x210
[ 1143.134002]  nouveau_fence_unref+0x36/0x50 [nouveau]
[ 1143.134045]  validate_fini_no_ticket.isra.8+0x138/0x240 [nouveau]
[ 1143.134090]  nouveau_gem_ioctl_pushbuf+0x10c8/0x1cb0 [nouveau]
[ 1143.134136]  ? nouveau_gem_ioctl_new+0xc0/0xc0 [nouveau]
[ 1143.134159]  ? drm_ioctl_kernel+0x91/0xe0 [drm]
[ 1143.134170]  drm_ioctl_kernel+0x91/0xe0 [drm]
[ 1143.134182]  drm_ioctl+0x2db/0x380 [drm]
[ 1143.134211]  ? nouveau_gem_ioctl_new+0xc0/0xc0 [nouveau]
[ 1143.134217]  ? _raw_spin_unlock_irqrestore+0x47/0x60
[ 1143.134222]  ? lockdep_hardirqs_on+0x78/0x100
[ 1143.134226]  ? _raw_spin_unlock_irqrestore+0x34/0x60
[ 1143.134257]  nouveau_drm_ioctl+0x56/0xb0 [nouveau]
[ 1143.134263]  __x64_sys_ioctl+0x8e/0xd0
[ 1143.134267]  ? lockdep_hardirqs_on+0x78/0x100
[ 1143.134271]  do_syscall_64+0x33/0x40
[ 1143.134276]  entry_SYSCALL_64_after_hwframe+0x44/0xa9
[ 1143.134280] RIP: 0033:0x7f02e2a84ac7
[ 1143.134284] Code: b3 66 90 48 8b 05 d1 13 2c 00 64 c7 00 26 00 00 00 48 c7 c0 ff ff ff ff c3 66 2e 0f 1f 84 00 00 00 00 00 b8 10 00 00 00 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 8b 0d a1 13 2c 00 f7 d8 64 89 01 48
[ 1143.134293] RSP: 002b:00007ffe2c2739e8 EFLAGS: 00000246 ORIG_RAX: 0000000000000010
[ 1143.134298] RAX: ffffffffffffffda RBX: 0000560c3f86ec08 RCX: 00007f02e2a84ac7
[ 1143.134302] RDX: 00007ffe2c273a50 RSI: 00000000c0406481 RDI: 000000000000000e
[ 1143.134306] RBP: 00007ffe2c273a50 R08: 0000560c3f846820 R09: 0000560c3f87fc08
[ 1143.134310] R10: 0000560c401dbb38 R11: 0000000000000246 R12: 00000000c0406481
[ 1143.134314] R13: 000000000000000e R14: 0000560c3f846820 R15: 0000560c3f84a010

_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
