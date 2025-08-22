Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F29CFB3204C
	for <lists+nouveau@lfdr.de>; Fri, 22 Aug 2025 18:17:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9ACF910EB67;
	Fri, 22 Aug 2025 16:17:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gfxstrand-net.20230601.gappssmtp.com header.i=@gfxstrand-net.20230601.gappssmtp.com header.b="BOX+BzQU";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com
 [209.85.214.181])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A913010E166
 for <nouveau@lists.freedesktop.org>; Fri, 22 Aug 2025 16:17:26 +0000 (UTC)
Received: by mail-pl1-f181.google.com with SMTP id
 d9443c01a7336-245f3784edcso21783705ad.1
 for <nouveau@lists.freedesktop.org>; Fri, 22 Aug 2025 09:17:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gfxstrand-net.20230601.gappssmtp.com; s=20230601; t=1755879446; x=1756484246;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=dXrBj7czlnifHIIbHLhwjoziAY7MsV3SxS2LubZ5kMI=;
 b=BOX+BzQUDVRd7rxUp04ywrH4Zl+l6Cg/hgBfxjKDtksXDnrU0PBsGyxklwL/uhAnb0
 +ywER0CcRtiEaCj8QItHw5LyzrQHOA0F3RhOMX2As5lI8AOnb67VHRtCf1pKxE5ExAc3
 ZVxO6lyfJxJOOstMUETyvYsyqr5A6KYWIJqQZOF7xrXLqZ/Q1N1tJlfhIbAOBfkkjzB3
 tPJatbLnLo45p9aGTuEX4qlX5CUXiNWq4CfHWz2Px06Kle/NySnc3RVLkYd3vfe19SOU
 APUGxsdhXBjmbbtNBTalwHDxwl4ItaL6NX7xltk/I6jLlsg2XDujUGJfopq7QzrjigDl
 NAAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755879446; x=1756484246;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=dXrBj7czlnifHIIbHLhwjoziAY7MsV3SxS2LubZ5kMI=;
 b=BciGefR4Li+NQMO7njQgg9xdjuR6h6myDQTz9iGC+DuMIho/YsmvIdUqf7VeL7Jxym
 MtS+2Qzjnk4fHe+IWFC4Jm3kaCfUCm4n8XunE32o0AG+XejG/iQ2hsqUKe1KMcNwc2zN
 6thojkxKmnDt07Oak8OwDVbOV1KTH25C4chLBr5ie5SxLhy08ppxYMEur6vRKfXXJXzi
 PaB6FjZl4ZIgqpTkKQK/rGbXog/0J6yqzq6ul7cc64ef/+3MKaokDGcobxRgtq78ylbd
 +n62GUsFuaddqlk4FDET0+HfxAqnOC6H5aTwcJfCkDiZT6nuEjaB1D2/6gzIc46wkPoX
 wjhw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWVzY4HmYRom8L2Aalk09+8aSUMfnkHOvI0wEI1S7PQQlwra2GBmNzk+0XOCE0hBPKrhJEfQxGQ@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy2Ff0EQh7bC5IjLas7YokcH20xJ+eoyzgTYpYVfdD06Y/QKYB6
 2yQWVmLzn5HzPqe57321x8AX1nGUqJ8kG/6V4Ryr0WYwMAPnIKtEm1zSfzMZ0+xL6Fj8LbuWK1E
 13q87Sl6Zkls1O5DObBjKeW1ZwZXeMWpq8cEj3dDbDQ==
X-Gm-Gg: ASbGnctYyIPtCM3UZq84qhePLRWGbponLO0hbRiOpBh/xFsTyFKQ7ayUoHLNkRiKdum
 /gzcqiKuyYpyDd756VyHKEewly5Wa4v6BZwLx/N9tNf/FrAqIR3ZvMN3JH4nWt/h62sK+kaoNvh
 VdXrsp50mVFxgIomU7nAYFMhElWrUblTPEoqfMS9crv4/zHP9vzmiFj0+ushEG4jGLDsc9nipqM
 6TZkSE=
X-Google-Smtp-Source: AGHT+IGKWtnF8OMUPJUOBvgQeqNkELMzDuHtBwU+4iu0PtZ/qxp4Qh7KY9Mf/HhXhmKEYahJdPwQFQh0rwo7p48KCm8=
X-Received: by 2002:a17:902:ced0:b0:246:4e37:e8e0 with SMTP id
 d9443c01a7336-2464e37e9e9mr25615135ad.38.1755879445875; Fri, 22 Aug 2025
 09:17:25 -0700 (PDT)
MIME-Version: 1.0
References: <20250811220017.1337-1-jajones@nvidia.com>
 <20250811220017.1337-3-jajones@nvidia.com>
In-Reply-To: <20250811220017.1337-3-jajones@nvidia.com>
From: Faith Ekstrand <faith@gfxstrand.net>
Date: Fri, 22 Aug 2025 12:17:14 -0400
X-Gm-Features: Ac12FXzLE4N5nRMxFA42E8ma-vDPWeG1DvDUBRrSAZcCpMWQJqqBY0NIR6FzHhY
Message-ID: <CAOFGe96j4+j4=3gcPH2k3aA7ST=ZS13O8woLUER2rKyF6xEgwA@mail.gmail.com>
Subject: Re: [PATCH 2/3] drm/nouveau/disp: Always accept linear modifier
To: James Jones <jajones@nvidia.com>
Cc: Danilo Krummrich <dakr@kernel.org>, Lyude Paul <lyude@redhat.com>, 
 Faith Ekstrand <faith.ekstrand@collabora.com>, nouveau@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Joel Fernandes <joelagnelf@nvidia.com>
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

On Mon, Aug 11, 2025 at 5:57=E2=80=AFPM James Jones <jajones@nvidia.com> wr=
ote:
>
> On some chipsets, which block-linear modifiers are
> supported is format-specific. However, linear
> modifiers are always be supported. The prior
> modifier filtering logic was not accounting for
> the linear case.
>
> Fixes: c586f30bf74c ("drm/nouveau/kms: Add format mod prop to base/ovly/n=
vdisp")
> Signed-off-by: James Jones <jajones@nvidia.com>

Reviewed-by: Faith Ekstrand <faith.ekstrand@collabora.com>

> ---
>  drivers/gpu/drm/nouveau/dispnv50/wndw.c | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/drivers/gpu/drm/nouveau/dispnv50/wndw.c b/drivers/gpu/drm/no=
uveau/dispnv50/wndw.c
> index 11d5b923d6e7..e2c55f4b9c5a 100644
> --- a/drivers/gpu/drm/nouveau/dispnv50/wndw.c
> +++ b/drivers/gpu/drm/nouveau/dispnv50/wndw.c
> @@ -795,6 +795,10 @@ static bool nv50_plane_format_mod_supported(struct d=
rm_plane *plane,
>         struct nouveau_drm *drm =3D nouveau_drm(plane->dev);
>         uint8_t i;
>
> +       /* All chipsets can display all formats in linear layout */
> +       if (modifier =3D=3D DRM_FORMAT_MOD_LINEAR)
> +               return true;
> +
>         if (drm->client.device.info.chipset < 0xc0) {
>                 const struct drm_format_info *info =3D drm_format_info(fo=
rmat);
>                 const uint8_t kind =3D (modifier >> 12) & 0xff;
> --
> 2.50.1
>
