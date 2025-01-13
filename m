Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CE53A0B103
	for <lists+nouveau@lfdr.de>; Mon, 13 Jan 2025 09:26:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 13F9610E27D;
	Mon, 13 Jan 2025 08:26:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="hiVqacxi";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com
 [209.85.167.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 46ADE10E27D
 for <nouveau@lists.freedesktop.org>; Mon, 13 Jan 2025 08:26:14 +0000 (UTC)
Received: by mail-lf1-f43.google.com with SMTP id
 2adb3069b0e04-5401ab97206so3985455e87.3
 for <nouveau@lists.freedesktop.org>; Mon, 13 Jan 2025 00:26:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1736756713; x=1737361513; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=HsOOejTFjVwFwvDCfWyTG69OVT7YoO10LJVJy5N++GA=;
 b=hiVqacxis646nluQSlcULkOd6N3WEai1ty5erEMJToixb8wsJ7WAfHeN6hYV7JxD5X
 5GLuhFwJAOfY5r4XQHDJh7nvzf1EXmzTJm4SzNxIkU19BtBdoLApxM+wB7w8NvIeJ5pH
 JT5QxgwX/FKDmuGA6F1d5ZOmpdbyy67hS/E0YCoNg2FwHRi6Rg9gDKRBsEWUJyHkMf4A
 Ch33Ea6ll7StVHNfhY4q1keqv+fwjC04vgmTCLwcmyX2B2Tfa1KQimwDnDExdGP5yV6Z
 +Y+r3jfYr5lwBPuWzYkK8PL7qWA/XSlNkaDjV2hsoMpBRbN86SrmbZJt+yZhrZuiK0E/
 zS/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736756713; x=1737361513;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=HsOOejTFjVwFwvDCfWyTG69OVT7YoO10LJVJy5N++GA=;
 b=YSTSj1lT+9k9VAGZI2suazwr+4DwlPJ7O+4xfo+4nPeF40OXHtySqgpsWSdSmHpnak
 IwaScaqzXadLduHRgkKbNs0mW8iUI3+laRNh8MpyqFWsUW2qnzfKrY8O/VZmG9eqyVyA
 fWa+SRHhASsU4SKeFvkuuJj5Fdzj251HaIJfFzSr+Pu8hXZ6fpLfsfGMVosPFR/sOqzV
 UXcmcZKFkEkdoWa6Hzl82XvMIa0yDzmh5AwZsHLZ+Xz0mwEIoGBUnSTG01p4Be+YTnOS
 bhCNGKPfYxcwzHDnCpKpMt/UJ4d/M3fKW7e9JSYR7Q4ciiaJSAZEAm0xO/j80dWrf0+J
 Fjxg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWuM3SEBniM66M6tB1iOcUAyrsjSmXhYGAfxLPcjm0pLBAJ4GtKT0YnpDNdl5Z5cYIVH6RnlHIg@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzcIvmyGdV5J3DrgFoNfHaaxb+mUgojfePwW37YIymUfkNmpGff
 ASGX7rZMvfTc6cnZ3me30JHtR7HrgiVCMoT+mNlGyavIaZ2TKr+T3J2u2Cp/3JY=
X-Gm-Gg: ASbGncvdq0TztOPWrIlIwCHqrG1CVTlL4///VpK53ZMRiPCEvv0fj3nLj6SSUQPYvAy
 s9wjSn7dL/yqFPO7EkITtIT0B7sUIaA2ltgzFhBHPTLMsjWFtceNe9Ot8Ope2nmTdMoAz9KPLNm
 kqOADQYOHv5/QGQ6Fq1KbDwumaNIkn3/CM32eSJ3khGwQiIMn5VdhuZ3zpMkcem2wr/jw5LLR9c
 ncALdk6vS24IIt6HFRjD/eLgpqVPud3SRlfZxl+hhDR9bfGGsRsEX3QoL/wBtcuwyUgxnvund/5
 51nLS50RUAUX52IXEUiqk4omqq9ENii/AwLL
X-Google-Smtp-Source: AGHT+IERZWZtkZrsbkHThnFiBHKfz//tsYW/urMLTgJODZNi9Tp473Grr1NqQ4M0NySCRCOoV5n3Rw==
X-Received: by 2002:a05:6512:138c:b0:540:2188:763c with SMTP id
 2adb3069b0e04-542845b0b55mr6338144e87.37.1736756712614; 
 Mon, 13 Jan 2025 00:25:12 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5428bec0659sm1286326e87.185.2025.01.13.00.25.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Jan 2025 00:25:11 -0800 (PST)
Date: Mon, 13 Jan 2025 10:25:09 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: maarten.lankhorst@linux.intel.com, mripard@kernel.org, 
 airlied@gmail.com, simona@ffwll.ch, dri-devel@lists.freedesktop.org, 
 linux-mediatek@lists.infradead.org, freedreno@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org, 
 imx@lists.linux.dev, linux-samsung-soc@vger.kernel.org,
 nouveau@lists.freedesktop.org, 
 virtualization@lists.linux.dev, spice-devel@lists.freedesktop.org, 
 linux-renesas-soc@vger.kernel.org, linux-rockchip@lists.infradead.org,
 linux-tegra@vger.kernel.org, 
 intel-xe@lists.freedesktop.org, xen-devel@lists.xenproject.org,
 Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>
Subject: Re: [PATCH v2 13/25] drm/msm: Compute dumb-buffer sizes with
 drm_mode_size_dumb()
Message-ID: <bbw2n4ccn5jlq7q7lsw3xdnbieazgexkwkycrqvk5aoiq5q3wx@nz6gd3unwkg4>
References: <20250109150310.219442-1-tzimmermann@suse.de>
 <20250109150310.219442-14-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250109150310.219442-14-tzimmermann@suse.de>
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

On Thu, Jan 09, 2025 at 03:57:07PM +0100, Thomas Zimmermann wrote:
> Call drm_mode_size_dumb() to compute dumb-buffer scanline pitch and
> buffer size. The hardware requires the scnaline pitch to be a multiple
> of 32 pixels. Therefore compute the byte size of 32 pixels in the given
> color mode and align the pitch accordingly.

- scanline, not scnaline
- the statement about 32-pixel alignment needs an explanation that it is
  being currently handled by align_pitch().

With that in mind:

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: Rob Clark <robdclark@gmail.com>
> Cc: Abhinav Kumar <quic_abhinavk@quicinc.com>
> Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Cc: Sean Paul <sean@poorly.run>
> Cc: Marijn Suijten <marijn.suijten@somainline.org>
> ---
>  drivers/gpu/drm/msm/msm_gem.c | 27 +++++++++++++++++++++++++--
>  1 file changed, 25 insertions(+), 2 deletions(-)
> 

-- 
With best wishes
Dmitry
