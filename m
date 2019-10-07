Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DE890CE546
	for <lists+nouveau@lfdr.de>; Mon,  7 Oct 2019 16:31:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB2F86E09E;
	Mon,  7 Oct 2019 14:31:27 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:fe98:4b55])
 by gabe.freedesktop.org (Postfix) with ESMTP id EC97B89FE6
 for <nouveau@lists.freedesktop.org>; Mon,  7 Oct 2019 14:31:26 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id E917272162; Mon,  7 Oct 2019 14:31:26 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: nouveau@lists.freedesktop.org
Date: Mon, 07 Oct 2019 14:31:26 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: xorg
X-Bugzilla-Component: Driver/nouveau
X-Bugzilla-Version: unspecified
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: critical
X-Bugzilla-Who: developer@bk.ru
X-Bugzilla-Status: REOPENED
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: nouveau@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-110714-8800-g3AlwUuN1T@http.bugs.freedesktop.org/>
In-Reply-To: <bug-110714-8800@http.bugs.freedesktop.org/>
References: <bug-110714-8800@http.bugs.freedesktop.org/>
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Subject: [Nouveau] [Bug 110714] Xorg crashes randomly because of memory leak
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
Content-Type: multipart/mixed; boundary="===============0278836109=="
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>


--===============0278836109==
Content-Type: multipart/alternative; boundary="15704586862.879e45.664"
Content-Transfer-Encoding: 7bit


--15704586862.879e45.664
Date: Mon, 7 Oct 2019 14:31:26 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D110714

--- Comment #22 from Andrey Sychev <developer@bk.ru> ---
Created attachment 145675
  --> https://bugs.freedesktop.org/attachment.cgi?id=3D145675&action=3Dedit
My Xorg.0.log.old

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15704586862.879e45.664
Date: Mon, 7 Oct 2019 14:31:26 +0000
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
          bz_status_REOPENED "
   title=3D"REOPENED - Xorg crashes randomly because of memory leak"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110714#c22">Comme=
nt # 22</a>
              on <a class=3D"bz_bug_link=20
          bz_status_REOPENED "
   title=3D"REOPENED - Xorg crashes randomly because of memory leak"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110714">bug 11071=
4</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
developer&#64;bk.ru" title=3D"Andrey Sychev &lt;developer&#64;bk.ru&gt;"> <=
span class=3D"fn">Andrey Sychev</span></a>
</span></b>
        <pre>Created <span class=3D""><a href=3D"attachment.cgi?id=3D145675=
" name=3D"attach_145675" title=3D"My Xorg.0.log.old">attachment 145675</a> =
<a href=3D"attachment.cgi?id=3D145675&amp;action=3Dedit" title=3D"My Xorg.0=
.log.old">[details]</a></span>
My Xorg.0.log.old</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15704586862.879e45.664--

--===============0278836109==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1

--===============0278836109==--
