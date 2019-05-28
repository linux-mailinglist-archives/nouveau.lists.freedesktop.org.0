Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 81B482D05F
	for <lists+nouveau@lfdr.de>; Tue, 28 May 2019 22:31:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 79ABF6E296;
	Tue, 28 May 2019 20:31:31 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [131.252.210.165])
 by gabe.freedesktop.org (Postfix) with ESMTP id 008ED89FCA
 for <nouveau@lists.freedesktop.org>; Tue, 28 May 2019 20:31:29 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id F0F5D72167; Tue, 28 May 2019 20:31:29 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: nouveau@lists.freedesktop.org
Date: Tue, 28 May 2019 20:31:30 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: xorg
X-Bugzilla-Component: Driver/nouveau
X-Bugzilla-Version: unspecified
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: imirkin@alum.mit.edu
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: nouveau@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-110660-8800-xd5pixvhoV@http.bugs.freedesktop.org/>
In-Reply-To: <bug-110660-8800@http.bugs.freedesktop.org/>
References: <bug-110660-8800@http.bugs.freedesktop.org/>
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Subject: [Nouveau] [Bug 110660] GeForce GT 750M Mac Edition fullscreen issues
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
Content-Type: multipart/mixed; boundary="===============0284823003=="
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>


--===============0284823003==
Content-Type: multipart/alternative; boundary="15590754893.fa9aD.12998"
Content-Transfer-Encoding: 7bit


--15590754893.fa9aD.12998
Date: Tue, 28 May 2019 20:31:29 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D110660

--- Comment #36 from Ilia Mirkin <imirkin@alum.mit.edu> ---
(In reply to Alexey Kuznetsov from comment #35)
> Yep, bingo. Now it is scaling display and has no broken displays after
> reboot no need to call additional xrandr commands. But, feels like default
> "scaling mode" should be "Full aspect" instead "Full". Anyway, thanks for
> support! Nvidia should be ashamed for lack of linux support.

Well, on a regular monitor, using a smaller modeline generally scales it to=
 the
full size of that screen. This emulates that behavior by default. If you wa=
nt
something else, you have to fiddle with settings.

I'm going to confer with people who actually understand all this
mode/adjusted_mode bs to try to fix my earlier blunder.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15590754893.fa9aD.12998
Date: Tue, 28 May 2019 20:31:29 +0000
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
   title=3D"NEW - GeForce GT 750M Mac Edition fullscreen issues"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110660#c36">Comme=
nt # 36</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - GeForce GT 750M Mac Edition fullscreen issues"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110660">bug 11066=
0</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
imirkin&#64;alum.mit.edu" title=3D"Ilia Mirkin &lt;imirkin&#64;alum.mit.edu=
&gt;"> <span class=3D"fn">Ilia Mirkin</span></a>
</span></b>
        <pre>(In reply to Alexey Kuznetsov from <a href=3D"show_bug.cgi?id=
=3D110660#c35">comment #35</a>)
<span class=3D"quote">&gt; Yep, bingo. Now it is scaling display and has no=
 broken displays after
&gt; reboot no need to call additional xrandr commands. But, feels like def=
ault
&gt; &quot;scaling mode&quot; should be &quot;Full aspect&quot; instead &qu=
ot;Full&quot;. Anyway, thanks for
&gt; support! Nvidia should be ashamed for lack of linux support.</span >

Well, on a regular monitor, using a smaller modeline generally scales it to=
 the
full size of that screen. This emulates that behavior by default. If you wa=
nt
something else, you have to fiddle with settings.

I'm going to confer with people who actually understand all this
mode/adjusted_mode bs to try to fix my earlier blunder.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15590754893.fa9aD.12998--

--===============0284823003==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1

--===============0284823003==--
