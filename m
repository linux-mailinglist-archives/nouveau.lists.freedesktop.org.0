Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A9E1FAF82F4
	for <lists+nouveau@lfdr.de>; Thu,  3 Jul 2025 23:56:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CEF2C10E8F9;
	Thu,  3 Jul 2025 21:56:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="LSZ1MI2A";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D356310E8F9
 for <nouveau@lists.freedesktop.org>; Thu,  3 Jul 2025 21:56:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1751579806;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6fYR7VZlgABLKP1NRozT8CE9xb7sNdOcfvOJxK/ixyQ=;
 b=LSZ1MI2AEWHuC0duIoOJXC4nefGh0AlQJqVUGCXFXsRvvwy3xFb13f8Vmk3VYXXHlUx/Ap
 AYmDV8J1ALNfay6PUOrfARLWQ4+QqGNZ8MbURXBofuQsGELHo1qnvwcxFmzCcVbL01LLew
 Z0lSwjR43mf7Y1ngpmHJxVgz6F02neA=
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com
 [209.85.216.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-554-vAmsdHodNDCA-1XhHkQ_nQ-1; Thu, 03 Jul 2025 17:56:44 -0400
X-MC-Unique: vAmsdHodNDCA-1XhHkQ_nQ-1
X-Mimecast-MFC-AGG-ID: vAmsdHodNDCA-1XhHkQ_nQ_1751579804
Received: by mail-pj1-f71.google.com with SMTP id
 98e67ed59e1d1-313fb0ec33bso297229a91.2
 for <nouveau@lists.freedesktop.org>; Thu, 03 Jul 2025 14:56:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751579804; x=1752184604;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=6fYR7VZlgABLKP1NRozT8CE9xb7sNdOcfvOJxK/ixyQ=;
 b=S81+KXDhAiMpxvWWvfa89umdZ2jFfX8QRD7PXZS9/6kNpz+mEdKeQTo6n8zh+BGgbc
 M65BMzTMD5bkSqY7L6Wp3FLBbUayGVKW4Y1GLcHpWr4TRM92zhF/zadsvl8Aiujbu41x
 HRi9TF0kHIj1XYi3xOHaB78RfBuP5QpFxtodkS3wPd3PA00yzUgkeprS+02yR3wEn2mN
 U0nVr0Rt/ldTd+1yWDRCvq7PEwghb+q5TCBqow0WWxsEGpvry5K96/zPZjFL4UHTnXj7
 22kCtUEkE74KxCd+YyMHtOLsZd22Q5mFC67/0rzoR604TPVnZrNi43yVj4mitV5WbCA1
 tHiQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXvSWT3CAOaZurpRM+GoB4Zd2VeQNvlRZOOqkqvkN/Xj+Jl7AEqgaf0mByWCQ9mIggeLXvudNQQ@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzaX5EKYq74Ho7ZziyHgubrNKl0xH9j+JFQK/thZDXRVtOLjO9O
 2azqWLZKiJtCaF9/iN+WH+fqbWFpf16BOwzKs7e/9XQL79ergdsAKiYe3iKiEYeSiaDqOUoxc29
 rA7IvOTw5ZFyRzK+kyKgKZL8TZj8N+QNUFfnklnd0cWEdK7NSs7iif4bQ7pAoj1XVxblZVM7BiN
 m44xJOXyJBzvIS6El4GsrTu0OBEd9KM6Gou771HW2RxQ==
X-Gm-Gg: ASbGnctzjJQwo8bVvbmYHe8VhhTLen0CN3kVruYNqyrrj+5VTzEn8Y9swfzJmBvJujn
 sKqdCVHuguB7hwu9gu8Zc+IOCAbhk4hvHRA+xQE/aV+toOzpOB8+GlTDv7zrt0gFSxkHG1jccDt
 jOCw==
X-Received: by 2002:a17:90b:394a:b0:315:6f2b:ce53 with SMTP id
 98e67ed59e1d1-31aac4f0f17mr282532a91.25.1751579803657; 
 Thu, 03 Jul 2025 14:56:43 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH8QsL4/4lbdu2VgAxra8OjeGaMaz7G/joe/hTMUWVrl3BwEfAgKyvMvBLL8Evt3sQY1YZL6uZ/fwzabaaILsk=
X-Received: by 2002:a17:90b:394a:b0:315:6f2b:ce53 with SMTP id
 98e67ed59e1d1-31aac4f0f17mr282508a91.25.1751579803345; Thu, 03 Jul 2025
 14:56:43 -0700 (PDT)
MIME-Version: 1.0
References: <20250702232707.175679-1-airlied@gmail.com>
 <3bdcc576-5c5a-4735-9e6f-e56ead2270b8@kernel.org>
In-Reply-To: <3bdcc576-5c5a-4735-9e6f-e56ead2270b8@kernel.org>
From: David Airlie <airlied@redhat.com>
Date: Fri, 4 Jul 2025 07:56:30 +1000
X-Gm-Features: Ac12FXw0hcVP8Zqb-SDWuNhKXYrwwVhPaZMMQvb2YOUWY3UayM2Wo2HazJUMMhI
Message-ID: <CAMwc25ob7F+4jTttyvqgBrNraAX9jdCjN4=unt0WJWZLbY+vNw@mail.gmail.com>
Subject: Re: [PATCH] nouveau/gsp: add a 50ms delay between fbsr and driver
 unload rpcs
To: Danilo Krummrich <dakr@kernel.org>
Cc: Dave Airlie <airlied@gmail.com>, dri-devel@lists.freedesktop.org, 
 nouveau@lists.freedesktop.org, Ben Skeggs <bskeggs@nvidia.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 8wAHsBZbuKZj6O97YqmX-n87KbU4RqelnACTWZE5zRg_1751579804
X-Mimecast-Originator: redhat.com
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

On Fri, Jul 4, 2025 at 7:46=E2=80=AFAM Danilo Krummrich <dakr@kernel.org> w=
rote:
>
> On 7/3/25 1:27 AM, Dave Airlie wrote:
> > From: Dave Airlie <airlied@redhat.com>
> >
> > This fixes a bunch of command hangs after runtime suspend/resume.
> >
> > This fixes a regression caused by code movement in the commit below,
> > the commit seems to just change timings enough to cause this to happen
> > now, and adding the sleep seems to avoid it.
> >
> > I've spent some time trying to root cause it to no great avail,
> > it seems like a bug on the firmware side, but it could be a bug
> > in our rpc handling that I can't find.
> >
> > Either way, we should land the workaround to fix the problem,
> > while we continue to work out the root cause.
>
> I think we should add a TODO above the msleep(); what do you think would =
be a
> good comment here?

TODO: debug the gsp firmware or the rpc handling to find out why this
is happening and why it's Turing specific.

Don't really have a lot to go on,

Dave.
>
> I can add it when applying the patch if you want.
>
> > Signed-off-by: Dave Airlie <airlied@redhat.com>
> > Cc: Ben Skeggs <bskeggs@nvidia.com>
> > Cc: Danilo Krummrich <dakr@kernel.org>
> > Fixes: 21b039715ce9 ("drm/nouveau/gsp: add hals for fbsr.suspend/resume=
()")
> > ---
> >   drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/gsp.c | 3 +++
> >   1 file changed, 3 insertions(+)
> >
> > diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/gsp.c b/dr=
ivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/gsp.c
> > index baf42339f93e..ff362a6d9f5c 100644
> > --- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/gsp.c
> > +++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/gsp.c
> > @@ -1744,6 +1744,9 @@ r535_gsp_fini(struct nvkm_gsp *gsp, bool suspend)
> >                       nvkm_gsp_sg_free(gsp->subdev.device, &gsp->sr.sgt=
);
> >                       return ret;
> >               }
> > +
> > +             /* without this Turing ends up resetting all channels aft=
er resume. */
> > +             msleep(50);
> >       }
> >
> >       ret =3D r535_gsp_rpc_unloading_guest_driver(gsp, suspend);
>

