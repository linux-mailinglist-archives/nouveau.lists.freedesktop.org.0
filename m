Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A15AC0BF9
	for <lists+nouveau@lfdr.de>; Fri, 27 Sep 2019 21:13:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F25166E225;
	Fri, 27 Sep 2019 19:13:02 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [131.252.210.165])
 by gabe.freedesktop.org (Postfix) with ESMTP id 32D716E221
 for <nouveau@lists.freedesktop.org>; Fri, 27 Sep 2019 19:13:01 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 2FD5272162; Fri, 27 Sep 2019 19:13:01 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: nouveau@lists.freedesktop.org
Date: Fri, 27 Sep 2019 19:13:01 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: xorg
X-Bugzilla-Component: Driver/nouveau
X-Bugzilla-Version: unspecified
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: not set
X-Bugzilla-Who: karolherbst@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: not set
X-Bugzilla-Assigned-To: nouveau@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-111843-8800-Dlo0AovJVG@http.bugs.freedesktop.org/>
In-Reply-To: <bug-111843-8800@http.bugs.freedesktop.org/>
References: <bug-111843-8800@http.bugs.freedesktop.org/>
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Subject: [Nouveau] [Bug 111843] Resume fails after suspend with nouveau and
 Gtx 1050 ti
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
Content-Type: multipart/mixed; boundary="===============1600008421=="
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>


--===============1600008421==
Content-Type: multipart/alternative; boundary="15696115812.D58e2.11953"
Content-Transfer-Encoding: 7bit


--15696115812.D58e2.11953
Date: Fri, 27 Sep 2019 19:13:01 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D111843

--- Comment #3 from Karol Herbst <karolherbst@gmail.com> ---
(In reply to txuxifel from comment #2)
> Created attachment 145558 [details]
> Dmesg with nouveau

thanks. There are two interesting bits in there:

* nouveau 0000:01:00.0: gr: intr 00000040
* nouveau 0000:01:00.0: bus: MMIO write of 800002af FAULT at 10eb14 [ TIMEO=
UT ]

Ben, did you ever see this issue? Is it something which might be fixed by y=
our
secboot rework?

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15696115812.D58e2.11953
Date: Fri, 27 Sep 2019 19:13:01 +0000
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
   title=3D"NEW - Resume fails after suspend with nouveau and Gtx 1050 ti"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111843#c3">Commen=
t # 3</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - Resume fails after suspend with nouveau and Gtx 1050 ti"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111843">bug 11184=
3</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
karolherbst&#64;gmail.com" title=3D"Karol Herbst &lt;karolherbst&#64;gmail.=
com&gt;"> <span class=3D"fn">Karol Herbst</span></a>
</span></b>
        <pre>(In reply to txuxifel from <a href=3D"show_bug.cgi?id=3D111843=
#c2">comment #2</a>)
<span class=3D"quote">&gt; Created <span class=3D""><a href=3D"attachment.c=
gi?id=3D145558" name=3D"attach_145558" title=3D"Dmesg with nouveau">attachm=
ent 145558</a> <a href=3D"attachment.cgi?id=3D145558&amp;action=3Dedit" tit=
le=3D"Dmesg with nouveau">[details]</a></span>
&gt; Dmesg with nouveau</span >

thanks. There are two interesting bits in there:

* nouveau 0000:01:00.0: gr: intr 00000040
* nouveau 0000:01:00.0: bus: MMIO write of 800002af FAULT at 10eb14 [ TIMEO=
UT ]

Ben, did you ever see this issue? Is it something which might be fixed by y=
our
secboot rework?</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15696115812.D58e2.11953--

--===============1600008421==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1

--===============1600008421==--
