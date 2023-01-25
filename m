Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1951E67BE2A
	for <lists+nouveau@lfdr.de>; Wed, 25 Jan 2023 22:24:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 76D5410E8B3;
	Wed, 25 Jan 2023 21:24:25 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 328F110E8B3
 for <nouveau@lists.freedesktop.org>; Wed, 25 Jan 2023 21:24:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1674681863;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cxQ9RZ6BDN4CCiK3oNUgrfSexVDJhOUJCCoEg3ZH1Cs=;
 b=fKP1qQbzP8viS4mMWk6trs7IZ0IzvlvYRPj5tzwT/8o5IE4g7A19ShA6s6iyFSXab5OwWe
 FYDEXuIHpHl6iLWY6jT+Wlx91o1Qua3cGC488s3LVwPRSWjqgvgvIqvkln2nP/UP4P16Xp
 ffcfqk5n0RR22GpqGgjW08kEzphpDfw=
Received: from mail-ua1-f70.google.com (mail-ua1-f70.google.com
 [209.85.222.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-280-YCL_AV8nOwa83LSKc62fOA-1; Wed, 25 Jan 2023 16:24:22 -0500
X-MC-Unique: YCL_AV8nOwa83LSKc62fOA-1
Received: by mail-ua1-f70.google.com with SMTP id
 z42-20020ab0492d000000b00423b333ff7dso6049197uac.22
 for <nouveau@lists.freedesktop.org>; Wed, 25 Jan 2023 13:24:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=mime-version:user-agent:content-transfer-encoding:organization
 :references:in-reply-to:date:cc:to:from:subject:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=hmhxlAhlOmCwXTew7ghXOnO0YktD1VDCuEf789ahQyI=;
 b=XB0z4QQfWso9HYGrevk3S3qdhnItAvYD1e6oYyM0tO7sQ6V5ahKvxniEu7Gdnv0ROK
 QDaBZl7H3XKmwckOiU+bOxh0U77G4zZe7LgJgzpLV4zaZEwlN+cboyaLryjCjKmx0cZl
 uZ79Wh0tGd6VlHHeZ226Y/V9Et68GSfEoTDxdq0M2QEnpGtnMHOlosWlIjzPVXWJw0I5
 w9wT3xv652CVnwQAkmFgDghtQy1LSxPYO0b5+qRWT+5PQNa5XKYuzSMphbIRSE/wkyOl
 hZj7sGrRTKpLAcFD7fHpc4Cu3TQLTz8z6xGgE53L6+nGxe3XDURtLMfI/nYHAZsKs0hZ
 ofbg==
X-Gm-Message-State: AFqh2kr33ZNCEgRPl1ddHipZm7cwG9YvAOkd9/uAmrt0Tz44S4HLCrw8
 yrSoVnF6PZyb03SDUvlvLDmK9O5EhtLm52Pubqno3QcxDgbzpQMK/gcRKW/Ve3e+IOeKQ1/xRT+
 9Zp09jwutxP5GltkkKrQlcc9jVw==
X-Received: by 2002:a05:6122:106a:b0:3bd:795f:27b2 with SMTP id
 k10-20020a056122106a00b003bd795f27b2mr20159717vko.7.1674681861603; 
 Wed, 25 Jan 2023 13:24:21 -0800 (PST)
X-Google-Smtp-Source: AMrXdXtOnfUj95yQhJDTgNjUNUUoJY20NjO7nuQQD1QTAGs0DBrUgr7u7/iA/gKre3BzWAbIs7oCzA==
X-Received: by 2002:a05:6122:106a:b0:3bd:795f:27b2 with SMTP id
 k10-20020a056122106a00b003bd795f27b2mr20159711vko.7.1674681861340; 
 Wed, 25 Jan 2023 13:24:21 -0800 (PST)
Received: from ?IPv6:2600:4040:5c68:6800::feb? ([2600:4040:5c68:6800::feb])
 by smtp.gmail.com with ESMTPSA id
 j28-20020a05620a001c00b007049f19c736sm4276928qki.7.2023.01.25.13.24.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Jan 2023 13:24:20 -0800 (PST)
Message-ID: <9c53c624604b7415ceeedf7222e78abc2c64430f.camel@redhat.com>
From: Lyude Paul <lyude@redhat.com>
To: Kees Cook <keescook@chromium.org>, Ben Skeggs <bskeggs@redhat.com>
Date: Wed, 25 Jan 2023 16:24:19 -0500
In-Reply-To: <202301251214.8E52414D0@keescook>
References: <20221127183036.never.139-kees@kernel.org>
 <202301251214.8E52414D0@keescook>
Organization: Red Hat Inc.
User-Agent: Evolution 3.44.4 (3.44.4-2.fc36)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Subject: Re: [Nouveau] [PATCH] drm/nouveau/disp: Fix nvif_outp_acquire_dp()
 argument size
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
Cc: "Gustavo
 A. R. Silva" <gustavo@embeddedor.com>, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-hardening@vger.kernel.org, Daniel Vetter <daniel@ffwll.ch>,
 Dave Airlie <airlied@redhat.com>
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

Sorry! I've been pretty busy until now, this is:

Reviewed-by: Lyude Paul <lyude@redhat.com>

Let me know if you've pushed it already or if you want me to push it to drm=
-
misc

On Wed, 2023-01-25 at 12:15 -0800, Kees Cook wrote:
> Ping. I'll take this via my tree unless someone else wants to take it...
>=20
> On Sun, Nov 27, 2022 at 10:30:41AM -0800, Kees Cook wrote:
> > Both Coverity and GCC with -Wstringop-overflow noticed that
> > nvif_outp_acquire_dp() accidentally defined its second argument with 1
> > additional element:
> >=20
> > drivers/gpu/drm/nouveau/dispnv50/disp.c: In function 'nv50_pior_atomic_=
enable':
> > drivers/gpu/drm/nouveau/dispnv50/disp.c:1813:17: error: 'nvif_outp_acqu=
ire_dp' accessing 16 bytes in a region of size 15 [-Werror=3Dstringop-overf=
low=3D]
> >  1813 |                 nvif_outp_acquire_dp(&nv_encoder->outp, nv_enco=
der->dp.dpcd, 0, 0, false, false);
> >       |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> > drivers/gpu/drm/nouveau/dispnv50/disp.c:1813:17: note: referencing argu=
ment 2 of type 'u8[16]' {aka 'unsigned char[16]'}
> > drivers/gpu/drm/nouveau/include/nvif/outp.h:24:5: note: in a call to fu=
nction 'nvif_outp_acquire_dp'
> >    24 | int nvif_outp_acquire_dp(struct nvif_outp *, u8 dpcd[16],
> >       |     ^~~~~~~~~~~~~~~~~~~~
> >=20
> > Avoid these warnings by defining the argument size using the matching
> > define (DP_RECEIVER_CAP_SIZE, 15) instead of having it be a literal
> > (and incorrect) value (16).
> >=20
> > Reported-by: coverity-bot <keescook+coverity-bot@chromium.org>
> > Addresses-Coverity-ID: 1527269 ("Memory - corruptions")
> > Addresses-Coverity-ID: 1527268 ("Memory - corruptions")
> > Link: https://lore.kernel.org/lkml/202211100848.FFBA2432@keescook/
> > Link: https://lore.kernel.org/lkml/202211100848.F4C2819BB@keescook/
> > Fixes: 813443721331 ("drm/nouveau/disp: move DP link config into acquir=
e")
> > Cc: Ben Skeggs <bskeggs@redhat.com>
> > Cc: Karol Herbst <kherbst@redhat.com>
> > Cc: Lyude Paul <lyude@redhat.com>
> > Cc: David Airlie <airlied@gmail.com>
> > Cc: Daniel Vetter <daniel@ffwll.ch>
> > Cc: Dave Airlie <airlied@redhat.com>
> > Cc: "Gustavo A. R. Silva" <gustavo@embeddedor.com>
> > Cc: dri-devel@lists.freedesktop.org
> > Cc: nouveau@lists.freedesktop.org
> > Signed-off-by: Kees Cook <keescook@chromium.org>
> > ---
> >  drivers/gpu/drm/nouveau/include/nvif/outp.h | 3 ++-
> >  drivers/gpu/drm/nouveau/nvif/outp.c         | 2 +-
> >  2 files changed, 3 insertions(+), 2 deletions(-)
> >=20
> > diff --git a/drivers/gpu/drm/nouveau/include/nvif/outp.h b/drivers/gpu/=
drm/nouveau/include/nvif/outp.h
> > index 45daadec3c0c..fa76a7b5e4b3 100644
> > --- a/drivers/gpu/drm/nouveau/include/nvif/outp.h
> > +++ b/drivers/gpu/drm/nouveau/include/nvif/outp.h
> > @@ -3,6 +3,7 @@
> >  #define __NVIF_OUTP_H__
> >  #include <nvif/object.h>
> >  #include <nvif/if0012.h>
> > +#include <drm/display/drm_dp.h>
> >  struct nvif_disp;
> > =20
> >  struct nvif_outp {
> > @@ -21,7 +22,7 @@ int nvif_outp_acquire_rgb_crt(struct nvif_outp *);
> >  int nvif_outp_acquire_tmds(struct nvif_outp *, int head,
> >  =09=09=09   bool hdmi, u8 max_ac_packet, u8 rekey, u8 scdc, bool hda);
> >  int nvif_outp_acquire_lvds(struct nvif_outp *, bool dual, bool bpc8);
> > -int nvif_outp_acquire_dp(struct nvif_outp *, u8 dpcd[16],
> > +int nvif_outp_acquire_dp(struct nvif_outp *outp, u8 dpcd[DP_RECEIVER_C=
AP_SIZE],
> >  =09=09=09 int link_nr, int link_bw, bool hda, bool mst);
> >  void nvif_outp_release(struct nvif_outp *);
> >  int nvif_outp_infoframe(struct nvif_outp *, u8 type, struct nvif_outp_=
infoframe_v0 *, u32 size);
> > diff --git a/drivers/gpu/drm/nouveau/nvif/outp.c b/drivers/gpu/drm/nouv=
eau/nvif/outp.c
> > index 7da39f1eae9f..c24bc5eae3ec 100644
> > --- a/drivers/gpu/drm/nouveau/nvif/outp.c
> > +++ b/drivers/gpu/drm/nouveau/nvif/outp.c
> > @@ -127,7 +127,7 @@ nvif_outp_acquire(struct nvif_outp *outp, u8 proto,=
 struct nvif_outp_acquire_v0
> >  }
> > =20
> >  int
> > -nvif_outp_acquire_dp(struct nvif_outp *outp, u8 dpcd[16],
> > +nvif_outp_acquire_dp(struct nvif_outp *outp, u8 dpcd[DP_RECEIVER_CAP_S=
IZE],
> >  =09=09     int link_nr, int link_bw, bool hda, bool mst)
> >  {
> >  =09struct nvif_outp_acquire_v0 args;
> > --=20
> > 2.34.1
> >=20
>=20

--=20
Cheers,
 Lyude Paul (she/her)
 Software Engineer at Red Hat

