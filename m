Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CA4BC61357A
	for <lists+nouveau@lfdr.de>; Mon, 31 Oct 2022 13:14:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 364DA10E1D4;
	Mon, 31 Oct 2022 12:13:50 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1547F10E1D4
 for <nouveau@lists.freedesktop.org>; Mon, 31 Oct 2022 12:13:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667218423;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2H8Fq04+XbNugdc6Ty/YSDXQIs5WWNt9cW9u1MIkjOA=;
 b=LyZfO8oK7WZg4YiS9L3p0sPvSDxJCNdr2Me/YfWcIWtG3BRFZltcOhxxLIrtskFui509hE
 xsInseEH2yFmN84gB9WUs/gQuBrkKynCG9+fUX6R3pQXdXRJ3+3lDQY7Th6RTNKRybZc4i
 Jd+OU8QSZF05D6AMylsox0LmSDOrFXE=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-301-dlkddF60PWqoMil6xd2FoQ-1; Mon, 31 Oct 2022 08:13:42 -0400
X-MC-Unique: dlkddF60PWqoMil6xd2FoQ-1
Received: by mail-wm1-f70.google.com with SMTP id
 f1-20020a1cc901000000b003cf703a4f08so328297wmb.2
 for <nouveau@lists.freedesktop.org>; Mon, 31 Oct 2022 05:13:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=2H8Fq04+XbNugdc6Ty/YSDXQIs5WWNt9cW9u1MIkjOA=;
 b=OCES9f092zZVHRvVQ8g1hYIZBT7ruCh8QhJkF9gB0z/+GXOL63ph4M+64ebmdDgglY
 o/B+Tt9Tvy7GCjGwIWQhSHeFO9XpLmCA+GZ2ubFasOPZkPK4kcMJREvj30WUpuhJVDQA
 eStGs6LmyIDpnOmjyq8ZzQX+0tNOv9WAhWeiZoiM5CQdwkDTeN/06XkdD3UrcqGd/fd7
 8Q3SDDsawu9izfpJ3lsYb34xchW5Vsp5ciNVyD5JdAlfFp6XSbvHWRphUzlCM2bW2U29
 A0vkR6uRJd09TEQRLdmHTGJ3f2eafVddmuYeu9nfdh+EqWVg+jb14oInyZ21a3mQuhrO
 JXzg==
X-Gm-Message-State: ACrzQf3DptlS8GkL4QB7yXuWxuunAJU3Db3QUDZGIA9+iwzYHKXdVWXs
 FPq30jRR/b1FhCvl/egYPgGsSDuMP3H4kN94nbumOiDntGuzFq+KmCqfiSYYAU8scLVjnnUtQa/
 tmXSFyS5/rei28RzSmFMiM6DvPA==
X-Received: by 2002:a5d:64cd:0:b0:236:6d1c:c1a2 with SMTP id
 f13-20020a5d64cd000000b002366d1cc1a2mr8196677wri.360.1667218420925; 
 Mon, 31 Oct 2022 05:13:40 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM6+QX10ZDmjvc1IfL0XXmvBimtEQHEjFBrrHb50hNQes1zzurNnpW//og1SN1o9c/o5tX548g==
X-Received: by 2002:a5d:64cd:0:b0:236:6d1c:c1a2 with SMTP id
 f13-20020a5d64cd000000b002366d1cc1a2mr8196664wri.360.1667218420692; 
 Mon, 31 Oct 2022 05:13:40 -0700 (PDT)
Received: from [192.168.1.130] (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 az29-20020a05600c601d00b003cdf141f363sm7207444wmb.11.2022.10.31.05.13.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 31 Oct 2022 05:13:40 -0700 (PDT)
Message-ID: <231be619-96b7-b725-0735-0275e07477d8@redhat.com>
Date: Mon, 31 Oct 2022 13:13:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
To: Thomas Zimmermann <tzimmermann@suse.de>, daniel@ffwll.ch,
 airlied@gmail.com, sam@ravnborg.org, mripard@kernel.org,
 maarten.lankhorst@linux.intel.com
References: <20221024111953.24307-1-tzimmermann@suse.de>
 <20221024111953.24307-5-tzimmermann@suse.de>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <20221024111953.24307-5-tzimmermann@suse.de>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Subject: Re: [Nouveau] [PATCH v2 04/21] drm/amdgpu: Don't set struct
 drm_driver.output_poll_changed
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
> Don't set struct drm_driver.output_poll_changed. It's used to restore
> the fbdev console. But as amdgpu uses generic fbdev emulation, the
> console is being restored by the DRM client helpers already. See the
> functions drm_kms_helper_hotplug_event() and
> drm_kms_helper_connector_hotplug_event() in drm_probe_helper.c.
> 
> v2:
> 	* fix commit description (Christian)
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

