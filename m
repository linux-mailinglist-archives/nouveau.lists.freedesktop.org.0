Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AEF8C24416D
	for <lists+nouveau@lfdr.de>; Fri, 14 Aug 2020 00:45:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 365676E29A;
	Thu, 13 Aug 2020 22:45:48 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com
 [IPv6:2a00:1450:4864:20::12d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE6096E29A
 for <nouveau@lists.freedesktop.org>; Thu, 13 Aug 2020 22:45:46 +0000 (UTC)
Received: by mail-lf1-x12d.google.com with SMTP id d2so3887007lfj.1
 for <nouveau@lists.freedesktop.org>; Thu, 13 Aug 2020 15:45:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:subject:date:user-agent:mime-version
 :content-transfer-encoding:content-disposition:message-id;
 bh=ZkisQZWNAbS7tpvWaiO+nodeRH4e3fy9s7KOSS4PCdM=;
 b=K9hfjwDVN9kXjRW9XCVMrwHssyEUThcJwldG6XpfScsWPhz0BZummZEGNnLnRLhXX6
 D+cIDBBxEcX469ULUOXQ4tDtwKIrBxSJukULmHGR2Mf0DV6d3RS6DdXEybFfSUolABsv
 MXVqhgNFP4vYN6Y+U1u20m84ObYQ3ERUqk4VuyNR2lwo8SU3ZVJ/RseEBG8qtl1cJhw5
 R4BAbEfplvmA0/ez2j6arzVCfdO3BIDVofNRLhIcMXfX9i5WUrft+ez4fWID3ZqL/ZC4
 nGPHOxMpsToNnPG4ul/SvI/5QgqxDysFmxSn6bjXgU69J7vPw7zvl3bK07aLuJB0CXNL
 EONA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:user-agent:mime-version
 :content-transfer-encoding:content-disposition:message-id;
 bh=ZkisQZWNAbS7tpvWaiO+nodeRH4e3fy9s7KOSS4PCdM=;
 b=No5KuHRa4Z7AA+Z4z93SZLgWA2syTVI6NvU1EJntkjGVt4q8cnIg+jof01bhFFk/i4
 87ovol8vY1BXjZawsphBZyUnpNQ0snI+fz0qQFYSz6xXqaKmlltZ21cuq0HoIEn72DMH
 SUD4GR2ep9aRe9p6swSo/PGBrFDRxNqF3KQspgqokdl3wuw+4gQ8/+tUfmSBE3Yk7UdY
 giY0i1mNV+zqLhLI+Vr+Wbb2UNPq9y0fz5zqeSg6VvD7ai1+U6eoiSYSBNecio7cfGiJ
 WjmFqruP58CZ+WiYrS2d0mNDfrvGAg562L5aptKV99C0aAuk2Y/dW882CTMEGSZXN8Af
 VxLQ==
X-Gm-Message-State: AOAM533jjuNSrQAcE22LTqlmQUCML+qaLbxkXmWkVSeizBgazsV8C7Uc
 mA9HqOUX1PnIWx+ZSyKrL+pVkCcNHOk=
X-Google-Smtp-Source: ABdhPJzDzu3j/LuAxGj1DEL6GL8pvcp/ny+MAZ8rjm7rTRWn0r/xMT24W3BbZKJ+xs0l15YS2xxC3w==
X-Received: by 2002:a19:189:: with SMTP id 131mr3280479lfb.128.1597358744052; 
 Thu, 13 Aug 2020 15:45:44 -0700 (PDT)
Received: from [192.168.1.100] ([176.116.252.109])
 by smtp.gmail.com with ESMTPSA id 10sm1363653ljn.22.2020.08.13.15.45.43
 for <nouveau@lists.freedesktop.org>
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 13 Aug 2020 15:45:43 -0700 (PDT)
From: Andrew Randrianasulu <randrianasulu@gmail.com>
To: nouveau@lists.freedesktop.org
Date: Fri, 14 Aug 2020 01:36:32 +0300
User-Agent: KMail/1.9.10
MIME-Version: 1.0
Content-Disposition: inline
Message-Id: <202008140136.33013.randrianasulu@gmail.com>
Subject: [Nouveau] Accumulating CPU load from Xorg process with DRI3
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

I observed this bug for quite some time, but so far I workarounded it
with just setting DRI2 (default) in xorg.conf.d/20-nouveau.conf 

Now with two GPU i iwsh to use DRI3, so right now it set up like this:

cat /etc/X11/xorg.conf.d/20-nouveau.conf
Section "Device"
    Identifier "Card0"
    Driver "nouveau"
    Option "PageFlip" "1"
    #Option "AccelMethod" "glamor"
    Option       "DRI"           "3"

But just after two hours of uptime X already eating some CPU:


op - 01:30:49 up  2:45,  1 user,  load average: 1,12, 0,93, 0,84
Tasks: 210 total,   1 running, 209 sleeping,   0 stopped,   0 zombie
%Cpu(s): 12,1 us,  3,9 sy,  0,0 ni, 81,7 id,  0,7 wa,  0,0 hi,  1,6 si,  0,0 st
MiB Mem :  11875,3 total,   6416,4 free,   1634,8 used,   3824,1 buff/cache
MiB Swap:   1145,0 total,   1145,0 free,      0,0 used.   9969,7 avail Mem

  PID USER      PR  NI    VIRT    RES    SHR S  %CPU  %MEM     TIME+ COMMAND
 1198 root      20   0  146160  78828  28160 S  35,8   0,6  30:41.37 Xorg
 1285 guest     20   0   59776  17332  13756 S  11,6   0,1  16:12.83 xmms
 4006 guest     20   0 1743952 919312 120628 S  10,9   7,6  20:51.01 seamonkey
 1278 guest     20   0  101508  48528  30496 S   3,0   0,4   4:03.21 ktorrent
 1274 guest     20   0   43368  31784  23684 S   2,0   0,3   0:29.43 konsole
 1259 guest     20   0   43092  28232  23640 S   1,3   0,2   0:21.53 kicker
 1255 guest     20   0    6560   4160   2720 S   1,0   0,0   1:00.90 kompmgr
 1293 guest     20   0   40164  21328  18636 S   1,0   0,2   1:30.50 gkrellm
 1254 guest     20   0   31616  21832  18944 S   0,7   0,2   0:06.49 kwin

in ~1 day it will eat full core from my AMD FX-4300 and X will become sluggish ...

I tried to trace it with operf 1.2.0:

operf --pid 1198 

operf: Press Ctl-c or 'kill -SIGINT 7787' to stop profiling
operf: Profiler started
^C
Profiling done.

root@slax:~# opreport
Using /root/oprofile_data/samples/ for samples directory.
CPU: AMD64 family15h, speed 3800 MHz (estimated)
Counted CPU_CLK_UNHALTED events (CPU Clocks not Halted) with a unit mask of 0x00 (No unit mask) count 100000
CPU_CLK_UNHALT...|
  samples|      %|
------------------
    78166 100.000 Xorg
        CPU_CLK_UNHALT...|
          samples|      %|
        ------------------
            62905 80.4762 nouveau_drv.so
             5648  7.2256 kallsyms
             4186  5.3553 Xorg
             1419  1.8154 libpixman-1.so.0.38.0
             1038  1.3279 nouveau
              687  0.8789 libc-2.30.so
              632  0.8085 libexa.so
              510  0.6525 libdrm_nouveau.so.2.0.0
              402  0.5143 libfb.so
              259  0.3313 drm
              230  0.2942 ttm
              108  0.1382 libpthread-2.30.so
               47  0.0601 libdrm.so.2.4.0
               34  0.0435 [vdso] (tgid:1198 range:0xf7fbf000-0xf7fbffff)
               27  0.0345 evdev_drv.so
                7  0.0090 snd_hda_codec
                5  0.0064 r8169
                5  0.0064 snd_pcm
                5  0.0064 libXfont2.so.2.0.0
                3  0.0038 snd_aloop
                3  0.0038 libglx.so
                2  0.0026 kvm
                2  0.0026 snd_timer
                1  0.0013 snd_hda_core
                1  0.0013 snd_hda_intel

so, nouveau_drv itself is major CPU eater ....

I'll try to rebuild it with debug symbols enabled, and hopefully it will be enough
for at least seeing who eats all those cycles ....

Sorry for so many emails, just i keep discovering new bugs as I try new things!
_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
