Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 38EC7A12614
	for <lists+nouveau@lfdr.de>; Wed, 15 Jan 2025 15:34:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E067D10E701;
	Wed, 15 Jan 2025 14:34:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=fooishbar.org header.i=@fooishbar.org header.b="O4g749Sj";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-qv1-xf36.google.com (mail-qv1-xf36.google.com
 [IPv6:2607:f8b0:4864:20::f36])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D4D9A10E707
 for <nouveau@lists.freedesktop.org>; Wed, 15 Jan 2025 14:34:38 +0000 (UTC)
Received: by mail-qv1-xf36.google.com with SMTP id
 6a1803df08f44-6d89a727a19so9128706d6.0
 for <nouveau@lists.freedesktop.org>; Wed, 15 Jan 2025 06:34:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fooishbar.org; s=google; t=1736951678; x=1737556478;
 darn=lists.freedesktop.org; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=wgpCbUXuk0fjx7PlpFBa3YSbnvvXmj+DNx/eEdB8F5M=;
 b=O4g749SjtyerKr7EPw+zPQwu+AILrPNMVGq7ELv6hUdJVx4deOL31ateAd+NMM6mIK
 t0VtPk5B7weSxoVj0mU/TGaUwUTVS3myRwT/YQAr1QLPfA0hF7FDQjmUxM9sC3n4LR3k
 x2II4LCVVCXNjjV++vThZyIx9hANm3H6lHHLQ9yXIBCpMChZ8+kPROx+PmtQCatgSUba
 1Dtae+GgmC31y0M4GEvNTguvjBLlJON/+GHeCp21AVCoQsGGBlA3YWHgaoJ8BPm8eAE0
 LIHC74D0vq7YyEgw2P+kT+7WhCvX4D1vDDXBCxc0RiQs02oosInt+qchgm+IAN8+zkV8
 jJfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736951678; x=1737556478;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=wgpCbUXuk0fjx7PlpFBa3YSbnvvXmj+DNx/eEdB8F5M=;
 b=CfsK/z1rC2bVWep3FBcSOt85aY6hssunMWux15Y3A9gVhckWDw5TeDsOb3RTcPRih0
 qdnDi1I1j/4HMA8wyQT3iYtPr9sRHrghKBX+MlVSOSXDfaDvmw3RgcVnPMUpHtaZFzXb
 fA3fVQwYnzqRg3bDHwVE0sQVRaN5Tg7LUTZZvd7Q/SWi8ZzAUuNXCnLKWFJZ41p8Crd5
 niMNmMMlVxJ+IYSWhu73pZnUJpR4kpnLtCHObHf7mOmE90X7sOkWzCJ/KG68LJMkWspy
 kfS49JNQlfDZx8StZLmZXprV33hDAO6ylhuBQKUajVHChvZ6RzkpAJRiywR576IWuHji
 wWPw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXwzLD6/4obaCHwU+DeFkeI6Q40z360eIst0o/dgEuUbIoY3ZMQlMIPjXtgTPeM34sL+WsQfXgR@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxJxqjkLLsiMw7k+qrHM3+k4wJ4n1WE0KtC/+hkUvK157//yp6m
 W5xcBuqYtw/NcgMOSzw3WuLcI/QALBcKREfNNFGztXb0Bh+jqDWSBWtTFZE7T5xD2Fjj1pK9i6G
 v1ltMSGtS8tNqWAGpxRTFdyiseyX7wv1lP1If/g==
X-Gm-Gg: ASbGncvDR+eAvaR2odfrSGnSRA5Qy0sOI5oTwPen2AJpBFsE8w++iMDiebhjg0XKI4Y
 J3U6EUqGZPZgIec2Tfdt32gOTEjqKA9e9RFs=
X-Google-Smtp-Source: AGHT+IFPz9fbMcvhhyZZGYYuWLUwXCRTy8s+kBCbi69J2hIRU1+TB7begqOpM0+xy1s6GqB+nx1X6ZJAR0totDSXOwo=
X-Received: by 2002:a05:6214:486:b0:6d8:e7c9:ffa0 with SMTP id
 6a1803df08f44-6e192c73ef5mr43851476d6.19.1736951677902; Wed, 15 Jan 2025
 06:34:37 -0800 (PST)
MIME-Version: 1.0
References: <20250109150310.219442-1-tzimmermann@suse.de>
 <20250109150310.219442-26-tzimmermann@suse.de>
 <cdbe483d-0895-47aa-8c83-1c28220f4a02@ideasonboard.com>
 <bc97b92e-7f8a-4b92-af8a-20fa165ead55@suse.de>
 <f3ba05c7-6e49-4641-a3f9-ba418ebdb7c3@ideasonboard.com>
 <c6735280-7c32-4319-8ca9-a7305d8117c3@suse.de>
 <d67adb03-5cd0-4ac9-af58-cf4446dacee3@ideasonboard.com>
 <0ea6be58-0e04-4172-87cd-064a3e4a43bc@suse.de>
 <f35cb350-6be9-48ca-ad7e-e9dd418281d5@ideasonboard.com>
 <4af0b6a7-c16a-4187-bbf5-365a9c86de21@suse.de>
 <e327ad84-b5c9-4480-b873-dc3aca605538@ideasonboard.com>
In-Reply-To: <e327ad84-b5c9-4480-b873-dc3aca605538@ideasonboard.com>
From: Daniel Stone <daniel@fooishbar.org>
Date: Wed, 15 Jan 2025 14:34:26 +0000
X-Gm-Features: AbW1kvZOqZIfsgr5MQqIuf1jKNJtcUmkb-2ddanRpBEhDxEw_Wl931RGN2rzkA8
Message-ID: <CAPj87rOn=RQ615zyaEdFT2ADfPztU7+heVi0G34Rdg-=QO1cCw@mail.gmail.com>
Subject: Re: [PATCH v2 25/25] drm/xlnx: Compute dumb-buffer sizes with
 drm_mode_size_dumb()
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc: Thomas Zimmermann <tzimmermann@suse.de>, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, airlied@gmail.com, simona@ffwll.ch, 
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org, 
 freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org, 
 imx@lists.linux.dev, linux-samsung-soc@vger.kernel.org, 
 nouveau@lists.freedesktop.org, virtualization@lists.linux.dev, 
 spice-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org, 
 linux-rockchip@lists.infradead.org, linux-tegra@vger.kernel.org, 
 intel-xe@lists.freedesktop.org, xen-devel@lists.xenproject.org, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Andy Yan <andyshrk@163.com>
Content-Type: text/plain; charset="UTF-8"
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

On Wed, 15 Jan 2025 at 14:20, Tomi Valkeinen
<tomi.valkeinen@ideasonboard.com> wrote:
> No disagreement there, we need CREATE_DUMB2.
>
> My point is that we have the current UAPI, and we have userspace using
> it, but we don't have clear rules what the ioctl does with specific
> parameters, and we don't document how it has to be used.
>
> Perhaps the situation is bad, and all we can really say is that
> CREATE_DUMB only works for use with simple RGB formats, and the behavior
> for all other formats is platform specific. But I think even that would
> be valuable in the UAPI docs.

Yeah, CREATE_DUMB only works for use with simple RGB formats in a
linear layout. Not monochrome or YUV or tiled or displayed rotated or
whatever.

If it happens to accidentally work for other uses, that's fine, but
it's not generically reliable for anything other than simple linear
RGB. It's intended to let you do splash screens, consoles, recovery
password entries, and software-rendered compositors if you really
want. Anything more than that isn't 'dumb'.

Cheers,
Daniel
