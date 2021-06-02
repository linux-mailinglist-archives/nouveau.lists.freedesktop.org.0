Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 80256397D90
	for <lists+nouveau@lfdr.de>; Wed,  2 Jun 2021 02:10:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 71D486E2D5;
	Wed,  2 Jun 2021 00:10:37 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 17E096EB3D
 for <nouveau@lists.freedesktop.org>; Wed,  2 Jun 2021 00:10:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1622592634;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=g6XERwupFZipcAmg6D1I1zxjEbLYz5zppsdgraxGF7Q=;
 b=ZCSLw/lyvlQACVz8Hr6sOBefF39Tz+PZebRYr8i/WAZZWDD8I3teL6OusznVFkOpZHBQ/G
 ybbXxN/4GM1J7G0t4CKVj5rrEIta/fUyne3LLgZ5lhKPz/WLVaYukAqnm2PNJOIJ99QfhF
 S9aFIWzskRlJziD74aL8Q7G1HBE67dw=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-62-W5N6uAKIP0C-RGL1V8InmQ-1; Tue, 01 Jun 2021 20:10:31 -0400
X-MC-Unique: W5N6uAKIP0C-RGL1V8InmQ-1
Received: by mail-wm1-f69.google.com with SMTP id
 18-20020a05600c0252b029019a0ce35d36so1512088wmj.4
 for <nouveau@lists.freedesktop.org>; Tue, 01 Jun 2021 17:10:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=g6XERwupFZipcAmg6D1I1zxjEbLYz5zppsdgraxGF7Q=;
 b=pnwlcmOgCGecDVzd07K50S4JaskgxpJWHdAYkaD6sWeaSEATe7Pt3+9cgrEQ+a94NT
 Jfjax73NwL6vvONt2szumacolmGAJiTI9mX20eSd+QJ7ixWqVJX/5bLOX24kxhZw4FII
 amWD30EGIU8Pm77wPwJu/KKxM1yC3OVNsQxB1Y4+iOuegIw+o5SqS85I12vgJhkITZ7D
 GGykwGTGHKdNAQog8saDdxRJb2ZkYMzbJxKqdcBQN2Kg6/XuY0ciQ8MTuFS17+0NW3fX
 1hEgCXI4KpNS9eMMoHOE6GMZSkR7ejs/ow8s4nJqp7SA0XMppWImV1k2yRB51ZnnQoHm
 I8Cg==
X-Gm-Message-State: AOAM533+Eo1HjpLlOzmNfZLfAqCY/zvmdzzFuJyI3VAlpwDNYh1jyOnf
 rnvNQs40hDQkU22AufG7pMWfpgWCcyEDHYdTx2D7j3viJH+zhYyGRy3cFkW4s82eqkjh6MTd1Gp
 XkbZZFhfVA5OWN1IdCZc2uHvWdba4AXCuBe3aRCdWmg==
X-Received: by 2002:adf:dcc3:: with SMTP id x3mr8763240wrm.177.1622592629494; 
 Tue, 01 Jun 2021 17:10:29 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy+7ytifh8Tq7X7nnucf7aYm2Vw3csWvxa0+c2QJbbdpuaVNF93Pvls4Lv1rmxm1PeJU5y+Ay/NirV8hdJrDSY=
X-Received: by 2002:adf:dcc3:: with SMTP id x3mr8763219wrm.177.1622592629297; 
 Tue, 01 Jun 2021 17:10:29 -0700 (PDT)
MIME-Version: 1.0
References: <20210305095657.GA142006@embeddedor>
 <79ff569a-5828-ef21-538b-12d07d34a4ff@embeddedor.com>
 <1ec627af-514e-b24a-da88-13eb561ccb15@embeddedor.com>
In-Reply-To: <1ec627af-514e-b24a-da88-13eb561ccb15@embeddedor.com>
From: Karol Herbst <kherbst@redhat.com>
Date: Wed, 2 Jun 2021 02:10:18 +0200
Message-ID: <CACO55tv3o72GwG8ORcUYQ-nXFDi1Qo0uKG5T_4iVmuhdDxPdqg@mail.gmail.com>
To: "Gustavo A. R. Silva" <gustavo@embeddedor.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kherbst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Subject: Re: [Nouveau] [PATCH RESEND][next] drm/nouveau: Fix fall-through
 warnings for Clang
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
Cc: Kees Cook <keescook@chromium.org>, David Airlie <airlied@linux.ie>,
 nouveau <nouveau@lists.freedesktop.org>,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>, Ben Skeggs <bskeggs@redhat.com>,
 Daniel Vetter <daniel@ffwll.ch>, linux-hardening@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

all three nouveau patches are

Reviewed-by: Karol Herbst <kherbst@redhat.com>

and I don't think anybody would mind if those get into through other
trees, but maybe drm-mist would be a good place for it if other
patches involve other drm drivers?

On Wed, Jun 2, 2021 at 1:16 AM Gustavo A. R. Silva
<gustavo@embeddedor.com> wrote:
>
> Hi,
>
> Friendly second ping: who can take this?
>
> I can add this to my -next branch for 5.14 if you don't mind.
>
> JFYI: We had thousands of these sorts of warnings and now we are down
> to just 23 in linux-next. This is one of those last remaining warnings.
>
> Thanks
> --
> Gustavo
>
> On 4/20/21 15:13, Gustavo A. R. Silva wrote:
> > Hi all,
> >
> > Friendly ping: who can take this, please?
> >
> > Thanks
> > --
> > Gustavo
> >
> > On 3/5/21 03:56, Gustavo A. R. Silva wrote:
> >> In preparation to enable -Wimplicit-fallthrough for Clang, fix a couple
> >> of warnings by explicitly adding a couple of break statements instead
> >> of letting the code fall through to the next case.
> >>
> >> Link: https://github.com/KSPP/linux/issues/115
> >> Signed-off-by: Gustavo A. R. Silva <gustavoars@kernel.org>
> >> ---
> >>  drivers/gpu/drm/nouveau/nouveau_bo.c        | 1 +
> >>  drivers/gpu/drm/nouveau/nouveau_connector.c | 1 +
> >>  2 files changed, 2 insertions(+)
> >>
> >> diff --git a/drivers/gpu/drm/nouveau/nouveau_bo.c b/drivers/gpu/drm/nouveau/nouveau_bo.c
> >> index 2375711877cf..62903c3b368d 100644
> >> --- a/drivers/gpu/drm/nouveau/nouveau_bo.c
> >> +++ b/drivers/gpu/drm/nouveau/nouveau_bo.c
> >> @@ -443,6 +443,7 @@ nouveau_bo_pin(struct nouveau_bo *nvbo, uint32_t domain, bool contig)
> >>                      break;
> >>              case TTM_PL_TT:
> >>                      error |= !(domain & NOUVEAU_GEM_DOMAIN_GART);
> >> +                    break;
> >>              default:
> >>                      break;
> >>              }
> >> diff --git a/drivers/gpu/drm/nouveau/nouveau_connector.c b/drivers/gpu/drm/nouveau/nouveau_connector.c
> >> index 61e6d7412505..eb844cdcaec2 100644
> >> --- a/drivers/gpu/drm/nouveau/nouveau_connector.c
> >> +++ b/drivers/gpu/drm/nouveau/nouveau_connector.c
> >> @@ -157,6 +157,7 @@ nouveau_conn_atomic_set_property(struct drm_connector *connector,
> >>                      default:
> >>                              break;
> >>                      }
> >> +                    break;
> >>              case DRM_MODE_SCALE_FULLSCREEN:
> >>              case DRM_MODE_SCALE_CENTER:
> >>              case DRM_MODE_SCALE_ASPECT:
> >>
> _______________________________________________
> Nouveau mailing list
> Nouveau@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/nouveau
>

_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
