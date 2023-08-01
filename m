Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E5B5176AE4F
	for <lists+nouveau@lfdr.de>; Tue,  1 Aug 2023 11:37:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A8C510E383;
	Tue,  1 Aug 2023 09:37:48 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9EBAF10E37B
 for <nouveau@lists.freedesktop.org>; Tue,  1 Aug 2023 09:37:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1690882664;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vOvZgebHhV2X/IS76eyWQ9bR6nPimMpn+dZuHOTy76Q=;
 b=dahlRYS9w9X8gkE/dp46Fz0s1cZS2PYWpTbL3c/LjcsATnCLorxkqINAIeb27kKOA3V7lK
 WDyiD402RDfUb8VwKA5UKQ3prUFOL0yjmnm5yosIiKoGguD3Oo9T4/sO6jqBRIP02R2pO3
 aOKfWHMXqTzGlBSVPiaF9lOhEPq/YcE=
Received: from mail-lj1-f200.google.com (mail-lj1-f200.google.com
 [209.85.208.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-550-VIw9_eiKP4K24i9HKBjdRA-1; Tue, 01 Aug 2023 05:37:43 -0400
X-MC-Unique: VIw9_eiKP4K24i9HKBjdRA-1
Received: by mail-lj1-f200.google.com with SMTP id
 38308e7fff4ca-2b6fdb8d0acso10494521fa.0
 for <nouveau@lists.freedesktop.org>; Tue, 01 Aug 2023 02:37:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690882662; x=1691487462;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=vOvZgebHhV2X/IS76eyWQ9bR6nPimMpn+dZuHOTy76Q=;
 b=BmSIqh4vH6fD42EzJMeZS2KntQjR7OXW1DA/T9Jkb4z0oD1GhJgZwPSLUSlGXO7io5
 myouuT05nTytkV4Q2Lbua5bAJCnr6QUpB60Qhbz/Ec9qExwT+PYqn/EbGBt7ay6Y1oqH
 2RkOr19yoCIu+Xrqm7aat7dFRXeq8N6hXo3NyMw+83LnGoOdrlQ3SjxvZcN1YCuH9KCL
 AXfX4CoJo7pHXhSh/xgVM7sDzDkI4ogJcVlMcuqUykoshfAZTM5W5NNSPqYFIERjBEwm
 Tso75tD+MzcyT0FqR84bFlbQJxi1aYBDH+3OToi9e+CmMlY2p8f0KOV7XLh1Ivd9rtyY
 Qxpg==
X-Gm-Message-State: ABy/qLbMioCyFWyoW+puLP4YqqTQ3a4g0uxpYp+WoHLUMxsSN1j4ZNpi
 XK7xJpk2xdWjCXtXm0pYDkeRDpAz2WGUhvDcfJOe30Faz8CiTN1eTjIlZqonGR8oaH2JpUwcNoe
 /0vY7HHxmvOZP9gkfpw8Wp+LiiHy5rh6TZlIra/x9+A==
X-Received: by 2002:a2e:bc84:0:b0:2b9:54bd:caed with SMTP id
 h4-20020a2ebc84000000b002b954bdcaedmr6000415ljf.1.1690882661792; 
 Tue, 01 Aug 2023 02:37:41 -0700 (PDT)
X-Google-Smtp-Source: APBJJlHhkiWwGT7vC2QWuh3taZnSoR+s9GN7DTg0C69McemaKSXMKG8Sq8EFza9kx3EhI8MJ9mYhn5qCueXDQVY29ek=
X-Received: by 2002:a2e:bc84:0:b0:2b9:54bd:caed with SMTP id
 h4-20020a2ebc84000000b002b954bdcaedmr6000400ljf.1.1690882661387; Tue, 01 Aug
 2023 02:37:41 -0700 (PDT)
MIME-Version: 1.0
References: <20230731191557.4179175-1-airlied@gmail.com>
In-Reply-To: <20230731191557.4179175-1-airlied@gmail.com>
From: Karol Herbst <kherbst@redhat.com>
Date: Tue, 1 Aug 2023 11:37:30 +0200
Message-ID: <CACO55tuV8A_sLmQ=7yBdmsW7WWGoMs1oLmfszUg+RHW4_P8sNQ@mail.gmail.com>
To: Dave Airlie <airlied@gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Subject: Re: [Nouveau] [PATCH] drm/nouveau: fixup the uapi header file.
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
Cc: nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

On Mon, Jul 31, 2023 at 9:16=E2=80=AFPM Dave Airlie <airlied@gmail.com> wro=
te:
>
> From: Dave Airlie <airlied@redhat.com>
>
> nouveau > 10 years ago had a plan for new multiplexer inside a multiplexe=
r
> API using nvif. It never fully reached fruition, fast forward 10 years,
> and the new vulkan driver is avoiding libdrm and calling ioctls, and
> these 3 ioctls, getparam, channel alloc + free don't seem to be things
> we'd want to use nvif for.
>
> Undeprecate and put them into the uapi header so we can just copy it
> into mesa later.
>
> Signed-off-by: Dave Airlie <airlied@redhat.com>
> ---
>  drivers/gpu/drm/nouveau/nouveau_abi16.h | 41 ---------------------
>  include/uapi/drm/nouveau_drm.h          | 48 +++++++++++++++++++++++--
>  2 files changed, 45 insertions(+), 44 deletions(-)
>
> diff --git a/drivers/gpu/drm/nouveau/nouveau_abi16.h b/drivers/gpu/drm/no=
uveau/nouveau_abi16.h
> index 27eae85f33e6..d5d80d0d9011 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_abi16.h
> +++ b/drivers/gpu/drm/nouveau/nouveau_abi16.h
> @@ -43,28 +43,6 @@ int  nouveau_abi16_usif(struct drm_file *, void *data,=
 u32 size);
>  #define NOUVEAU_GEM_DOMAIN_VRAM      (1 << 1)
>  #define NOUVEAU_GEM_DOMAIN_GART      (1 << 2)
>
> -struct drm_nouveau_channel_alloc {
> -       uint32_t     fb_ctxdma_handle;
> -       uint32_t     tt_ctxdma_handle;
> -
> -       int          channel;
> -       uint32_t     pushbuf_domains;
> -
> -       /* Notifier memory */
> -       uint32_t     notifier_handle;
> -
> -       /* DRM-enforced subchannel assignments */
> -       struct {
> -               uint32_t handle;
> -               uint32_t grclass;
> -       } subchan[8];
> -       uint32_t nr_subchan;
> -};
> -
> -struct drm_nouveau_channel_free {
> -       int channel;
> -};
> -
>  struct drm_nouveau_grobj_alloc {
>         int      channel;
>         uint32_t handle;
> @@ -83,31 +61,12 @@ struct drm_nouveau_gpuobj_free {
>         uint32_t handle;
>  };
>
> -#define NOUVEAU_GETPARAM_PCI_VENDOR      3
> -#define NOUVEAU_GETPARAM_PCI_DEVICE      4
> -#define NOUVEAU_GETPARAM_BUS_TYPE        5
> -#define NOUVEAU_GETPARAM_FB_SIZE         8
> -#define NOUVEAU_GETPARAM_AGP_SIZE        9
> -#define NOUVEAU_GETPARAM_CHIPSET_ID      11
> -#define NOUVEAU_GETPARAM_VM_VRAM_BASE    12
> -#define NOUVEAU_GETPARAM_GRAPH_UNITS     13
> -#define NOUVEAU_GETPARAM_PTIMER_TIME     14
> -#define NOUVEAU_GETPARAM_HAS_BO_USAGE    15
> -#define NOUVEAU_GETPARAM_HAS_PAGEFLIP    16
> -struct drm_nouveau_getparam {
> -       uint64_t param;
> -       uint64_t value;
> -};
> -
>  struct drm_nouveau_setparam {
>         uint64_t param;
>         uint64_t value;
>  };
>
> -#define DRM_IOCTL_NOUVEAU_GETPARAM           DRM_IOWR(DRM_COMMAND_BASE +=
 DRM_NOUVEAU_GETPARAM, struct drm_nouveau_getparam)
>  #define DRM_IOCTL_NOUVEAU_SETPARAM           DRM_IOWR(DRM_COMMAND_BASE +=
 DRM_NOUVEAU_SETPARAM, struct drm_nouveau_setparam)
> -#define DRM_IOCTL_NOUVEAU_CHANNEL_ALLOC      DRM_IOWR(DRM_COMMAND_BASE +=
 DRM_NOUVEAU_CHANNEL_ALLOC, struct drm_nouveau_channel_alloc)
> -#define DRM_IOCTL_NOUVEAU_CHANNEL_FREE       DRM_IOW (DRM_COMMAND_BASE +=
 DRM_NOUVEAU_CHANNEL_FREE, struct drm_nouveau_channel_free)
>  #define DRM_IOCTL_NOUVEAU_GROBJ_ALLOC        DRM_IOW (DRM_COMMAND_BASE +=
 DRM_NOUVEAU_GROBJ_ALLOC, struct drm_nouveau_grobj_alloc)
>  #define DRM_IOCTL_NOUVEAU_NOTIFIEROBJ_ALLOC  DRM_IOWR(DRM_COMMAND_BASE +=
 DRM_NOUVEAU_NOTIFIEROBJ_ALLOC, struct drm_nouveau_notifierobj_alloc)
>  #define DRM_IOCTL_NOUVEAU_GPUOBJ_FREE        DRM_IOW (DRM_COMMAND_BASE +=
 DRM_NOUVEAU_GPUOBJ_FREE, struct drm_nouveau_gpuobj_free)
> diff --git a/include/uapi/drm/nouveau_drm.h b/include/uapi/drm/nouveau_dr=
m.h
> index 853a327433d3..1cd97b3d8eda 100644
> --- a/include/uapi/drm/nouveau_drm.h
> +++ b/include/uapi/drm/nouveau_drm.h
> @@ -33,6 +33,44 @@
>  extern "C" {
>  #endif
>
> +#define NOUVEAU_GETPARAM_PCI_VENDOR      3
> +#define NOUVEAU_GETPARAM_PCI_DEVICE      4
> +#define NOUVEAU_GETPARAM_BUS_TYPE        5
> +#define NOUVEAU_GETPARAM_FB_SIZE         8
> +#define NOUVEAU_GETPARAM_AGP_SIZE        9
> +#define NOUVEAU_GETPARAM_CHIPSET_ID      11
> +#define NOUVEAU_GETPARAM_VM_VRAM_BASE    12
> +#define NOUVEAU_GETPARAM_GRAPH_UNITS     13
> +#define NOUVEAU_GETPARAM_PTIMER_TIME     14
> +#define NOUVEAU_GETPARAM_HAS_BO_USAGE    15
> +#define NOUVEAU_GETPARAM_HAS_PAGEFLIP    16
> +struct drm_nouveau_getparam {
> +       uint64_t param;
> +       uint64_t value;
> +};
> +
> +struct drm_nouveau_channel_alloc {
> +       uint32_t     fb_ctxdma_handle;
> +       uint32_t     tt_ctxdma_handle;
> +
> +       int          channel;
> +       uint32_t     pushbuf_domains;
> +
> +       /* Notifier memory */
> +       uint32_t     notifier_handle;
> +
> +       /* DRM-enforced subchannel assignments */
> +       struct {
> +               uint32_t handle;
> +               uint32_t grclass;
> +       } subchan[8];
> +       uint32_t nr_subchan;
> +};
> +
> +struct drm_nouveau_channel_free {
> +       int channel;
> +};
> +
>  #define NOUVEAU_GEM_DOMAIN_CPU       (1 << 0)
>  #define NOUVEAU_GEM_DOMAIN_VRAM      (1 << 1)
>  #define NOUVEAU_GEM_DOMAIN_GART      (1 << 2)
> @@ -126,10 +164,10 @@ struct drm_nouveau_gem_cpu_fini {
>         __u32 handle;
>  };
>
> -#define DRM_NOUVEAU_GETPARAM           0x00 /* deprecated */
> +#define DRM_NOUVEAU_GETPARAM           0x00
>  #define DRM_NOUVEAU_SETPARAM           0x01 /* deprecated */
> -#define DRM_NOUVEAU_CHANNEL_ALLOC      0x02 /* deprecated */
> -#define DRM_NOUVEAU_CHANNEL_FREE       0x03 /* deprecated */
> +#define DRM_NOUVEAU_CHANNEL_ALLOC      0x02
> +#define DRM_NOUVEAU_CHANNEL_FREE       0x03
>  #define DRM_NOUVEAU_GROBJ_ALLOC        0x04 /* deprecated */
>  #define DRM_NOUVEAU_NOTIFIEROBJ_ALLOC  0x05 /* deprecated */
>  #define DRM_NOUVEAU_GPUOBJ_FREE        0x06 /* deprecated */
> @@ -188,6 +226,10 @@ struct drm_nouveau_svm_bind {
>  #define NOUVEAU_SVM_BIND_TARGET__GPU_VRAM               (1UL << 31)
>
>
> +#define DRM_IOCTL_NOUVEAU_GETPARAM           DRM_IOWR(DRM_COMMAND_BASE +=
 DRM_NOUVEAU_GETPARAM, struct drm_nouveau_getparam)
> +#define DRM_IOCTL_NOUVEAU_CHANNEL_ALLOC      DRM_IOWR(DRM_COMMAND_BASE +=
 DRM_NOUVEAU_CHANNEL_ALLOC, struct drm_nouveau_channel_alloc)
> +#define DRM_IOCTL_NOUVEAU_CHANNEL_FREE       DRM_IOW (DRM_COMMAND_BASE +=
 DRM_NOUVEAU_CHANNEL_FREE, struct drm_nouveau_channel_free)
> +
>  #define DRM_IOCTL_NOUVEAU_SVM_INIT           DRM_IOWR(DRM_COMMAND_BASE +=
 DRM_NOUVEAU_SVM_INIT, struct drm_nouveau_svm_init)
>  #define DRM_IOCTL_NOUVEAU_SVM_BIND           DRM_IOWR(DRM_COMMAND_BASE +=
 DRM_NOUVEAU_SVM_BIND, struct drm_nouveau_svm_bind)
>
> --
> 2.41.0
>

Reviewed-by: Karol Herbst <kherbst@redhat.com>

