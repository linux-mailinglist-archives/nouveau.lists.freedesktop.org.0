Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 28653786A54
	for <lists+nouveau@lfdr.de>; Thu, 24 Aug 2023 10:42:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A21E10E505;
	Thu, 24 Aug 2023 08:42:20 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B793F10E4BC
 for <nouveau@lists.freedesktop.org>; Thu, 24 Aug 2023 08:42:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1692866537;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zbW1FngvFUK7KWlxfPdST+Zwcl1JxZSoJl2PteoHaDs=;
 b=ZGw6PVEkyoEtIgDHELSkeKEC2z2gyYTFbACQ3rPa8K6C1MG6DZ/BGwCIKyjFxd/02Kw066
 b8yY4X49ZmM+rG5vcwJoPigXhh37rhTiAAcjL5014ajps5Paf9HPul/NjiqZRDNX9kk2O8
 zbxpMh4VojN102Lz5QbkIiEH7RzyrY8=
Received: from mail-lj1-f199.google.com (mail-lj1-f199.google.com
 [209.85.208.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-341-mAX0ifYmMZmS7tIOThQpWg-1; Thu, 24 Aug 2023 04:42:15 -0400
X-MC-Unique: mAX0ifYmMZmS7tIOThQpWg-1
Received: by mail-lj1-f199.google.com with SMTP id
 38308e7fff4ca-2bbafb70ecbso14129621fa.0
 for <nouveau@lists.freedesktop.org>; Thu, 24 Aug 2023 01:42:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692866533; x=1693471333;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=zbW1FngvFUK7KWlxfPdST+Zwcl1JxZSoJl2PteoHaDs=;
 b=IaTZyCXgs4wt+gmUtpcM4LDaBas2GNAKf4bM9EOQ71MyQ6AlGqEbzL3gfSGpjvvqBZ
 262BOJUQ/2PowCCIhHUbAsNavVEYExQP25uyhmtaOLu5FuGqDAUEu6wU5mDy+bS0yq2h
 G1yvPsJkXevEflnarWxnQ5L+7luT3lQ2XiEXI/XOR9dZiBMwn68uJpUSrmWt5ow1hIkJ
 +ZcNaobMYVdDClO9btamnVb5ADzfM8GCAmBShGCPsb77tW1v3w2XDJDDcS8YOtAb6N+9
 CbovryhJqLs4GFJAG/bNFv3xA/bVzCNQGobU+QaEA0Ta67rh9VZiNY1aqQFQsbUMSuGl
 SWKg==
X-Gm-Message-State: AOJu0YwAyvYTCFzRYnJwRWQsR7VHIf60j8D05RFjm+O4TCNr/D2K/Uu4
 oRfjV3JHdxoQ0zWKu/vBOn47JGzgaMXuFU4yeUx+8vUvx9yCvU6PTa4Xse6CnLtLSeEJNnsoXlr
 kVIgclk2PzbguMofN6QQuFs6VTfyPsR01GP6BTpYQDQ==
X-Received: by 2002:a05:651c:102f:b0:2b7:34c0:a03a with SMTP id
 w15-20020a05651c102f00b002b734c0a03amr10216703ljm.3.1692866533700; 
 Thu, 24 Aug 2023 01:42:13 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IElJNjBNGCil9PiBaG5sCBxmyOojBV3da4X7jH+b9AMAG6B3VNG1VxewojaAZwNQ4H48vofhmQ8taWfMFeXp1c=
X-Received: by 2002:a05:651c:102f:b0:2b7:34c0:a03a with SMTP id
 w15-20020a05651c102f00b002b734c0a03amr10216692ljm.3.1692866533551; Thu, 24
 Aug 2023 01:42:13 -0700 (PDT)
MIME-Version: 1.0
References: <20230824073710.2677348-1-lee@kernel.org>
 <20230824073710.2677348-7-lee@kernel.org>
In-Reply-To: <20230824073710.2677348-7-lee@kernel.org>
From: Karol Herbst <kherbst@redhat.com>
Date: Thu, 24 Aug 2023 10:42:02 +0200
Message-ID: <CACO55ttW6gmTLNOW+Ty34s77yOBw-FhL6gWZnuXYqQYjw4WxOQ@mail.gmail.com>
To: Lee Jones <lee@kernel.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Subject: Re: [Nouveau] [PATCH 06/20] drm/nouveau/dispnv04/crtc: Demote
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

On Thu, Aug 24, 2023 at 9:37=E2=80=AFAM Lee Jones <lee@kernel.org> wrote:
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
> Signed-off-by: Lee Jones <lee@kernel.org>
> ---
> Cc: Ben Skeggs <bskeggs@redhat.com>
> Cc: Karol Herbst <kherbst@redhat.com>
> Cc: Lyude Paul <lyude@redhat.com>
> Cc: David Airlie <airlied@gmail.com>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: dri-devel@lists.freedesktop.org
> Cc: nouveau@lists.freedesktop.org
> ---
>  drivers/gpu/drm/nouveau/dispnv04/crtc.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/nouveau/dispnv04/crtc.c b/drivers/gpu/drm/no=
uveau/dispnv04/crtc.c
> index a34924523133c..5454dbb669566 100644
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
> 2.42.0.rc1.204.g551eb34607-goog
>

Reviewed-by: Karol Herbst <kherbst@redhat.com>

