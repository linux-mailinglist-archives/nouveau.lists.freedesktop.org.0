Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D44224A00BF
	for <lists+nouveau@lfdr.de>; Fri, 28 Jan 2022 20:17:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 76F0910E201;
	Fri, 28 Jan 2022 19:17:16 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DAA9A10E253
 for <nouveau@lists.freedesktop.org>; Fri, 28 Jan 2022 19:17:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643397434;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=eO1UXFuFc6XDm59y7eIl2dtM6a/z0pBy0qGOEAiugBI=;
 b=c8iWQcuZvRTLEwe5kXcTTna0eo+znPw+8ex8obIRugEgFvsdAlWmHf/ePulVbWZFvvc0+6
 tuN3AjXQEgVu4bjPPIiZTOWQhYyJkVmqM5L0cQARR+JBYpAQgF2ZfJUxxPsDSaZQxLOSkg
 bc0F09HwyoxIpiG7L0lxTG8N4EwJSPw=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-139-UAHMjH3QOcmBuVF2nJyCtA-1; Fri, 28 Jan 2022 14:17:13 -0500
X-MC-Unique: UAHMjH3QOcmBuVF2nJyCtA-1
Received: by mail-qv1-f70.google.com with SMTP id
 14-20020a05621420ee00b00423846005d4so6946611qvk.15
 for <nouveau@lists.freedesktop.org>; Fri, 28 Jan 2022 11:17:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:organization:user-agent:mime-version
 :content-transfer-encoding;
 bh=eO1UXFuFc6XDm59y7eIl2dtM6a/z0pBy0qGOEAiugBI=;
 b=fyt5UFXEFut3M3SWZl0SKstm5Fbfx2knsLanEHjN2JoqO11ZzENg4MvQJvyn5h0USR
 yFgXaFkspcMbNMNxQsVf3uMnqlZIA1G4ByCc+IaQyoxIqvDUCE//M+W4KadWj1BDWX5I
 GcUDt4mVw87LBiWf5KZlGD+n5P32WX5fLqlDqUksDyqj1995pXc3Ht7MmTtqRsoiaRk1
 aqVZsSHslCSXCWBjJl7Ly5WyimEUoqq0bHAt/XIwFt+7uy3hMoiyYH3+kjaqfepRm8L9
 8rG7AEJePgKl6qdeWGgf3FLZyjJnyuF6GgX7qwkIGfA0W7MoUINnM+/mACIkPTEme7Va
 YRTA==
X-Gm-Message-State: AOAM530EWYrl7OTnWs8cUvqTvI9/Ckf8nQhGWTFvcx81AhaX3SQPw5AM
 lpzeUzIeCieAL+3LVagY3oyrnCZ7nx2VGYhBifZcy6LckZYmIgFNiLtONPACHM6Cpr/OkCi4R7P
 D7ZwwGNDeAiYKv887X+jLvo3WiQ==
X-Received: by 2002:a05:622a:ca:: with SMTP id
 p10mr2002430qtw.123.1643397432674; 
 Fri, 28 Jan 2022 11:17:12 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwYaAdUDE5W566fq77+INMNx47zILwdtqN04KYzsDT/UoGpKgB0OvZw6qO3zCtXnbY/NcpCYg==
X-Received: by 2002:a05:622a:ca:: with SMTP id
 p10mr2002408qtw.123.1643397432443; 
 Fri, 28 Jan 2022 11:17:12 -0800 (PST)
Received: from [192.168.8.138] (pool-98-118-105-43.bstnma.ftas.verizon.net.
 [98.118.105.43])
 by smtp.gmail.com with ESMTPSA id u17sm3548025qkj.44.2022.01.28.11.17.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Jan 2022 11:17:11 -0800 (PST)
Message-ID: <67747024d7b3e1904d639e5877a580a0af32d855.camel@redhat.com>
From: Lyude Paul <lyude@redhat.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>,
 linux-kernel@vger.kernel.org,  dri-devel@lists.freedesktop.org
Date: Fri, 28 Jan 2022 14:17:09 -0500
In-Reply-To: <20220128083626.3012259-10-lucas.demarchi@intel.com>
References: <20220128083626.3012259-1-lucas.demarchi@intel.com>
 <20220128083626.3012259-10-lucas.demarchi@intel.com>
Organization: Red Hat Inc.
User-Agent: Evolution 3.42.2 (3.42.2-1.fc35)
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lyude@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Subject: Re: [Nouveau] [PATCH 09/14] drm/nouveau: Replace dma-buf-map with
 iosys-map
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
Cc: airlied@linux.ie, christian.koenig@amd.com, srinivas.kandagatla@linaro.org,
 gregkh@linuxfoundation.org, nouveau@lists.freedesktop.org,
 sumit.semwal@linaro.org, linux-media@vger.kernel.org
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

For this patch:

Reviewed-by: Lyude Paul <lyude@redhat.com>

On Fri, 2022-01-28 at 00:36 -0800, Lucas De Marchi wrote:
> iosys-map is the new name for dma-buf-map and will gain new
> capabitilities. Replace with the new API in nouveau.
> 
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
> ---
>  drivers/gpu/drm/nouveau/nouveau_gem.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/gpu/drm/nouveau/nouveau_gem.c
> b/drivers/gpu/drm/nouveau/nouveau_gem.c
> index 9416bee92141..ad0527bdaadf 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_gem.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_gem.c
> @@ -24,6 +24,8 @@
>   *
>   */
>  
> +#include <linux/iosys-map.h>
> +
>  #include <drm/drm_gem_ttm_helper.h>
>  
>  #include "nouveau_drv.h"

-- 
Cheers,
 Lyude Paul (she/her)
 Software Engineer at Red Hat

