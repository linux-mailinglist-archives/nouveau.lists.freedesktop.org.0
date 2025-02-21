Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BE62A40029
	for <lists+nouveau@lfdr.de>; Fri, 21 Feb 2025 20:59:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D58A610E24B;
	Fri, 21 Feb 2025 19:59:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="IWfEhErS";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com
 [209.85.167.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 00EAB10E24B
 for <nouveau@lists.freedesktop.org>; Fri, 21 Feb 2025 19:59:01 +0000 (UTC)
Received: by mail-lf1-f42.google.com with SMTP id
 2adb3069b0e04-5452ca02bdbso2357721e87.1
 for <nouveau@lists.freedesktop.org>; Fri, 21 Feb 2025 11:59:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1740167940; x=1740772740; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=bnb83UtqsBWTiNAjltn4JLaoZM1hQGViXgrYc69juLI=;
 b=IWfEhErSeOwzPLVxru0vkBqBa7D0+5P3DHbR90eiyA4lgksA3Iiv62L7zmMN1bH1im
 4l6ZFg8PJkkEOpBetdclDY98EYjOHXYduATRN90SVDzDMVFIki5BJnMsO70yWFpheSoU
 wn//r6fc1FnKUvWJj5HI3q5JAHi4640LzSh5Z1PZhKyraBFHkUcUVYRI2exGYcllrk4a
 ixqo4DwNvkHknFkA+nLwrQpXLcyOM9m4O2evFZ1ktqZrOywhk8TxtDtd2jFPEHZzHdYR
 ZX1WMc+dXZdca5Ch8GCmo//WyDaC4Jasfzz35t+YV0/WXvOnm8zJdjEUZM75jQ07aPot
 q6MA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740167940; x=1740772740;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=bnb83UtqsBWTiNAjltn4JLaoZM1hQGViXgrYc69juLI=;
 b=mbxP7lRrZz0ZchzN7dabs6Qrjb1KyyUSo/dNeZeMtsvL1oCEI/RBBZxHZ50JmZuEn4
 wUjVrL/VQcqyhosCxhSFM5X63t3uYHO7GxfzKKQwM6KLye8UQiUCyfy6W67MD9WW2UNw
 RGQqBbZbf1h+CE3KTQkNAXdBR7JUiL1UVoHg4Fe1mrdse7eU/03FDcV4QvSj7If8ZNnn
 vVoAcTkT3xFYnw+suAmX0ywjpx83XkkfOegwE76Rc4qJAdiv0UX+HCiuEqr3deWtvTrT
 Cn8pEXu3G9zpvsv2EbU4+lZnmUQn8H7DLlaxlJRAxqXGO0ZB/VddW5H14HQ6lFA3DNpb
 jn8w==
X-Forwarded-Encrypted: i=1;
 AJvYcCVVW5feDaV6CO19+ghXF8XEdO30TJKy9LQbUwlL129zBHoDAMTrnmTe76hVTqghFPyCJOUt4PmK@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyGPWAw3m23W6UmtbORD1ytU0afVaJe6fln935g9xDUv3gvxqz8
 vjhV6cOybPfe22QURQ1fxNXXva39jlHYYnw1ZJl/1cZyWsbnBotCd7Mz1xMy6fE=
X-Gm-Gg: ASbGncsgBNjRd5/Z7gNt3PJkWbNVfgjwedZ6QbQdlfSOY7eNnfNIjZdTPAbYuMsPz3W
 M2EjYyc+ZgD99i9z/Fr181hil+5DtAzLnNYJjhgGX9K3qBJ80E+i1jKRjhrF+npUQ43GoFv6Fsq
 OvNT+LwL9gS5eo7xWfh0mNDnFn0WkUnFq5iDtH+3XgF5xYn7pp/s0z7wWjvYFgAYElzKZfhJ8g/
 hqrmq9M94Uhre7E7ZPYUza9OjuM5VR3ZXNvdrcdDK0cgT8fYG/MtixU2564XqG4oJd7Pc2TC3m3
 ucNepLWzAZiywqBumDquUnGLqX2GwAWVykNPVoGchmPeoa7q2E5TVVuSAFCDS4IPmOmnDjC2FZ+
 g0qvD8g==
X-Google-Smtp-Source: AGHT+IFrckxDnWKfgAPPHmHclcGmNelQ44VvTcHTs9NzEDZAkR9Zx5tMSuT7N+Xy/eOAfbNq+ITXqw==
X-Received: by 2002:a05:6512:3183:b0:545:10eb:1ab2 with SMTP id
 2adb3069b0e04-54838f5a39dmr2406233e87.33.1740167939939; 
 Fri, 21 Feb 2025 11:58:59 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-54530a91179sm2128132e87.33.2025.02.21.11.58.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Feb 2025 11:58:59 -0800 (PST)
Date: Fri, 21 Feb 2025 21:58:56 +0200
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
 freedreno@lists.freedesktop.org, 
 Johan Hovold <johan+linaro@kernel.org>, Imre Deak <imre.deak@intel.com>
Subject: Re: [PATCH v5 0/4] drm/dp: Rework LTTPR transparent mode handling
 and add support to msm driver
Message-ID: <frsbcvxcvtp45mh45cld3rzbgl52gomzmzs73crv53pwbc4fns@sygnt6z2avht>
References: <20250203-drm-dp-msm-add-lttpr-transparent-mode-set-v5-0-c865d0e56d6e@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250203-drm-dp-msm-add-lttpr-transparent-mode-set-v5-0-c865d0e56d6e@linaro.org>
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

On Mon, Feb 03, 2025 at 12:57:55PM +0200, Abel Vesa wrote:
> Looking at both i915 and nouveau DP drivers, both are setting the first
> LTTPR (if found) in transparent mode first and then in non-transparent
> mode, just like the DP v2.0 specification mentions in section 3.6.6.1.
> 
> Being part of the standard, setting the LTTPR in a specific operation mode
> can be easily moved in the generic framework. So do that by adding a new
> helper.
> 
> Then, the msm DP driver is lacking any kind of support for LTTPR handling,
> so add it by reading the LTTPR caps for figuring out the number of LTTPRs
> found on plug detect and then do exactly what the i915 and nouveau drivers
> do with respect to toggling through operating modes, just like the
> up-mentioned section from DP spec describes.
> 
> At some point, link training per sub-segment will probably be needed, but
> for now, toggling the operating modes seems to be enough at least for the
> X Elite-based platforms that this patchset has been tested on.
> 
> Signed-off-by: Abel Vesa <abel.vesa@linaro.org>

[...]
> 
> ---
> Abel Vesa (4):
>       drm/dp: Add helper to set LTTPRs in transparent mode
>       drm/nouveau/dp: Use the generic helper to control LTTPR transparent mode
>       drm/i915/dp: Use the generic helper to control LTTPR transparent mode

Lyude, Jani, what would be your preferred way of merging these patches?
Would you ack merging of those through drm-misc or would you prefer for
the first patch only to be landed to drm-misc, which you can then pull
into nouveau and i915 trees.

>       drm/msm/dp: Add support for LTTPR handling
> 
>  drivers/gpu/drm/display/drm_dp_helper.c            | 61 ++++++++++++++++++++++
>  .../gpu/drm/i915/display/intel_dp_link_training.c  | 24 ++-------
>  drivers/gpu/drm/msm/dp/dp_display.c                | 15 ++++++
>  drivers/gpu/drm/nouveau/nouveau_dp.c               | 17 +-----
>  include/drm/display/drm_dp_helper.h                |  2 +
>  5 files changed, 85 insertions(+), 34 deletions(-)
> ---
> base-commit: 00f3246adeeacbda0bd0b303604e46eb59c32e6e
> change-id: 20241031-drm-dp-msm-add-lttpr-transparent-mode-set-136cd5bfde07
> 
> Best regards,
> -- 
> Abel Vesa <abel.vesa@linaro.org>
> 

-- 
With best wishes
Dmitry
