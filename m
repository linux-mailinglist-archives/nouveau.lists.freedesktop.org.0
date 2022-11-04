Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AB05619DE1
	for <lists+nouveau@lfdr.de>; Fri,  4 Nov 2022 17:56:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 98A0610E92E;
	Fri,  4 Nov 2022 16:56:01 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-oa1-x36.google.com (mail-oa1-x36.google.com
 [IPv6:2001:4860:4864:20::36])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7633010E92E
 for <nouveau@lists.freedesktop.org>; Fri,  4 Nov 2022 16:55:57 +0000 (UTC)
Received: by mail-oa1-x36.google.com with SMTP id
 586e51a60fabf-13c2cfd1126so6140521fac.10
 for <nouveau@lists.freedesktop.org>; Fri, 04 Nov 2022 09:55:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:subject:message-id:date:from:in-reply-to:references:mime-version
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Sj7MY2ebMk0wItAfYZ/kgAdhCEGveJqy4TUWLYMByNA=;
 b=fwNMDFiij9EPJsnRNXKvK+ONosKsasTnVrk0nydXDbDK9/chsZEt9nWBt0BdHMsayp
 FVWoujeQ2UJaxLU0DT+VvVWZobaNvkUMv08/6gENxHDhxE32Xfg7HpQxDHHXQECLggDV
 c5NiID2VZHwOg6K61Blj26JeLZhP2sALuTcLWDaRIYdGAJI//6iiJL7vm4gHUIMtlYP8
 4RbKgRWhYnPBGjaToMoJNyG8ZPbD0KP9I/ZDlG1bbS/WVOdSqpfo/gqy0KA2rqFo7o14
 lvFepotb0NQm9+9L8bzqnCDVDS+V0wG4tRMNE/W0hDs2QfKqpwV6ljoVmHSlUc5TgvEU
 JjlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:subject:message-id:date:from:in-reply-to:references:mime-version
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Sj7MY2ebMk0wItAfYZ/kgAdhCEGveJqy4TUWLYMByNA=;
 b=qJxWIiC5QLrDlPO35CnOWeG2HqWXNrO1m9tweHeZ8pdyakynsTuqFiHw7rvZAaec03
 7Q0nnfJ2o9a1y1jODParXzxKXsEsEOi/VvsWFiiQTcVzvj3ysjGjs0wUNwOl+Tmu5E+Q
 8rd7mgdTUZpcr25yPfh2/vP324zT3Xw6RHLNW/t3NvE3kHJ7Jn8nyvFSpvP7mR0kJhXi
 zygWLxwsT8SECXifg/dh8ZFLlnvzNUbCskgBGxgZY3iWE2BD5KKwetStwMTWJz7jdOeK
 JAvWbV/k2hIUf5CMoGnediUly05N4yWuVzl3S6ACYnrDGEjvIyLDOrlBtwbrjZWu2rSq
 fnqA==
X-Gm-Message-State: ACrzQf2aNoXPUfxFgrbPU4T/DJnrk5tbNlVIwK3wqS0ibBUgcdzDC7Wp
 FlgBWq2o6c6J3CtaKuqqKz9bJTg9b+UrjkwPtXPddfrjUe+rzg==
X-Google-Smtp-Source: AMsMyM6eYYIHqJqZFC9hENfJoPIqDygcWtrzy1AroswGAuZtmxHrWwn/9FJuvKGqadBlV2+QrrLL7/IFBsGXclStzrc=
X-Received: by 2002:a05:6870:5596:b0:13c:831a:f150 with SMTP id
 n22-20020a056870559600b0013c831af150mr21991882oao.234.1667580956214; Fri, 04
 Nov 2022 09:55:56 -0700 (PDT)
MIME-Version: 1.0
References: <CAEFVmOL+163rX7hEpgKn20RrzMXekw6JcM30rY4AmoHhDV_5Qw@mail.gmail.com>
 <CAKb7Uvi79P6skuKgF6Q884TtiC1k0bwrBw7r41TfY1-BBLjTxQ@mail.gmail.com>
 <CAEFVmO+pbgKQua5oAV6wP19AwyQVgvXT1sV=6pb=ejnq2F9Oog@mail.gmail.com>
In-Reply-To: <CAEFVmO+pbgKQua5oAV6wP19AwyQVgvXT1sV=6pb=ejnq2F9Oog@mail.gmail.com>
From: Lukas Satin <luke.satin@gmail.com>
Date: Fri, 4 Nov 2022 17:55:45 +0100
Message-ID: <CAEFVmOKdfPZBuU2V=iGh4k9QtrSxC0y2NTnSChHaZVkb=DMLDQ@mail.gmail.com>
Cc: nouveau@lists.freedesktop.org
Content-Type: multipart/alternative; boundary="00000000000087880205eca7f2f6"
Subject: Re: [Nouveau] TV Out question
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

--00000000000087880205eca7f2f6
Content-Type: text/plain; charset="UTF-8"

Hello, sorry fo the typos. Wanted to catch you before the weekend, to get
some hints for upcoming work.

I'm back at PC.

Does your driver support switching to 240p in NTSC and 288p in PAL on the
go via xrandr, for example?

If not, can I find some relevant part of code in your repository where to
implement that?

Some info I found regarding 240p and that it is a part of NTSC:
https://en.wikipedia.org/wiki/Low-definition_television

TV with S-Video mostly supports 480i and 240p as well. So the current issue
is outputting that via TV out.

My current configuration looks like this:
TV-1 connected 240x224+0+0 (normal left inverted right x axis y axis) 0mm x
0mm
   720x480       59.94 +
   1024x768      59.94
   800x600       59.94
   720x576       59.94
   640x480       59.94
   400x300       59.94
   320x240       59.93
   320x200       59.94
   768x576       50.00
   360x200       60.00
   360x240       60.00
   640x240       60.00
   SR-1_240x224@60.10  60.10*

I see I have created 240x224 (I need to fix that), but even 320x240 does
not work. It always stays at 480i.

I read somewhere that older GPU with TV out can do it. Only newer cards in
Windows cannot do it.

Thank you a lot,
Lukas



On Fri, Nov 4, 2022 at 5:43 PM Lukas Satin <luke.satin@gmail.com> wrote:

> Yes I just figured it out an hour ago. It works same as hd480i.
>
> Win7 can switch pal and ntsc just by changing desktop tesolution. Wht
> about here?
>
> TV with svideo or component rca supporr 480i and 240p by the spec.
>
> I hve added modelines for that. It works via dvi to vga to bnc to rca wity
> 15khz kernel.
>
> How to modify ut driver to outtput 240p via tv out?
>
> Imvon phone sorry fot ttyoos
>
> On Fri 4. 11. 2022 at 17:35, Ilia Mirkin <imirkin@alum.mit.edu> wrote:
>
>> https://nouveau.freedesktop.org/KernelModuleParameters.html
>>
>> Perhaps nouveau.tv_norm=NTSC-M will help get you the 60hz modes? I
>> haven't played with these options much at all, it has always sorta
>> Just Worked for me.
>>
>> This should have the validation of new modes, make sure you don't run
>> afoul of this:
>>
>>
>> https://cgit.freedesktop.org/drm/drm/tree/drivers/gpu/drm/nouveau/dispnv04/tvnv17.c#n303
>>
>> Cheers,
>>
>>   -ilia
>>
>> On Thu, Nov 3, 2022 at 10:56 PM Lukas Satin <luke.satin@gmail.com> wrote:
>> >
>> > Hi, I am currently testing Batocera Linux for retrogaming with 15KHz
>> output on CRT / TV.
>> >
>> > The machine I discovered is a certified Windows Media Center / Intel
>> ViiV machine: Acer iDEA 510
>> >
>> > It features:
>> > RCA component output
>> > S-Video CVBS output
>> > S-Video DIN output
>> > Scart IN / Scart OUT (two DVB-T tuners for realtime playback and
>> recording)
>> > DVI-I out
>> > HDMI out
>> >
>> > Laptop style components, MXM module Geforce 7 Go 7600 (NVIDIA Curie).
>> >
>> > Now, BIOS default output via RCA component is 640x480 NTSC (480i,
>> 60Hz). In Windows I can switch between NTSC and PAL (480i or 576i).
>> >
>> > As this is EU machine, after BIOS it often defaults to 576i PAL, unless
>> set otherwise.
>> >
>> > Now your nouveau driver therefore defaults to 576i.
>> >
>> > Xrandr looks like this:
>> > TV-1 connected 640x480+0+0 (normal left inverted right x axis y axis)
>> 0mm x 0mm
>> >    720x576       50.00 +
>> >    1024x768      50.00
>> >    800x600       50.00
>> >    720x480       50.00
>> >    640x480       50.00*
>> >    400x300       50.00
>> >    320x240       50.00
>> >    320x200       50.00
>> >    768x576       50.00
>> >    360x200       60.00
>> >    360x240       60.00
>> >    640x240       60.00
>> >
>> > I tried to add some additional modelines. But look at 640x480. It
>> forces 50Hz and I am unable to remove it, create new or change it to 60Hz.
>> Therefore the TV is always set to 576i and screen output is 640x480,
>> therefore it looks like GPU scaled. First I read your troubleshooting which
>> mentions scaling, so I tried to disable scaling. Did not help.
>> >
>> > Now I read about this:
>> >
>> https://nvidia.custhelp.com/app/answers/detail/a_id/177/~/linux---configuring-tv-out
>> >
>> > And this might be the solution and issue. It would correspond with what
>> can be observed in Windows 7.
>> >
>> > Does your driver have some options for configuring TV Out and name
>> switching from PAL to NTSC or HD480i mode? It should be automatic based on
>> 480i or 576i or 240p or 288p, but it is not.
>> >
>> > Thanks,
>> > Lukas
>>
>

--00000000000087880205eca7f2f6
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hello, sorry fo the typos. Wanted to catch you before the =
weekend, to get some hints for upcoming work.<div><br></div><div>I&#39;m ba=
ck at PC.</div><div><br></div><div>Does your driver support switching to 24=
0p in NTSC and 288p in PAL on the go via xrandr, for example?</div><div><br=
></div><div>If not, can I find some relevant=C2=A0part of code in your repo=
sitory where to implement that?</div><div><br></div><div>Some info I found =
regarding 240p and that it is a part of NTSC:=C2=A0<a href=3D"https://en.wi=
kipedia.org/wiki/Low-definition_television">https://en.wikipedia.org/wiki/L=
ow-definition_television</a></div><div><br></div><div>TV with S-Video mostl=
y supports 480i and 240p as well. So the current issue is outputting=C2=A0t=
hat via TV out.</div><div><br></div><div>My current configuration looks lik=
e this:</div><div>TV-1 connected 240x224+0+0 (normal left inverted right x =
axis y axis) 0mm x 0mm<br>=C2=A0 =C2=A0720x480 =C2=A0 =C2=A0 =C2=A0 59.94 +=
<br>=C2=A0 =C2=A01024x768 =C2=A0 =C2=A0 =C2=A059.94<br>=C2=A0 =C2=A0800x600=
 =C2=A0 =C2=A0 =C2=A0 59.94<br>=C2=A0 =C2=A0720x576 =C2=A0 =C2=A0 =C2=A0 59=
.94<br>=C2=A0 =C2=A0640x480 =C2=A0 =C2=A0 =C2=A0 59.94<br>=C2=A0 =C2=A0400x=
300 =C2=A0 =C2=A0 =C2=A0 59.94<br>=C2=A0 =C2=A0320x240 =C2=A0 =C2=A0 =C2=A0=
 59.93<br>=C2=A0 =C2=A0320x200 =C2=A0 =C2=A0 =C2=A0 59.94<br>=C2=A0 =C2=A07=
68x576 =C2=A0 =C2=A0 =C2=A0 50.00<br>=C2=A0 =C2=A0360x200 =C2=A0 =C2=A0 =C2=
=A0 60.00<br>=C2=A0 =C2=A0360x240 =C2=A0 =C2=A0 =C2=A0 60.00<br>=C2=A0 =C2=
=A0640x240 =C2=A0 =C2=A0 =C2=A0 60.00<br>=C2=A0 =C2=A0SR-1_240x224@60.10 =
=C2=A060.10*<br></div><div><br></div><div>I see I have created 240x224 (I n=
eed to fix that), but even 320x240 does not work. It always stays at 480i.<=
/div><div><br></div><div>I read somewhere that older GPU with TV out can do=
 it. Only newer cards in Windows cannot do it.</div><div><br></div><div>Tha=
nk you a lot,</div><div>Lukas</div><div><br></div><div><br></div></div><br>=
<div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Fri, No=
v 4, 2022 at 5:43 PM Lukas Satin &lt;<a href=3D"mailto:luke.satin@gmail.com=
">luke.satin@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_q=
uote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,2=
04);padding-left:1ex"><div dir=3D"auto">Yes I just figured it out an hour a=
go. It works same as hd480i.</div><div dir=3D"auto"><br></div><div dir=3D"a=
uto">Win7 can switch pal and ntsc just by changing desktop tesolution. Wht =
about here?</div><div dir=3D"auto"><br></div><div dir=3D"auto">TV with svid=
eo or component rca supporr 480i and 240p by the spec.</div><div dir=3D"aut=
o"><br></div><div dir=3D"auto">I hve added modelines for that. It works via=
 dvi to vga to bnc to rca wity 15khz kernel.</div><div dir=3D"auto"><br></d=
iv><div dir=3D"auto">How to modify ut driver to outtput 240p via tv out?</d=
iv><div dir=3D"auto"><br></div><div dir=3D"auto">Imvon phone sorry fot ttyo=
os</div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail=
_attr">On Fri 4. 11. 2022 at 17:35, Ilia Mirkin &lt;<a href=3D"mailto:imirk=
in@alum.mit.edu" target=3D"_blank">imirkin@alum.mit.edu</a>&gt; wrote:<br><=
/div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bo=
rder-left:1px solid rgb(204,204,204);padding-left:1ex"><a href=3D"https://n=
ouveau.freedesktop.org/KernelModuleParameters.html" rel=3D"noreferrer" targ=
et=3D"_blank">https://nouveau.freedesktop.org/KernelModuleParameters.html</=
a><br>
<br>
Perhaps nouveau.tv_norm=3DNTSC-M will help get you the 60hz modes? I<br>
haven&#39;t played with these options much at all, it has always sorta<br>
Just Worked for me.<br>
<br>
This should have the validation of new modes, make sure you don&#39;t run<b=
r>
afoul of this:<br>
<br>
<a href=3D"https://cgit.freedesktop.org/drm/drm/tree/drivers/gpu/drm/nouvea=
u/dispnv04/tvnv17.c#n303" rel=3D"noreferrer" target=3D"_blank">https://cgit=
.freedesktop.org/drm/drm/tree/drivers/gpu/drm/nouveau/dispnv04/tvnv17.c#n30=
3</a><br>
<br>
Cheers,<br>
<br>
=C2=A0 -ilia<br>
<br>
On Thu, Nov 3, 2022 at 10:56 PM Lukas Satin &lt;<a href=3D"mailto:luke.sati=
n@gmail.com" target=3D"_blank">luke.satin@gmail.com</a>&gt; wrote:<br>
&gt;<br>
&gt; Hi, I am currently testing Batocera Linux for retrogaming with 15KHz o=
utput on CRT / TV.<br>
&gt;<br>
&gt; The machine I discovered is a certified Windows Media Center / Intel V=
iiV machine: Acer iDEA 510<br>
&gt;<br>
&gt; It features:<br>
&gt; RCA component output<br>
&gt; S-Video CVBS output<br>
&gt; S-Video DIN output<br>
&gt; Scart IN / Scart OUT (two DVB-T tuners for realtime playback and recor=
ding)<br>
&gt; DVI-I out<br>
&gt; HDMI out<br>
&gt;<br>
&gt; Laptop style components, MXM module Geforce 7 Go 7600 (NVIDIA Curie).<=
br>
&gt;<br>
&gt; Now, BIOS default output via RCA component is 640x480 NTSC (480i, 60Hz=
). In Windows I can switch between NTSC and PAL (480i or 576i).<br>
&gt;<br>
&gt; As this is EU machine, after BIOS it often defaults to 576i PAL, unles=
s set otherwise.<br>
&gt;<br>
&gt; Now your nouveau driver therefore defaults to 576i.<br>
&gt;<br>
&gt; Xrandr looks like this:<br>
&gt; TV-1 connected 640x480+0+0 (normal left inverted right x axis y axis) =
0mm x 0mm<br>
&gt;=C2=A0 =C2=A0 720x576=C2=A0 =C2=A0 =C2=A0 =C2=A050.00 +<br>
&gt;=C2=A0 =C2=A0 1024x768=C2=A0 =C2=A0 =C2=A0 50.00<br>
&gt;=C2=A0 =C2=A0 800x600=C2=A0 =C2=A0 =C2=A0 =C2=A050.00<br>
&gt;=C2=A0 =C2=A0 720x480=C2=A0 =C2=A0 =C2=A0 =C2=A050.00<br>
&gt;=C2=A0 =C2=A0 640x480=C2=A0 =C2=A0 =C2=A0 =C2=A050.00*<br>
&gt;=C2=A0 =C2=A0 400x300=C2=A0 =C2=A0 =C2=A0 =C2=A050.00<br>
&gt;=C2=A0 =C2=A0 320x240=C2=A0 =C2=A0 =C2=A0 =C2=A050.00<br>
&gt;=C2=A0 =C2=A0 320x200=C2=A0 =C2=A0 =C2=A0 =C2=A050.00<br>
&gt;=C2=A0 =C2=A0 768x576=C2=A0 =C2=A0 =C2=A0 =C2=A050.00<br>
&gt;=C2=A0 =C2=A0 360x200=C2=A0 =C2=A0 =C2=A0 =C2=A060.00<br>
&gt;=C2=A0 =C2=A0 360x240=C2=A0 =C2=A0 =C2=A0 =C2=A060.00<br>
&gt;=C2=A0 =C2=A0 640x240=C2=A0 =C2=A0 =C2=A0 =C2=A060.00<br>
&gt;<br>
&gt; I tried to add some additional modelines. But look at 640x480. It forc=
es 50Hz and I am unable to remove it, create new or change it to 60Hz. Ther=
efore the TV is always set to 576i and screen output is 640x480, therefore =
it looks like GPU scaled. First I read your troubleshooting which mentions =
scaling, so I tried to disable scaling. Did not help.<br>
&gt;<br>
&gt; Now I read about this:<br>
&gt; <a href=3D"https://nvidia.custhelp.com/app/answers/detail/a_id/177/~/l=
inux---configuring-tv-out" rel=3D"noreferrer" target=3D"_blank">https://nvi=
dia.custhelp.com/app/answers/detail/a_id/177/~/linux---configuring-tv-out</=
a><br>
&gt;<br>
&gt; And this might be the solution and issue. It would correspond with wha=
t can be observed in Windows 7.<br>
&gt;<br>
&gt; Does your driver have some options for configuring TV Out and name swi=
tching from PAL to NTSC or HD480i mode? It should be automatic based on 480=
i or 576i or 240p or 288p, but it is not.<br>
&gt;<br>
&gt; Thanks,<br>
&gt; Lukas<br>
</blockquote></div></div>
</blockquote></div>

--00000000000087880205eca7f2f6--
