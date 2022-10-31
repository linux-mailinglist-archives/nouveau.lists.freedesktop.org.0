Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CC00F6137F6
	for <lists+nouveau@lfdr.de>; Mon, 31 Oct 2022 14:27:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F08D310E29F;
	Mon, 31 Oct 2022 13:27:22 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2972F10E2A7
 for <nouveau@lists.freedesktop.org>; Mon, 31 Oct 2022 13:27:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667222838;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GwqNSS0OJIleR6uoXEXg4AgYpmJqcWP2KGT201SIVMg=;
 b=W0vqrJETrrXTqQoG3vpBmoqKSRrJS1/Jq7LTpPu+mO9deitZfgbdUDFUfCZ5bixBYlMIUZ
 GrDC02uosAahqXIn6bqCVSZB6T87vh0yNDdytr1uBX2vmgQpsTb5GxCpQz186gv0yM5s91
 Ju+RHUdGinbYv4UwP1yzMQLflk8HTSQ=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-36-bsEAdHaYNESZjdZNfsF_CA-1; Mon, 31 Oct 2022 09:27:17 -0400
X-MC-Unique: bsEAdHaYNESZjdZNfsF_CA-1
Received: by mail-wr1-f72.google.com with SMTP id
 d23-20020adfa417000000b002364a31b7c9so3053643wra.15
 for <nouveau@lists.freedesktop.org>; Mon, 31 Oct 2022 06:27:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=GwqNSS0OJIleR6uoXEXg4AgYpmJqcWP2KGT201SIVMg=;
 b=JG3NjjSjAwWEYi/NnrOwj8OhJrdvF2pLTHyKt3AGnbJPWNCMgr93sSf8vw9XuqrTqB
 9ViBcVuyctdnw+3O9C7lcTT3jrSKcnoxNtrt6FoQYVRWYOJjk7pAkskLB0qgxY07v3dV
 uoELZkdEk6XpTwjvCVAjB+mRrBlfL3tglvTF+5Nr9SJRE0MbfpJjICc+dCEqPcGlJRIU
 zqe3QpRFYDr9b3NhbNm7GVfR4E05MkBzJ4tOK9mBJcnIZJbXwKlfltJqd1gvnU7Hqwen
 Xqk/FolDrvisW+L/ufBj4slRjHnJCl5PJ3m+zjYJi83Vw+GrE8zXxyZEmbM3+vnjMsxu
 nD+A==
X-Gm-Message-State: ACrzQf0pS0Xvs28NXzy3ongl5dpSFXtJ7eNCNqFMLvGmYIoDUCFwBjlV
 tqzGgLePWKg0nmsclUV9GWcvP6Q9e6JSbu5+vTVU6yjNPGqww9xvwVA2PZGsBCA2ziN70+/Q7Xn
 n3wP3o3dSni3D0+4TEn+9FJ0HMg==
X-Received: by 2002:adf:ec8a:0:b0:236:5b80:da83 with SMTP id
 z10-20020adfec8a000000b002365b80da83mr7858632wrn.509.1667222836008; 
 Mon, 31 Oct 2022 06:27:16 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM4XoYVkE5jE7vlhuKQ/BuqMv6qQj/pE66jVA36/qVXv1WZdIDiMFN0/ixJs2zjwBzGxtBPgyA==
X-Received: by 2002:adf:ec8a:0:b0:236:5b80:da83 with SMTP id
 z10-20020adfec8a000000b002365b80da83mr7858599wrn.509.1667222835772; 
 Mon, 31 Oct 2022 06:27:15 -0700 (PDT)
Received: from [192.168.1.130] (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 bg37-20020a05600c3ca500b003b477532e66sm25116881wmb.2.2022.10.31.06.27.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 31 Oct 2022 06:27:15 -0700 (PDT)
Message-ID: <0fe3974c-de66-9eaa-b56a-ed1d07644e4c@redhat.com>
Date: Mon, 31 Oct 2022 14:27:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
To: Thomas Zimmermann <tzimmermann@suse.de>, daniel@ffwll.ch,
 airlied@gmail.com, sam@ravnborg.org, mripard@kernel.org,
 maarten.lankhorst@linux.intel.com
References: <20221024111953.24307-1-tzimmermann@suse.de>
 <20221024111953.24307-15-tzimmermann@suse.de>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <20221024111953.24307-15-tzimmermann@suse.de>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Subject: Re: [Nouveau] [PATCH v2 14/21] drm/fb-helper: Rename
 drm_fb_helper_unregister_fbi() to use _info postfix
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
> Rename drm_fb_helper_unregister_fbi() to drm_fb_helper_unregister_info()
> as part of unifying the naming within fbdev helpers. Adapt drivers. No
> functional changes.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

