Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 17AF33F6493
	for <lists+nouveau@lfdr.de>; Tue, 24 Aug 2021 19:05:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 01F3889FCC;
	Tue, 24 Aug 2021 17:05:38 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0AF4289FCC
 for <nouveau@lists.freedesktop.org>; Tue, 24 Aug 2021 17:05:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1629824736;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=olgu31rPJpOTjKmA0XuNHPckB19mLh5v5zVaEM4u+Ik=;
 b=YmKO9pCAtaQDRZDfawH2Y+1YksH1krnVgvfX4eUtYT0TAjEwsF5xoDAe5HqaL3xZyFIpR7
 MlDJtzi32aKEq0ZTKnXNjRFTw0Gzeiv5VvM89spHC9iI8g6Gs5/fMcdO5T0i+r6vcic4SM
 NdNgK+iCQIgg7XdgSBLjcjRsTZTMJ/c=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-348-_MLq00GfOXW-KMzlhnfqxw-1; Tue, 24 Aug 2021 13:05:34 -0400
X-MC-Unique: _MLq00GfOXW-KMzlhnfqxw-1
Received: by mail-qt1-f199.google.com with SMTP id
 l24-20020ac84a98000000b00298c09593afso10921600qtq.22
 for <nouveau@lists.freedesktop.org>; Tue, 24 Aug 2021 10:05:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:organization:user-agent:mime-version
 :content-transfer-encoding;
 bh=olgu31rPJpOTjKmA0XuNHPckB19mLh5v5zVaEM4u+Ik=;
 b=ICB9rvWpljb2Sj9RiswuUX2la/MQviKeQf6NAe5aKeIUiV+3fnCCYo5RRHVFkFLQlV
 1RvY0212R7ImqwHH0EDrEtP8180FONAfZ9w1MJQmjzEF6FUGbgi4vlkJtILueWSiJLg8
 Z5/sTSm6eL2qMN0SwwOiBmH1Sy8WPzfw10fDnhCZHw5TlnozG8IwUkwRheDJCzUczh5O
 vfukHPQvWXxOLvUsawliIS76gqSZyYO+3YD+7lW2hpBFYwJA1IpyDbwf56HGWIHnDWxr
 K2kSqd4COZ+X+NIWiFpw6t2fpfDfaiVKxMqVxtzO7a6UWftGnuJ/+xKAuPvxi56cslFT
 93lQ==
X-Gm-Message-State: AOAM530tSHaqv5rz8i4S9fOqNcmxhTK6k0VCigb/WDQtIL1AG4pum11s
 eI5uBQiHIRbwI+4+ULv6BGLrXMIAjZqVDD5UczSMg8DcBtI55ie/jZupIHPOsAyLN+w1TyXK1tz
 CZNlP4ckyFSzAnQ1lh65OHG6P9g==
X-Received: by 2002:a05:620a:4092:: with SMTP id
 f18mr8019841qko.91.1629824734238; 
 Tue, 24 Aug 2021 10:05:34 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxajLXqKsquojFZCdfXxxcf5UjL2aIS6hN3ktbx8HCAz+n/TGk51Sc0c7p6Ra/u9YDvfBY57w==
X-Received: by 2002:a05:620a:4092:: with SMTP id
 f18mr8019822qko.91.1629824734045; 
 Tue, 24 Aug 2021 10:05:34 -0700 (PDT)
Received: from [192.168.8.104] (pool-108-49-102-102.bstnma.fios.verizon.net.
 [108.49.102.102])
 by smtp.gmail.com with ESMTPSA id y67sm11309477qkd.58.2021.08.24.10.05.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 Aug 2021 10:05:33 -0700 (PDT)
Message-ID: <75ccbdea6e8871856002edb75dff1a32822a5a89.camel@redhat.com>
From: Lyude Paul <lyude@redhat.com>
To: Sasha Levin <sashal@kernel.org>, linux-kernel@vger.kernel.org, 
 stable@vger.kernel.org
Cc: Ben Skeggs <bskeggs@redhat.com>, dri-devel@lists.freedesktop.org, 
 nouveau@lists.freedesktop.org
Date: Tue, 24 Aug 2021 13:05:32 -0400
In-Reply-To: <20210824005528.631702-6-sashal@kernel.org>
References: <20210824005528.631702-1-sashal@kernel.org>
 <20210824005528.631702-6-sashal@kernel.org>
Organization: Red Hat
User-Agent: Evolution 3.40.4 (3.40.4-1.fc34)
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lyude@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Subject: Re: [Nouveau] [PATCH AUTOSEL 4.14 6/7] drm/nouveau: block a bunch
 of classes from userspace
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

This isn't at all intended to be a fix to be backported, so I don't think this
should be included. I don't know about 5/7, but I'll let Benjamin comment on
that one

On Mon, 2021-08-23 at 20:55 -0400, Sasha Levin wrote:
> From: Ben Skeggs <bskeggs@redhat.com>
> 
> [ Upstream commit 148a8653789c01f159764ffcc3f370008966b42f ]
> 
> Long ago, there had been plans for making use of a bunch of these APIs
> from userspace and there's various checks in place to stop misbehaving.
> 
> Countless other projects have occurred in the meantime, and the pieces
> didn't finish falling into place for that to happen.
> 
> They will (hopefully) in the not-too-distant future, but it won't look
> quite as insane.  The super checks are causing problems right now, and
> are going to be removed.
> 
> Signed-off-by: Ben Skeggs <bskeggs@redhat.com>
> Reviewed-by: Lyude Paul <lyude@redhat.com>
> Signed-off-by: Sasha Levin <sashal@kernel.org>
> ---
>  drivers/gpu/drm/nouveau/include/nvif/cl0080.h |  3 +-
>  drivers/gpu/drm/nouveau/nouveau_drm.c         |  1 +
>  drivers/gpu/drm/nouveau/nouveau_usif.c        | 57 ++++++++++++++-----
>  .../gpu/drm/nouveau/nvkm/engine/device/user.c |  2 +-
>  4 files changed, 48 insertions(+), 15 deletions(-)
> 
> diff --git a/drivers/gpu/drm/nouveau/include/nvif/cl0080.h
> b/drivers/gpu/drm/nouveau/include/nvif/cl0080.h
> index 2740278d226b..61c17acd507c 100644
> --- a/drivers/gpu/drm/nouveau/include/nvif/cl0080.h
> +++ b/drivers/gpu/drm/nouveau/include/nvif/cl0080.h
> @@ -4,7 +4,8 @@
>  
>  struct nv_device_v0 {
>         __u8  version;
> -       __u8  pad01[7];
> +       __u8  priv;
> +       __u8  pad02[6];
>         __u64 device;   /* device identifier, ~0 for client default */
>  };
>  
> diff --git a/drivers/gpu/drm/nouveau/nouveau_drm.c
> b/drivers/gpu/drm/nouveau/nouveau_drm.c
> index fb6b1d0f7fef..fc54a26598cc 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_drm.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_drm.c
> @@ -151,6 +151,7 @@ nouveau_cli_init(struct nouveau_drm *drm, const char
> *sname,
>         ret = nvif_device_init(&cli->base.object, 0, NV_DEVICE,
>                                &(struct nv_device_v0) {
>                                         .device = ~0,
> +                                       .priv = true,
>                                }, sizeof(struct nv_device_v0),
>                                &cli->device);
>         if (ret) {
> diff --git a/drivers/gpu/drm/nouveau/nouveau_usif.c
> b/drivers/gpu/drm/nouveau/nouveau_usif.c
> index 9dc10b17ad34..5da1f4d223d7 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_usif.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_usif.c
> @@ -32,6 +32,9 @@
>  #include <nvif/event.h>
>  #include <nvif/ioctl.h>
>  
> +#include <nvif/class.h>
> +#include <nvif/cl0080.h>
> +
>  struct usif_notify_p {
>         struct drm_pending_event base;
>         struct {
> @@ -261,7 +264,7 @@ usif_object_dtor(struct usif_object *object)
>  }
>  
>  static int
> -usif_object_new(struct drm_file *f, void *data, u32 size, void *argv, u32
> argc)
> +usif_object_new(struct drm_file *f, void *data, u32 size, void *argv, u32
> argc, bool parent_abi16)
>  {
>         struct nouveau_cli *cli = nouveau_cli(f);
>         struct nvif_client *client = &cli->base;
> @@ -271,23 +274,48 @@ usif_object_new(struct drm_file *f, void *data, u32
> size, void *argv, u32 argc)
>         struct usif_object *object;
>         int ret = -ENOSYS;
>  
> +       if ((ret = nvif_unpack(ret, &data, &size, args->v0, 0, 0, true)))
> +               return ret;
> +
> +       switch (args->v0.oclass) {
> +       case NV_DMA_FROM_MEMORY:
> +       case NV_DMA_TO_MEMORY:
> +       case NV_DMA_IN_MEMORY:
> +               return -EINVAL;
> +       case NV_DEVICE: {
> +               union {
> +                       struct nv_device_v0 v0;
> +               } *args = data;
> +
> +               if ((ret = nvif_unpack(ret, &data, &size, args->v0, 0, 0,
> false)))
> +                       return ret;
> +
> +               args->v0.priv = false;
> +               break;
> +       }
> +       default:
> +               if (!parent_abi16)
> +                       return -EINVAL;
> +               break;
> +       }
> +
>         if (!(object = kmalloc(sizeof(*object), GFP_KERNEL)))
>                 return -ENOMEM;
>         list_add(&object->head, &cli->objects);
>  
> -       if (!(ret = nvif_unpack(ret, &data, &size, args->v0, 0, 0, true))) {
> -               object->route = args->v0.route;
> -               object->token = args->v0.token;
> -               args->v0.route = NVDRM_OBJECT_USIF;
> -               args->v0.token = (unsigned long)(void *)object;
> -               ret = nvif_client_ioctl(client, argv, argc);
> -               args->v0.token = object->token;
> -               args->v0.route = object->route;
> +       object->route = args->v0.route;
> +       object->token = args->v0.token;
> +       args->v0.route = NVDRM_OBJECT_USIF;
> +       args->v0.token = (unsigned long)(void *)object;
> +       ret = nvif_client_ioctl(client, argv, argc);
> +       if (ret) {
> +               usif_object_dtor(object);
> +               return ret;
>         }
>  
> -       if (ret)
> -               usif_object_dtor(object);
> -       return ret;
> +       args->v0.token = object->token;
> +       args->v0.route = object->route;
> +       return 0;
>  }
>  
>  int
> @@ -301,6 +329,7 @@ usif_ioctl(struct drm_file *filp, void __user *user, u32
> argc)
>                 struct nvif_ioctl_v0 v0;
>         } *argv = data;
>         struct usif_object *object;
> +       bool abi16 = false;
>         u8 owner;
>         int ret;
>  
> @@ -331,11 +360,13 @@ usif_ioctl(struct drm_file *filp, void __user *user,
> u32 argc)
>                         mutex_unlock(&cli->mutex);
>                         goto done;
>                 }
> +
> +               abi16 = true;
>         }
>  
>         switch (argv->v0.type) {
>         case NVIF_IOCTL_V0_NEW:
> -               ret = usif_object_new(filp, data, size, argv, argc);
> +               ret = usif_object_new(filp, data, size, argv, argc, abi16);
>                 break;
>         case NVIF_IOCTL_V0_NTFY_NEW:
>                 ret = usif_notify_new(filp, data, size, argv, argc);
> diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/device/user.c
> b/drivers/gpu/drm/nouveau/nvkm/engine/device/user.c
> index 513ee6b79553..08100eed9584 100644
> --- a/drivers/gpu/drm/nouveau/nvkm/engine/device/user.c
> +++ b/drivers/gpu/drm/nouveau/nvkm/engine/device/user.c
> @@ -347,7 +347,7 @@ nvkm_udevice_new(const struct nvkm_oclass *oclass, void
> *data, u32 size,
>                 return ret;
>  
>         /* give priviledged clients register access */
> -       if (client->super)
> +       if (args->v0.priv)
>                 func = &nvkm_udevice_super;
>         else
>                 func = &nvkm_udevice;

-- 
Cheers,
 Lyude Paul (she/her)
 Software Engineer at Red Hat

