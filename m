Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3606A410DF7
	for <lists+nouveau@lfdr.de>; Mon, 20 Sep 2021 02:15:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6C8166E2C0;
	Mon, 20 Sep 2021 00:15:29 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com
 [IPv6:2a00:1450:4864:20::129])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 243E46E195
 for <nouveau@lists.freedesktop.org>; Sun, 19 Sep 2021 05:48:57 +0000 (UTC)
Received: by mail-lf1-x129.google.com with SMTP id z24so25814958lfu.13
 for <nouveau@lists.freedesktop.org>; Sat, 18 Sep 2021 22:48:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
 bh=9IhiDk/89O/2Nj67usAKV1R7oJH3LrVWX+Ry2dGudN4=;
 b=Mw6tJ4FsD0VEAMwjoKW794nzLD34+zB7lUTXpSGfKOXHp3WP7Bo0fgiAX3oO2mgbiB
 +eV2QmQWuJrTa3Fh0RBQIKFzTKR41Prm+nu9nB/fQL96+9nP8QJIhgTVirKtsMQUaxGP
 ZtLEm/iV6VjdayAkCn3wNBJLISfTtnj18fXv47GfaICof6QlCJfJvqMDsOjgP5Fb6hKe
 mvgTKeHDoOzbOX6McuIQMRAIMqMHjpNHG/K997ewnKc4hj3HqNidrpfx80tHeTrXWyia
 eaKCs30CqU3eCBCxhhYustWJw69N8CUcTFBq6rL/9JrvkiYkQEPoYCBXY75vnUthErRs
 ij0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to;
 bh=9IhiDk/89O/2Nj67usAKV1R7oJH3LrVWX+Ry2dGudN4=;
 b=dbRvdkQOILpziP3FmwREWEpc1FFndIcSJI3JX0sV/kCRq43MxhuacVzFiyzxRv2pxt
 iaLc1bwL/ZbeezpPKWD56DvuxfrtxkMRFxJOwdbY9OljNOmv0q6XVxVd+/kaRIFrK37U
 DnFvfjXYkjZ+O6m0q7Y83ErF9p3sQzcDEZI+qTdI5lQUdHT9yyX5+bdzRc/mwHs1ljwH
 ++eUxokcoC3KkdUM0qcXy+4sg8u32r50y06TMD0xvOOkrMbwz5WEMI54Q84rtjSwT/NB
 qeRDfL0vtIu1IaIWJPd9Oyxqxsd3hLUq9rmWbuXjseGO2bCwtKakQ3pfhGrQl551rGSi
 76kQ==
X-Gm-Message-State: AOAM5300U3wDF6ASmMdeFFVnimeQbx5U/bc44Wl5OzdgsPvgpatj9xpE
 lqS9wjrCYjwdu5Ln1O2bT4wgdOWM2M5+sh+VLMQ=
X-Google-Smtp-Source: ABdhPJzuRsXbENpQi7I8CIBWS9wMqoLrjGqoPjWtQ0x12ljgq9EVqe4DFUG/7lbyoPGmm1a4d4iZaHqT2HCZ9ws3S50=
X-Received: by 2002:a05:6512:16a9:: with SMTP id
 bu41mr14240252lfb.41.1632030535407; 
 Sat, 18 Sep 2021 22:48:55 -0700 (PDT)
MIME-Version: 1.0
References: <CAN9WMdPTGBXsvF-4o6MEA8bMUOsGTa7fK=h+RVfJrs67KeVn3w@mail.gmail.com>
 <CAN9WMdOhuTJPK98rNANSC2ye=sddw1Y_bWtt70UZnZZWnr3BbQ@mail.gmail.com>
In-Reply-To: <CAN9WMdOhuTJPK98rNANSC2ye=sddw1Y_bWtt70UZnZZWnr3BbQ@mail.gmail.com>
From: __- -__ <isapgswell@gmail.com>
Date: Sun, 19 Sep 2021 02:48:43 -0300
Message-ID: <CAN9WMdM7NXNh6_hakpEHRv4nx7QTANfcuPZimod4Rm=ZNgWgzA@mail.gmail.com>
To: linux-bugs@nvidia.com, nouveau@lists.freedesktop.org, 
 debian-boot@lists.debian.org, Dell Tech Support <technical_support@dell.com>, 
 Dell Tech Support <technical_support@help.dell.com>,
 ubuntu-users@lists.ubuntu.com, System76 <help@system76.com>
Content-Type: multipart/alternative; boundary="0000000000005359d105cc52b8db"
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

--0000000000005359d105cc52b8db
Content-Type: text/plain; charset="UTF-8"

Hi,

Follow Modinfo relational

Look at this (10-nvidia.conf)

Section "Files"
    ModulePath "/usr/lib/x86_64-linux-gnu/nvidia/xorg"
EndSection

Section "OutputClass"
    Identifier "nvidia"
    MatchDriver "nvidia"
    Driver "drm"
    Option "AllowEmptyInitialConfiguration"
EndSection

Section "OutputClass"
    Identifier "nvidia-uvm"
    MatchDriver "nvidia-uvm"
    Driver "nvidia"
    Option "AllowEmptyInitialConfiguration"
EndSection

Section "OutputClass"
    Identifier "nvidia-drm"
    MatchDriver "nvidia-drm"
    Driver "nvidia-modeset"
    Option "AllowEmptyInitialConfiguration"
EndSection

Section "OutputClass"
    Identifier "nvidia-drm2"
    MatchDriver "nvidia-drm"
    Driver "drm_kms_helper"
    Option "AllowEmptyInitialConfiguration"
EndSection

Section "OutputClass"
    Identifier "nvidia-drm3"
    MatchDriver "nvidia-drm"
    Driver "drm"
    Option "AllowEmptyInitialConfiguration"
EndSection

Section "OutputClass"
    Identifier "nvidia-modeset"
    MatchDriver "nvidia-modeset"
    Driver "nvidia"
    Option "AllowEmptyInitialConfiguration"
EndSection

Anymore? autorelational?

aTI,

L. F


On Sun, Sep 19, 2021 at 12:50 AM __- -__ <isapgswell@gmail.com> wrote:

> Hi,
>
> One observation related into 10-nvidia.conf file
>
> Section "OutputClass"
>     Identifier "nvidia"
>     MatchDriver "nvidia-drm"
>     Driver "nvidia-modeset"
>     Option "AllowEmptyInitialConfiguration"
>     ModulePath "/usr/lib/x86_64-linux-gnu/nvidia/xorg"
> EndSection
>
> aTI,
>
> L. F
>
> On Sat, Sep 18, 2021 at 6:21 PM __- -__ <isapgswell@gmail.com> wrote:
>
>> Hi,
>>
>> I would like to share my 3 files at /usr/share/X11/xorg.conf.d/
>>
>> xorg.conf
>> 10-nvidia.conf
>> 11-nvidia-offload.conf
>>
>> a) xorg
>> Section "Files"
>>    ModulePath "/usr/lib/xorg"
>> EndSection
>>
>> Section "Device"
>>    Identifier "intel"
>>    Driver "i915"
>>    Option "DRI2" "on"
>>    BusID "PCI:0:2:0"
>> #   Option "AccelMethod" "uxa"
>> EndSection
>>
>> Section "Screen"
>>    Identifier "intel"
>>    Device "intel"
>> EndSection
>>
>> Section "Device"
>>    Identifier "nvidia-drm"
>>    Driver "nvidia-drm"
>> EndSection
>>
>> Section "Device"
>>    Identifier "nvidia-modeset"
>>    Driver "nvidia-modeset"
>> EndSection
>>
>> Section "Device"
>>    Identifier "nvidia"
>>    Driver "nvidia"
>>    BusID "PCI:1:0:0"
>> EndSection
>>
>> Section "ServerFlags"
>>    Option "DefaultServerLayout" "layout"
>>    Option "DisableVidModeExtension"  "on"
>>    Option "AIGLX" "off"
>>    Option "IndirectGLX" "off"
>>    Option "GlxVisuals" "minimal"
>>    Option "Log" "flush"
>>    Option "DontVTSwitch"  "on"
>>    Option "DontZap"  "on"
>>    Option "DontZoom"  "on"
>>    Option "AutoAddDevices" "on"
>>    Option "AutoEnableDevices" "off"
>>    Option "AutoAddGPU" "on"
>>    Option "AutoBindGPU"  "off"
>> EndSection
>>
>> Section "Extensions"
>>    Option "RENDER" "Enable"
>>    Option "Composite" "Enable"
>>    Option "GLX" "Enable"
>>    Option "MIT-SHM" "Disable"
>> EndSection
>>
>> b) 10-nvidia.conf (same as default)
>> Section "OutputClass"
>>     Identifier "nvidia"
>>     MatchDriver "nvidia-drm"
>>     Driver "nvidia"
>>     Option "AllowEmptyInitialConfiguration"
>>     ModulePath "/usr/lib/x86_64-linux-gnu/nvidia/xorg"
>> EndSection
>>
>> c) 11-nvidia-offload.conf
>> Section "ServerLayout"
>>     Identifier "layout"
>>     Screen 0 "intel" 0 0
>>     Inactive "nvidia-drm"
>>     Inactive "nvidia-modeset"
>>     Inactive "nvidia"
>>     Option "AllowNVIDIAGPUScreens"
>> EndSection
>>
>> My dGPU is a 940mx (nvidia) playing at 2560x1080, ubuntu 20.04 LTS
>>
>> aTI,
>>
>> L. F
>>
>

--0000000000005359d105cc52b8db
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi,<div><br></div><div>Follow Modinfo relational</div><div=
><br></div><div>Look at this (10-nvidia.conf)</div><div><br></div><div>Sect=
ion &quot;Files&quot;</div><div>=C2=A0 =C2=A0 ModulePath &quot;/usr/lib/x86=
_64-linux-gnu/nvidia/xorg&quot;<br></div><div>EndSection</div><div><br></di=
v><div>Section &quot;OutputClass&quot;<br>=C2=A0 =C2=A0 Identifier &quot;nv=
idia&quot;<br>=C2=A0 =C2=A0 MatchDriver &quot;nvidia&quot;<br>=C2=A0 =C2=A0=
 Driver &quot;drm&quot;<br>=C2=A0 =C2=A0 Option &quot;AllowEmptyInitialConf=
iguration&quot;<br>EndSection<br><br>Section &quot;OutputClass&quot;<br>=C2=
=A0 =C2=A0 Identifier &quot;nvidia-uvm&quot;<br>=C2=A0 =C2=A0 MatchDriver &=
quot;nvidia-uvm&quot;<br>=C2=A0 =C2=A0 Driver &quot;nvidia&quot;<br>=C2=A0 =
=C2=A0 Option &quot;AllowEmptyInitialConfiguration&quot;<br>EndSection<br><=
br>Section &quot;OutputClass&quot;<br>=C2=A0 =C2=A0 Identifier &quot;nvidia=
-drm&quot;<br>=C2=A0 =C2=A0 MatchDriver &quot;nvidia-drm&quot;<br>=C2=A0 =
=C2=A0 Driver &quot;nvidia-modeset&quot;<br>=C2=A0 =C2=A0 Option &quot;Allo=
wEmptyInitialConfiguration&quot;<br>EndSection<br><br>Section &quot;OutputC=
lass&quot;<br>=C2=A0 =C2=A0 Identifier &quot;nvidia-drm2&quot;<br>=C2=A0 =
=C2=A0 MatchDriver &quot;nvidia-drm&quot;<br>=C2=A0 =C2=A0 Driver &quot;drm=
_kms_helper&quot;<br>=C2=A0 =C2=A0 Option &quot;AllowEmptyInitialConfigurat=
ion&quot;<br>EndSection<br><br>Section &quot;OutputClass&quot;<br>=C2=A0 =
=C2=A0 Identifier &quot;nvidia-drm3&quot;<br>=C2=A0 =C2=A0 MatchDriver &quo=
t;nvidia-drm&quot;<br>=C2=A0 =C2=A0 Driver &quot;drm&quot;<br>=C2=A0 =C2=A0=
 Option &quot;AllowEmptyInitialConfiguration&quot;<br>EndSection<br><br>Sec=
tion &quot;OutputClass&quot;<br>=C2=A0 =C2=A0 Identifier &quot;nvidia-modes=
et&quot;<br>=C2=A0 =C2=A0 MatchDriver &quot;nvidia-modeset&quot;<br>=C2=A0 =
=C2=A0 Driver &quot;nvidia&quot;<br>=C2=A0 =C2=A0 Option &quot;AllowEmptyIn=
itialConfiguration&quot;<br>EndSection<br></div><div><br></div><div>Anymore=
? autorelational?</div><div><br></div><div>aTI,</div><div><br></div><div>L.=
 F</div><div><br></div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr=
" class=3D"gmail_attr">On Sun, Sep 19, 2021 at 12:50 AM __- -__ &lt;<a href=
=3D"mailto:isapgswell@gmail.com">isapgswell@gmail.com</a>&gt; wrote:<br></d=
iv><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bord=
er-left:1px solid rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr">Hi,<d=
iv><br></div><div>One observation related into 10-nvidia.conf file</div><di=
v><br></div><div>Section &quot;OutputClass&quot;<br>=C2=A0 =C2=A0 Identifie=
r &quot;nvidia&quot;<br>=C2=A0 =C2=A0 MatchDriver &quot;nvidia-drm&quot;<br=
>=C2=A0 =C2=A0 <font color=3D"#00ff00" style=3D"background-color:rgb(255,25=
5,0)">Driver &quot;nvidia-modeset&quot;</font><br>=C2=A0 =C2=A0 Option &quo=
t;AllowEmptyInitialConfiguration&quot;<br>=C2=A0 =C2=A0 ModulePath &quot;/u=
sr/lib/x86_64-linux-gnu/nvidia/xorg&quot;<br>EndSection<br></div><div><br><=
/div><div>aTI,</div><div><br></div><div>L. F</div></div><br><div class=3D"g=
mail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Sat, Sep 18, 2021 at 6=
:21 PM __- -__ &lt;<a href=3D"mailto:isapgswell@gmail.com" target=3D"_blank=
">isapgswell@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_q=
uote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,2=
04);padding-left:1ex"><div dir=3D"ltr">Hi,<div><br></div><div>I would like =
to share my 3 files at /usr/share/X11/xorg.conf.d/</div><div><br></div><div=
><span style=3D"background-color:rgb(255,255,0)">xorg.conf=C2=A0</span></di=
v><div><span style=3D"background-color:rgb(255,255,0)">10-nvidia.conf</span=
></div><div><span style=3D"background-color:rgb(255,255,0)">11-nvidia-offlo=
ad.conf</span><br></div><div><br></div><div><span style=3D"background-color=
:rgb(255,255,0)"><font color=3D"#00ff00">a) xorg</font></span></div><div>Se=
ction &quot;Files&quot;<br>=C2=A0 =C2=A0ModulePath &quot;/usr/lib/xorg&quot=
;<br>EndSection<br><br>Section &quot;Device&quot;<br>=C2=A0 =C2=A0Identifie=
r &quot;intel&quot;<br>=C2=A0 =C2=A0Driver &quot;i915&quot;<br>=C2=A0 =C2=
=A0Option &quot;DRI2&quot; &quot;on&quot;<br>=C2=A0 =C2=A0BusID &quot;PCI:0=
:2:0&quot;<br># =C2=A0 Option &quot;AccelMethod&quot; &quot;uxa&quot;<br>En=
dSection<br><br>Section &quot;Screen&quot;<br>=C2=A0 =C2=A0Identifier &quot=
;intel&quot;<br>=C2=A0 =C2=A0Device &quot;intel&quot;<br>EndSection<br><br>=
Section &quot;Device&quot;<br>=C2=A0 =C2=A0Identifier &quot;nvidia-drm&quot=
;<br>=C2=A0 =C2=A0Driver &quot;nvidia-drm&quot;<br>EndSection<br><br>Sectio=
n &quot;Device&quot;<br>=C2=A0 =C2=A0Identifier &quot;nvidia-modeset&quot;<=
br>=C2=A0 =C2=A0Driver &quot;nvidia-modeset&quot;<br>EndSection<br><br>Sect=
ion &quot;Device&quot;<br>=C2=A0 =C2=A0Identifier &quot;nvidia&quot;<br>=C2=
=A0 =C2=A0Driver &quot;nvidia&quot;<br>=C2=A0 =C2=A0BusID &quot;PCI:1:0:0&q=
uot;<br>EndSection<br><br>Section &quot;ServerFlags&quot;<br>=C2=A0 =C2=A0O=
ption &quot;DefaultServerLayout&quot; &quot;layout&quot;<br>=C2=A0 =C2=A0Op=
tion &quot;DisableVidModeExtension&quot; =C2=A0&quot;on&quot;<br>=C2=A0 =C2=
=A0Option &quot;AIGLX&quot; &quot;off&quot;<br>=C2=A0 =C2=A0Option &quot;In=
directGLX&quot; &quot;off&quot;<br>=C2=A0 =C2=A0Option &quot;GlxVisuals&quo=
t; &quot;minimal&quot;<br>=C2=A0 =C2=A0Option &quot;Log&quot; &quot;flush&q=
uot;<br>=C2=A0 =C2=A0Option &quot;DontVTSwitch&quot; =C2=A0&quot;on&quot;<b=
r>=C2=A0 =C2=A0Option &quot;DontZap&quot; =C2=A0&quot;on&quot;<br>=C2=A0 =
=C2=A0Option &quot;DontZoom&quot; =C2=A0&quot;on&quot;<br>=C2=A0 =C2=A0Opti=
on &quot;AutoAddDevices&quot; &quot;on&quot;<br>=C2=A0 =C2=A0Option &quot;A=
utoEnableDevices&quot; &quot;off&quot;<br>=C2=A0 =C2=A0Option &quot;AutoAdd=
GPU&quot; &quot;on&quot;<br>=C2=A0 =C2=A0Option &quot;AutoBindGPU&quot; =C2=
=A0&quot;off&quot;<br>EndSection<br><br>Section &quot;Extensions&quot;<br>=
=C2=A0 =C2=A0Option &quot;RENDER&quot; &quot;Enable&quot;<br>=C2=A0 =C2=A0O=
ption &quot;Composite&quot; &quot;Enable&quot;<br>=C2=A0 =C2=A0Option &quot=
;GLX&quot;	&quot;Enable&quot;<br>=C2=A0 =C2=A0Option &quot;MIT-SHM&quot; &q=
uot;Disable&quot;<br>EndSection<br></div><div><br></div><div><font color=3D=
"#ffff00" style=3D"background-color:rgb(0,255,0)">b) 10-nvidia.conf (same a=
s default)</font></div><div>Section &quot;OutputClass&quot;<br>=C2=A0 =C2=
=A0 Identifier &quot;nvidia&quot;<br>=C2=A0 =C2=A0 MatchDriver &quot;nvidia=
-drm&quot;<br>=C2=A0 =C2=A0 Driver &quot;nvidia&quot;<br>=C2=A0 =C2=A0 Opti=
on &quot;AllowEmptyInitialConfiguration&quot;<br>=C2=A0 =C2=A0 ModulePath &=
quot;/usr/lib/x86_64-linux-gnu/nvidia/xorg&quot;<br>EndSection<br></div><di=
v><br></div><div><font style=3D"background-color:rgb(255,255,0)" color=3D"#=
00ff00">c)=C2=A011-nvidia-offload.conf</font></div><div>Section &quot;Serve=
rLayout&quot;<br>=C2=A0 =C2=A0 Identifier &quot;layout&quot;<br>=C2=A0 =C2=
=A0 Screen 0 &quot;intel&quot; 0 0<br>=C2=A0 =C2=A0 Inactive &quot;nvidia-d=
rm&quot;<br>=C2=A0 =C2=A0 Inactive &quot;nvidia-modeset&quot;<br>=C2=A0 =C2=
=A0 Inactive &quot;nvidia&quot;<br>=C2=A0 =C2=A0 Option &quot;AllowNVIDIAGP=
UScreens&quot;<br>EndSection</div><div><br></div><div>My dGPU is a 940mx (n=
vidia) playing at 2560x1080, ubuntu 20.04 LTS</div><div><br></div><div>aTI,=
</div><div><br></div><div>L. F</div></div>
</blockquote></div>
</blockquote></div>

--0000000000005359d105cc52b8db--
