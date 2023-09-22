Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 37ABF7ABAE1
	for <lists+nouveau@lfdr.de>; Fri, 22 Sep 2023 23:07:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1352F10E715;
	Fri, 22 Sep 2023 21:07:01 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 971C510E70E
 for <nouveau@lists.freedesktop.org>; Fri, 22 Sep 2023 21:06:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1695416813;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=TiK6SU/dUQgkK5bkAnZqE0FIM3VmCWIn73IlrzTNcnE=;
 b=N/07YFHu0TQEmYcATvHws8prxPGSIYYzj6oqcvKjQQsGErPJ4LseCUPpIsFyWa29VXmfQq
 JdNpvjPaorwRekpLzknUb0cKVVs9N5BJovqSB07hGcYAaCJUcnVGraa71af2KqLlZ5A4um
 g0G/kgiyujcIFrroiIMds8iwTw0K+ck=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-487-BVX8TIApN_SdaFSf-VTg5Q-1; Fri, 22 Sep 2023 17:06:52 -0400
X-MC-Unique: BVX8TIApN_SdaFSf-VTg5Q-1
Received: by mail-qt1-f199.google.com with SMTP id
 d75a77b69052e-41360d145b1so30789791cf.1
 for <nouveau@lists.freedesktop.org>; Fri, 22 Sep 2023 14:06:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695416812; x=1696021612;
 h=mime-version:user-agent:content-transfer-encoding:organization
 :references:in-reply-to:date:cc:to:from:subject:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Nbdcwv5Or6Z2+lA87iZfowKftkAW8aJRElWE3un3JwU=;
 b=G+i2T7W1FrZ5i0HEGYjTmxUPmvnKA9hrznRpE3dgAlOAooXMiZYvnJik6TCIso9Z5f
 IEeHztP9q+1KXPUOlIKdq71h5yusocCibu2tmJ5UlnYYC+CbQ+umFgStSEpfaqiI+r8d
 L3y6+LlwG97c1wBSjJMY0TbaoWAyvdarmhCDBJ0840OD1bNbStrSWyIxQtLvrsi9B8rV
 MlVpK2xJgLfnMgMYuafWVq3XLXYPQcW4If+RT2+RWmEww7KANWQR2CyDciY4aBGLdcFt
 1sb9tw7behacwRZbvG5omryv6zAIFPoE0PBxRplnUNQ1yDEkNZtDF6O/0SZ+MY3XMxyd
 IZnw==
X-Gm-Message-State: AOJu0YwtRai/wlkDMCWmTz4iqLFH1+kwVpAzvJqpsl947FV+PwD/Letj
 bQ1ZIPaCtZtI0ALXUKEjxrreQ8WuM9BB+6uFa/Tiwvd5RfQ0Da7B5iuf7dXcxx0I1CJBHPV/GuU
 Y1KeOc4OBuK35xZ5ybZXfXY1qJQ==
X-Received: by 2002:ac8:5fd6:0:b0:405:5b23:d0ea with SMTP id
 k22-20020ac85fd6000000b004055b23d0eamr717399qta.16.1695416811974; 
 Fri, 22 Sep 2023 14:06:51 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHO77hOhRgl+P8D05v+uElLGmY0PJDkHzsfs38llOhEzF3MZ4ZCYCENWWZ4uGBMCz8o7uGGFw==
X-Received: by 2002:ac8:5fd6:0:b0:405:5b23:d0ea with SMTP id
 k22-20020ac85fd6000000b004055b23d0eamr717384qta.16.1695416811681; 
 Fri, 22 Sep 2023 14:06:51 -0700 (PDT)
Received: from ?IPv6:2600:4040:5c6c:a300::feb? ([2600:4040:5c6c:a300::feb])
 by smtp.gmail.com with ESMTPSA id
 t15-20020ac8738f000000b0040324785e4csm1737173qtp.13.2023.09.22.14.06.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 Sep 2023 14:06:51 -0700 (PDT)
Message-ID: <2f7fbd1b606b4d08b8c8c6eefff5898c8faa697c.camel@redhat.com>
From: Lyude Paul <lyude@redhat.com>
To: Douglas Anderson <dianders@chromium.org>,
 dri-devel@lists.freedesktop.org,  Maxime Ripard <mripard@kernel.org>
Date: Fri, 22 Sep 2023 17:06:50 -0400
In-Reply-To: <20230921122641.RFT.v2.4.Ie7588ec6e0f93e8bc700e76b265ad1a7ad6b15ad@changeid>
References: <20230921192749.1542462-1-dianders@chromium.org>
 <20230921122641.RFT.v2.4.Ie7588ec6e0f93e8bc700e76b265ad1a7ad6b15ad@changeid>
Organization: Red Hat Inc.
User-Agent: Evolution 3.48.4 (3.48.4-1.fc38)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Subject: Re: [Nouveau] [RFT PATCH v2 04/12] drm/nouveau: Call
 drm_atomic_helper_shutdown() or equiv at shutdown time
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
Cc: nouveau@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 bskeggs@redhat.com, daniel@ffwll.ch
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

actually very glad to see this because I think I've seen one bug in the wil=
d
as a result of things not getting shut down :)

Reviewed-by: Lyude Paul <lyude@redhat.com>
Tested-by: Lyude Paul <lyude@redhat.com>

On Thu, 2023-09-21 at 12:26 -0700, Douglas Anderson wrote:
> Based on grepping through the source code this driver appears to be
> missing a call to drm_atomic_helper_shutdown() (or
> drm_helper_force_disable_all() if not using atomic) at system shutdown
> time. Among other things, this means that if a panel is in use that it
> won't be cleanly powered off at system shutdown time.
>=20
> The fact that we should call drm_atomic_helper_shutdown() in the case
> of OS shutdown/restart comes straight out of the kernel doc "driver
> instance overview" in drm_drv.c.
>=20
> Suggested-by: Maxime Ripard <mripard@kernel.org>
> Reviewed-by: Maxime Ripard <mripard@kernel.org>
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> ---
> This commit is only compile-time tested. I made my best guess about
> how to fit this into the existing code. If someone wishes a different
> style, please yell.
>=20
> (no changes since v1)
>=20
>  drivers/gpu/drm/nouveau/nouveau_display.c  |  9 +++++++++
>  drivers/gpu/drm/nouveau/nouveau_display.h  |  1 +
>  drivers/gpu/drm/nouveau/nouveau_drm.c      | 13 +++++++++++++
>  drivers/gpu/drm/nouveau/nouveau_drv.h      |  1 +
>  drivers/gpu/drm/nouveau/nouveau_platform.c |  6 ++++++
>  5 files changed, 30 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/nouveau/nouveau_display.c b/drivers/gpu/drm/=
nouveau/nouveau_display.c
> index d8c92521226d..05c3688ccb76 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_display.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_display.c
> @@ -642,6 +642,15 @@ nouveau_display_fini(struct drm_device *dev, bool su=
spend, bool runtime)
>  =09disp->fini(dev, runtime, suspend);
>  }
> =20
> +void
> +nouveau_display_shutdown(struct drm_device *dev)
> +{
> +=09if (drm_drv_uses_atomic_modeset(dev))
> +=09=09drm_atomic_helper_shutdown(dev);
> +=09else
> +=09=09drm_helper_force_disable_all(dev);
> +}
> +
>  static void
>  nouveau_display_create_properties(struct drm_device *dev)
>  {
> diff --git a/drivers/gpu/drm/nouveau/nouveau_display.h b/drivers/gpu/drm/=
nouveau/nouveau_display.h
> index 2ab2ddb1eadf..9df62e833cda 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_display.h
> +++ b/drivers/gpu/drm/nouveau/nouveau_display.h
> @@ -47,6 +47,7 @@ void nouveau_display_destroy(struct drm_device *dev);
>  int  nouveau_display_init(struct drm_device *dev, bool resume, bool runt=
ime);
>  void nouveau_display_hpd_resume(struct drm_device *dev);
>  void nouveau_display_fini(struct drm_device *dev, bool suspend, bool run=
time);
> +void nouveau_display_shutdown(struct drm_device *dev);
>  int  nouveau_display_suspend(struct drm_device *dev, bool runtime);
>  void nouveau_display_resume(struct drm_device *dev, bool runtime);
>  int  nouveau_display_vblank_enable(struct drm_crtc *crtc);
> diff --git a/drivers/gpu/drm/nouveau/nouveau_drm.c b/drivers/gpu/drm/nouv=
eau/nouveau_drm.c
> index 50589f982d1a..8ecfd66b7aab 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_drm.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_drm.c
> @@ -879,6 +879,18 @@ nouveau_drm_remove(struct pci_dev *pdev)
>  =09pci_disable_device(pdev);
>  }
> =20
> +void
> +nouveau_drm_device_shutdown(struct drm_device *dev)
> +{
> +=09nouveau_display_shutdown(dev);
> +}
> +
> +static void
> +nouveau_drm_shutdown(struct pci_dev *pdev)
> +{
> +=09nouveau_drm_device_shutdown(pci_get_drvdata(pdev));
> +}
> +
>  static int
>  nouveau_do_suspend(struct drm_device *dev, bool runtime)
>  {
> @@ -1346,6 +1358,7 @@ nouveau_drm_pci_driver =3D {
>  =09.id_table =3D nouveau_drm_pci_table,
>  =09.probe =3D nouveau_drm_probe,
>  =09.remove =3D nouveau_drm_remove,
> +=09.shutdown =3D nouveau_drm_shutdown,
>  =09.driver.pm =3D &nouveau_pm_ops,
>  };
> =20
> diff --git a/drivers/gpu/drm/nouveau/nouveau_drv.h b/drivers/gpu/drm/nouv=
eau/nouveau_drv.h
> index 3666a7403e47..aa936cabb6cf 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_drv.h
> +++ b/drivers/gpu/drm/nouveau/nouveau_drv.h
> @@ -327,6 +327,7 @@ struct drm_device *
>  nouveau_platform_device_create(const struct nvkm_device_tegra_func *,
>  =09=09=09       struct platform_device *, struct nvkm_device **);
>  void nouveau_drm_device_remove(struct drm_device *dev);
> +void nouveau_drm_device_shutdown(struct drm_device *dev);
> =20
>  #define NV_PRINTK(l,c,f,a...) do {                                      =
       \
>  =09struct nouveau_cli *_cli =3D (c);                                    =
    \
> diff --git a/drivers/gpu/drm/nouveau/nouveau_platform.c b/drivers/gpu/drm=
/nouveau/nouveau_platform.c
> index 23cd43a7fd19..b2e82a96411c 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_platform.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_platform.c
> @@ -50,6 +50,11 @@ static int nouveau_platform_remove(struct platform_dev=
ice *pdev)
>  =09return 0;
>  }
> =20
> +static void nouveau_platform_shutdown(struct platform_device *pdev)
> +{
> +=09nouveau_drm_device_shutdown(platform_get_drvdata(pdev));
> +}
> +
>  #if IS_ENABLED(CONFIG_OF)
>  static const struct nvkm_device_tegra_func gk20a_platform_data =3D {
>  =09.iommu_bit =3D 34,
> @@ -94,4 +99,5 @@ struct platform_driver nouveau_platform_driver =3D {
>  =09},
>  =09.probe =3D nouveau_platform_probe,
>  =09.remove =3D nouveau_platform_remove,
> +=09.shutdown =3D nouveau_platform_shutdown,
>  };

--=20
Cheers,
 Lyude Paul (she/her)
 Software Engineer at Red Hat

