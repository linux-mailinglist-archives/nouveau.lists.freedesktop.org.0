Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B5CDC29327
	for <lists+nouveau@lfdr.de>; Fri, 24 May 2019 10:32:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 25F7A6E040;
	Fri, 24 May 2019 08:32:24 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [131.252.210.165])
 by gabe.freedesktop.org (Postfix) with ESMTP id 4E2C36E040
 for <nouveau@lists.freedesktop.org>; Fri, 24 May 2019 08:32:23 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 45CFA72167; Fri, 24 May 2019 08:32:23 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: nouveau@lists.freedesktop.org
Date: Fri, 24 May 2019 08:32:23 +0000
X-Bugzilla-Reason: AssignedTo QAcontact
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
Message-ID: <bug-110572-8800-Zr8l2df5jD@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============1174723534=="
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>


--===============1174723534==
Content-Type: multipart/alternative; boundary="15586867430.2CD134.1664"
Content-Transfer-Encoding: 7bit


--15586867430.2CD134.1664
Date: Fri, 24 May 2019 08:32:23 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D110572

--- Comment #16 from Linux Freak <Linuxfreak@gmx.at> ---
Created attachment 144339
  --> https://bugs.freedesktop.org/attachment.cgi?id=3D144339&action=3Dedit
crash 10

Mai 19 15:13:49  kernel: nouveau 0000:08:00.0: mmu: ce0 mmu invalidate time=
out
Mai 19 15:13:53  kernel: nouveau 0000:08:00.0: gr: PGRAPH TLB flush idle
timeout fail
Mai 19 15:13:53  kernel: nouveau 0000:08:00.0: gr: PGRAPH_STATUS 00b00103 [=
BUSY
DISPATCH CTXPROG TPC_PROP TPC_TEX TPC_MP]
Mai 19 15:13:53  kernel: nouveau 0000:08:00.0: gr: PGRAPH_VSTATUS0: 0000000=
0 []
Mai 19 15:13:53  kernel: nouveau 0000:08:00.0: gr: PGRAPH_VSTATUS1: 00005068
[TPC_TEX]
Mai 19 15:13:53  kernel: nouveau 0000:08:00.0: gr: PGRAPH_VSTATUS2: 0000000=
0 []
Mai 19 15:16:18  kernel: INFO: task kworker/u8:7:219 blocked for more than =
120
seconds.
Mai 19 15:16:18  kernel:       Tainted: G        W         5.0.15-1-MANJARO=
 #1
Mai 19 15:16:18  kernel: "echo 0 > /proc/sys/kernel/hung_task_timeout_secs"
disables this message.
Mai 19 15:18:21  kernel: INFO: task kworker/u8:7:219 blocked for more than =
120
seconds.
Mai 19 15:18:21  kernel:       Tainted: G        W         5.0.15-1-MANJARO=
 #1
Mai 19 15:18:21  kernel: "echo 0 > /proc/sys/kernel/hung_task_timeout_secs"
disables this message.
Mai 19 15:20:24  kernel: INFO: task kworker/u8:7:219 blocked for more than =
120
seconds.
Mai 19 15:20:24  kernel:       Tainted: G        W         5.0.15-1-MANJARO=
 #1
Mai 19 15:20:24  kernel: "echo 0 > /proc/sys/kernel/hung_task_timeout_secs"
disables this message.
Mai 19 15:22:26  kernel: INFO: task kworker/u8:7:219 blocked for more than =
120
seconds.
Mai 19 15:22:27  kernel:       Tainted: G        W         5.0.15-1-MANJARO=
 #1
Mai 19 15:22:27  kernel: "echo 0 > /proc/sys/kernel/hung_task_timeout_secs"
disables this message.
Mai 19 15:24:29  kernel: INFO: task kworker/u8:7:219 blocked for more than =
120
seconds.
Mai 19 15:24:29  kernel:       Tainted: G        W         5.0.15-1-MANJARO=
 #1
Mai 19 15:24:29  kernel: "echo 0 > /proc/sys/kernel/hung_task_timeout_secs"
disables this message.
Mai 19 15:26:32  kernel: INFO: task kworker/u8:7:219 blocked for more than =
120
seconds.
Mai 19 15:26:32  kernel:       Tainted: G        W         5.0.15-1-MANJARO=
 #1
Mai 19 15:26:32  kernel: "echo 0 > /proc/sys/kernel/hung_task_timeout_secs"
disables this message.
Mai 19 15:28:35  kernel: INFO: task kworker/u8:7:219 blocked for more than =
120
seconds.
Mai 19 15:28:35  kernel:       Tainted: G        W         5.0.15-1-MANJARO=
 #1
Mai 19 15:28:35  kernel: "echo 0 > /proc/sys/kernel/hung_task_timeout_secs"
disables this message.
Mai 19 15:30:38  kernel: INFO: task kworker/u8:7:219 blocked for more than =
120
seconds.
Mai 19 15:30:38  kernel:       Tainted: G        W         5.0.15-1-MANJARO=
 #1
Mai 19 15:30:38  kernel: "echo 0 > /proc/sys/kernel/hung_task_timeout_secs"
disables this message.
Mai 19 15:32:41  kernel: INFO: task kworker/u8:7:219 blocked for more than =
120
seconds.
Mai 19 15:32:41  kernel:       Tainted: G        W         5.0.15-1-MANJARO=
 #1
Mai 19 15:32:41  kernel: "echo 0 > /proc/sys/kernel/hung_task_timeout_secs"
disables this message.
Mai 19 15:34:44  kernel: INFO: task kworker/u8:7:219 blocked for more than =
120
seconds.
Mai 19 15:34:44  kernel:       Tainted: G        W         5.0.15-1-MANJARO=
 #1
Mai 19 15:34:44  kernel: "echo 0 > /proc/sys/kernel/hung_task_timeout_secs"
disables this message.

--=20
You are receiving this mail because:
You are the assignee for the bug.
You are the QA Contact for the bug.=

--15586867430.2CD134.1664
Date: Fri, 24 May 2019 08:32:23 +0000
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
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110572#c16">Comme=
nt # 16</a>
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
        <pre>Created <span class=3D""><a href=3D"attachment.cgi?id=3D144339=
" name=3D"attach_144339" title=3D"crash 10">attachment 144339</a> <a href=
=3D"attachment.cgi?id=3D144339&amp;action=3Dedit" title=3D"crash 10">[detai=
ls]</a></span>
crash 10

Mai 19 15:13:49  kernel: nouveau 0000:08:00.0: mmu: ce0 mmu invalidate time=
out
Mai 19 15:13:53  kernel: nouveau 0000:08:00.0: gr: PGRAPH TLB flush idle
timeout fail
Mai 19 15:13:53  kernel: nouveau 0000:08:00.0: gr: PGRAPH_STATUS 00b00103 [=
BUSY
DISPATCH CTXPROG TPC_PROP TPC_TEX TPC_MP]
Mai 19 15:13:53  kernel: nouveau 0000:08:00.0: gr: PGRAPH_VSTATUS0: 0000000=
0 []
Mai 19 15:13:53  kernel: nouveau 0000:08:00.0: gr: PGRAPH_VSTATUS1: 00005068
[TPC_TEX]
Mai 19 15:13:53  kernel: nouveau 0000:08:00.0: gr: PGRAPH_VSTATUS2: 0000000=
0 []
Mai 19 15:16:18  kernel: INFO: task kworker/u8:7:219 blocked for more than =
120
seconds.
Mai 19 15:16:18  kernel:       Tainted: G        W         5.0.15-1-MANJARO=
 #1
Mai 19 15:16:18  kernel: &quot;echo 0 &gt; /proc/sys/kernel/hung_task_timeo=
ut_secs&quot;
disables this message.
Mai 19 15:18:21  kernel: INFO: task kworker/u8:7:219 blocked for more than =
120
seconds.
Mai 19 15:18:21  kernel:       Tainted: G        W         5.0.15-1-MANJARO=
 #1
Mai 19 15:18:21  kernel: &quot;echo 0 &gt; /proc/sys/kernel/hung_task_timeo=
ut_secs&quot;
disables this message.
Mai 19 15:20:24  kernel: INFO: task kworker/u8:7:219 blocked for more than =
120
seconds.
Mai 19 15:20:24  kernel:       Tainted: G        W         5.0.15-1-MANJARO=
 #1
Mai 19 15:20:24  kernel: &quot;echo 0 &gt; /proc/sys/kernel/hung_task_timeo=
ut_secs&quot;
disables this message.
Mai 19 15:22:26  kernel: INFO: task kworker/u8:7:219 blocked for more than =
120
seconds.
Mai 19 15:22:27  kernel:       Tainted: G        W         5.0.15-1-MANJARO=
 #1
Mai 19 15:22:27  kernel: &quot;echo 0 &gt; /proc/sys/kernel/hung_task_timeo=
ut_secs&quot;
disables this message.
Mai 19 15:24:29  kernel: INFO: task kworker/u8:7:219 blocked for more than =
120
seconds.
Mai 19 15:24:29  kernel:       Tainted: G        W         5.0.15-1-MANJARO=
 #1
Mai 19 15:24:29  kernel: &quot;echo 0 &gt; /proc/sys/kernel/hung_task_timeo=
ut_secs&quot;
disables this message.
Mai 19 15:26:32  kernel: INFO: task kworker/u8:7:219 blocked for more than =
120
seconds.
Mai 19 15:26:32  kernel:       Tainted: G        W         5.0.15-1-MANJARO=
 #1
Mai 19 15:26:32  kernel: &quot;echo 0 &gt; /proc/sys/kernel/hung_task_timeo=
ut_secs&quot;
disables this message.
Mai 19 15:28:35  kernel: INFO: task kworker/u8:7:219 blocked for more than =
120
seconds.
Mai 19 15:28:35  kernel:       Tainted: G        W         5.0.15-1-MANJARO=
 #1
Mai 19 15:28:35  kernel: &quot;echo 0 &gt; /proc/sys/kernel/hung_task_timeo=
ut_secs&quot;
disables this message.
Mai 19 15:30:38  kernel: INFO: task kworker/u8:7:219 blocked for more than =
120
seconds.
Mai 19 15:30:38  kernel:       Tainted: G        W         5.0.15-1-MANJARO=
 #1
Mai 19 15:30:38  kernel: &quot;echo 0 &gt; /proc/sys/kernel/hung_task_timeo=
ut_secs&quot;
disables this message.
Mai 19 15:32:41  kernel: INFO: task kworker/u8:7:219 blocked for more than =
120
seconds.
Mai 19 15:32:41  kernel:       Tainted: G        W         5.0.15-1-MANJARO=
 #1
Mai 19 15:32:41  kernel: &quot;echo 0 &gt; /proc/sys/kernel/hung_task_timeo=
ut_secs&quot;
disables this message.
Mai 19 15:34:44  kernel: INFO: task kworker/u8:7:219 blocked for more than =
120
seconds.
Mai 19 15:34:44  kernel:       Tainted: G        W         5.0.15-1-MANJARO=
 #1
Mai 19 15:34:44  kernel: &quot;echo 0 &gt; /proc/sys/kernel/hung_task_timeo=
ut_secs&quot;
disables this message.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
          <li>You are the QA Contact for the bug.</li>
      </ul>
    </body>
</html>=

--15586867430.2CD134.1664--

--===============1174723534==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1

--===============1174723534==--
