Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 062D490C418
	for <lists+nouveau@lfdr.de>; Tue, 18 Jun 2024 09:01:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 05C5410E592;
	Tue, 18 Jun 2024 07:01:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="BSl46v6h";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com
 [209.85.221.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6218F10E290
 for <nouveau@lists.freedesktop.org>; Tue, 18 Jun 2024 07:01:00 +0000 (UTC)
Received: by mail-wr1-f51.google.com with SMTP id
 ffacd0b85a97d-35f275c7286so4586095f8f.2
 for <nouveau@lists.freedesktop.org>; Tue, 18 Jun 2024 00:01:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1718694058; x=1719298858; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=v0a5p1bD0AyssKGKB5WnIImRaJI9ITejqF9cQEG0YuY=;
 b=BSl46v6hsjf/Jghv+J++XW1llXyYOZDuEltsC41x37OVRu87HBSwctBicYndLf9r2/
 E/T3sNB4ZhctZSKyDSoP0+fl9Aycn00SY8PSSVRQwMywol5LoZZb5qrUVpPF+69TIF0h
 jlaNJ7p1+1chMj0maZjCLWHxWjJ7EdZw33IW4qe0SJnhkcwz0t8lVVIp1DUbZrAeNVK+
 RbAtuy4rVjorS1et3jDrSsXsSuWhG7vuCrxv9dPnbppUoWVOodZz0JW0jEnDHViFbLQQ
 xWsKAzIIkjDGRcvyLHFJxJ3s5zm2XwDNiH17Y288g0X7JzwKLlrae9eADhGJqe3Itq3n
 hgyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718694058; x=1719298858;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=v0a5p1bD0AyssKGKB5WnIImRaJI9ITejqF9cQEG0YuY=;
 b=syBLNWSKHJ0jXj+nw8Wzvzhmg4Or36Hogtk0fHNQoMgleYW6uux9+IdPAdnSS1VilQ
 SKqB8VTWcYsEFfoBWmbHBbRoIpdNTvz13AlyS/Y49oO3rvKVA1RHYRp7zj/vjVtBUJ37
 rqkzmLy5XuB7CzxOnjXH7itPEa4Mr47ig0no6TqPqK3ImPENj4aprGs+Jg5VJkHWMjaL
 7NikDrTYc+DuuwyG3V0fU1OL5aYobv6cIy1vaRql4REgKGktP6OcCUrpXyWAyoCO3zD6
 ryfcmzFjNYYeATtSkocHbGJq9aVJybs37etiZQkEeGl72sp3uHYeWG+QDCrWsjkkRhYw
 hghQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWv4DQeUfmSKEJT2UORcz6VS8526K5CusdiUyPYWpuB/UpAwsTuyfa+mnb/RL6Bh5pe/xEfsfIl6juhotl781iJopNgIBa9o+6egNKwew==
X-Gm-Message-State: AOJu0YxX4UbhXpNC4GkOvttMU/gN3V8cdrS0T875NL5ooo2sYOCu8xbN
 +q1ko/tap9Mn3wwQLCE+Deu6gsI/h0Mf9VnMUBLRfkSOC9VJAzNCy0AKepI+xPQ=
X-Google-Smtp-Source: AGHT+IENTRuaf3ngXVONzPwSYh1oRVgwzc4UC8HbyWW/rviR2sWOLdMBJeB9XSWba9XZVCRXPH2cZQ==
X-Received: by 2002:a05:6000:87:b0:361:bd3f:f89b with SMTP id
 ffacd0b85a97d-361bd3ff946mr527425f8f.50.1718694028568; 
 Tue, 18 Jun 2024 00:00:28 -0700 (PDT)
Received: from localhost ([102.222.70.76]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-36077536f78sm13307498f8f.7.2024.06.18.00.00.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Jun 2024 00:00:27 -0700 (PDT)
Date: Tue, 18 Jun 2024 10:00:23 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Danilo Krummrich <dakr@redhat.com>
Cc: Lyude Paul <lyude@redhat.com>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 kernel-janitors@vger.kernel.org, Karol Herbst <kherbst@redhat.com>
Subject: Re: [PATCH] drm/nouveau: Use kmemdup_array() instead of kmemdup()
Message-ID: <ba70e0f2-c957-4235-aa51-b1a8c86034b6@moroto.mountain>
References: <a3e8cecc-77dd-4a4a-bb12-c1d6759d3efb@moroto.mountain>
 <a61d9781-7c6e-46b8-ab1b-cf4fc1c76ba3@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a61d9781-7c6e-46b8-ab1b-cf4fc1c76ba3@redhat.com>
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

On Mon, Jun 17, 2024 at 05:55:33PM +0200, Danilo Krummrich wrote:
> On 6/17/24 11:33, Dan Carpenter wrote:
> > Use kmemdup_array() because we're allocating an array.
> > 
> > The main difference between kmemdup() and kmemdup_array() is that the
> > kmemdup_array() function has integer overflow checking built it.  The
> > "args->in_sync.count" variable is a u32 so integer overflows would only
> > be a concern on 32bit systems.  Fortunately, however, the u_memcpya()
> > function has integer overflow checking which means that it is not an
> > issue.
> > 
> > Still using kmemdup_array() is more appropriate and makes auditing the
> > code easier.
> 
> Indeed, we shouldn't rely on the previous check here, good catch.
> 
> > 
> > Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> > ---
> >   drivers/gpu/drm/nouveau/nouveau_sched.c | 16 ++++++++--------
> >   1 file changed, 8 insertions(+), 8 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/nouveau/nouveau_sched.c b/drivers/gpu/drm/nouveau/nouveau_sched.c
> > index 32fa2e273965..53d8b0584a56 100644
> > --- a/drivers/gpu/drm/nouveau/nouveau_sched.c
> > +++ b/drivers/gpu/drm/nouveau/nouveau_sched.c
> > @@ -45,10 +45,10 @@ nouveau_job_init(struct nouveau_job *job,
> >   		if (job->sync)
> >   			return -EINVAL;
> > -		job->in_sync.data = kmemdup(args->in_sync.s,
> > -					 sizeof(*args->in_sync.s) *
> > -					 args->in_sync.count,
> > -					 GFP_KERNEL);
> > +		job->in_sync.data = kmemdup_array(args->in_sync.s,
> > +					args->in_sync.count,
> > +					sizeof(*args->in_sync.s),
> > +					GFP_KERNEL);
> >   		if (!job->in_sync.data)
> >   			return -ENOMEM;
> 
> Not sure if this is what we want for kmemdup_array(). It just saturates the
> size. This doesn't prevent accessing the array out of bounds later on. I mean,
> it's rather unlikely to get such a huge amount of physically contiguous memory
> anyways, but wouldn't it be cleaner to let kmemdup_array() return
> ERR_PTR(-EOVERFLOW) on overflow, just like memdup_array_user()[1]?
> 
> AFAICS, there's just two users of kmemdup_array(), hence it should be an easy
> change. :-)
> 
> [1] https://elixir.bootlin.com/linux/latest/source/include/linux/string.h#L30
> 

We can't change the return values.

kmemdup_array() has to match kmemdup().  <-- returns NULL
memdup_array_user() has to match memdup_user().  <-- returns error pointer

regards,
dan carpenter

