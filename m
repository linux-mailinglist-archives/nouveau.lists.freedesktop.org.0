Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8339A12B2A7
	for <lists+nouveau@lfdr.de>; Fri, 27 Dec 2019 09:14:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF27E89A76;
	Fri, 27 Dec 2019 08:13:33 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-yw1-xc43.google.com (mail-yw1-xc43.google.com
 [IPv6:2607:f8b0:4864:20::c43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 62CF46E0E8
 for <nouveau@lists.freedesktop.org>; Wed,  2 Oct 2019 21:07:54 +0000 (UTC)
Received: by mail-yw1-xc43.google.com with SMTP id e205so218711ywc.7
 for <nouveau@lists.freedesktop.org>; Wed, 02 Oct 2019 14:07:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=T2JVXi2n7aIjQPfd/y2Qza7rCOQAGt2XVrhneTlTFqk=;
 b=a48bnacKL3bHQCAPTzjpwOWeh35mQfcT2+1l7mws8a+hPVifJauAclcUDowffjOciD
 7uzBDNymTolORf/fs9l5zGGzRzz1hSg5yfarrk9unbU0agAgkyHjNdV3ca808h83hVDC
 ZA1LnWCehKYL3I+DIx90V/bnighUg2HmkiHF3mnXA6EWwd/FZPqiJolqmmcQqE/499oN
 JR4bJoR0fgCl2zzIeZ9BkOiXp5m1FinDcASY+l3yvJgazfbBMi1M1GskUfbZPFh0l8Yh
 7FdZxNMS7krkjz8dI7du0pR8FAcyCuE7SyvDXqOi1NeqBG+KoqNaZ0sB8BP/lu+hpQQI
 IcNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=T2JVXi2n7aIjQPfd/y2Qza7rCOQAGt2XVrhneTlTFqk=;
 b=qJDz5MQCpeTrYZgz61WQWv6miZp0H5nuhjcm6aPPLY+zxDlmag0w6JMm0zpk36O+D6
 siNB+Wqj5aEP2Hl3UJhAIb9VIugb+ZYq07BDhBDizpdXNE0JyYOupY5LfzBXZ9G/oOzU
 7BMiOvP/FMMN13Del2AWJBRPklgqALkREWTZJeEjN7WHx0xPXIRyrQPZ2SzR0F0zxRkr
 e6XXmLAPDiDMQk0BO60CwHswSbPXAsdMj3pE5e0j08RElBNsgAddLs3J/dxvgHwPgKJN
 fw+qEF7RBqOE3CtaptchaeP8eGDPQaLmh+6Zxa7UpQtTvlc1ojBRfrdqZ0Jtw42f3zqJ
 5v1g==
X-Gm-Message-State: APjAAAVeA4TM2sGz2USixAlSQIpmtsPaV4B9ARRikdHJGKqEDPOFvKE/
 d9ATxOtQaurQu6t3zHDUx/q7+i4mOsI=
X-Google-Smtp-Source: APXvYqyLKx+kkY+wuTy86SoPKa6xoVoAlsiAqUo/BGkcHwaTGqeptog/1/EbNBH3HxB/C2k5FnXr9A==
X-Received: by 2002:a81:698b:: with SMTP id e133mr3952381ywc.415.1570050473038; 
 Wed, 02 Oct 2019 14:07:53 -0700 (PDT)
Received: from mail-yw1-f53.google.com (mail-yw1-f53.google.com.
 [209.85.161.53])
 by smtp.gmail.com with ESMTPSA id 80sm107708ywp.56.2019.10.02.14.07.52
 for <nouveau@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 02 Oct 2019 14:07:52 -0700 (PDT)
Received: by mail-yw1-f53.google.com with SMTP id x64so227541ywg.3
 for <nouveau@lists.freedesktop.org>; Wed, 02 Oct 2019 14:07:52 -0700 (PDT)
X-Received: by 2002:a81:6f8a:: with SMTP id k132mr4013325ywc.275.1570050020507; 
 Wed, 02 Oct 2019 14:00:20 -0700 (PDT)
MIME-Version: 1.0
References: <00000000000051e9280593f2dc9f@google.com>
In-Reply-To: <00000000000051e9280593f2dc9f@google.com>
From: Willem de Bruijn <willemdebruijn.kernel@gmail.com>
Date: Wed, 2 Oct 2019 16:59:44 -0400
X-Gmail-Original-Message-ID: <CA+FuTSedj9+UJKLfuER+FuEmQvWNqsDfO5i+Z6vit0OoLv=NLA@mail.gmail.com>
Message-ID: <CA+FuTSedj9+UJKLfuER+FuEmQvWNqsDfO5i+Z6vit0OoLv=NLA@mail.gmail.com>
To: syzbot <syzbot+3f3e5e77d793c7a6fe6c@syzkaller.appspotmail.com>
X-Mailman-Approved-At: Fri, 27 Dec 2019 08:13:31 +0000
Subject: Re: [Nouveau] general protection fault in veth_get_stats64
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
Cc: songliubraving@fb.com, Jakub Kicinski <jakub.kicinski@netronome.com>,
 airlied@linux.ie, John Fastabend <john.fastabend@gmail.com>,
 Alexei Starovoitov <ast@kernel.org>, dri-devel@lists.freedesktop.org,
 guoren@kernel.org, f.fainelli@gmail.com, wanghai26@huawei.com,
 Daniel Borkmann <daniel@iogearbox.net>, toshiaki.makita1@gmail.com,
 jwi@linux.ibm.com, bskeggs@redhat.com, nouveau@lists.freedesktop.org,
 Yonghong Song <yhs@fb.com>, yuehaibing@huawei.com, hawk@kernel.org,
 syzkaller-bugs@googlegroups.com, idosch@mellanox.com, jiri@mellanox.com,
 kimbrownkd@gmail.com, petrm@mellanox.com, tglx@linutronix.de,
 andriy.shevchenko@linux.intel.com,
 Network Development <netdev@vger.kernel.org>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 David Miller <davem@davemloft.net>, daniel@ffwll.ch,
 David Ahern <dsahern@gmail.com>, bpf <bpf@vger.kernel.org>,
 torvalds@linux-foundation.org, Martin Lau <kafai@fb.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

On Wed, Oct 2, 2019 at 3:56 PM syzbot
<syzbot+3f3e5e77d793c7a6fe6c@syzkaller.appspotmail.com> wrote:
>
> Hello,
>
> syzbot found the following crash on:
>
> HEAD commit:    a32db7e1 Add linux-next specific files for 20191002
> git tree:       linux-next
> console output: https://syzkaller.appspot.com/x/log.txt?x=175ab7cd600000
> kernel config:  https://syzkaller.appspot.com/x/.config?x=599cf05035799eef
> dashboard link: https://syzkaller.appspot.com/bug?extid=3f3e5e77d793c7a6fe6c
> compiler:       gcc (GCC) 9.0.0 20181231 (experimental)
> syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=12f8b943600000
> C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=16981a25600000
>
> The bug was bisected to:
>
> commit 84da111de0b4be15bd500deff773f5116f39f7be
> Author: Linus Torvalds <torvalds@linux-foundation.org>
> Date:   Sat Sep 21 17:07:42 2019 +0000
>
>      Merge tag 'for-linus-hmm' of
> git://git.kernel.org/pub/scm/linux/kernel/git/rdma/rdma
>
> bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=17c55847600000
> final crash:    https://syzkaller.appspot.com/x/report.txt?x=14255847600000
> console output: https://syzkaller.appspot.com/x/log.txt?x=10255847600000
>
> IMPORTANT: if you fix the bug, please add the following tag to the commit:
> Reported-by: syzbot+3f3e5e77d793c7a6fe6c@syzkaller.appspotmail.com
> Fixes: 84da111de0b4 ("Merge tag 'for-linus-hmm' of
> git://git.kernel.org/pub/scm/linux/kernel/git/rdma/rdma")
>
> RSP: 002b:00007fff0ba6c998 EFLAGS: 00000246 ORIG_RAX: 000000000000002e
> RAX: ffffffffffffffda RBX: 0000000000000003 RCX: 00000000004424a9
> RDX: 0000000000000000 RSI: 0000000020000140 RDI: 0000000000000003
> RBP: 0000000000000000 R08: 0000000000000002 R09: 0000000000000000
> R10: 0000000000000000 R11: 0000000000000246 R12: ffffffffffffffff
> R13: 0000000000000004 R14: 0000000000000000 R15: 0000000000000000
> kasan: CONFIG_KASAN_INLINE enabled
> kasan: GPF could be caused by NULL-ptr deref or user memory access
> general protection fault: 0000 [#1] PREEMPT SMP KASAN
> CPU: 1 PID: 8605 Comm: syz-executor330 Not tainted 5.4.0-rc1-next-20191002
> #0
> Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS
> Google 01/01/2011
> RIP: 0010:veth_stats_rx drivers/net/veth.c:322 [inline]
> RIP: 0010:veth_get_stats64+0x523/0x900 drivers/net/veth.c:356
> Code: 89 85 60 ff ff ff e8 6c 74 31 fd 49 63 c7 48 69 c0 c0 02 00 00 48 03
> 85 60 ff ff ff 48 8d b8 a0 01 00 00 48 89 fa 48 c1 ea 03 <42> 80 3c 32 00
> 0f 85 c9 02 00 00 48 8d b8 a8 01 00 00 48 8b 90 a0
> RSP: 0018:ffff88809996ed00 EFLAGS: 00010202
> RAX: 0000000000000000 RBX: 0000000000000001 RCX: ffffffff84418daf
> RDX: 0000000000000034 RSI: ffffffff84418e04 RDI: 00000000000001a0
> RBP: ffff88809996ede0 R08: ffff888093182180 R09: ffffed1013202d6a
> R10: ffffed1013202d69 R11: ffff888099016b4f R12: 0000000000000000
> R13: 0000000000000000 R14: dffffc0000000000 R15: 0000000000000000
> FS:  0000000001f4a880(0000) GS:ffff8880ae900000(0000) knlGS:0000000000000000
> CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> CR2: 0000000020000140 CR3: 000000009a80b000 CR4: 00000000001406e0
> DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
> DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
> Call Trace:
>   dev_get_stats+0x8e/0x280 net/core/dev.c:9220
>   rtnl_fill_stats+0x4d/0xac0 net/core/rtnetlink.c:1191
>   rtnl_fill_ifinfo+0x10ad/0x3af0 net/core/rtnetlink.c:1717
>   rtmsg_ifinfo_build_skb+0xc9/0x1a0 net/core/rtnetlink.c:3635
>   rtmsg_ifinfo_event.part.0+0x43/0xe0 net/core/rtnetlink.c:3667
>   rtmsg_ifinfo_event net/core/rtnetlink.c:3678 [inline]
>   rtmsg_ifinfo+0x8d/0xa0 net/core/rtnetlink.c:3676
>   __dev_notify_flags+0x235/0x2c0 net/core/dev.c:7757
>   rtnl_configure_link+0x175/0x250 net/core/rtnetlink.c:2968
>   __rtnl_newlink+0x10c4/0x16d0 net/core/rtnetlink.c:3285
>   rtnl_newlink+0x69/0xa0 net/core/rtnetlink.c:3325
>   rtnetlink_rcv_msg+0x463/0xb00 net/core/rtnetlink.c:5386
>   netlink_rcv_skb+0x177/0x450 net/netlink/af_netlink.c:2477
>   rtnetlink_rcv+0x1d/0x30 net/core/rtnetlink.c:5404
>   netlink_unicast_kernel net/netlink/af_netlink.c:1302 [inline]
>   netlink_unicast+0x531/0x710 net/netlink/af_netlink.c:1328
>   netlink_sendmsg+0x8a5/0xd60 net/netlink/af_netlink.c:1917
>   sock_sendmsg_nosec net/socket.c:638 [inline]
>   sock_sendmsg+0xd7/0x130 net/socket.c:658
>   ___sys_sendmsg+0x803/0x920 net/socket.c:2312
>   __sys_sendmsg+0x105/0x1d0 net/socket.c:2357
>   __do_sys_sendmsg net/socket.c:2366 [inline]
>   __se_sys_sendmsg net/socket.c:2364 [inline]
>   __x64_sys_sendmsg+0x78/0xb0 net/socket.c:2364
>   do_syscall_64+0xfa/0x760 arch/x86/entry/common.c:290
>   entry_SYSCALL_64_after_hwframe+0x49/0xbe
> RIP: 0033:0x4424a9
> Code: e8 9c 07 03 00 48 83 c4 18 c3 0f 1f 80 00 00 00 00 48 89 f8 48 89 f7
> 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff
> ff 0f 83 3b 0a fc ff c3 66 2e 0f 1f 84 00 00 00 00
> RSP: 002b:00007fff0ba6c998 EFLAGS: 00000246 ORIG_RAX: 000000000000002e
> RAX: ffffffffffffffda RBX: 0000000000000003 RCX: 00000000004424a9
> RDX: 0000000000000000 RSI: 0000000020000140 RDI: 0000000000000003
> RBP: 0000000000000000 R08: 0000000000000002 R09: 0000000000000000
> R10: 0000000000000000 R11: 0000000000000246 R12: ffffffffffffffff
> R13: 0000000000000004 R14: 0000000000000000 R15: 0000000000000000
> Modules linked in:
> ---[ end trace cc6dec8a4962bfff ]---
> RIP: 0010:veth_stats_rx drivers/net/veth.c:322 [inline]
> RIP: 0010:veth_get_stats64+0x523/0x900 drivers/net/veth.c:356
> Code: 89 85 60 ff ff ff e8 6c 74 31 fd 49 63 c7 48 69 c0 c0 02 00 00 48 03
> 85 60 ff ff ff 48 8d b8 a0 01 00 00 48 89 fa 48 c1 ea 03 <42> 80 3c 32 00
> 0f 85 c9 02 00 00 48 8d b8 a8 01 00 00 48 8b 90 a0
> RSP: 0018:ffff88809996ed00 EFLAGS: 00010202
> RAX: 0000000000000000 RBX: 0000000000000001 RCX: ffffffff84418daf
> RDX: 0000000000000034 RSI: ffffffff84418e04 RDI: 00000000000001a0
> RBP: ffff88809996ede0 R08: ffff888093182180 R09: ffffed1013202d6a
> R10: ffffed1013202d69 R11: ffff888099016b4f R12: 0000000000000000
> R13: 0000000000000000 R14: dffffc0000000000 R15: 0000000000000000
> FS:  0000000001f4a880(0000) GS:ffff8880ae900000(0000) knlGS:0000000000000000
> CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> CR2: 0000000020000140 CR3: 000000009a80b000 CR4: 00000000001406e0
> DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
> DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400

Syzbot CC:ed a lot of people directly on this report. Perhaps because
of the bisection?

Specific to the report: I think this may be introduced with the
alternative names for network interfaces patchset.

The reproducer

fails on      76c9ac0ee878 net: rtnetlink: add possibility to use
alternative names as message handle
passes on be2644aac3e1 tcp: add ipv6_addr_v4mapped_loopback() helper

Leaving

76c9ac0ee878 net: rtnetlink: add possibility to use alternative names
as message handle
cc6090e985d7 net: rtnetlink: introduce helper to get net_device
instance by ifname
7af12cba4ef0 net: rtnetlink: unify the code in __rtnl_newlink get dev
with the rest
88f4fb0c7496 net: rtnetlink: put alternative names to getlink message
36fbf1e52bd3 net: rtnetlink: add linkprop commands to add and delete
alternative ifnames
ff92741270bf net: introduce name_node struct to be used in hashlist
6958c97a488c net: procfs: use index hashlist instead of name hashlist
be2
_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
