Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AEB224D9835
	for <lists+nouveau@lfdr.de>; Tue, 15 Mar 2022 10:55:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0BEB610E34F;
	Tue, 15 Mar 2022 09:55:53 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-il1-f179.google.com (mail-il1-f179.google.com
 [209.85.166.179])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4117B10E34F
 for <nouveau@lists.freedesktop.org>; Tue, 15 Mar 2022 09:55:51 +0000 (UTC)
Received: by mail-il1-f179.google.com with SMTP id b5so12909346ilj.9
 for <nouveau@lists.freedesktop.org>; Tue, 15 Mar 2022 02:55:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=tWbFfMNx9AauxYEN4ZXtmpoKCsl1nZ6TYixdViUAwZg=;
 b=pxXtMykqoL2m/ZMYsbQXQ1pgyFYO/89bVVECwU18zvb9SclmQ0b4Fbsi55oM54M6RG
 vkn0xmT3XUmVSISZ9R1ld2PsID65YxusqcQ1b4KlJzSYhsrfo+MXP2q0maBmT5BL8sl7
 0mNhObYVHr62vbbS2mSEb5FXGcdQUpMy5RYcuOEjpsZ6jBafOWwJcUqwjy/UzxujHiQu
 FfhtEVO+nSR4+3zKfR72BpgXeEIgsTCsY9Y/LPREV1/hvUBbxaHsrk2MPjBTJX0QLQNa
 sn4iCIUtU1TL1D5vHG1D6t5o7BHsTiw2T92Gt1sx3RylH0LJqnJF4OMywnqpUz3jd2fo
 IvfA==
X-Gm-Message-State: AOAM532y+Ku5Muxi5W5ALnVYcnWZQi5/sZAYNOiR9u9F84ZPC1P+mJQo
 epVG09wIkmug+nIIl8RhElxuO929MfGguehp+g==
X-Google-Smtp-Source: ABdhPJzUTXnL/orT2yfDlM0spEUOez8GNtPXw5pb3WjZlCacAFkvkCJ2iRXQ5I7TFesqADvUOhTQD+v1Iiq0jeROJ3Y=
X-Received: by 2002:a05:6e02:18c7:b0:2c7:a6d3:264b with SMTP id
 s7-20020a056e0218c700b002c7a6d3264bmr5109878ilu.210.1647338150441; Tue, 15
 Mar 2022 02:55:50 -0700 (PDT)
MIME-Version: 1.0
References: <CAJtcoLYpx0Dnr8VbtBV74aiwGm1UkCHqJOZAxGb9-tG7o6=gjA@mail.gmail.com>
 <CAKb7UvihMs9b_mjsSoGrZRM0qLUYwGQdfnznqNKPhSF6TUpyEg@mail.gmail.com>
 <CAJtcoLZgBYuFbAqUz5KUHeZYGLTr_489MTuc7eCWTd+WP7bBtA@mail.gmail.com>
 <CAKb7Uvgv9Y8NKbgiq0zPRrf-ROT-z-BQO4Xj9d04a5wTAoqVaQ@mail.gmail.com>
In-Reply-To: <CAKb7Uvgv9Y8NKbgiq0zPRrf-ROT-z-BQO4Xj9d04a5wTAoqVaQ@mail.gmail.com>
From: Martin Knoblauch <knobi@knobisoft.de>
Date: Tue, 15 Mar 2022 10:55:39 +0100
Message-ID: <CAJtcoLZ8wGyeGUz05U2N8SiTVgaX18m10F4fx+jYjoCZbL_Lrw@mail.gmail.com>
To: Ilia Mirkin <imirkin@alum.mit.edu>
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Nouveau] Nvidia GK106GLM (Quadro K2100M) with Nouveau
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

On Mon, Mar 14, 2022 at 10:42 PM Ilia Mirkin <imirkin@alum.mit.edu> wrote:
>
> On Mon, Mar 14, 2022 at 5:30 PM Martin Knoblauch <knobi@knobisoft.de> wrote:
> >
> > On Mon, Mar 14, 2022 at 7:45 PM Ilia Mirkin <imirkin@alum.mit.edu> wrote:
> > >
> > > Hi Martin,
> > >
> > > Depends what your expectations are. Nouveau is missing a number of
> > > features of the blob, the most important of which is probably
> > > stability. Whether you run into instability or not depends a lot on
> > > the software that you use, so you'll just have to find out for
> > > yourself if it works well for you or not. Personally, I have
> > > multi-month uptimes with it. But others struggle to stay up for an
> > > hour.
> > >
> > > With GK106, you should have manual reclocking, which should enable you
> > > to achieve ~50-80% of blob performance, if that's a concern for you.
> > > You won't get Vulkan nor H.264 hardware encoding.
> > >
> > > Cheers,
> > >
> > >   -ilia
> > >
> > Hi Ilia,
> >
> >  most of my expectations would be met, if I were able to get a decent
> > resolution from the GK106. As it is the card is not recognized, and it
> > falls back to VESA with 1280x1024 which is pathetic. I have not much
> > need or expectation on speed.
>
> That's not normal. Please post logs. Perhaps you have nouveau
> blacklisted or something like that? Nouveau should definitely
> recognize your card.
>
>   -ilia
Hi Ilia,

 thanks for providing the correct clue: "blacklisted". I had removed
one blacklist command from /etc/modprobe.d, but the proprietary
installer had left another at /usr/lib/modprobe.d. Kicked that out and
now I have 1920x1080 and all my stuff is working fine :-)

Btw card is recognized as "NVIDIA NVE6". Does that make sense?

Cheers
Martin
