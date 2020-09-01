Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B3B7E258F11
	for <lists+nouveau@lfdr.de>; Tue,  1 Sep 2020 15:29:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5028E6E0AC;
	Tue,  1 Sep 2020 13:29:26 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-vk1-f194.google.com (mail-vk1-f194.google.com
 [209.85.221.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E47F36E0AC
 for <nouveau@lists.freedesktop.org>; Tue,  1 Sep 2020 13:29:24 +0000 (UTC)
Received: by mail-vk1-f194.google.com with SMTP id q200so325845vke.6
 for <nouveau@lists.freedesktop.org>; Tue, 01 Sep 2020 06:29:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=j25Zt7siiXEa5H4E/2+/lr/+m78tLyU24Ek6qvO9+9g=;
 b=fDdpOnQRx35tXeTje+pipeDS78suhzq/YGH3ELzRyg5Lp5yf8HQNuJ/3boOLfB+QP+
 O8hiG5uDhtSyMndEzyUy1lWUR2kv0CNm+fqvYHAfkl4D/WbQIUftiSFwIhg+GdfEIotv
 6xLBVbYyOSMBDTawTshHobcq1w+Yk2Pkuhb+01HD9OBu8pJAIbJQf6KQtXXRSEiih8S7
 MDy/d1r8QWC+LYZSAhqldztEEwYBf6MKBUB7ur99naO07mU8L52L1obzImzD/F+07SPB
 AYZfCceBeD+Y8ze1dKY+E0HJYrNTo53/Qu4ZJhiJ4i67YO67QErhZnC3PXmIDTtuY7L/
 FcnA==
X-Gm-Message-State: AOAM533KAK6qtivo65y/26zli8/yu6ZXbg20qrHy1hsQmlNBhfzEBAW0
 dCRAmOu7H5kvoUaC17LihFZD4CcqRCY9sFcaq3I=
X-Google-Smtp-Source: ABdhPJz+7v18dcP3rFCcxau6UCo8KrS++ygM7j81swUm6caRC6CdUa9UTAOTSucZPaWTgmI9cbozuJRrzGEQHMDaFEs=
X-Received: by 2002:a1f:d6c4:: with SMTP id n187mr1155117vkg.65.1598966963638; 
 Tue, 01 Sep 2020 06:29:23 -0700 (PDT)
MIME-Version: 1.0
References: <CAKiGokHoArQcnVAPs0HWzJSFXhwCSLfQAirOQ-zTq=0C-97neQ@mail.gmail.com>
 <CAKb7Uvh4cdg0=dGJqQVXx_p4O2c5BJbG3JRnjznwjsMQwc505Q@mail.gmail.com>
 <CAKiGokGj8pfm1tmH0aN7de5FVvrszAA93_e9-Zq05oqw46GnRg@mail.gmail.com>
In-Reply-To: <CAKiGokGj8pfm1tmH0aN7de5FVvrszAA93_e9-Zq05oqw46GnRg@mail.gmail.com>
From: Ilia Mirkin <imirkin@alum.mit.edu>
Date: Tue, 1 Sep 2020 09:29:12 -0400
Message-ID: <CAKb7UvhE8i9E7XxxwrpQX1rSvLHk63tFt7dyv_0XAAxu4O5=iA@mail.gmail.com>
To: Analabha Roy <hariseldon99@gmail.com>
Subject: Re: [Nouveau] VAAPI on GeForce GT 620M
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

On Tue, Sep 1, 2020 at 9:10 AM Analabha Roy <hariseldon99@gmail.com> wrote:
> Any suggestions on how to trace the config issues? Do I have to debug the va_openDriver() function?

My guess, without reading any code, is that DRI_PRIME isn't doing what
you want it to, and the nouveau driver is being handed an intel
device. This does not work well. Fixing this will require tracing
through the va winsys code which to figure out how it invokes the
loader.

https://cgit.freedesktop.org/mesa/mesa/tree/src/gallium/frontends/va/context.c#n111

For the DRM/rendernodes "platform", it will just take whatever fd it
is given. vainfo appears to give it a fixed device:

https://github.com/intel/libva-utils/blob/master/common/va_display_drm.c#L39

However it looks like you can pass in --device /dev/dri/renderD129 or
whatever the right one is, which should pass in the right render node,
as seen here:

https://github.com/intel/libva-utils/blob/master/common/va_display.c#L80

Note that I've never tried this, just did a few google searches to
find this stuff.

Cheers,

  -ilia
_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
