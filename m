Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A67494F730
	for <lists+nouveau@lfdr.de>; Mon, 12 Aug 2024 21:06:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA1A010E28E;
	Mon, 12 Aug 2024 19:06:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="cuKKPhr5";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com
 [209.85.216.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D9CD810E28C;
 Mon, 12 Aug 2024 19:06:00 +0000 (UTC)
Received: by mail-pj1-f46.google.com with SMTP id
 98e67ed59e1d1-2cb4c584029so3639566a91.3; 
 Mon, 12 Aug 2024 12:06:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1723489560; x=1724094360; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=cos3n+V8bHGfr3diAdh/N//WjpRiIARzw2HXPekOji8=;
 b=cuKKPhr52KIDNfyZy+byjU3pXXJ4GBO2KSx1Ogf2m1m8Ffn/HH9aX9lqpMZ9cL4Ba7
 vOa4rhZXwSvGQnEyOH1N5Da0kSPCXAA6fEcQUqBtxszQz94oqCeKVMrBkQpfKYfs6ziI
 ipLbLbDHo5LTStizJfiEhvBExFiYdvtuyQIudhisYTzNzkk9vU6geG0aw5jGMK7IVfkA
 EfJq4svJlD16ZXDDdaf5pSzquc9iIJ9/Lzqcbfv0eQrKj+Yg0RPH9yLuUVPYhH5EaYFQ
 KvYj1twCZIhk0g/PKwj4q0JoleNObcWekes9QTQYNaluemR4oHctD4AyddUe+CyZ7D73
 w0Pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1723489560; x=1724094360;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=cos3n+V8bHGfr3diAdh/N//WjpRiIARzw2HXPekOji8=;
 b=vPpKG5JsDRK0FuFG8Z4lw8U3A01lzERa/+A1x5F8N51fBEQNgZBnaGfPfMwsE+58kH
 AboE1hN3nqMIgG3L064TeBJKB5WTaH30SAk5AssCV1edl3ENhuCUAOjB0hgAC/LxB7gx
 Y4IsIKjLh173ROjnbHULafSeFixc+Vd2LNXQEn21wjgduQ99BTbqVvbFNDWV2Kc4nBfF
 5t8p9ckdV4XYILrFWeg0WUxO2ijn1w9ZNPnvK1ZdsoCxzxNZgzU0hp5U7/qThZskLpK/
 p7m7TceXubQN4jfw70yIFUVr2DM2d2KvfVhZ0O1CU8Ms8/cU/f4SWTSALc8AV5CNYY4C
 sNlA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWFWF3+tDihZSddrdBxEAUoqQcxTm9QPjBZlD9nfns8sOs/M1pZ3CfXX7ZgjJvbJ389t9/hNmoJsOWr8YgHG0Rw8Vn5gnACWQWWNmqxsZYAYP3fbCxhrK+EeQSNU0ma+t/XlPzPR4iEE7E+x2Uw7ZesiC6H1VFiPzKX16CKcI5WgJbr4GMbDCSNOnRb6ec=
X-Gm-Message-State: AOJu0YxkQ4Vzvm8d2vIljJlhJyLTflffy4TnaF9LNRUIjOgE130uP9cy
 0kWo5lURo2N0HELqW6lpM3ChEK1Pjo+DhONqMimpQwm8ebpr9gddbTu8YRDmmO61hVUc54C7DYe
 HxwuINutEhCEUp1DI6FXbjdnfcNQ=
X-Google-Smtp-Source: AGHT+IHta7yIE+fT/AIep2pR6VJvE8nauN1jUGt+8zlnZd1Y7IDYv83U1ggqGO/wsEW0/YlJNdpkC7n1MNVWISEtrzA=
X-Received: by 2002:a17:90a:c70b:b0:2c9:9f06:bb2f with SMTP id
 98e67ed59e1d1-2d3924d6f9bmr1338941a91.6.1723489560340; Mon, 12 Aug 2024
 12:06:00 -0700 (PDT)
MIME-Version: 1.0
References: <20240812083000.337744-1-tzimmermann@suse.de>
 <20240812083000.337744-3-tzimmermann@suse.de>
In-Reply-To: <20240812083000.337744-3-tzimmermann@suse.de>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 12 Aug 2024 15:05:48 -0400
Message-ID: <CADnq5_OmtCTuvF_xNmOMYkACjLnJVn7L2wsRyvOsjKtk8inPyQ@mail.gmail.com>
Subject: Re: [PATCH v2 2/9] drm/amdgpu: Do not set struct drm_driver.lastclose
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: alexander.deucher@amd.com, christian.koenig@amd.com, Xinhui.Pan@amd.com, 
 airlied@gmail.com, daniel@ffwll.ch, maarten.lankhorst@linux.intel.com, 
 mripard@kernel.org, kherbst@redhat.com, lyude@redhat.com, dakr@redhat.com, 
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 nouveau@lists.freedesktop.org
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

On Mon, Aug 12, 2024 at 4:30=E2=80=AFAM Thomas Zimmermann <tzimmermann@suse=
.de> wrote:
>
> Remove the implementation of struct drm_driver.lastclose. The hook
> was only necessary before in-kernel DRM clients existed, but is now
> obsolete. The code in amdgpu_driver_lastclose_kms() is performed by
> drm_lastclose().
>
> v2:
> - update commit message
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>

Reviewed-by: Alex Deucher <alexander.deucher@amd.com>

> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu.h     |  1 -
>  drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c |  2 --
>  drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c | 17 -----------------
>  3 files changed, 20 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu.h b/drivers/gpu/drm/amd/am=
dgpu/amdgpu.h
> index 137a88b8de45..4baeb6519fda 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu.h
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
> @@ -1484,7 +1484,6 @@ extern const int amdgpu_max_kms_ioctl;
>
>  int amdgpu_driver_load_kms(struct amdgpu_device *adev, unsigned long fla=
gs);
>  void amdgpu_driver_unload_kms(struct drm_device *dev);
> -void amdgpu_driver_lastclose_kms(struct drm_device *dev);
>  int amdgpu_driver_open_kms(struct drm_device *dev, struct drm_file *file=
_priv);
>  void amdgpu_driver_postclose_kms(struct drm_device *dev,
>                                  struct drm_file *file_priv);
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c b/drivers/gpu/drm/am=
d/amdgpu/amdgpu_drv.c
> index 094498a0964b..5dd39e6c6223 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
> @@ -2953,7 +2953,6 @@ static const struct drm_driver amdgpu_kms_driver =
=3D {
>             DRIVER_SYNCOBJ_TIMELINE,
>         .open =3D amdgpu_driver_open_kms,
>         .postclose =3D amdgpu_driver_postclose_kms,
> -       .lastclose =3D amdgpu_driver_lastclose_kms,
>         .ioctls =3D amdgpu_ioctls_kms,
>         .num_ioctls =3D ARRAY_SIZE(amdgpu_ioctls_kms),
>         .dumb_create =3D amdgpu_mode_dumb_create,
> @@ -2980,7 +2979,6 @@ const struct drm_driver amdgpu_partition_driver =3D=
 {
>             DRIVER_SYNCOBJ_TIMELINE,
>         .open =3D amdgpu_driver_open_kms,
>         .postclose =3D amdgpu_driver_postclose_kms,
> -       .lastclose =3D amdgpu_driver_lastclose_kms,
>         .ioctls =3D amdgpu_ioctls_kms,
>         .num_ioctls =3D ARRAY_SIZE(amdgpu_ioctls_kms),
>         .dumb_create =3D amdgpu_mode_dumb_create,
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c b/drivers/gpu/drm/am=
d/amdgpu/amdgpu_kms.c
> index 66782be5917b..0a799942343d 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c
> @@ -1269,23 +1269,6 @@ int amdgpu_info_ioctl(struct drm_device *dev, void=
 *data, struct drm_file *filp)
>         return 0;
>  }
>
> -
> -/*
> - * Outdated mess for old drm with Xorg being in charge (void function no=
w).
> - */
> -/**
> - * amdgpu_driver_lastclose_kms - drm callback for last close
> - *
> - * @dev: drm dev pointer
> - *
> - * Switch vga_switcheroo state after last close (all asics).
> - */
> -void amdgpu_driver_lastclose_kms(struct drm_device *dev)
> -{
> -       drm_fb_helper_lastclose(dev);
> -       vga_switcheroo_process_delayed_switch();
> -}
> -
>  /**
>   * amdgpu_driver_open_kms - drm callback for open
>   *
> --
> 2.46.0
>
