Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DEA2A12B4E3
	for <lists+nouveau@lfdr.de>; Fri, 27 Dec 2019 14:40:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2FA158985A;
	Fri, 27 Dec 2019 13:40:25 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-vk1-f176.google.com (mail-vk1-f176.google.com
 [209.85.221.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 34E0C8985A
 for <nouveau@lists.freedesktop.org>; Fri, 27 Dec 2019 13:40:24 +0000 (UTC)
Received: by mail-vk1-f176.google.com with SMTP id b129so6798955vka.4
 for <nouveau@lists.freedesktop.org>; Fri, 27 Dec 2019 05:40:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=LfU1NRSDQijAERUSoNVwAG56Lieat6qHsC24zEaQS64=;
 b=PTh7PPEmmSd63bn2T9noNY7Ab6CnFis/aRYYPivr1cpThb3w7Bms65ebUuHXFDoppa
 xd2c7YWHO0qaTrbcmdgxgjAwhaXuRiVj0VoU3GRFld5aNsRNr1qXbQy9QOaF+HJYLkcA
 hMC1Z+b3PqpjzHHGp/A/2cTcsO0DaNfcNtVR82J/lLflYhN2HIxPUD+l5ZrL/qrJdiSS
 g1z81mLOtduu518M5Yao/rzgRtnWPw7rOXJP6NhuObAqSR+WeEUfm9Zy2E3vgRCqGdxq
 SxM+UqQWo3kOiYUw9RZHJ3lBNXxR9omsJfAZQHunXeaOhW4Fn7/CI2LTgYrxrm4Fg4iM
 7V0g==
X-Gm-Message-State: APjAAAXnyH1+3thwknerjyz7lavURPZDhooo5/+4BkoxzwCYL3KjsQVE
 /kZlvJ6gMg8wU/5o+d30JuD8aijw7zCrDUKGzBM=
X-Google-Smtp-Source: APXvYqwvz91SSnlBUjAP36qsB4HyJAmyT/DvaDcl/SkR2QbV0tX7vA243xdoIgrGRL2gnIXMMlzNskcojzJP0CW4kjY=
X-Received: by 2002:a1f:5385:: with SMTP id h127mr30009572vkb.56.1577454023233; 
 Fri, 27 Dec 2019 05:40:23 -0800 (PST)
MIME-Version: 1.0
References: <BN6PR01MB233713E4E456F3C33AF3CAB9E32D0@BN6PR01MB2337.prod.exchangelabs.com>
 <CAKb7UvheYyPgSgkVXxd+U4tQdAA+Zq0hOv1nnmG7cHskA=vEfA@mail.gmail.com>
 <BN6PR01MB2337C1AC4B6AF0AA017057E1E32A0@BN6PR01MB2337.prod.exchangelabs.com>
In-Reply-To: <BN6PR01MB2337C1AC4B6AF0AA017057E1E32A0@BN6PR01MB2337.prod.exchangelabs.com>
From: Ilia Mirkin <imirkin@alum.mit.edu>
Date: Fri, 27 Dec 2019 08:40:12 -0500
Message-ID: <CAKb7Uvi6zZX0y-0sOd2MqSye=ttF+Fb-GiFKsWH_PShOW2GjbA@mail.gmail.com>
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

And when you say "flickering", do you really mean some kind of
decoding failure with blocks being off or whatever? Or maybe a frame
ordering issue (where old frames appear instead of new ones
sometimes)? Or just regular tearing?

Is your video player using GL output, VDPAU output (and vdpau
decoding), or Xv? (What video player are you using?)

On Fri, Dec 27, 2019 at 8:33 AM Jairo Quintanilla
<jairo_6875@hotmail.com> wrote:
>
> I'm using xorg and nouveau, not modesetting.
>
>
> Thanks for your response.
>
>
>
> Enviado desde mi Samsung Mobile de Claro
>
>
>
> -------- Original message --------
> From: Ilia Mirkin <imirkin@alum.mit.edu>
> Date: 12/27/19 7:31 AM (GMT-06:00)
> To: Jairo Quintanilla <jairo_6875@hotmail.com>
> Cc: nouveau@lists.freedesktop.org
> Subject: Re: [Nouveau] Flickering Nvidia GeForce GT210
>
> Are you on Xorg or wayland of some sort? If on Xorg, which DDX are you
> using -- nouveau or modesetting?
>
> On Fri, Dec 27, 2019 at 3:13 AM Jairo Quintanilla
> <jairo_6875@hotmail.com> wrote:
> >
> > Hi mates,
> >
> > First to all thanks for your help.
> >
> > I've installed Nouveau driver for my Nvidia GeForce GT210 using Archlinux, but I have some flickering issues when playing videos, only in the video windows.
> >
> > Sometimes I can see some flickering when scrolling.
> >
> > Please help. I don't know how to fix it.
> >
> >
> > Atte. Jairo Quintanilla
> > _______________________________________________
> > Nouveau mailing list
> > Nouveau@lists.freedesktop.org
> > https://lists.freedesktop.org/mailman/listinfo/nouveau
_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
