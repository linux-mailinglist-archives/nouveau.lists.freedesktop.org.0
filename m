Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BF8F55E422
	for <lists+nouveau@lfdr.de>; Wed,  3 Jul 2019 14:42:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 86E8E898CE;
	Wed,  3 Jul 2019 12:42:11 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:fe98:4b55])
 by gabe.freedesktop.org (Postfix) with ESMTP id 73902898CE
 for <nouveau@lists.freedesktop.org>; Wed,  3 Jul 2019 12:42:10 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 7080D72167; Wed,  3 Jul 2019 12:42:10 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: nouveau@lists.freedesktop.org
Date: Wed, 03 Jul 2019 12:42:10 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: xorg
X-Bugzilla-Component: Driver/nouveau
X-Bugzilla-Version: unspecified
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: critical
X-Bugzilla-Who: imirkin@alum.mit.edu
X-Bugzilla-Status: REOPENED
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: nouveau@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-110714-8800-7BVnIGEzSm@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============0182263738=="
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>


--===============0182263738==
Content-Type: multipart/alternative; boundary="15621577301.fe4aD0321.21810"
Content-Transfer-Encoding: 7bit


--15621577301.fe4aD0321.21810
Date: Wed, 3 Jul 2019 12:42:10 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D110714

--- Comment #7 from Ilia Mirkin <imirkin@alum.mit.edu> ---
(In reply to Peter Draganov from comment #5)
> @Ilia Mirkin
> Additionally you're not using xf86-video-nouveau. (If you were, you would=
n't
> be using glamor.)
> I am not sure about this, but here is the log for nouveau:
> [   148.426] (II) modeset(0): [DRI2]   DRI driver: nouveau
> [   148.426] (II) modeset(0): [DRI2]   VDPAU driver: nouveau
> ...
> [   148.441] (II) Initializing extension GLX
> [   148.473] (II) AIGLX: Loaded and initialized nouveau
> [   148.473] (II) GLX: Initialized DRI2 GL provider for screen 0

See how it says "modeset(0)" and not "NOUVEAU(0)"? That means you're not us=
ing
xf86-video-nouveau.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15621577301.fe4aD0321.21810
Date: Wed, 3 Jul 2019 12:42:10 +0000
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
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110714#c7">Commen=
t # 7</a>
              on <a class=3D"bz_bug_link=20
          bz_status_REOPENED "
   title=3D"REOPENED - Xorg crashes randomly because of memory leak"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110714">bug 11071=
4</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
imirkin&#64;alum.mit.edu" title=3D"Ilia Mirkin &lt;imirkin&#64;alum.mit.edu=
&gt;"> <span class=3D"fn">Ilia Mirkin</span></a>
</span></b>
        <pre>(In reply to Peter Draganov from <a href=3D"show_bug.cgi?id=3D=
110714#c5">comment #5</a>)
<span class=3D"quote">&gt; &#64;Ilia Mirkin
&gt; Additionally you're not using xf86-video-nouveau. (If you were, you wo=
uldn't
&gt; be using glamor.)
&gt; I am not sure about this, but here is the log for nouveau:
&gt; [   148.426] (II) modeset(0): [DRI2]   DRI driver: nouveau
&gt; [   148.426] (II) modeset(0): [DRI2]   VDPAU driver: nouveau
&gt; ...
&gt; [   148.441] (II) Initializing extension GLX
&gt; [   148.473] (II) AIGLX: Loaded and initialized nouveau
&gt; [   148.473] (II) GLX: Initialized DRI2 GL provider for screen 0</span=
 >

See how it says &quot;modeset(0)&quot; and not &quot;NOUVEAU(0)&quot;? That=
 means you're not using
xf86-video-nouveau.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15621577301.fe4aD0321.21810--

--===============0182263738==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1

--===============0182263738==--
