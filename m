Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AEE5616009
	for <lists+nouveau@lfdr.de>; Wed,  2 Nov 2022 10:40:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D04010E466;
	Wed,  2 Nov 2022 09:40:33 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 04A5B10E467
 for <nouveau@lists.freedesktop.org>; Wed,  2 Nov 2022 09:40:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667382023;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=BsLrquRWckXT1s1aby8jZXWvTG60TzDOu2w8x1+2PdY=;
 b=iI5LiUOjefm+6P3gfHng74V4pYxAwT3Sq0jfCCq8mGhUN6jXcrGsz3xL/woYlQwgVdAnMz
 djbxyTJQR1612h4g/i0LwaQRLyeZW3BecWVTD9Q098y36/dyuTE/q27wvxK7t1c/w3SY6T
 m7blhdk6oozqTCWCvyHFLPUDTHAY7DQ=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-88-8iGQzWexPIS-4DJtiWRiKQ-1; Wed, 02 Nov 2022 05:40:18 -0400
X-MC-Unique: 8iGQzWexPIS-4DJtiWRiKQ-1
Received: by mail-wm1-f70.google.com with SMTP id
 m34-20020a05600c3b2200b003cf549cb32bso850409wms.1
 for <nouveau@lists.freedesktop.org>; Wed, 02 Nov 2022 02:40:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=BsLrquRWckXT1s1aby8jZXWvTG60TzDOu2w8x1+2PdY=;
 b=f5LxHuRWaaIqtjshmReZKGgCNue1alBnPqu/milvKuVDW3yYVuYmqJ6xTzOROHRu/I
 KilBwBmT7A5s+ZLOr+TPweKherRBN6X6BErf9uOrC93pl9aXE9ouN8NMlhYjI5J72PTx
 pALRfNd/y9klJqg4gV0mCWIoUY/zRBJFd3V1ibLsJx6m6Z2rhJCam45dXqko32uIJMAk
 ICh7G+flwSCJWvnAmcZLojzEQGr0QIt8W708lL4MW0fQSkVdoL2hj6JI1WPLZDKePxHE
 bIfjCRAsK45sgNyf9RDP0QUcJWiv8atX2zJfGsnB5X3xMmNjKdIPTtX9C5oOq2jumq0I
 ni+Q==
X-Gm-Message-State: ACrzQf0Na86aGnE75adNj4SpzJ1XumAmfl6+TcAWi54PFLuooLqkNhNO
 79kLiU2PodzCgg2IhvC3CCDqnN0ugDpYd23g+YM7Hiymc4yAzW0WBHOziQhSCDcWuufsrIOA8r5
 GiXu+ljsjYmGaJSnv4Esiu9k8Nw==
X-Received: by 2002:adf:ba8f:0:b0:22c:def3:1179 with SMTP id
 p15-20020adfba8f000000b0022cdef31179mr14547796wrg.571.1667382017689; 
 Wed, 02 Nov 2022 02:40:17 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM5M29YlmTkXAEgNYduNYpaEq18eaSYaR/je5Gn7y2xNrovwH6Pttvb6rYpMLmmOPDm/qr+vag==
X-Received: by 2002:adf:ba8f:0:b0:22c:def3:1179 with SMTP id
 p15-20020adfba8f000000b0022cdef31179mr14547781wrg.571.1667382017447; 
 Wed, 02 Nov 2022 02:40:17 -0700 (PDT)
Received: from [192.168.1.130] (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 j20-20020a05600c191400b003b47e8a5d22sm1924445wmq.23.2022.11.02.02.40.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 02 Nov 2022 02:40:16 -0700 (PDT)
Message-ID: <7ac0da2c-0a43-4c02-4199-f48a50347171@redhat.com>
Date: Wed, 2 Nov 2022 10:40:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
To: Thomas Zimmermann <tzimmermann@suse.de>, daniel@ffwll.ch,
 airlied@gmail.com, sam@ravnborg.org, mripard@kernel.org,
 maarten.lankhorst@linux.intel.com
References: <20221024111953.24307-1-tzimmermann@suse.de>
 <20221024111953.24307-20-tzimmermann@suse.de>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <20221024111953.24307-20-tzimmermann@suse.de>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Subject: Re: [Nouveau] [PATCH v2 19/21] drm/fb-helper: Always initialize
 generic fbdev emulation
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
> Initialize the generic fbdev emulation even if it has been disabled
> on the kernel command line. The hotplug and mode initialization will
> fail accordingly.
> 
> The kernel parameter can still be changed at runtime and the emulation
> will initialize after hotplugging the connector.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

