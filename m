Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 47C02B1534
	for <lists+nouveau@lfdr.de>; Thu, 12 Sep 2019 22:10:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A949F6EE1F;
	Thu, 12 Sep 2019 20:10:21 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:fe98:4b55])
 by gabe.freedesktop.org (Postfix) with ESMTP id 7BD566EE1F
 for <nouveau@lists.freedesktop.org>; Thu, 12 Sep 2019 20:10:19 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id E23C272167; Thu, 12 Sep 2019 20:10:18 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: nouveau@lists.freedesktop.org
Date: Thu, 12 Sep 2019 20:10:16 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: xorg
X-Bugzilla-Component: Driver/nouveau
X-Bugzilla-Version: unspecified
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: not set
X-Bugzilla-Who: diggest@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: not set
X-Bugzilla-Assigned-To: nouveau@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-111642-8800-NilAQG7zYy@http.bugs.freedesktop.org/>
In-Reply-To: <bug-111642-8800@http.bugs.freedesktop.org/>
References: <bug-111642-8800@http.bugs.freedesktop.org/>
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Subject: [Nouveau] [Bug 111642] NV43 GeForce 6600 Nouveau is not stable on
 legacy hardware
X-BeenThere: nouveau@lists.freedesktop.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request@lists.freedesktop.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============0258727380=="
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>


--===============0258727380==
Content-Type: multipart/alternative; boundary="15683190180.9FF7a6d1.32267"
Content-Transfer-Encoding: 7bit


--15683190180.9FF7a6d1.32267
Date: Thu, 12 Sep 2019 20:10:18 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D111642

--- Comment #14 from Vasili Pupkin <diggest@gmail.com> ---
The system has two identical card installed (I completely forgotten about t=
his
fact because no monitor is connected to the second adapter). I've connected
monitor to the second one and it only shows cursor, no window is shown when=
 I
move one to the second monitor. Ok. I removed the second card and nouveau s=
top
spinning dmesg with those messages. The freezes remains and it feels less
stable with one card than it was with two cards, rarely survive more than f=
ive
minutes.

So there are two questions:=20
Are those messages a bug or the two adapter setup require some additional
configuration to work properly?
How to debug freezes? Ctrl+Alt+F2 doesn't work.

I've found this stacktrace in syslog at the end, not sure if it is the last
stack before crash

------------[ cut here ]------------
nouveau 0000:01:00.0: timeout
....
....
 Call Trace:
  nvkm_vmm_iter.constprop.12+0x2e5/0x880 [nouveau]
  ? nv41_vmm_pgt_sgl+0x140/0x140 [nouveau]
  ? nvkm_vmm_free_insert+0x80/0x80 [nouveau]
  ? nvkm_vmm_put_region+0xd0/0x160 [nouveau]
  nvkm_vmm_ptes_unmap_put+0x32/0x50 [nouveau]
  ? nv41_vmm_pgt_sgl+0x140/0x140 [nouveau]
  nvkm_vmm_put_locked+0x103/0x220 [nouveau]
  nvkm_uvmm_mthd+0x7eb/0x850 [nouveau]
  nvkm_object_mthd+0x1a/0x30 [nouveau]
  nvkm_ioctl_mthd+0x5d/0xb0 [nouveau]
  nvkm_ioctl+0x11d/0x280 [nouveau]
  nvkm_client_ioctl+0x12/0x20 [nouveau]
  nvif_object_ioctl+0x47/0x50 [nouveau]
  nvif_object_mthd+0x129/0x150 [nouveau]
  ? __ttm_dma_free_page.isra.5+0x32/0x40 [ttm]
  ? isolate_huge_page+0x30/0xa0
  ? __ttm_dma_free_page.isra.5+0x32/0x40 [ttm]
  ? ttm_dma_page_put+0x53/0x90 [ttm]
  nvif_vmm_put+0x5f/0x80 [nouveau]
  nouveau_mem_fini+0x3b/0x70 [nouveau]
  nv04_sgdma_unbind+0x12/0x20 [nouveau]
  ttm_tt_unbind+0x21/0x40 [ttm]
  ttm_tt_destroy.part.12+0x12/0x60 [ttm]
  ttm_tt_destroy+0x13/0x20 [ttm]
  ttm_bo_cleanup_memtype_use+0x32/0x70 [ttm]
  ttm_bo_cleanup_refs+0x1c0/0x200 [ttm]
  ? ttm_mem_global_free+0x13/0x20 [ttm]
  ttm_bo_delayed_delete+0x1cd/0x1e0 [ttm]
  ttm_bo_delayed_workqueue+0x1b/0x40 [ttm]
  process_one_work+0x1fd/0x400
  worker_thread+0x34/0x410
  kthread+0x121/0x140
  ? process_one_work+0x400/0x400
  ? kthread_park+0x90/0x90
  ret_from_fork+0x35/0x40

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15683190180.9FF7a6d1.32267
Date: Thu, 12 Sep 2019 20:10:18 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

<html>
    <head>
      <base href=3D"https://bugs.freedesktop.org/">
    </head>
    <body>
      <p>
        <div>
            <b><a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - NV43 GeForce 6600 Nouveau is not stable on legacy hardwar=
e"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111642#c14">Comme=
nt # 14</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - NV43 GeForce 6600 Nouveau is not stable on legacy hardwar=
e"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111642">bug 11164=
2</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
diggest&#64;gmail.com" title=3D"Vasili Pupkin &lt;diggest&#64;gmail.com&gt;=
"> <span class=3D"fn">Vasili Pupkin</span></a>
</span></b>
        <pre>The system has two identical card installed (I completely forg=
otten about this
fact because no monitor is connected to the second adapter). I've connected
monitor to the second one and it only shows cursor, no window is shown when=
 I
move one to the second monitor. Ok. I removed the second card and nouveau s=
top
spinning dmesg with those messages. The freezes remains and it feels less
stable with one card than it was with two cards, rarely survive more than f=
ive
minutes.

So there are two questions:=20
Are those messages a bug or the two adapter setup require some additional
configuration to work properly?
How to debug freezes? Ctrl+Alt+F2 doesn't work.

I've found this stacktrace in syslog at the end, not sure if it is the last
stack before crash

------------[ cut here ]------------
nouveau 0000:01:00.0: timeout
....
....
 Call Trace:
  nvkm_vmm_iter.constprop.12+0x2e5/0x880 [nouveau]
  ? nv41_vmm_pgt_sgl+0x140/0x140 [nouveau]
  ? nvkm_vmm_free_insert+0x80/0x80 [nouveau]
  ? nvkm_vmm_put_region+0xd0/0x160 [nouveau]
  nvkm_vmm_ptes_unmap_put+0x32/0x50 [nouveau]
  ? nv41_vmm_pgt_sgl+0x140/0x140 [nouveau]
  nvkm_vmm_put_locked+0x103/0x220 [nouveau]
  nvkm_uvmm_mthd+0x7eb/0x850 [nouveau]
  nvkm_object_mthd+0x1a/0x30 [nouveau]
  nvkm_ioctl_mthd+0x5d/0xb0 [nouveau]
  nvkm_ioctl+0x11d/0x280 [nouveau]
  nvkm_client_ioctl+0x12/0x20 [nouveau]
  nvif_object_ioctl+0x47/0x50 [nouveau]
  nvif_object_mthd+0x129/0x150 [nouveau]
  ? __ttm_dma_free_page.isra.5+0x32/0x40 [ttm]
  ? isolate_huge_page+0x30/0xa0
  ? __ttm_dma_free_page.isra.5+0x32/0x40 [ttm]
  ? ttm_dma_page_put+0x53/0x90 [ttm]
  nvif_vmm_put+0x5f/0x80 [nouveau]
  nouveau_mem_fini+0x3b/0x70 [nouveau]
  nv04_sgdma_unbind+0x12/0x20 [nouveau]
  ttm_tt_unbind+0x21/0x40 [ttm]
  ttm_tt_destroy.part.12+0x12/0x60 [ttm]
  ttm_tt_destroy+0x13/0x20 [ttm]
  ttm_bo_cleanup_memtype_use+0x32/0x70 [ttm]
  ttm_bo_cleanup_refs+0x1c0/0x200 [ttm]
  ? ttm_mem_global_free+0x13/0x20 [ttm]
  ttm_bo_delayed_delete+0x1cd/0x1e0 [ttm]
  ttm_bo_delayed_workqueue+0x1b/0x40 [ttm]
  process_one_work+0x1fd/0x400
  worker_thread+0x34/0x410
  kthread+0x121/0x140
  ? process_one_work+0x400/0x400
  ? kthread_park+0x90/0x90
  ret_from_fork+0x35/0x40</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15683190180.9FF7a6d1.32267--

--===============0258727380==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1

--===============0258727380==--
