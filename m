Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CEFE5B5086
	for <lists+nouveau@lfdr.de>; Tue, 17 Sep 2019 16:36:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3646D6ECB0;
	Tue, 17 Sep 2019 14:36:54 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:fe98:4b55])
 by gabe.freedesktop.org (Postfix) with ESMTP id 7EEC06ECAC
 for <nouveau@lists.freedesktop.org>; Tue, 17 Sep 2019 14:36:52 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 7BD8C72167; Tue, 17 Sep 2019 14:36:52 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: nouveau@lists.freedesktop.org
Date: Tue, 17 Sep 2019 14:36:52 +0000
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
Message-ID: <bug-111724-8800-SVqeLKpRf7@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============1578443071=="
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>


--===============1578443071==
Content-Type: multipart/alternative; boundary="15687310121.b23Dbef.10498"
Content-Transfer-Encoding: 7bit


--15687310121.b23Dbef.10498
Date: Tue, 17 Sep 2019 14:36:52 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D111724

--- Comment #6 from Mark Menzynski <mmenzyns@redhat.com> ---
Created attachment 145400
  --> https://bugs.freedesktop.org/attachment.cgi?id=3D145400&action=3Dedit
mmiotrace log from nvidia driver

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15687310121.b23Dbef.10498
Date: Tue, 17 Sep 2019 14:36:52 +0000
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
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111724#c6">Commen=
t # 6</a>
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
        <pre>Created <span class=3D""><a href=3D"attachment.cgi?id=3D145400=
" name=3D"attach_145400" title=3D"mmiotrace log from nvidia driver">attachm=
ent 145400</a> <a href=3D"attachment.cgi?id=3D145400&amp;action=3Dedit" tit=
le=3D"mmiotrace log from nvidia driver">[details]</a></span>
mmiotrace log from nvidia driver</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15687310121.b23Dbef.10498--

--===============1578443071==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1

--===============1578443071==--
