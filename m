Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F6B110E157
	for <lists+nouveau@lfdr.de>; Sun,  1 Dec 2019 11:06:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A98786E04B;
	Sun,  1 Dec 2019 10:06:03 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:fe98:4b55])
 by gabe.freedesktop.org (Postfix) with ESMTP id 2A7306E15D
 for <nouveau@lists.freedesktop.org>; Sun,  1 Dec 2019 10:06:02 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id E0166720E2; Sun,  1 Dec 2019 10:06:01 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: nouveau@lists.freedesktop.org
Date: Sun, 01 Dec 2019 10:06:01 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: xorg
X-Bugzilla-Component: Driver/nouveau
X-Bugzilla-Version: unspecified
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: axet@me.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: nouveau@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-110660-8800-nSL93H0avP@http.bugs.freedesktop.org/>
In-Reply-To: <bug-110660-8800@http.bugs.freedesktop.org/>
References: <bug-110660-8800@http.bugs.freedesktop.org/>
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Subject: [Nouveau] [Bug 110660] GeForce GT 750M Mac Edition fullscreen issues
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
Content-Type: multipart/mixed; boundary="===============1168146351=="
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>


--===============1168146351==
Content-Type: multipart/alternative; boundary="15751947610.b93B088.24790"
Content-Transfer-Encoding: 7bit


--15751947610.b93B088.24790
Date: Sun, 1 Dec 2019 10:06:01 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D110660

--- Comment #43 from Alexey Kuznetsov <axet@me.com> ---
Created attachment 146055
  --> https://bugs.freedesktop.org/attachment.cgi?id=3D146055&action=3Dedit
LVDS/eDP mode fix

For some reason kernel 5.3.0 end up with your 'adjusted_mode' patch instead
correct 'mode' patch. As result recent Ubuntu 9.10 (which I'm testing right
now) still have problem with 9 displays... That quite strange since I expect
this issue was fixed. I've checked kernel sources (for Ubuntu 19.10 kernel
5.3.0-23-generic), patch f8d6211ac (drm/nouveau/disp/nv50-: force scaler for
any non-default LVDS/eDP modes) indeed persisted but with your first attempt
fixing the issue!

I did manually rebuild kernel 'mode' and it works again!

Not sure what I have to do here...

  * https://git.launchpad.net/~ubuntu-kernel/ubuntu/+source/linux/+git/eoan/
  *
https://git.launchpad.net/~ubuntu-kernel/ubuntu/+source/linux/+git/eoan/com=
mit/?id=3Df8d6211ac77f0d1f7aebc64e961dc28771ba0052

Here MY patch ;)

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15751947610.b93B088.24790
Date: Sun, 1 Dec 2019 10:06:01 +0000
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
   title=3D"NEW - GeForce GT 750M Mac Edition fullscreen issues"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110660#c43">Comme=
nt # 43</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - GeForce GT 750M Mac Edition fullscreen issues"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110660">bug 11066=
0</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
axet&#64;me.com" title=3D"Alexey Kuznetsov &lt;axet&#64;me.com&gt;"> <span =
class=3D"fn">Alexey Kuznetsov</span></a>
</span></b>
        <pre>Created <span class=3D""><a href=3D"attachment.cgi?id=3D146055=
" name=3D"attach_146055" title=3D"LVDS/eDP mode fix">attachment 146055</a> =
<a href=3D"attachment.cgi?id=3D146055&amp;action=3Dedit" title=3D"LVDS/eDP =
mode fix">[details]</a></span> <a href=3D'page.cgi?id=3Dsplinter.html&amp;b=
ug=3D110660&amp;attachment=3D146055'>[review]</a>
LVDS/eDP mode fix

For some reason kernel 5.3.0 end up with your 'adjusted_mode' patch instead
correct 'mode' patch. As result recent Ubuntu 9.10 (which I'm testing right
now) still have problem with 9 displays... That quite strange since I expect
this issue was fixed. I've checked kernel sources (for Ubuntu 19.10 kernel
5.3.0-23-generic), patch f8d6211ac (drm/nouveau/disp/nv50-: force scaler for
any non-default LVDS/eDP modes) indeed persisted but with your first attempt
fixing the issue!

I did manually rebuild kernel 'mode' and it works again!

Not sure what I have to do here...

  * <a href=3D"https://git.launchpad.net/~ubuntu-kernel/ubuntu/+source/linu=
x/+git/eoan/">https://git.launchpad.net/~ubuntu-kernel/ubuntu/+source/linux=
/+git/eoan/</a>
  *
<a href=3D"https://git.launchpad.net/~ubuntu-kernel/ubuntu/+source/linux/+g=
it/eoan/commit/?id=3Df8d6211ac77f0d1f7aebc64e961dc28771ba0052">https://git.=
launchpad.net/~ubuntu-kernel/ubuntu/+source/linux/+git/eoan/commit/?id=3Df8=
d6211ac77f0d1f7aebc64e961dc28771ba0052</a>

Here MY patch ;)</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15751947610.b93B088.24790--

--===============1168146351==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1

--===============1168146351==--
