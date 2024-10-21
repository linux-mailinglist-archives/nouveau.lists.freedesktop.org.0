Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F6029A5F11
	for <lists+nouveau@lfdr.de>; Mon, 21 Oct 2024 10:49:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E08F10E44E;
	Mon, 21 Oct 2024 08:49:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="Xw0hbiyD";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8195F10E44C
 for <nouveau@lists.freedesktop.org>; Mon, 21 Oct 2024 08:49:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1729500564;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ifZ/mqQgsqjm9CUBl3nW0p53f4RnZx7GbRid4XgUTOQ=;
 b=Xw0hbiyDPawqxJs+LReboSMcqehLFgHUPEnQY36yCiSTCcyO9cf3YIhgR9pqLYFWdhsrMB
 rzGCcnhuJfNiZwgJLqDpc5Ksrk4kLGepDZT2Os+hJDRzJKavJtdRrpKP1w5dwJNwxpY8r5
 VvDFGLpSVlSJN1No0ugScKWxe6/3fZc=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-607-6g04vRiqOVCWqeIYKNaC3w-1; Mon, 21 Oct 2024 04:49:21 -0400
X-MC-Unique: 6g04vRiqOVCWqeIYKNaC3w-1
Received: by mail-wm1-f72.google.com with SMTP id
 5b1f17b1804b1-4315cefda02so30165375e9.0
 for <nouveau@lists.freedesktop.org>; Mon, 21 Oct 2024 01:49:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729500560; x=1730105360;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ifZ/mqQgsqjm9CUBl3nW0p53f4RnZx7GbRid4XgUTOQ=;
 b=agJWWlzOrwct57hQ4rMKfNEDxQt0WdS6Q6LCEaLy/yRk34sMrAkj6xcHq4VEpztIVs
 W3zOd6PfV/EGliqQAsJtbr0uvktoFfg7TQ0668Ni06MkHUMj2jeKU2Zdc1JZdRMDQs46
 /4BakCp/YThCsMQPfIknLENSiI+P4ECnaWMKV6VC3JsWSyvFthg3z1PaSFKz4FN/7bnC
 rxZF40q576TlCdJTGgO75CpR+VPftxTXTQmdFHivpJvqhPrpuJhM+tU1DYV9YShu+DIh
 t+7m75qh+gJT1vSuddOvofwBcQ45qfZ/I+DF6OQWN6/g0XTMw69LrtmaUHy0oWInVbuV
 HQkA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVxWSKPSwm7BJ9Q2cMmIcYlflIgFClQZ8rdZ9Zfj5St2aWvEgGy0odcWKEdwq2FLE1EOMvd5laS@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxxUNgJ6jwpOkR/qZrab00uu9mz/hSW0ITPbqGHSGcubgYE26oy
 remrF/6fl/q6Gf2gjbVq7mCv2AFD/a8qYG6aVQ3KsUJ9KHChyHuE36KYuI6/G3ycxkRoRrHd4Nh
 Pev+6XRrXzYAMTRLee/oCg/FabB7osqf1nHHxrmQ+J1FaXgCysqWo17OojgbJubU=
X-Received: by 2002:a05:600c:198c:b0:431:58bc:ad5e with SMTP id
 5b1f17b1804b1-4316168e56dmr85745475e9.28.1729500559971; 
 Mon, 21 Oct 2024 01:49:19 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHcCrkYJaZ3QVFAC37jRWuaZEAj9mLFXpbsyIGDphSTqiB7N28TSaXZEvZCQpImIVBg2g3pgQ==
X-Received: by 2002:a05:600c:198c:b0:431:58bc:ad5e with SMTP id
 5b1f17b1804b1-4316168e56dmr85745205e9.28.1729500559509; 
 Mon, 21 Oct 2024 01:49:19 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:c:37e0:ced3:55bd:f454:e722?
 ([2a01:e0a:c:37e0:ced3:55bd:f454:e722])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4316f57b907sm49876685e9.14.2024.10.21.01.49.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 21 Oct 2024 01:49:18 -0700 (PDT)
Message-ID: <94961fef-dd40-4cad-aac4-7f9cb27fa60f@redhat.com>
Date: Mon, 21 Oct 2024 10:49:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/2] drm/nouveau: Add drm_panic support for nv50+
To: Lyude Paul <lyude@redhat.com>, Ilia Mirkin <imirkin@alum.mit.edu>,
 James Jones <jajones@nvidia.com>, Karol Herbst <kherbst@redhat.com>,
 Danilo Krummrich <dakr@redhat.com>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org
References: <20240913071036.574782-1-jfalempe@redhat.com>
 <20240913071036.574782-3-jfalempe@redhat.com>
 <46fcbe2ef3536fca125b970ae7126d9a2f129358.camel@redhat.com>
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <46fcbe2ef3536fca125b970ae7126d9a2f129358.camel@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US, fr
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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

On 18/10/2024 23:50, Lyude Paul wrote:
> On Fri, 2024-09-13 at 09:03 +0200, Jocelyn Falempe wrote:
>> Add drm_panic support, for nv50+ cards.
>> It's enough to get the panic screen while running Gnome/Wayland on a
>> GTX 1650.
>> It doesn't support multi-plane or compressed format.
>> Support for other formats and older cards will come later.
>> Tiling is only tested on GTX1650, and might be wrong for other cards.
>>
>> Signed-off-by: Jocelyn Falempe <jfalempe@redhat.com>
>> ---
>>
>> v2:
>>   * Rebase and drop already merged patches.
>>   * Rework the tiling algorithm, using "swizzle" to compute the offset
>>     inside the block.
>>     
>> v3:
>>   * Fix support for Tesla GPU, which have simpler tiling.
>>   * Use nouveau_framebuffer_get_layout() to get the tiling parameters.
>>   * Have 2 set_pixel() functions, depending on GPU family.
>>
>>   drivers/gpu/drm/nouveau/dispnv50/wndw.c | 139 +++++++++++++++++++++++-
>>   1 file changed, 137 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/nouveau/dispnv50/wndw.c b/drivers/gpu/drm/nouveau/dispnv50/wndw.c
>> index 7a2cceaee6e9..419c5f359711 100644
>> --- a/drivers/gpu/drm/nouveau/dispnv50/wndw.c
>> +++ b/drivers/gpu/drm/nouveau/dispnv50/wndw.c
>> @@ -30,11 +30,16 @@
>>   #include <nvhw/class/cl507e.h>
>>   #include <nvhw/class/clc37e.h>
>>   
>> +#include <linux/iosys-map.h>
>> +
>>   #include <drm/drm_atomic.h>
>>   #include <drm/drm_atomic_helper.h>
>>   #include <drm/drm_blend.h>
>> -#include <drm/drm_gem_atomic_helper.h>
>>   #include <drm/drm_fourcc.h>
>> +#include <drm/drm_framebuffer.h>
>> +#include <drm/drm_gem_atomic_helper.h>
>> +#include <drm/drm_panic.h>
>> +#include <drm/ttm/ttm_bo.h>
>>   
>>   #include "nouveau_bo.h"
>>   #include "nouveau_gem.h"
>> @@ -577,6 +582,125 @@ nv50_wndw_prepare_fb(struct drm_plane *plane, struct drm_plane_state *state)
>>   	return 0;
>>   }
>>   
>> +#define NV_TILE_BLK_BASE_HEIGHT_TESLA 4 /* In pixel */
>> +#define NV_TILE_BLK_BASE_HEIGHT 8	/* In pixel */
>> +#define NV_TILE_GOB_SIZE 64	/* In bytes */
>> +#define NV_TILE_BLK_WIDTH (NV_TILE_GOB_SIZE / 4) /* For 32 bits pixel */
> 
> This was a bit confusing to look at so I had to go and review how some of this
> works. I think it might be better to name this something like:
> 
> NV_TILE_GOB_WIDTH_BYTES
> 
> Since -technically- the size of a gob is much larger (from nouveau_display.c):
> 
> 	if (drm->client.device.info.family < NV_DEVICE_INFO_V0_FERMI)
> 		gob_size = 256;
> 	else
> 		gob_size = 512;
> 
> It's just you're only concerned about the width here.

Ah thanks, actually I wasn't sure why my gob size was different.
The corresponding define in nouveau_display.c is
https://elixir.bootlin.com/linux/v6.11.4/source/drivers/gpu/drm/nouveau/nouveau_display.c#L229

> 
>> +
>> +/* Only used by drm_panic get_scanout_buffer() and set_pixel(), so it is
>> + * protected by the drm panic spinlock
>> + */
>> +static u32 nv50_panic_blk_h;
>> +
>> +/* Return the framebuffer offset of the start of the block where pixel(x,y) is */
>> +static u32
>> +nv50_get_block_off(unsigned int x, unsigned int y, unsigned int width)
>> +{
>> +	u32 blk_x, blk_y, blk_columns;
>> +
>> +	blk_columns = DIV_ROUND_UP(width, NV_TILE_BLK_WIDTH);
>> +	blk_x = x / NV_TILE_BLK_WIDTH;
>> +	blk_y = y / nv50_panic_blk_h;
>> +
>> +	return ((blk_y * blk_columns) + blk_x) * NV_TILE_GOB_SIZE * nv50_panic_blk_h;
>> +}
>> +
>> +/* Turing and later have 2 level of tiles inside the block */
>> +static void
>> +nv50_set_pixel_swizzle(struct drm_scanout_buffer *sb, unsigned int x,
>> +		       unsigned int y, u32 color)
>> +{
>> +	u32 blk_off, off, swizzle;
>> +
>> +	blk_off = nv50_get_block_off(x, y, sb->width);
>> +
>> +	y = y % nv50_panic_blk_h;
>> +
>> +	/* Inside the block, use the fast address swizzle to compute the offset
>> +	 * For nvidia blocklinear, bit order is yn..y3 x3 y2 x2 y1 y0 x1 x0
>> +	 */
>> +	swizzle = (x & 3) | (y & 3) << 2 | (x & 4) << 2 | (y & 4) << 3;
>> +	swizzle |= (x & 8) << 3 | (y >> 3) << 7;
>> +	off = blk_off + swizzle * 4;
>> +
>> +	iosys_map_wr(&sb->map[0], off, u32, color);
>> +}
>> +
>> +static void
>> +nv50_set_pixel(struct drm_scanout_buffer *sb, unsigned int x, unsigned int y,
>> +	       u32 color)
>> +{
>> +	u32 blk_off, off;
>> +
>> +	blk_off = nv50_get_block_off(x, y, sb->width);
>> +
>> +	x = x % NV_TILE_BLK_WIDTH;
>> +	y = y % nv50_panic_blk_h;
>> +	off = blk_off + (x + y * NV_TILE_BLK_WIDTH) * 4;
>> +
>> +	iosys_map_wr(&sb->map[0], off, u32, color);
>> +}
>> +
>> +static u32
>> +nv50_get_block_height(u32 tile_mode, u16 chipset)
>> +{
>> +	if (chipset < 0xc0)
>> +		return NV_TILE_BLK_BASE_HEIGHT_TESLA * (1 << tile_mode);
>> +	else
>> +		return NV_TILE_BLK_BASE_HEIGHT * (1 << (tile_mode >> 4));
> 
> I see this is mentioned above around the definition of NV_TILE_BLK_BASE* - but
> we might want to leave a comment (or rename it) to make it more clear that
> this returns a size in pixels. Since we already have some functions in
> nouveau_display.c regarding similar but different calculations (like
> nouveau_get_height_in_blocks()).

Sure, I will add a comment here.

> 
> I was also going to ask if you might be able to reuse some of those functions
> - or have nouveau_display.c reuse some of your code where we verify
> framebuffer sizes. Mainly since we have some functions already for calculating
> width/height of a framebuffer in blocks. But I'm having a bit of trouble
> figuring out if that's possible/relevant, so I'll leave that to you to decide.

Yes, there are some duplicates between the two, and I can't reuse 
directly the functions from nouveau_display.c, because they don't fit 
what I need here.
If I try to share some code, is it ok to create a dispnv50/tile.[ch] ?
or is there a better place ?

> 
>> +}
>> +
>> +static int
>> +nv50_wndw_get_scanout_buffer(struct drm_plane *plane, struct drm_scanout_buffer *sb)
>> +{
>> +	struct drm_framebuffer *fb;
>> +	struct nouveau_bo *nvbo;
>> +	struct nouveau_drm *drm = nouveau_drm(plane->dev);
>> +	u16 chipset = drm->client.device.info.chipset;
>> +	u32 tile_mode;
>> +	u8 kind;
>> +
>> +	if (!plane->state || !plane->state->fb)
>> +		return -EINVAL;
>> +
>> +	fb = plane->state->fb;
>> +	nvbo = nouveau_gem_object(fb->obj[0]);
>> +
>> +	/* Don't support compressed format, or multiplane yet. */
>> +	if (nvbo->comp || fb->format->num_planes != 1)
>> +		return -EOPNOTSUPP;
>> +
>> +	if (nouveau_bo_map(nvbo)) {
>> +		pr_warn("nouveau bo map failed, panic won't be displayed\n");
> 
> I think we would want drm_warn() here

sure I will change that.
> 
> With the above changes handled/considered -
> 
> Reviewed-by: Lyude Paul <lyude@redhat.com>

Thanks a lot, I will send a v4 later this week.
> 
> Would be good to have james take another look at this if he's got the time,
> but I think this looks alright :)
> 
>> +		return -ENOMEM;
>> +	}
>> +
>> +	if (nvbo->kmap.bo_kmap_type & TTM_BO_MAP_IOMEM_MASK)
>> +		iosys_map_set_vaddr_iomem(&sb->map[0], (void __iomem *) nvbo->kmap.virtual);
>> +	else
>> +		iosys_map_set_vaddr(&sb->map[0], nvbo->kmap.virtual);
>> +
>> +	sb->height = fb->height;
>> +	sb->width = fb->width;
>> +	sb->pitch[0] = fb->pitches[0];
>> +	sb->format = fb->format;
>> +
>> +	nouveau_framebuffer_get_layout(fb, &tile_mode, &kind);
>> +	if (kind) {
>> +		/* If tiling is enabled, use set_pixel() to display correctly.
>> +		 * Only handle 32bits format for now.
>> +		 */
>> +		if (fb->format->cpp[0] != 4)
>> +			return -EOPNOTSUPP;
>> +		nv50_panic_blk_h = nv50_get_block_height(tile_mode, chipset);
>> +		if (chipset >= 0x160)
>> +			sb->set_pixel = nv50_set_pixel_swizzle;
>> +		else
>> +			sb->set_pixel = nv50_set_pixel;
>> +	}
>> +	return 0;
>> +}
>> +
>>   static const struct drm_plane_helper_funcs
>>   nv50_wndw_helper = {
>>   	.prepare_fb = nv50_wndw_prepare_fb,
>> @@ -584,6 +708,14 @@ nv50_wndw_helper = {
>>   	.atomic_check = nv50_wndw_atomic_check,
>>   };
>>   
>> +static const struct drm_plane_helper_funcs
>> +nv50_wndw_primary_helper = {
>> +	.prepare_fb = nv50_wndw_prepare_fb,
>> +	.cleanup_fb = nv50_wndw_cleanup_fb,
>> +	.atomic_check = nv50_wndw_atomic_check,
>> +	.get_scanout_buffer = nv50_wndw_get_scanout_buffer,
>> +};
>> +
>>   static void
>>   nv50_wndw_atomic_destroy_state(struct drm_plane *plane,
>>   			       struct drm_plane_state *state)
>> @@ -732,7 +864,10 @@ nv50_wndw_new_(const struct nv50_wndw_func *func, struct drm_device *dev,
>>   		return ret;
>>   	}
>>   
>> -	drm_plane_helper_add(&wndw->plane, &nv50_wndw_helper);
>> +	if (type == DRM_PLANE_TYPE_PRIMARY)
>> +		drm_plane_helper_add(&wndw->plane, &nv50_wndw_primary_helper);
>> +	else
>> +		drm_plane_helper_add(&wndw->plane, &nv50_wndw_helper);
>>   
>>   	if (wndw->func->ilut) {
>>   		ret = nv50_lut_init(disp, mmu, &wndw->ilut);
> 

