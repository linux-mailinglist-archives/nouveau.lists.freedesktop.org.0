Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D2C6C754547
	for <lists+nouveau@lfdr.de>; Sat, 15 Jul 2023 01:07:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C0FB10E07D;
	Fri, 14 Jul 2023 23:07:18 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED84210E07D
 for <nouveau@lists.freedesktop.org>; Fri, 14 Jul 2023 23:07:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1689376034;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pqDiqY4N3zDWFlHFUlK8i/J+HIGUbJcqEkShbsY9GIc=;
 b=f9et3qhpSwLrtPcgCY38XnaG/DuBMVVRKerQVi8WgEQUliqz+1ZUUOQJJN89xOTSFWudI5
 c0YQILwGVvkzu4fAklrjI7ltP9dh7bF/luHDwxJHqPhUy0MPaBQrMGR2p/rKxBT+AzIIOL
 n7Bq8G/Sh+5SPjGz7XkDwCrkAhmUQyM=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-300-mWZOWp8bNnayJVnIpLe0Rw-1; Fri, 14 Jul 2023 19:07:13 -0400
X-MC-Unique: mWZOWp8bNnayJVnIpLe0Rw-1
Received: by mail-qv1-f71.google.com with SMTP id
 6a1803df08f44-635e0889cc5so24776236d6.2
 for <nouveau@lists.freedesktop.org>; Fri, 14 Jul 2023 16:07:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689376032; x=1691968032;
 h=mime-version:user-agent:content-transfer-encoding:organization
 :references:in-reply-to:date:cc:to:from:subject:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=pqDiqY4N3zDWFlHFUlK8i/J+HIGUbJcqEkShbsY9GIc=;
 b=FDE4ygVEAlmwgvLFQOcVsUpvbxx1Ke2PHobH8OmYjn0vMPKu9axASaCjWKZOyAxw31
 jvfPg6sryyfZmiskucDQR2c6PN8tU/RwE5r4Lak+uRYnbnQprrh6XFTe0gvFPrXgepg9
 L35feRXZiOIqQKNf3J6Dq+XkV3rJX9kEss8DxQVSLrL44ZNilhYsOTd5EtGhwwhEVKV6
 64K0kFXnfTBMDLdTmUaGJlfi9YnyoVX8hyMnbTrXv0k6g+4EuZhJF7eFDB72XrOfsn0e
 RXNgefDmEO0RJwXwuH6A5tL+1sPX8VVv17+D0YDFe2JPdlGXGcRQ0/ez4/9aoPf3E1RL
 k7sA==
X-Gm-Message-State: ABy/qLb+3sw/++tRsImY9NyNBYj1OYA/0LyKYSTXE/8GRtPssvu8SZNj
 E42GR7BZtR1vAtR5LChh5kRG51LTTi3eRgUXWRWDyG8wwAvRtzJu6i5IQQSRsVixDYFgI/eKXyu
 itMSvaw9oDOM5+p3oGh/GZu4sUg==
X-Received: by 2002:a05:622a:11ca:b0:400:91d8:a704 with SMTP id
 n10-20020a05622a11ca00b0040091d8a704mr8261748qtk.47.1689376032712; 
 Fri, 14 Jul 2023 16:07:12 -0700 (PDT)
X-Google-Smtp-Source: APBJJlFEDeUJQAf5GAAHKm0EYcAKtwaaDfwtH7D7qV8NAv+bu8ED8AvVMP5+iouCbmTPPgwbpF9k0w==
X-Received: by 2002:a05:622a:11ca:b0:400:91d8:a704 with SMTP id
 n10-20020a05622a11ca00b0040091d8a704mr8261731qtk.47.1689376032460; 
 Fri, 14 Jul 2023 16:07:12 -0700 (PDT)
Received: from ?IPv6:2600:4040:5c62:8200::feb? ([2600:4040:5c62:8200::feb])
 by smtp.gmail.com with ESMTPSA id
 x24-20020ac87318000000b00402364e77dcsm4334646qto.7.2023.07.14.16.07.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 Jul 2023 16:07:11 -0700 (PDT)
Message-ID: <856d1130fad58062ea454da297fa64348382bda2.camel@redhat.com>
From: Lyude Paul <lyude@redhat.com>
To: huzhi001@208suo.com, bskeggs@redhat.com, kherbst@redhat.com, 
 airlied@gmail.com, daniel@ffwll.ch
Date: Fri, 14 Jul 2023 19:07:10 -0400
In-Reply-To: <0ad4154429aaa41ca26da859c3f35784@208suo.com>
References: <5c894d0a8a178628ca200d054004be3c@208suo.com>
 <f25017a660f8a3a4e49258a1d96003dc@208suo.com>
 <2f4a7303e305d07fdd9c15a9dc95dc5f@208suo.com>
 <d0d767fb0dd3a9b7642559f379dbb0d6@208suo.com>
 <0ad4154429aaa41ca26da859c3f35784@208suo.com>
Organization: Red Hat Inc.
User-Agent: Evolution 3.48.3 (3.48.3-1.fc38)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Subject: Re: [Nouveau] [PATCH] drm/nouveau/fifo:Fix Nineteen occurrences of
 the gk104.c error: ERROR: : trailing statements should be on next line
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
 dri-devel@lists.freedesktop.org
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

NAK - checkpatch.pl is a (strongish) guideline, but not a rule. In the case=
s
corrected in the patch series here, we format the switch cases on single li=
nes
as it dramatically improves the readability of what is otherwise just a /lo=
ng/
list of slightly different static mappings. I don't believe we're the only
part of the kernel to do this either.

On Fri, 2023-07-14 at 14:58 +0800, huzhi001@208suo.com wrote:
> Signed-off-by: ZhiHu <huzhi001@208suo.com>
> ---
>   .../gpu/drm/nouveau/nvkm/engine/fifo/gk104.c  | 40 ++++++++++++++-----
>   1 file changed, 29 insertions(+), 11 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/fifo/gk104.c=20
> b/drivers/gpu/drm/nouveau/nvkm/engine/fifo/gk104.c
> index d8a4d773a58c..b99e0a7c96bb 100644
> --- a/drivers/gpu/drm/nouveau/nvkm/engine/fifo/gk104.c
> +++ b/drivers/gpu/drm/nouveau/nvkm/engine/fifo/gk104.c
> @@ -137,15 +137,29 @@ gk104_ectx_bind(struct nvkm_engn *engn, struct=20
> nvkm_cctx *cctx, struct nvkm_chan
>       u64 addr =3D 0ULL;
>=20
>       switch (engn->engine->subdev.type) {
> -    case NVKM_ENGINE_SW    : return;
> -    case NVKM_ENGINE_GR    : ptr0 =3D 0x0210; break;
> -    case NVKM_ENGINE_SEC   : ptr0 =3D 0x0220; break;
> -    case NVKM_ENGINE_MSPDEC: ptr0 =3D 0x0250; break;
> -    case NVKM_ENGINE_MSPPP : ptr0 =3D 0x0260; break;
> -    case NVKM_ENGINE_MSVLD : ptr0 =3D 0x0270; break;
> -    case NVKM_ENGINE_VIC   : ptr0 =3D 0x0280; break;
> -    case NVKM_ENGINE_MSENC : ptr0 =3D 0x0290; break;
> -    case NVKM_ENGINE_NVDEC :
> +    case NVKM_ENGINE_SW:
> +        return;
> +    case NVKM_ENGINE_GR:
> +        ptr0 =3D 0x0210;
> +        break;
> +    case NVKM_ENGINE_SEC:
> +        ptr0 =3D 0x0220;
> +        break;
> +    case NVKM_ENGINE_MSPDEC:
> +        ptr0 =3D 0x0250;
> +        break;
> +    case NVKM_ENGINE_MSPPP:
> +        ptr0 =3D 0x0260;
> +        break;
> +    case NVKM_ENGINE_MSVLD:
> +        ptr0 =3D 0x0270;
> +        break;
> +    case NVKM_ENGINE_VIC:
> +        ptr0 =3D 0x0280; break;
> +    case NVKM_ENGINE_MSENC:
> +        ptr0 =3D 0x0290;
> +        break;
> +    case NVKM_ENGINE_NVDEC:
>           ptr1 =3D 0x0270;
>           ptr0 =3D 0x0210;
>           break;
> @@ -435,8 +449,12 @@ gk104_runl_commit(struct nvkm_runl *runl, struct=20
> nvkm_memory *memory, u32 start,
>       int target;
>=20
>       switch (nvkm_memory_target(memory)) {
> -    case NVKM_MEM_TARGET_VRAM: target =3D 0; break;
> -    case NVKM_MEM_TARGET_NCOH: target =3D 3; break;
> +    case NVKM_MEM_TARGET_VRAM:
> +        target =3D 0;
> +        break;
> +    case NVKM_MEM_TARGET_NCOH:
> +        target =3D 3;
> +        break;

This one isn't very long, but I'd still say it's definitely a lot easier to
read in the compact form. If anything, the only change I would make here is
formatting the default: case to be on a single line as well

>       default:
>           WARN_ON(1);
>           return;

--=20
Cheers,
 Lyude Paul (she/her)
 Software Engineer at Red Hat

