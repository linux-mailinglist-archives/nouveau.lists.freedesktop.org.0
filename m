Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A4543667B8
	for <lists+nouveau@lfdr.de>; Wed, 21 Apr 2021 11:12:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5AE666E42F;
	Wed, 21 Apr 2021 09:12:27 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [IPv6:2a00:1450:4864:20::62d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B5656E430
 for <nouveau@lists.freedesktop.org>; Wed, 21 Apr 2021 09:12:26 +0000 (UTC)
Received: by mail-ej1-x62d.google.com with SMTP id r20so12680538ejo.11
 for <nouveau@lists.freedesktop.org>; Wed, 21 Apr 2021 02:12:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=FEam5TET7rhN7+PR3mXypZotRQqC9IqmKKfFLGC0Cc4=;
 b=Iepkup3IaMiOfVhyXm8Bbckx6YcsWQ2s2PMMnKfIgyF5vuA3JHPpJ7oCxu07f77CFl
 NhFQP7+p72gmHHrl0Dc0sEwZclXd3QEQgViUb/DX1OY5xJ9U/46wQ/ADCKO4p67YtBGb
 yl1CIe/v9rWHBrjTuUR21RQXOS9k+Q8UvSOP4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=FEam5TET7rhN7+PR3mXypZotRQqC9IqmKKfFLGC0Cc4=;
 b=Ihwe83EgDk9kCa6MgzQIEX9z5xQMsjWxO5E77ocpsFwJBRNil4T12tnp9JBrtmWopo
 ZVQjLhaUbeBdwaPCMlpeeauYYzEmIkMLQUHNjj3JSwE+VZ8ZS8yEToA3VpG/fh6XvGFW
 oZb/vxGM7Wd3mu2opZ7RIhHyUZ398DwGzrdX6zSo05hK37NSLXK2IfhT5hp60r3oeQ5m
 ftqAtlWswygt4xltX9lZZuAjI9dtpBRIJ2FL+4vFkBGe7oqP24hGgXa6q98IDLKZtLbF
 UFU7hm002kTrxisFv1WPkriNpT/H+R3O7v2gHSkGmnQycG7N/xs4Xv60SP6ZAOxeIMH1
 pxqw==
X-Gm-Message-State: AOAM5301MAOF9wwkQcL9J2KvBgC+j6skGdBhIHNEkcwGQcmzKkOxUA4S
 n34YPVp5Rf8RzftNQXsjuE9Vvw==
X-Google-Smtp-Source: ABdhPJwRFLGQeI5LUaHl/xRUKCcQz20vdi9yS83zYlInGKxg8bjL2xita3Xtc67I179eBVX1eD8Pgw==
X-Received: by 2002:a17:906:a10e:: with SMTP id
 t14mr31318076ejy.103.1618996344761; 
 Wed, 21 Apr 2021 02:12:24 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id o17sm2489966edt.92.2021.04.21.02.12.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Apr 2021 02:12:24 -0700 (PDT)
Date: Wed, 21 Apr 2021 11:12:22 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Message-ID: <YH/sdlVA5dG51LP0@phenom.ffwll.local>
References: <20210416133146.24825-1-tzimmermann@suse.de>
 <20210416133146.24825-6-tzimmermann@suse.de>
 <b7008944-fbe5-bd59-d2a9-ff62bea38237@gmail.com>
 <80012c09-6975-f694-420f-72b2236dcf4e@amd.com>
 <52403618-62f5-2085-c245-e1e98762cccb@suse.de>
 <YH6WJ0p2jGd3Q5Xw@phenom.ffwll.local>
 <a76b44d2-d894-ab4e-ef37-f0feb4326297@amd.com>
 <CAKMK7uGmR_US-fy1GTWF4jCnCiRofyDrrJP1qFrE2CKLWbTXBA@mail.gmail.com>
 <a60d976a-8b1e-b0bb-07ba-f5801242b86c@amd.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <a60d976a-8b1e-b0bb-07ba-f5801242b86c@amd.com>
X-Operating-System: Linux phenom 5.7.0-1-amd64 
Subject: Re: [Nouveau] [PATCH v3 5/7] drm/vmwgfx: Inline ttm_bo_mmap() into
 vmwgfx driver
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
Cc: amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Daniel Vetter <daniel@ffwll.ch>, "Sharma, Shashank" <shashank.sharma@amd.com>,
 Dave Airlie <airlied@linux.ie>,
 Christian =?iso-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>,
 Felix Kuehling <felix.kuehling@amd.com>,
 Roland Scheidegger <sroland@vmware.com>, Nirmoy Das <nirmoy.das@amd.com>,
 dri-devel <dri-devel@lists.freedesktop.org>, Huang Rui <ray.huang@amd.com>,
 VMware Graphics <linux-graphics-maintainer@vmware.com>,
 Ben Skeggs <bskeggs@redhat.com>, Nouveau Dev <nouveau@lists.freedesktop.org>,
 Alex Deucher <alexander.deucher@amd.com>, Sam Ravnborg <sam@ravnborg.org>,
 Zack Rusin <zackr@vmware.com>, Emil Velikov <emil.velikov@collabora.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

On Wed, Apr 21, 2021 at 09:01:00AM +0200, Christian K=F6nig wrote:
> Am 20.04.21 um 22:53 schrieb Daniel Vetter:
> > On Tue, Apr 20, 2021 at 10:23 PM Felix Kuehling <felix.kuehling@amd.com=
> wrote:
> > > =

> > > Am 2021-04-20 um 4:51 a.m. schrieb Daniel Vetter:
> > > > > > Whole series is Reviewed-by: Christian K=F6nig <christian.koeni=
g@amd.com>
> > > > > Thanks a lot. If I'm not mistaken, the patches at [1] need to go =
in first.
> > > > > So it could take a a bit until this lands.
> > > > > =

> > > > > Otherwise, this series could go through the same tree as [1] if n=
ouveau and
> > > > > vmwgfx devs don't mind.
> > > > I would land it all through drm-misc-next. Maybe check with Alex on=
 irc
> > > > for an ack for merging that way, but I don't think this will cause =
issues
> > > > against the amdgpu tree. Lots of ttm cleanup has landed this way al=
ready
> > > > past few months. Otherwise you could create a small topic branch wi=
th
> > > > these patches here and send that to Alex, and he can sort out the
> > > > interaction with Felix' series.
> > > > -Daniel
> > > My patch series involved some pretty far-reaching changes in KFD
> > > (renaming some variables in KFD and amdgpu, changing the KFD->amdgpu
> > > interface). We already submitted other patches on top of it that have
> > > dependencies on it. If we decide to deliver this through a different
> > > tree and remove it from amd-staging-drm-next, there will be conflicts=
 to
> > > resolve when removing it from amd-staging-drm-next, and again the next
> > > time you merge with amd-staging-drm-next.
> > Ah then the usual way is for Alex to assemble a topic pull request
> > (stable, non-rebasing) with those select patches, which then gets
> > merged into drm-misc-next. Or we smash it all into amdgpu-next. Or we
> > just wait until -rc2 when drm-next is back open for business.
> =

> I need to double check, but if I'm not totally mistaken the changes in
> question should already be in drm-next.
> =

> But exactly that was the reason why I asked when the next backmerge from
> drm-next into drm-misc-next is planned :)

Best way to make that happen isn't to ask when it will happen, but tell
drm-misc maintainers to do it and why (ideally with references to the
commits you need). Also I tend to do those requests over irc.

Backmerges are generally on demand, not on schedule. Hence you need to
demand one :-)
-Daniel
-- =

Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
