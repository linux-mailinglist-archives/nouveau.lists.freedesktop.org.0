Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AF1E3387D3
	for <lists+nouveau@lfdr.de>; Fri,  7 Jun 2019 12:21:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 240DE89D00;
	Fri,  7 Jun 2019 10:21:45 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [131.252.210.165])
 by gabe.freedesktop.org (Postfix) with ESMTP id BD96289CAC
 for <nouveau@lists.freedesktop.org>; Fri,  7 Jun 2019 10:21:43 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id B2EB772167; Fri,  7 Jun 2019 10:21:43 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: nouveau@lists.freedesktop.org
Date: Fri, 07 Jun 2019 10:21:44 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: xorg
X-Bugzilla-Component: Driver/nouveau
X-Bugzilla-Version: 7.7 (2012.06)
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: mszpak@wp.pl
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: nouveau@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-110830-8800-zbiQWu5jRk@http.bugs.freedesktop.org/>
In-Reply-To: <bug-110830-8800@http.bugs.freedesktop.org/>
References: <bug-110830-8800@http.bugs.freedesktop.org/>
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Subject: [Nouveau] [Bug 110830] [nouveau] GeForce GTX 1660 Ti (mobile) not
 supported (NV168/TU116)
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
Content-Type: multipart/mixed; boundary="===============0906678196=="
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>


--===============0906678196==
Content-Type: multipart/alternative; boundary="15599029030.4965.14317"
Content-Transfer-Encoding: 7bit


--15599029030.4965.14317
Date: Fri, 7 Jun 2019 10:21:43 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D110830

--- Comment #4 from Marcin Zajaczkowski <mszpak@wp.pl> ---
Of course it didn't make sense to turn it on, as it was already turned on
(DynPwr) in my case :) ). I can switch it off with vgaswitcheroo (or at lea=
st
to be reported as DynOff - I will check it later with powertop) when no
external output is connected. And what I missed in my previous comment - the
external monitor works out-of-box, which is nice progress.

Later on I will try to play with DRI_PRIME to enable also rendering with the
NVidia card.

What could be the side effects of:
> kernel: nouveau 0000:01:00.0: DRM: failed to create kernel channel, -22
?

And, in general, thanks for you suggestion with NvChipset :). If you would =
like
to test anything else on that hardware, please let me know.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15599029030.4965.14317
Date: Fri, 7 Jun 2019 10:21:43 +0000
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
   title=3D"NEW - [nouveau] GeForce GTX 1660 Ti (mobile) not supported (NV1=
68/TU116)"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110830#c4">Commen=
t # 4</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - [nouveau] GeForce GTX 1660 Ti (mobile) not supported (NV1=
68/TU116)"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110830">bug 11083=
0</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
mszpak&#64;wp.pl" title=3D"Marcin Zajaczkowski &lt;mszpak&#64;wp.pl&gt;"> <=
span class=3D"fn">Marcin Zajaczkowski</span></a>
</span></b>
        <pre>Of course it didn't make sense to turn it on, as it was alread=
y turned on
(DynPwr) in my case :) ). I can switch it off with vgaswitcheroo (or at lea=
st
to be reported as DynOff - I will check it later with powertop) when no
external output is connected. And what I missed in my previous comment - the
external monitor works out-of-box, which is nice progress.

Later on I will try to play with DRI_PRIME to enable also rendering with the
NVidia card.

What could be the side effects of:
<span class=3D"quote">&gt; kernel: nouveau 0000:01:00.0: DRM: failed to cre=
ate kernel channel, -22</span >
?

And, in general, thanks for you suggestion with NvChipset :). If you would =
like
to test anything else on that hardware, please let me know.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15599029030.4965.14317--

--===============0906678196==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1

--===============0906678196==--
