Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 232F13F1EF8
	for <lists+nouveau@lfdr.de>; Thu, 19 Aug 2021 19:22:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A39F6E9AF;
	Thu, 19 Aug 2021 17:22:14 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA1C06E9AF
 for <nouveau@lists.freedesktop.org>; Thu, 19 Aug 2021 17:22:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1629393729;
 bh=0k/aAN1ztsxRUTPxYM5zadRQI/78Nkk5aVyBYW5Uj4k=;
 h=X-UI-Sender-Class:Subject:From:To:Cc:Date;
 b=QfXPLTCZDGJgzSn4G7HZ33gFx+HZmn1V3c1hd/oMpv2g3s3JWvKITXKzx+0lU1iEC
 ohymkDM4kTV2KdgIDW/EyYymAp8bEuLmxfFqyTdQNENrOWDN39DQb1BJIekTbiB60I
 G/r+42dp1eihyr7+vC2DFLJo3pplk2JI/gQsqxOM=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from homer.fritz.box ([185.221.149.87]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MvbBu-1n5qj918qM-00scQD; Thu, 19
 Aug 2021 19:22:09 +0200
Message-ID: <e5047d1333c75b93c82c988d77c4c573e9835d5c.camel@gmx.de>
From: Mike Galbraith <efault@gmx.de>
To: lkml <linux-kernel@vger.kernel.org>
Cc: nouveau <nouveau@lists.freedesktop.org>, Ben Skeggs <bskeggs@redhat.com>
Date: Thu, 19 Aug 2021 19:22:08 +0200
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.3 
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:P2v5GTbSFZrJaIIq5RD/GPQj7mubtmascAzYUGAw1h4SrOKPLho
 EqV+CUCG76Rham66/bJG+9sLp1K3iTWJPXwgaz/Jdw7ETRjS9jLX7bnSfKCmzGqaaDxlL7f
 Y5qovrjovEoz7BXSmeiQVsZZq87YXhgQoqRB6q5zdsq+tFdPsO7mjzohsO5tkWz3Zi1Cwqi
 T633YuVaQeKd2u0/irCYA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:aLbsyWX1m1k=:3R5Ilm3VwAMRhUEw0yGtHc
 Ri+wuRxniP3Y6V9x8O+GDrqY5rrl7zL069VcvuoTIqe9UkT+XirEP50IviLNsDr3rd/NY2iVJ
 4LQPBdjYGnpQ9pxw4HhDi2i8qNqTZY3cXrkV6dP7KSJW7sim42ycjw14e1SfNFknntbaljhc9
 5jhSbZZsLDojgzRhgZh0irsJ3Txu2bLKSxL2Em+P1OJAg+GAqHNuvT0a4PVEQWJbmj1zgfAsP
 16aQkvPZXee36jr8zmVmcejamU6j3D7NHg2D1VzwNzjhe/ii3Md3CzbcOpGwwC6y9p7tOtNuq
 rmOWZ/5fRvnarWR3ue+6KHiU0d8QRoou67XBWokRbs/6IbC0CS3l13EzKcjSZcqW3EuGEUg80
 rp6Lt+tNN7/oLHchZkX6Oy2EV5CEZB7iR80yJDcNTo+S488R2voGeUckGsqZO0/GmhsiAeqga
 EZrqCA/oFK+6sD1bDH/cHdDJOQ1OARrs57al8DvzPvwFsZrVwtcDrD8FPKvCcwuu5L2Er6lYC
 QefJ/yOH3wYbqe3OnFWqvkB7XTzs70d9zYUmjinDbq1yHzjCkKFt4tPgmWYGU61gQN8cojY8X
 xAIu1yVoAzJiASmKPEpyB3uJnWyadASRsY8sxdzJcTqaeQ+qrNRWKsCVW6jsBAO2r6pj50ASk
 xiVoRPkljqBHemOxlOFhF89Z33/qdZv3oTKc7KKOUUU/O70xM0Pm96+0ozhLa/FtmOYclymXC
 icLEbn3d0N0HEMTGjtCAhFWFTLYGvE9O/UtCRfuF+rNyJBe7gZg9LkmG+oDiLPbPBoij6o0VR
 mwrv13cUrirMUFJJEKimNoeqrZmRdUm01ioaM9NGJM+8ZjAjW9s9EUofakL3JyWmp2r95a9BO
 SsekoSRBaVDDJPR4maiZZ98eBESE8GrvNwp/QTzvVmacdU+eALyx046plSm6eKs3YbBp7Xq9L
 Kb911Xtvbiv84TV9PD4HUY95nUgIB4CaeU50WwscAdkj3Bt61oMruPjPtgw2vPOagn/3hctyo
 CSU3zJXidPMqaFYiQzlvbnGVeeWZvYulyriwr7NdIdWoO9iK5AWsQbuaEIhCp32E3AdGfNuRX
 JbGFwz8hVZiT8Xs/YJci3RDy4XesfYT63B77Ado0Z+tPhiAW3lXpWCxgw==
Subject: [Nouveau] kcsan+slub+nouveau+threadirqs  --> kaBoOm
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

Greetings,

I had thought SLAB_FREELIST_HARDENED=3Dy was also a required explosion
ingredient, but turns out it's not, as I got a NULL pointer explosion
(below first explosion) as I was composing this with it turned off.

There are various stack traces w. SLAB_FREELIST_HARDENED enabled, all
ending in an allocation exploding in slub::freelist_ptr(). I first met
this in RT after twiddling KCSAN to make it usable in RT kernels, but
it's not RT related, as shown by the virgin master explosions below,
you just have to add threadirqs to make virgin source explode.

Below the second explosion is an interesting looking kcsan use after
free assertion.  It came from a tip-rt kernel, but that _seems_ to be
irrelevant.  It was emitted immediately before a SLAB_FREELIST_HARDENED
slub::freelist_ptr() explosion common to virgin master, master-rt, tip
and tip-rt.. iow everywhere.  Many kcsan grumbles are common ground
too, so I have no reason to suspect it of being any more inventive at
sending me on snipe hunts in RT kernels than it is in virgin source.
 =20
SLAB_FREELIST_HARDENED=3Dy
[ 3404.198096] general protection fault, probably for non-canonical address=
 0xf6a2bc6e32c35c19: 0000 [#1] PREEMPT SMP NOPTI
[ 3404.198172] CPU: 1 PID: 2068 Comm: X Kdump: loaded Tainted: G           =
 E     5.14.0.gd6d09a6-master-kcsan #7
[ 3404.198271] Hardware name: MEDION MS-7848/MS-7848, BIOS M7848W08.20C 09/=
23/2013
[ 3404.198336] RIP: 0010:__kmalloc+0xa9/0x3e0
[ 3404.198360] Code: 48 8b 70 08 48 39 f2 75 e7 48 83 78 10 00 4c 8b 20 0f =
84 f3 02 00 00 4d 85 e4 0f 84 ea 02 00 00 41 8b 46 28 49 8b 3e 4c 01 e0 <48=
> 8b 18 48 89 c1 49 33 9e b8 00 00 00 4c 89 e0 48 0f c9 48 31 cb
[ 3404.198479] RSP: 0018:ffff888103d5b840 EFLAGS: 00010282
[ 3404.198494] RAX: f6a2bc6e32c35c19 RBX: ffff8881021ac170 RCX: 00000000000=
308e0
[ 3404.198543] RDX: 000000000076f479 RSI: 000000000076f479 RDI: 00000000000=
308e0
[ 3404.198559] RBP: 0000000000000cc0 R08: 0000000000000000 R09: 00018882c1e=
255b0
[ 3404.198636] R10: 0001ffffffffffff R11: 00018882c1e255b7 R12: f6a2bc6e32c=
35be9
[ 3404.198723] R13: ffff888103d5b930 R14: ffff888100042600 R15: ffffffffa06=
b6b7a
[ 3404.198739] FS:  00007f11832b36c0(0000) GS:ffff88840ec40000(0000) knlGS:=
0000000000000000
[ 3404.198782] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[ 3404.198818] CR2: 00007f1113f68000 CR3: 000000012380e006 CR4: 00000000001=
706e0
[ 3404.198902] Call Trace:
[ 3404.198914]  nvif_object_ctor+0xca/0x2c0 [nouveau]
[ 3404.201154]  ? nvkm_memory_unref+0x35/0x60 [nouveau]
[ 3404.202793]  ? nvkm_uvmm_mthd_map.isra.0+0x1e5/0x370 [nouveau]
[ 3404.204822]  nvif_mem_ctor_type+0x11b/0x1f0 [nouveau]
[ 3404.206816]  ? wq_calc_node_cpumask+0xd0/0x180
[ 3404.206833]  ? sugov_update_single_freq+0x62/0x180
[ 3404.206861]  ? copyout+0x6e/0x80
[ 3404.206873]  ? pollwake+0x2a/0xf0
[ 3404.206900]  nouveau_mem_vram+0x14f/0x270 [nouveau]
[ 3404.208761]  nouveau_vram_manager_new+0x108/0x140 [nouveau]
[ 3404.210775]  ? dma_resv_reserve_shared+0x21e/0x2b0
[ 3404.210865]  ttm_resource_alloc+0x70/0x80 [ttm]
[ 3404.210962]  ttm_bo_mem_space+0xfc/0x400 [ttm]
[ 3404.211089]  ? ttm_bo_mem_compat+0x81/0xb0 [ttm]
[ 3404.211317]  ttm_bo_validate+0xa9/0x1d0 [ttm]
[ 3404.211382]  ? _raw_write_unlock+0x1b/0x30
[ 3404.211477]  ? drm_vma_offset_add+0x3b/0x70 [drm]
[ 3404.212429]  ttm_bo_init_reserved+0x300/0x3c0 [ttm]
[ 3404.212568]  ttm_bo_init+0x92/0x140 [ttm]
[ 3404.212682]  ? nouveau_ttm_io_mem_free+0x90/0x90 [nouveau]
[ 3404.214454]  nouveau_bo_init+0x90/0xa0 [nouveau]
[ 3404.216180]  ? nouveau_ttm_io_mem_free+0x90/0x90 [nouveau]
[ 3404.218047]  nouveau_gem_new+0xe9/0x190 [nouveau]
[ 3404.219953]  nouveau_gem_ioctl_new+0xaa/0x150 [nouveau]
[ 3404.222151]  ? nouveau_gem_new+0x190/0x190 [nouveau]
[ 3404.224316]  drm_ioctl_kernel+0xd7/0x130 [drm]
[ 3404.224998]  ? nouveau_gem_new+0x190/0x190 [nouveau]
[ 3404.226734]  drm_ioctl+0x28c/0x4a0 [drm]
[ 3404.227516]  ? __fdget+0xf/0x10
[ 3404.227562]  ? __rcu_read_unlock+0x53/0x70
[ 3404.227608]  nouveau_drm_ioctl+0x8a/0x100 [nouveau]
[ 3404.229971]  __x64_sys_ioctl+0xb2/0xd0
[ 3404.229985]  do_syscall_64+0x36/0x80
[ 3404.230118]  entry_SYSCALL_64_after_hwframe+0x44/0xae
[ 3404.230159] RIP: 0033:0x7f1180b5a807
[ 3404.230170] Code: b3 66 90 48 8b 05 89 76 2d 00 64 c7 00 26 00 00 00 48 =
c7 c0 ff ff ff ff c3 66 2e 0f 1f 84 00 00 00 00 00 b8 10 00 00 00 0f 05 <48=
> 3d 01 f0 ff ff 73 01 c3 48 8b 0d 59 76 2d 00 f7 d8 64 89 01 48
[ 3404.230272] RSP: 002b:00007ffca7b71fe8 EFLAGS: 00000246 ORIG_RAX: 000000=
0000000010
[ 3404.230289] RAX: ffffffffffffffda RBX: 000055abce254dc0 RCX: 00007f1180b=
5a807
[ 3404.230374] RDX: 00007ffca7b72040 RSI: 00000000c0306480 RDI: 00000000000=
0000e
[ 3404.230388] RBP: 00007ffca7b72040 R08: 0000000000000000 R09: 00000000000=
0000c
[ 3404.230454] R10: 0000000000000030 R11: 0000000000000246 R12: 00000000c03=
06480
[ 3404.230518] R13: 000000000000000e R14: 000055abce27d9d0 R15: 000055abcd7=
6caf0
[ 3404.230535] Modules linked in: af_packet(E) ip6table_mangle(E) ip6table_=
raw(E) iptable_raw(E) bridge(E) stp(E) llc(E) iscsi_ibft(E) iscsi_boot_sysf=
s(E) nfnetlink(E) ebtable_filter(E) ebtables(E) ip6table_filter(E) rfkill(E=
) ip6_tables(E) iptable_filter(E) ip_tables(E) x_tables(E) bpfilter(E) hid_=
logitech_hidpp(E) nls_iso8859_1(E) nls_cp437(E) usblp(E) joydev(E) hid_logi=
tech_dj(E) intel_rapl_msr(E) intel_rapl_common(E) x86_pkg_temp_thermal(E) i=
ntel_powerclamp(E) coretemp(E) kvm_intel(E) snd_hda_codec_realtek(E) snd_hd=
a_codec_generic(E) ledtrig_audio(E) snd_hda_codec_hdmi(E) kvm(E) snd_hda_in=
tel(E) iTCO_wdt(E) snd_intel_dspcfg(E) intel_pmc_bxt(E) at24(E) irqbypass(E=
) mei_hdcp(E) regmap_i2c(E) snd_hda_codec(E) crct10dif_pclmul(E) iTCO_vendo=
r_support(E) crc32_pclmul(E) snd_hwdep(E) ghash_clmulni_intel(E) snd_hda_co=
re(E) snd_pcm(E) aesni_intel(E) r8169(E) snd_timer(E) crypto_simd(E) i2c_i8=
01(E) realtek(E) cryptd(E) mdio_devres(E) pcspkr(E) i2c_smbus(E) snd(E) mei=
_me(E) lpc_ich(E)
[ 3404.230993]  soundcore(E) libphy(E) mei(E) mfd_core(E) thermal(E) fan(E)=
 intel_smartconnect(E) sch_fq_codel(E) nfsd(E) auth_rpcgss(E) nfs_acl(E) lo=
ckd(E) grace(E) fuse(E) configfs(E) sunrpc(E) efivarfs(E) uas(E) usb_storag=
e(E) hid_generic(E) usbhid(E) nouveau(E) wmi(E) drm_ttm_helper(E) ttm(E) i2=
c_algo_bit(E) drm_kms_helper(E) syscopyarea(E) sysfillrect(E) sysimgblt(E) =
fb_sys_fops(E) cec(E) rc_core(E) xhci_pci(E) ahci(E) ehci_pci(E) libahci(E)=
 xhci_hcd(E) ehci_hcd(E) drm(E) libata(E) usbcore(E) video(E) button(E) sd_=
mod(E) t10_pi(E) vfat(E) fat(E) virtio_blk(E) virtio_mmio(E) virtio_ring(E)=
 virtio(E) ext4(E) crc32c_intel(E) crc16(E) mbcache(E) jbd2(E) sg(E) dm_mul=
tipath(E) dm_mod(E) scsi_dh_rdac(E) scsi_dh_emc(E) scsi_dh_alua(E) scsi_mod=
(E) msr(E) autofs4(E)
[ 3404.232037] Dumping ftrace buffer:
[ 3404.232047]    (ftrace buffer empty)

homer:..kernel/linux-master # scripts/faddr2line vmlinux __kmalloc+0xa9
__kmalloc+0xa9/0x3e0:
freelist_ptr at mm/slub.c:276
(inlined by) freelist_dereference at mm/slub.c:287
(inlined by) get_freepointer at mm/slub.c:294
(inlined by) get_freepointer_safe at mm/slub.c:308
(inlined by) slab_alloc_node at mm/slub.c:2927
(inlined by) slab_alloc at mm/slub.c:2967
(inlined by) __kmalloc at mm/slub.c:4111

!SLAB_FREELIST_HARDENED
[ 3015.378226] BUG: kernel NULL pointer dereference, address: 0000000000000=
010
[ 3015.378257] #PF: supervisor read access in kernel mode
[ 3015.378344] #PF: error_code(0x0000) - not-present page
[ 3015.378357] PGD 0 P4D 0=20
[ 3015.378368] Oops: 0000 [#1] PREEMPT SMP NOPTI
[ 3015.378399] CPU: 3 PID: 5952 Comm: kworker/3:0 Kdump: loaded Tainted: G =
           E     5.14.0.gd6d09a6-master-kcsan #8
[ 3015.378423] Hardware name: MEDION MS-7848/MS-7848, BIOS M7848W08.20C 09/=
23/2013
[ 3015.378501] Workqueue: events nouveau_cli_work [nouveau]
[ 3015.380528] RIP: 0010:nvkm_vmm_put_locked+0x2d5/0x4c0 [nouveau]
[ 3015.382485] Code: 8d 04 5b 4c 8d 2c c1 c0 ea 03 49 8d 7d 08 83 e2 01 88 =
14 24 e8 7c be ab e0 49 8b 5d 08 48 8d 7b 10 e8 6f be ab e0 0f b6 14 24 <48=
> 8b 5b 10 84 d2 74 3b 48 8d 7b 10 e8 5a be ab e0 48 8b 43 10 50
[ 3015.382563] RSP: 0018:ffff888158e3ba18 EFLAGS: 00010246
[ 3015.382578] RAX: ffff88816d38ab78 RBX: 0000000000000000 RCX: ffffffff82e=
dbf18
[ 3015.382679] RDX: 0000000000000000 RSI: 0000000000000010 RDI: 00000000000=
00010
[ 3015.382694] RBP: 0000000000000000 R08: 0000000000000000 R09: 0001fffffff=
fffff
[ 3015.382709] R10: 000188816fb8a7b6 R11: 0000000000000017 R12: 0003ffffa09=
38400
[ 3015.382732] R13: ffffffffa08e2728 R14: ffff88816d1802a0 R15: 0003fffffff=
fffff
[ 3015.382747] FS:  0000000000000000(0000) GS:ffff88840ecc0000(0000) knlGS:=
0000000000000000
[ 3015.382822] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[ 3015.382901] CR2: 0000000000000010 CR3: 000000014b9bc001 CR4: 00000000001=
706e0
[ 3015.382916] Call Trace:
[ 3015.382945]  nvkm_uvmm_mthd_put.isra.0+0x16c/0x180 [nouveau]
[ 3015.385002]  nvkm_uvmm_mthd+0x497/0x590 [nouveau]
[ 3015.387022]  ? update_sg_lb_stats+0x71/0x360
[ 3015.387041]  nvkm_object_mthd+0x42/0x60 [nouveau]
[ 3015.389090]  nvkm_ioctl_mthd+0xab/0xc0 [nouveau]
[ 3015.391100]  nvkm_ioctl+0x165/0x2b0 [nouveau]
[ 3015.393033]  ? nvkm_client_map+0x10/0x10 [nouveau]
[ 3015.395360]  nvkm_client_ioctl+0xe/0x10 [nouveau]
[ 3015.397581]  nvif_object_ioctl+0xac/0xd0 [nouveau]
[ 3015.399867]  nvif_object_mthd+0x121/0x150 [nouveau]
[ 3015.401818]  ? load_balance+0x14e/0x620
[ 3015.401836]  nvif_vmm_put+0x72/0xa0 [nouveau]
[ 3015.404299]  nouveau_vma_del+0xaf/0x130 [nouveau]
[ 3015.406160]  nouveau_gem_object_delete_work+0x38/0x50 [nouveau]
[ 3015.408130]  nouveau_cli_work+0x151/0x1c0 [nouveau]
[ 3015.409686]  process_one_work+0x421/0x730
[ 3015.409702]  worker_thread+0x2f1/0x7c0
[ 3015.409765]  ? rescuer_thread+0x700/0x700
[ 3015.409839]  kthread+0x1c3/0x1f0
[ 3015.409911]  ? set_kthread_struct+0x80/0x80
[ 3015.409926]  ret_from_fork+0x1f/0x30
[ 3015.409943] Modules linked in: af_packet(E) ip6table_mangle(E) ip6table_=
raw(E) iptable_raw(E) bridge(E) stp(E) llc(E) iscsi_ibft(E) iscsi_boot_sysf=
s(E) nfnetlink(E) ebtable_filter(E) ebtables(E) rfkill(E) ip6table_filter(E=
) ip6_tables(E) iptable_filter(E) ip_tables(E) x_tables(E) bpfilter(E) hid_=
logitech_hidpp(E) nls_iso8859_1(E) nls_cp437(E) usblp(E) hid_logitech_dj(E)=
 joydev(E) intel_rapl_msr(E) intel_rapl_common(E) x86_pkg_temp_thermal(E) i=
ntel_powerclamp(E) coretemp(E) kvm_intel(E) snd_hda_codec_realtek(E) iTCO_w=
dt(E) snd_hda_codec_hdmi(E) snd_hda_codec_generic(E) intel_pmc_bxt(E) ledtr=
ig_audio(E) mei_hdcp(E) iTCO_vendor_support(E) at24(E) snd_hda_intel(E) reg=
map_i2c(E) kvm(E) snd_intel_dspcfg(E) snd_hda_codec(E) r8169(E) irqbypass(E=
) snd_hwdep(E) realtek(E) crct10dif_pclmul(E) crc32_pclmul(E) snd_hda_core(=
E) ghash_clmulni_intel(E) mdio_devres(E) aesni_intel(E) lpc_ich(E) snd_pcm(=
E) i2c_i801(E) crypto_simd(E) i2c_smbus(E) snd_timer(E) cryptd(E) pcspkr(E)=
 libphy(E) mfd_core(E)
[ 3015.410359]  mei_me(E) snd(E) soundcore(E) mei(E) thermal(E) fan(E) inte=
l_smartconnect(E) sch_fq_codel(E) nfsd(E) auth_rpcgss(E) nfs_acl(E) lockd(E=
) grace(E) fuse(E) configfs(E) sunrpc(E) uas(E) usb_storage(E) hid_generic(=
E) usbhid(E) nouveau(E) wmi(E) drm_ttm_helper(E) ttm(E) i2c_algo_bit(E) drm=
_kms_helper(E) syscopyarea(E) sysfillrect(E) sysimgblt(E) fb_sys_fops(E) xh=
ci_pci(E) cec(E) ehci_pci(E) ahci(E) rc_core(E) ehci_hcd(E) libahci(E) xhci=
_hcd(E) libata(E) drm(E) usbcore(E) video(E) button(E) sd_mod(E) t10_pi(E) =
vfat(E) fat(E) virtio_blk(E) virtio_mmio(E) virtio_ring(E) virtio(E) ext4(E=
) crc32c_intel(E) crc16(E) mbcache(E) jbd2(E) sg(E) dm_multipath(E) dm_mod(=
E) scsi_dh_rdac(E) scsi_dh_emc(E) scsi_dh_alua(E) scsi_mod(E) msr(E) efivar=
fs(E) autofs4(E)
[ 3015.411401] Dumping ftrace buffer:
[ 3015.411464]    (ftrace buffer empty)
[ 3015.411472] CR2: 0000000000000010


[  606.571389] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
[  606.571402] BUG: KCSAN: assert: race in dma_fence_signal_timestamp_locke=
d / slab_free_freelist_hook
[  606.571415]=20
[  606.571417] assert no accesses to 0xffff888124eb5c00 of 96 bytes by task=
 4455 on cpu 1:
[  606.571422]  slab_free_freelist_hook+0xfc/0x170
[  606.571431]  kfree+0xac/0x430
[  606.571435]  nouveau_gem_object_delete_work+0x45/0x50 [nouveau]
[  606.571929]  nouveau_cli_work+0x16d/0x1f0 [nouveau]
[  606.572376]  process_one_work+0x472/0x8a0
[  606.572382]  worker_thread+0x30e/0x860
[  606.572388]  kthread+0x26d/0x290
[  606.572392]  ret_from_fork+0x1f/0x30
[  606.572398]=20
[  606.572399] read to 0xffff888124eb5c38 of 8 bytes by task 390 on cpu 3:
[  606.572404]  dma_fence_signal_timestamp_locked+0xfb/0x220
[  606.572412]  dma_fence_signal_locked+0x19/0x20
[  606.572420]  nouveau_fence_signal+0x1d/0x160 [nouveau]
[  606.572866]  nouveau_fence_wait_uevent_handler+0x9e/0x100 [nouveau]
[  606.573372]  nvif_notify+0x113/0x260 [nouveau]
[  606.573792]  nvkm_client_ntfy+0x78/0x80 [nouveau]
[  606.574241]  nvkm_client_notify+0x65/0x80 [nouveau]
[  606.574663]  nvkm_notify_send+0x164/0x230 [nouveau]
[  606.575086]  nvkm_event_send+0x10b/0x120 [nouveau]
[  606.575508]  nvkm_fifo_uevent+0x24/0x30 [nouveau]
[  606.575953]  gk104_fifo_intr+0x26d/0x4c0 [nouveau]
[  606.576423]  nvkm_fifo_intr+0x30/0x40 [nouveau]
[  606.576867]  nvkm_engine_intr+0x35/0x40 [nouveau]
[  606.577330]  nvkm_subdev_intr+0x2e/0x40 [nouveau]
[  606.577754]  nvkm_mc_intr+0x1f1/0x240 [nouveau]
[  606.578190]  nvkm_pci_intr+0x66/0xc0 [nouveau]
[  606.578625]  irq_forced_thread_fn+0x53/0xd0
[  606.578631]  irq_thread+0x254/0x380
[  606.578636]  kthread+0x26d/0x290
[  606.578641]  ret_from_fork+0x1f/0x30
[  606.578646]=20
[  606.578647] Reported by Kernel Concurrency Sanitizer on:
[  606.578650] CPU: 3 PID: 390 Comm: irq/30-nvkm Kdump: loaded Tainted: G  =
          E     5.14.0.g9e6333f-tip-kcsan-rt #11
[  606.578657] Hardware name: MEDION MS-7848/MS-7848, BIOS M7848W08.20C 09/=
23/2013
[  606.578660] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
[  606.579217] general protection fault, probably for non-canonical address=
 0xe6129813ee0c1dc6: 0000 [#1] PREEMPT_RT SMP NOPTI
[  606.579225] CPU: 1 PID: 2177 Comm: X Kdump: loaded Tainted: G           =
 E     5.14.0.g9e6333f-tip-kcsan-rt #11
[  606.579280] Hardware name: MEDION MS-7848/MS-7848, BIOS M7848W08.20C 09/=
23/2013
[  606.579283] RIP: 0010:___slab_alloc+0x4cf/0x710
[  606.579289] Code: 44 24 28 48 8b 34 24 4d 89 fe 48 89 46 10 e8 78 47 91 =
00 8b 55 28 48 8b 34 24 4c 01 f2 48 89 d0 48 0f c8 48 33 85 b8 00 00 00 <48=
> 33 02 48 83 46 08 08 48 89 06 48 8b 5d 00 48 83 c3 20 e8 49 47
[  606.579296] RSP: 0018:ffff888161687b38 EFLAGS: 00010202
[  606.579302] RAX: 4fa6f75858f7a607 RBX: 000000000002d0d0 RCX: 00000000000=
00000
[  606.579396] RDX: e6129813ee0c1dc6 RSI: ffff88840ec6d0b0 RDI: ffff8881099=
4802c
[  606.579400] RBP: ffff888100042600 R08: 0000000000000000 R09: 0001fffffff=
fffff
[  606.579414] R10: 0001ffffffffffff R11: 000188810994802f R12: ffffffffa08=
9d2fe
[  606.579419] R13: ffffea000493ad40 R14: e6129813ee0c1d96 R15: ffff8881000=
42600
[  606.579432] FS:  00007f6255b686c0(0000) GS:ffff88840ec40000(0000) knlGS:=
0000000000000000
[  606.579459] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[  606.579463] CR2: 00007f61ee7d4858 CR3: 00000001616c4002 CR4: 00000000001=
706e0
[  606.579468] Call Trace:
[  606.579471]  ? nouveau_gem_object_close+0x1ee/0x390 [nouveau]
[  606.581712]  ? rpm_resume+0x314/0xc40
[  606.581719]  ? is_percpu_thread+0x13/0x40
[  606.581746]  ? check_preemption_disabled+0x3e/0xd0
[  606.581753]  ? nouveau_gem_object_close+0x1ee/0x390 [nouveau]
[  606.583725]  ? nouveau_gem_object_close+0x1ee/0x390 [nouveau]
[  606.586563]  kmem_cache_alloc_trace+0x86/0x380
[  606.586571]  nouveau_gem_object_close+0x1ee/0x390 [nouveau]
[  606.588383]  ? __rcu_read_unlock+0x57/0x80
[  606.588393]  drm_gem_object_release_handle+0x3d/0xa0 [drm]
[  606.589259]  drm_gem_handle_delete+0x5c/0xa0 [drm]
[  606.590250]  drm_gem_close_ioctl+0x65/0x70 [drm]
[  606.591223]  ? drm_gem_handle_create+0x40/0x40 [drm]
[  606.592038]  drm_ioctl_kernel+0xd7/0x130 [drm]
[  606.592789]  ? __might_fault+0x3b/0x40
[  606.592803]  ? drm_gem_handle_create+0x40/0x40 [drm]
[  606.593508]  drm_ioctl+0x293/0x4a0 [drm]
[  606.594377]  ? __rcu_read_unlock+0x57/0x80
[  606.594390]  ? rt_spin_unlock+0x61/0x90
[  606.594403]  nouveau_drm_ioctl+0x8c/0x100 [nouveau]
[  606.596751]  __x64_sys_ioctl+0xb2/0xd0
[  606.596763]  do_syscall_64+0x3a/0x90
[  606.596776]  ? asm_exc_page_fault+0x8/0x30
[  606.596863]  entry_SYSCALL_64_after_hwframe+0x44/0xae
[  606.596875] RIP: 0033:0x7f625340f807
[  606.596884] Code: b3 66 90 48 8b 05 89 76 2d 00 64 c7 00 26 00 00 00 48 =
c7 c0 ff ff ff ff c3 66 2e 0f 1f 84 00 00 00 00 00 b8 10 00 00 00 0f 05 <48=
> 3d 01 f0 ff ff 73 01 c3 48 8b 0d 59 76 2d 00 f7 d8 64 89 01 48
[  606.596895] RSP: 002b:00007ffed6abe4d8 EFLAGS: 00000246 ORIG_RAX: 000000=
0000000010
[  606.596931] RAX: ffffffffffffffda RBX: 0000558d08722560 RCX: 00007f62534=
0f807
[  606.596945] RDX: 00007ffed6abe510 RSI: 0000000040086409 RDI: 00000000000=
0000e
[  606.597030] RBP: 00007ffed6abe510 R08: 0000000000000007 R09: 0000558d07d=
26178
[  606.597038] R10: 0000000000000001 R11: 0000000000000246 R12: 00000000400=
86409
[  606.597045] R13: 000000000000000e R14: 0000558d07ced1a0 R15: 0000558d087=
22560
[  606.597059] Modules linked in: af_packet(E) ip6table_mangle(E) ip6table_=
raw(E) iptable_raw(E) bridge(E) stp(E) llc(E) iscsi_ibft(E) iscsi_boot_sysf=
s(E) nfnetlink(E) ebtable_filter(E) ebtables(E) rfkill(E) ip6table_filter(E=
) ip6_tables(E) iptable_filter(E) ip_tables(E) x_tables(E) bpfilter(E) nls_=
iso8859_1(E) nls_cp437(E) hid_logitech_hidpp(E) joydev(E) usblp(E) hid_logi=
tech_dj(E) intel_rapl_msr(E) intel_rapl_common(E) mei_hdcp(E) at24(E) regma=
p_i2c(E) x86_pkg_temp_thermal(E) iTCO_wdt(E) intel_pmc_bxt(E) intel_powercl=
amp(E) iTCO_vendor_support(E) coretemp(E) kvm_intel(E) kvm(E) irqbypass(E) =
crct10dif_pclmul(E) crc32_pclmul(E) snd_hda_codec_realtek(E) ghash_clmulni_=
intel(E) snd_hda_codec_generic(E) ledtrig_audio(E) aesni_intel(E) crypto_si=
md(E) cryptd(E) snd_hda_codec_hdmi(E) r8169(E) realtek(E) snd_hda_intel(E) =
pcspkr(E) mdio_devres(E) snd_intel_dspcfg(E) mei_me(E) i2c_i801(E) lpc_ich(=
E) libphy(E) i2c_smbus(E) mei(E) mfd_core(E) snd_hda_codec(E) snd_hwdep(E) =
snd_hda_core(E) snd_pcm(E)
[  606.598091]  snd_timer(E) snd(E) soundcore(E) thermal(E) intel_smartconn=
ect(E) fan(E) sch_fq_codel(E) nfsd(E) auth_rpcgss(E) nfs_acl(E) lockd(E) gr=
ace(E) fuse(E) configfs(E) sunrpc(E) uas(E) usb_storage(E) hid_generic(E) u=
sbhid(E) nouveau(E) wmi(E) drm_ttm_helper(E) ttm(E) i2c_algo_bit(E) drm_kms=
_helper(E) syscopyarea(E) sysfillrect(E) sysimgblt(E) fb_sys_fops(E) cec(E)=
 ahci(E) xhci_pci(E) rc_core(E) libahci(E) ehci_pci(E) xhci_hcd(E) ehci_hcd=
(E) libata(E) drm(E) usbcore(E) video(E) button(E) sd_mod(E) t10_pi(E) vfat=
(E) fat(E) virtio_blk(E) virtio_mmio(E) virtio_ring(E) virtio(E) ext4(E) cr=
c32c_intel(E) crc16(E) mbcache(E) jbd2(E) sg(E) dm_multipath(E) dm_mod(E) s=
csi_dh_rdac(E) scsi_dh_emc(E) scsi_dh_alua(E) scsi_mod(E) msr(E) autofs4(E)
[  606.598689] Dumping ftrace buffer:
[  606.598747]    (ftrace buffer empty)



