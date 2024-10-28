Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B57F9B31FA
	for <lists+nouveau@lfdr.de>; Mon, 28 Oct 2024 14:44:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D2E4010E4B4;
	Mon, 28 Oct 2024 13:43:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="tP+olFZj";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com
 [209.85.208.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 82F1610E4B2
 for <nouveau@lists.freedesktop.org>; Mon, 28 Oct 2024 13:43:58 +0000 (UTC)
Received: by mail-lj1-f171.google.com with SMTP id
 38308e7fff4ca-2fb3da341c9so40903151fa.2
 for <nouveau@lists.freedesktop.org>; Mon, 28 Oct 2024 06:43:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1730123037; x=1730727837; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=/fMezR/kOH2DQBT9AoD8Am6CVmqlmYght41fc7YQIn4=;
 b=tP+olFZj/kQ812QlRgM1GvM/LQsgFCIKngZgMGNR3iAv9qgK33bILVhbHi+aTnjBe2
 bykk2fsSASJwp2oLyHTxo4JsFGJ0bQpEgrmLrMOXEkt3qz5EKxqIhaUDeQF5726wXi6w
 9jhofClllGFlF7qQr5eGKR6eyyRJuBvb3ZAiDq/q2LrNZG3ZYPP4z4ilDKijWWKxMeGk
 VDSeef6UlaH2Tt30khwpUSgqbpHIKpXqeIOAoIOvmASi98KrWIF77qEg6vGIURXLqFID
 WDQIIGuYh0zuvK2iPVYYE9ERDfkyk9CKaAfrREL/iMbK1tyhJwxyQukPZY08dXQkTCMg
 A8Kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730123037; x=1730727837;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/fMezR/kOH2DQBT9AoD8Am6CVmqlmYght41fc7YQIn4=;
 b=UEqBOmlVyUkB0JuqHyqO7V53CJac7YwR2JDnYQHf9QvKCE5ji2H5GyQ/rIkY/bdSU/
 EToGz/dJz63n9IQEgc7SiXDFgMV4q7jkKZ7s0eWnI+g+jwVZKWzV3MxLkMrikiiCHWMB
 TwtJW6H1ptYR/VJdHCSXRqd6mt+xMLvCcQtraWdWfd0mSKlIVyV4jlLCYguCIru9vzIY
 T17dUNDUBjBRcjF5oP7dUhYfg4eq9okcMXOSFzAUHNDv7CQLKktOuxYr1YP2ctIfVO7q
 Q9zRfACevXkiq5Q+dIQ4uN9GdSU4fb2xxKGZoBNR8I5JuHm80t3BFf7HGyzEb9a06V6+
 F1cw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWx1RKZEc/l9LYlJyDkJqljxWWJofL8fpi62XNwtdSLXizUJb815TH+xoVMDB9IA26ijARKKhxe@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxTwAmezJxcyDYww/7U6j5hLJpJI6RHO7aOvaSFT4sqcL+mFdSf
 lsHXGpjIa9pWHVnwCllbRJioiSBEAAsgJ/eYYlp322nzr8OykHJ5jcbUdkiPfJ4=
X-Google-Smtp-Source: AGHT+IFDCzKfy9vb0H+t7XlbkzhNd21X/z+Uek3eGFqV/jEyV6gcWxJNF6Q+5QcV2YXLsDKfxar/4Q==
X-Received: by 2002:a2e:a590:0:b0:2f6:5921:f35b with SMTP id
 38308e7fff4ca-2fcbe0055ffmr39731081fa.27.1730123036398; 
 Mon, 28 Oct 2024 06:43:56 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-2fcb4612a5asm11513551fa.122.2024.10.28.06.43.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Oct 2024 06:43:55 -0700 (PDT)
Date: Mon, 28 Oct 2024 15:43:52 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: linux@treblig.org, nouveau@lists.freedesktop.org, 
 Ben Skeggs <bskeggs@redhat.com>
Cc: maarten.lankhorst@linux.intel.com, mripard@kernel.org, 
 tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm: encoder_slave: Remove unused encoder functions
Message-ID: <im7gtswtfo6c24waourrtaoeazxuk5paeqblzig73knks735b2@dsj2svieqmur>
References: <20241025203920.244116-1-linux@treblig.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241025203920.244116-1-linux@treblig.org>
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

On Fri, Oct 25, 2024 at 09:39:20PM +0100, linux@treblig.org wrote:
> From: "Dr. David Alan Gilbert" <linux@treblig.org>
> 
> drm_i2c_encoder_commit(), drm_i2c_encoder_mode_set() and
> drm_i2c_encoder_prepare() have been unused since 2016's
> commit 7bc61cc5df80 ("drm/arcpgu: Accommodate adv7511 switch to DRM
> bridge").
> 
> Remove them.
> That change makes drm_i2c_encoder_dpms() unused.
> Remove it.
> 
> Remove the comments about those functions wrapping a couple of
> pointers in drm_encoder_slave_funcs.  I can see sil164, ch7006, and nv17
> set those fields, and I can see some nouveau code that calls them
> directly; so i don't think we can remove the fields.
> (Although it's not clear to me if the sil164 or ch7006 code
> can ever get called).
> 
> Signed-off-by: Dr. David Alan Gilbert <linux@treblig.org>
> ---
>  drivers/gpu/drm/drm_encoder_slave.c | 26 --------------------------
>  include/drm/drm_encoder_slave.h     | 11 ++---------
>  2 files changed, 2 insertions(+), 35 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_encoder_slave.c b/drivers/gpu/drm/drm_encoder_slave.c
> index e464429d32df..0c994a4ef9ae 100644
> --- a/drivers/gpu/drm/drm_encoder_slave.c
> +++ b/drivers/gpu/drm/drm_encoder_slave.c
> @@ -125,12 +125,6 @@ get_slave_funcs(struct drm_encoder *enc)
>  	return to_encoder_slave(enc)->slave_funcs;
>  }
>  
> -void drm_i2c_encoder_dpms(struct drm_encoder *encoder, int mode)
> -{
> -	get_slave_funcs(encoder)->dpms(encoder, mode);
> -}
> -EXPORT_SYMBOL(drm_i2c_encoder_dpms);

I think it might be better to convert nouveau to use these functions
instead of open-coding them. Another option might be to make nouveau use
normal drm_bridge interface to talk to i2c encoders and drop the custom
interface.

Ben, WDYT?

> -
>  bool drm_i2c_encoder_mode_fixup(struct drm_encoder *encoder,
>  		const struct drm_display_mode *mode,
>  		struct drm_display_mode *adjusted_mode)
> @@ -142,26 +136,6 @@ bool drm_i2c_encoder_mode_fixup(struct drm_encoder *encoder,
>  }
>  EXPORT_SYMBOL(drm_i2c_encoder_mode_fixup);
>  
> -void drm_i2c_encoder_prepare(struct drm_encoder *encoder)
> -{
> -	drm_i2c_encoder_dpms(encoder, DRM_MODE_DPMS_OFF);
> -}
> -EXPORT_SYMBOL(drm_i2c_encoder_prepare);
> -
> -void drm_i2c_encoder_commit(struct drm_encoder *encoder)
> -{
> -	drm_i2c_encoder_dpms(encoder, DRM_MODE_DPMS_ON);
> -}
> -EXPORT_SYMBOL(drm_i2c_encoder_commit);
> -
> -void drm_i2c_encoder_mode_set(struct drm_encoder *encoder,
> -		struct drm_display_mode *mode,
> -		struct drm_display_mode *adjusted_mode)
> -{
> -	get_slave_funcs(encoder)->mode_set(encoder, mode, adjusted_mode);
> -}
> -EXPORT_SYMBOL(drm_i2c_encoder_mode_set);
> -
>  enum drm_connector_status drm_i2c_encoder_detect(struct drm_encoder *encoder,
>  	    struct drm_connector *connector)
>  {
> diff --git a/include/drm/drm_encoder_slave.h b/include/drm/drm_encoder_slave.h
> index 49172166a164..3089db10b6fd 100644
> --- a/include/drm/drm_encoder_slave.h
> +++ b/include/drm/drm_encoder_slave.h
> @@ -58,8 +58,7 @@ struct drm_encoder_slave_funcs {
>  	void (*destroy)(struct drm_encoder *encoder);
>  
>  	/**
> -	 * @dpms: Analogous to &drm_encoder_helper_funcs @dpms callback. Wrapped
> -	 * by drm_i2c_encoder_dpms().
> +	 * @dpms: Analogous to &drm_encoder_helper_funcs @dpms callback.
>  	 */
>  	void (*dpms)(struct drm_encoder *encoder, int mode);
>  
> @@ -88,7 +87,7 @@ struct drm_encoder_slave_funcs {
>  			  struct drm_display_mode *mode);
>  	/**
>  	 * @mode_set: Analogous to &drm_encoder_helper_funcs @mode_set
> -	 * callback. Wrapped by drm_i2c_encoder_mode_set().
> +	 * callback.
>  	 */
>  	void (*mode_set)(struct drm_encoder *encoder,
>  			 struct drm_display_mode *mode,
> @@ -223,15 +222,9 @@ void drm_i2c_encoder_destroy(struct drm_encoder *encoder);
>   * Wrapper fxns which can be plugged in to drm_encoder_helper_funcs:
>   */
>  
> -void drm_i2c_encoder_dpms(struct drm_encoder *encoder, int mode);
>  bool drm_i2c_encoder_mode_fixup(struct drm_encoder *encoder,
>  		const struct drm_display_mode *mode,
>  		struct drm_display_mode *adjusted_mode);
> -void drm_i2c_encoder_prepare(struct drm_encoder *encoder);
> -void drm_i2c_encoder_commit(struct drm_encoder *encoder);
> -void drm_i2c_encoder_mode_set(struct drm_encoder *encoder,
> -		struct drm_display_mode *mode,
> -		struct drm_display_mode *adjusted_mode);
>  enum drm_connector_status drm_i2c_encoder_detect(struct drm_encoder *encoder,
>  	    struct drm_connector *connector);
>  void drm_i2c_encoder_save(struct drm_encoder *encoder);
> -- 
> 2.47.0
> 

-- 
With best wishes
Dmitry
