Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7861D5B3EEF
	for <lists+nouveau@lfdr.de>; Fri,  9 Sep 2022 20:39:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 72D6010EDAD;
	Fri,  9 Sep 2022 18:39:19 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D9C8910EDAD
 for <nouveau@lists.freedesktop.org>; Fri,  9 Sep 2022 18:39:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1662748756;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=EdLhczu0CMi+mDnVz/QrauXucQKKVCzqETWjwaQHd38=;
 b=DyBMsWysP1OzVl2/wyG1BXtM+Qg24+0DfugbTooXAnYJi4VPLhGCDCXbUPbmVcjq97JgYi
 vMiz2kmn0lgTgX5cSEXoPLTBdg8BS1FYF4qRyXn72lel7PQIC9tXjmkDGz7EJ9yumJKaLt
 p6VwGqAlm6vEwb9uGYSuKXW7vcQB+sI=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-388-lGhWZHBeO1u0kmsAy_gasA-1; Fri, 09 Sep 2022 14:39:14 -0400
X-MC-Unique: lGhWZHBeO1u0kmsAy_gasA-1
Received: by mail-qk1-f199.google.com with SMTP id
 h8-20020a05620a284800b006b5c98f09fbso2183834qkp.21
 for <nouveau@lists.freedesktop.org>; Fri, 09 Sep 2022 11:39:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:user-agent:organization
 :references:in-reply-to:date:cc:to:from:subject:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=EdLhczu0CMi+mDnVz/QrauXucQKKVCzqETWjwaQHd38=;
 b=tqqIi6PThjMw2n+aLT/YeTPpwBlqvNuEplI1m6fXx46Pau09Z1VnY+RWEcTKheHYfa
 akAHBdC0xdykGjE7YELEvLpnrIf4MjEi1LllqVDUb6ahW4DFwW5CC+bq+qWTOCa/v7PQ
 dDtg2I7ogJY5k7ci/RKvz+JvH76W7g/qW01qNvyU4MUKyQPtEesYxb6RHdyeLJ+nhjMu
 sZJ01K+tyMlnqXBGidyJZinVipmwF52tQJOUnRii/aG/w+W6FN0TqIv1F3ZPMbkTfD08
 8VNSOT2rBOr3KjFuqDum4ZC/9mnXhxi5K8nHHMIsd0Xql7DJ8I96mEOGc/fgojq99c3d
 JwWQ==
X-Gm-Message-State: ACgBeo3xBZkbv2IkuEXyyAZ+lO/YXQ1j7JvCBGhiVXDb+vITrwsktteb
 QmZb+TlPDNPsejeDO4y2FMw93DyTbd59K24OcBjgGzCivbcGbvFgDsqytVnrOgQX06MlzGFvzmo
 OSRmjswSggH4wzzS0VWDaaYk1wg==
X-Received: by 2002:a05:620a:2409:b0:6bb:d417:c8b6 with SMTP id
 d9-20020a05620a240900b006bbd417c8b6mr11021740qkn.304.1662748754346; 
 Fri, 09 Sep 2022 11:39:14 -0700 (PDT)
X-Google-Smtp-Source: AA6agR6hJkqeVfTbw7cuxek5gomVvLkSerw4ZzxC0N7zAg5c4TbdTJmbRg/kK4DEJejexdZcRhNvDg==
X-Received: by 2002:a05:620a:2409:b0:6bb:d417:c8b6 with SMTP id
 d9-20020a05620a240900b006bbd417c8b6mr11021713qkn.304.1662748754013; 
 Fri, 09 Sep 2022 11:39:14 -0700 (PDT)
Received: from ?IPv6:2600:4040:5c48:e00::9e6? ([2600:4040:5c48:e00::9e6])
 by smtp.gmail.com with ESMTPSA id
 64-20020a370543000000b006bb619a6a85sm965016qkf.48.2022.09.09.11.39.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 09 Sep 2022 11:39:11 -0700 (PDT)
Message-ID: <1fb0323d201ef2d9b00fe9bdb65efa97e5bd1e8f.camel@redhat.com>
From: Lyude Paul <lyude@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, 
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, airlied@linux.ie, 
 daniel@ffwll.ch, bskeggs@redhat.com, kherbst@redhat.com, 
 laurent.pinchart@ideasonboard.com, kieran.bingham+renesas@ideasonboard.com,
 jyri.sarha@iki.fi, tomba@kernel.org, sam@ravnborg.org
Date: Fri, 09 Sep 2022 14:39:10 -0400
In-Reply-To: <20220909105947.6487-1-tzimmermann@suse.de>
References: <20220909105947.6487-1-tzimmermann@suse.de>
Organization: Red Hat Inc.
User-Agent: Evolution 3.42.4 (3.42.4-2.fc35)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [Nouveau] [PATCH 0/4] drm/plane: Remove drm_plane_init(),
 plus other cleanups
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
Cc: linux-renesas-soc@vger.kernel.org, nouveau@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

For the nouveau bits on 1, 2 and 4:

Reviewed-by: Lyude Paul <lyude@redhat.com>

On Fri, 2022-09-09 at 12:59 +0200, Thomas Zimmermann wrote:
> This patchset does cleanups to the plane code, most noteably it removes
> drm_plane_init(). The function is a small wrapper, which can easily be
> inlined into the few callers. Patch #1 fixes this.
> 
> The other clean-up patches #2 to #4 affect plane creation. Modesetting
> helpers and nouveau share some plane-allocation code that can be shared as
> helper function. While the function is already outdated, it's now at least
> well documented. As suggested by Daniel, patch #3 adds a warning to
> non-atomic plane helpers when they are being called from atomic drivers.
> Patch #4 adds an initializer macro for non-atomic plane functions. It
> should not be used in new drivers, but at least documents the current
> practice.
> 
> Tested with nouveau on Nvidia G72 hardware.
> 
> A possible next step would be the inlining of drm_crtc_init() and the
> removal of drm_plane.format_default.
> 
> Thomas Zimmermann (4):
>   drm/plane: Remove drm_plane_init()
>   drm/plane: Allocate planes with drm_universal_plane_alloc()
>   drm/plane-helper: Warn if atomic drivers call non-atomic helpers
>   drm/plane-helper: Provide DRM_PLANE_NON_ATOMIC_FUNCS initializer macro
> 
>  drivers/gpu/drm/drm_modeset_helper.c       | 68 +++++++++------------
>  drivers/gpu/drm/drm_plane.c                | 70 ++++++++++++----------
>  drivers/gpu/drm/drm_plane_helper.c         | 10 ++++
>  drivers/gpu/drm/nouveau/dispnv04/crtc.c    | 45 +++++---------
>  drivers/gpu/drm/nouveau/dispnv04/overlay.c | 13 ++--
>  drivers/gpu/drm/shmobile/shmob_drm_plane.c |  7 ++-
>  drivers/gpu/drm/tilcdc/tilcdc_plane.c      |  9 ++-
>  include/drm/drm_plane.h                    | 52 +++++++++++++---
>  include/drm/drm_plane_helper.h             | 12 ++++
>  9 files changed, 162 insertions(+), 124 deletions(-)
> 
> 
> base-commit: f2c3a05d33693ad51996fa7d12d3b2d4b0f372eb
> prerequisite-patch-id: c2b2f08f0eccc9f5df0c0da49fa1d36267deb11d
> prerequisite-patch-id: c67e5d886a47b7d0266d81100837557fda34cb24
> prerequisite-patch-id: 3f204510fcbf9530d6540bd8e6128cce598988b6

-- 
Cheers,
 Lyude Paul (she/her)
 Software Engineer at Red Hat

