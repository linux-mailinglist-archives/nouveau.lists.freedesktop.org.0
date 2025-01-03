Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AECB2A00E72
	for <lists+nouveau@lfdr.de>; Fri,  3 Jan 2025 20:43:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E8D6110E27B;
	Fri,  3 Jan 2025 19:43:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="rDtD9nv5";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com
 [209.85.128.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 55B0010E27B
 for <nouveau@lists.freedesktop.org>; Fri,  3 Jan 2025 19:43:10 +0000 (UTC)
Received: by mail-wm1-f42.google.com with SMTP id
 5b1f17b1804b1-436202dd7f6so142261895e9.0
 for <nouveau@lists.freedesktop.org>; Fri, 03 Jan 2025 11:43:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1735933329; x=1736538129; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=gZYLBdsRdDPVtkeCUAysBUJx2iI5sqwL/egQovGRiw8=;
 b=rDtD9nv5ox/BMyhvkhyJ97Zhx9DKYOTaVYWtL/Sb9aKHaPIUZ+KyDK5LrMVSD5NbKN
 nvmzp2nNENoVIdD4YkPYMrDX24XQtxoBfYUdIrVEm1dCWDSUk3JseO5Ah27roduCMhlG
 7Lhc51ynHOSpTE/VRagKrocwVt6ougjONdEpX2pBmdOoxJHpT19mOlZwhaTmmJ6td5QR
 MCyqwamazoe1Pp5nDFYeIncaYSLijElloUrsfmqqOFD9emg9sYtxOG9FWyUkG3oTo2/g
 hzRuVVolwgwpEvEYCrCozcMyZSw/hG9jZVY1LUTJCm0ofC3NI5w9buBHdL+zgAUiNC/E
 lRdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1735933329; x=1736538129;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=gZYLBdsRdDPVtkeCUAysBUJx2iI5sqwL/egQovGRiw8=;
 b=lQGN2o/Sf9kjFoJl4OR+nWaO6HaVUH9fxePLJcKCkYG9sb54NswLmSejF9l+8kaw1P
 0/7Phw267FlDBHbRo5XQsCu4qcWiV8kN5qTjhUXUI+Ex1KxdbUZTA/JtW4oSidMFwTBV
 2xIvTl8apn4Md7salq12+L4ggOA0QjCJWqxT8ZuUncKZf0GjrPh3csipVaFYzGJNPnX8
 7AqP9T3UMEheZty1jBCJ9SqeWmprSli7mPRNWR83i8or0wi96J2D+mxsaEKLpYaP3Dxw
 igXS6hh8AZ9d4muRU6XtxG0LUssh3216ry1UGYLEOHHyt/YOQdpCizijGLyIojN0KzAG
 YRYw==
X-Forwarded-Encrypted: i=1;
 AJvYcCX+t2D5EjsVp21zA9AFzc/3Cq6WP1y78RfN4PjNte6JAfhwYMhk7WFKTEIgluUnRnARcC2+bhYD@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzlU0CsigfEU4bX8e4wxWyNxISfb4VBgY80yt+X+7LLkXw21bH3
 aOGbwg2Rsf2OQ1MuSBZ2HZ4uaK2uRiMHtlyE4Txgz6RhmLKb8Poko8H8j+a1kVT1cIltuRTszlW
 VIA8=
X-Gm-Gg: ASbGncuwjh9KoGZzZaDiUwVMcCu2mcwYBDa46z4VXICwgXnotA2EyuuttgueW8Ti+zP
 GP4RB1ZGa4ZNRlkXVEc3xks6R7ZZj0I8soHf3t5hObgezBNRHwXsbSnki8q+YGoqGPWPKcU9cql
 zJy/JlhFGbKhw6hDR80dm8F+lBQhQqzO4GdOjI915mQ9omYiDre6KF68YIjz65mIvJnCz4EASzz
 qc82dCmguDhKiGFwguelgEz1ot33T3cCEYpLDldv69CNF+GVJbLNAjBwO1GhYwYOKxYSq2hCvHF
 iCLZKVthOARPk4vBEQAN6iBXtBP2SwD8QUfC
X-Google-Smtp-Source: AGHT+IEigSb029e59y379vL7vE1ceWNcVXZK8+VzyasTF/J25CUvyFgmDW7iv3a1fCJVEGa2Lq5l/w==
X-Received: by 2002:a05:651c:198f:b0:302:3261:8e33 with SMTP id
 38308e7fff4ca-30468517777mr152461131fa.4.1735927785612; 
 Fri, 03 Jan 2025 10:09:45 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-3045b083af8sm46855921fa.101.2025.01.03.10.09.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Jan 2025 10:09:45 -0800 (PST)
Date: Fri, 3 Jan 2025 20:09:42 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Abel Vesa <abel.vesa@linaro.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Karol Herbst <kherbst@redhat.com>, Lyude Paul <lyude@redhat.com>, 
 Danilo Krummrich <dakr@redhat.com>, Jani Nikula <jani.nikula@linux.intel.com>, 
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, 
 Tvrtko Ursulin <tursulin@ursulin.net>, Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Johan Hovold <johan@kernel.org>,
 dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, nouveau@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, 
 intel-xe@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, Imre Deak <imre.deak@intel.com>
Subject: Re: [PATCH v3 3/4] drm/i915/dp: Use the generic helper to control
 LTTPR transparent mode
Message-ID: <3p3wgzhtptjexplxrluod6sk36xeltpoh4hxg2yagssw7nh7hj@ikc4rssp6zej>
References: <20250103-drm-dp-msm-add-lttpr-transparent-mode-set-v3-0-5c367f4b0763@linaro.org>
 <20250103-drm-dp-msm-add-lttpr-transparent-mode-set-v3-3-5c367f4b0763@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250103-drm-dp-msm-add-lttpr-transparent-mode-set-v3-3-5c367f4b0763@linaro.org>
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

On Fri, Jan 03, 2025 at 02:58:17PM +0200, Abel Vesa wrote:
> LTTPRs operating modes are defined by the DisplayPort standard and the
> generic framework now provides a helper to switch between them, which
> is handling the explicit disabling of non-transparent mode and its
> disable->enable sequence mentioned in the DP Standard v2.0 section
> 3.6.6.1.
> 
> So use the new drm generic helper instead as it makes the code a bit
> cleaner.
> 
> Acked-by: Imre Deak <imre.deak@intel.com>
> Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
> ---
>  .../gpu/drm/i915/display/intel_dp_link_training.c  | 24 +++++-----------------
>  1 file changed, 5 insertions(+), 19 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/display/intel_dp_link_training.c b/drivers/gpu/drm/i915/display/intel_dp_link_training.c
> index 8b1977cfec503c70f07af716ee2c00e7605c6adf..c5bad311edf7b9a5cebb633b9e9692bae397f9ed 100644
> --- a/drivers/gpu/drm/i915/display/intel_dp_link_training.c
> +++ b/drivers/gpu/drm/i915/display/intel_dp_link_training.c
> @@ -119,9 +119,6 @@ intel_dp_set_lttpr_transparent_mode(struct intel_dp *intel_dp, bool enable)
>  	u8 val = enable ? DP_PHY_REPEATER_MODE_TRANSPARENT :
>  			  DP_PHY_REPEATER_MODE_NON_TRANSPARENT;
>  
> -	if (drm_dp_dpcd_write(&intel_dp->aux, DP_PHY_REPEATER_MODE, &val, 1) != 1)
> -		return false;
> -
>  	intel_dp->lttpr_common_caps[DP_PHY_REPEATER_MODE -
>  				    DP_LT_TUNABLE_PHY_REPEATER_FIELD_DATA_STRUCTURE_REV] = val;
>  
> @@ -146,6 +143,7 @@ static bool intel_dp_lttpr_transparent_mode_enabled(struct intel_dp *intel_dp)
>  static int intel_dp_init_lttpr_phys(struct intel_dp *intel_dp, const u8 dpcd[DP_RECEIVER_CAP_SIZE])
>  {
>  	int lttpr_count;
> +	int ret;
>  
>  	if (!intel_dp_read_lttpr_common_caps(intel_dp, dpcd))
>  		return 0;
> @@ -172,22 +170,8 @@ static int intel_dp_init_lttpr_phys(struct intel_dp *intel_dp, const u8 dpcd[DP_
>  		return lttpr_count;
>  	}
>  
> -	/*
> -	 * See DP Standard v2.0 3.6.6.1. about the explicit disabling of
> -	 * non-transparent mode and the disable->enable non-transparent mode
> -	 * sequence.
> -	 */
> -	intel_dp_set_lttpr_transparent_mode(intel_dp, true);
> -
> -	/*
> -	 * In case of unsupported number of LTTPRs or failing to switch to
> -	 * non-transparent mode fall-back to transparent link training mode,
> -	 * still taking into account any LTTPR common lane- rate/count limits.
> -	 */
> -	if (lttpr_count < 0)
> -		goto out_reset_lttpr_count;
> -
> -	if (!intel_dp_set_lttpr_transparent_mode(intel_dp, false)) {
> +	ret = drm_dp_lttpr_init(&intel_dp->aux, lttpr_count);
> +	if (ret) {
>  		lt_dbg(intel_dp, DP_PHY_DPRX,
>  		       "Switching to LTTPR non-transparent LT mode failed, fall-back to transparent mode\n");
>  
> @@ -196,6 +180,8 @@ static int intel_dp_init_lttpr_phys(struct intel_dp *intel_dp, const u8 dpcd[DP_
>  		goto out_reset_lttpr_count;
>  	}
>  
> +	intel_dp_set_lttpr_transparent_mode(intel_dp, false);
> +

I think the code now misses a way to update intel_dp->lttpr_common_caps
in a transparent-mode case:
intel_dp_set_lttpr_transparent_mode(intel_dp, true).

>  	return lttpr_count;
>  
>  out_reset_lttpr_count:
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry
