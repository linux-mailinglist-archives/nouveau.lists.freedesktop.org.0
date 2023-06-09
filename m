Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A213729918
	for <lists+nouveau@lfdr.de>; Fri,  9 Jun 2023 14:09:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A06610E69C;
	Fri,  9 Jun 2023 12:09:45 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1CB6E10E69C
 for <nouveau@lists.freedesktop.org>; Fri,  9 Jun 2023 12:09:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1686312570;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NeKki35R3nHZloLkDG1ZCPTX7wZF5l/41ruoekgsNnQ=;
 b=XkY5VD8TY5RgCEosYbVK5IC2ZDBZSWx7MbmKe6W65FKhbaZhyUFshn3DBmz6YXTgF7lRZ4
 QaNcEonUhV5q0UUF/rMwX3z8nYHUZEVx3FFjO0zpBI35OLpNsdjanXnizhvITPR0HfDwRX
 HOsLfHOKOooGYahg0t2n+j65wqsR8Co=
Received: from mail-lf1-f70.google.com (mail-lf1-f70.google.com
 [209.85.167.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-490-k5bSilU4MB2MQeaKOrd6Tg-1; Fri, 09 Jun 2023 08:09:21 -0400
X-MC-Unique: k5bSilU4MB2MQeaKOrd6Tg-1
Received: by mail-lf1-f70.google.com with SMTP id
 2adb3069b0e04-4f630005028so333798e87.0
 for <nouveau@lists.freedesktop.org>; Fri, 09 Jun 2023 05:09:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686312560; x=1688904560;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=NeKki35R3nHZloLkDG1ZCPTX7wZF5l/41ruoekgsNnQ=;
 b=VPcH5dnd4owNSydLOfUQ9rg9LqIjSQ9wY6vieW+CSzwlCZcFn4YlHX3DJiOjNp5wn5
 PKpkuJjfvTO1fD7mo7MgwmY+qyxZZbaY4cU1lKRrAOtewYNRGSBa32nc1YilCNc6mXWR
 yMUPRsaBCEEtZ5yUWoCl3qKlPXVrq6zrBzYcy1z3tNY7FGd5L5BAlUl7vyJS4YNAYE9S
 HBTLK3OujCn+8dBKb/2iV9CtvR9bXX5VS9hj6MfKMfoKvlcxHWvuWaLp3Y1TGIwEw3V4
 8u73+b/VmNCzcGKzF6ExKD/LSxPEfd2J4GL9GXdT7wenuNbN5h5Uf8gMtX1ipfahDJzy
 SYBQ==
X-Gm-Message-State: AC+VfDxFTLng/HgITKhtTe2l9m5rnFX+qxcuYJtI3n33kbjuoQSDjeiT
 9NwqiRMQAtfGa4/Z+S8UIJDRbLLUugHJxka3aDakegexhTTc1pOPF3lJRX46Au/RXaGY7+aFUle
 RJvDF1rmoGKOmC3scSU15IA39Xlq35qor2zNTjAVp+g==
X-Received: by 2002:a2e:b10a:0:b0:2b1:dc69:67fa with SMTP id
 p10-20020a2eb10a000000b002b1dc6967famr905443ljl.0.1686312560207; 
 Fri, 09 Jun 2023 05:09:20 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ4sGvitz6MAqdd6tZ18gCtAtzFKKnM7SaCsBhMqHlpY5riWAgGlYFCIjNbTYVkKWuGGwpXgGW07vlqLixzWvUU=
X-Received: by 2002:a2e:b10a:0:b0:2b1:dc69:67fa with SMTP id
 p10-20020a2eb10a000000b002b1dc6967famr905434ljl.0.1686312559950; Fri, 09 Jun
 2023 05:09:19 -0700 (PDT)
MIME-Version: 1.0
References: <20230609081732.3842341-1-lee@kernel.org>
 <20230609081732.3842341-10-lee@kernel.org>
In-Reply-To: <20230609081732.3842341-10-lee@kernel.org>
From: Karol Herbst <kherbst@redhat.com>
Date: Fri, 9 Jun 2023 14:09:09 +0200
Message-ID: <CACO55ttX2efbweyUMoTQj4_aCmT6z_ke4_0vScoYUjtrzSaprw@mail.gmail.com>
To: Lee Jones <lee@kernel.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Subject: Re: [Nouveau] [RESEND 09/15] drm/nouveau/nvkm/engine/gr/gf100:
 Demote kerneldoc abuse
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
 dri-devel@lists.freedesktop.org, Ben Skeggs <bskeggs@redhat.com>,
 Daniel Vetter <daniel@ffwll.ch>
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

On Fri, Jun 9, 2023 at 10:18=E2=80=AFAM Lee Jones <lee@kernel.org> wrote:
>
> Fixes the following W=3D1 kernel build warning(s):
>
>  drivers/gpu/drm/nouveau/nvkm/engine/gr/gf100.c:1044: warning: This comme=
nt starts with '/**', but isn't a kernel-doc comment. Refer Documentation/d=
oc-guide/kernel-doc.rst
>
> Cc: Ben Skeggs <bskeggs@redhat.com>
> Cc: Karol Herbst <kherbst@redhat.com>
> Cc: Lyude Paul <lyude@redhat.com>
> Cc: David Airlie <airlied@gmail.com>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: dri-devel@lists.freedesktop.org
> Cc: nouveau@lists.freedesktop.org
> Signed-off-by: Lee Jones <lee@kernel.org>

Reviewed-by: Karol Herbst <kherbst@redhat.com>

> ---
>  drivers/gpu/drm/nouveau/nvkm/engine/gr/gf100.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/gr/gf100.c b/drivers/gpu=
/drm/nouveau/nvkm/engine/gr/gf100.c
> index 5f20079c3660f..7d4c2264d3c05 100644
> --- a/drivers/gpu/drm/nouveau/nvkm/engine/gr/gf100.c
> +++ b/drivers/gpu/drm/nouveau/nvkm/engine/gr/gf100.c
> @@ -1040,7 +1040,7 @@ gf100_gr_zbc_init(struct gf100_gr *gr)
>         }
>  }
>
> -/**
> +/*
>   * Wait until GR goes idle. GR is considered idle if it is disabled by t=
he
>   * MC (0x200) register, or GR is not busy and a context switch is not in
>   * progress.
> --
> 2.41.0.162.gfafddb0af9-goog
>

