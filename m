Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B5224DB9A5
	for <lists+nouveau@lfdr.de>; Wed, 16 Mar 2022 21:46:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B833D10EA54;
	Wed, 16 Mar 2022 20:46:29 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E434F10EA4F
 for <nouveau@lists.freedesktop.org>; Wed, 16 Mar 2022 20:46:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1647463586;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FfhhJ7yUS0yyFlZxS6rDyNHEgGv69Jd6+/vC86VElHk=;
 b=CoK19oBeFPUCQVw2wBv3WlDRlGgya+fWqyWy8ot/u8sFx+mlqxAEFF/FRkUmIGXWBkmI0+
 W0XhbUu99FqNWyqbh1c/UAsYVfCfCG5CoSCjChqIxRPsKB1boyBrqMC9XySoYC35NdkTsh
 LicvWO6num4jezFUp0jDBNWZse7tgIE=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-516-h8LBNXQeM_2Qc9GrgvHCfg-1; Wed, 16 Mar 2022 16:46:25 -0400
X-MC-Unique: h8LBNXQeM_2Qc9GrgvHCfg-1
Received: by mail-qv1-f71.google.com with SMTP id
 l4-20020a0cc204000000b00435ac16d67cso2530366qvh.12
 for <nouveau@lists.freedesktop.org>; Wed, 16 Mar 2022 13:46:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:organization:user-agent:mime-version
 :content-transfer-encoding;
 bh=FfhhJ7yUS0yyFlZxS6rDyNHEgGv69Jd6+/vC86VElHk=;
 b=06q6StAA2X6+EKF9fSSRdZg0g5wcu1/RDgkBxEbN33qTV/ZsXSD2TVGPJebPz0vm7Q
 3kXr+/Z9XYvntRiAlLKiSBLHXT7IyIwfigRbYP2o47AWbg6wG8VCUPBvpMFqpKJnD25L
 bKNUGcASQwDyvJNUyOjWxh1FX45xeVA8ts8RY8GlDEFY8lm/B/d2ZqScAk/I0CDhnulw
 l4M9tq06x8HhijIHAMyBeIMHIoasoZudwQxUItZRFN4f3aEKJanWcItV/wUK/ZDsWfgx
 u09DXguv+UvCte+nxhNsa9c5J8Wf7Q/kRhYGc7g16XiKE/FQkTR3qhZ1tzmlJySw2yv9
 JX9A==
X-Gm-Message-State: AOAM531rHs2O/qk8RZJacZ4GsbB8kFKpyXRqnl0swxrDj56qTjMdhcxz
 gZchhrG6lX1uYG5ualiF7iYTjUIqWPj84kC/3PtW4LRdb1nnDP3FJ8hT4xey9qTNmjqUbgv7ELu
 S+oEIQGWcNCsMgUyrIq2DPvoTBQ==
X-Received: by 2002:a05:6214:2aa8:b0:440:e21a:481e with SMTP id
 js8-20020a0562142aa800b00440e21a481emr920500qvb.124.1647463585472; 
 Wed, 16 Mar 2022 13:46:25 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwhGOJ38oQnyB4tkZz/yMIApAMry1UbUhBbTBbzmqYsaCSF25WehrTI7qOdDymlw16Z2KFyKg==
X-Received: by 2002:a05:6214:2aa8:b0:440:e21a:481e with SMTP id
 js8-20020a0562142aa800b00440e21a481emr920483qvb.124.1647463585243; 
 Wed, 16 Mar 2022 13:46:25 -0700 (PDT)
Received: from [192.168.8.138] (pool-96-230-100-15.bstnma.fios.verizon.net.
 [96.230.100.15]) by smtp.gmail.com with ESMTPSA id
 f185-20020a37d2c2000000b0067e342d5e4dsm416449qkj.105.2022.03.16.13.46.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Mar 2022 13:46:24 -0700 (PDT)
Message-ID: <473115e2ed01b0d47ae74d29d6f8f66286a78ccb.camel@redhat.com>
From: Lyude Paul <lyude@redhat.com>
To: Colin Ian King <colin.i.king@gmail.com>, Ben Skeggs
 <bskeggs@redhat.com>,  Karol Herbst <kherbst@redhat.com>, David Airlie
 <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, 
 dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org
Date: Wed, 16 Mar 2022 16:46:23 -0400
In-Reply-To: <20220315221929.2959700-1-colin.i.king@gmail.com>
References: <20220315221929.2959700-1-colin.i.king@gmail.com>
Organization: Red Hat Inc.
User-Agent: Evolution 3.42.4 (3.42.4-1.fc35)
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lyude@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Subject: Re: [Nouveau] [PATCH] drm/nouveau: Fix spelling mistake "endianess"
 -> "endianness"
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
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

Reviewed-by: Lyude Paul <lyude@redhat.com>

Will push to drm-misc-next in just a moment

On Tue, 2022-03-15 at 22:19 +0000, Colin Ian King wrote:
> There is a spelling mistake in a nvdev_error error message. Fix it.
> 
> Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
> ---
>  drivers/gpu/drm/nouveau/nvkm/engine/device/base.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/device/base.c
> b/drivers/gpu/drm/nouveau/nvkm/engine/device/base.c
> index 88d262ba648c..62efbd0f3846 100644
> --- a/drivers/gpu/drm/nouveau/nvkm/engine/device/base.c
> +++ b/drivers/gpu/drm/nouveau/nvkm/engine/device/base.c
> @@ -2935,7 +2935,7 @@ nvkm_device_ctor(const struct nvkm_device_func *func,
>                 /* switch mmio to cpu's native endianness */
>                 if (!nvkm_device_endianness(device)) {
>                         nvdev_error(device,
> -                                   "Couldn't switch GPU to CPUs
> endianess\n");
> +                                   "Couldn't switch GPU to CPUs
> endianness\n");
>                         ret = -ENOSYS;
>                         goto done;
>                 }

-- 
Cheers,
 Lyude Paul (she/her)
 Software Engineer at Red Hat

