Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B46B0539690
	for <lists+nouveau@lfdr.de>; Tue, 31 May 2022 20:52:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 588BD10E09B;
	Tue, 31 May 2022 18:52:03 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 63C4C10E00E
 for <nouveau@lists.freedesktop.org>; Tue, 31 May 2022 18:52:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1654023120;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=sZAMyRELxB7F9um/lFWtV+zzG8SAX14QHBVnpeIBNDs=;
 b=Me/kolUCFohOO9SmbEx6FrJHiuvpZzq2YaV0ks44Mdh2QX9sb81kIVZXnN129t4yTEu62V
 aXgkNfWy14+Qsb0Rxo2OLQRbcuMmEP9KV6lF9zNH3Xn9RKhLxZdSvAnWVFDvs5tY/P07xo
 azAphis5lPmGIW8x9GXQGOiLnsANNfw=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-639-jBxCaEoOM3ynjR0l422NMQ-1; Tue, 31 May 2022 14:51:59 -0400
X-MC-Unique: jBxCaEoOM3ynjR0l422NMQ-1
Received: by mail-qv1-f70.google.com with SMTP id
 kl23-20020a056214519700b0046200065604so10730252qvb.19
 for <nouveau@lists.freedesktop.org>; Tue, 31 May 2022 11:51:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:organization:user-agent:mime-version
 :content-transfer-encoding;
 bh=sZAMyRELxB7F9um/lFWtV+zzG8SAX14QHBVnpeIBNDs=;
 b=y2dXHRtzXh0Zt94Hi2oyb0nDIP7+seDrZNXqPgVQTHa1T8bAWSfAtYHX8aHOzSiRhB
 wkfI7t7lLCWx61YgANTyUoSgKAmyVruQQCUDXJgdTSDjuKVoYDblV+qC0sz6AOLWEF36
 KT4iqPAC6KcOPxu+h6fXgzyj4jQp2ScowOkG6oSrUvHK+OfEuzTaeW+wLlFZimISTTKG
 29weg07ROwhm2L904Qlx8BBFjl0E0kR96CQ23jmWqyw0yqjxaqr60OQBqL3nyAJe+4K0
 eWRbS15zOKSroRxLjSEJK8/MTEk+2g5bQD4JIpQXGjdV+RIo60IKnDY4b3UlpD6Xnn/z
 np3Q==
X-Gm-Message-State: AOAM53301AE9WeXRN6DR+dscCf1qHHuR+E4TrhYjVqCb777YXw9QO7zY
 BSQCyfHmfJ47MJW1abtkEEpNofJK2zqPtoKyR5u96yCuE9b/+FP18Mwse/N1828ezjSAl+kufJV
 TD1YUFz1F+9xh9pMCwsKRAE7m9A==
X-Received: by 2002:a05:6214:629:b0:45b:c82:e5f2 with SMTP id
 a9-20020a056214062900b0045b0c82e5f2mr51162983qvx.89.1654023118892; 
 Tue, 31 May 2022 11:51:58 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzodGyqn8Bmz6b43p2yNc0fAAzKr06KKy5cRAHwm0CUS2cAXLIS7Tt/3JKcEHC+x2wOBUDH4A==
X-Received: by 2002:a05:6214:629:b0:45b:c82:e5f2 with SMTP id
 a9-20020a056214062900b0045b0c82e5f2mr51162963qvx.89.1654023118669; 
 Tue, 31 May 2022 11:51:58 -0700 (PDT)
Received: from [192.168.8.138] (static-71-184-137-158.bstnma.ftas.verizon.net.
 [71.184.137.158]) by smtp.gmail.com with ESMTPSA id
 q11-20020a37a70b000000b0069fc13ce211sm9787136qke.66.2022.05.31.11.51.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 31 May 2022 11:51:58 -0700 (PDT)
Message-ID: <ffaf5842daad97fb6c9a522551b7d00aac86c306.camel@redhat.com>
From: Lyude Paul <lyude@redhat.com>
To: Tom Rix <trix@redhat.com>, bskeggs@redhat.com, kherbst@redhat.com, 
 airlied@linux.ie, daniel@ffwll.ch
Date: Tue, 31 May 2022 14:51:57 -0400
In-Reply-To: <20220528141836.4155970-1-trix@redhat.com>
References: <20220528141836.4155970-1-trix@redhat.com>
Organization: Red Hat Inc.
User-Agent: Evolution 3.42.4 (3.42.4-2.fc35)
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lyude@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Subject: Re: [Nouveau] [PATCH] drm/nouveau/fifo/gv100-: set
 gv100_fifo_runlist storage-class to static
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
 dri-devel@lists.freedesktop.org
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

Reviewed-by: Lyude Paul <lyude@redhat.com>

Will push to the appropriate branch in a moment

On Sat, 2022-05-28 at 10:18 -0400, Tom Rix wrote:
> sparse reports
> drivers/gpu/drm/nouveau/nvkm/engine/fifo/gv100.c:56:1: warning: symbol
> 'gv100_fifo_runlist' was not declared. Should it be static?
> 
> gv100_fifo_runlist is only used in gv100.c, so change it to static.
> 
> Signed-off-by: Tom Rix <trix@redhat.com>
> ---
>  drivers/gpu/drm/nouveau/nvkm/engine/fifo/gv100.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/fifo/gv100.c
> b/drivers/gpu/drm/nouveau/nvkm/engine/fifo/gv100.c
> index 70e16a91ac12..faf0fe9f704c 100644
> --- a/drivers/gpu/drm/nouveau/nvkm/engine/fifo/gv100.c
> +++ b/drivers/gpu/drm/nouveau/nvkm/engine/fifo/gv100.c
> @@ -52,7 +52,7 @@ gv100_fifo_runlist_cgrp(struct nvkm_fifo_cgrp *cgrp,
>         nvkm_wo32(memory, offset + 0xc, 0x00000000);
>  }
>  
> -const struct gk104_fifo_runlist_func
> +static const struct gk104_fifo_runlist_func
>  gv100_fifo_runlist = {
>         .size = 16,
>         .cgrp = gv100_fifo_runlist_cgrp,

-- 
Cheers,
 Lyude Paul (she/her)
 Software Engineer at Red Hat

