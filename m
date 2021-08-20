Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 915AF3F3CA5
	for <lists+nouveau@lfdr.de>; Sun, 22 Aug 2021 00:27:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3EA6B6E040;
	Sat, 21 Aug 2021 22:26:50 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com
 [IPv6:2a00:1450:4864:20::131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 63AAD6EAA5
 for <nouveau@lists.freedesktop.org>; Fri, 20 Aug 2021 14:56:57 +0000 (UTC)
Received: by mail-lf1-x131.google.com with SMTP id o10so21147962lfr.11
 for <nouveau@lists.freedesktop.org>; Fri, 20 Aug 2021 07:56:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
 bh=n2ob0ZVui+TCEiC47xfidxoOvxGSi9DtDeWybzeIZR8=;
 b=G+hCucGTH0tBFsJEzJNKHS4/wOg4c08Uupysw8hq47rmDjiG91MrMFTJ6QB9hoC3mc
 dj6bmCK4cE6+Ac1030SS3+4qClgxixiczHd9EeK36n3ST9KLeJJ37ov1BfWza965cOLr
 Ckk/Kxxd5wxSMrCEr1fvsgk57NrIkrw9B4S0hKdUM5wOIAZn/fwDt0QyeJ5LGvlwCyws
 q/d21wV6ZSvqvBi8uqD/37ogq7X7R+11AoRKlnxqE0NzzOMf2KZtDno1u7l5fk2JAbc4
 wLVeRmxYHH7SH/ELXFR5O29zOkz8LpZtNo86LCVmRc7V+ARWKoDkQPL0hnQCYQYs9aCb
 79Lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to;
 bh=n2ob0ZVui+TCEiC47xfidxoOvxGSi9DtDeWybzeIZR8=;
 b=LGFyZh9OoKzkLk5zYs4afIUMTDxA67zHIspSrcUkcyjLBoJuyrMpAoTH7GomGzKh0a
 g4FdlVLZqjMQ+CZE30hnVe1+db1OIEiLNdbnVRyBuQByh7xvO33xa9HVs1tcCKf+mVYe
 yj4WjkM2yVCfX1lR1hTz436hQPGmZW/WwB8KD975n2dW08mRYarLkuc6MMFee4t6n35G
 lFdieqjzdk7bzHOGa9CJ0UeU9yWvLWpLjVvbaHheDt61561ZHmy2pHQe8j0tN2WFPw5D
 9hZCEOh6/aJBYfKlukVKSGlFthEPq7Y1H+vkom/9sP55OVS1x3uin2OqRPpTEoHJUxK1
 XCQg==
X-Gm-Message-State: AOAM530z8sXA5tL8y/Ja3uNT0sXvQCUKVd2Ub51xGe/eoxQ6ZHe865dv
 19nv6PdMBi4WHyEOB/K4EduAmd/uN+cCGKIhETzu3R2l63M=
X-Google-Smtp-Source: ABdhPJwmAJxV3OGVxVI+GK910mwZpRAinrXJz2uHCsnilyjm001Ecn99VjsBgDFADEp73sa49AmCmuak8CX2+Abe94s=
X-Received: by 2002:a05:6512:3d91:: with SMTP id
 k17mr15257897lfv.166.1629471415207; 
 Fri, 20 Aug 2021 07:56:55 -0700 (PDT)
MIME-Version: 1.0
References: <CAN9WMdPCE5xV+0OSt_tBS1gEU0u=Q23sceZ6brYrDUG2hQYVXQ@mail.gmail.com>
 <CAN9WMdP9zetk3HGRBSuAjovBn9P4xrgya8Zy01te+To6G1aNGg@mail.gmail.com>
 <CAN9WMdPt1TOSE4265bn+u3sRDqC4DyJFTZdOVP9FdRzjHJHUkg@mail.gmail.com>
In-Reply-To: <CAN9WMdPt1TOSE4265bn+u3sRDqC4DyJFTZdOVP9FdRzjHJHUkg@mail.gmail.com>
From: __- -__ <isapgswell@gmail.com>
Date: Fri, 20 Aug 2021 11:56:37 -0300
Message-ID: <CAN9WMdO_9t8RX0s6oOBwihGg3q3BS4=v+VODHn5MDoidM88ehg@mail.gmail.com>
To: nouveau@lists.freedesktop.org
Content-Type: multipart/alternative; boundary="000000000000e00ea305c9fee033"
X-Mailman-Approved-At: Sat, 21 Aug 2021 22:26:49 +0000
Subject: [Nouveau] Fwd: env NVIDIA ModulePath
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

--000000000000e00ea305c9fee033
Content-Type: text/plain; charset="UTF-8"

---------- Forwarded message ---------
From: __- -__ <isapgswell@gmail.com>
Date: Thu, Aug 19, 2021 at 7:09 PM
Subject: Re: env NVIDIA ModulePath
To: <linux-bugs@nvidia.com>


HI,

On nvidia on-demand profile there's noneed,
/usr/share/doc/xserver-xorg-video-intel/xorg.conf file; e

you can mv to /usr/share/doc/xserver-xorg-video-intel/xorg.conf.old

I recommend only vulkan and opengl-over-VK from steam lib games
cross-platform (top 5 xD)
Lutris|Proton can load dxvk as we know ...

With this "mastigating" we could only setup,

Section "ServerLayout"
    Identifier "layout"
    Option "AllowNVIDIAGPUScreens"
EndSection

Only one provider modesetting/intel
In this way we can load opengl games using opengl-over-VK layer or via
PRELOAD as described last thread and with nvidia related outputclass
exclusive. We need more tests

aTT,

LF



On Wed, Aug 18, 2021 at 5:49 PM __- -__ <isapgswell@gmail.com> wrote:

> Hi,
>
> PRELOAD
> ModulePath="/usr/lib/x86_64-linux-gnu/nvidia/xorg" __GL_SYNC_TO_VBLANK=0
> vblank_mode=0 LIBGL_ALWAYS_INDIRECT=true mesa_glthread=false
> LIBGL_DRI2_DISABLE=true LIBGL_DRI3_DISABLE=true __NV_PRIME_RENDER_OFFLOAD=1
> __GLX_VENDOR_LIBRARY_NAME=nvidia glxgears
>
> aTT,
>
> LF
>
> On Wed, Aug 18, 2021 at 2:14 AM __- -__ <isapgswell@gmail.com> wrote:
>
>> Hi,
>>
>> I think, if we follow the on-demand nvidia prime profile, we should
>> access nvidia xorg modules over env variable like that and nor outputcalsss
>> modulepath option.
>>
>> one line,
>>
>> ModulePath="/usr/lib/x86_64-linux-gnu/nvidia/xorg" __GL_SYNC_TO_VBLANK=0
>> vblank_mode=0 LIBGL_ALWAYS_INDIRECT=true mesa_glthread=false
>> LIBGL_DRI2_DISABLE=true LIBGL_DRI3_DISABLE=true __NV_PRIME_RENDER_OFFLOAD=1
>> __GLX_VENDOR_LIBRARY_NAME=nvidia glxgears
>>
>> my 10-nvidia.conf
>>
>> Section "OutputClass"
>>     Identifier "nvidia"
>>     MatchDriver "nvidia-drm"
>>     Driver "nvidia"
>>     Option "AllowEmptyInitialConfiguration"
>>     ModulePath "/usr/lib/x86_64-linux-gnu/nvidia/xorg"
>> EndSection
>>
>> Section "OutputClass"
>>     Identifier "intel"
>>     MatchDriver "i915"
>>     Driver "modesetting"
>>     Option "PrimaryGPU" "Yes"
>> EndSection
>>
>> and my 11-nvidia-offload
>>
>> Section "ServerLayout"
>>     Identifier "layout"
>>     Option         "Xinerama" "0"
>>     Option "AllowNVIDIAGPUScreens"
>> EndSection
>>
>>
>> please look at my prints attached
>>
>

--000000000000e00ea305c9fee033
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">---------- Forwarded message ---------<br>From: <strong cla=
ss=3D"gmail_sendername" dir=3D"auto">__- -__</strong> <span dir=3D"auto">&l=
t;<a href=3D"mailto:isapgswell@gmail.com">isapgswell@gmail.com</a>&gt;</spa=
n><br>Date: Thu, Aug 19, 2021 at 7:09 PM<br>Subject: Re: env NVIDIA ModuleP=
ath<br>To:  &lt;<a href=3D"mailto:linux-bugs@nvidia.com">linux-bugs@nvidia.=
com</a>&gt;<br></div><br><br><div dir=3D"ltr">HI,<div><br></div><div>On nvi=
dia on-demand profile there&#39;s noneed,=C2=A0<span style=3D"background-co=
lor:rgb(255,255,0)">/usr/share/doc/xserver-xorg-video-intel/xorg.conf</span=
> file; e</div><div><br></div><div>you can mv to=C2=A0<span style=3D"backgr=
ound-color:rgb(255,153,0)">/usr/share/doc/xserver-xorg-video-intel/xorg.con=
f.old</span></div><div><span style=3D"background-color:rgb(255,153,0)"><br>=
</span></div><div>I recommend only vulkan and <span style=3D"background-col=
or:rgb(255,255,0)">opengl-over-VK</span> from steam lib games cross-platfor=
m (top 5 xD)</div><div>Lutris|Proton can load <span style=3D"background-col=
or:rgb(255,255,0)">dxvk</span> as we know ...</div><div><br></div><div>With=
 this &quot;mastigating&quot; we could only setup,</div><div><span style=3D=
"color:rgb(255,255,0);background-color:rgb(0,0,0)"><br></span></div><div><s=
pan style=3D"color:rgb(255,255,0);background-color:rgb(0,0,0)">Section &quo=
t;ServerLayout&quot;</span><br style=3D"color:rgb(255,255,0);background-col=
or:rgb(0,0,0)"><span style=3D"color:rgb(255,255,0);background-color:rgb(0,0=
,0)">=C2=A0 =C2=A0 Identifier &quot;layout&quot;</span><br style=3D"color:r=
gb(255,255,0);background-color:rgb(0,0,0)"><span style=3D"color:rgb(255,255=
,0);background-color:rgb(0,0,0)">=C2=A0 =C2=A0 Option &quot;AllowNVIDIAGPUS=
creens&quot;</span><br style=3D"color:rgb(255,255,0);background-color:rgb(0=
,0,0)"><span style=3D"color:rgb(255,255,0);background-color:rgb(0,0,0)">End=
Section</span><br></div><div><br></div><div>Only one provider modesetting/i=
ntel</div><div>In this way we can load opengl games using=C2=A0<span style=
=3D"background-color:rgb(255,255,0)">opengl-over-VK</span> layer or via <sp=
an style=3D"background-color:rgb(255,255,0)">PRELOAD</span>=C2=A0as describ=
ed last thread and with nvidia related outputclass <span style=3D"backgroun=
d-color:rgb(255,255,0)">exclusive</span>. We need more tests</div><div><br>=
</div><div>aTT,</div><div><br></div><div>LF</div><div><br></div><div><br></=
div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_at=
tr">On Wed, Aug 18, 2021 at 5:49 PM __- -__ &lt;<a href=3D"mailto:isapgswel=
l@gmail.com" target=3D"_blank">isapgswell@gmail.com</a>&gt; wrote:<br></div=
><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border=
-left:1px solid rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr">Hi,<br>=
<div><br></div><div><span style=3D"background-color:rgb(255,0,255)"><font c=
olor=3D"#0000ff">PRELOAD</font></span></div><div><span style=3D"background-=
color:rgb(255,0,255)"><font color=3D"#0000ff">ModulePath</font></span>=3D&q=
uot;/usr/lib/x86_64-linux-gnu/nvidia/xorg&quot; __GL_SYNC_TO_VBLANK=3D0 vbl=
ank_mode=3D0 LIBGL_ALWAYS_INDIRECT=3Dtrue mesa_glthread=3Dfalse LIBGL_DRI2_=
DISABLE=3Dtrue LIBGL_DRI3_DISABLE=3Dtrue __NV_PRIME_RENDER_OFFLOAD=3D1 __GL=
X_VENDOR_LIBRARY_NAME=3Dnvidia glxgears<br></div><div><br></div><div>aTT,</=
div><div><br></div><div>LF</div></div><br><div class=3D"gmail_quote"><div d=
ir=3D"ltr" class=3D"gmail_attr">On Wed, Aug 18, 2021 at 2:14 AM __- -__ &lt=
;<a href=3D"mailto:isapgswell@gmail.com" target=3D"_blank">isapgswell@gmail=
.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"mar=
gin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1=
ex"><div dir=3D"ltr"><div>Hi,</div><div><br></div><div>I think, if we follo=
w the on-demand nvidia prime profile, we should access nvidia xorg modules =
over env variable like that and nor outputcalsss modulepath option.<br></di=
v><div><br></div><div>one line,</div><div><br></div><div><span style=3D"bac=
kground-color:rgb(0,0,0)"><span style=3D"color:rgb(255,255,0)">ModulePath=
=3D&quot;/usr/lib/x86_64-linux-gnu/nvidia/xorg&quot; __GL_SYNC_TO_VBLANK=3D=
0 vblank_mode=3D0 LIBGL_ALWAYS_INDIRECT=3Dtrue mesa_glthread=3Dfalse LIBGL_=
DRI2_DISABLE=3Dtrue LIBGL_DRI3_DISABLE=3Dtrue __NV_PRIME_RENDER_OFFLOAD=3D1=
 __GLX_VENDOR_LIBRARY_NAME=3Dnvidia glxgears</span></span></div><div><span =
style=3D"background-color:rgb(0,0,0)"><span style=3D"color:rgb(255,255,0)">=
<span style=3D"background-color:rgb(255,255,255)"><span></span></span><br><=
/span></span></div><div><span style=3D"background-color:rgb(0,255,0)"><span=
 style=3D"color:rgb(255,255,0)"><span style=3D"color:rgb(0,0,0)">my 10-nvid=
ia.conf</span></span></span></div><div><span style=3D"background-color:rgb(=
0,0,0)"><span style=3D"color:rgb(255,255,0)"><span style=3D"background-colo=
r:rgb(255,255,255)"><span style=3D"color:rgb(0,0,0)"><br></span></span></sp=
an></span></div><div><span style=3D"background-color:rgb(0,0,0)"><span styl=
e=3D"color:rgb(255,255,0)"><span style=3D"background-color:rgb(255,255,255)=
"><span style=3D"color:rgb(0,0,0)"></span></span>Section &quot;OutputClass&=
quot;<br>=C2=A0 =C2=A0 Identifier &quot;nvidia&quot;<br>=C2=A0 =C2=A0 Match=
Driver &quot;nvidia-drm&quot;<br>=C2=A0 =C2=A0 Driver &quot;nvidia&quot;<br=
>=C2=A0 =C2=A0 Option &quot;AllowEmptyInitialConfiguration&quot;<br>=C2=A0 =
=C2=A0 ModulePath &quot;/usr/lib/x86_64-linux-gnu/nvidia/xorg&quot;<br>EndS=
ection<br><br>Section &quot;OutputClass&quot;<br>=C2=A0 =C2=A0 Identifier &=
quot;intel&quot;<br>=C2=A0 =C2=A0 MatchDriver &quot;i915&quot;<br>=C2=A0 =
=C2=A0 Driver &quot;modesetting&quot;<br>=C2=A0 =C2=A0 Option &quot;Primary=
GPU&quot; &quot;Yes&quot; =C2=A0 =C2=A0<br>EndSection</span></span></div><d=
iv><span style=3D"background-color:rgb(0,0,0)"><span style=3D"color:rgb(255=
,255,0)"><br></span></span></div><div><span style=3D"background-color:rgb(0=
,0,0)"><span style=3D"color:rgb(255,255,0)"><span style=3D"background-color=
:rgb(0,255,0)"><span style=3D"color:rgb(0,0,0)">and my 11-nvidia-offload</s=
pan></span><br></span></span></div><div><span style=3D"background-color:rgb=
(0,0,0)"><span style=3D"color:rgb(255,255,0)"><br></span></span></div><div>=
<span style=3D"background-color:rgb(0,0,0)"><span style=3D"color:rgb(255,25=
5,0)">Section &quot;ServerLayout&quot;<br>=C2=A0 =C2=A0 Identifier &quot;la=
yout&quot;<br>=C2=A0 =C2=A0 Option =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;Xinera=
ma&quot; &quot;0&quot; =C2=A0 =C2=A0<br>=C2=A0 =C2=A0 Option &quot;AllowNVI=
DIAGPUScreens&quot;<br>EndSection</span></span></div><div><span style=3D"ba=
ckground-color:rgb(0,0,0)"><span style=3D"color:rgb(255,255,0)"><br></span>=
</span></div><div><span style=3D"background-color:rgb(0,0,0)"><span style=
=3D"color:rgb(255,255,0)"><br></span></span></div><div><span style=3D"backg=
round-color:rgb(0,0,0)"><span style=3D"color:rgb(255,255,0)"><span style=3D=
"background-color:rgb(255,255,255)"><span style=3D"color:rgb(0,0,0)">please=
 look at my prints attached</span></span> <br></span></span></div></div>
</blockquote></div>
</blockquote></div>
</div></div>

--000000000000e00ea305c9fee033--
