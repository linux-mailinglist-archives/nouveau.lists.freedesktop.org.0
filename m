Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 45A9495A4A6
	for <lists+nouveau@lfdr.de>; Wed, 21 Aug 2024 20:24:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A837D10E4CD;
	Wed, 21 Aug 2024 18:24:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="now+m2B8";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com
 [209.85.221.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0061910E52E
 for <nouveau@lists.freedesktop.org>; Wed, 21 Aug 2024 18:23:59 +0000 (UTC)
Received: by mail-wr1-f54.google.com with SMTP id
 ffacd0b85a97d-371ba7e46easo2099187f8f.0
 for <nouveau@lists.freedesktop.org>; Wed, 21 Aug 2024 11:23:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1724264638; x=1724869438;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6UKtg+zvbSMPXrleMHfdH7Qk7nmkQZoNUnEZ2n2BArA=;
 b=now+m2B8UpK6LZ1w0DCjhck5x4Bptn9/gEN/UUvV9o+Iclgh0EVnhdm2eEBPtCfH2J
 5FLGevPXC9G/+N0sUrizZnCRdvJKcH2xXMa70Nnwrw3pVxD5iy4jnOKxlVniuHTq+q7q
 DZ4nKxpoDCPsZTL81/Y6bEmi4uZSNw5V9pTyNn5mVs5ae+F5ROTAhtIAUEY/OAopaPV9
 jUNVWNBkahDWYrqQf2Z3PZaq8ckVpFHEA4HOO59LLcymI81i/t79EkLe3Y8fX/K1QNle
 L3cXPTLUidPXZpT4dsigCWJIeCmHMqtp+YTw/7Co7JpuUl5OX+aTK0H/Bq9NAZqp9kz4
 e2JA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724264638; x=1724869438;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=6UKtg+zvbSMPXrleMHfdH7Qk7nmkQZoNUnEZ2n2BArA=;
 b=eY06eYP3xEuY1ZFd3urOEWKzezstcxCbMwTLYDrHjCZRA0oLe3lEBU/qTjVTpHJV2u
 Rq6pcu41Ii97dJvLqwblCRYeKe8Lhz+hGqa1NRgQk+hlLIX6qhaKHydjI2/vk1McLw1R
 6k3N9msia/v+98ORqbfYzsFP3cI/40Pu6ZxwkrYU9LsSlz10gKimGpWKLNRSIqOhP6mJ
 BUVHGcOW4i9jokw0Wyed9MXtzFEXu//TWd5KDyS1BnNey55+ztUeXJKaps9cMOUxNV0z
 nD4YFFY8G/NKUlb34g/XmNUcLshueei7mVy2phY1eQC6vS9+SxFRjxR/dXUCrLSyJW0+
 7beg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXdwoLys5KNtseAtVQSy41up96tGiAuFxUiSCormEV4KXruh7R0Qny763FNSdq8GZxl2QSyaPVZ@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yxshnz8q4j8dD3fPIE8w5WMHiqIPjd/fvh69iNnTxNZN27ZLJou
 INydtY053e+/mfSLPhVfZbnmtSoYTZwi+ylZMNj3L/TQKjzM+Cec46bR8mhfLYiyJdC0RwcmoR+
 xUjjiygaVGMzHxwJ+GfovD4q1C2og/U2wngg=
X-Google-Smtp-Source: AGHT+IG0fJ7c0qdelGJey9GL/wt13fokKG4Azv8WAjWPN2GOZwHyzJZuOrVRGRQpWEgQNsW5AtTzHed1qT8QSZdQ5ro=
X-Received: by 2002:adf:a158:0:b0:368:41bd:149b with SMTP id
 ffacd0b85a97d-372fd5ba7b6mr1932270f8f.34.1724264637269; Wed, 21 Aug 2024
 11:23:57 -0700 (PDT)
MIME-Version: 1.0
References: <20240821130348.73038-1-tzimmermann@suse.de>
 <20240821130348.73038-14-tzimmermann@suse.de>
In-Reply-To: <20240821130348.73038-14-tzimmermann@suse.de>
From: John Stultz <jstultz@google.com>
Date: Wed, 21 Aug 2024 11:23:45 -0700
Message-ID: <CANDhNCqDvWU8Hyudw=KromJzFjgj3CqeZ2q5+Qxo0EdS22gd+w@mail.gmail.com>
Subject: Re: [PATCH v2 13/86] drm/hisilicon/kirin: Run DRM default client setup
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: daniel@ffwll.ch, airlied@gmail.com, jfalempe@redhat.com, 
 javierm@redhat.com, dri-devel@lists.freedesktop.org, 
 amd-gfx@lists.freedesktop.org, intel-gfx@lists.freedesktop.org, 
 intel-xe@lists.freedesktop.org, nouveau@lists.freedesktop.org, 
 Xinliang Liu <xinliang.liu@linaro.org>, Tian Tao <tiantao6@hisilicon.com>, 
 Xinwei Kong <kong.kongxinwei@hisilicon.com>,
 Sumit Semwal <sumit.semwal@linaro.org>, 
 Yongqin Liu <yongqin.liu@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

On Wed, Aug 21, 2024 at 6:04=E2=80=AFAM Thomas Zimmermann <tzimmermann@suse=
.de> wrote:
>
> Call drm_client_setup() to run the kernel's default client setup
> for DRM. Set fbdev_probe in struct drm_driver, so that the client
> setup can start the common fbdev client.
>
> The kirin driver specifies a preferred color mode of 32. As this
> is the default if no format has been given, leave it out entirely.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: Xinliang Liu <xinliang.liu@linaro.org>
> Cc: Tian Tao <tiantao6@hisilicon.com>
> Cc: Xinwei Kong <kong.kongxinwei@hisilicon.com>
> Cc: Sumit Semwal <sumit.semwal@linaro.org>
> Cc: Yongqin Liu <yongqin.liu@linaro.org>
> Cc: John Stultz <jstultz@google.com>
> ---
>  drivers/gpu/drm/hisilicon/kirin/kirin_drm_ade.c | 2 ++
>  drivers/gpu/drm/hisilicon/kirin/kirin_drm_drv.c | 4 ++--

I don't have hardware to test anymore, but it looks reasonable.
Acked-by: John Stultz <jstultz@google.com>

thanks
-john
