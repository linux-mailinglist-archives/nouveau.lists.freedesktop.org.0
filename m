Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FC0C24557E
	for <lists+nouveau@lfdr.de>; Sun, 16 Aug 2020 04:49:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B363D6E1CD;
	Sun, 16 Aug 2020 02:49:31 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-vs1-f66.google.com (mail-vs1-f66.google.com
 [209.85.217.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1EF1E6E1CD
 for <nouveau@lists.freedesktop.org>; Sun, 16 Aug 2020 02:49:31 +0000 (UTC)
Received: by mail-vs1-f66.google.com with SMTP id y8so6578919vsq.8
 for <nouveau@lists.freedesktop.org>; Sat, 15 Aug 2020 19:49:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=iVnfxBX4YB7ZCshbd15QIUt4z10A6avX+Fnh4W9272k=;
 b=VfBHvti559677GwxvN9Lzqn/LY3bR7lhrvDi29oIcIRBFGmKgYI39nKVm76GW8kws9
 T91UX4jee6SYA62LTI+jwkk//3M+j8fO9PSLroCrfYaAdeU6Le0xqJq3WpQufPV1zk1p
 89tEnfjzq5namEnzgxFGK5YL4KZ28qvZv+0nVaRnEksXRxqJfztnhY0UyQTDKndcktv8
 iIbp4fCdwz0t8aBk2+IseKbErrsY/TNljFGCz9vDpNBiN92pEuj2satX6Xi8gjMoeRcB
 5smi0GmVWQwLUeukm+GZohv9O+XCej6Pmq+OVLcdrQfsXHHE5RJk/feFtnGEjjoHBCiy
 Fj0A==
X-Gm-Message-State: AOAM531VnTD6nPZT2jhQp2nXOuIaD3P4MDbbSTr2iDjwWO9rSzkG01iu
 x1GEjwmR/P964xDApF8JXdSq/MhGo6ZZ3utwlDA=
X-Google-Smtp-Source: ABdhPJzTym/V8sNO27RstWaHE+PlN21OBzZxL92KQUsEw+3CEz9fw/j6rftXjDiWd/l/+rdkShuy/E1il7ZEPPyw1Ao=
X-Received: by 2002:a67:1e81:: with SMTP id e123mr4759321vse.210.1597546170074; 
 Sat, 15 Aug 2020 19:49:30 -0700 (PDT)
MIME-Version: 1.0
References: <202008140136.33013.randrianasulu@gmail.com>
 <CAKb7UvjFzbjWOLhC+pQ-G5fUCt_HAYw0xvtabQVKn1apx3mWPw@mail.gmail.com>
In-Reply-To: <CAKb7UvjFzbjWOLhC+pQ-G5fUCt_HAYw0xvtabQVKn1apx3mWPw@mail.gmail.com>
From: Ilia Mirkin <imirkin@alum.mit.edu>
Date: Sat, 15 Aug 2020 22:49:19 -0400
Message-ID: <CAKb7UvjdnxU2Bd=Fj0BFEZA9SWc0DxHzSW-_ttgbcXKE_BVoqA@mail.gmail.com>
To: Andrew Randrianasulu <randrianasulu@gmail.com>
Subject: Re: [Nouveau] Accumulating CPU load from Xorg process with DRI3
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
Cc: nouveau <nouveau@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

I've tracked down at least one source of these, which is that we don't
handle drmWaitVBlank errors properly in the PRESENT logic (which would
be used in conjunction with DRI3). These errors, broadly, will happen
while strings are turned off and/or in DPMS sleep. Did your monitors
go to sleep while a video was playing? If not, there's another path
for it to happen...

Cheers,

  -ilia

On Thu, Aug 13, 2020 at 6:47 PM Ilia Mirkin <imirkin@alum.mit.edu> wrote:
>
> I'm aware of this issue, and am experiencing it myself.
>
> The issue is that drmmode_event_handler takes up more and more CPU
> time. It seems like some events are being "left behind". I haven't had
> time to debug it further yet though.
>
> I also have DRI3 enabled, but only very rarely do I make use of my
> secondary GPUs, and I'm pretty sure I've seen the problem happen
> without any PRIME usage.
>
> Cheers,
>
>   -ilia
>
> On Thu, Aug 13, 2020 at 6:45 PM Andrew Randrianasulu
> <randrianasulu@gmail.com> wrote:
> >
> > I observed this bug for quite some time, but so far I workarounded it
> > with just setting DRI2 (default) in xorg.conf.d/20-nouveau.conf
> >
> > Now with two GPU i iwsh to use DRI3, so right now it set up like this:
> >
> > cat /etc/X11/xorg.conf.d/20-nouveau.conf
> > Section "Device"
> >     Identifier "Card0"
> >     Driver "nouveau"
> >     Option "PageFlip" "1"
> >     #Option "AccelMethod" "glamor"
> >     Option       "DRI"           "3"
> >
> > But just after two hours of uptime X already eating some CPU:
> >
> >
> > op - 01:30:49 up  2:45,  1 user,  load average: 1,12, 0,93, 0,84
> > Tasks: 210 total,   1 running, 209 sleeping,   0 stopped,   0 zombie
> > %Cpu(s): 12,1 us,  3,9 sy,  0,0 ni, 81,7 id,  0,7 wa,  0,0 hi,  1,6 si,  0,0 st
> > MiB Mem :  11875,3 total,   6416,4 free,   1634,8 used,   3824,1 buff/cache
> > MiB Swap:   1145,0 total,   1145,0 free,      0,0 used.   9969,7 avail Mem
> >
> >   PID USER      PR  NI    VIRT    RES    SHR S  %CPU  %MEM     TIME+ COMMAND
> >  1198 root      20   0  146160  78828  28160 S  35,8   0,6  30:41.37 Xorg
> >  1285 guest     20   0   59776  17332  13756 S  11,6   0,1  16:12.83 xmms
> >  4006 guest     20   0 1743952 919312 120628 S  10,9   7,6  20:51.01 seamonkey
> >  1278 guest     20   0  101508  48528  30496 S   3,0   0,4   4:03.21 ktorrent
> >  1274 guest     20   0   43368  31784  23684 S   2,0   0,3   0:29.43 konsole
> >  1259 guest     20   0   43092  28232  23640 S   1,3   0,2   0:21.53 kicker
> >  1255 guest     20   0    6560   4160   2720 S   1,0   0,0   1:00.90 kompmgr
> >  1293 guest     20   0   40164  21328  18636 S   1,0   0,2   1:30.50 gkrellm
> >  1254 guest     20   0   31616  21832  18944 S   0,7   0,2   0:06.49 kwin
> >
> > in ~1 day it will eat full core from my AMD FX-4300 and X will become sluggish ...
> >
> > I tried to trace it with operf 1.2.0:
> >
> > operf --pid 1198
> >
> > operf: Press Ctl-c or 'kill -SIGINT 7787' to stop profiling
> > operf: Profiler started
> > ^C
> > Profiling done.
> >
> > root@slax:~# opreport
> > Using /root/oprofile_data/samples/ for samples directory.
> > CPU: AMD64 family15h, speed 3800 MHz (estimated)
> > Counted CPU_CLK_UNHALTED events (CPU Clocks not Halted) with a unit mask of 0x00 (No unit mask) count 100000
> > CPU_CLK_UNHALT...|
> >   samples|      %|
> > ------------------
> >     78166 100.000 Xorg
> >         CPU_CLK_UNHALT...|
> >           samples|      %|
> >         ------------------
> >             62905 80.4762 nouveau_drv.so
> >              5648  7.2256 kallsyms
> >              4186  5.3553 Xorg
> >              1419  1.8154 libpixman-1.so.0.38.0
> >              1038  1.3279 nouveau
> >               687  0.8789 libc-2.30.so
> >               632  0.8085 libexa.so
> >               510  0.6525 libdrm_nouveau.so.2.0.0
> >               402  0.5143 libfb.so
> >               259  0.3313 drm
> >               230  0.2942 ttm
> >               108  0.1382 libpthread-2.30.so
> >                47  0.0601 libdrm.so.2.4.0
> >                34  0.0435 [vdso] (tgid:1198 range:0xf7fbf000-0xf7fbffff)
> >                27  0.0345 evdev_drv.so
> >                 7  0.0090 snd_hda_codec
> >                 5  0.0064 r8169
> >                 5  0.0064 snd_pcm
> >                 5  0.0064 libXfont2.so.2.0.0
> >                 3  0.0038 snd_aloop
> >                 3  0.0038 libglx.so
> >                 2  0.0026 kvm
> >                 2  0.0026 snd_timer
> >                 1  0.0013 snd_hda_core
> >                 1  0.0013 snd_hda_intel
> >
> > so, nouveau_drv itself is major CPU eater ....
> >
> > I'll try to rebuild it with debug symbols enabled, and hopefully it will be enough
> > for at least seeing who eats all those cycles ....
> >
> > Sorry for so many emails, just i keep discovering new bugs as I try new things!
> > _______________________________________________
> > Nouveau mailing list
> > Nouveau@lists.freedesktop.org
> > https://lists.freedesktop.org/mailman/listinfo/nouveau
_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
