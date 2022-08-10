Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B186858F34E
	for <lists+nouveau@lfdr.de>; Wed, 10 Aug 2022 21:44:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C3C0112638;
	Wed, 10 Aug 2022 19:44:50 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F2EFE112638
 for <nouveau@lists.freedesktop.org>; Wed, 10 Aug 2022 19:44:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1660160682;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=5uURM5RVClVdgYkUwaTQs9EA4eW/bn0a77bicPB71ok=;
 b=M/3gXY9RFEU7gO/KoOMPzO697p6kuXcGCnUK4P54qjP1UV3DqrIFB5kMCa8AQQbRbC98he
 VdB3Hyt+F+bqpHMCcfvG/X4/R5g921TBTfjzGO1i/2XQxR65Tae3X00iuJkcDKjywPQJTU
 ASNmoLy+pshXqD5952KaqZ7GB7e3ad4=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-26-X958l3JEMlS-IsG8cUyK9w-1; Wed, 10 Aug 2022 15:44:40 -0400
X-MC-Unique: X958l3JEMlS-IsG8cUyK9w-1
Received: by mail-qt1-f199.google.com with SMTP id
 q8-20020ac87348000000b003435f7f4d4bso1104015qtp.10
 for <nouveau@lists.freedesktop.org>; Wed, 10 Aug 2022 12:44:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=5uURM5RVClVdgYkUwaTQs9EA4eW/bn0a77bicPB71ok=;
 b=iFu5p0Kt+O6hC6g1hdQcZmjHdC7vbtwtIOZH1REQKjbIbK2IrVercZsWvKONgWLRgb
 2HMgr6OapbkEp3KvDClzochgrnI2g4KncQCjJnTCx2rWkdq/u62WVvssSkc5TRErT8WN
 KWL0xYG8/AEV984aQPp+Tumbclk6Mpv19R40cKWy8f0ME7RQdm76gB6KbvJqnnpNEzA5
 D4KzoXuO+WF5cYKgnUJnH5ggdOtn0DcjS1l9QZEDP87JW5gfB/1U72WbmKB9YQHB0d2y
 FPaUYWa2caQhkhU6eO8lM7+oHibClgwfkfgYb/6m0H4jWE3pdShWCC7L9LEJfHYdPWRu
 vlPg==
X-Gm-Message-State: ACgBeo1LOas56ic3YKtc8GnnPZzNouCq3zzvDC15p6r9YsNXFxjPfVT4
 ecIgtxn+SdORZRsJtpuDXMr7NAhApG0+CEUSRd4A9drRpgAsxrN1q4GtbFg5dKFDp0ctjtKSPu5
 28PsGytEgr7C8L+qpGy40CXBzxCZrsIfkEmNipAqJsA==
X-Received: by 2002:a05:6214:2588:b0:477:22bd:e1e6 with SMTP id
 fq8-20020a056214258800b0047722bde1e6mr25088135qvb.105.1660160680373; 
 Wed, 10 Aug 2022 12:44:40 -0700 (PDT)
X-Google-Smtp-Source: AA6agR6TRQ8IAsvlNHmHemMEOzyutzYlaUXmQ81j6BwNx07toLRsXJZUvcaveD8g1sBmZsXLbBJvzV97qMXPMMyHaqU=
X-Received: by 2002:a05:6214:2588:b0:477:22bd:e1e6 with SMTP id
 fq8-20020a056214258800b0047722bde1e6mr25088113qvb.105.1660160679997; Wed, 10
 Aug 2022 12:44:39 -0700 (PDT)
MIME-Version: 1.0
References: <908f64116d46466da1aef164ec30f939@di.ku.dk>
In-Reply-To: <908f64116d46466da1aef164ec30f939@di.ku.dk>
From: Karol Herbst <kherbst@redhat.com>
Date: Wed, 10 Aug 2022 21:44:29 +0200
Message-ID: <CACO55tuSGMUP7Bpr+=i78CnHPR7sxZKTAUewADsUhiR5qBhg2w@mail.gmail.com>
To: Klaus Ebbe Grue <grue@di.ku.dk>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="0000000000009a09a005e5e8478d"
Subject: Re: [Nouveau] Blank screen after upgrade Fedora 34/XFCE -> Fedora
 36/XFCE
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
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

--0000000000009a09a005e5e8478d
Content-Type: text/plain; charset="UTF-8"

On Wed, Aug 10, 2022 at 9:04 PM Klaus Ebbe Grue <grue@di.ku.dk> wrote:
>
> Hi nouveau@lists.freedesktop.org,
>
>
> I hope someone on this list can point me in some useful direction
concerning the following problem:
>
>
> After upgrade from Fedora 34/XFCE to Fedora 36/XFCE, I experience a black
screen instead of a login prompt, unless I make a file named
/etc/X11/xorg.conf.d/90-monitor.conf which contains eg
>
>
> Section "Monitor"
>         Identifier "DP-1"
>         Option "PreferredMode" "720x480"
> EndSection
>
> Before the upgrade from Fedora 34 to 36, everything worked if the file
looked like this:
>
> Section "Monitor"
>         Identifier "DP-1"
>         Modeline "3840x2160" 533.25 3840 3888 3920 4000 2160 2163 2168
2222 +hsync -vsync
>         Option "PreferredMode" "3840x2160"
> EndSection
>
> But that does not work on my Fedora 36.
>

did you try not using any custom Xorg config, because I don't see why you
are even trying that?


> I use XFCE instead of Gnome. XFCE seems to use X as opposed to Fedora in
general and Gnome in particular who use Wayland.
>
> If I hand compile the EDID from the screen, I find the following
resolutions: Established timings: 800x600, 800x600, 800x600, 800x600,
832x624, 1024x768, 1024x768, 1024x768, 1280x1024. Standard timings:
1920x1080, 1680x1050, 1440x900, 1280x1024, 1280x960, 1280x720. Detailed
timings: 3840x2160, 2560x1440, 1280x720, 720x480, 720x576, 1920x2160. The
EDID looks fine as far as I can see.
>
> I have tried all standard and detailed timings and three established
timings (boot at runlevel 3, modify 90-monitor.conf, telinit 5, repeat).
All resolutions except 3840x2160, 2560x1440 and 1920x1080 work acceptably.
3840x2160 and 2560x1440 give a black screen and a monitor poweroff.
1920x1080 gives a noisy, psychedelic screen which remotely resembles a
login screen.
>
> If I boot with no 90-monitor.conf at all then /var/log/Xorg.0.log seems
to be in conflict with itself. First, all resolutions including 3840x2160
are recognized and agree with what I got out of reading the EDID. But then
Xorg.0.log says:
>
> [    38.974] (II) modeset(0): Not using default mode "2560x1440" (bad
mode clock/interlace/doublescan)
>
> But 3840x2160 is the default mode. 3840x2160 is the first detailed timing
record. So it seems that first 3840x2160 is recognized, then ignored, then
2560x1440 is frowned upon, then used anyways.
>
> I have attached /var/log/messages and /var/log/Xorg.0.log from a Fedora
36 and a Fedora 34 boot. I do not yet have a kernel log, but I hope I can
get one by doing an ssh into the box after the monitor goes blank.
>
> By the way, when I boot Fedora 36 to runlevel 3 then the monitor switches
to a resolution of 3840x2160 and I get a tiny command line. It is when I
then do telinit 5 that the screen goes blank.
>
>
> In preparation of asking a question on the present list, I have run
through https://nouveau.freedesktop.org/TroubleShooting.html in general and
the section "Are you clear of other kernel drivers that break Nouveau" in
particular. I think I have no other video drivers than Nouveau, but I have
done this:
>
>
> sudo find /usr -type f -iname "*nvidia*" -print > stdout 2>stderr
>
>
> I can see some nvidia stuff in stdout. In particular, I can see a file
named typec_nvidia.ko.xz, and TroubleShooting.html warns about a file named
nvidia.ko. Can anyone on the list tell if there is something suspicious in
the attached search-nvidia-stdout?
>
>
> Cheers,
>
> Klaus
>
>

--0000000000009a09a005e5e8478d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><br>On Wed, Aug 10, 2022 at 9:04 PM Klaus Ebbe Grue &l=
t;<a href=3D"mailto:grue@di.ku.dk">grue@di.ku.dk</a>&gt; wrote:<br>&gt;<br>=
&gt; Hi <a href=3D"mailto:nouveau@lists.freedesktop.org">nouveau@lists.free=
desktop.org</a>,<br>&gt;<br>&gt;<br>&gt; I hope someone on this list can po=
int me in some useful direction concerning the following problem:<br>&gt;<b=
r>&gt;<br>&gt; After upgrade from Fedora 34/XFCE to Fedora 36/XFCE, I exper=
ience a black screen instead of a login prompt, unless I make a file named =
/etc/X11/xorg.conf.d/90-monitor.conf which contains eg<br>&gt;<br>&gt;<br>&=
gt; Section &quot;Monitor&quot;<br>&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 Identif=
ier &quot;DP-1&quot;<br>&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 Option &quot;Prefe=
rredMode&quot; &quot;720x480&quot;<br>&gt; EndSection<br>&gt;<br>&gt; Befor=
e the upgrade from Fedora 34 to 36, everything worked if the file looked li=
ke this:<br>&gt;<br>&gt; Section &quot;Monitor&quot;<br>&gt; =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 Identifier &quot;DP-1&quot;<br>&gt; =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 Modeline &quot;3840x2160&quot; 533.25 3840 3888 3920 4000 2160 2163 216=
8 2222 +hsync -vsync<br>&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 Option &quot;Prefe=
rredMode&quot; &quot;3840x2160&quot;<br>&gt; EndSection<br>&gt;<br>&gt; But=
 that does not work on my Fedora 36.<br>&gt;<div><br></div><div><div class=
=3D"gmail_default" style=3D"font-family:arial,sans-serif">did you try not u=
sing any custom Xorg config, because I don&#39;t see why you are even tryin=
g that?</div><br></div><div><br>&gt; I use XFCE instead of Gnome. XFCE seem=
s to use X as opposed to Fedora in general and Gnome in particular who use =
Wayland.<br>&gt;<br>&gt; If I hand compile the EDID from the screen, I find=
 the following resolutions: Established timings: 800x600, 800x600, 800x600,=
 800x600, 832x624, 1024x768, 1024x768, 1024x768, 1280x1024. Standard timing=
s: 1920x1080, 1680x1050, 1440x900, 1280x1024, 1280x960, 1280x720. Detailed =
timings: 3840x2160, 2560x1440, 1280x720, 720x480, 720x576, 1920x2160. The E=
DID looks fine as far as I can see.<br>&gt;<br>&gt; I have tried all standa=
rd and detailed timings and three established timings (boot at runlevel 3, =
modify 90-monitor.conf, telinit 5, repeat). All resolutions except 3840x216=
0, 2560x1440 and 1920x1080 work acceptably. 3840x2160 and 2560x1440 give a =
black screen and a monitor poweroff. 1920x1080 gives a noisy, psychedelic s=
creen which remotely resembles a login screen.<br>&gt;<br>&gt; If I boot wi=
th no 90-monitor.conf at all then /var/log/Xorg.0.log seems to be in confli=
ct with itself. First, all resolutions including 3840x2160 are recognized a=
nd agree with what I got out of reading the EDID. But then Xorg.0.log says:=
<br>&gt;<br>&gt; [ =C2=A0 =C2=A038.974] (II) modeset(0): Not using default =
mode &quot;2560x1440&quot; (bad mode clock/interlace/doublescan)<br>&gt;<br=
>&gt; But 3840x2160 is the default mode. 3840x2160 is the first detailed ti=
ming record. So it seems that first 3840x2160 is recognized, then ignored, =
then 2560x1440 is frowned upon, then used anyways.<br>&gt;<br>&gt; I have a=
ttached /var/log/messages and /var/log/Xorg.0.log from a Fedora 36 and a Fe=
dora 34 boot. I do not yet have a kernel log, but I hope I can get one by d=
oing an ssh into the box after the monitor goes blank.<br>&gt;<br>&gt; By t=
he way, when I boot Fedora 36 to runlevel 3 then the monitor switches to a =
resolution of 3840x2160 and I get a tiny command line. It is when I then do=
 telinit 5 that the screen goes blank.<br>&gt;<br>&gt;<br>&gt; In preparati=
on of asking a question on the present list, I have run through <a href=3D"=
https://nouveau.freedesktop.org/TroubleShooting.html">https://nouveau.freed=
esktop.org/TroubleShooting.html</a> in general and the section &quot;Are yo=
u clear of other kernel drivers that break Nouveau&quot; in particular. I t=
hink I have no other video drivers than Nouveau, but I have done this:<br>&=
gt;<br>&gt;<br>&gt; sudo find /usr -type f -iname &quot;*nvidia*&quot; -pri=
nt &gt; stdout 2&gt;stderr<br>&gt;<br>&gt;<br>&gt; I can see some nvidia st=
uff in stdout. In particular, I can see a file named typec_nvidia.ko.xz, an=
d TroubleShooting.html warns about a file named nvidia.ko. Can anyone on th=
e list tell if there is something suspicious in the attached search-nvidia-=
stdout?<br>&gt;<br>&gt;<br>&gt; Cheers,<br>&gt;<br>&gt; Klaus<br>&gt;<br>&g=
t;<br></div></div>

--0000000000009a09a005e5e8478d--

