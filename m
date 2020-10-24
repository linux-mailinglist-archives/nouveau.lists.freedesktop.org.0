Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BE92297A88
	for <lists+nouveau@lfdr.de>; Sat, 24 Oct 2020 05:39:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B2576E027;
	Sat, 24 Oct 2020 03:39:18 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EEEAF6E027
 for <nouveau@lists.freedesktop.org>; Sat, 24 Oct 2020 03:39:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1603510706;
 bh=z2fZJ+74FdCw6KSbABz34DjIc1OZizInioY9naIqR34=;
 h=X-UI-Sender-Class:Subject:From:To:Cc:Date:In-Reply-To:References;
 b=AYY66JrbQWQ7mJoji68IQ4UpO4A9Nd9xvhs54Zju2Wo11gBCPvdcDxyalDMvXorHg
 twpdpIcqdB0jJLPzX8m/kD78O5icrt9z/bodCyOLtefLTomBeTUF582gR3hLISeCEN
 AT8869dusVlcm8EhXuizEsCPU9bTZB+QzGH4bGcc=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from homer.simpson.net ([185.221.151.75]) by mail.gmx.com (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1M8ykW-1kSLA42o1W-006BUb; Sat, 24
 Oct 2020 05:38:26 +0200
Message-ID: <8922fa338e3ea737371875b007ca8451b961bc0a.camel@gmx.de>
From: Mike Galbraith <efault@gmx.de>
To: Hillf Danton <hdanton@sina.com>, Sebastian Andrzej Siewior
 <bigeasy@linutronix.de>
Date: Sat, 24 Oct 2020 05:38:23 +0200
In-Reply-To: <20201024022236.19608-1-hdanton@sina.com>
References: <20201021125324.ualpvrxvzyie6d7d@linutronix.de>
 <a23a826af7c108ea5651e73b8fbae5e653f16e86.camel@gmx.de>
 <20201023090108.5lunh4vqfpkllmap@linutronix.de>
 <20201024022236.19608-1-hdanton@sina.com>
User-Agent: Evolution 3.34.4 
MIME-Version: 1.0
X-Provags-ID: V03:K1:klYpJ5JyXopHwA7RwvqCM/67JvMOtvUl0u2nwj4adS2U6PbO/Pn
 1+d55NWQHHPy+E5A435zc2U45GY/x4w8JT7S1nRwG786s9sYwm3+Vi4S99Q1NUtABU/wjbb
 tG9xTP+jhiBARamx1LGTq7pvz9a6iF5gB3nXrms6OZGhA4bGwdNbKnkiqmm8U7bZL/H8GKO
 s+5JupkCl3UklbPTUpFCw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:BRZF/EVgMRw=:n8LJpsWlXu7tsk5HkID0cq
 UspbueVploQFEOMZl1w15PV5YTH9SbxHquEKKW9zvD7FDFC6yp/tVXKsXplFCwdXzMny22O/w
 nQXGNrHBdbvVsjyzfLF8PPCUQMbDCXkii2yafZddyWhRu0UWJi8UC3gFoijoKMZ4VBB/t5YE/
 A7F8P3oEge87D5x6bD7ELcOBu6dSV7xHKfuVlVjcQOIp6sBNBL1cXzQVCQpb27gWx9yazgnaP
 jdBzfKFi2zC6bNZIhFD5g6vaBa+mXnb3cfILfAh+exQNCb7s8U24glnULJu9Mhx1L2rhnm6x1
 Yy9LFKAVdqm1nkkSR9O7vr/KofW3lG8XuuKG6apBVt8QC2aHD6PUS7h7caFumm1QYx34c9WFn
 eNkkxr2EbpMY5vcjtvpO83fu6asy+8vncSa5eUbNJonKz6+O1xvJaqKu9CNp7lwXo2L0M1yiE
 lVhQ4ciHOmp3aYBG8CHL+Sza6YMBhvBEmZwSDJPGk34bFdQ6wBuu0nefJYoaLLG+0UIHZeaAh
 EGWc2TP2v5ZdxMRPu+oPqV0dGFfGSWnE3tYkTwdD/2cvIfpoS1u2uW1zum17n68EsuxDZQ9Lu
 WS7VmtkfwuoA1OMszKdhfFlFPTSvDACmSuSWTpvs1qgTP289TB82MKMB9SMgxey1ChtOOsqM/
 8daEV28+JbsjRm0jzf2d9sybFoCeIUogUgfF4rXyQJ033VIex8BKHpL1jZqlESE+RKFxOcON2
 dyNUfLBpiCsqqlGvvceFx7QRkLJhczIwyj5GsSYDnPt03HT2UsBaEtlo4N2ShGEUEa9mpTWTx
 JJhikuWPdqztXmBNVjB2W+6E5m0XLbjfOXukukIH8Ma0yF7x79X6UKaCvw1X0dS3lLnmQyOAf
 9HnG72xiYUe02ClDP8lw==
Subject: Re: [Nouveau] kvm+nouveau induced lockdep  gripe
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
Cc: linux-rt-users <linux-rt-users@vger.kernel.org>,
 nouveau@lists.freedesktop.org, LKML <linux-kernel@vger.kernel.org>,
 Steven Rostedt <rostedt@goodmis.org>, Ben Skeggs <bskeggs@redhat.com>,
 Thomas Gleixner <tglx@linutronix.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

On Sat, 2020-10-24 at 10:22 +0800, Hillf Danton wrote:
>
> Looks like we can break the lock chain by moving ttm bo's release
> method out of mmap_lock, see diff below.

Ah, the perfect compliment to morning java, a patchlet to wedge in and
see what happens.

wedge/build/boot <schlurp... ahhh>

Mmm, box says no banana... a lot.

[   30.456921] ================================
[   30.456924] WARNING: inconsistent lock state
[   30.456928] 5.9.0.gf11901e-master #2 Tainted: G S          E
[   30.456932] --------------------------------
[   30.456935] inconsistent {SOFTIRQ-ON-W} -> {IN-SOFTIRQ-W} usage.
[   30.456940] ksoftirqd/4/36 [HC0[0]:SC1[1]:HE1:SE0] takes:
[   30.456944] ffff8e2c8bde9e40 (&mgr->vm_lock){++?+}-{2:2}, at: drm_vma_offset_remove+0x14/0x70 [drm]
[   30.456976] {SOFTIRQ-ON-W} state was registered at:
[   30.456982]   lock_acquire+0x1a7/0x3b0
[   30.456987]   _raw_write_lock+0x2f/0x40
[   30.457006]   drm_vma_offset_add+0x1c/0x60 [drm]
[   30.457013]   ttm_bo_init_reserved+0x28b/0x460 [ttm]
[   30.457020]   ttm_bo_init+0x57/0x110 [ttm]
[   30.457066]   nouveau_bo_init+0xb0/0xc0 [nouveau]
[   30.457108]   nouveau_bo_new+0x4d/0x60 [nouveau]
[   30.457145]   nv84_fence_create+0xb9/0x130 [nouveau]
[   30.457180]   nvc0_fence_create+0xe/0x47 [nouveau]
[   30.457221]   nouveau_drm_device_init+0x3d9/0x800 [nouveau]
[   30.457262]   nouveau_drm_probe+0xfb/0x200 [nouveau]
[   30.457268]   local_pci_probe+0x42/0x90
[   30.457272]   pci_device_probe+0xe7/0x1a0
[   30.457276]   really_probe+0xf7/0x4d0
[   30.457280]   driver_probe_device+0x5d/0x140
[   30.457284]   device_driver_attach+0x4f/0x60
[   30.457288]   __driver_attach+0xa4/0x140
[   30.457292]   bus_for_each_dev+0x67/0x90
[   30.457296]   bus_add_driver+0x18c/0x230
[   30.457299]   driver_register+0x5b/0xf0
[   30.457304]   do_one_initcall+0x54/0x2f0
[   30.457309]   do_init_module+0x5b/0x21b
[   30.457314]   load_module+0x1e40/0x2370
[   30.457317]   __do_sys_finit_module+0x98/0xe0
[   30.457321]   do_syscall_64+0x33/0x40
[   30.457326]   entry_SYSCALL_64_after_hwframe+0x44/0xa9
[   30.457329] irq event stamp: 366850
[   30.457335] hardirqs last  enabled at (366850): [<ffffffffa11312ff>] rcu_nocb_unlock_irqrestore+0x4f/0x60
[   30.457342] hardirqs last disabled at (366849): [<ffffffffa11384ef>] rcu_do_batch+0x59f/0x990
[   30.457347] softirqs last  enabled at (366834): [<ffffffffa1c002d7>] __do_softirq+0x2d7/0x4a4
[   30.457357] softirqs last disabled at (366839): [<ffffffffa10928c2>] run_ksoftirqd+0x32/0x60
[   30.457363]
               other info that might help us debug this:
[   30.457369]  Possible unsafe locking scenario:

[   30.457375]        CPU0
[   30.457378]        ----
[   30.457381]   lock(&mgr->vm_lock);
[   30.457386]   <Interrupt>
[   30.457389]     lock(&mgr->vm_lock);
[   30.457394]
                *** DEADLOCK ***

<snips 999 lockdep lines and zillion ATOMIC_SLEEP gripes>

_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
