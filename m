Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F1C197735B3
	for <lists+nouveau@lfdr.de>; Tue,  8 Aug 2023 03:08:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 09C9710E155;
	Tue,  8 Aug 2023 01:08:43 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C812F10E0A7
 for <nouveau@lists.freedesktop.org>; Tue,  8 Aug 2023 01:08:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1691456920;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=KUg5fgHinb1dQrCH5s6HF+QTY2j3RKpMmNlEIWspIjE=;
 b=ZwTV+Z+2igig5S2o6zqKEKYGlEWgcFvexznzWXROOrVQBERZWhzx06pl4GKjqT4DWTm2EK
 6dKWfpKIlJCf+KInYOM6xh/pVg/tFJbHqvufY9v681xaECUqaxgJA8m9ERpc8ktBRsw5F/
 ZAyoHCZfza4ohweyCNGOYR2qzqlaGyo=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-120-CF1UaK-aNrWj7yLEdqnuTg-1; Mon, 07 Aug 2023 21:08:36 -0400
X-MC-Unique: CF1UaK-aNrWj7yLEdqnuTg-1
Received: by mail-ed1-f70.google.com with SMTP id
 4fb4d7f45d1cf-51a5296eb8eso3825489a12.2
 for <nouveau@lists.freedesktop.org>; Mon, 07 Aug 2023 18:08:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691456915; x=1692061715;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=KUg5fgHinb1dQrCH5s6HF+QTY2j3RKpMmNlEIWspIjE=;
 b=Pi4te82xzgVR0A65xXe6iTff1wCdDXjgwkGWcY2CgAEW1QzrXg+pybuHOEH4B2o4ck
 JbXBze1QQq2D/+ebDuctzFAq0P27m+07iMg7rdveg1pZJorxAWpnauzXFGkpYLnN/cZf
 OsjxHT/aiGfXmTuE1xHb69D+Q+vcdsCo4ye6iZipAW4CNnBjHZpDdmpxEgbVWAdcGNMN
 3KkBv4cA2PGwd5XAgzdvjYOkPFuK9BEmZtTaxvaw+8dPdde6fd/rd6eldWhV+OvxGCmZ
 cyJILHM6Vb6cjwbm0YC3e4pS3UUdB/KR+liTZtXrtFr3CdmlkubEAkmLqERvyFuOe7aZ
 FioQ==
X-Gm-Message-State: AOJu0Yy+2G9Q6ip8WyzlP3wlnN6zubupaHedfXBFLFZD7FuqTISusUlt
 ilp4T/8xcxSYxiJtR5V83xV6TNuw4RvoqqiRElJu9SiGwTPYk5j9ge2yRE8qCboy2SPL/MWdazB
 ZtOYnTeiY6CSD6Vu8h9Tj4tnQ5Q==
X-Received: by 2002:aa7:d6cd:0:b0:522:21a1:5153 with SMTP id
 x13-20020aa7d6cd000000b0052221a15153mr10095831edr.11.1691456915450; 
 Mon, 07 Aug 2023 18:08:35 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHkZLeB+bmxNg6SjBpgAp1zk6wqoy9mBRzxJDLX32TbMZTnd/OUu7MPzq6Df+o0oFwNjjolLg==
X-Received: by 2002:aa7:d6cd:0:b0:522:21a1:5153 with SMTP id
 x13-20020aa7d6cd000000b0052221a15153mr10095827edr.11.1691456915218; 
 Mon, 07 Aug 2023 18:08:35 -0700 (PDT)
Received: from cassiopeiae ([2a02:810d:4b3f:de9c:642:1aff:fe31:a19f])
 by smtp.gmail.com with ESMTPSA id
 u25-20020a056402065900b005233d7e3452sm1689932edx.45.2023.08.07.18.08.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Aug 2023 18:08:34 -0700 (PDT)
Date: Tue, 8 Aug 2023 03:08:32 +0200
From: Danilo Krummrich <dakr@redhat.com>
To: Faith Ekstrand <faith@gfxstrand.net>
Message-ID: <ZNGVkNiQhxVioAzP@cassiopeiae>
References: <20230807234210.175968-1-faith.ekstrand@collabora.com>
MIME-Version: 1.0
In-Reply-To: <20230807234210.175968-1-faith.ekstrand@collabora.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Subject: Re: [Nouveau] [PATCH] drm/nouveau/sched: Don't pass user flags to
 drm_syncobj_find_fence()
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
Cc: nouveau@lists.freedesktop.org,
 Faith Ekstrand <faith.ekstrand@collabora.com>, dri-devel@lists.freedesktop.org,
 Dave Airlie <airlied@redhat.com>
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

On Mon, Aug 07, 2023 at 06:41:44PM -0500, Faith Ekstrand wrote:
> The flags field in drm_syncobj_find_fence() takes SYNCOBJ_WAIT flags
> from the syncobj UAPI whereas sync->flags is from the nouveau UAPI. What
> we actually want is 0 flags which tells it to just try to find the
> fence and then return without waiting.

Good catch!

Reviewed-by: Danilo Krummrich <dakr@redhat.com>

> 
> Signed-off-by: Faith Ekstrand <faith.ekstrand@collabora.com>
> Fixes: b88baab82871 ("drm/nouveau: implement new VM_BIND uAPI")
> Cc: Danilo Krummrich <dakr@redhat.com>
> Cc: Dave Airlie <airlied@redhat.com>
> ---
>  drivers/gpu/drm/nouveau/nouveau_sched.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/nouveau/nouveau_sched.c b/drivers/gpu/drm/nouveau/nouveau_sched.c
> index b3b59fbec291..3424a1bf6af3 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_sched.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_sched.c
> @@ -142,7 +142,7 @@ sync_find_fence(struct nouveau_job *job,
>  
>  	ret = drm_syncobj_find_fence(job->file_priv,
>  				     sync->handle, point,
> -				     sync->flags, fence);
> +				     0 /* flags */, fence);
>  	if (ret)
>  		return ret;
>  
> -- 
> 2.41.0
> 

