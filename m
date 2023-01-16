Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 99A1D66BCF6
	for <lists+nouveau@lfdr.de>; Mon, 16 Jan 2023 12:34:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1FD2110E3D0;
	Mon, 16 Jan 2023 11:34:30 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E668310E3D0
 for <nouveau@lists.freedesktop.org>; Mon, 16 Jan 2023 11:34:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1673868866;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=CWPoxshq9dPBmcr/9P1qWrfk56DNaf4wBLS0tkWKWM0=;
 b=SQdxHpnjXB//su/tJZp+td5/4w7FSFKZmSyV4s7C6yyIQyXlPDVdmQuiGVLaZPFSLwbY23
 ifmhR+k3CYJXd0J0jILDE0jIIrZkakPWXTz6rZKSEipzFmbhwra5ceoyWZNF4M3OgDuBJi
 yJa7SIqTt8CFsqXETLtOCgabe1D5diI=
Received: from mail-lf1-f70.google.com (mail-lf1-f70.google.com
 [209.85.167.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-635-r47oQomSMPOv9BL6iUkhUg-1; Mon, 16 Jan 2023 06:34:25 -0500
X-MC-Unique: r47oQomSMPOv9BL6iUkhUg-1
Received: by mail-lf1-f70.google.com with SMTP id
 u13-20020a056512128d00b004b53d7241f6so10294964lfs.4
 for <nouveau@lists.freedesktop.org>; Mon, 16 Jan 2023 03:34:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=CWPoxshq9dPBmcr/9P1qWrfk56DNaf4wBLS0tkWKWM0=;
 b=NUb0wv2E1dn02QeWUp4pUWuBojxg99c6LZjy5Qho0DGhwT90bFAekIkH4ajuQuQY/w
 tzAwqQWrnmYkrD0N9HVpAAJkCpWURZhOJT4u4o3zccDcVABcX0K0cZdeQm3P9tOCJXXG
 PeY472/MdsSKay6WBzP7wHsdSoBkqOPl1WmARcxfwVZZYhtrWoM8hIYXXGgrsZ/f/Ql0
 NRVfk1HKicbgPSw2GKJG4WBpG4YjvpgVxxPm6eMypeMaexSzOH1pkE16Be92T9UnR+zi
 Or7LgGyq2wC/SIkuC8S/v3rIwo242dyGMokoaUQGfCCaasoEoKxOu9Jw1tWptLWWGUd8
 JQdg==
X-Gm-Message-State: AFqh2ko3QhEDoK3FSO/tB/JKBIOIcefuEjTmsC3TgRVn8SE9MMcEymF3
 8DsZ+EBb/RQdKkcyABCzfeyaw0m2qpkxO5KZI6d2O3jli7qzGF1Z5RExhDKIFkPkhfKqUs8IiIA
 0kKUz5/LWPmar28Kly2qc9CHKrBXKmvgoLQx6CW1KYQ==
X-Received: by 2002:a2e:380b:0:b0:287:87ef:f274 with SMTP id
 f11-20020a2e380b000000b0028787eff274mr1024782lja.507.1673868864543; 
 Mon, 16 Jan 2023 03:34:24 -0800 (PST)
X-Google-Smtp-Source: AMrXdXs/A3BEIyrgk+b4q28+jNwXWqJsjWo4v5qbUO0d4qKJWtn0IHAJojTWDkmuo/bhHVhwciUfZfa4XHzMGXxQoWU=
X-Received: by 2002:a2e:380b:0:b0:287:87ef:f274 with SMTP id
 f11-20020a2e380b000000b0028787eff274mr1024771lja.507.1673868864276; Mon, 16
 Jan 2023 03:34:24 -0800 (PST)
MIME-Version: 1.0
References: <20230116100718.12832-1-jirislaby@kernel.org>
In-Reply-To: <20230116100718.12832-1-jirislaby@kernel.org>
From: Karol Herbst <kherbst@redhat.com>
Date: Mon, 16 Jan 2023 12:34:12 +0100
Message-ID: <CACO55tvnedcj5ZmEoqLw1Vz2vJQjpKjtdbvMMQVbjydZ51JvJQ@mail.gmail.com>
To: "Jiri Slaby (SUSE)" <jirislaby@kernel.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Subject: Re: [Nouveau] [PATCH -resend] drm/nouveau/kms/nv50- (gcc13): fix
 nv50_wndw_new_ prototype
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
Cc: Martin Liska <mliska@suse.cz>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Ben Skeggs <bskeggs@redhat.com>,
 Daniel Vetter <daniel@ffwll.ch>, nouveau@lists.freedesktop.org,
 airlied@redhat.com
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

On Mon, Jan 16, 2023 at 11:07 AM Jiri Slaby (SUSE) <jirislaby@kernel.org> w=
rote:
>
> gcc-13 warns about mismatching types for enums. That revealed switched
> arguments of nv50_wndw_new_():
>   drivers/gpu/drm/nouveau/dispnv50/wndw.c:696:1: error: conflicting types=
 for 'nv50_wndw_new_' due to enum/integer mismatch; have 'int(const struct =
nv50_wndw_func *, struct drm_device *, enum drm_plane_type,  const char *, =
int,  const u32 *, u32,  enum nv50_disp_interlock_type,  u32,  struct nv50_=
wndw **)'
>   drivers/gpu/drm/nouveau/dispnv50/wndw.h:36:5: note: previous declaratio=
n of 'nv50_wndw_new_' with type 'int(const struct nv50_wndw_func *, struct =
drm_device *, enum drm_plane_type,  const char *, int,  const u32 *, enum n=
v50_disp_interlock_type,  u32,  u32,  struct nv50_wndw **)'
>
> It can be barely visible, but the declaration says about the parameters
> in the middle:
>   enum nv50_disp_interlock_type,
>   u32 interlock_data,
>   u32 heads,
>
> While the definition states differently:
>   u32 heads,
>   enum nv50_disp_interlock_type interlock_type,
>   u32 interlock_data,
>
> Unify/fix the declaration to match the definition.
>

Reviewed-by: Karol Herbst <kherbst@redhat.com>

will merge it into drm-misc soon

> Cc: Martin Liska <mliska@suse.cz>
> Cc: Ben Skeggs <bskeggs@redhat.com>
> Cc: Karol Herbst <kherbst@redhat.com>
> Cc: Lyude Paul <lyude@redhat.com>
> Cc: David Airlie <airlied@gmail.com>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: dri-devel@lists.freedesktop.org
> Cc: nouveau@lists.freedesktop.org
> Cc: linux-kernel@vger.kernel.org
> Signed-off-by: Jiri Slaby (SUSE) <jirislaby@kernel.org>
> ---
>
> Notes:
>     [v2] switch to uint instead of to enum
>
>  drivers/gpu/drm/nouveau/dispnv50/wndw.h | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/nouveau/dispnv50/wndw.h b/drivers/gpu/drm/no=
uveau/dispnv50/wndw.h
> index 591c852f326b..76a6ae5d5652 100644
> --- a/drivers/gpu/drm/nouveau/dispnv50/wndw.h
> +++ b/drivers/gpu/drm/nouveau/dispnv50/wndw.h
> @@ -35,8 +35,9 @@ struct nv50_wndw {
>
>  int nv50_wndw_new_(const struct nv50_wndw_func *, struct drm_device *,
>                    enum drm_plane_type, const char *name, int index,
> -                  const u32 *format, enum nv50_disp_interlock_type,
> -                  u32 interlock_data, u32 heads, struct nv50_wndw **);
> +                  const u32 *format, u32 heads,
> +                  enum nv50_disp_interlock_type, u32 interlock_data,
> +                  struct nv50_wndw **);
>  void nv50_wndw_flush_set(struct nv50_wndw *, u32 *interlock,
>                          struct nv50_wndw_atom *);
>  void nv50_wndw_flush_clr(struct nv50_wndw *, u32 *interlock, bool flush,
> --
> 2.39.0
>

