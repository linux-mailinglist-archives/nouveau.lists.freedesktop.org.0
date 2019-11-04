Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 40B08EE66A
	for <lists+nouveau@lfdr.de>; Mon,  4 Nov 2019 18:43:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C12EF6E7B2;
	Mon,  4 Nov 2019 17:43:28 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [131.252.210.165])
 by gabe.freedesktop.org (Postfix) with ESMTP id C6F586E7B0
 for <nouveau@lists.freedesktop.org>; Mon,  4 Nov 2019 17:43:26 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id C32D5720E2; Mon,  4 Nov 2019 17:43:26 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: nouveau@lists.freedesktop.org
Date: Mon, 04 Nov 2019 17:43:26 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: xorg
X-Bugzilla-Component: Driver/nouveau
X-Bugzilla-Version: unspecified
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: critical
X-Bugzilla-Who: jajones@nvidia.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: not set
X-Bugzilla-Assigned-To: nouveau@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-112197-8800-vL3Hg3iubD@http.bugs.freedesktop.org/>
In-Reply-To: <bug-112197-8800@http.bugs.freedesktop.org/>
References: <bug-112197-8800@http.bugs.freedesktop.org/>
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Subject: [Nouveau] [Bug 112197] Black screen after resume
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
Content-Type: multipart/mixed; boundary="===============1360949361=="
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>


--===============1360949361==
Content-Type: multipart/alternative; boundary="15728894062.da5e.22822"
Content-Transfer-Encoding: 7bit


--15728894062.da5e.22822
Date: Mon, 4 Nov 2019 17:43:26 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D112197

--- Comment #1 from James Jones <jajones@nvidia.com> ---
Just a note: The binary NVIDIA driver (I assume that's what the OEM driver =
is)
does support DisplayLink outputs if configured correctly.  It's effectively=
 the
same as an optimus configuration.  See these sections in our documentation =
for
more information if you're interested:

https://download.nvidia.com/XFree86/Linux-x86_64/440.31/README/optimus.html
https://download.nvidia.com/XFree86/Linux-x86_64/440.31/README/randr14.html

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15728894062.da5e.22822
Date: Mon, 4 Nov 2019 17:43:26 +0000
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
   title=3D"NEW - Black screen after resume"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D112197#c1">Commen=
t # 1</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - Black screen after resume"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D112197">bug 11219=
7</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
jajones&#64;nvidia.com" title=3D"James Jones &lt;jajones&#64;nvidia.com&gt;=
"> <span class=3D"fn">James Jones</span></a>
</span></b>
        <pre>Just a note: The binary NVIDIA driver (I assume that's what th=
e OEM driver is)
does support DisplayLink outputs if configured correctly.  It's effectively=
 the
same as an optimus configuration.  See these sections in our documentation =
for
more information if you're interested:

<a href=3D"https://download.nvidia.com/XFree86/Linux-x86_64/440.31/README/o=
ptimus.html">https://download.nvidia.com/XFree86/Linux-x86_64/440.31/README=
/optimus.html</a>
<a href=3D"https://download.nvidia.com/XFree86/Linux-x86_64/440.31/README/r=
andr14.html">https://download.nvidia.com/XFree86/Linux-x86_64/440.31/README=
/randr14.html</a></pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15728894062.da5e.22822--

--===============1360949361==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1

--===============1360949361==--
