Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C171248680
	for <lists+nouveau@lfdr.de>; Tue, 18 Aug 2020 15:56:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 95FA989B99;
	Tue, 18 Aug 2020 13:55:51 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 78ADE89F01
 for <nouveau@lists.freedesktop.org>; Tue, 18 Aug 2020 08:27:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1597739233;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YE9v2iUUt0C+eIB9363k6FZZUNnKbdhJpiU9fX/PhuY=;
 b=Af/2mKqOvbxTNoooOkwf2vMQkD1fX7Bsqo7+NuMpZbcr6pnrUM1vF+jLc9VRucj8HrUKuL
 iv8JWKvDfGeaP6e6lk06lWGvq0CYSjuR8dJzCJjewDkHxveVPC8sQTfsNg041G6Adz/VOk
 MDAIKk1NmMkqOi9RnmuJ569MwcKJXQM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-11-ahIv83ehNsqc6ofMzQXlaA-1; Tue, 18 Aug 2020 04:27:09 -0400
X-MC-Unique: ahIv83ehNsqc6ofMzQXlaA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B292C1DDF1;
 Tue, 18 Aug 2020 08:27:06 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-195.ams2.redhat.com
 [10.36.112.195])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A5EAA261B9;
 Tue, 18 Aug 2020 08:27:04 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id C21E09CBD; Tue, 18 Aug 2020 10:27:03 +0200 (CEST)
Date: Tue, 18 Aug 2020 10:27:03 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>
Message-ID: <20200818082703.7z6fcvoymiqow5kw@sirius.home.kraxel.org>
References: <20200818074828.9509-1-kraxel@redhat.com>
 <20200818074828.9509-2-kraxel@redhat.com>
 <9c355d64-1a61-eb59-be80-d9fc863ddf22@amd.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <9c355d64-1a61-eb59-be80-d9fc863ddf22@amd.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Mailman-Approved-At: Tue, 18 Aug 2020 13:55:50 +0000
Subject: Re: [Nouveau] [PATCH 1/2] drm: allow limiting the scatter list size.
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
Cc: "open list:DRM DRIVER FOR MSM ADRENO GPU"
 <freedreno@lists.freedesktop.org>, Alex Deucher <alexander.deucher@amd.com>,
 open list <linux-kernel@vger.kernel.org>,
 Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>,
 David Airlie <airlied@linux.ie>,
 "open list:DRM DRIVER FOR NVIDIA GEFORCE/QUADRO GPUS"
 <nouveau@lists.freedesktop.org>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>,
 "moderated list:DRM DRIVERS FOR VIVANTE GPU IP"
 <etnaviv@lists.freedesktop.org>, Sandy Huang <hjc@rock-chips.com>,
 dri-devel@lists.freedesktop.org,
 "open list:ARM/Rockchip SoC support" <linux-rockchip@lists.infradead.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 "open list:RADEON and AMDGPU DRM DRIVERS" <amd-gfx@lists.freedesktop.org>,
 Russell King <linux+etnaviv@armlinux.org.uk>,
 "open list:DRM DRIVERS FOR NVIDIA TEGRA" <linux-tegra@vger.kernel.org>,
 "moderated list:DRM DRIVERS FOR XEN" <xen-devel@lists.xenproject.org>,
 Sean Paul <sean@poorly.run>, "moderated list:ARM/Rockchip SoC support"
 <linux-arm-kernel@lists.infradead.org>, Ben Skeggs <bskeggs@redhat.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

On Tue, Aug 18, 2020 at 09:57:59AM +0200, Christian K=F6nig wrote:
> Am 18.08.20 um 09:48 schrieb Gerd Hoffmann:
> > Add max_segment argument to drm_prime_pages_to_sg().  When set pass it
> > through to the __sg_alloc_table_from_pages() call, otherwise use
> > SCATTERLIST_MAX_SEGMENT.
> > =

> > Also add max_segment field to gem objects and pass it to
> > drm_prime_pages_to_sg() calls in drivers and helpers.
> > =

> > Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
> =

> I'm missing an explanation why this should be useful (it certainly is).

virtio-gpu needs this to work properly with SEV (see patch 2/2 of this
series).

> And the maximum segment size seems misplaced in the GEM object. This is
> usually a property of the device or even completely constant.

Placing it in drm_device instead would indeed work for virtio-gpu, so I
guess you are suggesting that instead?

take care,
  Gerd

_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
