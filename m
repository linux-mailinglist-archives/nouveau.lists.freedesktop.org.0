Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D84B69ED4BE
	for <lists+nouveau@lfdr.de>; Wed, 11 Dec 2024 19:33:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 047CC10EBEA;
	Wed, 11 Dec 2024 18:32:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="MRlBdk87";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com
 [209.85.167.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D03410EBE8
 for <nouveau@lists.freedesktop.org>; Wed, 11 Dec 2024 18:32:56 +0000 (UTC)
Received: by mail-lf1-f50.google.com with SMTP id
 2adb3069b0e04-53e28cf55cdso5457090e87.3
 for <nouveau@lists.freedesktop.org>; Wed, 11 Dec 2024 10:32:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1733941974; x=1734546774; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=qwjqsNH/3nF2Q3XbWudExYhlk4EBq4Q9BHCqHdvdEaI=;
 b=MRlBdk87yd5XRun6HxduAb3YdKzkUfpEMA9bIt/QJ+Kq4nAMlDgErn1RoQ6Q35yOQn
 TEWHGFQHtrGuu/dYCiAl+WSTATsibcyCpwOZnm163/j8tW9QUjvEPVhUu6tIzB59rqjm
 AcxLRhyGdmFpUhguwsbDd96u2RfhH1VyyUkDkB8mKJIFsnVnAq1ADZsxzzcDf9eM6tIX
 nb/W4apOT4tVBW3WbeVpvx77ky1vcCGddv9jewJSsfIXKjWweeJ9YDu644P8be6Rk1Lm
 Gde/cQI8Dn64FVHT3ZK9Y7uX8C8h7YXSb+Cd1wignrUFXbBLPBF15Qoi+B+8ggKL1GO5
 455g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733941974; x=1734546774;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=qwjqsNH/3nF2Q3XbWudExYhlk4EBq4Q9BHCqHdvdEaI=;
 b=a9VAKnsNjGfbaAxeZ4JD3yDBT0SP+7Extvmj7+90yEmY9vVPo6RbMV/+ALGzvvgK/Z
 JYrt0tk6q9EOxetqqS/AKDqExsWCOlNsrAXwD78a3X7E8IFd8uimIdbaSpMXDMksmlMS
 mHrA6JxHlfI5VPPzzLkPDaTN92KwhVr3Q2ugzxhlZfPQS4pmzg1pbE2wijWNqmkh75EA
 XyRZXSkm1HOgDFiYXspIlR/9gALIKdo/xLr3gfQNGppbEsFqYcwKOx9r65g0uhcYaIuA
 WXwl3M9EjzqclRdCKrOcXMUKENDHfC97vHG/qPe8XPwLQVIs+x/k6wOVdyqseO25fyTj
 ezVA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUOGZ0vl08NRLmZZmfBOhImorAp3seVsWsKeBcNLNsWfHZHyUOr4p9aqMJ5NBynqLuPP8ZqDANJ@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxB26NkqtEYqrpti8xAerKKFW9Kho1UGz0FCg9dPR08rI7Iadao
 OUJ6BWdK8RlCsRa2VV7gAD2FBxHjKdC36jX07MYaG7e0AYoxuLh5+BtuRbT6CRk=
X-Gm-Gg: ASbGncsn+85+/I43bQXZ7rZthrg5AvV6IBWI2PIDpOZLWvzyZforrR+KlLgMgu+/xx0
 CvXm5yiKxYn51xQVhIsEQSzG7zcnFWQjLIRH4+uPwUz4r7PACXp5jt3MSNMm2sHBNxhJIaRdR8m
 zdM0luHhUeiEEZ7iplYXcxhtOGz/4XuSdIQkCuAjEx03jYwvjgWCGzwwMWsvP3BTLFmP3J7Z3KD
 xIATlh/ONuCP3fOZM+jQzL9TNcgKWXYzHvHbNkiBsctC2uBrqDL2mX5ZNjpBkgLley8auwKmmHd
 RMWqxW906ZDSOXHU0WLSNQjyjMxB9uATOw==
X-Google-Smtp-Source: AGHT+IFmZdkDf94Jsx8fCrALITW/9iPuUY5e7Ad8TDSKUOMmNblYCFB7l7IPRhIdF6tMpVRDpdpenQ==
X-Received: by 2002:a05:6512:1329:b0:540:1dac:c03d with SMTP id
 2adb3069b0e04-5402f04d0ffmr331050e87.57.1733941974289; 
 Wed, 11 Dec 2024 10:32:54 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5401d2aab5csm1134637e87.168.2024.12.11.10.32.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Dec 2024 10:32:52 -0800 (PST)
Date: Wed, 11 Dec 2024 20:32:51 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Johan Hovold <johan@kernel.org>
Cc: Abel Vesa <abel.vesa@linaro.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Karol Herbst <kherbst@redhat.com>,
 Lyude Paul <lyude@redhat.com>, 
 Danilo Krummrich <dakr@redhat.com>, Jani Nikula <jani.nikula@linux.intel.com>, 
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, 
 Tvrtko Ursulin <tursulin@ursulin.net>, Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, 
 nouveau@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, 
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org
Subject: Re: [PATCH v2 1/4] drm/dp: Add helper to set LTTPRs in transparent
 mode
Message-ID: <3omcjrgfkdmw466ok7gej2jge25vtwzaiycwz2xgejwppyvkza@rhssgk7xz4hj>
References: <20241211-drm-dp-msm-add-lttpr-transparent-mode-set-v2-0-d5906ed38b28@linaro.org>
 <20241211-drm-dp-msm-add-lttpr-transparent-mode-set-v2-1-d5906ed38b28@linaro.org>
 <Z1mk08SHEd5_vc99@hovoldconsulting.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z1mk08SHEd5_vc99@hovoldconsulting.com>
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

On Wed, Dec 11, 2024 at 03:42:27PM +0100, Johan Hovold wrote:
> On Wed, Dec 11, 2024 at 03:04:12PM +0200, Abel Vesa wrote:
>  
> > +/**
> > + * drm_dp_lttpr_set_transparent_mode - set the LTTPR in transparent mode
> > + * @aux: DisplayPort AUX channel
> > + * @enable: Enable or disable transparent mode
> > + *
> > + * Returns 0 on success or a negative error code on failure.
> > + */
> > +int drm_dp_lttpr_set_transparent_mode(struct drm_dp_aux *aux, bool enable)
> > +{
> > +	u8 val = enable ? DP_PHY_REPEATER_MODE_TRANSPARENT :
> > +			  DP_PHY_REPEATER_MODE_NON_TRANSPARENT;
> > +	int ret = drm_dp_dpcd_writeb(aux, DP_PHY_REPEATER_MODE, val);
> > +
> > +	return ret == 1 ? 0 : ret;
> 
> This looks correct, but I had to go look at drm_dp_dpcd_writeb() to make
> sure it never returns 0 (for short transfers).
> 
> > +}
> > +EXPORT_SYMBOL(drm_dp_lttpr_set_transparent_mode);
> 
> This appears to be what the driver currently uses, but why not
> EXPORT_SYMBOL_GPL?

$ git grep EXPORT_SYMBOL drivers/gpu/drm/*.c | wc -l
962
$ git grep EXPORT_SYMBOL_GPL drivers/gpu/drm/*.c | wc -l
93


-- 
With best wishes
Dmitry
