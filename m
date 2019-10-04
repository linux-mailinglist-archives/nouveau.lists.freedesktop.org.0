Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 828F2CB2B4
	for <lists+nouveau@lfdr.de>; Fri,  4 Oct 2019 02:21:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F4C06EA9C;
	Fri,  4 Oct 2019 00:21:27 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [131.252.210.165])
 by gabe.freedesktop.org (Postfix) with ESMTP id 960C06EA9A
 for <nouveau@lists.freedesktop.org>; Fri,  4 Oct 2019 00:21:25 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 9295472162; Fri,  4 Oct 2019 00:21:25 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: nouveau@lists.freedesktop.org
Date: Fri, 04 Oct 2019 00:21:25 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: xorg
X-Bugzilla-Component: Driver/nouveau
X-Bugzilla-Version: unspecified
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: dan@reactivated.net
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: nouveau@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-75985-8800-GVwJHcKCx6@http.bugs.freedesktop.org/>
In-Reply-To: <bug-75985-8800@http.bugs.freedesktop.org/>
References: <bug-75985-8800@http.bugs.freedesktop.org/>
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Subject: [Nouveau] [Bug 75985] [NVC1] HDMI audio device only visible after
 rescan
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
Content-Type: multipart/mixed; boundary="===============1023314915=="
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>


--===============1023314915==
Content-Type: multipart/alternative; boundary="15701484852.2DC708.6322"
Content-Transfer-Encoding: 7bit


--15701484852.2DC708.6322
Date: Fri, 4 Oct 2019 00:21:25 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D75985

--- Comment #108 from Daniel Drake <dan@reactivated.net> ---
If codec devices are always child devices of the controller, then I also wo=
nder
if codec_powered could be completely removed.

Seems like the PM core already ensures the children are inactive before
suspending the controller:

> The idle callback (a subsystem-level one, if present, or the driver one) =
is
> executed by the PM core whenever the device appears to be idle, which is
> indicated to the PM core by two counters, the device's usage counter and =
the
> counter of 'active' children of the device.
>=20
>   * If any of these counters is decreased using a helper function provide=
d by
>     the PM core and it turns out to be equal to zero, the other counter is
>     checked.  If that counter also is equal to zero, the PM core executes=
 the
>     idle callback with the device as its argument.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15701484852.2DC708.6322
Date: Fri, 4 Oct 2019 00:21:25 +0000
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
   title=3D"NEW - [NVC1] HDMI audio device only visible after rescan"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D75985#c108">Comme=
nt # 108</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - [NVC1] HDMI audio device only visible after rescan"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D75985">bug 75985<=
/a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
dan&#64;reactivated.net" title=3D"Daniel Drake &lt;dan&#64;reactivated.net&=
gt;"> <span class=3D"fn">Daniel Drake</span></a>
</span></b>
        <pre>If codec devices are always child devices of the controller, t=
hen I also wonder
if codec_powered could be completely removed.

Seems like the PM core already ensures the children are inactive before
suspending the controller:

<span class=3D"quote">&gt; The idle callback (a subsystem-level one, if pre=
sent, or the driver one) is
&gt; executed by the PM core whenever the device appears to be idle, which =
is
&gt; indicated to the PM core by two counters, the device's usage counter a=
nd the
&gt; counter of 'active' children of the device.
&gt;=20
&gt;   * If any of these counters is decreased using a helper function prov=
ided by
&gt;     the PM core and it turns out to be equal to zero, the other counte=
r is
&gt;     checked.  If that counter also is equal to zero, the PM core execu=
tes the
&gt;     idle callback with the device as its argument.</span ></pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15701484852.2DC708.6322--

--===============1023314915==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1

--===============1023314915==--
