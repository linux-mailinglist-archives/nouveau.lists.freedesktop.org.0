Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B5F256AF929
	for <lists+nouveau@lfdr.de>; Tue,  7 Mar 2023 23:46:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E34EB10E567;
	Tue,  7 Mar 2023 22:46:51 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B378210E564
 for <nouveau@lists.freedesktop.org>; Tue,  7 Mar 2023 22:46:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678229208;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=D+lMV0jdd+rVbHQRucIl145VMEMkgnli2TmhEhYF6aE=;
 b=N1eBZkRCyy+8lq3a5tWstwejp5m8lXwtjhUe+S2Emc9lkWM1V2rgtvowHqYq+OxJ0ROlvr
 sMlE9YBFoXsjCy1bmAgqh6BW24BVeVind5/A0RDsJicD93yUR2KD2U4Z7TK581Pd6OoAVO
 fr3a57pAc5OkvLnH4VHQ5qoRA2Bzzz8=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-269-aqL1nkvrNZq_xYp7NHZrtA-1; Tue, 07 Mar 2023 17:46:47 -0500
X-MC-Unique: aqL1nkvrNZq_xYp7NHZrtA-1
Received: by mail-qv1-f72.google.com with SMTP id
 lt7-20020a056214570700b0057290f3623eso8260723qvb.3
 for <nouveau@lists.freedesktop.org>; Tue, 07 Mar 2023 14:46:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678229207;
 h=mime-version:user-agent:content-transfer-encoding:organization
 :references:in-reply-to:date:cc:to:from:subject:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=D+lMV0jdd+rVbHQRucIl145VMEMkgnli2TmhEhYF6aE=;
 b=wI/QWXeTpl7KmAHEjcZxrK3ZondYNtTUpe/+t2lWLMwU/lRejy5hrJDKo8GzyAF+0m
 +tO5xm2/BL/0WvhpPTzfVpJ7bsDfJvJzMYtryzW2jY+rXMjFpseUIFg7deAKFSgzhTmZ
 bvqBnwsPJDccgMf3X/ylM1dnY3zbVyjVXbOGPyJ5Mo3ns7REcle3luMY7o2L4FqimMnz
 0OXz7j4r7eL2FLQ75nCtNhiuUw6uzaAL+hXiOywmM46BMV2h1M60Nox0+WH7DKTcq8Nx
 TieLLIaRvuYXKPRMnc7AdMxz5PrYG6Y4v19WltFJun7MX+BPS3aJrkKyslIJ7OCJ4ioQ
 RQlA==
X-Gm-Message-State: AO0yUKWSl8oc7FAOxAHKFYOCcxegt0XkL2kuOATTZvOT6w2NzbM/RCWr
 js2oTeBic9JoBnxLdJ/q754jMq6s6K0RmxkraqAASuRE2XoKKiNJS3GRA4ghSNdAXOH9ovo2ojD
 rfLZHWqFtprAg9z8uhVg88I6IOw==
X-Received: by 2002:a05:622a:24c:b0:3bf:d07e:ee17 with SMTP id
 c12-20020a05622a024c00b003bfd07eee17mr27703405qtx.39.1678229207432; 
 Tue, 07 Mar 2023 14:46:47 -0800 (PST)
X-Google-Smtp-Source: AK7set8P1yL5WfXGleyVYacQ3ibXaMhN21P0MtcWzIXGgZJYC6emze48ZF0Sor8oqXZOxb/jcDhmSA==
X-Received: by 2002:a05:622a:24c:b0:3bf:d07e:ee17 with SMTP id
 c12-20020a05622a024c00b003bfd07eee17mr27703371qtx.39.1678229207119; 
 Tue, 07 Mar 2023 14:46:47 -0800 (PST)
Received: from ?IPv6:2600:4040:5c68:6800::feb? ([2600:4040:5c68:6800::feb])
 by smtp.gmail.com with ESMTPSA id
 w19-20020ac843d3000000b003bfbf3afe51sm10369764qtn.93.2023.03.07.14.46.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Mar 2023 14:46:46 -0800 (PST)
Message-ID: <160cbdb25510df6f2e3194c6dd4a2c47a4ee70b7.camel@redhat.com>
From: Lyude Paul <lyude@redhat.com>
To: Jakob Koschel <jkl820.git@gmail.com>, Ben Skeggs <bskeggs@redhat.com>, 
 Karol Herbst <kherbst@redhat.com>, David Airlie <airlied@gmail.com>, Daniel
 Vetter <daniel@ffwll.ch>
Date: Tue, 07 Mar 2023 17:46:45 -0500
In-Reply-To: <2732d141a82c0f9410d001fe656d30c5e32311de.camel@redhat.com>
References: <20230301-drm-nouveau-avoid-iter-after-loop-v1-0-0702ec23f970@gmail.com>
 <2732d141a82c0f9410d001fe656d30c5e32311de.camel@redhat.com>
Organization: Red Hat Inc.
User-Agent: Evolution 3.44.4 (3.44.4-2.fc36)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Subject: Re: [Nouveau] [PATCH 0/2] drm/nouveau: avoid usage of list iterator
 after loop
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
Cc: nouveau@lists.freedesktop.org, Pietro Borrello <borrello@diag.uniroma1.it>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Cristiano Giuffrida <c.giuffrida@vu.nl>, "Bos, H.J." <h.j.bos@vu.nl>
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

Actually hm, dim is warning me about this and making me realize there's
probably a better way to handle this, going to revoke the previous r-b I ga=
ve
and respond inline

On Tue, 2023-03-07 at 17:43 -0500, Lyude Paul wrote:
> Reviewed-by: Lyude Paul <lyude@redhat.com>
>=20
> Will push upstream in just a moment
>=20
> On Wed, 2023-03-01 at 18:25 +0100, Jakob Koschel wrote:
> > This patch set includes two instances where the list iterator variable
> > 'pstate' is implicitly assumed to be valid after the iterator loop.
> > While in pratice that is most likely the case (if
> > 'pstatei'/'args->v0.state' is <=3D the elements in clk->states), we sho=
uld
> > explicitly only allow 'pstate' to always point to correct 'nvkm_pstate'
> > structs.
> >=20
> > That allows catching potential bugs with BUG_ON(!pstate) that otherwise
> > would be completely undetectable.
> >=20
> > It also helps the greater mission to hopefully move the list iterator
> > variable into the iterating macro directly [1].
> >=20
> > Link: https://lore.kernel.org/all/CAHk-=3DwgRr_D8CB-D9Kg-c=3DEHreAsk5Sq=
XPwr9Y7k9sA6cWXJ6w@mail.gmail.com/ [1]
> > Signed-off-by: Jakob Koschel <jkl820.git@gmail.com>
> > ---
> > Jakob Koschel (2):
> >       drm/nouveau/device: avoid usage of list iterator after loop
> >       drm/nouveau/clk: avoid usage of list iterator after loop
> >=20
> >  drivers/gpu/drm/nouveau/nvkm/engine/device/ctrl.c | 9 ++++++---
> >  drivers/gpu/drm/nouveau/nvkm/subdev/clk/base.c    | 9 ++++++---
> >  2 files changed, 12 insertions(+), 6 deletions(-)
> > ---
> > base-commit: c0927a7a5391f7d8e593e5e50ead7505a23cadf9
> > change-id: 20230301-drm-nouveau-avoid-iter-after-loop-4bff97166efa
> >=20
> > Best regards,
>=20

--=20
Cheers,
 Lyude Paul (she/her)
 Software Engineer at Red Hat

