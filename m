Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 127B04A0148
	for <lists+nouveau@lfdr.de>; Fri, 28 Jan 2022 20:59:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 28E1B10E2AC;
	Fri, 28 Jan 2022 19:59:49 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F33B910E400
 for <nouveau@lists.freedesktop.org>; Fri, 28 Jan 2022 19:59:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643399987;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=H/RNAVREYoMWWmbXyD7JmCQPxXU0h1w7hHfP+VKDHWk=;
 b=BIp5MUC+ds/+i1nM5rf2T+REFZKs79HpEIEiSrj7wzXFhZN5bXaeCJsTJAo8JNWDdjpGwZ
 /Gi1eLGaDWpI2VzhBQc0xPVTFK5NRNRlgXbrrdBUIKn5It/e7xJI2cBOAtPuL5RhEW5tl9
 XuvZjmr01dE9nLs4eVkLdz8eu2ENcWI=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-417-cyyUMq4zPfe_n95chywYKg-1; Fri, 28 Jan 2022 14:59:46 -0500
X-MC-Unique: cyyUMq4zPfe_n95chywYKg-1
Received: by mail-qv1-f70.google.com with SMTP id
 ej14-20020ad45a4e000000b00425d03eabe4so4881992qvb.9
 for <nouveau@lists.freedesktop.org>; Fri, 28 Jan 2022 11:59:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:organization:user-agent:mime-version
 :content-transfer-encoding;
 bh=H/RNAVREYoMWWmbXyD7JmCQPxXU0h1w7hHfP+VKDHWk=;
 b=FkuxFBmZj7PPCpfZDkc88P921j9B+C50YbMfMm4OHuqihVPGZA85+BC77eqKSCSDn0
 zZxFYt/MB6PXAQ1297TLB8EJ+2wkov3oK2MthQhnS0QMnwlvh7aWKVPpLoV07Uvp/Mvt
 lzOG5rAgA6GXqHSTUIYGESqLXdZBeeL8KsTi6ViXRcrBk/DAxI2O2cxuXJQ1ywZb3+ZW
 is9WNvZ+jD/R7O5tFYb927sTUubbuwrDw6z505xpmr4AJNassJZL7/UNVD7MKf8qsqsA
 FxRlKhKHaXiCkXktv1DZnOfE7WfY9XjgttmQU1TUNfdBYMeJybyiump5DNNVKBIrmLV4
 Nhxw==
X-Gm-Message-State: AOAM531Kfv5kvzaWxXz950Iy9/2r7bELv7nsKezFdUCvWo1ptcfg1AjC
 2Nr9kl2XxUc80JWrj6Rwuvr4NK2xtJh5b4xLtAWInaIwh8Fqe4hrIGEtfGXQNqiNLj+BwhDUDkl
 ctHo1Eh2R2YwjQxd5YgGOoTjF1+CgbBnpRU0elkVqauaCarNIU9MB7F9i6fOb/cYzCpt2zQQPuw
 ==
X-Received: by 2002:a05:620a:1a9e:: with SMTP id
 bl30mr4658865qkb.122.1643399985149; 
 Fri, 28 Jan 2022 11:59:45 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxMVL7Ee01ALwRBPd6MwzSYTHv1qXAtOUO9d/6kaeBi6vEJvalGNdFdHO2BgIzYtQiTAwBaxQ==
X-Received: by 2002:a05:620a:1a9e:: with SMTP id
 bl30mr4658847qkb.122.1643399984791; 
 Fri, 28 Jan 2022 11:59:44 -0800 (PST)
Received: from [192.168.8.138] (pool-98-118-105-43.bstnma.ftas.verizon.net.
 [98.118.105.43])
 by smtp.gmail.com with ESMTPSA id m4sm3868731qkp.117.2022.01.28.11.59.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Jan 2022 11:59:44 -0800 (PST)
Message-ID: <8a01bf1d367a702cd41e6cb1281294e82a48f541.camel@redhat.com>
From: Lyude Paul <lyude@redhat.com>
To: nouveau@lists.freedesktop.org
Date: Fri, 28 Jan 2022 14:59:42 -0500
In-Reply-To: <20220128192951.626532-1-lyude@redhat.com>
References: <20220128192951.626532-1-lyude@redhat.com>
Organization: Red Hat Inc.
User-Agent: Evolution 3.42.2 (3.42.2-1.fc35)
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lyude@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Subject: Re: [Nouveau] [PATCH] Revert "drm/nouveau/acr: Fix undefined
 behavior in nvkm_acr_hsfw_load_bl()"
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
Cc: David Airlie <airlied@linux.ie>, Greg KH <gregkh@linuxfoundation.org>,
 open list <linux-kernel@vger.kernel.org>, dri-devel@lists.freedesktop.org,
 Ben Skeggs <bskeggs@redhat.com>, Daniel Vetter <daniel@ffwll.ch>,
 Zhou Qingyang <zhou1615@umn.edu>
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

on further reconsideration: Self-NAKing this. I don't see any issues with
those patches.

On Fri, 2022-01-28 at 14:29 -0500, Lyude Paul wrote:
> This reverts commit 2343bcdb4747d4f418a4daf2e898b94f86c24a59.
> 
> Unfortunately, as Greg pointed out I totally missed the fact that this
> patch came from a umn.edu patch. umn.edu is still banned from contributing
> to the Linux kernel, so let's revert this for the time being. I'll
> re-evaluate this fix myself later and send another fix if this ends up
> being valid.
> 
> Signed-off-by: Lyude Paul <lyude@redhat.com>
> Cc: Greg KH <gregkh@linuxfoundation.org>
> Cc: Ben Skeggs <bskeggs@redhat.com>
> Cc: Karol Herbst <kherbst@redhat.com>
> ---
>  drivers/gpu/drm/nouveau/nvkm/subdev/acr/hsfw.c | 9 ++++-----
>  1 file changed, 4 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/acr/hsfw.c
> b/drivers/gpu/drm/nouveau/nvkm/subdev/acr/hsfw.c
> index a6ea89a5d51a..667fa016496e 100644
> --- a/drivers/gpu/drm/nouveau/nvkm/subdev/acr/hsfw.c
> +++ b/drivers/gpu/drm/nouveau/nvkm/subdev/acr/hsfw.c
> @@ -142,12 +142,11 @@ nvkm_acr_hsfw_load_bl(struct nvkm_acr *acr, const char
> *name, int ver,
>  
>         hsfw->imem_size = desc->code_size;
>         hsfw->imem_tag = desc->start_tag;
> -       hsfw->imem = kmemdup(data + desc->code_off, desc->code_size,
> GFP_KERNEL);
> +       hsfw->imem = kmalloc(desc->code_size, GFP_KERNEL);
> +       memcpy(hsfw->imem, data + desc->code_off, desc->code_size);
> +
>         nvkm_firmware_put(fw);
> -       if (!hsfw->imem)
> -               return -ENOMEM;
> -       else
> -               return 0;
> +       return 0;
>  }
>  
>  int

-- 
Cheers,
 Lyude Paul (she/her)
 Software Engineer at Red Hat

