Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 957A625AC46
	for <lists+nouveau@lfdr.de>; Wed,  2 Sep 2020 15:47:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D1F86E8B4;
	Wed,  2 Sep 2020 13:47:57 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-ot1-x331.google.com (mail-ot1-x331.google.com
 [IPv6:2607:f8b0:4864:20::331])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 40B276E8B4
 for <nouveau@lists.freedesktop.org>; Wed,  2 Sep 2020 13:47:55 +0000 (UTC)
Received: by mail-ot1-x331.google.com with SMTP id i4so4303076ota.2
 for <nouveau@lists.freedesktop.org>; Wed, 02 Sep 2020 06:47:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
 bh=WeEtDiw4hxcOmLxq9AQdaEw8F2azdC3DPdO+5+m+KH8=;
 b=HsRfaBgZEO+pEpr27C3l5e1AjqtzrY5vhZfjmgXbJb6+NLIUSIawH7qEeDhZ0isVzJ
 y/o5tH3ucHQkXyZurFw8GPd3CDKbOO/nCzwAOxTjSaiXqJzF9qWDwfoxep4EDy6yKZp0
 9sHFzdum0/BEL5XD+dBAqaW2dQv2eAqvYpjdx6rQrSESaTHL0PrMhthQFb/W/5M2oFbv
 w92GUaO6lAjYkUEFgIw3mwpVlnA9NBDXsOxbFuiGWViES4q4SqIMcEIhxOYX/cKt59Mc
 14h6HRZSvPlA0M+J9vsL1fAIJjNeHRTseEq/cwJ93k59x1o94/ZE7oxj9nzcqqB5uWG2
 rW3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to;
 bh=WeEtDiw4hxcOmLxq9AQdaEw8F2azdC3DPdO+5+m+KH8=;
 b=bfUN4zuc1aBwEwdQpJju6Ay6MT6YXljDpRAKXfPrEF3AY/IkTFZ1PJTq6FBfBAh7RA
 duSOMuca1IUpdRDxIrhHlXyOV4nhXCVZ+O+uQzkHqv+OpiDpEAWxD30+i7sikkIwEml0
 Fy91k3cAFOeOSp2ufGMSkxF2TdHL4PMTFJ/PKQvs4GofqR37VbjbGmGPVUdiU9cKSd2H
 6IweliDpu40DX/1oHXZb4uqF7+YlvZzhr8Le5BkRpj5cohqC1St5YeZ8tnG4Gr1sgUXK
 iyRhqagpHHIA1OGJ2oedMCWHGWVSL2YmIbVa2mKnMpO0+WaEy+dOEg9HKyIqGI2AkX8N
 sq1A==
X-Gm-Message-State: AOAM533JdX33H946RfwNXc0Kynsm4y0mkH8UaiJ8vvnVcH1h7Ly0m4T9
 reV/sJA/2Pkn2q1KAM4gc4qqWpA2vqtUpxFvUNc9MCl5yhA=
X-Google-Smtp-Source: ABdhPJy+jo0pI55pN37MkIjggKBv5vxr34ufNAq0wexzur+xri92qrODl00uRh0izBMdmBlRaxx9TK9ErLmgM5LZnwg=
X-Received: by 2002:a9d:c0a:: with SMTP id 10mr2607780otr.249.1599054474100;
 Wed, 02 Sep 2020 06:47:54 -0700 (PDT)
MIME-Version: 1.0
References: <CAKiGokHoArQcnVAPs0HWzJSFXhwCSLfQAirOQ-zTq=0C-97neQ@mail.gmail.com>
 <CAKb7Uvh4cdg0=dGJqQVXx_p4O2c5BJbG3JRnjznwjsMQwc505Q@mail.gmail.com>
 <CAKiGokGj8pfm1tmH0aN7de5FVvrszAA93_e9-Zq05oqw46GnRg@mail.gmail.com>
 <CAKb7UvhE8i9E7XxxwrpQX1rSvLHk63tFt7dyv_0XAAxu4O5=iA@mail.gmail.com>
 <CAKiGokFrYM6Cpw9DkYg_ntcvYi4f=2ezJ0ULS7CK0cGucARxsQ@mail.gmail.com>
 <CAHWPjbXftMYRUm3QgmoLWKpiyPm88G=F3nbv5Q0vs1Rz_PLVBA@mail.gmail.com>
In-Reply-To: <CAHWPjbXftMYRUm3QgmoLWKpiyPm88G=F3nbv5Q0vs1Rz_PLVBA@mail.gmail.com>
From: Analabha Roy <hariseldon99@gmail.com>
Date: Wed, 2 Sep 2020 19:17:41 +0530
Message-ID: <CAKiGokEp_aCiVC4PHKXqByG2oGarRcOx2RRfvPWD2NEHPmD9vg@mail.gmail.com>
To: nouveau@lists.freedesktop.org
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
Content-Type: multipart/mixed; boundary="===============2079217350=="
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

--===============2079217350==
Content-Type: multipart/alternative; boundary="000000000000e7c38305ae54e189"

--000000000000e7c38305ae54e189
Content-Type: text/plain; charset="UTF-8"

On Tue, Sep 1, 2020, 23:28 Julien Isorce <julien.isorce@gmail.com> wrote:

> Hi,
>
> Try:  DRI_PRIME=1 LIBVA_DRIVER_NAME=nouveau vainfo --display drm --device
> /dev/dri/renderD129
>
> Also try with and without the --device option, the important one is
> --display drm
>




Nada, and nada. Exact same error as before, both cases.

waah!


> Cheers
> Julien
>
> On Tue, Sep 1, 2020 at 10:49 AM Analabha Roy <hariseldon99@gmail.com>
> wrote:
>
>>
>>
>> On Tue, 1 Sep 2020 at 18:59, Ilia Mirkin <imirkin@alum.mit.edu> wrote:
>>
>>> On Tue, Sep 1, 2020 at 9:10 AM Analabha Roy <hariseldon99@gmail.com>
>>> wrote:
>>> > Any suggestions on how to trace the config issues? Do I have to debug
>>> the va_openDriver() function?
>>>
>>> My guess, without reading any code, is that DRI_PRIME isn't doing what
>>> you want it to, and the nouveau driver is being handed an intel
>>> device. This does not work well. Fixing this will require tracing
>>> through the va winsys code which to figure out how it invokes the
>>> loader.
>>>
>>>
>>> https://cgit.freedesktop.org/mesa/mesa/tree/src/gallium/frontends/va/context.c#n111
>>>
>>> For the DRM/rendernodes "platform", it will just take whatever fd it
>>> is given. vainfo appears to give it a fixed device:
>>>
>>>
>>> https://github.com/intel/libva-utils/blob/master/common/va_display_drm.c#L39
>>>
>>> However it looks like you can pass in --device /dev/dri/renderD129 or
>>> whatever the right one is, which should pass in the right render node,
>>> as seen here:
>>>
>>> https://github.com/intel/libva-utils/blob/master/common/va_display.c#L80
>>>
>>> Note that I've never tried this, just did a few google searches to
>>> find this stuff.
>>>
>>>
>> Brilliant googling. get_drm_device_name() does seem to do a crude
>> argparse of "--device"
>>
>> So I ran
>>
>> $ DRI_PRIME=1 LIBVA_DRIVER_NAME=nouveau vainfo --device
>> /dev/dri/renderD128
>>
>> *vainfo: unrecognized option '--device'*Show information from VA-API
>> driver
>> Usage: vainfo --help
>>         --help print this message
>>
>> Usage: vainfo [options]
>> Display options:
>>         --display display | help         Show information for the
>> specified display, or the available display list
>>
>> *        --device device                  Set device name, only available
>> under drm display*
>>
>>
>> What does this mean?
>>
>>  Note that I also ran
>>
>>
>> $ nm -Dn -o /usr/lib/x86_64-linux-gnu/libva*|grep get_drm_device_name
>>
>> Didn't get anything...
>>
>> Cheers,
>>>
>>>   -ilia
>>>
>>
>>
>> --
>> Analabha Roy
>> Assistant Professor
>> Department of Physics
>> <http://www.buruniv.ac.in/academics/department/physics>
>> The University of Burdwan <http://www.buruniv.ac.in/>
>> Golapbag Campus, Barddhaman 713104
>> West Bengal, India
>> Emails: daneel@utexas.edu, aroy@phys.buruniv.ac.in,
>> hariseldon99@gmail.com
>> Webpage: http://www.ph.utexas.edu/~daneel/
>> _______________________________________________
>> Nouveau mailing list
>> Nouveau@lists.freedesktop.org
>> https://lists.freedesktop.org/mailman/listinfo/nouveau
>>
>

--000000000000e7c38305ae54e189
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">On Tue, Sep 1, 2020, 23:28 Julien Isorce &lt;<a href=
=3D"mailto:julien.isorce@gmail.com">julien.isorce@gmail.com</a>&gt; wrote:<=
br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;borde=
r-left:1px #ccc solid;padding-left:1ex"><div dir=3D"ltr">Hi,<div><br></div>=
<div>Try:=C2=A0 DRI_PRIME=3D1 LIBVA_DRIVER_NAME=3Dnouveau vainfo=C2=A0<span=
 style=3D"color:rgb(36,41,46);font-family:-apple-system,BlinkMacSystemFont,=
&quot;Segoe UI&quot;,Helvetica,Arial,sans-serif,&quot;Apple Color Emoji&quo=
t;,&quot;Segoe UI Emoji&quot;;font-size:14px">--display drm --device /dev/d=
ri/renderD129</span></div><div><span style=3D"color:rgb(36,41,46);font-fami=
ly:-apple-system,BlinkMacSystemFont,&quot;Segoe UI&quot;,Helvetica,Arial,sa=
ns-serif,&quot;Apple Color Emoji&quot;,&quot;Segoe UI Emoji&quot;;font-size=
:14px"><br></span></div><div><span style=3D"color:rgb(36,41,46);font-family=
:-apple-system,BlinkMacSystemFont,&quot;Segoe UI&quot;,Helvetica,Arial,sans=
-serif,&quot;Apple Color Emoji&quot;,&quot;Segoe UI Emoji&quot;;font-size:1=
4px">Also try with and without the --device option, the important one is --=
display drm</span></div><div><span style=3D"color:rgb(36,41,46);font-family=
:-apple-system,BlinkMacSystemFont,&quot;Segoe UI&quot;,Helvetica,Arial,sans=
-serif,&quot;Apple Color Emoji&quot;,&quot;Segoe UI Emoji&quot;;font-size:1=
4px"></span></div></div></blockquote></div></div><div dir=3D"auto"><br></di=
v><div dir=3D"auto"><br></div><div dir=3D"auto"><br></div><div dir=3D"auto"=
><br></div><div dir=3D"auto">Nada, and nada. Exact same error as before, bo=
th cases.=C2=A0</div><div dir=3D"auto"><br></div><div dir=3D"auto">waah!=C2=
=A0</div><div dir=3D"auto"><br></div><div dir=3D"auto"><div class=3D"gmail_=
quote"><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-=
left:1px #ccc solid;padding-left:1ex"><div dir=3D"ltr"><div><span style=3D"=
color:rgb(36,41,46);font-family:-apple-system,BlinkMacSystemFont,&quot;Sego=
e UI&quot;,Helvetica,Arial,sans-serif,&quot;Apple Color Emoji&quot;,&quot;S=
egoe UI Emoji&quot;;font-size:14px"><br></span></div><div><span style=3D"co=
lor:rgb(36,41,46);font-family:-apple-system,BlinkMacSystemFont,&quot;Segoe =
UI&quot;,Helvetica,Arial,sans-serif,&quot;Apple Color Emoji&quot;,&quot;Seg=
oe UI Emoji&quot;;font-size:14px">Cheers</span></div><div><span style=3D"co=
lor:rgb(36,41,46);font-family:-apple-system,BlinkMacSystemFont,&quot;Segoe =
UI&quot;,Helvetica,Arial,sans-serif,&quot;Apple Color Emoji&quot;,&quot;Seg=
oe UI Emoji&quot;;font-size:14px">Julien</span></div></div><br><div class=
=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, Sep 1, 2020 =
at 10:49 AM Analabha Roy &lt;<a href=3D"mailto:hariseldon99@gmail.com" targ=
et=3D"_blank" rel=3D"noreferrer">hariseldon99@gmail.com</a>&gt; wrote:<br><=
/div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bo=
rder-left:1px solid rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr"><di=
v dir=3D"ltr"><br></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" cla=
ss=3D"gmail_attr">On Tue, 1 Sep 2020 at 18:59, Ilia Mirkin &lt;<a href=3D"m=
ailto:imirkin@alum.mit.edu" target=3D"_blank" rel=3D"noreferrer">imirkin@al=
um.mit.edu</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">On Tue, Sep 1, 2020 at 9:10 AM Analabha Roy &lt;<a href=3D"mailt=
o:hariseldon99@gmail.com" target=3D"_blank" rel=3D"noreferrer">hariseldon99=
@gmail.com</a>&gt; wrote:<br>
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
s/va/context.c#n111" rel=3D"noreferrer noreferrer" target=3D"_blank">https:=
//cgit.freedesktop.org/mesa/mesa/tree/src/gallium/frontends/va/context.c#n1=
11</a><br>
<br>
For the DRM/rendernodes &quot;platform&quot;, it will just take whatever fd=
 it<br>
is given. vainfo appears to give it a fixed device:<br>
<br>
<a href=3D"https://github.com/intel/libva-utils/blob/master/common/va_displ=
ay_drm.c#L39" rel=3D"noreferrer noreferrer" target=3D"_blank">https://githu=
b.com/intel/libva-utils/blob/master/common/va_display_drm.c#L39</a><br>
<br>
However it looks like you can pass in --device /dev/dri/renderD129 or<br>
whatever the right one is, which should pass in the right render node,<br>
as seen here:<br>
<br>
<a href=3D"https://github.com/intel/libva-utils/blob/master/common/va_displ=
ay.c#L80" rel=3D"noreferrer noreferrer" target=3D"_blank">https://github.co=
m/intel/libva-utils/blob/master/common/va_display.c#L80</a><br>
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
partment/physics" target=3D"_blank" rel=3D"noreferrer">Department of Physic=
s</a></div><div><a href=3D"http://www.buruniv.ac.in/" target=3D"_blank" rel=
=3D"noreferrer">The University of Burdwan</a></div><div>Golapbag Campus, Ba=
rddhaman 713104</div><div>West Bengal, India</div><div>Emails: <a href=3D"m=
ailto:daneel@utexas.edu" target=3D"_blank" rel=3D"noreferrer">daneel@utexas=
.edu</a>, <a href=3D"mailto:aroy@phys.buruniv.ac.in" target=3D"_blank" rel=
=3D"noreferrer">aroy@phys.buruniv.ac.in</a>, <a href=3D"mailto:hariseldon99=
@gmail.com" target=3D"_blank" rel=3D"noreferrer">hariseldon99@gmail.com</a>=
<br><div><font face=3D"tahoma, sans-serif">Webpage: <a href=3D"http://www.p=
h.utexas.edu/~daneel/" target=3D"_blank" rel=3D"noreferrer">http://www.ph.u=
texas.edu/~daneel/</a></font></div></div></div></div></div></div></div>
_______________________________________________<br>
Nouveau mailing list<br>
<a href=3D"mailto:Nouveau@lists.freedesktop.org" target=3D"_blank" rel=3D"n=
oreferrer">Nouveau@lists.freedesktop.org</a><br>
<a href=3D"https://lists.freedesktop.org/mailman/listinfo/nouveau" rel=3D"n=
oreferrer noreferrer" target=3D"_blank">https://lists.freedesktop.org/mailm=
an/listinfo/nouveau</a><br>
</blockquote></div>
</blockquote></div></div></div>

--000000000000e7c38305ae54e189--

--===============2079217350==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau

--===============2079217350==--
