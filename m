Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 648D99ED571
	for <lists+nouveau@lfdr.de>; Wed, 11 Dec 2024 20:00:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8CD6610EBEB;
	Wed, 11 Dec 2024 19:00:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="ntsLPiz2";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com
 [IPv6:2a00:1450:4864:20::22b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1AA9810E624
 for <nouveau@lists.freedesktop.org>; Wed, 11 Dec 2024 19:00:38 +0000 (UTC)
Received: by mail-lj1-x22b.google.com with SMTP id
 38308e7fff4ca-3022c6155edso26869341fa.2
 for <nouveau@lists.freedesktop.org>; Wed, 11 Dec 2024 11:00:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1733943636; x=1734548436; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=3sm2j3frVX6XobbLx+2sssGo00nVIVVj/64ej0M6DaQ=;
 b=ntsLPiz2qV+/zq7ih968cyD6PacwCu+V6laCxWOiWfu1mAtBEPQ33+3uH4sFeBAN4s
 BCAl6tUYadvVieQo9iY7UZ9p2Da6/OAByCH3efRjYWcJrctu+YE2iGnRG3Opd19M3MDP
 qmh187BB/aZj1JUhYh5zw0FAJoQJyRUp3SJIi+E6TeziAoLTK29TXTaV5dnzX/uqx/Tk
 mryVIpfX0RodelV2gldvh/k6N74ePpob53VQs1HH0DtZiTAsWYxLQG1YxpBdbZTESRpE
 fSeZ3I1DIpqJGpd9uVpUf6asvliSO49yyFevnoSh5UEPuiE4Ogv2Y6s90tDwekWJMMr0
 Y9Cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733943636; x=1734548436;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=3sm2j3frVX6XobbLx+2sssGo00nVIVVj/64ej0M6DaQ=;
 b=GUGUaBacvJbozZ0LR1KJMSmi5bSTCuFIOaDQ5Ddwp7dJVA2zc/0z4t9qZOH72RQWyR
 7BVHKHhyGLujl8vmaUwLFqTo2TmgaXOuKIWS5oNTepk9vIIk6Yhj30T+Xe4KX6wgkxT8
 IoEfd/BnpxMiE7yLwuRvki2JkMCd/K1S2wIruXzRLRGb9C0vuT0AjsDRccQBwG9Mkqup
 u4UOGykNuftTqDZjL+YvUo8xgflor2HSYzN8eVVPKlFI7AwrQf0rPXqn3LdGicNnnpog
 a8kE2ex1K/bdK/D9/CrAy9d8cYFsT+cycWXZvTsWqnBiP8pB/L01CV/6SEExQfBJ7MEq
 RWkw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWUIcPVdD/WbtYePSwbGe9k2oocdhk3kRiPnz3ZOErWrmp45vs7D8fkiK+4r7M6vf7gVGiCa/VY@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yytal4GFxi5agV2aqbzlxQ6c1XsTDWAt+fQSpiXyE7TO/ecUWxN
 CxOhzLPWXT9Wke385g4iymlXxGLmty7AGFPtoXwouqXX7HZo1HrlygIWMyqAg/A=
X-Gm-Gg: ASbGnctHcBfRyqk6fS98I70Ocag+EBEHNz+rg/w3ZNOKo5eoxBRlGzZW/TXLfdRO5j5
 qSIKDwEqEq6xd8SWRXR0UZ/UHRx3GMwG2/GgG+wLviFaIdwIqgQd2BQ1c7I+Wn32xRCAN3tuYqr
 qAHS3GuVOtnl/36yPNTKhEPf1V8H6dhhPYt88SYcELTeXuFCk579FeWaIcZVZMh9Rktx/w6HqYv
 tGB7XXC2NMW61u7RQPyDCjVfwRttQfjZC59KWZzjsTHIdP2GDOxcg7kfXW/KEEQ5w3QiOuxYerk
 XzTuQVIaY8T4qzMy1vNM+lOhwe9MhTzj3w==
X-Google-Smtp-Source: AGHT+IGsgdXAdVI72VjehBhRAGYyQYi2ZlWZ5S+RtIUjGgQQsMEhY9vE/LoWlhZJn7MQjhDvpgk8fA==
X-Received: by 2002:a2e:bea2:0:b0:302:2620:ecc7 with SMTP id
 38308e7fff4ca-30249e89ee5mr1842641fa.35.1733943636318; 
 Wed, 11 Dec 2024 11:00:36 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-302292959c0sm8657671fa.94.2024.12.11.11.00.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Dec 2024 11:00:34 -0800 (PST)
Date: Wed, 11 Dec 2024 21:00:31 +0200
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
Message-ID: <qh5ochh2cjqj76qqbbj7e2jmyie6pbnvgcr5wti5eigc4qxjod@v5tov4s65sdb>
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

Indeed. It got me a while to check that drm_dp_dpcd_writeb() ->
drm_dp_mst_dpcd_write() -> drm_dp_send_dpcd_write() ->
drm_dp_mst_wait_tx_reply() never returns '0'. I'd prefer an explicit

if (ret < 0)
	return ret;
return (ret == 1) ? 0 : -EIO;

> 
> > +}
> > +EXPORT_SYMBOL(drm_dp_lttpr_set_transparent_mode);
> 

-- 
With best wishes
Dmitry
