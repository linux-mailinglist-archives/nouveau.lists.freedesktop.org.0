Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D6A529B76
	for <lists+nouveau@lfdr.de>; Fri, 24 May 2019 17:48:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB75A6E0BE;
	Fri, 24 May 2019 15:48:27 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:fe98:4b55])
 by gabe.freedesktop.org (Postfix) with ESMTP id EFEE36E0C9
 for <nouveau@lists.freedesktop.org>; Fri, 24 May 2019 15:48:26 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id ECF9372167; Fri, 24 May 2019 15:48:26 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: nouveau@lists.freedesktop.org
Date: Fri, 24 May 2019 15:48:27 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: xorg
X-Bugzilla-Component: Driver/nouveau
X-Bugzilla-Version: unspecified
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: dominik@greysector.net
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: nouveau@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-110748-8800-SYEo5qr7ox@http.bugs.freedesktop.org/>
In-Reply-To: <bug-110748-8800@http.bugs.freedesktop.org/>
References: <bug-110748-8800@http.bugs.freedesktop.org/>
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Subject: [Nouveau] [Bug 110748] [NVC1] [optimus] fifo: read fault at
 0000000000 engine 00 [PGRAPH] client 00 [] reason 02 [PAGE_NOT_PRESENT]
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
Content-Type: multipart/mixed; boundary="===============0085414664=="
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>


--===============0085414664==
Content-Type: multipart/alternative; boundary="15587129062.6e1d7.2255"
Content-Transfer-Encoding: 7bit


--15587129062.6e1d7.2255
Date: Fri, 24 May 2019 15:48:26 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D110748

--- Comment #3 from Dominik 'Rathann' Mierzejewski <dominik@greysector.net>=
 ---
With
mplayer -vo vdpau -vc ffh264vdpau
I don't get a corrupted video, but I get the same errors as with
mpv --vo=3Dvdpau --hwdec=3Dvdpau
kernel-5.0.16-300.fc30.x86_64
libdrm-2.4.98-1.fc30.x86_64
libvdpau-1.2-1.fc30.x86_64
mpv-0.29.1-5.fc30.x86_64
mplayer-1.4-1.fc30.x86_64
xorg-x11-drv-nouveau-1.0.15-7.fc30.x86_64
ffmpeg-4.1.3-2.fc30.x86_64

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15587129062.6e1d7.2255
Date: Fri, 24 May 2019 15:48:26 +0000
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
   title=3D"NEW - [NVC1] [optimus] fifo: read fault at 0000000000 engine 00=
 [PGRAPH] client 00 [] reason 02 [PAGE_NOT_PRESENT]"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110748#c3">Commen=
t # 3</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - [NVC1] [optimus] fifo: read fault at 0000000000 engine 00=
 [PGRAPH] client 00 [] reason 02 [PAGE_NOT_PRESENT]"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110748">bug 11074=
8</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
dominik&#64;greysector.net" title=3D"Dominik 'Rathann' Mierzejewski &lt;dom=
inik&#64;greysector.net&gt;"> <span class=3D"fn">Dominik 'Rathann' Mierzeje=
wski</span></a>
</span></b>
        <pre>With
mplayer -vo vdpau -vc ffh264vdpau
I don't get a corrupted video, but I get the same errors as with
mpv --vo=3Dvdpau --hwdec=3Dvdpau
kernel-5.0.16-300.fc30.x86_64
libdrm-2.4.98-1.fc30.x86_64
libvdpau-1.2-1.fc30.x86_64
mpv-0.29.1-5.fc30.x86_64
mplayer-1.4-1.fc30.x86_64
xorg-x11-drv-nouveau-1.0.15-7.fc30.x86_64
ffmpeg-4.1.3-2.fc30.x86_64</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15587129062.6e1d7.2255--

--===============0085414664==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1

--===============0085414664==--
