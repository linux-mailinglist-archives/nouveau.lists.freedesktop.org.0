Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 32498ABD84
	for <lists+nouveau@lfdr.de>; Fri,  6 Sep 2019 18:17:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B9FA76E31D;
	Fri,  6 Sep 2019 16:17:42 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [131.252.210.165])
 by gabe.freedesktop.org (Postfix) with ESMTP id 07DC16E31D
 for <nouveau@lists.freedesktop.org>; Fri,  6 Sep 2019 16:17:42 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id F3F5572161; Fri,  6 Sep 2019 16:17:41 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: nouveau@lists.freedesktop.org
Date: Fri, 06 Sep 2019 16:17:42 +0000
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
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-110714-8800-OkiPNK8Tpi@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============1274407736=="
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>


--===============1274407736==
Content-Type: multipart/alternative; boundary="15677866612.271BdD6D.26747"
Content-Transfer-Encoding: 7bit


--15677866612.271BdD6D.26747
Date: Fri, 6 Sep 2019 16:17:41 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D110714

--- Comment #19 from John Lindgren <john@jlindgren.net> ---
I just saw this same crash (Xorg 1.20.4 here still though).  I also had
Firefox, VirtualBox, Evolution, and a few smaller applications running.  The
computer had been running for most of the week already, so maybe a memory l=
eak
somewhere?

My card is:

01:00.0 VGA compatible controller: NVIDIA Corporation GM107GLM [Quadro M200=
0M]
(rev a2)

I am using xf86-video-modesetting.  Should I be using xf86-video-nouveau
instead?

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15677866612.271BdD6D.26747
Date: Fri, 6 Sep 2019 16:17:41 +0000
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
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110714#c19">Comme=
nt # 19</a>
              on <a class=3D"bz_bug_link=20
          bz_status_REOPENED "
   title=3D"REOPENED - Xorg crashes randomly because of memory leak"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110714">bug 11071=
4</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
john&#64;jlindgren.net" title=3D"John Lindgren &lt;john&#64;jlindgren.net&g=
t;"> <span class=3D"fn">John Lindgren</span></a>
</span></b>
        <pre>I just saw this same crash (Xorg 1.20.4 here still though).  I=
 also had
Firefox, VirtualBox, Evolution, and a few smaller applications running.  The
computer had been running for most of the week already, so maybe a memory l=
eak
somewhere?

My card is:

01:00.0 VGA compatible controller: NVIDIA Corporation GM107GLM [Quadro M200=
0M]
(rev a2)

I am using xf86-video-modesetting.  Should I be using xf86-video-nouveau
instead?</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15677866612.271BdD6D.26747--

--===============1274407736==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1

--===============1274407736==--
