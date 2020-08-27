Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E720254982
	for <lists+nouveau@lfdr.de>; Thu, 27 Aug 2020 17:33:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 49CB96E093;
	Thu, 27 Aug 2020 15:33:00 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
X-Greylist: delayed 1200 seconds by postgrey-1.36 at gabe;
 Thu, 27 Aug 2020 15:32:59 UTC
Received: from mta-87-1.sparkpostmail.com (mta-87-1.sparkpostmail.com
 [192.174.87.1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 667526E093
 for <nouveau@lists.freedesktop.org>; Thu, 27 Aug 2020 15:32:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=odi.ch; s=scph1018;
 t=1598541173; i=@odi.ch;
 bh=U+BR1aehlRDrV79rMGGv918Tn5GAYDv84S9BGtA7M5s=;
 h=From:Subject:To:Message-ID:Date:Content-Type;
 b=h2uTN4brDQCmJY0s86Trfa0YWFHuaHclITi+buU4v3LEml4gbGDu3pEyfeMjoVrvU
 pc5OyGav+/2+uL0O0F/Zzu9V7ZcMSBhfi2pGWmsMc3a1/cSvO931n1IrrgLoxFuflq
 sScN6y1G003roLCS1clitvn7byw3AXCDQuqAi/lc=
X-MSFBL: 9Zm4KnyQ8UEXMxU0CTr5uGMJCvXEdEx/4MSMBQ5xsm8=|eyJtZXNzYWdlX2lkIjo
 iMDA0Njc0Y2Q0NzVmZDAzMjg4ZDUiLCJyIjoibm91dmVhdUBsaXN0cy5mcmVlZGV
 za3RvcC5vcmciLCJzdWJhY2NvdW50X2lkIjoiMCIsInRlbmFudF9pZCI6InNwYyI
 sImN1c3RvbWVyX2lkIjoiMjQyNDUzIn0=
Authentication-Results: aa.mta1vsmtp.cc.prd.sparkpost smtp.user=<hidden>;
 auth=pass (PLAIN)
Received: from [84.254.94.148] ([84.254.94.148:40016] helo=black.odi.ch)
 by aa.mta1vsmtp.cc.prd.sparkpost (envelope-from <odi@odi.ch>)
 (ecelerity 4.3.1.83937 r(Core:4.3.1.43)) with ESMTPSA (cipher=AES-256-GCM) 
 id 88/5D-13008-47DC74F5; Thu, 27 Aug 2020 15:12:52 +0000
Received: from [10.11.1.254] (unknown [81.7.230.226])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by black.odi.ch (Postfix) with ESMTPSA id D19241A400B8;
 Thu, 27 Aug 2020 17:12:12 +0200 (CEST)
From: =?UTF-8?Q?Ortwin_Gl=c3=bcck?= <odi@odi.ch>
To: Ben Skeggs <bskeggs@redhat.com>,
 "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Message-ID: <9a8bd359-1179-f000-e1f8-7246cd9f02ca@odi.ch>
Date: Thu, 27 Aug 2020 17:12:12 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
Content-Language: en-US
Subject: [Nouveau] 5.8.4: WARNING at drivers/gpu/drm/nouveau/nvif/vmm.c:68
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

Hi,

I just found this new WARNING in dmesg. Maybe you want to know.
I haven't seen this before in 5.7.

BR

Ortwin


[Thu Aug 27 15:40:48 2020] ------------[ cut here ]------------
[Thu Aug 27 15:40:48 2020] WARNING: CPU: 6 PID: 23542 at drivers/gpu/drm/nouveau/nvif/vmm.c:68 
nvif_vmm_put+0x65/0x70
[Thu Aug 27 15:40:48 2020] CPU: 6 PID: 23542 Comm: kworker/6:2 Tainted: G                T 5.8.4 #4
[Thu Aug 27 15:40:48 2020] Hardware name: Hewlett-Packard HP ZBook 15/1909, BIOS L70 Ver. 01.21 
08/13/2014
[Thu Aug 27 15:40:48 2020] Workqueue: events nouveau_cli_work
[Thu Aug 27 15:40:48 2020] RIP: 0010:nvif_vmm_put+0x65/0x70
[Thu Aug 27 15:40:48 2020] Code: 00 00 48 89 e2 be 02 00 00 00 48 c7 04 24 00 00 00 00 48 89 44 24 
08 e8 e9 e5 ff ff 85 c0 75 0a 48 c7 43 08 00 00 00 00 eb b7 <0f> 0b eb f2 e8 52 ef 6a 00 66 90 53 48 
83 ec 20 65 48 8b 04 25 28
[Thu Aug 27 15:40:48 2020] RSP: 0018:ffffb81bc41bfdc8 EFLAGS: 00010282
[Thu Aug 27 15:40:48 2020] RAX: 00000000fffffffe RBX: ffffb81bc41bfdf0 RCX: 0000000000000000
[Thu Aug 27 15:40:48 2020] RDX: 0000000000000010 RSI: ffffb81bc41bfd38 RDI: ffffb81bc41bfdd8
[Thu Aug 27 15:40:48 2020] RBP: ffff9ea0172f5d00 R08: 00000000fffffffe R09: 0000000000000000
[Thu Aug 27 15:40:48 2020] R10: 0000000000000030 R11: 0000000000000001 R12: ffff9ea02e7b1a20
[Thu Aug 27 15:40:48 2020] R13: dead000000000100 R14: ffff9ea02e7b1b40 R15: ffff9ea02e7b1bb0
[Thu Aug 27 15:40:48 2020] FS:  0000000000000000(0000) GS:ffff9ea0ced80000(0000) knlGS:0000000000000000
[Thu Aug 27 15:40:48 2020] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[Thu Aug 27 15:40:48 2020] CR2: 00007fb2f154a5ca CR3: 00000003f623e003 CR4: 00000000001606e0
[Thu Aug 27 15:40:48 2020] Call Trace:
[Thu Aug 27 15:40:48 2020]  nouveau_vma_del+0x73/0xc0
[Thu Aug 27 15:40:48 2020]  nouveau_gem_object_delete_work+0x31/0x60
[Thu Aug 27 15:40:48 2020]  nouveau_cli_work+0xc7/0x120
[Thu Aug 27 15:40:48 2020]  process_one_work+0x185/0x2d0
[Thu Aug 27 15:40:48 2020]  worker_thread+0x4b/0x390
[Thu Aug 27 15:40:48 2020]  ? process_one_work+0x2d0/0x2d0
[Thu Aug 27 15:40:48 2020]  kthread+0x10c/0x150
[Thu Aug 27 15:40:48 2020]  ? __kthread_create_on_node+0x190/0x190
[Thu Aug 27 15:40:48 2020]  ret_from_fork+0x22/0x30
[Thu Aug 27 15:40:48 2020] ---[ end trace e1a138f248609cd4 ]---
_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
