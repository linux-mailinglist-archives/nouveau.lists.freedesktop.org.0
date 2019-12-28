Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FB2C12BC21
	for <lists+nouveau@lfdr.de>; Sat, 28 Dec 2019 02:31:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE7056E0DE;
	Sat, 28 Dec 2019 01:31:45 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-vs1-f50.google.com (mail-vs1-f50.google.com
 [209.85.217.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 99DA66E0DE
 for <nouveau@lists.freedesktop.org>; Sat, 28 Dec 2019 01:31:44 +0000 (UTC)
Received: by mail-vs1-f50.google.com with SMTP id y125so7325422vsb.6
 for <nouveau@lists.freedesktop.org>; Fri, 27 Dec 2019 17:31:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=F9k7kWQlk1jQaC+jDE4uwPUIKSfTu7XOAdYQzECgJTo=;
 b=nLPrFRwUVnE8va3vmVkST/oh1WLaqd35pDMHKOP3qZv9D0LK52Z9HNLwewIZa8N5Ie
 OMQxU89Q4405qSbS3e3vMXQvJP5w9HEb04R0a90J2kwDb3IOxPIwtrsFbTb0BwaCjjpK
 fXyht5g/WFga5z7rq99AfYCMoz9vzNBe7dZSBgp33X6PCXvgFxdE235svy7V4oy4t7Mf
 aA5tNBCHJMJnJHBKr17j/oQ7rkULFeaJ8daQ9708oqUOSvHcnHvZMHH9RRQQLeB/OUPZ
 ZOGsLLTG8D/7XeOiqLjQheFyHdz23XAeikto8e4h9trUFyunnzG3hVDGLjFgMY8051HB
 /y1w==
X-Gm-Message-State: APjAAAXbU4Jp0+qiy3GcQw5J4qrx6K8pE0KUCXbIP/JzMUqVzt35Kklk
 zw6OxzV4aGTfaclATTJUIfg/CMyMDzBxFg71BbU=
X-Google-Smtp-Source: APXvYqzakZqJhKHYBPTiATp+upS43LQZ23FFkLcs6RsPOeHB0enTgCX+pWUzr1dWn1nLOg/RCM/APqAbgbgmVzJ8xmg=
X-Received: by 2002:a05:6102:3024:: with SMTP id
 v4mr29376597vsa.220.1577496703609; 
 Fri, 27 Dec 2019 17:31:43 -0800 (PST)
MIME-Version: 1.0
References: <BN6PR01MB2337BD8F279BCB99674C4EE0E3250@BN6PR01MB2337.prod.exchangelabs.com>
In-Reply-To: <BN6PR01MB2337BD8F279BCB99674C4EE0E3250@BN6PR01MB2337.prod.exchangelabs.com>
From: Ilia Mirkin <imirkin@alum.mit.edu>
Date: Fri, 27 Dec 2019 20:31:32 -0500
Message-ID: <CAKb7UvhA7NqOVa0--v4paV-5uAzJ6DN3mO0XYNjXUxVJdQs1xA@mail.gmail.com>
To: Jairo Quintanilla <jairo_6875@hotmail.com>
Subject: Re: [Nouveau] Flickering Nvidia GeForce GT210
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
Cc: "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>
Content-Type: multipart/mixed; boundary="===============1010843622=="
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

--===============1010843622==
Content-Type: multipart/alternative; boundary="000000000000a7310c059ab9929c"

--000000000000a7310c059ab9929c
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

That's rather odd ... a reclock should not persist across a reboot.

On Fri, Dec 27, 2019 at 7:51 PM Jairo Quintanilla <jairo_6875@hotmail.com>
wrote:

> Hi again.
>
> I made echo 0f > /sys/kernel/debug/dri/0/pstate and then reboot the
> system.
>
> And, flickering disappear completely, I just have some tearing when
> something it's moving a lot in videos.
>
> Definitely it was the solution for flickering issue.
>
> Have a nice day =F0=9F=98=8A
>
> Enviado desde mi Samsung Mobile de Claro
>
>
> -------- Original message --------
> From: Ilia Mirkin <imirkin@alum.mit.edu>
> Date: 12/27/19 7:50 AM (GMT-06:00)
> To: Jairo Quintanilla <jairo_6875@hotmail.com>
> Cc: nouveau@lists.freedesktop.org
> Subject: Re: [Nouveau] Flickering Nvidia GeForce GT210
>
> Hm, this kind of "incomplete fill" flicker could be due to something
> just not being able to keep up. But you may be in luck - nouveau may
> support reclocking on your GPU -- check the contents
> /sys/kernel/debug/dri/0/pstate for the various options, and echo e.g.
> "0f" or "22" or whatever the desired level is listed as back into that
> file (note - AC =3D "current", not an actual level).
>
> On Fri, Dec 27, 2019 at 8:45 AM Jairo Quintanilla
> <jairo_6875@hotmail.com> wrote:
> >
> > The issue is like this.:
> >
> > https://youtu.be/4YQSL3xWrJA
> >
> > I have some tearing and sometimes flickering, just screen off and on
> suddenly in shorts periods of time.
> >
> > I have this problem with videos in YouTube using Firefox, and local
> videos using vlc and MPlayer for example.
> >
> >
> > Enviado desde mi Samsung Mobile de Claro
> >
> >
> >
> > -------- Original message --------
> > From: Ilia Mirkin <imirkin@alum.mit.edu>
> > Date: 12/27/19 7:40 AM (GMT-06:00)
> > To: Jairo Quintanilla <jairo_6875@hotmail.com>
> > Cc: nouveau@lists.freedesktop.org
> > Subject: Re: [Nouveau] Flickering Nvidia GeForce GT210
> >
> > And when you say "flickering", do you really mean some kind of
> > decoding failure with blocks being off or whatever? Or maybe a frame
> > ordering issue (where old frames appear instead of new ones
> > sometimes)? Or just regular tearing?
> >
> > Is your video player using GL output, VDPAU output (and vdpau
> > decoding), or Xv? (What video player are you using?)
> >
> > On Fri, Dec 27, 2019 at 8:33 AM Jairo Quintanilla
> > <jairo_6875@hotmail.com> wrote:
> > >
> > > I'm using xorg and nouveau, not modesetting.
> > >
> > >
> > > Thanks for your response.
> > >
> > >
> > >
> > > Enviado desde mi Samsung Mobile de Claro
> > >
> > >
> > >
> > > -------- Original message --------
> > > From: Ilia Mirkin <imirkin@alum.mit.edu>
> > > Date: 12/27/19 7:31 AM (GMT-06:00)
> > > To: Jairo Quintanilla <jairo_6875@hotmail.com>
> > > Cc: nouveau@lists.freedesktop.org
> > > Subject: Re: [Nouveau] Flickering Nvidia GeForce GT210
> > >
> > > Are you on Xorg or wayland of some sort? If on Xorg, which DDX are yo=
u
> > > using -- nouveau or modesetting?
> > >
> > > On Fri, Dec 27, 2019 at 3:13 AM Jairo Quintanilla
> > > <jairo_6875@hotmail.com> wrote:
> > > >
> > > > Hi mates,
> > > >
> > > > First to all thanks for your help.
> > > >
> > > > I've installed Nouveau driver for my Nvidia GeForce GT210 using
> Archlinux, but I have some flickering issues when playing videos, only in
> the video windows.
> > > >
> > > > Sometimes I can see some flickering when scrolling.
> > > >
> > > > Please help. I don't know how to fix it.
> > > >
> > > >
> > > > Atte. Jairo Quintanilla
> > > > _______________________________________________
> > > > Nouveau mailing list
> > > > Nouveau@lists.freedesktop.org
> > > > https://lists.freedesktop.org/mailman/listinfo/nouveau
>

--000000000000a7310c059ab9929c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">That&#39;s rather odd ... a reclock should=C2=A0not persis=
t across a reboot.</div><br><div class=3D"gmail_quote"><div dir=3D"ltr" cla=
ss=3D"gmail_attr">On Fri, Dec 27, 2019 at 7:51 PM Jairo Quintanilla &lt;<a =
href=3D"mailto:jairo_6875@hotmail.com">jairo_6875@hotmail.com</a>&gt; wrote=
:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.=
8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">



<div dir=3D"auto">
<div dir=3D"auto">Hi again.=C2=A0</div>
<div dir=3D"auto"><br>
</div>
<div dir=3D"auto">I made echo 0f &gt; /sys/kernel/debug/dri/0/pstate and th=
en reboot the system.=C2=A0</div>
<div dir=3D"auto"><br>
</div>
<div dir=3D"auto">And, flickering disappear completely, I just have some te=
aring when something it&#39;s moving a lot in videos.=C2=A0</div>
<div dir=3D"auto"><br>
</div>
<div dir=3D"auto">Definitely it was the solution for flickering issue.=C2=
=A0</div>
<div dir=3D"auto"><br>
</div>
<div dir=3D"auto">Have a nice day =F0=9F=98=8A</div>
<div dir=3D"auto"><br>
</div>
<div id=3D"gmail-m_-8732262085506877971composer_signature" dir=3D"auto">
<div style=3D"font-size:85%;color:rgb(87,87,87)" dir=3D"auto">Enviado desde=
 mi Samsung Mobile de Claro</div>
</div>
<div dir=3D"auto"><br>
</div>
<div><br>
</div>
<div style=3D"font-size:100%;color:rgb(0,0,0)" dir=3D"auto">
<div>-------- Original message --------</div>
<div>From: Ilia Mirkin &lt;<a href=3D"mailto:imirkin@alum.mit.edu" target=
=3D"_blank">imirkin@alum.mit.edu</a>&gt; </div>
<div>Date: 12/27/19 7:50 AM (GMT-06:00) </div>
<div>To: Jairo Quintanilla &lt;<a href=3D"mailto:jairo_6875@hotmail.com" ta=
rget=3D"_blank">jairo_6875@hotmail.com</a>&gt; </div>
<div>Cc: <a href=3D"mailto:nouveau@lists.freedesktop.org" target=3D"_blank"=
>nouveau@lists.freedesktop.org</a> </div>
<div>Subject: Re: [Nouveau] Flickering Nvidia GeForce GT210 </div>
<div><br>
</div>
</div>
<font size=3D"2"><span style=3D"font-size:11pt">
<div>Hm, this kind of &quot;incomplete fill&quot; flicker could be due to s=
omething<br>
just not being able to keep up. But you may be in luck - nouveau may<br>
support reclocking on your GPU -- check the contents<br>
/sys/kernel/debug/dri/0/pstate for the various options, and echo e.g.<br>
&quot;0f&quot; or &quot;22&quot; or whatever the desired level is listed as=
 back into that<br>
file (note - AC =3D &quot;current&quot;, not an actual level).<br>
<br>
On Fri, Dec 27, 2019 at 8:45 AM Jairo Quintanilla<br>
&lt;<a href=3D"mailto:jairo_6875@hotmail.com" target=3D"_blank">jairo_6875@=
hotmail.com</a>&gt; wrote:<br>
&gt;<br>
&gt; The issue is like this.:<br>
&gt;<br>
&gt; <a href=3D"https://youtu.be/4YQSL3xWrJA" target=3D"_blank">https://you=
tu.be/4YQSL3xWrJA</a><br>
&gt;<br>
&gt; I have some tearing and sometimes flickering, just screen off and on s=
uddenly in shorts periods of time.<br>
&gt;<br>
&gt; I have this problem with videos in YouTube using Firefox, and local vi=
deos using vlc and MPlayer for example.<br>
&gt;<br>
&gt;<br>
&gt; Enviado desde mi Samsung Mobile de Claro<br>
&gt;<br>
&gt;<br>
&gt;<br>
&gt; -------- Original message --------<br>
&gt; From: Ilia Mirkin &lt;<a href=3D"mailto:imirkin@alum.mit.edu" target=
=3D"_blank">imirkin@alum.mit.edu</a>&gt;<br>
&gt; Date: 12/27/19 7:40 AM (GMT-06:00)<br>
&gt; To: Jairo Quintanilla &lt;<a href=3D"mailto:jairo_6875@hotmail.com" ta=
rget=3D"_blank">jairo_6875@hotmail.com</a>&gt;<br>
&gt; Cc: <a href=3D"mailto:nouveau@lists.freedesktop.org" target=3D"_blank"=
>nouveau@lists.freedesktop.org</a><br>
&gt; Subject: Re: [Nouveau] Flickering Nvidia GeForce GT210<br>
&gt;<br>
&gt; And when you say &quot;flickering&quot;, do you really mean some kind =
of<br>
&gt; decoding failure with blocks being off or whatever? Or maybe a frame<b=
r>
&gt; ordering issue (where old frames appear instead of new ones<br>
&gt; sometimes)? Or just regular tearing?<br>
&gt;<br>
&gt; Is your video player using GL output, VDPAU output (and vdpau<br>
&gt; decoding), or Xv? (What video player are you using?)<br>
&gt;<br>
&gt; On Fri, Dec 27, 2019 at 8:33 AM Jairo Quintanilla<br>
&gt; &lt;<a href=3D"mailto:jairo_6875@hotmail.com" target=3D"_blank">jairo_=
6875@hotmail.com</a>&gt; wrote:<br>
&gt; &gt;<br>
&gt; &gt; I&#39;m using xorg and nouveau, not modesetting.<br>
&gt; &gt;<br>
&gt; &gt;<br>
&gt; &gt; Thanks for your response.<br>
&gt; &gt;<br>
&gt; &gt;<br>
&gt; &gt;<br>
&gt; &gt; Enviado desde mi Samsung Mobile de Claro<br>
&gt; &gt;<br>
&gt; &gt;<br>
&gt; &gt;<br>
&gt; &gt; -------- Original message --------<br>
&gt; &gt; From: Ilia Mirkin &lt;<a href=3D"mailto:imirkin@alum.mit.edu" tar=
get=3D"_blank">imirkin@alum.mit.edu</a>&gt;<br>
&gt; &gt; Date: 12/27/19 7:31 AM (GMT-06:00)<br>
&gt; &gt; To: Jairo Quintanilla &lt;<a href=3D"mailto:jairo_6875@hotmail.co=
m" target=3D"_blank">jairo_6875@hotmail.com</a>&gt;<br>
&gt; &gt; Cc: <a href=3D"mailto:nouveau@lists.freedesktop.org" target=3D"_b=
lank">nouveau@lists.freedesktop.org</a><br>
&gt; &gt; Subject: Re: [Nouveau] Flickering Nvidia GeForce GT210<br>
&gt; &gt;<br>
&gt; &gt; Are you on Xorg or wayland of some sort? If on Xorg, which DDX ar=
e you<br>
&gt; &gt; using -- nouveau or modesetting?<br>
&gt; &gt;<br>
&gt; &gt; On Fri, Dec 27, 2019 at 3:13 AM Jairo Quintanilla<br>
&gt; &gt; &lt;<a href=3D"mailto:jairo_6875@hotmail.com" target=3D"_blank">j=
airo_6875@hotmail.com</a>&gt; wrote:<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; Hi mates,<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; First to all thanks for your help.<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; I&#39;ve installed Nouveau driver for my Nvidia GeForce GT21=
0 using Archlinux, but I have some flickering issues when playing videos, o=
nly in the video windows.<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; Sometimes I can see some flickering when scrolling.<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; Please help. I don&#39;t know how to fix it.<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; Atte. Jairo Quintanilla<br>
&gt; &gt; &gt; _______________________________________________<br>
&gt; &gt; &gt; Nouveau mailing list<br>
&gt; &gt; &gt; <a href=3D"mailto:Nouveau@lists.freedesktop.org" target=3D"_=
blank">Nouveau@lists.freedesktop.org</a><br>
&gt; &gt; &gt; <a href=3D"https://lists.freedesktop.org/mailman/listinfo/no=
uveau" target=3D"_blank">
https://lists.freedesktop.org/mailman/listinfo/nouveau</a><br>
</div>
</span></font>
</div>

</blockquote></div>

--000000000000a7310c059ab9929c--

--===============1010843622==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1010843622==--
