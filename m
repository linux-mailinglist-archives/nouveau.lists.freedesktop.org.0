Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 628F888CB3
	for <lists+nouveau@lfdr.de>; Sat, 10 Aug 2019 20:08:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F3C346E459;
	Sat, 10 Aug 2019 18:08:50 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:fe98:4b55])
 by gabe.freedesktop.org (Postfix) with ESMTP id 0F4996E459
 for <nouveau@lists.freedesktop.org>; Sat, 10 Aug 2019 18:08:49 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 0B64972167; Sat, 10 Aug 2019 18:08:49 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: nouveau@lists.freedesktop.org
Date: Sat, 10 Aug 2019 18:08:49 +0000
X-Bugzilla-Reason: AssignedTo QAcontact
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: Mesa
X-Bugzilla-Component: Drivers/DRI/nouveau
X-Bugzilla-Version: 19.1
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: imirkin@alum.mit.edu
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: nouveau@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-111213-8800-nZUNH7KYtp@http.bugs.freedesktop.org/>
In-Reply-To: <bug-111213-8800@http.bugs.freedesktop.org/>
References: <bug-111213-8800@http.bugs.freedesktop.org/>
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Subject: [Nouveau] [Bug 111213] VA-API nouveau SIGSEGV and asserts
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
Content-Type: multipart/mixed; boundary="===============1215615333=="
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>


--===============1215615333==
Content-Type: multipart/alternative; boundary="15654605290.D159EE5.17887"
Content-Transfer-Encoding: 7bit


--15654605290.D159EE5.17887
Date: Sat, 10 Aug 2019 18:08:48 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D111213

--- Comment #14 from Ilia Mirkin <imirkin@alum.mit.edu> ---
(In reply to KJ Liew from comment #13)
> Both VA-API and VDPAU do not play video on GK208B using mpv. There was on=
ly
> sound and black screen.
>=20
> Linux 5.2.7-arch1-1-ARCH
> local/libva-mesa-driver 19.1.4-1
> local/mesa 19.1.4-1
> local/mesa-demos 8.4.0-1
> local/mesa-vdpau 19.1.4-1
>=20
> $ LIBVA_DRIVER_NAME=3Dnouveau mpv --hwdec=3Dvaapi -vo=3Dvaapi /path/to/MP4
> Playing: /path/to/MP4
>  (+) Video --vid=3D1 (*) (h264 1280x720 23.976fps)
>  (+) Audio --aid=3D1 --alang=3Deng (*) (aac 2ch 44100Hz)
> Using hardware decoding (vaapi).
> AO: [pulse] 44100Hz stereo 2ch float
> VO: [vaapi] 1280x720 vaapi[nv12]
> nve4_set_surface_info:969 - unsupported surface format, try
> is_format_supported() !
> nve4_set_surface_info:969 - unsupported surface format, try
> is_format_supported() !
> nve4_set_surface_info:969 - unsupported surface format, try
> is_format_supported() !
> nve4_set_surface_info:969 - unsupported surface format, try
> is_format_supported() !
> nve4_set_surface_info:969 - unsupported surface format, try
> is_format_supported() !

Yep, I know about this. Needs yet another change... just need to figure out=
 how
to best resolve it.

>=20
> $ VDPAU_DRIVER=3Dnouveau mpv --hwdec=3Dvdpau -vo=3Dopengl /path/to/MP4=20
> Driver 'opengl' has been replaced with 'gpu'!
> Playing: /path/to/MP4
>  (+) Video --vid=3D1 (*) (h264 1280x720 23.976fps)
>  (+) Audio --aid=3D1 --alang=3Deng (*) (aac 2ch 44100Hz)
> Cannot load libcuda.so.1
> Using hardware decoding (vdpau).
> VO: [gpu] 1280x720 vdpau[yuv420p]
> AO: [pulse] 44100Hz stereo 2ch float
> AV: 00:00:12 / 00:02:03 (10%) A-V:  0.000

mpv doesn't seem to work, yeah. FWIW I'd expect -vo vdpau to work (not -vo
opengl, which is unlikely to work with vdpau decoding). But it doesn't, I g=
et
some kind of error (something is trying to submit a batch with an unregiste=
red
bo or something).

mplayer works fine though. See
https://nouveau.freedesktop.org/wiki/VideoAcceleration/ for instructions on=
 how
to use it.

--=20
You are receiving this mail because:
You are the assignee for the bug.
You are the QA Contact for the bug.=

--15654605290.D159EE5.17887
Date: Sat, 10 Aug 2019 18:08:49 +0000
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
   title=3D"NEW - VA-API nouveau SIGSEGV and asserts"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111213#c14">Comme=
nt # 14</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - VA-API nouveau SIGSEGV and asserts"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111213">bug 11121=
3</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
imirkin&#64;alum.mit.edu" title=3D"Ilia Mirkin &lt;imirkin&#64;alum.mit.edu=
&gt;"> <span class=3D"fn">Ilia Mirkin</span></a>
</span></b>
        <pre>(In reply to KJ Liew from <a href=3D"show_bug.cgi?id=3D111213#=
c13">comment #13</a>)
<span class=3D"quote">&gt; Both VA-API and VDPAU do not play video on GK208=
B using mpv. There was only
&gt; sound and black screen.
&gt;=20
&gt; Linux 5.2.7-arch1-1-ARCH
&gt; local/libva-mesa-driver 19.1.4-1
&gt; local/mesa 19.1.4-1
&gt; local/mesa-demos 8.4.0-1
&gt; local/mesa-vdpau 19.1.4-1
&gt;=20
&gt; $ LIBVA_DRIVER_NAME=3Dnouveau mpv --hwdec=3Dvaapi -vo=3Dvaapi /path/to=
/MP4
&gt; Playing: /path/to/MP4
&gt;  (+) Video --vid=3D1 (*) (h264 1280x720 23.976fps)
&gt;  (+) Audio --aid=3D1 --alang=3Deng (*) (aac 2ch 44100Hz)
&gt; Using hardware decoding (vaapi).
&gt; AO: [pulse] 44100Hz stereo 2ch float
&gt; VO: [vaapi] 1280x720 vaapi[nv12]
&gt; nve4_set_surface_info:969 - unsupported surface format, try
&gt; is_format_supported() !
&gt; nve4_set_surface_info:969 - unsupported surface format, try
&gt; is_format_supported() !
&gt; nve4_set_surface_info:969 - unsupported surface format, try
&gt; is_format_supported() !
&gt; nve4_set_surface_info:969 - unsupported surface format, try
&gt; is_format_supported() !
&gt; nve4_set_surface_info:969 - unsupported surface format, try
&gt; is_format_supported() !</span >

Yep, I know about this. Needs yet another change... just need to figure out=
 how
to best resolve it.

<span class=3D"quote">&gt;=20
&gt; $ VDPAU_DRIVER=3Dnouveau mpv --hwdec=3Dvdpau -vo=3Dopengl /path/to/MP4=
=20
&gt; Driver 'opengl' has been replaced with 'gpu'!
&gt; Playing: /path/to/MP4
&gt;  (+) Video --vid=3D1 (*) (h264 1280x720 23.976fps)
&gt;  (+) Audio --aid=3D1 --alang=3Deng (*) (aac 2ch 44100Hz)
&gt; Cannot load libcuda.so.1
&gt; Using hardware decoding (vdpau).
&gt; VO: [gpu] 1280x720 vdpau[yuv420p]
&gt; AO: [pulse] 44100Hz stereo 2ch float
&gt; AV: 00:00:12 / 00:02:03 (10%) A-V:  0.000</span >

mpv doesn't seem to work, yeah. FWIW I'd expect -vo vdpau to work (not -vo
opengl, which is unlikely to work with vdpau decoding). But it doesn't, I g=
et
some kind of error (something is trying to submit a batch with an unregiste=
red
bo or something).

mplayer works fine though. See
<a href=3D"https://nouveau.freedesktop.org/wiki/VideoAcceleration/">https:/=
/nouveau.freedesktop.org/wiki/VideoAcceleration/</a> for instructions on how
to use it.</pre>
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

--15654605290.D159EE5.17887--

--===============1215615333==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1

--===============1215615333==--
