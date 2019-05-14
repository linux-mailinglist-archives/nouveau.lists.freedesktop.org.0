Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 46CA01CAE7
	for <lists+nouveau@lfdr.de>; Tue, 14 May 2019 16:52:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2BE8E89296;
	Tue, 14 May 2019 14:52:44 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [131.252.210.165])
 by gabe.freedesktop.org (Postfix) with ESMTP id 585AD89296
 for <nouveau@lists.freedesktop.org>; Tue, 14 May 2019 14:52:42 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 4D1A1721CD; Tue, 14 May 2019 14:52:42 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: nouveau@lists.freedesktop.org
Date: Tue, 14 May 2019 14:52:42 +0000
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
Message-ID: <bug-110572-8800-As9zjY2e6V@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============0437405444=="
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>


--===============0437405444==
Content-Type: multipart/alternative; boundary="15578455620.816b8e5.9022"
Content-Transfer-Encoding: 7bit


--15578455620.816b8e5.9022
Date: Tue, 14 May 2019 14:52:42 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D110572

--- Comment #8 from Linux Freak <Linuxfreak@gmx.at> ---
QUESTION: fbcon

Is nouveaufb the fbcon module?

sudo dmesg | grep nouveaufb

[   20.165256] fb0: switching to nouveaufb from VESA VGA
[   20.468352] fbcon: nouveaufb (fb0) is primary device
[   20.510301] nouveau 0000:08:00.0: fb0: nouveaufb frame buffer device

the error on
journalctl -p 3 -b -0
kernel: nouveau 0000:08:00.0: bios: OOB 1 d7500086 d7500086
has the same address as nouveaufb... !


*** Maybe the nouveau error is due to the missing fbcon? ***


MANJARO has in linux50 the following config:

CONFIG_FRAMEBUFFER_CONSOLE=3Dy
CONFIG_FRAMEBUFFER_CONSOLE_DETECT_PRIMARY=3Dy
CONFIG_FRAMEBUFFER_CONSOLE_ROTATION=3Dy
CONFIG_FRAMEBUFFER_CONSOLE_DEFERRED_TAKEOVER=3Dy

In older kernels different config is available, but all of them certainly h=
ave
CONFIG_FRAMEBUFFER_CONSOLE enabled.

--=20
You are receiving this mail because:
You are the QA Contact for the bug.
You are the assignee for the bug.=

--15578455620.816b8e5.9022
Date: Tue, 14 May 2019 14:52:42 +0000
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
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110572#c8">Commen=
t # 8</a>
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
        <pre>QUESTION: fbcon

Is nouveaufb the fbcon module?

sudo dmesg | grep nouveaufb

[   20.165256] fb0: switching to nouveaufb from VESA VGA
[   20.468352] fbcon: nouveaufb (fb0) is primary device
[   20.510301] nouveau 0000:08:00.0: fb0: nouveaufb frame buffer device

the error on
journalctl -p 3 -b -0
kernel: nouveau 0000:08:00.0: bios: OOB 1 d7500086 d7500086
has the same address as nouveaufb... !


*** Maybe the nouveau error is due to the missing fbcon? ***


MANJARO has in linux50 the following config:

CONFIG_FRAMEBUFFER_CONSOLE=3Dy
CONFIG_FRAMEBUFFER_CONSOLE_DETECT_PRIMARY=3Dy
CONFIG_FRAMEBUFFER_CONSOLE_ROTATION=3Dy
CONFIG_FRAMEBUFFER_CONSOLE_DEFERRED_TAKEOVER=3Dy

In older kernels different config is available, but all of them certainly h=
ave
CONFIG_FRAMEBUFFER_CONSOLE enabled.</pre>
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

--15578455620.816b8e5.9022--

--===============0437405444==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1

--===============0437405444==--
