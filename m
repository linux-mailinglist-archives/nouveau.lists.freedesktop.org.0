Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DD474A6C642
	for <lists+nouveau@lfdr.de>; Sat, 22 Mar 2025 00:01:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C53310E071;
	Fri, 21 Mar 2025 23:01:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=darkrefraction-com.20230601.gappssmtp.com header.i=@darkrefraction-com.20230601.gappssmtp.com header.b="0Wp+c2aR";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com
 [209.85.208.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 796F910E071
 for <nouveau@lists.freedesktop.org>; Fri, 21 Mar 2025 23:01:25 +0000 (UTC)
Received: by mail-ed1-f48.google.com with SMTP id
 4fb4d7f45d1cf-5e5deb6482cso7037249a12.1
 for <nouveau@lists.freedesktop.org>; Fri, 21 Mar 2025 16:01:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=darkrefraction-com.20230601.gappssmtp.com; s=20230601; t=1742598084;
 x=1743202884; darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=sH2W37gz5JSCUCdBWPzPlpXu5pNqBdrWWXPAz4A12i0=;
 b=0Wp+c2aRLv5n87PBt4J2JatHgmKnxbzghZm5LKfOBVoAOc7THD3opjH56IWaCfGzai
 RXt+Weq5zuM+grcrWpBGa3XJg+7V5srxy4QXKU8VWpjbLbk81G5TnjEzTQ1xfLBVxMp8
 n19fUOaluuJjV35PceXzUbZgT6fgeeoeRApIwY22ZqDJxkQumrWjMb5UWVCgmhwqv5vx
 Us9R09BjXTXnMVbtKzN6N6JEVk4MJnL4kCgJslBQNqg62x6wfhqh+x1W6N3KhZZIXKCm
 KX3VNZhGbKEUzqUUmsj/B9zooQ1dlstwGYxTMcB78Yc37Gq5wBwNmzDXTQ5P3nw2dtZS
 X6vA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742598084; x=1743202884;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=sH2W37gz5JSCUCdBWPzPlpXu5pNqBdrWWXPAz4A12i0=;
 b=jKemg158RLsNLwDIyCRLDy61gt2hpb86a3zhMH5AQ1FUpURwuVyAcdGmq5xmqwjLWb
 T99PXCJvi/dOqetbDn8yTYfhKLl61Xedf2Aexbs/+5AS+G6a9QJjG8t8y7oDPDCm0PzQ
 Cz41K7M2O3TQgYFZLvN0s4oMzrBkA2eJoHLgKfvKa+bdWJVTwDjWWSBOFD3/tc3aBdiR
 Ntg5HxidePIb/eB9+4/rxKnwc6SX+hcCQV7hnERsmHhEN78uDUGkdGAmlqnSxDNACBqm
 kv4Mz1w0Eht7YncFiaQmDjRSRPdTp99M6WI8piEgSucu5t3/9EXKcGGVuYrlLttN3rl3
 Ecog==
X-Forwarded-Encrypted: i=1;
 AJvYcCWfLnNo97GgpilSEHMmpEavXCezvhvkFEj0TSmOAAB/2EdIlG0WaoBrfGFJIKpQBF3Yi4oVpykD@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxfJ9lnG17AenCZgnYCuwyueXALaYsplXOoFK34uMkQ7B3DKWmG
 DeFImJzDn/wvkSNL//clCN3FBE9FF3n0USKYoxaGT2CDMKRRXekCM5aYqRzcYU2ocnSK8A/mEQM
 G58OLlKDjr0XrUwtyVVMFqmaaD6e/+eueSp9vMDUwJkCzBpg1oOGjzw==
X-Gm-Gg: ASbGncsXhLgEx+oj78xZUNHGqnpOws3cKS5c0pZrrsC1uS5r8mgng5VnR1bNFooeMb+
 eQK8to2Uex62mxYhw8/OjRTaHZWJ35ucPFzEOn43yAun89hXsxerh1mVHd66HKmAKx5U9WZVeb+
 Pww70olFSu6oYoXEQZmt0d3QO8Dnf1NABvxCf7OARnatjN3t2XU+WRtgizShiJ9Fqhy47g
X-Google-Smtp-Source: AGHT+IEgVTLqq03sZoIlc85e4pxje4Yd7ymNujGbmj6hYsnYZz+ZaZPnJdi1WIE/4jpnjz3bPQx/EbgEmWcNWmSiHfs=
X-Received: by 2002:a50:d586:0:b0:5e4:d52b:78a2 with SMTP id
 4fb4d7f45d1cf-5eb9a310491mr6431605a12.15.1742598083450; Fri, 21 Mar 2025
 16:01:23 -0700 (PDT)
MIME-Version: 1.0
References: <20250312213746.228042-1-mhenning@darkrefraction.com>
 <20250312213746.228042-3-mhenning@darkrefraction.com>
 <Z9xfoS89yimS1Sb3@pollux>
In-Reply-To: <Z9xfoS89yimS1Sb3@pollux>
From: M Henning <mhenning@darkrefraction.com>
Date: Fri, 21 Mar 2025 19:00:57 -0400
X-Gm-Features: AQ5f1JosjHpUxkL36DODONjh8EuMIFPu3fhSSXFGrywJK3z2Ey2y3VvLkXNpaUQ
Message-ID: <CAAgWFh2RtCwaKNinX9X4BjwNiaBj5BF_ypzbqoqV4LJgN4cPvg@mail.gmail.com>
Subject: Re: [PATCH 2/2] drm/nouveau: DRM_NOUVEAU_SET_ZCULL_CTXSW_BUFFER
To: Danilo Krummrich <dakr@kernel.org>
Cc: Karol Herbst <kherbst@redhat.com>, Lyude Paul <lyude@redhat.com>, 
 Faith Ekstrand <faith.ekstrand@collabora.com>, dri-devel@lists.freedesktop.org,
 nouveau@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

This is a pointer in the gpu's virtual address space. It must be
aligned according to ctxsw_align and be at least ctxsw_size bytes
(where those values come from the nouveau_abi16_ioctl_get_zcull_info
structure). I'll change the description to say that much.

Yes, this is GEM-backed. I'm actually not entirely sure what the
requirements are here, since this part is reverse-engineered. I think
NOUVEAU_GEM_DOMAIN_VRAM and NOUVEAU_GEM_DOMAIN_GART are both okay. The
proprietary driver allocates this buffer using
NV_ESC_RM_VID_HEAP_CONTROL and sets attr =3D NVOS32_ATTR_LOCATION_ANY |
NVOS32_ATTR_PAGE_SIZE_BIG | NVOS32_ATTR_PHYSICALITY_CONTIGUOUS, attr2
=3D NVOS32_ATTR2_GPU_CACHEABLE_YES | NVOS32_ATTR2_ZBC_PREFER_NO_ZBC.

On Thu, Mar 20, 2025 at 2:34=E2=80=AFPM Danilo Krummrich <dakr@kernel.org> =
wrote:
>
> On Wed, Mar 12, 2025 at 05:36:15PM -0400, Mel Henning wrote:
> > diff --git a/include/uapi/drm/nouveau_drm.h b/include/uapi/drm/nouveau_=
drm.h
>
> Same here, please split the uAPI change in a separate commit.
>
> > index 33361784eb4e..e9638f4dd7e6 100644
> > --- a/include/uapi/drm/nouveau_drm.h
> > +++ b/include/uapi/drm/nouveau_drm.h
> > @@ -448,6 +448,20 @@ struct drm_nouveau_get_zcull_info {
> >       __u32 ctxsw_align;
> >  };
> >
> > +struct drm_nouveau_set_zcull_ctxsw_buffer {
> > +     /**
> > +      * @ptr: The virtual address for the buffer, or null to bind noth=
ing
> > +      */
> > +     __u64 addr;
>
> What is this buffer? Is this a GEM object backed buffer? How is it mapped=
?
>
> > +
> > +     /**
> > +      * @channel: the channel to set the buffer on
> > +      */
> > +     __u32 channel;
> > +
> > +     __u32 pad;
> > +};
> > +
> >  #define DRM_NOUVEAU_GETPARAM           0x00
> >  #define DRM_NOUVEAU_SETPARAM           0x01 /* deprecated */
> >  #define DRM_NOUVEAU_CHANNEL_ALLOC      0x02
> > @@ -462,6 +476,7 @@ struct drm_nouveau_get_zcull_info {
> >  #define DRM_NOUVEAU_VM_BIND            0x11
> >  #define DRM_NOUVEAU_EXEC               0x12
> >  #define DRM_NOUVEAU_GET_ZCULL_INFO     0x13
> > +#define DRM_NOUVEAU_SET_ZCULL_CTXSW_BUFFER 0x14
> >  #define DRM_NOUVEAU_GEM_NEW            0x40
> >  #define DRM_NOUVEAU_GEM_PUSHBUF        0x41
> >  #define DRM_NOUVEAU_GEM_CPU_PREP       0x42
> > @@ -532,6 +547,7 @@ struct drm_nouveau_svm_bind {
> >  #define DRM_IOCTL_NOUVEAU_EXEC               DRM_IOWR(DRM_COMMAND_BASE=
 + DRM_NOUVEAU_EXEC, struct drm_nouveau_exec)
> >
> >  #define DRM_IOCTL_NOUVEAU_GET_ZCULL_INFO     DRM_IOR (DRM_COMMAND_BASE=
 + DRM_NOUVEAU_GET_ZCULL_INFO, struct drm_nouveau_get_zcull_info)
> > +#define DRM_IOCTL_NOUVEAU_SET_ZCULL_CTXSW_BUFFER  DRM_IOW (DRM_COMMAND=
_BASE + DRM_NOUVEAU_SET_ZCULL_CTXSW_BUFFER, struct drm_nouveau_set_zcull_ct=
xsw_buffer)
> >  #if defined(__cplusplus)
> >  }
> >  #endif
> > --
> > 2.48.1
> >
