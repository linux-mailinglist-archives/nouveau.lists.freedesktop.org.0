Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 840AF55976
	for <lists+nouveau@lfdr.de>; Tue, 25 Jun 2019 22:56:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7ED316E249;
	Tue, 25 Jun 2019 20:56:40 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:fe98:4b55])
 by gabe.freedesktop.org (Postfix) with ESMTP id BD9EC6E247
 for <nouveau@lists.freedesktop.org>; Tue, 25 Jun 2019 20:56:39 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id BA09E72167; Tue, 25 Jun 2019 20:56:39 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: nouveau@lists.freedesktop.org
Date: Tue, 25 Jun 2019 20:56:39 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: xorg
X-Bugzilla-Component: Driver/nouveau
X-Bugzilla-Version: unspecified
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: lyude@redhat.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: nouveau@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-110997-8800-ISRNuPJwt7@http.bugs.freedesktop.org/>
In-Reply-To: <bug-110997-8800@http.bugs.freedesktop.org/>
References: <bug-110997-8800@http.bugs.freedesktop.org/>
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Subject: [Nouveau] [Bug 110997] NV50 fan runs at full speed after resume
 from suspend on kernels 5.1.8, 4.19.49
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
Content-Type: multipart/mixed; boundary="===============1012664950=="
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>


--===============1012664950==
Content-Type: multipart/alternative; boundary="15614961992.Cd06ABc.438"
Content-Transfer-Encoding: 7bit


--15614961992.Cd06ABc.438
Date: Tue, 25 Jun 2019 20:56:39 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D110997

--- Comment #1 from Lyude Paul <lyude@redhat.com> ---
Created attachment 144637
  --> https://bugs.freedesktop.org/attachment.cgi?id=3D144637&action=3Dedit
Fix for Tesla i2c regression

Hi! Turns out I actually have one of these GPUs in my drawer, so I was able=
 to
reproduce this issue with no problems. Could you verify that the following
patch fixes your issue? If so, I'll add your Tested-by and send it out onto=
 the
nouveau ML

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15614961992.Cd06ABc.438
Date: Tue, 25 Jun 2019 20:56:39 +0000
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
   title=3D"NEW - NV50 fan runs at full speed after resume from suspend on =
kernels 5.1.8, 4.19.49"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110997#c1">Commen=
t # 1</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - NV50 fan runs at full speed after resume from suspend on =
kernels 5.1.8, 4.19.49"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110997">bug 11099=
7</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
lyude&#64;redhat.com" title=3D"Lyude Paul &lt;lyude&#64;redhat.com&gt;"> <s=
pan class=3D"fn">Lyude Paul</span></a>
</span></b>
        <pre>Created <span class=3D""><a href=3D"attachment.cgi?id=3D144637=
" name=3D"attach_144637" title=3D"Fix for Tesla i2c regression">attachment =
144637</a> <a href=3D"attachment.cgi?id=3D144637&amp;action=3Dedit" title=
=3D"Fix for Tesla i2c regression">[details]</a></span> <a href=3D'page.cgi?=
id=3Dsplinter.html&amp;bug=3D110997&amp;attachment=3D144637'>[review]</a>
Fix for Tesla i2c regression

Hi! Turns out I actually have one of these GPUs in my drawer, so I was able=
 to
reproduce this issue with no problems. Could you verify that the following
patch fixes your issue? If so, I'll add your Tested-by and send it out onto=
 the
nouveau ML</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15614961992.Cd06ABc.438--

--===============1012664950==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1

--===============1012664950==--
