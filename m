Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A42B372EDD0
	for <lists+nouveau@lfdr.de>; Tue, 13 Jun 2023 23:23:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F31AB10E3E0;
	Tue, 13 Jun 2023 21:23:48 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A31C510E3E0
 for <nouveau@lists.freedesktop.org>; Tue, 13 Jun 2023 21:23:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1686691426;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=EWsjugpohne5df5/X+6GB3p53oFQ5MGoNldK3p6P9vk=;
 b=UNYKXCS9WT6o9XpjpbQcwYRYtGER5gF1etrbl9OFsgSamRzsfXhM6FzIMMBHlnfPljW2c6
 kfYEkLc2oZW0nmjqMEUpcXLt0lR5gV5Is3zmb5MqftiW1j2P50htPlZNwImmhqP5EGAFkJ
 hAZvjjFHZ2qsTjwNIj9+bIEY1Ar+3O0=
Received: from mail-lj1-f198.google.com (mail-lj1-f198.google.com
 [209.85.208.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-581-ApZFaEaGP_-I2BUy0rz3-Q-1; Tue, 13 Jun 2023 17:23:45 -0400
X-MC-Unique: ApZFaEaGP_-I2BUy0rz3-Q-1
Received: by mail-lj1-f198.google.com with SMTP id
 38308e7fff4ca-2b330fbc513so3428271fa.0
 for <nouveau@lists.freedesktop.org>; Tue, 13 Jun 2023 14:23:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686691424; x=1689283424;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=EWsjugpohne5df5/X+6GB3p53oFQ5MGoNldK3p6P9vk=;
 b=SKta2JvO92wyy4ZpwUArGkeeMM13yjfqbAzVxBuRWTPZ2cEhmkUSboY5R7vYBD6WDk
 CqLj/Fb0urcvtKbvIXeXCtFSezz8HEXaHGaZcbIJUWl4efF2W+af6nYFXoo8xgcsPRcQ
 gEEJJ+YzSba7FbkNxf7mZqkNJGJxSqmw+aHBKGgbgl8MPg1wk9c9Ur69ftDv5qgirfSF
 ZJpxcDmTrvSbu2sfJ3szpEUhsmc+jEn6UImJon/sqEmmpHFKGp6ORRR4SjzRi6TsMZU6
 VibiF0moaQ1v8Gw6oKCAAvUdXVzo5CVCGX3zh9PQ9Owy+v13nhFATCQww0M0Qn5SUqt5
 aONw==
X-Gm-Message-State: AC+VfDyOrclkQL8Q+eN6xOYjTNJSwdA+0BotUUcq6rT3codizEWeqSWC
 vRJqDkkaWDDag2GahH8JgJ6iR43vuh8lh8dWyq3dL0BI+7I57dN8t08QDGEchEQ5qTG0ooZ6Iy+
 3NjOMw1uqj/oN3yV4TKxJru5Qs024EdCIGm1O9wMW6w==
X-Received: by 2002:a05:651c:169b:b0:2b1:e625:7e1b with SMTP id
 bd27-20020a05651c169b00b002b1e6257e1bmr6319980ljb.0.1686691424071; 
 Tue, 13 Jun 2023 14:23:44 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ5AlCNoOaXbVxU5NOLaYc+4CaTl5SFp3/u3ykWEuLnEhB2JrvIcHz5LPSUIjytKMktVlyqAzKFlzlBmlBdkItY=
X-Received: by 2002:a05:651c:169b:b0:2b1:e625:7e1b with SMTP id
 bd27-20020a05651c169b00b002b1e6257e1bmr6319969ljb.0.1686691423715; Tue, 13
 Jun 2023 14:23:43 -0700 (PDT)
MIME-Version: 1.0
References: <20230613210529.552098-1-lyude@redhat.com>
In-Reply-To: <20230613210529.552098-1-lyude@redhat.com>
From: Karol Herbst <kherbst@redhat.com>
Date: Tue, 13 Jun 2023 23:23:32 +0200
Message-ID: <CACO55tvju6-pF-e9-Zx+7dNB1XKavaf74RW0yGheGzbM1w9nhg@mail.gmail.com>
To: Lyude Paul <lyude@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Subject: Re: [Nouveau] [PATCH] drm/nouveau/kms/nv50-: Fix
 drm_dp_remove_payload() invocation
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
Cc: Jani Nikula <jani.nikula@intel.com>,
 "open list:DRM DRIVER FOR NVIDIA GEFORCE/QUADRO GPUS"
 <nouveau@lists.freedesktop.org>, open list <linux-kernel@vger.kernel.org>,
 dri-devel@lists.freedesktop.org, Ben Skeggs <bskeggs@redhat.com>,
 Daniel Vetter <daniel@ffwll.ch>, Dave Airlie <airlied@redhat.com>,
 nouveau-devel@lists.freedesktop.org
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

On Tue, Jun 13, 2023 at 11:05=E2=80=AFPM Lyude Paul <lyude@redhat.com> wrot=
e:
>
> We changed the semantics for this in:
>
> e761cc20946a ("drm/display/dp_mst: Handle old/new payload states in drm_d=
p_remove_payload()")
>
> But I totally forgot to update this properly in nouveau. So, let's do tha=
t.
>
> Signed-off-by: Lyude Paul <lyude@redhat.com>

Reviewed-by: Karol Herbst <kherbst@redhat.com>

> ---
>  drivers/gpu/drm/nouveau/dispnv50/disp.c | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/nouveau/dispnv50/disp.c b/drivers/gpu/drm/no=
uveau/dispnv50/disp.c
> index 5bb777ff13130..1637e08b548c2 100644
> --- a/drivers/gpu/drm/nouveau/dispnv50/disp.c
> +++ b/drivers/gpu/drm/nouveau/dispnv50/disp.c
> @@ -909,15 +909,19 @@ nv50_msto_prepare(struct drm_atomic_state *state,
>         struct nouveau_drm *drm =3D nouveau_drm(msto->encoder.dev);
>         struct nv50_mstc *mstc =3D msto->mstc;
>         struct nv50_mstm *mstm =3D mstc->mstm;
> -       struct drm_dp_mst_atomic_payload *payload;
> +       struct drm_dp_mst_topology_state *old_mst_state;
> +       struct drm_dp_mst_atomic_payload *payload, *old_payload;
>
>         NV_ATOMIC(drm, "%s: msto prepare\n", msto->encoder.name);
>
> +       old_mst_state =3D drm_atomic_get_old_mst_topology_state(state, mg=
r);
> +
>         payload =3D drm_atomic_get_mst_payload_state(mst_state, mstc->por=
t);
> +       old_payload =3D drm_atomic_get_mst_payload_state(old_mst_state, m=
stc->port);
>
>         // TODO: Figure out if we want to do a better job of handling VCP=
I allocation failures here?
>         if (msto->disabled) {
> -               drm_dp_remove_payload(mgr, mst_state, payload, payload);
> +               drm_dp_remove_payload(mgr, mst_state, old_payload, payloa=
d);
>
>                 nvif_outp_dp_mst_vcpi(&mstm->outp->outp, msto->head->base=
.index, 0, 0, 0, 0);
>         } else {
> --
> 2.40.1
>

