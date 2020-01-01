Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D95712E031
	for <lists+nouveau@lfdr.de>; Wed,  1 Jan 2020 19:48:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A56189BA5;
	Wed,  1 Jan 2020 18:48:54 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6BFF289BA5
 for <nouveau@lists.freedesktop.org>; Wed,  1 Jan 2020 18:48:53 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id p17so4030679wma.1
 for <nouveau@lists.freedesktop.org>; Wed, 01 Jan 2020 10:48:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:in-reply-to;
 bh=B/sd6xhXXpuwJBp+kaINuvIW2l7yFRLjwKn3IBy/+os=;
 b=GwN9qvf4LyBDGZZaZWrXzo6BOFPnDtlajbeoG1UTE/0he02g17nC+ZaXG/VeP3MqEz
 dSVkwPOfAYxs8uDYJHPuzA3nlQRybla75ewusneNntG9ESChtMM8YiHh4d8sJuDmOKr9
 //vRsoHz+djvkDj9oGpkaNBFNdGRVjmZNFC20=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to;
 bh=B/sd6xhXXpuwJBp+kaINuvIW2l7yFRLjwKn3IBy/+os=;
 b=fWV8MKsak8JW5tJLlj9I8WHW5XdfsTDhBdTA2lwOAbLwDGsKKFOFJSpAqVb78xksVb
 +ATynnxafut9DFILBvKdFFnaT3pKlRpugb3nWC6nK6414ufj2lXw4nvprfPlkoV5aEhk
 ocFbpdWIoToosZFT3o8zzBabvgQaHsZyPJZjYA+GwEmtY21kCO8z2A2mKbau4ElHZrub
 EQKTukdT3s1Svuv9o+S0trc9/741r7XyCAN/KdifdrSgU+4r9OUWQq9P2NutbenzrX7g
 5IWdW0eK1ImleZVTf7UzSdeKA4R8AW/2y3nZM0Jrowwh9nxTw8MIvMv7sy5nwzdOmbFc
 ZjTg==
X-Gm-Message-State: APjAAAWjpGEyHic/I3j/ePBOBM/F1c08u/qaeY3jf5cR40YWUWxOkCnv
 VUt7m3U5f8RaMBUyxOcj6t6nnA==
X-Google-Smtp-Source: APXvYqyW3tBV/7q+H7o4VFXihIgDTuFVkq5L4vmpPa6c4No7kXIJpZyFMbaLSpsRpDkVeJBAjJmRqw==
X-Received: by 2002:a1c:7406:: with SMTP id p6mr10380009wmc.82.1577904532065; 
 Wed, 01 Jan 2020 10:48:52 -0800 (PST)
Received: from dvetter-linux.ger.corp.intel.com ([194.230.159.125])
 by smtp.gmail.com with ESMTPSA id h17sm56232629wrs.18.2020.01.01.10.48.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Jan 2020 10:48:51 -0800 (PST)
Date: Wed, 1 Jan 2020 19:48:43 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Wambui Karuga <wambui.karugax@gmail.com>
Message-ID: <20200101184843.GA3856@dvetter-linux.ger.corp.intel.com>
Mail-Followup-To: Wambui Karuga <wambui.karugax@gmail.com>,
 bskeggs@redhat.com, airlied@linux.ie,
 dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20191231205607.1005-1-wambui.karugax@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191231205607.1005-1-wambui.karugax@gmail.com>
X-Operating-System: Linux dvetter-linux.ger.corp.intel.com
 5.2.11-200.fc30.x86_64 
Subject: Re: [Nouveau] [PATCH] drm/nouveau: remove set but unused variable.
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
Cc: airlied@linux.ie, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 bskeggs@redhat.com, daniel@ffwll.ch
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

On Tue, Dec 31, 2019 at 11:56:07PM +0300, Wambui Karuga wrote:
> The local variable `pclks` is defined and set but not used and can
> therefore be removed.
> Issue found by coccinelle.
> 
> Signed-off-by: Wambui Karuga <wambui.karugax@gmail.com>
> ---
>  drivers/gpu/drm/nouveau/dispnv04/arb.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/nouveau/dispnv04/arb.c b/drivers/gpu/drm/nouveau/dispnv04/arb.c
> index 362495535e69..f607a04d262d 100644
> --- a/drivers/gpu/drm/nouveau/dispnv04/arb.c
> +++ b/drivers/gpu/drm/nouveau/dispnv04/arb.c
> @@ -54,7 +54,7 @@ static void
>  nv04_calc_arb(struct nv_fifo_info *fifo, struct nv_sim_state *arb)
>  {
>  	int pagemiss, cas, width, bpp;
> -	int nvclks, mclks, pclks, crtpagemiss;
> +	int nvclks, mclks, crtpagemiss;

Hm, reading the code (just from how stuff is named) I wonder whether the
original idea was that the calculation for us_p should us pclks, not
nvclks, but given that this code is as old as the initial nouveau merge
probably not a good idea to touch it. Plus I guess not many with a vintage
nv04 in working condition around to even test stuff ...

Ben, what should we do here?
-Daniel

>  	int found, mclk_extra, mclk_loop, cbs, m1, p1;
>  	int mclk_freq, pclk_freq, nvclk_freq;
>  	int us_m, us_n, us_p, crtc_drain_rate;
> @@ -69,7 +69,6 @@ nv04_calc_arb(struct nv_fifo_info *fifo, struct nv_sim_state *arb)
>  	bpp = arb->bpp;
>  	cbs = 128;
>  
> -	pclks = 2;
>  	nvclks = 10;
>  	mclks = 13 + cas;
>  	mclk_extra = 3;
> -- 
> 2.17.1
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
