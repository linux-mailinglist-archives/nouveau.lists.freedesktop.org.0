Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3ADA0AA660
	for <lists+nouveau@lfdr.de>; Thu,  5 Sep 2019 16:48:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 173CA6E112;
	Thu,  5 Sep 2019 14:48:06 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [131.252.210.165])
 by gabe.freedesktop.org (Postfix) with ESMTP id 1AAAF6E113
 for <nouveau@lists.freedesktop.org>; Thu,  5 Sep 2019 14:48:04 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 16D0C72161; Thu,  5 Sep 2019 14:48:04 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: nouveau@lists.freedesktop.org
Date: Thu, 05 Sep 2019 14:48:03 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: xorg
X-Bugzilla-Component: Driver/nouveau
X-Bugzilla-Version: unspecified
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: critical
X-Bugzilla-Who: walicki@us.ibm.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: high
X-Bugzilla-Assigned-To: nouveau@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-100567-8800-qwAnE5mKda@http.bugs.freedesktop.org/>
In-Reply-To: <bug-100567-8800@http.bugs.freedesktop.org/>
References: <bug-100567-8800@http.bugs.freedesktop.org/>
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Subject: [Nouveau] [Bug 100567] Nouveau system freeze fifo: SCHED_ERROR 0a
 [CTXSW_TIMEOUT]
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
Content-Type: multipart/mixed; boundary="===============0294196047=="
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>


--===============0294196047==
Content-Type: multipart/alternative; boundary="15676948840.F9AE.12436"
Content-Transfer-Encoding: 7bit


--15676948840.F9AE.12436
Date: Thu, 5 Sep 2019 14:48:04 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D100567

John Walicki <walicki@us.ibm.com> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |walicki@us.ibm.com

--- Comment #38 from John Walicki <walicki@us.ibm.com> ---
The nouveau driver on my ThinkPad P50 (running RHEL 7.7 with a
5.2.11-1.el7.elrepo.x86_64 kernel) just hung up with this same error.

Sep  5 09:04:48 jaw-p50rhel7 kernel: nouveau 0000:01:00.0: fifo: SCHED_ERRO=
R 0a
[CTXSW_TIMEOUT]
Sep  5 09:04:48 jaw-p50rhel7 kernel: nouveau 0000:01:00.0: fifo: runlist 0:
scheduled for recovery
Sep  5 09:04:48 jaw-p50rhel7 kernel: nouveau 0000:01:00.0: fifo: channel 2:
killed
Sep  5 09:04:48 jaw-p50rhel7 kernel: nouveau 0000:01:00.0: fifo: engine 0:
scheduled for recovery
Sep  5 09:04:48 jaw-p50rhel7 kernel: nouveau 0000:01:00.0: X[5775]: channel=
 2
killed!

What is possibly interesting is that in /var/log/Xorg.0.log
there was a mouse event that matches exactly with the timing of the nouveau
errors.

[150241.393] AUDIT: Thu Sep  5 09:04:19 2019: 5775: client 43 disconnected
[150241.396] AUDIT: Thu Sep  5 09:04:19 2019: 5775: client 44 disconnected
[150270.473] (II) event8  - Logitech USB Receiver: SYN_DROPPED event - some
input events have been lost.

The [bracket] is a timestamp which indicates the time since the system last
booted, in seconds. So 150270 is 29 seconds after the 09:04:19 timestamped
line.=20
09:04:19 + 29 seconds is 09:04:48
The nouveau driver hung at that time (see /var/log/messages timestamp above)
Not certain if that was cause or effect of the video driver hang.

I was able to ssh into my system to reboot.

$ lspci -vv -s 01:00.0
01:00.0 VGA compatible controller: NVIDIA Corporation GM107GLM [Quadro M100=
0M]
(rev a2) (prog-if 00 [VGA controller])
        Subsystem: Lenovo Device 2230
        Control: I/O+ Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr-
Stepping- SERR- FastB2B- DisINTx+
        Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=3Dfast >TAbort- <T=
Abort-
<MAbort- >SERR- <PERR- INTx-
        Latency: 0
        Interrupt: pin A routed to IRQ 129
        Region 0: Memory at b2000000 (32-bit, non-prefetchable) [size=3D16M]
        Region 1: Memory at a0000000 (64-bit, prefetchable) [size=3D256M]
        Region 3: Memory at b0000000 (64-bit, prefetchable) [size=3D32M]
        Region 5: I/O ports at 4000 [size=3D128]
        Expansion ROM at 000c0000 [disabled] [size=3D128K]
        Capabilities: <access denied>
        Kernel driver in use: nouveau
        Kernel modules: nouveau

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15676948840.F9AE.12436
Date: Thu, 5 Sep 2019 14:48:04 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

<html>
    <head>
      <base href=3D"https://bugs.freedesktop.org/">
    </head>
    <body><span class=3D"vcard"><a class=3D"email" href=3D"mailto:walicki&#=
64;us.ibm.com" title=3D"John Walicki &lt;walicki&#64;us.ibm.com&gt;"> <span=
 class=3D"fn">John Walicki</span></a>
</span> changed
          <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - Nouveau system freeze fifo: SCHED_ERROR 0a [CTXSW_TIMEOUT=
]"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D100567">bug 10056=
7</a>
          <br>
             <table border=3D"1" cellspacing=3D"0" cellpadding=3D"8">
          <tr>
            <th>What</th>
            <th>Removed</th>
            <th>Added</th>
          </tr>

         <tr>
           <td style=3D"text-align:right;">CC</td>
           <td>
               &nbsp;
           </td>
           <td>walicki&#64;us.ibm.com
           </td>
         </tr></table>
      <p>
        <div>
            <b><a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - Nouveau system freeze fifo: SCHED_ERROR 0a [CTXSW_TIMEOUT=
]"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D100567#c38">Comme=
nt # 38</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - Nouveau system freeze fifo: SCHED_ERROR 0a [CTXSW_TIMEOUT=
]"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D100567">bug 10056=
7</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
walicki&#64;us.ibm.com" title=3D"John Walicki &lt;walicki&#64;us.ibm.com&gt=
;"> <span class=3D"fn">John Walicki</span></a>
</span></b>
        <pre>The nouveau driver on my ThinkPad P50 (running RHEL 7.7 with a
5.2.11-1.el7.elrepo.x86_64 kernel) just hung up with this same error.

Sep  5 09:04:48 jaw-p50rhel7 kernel: nouveau 0000:01:00.0: fifo: SCHED_ERRO=
R 0a
[CTXSW_TIMEOUT]
Sep  5 09:04:48 jaw-p50rhel7 kernel: nouveau 0000:01:00.0: fifo: runlist 0:
scheduled for recovery
Sep  5 09:04:48 jaw-p50rhel7 kernel: nouveau 0000:01:00.0: fifo: channel 2:
killed
Sep  5 09:04:48 jaw-p50rhel7 kernel: nouveau 0000:01:00.0: fifo: engine 0:
scheduled for recovery
Sep  5 09:04:48 jaw-p50rhel7 kernel: nouveau 0000:01:00.0: X[5775]: channel=
 2
killed!

What is possibly interesting is that in /var/log/Xorg.0.log
there was a mouse event that matches exactly with the timing of the nouveau
errors.

[150241.393] AUDIT: Thu Sep  5 09:04:19 2019: 5775: client 43 disconnected
[150241.396] AUDIT: Thu Sep  5 09:04:19 2019: 5775: client 44 disconnected
[150270.473] (II) event8  - Logitech USB Receiver: SYN_DROPPED event - some
input events have been lost.

The [bracket] is a timestamp which indicates the time since the system last
booted, in seconds. So 150270 is 29 seconds after the 09:04:19 timestamped
line.=20
09:04:19 + 29 seconds is 09:04:48
The nouveau driver hung at that time (see /var/log/messages timestamp above)
Not certain if that was cause or effect of the video driver hang.

I was able to ssh into my system to reboot.

$ lspci -vv -s 01:00.0
01:00.0 VGA compatible controller: NVIDIA Corporation GM107GLM [Quadro M100=
0M]
(rev a2) (prog-if 00 [VGA controller])
        Subsystem: Lenovo Device 2230
        Control: I/O+ Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr-
Stepping- SERR- FastB2B- DisINTx+
        Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=3Dfast &gt;TAbort-=
 &lt;TAbort-
&lt;MAbort- &gt;SERR- &lt;PERR- INTx-
        Latency: 0
        Interrupt: pin A routed to IRQ 129
        Region 0: Memory at b2000000 (32-bit, non-prefetchable) [size=3D16M]
        Region 1: Memory at a0000000 (64-bit, prefetchable) [size=3D256M]
        Region 3: Memory at b0000000 (64-bit, prefetchable) [size=3D32M]
        Region 5: I/O ports at 4000 [size=3D128]
        Expansion ROM at 000c0000 [disabled] [size=3D128K]
        Capabilities: &lt;access denied&gt;
        Kernel driver in use: nouveau
        Kernel modules: nouveau</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15676948840.F9AE.12436--

--===============0294196047==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1

--===============0294196047==--
