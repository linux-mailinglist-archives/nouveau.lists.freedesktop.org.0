Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 45B87258EE4
	for <lists+nouveau@lfdr.de>; Tue,  1 Sep 2020 15:10:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 890876E863;
	Tue,  1 Sep 2020 13:10:06 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-ot1-x341.google.com (mail-ot1-x341.google.com
 [IPv6:2607:f8b0:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AAACA6E41F
 for <nouveau@lists.freedesktop.org>; Tue,  1 Sep 2020 13:10:04 +0000 (UTC)
Received: by mail-ot1-x341.google.com with SMTP id i4so1095714ota.2
 for <nouveau@lists.freedesktop.org>; Tue, 01 Sep 2020 06:10:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:cc;
 bh=gwMR60KT6cUJOV6oUflrUkQamkxwJjMP/wBgr/5ofTA=;
 b=QwvrwJXN7A01Ns/frTEGBEda4sQUWbbLfLPO8p692mv0I8GwHMbyqf9LP859M0bFOt
 kXVcEftXZeTcV9nsCQ94iOoL8I9/6yCKhIL5LiiO1gs46uhh+0Tmvlw2rdkOICguhyqG
 9SO21ml9dkfo6VclGsQRMUIK7pvfwtKE46LIidgY9MBff7BxHx2mSN3toEjR0OmExEuC
 I1ungFbSCZ5uYofB5yDSkY98HVmPfCL6POM0IPgbT9YOpJ+s7hIrzhCY3la/9XZweGWD
 WEwcqVSpFfSSwpy+msiS99dStV7//JGhAeP8IQhUQKVKQhrcFei7YddWayEPh0pkF2eS
 wVHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:cc;
 bh=gwMR60KT6cUJOV6oUflrUkQamkxwJjMP/wBgr/5ofTA=;
 b=KiYxtZD4HW57uNPvxr2Ju2DEgZS6GVwVbF4tqZK01lVVfADP7+kuYaI0wYzKZfH1vT
 NLDP3+uCWa8KREOw9ixpopmljXsmz2tYNJTdwTY9xG/KDP9o7u6xCeVPuBdT9NZ+CbD2
 TmHXwDtqchDkmhvpe0P3e0luTkzdb1gDnagbU7Kt5jxlNWqYtkS1J25g1Ngvtykxun+B
 no6KEzsiqPZWmilkd4rbpZWiUPg2Vq/mRnzebgb2IjiGLO4tP/64zp+7Zw1fEJpRCNET
 d261el0ShMZgFeNPXZUuWFFF11AefiODjk7CwLGYkc0bvdnVebPNM5g5iq/stoSNMTPH
 P8lg==
X-Gm-Message-State: AOAM531uG3oaJyrGZDOM6+FLUxlnMDem+HYFM7DG/FpgD1lSjc6BWxqy
 1ZQKx4Rx5jk3zy6DQjQ30BAw9OA7iBJWcokcKIcFNx4MWc2msg==
X-Google-Smtp-Source: ABdhPJy1W0K8NIXFaaAh3brax1yZzeAJHCEWjRf8zCi/N+zW0/7tjnPEnoIHOX9NYiKUAMMaDfajU+Ch0OfqjIkUhOs=
X-Received: by 2002:a9d:12f2:: with SMTP id g105mr1231266otg.41.1598965803427; 
 Tue, 01 Sep 2020 06:10:03 -0700 (PDT)
MIME-Version: 1.0
References: <CAKiGokHoArQcnVAPs0HWzJSFXhwCSLfQAirOQ-zTq=0C-97neQ@mail.gmail.com>
 <CAKb7Uvh4cdg0=dGJqQVXx_p4O2c5BJbG3JRnjznwjsMQwc505Q@mail.gmail.com>
In-Reply-To: <CAKb7Uvh4cdg0=dGJqQVXx_p4O2c5BJbG3JRnjznwjsMQwc505Q@mail.gmail.com>
From: Analabha Roy <hariseldon99@gmail.com>
Date: Tue, 1 Sep 2020 18:39:52 +0530
Message-ID: <CAKiGokGj8pfm1tmH0aN7de5FVvrszAA93_e9-Zq05oqw46GnRg@mail.gmail.com>
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
Content-Type: multipart/mixed; boundary="===============0901545661=="
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

--===============0901545661==
Content-Type: multipart/alternative; boundary="000000000000b8ad2005ae403c04"

--000000000000b8ad2005ae403c04
Content-Type: text/plain; charset="UTF-8"

>
> It does indicate a config problem, but why do you want to use the
> nvidia GPU for video accel? I'd rely on intel to provide acceleration
> as this also reduces power consumption of the entire system. Also I
> think vaapi on the secondary GPU is pretty much untested.



Well you've got a point there. It's just that the dang nvidia is pretty
much sitting there on its hiney doing nothing (the mediaserver is running
headless), while the CPU block is doing all the heavy lifting (I'm running
torznab grabbers, DLNA streaming etc off an old laptop whose screen's
busted).

I tried nvenc/nvdec, but the 650M doesn't seem to support it according to my
reading of the support page
<https://developer.nvidia.com/video-encode-decode-gpu-support-matrix>
Doesn't support CUDA either, it seems. so I switched the hardware
transcoding to vaapi on the intel gpu.

I figure if the nvidia took some load off then the heat would be more
evenly distributed across the motherboard, increasing the server's shelf
life, plus the nvidia actually gets to do something.

On Tue, 1 Sep 2020 at 18:01, Ilia Mirkin <imirkin@alum.mit.edu> wrote:

> On Tue, Sep 1, 2020 at 3:31 AM Analabha Roy <hariseldon99@gmail.com>
> wrote:
> >
> > Hi,
> >
> > If I am reading the featurematrix right, VAAPI is supported for nouveau
> on the GeForce650M (my card).
> >
> > Here is the output of inxi -F
> >
> > System:    Host: MediaServer Kernel: 5.4.0-42-generic x86_64 bits: 64
> Console: tty 1 Distro: Ubuntu 18.04.5 LTS
> > Machine:   Device: laptop System: SAMSUNG product: 300E4C/300E5C/300E7C
> v: 0.1 serial: N/A
> >            Mobo: SAMSUNG model: NP300E5X-U01IN v: FAB1 serial: N/A
> >            UEFI [Legacy]: Phoenix v: P06RAC date: 10/25/2012
> > Battery    BAT1: charge: 47.5 Wh 100.0% condition: 47.5/47.5 Wh (100%)
> > CPU:       Dual core Intel Core i3-2310M (-MT-MCP-) cache: 3072 KB
> >            clock speeds: max: 2100 MHz 1: 835 MHz 2: 1031 MHz 3: 905 MHz
> 4: 927 MHz
> > Graphics:  Card-1: Intel 2nd Generation Core Processor Family Integrated
> Graphics Controller
> >            Card-2: NVIDIA GF108M [GeForce GT 620M]
> >            Display Server: X.org 1.20.8 driver: i915 tty size: 171x45
> Advanced Data: N/A out of X
> >
> >
> > I have installed nouveau, and extracted the firmware from the prop
> nvidia drivers separately as per instructions on
> https://nouveau.freedesktop.org/wiki/VideoAcceleration/
> > See installed firmware @ https://pastebin.com/Gaqxb88g
> >
> > But running vainfo yields error: https://pastebin.com/NyULBhXt
> >
> > Does the error mean that VAAPI is unsupported, or does it indicate a
> config problem?
>
> As Karol suggests, using the onboard CPU's decoding capabilities will
> yield better results. However if there's some specific reason you
> want/need to use the NVIDIA card, it should still work. I note that
> you don't have an X server running - is that on purpose?


Yes. This is a headless media server hosting jellyfin. Hence the tinkering
around with hardware transcoding.
This was an old laptop whose screen got busted, so am repurposing as a
media server/streamer.


> I believe
> that va-api needs some sort of winsys to be available, but I guess I'm
> not entirely sure.
>
>
vainfo works off the intel driver even though there is no X running:
https://pastebin.com/pnaAMCFd

vaapi is happily transcoding off the intel on the headless machine if I'm
reading the ffmpeg logs correctly


> Do you see any errors in dmesg after running vainfo?
>
>
nope.


> Cheers,
>
>   -ilia
>


Any suggestions on how to trace the config issues? Do I have to debug
the va_openDriver() function?

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

--000000000000b8ad2005ae403c04
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px =
0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><span st=
yle=3D"color:rgb(0,0,0)">It does indicate a config problem, but why do you =
want to use the<br></span><span style=3D"color:rgb(0,0,0)">nvidia GPU for v=
ideo accel? I&#39;d rely on intel to provide acceleration<br></span><span s=
tyle=3D"color:rgb(0,0,0)">as this also reduces power consumption of the ent=
ire system. Also I<br></span><span style=3D"color:rgb(0,0,0)">think vaapi o=
n the secondary GPU is pretty much untested.</span></blockquote><div><br></=
div><div><br></div><div>Well you&#39;ve got a point there. It&#39;s just th=
at the dang nvidia is pretty much sitting there on its hiney doing nothing =
(the mediaserver is running headless), while the CPU block is doing all the=
 heavy lifting (I&#39;m running torznab grabbers, DLNA streaming etc off an=
 old laptop whose screen&#39;s busted).</div><div><br></div><div>I tried nv=
enc/nvdec, but the 650M doesn&#39;t seem to support it according to <a href=
=3D"https://developer.nvidia.com/video-encode-decode-gpu-support-matrix">my=
 reading of the support page</a></div><div>Doesn&#39;t support CUDA either,=
 it seems. so I switched the hardware transcoding to vaapi on the intel gpu=
.</div><div><br></div><div>I figure if the nvidia took some load off then t=
he heat would be more evenly distributed across the motherboard, increasing=
 the server&#39;s shelf life, plus the nvidia actually gets to do something=
.</div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr"=
>On Tue, 1 Sep 2020 at 18:01, Ilia Mirkin &lt;<a href=3D"mailto:imirkin@alu=
m.mit.edu">imirkin@alum.mit.edu</a>&gt; wrote:<br></div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex">On Tue, Sep 1, 2020 at 3:31 AM Analabha Ro=
y &lt;<a href=3D"mailto:hariseldon99@gmail.com" target=3D"_blank">hariseldo=
n99@gmail.com</a>&gt; wrote:<br>
&gt;<br>
&gt; Hi,<br>
&gt;<br>
&gt; If I am reading the featurematrix right, VAAPI is supported for nouvea=
u on the GeForce650M (my card).<br>
&gt;<br>
&gt; Here is the output of inxi -F<br>
&gt;<br>
&gt; System:=C2=A0 =C2=A0 Host: MediaServer Kernel: 5.4.0-42-generic x86_64=
 bits: 64 Console: tty 1 Distro: Ubuntu 18.04.5 LTS<br>
&gt; Machine:=C2=A0 =C2=A0Device: laptop System: SAMSUNG product: 300E4C/30=
0E5C/300E7C v: 0.1 serial: N/A<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Mobo: SAMSUNG model: NP300E5X=
-U01IN v: FAB1 serial: N/A<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 UEFI [Legacy]: Phoenix v: P06=
RAC date: 10/25/2012<br>
&gt; Battery=C2=A0 =C2=A0 BAT1: charge: 47.5 Wh 100.0% condition: 47.5/47.5=
 Wh (100%)<br>
&gt; CPU:=C2=A0 =C2=A0 =C2=A0 =C2=A0Dual core Intel Core i3-2310M (-MT-MCP-=
) cache: 3072 KB<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 clock speeds: max: 2100 MHz 1=
: 835 MHz 2: 1031 MHz 3: 905 MHz 4: 927 MHz<br>
&gt; Graphics:=C2=A0 Card-1: Intel 2nd Generation Core Processor Family Int=
egrated Graphics Controller<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Card-2: NVIDIA GF108M [GeForc=
e GT 620M]<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Display Server: X.org 1.20.8 =
driver: i915 tty size: 171x45 Advanced Data: N/A out of X<br>
&gt;<br>
&gt;<br>
&gt; I have installed nouveau, and extracted the firmware from the prop nvi=
dia drivers separately as per instructions on <a href=3D"https://nouveau.fr=
eedesktop.org/wiki/VideoAcceleration/" rel=3D"noreferrer" target=3D"_blank"=
>https://nouveau.freedesktop.org/wiki/VideoAcceleration/</a><br>
&gt; See installed firmware @ <a href=3D"https://pastebin.com/Gaqxb88g" rel=
=3D"noreferrer" target=3D"_blank">https://pastebin.com/Gaqxb88g</a><br>
&gt;<br>
&gt; But running vainfo yields error: <a href=3D"https://pastebin.com/NyULB=
hXt" rel=3D"noreferrer" target=3D"_blank">https://pastebin.com/NyULBhXt</a>=
<br>
&gt;<br>
&gt; Does the error mean that VAAPI is unsupported, or does it indicate a c=
onfig problem?<br>
<br>
As Karol suggests, using the onboard CPU&#39;s decoding capabilities will<b=
r>
yield better results. However if there&#39;s some specific reason you<br>
want/need to use the NVIDIA card, it should still work. I note that<br>
you don&#39;t have an X server running - is that on purpose? </blockquote><=
div><br></div><div>Yes. This is a headless media server hosting jellyfin. H=
ence the tinkering around with hardware transcoding.=C2=A0</div><div>This w=
as an old laptop whose screen got busted, so am repurposing as a media serv=
er/streamer.</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">I believe<br>
that va-api needs some sort of winsys to be available, but I guess I&#39;m<=
br>
not entirely sure.<br>
<br></blockquote><div><br></div><div>vainfo works off the intel driver even=
 though there is no X running:</div><div><a href=3D"https://pastebin.com/pn=
aAMCFd">https://pastebin.com/pnaAMCFd</a><br></div><div><br></div><div>vaap=
i is happily transcoding off the intel on the headless machine if I&#39;m r=
eading the ffmpeg logs correctly</div><div>=C2=A0</div><blockquote class=3D=
"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(2=
04,204,204);padding-left:1ex">
Do you see any errors in dmesg after running vainfo?<br>
<br></blockquote><div><br></div><div>nope.</div><div>=C2=A0</div><blockquot=
e class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px s=
olid rgb(204,204,204);padding-left:1ex">
Cheers,<br>
<br>
=C2=A0 -ilia<br>
</blockquote></div><div><br></div><div><br></div>Any suggestions on how to =
trace the config issues? Do I have to debug the=C2=A0va_openDriver() functi=
on?<br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr" class=3D"gmail_=
signature"><div dir=3D"ltr"><div><div dir=3D"ltr"><div>Analabha Roy<br></di=
v><div>Assistant Professor</div><div><a href=3D"http://www.buruniv.ac.in/ac=
ademics/department/physics" target=3D"_blank">Department of Physics</a></di=
v><div><a href=3D"http://www.buruniv.ac.in/" target=3D"_blank">The Universi=
ty of Burdwan</a></div><div>Golapbag Campus, Barddhaman 713104</div><div>We=
st Bengal, India</div><div>Emails: <a href=3D"mailto:daneel@utexas.edu" tar=
get=3D"_blank">daneel@utexas.edu</a>, <a href=3D"mailto:aroy@phys.buruniv.a=
c.in" target=3D"_blank">aroy@phys.buruniv.ac.in</a>, <a href=3D"mailto:hari=
seldon99@gmail.com" target=3D"_blank">hariseldon99@gmail.com</a><br><div><f=
ont face=3D"tahoma, sans-serif">Webpage: <a href=3D"http://www.ph.utexas.ed=
u/~daneel/" target=3D"_blank">http://www.ph.utexas.edu/~daneel/</a></font><=
/div></div></div></div></div></div></div>

--000000000000b8ad2005ae403c04--

--===============0901545661==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0901545661==--
