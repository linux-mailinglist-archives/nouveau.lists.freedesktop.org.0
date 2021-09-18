Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C9D0C410DF9
	for <lists+nouveau@lfdr.de>; Mon, 20 Sep 2021 02:15:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7AD736E2C8;
	Mon, 20 Sep 2021 00:15:31 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com
 [IPv6:2a00:1450:4864:20::134])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BDA6C6E11A
 for <nouveau@lists.freedesktop.org>; Sat, 18 Sep 2021 21:21:31 +0000 (UTC)
Received: by mail-lf1-x134.google.com with SMTP id y28so47756176lfb.0
 for <nouveau@lists.freedesktop.org>; Sat, 18 Sep 2021 14:21:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:from:date:message-id:subject:to;
 bh=2K7zhsbchi+iWtH5LmNLoKEChsd4TZFizg+t07mGsBI=;
 b=OJhZPJBeWR6Vv5AjOt/A/1sD72z+Rx5l3MSk1sG7LDttkzWwodtRDOgBoAsk0oVJ9n
 3T5En9m8UhK4xPECCP4bzI49f/r5O26tZ/AgbFefpY+I4dVkKgopsKGmon8tgGGBkx42
 fefLZ1ifzk+9D45Bpfqa4Ou315aHUJIrS+nICe70APhfw819MVviWkDQIa5Ng7ZugkLV
 RhaiKVj/zGvn9xB+xJZns5Qjn6mHXNStOXasMrpgtmKdg+VhcIePCQqdoE76jo+qYG0w
 PYmulDogpJHSPxHQ3cEpDSd3wDfOaAycsYaKzoGGPmZzwPkbja/3Jb+vIOyszxs4UGSG
 rahA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=2K7zhsbchi+iWtH5LmNLoKEChsd4TZFizg+t07mGsBI=;
 b=rQ4nYGl8qmps+U48hdDljPvDR2ry30WRJSZh1kjCVqzkReGzKspKwPa8AKolIepbEy
 kkCLwiYvD6INjSZZmbWEHVr95gDNeKxTO/D4CUL6cGTXeiDztCHYxVTr0Y0t3UrY90PA
 4SsSWkVs5ybRByJ2yu4Ju9fVYgV//wApOdhNBs3tOWVaKDSwAq0hfRXJJ1f+3iJbUofC
 8o264ZAU6DJUti3Q3VfbzWNvYTEj/rQTticXsdRDJ1ZsaBKlbanto8n5cVzPNfxNXkaj
 mjzHBmoYXaKbde/Bzr83yb/Cm3zcmJJUg4b5fzn6br5aLR2F4z7hKzbQ8yYluYwIxvyK
 GHFA==
X-Gm-Message-State: AOAM532hK5J7D00Ue7NQi5G/XkauxBxHOchT1gaDC0U3/GvTqbice2n6
 3xVsxM8IdWJgi3J6Vme0KYrrb0WIVIKHIKH5TO/8NeoPk90NDg==
X-Google-Smtp-Source: ABdhPJwcXbJoqwXNP3BI3EJT8YVTrV0+IoMe2JggY5g/X3EqmCb/FDLDntf01nMwKkU0oKnClSp0RsGOC7/sqKLdif0=
X-Received: by 2002:a05:6512:13a9:: with SMTP id
 p41mr12910744lfa.403.1632000089974; 
 Sat, 18 Sep 2021 14:21:29 -0700 (PDT)
MIME-Version: 1.0
From: __- -__ <isapgswell@gmail.com>
Date: Sat, 18 Sep 2021 18:21:18 -0300
Message-ID: <CAN9WMdPTGBXsvF-4o6MEA8bMUOsGTa7fK=h+RVfJrs67KeVn3w@mail.gmail.com>
To: linux-bugs@nvidia.com, nouveau@lists.freedesktop.org, 
 debian-boot@lists.debian.org, Dell Tech Support <technical_support@dell.com>, 
 Dell Tech Support <technical_support@help.dell.com>,
 ubuntu-users@lists.ubuntu.com, System76 <help@system76.com>
Content-Type: multipart/alternative; boundary="000000000000a2ed4f05cc4ba12a"
X-Mailman-Approved-At: Mon, 20 Sep 2021 00:15:28 +0000
Subject: [Nouveau] Nvidia OFFLOAD (nvidia-prime)
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

--000000000000a2ed4f05cc4ba12a
Content-Type: text/plain; charset="UTF-8"

Hi,

I would like to share my 3 files at /usr/share/X11/xorg.conf.d/

xorg.conf
10-nvidia.conf
11-nvidia-offload.conf

a) xorg
Section "Files"
   ModulePath "/usr/lib/xorg"
EndSection

Section "Device"
   Identifier "intel"
   Driver "i915"
   Option "DRI2" "on"
   BusID "PCI:0:2:0"
#   Option "AccelMethod" "uxa"
EndSection

Section "Screen"
   Identifier "intel"
   Device "intel"
EndSection

Section "Device"
   Identifier "nvidia-drm"
   Driver "nvidia-drm"
EndSection

Section "Device"
   Identifier "nvidia-modeset"
   Driver "nvidia-modeset"
EndSection

Section "Device"
   Identifier "nvidia"
   Driver "nvidia"
   BusID "PCI:1:0:0"
EndSection

Section "ServerFlags"
   Option "DefaultServerLayout" "layout"
   Option "DisableVidModeExtension"  "on"
   Option "AIGLX" "off"
   Option "IndirectGLX" "off"
   Option "GlxVisuals" "minimal"
   Option "Log" "flush"
   Option "DontVTSwitch"  "on"
   Option "DontZap"  "on"
   Option "DontZoom"  "on"
   Option "AutoAddDevices" "on"
   Option "AutoEnableDevices" "off"
   Option "AutoAddGPU" "on"
   Option "AutoBindGPU"  "off"
EndSection

Section "Extensions"
   Option "RENDER" "Enable"
   Option "Composite" "Enable"
   Option "GLX" "Enable"
   Option "MIT-SHM" "Disable"
EndSection

b) 10-nvidia.conf (same as default)
Section "OutputClass"
    Identifier "nvidia"
    MatchDriver "nvidia-drm"
    Driver "nvidia"
    Option "AllowEmptyInitialConfiguration"
    ModulePath "/usr/lib/x86_64-linux-gnu/nvidia/xorg"
EndSection

c) 11-nvidia-offload.conf
Section "ServerLayout"
    Identifier "layout"
    Screen 0 "intel" 0 0
    Inactive "nvidia-drm"
    Inactive "nvidia-modeset"
    Inactive "nvidia"
    Option "AllowNVIDIAGPUScreens"
EndSection

My dGPU is a 940mx (nvidia) playing at 2560x1080, ubuntu 20.04 LTS

aTI,

L. F

--000000000000a2ed4f05cc4ba12a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi,<div><br></div><div>I would like to share my 3 files at=
 /usr/share/X11/xorg.conf.d/</div><div><br></div><div><span style=3D"backgr=
ound-color:rgb(255,255,0)">xorg.conf=C2=A0</span></div><div><span style=3D"=
background-color:rgb(255,255,0)">10-nvidia.conf</span></div><div><span styl=
e=3D"background-color:rgb(255,255,0)">11-nvidia-offload.conf</span><br></di=
v><div><br></div><div><span style=3D"background-color:rgb(255,255,0)"><font=
 color=3D"#00ff00">a) xorg</font></span></div><div>Section &quot;Files&quot=
;<br>=C2=A0 =C2=A0ModulePath &quot;/usr/lib/xorg&quot;<br>EndSection<br><br=
>Section &quot;Device&quot;<br>=C2=A0 =C2=A0Identifier &quot;intel&quot;<br=
>=C2=A0 =C2=A0Driver &quot;i915&quot;<br>=C2=A0 =C2=A0Option &quot;DRI2&quo=
t; &quot;on&quot;<br>=C2=A0 =C2=A0BusID &quot;PCI:0:2:0&quot;<br># =C2=A0 O=
ption &quot;AccelMethod&quot; &quot;uxa&quot;<br>EndSection<br><br>Section =
&quot;Screen&quot;<br>=C2=A0 =C2=A0Identifier &quot;intel&quot;<br>=C2=A0 =
=C2=A0Device &quot;intel&quot;<br>EndSection<br><br>Section &quot;Device&qu=
ot;<br>=C2=A0 =C2=A0Identifier &quot;nvidia-drm&quot;<br>=C2=A0 =C2=A0Drive=
r &quot;nvidia-drm&quot;<br>EndSection<br><br>Section &quot;Device&quot;<br=
>=C2=A0 =C2=A0Identifier &quot;nvidia-modeset&quot;<br>=C2=A0 =C2=A0Driver =
&quot;nvidia-modeset&quot;<br>EndSection<br><br>Section &quot;Device&quot;<=
br>=C2=A0 =C2=A0Identifier &quot;nvidia&quot;<br>=C2=A0 =C2=A0Driver &quot;=
nvidia&quot;<br>=C2=A0 =C2=A0BusID &quot;PCI:1:0:0&quot;<br>EndSection<br><=
br>Section &quot;ServerFlags&quot;<br>=C2=A0 =C2=A0Option &quot;DefaultServ=
erLayout&quot; &quot;layout&quot;<br>=C2=A0 =C2=A0Option &quot;DisableVidMo=
deExtension&quot; =C2=A0&quot;on&quot;<br>=C2=A0 =C2=A0Option &quot;AIGLX&q=
uot; &quot;off&quot;<br>=C2=A0 =C2=A0Option &quot;IndirectGLX&quot; &quot;o=
ff&quot;<br>=C2=A0 =C2=A0Option &quot;GlxVisuals&quot; &quot;minimal&quot;<=
br>=C2=A0 =C2=A0Option &quot;Log&quot; &quot;flush&quot;<br>=C2=A0 =C2=A0Op=
tion &quot;DontVTSwitch&quot; =C2=A0&quot;on&quot;<br>=C2=A0 =C2=A0Option &=
quot;DontZap&quot; =C2=A0&quot;on&quot;<br>=C2=A0 =C2=A0Option &quot;DontZo=
om&quot; =C2=A0&quot;on&quot;<br>=C2=A0 =C2=A0Option &quot;AutoAddDevices&q=
uot; &quot;on&quot;<br>=C2=A0 =C2=A0Option &quot;AutoEnableDevices&quot; &q=
uot;off&quot;<br>=C2=A0 =C2=A0Option &quot;AutoAddGPU&quot; &quot;on&quot;<=
br>=C2=A0 =C2=A0Option &quot;AutoBindGPU&quot; =C2=A0&quot;off&quot;<br>End=
Section<br><br>Section &quot;Extensions&quot;<br>=C2=A0 =C2=A0Option &quot;=
RENDER&quot; &quot;Enable&quot;<br>=C2=A0 =C2=A0Option &quot;Composite&quot=
; &quot;Enable&quot;<br>=C2=A0 =C2=A0Option &quot;GLX&quot;	&quot;Enable&qu=
ot;<br>=C2=A0 =C2=A0Option &quot;MIT-SHM&quot; &quot;Disable&quot;<br>EndSe=
ction<br></div><div><br></div><div><font color=3D"#ffff00" style=3D"backgro=
und-color:rgb(0,255,0)">b) 10-nvidia.conf (same as default)</font></div><di=
v>Section &quot;OutputClass&quot;<br>=C2=A0 =C2=A0 Identifier &quot;nvidia&=
quot;<br>=C2=A0 =C2=A0 MatchDriver &quot;nvidia-drm&quot;<br>=C2=A0 =C2=A0 =
Driver &quot;nvidia&quot;<br>=C2=A0 =C2=A0 Option &quot;AllowEmptyInitialCo=
nfiguration&quot;<br>=C2=A0 =C2=A0 ModulePath &quot;/usr/lib/x86_64-linux-g=
nu/nvidia/xorg&quot;<br>EndSection<br></div><div><br></div><div><font style=
=3D"background-color:rgb(255,255,0)" color=3D"#00ff00">c)=C2=A011-nvidia-of=
fload.conf</font></div><div>Section &quot;ServerLayout&quot;<br>=C2=A0 =C2=
=A0 Identifier &quot;layout&quot;<br>=C2=A0 =C2=A0 Screen 0 &quot;intel&quo=
t; 0 0<br>=C2=A0 =C2=A0 Inactive &quot;nvidia-drm&quot;<br>=C2=A0 =C2=A0 In=
active &quot;nvidia-modeset&quot;<br>=C2=A0 =C2=A0 Inactive &quot;nvidia&qu=
ot;<br>=C2=A0 =C2=A0 Option &quot;AllowNVIDIAGPUScreens&quot;<br>EndSection=
</div><div><br></div><div>My dGPU is a 940mx (nvidia) playing at 2560x1080,=
 ubuntu 20.04 LTS</div><div><br></div><div>aTI,</div><div><br></div><div>L.=
 F</div></div>

--000000000000a2ed4f05cc4ba12a--
