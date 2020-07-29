Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 67050232467
	for <lists+nouveau@lfdr.de>; Wed, 29 Jul 2020 20:09:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 711BE6E5CE;
	Wed, 29 Jul 2020 18:09:44 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
X-Greylist: delayed 529 seconds by postgrey-1.36 at gabe;
 Wed, 29 Jul 2020 18:09:42 UTC
Received: from rfvt.org.uk (rfvt.org.uk [37.187.119.221])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 965E46E5CE
 for <nouveau@lists.freedesktop.org>; Wed, 29 Jul 2020 18:09:42 +0000 (UTC)
Received: from wylie.me.uk (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by rfvt.org.uk (Postfix) with ESMTPS id B2CE783CEB
 for <nouveau@lists.freedesktop.org>; Wed, 29 Jul 2020 19:00:51 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=wylie.me.uk;
 s=mydkim005; t=1596045651;
 bh=M93TPJ+uPIu2OZBwBUhnJHeVkL7PTjjR1nFDQpNdWJo=;
 h=Date:From:To:Subject;
 b=oTBS6qnQ9BIMVQT7QMXxZV9F12ZuEPqz9IRVBMLC0+hA2BDhg76SAv2MnW6lVTeHx
 WFi8tUM9DgiT8q3/b4u2cJIv+uLsxt+2JNefViBs7XkAtZp6QaN8+ahdTTRtudU2bc
 ZMdb64/tFV6ODK6fWc5y2Z1N/JEm0MikqL6t05noVrDYXzT6dh1SGjlh7xXz1rlzG7
 aqCqUZTWPCnq6BgD3zRhsjc5QaPjGPp2W71lx06ZXEeebk722A5LbZyrxoFaDDyL4I
 vE0rex4XJuQ54X8AaPiw+z6RurjBH1Hf2AWeLbFfn2pn4C6nydBCJJ/+oTrr/u74r6
 Oyr5o7Y9k5vXQ==
MIME-Version: 1.0
Message-ID: <24353.47443.397011.757172@wylie.me.uk>
Date: Wed, 29 Jul 2020 19:00:51 +0100
From: "Alan J. Wylie" <rlogfajwlnwzh@wylie.me.uk>
To: <nouveau@lists.freedesktop.org>
X-Mailer: VM 8.2.0b under 26.3 (x86_64-pc-linux-gnu)
Subject: [Nouveau] BUG: unable to handle page fault for address
 nouveau_fence_new
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

(Apologies for any duplication, yesterday's e-mail doesn't seem to have
made it through moderation)

I've had several recent crashes of the nouveau kernel driver over the past
month or so.

My suspicion is that Firefox is causing it.

The screen goes black and then the computer reboots.

Nothing much in the syslogs, however I've managed to get netconsole output. I've
also run this through decode_stacktrace.sh

It happens very infrequently and I'm afraid I don't know how to reproduce it,
however I'll be more than happy to help by providing more information or
debugging.

Hardware:
01:00.0 VGA compatible controller: NVIDIA Corporation GK107 [GeForce GT 640] (rev a1)

Kernel:
Linux frodo 5.7.10 #21 SMP PREEMPT Wed Jul 22 13:01:11 BST 2020 x86_64 AMD FX(tm)-8350 Eight-Core Processor AuthenticAMD GNU/Linux

Software:
Recent Gentoo
Nightly Firefox.

[I] media-libs/mesa (20.0.8@04/07/20): OpenGL-like graphic library for Linux
[I] x11-apps/mesa-progs (8.4.0@07/04/19): Mesa's OpenGL utility and demo programs (glxgears and glxinfo)
[I] x11-drivers/xf86-video-nouveau (1.0.16@17/06/20): Accelerated Open Source driver for nVidia cards

netconsole:

------8<------8<------8<------8<------8<------8<------8<------8<------8<------8<------8<------8<
BUG: unable to handle page fault for address: 00000001067fdb67
#PF: supervisor read access in kernel mode
#PF: error_code(0x0000) - not-present page
PGD 0 P4D 0 
Oops: 0000 [#1] PREEMPT SMP
CPU: 3 PID: 2236255 Comm: Renderer Not tainted 5.7.10 #21
Hardware name: Gigabyte Technology Co., Ltd. GA-990XA-UD3/GA-990XA-UD3, BIOS F12 05/30/2012
RIP: 0010:kmem_cache_alloc_trace+0x95/0x260
Code: c8 65 48 03 05 6c 94 df 68 48 8b 70 08 48 39 f2 75 e7 4c 8b 20 4d 85 e4 0f 84 9b 00 00 00 41 8b 45 20 49 8b 7d 00 48 8d 4a 08 <49> 8b 1c 04 4c 89 e0 65 48 0f c7 0f 0f 94 c0 84 c0 74 b8 41 8b 45
RSP: 0018:ffffa497c1977c10 EFLAGS: 00010202
RAX: 0000000000000030 RBX: 0000000000000000 RCX: 00000000094cfe23
RDX: 00000000094cfe1b RSI: 00000000094cfe1b RDI: 0000000000029660
RBP: 0000000000000060 R08: ffffa497c1b91000 R09: ffff9a53d535ee78
R10: 0000000000000001 R11: 00000000000003ff R12: 00000001067fdb37
R13: ffff9a53f5c07480 R14: 0000000000000dc0 R15: ffff9a53f5c07480
FS:  00007fb65997f700(0000) GS:ffff9a53f6cc0000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00000001067fdb67 CR3: 000000013d42d000 CR4: 00000000000406e0
Call Trace:
 nouveau_fence_new+0x42/0xc0 [nouveau]
 nouveau_gem_ioctl_pushbuf+0xe30/0x1230 [nouveau]
 ? nouveau_gem_ioctl_new+0xf0/0xf0 [nouveau]
 drm_ioctl_kernel+0xcc/0x110 [drm]
 drm_ioctl+0x202/0x390 [drm]
 ? nouveau_gem_ioctl_new+0xf0/0xf0 [nouveau]
 nouveau_drm_ioctl+0x91/0xd0 [nouveau]
 ksys_ioctl+0xa4/0xd0
 __x64_sys_ioctl+0x16/0x20
 do_syscall_64+0x48/0x140
 entry_SYSCALL_64_after_hwframe+0x44/0xa9
RIP: 0033:0x7fb671a50c57
Code: 00 00 90 48 8b 05 39 32 0c 00 64 c7 00 26 00 00 00 48 c7 c0 ff ff ff ff c3 66 2e 0f 1f 84 00 00 00 00 00 b8 10 00 00 00 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 8b 0d 09 32 0c 00 f7 d8 64 89 01 48
RSP: 002b:00007fb65997d228 EFLAGS: 00000246 ORIG_RAX: 0000000000000010
RAX: ffffffffffffffda RBX: 00007fb65997d290 RCX: 00007fb671a50c57
RDX: 00007fb65997d290 RSI: 00000000c0406481 RDI: 000000000000001a
RBP: 00000000c0406481 R08: 0000000000000000 R09: 00007fb656079008
R10: 0000000000000003 R11: 0000000000000246 R12: 00007fb65606f000
R13: 000000000000001a R14: 00007fb65604e870 R15: 00007fb65606a040
Modules linked in: nls_iso8859_1 nls_cp437 vfat fat usb_storage joydev tcp_diag inet_diag binfmt_misc netconsole configfs cfg80211 8021q veth sha256_generic libsha256 essiv authenc dm_crypt cpuid i2c_dev asus_atk0110 acpi_power_meter it87 hwmon_vid nouveau af_packet bridge video ttm drm_kms_helper stp snd_hda_codec_hdmi snd_hda_codec_realtek snd_hda_codec_generic llc snd_hda_intel syscopyarea sysfillrect snd_intel_dspcfg sysimgblt fb_sys_fops kvm_amd drm snd_hda_codec snd_hda_core kvm snd_pcm drm_panel_orientation_quirks mxm_wmi evdev snd_timer backlight agpgart snd soundcore irqbypass fam15h_power k10temp i2c_piix4 wmi acpi_cpufreq softdog nfs nfsd auth_rpcgss lockd grace sunrpc usbhid ohci_pci ghash_clmulni_intel cryptd ehci_pci ohci_hcd sr_mod xhci_pci ehci_hcd cdrom xhci_hcd usbcore usb_common 8250 8250_base serial_core
CR2: 00000001067fdb67
---[ end trace 2e01012779729a3b ]---
RIP: 0010:kmem_cache_alloc_trace+0x95/0x260
Code: c8 65 48 03 05 6c 94 df 68 48 8b 70 08 48 39 f2 75 e7 4c 8b 20 4d 85 e4 0f 84 9b 00 00 00 41 8b 45 20 49 8b 7d 00 48 8d 4a 08 <49> 8b 1c 04 4c 89 e0 65 48 0f c7 0f 0f 94 c0 84 c0 74 b8 41 8b 45
RSP: 0018:ffffa497c1977c10 EFLAGS: 00010202
RAX: 0000000000000030 RBX: 0000000000000000 RCX: 00000000094cfe23
RDX: 00000000094cfe1b RSI: 00000000094cfe1b RDI: 0000000000029660
RBP: 0000000000000060 R08: ffffa497c1b91000 R09: ffff9a53d535ee78
R10: 0000000000000001 R11: 00000000000003ff R12: 00000001067fdb37
R13: ffff9a53f5c07480 R14: 0000000000000dc0 R15: ffff9a53f5c07480
FS:  00007fb65997f700(0000) GS:ffff9a53f6cc0000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00000001067fdb67 CR3: 000000013d42d000 CR4: 00000000000406e0
Kernel panic - not syncing: Fatal exception
Kernel Offset: 0x16000000 from 0xffffffff81000000 (relocation range: 0xffffffff80000000-0xffffffffbfffffff)
Rebooting in 20 seconds..
------8<------8<------8<------8<------8<------8<------8<------8<------8<------8<------8<------8<

And passed through decode_stacktrace.sh

------8<------8<------8<------8<------8<------8<------8<------8<------8<------8<------8<------8<
BUG: unable to handle page fault for address: 00000001067fdb67
#PF: supervisor read access in kernel mode
#PF: error_code(0x0000) - not-present page
PGD 0 P4D 0
Oops: 0000 [#1] PREEMPT SMP
CPU: 3 PID: 2236255 Comm: Renderer Not tainted 5.7.10 #21
Hardware name: Gigabyte Technology Co., Ltd. GA-990XA-UD3/GA-990XA-UD3, BIOS F12 05/30/2012
RIP: 0010:kmem_cache_alloc_trace (??:?)
Code: c8 65 48 03 05 6c 94 df 68 48 8b 70 08 48 39 f2 75 e7 4c 8b 20 4d 85 e4 0f 84 9b 00 00 00 41 8b 45 20 49 8b 7d 00 48 8d 4a 08 <49> 8b 1c 04 4c 89 e0 65 48 0f c7 0f 0f 94 c0 84 c0 74 b8 41 8b 45
All code
========
   0:	c8 65 48 03          	enterq $0x4865,$0x3
   4:	05 6c 94 df 68       	add    $0x68df946c,%eax
   9:	48 8b 70 08          	mov    0x8(%rax),%rsi
   d:	48 39 f2             	cmp    %rsi,%rdx
  10:	75 e7                	jne    0xfffffffffffffff9
  12:	4c 8b 20             	mov    (%rax),%r12
  15:	4d 85 e4             	test   %r12,%r12
  18:	0f 84 9b 00 00 00    	je     0xb9
  1e:	41 8b 45 20          	mov    0x20(%r13),%eax
  22:	49 8b 7d 00          	mov    0x0(%r13),%rdi
  26:	48 8d 4a 08          	lea    0x8(%rdx),%rcx
  2a:*	49 8b 1c 04          	mov    (%r12,%rax,1),%rbx		<-- trapping instruction
  2e:	4c 89 e0             	mov    %r12,%rax
  31:	65 48 0f c7 0f       	cmpxchg16b %gs:(%rdi)
  36:	0f 94 c0             	sete   %al
  39:	84 c0                	test   %al,%al
  3b:	74 b8                	je     0xfffffffffffffff5
  3d:	41                   	rex.B
  3e:	8b                   	.byte 0x8b
  3f:	45                   	rex.RB

Code starting with the faulting instruction
===========================================
   0:	49 8b 1c 04          	mov    (%r12,%rax,1),%rbx
   4:	4c 89 e0             	mov    %r12,%rax
   7:	65 48 0f c7 0f       	cmpxchg16b %gs:(%rdi)
   c:	0f 94 c0             	sete   %al
   f:	84 c0                	test   %al,%al
  11:	74 b8                	je     0xffffffffffffffcb
  13:	41                   	rex.B
  14:	8b                   	.byte 0x8b
  15:	45                   	rex.RB
RSP: 0018:ffffa497c1977c10 EFLAGS: 00010202
RAX: 0000000000000030 RBX: 0000000000000000 RCX: 00000000094cfe23
RDX: 00000000094cfe1b RSI: 00000000094cfe1b RDI: 0000000000029660
RBP: 0000000000000060 R08: ffffa497c1b91000 R09: ffff9a53d535ee78
R10: 0000000000000001 R11: 00000000000003ff R12: 00000001067fdb37
R13: ffff9a53f5c07480 R14: 0000000000000dc0 R15: ffff9a53f5c07480
FS:  00007fb65997f700(0000) GS:ffff9a53f6cc0000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00000001067fdb67 CR3: 000000013d42d000 CR4: 00000000000406e0
Call Trace:
nouveau_fence_new (/work/src.git/linux-stable/drivers/gpu/drm/nouveau/nouveau_fence.c:424) nouveau
nouveau_gem_ioctl_pushbuf (/work/src.git/linux-stable/drivers/gpu/drm/nouveau/nouveau_gem.c:851) nouveau
? nouveau_gem_ioctl_new (/work/src.git/linux-stable/drivers/gpu/drm/nouveau/nouveau_gem.c:678) nouveau
drm_ioctl_kernel (/work/src.git/linux-stable/drivers/gpu/drm/drm_ioctl.c:793) drm
drm_ioctl (/work/src.git/linux-stable/./include/linux/thread_info.h:119 /work/src.git/linux-stable/./include/linux/thread_info.h:152 /work/src.git/linux-stable/./include/linux/uaccess.h:151 /work/src.git/linux-stable/drivers/gpu/drm/drm_ioctl.c:888) drm
? nouveau_gem_ioctl_new (/work/src.git/linux-stable/drivers/gpu/drm/nouveau/nouveau_gem.c:678) nouveau
nouveau_drm_ioctl (/work/src.git/linux-stable/drivers/gpu/drm/nouveau/nouveau_drm.c:1145) nouveau
ksys_ioctl (??:?)
__x64_sys_ioctl (??:?)
do_syscall_64 (??:?)
entry_SYSCALL_64_after_hwframe (??:?)
RIP: 0033:0x7fb671a50c57
Code: 00 00 90 48 8b 05 39 32 0c 00 64 c7 00 26 00 00 00 48 c7 c0 ff ff ff ff c3 66 2e 0f 1f 84 00 00 00 00 00 b8 10 00 00 00 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 8b 0d 09 32 0c 00 f7 d8 64 89 01 48
All code
========
   0:	00 00                	add    %al,(%rax)
   2:	90                   	nop
   3:	48 8b 05 39 32 0c 00 	mov    0xc3239(%rip),%rax        # 0xc3243
   a:	64 c7 00 26 00 00 00 	movl   $0x26,%fs:(%rax)
  11:	48 c7 c0 ff ff ff ff 	mov    $0xffffffffffffffff,%rax
  18:	c3                   	retq
  19:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
  20:	00 00 00
  23:	b8 10 00 00 00       	mov    $0x10,%eax
  28:	0f 05                	syscall
  2a:*	48 3d 01 f0 ff ff    	cmp    $0xfffffffffffff001,%rax		<-- trapping instruction
  30:	73 01                	jae    0x33
  32:	c3                   	retq
  33:	48 8b 0d 09 32 0c 00 	mov    0xc3209(%rip),%rcx        # 0xc3243
  3a:	f7 d8                	neg    %eax
  3c:	64 89 01             	mov    %eax,%fs:(%rcx)
  3f:	48                   	rex.W

Code starting with the faulting instruction
===========================================
   0:	48 3d 01 f0 ff ff    	cmp    $0xfffffffffffff001,%rax
   6:	73 01                	jae    0x9
   8:	c3                   	retq
   9:	48 8b 0d 09 32 0c 00 	mov    0xc3209(%rip),%rcx        # 0xc3219
  10:	f7 d8                	neg    %eax
  12:	64 89 01             	mov    %eax,%fs:(%rcx)
  15:	48                   	rex.W
RSP: 002b:00007fb65997d228 EFLAGS: 00000246 ORIG_RAX: 0000000000000010
RAX: ffffffffffffffda RBX: 00007fb65997d290 RCX: 00007fb671a50c57
RDX: 00007fb65997d290 RSI: 00000000c0406481 RDI: 000000000000001a
RBP: 00000000c0406481 R08: 0000000000000000 R09: 00007fb656079008
R10: 0000000000000003 R11: 0000000000000246 R12: 00007fb65606f000
R13: 000000000000001a R14: 00007fb65604e870 R15: 00007fb65606a040
Modules linked in: nls_iso8859_1 nls_cp437 vfat fat usb_storage joydev tcp_diag inet_diag binfmt_misc netconsole configfs cfg80211 8021q veth sha256_generic libsha256 essiv authenc dm_crypt cpuid i2c_dev asus_atk0110 acpi_power_meter it87 hwmon_vid nouveau af_packet bridge video ttm drm_kms_helper stp snd_hda_codec_hdmi snd_hda_codec_realtek snd_hda_codec_generic llc snd_hda_intel syscopyarea sysfillrect snd_intel_dspcfg sysimgblt fb_sys_fops kvm_amd drm snd_hda_codec snd_hda_core kvm snd_pcm drm_panel_orientation_quirks mxm_wmi evdev snd_timer backlight agpgart snd soundcore irqbypass fam15h_power k10temp i2c_piix4 wmi acpi_cpufreq softdog nfs nfsd auth_rpcgss lockd grace sunrpc usbhid ohci_pci ghash_clmulni_intel cryptd ehci_pci ohci_hcd sr_mod xhci_pci ehci_hcd cdrom xhci_hcd usbcore usb_common 8250 8250_base serial_core
CR2: 00000001067fdb67
---[ end trace 2e01012779729a3b ]---
RIP: 0010:kmem_cache_alloc_trace (??:?)
Code: c8 65 48 03 05 6c 94 df 68 48 8b 70 08 48 39 f2 75 e7 4c 8b 20 4d 85 e4 0f 84 9b 00 00 00 41 8b 45 20 49 8b 7d 00 48 8d 4a 08 <49> 8b 1c 04 4c 89 e0 65 48 0f c7 0f 0f 94 c0 84 c0 74 b8 41 8b 45
All code
========
   0:	c8 65 48 03          	enterq $0x4865,$0x3
   4:	05 6c 94 df 68       	add    $0x68df946c,%eax
   9:	48 8b 70 08          	mov    0x8(%rax),%rsi
   d:	48 39 f2             	cmp    %rsi,%rdx
  10:	75 e7                	jne    0xfffffffffffffff9
  12:	4c 8b 20             	mov    (%rax),%r12
  15:	4d 85 e4             	test   %r12,%r12
  18:	0f 84 9b 00 00 00    	je     0xb9
  1e:	41 8b 45 20          	mov    0x20(%r13),%eax
  22:	49 8b 7d 00          	mov    0x0(%r13),%rdi
  26:	48 8d 4a 08          	lea    0x8(%rdx),%rcx
  2a:*	49 8b 1c 04          	mov    (%r12,%rax,1),%rbx		<-- trapping instruction
  2e:	4c 89 e0             	mov    %r12,%rax
  31:	65 48 0f c7 0f       	cmpxchg16b %gs:(%rdi)
  36:	0f 94 c0             	sete   %al
  39:	84 c0                	test   %al,%al
  3b:	74 b8                	je     0xfffffffffffffff5
  3d:	41                   	rex.B
  3e:	8b                   	.byte 0x8b
  3f:	45                   	rex.RB

Code starting with the faulting instruction
===========================================
   0:	49 8b 1c 04          	mov    (%r12,%rax,1),%rbx
   4:	4c 89 e0             	mov    %r12,%rax
   7:	65 48 0f c7 0f       	cmpxchg16b %gs:(%rdi)
   c:	0f 94 c0             	sete   %al
   f:	84 c0                	test   %al,%al
  11:	74 b8                	je     0xffffffffffffffcb
  13:	41                   	rex.B
  14:	8b                   	.byte 0x8b
  15:	45                   	rex.RB
RSP: 0018:ffffa497c1977c10 EFLAGS: 00010202
RAX: 0000000000000030 RBX: 0000000000000000 RCX: 00000000094cfe23
RDX: 00000000094cfe1b RSI: 00000000094cfe1b RDI: 0000000000029660
RBP: 0000000000000060 R08: ffffa497c1b91000 R09: ffff9a53d535ee78
R10: 0000000000000001 R11: 00000000000003ff R12: 00000001067fdb37
R13: ffff9a53f5c07480 R14: 0000000000000dc0 R15: ffff9a53f5c07480
FS:  00007fb65997f700(0000) GS:ffff9a53f6cc0000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00000001067fdb67 CR3: 000000013d42d000 CR4: 00000000000406e0
Kernel panic - not syncing: Fatal exception
Kernel Offset: 0x16000000 from 0xffffffff81000000 (relocation range: 0xffffffff80000000-0xffffffffbfffffff)
------8<------8<------8<------8<------8<------8<------8<------8<------8<------8<------8<------8<

-- 
Alan J. Wylie                                          https://www.wylie.me.uk/

Dance like no-one's watching. / Encrypt like everyone is.
Security is inversely proportional to convenience
_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
