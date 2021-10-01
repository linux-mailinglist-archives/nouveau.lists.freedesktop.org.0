Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4299D41F686
	for <lists+nouveau@lfdr.de>; Fri,  1 Oct 2021 22:56:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8EAE66F405;
	Fri,  1 Oct 2021 20:55:58 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-qt1-x82e.google.com (mail-qt1-x82e.google.com
 [IPv6:2607:f8b0:4864:20::82e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0792F6F405
 for <nouveau@lists.freedesktop.org>; Fri,  1 Oct 2021 20:55:58 +0000 (UTC)
Received: by mail-qt1-x82e.google.com with SMTP id j13so10250290qtq.6
 for <nouveau@lists.freedesktop.org>; Fri, 01 Oct 2021 13:55:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=g9ia2scN+PnpBMLBUPJj//hr4KAiFyZsxPRAdyHN1HA=;
 b=BXtChwbfBSBwaljlqJD0ndQn7i8Pbd7/yFw+sBRxyyBFpD1+mVitAZKT2TTuOYDDZl
 aJAZk9DEo0KkvCS/F8nntWNqEpEo5CwHGuSYcWLa5+dJRJJwQcCGd4F9S6GGFMb+1M/Y
 ApnaBAwoTerIAadlyJi7+nNpEHvKRWWcuA82S21NshGeobNGCfPV85va1jKyTzjMFlj/
 UXiCqM0hALPh7ymVFpMjO7BZR78D2zXdkYHKnigrLp8HylpXxEFfKJ8Ig1HRVdIFAjf0
 imnI90N1zxr+rQfca8PnbY7fRL92rOLOygqi66TLY1b1N5adYMk6RpZTjfWmzpqGzx/0
 Mw1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=g9ia2scN+PnpBMLBUPJj//hr4KAiFyZsxPRAdyHN1HA=;
 b=rVAgz4NnwGGGili4Xj2KozU1sS2y8xRAUf4INgQ6v+eGEFAYT9YSWW8cyYJJwRX0Pr
 Aqj+GOxCFG5TBgXFctrFSlp6n7GZU43cmXekvDsNRvyLkMlCFJw84G99CdM4B8bx9RZU
 zhVgAyZEcaZQf1onZUNuoY3bifxmENNHJyVb3q4TtVh8BTbnALUGk3LH1bXJIL3vibYr
 FvzZbxFpWCTjzC3RL/8HiYFqfe0nJ9jBpmj4ndb6IE9yUC69FQXDn9mnvXA1W761Fk2s
 Lgn80Avqq9/xWMzlLAE/5qs47NvhJqaZF4TEJcH6d+GkFTl10DHg9krdEmOLGKTLPrHJ
 JA0A==
X-Gm-Message-State: AOAM5336s5pjbPo/ALZu86LIOINm1PALD2xCqsGBMF11TtmWYtJ9aMZ2
 JbSo4thny3m1l4BO1/Kj4SHmCi1VhTMJFPGaSHjmldno
X-Google-Smtp-Source: ABdhPJzWoa8UVAU+t3zmo87L1/Kycb3BtMSYA3YojYW1+T3t/zg/JukKY806iUyaRlT3NoH1MBj1aoz6oAZ1sjmOlU0=
X-Received: by 2002:ac8:5c54:: with SMTP id j20mr124011qtj.4.1633121757222;
 Fri, 01 Oct 2021 13:55:57 -0700 (PDT)
MIME-Version: 1.0
References: <CABr8-B5YD4YGgcVfuqNGQumBSpuz8tFA0hEUJWZnHps6ZOKpMA@mail.gmail.com>
 <CAKb7UvgXTkCTQhvK7A_98kfjicBxfJyH0nC_ya5y1wqYxFCfJw@mail.gmail.com>
 <CABr8-B6iZZia65A+=-yZnnU9rB4VwgDbXA+neEZ-V=YJgXQ5-w@mail.gmail.com>
 <CAKb7UvghfxFBahsG5L-i-=u0LvFkW=oA3wckFzBBNV4N7Jx0UQ@mail.gmail.com>
 <CABr8-B7HauHQcwx5ymMqk_R6+MAEemo_-gaag+5NCmtS_O=Ejw@mail.gmail.com>
 <CAKb7Uvi1VRD0H-ZSJ=NrhV2y1rAk3-hsPE60Am_eE0Z2YnZj4Q@mail.gmail.com>
 <CABr8-B4V+UpMD5+kKFuZNxqYXTNkEV5yL3m20HGSAz73zWMCzA@mail.gmail.com>
 <CAKb7Uvh6ieqB3fCppR3z8gvVM2xp_0EvbQbXPueoeAXkH1_LAw@mail.gmail.com>
 <CABr8-B5cakVP_VLHFv4ORxZynddEskrHjbhXGAsVbFRsBkDuVg@mail.gmail.com>
 <CABr8-B6BfU--4WOXP3z80MpkN6rFsUpMTYN_y7yatYSA6RGvzw@mail.gmail.com>
 <CAKb7UvgaOi9Le9F2hv3d2xjSrxenatUWMobKjjfb_UfGuPRbtA@mail.gmail.com>
 <CABr8-B4zOQU1KYatZre7yZ9tkFOAffZj=DLKbvZe5om9uQ6ssA@mail.gmail.com>
 <CAKb7Uvi7V+cSOTWvRGyE6BhZpbShVDV+H1+nenJ0osTM-m+1Aw@mail.gmail.com>
 <CABr8-B4pDnBDM92WCWEbfjnyXaDsGr9hg8Z2ENcxDdskHP54PA@mail.gmail.com>
 <CAKb7UvgpM2o71wWfjOt8hobFd1ovC_4JX3_TgT87WBj7H40LTw@mail.gmail.com>
 <CABr8-B64iJK2zSVnb4Z6XMLy0oaDvxtKZppTJn+KBp-0Hcu-bw@mail.gmail.com>
In-Reply-To: <CABr8-B64iJK2zSVnb4Z6XMLy0oaDvxtKZppTJn+KBp-0Hcu-bw@mail.gmail.com>
From: Jerry Geis <jerry.geis@gmail.com>
Date: Fri, 1 Oct 2021 16:55:46 -0400
Message-ID: <CABr8-B5Vu33y0HptJMi7+Pcs-swHddmKiM5KpYo5gJe5hMpxww@mail.gmail.com>
To: Ilia Mirkin <imirkin@alum.mit.edu>
Cc: nouveau <nouveau@lists.freedesktop.org>
Content-Type: multipart/alternative; boundary="00000000000036d8d505cd50caa5"
Subject: Re: [Nouveau] Nouveau on Ubuntu 20.04 LTS
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

--00000000000036d8d505cd50caa5
Content-Type: text/plain; charset="UTF-8"

On Fri, Oct 1, 2021 at 4:48 PM Jerry Geis <jerry.geis@gmail.com> wrote:

>
>
> On Fri, Oct 1, 2021 at 4:41 PM Ilia Mirkin <imirkin@alum.mit.edu> wrote:
>
>> On Fri, Oct 1, 2021 at 4:29 PM Jerry Geis <jerry.geis@gmail.com> wrote:
>> > yes very weird on the sound. Using analog speakers at the moment
>> > I got no test sound - and no video sound after getting nouveau to run
>> correctly ????
>> > I was playing analog audio before ?
>> > Does nouveau only do HDMI audio ?
>>
>> nouveau only does HDMI(/DP) audio. A different driver will handle a
>> built-in sound card (e.g. snd_hda_intel). You might want to reach out
>> to your distro's support channels to better diagnose what's going on.
>> Unlikely to have anything to do with nouveau. More likely that you had
>> added "acpi=off" to hack around this. Or perhaps pci=nomsi for a
>> broken audio adapter? Don't know. dmesg (not to mention google) will
>> have the answers.
>>
>>   -ilia
>>
>
> Thanks - I switched monitors - using a 4K monitor with buildin sound.
> Sound works now- great.  but the screen is not in 4K .
> Does Nouveau not do 4K - 3840x2160?
>
> Thanks!
>
> Jerry
>

HA! I just dawned on my the OLD GT218 does not do 4K... The 4K display
looks like a strched for some reason - I thought it would jus tbe the
normal 1080p.
Anyway - got it working - thanks to all the suggestions!

Jerry

--00000000000036d8d505cd50caa5
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Fri, Oct 1, 2021 at 4:48 PM Jerry =
Geis &lt;<a href=3D"mailto:jerry.geis@gmail.com">jerry.geis@gmail.com</a>&g=
t; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0p=
x 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div d=
ir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote"><div d=
ir=3D"ltr" class=3D"gmail_attr">On Fri, Oct 1, 2021 at 4:41 PM Ilia Mirkin =
&lt;<a href=3D"mailto:imirkin@alum.mit.edu" target=3D"_blank">imirkin@alum.=
mit.edu</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"=
margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-lef=
t:1ex">On Fri, Oct 1, 2021 at 4:29 PM Jerry Geis &lt;<a href=3D"mailto:jerr=
y.geis@gmail.com" target=3D"_blank">jerry.geis@gmail.com</a>&gt; wrote:<br>
&gt; yes very weird on the sound. Using analog speakers at the moment<br>
&gt; I got no test sound - and no video sound after getting nouveau to run =
correctly ????<br>
&gt; I was playing analog audio before ?<br>
&gt; Does nouveau only do HDMI audio ?<br>
<br>
nouveau only does HDMI(/DP) audio. A different driver will handle a<br>
built-in sound card (e.g. snd_hda_intel). You might want to reach out<br>
to your distro&#39;s support channels to better diagnose what&#39;s going o=
n.<br>
Unlikely to have anything to do with nouveau. More likely that you had<br>
added &quot;acpi=3Doff&quot; to hack around this. Or perhaps pci=3Dnomsi fo=
r a<br>
broken audio adapter? Don&#39;t know. dmesg (not to mention google) will<br=
>
have the answers.<br>
<br>
=C2=A0 -ilia<br></blockquote><div><br></div><div>Thanks - I switched monito=
rs - using a 4K monitor with buildin=C2=A0sound.</div><div>Sound works now-=
 great.=C2=A0 but the screen is not in 4K .=C2=A0<br></div><div>Does Nouvea=
u not do 4K - 3840x2160?</div><div><br></div><div>Thanks!=C2=A0</div><div><=
br></div><div>Jerry</div></div></div></blockquote><div><br></div><div>HA! I=
 just dawned on my the OLD GT218 does not do 4K... The 4K display looks lik=
e a strched for some reason - I thought it would jus tbe the normal 1080p.<=
/div><div>Anyway - got it working - thanks to all the suggestions!</div><di=
v><br></div><div>Jerry</div><div>=C2=A0</div></div></div>

--00000000000036d8d505cd50caa5--
