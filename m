Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D9FE40FD5F
	for <lists+nouveau@lfdr.de>; Fri, 17 Sep 2021 17:56:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C9F56EDDB;
	Fri, 17 Sep 2021 15:56:55 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-qt1-x832.google.com (mail-qt1-x832.google.com
 [IPv6:2607:f8b0:4864:20::832])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A1FC6EE45
 for <nouveau@lists.freedesktop.org>; Fri, 17 Sep 2021 15:56:54 +0000 (UTC)
Received: by mail-qt1-x832.google.com with SMTP id w17so9101426qta.9
 for <nouveau@lists.freedesktop.org>; Fri, 17 Sep 2021 08:56:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=poorly.run; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=0sCoJcMzph8m7gHdWZKN3dp454V4z1+jmuXCQGYY1eU=;
 b=UX6GzuE3DTpJzHN/aIeG3aCWzhBV+fCkDtBgEsxVhOm3+8K8AyENBXdIjuOYPRQKxs
 CTuel8m/m8KvyUEtzzp6eSepsKHiz/6oQvR50EcDMCZsQ3D7ykraTZ1895PCkIJHaqP5
 sfVz/lJFm7SXIqu1gLW50masMo1/nUD/Q4NJaqleeYLk/IDnaaWJNf0YBugq8do4COrv
 tgciBCa4sJznbQ680HUkBOi8azZ7pZjDQk932tTjNeS8fwuKs1XZMUEsUQPyod+7kBIn
 PX4L5mBmBUGYZaIWPqPbQt+e/XskkfcMsuLlF5APW7WdqHZcqEAGziGAp2Q4K1+CChVa
 kfMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=0sCoJcMzph8m7gHdWZKN3dp454V4z1+jmuXCQGYY1eU=;
 b=B1L5HrkR5N4IfqRrmTdu0nc/a2rRyl6dxLqmqNWkZiy/5B8PmnXby9VDgwYxVmarnQ
 CTqiQOafQo2VItBcW0OzBR0oq0tq5uTlcKqt0zCdQWaeG+d28gzIQzoV3RGQMrsOGGtW
 0Y9jpfsrBn428LFLbFCMzq+QY1QzmeC53gKAymLaJBBPUi0NJ/x3OQ89lUTpOHLWt20t
 A3N+UpHxPGGtpPLtrv/3yXvpcPrbwxrQ5raxy5lzmPvIy4+JJwc5jApFRIeC42c46Xle
 YATVLW5AtWWNAJd7nmtypmmTdNO0lNoOxwaFMC6edW+QACWgXgJg7sn078JcET31nRnu
 2wGA==
X-Gm-Message-State: AOAM5334FHtIgcLmLJUkBrqeHJbakndyCzy408EztSwj5GB+u2PJwEa4
 iZS4Q5o/eV2e7ZQmYC7QB4+x4Q==
X-Google-Smtp-Source: ABdhPJy2rUDs6BeN9kdSRBI5w9E4e4qiGJ6kgMTqOz5qaJIsLmkzMmZBlXt+Y/EFA7itiDo5nxOSnA==
X-Received: by 2002:ac8:4a90:: with SMTP id l16mr5492592qtq.154.1631894213604; 
 Fri, 17 Sep 2021 08:56:53 -0700 (PDT)
Received: from localhost ([167.100.64.199])
 by smtp.gmail.com with ESMTPSA id a8sm4075889qtx.39.2021.09.17.08.56.53
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Fri, 17 Sep 2021 08:56:53 -0700 (PDT)
Date: Fri, 17 Sep 2021 11:56:52 -0400
From: Sean Paul <sean@poorly.run>
To: Fernando Ramos <greenfoo@u92.eu>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 sean@poorly.run, linux-doc@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
 linux-tegra@vger.kernel.org
Message-ID: <20210917155652.GP2515@art_vandelay>
References: <20210916211552.33490-1-greenfoo@u92.eu>
 <20210916211552.33490-16-greenfoo@u92.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210916211552.33490-16-greenfoo@u92.eu>
User-Agent: Mutt/1.9.4 (2018-02-28)
Subject: Re: [Nouveau] [PATCH 15/15] doc: drm: remove TODO entry regarding
 DRM_MODSET_LOCK_ALL cleanup
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

On Thu, Sep 16, 2021 at 11:15:52PM +0200, Fernando Ramos wrote:
> The previous commits do exactly what this entry in the TODO file asks
> for, thus we can remove it now as it is no longer applicable.

Thanks for doing this work!

Can we remove drm_modeset_lock_all[_ctx] now? If so, let's queue that up as part
of the set.


Reviewed-by: Sean Paul <sean@poorly.run>


> 
> Signed-off-by: Fernando Ramos <greenfoo@u92.eu>
> ---
>  Documentation/gpu/todo.rst                | 17 -----------------
>  Documentation/locking/ww-mutex-design.rst |  2 +-
>  2 files changed, 1 insertion(+), 18 deletions(-)
> 
> diff --git a/Documentation/gpu/todo.rst b/Documentation/gpu/todo.rst
> index 12e61869939e..6613543955e9 100644
> --- a/Documentation/gpu/todo.rst
> +++ b/Documentation/gpu/todo.rst
> @@ -353,23 +353,6 @@ converted, except for struct drm_driver.gem_prime_mmap.
>  
>  Level: Intermediate
>  
> -Use DRM_MODESET_LOCK_ALL_* helpers instead of boilerplate
> ----------------------------------------------------------
> -
> -For cases where drivers are attempting to grab the modeset locks with a local
> -acquire context. Replace the boilerplate code surrounding
> -drm_modeset_lock_all_ctx() with DRM_MODESET_LOCK_ALL_BEGIN() and
> -DRM_MODESET_LOCK_ALL_END() instead.
> -
> -This should also be done for all places where drm_modeset_lock_all() is still
> -used.
> -
> -As a reference, take a look at the conversions already completed in drm core.
> -
> -Contact: Sean Paul, respective driver maintainers
> -
> -Level: Starter
> -
>  Rename CMA helpers to DMA helpers
>  ---------------------------------
>  
> diff --git a/Documentation/locking/ww-mutex-design.rst b/Documentation/locking/ww-mutex-design.rst
> index 6a4d7319f8f0..6a8f8beb9ec4 100644
> --- a/Documentation/locking/ww-mutex-design.rst
> +++ b/Documentation/locking/ww-mutex-design.rst
> @@ -60,7 +60,7 @@ Concepts
>  Compared to normal mutexes two additional concepts/objects show up in the lock
>  interface for w/w mutexes:
>  
> -Acquire context: To ensure eventual forward progress it is important the a task
> +Acquire context: To ensure eventual forward progress it is important that a task
>  trying to acquire locks doesn't grab a new reservation id, but keeps the one it
>  acquired when starting the lock acquisition. This ticket is stored in the
>  acquire context. Furthermore the acquire context keeps track of debugging state
> -- 
> 2.33.0
> 

-- 
Sean Paul, Software Engineer, Google / Chromium OS
