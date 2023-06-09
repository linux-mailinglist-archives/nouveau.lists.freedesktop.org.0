Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2081872991D
	for <lists+nouveau@lfdr.de>; Fri,  9 Jun 2023 14:10:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8BF9810E6A5;
	Fri,  9 Jun 2023 12:10:00 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE74B10E6A2
 for <nouveau@lists.freedesktop.org>; Fri,  9 Jun 2023 12:09:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1686312597;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8K8zOc2VRoAIFNnTvussYfo75dEOYDyNWNKLCNNQoBA=;
 b=S+RSh4fjb9FJoLZpieG2dMjd0gg3po2JsgceZxZCkEjR7dC6OV2/ibxa3fPtHAZdkQ0C5M
 hBunSRcZE/4nMH+xXA9oPzFfD/nmkphGDytTdbOlMFRwuKJPXeynhMJlGCWtC1DLLwTpGE
 eOEKbP59uT5ULVU0//jUChxwR9OoZYE=
Received: from mail-lj1-f197.google.com (mail-lj1-f197.google.com
 [209.85.208.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-615-twsSKDNHMCeo36nYU5j02g-1; Fri, 09 Jun 2023 08:09:56 -0400
X-MC-Unique: twsSKDNHMCeo36nYU5j02g-1
Received: by mail-lj1-f197.google.com with SMTP id
 38308e7fff4ca-2b1b8ec9343so2387331fa.1
 for <nouveau@lists.freedesktop.org>; Fri, 09 Jun 2023 05:09:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686312595; x=1688904595;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=8K8zOc2VRoAIFNnTvussYfo75dEOYDyNWNKLCNNQoBA=;
 b=ECp1FGSVQkDFm9F3HyK33jmFD06QO57obL8hi++RN2q6z9CtUOq2Uy9tWmOK/1vKUo
 SleUbFxcpl1IL0mPHFhhwararys2zItX1rRjnEWgswxSNj7XO7MQ1BB5uwK3yFSnCUYC
 lb7Z+S/bSX3f5+iCXNfLJIYSIauttjBCzd63158jIvLHmmFVAIyddbUsFfgJPvvX8uhh
 a2uy6cma8WrBpSQthq9FE4N3p9nTb/OHg9ZajY9FyMTeCnma8Ny1me5+PhSKC/TxWxOH
 pYcn8AGFjvGVxbnQBr1U/1i+YdBfKL3EjzFrtkmWULbGwgKo36c61EeZtBNG1HZIhOkJ
 YnwA==
X-Gm-Message-State: AC+VfDzOeuLntm0Ar5eMTSt+NxIRgkbU5FjK+aAXy8+z2rRbC7tY+uDu
 9st/jZlxkidyNPAhJbRjF3Nuy60/XbQQuNGlJ0IcAE3zHGHl1BBWEOoOLOULa1vFRY4jtCebc6/
 k2IfweY3OmKoCxQFXkYj6t40hDshLSwuRF1LlS07oZQ==
X-Received: by 2002:a2e:b108:0:b0:2b1:dc69:67fd with SMTP id
 p8-20020a2eb108000000b002b1dc6967fdmr808629ljl.5.1686312594959; 
 Fri, 09 Jun 2023 05:09:54 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ5x4JIMK1TQ12rpra/mBTbK0YAIXvw7OKgm1UtrERedLpibE3QvP+XQvRXtwHvlv51+JuJjz8J+mA4OusmOEjA=
X-Received: by 2002:a2e:b108:0:b0:2b1:dc69:67fd with SMTP id
 p8-20020a2eb108000000b002b1dc6967fdmr808618ljl.5.1686312594802; Fri, 09 Jun
 2023 05:09:54 -0700 (PDT)
MIME-Version: 1.0
References: <20230609081732.3842341-1-lee@kernel.org>
 <20230609081732.3842341-13-lee@kernel.org>
In-Reply-To: <20230609081732.3842341-13-lee@kernel.org>
From: Karol Herbst <kherbst@redhat.com>
Date: Fri, 9 Jun 2023 14:09:43 +0200
Message-ID: <CACO55tsP+FgJRSZS0gEVpOFx-GgNhGA3kr6KLvURVgmpEmWrFA@mail.gmail.com>
To: Lee Jones <lee@kernel.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Subject: Re: [Nouveau] [RESEND 12/15] drm/nouveau/dispnv04/crtc: Demote
 kerneldoc abuses
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
>  drivers/gpu/drm/nouveau/dispnv04/crtc.c:453: warning: This comment start=
s with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide=
/kernel-doc.rst
>  drivers/gpu/drm/nouveau/dispnv04/crtc.c:629: warning: This comment start=
s with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide=
/kernel-doc.rst
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
>  drivers/gpu/drm/nouveau/dispnv04/crtc.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/nouveau/dispnv04/crtc.c b/drivers/gpu/drm/no=
uveau/dispnv04/crtc.c
> index a6f2e681bde98..7794902df17d5 100644
> --- a/drivers/gpu/drm/nouveau/dispnv04/crtc.c
> +++ b/drivers/gpu/drm/nouveau/dispnv04/crtc.c
> @@ -449,7 +449,7 @@ nv_crtc_mode_set_vga(struct drm_crtc *crtc, struct dr=
m_display_mode *mode)
>         regp->Attribute[NV_CIO_AR_CSEL_INDEX] =3D 0x00;
>  }
>
> -/**
> +/*
>   * Sets up registers for the given mode/adjusted_mode pair.
>   *
>   * The clocks, CRTCs and outputs attached to this CRTC must be off.
> @@ -625,7 +625,7 @@ nv_crtc_swap_fbs(struct drm_crtc *crtc, struct drm_fr=
amebuffer *old_fb)
>         return ret;
>  }
>
> -/**
> +/*
>   * Sets up registers for the given mode/adjusted_mode pair.
>   *
>   * The clocks, CRTCs and outputs attached to this CRTC must be off.
> --
> 2.41.0.162.gfafddb0af9-goog
>

