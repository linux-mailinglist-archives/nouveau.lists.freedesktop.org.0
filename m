Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 46CD56A9972
	for <lists+nouveau@lfdr.de>; Fri,  3 Mar 2023 15:33:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE56610E60D;
	Fri,  3 Mar 2023 14:33:49 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 954E510E60D
 for <nouveau@lists.freedesktop.org>; Fri,  3 Mar 2023 14:33:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677854026;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=F1Sn0/mypHkU6ly+1mTIVNlEYcj+rMktwAvyJJ3xDBs=;
 b=I6p1X2k/mW8MaIC7/hbJTVnqCv7I8acbSQbiIGXrWYDwB9Pxfp+NiOQnZy46ztN3kvdX02
 x6WVa2oXZI307RkrLMsQsZaf8dEWV7TYsujX6MNKXC4JVY19OvmAaNnGBxrQHee6+qL2IA
 E4yBohRB/5mzCUGqfUgTK+L6Da2OeUo=
Received: from mail-lf1-f72.google.com (mail-lf1-f72.google.com
 [209.85.167.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-141-9Z-_iHEfPmeC2fZ1Yy6Drg-1; Fri, 03 Mar 2023 09:33:45 -0500
X-MC-Unique: 9Z-_iHEfPmeC2fZ1Yy6Drg-1
Received: by mail-lf1-f72.google.com with SMTP id
 e9-20020a196909000000b004cca10c5ae6so1096442lfc.9
 for <nouveau@lists.freedesktop.org>; Fri, 03 Mar 2023 06:33:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677854024;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=F1Sn0/mypHkU6ly+1mTIVNlEYcj+rMktwAvyJJ3xDBs=;
 b=kwnSXlrlqjTalxjTVJYKIaqG5lxWsA6tHKrR7MPnjZWfkaPSNxCjpBhfkWg8kUa1dd
 T6/rK/sMS2Mi6yk6u38fqC7pYylsC9HOcktC8UAqwF6OdxGvv77LM8Z91x6j4Y/R5FYg
 /Q64FTyBZ1bL22lX5+w4lsknmNK+B4AvW9IKj1XyoZtV4fYBgxGQEKen16309NRCeHx0
 8PViBIlOkvT3SwikPLsbFLmDEMGIT9PaZcpN7F1itn6s6ko6IDkrWAKkF7zPvgF+4Guz
 HrzfGoqSSJZog0bwrWVt/jxTefbWt1pZDJMx5AhvQjVpNW/NDLkwq8xgUSCuyRGpncwq
 Cgog==
X-Gm-Message-State: AO0yUKVr+4wjZn1EO3eVO5ni27Fr8C1c5sbtBzumoLOwo5AWjB6BXkSq
 4Yp4IxbS4x146MxlbHGmWv/xMJ5gtvyptMBLFEb9pOR11KyNRMAHyShsXKWx2QJ+q9tbDHCSxEQ
 NWe5eY5CwluKRYt9fh4Ayyo9ESar3Kl5SMDxrfKIDog==
X-Received: by 2002:a2e:a269:0:b0:295:ab47:119b with SMTP id
 k9-20020a2ea269000000b00295ab47119bmr617034ljm.8.1677854024020; 
 Fri, 03 Mar 2023 06:33:44 -0800 (PST)
X-Google-Smtp-Source: AK7set8dskGiDMeG1f4EFzCLSCJINA3Rk6cJqgMITbg2NCrdgTqKLg2n24Jl1IpBJ42JYGk53ZIokiHYAl2dT1gNbFI=
X-Received: by 2002:a2e:a269:0:b0:295:ab47:119b with SMTP id
 k9-20020a2ea269000000b00295ab47119bmr617027ljm.8.1677854023781; Fri, 03 Mar
 2023 06:33:43 -0800 (PST)
MIME-Version: 1.0
References: <20230228221533.3240520-1-trix@redhat.com>
In-Reply-To: <20230228221533.3240520-1-trix@redhat.com>
From: Karol Herbst <kherbst@redhat.com>
Date: Fri, 3 Mar 2023 15:33:31 +0100
Message-ID: <CACO55tvJH=VmTf+Wv4Lf56eEPp3vO1Aoa6Sb1=UYnRzFkVardg@mail.gmail.com>
To: Tom Rix <trix@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Nouveau] [PATCH] drm/nouveau/fifo: set nvkm_engn_cgrp_get
 storage-class-specifier to static
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
Cc: nouveau@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, bskeggs@redhat.com, daniel@ffwll.ch
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

Reviewed-by: Karol Herbst <kherbst@redhat.com>

will push in a moment

On Tue, Feb 28, 2023 at 11:15 PM Tom Rix <trix@redhat.com> wrote:
>
> smatch reports
> drivers/gpu/drm/nouveau/nvkm/engine/fifo/runl.c:33:18:
>   warning: symbol 'nvkm_engn_cgrp_get' was not declared. Should it be static?
>
> nvkm_engn_cgrp_get is only used in runl.c, so it should be static
>
> Signed-off-by: Tom Rix <trix@redhat.com>
> ---
>  drivers/gpu/drm/nouveau/nvkm/engine/fifo/runl.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/fifo/runl.c b/drivers/gpu/drm/nouveau/nvkm/engine/fifo/runl.c
> index b5836cbc29aa..93d628d7d508 100644
> --- a/drivers/gpu/drm/nouveau/nvkm/engine/fifo/runl.c
> +++ b/drivers/gpu/drm/nouveau/nvkm/engine/fifo/runl.c
> @@ -30,7 +30,7 @@
>  #include <subdev/timer.h>
>  #include <subdev/top.h>
>
> -struct nvkm_cgrp *
> +static struct nvkm_cgrp *
>  nvkm_engn_cgrp_get(struct nvkm_engn *engn, unsigned long *pirqflags)
>  {
>         struct nvkm_cgrp *cgrp = NULL;
> --
> 2.27.0
>

