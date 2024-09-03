Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 93929969EAC
	for <lists+nouveau@lfdr.de>; Tue,  3 Sep 2024 15:08:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A36F10E59F;
	Tue,  3 Sep 2024 13:08:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="qjjjgddi";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-io1-f44.google.com (mail-io1-f44.google.com
 [209.85.166.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 74CFB10E59C
 for <nouveau@lists.freedesktop.org>; Tue,  3 Sep 2024 13:08:12 +0000 (UTC)
Received: by mail-io1-f44.google.com with SMTP id
 ca18e2360f4ac-82a3022be9eso151257239f.3
 for <nouveau@lists.freedesktop.org>; Tue, 03 Sep 2024 06:08:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1725368892; x=1725973692; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=ZeRs4z3I8mmDPvKoL9y7zecAhLAZtwSgnEUeAq3N0pw=;
 b=qjjjgddi0YrLsTBZeuzFhaf3NymDMyNbzbONVzU2mJ0vk1k4QVdLyznLHfD9KZODWQ
 xaV+FHRSRA6hbLFGKxR9IIL5CXVnWH5GRSiAtTIhm/JQZasHgjmSHRJ3YzyVs1e3x/tB
 7Sm/XROWIVTgLPWR+Gw3lx8K0BCCo2MQ44aHfmeYS8ACt8E9R/GUp/6hnwotR84V3sKn
 XC0cciSn+Zmkr7T17wjsHiB0ngbJHQc4azs7jIXazI3rxFZdTLRHvawz7wKgDVDq4Zux
 76z1VuCzWcwMQQSsdA6gVBSO3KhdyfGHlMViVdYNuEwDFMvW7QwWZhhKoKaBxPEDe7VS
 WNDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725368892; x=1725973692;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ZeRs4z3I8mmDPvKoL9y7zecAhLAZtwSgnEUeAq3N0pw=;
 b=nNMxvDGoMFJDzyUmbhJ1oLl4YFLeuiYtOHhI9ahVl+v9KgEhRRjzfh5LjqeOBMP2n+
 V18G5a/Vwm/1n0ahHBsi2AX/MHBy0uytn0n7cxzD7lLRzxxSxVuYtAlFxYHhHYJF5h6U
 RYqoo2Tyh3W2AO2IjTyphHP1Sds4ObbseXh4oVL4+5enwP8b2ihA4/Rybcq3VqRAXpdo
 iqH6bOpmzbZSkFIm33rjp2Hfx6HX+vNzxox4Qzy2ROksMeCBCYUiOC+vp7xkEjuIoO8Q
 ZJdD81SlpgD13kFijx5XdnlXsc9lf4+ZfkpsUs5o9wM/EODxXhgVKLpQCfOP81b03NHJ
 OaPg==
X-Forwarded-Encrypted: i=1;
 AJvYcCV5YR0RIqucisOlxCjDRzVoKjK+lnd43gR6YUmhvdzzVamDBoLsyr/5BQkFcuS18GmAv0Luqv7U@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyfeK8Bbl2ENZj548MK9IwFW5grWuy+k25Lze74tY4w0B2GKWzi
 kGvpAAkFCKHMFB46Qwn/CCeI4o1KxpjlYJb7Dvc9z/w3Pg9aud32CwBSI5xKFSz5Mthtjzxa/SV
 rS5LwW7RrMvplhMlzsNogaXP/ixXdNrReFQaUJQ==
X-Google-Smtp-Source: AGHT+IGHAgnSMNvuVful4dbf9WKc4xkX76uqFfFYB8rGHdSebPTzop/+5Lxf4E1tJz0Qa5koqY5wyz6U/9g7ZRt6e8w=
X-Received: by 2002:a05:6e02:12cf:b0:39b:32f6:5e90 with SMTP id
 e9e14a558f8ab-39f4e0d41e1mr118881735ab.15.1725368891480; Tue, 03 Sep 2024
 06:08:11 -0700 (PDT)
MIME-Version: 1.0
References: <20240830084456.77630-1-tzimmermann@suse.de>
 <20240830084456.77630-78-tzimmermann@suse.de>
In-Reply-To: <20240830084456.77630-78-tzimmermann@suse.de>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 3 Sep 2024 16:08:00 +0300
Message-ID: <CAA8EJpoX3X6+u7Nst4qj5J0hcUCeYQvULW1wMSjwnVyLQeszjA@mail.gmail.com>
Subject: Re: [PATCH v3 77/81] drm/msm: Run DRM default client setup
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: daniel@ffwll.ch, airlied@gmail.com, jfalempe@redhat.com, 
 javierm@redhat.com, dri-devel@lists.freedesktop.org, 
 amd-gfx@lists.freedesktop.org, intel-gfx@lists.freedesktop.org, 
 intel-xe@lists.freedesktop.org, nouveau@lists.freedesktop.org, 
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>
Content-Type: text/plain; charset="UTF-8"
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

On Fri, 30 Aug 2024 at 11:45, Thomas Zimmermann <tzimmermann@suse.de> wrote:
>
> Rework fbdev probing to support fbdev_probe in struct drm_driver
> and remove the old fb_probe callback. Provide an initializer macro
> for struct drm_driver that sets the callback according to the kernel
> configuration.
>
> Call drm_client_setup() to run the kernel's default client setup
> for DRM. Set fbdev_probe in struct drm_driver, so that the client
> setup can start the common fbdev client.
>
> The msm driver specifies a preferred color mode of 32. As this
> is the default if no format has been given, leave it out entirely.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: Rob Clark <robdclark@gmail.com>
> Cc: Abhinav Kumar <quic_abhinavk@quicinc.com>
> Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Cc: Sean Paul <sean@poorly.run>
> Cc: Marijn Suijten <marijn.suijten@somainline.org>
> ---
>  drivers/gpu/drm/msm/msm_drv.c   |   4 +-
>  drivers/gpu/drm/msm/msm_drv.h   |  13 ++-
>  drivers/gpu/drm/msm/msm_fbdev.c | 144 ++++++--------------------------
>  3 files changed, 38 insertions(+), 123 deletions(-)
>

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry
