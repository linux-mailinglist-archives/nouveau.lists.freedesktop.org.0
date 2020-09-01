Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7497F259DBE
	for <lists+nouveau@lfdr.de>; Tue,  1 Sep 2020 19:58:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 952E16E8B6;
	Tue,  1 Sep 2020 17:58:18 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com
 [IPv6:2a00:1450:4864:20::243])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 80C386E893
 for <nouveau@lists.freedesktop.org>; Tue,  1 Sep 2020 17:58:17 +0000 (UTC)
Received: by mail-lj1-x243.google.com with SMTP id r13so2651127ljm.0
 for <nouveau@lists.freedesktop.org>; Tue, 01 Sep 2020 10:58:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=94C8swyG8tpM6J6qgnZthWRNy4TzLn35F00vjCBaVsA=;
 b=UC3QYAOp7653Uyt5w7nFNrUvfko3DrKg9bUvUZEmBke9A2IcN+d6c5B3ZifRibRnbX
 rfkwN4vtTZmN3ph0buEwrAWnjJq+oQ9fnM5s8aqwTYzjB922elxv3H7Jh0Gxd53oTm8S
 n0cN72JuCnN3KzXWPHcOmRppqtrPsrZ/z7q12eOFQhdcLrbCpRaoEM8ES/z9IsdA5vAI
 aXGzVbYliI7IDKLVyC6QqqA5I3hlOll+DNJFU219aBCs7azZe4ctspPXpdGSTNyPrPKW
 OOpRtyk7Siw0bR+Vl9nlgOVeltuC4ATKOgFTuIEmIh5LH+h/B9HooK9ILw0+ibo4GJYw
 Mwpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=94C8swyG8tpM6J6qgnZthWRNy4TzLn35F00vjCBaVsA=;
 b=GgcwJ3Sxq3VJwuF1u01+jMHExWawZiJ92OBplR8uk8ZG6uzELK1tXA0UVEfdwkC9/k
 6CMQI3jbYFOl9tZ7BpgnAoLEXOtHBY6Z1NLN7cFlETqS3dJvagc/SdJAmWkF+IwhtL1q
 QvRY3DYs91Bz1okdKBjQ3eWafnBrigfgN+WH8s+meSrvlJPvspwhk34UlAnf7sISDCAr
 l0m7PxGIj8tJ14Jn12JhILhrhGXo7cTcv8VoHlCVJF6+6Z0Bz3HSSQDFAPgVcQEQHkt/
 xygnyHMLbBLNWEFKIEHvCNwnK0NYInjfE1lznNx3hfF7WtDrSIK0ZD8aaJ4JF4vCLDpx
 lq/Q==
X-Gm-Message-State: AOAM5318WJJ1oQCd61n8HR8gzT3r0MqsRZR1e9OJdEmIYYrWbRW+fMbm
 UcA3I883kb5/6B+NJY5n2r+zje1mmJVTb1Y3ez+QbaOwGU/N7A==
X-Google-Smtp-Source: ABdhPJyDkkrH3siOz82aDIDWjhQhddL5TAQOTMYoZ9WvBN1nUhDSQGqCw009anvd3aX1MM/joZx+h7EZ7KuuspI8J+w=
X-Received: by 2002:a05:651c:310:: with SMTP id
 a16mr1161294ljp.250.1598983095773; 
 Tue, 01 Sep 2020 10:58:15 -0700 (PDT)
MIME-Version: 1.0
References: <CAKiGokHoArQcnVAPs0HWzJSFXhwCSLfQAirOQ-zTq=0C-97neQ@mail.gmail.com>
 <CAKb7Uvh4cdg0=dGJqQVXx_p4O2c5BJbG3JRnjznwjsMQwc505Q@mail.gmail.com>
 <CAKiGokGj8pfm1tmH0aN7de5FVvrszAA93_e9-Zq05oqw46GnRg@mail.gmail.com>
 <CAKb7UvhE8i9E7XxxwrpQX1rSvLHk63tFt7dyv_0XAAxu4O5=iA@mail.gmail.com>
 <CAKiGokFrYM6Cpw9DkYg_ntcvYi4f=2ezJ0ULS7CK0cGucARxsQ@mail.gmail.com>
In-Reply-To: <CAKiGokFrYM6Cpw9DkYg_ntcvYi4f=2ezJ0ULS7CK0cGucARxsQ@mail.gmail.com>
From: Julien Isorce <julien.isorce@gmail.com>
Date: Tue, 1 Sep 2020 10:58:04 -0700
Message-ID: <CAHWPjbXftMYRUm3QgmoLWKpiyPm88G=F3nbv5Q0vs1Rz_PLVBA@mail.gmail.com>
To: Analabha Roy <hariseldon99@gmail.com>
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
Cc: nouveau <nouveau@lists.freedesktop.org>
Content-Type: multipart/mixed; boundary="===============1887747163=="
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

--===============1887747163==
Content-Type: multipart/alternative; boundary="0000000000006ceec105ae4443db"

--0000000000006ceec105ae4443db
Content-Type: text/plain; charset="UTF-8"

Hi,

Try:  DRI_PRIME=1 LIBVA_DRIVER_NAME=nouveau vainfo --display drm --device
/dev/dri/renderD129

Also try with and without the --device option, the important one is
--display drm

Cheers
Julien

On Tue, Sep 1, 2020 at 10:49 AM Analabha Roy <hariseldon99@gmail.com> wrote:

>
>
> On Tue, 1 Sep 2020 at 18:59, Ilia Mirkin <imirkin@alum.mit.edu> wrote:
>
>> On Tue, Sep 1, 2020 at 9:10 AM Analabha Roy <hariseldon99@gmail.com>
>> wrote:
>> > Any suggestions on how to trace the config issues? Do I have to debug
>> the va_openDriver() function?
>>
>> My guess, without reading any code, is that DRI_PRIME isn't doing what
>> you want it to, and the nouveau driver is being handed an intel
>> device. This does not work well. Fixing this will require tracing
>> through the va winsys code which to figure out how it invokes the
>> loader.
>>
>>
>> https://cgit.freedesktop.org/mesa/mesa/tree/src/gallium/frontends/va/context.c#n111
>>
>> For the DRM/rendernodes "platform", it will just take whatever fd it
>> is given. vainfo appears to give it a fixed device:
>>
>>
>> https://github.com/intel/libva-utils/blob/master/common/va_display_drm.c#L39
>>
>> However it looks like you can pass in --device /dev/dri/renderD129 or
>> whatever the right one is, which should pass in the right render node,
>> as seen here:
>>
>> https://github.com/intel/libva-utils/blob/master/common/va_display.c#L80
>>
>> Note that I've never tried this, just did a few google searches to
>> find this stuff.
>>
>>
> Brilliant googling. get_drm_device_name() does seem to do a crude argparse
> of "--device"
>
> So I ran
>
> $ DRI_PRIME=1 LIBVA_DRIVER_NAME=nouveau vainfo --device /dev/dri/renderD128
>
> *vainfo: unrecognized option '--device'*Show information from VA-API
> driver
> Usage: vainfo --help
>         --help print this message
>
> Usage: vainfo [options]
> Display options:
>         --display display | help         Show information for the
> specified display, or the available display list
>
> *        --device device                  Set device name, only available
> under drm display*
>
>
> What does this mean?
>
>  Note that I also ran
>
>
> $ nm -Dn -o /usr/lib/x86_64-linux-gnu/libva*|grep get_drm_device_name
>
> Didn't get anything...
>
> Cheers,
>>
>>   -ilia
>>
>
>
> --
> Analabha Roy
> Assistant Professor
> Department of Physics
> <http://www.buruniv.ac.in/academics/department/physics>
> The University of Burdwan <http://www.buruniv.ac.in/>
> Golapbag Campus, Barddhaman 713104
> West Bengal, India
> Emails: daneel@utexas.edu, aroy@phys.buruniv.ac.in, hariseldon99@gmail.com
> Webpage: http://www.ph.utexas.edu/~daneel/
> _______________________________________________
> Nouveau mailing list
> Nouveau@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/nouveau
>

--0000000000006ceec105ae4443db
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi,<div><br></div><div>Try:=C2=A0 DRI_PRIME=3D1 LIBVA_DRIV=
ER_NAME=3Dnouveau vainfo=C2=A0<span style=3D"color:rgb(36,41,46);font-famil=
y:-apple-system,BlinkMacSystemFont,&quot;Segoe UI&quot;,Helvetica,Arial,san=
s-serif,&quot;Apple Color Emoji&quot;,&quot;Segoe UI Emoji&quot;;font-size:=
14px">--display drm --device /dev/dri/renderD129</span></div><div><span sty=
le=3D"color:rgb(36,41,46);font-family:-apple-system,BlinkMacSystemFont,&quo=
t;Segoe UI&quot;,Helvetica,Arial,sans-serif,&quot;Apple Color Emoji&quot;,&=
quot;Segoe UI Emoji&quot;;font-size:14px"><br></span></div><div><span style=
=3D"color:rgb(36,41,46);font-family:-apple-system,BlinkMacSystemFont,&quot;=
Segoe UI&quot;,Helvetica,Arial,sans-serif,&quot;Apple Color Emoji&quot;,&qu=
ot;Segoe UI Emoji&quot;;font-size:14px">Also try with and without the --dev=
ice option, the important one is --display drm</span></div><div><span style=
=3D"color:rgb(36,41,46);font-family:-apple-system,BlinkMacSystemFont,&quot;=
Segoe UI&quot;,Helvetica,Arial,sans-serif,&quot;Apple Color Emoji&quot;,&qu=
ot;Segoe UI Emoji&quot;;font-size:14px"><br></span></div><div><span style=
=3D"color:rgb(36,41,46);font-family:-apple-system,BlinkMacSystemFont,&quot;=
Segoe UI&quot;,Helvetica,Arial,sans-serif,&quot;Apple Color Emoji&quot;,&qu=
ot;Segoe UI Emoji&quot;;font-size:14px">Cheers</span></div><div><span style=
=3D"color:rgb(36,41,46);font-family:-apple-system,BlinkMacSystemFont,&quot;=
Segoe UI&quot;,Helvetica,Arial,sans-serif,&quot;Apple Color Emoji&quot;,&qu=
ot;Segoe UI Emoji&quot;;font-size:14px">Julien</span></div></div><br><div c=
lass=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, Sep 1, 2=
020 at 10:49 AM Analabha Roy &lt;<a href=3D"mailto:hariseldon99@gmail.com" =
target=3D"_blank">hariseldon99@gmail.com</a>&gt; wrote:<br></div><blockquot=
e class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px s=
olid rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr"><div dir=3D"ltr"><=
br></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_att=
r">On Tue, 1 Sep 2020 at 18:59, Ilia Mirkin &lt;<a href=3D"mailto:imirkin@a=
lum.mit.edu" target=3D"_blank">imirkin@alum.mit.edu</a>&gt; wrote:<br></div=
><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border=
-left:1px solid rgb(204,204,204);padding-left:1ex">On Tue, Sep 1, 2020 at 9=
:10 AM Analabha Roy &lt;<a href=3D"mailto:hariseldon99@gmail.com" target=3D=
"_blank">hariseldon99@gmail.com</a>&gt; wrote:<br>
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
><div dir=3D"ltr"><div><div dir=3D"ltr"><div>Analabha Roy<br></div><div>Ass=
istant Professor</div><div><a href=3D"http://www.buruniv.ac.in/academics/de=
partment/physics" target=3D"_blank">Department of Physics</a></div><div><a =
href=3D"http://www.buruniv.ac.in/" target=3D"_blank">The University of Burd=
wan</a></div><div>Golapbag Campus, Barddhaman 713104</div><div>West Bengal,=
 India</div><div>Emails: <a href=3D"mailto:daneel@utexas.edu" target=3D"_bl=
ank">daneel@utexas.edu</a>, <a href=3D"mailto:aroy@phys.buruniv.ac.in" targ=
et=3D"_blank">aroy@phys.buruniv.ac.in</a>, <a href=3D"mailto:hariseldon99@g=
mail.com" target=3D"_blank">hariseldon99@gmail.com</a><br><div><font face=
=3D"tahoma, sans-serif">Webpage: <a href=3D"http://www.ph.utexas.edu/~danee=
l/" target=3D"_blank">http://www.ph.utexas.edu/~daneel/</a></font></div></d=
iv></div></div></div></div></div>
_______________________________________________<br>
Nouveau mailing list<br>
<a href=3D"mailto:Nouveau@lists.freedesktop.org" target=3D"_blank">Nouveau@=
lists.freedesktop.org</a><br>
<a href=3D"https://lists.freedesktop.org/mailman/listinfo/nouveau" rel=3D"n=
oreferrer" target=3D"_blank">https://lists.freedesktop.org/mailman/listinfo=
/nouveau</a><br>
</blockquote></div>

--0000000000006ceec105ae4443db--

--===============1887747163==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1887747163==--
