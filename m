Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DEA44A0756A
	for <lists+nouveau@lfdr.de>; Thu,  9 Jan 2025 13:14:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 974B610ED81;
	Thu,  9 Jan 2025 12:14:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="B5Ear+Jh";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A0CC10ED89
 for <nouveau@lists.freedesktop.org>; Thu,  9 Jan 2025 12:14:25 +0000 (UTC)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-4363ae65100so9371315e9.0
 for <nouveau@lists.freedesktop.org>; Thu, 09 Jan 2025 04:14:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1736424864; x=1737029664; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=Qgi4e6BoGIUkq88BVzT7YBbI2Ar0NhYklw/AGMjsAlg=;
 b=B5Ear+JhPAVnF0evzlI3EQqzkt7dmuahMHwTSYE4mWta/F7T6iRE5RV7hp8pxQKhLX
 aoBWPCC+ndsTTQZ2/tiV8DXvNZTeES+atiSoc5XKtm83YcyzUPZMtkpkoCoZb1/+8v5+
 WC0LTNd8fg+PHZaPKxOMrYxv35LRs3FN2ltpYvgoGW6tWV6AWiyCBpE7GbxtszMdNzxg
 tHBPUoXAzuaJjOXOFiHiNABaY0CEGs4jBg1yk5xXDXT73tIyD+/PGiJr/6WX9izgDC1p
 /HRnLk0qSTogsgDlolVsmOPRHXNy4IsYxvVSGIhZ2vTIKRjxvg6tdumz74EqpTVwVGkF
 nkag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736424864; x=1737029664;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Qgi4e6BoGIUkq88BVzT7YBbI2Ar0NhYklw/AGMjsAlg=;
 b=Ct3K+T6y7CYUs4IK5RHtH+DGxJ0lkB5GXKOOd4IvnQAfD8qr3kCXyq8iq8t0lfXlm7
 +Jea/9oss99x5lrW9IZbpdrBokQ4kf/8IPlr36XqbyqTsQEiu0znMoDb3dWFVhzpVAMz
 QRH1AGV3pF4YihrfyY1q+iDMcv6P1WSHwjIjP6feDEWQ3a06jjwdOdBP/2d0tNX7sWDp
 f54V436om3ifknqGCZrD+uEQwgOsWJkbb1IZ6b2JzlSB6r59AS7h9GdnZsqDNyDl0OiT
 XzHqTgE/a1BFvDLLiRFnyA88IZsCptfNGINDNRfuVbRpnKRFhiEO0Q8kVIflN48bv3QR
 haNQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCU2CV+wdiAsLDcfxPuU3hH+apAS8zjnVGiCMjMSPKqDCOiOEkWQkgQt5oTWyZiOC9sHvYYXmHU3@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzgxZwqnB+xTjBRw/6P86kxGvN1xZTMLyzH8W8/YkaArsEij4Z4
 5F7jSOl8ACG9buhsw73czt4f/y+mBZTBZlNoTRNUlzeUzx1v+ltfS64UBmU0TXI=
X-Gm-Gg: ASbGncuGeks5bgaY1PSMhjpkYkndhyz614q84PN2+OqDJbUAlRYwxeB3O36oDP5dcYv
 nOtLH/R9PSJTdfxVcdI7bDxhNm4/Rmh8CXj8Bvz9XWdv65p70ufJm1VEpsRWRGxIy75KXAxt4Cz
 dbJ3XwT4Ty6sKwwJu2Qr3OUstShfhhnqkfDR0wjC6pd3Aoeec8ljCwlM2nIMW5Y+mJozhDOXC2Q
 BQLNVdMQ/wDuGXJH5P+3UUGwZOL1gdFCSw41VX8VWwq0m/bfmwqYco=
X-Google-Smtp-Source: AGHT+IFZfJfwssLNpBYM5MjiXFRSaZImZ4dWDIr4RYjQoPZfimRRPYITmNGGjTmVo8KU+9ieJp1Ivg==
X-Received: by 2002:a05:600c:6b6f:b0:436:e86e:e4ab with SMTP id
 5b1f17b1804b1-436e86ee529mr33625975e9.30.1736424863901; 
 Thu, 09 Jan 2025 04:14:23 -0800 (PST)
Received: from linaro.org ([86.121.162.10]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-436e2da6401sm53853955e9.2.2025.01.09.04.14.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Jan 2025 04:14:23 -0800 (PST)
Date: Thu, 9 Jan 2025 14:14:21 +0200
From: Abel Vesa <abel.vesa@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Karol Herbst <kherbst@redhat.com>, Lyude Paul <lyude@redhat.com>,
 Danilo Krummrich <dakr@redhat.com>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>, Rob Clark <robdclark@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Johan Hovold <johan@kernel.org>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, nouveau@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 Johan Hovold <johan+linaro@kernel.org>
Subject: Re: [PATCH v4 1/4] drm/dp: Add helper to set LTTPRs in transparent
 mode
Message-ID: <Z3+9nUwDyyYkB2Jl@linaro.org>
References: <20250108-drm-dp-msm-add-lttpr-transparent-mode-set-v4-0-918949bc2e3a@linaro.org>
 <20250108-drm-dp-msm-add-lttpr-transparent-mode-set-v4-1-918949bc2e3a@linaro.org>
 <b4z2o4sgyjyh7wqbybtifi5evhh7b3tgfujson6l5ajmjdwt3f@x2xz6iod54vz>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b4z2o4sgyjyh7wqbybtifi5evhh7b3tgfujson6l5ajmjdwt3f@x2xz6iod54vz>
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

On 25-01-08 16:17:47, Bjorn Andersson wrote:
> On Wed, Jan 08, 2025 at 04:31:43PM +0200, Abel Vesa wrote:
> > According to the DisplayPort standard, LTTPRs have two operating
> > modes:
> >  - non-transparent - it replies to DPCD LTTPR field specific AUX
> >    requests, while passes through all other AUX requests
> >  - transparent - it passes through all AUX requests.
> > 
> > Switching between this two modes is done by the DPTX by issuing
> > an AUX write to the DPCD PHY_REPEATER_MODE register.
> > 
> > Add a generic helper that allows switching between these modes.
> > 
> > Also add a generic wrapper for the helper that handles the explicit
> > disabling of non-transparent mode and its disable->enable sequence
> > mentioned in the DP Standard v2.0 section 3.6.6.1. Do this in order
> > to move this handling out of the vendor specific driver implementation
> > into the generic framework.
> > 
> > Tested-by: Johan Hovold <johan+linaro@kernel.org>
> > Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > Reviewed-by: Johan Hovold <johan+linaro@kernel.org>
> > Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
> > ---
> >  drivers/gpu/drm/display/drm_dp_helper.c | 62 +++++++++++++++++++++++++++++++++
> >  include/drm/display/drm_dp_helper.h     |  2 ++
> >  2 files changed, 64 insertions(+)
> > 
> > diff --git a/drivers/gpu/drm/display/drm_dp_helper.c b/drivers/gpu/drm/display/drm_dp_helper.c
> > index da3c8521a7fa7d3c9761377363cdd4b44ab1106e..fa7eff94d408718a1762834597f0cd51376d2596 100644
> > --- a/drivers/gpu/drm/display/drm_dp_helper.c
> > +++ b/drivers/gpu/drm/display/drm_dp_helper.c
> > @@ -2817,6 +2817,68 @@ int drm_dp_lttpr_max_link_rate(const u8 caps[DP_LTTPR_COMMON_CAP_SIZE])
> >  }
> >  EXPORT_SYMBOL(drm_dp_lttpr_max_link_rate);
> >  
> > +/**
> > + * drm_dp_lttpr_set_transparent_mode - set the LTTPR in transparent mode
> 
> kernel-doc functions should have () suffix

Yes, will add.

> 
> > + * @aux: DisplayPort AUX channel
> > + * @enable: Enable or disable transparent mode
> > + *
> > + * Returns 0 on success or a negative error code on failure.
> 
> And this should be "Return: ...".

Will fix as well.

> 
> > + */
> > +int drm_dp_lttpr_set_transparent_mode(struct drm_dp_aux *aux, bool enable)
> > +{
> > +	u8 val = enable ? DP_PHY_REPEATER_MODE_TRANSPARENT :
> > +			  DP_PHY_REPEATER_MODE_NON_TRANSPARENT;
> > +	int ret = drm_dp_dpcd_writeb(aux, DP_PHY_REPEATER_MODE, val);
> > +
> > +	if (ret < 0)
> > +		return ret;
> > +
> > +	return (ret == 1) ? 0 : -EIO;
> > +}
> > +EXPORT_SYMBOL(drm_dp_lttpr_set_transparent_mode);
> > +
> > +/**
> > + * drm_dp_lttpr_init - init LTTPR transparency mode according to DP standard
> > + *
> 
> Documentation also explicitly says not to leave a blank line here...

Will drop the blank line.

> 
> Regards,
> Bjorn
> 

Thanks for reviewing!

Abel
