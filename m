Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EBC081CAEC
	for <lists+nouveau@lfdr.de>; Tue, 14 May 2019 16:54:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8166A892B5;
	Tue, 14 May 2019 14:53:59 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [131.252.210.165])
 by gabe.freedesktop.org (Postfix) with ESMTP id 67C33892B5
 for <nouveau@lists.freedesktop.org>; Tue, 14 May 2019 14:53:58 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 64271721CD; Tue, 14 May 2019 14:53:58 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: nouveau@lists.freedesktop.org
Date: Tue, 14 May 2019 14:53:58 +0000
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
Message-ID: <bug-110572-8800-meyLvEj4NO@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============1280551811=="
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>


--===============1280551811==
Content-Type: multipart/alternative; boundary="15578456380.8D59B32FE.9392"
Content-Transfer-Encoding: 7bit


--15578456380.8D59B32FE.9392
Date: Tue, 14 May 2019 14:53:58 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D110572

--- Comment #9 from Linux Freak <Linuxfreak@gmx.at> ---
another crash...

journalctl -p 3 -b -1

Mai 14 15:48:48  kernel: nouveau 0000:08:00.0: bios: OOB 1 d7500086 d7500086
Mai 14 15:49:16  colord-sane[456]: io/hpmud/pp.c 627: unable to read device=
-id
ret=3D-1
Mai 14 15:56:10  kernel: nouveau 0000:08:00.0: mmu: ce0 mmu invalidate time=
out
Mai 14 15:56:10  kernel: nouveau 0000:08:00.0: gr: PGRAPH TLB flush idle
timeout fail
Mai 14 15:56:10  kernel: nouveau 0000:08:00.0: gr: PGRAPH_STATUS ffffffff [=
BUSY
DISPATCH UNK2 UNK3 UNK4 UNK5 M2MF UNK7 CTXPROG VFETCH CCACHE_PREGEOM
STRMOUT_VATTR_POSTGEOM VCLIP RATTR>
Mai 14 15:56:10  kernel: nouveau 0000:08:00.0: gr: PGRAPH_VSTATUS0: fffffff=
f []
Mai 14 15:56:10  kernel: nouveau 0000:08:00.0: gr: PGRAPH_VSTATUS1: 0000106d
[TPC_TEX TPC_MP]
Mai 14 15:56:10  kernel: nouveau 0000:08:00.0: gr: PGRAPH_VSTATUS2: 00148000
[ENG2D]

--=20
You are receiving this mail because:
You are the QA Contact for the bug.
You are the assignee for the bug.=

--15578456380.8D59B32FE.9392
Date: Tue, 14 May 2019 14:53:58 +0000
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
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110572#c9">Commen=
t # 9</a>
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
        <pre>another crash...

journalctl -p 3 -b -1

Mai 14 15:48:48  kernel: nouveau 0000:08:00.0: bios: OOB 1 d7500086 d7500086
Mai 14 15:49:16  colord-sane[456]: io/hpmud/pp.c 627: unable to read device=
-id
ret=3D-1
Mai 14 15:56:10  kernel: nouveau 0000:08:00.0: mmu: ce0 mmu invalidate time=
out
Mai 14 15:56:10  kernel: nouveau 0000:08:00.0: gr: PGRAPH TLB flush idle
timeout fail
Mai 14 15:56:10  kernel: nouveau 0000:08:00.0: gr: PGRAPH_STATUS ffffffff [=
BUSY
DISPATCH UNK2 UNK3 UNK4 UNK5 M2MF UNK7 CTXPROG VFETCH CCACHE_PREGEOM
STRMOUT_VATTR_POSTGEOM VCLIP RATTR&gt;
Mai 14 15:56:10  kernel: nouveau 0000:08:00.0: gr: PGRAPH_VSTATUS0: fffffff=
f []
Mai 14 15:56:10  kernel: nouveau 0000:08:00.0: gr: PGRAPH_VSTATUS1: 0000106d
[TPC_TEX TPC_MP]
Mai 14 15:56:10  kernel: nouveau 0000:08:00.0: gr: PGRAPH_VSTATUS2: 00148000
[ENG2D]</pre>
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

--15578456380.8D59B32FE.9392--

--===============1280551811==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1

--===============1280551811==--
