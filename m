Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F5883E0A33
	for <lists+nouveau@lfdr.de>; Thu,  5 Aug 2021 00:02:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 57DA16E1A2;
	Wed,  4 Aug 2021 22:02:04 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB8CB6E1BA
 for <nouveau@lists.freedesktop.org>; Wed,  4 Aug 2021 22:02:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1628114522;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=d2KqUld+afo/DqE9+AEtQTsC0qFJZ5g464VDzN5fDCk=;
 b=PEWptoFKrUobOBdl0FKLvhywAbaTnDi0Y5K/22flmid4nP9d5qEwg+E3y/SDgKG6VZXbZy
 2exaXo+HWw2CA8y0PuVLk4GTAHwaBQaZQTHFAcyYfU4LPMs12lwQ2zNRyArrT1N3p3vk0K
 sJfOnN8om8QoX+uWOCUrNaMDdumWfJM=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-397-cA76E8RlMiK_ThauRPv0_g-1; Wed, 04 Aug 2021 18:01:59 -0400
X-MC-Unique: cA76E8RlMiK_ThauRPv0_g-1
Received: by mail-wm1-f70.google.com with SMTP id
 y186-20020a1c32c30000b02902b5ac887cfcso796158wmy.2
 for <nouveau@lists.freedesktop.org>; Wed, 04 Aug 2021 15:01:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=d2KqUld+afo/DqE9+AEtQTsC0qFJZ5g464VDzN5fDCk=;
 b=G4cgC3nRbA0Dw7hLRGYEYhHcQjjnRX+wgcxPsHDi/GO8FOL4GztjtzEMzQ/vl8ZK4k
 vR8Xp6pWFvKfY9IZxH6laGbLKumBuYjcc1Ao4qMoNR14j1Zpd19AEYijZgqX+3a7qUfl
 PMP95BFJ9ZmN1GOfokTpAmakzBC1iD5vMzDwzlvPa7JBoEV8iSs1TdB/EVIP/bZCt9dK
 3eDsnV4ob9CNO968YOpQ/Dmgad7NGbrypKLxDz8Ai9Y3uYHqbnnJ+VwRMbPMm8W8QsE3
 daRG4Osokh4mpMbb0isbRWDtDnmwwbgZPKw8rLNZL940Ps3u03n5rFc1LPmwYyyrWUPZ
 3hGQ==
X-Gm-Message-State: AOAM531Bu60n+FXe6P8/lTiE/TJYTIm+/CDSik950Ly6uMfvI0p/cLTF
 EbbxxwBYr8aR7m7y84eERcMEy6WL055ZSlf8BbYZaoznkngegFjN2AsTQnn6r4w7BvOhvZorKyt
 KzDzKWICoUqj+10Eh3d3FZtXJNWoZyxh3VhP57++4gA==
X-Received: by 2002:a05:600c:2241:: with SMTP id
 a1mr11802094wmm.171.1628114518451; 
 Wed, 04 Aug 2021 15:01:58 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyY5/nXWklNR1mjmCS911U1388HsPu+p770sIXPA+rC70wi12iHVm9penxHkIrsLojhFxJ+H/cT1xS0GAj+5BQ=
X-Received: by 2002:a05:600c:2241:: with SMTP id
 a1mr11802083wmm.171.1628114518302; 
 Wed, 04 Aug 2021 15:01:58 -0700 (PDT)
MIME-Version: 1.0
References: <CAK8P3a0i0WP24Z0TScmPqKxmM2ovtKnmm+qZq6+Tc1ju+hma0w@mail.gmail.com>
 <20210804141049.499767-1-kherbst@redhat.com>
 <CAK8P3a136c_L3yVn-841Sbfib9UMOf1M-pk+2SqWt0wD2zfRKQ@mail.gmail.com>
 <CACO55tsLpURTm=Jf=4gRVtYQbit5h2OBYw_MFb6Vf1PFvTV7dw@mail.gmail.com>
 <CACO55tuy5Am9zbcR490KWYYAg7MguBN5m82vbjzifGN5KpGbxw@mail.gmail.com>
 <CAK8P3a3hZ7X5+kM5E+_Y+COUp49Kt6iDjiqMFtimiSbPk4byzQ@mail.gmail.com>
In-Reply-To: <CAK8P3a3hZ7X5+kM5E+_Y+COUp49Kt6iDjiqMFtimiSbPk4byzQ@mail.gmail.com>
From: Karol Herbst <kherbst@redhat.com>
Date: Thu, 5 Aug 2021 00:01:47 +0200
Message-ID: <CACO55tsj_dgo8NENArCQ_=qcuJoMPg9k-gfkWxZ_8FCQUOTY1A@mail.gmail.com>
To: Arnd Bergmann <arnd@kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Lyude Paul <lyude@redhat.com>, 
 Ben Skeggs <bskeggs@redhat.com>, Randy Dunlap <rdunlap@infradead.org>, 
 Daniel Vetter <daniel@ffwll.ch>, ML nouveau <nouveau@lists.freedesktop.org>, 
 dri-devel <dri-devel@lists.freedesktop.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kherbst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Nouveau] [PATCH] depend on BACKLIGHT_CLASS_DEVICE for more
 devices
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

On Wed, Aug 4, 2021 at 11:10 PM Arnd Bergmann <arnd@kernel.org> wrote:
>
> On Wed, Aug 4, 2021 at 8:59 PM Karol Herbst <kherbst@redhat.com> wrote:
> > On Wed, Aug 4, 2021 at 4:43 PM Karol Herbst <kherbst@redhat.com> wrote:
> > > On Wed, Aug 4, 2021 at 4:19 PM Arnd Bergmann <arnd@kernel.org> wrote:
> > > > On Wed, Aug 4, 2021 at 4:10 PM Karol Herbst <kherbst@redhat.com> wrote:
> > > > >
> > > > > playing around a little bit with this, I think the original "select
> > > > > BACKLIGHT_CLASS_DEVICE" is fine. Atm we kind of have this weird mix of
> > > > > drivers selecting and others depending on it. We could of course convert
> > > > > everything over to depend, and break those cycling dependency issues with
> > > > > this.
> > > > >
> > > > > Anyway this change on top of my initial patch is enough to make Kconfig
> > > > > happy and has the advantage of not having to mess with the deps of nouveau
> > > > > too much.
> > > >
> > > > Looks good to me. We'd probably want to make the BACKLIGHT_CLASS_DEVICE
> > > > option itself 'default FB || DRM' though, to ensure that defconfigs
> > > > keep working.
> > > >
> > >
> > > okay cool. Will send out a proper updated patch series soonish.
> > >
> >
> > mhh, actually that breaks drivers selecting FB_BACKLIGHT as now
> > BACKLIGHT_CLASS_DEVICE might be disabled :(
>
> Are you sure? It should already be the case that any driver that selects
> FB_BACKLIGHT either 'depends on BACKLIGHT_CLASS_DEVICE'
> or 'select BACKLIGHT_CLASS_DEVICE'.
>

none of the fb drivers seem to do that.

> If you change all the 'select BACKLIGHT_CLASS_DEVICE' to 'depends
> on', I don't see a problem with doing 'select FB_BACKLIGHT' from
> those.
>
> I have applied your patch to my randconfig tree and built a few dozen
> kernels, don't see any regressions so far, but will let it run over night.
>
>       Arnd
>

