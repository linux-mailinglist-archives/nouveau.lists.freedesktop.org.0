Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 94F2D729915
	for <lists+nouveau@lfdr.de>; Fri,  9 Jun 2023 14:09:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4918910E699;
	Fri,  9 Jun 2023 12:09:10 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 08B2210E694
 for <nouveau@lists.freedesktop.org>; Fri,  9 Jun 2023 12:09:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1686312547;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JZR6reQCNcnuFfexOGBu5QAKgIdPCDJoW0kdpvy5S78=;
 b=FgL+GMbx99llw55V9IJx3yEt2gX9QsOCpdkEmN2F634tHhGO95JOjrkpXM+cx9YcX+8mrr
 Kx8FU61W8fiYQpzNIc3jG8pXT/3mEAmuWAcDKqESZPfQVhkYNFaMcSAu3xJ+SvPDAvEUou
 OrAthAMdk6++4rFd3s8vRuEjFSjjea8=
Received: from mail-lj1-f200.google.com (mail-lj1-f200.google.com
 [209.85.208.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-302-gYuU9rLCNWWs7IehJWw7Nw-1; Fri, 09 Jun 2023 08:09:05 -0400
X-MC-Unique: gYuU9rLCNWWs7IehJWw7Nw-1
Received: by mail-lj1-f200.google.com with SMTP id
 38308e7fff4ca-2af1cf1a118so2388301fa.0
 for <nouveau@lists.freedesktop.org>; Fri, 09 Jun 2023 05:09:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686312544; x=1688904544;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=JZR6reQCNcnuFfexOGBu5QAKgIdPCDJoW0kdpvy5S78=;
 b=PBKBWvcLaW1SLNp489xeaFKFjjQnra5xtTMLQSJCETjPvRB3WkHcZ66PEa6GDEyepu
 BnGC3ULhuEyb/wrKFY8+36+tzBg+8TekqDIgzR9HouC2ySaIskHE9DyGqPDOAZRouvVe
 MfZcaon1NHy+Yih4VQAfkoJpVFUILsgx36XODh2xE9mRHWtP1FaW9fAGExmjs2KuiRW2
 RWS68NRcdYEKbnYcYZLXaNYBbaFOm/16ArhSQhgi5q6+wP/uYVCLyjwK7o6T1rjrA63k
 g+Zer58rfMgR6Y+T3maNLU7KCMMJHGK9TjKCFh5Pm2UCL0Ti3uatUSF2/ZydqMJHAc6E
 4qQQ==
X-Gm-Message-State: AC+VfDz30s7gJdf5Z3HWcLvrB529iFeVnMlq/vnzAeC3AZoilfC2Wjkg
 PehLZ1Hd1QjXmi5IK6vXpErpm5H3tIKYrVE67hU1n0xnFyVL3Hde++5mvmyNIAd6fejdz+LmKI/
 gVzVjpwiRQ5jEOYOaIkQBbD9Ty+M/8hbAWHM2FnHrFQ==
X-Received: by 2002:a2e:b5dc:0:b0:2b1:c184:9afe with SMTP id
 g28-20020a2eb5dc000000b002b1c1849afemr882678ljn.4.1686312544289; 
 Fri, 09 Jun 2023 05:09:04 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ5aYnP4o6U74L5gjhqD1XkB3Wdjtyd80ogwjUXJ8HiSsGCkFoeBk+bdCktf2s1Lm6D5wtU5M2VftptBu7vekhE=
X-Received: by 2002:a2e:b5dc:0:b0:2b1:c184:9afe with SMTP id
 g28-20020a2eb5dc000000b002b1c1849afemr882669ljn.4.1686312544004; Fri, 09 Jun
 2023 05:09:04 -0700 (PDT)
MIME-Version: 1.0
References: <20230609081732.3842341-1-lee@kernel.org>
 <20230609081732.3842341-9-lee@kernel.org>
In-Reply-To: <20230609081732.3842341-9-lee@kernel.org>
From: Karol Herbst <kherbst@redhat.com>
Date: Fri, 9 Jun 2023 14:08:53 +0200
Message-ID: <CACO55tt_ivgVYCbVpGRp4BcsC-CNB5i7Cy=wiMPKUSuXKsOgNg@mail.gmail.com>
To: Lee Jones <lee@kernel.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Subject: Re: [Nouveau] [RESEND 08/15] drm/nouveau/nvkm/subdev/volt/gk20a:
 Demote kerneldoc abuses
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
>  drivers/gpu/drm/nouveau/nvkm/subdev/volt/gk20a.c:49: warning: This comme=
nt starts with '/**', but isn't a kernel-doc comment. Refer Documentation/d=
oc-guide/kernel-doc.rst
>  drivers/gpu/drm/nouveau/nvkm/subdev/volt/gk20a.c:62: warning: This comme=
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
>  drivers/gpu/drm/nouveau/nvkm/subdev/volt/gk20a.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/volt/gk20a.c b/drivers/g=
pu/drm/nouveau/nvkm/subdev/volt/gk20a.c
> index 8c2faa9645111..ccac88da88648 100644
> --- a/drivers/gpu/drm/nouveau/nvkm/subdev/volt/gk20a.c
> +++ b/drivers/gpu/drm/nouveau/nvkm/subdev/volt/gk20a.c
> @@ -45,7 +45,7 @@ static const struct cvb_coef gk20a_cvb_coef[] =3D {
>         /* 852 */ { 1608418, -21643, -269,     0,    763,  -48},
>  };
>
> -/**
> +/*
>   * cvb_mv =3D ((c2 * speedo / s_scale + c1) * speedo / s_scale + c0)
>   */
>  static inline int
> @@ -58,7 +58,7 @@ gk20a_volt_get_cvb_voltage(int speedo, int s_scale, con=
st struct cvb_coef *coef)
>         return mv;
>  }
>
> -/**
> +/*
>   * cvb_t_mv =3D
>   * ((c2 * speedo / s_scale + c1) * speedo / s_scale + c0) +
>   * ((c3 * speedo / s_scale + c4 + c5 * T / t_scale) * T / t_scale)
> --
> 2.41.0.162.gfafddb0af9-goog
>

