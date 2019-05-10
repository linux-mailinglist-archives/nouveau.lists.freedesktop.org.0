Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 920F21A0F8
	for <lists+nouveau@lfdr.de>; Fri, 10 May 2019 18:07:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D84EE897EF;
	Fri, 10 May 2019 16:07:00 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [131.252.210.165])
 by gabe.freedesktop.org (Postfix) with ESMTP id 6D45989F41
 for <nouveau@lists.freedesktop.org>; Fri, 10 May 2019 16:06:59 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 694FD7215A; Fri, 10 May 2019 16:06:59 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: nouveau@lists.freedesktop.org
Date: Fri, 10 May 2019 16:06:59 +0000
X-Bugzilla-Reason: AssignedTo QAcontact
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: Mesa
X-Bugzilla-Component: Drivers/DRI/nouveau
X-Bugzilla-Version: unspecified
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: imirkin@alum.mit.edu
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: nouveau@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-110660-8800-0pZzDkheyC@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============0831337576=="
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>


--===============0831337576==
Content-Type: multipart/alternative; boundary="15575044191.99d5f8.12275"
Content-Transfer-Encoding: 7bit


--15575044191.99d5f8.12275
Date: Fri, 10 May 2019 16:06:59 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D110660

--- Comment #9 from Ilia Mirkin <imirkin@alum.mit.edu> ---
(In reply to Alexey Kuznetsov from comment #8)
> Created attachment 144220 [details]
> lightdm xorg logs
>=20
> I switched from gdm to lightdm and "No such file or directory" gone. Than=
ks
> to https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=3D748463 and 'sudo l=
sof
> /dev/dri/card0'
>=20
> But graphics issues are the same!

OK well those logs look MUCH happier.

Now ... that "panel gets messed up with vertical white lines" thing is weir=
d.
That feels like that would happen on a modeswitch, e.g. when switching into
full-screen mode of a game that's not running at 2880x1800, you want to cha=
nge
resolutions. (e.g. to 1024x768).

Looks like we're not providing some setting quite right. Perhaps the panel
needs us to do scaling... here are the valid modes reported:

[    36.683] (II) NOUVEAU(0): Modeline "2880x1800"x60.0  337.75  2880 2928 =
2960
3040  1800 1803 1809 1852 +hsync -vsync (111.1 kHz eP)
[    36.683] (II) NOUVEAU(0): Modeline "1920x1200"x60.0  193.48  1920 2056 =
2256
2592  1200 1203 1209 1245 -hsync +vsync (74.6 kHz)
[    36.683] (II) NOUVEAU(0): Modeline "1920x1080"x60.0  173.11  1920 2048 =
2248
2576  1080 1083 1088 1120 -hsync +vsync (67.2 kHz)
[    36.683] (II) NOUVEAU(0): Modeline "1600x1200"x60.0  161.23  1600 1712 =
1880
2160  1200 1203 1207 1245 -hsync +vsync (74.6 kHz)
[    36.683] (II) NOUVEAU(0): Modeline "1680x1050"x60.0  146.36  1680 1784 =
1960
2240  1050 1053 1059 1089 -hsync +vsync (65.3 kHz)
[    36.683] (II) NOUVEAU(0): Modeline "1400x1050"x60.0  121.79  1400 1488 =
1632
1864  1050 1053 1057 1089 -hsync +vsync (65.3 kHz)
[    36.683] (II) NOUVEAU(0): Modeline "1280x1024"x59.9  109.10  1280 1368 =
1496
1712  1024 1027 1034 1063 -hsync +vsync (63.7 kHz)
[    36.683] (II) NOUVEAU(0): Modeline "1280x960"x60.0  101.34  1280 1360 1=
488
1696  960 963 967 996 -hsync +vsync (59.8 kHz)
[    36.683] (II) NOUVEAU(0): Modeline "1152x864"x60.0   81.77  1152 1216 1=
336
1520  864 867 871 897 -hsync +vsync (53.8 kHz)
[    36.683] (II) NOUVEAU(0): Modeline "1024x768"x59.9   63.53  1024 1072 1=
176
1328  768 771 775 798 -hsync +vsync (47.8 kHz)
[    36.683] (II) NOUVEAU(0): Modeline "800x600"x60.0   38.31  800 832 912 =
1024
 600 603 607 624 -hsync +vsync (37.4 kHz)
[    36.683] (II) NOUVEAU(0): Modeline "640x480"x59.9   23.98  640 664 720 =
800=20
480 483 487 500 -hsync +vsync (30.0 kHz)
[    36.683] (II) NOUVEAU(0): Modeline "720x400"x60.0   22.41  720 744 808 =
896=20
400 403 413 417 -hsync +vsync (25.0 kHz)
[    36.683] (II) NOUVEAU(0): Modeline "640x400"x60.0   20.00  640 664 720 =
800=20
400 403 409 417 -hsync +vsync (25.0 kHz)
[    36.683] (II) NOUVEAU(0): Modeline "640x350"x59.8   17.52  640 664 720 =
800=20
350 353 363 366 -hsync +vsync (21.9 kHz)

Can you try, one-by-one, switching to them (e.g. with xrandr -s 1920x1200) =
and
seeing if that's what causes the screwup? Is it only some modes, or any
non-2880x1800 mode?

--=20
You are receiving this mail because:
You are the assignee for the bug.
You are the QA Contact for the bug.=

--15575044191.99d5f8.12275
Date: Fri, 10 May 2019 16:06:59 +0000
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
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110660#c9">Commen=
t # 9</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - GeForce GT 750M Mac Edition fullscreen issues"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110660">bug 11066=
0</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
imirkin&#64;alum.mit.edu" title=3D"Ilia Mirkin &lt;imirkin&#64;alum.mit.edu=
&gt;"> <span class=3D"fn">Ilia Mirkin</span></a>
</span></b>
        <pre>(In reply to Alexey Kuznetsov from <a href=3D"show_bug.cgi?id=
=3D110660#c8">comment #8</a>)
<span class=3D"quote">&gt; Created <span class=3D""><a href=3D"attachment.c=
gi?id=3D144220" name=3D"attach_144220" title=3D"lightdm xorg logs">attachme=
nt 144220</a> <a href=3D"attachment.cgi?id=3D144220&amp;action=3Dedit" titl=
e=3D"lightdm xorg logs">[details]</a></span>
&gt; lightdm xorg logs
&gt;=20
&gt; I switched from gdm to lightdm and &quot;No such file or directory&quo=
t; gone. Thanks
&gt; to <a href=3D"https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=3D7484=
63">https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=3D748463</a> and 'sud=
o lsof
&gt; /dev/dri/card0'
&gt;=20
&gt; But graphics issues are the same!</span >

OK well those logs look MUCH happier.

Now ... that &quot;panel gets messed up with vertical white lines&quot; thi=
ng is weird.
That feels like that would happen on a modeswitch, e.g. when switching into
full-screen mode of a game that's not running at 2880x1800, you want to cha=
nge
resolutions. (e.g. to 1024x768).

Looks like we're not providing some setting quite right. Perhaps the panel
needs us to do scaling... here are the valid modes reported:

[    36.683] (II) NOUVEAU(0): Modeline &quot;2880x1800&quot;x60.0  337.75  =
2880 2928 2960
3040  1800 1803 1809 1852 +hsync -vsync (111.1 kHz eP)
[    36.683] (II) NOUVEAU(0): Modeline &quot;1920x1200&quot;x60.0  193.48  =
1920 2056 2256
2592  1200 1203 1209 1245 -hsync +vsync (74.6 kHz)
[    36.683] (II) NOUVEAU(0): Modeline &quot;1920x1080&quot;x60.0  173.11  =
1920 2048 2248
2576  1080 1083 1088 1120 -hsync +vsync (67.2 kHz)
[    36.683] (II) NOUVEAU(0): Modeline &quot;1600x1200&quot;x60.0  161.23  =
1600 1712 1880
2160  1200 1203 1207 1245 -hsync +vsync (74.6 kHz)
[    36.683] (II) NOUVEAU(0): Modeline &quot;1680x1050&quot;x60.0  146.36  =
1680 1784 1960
2240  1050 1053 1059 1089 -hsync +vsync (65.3 kHz)
[    36.683] (II) NOUVEAU(0): Modeline &quot;1400x1050&quot;x60.0  121.79  =
1400 1488 1632
1864  1050 1053 1057 1089 -hsync +vsync (65.3 kHz)
[    36.683] (II) NOUVEAU(0): Modeline &quot;1280x1024&quot;x59.9  109.10  =
1280 1368 1496
1712  1024 1027 1034 1063 -hsync +vsync (63.7 kHz)
[    36.683] (II) NOUVEAU(0): Modeline &quot;1280x960&quot;x60.0  101.34  1=
280 1360 1488
1696  960 963 967 996 -hsync +vsync (59.8 kHz)
[    36.683] (II) NOUVEAU(0): Modeline &quot;1152x864&quot;x60.0   81.77  1=
152 1216 1336
1520  864 867 871 897 -hsync +vsync (53.8 kHz)
[    36.683] (II) NOUVEAU(0): Modeline &quot;1024x768&quot;x59.9   63.53  1=
024 1072 1176
1328  768 771 775 798 -hsync +vsync (47.8 kHz)
[    36.683] (II) NOUVEAU(0): Modeline &quot;800x600&quot;x60.0   38.31  80=
0 832 912 1024
 600 603 607 624 -hsync +vsync (37.4 kHz)
[    36.683] (II) NOUVEAU(0): Modeline &quot;640x480&quot;x59.9   23.98  64=
0 664 720 800=20
480 483 487 500 -hsync +vsync (30.0 kHz)
[    36.683] (II) NOUVEAU(0): Modeline &quot;720x400&quot;x60.0   22.41  72=
0 744 808 896=20
400 403 413 417 -hsync +vsync (25.0 kHz)
[    36.683] (II) NOUVEAU(0): Modeline &quot;640x400&quot;x60.0   20.00  64=
0 664 720 800=20
400 403 409 417 -hsync +vsync (25.0 kHz)
[    36.683] (II) NOUVEAU(0): Modeline &quot;640x350&quot;x59.8   17.52  64=
0 664 720 800=20
350 353 363 366 -hsync +vsync (21.9 kHz)

Can you try, one-by-one, switching to them (e.g. with xrandr -s 1920x1200) =
and
seeing if that's what causes the screwup? Is it only some modes, or any
non-2880x1800 mode?</pre>
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

--15575044191.99d5f8.12275--

--===============0831337576==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1

--===============0831337576==--
