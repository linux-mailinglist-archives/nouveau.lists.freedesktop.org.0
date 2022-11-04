Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C3F2A619EBA
	for <lists+nouveau@lfdr.de>; Fri,  4 Nov 2022 18:29:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B4BDE10E96B;
	Fri,  4 Nov 2022 17:29:29 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-oi1-x22d.google.com (mail-oi1-x22d.google.com
 [IPv6:2607:f8b0:4864:20::22d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C42A10E96B
 for <nouveau@lists.freedesktop.org>; Fri,  4 Nov 2022 17:29:26 +0000 (UTC)
Received: by mail-oi1-x22d.google.com with SMTP id r83so5887017oih.2
 for <nouveau@lists.freedesktop.org>; Fri, 04 Nov 2022 10:29:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:subject:message-id:date:from:in-reply-to:references:mime-version
 :from:to:cc:subject:date:message-id:reply-to;
 bh=i0o+4wEuDnxoD08U7Ik1EkGJS/3mdgzENaE7dCWcnNg=;
 b=Ybv7eT8sTax/KeZaF86rdgESFoZ9SShnOF2u4OKObM9OMmNtAxgAgzHNUeOtCz1Uqc
 tWwAimsUfSLZAxC53BAxeVzQv8I1if7nAwFL1GIPffOalLkNlapt8Rl5cLObisHdsPv2
 aGufRV32sE4nsQqme8KePx5VL61waU23NYUrWA6gbGq7wdJTytQZX6nhvAHF2ZlFC6as
 csU/2LGakPtMoEiNX/RGZBzOo5pL65MptrJYH8iYdixECaj3iQ0hu/444kXQw27mDQ6F
 P6mUcS5DSZH4ylLRD/w7M5sjvEa8f4SPIu9V6r0qD6fzBLJysLE1R8YcQDAt1i6YT+/k
 mAng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:subject:message-id:date:from:in-reply-to:references:mime-version
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=i0o+4wEuDnxoD08U7Ik1EkGJS/3mdgzENaE7dCWcnNg=;
 b=U6DjZhB5t4VwhH/6Nej8k9BYUzA7Zc9RuuHgYA1CqTkdTERoRjGCO5vlP4yrS0SZm0
 1v1gVCEMowHWWZjcQAFQrog3FQmnLKl8d5TMgad0FtXnuOdFr5MswSSGCGwQHR7UVCO8
 sAI0UjOQUT/bQDL8OLZWCIFwZZaQmh+ZcxXY3Jg5jXI5XwTSQzfcuh/WmXZrxVyvfa+U
 KLbEE/Ycm8Kz/JtTk/W9+1r8p+WrPrZ0y6M9CM5wKxZ4Yfpxa2cnBKyVxYO87hMedSPp
 EbiSmIfPZc0Y63AfwjpUa9DQ+1azBFFO4FKnk51Ht5wf3sJXsTyglyUDyb7G62nZNlPl
 SEkg==
X-Gm-Message-State: ACrzQf219nrcym0+5GxtbryXSvQBKK1Iq7ZbqT0EhorQVREd5tdXBDm2
 omD0mPjUW2345evnWHtHeHM14xTxx/mwwJ05JCC77nVc8aQ=
X-Google-Smtp-Source: AMsMyM4Yym9OGdB4H2oLPdEUJqrCdQrnv06rolRxO4J5X0rJ61K0BRviR5FTVwVoxzOplpEolir2PIXSkl9Q/ADyu6E=
X-Received: by 2002:a54:4587:0:b0:359:c737:b2e8 with SMTP id
 z7-20020a544587000000b00359c737b2e8mr19777907oib.234.1667582964754; Fri, 04
 Nov 2022 10:29:24 -0700 (PDT)
MIME-Version: 1.0
References: <CAEFVmOL+163rX7hEpgKn20RrzMXekw6JcM30rY4AmoHhDV_5Qw@mail.gmail.com>
 <CAKb7Uvi79P6skuKgF6Q884TtiC1k0bwrBw7r41TfY1-BBLjTxQ@mail.gmail.com>
 <CAEFVmO+pbgKQua5oAV6wP19AwyQVgvXT1sV=6pb=ejnq2F9Oog@mail.gmail.com>
 <CAEFVmOKdfPZBuU2V=iGh4k9QtrSxC0y2NTnSChHaZVkb=DMLDQ@mail.gmail.com>
 <CAKb7UvipWtb=T0WaB+R2DvKGozXAtgCs8z=RSskbyLcMpSpRSQ@mail.gmail.com>
 <CAEFVmOL9t7g3Lk_CtnprExPtnTd2-MpZepuzTLnbiRjqwNY+Wg@mail.gmail.com>
In-Reply-To: <CAEFVmOL9t7g3Lk_CtnprExPtnTd2-MpZepuzTLnbiRjqwNY+Wg@mail.gmail.com>
From: Lukas Satin <luke.satin@gmail.com>
Date: Fri, 4 Nov 2022 18:29:13 +0100
Message-ID: <CAEFVmOLhF7quxb8O7SNdFVnqhxnpcZM8wLUhG_r8Kptce56o9A@mail.gmail.com>
Cc: nouveau@lists.freedesktop.org
Content-Type: multipart/alternative; boundary="0000000000003f6c9805eca86a99"
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

--0000000000003f6c9805eca86a99
Content-Type: text/plain; charset="UTF-8"

Yes, switching to 360x240 works! Interesting...it is definitely a step
forward while still not satisfying result.

On Fri, Nov 4, 2022 at 6:13 PM Lukas Satin <luke.satin@gmail.com> wrote:

> 1) Some people here say: " Scrap everything already stated. The old
> Nvidia cards with the mini DIN analog video out can ONLY do 480i output.
> 240p is not an option."
>
> Source:
> https://www.reddit.com/r/crtgaming/comments/a9k85n/old_nvidia_geforce_output_240p/
>
> But I guess that is due to using Windows and NVIDIA driver.
>
> 2) Here:
> https://www.reddit.com/r/retrogaming/comments/40dv00/240p_signal_from_svideo_port_on_old_video_card/
> someone says: "240p doesn't actually exist, it's really a trick that uses
> a non-standard 480i signal to cause the alternating fields line up the
> scanlines instead of offsetting them. "
>
> So I guess it could be done by sending non-standard 480i signal.
>
> On Fri, Nov 4, 2022 at 6:06 PM Ilia Mirkin <imirkin@alum.mit.edu> wrote:
>
>> On Fri, Nov 4, 2022 at 12:56 PM Lukas Satin <luke.satin@gmail.com> wrote:
>> >
>> > Hello, sorry fo the typos. Wanted to catch you before the weekend, to
>> get some hints for upcoming work.
>> >
>> > I'm back at PC.
>> >
>> > Does your driver support switching to 240p in NTSC and 288p in PAL on
>> the go via xrandr, for example?
>> >
>> > If not, can I find some relevant part of code in your repository where
>> to implement that?
>>
>>
>> https://cgit.freedesktop.org/drm/drm/tree/drivers/gpu/drm/nouveau/dispnv04/tvnv17.c
>> + tvmodesnv17.c
>>
>> There's definitely a lot of hard-coding going on. A lot of the
>> pre-nv50 display code is from This code is (likely) originally from
>> https://cgit.freedesktop.org/xorg/driver/xf86-video-nv/tree/src but I
>> can't immediately find the TV code in there. But perhaps it's there
>> anyways, I only spent about 30s looking for it.
>>
>> I don't remember by now, but there _might_ be a kms property (which
>> should get piped through to xrandr properties) which allows you to
>> change this live?
>>
>> > Some info I found regarding 240p and that it is a part of NTSC:
>> https://en.wikipedia.org/wiki/Low-definition_television
>> >
>> > TV with S-Video mostly supports 480i and 240p as well. So the current
>> issue is outputting that via TV out.
>> >
>> > My current configuration looks like this:
>> > TV-1 connected 240x224+0+0 (normal left inverted right x axis y axis)
>> 0mm x 0mm
>> >    720x480       59.94 +
>> >    1024x768      59.94
>> >    800x600       59.94
>> >    720x576       59.94
>> >    640x480       59.94
>> >    400x300       59.94
>> >    320x240       59.93
>> >    320x200       59.94
>> >    768x576       50.00
>> >    360x200       60.00
>> >    360x240       60.00
>> >    640x240       60.00
>> >    SR-1_240x224@60.10  60.10*
>> >
>> > I see I have created 240x224 (I need to fix that), but even 320x240
>> does not work. It always stays at 480i.
>>
>> Did you try 360x240? I have no idea though, sorry. I was just happy
>> when the S-Video worked at all. It could require further modifications
>> to how we configure those registers.
>>
>

--0000000000003f6c9805eca86a99
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Yes, switching to 360x240 works! Interesting...it is defin=
itely a step forward while still not satisfying result.</div><br><div class=
=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Fri, Nov 4, 2022 =
at 6:13 PM Lukas Satin &lt;<a href=3D"mailto:luke.satin@gmail.com">luke.sat=
in@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" styl=
e=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddin=
g-left:1ex"><div dir=3D"ltr">1) Some people here say: &quot;

<span style=3D"color:rgb(28,28,28);font-family:&quot;Noto Sans&quot;,Arial,=
sans-serif;font-size:14px">Scrap everything already stated. The old Nvidia =
cards with the mini DIN analog video out can ONLY do 480i output. 240p is n=
ot an option.&quot;</span><div><br></div><div><div>Source: <a href=3D"https=
://www.reddit.com/r/crtgaming/comments/a9k85n/old_nvidia_geforce_output_240=
p/" target=3D"_blank">https://www.reddit.com/r/crtgaming/comments/a9k85n/ol=
d_nvidia_geforce_output_240p/</a><br></div></div><div><br></div><div>But I =
guess that is due to using Windows and NVIDIA driver.</div><div><br></div><=
div>2) Here:=C2=A0<a href=3D"https://www.reddit.com/r/retrogaming/comments/=
40dv00/240p_signal_from_svideo_port_on_old_video_card/" target=3D"_blank">h=
ttps://www.reddit.com/r/retrogaming/comments/40dv00/240p_signal_from_svideo=
_port_on_old_video_card/</a></div><div>someone says: &quot;<span style=3D"c=
olor:rgb(28,28,28);font-family:&quot;Noto Sans&quot;,Arial,sans-serif;font-=
size:14px">240p doesn&#39;t actually exist, it&#39;s really a trick that us=
es a non-standard 480i signal to cause the alternating fields line up the s=
canlines instead of offsetting them.</span><span style=3D"color:rgb(28,28,2=
8);font-family:&quot;Noto Sans&quot;,Arial,sans-serif;font-size:14px">=C2=
=A0&quot;</span></div><div><span style=3D"color:rgb(28,28,28);font-family:&=
quot;Noto Sans&quot;,Arial,sans-serif;font-size:14px"><br></span></div><div=
><span style=3D"color:rgb(28,28,28);font-family:&quot;Noto Sans&quot;,Arial=
,sans-serif;font-size:14px">So I guess it could be done by sending non-stan=
dard 480i signal.=C2=A0</span></div></div><br><div class=3D"gmail_quote"><d=
iv dir=3D"ltr" class=3D"gmail_attr">On Fri, Nov 4, 2022 at 6:06 PM Ilia Mir=
kin &lt;<a href=3D"mailto:imirkin@alum.mit.edu" target=3D"_blank">imirkin@a=
lum.mit.edu</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">On Fri, Nov 4, 2022 at 12:56 PM Lukas Satin &lt;<a href=3D"mailt=
o:luke.satin@gmail.com" target=3D"_blank">luke.satin@gmail.com</a>&gt; wrot=
e:<br>
&gt;<br>
&gt; Hello, sorry fo the typos. Wanted to catch you before the weekend, to =
get some hints for upcoming work.<br>
&gt;<br>
&gt; I&#39;m back at PC.<br>
&gt;<br>
&gt; Does your driver support switching to 240p in NTSC and 288p in PAL on =
the go via xrandr, for example?<br>
&gt;<br>
&gt; If not, can I find some relevant part of code in your repository where=
 to implement that?<br>
<br>
<a href=3D"https://cgit.freedesktop.org/drm/drm/tree/drivers/gpu/drm/nouvea=
u/dispnv04/tvnv17.c" rel=3D"noreferrer" target=3D"_blank">https://cgit.free=
desktop.org/drm/drm/tree/drivers/gpu/drm/nouveau/dispnv04/tvnv17.c</a><br>
+ tvmodesnv17.c<br>
<br>
There&#39;s definitely a lot of hard-coding going on. A lot of the<br>
pre-nv50 display code is from This code is (likely) originally from<br>
<a href=3D"https://cgit.freedesktop.org/xorg/driver/xf86-video-nv/tree/src"=
 rel=3D"noreferrer" target=3D"_blank">https://cgit.freedesktop.org/xorg/dri=
ver/xf86-video-nv/tree/src</a> but I<br>
can&#39;t immediately find the TV code in there. But perhaps it&#39;s there=
<br>
anyways, I only spent about 30s looking for it.<br>
<br>
I don&#39;t remember by now, but there _might_ be a kms property (which<br>
should get piped through to xrandr properties) which allows you to<br>
change this live?<br>
<br>
&gt; Some info I found regarding 240p and that it is a part of NTSC: <a hre=
f=3D"https://en.wikipedia.org/wiki/Low-definition_television" rel=3D"norefe=
rrer" target=3D"_blank">https://en.wikipedia.org/wiki/Low-definition_televi=
sion</a><br>
&gt;<br>
&gt; TV with S-Video mostly supports 480i and 240p as well. So the current =
issue is outputting that via TV out.<br>
&gt;<br>
&gt; My current configuration looks like this:<br>
&gt; TV-1 connected 240x224+0+0 (normal left inverted right x axis y axis) =
0mm x 0mm<br>
&gt;=C2=A0 =C2=A0 720x480=C2=A0 =C2=A0 =C2=A0 =C2=A059.94 +<br>
&gt;=C2=A0 =C2=A0 1024x768=C2=A0 =C2=A0 =C2=A0 59.94<br>
&gt;=C2=A0 =C2=A0 800x600=C2=A0 =C2=A0 =C2=A0 =C2=A059.94<br>
&gt;=C2=A0 =C2=A0 720x576=C2=A0 =C2=A0 =C2=A0 =C2=A059.94<br>
&gt;=C2=A0 =C2=A0 640x480=C2=A0 =C2=A0 =C2=A0 =C2=A059.94<br>
&gt;=C2=A0 =C2=A0 400x300=C2=A0 =C2=A0 =C2=A0 =C2=A059.94<br>
&gt;=C2=A0 =C2=A0 320x240=C2=A0 =C2=A0 =C2=A0 =C2=A059.93<br>
&gt;=C2=A0 =C2=A0 320x200=C2=A0 =C2=A0 =C2=A0 =C2=A059.94<br>
&gt;=C2=A0 =C2=A0 768x576=C2=A0 =C2=A0 =C2=A0 =C2=A050.00<br>
&gt;=C2=A0 =C2=A0 360x200=C2=A0 =C2=A0 =C2=A0 =C2=A060.00<br>
&gt;=C2=A0 =C2=A0 360x240=C2=A0 =C2=A0 =C2=A0 =C2=A060.00<br>
&gt;=C2=A0 =C2=A0 640x240=C2=A0 =C2=A0 =C2=A0 =C2=A060.00<br>
&gt;=C2=A0 =C2=A0 SR-1_240x224@60.10=C2=A0 60.10*<br>
&gt;<br>
&gt; I see I have created 240x224 (I need to fix that), but even 320x240 do=
es not work. It always stays at 480i.<br>
<br>
Did you try 360x240? I have no idea though, sorry. I was just happy<br>
when the S-Video worked at all. It could require further modifications<br>
to how we configure those registers.<br>
</blockquote></div>
</blockquote></div>

--0000000000003f6c9805eca86a99--
