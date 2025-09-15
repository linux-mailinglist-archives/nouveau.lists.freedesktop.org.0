Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D8EC4B58805
	for <lists+nouveau@lfdr.de>; Tue, 16 Sep 2025 01:07:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA1CF10E363;
	Mon, 15 Sep 2025 23:07:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="PvZJTX/y";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com
 [209.85.160.180])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A6BA10E13F
 for <nouveau@lists.freedesktop.org>; Mon, 15 Sep 2025 23:07:18 +0000 (UTC)
Received: by mail-qt1-f180.google.com with SMTP id
 d75a77b69052e-4b3d3f6360cso44213461cf.0
 for <nouveau@lists.freedesktop.org>; Mon, 15 Sep 2025 16:07:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1757977637; x=1758582437;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=ntdt+Fw1ooyH2+q0/xC8jx4AecQq6NmyBnAlPcFGaz8=;
 b=PvZJTX/yP/YejIGequBMxiH0snKVK5ch0l7h72DRYCsih3Oyn2188ybE3hAWaPQ3nv
 ZJqIzfrc14rREVsSwRSLNDki374AB/9caPJR/R/1mI+EWPgYl25EaXtxDOon5daBX72S
 Rtq9oD/MJCkxuUBRWFEJwZTvoQu08ejQ/kUIX5JCUGxN4BocgjYja9qYB38Z4SpRZa1i
 yebbz6uF1xxo0edM8rXKagp8MT+M+4Stlg93UaWf4hf3IToeZle1LyGszFDPjwLwW1st
 Q9kE4e8XYAudTDhacSM56jPaWkBWBCLwAQhTB/nLRnNxgNpzZD9rue6kw/EQnXVL22Rt
 WG/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757977637; x=1758582437;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ntdt+Fw1ooyH2+q0/xC8jx4AecQq6NmyBnAlPcFGaz8=;
 b=KqZu7VKIfWsDKkihHrk2wwx86uZqqGcAlfd9rs6I3AX6ORILIkWLA9eIWZjc218gOf
 Bk+dXfTy3xQueiU1pL3HWcnI4Z6efQ+bchAyJZK7JAtJ0t0C4r9CBvQTkDjAAdLagupz
 gWfHSQZjHT51lnPHTZU4FInaYKMutAkD1JUH4Y9IQZ+fAH2qoMG/4MBT68m0wBh3Xdok
 Mo+5U6D5pBwRCutxr/nm7Bg0cVxgdqt2SVgaEr9mRJBYDFbsE88+PvM1A1czgxOB7Xq5
 VSTKQpfj1FR8VVSahV1eKQQWltB9SV40sOnUFxxcbHqZuALN5+ZZ9lU6F4kf8ZMCzGzF
 UCxw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVm4P8jJYUocKtosA9lnLlJeh6AA7UX3ubb5ugMSYZCbqPr9HXtWlrs/JPMNiuyddGQoaIRVp2r@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxVmJAH3dEOi2V0eaER3NQg5bQuqoNyNHYm8WnCI+h/mLdJwJrY
 L8tbvsMbgqzYVWPNC4WusoeO2EF+b0/J4+ZRuKi+5CP24d597ne3zSqC2ufPVICjY4WtON3wT8g
 otGCD/g==
X-Gm-Gg: ASbGnct0p/1HoN4goPmfCsNB/XlWkrLJHoaRNbV2K6nJTMes+o498yMebP+qFTRKlGU
 eF5YNQHzZyX7haf/jv52MtGGSkYZ9jbRTxfB0M4Wy9resiQ8TZP07pDPlLg7yAL3G1oY2d8vqG/
 OseXHfd20nXwY9sooFhxQq7bSsekA2DDjhwnw5tr22zMnzDHsqZ5Lv5jkKlKnKN01BmJ72/3OFV
 UExPahHx/hpLjeEJM4qs2U8tIrAgG5BlsiwRQkS4bnzuRSsSywrV46LcK/YTyExklcDydFiuXzT
 3t/RfSNgsdCetDSNrOD/1dqu0v4PA7+/8g4ULZwK2acpKs66Kic+jpVH+Vh3eSr3E5H1ZHDuyR+
 uob1wBO/tC78X7I2b9tz+JqfsJhvY3BNs81bLLKJZnsVB7zq91ePGZv4+N48C8df4DvSmlvqVg7
 r7g7eg1Q==
X-Google-Smtp-Source: AGHT+IEoi1lVcF4aPi9zcBQfqqjlIJGn2T6EJO2nM/jlo5+f9d6XecVONNJlc1ldgD3Xd7nmpRVVIA==
X-Received: by 2002:a05:6e02:12c7:b0:418:4323:921f with SMTP id
 e9e14a558f8ab-420a568c3a9mr147338935ab.32.1757977624725; 
 Mon, 15 Sep 2025 16:07:04 -0700 (PDT)
Received: from google.com (138.243.29.34.bc.googleusercontent.com.
 [34.29.243.138]) by smtp.gmail.com with ESMTPSA id
 e9e14a558f8ab-423f9383029sm37354345ab.32.2025.09.15.16.07.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Sep 2025 16:07:03 -0700 (PDT)
Date: Mon, 15 Sep 2025 16:06:59 -0700
From: Justin Stitt <justinstitt@google.com>
To: "Gustavo A. R. Silva" <gustavoars@kernel.org>
Cc: Lyude Paul <lyude@redhat.com>, Danilo Krummrich <dakr@kernel.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 dri-devel@lists.freedesktop.org, 
 nouveau@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-hardening@vger.kernel.org
Subject: Re: [PATCH v3][next] drm/nouveau: fifo: Avoid
 -Wflex-array-member-not-at-end warning
Message-ID: <fksv7eprcqnb55n5zllfyhk7ynx6zgbeuqtuoimbpgamguyodh@niwjdhicah2j>
References: <aJ17oxJYcqqr3946@kspp>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aJ17oxJYcqqr3946@kspp>
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

Hi,

On Thu, Aug 14, 2025 at 03:01:07PM +0900, Gustavo A. R. Silva wrote:
> -Wflex-array-member-not-at-end was introduced in GCC-14, and we are
> getting ready to enable it, globally.
> 
> Use the new TRAILING_OVERLAP() helper to fix the following warning:
> 
> drivers/gpu/drm/nouveau/nvif/fifo.c:29:42: warning: structure containing a flexible array member is not at the end of another structure [-Wflex-array-member-not-at-end]
> 
> This helper creates a union between a flexible-array member (FAM)
> and a set of members that would otherwise follow it. This overlays
> the trailing members onto the FAM while preserving the original
> memory layout.
> 
> Signed-off-by: Gustavo A. R. Silva <gustavoars@kernel.org>

I took a look at the modified structure layout with the union from the
macro using pahole and found the layouts and sizes to be equivalent --
all the while fixing the warning you demonstrated.

Reviewed-by: Justin Stitt <justinstitt@google.com>

> ---
> Changes in v3:
>  - Use the new TRAILING_OVERLAP() helper.

There's really starting to be a lot of these helper macros!

> 
> Changes in v2:
>  - Adjust heap allocation.
> 
>  drivers/gpu/drm/nouveau/nvif/fifo.c | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/nouveau/nvif/fifo.c b/drivers/gpu/drm/nouveau/nvif/fifo.c
> index a463289962b2..b0ab80995d98 100644
> --- a/drivers/gpu/drm/nouveau/nvif/fifo.c
> +++ b/drivers/gpu/drm/nouveau/nvif/fifo.c
> @@ -25,13 +25,12 @@ static int
>  nvif_fifo_runlists(struct nvif_device *device)
>  {
>  	struct nvif_object *object = &device->object;
> -	struct {
> -		struct nv_device_info_v1 m;
> +	TRAILING_OVERLAP(struct nv_device_info_v1, m, data,
>  		struct {
>  			struct nv_device_info_v1_data runlists;
>  			struct nv_device_info_v1_data runlist[64];
>  		} v;
> -	} *a;
> +	) *a;
>  	int ret, i;
>  
>  	if (device->runlist)
> -- 
> 2.43.0
> 
>

Thanks
Justin
