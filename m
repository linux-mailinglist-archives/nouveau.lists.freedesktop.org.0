Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A763555A4E
	for <lists+nouveau@lfdr.de>; Tue, 25 Jun 2019 23:54:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F894891CD;
	Tue, 25 Jun 2019 21:54:15 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:fe98:4b55])
 by gabe.freedesktop.org (Postfix) with ESMTP id 4A87A6E25C
 for <nouveau@lists.freedesktop.org>; Tue, 25 Jun 2019 21:54:14 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 2E1B372168; Tue, 25 Jun 2019 21:54:14 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: nouveau@lists.freedesktop.org
Date: Tue, 25 Jun 2019 21:54:14 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: xorg
X-Bugzilla-Component: Driver/nouveau
X-Bugzilla-Version: unspecified
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: m.meledandri@gmail.com
X-Bugzilla-Status: NEEDINFO
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: nouveau@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-110997-8800-2vf4LLsFaX@http.bugs.freedesktop.org/>
In-Reply-To: <bug-110997-8800@http.bugs.freedesktop.org/>
References: <bug-110997-8800@http.bugs.freedesktop.org/>
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Subject: [Nouveau] [Bug 110997] NV50 fan runs at full speed after resume
 from suspend on kernels 5.1.8, 4.19.49
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
Content-Type: multipart/mixed; boundary="===============0861280786=="
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>


--===============0861280786==
Content-Type: multipart/alternative; boundary="15614996541.CBaEad.9892"
Content-Transfer-Encoding: 7bit


--15614996541.CBaEad.9892
Date: Tue, 25 Jun 2019 21:54:14 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D110997

--- Comment #2 from Marc Meledandri <m.meledandri@gmail.com> ---
Hi! Thanks so much for the quick turnaround on this one. Great that you had=
 a
card on hand to test with.

I can confirm that this patch applied against stable kernel 5.1.15 resolves=
 the
fan speed issue when resuming from suspend.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15614996541.CBaEad.9892
Date: Tue, 25 Jun 2019 21:54:14 +0000
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
          bz_status_NEEDINFO "
   title=3D"NEEDINFO - NV50 fan runs at full speed after resume from suspen=
d on kernels 5.1.8, 4.19.49"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110997#c2">Commen=
t # 2</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEEDINFO "
   title=3D"NEEDINFO - NV50 fan runs at full speed after resume from suspen=
d on kernels 5.1.8, 4.19.49"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110997">bug 11099=
7</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
m.meledandri&#64;gmail.com" title=3D"Marc Meledandri &lt;m.meledandri&#64;g=
mail.com&gt;"> <span class=3D"fn">Marc Meledandri</span></a>
</span></b>
        <pre>Hi! Thanks so much for the quick turnaround on this one. Great=
 that you had a
card on hand to test with.

I can confirm that this patch applied against stable kernel 5.1.15 resolves=
 the
fan speed issue when resuming from suspend.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15614996541.CBaEad.9892--

--===============0861280786==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1

--===============0861280786==--
