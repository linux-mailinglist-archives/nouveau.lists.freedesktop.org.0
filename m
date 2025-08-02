Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D9C33B18B14
	for <lists+nouveau@lfdr.de>; Sat,  2 Aug 2025 09:35:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 907B010E00C;
	Sat,  2 Aug 2025 07:35:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="wnROhmYa";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com
 [209.85.128.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C368210E0A8
 for <nouveau@lists.freedesktop.org>; Sat,  2 Aug 2025 07:35:39 +0000 (UTC)
Received: by mail-wm1-f54.google.com with SMTP id
 5b1f17b1804b1-458bb0e692cso1534395e9.0
 for <nouveau@lists.freedesktop.org>; Sat, 02 Aug 2025 00:35:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1754120138; x=1754724938; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=Y/Rq8yrsaANYeJXcIdVpkfDYBEqWUqNEPhGfDYm3Rks=;
 b=wnROhmYavZd36wwSzzmU2o+7mSDpdlpdWR1ATK41CZBTJUt5GgSXZ5bvuCubMcVKTY
 GkpMSlkd4mwX22Jp9dpMzG/bxsQQOgfvVgRk00my4jGJJyEE//UkxBT4gBkchHb682+l
 Gcng22oFK6ruD0l8/4hRN5DUqdUUdilgOYI3p8QL5NrMrsczHFNPS0iBZTGwsgjAI0uP
 NQpRQH4xiqABOwlbA1Fgv81yevs9JWykfA5ETLBucfUS4RfvUvR2BR8O+J+LqpOLhaam
 3ncIEwY/qRNluEdvnwFCfJnAnzrnNbKTpAdS6w4H7K0sQVthcN0fmEtM9T+cbj/8gV/0
 hVoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754120138; x=1754724938;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Y/Rq8yrsaANYeJXcIdVpkfDYBEqWUqNEPhGfDYm3Rks=;
 b=Te5WPYai1Irvz+FSWNd3pIwa3T6CZaGa67oW4uTw2BqteEPMxuvoCa/5RqyFiZmZDu
 6ze/pZGVrjpU+Qyk0h2ngA0Gyc+j4FM9G3awEfLy1OrzLxsbapc72uC8nIGlPFnYJus7
 LGkLGG+uVkW2lpKJTZd/bhBwXZg22YPXfQditNAo9AuOAeKZswFs+TJTjS3d8Tr9gzoe
 qsehQCtJunBU5qcM4aOkuCRxxGJZetD71lzx2/31f7MMGq6PvbUYyTMkA5RHj+rmSB5K
 OYbJ3IypQ1x7gE589jDKOtJGdDRfrEiEV5mMcg9eiaZjOyTwvWYXR8niRoXnpv03rk8L
 tBWA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVyVMnQcQxSdOD1+eIfJIWEzYnYSfQVp3qKTqy5FgVxNlAaOcia34li6UHpRUKLOCLgdy5Ct/kh@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwNiRB2ZFis5FmOyyqy+GuUb+UhubvqvynSW2FalWmyCPSwDPvX
 oi7RRmMhpg9XN/khJaFiaF7siUf4xzzc3gMpFsV026VxwsiOV0SYptsRX9z6T8f+NrE=
X-Gm-Gg: ASbGncvhJZZqSdHonKkSJWSmRiMKDIsgNueR6f4wFibTToGVb65bY8qQ+zElsY0Bfe2
 Fevs/7HfQpNUsLjo59xNZLaAHoSGHwkfUDPue8iD6o5Eo+S6J9Ze3+u5r+TCXw5/jtYMHgzc2SX
 lGqwVMuZUvUir+L+/cylkxGOVJ6y0Szx5mtPV1MJYrTD+und/oJbo3s1uiS3hcQ9aXr2YWSbUDw
 IjI9k9lUnccRSNCSo9ym45fWmyHBBvRR3P+HIgXIQlugJChRKTYDkqiMhFQU98sjFIrcsxfhKKn
 0wEEJH3Y4I6pKHaenhE1Nr+EEqTjQBOLB+rIEY7KxyeqJdvvA96cUnyMUxNGXzHVvGB8l16UD7a
 5516v4xX1KOYRpvlQN5/VW6jMSvVpZY7rJGNDIA==
X-Google-Smtp-Source: AGHT+IGzFox4oyjb5/WhDqdQVJopYxoMkjFPEJSXG+cagflCj14ks0y04aMJJDzRXsWdRJFhVzyzQg==
X-Received: by 2002:a05:6000:4011:b0:3b8:d32c:7740 with SMTP id
 ffacd0b85a97d-3b8d94c1372mr1661279f8f.43.1754120137907; 
 Sat, 02 Aug 2025 00:35:37 -0700 (PDT)
Received: from localhost ([196.207.164.177]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3b79c453c80sm8299041f8f.43.2025.08.02.00.35.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 02 Aug 2025 00:35:37 -0700 (PDT)
Date: Sat, 2 Aug 2025 10:35:34 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Ethan Carter Edwards <ethan@ethancedwards.com>
Cc: Lyude Paul <lyude@redhat.com>, Danilo Krummrich <dakr@kernel.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] drm/nouveau/gsp: remove always true if check
Message-ID: <6a0dd96d-e98a-488e-87d1-a3e6cbce7b53@suswa.mountain>
References: <20250801-nouveau-fifo-v1-1-25b9db5283bc@ethancedwards.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250801-nouveau-fifo-v1-1-25b9db5283bc@ethancedwards.com>
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

On Fri, Aug 01, 2025 at 09:49:26PM -0400, Ethan Carter Edwards wrote:
> if (1) always evaluates to true. Remove the unneeded check.
> 
> Signed-off-by: Ethan Carter Edwards <ethan@ethancedwards.com>
> ---
>  .../gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/fifo.c | 36 ++++++++++------------
>  1 file changed, 16 insertions(+), 20 deletions(-)
> 
> diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/fifo.c b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/fifo.c
> index 1ac5628c5140e66d306a1aadce10c810886afad3..104c72ec359a07a318ac99f5c217f0b07db2b784 100644
> --- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/fifo.c
> +++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/fifo.c
> @@ -188,32 +188,28 @@ r535_chan_ramfc_write(struct nvkm_chan *chan, u64 offset, u64 length, u32 devm,
>  	if (ret)
>  		return ret;
>  
> -	if (1) {
> -		NVA06F_CTRL_GPFIFO_SCHEDULE_PARAMS *ctrl;
> +	NVA06F_CTRL_GPFIFO_SCHEDULE_PARAMS *ctrl;
>  
> -		if (1) {
> -			NVA06F_CTRL_BIND_PARAMS *ctrl;
> +	NVA06F_CTRL_BIND_PARAMS *ctrl;
>  

I really don't like this business of declaring variables randomly
throughout the code, unless it's required for __cleanup magic.  Anyway,
here it breaks the build.

regards,
dan carpenter


