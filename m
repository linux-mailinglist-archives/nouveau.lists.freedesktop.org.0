Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C767F366FB2
	for <lists+nouveau@lfdr.de>; Wed, 21 Apr 2021 18:05:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2BFBB6E9CC;
	Wed, 21 Apr 2021 16:05:03 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB1416E9CF
 for <nouveau@lists.freedesktop.org>; Wed, 21 Apr 2021 16:05:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619021100;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=OAKV0jPl8xPIMkBEjvAuiju9wmoM7Yvx6p0e44SvPOE=;
 b=Q5cXx3P07ZcCElZ0YX0a3Bx8fKPgPNnti46VbcNYCfUvAoKo3n+QlBOMoEDRoi1lXFAQwY
 xyNBY7LbEKECmTVR4mpiguEfhUUV+3jK/s2p4luuzoJjUdrJDa/TBsH0QDSixIHFiYf166
 CeHNpF8xCTO8oc6J0/MY6qqjDYsHOMY=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-173-_elBV3TFMPyyC_jAVM5psQ-1; Wed, 21 Apr 2021 12:04:57 -0400
X-MC-Unique: _elBV3TFMPyyC_jAVM5psQ-1
Received: by mail-wm1-f71.google.com with SMTP id
 n67-20020a1c59460000b0290114d1a03f5bso549150wmb.6
 for <nouveau@lists.freedesktop.org>; Wed, 21 Apr 2021 09:04:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=OAKV0jPl8xPIMkBEjvAuiju9wmoM7Yvx6p0e44SvPOE=;
 b=TFXsrlFYo5rzMHzeWFEQMf6dceYgfQi2+lYMyYSe2HkhtvX5jl0yZL540kNqsowSSc
 r4oRRK1y8dizqyyWxMaWccsyw90ijnT2i9qr4l1lwYIyOAPJsRSCY5AjEVL12aOlY/8/
 OkF4NRD3U5IDd1WM/x78Yep2PhPcAT0a5Ps8X4K1mPSHpcNN9Ofum1rYoOauU0tqPoHN
 w0B7lhElI5N9aJZ6TlE5QqGzXdomTyqCm2Ht90CJfSzUzcUwuBwzq5zMZ6t+DkcWPwyx
 UYEFY0MNLuyCC7BmYnATEzUtvkwEB4dlLXEaAymOfyv/8i1eXpZMKjOMcqgXq60H2RKq
 /Rkg==
X-Gm-Message-State: AOAM533btxpNf/8ZNu8e0enzi+zHfS2qM5V7pyufFA4mgYATTSQMogwz
 0ucsdDxJX1A/10JHsV4zCZiBYip2hoeVRpP8DHwlVaLIq3lKRwplM46eJlYUsXefYHYksbrnYbJ
 5Q2wZoYdK/EcFRcMCCfzh2nRM7WjyljGeUKj5V6Rrpg==
X-Received: by 2002:a7b:cc86:: with SMTP id p6mr10563239wma.164.1619021096176; 
 Wed, 21 Apr 2021 09:04:56 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzgp86n7yQWCPPXCvY01wup8wmKz1H4Y/WaPsM3LeruNTgXB0Mw8bAvevUx+/ipKzHShy2mt5hsy8UfsKjEpHg=
X-Received: by 2002:a7b:cc86:: with SMTP id p6mr10563220wma.164.1619021095933; 
 Wed, 21 Apr 2021 09:04:55 -0700 (PDT)
MIME-Version: 1.0
References: <YIAneTPoxr5n7485@mwanda>
In-Reply-To: <YIAneTPoxr5n7485@mwanda>
From: Karol Herbst <kherbst@redhat.com>
Date: Wed, 21 Apr 2021 18:04:45 +0200
Message-ID: <CACO55tvrienoNTXmVeHnXHOEAMB0AsJdu-BexuXhe-8gMohhSg@mail.gmail.com>
To: Dan Carpenter <dan.carpenter@oracle.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kherbst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Subject: Re: [Nouveau] [bug report] drm/nouveau/hwmon: Remove old code,
 add .write/.read operations
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
Cc: nouveau <nouveau@lists.freedesktop.org>, osalvador.vilardaga@gmail.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

On Wed, Apr 21, 2021 at 3:57 PM Dan Carpenter <dan.carpenter@oracle.com> wrote:
>
> Hello Oscar Salvador,
>
> The patch bfb96e4c344e: "drm/nouveau/hwmon: Remove old code, add
> .write/.read operations" from May 18, 2017, leads to the following
> static checker warning:
>
>     drivers/gpu/drm/nouveau/nouveau_hwmon.c:507 nouveau_in_read()
>     warn: check sign expansion for '-19'
>     drivers/gpu/drm/nouveau/nouveau_hwmon.c:510 nouveau_in_read()
>     warn: check sign expansion for '-19'
>
> drivers/gpu/drm/nouveau/nouveau_hwmon.c
>    488  static int
>    489  nouveau_in_read(struct device *dev, u32 attr, int channel, long *val)
>    490  {
>    491          struct drm_device *drm_dev = dev_get_drvdata(dev);
>    492          struct nouveau_drm *drm = nouveau_drm(drm_dev);
>    493          struct nvkm_volt *volt = nvxx_volt(&drm->client.device);
>    494          int ret;
>    495
>    496          if (!volt)
>    497                  return -EOPNOTSUPP;
>    498
>    499          switch (attr) {
>    500          case hwmon_in_input:
>    501                  if (drm_dev->switch_power_state != DRM_SWITCH_POWER_ON)
>    502                          return -EINVAL;
>    503                  ret = nvkm_volt_get(volt);
>    504                  *val = ret < 0 ? ret : (ret / 1000);
>    505                  break;
>    506          case hwmon_in_min:
>    507                  *val = volt->min_uv > 0 ? (volt->min_uv / 1000) : -ENODEV;
>
> This is trying to set "*val = -ENODEV" but because "volt->min_uv" is
> unsigned int it actually sets it to "*val = (unsigned int)-ENODEV".
>
> It's weird to me that this code doesn't return -ENODEV instead of
> setting *val to it.
>

ohh.. that might actually be a left over from the conversion we've
done in the past. Thanks for pointing it out. Do you want to write the
patch as well?

>    508                  break;
>    509          case hwmon_in_max:
>    510                  *val = volt->max_uv > 0 ? (volt->max_uv / 1000) : -ENODEV;
>                         ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
>
>    511                  break;
>    512          default:
>    513                  return -EOPNOTSUPP;
>    514          }
>    515
>    516          return 0;
>    517  }
>
> regards,
> dan carpenter
> _______________________________________________
> Nouveau mailing list
> Nouveau@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/nouveau
>

_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
