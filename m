Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E4A12499F76
	for <lists+nouveau@lfdr.de>; Tue, 25 Jan 2022 00:19:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4611010E286;
	Mon, 24 Jan 2022 23:19:31 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [IPv6:2a00:1450:4864:20::635])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 790F410E286
 for <nouveau@lists.freedesktop.org>; Mon, 24 Jan 2022 23:19:30 +0000 (UTC)
Received: by mail-ej1-x635.google.com with SMTP id s13so25792932ejy.3
 for <nouveau@lists.freedesktop.org>; Mon, 24 Jan 2022 15:19:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=cRJuQkbGh2lSugEVstDIWf8UWwY31hiHG6oC+s/kzhA=;
 b=E4+bSuhw1YJxOu/JPeD324zCtA/Wl1C66NDYzFEwzKWpT8vEjr/IwpAEbnd5QKLbpV
 GeAqSeer34IlJvkjzGFMOszuQqiZrfOt8wRQhtMGmOrdfTs2uynlZF5kaJ5S+ei2lRaH
 Pis4j35qUd8vil4fyUZp/aY2YL5dnPKIBZwZ0kflAYVMMNgP44Fxbf/GbXNtRI2bY9DW
 +GvcdAsYQMno1fcn3OuOd40BmJjxxK30dyIcIL9lDPzTLF/HCqpZGvE1xbuHnlaKb5Ln
 0WZUqNOpfPif2cACPvn5A/wlKKpT1lTc7wq+zTVGnIE/Pw2Tx4HgNsw2OV4L8gXSFVYg
 +tVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=cRJuQkbGh2lSugEVstDIWf8UWwY31hiHG6oC+s/kzhA=;
 b=PbLYoY/sL/ZwQ0Zgl8npxcm/Unk45uINtX+vZBj5U5BbxV6FfpWpSZCkkZDR+bBJD9
 4IXDz6poDDvATP8y8uCQhVhp+eR/RCB79fcB7OH+s9Dq0Kipu4qny6pJYKIDiSdtBUYl
 9qOCdCsq7cTgoElqiOVUEXKDUR+Q141F4ZTS0MXyZjmEALT6/CGSgq/Gkly+m7AvLD3y
 Zpgbb9Hhe20H9ZyTXB9IgSoaESL9tdSjsZkBLSTayYz8m9R8jCszgY+kwRAkLEjr9Z++
 GKtEGEgkhQ2dHQZZyHzuiMrXhcnJhuW9IsozslObbWsqZU99OSz25/s75cjyGEYF2UxA
 coLw==
X-Gm-Message-State: AOAM533V/T7xzNKwlCM+OiLv+5XjwqfFOYdXfu81Xlk2dptQLJa+JNgc
 o7TI25SE05WLvoDKwMsHPxCD6GGHiRs=
X-Google-Smtp-Source: ABdhPJxUll63cajummsRoEFsMJ6S5hmWbl/uPL029vTNLFRLSyQuv00MyQqI/J9Y5ITnaQCeNRw01g==
X-Received: by 2002:a17:907:7da5:: with SMTP id
 oz37mr1061413ejc.231.1643066368395; 
 Mon, 24 Jan 2022 15:19:28 -0800 (PST)
Received: from debian.localnet (host-79-19-244-61.retail.telecomitalia.it.
 [79.19.244.61])
 by smtp.gmail.com with ESMTPSA id co19sm7284703edb.7.2022.01.24.15.19.26
 for <nouveau@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Jan 2022 15:19:27 -0800 (PST)
From: computer enthusiastic <computer.enthusiastic@gmail.com>
To: nouveau@lists.freedesktop.org
Date: Tue, 25 Jan 2022 00:19:25 +0100
Message-ID: <2296778.YFyOdMMpyM@debian>
In-Reply-To: <CAKb7UviFVRe7hbtEXF6hUQh2TuZPthu+bt90h+8haf3A1FYt7g@mail.gmail.com>
References: <CAHSpYy3G7EPhLBAiy4MgngKRqFgs1cTC-pnJb662vxxmkmxPXA@mail.gmail.com>
 <CAKb7UvhBekZhHhq=aD+hLCfOWe33whi_bScbLiDhXDwvEvbzfA@mail.gmail.com>
 <YWhgFZPqx3qKqr0C@debian.fritz.box>
 <CAKb7UviFVRe7hbtEXF6hUQh2TuZPthu+bt90h+8haf3A1FYt7g@mail.gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Subject: Re: [Nouveau] Advice about debugging nouveau driver suspend issue
 (init_on_alloc=1 and init_on_free=1)
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

Hello,

On Thu, Oct 14, 2021 at 02:07:33PM -0400, Ilia Mirkin wrote:
> On Thu, Oct 14, 2021 at 12:51 PM Computer Enthusiastic
> <computer.enthusiastic@gmail.com> wrote:
> > [..]
> >
> > The patch is "mm: security: introduce init_on_alloc=1 and init_on_free=1
> > boot options" (commit 6471384af2a6530696fc0203bafe4de41a23c9ef) [1].
> >
> > It was introduced in kernel version 5.2:
> > $ git describe --tags 6471384af2a6530696fc0203bafe4de41a23c9ef
> > v5.2-5754-g6471384af2a6
> 
> Uff... so you've verified that a kernel at that commit +
> init_on_alloc=1 and init_on_free=1 (or the CONFIG_* equivalents) will
> cause the problems?
> 
> That means the problem has "always been there" (or at least we have no
> great way of knowing when it might have been introduced).
> 
> I think there's some sort of SLUB debug options that help find
> use-after-frees and such. What if you disable the init_on_*, enable
> SLUB, and boot with like "slub_debug=FZP"?
> 
>   -ilia

Hello,

First of all, thank you for your answer and advice: it has been a very useful 
starting point. I apologize for the delay in replying, but I've been analysing 
the issue for a long time, trying to acquire more clues. 

I hope it can be useful in addressing the issue with suspend to ram and 
suspend to disk (with 'nouveau' kernel module) when kernel is compiled with 
CONFIG_INIT_ON_ALLOC_DEFAULT_ON and CONFIG_INIT_ON_FREE_DEFAULT_ON (see 
https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=989705#5, https://
gitlab.freedesktop.org/xorg/driver/xf86-video-nouveau/-/issues/547, https://
bugzilla.kernel.org/show_bug.cgi?id=213617). 

The issue immediately appears during suspension to RAM, if the graphical 
console is active (e.g., CTRL-ALT-F7): the screen image is always garbled with 
the same pattern, regardless of the kernel version (see here https://
gitlab.freedesktop.org/xorg/driver/xf86-video-nouveau/uploads/
44ffbbef135538b42a39a2d4dd288624/
After_resume_linux-5.4.60_and_linux-5.7.17.jpg for an example).

The issue does not immediately appears if suspend to ram is started (e.g., 
systemctl suspend) from a text virtual terminal (even if after a much longer 
wait) and it is possible to complete resume: in this case, the system crashes 
(the same way reported in previous paragraph) as soon as the graphical console 
(e.g., with ALT-F7) is activated by the user, anyways.

Below I report the analysis I've done so far: I apologize for its length, but 
I would like to give as much information as possible. 

I followed your advice about slub debug. After some tests, I realised that the 
activation of "slub poisoning" (e.g. kernel option 'slub_debug=FPZ') has the 
same effect of "init_on_alloc=0 init_on_free=0". In fact, it seems that "slub 
poisoning" takes precedence over activation of init_on_alloc and init_on_free. 

This is an excerpt of kernel log when kernel is booted with slubdebug option 
activated (suspend to RAM succeeds):

8<------8<------8<------8<------8<------8<------8<------8<

gen 24 17:37:22 debian kernel: Linux version 5.10.87-dbg-timeout 
(([.,removed..])) (gcc (Debian 10.2.1-6) 10.2.1 20210110, GNU ld (GNU Binutils 
for Debian) 2.35.2) #2 SMP Sat Dec 18 09:02:06 CET 2021
gen 24 17:37:22 debian kernel: Command line: BOOT_IMAGE=/boot/vmlinuz-5.10.87-
dbg-timeout root=UUID=d4c01dd6-eca5-4311-9ea2-6511cd217dc7 ro 
no_console_suspend loglevel=6 nouveau.debug=info drm.debug=2 
trace_clock=global slub_debug=FPZ nokaslr crashkernel=384M-:128M
[..]
gen 24 17:37:22 debian kernel: mem auto-init: SLAB_POISON will take precedence 
over init_on_alloc/init_on_free
gen 24 17:37:22 debian kernel: Dentry cache hash table entries: 524288 (order: 
10, 4194304 bytes, linear)
gen 24 17:37:22 debian kernel: Inode-cache hash table entries: 262144 (order: 
9, 2097152 bytes, linear)
gen 24 17:37:22 debian kernel: mem auto-init: stack:off, heap alloc:on, heap 
free:off
gen 24 17:37:22 debian kernel: Memory: 205516K/3140468K available (14344K 
kernel code, 4648K rwdata, 4480K rodata, 2488K init, 21384K bss, 282616K 
reserved, 0K cma-reserved)
gen 24 17:37:22 debian kernel: random: get_random_u64 called from 
__kmem_cache_create+0x2c/0x580 with crng_init=0
gen 24 17:37:22 debian kernel: SLUB: HWalign=64, Order=0-3, MinObjects=0, 
CPUs=2, Nodes=1
gen 24 17:37:22 debian kernel: Kernel/User page tables isolation: enabled
gen 24 17:37:22 debian kernel: ftrace: allocating 37278 entries in 146 pages
gen 24 17:37:22 debian kernel: ftrace: allocated 146 pages with 3 groups
gen 24 17:37:22 debian kernel: Running RCU self tests
gen 24 17:37:22 debian kernel: rcu: Hierarchical RCU implementation.
gen 24 17:37:22 debian kernel: rcu:         RCU lockdep checking is enabled.
gen 24 17:37:22 debian kernel: rcu:         RCU restricting CPUs from 
NR_CPUS=8192 to nr_cpu_ids=2.
gen 24 17:37:22 debian kernel:         Rude variant of Tasks RCU enabled.
gen 24 17:37:22 debian kernel:         Tracing variant of Tasks RCU enabled.
gen 24 17:37:22 debian kernel: rcu: RCU calculated value of scheduler-
enlistment delay is 25 jiffies.
gen 24 17:37:22 debian kernel: rcu: Adjusting geometry for rcu_fanout_leaf=16, 
nr_cpu_ids=2
gen 24 17:37:22 debian kernel: NR_IRQS: 524544, nr_irqs: 440, preallocated 
irqs: 16
gen 24 17:37:22 debian kernel: Console: colour VGA+ 80x25
gen 24 17:37:22 debian kernel: printk: console [tty0] enabled
gen 24 17:37:22 debian kernel: Lock dependency validator: Copyright (c) 2006 
Red Hat, Inc., Ingo Molnar
gen 24 17:37:22 debian kernel: ... MAX_LOCKDEP_SUBCLASSES:  8
gen 24 17:37:22 debian kernel: ... MAX_LOCK_DEPTH:          48
gen 24 17:37:22 debian kernel: ... MAX_LOCKDEP_KEYS:        8192
gen 24 17:37:22 debian kernel: ... CLASSHASH_SIZE:          4096
gen 24 17:37:22 debian kernel: ... MAX_LOCKDEP_ENTRIES:     32768
gen 24 17:37:22 debian kernel: ... MAX_LOCKDEP_CHAINS:      65536
gen 24 17:37:22 debian kernel: ... CHAINHASH_SIZE:          32768
gen 24 17:37:22 debian kernel:  memory used by lock dependency info: 6365 kB
gen 24 17:37:22 debian kernel:  memory used for stack traces: 4224 kB
gen 24 17:37:22 debian kernel:  per task-struct memory footprint: 1920 bytes
[..]
8<------8<------8<------8<------8<------8<------8<------8<

Furthermore, the activation of the "sanity checks" and "red zoning" in the 
kernel slub ('F' and 'Z' options in 'slub_debug=FPG') does not make appear 
warning or error messages in system logs when resume from suspension to RAM 
fails. This make me guess that probably the issue is not caused by a kernel 
slub corruption or a memory leak. 

These are the relevant error messages in system logs during suspension to RAM 
(when resume from STR fails):

8<------8<------8<------8<------8<------8<------8<------8<
[..]
  gen 24 18:42:27 debian systemd-sleep[2228]: Suspending system...
  gen 24 18:42:27 debian kernel: PM: suspend entry (deep)
  gen 24 18:42:27 debian kernel: Filesystems sync: 0.045 seconds
  gen 24 18:45:30 debian kernel: Freezing user space processes ... (elapsed 
0.026 seconds) done.
  gen 24 18:45:30 debian kernel: OOM killer disabled.
  gen 24 18:45:30 debian kernel: Freezing remaining freezable tasks ... 
(elapsed 0.003 seconds) done.
  gen 24 18:45:30 debian kernel: sd 0:0:0:0: [sda] Synchronizing SCSI cache
  gen 24 18:45:30 debian kernel: sd 0:0:0:0: [sda] Stopping disk
  gen 24 18:45:30 debian kernel: nouveau 0000:01:00.0: DRM: suspending 
console...
  gen 24 18:45:30 debian kernel: nouveau 0000:01:00.0: DRM: suspending 
display...
  gen 24 18:45:30 debian kernel: nouveau 0000:01:00.0: DRM: evicting 
buffers...
>>gen 24 18:45:30 debian kernel: [TTM] Buffer eviction failed 
  gen 24 18:45:30 debian kernel: nouveau 0000:01:00.0: DRM: waiting for kernel 
channels to go idle...
  gen 24 18:45:30 debian kernel: nouveau 0000:01:00.0: DRM: suspending 
fence...
  gen 24 18:45:30 debian kernel: nouveau 0000:01:00.0: DRM: suspending object 
tree...
  gen 24 18:45:30 debian kernel: ACPI: EC: interrupt blocked
  gen 24 18:45:30 debian kernel: ACPI: Preparing to enter system sleep state 
S3
  gen 24 18:45:30 debian kernel: ACPI: EC: event blocked
  gen 24 18:45:30 debian kernel: ACPI: EC: EC stopped
  gen 24 18:45:30 debian kernel: PM: Saving platform NVS memory
  gen 24 18:45:30 debian kernel: Disabling non-boot CPUs ...
  gen 24 18:45:30 debian kernel: smpboot: CPU 1 is now offline
  gen 24 18:45:30 debian kernel: ACPI: Low-level resume complete
  gen 24 18:45:30 debian kernel: ACPI: EC: EC started
  gen 24 18:45:30 debian kernel: PM: Restoring platform NVS memory
  gen 24 18:45:30 debian kernel: Enabling non-boot CPUs ...
  gen 24 18:45:30 debian kernel: x86: Booting SMP configuration:
  gen 24 18:45:30 debian kernel: smpboot: Booting Node 0 Processor 1 APIC 0x1
  gen 24 18:45:30 debian kernel: CPU1 is up
  gen 24 18:45:30 debian kernel: ACPI: Waking up from system sleep state S3
  gen 24 18:45:30 debian kernel: ACPI: EC: interrupt unblocked
  gen 24 18:45:30 debian kernel: nouveau 0000:01:00.0: DRM: resuming object 
tree...
  gen 24 18:45:30 debian kernel: ACPI: EC: event unblocked
[..]
8<------8<------8<------8<------8<------8<------8<------8<

As you can see, there is a *"[TTM] Buffer eviction failed"* error message from 
the kernel during suspension to RAM. 

The "Buffer eviction failed" error message always appears (with my hardware: 
Intel Core 2 Duo, nvidia GEForce 9600M GT) during suspension to ram after that 
the kernel is booted with init_on_alloc activated (or without SLUB_debug='FPZ' 
option); it is *constantly replicable* from different kernel versions, for 
example from 5.10 (e.g., in Debian Bullseye 11.0, 11.1, 11.2 and in vanilla 
versions up to 5.16, the latter tested few days ago).  It probably started 
with kernel version 5.8.

The following tests and logs are from a custom kernel built from vanilla 
version 5.10.87 with debug options enabled; I used (as base) the kernel's 
.config from the 
latest Debian kernel from release 11.0 codenamed "Bullseye" (linux-
image-5.10.0-10-amd64, kernel 5.10.84) and then activated further kernel debug 
option. The user space installation is from a Debian 11.2.

8<------8<------8<------8<------8<------8<------8<------8<

$ uname -a
Linux debian 5.10.87-dbg-timeout #2 SMP Sat Dec 18 09:02:06 CET 2021 x86_64 
GNU/Linux

$ lsb_release -a
No LSB modules are available.
Distributor ID: Debian
Description:    Debian GNU/Linux 11 (bullseye)
Release:        11
Codename:       bullseye

$ cat /etc/debian_version 
11.2

# inxi -mMG
Machine:   Type: Laptop System: Acer product: Aspire 5930 v: 0100 serial: 
<superuser required> 
           Mobo: Acer model: Eiger v: Rev serial: <superuser required> BIOS: 
Phoenix v: 1.21 date: 08/22/2008 
Memory:    RAM: total: 2.77 GiB used: 2.27 GiB (82.1%) 
           RAM Report: permissions: Unable to run dmidecode. Root privileges 
required. 
Graphics:  Device-1: NVIDIA G96CM [GeForce 9600M GT] driver: nouveau v: kernel 
           Device-2: Suyin Acer HD Crystal Eye webcam type: USB driver: 
uvcvideo 
           Display: x11 server: X.Org 1.20.11 driver: loaded: modesetting 
unloaded: fbdev,vesa resolution: 1280x800~60Hz 
           OpenGL: renderer: NV96 v: 3.3 Mesa 20.3.5 
Machine:   Type: Laptop System: Acer product: Aspire 5930 v: 0100 serial: 
[..removed..] 
           Mobo: Acer model: Eiger v: Rev serial: [..removed..]  BIOS: Phoenix 
v: 1.21 date: 08/22/2008 
Memory:    RAM: total: 2.79 GiB used: 1.37 GiB (49.3%) 
           Array-1: capacity: 4 GiB slots: 2 EC: None 
           Device-1: M1 size: 2 GiB speed: 667 MT/s 
           Device-2: M2 size: 2 GiB speed: 667 MT/s 
Graphics:  Device-1: NVIDIA G96CM [GeForce 9600M GT] driver: nouveau v: kernel 
           Device-2: Suyin Acer HD Crystal Eye webcam type: USB driver: 
uvcvideo 
           Display: server: X.org 1.20.11 driver: loaded: modesetting 
unloaded: fbdev,vesa tty: 178x46 
           OpenGL: renderer: NV96 v: 3.3 Mesa 20.3.5 

8<------8<------8<------8<------8<------8<------8<------8<

I traced the kernel function nouveau_do_suspend() [1] as a starting point in 
the analysis of nouveau kernel module for "Suspend To Ram" ("STR", from now 
on) . 

I recorded the graph of kernel functions called by nouveau_do_suspend() after 
starting STR and up to the beginning of resume (I used the ftrace kernel 
feature [2] [3]). 

The ftrace recording were done in two conditions:

    1) kernel started *with* parameter debug_slub=FPZ (in this case, STR 
*works*); note: the kernel parameter debug_slub=FPZ [4] take precedence over 
init_on_alloc kernel parameter (which is therefore disabled in this case) [5]. 

    2) kernel started *without* debug_slub=FPZ (in this case, STR *fails* 
after resume); note: as previously mentioned, init_on_alloc and init_on_free 
are enabled in Debian kernel by default starting from release 11.0 codenamed 
"Bullseye" (CONFIG_INIT_ON_ALLOC_DEFAULT_ON and 
CONFIG_INIT_ON_FREE_DEFAULT_ON).
    
The analysis of time spent by involved kernel functions when STR fails, 
pointed me to function named ttm_resource_manager_force_list_clean() [6]. 

I generated three files for each recording (using ftrace with graph plugin) 
for each of the two aforementioned conditions:

    a) a graph of functions call from ftrace kernel buffer in /sys/kernel/
debug/tracing/trace as text log file

    b) a binary raw ftrace recording (with .dat extension, for subsequent 
analyzes)

    c) a profile of functions traced (with overall time spent by kernel in 
each function) as text log file 
    
Then, I compared the profile of called function when STR fails to the one when 
STR works (see the attached script join_traces.sh). 

I generated a comparison file that I reworked using a 
spreadsheet (functions calls are sorted by total time in descending order). 

The most time consuming functions called by 
ttm_resource_manager_force_list_clean() when STR *fails* are (in descending 
order):

NUM.CALLS   TOTAL TIME     AVG TIME   FUNCTION (note: STR *fails*, usec)
=========  ===========   ===========  =======================================
(1)        11436084627   11436084627  ttm_resource_manager_force_list_clean() 
(10)       11435990310    1143599031  ttm_mem_evict_first()
(10)       11435753724    1143575372  ttm_bo_evict()
(10)       11433592700    1143359270  ttm_bo_handle_move_mem()
(10)       11381408793    1138140879  nouveau_bo_move()
(6)        10379433308    1729905551  ttm_bo_move_memcpy()
(2256)     10367683828       4595604  memcpy_fromio()
(10)        1001119248     100111924  nouveau_bo_move_m2mf.constprop.0()
(10)         995441053      99544105  ttm_bo_move_accel_cleanup()
(38)         994614055      26174054  ttm_bo_wait()
(38)         994403882      26168523  >> dma_resv_wait_timeout_rcu() <<
(6)          993363983     165560663  dma_fence_wait_timeout()
(6)          993285402     165547567  dma_fence_default_wait()
(2596)       137206543         52853  __sysvec_apic_timer_interrupt()
(2596)       129927214         50049  hrtimer_interrupt()
(2595)        91271707         35172  __hrtimer_run_queues()
(2594)        74417961         28688  tick_sched_timer()
(15)          47315477       3154365  ttm_tt_populate()
(10)          47287068       4728706  nouveau_ttm_tt_populate()
(10)          47268974       4726897  ttm_populate_and_map_pages()
(10)          47068753       4706875  ttm_pool_populate()
(12)          30015421       2501285  ttm_page_pool_get_pages()
(4)           29847966       7461991  ttm_alloc_new_pages.isra.0()
(6)           25147308       4191218  ttm_set_pages_caching()
(30758)       17361172           564  rcu_read_lock_sched_held()
(2283)        16058655          7034  ttm_mem_global_alloc_page()
(2283)        14317071          6271  ttm_mem_global_alloc_zone()


The time consumed by the same previous funcions in the same order, but when 
STR *succeeds* is:

NUM.CALLS   TOTAL TIME     AVG TIME   FUNCTION (note: STR *fails*, usec)
=========  ===========   ===========  =======================================
(1)          501338026     501338026  ttm_resource_manager_force_list_clean() 
(119)        500532532       4206155  ttm_mem_evict_first()
(119)        497645267       4181893  ttm_bo_evict()
(119)        479173966       4026671  ttm_bo_handle_move_mem()
(119)        186045609       1563408  nouveau_bo_move()
                                      ttm_bo_move_memcpy()
                                      memcpy_fromio()
(119)        183246904       1539889  nouveau_bo_move_m2mf.constprop.0()
(119)        122513397       1029524  ttm_bo_move_accel_cleanup()
(311)         82506104        265292  ttm_bo_wait()
(311)         80733662        259593  >> dma_resv_wait_timeout_rcu() <<
(80)          75522674        944033  dma_fence_wait_timeout()
(80)          74936515        936706  dma_fence_default_wait()
(34)           1565271         46037  __sysvec_apic_timer_interrupt()
(17)            810651         47685  hrtimer_interrupt()
(13)            474341         36487  __hrtimer_run_queues()
(10)            302783         30278  tick_sched_timer()
(119)        240333865       2019612  ttm_tt_populate()
(119)        240037719       2017123  nouveau_ttm_tt_populate()
(119)        239856293       2015599  ttm_populate_and_map_pages()
(119)        224154269       1883649  ttm_pool_populate()
(144)         25454062        176764  ttm_page_pool_get_pages()
(20)          22598464       1129923  ttm_alloc_new_pages.isra.0()
(4)           13932500       3483125  ttm_set_pages_caching()
(7141)         7724863          1081  rcu_read_lock_sched_held()
(26455)      187335946          7081  ttm_mem_global_alloc_page()
(26455)      168008932          6350  ttm_mem_global_alloc_zone()


As you can see, when STR succeeds (because init_on_alloc disabled) compared 
with when it fails (because init_on_allloc is enabled):

a) the count of function calls is much higher for ttm* and nouveau* functions 
and the total time spent by kernel for ttm_resource_manager_force_list_clean() 
and subsequent calls is lower (total time: 501338026 vs 11436084627): this let 
me suppose that code flows and it is not stuck somewhere (when init_on_alloc 
is disabled); this is confirmed in subsequent point c)

b) the ttm_bo_move_memcpy() and memcpy_fromio() are not executed: this let me 
suppose that the sequence of funcions call is somewhere different (after a 
common starting point): this is confirmed by subsequent analysis of kernel 
function's trace

c) the number of call for dma_resv_wait_timeout_rcu() is much lower (10 times) 
and the average duration of the call is much lower (259593 usec vs 26168523 
usec): this makes me suppose that the kernel is stuck in accessing to shared 
DMA resources (GPU's memory ? deadlock ?) when suspension to RAM fails; 


This is the kernel graph trace starting from 
ttm_resource_manager_force_list_clean (when STR succeeds or fails):

8<------8<------8<------8<------8<------8<------8<------8<
# kprobe-perf -s 'p:ttm_resource_manager_force_list_clean'

Tracing kprobe ttm_resource_manager_force_list_clean. Ctrl-C to end.
    kworker/u4:9-4234    [001] ....  1317.593113: 
ttm_resource_manager_force_list_clean: 
(ttm_resource_manager_force_list_clean+0x0/0x1d0 [ttm])
    kworker/u4:9-4234    [001] ....  1317.593126: <stack trace>
 => ttm_resource_manager_force_list_clean
 => nouveau_do_suspend
 => nouveau_pmops_suspend
 => pci_pm_suspend
 => dpm_run_callback
 => __device_suspend
 => async_suspend
 => async_run_entry_fn
 => process_one_work
 => worker_thread
 => kthread
 => ret_from_fork
8<------8<------8<------8<------8<------8<------8<------8<

Then, I traced (using ftrace [2]) some specific kernel functions and probed 
the return values for some of them.

These are the functions called when suspend to RAM fails (with reference to 
source code at the URL https://elixir.bootlin.com/linux/v5.10.87/source):

8<------8<------8<------8<------8<------8<------8<------8<
nouveau_pmops_suspend [nouveau] -> nouveau_do_suspend
https://elixir.bootlin.com/linux/v5.10.87/source/drivers/gpu/drm/nouveau/
nouveau_drm.c#L945
https://elixir.bootlin.com/linux/v5.10.87/source/drivers/gpu/drm/nouveau/
nouveau_drm.c#L841
|
+-> nouveau_do_suspend -> ttm_bo_evict_mm
  https://elixir.bootlin.com/linux/v5.10.87/source/drivers/gpu/drm/nouveau/
nouveau_drm.c#L860
  https://elixir.bootlin.com/linux/v5.10.87/source/drivers/gpu/drm/ttm/
ttm_bo.c#L1308
  |
  +-> ttm_bo_evict_mm -> ttm_manager_type 
  https://elixir.bootlin.com/linux/v5.10.87/source/drivers/gpu/drm/ttm/
ttm_bo.c#L1310
  https://elixir.bootlin.com/linux/v5.10.87/source/include/drm/ttm/
ttm_bo_driver.h#L355
  |
  +-> ttm_bo_evict_mm -> ttm_resource_manager_force_list_clean 
  https://elixir.bootlin.com/linux/v5.10.87/source/drivers/gpu/drm/ttm/
ttm_bo.c#L1322
  https://elixir.bootlin.com/linux/v5.10.87/source/drivers/gpu/drm/ttm/
ttm_resource.c#L86
    |
    +-> ttm_resource_manager_force_list_clean -> ttm_mem_evict_first 
    https://elixir.bootlin.com/linux/v5.10.87/source/drivers/gpu/drm/ttm/
ttm_resource.c#L107
    https://elixir.bootlin.com/linux/v5.10.87/source/drivers/gpu/drm/ttm/
ttm_bo.c#L725
           ==> note: ttm_resource_manager_force_list_clean:104  <==
           ==>       here starts a loop for buffer eviction     <==
    https://elixir.bootlin.com/linux/v5.10.87/source/drivers/gpu/drm/ttm/
ttm_resource.c#L104
      |
      +-> ttm_mem_evict_first -> ttm_bo_evict 
      https://elixir.bootlin.com/linux/v5.10.87/source/drivers/gpu/drm/ttm/
ttm_bo.c#L789
      https://elixir.bootlin.com/linux/v5.10.87/source/drivers/gpu/drm/ttm/
ttm_bo.c#L598
        |
        +-> ttm_bo_evict -> ttm_bo_handle_move_mem
        https://elixir.bootlin.com/linux/v5.10.87/source/drivers/gpu/drm/ttm/
ttm_bo.c#L598
        https://elixir.bootlin.com/linux/v5.10.87/source/drivers/gpu/drm/ttm/
ttm_bo.c#L235
            |
            +-> ttm_bo_handle_move_mem -> ttm_mem_io_free+0x0/0x40
            https://elixir.bootlin.com/linux/v5.10.87/source/drivers/gpu/drm/
ttm/ttm_bo.c#L244
            https://elixir.bootlin.com/linux/v5.10.87/source/drivers/gpu/drm/
ttm/ttm_bo.c#L1471
            |
            +-> ttm_bo_handle_move_mem -> 
tm_tt_set_placement_caching+0x0/0x110
            https://elixir.bootlin.com/linux/v5.10.87/source/drivers/gpu/drm/
ttm/ttm_bo.c#L258
            https://elixir.bootlin.com/linux/v5.10.87/source/drivers/gpu/drm/
ttm/ttm_tt.c#L195
            |
            +-> ttm_bo_handle_move_mem -> ttm_tt_populate+0x0/0x80
            https://elixir.bootlin.com/linux/v5.10.87/source/drivers/gpu/drm/
ttm/ttm_bo.c#L265
            https://elixir.bootlin.com/linux/v5.10.87/source/drivers/gpu/drm/
ttm/ttm_tt.c#L422
            |
            |-> ttm_bo_handle_move_mem -> nouveau_bo_move_ntfy 
            https://elixir.bootlin.com/linux/v5.10.87/source/drivers/gpu/drm/
ttm/ttm_bo.c#L280
            https://elixir.bootlin.com/linux/v5.10.87/source/drivers/gpu/drm/
nouveau/nouveau_bo.c#L1004
            |
            +-> ttm_bo_handle_move_mem -> nouveau_bo_move
            https://elixir.bootlin.com/linux/v5.10.87/source/drivers/gpu/drm/
ttm/ttm_bo.c#L286
            https://elixir.bootlin.com/linux/v5.10.87/source/drivers/gpu/drm/
nouveau/nouveau_bo.c#L1053
              |
              +-> nouveau_bo_move -> ttm_bo_wait
              https://elixir.bootlin.com/linux/v5.10.87/source/drivers/gpu/
drm/nouveau/nouveau_bo.c#L1063
              https://elixir.bootlin.com/linux/v5.10.87/source/drivers/gpu/
drm/ttm/ttm_bo.c#L1480
              |
              +-> nouveau_bo_move -> nouveau_bo_move_m2mf.constprop
              | https://elixir.bootlin.com/linux/v5.10.87/source/drivers/gpu/
drm/nouveau/nouveau_bo.c#L1093
              | https://elixir.bootlin.com/linux/v5.10.87/source/drivers/gpu/
drm/nouveau/nouveau_bo.c#L798
              | |
              | +-> nouveau_bo_move_m2mf.constprop -> 
ttm_bo_move_accel_cleanup
              | https://elixir.bootlin.com/linux/v5.10.87/source/drivers/gpu/
drm/nouveau/nouveau_bo.c#L824
              | https://elixir.bootlin.com/linux/v5.10.87/source/drivers/gpu/
drm/ttm/ttm_bo_util.c#L606
              | | |
              | | |   ** HARDWARE ASSISTED COPY **
              | | +-> ttm_bo_move_accel_cleanup -> dma_resv_add_excl_fence
              | | |   https://elixir.bootlin.com/linux/v5.10.87/source/
drivers/gpu/drm/ttm/ttm_bo_util.c#L617
              | | |   https://elixir.bootlin.com/linux/v5.10.87/source/
drivers/gpu/drm/ttm/ttm_bo_util.c#L617
              | | | 
HERE FLOW ==> | | +-> ttm_bo_move_accel_cleanup -> ttm_bo_wait_free_node
DIVERGES  ==> | | https://elixir.bootlin.com/linux/v5.10.87/source/drivers/
gpu/drm/ttm/ttm_bo_util.c#L623
WITH INIT ==> | | https://elixir.bootlin.com/linux/v5.10.87/source/drivers/
gpu/drm/ttm/ttm_bo_util.c#L529
ON ALLOC IS=> | | |  |
ACTIVATED ==> | | |  +-> ttm_bo_wait_free_node -> ttm_bo_wait
              | | |  https://elixir.bootlin.com/linux/v5.10.87/source/drivers/
gpu/drm/ttm/ttm_bo_util.c#L533
              | | |    |   
              | | |    +-> ttm_bo_wait -> dma_resv_wait_timeout_rcu 
              | | |    https://elixir.bootlin.com/linux/v5.10.87/source/
drivers/gpu/drm/ttm/ttm_bo.c#L1492
              | | |    https://elixir.bootlin.com/linux/v5.10.87/source/
drivers/dma-buf/dma-resv.c#L532
              | | |    |
              | | |    +-> dma_resv_wait_timeout_rcu-> dma_fence_wait_timeout
              | | |    https://elixir.bootlin.com/linux/v5.10.87/source/
drivers/dma-buf/dma-resv.c#L594
              | | |      |
              | | |      +-> dma_fence_wait_timeout -> dma_fence_default_wait
              | | |      https://elixir.bootlin.com/linux/v5.10.87/source/
drivers/dma-buf/dma-fence.c#L425
              | | |      https://elixir.bootlin.com/linux/v5.10.87/source/
drivers/dma-buf/dma-fence.c#L674
              | | | 
              | | |      ** FAILING ACCELERATED COPY (TIMEOUT IN WAITING RCU) 
**
              | | | 
              | | |
              | +-+<- dma_fence_default_wait -> ttm_bo_move_accel_cleanup
              | |     https://elixir.bootlin.com/linux/v5.10.87/source/
drivers/gpu/drm/ttm/ttm_bo_util.c#L626
              | |     return arg1=0xfffffff0 (-EBUSY)
              | |    
              +-+<- ttm_bo_move_accel_cleanup -> 
nouveau_bo_move_m2mf.constprop
              |     https://elixir.bootlin.com/linux/v5.10.87/source/drivers/
gpu/drm/nouveau/nouveau_bo.c#L824
              |     return arg1=0xfffffff0 (-EBUSY)
              |
              +<-- nouveau_bo_move_m2mf.constprop -> nouveau_bo_move 
              |     https://elixir.bootlin.com/linux/v5.10.87/source/drivers/
gpu/drm/nouveau/nouveau_bo.c#L1093
              |     https://elixir.bootlin.com/linux/v5.10.87/source/drivers/
gpu/drm/nouveau/nouveau_bo.c#L1097)
              |     return arg1=0xfffffff0 (-EBUSY)
              |
              |   ** FALL BACK TO SOFTWARE COPY **
              +-> nouveau_bo_move -> ttm_bo_wait
              https://elixir.bootlin.com/linux/v5.10.87/source/drivers/gpu/
drm/nouveau/nouveau_bo.c#L1101
              |
              +-> nouveau_bo_move -> ttm_bo_move_memcpy
              https://elixir.bootlin.com/linux/v5.10.87/source/drivers/gpu/
drm/nouveau/nouveau_bo.c#L1103
              https://elixir.bootlin.com/linux/v5.10.87/source/drivers/gpu/
drm/ttm/ttm_bo_util.c#L217
                |
                +-> ttm_bo_move_memcpy -> ttm_bo_wait
                https://elixir.bootlin.com/linux/v5.10.87/source/drivers/gpu/
drm/ttm/ttm_bo_util.c#L234
                |
                +-> ttm_bo_move_memcpy -> ttm_resource_ioremap 
                https://elixir.bootlin.com/linux/v5.10.87/source/drivers/gpu/
drm/ttm/ttm_bo_util.c#L238
                |
                +-> ttm_bo_move_memcpy -> ttm_resource_ioremap 
                https://elixir.bootlin.com/linux/v5.10.87/source/drivers/gpu/
drm/ttm/ttm_bo_util.c#L241
                |
                +-> ttm_bo_move_memcpy -> ttm_tt_populate
                https://elixir.bootlin.com/linux/v5.10.87/source/drivers/gpu/
drm/ttm/ttm_bo_util.c#L265
                |
                +-> HERE START A LOOP
                +-> https://elixir.bootlin.com/linux/v5.10.87/source/drivers/
gpu/drm/ttm/ttm_bo_util.c#L279
                | |
                | +-> ttm_bo_move_memcpy -> ttm_copy_io_ttm_page 
                | https://elixir.bootlin.com/linux/v5.10.87/source/drivers/
gpu/drm/ttm/ttm_bo_util.c#L289
                | https://elixir.bootlin.com/linux/v5.10.87/source/drivers/
gpu/drm/ttm/ttm_bo_util.c#L173
                |   |
                |   +-> memcpy_fromio [REPEATED IN LOOP]
                |   https://elixir.bootlin.com/linux/v5.10.87/source/drivers/
gpu/drm/ttm/ttm_bo_util.c#L289
                |    
                |     ***********************************************
                |     ** SOFTWARE COPY FAILS AFTER MANY ITERATIONS **
                |     **        OF memcpy_fromio()                 **
                |     ***********************************************
                |        
                |<--- (nouveau_bo_move+0x346/0x740 [nouveau] <- 
ttm_bo_move_memcpy) arg1=0xffffffea
                |
            +--<+-nouveau_bo_move -> ttm_bo_handle_move_mem 
            |     https://elixir.bootlin.com/linux/v5.10.87/source/drivers/
gpu/drm/nouveau/nouveau_bo.c#L1065
            |     https://elixir.bootlin.com/linux/v5.10.87/source/drivers/
gpu/drm/ttm/ttm_bo.c#L287
            |     return arg1=0xfffffff0 (-EBUSY)
            |    
    +--<----+<--ttm_bo_handle_move_mem -> ttm_bo_evict 
    |           https://elixir.bootlin.com/linux/v5.10.87/source/drivers/gpu/
drm/ttm/ttm_bo.c#L304
    |           https://elixir.bootlin.com/linux/v5.10.87/source/drivers/gpu/
drm/ttm/ttm_bo.c#L637
    |           return arg1=0xfffffff0 (-EBUSY)
    |            
    |                       ************************************
    |                       ** Buffer eviction failed MESSAGE **
    |                       ************************************
    |
    +-> ttm_resource_manager_force_list_clean -> ttm_mem_evict_first
    |   https://elixir.bootlin.com/linux/v5.10.87/source/drivers/gpu/drm/ttm/
ttm_resource.c#L86
    |  
    +-> ttm_mem_evict_first -> tm_bo_evict_mm
    |   https://elixir.bootlin.com/linux/v5.10.87/source/drivers/gpu/drm/ttm/
ttm_bo.c#L790
    |
    +-> tm_bo_evict_mm -> nouveau_do_suspend
        https://elixir.bootlin.com/linux/v5.10.87/source/drivers/gpu/drm/ttm/
ttm_bo.c#L1308 
8<------8<------8<------8<------8<------8<------8<------8<
                        
The function ttm_bo_wait_free_node() is where the flow diverges between 
suspend to ram success or failure. 

When the kernel feature CONFIG_INIT_ON_ALLOC_DEFAULT_ON is active:
    a) the function dma_resv_wait_timeout_rcu() times out in ttm_bo_wait()
    b) then, the function ttm_bo_wait() return 0xfffffff0 (corresponding to -
EBUSY) to its callers
    
The ftrace log reports (excerpt):

8<------8<------8<------8<------8<------8<------8<------8<

  #                         _-----=> irqs-off
  #                        / _----=> need-resched
  #                        | / _---=> hardirq/softirq
  #                        || / _--=> preempt-depth
  #                        ||| /     delay
  #     TASK-PID     CPU#  ||||   TIMESTAMP  FUNCTION
  #        | |         |   ||||      |         |
  kworker/u4:11-2068 [000] d..2 210.090141: probe4: 
(ttm_bo_move_accel_cleanup+0x1ba/0x510 [ttm] <- ttm_bo_wait) arg1=0xfffffff0 
  kworker/u4:11-2068 [000] d..2 210.090144: probe3: 
(nouveau_bo_move_m2mf.constprop.0+0x1a5/0x200 [nouveau] <- 
ttm_bo_move_accel_cleanup) arg1=0xfffffff0 
  kworker/u4:11-2068 [000] d..2 210.090147: probe1: (nouveau_bo_move+0x39c/
0x740 [nouveau] <- nouveau_bo_move_m2mf.constprop.0) arg1=0xfffffff0 

8<------8<------8<------8<------8<------8<------8<------8<

This is the code for function ttm_bo_wait() in drivers/gpu/drm/ttm/ttm_bo.c:

   [..]
   1480 int ttm_bo_wait(struct ttm_buffer_object *bo,
   1481                 bool interruptible, bool no_wait)
   1482 {
   1483         long timeout = 15 * HZ;
   1484 
   1485         if (no_wait) {
   1486                 if (dma_resv_test_signaled_rcu(bo->base.resv, true))
   1487                         return 0;
   1488                 else
   1489                         return -EBUSY;
   1490         }
   1491 
>> 1492         timeout = dma_resv_wait_timeout_rcu(bo->base.resv, true,
   1493                                                       interruptible, 
timeout);
   1494         if (timeout < 0)
   1495                 return timeout;
   1496 
>> 1497         if (timeout == 0)
>> 1498                 return -EBUSY;
   1499 
   1500         dma_resv_add_excl_fence(bo->base.resv, NULL);
   1501         return 0;
   1502 }
   1503 EXPORT_SYMBOL(ttm_bo_wait);
   [..]

   
The -EBUSY value is returned from ttm_bo_wait() to ttm_bo_wait_free_node(), 
then to ttm_bo_move_accel_cleanup(), then to nouveau_bo_move_m2mf.constprop(), 
then to nouveau_bo_move() at line 1093 (see code below) and this activates in 
nouveau_bo_move() the fall back procedure from "hardware assisted copy" to 
"software copy" at line 1103 in /drivers/gpu/drm/nouveau/nouveau_bo.c (see 
code below): 

   [..]
   1053 nouveau_bo_move(struct ttm_buffer_object *bo, bool evict,
   1054                 struct ttm_operation_ctx *ctx,
   1055                 struct ttm_resource *new_reg)
   1056 {
   1057         struct nouveau_drm *drm = nouveau_bdev(bo->bdev);
   1058         struct nouveau_bo *nvbo = nouveau_bo(bo);
   1059         struct ttm_resource *old_reg = &bo->mem;
   1060         struct nouveau_drm_tile *new_tile = NULL;
   1061         int ret = 0;
   1062 
   1063         ret = ttm_bo_wait(bo, ctx->interruptible, ctx->no_wait_gpu);
   1064         if (ret)
   1065                 return ret;
   1066 
   1067         if (nvbo->pin_refcnt)
   1068                 NV_WARN(drm, "Moving pinned object %p!\n", nvbo);
   1069 
   1070         if (drm->client.device.info.family < NV_DEVICE_INFO_V0_TESLA) 
{
   1071                 ret = nouveau_bo_vm_bind(bo, new_reg, &new_tile);
   1072                 if (ret)
   1073                         return ret;
   1074         }
   1075 
   1076         /* Fake bo copy. */
   1077         if (old_reg->mem_type == TTM_PL_SYSTEM && !bo->ttm) {
   1078                 ttm_bo_move_null(bo, new_reg);
   1079                 goto out;
   1080         }
   1081 
>> 1082         /* Hardware assisted copy. */
   1083         if (drm->ttm.move) {
   1084                 if (new_reg->mem_type == TTM_PL_SYSTEM)
   1085                         ret = nouveau_bo_move_flipd(bo, evict,
   1086                                                     ctx-
>interruptible,
   1087                                                     ctx->no_wait_gpu, 
new_reg);
   1088                 else if (old_reg->mem_type == TTM_PL_SYSTEM)
   1089                         ret = nouveau_bo_move_flips(bo, evict,
   1090                                                     ctx-
>interruptible,
   1091                                                     ctx->no_wait_gpu, 
new_reg);
   1092                 else
>> 1093                         ret = nouveau_bo_move_m2mf(bo, evict,
>> 1094                                                    ctx->interruptible,
>> 1095                                                    ctx->no_wait_gpu, 
new_reg);
   1096                 if (!ret)
   1097                         goto out;
   1098         }
   1099 
>> 1100         /* Fallback to software copy. */
>> 1101         ret = ttm_bo_wait(bo, ctx->interruptible, ctx->no_wait_gpu);
>> 1102         if (ret == 0)
>> 1103                 ret = ttm_bo_move_memcpy(bo, ctx, new_reg);
   1104 
   1105 out:
   1106         if (drm->client.device.info.family < NV_DEVICE_INFO_V0_TESLA) 
{
   1107                 if (ret)
   1108                         nouveau_bo_vm_cleanup(bo, NULL, &new_tile);
   1109                 else
   1110                         nouveau_bo_vm_cleanup(bo, new_tile, &nvbo-
>tile);
   1111         }
   1112 
>> 1113         return ret;
   1114 }
   [..]

The loop inside the function ttm_resource_manager_force_list_clean() (at line 
104 in drivers/gpu/drm/ttm/resource.c) makes some iterations, then it stops 
when the function ttm_bo_handle_move_mem() fails and ttm_mem_evict_first() 
return an error value:

    [..]
     78  * ttm_resource_manager_force_list_clean
     79  *
     80  * @bdev - device to use
     81  * @man - manager to use
     82  *
     83  * Force all the objects out of a memory manager until clean.
     84  * Part of memory manager cleanup sequence.
     85  */
     86 int ttm_resource_manager_force_list_clean(struct ttm_bo_device *bdev,
     87                                           struct ttm_resource_manager 
*man)
     88 {
     89         struct ttm_operation_ctx ctx = {
     90                 .interruptible = false,
     91                 .no_wait_gpu = false,
     92                 .flags = TTM_OPT_FLAG_FORCE_ALLOC
     93         };
     94         struct ttm_bo_global *glob = &ttm_bo_glob;
     95         struct dma_fence *fence;
     96         int ret;
     97         unsigned i;
     98 
     99         /*
    100          * Can't use standard list traversal since we're unlocking.
    101          */
    102 
    103         spin_lock(&glob->lru_lock);
 >> 104         for (i = 0; i < TTM_MAX_BO_PRIORITY; ++i) {
    105                 while (!list_empty(&man->lru[i])) {
    106                         spin_unlock(&glob->lru_lock);
 >> 107                         ret = ttm_mem_evict_first(bdev, man, NULL, 
&ctx,
 >> 108                                                   NULL);
 >> 109                         if (ret)
 >> 110                                 return ret;
    111                         spin_lock(&glob->lru_lock);
    112                 }
    113         }
    114         spin_unlock(&glob->lru_lock);
    115 
    116         spin_lock(&man->move_lock);
    117         fence = dma_fence_get(man->move);
    118         spin_unlock(&man->move_lock);
    119 
    120         if (fence) {
    121                 ret = dma_fence_wait(fence, false);
    122                 dma_fence_put(fence);
    123                 if (ret)
    124                         return ret;
    125         }
    126 
    127         return 0;
    128 }
    129 EXPORT_SYMBOL(ttm_resource_manager_force_list_clean);
    [..]

The "Buffer eviction failed" error message is returned by function 
ttm_bo_evict() at line 637 in /drivers/gpu/drm/ttm/ttm_bo.c when 
ttm_bo_handle_move_mem() fails:

    [..]
    598 static int ttm_bo_evict(struct ttm_buffer_object *bo,
    599                         struct ttm_operation_ctx *ctx)
    600 {
    601         struct ttm_bo_device *bdev = bo->bdev;
    602         struct ttm_resource evict_mem;
    603         struct ttm_placement placement;
    604         int ret = 0;
    605 
    606         dma_resv_assert_held(bo->base.resv);
    607 
    608         placement.num_placement = 0;
    609         placement.num_busy_placement = 0;
    610         bdev->driver->evict_flags(bo, &placement);
    611 
    612         if (!placement.num_placement && !placement.num_busy_placement) 
{
    613                 ttm_bo_wait(bo, false, false);
    614 
    615                 ttm_bo_cleanup_memtype_use(bo);
    616                 return ttm_tt_create(bo, false);
    617         }
    618 
    619         evict_mem = bo->mem;
    620         evict_mem.mm_node = NULL;
    621         evict_mem.bus.offset = 0;
    622         evict_mem.bus.addr = NULL;
    623 
    624         ret = ttm_bo_mem_space(bo, &placement, &evict_mem, ctx);
    625         if (ret) {
    626                 if (ret != -ERESTARTSYS) {
    627                         pr_err("Failed to find memory space for buffer 
0x%p eviction\n",
    628                                bo);
    629                         ttm_bo_mem_space_debug(bo, &placement);
    630                 }
    631                 goto out;
    632         }
    633 
>>  634         ret = ttm_bo_handle_move_mem(bo, &evict_mem, true, ctx);
>>  635         if (unlikely(ret)) {
>>  636                 if (ret != -ERESTARTSYS)
>>  637                         pr_err("Buffer eviction failed\n");
>>  638                 ttm_resource_free(bo, &evict_mem);
>>  639         }
    640 out:
    641         return ret;
    642 }
    [..]

So, this is what I've found so far tracing the kernel.

The activation of the debug features [14][15] didn't show useful error or 
warning messages in system logs about memory leaks or kernel oops/warnings 
related to failure of GPU buffers eviction.

The only interesting message (so far) appears in kernel 5.16, when, during 
suspension to RAM, a warning about a "possible circular locking dependency 
detected" is shown (see attachment linux-5.16-lock-circular-dump.log.txt). But 
this warning appears regardless the computer is activated with or without 
activation of init_on_alloc and init_on_free kernel features: it appears both 
in success or in failure of suspension to RAM.

Now, just a small recap. 

The issue is triggered by the activation of init_on_alloc and init_on_free 
kernel feature (that are activated by default in the lasted stable Debian 
release, for example).

I suspect that, during suspend to RAM, the issue is caused by:

    1) failure of buffers eviction for the nvidia GPU (the copy of video 
memory and GPU's pipelines to RAM, I suppose) 

    2) then, the kernel suspends the computer anyway, leaving the internal 
data structures of the nouveau GPU module (and/or of the DRM module) in an 
inconsistent state

    3) then, if the graphical console is active/activated (e.g. ALT-F7), the 
nouveau driver instantly fails (probably due to the inconsistent state of its 
internal data structures)

    4) then, the kernel hangs the computer with multiple repeated errors, 
making the system unusable.

The issue is constantly replicable, therefore I can carry out further tests, 
if you wish to suggest them.

I'm still looking for clues, comments and advices to understand why buffer 
eviction fails: I would like to find (or help someone else to find) a stable 
fix for this issue.

The detailed logs are available on request (I cannot post more than 100 KB on 
nouveau mailing list).

Thanks for any advice or comment.

8<------8<------8<------8<------8<------8<------8<------8<

References:
    
[1]  function nouveau_do_suspend(), see https://elixir.bootlin.com/linux/
v5.10.87/source/drivers/gpu/drm/nouveau/
nouveau_drm.c#L841===========================================================
[2]  https://www.kernel.org/doc/html/v5.10/trace/ftrace.html ; https://
manpages.debian.org/bullseye/trace-cmd/trace-cmd.1.en.html
[3]  https://jvns.ca/blog/2017/03/19/getting-started-with-ftrace/
[4]  https://www.kernel.org/doc/html/v5.10/vm/slub.html
[5]  https://elixir.bootlin.com/linux/v5.10.50/source/mm/page_alloc.c#L191
[6]  function ttm_resource_manager_force_list_clean(): https://
elixir.bootlin.com/linux/v5.10.87/source/drivers/gpu/drm/ttm/
ttm_resource.c#L86
[7]  function ttm_bo_move_accel_cleanup(), see https://elixir.bootlin.com/
linux/v5.10.50/source/drivers/gpu/drm/ttm/ttm_bo_util.c#L606
[8]  function ttm_bo_wait, see https://elixir.bootlin.com/linux/v5.10.50/
source/drivers/gpu/drm/ttm/ttm_bo_util.c#L529
[9]  function dma_resv_wait_timeout_rcu, see https://elixir.bootlin.com/linux/
v5.10.50/source/drivers/dma-buf/dma-resv.c#L532
[10] function dma_fence_default_wait, see https://elixir.bootlin.com/linux/
v5.10.50/source/drivers/dma-buf/dma-fence.c#L674
[11] https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=989705#5
[12] https://gitlab.freedesktop.org/xorg/driver/xf86-video-nouveau/-/issues/
547
[13] https://bugzilla.kernel.org/show_bug.cgi?id=213617
[14] https://www.kernel.org/doc/html/v4.10/dev-tools/kmemleak.html
[15] https://www.kernel.org/doc/Documentation/locking/lockdep-design.txt



