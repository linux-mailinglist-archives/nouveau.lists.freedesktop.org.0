Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BAF2B90C552
	for <lists+nouveau@lfdr.de>; Tue, 18 Jun 2024 11:29:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 582B310E5FA;
	Tue, 18 Jun 2024 09:29:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=ffwll.ch header.i=@ffwll.ch header.b="QzlkUfrf";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com
 [209.85.128.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B0B610E5FD
 for <nouveau@lists.freedesktop.org>; Tue, 18 Jun 2024 09:29:27 +0000 (UTC)
Received: by mail-wm1-f52.google.com with SMTP id
 5b1f17b1804b1-4210f0bb857so4843305e9.1
 for <nouveau@lists.freedesktop.org>; Tue, 18 Jun 2024 02:29:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1718702966; x=1719307766; darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=ugGL9uVs9X2Pea6OUYQyB6uLicfdmBzqZpoJJtvudrA=;
 b=QzlkUfrfrc1oXTRwSH5lC2Qo3LQXiHn2bKxi9Rk5kz/xin+fgK3YdAn1qwk9t0LimO
 /Vp0VSScAcRLvDMgmQOvLuiOEuxzmvZvkyt5WW0qbRxwDVGwu88ggbJ+eG82wKaSAv3+
 h2gULH9cUOAMvTzZ9DTQCJmyN28g2fUleVqFs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718702966; x=1719307766;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ugGL9uVs9X2Pea6OUYQyB6uLicfdmBzqZpoJJtvudrA=;
 b=js0vvULNt7EGjaBy8h9NBUqsNXafA99cZJD8z2oZotvwQLjda/yW2SMw6jkYR5jlb5
 YGys8GFEDu+8bYsSbnSYaLYR0OigkGoisgFhAZCIOmnyEN/9R8pR5VLsNZ7/QeClT1ma
 xN66MqSn/9+CLkS85fBxbtlXi4V8RvE3M9uYz6h6LhgHABh6guhoUCh1oV2tGx9zkNpd
 lr4nbW9tv6XXReeeBCAbs0VfDgx8ODK4wub+VZBTCBcrZrSgoRbXiap3NK6JtEddpTdh
 cvu6lXY+xF1rys5yZ6z6WCRgUPlzA9cIv7+Os3RWHxZbFV9+OEoAd35xSoPG6X3LjPmd
 Mkfw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUP8Ej6xmhOiiLVRwu9w8mPMf5A2JoJ3q44qHSeDoTZjuvdO/lyslunakzdg8pbj3yw8mz7nwIAXVLmoJ3+0KMCQSndzcFwnmqqbUm7MQ==
X-Gm-Message-State: AOJu0YxdUZacDeWbxsqteGgnc3donQJJ/zyYSCTN3sni88RMi/5C9hEe
 /oF1dskPq06mtU+PG3eumq/rTKgkM75vbJTb6cv3tGpWbSiPIq93Ijv67Zffslk=
X-Google-Smtp-Source: AGHT+IF6z4xoQ0QrwJK2h3yMCEfcuAigxkqpzEDwvXi0TCm8a8IKY7r2AxOgA32bcPbxJrXkME8mQQ==
X-Received: by 2002:a05:600c:3b9b:b0:421:bb51:d630 with SMTP id
 5b1f17b1804b1-42304843ecemr86461185e9.2.1718702965663; 
 Tue, 18 Jun 2024 02:29:25 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-422874de62fsm221188175e9.38.2024.06.18.02.29.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Jun 2024 02:29:25 -0700 (PDT)
Date: Tue, 18 Jun 2024 11:29:23 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Danilo Krummrich <dakr@redhat.com>
Cc: Dave Airlie <airlied@gmail.com>, Ben Skeggs <bskeggs@nvidia.com>,
 nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH] nouveau: rip out busy fence waits
Message-ID: <ZnFTc_HjrWrp4L63@phenom.ffwll.local>
References: <20240417054032.3145721-1-airlied@gmail.com>
 <9baa140c-b6ca-4d52-9d3b-15960a995c14@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9baa140c-b6ca-4d52-9d3b-15960a995c14@redhat.com>
X-Operating-System: Linux phenom 6.8.9-amd64 
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

On Mon, Jun 17, 2024 at 05:11:34PM +0200, Danilo Krummrich wrote:
> On 4/17/24 07:40, Dave Airlie wrote:
> > From: Dave Airlie <airlied@redhat.com>
> > 
> > I'm pretty sure this optimisation is actually not a great idea,
> > and is racy with other things waiting for fences.
> 
> Yes, I tried to use it in the past on scheduler tear down, to have an
> indicator whether all jobs had the chance to finish.
> 
> However, it happened that using a CPU busy loop saw the fence as signaled,
> while an (event based) dma_fence was still seen as unsignaled.

If the busy loop goes through dma_fence_is_signalled this kind of stuff
shouldn't happen. But if you open-code it, it can.
-Sima

> 
> > 
> > Just nuke it, there should be no need to do fence waits in a
> > busy CPU loop.
> > 
> > Signed-off-by: Dave Airlie <airlied@redhat.com>
> 
> Applied to drm-misc-next.
> 
> > ---
> >   drivers/gpu/drm/nouveau/nouveau_bo.c    |  2 +-
> >   drivers/gpu/drm/nouveau/nouveau_chan.c  |  2 +-
> >   drivers/gpu/drm/nouveau/nouveau_dmem.c  |  2 +-
> >   drivers/gpu/drm/nouveau/nouveau_fence.c | 30 +------------------------
> >   drivers/gpu/drm/nouveau/nouveau_fence.h |  2 +-
> >   drivers/gpu/drm/nouveau/nouveau_gem.c   |  2 +-
> >   6 files changed, 6 insertions(+), 34 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/nouveau/nouveau_bo.c b/drivers/gpu/drm/nouveau/nouveau_bo.c
> > index 8a30f5a0525b..a4e8f625fce6 100644
> > --- a/drivers/gpu/drm/nouveau/nouveau_bo.c
> > +++ b/drivers/gpu/drm/nouveau/nouveau_bo.c
> > @@ -902,7 +902,7 @@ nouveau_bo_move_m2mf(struct ttm_buffer_object *bo, int evict,
> >   	 * Without this the operation can timeout and we'll fallback to a
> >   	 * software copy, which might take several minutes to finish.
> >   	 */
> > -	nouveau_fence_wait(fence, false, false);
> > +	nouveau_fence_wait(fence, false);
> >   	ret = ttm_bo_move_accel_cleanup(bo, &fence->base, evict, false,
> >   					new_reg);
> >   	nouveau_fence_unref(&fence);
> > diff --git a/drivers/gpu/drm/nouveau/nouveau_chan.c b/drivers/gpu/drm/nouveau/nouveau_chan.c
> > index 7c97b2886807..66fca95c10c7 100644
> > --- a/drivers/gpu/drm/nouveau/nouveau_chan.c
> > +++ b/drivers/gpu/drm/nouveau/nouveau_chan.c
> > @@ -72,7 +72,7 @@ nouveau_channel_idle(struct nouveau_channel *chan)
> >   		ret = nouveau_fence_new(&fence, chan);
> >   		if (!ret) {
> > -			ret = nouveau_fence_wait(fence, false, false);
> > +			ret = nouveau_fence_wait(fence, false);
> >   			nouveau_fence_unref(&fence);
> >   		}
> > diff --git a/drivers/gpu/drm/nouveau/nouveau_dmem.c b/drivers/gpu/drm/nouveau/nouveau_dmem.c
> > index 12feecf71e75..033a09cd3c8f 100644
> > --- a/drivers/gpu/drm/nouveau/nouveau_dmem.c
> > +++ b/drivers/gpu/drm/nouveau/nouveau_dmem.c
> > @@ -128,7 +128,7 @@ static void nouveau_dmem_page_free(struct page *page)
> >   static void nouveau_dmem_fence_done(struct nouveau_fence **fence)
> >   {
> >   	if (fence) {
> > -		nouveau_fence_wait(*fence, true, false);
> > +		nouveau_fence_wait(*fence, false);
> >   		nouveau_fence_unref(fence);
> >   	} else {
> >   		/*
> > diff --git a/drivers/gpu/drm/nouveau/nouveau_fence.c b/drivers/gpu/drm/nouveau/nouveau_fence.c
> > index c3ea3cd933cd..8de941379324 100644
> > --- a/drivers/gpu/drm/nouveau/nouveau_fence.c
> > +++ b/drivers/gpu/drm/nouveau/nouveau_fence.c
> > @@ -312,39 +312,11 @@ nouveau_fence_wait_legacy(struct dma_fence *f, bool intr, long wait)
> >   	return timeout - t;
> >   }
> > -static int
> > -nouveau_fence_wait_busy(struct nouveau_fence *fence, bool intr)
> > -{
> > -	int ret = 0;
> > -
> > -	while (!nouveau_fence_done(fence)) {
> > -		if (time_after_eq(jiffies, fence->timeout)) {
> > -			ret = -EBUSY;
> > -			break;
> > -		}
> > -
> > -		__set_current_state(intr ?
> > -				    TASK_INTERRUPTIBLE :
> > -				    TASK_UNINTERRUPTIBLE);
> > -
> > -		if (intr && signal_pending(current)) {
> > -			ret = -ERESTARTSYS;
> > -			break;
> > -		}
> > -	}
> > -
> > -	__set_current_state(TASK_RUNNING);
> > -	return ret;
> > -}
> > -
> >   int
> > -nouveau_fence_wait(struct nouveau_fence *fence, bool lazy, bool intr)
> > +nouveau_fence_wait(struct nouveau_fence *fence, bool intr)
> >   {
> >   	long ret;
> > -	if (!lazy)
> > -		return nouveau_fence_wait_busy(fence, intr);
> > -
> >   	ret = dma_fence_wait_timeout(&fence->base, intr, 15 * HZ);
> >   	if (ret < 0)
> >   		return ret;
> > diff --git a/drivers/gpu/drm/nouveau/nouveau_fence.h b/drivers/gpu/drm/nouveau/nouveau_fence.h
> > index bc13110bdfa4..88213014b675 100644
> > --- a/drivers/gpu/drm/nouveau/nouveau_fence.h
> > +++ b/drivers/gpu/drm/nouveau/nouveau_fence.h
> > @@ -23,7 +23,7 @@ void nouveau_fence_unref(struct nouveau_fence **);
> >   int  nouveau_fence_emit(struct nouveau_fence *);
> >   bool nouveau_fence_done(struct nouveau_fence *);
> > -int  nouveau_fence_wait(struct nouveau_fence *, bool lazy, bool intr);
> > +int  nouveau_fence_wait(struct nouveau_fence *, bool intr);
> >   int  nouveau_fence_sync(struct nouveau_bo *, struct nouveau_channel *, bool exclusive, bool intr);
> >   struct nouveau_fence_chan {
> > diff --git a/drivers/gpu/drm/nouveau/nouveau_gem.c b/drivers/gpu/drm/nouveau/nouveau_gem.c
> > index 49c2bcbef129..f715e381da69 100644
> > --- a/drivers/gpu/drm/nouveau/nouveau_gem.c
> > +++ b/drivers/gpu/drm/nouveau/nouveau_gem.c
> > @@ -928,7 +928,7 @@ nouveau_gem_ioctl_pushbuf(struct drm_device *dev, void *data,
> >   	}
> >   	if (sync) {
> > -		if (!(ret = nouveau_fence_wait(fence, false, false))) {
> > +		if (!(ret = nouveau_fence_wait(fence, false))) {
> >   			if ((ret = dma_fence_get_status(&fence->base)) == 1)
> >   				ret = 0;
> >   		}
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
