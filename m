Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5ABF988EEB
	for <lists+nouveau@lfdr.de>; Sun, 11 Aug 2019 02:31:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE6F76E46D;
	Sun, 11 Aug 2019 00:31:49 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [131.252.210.165])
 by gabe.freedesktop.org (Postfix) with ESMTP id 947026E46D
 for <nouveau@lists.freedesktop.org>; Sun, 11 Aug 2019 00:31:48 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 8FC3F72167; Sun, 11 Aug 2019 00:31:48 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: nouveau@lists.freedesktop.org
Date: Sun, 11 Aug 2019 00:31:48 +0000
X-Bugzilla-Reason: QAcontact AssignedTo
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
Message-ID: <bug-111213-8800-44GTvAS6El@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============0869785319=="
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>


--===============0869785319==
Content-Type: multipart/alternative; boundary="15654835081.6F4a7F.14018"
Content-Transfer-Encoding: 7bit


--15654835081.6F4a7F.14018
Date: Sun, 11 Aug 2019 00:31:48 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D111213

--- Comment #16 from Ilia Mirkin <imirkin@alum.mit.edu> ---
(In reply to KJ Liew from comment #15)
> (In reply to Ilia Mirkin from comment #14)
> > > $ VDPAU_DRIVER=3Dnouveau mpv --hwdec=3Dvdpau -vo=3Dopengl /path/to/MP=
4=20
> > > Driver 'opengl' has been replaced with 'gpu'!
> > > Playing: /path/to/MP4
> > >  (+) Video --vid=3D1 (*) (h264 1280x720 23.976fps)
> > >  (+) Audio --aid=3D1 --alang=3Deng (*) (aac 2ch 44100Hz)
> > > Cannot load libcuda.so.1
> > > Using hardware decoding (vdpau).
> > > VO: [gpu] 1280x720 vdpau[yuv420p]
> > > AO: [pulse] 44100Hz stereo 2ch float
> > > AV: 00:00:12 / 00:02:03 (10%) A-V:  0.000
> >=20
> > mpv doesn't seem to work, yeah. FWIW I'd expect -vo vdpau to work (not =
-vo
> > opengl,
>=20
> It works for r600 and radeonsi on my 2 other laptops using mpv and the sa=
me
> command-line using -vo gpu. I think it also works with Geforce9300/Nouveau
> but need to double check again.

Apologies - I should have clarified I was talking about nouveau specificall=
y.
The issue is multi-threaded submission, which mpv (at least at one point)
attempted to do with hwdec + video output in separate threads.

mpv -vo vdpau --hwdec vdpau should work. But it doesn't, at least not in my
testing. Hits an assert in libdrm about rather incorrect usage. Haven't
investigated it though.

Like I said, this works fine with mplayer. This is my preferred player, so I
tend not to go much further.

--=20
You are receiving this mail because:
You are the QA Contact for the bug.
You are the assignee for the bug.=

--15654835081.6F4a7F.14018
Date: Sun, 11 Aug 2019 00:31:48 +0000
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
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111213#c16">Comme=
nt # 16</a>
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
c15">comment #15</a>)
<span class=3D"quote">&gt; (In reply to Ilia Mirkin from <a href=3D"show_bu=
g.cgi?id=3D111213#c14">comment #14</a>)
&gt; &gt; &gt; $ VDPAU_DRIVER=3Dnouveau mpv --hwdec=3Dvdpau -vo=3Dopengl /p=
ath/to/MP4=20
&gt; &gt; &gt; Driver 'opengl' has been replaced with 'gpu'!
&gt; &gt; &gt; Playing: /path/to/MP4
&gt; &gt; &gt;  (+) Video --vid=3D1 (*) (h264 1280x720 23.976fps)
&gt; &gt; &gt;  (+) Audio --aid=3D1 --alang=3Deng (*) (aac 2ch 44100Hz)
&gt; &gt; &gt; Cannot load libcuda.so.1
&gt; &gt; &gt; Using hardware decoding (vdpau).
&gt; &gt; &gt; VO: [gpu] 1280x720 vdpau[yuv420p]
&gt; &gt; &gt; AO: [pulse] 44100Hz stereo 2ch float
&gt; &gt; &gt; AV: 00:00:12 / 00:02:03 (10%) A-V:  0.000
&gt; &gt;=20
&gt; &gt; mpv doesn't seem to work, yeah. FWIW I'd expect -vo vdpau to work=
 (not -vo
&gt; &gt; opengl,
&gt;=20
&gt; It works for r600 and radeonsi on my 2 other laptops using mpv and the=
 same
&gt; command-line using -vo gpu. I think it also works with Geforce9300/Nou=
veau
&gt; but need to double check again.</span >

Apologies - I should have clarified I was talking about nouveau specificall=
y.
The issue is multi-threaded submission, which mpv (at least at one point)
attempted to do with hwdec + video output in separate threads.

mpv -vo vdpau --hwdec vdpau should work. But it doesn't, at least not in my
testing. Hits an assert in libdrm about rather incorrect usage. Haven't
investigated it though.

Like I said, this works fine with mplayer. This is my preferred player, so I
tend not to go much further.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the QA Contact for the bug.</li>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15654835081.6F4a7F.14018--

--===============0869785319==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1

--===============0869785319==--
