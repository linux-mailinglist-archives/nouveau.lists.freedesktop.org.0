Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BDE6B6AD339
	for <lists+nouveau@lfdr.de>; Tue,  7 Mar 2023 01:20:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E437510E286;
	Tue,  7 Mar 2023 00:20:12 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 79CEA10E34B
 for <nouveau@lists.freedesktop.org>; Tue,  7 Mar 2023 00:20:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678148409;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7+4tzxyqERGXd7AQ2o1b0aj9Gq2c77AeuI8QhLTg5i8=;
 b=Gucy5EU/48KSZY6P3z7x8WMddzm7ZY7BYDAEl8Y/mj+3zd/IpViPYu9CwodmXQEChdqL95
 Wp3nOAYlNXNH/Y6zSPwfcPan4cCtRvuhfZYJv4akxaGIEiFiMiV5YsQhUZPWxkl8a6Seq4
 ZZUn57DMEbOpgoMpXMWQlo+D9VZSVx0=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-41-8I04OEsTPROXnZ5zD5sl_w-1; Mon, 06 Mar 2023 19:20:08 -0500
X-MC-Unique: 8I04OEsTPROXnZ5zD5sl_w-1
Received: by mail-qv1-f71.google.com with SMTP id
 x10-20020ad440ca000000b005800220da38so5364730qvp.14
 for <nouveau@lists.freedesktop.org>; Mon, 06 Mar 2023 16:20:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678148407;
 h=mime-version:user-agent:content-transfer-encoding:organization
 :references:in-reply-to:date:cc:to:from:subject:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=3OO5g3ulKc98Lo7VM2vnzz9iptcrpwzftjrdFER2j9g=;
 b=3GHQ9U+2E+mjT9L4jdcbaP2dnHDU4FPAo6kQ2RKGuuDuSdExwj+7+4XuVulrNrHY75
 WvaCqoSDJ8VG2tvulH5CH1GzeUmE6NwZuwhlOz/4V2Shchbwj/Wrzzlrwj8MNnLV+p0O
 6UvG7wEbscOqwjTuyJa+Q7LcSGHYrL6huTKgb5NY4kzQ8vSuNm7VZXfMM9SUkuM9jv81
 XyaIFLOJSgqFRhIvOzwzIyEhW6BELK70uwuwBlpcykhHVnQ9dqMtt1DltwZ0S6pBGh3j
 zqIvYt2cHTGkDq5jHVGlAHHZgCLj0K6ln/aC3t1mwFf3Ly6zbw0qu62uOV3kPlOJWJLl
 KY6A==
X-Gm-Message-State: AO0yUKUMhfZs5PT8x+FW8fFFBmJYVqaY2SS9q4tY3hVTiLAh0oa29K7X
 J9EfCDKHeIj3WTJ3NbTEVszPH2MBEj0mGFIc3bhO08qjuFC1ovM816D3I0OBr/hvrL0pnDILFJF
 bhUm1qP3qRZiyqsgg+qMuS8rVKQ==
X-Received: by 2002:ac8:5e0c:0:b0:3bf:b1d6:359e with SMTP id
 h12-20020ac85e0c000000b003bfb1d6359emr17210014qtx.7.1678148407652; 
 Mon, 06 Mar 2023 16:20:07 -0800 (PST)
X-Google-Smtp-Source: AK7set9G99b4/F24c6ODRtdenQOBsR+rNyjSK/ievkE2R8v6jyZs5TelbiEvYAAjwLxnvAJSnVjzCA==
X-Received: by 2002:ac8:5e0c:0:b0:3bf:b1d6:359e with SMTP id
 h12-20020ac85e0c000000b003bfb1d6359emr17209989qtx.7.1678148407373; 
 Mon, 06 Mar 2023 16:20:07 -0800 (PST)
Received: from ?IPv6:2600:4040:5c68:6800::feb? ([2600:4040:5c68:6800::feb])
 by smtp.gmail.com with ESMTPSA id
 n132-20020a37408a000000b007425dade624sm8526056qka.41.2023.03.06.16.20.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Mar 2023 16:20:06 -0800 (PST)
Message-ID: <cf9f2bba28420dd19e14f449f4049ed23cfc41a2.camel@redhat.com>
From: Lyude Paul <lyude@redhat.com>
To: Deepak R Varma <drv@mailo.com>, Ben Skeggs <bskeggs@redhat.com>, Karol
 Herbst <kherbst@redhat.com>, David Airlie <airlied@gmail.com>, Daniel
 Vetter <daniel@ffwll.ch>,  dri-devel@lists.freedesktop.org,
 nouveau@lists.freedesktop.org,  linux-kernel@vger.kernel.org
Date: Mon, 06 Mar 2023 19:20:05 -0500
In-Reply-To: <Y/+pDaHOgG1x8Py2@ubun2204.myguest.virtualbox.org>
References: <Y/+pDaHOgG1x8Py2@ubun2204.myguest.virtualbox.org>
Organization: Red Hat Inc.
User-Agent: Evolution 3.44.4 (3.44.4-2.fc36)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Subject: Re: [Nouveau] [PATCH RESEND] drm/nouveau/hwmon: Use sysfs_emit in
 show function callsbacks
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
Cc: Praveen Kumar <kumarpraveen@linux.microsoft.com>,
 Saurabh Singh Sengar <ssengar@microsoft.com>
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

Reviewed-by: Lyude Paul <lyude@redhat.com>

Will push upstream in a moment

On Thu, 2023-03-02 at 01:05 +0530, Deepak R Varma wrote:
> According to Documentation/filesystems/sysfs.rst, the show() callback
> function of kobject attributes should strictly use sysfs_emit() instead
> of sprintf() family functions. So, make this change.
> Issue identified using the coccinelle device_attr_show.cocci script.
>=20
> Signed-off-by: Deepak R Varma <drv@mailo.com>
> ---
> Note:
>    Resending the patch for review and feedback. No functional changes.
>=20
>=20
>  drivers/gpu/drm/nouveau/nouveau_hwmon.c | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/nouveau/nouveau_hwmon.c b/drivers/gpu/drm/no=
uveau/nouveau_hwmon.c
> index a7db7c31064b..e844be49e11e 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_hwmon.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_hwmon.c
> @@ -41,7 +41,7 @@ static ssize_t
>  nouveau_hwmon_show_temp1_auto_point1_pwm(struct device *d,
>  =09=09=09=09=09 struct device_attribute *a, char *buf)
>  {
> -=09return snprintf(buf, PAGE_SIZE, "%d\n", 100);
> +=09return sysfs_emit(buf, "%d\n", 100);
>  }
>  static SENSOR_DEVICE_ATTR(temp1_auto_point1_pwm, 0444,
>  =09=09=09  nouveau_hwmon_show_temp1_auto_point1_pwm, NULL, 0);
> @@ -54,8 +54,8 @@ nouveau_hwmon_temp1_auto_point1_temp(struct device *d,
>  =09struct nouveau_drm *drm =3D nouveau_drm(dev);
>  =09struct nvkm_therm *therm =3D nvxx_therm(&drm->client.device);
> =20
> -=09return snprintf(buf, PAGE_SIZE, "%d\n",
> -=09      therm->attr_get(therm, NVKM_THERM_ATTR_THRS_FAN_BOOST) * 1000);
> +=09return sysfs_emit(buf, "%d\n",
> +=09=09=09  therm->attr_get(therm, NVKM_THERM_ATTR_THRS_FAN_BOOST) * 1000=
);
>  }
>  static ssize_t
>  nouveau_hwmon_set_temp1_auto_point1_temp(struct device *d,
> @@ -87,8 +87,8 @@ nouveau_hwmon_temp1_auto_point1_temp_hyst(struct device=
 *d,
>  =09struct nouveau_drm *drm =3D nouveau_drm(dev);
>  =09struct nvkm_therm *therm =3D nvxx_therm(&drm->client.device);
> =20
> -=09return snprintf(buf, PAGE_SIZE, "%d\n",
> -=09 therm->attr_get(therm, NVKM_THERM_ATTR_THRS_FAN_BOOST_HYST) * 1000);
> +=09return sysfs_emit(buf, "%d\n",
> +=09=09=09  therm->attr_get(therm, NVKM_THERM_ATTR_THRS_FAN_BOOST_HYST) *=
 1000);
>  }
>  static ssize_t
>  nouveau_hwmon_set_temp1_auto_point1_temp_hyst(struct device *d,

--=20
Cheers,
 Lyude Paul (she/her)
 Software Engineer at Red Hat

