Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A726B66C6F0
	for <lists+nouveau@lfdr.de>; Mon, 16 Jan 2023 17:26:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 09CD510E462;
	Mon, 16 Jan 2023 16:26:54 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1ABD710E462
 for <nouveau@lists.freedesktop.org>; Mon, 16 Jan 2023 16:26:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1673886411;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=r2boqvfD+RJ61HpS/wHyE329kUvwll2CIPBJV6eZl4c=;
 b=IDjmgHopGyiIonvakEi5RH1XTKJynlefCM8gCCgv3IkRDnrFsn8eHM3cdtLzevA610m6AY
 BoBdPpdTfnU6t+Kqz/fkCTVmcw/Ij/HM9LH0ubwdZEGXra5om8fly76wPFnJmZU3LbLIjC
 sLJhK09JlB3X6D/6uBQb92BgmQRr17o=
Received: from mail-lj1-f197.google.com (mail-lj1-f197.google.com
 [209.85.208.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-627-LK5ybN4mPFiT-Ss44StNjw-1; Mon, 16 Jan 2023 11:26:50 -0500
X-MC-Unique: LK5ybN4mPFiT-Ss44StNjw-1
Received: by mail-lj1-f197.google.com with SMTP id
 a25-20020a05651c211900b0028b7a49f813so1333171ljq.19
 for <nouveau@lists.freedesktop.org>; Mon, 16 Jan 2023 08:26:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=r2boqvfD+RJ61HpS/wHyE329kUvwll2CIPBJV6eZl4c=;
 b=mKd1Gw/gKHAhAuA3GM4+fvYIJsOhmTzACSyKH2+QkeOauwKhnvJ57qB0TsHp6XlRix
 WJvwvDOQK6BDmYXuO4rfnzh9afKaJi625Szl8a+awo1zrFvza3jeKfDCCo2ixdupY15s
 6RUZ/psfC3W62/7UKfpXnIXwfo8EzLHm7d7UFKBmzXcTvylPlRHQ7gHjT+5AQRP9wEpi
 ge9V4xCU0096A25rgRdy3fQH2Evs9WJWAbNI0yHvx1YMf01Q1Im89m0Tm3cQrjOoehx1
 Cy0lV0hUyriCQp8VuSOz5kUm8LmZOWuTiS1ocWnyF0s19Z8MNR6oIxDoolgRxuok6U0E
 UPOQ==
X-Gm-Message-State: AFqh2kpX3b1SPkpIQgqOPu+obvbxwD47uFfv2XJxmUtQul7GMlQDLBjD
 LvBMNmudUZYUXBD55Eom4fWV3DrASufsJ8zDHOoetx9hf5TQse/cKwiumNRWBmIvnoi5v1NtD5S
 DDiyK4AmeI9TvkX0XuWbC4GoSZUOxM2XVh7FDffX3XQ==
X-Received: by 2002:a05:6512:7c:b0:4d5:7b89:7b67 with SMTP id
 i28-20020a056512007c00b004d57b897b67mr110390lfo.17.1673886408807; 
 Mon, 16 Jan 2023 08:26:48 -0800 (PST)
X-Google-Smtp-Source: AMrXdXsl3G5delLpsUSEikj3rrvMcC9LUAx6uCt/IgZvb4ulTe/2Bhgjm8AC830LNMSyFXE01XKOE/f4hSEa4jTVlHk=
X-Received: by 2002:a05:6512:7c:b0:4d5:7b89:7b67 with SMTP id
 i28-20020a056512007c00b004d57b897b67mr110384lfo.17.1673886408656; Mon, 16 Jan
 2023 08:26:48 -0800 (PST)
MIME-Version: 1.0
References: <20230103234835.never.378-kees@kernel.org> <Y7TNtQqunHIW8her@work>
 <CACO55tsyCtf-_mCPVEo-4Dj_mAu-tnNTTjP75wx=9n+TS1XVvw@mail.gmail.com>
In-Reply-To: <CACO55tsyCtf-_mCPVEo-4Dj_mAu-tnNTTjP75wx=9n+TS1XVvw@mail.gmail.com>
From: Karol Herbst <kherbst@redhat.com>
Date: Mon, 16 Jan 2023 17:26:37 +0100
Message-ID: <CACO55tvuhLzbtg-wzy24Y7Y4k4CN_3JZM5VZ-9VPFNZK3skKCg@mail.gmail.com>
To: "Gustavo A. R. Silva" <gustavoars@kernel.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Nouveau] [RESEND][PATCH] drm/nouveau/fb/ga102: Replace
 zero-length array of trailing structs with flex-array
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
Cc: Kees Cook <keescook@chromium.org>, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Ben Skeggs <bskeggs@redhat.com>, Gourav Samaiya <gsamaiya@nvidia.com>,
 linux-hardening@vger.kernel.org
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

On Mon, Jan 16, 2023 at 5:24 PM Karol Herbst <kherbst@redhat.com> wrote:
>
> On Wed, Jan 4, 2023 at 1:52 AM Gustavo A. R. Silva
> <gustavoars@kernel.org> wrote:
> >
> > On Tue, Jan 03, 2023 at 03:48:36PM -0800, Kees Cook wrote:
> > > Zero-length arrays are deprecated[1] and are being replaced with
> > > flexible array members in support of the ongoing efforts to tighten the
> > > FORTIFY_SOURCE routines on memcpy(), correctly instrument array indexing
> > > with UBSAN_BOUNDS, and to globally enable -fstrict-flex-arrays=3.
> > >
> > > Replace zero-length array with flexible-array member.
> > >
> > > This results in no differences in binary output.
> > >
> > > [1] https://github.com/KSPP/linux/issues/78
> > >
> > > Cc: Ben Skeggs <bskeggs@redhat.com>
> > > Cc: Karol Herbst <kherbst@redhat.com>
> > > Cc: Lyude Paul <lyude@redhat.com>
> > > Cc: David Airlie <airlied@gmail.com>
> > > Cc: Daniel Vetter <daniel@ffwll.ch>
> > > Cc: Gourav Samaiya <gsamaiya@nvidia.com>
> > > Cc: "Gustavo A. R. Silva" <gustavoars@kernel.org>
> > > Cc: dri-devel@lists.freedesktop.org
> > > Cc: nouveau@lists.freedesktop.org
> > > Signed-off-by: Kees Cook <keescook@chromium.org>
> >
> > Here is my RB again:
> >
> > Reviewed-by: Gustavo A. R. Silva <gustavoars@kernel.org>
> >
>
> Reviewed-by: Karol Herbst <kherbst@redhat.com>
>
> will push in a moment
>

just noticed it's the same change than the other one... anyway, will
push the oldest one

> > Thanks!
> > --
> > Gustavo
> >
> > > ---
> > > Sent before as: https://lore.kernel.org/all/20221118211207.never.039-kees@kernel.org/
> > > ---
> > >  drivers/gpu/drm/nouveau/include/nvfw/hs.h | 2 +-
> > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > >
> > > diff --git a/drivers/gpu/drm/nouveau/include/nvfw/hs.h b/drivers/gpu/drm/nouveau/include/nvfw/hs.h
> > > index 8c4cd08a7b5f..8b58b668fc0c 100644
> > > --- a/drivers/gpu/drm/nouveau/include/nvfw/hs.h
> > > +++ b/drivers/gpu/drm/nouveau/include/nvfw/hs.h
> > > @@ -52,7 +52,7 @@ struct nvfw_hs_load_header_v2 {
> > >       struct {
> > >               u32 offset;
> > >               u32 size;
> > > -     } app[0];
> > > +     } app[];
> > >  };
> > >
> > >  const struct nvfw_hs_load_header_v2 *nvfw_hs_load_header_v2(struct nvkm_subdev *, const void *);
> > > --
> > > 2.34.1
> > >
> >

