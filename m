Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 18D672928A6
	for <lists+nouveau@lfdr.de>; Mon, 19 Oct 2020 15:55:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 86D0C6E9BA;
	Mon, 19 Oct 2020 13:55:48 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-ua1-f66.google.com (mail-ua1-f66.google.com
 [209.85.222.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 891BD6E9BA
 for <nouveau@lists.freedesktop.org>; Mon, 19 Oct 2020 13:55:47 +0000 (UTC)
Received: by mail-ua1-f66.google.com with SMTP id j21so3217301uak.5
 for <nouveau@lists.freedesktop.org>; Mon, 19 Oct 2020 06:55:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=jyec1/6aP1C9OypCVXuGP2Cw2iDltThoWzbBV/i7Rv0=;
 b=iRJigR+Hh3Yar+FEVmgpx6jcatcH+utrHYD2xxlOeIAXfBxeWkxqwjWKfgQ03r/hvB
 2ijoAmXe/7VACS2OR2f5dPuY1pW5Rchh6WKlExLuzeepi3FB0BbNtsOMTZKKRz05+lKI
 pElYdoPHg1H0YoQKBxAjGyIxu8mGSzHZ/1ObDROOcF9yYxRKDWN9dmWXSCji7ZKaUmlQ
 1xOgI9z7AHToCGbgy+4878ayCrXMQ+nSScbECJQlNkqiGF+82B/+WB7blhf4ZRTI0DCc
 Uzxadog+ph4/odWiPMp9XygV7xu7gPECocrzlWZElzKkipo3oW75JTsydkxlAvrpKhOO
 Fw5A==
X-Gm-Message-State: AOAM533+kSIKQ6Tb9LuSoIhby+Ku/hQd2CIUJc26lqrw/xV+QkpjhLQM
 a5EQQLw98UufBJRgmRbFivTyYnptIdCmy48HLVY=
X-Google-Smtp-Source: ABdhPJxfHqEDYA94grbdajWxktbXn/a37KaiVhSW2qTJJLTvdfEJmB36da2qa16GrbE4MTK/G1sZySj9oJuJ8Eb+AA8=
X-Received: by 2002:a9f:2c92:: with SMTP id w18mr7549751uaj.58.1603115746678; 
 Mon, 19 Oct 2020 06:55:46 -0700 (PDT)
MIME-Version: 1.0
References: <202010191053.23735.randrianasulu@gmail.com>
In-Reply-To: <202010191053.23735.randrianasulu@gmail.com>
From: Ilia Mirkin <imirkin@alum.mit.edu>
Date: Mon, 19 Oct 2020 09:55:35 -0400
Message-ID: <CAKb7UviT4_9W+DC-M7GD00dMbS7+hZPjEv+JO75OvKCzFU029w@mail.gmail.com>
To: Andrew Randrianasulu <randrianasulu@gmail.com>
Subject: Re: [Nouveau] Small patch for nv50_vbo.c
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

This isn't meant to fix applications, it's meant to limit the range of
access to the buffer, for robustness/etc reasons. One would have to
look very carefully, as all this logic is rather tricky.

On Mon, Oct 19, 2020 at 4:07 AM Andrew Randrianasulu
<randrianasulu@gmail.com> wrote:
>
> Hi all!
>
> I saw TODO comment in nv50_vbo.c and decided to look at similar file, nvc0_vbo.c. I copied those two lines into nv50 with slight name change (nvc0->nv50) and apparently it doesn't fix any OpenGL app I have, but does not broke them further (I have compute pacthes currently applied, so some breakage expected).
>
> diff --git a/src/gallium/drivers/nouveau/nv50/nv50_vbo.c b/src/gallium/drivers/nouveau/nv50/nv50_vbo.c
> index 8d1c8c7665b..29b63a525aa 100644
> --- a/src/gallium/drivers/nouveau/nv50/nv50_vbo.c
> +++ b/src/gallium/drivers/nouveau/nv50/nv50_vbo.c
> @@ -189,8 +189,12 @@ nv50_user_vbuf_range(struct nv50_context *nv50, unsigned vbi,
>     assert(vbi < PIPE_MAX_ATTRIBS);
>     if (unlikely(nv50->vertex->instance_bufs & (1 << vbi))) {
>        /* TODO: use min and max instance divisor to get a proper range */
> -      *base = 0;
> -      *size = nv50->vtxbuf[vbi].buffer.resource->width0;
> +      const uint32_t div = nv50->vertex->min_instance_div[vbi];
> +      *base = nv50->instance_off * nv50->vtxbuf[vbi].stride;
> +      *size = (nv50->instance_max / div) * nv50->vtxbuf[vbi].stride +
> +         nv50->vertex->vb_access_size[vbi];
> +//      *base = 0;
> +//      *size = nv50->vtxbuf[vbi].buffer.resource->width0;
>     } else {
>        /* NOTE: if there are user buffers, we *must* have index bounds */
>        assert(nv50->vb_elt_limit != ~0);
>
> Does this look correct?
>
>
> _______________________________________________
> Nouveau mailing list
> Nouveau@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/nouveau
_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
