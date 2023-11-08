Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C72CF7E523C
	for <lists+nouveau@lfdr.de>; Wed,  8 Nov 2023 09:56:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B8FD10E011;
	Wed,  8 Nov 2023 08:56:33 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [IPv6:2a00:1450:4864:20::532])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3045B10E011
 for <nouveau@lists.freedesktop.org>; Wed,  8 Nov 2023 08:56:31 +0000 (UTC)
Received: by mail-ed1-x532.google.com with SMTP id
 4fb4d7f45d1cf-5440f25dcc7so9031076a12.0
 for <nouveau@lists.freedesktop.org>; Wed, 08 Nov 2023 00:56:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1699433789; x=1700038589; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=zfjU5TAvyHgweR3dUGWdE1to54F6J/8WlhXyLcPRY9U=;
 b=lo7myQoe/OF0jfUoOH6GAWHKAwLMu8gxZ7yp85PucYMhZeEVR21W1oMtr76jxZFNiy
 kgpv5lCZDQknF2a5Ri63s4mEA4/ydJY67o7IhwfJvf+QdyIfqr5m6j/YTiyc/S0d1cNx
 7fO83JmTXkOTh0pFJkiUl4I31BrkP9MXGie2bY+etCB+paaa3+bOvNyJO1691FqL1b9Q
 BsSo4H0xqAgLKbqi/CBUIrsiqbmlAK7qyscy7OLgYtmZyi9n8S1Jl09T1PVhvKORmgyM
 Ep06e/wIbSk6WUJeMtHnqOdqOZWDNd7+OIn9i0WjBzXY/J56nwwYkyapAiu6RejCN85y
 Bk3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699433789; x=1700038589;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=zfjU5TAvyHgweR3dUGWdE1to54F6J/8WlhXyLcPRY9U=;
 b=TqB4TvM/74uJFOlH3izEF1scUYgVRjoCW3faeDYTY5R3N4ItqAmQkVCwzbu3AKstS9
 rJB8NPLsKXvwT2iAwopQS6tbzdVHRtKknFWMT+vda784faSrLOrWKD7qRmOowotr6FQo
 6eb2oExL/jIN7ajxl6tDXFtzXP4iDt63wguDzfuebT/xpsVkkC2LYz17Enh5S2B8p+pf
 jVwcjx+Nveiof485J6i8+k51w9586BsCOmms8wsFsT7vD5sLbIyVUyOWG7fljcY5hK+c
 BxPa5zmvhwEGhymUTLunWGWd2bkLnNd8gP0H3YIBayrjGWY+VCjzhoCeVC3LyZdYTPL9
 K77w==
X-Gm-Message-State: AOJu0Yxymw2DQq/uQsTOJViZG1BQKbSaMrYuJmjuhC41drgw0kk6xuj2
 pKpsU++9beBkt/G4x9xozHqHiKfJZX77dhJ60jUun0Za
X-Google-Smtp-Source: AGHT+IHCQcNdXoxODm5bZULUZVdJvhG4o765C5aNzjFS5T1qN81mBAE2/LL8iaj2PpO5TNJA9v49Nw==
X-Received: by 2002:a17:906:dc92:b0:9ae:420e:739b with SMTP id
 cs18-20020a170906dc9200b009ae420e739bmr667811ejc.46.1699433789546; 
 Wed, 08 Nov 2023 00:56:29 -0800 (PST)
Received: from localhost ([102.36.222.112]) by smtp.gmail.com with ESMTPSA id
 lc25-20020a170906dff900b009dd7bc622fbsm706062ejc.113.2023.11.08.00.56.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Nov 2023 00:56:28 -0800 (PST)
Date: Wed, 8 Nov 2023 11:56:26 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Danilo Krummrich <me@dakr.org>
Message-ID: <8731c4c1-d90d-41e0-8659-aa0c5c86b322@kadam.mountain>
References: <3554c52a-d500-4c8e-913f-c2a32a1f7a4d@moroto.mountain>
 <a5f0d138-413d-4a21-876a-c51b89caaca2@dakr.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a5f0d138-413d-4a21-876a-c51b89caaca2@dakr.org>
Subject: Re: [Nouveau] [bug report] drm/nouveau/gsp/r535: add support for
 booting GSP-RM
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
Cc: nouveau@lists.freedesktop.org
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

On Tue, Nov 07, 2023 at 08:00:23PM +0100, Danilo Krummrich wrote:
> On 11/7/23 15:34, Dan Carpenter wrote:
> > Hello Ben Skeggs,
> > 
> > The patch 176fdcbddfd2: "drm/nouveau/gsp/r535: add support for
> > booting GSP-RM" from Sep 19, 2023 (linux-next), leads to the
> > following Smatch static checker warning:
> > 
> > 	drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c:1016 r535_gsp_rpc_unloading_guest_driver()
> > 	warn: 'rpc' isn't an ERR_PTR
> > 
> > drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c
> >      1010 static int
> >      1011 r535_gsp_rpc_unloading_guest_driver(struct nvkm_gsp *gsp, bool suspend)
> >      1012 {
> >      1013         rpc_unloading_guest_driver_v1F_07 *rpc;
> >      1014
> >      1015         rpc = nvkm_gsp_rpc_get(gsp, NV_VGPU_MSG_FUNCTION_UNLOADING_GUEST_DRIVER, sizeof(*rpc));
> > 
> > nvkm_gsp_rpc_get() returns NULL on error.
> 
> There are also code paths where it can return an ERR_PTR. I think we
> need to check for IS_ERR_OR_NULL()...

When a function returns a mix of error pointers and NULL then generally
NULL means the feature is deliberately disabled.

int blink_leds(void)
{
	leds = get_leds();
	if (IS_ERR(leds)) {
		printk("warning!  LEDS are malfunctioning!\n");
		return PTR_ERR(leds);
	}
	if (!leds)
		return 0;  // <-- do nothing.  success!
	return leds->blink();
}

Normally, it's obvious from the context what the NULL means, but if not
it should be commented, "search_foo() returns error pointers if we had
an allocation error doing the search, NULL means the object wasn't
found, otherwise return a pointer to foo".

I have written a blog on this:
https://staticthinking.wordpress.com/2022/08/01/mixing-error-pointers-and-null/

There are a few places in the kernel where it's like "NULL is a bug, but
we just work around it.  Like we have 50 drivers, and you know some of
those guys are going to mess up, so let's just check for both."  We
have a similar check for EPROBE_DEFER where both negative and positive
values are treated the same even though negative error codes are
correct.  Another place where bugs are probably going to happen is when
we change the function from returning NULL to returning error pointers.
"People are going to do back ports and they're going to mess up so we
know we're going to introduce bugs.  Let's just work around it."

But generally it's better to fix the bugs instead of working around it.

Here it looks like we are just doing a random mix of error pointers and
NULL.

So let's take a look at this bug:
    drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c:926
    r535_gsp_rpc_get_gsp_static_info() warn: 'rpc' can also be NULL

nvkm_gsp_rpc_rd() returns a mix.
nvkm_gsp_rpc_push() (r535_gsp_rpc_push()) returns a mix.
r535_gsp_rpc_send() returns a mix.
r535_gsp_msg_recv() returns a mix.

What does the NULL mean?  It needs to be commented.  If it's just bug
work-arounds then they should be done properly.

	if (IS_ERR_OR_NULL(p))
		return p ? ERR_CAST(p): -EIO;

regards,
dan carpenter

