Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D53166881A
	for <lists+nouveau@lfdr.de>; Fri, 13 Jan 2023 01:08:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A61B910E96D;
	Fri, 13 Jan 2023 00:08:23 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6BB5910E96D
 for <nouveau@lists.freedesktop.org>; Fri, 13 Jan 2023 00:08:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1673568500;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=p2cO1wKbX3TvwZAzMCAQ2O32nWT2kMj1ms6I+jy1HIc=;
 b=f1pCC6AtRqFmvlYrCMIwpmtW2+s9Bs01wT/oA3LZR6BaWQ/O5dZivXUE6NxJj44hSho88O
 r/9OWSkU2x/QA9Eu1SZyb9ResFpwIVwtV65CF7tZZQrO9u0gXOUfDAB1a4sprEaei8j7Yo
 M5iLAiB35fd20TP4/LsLdQdvwnlFjmw=
Received: from mail-lf1-f71.google.com (mail-lf1-f71.google.com
 [209.85.167.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-91-xFKnxbMaMqW_Cg4xav6WBg-1; Thu, 12 Jan 2023 19:07:18 -0500
X-MC-Unique: xFKnxbMaMqW_Cg4xav6WBg-1
Received: by mail-lf1-f71.google.com with SMTP id
 a20-20020ac25214000000b004b57756f937so7524445lfl.3
 for <nouveau@lists.freedesktop.org>; Thu, 12 Jan 2023 16:07:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=p2cO1wKbX3TvwZAzMCAQ2O32nWT2kMj1ms6I+jy1HIc=;
 b=m79BNrgr8WOSb0U2KopvZh6dVme5qApm9CkNmkdP/kJkLGH1YDx27Uakc2whu52G2g
 Thi8HbkSUcw4v/jR7+O/y9CXhO2kpOtexZ9ZfraeK4IKkBp88l2nJahCc5zWmz2nZ6dL
 RJOaUbCOgqBBVybV1JnQoyFs4yzxOl+o+4Hakqu0v8tReEbMBE/QIEI3eCG+IF1X20LB
 cLsVR8C20tusyk9hdXAAEoZ6YaNqu3396VeBixiTi77Ls8LBcV7fIk1pOJRIA1C3Zsid
 +gM3WFwfE9bnLROo4ZwDcZZh61OtXihpNPVvwXiD0OI7jal4gFo7L6Gd5JwWJv0qR+Xg
 OnRA==
X-Gm-Message-State: AFqh2kpa9MQ5kbprLY8YcIXWI5XFVSYiTUHZrRcz8H+22RTq16fPOyIE
 KkwthAXRgSR3aK4oW398+Ok6je32fOpRLHgxugSeFYe+FoNXMDbGhoZWTuFmZ2hT/dOFSCceRmV
 ZwJOQgMAqW5srpSxkK8dWiZ+TIBOQSzBFaXpRS7GmNQ==
X-Received: by 2002:a05:6512:4db:b0:4b5:9d87:14f6 with SMTP id
 w27-20020a05651204db00b004b59d8714f6mr7795197lfq.117.1673568434531; 
 Thu, 12 Jan 2023 16:07:14 -0800 (PST)
X-Google-Smtp-Source: AMrXdXsTWpo1wW26DwcUuz9LybelGGMdgSVX31Xcl1dpvO+Y93RPYOquBKbMQ+ckwBuQxXhYcTqQelvPYV65eUsdKN4=
X-Received: by 2002:a05:6512:4db:b0:4b5:9d87:14f6 with SMTP id
 w27-20020a05651204db00b004b59d8714f6mr7795190lfq.117.1673568434219; Thu, 12
 Jan 2023 16:07:14 -0800 (PST)
MIME-Version: 1.0
References: <20230112133858.17087-1-tzimmermann@suse.de>
In-Reply-To: <20230112133858.17087-1-tzimmermann@suse.de>
From: Karol Herbst <kherbst@redhat.com>
Date: Fri, 13 Jan 2023 01:07:02 +0100
Message-ID: <CACO55tvBPS9yYM_TdijN0EddsLW69FXgURpXo9_LBT3xh_4a9A@mail.gmail.com>
To: Thomas Zimmermann <tzimmermann@suse.de>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Nouveau] [PATCH] drm/nouveau: Remove support for legacy
 contexts/buffers
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
Cc: nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, bskeggs@redhat.com,
 daniel@ffwll.ch
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

On Thu, Jan 12, 2023 at 2:39 PM Thomas Zimmermann <tzimmermann@suse.de> wrote:
>
> Remove nouveau's support for legacy contexts and buffers. It was
> required by libdrm earlier than 2.4.33, released in March 2012. A
> previous attempt in 2013 to remove the functionality [1] had to be
> reverted [2] as there were still users left. Libdrm 2.4.33 is now
> almost 11 years old and it is time for userspace to move on.
>
> With the nouveau code gone, we can also remove the driver-feature
> bit DRIVER_KMS_LEGACY_CONTEXT.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Link: https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=7c510133d93dd6f15ca040733ba7b2891ed61fd1 # 1
> Link: https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=c21eb21cb50d58e7cbdcb8b9e7ff68b85cfa5095 # 2

Reviewed-by: Karol Herbst <kherbst@redhat.com>

let's hope there are no users left :)


> ---
>  drivers/gpu/drm/drm_bufs.c            | 12 +++------
>  drivers/gpu/drm/drm_context.c         | 36 +++++++++------------------
>  drivers/gpu/drm/nouveau/Kconfig       | 12 ---------
>  drivers/gpu/drm/nouveau/nouveau_drm.c | 10 +++-----
>  include/drm/drm_drv.h                 |  7 ------
>  5 files changed, 19 insertions(+), 58 deletions(-)
>
> diff --git a/drivers/gpu/drm/drm_bufs.c b/drivers/gpu/drm/drm_bufs.c
> index fcca21e8efac..86700560fea2 100644
> --- a/drivers/gpu/drm/drm_bufs.c
> +++ b/drivers/gpu/drm/drm_bufs.c
> @@ -423,8 +423,7 @@ int drm_legacy_addmap_ioctl(struct drm_device *dev, void *data,
>         if (!(capable(CAP_SYS_ADMIN) || map->type == _DRM_AGP || map->type == _DRM_SHM))
>                 return -EPERM;
>
> -       if (!drm_core_check_feature(dev, DRIVER_KMS_LEGACY_CONTEXT) &&
> -           !drm_core_check_feature(dev, DRIVER_LEGACY))
> +       if (!drm_core_check_feature(dev, DRIVER_LEGACY))
>                 return -EOPNOTSUPP;
>
>         err = drm_addmap_core(dev, map->offset, map->size, map->type,
> @@ -469,8 +468,7 @@ int drm_legacy_getmap_ioctl(struct drm_device *dev, void *data,
>         int idx;
>         int i;
>
> -       if (!drm_core_check_feature(dev, DRIVER_KMS_LEGACY_CONTEXT) &&
> -           !drm_core_check_feature(dev, DRIVER_LEGACY))
> +       if (!drm_core_check_feature(dev, DRIVER_LEGACY))
>                 return -EOPNOTSUPP;
>
>         idx = map->offset;
> @@ -570,8 +568,7 @@ EXPORT_SYMBOL(drm_legacy_rmmap_locked);
>
>  void drm_legacy_rmmap(struct drm_device *dev, struct drm_local_map *map)
>  {
> -       if (!drm_core_check_feature(dev, DRIVER_KMS_LEGACY_CONTEXT) &&
> -           !drm_core_check_feature(dev, DRIVER_LEGACY))
> +       if (!drm_core_check_feature(dev, DRIVER_LEGACY))
>                 return;
>
>         mutex_lock(&dev->struct_mutex);
> @@ -628,8 +625,7 @@ int drm_legacy_rmmap_ioctl(struct drm_device *dev, void *data,
>         struct drm_map_list *r_list;
>         int ret;
>
> -       if (!drm_core_check_feature(dev, DRIVER_KMS_LEGACY_CONTEXT) &&
> -           !drm_core_check_feature(dev, DRIVER_LEGACY))
> +       if (!drm_core_check_feature(dev, DRIVER_LEGACY))
>                 return -EOPNOTSUPP;
>
>         mutex_lock(&dev->struct_mutex);
> diff --git a/drivers/gpu/drm/drm_context.c b/drivers/gpu/drm/drm_context.c
> index c6e6a3e7219a..a0fc779e5e1e 100644
> --- a/drivers/gpu/drm/drm_context.c
> +++ b/drivers/gpu/drm/drm_context.c
> @@ -59,8 +59,7 @@ struct drm_ctx_list {
>   */
>  void drm_legacy_ctxbitmap_free(struct drm_device * dev, int ctx_handle)
>  {
> -       if (!drm_core_check_feature(dev, DRIVER_KMS_LEGACY_CONTEXT) &&
> -           !drm_core_check_feature(dev, DRIVER_LEGACY))
> +       if (!drm_core_check_feature(dev, DRIVER_LEGACY))
>                 return;
>
>         mutex_lock(&dev->struct_mutex);
> @@ -97,8 +96,7 @@ static int drm_legacy_ctxbitmap_next(struct drm_device * dev)
>   */
>  void drm_legacy_ctxbitmap_init(struct drm_device * dev)
>  {
> -       if (!drm_core_check_feature(dev, DRIVER_KMS_LEGACY_CONTEXT) &&
> -           !drm_core_check_feature(dev, DRIVER_LEGACY))
> +       if (!drm_core_check_feature(dev, DRIVER_LEGACY))
>                 return;
>
>         idr_init(&dev->ctx_idr);
> @@ -114,8 +112,7 @@ void drm_legacy_ctxbitmap_init(struct drm_device * dev)
>   */
>  void drm_legacy_ctxbitmap_cleanup(struct drm_device * dev)
>  {
> -       if (!drm_core_check_feature(dev, DRIVER_KMS_LEGACY_CONTEXT) &&
> -           !drm_core_check_feature(dev, DRIVER_LEGACY))
> +       if (!drm_core_check_feature(dev, DRIVER_LEGACY))
>                 return;
>
>         mutex_lock(&dev->struct_mutex);
> @@ -136,8 +133,7 @@ void drm_legacy_ctxbitmap_flush(struct drm_device *dev, struct drm_file *file)
>  {
>         struct drm_ctx_list *pos, *tmp;
>
> -       if (!drm_core_check_feature(dev, DRIVER_KMS_LEGACY_CONTEXT) &&
> -           !drm_core_check_feature(dev, DRIVER_LEGACY))
> +       if (!drm_core_check_feature(dev, DRIVER_LEGACY))
>                 return;
>
>         mutex_lock(&dev->ctxlist_mutex);
> @@ -182,8 +178,7 @@ int drm_legacy_getsareactx(struct drm_device *dev, void *data,
>         struct drm_local_map *map;
>         struct drm_map_list *_entry;
>
> -       if (!drm_core_check_feature(dev, DRIVER_KMS_LEGACY_CONTEXT) &&
> -           !drm_core_check_feature(dev, DRIVER_LEGACY))
> +       if (!drm_core_check_feature(dev, DRIVER_LEGACY))
>                 return -EOPNOTSUPP;
>
>         mutex_lock(&dev->struct_mutex);
> @@ -230,8 +225,7 @@ int drm_legacy_setsareactx(struct drm_device *dev, void *data,
>         struct drm_local_map *map = NULL;
>         struct drm_map_list *r_list = NULL;
>
> -       if (!drm_core_check_feature(dev, DRIVER_KMS_LEGACY_CONTEXT) &&
> -           !drm_core_check_feature(dev, DRIVER_LEGACY))
> +       if (!drm_core_check_feature(dev, DRIVER_LEGACY))
>                 return -EOPNOTSUPP;
>
>         mutex_lock(&dev->struct_mutex);
> @@ -335,8 +329,7 @@ int drm_legacy_resctx(struct drm_device *dev, void *data,
>         struct drm_ctx ctx;
>         int i;
>
> -       if (!drm_core_check_feature(dev, DRIVER_KMS_LEGACY_CONTEXT) &&
> -           !drm_core_check_feature(dev, DRIVER_LEGACY))
> +       if (!drm_core_check_feature(dev, DRIVER_LEGACY))
>                 return -EOPNOTSUPP;
>
>         if (res->count >= DRM_RESERVED_CONTEXTS) {
> @@ -370,8 +363,7 @@ int drm_legacy_addctx(struct drm_device *dev, void *data,
>         struct drm_ctx *ctx = data;
>         int tmp_handle;
>
> -       if (!drm_core_check_feature(dev, DRIVER_KMS_LEGACY_CONTEXT) &&
> -           !drm_core_check_feature(dev, DRIVER_LEGACY))
> +       if (!drm_core_check_feature(dev, DRIVER_LEGACY))
>                 return -EOPNOTSUPP;
>
>         tmp_handle = drm_legacy_ctxbitmap_next(dev);
> @@ -419,8 +411,7 @@ int drm_legacy_getctx(struct drm_device *dev, void *data,
>  {
>         struct drm_ctx *ctx = data;
>
> -       if (!drm_core_check_feature(dev, DRIVER_KMS_LEGACY_CONTEXT) &&
> -           !drm_core_check_feature(dev, DRIVER_LEGACY))
> +       if (!drm_core_check_feature(dev, DRIVER_LEGACY))
>                 return -EOPNOTSUPP;
>
>         /* This is 0, because we don't handle any context flags */
> @@ -445,8 +436,7 @@ int drm_legacy_switchctx(struct drm_device *dev, void *data,
>  {
>         struct drm_ctx *ctx = data;
>
> -       if (!drm_core_check_feature(dev, DRIVER_KMS_LEGACY_CONTEXT) &&
> -           !drm_core_check_feature(dev, DRIVER_LEGACY))
> +       if (!drm_core_check_feature(dev, DRIVER_LEGACY))
>                 return -EOPNOTSUPP;
>
>         DRM_DEBUG("%d\n", ctx->handle);
> @@ -469,8 +459,7 @@ int drm_legacy_newctx(struct drm_device *dev, void *data,
>  {
>         struct drm_ctx *ctx = data;
>
> -       if (!drm_core_check_feature(dev, DRIVER_KMS_LEGACY_CONTEXT) &&
> -           !drm_core_check_feature(dev, DRIVER_LEGACY))
> +       if (!drm_core_check_feature(dev, DRIVER_LEGACY))
>                 return -EOPNOTSUPP;
>
>         DRM_DEBUG("%d\n", ctx->handle);
> @@ -495,8 +484,7 @@ int drm_legacy_rmctx(struct drm_device *dev, void *data,
>  {
>         struct drm_ctx *ctx = data;
>
> -       if (!drm_core_check_feature(dev, DRIVER_KMS_LEGACY_CONTEXT) &&
> -           !drm_core_check_feature(dev, DRIVER_LEGACY))
> +       if (!drm_core_check_feature(dev, DRIVER_LEGACY))
>                 return -EOPNOTSUPP;
>
>         DRM_DEBUG("%d\n", ctx->handle);
> diff --git a/drivers/gpu/drm/nouveau/Kconfig b/drivers/gpu/drm/nouveau/Kconfig
> index 03d12caf9e26..ee92890d3266 100644
> --- a/drivers/gpu/drm/nouveau/Kconfig
> +++ b/drivers/gpu/drm/nouveau/Kconfig
> @@ -24,18 +24,6 @@ config DRM_NOUVEAU
>         help
>           Choose this option for open-source NVIDIA support.
>
> -config NOUVEAU_LEGACY_CTX_SUPPORT
> -       bool "Nouveau legacy context support"
> -       depends on DRM_NOUVEAU
> -       select DRM_LEGACY
> -       default y
> -       help
> -         There was a version of the nouveau DDX that relied on legacy
> -         ctx ioctls not erroring out. But that was back in time a long
> -         ways, so offer a way to disable it now. For uapi compat with
> -         old nouveau ddx this should be on by default, but modern distros
> -         should consider turning it off.
> -
>  config NOUVEAU_PLATFORM_DRIVER
>         bool "Nouveau (NVIDIA) SoC GPUs"
>         depends on DRM_NOUVEAU && ARCH_TEGRA
> diff --git a/drivers/gpu/drm/nouveau/nouveau_drm.c b/drivers/gpu/drm/nouveau/nouveau_drm.c
> index 80f154b6adab..80562177b581 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_drm.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_drm.c
> @@ -1221,13 +1221,9 @@ nouveau_driver_fops = {
>
>  static struct drm_driver
>  driver_stub = {
> -       .driver_features =
> -               DRIVER_GEM | DRIVER_MODESET | DRIVER_RENDER
> -#if defined(CONFIG_NOUVEAU_LEGACY_CTX_SUPPORT)
> -               | DRIVER_KMS_LEGACY_CONTEXT
> -#endif
> -               ,
> -
> +       .driver_features = DRIVER_GEM |
> +                          DRIVER_MODESET |
> +                          DRIVER_RENDER,
>         .open = nouveau_drm_open,
>         .postclose = nouveau_drm_postclose,
>         .lastclose = nouveau_vga_lastclose,
> diff --git a/include/drm/drm_drv.h b/include/drm/drm_drv.h
> index d7c521e8860f..1d76d0686b03 100644
> --- a/include/drm/drm_drv.h
> +++ b/include/drm/drm_drv.h
> @@ -149,13 +149,6 @@ enum drm_driver_feature {
>          * Legacy irq support. Only for legacy drivers. Do not use.
>          */
>         DRIVER_HAVE_IRQ                 = BIT(30),
> -       /**
> -        * @DRIVER_KMS_LEGACY_CONTEXT:
> -        *
> -        * Used only by nouveau for backwards compatibility with existing
> -        * userspace.  Do not use.
> -        */
> -       DRIVER_KMS_LEGACY_CONTEXT       = BIT(31),
>  };
>
>  /**
> --
> 2.39.0
>

