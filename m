Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B8A19FF641
	for <lists+nouveau@lfdr.de>; Thu,  2 Jan 2025 06:31:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D98C10E225;
	Thu,  2 Jan 2025 05:31:00 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-vs1-f51.google.com (mail-vs1-f51.google.com
 [209.85.217.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 515E910E225
 for <nouveau@lists.freedesktop.org>; Thu,  2 Jan 2025 05:30:59 +0000 (UTC)
Received: by mail-vs1-f51.google.com with SMTP id
 ada2fe7eead31-4b1279ca1d2so2873657137.3
 for <nouveau@lists.freedesktop.org>; Wed, 01 Jan 2025 21:30:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1735795858; x=1736400658;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=blXXO4boyxl5Y+c73ECUUDlTS0pPo0SpTIouH6CJAQ0=;
 b=vRc/se2NObz+7QotF1zOfyFv8BeEEfp7ccD+hSm5WZntsJ0jlzKOTOiL2yOIwZIoac
 1nMnT+WX5zSzDpve2WojpfJl9jf9IMHz+DHqDIE0a7FmPLuqykjECniP/inxY8fK93Ry
 LJOiulM78WEqIvfDUgVd8EiSxJAdWu3vTPdVS0Fh3yvffrJz8zED9QK2Jo0co2GytoPL
 uPpeU3BjcPc3BXyeBagJJNVaA5ASBxv52aWcOB8SwQkVzHizkm2iL4bY51Jgg9Po+U1e
 CoLm6Co4uEyzok3CkltHaEcDKI21g0eEeGRGKUYQxirtQHbHPuh0xya/4fSmXDjJ2Tgu
 EBAA==
X-Gm-Message-State: AOJu0YzQViuGnzWX8G8wZyxsuCjk7yHGZYVJYLc46a+/n3JTgpRprN4i
 rNXhqWLWnhICv5sZ5YvSEeQ2nVt+XtnSXUOLI9m4IsnKUn2vJf1MnIU9iWlqQgjiyj5AMJL8QCV
 e14U6vDEDHYNq5Ksg9IuW3Vc2jb0=
X-Gm-Gg: ASbGnctVpe4sgu1cg+PLJUVt1XNaoSvcclRz5VNKED3MhSGDHKaFBegdtB+0VPLi4oM
 kSV/Er7V9N/nj6N/E9KHjQ1fFZf0Z1hZuqwwb6c260Qd5XhdlZchRamNJ93f/DufeWhZrrbu1
X-Google-Smtp-Source: AGHT+IGh5HcURffZb2Kmp2nLWF4Dq7KOOfpWVRAX+kbiAtBijQzZ1L/kijuo4wQrenvkEnCOrbB6oiH2O8oApI9JGMQ=
X-Received: by 2002:a05:6102:d8c:b0:4b2:48ef:3cf2 with SMTP id
 ada2fe7eead31-4b2cc48ca6bmr33533364137.25.1735795858318; Wed, 01 Jan 2025
 21:30:58 -0800 (PST)
MIME-Version: 1.0
References: <02ED58A8-2A5D-4FF3-AC3A-AC14077F5F7F@meddatainc.com>
In-Reply-To: <02ED58A8-2A5D-4FF3-AC3A-AC14077F5F7F@meddatainc.com>
From: Ilia Mirkin <imirkin@alum.mit.edu>
Date: Thu, 2 Jan 2025 00:30:47 -0500
Message-ID: <CAKb7UvikzZZ5q+UwuUQPQvQQn8xHGK9=r2ri6YrqMRnjH85mxg@mail.gmail.com>
Subject: Re: Laptop, nouveau and external monitor
To: H <agents@meddatainc.com>
Cc: Nouveau Mailing List <nouveau@lists.freedesktop.org>
Content-Type: multipart/alternative; boundary="00000000000089ac62062ab277f9"
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

--00000000000089ac62062ab277f9
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 1, 2025 at 9:57=E2=80=AFPM H <agents@meddatainc.com> wrote:

> Running the latest version of Rocky Linux 9 fully updated and Mate on a
> Dell Inspiron 7570 laptop with a UHD display, i.e. 3840 x 2160 pixels. I
> would like to attach two external monitors and initially experimented wit=
h
> a Dell dock model 3100 and the latest version of the DisplayLink and evdi
> drivers. However, although the Mate display applet shows the correct
> resolution for the laptop display itself and for the external monitor whi=
ch
> is running at 1920 x 1080 pixels, the resolution on the second, external
> display is more like 640 x 480 pixels.
>
> While I initially thought this was due to a bug in the DisplayLink/evdi
> drivers, I see the same issue when I connect the monitor directly to the
> HDMI output on the laptop itself, ie. DisplayLink/evdi are presumably not
> involved although they are installed, nor is the dock of course.
>
> I just discovered running xrandr --listmonitors that, while the internal
> laptop monitor is labeled eDP-1, xrandr identifies the external monitor a=
s
> using DP-1 although it uses the laptop HDMI-connector. Further, while mat=
e
> hardware display monitor also identifies it as using DP-1 - possibly base=
d
> on xrandr output - the monitor itself tells me it is connected using its
> HDMI1 connector. xrandr does report the correct display resolution, thoug=
h.
>
> Thus, it looks like xrandr/nouveau misreads the configuration feeding it
> to mate. I just updated the laptop BIOS to the very latest version and sa=
w
> no difference.
>
> I am using an HDMI-HDMI cable with no adapters. I have tried both booting
> with the external monitor already attached and attaching/reattaching it
> later. The monitor is an Acer S230HL monitor.
>
> I am using the nouveau driver and inxi reports the presence of both Intel
> UHD Graphics 620 and Nvidia GM108M (GeForce 940MX).
>
> The kernel is:
> Linux 5.14.0-503.15.1.el9_5.x86_64 #1 SMP PREEMPT_DYNAMIC Tue Nov 26
> 17:24:29 UTC 2024 x86_64 x86_64 x86_64 GNU/Linux
>
> Could this be an nouveau bug (I am running X11 and not Wayland)? How
> should I troubleshoot it?
>

No, this could not be a nouveau bug. I'm fairly sure that the GM108 is a
pure accelerator, so your screen is being connected to not-the-nvidia board
(either Intel or the USB DisplayLink thing).

Your Xorg log should generally have more useful info.

Cheers,

  -ilia

--00000000000089ac62062ab277f9
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Wed, Jan 1, 2025 at 9:57=E2=80=AFPM H =
&lt;<a href=3D"mailto:agents@meddatainc.com">agents@meddatainc.com</a>&gt; =
wrote:</div><div class=3D"gmail_quote gmail_quote_container"><blockquote cl=
ass=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid=
 rgb(204,204,204);padding-left:1ex">Running the latest version of Rocky Lin=
ux 9 fully updated and Mate on a Dell Inspiron 7570 laptop with a UHD displ=
ay, i.e. 3840 x 2160 pixels. I would like to attach two external monitors a=
nd initially experimented with a Dell dock model 3100 and the latest versio=
n of the DisplayLink and evdi drivers. However, although the Mate display a=
pplet shows the correct resolution for the laptop display itself and for th=
e external monitor which is running at 1920 x 1080 pixels, the resolution o=
n the second, external display is more like 640 x 480 pixels.<br>
<br>
While I initially thought this was due to a bug in the DisplayLink/evdi dri=
vers, I see the same issue when I connect the monitor directly to the HDMI =
output on the laptop itself, ie. DisplayLink/evdi are presumably not involv=
ed although they are installed, nor is the dock of course.<br>
<br>
I just discovered running xrandr --listmonitors that, while the internal la=
ptop monitor is labeled eDP-1, xrandr identifies the external monitor as us=
ing DP-1 although it uses the laptop HDMI-connector. Further, while mate ha=
rdware display monitor also identifies it as using DP-1 - possibly based on=
 xrandr output - the monitor itself tells me it is connected using its HDMI=
1 connector. xrandr does report the correct display resolution, though.<br>
<br>
Thus, it looks like xrandr/nouveau misreads the configuration feeding it to=
 mate. I just updated the laptop BIOS to the very latest version and saw no=
 difference.<br>
<br>
I am using an HDMI-HDMI cable with no adapters. I have tried both booting w=
ith the external monitor already attached and attaching/reattaching it late=
r. The monitor is an Acer S230HL monitor.<br>
<br>
I am using the nouveau driver and inxi reports the presence of both Intel U=
HD Graphics 620 and Nvidia GM108M (GeForce 940MX).<br>
<br>
The kernel is:<br>
Linux 5.14.0-503.15.1.el9_5.x86_64 #1 SMP PREEMPT_DYNAMIC Tue Nov 26 17:24:=
29 UTC 2024 x86_64 x86_64 x86_64 GNU/Linux<br>
<br>
Could this be an nouveau bug (I am running X11 and not Wayland)? How should=
 I troubleshoot it?<br></blockquote><div><br></div><div>No, this could not =
be a nouveau bug. I&#39;m fairly sure that the GM108 is a pure accelerator,=
 so your screen is being connected to not-the-nvidia board (either Intel or=
 the USB DisplayLink thing).</div><div><br></div><div>Your Xorg log should =
generally have more useful info.</div><div><br></div><div>Cheers,</div><div=
><br></div><div>=C2=A0 -ilia</div></div></div>

--00000000000089ac62062ab277f9--
