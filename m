Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AB03765E57
	for <lists+nouveau@lfdr.de>; Thu, 11 Jul 2019 19:18:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A0FA6E267;
	Thu, 11 Jul 2019 17:18:06 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:fe98:4b55])
 by gabe.freedesktop.org (Postfix) with ESMTP id B1DEC6E26C
 for <nouveau@lists.freedesktop.org>; Thu, 11 Jul 2019 17:18:05 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id AEEB872167; Thu, 11 Jul 2019 17:18:05 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: nouveau@lists.freedesktop.org
Date: Thu, 11 Jul 2019 17:18:05 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: xorg
X-Bugzilla-Component: Driver/nouveau
X-Bugzilla-Version: unspecified
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: critical
X-Bugzilla-Who: karolherbst@gmail.com
X-Bugzilla-Status: REOPENED
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: nouveau@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-110714-8800-doG7zLPlYc@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============1506835889=="
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>


--===============1506835889==
Content-Type: multipart/alternative; boundary="15628654853.EFFAbE.14907"
Content-Transfer-Encoding: 7bit


--15628654853.EFFAbE.14907
Date: Thu, 11 Jul 2019 17:18:05 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D110714

--- Comment #10 from Karol Herbst <karolherbst@gmail.com> ---
(In reply to Peter Draganov from comment #9)
>  - What clients were running at the time the issue occurred
> Skype, System Monitor, Firefox, Mate Terminal, Libre Office, Caja, TigerV=
NC,
> Virtualbox, Pluma
>  - Any special x11 client that can reproduce?
> have no idea
>  - Any particular action that triggers the issue?
> Usually crashes during the night, when a black screen saver is running, b=
ut
> it happened several times during the day, when I worked
>  - which desktop environment/window manager?
> LightDM/MATE
>=20
> Basically, anything that could help reproducing...
> Just leave X running long enough time - usually after 2-3 days without
> restart

what GPU do you have? I am especially interested in the amount of VRAM it h=
as.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15628654853.EFFAbE.14907
Date: Thu, 11 Jul 2019 17:18:05 +0000
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
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110714#c10">Comme=
nt # 10</a>
              on <a class=3D"bz_bug_link=20
          bz_status_REOPENED "
   title=3D"REOPENED - Xorg crashes randomly because of memory leak"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110714">bug 11071=
4</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
karolherbst&#64;gmail.com" title=3D"Karol Herbst &lt;karolherbst&#64;gmail.=
com&gt;"> <span class=3D"fn">Karol Herbst</span></a>
</span></b>
        <pre>(In reply to Peter Draganov from <a href=3D"show_bug.cgi?id=3D=
110714#c9">comment #9</a>)
<span class=3D"quote">&gt;  - What clients were running at the time the iss=
ue occurred
&gt; Skype, System Monitor, Firefox, Mate Terminal, Libre Office, Caja, Tig=
erVNC,
&gt; Virtualbox, Pluma
&gt;  - Any special x11 client that can reproduce?
&gt; have no idea
&gt;  - Any particular action that triggers the issue?
&gt; Usually crashes during the night, when a black screen saver is running=
, but
&gt; it happened several times during the day, when I worked
&gt;  - which desktop environment/window manager?
&gt; LightDM/MATE
&gt;=20
&gt; Basically, anything that could help reproducing...
&gt; Just leave X running long enough time - usually after 2-3 days without
&gt; restart</span >

what GPU do you have? I am especially interested in the amount of VRAM it h=
as.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15628654853.EFFAbE.14907--

--===============1506835889==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1

--===============1506835889==--
