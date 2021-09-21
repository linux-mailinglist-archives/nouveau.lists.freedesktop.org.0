Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 77338412B29
	for <lists+nouveau@lfdr.de>; Tue, 21 Sep 2021 04:07:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B84289E01;
	Tue, 21 Sep 2021 02:07:57 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1DC8789E01
 for <nouveau@lists.freedesktop.org>; Tue, 21 Sep 2021 02:07:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1632190075;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=P0kxhnvVXGqL/DkgQ0Xhuo7zEcFhuLSYFgkrJ0v2bY8=;
 b=KRLl3CEEq5//U+1dni2S90am3gJf9SJWQNwRsdIUrH88E8a5qJ3TWmsLJnw5WvXWVwRBrr
 D9YVysuqw8ExjP/TJT9ETirMjhNBzqbMH6jqC7SETOvRCiMHMz4ENsFR4Cop7lIq74tDpJ
 ERxqpLfPdtw4s6+APxV+jfgus9FF+AM=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-492-mtWmlcENOQCQKBggRl4CAA-1; Mon, 20 Sep 2021 22:07:53 -0400
X-MC-Unique: mtWmlcENOQCQKBggRl4CAA-1
Received: by mail-wr1-f70.google.com with SMTP id
 x2-20020a5d54c2000000b0015dfd2b4e34so7565360wrv.6
 for <nouveau@lists.freedesktop.org>; Mon, 20 Sep 2021 19:07:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=P0kxhnvVXGqL/DkgQ0Xhuo7zEcFhuLSYFgkrJ0v2bY8=;
 b=ezxMvmRZESBk7tSHjn02hHTpPJrdjMmqcPFpYm7DRfxy7wtWtXk14EZXYr55r1IjU9
 TuX6iQ1RgwJgUPgA17pdC92+qY7qi01Uio6wmw7GtYJSz/qL2q5HGgFBEYUBzLQl8NtI
 Ul1llVGLzkMQlbZdWu9DhlgP6feHJnQMl90c8kmOv7qevqKG6f0Gm21iAtYY3ubicRdb
 c6Ttg2BSfH8oPmsB6TWs/vNO3dPxkM8MUhI+/JVkrcyRSjDeb3Q3fmmjOBx/9TScnqgm
 bw19FN2cDT6mjkwi/mMLDHKULeAHt5v9uNQRhl8S3lIcVcF1yAaz6KCjdu+5F3qYJ5EN
 VHdQ==
X-Gm-Message-State: AOAM5323QcQ+TFdq4PoJrSi96mQLuJtSfBGafaDDknJF9Kvyz7Rk5UeI
 Hyr1dHbKRqXvXqxyRvmYBEpdThJ2TeraEmhjaLfig2HWuPSXqRoh1x+nexs6Yi4oK7aMz7qKFHH
 JUnzcCBeHqEUyRJ0/zcuT/2XGUbwUXJ42Z+JfqOzSzg==
X-Received: by 2002:a5d:59a6:: with SMTP id p6mr31897337wrr.142.1632190072502; 
 Mon, 20 Sep 2021 19:07:52 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzrRzQplbk6pECz7R+jDK45fgzj2acrfM2YcTeVeurs7f31ushctXVBKRv9j3sozVJ/z6cTUf1MM8JcQ4F1Rfo=
X-Received: by 2002:a5d:59a6:: with SMTP id p6mr31897316wrr.142.1632190072226; 
 Mon, 20 Sep 2021 19:07:52 -0700 (PDT)
MIME-Version: 1.0
References: <20210920181647.22156-1-tim.gardner@canonical.com>
In-Reply-To: <20210920181647.22156-1-tim.gardner@canonical.com>
From: Karol Herbst <kherbst@redhat.com>
Date: Tue, 21 Sep 2021 04:07:41 +0200
Message-ID: <CACO55ts0kJaHr0QTzqy5r9Gq4vbV=8bMokuVHSCAqMVEOKAgDw@mail.gmail.com>
To: Tim Gardner <tim.gardner@canonical.com>
Cc: nouveau <nouveau@lists.freedesktop.org>, Ben Skeggs <bskeggs@redhat.com>, 
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, 
 dri-devel <dri-devel@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kherbst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Nouveau] [PATCH] drm/nouveau/ga102: Free resources on error in
 ga102_chan_new()
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
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

On Mon, Sep 20, 2021 at 8:17 PM Tim Gardner <tim.gardner@canonical.com> wrote:
>
> Coverity complains of a resource leak in ga102_chan_new():
>
> CID 119637 (#7 of 7): Resource leak (RESOURCE_LEAK)
> 13. leaked_storage: Variable chan going out of scope leaks the storage it points to.
> 190                return ret;
>
> Fix this by freeing 'chan' in the error path.
>

yeah, this is actually a false positive. I ran your patch through
kasan and got a use-after-free as we deallocate the passed in pointer
after calling the function pointer to the new function. One might
argue that the programming style isn't the best and we should be
explicit about freeing memory though.

> Cc: Ben Skeggs <bskeggs@redhat.com>
> Cc: David Airlie <airlied@linux.ie>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: Karol Herbst <kherbst@redhat.com>
> Cc: dri-devel@lists.freedesktop.org
> Cc: nouveau@lists.freedesktop.org
> Cc: linux-kernel@vger.kernel.org
> Signed-off-by: Tim Gardner <tim.gardner@canonical.com>
> ---
>  .../gpu/drm/nouveau/nvkm/engine/fifo/ga102.c  | 20 ++++++++++++-------
>  1 file changed, 13 insertions(+), 7 deletions(-)
>
> diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/fifo/ga102.c b/drivers/gpu/drm/nouveau/nvkm/engine/fifo/ga102.c
> index f897bef13acf..4dbdfb53e65f 100644
> --- a/drivers/gpu/drm/nouveau/nvkm/engine/fifo/ga102.c
> +++ b/drivers/gpu/drm/nouveau/nvkm/engine/fifo/ga102.c
> @@ -175,19 +175,21 @@ ga102_chan_new(struct nvkm_device *device,
>                 }
>         }
>
> -       if (!chan->ctrl.runl)
> -               return -ENODEV;
> +       if (!chan->ctrl.runl) {
> +               ret = -ENODEV;
> +               goto free_chan;
> +       }
>
>         chan->ctrl.chan = nvkm_rd32(device, chan->ctrl.runl + 0x004) & 0xfffffff0;
>         args->token = nvkm_rd32(device, chan->ctrl.runl + 0x008) & 0xffff0000;
>
>         ret = nvkm_memory_new(device, NVKM_MEM_TARGET_INST, 0x1000, 0x1000, true, &chan->mthd);
>         if (ret)
> -               return ret;
> +               goto free_chan;
>
>         ret = nvkm_memory_new(device, NVKM_MEM_TARGET_INST, 0x1000, 0x1000, true, &chan->inst);
>         if (ret)
> -               return ret;
> +               goto free_chan;
>
>         nvkm_kmap(chan->inst);
>         nvkm_wo32(chan->inst, 0x010, 0x0000face);
> @@ -209,11 +211,11 @@ ga102_chan_new(struct nvkm_device *device,
>
>         ret = nvkm_memory_new(device, NVKM_MEM_TARGET_INST, 0x1000, 0x1000, true, &chan->user);
>         if (ret)
> -               return ret;
> +               goto free_chan;
>
>         ret = nvkm_memory_new(device, NVKM_MEM_TARGET_INST, 0x1000, 0x1000, true, &chan->runl);
>         if (ret)
> -               return ret;
> +               goto free_chan;
>
>         nvkm_kmap(chan->runl);
>         nvkm_wo32(chan->runl, 0x00, 0x80030001);
> @@ -228,10 +230,14 @@ ga102_chan_new(struct nvkm_device *device,
>
>         ret = nvkm_vmm_join(vmm, chan->inst);
>         if (ret)
> -               return ret;
> +               goto free_chan;
>
>         chan->vmm = nvkm_vmm_ref(vmm);
>         return 0;
> +
> +free_chan:
> +       kfree(chan);
> +       return ret;
>  }
>
>  static const struct nvkm_device_oclass
> --
> 2.33.0
>

