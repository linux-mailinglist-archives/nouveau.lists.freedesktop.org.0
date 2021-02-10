Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BC6183167A9
	for <lists+nouveau@lfdr.de>; Wed, 10 Feb 2021 14:14:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A2216EC79;
	Wed, 10 Feb 2021 13:14:16 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1810E6EC79
 for <nouveau@lists.freedesktop.org>; Wed, 10 Feb 2021 13:14:15 +0000 (UTC)
Received: by mail-wr1-x42f.google.com with SMTP id r21so2460532wrr.9
 for <nouveau@lists.freedesktop.org>; Wed, 10 Feb 2021 05:14:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to; bh=yd/N+I5kkzyOJpCnRN7vd7lwOUGF6B7BATQPc1K2fYQ=;
 b=Ku2flnqwc5D6z3d9GmRgcHXuXbDphKiJCNyjgnzoxVdwxDs/52BrDyb7OcLZWnkYAz
 UR5IZLaVzdRpurLn7fxlbf1b3mo/RM5L29GsZ6tgTpsyMRaO55uRbNi615w5EEGuzuiH
 EftzrNQu9uZtxv0u8BEWObc6EWl1rD8xoM1xc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :content-transfer-encoding:in-reply-to;
 bh=yd/N+I5kkzyOJpCnRN7vd7lwOUGF6B7BATQPc1K2fYQ=;
 b=ZKwHWNvMvtfQ7aKyMl65XsELfbAoL1Hf+VNzlxXZWZZUnu9OWlviMGxhAwKlIuRE34
 q0aEw1xG3cBdP91hxzwjvIakAHLnsNyKNh+U51VZp3BcFVTPv4uBfH73aYqHIKObUbjd
 D1gQQ7At5jL+MK+VEaI+/TzckOxww1CCaZj/StbD2Gyou6gbV2Vk+okpshcKtDKNNev2
 IUBjdE6M1fpzdbv2nfvwss48o+hAU4mdGhlp6B7ft1yWcJZr+wX5FmkC/7aMQE8nkesu
 BtPL9STh8oyhvo3EhY8ySEARYCxXsqlqaSbtWRVWkPh9lrVFrjmbOql/6jERc5BbBfcC
 15FQ==
X-Gm-Message-State: AOAM53334KgzXJ5pfrMWQFZeRTOKwZ02xvGgLwT6t/z/Uvl5ZQ6mpRaJ
 ckljoeWrdLQVNKn0+FaZBu7jUg==
X-Google-Smtp-Source: ABdhPJzaMMmb4JfbfYiORqaQNccdJmyShOrVZsJEkutd675pXDThmmVuBjfO9+5KkU1bjFmrTMFG0A==
X-Received: by 2002:a05:6000:1374:: with SMTP id
 q20mr3489704wrz.44.1612962853806; 
 Wed, 10 Feb 2021 05:14:13 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id r1sm2894759wrl.95.2021.02.10.05.14.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Feb 2021 05:14:13 -0800 (PST)
Date: Wed, 10 Feb 2021 14:14:11 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Message-ID: <YCPcIwxso67M3VqR@phenom.ffwll.local>
Mail-Followup-To: Christian =?iso-8859-1?Q?K=F6nig?=
 <christian.koenig@amd.com>, 
 Rikard Falkeborn <rikard.falkeborn@gmail.com>,
 David Airlie <airlied@linux.ie>,
 Alex Deucher <alexander.deucher@amd.com>,
 Ben Skeggs <bskeggs@redhat.com>,
 Felix Kuehling <Felix.Kuehling@amd.com>,
 Likun Gao <Likun.Gao@amd.com>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 nouveau@lists.freedesktop.org
References: <20210209234817.55112-1-rikard.falkeborn@gmail.com>
 <e819cb08-98b6-c87d-4d95-338e06f88a48@amd.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <e819cb08-98b6-c87d-4d95-338e06f88a48@amd.com>
X-Operating-System: Linux phenom 5.7.0-1-amd64 
Subject: Re: [Nouveau] [PATCH 0/3] drm/ttm: constify static
 vm_operations_structs
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
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 David Airlie <airlied@linux.ie>, nouveau@lists.freedesktop.org,
 Felix Kuehling <Felix.Kuehling@amd.com>, linux-kernel@vger.kernel.org,
 Rikard Falkeborn <rikard.falkeborn@gmail.com>, Ben Skeggs <bskeggs@redhat.com>,
 Daniel Vetter <daniel@ffwll.ch>, Alex Deucher <alexander.deucher@amd.com>,
 Likun Gao <Likun.Gao@amd.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

On Wed, Feb 10, 2021 at 08:45:56AM +0100, Christian K=F6nig wrote:
> Reviewed-by: Christian K=F6nig <christian.koenig@amd.com> for the series.

Smash it into -misc?
-Daniel

> =

> Am 10.02.21 um 00:48 schrieb Rikard Falkeborn:
> > Constify a few static vm_operations_struct that are never modified. The=
ir
> > only usage is to assign their address to the vm_ops field in the
> > vm_area_struct, which is a pointer to const vm_operations_struct. Make =
them
> > const to allow the compiler to put them in read-only memory.
> > =

> > With this series applied, all static struct vm_operations_struct in the
> > kernel tree are const.
> > =

> > Rikard Falkeborn (3):
> >    drm/amdgpu/ttm: constify static vm_operations_struct
> >    drm/radeon/ttm: constify static vm_operations_struct
> >    drm/nouveau/ttm: constify static vm_operations_struct
> > =

> >   drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c | 2 +-
> >   drivers/gpu/drm/nouveau/nouveau_ttm.c   | 2 +-
> >   drivers/gpu/drm/radeon/radeon_ttm.c     | 2 +-
> >   3 files changed, 3 insertions(+), 3 deletions(-)
> > =

> =


-- =

Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
