Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 344A512B4F8
	for <lists+nouveau@lfdr.de>; Fri, 27 Dec 2019 14:50:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB2576E44C;
	Fri, 27 Dec 2019 13:50:48 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-vs1-f46.google.com (mail-vs1-f46.google.com
 [209.85.217.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C17B6E44C
 for <nouveau@lists.freedesktop.org>; Fri, 27 Dec 2019 13:50:47 +0000 (UTC)
Received: by mail-vs1-f46.google.com with SMTP id n27so16950111vsa.0
 for <nouveau@lists.freedesktop.org>; Fri, 27 Dec 2019 05:50:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=rB1Ydn9f/aDFTf7ruq3y3yoQt+JfWsyaakihqBf6BEM=;
 b=q0J+JCYPMmm1BKyo1SlRhWTwJuYXkL3qTXGdNW1K2UiYWs5C/WiLvyAX63DQDYWe38
 ibv3VlY1FVseo+6doXNU/3LndTSDX9Q2cojboAPzAX5epmq8QamiqdNGJzaY8wztaD9A
 CA5M4Ug/Dvk6e937HMYvFLvf4vpTHrJKfpK9qbIkWYBhCPJQTdH36bmILJYjHXsg+HUA
 HCLr4vTddtje3G0MjPv45QWv7iHw/wc1NbrFGmXGrnuy3tp+cyqYlDFGDSAP8S+TwrSR
 6mRrV39UTPUX2H/pwOsb+cTxC1mM2vJ6GdM0JJV3MZFRxP/+DM9E0W8Op9SkBoWkXFn/
 pBHA==
X-Gm-Message-State: APjAAAVjc8ugP81VDNhCjjO+wJzIrbFlytO/tMg1SbYjaKkBWfmRhORc
 uWGlILIIAsCPk8TlOxAOM+lFGWiJLhQ4Pshj428=
X-Google-Smtp-Source: APXvYqygdM7HCQjlOQGywAm4Lt9JIaf3mBlZ2U8Vn8oDIX2SUYmzpqJUKczgaGwy0gvBUnubMG1oS5OApm19/WMNTiQ=
X-Received: by 2002:a67:f412:: with SMTP id p18mr27753215vsn.207.1577454646562; 
 Fri, 27 Dec 2019 05:50:46 -0800 (PST)
MIME-Version: 1.0
References: <BN6PR01MB233713E4E456F3C33AF3CAB9E32D0@BN6PR01MB2337.prod.exchangelabs.com>
 <CAKb7UvheYyPgSgkVXxd+U4tQdAA+Zq0hOv1nnmG7cHskA=vEfA@mail.gmail.com>
 <BN6PR01MB2337C1AC4B6AF0AA017057E1E32A0@BN6PR01MB2337.prod.exchangelabs.com>
 <CAKb7Uvi6zZX0y-0sOd2MqSye=ttF+Fb-GiFKsWH_PShOW2GjbA@mail.gmail.com>
 <BN6PR01MB23371E2DF1A84D7FFBCF8993E32A0@BN6PR01MB2337.prod.exchangelabs.com>
In-Reply-To: <BN6PR01MB23371E2DF1A84D7FFBCF8993E32A0@BN6PR01MB2337.prod.exchangelabs.com>
From: Ilia Mirkin <imirkin@alum.mit.edu>
Date: Fri, 27 Dec 2019 08:50:35 -0500
Message-ID: <CAKb7UvhPJs1_0oEuj-W6N9gby9ntnoWNytaJ2RHKcaj-x7Q1zw@mail.gmail.com>
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

Hm, this kind of "incomplete fill" flicker could be due to something
just not being able to keep up. But you may be in luck - nouveau may
support reclocking on your GPU -- check the contents
/sys/kernel/debug/dri/0/pstate for the various options, and echo e.g.
"0f" or "22" or whatever the desired level is listed as back into that
file (note - AC = "current", not an actual level).

On Fri, Dec 27, 2019 at 8:45 AM Jairo Quintanilla
<jairo_6875@hotmail.com> wrote:
>
> The issue is like this.:
>
> https://youtu.be/4YQSL3xWrJA
>
> I have some tearing and sometimes flickering, just screen off and on suddenly in shorts periods of time.
>
> I have this problem with videos in YouTube using Firefox, and local videos using vlc and MPlayer for example.
>
>
> Enviado desde mi Samsung Mobile de Claro
>
>
>
> -------- Original message --------
> From: Ilia Mirkin <imirkin@alum.mit.edu>
> Date: 12/27/19 7:40 AM (GMT-06:00)
> To: Jairo Quintanilla <jairo_6875@hotmail.com>
> Cc: nouveau@lists.freedesktop.org
> Subject: Re: [Nouveau] Flickering Nvidia GeForce GT210
>
> And when you say "flickering", do you really mean some kind of
> decoding failure with blocks being off or whatever? Or maybe a frame
> ordering issue (where old frames appear instead of new ones
> sometimes)? Or just regular tearing?
>
> Is your video player using GL output, VDPAU output (and vdpau
> decoding), or Xv? (What video player are you using?)
>
> On Fri, Dec 27, 2019 at 8:33 AM Jairo Quintanilla
> <jairo_6875@hotmail.com> wrote:
> >
> > I'm using xorg and nouveau, not modesetting.
> >
> >
> > Thanks for your response.
> >
> >
> >
> > Enviado desde mi Samsung Mobile de Claro
> >
> >
> >
> > -------- Original message --------
> > From: Ilia Mirkin <imirkin@alum.mit.edu>
> > Date: 12/27/19 7:31 AM (GMT-06:00)
> > To: Jairo Quintanilla <jairo_6875@hotmail.com>
> > Cc: nouveau@lists.freedesktop.org
> > Subject: Re: [Nouveau] Flickering Nvidia GeForce GT210
> >
> > Are you on Xorg or wayland of some sort? If on Xorg, which DDX are you
> > using -- nouveau or modesetting?
> >
> > On Fri, Dec 27, 2019 at 3:13 AM Jairo Quintanilla
> > <jairo_6875@hotmail.com> wrote:
> > >
> > > Hi mates,
> > >
> > > First to all thanks for your help.
> > >
> > > I've installed Nouveau driver for my Nvidia GeForce GT210 using Archlinux, but I have some flickering issues when playing videos, only in the video windows.
> > >
> > > Sometimes I can see some flickering when scrolling.
> > >
> > > Please help. I don't know how to fix it.
> > >
> > >
> > > Atte. Jairo Quintanilla
> > > _______________________________________________
> > > Nouveau mailing list
> > > Nouveau@lists.freedesktop.org
> > > https://lists.freedesktop.org/mailman/listinfo/nouveau
_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
