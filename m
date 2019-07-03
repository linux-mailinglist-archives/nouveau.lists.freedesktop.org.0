Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BAB25D95D
	for <lists+nouveau@lfdr.de>; Wed,  3 Jul 2019 02:41:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2146A6E0B7;
	Wed,  3 Jul 2019 00:41:50 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [131.252.210.165])
 by gabe.freedesktop.org (Postfix) with ESMTP id 628AD6E0B7
 for <nouveau@lists.freedesktop.org>; Wed,  3 Jul 2019 00:41:49 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 5F1BB72167; Wed,  3 Jul 2019 00:41:49 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: nouveau@lists.freedesktop.org
Date: Wed, 03 Jul 2019 00:41:49 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: xorg
X-Bugzilla-Component: Driver/nouveau
X-Bugzilla-Version: git
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: imirkin@alum.mit.edu
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: nouveau@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-111044-8800-ygNXJV3wJT@http.bugs.freedesktop.org/>
In-Reply-To: <bug-111044-8800@http.bugs.freedesktop.org/>
References: <bug-111044-8800@http.bugs.freedesktop.org/>
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Subject: [Nouveau] [Bug 111044] Resume up from suspend sometimes freezes
 system (Optimus/Nouveau)
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
Content-Type: multipart/mixed; boundary="===============1376667586=="
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>


--===============1376667586==
Content-Type: multipart/alternative; boundary="15621145091.E814D02.13125"
Content-Transfer-Encoding: 7bit


--15621145091.E814D02.13125
Date: Wed, 3 Jul 2019 00:41:49 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D111044

--- Comment #4 from Ilia Mirkin <imirkin@alum.mit.edu> ---
(In reply to JM9 from comment #3)
> It is possible. But typically, I disconnect my external monitors, close t=
he
> laptop and leave to a different location in the field with no external
> monitors. So when I open the laptop and encounter the freeze, I'm not nea=
r a
> monitor. Closing and reopening the laptop does not help, but next time I
> encounter this issue, I'll see if plugging the external monitors back when
> in this state does anything.

Oh. Is your primary screen driven by nouveau or by the intel chip? If it's =
the
intel chip, the issue is probably not (directly) related to nouveau.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15621145091.E814D02.13125
Date: Wed, 3 Jul 2019 00:41:49 +0000
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
   title=3D"NEW - Resume up from suspend sometimes freezes system (Optimus/=
Nouveau)"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111044#c4">Commen=
t # 4</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - Resume up from suspend sometimes freezes system (Optimus/=
Nouveau)"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111044">bug 11104=
4</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
imirkin&#64;alum.mit.edu" title=3D"Ilia Mirkin &lt;imirkin&#64;alum.mit.edu=
&gt;"> <span class=3D"fn">Ilia Mirkin</span></a>
</span></b>
        <pre>(In reply to JM9 from <a href=3D"show_bug.cgi?id=3D111044#c3">=
comment #3</a>)
<span class=3D"quote">&gt; It is possible. But typically, I disconnect my e=
xternal monitors, close the
&gt; laptop and leave to a different location in the field with no external
&gt; monitors. So when I open the laptop and encounter the freeze, I'm not =
near a
&gt; monitor. Closing and reopening the laptop does not help, but next time=
 I
&gt; encounter this issue, I'll see if plugging the external monitors back =
when
&gt; in this state does anything.</span >

Oh. Is your primary screen driven by nouveau or by the intel chip? If it's =
the
intel chip, the issue is probably not (directly) related to nouveau.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15621145091.E814D02.13125--

--===============1376667586==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1

--===============1376667586==--
