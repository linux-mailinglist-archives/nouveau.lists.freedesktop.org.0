Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4750912B2A8
	for <lists+nouveau@lfdr.de>; Fri, 27 Dec 2019 09:14:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F0B6789DFB;
	Fri, 27 Dec 2019 08:13:34 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-yb1-xb41.google.com (mail-yb1-xb41.google.com
 [IPv6:2607:f8b0:4864:20::b41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 734FC6F8E7
 for <nouveau@lists.freedesktop.org>; Wed, 25 Sep 2019 20:08:40 +0000 (UTC)
Received: by mail-yb1-xb41.google.com with SMTP id b128so62697ybh.2
 for <nouveau@lists.freedesktop.org>; Wed, 25 Sep 2019 13:08:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=poorly.run; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to
 :user-agent; bh=VAaiqGoJ4pEXMzYJOikHUUPKtKAF3wx8lqD0K1ST4aU=;
 b=avhIse5/RpZfaFodCvM+4FD3O2mvJQh97DzvaZXBZYVqRDzM/KKnpGktHjBkk6qTo4
 ZluHFmK/j7vB/YDW9UOdND4nib0QCocOdYW/X6Kef74sjmd5WKB/5BQM9YTYF5JwUlah
 7b6fgcEaWaayEw/i5sbJBNPPxwIJ3Hpe1+xBnsozs6pANPepf/cZdcOYXME7lPLtmxPy
 BA2cxyO4o7qTboXkzt0SAlK7IWTxSkCL1zJF4FJ9LLQeW9D2ChBzpHd4ehh3IpTOa/OY
 Lb+9U+F/aiQCQfXqwqZrqtzQaA5kFXasKjTzAY8WbljfS1jXuAa0ci5NT2LMscnsgv7m
 91kA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=VAaiqGoJ4pEXMzYJOikHUUPKtKAF3wx8lqD0K1ST4aU=;
 b=eODkasYO3PFhD7IaIkciLRtVy9TVvCpFOMQa2girecltrVUBoii6M6l2+eUCTWaFJ/
 Z6mGOjlK61AZet4Y8DruqUakwyhtMOXfOWhlcpmOZ5YFPOZiRLC8BWILGIEb2vjzzL2K
 IUwZL/6shf40vozpBnvsr0v+lZMsSKQ26c65sH+w8hG0pYBLGtPxOMiGKRQKKKJelFEd
 6rUk8orx7Ymq+AUFQW4ONCUASZM2qCGKXcNq7BZxhIqLSuicee2QFNDx/Q8jXROaNtpu
 EG30si5DWdw2Q5+vjnUDNch92ksd0Y1HrsgovTWOxIp820pvwf/g289r1heXxw8Sw5qH
 avAw==
X-Gm-Message-State: APjAAAXKcLM4HyGVgqwCxNMqLKaxFmqEhO8USvfwI0aW0srBAxRX4Qyx
 +1wwAIBOogeSm2EM91ejqgqeBw==
X-Google-Smtp-Source: APXvYqzHtod4n2+whggfrt7HgHX6HJwM31fm7krzjZzFBf0YmRR0H8hZpdFsXRX/JxLZErFMY3j6fA==
X-Received: by 2002:a5b:bc4:: with SMTP id c4mr1267071ybr.270.1569442119582;
 Wed, 25 Sep 2019 13:08:39 -0700 (PDT)
Received: from localhost ([2620:0:1013:11:89c6:2139:5435:371d])
 by smtp.gmail.com with ESMTPSA id u67sm1487609ywf.44.2019.09.25.13.08.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Sep 2019 13:08:39 -0700 (PDT)
Date: Wed, 25 Sep 2019 16:08:38 -0400
From: Sean Paul <sean@poorly.run>
To: Lyude Paul <lyude@redhat.com>
Message-ID: <20190925200838.GO218215@art_vandelay>
References: <20190903204645.25487-1-lyude@redhat.com>
 <20190903204645.25487-25-lyude@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190903204645.25487-25-lyude@redhat.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Approved-At: Fri, 27 Dec 2019 08:13:30 +0000
Subject: Re: [Nouveau] [PATCH v2 24/27] drm/amdgpu/dm: Resume short HPD IRQs
 before resuming MST topology
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
Cc: "David \(ChunMing\) Zhou" <David1.Zhou@amd.com>,
 Mario Kleiner <mario.kleiner.de@gmail.com>, dri-devel@lists.freedesktop.org,
 Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>,
 nouveau@lists.freedesktop.org, Imre Deak <imre.deak@intel.com>,
 linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>,
 Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>, David Airlie <airlied@linux.ie>,
 Juston Li <juston.li@intel.com>, Daniel Vetter <daniel@ffwll.ch>,
 Alex Deucher <alexander.deucher@amd.com>,
 David Francis <David.Francis@amd.com>, Harry Wentland <hwentlan@amd.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

On Tue, Sep 03, 2019 at 04:46:02PM -0400, Lyude Paul wrote:
> Since we're going to be reprobing the entire topology state on resume
> now using sideband transactions, we need to ensure that we actually have
> short HPD irqs enabled before calling drm_dp_mst_topology_mgr_resume().
> So, do that.
> =

> Cc: Juston Li <juston.li@intel.com>
> Cc: Imre Deak <imre.deak@intel.com>
> Cc: Ville Syrj=E4l=E4 <ville.syrjala@linux.intel.com>
> Cc: Harry Wentland <hwentlan@amd.com>
> Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
> Signed-off-by: Lyude Paul <lyude@redhat.com>
> ---
>  drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> =

> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/=
gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> index 73630e2940d4..4d3c8bff77da 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> @@ -1185,15 +1185,15 @@ static int dm_resume(void *handle)
>  	/* program HPD filter */
>  	dc_resume(dm->dc);
>  =

> -	/* On resume we need to  rewrite the MSTM control bits to enamble MST*/
> -	s3_handle_mst(ddev, false);
> -
>  	/*
>  	 * early enable HPD Rx IRQ, should be done before set mode as short
>  	 * pulse interrupts are used for MST
>  	 */
>  	amdgpu_dm_irq_resume_early(adev);
>  =

> +	/* On resume we need to  rewrite the MSTM control bits to enamble MST*/

While we're here,

s/  / / && s/enamble/enable/ && s_*/_ */_

> +	s3_handle_mst(ddev, false);
> +
>  	/* Do detection*/
>  	drm_connector_list_iter_begin(ddev, &iter);
>  	drm_for_each_connector_iter(connector, &iter) {
> -- =

> 2.21.0
> =


-- =

Sean Paul, Software Engineer, Google / Chromium OS
_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
