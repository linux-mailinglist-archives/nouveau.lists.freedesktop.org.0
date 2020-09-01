Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BF391259D98
	for <lists+nouveau@lfdr.de>; Tue,  1 Sep 2020 19:49:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 262336E87E;
	Tue,  1 Sep 2020 17:49:06 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-ot1-x344.google.com (mail-ot1-x344.google.com
 [IPv6:2607:f8b0:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 316676E87E
 for <nouveau@lists.freedesktop.org>; Tue,  1 Sep 2020 17:49:05 +0000 (UTC)
Received: by mail-ot1-x344.google.com with SMTP id u25so1917180otq.6
 for <nouveau@lists.freedesktop.org>; Tue, 01 Sep 2020 10:49:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:cc;
 bh=39NqY4MrodEm5PBdDJFeVizVkRk4bGaFNb8Vc+G8pRY=;
 b=p7DNt7KVGJxw9YoL0oYldd+jpgOcZHEuBFRfdcpP7ww3MXdeBBXAcpwLQmwbKhLTaQ
 4rMxKwIbqsralKxEMCtmKG6sKtBurS0tRkD5X0yHP3gi0ZSE7NGp9dWID5ryLJhXny/x
 amWPFAjC3ScA8Wr3CMsHpj21qPGlofIy2+AV6oonS6GhkKSJYpe+s85ZIZN777Ii9Rxh
 z8iS5KUwEXuI5+f+/iooTm3UAOEd2O87Kittr3gQhDqbKnjtRbEDeUUiaVYT/I0q6xHv
 V5dGGSedddAhny+E8Zavf1sEUGIkg5kaIBhiL5JxTG1dLo6fEsFsnnN4pP8oOlHMnu6P
 Mabw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:cc;
 bh=39NqY4MrodEm5PBdDJFeVizVkRk4bGaFNb8Vc+G8pRY=;
 b=t9SrfjFtTAVOhdBV9aTZ3UJZqM4JxXxCRqSUmKaWGm60O0sJna8x0VV5ttH9v7Nvre
 St+wYQkP0krSTT2mjPRmCPK2s53a/ToqI3/zR6bATt9d9X3CLNGb0tdu8Zf+ecNnL/DQ
 O/8CkxhyablRsMGiRshr+sVqn4XGRy16l3dg9Q9jZdcfOoP/M1VZdiE8o/eDLZKtvEGo
 PQRLSHP1Pz6QR/SIZ8WQAVcCRO1Q29VuiywBuW8IupLYGcfp2eaKdrzeZsiRE3Lj+ghl
 Tac2zKV07fw/fqEM06/O0VkEdn7dlcg/ZOKCt7DBivzlPuMudTIwt1HHRp4so7Yw8MqD
 MnUw==
X-Gm-Message-State: AOAM5301RqQCSwSqntvM8TQuHelAoJBtqfJWi2kMx3lECu5ldsgV/Tyt
 6/tjMrML8mlM+3+hkGjMkmrqJaPCbjqRsCURn4ZmvXGBvbt09g==
X-Google-Smtp-Source: ABdhPJxIaHy8AP5LM/TfS4+fPkXUs0cHu58mzlnYhvvy8+IO2vniym9QO0OEiMiO9jyNBw84UszbWEOSKpHNJ5x/E/Q=
X-Received: by 2002:a05:6830:13d7:: with SMTP id
 e23mr1715262otq.98.1598982544078; 
 Tue, 01 Sep 2020 10:49:04 -0700 (PDT)
MIME-Version: 1.0
References: <CAKiGokHoArQcnVAPs0HWzJSFXhwCSLfQAirOQ-zTq=0C-97neQ@mail.gmail.com>
 <CAKb7Uvh4cdg0=dGJqQVXx_p4O2c5BJbG3JRnjznwjsMQwc505Q@mail.gmail.com>
 <CAKiGokGj8pfm1tmH0aN7de5FVvrszAA93_e9-Zq05oqw46GnRg@mail.gmail.com>
 <CAKb7UvhE8i9E7XxxwrpQX1rSvLHk63tFt7dyv_0XAAxu4O5=iA@mail.gmail.com>
In-Reply-To: <CAKb7UvhE8i9E7XxxwrpQX1rSvLHk63tFt7dyv_0XAAxu4O5=iA@mail.gmail.com>
From: Analabha Roy <hariseldon99@gmail.com>
Date: Tue, 1 Sep 2020 23:18:52 +0530
Message-ID: <CAKiGokFrYM6Cpw9DkYg_ntcvYi4f=2ezJ0ULS7CK0cGucARxsQ@mail.gmail.com>
Cc: nouveau <nouveau@lists.freedesktop.org>
Subject: Re: [Nouveau] VAAPI on GeForce GT 620M
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
Content-Type: multipart/mixed; boundary="===============1258197646=="
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

--===============1258197646==
Content-Type: multipart/alternative; boundary="0000000000008abc4005ae44225b"

--0000000000008abc4005ae44225b
Content-Type: text/plain; charset="UTF-8"

On Tue, 1 Sep 2020 at 18:59, Ilia Mirkin <imirkin@alum.mit.edu> wrote:

> On Tue, Sep 1, 2020 at 9:10 AM Analabha Roy <hariseldon99@gmail.com>
> wrote:
> > Any suggestions on how to trace the config issues? Do I have to debug
> the va_openDriver() function?
>
> My guess, without reading any code, is that DRI_PRIME isn't doing what
> you want it to, and the nouveau driver is being handed an intel
> device. This does not work well. Fixing this will require tracing
> through the va winsys code which to figure out how it invokes the
> loader.
>
>
> https://cgit.freedesktop.org/mesa/mesa/tree/src/gallium/frontends/va/context.c#n111
>
> For the DRM/rendernodes "platform", it will just take whatever fd it
> is given. vainfo appears to give it a fixed device:
>
>
> https://github.com/intel/libva-utils/blob/master/common/va_display_drm.c#L39
>
> However it looks like you can pass in --device /dev/dri/renderD129 or
> whatever the right one is, which should pass in the right render node,
> as seen here:
>
> https://github.com/intel/libva-utils/blob/master/common/va_display.c#L80
>
> Note that I've never tried this, just did a few google searches to
> find this stuff.
>
>
Brilliant googling. get_drm_device_name() does seem to do a crude argparse
of "--device"

So I ran

$ DRI_PRIME=1 LIBVA_DRIVER_NAME=nouveau vainfo --device /dev/dri/renderD128

*vainfo: unrecognized option '--device'*Show information from VA-API driver
Usage: vainfo --help
        --help print this message

Usage: vainfo [options]
Display options:
        --display display | help         Show information for the specified
display, or the available display list

*        --device device                  Set device name, only available
under drm display*


What does this mean?

 Note that I also ran


$ nm -Dn -o /usr/lib/x86_64-linux-gnu/libva*|grep get_drm_device_name

Didn't get anything...

Cheers,
>
>   -ilia
>


-- 
Analabha Roy
Assistant Professor
Department of Physics
<http://www.buruniv.ac.in/academics/department/physics>
The University of Burdwan <http://www.buruniv.ac.in/>
Golapbag Campus, Barddhaman 713104
West Bengal, India
Emails: daneel@utexas.edu, aroy@phys.buruniv.ac.in, hariseldon99@gmail.com
Webpage: http://www.ph.utexas.edu/~daneel/

--0000000000008abc4005ae44225b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Tue, 1 Sep 2020 at 18:59, Ilia Mir=
kin &lt;<a href=3D"mailto:imirkin@alum.mit.edu">imirkin@alum.mit.edu</a>&gt=
; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px=
 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On Tue,=
 Sep 1, 2020 at 9:10 AM Analabha Roy &lt;<a href=3D"mailto:hariseldon99@gma=
il.com" target=3D"_blank">hariseldon99@gmail.com</a>&gt; wrote:<br>
&gt; Any suggestions on how to trace the config issues? Do I have to debug =
the va_openDriver() function?<br>
<br>
My guess, without reading any code, is that DRI_PRIME isn&#39;t doing what<=
br>
you want it to, and the nouveau driver is being handed an intel<br>
device. This does not work well. Fixing this will require tracing<br>
through the va winsys code which to figure out how it invokes the<br>
loader.<br>
<br>
<a href=3D"https://cgit.freedesktop.org/mesa/mesa/tree/src/gallium/frontend=
s/va/context.c#n111" rel=3D"noreferrer" target=3D"_blank">https://cgit.free=
desktop.org/mesa/mesa/tree/src/gallium/frontends/va/context.c#n111</a><br>
<br>
For the DRM/rendernodes &quot;platform&quot;, it will just take whatever fd=
 it<br>
is given. vainfo appears to give it a fixed device:<br>
<br>
<a href=3D"https://github.com/intel/libva-utils/blob/master/common/va_displ=
ay_drm.c#L39" rel=3D"noreferrer" target=3D"_blank">https://github.com/intel=
/libva-utils/blob/master/common/va_display_drm.c#L39</a><br>
<br>
However it looks like you can pass in --device /dev/dri/renderD129 or<br>
whatever the right one is, which should pass in the right render node,<br>
as seen here:<br>
<br>
<a href=3D"https://github.com/intel/libva-utils/blob/master/common/va_displ=
ay.c#L80" rel=3D"noreferrer" target=3D"_blank">https://github.com/intel/lib=
va-utils/blob/master/common/va_display.c#L80</a><br>
<br>
Note that I&#39;ve never tried this, just did a few google searches to<br>
find this stuff.<br>
<br></blockquote><div><br></div><div>Brilliant googling.=C2=A0get_drm_devic=
e_name() does seem to do a crude argparse of &quot;--device&quot;</div><div=
><br></div><div>So I ran</div><div><br></div><div>$ DRI_PRIME=3D1 LIBVA_DRI=
VER_NAME=3Dnouveau vainfo --device /dev/dri/renderD128<br><b><u>vainfo: unr=
ecognized option &#39;--device&#39;<br></u></b>Show information from VA-API=
 driver<br>Usage: vainfo --help<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 --help print=
 this message<br><br>Usage: vainfo [options]<br>Display options:<br>=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 --display display | help =C2=A0 =C2=A0 =C2=A0 =C2=A0 S=
how information for the specified display, or the available display list <b=
r><b><u>=C2=A0 =C2=A0 =C2=A0 =C2=A0 --device device =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Set device name, only available un=
der drm display<br></u></b></div><div><br></div><div><br></div><div>What do=
es this mean?</div><div><br></div><div>=C2=A0Note that I also ran</div><div=
><br></div><div><br></div><div>$ nm -Dn -o /usr/lib/x86_64-linux-gnu/libva*=
|grep get_drm_device_name</div><div><br></div><div>Didn&#39;t get anything.=
..</div><div><br></div><blockquote class=3D"gmail_quote" style=3D"margin:0p=
x 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
Cheers,<br>
<br>
=C2=A0 -ilia<br>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr"=
 class=3D"gmail_signature"><div dir=3D"ltr"><div><div dir=3D"ltr"><div>Anal=
abha Roy<br></div><div>Assistant Professor</div><div><a href=3D"http://www.=
buruniv.ac.in/academics/department/physics" target=3D"_blank">Department of=
 Physics</a></div><div><a href=3D"http://www.buruniv.ac.in/" target=3D"_bla=
nk">The University of Burdwan</a></div><div>Golapbag Campus, Barddhaman 713=
104</div><div>West Bengal, India</div><div>Emails: <a href=3D"mailto:daneel=
@utexas.edu" target=3D"_blank">daneel@utexas.edu</a>, <a href=3D"mailto:aro=
y@phys.buruniv.ac.in" target=3D"_blank">aroy@phys.buruniv.ac.in</a>, <a hre=
f=3D"mailto:hariseldon99@gmail.com" target=3D"_blank">hariseldon99@gmail.co=
m</a><br><div><font face=3D"tahoma, sans-serif">Webpage: <a href=3D"http://=
www.ph.utexas.edu/~daneel/" target=3D"_blank">http://www.ph.utexas.edu/~dan=
eel/</a></font></div></div></div></div></div></div></div>

--0000000000008abc4005ae44225b--

--===============1258197646==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1258197646==--
