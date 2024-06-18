Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B526390DADB
	for <lists+nouveau@lfdr.de>; Tue, 18 Jun 2024 19:43:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 37E1710E755;
	Tue, 18 Jun 2024 17:43:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="Oz/XvZ3a";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com
 [209.85.167.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 206E310E767
 for <nouveau@lists.freedesktop.org>; Tue, 18 Jun 2024 17:43:35 +0000 (UTC)
Received: by mail-lf1-f51.google.com with SMTP id
 2adb3069b0e04-52c82101407so9566506e87.3
 for <nouveau@lists.freedesktop.org>; Tue, 18 Jun 2024 10:43:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1718732613; x=1719337413; darn=lists.freedesktop.org;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=UW3m3IVDCbgoGWkqOyhGrTXzXIbL2Q1j7KVjTgGLhLg=;
 b=Oz/XvZ3aaLhCHtRh2L0NhJI6Fpt/TcNB7jvIaDZWEg/r9T5kSCJapISHcIZ2YYiYXN
 hqt6AB7gyyO5BdGCZgDKlrEdcpMOUosJQXTFefWpXN9a/JnnaCoNmnWvyKVxnDyfbOCN
 cCu8s+JJz4lMx641EnJbQaqnrIFkV0KApsNnFwCStakEVMAxU760Sdr7NNzjhHza0eKZ
 00CFP/u0c4jf0F90VpzLLLiReOCoBSRsOgapXTJgt9de6tGq6KXvzgmiNvmSqWOUyo/C
 1xy4Rk4lgqhMXHridyY6FcrzBqXdv4Ll2PPNecLe8hBuSIMwFMSIFtrB2P2ltRc0uo1p
 IBZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718732613; x=1719337413;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=UW3m3IVDCbgoGWkqOyhGrTXzXIbL2Q1j7KVjTgGLhLg=;
 b=a6dEJXAH0gQqJ52mkxBH9BXRQd7EiUVuaiM61UkV2faXvGp7tFhz28xZv+0++emdox
 IY3nj5vU/nggM6iM8CMhOY/sdfZqFoObMm474ngkFTpjZwb7hUUiVnKya0ob/gH9VgUA
 Dy7erdHVNzMMRSIjm/H+jNJbpSgjGd3blmFjU/WYpYX2hePFNiXKx5P+EC+NWOy/d0Nc
 zDjjiU573HLgbWUBnpe9oec9K7/RQYq5tEvo6OOnvv8QP3vj7vtp9Isib3nfyKkjUha2
 IOR/wE6zAGrvyA7WYsMzAaVfisAlEpL3nm6/z1aCUyR16YR7gAjeaLHUAoz6T/3zSXsB
 qSfA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWydKkO9zmYfez7aOX1H1/8g0qp2qlgeJF//bON/p8mevzSkZDoEaLc7jGr2PPJ3Rdy0Q1Tv0tprLil8/T6AphHfs2mXpv11fV46SlOBg==
X-Gm-Message-State: AOJu0Yy9y2ka8nDO6SHHlZu5Hb39fiKpCs/F7EBN3RLW4PLtiq/pmTZd
 IOF4MjeQ/WoATO0kwOs3c6zG44OwA0yEcB1yTTb592gg5UMc6qBhGKTw/PzFx7A=
X-Google-Smtp-Source: AGHT+IHqgDsYBrSMyIeMIZAipBnP2CCm4mOxj6zvMMUSinXZl5+Bwzr+RzB97A5TqXTmpBeosa9Onw==
X-Received: by 2002:ac2:59db:0:b0:51d:9f10:71b7 with SMTP id
 2adb3069b0e04-52ccaa33e25mr244374e87.28.1718732611978; 
 Tue, 18 Jun 2024 10:43:31 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (dzdbxzyyyyyyyyyyybrhy-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-52ca2884064sm1619765e87.242.2024.06.18.10.43.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Jun 2024 10:43:31 -0700 (PDT)
Date: Tue, 18 Jun 2024 20:43:29 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: =?utf-8?B?QW5kcsOp?= Almeida <andrealmeid@igalia.com>
Cc: Jani Nikula <jani.nikula@linux.intel.com>, 
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, nouveau@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, 
 kernel-dev@igalia.com, Melissa Wen <mwen@igalia.com>, alexander.deucher@amd.com,
 christian.koenig@amd.com, Simon Ser <contact@emersion.fr>, 
 Pekka Paalanen <ppaalanen@gmail.com>, daniel@ffwll.ch,
 Daniel Stone <daniel@fooishbar.org>, 
 Marek =?utf-8?B?T2zFocOhaw==?= <maraeo@gmail.com>,
 Dave Airlie <airlied@gmail.com>, ville.syrjala@linux.intel.com, 
 Xaver Hugl <xaver.hugl@gmail.com>, Joshua Ashton <joshua@froggi.es>, 
 Michel =?utf-8?Q?D=C3=A4nzer?= <michel.daenzer@mailbox.org>,
 Sam Ravnborg <sam@ravnborg.org>, Boris Brezillon <bbrezillon@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Claudiu Beznea <claudiu.beznea@tuxon.dev>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, 
 Karol Herbst <kherbst@redhat.com>, Lyude Paul <lyude@redhat.com>
Subject: Re: [PATCH v7 2/9] drm: Support per-plane async flip configuration
Message-ID: <aflfggx2dc2p3y2a76yecjgmahozmbpnkk2qpekrnkpvviih6i@g2uuxeubozbo>
References: <20240618030024.500532-1-andrealmeid@igalia.com>
 <20240618030024.500532-3-andrealmeid@igalia.com>
 <878qz2h9pp.fsf@intel.com>
 <CAA8EJpqM4iaG3PKM5c0Op7Y7c1SRDrOCk_oOnwG8YfdCxC8w6g@mail.gmail.com>
 <fc67b552-6f61-4f30-9e34-dd6b2364d155@igalia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <fc67b552-6f61-4f30-9e34-dd6b2364d155@igalia.com>
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

On Tue, Jun 18, 2024 at 01:18:10PM GMT, André Almeida wrote:
> Em 18/06/2024 07:07, Dmitry Baryshkov escreveu:
> > On Tue, 18 Jun 2024 at 12:38, Jani Nikula <jani.nikula@linux.intel.com> wrote:
> > > 
> > > On Tue, 18 Jun 2024, André Almeida <andrealmeid@igalia.com> wrote:
> > > > Drivers have different capabilities on what plane types they can or
> > > > cannot perform async flips. Create a plane::async_flip field so each
> > > > driver can choose which planes they allow doing async flips.
> > > > 
> > > > Signed-off-by: André Almeida <andrealmeid@igalia.com>
> > > > ---
> > > >   include/drm/drm_plane.h | 5 +++++
> > > >   1 file changed, 5 insertions(+)
> > > > 
> > > > diff --git a/include/drm/drm_plane.h b/include/drm/drm_plane.h
> > > > index 9507542121fa..0bebc72af5c3 100644
> > > > --- a/include/drm/drm_plane.h
> > > > +++ b/include/drm/drm_plane.h
> > > > @@ -786,6 +786,11 @@ struct drm_plane {
> > > >         * @kmsg_panic: Used to register a panic notifier for this plane
> > > >         */
> > > >        struct kmsg_dumper kmsg_panic;
> > > > +
> > > > +     /**
> > > > +      * @async_flip: indicates if a plane can do async flips
> > > > +      */
> > > 
> > > When is it okay to set or change the value of this member?
> > > 
> > > If you don't document it, people will find creative uses for this.
> > 
> > Maybe it's better to have a callback instead of a static field? This
> > way it becomes clear that it's only relevant at the time of the
> > atomic_check().
> > 
> 
> So we would have something like bool (*async_flip) for struct
> drm_plane_funcs I suppose. Then each driver will implement this function and
> check on runtime if it should flip or not, right?
> 
> I agree that it makes more clear, but as far as I can see this is not
> something that is subject to being changed at runtime at all, so it seems a
> bit overkill to me to encapsulate a static information like that. I prefer
> to improve the documentation on the struct member to see if this solves the
> problem. What do you think of the following comment:

It looks like I keep on mixing async_flips as handled via the
DRM_MODE_PAGE_FLIP_ASYNC and the plane flips that are governed by
.atomic_async_check / .atomic_async_update / drm_atomic_helper_check()
and which end up being used just for legacy cursor updates.

So, yes, those are two different code paths, but with your changes I
think it becomes even easier to get confused between
atomic_async_check() and .async_flip member.


> /**
>  * @async_flip: indicates if a plane can perform async flips. The
>  * driver should set this true only for planes that the hardware
>  * supports flipping asynchronously. It may not be changed during
>  * runtime. This field is checked inside drm_mode_atomic_ioctl() to
>  * allow only the correct planes to go with DRM_MODE_PAGE_FLIP_ASYNC.
>  */

-- 
With best wishes
Dmitry
