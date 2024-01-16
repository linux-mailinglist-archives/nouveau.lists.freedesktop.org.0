Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 35A9D82EF08
	for <lists+nouveau@lfdr.de>; Tue, 16 Jan 2024 13:32:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B9B1610E4B5;
	Tue, 16 Jan 2024 12:32:34 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com
 [209.85.128.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 437FC10E4CA
 for <nouveau@lists.freedesktop.org>; Tue, 16 Jan 2024 12:32:33 +0000 (UTC)
Received: by mail-wm1-f47.google.com with SMTP id
 5b1f17b1804b1-40e5f746ac4so63223755e9.1
 for <nouveau@lists.freedesktop.org>; Tue, 16 Jan 2024 04:32:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1705408292; x=1706013092; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=ZT+z5kO7NZ0JfHwGBIqmnXCQBjLsapUuYK3PYHhWBbs=;
 b=XcqUeVO4Hv+FaK2uwo2WGSvT2CFe02YYZJYn0XhVRfS6wbLYErDGlMtdBt2oYgrxox
 kBcfRJMAZAQ41E8/FSxq6apppuGDfmFCyy5CSSTJKlNr661RQUQMI9YKtC8EKqziXKdQ
 ZlBkT46hm5Ge3CJCZlEs6NoszAtqvT6Gv2fY30qHjIvmPwTyudyv2r9u/9Khp5gyjLDI
 UtiNLAk1HU7kH58vqlxeVrW2LB5+Yn1DUGq0D/i66Rr9nfQWswryyFNqBT0wpc7whbeD
 Qs+VcNZ4nShoKXcMmGI883V/mu4EZHepee6thNMhkVusO3Ht0TFNwnoC/BqJJdTzd/aI
 Y7RA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1705408292; x=1706013092;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ZT+z5kO7NZ0JfHwGBIqmnXCQBjLsapUuYK3PYHhWBbs=;
 b=snTLwibrVS1nCWoevZg9rCbSk7plkdijdAmz8qyTIPxM+zSfeVw+dsz04MHImsf1Is
 UiwxXNWONZ9br5HYMI5vk4PWoXA85fRzv/o7FnvJTvHNM3AC5WIjFqS8KKMcADEVaHSk
 erXY/UvaxFbL7nUFsDP0OhCnzsVBosN5IlN27veqFQcW0MEIjwbwdhNTZrmHkrFAP8pM
 IE91UjY/MJ/TojiLOGG98KJkhEvOXxDHhvJ1oXbiz+24DgME2kRifg+WjEfm9Kt/svS9
 Kq3BjBvPGvDd65NqLTMLOvM+RjrHxs845yX7OqRhIEsw54WG9iCmI5++a3Bdd1dIg11v
 o6Fw==
X-Gm-Message-State: AOJu0Yxs4IGJY5llkGX4zxjTA8owVwVOAKjY09EKNEJtiPX2f6k+oTgR
 0lreJWUFGJe4HY/nav8BgLvkilAT0mXz8A==
X-Google-Smtp-Source: AGHT+IEE+TByEl7XVOYopKpmNFuQHPmwYwCI1LrdzsQYzrF0eXV1Q8x8cWXCEoLTXlRQR5WPDNP8Hw==
X-Received: by 2002:a1c:740b:0:b0:40d:8815:afff with SMTP id
 p11-20020a1c740b000000b0040d8815afffmr3913595wmc.39.1705408291854; 
 Tue, 16 Jan 2024 04:31:31 -0800 (PST)
Received: from localhost ([102.140.209.237]) by smtp.gmail.com with ESMTPSA id
 d15-20020adf9c8f000000b00336c43b366fsm14493657wre.12.2024.01.16.04.31.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Jan 2024 04:31:31 -0800 (PST)
Date: Tue, 16 Jan 2024 15:31:27 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Colin Ian King <colin.i.king@gmail.com>
Subject: Re: [PATCH][next] drm/nouveau/fifo/gk104: remove redundant variable
 ret
Message-ID: <aafe669f-b322-4f22-a48e-564e3eb3447f@moroto.mountain>
References: <20240116111609.2258675-1-colin.i.king@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240116111609.2258675-1-colin.i.king@gmail.com>
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
Cc: nouveau@lists.freedesktop.org, kernel-janitors@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Daniel Vetter <daniel@ffwll.ch>
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

On Tue, Jan 16, 2024 at 11:16:09AM +0000, Colin Ian King wrote:
> The variable ret is being assigned a value but it isn't being
> read afterwards. The assignment is redundant and so ret can be
> removed.
> 
> Cleans up clang scan build warning:
> warning: Although the value stored to 'ret' is used in the enclosing
> expression, the value is never actually read from 'ret'
> [deadcode.DeadStores]
> 
> Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
> ---
>  drivers/gpu/drm/nouveau/nvif/fifo.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/nouveau/nvif/fifo.c b/drivers/gpu/drm/nouveau/nvif/fifo.c
> index a463289962b2..e96de14ce87e 100644
> --- a/drivers/gpu/drm/nouveau/nvif/fifo.c
> +++ b/drivers/gpu/drm/nouveau/nvif/fifo.c
> @@ -73,9 +73,9 @@ u64
>  nvif_fifo_runlist(struct nvif_device *device, u64 engine)
>  {
>  	u64 runm = 0;
> -	int ret, i;
> +	int i;
>  
> -	if ((ret = nvif_fifo_runlists(device)))
> +	if (nvif_fifo_runlists(device))
>  		return runm;

Could we return a literal zero here?  Otherwise, I'm surprised this
doesn't trigger a static checker warning.

regards,
dan carpenter

