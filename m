Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 052B528F6DA
	for <lists+nouveau@lfdr.de>; Thu, 15 Oct 2020 18:33:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7E9D86ED8A;
	Thu, 15 Oct 2020 16:33:17 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [63.128.21.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F39746ED8A
 for <nouveau@lists.freedesktop.org>; Thu, 15 Oct 2020 16:33:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1602779594;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=OPCx6ZX+v0aW1qWNyvmKfIJa6GlSsQRVtNwvNS3h79w=;
 b=V7fNqOat6M4erWJDqsqhhTD6ZsOliJ6kWc+TRLJj1oGKCm76EFGWcYYMYynylzRJ0CMY9+
 a8jLn2rUprHT96BDRRhz/YE+0BgEDbp4TIb27ix6KDqZ6uGZ1bUQ2fGyzRPlURQYeStIUE
 bXIBwivDEQra8lBenlYck1esMz5Jpu4=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-520-JhmxNbnrOCKBQ7nejNdvZg-1; Thu, 15 Oct 2020 12:33:11 -0400
X-MC-Unique: JhmxNbnrOCKBQ7nejNdvZg-1
Received: by mail-qk1-f197.google.com with SMTP id b7so2431087qkh.20
 for <nouveau@lists.freedesktop.org>; Thu, 15 Oct 2020 09:33:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=OPCx6ZX+v0aW1qWNyvmKfIJa6GlSsQRVtNwvNS3h79w=;
 b=a5YwNoSH2nUtYDSkeNp4pP1+YNpY7PLXLx2ex106hhGZ4Ut+VV7XnWi1aCPVqObnb+
 fqkYyVcjkE7WpZ5Y2DzC9JG/UQa4WhjVGPiiUl9aCPLELvU8L57bxa4HvLH3PJKGf8+m
 5dhkJP5VoZPOQGhnyHzOuhH+KtOTi9dzb/Ierg58kiWzbi03auEolco3/1E+DZrZNwsx
 qEgKQ9qWQEZoVBEqrUP1nLbA1PNkqX4q+SvJehQ4M6gx81e2wUw1Ql1L5Bvv5H/K8Z/N
 +Elf/LEuCNkj1Ze9Fd8kozU8ZRbBcN/P32MUrvf35LJR5lwjpGaN1Y99F9vUfKaSpyXo
 jKeg==
X-Gm-Message-State: AOAM530ASmncq6EN+okCooKBNEByaoYBiI7sFNxQTi6uiM2nvyOTdKSl
 uW/ugNkA6sa9LGEBs2d9gWvpPMO6C0dQ1Q1Jlp4IQl42ljQi7filALVkTDH6yyz/T/jO8yMT7pn
 QchfR0EYmhYsoTonZcpZxdpk4NQiX9Q3ySLDw8auFJw==
X-Received: by 2002:a05:620a:1668:: with SMTP id
 d8mr4948595qko.192.1602779590077; 
 Thu, 15 Oct 2020 09:33:10 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxhPovKkyv2797cvRQtgT8s/gshA8t417emP2EmAJofXJvWtB9m/PLkl5wGjr16oTzG1Y3NTcB1101aJZ9i6ZY=
X-Received: by 2002:a05:620a:1668:: with SMTP id
 d8mr4948568qko.192.1602779589751; 
 Thu, 15 Oct 2020 09:33:09 -0700 (PDT)
MIME-Version: 1.0
References: <20201014075419.19974-1-keitasuzuki.park@sslab.ics.keio.ac.jp>
In-Reply-To: <20201014075419.19974-1-keitasuzuki.park@sslab.ics.keio.ac.jp>
From: Karol Herbst <kherbst@redhat.com>
Date: Thu, 15 Oct 2020 18:32:58 +0200
Message-ID: <CACO55ttZCVZM2v1oWRq7mzZy3DVDe3h1fH80D6RNFM3xR4VjuQ@mail.gmail.com>
To: Ben Skeggs <bskeggs@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kherbst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Subject: Re: [Nouveau] [PATCH RFC] drm/nouveau: fix memory leak in
 nvkm_iccsense_oneinit
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
Cc: takafumi@sslab.ics.keio.ac.jp, David Airlie <airlied@linux.ie>,
 nouveau <nouveau@lists.freedesktop.org>, LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, Daniel Vetter <daniel@ffwll.ch>,
 Keita Suzuki <keitasuzuki.park@sslab.ics.keio.ac.jp>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

Ben, I think this is like the 5th patch tackling this issue, I think
we should merge one of those.

On Thu, Oct 15, 2020 at 6:23 AM Keita Suzuki
<keitasuzuki.park@sslab.ics.keio.ac.jp> wrote:
>
> struct pw_rail_t is allocated as an array in function nvios_iccsense_parse,
> and stored to a struct member of local variable. However, the array is not
> freed when the local variable becomes invalid, and the reference is not
> passed on, leading to a memory leak.
>
> Fix this by freeing struct pw_rail_t when exiting nvkm_iccsense_oneinit.
>
> Signed-off-by: Keita Suzuki <keitasuzuki.park@sslab.ics.keio.ac.jp>
> ---
>  drivers/gpu/drm/nouveau/nvkm/subdev/iccsense/base.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/iccsense/base.c b/drivers/gpu/drm/nouveau/nvkm/subdev/iccsense/base.c
> index fecfa6afcf54..8ba8d8e3f52a 100644
> --- a/drivers/gpu/drm/nouveau/nvkm/subdev/iccsense/base.c
> +++ b/drivers/gpu/drm/nouveau/nvkm/subdev/iccsense/base.c
> @@ -280,8 +280,10 @@ nvkm_iccsense_oneinit(struct nvkm_subdev *subdev)
>                         }
>
>                         rail = kmalloc(sizeof(*rail), GFP_KERNEL);
> -                       if (!rail)
> +                       if (!rail) {
> +                               kfree(stbl.rail);
>                                 return -ENOMEM;
> +                       }
>
>                         rail->read = read;
>                         rail->sensor = sensor;
> @@ -291,6 +293,7 @@ nvkm_iccsense_oneinit(struct nvkm_subdev *subdev)
>                         list_add_tail(&rail->head, &iccsense->rails);
>                 }
>         }
> +       kfree(stbl.rail);
>         return 0;
>  }
>
> --
> 2.17.1
>
> _______________________________________________
> Nouveau mailing list
> Nouveau@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/nouveau
>

_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
