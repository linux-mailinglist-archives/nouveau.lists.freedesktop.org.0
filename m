Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E50412FA77B
	for <lists+nouveau@lfdr.de>; Mon, 18 Jan 2021 18:28:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 457896E491;
	Mon, 18 Jan 2021 17:28:14 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8032E6E3FC
 for <nouveau@lists.freedesktop.org>; Mon, 18 Jan 2021 14:54:10 +0000 (UTC)
Received: by mail-wm1-x336.google.com with SMTP id o10so57839wmc.1
 for <nouveau@lists.freedesktop.org>; Mon, 18 Jan 2021 06:54:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:in-reply-to;
 bh=apoa+/DSSYyKEnsbh8pgyvury9C3FOAZ2Hpf78I8wmE=;
 b=bUU0fLbW5tYVN/3qqBoHlyCYwU56Sj1vkRJd+yEsEAOmZ9r+YiDJpcqqhpVFIYjG11
 ChK5NUpqyDh4MnapEPNYsDuZWAWR76Z/9+j6FVVzJtKzw09JfkDgfd9ostsJvQfANGv3
 AxGl2PEThbi4a5OMR1mJ1J4y2WcWh1kIXLxPQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to;
 bh=apoa+/DSSYyKEnsbh8pgyvury9C3FOAZ2Hpf78I8wmE=;
 b=O+hRyfIbQBhH9H/Lk9z03WRM7//dxFztL3rJ2YbxMJMLEfGiL18Unn6uhQIeOVPPkQ
 bjUfMl+xYF9pVG66BZmlR/N6ubG656K3SFoze+vj4wIZcxsOeMIYBNwZzkeMHOUiGr84
 msQmHjcy5m9oF1dgiEHkr8LDJUw2Gro//SA3kcGjsRXARGBYzBN1tgwBpQUplEEdFTRD
 0gwtSzJBMNiVemVaLqVNfMPdYMwYP62K1KMOaOwP26tZ+RbAHIXCcPW/BQuBD6ARssvT
 SHoyLp9i9sEz57jf5H3Z8qQRfDj64dWz7uSWuVSWGRX0QAB491d/YyWp6C9Kp/+PL7jD
 guPA==
X-Gm-Message-State: AOAM531IeQVl1BtHcpPGAVwKpL59lEdGS7IMhoz/ikUp4QcI9iTT3kHD
 OYVNyPlRFHl8OFR3je7ZQGya2g==
X-Google-Smtp-Source: ABdhPJzBMfJCHA9TAhBtmzLc4Yhw8L8oJ+kX7oYiwiUeFKbdP9etKtlE4mnl65fXm5nmp+xj4jA1oQ==
X-Received: by 2002:a7b:cbd5:: with SMTP id n21mr19693849wmi.5.1610981649008; 
 Mon, 18 Jan 2021 06:54:09 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id x128sm27249271wmb.29.2021.01.18.06.54.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Jan 2021 06:54:08 -0800 (PST)
Date: Mon, 18 Jan 2021 15:54:05 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Zack Rusin <zackr@vmware.com>
Message-ID: <YAWhDRkSOHbJ+2Le@phenom.ffwll.local>
Mail-Followup-To: Zack Rusin <zackr@vmware.com>,
 Lee Jones <lee.jones@linaro.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Ben Skeggs <bskeggs@redhat.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 Dave Airlie <airlied@redhat.com>, David Airlie <airlied@linux.ie>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Eddie Dong <eddie.dong@intel.com>, Eric Anholt <eric@anholt.net>,
 Faith <faith@valinux.com>, Gareth Hughes <gareth@valinux.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "intel-gvt-dev@lists.freedesktop.org" <intel-gvt-dev@lists.freedesktop.org>,
 Jackie Li <yaodong.li@intel.com>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Jan Safrata <jan.nikitenko@gmail.com>,
 Jesse Barnes <jesse.barnes@intel.com>, jim liu <jim.liu@intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Keith Packard <keithp@keithp.com>,
 Kevin Tian <kevin.tian@intel.com>,
 "linaro-mm-sig@lists.linaro.org" <linaro-mm-sig@lists.linaro.org>,
 "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Min He <min.he@intel.com>,
 Niu Bing <bing.niu@intel.com>,
 "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>,
 Patrik Jakobsson <patrik.r.jakobsson@gmail.com>,
 Pei Zhang <pei.zhang@intel.com>, Ping Gao <ping.a.gao@intel.com>,
 Rob Clark <rob.clark@linaro.org>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Roland Scheidegger <sroland@vmware.com>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Tina Zhang <tina.zhang@intel.com>,
 Linux-graphics-maintainer <Linux-graphics-maintainer@vmware.com>,
 Zhenyu Wang <zhenyuw@linux.intel.com>,
 Zhi Wang <zhi.a.wang@intel.com>, Zhiyuan Lv <zhiyuan.lv@intel.com>
References: <20210115181601.3432599-1-lee.jones@linaro.org>
 <F914D9B9-6DD4-4383-9F7C-8D09FBFE96CE@vmware.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <F914D9B9-6DD4-4383-9F7C-8D09FBFE96CE@vmware.com>
X-Operating-System: Linux phenom 5.7.0-1-amd64 
X-Mailman-Approved-At: Mon, 18 Jan 2021 17:28:14 +0000
Subject: Re: [Nouveau] [PATCH 00/29] [Set 15] Finally rid W=1 warnings from
 GPU!
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
Cc: Jackie Li <yaodong.li@intel.com>, David Airlie <airlied@linux.ie>,
 "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Eric Anholt <eric@anholt.net>, Jesse Barnes <jesse.barnes@intel.com>,
 Tina Zhang <tina.zhang@intel.com>, Jan Safrata <jan.nikitenko@gmail.com>,
 Lee Jones <lee.jones@linaro.org>, Sumit Semwal <sumit.semwal@linaro.org>,
 Gareth Hughes <gareth@valinux.com>, Pei Zhang <pei.zhang@intel.com>,
 Patrik Jakobsson <patrik.r.jakobsson@gmail.com>,
 Rob Clark <rob.clark@linaro.org>, Min He <min.he@intel.com>,
 Linux-graphics-maintainer <Linux-graphics-maintainer@vmware.com>,
 Ben Skeggs <bskeggs@redhat.com>, Dave Airlie <airlied@redhat.com>,
 Niu Bing <bing.niu@intel.com>, Zhi Wang <zhi.a.wang@intel.com>,
 "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
 Kevin Tian <kevin.tian@intel.com>, jim liu <jim.liu@intel.com>,
 Roland Scheidegger <sroland@vmware.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 "linaro-mm-sig@lists.linaro.org" <linaro-mm-sig@lists.linaro.org>,
 Maxime Ripard <mripard@kernel.org>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 "intel-gvt-dev@lists.freedesktop.org" <intel-gvt-dev@lists.freedesktop.org>,
 Keith Packard <keithp@keithp.com>, Eddie Dong <eddie.dong@intel.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Faith <faith@valinux.com>, Daniel Vetter <daniel@ffwll.ch>,
 Ping Gao <ping.a.gao@intel.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 Zhiyuan Lv <zhiyuan.lv@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

On Fri, Jan 15, 2021 at 06:27:15PM +0000, Zack Rusin wrote:
> 
> > On Jan 15, 2021, at 13:15, Lee Jones <lee.jones@linaro.org> wrote:
> > 
> > This set is part of a larger effort attempting to clean-up W=1
> > kernel builds, which are currently overwhelmingly riddled with
> > niggly little warnings.
> > 
> > Last set!  All clean after this for; Arm, Arm64, PPC, MIPS and x86.
> 
> Thanks! For all the vmwgfx bits:
> Reviewed-by: Zack Rusin <zackr@vmware.com>

Ok I merged everything except vmwgfx (that's for Zack) and i915/nouveau
(those generally go through other trees, pls holler if they're stuck).

Note that we have some build issue on some of the configs sfr uses, so drm
trees are still stuck on old versions in linux-next. Hopefully should get
resolved soon, the bugfix is in some subtree I've heard.
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
