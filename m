Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C70B613634
	for <lists+nouveau@lfdr.de>; Mon, 31 Oct 2022 13:25:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D3DE10E252;
	Mon, 31 Oct 2022 12:25:43 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6FBFF10E244
 for <nouveau@lists.freedesktop.org>; Mon, 31 Oct 2022 12:25:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667219131;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=G3lFqSUva8cf7eu6ekgojQtwZeR44+C1N0qDI7SjLRc=;
 b=N0Py9mgZb8+MUe4ajuuSwz5EnMwhSkH8Q2x6aiVEiTHRbU2zrC2lCjfCTEr+4XaBVOXiVp
 2K6jjTGzznQQG0/X48JWWrjWl7vWtMMo4KltoHHG8ge0a6EdLYDBPKtKXFo5i819zlhQ2a
 AR/MFuvQK6DyZ0VLaH2fzvHWCD+0Jbo=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-322-nMe2bJy_P5q-ztMQnpsnpw-1; Mon, 31 Oct 2022 08:25:28 -0400
X-MC-Unique: nMe2bJy_P5q-ztMQnpsnpw-1
Received: by mail-wr1-f71.google.com with SMTP id
 d10-20020adfa34a000000b00236616a168bso3011177wrb.18
 for <nouveau@lists.freedesktop.org>; Mon, 31 Oct 2022 05:25:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=G3lFqSUva8cf7eu6ekgojQtwZeR44+C1N0qDI7SjLRc=;
 b=KypZ5upjABkYuPmdzeui+sTGSQ4rWrMtL8zMMR5hose08LqPK2QoS4m2UrVJIixOP1
 scW+NGPWdYapg+Ai7IcBGGUGKj0MUaxDRHhBAcLxwwILzvTwsecyL5HzVMj+Nt4HtPvS
 Ckop9wcxLbEvye0akK708/8orTkvXudrs0VAmLboLnpkBbEvBMrLg5U4MKBcPWrUY+Ec
 MANe8pwHkf7vxS/Qz5wDOvP5LATiNidQENZ3SZfcKT8HYiSfUr0oW+GNKlkW9Zwq5WVg
 YRYWXITztw7adu02lmrlbFQrMYWLqSOb5n1RV+pjrJQ/FltLAoINlBPlUpYYGjT6vEAA
 SmDA==
X-Gm-Message-State: ACrzQf0OTSlECA06G7wLDL7lGhplCBlaePH0zX3bMPd2qBMldl5/Omk8
 EShFR7CfUNieW8Kr33DLKvMFgTrmyI3cShU+7Ynt58SPMRa2GpEmoGqPYlE8H5CkeO74IK/iPV1
 UyzpEKG/H0hEdFfvgdSZ6AqG7GQ==
X-Received: by 2002:a5d:498a:0:b0:236:58ef:6796 with SMTP id
 r10-20020a5d498a000000b0023658ef6796mr8133550wrq.399.1667219127469; 
 Mon, 31 Oct 2022 05:25:27 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM5OaQ4lCdeJx0P85vXeCC9ohI1f8Am/sl3oDUbbTCyW5S09EQhBnmsKMGoGzObNL20EAzLquw==
X-Received: by 2002:a5d:498a:0:b0:236:58ef:6796 with SMTP id
 r10-20020a5d498a000000b0023658ef6796mr8133518wrq.399.1667219127226; 
 Mon, 31 Oct 2022 05:25:27 -0700 (PDT)
Received: from [192.168.1.130] (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 m13-20020a05600c3b0d00b003bfaba19a8fsm7382582wms.35.2022.10.31.05.25.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 31 Oct 2022 05:25:26 -0700 (PDT)
Message-ID: <53f341ad-4b72-5546-f752-ca705d62d63c@redhat.com>
Date: Mon, 31 Oct 2022 13:25:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
To: Thomas Zimmermann <tzimmermann@suse.de>, daniel@ffwll.ch,
 airlied@gmail.com, sam@ravnborg.org, mripard@kernel.org,
 maarten.lankhorst@linux.intel.com
References: <20221024111953.24307-1-tzimmermann@suse.de>
 <20221024111953.24307-13-tzimmermann@suse.de>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <20221024111953.24307-13-tzimmermann@suse.de>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Subject: Re: [Nouveau] [PATCH v2 12/21] drm/fb_helper: Rename field fbdev to
 info in struct drm_fb_helper
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
> Rename struct drm_fb_helper.fbdev to info. The current name is
> misleading as it overlaps with generic fbdev naming conventions.
> Adapt to the usual naming in fbdev drivers by calling the field
> 'info'. No functional changes.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---

Agreed. I got confused by this naming in the past.

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

