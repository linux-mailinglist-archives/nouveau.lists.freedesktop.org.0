Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CB4F39D3F1
	for <lists+nouveau@lfdr.de>; Mon, 26 Aug 2019 18:25:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 52A796E265;
	Mon, 26 Aug 2019 16:25:48 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [131.252.210.165])
 by gabe.freedesktop.org (Postfix) with ESMTP id F24426E265
 for <nouveau@lists.freedesktop.org>; Mon, 26 Aug 2019 16:25:47 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id EAB3072161; Mon, 26 Aug 2019 16:25:47 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: nouveau@lists.freedesktop.org
Date: Mon, 26 Aug 2019 16:25:48 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: xorg
X-Bugzilla-Component: Driver/nouveau
X-Bugzilla-Version: unspecified
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: ak@axet.ru
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: nouveau@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-110660-8800-AjAVQCa2Ts@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============1615101868=="
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>


--===============1615101868==
Content-Type: multipart/alternative; boundary="15668367470.9A2Ce.14347"
Content-Transfer-Encoding: 7bit


--15668367470.9A2Ce.14347
Date: Mon, 26 Aug 2019 16:25:47 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D110660

--- Comment #42 from Alexey Kuznetsov <ak@axet.ru> ---
@Ilia Mirkin this "blank screen" still happens time to time. Some time it is
not just black screen, but previous screen buffer from another app (can be
Login screen, or game). And now I found how to reanimate X11 and allow to s=
ee
desktop, just run "killall -3 gnome-shell" from Alt+F3 console. Seems like
gnome shell some how interfering with mode switching and crashing. It may g=
ive
you a better understanding what is going on, since you know what is under h=
ood.

Just a little reminder, "blank screen" appears after I start and exit game,=
 I
have mouse cursor which react for underlying windows (change cursor to edit
text or resize window) but I can't click anything, and most of the time I s=
ee
just blank screen. Using ubuntu 19.10 when "black screen" occures I can swi=
tch
to login screen, type my password (X11 works on login screen!) and get back=
 to
current running account under "black screen" strike, this time screen appea=
rs
as login screen, mouse cursor still reacts to my original windows (so nothi=
ng
killed, music playing, and windows alive) but I can't click anyting as usua=
l.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15668367470.9A2Ce.14347
Date: Mon, 26 Aug 2019 16:25:47 +0000
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
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110660#c42">Comme=
nt # 42</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - GeForce GT 750M Mac Edition fullscreen issues"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110660">bug 11066=
0</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
ak&#64;axet.ru" title=3D"Alexey Kuznetsov &lt;ak&#64;axet.ru&gt;"> <span cl=
ass=3D"fn">Alexey Kuznetsov</span></a>
</span></b>
        <pre>&#64;Ilia Mirkin this &quot;blank screen&quot; still happens t=
ime to time. Some time it is
not just black screen, but previous screen buffer from another app (can be
Login screen, or game). And now I found how to reanimate X11 and allow to s=
ee
desktop, just run &quot;killall -3 gnome-shell&quot; from Alt+F3 console. S=
eems like
gnome shell some how interfering with mode switching and crashing. It may g=
ive
you a better understanding what is going on, since you know what is under h=
ood.

Just a little reminder, &quot;blank screen&quot; appears after I start and =
exit game, I
have mouse cursor which react for underlying windows (change cursor to edit
text or resize window) but I can't click anything, and most of the time I s=
ee
just blank screen. Using ubuntu 19.10 when &quot;black screen&quot; occures=
 I can switch
to login screen, type my password (X11 works on login screen!) and get back=
 to
current running account under &quot;black screen&quot; strike, this time sc=
reen appears
as login screen, mouse cursor still reacts to my original windows (so nothi=
ng
killed, music playing, and windows alive) but I can't click anyting as usua=
l.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15668367470.9A2Ce.14347--

--===============1615101868==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1

--===============1615101868==--
