Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id ED116281FB9
	for <lists+nouveau@lfdr.de>; Sat,  3 Oct 2020 02:21:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 76F246EA11;
	Sat,  3 Oct 2020 00:21:44 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5411D6E0AF
 for <nouveau@lists.freedesktop.org>; Fri,  2 Oct 2020 13:04:46 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id o5so1736677wrn.13
 for <nouveau@lists.freedesktop.org>; Fri, 02 Oct 2020 06:04:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=BRdG+Sv9lbvsBV80MeJ5uYgZhZMNFbaqhIia52Zq8gE=;
 b=ld4XU9dC3LDxekGn7GamKDrYPL7jSfU1sRt03W6y6ZG7Aj0ZYozjOKbQG2CqnDAQ+a
 Wm85y42hH9jUGUKeb3Qq0XMhu73F73vVo9TsKURGxDLRrOQhbtc2wTcM+8/StKpZWy9v
 y7aSSQFwbsgDSwiglVqPKSeUy1LEYeYYNmeDw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=BRdG+Sv9lbvsBV80MeJ5uYgZhZMNFbaqhIia52Zq8gE=;
 b=LXYCne8O7ESB32x0atXOB6v9FtOcn5VXhGAIFqBUCqCdFZ6GtGMmtt7C0f4NWD89Rg
 nKmfBjMeYPkjM96cHDC9PpHX9jlBr4ewhlXPYkZ5YRTNz0b8D1sj3iS6pqVIjyCMSZiO
 CNUyDRz97OhUeymF9xs662odnaX6UDgPY8plmpY3nnwhrxwmR7EEO2g7wPSJkYNohzdc
 Uy+akB+EEYqjF+ihyEnd21SOzmsjsUMArqDSd9JQFtLTDKEgnQxxRgNOs4f3lSVEr57j
 MSjCeBvST4voBMqD7vhbXVCEBUtNCamBjC5cWhGhFI1LGJHJ4Ua754Dds0kRJdxJ32KL
 G0Aw==
X-Gm-Message-State: AOAM5338qrCxYh4h+QJ8n188yZ3z/zsMVWg2LzGJKpMxdVjFUZmW0rbb
 9hdXsfcnOpZZhncNpiQzMxbFxg==
X-Google-Smtp-Source: ABdhPJyzB9ctK1WKL4a99n8wsCE482hZW17HPxIJTgRxw4A/5rqlGoYgwqEr/r2ZqiiE1CWrWADjIQ==
X-Received: by 2002:adf:e8c3:: with SMTP id k3mr3054113wrn.228.1601643884841; 
 Fri, 02 Oct 2020 06:04:44 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id d13sm1695267wrp.44.2020.10.02.06.04.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 02 Oct 2020 06:04:43 -0700 (PDT)
Date: Fri, 2 Oct 2020 15:04:40 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Thomas Zimmermann <tzimmermann@suse.de>
Message-ID: <20201002130440.GK438822@phenom.ffwll.local>
References: <20200929151437.19717-1-tzimmermann@suse.de>
 <20200929151437.19717-5-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200929151437.19717-5-tzimmermann@suse.de>
X-Operating-System: Linux phenom 5.7.0-1-amd64 
X-Mailman-Approved-At: Sat, 03 Oct 2020 00:21:42 +0000
Subject: Re: [Nouveau] [PATCH v3 4/7] drm/gem: Update internal GEM
 vmap/vunmap interfaces to use struct dma_buf_map
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
Cc: luben.tuikov@amd.com, heiko@sntech.de, airlied@linux.ie,
 nouveau@lists.freedesktop.org, linus.walleij@linaro.org,
 dri-devel@lists.freedesktop.org, chris@chris-wilson.co.uk,
 melissa.srw@gmail.com, eric@anholt.net, ray.huang@amd.com, kraxel@redhat.com,
 sam@ravnborg.org, sumit.semwal@linaro.org, emil.velikov@collabora.com,
 robh@kernel.org, linux-samsung-soc@vger.kernel.org, jy0922.shim@samsung.com,
 lima@lists.freedesktop.org, oleksandr_andrushchenko@epam.com, krzk@kernel.org,
 steven.price@arm.com, linux-rockchip@lists.infradead.org, kgene@kernel.org,
 bskeggs@redhat.com, linux+etnaviv@armlinux.org.uk,
 spice-devel@lists.freedesktop.org, alyssa.rosenzweig@collabora.com,
 maarten.lankhorst@linux.intel.com, etnaviv@lists.freedesktop.org,
 mripard@kernel.org, inki.dae@samsung.com, hdegoede@redhat.com,
 christian.gmeiner@gmail.com, xen-devel@lists.xenproject.org,
 virtualization@lists.linux-foundation.org, sean@poorly.run, apaneers@amd.com,
 linux-arm-kernel@lists.infradead.org, linaro-mm-sig@lists.linaro.org,
 amd-gfx@lists.freedesktop.org, tomeu.vizoso@collabora.com,
 sw0312.kim@samsung.com, hjc@rock-chips.com, kyungmin.park@samsung.com,
 miaoqinglang@huawei.com, yuq825@gmail.com, daniel@ffwll.ch,
 alexander.deucher@amd.com, linux-media@vger.kernel.org,
 christian.koenig@amd.com, l.stach@pengutronix.de
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

On Tue, Sep 29, 2020 at 05:14:34PM +0200, Thomas Zimmermann wrote:
> GEM's vmap and vunmap interfaces now wrap memory pointers in struct
> dma_buf_map.
> =

> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>  drivers/gpu/drm/drm_client.c   | 18 +++++++++++-------
>  drivers/gpu/drm/drm_gem.c      | 28 ++++++++++++++--------------
>  drivers/gpu/drm/drm_internal.h |  5 +++--
>  drivers/gpu/drm/drm_prime.c    | 14 ++++----------
>  4 files changed, 32 insertions(+), 33 deletions(-)
> =

> diff --git a/drivers/gpu/drm/drm_client.c b/drivers/gpu/drm/drm_client.c
> index 495f47d23d87..ac0082bed966 100644
> --- a/drivers/gpu/drm/drm_client.c
> +++ b/drivers/gpu/drm/drm_client.c
> @@ -3,6 +3,7 @@
>   * Copyright 2018 Noralf Tr=F8nnes
>   */
>  =

> +#include <linux/dma-buf-map.h>
>  #include <linux/list.h>
>  #include <linux/module.h>
>  #include <linux/mutex.h>
> @@ -304,7 +305,8 @@ drm_client_buffer_create(struct drm_client_dev *clien=
t, u32 width, u32 height, u
>   */
>  void *drm_client_buffer_vmap(struct drm_client_buffer *buffer)
>  {
> -	void *vaddr;
> +	struct dma_buf_map map;
> +	int ret;
>  =

>  	if (buffer->vaddr)
>  		return buffer->vaddr;
> @@ -317,13 +319,13 @@ void *drm_client_buffer_vmap(struct drm_client_buff=
er *buffer)
>  	 * fd_install step out of the driver backend hooks, to make that
>  	 * final step optional for internal users.
>  	 */
> -	vaddr =3D drm_gem_vmap(buffer->gem);
> -	if (IS_ERR(vaddr))
> -		return vaddr;
> +	ret =3D drm_gem_vmap(buffer->gem, &map);
> +	if (ret)
> +		return ERR_PTR(ret);
>  =

> -	buffer->vaddr =3D vaddr;
> +	buffer->vaddr =3D map.vaddr;
>  =

> -	return vaddr;
> +	return map.vaddr;
>  }
>  EXPORT_SYMBOL(drm_client_buffer_vmap);
>  =

> @@ -337,7 +339,9 @@ EXPORT_SYMBOL(drm_client_buffer_vmap);
>   */
>  void drm_client_buffer_vunmap(struct drm_client_buffer *buffer)
>  {
> -	drm_gem_vunmap(buffer->gem, buffer->vaddr);
> +	struct dma_buf_map map =3D DMA_BUF_MAP_INIT_VADDR(buffer->vaddr);
> +
> +	drm_gem_vunmap(buffer->gem, &map);
>  	buffer->vaddr =3D NULL;
>  }
>  EXPORT_SYMBOL(drm_client_buffer_vunmap);
> diff --git a/drivers/gpu/drm/drm_gem.c b/drivers/gpu/drm/drm_gem.c
> index 0c4a66dea5c2..f2b2f37d41c4 100644
> --- a/drivers/gpu/drm/drm_gem.c
> +++ b/drivers/gpu/drm/drm_gem.c
> @@ -1205,32 +1205,32 @@ void drm_gem_unpin(struct drm_gem_object *obj)
>  		obj->funcs->unpin(obj);
>  }
>  =

> -void *drm_gem_vmap(struct drm_gem_object *obj)
> +int drm_gem_vmap(struct drm_gem_object *obj, struct dma_buf_map *map)
>  {
> -	struct dma_buf_map map;
>  	int ret;
>  =

> -	if (!obj->funcs->vmap) {
> -		return ERR_PTR(-EOPNOTSUPP);
> +	if (!obj->funcs->vmap)
> +		return -EOPNOTSUPP;
>  =

> -	ret =3D obj->funcs->vmap(obj, &map);
> +	ret =3D obj->funcs->vmap(obj, map);
>  	if (ret)
> -		return ERR_PTR(ret);
> -	else if (dma_buf_map_is_null(&map))
> -		return ERR_PTR(-ENOMEM);
> +		return ret;
> +	else if (dma_buf_map_is_null(map))
> +		return -ENOMEM;
>  =

> -	return map.vaddr;
> +	return 0;
>  }
>  =

> -void drm_gem_vunmap(struct drm_gem_object *obj, void *vaddr)
> +void drm_gem_vunmap(struct drm_gem_object *obj, struct dma_buf_map *map)
>  {
> -	struct dma_buf_map map =3D DMA_BUF_MAP_INIT_VADDR(vaddr);
> -
> -	if (!vaddr)
> +	if (dma_buf_map_is_null(map))
>  		return;
>  =

>  	if (obj->funcs->vunmap)
> -		obj->funcs->vunmap(obj, &map);
> +		obj->funcs->vunmap(obj, map);
> +
> +	/* Always set the mapping to NULL. Callers may rely on this. */
> +	dma_buf_map_clear(map);
>  }
>  =

>  /**
> diff --git a/drivers/gpu/drm/drm_internal.h b/drivers/gpu/drm/drm_interna=
l.h
> index b65865c630b0..58832d75a9bd 100644
> --- a/drivers/gpu/drm/drm_internal.h
> +++ b/drivers/gpu/drm/drm_internal.h
> @@ -33,6 +33,7 @@
>  =

>  struct dentry;
>  struct dma_buf;
> +struct dma_buf_map;
>  struct drm_connector;
>  struct drm_crtc;
>  struct drm_framebuffer;
> @@ -187,8 +188,8 @@ void drm_gem_print_info(struct drm_printer *p, unsign=
ed int indent,
>  =

>  int drm_gem_pin(struct drm_gem_object *obj);
>  void drm_gem_unpin(struct drm_gem_object *obj);
> -void *drm_gem_vmap(struct drm_gem_object *obj);
> -void drm_gem_vunmap(struct drm_gem_object *obj, void *vaddr);
> +int drm_gem_vmap(struct drm_gem_object *obj, struct dma_buf_map *map);
> +void drm_gem_vunmap(struct drm_gem_object *obj, struct dma_buf_map *map);
>  =

>  /* drm_debugfs.c drm_debugfs_crc.c */
>  #if defined(CONFIG_DEBUG_FS)
> diff --git a/drivers/gpu/drm/drm_prime.c b/drivers/gpu/drm/drm_prime.c
> index 89e2a2496734..cb8fbeeb731b 100644
> --- a/drivers/gpu/drm/drm_prime.c
> +++ b/drivers/gpu/drm/drm_prime.c
> @@ -667,21 +667,15 @@ EXPORT_SYMBOL(drm_gem_unmap_dma_buf);
>   *
>   * Sets up a kernel virtual mapping. This can be used as the &dma_buf_op=
s.vmap
>   * callback. Calls into &drm_gem_object_funcs.vmap for device specific h=
andling.
> + * The kernel virtual address is returned in map.
>   *
> - * Returns the kernel virtual address or NULL on failure.
> + * Returns 0 on success or a negative errno code otherwise.
>   */
>  int drm_gem_dmabuf_vmap(struct dma_buf *dma_buf, struct dma_buf_map *map)
>  {
>  	struct drm_gem_object *obj =3D dma_buf->priv;
> -	void *vaddr;
>  =

> -	vaddr =3D drm_gem_vmap(obj);
> -	if (IS_ERR(vaddr))
> -		return PTR_ERR(vaddr);
> -
> -	dma_buf_map_set_vaddr(map, vaddr);
> -
> -	return 0;
> +	return drm_gem_vmap(obj, map);
>  }
>  EXPORT_SYMBOL(drm_gem_dmabuf_vmap);
>  =

> @@ -697,7 +691,7 @@ void drm_gem_dmabuf_vunmap(struct dma_buf *dma_buf, s=
truct dma_buf_map *map)
>  {
>  	struct drm_gem_object *obj =3D dma_buf->priv;
>  =

> -	drm_gem_vunmap(obj, map->vaddr);
> +	drm_gem_vunmap(obj, map);
>  }
>  EXPORT_SYMBOL(drm_gem_dmabuf_vunmap);

Some of the transitional stuff disappearing!

Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
>  =

> -- =

> 2.28.0
> =


-- =

Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
