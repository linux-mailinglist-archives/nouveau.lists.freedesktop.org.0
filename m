Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3938E4247CB
	for <lists+nouveau@lfdr.de>; Wed,  6 Oct 2021 22:14:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 934B66EE64;
	Wed,  6 Oct 2021 20:14:39 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 079116EE65
 for <nouveau@lists.freedesktop.org>; Wed,  6 Oct 2021 20:14:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633551277;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cagY2D5F5NT1bAs4th+N+T0RHoiMV1A9dmi9z8s6Y24=;
 b=g8s25XtKdTtuixw1B/OLOBiwwfVnGhWPgbr55xij6n6kE28IQnSkb9PjDE+pCJeX9gIFWV
 uM+cSHviiOTtnhhc9ZRThZIvXP55O5SVliYqolwbArsBt5IVqhKmF5V3KoJsst4ebWZ5Qe
 PoC62ffbwPkP5+4PBvdMaWrNljxJM2Q=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-36-iMnZHNoOO_KrqWpbuePlWQ-1; Wed, 06 Oct 2021 16:14:33 -0400
X-MC-Unique: iMnZHNoOO_KrqWpbuePlWQ-1
Received: by mail-qk1-f200.google.com with SMTP id
 r5-20020a05620a298500b0045dac5fb940so3063673qkp.17
 for <nouveau@lists.freedesktop.org>; Wed, 06 Oct 2021 13:14:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:organization:user-agent:mime-version
 :content-transfer-encoding;
 bh=cagY2D5F5NT1bAs4th+N+T0RHoiMV1A9dmi9z8s6Y24=;
 b=EL2xrsOYBWx9K76tt3IFIJ9XX1cUSIuuayTd9x+R1hZV6L3xG2bTCLiGoC9nuO5Taf
 iu71GpGvdcQ4I6q7ONHqcNH7E7Ozx6DwHlbAzv0INzWZVa5yO+iqfXSeMF/x3KS8iyOX
 abc6njIRd++UwwQtfDHiV5etiKMMWm8lE3hrpQw2Zwy/lbGf7jcm6hclir3/ONq27lva
 +wE+gKWf020+JoOS5Is3iI4nRSRYVxCwuHy4M8NODagTrmfpIZFuge8eihtvyP89Nf9q
 xT8vmN5G9Yv46fXxp65v1xyfHLwFp9oGScJcFudkIQ0ftx5Wcvz49PDF7whDVhS1YyGy
 0k/Q==
X-Gm-Message-State: AOAM532ie8u4w+7ondwlm2YwjwDOODJjWNUvhCclpYJ5i+Nqifg+O2Tu
 Aq3p/PXrEtjDJczkdCU92lZ7rk3jRWHXDHSkt5BR2VIyIzV9TcxLkHPqi5Ku6cJAqonl9f6bVko
 6kRvNyLWRjhpDQtJnh+OXqVAxnw==
X-Received: by 2002:a37:2e03:: with SMTP id u3mr104155qkh.313.1633551273265;
 Wed, 06 Oct 2021 13:14:33 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy67uYZrgGccEL/pHmqUgpGEvM4fHcBT6qlvJsJt9Y4Bhg/bkAcrUOLDF6lDPANJdbr6kVesg==
X-Received: by 2002:a37:2e03:: with SMTP id u3mr104131qkh.313.1633551272978;
 Wed, 06 Oct 2021 13:14:32 -0700 (PDT)
Received: from [192.168.8.206] (pool-96-230-249-157.bstnma.fios.verizon.net.
 [96.230.249.157])
 by smtp.gmail.com with ESMTPSA id h17sm13302582qtp.13.2021.10.06.13.14.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Oct 2021 13:14:32 -0700 (PDT)
Message-ID: <f9c4bd7a1ac1a43a4cd2cde8e6d23a60a245b7e7.camel@redhat.com>
From: Lyude Paul <lyude@redhat.com>
To: Karol Herbst <kherbst@redhat.com>
Cc: Intel Graphics Development <intel-gfx@lists.freedesktop.org>, dri-devel
 <dri-devel@lists.freedesktop.org>, nouveau <nouveau@lists.freedesktop.org>,
 Ben Skeggs <bskeggs@redhat.com>, David Airlie <airlied@linux.ie>, Daniel
 Vetter <daniel@ffwll.ch>,  open list <linux-kernel@vger.kernel.org>
Date: Wed, 06 Oct 2021 16:14:31 -0400
In-Reply-To: <CACO55tuMWVgsd44s1sAvgrKDHFZT2Z3F+CSqAh34_XaekYWuHA@mail.gmail.com>
References: <20211006024018.320394-1-lyude@redhat.com>
 <20211006024018.320394-3-lyude@redhat.com>
 <CACO55tuMWVgsd44s1sAvgrKDHFZT2Z3F+CSqAh34_XaekYWuHA@mail.gmail.com>
Organization: Red Hat
User-Agent: Evolution 3.40.4 (3.40.4-1.fc34)
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lyude@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Subject: Re: [Nouveau] [PATCH v3 2/5] drm/nouveau/kms/nv50-: Explicitly
 check DPCD backlights for aux enable/brightness
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

On Wed, 2021-10-06 at 18:30 +0200, Karol Herbst wrote:
> On Wed, Oct 6, 2021 at 4:41 AM Lyude Paul <lyude@redhat.com> wrote:
> > 
> > Since we don't support hybrid AUX/PWM backlights in nouveau right now,
> > let's add some explicit checks so that we don't break nouveau once we
> > enable support for these backlights in other drivers.
> > 
> > Signed-off-by: Lyude Paul <lyude@redhat.com>
> > ---
> >  drivers/gpu/drm/nouveau/nouveau_backlight.c | 5 ++++-
> >  1 file changed, 4 insertions(+), 1 deletion(-)
> > 
> > diff --git a/drivers/gpu/drm/nouveau/nouveau_backlight.c
> > b/drivers/gpu/drm/nouveau/nouveau_backlight.c
> > index 1cbd71abc80a..ae2f2abc8f5a 100644
> > --- a/drivers/gpu/drm/nouveau/nouveau_backlight.c
> > +++ b/drivers/gpu/drm/nouveau/nouveau_backlight.c
> > @@ -308,7 +308,10 @@ nv50_backlight_init(struct nouveau_backlight *bl,
> >                 if (ret < 0)
> >                         return ret;
> > 
> > -               if (drm_edp_backlight_supported(edp_dpcd)) {
> > +               /* TODO: Add support for hybrid PWM/DPCD panels */
> > +               if (drm_edp_backlight_supported(edp_dpcd) &&
> > +                   (edp_dpcd[1] & DP_EDP_BACKLIGHT_AUX_ENABLE_CAP) &&
> 
> where does the DP_EDP_BACKLIGHT_AUX_ENABLE_CAP come from? afaik
> drm_edp_backlight_supported checks for
> DP_EDP_BACKLIGHT_BRIGHTNESS_AUX_SET_CAP and
> DP_EDP_TCON_BACKLIGHT_ADJUSTMENT_CAP so wondering if this was
> intentional or a typo

This is intentional - drm_edp_backlight_supported() does check for these, but
in the patch after this we remove the BRIGHTNESS_AUX_SET_CAP from
drm_edp_backlight_supported() in order to implement support for panels lacking
BRIGHTNESS_AUX_SET_CAP in i915. Since we don't have support for this in
nouveau yet but such backlights are likely to mostly work without the use of
DPCD if we avoid trying to set it up, this patch is just here to make sure
that the changes to drm_edp_backlight_supported() don't result in nouveau
suddenly trying (and failing) to enable DPCD backlight controls on those
backlights.

> 
> > +                   (edp_dpcd[2] &
> > DP_EDP_BACKLIGHT_BRIGHTNESS_AUX_SET_CAP)) {
> >                         NV_DEBUG(drm, "DPCD backlight controls supported
> > on %s\n",
> >                                  nv_conn->base.name);
> > 
> > --
> > 2.31.1
> > 
> 

-- 
Cheers,
 Lyude Paul (she/her)
 Software Engineer at Red Hat

