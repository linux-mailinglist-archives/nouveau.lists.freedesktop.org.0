Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BB0382439F1
	for <lists+nouveau@lfdr.de>; Thu, 13 Aug 2020 14:44:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 591156E21D;
	Thu, 13 Aug 2020 12:44:16 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 651166E21D
 for <nouveau@lists.freedesktop.org>; Thu, 13 Aug 2020 12:44:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1597322653;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=DuaKe1mZfbQOEy3vU0IvOh3qvOEZnjiR99rYX0WAkfY=;
 b=AwdPuZYWtNwxm+ycE/y4pqDJZLnU89Y6O2T4hoJEBjnR5gOm1xLHfwmCqzR/tDq38IdEn5
 PSqEIIM0uWISbHB7pnwaJ3H3IXvN2big5sPOiHG59gH3CFs14F5hhoP1sU+xDUGOTQGCOH
 gS8L+ORa9VewdVO46/EHObNVpGkEN7I=
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-553-CDcyLyv0PkCbxiqW-QgmBw-1; Thu, 13 Aug 2020 08:44:09 -0400
X-MC-Unique: CDcyLyv0PkCbxiqW-QgmBw-1
Received: by mail-qt1-f200.google.com with SMTP id e14so4694437qtm.5
 for <nouveau@lists.freedesktop.org>; Thu, 13 Aug 2020 05:44:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=DuaKe1mZfbQOEy3vU0IvOh3qvOEZnjiR99rYX0WAkfY=;
 b=CjuUiyp9fkBAsoTi9/AjSEgXM/2iBf4B7iWXcA0yGhgkhdS8B1Dh7cET6Py+b3i88V
 +X8McGjaRgCLRtO5RUiPS5Y0Sxsm46S8HaXRdQTXOh5XXqMQmE1xav5AWfYhWznlpy7E
 jix4mBhWvg0pjh5LYmQamMKqsm+3EFCNi9qFQ2kRgiOqmrZB0TOfymzS9ikzLqWH2IKw
 KGRbiJor/EJBXgMa4kuDh7VSnpH4KiJ4w9PVlHT78UzQ6+hVq9h+3nCfXbNMrTmkk6SV
 lkNyYQbJraF/wwxCiIb3qdFSHS0V8RjUkCubRC622zxiBP/5VdZfcWrQan+7UAF1Me2d
 6BXA==
X-Gm-Message-State: AOAM5330hHH5AUKlnN0e80ZpOVn7dPRP2kjXhqIOQAxw9aSicjGosGR1
 WN5XX19WSjX9pxKw9FM7BfKkSWVdmwEnr/Zlcjh4/2DirE9ICueDAHwR+A91mwrVtWkKV+a+pX9
 AVRnMdeUHVYFFMionGy8yaJGxZQIRq0n/oYgDgvx4Xg==
X-Received: by 2002:ac8:74c7:: with SMTP id j7mr4944634qtr.254.1597322648951; 
 Thu, 13 Aug 2020 05:44:08 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxicaEepBIMK6TfbtL+T0MXKjJ+N/gu+zF3IhKDvPZQsjbaCt3vMck1dvybXgaPOkrqmPAFI60DmEZFhhozH9M=
X-Received: by 2002:ac8:74c7:: with SMTP id j7mr4944601qtr.254.1597322648679; 
 Thu, 13 Aug 2020 05:44:08 -0700 (PDT)
MIME-Version: 1.0
References: <20200812204952.1921587-1-jcline@redhat.com>
In-Reply-To: <20200812204952.1921587-1-jcline@redhat.com>
From: Karol Herbst <kherbst@redhat.com>
Date: Thu, 13 Aug 2020 14:43:57 +0200
Message-ID: <CACO55tuYkFvSXL+i1zcAROq7T=LvGuOzdhzy+2DZVG0O2L4mjA@mail.gmail.com>
To: Jeremy Cline <jcline@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kherbst@redhat.com
X-Mimecast-Spam-Score: 0.002
X-Mimecast-Originator: redhat.com
Subject: Re: [Nouveau] [PATCH] drm/nouveau: Add fine-grain temperature
 reporting
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
 LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, Ben Skeggs <bskeggs@redhat.com>,
 Daniel Vetter <daniel@ffwll.ch>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

Reviewed-by: Karol Herbst <kherbst@redhat.com>

On Wed, Aug 12, 2020 at 10:50 PM Jeremy Cline <jcline@redhat.com> wrote:
>
> Commit d32656373857 ("drm/nouveau/therm/gp100: initial implementation of
> new gp1xx temperature sensor") added support for reading finer-grain
> temperatures, but continued to report temperatures in 1 degree Celsius
> increments via nvkm_therm_temp_get().
>
> Rather than altering nvkm_therm_temp_get() to report finer-grain
> temperatures, which would be inconvenient for other users of the
> function, a second interface has been added to line up with hwmon's
> native unit of temperature.
>
> Signed-off-by: Jeremy Cline <jcline@redhat.com>
> ---
>  .../drm/nouveau/include/nvkm/subdev/therm.h   | 18 +++++++++++++
>  drivers/gpu/drm/nouveau/nouveau_hwmon.c       |  4 +--
>  .../gpu/drm/nouveau/nvkm/subdev/therm/base.c  | 16 ++++++++++++
>  .../gpu/drm/nouveau/nvkm/subdev/therm/gp100.c | 25 +++++++++++++++++--
>  .../gpu/drm/nouveau/nvkm/subdev/therm/priv.h  |  1 +
>  5 files changed, 60 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/gpu/drm/nouveau/include/nvkm/subdev/therm.h b/drivers/gpu/drm/nouveau/include/nvkm/subdev/therm.h
> index 62c34f98c930..7b9928dd001c 100644
> --- a/drivers/gpu/drm/nouveau/include/nvkm/subdev/therm.h
> +++ b/drivers/gpu/drm/nouveau/include/nvkm/subdev/therm.h
> @@ -100,6 +100,24 @@ struct nvkm_therm {
>  };
>
>  int nvkm_therm_temp_get(struct nvkm_therm *);
> +
> +/**
> + * nvkm_therm_temp_millidegree_get() - get the temperature in millidegrees
> + * @therm: The thermal device to read from.
> + *
> + * This interface reports temperatures in units of millidegree Celsius to
> + * align with the hwmon API. Some cards may only be capable of reporting in
> + * units of Celsius, and those that report finer grain temperatures may not be
> + * capable of millidegree Celsius accuracy,
> + *
> + * For cases where millidegree temperature is too fine-grain, the
> + * nvkm_therm_temp_get() interface reports temperatures in one degree Celsius
> + * increments.
> + *
> + * Return: The temperature in millidegrees Celsius, or -ENODEV if temperature
> + *         reporting is not supported.
> + */
> +int nvkm_therm_temp_millidegree_get(struct nvkm_therm *therm);
>  int nvkm_therm_fan_sense(struct nvkm_therm *);
>  int nvkm_therm_cstate(struct nvkm_therm *, int, int);
>  void nvkm_therm_clkgate_init(struct nvkm_therm *,
> diff --git a/drivers/gpu/drm/nouveau/nouveau_hwmon.c b/drivers/gpu/drm/nouveau/nouveau_hwmon.c
> index 1c3104d20571..e96355f93ce5 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_hwmon.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_hwmon.c
> @@ -428,8 +428,8 @@ nouveau_temp_read(struct device *dev, u32 attr, int channel, long *val)
>         case hwmon_temp_input:
>                 if (drm_dev->switch_power_state != DRM_SWITCH_POWER_ON)
>                         return -EINVAL;
> -               ret = nvkm_therm_temp_get(therm);
> -               *val = ret < 0 ? ret : (ret * 1000);
> +               ret = nvkm_therm_temp_millidegree_get(therm);
> +               *val = ret;
>                 break;
>         case hwmon_temp_max:
>                 *val = therm->attr_get(therm, NVKM_THERM_ATTR_THRS_DOWN_CLK)
> diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/therm/base.c b/drivers/gpu/drm/nouveau/nvkm/subdev/therm/base.c
> index 4a4d1e224126..e655b32c78b8 100644
> --- a/drivers/gpu/drm/nouveau/nvkm/subdev/therm/base.c
> +++ b/drivers/gpu/drm/nouveau/nvkm/subdev/therm/base.c
> @@ -34,6 +34,22 @@ nvkm_therm_temp_get(struct nvkm_therm *therm)
>         return -ENODEV;
>  }
>
> +int
> +nvkm_therm_temp_millidegree_get(struct nvkm_therm *therm)
> +{
> +       int ret = -ENODEV;
> +
> +       if (therm->func->temp_millidegree_get)
> +               return therm->func->temp_millidegree_get(therm);
> +
> +       if (therm->func->temp_get) {
> +               ret = therm->func->temp_get(therm);
> +               if (ret > 0)
> +                       ret *= 1000;
> +       }
> +       return ret;
> +}
> +
>  static int
>  nvkm_therm_update_trip(struct nvkm_therm *therm)
>  {
> diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/therm/gp100.c b/drivers/gpu/drm/nouveau/nvkm/subdev/therm/gp100.c
> index 9f0dea3f61dc..4c3c2895a3cb 100644
> --- a/drivers/gpu/drm/nouveau/nvkm/subdev/therm/gp100.c
> +++ b/drivers/gpu/drm/nouveau/nvkm/subdev/therm/gp100.c
> @@ -24,7 +24,7 @@
>  #include "priv.h"
>
>  static int
> -gp100_temp_get(struct nvkm_therm *therm)
> +gp100_temp_get_raw(struct nvkm_therm *therm)
>  {
>         struct nvkm_device *device = therm->subdev.device;
>         struct nvkm_subdev *subdev = &therm->subdev;
> @@ -37,14 +37,35 @@ gp100_temp_get(struct nvkm_therm *therm)
>
>         /* device valid */
>         if (tsensor & 0x20000000)
> -               return (inttemp >> 8);
> +               return inttemp;
>         else
>                 return -ENODEV;
>  }
>
> +static int
> +gp100_temp_millidegree_get(struct nvkm_therm *therm)
> +{
> +       int raw_temp = gp100_temp_get_raw(therm);
> +
> +       if (raw_temp < 0)
> +               return raw_temp;
> +       return raw_temp * 1000 >> 8;
> +}
> +
> +static int
> +gp100_temp_get(struct nvkm_therm *therm)
> +{
> +       int raw_temp = gp100_temp_get_raw(therm);
> +
> +       if (raw_temp < 0)
> +               return raw_temp;
> +       return raw_temp >> 8;
> +}
> +
>  static const struct nvkm_therm_func
>  gp100_therm = {
>         .temp_get = gp100_temp_get,
> +       .temp_millidegree_get = gp100_temp_millidegree_get,
>         .program_alarms = nvkm_therm_program_alarms_polling,
>  };
>
> diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/therm/priv.h b/drivers/gpu/drm/nouveau/nvkm/subdev/therm/priv.h
> index 21659daf1864..a53068b4f0b9 100644
> --- a/drivers/gpu/drm/nouveau/nvkm/subdev/therm/priv.h
> +++ b/drivers/gpu/drm/nouveau/nvkm/subdev/therm/priv.h
> @@ -92,6 +92,7 @@ struct nvkm_therm_func {
>         int (*pwm_clock)(struct nvkm_therm *, int line);
>
>         int (*temp_get)(struct nvkm_therm *);
> +       int (*temp_millidegree_get)(struct nvkm_therm *therm);
>
>         int (*fan_sense)(struct nvkm_therm *);
>
> --
> 2.26.2
>

_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
