Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 96A9854ED58
	for <lists+nouveau@lfdr.de>; Fri, 17 Jun 2022 00:31:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DAC5B10F6D9;
	Thu, 16 Jun 2022 22:31:29 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E084112446
 for <nouveau@lists.freedesktop.org>; Thu, 16 Jun 2022 22:31:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1655418688;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bU0VsK2JDaFAXshvmhSgHStyrksxJWmjq/aibJfxfwc=;
 b=OjkApXPrrrDpc+/tNXVH9NnBqJwf0bS7U7/OFZZHGVip1rRI9Nf3C/sYLv6cleYEH66Rt1
 Ff6p0xxMiidMreeKdrEJCvmASlDFe61TK8iIJVkZGuY5e83kHcncqNVld+mqycW2oUVnJL
 OWWr0dFwSEYheKcy9FUH6ueKsFg+TRM=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-584-1HpaF5zVPE-_S2qNqZHfiA-1; Thu, 16 Jun 2022 18:31:25 -0400
X-MC-Unique: 1HpaF5zVPE-_S2qNqZHfiA-1
Received: by mail-qk1-f199.google.com with SMTP id
 r6-20020a05620a298600b006a98e988ba4so3121213qkp.3
 for <nouveau@lists.freedesktop.org>; Thu, 16 Jun 2022 15:31:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:organization:user-agent:mime-version
 :content-transfer-encoding;
 bh=bU0VsK2JDaFAXshvmhSgHStyrksxJWmjq/aibJfxfwc=;
 b=smQJRYwe/Nde67JbanHJWG4J1tN4/hRAZAwMxxZxQ5mY+RH0MKVZdOUlgQxu9oletQ
 6BorOglLwt+Hr6jhabZCJW6RVMBlnLll3c5xE+H7YDHEGvH1fdo9cd40UJYy6pzAA309
 8ZjBdXRi/w/9B6QBhNu55YWJU+Us8NBEAOmQC6f3MzYrGjxX6K3hKjRcsjbB+3GCq1iu
 nCSL0q+ck1JMTHJ7OveBpH/vNovqVb5/jMclq3LUmV+fcmkFt/W0i170sWK+7Aq7kein
 676mDGcy7fNsf6sC8oiPYYDyG+Gm6+XsTgQxsYK6lwVp/NZi0R0ewBv4xXYSLmzbKmyi
 Odyw==
X-Gm-Message-State: AJIora+6QHx/qPDrNpE5zcaigjaxNm4OCSS9rX0U0JkJKPoD7tEgaFyG
 DDuDxtN7GfcPtF3YdzpvxM/Rgy63FnjRGwXA4OkXtWHPehTEForL0wmvsnRlg6z7oxx08OxM+NH
 X+QvU++qbEtVb6RkwtWMA8MaIew==
X-Received: by 2002:a05:6214:5197:b0:469:dbf0:899b with SMTP id
 kl23-20020a056214519700b00469dbf0899bmr6016646qvb.59.1655418684725; 
 Thu, 16 Jun 2022 15:31:24 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1uQ2+VNUkNyYDOT0uSnFzlvw62r4UWrTVGLjfnocSOM/wpgLfLveTzqDllaP17TXrkYMGFUDA==
X-Received: by 2002:a05:6214:5197:b0:469:dbf0:899b with SMTP id
 kl23-20020a056214519700b00469dbf0899bmr6016637qvb.59.1655418684489; 
 Thu, 16 Jun 2022 15:31:24 -0700 (PDT)
Received: from [192.168.8.138] (static-71-184-137-158.bstnma.ftas.verizon.net.
 [71.184.137.158]) by smtp.gmail.com with ESMTPSA id
 d8-20020ac85d88000000b00304edcfa109sm2965995qtx.33.2022.06.16.15.31.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Jun 2022 15:31:22 -0700 (PDT)
Message-ID: <8f78441d81e4f867cbf4c16751f9a307f225ce9d.camel@redhat.com>
From: Lyude Paul <lyude@redhat.com>
To: 1064094935@qq.com
Date: Thu, 16 Jun 2022 18:31:20 -0400
In-Reply-To: <tencent_C15AFFD9BBB862C56280A415C336F94C3909@qq.com>
References: <tencent_C15AFFD9BBB862C56280A415C336F94C3909@qq.com>
Organization: Red Hat Inc.
User-Agent: Evolution 3.42.4 (3.42.4-2.fc35)
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lyude@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Subject: Re: [Nouveau] [PATCH] drm/nouveau: Fix spelling typo in comments
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
 pengfuyuan <pengfuyuan@kylinos.cn>, Ben Skeggs <bskeggs@redhat.com>,
 Daniel Vetter <daniel@ffwll.ch>, k2ci <kernel-bot@kylinos.cn>
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

Reviewed-by: Lyude Paul <lyude@redhat.com>

On Thu, 2022-06-16 at 15:01 +0800, 1064094935@qq.com wrote:
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

