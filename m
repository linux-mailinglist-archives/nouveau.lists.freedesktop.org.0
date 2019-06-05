Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A22CD35F96
	for <lists+nouveau@lfdr.de>; Wed,  5 Jun 2019 16:49:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2FE4989C49;
	Wed,  5 Jun 2019 14:49:45 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:fe98:4b55])
 by gabe.freedesktop.org (Postfix) with ESMTP id E78CA89C49
 for <nouveau@lists.freedesktop.org>; Wed,  5 Jun 2019 14:49:43 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id DFC0872167; Wed,  5 Jun 2019 14:49:43 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: nouveau@lists.freedesktop.org
Date: Wed, 05 Jun 2019 14:49:44 +0000
X-Bugzilla-Reason: QAcontact AssignedTo
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
Message-ID: <bug-110679-8800-1wMGoqgGyc@http.bugs.freedesktop.org/>
In-Reply-To: <bug-110679-8800@http.bugs.freedesktop.org/>
References: <bug-110679-8800@http.bugs.freedesktop.org/>
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Subject: [Nouveau] [Bug 110679] va-api scaling with nv50-class cards
 incomplete?
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
Content-Type: multipart/mixed; boundary="===============0700452241=="
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>


--===============0700452241==
Content-Type: multipart/alternative; boundary="15597461830.285ce.29015"
Content-Transfer-Encoding: 7bit


--15597461830.285ce.29015
Date: Wed, 5 Jun 2019 14:49:43 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D110679

--- Comment #1 from Andrew Randrianasulu <randrik@mail.ru> ---
After adding XVMC_VL=3D1 variable ffmpeg command above started to work ?!
Apparently, 'normal' nouveau video allocator dislikes two differently-sized
buffers (command also worked when I set "scale_vaapi=3Dw=3D1280:h=3D720" , =
in other
words to strictly same dimensions as input ....)

--=20
You are receiving this mail because:
You are the QA Contact for the bug.
You are the assignee for the bug.=

--15597461830.285ce.29015
Date: Wed, 5 Jun 2019 14:49:43 +0000
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
   title=3D"NEW - va-api scaling with nv50-class cards incomplete?"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110679#c1">Commen=
t # 1</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - va-api scaling with nv50-class cards incomplete?"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110679">bug 11067=
9</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
randrik&#64;mail.ru" title=3D"Andrew Randrianasulu &lt;randrik&#64;mail.ru&=
gt;"> <span class=3D"fn">Andrew Randrianasulu</span></a>
</span></b>
        <pre>After adding XVMC_VL=3D1 variable ffmpeg command above started=
 to work ?!
Apparently, 'normal' nouveau video allocator dislikes two differently-sized
buffers (command also worked when I set &quot;scale_vaapi=3Dw=3D1280:h=3D72=
0&quot; , in other
words to strictly same dimensions as input ....)</pre>
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

--15597461830.285ce.29015--

--===============0700452241==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1

--===============0700452241==--
