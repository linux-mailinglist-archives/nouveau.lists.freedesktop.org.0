Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 060934D8EAB
	for <lists+nouveau@lfdr.de>; Mon, 14 Mar 2022 22:30:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C3C0C89362;
	Mon, 14 Mar 2022 21:30:16 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-io1-f49.google.com (mail-io1-f49.google.com
 [209.85.166.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9085A89362
 for <nouveau@lists.freedesktop.org>; Mon, 14 Mar 2022 21:30:15 +0000 (UTC)
Received: by mail-io1-f49.google.com with SMTP id c23so20013100ioi.4
 for <nouveau@lists.freedesktop.org>; Mon, 14 Mar 2022 14:30:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=zfTTwBpfsk9OXb8g2oiM/8QlhJ9Qu2T68ZEOquV3HEs=;
 b=TT1XErnXR67LAWJ+qZoFA85sMva9Za56sFQ3r3yLWO0fbYCjFyb94yVgCEFLVHqwi2
 JASpO5ux3WLj1v9rSAXNhCtQxUKzK9ahXG96Kc/nreYd7eGEb8VPYBlcWpnrbC/TeT2g
 ZXsQMl4T2kuLFBOD9y4XGg73q3vJcpAR7SJVD1u2iBe+DeIIjj4eD0mpX/OZ+bLyoVud
 6yT/Yev6ca4zgEW+YMADQq5NU+hf+tXvMmHVv32nxJ0lvBtWd5laskQBwXxDUEyhlKSD
 xdefvkdOM9q1jZi+SPv8Fwgx3Wht//yuBUGNukT9vmzQC7vRQccuEIGdyaa0BnMrWptt
 yfSg==
X-Gm-Message-State: AOAM533rGchIfy/1pacDqYtox5Q67KZrVAe1ul67kFDlczGuTSDbIwgv
 c8YHrW1+mSr7XWUSSl16G5dsEXeRVLR8A59dolJT5vg=
X-Google-Smtp-Source: ABdhPJwbOgplo6S/r5yIcKzrQ8wJsJq7gE+wbulndpMMkh7rpDnXJ5G8iNazbMIG0NHsBMYG5h0SlDeiAaiqFcoib+c=
X-Received: by 2002:a5e:924c:0:b0:646:390e:ce1b with SMTP id
 z12-20020a5e924c000000b00646390ece1bmr20685325iop.142.1647293414754; Mon, 14
 Mar 2022 14:30:14 -0700 (PDT)
MIME-Version: 1.0
References: <CAJtcoLYpx0Dnr8VbtBV74aiwGm1UkCHqJOZAxGb9-tG7o6=gjA@mail.gmail.com>
 <CAKb7UvihMs9b_mjsSoGrZRM0qLUYwGQdfnznqNKPhSF6TUpyEg@mail.gmail.com>
In-Reply-To: <CAKb7UvihMs9b_mjsSoGrZRM0qLUYwGQdfnznqNKPhSF6TUpyEg@mail.gmail.com>
From: Martin Knoblauch <knobi@knobisoft.de>
Date: Mon, 14 Mar 2022 22:30:04 +0100
Message-ID: <CAJtcoLZgBYuFbAqUz5KUHeZYGLTr_489MTuc7eCWTd+WP7bBtA@mail.gmail.com>
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

On Mon, Mar 14, 2022 at 7:45 PM Ilia Mirkin <imirkin@alum.mit.edu> wrote:
>
> Hi Martin,
>
> Depends what your expectations are. Nouveau is missing a number of
> features of the blob, the most important of which is probably
> stability. Whether you run into instability or not depends a lot on
> the software that you use, so you'll just have to find out for
> yourself if it works well for you or not. Personally, I have
> multi-month uptimes with it. But others struggle to stay up for an
> hour.
>
> With GK106, you should have manual reclocking, which should enable you
> to achieve ~50-80% of blob performance, if that's a concern for you.
> You won't get Vulkan nor H.264 hardware encoding.
>
> Cheers,
>
>   -ilia
>
Hi Ilia,

 most of my expectations would be met, if I were able to get a decent
resolution from the GK106. As it is the card is not recognized, and it
falls back to VESA with 1280x1024 which is pathetic. I have not much
need or expectation on speed.

Cheers
Martin

> On Mon, Mar 14, 2022 at 11:55 AM Martin Knoblauch <knobi@knobisoft.de> wrote:
> >
> > Hi,
> >
> >  for years I have been running my DELL M4800 Laptop under Linux with the proprietary drivers from NV. Finally I am kind of sick of recompiling those drivers every time I upgrade the Kernel.
> >
> > So, my question is: is there any chance to operate a GK106GLM using nouveau.ko?
> >
> > Sorry if this has been asked before.
> >
> > Cheers
> > Martin
> > --
> > ------------------------------------------------------
> > Martin Knoblauch
> > email: k n o b i AT knobisoft DOT de
> > www: http://www.knobisoft.de



-- 
------------------------------------------------------
Martin Knoblauch
email: k n o b i AT knobisoft DOT de
www: http://www.knobisoft.de
