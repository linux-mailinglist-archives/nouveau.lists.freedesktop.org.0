Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DE5AE443DD6
	for <lists+nouveau@lfdr.de>; Wed,  3 Nov 2021 08:51:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD4F573303;
	Wed,  3 Nov 2021 07:51:40 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BBF3F73302
 for <nouveau@lists.freedesktop.org>; Wed,  3 Nov 2021 07:51:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635925898;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=irWXlZxDylOk4IvQ4TmBV6Sa70wcpbNEWa+s/Ek+9WE=;
 b=NOmYR8/+C5MRneTan2rIPXvEv7jywbisyj73wrmTO/JtdjQLRmEf0bXQJ6/8FPwpSmkeaI
 B77it5Dtnt0NPXqazwj1CtuCre1LzOR8KB0fuWa7GixxJh+23PwmyspRB7R5sEhSstU+z/
 fmdEy2Q77O6JgSfrtPG1EVHVekrfZis=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-166-F2gl-jibMFKtASDSmny2sQ-1; Wed, 03 Nov 2021 03:51:35 -0400
X-MC-Unique: F2gl-jibMFKtASDSmny2sQ-1
Received: by mail-wm1-f69.google.com with SMTP id
 b133-20020a1c808b000000b0032cdd691994so2372063wmd.1
 for <nouveau@lists.freedesktop.org>; Wed, 03 Nov 2021 00:51:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=irWXlZxDylOk4IvQ4TmBV6Sa70wcpbNEWa+s/Ek+9WE=;
 b=x3xvabfXrb+6xOBL63qyEkl6YVO3jcPcZ3t3Vyps/IDQpgxMNTuADQ515sNs2ibVbE
 8MeTamFEf05HGxiaFSGDprKQk2gKSvgoAixcapWotfZoZGKsOjkUqAgaJSdmZ/OgqkFt
 wp2oq54WB2y6B4qGawsgfY/uZ9bw1duFFPSAE9qqDxPsRr0CgrFgDraz5ixR1KCWEeJs
 JgnKvz7f0UGasP+m8NvuSwtZbWpFn5DlEeCvq1DCmlUv0kwrGJOZQ+3KeBfRUfRz88Ig
 O1Po9b8rGmbdrO4GG2EsrBnsKlOW5jXXqerGSwZ/jFUfqYga8aIUvGeuaVAYvqFHpMlu
 Oz4w==
X-Gm-Message-State: AOAM5328MyRrKypYzASzUfiyqo/iJ+sF0Zr52iHqspTmUuQnnqd5um0z
 /8JyQTOvz4SE3z5GbIRIkmeW4K/Brxc4cVQkMHCJS88cycNnJADE7/E+VYsQIr1vWL/g55Sic7S
 a78J6/SyD79UtUtOpaE+jjMO/kn/b0enBtP/OGFl4vw==
X-Received: by 2002:a05:6000:144c:: with SMTP id
 v12mr53633348wrx.142.1635925894214; 
 Wed, 03 Nov 2021 00:51:34 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzxUsEwlf2IYsDc3CXkiOwdsadyc5FEF0ZwMlAnAzju5XqXgEiKwXC/8wyvlIvOkO8Ya2PuD+3uWdV96nEjcBE=
X-Received: by 2002:a05:6000:144c:: with SMTP id
 v12mr53633334wrx.142.1635925894058; 
 Wed, 03 Nov 2021 00:51:34 -0700 (PDT)
MIME-Version: 1.0
References: <20211103011057.15344-1-skeggsb@gmail.com>
In-Reply-To: <20211103011057.15344-1-skeggsb@gmail.com>
From: Karol Herbst <kherbst@redhat.com>
Date: Wed, 3 Nov 2021 08:51:23 +0100
Message-ID: <CACO55tvy5atSW9SJw1E_wmfgn1cZpDiZ2T7VuS35UGXRVdpEaw@mail.gmail.com>
To: Ben Skeggs <skeggsb@gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kherbst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Nouveau] [PATCH] ce/gf100: fix incorrect CE0 address
 calculation on some GPUs
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
Cc: nouveau <nouveau@lists.freedesktop.org>, Ben Skeggs <bskeggs@redhat.com>,
 stable@vger.kernel.org
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

On Wed, Nov 3, 2021 at 2:11 AM Ben Skeggs <skeggsb@gmail.com> wrote:
>
> From: Ben Skeggs <bskeggs@redhat.com>
>
> The code which constructs the modules for each engine present on the GPU
> passes -1 for 'instance' on non-instanced engines, which affects how the
> name for a sub-device is generated.  This is then stored as 'instance 0'
> in nvkm_subdev.inst, so code can potentially be shared with earlier GPUs
> that only had a single instance of an engine.
>
> However, GF100's CE constructor uses this value to calculate the address
> of its falcon before it's translated, resulting in CE0 getting the wrong
> address.
>
> This slightly modifies the approach, always passing a valid instance for
> engines that *can* have multiple copies, and having the code for earlier
> GPUs explicitly ask for non-instanced name generation.
>
> Bug: https://gitlab.freedesktop.org/drm/nouveau/-/issues/91
>
> Fixes: 50551b15c760 ("drm/nouveau/ce: switch to instanced constructor")
> Cc: <stable@vger.kernel.org> # v5.12+
> Signed-off-by: Ben Skeggs <bskeggs@redhat.com>
> ---
>  drivers/gpu/drm/nouveau/nvkm/engine/ce/gt215.c    | 2 +-
>  drivers/gpu/drm/nouveau/nvkm/engine/device/base.c | 3 +--
>  2 files changed, 2 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/ce/gt215.c b/drivers/gpu/drm/nouveau/nvkm/engine/ce/gt215.c
> index 704df0f2d1f1..09a112af2f89 100644
> --- a/drivers/gpu/drm/nouveau/nvkm/engine/ce/gt215.c
> +++ b/drivers/gpu/drm/nouveau/nvkm/engine/ce/gt215.c
> @@ -78,6 +78,6 @@ int
>  gt215_ce_new(struct nvkm_device *device, enum nvkm_subdev_type type, int inst,
>              struct nvkm_engine **pengine)
>  {
> -       return nvkm_falcon_new_(&gt215_ce, device, type, inst,
> +       return nvkm_falcon_new_(&gt215_ce, device, type, -1,
>                                 (device->chipset != 0xaf), 0x104000, pengine);
>  }
> diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/device/base.c b/drivers/gpu/drm/nouveau/nvkm/engine/device/base.c
> index ca75c5f6ecaf..b51d690f375f 100644
> --- a/drivers/gpu/drm/nouveau/nvkm/engine/device/base.c
> +++ b/drivers/gpu/drm/nouveau/nvkm/engine/device/base.c
> @@ -3147,8 +3147,7 @@ nvkm_device_ctor(const struct nvkm_device_func *func,
>         WARN_ON(device->chip->ptr.inst & ~((1 << ARRAY_SIZE(device->ptr)) - 1));             \
>         for (j = 0; device->chip->ptr.inst && j < ARRAY_SIZE(device->ptr); j++) {            \
>                 if ((device->chip->ptr.inst & BIT(j)) && (subdev_mask & BIT_ULL(type))) {    \
> -                       int inst = (device->chip->ptr.inst == 1) ? -1 : (j);                 \
> -                       ret = device->chip->ptr.ctor(device, (type), inst, &device->ptr[j]); \
> +                       ret = device->chip->ptr.ctor(device, (type), (j), &device->ptr[j]);  \
>                         subdev = nvkm_device_subdev(device, (type), (j));                    \
>                         if (ret) {                                                           \
>                                 nvkm_subdev_del(&subdev);                                    \
> --
> 2.31.1
>

Reviewed-by: Karol Herbst <kherbst@redhat.com>

