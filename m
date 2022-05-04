Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BE0751AD96
	for <lists+nouveau@lfdr.de>; Wed,  4 May 2022 21:14:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9973010E3BF;
	Wed,  4 May 2022 19:14:35 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C80310E3BF
 for <nouveau@lists.freedesktop.org>; Wed,  4 May 2022 19:14:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1651691673;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9p2WRSQwG2jIhDFqFGuonx32wxw6P1r7KJbAp0hAsNg=;
 b=GJAw5Q18ylEdUdh09j2cbP1+FdzTKcZ5z57+adAKSVPV86Ycpyv4+UggPamsHYzgzMx2jm
 1/B11LtZ6CsE1GGuM9OKqOj0+NTiLMn4mBr3hhzi9jCRxlY1c31946h0mYhIHnZcR+3fLl
 rVcY+UJelexocyfAn6GJZLG6+sc8i40=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-652-B2cYTHBOOxK8MVNdlPIaJQ-1; Wed, 04 May 2022 15:14:24 -0400
X-MC-Unique: B2cYTHBOOxK8MVNdlPIaJQ-1
Received: by mail-qk1-f198.google.com with SMTP id
 c8-20020a05620a268800b0069c0f1b3206so1543439qkp.18
 for <nouveau@lists.freedesktop.org>; Wed, 04 May 2022 12:14:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:organization:user-agent:mime-version
 :content-transfer-encoding;
 bh=9p2WRSQwG2jIhDFqFGuonx32wxw6P1r7KJbAp0hAsNg=;
 b=1yZSppVGYmTeDhF9tBTcAQozNixHGZ34AlxQe/1zUk+UzYSA1e2d9FfRd5zVs3KYRE
 FhJy15Thldb9+vVpsrJfe7MQpRdiHgXrBCEBIo2XisOx2i2agCl368HltKJZfSRyG6rS
 enabaeVw0dHas+2OuhRgz7z+tNB4a7nN1VXR1C5rA6uuM4fInTD1IplLMABu1Tx4fS2j
 6R+rOYYRGbXzjNBK8s6ICWsPutmVWf6UPVR/BmcPIkrAfXxksdc55ana5AQkRIiNaqI6
 MTtZmhxl8haEeNEeGd1m4xC4C16DK0WMFYGI/a3SY9frUhZcDVyzkUikrdPuUm4zuq9O
 KPtw==
X-Gm-Message-State: AOAM530rxaNVZdRCRrVAanTNKIzmFvmHdNmPKrPzDX5eeRKlrVgy1dbm
 HLQkjv86n0XMMNDXSn3NfUc8sTsoNzUdRuwNhx0lVCbCzGmRpHDXb/ApAZ0YxCqAkoaOP0TH/IO
 jkLPXCbQCunQCxqvBdXNTV6H6Yg==
X-Received: by 2002:ac8:7fc6:0:b0:2f3:8289:56b0 with SMTP id
 b6-20020ac87fc6000000b002f3828956b0mr20641855qtk.11.1651691664296; 
 Wed, 04 May 2022 12:14:24 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyJDzb7rHoE6+sJuITAZ2W+DgqFwQNMXcw7heMAZNo8HxyVn5Isb58UwNiBhSTgRmQinAxCKA==
X-Received: by 2002:ac8:7fc6:0:b0:2f3:8289:56b0 with SMTP id
 b6-20020ac87fc6000000b002f3828956b0mr20641842qtk.11.1651691664101; 
 Wed, 04 May 2022 12:14:24 -0700 (PDT)
Received: from [192.168.8.138] (static-71-184-137-158.bstnma.ftas.verizon.net.
 [71.184.137.158]) by smtp.gmail.com with ESMTPSA id
 b6-20020ac844c6000000b002f39b99f6c3sm8291571qto.93.2022.05.04.12.14.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 May 2022 12:14:23 -0700 (PDT)
Message-ID: <a05b1f59e1e5449cf3bcf8f9a0d4118ba8c53323.camel@redhat.com>
From: Lyude Paul <lyude@redhat.com>
To: Christian =?ISO-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>, 
 nouveau@lists.freedesktop.org
Date: Wed, 04 May 2022 15:14:22 -0400
In-Reply-To: <20220503085935.11023-1-christian.koenig@amd.com>
References: <20220503085935.11023-1-christian.koenig@amd.com>
Organization: Red Hat Inc.
User-Agent: Evolution 3.42.4 (3.42.4-2.fc35)
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lyude@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Subject: Re: [Nouveau] [PATCH] drm/nouveau: remove trace_dma_fence_emit
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
Cc: Christian =?ISO-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 Ben Skeggs <bskeggs@redhat.com>
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

Reviewed-by: Lyude Paul <lyude@redhat.com>

Will push to the appropriate branch in a moment

On Tue, 2022-05-03 at 10:59 +0200, Christian König wrote:
> Hardware drivers which don't have much difference between emit and init
> shouldn't use this trace point.
> 
> Signed-off-by: Christian König <christian.koenig@amd.com>
> Cc: Ben Skeggs <bskeggs@redhat.com>
> Cc: Karol Herbst <kherbst@redhat.com>
> Cc: Lyude Paul <lyude@redhat.com>
> Cc: nouveau@lists.freedesktop.org
> ---
>  drivers/gpu/drm/nouveau/nouveau_fence.c | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/nouveau/nouveau_fence.c
> b/drivers/gpu/drm/nouveau/nouveau_fence.c
> index 7f01dcf81fab..abcac7db4347 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_fence.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_fence.c
> @@ -224,7 +224,6 @@ nouveau_fence_emit(struct nouveau_fence *fence, struct
> nouveau_channel *chan)
>                                &fctx->lock, fctx->context, ++fctx-
> >sequence);
>         kref_get(&fctx->fence_ref);
>  
> -       trace_dma_fence_emit(&fence->base);
>         ret = fctx->emit(fence);
>         if (!ret) {
>                 dma_fence_get(&fence->base);

-- 
Cheers,
 Lyude Paul (she/her)
 Software Engineer at Red Hat

