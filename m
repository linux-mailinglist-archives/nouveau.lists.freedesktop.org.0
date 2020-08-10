Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DA99D2413B3
	for <lists+nouveau@lfdr.de>; Tue, 11 Aug 2020 01:24:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 098AB6E489;
	Mon, 10 Aug 2020 23:24:05 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-yb1-xb44.google.com (mail-yb1-xb44.google.com
 [IPv6:2607:f8b0:4864:20::b44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7703F6E489
 for <nouveau@lists.freedesktop.org>; Mon, 10 Aug 2020 23:24:03 +0000 (UTC)
Received: by mail-yb1-xb44.google.com with SMTP id e14so6052717ybf.4
 for <nouveau@lists.freedesktop.org>; Mon, 10 Aug 2020 16:24:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=sHTMWOQMQqVC1YkPXrIWKp9zMBZW3dKlWCxNHjwNeMs=;
 b=O21fmGXiWJQ4wEa1deika1eZk7y16byz3JuOGdM1yfDI/4TDk5jXyA5O+sTwNi/67J
 R4FeLqs2M9H+gu5DHZ/TTB8FY04ZvbsNSrHugX4Ed5zMg5TnrAFUP2KtiZahVW5RjCKF
 JOBfhOaKUwEXut1AdylFqLIcEACGiUJ74rKNXjeFuhfOAdeb6dZUi5g2Xo6+cw8V/xjK
 d7zJrambKzTdkH4J7fwwpKVD123x3iHlJ/yB1wqttMhbI8ft9Tf2i0TG9eHAfsxHN1ED
 yB+LvnSTrbttuXUg0MFHZFcXzIh703gXnco7qovItMeHN1nMy5zIPuEkwLmXCGloRr3K
 dA2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=sHTMWOQMQqVC1YkPXrIWKp9zMBZW3dKlWCxNHjwNeMs=;
 b=nW4Uxx+inUgL0752drvkWWR6fEhKvJzOpZ6NTuzGW7YXr3xm2suYGHgbPbV4xzegUR
 mVuSEcbJp8dfHKIj2h0DVXGO8qKBbuatYM0YvrTKefcorlEn8lIm/Jfx5WAbfkeTbXC/
 g1qSXoYGjnVJ88qukeDQ3QKV8/lyzBKbcWG9+VO8shC/wWwOnSzecAw26nxE+IhlZ5RO
 gAeNXIpcwuZfP9b13jP6C5Ao7mLbaXVdoaa5aReW9hipzSO0Ir2C3ybMf1z8nsrMQB+U
 Y0TKpo9jiEjE0VjreXm0bSmSkDBCjy5eIDTxELsxqaBniww6qKsWEEcQ+xi+DA70UNX9
 PLJw==
X-Gm-Message-State: AOAM5333iUDOYBXWEgT5KTRfxIa1RhiZMpYOmfiZ6V5pVgRSLONvgK2U
 zecBLhtJKNUfQaahfqLjpWem5KkcwZvUXR72vXw=
X-Google-Smtp-Source: ABdhPJyRcBbTAZztXNFV722dmW0WK6qqo+aL4JdsYOTcfzPt5oD2ld8xIvZekP+gLf6XWpuO0YhmA+EVEu4WGzswxkw=
X-Received: by 2002:a25:cf08:: with SMTP id f8mr42123105ybg.435.1597101842729; 
 Mon, 10 Aug 2020 16:24:02 -0700 (PDT)
MIME-Version: 1.0
References: <20200810211838.37862-1-lyude@redhat.com>
In-Reply-To: <20200810211838.37862-1-lyude@redhat.com>
From: Ben Skeggs <skeggsb@gmail.com>
Date: Tue, 11 Aug 2020 09:23:51 +1000
Message-ID: <CACAvsv5WW=gZ0HjMg1GWz6Y59rUzE0qmrr2FSPcES33tx81iKw@mail.gmail.com>
To: Lyude Paul <lyude@redhat.com>
Subject: Re: [Nouveau] [PATCH 0/2] drm/nouveau: Small CRC fixes for 5.9
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
Cc: ML nouveau <nouveau@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

On Tue, 11 Aug 2020 at 07:18, Lyude Paul <lyude@redhat.com> wrote:
>
> Just two CRC related fixes for the new CRC functionality in 5.9. One of
> these unbreaks CRC reporting on volta+, which accidentally got broken
> when converting over to nvidia's class headers. The other simply removes
> an unneeded CRC method call that's been hiding in head907d_mode() for
> quite a while now.
>
> Lyude Paul (2):
>   drm/nouveau/kms/nv140-: Include correct push header in crcc37d.c
Got them both.  I already had this first one in my tree, but your
description was better, so I took yours.

Thanks,
Ben.

>   drm/nouveau/kms/nv50-: Don't call HEAD_SET_CRC_CONTROL in
>     head907d_mode()
>
>  drivers/gpu/drm/nouveau/dispnv50/crcc37d.c  |  2 +-
>  drivers/gpu/drm/nouveau/dispnv50/head907d.c | 11 ++---------
>  2 files changed, 3 insertions(+), 10 deletions(-)
>
> --
> 2.26.2
>
> _______________________________________________
> Nouveau mailing list
> Nouveau@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/nouveau
_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
