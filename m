Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 475A4805AB
	for <lists+nouveau@lfdr.de>; Sat,  3 Aug 2019 12:12:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD3136E489;
	Sat,  3 Aug 2019 10:12:17 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [131.252.210.165])
 by gabe.freedesktop.org (Postfix) with ESMTP id B68E56E489
 for <nouveau@lists.freedesktop.org>; Sat,  3 Aug 2019 10:12:16 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id B322F72167; Sat,  3 Aug 2019 10:12:16 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: nouveau@lists.freedesktop.org
Date: Sat, 03 Aug 2019 10:12:16 +0000
X-Bugzilla-Reason: AssignedTo QAcontact
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
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-111292-8800-iZXw7RDOZG@http.bugs.freedesktop.org/>
In-Reply-To: <bug-111292-8800@http.bugs.freedesktop.org/>
References: <bug-111292-8800@http.bugs.freedesktop.org/>
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Subject: [Nouveau] [Bug 111292] Advanced Lighting option in Firestorm Viewer
 makes some objects black on nv92 card
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
Content-Type: multipart/mixed; boundary="===============1611612257=="
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>


--===============1611612257==
Content-Type: multipart/alternative; boundary="15648271360.8C6feC8.26236"
Content-Transfer-Encoding: 7bit


--15648271360.8C6feC8.26236
Date: Sat, 3 Aug 2019 10:12:16 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D111292

--- Comment #4 from Andrew Randrianasulu <randrik@mail.ru> ---
Created attachment 144939
  --> https://bugs.freedesktop.org/attachment.cgi?id=3D144939&action=3Dedit
dmesg

--=20
You are receiving this mail because:
You are the assignee for the bug.
You are the QA Contact for the bug.=

--15648271360.8C6feC8.26236
Date: Sat, 3 Aug 2019 10:12:16 +0000
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
   title=3D"NEW - Advanced Lighting option in Firestorm Viewer makes some o=
bjects black on nv92 card"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111292#c4">Commen=
t # 4</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - Advanced Lighting option in Firestorm Viewer makes some o=
bjects black on nv92 card"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111292">bug 11129=
2</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
randrik&#64;mail.ru" title=3D"Andrew Randrianasulu &lt;randrik&#64;mail.ru&=
gt;"> <span class=3D"fn">Andrew Randrianasulu</span></a>
</span></b>
        <pre>Created <span class=3D""><a href=3D"attachment.cgi?id=3D144939=
" name=3D"attach_144939" title=3D"dmesg">attachment 144939</a> <a href=3D"a=
ttachment.cgi?id=3D144939&amp;action=3Dedit" title=3D"dmesg">[details]</a><=
/span>
dmesg</pre>
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

--15648271360.8C6feC8.26236--

--===============1611612257==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1

--===============1611612257==--
