Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 192E2276FA8
	for <lists+nouveau@lfdr.de>; Thu, 24 Sep 2020 13:16:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 353856E20E;
	Thu, 24 Sep 2020 11:16:55 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-ot1-x341.google.com (mail-ot1-x341.google.com
 [IPv6:2607:f8b0:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 062FE6E20C
 for <nouveau@lists.freedesktop.org>; Thu, 24 Sep 2020 11:16:54 +0000 (UTC)
Received: by mail-ot1-x341.google.com with SMTP id h17so2803890otr.1
 for <nouveau@lists.freedesktop.org>; Thu, 24 Sep 2020 04:16:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=EUffDHVR2Yv6MCCT8PCpcsVqmKxjAwJSMcwmmyvnucc=;
 b=VF7T//62eV6rXVhYQn17mtsF3W0XKvPN/z5QrI+xMgYUX6byJw0pf11AOsNKqCRuTS
 IGP9jxos39i+Bo5CegbvJCCZQBy0pEzUKtr0JjejwpwaxwEhn9A6OrxtjdBrnXFdtsph
 qCCWm6psPgVDS1qmqNSSEBU+kkBRBJS0tSzJ4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=EUffDHVR2Yv6MCCT8PCpcsVqmKxjAwJSMcwmmyvnucc=;
 b=pq18XTh3EMP2sBCHotw4kZcic/Uqi3kCA+ajMtfxyVp5ws+G/WG1/nYWpuHu27jlOK
 rak5GLRLxRCxrBkJ5Fle9BUoQ1z1PwTWg3Zr/DVGQYXWJrdR9lVVVIFqPzvmBW8vsTAX
 2MqgP6FZ7QR/T3BtfMeumWmvmO7+Hx+6m+RZGM1oTvRb90Y1h2Wr9n2N+j86qe40l5KX
 nQEPHUME1qenemlLyeZlzbvFaltsTs8lCaj0Z/bUNwh/9MVq2DOtX1zBz5+JWFhD40SC
 4i1SvxyJn3XIwfxNv4vMSPX/aO9ShdU4sKQ5XMDEIOL30PZ9T0Gpmq2oEXDyA1iDyMcO
 OMHg==
X-Gm-Message-State: AOAM530rhcQCpbn44VpzqLUqYQcPN5FYzVy8b3NemmCVX3uXdKSDtTf6
 +tkHt7glKcGKGYFtLl6iHpiakgLcDu5uGPor1e4XMw==
X-Google-Smtp-Source: ABdhPJwEFjmKOPVpkpvPPLv6s6Ly5U3TjxZ7Lk3KqykuP1iMklc8VSHFYtWZTyU2/nGMhS4Oa+6LSPt4eonYgqqavfA=
X-Received: by 2002:a05:6830:14d9:: with SMTP id
 t25mr2888208otq.188.1600946213067; 
 Thu, 24 Sep 2020 04:16:53 -0700 (PDT)
MIME-Version: 1.0
References: <20200828104016.1672195-1-thierry.reding@gmail.com>
 <20200923091853.GA1229032@ulmo> <20200923152124.GO438822@phenom.ffwll.local>
 <20200924100509.GD2483160@ulmo>
In-Reply-To: <20200924100509.GD2483160@ulmo>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Thu, 24 Sep 2020 13:16:42 +0200
Message-ID: <CAKMK7uEO6jLkwiLbvW1Xz6=z+TM6ahY6TXLNNC52GGyg9r5==Q@mail.gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>
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
Cc: Nouveau Dev <nouveau@lists.freedesktop.org>,
 Ben Skeggs <bskeggs@redhat.com>, dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

On Thu, Sep 24, 2020 at 12:05 PM Thierry Reding
<thierry.reding@gmail.com> wrote:
>
> On Wed, Sep 23, 2020 at 05:21:24PM +0200, Daniel Vetter wrote:
> > On Wed, Sep 23, 2020 at 11:18:53AM +0200, Thierry Reding wrote:
> > > On Fri, Aug 28, 2020 at 12:40:10PM +0200, Thierry Reding wrote:
> > > > From: Thierry Reding <treding@nvidia.com>
> > > >
> > > > Hi,
> > > >
> > > > This series implements a new IOCTL to submit push buffers that can
> > > > optionally return a sync FD or sync object to userspace. This is useful
> > > > in cases where userspace wants to synchronize operations between the GPU
> > > > and another driver (such as KMS for display). Among other things this
> > > > allows extensions such as eglDupNativeFenceFDANDROID to be implemented.
> > > >
> > > > Note that patch 4 modifies the ABI introduced in patch 3 by allowing DRM
> > > > sync objects to be passed rather than only sync FDs. It also allows any
> > > > number of sync FDs/objects to be passed in or emitted. I think those are
> > > > useful features, but I left them in a separate patch in case everybody
> > > > else thinks that this won't be needed. If we decide to merge the new ABI
> > > > then patch 4 should be squashed into patch 3.
> > > >
> > > > The corresponding userspace changes can be found here:
> > > >
> > > >   libdrm: https://gitlab.freedesktop.org/tagr/drm/-/commits/nouveau-sync-fd-v2/
> > > >   mesa: https://gitlab.freedesktop.org/tagr/mesa/-/commits/nouveau-sync-fd/
> > > >
> > > > I've verified that this works with kmscube's --atomic mode and Weston.
> > >
> > > Hi Ben,
> > >
> > > any thoughts on this series? I realize that this is somewhat suboptimal
> > > because we're effectively adding a duplicate of the existing IOCTL with
> > > only the "minor" extension of adding sync FDs/objects, but at the same
> > > time I don't have any good ideas on what else to add to make this more
> > > appealing or if you have any plans of your own to address this in the
> > > future.
> >
> > drm core automatically zero-extends ioctl structs both ways, so if all you
> > do is add more stuff to the top level ioctl struct at the bottom, there's
> > no need to duplicate any code. At least as long as you guarantee that 0 ==
> > old behaviour for both in and out parameters.
>
> But that only works if the structure size remains fixed, right? In this
> case, however, we have to extend the structure with additional fields,
> so the size is going to change and therefore the IOCTL number will also
> change.

Nope, drm_ioctl() is pretty much magic, and will zero-extend size
mismatches in both ways. Which means you can run userspace compile
against old kernels (so user_sz > kernel_sz) and you can run old
userspace on new kernels (so user_sz < kernel_sz) and it will all work
correctly. No need to allocate new ioctl numbers for this case, just
extend at the bottom. We're doing this pretty much all the time.

You might still want a getparam (or explicit flag, if all versions of
that ioctl validated the flags correctly) since doing since a dummy
pushbuf on an old kernel won't result in anything getting rejected.
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
