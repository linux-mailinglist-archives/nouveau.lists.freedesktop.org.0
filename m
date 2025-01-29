Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 05C19A2221B
	for <lists+nouveau@lfdr.de>; Wed, 29 Jan 2025 17:50:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5326F10E83A;
	Wed, 29 Jan 2025 16:50:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="MDUsDLdO";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B183D10E844
 for <nouveau@lists.freedesktop.org>; Wed, 29 Jan 2025 16:50:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1738169410;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kIR36ENGU60LuFgFJsbN3iw30GtNfjYTyr8Iv66sXWE=;
 b=MDUsDLdOgH/YKWkqNVDnar0yUbfHzgYa8qjRt1QIZn7CzFowPTkkPZLWCb/gyfV2BzlUGb
 GNnzikvrQO1hzkSgvGqq9tLbBM2YswEPi+x+qZD3rm1lbqkq4BqDvTLWli8WXBxRDCH7QQ
 FaSvVKlS5iI5h3zC/meXZWtH5VUCAtg=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-573-4WHIdnSqNniy8JX2EyM9VQ-1; Wed, 29 Jan 2025 11:50:07 -0500
X-MC-Unique: 4WHIdnSqNniy8JX2EyM9VQ-1
X-Mimecast-MFC-AGG-ID: 4WHIdnSqNniy8JX2EyM9VQ
Received: by mail-wr1-f70.google.com with SMTP id
 ffacd0b85a97d-385e00ebb16so2476520f8f.3
 for <nouveau@lists.freedesktop.org>; Wed, 29 Jan 2025 08:50:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738169406; x=1738774206;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=kIR36ENGU60LuFgFJsbN3iw30GtNfjYTyr8Iv66sXWE=;
 b=TQp74T2vhKXdK5F2gjERUCh4YT1zybVKZX3NTbvSBRAWtWW8Pl3fNYwfGBLXtvw9FZ
 K+wop3NCl4b6A4Tk5u52E4vntCco6/2V8A8IPtJ245A5WAOot9CNBJWzbzLUjLytwPqj
 8SYj2RBDBYCkyM9X/ga6qbLw0jfKLPgot9GPr8pgQyu9nyn9uU83M3Y70miOB6PhvVWc
 3Jf7fVtVX2eI0BzIaTv1TVvcIlMbl7MfIYAP8OqZSF5Rj0GVDwPMl7/hKchbc14URVyq
 P5yW5lX22ldUQ6IvoC8D9K7SjOL0StNS87DgAQQ7lX8RbvG7dSZ5GosuNtjxVNCsycYV
 uUSA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUscM7NOlWA+7RlQ7t3mHf5gJw1GYgGuVn3oswRwN1LGyzXBYX/AE2Rxs2Ll92Tu3FjCiTBX6NH@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyGHdDGIrLixUGUA2SIwH9d3TOCs36cv3coAQnTRuE9TSv5v1i2
 BrU5SjZFDd+lnoLKG3oSEoYscX8NTMnCQwpfuUzXycXHysQqRh7+FwIQaUE7eglVYcn+44Mmi0L
 vM7TSSKfZO7wqVcVQ79Kb4F2Rl0+nUQYC9i4v8p9FiBTOM8yuddBlNgg6s508760=
X-Gm-Gg: ASbGnctkOiuCjTNml0mQdmf9CD2FgNk5vNNxuWho3FZ1OTrINbEA09LazTOl8j7s+8O
 SlbMjaz5UCbpjJzePW1Dp3bD3Atilm3pIiU9FGU1UE3aqX74bja4H52yk9mLOpRsjENdpPlHCBz
 PndbeRqMD/v3JwU3YItMtewsgWZwBnvge6CdIj4fZ/NMPclu6eRwbdiuzNhWV5nwJrWaZUH8V0q
 VfJMjOBFoq3Z9kf+X+N9mp6uKp5j5SnlEzHpEY/J2r+fLM+FaGU0cfMMZnXDtQRi2DCVA==
X-Received: by 2002:a5d:4385:0:b0:38a:888c:6786 with SMTP id
 ffacd0b85a97d-38c520babf7mr2389819f8f.52.1738169406361; 
 Wed, 29 Jan 2025 08:50:06 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGzyZbfNeHEEqdBP/FPbqU2nUqTbUVUE0bCsa9+XfxoWf8z7EMd5vNIfqC9EBVK6faAB4GzCg==
X-Received: by 2002:a5d:4385:0:b0:38a:888c:6786 with SMTP id
 ffacd0b85a97d-38c520babf7mr2389769f8f.52.1738169405919; 
 Wed, 29 Jan 2025 08:50:05 -0800 (PST)
Received: from pollux ([2a00:79c0:60c:5a00:abf:b8ff:feee:998b])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38c2a188673sm17194930f8f.46.2025.01.29.08.50.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 Jan 2025 08:50:05 -0800 (PST)
Date: Wed, 29 Jan 2025 17:50:02 +0100
From: Danilo Krummrich <dakr@redhat.com>
To: phasta@kernel.org
Cc: Alex Deucher <alexander.deucher@amd.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 Xinhui Pan <Xinhui.Pan@amd.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Lucas Stach <l.stach@pengutronix.de>,
 Russell King <linux+etnaviv@armlinux.org.uk>,
 Christian Gmeiner <christian.gmeiner@gmail.com>,
 Frank Binns <frank.binns@imgtec.com>, Matt Coster <matt.coster@imgtec.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Qiang Yu <yuq825@gmail.com>, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>, Konrad Dybcio <konradybcio@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Karol Herbst <kherbst@redhat.com>, Lyude Paul <lyude@redhat.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Rob Herring <robh@kernel.org>, Steven Price <steven.price@arm.com>,
 Liviu Dudau <liviu.dudau@arm.com>, Matthew Brost <matthew.brost@intel.com>,
 Melissa Wen <mwen@igalia.com>,
 =?iso-8859-1?Q?Ma=EDra?= Canal <mcanal@igalia.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Sunil Khatri <sunil.khatri@amd.com>,
 Lijo Lazar <lijo.lazar@amd.com>, Hawking Zhang <Hawking.Zhang@amd.com>,
 Mario Limonciello <mario.limonciello@amd.com>,
 Ma Jun <Jun.Ma2@amd.com>, Yunxiang Li <Yunxiang.Li@amd.com>,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, etnaviv@lists.freedesktop.org,
 lima@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org
Subject: Re: [PATCH v2] drm/sched: Use struct for drm_sched_init() params
Message-ID: <Z5pcOt3oiwnp4lbJ@pollux>
References: <20250128142927.103290-2-phasta@kernel.org>
 <Z5jwD0DxNrMdo-q8@pollux>
 <1a22f1bb0145996cb1159cf3cb8156aec3d5c640.camel@mailbox.org>
MIME-Version: 1.0
In-Reply-To: <1a22f1bb0145996cb1159cf3cb8156aec3d5c640.camel@mailbox.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: atNA442NB8aTpwgBV57ulC96m63g8iaOGXJpF6VQ_ik_1738169406
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
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

On Wed, Jan 29, 2025 at 04:18:30PM +0100, Philipp Stanner wrote:
> On Tue, 2025-01-28 at 15:56 +0100, Danilo Krummrich wrote:
> > On Tue, Jan 28, 2025 at 03:29:27PM +0100, Philipp Stanner wrote:
> > > diff --git a/drivers/gpu/drm/nouveau/nouveau_sched.c
> > > b/drivers/gpu/drm/nouveau/nouveau_sched.c
> > > index 4412f2711fb5..b5aac8eebfdd 100644
> > > --- a/drivers/gpu/drm/nouveau/nouveau_sched.c
> > > +++ b/drivers/gpu/drm/nouveau/nouveau_sched.c
> > > @@ -404,7 +404,15 @@ nouveau_sched_init(struct nouveau_sched
> > > *sched, struct nouveau_drm *drm,
> > >  {
> > >  	struct drm_gpu_scheduler *drm_sched = &sched->base;
> > >  	struct drm_sched_entity *entity = &sched->entity;
> > > -	const long timeout =
> > > msecs_to_jiffies(NOUVEAU_SCHED_JOB_TIMEOUT_MS);
> > > +	const struct drm_sched_init_args args = {
> > > +		.ops = &nouveau_sched_ops,
> > > +		.submit_wq = wq,
> > > +		.num_rqs = DRM_SCHED_PRIORITY_COUNT,
> > > +		.credit_limit = credit_limit,
> > > +		.timeout =
> > > msecs_to_jiffies(NOUVEAU_SCHED_JOB_TIMEOUT_MS),
> > > +		.name = "nouveau_sched",
> > > +		.dev = drm->dev->dev
> > > +	};
> > >  	int ret;
> > >  
> > >  	if (!wq) {
> > > @@ -416,10 +424,7 @@ nouveau_sched_init(struct nouveau_sched
> > > *sched, struct nouveau_drm *drm,
> > >  		sched->wq = wq;
> 
> Do you want it set here 
> 
> args.submit_wq = wq;
> 
> or below, outside the if-block? Should be the same AFAICS

Yeah, shouldn't make a difference. Personally, I'd prefer to set it once after
the if-block.

> 
> 
> > 
> > This change breaks Nouveau, you need to set args.submit_wq here as
> > well.
> 
> I overlooked the allocation below.
> 
> 
> P.
> 
> > 
> > >  	}
> > >  
> > > -	ret = drm_sched_init(drm_sched, &nouveau_sched_ops, wq,
> > > -			     NOUVEAU_SCHED_PRIORITY_COUNT,
> > > -			     credit_limit, 0, timeout,
> > > -			     NULL, NULL, "nouveau_sched", drm-
> > > >dev->dev);
> > > +	ret = drm_sched_init(drm_sched, &args);
> > >  	if (ret)
> > >  		goto fail_wq;
> > >  

