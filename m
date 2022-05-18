Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DF0352C10A
	for <lists+nouveau@lfdr.de>; Wed, 18 May 2022 19:40:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A335113E81;
	Wed, 18 May 2022 17:40:01 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C561113EA2
 for <nouveau@lists.freedesktop.org>; Wed, 18 May 2022 17:40:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652895599;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gDGt/Rg9AZsxvRBAhR5KeMESGNTYZAfpSxQWVhbVFk4=;
 b=Q2tJzjFsDNMkrOTp8LhnZAFFhb0bVFix9Za9V5pbLrd8jvW1Yfg3Xeq7angyB6GCGboo9X
 B/aOGSrUEZoYgCsacyjMpfZbSMW6QTDuZq55QMtv5sMZPUGlYrGTu/x8WNwP0bl4TcbIkK
 f0ZeQqv8I1nI44gEyDd/UXb55R51JZ0=
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com
 [209.85.217.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-556-pp6kEyCMNo2IS-KVI5uTdA-1; Wed, 18 May 2022 13:39:56 -0400
X-MC-Unique: pp6kEyCMNo2IS-KVI5uTdA-1
Received: by mail-vs1-f71.google.com with SMTP id
 x13-20020a67eb4d000000b00335c7ac50b1so316961vso.9
 for <nouveau@lists.freedesktop.org>; Wed, 18 May 2022 10:39:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:organization:user-agent:mime-version
 :content-transfer-encoding;
 bh=gDGt/Rg9AZsxvRBAhR5KeMESGNTYZAfpSxQWVhbVFk4=;
 b=wmJC2MlbJKJGpxPh6HEXbJljSXKTvuLXuK/aJfHvHN45tiNI5y1UpKuhXsdZFW/z9R
 /Y3niPub+m9RiMxg74/U4xXJudx+jwJw9Lw3rQv8YYZeEsM2UTm9+kBEzcy37L2wekbA
 YPqRtqD8FRBns3a5/Di6AwrgMaFVRXLxGDkGSBHce1JAigJPwdyPmX/PMZj98xc3pSOl
 MY6dfi/sDdX/hkP+qqm+nJc9QOA5uFJSGM1XE7ZDeBBdjm4pXnhUJHWE/pBy3MxDvq+S
 frCq9O+4CG5rugLPeD3JZnn7W05jQbGDWL+m1i6Xl07W80FOVl4QGb0ktayO5TMn9Xu5
 AwXQ==
X-Gm-Message-State: AOAM531kUP/04ynbW4FHo+RFLSr1GED/TOCdMphsbJyj7H0Zgi5XHQAb
 4sMS/8a8OzdFamP16qDXJCsdrj8Q3ZI0VyPM0APLDCJvejUvokt3KSe5X8Dz0ni7zTKXYOYR9Ry
 uN8H7G4/Dx7+TVLkXSTcuJ70/cw==
X-Received: by 2002:a05:6102:3706:b0:335:80be:bdf8 with SMTP id
 s6-20020a056102370600b0033580bebdf8mr527620vst.17.1652895595676; 
 Wed, 18 May 2022 10:39:55 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy+wcU/dWMJlXfe/1930TJzCPdcc6Su+ICGYsTy4q9ZBSUQnSN+lF31nL1TGBauw8+rrCkI6g==
X-Received: by 2002:a05:6102:3706:b0:335:80be:bdf8 with SMTP id
 s6-20020a056102370600b0033580bebdf8mr527593vst.17.1652895595399; 
 Wed, 18 May 2022 10:39:55 -0700 (PDT)
Received: from [192.168.8.138] (static-71-184-137-158.bstnma.ftas.verizon.net.
 [71.184.137.158]) by smtp.gmail.com with ESMTPSA id
 143-20020a1f1995000000b0034e6f1fd055sm246132vkz.31.2022.05.18.10.39.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 May 2022 10:39:54 -0700 (PDT)
Message-ID: <0c9c2c59ca9c351769921c47beb49dda79ddd5de.camel@redhat.com>
From: Lyude Paul <lyude@redhat.com>
To: Hans de Goede <hdegoede@redhat.com>, Ben Skeggs <bskeggs@redhat.com>, 
 Karol Herbst <kherbst@redhat.com>, Daniel Dadap <ddadap@nvidia.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>,  Thomas Zimmermann <tzimmermann@suse.de>, Jani Nikula
 <jani.nikula@linux.intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>, 
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>, Alex Deucher
 <alexander.deucher@amd.com>, Christian =?ISO-8859-1?Q?K=F6nig?=
 <christian.koenig@amd.com>, "Pan, Xinhui" <Xinhui.Pan@amd.com>, Xinhui
 <Xinhui.Pan@amd.com>, "Rafael J . Wysocki" <rafael@kernel.org>, Mika
 Westerberg <mika.westerberg@linux.intel.com>, Mark Gross
 <markgross@kernel.org>, Andy Shevchenko <andy@kernel.org>
Date: Wed, 18 May 2022 13:39:52 -0400
In-Reply-To: <20220517152331.16217-13-hdegoede@redhat.com>
References: <20220517152331.16217-1-hdegoede@redhat.com>
 <20220517152331.16217-13-hdegoede@redhat.com>
Organization: Red Hat Inc.
User-Agent: Evolution 3.42.4 (3.42.4-2.fc35)
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lyude@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Subject: Re: [Nouveau] [PATCH 12/14] drm/nouveau: Register ACPI video
 backlight when nv_backlight registration fails
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
Cc: David Airlie <airlied@linux.ie>, nouveau@lists.freedesktop.org,
 intel-gfx <intel-gfx@lists.freedesktop.org>, amd-gfx@lists.freedesktop.org,
 platform-driver-x86@vger.kernel.org, linux-acpi@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Daniel Vetter <daniel@ffwll.ch>,
 Len Brown <lenb@kernel.org>
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

On Tue, 2022-05-17 at 17:23 +0200, Hans de Goede wrote:
> Typically the acpi_video driver will initialize before nouveau, which
> used to cause /sys/class/backlight/acpi_video0 to get registered and then
> nouveau would register its own nv_backlight device later. After which
> the drivers/acpi/video_detect.c code unregistered the acpi_video0 device
> to avoid there being 2 backlight devices.
> 
> This means that userspace used to briefly see 2 devices and the
> disappearing of acpi_video0 after a brief time confuses the systemd
> backlight level save/restore code, see e.g.:
> https://bbs.archlinux.org/viewtopic.php?id=269920
> 
> To fix this the ACPI video code has been modified to make backlight class
> device registration a separate step, relying on the drm/kms driver to
> ask for the acpi_video backlight registration after it is done setting up
> its native backlight device.
> 
> Add a call to the new acpi_video_register_backlight() when native backlight
> device registration has failed / was skipped to ensure that there is a
> backlight device available before the drm_device gets registered with
> userspace.
> 
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> ---
>  drivers/gpu/drm/nouveau/nouveau_backlight.c | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/drivers/gpu/drm/nouveau/nouveau_backlight.c
> b/drivers/gpu/drm/nouveau/nouveau_backlight.c
> index f56ff797c78c..0ae8793357a4 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_backlight.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_backlight.c
> @@ -436,6 +436,13 @@ nouveau_backlight_init(struct drm_connector *connector)
>  
>  fail_alloc:
>         kfree(bl);
> +       /*
> +        * If we get here we have an internal panel, but no nv_backlight,
> +        * try registering an ACPI video backlight device instead.
> +        */
> +       if (ret == 0)
> +               acpi_video_register_backlight();

Assuming we don't need to return the value of acpi_video_register_backlight()
here:

Reviewed-by: Lyude Paul <lyude@redhat.com>

> +
>         return ret;
>  }
>  

-- 
Cheers,
 Lyude Paul (she/her)
 Software Engineer at Red Hat

