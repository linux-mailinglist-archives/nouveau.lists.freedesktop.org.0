Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C67135BEF17
	for <lists+nouveau@lfdr.de>; Tue, 20 Sep 2022 23:24:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 37BC410E2BE;
	Tue, 20 Sep 2022 21:24:11 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 728FD10EC16
 for <nouveau@lists.freedesktop.org>; Fri, 16 Sep 2022 11:22:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1663327328;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FZStFFZ+iI6FXYbByTwSalDf1O2JmtSMbYAUVSsU2G0=;
 b=FQHyTAlQesxTg66gKAs8pNPjCblInH9m5U0Z7zJDgqautU+ihe5UXNJ4m442qefTSEDYSZ
 v4zBvrIupvE4c07vBTbfgjhLAhKRzk4YdisOLODg/TWsnU9OMbDdtN9Z3zMtdvoA7HRBcM
 COH5pJ/DmABcrCA1bc8/kqe9UF+ZGGM=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-495-X4U0b1C5M_Cp0s9riPby3w-1; Fri, 16 Sep 2022 07:22:07 -0400
X-MC-Unique: X4U0b1C5M_Cp0s9riPby3w-1
Received: by mail-wm1-f71.google.com with SMTP id
 b5-20020a05600c4e0500b003b499f99aceso1913499wmq.1
 for <nouveau@lists.freedesktop.org>; Fri, 16 Sep 2022 04:22:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=FZStFFZ+iI6FXYbByTwSalDf1O2JmtSMbYAUVSsU2G0=;
 b=ed9X4/oWhu/1eT4rvn6M1wBv8ulolTPWFmBeKDy4e+9yAENCK0xBqUsVMc7v8uj547
 s+ir8LuGUi/NFheiNt9AkIMun6LsGtGYTbi30wTM9bBvocVGP4YyHcKxTf+/U53xCkC9
 HcfJYcRGprUvrOs/saXHajd83++plsiBbGriRyxnQGk22NAab43dgbKErp9XWr66UhoW
 2hMgz601eBYp3BvAObYXHcFYn4xn5P0o5Q1H4dOgAGLKzYh6+/Ti0VtloRaPsIMaeM6e
 RR5TRtorV1YCJgcGfD16pDM8LaGw3ZHpsj+A4yfA+uHDJhBoYW/5NwYYkFRFh00OoHIr
 6bEg==
X-Gm-Message-State: ACrzQf3XuGKTY+qlpBJ1yYCQmrsW9PqkGLRa+vABZPAl1HJPlyAaZB70
 O8zA+QL4PGkpU5aPZmXiKwYI2FtNi0x5GTbJrirEUhScNWOyhM8HFgCAbqI50P+sPBPeA4OLPkm
 5CJaVa21DSpbSzWaIJogMBnJO1Q==
X-Received: by 2002:a05:600c:2142:b0:3b4:9289:9d4e with SMTP id
 v2-20020a05600c214200b003b492899d4emr3014121wml.197.1663327326459; 
 Fri, 16 Sep 2022 04:22:06 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM50/Fus1+u1OkFAc1JDfNO6cvMZsMd9NEZGcHTTB2Bq15UChaJpRUR0BIpVpBusOvuQyI2Tvg==
X-Received: by 2002:a05:600c:2142:b0:3b4:9289:9d4e with SMTP id
 v2-20020a05600c214200b003b492899d4emr3014107wml.197.1663327326256; 
 Fri, 16 Sep 2022 04:22:06 -0700 (PDT)
Received: from [192.168.1.130] (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 u5-20020a5d4345000000b002287d99b455sm4645486wrr.15.2022.09.16.04.22.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 16 Sep 2022 04:22:05 -0700 (PDT)
Message-ID: <7080a54e-9e0d-93f4-ecba-150d3af03226@redhat.com>
Date: Fri, 16 Sep 2022 13:22:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
To: Thomas Zimmermann <tzimmermann@suse.de>,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, airlied@linux.ie,
 daniel@ffwll.ch, bskeggs@redhat.com, kherbst@redhat.com, lyude@redhat.com,
 laurent.pinchart@ideasonboard.com, kieran.bingham+renesas@ideasonboard.com,
 jyri.sarha@iki.fi, tomba@kernel.org, sam@ravnborg.org
References: <20220909105947.6487-1-tzimmermann@suse.de>
 <20220909105947.6487-3-tzimmermann@suse.de>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <20220909105947.6487-3-tzimmermann@suse.de>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Tue, 20 Sep 2022 21:24:04 +0000
Subject: Re: [Nouveau] [PATCH 2/4] drm/plane: Allocate planes with
 drm_universal_plane_alloc()
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
Cc: linux-renesas-soc@vger.kernel.org, nouveau@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

On 9/9/22 12:59, Thomas Zimmermann wrote:
> Provide drm_univeral_plane_alloc(), which allocated an initializes a
> plane. Code for non-atomic drivers uses this pattern. Convert it to
> the new function. The modeset helpers contain a quirk for handling their
> color formats differently. Set the flag outside plane allocation.
> 
> The new function is already deprecated to some extend. Drivers should
> rather use drmm_univeral_plane_alloc() or drm_universal_plane_init().
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---

[...]

>  
> +__printf(10, 11)
> +void *__drm_universal_plane_alloc(struct drm_device *dev,
> +				  size_t size, size_t offset,
> +				  uint32_t possible_crtcs,
> +				  const struct drm_plane_funcs *funcs,
> +				  const uint32_t *formats,
> +				  unsigned int format_count,
> +				  const uint64_t *format_modifiers,
> +				  enum drm_plane_type plane_type,
> +				  const char *name, ...);
> +
> +/**
> + * drm_universal_plane_alloc - Allocate and initialize an universal plane object

Should functions kernel-doc definitions use parenthesis or not? I see in
https://elixir.bootlin.com/linux/latest/source/Documentation/doc-guide/kernel-doc.rst#L59
that the example has it but notice that there is not consistency in DRM
about this.

> + * @dev: DRM device
> + * @type: the type of the struct which contains struct &drm_plane
> + * @member: the name of the &drm_plane within @type
> + * @possible_crtcs: bitmask of possible CRTCs
> + * @funcs: callbacks for the new plane
> + * @formats: array of supported formats (DRM_FORMAT\_\*)
> + * @format_count: number of elements in @formats
> + * @format_modifiers: array of struct drm_format modifiers terminated by
> + *                    DRM_FORMAT_MOD_INVALID
> + * @plane_type: type of plane (overlay, primary, cursor)
> + * @name: printf style format string for the plane name, or NULL for default name
> + *
> + * Allocates and initializes a plane object of type @type. The caller
> + * is responsible for releasing the allocated memory with kfree().
> + *

I thought that all the drmm_*_alloc() managed interfaces should use the
drmm_k{z,m}alloc() helpers, so that the memory is automatically freed
on the last drm_dev_put() call ?

Other than those two nits, the patch looks good to me.

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

