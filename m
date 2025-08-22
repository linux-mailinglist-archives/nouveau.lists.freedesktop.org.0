Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 163C5B323BE
	for <lists+nouveau@lfdr.de>; Fri, 22 Aug 2025 22:44:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B144010EBA5;
	Fri, 22 Aug 2025 20:44:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gfxstrand-net.20230601.gappssmtp.com header.i=@gfxstrand-net.20230601.gappssmtp.com header.b="A4ozCEi8";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com
 [209.85.216.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D34F10EB9C
 for <nouveau@lists.freedesktop.org>; Fri, 22 Aug 2025 20:44:24 +0000 (UTC)
Received: by mail-pj1-f44.google.com with SMTP id
 98e67ed59e1d1-32326e09f58so2936293a91.2
 for <nouveau@lists.freedesktop.org>; Fri, 22 Aug 2025 13:44:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gfxstrand-net.20230601.gappssmtp.com; s=20230601; t=1755895464; x=1756500264;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=M5ITqkT50q+m4T1anWHEezwcrjeL1XAGQxsPrHmnZXE=;
 b=A4ozCEi8TqIdTyZmFMovh+fXlIf/dd5nDiC+6JWlj3JzwWFqDsVuaz0XJMboYOZW41
 fGvDM7CrJygPAel98BxPN5lbnb/iEokCPybAAMDsc7ssXyMsiPtaia9NbaHFyT3IqjGl
 QZOWRgLK1AlynrPchROvYDYq7pbGedtwFLR5MtMxbFFykVsAO7iRkHbo9E9FGJE1hFXF
 63TVkZHgtEh1Opm/F5QmwhqSGXIV5/jv7KtM8QBgkC9TFLPy789j5B4lHINQFkUkw6cw
 1E81GMwBfUZz0ebDlctZf2F8aVZr1GB3llDNAwvzpNCxpbVpN56MjR5ZOoHR0QifI/fD
 Z4TA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755895464; x=1756500264;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=M5ITqkT50q+m4T1anWHEezwcrjeL1XAGQxsPrHmnZXE=;
 b=ojsuL3iQMTIHW1Duf5E5Ucxa1q6P1NVRqGx8bnFWYOab7sNMKH52hAkyt9U/2IwPQ2
 CrF7iibSqGJjOfHmBwaPPMQtxbGt8Ny8tPfvFxaxR5AxdiMM1bKuo1fS6xQo6D7zFKyq
 9RHEYCd9YoS+nJaVauL+zwtfTC3YpvTUNGQMok0/gN9/rkKcjXChR0eZXyhICbBXiTSM
 GrcoBSbkiHS2kSSGuZEgl6kHDF+5rzM+JZbniayUwiyz9miu6V5Wk+wc0QUeaLCfjgB/
 ukk/q9vJ5Mlxgpi8hN8epoTFm1FEG3wkCemwMrMxYNqEAqUk5QWG0xAoIl6M0lXNE39j
 Cnww==
X-Forwarded-Encrypted: i=1;
 AJvYcCVv8WUp6npEk6uYoGe8AySjPTWbmuY5uCer1PzLqxbTGWCxra2BSrRgdNi+1FLSc10mldxyG6jL@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxCbZbEvEymLJ2XqKdwLlcZBvmTss0j5xNsxEVESmIQOgsg+aoD
 0is/n8HtFK+UVLLciFRdTLCgP3+J7UsqTmgxrBA8Y4wX9UCJ8ilQ38jAtnlf7HvehbQm7/tQDrU
 fbShDGbNs3STCEeCQl+TMniQBlT/TYM8PrBKaCyCteQ==
X-Gm-Gg: ASbGncv1O2iYR4P3OTy2Xk1fNnF4RWQF83a/NYopBzSUem308T5AInk9ObqBG+/xGUA
 KE1jFcIwI9b5hJbFpC9nUJhftDsiiNpoC30DCkDBXXZYgjy/ZcHcqYewf/UxqCPkzas9ceF966y
 B5BMff+ovsOuTP0tytXI+81/tDvr9oazyTGVI0xq8A+q96pb3q7xOLMgfDQPJSSLp1D7nkt1Epp
 bjRti0=
X-Google-Smtp-Source: AGHT+IFTpzOZWfzIfZ6aN86j5dGy9+t8X2AWl9e5HS+Cov9GjFJp/s0Sqsh+erThOaCtBqoKlWVXVAsBpE/sHdqOctw=
X-Received: by 2002:a17:90b:1d51:b0:311:e605:f60e with SMTP id
 98e67ed59e1d1-3251774b34bmr6269470a91.20.1755895463766; Fri, 22 Aug 2025
 13:44:23 -0700 (PDT)
MIME-Version: 1.0
References: <20250811220017.1337-1-jajones@nvidia.com>
In-Reply-To: <20250811220017.1337-1-jajones@nvidia.com>
From: Faith Ekstrand <faith@gfxstrand.net>
Date: Fri, 22 Aug 2025 16:44:11 -0400
X-Gm-Features: Ac12FXzMjozDkVA5Izgtx2pdN-ajBpFeBw-jnrsAAZtPGCcPbJCcjgOt-BOScks
Message-ID: <CAOFGe972S7S23LGKxEmVq_beyRMpDJE-2rMt0aobPj4HnmWSXw@mail.gmail.com>
Subject: Re: [PATCH 0/3] drm/nouveau: Advertise correct modifiers on GB20x
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
> This series adds new format modifiers for 8 and 16-bit formats on GB20x
> GPUs, preventing them from mistakenly sharing block-linear surfaces
> using these formats with prior GPUs that use a different layout.
>
> There are a few ways the parameteric format modifier definition
> could have been altered to handle the new layouts:
>
> -The GOB Height and Page Kind field has a reserved value that could
>  have been used. However, the GOB height and page kind enums did
>  not change relative to prior chips, so this is sort of a lie.
>  However, this is the least-invasive change.
>
> -An entirely new field could have been added. This seems
>  inappropriate given the presence of an existing appropriate field.
>  The advantage here is it avoids splitting the sector layout field
>  across two bitfields.
>
> The chosen approach is the logically consistent one, but has the
> downside of being the most complex, and that it causes the
> DRM_FORMAT_MOD_NVIDIA_BLOCK_LINEAR_2D() macro to evaluate its 's'
> parameter twice. However, utilizing simple helper functions in
> client code when accessing the parameteric format modifier fields
> easily addresses the complexity, and I have audited the relevant code
> and do not believe the double evaluation should cause any problems in
> practice.
>
> Tested on GB20x and TU10x cards using the following:
>
> -kmscube w/NVK+Zink built with these patches applied:
>
>    https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/36336

Both the Mesa and kernel pieces are now reviewed so I think we're good
to start landing. I've independently tested with kmscube to verify.

~Faith

>
>  with various manually specified formats
>  and both manually specified and automatically
>  selected modifiers.
>
> -drmfmtmods, a tiny test program that lists modifiers:
>
>    https://github.com/cubanismo/drmfmtmods
>
> Changes since the RFC version here:
>
>   https://lore.kernel.org/nouveau/20250703223658.1457-1-jajones@nvidia.co=
m/
>
> -Dropped the helper macros & static inlines in
>  drm_fourcc.h as requested by Faith Ekstrand,
>  who noted these aren't helpful for UMD code,
>  which is all written in rust now. I may re-
>  introduce some of these in a subsequent series,
>  but we both agreed we do not want to delay
>  progress on the modifiers themselves while we
>  debate the details of those cometic details.
>
> -Reserved an extra bit for future sector
>  layouts.
>
> -Fixed handling of linear modifiers on GB20x
>  and NV5x/G8x/G9x/GT2xx chips.
>
> James Jones (3):
>   drm: define NVIDIA DRM format modifiers for GB20x
>   drm/nouveau/disp: Always accept linear modifier
>   drm/nouveau: Advertise correct modifiers on GB20x
>
>  drivers/gpu/drm/nouveau/dispnv50/disp.c     |  3 ++
>  drivers/gpu/drm/nouveau/dispnv50/disp.h     |  1 +
>  drivers/gpu/drm/nouveau/dispnv50/wndw.c     | 25 ++++++++++++++--
>  drivers/gpu/drm/nouveau/dispnv50/wndwca7e.c | 33 +++++++++++++++++++++
>  include/uapi/drm/drm_fourcc.h               | 25 ++++++++++------
>  5 files changed, 76 insertions(+), 11 deletions(-)
>
> --
> 2.50.1
>
