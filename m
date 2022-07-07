Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 84F8D56AC2C
	for <lists+nouveau@lfdr.de>; Thu,  7 Jul 2022 21:49:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 560C914A257;
	Thu,  7 Jul 2022 19:49:17 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 699E014A25B
 for <nouveau@lists.freedesktop.org>; Thu,  7 Jul 2022 19:49:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1657223355;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=b/09duIaIEFfbOfOoFpBzJ/OHB5C+OhETNK1haqEKUI=;
 b=JssJj4Od/GVA/d2hi3cXTasM9SCztaB0WtIBuxDGQdQ2fnOrwy8kHEn7twFQhdQVhPThK3
 14dIbYqRpGXi314qZkMAA0KSrZ7A38iW4dVJuLHFN2HOfzFhNbLMxjJoMiditFoF7KifSE
 u0BVR04sYXs+Peap+MOo6m8woP/rNxI=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-416-vyaY7xXyP--Q7JW8-_iaRA-1; Thu, 07 Jul 2022 15:49:14 -0400
X-MC-Unique: vyaY7xXyP--Q7JW8-_iaRA-1
Received: by mail-qt1-f199.google.com with SMTP id
 bs7-20020ac86f07000000b0031d3efbb91aso15381787qtb.21
 for <nouveau@lists.freedesktop.org>; Thu, 07 Jul 2022 12:49:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:organization:user-agent:mime-version
 :content-transfer-encoding;
 bh=b/09duIaIEFfbOfOoFpBzJ/OHB5C+OhETNK1haqEKUI=;
 b=HAI79lA59uQ8Lka5uq47njjq/uzaU7luZKqSudELrzBtY0iRGhQtGKM7UHlyaqzQwH
 bHP+0FgcrqpTnRGP62kVPtr2q8QUByBDoEF2iwAvA+xZ12tJO4CxVbqkTXZo705sKKAj
 LDD5E2d+jQJSnBeB1dqmwRSoDDLIHuKfnL4j93rxsQOmhmm2E0hxANgklvAgHu4f8Wfy
 azlLVXCm+ZxP9IcWZqsaK5fpFnAQeevljuLm9/gWSrYyB4uOM1m5qUs6xXVuIWot7dx7
 X+aY4MToncG/JpvJj/0kFEviN1spO3cdy92/niopihluXIv+m6sG3xmsawORJ1Z1cVLU
 blmg==
X-Gm-Message-State: AJIora9BK+8ETyfaOaGzMLLQzLYnzFemfWR+gd9uk8k74Iq6FUb/TkT0
 K35924PtRJTagGm0HDoEAhKu8/bodhCVzG7JDAbaLHmZQcKIV4aiFuZIyd6CEVdAmyJ9iRCU66u
 2iRSLAcemwOvD050etrgvOe1Olg==
X-Received: by 2002:a05:6214:2027:b0:473:2d58:7ce9 with SMTP id
 7-20020a056214202700b004732d587ce9mr4481192qvf.107.1657223353552; 
 Thu, 07 Jul 2022 12:49:13 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1v30p/B+gX/BnCMrUQB1lcXkKCSu9pY+vBctYwrmJAVo313ntD9v5GhZQ9NfuVfNRds55Wb4A==
X-Received: by 2002:a05:6214:2027:b0:473:2d58:7ce9 with SMTP id
 7-20020a056214202700b004732d587ce9mr4481163qvf.107.1657223353007; 
 Thu, 07 Jul 2022 12:49:13 -0700 (PDT)
Received: from [192.168.8.138] ([141.154.49.182])
 by smtp.gmail.com with ESMTPSA id
 dm15-20020a05620a1d4f00b006b555509398sm1582726qkb.136.2022.07.07.12.49.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Jul 2022 12:49:12 -0700 (PDT)
Message-ID: <a6e04ca0ff6134652f5ddf4bdbce1f1e90270e2e.camel@redhat.com>
From: Lyude Paul <lyude@redhat.com>
To: Jianglei Nie <niejianglei2021@163.com>, bskeggs@redhat.com, 
 kherbst@redhat.com, airlied@linux.ie, daniel@ffwll.ch
Date: Thu, 07 Jul 2022 15:49:11 -0400
In-Reply-To: <20220705132546.2247677-1-niejianglei2021@163.com>
References: <20220705132546.2247677-1-niejianglei2021@163.com>
Organization: Red Hat Inc.
User-Agent: Evolution 3.42.4 (3.42.4-2.fc35)
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lyude@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Subject: Re: [Nouveau] [PATCH] drm/nouveau: fix a use-after-free in
 nouveau_gem_prime_import_sg_table()
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

On Tue, 2022-07-05 at 21:25 +0800, Jianglei Nie wrote:
> nouveau_bo_init() is backed by ttm_bo_init() and ferries its return code
> back to the caller. On failures, ttm will call nouveau_bo_del_ttm() and
> free the memory.Thus, when nouveau_bo_init() returns an error, the gem
> object has already been released. Then the call to nouveau_bo_ref() will
> use the freed "nvbo->bo" and lead to a use-after-free bug.
> 
> We should delete the call to nouveau_bo_ref() to avoid the use-after-free.
> 
> Signed-off-by: Jianglei Nie <niejianglei2021@163.com>
> ---
>  drivers/gpu/drm/nouveau/nouveau_prime.c | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/nouveau/nouveau_prime.c
> b/drivers/gpu/drm/nouveau/nouveau_prime.c
> index 347488685f74..9608121e49b7 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_prime.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_prime.c
> @@ -71,7 +71,6 @@ struct drm_gem_object
> *nouveau_gem_prime_import_sg_table(struct drm_device *dev,
>         ret = nouveau_bo_init(nvbo, size, align, NOUVEAU_GEM_DOMAIN_GART,
>                               sg, robj);
>         if (ret) {
> -               nouveau_bo_ref(NULL, &nvbo);
>                 obj = ERR_PTR(ret);
>                 goto unlock;
>         }

-- 
Cheers,
 Lyude Paul (she/her)
 Software Engineer at Red Hat

