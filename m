Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 67FC8296860
	for <lists+nouveau@lfdr.de>; Fri, 23 Oct 2020 03:58:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 394566E44E;
	Fri, 23 Oct 2020 01:57:52 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DAED76F53F
 for <nouveau@lists.freedesktop.org>; Thu, 22 Oct 2020 08:05:39 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id a72so873901wme.5
 for <nouveau@lists.freedesktop.org>; Thu, 22 Oct 2020 01:05:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=jo9DObZgd9Jq6ZPonfHxKOsM2RbE9S9o0V4+k1CciSY=;
 b=LpVtkQQEzDhGLYock7xQGko/zoS3bHGVeS2MwITVSQjnbfP4AMhqamrvOtAFmXYrPu
 M4rdxuuXfajVAiGf91dIAQUVAfjFyk3TE3h9FLC57hbSTRNI8HSEiW7wSnn833mLl3bT
 qYQcRr7XPtDbhyfcVfQaWMtP5UWNo6sIUEMEs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=jo9DObZgd9Jq6ZPonfHxKOsM2RbE9S9o0V4+k1CciSY=;
 b=fvx+CiAw/I1G2UzxkTOZEaB851Kk0MuS/bM2TG5P9ReLgSg5/9VYNsWYH62Bzjw7PE
 2ShX1qm7Oxm6rizCWzXbJ/+8BAutSAjPKpf3QqMG76uYckwWsvFCFW9YRRTWFWxL7mY7
 WfJL/HGDj77t5Ziudp9zesVaGxVE4QcCYOB71kqBz684MD/0X1I1biCtfxlzY9fBahHo
 rBp1cy1cQEncmhS07E7oCM+7eG9dOsKmFxW9K0ZR1HdTkHAm6CxY7ZNNz+5rPmu24sSD
 RBgkoRmpw/Faexq2r53r4D1ndobGLotgBfD/Xa7FdHqtMCRQUQ115USlXBCXH1agQrss
 dAXQ==
X-Gm-Message-State: AOAM533+TluSTI/VNghnZql+WhqdXa/49EykeyqiXTaDEnBBBoSIiZJ/
 12G6Sl6+qNla+EnP5Cob9+kQlg==
X-Google-Smtp-Source: ABdhPJz1mIaxROQHFnkDMtAkyfocV37SNrA+OnkarpcW450fCaDG5+KffMOrvXq4qfjJmhfMWT0ZNg==
X-Received: by 2002:a1c:2cc2:: with SMTP id s185mr1359132wms.77.1603353938320; 
 Thu, 22 Oct 2020 01:05:38 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id 32sm2105875wro.31.2020.10.22.01.05.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Oct 2020 01:05:37 -0700 (PDT)
Date: Thu, 22 Oct 2020 10:05:34 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Thomas Zimmermann <tzimmermann@suse.de>
Message-ID: <20201022080534.GT401619@phenom.ffwll.local>
References: <20201020122046.31167-1-tzimmermann@suse.de>
 <20201020122046.31167-11-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201020122046.31167-11-tzimmermann@suse.de>
X-Operating-System: Linux phenom 5.7.0-1-amd64 
X-Mailman-Approved-At: Fri, 23 Oct 2020 01:57:50 +0000
Subject: Re: [Nouveau] [PATCH v5 10/10] drm/fb_helper: Support framebuffers
 in I/O memory
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

On Tue, Oct 20, 2020 at 02:20:46PM +0200, Thomas Zimmermann wrote:
> At least sparc64 requires I/O-specific access to framebuffers. This
> patch updates the fbdev console accordingly.
> 
> For drivers with direct access to the framebuffer memory, the callback
> functions in struct fb_ops test for the type of memory and call the rsp
> fb_sys_ of fb_cfb_ functions. Read and write operations are implemented
> internally by DRM's fbdev helper.
> 
> For drivers that employ a shadow buffer, fbdev's blit function retrieves
> the framebuffer address as struct dma_buf_map, and uses dma_buf_map
> interfaces to access the buffer.
> 
> The bochs driver on sparc64 uses a workaround to flag the framebuffer as
> I/O memory and avoid a HW exception. With the introduction of struct
> dma_buf_map, this is not required any longer. The patch removes the rsp
> code from both, bochs and fbdev.
> 
> v5:
> 	* implement fb_read/fb_write internally (Daniel, Sam)
> v4:
> 	* move dma_buf_map changes into separate patch (Daniel)
> 	* TODO list: comment on fbdev updates (Daniel)
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Tested-by: Sam Ravnborg <sam@ravnborg.org>
> ---
>  Documentation/gpu/todo.rst        |  19 ++-
>  drivers/gpu/drm/bochs/bochs_kms.c |   1 -
>  drivers/gpu/drm/drm_fb_helper.c   | 227 ++++++++++++++++++++++++++++--
>  include/drm/drm_mode_config.h     |  12 --
>  4 files changed, 230 insertions(+), 29 deletions(-)
> 
> diff --git a/Documentation/gpu/todo.rst b/Documentation/gpu/todo.rst
> index 7e6fc3c04add..638b7f704339 100644
> --- a/Documentation/gpu/todo.rst
> +++ b/Documentation/gpu/todo.rst
> @@ -197,13 +197,28 @@ Convert drivers to use drm_fbdev_generic_setup()
>  ------------------------------------------------
>  
>  Most drivers can use drm_fbdev_generic_setup(). Driver have to implement
> -atomic modesetting and GEM vmap support. Current generic fbdev emulation
> -expects the framebuffer in system memory (or system-like memory).
> +atomic modesetting and GEM vmap support. Historically, generic fbdev emulation
> +expected the framebuffer in system memory or system-like memory. By employing
> +struct dma_buf_map, drivers with frambuffers in I/O memory can be supported
> +as well.
>  
>  Contact: Maintainer of the driver you plan to convert
>  
>  Level: Intermediate
>  
> +Reimplement functions in drm_fbdev_fb_ops without fbdev
> +-------------------------------------------------------
> +
> +A number of callback functions in drm_fbdev_fb_ops could benefit from
> +being rewritten without dependencies on the fbdev module. Some of the
> +helpers could further benefit from using struct dma_buf_map instead of
> +raw pointers.
> +
> +Contact: Thomas Zimmermann <tzimmermann@suse.de>, Daniel Vetter
> +
> +Level: Advanced
> +
> +
>  drm_framebuffer_funcs and drm_mode_config_funcs.fb_create cleanup
>  -----------------------------------------------------------------
>  
> diff --git a/drivers/gpu/drm/bochs/bochs_kms.c b/drivers/gpu/drm/bochs/bochs_kms.c
> index 13d0d04c4457..853081d186d5 100644
> --- a/drivers/gpu/drm/bochs/bochs_kms.c
> +++ b/drivers/gpu/drm/bochs/bochs_kms.c
> @@ -151,7 +151,6 @@ int bochs_kms_init(struct bochs_device *bochs)
>  	bochs->dev->mode_config.preferred_depth = 24;
>  	bochs->dev->mode_config.prefer_shadow = 0;
>  	bochs->dev->mode_config.prefer_shadow_fbdev = 1;
> -	bochs->dev->mode_config.fbdev_use_iomem = true;
>  	bochs->dev->mode_config.quirk_addfb_prefer_host_byte_order = true;
>  
>  	bochs->dev->mode_config.funcs = &bochs_mode_funcs;
> diff --git a/drivers/gpu/drm/drm_fb_helper.c b/drivers/gpu/drm/drm_fb_helper.c
> index 6212cd7cde1d..1d3180841778 100644
> --- a/drivers/gpu/drm/drm_fb_helper.c
> +++ b/drivers/gpu/drm/drm_fb_helper.c
> @@ -372,24 +372,22 @@ static void drm_fb_helper_resume_worker(struct work_struct *work)
>  }
>  
>  static void drm_fb_helper_dirty_blit_real(struct drm_fb_helper *fb_helper,
> -					  struct drm_clip_rect *clip)
> +					  struct drm_clip_rect *clip,
> +					  struct dma_buf_map *dst)
>  {
>  	struct drm_framebuffer *fb = fb_helper->fb;
>  	unsigned int cpp = fb->format->cpp[0];
>  	size_t offset = clip->y1 * fb->pitches[0] + clip->x1 * cpp;
>  	void *src = fb_helper->fbdev->screen_buffer + offset;
> -	void *dst = fb_helper->buffer->map.vaddr + offset;
>  	size_t len = (clip->x2 - clip->x1) * cpp;
>  	unsigned int y;
>  
> -	for (y = clip->y1; y < clip->y2; y++) {
> -		if (!fb_helper->dev->mode_config.fbdev_use_iomem)
> -			memcpy(dst, src, len);
> -		else
> -			memcpy_toio((void __iomem *)dst, src, len);
> +	dma_buf_map_incr(dst, offset); /* go to first pixel within clip rect */
>  
> +	for (y = clip->y1; y < clip->y2; y++) {
> +		dma_buf_map_memcpy_to(dst, src, len);
> +		dma_buf_map_incr(dst, fb->pitches[0]);
>  		src += fb->pitches[0];
> -		dst += fb->pitches[0];
>  	}
>  }
>  
> @@ -417,8 +415,9 @@ static void drm_fb_helper_dirty_work(struct work_struct *work)
>  			ret = drm_client_buffer_vmap(helper->buffer, &map);
>  			if (ret)
>  				return;
> -			drm_fb_helper_dirty_blit_real(helper, &clip_copy);
> +			drm_fb_helper_dirty_blit_real(helper, &clip_copy, &map);
>  		}
> +
>  		if (helper->fb->funcs->dirty)
>  			helper->fb->funcs->dirty(helper->fb, NULL, 0, 0,
>  						 &clip_copy, 1);
> @@ -2027,6 +2026,206 @@ static int drm_fbdev_fb_mmap(struct fb_info *info, struct vm_area_struct *vma)
>  		return -ENODEV;
>  }
>  
> +static bool drm_fbdev_use_iomem(struct fb_info *info)
> +{
> +	struct drm_fb_helper *fb_helper = info->par;
> +	struct drm_client_buffer *buffer = fb_helper->buffer;
> +
> +	return !drm_fbdev_use_shadow_fb(fb_helper) && buffer->map.is_iomem;
> +}
> +
> +static ssize_t fb_read_screen_base(struct fb_info *info, char __user *buf, size_t count, 
> +				   loff_t pos)
> +{
> +	const char __iomem *src = info->screen_base + pos;

Maybe a bit much a bikeshed, but I'd write this in terms of drm objects,
like the dirty_blit function, using the dma_buf_map (instead of the
fb_info parameter). And then instead of
screen_base and screen_buffer suffixes give them _mem and _iomem suffixes.

Same for write below. Or I'm not quite understanding why we do it like
this here - I don't think this code will be used outside of the generic
fbdev code, so we can always assume that drm_fb_helper->buffer is set up.

The other thing I think we need is some minimal testcases to make sure.
The fbtest tool used way back seems to have disappeared, I couldn't find
a copy of the source anywhere anymore.

With all that: Acked-by: Daniel Vetter <daniel.vetter@ffwll.ch>

Cheers, Daniel

> +	size_t alloc_size = min(count, PAGE_SIZE);
> +	ssize_t ret = 0;
> +	char *tmp;
> +
> +	tmp = kmalloc(alloc_size, GFP_KERNEL);
> +	if (!tmp)
> +		return -ENOMEM;
> +
> +	while (count) {
> +		size_t c = min(count, alloc_size);
> +
> +		memcpy_fromio(tmp, src, c);
> +		if (copy_to_user(buf, tmp, c)) {
> +			ret = -EFAULT;
> +			break;
> +		}
> +
> +		src += c;
> +		buf += c;
> +		ret += c;
> +		count -= c;
> +	}
> +
> +	kfree(tmp);
> +
> +	return ret;
> +}
> +
> +static ssize_t fb_read_screen_buffer(struct fb_info *info, char __user *buf, size_t count,
> +				     loff_t pos)
> +{
> +	const char *src = info->screen_buffer + pos;
> +
> +	if (copy_to_user(buf, src, count))
> +		return -EFAULT;
> +
> +	return count;
> +}
> +
> +static ssize_t drm_fbdev_fb_read(struct fb_info *info, char __user *buf,
> +				 size_t count, loff_t *ppos)
> +{
> +	loff_t pos = *ppos;
> +	size_t total_size;
> +	ssize_t ret;
> +
> +	if (info->state != FBINFO_STATE_RUNNING)
> +		return -EPERM;
> +
> +	if (info->screen_size)
> +		total_size = info->screen_size;
> +	else
> +		total_size = info->fix.smem_len;
> +
> +	if (pos >= total_size)
> +		return 0;
> +	if (count >= total_size)
> +		count = total_size;
> +	if (total_size - count < pos)
> +		count = total_size - pos;
> +
> +	if (drm_fbdev_use_iomem(info))
> +		ret = fb_read_screen_base(info, buf, count, pos);
> +	else
> +		ret = fb_read_screen_buffer(info, buf, count, pos);
> +
> +	if (ret > 0)
> +		*ppos = ret;
> +
> +	return ret;
> +}
> +
> +static ssize_t fb_write_screen_base(struct fb_info *info, const char __user *buf, size_t count,
> +				    loff_t pos)
> +{
> +	char __iomem *dst = info->screen_base + pos;
> +	size_t alloc_size = min(count, PAGE_SIZE);
> +	ssize_t ret = 0;
> +	u8 *tmp;
> +
> +	tmp = kmalloc(alloc_size, GFP_KERNEL);
> +	if (!tmp)
> +		return -ENOMEM;
> +
> +	while (count) {
> +		size_t c = min(count, alloc_size);
> +
> +		if (copy_from_user(tmp, buf, c)) {
> +			ret = -EFAULT;
> +			break;
> +		}
> +		memcpy_toio(dst, tmp, c);
> +
> +		dst += c;
> +		buf += c;
> +		ret += c;
> +		count -= c;
> +	}
> +
> +	kfree(tmp);
> +
> +	return ret;
> +}
> +
> +static ssize_t fb_write_screen_buffer(struct fb_info *info, const char __user *buf, size_t count,
> +				      loff_t pos)
> +{
> +	char *dst = info->screen_buffer + pos;
> +
> +	if (copy_from_user(dst, buf, count))
> +		return -EFAULT;
> +
> +	return count;
> +}
> +
> +static ssize_t drm_fbdev_fb_write(struct fb_info *info, const char __user *buf,
> +				  size_t count, loff_t *ppos)
> +{
> +	loff_t pos = *ppos;
> +	size_t total_size;
> +	ssize_t ret;
> +	int err;
> +
> +	if (info->state != FBINFO_STATE_RUNNING)
> +		return -EPERM;
> +
> +	if (info->screen_size)
> +		total_size = info->screen_size;
> +	else
> +		total_size = info->fix.smem_len;
> +
> +	if (pos > total_size)
> +		return -EFBIG;
> +	if (count > total_size) {
> +		err = -EFBIG;
> +		count = total_size;
> +	}
> +	if (total_size - count < pos) {
> +		if (!err)
> +			err = -ENOSPC;
> +		count = total_size - pos;
> +	}
> +
> +	/*
> +	 * Copy to framebuffer even if we already logged an error. Emulates
> +	 * the behavior of the original fbdev implementation.
> +	 */
> +	if (drm_fbdev_use_iomem(info))
> +		ret = fb_write_screen_base(info, buf, count, pos);
> +	else
> +		ret = fb_write_screen_buffer(info, buf, count, pos);
> +
> +	if (ret > 0)
> +		*ppos = ret;
> +
> +	if (err)
> +		return err;
> +
> +	return ret;
> +}
> +
> +static void drm_fbdev_fb_fillrect(struct fb_info *info,
> +				  const struct fb_fillrect *rect)
> +{
> +	if (drm_fbdev_use_iomem(info))
> +		drm_fb_helper_cfb_fillrect(info, rect);
> +	else
> +		drm_fb_helper_sys_fillrect(info, rect);
> +}
> +
> +static void drm_fbdev_fb_copyarea(struct fb_info *info,
> +				  const struct fb_copyarea *area)
> +{
> +	if (drm_fbdev_use_iomem(info))
> +		drm_fb_helper_cfb_copyarea(info, area);
> +	else
> +		drm_fb_helper_sys_copyarea(info, area);
> +}
> +
> +static void drm_fbdev_fb_imageblit(struct fb_info *info,
> +				   const struct fb_image *image)
> +{
> +	if (drm_fbdev_use_iomem(info))
> +		drm_fb_helper_cfb_imageblit(info, image);
> +	else
> +		drm_fb_helper_sys_imageblit(info, image);
> +}
> +
>  static const struct fb_ops drm_fbdev_fb_ops = {
>  	.owner		= THIS_MODULE,
>  	DRM_FB_HELPER_DEFAULT_OPS,
> @@ -2034,11 +2233,11 @@ static const struct fb_ops drm_fbdev_fb_ops = {
>  	.fb_release	= drm_fbdev_fb_release,
>  	.fb_destroy	= drm_fbdev_fb_destroy,
>  	.fb_mmap	= drm_fbdev_fb_mmap,
> -	.fb_read	= drm_fb_helper_sys_read,
> -	.fb_write	= drm_fb_helper_sys_write,
> -	.fb_fillrect	= drm_fb_helper_sys_fillrect,
> -	.fb_copyarea	= drm_fb_helper_sys_copyarea,
> -	.fb_imageblit	= drm_fb_helper_sys_imageblit,
> +	.fb_read	= drm_fbdev_fb_read,
> +	.fb_write	= drm_fbdev_fb_write,
> +	.fb_fillrect	= drm_fbdev_fb_fillrect,
> +	.fb_copyarea	= drm_fbdev_fb_copyarea,
> +	.fb_imageblit	= drm_fbdev_fb_imageblit,
>  };
>  
>  static struct fb_deferred_io drm_fbdev_defio = {
> diff --git a/include/drm/drm_mode_config.h b/include/drm/drm_mode_config.h
> index 5ffbb4ed5b35..ab424ddd7665 100644
> --- a/include/drm/drm_mode_config.h
> +++ b/include/drm/drm_mode_config.h
> @@ -877,18 +877,6 @@ struct drm_mode_config {
>  	 */
>  	bool prefer_shadow_fbdev;
>  
> -	/**
> -	 * @fbdev_use_iomem:
> -	 *
> -	 * Set to true if framebuffer reside in iomem.
> -	 * When set to true memcpy_toio() is used when copying the framebuffer in
> -	 * drm_fb_helper.drm_fb_helper_dirty_blit_real().
> -	 *
> -	 * FIXME: This should be replaced with a per-mapping is_iomem
> -	 * flag (like ttm does), and then used everywhere in fbdev code.
> -	 */
> -	bool fbdev_use_iomem;
> -
>  	/**
>  	 * @quirk_addfb_prefer_xbgr_30bpp:
>  	 *
> -- 
> 2.28.0
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
