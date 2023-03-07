Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7264F6AF91B
	for <lists+nouveau@lfdr.de>; Tue,  7 Mar 2023 23:43:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A12E410E55C;
	Tue,  7 Mar 2023 22:43:14 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6175610E55C
 for <nouveau@lists.freedesktop.org>; Tue,  7 Mar 2023 22:43:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678228991;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bBISRmWtyk5b0q7tO/ZlpLIwLMdyIaEEvwZMNTD2oyo=;
 b=LnhD8ZopbZZz6e9Rn9+o+e3d+qD1qJNluPe3gkNt0xwI5PeCpDF/vDrBcDmhuALu0s8iuy
 gJH+ogCO9ro4ZUSahvmWP4X5TKf8lVWRyu++5NY4KKE2MVwIcep6NXGITo4oD3wTff+tqF
 Ogvk4/WOmL6N3FGLLR0hSaN//xL56xA=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-445-1jlhInatOZG35ZevITMEYQ-1; Tue, 07 Mar 2023 17:43:10 -0500
X-MC-Unique: 1jlhInatOZG35ZevITMEYQ-1
Received: by mail-qk1-f197.google.com with SMTP id
 x14-20020ae9e90e000000b007429af46d5eso8245168qkf.12
 for <nouveau@lists.freedesktop.org>; Tue, 07 Mar 2023 14:43:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678228990;
 h=mime-version:user-agent:content-transfer-encoding:organization
 :references:in-reply-to:date:cc:to:from:subject:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=bBISRmWtyk5b0q7tO/ZlpLIwLMdyIaEEvwZMNTD2oyo=;
 b=Z1TK24uaUfBDrI1/d5lQIslLncHcX8Qf1jwRh6vBPemgjslazP0Kdrew02J3qenMoV
 Fi/bCy+ezoVPVl/pnqf4K7kAnzW2S9vjL3BZchrN92n84N+lp3eoy4MVnOOiM9aG2j+1
 kiFb9vETSXveQfaoUzvVVD5dyXbkioKcxyQickcg0r2ljBB+6n+rljiBICFvN1ItAd8M
 pu3mOpQaDW1gvJRYIxeixEoKZIdPmeZNo43eXHSvgOInbyIJKS0SsXL++RQKsNAd1g41
 m7g2fEyUO407L3jo/24X1DX1CMnz1+3JkrK1ozeeB1ENDIVH47sKL1y+F4Dyp/cyzQck
 FZEg==
X-Gm-Message-State: AO0yUKVKS9pAznL9kdBZyoSe9ayrJZ85JDNfiAveJDFwrQYqOCPEBrTf
 U+K+VzDcL7oyShw2nQ1p2fhPGJMSE9Uo4/zXA6H1cvMcJm+seVeJxO4i9lF3wDHfcmQAOptdfS0
 9ofmngXxAGw3q/DU+f8tedQj0/A==
X-Received: by 2002:ac8:5c02:0:b0:3b8:525e:15ec with SMTP id
 i2-20020ac85c02000000b003b8525e15ecmr30590760qti.27.1678228989835; 
 Tue, 07 Mar 2023 14:43:09 -0800 (PST)
X-Google-Smtp-Source: AK7set+Me9bTPhI1hFsGeGjWpMBd7fZ9BKtiTY5Thb2DH2wKRapu1088yY+WA0JY2Qyr92U3nNacYw==
X-Received: by 2002:ac8:5c02:0:b0:3b8:525e:15ec with SMTP id
 i2-20020ac85c02000000b003b8525e15ecmr30590731qti.27.1678228989586; 
 Tue, 07 Mar 2023 14:43:09 -0800 (PST)
Received: from ?IPv6:2600:4040:5c68:6800::feb? ([2600:4040:5c68:6800::feb])
 by smtp.gmail.com with ESMTPSA id
 u24-20020a37ab18000000b006fa16fe93bbsm10313451qke.15.2023.03.07.14.43.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Mar 2023 14:43:09 -0800 (PST)
Message-ID: <2732d141a82c0f9410d001fe656d30c5e32311de.camel@redhat.com>
From: Lyude Paul <lyude@redhat.com>
To: Jakob Koschel <jkl820.git@gmail.com>, Ben Skeggs <bskeggs@redhat.com>, 
 Karol Herbst <kherbst@redhat.com>, David Airlie <airlied@gmail.com>, Daniel
 Vetter <daniel@ffwll.ch>
Date: Tue, 07 Mar 2023 17:43:07 -0500
In-Reply-To: <20230301-drm-nouveau-avoid-iter-after-loop-v1-0-0702ec23f970@gmail.com>
References: <20230301-drm-nouveau-avoid-iter-after-loop-v1-0-0702ec23f970@gmail.com>
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

Reviewed-by: Lyude Paul <lyude@redhat.com>

Will push upstream in just a moment

On Wed, 2023-03-01 at 18:25 +0100, Jakob Koschel wrote:
> This patch set includes two instances where the list iterator variable
> 'pstate' is implicitly assumed to be valid after the iterator loop.
> While in pratice that is most likely the case (if
> 'pstatei'/'args->v0.state' is <=3D the elements in clk->states), we shoul=
d
> explicitly only allow 'pstate' to always point to correct 'nvkm_pstate'
> structs.
>=20
> That allows catching potential bugs with BUG_ON(!pstate) that otherwise
> would be completely undetectable.
>=20
> It also helps the greater mission to hopefully move the list iterator
> variable into the iterating macro directly [1].
>=20
> Link: https://lore.kernel.org/all/CAHk-=3DwgRr_D8CB-D9Kg-c=3DEHreAsk5SqXP=
wr9Y7k9sA6cWXJ6w@mail.gmail.com/ [1]
> Signed-off-by: Jakob Koschel <jkl820.git@gmail.com>
> ---
> Jakob Koschel (2):
>       drm/nouveau/device: avoid usage of list iterator after loop
>       drm/nouveau/clk: avoid usage of list iterator after loop
>=20
>  drivers/gpu/drm/nouveau/nvkm/engine/device/ctrl.c | 9 ++++++---
>  drivers/gpu/drm/nouveau/nvkm/subdev/clk/base.c    | 9 ++++++---
>  2 files changed, 12 insertions(+), 6 deletions(-)
> ---
> base-commit: c0927a7a5391f7d8e593e5e50ead7505a23cadf9
> change-id: 20230301-drm-nouveau-avoid-iter-after-loop-4bff97166efa
>=20
> Best regards,

--=20
Cheers,
 Lyude Paul (she/her)
 Software Engineer at Red Hat

