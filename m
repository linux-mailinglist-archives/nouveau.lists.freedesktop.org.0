Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C30E16DB2BE
	for <lists+nouveau@lfdr.de>; Fri,  7 Apr 2023 20:25:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A9FA010EE37;
	Fri,  7 Apr 2023 18:25:04 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-pj1-x1032.google.com (mail-pj1-x1032.google.com
 [IPv6:2607:f8b0:4864:20::1032])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3408110EE42
 for <nouveau@lists.freedesktop.org>; Fri,  7 Apr 2023 18:25:03 +0000 (UTC)
Received: by mail-pj1-x1032.google.com with SMTP id
 b5-20020a17090a6e0500b0023f32869993so2089514pjk.1
 for <nouveau@lists.freedesktop.org>; Fri, 07 Apr 2023 11:25:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20210112; t=1680891902; x=1683483902;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=YqDA4WRbqZ8pZx3U3y6YYJyg8kkdxxYYCziSSoMs6f4=;
 b=IxJT4QMtg5r1G4F+GoM/q1tJVSZvAIzcvgcNYRgfVw3xxAXMfzR1j8kFIJQ5+3LOP1
 3YHWb+PmbJpffDwUvHHaOXgcH2jW/vRq4CF9OWiUG3Yw3QmAQYL8j8U1clL3OB9jmSOy
 OyqeP0yvsylVpyedaCAmYyRhVhsHlrqYdOQkm6zEPNpcuTzw6LZR0eNjDkzB3H5FNkR2
 wu7pPND7ZoQbJtAPGlxSLa4vkDjlLenKV/r5RHZaltDRU/HzSi58qR/dbY+sR1VRcn3Y
 RBguN4BK97kV/rDwV1gdLloP/3QNpzjoWbdXoWTvO7wu3ee35i1j5aMXZ8rUuik0aKWR
 rCjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680891902; x=1683483902;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=YqDA4WRbqZ8pZx3U3y6YYJyg8kkdxxYYCziSSoMs6f4=;
 b=KguxAU7/TjzaaKpo8dMvDE6WGuNt53ZDWxdaEeDDeuX6n2whfHrPEf77dV64ATM/Oo
 qX6kl22VCyOGLRlT2AkakPM5Jl/XXrH5cHwDTLC8IKEptsfioYW4F4mYTycoBfgUBD4w
 ZuyKt7GIv16S7EgjnAwZ2T0FWod+lG6PFY0xRARTqmD0bM1DNlU24HLjoZly8KGektcK
 jNrTs60xjtfij+0ULVf7pl9eq6U85ImifKODNwCFA7UlQOlqEcZLterDSbWazkUjjdVg
 1YWnd2kOdFphpHS3WYhq7DSiy8EanoRjGQ+afBqw0eMccMvsAEZRcSjPh56p18nWbW5s
 7m0Q==
X-Gm-Message-State: AAQBX9cT9D8S/DFe8kX9y5D8z7+OmZzVWEd4vrYBL4Upo+56Zo05PWVN
 h1SEuw4TJk4EGh+3/nOhm9ecDLR77XQ1+8cZV82ZyQ==
X-Google-Smtp-Source: AKy350bXQUYcPYmDw9ucdCsVzHEhLhSxuODvj2EavnS9lslRG5I8VtiLzyQAXkkbbqqxnfc/IY218hVz5XmMfH2ovNY=
X-Received: by 2002:a17:902:e54d:b0:19e:f660:81ee with SMTP id
 n13-20020a170902e54d00b0019ef66081eemr1104963plf.2.1680891902021; Fri, 07 Apr
 2023 11:25:02 -0700 (PDT)
MIME-Version: 1.0
References: <20230331204209.1863060-1-trix@redhat.com>
In-Reply-To: <20230331204209.1863060-1-trix@redhat.com>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Fri, 7 Apr 2023 11:24:50 -0700
Message-ID: <CAKwvOdmkyXgii52gyD5uO7=BwYu0iJ9QZtbOcusE2PeH24f6uw@mail.gmail.com>
To: Tom Rix <trix@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Subject: Re: [Nouveau] [PATCH] drm/nouveau/acr: remove unused loc variable
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
Cc: nouveau@lists.freedesktop.org, llvm@lists.linux.dev,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 nathan@kernel.org, bskeggs@redhat.com, daniel@ffwll.ch, gsamaiya@nvidia.com
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

On Fri, Mar 31, 2023 at 1:42=E2=80=AFPM Tom Rix <trix@redhat.com> wrote:
>
> clang with W=3D1 reports
> drivers/gpu/drm/nouveau/nvkm/subdev/acr/lsfw.c:221:7: error: variable
>   'loc' set but not used [-Werror,-Wunused-but-set-variable]
>                 u32 loc, sig, cnt, *meta;
>                     ^
> This variable is not used so remove it.
>
> Signed-off-by: Tom Rix <trix@redhat.com>

Ben, any idea if this was supposed to be used somewhere? If not:

Fixes: 4b569ded09fd ("drm/nouveau/acr/ga102: initial support")
Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>

> ---
>  drivers/gpu/drm/nouveau/nvkm/subdev/acr/lsfw.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/acr/lsfw.c b/drivers/gpu=
/drm/nouveau/nvkm/subdev/acr/lsfw.c
> index f36a359d4531..bd104a030243 100644
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
>                 sig =3D *(u32 *)(hsbl->data + hshdr->patch_sig);
>                 cnt =3D *(u32 *)(hsbl->data + hshdr->num_sig);
>
> --
> 2.27.0
>


--=20
Thanks,
~Nick Desaulniers
