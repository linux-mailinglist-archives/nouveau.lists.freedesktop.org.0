Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9181D3585B
	for <lists+nouveau@lfdr.de>; Wed,  5 Jun 2019 10:15:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EEC598921A;
	Wed,  5 Jun 2019 08:15:48 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:fe98:4b55])
 by gabe.freedesktop.org (Postfix) with ESMTP id 50F408921A
 for <nouveau@lists.freedesktop.org>; Wed,  5 Jun 2019 08:15:48 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 47F1E72167; Wed,  5 Jun 2019 08:15:48 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: nouveau@lists.freedesktop.org
Date: Wed, 05 Jun 2019 08:15:47 +0000
X-Bugzilla-Reason: QAcontact AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: Mesa
X-Bugzilla-Component: Drivers/DRI/nouveau
X-Bugzilla-Version: 19.0
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: critical
X-Bugzilla-Who: Linuxfreak@gmx.at
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: high
X-Bugzilla-Assigned-To: nouveau@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-110572-8800-UOz4rOhDn5@http.bugs.freedesktop.org/>
In-Reply-To: <bug-110572-8800@http.bugs.freedesktop.org/>
References: <bug-110572-8800@http.bugs.freedesktop.org/>
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Subject: [Nouveau] [Bug 110572] Regularly System Crash: (ca. 1 hour) nouveau
 0000:08:00.0: gr: PGRAPH TLB flush idle timeout fail and nouveau
 0000:08:00.0: mmu: ce0 mmu invalidate timeout
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
Content-Type: multipart/mixed; boundary="===============1432202257=="
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>


--===============1432202257==
Content-Type: multipart/alternative; boundary="15597225480.203c4C0F0.27836"
Content-Transfer-Encoding: 7bit


--15597225480.203c4C0F0.27836
Date: Wed, 5 Jun 2019 08:15:48 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D110572

--- Comment #17 from Linux Freak <Linuxfreak@gmx.at> ---
Created attachment 144455
  --> https://bugs.freedesktop.org/attachment.cgi?id=3D144455&action=3Dedit
crash 12: a huge   journalctl -p 4 -b -1   of the last crash


Mai 29 11:43:58  kernel: nouveau 0000:08:00.0: gr: PGRAPH TLB flush idle
timeout fail
Mai 29 11:43:59  kernel: nouveau 0000:08:00.0: gr: PGRAPH_STATUS 01bfe101 [=
BUSY
CTXPROG RATTR_APLANE TRAST CLIPID ZCULL ENG2D RMASK TPC_RAST TPC_PROP TPC_T=
EX
TPC_MP ROP]
Mai 29 11:43:59  kernel: nouveau 0000:08:00.0: gr: PGRAPH_VSTATUS0: 0000000=
0 []
Mai 29 11:43:59  kernel: nouveau 0000:08:00.0: gr: PGRAPH_VSTATUS1: 0000106d
[TPC_TEX TPC_MP]
Mai 29 11:43:59  kernel: nouveau 0000:08:00.0: gr: PGRAPH_VSTATUS2: 0034da43
[TRAST ENG2D ROP]


...


 INFO: task kworker/u8:2:1186 blocked for more than 505 seconds.
Mai 29 11:53:24  kernel:       Tainted: G        W         5.1.4-1-MANJARO =
#1
Mai 29 11:53:24  kernel: "echo 0 > /proc/sys/kernel/hung_task_timeout_secs"
disables this message.
Mai 29 11:53:24  kernel: Call Trace:
Mai 29 11:53:24  kernel:  ? __schedule+0x30b/0x8b0
Mai 29 11:53:24  kernel:  schedule+0x32/0x80
Mai 29 11:53:24  kernel:  schedule_timeout+0x311/0x4a0
Mai 29 11:53:24  kernel:  ? nouveau_fence_is_signaled+0x39/0x40 [nouveau]
Mai 29 11:53:24  kernel:  dma_fence_default_wait+0x204/0x280
Mai 29 11:53:24  kernel:  ? dma_fence_wait_timeout+0x120/0x120
Mai 29 11:53:24  kernel:  dma_fence_wait_timeout+0x105/0x120
Mai 29 11:53:24  kernel:  drm_atomic_helper_wait_for_fences+0x38/0xc0
[drm_kms_helper]
Mai 29 11:53:24  kernel:  nv50_disp_atomic_commit_tail+0x72/0x690 [nouveau]
Mai 29 11:53:24  kernel:  ? finish_task_switch+0x84/0x2d0
Mai 29 11:53:24  kernel:  ? __switch_to_asm+0x35/0x70
Mai 29 11:53:24  kernel:  process_one_work+0x1eb/0x410
Mai 29 11:53:24  kernel:  worker_thread+0x2d/0x3d0
Mai 29 11:53:24  kernel:  ? process_one_work+0x410/0x410
Mai 29 11:53:24  kernel:  kthread+0x112/0x130
Mai 29 11:53:24  kernel:  ? kthread_park+0x80/0x80
Mai 29 11:53:24  kernel:  ret_from_fork+0x35/0x40

--=20
You are receiving this mail because:
You are the QA Contact for the bug.
You are the assignee for the bug.=

--15597225480.203c4C0F0.27836
Date: Wed, 5 Jun 2019 08:15:48 +0000
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
   title=3D"NEW - Regularly System Crash: (ca. 1 hour) nouveau 0000:08:00.0=
: gr: PGRAPH TLB flush idle timeout fail and nouveau 0000:08:00.0: mmu: ce0=
 mmu invalidate timeout"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110572#c17">Comme=
nt # 17</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - Regularly System Crash: (ca. 1 hour) nouveau 0000:08:00.0=
: gr: PGRAPH TLB flush idle timeout fail and nouveau 0000:08:00.0: mmu: ce0=
 mmu invalidate timeout"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110572">bug 11057=
2</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
Linuxfreak&#64;gmx.at" title=3D"Linux Freak &lt;Linuxfreak&#64;gmx.at&gt;">=
 <span class=3D"fn">Linux Freak</span></a>
</span></b>
        <pre>Created <span class=3D""><a href=3D"attachment.cgi?id=3D144455=
" name=3D"attach_144455" title=3D"crash 12: a huge   journalctl -p 4 -b -1 =
  of the last crash">attachment 144455</a> <a href=3D"attachment.cgi?id=3D1=
44455&amp;action=3Dedit" title=3D"crash 12: a huge   journalctl -p 4 -b -1 =
  of the last crash">[details]</a></span>
crash 12: a huge   journalctl -p 4 -b -1   of the last crash


Mai 29 11:43:58  kernel: nouveau 0000:08:00.0: gr: PGRAPH TLB flush idle
timeout fail
Mai 29 11:43:59  kernel: nouveau 0000:08:00.0: gr: PGRAPH_STATUS 01bfe101 [=
BUSY
CTXPROG RATTR_APLANE TRAST CLIPID ZCULL ENG2D RMASK TPC_RAST TPC_PROP TPC_T=
EX
TPC_MP ROP]
Mai 29 11:43:59  kernel: nouveau 0000:08:00.0: gr: PGRAPH_VSTATUS0: 0000000=
0 []
Mai 29 11:43:59  kernel: nouveau 0000:08:00.0: gr: PGRAPH_VSTATUS1: 0000106d
[TPC_TEX TPC_MP]
Mai 29 11:43:59  kernel: nouveau 0000:08:00.0: gr: PGRAPH_VSTATUS2: 0034da43
[TRAST ENG2D ROP]


...


 INFO: task kworker/u8:2:1186 blocked for more than 505 seconds.
Mai 29 11:53:24  kernel:       Tainted: G        W         5.1.4-1-MANJARO =
#1
Mai 29 11:53:24  kernel: &quot;echo 0 &gt; /proc/sys/kernel/hung_task_timeo=
ut_secs&quot;
disables this message.
Mai 29 11:53:24  kernel: Call Trace:
Mai 29 11:53:24  kernel:  ? __schedule+0x30b/0x8b0
Mai 29 11:53:24  kernel:  schedule+0x32/0x80
Mai 29 11:53:24  kernel:  schedule_timeout+0x311/0x4a0
Mai 29 11:53:24  kernel:  ? nouveau_fence_is_signaled+0x39/0x40 [nouveau]
Mai 29 11:53:24  kernel:  dma_fence_default_wait+0x204/0x280
Mai 29 11:53:24  kernel:  ? dma_fence_wait_timeout+0x120/0x120
Mai 29 11:53:24  kernel:  dma_fence_wait_timeout+0x105/0x120
Mai 29 11:53:24  kernel:  drm_atomic_helper_wait_for_fences+0x38/0xc0
[drm_kms_helper]
Mai 29 11:53:24  kernel:  nv50_disp_atomic_commit_tail+0x72/0x690 [nouveau]
Mai 29 11:53:24  kernel:  ? finish_task_switch+0x84/0x2d0
Mai 29 11:53:24  kernel:  ? __switch_to_asm+0x35/0x70
Mai 29 11:53:24  kernel:  process_one_work+0x1eb/0x410
Mai 29 11:53:24  kernel:  worker_thread+0x2d/0x3d0
Mai 29 11:53:24  kernel:  ? process_one_work+0x410/0x410
Mai 29 11:53:24  kernel:  kthread+0x112/0x130
Mai 29 11:53:24  kernel:  ? kthread_park+0x80/0x80
Mai 29 11:53:24  kernel:  ret_from_fork+0x35/0x40</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the QA Contact for the bug.</li>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15597225480.203c4C0F0.27836--

--===============1432202257==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1

--===============1432202257==--
