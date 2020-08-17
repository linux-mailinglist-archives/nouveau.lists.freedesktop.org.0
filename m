Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 51862245BC1
	for <lists+nouveau@lfdr.de>; Mon, 17 Aug 2020 06:52:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D91E96E04E;
	Mon, 17 Aug 2020 04:52:05 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com
 [IPv6:2a00:1450:4864:20::231])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 02EFE6E04E
 for <nouveau@lists.freedesktop.org>; Mon, 17 Aug 2020 04:52:04 +0000 (UTC)
Received: by mail-lj1-x231.google.com with SMTP id t23so16011174ljc.3
 for <nouveau@lists.freedesktop.org>; Sun, 16 Aug 2020 21:52:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:subject:date:user-agent:mime-version
 :content-transfer-encoding:content-disposition:message-id;
 bh=ZnoeTggtyJMV6vSNL52s4FQFlrvZqgy6JJ5BKITdqJ4=;
 b=QJM7IpCSnEzdHzDbezw2nXDHFSQKiBZ/VTknskzaRWoOVfZPuZcHZlZ+79z74JNGXu
 0bADgyMJplp0peraEl4UhPm8xyKX4sM8Y2cmA5/J3EpTEw9/HVwh+75gXa4O8uw9W+ov
 i7Zteq9p6KMCPv1cfcpIfv1dHMGmoyNgsCNMqJxkTVw+AE7E8BXySljhtNj47VWX54lI
 26hv2YePNFaEhwGUodfo9XpNE4y/9NKOI2gvuAin4ilG8+M60l8WwdnDTTmlKulzRlD1
 OpkFCgAogZXDJbzm1u5Y6BLGZgd3M7mu1o4Qc1YDrTHkaJtM1dRJ7zRfx1ok9G5Ro26R
 O/zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:user-agent:mime-version
 :content-transfer-encoding:content-disposition:message-id;
 bh=ZnoeTggtyJMV6vSNL52s4FQFlrvZqgy6JJ5BKITdqJ4=;
 b=M4+JyfNdpZt3DvRrQ/JpE6FLRK3KfLW4OMOruCTteqUouPtP/8ML9njmBuhA9eNirw
 2PWybE+GKo6O97e0hA1GtwKctxokBOEoEEqBrhcbShVqiMcgGmmiIWJelanRU5F36EjM
 quXxxVLSSc6Z5wWYawlE3opiwZ26jaS3l3fou7qe/wHgV8O4M2jAc8A3wrCf0F8EH3Oz
 bHjArcA9q25S1NZ6dONN6bgMsLFiGsXbHSLwEbNFFG6PQm7FDWzY8EXKnshVIMtKsvZ1
 2TBk2tBbsCmerU0YfCNg7+zCIYZ5H9t1q8ELDaWXL5Cy7K2NsDtIeEyLTAGWqVHT+0SL
 HvFg==
X-Gm-Message-State: AOAM5314v9lrnIBPamCEJ69KUi1e13MZlyYALs5u/HEfw02yDQsML0CP
 7A1ACzQggoxJhJXCJWmhxyc8zhsZcad4FA==
X-Google-Smtp-Source: ABdhPJw5t/0Sj5E2lUn0ySP0BX9SS+3GEpwZi7+pXp5jt3HPKj8qT9iVeTYeWK6VF07P02dFV3uVmg==
X-Received: by 2002:a2e:9284:: with SMTP id d4mr6286120ljh.64.1597639922792;
 Sun, 16 Aug 2020 21:52:02 -0700 (PDT)
Received: from [192.168.1.100] ([176.116.252.109])
 by smtp.gmail.com with ESMTPSA id t18sm5030040lfb.69.2020.08.16.21.52.01
 for <nouveau@lists.freedesktop.org>
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Sun, 16 Aug 2020 21:52:01 -0700 (PDT)
From: Andrew Randrianasulu <randrianasulu@gmail.com>
To: nouveau@lists.freedesktop.org
Date: Mon, 17 Aug 2020 07:42:41 +0300
User-Agent: KMail/1.9.10
MIME-Version: 1.0
Content-Disposition: inline
Message-Id: <202008170742.42032.randrianasulu@gmail.com>
Subject: [Nouveau] qemu -display sdl,gl=on also eats CPU
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

I was testing Ilia's patches for ddx, and while they definitely helped for Xorg itself, 
qemu still eats a lot of CPU if launched like this

qemu-system-x86_64 -cdrom ~/Downloads/ISO/slax-English-US-7.0.8-x86_64.iso -m 1G -display sdl,gl=on -enable-kvm

and left for few hours.

top - 07:38:01 up 18:05,  2 users,  load average: 2,00, 1,89, 1,83
Tasks: 224 total,   3 running, 221 sleeping,   0 stopped,   0 zombie
%Cpu(s): 40,6 us,  6,1 sy,  0,3 ni, 49,2 id,  0,8 wa,  0,0 hi,  2,9 si,  0,0 st
MiB Mem :  11875,3 total,   3535,7 free,   3339,3 used,   5000,3 buff/cache
MiB Swap:   1145,0 total,   1131,2 free,     13,8 used.   4874,7 avail Mem

  PID USER      PR  NI    VIRT    RES    SHR S  %CPU  %MEM     TIME+ COMMAND
 6215 guest     20   0 1455160 951768  45560 R  99,3   7,8 710:44.44 qemu-system-x86
12655 guest     20   0 2459848   1,5g 126708 R  59,1  12,6 217:53.21 seamonkey
 1991 root      20   0  178112 109500  28840 S  20,9   0,9 187:20.05 Xorg
 2068 guest     20   0  104932  51660  30764 S   5,6   0,4  54:08.99 ktorrent
 6031 root      20   0       0      0      0 I   2,0   0,0   0:20.24 kworker/0:3-events
 3697 guest     20   0  382432  20308  13696 S   1,7   0,2  91:38.13 xmms
 2064 guest     20   0   55868  37048  23976 S   1,3   0,3   2:38.47 konsole
 2319 guest     20   0   40160  21248  18548 S   1,3   0,2  12:36.63 gkrellm
 5853 root      20   0       0      0      0 I   0,7   0,0   0:07.21 kworker/2:2-events

opreport after  operf --pid 6215 said:

opreport
Using /home/guest/botva/src/xf86-video-nouveau/oprofile_data/samples/ for samples directory.
CPU: AMD64 family15h, speed 3800 MHz (estimated)
Counted CPU_CLK_UNHALTED events (CPU Clocks not Halted) with a unit mask of 0x00 (No unit mask) count 100000
CPU_CLK_UNHALT...|
  samples|      %|
------------------
   260163 100.000 qemu-system-x86_64
        CPU_CLK_UNHALT...|
          samples|      %|
        ------------------
           144120 55.3960 nouveau_dri.so
            87990 33.8211 libdrm_nouveau.so.2.0.0
            11783  4.5291 libpixman-1.so.0.38.0
             7884  3.0304 kallsyms
             5310  2.0410 libc-2.30.so
              689  0.2648 ld-2.30.so
              519  0.1995 nouveau
              501  0.1926 qemu-system-x86_64
              456  0.1753 ttm
              239  0.0919 kvm
              211  0.0811 kvm_amd
               81  0.0311 libpthread-2.30.so
               76  0.0292 drm
               49  0.0188 libSDL2-2.0.so.0.12.0
               43  0.0165 libxcb.so.1.1.0
               36  0.0138 libGL.so.1.2.0
               31  0.0119 libX11.so.6.3.0
               24  0.0092 snd_pcm
               23  0.0088 snd_hda_codec
               20  0.0077 libglib-2.0.so.0.5800.1
               11  0.0042 snd_timer
                9  0.0035 libglapi.so.0.0.0
                8  0.0031 libdrm.so.2.4.0
                7  0.0027 snd_aloop
                7  0.0027 snd_hda_intel
                7  0.0027 libxshmfence.so.1.0.0
                7  0.0027 libgcc_s.so.1
                5  0.0019 [vdso] (tgid:6215 range:0xf7f9f000-0xf7f9ffff)
                5  0.0019 snd_hda_core
                4  0.0015 r8169
                3  0.0012 libahci
                2 7.7e-04 ohci_hcd
                2 7.7e-04 libxcb-present.so.0.0.0
                1 3.8e-04 libatomic.so.1.1.0

so, may be similar fix needed for mesa, too?

ow, I started it in ddx src directory :} need to cleanup there. But at least data is 100

_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
