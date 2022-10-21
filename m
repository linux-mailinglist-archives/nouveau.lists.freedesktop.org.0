Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 32201608095
	for <lists+nouveau@lfdr.de>; Fri, 21 Oct 2022 23:11:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 97B2610E67E;
	Fri, 21 Oct 2022 21:11:51 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1699610E67E
 for <nouveau@lists.freedesktop.org>; Fri, 21 Oct 2022 21:11:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1666386701;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Tb5G8Q5vATxNip+KIvKKwBUveWJ2RwJYjzfJBGeAXxg=;
 b=ZMsvVDZFxd0uEA5CD9fgCQZ0kYp18KM0gTEZl0nrndUmc5l7OWvt9ZwqN1NgiZUBqn7He2
 P9/xyIoh0Kdpn0uxdBMJ9CtTmVTcDPj5JzhdwAlTuqlIBpJ62ftDc0A13H+OkdPWu5PAce
 Rlv/5f/JRd6BL/gR6/D29H0sZmZmuC8=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-385-GilnsqMaPlqW4kkgauBHtw-1; Fri, 21 Oct 2022 17:11:39 -0400
X-MC-Unique: GilnsqMaPlqW4kkgauBHtw-1
Received: by mail-qk1-f199.google.com with SMTP id
 f12-20020a05620a408c00b006ced53b80e5so4419702qko.17
 for <nouveau@lists.freedesktop.org>; Fri, 21 Oct 2022 14:11:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:user-agent:organization
 :references:in-reply-to:date:cc:to:from:subject:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Tb5G8Q5vATxNip+KIvKKwBUveWJ2RwJYjzfJBGeAXxg=;
 b=FtXjVlDaxL6mZHSECwukJ7v0+cE4qgkXdBfBSBSuD5SwsIj5dV/pmttF/uKMKx963L
 ePdMmXab7RsBADkY2b4qd1Y0567yuL/xWimnV+OfBgwIw7Rh73jZeLc6PrH9EVv+k9ZD
 d6Yo86eQhPZaG77KvkkwQ5BzI4AnRFe8DOB3jQM2O1KKqv8zPmQH23J4aRM2rBQrK6Bf
 xtG05eQu3zEWxgOJBoz7lAmQFOaWHYMlU+HwKHfTdKXzEPVWcXvdo1HH1UG/S4TjE9CK
 75WFDvW2cOgSyAnOlKzvLHV1CQa6nzDecaUGCbQCr/kgv0i3FZFFDXxC2muLA3lKOhYK
 Qgpg==
X-Gm-Message-State: ACrzQf1vYVHVkp84/5ICg9gsh+pWIErzToNIxj67EFXqbC4stODqFDUz
 D2xVdgMcEjEEvwSZvxirpXigh+ng//PH9IC1K+HLRd8VaR4Jaulm2PI5f2JzyxznbpKiiCD5/E0
 r/di5Nk+I7lAWw2IyS4Vb+WiiHg==
X-Received: by 2002:a05:6214:2483:b0:4bb:59ec:c5a7 with SMTP id
 gi3-20020a056214248300b004bb59ecc5a7mr3071178qvb.94.1666386699530; 
 Fri, 21 Oct 2022 14:11:39 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM7KgayDfa/OfgLiBOflAoe1rYw1XFXkm1/ap8s3joDTxP0ofbKbGObX5+tK8zXV+pqU3S2xcQ==
X-Received: by 2002:a05:6214:2483:b0:4bb:59ec:c5a7 with SMTP id
 gi3-20020a056214248300b004bb59ecc5a7mr3071157qvb.94.1666386699307; 
 Fri, 21 Oct 2022 14:11:39 -0700 (PDT)
Received: from ?IPv6:2600:4040:5c68:4300::feb? ([2600:4040:5c68:4300::feb])
 by smtp.gmail.com with ESMTPSA id
 fw10-20020a05622a4a8a00b0039cba52974fsm8491618qtb.94.2022.10.21.14.11.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Oct 2022 14:11:38 -0700 (PDT)
Message-ID: <54135445ebea45857a95ac86db1c22804996af8c.camel@redhat.com>
From: Lyude Paul <lyude@redhat.com>
To: Yang Li <yang.lee@linux.alibaba.com>, bskeggs@redhat.com
Date: Fri, 21 Oct 2022 17:11:37 -0400
In-Reply-To: <20221017000723.113744-1-yang.lee@linux.alibaba.com>
References: <20221017000723.113744-1-yang.lee@linux.alibaba.com>
Organization: Red Hat Inc.
User-Agent: Evolution 3.42.4 (3.42.4-2.fc35)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [Nouveau] [PATCH -next] nouveau/dmem: Remove duplicated include
 in nouveau_dmem.c
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
Cc: nouveau@lists.freedesktop.org, Abaci Robot <abaci@linux.alibaba.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, daniel@ffwll.ch
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

Reviewed-by: Lyude Paul <lyude@redhat.com>

Will push in just a moment to drm-misc-next, thanks!

On Mon, 2022-10-17 at 08:07 +0800, Yang Li wrote:
> ./drivers/gpu/drm/nouveau/nouveau_dmem.c: nvif/if000c.h is included more
> than once.
> 
> Link: https://bugzilla.openanolis.cn/show_bug.cgi?id=2404
> Reported-by: Abaci Robot <abaci@linux.alibaba.com>
> Signed-off-by: Yang Li <yang.lee@linux.alibaba.com>
> ---
>  drivers/gpu/drm/nouveau/nouveau_dmem.c | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/nouveau/nouveau_dmem.c b/drivers/gpu/drm/nouveau/nouveau_dmem.c
> index 5fe209107246..e2c500aac273 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_dmem.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_dmem.c
> @@ -33,7 +33,6 @@
>  #include <nvif/if000c.h>
>  #include <nvif/if500b.h>
>  #include <nvif/if900b.h>
> -#include <nvif/if000c.h>
>  
>  #include <nvhw/class/cla0b5.h>
>  

-- 
Cheers,
 Lyude Paul (she/her)
 Software Engineer at Red Hat

