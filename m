Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AD8EC92EE45
	for <lists+nouveau@lfdr.de>; Thu, 11 Jul 2024 20:05:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5CE0610E2E8;
	Thu, 11 Jul 2024 18:05:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="PFf3v8cy";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BDBCD10E2C5
 for <nouveau@lists.freedesktop.org>; Thu, 11 Jul 2024 18:05:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1720721156;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=cH5nbFjOkzVxAKshaS/V3UeyG5ukQIAiJeRXo8zubdw=;
 b=PFf3v8cy6EtX/gJKXv4JQMun+w8wCeVEowQR21/RK/wPaeXPytMDdZ5c7xjqTPl/xBMZc7
 klzVOw/fp6XHx0gPxtPF1yuUzWYvn4yMC+zV5gZjBcKWHZIhL9DJAC+fB42nGCnkMS2jFG
 n9sFyjBrh81VKFjkJFkm/RisdttUlYs=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-311-GOHQ_snkNYeoe8QljMYVCg-1; Thu, 11 Jul 2024 14:05:52 -0400
X-MC-Unique: GOHQ_snkNYeoe8QljMYVCg-1
Received: by mail-wr1-f72.google.com with SMTP id
 ffacd0b85a97d-367990a5796so672851f8f.1
 for <nouveau@lists.freedesktop.org>; Thu, 11 Jul 2024 11:05:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720721151; x=1721325951;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=cH5nbFjOkzVxAKshaS/V3UeyG5ukQIAiJeRXo8zubdw=;
 b=FZBjsf1v+x12oAGK2E46NGBC007VLfsLjbs5CH8yeGLYvG7aau4jrCt7xg2jOP/eK/
 Lb77YjJNfvsF6NSYVFPix+OACXn49m1pGGfu/3iqZ74VIstHUwFchVoZkMe29iPn4KJZ
 MHxuoTjp2l29px0x2ihRVRJBSpB5j8tFXWkWrjcMd73Y3glkWUJcwJNDJ8TpMWT04tCA
 uv3JhSUK2P48r5xkVS5Zm9bi+wlgyUdxiC41MXECtN86sLvYd57cxr0VrfBLjfTxSq2E
 ufFkkISgDTe0bKJ1a5C54B0UovYq/FX4+W3h6bKTSBvueKOW/n0IX/U/9raPJZp408HJ
 Xezw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUPa5mCp86M10i+x0v0/xhQ4e38JztV0kMVCR8P1LJQTt8NRtZilFJfJS8JCqdGGmv22qX6crrL58inriz04wSktmS2cvFVe2LhEdY5Cg==
X-Gm-Message-State: AOJu0YwzGwYAKGlJGoXiB49GoB9tHp4FX3tJGJZQ/yjzTcZHLPu1jzQL
 DJZwx0xIFyp3aw3TsBOURZkoGLWwOXy+Q6j6WokT4J3jBYWwmu1gDiX76P9XCASvHsHGObveQo5
 xnsxOEv3Vt7M//ey7A8OxZwKi4yAup0WdHDjR239zJ+XEXxixQUtoQic/rHK9j+8=
X-Received: by 2002:a5d:404c:0:b0:367:96b5:7852 with SMTP id
 ffacd0b85a97d-367cead160amr5846762f8f.55.1720721151224; 
 Thu, 11 Jul 2024 11:05:51 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEbvXumq8NE1L60m9LVsiI8UizYuufQvzoRjF4iDhvTdBKyfc4C360PBuGfWMVvQlH9Ft1d0g==
X-Received: by 2002:a5d:404c:0:b0:367:96b5:7852 with SMTP id
 ffacd0b85a97d-367cead160amr5846755f8f.55.1720721150911; 
 Thu, 11 Jul 2024 11:05:50 -0700 (PDT)
Received: from pollux ([2a02:810d:4b3f:ee94:abf:b8ff:feee:998b])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-367fba1b15esm1867923f8f.22.2024.07.11.11.05.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Jul 2024 11:05:50 -0700 (PDT)
Date: Thu, 11 Jul 2024 20:05:48 +0200
From: Danilo Krummrich <dakr@redhat.com>
To: Philipp Stanner <pstanner@redhat.com>
Cc: Karol Herbst <kherbst@redhat.com>, Lyude Paul <lyude@redhat.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/nouveau: Improve variable names in
 nouveau_sched_init()
Message-ID: <ZpAe_OsUP0ZMO5J-@pollux>
References: <20240711173551.76148-1-pstanner@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20240711173551.76148-1-pstanner@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
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
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

On Thu, Jul 11, 2024 at 07:35:51PM +0200, Philipp Stanner wrote:
> nouveau_sched_init() uses the function drm_sched_init(). The latter
> function has parameters called "hang_limit" and "timeout" in its API
> documentation.
> 
> nouveau_sched_init(), however, defines a variable called
> "job_hang_limit" which is passed to drm_sched_init()'s "timeout"
> parameter. The actual "hang_limit" parameter is directly set to 0.

Good catch.

> 
> Define a new variable and rename the existing one to make naming
> congruent with the function API.
> 
> Signed-off-by: Philipp Stanner <pstanner@redhat.com>
> ---
>  drivers/gpu/drm/nouveau/nouveau_sched.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/nouveau/nouveau_sched.c b/drivers/gpu/drm/nouveau/nouveau_sched.c
> index 32fa2e273965..ee1f49056737 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_sched.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_sched.c
> @@ -404,7 +404,8 @@ nouveau_sched_init(struct nouveau_sched *sched, struct nouveau_drm *drm,
>  {
>  	struct drm_gpu_scheduler *drm_sched = &sched->base;
>  	struct drm_sched_entity *entity = &sched->entity;
> -	long job_hang_limit = msecs_to_jiffies(NOUVEAU_SCHED_JOB_TIMEOUT_MS);
> +	const long timeout = msecs_to_jiffies(NOUVEAU_SCHED_JOB_TIMEOUT_MS);
> +	const unsigned int hang_limit = 0;

Please don't create this variable though, it's not needed.

>  	int ret;
>  
>  	if (!wq) {
> @@ -418,7 +419,7 @@ nouveau_sched_init(struct nouveau_sched *sched, struct nouveau_drm *drm,
>  
>  	ret = drm_sched_init(drm_sched, &nouveau_sched_ops, wq,
>  			     NOUVEAU_SCHED_PRIORITY_COUNT,
> -			     credit_limit, 0, job_hang_limit,
> +			     credit_limit, hang_limit, timeout,
>  			     NULL, NULL, "nouveau_sched", drm->dev->dev);
>  	if (ret)
>  		goto fail_wq;
> -- 
> 2.45.0
> 

