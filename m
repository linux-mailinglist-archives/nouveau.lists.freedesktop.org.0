Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FCA1396C8
	for <lists+nouveau@lfdr.de>; Fri,  7 Jun 2019 22:25:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F20B89343;
	Fri,  7 Jun 2019 20:25:35 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [131.252.210.165])
 by gabe.freedesktop.org (Postfix) with ESMTP id 37E94890EA
 for <nouveau@lists.freedesktop.org>; Fri,  7 Jun 2019 20:25:34 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 33EE572167; Fri,  7 Jun 2019 20:25:34 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: nouveau@lists.freedesktop.org
Date: Fri, 07 Jun 2019 20:25:34 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: xorg
X-Bugzilla-Component: Driver/nouveau
X-Bugzilla-Version: 7.7 (2012.06)
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: mszpak@wp.pl
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: nouveau@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-110830-8800-tB5m8NXIXf@http.bugs.freedesktop.org/>
In-Reply-To: <bug-110830-8800@http.bugs.freedesktop.org/>
References: <bug-110830-8800@http.bugs.freedesktop.org/>
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Subject: [Nouveau] [Bug 110830] [nouveau] GeForce GTX 1660 Ti (mobile) not
 supported (NV168/TU116)
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
Content-Type: multipart/mixed; boundary="===============0069313640=="
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>


--===============0069313640==
Content-Type: multipart/alternative; boundary="15599391342.2bBb.29286"
Content-Transfer-Encoding: 7bit


--15599391342.2bBb.29286
Date: Fri, 7 Jun 2019 20:25:34 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D110830

--- Comment #7 from Marcin Zajaczkowski <mszpak@wp.pl> ---
(In reply to Ilia Mirkin from comment #6)
> (In reply to Marcin Zajaczkowski from comment #4)
> > Of course it didn't make sense to turn it on, as it was already turned =
on
> > (DynPwr) in my case :) ). I can switch it off with vgaswitcheroo (or at
> > least to be reported as DynOff - I will check it later with powertop) w=
hen
> > no external output is connected. And what I missed in my previous comme=
nt -
> > the external monitor works out-of-box, which is nice progress.
>=20
> vgaswitcheroo explicit control is for hard muxes. These were popular 2005=
 to
> 2010 or so. You just have 2 GPUs. vgaswitcheroo reports whether they're on
> or off, but that control is performed dynamically by the driver based on
> usage.

You are right. Afew seconds after an external monitor is disconnected the
discrete card becomes DynOff.

I have a hard mux in my (quite) old Asus. I can use only the Intel card to =
save
energy and the Nvidia card is used only occasionally for CUDA and gaming. I
wonder why in multiple laptops nowadays the outputs are wired to one card
limiting the aforementioned use case? What are the benefits of that (assumi=
ng
the modern Intel can handle 3 displays enabled at the same time)?

> > There are also no reported providers in xrandr:
> > > $ xrandr --listproviders
> > > Providers: number: 0
>=20
> This is incredibly odd -- there must always be at least 1! Are you running
> Xwayland or something? If so, the displays would be controlled through yo=
ur
> wayland compositor. You can check that kms is working:

Yes, it was Wayland. With Xorg I see two providers:

> Providers: number : 2
> Provider 0: id: 0x6b cap: 0xf, Source Output, Sink Output, Source Offload=
, Sink Offload crtcs: 3 outputs: 3 associated providers: 1 name:modesetting
> Provider 1: id: 0x45 cap: 0x2, Sink Output crtcs: 4 outputs: 2 associated=
 providers: 1 name:modesetting

Hmm, why there are 3 and 4 outputs associated to them? Is it possible that =
DP
output is accessible with the Intel card only (I don't have a connector rig=
ht
here to test it organoleptically)?

>=20
> grep . /sys/class/drm/card*-*/status
>=20
> You should see some card0-* and card1-* entries.

Yes, I see different outputs.
> /sys/class/drm/card0-DP-1/status:disconnected
> /sys/class/drm/card0-eDP-1/status:connected
> /sys/class/drm/card0-HDMI-A-1/status:disconnected
> /sys/class/drm/card1-DP-2/status:disconnected
> /sys/class/drm/card1-HDMI-A-2/status:disconnected

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15599391342.2bBb.29286
Date: Fri, 7 Jun 2019 20:25:34 +0000
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
   title=3D"NEW - [nouveau] GeForce GTX 1660 Ti (mobile) not supported (NV1=
68/TU116)"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110830#c7">Commen=
t # 7</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - [nouveau] GeForce GTX 1660 Ti (mobile) not supported (NV1=
68/TU116)"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110830">bug 11083=
0</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
mszpak&#64;wp.pl" title=3D"Marcin Zajaczkowski &lt;mszpak&#64;wp.pl&gt;"> <=
span class=3D"fn">Marcin Zajaczkowski</span></a>
</span></b>
        <pre>(In reply to Ilia Mirkin from <a href=3D"show_bug.cgi?id=3D110=
830#c6">comment #6</a>)
<span class=3D"quote">&gt; (In reply to Marcin Zajaczkowski from <a href=3D=
"show_bug.cgi?id=3D110830#c4">comment #4</a>)
&gt; &gt; Of course it didn't make sense to turn it on, as it was already t=
urned on
&gt; &gt; (DynPwr) in my case :) ). I can switch it off with vgaswitcheroo =
(or at
&gt; &gt; least to be reported as DynOff - I will check it later with power=
top) when
&gt; &gt; no external output is connected. And what I missed in my previous=
 comment -
&gt; &gt; the external monitor works out-of-box, which is nice progress.
&gt;=20
&gt; vgaswitcheroo explicit control is for hard muxes. These were popular 2=
005 to
&gt; 2010 or so. You just have 2 GPUs. vgaswitcheroo reports whether they'r=
e on
&gt; or off, but that control is performed dynamically by the driver based =
on
&gt; usage.</span >

You are right. Afew seconds after an external monitor is disconnected the
discrete card becomes DynOff.

I have a hard mux in my (quite) old Asus. I can use only the Intel card to =
save
energy and the Nvidia card is used only occasionally for CUDA and gaming. I
wonder why in multiple laptops nowadays the outputs are wired to one card
limiting the aforementioned use case? What are the benefits of that (assumi=
ng
the modern Intel can handle 3 displays enabled at the same time)?

<span class=3D"quote">&gt; &gt; There are also no reported providers in xra=
ndr:
&gt; &gt; &gt; $ xrandr --listproviders
&gt; &gt; &gt; Providers: number: 0
&gt;=20
&gt; This is incredibly odd -- there must always be at least 1! Are you run=
ning
&gt; Xwayland or something? If so, the displays would be controlled through=
 your
&gt; wayland compositor. You can check that kms is working:</span >

Yes, it was Wayland. With Xorg I see two providers:

<span class=3D"quote">&gt; Providers: number : 2
&gt; Provider 0: id: 0x6b cap: 0xf, Source Output, Sink Output, Source Offl=
oad, Sink Offload crtcs: 3 outputs: 3 associated providers: 1 name:modesett=
ing
&gt; Provider 1: id: 0x45 cap: 0x2, Sink Output crtcs: 4 outputs: 2 associa=
ted providers: 1 name:modesetting</span >

Hmm, why there are 3 and 4 outputs associated to them? Is it possible that =
DP
output is accessible with the Intel card only (I don't have a connector rig=
ht
here to test it organoleptically)?

<span class=3D"quote">&gt;=20
&gt; grep . /sys/class/drm/card*-*/status
&gt;=20
&gt; You should see some card0-* and card1-* entries.</span >

Yes, I see different outputs.
<span class=3D"quote">&gt; /sys/class/drm/card0-DP-1/status:disconnected
&gt; /sys/class/drm/card0-eDP-1/status:connected
&gt; /sys/class/drm/card0-HDMI-A-1/status:disconnected
&gt; /sys/class/drm/card1-DP-2/status:disconnected
&gt; /sys/class/drm/card1-HDMI-A-2/status:disconnected</span ></pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15599391342.2bBb.29286--

--===============0069313640==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1

--===============0069313640==--
