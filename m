Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 62F34615FCA
	for <lists+nouveau@lfdr.de>; Wed,  2 Nov 2022 10:32:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8FCFF10E453;
	Wed,  2 Nov 2022 09:32:22 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 91AE310E44F
 for <nouveau@lists.freedesktop.org>; Wed,  2 Nov 2022 09:32:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667381536;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qCDrX0xKXyu8erIDNjxDiJKuT0hxZZKKE3HXuUGBVDQ=;
 b=g86kVOmVqcJ3jvx7QLkap7dOJqWx4Jkz4xwCyM5E3D5uU39i8xAefQvqxOKN5H5LoxvUsS
 PIC72S+nNsAaw1AjBB0WT2jmkEDsxqvhrcNE9IXrbtcn7F5l8j3iSkrfnqjMOP901MtXZm
 CJcXGUj8XU5QGMG0V3YLjmFRZQfk710=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-573-57QhGF-2M_WQSyBB2oVoNw-1; Wed, 02 Nov 2022 05:32:15 -0400
X-MC-Unique: 57QhGF-2M_WQSyBB2oVoNw-1
Received: by mail-wm1-f69.google.com with SMTP id
 c5-20020a1c3505000000b003c56da8e894so853382wma.0
 for <nouveau@lists.freedesktop.org>; Wed, 02 Nov 2022 02:32:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=qCDrX0xKXyu8erIDNjxDiJKuT0hxZZKKE3HXuUGBVDQ=;
 b=wR26vE4dP1ZCzBpn/apK6YnN9fnrRosgbq63kyonZUiW7I9c9dpNEfgDuNessJp2dO
 Hfy2wxmv7CE6slyz1d7dcF1cC9XFCd1Nc3hoTnTxHvaEL6173VNFHUE8tU8mY8IM/ydG
 uRIQmC5n7tlElcHCCtOr7tPa+TVWHwSKTrzP7wHFN8QhRqCQG47njHHEslSjQUTelNE+
 sDLgSetCTLDNUdWXwZg/o7G5dAR8pwOpV8+tf14MKLCRaW5g2MAuR5Hp6i7u59iuNqdo
 bGpl5/3htlT1CNf5zX+uu/xsB+8w1/GMd/Yf5LNQRiK93GAJGtmD/2fJAvbYUh7VHv62
 wqcg==
X-Gm-Message-State: ACrzQf0SGEZPK95wq5wqDUMVEn6WxxetH/FLmYT3t70H5oaUQWALMX/i
 JeBf+8VlhXpAwr6NYe/KXjuZiaw6ky0k2bUP08rheBmkcYJ/6yal7+eYCOC/ItznnLnE3sOEoHB
 I53Cyg1x8JEIfE7Syk8OZgneelg==
X-Received: by 2002:a05:600c:6023:b0:3cf:7dc1:e08e with SMTP id
 az35-20020a05600c602300b003cf7dc1e08emr5443623wmb.154.1667381534285; 
 Wed, 02 Nov 2022 02:32:14 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM7iks5yFnak5X2iZPcs6wSoPN4c8RmVdgyjVaQzUQOEwDY0j8GZM7MD/vLKrS0XyFefd22bEw==
X-Received: by 2002:a05:600c:6023:b0:3cf:7dc1:e08e with SMTP id
 az35-20020a05600c602300b003cf7dc1e08emr5443583wmb.154.1667381533975; 
 Wed, 02 Nov 2022 02:32:13 -0700 (PDT)
Received: from [192.168.1.130] (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 x21-20020a1c7c15000000b003b492753826sm1361990wmc.43.2022.11.02.02.32.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 02 Nov 2022 02:32:13 -0700 (PDT)
Message-ID: <3ab32fc3-f2aa-1b42-fd87-557482ab56d5@redhat.com>
Date: Wed, 2 Nov 2022 10:32:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
To: Thomas Zimmermann <tzimmermann@suse.de>, daniel@ffwll.ch,
 airlied@gmail.com, sam@ravnborg.org, mripard@kernel.org,
 maarten.lankhorst@linux.intel.com
References: <20221024111953.24307-1-tzimmermann@suse.de>
 <20221024111953.24307-18-tzimmermann@suse.de>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <20221024111953.24307-18-tzimmermann@suse.de>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Subject: Re: [Nouveau] [PATCH v2 17/21] drm/fb-helper: Perform all fbdev I/O
 with the same implementation
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
Cc: linux-hyperv@vger.kernel.org, linux-aspeed@lists.ozlabs.org,
 nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 virtualization@lists.linux-foundation.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-samsung-soc@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, linux-rockchip@lists.infradead.org,
 xen-devel@lists.xenproject.org, linux-sunxi@lists.linux.dev,
 linux-arm-msm@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 etnaviv@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 spice-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-mips@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 freedreno@lists.freedesktop.org
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

On 10/24/22 13:19, Thomas Zimmermann wrote:
> Implement the fbdev's read/write helpers with the same functions. Use
> the generic fbdev's code as template. Convert all drivers.
> 
> DRM's fb helpers must implement regular I/O functionality in struct
> fb_ops and possibly perform a damage update. Handle all this in the
> same functions and convert drivers. The functionality has been used
> as part of the generic fbdev code for some time. The drivers don't
> set struct drm_fb_helper.fb_dirty, so they will not be affected by
> damage handling.
> 
> For I/O memory, fb helpers now provide drm_fb_helper_cfb_read() and
> drm_fb_helper_cfb_write(). Several drivers require these. Until now
> tegra used I/O read and write, although the memory buffer appears to
> be in system memory. So use _sys_ helpers now.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---

[...]

> +static ssize_t __drm_fb_helper_write(struct fb_info *info, const char __user *buf, size_t count,
> +				     loff_t *ppos, drm_fb_helper_write_screen write_screen)
> +{

[...]

> +	/*
> +	 * Copy to framebuffer even if we already logged an error. Emulates
> +	 * the behavior of the original fbdev implementation.
> +	 */
> +	ret = write_screen(info, buf, count, pos);
> +	if (ret < 0)
> +		return ret; /* return last error, if any */
> +	else if (!ret)
> +		return err; /* return previous error, if any */
> +
> +	*ppos += ret;
> +

Should *ppos be incremented even if the previous error is returned?

The write_screen() succeeded anyways, even when the count written was
smaller than what the caller asked for.

>  /**
> - * drm_fb_helper_sys_read - wrapper around fb_sys_read
> + * drm_fb_helper_sys_read - Implements struct &fb_ops.fb_read for system memory
>   * @info: fb_info struct pointer
>   * @buf: userspace buffer to read from framebuffer memory
>   * @count: number of bytes to read from framebuffer memory
>   * @ppos: read offset within framebuffer memory
>   *
> - * A wrapper around fb_sys_read implemented by fbdev core
> + * Returns:
> + * The number of read bytes on success, or an error code otherwise.
>   */

This sentence sounds a little bit off to me. Shouldn't be "number of bytes read"
instead? I'm not a native English speaker though, so feel free to just ignore me.

[...]

>  
> +static ssize_t fb_read_screen_base(struct fb_info *info, char __user *buf, size_t count,
> +				   loff_t pos)
> +{
> +	const char __iomem *src = info->screen_base + pos;
> +	size_t alloc_size = min_t(size_t, count, PAGE_SIZE);
> +	ssize_t ret = 0;
> +	int err = 0;

Do you really need these two? AFAIK ssize_t is a signed type
so you can just use the ret variable to store and return the
errno value.

[...]

> +static ssize_t fb_write_screen_base(struct fb_info *info, const char __user *buf, size_t count,
> +				    loff_t pos)
> +{
> +	char __iomem *dst = info->screen_base + pos;
> +	size_t alloc_size = min_t(size_t, count, PAGE_SIZE);
> +	ssize_t ret = 0;
> +	int err = 0;

Same here.

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

