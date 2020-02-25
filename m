Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C82516EAD2
	for <lists+nouveau@lfdr.de>; Tue, 25 Feb 2020 17:06:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 599436E8E5;
	Tue, 25 Feb 2020 16:06:27 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-vs1-f65.google.com (mail-vs1-f65.google.com
 [209.85.217.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC6156E8E5;
 Tue, 25 Feb 2020 16:06:25 +0000 (UTC)
Received: by mail-vs1-f65.google.com with SMTP id n27so8343553vsa.0;
 Tue, 25 Feb 2020 08:06:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=FwptVK1XxNiAx6QLyhlVdPjTnsru2c+o8OkDVdcz2T8=;
 b=EGKojKKEv1Odxhw3lCPAKRc7mWu5c4P+baQXYdVehLCUDyN90TqB+k2Wwzua3WDtCr
 M8DNcXWuHkxy7jxbDTWmBjE1/1UWpq0CDoNg8pq5VjJcXhQV0W/J3AvMOjeTU2mYUbBy
 QuaoQhuRWt65kisrt5N7vjUdlS/sD2AYPjnZwHGuAt4fXVH+2u6XVH0opKBXj5UcsMR5
 QPgSlUePHUkNaN5LRwCdZKjRbgKKum9sYLSowgBtWoQ0ta8DwQTlyHRQleVvVamM21QR
 Msh4J1+uEwXlpyG5ojzbW5HPQvHd5z2xl0ShZ/A9WuMb44sODKOLROuoXbhA9E/HNBQg
 qG0g==
X-Gm-Message-State: APjAAAWXH4hGpn63Gh/iKG8PECTZwiGEkbqLPebFQ6Kz5HI6nBmrDuX4
 e/PjCXoFNpSstSZ0JmEv5m1imfck8jOxFZG02r4=
X-Google-Smtp-Source: APXvYqyfpLe3UkSAtRBVSGZowGRv9MSsn5fQBLAjkeZrERUe6PIUlbb44LOrkQA/IxxXLQPYeC5aTM/Ch6EAFQ6qOPg=
X-Received: by 2002:a05:6102:1246:: with SMTP id
 p6mr28414726vsg.210.1582646784791; 
 Tue, 25 Feb 2020 08:06:24 -0800 (PST)
MIME-Version: 1.0
References: <20200225155902.9751-1-tzimmermann@suse.de>
 <20200225155902.9751-2-tzimmermann@suse.de>
In-Reply-To: <20200225155902.9751-2-tzimmermann@suse.de>
From: Ilia Mirkin <imirkin@alum.mit.edu>
Date: Tue, 25 Feb 2020 11:06:13 -0500
Message-ID: <CAKb7UviDs+rqF+vtDnV4CbHmY8PW8_-ahpAExctORYPKKyL7Yw@mail.gmail.com>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [Nouveau] [PATCH 1/3] drm: Add separate state structure for
 legacy, non-KMS drivers
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
Cc: David Airlie <airlied@linux.ie>, nouveau <nouveau@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, mripard@kernel.org,
 Ben Skeggs <bskeggs@redhat.com>, Daniel Vetter <daniel@ffwll.ch>,
 Alex Deucher <alexander.deucher@amd.com>, Sam Ravnborg <sam@ravnborg.org>,
 Emil Velikov <emil.velikov@collabora.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

On Tue, Feb 25, 2020 at 10:59 AM Thomas Zimmermann <tzimmermann@suse.de> wrote:
>
> Non-KMS drivers store state in struct drm_driver. This bloats the
> structure for KMS drivers and prevents it from being declared with
> 'static const' qualifiers. Moving the non-KMS state into a separate
> data structure resolves this.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>  drivers/gpu/drm/drm_drv.c             | 4 ++++
>  drivers/gpu/drm/i810/i810_drv.c       | 4 ++++
>  drivers/gpu/drm/mga/mga_drv.c         | 4 ++++
>  drivers/gpu/drm/nouveau/nouveau_drm.c | 8 ++++++++
>  drivers/gpu/drm/r128/r128_drv.c       | 4 ++++
>  drivers/gpu/drm/savage/savage_drv.c   | 4 ++++
>  drivers/gpu/drm/sis/sis_drv.c         | 4 ++++
>  drivers/gpu/drm/tdfx/tdfx_drv.c       | 4 ++++
>  drivers/gpu/drm/via/via_drv.c         | 4 ++++
>  include/drm/drm_drv.h                 | 3 +++
>  include/drm/drm_legacy.h              | 6 ++++++
>  11 files changed, 49 insertions(+)
>
> diff --git a/drivers/gpu/drm/drm_drv.c b/drivers/gpu/drm/drm_drv.c
> index 7b1a628d1f6e..4ba0df097602 100644
> --- a/drivers/gpu/drm/drm_drv.c
> +++ b/drivers/gpu/drm/drm_drv.c
> @@ -625,6 +625,10 @@ int drm_dev_init(struct drm_device *dev,
>         if (WARN_ON(!parent))
>                 return -EINVAL;
>
> +       if (drm_core_check_feature(dev, DRIVER_LEGACY) &&
> +           WARN_ON(!driver->legacy))
> +               return -EINVAL;
> +
>         kref_init(&dev->ref);
>         dev->dev = get_device(parent);
>         dev->driver = driver;
> diff --git a/drivers/gpu/drm/i810/i810_drv.c b/drivers/gpu/drm/i810/i810_drv.c
> index 0e53a066d4db..55f17f00bae9 100644
> --- a/drivers/gpu/drm/i810/i810_drv.c
> +++ b/drivers/gpu/drm/i810/i810_drv.c
> @@ -56,6 +56,9 @@ static const struct file_operations i810_driver_fops = {
>         .llseek = noop_llseek,
>  };
>
> +static struct drm_legacy_state = i810_legacy_state {

Does this compile? I might have assumed this would need to be

static struct drm_legacy_state i810_legacy_state = {

> +};
> +
>  static struct drm_driver driver = {
>         .driver_features = DRIVER_USE_AGP | DRIVER_HAVE_DMA | DRIVER_LEGACY,
>         .dev_priv_size = sizeof(drm_i810_buf_priv_t),
> @@ -71,6 +74,7 @@ static struct drm_driver driver = {
>         .major = DRIVER_MAJOR,
>         .minor = DRIVER_MINOR,
>         .patchlevel = DRIVER_PATCHLEVEL,
> +       .legacy = &i810_legacy_state,
>  };
>
>  static struct pci_driver i810_pci_driver = {
> diff --git a/drivers/gpu/drm/mga/mga_drv.c b/drivers/gpu/drm/mga/mga_drv.c
> index 71128e6f6ae9..4865982d949c 100644
> --- a/drivers/gpu/drm/mga/mga_drv.c
> +++ b/drivers/gpu/drm/mga/mga_drv.c
> @@ -53,6 +53,9 @@ static const struct file_operations mga_driver_fops = {
>         .llseek = noop_llseek,
>  };
>
> +static struct drm_legacy_state = mga_legacy_state {
> +};
> +
>  static struct drm_driver driver = {
>         .driver_features =
>             DRIVER_USE_AGP | DRIVER_PCI_DMA | DRIVER_LEGACY |
> @@ -78,6 +81,7 @@ static struct drm_driver driver = {
>         .major = DRIVER_MAJOR,
>         .minor = DRIVER_MINOR,
>         .patchlevel = DRIVER_PATCHLEVEL,
> +       .legacy = &mga_legacy_state,
>  };
>
>  static struct pci_driver mga_pci_driver = {
> diff --git a/drivers/gpu/drm/nouveau/nouveau_drm.c b/drivers/gpu/drm/nouveau/nouveau_drm.c
> index 6b1629c14dd7..c88cf32e521c 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_drm.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_drm.c
> @@ -1103,6 +1103,11 @@ nouveau_driver_fops = {
>         .llseek = noop_llseek,
>  };
>
> +#if defined(CONFIG_NOUVEAU_LEGACY_CTX_SUPPORT)
> +static struct drm_legacy_state nouveau_legacy_state{
> +};
> +#endif
> +
>  static struct drm_driver
>  driver_stub = {
>         .driver_features =
> @@ -1150,6 +1155,9 @@ driver_stub = {
>         .major = DRIVER_MAJOR,
>         .minor = DRIVER_MINOR,
>         .patchlevel = DRIVER_PATCHLEVEL,
> +#if defined(CONFIG_NOUVEAU_LEGACY_CTX_SUPPORT)
> +       .legacy = &nouveau_legacy_state,
> +#endif
>  };
>
>  static struct pci_device_id
> diff --git a/drivers/gpu/drm/r128/r128_drv.c b/drivers/gpu/drm/r128/r128_drv.c
> index b7a5f162ebae..ecece3a48d93 100644
> --- a/drivers/gpu/drm/r128/r128_drv.c
> +++ b/drivers/gpu/drm/r128/r128_drv.c
> @@ -57,6 +57,9 @@ static const struct file_operations r128_driver_fops = {
>         .llseek = noop_llseek,
>  };
>
> +static struct drm_legacy_state = r128_legacy_state {
> +};
> +
>  static struct drm_driver driver = {
>         .driver_features =
>             DRIVER_USE_AGP | DRIVER_PCI_DMA | DRIVER_SG | DRIVER_LEGACY |
> @@ -81,6 +84,7 @@ static struct drm_driver driver = {
>         .major = DRIVER_MAJOR,
>         .minor = DRIVER_MINOR,
>         .patchlevel = DRIVER_PATCHLEVEL,
> +       .legacy = &r128_legacy_state,
>  };
>
>  int r128_driver_load(struct drm_device *dev, unsigned long flags)
> diff --git a/drivers/gpu/drm/savage/savage_drv.c b/drivers/gpu/drm/savage/savage_drv.c
> index 799bd11adb9c..c0a7146fbde1 100644
> --- a/drivers/gpu/drm/savage/savage_drv.c
> +++ b/drivers/gpu/drm/savage/savage_drv.c
> @@ -47,6 +47,9 @@ static const struct file_operations savage_driver_fops = {
>         .llseek = noop_llseek,
>  };
>
> +static struct drm_legacy_state = savage_legacy_state {
> +};
> +
>  static struct drm_driver driver = {
>         .driver_features =
>             DRIVER_USE_AGP | DRIVER_HAVE_DMA | DRIVER_PCI_DMA | DRIVER_LEGACY,
> @@ -65,6 +68,7 @@ static struct drm_driver driver = {
>         .major = DRIVER_MAJOR,
>         .minor = DRIVER_MINOR,
>         .patchlevel = DRIVER_PATCHLEVEL,
> +       .legacy = &savage_legacy_state,
>  };
>
>  static struct pci_driver savage_pci_driver = {
> diff --git a/drivers/gpu/drm/sis/sis_drv.c b/drivers/gpu/drm/sis/sis_drv.c
> index 2c54b33abb54..1c794a82c8e6 100644
> --- a/drivers/gpu/drm/sis/sis_drv.c
> +++ b/drivers/gpu/drm/sis/sis_drv.c
> @@ -99,6 +99,9 @@ static void sis_driver_postclose(struct drm_device *dev, struct drm_file *file)
>         kfree(file_priv);
>  }
>
> +static struct drm_legacy_state = sis_legacy_state {
> +};
> +
>  static struct drm_driver driver = {
>         .driver_features = DRIVER_USE_AGP | DRIVER_LEGACY,
>         .load = sis_driver_load,
> @@ -116,6 +119,7 @@ static struct drm_driver driver = {
>         .major = DRIVER_MAJOR,
>         .minor = DRIVER_MINOR,
>         .patchlevel = DRIVER_PATCHLEVEL,
> +       .legacy = &sis_legacy_state,
>  };
>
>  static struct pci_driver sis_pci_driver = {
> diff --git a/drivers/gpu/drm/tdfx/tdfx_drv.c b/drivers/gpu/drm/tdfx/tdfx_drv.c
> index ab699bf0ac5c..17aa93d82d6b 100644
> --- a/drivers/gpu/drm/tdfx/tdfx_drv.c
> +++ b/drivers/gpu/drm/tdfx/tdfx_drv.c
> @@ -56,6 +56,9 @@ static const struct file_operations tdfx_driver_fops = {
>         .llseek = noop_llseek,
>  };
>
> +static struct drm_legacy_state = tdfx_legacy_state {
> +};
> +
>  static struct drm_driver driver = {
>         .driver_features = DRIVER_LEGACY,
>         .fops = &tdfx_driver_fops,
> @@ -65,6 +68,7 @@ static struct drm_driver driver = {
>         .major = DRIVER_MAJOR,
>         .minor = DRIVER_MINOR,
>         .patchlevel = DRIVER_PATCHLEVEL,
> +       .legacy = &tdfx_legacy_state,
>  };
>
>  static struct pci_driver tdfx_pci_driver = {
> diff --git a/drivers/gpu/drm/via/via_drv.c b/drivers/gpu/drm/via/via_drv.c
> index 5da38082821f..22113d93ecdd 100644
> --- a/drivers/gpu/drm/via/via_drv.c
> +++ b/drivers/gpu/drm/via/via_drv.c
> @@ -71,6 +71,9 @@ static const struct file_operations via_driver_fops = {
>         .llseek = noop_llseek,
>  };
>
> +static struct drm_legacy_state = via_legacy_state {
> +};
> +
>  static struct drm_driver driver = {
>         .driver_features =
>             DRIVER_USE_AGP | DRIVER_HAVE_IRQ | DRIVER_LEGACY,
> @@ -97,6 +100,7 @@ static struct drm_driver driver = {
>         .major = DRIVER_MAJOR,
>         .minor = DRIVER_MINOR,
>         .patchlevel = DRIVER_PATCHLEVEL,
> +       .legacy = &via_legacy_state,
>  };
>
>  static struct pci_driver via_pci_driver = {
> diff --git a/include/drm/drm_drv.h b/include/drm/drm_drv.h
> index 97109df5beac..94078af0cc28 100644
> --- a/include/drm/drm_drv.h
> +++ b/include/drm/drm_drv.h
> @@ -40,6 +40,7 @@ struct dma_buf_attachment;
>  struct drm_display_mode;
>  struct drm_mode_create_dumb;
>  struct drm_printer;
> +struct drm_legacy_state;
>
>  /**
>   * enum drm_driver_feature - feature flags
> @@ -599,6 +600,8 @@ struct drm_driver {
>         const struct file_operations *fops;
>
>         /* Everything below here is for legacy driver, never use! */
> +       struct drm_legacy_state *legacy;
> +
>         /* private: */
>
>         /* List of devices hanging off this driver with stealth attach. */
> diff --git a/include/drm/drm_legacy.h b/include/drm/drm_legacy.h
> index dcef3598f49e..c98a29e1c2b3 100644
> --- a/include/drm/drm_legacy.h
> +++ b/include/drm/drm_legacy.h
> @@ -49,6 +49,12 @@ struct pci_driver;
>   * you're doing it terribly wrong.
>   */
>
> +/**
> + * State for non-KMS drivers.
> + */
> +struct drm_legacy_state {
> +};
> +
>  /**
>   * DMA buffer.
>   */
> --
> 2.25.0
>
> _______________________________________________
> Nouveau mailing list
> Nouveau@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/nouveau
_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
