Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D3A9861A07E
	for <lists+nouveau@lfdr.de>; Fri,  4 Nov 2022 20:04:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC61488668;
	Fri,  4 Nov 2022 19:04:34 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-oa1-x35.google.com (mail-oa1-x35.google.com
 [IPv6:2001:4860:4864:20::35])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D33788668
 for <nouveau@lists.freedesktop.org>; Fri,  4 Nov 2022 19:04:31 +0000 (UTC)
Received: by mail-oa1-x35.google.com with SMTP id
 586e51a60fabf-13bd19c3b68so6518800fac.7
 for <nouveau@lists.freedesktop.org>; Fri, 04 Nov 2022 12:04:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:subject:message-id:date:from:in-reply-to:references:mime-version
 :from:to:cc:subject:date:message-id:reply-to;
 bh=UomQYdn7aGKnW3bTIPSIttHG3CbewOp/JvSXJnMlFvc=;
 b=Fi8/JdnP9Y1MAzPERyuk7NPg8etBRgxppQN5BM1chO8eM196wZDL5OAOACTRMBFULC
 MszrORvz8DYzQYzSAj3mokQyEzY2QW6HyIf79FcfNjlihMJD5M0fbykAZiuN6OiS3EBw
 HR2QcvAAKZ4sdVPCnLAtugd7tHPfzESJsFKdif7y/zTJua7zY6T/hd3il1HkCLl6p1Tv
 GeL4F1gbQMjUhWvlu7ri0Ro+gOaVM8VExtSoADlDCzpHVdUPGQYTLP4CjSpxm1BqOZLJ
 +t19T243cAacWIODjhVGUaxE11xhpCbu/razusrh1Zy8vXIgVFUTHQl09l7OszCke+Qi
 Ldzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:subject:message-id:date:from:in-reply-to:references:mime-version
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=UomQYdn7aGKnW3bTIPSIttHG3CbewOp/JvSXJnMlFvc=;
 b=oPIybTKVp9nKHf1n1QBUuhOE/AH1kn2KcvobmydLDHKViry6ojbn4LqB7zZsGRK6lD
 YXFHBTGVCGdZstfOOn2h4st+V4UCITC66VYCfyb7BhNxdn3G+KawRA2BqZ3RdlFQ1GF8
 IlBKZ11rYn/n9hyRcsDDWti/nrnF9gdHDHJ05pY+TmZs48lUDpOTh5VwFJWVhKXRLRbE
 RJ6N+QgmFE9rnKcI3yukTTC4k+gl6KGP0ahDFXTaGBUYz9HdD5j2ZizBKtYDem79FWG0
 CERqaJSOu7hnMmPkAPOsHM3HKS92lXMFy2Dbz0DTV7b9nHkBHCppYZw2re/ugk/fwLW+
 bD0w==
X-Gm-Message-State: ACrzQf31FUW36FuusGMIXkwqEX3rcmQNyWVKl0TpL/gT3mbRpas1XWMV
 MtAUOd/bh5CiPrl0m/NElEfvrWQyUK854t1DbXSobBs4Rc7G7w==
X-Google-Smtp-Source: AMsMyM7prv4a3J2gVBcPR+lSrgpfMnEg+DlBUjTvDOmvfFcHo8SAUFhGxHVH+EzeSoZhjTKlDk+XyhDUHOnQqxESlek=
X-Received: by 2002:a05:6870:5596:b0:13c:831a:f150 with SMTP id
 n22-20020a056870559600b0013c831af150mr22322678oao.234.1667588670486; Fri, 04
 Nov 2022 12:04:30 -0700 (PDT)
MIME-Version: 1.0
References: <CAEFVmOL+163rX7hEpgKn20RrzMXekw6JcM30rY4AmoHhDV_5Qw@mail.gmail.com>
 <CAKb7Uvi79P6skuKgF6Q884TtiC1k0bwrBw7r41TfY1-BBLjTxQ@mail.gmail.com>
 <CAEFVmO+pbgKQua5oAV6wP19AwyQVgvXT1sV=6pb=ejnq2F9Oog@mail.gmail.com>
 <CAEFVmOKdfPZBuU2V=iGh4k9QtrSxC0y2NTnSChHaZVkb=DMLDQ@mail.gmail.com>
 <CAKb7UvipWtb=T0WaB+R2DvKGozXAtgCs8z=RSskbyLcMpSpRSQ@mail.gmail.com>
 <CAEFVmOL9t7g3Lk_CtnprExPtnTd2-MpZepuzTLnbiRjqwNY+Wg@mail.gmail.com>
 <CAEFVmOLhF7quxb8O7SNdFVnqhxnpcZM8wLUhG_r8Kptce56o9A@mail.gmail.com>
In-Reply-To: <CAEFVmOLhF7quxb8O7SNdFVnqhxnpcZM8wLUhG_r8Kptce56o9A@mail.gmail.com>
From: Lukas Satin <luke.satin@gmail.com>
Date: Fri, 4 Nov 2022 20:04:19 +0100
Message-ID: <CAEFVmOJt7KxM+jnby29jPb-0WkahSVoGG9RBFMArD6vB4t-aRA@mail.gmail.com>
Cc: nouveau@lists.freedesktop.org
Content-Type: multipart/alternative; boundary="00000000000055fe4905eca9bec5"
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

--00000000000055fe4905eca9bec5
Content-Type: text/plain; charset="UTF-8"

Switch to 360x240 works, but it is only scaled to 640x480.

I read that it should be possible to set particular TV chipset registers
and there's nvtv utility for that:
https://manpages.ubuntu.com/manpages/focal/man1/nvtv.1x.html

I guess it will work only with nvidia driver, which in NV40 case is legacy
304 series, which means compiling custom kernel and patching it on Ubuntu
18:
http://blog.schmorp.de/2019-08-03-nvidia-legacy-304-patch-for-post-50-linux-kernels.html

It would be great if your nuvo can set these tv chipset registers as well.

I collect retro hardware and I'm retrogamer (born 1987). There are
significant costs, most retrogamers buy 500 Eur video converter because
they want to output 240p TV resolution.

Currently only Calamity's CRT EmuDriver works and that one is for AMD
GPU's only.

For NVIDIA you need Linux kernel with 15Khz fix (which I have):
https://github.com/D0023R/linux_kernel_15khz and then you can output 15khz
240P over VGA, DVI-I or even HDMI. Then you apply some kind of adapter, for
example HDMI to VGA or DVI to VGA. Then you can use VGA to BNC cable and
use BNC directly in TV or you can buy RCA BNC connector and go from HDMI to
RCA and it will output directly 240p using custom made modelines and
enabling either custom unsigned AMD driver or having Linux kernel with
15khz patch.

Controlling TV out chipset directly would be the next level and it would be
great if it could be achieved.

On Fri, Nov 4, 2022 at 6:29 PM Lukas Satin <luke.satin@gmail.com> wrote:

> Yes, switching to 360x240 works! Interesting...it is definitely a step
> forward while still not satisfying result.
>
> On Fri, Nov 4, 2022 at 6:13 PM Lukas Satin <luke.satin@gmail.com> wrote:
>
>> 1) Some people here say: " Scrap everything already stated. The old
>> Nvidia cards with the mini DIN analog video out can ONLY do 480i output.
>> 240p is not an option."
>>
>> Source:
>> https://www.reddit.com/r/crtgaming/comments/a9k85n/old_nvidia_geforce_output_240p/
>>
>> But I guess that is due to using Windows and NVIDIA driver.
>>
>> 2) Here:
>> https://www.reddit.com/r/retrogaming/comments/40dv00/240p_signal_from_svideo_port_on_old_video_card/
>> someone says: "240p doesn't actually exist, it's really a trick that
>> uses a non-standard 480i signal to cause the alternating fields line up the
>> scanlines instead of offsetting them. "
>>
>> So I guess it could be done by sending non-standard 480i signal.
>>
>> On Fri, Nov 4, 2022 at 6:06 PM Ilia Mirkin <imirkin@alum.mit.edu> wrote:
>>
>>> On Fri, Nov 4, 2022 at 12:56 PM Lukas Satin <luke.satin@gmail.com>
>>> wrote:
>>> >
>>> > Hello, sorry fo the typos. Wanted to catch you before the weekend, to
>>> get some hints for upcoming work.
>>> >
>>> > I'm back at PC.
>>> >
>>> > Does your driver support switching to 240p in NTSC and 288p in PAL on
>>> the go via xrandr, for example?
>>> >
>>> > If not, can I find some relevant part of code in your repository where
>>> to implement that?
>>>
>>>
>>> https://cgit.freedesktop.org/drm/drm/tree/drivers/gpu/drm/nouveau/dispnv04/tvnv17.c
>>> + tvmodesnv17.c
>>>
>>> There's definitely a lot of hard-coding going on. A lot of the
>>> pre-nv50 display code is from This code is (likely) originally from
>>> https://cgit.freedesktop.org/xorg/driver/xf86-video-nv/tree/src but I
>>> can't immediately find the TV code in there. But perhaps it's there
>>> anyways, I only spent about 30s looking for it.
>>>
>>> I don't remember by now, but there _might_ be a kms property (which
>>> should get piped through to xrandr properties) which allows you to
>>> change this live?
>>>
>>> > Some info I found regarding 240p and that it is a part of NTSC:
>>> https://en.wikipedia.org/wiki/Low-definition_television
>>> >
>>> > TV with S-Video mostly supports 480i and 240p as well. So the current
>>> issue is outputting that via TV out.
>>> >
>>> > My current configuration looks like this:
>>> > TV-1 connected 240x224+0+0 (normal left inverted right x axis y axis)
>>> 0mm x 0mm
>>> >    720x480       59.94 +
>>> >    1024x768      59.94
>>> >    800x600       59.94
>>> >    720x576       59.94
>>> >    640x480       59.94
>>> >    400x300       59.94
>>> >    320x240       59.93
>>> >    320x200       59.94
>>> >    768x576       50.00
>>> >    360x200       60.00
>>> >    360x240       60.00
>>> >    640x240       60.00
>>> >    SR-1_240x224@60.10  60.10*
>>> >
>>> > I see I have created 240x224 (I need to fix that), but even 320x240
>>> does not work. It always stays at 480i.
>>>
>>> Did you try 360x240? I have no idea though, sorry. I was just happy
>>> when the S-Video worked at all. It could require further modifications
>>> to how we configure those registers.
>>>
>>

--00000000000055fe4905eca9bec5
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Switch to 360x240 works, but it is only scaled to 640x480.=
<div><br></div><div>I read that it should be possible to set particular TV =
chipset registers and there&#39;s nvtv utility for that:=C2=A0<a href=3D"ht=
tps://manpages.ubuntu.com/manpages/focal/man1/nvtv.1x.html">https://manpage=
s.ubuntu.com/manpages/focal/man1/nvtv.1x.html</a></div><div><br></div><div>=
I guess it will work only with nvidia driver, which in NV40 case is legacy =
304 series, which means compiling custom kernel and patching it on Ubuntu 1=
8:=C2=A0<a href=3D"http://blog.schmorp.de/2019-08-03-nvidia-legacy-304-patc=
h-for-post-50-linux-kernels.html">http://blog.schmorp.de/2019-08-03-nvidia-=
legacy-304-patch-for-post-50-linux-kernels.html</a></div><div><br></div><di=
v>It would be great if your nuvo can set these tv chipset registers as well=
.</div><div><br></div><div>I collect retro hardware and I&#39;m retrogamer =
(born 1987). There are significant costs, most retrogamers buy 500 Eur vide=
o converter because they want to output 240p TV resolution.</div><div><br><=
/div><div>Currently only Calamity&#39;s CRT EmuDriver works and that one is=
 for AMD GPU&#39;s=C2=A0only.</div><div><br></div><div>For NVIDIA you need =
Linux kernel with 15Khz fix (which I have):=C2=A0<a href=3D"https://github.=
com/D0023R/linux_kernel_15khz">https://github.com/D0023R/linux_kernel_15khz=
</a> and then you can output 15khz 240P over VGA, DVI-I or even HDMI. Then =
you apply some kind of adapter, for example HDMI to VGA or DVI to VGA. Then=
 you can use VGA to BNC cable and use BNC directly in TV or you can buy RCA=
 BNC connector and go from HDMI to RCA and it will output directly 240p usi=
ng custom made modelines and enabling either custom unsigned AMD driver or =
having Linux kernel with 15khz patch.</div><div><br></div><div>Controlling =
TV out chipset directly would be the next level and it would be great if it=
 could be achieved.</div></div><br><div class=3D"gmail_quote"><div dir=3D"l=
tr" class=3D"gmail_attr">On Fri, Nov 4, 2022 at 6:29 PM Lukas Satin &lt;<a =
href=3D"mailto:luke.satin@gmail.com">luke.satin@gmail.com</a>&gt; wrote:<br=
></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;=
border-left:1px solid rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr">Y=
es, switching to 360x240 works! Interesting...it is definitely a step forwa=
rd while still not satisfying result.</div><br><div class=3D"gmail_quote"><=
div dir=3D"ltr" class=3D"gmail_attr">On Fri, Nov 4, 2022 at 6:13 PM Lukas S=
atin &lt;<a href=3D"mailto:luke.satin@gmail.com" target=3D"_blank">luke.sat=
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
</blockquote></div>

--00000000000055fe4905eca9bec5--
