Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F28CCA05D02
	for <lists+nouveau@lfdr.de>; Wed,  8 Jan 2025 14:40:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB46910E2A8;
	Wed,  8 Jan 2025 13:40:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="WBKTdqQx";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com
 [209.85.167.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE49B10EBD0
 for <nouveau@lists.freedesktop.org>; Wed,  8 Jan 2025 13:40:08 +0000 (UTC)
Received: by mail-lf1-f45.google.com with SMTP id
 2adb3069b0e04-5401c52000dso18336574e87.3
 for <nouveau@lists.freedesktop.org>; Wed, 08 Jan 2025 05:40:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1736343547; x=1736948347; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=DRFucKupJRi3JrfmGRRAwshOALuZUCh2srHJV4yPz/M=;
 b=WBKTdqQxXmjCuTi3wvEmVmVQErvAaOyDO6VjVh+kDg5wn/Rbn4h3XNaspPaQ+Uik6a
 w7O1kgvt5FnjHYMixX/7dzHkXU6FBkrbTo35YWaittUZi0sx542pWn4r95xXtrlBbR2F
 Z423DCaMvRb4YzCPDC1GJ91I9oKi/4wDRnsgwDjA/tj5E/K36gd1nJTaidBc0kk2dmvj
 GDCDcjnl3o7WZZM3UO/A0YhI2ESYA03BW5Ov+yp5gd2MXR5W1Us+0nZzDgF79r13oLAw
 E72n/55GnixAsjAuVoKXd6RcOE0T0Hgsyru6s15PnjwdMjvS6/0nmkIhHGTB8U7E1Fd6
 r5cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736343547; x=1736948347;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=DRFucKupJRi3JrfmGRRAwshOALuZUCh2srHJV4yPz/M=;
 b=H7m4vQu5An4kD59dUN42qQ2FkPj4NoNshUy3gocjKV4TI+p3zC8lSteuop6vepLX6A
 d7+lwTtknstl9f3sA7uZlFbNaQSQJ0qDXtNqOBhxhoRanUO92Td8XjqvFNmaJNGNBwj7
 kr13VSQjbDYvUQr7i0ldHuCo3/yzt1x3djyjOaNvrz8hPmib6nSuMwTzZq4wihBCagrL
 9getPXWorBtOi6b6+jrYidMW6jrypg7F35RmcDbvCgn3YpS6P+wEdYg1L36sZ3N+M9iN
 oboZxg2lvBcuYmRoQYo0FF+DEHwltSX6dggI+9NropYNzKAsg8BZf0OlebzFebC1puCp
 OsPQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCW9IlDJDA8KL5EjGo2NbGzVnIyLapeoEISzwvfWsIf0RnNBhSiYPNwtCD7hYKuhJbuCAmXZReoB@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxxYeYirzQIC6AZpUM4aTddPfqBk+28gpehTRwLCgIfDeWdgPNm
 fvUXlAUK9mV8VoRE3RDCuemKKuLw7G3kkEdFwZiez1eji+WnYISA/6NzOSiZCnTUN1ZsXVj7vBX
 X
X-Gm-Gg: ASbGncvTb7KatZ6JslWNfohGibyoJlCmwGZHxtwKu9JGfAPJdrwT5J1iz96m5ASgEJ8
 3Vnzn/I91BwOUsk8hgidJz+D5F3472wREhvub+eBMtViXtuA7hzJKPHNqICRf+oJhZ9dpxFNIoL
 TfLKyGo9vJf1m5FirJMIv3IZMjuqaYri3sn7DTmfD4DDIvWpbqoGGvpQ4wCI/cS9kPHQaFDjtf+
 mtFp2Qnr0ibC2lx3oyngt3R418mdyE4xRJP+eNqEqfedUSJFAgTnAhj5AFRCMZNWHUMy9+vN8RM
 tdXGA9iK2OTZkX6j7NizlVVuY+YTjnMnZVZB
X-Google-Smtp-Source: AGHT+IH+8M6pwb6Rkal5Oy3icsCCUmDzxSkXtYlmI/444nM3KABxABMYN+TTayrP+FqimK/xSMwSqw==
X-Received: by 2002:a05:6512:acf:b0:542:63a8:3939 with SMTP id
 2adb3069b0e04-542845a6f01mr769532e87.8.1736341913844; 
 Wed, 08 Jan 2025 05:11:53 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-542238301efsm5581695e87.247.2025.01.08.05.11.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Jan 2025 05:11:52 -0800 (PST)
Date: Wed, 8 Jan 2025 15:11:50 +0200
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
Message-ID: <enzj72vy523bvlphbygxn42zocvhx24eghreffzrthomhy5jxo@2l4h345h7ojl>
References: <20250103-drm-dp-msm-add-lttpr-transparent-mode-set-v3-0-5c367f4b0763@linaro.org>
 <20250103-drm-dp-msm-add-lttpr-transparent-mode-set-v3-3-5c367f4b0763@linaro.org>
 <3p3wgzhtptjexplxrluod6sk36xeltpoh4hxg2yagssw7nh7hj@ikc4rssp6zej>
 <Z3vQfIIDDgnFJsDn@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z3vQfIIDDgnFJsDn@linaro.org>
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

On Mon, Jan 06, 2025 at 02:45:48PM +0200, Abel Vesa wrote:
> On 25-01-03 20:09:42, Dmitry Baryshkov wrote:
> > On Fri, Jan 03, 2025 at 02:58:17PM +0200, Abel Vesa wrote:
> > > LTTPRs operating modes are defined by the DisplayPort standard and the
> > > generic framework now provides a helper to switch between them, which
> > > is handling the explicit disabling of non-transparent mode and its
> > > disable->enable sequence mentioned in the DP Standard v2.0 section
> > > 3.6.6.1.
> > > 
> > > So use the new drm generic helper instead as it makes the code a bit
> > > cleaner.
> > > 
> > > Acked-by: Imre Deak <imre.deak@intel.com>
> > > Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
> > > ---
> > >  .../gpu/drm/i915/display/intel_dp_link_training.c  | 24 +++++-----------------
> > >  1 file changed, 5 insertions(+), 19 deletions(-)
> > > 
> > > diff --git a/drivers/gpu/drm/i915/display/intel_dp_link_training.c b/drivers/gpu/drm/i915/display/intel_dp_link_training.c
> > > index 8b1977cfec503c70f07af716ee2c00e7605c6adf..c5bad311edf7b9a5cebb633b9e9692bae397f9ed 100644
> > > --- a/drivers/gpu/drm/i915/display/intel_dp_link_training.c
> > > +++ b/drivers/gpu/drm/i915/display/intel_dp_link_training.c
> > > @@ -119,9 +119,6 @@ intel_dp_set_lttpr_transparent_mode(struct intel_dp *intel_dp, bool enable)
> > >  	u8 val = enable ? DP_PHY_REPEATER_MODE_TRANSPARENT :
> > >  			  DP_PHY_REPEATER_MODE_NON_TRANSPARENT;
> > >  
> > > -	if (drm_dp_dpcd_write(&intel_dp->aux, DP_PHY_REPEATER_MODE, &val, 1) != 1)
> > > -		return false;
> > > -
> > >  	intel_dp->lttpr_common_caps[DP_PHY_REPEATER_MODE -
> > >  				    DP_LT_TUNABLE_PHY_REPEATER_FIELD_DATA_STRUCTURE_REV] = val;
> > >  
> > > @@ -146,6 +143,7 @@ static bool intel_dp_lttpr_transparent_mode_enabled(struct intel_dp *intel_dp)
> > >  static int intel_dp_init_lttpr_phys(struct intel_dp *intel_dp, const u8 dpcd[DP_RECEIVER_CAP_SIZE])
> > >  {
> > >  	int lttpr_count;
> > > +	int ret;
> > >  
> > >  	if (!intel_dp_read_lttpr_common_caps(intel_dp, dpcd))
> > >  		return 0;
> > > @@ -172,22 +170,8 @@ static int intel_dp_init_lttpr_phys(struct intel_dp *intel_dp, const u8 dpcd[DP_
> > >  		return lttpr_count;
> > >  	}
> > >  
> > > -	/*
> > > -	 * See DP Standard v2.0 3.6.6.1. about the explicit disabling of
> > > -	 * non-transparent mode and the disable->enable non-transparent mode
> > > -	 * sequence.
> > > -	 */
> > > -	intel_dp_set_lttpr_transparent_mode(intel_dp, true);
> > > -
> > > -	/*
> > > -	 * In case of unsupported number of LTTPRs or failing to switch to
> > > -	 * non-transparent mode fall-back to transparent link training mode,
> > > -	 * still taking into account any LTTPR common lane- rate/count limits.
> > > -	 */
> > > -	if (lttpr_count < 0)
> > > -		goto out_reset_lttpr_count;
> > > -
> > > -	if (!intel_dp_set_lttpr_transparent_mode(intel_dp, false)) {
> > > +	ret = drm_dp_lttpr_init(&intel_dp->aux, lttpr_count);
> > > +	if (ret) {
> > >  		lt_dbg(intel_dp, DP_PHY_DPRX,
> > >  		       "Switching to LTTPR non-transparent LT mode failed, fall-back to transparent mode\n");
> > >  
> > > @@ -196,6 +180,8 @@ static int intel_dp_init_lttpr_phys(struct intel_dp *intel_dp, const u8 dpcd[DP_
> > >  		goto out_reset_lttpr_count;
> > >  	}
> > >  
> > > +	intel_dp_set_lttpr_transparent_mode(intel_dp, false);
> > > +
> > 
> > I think the code now misses a way to update intel_dp->lttpr_common_caps
> > in a transparent-mode case:
> > intel_dp_set_lttpr_transparent_mode(intel_dp, true).
> 
> It is being called if the drm_dp_lttpr_init() returns a non-zero value,
> but that is not part of the diff here.

Ack, thanks for the explanation. I'd suggest mentioning that in the
commit message.

> 
> > 
> > >  	return lttpr_count;
> > >  
> > >  out_reset_lttpr_count:
> > > 
> > > -- 
> > > 2.34.1
> > > 
> > 
> > -- 
> > With best wishes
> > Dmitry

-- 
With best wishes
Dmitry
