Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CFDAFB5189
	for <lists+nouveau@lfdr.de>; Tue, 17 Sep 2019 17:29:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C1AE6ECEC;
	Tue, 17 Sep 2019 15:29:57 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [131.252.210.165])
 by gabe.freedesktop.org (Postfix) with ESMTP id 924146ECEC
 for <nouveau@lists.freedesktop.org>; Tue, 17 Sep 2019 15:29:55 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 8BF1D72167; Tue, 17 Sep 2019 15:29:55 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: nouveau@lists.freedesktop.org
Date: Tue, 17 Sep 2019 15:29:55 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: xorg
X-Bugzilla-Component: Driver/nouveau
X-Bugzilla-Version: unspecified
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: mmenzyns@redhat.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: not set
X-Bugzilla-Assigned-To: nouveau@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-111724-8800-0FeO8wvz1K@http.bugs.freedesktop.org/>
In-Reply-To: <bug-111724-8800@http.bugs.freedesktop.org/>
References: <bug-111724-8800@http.bugs.freedesktop.org/>
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Subject: [Nouveau] [Bug 111724] NVE6 (GK106) memory re-clocking breaks
 GpuTest plot3d benchmark
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
Content-Type: multipart/mixed; boundary="===============0085275544=="
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>


--===============0085275544==
Content-Type: multipart/alternative; boundary="15687341952.6Fd2EECE.27035"
Content-Transfer-Encoding: 7bit


--15687341952.6Fd2EECE.27035
Date: Tue, 17 Sep 2019 15:29:55 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D111724

--- Comment #12 from Mark Menzynski <mmenzyns@redhat.com> ---
(In reply to Ilia Mirkin from comment #9)
> Mark - try using blob ctxsw firmware. Perhaps ours misses something. There
> are some GK106's which just die immediately with out firmware... (See
> VideoAcceleration wiki page for how to extract firmware from blob drivers=
.)

Doesn't work. Same problem.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15687341952.6Fd2EECE.27035
Date: Tue, 17 Sep 2019 15:29:55 +0000
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
   title=3D"NEW - NVE6 (GK106) memory re-clocking breaks GpuTest plot3d ben=
chmark"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111724#c12">Comme=
nt # 12</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - NVE6 (GK106) memory re-clocking breaks GpuTest plot3d ben=
chmark"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111724">bug 11172=
4</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
mmenzyns&#64;redhat.com" title=3D"Mark Menzynski &lt;mmenzyns&#64;redhat.co=
m&gt;"> <span class=3D"fn">Mark Menzynski</span></a>
</span></b>
        <pre>(In reply to Ilia Mirkin from <a href=3D"show_bug.cgi?id=3D111=
724#c9">comment #9</a>)
<span class=3D"quote">&gt; Mark - try using blob ctxsw firmware. Perhaps ou=
rs misses something. There
&gt; are some GK106's which just die immediately with out firmware... (See
&gt; VideoAcceleration wiki page for how to extract firmware from blob driv=
ers.)</span >

Doesn't work. Same problem.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15687341952.6Fd2EECE.27035--

--===============0085275544==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1

--===============0085275544==--
