Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AEA0FB5087
	for <lists+nouveau@lfdr.de>; Tue, 17 Sep 2019 16:37:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 271956ECAE;
	Tue, 17 Sep 2019 14:37:16 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [131.252.210.165])
 by gabe.freedesktop.org (Postfix) with ESMTP id 2090B6ECA9
 for <nouveau@lists.freedesktop.org>; Tue, 17 Sep 2019 14:37:15 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 1D49E72167; Tue, 17 Sep 2019 14:37:15 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: nouveau@lists.freedesktop.org
Date: Tue, 17 Sep 2019 14:37:15 +0000
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
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-111724-8800-psIk6eoAJa@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============0286580985=="
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>


--===============0286580985==
Content-Type: multipart/alternative; boundary="15687310350.47CB.10626"
Content-Transfer-Encoding: 7bit


--15687310350.47CB.10626
Date: Tue, 17 Sep 2019 14:37:15 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D111724

--- Comment #7 from Mark Menzynski <mmenzyns@redhat.com> ---
Created attachment 145401
  --> https://bugs.freedesktop.org/attachment.cgi?id=3D145401&action=3Dedit
strap_peek

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15687310350.47CB.10626
Date: Tue, 17 Sep 2019 14:37:15 +0000
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
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111724#c7">Commen=
t # 7</a>
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
        <pre>Created <span class=3D""><a href=3D"attachment.cgi?id=3D145401=
" name=3D"attach_145401" title=3D"strap_peek">attachment 145401</a> <a href=
=3D"attachment.cgi?id=3D145401&amp;action=3Dedit" title=3D"strap_peek">[det=
ails]</a></span>
strap_peek</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15687310350.47CB.10626--

--===============0286580985==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1

--===============0286580985==--
