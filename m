Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BA07891C539
	for <lists+nouveau@lfdr.de>; Fri, 28 Jun 2024 19:54:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C290A10ECE2;
	Fri, 28 Jun 2024 17:54:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="fdvNWfAs";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C04B10ECE1
 for <nouveau@lists.freedesktop.org>; Fri, 28 Jun 2024 17:54:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1719597295;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=iJtGhUgvUDUBCNqCRXiCweWqh3UEoqmmn+2NlVqrfuI=;
 b=fdvNWfAsButfc5JFMYgRMWt8Av3uXku6KtHGrmhiQH5suLcB16a0/Dq6ni+nICLGTodMcy
 HYliUSbD1F2Wv7k/oap4fFFLJ7hrhbLECKIwrGInJ2a4mK99VELtEZFdj9DAIpmrmpwGK2
 1qhHE+gRxyW3G1U3oKkzqaJE+xZXYbE=
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-142-zui7YlQ3NYekNZxI-dtZ3w-1; Fri, 28 Jun 2024 13:54:54 -0400
X-MC-Unique: zui7YlQ3NYekNZxI-dtZ3w-1
Received: by mail-qt1-f197.google.com with SMTP id
 d75a77b69052e-44645ec39d4so11855251cf.1
 for <nouveau@lists.freedesktop.org>; Fri, 28 Jun 2024 10:54:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719597293; x=1720202093;
 h=mime-version:user-agent:content-transfer-encoding:organization
 :references:in-reply-to:date:cc:to:from:subject:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=TB1YvVhQLn/H70Rr+uFCjpzP9CQR7nQAEPIty/GMlrU=;
 b=T6kUenODBVjhonD3fwWwhusW9EYUMvXSU8ctocn65Pc6k0J3ikCVlIdDeG/E6p+4Xn
 i6VGUtF1RsgkmzksYcd2n5ubBNCzKD/qL/q5X09T3RgfcDh40ZoCzekPRSxcN70/D70K
 AZIV0jevWG6bkPjY071mnskXDR+EJOajVHtANydRqr42s3K7+5qdKM5RO2VIgzw4AoJt
 pSKDJhlDcYyUvmSbXf7RE5lyJHp2UXgycgLuOfgq4p1hXDWkguME/w9BaGwmqMot4kV1
 AJ0WWwugvbZDmdnGDov5hKafxufB5Esjd2JojEH+znplSuHxXCP4d3u0QNmPGRhrYoWO
 VWDw==
X-Forwarded-Encrypted: i=1;
 AJvYcCX/7BzZn8WTyjjp5xl1d69hob9XeNytGO7LXuvt1QrsZU22diry88qpI/6Q6DbvpOHHn8wuZIp2XlhgfHgQqGQqxmlCaz65F08uqGvWKw==
X-Gm-Message-State: AOJu0Yyqss9nTHdnmep6FOK3k8ksqaAldAjg0yyPGsKmRlpHRQh65Wwe
 /sC4O96oUlrJ+uMp3/nlQbiPmnii90dIMieMC8Gma7P1MmPRXcwA/tj9yygKsSGaT+6S71ALmks
 ZLev8QUz6e1G711IYlP2tifAIVGotalrYBVie4SARsF6kbfcE7usrNvfYvgMyGhA=
X-Received: by 2002:ac8:5a15:0:b0:43d:e4c8:8059 with SMTP id
 d75a77b69052e-444d92335aamr216984631cf.38.1719597292938; 
 Fri, 28 Jun 2024 10:54:52 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHliaKczNq59esZ7bbqWZZwIg7BK0Qk7e2Vg6tc6pE8nfO36/kFIUgUN4o6+qKPkamp6yxIxA==
X-Received: by 2002:ac8:5a15:0:b0:43d:e4c8:8059 with SMTP id
 d75a77b69052e-444d92335aamr216984461cf.38.1719597292583; 
 Fri, 28 Jun 2024 10:54:52 -0700 (PDT)
Received: from chopper.lyude.net ([2600:4040:5c4c:a000::789])
 by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-44651428177sm9074601cf.40.2024.06.28.10.54.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Jun 2024 10:54:52 -0700 (PDT)
Message-ID: <c7f963fa69a8bff65c54dbacad4c890ce26f57a4.camel@redhat.com>
Subject: Re: [PATCH v2] drm/nouveau: fix null pointer dereference in
 nouveau_connector_get_modes
From: Lyude Paul <lyude@redhat.com>
To: Ma Ke <make24@iscas.ac.cn>, kherbst@redhat.com, dakr@redhat.com, 
 airlied@gmail.com, daniel@ffwll.ch, airlied@redhat.com, bskeggs@redhat.com
Cc: dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org
Date: Fri, 28 Jun 2024 13:54:51 -0400
In-Reply-To: <20240627022732.2978601-1-make24@iscas.ac.cn>
References: <20240627022732.2978601-1-make24@iscas.ac.cn>
Organization: Red Hat Inc.
User-Agent: Evolution 3.52.2 (3.52.2-1.fc40)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
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

Reviewed-by: Lyude Paul <lyude@redhat.com>

Will push this upstream in just a moment, thanks!

On Thu, 2024-06-27 at 10:27 +0800, Ma Ke wrote:
> In nouveau_connector_get_modes(), the return value of
> drm_mode_duplicate()
> is assigned to mode, which will lead to a possible NULL pointer
> dereference on failure of drm_mode_duplicate(). Add a check to avoid
> npd.
>=20
> Fixes: 6ee738610f41 ("drm/nouveau: Add DRM driver for NVIDIA GPUs")
> Signed-off-by: Ma Ke <make24@iscas.ac.cn>
> ---
> Changes in v2:
> - modified the patch according to suggestions.
> ---
> =C2=A0drivers/gpu/drm/nouveau/nouveau_connector.c | 3 +++
> =C2=A01 file changed, 3 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/nouveau/nouveau_connector.c
> b/drivers/gpu/drm/nouveau/nouveau_connector.c
> index 856b3ef5edb8..0c71d761d378 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_connector.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_connector.c
> @@ -1001,6 +1001,9 @@ nouveau_connector_get_modes(struct
> drm_connector *connector)
> =C2=A0=09=09struct drm_display_mode *mode;
> =C2=A0
> =C2=A0=09=09mode =3D drm_mode_duplicate(dev, nv_connector-
> >native_mode);
> +=09=09if (!mode)
> +=09=09=09return 0;
> +
> =C2=A0=09=09drm_mode_probed_add(connector, mode);
> =C2=A0=09=09ret =3D 1;
> =C2=A0=09}

--=20
Cheers,
 Lyude Paul (she/her)
 Software Engineer at Red Hat

