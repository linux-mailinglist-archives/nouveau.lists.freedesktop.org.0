Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A7BA75365F6
	for <lists+nouveau@lfdr.de>; Fri, 27 May 2022 18:27:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 54BB610F6DD;
	Fri, 27 May 2022 16:27:24 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD9A010F7BB
 for <nouveau@lists.freedesktop.org>; Fri, 27 May 2022 16:27:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1653668841;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hCQWiLeW5qUsRPrZU5r1fc6h36nurC5ojFEAsj8ddWE=;
 b=dZe+12grPakHrpmXzOMMj9Ar4/0vv1EJbVm0ZkxiUl9Na4V/ldeQ6KLaYnZVIC04tJf8qQ
 yffBLlVUaYGJPvCyw+CtYQPtJPEWOBXT9x1gjogqOnOiDh68ukT13ZFFV1m0RMXdRs0V+c
 B1UsNoMKoIa6PQ7wUQkKykILnicKc8s=
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-327-Lii4ckROMJKzvYuc70fOtw-1; Fri, 27 May 2022 12:27:20 -0400
X-MC-Unique: Lii4ckROMJKzvYuc70fOtw-1
Received: by mail-qt1-f198.google.com with SMTP id
 v1-20020a05622a014100b002f93e6b1e8cso4824850qtw.9
 for <nouveau@lists.freedesktop.org>; Fri, 27 May 2022 09:27:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:organization:user-agent:mime-version
 :content-transfer-encoding;
 bh=hCQWiLeW5qUsRPrZU5r1fc6h36nurC5ojFEAsj8ddWE=;
 b=jmF3i7ovZaGAEr4QQm3xfS3PvNO4scU8rtQhTWydNs0K5shtegCMUsgAwOQYqn3YfR
 Z8lpKXOH2J7YyvzZTHE7ZW2tCF9izCrrN3/OzD8MZGuDUR9XUEjJYYFyM1iLbT9ibyyN
 dmrCT5o4u+bv11oq2PZnbMDWksJtgmJ6ZjxgCFU3HWxbg8EsL/gk6MYv3NUbn+UnSTQD
 K8hXzeLjT2Euv8Wsu5knHMGMWLtidEdqaKvXgnqe8ULZXwAl2zJ6zD7lsi7avL6U8eYX
 6lroOnoVhdECe4J14of0b45UIzuPLwDgr5e3FqSvtdNxEqL++D9UnNluHUHXy2BszsCF
 ZoDQ==
X-Gm-Message-State: AOAM53395wKT6/WCPie9xFb9N+OvwhEJTkFMazedGinnr4cGY+KEQ5jE
 tsEsDXt4sVVrEN1tcH4nXnGxYo9np+NBGniYc+/zciCgcgom4LACRFWfKDNAw0/KEkB+uNw4xA+
 O1bjLHlsxj1/xFzXVUSDbKGy1NA==
X-Received: by 2002:a05:622a:8c:b0:2fb:4df4:3421 with SMTP id
 o12-20020a05622a008c00b002fb4df43421mr10819798qtw.144.1653668839656; 
 Fri, 27 May 2022 09:27:19 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyiVpHPTtun+A+ekQ9OvBfz2OZyj/VWxMpfPUOhnLBH21qzgnM33CVE7ErnqS3tvCVpXeyueA==
X-Received: by 2002:a05:622a:8c:b0:2fb:4df4:3421 with SMTP id
 o12-20020a05622a008c00b002fb4df43421mr10819780qtw.144.1653668839419; 
 Fri, 27 May 2022 09:27:19 -0700 (PDT)
Received: from [192.168.8.138] (static-71-184-137-158.bstnma.ftas.verizon.net.
 [71.184.137.158]) by smtp.gmail.com with ESMTPSA id
 f13-20020a05622a1a0d00b002f39b99f695sm2899986qtb.47.2022.05.27.09.27.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 May 2022 09:27:18 -0700 (PDT)
Message-ID: <d8a12051e71ec322f489beed252576e16802a172.camel@redhat.com>
From: Lyude Paul <lyude@redhat.com>
To: 1064094935@qq.com, Ben Skeggs <bskeggs@redhat.com>
Date: Fri, 27 May 2022 12:27:17 -0400
In-Reply-To: <tencent_655C23622640268A069B49A6A5ADDEECB508@qq.com>
References: <tencent_655C23622640268A069B49A6A5ADDEECB508@qq.com>
Organization: Red Hat Inc.
User-Agent: Evolution 3.42.4 (3.42.4-2.fc35)
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lyude@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Subject: Re: [Nouveau] [PATCH 5/5] drm/nouveau: Fix spelling typo in comments
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
 pengfuyuan <pengfuyuan@kylinos.cn>, Daniel Vetter <daniel@ffwll.ch>,
 k2ci <kernel-bot@kylinos.cn>
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

Reviewed-by: Lyude Paul <lyude@redhat.com>

Do you need me to push this to drm-misc? Or will this be pushed as one series?

On Fri, 2022-05-27 at 12:22 +0800, 1064094935@qq.com wrote:
> From: pengfuyuan <pengfuyuan@kylinos.cn>
> 
> Fix spelling typo in comments.
> 
> Reported-by: k2ci <kernel-bot@kylinos.cn>
> Signed-off-by: pengfuyuan <pengfuyuan@kylinos.cn>
> ---
>  drivers/gpu/drm/nouveau/include/nvhw/drf.h | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/nouveau/include/nvhw/drf.h
> b/drivers/gpu/drm/nouveau/include/nvhw/drf.h
> index bd0fc41446e2..d6969c0e2f29 100644
> --- a/drivers/gpu/drm/nouveau/include/nvhw/drf.h
> +++ b/drivers/gpu/drm/nouveau/include/nvhw/drf.h
> @@ -190,7 +190,7 @@
>  #define DRF_MD_(X,_1,_2,_3,_4,_5,_6,_7,_8,_9,_10,IMPL,...) IMPL
>  #define DRF_MD(A...) DRF_MD_(X, ##A, DRF_MD_I, DRF_MD_N)(X, ##A)
>  
> -/* Helper for testing against field value in aribtrary object */
> +/* Helper for testing against field value in arbitrary object */
>  #define DRF_TV_N(X,e,p,o,d,r, 
> f,cmp,v)                                          \
>         NVVAL_TEST_X(DRF_RD_X(e, (p), (o), d##_##r   ), d##_##r##_##f, cmp,
> (v))
>  #define
> DRF_TV_I(X,e,p,o,d,r,i,f,cmp,v)                                          \
> @@ -198,7 +198,7 @@
>  #define DRF_TV_(X,_1,_2,_3,_4,_5,_6,_7,_8,_9,IMPL,...) IMPL
>  #define DRF_TV(A...) DRF_TV_(X, ##A, DRF_TV_I, DRF_TV_N)(X, ##A)
>  
> -/* Helper for testing against field definition in aribtrary object */
> +/* Helper for testing against field definition in arbitrary object */
>  #define DRF_TD_N(X,e,p,o,d,r, 
> f,cmp,v)                                                          \
>         NVVAL_TEST_X(DRF_RD_X(e, (p), (o), d##_##r   ), d##_##r##_##f, cmp,
> d##_##r##_##f##_##v)
>  #define
> DRF_TD_I(X,e,p,o,d,r,i,f,cmp,v)                                             
>              \

-- 
Cheers,
 Lyude Paul (she/her)
 Software Engineer at Red Hat

