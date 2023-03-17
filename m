Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 541976BEAC6
	for <lists+nouveau@lfdr.de>; Fri, 17 Mar 2023 15:12:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8841F10E385;
	Fri, 17 Mar 2023 14:12:45 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A98210E395
 for <nouveau@lists.freedesktop.org>; Fri, 17 Mar 2023 14:12:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1679062363;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=yp87O6wnvt7RQSGAMv2L+yB9U1AJut+1ZDcle+GOMDo=;
 b=LdiD3GL/kvsiswZ3kGX3G13/6xgBGnOt2X0UnkAITNPuIQVKjit/AHukV2P2nhzfu6oKFn
 qdaBz07VAYibIDvrxjeTS4MMJRDu2J2yVDhf7S/40X+HucJ78tqil3CXCVT58RdW27yzrJ
 3/y4HxIWkEIV4ByWeS561BQYJz41OoQ=
Received: from mail-lf1-f70.google.com (mail-lf1-f70.google.com
 [209.85.167.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-410-Oc3uY24UNG2REgbU1FrOmw-1; Fri, 17 Mar 2023 10:12:40 -0400
X-MC-Unique: Oc3uY24UNG2REgbU1FrOmw-1
Received: by mail-lf1-f70.google.com with SMTP id
 e9-20020a196909000000b004cca10c5ae6so2088418lfc.9
 for <nouveau@lists.freedesktop.org>; Fri, 17 Mar 2023 07:12:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679062358;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=yp87O6wnvt7RQSGAMv2L+yB9U1AJut+1ZDcle+GOMDo=;
 b=qjoGpZTfGakzKXnCq2AU/HNuJ7Vf1O34az+5gRqJ8cA24W/OgTb6F1RlKViO0/TycV
 sulCBF6CJfs2AFWGxJIyen5GnwQ6+5qQFL9TLUA+8RGs6x1eNlRkc1AVTkaVAdI8ItbF
 g4h3TrvmAUi3yIOh5V0oV1QwoF6IBjzZNKovkpdemFypJFVPqcUtzN2Fytkb6grgMLdJ
 R71k0ChN/E3CCHZ87FvQNykDDJcnTlSn8E042CmS3AWLtrI860Paxxf+1zsbb3n+6ycg
 9Qr/ZNp5bm9ATpCJuJGu3fDD7GXXN/zg9zY31MvwjjypPRGNKAVYyM0kFUnDu6AOBcP6
 5ZvA==
X-Gm-Message-State: AO0yUKU2NZg++vOhrh8FmoNe/nuWJ8YoMEwxtIqzd8lj95DyCDHTwGpt
 3zXyS6u+sz2Ynu3dk2TaYZ5JmmY2gT2AQOSvMbS+plbrObq7t4IP7ZljNBOn+2jyu2OIBu8ZyUC
 Cc4hR2t2anwW95ax+jU7PoyFm4uBRSldwbVzQt2M6lw==
X-Received: by 2002:ac2:5f0e:0:b0:4dd:a9e5:aa09 with SMTP id
 14-20020ac25f0e000000b004dda9e5aa09mr4264613lfq.11.1679062358652; 
 Fri, 17 Mar 2023 07:12:38 -0700 (PDT)
X-Google-Smtp-Source: AK7set+gife62n4XCWkrR4+tagPTjJbFZJF9q30pel5qgQh2IP2UWNPkn6gpFTJqvxpuh0cZgm/VqXngWGM2qrRSjIk=
X-Received: by 2002:ac2:5f0e:0:b0:4dd:a9e5:aa09 with SMTP id
 14-20020ac25f0e000000b004dda9e5aa09mr4264607lfq.11.1679062358352; Fri, 17 Mar
 2023 07:12:38 -0700 (PDT)
MIME-Version: 1.0
References: <20230317081718.2650744-1-lee@kernel.org>
 <20230317081718.2650744-32-lee@kernel.org>
In-Reply-To: <20230317081718.2650744-32-lee@kernel.org>
From: Karol Herbst <kherbst@redhat.com>
Date: Fri, 17 Mar 2023 15:12:26 +0100
Message-ID: <CACO55ttNWZ8=Ma4m+-zFP3yAPpHYqsq3QF6fCd4jYpEK6uwypg@mail.gmail.com>
To: Lee Jones <lee@kernel.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Subject: Re: [Nouveau] [PATCH 31/37] drm/nouveau/dispnv04/crtc: Demote
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
 dri-devel@lists.freedesktop.org, Ben Skeggs <bskeggs@redhat.com>
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

nouveau changes up to here are:

Reviewed-by: Karol Herbst <kherbst@redhat.com>

On Fri, Mar 17, 2023 at 9:23=E2=80=AFAM Lee Jones <lee@kernel.org> wrote:
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
> 2.40.0.rc1.284.g88254d51c5-goog
>

