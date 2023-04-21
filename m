Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DEA256EB0B2
	for <lists+nouveau@lfdr.de>; Fri, 21 Apr 2023 19:37:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A72A10EEA9;
	Fri, 21 Apr 2023 17:37:13 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-oo1-xc32.google.com (mail-oo1-xc32.google.com
 [IPv6:2607:f8b0:4864:20::c32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 58F9910EEAB
 for <nouveau@lists.freedesktop.org>; Fri, 21 Apr 2023 17:37:12 +0000 (UTC)
Received: by mail-oo1-xc32.google.com with SMTP id
 006d021491bc7-541b60e0a7fso1178440eaf.1
 for <nouveau@lists.freedesktop.org>; Fri, 21 Apr 2023 10:37:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1682098630; x=1684690630;
 h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=k/v3UDCryNLwdFvFp3PIQO6O4361b7m8c24XprKao6s=;
 b=IrtTYm3AnzGbsNV5LWJCxNqBA6OCoW9TAAEMZIxoocO4DClJevy4YkOQ2EmQ/rbN73
 bNe0X7iiyh1siat7rTICzM35I0OspjevlM//D7YRa4SsCDvyPqYB23uuIXTul1g8A+54
 sWyzFSekxfKBfry8KhxiEgFib665ILBspJj6JRK+XT0ecEzUFixrbgNyzihH0V964kAU
 2+9nfrdxMUodHAy4ltRaDlcA2QoZBcliUWx+LVl4GcSZyD4ViWuuLsJl7m/Y2Iu2iq+p
 ltu25RWbyOfYubXYVTu+r9v0AbUmQgt2YTdEroQZmXpKZfgfd4qnfQ3S0tJHoc4TQ/87
 N0/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682098630; x=1684690630;
 h=to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=k/v3UDCryNLwdFvFp3PIQO6O4361b7m8c24XprKao6s=;
 b=J+3EcN6RyVixiX/dzYq9xZ7HTvRhlXk2uUhZcBJbiyvzCgzOWnDPhYcm0Vf0CUkDf2
 zNDEcCL/Ho1mZ+c9cvvfFH1j3yxJ0Rhw2PhRIScFjp7JVbDxNSQE8xjExe0zZDt3GOYd
 h06O7l+6y0cI4aaylB2MSP/nSyeLMMswEIKps5EdJjq81W5yOm9Vh0t+vm0iJi/riv+/
 e8y80o1pXrx0gPPaz40YZYomHHDdn7e6V6a/KhhEOg1AT77fmypNkEmWEJ8fdiEyR3q5
 8zgo48b+t5JlmxsntaVNRQXBnKU9Go/FvkrvRPJyAxCtut3d7pYBnKu+kLT1Rk5ZZlXf
 aa8g==
X-Gm-Message-State: AAQBX9cHyHKC1kAYG0qXHlYirhVGO24m2f9/kU8G2CReFXYEW8JKjpGU
 Njca8aGuwr56TIoEQ9o6o7UXtPqa1yz+Ctt4GXgUMjhPzxU=
X-Google-Smtp-Source: AKy350aPdnARt2p6RxofNImC1mPvEyJtnXK2fdYrzHGru9C3/azd68YmDp9ve6mh/OSHnkLbhj6luIoYyObOG9Mmpes=
X-Received: by 2002:a4a:c408:0:b0:542:4985:a516 with SMTP id
 y8-20020a4ac408000000b005424985a516mr1814985oop.4.1682098630238; Fri, 21 Apr
 2023 10:37:10 -0700 (PDT)
MIME-Version: 1.0
From: Monty Montgomery <xiphmont@gmail.com>
Date: Fri, 21 Apr 2023 13:36:58 -0400
Message-ID: <CACrD=+-DUomkWxe0X5M5vMFS_JijjPGNqVXuq+qimie99vmwzw@mail.gmail.com>
To: nouveau@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="000000000000558d2105f9dc1bd4"
Subject: [Nouveau] Panic report and patch against master (Quadro FX)
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

--000000000000558d2105f9dc1bd4
Content-Type: text/plain; charset="UTF-8"

Hiya folks,

The new nouveau event/notify code in 6.2.x panics early in device
setup here on my Quadro FX hardware, resulting in device setup failure
and a black screen.

The direct cause appears to be i2c aux IDs no longer being truncated
to 8 bits before being used as an index to event->ref[] by
nvkm_event_put, nvkm_event_get, and nvkm_event_send as of
773eb04d14a11552b2c3953097ed09cde2ab4831.

The now-eliminated nvkm_i2c_intr_ctor built an nvkm_notify struct that
stored 'index' as u8, truncating the integer ID to a usable index.
The new code no longer constructs a notification ahead of time, simply
passing the integer id of the i2c bus/aux/pad/etc directly to
nvkm_event_send as int.  The ID value routinely stores
offests/flags/markers(?) in the upper bytes, and when used directly as
an array index, it goes way off the end of event->ref[] and triggers
a panic.  There's no code to check/guard out-of-range access in ref
lookup, so I also added guard/trace code to 6.1 to verify this is a
new bug, and did not record any event->ref[] index bounds errors in
6.1.15.

I don't understand the actual device setup procedure for an nVidia
card, so this surface analysis may be woefully incomplete :-)

At the point of panic, we see the i2c code calling event code with an
index of 269 (0x010d).

Apr 17 01:07:53 boatanchor kernel: nouveau: DRM:00000006:8000000e:
ioctl: mthd size 8
Apr 17 01:07:53 boatanchor kernel: nouveau: DRM:00000006:8000000e:
ioctl: mthd vers 0 mthd 00
Apr 17 01:07:53 boatanchor kernel: nouveau 0000:01:00.0: i2c: event:
ntfy allow 00000003 on 269
Apr 17 01:07:53 boatanchor kernel: nouveau 0000:01:00.0: i2c: event:
ntfy state changed
Apr 17 01:07:53 boatanchor kernel: nouveau 0000:01:00.0: i2c: event:
incr 00000003 on 269
Apr 17 01:07:53 boatanchor kernel: nouveau 0000:01:00.0: i2c: event:
allowing 0 on 269
Apr 17 01:07:53 boatanchor kernel: BUG: kernel NULL pointer
dereference, address: 0000000000000000
Apr 17 01:07:53 boatanchor kernel: #PF: supervisor instruction fetch
in kernel mode
Apr 17 01:07:53 boatanchor kernel: #PF: error_code(0x0010) - not-present page
Apr 17 01:07:53 boatanchor kernel: PGD 0 P4D 0
Apr 17 01:07:53 boatanchor kernel: Oops: 0010 [#1] PREEMPT SMP PTI
Apr 17 01:07:53 boatanchor kernel: CPU: 1 PID: 427 Comm: (udev-worker)
Not tainted 6.2.10-200.fc37.x86_64+debug #1
Apr 17 01:07:53 boatanchor kernel: Hardware name: LENOVO
25003BU/25003BU, BIOS 6KET60WW (1.30 ) 10/24/2012
Apr 17 01:07:53 boatanchor kernel: RIP: 0010:0x0
Apr 17 01:07:53 boatanchor kernel: Code: Unable to access opcode bytes
at 0xffffffffffffffd6.
Apr 17 01:07:53 boatanchor kernel: RSP: 0018:ffff967ec1b9f8c0 EFLAGS: 00010086
Apr 17 01:07:53 boatanchor kernel: RAX: 0000000000000000 RBX:
0000000000000002 RCX: 0000000000000000
Apr 17 01:07:53 boatanchor kernel: RDX: 0000000000000000 RSI:
0000000000000001 RDI: ffff8b69120fc400
Apr 17 01:07:53 boatanchor kernel: RBP: ffff8b69120fc568 R08:
ffff8b69120fc400 R09: ffff967ec1b9f690
Apr 17 01:07:53 boatanchor kernel: R10: 0000000000000003 R11:
ffffffffb1564968 R12: ffff8b631362ca88
Apr 17 01:07:53 boatanchor kernel: R13: 000000000000010d R14:
0000000000000001 R15: 0000000000000001
Apr 17 01:07:53 boatanchor kernel: FS:  00007fbc0af0cb40(0000)
GS:ffff8b6a1e200000(0000) knlGS:0000000000000000
Apr 17 01:07:53 boatanchor kernel: CS:  0010 DS: 0000 ES: 0000 CR0:
0000000080050033
Apr 17 01:07:53 boatanchor kernel: CR2: ffffffffffffffd6 CR3:
00000001133ea000 CR4: 00000000000006e0
Apr 17 01:07:53 boatanchor kernel: Call Trace:
Apr 17 01:07:53 boatanchor kernel:  <TASK>
Apr 17 01:07:53 boatanchor kernel:  nvkm_event_ntfy_state+0x184/0x250 [nouveau]
Apr 17 01:07:53 boatanchor kernel:  nvkm_event_ntfy_allow+0x5f/0xc0 [nouveau]
Apr 17 01:07:53 boatanchor kernel:  nvkm_uevent_mthd+0x49/0x70 [nouveau]
Apr 17 01:07:53 boatanchor kernel:  nvkm_ioctl+0x10a/0x240 [nouveau]
Apr 17 01:07:53 boatanchor kernel:  nvif_object_mthd+0xcb/0x200 [nouveau]
Apr 17 01:07:53 boatanchor kernel:  nvif_event_allow+0x26/0xa0 [nouveau]
Apr 17 01:07:53 boatanchor kernel:  nouveau_display_init+0x71/0x110 [nouveau]
Apr 17 01:07:53 boatanchor kernel:
nouveau_drm_device_init+0x1d8/0x9b0 [nouveau]
Apr 17 01:07:53 boatanchor kernel:  ? pci_bus_read_config_word+0x49/0x80
Apr 17 01:07:53 boatanchor kernel:  nouveau_drm_probe+0x128/0x280 [nouveau]
Apr 17 01:07:53 boatanchor kernel:  local_pci_probe+0x41/0x90
Apr 17 01:07:53 boatanchor kernel:  pci_device_probe+0xc3/0x230
Apr 17 01:07:53 boatanchor kernel:  really_probe+0x1b9/0x410
Apr 17 01:07:53 boatanchor kernel:  __driver_probe_device+0x78/0x170
Apr 17 01:07:53 boatanchor kernel:  driver_probe_device+0x1f/0x90
Apr 17 01:07:53 boatanchor kernel:  __driver_attach+0xd2/0x1c0
Apr 17 01:07:53 boatanchor kernel:  ? __pfx___driver_attach+0x10/0x10
Apr 17 01:07:53 boatanchor kernel:  bus_for_each_dev+0x8a/0xd0
Apr 17 01:07:53 boatanchor kernel:  bus_add_driver+0x141/0x230
Apr 17 01:07:53 boatanchor kernel:  driver_register+0x77/0x120
Apr 17 01:07:53 boatanchor kernel:  ? __pfx_init_module+0x10/0x10 [nouveau]
Apr 17 01:07:53 boatanchor kernel:  do_one_initcall+0x70/0x290
Apr 17 01:07:53 boatanchor kernel:  do_init_module+0x4a/0x220
Apr 17 01:07:53 boatanchor kernel:  __do_sys_init_module+0x192/0x1c0
Apr 17 01:07:53 boatanchor kernel:  do_syscall_64+0x5b/0x80
Apr 17 01:07:53 boatanchor kernel:  ? lock_release+0x15d/0x400
Apr 17 01:07:53 boatanchor kernel:  ? preempt_count_add+0x47/0xa0
Apr 17 01:07:53 boatanchor kernel:  ? __up_read+0x98/0x220
Apr 17 01:07:53 boatanchor kernel:  ? do_user_addr_fault+0x202/0x730
Apr 17 01:07:53 boatanchor kernel:  ? exc_page_fault+0xfc/0x200
Apr 17 01:07:53 boatanchor kernel:  ? lockdep_hardirqs_off+0x9c/0xe0
Apr 17 01:07:53 boatanchor kernel:  ? asm_exc_page_fault+0x22/0x30
Apr 17 01:07:53 boatanchor kernel:  ? lockdep_hardirqs_on+0x7d/0x100
Apr 17 01:07:53 boatanchor kernel:  entry_SYSCALL_64_after_hwframe+0x72/0xdc
Apr 17 01:07:53 boatanchor kernel: RIP: 0033:0x7fbc0b97800e
Apr 17 01:07:53 boatanchor kernel: Code: 48 8b 0d 25 5e 0c 00 f7 d8 64
89 01 48 83 c8 ff c3 66 2e 0f 1f 84 00 00 00 00 00 90 f3
 0f 1e fa 49 89 ca b8 af 00 00 00 0f 05 <48> 3d 01 f0 ff ff 73 01 c3
48 8b 0d f2 5d 0c 00 f7 d8 64 89 01 48
Apr 17 01:07:53 boatanchor kernel: RSP: 002b:00007fff5dc02b58 EFLAGS:
00000246 ORIG_RAX: 00000000000000af
Apr 17 01:07:53 boatanchor kernel: RAX: ffffffffffffffda RBX:
00005613c37bee10 RCX: 00007fbc0b97800e
Apr 17 01:07:53 boatanchor kernel: RDX: 00005613c36b7bb0 RSI:
00000000007258f6 RDI: 00005613c3fc1b70
Apr 17 01:07:53 boatanchor kernel: RBP: 00005613c36b7bb0 R08:
00005613c36af860 R09: 00007fff5dc002f6
Apr 17 01:07:53 boatanchor kernel: R10: 0000000000000005 R11:
0000000000000246 R12: 0000000000020000
Apr 17 01:07:53 boatanchor kernel: R13: 00005613c36ab4e0 R14:
0000000000000000 R15: 00005613c3689610
Apr 17 01:07:53 boatanchor kernel:  </TASK>
Apr 17 01:07:53 boatanchor kernel: Modules linked in: nouveau(+) raid0
wacom uas usb_storage crc32c_intel serio_raw e1000e sha5
12_ssse3 sdhci_pci cqhci sdhci mmc_core drm_ttm_helper firewire_ohci
ttm mxm_wmi firewire_core drm_display_helper crc_itu_t cec
 video wmi scsi_dh_rdac scsi_dh_emc scsi_dh_alua ip6_tables ip_tables
dm_multipath fuse
Apr 17 01:07:53 boatanchor kernel: CR2: 0000000000000000

nvkm/core/event.c:nvkm_event_get() is inlined, that's where the panic
is happening.
Noting that 269 == 0x10d, which matches an i2c pad ID allocated
earlier during CCB
enumeration, and that earlier we logged only 16 CCBs:

Apr 17 01:07:51 boatanchor kernel: nouveau 0000:01:00.0: i2c: ccb 00:
type 05 drive 00 sense ff share ff auxch ff
Apr 17 01:07:51 boatanchor kernel: nouveau 0000:01:00.0: i2c: pad 0100: ctor
Apr 17 01:07:51 boatanchor kernel: nouveau 0000:01:00.0: i2c: bus 0000: ctor
Apr 17 01:07:51 boatanchor kernel: nouveau 0000:01:00.0: i2c: ccb 01:
type 05 drive 01 sense ff share ff auxch ff
Apr 17 01:07:51 boatanchor kernel: nouveau 0000:01:00.0: i2c: pad 0101: ctor
Apr 17 01:07:51 boatanchor kernel: nouveau 0000:01:00.0: i2c: bus 0001: ctor
Apr 17 01:07:51 boatanchor kernel: nouveau 0000:01:00.0: i2c: ccb 02:
type 05 drive 03 sense ff share ff auxch ff
Apr 17 01:07:51 boatanchor kernel: nouveau 0000:01:00.0: i2c: pad 0102: ctor
Apr 17 01:07:51 boatanchor kernel: nouveau 0000:01:00.0: i2c: bus 0002: ctor
Apr 17 01:07:51 boatanchor kernel: nouveau 0000:01:00.0: i2c: ccb 03:
type ff drive ff sense ff share ff auxch ff
Apr 17 01:07:51 boatanchor kernel: nouveau 0000:01:00.0: i2c: pad 0103: ctor
Apr 17 01:07:51 boatanchor kernel: nouveau 0000:01:00.0: i2c: ccb 04:
type ff drive ff sense ff share ff auxch ff
Apr 17 01:07:51 boatanchor kernel: nouveau 0000:01:00.0: i2c: pad 0104: ctor
Apr 17 01:07:51 boatanchor kernel: nouveau 0000:01:00.0: i2c: ccb 05:
type ff drive ff sense ff share ff auxch ff
Apr 17 01:07:51 boatanchor kernel: nouveau 0000:01:00.0: i2c: pad 0105: ctor
Apr 17 01:07:51 boatanchor kernel: nouveau 0000:01:00.0: i2c: ccb 06:
type ff drive ff sense ff share ff auxch ff
Apr 17 01:07:51 boatanchor kernel: nouveau 0000:01:00.0: i2c: pad 0106: ctor
Apr 17 01:07:51 boatanchor kernel: nouveau 0000:01:00.0: i2c: ccb 07:
type ff drive ff sense ff share ff auxch ff
Apr 17 01:07:51 boatanchor kernel: nouveau 0000:01:00.0: i2c: pad 0107: ctor
Apr 17 01:07:51 boatanchor kernel: nouveau 0000:01:00.0: i2c: ccb 08:
type ff drive ff sense ff share ff auxch ff
Apr 17 01:07:51 boatanchor kernel: nouveau 0000:01:00.0: i2c: pad 0108: ctor
Apr 17 01:07:51 boatanchor kernel: nouveau 0000:01:00.0: i2c: ccb 09:
type ff drive ff sense ff share ff auxch ff
Apr 17 01:07:51 boatanchor kernel: nouveau 0000:01:00.0: i2c: pad 0109: ctor
Apr 17 01:07:51 boatanchor kernel: nouveau 0000:01:00.0: i2c: ccb 0a:
type ff drive ff sense ff share ff auxch ff
Apr 17 01:07:51 boatanchor kernel: nouveau 0000:01:00.0: i2c: pad 010a: ctor
Apr 17 01:07:51 boatanchor kernel: nouveau 0000:01:00.0: i2c: ccb 0b:
type ff drive ff sense ff share ff auxch ff
Apr 17 01:07:51 boatanchor kernel: nouveau 0000:01:00.0: i2c: pad 010b: ctor
Apr 17 01:07:51 boatanchor kernel: nouveau 0000:01:00.0: i2c: ccb 0c:
type ff drive ff sense ff share ff auxch ff
Apr 17 01:07:51 boatanchor kernel: nouveau 0000:01:00.0: i2c: pad 010c: ctor
Apr 17 01:07:51 boatanchor kernel: nouveau 0000:01:00.0: i2c: ccb 0d:
type ff drive ff sense ff share ff auxch ff
Apr 17 01:07:51 boatanchor kernel: nouveau 0000:01:00.0: i2c: pad 010d: ctor
Apr 17 01:07:51 boatanchor kernel: nouveau 0000:01:00.0: i2c: ccb 0e:
type ff drive ff sense ff share ff auxch ff
Apr 17 01:07:51 boatanchor kernel: nouveau 0000:01:00.0: i2c: pad 010e: ctor
Apr 17 01:07:51 boatanchor kernel: nouveau 0000:01:00.0: i2c: ccb 0f:
type ff drive ff sense ff share ff auxch ff
Apr 17 01:07:51 boatanchor kernel: nouveau 0000:01:00.0: i2c: pad 010f: ctor
Apr 17 01:07:51 boatanchor kernel: nouveau 0000:01:00.0: i2c: dcb 08
drv 00 unknown
Apr 17 01:07:51 boatanchor kernel: nouveau 0000:01:00.0: i2c: pad 020d: ctor
Apr 17 01:07:51 boatanchor kernel: nouveau 0000:01:00.0: i2c: aux 010d: ctor
Apr 17 01:07:51 boatanchor kernel: nouveau 0000:01:00.0: i2c: bus 010d: ctor
Apr 17 01:07:51 boatanchor kernel: nouveau 0000:01:00.0: i2c: aux 010d: ctor
Apr 17 01:07:51 boatanchor kernel: nouveau 0000:01:00.0: i2c: bus 010d: ctor

I added additional debugging logs to determine that the index_nr for
the relevant event is only 16, so an index of 269 to event->ref[] is
obviously wrong.

It appears that the simplest maybe-correct fix is to reinstate the u8
truncation in this argument path, eg:

diff -urp a/drivers/gpu/drm/nouveau/nvkm/engine/disp/uconn.c
b/drivers/gpu/drm/nouveau/nvkm/engine/disp/uconn.c
--- a/drivers/gpu/drm/nouveau/nvkm/engine/disp/uconn.c  2023-04-06
06:12:48.000000000 -0400
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/disp/uconn.c  2023-04-21
09:07:59.864884896 -0400
@@ -86,7 +86,7 @@ nvkm_uconn_uevent(struct nvkm_object *ob
                        if (args->v0.types &
NVIF_CONN_EVENT_V0_UNPLUG) bits |= NVKM_I2C_UNPLUG;
                        if (args->v0.types & NVIF_CONN_EVENT_V0_IRQ
) bits |= NVKM_I2C_IRQ;

-                       return nvkm_uevent_add(uevent,
&device->i2c->event, outp->dp.aux->id, bits,
+                       return nvkm_uevent_add(uevent,
&device->i2c->event, (outp->dp.aux->id)&0xff, bits,
                                               nvkm_uconn_uevent_aux);
                }
        }

This assumes the truncation was itself correct/intentional, and not
due to some other
mistake which should also be corrected.  However, a slightly larger patch I've
attached (which contains the above fix + a little extra guard/logging)
has me back up
and running under 6.2.10.

Cheers,
Monty

--000000000000558d2105f9dc1bd4
Content-Type: text/x-patch; charset="US-ASCII"; name="linux-6.2.10-nouveau_event.patch"
Content-Disposition: attachment; filename="linux-6.2.10-nouveau_event.patch"
Content-Transfer-Encoding: base64
Content-ID: <f_lgqtyr6t0>
X-Attachment-Id: f_lgqtyr6t0

ZGlmZiAtdXJwIGEvZHJpdmVycy9ncHUvZHJtL25vdXZlYXUvbnZrbS9jb3JlL2V2ZW50LmMgYi9k
cml2ZXJzL2dwdS9kcm0vbm91dmVhdS9udmttL2NvcmUvZXZlbnQuYwotLS0gYS9kcml2ZXJzL2dw
dS9kcm0vbm91dmVhdS9udmttL2NvcmUvZXZlbnQuYwkyMDIzLTA0LTA2IDA2OjEyOjQ4LjAwMDAw
MDAwMCAtMDQwMAorKysgYi9kcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9udmttL2NvcmUvZXZlbnQu
YwkyMDIzLTA0LTE5IDEzOjExOjUxLjUxMDU0MDg5NCAtMDQwMApAQCAtMjgsMTMgKzI4LDMwIEBA
IG52a21fZXZlbnRfcHV0KHN0cnVjdCBudmttX2V2ZW50ICpldmVudCwKIAlhc3NlcnRfc3Bpbl9s
b2NrZWQoJmV2ZW50LT5yZWZzX2xvY2spOwogCiAJbnZrbV90cmFjZShldmVudC0+c3ViZGV2LCAi
ZXZlbnQ6IGRlY3IgJTA4eCBvbiAlZFxuIiwgdHlwZXMsIGluZGV4KTsKLQorCQorCWlmIChpbmRl
eCA+PSBldmVudC0+aW5kZXhfbnIpIHsKKyAgICAgCSAgICAgICAgbnZrbV93YXJuKGV2ZW50LT5z
dWJkZXYsICJldmVudDogaW5kZXggb3V0IG9mIHJhbmdlICglZCA+PSAlZCkhXG4iLCBpbmRleCwg
ZXZlbnQtPmluZGV4X25yKTsKKwkJcmV0dXJuOworCX0KKwkKIAl3aGlsZSAodHlwZXMpIHsKIAkJ
aW50IHR5cGUgPSBfX2Zmcyh0eXBlcyk7IHR5cGVzICY9IH4oMSA8PCB0eXBlKTsKKwkJaWYgKHR5
cGUgPj0gZXZlbnQtPnR5cGVzX25yKSB7CisJCSAgICAgICAgbnZrbV93YXJuKGV2ZW50LT5zdWJk
ZXYsICJldmVudDogdHlwZSBvdXQgb2YgcmFuZ2UgKCVkID49ICVkKSFcbiIsIHR5cGUsIGV2ZW50
LT50eXBlc19ucik7CisJCQljb250aW51ZTsKKwkJfQorCQkKIAkJaWYgKC0tZXZlbnQtPnJlZnNb
aW5kZXggKiBldmVudC0+dHlwZXNfbnIgKyB0eXBlXSA9PSAwKSB7Ci0JCQludmttX3RyYWNlKGV2
ZW50LT5zdWJkZXYsICJldmVudDogYmxvY2tpbmcgJWQgb24gJWRcbiIsIHR5cGUsIGluZGV4KTsK
LQkJCWlmIChldmVudC0+ZnVuYy0+ZmluaSkKLQkJCQlldmVudC0+ZnVuYy0+ZmluaShldmVudCwg
MSA8PCB0eXBlLCBpbmRleCk7CisJCQludmttX3RyYWNlKGV2ZW50LT5zdWJkZXYsICJldmVudDog
YmxvY2tpbmcgJTA4eCBvbiAlZFxuIiwgdHlwZSwgaW5kZXgpOworCQkJaWYgKGV2ZW50LT5mdW5j
KSB7CisJCQkgICAgICAgIGlmIChldmVudC0+ZnVuYy0+ZmluaSkgeworCQkJCQlldmVudC0+ZnVu
Yy0+ZmluaShldmVudCwgMSA8PCB0eXBlLCBpbmRleCk7CisJCQkJfSBlbHNlIHsKKwkJCQkgICAg
ICAgIG52a21fZGVidWcoZXZlbnQtPnN1YmRldiwgImV2ZW50OiBubyAuZmluaSwgbm90aGluZyB0
byBkb1xuIik7CisJCQkJfQorCQkJfSBlbHNlIHsKKwkJCSAgICAgICAgbnZrbV93YXJuKGV2ZW50
LT5zdWJkZXYsICJldmVudDogbWlzc2luZyAuZnVuYyBlbnRyeSFcbiIpOworCQkJfQogCQl9CiAJ
fQogfQpAQCAtNDYsMTIgKzYzLDI5IEBAIG52a21fZXZlbnRfZ2V0KHN0cnVjdCBudmttX2V2ZW50
ICpldmVudCwKIAogCW52a21fdHJhY2UoZXZlbnQtPnN1YmRldiwgImV2ZW50OiBpbmNyICUwOHgg
b24gJWRcbiIsIHR5cGVzLCBpbmRleCk7CiAKKwlpZiAoaW5kZXggPj0gZXZlbnQtPmluZGV4X25y
KSB7CisgICAgIAkgICAgICAgIG52a21fd2FybihldmVudC0+c3ViZGV2LCAiZXZlbnQ6IGluZGV4
IG91dCBvZiByYW5nZSAoJWQgPj0gJWQpIVxuIiwgaW5kZXgsIGV2ZW50LT5pbmRleF9ucik7CisJ
CXJldHVybjsKKwl9CisKIAl3aGlsZSAodHlwZXMpIHsKIAkJaW50IHR5cGUgPSBfX2Zmcyh0eXBl
cyk7IHR5cGVzICY9IH4oMSA8PCB0eXBlKTsKKwkJaWYgKHR5cGUgPj0gZXZlbnQtPnR5cGVzX25y
KSB7CisJCSAgICAgICAgbnZrbV93YXJuKGV2ZW50LT5zdWJkZXYsICJldmVudDogdHlwZSBvdXQg
b2YgcmFuZ2UgKCVkID49ICVkKSFcbiIsIHR5cGUsIGV2ZW50LT50eXBlc19ucik7CisJCQljb250
aW51ZTsKKwkJfQogCQlpZiAoKytldmVudC0+cmVmc1tpbmRleCAqIGV2ZW50LT50eXBlc19uciAr
IHR5cGVdID09IDEpIHsKLQkJCW52a21fdHJhY2UoZXZlbnQtPnN1YmRldiwgImV2ZW50OiBhbGxv
d2luZyAlZCBvbiAlZFxuIiwgdHlwZSwgaW5kZXgpOwotCQkJaWYgKGV2ZW50LT5mdW5jLT5pbml0
KQotCQkJCWV2ZW50LT5mdW5jLT5pbml0KGV2ZW50LCAxIDw8IHR5cGUsIGluZGV4KTsKKwkJCW52
a21fdHJhY2UoZXZlbnQtPnN1YmRldiwgImV2ZW50OiBhbGxvd2luZyAlMDh4IG9uICVkXG4iLCB0
eXBlLCBpbmRleCk7CisJCQlpZiAoZXZlbnQtPmZ1bmMpIHsKKwkJCSAgICAgICAgaWYgKGV2ZW50
LT5mdW5jLT5pbml0KSB7CisJCQkJICAgICAgICBldmVudC0+ZnVuYy0+aW5pdChldmVudCwgMSA8
PCB0eXBlLCBpbmRleCk7CisJCQkJfSBlbHNlIHsKKwkJCQkgICAgICAgIG52a21fZGVidWcoZXZl
bnQtPnN1YmRldiwgImV2ZW50OiBubyAuaW5pdCwgbm90aGluZyB0byBkb1xuIik7CisJCQkJfQor
CQkJfSBlbHNlIHsKKwkJCSAgICAgICAgbnZrbV93YXJuKGV2ZW50LT5zdWJkZXYsICJldmVudDog
bWlzc2luZyAuZnVuYyBlbnRyeSFcbiIpOworCQkJfQorCiAJCX0KIAl9CiB9CkBAIC0xNDYsNyAr
MTgwLDcgQEAgdm9pZAogbnZrbV9ldmVudF9udGZ5X2FkZChzdHJ1Y3QgbnZrbV9ldmVudCAqZXZl
bnQsIGludCBpZCwgdTMyIGJpdHMsIGJvb2wgd2FpdCwgbnZrbV9ldmVudF9mdW5jIGZ1bmMsCiAJ
CSAgICBzdHJ1Y3QgbnZrbV9ldmVudF9udGZ5ICpudGZ5KQogewotCW52a21fdHJhY2UoZXZlbnQt
PnN1YmRldiwgImV2ZW50OiBudGZ5IGFkZCAlMDh4IG9uICVkIHdhaXQ6JWRcbiIsIGlkLCBiaXRz
LCB3YWl0KTsKKyAgICAgICBudmttX3RyYWNlKGV2ZW50LT5zdWJkZXYsICJldmVudDogbnRmeSBh
ZGQgJTA4eCBvbiAlZCB3YWl0OiVkXG4iLCBiaXRzLCBpZCwgd2FpdCk7CiAKIAludGZ5LT5ldmVu
dCA9IGV2ZW50OwogCW50ZnktPmlkID0gaWQ7CkBAIC0yMDEsMTAgKzIzNSwxNCBAQCBpbnQKIF9f
bnZrbV9ldmVudF9pbml0KGNvbnN0IHN0cnVjdCBudmttX2V2ZW50X2Z1bmMgKmZ1bmMsIHN0cnVj
dCBudmttX3N1YmRldiAqc3ViZGV2LAogCQkgIGludCB0eXBlc19uciwgaW50IGluZGV4X25yLCBz
dHJ1Y3QgbnZrbV9ldmVudCAqZXZlbnQpCiB7CisKIAlldmVudC0+cmVmcyA9IGt6YWxsb2MoYXJy
YXkzX3NpemUoaW5kZXhfbnIsIHR5cGVzX25yLCBzaXplb2YoKmV2ZW50LT5yZWZzKSksIEdGUF9L
RVJORUwpOwogCWlmICghZXZlbnQtPnJlZnMpCiAJCXJldHVybiAtRU5PTUVNOwogCisJbnZrbV90
cmFjZShzdWJkZXYsICJldmVudDogaW5pdCBmb3IgJWQgdHlwZXMgb24gJWQgaW5kaWNlcyBjYWxs
aW5nICVwXG4iLAorCQkgICB0eXBlc19uciwgaW5kZXhfbnIsIGZ1bmMpOworCiAJZXZlbnQtPmZ1
bmMgPSBmdW5jOwogCWV2ZW50LT5zdWJkZXYgPSBzdWJkZXY7CiAJZXZlbnQtPnR5cGVzX25yID0g
dHlwZXNfbnI7CmRpZmYgLXVycCBhL2RyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L252a20vZW5naW5l
L2Rpc3AvdWNvbm4uYyBiL2RyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L252a20vZW5naW5lL2Rpc3Av
dWNvbm4uYwotLS0gYS9kcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9udmttL2VuZ2luZS9kaXNwL3Vj
b25uLmMJMjAyMy0wNC0wNiAwNjoxMjo0OC4wMDAwMDAwMDAgLTA0MDAKKysrIGIvZHJpdmVycy9n
cHUvZHJtL25vdXZlYXUvbnZrbS9lbmdpbmUvZGlzcC91Y29ubi5jCTIwMjMtMDQtMjEgMDk6MDc6
NTkuODY0ODg0ODk2IC0wNDAwCkBAIC04Niw3ICs4Niw3IEBAIG52a21fdWNvbm5fdWV2ZW50KHN0
cnVjdCBudmttX29iamVjdCAqb2IKIAkJCWlmIChhcmdzLT52MC50eXBlcyAmIE5WSUZfQ09OTl9F
VkVOVF9WMF9VTlBMVUcpIGJpdHMgfD0gTlZLTV9JMkNfVU5QTFVHOwogCQkJaWYgKGFyZ3MtPnYw
LnR5cGVzICYgTlZJRl9DT05OX0VWRU5UX1YwX0lSUSAgICkgYml0cyB8PSBOVktNX0kyQ19JUlE7
CiAKLQkJCXJldHVybiBudmttX3VldmVudF9hZGQodWV2ZW50LCAmZGV2aWNlLT5pMmMtPmV2ZW50
LCBvdXRwLT5kcC5hdXgtPmlkLCBiaXRzLAorCQkJcmV0dXJuIG52a21fdWV2ZW50X2FkZCh1ZXZl
bnQsICZkZXZpY2UtPmkyYy0+ZXZlbnQsIChvdXRwLT5kcC5hdXgtPmlkKSYweGZmLCBiaXRzLAog
CQkJCQkgICAgICAgbnZrbV91Y29ubl91ZXZlbnRfYXV4KTsKIAkJfQogCX0K
--000000000000558d2105f9dc1bd4--
