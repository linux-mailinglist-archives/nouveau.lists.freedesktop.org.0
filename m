Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B11C844EF74
	for <lists+nouveau@lfdr.de>; Fri, 12 Nov 2021 23:37:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B09E76E0D8;
	Fri, 12 Nov 2021 22:37:39 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC91F6E0B9
 for <nouveau@lists.freedesktop.org>; Fri, 12 Nov 2021 22:37:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1636756657;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=j8UFd87L7Ab8fMSkAQc3vH/XiCMU7sezVLrwRYH/XDg=;
 b=ROU0xXFvW2PAEHPMSHr93DW2nQVgLc8j7Dt5eLQT2fEJlf/EHpzmiNknOmT1IBvMn7XdTk
 dtk1GmTckwG567ZvA2jN9ecEv5XnxCkM0YSnle8BW99Ep5/J3hYoruWx2eVqNDwyEDAkyd
 ONVDnQwg0msQBEmsIa+/KXunNKMMMJU=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-225-txr80TrzMBaNigVD2ld1Yg-1; Fri, 12 Nov 2021 17:37:33 -0500
X-MC-Unique: txr80TrzMBaNigVD2ld1Yg-1
Received: by mail-qt1-f199.google.com with SMTP id
 x28-20020ac8701c000000b0029f4b940566so8293853qtm.19
 for <nouveau@lists.freedesktop.org>; Fri, 12 Nov 2021 14:37:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:organization:user-agent:mime-version
 :content-transfer-encoding;
 bh=j8UFd87L7Ab8fMSkAQc3vH/XiCMU7sezVLrwRYH/XDg=;
 b=g+mB2bS64pJ3yOcOrylTMZhkaBDvE4UdVGE4exgPAtCSAi9aOgA10wUQW1PVTNYQKy
 wMTftQpAXZ+w1SvHSE+7fbxz/yiSMcIYbhB95H6q+ozvHQ1ARR6d9QNka9tk4sj3UAlu
 yUKGwUWEFztQjW1siKFFUxTPiswsNjy5PHDjvpkapF5/4u1hrjVjHS42yxgM0xGtfLGF
 TpO8HCZwHxuODFj7r8FA84WiztNRD4wKYgbKXBjAPdXiJ4qilQGDbUNIC8O0iDqf9uhc
 9PQqqqxxCzjiQ1Ox9Jjq8dxdzUFXcXWGWRHsolvr4ww83ULJwxiCkHX4R0cjTH4q1Kwy
 5gzQ==
X-Gm-Message-State: AOAM530nyrLuna2g1l8WG7euoS0d1ey7yP4vdEGaQblYovvc9o2H7bHv
 EHY3YmflIErQrNPVjScHWkLCqE5szE4LBMd9LnO63+vEpqheWcBIdJWT4CELbodBb3kp7JUOLGu
 u7CJfhdjA3mILwoicZVeamzfLlA==
X-Received: by 2002:a05:622a:307:: with SMTP id
 q7mr20280371qtw.330.1636756653002; 
 Fri, 12 Nov 2021 14:37:33 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwmv2+s9HsIhOZaWW0wh6WQGFS4c9E6qdrActSt8eoSle+Ac4DscVPTJ81svE0EOruG6rZTrQ==
X-Received: by 2002:a05:622a:307:: with SMTP id
 q7mr20280350qtw.330.1636756652794; 
 Fri, 12 Nov 2021 14:37:32 -0800 (PST)
Received: from [192.168.8.138] (pool-96-230-249-157.bstnma.fios.verizon.net.
 [96.230.249.157])
 by smtp.gmail.com with ESMTPSA id l1sm3377960qkp.65.2021.11.12.14.37.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Nov 2021 14:37:32 -0800 (PST)
Message-ID: <462fc433630bf6f5b059b6f6f5a62374b0ddd410.camel@redhat.com>
From: Lyude Paul <lyude@redhat.com>
To: Karol Herbst <kherbst@redhat.com>, dri-devel@lists.freedesktop.org
Date: Fri, 12 Nov 2021 17:37:31 -0500
In-Reply-To: <20211110133157.553251-1-kherbst@redhat.com>
References: <20211110133157.553251-1-kherbst@redhat.com>
Organization: Red Hat Inc.
User-Agent: Evolution 3.40.4 (3.40.4-2.fc34)
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lyude@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Subject: Re: [Nouveau] [PATCH] MAINTAINERS: update information for nouveau
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
Cc: David Airlie <airlied@linux.ie>, nouveau@lists.freedesktop.org,
 Ben Skeggs <bskeggs@redhat.com>, Daniel Vetter <daniel@ffwll.ch>
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

Acked-by: Lyude Paul <lyude@redhat.com>

On Wed, 2021-11-10 at 14:31 +0100, Karol Herbst wrote:
> Some side notes on this. Atm we do want to use gitlab for bug tracking and
> merge requests. But due to the nature of the current linux kernel
> development, we can only do so for nouveau internal changes.
> 
> Everything else still needs to be sent as emails and this is also includes
> changes to UAPI etc.
> 
> Anyway, if somebody wants to submit patches via gitlab, they are free to
> do so and this should just make this more official and documented.
> 
> People listed as maintainers are such that have push access to drm-misc
> (where changes are pushed to after landing in gitlab) and are known
> nouveau developers.
> We did this already for some trivial changes and critical bug fixes
> already, we just weren't thinking about updating the MAINTAINERS file.
> 
> Cc: Ben Skeggs <bskeggs@redhat.com>
> Cc: Lyude Paul <lyude@redhat.com>
> Cc: David Airlie <airlied@linux.ie>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: dri-devel@lists.freedesktop.org
> Cc: nouveau@lists.freedesktop.org
> Signed-off-by: Karol Herbst <kherbst@redhat.com>
> ---
>  MAINTAINERS | 9 ++++++++-
>  1 file changed, 8 insertions(+), 1 deletion(-)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 8805df335326..270dc9c0a427 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -5961,10 +5961,17 @@ F:      drivers/gpu/drm/panel/panel-novatek-
> nt36672a.c
>  
>  DRM DRIVER FOR NVIDIA GEFORCE/QUADRO GPUS
>  M:     Ben Skeggs <bskeggs@redhat.com>
> +M:     Karol Herbst <kherbst@redhat.com>
> +M:     Lyude Paul <lyude@redhat.com>
>  L:     dri-devel@lists.freedesktop.org
>  L:     nouveau@lists.freedesktop.org
>  S:     Supported
> -T:     git git://github.com/skeggsb/linux
> +W:     https://nouveau.freedesktop.org/
> +Q:     https://patchwork.freedesktop.org/project/nouveau/
> +Q:     https://gitlab.freedesktop.org/drm/nouveau/-/merge_requests
> +B:     https://gitlab.freedesktop.org/drm/nouveau/-/issues
> +C:     irc://irc.oftc.net/nouveau
> +T:     git https://gitlab.freedesktop.org/drm/nouveau.git
>  F:     drivers/gpu/drm/nouveau/
>  F:     include/uapi/drm/nouveau_drm.h
>  

-- 
Cheers,
 Lyude Paul (she/her)
 Software Engineer at Red Hat

