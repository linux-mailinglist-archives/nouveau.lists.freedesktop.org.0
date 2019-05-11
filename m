Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A74971A917
	for <lists+nouveau@lfdr.de>; Sat, 11 May 2019 20:42:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A69E189A16;
	Sat, 11 May 2019 18:42:34 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [131.252.210.165])
 by gabe.freedesktop.org (Postfix) with ESMTP id 426ED89A16
 for <nouveau@lists.freedesktop.org>; Sat, 11 May 2019 18:42:33 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 3662D721CD; Sat, 11 May 2019 18:42:33 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: nouveau@lists.freedesktop.org
Date: Sat, 11 May 2019 18:42:33 +0000
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
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-110572-8800-cZL8NIEUvk@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============0584986642=="
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>


--===============0584986642==
Content-Type: multipart/alternative; boundary="15576001530.c2a0.22354"
Content-Transfer-Encoding: 7bit


--15576001530.c2a0.22354
Date: Sat, 11 May 2019 18:42:33 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D110572

--- Comment #5 from Linux Freak <Linuxfreak@gmx.at> ---
so i do edit
/etc/modules-load.d/modules.conf as fbcon
and reboot..

hmm do i need to install fbcon?

journalctl -p 3 -b -0

Mai 11 20:38:44  systemd-modules-load[273]: Failed to find module 'fbcon'
Mai 11 20:38:49  systemd-modules-load[358]: Failed to find module 'fbcon'
Mai 11 20:38:49  systemd[1]: Failed to start Load Kernel Modules.
Mai 11 20:38:49  systemd-modules-load[364]: Failed to find module 'fbcon'
Mai 11 20:38:49  systemd[1]: Failed to start Load Kernel Modules.
Mai 11 20:38:50  kernel: nouveau 0000:08:00.0: bios: OOB 1 d7500086 d7500086
Mai 11 20:39:16  colord-sane[464]: io/hpmud/pp.c 627: unable to read device=
-i

--=20
You are receiving this mail because:
You are the QA Contact for the bug.
You are the assignee for the bug.=

--15576001530.c2a0.22354
Date: Sat, 11 May 2019 18:42:33 +0000
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
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110572#c5">Commen=
t # 5</a>
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
        <pre>so i do edit
/etc/modules-load.d/modules.conf as fbcon
and reboot..

hmm do i need to install fbcon?

journalctl -p 3 -b -0

Mai 11 20:38:44  systemd-modules-load[273]: Failed to find module 'fbcon'
Mai 11 20:38:49  systemd-modules-load[358]: Failed to find module 'fbcon'
Mai 11 20:38:49  systemd[1]: Failed to start Load Kernel Modules.
Mai 11 20:38:49  systemd-modules-load[364]: Failed to find module 'fbcon'
Mai 11 20:38:49  systemd[1]: Failed to start Load Kernel Modules.
Mai 11 20:38:50  kernel: nouveau 0000:08:00.0: bios: OOB 1 d7500086 d7500086
Mai 11 20:39:16  colord-sane[464]: io/hpmud/pp.c 627: unable to read device=
-i</pre>
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

--15576001530.c2a0.22354--

--===============0584986642==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1

--===============0584986642==--
