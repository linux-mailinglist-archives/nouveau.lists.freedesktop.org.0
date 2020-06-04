Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AA841EE7B3
	for <lists+nouveau@lfdr.de>; Thu,  4 Jun 2020 17:26:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B5EC6E44D;
	Thu,  4 Jun 2020 15:25:58 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-vs1-f65.google.com (mail-vs1-f65.google.com
 [209.85.217.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8FCAF6E44D
 for <nouveau@lists.freedesktop.org>; Thu,  4 Jun 2020 15:25:56 +0000 (UTC)
Received: by mail-vs1-f65.google.com with SMTP id y123so3757503vsb.6
 for <nouveau@lists.freedesktop.org>; Thu, 04 Jun 2020 08:25:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=wQu5VmRSYNeWuQ8i5tUUigorDKnoUd980cUZ+cjZTb4=;
 b=LEcv4r1yiQE2VqQirg9PihTJPiczTA880bZXyJcyC4EQmBLexnt8jaW+ZMTa09dTXi
 1wzdcgDackkM2nU6oEU+tqDpaimSpsbrESRe+NDBD6bTsZUkrSzKLhwiSsTLxtkuw/7+
 kpi2TjnPOvxylQYBQ8FQRrULLWt+rwT1WQiTT1Be6UxWVkDFxzZrhpFrKvHp9mdnueO3
 SG2qSPg2fk/A0MRfxA9W2WG3a2ioOcGONaD3H6MrrTmtG2xZ//G7d/Z+Km6K39IOb/Ja
 rVXdUERS6un5Ws8rNjzgDeXEHzGzA4ty4CYI/7KZF1JmDVCozBlq5iYvBbD1b2k0GVrC
 V58Q==
X-Gm-Message-State: AOAM532lZyIQtoYmyTtTGY6g5dW27ye+VDBFGGIoSZM98POxO+KPheoz
 oVfoG/btYeMQJOLU45RKmMl+ELILaGVdSW6KlVE=
X-Google-Smtp-Source: ABdhPJwqO+g81Sm7vWEc4Yket9tjpOnJckjtQCHgAFqLxf9gmX/lI345OEc23j2K4BGT9dlXl7YO1du334sGMfNmZ+A=
X-Received: by 2002:a67:8846:: with SMTP id k67mr3801972vsd.210.1591284355742; 
 Thu, 04 Jun 2020 08:25:55 -0700 (PDT)
MIME-Version: 1.0
References: <CAOkhzLUrNYk6JKTbTQuFkfuGKxGvW9XVq6+p9igsBgX1-e9Cxg@mail.gmail.com>
 <CAKb7Uvg0W_1qUjf3G4JrCb2oJgkwz4G5T6PwkyeL-rZEp4UnTw@mail.gmail.com>
 <CAOkhzLV+suVNAoyiaHKOkbwP-KKgTLEa7S8kp8+GSTLm_-wWFw@mail.gmail.com>
In-Reply-To: <CAOkhzLV+suVNAoyiaHKOkbwP-KKgTLEa7S8kp8+GSTLm_-wWFw@mail.gmail.com>
From: Ilia Mirkin <imirkin@alum.mit.edu>
Date: Thu, 4 Jun 2020 11:25:44 -0400
Message-ID: <CAKb7UvgWMsLSHCayzdY7UYMVTjN3OHbH2WhKd-BP46K=r4Ra8A@mail.gmail.com>
To: Zeno Davatz <zdavatz@gmail.com>
Subject: Re: [Nouveau] NVIDIA GP107 (137000a1) - acr: failed to load firmware
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
Cc: nouveau <nouveau@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

On Thu, Jun 4, 2020 at 11:16 AM Zeno Davatz <zdavatz@gmail.com> wrote:
>
> On Thu, Jun 4, 2020 at 4:36 PM Ilia Mirkin <imirkin@alum.mit.edu> wrote:
> >
> > Starting with kernel 5.6, loading nouveau without firmware (for GPUs
> > where it is required, such as yours) got broken.
> >
> > You are loading nouveau without firmware, so it fails.
> >
> > The firmware needs to be available to the kernel at the time of nouveau loading.
>
> Ok, I am now trying this:
>
> /usr/src/linux> grep FIRMWARE /usr/src/linux/.config
> CONFIG_FIRMWARE_MEMMAP=y
> # CONFIG_GOOGLE_FIRMWARE is not set
> CONFIG_PREVENT_FIRMWARE_BUILD=y
> CONFIG_EXTRA_FIRMWARE="nvidia/gp107/gr/sw_nonctx.bin"
> # CONFIG_CYPRESS_FIRMWARE is not set
> # CONFIG_DRM_LOAD_EDID_FIRMWARE is not set
> # CONFIG_FIRMWARE_EDID is not set
> # CONFIG_TEST_FIRMWARE is not set

There's a lot more firmware files than that ... everything in the
gp107 directory. Also this would only be necessary if nouveau is built
into the kernel. The files just have to be available whenever nouveau
is loaded -- if it's built in, that means the firmware has to be baked
into the kernel too. If it's loaded from initrd, that means the
firmware has to be in initrd. If it's loaded after boot, then the
firmware has to be available after boot.

Cheers,

  -ilia
_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
