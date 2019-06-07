Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E3292382F1
	for <lists+nouveau@lfdr.de>; Fri,  7 Jun 2019 04:57:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CAE298997A;
	Fri,  7 Jun 2019 02:57:24 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [131.252.210.165])
 by gabe.freedesktop.org (Postfix) with ESMTP id BA371899C7
 for <nouveau@lists.freedesktop.org>; Fri,  7 Jun 2019 02:57:23 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id B4A4672167; Fri,  7 Jun 2019 02:57:23 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: nouveau@lists.freedesktop.org
Date: Fri, 07 Jun 2019 02:57:23 +0000
X-Bugzilla-Reason: QAcontact AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: Mesa
X-Bugzilla-Component: Drivers/DRI/nouveau
X-Bugzilla-Version: git
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: major
X-Bugzilla-Who: randrik@mail.ru
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: nouveau@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-98039-8800-B8Vi7oO3S4@http.bugs.freedesktop.org/>
In-Reply-To: <bug-98039-8800@http.bugs.freedesktop.org/>
References: <bug-98039-8800@http.bugs.freedesktop.org/>
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Subject: [Nouveau] [Bug 98039] KMail crash on starting (nouveau-related)
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
Content-Type: multipart/mixed; boundary="===============0664688855=="
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>


--===============0664688855==
Content-Type: multipart/alternative; boundary="15598762432.bA92c.28751"
Content-Transfer-Encoding: 7bit


--15598762432.bA92c.28751
Date: Fri, 7 Jun 2019 02:57:23 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D98039

--- Comment #16 from Andrew Randrianasulu <randrik@mail.ru> ---
well, may be I should link those here (Ilia, please don't be mad at me):

https://github.com/karolherbst/mesa/tree/mt_fixes_take2 (last update from 13
april 2019)

https://lists.freedesktop.org/archives/nouveau/2019-January/031968.html
([Nouveau] Nouveau channel resets userspace handling) with links to Karol's
github.

Also, not sure if it helped or I was just lucky, but running kernel 5.1.6 w=
ith

CONFIG_IOMMU_DEFAULT_PASSTHROUGH=3Dy

and=20

CONFIG_PREEMPT=3Dy
CONFIG_PREEMPT_COUNT=3Dy
CONFIG_PREEMPT_RCU=3Dy
CONFIG_PREEMPT_NOTIFIERS=3Dy
CONFIG_DEBUG_PREEMPT=3Dy

[low-latency desktop in kconfig]

apparently helped my stability with nouveau and 01:00.0 VGA compatible
controller: NVIDIA Corporation G92 [GeForce 8800 GS] (rev a2)

but I can't be ubersure, may be this is weather, or power (un)stability
..currently uptime is '05:18:58 up 6 days,  1:10,  2 users,  load average:
0.85, 1.04, 1.05' and before this  same machine was staying on and s2ram for
two weeks. So, may be preemtion level actually can play some role? (I once =
run
into bug where nouveau stopped working for older machine if I build my kern=
el
without any preemtion - https://bugs.freedesktop.org/show_bug.cgi?id=3D58615
comment #13)

--=20
You are receiving this mail because:
You are the QA Contact for the bug.
You are the assignee for the bug.=

--15598762432.bA92c.28751
Date: Fri, 7 Jun 2019 02:57:23 +0000
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
   title=3D"NEW - KMail crash on starting (nouveau-related)"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D98039#c16">Commen=
t # 16</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - KMail crash on starting (nouveau-related)"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D98039">bug 98039<=
/a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
randrik&#64;mail.ru" title=3D"Andrew Randrianasulu &lt;randrik&#64;mail.ru&=
gt;"> <span class=3D"fn">Andrew Randrianasulu</span></a>
</span></b>
        <pre>well, may be I should link those here (Ilia, please don't be m=
ad at me):

<a href=3D"https://github.com/karolherbst/mesa/tree/mt_fixes_take2">https:/=
/github.com/karolherbst/mesa/tree/mt_fixes_take2</a> (last update from 13
april 2019)

<a href=3D"https://lists.freedesktop.org/archives/nouveau/2019-January/0319=
68.html">https://lists.freedesktop.org/archives/nouveau/2019-January/031968=
.html</a>
([Nouveau] Nouveau channel resets userspace handling) with links to Karol's
github.

Also, not sure if it helped or I was just lucky, but running kernel 5.1.6 w=
ith

CONFIG_IOMMU_DEFAULT_PASSTHROUGH=3Dy

and=20

CONFIG_PREEMPT=3Dy
CONFIG_PREEMPT_COUNT=3Dy
CONFIG_PREEMPT_RCU=3Dy
CONFIG_PREEMPT_NOTIFIERS=3Dy
CONFIG_DEBUG_PREEMPT=3Dy

[low-latency desktop in kconfig]

apparently helped my stability with nouveau and 01:00.0 VGA compatible
controller: NVIDIA Corporation G92 [GeForce 8800 GS] (rev a2)

but I can't be ubersure, may be this is weather, or power (un)stability
..currently uptime is '05:18:58 up 6 days,  1:10,  2 users,  load average:
0.85, 1.04, 1.05' and before this  same machine was staying on and s2ram for
two weeks. So, may be preemtion level actually can play some role? (I once =
run
into bug where nouveau stopped working for older machine if I build my kern=
el
without any preemtion - <a class=3D"bz_bug_link=20
          bz_status_RESOLVED  bz_closed"
   title=3D"RESOLVED WORKSFORME - [NV43] hangs with direct rendering since =
3.7 rework"
   href=3D"show_bug.cgi?id=3D58615">https://bugs.freedesktop.org/show_bug.c=
gi?id=3D58615</a>
<a href=3D"show_bug.cgi?id=3D98039#c13">comment #13</a>)</pre>
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

--15598762432.bA92c.28751--

--===============0664688855==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1

--===============0664688855==--
