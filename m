Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CBCAC729912
	for <lists+nouveau@lfdr.de>; Fri,  9 Jun 2023 14:08:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A96010E69A;
	Fri,  9 Jun 2023 12:08:55 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3DD6910E69A
 for <nouveau@lists.freedesktop.org>; Fri,  9 Jun 2023 12:08:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1686312533;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bhTsvnKWHMyANiF+ypBvF6dWV6TA3YEIeRPL9ez0lTg=;
 b=CMCLNWVmhQOyXdaH+QY6PGx3yl4T1rwJynCG/GqFtnvieH5eLrokg/fC0LAADteRAFibg5
 3MmB5Bn/ijWf9LuJwT4kmCMl2dGMLOm0O74E2+CI22BuseikN3OON5C2DjsW3xunyAYLP2
 ZuuOsr5I2vEGRexC55e3o71IYcyySs0=
Received: from mail-lj1-f198.google.com (mail-lj1-f198.google.com
 [209.85.208.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-596-XuynZ9eZMY-q4a1i46Abxw-1; Fri, 09 Jun 2023 08:08:48 -0400
X-MC-Unique: XuynZ9eZMY-q4a1i46Abxw-1
Received: by mail-lj1-f198.google.com with SMTP id
 38308e7fff4ca-2b04d5ed394so1909311fa.1
 for <nouveau@lists.freedesktop.org>; Fri, 09 Jun 2023 05:08:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686312527; x=1688904527;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=bhTsvnKWHMyANiF+ypBvF6dWV6TA3YEIeRPL9ez0lTg=;
 b=LBgajG8BXLoJdyd1qi7hqO20wrYFOUm/SM2mKCsiGDarNURPuYRJV5K+yeM+lsqYzM
 GAANcfNY8NPdU/BqO/uhzLV44eU8oZM63IU+ypOcHE8Yap+Gh98Mi3E2Weaz8XnUYSNL
 xEQAMShG9lp8WPPx5t8SKhoE4p0XZx019PHjPDroZEvB4G+zAw077LTH3eW31Euw56T6
 2BXdxgoVpp1Sz/FUutyAnekUKeFK/103Cw4g5VbDUu/TcpYVRE+0mcCG/RA5CNNxZcAR
 apgWjySUDdovXUOvmI/EH7lh13pMXHxC0oGA1fnufSeTTPxMtRCKPmPL6YnSGDMR2g+X
 T76w==
X-Gm-Message-State: AC+VfDxkiSFCInmDcWStIXuzOg6BzGr2+OgIxfqfrLF2ldbtwFQcmuey
 8lGkEDq3CDb1Blg0IeTsWc3rvQ6b3+qwhBvj0g3eH14F2YKZINfGDa997iEfOGc4JG4Z5RLsGND
 nSR8TA2nPzu3baiAx4hCdtDfbTOWHxd9sV9h5tLbhrQ==
X-Received: by 2002:a2e:a60a:0:b0:2b2:84:fae6 with SMTP id
 v10-20020a2ea60a000000b002b20084fae6mr840257ljp.5.1686312526806; 
 Fri, 09 Jun 2023 05:08:46 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ5/u83dgJO9ijfmv0l+OO9YcGJ/L6qBK50cyPbNLbgarvaR6qFwIZEoR0L+ekfQ6ZkypevTiTMqJhUVw0mWglg=
X-Received: by 2002:a2e:a60a:0:b0:2b2:84:fae6 with SMTP id
 v10-20020a2ea60a000000b002b20084fae6mr840247ljp.5.1686312526573; 
 Fri, 09 Jun 2023 05:08:46 -0700 (PDT)
MIME-Version: 1.0
References: <20230609081732.3842341-1-lee@kernel.org>
 <20230609081732.3842341-7-lee@kernel.org>
In-Reply-To: <20230609081732.3842341-7-lee@kernel.org>
From: Karol Herbst <kherbst@redhat.com>
Date: Fri, 9 Jun 2023 14:08:35 +0200
Message-ID: <CACO55ttQa-M3amPtFTG2JCC=wnJ7y6=JvZ9ak93tW-WtfXYUxg@mail.gmail.com>
To: Lee Jones <lee@kernel.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Subject: Re: [Nouveau] [RESEND 06/15] drm/nouveau/nvkm/subdev/acr/lsfw:
 Remove unused variable 'loc'
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
 Daniel Vetter <daniel@ffwll.ch>, Gourav Samaiya <gsamaiya@nvidia.com>
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

On Fri, Jun 9, 2023 at 10:18=E2=80=AFAM Lee Jones <lee@kernel.org> wrote:
>
> Fixes the following W=3D1 kernel build warning(s):
>
>  drivers/gpu/drm/nouveau/nvkm/subdev/acr/lsfw.c: In function =E2=80=98nvk=
m_acr_lsfw_load_sig_image_desc_v2=E2=80=99:
>  drivers/gpu/drm/nouveau/nvkm/subdev/acr/lsfw.c:221:21: warning: variable=
 =E2=80=98loc=E2=80=99 set but not used [-Wunused-but-set-variable]
>
> Cc: Ben Skeggs <bskeggs@redhat.com>
> Cc: Karol Herbst <kherbst@redhat.com>
> Cc: Lyude Paul <lyude@redhat.com>
> Cc: David Airlie <airlied@gmail.com>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: Gourav Samaiya <gsamaiya@nvidia.com>
> Cc: dri-devel@lists.freedesktop.org
> Cc: nouveau@lists.freedesktop.org
> Signed-off-by: Lee Jones <lee@kernel.org>
> ---
>  drivers/gpu/drm/nouveau/nvkm/subdev/acr/lsfw.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/acr/lsfw.c b/drivers/gpu=
/drm/nouveau/nvkm/subdev/acr/lsfw.c
> index f36a359d4531c..bd104a030243a 100644
> --- a/drivers/gpu/drm/nouveau/nvkm/subdev/acr/lsfw.c
> +++ b/drivers/gpu/drm/nouveau/nvkm/subdev/acr/lsfw.c
> @@ -218,7 +218,7 @@ nvkm_acr_lsfw_load_sig_image_desc_v2(struct nvkm_subd=
ev *subdev,
>                 const struct firmware *hsbl;
>                 const struct nvfw_ls_hsbl_bin_hdr *hdr;
>                 const struct nvfw_ls_hsbl_hdr *hshdr;
> -               u32 loc, sig, cnt, *meta;
> +               u32 sig, cnt, *meta;
>
>                 ret =3D nvkm_firmware_load_name(subdev, path, "hs_bl_sig"=
, ver, &hsbl);
>                 if (ret)
> @@ -227,7 +227,6 @@ nvkm_acr_lsfw_load_sig_image_desc_v2(struct nvkm_subd=
ev *subdev,
>                 hdr =3D nvfw_ls_hsbl_bin_hdr(subdev, hsbl->data);
>                 hshdr =3D nvfw_ls_hsbl_hdr(subdev, hsbl->data + hdr->head=
er_offset);
>                 meta =3D (u32 *)(hsbl->data + hshdr->meta_data_offset);
> -               loc =3D *(u32 *)(hsbl->data + hshdr->patch_loc);

Ben: should we do anything with this value or is it safe to ignore?

>                 sig =3D *(u32 *)(hsbl->data + hshdr->patch_sig);
>                 cnt =3D *(u32 *)(hsbl->data + hshdr->num_sig);
>
> --
> 2.41.0.162.gfafddb0af9-goog
>

