Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A7951FF66B
	for <lists+nouveau@lfdr.de>; Thu, 18 Jun 2020 17:18:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B27EA6EB4D;
	Thu, 18 Jun 2020 15:18:32 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [207.211.31.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 806166EB40
 for <nouveau@lists.freedesktop.org>; Thu, 18 Jun 2020 15:18:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1592493510;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rQYmuQ6MgsURSBqJgRafWuUZH2kgHeoFm2q5Vrdf7kM=;
 b=V+OrRKM0fAX5wBvC9GSolRA0oS8Frr8GVadEOw5//oMSmyX/dx/BlVfJbLbORrfHzNTqvT
 nh0N6Cm1TAmWjZYYgPu8oTsBQPESbKewPyEmxrMKYRWhkN9PuGrkxHNmJ4NJVaZ2/INSrb
 DJR/WkDG9aF9zlatEUZJEkBSHbjucvY=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-403-dDlqq3pBONCbjesFsCi3XA-1; Thu, 18 Jun 2020 11:18:28 -0400
X-MC-Unique: dDlqq3pBONCbjesFsCi3XA-1
Received: by mail-qk1-f198.google.com with SMTP id w14so4744721qkb.0
 for <nouveau@lists.freedesktop.org>; Thu, 18 Jun 2020 08:18:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:reply-to:to:cc:date
 :in-reply-to:references:organization:user-agent:mime-version
 :content-transfer-encoding;
 bh=rQYmuQ6MgsURSBqJgRafWuUZH2kgHeoFm2q5Vrdf7kM=;
 b=iAAa3C8Zu6v+vYxBvQ+umTd1DbYZbkfSANkCVYTZZ1qOZB/SQmfA8Ozj2ohDZyxjkA
 nUqN4Qu5pr/Q/nZcuW3rOkwYrw+MylBWFRbW0HZpL6Lpar6R0qpuaQRcmojIVF/FIH83
 Q+ZVNf3OQjydf0iaoDQpe3ZBNfg7eNArC88XzucKH3b2uKWTUMc27Lr3Hzku2r1ZQAKA
 ug5OQ5bvSCPNkkGW06YijmysmPsGxCxD1RtwyOs7Sq/bGt9ePzTnbqeceeo4DTiuimLY
 dCan8lyWB/kSe1bfZK/EStstzXjDdJ9PmPtAdUQQkJjexWDiq9+SWYJxCcWMAeTGgwoE
 0qEw==
X-Gm-Message-State: AOAM531YAYWjHV0fa/jGRo6mKHS+TOGSf+wkWQXYEWk4I7Z//TUQWyFT
 6cnEXOGgPNcQ7wVma2yRVtX6ztKf7dcGOHf0wn3eW94Y6gZS0oaCsFlPIHqnZYFZGeJ8LVUT+nD
 umoR2+CWsYbgO809cSaGzj03UsA==
X-Received: by 2002:ac8:23fb:: with SMTP id r56mr4946251qtr.197.1592493508007; 
 Thu, 18 Jun 2020 08:18:28 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyLgX4Z87MobK3H78vsTvXLd+/eu1CkxpTofEBBUyoXsAsemLOYYh7GV5x0KAA4BnDYUAMf5w==
X-Received: by 2002:ac8:23fb:: with SMTP id r56mr4946222qtr.197.1592493507790; 
 Thu, 18 Jun 2020 08:18:27 -0700 (PDT)
Received: from Whitewolf.lyude.net
 (static-173-76-190-23.bstnma.ftas.verizon.net. [173.76.190.23])
 by smtp.gmail.com with ESMTPSA id c2sm3131786qkl.58.2020.06.18.08.18.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 18 Jun 2020 08:18:26 -0700 (PDT)
Message-ID: <0b1c1a07b6589e91701a1815400a56b66c5f480d.camel@redhat.com>
From: Lyude Paul <lyude@redhat.com>
To: Aditya Pakki <pakki001@umn.edu>
Date: Thu, 18 Jun 2020 11:18:25 -0400
In-Reply-To: <20200614012920.121567-1-pakki001@umn.edu>
References: <20200614012920.121567-1-pakki001@umn.edu>
Organization: Red Hat
User-Agent: Evolution 3.36.2 (3.36.2-1.fc32)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Subject: Re: [Nouveau] [PATCH] drm/noveau: fix reference count leak in
 nv50_disp_atomic_commit
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
Reply-To: lyude@redhat.com
Cc: wu000273@umn.edu, David Airlie <airlied@linux.ie>,
 Pankaj Bharadiya <pankaj.laxminarayan.bharadiya@intel.com>, kjlu@umn.edu,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Takashi Iwai <tiwai@suse.de>, Ben Skeggs <bskeggs@redhat.com>,
 Daniel Vetter <daniel@ffwll.ch>, nouveau@lists.freedesktop.org,
 Alex Deucher <alexander.deucher@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

On Sat, 2020-06-13 at 20:29 -0500, Aditya Pakki wrote:
> nv50_disp_atomic_commit() calls calls pm_runtime_get_sync and in turn
> increments the reference count. In case of failure, decrement the
> ref count before returning the error.
> 
> Signed-off-by: Aditya Pakki <pakki001@umn.edu>
> ---
>  drivers/gpu/drm/nouveau/dispnv50/disp.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/nouveau/dispnv50/disp.c
> b/drivers/gpu/drm/nouveau/dispnv50/disp.c
> index d472942102f5..b4039907f0d6 100644
> --- a/drivers/gpu/drm/nouveau/dispnv50/disp.c
> +++ b/drivers/gpu/drm/nouveau/dispnv50/disp.c
> @@ -2157,8 +2157,10 @@ nv50_disp_atomic_commit(struct drm_device *dev,
>  	int ret, i;
>  
>  	ret = pm_runtime_get_sync(dev->dev);
> -	if (ret < 0 && ret != -EACCES)
> +	if (ret < 0 && ret != -EACCES) {
> +		pm_runtime_put_autosuspend(dev->dev);

s/noveau/nouveau/ in the commit title, but other than that:

Reviewed-by: Lyude Paul <lyude@redhat.com>

>  		return ret;
> +	}
>  
>  	ret = drm_atomic_helper_setup_commit(state, nonblock);
>  	if (ret)

_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
