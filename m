Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DE1CD275B80
	for <lists+nouveau@lfdr.de>; Wed, 23 Sep 2020 17:21:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 55EFA6E949;
	Wed, 23 Sep 2020 15:21:29 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A87F06E949
 for <nouveau@lists.freedesktop.org>; Wed, 23 Sep 2020 15:21:28 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id b79so462207wmb.4
 for <nouveau@lists.freedesktop.org>; Wed, 23 Sep 2020 08:21:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=2K9Z7Gv19r32rwISFfeeU+p3IhQHbLyZj3mcqhUjB5I=;
 b=MERnuQXGwroua2if1L0VAdqH0dK2zxzg/yeRefum0A/26toU0brOQ1vVClrhlN8DaM
 Qi9cWKc57sAFuosYFkjTNH9hUOULge0gNOU6SMztChxwzMCbDrgD/vUFFx7S1rtC4Wws
 wMx1OtUeVG0f9iOHsHWvx6enLnLqH2jrGug7A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=2K9Z7Gv19r32rwISFfeeU+p3IhQHbLyZj3mcqhUjB5I=;
 b=LAmAGxaItwkXC1+u68s0rRxscRXmFQzaL5x9GLtW/WdQiRgMjsNZ9a93ZfW3rEPosf
 S0LEdo18fJ39xqajWOzhacYBNMEmOv1ZmAQWCK1vMKawU0YAHtjwAkzIssfxod69hjmV
 Wyr1PBib1svT51xQm07u3v6W986MXXQge6zEujRyNonEjsJTAQn1BArSZeP1x16Efx/1
 j+V03gry7sthT8YzS9Y4libyhIgo41cJyRTle10YR+oGpTvTRlIrHC4XdQtuuUq2icFy
 nhCDRXOfLrfD/zqIKyogjzWC9eNUCDrsKIuYWNOIPWPRh/rHVC6buDiVtXF4EqmO2gpb
 kN4g==
X-Gm-Message-State: AOAM531oeG0OzHVO/A6vlfZi1k47jolTF9mJlmfEWq77fBgvsskiUYwJ
 qRjaCxNKZ7Mj0/DydgGPMTbB+dNyt1grUxvK
X-Google-Smtp-Source: ABdhPJxH2AEo1L7I/ztdxnpoPdTHMcs8+vqe1evuGgCmQJAOjRv/sEDWITiVdrOYZe8ze1pDTkn5gw==
X-Received: by 2002:a1c:2ed0:: with SMTP id u199mr38440wmu.125.1600874487324; 
 Wed, 23 Sep 2020 08:21:27 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id y5sm162482wrh.6.2020.09.23.08.21.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Sep 2020 08:21:26 -0700 (PDT)
Date: Wed, 23 Sep 2020 17:21:24 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Thierry Reding <thierry.reding@gmail.com>
Message-ID: <20200923152124.GO438822@phenom.ffwll.local>
References: <20200828104016.1672195-1-thierry.reding@gmail.com>
 <20200923091853.GA1229032@ulmo>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200923091853.GA1229032@ulmo>
X-Operating-System: Linux phenom 5.7.0-1-amd64 
Subject: Re: [Nouveau] [PATCH 0/6] drm/nouveau: Support sync FDs and sync
 objects
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
Cc: nouveau@lists.freedesktop.org, Ben Skeggs <bskeggs@redhat.com>,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

On Wed, Sep 23, 2020 at 11:18:53AM +0200, Thierry Reding wrote:
> On Fri, Aug 28, 2020 at 12:40:10PM +0200, Thierry Reding wrote:
> > From: Thierry Reding <treding@nvidia.com>
> > 
> > Hi,
> > 
> > This series implements a new IOCTL to submit push buffers that can
> > optionally return a sync FD or sync object to userspace. This is useful
> > in cases where userspace wants to synchronize operations between the GPU
> > and another driver (such as KMS for display). Among other things this
> > allows extensions such as eglDupNativeFenceFDANDROID to be implemented.
> > 
> > Note that patch 4 modifies the ABI introduced in patch 3 by allowing DRM
> > sync objects to be passed rather than only sync FDs. It also allows any
> > number of sync FDs/objects to be passed in or emitted. I think those are
> > useful features, but I left them in a separate patch in case everybody
> > else thinks that this won't be needed. If we decide to merge the new ABI
> > then patch 4 should be squashed into patch 3.
> > 
> > The corresponding userspace changes can be found here:
> > 
> >   libdrm: https://gitlab.freedesktop.org/tagr/drm/-/commits/nouveau-sync-fd-v2/
> >   mesa: https://gitlab.freedesktop.org/tagr/mesa/-/commits/nouveau-sync-fd/
> > 
> > I've verified that this works with kmscube's --atomic mode and Weston.
> 
> Hi Ben,
> 
> any thoughts on this series? I realize that this is somewhat suboptimal
> because we're effectively adding a duplicate of the existing IOCTL with
> only the "minor" extension of adding sync FDs/objects, but at the same
> time I don't have any good ideas on what else to add to make this more
> appealing or if you have any plans of your own to address this in the
> future.

drm core automatically zero-extends ioctl structs both ways, so if all you
do is add more stuff to the top level ioctl struct at the bottom, there's
no need to duplicate any code. At least as long as you guarantee that 0 ==
old behaviour for both in and out parameters.
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
