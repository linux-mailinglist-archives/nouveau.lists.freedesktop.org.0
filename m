Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E796537A73
	for <lists+nouveau@lfdr.de>; Mon, 30 May 2022 14:13:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C721110E5B6;
	Mon, 30 May 2022 12:13:05 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-oa1-x2a.google.com (mail-oa1-x2a.google.com
 [IPv6:2001:4860:4864:20::2a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F0C7C10E5B6
 for <nouveau@lists.freedesktop.org>; Mon, 30 May 2022 12:13:04 +0000 (UTC)
Received: by mail-oa1-x2a.google.com with SMTP id
 586e51a60fabf-e5e433d66dso14075502fac.5
 for <nouveau@lists.freedesktop.org>; Mon, 30 May 2022 05:13:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=8UuyvndC+HkzsbsMArPTaZSuzI4BZ6qzhhsd1KdSUy0=;
 b=XgIUwCahcjWdw/8aGtdeliphPo06Cpu7zQ50IpLzks04k47STOkGm/tqu80nlkh5Ar
 Mz3bunAZh60I8g4HSPXIANeHPFK2vrN8JOrkir2IfU/e4F2/XgRoEwYHN9wH8Kkqs7wC
 JLNvqOTLa2BfowDeUyu4t14cnj2VPCZsJjIDeVwxEkW1aanHO/kGNTTh0bfCMz2JGdlw
 sbDzKqA9FZ0lTPZkewSfMHNkNGaO1pNpeuHEwitc39QVc/W1ULw+1bfuiSNF2fOpqgSg
 vPFs2oB2NCaPTKlwMzgJuuSQMT3nDaNpwJyyJ0l1+VTUBxzC+NWDj87HEUNjtwALaA1Y
 yLxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=8UuyvndC+HkzsbsMArPTaZSuzI4BZ6qzhhsd1KdSUy0=;
 b=qZy6EPWqP4DXk/NWnYtYaxNpE55R0S/3bZEeA0QMcupEEnGhSEqlRGjBSuUaPPSwme
 zQpnMRxkBLvfOb4vty7+lTL45XrzpzhPaaRJWAVLGaQpYb+ud3PpMKL2HQ9JvrkxTq7I
 FMotSmBkYr2koDoRCMIGoAC6/I6sF2FrW7qHVtP/npf9aG8SMuOAZi93HqdT9OB8wskl
 wASL2IW/acRBD+kgRCG2RMEiBu+AmKOjBGw4XDX9uKL1+0zIF7EJ2BzWgnDUy80aITpV
 evU7RzIyDCf3rWRfEqV12LOZUg3uLNYDGkGsH3vwvihp6UY97sGsiWV5BdxIMe/7/h0v
 r2PQ==
X-Gm-Message-State: AOAM532OESaCT0qCpnNK2x6C9Ta2kpNuVmNesnf2v238s6HdsCpoL/gX
 LguTVjd/1qsxC6Z5sX8YZDfyRgk0n1rEOAq9wU8=
X-Google-Smtp-Source: ABdhPJxjPdwURZEQHhz3/T+bNPi+R+VCHDWbepA4Zyl5rQD4cdFCL27A7Q3vE/sKHp2knnZXAFhN3QN/lyEEGhmaqU8=
X-Received: by 2002:a05:6870:a792:b0:f3:1eca:5ba6 with SMTP id
 x18-20020a056870a79200b000f31eca5ba6mr3970392oao.212.1653912784177; Mon, 30
 May 2022 05:13:04 -0700 (PDT)
MIME-Version: 1.0
References: <CAPmk3hBMuFo9ebX3=rwPqp9tQnPrF9J67LOdxn7QxGry-XVC-Q@mail.gmail.com>
 <CAKb7Uvi-bXQh5Xb7qvOMrQj4VJTB_+PLgXZ69AY5OA0+RkX=xA@mail.gmail.com>
In-Reply-To: <CAKb7Uvi-bXQh5Xb7qvOMrQj4VJTB_+PLgXZ69AY5OA0+RkX=xA@mail.gmail.com>
From: Joe <joe.on.list@gmail.com>
Date: Mon, 30 May 2022 14:12:54 +0200
Message-ID: <CAPmk3hDgfuObxEfLnNygp97wWjKRX73-x-6LLbzXqqEF5W+feQ@mail.gmail.com>
To: Ilia Mirkin <imirkin@alum.mit.edu>
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Nouveau] Hardware decoding in video playback with Nvidia GT
 218 (NVA8)
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
Cc: nouveau <nouveau@lists.freedesktop.org>
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

First of all really thanks for your quick reply!
I followed your suggests:
----------------------------------------------------------
$ cat /etc/X11/xorg.conf.d/20-nouveau.conf
Section "Device"
        Identifier "Nvidia card"
        Driver "nouveau"
        Option   "DRI" "3"
EndSection
----------------

After rebooting, I test various ways, by using mpv, with -vo=vdpau
-hwdec=vdpau",
using mplayer string you suggested in your link:

mplayer -vo vdpau -vc
ffmpeg12vdpau,ffwmv3vdpau,ffvc1vdpau,ffh264vdpau,ffodivxvdpau, <file>

But without luck...
With Option "DRI" "3", I also noticed a worse response during playback, video
colors not proper and after a bit it is blocked. I can't close mplayer window,
after pressing "q" whole system results crashed and have to hard power off
for rebooting again.

If you need more details about video file format used to test please
let me know,
anyway I tried with a 1080p video and 50 FPS, so that it should be a
bit lighter to
decode and manage by the low budget chip of my card.

I also would ask for a question: in your testing experience are you used same
GPU of mine GT218 (see details in my previous message) ?
Is it known it should be working on hardware video decoding with
nouveau drivers?

If some other tests or some involved software recompile could be solve
this issue,
I'm ready to follow your instructions for what are my skills (poor
skills!  ;) ).
Otherwise I'll give up and re-switch to nvidia closed drivers.

Thanks again!

On Mon, May 30, 2022 at 1:26 AM Ilia Mirkin <imirkin@alum.mit.edu> wrote:
>
> Hi Joe,
>
> On Sun, May 29, 2022 at 6:58 PM Joe <joe.on.list@gmail.com> wrote:
> >
> > Hi all, I'm trying to make running hardware acceleration decoding on
> > my old GeForce 210 (AKA GT-218, or NVA8 / NV-50 Tesla family).
> > ----------------------------------
> > 02:00.0 VGA compatible controller [0300]: NVIDIA Corporation GT218
> > [GeForce 210] [10de:0a65] (rev a2)
> > ----------------------------------
> > [ ... ]
> >
> > But when I touch something, for instance "f" to enlarge to fullscreen,
> > or "q" to quit MPV...
> > Surprise!
> >
> > My system freeze, nothing work again, just the mouse cursor can still
> > be moved around.
> >
> > [ ... ]
> >
> > I'd like to use open drivers, but I'd like to take advantage of
> > hardware decoding too, so that my CPU rests as quiet and fresh as
> > possible. Is there some other suggest to configure some other aspect
> > and try to achieve my scope?
> > Or my tests are all I can do?
> > So for hwdec is better to switch back to closed source nvidia driver
> > legacy 340.108 ?
>
> Proprietary driver will definitely work better for hwdec than nouveau.
> Forgetting about any stability/performance issues, there are some
> reference frame ordering issues in H.264 decoding that were never
> addressed. This leads to occasional corruption in some videos.
>
> FWIW I've mostly tested with mplayer, and I didn't run into problems
> there. There should be instructions on using mplayer at
> https://nouveau.freedesktop.org/VideoAcceleration.html. The thing you
> esp want to avoid is using VDPAU + GL in the same process -- so things
> like "-vo vdpau" are much more likely to work than "-vo gpu" or "-vo
> gl". You can try enabling DRI3 -- perhaps something broke in the DRI2
> paths. You can add
>
> Option "DRI" "3"
>
> into the Driver section of the xorg.conf to expose it. It's not on by
> default because there are some annoying corner cases that some window
> managers run into with it (KDE as I recall).
>
> I'm also not sure why VA-API is corrupted for you, it has worked in
> the past. But it gets a lot of changes only reviewed by AMD
> developers, so it can get broken pretty easily with AMD-specific
> assumptions which don't hold on NVIDIA. I suspect it should be easy to
> fix by someone who is interested in investigating -- probably a bisect
> to sort out what broke it, and then revert or get the person who wrote
> it to fix it.
>
> Cheers,
>
>   -ilia
