Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F133A00D5F
	for <lists+nouveau@lfdr.de>; Fri,  3 Jan 2025 19:07:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD60110E90D;
	Fri,  3 Jan 2025 18:07:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="mCOksrf7";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com
 [209.85.167.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C49BA10E90F
 for <nouveau@lists.freedesktop.org>; Fri,  3 Jan 2025 18:07:32 +0000 (UTC)
Received: by mail-lf1-f51.google.com with SMTP id
 2adb3069b0e04-5401c52000fso12740463e87.2
 for <nouveau@lists.freedesktop.org>; Fri, 03 Jan 2025 10:07:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1735927591; x=1736532391; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=155ezFoO+4fVmuNy4GZMEsWBNEAzYP4vCAeZ5fjCchw=;
 b=mCOksrf7UMtQqgFZSPorSDGEl5/xZUAJxRvXmWaIbZnfR13BTF3hkmgw4Re3kTIaxf
 LBLsSLJZVGH0i985ajleS5XubvRiAMFNMNaguuN2XE5VoREKW2GKj3CTT/EOvbwewLZj
 kzOITbM/Tmixo4ATV0QsD2CoEKB8Hhb92PRPvgnW4ZEZj3m/EG78QIT+TjYYAaoC7pjE
 QivMMxO5WAzyIK4ASkN4JHeQQk3dk8gty+bN082FtY111huCs3XShrxHaaS1VSdpd/In
 /kc5cCFwoSEKM2eLpikCd6JU5iKiOcaMSG4VaIhjvX6agQCiyUoQcvcyoYDaryVu09NS
 loOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1735927591; x=1736532391;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=155ezFoO+4fVmuNy4GZMEsWBNEAzYP4vCAeZ5fjCchw=;
 b=ZeWQWsMPZSNLpQThI1zip0n8DQqB2gJ3P6AkrQ/WrZV/qjpHl9jrs8GIrJxNFtYhtb
 /5N80OIUeYFK7R10vHwemZWV7Y6CO/doV7DWSaOXkAyYfQf0YYldp2CXyXXIS7ZWol76
 XSjRwSrqF8mRRXshuU2ReGdj9UPhEDgoc3yR7hzR38Bfq/DN1KOTx2V+o6ejPStxe2fN
 DVY/Wr/kNN3Yw87t/DJRqS8t94wUy5YCWP+qFoS4W6qbm2mq/lue+ujKaSCY64gUaOpE
 2gqfosGCwaqeLuw3aPWyotGEUsex/6HRNlZX0xPKEDNGrAz76zKyn6dg3YbcFuVUjXt3
 VlXQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVXCzHhfS5VEWcoMX5R7ltY/7wxHwHDG7wlsvb4i7UDJzMe+sAa5PcQ52+6cFKLNX5QsCEmUWnM@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyM0psbg88LevHGtoEjS23gfNNwipOD7OB341K+qWziDv3OeSPu
 UJYqf/BaaK7Rno22BTgDFqjdJpeXtkvz0pskj2Ym1GgCVoyQtLGGDVOlbAHF/Cc=
X-Gm-Gg: ASbGncuvNneQz0HGKH7T7sdZ9RojoN7RClpikds+VMImJjTyzzcrwuzDUsa2iqH4Ii1
 JVdJVduI8+BGuBXisLbgNT2ajgc35wA5tu8FNh9p4W4QI8RcfTK2fX/GFbNWQd7YiE1MdoPE3Yg
 zNi3zcpj4g4l6Pb+6GtsPOnBdgRVb2yjnRC8UOTZmabMn2vg2OVpZ9pVmAGfSC+CSQnKkF6i/CP
 etAkyqQlp/ldCgliHV478aA0/JlvjurKHo+pDWfm0+L122R1dS7SDVLl+97e9w2zSQOSKDZh2VR
 y3I3cMnMetoYpO/RpAiaJ2UT6bOrkuBM2b2K
X-Google-Smtp-Source: AGHT+IGRom+Gus/1G1SgQhKlOCafo/OEVm4N6cFluXFzAfrnKOJhSwVzA8r9uuoBvSe2BPxSSW2YMg==
X-Received: by 2002:a05:6512:438b:b0:542:2999:2e43 with SMTP id
 2adb3069b0e04-54229992e47mr16954688e87.24.1735927591118; 
 Fri, 03 Jan 2025 10:06:31 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-54223832a5bsm4176014e87.270.2025.01.03.10.06.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Jan 2025 10:06:29 -0800 (PST)
Date: Fri, 3 Jan 2025 20:06:28 +0200
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
 freedreno@lists.freedesktop.org, Johan Hovold <johan+linaro@kernel.org>
Subject: Re: [PATCH v3 1/4] drm/dp: Add helper to set LTTPRs in transparent
 mode
Message-ID: <yx2io7cuu5hescyocvkvzsaoiqhgbifknbxytqtusbno6y4xe2@e4bar6lemtdl>
References: <20250103-drm-dp-msm-add-lttpr-transparent-mode-set-v3-0-5c367f4b0763@linaro.org>
 <20250103-drm-dp-msm-add-lttpr-transparent-mode-set-v3-1-5c367f4b0763@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250103-drm-dp-msm-add-lttpr-transparent-mode-set-v3-1-5c367f4b0763@linaro.org>
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

On Fri, Jan 03, 2025 at 02:58:15PM +0200, Abel Vesa wrote:
> According to the DisplayPort standard, LTTPRs have two operating
> modes:
>  - non-transparent - it replies to DPCD LTTPR field specific AUX
>    requests, while passes through all other AUX requests
>  - transparent - it passes through all AUX requests.
> 
> Switching between this two modes is done by the DPTX by issuing
> an AUX write to the DPCD PHY_REPEATER_MODE register.
> 
> Add a generic helper that allows switching between these modes.
> 
> Also add a generic wrapper for the helper that handles the explicit
> disabling of non-transparent mode and its disable->enable sequence
> mentioned in the DP Standard v2.0 section 3.6.6.1. Do this in order
> to move this handling out of the vendor specific driver implementation
> into the generic framework.
> 
> Tested-by: Johan Hovold <johan+linaro@kernel.org>
> Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
> ---
>  drivers/gpu/drm/display/drm_dp_helper.c | 61 +++++++++++++++++++++++++++++++++
>  include/drm/display/drm_dp_helper.h     |  2 ++
>  2 files changed, 63 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry
