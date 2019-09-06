Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A37EABDAB
	for <lists+nouveau@lfdr.de>; Fri,  6 Sep 2019 18:26:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 187CA6E31C;
	Fri,  6 Sep 2019 16:26:25 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [131.252.210.165])
 by gabe.freedesktop.org (Postfix) with ESMTP id A648A6E31C
 for <nouveau@lists.freedesktop.org>; Fri,  6 Sep 2019 16:26:24 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id A2D7972161; Fri,  6 Sep 2019 16:26:24 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: nouveau@lists.freedesktop.org
Date: Fri, 06 Sep 2019 16:26:24 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: xorg
X-Bugzilla-Component: Driver/nouveau
X-Bugzilla-Version: unspecified
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: critical
X-Bugzilla-Who: john@jlindgren.net
X-Bugzilla-Status: REOPENED
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: nouveau@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-110714-8800-estzleN6Es@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============0733382508=="
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>


--===============0733382508==
Content-Type: multipart/alternative; boundary="15677871842.8b9CcFa1d.24527"
Content-Transfer-Encoding: 7bit


--15677871842.8b9CcFa1d.24527
Date: Fri, 6 Sep 2019 16:26:24 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D110714

--- Comment #20 from John Lindgren <john@jlindgren.net> ---
Created attachment 145281
  --> https://bugs.freedesktop.org/attachment.cgi?id=3D145281&action=3Dedit
My Xorg log

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15677871842.8b9CcFa1d.24527
Date: Fri, 6 Sep 2019 16:26:24 +0000
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
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110714#c20">Comme=
nt # 20</a>
              on <a class=3D"bz_bug_link=20
          bz_status_REOPENED "
   title=3D"REOPENED - Xorg crashes randomly because of memory leak"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110714">bug 11071=
4</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
john&#64;jlindgren.net" title=3D"John Lindgren &lt;john&#64;jlindgren.net&g=
t;"> <span class=3D"fn">John Lindgren</span></a>
</span></b>
        <pre>Created <span class=3D""><a href=3D"attachment.cgi?id=3D145281=
" name=3D"attach_145281" title=3D"My Xorg log">attachment 145281</a> <a hre=
f=3D"attachment.cgi?id=3D145281&amp;action=3Dedit" title=3D"My Xorg log">[d=
etails]</a></span>
My Xorg log</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15677871842.8b9CcFa1d.24527--

--===============0733382508==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1

--===============0733382508==--
