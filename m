Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 915F158482A
	for <lists+nouveau@lfdr.de>; Fri, 29 Jul 2022 00:21:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 520B811B409;
	Thu, 28 Jul 2022 22:21:16 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD1D4113513
 for <nouveau@lists.freedesktop.org>; Thu, 28 Jul 2022 22:21:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1659046872;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gXHo3CFCrAMARz8FmOIc/wfp1RQLr9t3UxdcITMHRm4=;
 b=XxW8e7SRh2zvYw7C1BXktuRQTQM6754fN+Li0ScN9K6vA8Qh939sRRiErs6vJBeYnRuPHq
 HckoURhjeZBtDLSp1ET1V2LARDhjAoLrY31pJNZCl0cl/K4FJrMKxMKGiJ4bEKpmCMe6Fb
 UHhfhy2L3v/TMv4XDZkgjzxXULeCuTU=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-49-VvrJSoPrNKKew-Zcu_Qd8Q-1; Thu, 28 Jul 2022 18:21:09 -0400
X-MC-Unique: VvrJSoPrNKKew-Zcu_Qd8Q-1
Received: by mail-qk1-f197.google.com with SMTP id
 m17-20020a05620a291100b006b6590830feso2390736qkp.13
 for <nouveau@lists.freedesktop.org>; Thu, 28 Jul 2022 15:21:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:organization:user-agent:mime-version
 :content-transfer-encoding;
 bh=gXHo3CFCrAMARz8FmOIc/wfp1RQLr9t3UxdcITMHRm4=;
 b=NkcH/vmoNOB2PdFu5v8GagIgAYQnAmIulYxeBqIrP6KbqaEavDqLE7L7Dt8UaA8hyo
 sUmCThMBfUmk1In8KvyAd6tp9ZUs4liOi5PNisaoSlW0kW265ZDZh6vn2mipEmXmWyCn
 R6LJ5MlBlQr6bCuENrOpssZmMLQL3LJTez63SLpohpeT96/su4Y5sIYgI00D6dQ2mfPV
 Fu2Ghr4sU8SPGn7swzyaiAwBG06aCVWZgw/edbQazWLug4+Q3F6SlUwxwWhs+zwCzYeE
 5KjFtCVv2V+7DHHyA+nEDySX1deUSdGcrgFfVqqhmAwSHg2qvWH+FdBRvseGx0m3R0z5
 +l5A==
X-Gm-Message-State: AJIora8hDtLg4lJQ2ioQhOin2M5zPxGiLl2PXJ7Ep0X3BB/gHSvlw1Lt
 5KLxXDdNQkfvWLkIKWgqUKtPhlSR0llHEeFHwU1I5N6kNlerG/8vqkTxH9ESL0w7AhGrjAUgHI8
 wD9WCrf6S5o9y1c3pXi7p0fndcw==
X-Received: by 2002:a05:620a:28c5:b0:6b5:e488:32f9 with SMTP id
 l5-20020a05620a28c500b006b5e48832f9mr765774qkp.205.1659046869248; 
 Thu, 28 Jul 2022 15:21:09 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1sin1/H9Ji3/ORk6jyiYizYwrnVoGj73ZveW7/f+x3aeq/nHlLOY1tWmV/1B0pt74uP5N4P/w==
X-Received: by 2002:a05:620a:28c5:b0:6b5:e488:32f9 with SMTP id
 l5-20020a05620a28c500b006b5e48832f9mr765760qkp.205.1659046868980; 
 Thu, 28 Jul 2022 15:21:08 -0700 (PDT)
Received: from [192.168.8.138] (pool-100-0-245-4.bstnma.fios.verizon.net.
 [100.0.245.4]) by smtp.gmail.com with ESMTPSA id
 fb26-20020a05622a481a00b00304fc3d144esm1154618qtb.1.2022.07.28.15.21.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Jul 2022 15:21:08 -0700 (PDT)
Message-ID: <44fab45aeae56ddcb5074ca16ed2b2a4e4f67b7f.camel@redhat.com>
From: Lyude Paul <lyude@redhat.com>
To: dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org, 
 amd-gfx@lists.freedesktop.org
Date: Thu, 28 Jul 2022 18:21:06 -0400
In-Reply-To: <20220607192933.1333228-1-lyude@redhat.com>
References: <20220607192933.1333228-1-lyude@redhat.com>
Organization: Red Hat Inc.
User-Agent: Evolution 3.42.4 (3.42.4-2.fc35)
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lyude@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Subject: Re: [Nouveau] [RESEND RFC 00/18] drm/display/dp_mst: Drop Radeon
 MST support, make MST atomic-only
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

Sorry for taking a while on respinning this! I've been busy with trying to
review as much nouveau patches as possible before we passed the deadline for
getting pulled into the kernel, since we've got quite a lot of pending patches
coming up. The pull deadline we had from Dave has passed at this point though,
so I should have a chance to respin this in the next few business days.

On Tue, 2022-06-07 at 15:29 -0400, Lyude Paul wrote:
> Ugh, thanks ./scripts/get_maintainers.pl for confusing and breaking
> git-send email <<. Sorry for the resend everyone.
> 
> For quite a while we've been carrying around a lot of legacy modesetting
> code in the MST helpers that has been rather annoying to keep around,
> and very often gets in the way of trying to implement additional
> functionality in MST such as fallback link rate retraining, dynamic BPC
> management and DSC support, etc. because of the fact that we can't rely
> on atomic for everything.
> 
> Luckily, we only actually have one user of the legacy MST code in the
> kernel - radeon. Originally I was thinking of trying to maintain this
> code and keep it around in some form, but I'm pretty unconvinced anyone
> is actually using this. My reasoning for that is because I've seen
> nearly no issues regarding MST on radeon for quite a while now - despite
> the fact my local testing seems to indicate it's quite broken. This
> isn't too surprising either, as MST support in radeon.ko is gated behind
> a module parameter that isn't enabled by default. This isn't to say I
> wouldn't be open to alternative suggestions, but I'd rather not be the
> one to have to spend time on that if at all possible! Plus, I already
> floated the idea of dropping this code by AMD folks a few times and
> didn't get much resistance.
> 
> As well, this series has some basic refactoring that I did along the way
> and some bugs I had to fix in order to get my atomic-only MST code
> working. Most of this is pretty straight forward and simply renaming
> things to more closely match the DisplayPort specification, as I think
> this will also make maintaining this code a lot easier in the long run
> (I've gotten myself confused way too many times because of this).
> 
> So far I've tested this on all three MST drivers: amdgpu, i915 and
> nouveau, along with making sure that removing the radeon MST code
> doesn't break anything else. The one thing I very much could use help
> with regarding testing though is making sure that this works with
> amdgpu's DSC support on MST.
> 
> So, with this we should be using the atomic state as much as possible
> with MST modesetting, hooray!
> 
> Cc: Wayne Lin <Wayne.Lin@amd.com>
> Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
> Cc: Fangzhi Zuo <Jerry.Zuo@amd.com>
> Cc: Jani Nikula <jani.nikula@intel.com>
> Cc: Imre Deak <imre.deak@intel.com>
> Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
> Cc: Sean Paul <sean@poorly.run>
> 
> Lyude Paul (18):
>   drm/amdgpu/dc/mst: Rename dp_mst_stream_allocation(_table)
>   drm/amdgpu/dm/mst: Rename get_payload_table()
>   drm/display/dp_mst: Rename drm_dp_mst_vcpi_allocation
>   drm/display/dp_mst: Call them time slots, not VCPI slots
>   drm/display/dp_mst: Fix confusing docs for
>     drm_dp_atomic_release_time_slots()
>   drm/display/dp_mst: Add some missing kdocs for atomic MST structs
>   drm/display/dp_mst: Add helper for finding payloads in atomic MST
>     state
>   drm/display/dp_mst: Add nonblocking helpers for DP MST
>   drm/display/dp_mst: Don't open code modeset checks for releasing time
>     slots
>   drm/display/dp_mst: Fix modeset tracking in
>     drm_dp_atomic_release_vcpi_slots()
>   drm/nouveau/kms: Cache DP encoders in nouveau_connector
>   drm/nouveau/kms: Pull mst state in for all modesets
>   drm/display/dp_mst: Add helpers for serializing SST <-> MST
>     transitions
>   drm/display/dp_mst: Drop all ports from topology on CSNs before
>     queueing link address work
>   drm/display/dp_mst: Skip releasing payloads if last connected port
>     isn't connected
>   drm/display/dp_mst: Maintain time slot allocations when deleting
>     payloads
>   drm/radeon: Drop legacy MST support
>   drm/display/dp_mst: Move all payload info into the atomic state
> 
>  .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c |   72 +-
>  .../amd/display/amdgpu_dm/amdgpu_dm_helpers.c |  111 +-
>  .../display/amdgpu_dm/amdgpu_dm_mst_types.c   |  126 +-
>  drivers/gpu/drm/amd/display/dc/core/dc_link.c |   10 +-
>  drivers/gpu/drm/amd/display/dc/dm_helpers.h   |    4 +-
>  .../amd/display/include/link_service_types.h  |   18 +-
>  drivers/gpu/drm/display/drm_dp_mst_topology.c | 1160 ++++++++---------
>  drivers/gpu/drm/i915/display/intel_display.c  |   11 +
>  drivers/gpu/drm/i915/display/intel_dp.c       |    9 +
>  drivers/gpu/drm/i915/display/intel_dp_mst.c   |   91 +-
>  drivers/gpu/drm/i915/display/intel_hdcp.c     |   24 +-
>  drivers/gpu/drm/nouveau/dispnv50/disp.c       |  202 ++-
>  drivers/gpu/drm/nouveau/dispnv50/disp.h       |    2 +
>  drivers/gpu/drm/nouveau/nouveau_connector.c   |   18 +-
>  drivers/gpu/drm/nouveau/nouveau_connector.h   |    3 +
>  drivers/gpu/drm/radeon/Makefile               |    2 +-
>  drivers/gpu/drm/radeon/atombios_crtc.c        |   11 +-
>  drivers/gpu/drm/radeon/atombios_encoders.c    |   59 -
>  drivers/gpu/drm/radeon/radeon_atombios.c      |    2 -
>  drivers/gpu/drm/radeon/radeon_connectors.c    |   61 +-
>  drivers/gpu/drm/radeon/radeon_device.c        |    1 -
>  drivers/gpu/drm/radeon/radeon_dp_mst.c        |  778 -----------
>  drivers/gpu/drm/radeon/radeon_drv.c           |    4 -
>  drivers/gpu/drm/radeon/radeon_encoders.c      |   14 +-
>  drivers/gpu/drm/radeon/radeon_irq_kms.c       |   10 +-
>  drivers/gpu/drm/radeon/radeon_mode.h          |   40 -
>  include/drm/display/drm_dp_mst_helper.h       |  230 ++--
>  27 files changed, 991 insertions(+), 2082 deletions(-)
>  delete mode 100644 drivers/gpu/drm/radeon/radeon_dp_mst.c
> 

-- 
Cheers,
 Lyude Paul (she/her)
 Software Engineer at Red Hat

