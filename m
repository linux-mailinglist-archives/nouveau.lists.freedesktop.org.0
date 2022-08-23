Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 17F9459EE00
	for <lists+nouveau@lfdr.de>; Tue, 23 Aug 2022 23:09:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 11D6C10FA30;
	Tue, 23 Aug 2022 21:09:33 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C16C610F9CD
 for <nouveau@lists.freedesktop.org>; Tue, 23 Aug 2022 21:09:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1661288966;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GQSM/RGh8mGdrtSfQj9vauiNBm4oVfOIxDJRMUWZlC0=;
 b=WSLeR/F0AYsRVGwujoYPGuukV7kLAU1FRhIOqCeybBXFdLE6EPRHdVmqRtomMpTXLBoOE5
 SVlSRJVR+i8d1GGfrhu7TjvlKkExZrw1O/va+kea46sqTi5hH3DUSWqZalw6jBo7cuvjsl
 MPXfKhjA34pLkuyFkjxWdeFCHBJUqYU=
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-647-UopdwmxtOqypwdX-yzds9w-1; Tue, 23 Aug 2022 17:09:22 -0400
X-MC-Unique: UopdwmxtOqypwdX-yzds9w-1
Received: by mail-qt1-f197.google.com with SMTP id
 fc18-20020a05622a489200b00344b09d2578so7114752qtb.13
 for <nouveau@lists.freedesktop.org>; Tue, 23 Aug 2022 14:09:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:user-agent:organization
 :references:in-reply-to:date:cc:to:from:subject:message-id
 :x-gm-message-state:from:to:cc;
 bh=GQSM/RGh8mGdrtSfQj9vauiNBm4oVfOIxDJRMUWZlC0=;
 b=Vp2IWIfmpil1cxXvOuKXqQodh2j467ZuT53EZ25FUD7uCb7x2sHG38qTsMpbKB7Re5
 5mMYU+1DlRoxoftpe9i9E8MFpshF1pB1jUOJRI6PBh9B062OJ0zuOReUAuEt8ouz52CR
 dKyVJj9EeYpzVCtQU8MZ3efjg4cxK4D/kHj8MTKWSpq8CfNgCpQhYAPTKUb/xzh+as+i
 CVaPq9qQNp7STu2lRe+aqpIUKAt/Xbmqr2C8PotCL6lgt09SASXeq3EFlG09lL1wjvXI
 hQM7pjiL5MqT3uXT0J2L7chrHqVbsFw6WNBEA6XFuo7xamRCxMmPM9BGVZHsYlE4UAaI
 oOdw==
X-Gm-Message-State: ACgBeo3JtHdDtwLuJq+wOM4ff76PiEIbs5KvtAasvtA0xqEDrHbEaPj1
 jc7EgF+YTGUNYw2E6TqlOmaIco0mIC7lRTZviT0GG0Hd3sh+HCaOuuqdRxzE8rq3IrM5Nw7mJGk
 RBecPk6kV7JohuZiHLbJQggCQZw==
X-Received: by 2002:ac8:5dd1:0:b0:343:7ddc:8d0a with SMTP id
 e17-20020ac85dd1000000b003437ddc8d0amr21524805qtx.615.1661288962422; 
 Tue, 23 Aug 2022 14:09:22 -0700 (PDT)
X-Google-Smtp-Source: AA6agR69HDzVSzJrEZ+8qYYkXXMohhZEq9scSqarTaD8uVSSTD+0zynybEJisjiWIws6Y1e5GcHLDw==
X-Received: by 2002:ac8:5dd1:0:b0:343:7ddc:8d0a with SMTP id
 e17-20020ac85dd1000000b003437ddc8d0amr21524783qtx.615.1661288962182; 
 Tue, 23 Aug 2022 14:09:22 -0700 (PDT)
Received: from [192.168.8.139] (pool-100-0-245-4.bstnma.fios.verizon.net.
 [100.0.245.4]) by smtp.gmail.com with ESMTPSA id
 j12-20020a05620a288c00b006b61b2cb1d2sm13834744qkp.46.2022.08.23.14.09.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Aug 2022 14:09:21 -0700 (PDT)
Message-ID: <4f179363055570228d2932c9636735a269f3b5ef.camel@redhat.com>
From: Lyude Paul <lyude@redhat.com>
To: dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org, 
 amd-gfx@lists.freedesktop.org, intel-gfx@lists.freedesktop.org
Date: Tue, 23 Aug 2022 17:09:19 -0400
In-Reply-To: <c22a559b64b1ca9f9d80ed9b5a6a4e97636cd19c.camel@redhat.com>
References: <20220817193847.557945-1-lyude@redhat.com>
 <c22a559b64b1ca9f9d80ed9b5a6a4e97636cd19c.camel@redhat.com>
Organization: Red Hat Inc.
User-Agent: Evolution 3.42.4 (3.42.4-2.fc35)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Subject: Re: [Nouveau] [RFC v4 00/17] drm/display/dp_mst: Drop Radeon MST
 support, make MST atomic-only
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
Cc: Jani Nikula <jani.nikula@intel.com>, Imre Deak <imre.deak@intel.com>,
 Fangzhi Zuo <Jerry.Zuo@amd.com>, Wayne Lin <Wayne.Lin@amd.com>,
 Sean Paul <sean@poorly.run>,
 Ville =?ISO-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

Actually, talked with airlied and they suggested at this point I should just
go ahead and push. So, pushed! Have fun getting nice DSC support everyone :)

On Tue, 2022-08-23 at 13:26 -0400, Lyude Paul wrote:
> Would anyone have any issues if I merged this today? The whole series is
> acked, but I'm not sure if we would like to wait for R-b's?
> 
> 
> On Wed, 2022-08-17 at 15:38 -0400, Lyude Paul wrote:
> > For quite a while we've been carrying around a lot of legacy modesetting
> > code in the MST helpers that has been rather annoying to keep around,
> > and very often gets in the way of trying to implement additional
> > functionality in MST such as fallback link rate retraining, dynamic BPC
> > management and DSC support, etc. because of the fact that we can't rely
> > on atomic for everything.
> > 
> > Luckily, we only actually have one user of the legacy MST code in the
> > kernel - radeon. Originally I was thinking of trying to maintain this
> > code and keep it around in some form, but I'm pretty unconvinced anyone
> > is actually using this. My reasoning for that is because I've seen
> > nearly no issues regarding MST on radeon for quite a while now - despite
> > the fact my local testing seems to indicate it's quite broken. This
> > isn't too surprising either, as MST support in radeon.ko is gated behind
> > a module parameter that isn't enabled by default. This isn't to say I
> > wouldn't be open to alternative suggestions, but I'd rather not be the
> > one to have to spend time on that if at all possible! Plus, I already
> > floated the idea of dropping this code by AMD folks a few times and
> > didn't get much resistance.
> > 
> > As well, this series has some basic refactoring that I did along the way
> > and some bugs I had to fix in order to get my atomic-only MST code
> > working. Most of this is pretty straight forward and simply renaming
> > things to more closely match the DisplayPort specification, as I think
> > this will also make maintaining this code a lot easier in the long run
> > (I've gotten myself confused way too many times because of this).
> > 
> > So far I've tested this on all three MST drivers: amdgpu, i915 and
> > nouveau, along with making sure that removing the radeon MST code
> > doesn't break anything else. The one thing I very much could use help
> > with regarding testing though is making sure that this works with
> > amdgpu's DSC support on MST.
> > 
> > So, with this we should be using the atomic state as much as possible
> > with MST modesetting, hooray!
> > 
> > V4:
> > * Get rid of fix that Wayne pointed out isn't needed
> > 
> > Cc: Wayne Lin <Wayne.Lin@amd.com>
> > Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
> > Cc: Fangzhi Zuo <Jerry.Zuo@amd.com>
> > Cc: Jani Nikula <jani.nikula@intel.com>
> > Cc: Imre Deak <imre.deak@intel.com>
> > Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
> > Cc: Sean Paul <sean@poorly.run>
> > 
> > Lyude Paul (17):
> >   drm/amdgpu/dc/mst: Rename dp_mst_stream_allocation(_table)
> >   drm/amdgpu/dm/mst: Rename get_payload_table()
> >   drm/display/dp_mst: Rename drm_dp_mst_vcpi_allocation
> >   drm/display/dp_mst: Call them time slots, not VCPI slots
> >   drm/display/dp_mst: Fix confusing docs for
> >     drm_dp_atomic_release_time_slots()
> >   drm/display/dp_mst: Add some missing kdocs for atomic MST structs
> >   drm/display/dp_mst: Add helper for finding payloads in atomic MST
> >     state
> >   drm/display/dp_mst: Add nonblocking helpers for DP MST
> >   drm/display/dp_mst: Don't open code modeset checks for releasing time
> >     slots
> >   drm/display/dp_mst: Fix modeset tracking in
> >     drm_dp_atomic_release_vcpi_slots()
> >   drm/nouveau/kms: Cache DP encoders in nouveau_connector
> >   drm/nouveau/kms: Pull mst state in for all modesets
> >   drm/display/dp_mst: Add helpers for serializing SST <-> MST
> >     transitions
> >   drm/display/dp_mst: Drop all ports from topology on CSNs before
> >     queueing link address work
> >   drm/display/dp_mst: Maintain time slot allocations when deleting
> >     payloads
> >   drm/radeon: Drop legacy MST support
> >   drm/display/dp_mst: Move all payload info into the atomic state
> > 
> >  .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c |   68 +-
> >  .../amd/display/amdgpu_dm/amdgpu_dm_helpers.c |  108 +-
> >  .../display/amdgpu_dm/amdgpu_dm_mst_types.c   |  125 +-
> >  drivers/gpu/drm/amd/display/dc/core/dc_link.c |   10 +-
> >  drivers/gpu/drm/amd/display/dc/dm_helpers.h   |    4 +-
> >  .../amd/display/include/link_service_types.h  |   14 +-
> >  drivers/gpu/drm/display/drm_dp_mst_topology.c | 1137 ++++++++---------
> >  drivers/gpu/drm/i915/display/intel_display.c  |    6 +
> >  drivers/gpu/drm/i915/display/intel_dp.c       |    9 +
> >  drivers/gpu/drm/i915/display/intel_dp_mst.c   |   91 +-
> >  drivers/gpu/drm/i915/display/intel_hdcp.c     |   24 +-
> >  drivers/gpu/drm/nouveau/dispnv50/disp.c       |  197 ++-
> >  drivers/gpu/drm/nouveau/dispnv50/disp.h       |    2 +
> >  drivers/gpu/drm/nouveau/nouveau_connector.c   |   18 +-
> >  drivers/gpu/drm/nouveau/nouveau_connector.h   |    3 +
> >  drivers/gpu/drm/radeon/Makefile               |    2 +-
> >  drivers/gpu/drm/radeon/atombios_crtc.c        |   11 +-
> >  drivers/gpu/drm/radeon/atombios_encoders.c    |   59 -
> >  drivers/gpu/drm/radeon/radeon_atombios.c      |    2 -
> >  drivers/gpu/drm/radeon/radeon_connectors.c    |   61 +-
> >  drivers/gpu/drm/radeon/radeon_device.c        |    1 -
> >  drivers/gpu/drm/radeon/radeon_dp_mst.c        |  778 -----------
> >  drivers/gpu/drm/radeon/radeon_drv.c           |    4 -
> >  drivers/gpu/drm/radeon/radeon_encoders.c      |   14 +-
> >  drivers/gpu/drm/radeon/radeon_irq_kms.c       |   10 +-
> >  drivers/gpu/drm/radeon/radeon_mode.h          |   40 -
> >  include/drm/display/drm_dp_mst_helper.h       |  234 ++--
> >  27 files changed, 955 insertions(+), 2077 deletions(-)
> >  delete mode 100644 drivers/gpu/drm/radeon/radeon_dp_mst.c
> > 
> 

-- 
Cheers,
 Lyude Paul (she/her)
 Software Engineer at Red Hat

