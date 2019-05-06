Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E5BA154DA
	for <lists+nouveau@lfdr.de>; Mon,  6 May 2019 22:23:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2605389C1F;
	Mon,  6 May 2019 20:23:14 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:fe98:4b55])
 by gabe.freedesktop.org (Postfix) with ESMTP id 4E86589C37
 for <nouveau@lists.freedesktop.org>; Mon,  6 May 2019 20:23:12 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 48F0D7215A; Mon,  6 May 2019 20:23:12 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: nouveau@lists.freedesktop.org
Date: Mon, 06 May 2019 20:23:11 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: xorg
X-Bugzilla-Component: Driver/nouveau
X-Bugzilla-Version: unspecified
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: critical
X-Bugzilla-Who: jeremy.booker@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: high
X-Bugzilla-Assigned-To: nouveau@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-100567-8800-Xm3tn6diMs@http.bugs.freedesktop.org/>
In-Reply-To: <bug-100567-8800@http.bugs.freedesktop.org/>
References: <bug-100567-8800@http.bugs.freedesktop.org/>
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Subject: [Nouveau] [Bug 100567] Nouveau system freeze fifo: SCHED_ERROR 0a
 [CTXSW_TIMEOUT]
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
Content-Type: multipart/mixed; boundary="===============0675374912=="
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>


--===============0675374912==
Content-Type: multipart/alternative; boundary="15571741924.2AD1EaE8E.562"
Content-Transfer-Encoding: 7bit


--15571741924.2AD1EaE8E.562
Date: Mon, 6 May 2019 20:23:12 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D100567

--- Comment #32 from Jeremy Booker <jeremy.booker@gmail.com> ---
Yes, I'm quite concerned by the "just avoid the bug" mentality too. I first
reported this bug because running a web browser, terminal, and text editor =
(as
a web developer) on a default Fedora install was seemingly asking too much =
of
the Nouveau driver. I wasn't taxing it with any unusual. I ended up switchi=
ng
to the proprietary driver because I couldn't be productive with so many cra=
shes
in the course of a work day.

I now work at a different place and no longer have access to the hardware w=
here
I was experiencing this issue, so I'm afraid I can't be of any further help
here. I wish you all luck!

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15571741924.2AD1EaE8E.562
Date: Mon, 6 May 2019 20:23:12 +0000
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
   title=3D"NEW - Nouveau system freeze fifo: SCHED_ERROR 0a [CTXSW_TIMEOUT=
]"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D100567#c32">Comme=
nt # 32</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - Nouveau system freeze fifo: SCHED_ERROR 0a [CTXSW_TIMEOUT=
]"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D100567">bug 10056=
7</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
jeremy.booker&#64;gmail.com" title=3D"Jeremy Booker &lt;jeremy.booker&#64;g=
mail.com&gt;"> <span class=3D"fn">Jeremy Booker</span></a>
</span></b>
        <pre>Yes, I'm quite concerned by the &quot;just avoid the bug&quot;=
 mentality too. I first
reported this bug because running a web browser, terminal, and text editor =
(as
a web developer) on a default Fedora install was seemingly asking too much =
of
the Nouveau driver. I wasn't taxing it with any unusual. I ended up switchi=
ng
to the proprietary driver because I couldn't be productive with so many cra=
shes
in the course of a work day.

I now work at a different place and no longer have access to the hardware w=
here
I was experiencing this issue, so I'm afraid I can't be of any further help
here. I wish you all luck!</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15571741924.2AD1EaE8E.562--

--===============0675374912==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1

--===============0675374912==--
