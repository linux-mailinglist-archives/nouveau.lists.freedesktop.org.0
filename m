Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0489F2572D3
	for <lists+nouveau@lfdr.de>; Mon, 31 Aug 2020 06:26:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 21F3689E0D;
	Mon, 31 Aug 2020 04:26:33 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-yb1-xb41.google.com (mail-yb1-xb41.google.com
 [IPv6:2607:f8b0:4864:20::b41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A3F389CB5;
 Mon, 31 Aug 2020 04:26:31 +0000 (UTC)
Received: by mail-yb1-xb41.google.com with SMTP id y134so3284752yby.2;
 Sun, 30 Aug 2020 21:26:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=PX06aBk627NQ1JeMegFd6B64tEFsLtmyNkqRlailfm0=;
 b=IC5nDs49gJJNp2v81GvqILFp/15eYtDl2QXUOSAriKrk+Im/ZtF0wapcjFhYD1Aee2
 jvbpHrmUBKZXPH50RHisaYAu6eL3nQMi8tqIbaQ0/GVrplidaSlxi0XkF9MZl9ZISJUy
 4R6NeoUFpvYWgz/AVuuJruEx6FpoghNJLz+43yhjUyTFi+RgQA0FMEjf7VmO0Gn4rpOp
 K/qD0gy4DvulktUJNfw234A3UgA/n0f5FM+/q+PywIVycMRHERMlSkWhhpulpNbrvxve
 NZ2SJEQXzdPfvLg/ZZLsNRwFLSf7nvcbLvCRacQlOO83T58wRYi8uvtv/ICk4aX+fulv
 i55g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=PX06aBk627NQ1JeMegFd6B64tEFsLtmyNkqRlailfm0=;
 b=HLuGSlEEGxoizUrTMjsZDU5ABZkisSP4vcEG7/2WEjGCK6bfqnNrcy0buWd8BLl/S1
 4kY1BcGjP275vPtxr+s66xZseGWcb+jZkZ5be346EQFvrg4fFeYS0D1bIWuY0Jht8pAD
 wWUR1Jz13UW7xcCqWvCcD/UK0R1mHAFFnmy2RrQxK5DnFye1pS7fldRW7lrYbVKj5iuM
 0MIgl24zg3qIG6l9tivZqaMxDEq5FGd/iSvPAWfIx+h89NiaJTheGr4LoE2nPQCicTTg
 Qdpr2p9eQd/tmK+CmsyE3L6aFCtXs/kQDhHn+sajcAYymWsERGA3XCQM24b4hv+ZjwtM
 RdcQ==
X-Gm-Message-State: AOAM53095fGGWaJJTcqLdBccmEImdcE/94unbuKY6vKaell8cAtupIHd
 mVozZvANyO7FRyPcksx0zKgyTtCnfSx3SXhSLNk=
X-Google-Smtp-Source: ABdhPJy+0rEbq+GkNgtCw3GXB22ZHNHLhDwqJ7psgye+ciyrN8LcA9ntQoXdSFcOYdxLiOIsyTwz2cd2MlTJH1iqhGY=
X-Received: by 2002:a25:c4c5:: with SMTP id
 u188mr16615125ybf.162.1598847990436; 
 Sun, 30 Aug 2020 21:26:30 -0700 (PDT)
MIME-Version: 1.0
References: <20200824183253.826343-1-lyude@redhat.com>
 <20200824183253.826343-2-lyude@redhat.com>
 <CACAvsv6hymdcGkEcigL3fWACZ_1POpB+aefq9d9ChnYv_dHnVg@mail.gmail.com>
 <76392bff28359a88fbdf0857f011e0ed9f666dc4.camel@redhat.com>
In-Reply-To: <76392bff28359a88fbdf0857f011e0ed9f666dc4.camel@redhat.com>
From: Ben Skeggs <skeggsb@gmail.com>
Date: Mon, 31 Aug 2020 14:26:19 +1000
Message-ID: <CACAvsv6GKeX=u4Jn0VVJk1qgnPcnPCW6exukqjvfrfmm2mwSUg@mail.gmail.com>
To: Lyude Paul <lyude@redhat.com>
Subject: Re: [Nouveau] [PATCH 1/2] drm/nouveau/kms/nv50-: Program notifier
 offset before requesting disp caps
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
Cc: Sasha Levin <sashal@kernel.org>, David Airlie <airlied@linux.ie>,
 ML nouveau <nouveau@lists.freedesktop.org>,
 open list <linux-kernel@vger.kernel.org>,
 "open list:DRM DRIVER FOR NVIDIA GEFORCE/QUADRO GPUS"
 <dri-devel@lists.freedesktop.org>, Ben Skeggs <bskeggs@redhat.com>,
 Daniel Vetter <daniel@ffwll.ch>, stable@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

On Wed, 26 Aug 2020 at 02:52, Lyude Paul <lyude@redhat.com> wrote:
>
> On Tue, 2020-08-25 at 08:28 +1000, Ben Skeggs wrote:
> > On Tue, 25 Aug 2020 at 04:33, Lyude Paul <lyude@redhat.com> wrote:
> > > Not entirely sure why this never came up when I originally tested this
> > > (maybe some BIOSes already have this setup?) but the ->caps_init vfunc
> > > appears to cause the display engine to throw an exception on driver
> > > init, at least on my ThinkPad P72:
> > >
> > > nouveau 0000:01:00.0: disp: chid 0 mthd 008c data 00000000 0000508c 0000102b
> > >
> > > This is magic nvidia speak for "You need to have the DMA notifier offset
> > > programmed before you can call NV507D_GET_CAPABILITIES." So, let's fix
> > > this by doing that, and also perform an update afterwards to prevent
> > > racing with the GPU when reading capabilities.
> > >
> > > Changes since v1:
> > > * Don't just program the DMA notifier offset, make sure to actually
> > >   perform an update
> > I'm not sure there's a need to send an Update() method here, I believe
> > GetCapabilities() is an action method on its own right?
> >
>
> I'm not entirely sure about this part tbh. I do know that we need to call
> GetCapabilities() _after_ the DMA notifier offset is programmed. But, my
> assumption was that if GetCapabilities() requires a DMA notifier offset to store
> its results in, we'd probably want to fire an update or something to make sure
> that we're not reading before it finishes writing capabilities?
We definitely want to *wait* on GetCapabilities() finishing, I believe
it should also update the notifier the same (or similar) way Update()
does.  But I don't think we want to send an Update() here, it'll
actually trigger a modeset (which, on earlier HW, will tear down the
boot mode.  Not sure about current HW, it might preserve state), and
we may not want that to happen there.

Ben.

>
> > Ben.
> >
> > > Signed-off-by: Lyude Paul <lyude@redhat.com>
> > > Fixes: 4a2cb4181b07 ("drm/nouveau/kms/nv50-: Probe SOR and PIOR caps for DP
> > > interlacing support")
> > > Cc: <stable@vger.kernel.org> # v5.8+
> > > ---
> > >  drivers/gpu/drm/nouveau/dispnv50/core507d.c | 25 ++++++++++++++++-----
> > >  1 file changed, 19 insertions(+), 6 deletions(-)
> > >
> > > diff --git a/drivers/gpu/drm/nouveau/dispnv50/core507d.c
> > > b/drivers/gpu/drm/nouveau/dispnv50/core507d.c
> > > index e341f572c2696..5e86feec3b720 100644
> > > --- a/drivers/gpu/drm/nouveau/dispnv50/core507d.c
> > > +++ b/drivers/gpu/drm/nouveau/dispnv50/core507d.c
> > > @@ -65,13 +65,26 @@ core507d_ntfy_init(struct nouveau_bo *bo, u32 offset)
> > >  int
> > >  core507d_caps_init(struct nouveau_drm *drm, struct nv50_disp *disp)
> > >  {
> > > -       u32 *push = evo_wait(&disp->core->chan, 2);
> > > +       struct nv50_core *core = disp->core;
> > > +       u32 interlock[NV50_DISP_INTERLOCK__SIZE] = {0};
> > > +       u32 *push;
> > >
> > > -       if (push) {
> > > -               evo_mthd(push, 0x008c, 1);
> > > -               evo_data(push, 0x0);
> > > -               evo_kick(push, &disp->core->chan);
> > > -       }
> > > +       core->func->ntfy_init(disp->sync, NV50_DISP_CORE_NTFY);
> > > +
> > > +       push = evo_wait(&core->chan, 4);
> > > +       if (!push)
> > > +               return 0;
> > > +
> > > +       evo_mthd(push, 0x0084, 1);
> > > +       evo_data(push, 0x80000000 | NV50_DISP_CORE_NTFY);
> > > +       evo_mthd(push, 0x008c, 1);
> > > +       evo_data(push, 0x0);
> > > +       evo_kick(push, &core->chan);
> > > +
> > > +       core->func->update(core, interlock, false);
> > > +       if (core->func->ntfy_wait_done(disp->sync, NV50_DISP_CORE_NTFY,
> > > +                                      core->chan.base.device))
> > > +               NV_ERROR(drm, "core notifier timeout\n");
> > >
> > >         return 0;
> > >  }
> > > --
> > > 2.26.2
> > >
> > > _______________________________________________
> > > Nouveau mailing list
> > > Nouveau@lists.freedesktop.org
> > > https://lists.freedesktop.org/mailman/listinfo/nouveau
> --
> Sincerely,
>       Lyude Paul (she/her)
>       Software Engineer at Red Hat
>
_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
