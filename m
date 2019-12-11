Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 98FC211BEEA
	for <lists+nouveau@lfdr.de>; Wed, 11 Dec 2019 22:13:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9538B6EBE5;
	Wed, 11 Dec 2019 21:13:29 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-vk1-f193.google.com (mail-vk1-f193.google.com
 [209.85.221.193])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 999516EBE5;
 Wed, 11 Dec 2019 21:13:28 +0000 (UTC)
Received: by mail-vk1-f193.google.com with SMTP id u123so110777vkb.9;
 Wed, 11 Dec 2019 13:13:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=/nyTEBkJ0K7o0a8P22DdBKPB1lTemQHMluxra4adwto=;
 b=rDEcSO4pH0a9gS0O7RWoBkon4v9pTYzSAZMBJuHN0kr6K1fjdcIFgFFT0x+6jrNZds
 ik1wdz2/irAg8k37x0R224bYdJANSC8vym8CO0uWdhMallR6Yb6AmXrYgQ9sbmXWGbJq
 wR/DgjptDGkxLynkQyPPYPbhNyixIWxyCj/QOJOKkqJJML3akcFCmzeZTZ88jZ6ujBcZ
 HH5u3rJdTzJwvgzhaxnUenswXjvXwiGaM7JPtJNknN9odYcWIuw5p7sVcwrqB0HvRhgu
 VP4BLb09gUuyN3BnxEIrAeURY55khVLwZ56SAMFQqd/KduyvhYuvZ3dXMDHLkunqjC+9
 ryYw==
X-Gm-Message-State: APjAAAUMj7vsvggIIjAu43vythq8KM5Lt6PiGTVD4cejmzjSDo9UjNkS
 vZswtV2D14byJrTJgM63AFC/ICgRq61E6MXnZ1A=
X-Google-Smtp-Source: APXvYqxw8ZtEbaCF38aSRu92dV44Joat5EtrHFaNAfBKm0Xif00D0xAuUSI71Iq1D9a2/AmhJQL/Al17mMRUMPiOObs=
X-Received: by 2002:a1f:ea04:: with SMTP id i4mr5630783vkh.94.1576098807316;
 Wed, 11 Dec 2019 13:13:27 -0800 (PST)
MIME-Version: 1.0
References: <20191211205922.7096-1-jajones@nvidia.com>
 <20191211205922.7096-4-jajones@nvidia.com>
In-Reply-To: <20191211205922.7096-4-jajones@nvidia.com>
From: Ilia Mirkin <imirkin@alum.mit.edu>
Date: Wed, 11 Dec 2019 16:13:16 -0500
Message-ID: <CAKb7Uvg-_dPPoJvBx0OXtjQEg1fBFbdBXRqZez3VJMhxD-xQEA@mail.gmail.com>
To: James Jones <jajones@nvidia.com>
Subject: Re: [Nouveau] [PATCH 3/3] drm/nouveau: Support NVIDIA format
 modifiers
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
 dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

On Wed, Dec 11, 2019 at 4:04 PM James Jones <jajones@nvidia.com> wrote:
>
> Allow setting the block layout of a nouveau FB
> object using DRM format modifiers.  When
> specified, the format modifier block layout and
> kind overrides the GEM buffer's implicit layout
> and kind.  The specified format modifier is
> validated against he list of modifiers supported
> by the target display hardware.
>
> Signed-off-by: James Jones <jajones@nvidia.com>
> ---
>  drivers/gpu/drm/nouveau/dispnv50/wndw.c   |  8 +--
>  drivers/gpu/drm/nouveau/nouveau_display.c | 65 ++++++++++++++++++++++-
>  drivers/gpu/drm/nouveau/nouveau_display.h |  2 +
>  3 files changed, 69 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/gpu/drm/nouveau/dispnv50/wndw.c b/drivers/gpu/drm/nouveau/dispnv50/wndw.c
> index 70ad64cb2d34..06c1b18479c1 100644
> --- a/drivers/gpu/drm/nouveau/dispnv50/wndw.c
> +++ b/drivers/gpu/drm/nouveau/dispnv50/wndw.c
> @@ -43,7 +43,7 @@ nv50_wndw_ctxdma_new(struct nv50_wndw *wndw, struct nouveau_framebuffer *fb)
>  {
>         struct nouveau_drm *drm = nouveau_drm(fb->base.dev);
>         struct nv50_wndw_ctxdma *ctxdma;
> -       const u8    kind = fb->nvbo->kind;
> +       const u8    kind = fb->kind;
>         const u32 handle = 0xfb000000 | kind;
>         struct {
>                 struct nv_dma_v0 base;
> @@ -243,7 +243,7 @@ nv50_wndw_atomic_check_acquire(struct nv50_wndw *wndw, bool modeset,
>         if (asyw->state.fb != armw->state.fb || !armw->visible || modeset) {
>                 asyw->image.w = fb->base.width;
>                 asyw->image.h = fb->base.height;
> -               asyw->image.kind = fb->nvbo->kind;
> +               asyw->image.kind = fb->kind;
>
>                 ret = nv50_wndw_atomic_check_acquire_rgb(asyw);
>                 if (ret) {
> @@ -255,9 +255,9 @@ nv50_wndw_atomic_check_acquire(struct nv50_wndw *wndw, bool modeset,
>                 if (asyw->image.kind) {
>                         asyw->image.layout = 0;
>                         if (drm->client.device.info.chipset >= 0xc0)
> -                               asyw->image.blockh = fb->nvbo->mode >> 4;
> +                               asyw->image.blockh = fb->tile_mode >> 4;
>                         else
> -                               asyw->image.blockh = fb->nvbo->mode;
> +                               asyw->image.blockh = fb->tile_mode;
>                         asyw->image.blocks[0] = fb->base.pitches[0] / 64;
>                         asyw->image.pitch[0] = 0;
>                 } else {
> diff --git a/drivers/gpu/drm/nouveau/nouveau_display.c b/drivers/gpu/drm/nouveau/nouveau_display.c
> index f1509392d7b7..351b58410e1a 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_display.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_display.c
> @@ -224,6 +224,50 @@ static const struct drm_framebuffer_funcs nouveau_framebuffer_funcs = {
>         .create_handle = nouveau_user_framebuffer_create_handle,
>  };
>
> +static int
> +nouveau_decode_mod(struct nouveau_drm *drm,
> +                  uint64_t modifier,
> +                  uint32_t *tile_mode,
> +                  uint8_t *kind)
> +{
> +       struct nouveau_display *disp = nouveau_display(drm->dev);
> +       int mod;
> +
> +       BUG_ON(!tile_mode || !kind);
> +
> +       if (drm->client.device.info.chipset < 0x50) {

Not a full review, but you want to go off the family (chip_class iirc?
something like that, should be obvious). Sadly 0x67/0x68 are higher
than 0x50 numerically, but are logically part of the nv4x generation.

> +               return -EINVAL;
> +       }
> +
> +       BUG_ON(!disp->format_modifiers);
> +
> +       for (mod = 0;
> +            (disp->format_modifiers[mod] != DRM_FORMAT_MOD_INVALID) &&
> +            (disp->format_modifiers[mod] != modifier);
> +            mod++);
> +
> +       if (disp->format_modifiers[mod] == DRM_FORMAT_MOD_INVALID)
> +               return -EINVAL;
> +
> +       if (modifier == DRM_FORMAT_MOD_LINEAR) {
> +               /* tile_mode will not be used in this case */
> +               *tile_mode = 0;
> +               *kind = 0;
> +       } else {
> +               /*
> +                * Extract the block height and kind from the corresponding
> +                * modifier fields.  See drm_fourcc.h for details.
> +                */
> +               *tile_mode = (uint32_t)(modifier & 0xF);
> +               *kind = (uint8_t)((modifier >> 12) & 0xFF);
> +
> +               if (drm->client.device.info.chipset >= 0xc0)
> +                       *tile_mode <<= 4;
> +       }
> +
> +       return 0;
> +}
> +
>  static inline uint32_t
>  nouveau_get_width_in_blocks(uint32_t stride)
>  {
> @@ -300,6 +344,8 @@ nouveau_framebuffer_new(struct drm_device *dev,
>         struct nouveau_framebuffer *fb;
>         const struct drm_format_info *info;
>         unsigned int width, height, i;
> +       uint32_t tile_mode;
> +       uint8_t kind;
>         int ret;
>
>          /* YUV overlays have special requirements pre-NV50 */
> @@ -322,6 +368,18 @@ nouveau_framebuffer_new(struct drm_device *dev,
>                 return -EINVAL;
>         }
>
> +       if (mode_cmd->flags & DRM_MODE_FB_MODIFIERS) {
> +               if (nouveau_decode_mod(drm, mode_cmd->modifier[0], &tile_mode,
> +                                      &kind)) {
> +                       DRM_DEBUG_KMS("Unsupported modifier: 0x%llx\n",
> +                                     mode_cmd->modifier[0]);
> +                       return -EINVAL;
> +               }
> +       } else {
> +               tile_mode = nvbo->mode;
> +               kind = nvbo->kind;
> +       }
> +
>         info = drm_get_format_info(dev, mode_cmd);
>
>         for (i = 0; i < info->num_planes; i++) {
> @@ -332,11 +390,11 @@ nouveau_framebuffer_new(struct drm_device *dev,
>                                                       mode_cmd->height,
>                                                       i);
>
> -               if (nvbo->kind) {
> +               if (kind) {
>                         ret = nouveau_check_bl_size(drm, nvbo,
>                                                     mode_cmd->offsets[i],
>                                                     mode_cmd->pitches[i],
> -                                                   height, nvbo->mode);
> +                                                   height, tile_mode);
>                         if (ret)
>                                 return ret;
>                 } else {
> @@ -352,6 +410,8 @@ nouveau_framebuffer_new(struct drm_device *dev,
>
>         drm_helper_mode_fill_fb_struct(dev, &fb->base, mode_cmd);
>         fb->nvbo = nvbo;
> +       fb->tile_mode = tile_mode;
> +       fb->kind = kind;
>
>         ret = drm_framebuffer_init(dev, &fb->base, &nouveau_framebuffer_funcs);
>         if (ret)
> @@ -625,6 +685,7 @@ nouveau_display_create(struct drm_device *dev)
>
>         dev->mode_config.preferred_depth = 24;
>         dev->mode_config.prefer_shadow = 1;
> +       dev->mode_config.allow_fb_modifiers = true;
>
>         if (drm->client.device.info.chipset < 0x11)
>                 dev->mode_config.async_page_flip = false;
> diff --git a/drivers/gpu/drm/nouveau/nouveau_display.h b/drivers/gpu/drm/nouveau/nouveau_display.h
> index c54682f00b01..0dad57b21983 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_display.h
> +++ b/drivers/gpu/drm/nouveau/nouveau_display.h
> @@ -15,6 +15,8 @@ struct nouveau_framebuffer {
>         u32 r_handle;
>         u32 r_format;
>         u32 r_pitch;
> +       u32 tile_mode;
> +       u8 kind;
>         struct nvif_object h_base[4];
>         struct nvif_object h_core;
>  };
> --
> 2.17.1
>
> _______________________________________________
> Nouveau mailing list
> Nouveau@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/nouveau
_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
