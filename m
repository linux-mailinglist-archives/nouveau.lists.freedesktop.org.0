Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CB86CF321
	for <lists+nouveau@lfdr.de>; Tue,  8 Oct 2019 09:00:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D116289E65;
	Tue,  8 Oct 2019 07:00:40 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [131.252.210.165])
 by gabe.freedesktop.org (Postfix) with ESMTP id 6C6416E1B5
 for <nouveau@lists.freedesktop.org>; Tue,  8 Oct 2019 07:00:39 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 690EF72162; Tue,  8 Oct 2019 07:00:39 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: nouveau@lists.freedesktop.org
Date: Tue, 08 Oct 2019 07:00:37 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: xorg
X-Bugzilla-Component: Driver/nouveau
X-Bugzilla-Version: unspecified
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: critical
X-Bugzilla-Who: acs82@gmx.de
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: high
X-Bugzilla-Assigned-To: nouveau@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-100567-8800-3GBqDSC65g@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============0477707060=="
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>


--===============0477707060==
Content-Type: multipart/alternative; boundary="15705180393.8CcC53C5.20291"
Content-Transfer-Encoding: 7bit


--15705180393.8CcC53C5.20291
Date: Tue, 8 Oct 2019 07:00:39 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D100567

acs82@gmx.de changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |acs82@gmx.de

--- Comment #40 from acs82@gmx.de ---
Same bug here. Seems to happen often with firefox, when opening a link, or =
when
usintg alt+tab to switch to it. So I changed to chromium, which seems to
trigger it at least not that often.

The bug as well recently happend when I switched to eclipse via alt+tab. He=
re a
log:

schwinn@schwinn-desktop:~$ sudo lspci | grep VGA
06:00.0 VGA compatible controller: NVIDIA Corporation GK208B [GeForce GT 71=
0]
(rev a1)

Oct  7 23:13:23 schwinn-desktop kernel: [ 2726.080132] nouveau 0000:06:00.0:
gr: TRAP ch 4 [003fb96000 Xorg[645]]
Oct  7 23:13:23 schwinn-desktop kernel: [ 2726.080146] nouveau 0000:06:00.0:
gr: GPC0/TPC0/MP trap: global 00000004 [MULTIPLE_WARP_ERRORS] warp 3f000
9 [ILLEGAL_INSTR_ENCODING]
Oct  7 23:13:23 schwinn-desktop kernel: [ 2726.080259] nouveau 0000:06:00.0:
gr: TRAP ch 2 [003fbec000 Xorg[645]]
Oct  7 23:13:23 schwinn-desktop kernel: [ 2726.080268] nouveau 0000:06:00.0:
gr: GPC0/TPC0/MP trap: global 00000004 [MULTIPLE_WARP_ERRORS] warp 7000e
[OOR_ADDR]
Oct  7 23:13:23 schwinn-desktop kernel: [ 2726.080277] nouveau 0000:06:00.0:
gr: TRAP ch 2 [003fbec000 Xorg[645]]
Oct  7 23:13:23 schwinn-desktop kernel: [ 2726.080284] nouveau 0000:06:00.0:
gr: GPC0/TPC0/MP trap: global 00000004 [MULTIPLE_WARP_ERRORS] warp 7000e
[OOR_ADDR]
Oct  7 23:13:23 schwinn-desktop kernel: [ 2726.080292] nouveau 0000:06:00.0:
gr: TRAP ch 2 [003fbec000 Xorg[645]]
Oct  7 23:13:23 schwinn-desktop kernel: [ 2726.080299] nouveau 0000:06:00.0:
gr: GPC0/TPC0/MP trap: global 00000004 [MULTIPLE_WARP_ERRORS] warp 10000e
[OOR_ADDR]
Oct  7 23:13:23 schwinn-desktop kernel: [ 2726.080309] nouveau 0000:06:00.0:
gr: TRAP ch 2 [003fbec000 Xorg[645]]
Oct  7 23:13:23 schwinn-desktop kernel: [ 2726.080316] nouveau 0000:06:00.0:
gr: GPC0/TPC0/MP trap: global 00000004 [MULTIPLE_WARP_ERRORS] warp 26000e
[OOR_ADDR]
Oct  7 23:13:28 schwinn-desktop kernel: [ 2730.413036] nouveau 0000:06:00.0:
fifo: SCHED_ERROR 0a [CTXSW_TIMEOUT]
Oct  7 23:13:28 schwinn-desktop kernel: [ 2730.413057] nouveau 0000:06:00.0:
fifo: runlist 0: scheduled for recovery
Oct  7 23:13:28 schwinn-desktop kernel: [ 2730.413077] nouveau 0000:06:00.0:
fifo: channel 2: killed
Oct  7 23:13:28 schwinn-desktop kernel: [ 2730.413086] nouveau 0000:06:00.0:
fifo: engine 6: scheduled for recovery
Oct  7 23:13:28 schwinn-desktop kernel: [ 2730.413091] nouveau 0000:06:00.0:
fifo: engine 0: scheduled for recovery
Oct  7 23:13:28 schwinn-desktop kernel: [ 2730.413160] nouveau 0000:06:00.0:
Xorg[645]: channel 2 killed!
<reboot>
Oct  7 23:14:37 schwinn-desktop kernel: [    0.000000] Linux version
5.2.0-2-amd64 (debian-kernel@lists.debian.org) (gcc version 8.3.0 (Debian
8.3.0-21)) #1 SMP Debian 5.2.9-2 (2019-08-21)

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15705180393.8CcC53C5.20291
Date: Tue, 8 Oct 2019 07:00:39 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

<html>
    <head>
      <base href=3D"https://bugs.freedesktop.org/">
    </head>
    <body><span class=3D"vcard"><a class=3D"email" href=3D"mailto:acs82&#64=
;gmx.de" title=3D"acs82&#64;gmx.de">acs82&#64;gmx.de</a>
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
           <td>acs82&#64;gmx.de
           </td>
         </tr></table>
      <p>
        <div>
            <b><a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - Nouveau system freeze fifo: SCHED_ERROR 0a [CTXSW_TIMEOUT=
]"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D100567#c40">Comme=
nt # 40</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - Nouveau system freeze fifo: SCHED_ERROR 0a [CTXSW_TIMEOUT=
]"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D100567">bug 10056=
7</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
acs82&#64;gmx.de" title=3D"acs82&#64;gmx.de">acs82&#64;gmx.de</a>
</span></b>
        <pre>Same bug here. Seems to happen often with firefox, when openin=
g a link, or when
usintg alt+tab to switch to it. So I changed to chromium, which seems to
trigger it at least not that often.

The bug as well recently happend when I switched to eclipse via alt+tab. He=
re a
log:

schwinn&#64;schwinn-desktop:~$ sudo lspci | grep VGA
06:00.0 VGA compatible controller: NVIDIA Corporation GK208B [GeForce GT 71=
0]
(rev a1)

Oct  7 23:13:23 schwinn-desktop kernel: [ 2726.080132] nouveau 0000:06:00.0:
gr: TRAP ch 4 [003fb96000 Xorg[645]]
Oct  7 23:13:23 schwinn-desktop kernel: [ 2726.080146] nouveau 0000:06:00.0:
gr: GPC0/TPC0/MP trap: global 00000004 [MULTIPLE_WARP_ERRORS] warp 3f000
9 [ILLEGAL_INSTR_ENCODING]
Oct  7 23:13:23 schwinn-desktop kernel: [ 2726.080259] nouveau 0000:06:00.0:
gr: TRAP ch 2 [003fbec000 Xorg[645]]
Oct  7 23:13:23 schwinn-desktop kernel: [ 2726.080268] nouveau 0000:06:00.0:
gr: GPC0/TPC0/MP trap: global 00000004 [MULTIPLE_WARP_ERRORS] warp 7000e
[OOR_ADDR]
Oct  7 23:13:23 schwinn-desktop kernel: [ 2726.080277] nouveau 0000:06:00.0:
gr: TRAP ch 2 [003fbec000 Xorg[645]]
Oct  7 23:13:23 schwinn-desktop kernel: [ 2726.080284] nouveau 0000:06:00.0:
gr: GPC0/TPC0/MP trap: global 00000004 [MULTIPLE_WARP_ERRORS] warp 7000e
[OOR_ADDR]
Oct  7 23:13:23 schwinn-desktop kernel: [ 2726.080292] nouveau 0000:06:00.0:
gr: TRAP ch 2 [003fbec000 Xorg[645]]
Oct  7 23:13:23 schwinn-desktop kernel: [ 2726.080299] nouveau 0000:06:00.0:
gr: GPC0/TPC0/MP trap: global 00000004 [MULTIPLE_WARP_ERRORS] warp 10000e
[OOR_ADDR]
Oct  7 23:13:23 schwinn-desktop kernel: [ 2726.080309] nouveau 0000:06:00.0:
gr: TRAP ch 2 [003fbec000 Xorg[645]]
Oct  7 23:13:23 schwinn-desktop kernel: [ 2726.080316] nouveau 0000:06:00.0:
gr: GPC0/TPC0/MP trap: global 00000004 [MULTIPLE_WARP_ERRORS] warp 26000e
[OOR_ADDR]
Oct  7 23:13:28 schwinn-desktop kernel: [ 2730.413036] nouveau 0000:06:00.0:
fifo: SCHED_ERROR 0a [CTXSW_TIMEOUT]
Oct  7 23:13:28 schwinn-desktop kernel: [ 2730.413057] nouveau 0000:06:00.0:
fifo: runlist 0: scheduled for recovery
Oct  7 23:13:28 schwinn-desktop kernel: [ 2730.413077] nouveau 0000:06:00.0:
fifo: channel 2: killed
Oct  7 23:13:28 schwinn-desktop kernel: [ 2730.413086] nouveau 0000:06:00.0:
fifo: engine 6: scheduled for recovery
Oct  7 23:13:28 schwinn-desktop kernel: [ 2730.413091] nouveau 0000:06:00.0:
fifo: engine 0: scheduled for recovery
Oct  7 23:13:28 schwinn-desktop kernel: [ 2730.413160] nouveau 0000:06:00.0:
Xorg[645]: channel 2 killed!
&lt;reboot&gt;
Oct  7 23:14:37 schwinn-desktop kernel: [    0.000000] Linux version
5.2.0-2-amd64 (<a href=3D"mailto:debian-kernel&#64;lists.debian.org">debian=
-kernel&#64;lists.debian.org</a>) (gcc version 8.3.0 (Debian
8.3.0-21)) #1 SMP Debian 5.2.9-2 (2019-08-21)</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15705180393.8CcC53C5.20291--

--===============0477707060==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1

--===============0477707060==--
