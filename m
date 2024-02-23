Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E6748618A6
	for <lists+nouveau@lfdr.de>; Fri, 23 Feb 2024 18:01:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7148E10EC72;
	Fri, 23 Feb 2024 17:01:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="P0rOPGNK";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B241410EC6E
 for <nouveau@lists.freedesktop.org>; Fri, 23 Feb 2024 17:01:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1708707706;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=R2IXZz7lpG6kZC2/Ly1sCkxHbaB7sUM8gSbmpgKrg6I=;
 b=P0rOPGNKMXnke0MjTpuORYOfuhhNUTVVEga1ll/dAXdZTOPrk8Z8CV66MbQzn79SUQCMOZ
 7ILIyze0IBh4byVvtpwT+40lSSh5WmoAn1MLC+ZRQ/ozG3x5OSyehufmTiSDb/fhjsOnZ9
 h2k5i9CKcZuj49pTqVymf+0vShImh8w=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-380-YUerM9HEMquIPD-SsS4h6A-1; Fri, 23 Feb 2024 12:01:45 -0500
X-MC-Unique: YUerM9HEMquIPD-SsS4h6A-1
Received: by mail-ej1-f70.google.com with SMTP id
 a640c23a62f3a-a2f1d0c3389so85623066b.0
 for <nouveau@lists.freedesktop.org>; Fri, 23 Feb 2024 09:01:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708707703; x=1709312503;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=R2IXZz7lpG6kZC2/Ly1sCkxHbaB7sUM8gSbmpgKrg6I=;
 b=Tegj5uSdpkW1LxsnKBQKce5OJb0/6D3g4BOosb/XbzDVyF0KC0owxNUm7410Afb+k3
 XGcO+JDIKybBp2q+gXsRSaI3U+V07O58gbp1q/KNhqqjZzvv8DgIhVMC488UHKsxiq91
 p/X++ZJofNaCg5jajQYcC1lavjdWvsRxyQOL0UnY1mW6P1GmevyI8Nwo0KIUJtyI/+4u
 0RREm2id0NjnFD+i92+AV+5bbHzj2pkpynLeg6x+4+zcxyE8fvBpGM7u8wRJ9YsO9XZK
 vSoeOf7w2f3Iq4tIk2CRurSTwO4AA5HtRUDxLFXCrYuEwDokybsjulcpjBWGBiLipWAy
 Y+SQ==
X-Gm-Message-State: AOJu0YzCobvs+H2UQqZNxgLeaXIivSIz2O1fHwjXzNECJiAr0atDssoe
 Ln3jk2gr4Slgq1LKV8k/0dd9zl5f5FLA5LG4VyMoKtldrf4W+ailgWo4ChVhtlV+ON/VhvZG+WA
 pj5dmxpHHAoH5Z9qBJhKLVSF6HcqQyn4OPVh/LpyUKrx6WryY6phu23iSs1TjDrunzNQdcWM=
X-Received: by 2002:a17:906:3c05:b0:a3f:4596:c3c8 with SMTP id
 h5-20020a1709063c0500b00a3f4596c3c8mr276709ejg.53.1708707703440; 
 Fri, 23 Feb 2024 09:01:43 -0800 (PST)
X-Google-Smtp-Source: AGHT+IECUQLR3iAsaiKhnRk8w2encj+NTogN58f85pbQ8oPNtota/uyWJub6SYoxYdNkwx4+H8FT6w==
X-Received: by 2002:a17:906:3c05:b0:a3f:4596:c3c8 with SMTP id
 h5-20020a1709063c0500b00a3f4596c3c8mr276690ejg.53.1708707703100; 
 Fri, 23 Feb 2024 09:01:43 -0800 (PST)
Received: from cassiopeiae ([2a02:810d:4b3f:ee94:642:1aff:fe31:a19f])
 by smtp.gmail.com with ESMTPSA id
 g18-20020a170906395200b00a3da3152c54sm7007047eje.78.2024.02.23.09.00.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Feb 2024 09:00:39 -0800 (PST)
Date: Fri, 23 Feb 2024 18:00:23 +0100
From: Danilo Krummrich <dakr@redhat.com>
To: Dave Airlie <airlied@gmail.com>
Cc: nouveau@lists.freedesktop.org, lyude@redhat.com, kherbst@redhat.com,
 dri-devel@lists.freedesktop.org
Subject: Re: [PATCH] drm/nouveau: use dedicated wq for fence uevents work
Message-ID: <ZdjPJ82blpddolwi@cassiopeiae>
References: <20240222144536.4382-1-dakr@redhat.com>
 <CAPM=9ty7ALfg6-ebdQdjeVdGgm2dVQYE0+yHeJ8+YCsZvAL+1g@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAPM=9ty7ALfg6-ebdQdjeVdGgm2dVQYE0+yHeJ8+YCsZvAL+1g@mail.gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
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

On Fri, Feb 23, 2024 at 10:14:53AM +1000, Dave Airlie wrote:
> On Fri, 23 Feb 2024 at 00:45, Danilo Krummrich <dakr@redhat.com> wrote:
> >
> > Using the kernel global workqueue to signal fences can lead to
> > unexpected deadlocks. Some other work (e.g. from a different driver)
> > could directly or indirectly depend on this fence to be signaled.
> > However, if the WQ_MAX_ACTIVE limit is reached by waiters, this can
> > prevent the work signaling the fence from running.
> >
> > While this seems fairly unlikely, it's potentially exploitable.
> 
> LGTM
> 
> Reviewed-by: Dave Airlie <airlied@redhat.com>
> 
> probably should go into drm-misc-fixes?

Yes, however, 39126abc5e20 went in through drm-fixes directly it seems, since
it's not in drm-misc-fixes.

Guess you want me to cherry-pick 39126abc5e20 to drm-misc-fixes rather than take
this one through drm-fixes as well?

> 
> >
> > Fixes: 39126abc5e20 ("nouveau: offload fence uevents work to workqueue")
> > Signed-off-by: Danilo Krummrich <dakr@redhat.com>
> > ---
> >  drivers/gpu/drm/nouveau/nouveau_drm.c   | 13 +++++++++++--
> >  drivers/gpu/drm/nouveau/nouveau_drv.h   |  3 +++
> >  drivers/gpu/drm/nouveau/nouveau_fence.c |  3 ++-
> >  drivers/gpu/drm/nouveau/nouveau_fence.h |  2 ++
> >  4 files changed, 18 insertions(+), 3 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/nouveau/nouveau_drm.c b/drivers/gpu/drm/nouveau/nouveau_drm.c
> > index 6f6c31a9937b..6be202081077 100644
> > --- a/drivers/gpu/drm/nouveau/nouveau_drm.c
> > +++ b/drivers/gpu/drm/nouveau/nouveau_drm.c
> > @@ -598,9 +598,15 @@ nouveau_drm_device_init(struct drm_device *dev)
> >                 goto fail_alloc;
> >         }
> >
> > +       drm->fence_wq = alloc_workqueue("nouveau_fence_wq", 0, WQ_MAX_ACTIVE);
> > +       if (!drm->fence_wq) {
> > +               ret = -ENOMEM;
> > +               goto fail_sched_wq;
> > +       }
> > +
> >         ret = nouveau_cli_init(drm, "DRM-master", &drm->master);
> >         if (ret)
> > -               goto fail_wq;
> > +               goto fail_fence_wq;
> >
> >         ret = nouveau_cli_init(drm, "DRM", &drm->client);
> >         if (ret)
> > @@ -670,7 +676,9 @@ nouveau_drm_device_init(struct drm_device *dev)
> >         nouveau_cli_fini(&drm->client);
> >  fail_master:
> >         nouveau_cli_fini(&drm->master);
> > -fail_wq:
> > +fail_fence_wq:
> > +       destroy_workqueue(drm->fence_wq);
> > +fail_sched_wq:
> >         destroy_workqueue(drm->sched_wq);
> >  fail_alloc:
> >         nvif_parent_dtor(&drm->parent);
> > @@ -725,6 +733,7 @@ nouveau_drm_device_fini(struct drm_device *dev)
> >
> >         nouveau_cli_fini(&drm->client);
> >         nouveau_cli_fini(&drm->master);
> > +       destroy_workqueue(drm->fence_wq);
> >         destroy_workqueue(drm->sched_wq);
> >         nvif_parent_dtor(&drm->parent);
> >         mutex_destroy(&drm->clients_lock);
> > diff --git a/drivers/gpu/drm/nouveau/nouveau_drv.h b/drivers/gpu/drm/nouveau/nouveau_drv.h
> > index 8a6d94c8b163..b43619a213a4 100644
> > --- a/drivers/gpu/drm/nouveau/nouveau_drv.h
> > +++ b/drivers/gpu/drm/nouveau/nouveau_drv.h
> > @@ -261,6 +261,9 @@ struct nouveau_drm {
> >         /* Workqueue used for channel schedulers. */
> >         struct workqueue_struct *sched_wq;
> >
> > +       /* Workqueue used to signal fences. */
> > +       struct workqueue_struct *fence_wq;
> > +
> >         /* context for accelerated drm-internal operations */
> >         struct nouveau_channel *cechan;
> >         struct nouveau_channel *channel;
> > diff --git a/drivers/gpu/drm/nouveau/nouveau_fence.c b/drivers/gpu/drm/nouveau/nouveau_fence.c
> > index 93f08f9479d8..c3ea3cd933cd 100644
> > --- a/drivers/gpu/drm/nouveau/nouveau_fence.c
> > +++ b/drivers/gpu/drm/nouveau/nouveau_fence.c
> > @@ -174,7 +174,7 @@ static int
> >  nouveau_fence_wait_uevent_handler(struct nvif_event *event, void *repv, u32 repc)
> >  {
> >         struct nouveau_fence_chan *fctx = container_of(event, typeof(*fctx), event);
> > -       schedule_work(&fctx->uevent_work);
> > +       queue_work(fctx->wq, &fctx->uevent_work);
> >         return NVIF_EVENT_KEEP;
> >  }
> >
> > @@ -194,6 +194,7 @@ nouveau_fence_context_new(struct nouveau_channel *chan, struct nouveau_fence_cha
> >         INIT_LIST_HEAD(&fctx->pending);
> >         spin_lock_init(&fctx->lock);
> >         fctx->context = chan->drm->runl[chan->runlist].context_base + chan->chid;
> > +       fctx->wq = chan->drm->fence_wq;
> >
> >         if (chan == chan->drm->cechan)
> >                 strcpy(fctx->name, "copy engine channel");
> > diff --git a/drivers/gpu/drm/nouveau/nouveau_fence.h b/drivers/gpu/drm/nouveau/nouveau_fence.h
> > index 8bc065acfe35..bc13110bdfa4 100644
> > --- a/drivers/gpu/drm/nouveau/nouveau_fence.h
> > +++ b/drivers/gpu/drm/nouveau/nouveau_fence.h
> > @@ -44,7 +44,9 @@ struct nouveau_fence_chan {
> >         u32 context;
> >         char name[32];
> >
> > +       struct workqueue_struct *wq;
> >         struct work_struct uevent_work;
> > +
> >         struct nvif_event event;
> >         int notify_ref, dead, killed;
> >  };
> >
> > base-commit: 1f4c6f11a557642505e5f403e0dfabbaff9c529a
> > --
> > 2.43.0
> >
> 

