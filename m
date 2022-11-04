Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 560E3619E12
	for <lists+nouveau@lfdr.de>; Fri,  4 Nov 2022 18:05:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4794A10E940;
	Fri,  4 Nov 2022 17:05:28 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-oi1-x22c.google.com (mail-oi1-x22c.google.com
 [IPv6:2607:f8b0:4864:20::22c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 01F0910E944
 for <nouveau@lists.freedesktop.org>; Fri,  4 Nov 2022 17:05:23 +0000 (UTC)
Received: by mail-oi1-x22c.google.com with SMTP id p127so5780393oih.9
 for <nouveau@lists.freedesktop.org>; Fri, 04 Nov 2022 10:05:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:subject:message-id:date:from:in-reply-to:references:mime-version
 :from:to:cc:subject:date:message-id:reply-to;
 bh=ee28rdbLR1/ZC1ETN1+ftSagwgfcYN8Hk8jldmzQJfA=;
 b=MI/jijNjTptgt+HoSJIgGx9FNfW8v6i0W2JMhMlfqKWaGuQVGJRc8K12RIz4BBhlpz
 QzVlHdIE6lqtYxCgCQRu1qvAm5EXdDWwcH0LGtuUShoIWdJa5fnCZF2+7I2wgUUIOamo
 s42eTw1eq2o4KnWoDqAshiKsE6mvN1q5VsSlccGycIUbGqJjJsQQBE2OdItkezhFb4GT
 nImsQrPjrT7z0HKblPFpeGmMVN9I1zmFDqLkEe3Pq4F/uV4lisTcMWlWtusF0ByFTaqC
 J/jSg9v7AibMkfxwTEfYQ4IP/qOxA7BvJBKIqHT6QdHvIj1+EcZne/mLZTQgpjhRLHNk
 VDNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:subject:message-id:date:from:in-reply-to:references:mime-version
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ee28rdbLR1/ZC1ETN1+ftSagwgfcYN8Hk8jldmzQJfA=;
 b=Nq/kRgYJbHxtRoNxFmT8W0KwGSZ1ZD88PJaXqdkK0O1nY3vTdrqnKVeh4dy+wvuRtF
 Ef4zLzV8BbJHWNdpHhLohE6knaPXcn30yZmZYBCuEx7Ld/qqu1GoWEraFnM4/2vs0NsX
 OsTAw4ek4ScvpJ4s9TXJAEsRpP/PDZiNeXcYYh40NKHOYR1L3+1Xfvi+zhJZSnrE/f8/
 FJ1yTBmNHK/f5MxWurO+7tgRCyfXjadfQpozIcYO/aoeyQR/SHU9+DuxfPZIbBMxQM5D
 6jt1WJVdeabLlxo6JNv2YpV2MeJiHc92s3shjzHUqIbBfIqju3Fr2w8hT+COVQDS31Qf
 U7OQ==
X-Gm-Message-State: ACrzQf37m+sPfVMpR74Febj+xMs0rhs4QarO4mJ4ho+QxIkhTD9Cvjqs
 6GOBy4eX42sKfPZjc5L6z9LCDI/RCjqeFJDNbxiuTCfKYm248g==
X-Google-Smtp-Source: AMsMyM4sdfxGmkr/E+aCZL4x4EoRA+rU7yJRZqmDTk2m6PHVeEYDElfptnP2XdKD+hfCPybtGwG4b2V2nC9M2nprWcQ=
X-Received: by 2002:a54:4587:0:b0:359:c737:b2e8 with SMTP id
 z7-20020a544587000000b00359c737b2e8mr19720869oib.234.1667581523008; Fri, 04
 Nov 2022 10:05:23 -0700 (PDT)
MIME-Version: 1.0
References: <CAEFVmOL+163rX7hEpgKn20RrzMXekw6JcM30rY4AmoHhDV_5Qw@mail.gmail.com>
 <CAKb7Uvi79P6skuKgF6Q884TtiC1k0bwrBw7r41TfY1-BBLjTxQ@mail.gmail.com>
 <CAEFVmO+pbgKQua5oAV6wP19AwyQVgvXT1sV=6pb=ejnq2F9Oog@mail.gmail.com>
 <CAEFVmOKdfPZBuU2V=iGh4k9QtrSxC0y2NTnSChHaZVkb=DMLDQ@mail.gmail.com>
In-Reply-To: <CAEFVmOKdfPZBuU2V=iGh4k9QtrSxC0y2NTnSChHaZVkb=DMLDQ@mail.gmail.com>
From: Lukas Satin <luke.satin@gmail.com>
Date: Fri, 4 Nov 2022 18:05:11 +0100
Message-ID: <CAEFVmOLq09WaxvvySvOVirVNt6zLLd-ykPtD4UZ_DQ-ab=1i9Q@mail.gmail.com>
Cc: nouveau@lists.freedesktop.org
Content-Type: multipart/alternative; boundary="00000000000050201805eca8146f"
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

--00000000000050201805eca8146f
Content-Type: text/plain; charset="UTF-8"

240p compatibility list of TVs:
https://static1.squarespace.com/static/51f517f0e4b01da70d01ca2a/t/5a2f36e953450aa1429361d9/1513043690556/240p-TVs_20171211.pdf

Source: https://www.hdretrovision.com/240p

On Fri, Nov 4, 2022 at 5:55 PM Lukas Satin <luke.satin@gmail.com> wrote:

> Hello, sorry fo the typos. Wanted to catch you before the weekend, to get
> some hints for upcoming work.
>
> I'm back at PC.
>
> Does your driver support switching to 240p in NTSC and 288p in PAL on the
> go via xrandr, for example?
>
> If not, can I find some relevant part of code in your repository where to
> implement that?
>
> Some info I found regarding 240p and that it is a part of NTSC:
> https://en.wikipedia.org/wiki/Low-definition_television
>
> TV with S-Video mostly supports 480i and 240p as well. So the current
> issue is outputting that via TV out.
>
> My current configuration looks like this:
> TV-1 connected 240x224+0+0 (normal left inverted right x axis y axis) 0mm
> x 0mm
>    720x480       59.94 +
>    1024x768      59.94
>    800x600       59.94
>    720x576       59.94
>    640x480       59.94
>    400x300       59.94
>    320x240       59.93
>    320x200       59.94
>    768x576       50.00
>    360x200       60.00
>    360x240       60.00
>    640x240       60.00
>    SR-1_240x224@60.10  60.10*
>
> I see I have created 240x224 (I need to fix that), but even 320x240 does
> not work. It always stays at 480i.
>
> I read somewhere that older GPU with TV out can do it. Only newer cards in
> Windows cannot do it.
>
> Thank you a lot,
> Lukas
>
>
>
> On Fri, Nov 4, 2022 at 5:43 PM Lukas Satin <luke.satin@gmail.com> wrote:
>
>> Yes I just figured it out an hour ago. It works same as hd480i.
>>
>> Win7 can switch pal and ntsc just by changing desktop tesolution. Wht
>> about here?
>>
>> TV with svideo or component rca supporr 480i and 240p by the spec.
>>
>> I hve added modelines for that. It works via dvi to vga to bnc to rca
>> wity 15khz kernel.
>>
>> How to modify ut driver to outtput 240p via tv out?
>>
>> Imvon phone sorry fot ttyoos
>>
>> On Fri 4. 11. 2022 at 17:35, Ilia Mirkin <imirkin@alum.mit.edu> wrote:
>>
>>> https://nouveau.freedesktop.org/KernelModuleParameters.html
>>>
>>> Perhaps nouveau.tv_norm=NTSC-M will help get you the 60hz modes? I
>>> haven't played with these options much at all, it has always sorta
>>> Just Worked for me.
>>>
>>> This should have the validation of new modes, make sure you don't run
>>> afoul of this:
>>>
>>>
>>> https://cgit.freedesktop.org/drm/drm/tree/drivers/gpu/drm/nouveau/dispnv04/tvnv17.c#n303
>>>
>>> Cheers,
>>>
>>>   -ilia
>>>
>>> On Thu, Nov 3, 2022 at 10:56 PM Lukas Satin <luke.satin@gmail.com>
>>> wrote:
>>> >
>>> > Hi, I am currently testing Batocera Linux for retrogaming with 15KHz
>>> output on CRT / TV.
>>> >
>>> > The machine I discovered is a certified Windows Media Center / Intel
>>> ViiV machine: Acer iDEA 510
>>> >
>>> > It features:
>>> > RCA component output
>>> > S-Video CVBS output
>>> > S-Video DIN output
>>> > Scart IN / Scart OUT (two DVB-T tuners for realtime playback and
>>> recording)
>>> > DVI-I out
>>> > HDMI out
>>> >
>>> > Laptop style components, MXM module Geforce 7 Go 7600 (NVIDIA Curie).
>>> >
>>> > Now, BIOS default output via RCA component is 640x480 NTSC (480i,
>>> 60Hz). In Windows I can switch between NTSC and PAL (480i or 576i).
>>> >
>>> > As this is EU machine, after BIOS it often defaults to 576i PAL,
>>> unless set otherwise.
>>> >
>>> > Now your nouveau driver therefore defaults to 576i.
>>> >
>>> > Xrandr looks like this:
>>> > TV-1 connected 640x480+0+0 (normal left inverted right x axis y axis)
>>> 0mm x 0mm
>>> >    720x576       50.00 +
>>> >    1024x768      50.00
>>> >    800x600       50.00
>>> >    720x480       50.00
>>> >    640x480       50.00*
>>> >    400x300       50.00
>>> >    320x240       50.00
>>> >    320x200       50.00
>>> >    768x576       50.00
>>> >    360x200       60.00
>>> >    360x240       60.00
>>> >    640x240       60.00
>>> >
>>> > I tried to add some additional modelines. But look at 640x480. It
>>> forces 50Hz and I am unable to remove it, create new or change it to 60Hz.
>>> Therefore the TV is always set to 576i and screen output is 640x480,
>>> therefore it looks like GPU scaled. First I read your troubleshooting which
>>> mentions scaling, so I tried to disable scaling. Did not help.
>>> >
>>> > Now I read about this:
>>> >
>>> https://nvidia.custhelp.com/app/answers/detail/a_id/177/~/linux---configuring-tv-out
>>> >
>>> > And this might be the solution and issue. It would correspond with
>>> what can be observed in Windows 7.
>>> >
>>> > Does your driver have some options for configuring TV Out and name
>>> switching from PAL to NTSC or HD480i mode? It should be automatic based on
>>> 480i or 576i or 240p or 288p, but it is not.
>>> >
>>> > Thanks,
>>> > Lukas
>>>
>>

--00000000000050201805eca8146f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>240p compatibility list of TVs:=C2=A0<a href=3D"https=
://static1.squarespace.com/static/51f517f0e4b01da70d01ca2a/t/5a2f36e953450a=
a1429361d9/1513043690556/240p-TVs_20171211.pdf">https://static1.squarespace=
.com/static/51f517f0e4b01da70d01ca2a/t/5a2f36e953450aa1429361d9/15130436905=
56/240p-TVs_20171211.pdf</a></div><div><br></div>Source: <a href=3D"https:/=
/www.hdretrovision.com/240p">https://www.hdretrovision.com/240p</a><br></di=
v><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On F=
ri, Nov 4, 2022 at 5:55 PM Lukas Satin &lt;<a href=3D"mailto:luke.satin@gma=
il.com">luke.satin@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"g=
mail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204=
,204,204);padding-left:1ex"><div dir=3D"ltr">Hello, sorry fo the typos. Wan=
ted to catch you before the weekend, to get some hints for upcoming work.<d=
iv><br></div><div>I&#39;m back at PC.</div><div><br></div><div>Does your dr=
iver support switching to 240p in NTSC and 288p in PAL on the go via xrandr=
, for example?</div><div><br></div><div>If not, can I find some relevant=C2=
=A0part of code in your repository where to implement that?</div><div><br><=
/div><div>Some info I found regarding 240p and that it is a part of NTSC:=
=C2=A0<a href=3D"https://en.wikipedia.org/wiki/Low-definition_television" t=
arget=3D"_blank">https://en.wikipedia.org/wiki/Low-definition_television</a=
></div><div><br></div><div>TV with S-Video mostly supports 480i and 240p as=
 well. So the current issue is outputting=C2=A0that via TV out.</div><div><=
br></div><div>My current configuration looks like this:</div><div>TV-1 conn=
ected 240x224+0+0 (normal left inverted right x axis y axis) 0mm x 0mm<br>=
=C2=A0 =C2=A0720x480 =C2=A0 =C2=A0 =C2=A0 59.94 +<br>=C2=A0 =C2=A01024x768 =
=C2=A0 =C2=A0 =C2=A059.94<br>=C2=A0 =C2=A0800x600 =C2=A0 =C2=A0 =C2=A0 59.9=
4<br>=C2=A0 =C2=A0720x576 =C2=A0 =C2=A0 =C2=A0 59.94<br>=C2=A0 =C2=A0640x48=
0 =C2=A0 =C2=A0 =C2=A0 59.94<br>=C2=A0 =C2=A0400x300 =C2=A0 =C2=A0 =C2=A0 5=
9.94<br>=C2=A0 =C2=A0320x240 =C2=A0 =C2=A0 =C2=A0 59.93<br>=C2=A0 =C2=A0320=
x200 =C2=A0 =C2=A0 =C2=A0 59.94<br>=C2=A0 =C2=A0768x576 =C2=A0 =C2=A0 =C2=
=A0 50.00<br>=C2=A0 =C2=A0360x200 =C2=A0 =C2=A0 =C2=A0 60.00<br>=C2=A0 =C2=
=A0360x240 =C2=A0 =C2=A0 =C2=A0 60.00<br>=C2=A0 =C2=A0640x240 =C2=A0 =C2=A0=
 =C2=A0 60.00<br>=C2=A0 =C2=A0SR-1_240x224@60.10 =C2=A060.10*<br></div><div=
><br></div><div>I see I have created 240x224 (I need to fix that), but even=
 320x240 does not work. It always stays at 480i.</div><div><br></div><div>I=
 read somewhere that older GPU with TV out can do it. Only newer cards in W=
indows cannot do it.</div><div><br></div><div>Thank you a lot,</div><div>Lu=
kas</div><div><br></div><div><br></div></div><br><div class=3D"gmail_quote"=
><div dir=3D"ltr" class=3D"gmail_attr">On Fri, Nov 4, 2022 at 5:43 PM Lukas=
 Satin &lt;<a href=3D"mailto:luke.satin@gmail.com" target=3D"_blank">luke.s=
atin@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" st=
yle=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padd=
ing-left:1ex"><div dir=3D"auto">Yes I just figured it out an hour ago. It w=
orks same as hd480i.</div><div dir=3D"auto"><br></div><div dir=3D"auto">Win=
7 can switch pal and ntsc just by changing desktop tesolution. Wht about he=
re?</div><div dir=3D"auto"><br></div><div dir=3D"auto">TV with svideo or co=
mponent rca supporr 480i and 240p by the spec.</div><div dir=3D"auto"><br><=
/div><div dir=3D"auto">I hve added modelines for that. It works via dvi to =
vga to bnc to rca wity 15khz kernel.</div><div dir=3D"auto"><br></div><div =
dir=3D"auto">How to modify ut driver to outtput 240p via tv out?</div><div =
dir=3D"auto"><br></div><div dir=3D"auto">Imvon phone sorry fot ttyoos</div>=
<div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">O=
n Fri 4. 11. 2022 at 17:35, Ilia Mirkin &lt;<a href=3D"mailto:imirkin@alum.=
mit.edu" target=3D"_blank">imirkin@alum.mit.edu</a>&gt; wrote:<br></div><bl=
ockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-lef=
t:1px solid rgb(204,204,204);padding-left:1ex"><a href=3D"https://nouveau.f=
reedesktop.org/KernelModuleParameters.html" rel=3D"noreferrer" target=3D"_b=
lank">https://nouveau.freedesktop.org/KernelModuleParameters.html</a><br>
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
</blockquote></div>

--00000000000050201805eca8146f--
