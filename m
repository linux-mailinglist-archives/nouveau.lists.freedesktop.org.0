Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 161B3A00D77
	for <lists+nouveau@lfdr.de>; Fri,  3 Jan 2025 19:13:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8461610E913;
	Fri,  3 Jan 2025 18:13:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="aUtoFyF4";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com
 [209.85.208.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 12F1810E908
 for <nouveau@lists.freedesktop.org>; Fri,  3 Jan 2025 18:13:19 +0000 (UTC)
Received: by mail-lj1-f169.google.com with SMTP id
 38308e7fff4ca-3047818ac17so108008541fa.3
 for <nouveau@lists.freedesktop.org>; Fri, 03 Jan 2025 10:13:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1735927937; x=1736532737; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=a4NhGUz7I3CAC37MMfl5it+wA4D/a3jTss78eeeM00E=;
 b=aUtoFyF4atmXkh8afGH/mufGsyPMa2oFR+r94e4XuBDzl83U7/cj3CUdkciM90NO0x
 CXVfmpWF0OWkn9e75O+o5CXwLObMPwlIJHWKTJzDCIIYTmCI46hJrtpHAtarnXsxMLv9
 F6qubo0xmr0/CizKvNL0rgCV0cYSD5QpaEeQ6TFT8LFf8qyxG4J6sBZoU4OJqwSgv0hK
 VZ2LQwyANg18HtGNJRV67kK4OpcImv+xHpl1v8jpuSYEq+0C50fwgpYf8JxJH73hMRGd
 KSiaq1kNgCC3J71XIeWfg8HYa8cj5rq9+MijCGpaHAmv3W/9Hj1eCkY+mwH4jlExxbkd
 Ancw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1735927937; x=1736532737;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=a4NhGUz7I3CAC37MMfl5it+wA4D/a3jTss78eeeM00E=;
 b=AoWknaOQibAbYK14pFRXgh+z4bQjrm9rmcsKgQSs4m2QcFFeG0dFIZ64+r1Q7iXm5Q
 QoCGiAaUhjB6Nw1Vrz5KvlFBj/IOVVtHFBvsZAQ+2wTyp+xLvyWPAVOUJm5xSZEutWcZ
 oBAijfZ3VEZ4v5lPCK0Y0VNVppE7NzbnentFRl0I2c/+pHJTBZ4dx+fCTaaejaAjxvKl
 qKSNX3U/Udbf/SIZcfTy2li5NOo0EMcy6Xx+dHz6+5/aiqqAcwUXReYM8H47rXWzEnkK
 qAm0thFSY+FJQTuFMnCBpTkl/NHVldnSZtgsKVn7xPqBKdjxH008gm9YQaEpDGNkKVkc
 XUcQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWvPdbSGStsy/S8d0q04whCVYdPrbBPj5kBTcX156KdJDhxJwiOqDnSjP77YAnKK1rQqnWMyNgn@lists.freedesktop.org
X-Gm-Message-State: AOJu0Ywux2+H+lMnTEjubBBZ07Sppy76DA6xTjG2LkIV5lm2XpKFnTXc
 BK4ek6FV7a2H8+IT3EymtV7M2LQ1fGI2Dea0JVF58+XnOObehVQu/DMav/iIQS8=
X-Gm-Gg: ASbGnctwDg1+oKyWUbxLM0d3wrDrbxMToyULw9LxMzhUTahpGCrULl3lSUOwTb298qh
 BG7HDWWAItEFcrYwY/X5WVIVw6f7PwWkFaGrtbB4WqGnp4vwKdxGLhmA6TCjWYKRpRonimYZ9xC
 21qI19UTuAETJSeanc6oc8S4spunWDBoetiu7lrJEGA/OPxalJFgqONuzRDBQtHK9R7p52nfeef
 5AHB//ehbt+2k4FQKAwswj5PFGH4e+5vPHuPb20nZuczOMF4aH+IbrohksE4o91RXD1S16naNAx
 6ZySjc68Zo5XMJvIcPS6RaEBhhJ+Q0LBhuuT
X-Google-Smtp-Source: AGHT+IHkyk31lkzWD+THb2q0kv0bZe0UEvMvlsqPvrWF0mIfBuAWDJmkYgVUK9JyXm1uBZasD7+P3A==
X-Received: by 2002:a05:651c:502:b0:300:3a15:8f2d with SMTP id
 38308e7fff4ca-304685dff04mr196263781fa.34.1735927937405; 
 Fri, 03 Jan 2025 10:12:17 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-3045b083ebbsm47714751fa.115.2025.01.03.10.12.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Jan 2025 10:12:16 -0800 (PST)
Date: Fri, 3 Jan 2025 20:12:13 +0200
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
Subject: Re: [PATCH v3 4/4] drm/msm/dp: Add support for LTTPR handling
Message-ID: <qsmcpai2uqfhmy6y5wks55p4fyqigndfzqfnapvdjf35gu4wg3@5aowfh3xaydn>
References: <20250103-drm-dp-msm-add-lttpr-transparent-mode-set-v3-0-5c367f4b0763@linaro.org>
 <20250103-drm-dp-msm-add-lttpr-transparent-mode-set-v3-4-5c367f4b0763@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250103-drm-dp-msm-add-lttpr-transparent-mode-set-v3-4-5c367f4b0763@linaro.org>
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

On Fri, Jan 03, 2025 at 02:58:18PM +0200, Abel Vesa wrote:
> Link Training Tunable PHY Repeaters (LTTPRs) are defined in DisplayPort
> 1.4a specification. As the name suggests, these PHY repeaters are
> capable of adjusting their output for link training purposes.
> 
> According to the DisplayPort standard, LTTPRs have two operating
> modes:
>  - non-transparent - it replies to DPCD LTTPR field specific AUX
>    requests, while passes through all other AUX requests
>  - transparent - it passes through all AUX requests.
> 
> Switching between this two modes is done by the DPTX by issuing
> an AUX write to the DPCD PHY_REPEATER_MODE register.
> 
> The msm DP driver is currently lacking any handling of LTTPRs.
> This means that if at least one LTTPR is found between DPTX and DPRX,
> the link training would fail if that LTTPR was not already configured
> in transparent mode.
> 
> The section 3.6.6.1 from the DisplayPort v2.0 specification mandates
> that before link training with the LTTPR is started, the DPTX may place
> the LTTPR in non-transparent mode by first switching to transparent mode
> and then to non-transparent mode. This operation seems to be needed only
> on first link training and doesn't need to be done again until device is
> unplugged.
> 
> It has been observed on a few X Elite-based platforms which have
> such LTTPRs in their board design that the DPTX needs to follow the
> procedure described above in order for the link training to be successful.
> 
> So add support for reading the LTTPR DPCD caps to figure out the number
> of such LTTPRs first. Then, for platforms (or Type-C dongles) that have
> at least one such an LTTPR, set its operation mode to transparent mode
> first and then to non-transparent, just like the mentioned section of
> the specification mandates.
> 
> Tested-by: Johan Hovold <johan+linaro@kernel.org>
> Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
> ---
>  drivers/gpu/drm/msm/dp/dp_display.c | 17 +++++++++++++++++
>  1 file changed, 17 insertions(+)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry
