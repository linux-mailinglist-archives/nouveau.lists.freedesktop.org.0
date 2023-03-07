Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 25DE76AE8BF
	for <lists+nouveau@lfdr.de>; Tue,  7 Mar 2023 18:18:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0151A10E145;
	Tue,  7 Mar 2023 17:18:44 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-oo1-xc2d.google.com (mail-oo1-xc2d.google.com
 [IPv6:2607:f8b0:4864:20::c2d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DDF8410E1D6
 for <nouveau@lists.freedesktop.org>; Tue,  7 Mar 2023 17:18:41 +0000 (UTC)
Received: by mail-oo1-xc2d.google.com with SMTP id
 p8-20020a4a3c48000000b0052527a9d5f0so2141177oof.1
 for <nouveau@lists.freedesktop.org>; Tue, 07 Mar 2023 09:18:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1678209521;
 h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=/HMBfX07KVRWkQ0kOyT2/vOgE9Jf6P/W9PmITfPmKps=;
 b=jxochXknDZlvSl7JrHD1M+CIGjkZC3aBOh8shPchdNB5fxt6yHw/yKxvKsHdaYZLIH
 fFYtms1z9yDKRtUf51z/Rg+yMIHk6t0ySC0kTwUa0Rt0kKH4i8k/p1i4pIkVtAc1UjW/
 yjkk21I22ET2CV7gB01ytRnQWRPPGkz9xQkXheFkxg3vfGvhP+YcSbyMpWnLd6fQwtGo
 kdlTb66LcbtQHj9UG53S7N36lZwppd8xSfPtOay0EWzTSlNtgu3vN7FVBUhTzeY0AuzG
 qoe0EglI98VfqAFCmoE5vUSMnMwf165ePdAgpMjJ3SVRboQ0YReVSJ0mavffv5PxZa2i
 hMfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678209521;
 h=to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=/HMBfX07KVRWkQ0kOyT2/vOgE9Jf6P/W9PmITfPmKps=;
 b=30AdqNupame5/6WGmr1jsQSxMA7irIqZz+NRKkmrIwUyYfdinsK/hazNtfqBdc5RAM
 JV2FEtuCjJC9lLYeQSJ8THzds9W3DW6KH29m8y7k99xsx3Ar3P9/CLrOjpBi0/0HXhoS
 dI1y1KP+OU1ffwpzuyXMpgbnrMv+yOhaNW/CqopyaJltt8P/KtBTAy85iG9UYu2wCK62
 5lTvZEylogPGCHu4Btx+ddVkgSUsnikXS446l1DolPjt83U7KqLAdFA88ep+1Kf6hx2z
 3nIROiIXsSxP+fbQKXISQ51GZIWm7tKPFwoyI0N3uz5UiZRhbgXtudAgXLY4bLk66UWu
 H8LQ==
X-Gm-Message-State: AO0yUKXb0C9+82RZLfY1POJk569WKgVk9Fc0FhGfS3ChM1789vdH6h4j
 r2ti1xTd1gvr8q9O3eIC0Uu2JQx0uY252ucdGWxhHT4J8gU=
X-Google-Smtp-Source: AK7set82tMDiyW4lH6YUCn7bPJmFvjE8GZVu2j4/SoVwjee7nRpIKTMiHznErRDI6DtR8prTj6r3s+eofUelPEpQnOM=
X-Received: by 2002:a4a:da01:0:b0:524:f77c:5443 with SMTP id
 e1-20020a4ada01000000b00524f77c5443mr5119734oou.1.1678209520714; Tue, 07 Mar
 2023 09:18:40 -0800 (PST)
MIME-Version: 1.0
From: Nicolas Chauvet <kwizart@gmail.com>
Date: Tue, 7 Mar 2023 18:18:29 +0100
Message-ID: <CABr+WTmcAxFXUFJiYS6s98zcaFmiOEQ3i-WV=yvT6jdTWh5TMw@mail.gmail.com>
To: nouveau@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Subject: [Nouveau] Panic on deferred probe with nouveau - jetson-tx1 -
 6.3-rc1
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

Hi,

I'm using the fedora rawhide kernel-6.3.0-0.rc1.16.fc39.aarch64 on a
fedora 38 userspace with jetson-tx1.

I'm experiencing the following panic [0]. The workaround is to
blacklist nouveau at boot (using rd.driver.blacklist=nouveau
modprobe.blacklist=nouveau on cmdline) . modprobe nouveau after boot
and restart display. (userspace still needs fixes as seen on the mesa
gitlab instance).

[0]
[    9.158155] Failed to set up IOMMU for device 57000000.gpu;
retaining platform DMA ops
[   51.278556] SError Interrupt on CPU3, code 0x00000000bf000002 -- SError
[   51.278570] CPU: 3 PID: 9 Comm: kworker/u8:0 Not tainted
6.3.0-0.rc1.16.fc39.aarch64 #1
[   51.278578] Hardware name: nvidia,p2371-2180 NVIDIA
P2371-2180/NVIDIA P2371-2180, BIOS 2022.10 10/01/2022
[   51.278583] Workqueue: events_unbound deferred_probe_work_func
[   51.278603] pstate: 404000c5 (nZcv daIF +PAN -UAO -TCO -DIT -SSBS BTYPE=--)
[   51.278611] pc : el1_interrupt+0x20/0x70
[   51.278623] lr : el1h_64_irq_handler+0x18/0x28
[   51.278631] sp : ffff80000b99b880
[   51.278634] x29: ffff80000b99b880 x28: ffff00008032c400 x27: 0000000000000001
[   51.278645] x26: ffff00008d510c48 x25: ffff800001649960 x24: ffff800001649960
[   51.278654] x23: 0000000060400005 x22: ffff8000014cafd0 x21: 00000000f40cf000
[   51.278663] x20: ffff8000080700d0 x19: ffff80000b99b8b0 x18: 0000000000000000
[   51.278671] x17: 0000000000000000 x16: 0000000000000000 x15: 0000000000000000
[   51.278679] x14: 0000000000000000 x13: 0000000000000010 x12: ffff80000dffffff
[   51.278688] x11: 000000000000007e x10: ffff0000ff1ff008 x9 : 0000000058000000
[   51.278697] x8 : ffff80000dffffff x7 : 000000000000003f x6 : ffff80000de00000
[   51.278706] x5 : ffff0000ff1fe380 x4 : ffff80000e000000 x3 : 0000000058000000
[   51.278714] x2 : 0068000000000713 x1 : 00000000000000c0 x0 : ffff80000b99b8b0
[   51.278724] Kernel panic - not syncing: Asynchronous SError Interrupt
[   51.278728] CPU: 3 PID: 9 Comm: kworker/u8:0 Not tainted
6.3.0-0.rc1.16.fc39.aarch64 #1
[   51.278734] Hardware name: nvidia,p2371-2180 NVIDIA
P2371-2180/NVIDIA P2371-2180, BIOS 2022.10 10/01/2022
[   51.278737] Workqueue: events_unbound deferred_probe_work_func
[   51.278748] Call trace:
[   51.278750]  dump_backtrace+0xa8/0x138
[   51.278760]  show_stack+0x20/0x38
[   51.278765]  dump_stack_lvl+0x48/0x60
[   51.278773]  dump_stack+0x18/0x28
[   51.278778]  panic+0x358/0x370
[   51.278787]  nmi_panic+0xb4/0xc0
[   51.278794]  arm64_serror_panic+0x6c/0x88
[   51.278801]  do_serror+0x44/0x80
[   51.278807]  el1h_64_error_handler+0x30/0x48
[   51.278813] VDD_PEX_1V05: disabling
[   51.278814]  el1h_64_error+0x68/0x70
[   51.278820]  el1_interrupt+0x20/0x70
[   51.278826]  el1h_64_irq_handler+0x18/0x28
[   51.278833]  el1h_64_irq+0x68/0x70
[   51.278837]  nvkm_device_ctor+0x1ba0/0x3950 [nouveau]
[   51.279720]  nvkm_device_tegra_new+0x2e4/0x388 [nouveau]
[   51.280511]  nouveau_platform_device_create+0x44/0xd8 [nouveau]
[   51.281259]  nouveau_platform_probe+0x44/0xa8 [nouveau]
[   51.281994]  platform_probe+0x70/0xd8
[   51.282004]  really_probe+0x18c/0x3e0
[   51.282013]  __driver_probe_device+0x84/0x198
[   51.282022]  driver_probe_device+0x44/0x120
[   51.282031]  __device_attach_driver+0xc4/0x168
[   51.282040]  bus_for_each_drv+0x8c/0xf0
[   51.282048]  __device_attach+0xa4/0x1c0
[   51.282056]  device_initial_probe+0x1c/0x30
[   51.282065]  bus_probe_device+0xb4/0xc0
[   51.282073]  deferred_probe_work_func+0xbc/0x118
[   51.282081]  process_one_work+0x1e8/0x488
[   51.282089]  worker_thread+0x74/0x418
[   51.282094]  kthread+0xe8/0x100
[   51.282101]  ret_from_fork+0x10/0x20
[   51.282111] SMP: stopping secondary CPUs
[   51.285427] Kernel Offset: 0x60000 from 0xffff800008000000
[   51.285431] PHYS_OFFSET: 0x80000000
[   51.285434] CPU features: 0x440002,022c0400,0000421b
[   51.285439] Memory Limit: none


-- 
-

Nicolas (kwizart)
