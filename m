Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A50F8AA552
	for <lists+nouveau@lfdr.de>; Fri, 19 Apr 2024 00:15:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 09C1F10EDD1;
	Thu, 18 Apr 2024 22:15:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="gsiTy89u";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E9D4010EDD1
 for <nouveau@lists.freedesktop.org>; Thu, 18 Apr 2024 22:14:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1713478497;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=frlUXGcCLyg2eP4PTSfhhDfMNZBSoNDi9UodrTmqw4Q=;
 b=gsiTy89uzflsGQ6SfB367yfe8RFjTcEZuJUUzeXWBgMg7Gh727V6EfVS2+yxSP9/QWgVqY
 St6cuZrjNn94AIkOdZnoUnDN/ip879oy792KPLFmNqFJu7EFwgQ2sAcCpY2tQwy1ZzNTYO
 Nu8Z4xpYXwPI8zl2fGcjfmYDticL2Fs=
Received: from mail-oo1-f72.google.com (mail-oo1-f72.google.com
 [209.85.161.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-588-3t7_pJwSP9WEzKAM8GV2Gg-1; Thu, 18 Apr 2024 18:14:56 -0400
X-MC-Unique: 3t7_pJwSP9WEzKAM8GV2Gg-1
Received: by mail-oo1-f72.google.com with SMTP id
 006d021491bc7-5aa319be326so1842998eaf.2
 for <nouveau@lists.freedesktop.org>; Thu, 18 Apr 2024 15:14:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713478495; x=1714083295;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=frlUXGcCLyg2eP4PTSfhhDfMNZBSoNDi9UodrTmqw4Q=;
 b=LIyWFPCG2joeRxwTGKYzYBpOA6phFuz56Z9mgpCzaLNc8+2WW0WjdcvQ/0kxDk/Zjs
 p+RoQ2AYkkQAVM01Lj8FROa3VdeCYx/AY1muemxZdv4CiOy3fAf+G3ifTGDPDWL0eQJt
 iHrQaPXzUEw9UPse1pjTNSXme1cvZmlg+fZY2CgEFPljK2wdgeweutVJJ5Vcoe+Kd8GP
 QnKQvDAnh2lluAwgoa3kSdCNc22esdpc6zLD4+6WJA9pzmNsn/aTCHZoPfMYnO+Q16Dd
 ykuXeTNE+AEIq6jrt6QvwEHhEsTDhhaIj1FdGmh843mFyG8BSEeIyFNVRvxAS6nI0tgT
 Rxkw==
X-Forwarded-Encrypted: i=1;
 AJvYcCU1URiyjDzBy2Cdd9d7bXzIv2nY1ozFAY+l8WhlvmnzKE3FEFZ0ArqJFbOpVJF5ERO5nCiUPAbwu+iu9sQN7Es97fRD/trje/4ayYESBw==
X-Gm-Message-State: AOJu0YzaA4G75VDHk5o2QJi2ENxV39m6yOKMVO3SB7jxhbYZsRNGsqfZ
 Uy6hguRAeueRLmjA8o6xM90X0LgGZ8uFxJmXUxwSoIkoMXjJYErOLNIKIsWRLb3yy7E+4kAKJnB
 YMR+zo2HUPnJgWXgNO1WnJCCW7s37hz6Fa3ZuLO6h3i9C2WSZxOAfttSIOJcLGI9KQ05N6HJLE9
 u7On3qL/u3Bl9B/oqzFvKsIhLqnpo2LBlzTEr9qg==
X-Received: by 2002:a05:6358:978e:b0:186:4cfe:8728 with SMTP id
 f14-20020a056358978e00b001864cfe8728mr624574rwb.23.1713478495338; 
 Thu, 18 Apr 2024 15:14:55 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF7LJR2H08/EDbVn3H12oA44W4OwSDsTQmevwZiFRChZodBk3vAiArekCipF3XH8KE3sObEiEZFwBNBNCps99U=
X-Received: by 2002:a05:6358:978e:b0:186:4cfe:8728 with SMTP id
 f14-20020a056358978e00b001864cfe8728mr624553rwb.23.1713478494943; Thu, 18 Apr
 2024 15:14:54 -0700 (PDT)
MIME-Version: 1.0
References: <c09fa96760c35ba80dad1d65cbb4c8dbe983566a.camel@redhat.com>
In-Reply-To: <c09fa96760c35ba80dad1d65cbb4c8dbe983566a.camel@redhat.com>
From: David Airlie <airlied@redhat.com>
Date: Fri, 19 Apr 2024 08:14:43 +1000
Message-ID: <CAMwc25qzmHJ4C=qxRB0GEwcZqGn2wpd7zFRvx0DphEbJvY9pEw@mail.gmail.com>
Subject: Re: Issues with trying to boot falcons from sgt memory + Possible
 firmware SG_DEBUG fix?
To: Lyude Paul <lyude@redhat.com>
Cc: Danilo Krummrich <dakr@redhat.com>, Timur Tabi <ttabi@nvidia.com>,
 Ben Skeggs <bskeggs@nvidia.com>, nouveau@lists.freedesktop.org
X-Mimecast-Spam-Score: 0
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

On Fri, Apr 19, 2024 at 6:27=E2=80=AFAM Lyude Paul <lyude@redhat.com> wrote=
:
>
> So - first some context here for Ben and anyone else who hasn't been
> following. A little while ago I got a Slimbook Executive 16 with a
> Nvidia RTX 4060 in it, and I've unfortunately been running into a kind
> of annoying issue. Currently this laptop only has 16 gigs of ram, and
> as it turns out - this can easily lead the system to having pretty
> heavy memory fragmentation once it starts swapping pages out.
>
> Normally this wouldn't matter, but I unfortunately discovered that when
> we're runtime suspending the GPU in Nouveau - we actually appear to
> allocate some of the memory we use for migrating using
> dma_alloc_coherent. This starts to fail on my system once memory
> fragmentation goes up like so:
>
>   kworker/18:0: page allocation failure: order:7, mode:0xcc0(GFP_KERNEL),
>   nodemask=3D(null),cpuset=3D/,mems_allowed=3D0
>   CPU: 18 PID: 287012 Comm: kworker/18:0 Not tainted
>   6.8.4-200.ChopperV1.fc39.x86_64 #1
>   Hardware name: SLIMBOOK Executive/Executive, BIOS N.1.10GRU06 02/02/202=
4
>   Workqueue: pm pm_runtime_work
>   Call Trace:
>    <TASK>
>    dump_stack_lvl+0x47/0x60
>    warn_alloc+0x165/0x1e0
>    ? __alloc_pages_direct_compact+0x1ad/0x2b0
>    __alloc_pages_slowpath.constprop.0+0xd7d/0xde0
>    __alloc_pages+0x32d/0x350
>    __dma_direct_alloc_pages.isra.0+0x16a/0x2b0
>    dma_direct_alloc+0x70/0x280
>    nvkm_gsp_radix3_sg+0x5e/0x130 [nouveau]
>    r535_gsp_fini+0x1d4/0x350 [nouveau]
>    nvkm_subdev_fini+0x67/0x150 [nouveau]
>    nvkm_device_fini+0x95/0x1e0 [nouveau]
>    nvkm_udevice_fini+0x53/0x70 [nouveau]
>    nvkm_object_fini+0xb9/0x240 [nouveau]
>    nvkm_object_fini+0x75/0x240 [nouveau]
>    nouveau_do_suspend+0xf5/0x280 [nouveau]
>    nouveau_pmops_runtime_suspend+0x3e/0xb0 [nouveau]
>    pci_pm_runtime_suspend+0x67/0x1e0
>    ? __pfx_pci_pm_runtime_suspend+0x10/0x10
>    __rpm_callback+0x41/0x170
>    ? __pfx_pci_pm_runtime_suspend+0x10/0x10
>    rpm_callback+0x5d/0x70
>    ? __pfx_pci_pm_runtime_suspend+0x10/0x10
>    rpm_suspend+0x120/0x6a0
>    pm_runtime_work+0x98/0xb0
>    process_one_work+0x171/0x340
>    worker_thread+0x27b/0x3a0
>    ? __pfx_worker_thread+0x10/0x10
>    kthread+0xe5/0x120
>    ? __pfx_kthread+0x10/0x10
>    ret_from_fork+0x31/0x50
>    ? __pfx_kthread+0x10/0x10
>    ret_from_fork_asm+0x1b/0x30
>
>   nouveau 0000:01:00.0: gsp: suspend failed, -12
>   nouveau: DRM-master:00000000:00000080: suspend failed with -12
>   nouveau 0000:01:00.0: can't suspend (nouveau_pmops_runtime_suspend
>   [nouveau] returned -12)
>
> Keep in mind, I don't dive into memory management related stuff like
> this very often! But I'd very much like to know how to help out
> anywhere around the driver, including outside of my usual domains, so
> I've been trying to write up a patch for this. The original suggestion
> for a fix that Dave Airlie had given me was (unless I misunderstood,
> which isn't unlikely) to try to see if we could get nvkm_gsp_mem_ctor()
> to start allocating memory with vmalloc() and map that onto the GPU
> using the SG helpers instead. So - I gave a shot at writing up a patch
> for doing that:
>
> https://gitlab.freedesktop.org/lyudess/linux/-/commit/b5a41ac2bd948979815=
d262d8d20b4f3333f9c26
>
> As you can probably guess - the patch does not really seem to work, and
> I've been trying to figure out why. There's already a couple of issues
> I'm aware of: the most glaring one being that as Timur pointed out, a
> lot of GSP hardware expects contiguous memory allocations - but
> according to them the allocation that's specifically failing should be
> small enough that it'd be allocated in a contiguous page anyway:

nvkm_gsp_mem_ctor is used to do coherent allocations in a bunch of
places in the gsp code, we can't use vmalloc for a lot of them. A lot
of the allocations are small multi-page and hang around and the
hardware expects allocations to be non-scattered.

Now in this single case we have a large amount of data pointed to by a
radix3 page table.

The data is allocated with nvkm_gsp_sg, then we fail to allocate the
first level of page tables with the coherent allocation. However I
don't think the first level of the page table needs to be allocated
with the coherent allocator, we should allocate it with nvkm_gsp_sg
instead.

Dave.

