Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 936F7A05E10
	for <lists+nouveau@lfdr.de>; Wed,  8 Jan 2025 15:10:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A24DD10E8B7;
	Wed,  8 Jan 2025 14:10:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="uASbxT/J";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com
 [209.85.167.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 38B6710E8B7
 for <nouveau@lists.freedesktop.org>; Wed,  8 Jan 2025 14:10:01 +0000 (UTC)
Received: by mail-lf1-f45.google.com with SMTP id
 2adb3069b0e04-54026562221so17823329e87.1
 for <nouveau@lists.freedesktop.org>; Wed, 08 Jan 2025 06:10:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1736345339; x=1736950139; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=go7fn8G/ymJBJOoBu9CCL9fg2QtY/C41teH6UPJDvwo=;
 b=uASbxT/JyhiU2ZC0iWzjd2al/dd9NygsxMIuYkuaXeTkXmZx/gR6EJ0qsRzAX7ipfy
 CT0Vy/qMoycHOESHM8glnMsyGL6qtbP2VszNoYWmf6lwa/XHShQ2u+A1Tr83gLedZx71
 2yq/mcuS3ExgF9vMAXR+IBiILhtv7xuzXpzt3XICHMlvuGbd/xqq9xLjSiPLIbPkE+O4
 1eg16eEj+626v0KRdnD46NXc8/+wVGzWeFgYlYotl2JIuJ1JfpgA+Xt3+CmeOhZiamIL
 xrfsWksTbPu6sJw7F++IlPUIIdxn6P2tiS9b61Z49qZ5NuMtnT1UtOs3xftkELsUkkMb
 BWVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736345339; x=1736950139;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=go7fn8G/ymJBJOoBu9CCL9fg2QtY/C41teH6UPJDvwo=;
 b=plF+CJicJitktI4+ZngCpNtu6jcMbvF0tHgsp48zQ/Xa0ImDMOeHW5wpmg6zqnMDzO
 ou90U8O7mzoVXDEv7C97HDLXNffIrUl6tpGX1GAc5thbG0evt4XUE666axSLlVaJxKap
 AcdXKDSjwrYKRaBFDguA51N2AIFzkfLmY5PzjHYWPR4EKpyfGIdpc3uRFLmVaXqwfKFy
 DiCdyBzfgBbFviTAU7IGPOTslOViK8JCGuC8PY9rlHfvB0mL+b7FlFXqENzb92a4wZMb
 ko2i8KL+oDFmVXTWEDP7OqX8m19uuGLTHgJYc0dSsd2PH66GB8hlyphqX1hQDNmJGAkZ
 QjNg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXB8XNnIrW3I/Vez0vMnprpgOuMS3NrjQR1LbIXR1WQReh6ayKIBMfEV9rL2Jb2s6UgD6G26zqW@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxfNf9+sA0U+25BRD95aEv5Pbd2B0XpfW/flv9FuQ9eoomQIAa6
 R8jDVhdQit7htTWxtbnBFeLTpNlWQF7E713JoKPcCymqK4RXsZtYrvUBPu03KtchFMauWNYpsfd
 0
X-Gm-Gg: ASbGncstUqNbIxj+3DLHgoQafwmFlS5UUwoezZgpsLMOJA/TQPnB+5ERto8mGNMrBg+
 6OoWizjvFeTIPPJMr03DzwD7jlI+vfDdRBMlcZgp6U7BURHb8PZuIzIc0NKNc4MTQHbw39GA+bg
 ym/TpEO+UWKrxUKMMwOcVKpF8df4GuLQLllC/4lKz1Gz15sYfyLl2mqzeCvNl/Dj2p8BcMhR/G+
 ryWolhefTGd0bJ428/hGIuUhRopuntHRVNo0SjjB4Qc1qo6gmsGSxI=
X-Google-Smtp-Source: AGHT+IHuzod8aMhCQ+n6NVLGNnPNVKNs6REXYs0yamrClbVZfZoa7djflMAszxH2qhTaAW4scrTx/w==
X-Received: by 2002:a5d:64ed:0:b0:385:e303:8dd8 with SMTP id
 ffacd0b85a97d-38a872e8b18mr2604012f8f.26.1736342197530; 
 Wed, 08 Jan 2025 05:16:37 -0800 (PST)
Received: from linaro.org ([86.121.162.10]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38a1c832c45sm52417065f8f.32.2025.01.08.05.16.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Jan 2025 05:16:37 -0800 (PST)
Date: Wed, 8 Jan 2025 15:16:29 +0200
From: Abel Vesa <abel.vesa@linaro.org>
To: Johan Hovold <johan@kernel.org>
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
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 nouveau@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, Johan Hovold <johan+linaro@kernel.org>
Subject: Re: [PATCH v3 1/4] drm/dp: Add helper to set LTTPRs in transparent
 mode
Message-ID: <Z356ra0IDQ4SMbfN@linaro.org>
References: <20250103-drm-dp-msm-add-lttpr-transparent-mode-set-v3-0-5c367f4b0763@linaro.org>
 <20250103-drm-dp-msm-add-lttpr-transparent-mode-set-v3-1-5c367f4b0763@linaro.org>
 <Z3z0NcDhmwOoQhlG@hovoldconsulting.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z3z0NcDhmwOoQhlG@hovoldconsulting.com>
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

On 25-01-07 10:30:29, Johan Hovold wrote:
> On Fri, Jan 03, 2025 at 02:58:15PM +0200, Abel Vesa wrote:
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
> > Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
> 
> > +/**
> > + * drm_dp_lttpr_init - init LTTPR transparency mode according to DP standard
> > + *
> > + * @aux: DisplayPort AUX channel
> > + * @lttpr_count: Number of LTTPRs. Between 0 and 8, according to DP standard.
> > + *               Negative error code for any non-valid number.
> > + *               See drm_dp_lttpr_count().
> > + *
> > + * Returns 0 on success or a negative error code on failure.
> > + */
> > +int drm_dp_lttpr_init(struct drm_dp_aux *aux, int lttpr_count)
> > +{
> > +	int ret;
> > +
> > +	if (!lttpr_count)
> > +		return 0;
> > +
> > +	/*
> > +	 * See DP Standard v2.0 3.6.6.1 about the explicit disabling of
> > +	 * non-transparent mode and the disable->enable non-transparent mode
> > +	 * sequence.
> > +	 */
> > +	ret = drm_dp_lttpr_set_transparent_mode(aux, true);
> > +	if (ret)
> > +		return ret;
> > +
> > +	if (lttpr_count < 0)
> > +		return -ENODEV;
> > +
> > +	/*
> > +	 * Roll-back to tranparent mode if setting non-tranparent mode failed
> 
> typo: transparent (2x)

Will fix.

> 
> > +	 */
> 
> I think this comment now needs to go inside the conditional, if you want
> to keep it at all.

Yes, will move it.

> 
> > +	if (drm_dp_lttpr_set_transparent_mode(aux, false)) {
> > +		drm_dp_lttpr_set_transparent_mode(aux, true);
> > +		return -EINVAL;
> > +	}
> > +
> > +	return 0;
> > +}
> > +EXPORT_SYMBOL(drm_dp_lttpr_init);
> 
> This looks much better to me now, so with the above addressed: 
> 
> Reviewed-by: Johan Hovold <johan+linaro@kernel.org>

Thanks for reviewing!

Abel

