Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EF0C2410DF8
	for <lists+nouveau@lfdr.de>; Mon, 20 Sep 2021 02:15:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5CDBA6E2C7;
	Mon, 20 Sep 2021 00:15:31 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com
 [IPv6:2a00:1450:4864:20::12a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 23BAF6E190
 for <nouveau@lists.freedesktop.org>; Sun, 19 Sep 2021 03:50:32 +0000 (UTC)
Received: by mail-lf1-x12a.google.com with SMTP id z24so25022831lfu.13
 for <nouveau@lists.freedesktop.org>; Sat, 18 Sep 2021 20:50:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
 bh=tJk3YfY4CqgRGX/y174QJSJV1VvmfB6LiPx4MRtIrxU=;
 b=h/+YJtHufAdRNh+z2XSRUhBScavzpn4pFS65xwPsgipZxE/5AjvBwdWHmIOYFjQs08
 xE/ceJblnB/Wli3RBm2a2DbeQoYews7uod5j6DXL/C9lz+j2l/VSM4K15YzN45arHS4R
 htYhrXpQYez1pPpS6vZL/WRLpusD/FaltO7LQkkMkz1WUMujGVsVi8+0dfVH+yyEbcI2
 3xm3tGdsS8y7OGX6Pkuo4/MH2KQ5WroWUho5UdDiKqEq1hWT8u0sTD10Tbl3YhkUgqJJ
 6FRrBbZaaqDBzXNIiFV7OMHvwsB6WmPVWvBDAdvzwAkFLrMt94KPkXZ3u0YYgyo9tQJf
 Z+qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to;
 bh=tJk3YfY4CqgRGX/y174QJSJV1VvmfB6LiPx4MRtIrxU=;
 b=bf2T91PUB6djGC5chH4P+Z0CMWDCN/Jdw2cBLwK2jXrY7I7nufwO2EKblbOZvvM0ZP
 9UybdCcculeX6EYJbDVScNvzbnwMAwm0zoCrnaC8hYU8jg2W/Oy/orekL1fR4OXJi54U
 4nrPeT6RBAAJnUclmHo1F+unpuotIBw+H/4fJVoXHDayvAo6MaVfKaT/mzFcx+s1k8wH
 pJBm0Yubh1wbl3/sqIARupI4LPApBnQlH+7xmrfO5WGc45qmFK5LaxGF7I7PTqo3iUm+
 ATJMCIykYcW7BmhPHH/0GreSwb1tSrB01uEIPna499FXA3ljM4EOYrGTOEdCUjOPSpC1
 z5GQ==
X-Gm-Message-State: AOAM530oGqxD7bbIuMwW4ZYO18zwkTG2JfY4YYnlgpn23Y/m9TZuMLte
 O0SN86Pn+UqO4zFJdcWx+WTEAB7q4ySbBjZb8qo=
X-Google-Smtp-Source: ABdhPJxZETNgDld1c3Mk7RYv+kX5p+LnGWmkat3dt12mDwj70a30k8OTei4jwuXGcTGUjpg8rZvjADIa39w8G6ZtNKI=
X-Received: by 2002:ac2:5ff2:: with SMTP id s18mr12569139lfg.322.1632023430242; 
 Sat, 18 Sep 2021 20:50:30 -0700 (PDT)
MIME-Version: 1.0
References: <CAN9WMdPTGBXsvF-4o6MEA8bMUOsGTa7fK=h+RVfJrs67KeVn3w@mail.gmail.com>
In-Reply-To: <CAN9WMdPTGBXsvF-4o6MEA8bMUOsGTa7fK=h+RVfJrs67KeVn3w@mail.gmail.com>
From: __- -__ <isapgswell@gmail.com>
Date: Sun, 19 Sep 2021 00:50:19 -0300
Message-ID: <CAN9WMdOhuTJPK98rNANSC2ye=sddw1Y_bWtt70UZnZZWnr3BbQ@mail.gmail.com>
To: linux-bugs@nvidia.com, nouveau@lists.freedesktop.org, 
 debian-boot@lists.debian.org, Dell Tech Support <technical_support@dell.com>, 
 Dell Tech Support <technical_support@help.dell.com>,
 ubuntu-users@lists.ubuntu.com, System76 <help@system76.com>
Content-Type: multipart/alternative; boundary="000000000000d3230305cc5110cc"
X-Mailman-Approved-At: Mon, 20 Sep 2021 00:15:28 +0000
Subject: Re: [Nouveau] Nvidia OFFLOAD (nvidia-prime)
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

--000000000000d3230305cc5110cc
Content-Type: text/plain; charset="UTF-8"

Hi,

One observation related into 10-nvidia.conf file

Section "OutputClass"
    Identifier "nvidia"
    MatchDriver "nvidia-drm"
    Driver "nvidia-modeset"
    Option "AllowEmptyInitialConfiguration"
    ModulePath "/usr/lib/x86_64-linux-gnu/nvidia/xorg"
EndSection

aTI,

L. F

On Sat, Sep 18, 2021 at 6:21 PM __- -__ <isapgswell@gmail.com> wrote:

> Hi,
>
> I would like to share my 3 files at /usr/share/X11/xorg.conf.d/
>
> xorg.conf
> 10-nvidia.conf
> 11-nvidia-offload.conf
>
> a) xorg
> Section "Files"
>    ModulePath "/usr/lib/xorg"
> EndSection
>
> Section "Device"
>    Identifier "intel"
>    Driver "i915"
>    Option "DRI2" "on"
>    BusID "PCI:0:2:0"
> #   Option "AccelMethod" "uxa"
> EndSection
>
> Section "Screen"
>    Identifier "intel"
>    Device "intel"
> EndSection
>
> Section "Device"
>    Identifier "nvidia-drm"
>    Driver "nvidia-drm"
> EndSection
>
> Section "Device"
>    Identifier "nvidia-modeset"
>    Driver "nvidia-modeset"
> EndSection
>
> Section "Device"
>    Identifier "nvidia"
>    Driver "nvidia"
>    BusID "PCI:1:0:0"
> EndSection
>
> Section "ServerFlags"
>    Option "DefaultServerLayout" "layout"
>    Option "DisableVidModeExtension"  "on"
>    Option "AIGLX" "off"
>    Option "IndirectGLX" "off"
>    Option "GlxVisuals" "minimal"
>    Option "Log" "flush"
>    Option "DontVTSwitch"  "on"
>    Option "DontZap"  "on"
>    Option "DontZoom"  "on"
>    Option "AutoAddDevices" "on"
>    Option "AutoEnableDevices" "off"
>    Option "AutoAddGPU" "on"
>    Option "AutoBindGPU"  "off"
> EndSection
>
> Section "Extensions"
>    Option "RENDER" "Enable"
>    Option "Composite" "Enable"
>    Option "GLX" "Enable"
>    Option "MIT-SHM" "Disable"
> EndSection
>
> b) 10-nvidia.conf (same as default)
> Section "OutputClass"
>     Identifier "nvidia"
>     MatchDriver "nvidia-drm"
>     Driver "nvidia"
>     Option "AllowEmptyInitialConfiguration"
>     ModulePath "/usr/lib/x86_64-linux-gnu/nvidia/xorg"
> EndSection
>
> c) 11-nvidia-offload.conf
> Section "ServerLayout"
>     Identifier "layout"
>     Screen 0 "intel" 0 0
>     Inactive "nvidia-drm"
>     Inactive "nvidia-modeset"
>     Inactive "nvidia"
>     Option "AllowNVIDIAGPUScreens"
> EndSection
>
> My dGPU is a 940mx (nvidia) playing at 2560x1080, ubuntu 20.04 LTS
>
> aTI,
>
> L. F
>

--000000000000d3230305cc5110cc
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi,<div><br></div><div>One observation related into 10-nvi=
dia.conf file</div><div><br></div><div>Section &quot;OutputClass&quot;<br>=
=C2=A0 =C2=A0 Identifier &quot;nvidia&quot;<br>=C2=A0 =C2=A0 MatchDriver &q=
uot;nvidia-drm&quot;<br>=C2=A0 =C2=A0 <font color=3D"#00ff00" style=3D"back=
ground-color:rgb(255,255,0)">Driver &quot;nvidia-modeset&quot;</font><br>=
=C2=A0 =C2=A0 Option &quot;AllowEmptyInitialConfiguration&quot;<br>=C2=A0 =
=C2=A0 ModulePath &quot;/usr/lib/x86_64-linux-gnu/nvidia/xorg&quot;<br>EndS=
ection<br></div><div><br></div><div>aTI,</div><div><br></div><div>L. F</div=
></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr"=
>On Sat, Sep 18, 2021 at 6:21 PM __- -__ &lt;<a href=3D"mailto:isapgswell@g=
mail.com">isapgswell@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D=
"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(2=
04,204,204);padding-left:1ex"><div dir=3D"ltr">Hi,<div><br></div><div>I wou=
ld like to share my 3 files at /usr/share/X11/xorg.conf.d/</div><div><br></=
div><div><span style=3D"background-color:rgb(255,255,0)">xorg.conf=C2=A0</s=
pan></div><div><span style=3D"background-color:rgb(255,255,0)">10-nvidia.co=
nf</span></div><div><span style=3D"background-color:rgb(255,255,0)">11-nvid=
ia-offload.conf</span><br></div><div><br></div><div><span style=3D"backgrou=
nd-color:rgb(255,255,0)"><font color=3D"#00ff00">a) xorg</font></span></div=
><div>Section &quot;Files&quot;<br>=C2=A0 =C2=A0ModulePath &quot;/usr/lib/x=
org&quot;<br>EndSection<br><br>Section &quot;Device&quot;<br>=C2=A0 =C2=A0I=
dentifier &quot;intel&quot;<br>=C2=A0 =C2=A0Driver &quot;i915&quot;<br>=C2=
=A0 =C2=A0Option &quot;DRI2&quot; &quot;on&quot;<br>=C2=A0 =C2=A0BusID &quo=
t;PCI:0:2:0&quot;<br># =C2=A0 Option &quot;AccelMethod&quot; &quot;uxa&quot=
;<br>EndSection<br><br>Section &quot;Screen&quot;<br>=C2=A0 =C2=A0Identifie=
r &quot;intel&quot;<br>=C2=A0 =C2=A0Device &quot;intel&quot;<br>EndSection<=
br><br>Section &quot;Device&quot;<br>=C2=A0 =C2=A0Identifier &quot;nvidia-d=
rm&quot;<br>=C2=A0 =C2=A0Driver &quot;nvidia-drm&quot;<br>EndSection<br><br=
>Section &quot;Device&quot;<br>=C2=A0 =C2=A0Identifier &quot;nvidia-modeset=
&quot;<br>=C2=A0 =C2=A0Driver &quot;nvidia-modeset&quot;<br>EndSection<br><=
br>Section &quot;Device&quot;<br>=C2=A0 =C2=A0Identifier &quot;nvidia&quot;=
<br>=C2=A0 =C2=A0Driver &quot;nvidia&quot;<br>=C2=A0 =C2=A0BusID &quot;PCI:=
1:0:0&quot;<br>EndSection<br><br>Section &quot;ServerFlags&quot;<br>=C2=A0 =
=C2=A0Option &quot;DefaultServerLayout&quot; &quot;layout&quot;<br>=C2=A0 =
=C2=A0Option &quot;DisableVidModeExtension&quot; =C2=A0&quot;on&quot;<br>=
=C2=A0 =C2=A0Option &quot;AIGLX&quot; &quot;off&quot;<br>=C2=A0 =C2=A0Optio=
n &quot;IndirectGLX&quot; &quot;off&quot;<br>=C2=A0 =C2=A0Option &quot;GlxV=
isuals&quot; &quot;minimal&quot;<br>=C2=A0 =C2=A0Option &quot;Log&quot; &qu=
ot;flush&quot;<br>=C2=A0 =C2=A0Option &quot;DontVTSwitch&quot; =C2=A0&quot;=
on&quot;<br>=C2=A0 =C2=A0Option &quot;DontZap&quot; =C2=A0&quot;on&quot;<br=
>=C2=A0 =C2=A0Option &quot;DontZoom&quot; =C2=A0&quot;on&quot;<br>=C2=A0 =
=C2=A0Option &quot;AutoAddDevices&quot; &quot;on&quot;<br>=C2=A0 =C2=A0Opti=
on &quot;AutoEnableDevices&quot; &quot;off&quot;<br>=C2=A0 =C2=A0Option &qu=
ot;AutoAddGPU&quot; &quot;on&quot;<br>=C2=A0 =C2=A0Option &quot;AutoBindGPU=
&quot; =C2=A0&quot;off&quot;<br>EndSection<br><br>Section &quot;Extensions&=
quot;<br>=C2=A0 =C2=A0Option &quot;RENDER&quot; &quot;Enable&quot;<br>=C2=
=A0 =C2=A0Option &quot;Composite&quot; &quot;Enable&quot;<br>=C2=A0 =C2=A0O=
ption &quot;GLX&quot;	&quot;Enable&quot;<br>=C2=A0 =C2=A0Option &quot;MIT-S=
HM&quot; &quot;Disable&quot;<br>EndSection<br></div><div><br></div><div><fo=
nt color=3D"#ffff00" style=3D"background-color:rgb(0,255,0)">b) 10-nvidia.c=
onf (same as default)</font></div><div>Section &quot;OutputClass&quot;<br>=
=C2=A0 =C2=A0 Identifier &quot;nvidia&quot;<br>=C2=A0 =C2=A0 MatchDriver &q=
uot;nvidia-drm&quot;<br>=C2=A0 =C2=A0 Driver &quot;nvidia&quot;<br>=C2=A0 =
=C2=A0 Option &quot;AllowEmptyInitialConfiguration&quot;<br>=C2=A0 =C2=A0 M=
odulePath &quot;/usr/lib/x86_64-linux-gnu/nvidia/xorg&quot;<br>EndSection<b=
r></div><div><br></div><div><font style=3D"background-color:rgb(255,255,0)"=
 color=3D"#00ff00">c)=C2=A011-nvidia-offload.conf</font></div><div>Section =
&quot;ServerLayout&quot;<br>=C2=A0 =C2=A0 Identifier &quot;layout&quot;<br>=
=C2=A0 =C2=A0 Screen 0 &quot;intel&quot; 0 0<br>=C2=A0 =C2=A0 Inactive &quo=
t;nvidia-drm&quot;<br>=C2=A0 =C2=A0 Inactive &quot;nvidia-modeset&quot;<br>=
=C2=A0 =C2=A0 Inactive &quot;nvidia&quot;<br>=C2=A0 =C2=A0 Option &quot;All=
owNVIDIAGPUScreens&quot;<br>EndSection</div><div><br></div><div>My dGPU is =
a 940mx (nvidia) playing at 2560x1080, ubuntu 20.04 LTS</div><div><br></div=
><div>aTI,</div><div><br></div><div>L. F</div></div>
</blockquote></div>

--000000000000d3230305cc5110cc--
