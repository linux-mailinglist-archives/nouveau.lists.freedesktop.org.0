Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EB099677194
	for <lists+nouveau@lfdr.de>; Sun, 22 Jan 2023 19:41:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8EA3E10E1A2;
	Sun, 22 Jan 2023 18:41:47 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-yw1-x112c.google.com (mail-yw1-x112c.google.com
 [IPv6:2607:f8b0:4864:20::112c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 374E610E1A2
 for <nouveau@lists.freedesktop.org>; Sun, 22 Jan 2023 18:41:46 +0000 (UTC)
Received: by mail-yw1-x112c.google.com with SMTP id
 00721157ae682-4fda31c3351so114602377b3.11
 for <nouveau@lists.freedesktop.org>; Sun, 22 Jan 2023 10:41:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=87CrTxhLFdiTg15PYDr3Zbsl6A6ihVJ84PKCB2a9BOE=;
 b=kGGDBua/y89t+FhmI0i2huVsLSkzy2RbgddU/LaNheqaZCe0mKeuMPX8iKUbBYx/US
 5/x6k121DuykUT2ByGatsYIAJJmVUVPmk9CG/SLzT3JCWb8KBIVF+sIv8m1yOpaytndF
 EgcBqT3D36ohMQWXGLttaqE7WXSyS9qiiFRM8RaNpJKjChwW5ZApluhOsyWtq3LF2D2v
 deJ1VyGSla0nxHlWgl3mUQr8OaL22Oo3ALGGJNbDTBc3axlVe879zZk1vdXlrPZuSPpb
 oQtIodgFzJAdw//zP6z7NnSaruLmlRvhM3yuylp6CUVvnZ8bxm7xgE+u2kLyzMio48ZB
 us6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=87CrTxhLFdiTg15PYDr3Zbsl6A6ihVJ84PKCB2a9BOE=;
 b=5kZia0ICnLs5Llrj54G8ycUE2fyUEmK0gVQbzo42hTM6eofc+VPDc2Byi3XSpJJOF9
 Auyyyx2O2r4E2sRyJ/YwWgDqBoYxpDogHwe/CBauxHisU6tLGdnrc9HjqIfoVYpfvag9
 hOhtxlOitGYtz6nEwhkRtAj1kYfvMbTDbElvTAoAyn/LSWvnbzybJ7rT52mSye13f+yG
 ULRAezFP91iDZYAt2cWeWUanXUrKC38eWKl6sg4TIQPVsVZdK9LvkSzA9yPAAsuRU+PU
 AITjs++CsUiIHmdHWSaz6Z2U14UlFCt6AjOQLEtMvOPPFFPYmL8oZEyCOW4Lj0eDc282
 gakw==
X-Gm-Message-State: AFqh2kq3grWEk84DYsVEPIWovIoiwoQtW651CidbMYmIt3sZV2cUkPen
 82SsKdzDLka5M7UL3WP7oNYwi4zbHXXjHWIQSO6Pzq7l6bE=
X-Google-Smtp-Source: AMrXdXsRJEp1Ey6hN7KpsYdQEKBy4cxWSLT/eWggeQ2tnkx7Md1E4+HA2w+WEMoAvvl/2967xQtk6ivIrbCmJKHY4iA=
X-Received: by 2002:a81:1c0a:0:b0:4b0:84a1:3a9d with SMTP id
 c10-20020a811c0a000000b004b084a13a9dmr2594040ywc.66.1674412905046; Sun, 22
 Jan 2023 10:41:45 -0800 (PST)
MIME-Version: 1.0
From: Jeff Sacksteder <jsacksteder@gmail.com>
Date: Sun, 22 Jan 2023 13:40:32 -0500
Message-ID: <CAOgeiBZOUz9txd1UaLhL4FWXK+ozqNYjxZ-Ra++enOZdzLaXog@mail.gmail.com>
To: nouveau@lists.freedesktop.org
Content-Type: multipart/alternative; boundary="00000000000069a88405f2dea2d1"
Subject: [Nouveau] Repeatable Freeze - nouveau/dri/mesa ?
X-BeenThere: nouveau@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request@lists.freedesktop.org?subject=subscribe>
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

--00000000000069a88405f2dea2d1
Content-Type: text/plain; charset="UTF-8"

I'm having a repeatable freeze issue and trying to figure out how to
identify where in the stack the problem lies.

The display is unresponsive and the pointer disappears. I can get to a
console with ctrl-alt-f1, though it is delayed and takes a minute or two
happen.

The issue intermittently happens with vlc or firefox during regular use. I
have never observed the issue with KDE native desktop apps. However, I can
repeatably trigger it with sauerbraten. The sequence is to open the game
and load a map, then close the map and go back to the menu to load another
map.

So there's a 2d menu with a loading progress bar, then a handoff to the 3d
game(mesa?) then a return to the 2d screen. Once you load the 2nd map it
will freeze up when it updates the progress bar during map loading. You
don't need to actually play the game and can exit back to the menu
directly. There are three maps that seem to trigger it 100% of the time.
They are large and use some more exotic 3d features(lighting, shading,
ect). It doesn't seem to matter if it's full-screen or windowed. If I kill
the saubraten process, I can get control of the x session again, but as
with console switching, it takes a bit to complete.

I had previously had the same issue on Alpine 3.16 with a single monitor
configuration, but I switched to Devuan to facilitate better
troubleshooting.

If I use the NoAccel option in the xorg conf the issue does not occur, but
of course that's a non-optimal solution. Similarly, if I change the KDE
compositor from OpenGL2.0 to xrender, the issue does not occur.

I have been using NoAccel for several days with no Firefox or vlc issues. I
will evaluate using xrender going forward. In either case the game runs
single-digit frame rates and is unusable without 3d.

My current setup is dual-monitor with the following:
kernel 5.10.0
libdrm 2.4.104
mesa 20.3.5
xf86-nouveau 1.0.17
KDE Plasma 5.20.5

I don't see anything obvious in dmesg at the time of the issue, but these
are the lines at boot.

[    9.340520] nouveau 0000:01:00.0: vgaarb: deactivate vga console
[    9.341605] nouveau 0000:01:00.0: NVIDIA G84 (084f00a2)
[    9.446067] nouveau 0000:01:00.0: bios: version 60.84.74.00.18
[    9.466895] nouveau 0000:01:00.0: bios: M0203T not found
[    9.466898] nouveau 0000:01:00.0: bios: M0203E not matched!
[    9.466900] nouveau 0000:01:00.0: fb: 512 MiB DDR2
[    9.654193] nouveau 0000:01:00.0: DRM: VRAM: 512 MiB
[    9.654196] nouveau 0000:01:00.0: DRM: GART: 1048576 MiB
[    9.654201] nouveau 0000:01:00.0: DRM: TMDS table version 2.0
[    9.654204] nouveau 0000:01:00.0: DRM: DCB version 4.0
[    9.654207] nouveau 0000:01:00.0: DRM: DCB outp 00: 02000300 00000028
[    9.654210] nouveau 0000:01:00.0: DRM: DCB outp 01: 01000302 00000030
[    9.654213] nouveau 0000:01:00.0: DRM: DCB outp 02: 04011310 00000028
[    9.654215] nouveau 0000:01:00.0: DRM: DCB outp 03: 02011312 00000030
[    9.654218] nouveau 0000:01:00.0: DRM: DCB outp 04: 010223f1 00c0c080
[    9.654221] nouveau 0000:01:00.0: DRM: DCB conn 00: 1030
[    9.654223] nouveau 0000:01:00.0: DRM: DCB conn 01: 2130
[    9.654226] nouveau 0000:01:00.0: DRM: DCB conn 02: 0210
[    9.654228] nouveau 0000:01:00.0: DRM: DCB conn 03: 0211
[    9.654230] nouveau 0000:01:00.0: DRM: DCB conn 04: 0213
[    9.656074] nouveau 0000:01:00.0: DRM: MM: using CRYPT for buffer copies
[    9.656668] nouveau 0000:01:00.0: DRM: failed to create encoder 0/1/0:
-19
[    9.656670] nouveau 0000:01:00.0: DRM: TV-1 has no encoders, removing
[    9.965479] nouveau 0000:01:00.0: DRM: allocated 1280x1024 fb: 0x70000,
bo 000000007abc2ebf
[    9.967651] fbcon: nouveaudrmfb (fb0) is primary device
[   10.122699] nouveau 0000:01:00.0: [drm] fb0: nouveaudrmfb frame buffer
device
[   10.149854] [drm] Initialized nouveau 1.3.1 20120801 for 0000:01:00.0 on
minor 0

--00000000000069a88405f2dea2d1
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">I&#39;m having a repeatable freeze issue and trying to fig=
ure out how to identify where in the stack the problem lies. =C2=A0<br><br>=
The display is unresponsive and the pointer disappears. I can get to a cons=
ole with ctrl-alt-f1, though it is delayed and takes a minute or two happen=
.<br><br>The issue intermittently happens with vlc or firefox during regula=
r use. I have never observed the issue with KDE native desktop apps. Howeve=
r, I can repeatably trigger it with sauerbraten. The sequence is to open th=
e game and load a map, then close the map and go back to the menu to load a=
nother map.<br><br>So there&#39;s a 2d menu with a loading progress bar, th=
en a handoff to the 3d game(mesa?) then a return to the 2d screen. Once you=
 load the 2nd map it will freeze up when it updates the progress bar during=
 map loading. You don&#39;t need to actually play the game and can exit bac=
k to the menu directly. There are three maps that seem to trigger it 100% o=
f the time. They are large and use some more exotic 3d features(lighting, s=
hading, ect). It doesn&#39;t seem to matter if it&#39;s full-screen or wind=
owed. If I kill the saubraten process, I can get control of the x session a=
gain, but as with console switching, it takes a bit to complete.<br><br>I h=
ad previously had the same issue on Alpine 3.16 with a single monitor confi=
guration, but I switched to Devuan to facilitate better troubleshooting.<br=
><br>If I use the NoAccel option in the xorg conf the issue does not occur,=
 but of course that&#39;s a non-optimal solution. Similarly, if I change th=
e KDE compositor from OpenGL2.0 to xrender, the issue does not occur.<br><b=
r>I have been using NoAccel for several days with no Firefox or vlc issues.=
 I will evaluate using xrender going forward. In either case the game runs =
single-digit frame rates and is unusable without 3d.<br><br>My current setu=
p is dual-monitor with the following:<br>kernel 5.10.0<br>libdrm 2.4.104<br=
>mesa 20.3.5<br>xf86-nouveau 1.0.17<br>KDE Plasma 5.20.5<br><br>I don&#39;t=
 see anything obvious in dmesg at the time of the issue, but these are the =
lines at boot.<br><br>[ =C2=A0 =C2=A09.340520] nouveau 0000:01:00.0: vgaarb=
: deactivate vga console<br>[ =C2=A0 =C2=A09.341605] nouveau 0000:01:00.0: =
NVIDIA G84 (084f00a2)<br>[ =C2=A0 =C2=A09.446067] nouveau 0000:01:00.0: bio=
s: version 60.84.74.00.18<br>[ =C2=A0 =C2=A09.466895] nouveau 0000:01:00.0:=
 bios: M0203T not found<br>[ =C2=A0 =C2=A09.466898] nouveau 0000:01:00.0: b=
ios: M0203E not matched!<br>[ =C2=A0 =C2=A09.466900] nouveau 0000:01:00.0: =
fb: 512 MiB DDR2<br>[ =C2=A0 =C2=A09.654193] nouveau 0000:01:00.0: DRM: VRA=
M: 512 MiB<br>[ =C2=A0 =C2=A09.654196] nouveau 0000:01:00.0: DRM: GART: 104=
8576 MiB<br>[ =C2=A0 =C2=A09.654201] nouveau 0000:01:00.0: DRM: TMDS table =
version 2.0<br>[ =C2=A0 =C2=A09.654204] nouveau 0000:01:00.0: DRM: DCB vers=
ion 4.0<br>[ =C2=A0 =C2=A09.654207] nouveau 0000:01:00.0: DRM: DCB outp 00:=
 02000300 00000028<br>[ =C2=A0 =C2=A09.654210] nouveau 0000:01:00.0: DRM: D=
CB outp 01: 01000302 00000030<br>[ =C2=A0 =C2=A09.654213] nouveau 0000:01:0=
0.0: DRM: DCB outp 02: 04011310 00000028<br>[ =C2=A0 =C2=A09.654215] nouvea=
u 0000:01:00.0: DRM: DCB outp 03: 02011312 00000030<br>[ =C2=A0 =C2=A09.654=
218] nouveau 0000:01:00.0: DRM: DCB outp 04: 010223f1 00c0c080<br>[ =C2=A0 =
=C2=A09.654221] nouveau 0000:01:00.0: DRM: DCB conn 00: 1030<br>[ =C2=A0 =
=C2=A09.654223] nouveau 0000:01:00.0: DRM: DCB conn 01: 2130<br>[ =C2=A0 =
=C2=A09.654226] nouveau 0000:01:00.0: DRM: DCB conn 02: 0210<br>[ =C2=A0 =
=C2=A09.654228] nouveau 0000:01:00.0: DRM: DCB conn 03: 0211<br>[ =C2=A0 =
=C2=A09.654230] nouveau 0000:01:00.0: DRM: DCB conn 04: 0213<br>[ =C2=A0 =
=C2=A09.656074] nouveau 0000:01:00.0: DRM: MM: using CRYPT for buffer copie=
s<br>[ =C2=A0 =C2=A09.656668] nouveau 0000:01:00.0: DRM: failed to create e=
ncoder 0/1/0: -19<br>[ =C2=A0 =C2=A09.656670] nouveau 0000:01:00.0: DRM: TV=
-1 has no encoders, removing<br>[ =C2=A0 =C2=A09.965479] nouveau 0000:01:00=
.0: DRM: allocated 1280x1024 fb: 0x70000, bo 000000007abc2ebf<br>[ =C2=A0 =
=C2=A09.967651] fbcon: nouveaudrmfb (fb0) is primary device<br>[ =C2=A0 10.=
122699] nouveau 0000:01:00.0: [drm] fb0: nouveaudrmfb frame buffer device<b=
r>[ =C2=A0 10.149854] [drm] Initialized nouveau 1.3.1 20120801 for 0000:01:=
00.0 on minor 0</div>

--00000000000069a88405f2dea2d1--
