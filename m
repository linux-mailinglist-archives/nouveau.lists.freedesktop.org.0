Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6094628CF97
	for <lists+nouveau@lfdr.de>; Tue, 13 Oct 2020 15:55:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D9DEC6E3B7;
	Tue, 13 Oct 2020 13:55:13 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com
 [IPv6:2a00:1450:4864:20::244])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C6096E8DD;
 Tue, 13 Oct 2020 12:47:53 +0000 (UTC)
Received: by mail-lj1-x244.google.com with SMTP id p15so20293376ljj.8;
 Tue, 13 Oct 2020 05:47:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ZXTvUW8i/U5ht8x+SD+qkflPPjrpIHYF48QftZr+dnU=;
 b=Tb/HEFXFqT688G41sablA8Rj4JLcFk3TxMzkrfT6uScq3/MeO3sr0c4+uYkJH10eSK
 onifD8sknV8ZCDjbSFcoiYG2wX0/UU7Z+ZZgJoazflWqExBku4FiYfLl9vStr8FpvI0D
 sho8c205xC1d8yQyTKcQPvlo5qBIp5mxFrr12tVCVxAyLpMJFDKK85hW3yn8a7fM9Owb
 CkM1jCPJGASl6GAabDkxTXLN/HCr73mXAS3KfXyDLzO791VDdzKCpTWQC3oleDBFAGBL
 XX67tjDHoU6KZ2POf6/hJD8ydBEzv3RtJc9r9bMV3tpsA0x3mjFb0VPhGo1ZEw0MDeS0
 Dd5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ZXTvUW8i/U5ht8x+SD+qkflPPjrpIHYF48QftZr+dnU=;
 b=lUDeN6+oBGru7u776YL6ZCTYLJTZzHQvq8MVrppwILmiFeUc4px/XOsVORPM7xMPBt
 WtRDmzExjqdSjvRpW3CyUF3Jyk2p1cWMnryqx52KtQmtiov0s1XAIzMXvHXIZ1Zgkal9
 DmRAWANNaZGQrUUuM8+zaKUcBX8NaQdk8hx3w6QEMdwC0TThYit8p5vzOBCS7esYp/l7
 KcHuy7MImH2jg2a5JAzm32fqcRQ1D7dwjZpoKsqCXRA6nc5Alwb4oyExRQNSaBQ4yDjy
 EfTfIVRJ7gAA8qhSTQ8gAg8Mq7pJ6q/AbIMIBU7sfo87ChaKHqntyfLGUZhqeCj2zkLU
 3pAQ==
X-Gm-Message-State: AOAM532Tzk9U2U7+MKMPE/AaNIz1j55oGC7361E2WI4EhX4jSQQosuds
 IX2TQBHH0rt+zDsF6nk2rKg=
X-Google-Smtp-Source: ABdhPJwTSyYPf21swLMDZjjUHzsZ7D5xgZYB/CN/9aYHZB44K6lAxY7nrshdcW+8vKZYzye4IQiFVg==
X-Received: by 2002:a2e:9f0f:: with SMTP id u15mr9837257ljk.80.1602593271865; 
 Tue, 13 Oct 2020 05:47:51 -0700 (PDT)
Received: from lp-sasha.localdomain ([146.120.244.2])
 by smtp.gmail.com with ESMTPSA id l25sm666532lfc.152.2020.10.13.05.47.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Oct 2020 05:47:50 -0700 (PDT)
From: Alexander Kapshuk <alexander.kapshuk@gmail.com>
To: lyude@redhat.com,
	bskeggs@redhat.com
Date: Tue, 13 Oct 2020 15:47:25 +0300
Message-Id: <20201013124725.2394-1-alexander.kapshuk@gmail.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
X-Mailman-Approved-At: Tue, 13 Oct 2020 13:55:12 +0000
Subject: [Nouveau] [PATCH v2] drm/nouveau/kms: Fix NULL pointer dereference
 in nouveau_connector_detect_depth
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
Cc: alexander.kapshuk@gmail.com, airlied@linux.ie,
 nouveau@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-next@vger.kernel.org, daniel@ffwll.ch
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

This oops manifests itself on the following hardware:
01:00.0 VGA compatible controller: NVIDIA Corporation G98M [GeForce G 103M] (rev a1)

Oct 09 14:17:46 lp-sasha kernel: BUG: kernel NULL pointer dereference, address: 0000000000000000
Oct 09 14:17:46 lp-sasha kernel: #PF: supervisor read access in kernel mode
Oct 09 14:17:46 lp-sasha kernel: #PF: error_code(0x0000) - not-present page
Oct 09 14:17:46 lp-sasha kernel: PGD 0 P4D 0
Oct 09 14:17:46 lp-sasha kernel: Oops: 0000 [#1] SMP PTI
Oct 09 14:17:46 lp-sasha kernel: CPU: 1 PID: 191 Comm: systemd-udevd Not tainted 5.9.0-rc8-next-20201009 #38
Oct 09 14:17:46 lp-sasha kernel: Hardware name: Hewlett-Packard Compaq Presario CQ61 Notebook PC/306A, BIOS F.03 03/23/2009
Oct 09 14:17:46 lp-sasha kernel: RIP: 0010:nouveau_connector_detect_depth+0x71/0xc0 [nouveau]
Oct 09 14:17:46 lp-sasha kernel: Code: 0a 00 00 48 8b 49 48 c7 87 b8 00 00 00 06 00 00 00 80 b9 4d 0a 00 00 00 75 1e 83 fa 41 75 05 48 85 c0 75 29 8b 81 10 0d 00 00 <39> 06 7c 25 f6 81 14 0d 00 00 02 75 b7 c3 80 b9 0c 0d 00 00 00 75
Oct 09 14:17:46 lp-sasha kernel: RSP: 0018:ffffc9000028f8c0 EFLAGS: 00010297
Oct 09 14:17:46 lp-sasha kernel: RAX: 0000000000014c08 RBX: ffff8880369d4000 RCX: ffff8880369d3000
Oct 09 14:17:46 lp-sasha kernel: RDX: 0000000000000040 RSI: 0000000000000000 RDI: ffff8880369d4000
Oct 09 14:17:46 lp-sasha kernel: RBP: ffff88800601cc00 R08: ffff8880051da298 R09: ffffffff8226201a
Oct 09 14:17:46 lp-sasha kernel: R10: ffff88800469aa80 R11: ffff888004c84ff8 R12: 0000000000000000
Oct 09 14:17:46 lp-sasha kernel: R13: ffff8880051da000 R14: 0000000000002000 R15: 0000000000000003
Oct 09 14:17:46 lp-sasha kernel: FS:  00007fd0192b3440(0000) GS:ffff8880bc900000(0000) knlGS:0000000000000000
Oct 09 14:17:46 lp-sasha kernel: CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
Oct 09 14:17:46 lp-sasha kernel: CR2: 0000000000000000 CR3: 0000000004976000 CR4: 00000000000006e0
Oct 09 14:17:46 lp-sasha kernel: Call Trace:
Oct 09 14:17:46 lp-sasha kernel:  nouveau_connector_get_modes+0x1e6/0x240 [nouveau]
Oct 09 14:17:46 lp-sasha kernel:  ? kfree+0xb9/0x240
Oct 09 14:17:46 lp-sasha kernel:  ? drm_connector_list_iter_next+0x7c/0xa0
Oct 09 14:17:46 lp-sasha kernel:  drm_helper_probe_single_connector_modes+0x1ba/0x7c0
Oct 09 14:17:46 lp-sasha kernel:  drm_client_modeset_probe+0x27e/0x1360
Oct 09 14:17:46 lp-sasha kernel:  ? nvif_object_sclass_put+0xc/0x20 [nouveau]
Oct 09 14:17:46 lp-sasha kernel:  ? nouveau_cli_init+0x3cc/0x440 [nouveau]
Oct 09 14:17:46 lp-sasha kernel:  ? ktime_get_mono_fast_ns+0x49/0xa0
Oct 09 14:17:46 lp-sasha kernel:  ? nouveau_drm_open+0x4e/0x180 [nouveau]
Oct 09 14:17:46 lp-sasha kernel:  __drm_fb_helper_initial_config_and_unlock+0x3f/0x4a0
Oct 09 14:17:46 lp-sasha kernel:  ? drm_file_alloc+0x18f/0x260
Oct 09 14:17:46 lp-sasha kernel:  ? mutex_lock+0x9/0x40
Oct 09 14:17:46 lp-sasha kernel:  ? drm_client_init+0x110/0x160
Oct 09 14:17:46 lp-sasha kernel:  nouveau_fbcon_init+0x14d/0x1c0 [nouveau]
Oct 09 14:17:46 lp-sasha kernel:  nouveau_drm_device_init+0x1c0/0x880 [nouveau]
Oct 09 14:17:46 lp-sasha kernel:  nouveau_drm_probe+0x11a/0x1e0 [nouveau]
Oct 09 14:17:46 lp-sasha kernel:  pci_device_probe+0xcd/0x140
Oct 09 14:17:46 lp-sasha kernel:  really_probe+0xd8/0x400
Oct 09 14:17:46 lp-sasha kernel:  driver_probe_device+0x4a/0xa0
Oct 09 14:17:46 lp-sasha kernel:  device_driver_attach+0x9c/0xc0
Oct 09 14:17:46 lp-sasha kernel:  __driver_attach+0x6f/0x100
Oct 09 14:17:46 lp-sasha kernel:  ? device_driver_attach+0xc0/0xc0
Oct 09 14:17:46 lp-sasha kernel:  bus_for_each_dev+0x75/0xc0
Oct 09 14:17:46 lp-sasha kernel:  bus_add_driver+0x106/0x1c0
Oct 09 14:17:46 lp-sasha kernel:  driver_register+0x86/0xe0
Oct 09 14:17:46 lp-sasha kernel:  ? 0xffffffffa044e000
Oct 09 14:17:46 lp-sasha kernel:  do_one_initcall+0x48/0x1e0
Oct 09 14:17:46 lp-sasha kernel:  ? _cond_resched+0x11/0x60
Oct 09 14:17:46 lp-sasha kernel:  ? kmem_cache_alloc_trace+0x19c/0x1e0
Oct 09 14:17:46 lp-sasha kernel:  do_init_module+0x57/0x220
Oct 09 14:17:46 lp-sasha kernel:  __do_sys_finit_module+0xa0/0xe0
Oct 09 14:17:46 lp-sasha kernel:  do_syscall_64+0x33/0x40
Oct 09 14:17:46 lp-sasha kernel:  entry_SYSCALL_64_after_hwframe+0x44/0xa9
Oct 09 14:17:46 lp-sasha kernel: RIP: 0033:0x7fd01a060d5d
Oct 09 14:17:46 lp-sasha kernel: Code: 00 c3 66 2e 0f 1f 84 00 00 00 00 00 90 f3 0f 1e fa 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 8b 0d e3 70 0c 00 f7 d8 64 89 01 48
Oct 09 14:17:46 lp-sasha kernel: RSP: 002b:00007ffc8ad38a98 EFLAGS: 00000246 ORIG_RAX: 0000000000000139
Oct 09 14:17:46 lp-sasha kernel: RAX: ffffffffffffffda RBX: 0000563f6e7fd530 RCX: 00007fd01a060d5d
Oct 09 14:17:46 lp-sasha kernel: RDX: 0000000000000000 RSI: 00007fd01a19f95d RDI: 000000000000000f
Oct 09 14:17:46 lp-sasha kernel: RBP: 0000000000020000 R08: 0000000000000000 R09: 0000000000000007
Oct 09 14:17:46 lp-sasha kernel: R10: 000000000000000f R11: 0000000000000246 R12: 00007fd01a19f95d
Oct 09 14:17:46 lp-sasha kernel: R13: 0000000000000000 R14: 0000563f6e7fbc10 R15: 0000563f6e7fd530
Oct 09 14:17:46 lp-sasha kernel: Modules linked in: nouveau(+) ttm xt_string xt_mark xt_LOG vgem v4l2_dv_timings uvcvideo ulpi udf ts_kmp ts_fsm ts_bm snd_aloop sil164 qat_dh895xccvf nf_nat_sip nf_nat_irc nf_nat_ftp nf_nat nf_log_ipv6 nf_log_ipv4 nf_log_common ltc2990 lcd intel_qat input_leds i2c_mux gspca_main videobuf2_vmalloc videobuf2_memops videobuf2_v4l2 videobuf2_common videodev mc drivetemp cuse fuse crc_itu_t coretemp ch7006 ath5k ath algif_hash
Oct 09 14:17:46 lp-sasha kernel: CR2: 0000000000000000
Oct 09 14:17:46 lp-sasha kernel: ---[ end trace 0ddafe218ad30017 ]---
Oct 09 14:17:46 lp-sasha kernel: RIP: 0010:nouveau_connector_detect_depth+0x71/0xc0 [nouveau]
Oct 09 14:17:46 lp-sasha kernel: Code: 0a 00 00 48 8b 49 48 c7 87 b8 00 00 00 06 00 00 00 80 b9 4d 0a 00 00 00 75 1e 83 fa 41 75 05 48 85 c0 75 29 8b 81 10 0d 00 00 <39> 06 7c 25 f6 81 14 0d 00 00 02 75 b7 c3 80 b9 0c 0d 00 00 00 75
Oct 09 14:17:46 lp-sasha kernel: RSP: 0018:ffffc9000028f8c0 EFLAGS: 00010297
Oct 09 14:17:46 lp-sasha kernel: RAX: 0000000000014c08 RBX: ffff8880369d4000 RCX: ffff8880369d3000
Oct 09 14:17:46 lp-sasha kernel: RDX: 0000000000000040 RSI: 0000000000000000 RDI: ffff8880369d4000
Oct 09 14:17:46 lp-sasha kernel: RBP: ffff88800601cc00 R08: ffff8880051da298 R09: ffffffff8226201a
Oct 09 14:17:46 lp-sasha kernel: R10: ffff88800469aa80 R11: ffff888004c84ff8 R12: 0000000000000000
Oct 09 14:17:46 lp-sasha kernel: R13: ffff8880051da000 R14: 0000000000002000 R15: 0000000000000003
Oct 09 14:17:46 lp-sasha kernel: FS:  00007fd0192b3440(0000) GS:ffff8880bc900000(0000) knlGS:0000000000000000
Oct 09 14:17:46 lp-sasha kernel: CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
Oct 09 14:17:46 lp-sasha kernel: CR2: 0000000000000000 CR3: 0000000004976000 CR4: 00000000000006e0

The disassembly:
Code: 0a 00 00 48 8b 49 48 c7 87 b8 00 00 00 06 00 00 00 80 b9 4d 0a 00 00 00 75 1e 83 fa 41 75 05 48 85 c0 75 29 8b 81 10 0d 00 00 <39> 06 7c 25 f6 81 14 0d 00 00 02 75 b7 c3 80 b9 0c 0d 00 00 00 75
All code
========
   0:   0a 00                   or     (%rax),%al
   2:   00 48 8b                add    %cl,-0x75(%rax)
   5:   49                      rex.WB
   6:   48 c7 87 b8 00 00 00    movq   $0x6,0xb8(%rdi)
   d:   06 00 00 00
  11:   80 b9 4d 0a 00 00 00    cmpb   $0x0,0xa4d(%rcx)
  18:   75 1e                   jne    0x38
  1a:   83 fa 41                cmp    $0x41,%edx
  1d:   75 05                   jne    0x24
  1f:   48 85 c0                test   %rax,%rax
  22:   75 29                   jne    0x4d
  24:   8b 81 10 0d 00 00       mov    0xd10(%rcx),%eax
  2a:*  39 06                   cmp    %eax,(%rsi)              <-- trapping instruction
  2c:   7c 25                   jl     0x53
  2e:   f6 81 14 0d 00 00 02    testb  $0x2,0xd14(%rcx)
  35:   75 b7                   jne    0xffffffffffffffee
  37:   c3                      retq
  38:   80 b9 0c 0d 00 00 00    cmpb   $0x0,0xd0c(%rcx)
  3f:   75                      .byte 0x75

Code starting with the faulting instruction
===========================================
   0:   39 06                   cmp    %eax,(%rsi)
   2:   7c 25                   jl     0x29
   4:   f6 81 14 0d 00 00 02    testb  $0x2,0xd14(%rcx)
   b:   75 b7                   jne    0xffffffffffffffc4
   d:   c3                      retq
   e:   80 b9 0c 0d 00 00 00    cmpb   $0x0,0xd0c(%rcx)
  15:   75                      .byte 0x75

objdump -SF --disassemble=nouveau_connector_detect_depth
[...]
        if (nv_connector->edid &&
   c85e1:       83 fa 41                cmp    $0x41,%edx
   c85e4:       75 05                   jne    c85eb <nouveau_connector_detect_depth+0x6b> (File Offset: 0xc866b)
   c85e6:       48 85 c0                test   %rax,%rax
   c85e9:       75 29                   jne    c8614 <nouveau_connector_detect_depth+0x94> (File Offset: 0xc8694)
            nv_connector->type == DCB_CONNECTOR_LVDS_SPWG)
                duallink = ((u8 *)nv_connector->edid)[121] == 2;
        else
                duallink = mode->clock >= bios->fp.duallink_transition_clk;

        if ((!duallink && (bios->fp.strapless_is_24bit & 1)) ||
   c85eb:       8b 81 10 0d 00 00       mov    0xd10(%rcx),%eax
   c85f1:       39 06                   cmp    %eax,(%rsi)
   c85f3:       7c 25                   jl     c861a <nouveau_connector_detect_depth+0x9a> (File Offset: 0xc869a)
            ( duallink && (bios->fp.strapless_is_24bit & 2)))
   c85f5:       f6 81 14 0d 00 00 02    testb  $0x2,0xd14(%rcx)
   c85fc:       75 b7                   jne    c85b5 <nouveau_connector_detect_depth+0x35> (File Offset: 0xc8635)
                connector->display_info.bpc = 8;
[...]

% scripts/faddr2line /lib/modules/5.9.0-rc8-next-20201009/kernel/drivers/gpu/drm/nouveau/nouveau.ko nouveau_connector_detect_depth+0x71/0xc0
nouveau_connector_detect_depth+0x71/0xc0:
nouveau_connector_detect_depth at /home/sasha/linux-next/drivers/gpu/drm/nouveau/nouveau_connector.c:891

It is actually line 889. See the disassembly below.
889                     duallink = mode->clock >= bios->fp.duallink_transition_clk;

The NULL pointer being dereferenced is mode.

Git bisect has identified the following commit as bad:
f28e32d3906e drm/nouveau/kms: Don't change EDID when it hasn't actually changed

Here is the chain of events that causes the oops.
On entry to nouveau_connector_detect_lvds, edid is set to NULL.  The call
to nouveau_connector_detect sets nv_connector->edid to valid memory,
with status set to connector_status_connected and the flow of execution
branching to the out label.

The subsequent call to nouveau_connector_set_edid erronously clears
nv_connector->edid, via the local edid pointer which remains set to NULL.

Fix this by setting edid to the value of the just acquired
nv_connector->edid and executing the body of nouveau_connector_set_edid
only if nv_connector->edid and edid point to different memory addresses
thus preventing nv_connector->edid from being turned into a dangling
pointer.

Fixes: f28e32d3906e ("drm/nouveau/kms: Don't change EDID when it hasn't actually changed")
Signed-off-by: Alexander Kapshuk <alexander.kapshuk@gmail.com>
Reviewed-by: Lyude Paul <lyude@redhat.com>
---
v2:
-----
- nouveau_connector_set_edid updated to do the (nv_connector->edid
!= edid) check instead of open coding it in nouveau_connector_detect_lvds
- added Reviewed-by: from Lyude Paul

 drivers/gpu/drm/nouveau/nouveau_connector.c | 14 +++++++++-----
 1 file changed, 9 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_connector.c b/drivers/gpu/drm/nouveau/nouveau_connector.c
index 49dd0cbc332f..5eb322276be7 100644
--- a/drivers/gpu/drm/nouveau/nouveau_connector.c
+++ b/drivers/gpu/drm/nouveau/nouveau_connector.c
@@ -532,11 +532,13 @@ static void
 nouveau_connector_set_edid(struct nouveau_connector *nv_connector,
 			   struct edid *edid)
 {
-	struct edid *old_edid = nv_connector->edid;
+	if (nv_connector->edid != edid) {
+		struct edid *old_edid = nv_connector->edid;

-	drm_connector_update_edid_property(&nv_connector->base, edid);
-	kfree(old_edid);
-	nv_connector->edid = edid;
+		drm_connector_update_edid_property(&nv_connector->base, edid);
+		kfree(old_edid);
+		nv_connector->edid = edid;
+	}
 }

 static enum drm_connector_status
@@ -669,8 +671,10 @@ nouveau_connector_detect_lvds(struct drm_connector *connector, bool force)
 	/* Try retrieving EDID via DDC */
 	if (!drm->vbios.fp_no_ddc) {
 		status = nouveau_connector_detect(connector, force);
-		if (status == connector_status_connected)
+		if (status == connector_status_connected) {
+			edid = nv_connector->edid;
 			goto out;
+		}
 	}

 	/* On some laptops (Sony, i'm looking at you) there appears to
--
2.28.0

_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
