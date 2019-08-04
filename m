Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DC4A5808DF
	for <lists+nouveau@lfdr.de>; Sun,  4 Aug 2019 04:19:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 909766E193;
	Sun,  4 Aug 2019 02:19:24 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [131.252.210.165])
 by gabe.freedesktop.org (Postfix) with ESMTP id 0B08E6E193
 for <nouveau@lists.freedesktop.org>; Sun,  4 Aug 2019 02:19:23 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 0329A72167; Sun,  4 Aug 2019 02:19:22 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: nouveau@lists.freedesktop.org
Date: Sun, 04 Aug 2019 02:19:23 +0000
X-Bugzilla-Reason: AssignedTo QAcontact
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: Mesa
X-Bugzilla-Component: Drivers/DRI/nouveau
X-Bugzilla-Version: git
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: randrik@mail.ru
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: nouveau@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-111292-8800-yIpVfuYDJS@http.bugs.freedesktop.org/>
In-Reply-To: <bug-111292-8800@http.bugs.freedesktop.org/>
References: <bug-111292-8800@http.bugs.freedesktop.org/>
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Subject: [Nouveau] [Bug 111292] Advanced Lighting option in Firestorm Viewer
 makes some objects black on nv92 card
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
Content-Type: multipart/mixed; boundary="===============0459512555=="
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>


--===============0459512555==
Content-Type: multipart/alternative; boundary="15648851620.20Fc1F.21785"
Content-Transfer-Encoding: 7bit


--15648851620.20Fc1F.21785
Date: Sun, 4 Aug 2019 02:19:22 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D111292

--- Comment #10 from Andrew Randrianasulu <randrik@mail.ru> ---
(In reply to Ilia Mirkin from comment #9)
> Andrew - do you see a bunch of "nv50cal_space: -16" errors in dmesg when
> this happens? I get a lot of submit errors right when the black background
> appears, so I think it may be related. But I also have a much lower-end G=
84
> plugged in right now.

No, or at least they not in dmesg:  dmesg | grep nv50cal_space returns noth=
ing.

--=20
You are receiving this mail because:
You are the assignee for the bug.
You are the QA Contact for the bug.=

--15648851620.20Fc1F.21785
Date: Sun, 4 Aug 2019 02:19:22 +0000
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
   title=3D"NEW - Advanced Lighting option in Firestorm Viewer makes some o=
bjects black on nv92 card"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111292#c10">Comme=
nt # 10</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - Advanced Lighting option in Firestorm Viewer makes some o=
bjects black on nv92 card"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111292">bug 11129=
2</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
randrik&#64;mail.ru" title=3D"Andrew Randrianasulu &lt;randrik&#64;mail.ru&=
gt;"> <span class=3D"fn">Andrew Randrianasulu</span></a>
</span></b>
        <pre>(In reply to Ilia Mirkin from <a href=3D"show_bug.cgi?id=3D111=
292#c9">comment #9</a>)
<span class=3D"quote">&gt; Andrew - do you see a bunch of &quot;nv50cal_spa=
ce: -16&quot; errors in dmesg when
&gt; this happens? I get a lot of submit errors right when the black backgr=
ound
&gt; appears, so I think it may be related. But I also have a much lower-en=
d G84
&gt; plugged in right now.</span >

No, or at least they not in dmesg:  dmesg | grep nv50cal_space returns noth=
ing.</pre>
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

--15648851620.20Fc1F.21785--

--===============0459512555==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1

--===============0459512555==--
