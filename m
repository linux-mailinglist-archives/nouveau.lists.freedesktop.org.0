Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FBA98920B
	for <lists+nouveau@lfdr.de>; Sun, 11 Aug 2019 16:40:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B8A36E34B;
	Sun, 11 Aug 2019 14:40:47 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:fe98:4b55])
 by gabe.freedesktop.org (Postfix) with ESMTP id B03B26E34B
 for <nouveau@lists.freedesktop.org>; Sun, 11 Aug 2019 14:40:46 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id A4F3072167; Sun, 11 Aug 2019 14:40:46 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: nouveau@lists.freedesktop.org
Date: Sun, 11 Aug 2019 14:40:46 +0000
X-Bugzilla-Reason: AssignedTo QAcontact
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: Mesa
X-Bugzilla-Component: Drivers/DRI/nouveau
X-Bugzilla-Version: 19.1
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: conde.philippe@skynet.be
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: nouveau@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-111110-8800-qNKyHITh9L@http.bugs.freedesktop.org/>
In-Reply-To: <bug-111110-8800@http.bugs.freedesktop.org/>
References: <bug-111110-8800@http.bugs.freedesktop.org/>
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Subject: [Nouveau] [Bug 111110] Nvidia quadro + nouveau : second terminal
 wake up but doesn't more display
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
Content-Type: multipart/mixed; boundary="===============0210540324=="
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>


--===============0210540324==
Content-Type: multipart/alternative; boundary="15655344460.ADFEFdc4B.23775"
Content-Transfer-Encoding: 7bit


--15655344460.ADFEFdc4B.23775
Date: Sun, 11 Aug 2019 14:40:46 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D111110

--- Comment #3 from Philippe Cond=C3=A9 <conde.philippe@skynet.be> ---
Hello I tested with the last available kernel
"Linux hpprol2 5.3.0-rc3-4.g7de292a-default #1 SMP Fri Aug 9 16:17:27 UTC 2=
019
(7de292a) x86_64 x86_64 x86_64 GNU/Linux
"

This regression is still present.

I have attached the Xorg.0.log. Do you need other information?

Many thanks in advance
Philippe

--=20
You are receiving this mail because:
You are the assignee for the bug.
You are the QA Contact for the bug.=

--15655344460.ADFEFdc4B.23775
Date: Sun, 11 Aug 2019 14:40:46 +0000
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
   title=3D"NEW - Nvidia quadro + nouveau : second terminal wake up but doe=
sn't more display"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111110#c3">Commen=
t # 3</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - Nvidia quadro + nouveau : second terminal wake up but doe=
sn't more display"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111110">bug 11111=
0</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
conde.philippe&#64;skynet.be" title=3D"Philippe Cond=C3=A9 &lt;conde.philip=
pe&#64;skynet.be&gt;"> <span class=3D"fn">Philippe Cond=C3=A9</span></a>
</span></b>
        <pre>Hello I tested with the last available kernel
&quot;Linux hpprol2 5.3.0-rc3-4.g7de292a-default #1 SMP Fri Aug 9 16:17:27 =
UTC 2019
(7de292a) x86_64 x86_64 x86_64 GNU/Linux
&quot;

This regression is still present.

I have attached the Xorg.0.log. Do you need other information?

Many thanks in advance
Philippe</pre>
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

--15655344460.ADFEFdc4B.23775--

--===============0210540324==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1

--===============0210540324==--
