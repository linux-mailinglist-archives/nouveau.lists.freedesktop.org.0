Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9128F48B57E
	for <lists+nouveau@lfdr.de>; Tue, 11 Jan 2022 19:12:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 644F410E1CC;
	Tue, 11 Jan 2022 18:12:03 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2DAAD10E27C
 for <nouveau@lists.freedesktop.org>; Tue, 11 Jan 2022 18:12:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1641924721;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3hgp9TNlhmh2F8YJ1u7gu8AeVl0SpLbsYxPdRZu+7iA=;
 b=MFaHUqYR5OkE5FaZ+kSimdHeXq1gA+DV47DjgdqAARAiOzWyQ+GrlNeftric7VGjw/EfVL
 L5tu4m/uOav3yhggrlinWAf9mwqWn/7n94N8RoTr0DZJ8yTYbogZpzAhSzzkdEGe08PBsi
 8Wp+xVgz+ZBGCKb50Hfrq1hA85sfR6Q=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-558-BgCdYNfbMEepv6Vtt4GTCA-1; Tue, 11 Jan 2022 13:11:57 -0500
X-MC-Unique: BgCdYNfbMEepv6Vtt4GTCA-1
Received: by mail-qv1-f72.google.com with SMTP id
 i3-20020ad45c63000000b0041143710adbso92784qvh.18
 for <nouveau@lists.freedesktop.org>; Tue, 11 Jan 2022 10:11:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:organization:user-agent:mime-version
 :content-transfer-encoding;
 bh=3hgp9TNlhmh2F8YJ1u7gu8AeVl0SpLbsYxPdRZu+7iA=;
 b=BfojkXZ07ya+pEVLj08/NMShWx4b41tImEmsKCYjpmEMYhRpqHjvCoQ/wt4dR9e3qb
 XSeGXrf2Xvo1XdplG3g/miP4LR29uf7VAvS3J3knW5YdMoSkUeqGYPGjFOKwGQihZC79
 XVpLpC+TmT5UEIqdfe2IhWLwTf6i8WjggYshElh/oC3nF1NhPE3Ml4dAncFT13rGHeaT
 GUtZX2IQyPkaQ5J0JTDANU+D3PJNl8HKwyle2F3yVnKS+8eVByT8R3DhntHDYiUHC7V+
 e2ddS9dP/AaFwSmIUiMn25Lsls0vmWVQDFUxmm6EMbIp94Rw2/Ipfdha3U8TdRzbhjVc
 xBpQ==
X-Gm-Message-State: AOAM5329jU2vv7CPvS1CWMIdpES+q1NnQg6bON0p07fdEZvk8V/hbe4B
 Fdmyntr0hOGs6OOeyEyq4nAJhnpWuMdHEUoxs3xAMzNmBVRlX2wQyi7nCpzc9SUricl5aoAopZj
 BOusK/HSDXzpo1MdGnPsrsMUBZQ==
X-Received: by 2002:a37:ef17:: with SMTP id j23mr3846399qkk.400.1641924716815; 
 Tue, 11 Jan 2022 10:11:56 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyvsxA+do5OMy7/Gkj99hwDfSQMXE+E3UHnj4iMm90i8YoXCddk9cREEvoOwLscfzjDtZ8gfg==
X-Received: by 2002:a37:ef17:: with SMTP id j23mr3846376qkk.400.1641924716545; 
 Tue, 11 Jan 2022 10:11:56 -0800 (PST)
Received: from [192.168.8.138] (pool-98-118-105-43.bstnma.ftas.verizon.net.
 [98.118.105.43])
 by smtp.gmail.com with ESMTPSA id o17sm7804481qtv.87.2022.01.11.10.11.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Jan 2022 10:11:56 -0800 (PST)
Message-ID: <83a52893a963f37cb1c86f0b95c9a84091620361.camel@redhat.com>
From: Lyude Paul <lyude@redhat.com>
To: Yizhuo Zhai <yzhai003@ucr.edu>
Date: Tue, 11 Jan 2022 13:11:54 -0500
In-Reply-To: <20211218025632.2514288-1-yzhai003@ucr.edu>
References: <20211218025632.2514288-1-yzhai003@ucr.edu>
Organization: Red Hat Inc.
User-Agent: Evolution 3.42.2 (3.42.2-1.fc35)
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lyude@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Subject: Re: [Nouveau] [PATCH] drm/nouveau/core/object: Fix the
 uninitialized use of "type"
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
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Ben Skeggs <bskeggs@redhat.com>, Daniel Vetter <daniel@ffwll.ch>,
 stable@vger.kernel.org
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

Reviewed-by: Lyude Paul <lyude@redhat.com>

On Fri, 2021-12-17 at 18:56 -0800, Yizhuo Zhai wrote:
> In function nvkm_ioctl_map(), the variable "type" could be
> uninitialized if "nvkm_object_map()" returns error code, however,
> it does not check the return value and directly use the "type" in
> the if statement, which is potentially unsafe.
> 
> Cc: stable@vger.kernel.org
> Fixes: 01326050391c ("drm/nouveau/core/object: allow arguments to be passed
> to map function")
> Signed-off-by: Yizhuo Zhai <yzhai003@ucr.edu>
> ---
>  drivers/gpu/drm/nouveau/nvkm/core/ioctl.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/gpu/drm/nouveau/nvkm/core/ioctl.c
> b/drivers/gpu/drm/nouveau/nvkm/core/ioctl.c
> index 735cb6816f10..4264d9d79783 100644
> --- a/drivers/gpu/drm/nouveau/nvkm/core/ioctl.c
> +++ b/drivers/gpu/drm/nouveau/nvkm/core/ioctl.c
> @@ -266,6 +266,8 @@ nvkm_ioctl_map(struct nvkm_client *client,
>                 ret = nvkm_object_map(object, data, size, &type,
>                                       &args->v0.handle,
>                                       &args->v0.length);
> +               if (ret)
> +                       return ret;
>                 if (type == NVKM_OBJECT_MAP_IO)
>                         args->v0.type = NVIF_IOCTL_MAP_V0_IO;
>                 else

-- 
Cheers,
 Lyude Paul (she/her)
 Software Engineer at Red Hat

