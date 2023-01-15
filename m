Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 24C5766B43F
	for <lists+nouveau@lfdr.de>; Sun, 15 Jan 2023 22:45:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 845EC10E3B1;
	Sun, 15 Jan 2023 21:45:21 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E5CD910E3B1
 for <nouveau@lists.freedesktop.org>; Sun, 15 Jan 2023 21:45:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1673819118;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=itG3ZF4MAETUDAKR3A/Ih1TMp9lYsHlIkkE2cbFYorM=;
 b=Xm9TeOAkEGENtWJZJt+iGmpxgjSCc35JdYErlLxHzHQ5xvl3Q7YgrfRtDkOj82Ot+NWx6X
 hl6FyeFYS8D+1r4PFbIDCjP8civPdzUMC7+41ZM+y1LqncccPwIlfSg46hfFeA8TUVlVMa
 mj5hVp8JqNKUqL28HYS4noq2sqr/oOw=
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-584-2daoBsaOOByupIxVQvNtjg-1; Sun, 15 Jan 2023 16:45:17 -0500
X-MC-Unique: 2daoBsaOOByupIxVQvNtjg-1
Received: by mail-qt1-f197.google.com with SMTP id
 bb12-20020a05622a1b0c00b003a98dd528f0so12369084qtb.13
 for <nouveau@lists.freedesktop.org>; Sun, 15 Jan 2023 13:45:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=itG3ZF4MAETUDAKR3A/Ih1TMp9lYsHlIkkE2cbFYorM=;
 b=I19WIOpgli8/CoyXTk6tmFDE9wVD2AxD1teGOSzLmIpes/UPDbYwncrLucB9IRY/Yb
 dofiSjXkbkHYHw7sqzT1x/bH/NwwjleqdFNedRHCrTzJcu/hhjPOvn+H0ePrWxKtL9oc
 2cgwf40GpFeJqIyDAfYYlbHdoVGFS0S+kqQ7MIe48QkpAXjfopFLbOMbvPHFLi3wCPFX
 wPd9BcBtEfR/Dc7R5quOE/zTB/aypHbk1JQ34NEaBkKdyaOoATsAQsIAsLIcbdnzLB8O
 1OR6Acbth0GQ86zfHFiG0HHkzOjyT+9eVBnGZQv3mJUr1FB1o26Q2UU7SxcZdsJ4jZqs
 4NJQ==
X-Gm-Message-State: AFqh2kpZkcg5u5xlKoaE/ktKmJF79Op/jUAaAZhTb0Ne2TAG9woJ3jRl
 tlcVcEWMzRjGLBLHFyPbv3dxlukw1YIu5lz770rHUWScICuN4UjkbSYvSk0nudhasDFfMca/zP0
 ywSFYGh8dB9xk2m2fHRR8qnrT4kXyfalohTfKsywR7A==
X-Received: by 2002:ad4:46c6:0:b0:531:bf0f:74e9 with SMTP id
 pm6-20020ad446c6000000b00531bf0f74e9mr3851565qvb.16.1673819116978; 
 Sun, 15 Jan 2023 13:45:16 -0800 (PST)
X-Google-Smtp-Source: AMrXdXtfUw/WKxs1P5lWECd2XEfFTLxO8sx4RmRDJZvTFCEjlwRQcOTU3yuKkD11Yo130rqXWwfmlcP/EzkffuCj6aU=
X-Received: by 2002:ad4:46c6:0:b0:531:bf0f:74e9 with SMTP id
 pm6-20020ad446c6000000b00531bf0f74e9mr3851560qvb.16.1673819116738; Sun, 15
 Jan 2023 13:45:16 -0800 (PST)
MIME-Version: 1.0
References: <20221228144914.z7t7a4fdwvbblnak@wslaptop>
In-Reply-To: <20221228144914.z7t7a4fdwvbblnak@wslaptop>
From: David Airlie <airlied@redhat.com>
Date: Mon, 16 Jan 2023 07:45:05 +1000
Message-ID: <CAMwc25rY4xpn0yvCScMr6Hk9pFSdvt=9QOypSQDfj1d5tWmtvA@mail.gmail.com>
To: Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Nouveau] [REGRESSION] GM20B probe fails after commit
 2541626cfb79
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
Cc: nouveau@lists.freedesktop.org, regressions@lists.linux.dev,
 dri-devel@lists.freedesktop.org, bskeggs@redhat.com
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

On Thu, Dec 29, 2022 at 12:58 AM Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt> wrote:
>
> Hello,
>
> Commit 2541626cfb79 breaks GM20B probe with
> the following kernel log:
>
> [    2.153892] ------------[ cut here ]------------
> [    2.153897] WARNING: CPU: 1 PID: 36 at drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmmgf100.c:273 gf100_vmm_valid+0x2c4/0x390
> [    2.153916] Modules linked in:
> [    2.153922] CPU: 1 PID: 36 Comm: kworker/u8:1 Not tainted 6.1.0+ #1
> [    2.153929] Hardware name: Google Pixel C (DT)
> [    2.153933] Workqueue: events_unbound deferred_probe_work_func
> [    2.153943] pstate: 80000005 (Nzcv daif -PAN -UAO -TCO -DIT -SSBS BTYPE=--)
> [    2.153950] pc : gf100_vmm_valid+0x2c4/0x390
> [    2.153959] lr : gf100_vmm_valid+0xb4/0x390
> [    2.153966] sp : ffffffc009e134b0
> [    2.153969] x29: ffffffc009e134b0 x28: 0000000000000000 x27: ffffffc008fd44c8
> [    2.153979] x26: 00000000ffffffea x25: ffffffc0087b98d0 x24: ffffff8080f89038
> [    2.153987] x23: ffffff8081fadc08 x22: 0000000000000000 x21: 0000000000000000
> [    2.153995] x20: ffffff8080f8a000 x19: ffffffc009e13678 x18: 0000000000000000
> [    2.154003] x17: f37a8b93418958e6 x16: ffffffc009f0d000 x15: 0000000000000000
> [    2.154011] x14: 0000000000000002 x13: 000000000003a020 x12: ffffffc008000000
> [    2.154019] x11: 0000000102913000 x10: 0000000000000000 x9 : 0000000000000000
> [    2.154026] x8 : ffffffc009e136d8 x7 : ffffffc008fd44c8 x6 : ffffff80803d0f00
> [    2.154034] x5 : 0000000000000000 x4 : ffffff8080f88c00 x3 : 0000000000000010
> [    2.154041] x2 : 000000000000000c x1 : 00000000ffffffea x0 : 00000000ffffffea
> [    2.154050] Call trace:
> [    2.154053]  gf100_vmm_valid+0x2c4/0x390
> [    2.154061]  nvkm_vmm_map_valid+0xd4/0x204
> [    2.154069]  nvkm_vmm_map_locked+0xa4/0x344
> [    2.154076]  nvkm_vmm_map+0x50/0x84
> [    2.154083]  nvkm_firmware_mem_map+0x84/0xc4
> [    2.154094]  nvkm_falcon_fw_oneinit+0xc8/0x320
> [    2.154101]  nvkm_acr_oneinit+0x428/0x5b0
> [    2.154109]  nvkm_subdev_oneinit_+0x50/0x104
> [    2.154114]  nvkm_subdev_init_+0x3c/0x12c
> [    2.154119]  nvkm_subdev_init+0x60/0xa0
> [    2.154125]  nvkm_device_init+0x14c/0x2a0
> [    2.154133]  nvkm_udevice_init+0x60/0x9c
> [    2.154140]  nvkm_object_init+0x48/0x1b0
> [    2.154144]  nvkm_ioctl_new+0x168/0x254
> [    2.154149]  nvkm_ioctl+0xd0/0x220
> [    2.154153]  nvkm_client_ioctl+0x10/0x1c
> [    2.154162]  nvif_object_ctor+0xf4/0x22c
> [    2.154168]  nvif_device_ctor+0x28/0x70
> [    2.154174]  nouveau_cli_init+0x150/0x590
> [    2.154180]  nouveau_drm_device_init+0x60/0x2a0
> [    2.154187]  nouveau_platform_device_create+0x90/0xd0
> [    2.154193]  nouveau_platform_probe+0x3c/0x9c
> [    2.154200]  platform_probe+0x68/0xc0
> [    2.154207]  really_probe+0xbc/0x2dc
> [    2.154211]  __driver_probe_device+0x78/0xe0
> [    2.154216]  driver_probe_device+0xd8/0x160
> [    2.154221]  __device_attach_driver+0xb8/0x134
> [    2.154226]  bus_for_each_drv+0x78/0xd0
> [    2.154230]  __device_attach+0x9c/0x1a0
> [    2.154234]  device_initial_probe+0x14/0x20
> [    2.154239]  bus_probe_device+0x98/0xa0
> [    2.154243]  deferred_probe_work_func+0x88/0xc0
> [    2.154247]  process_one_work+0x204/0x40c
> [    2.154256]  worker_thread+0x230/0x450
> [    2.154261]  kthread+0xc8/0xcc
> [    2.154266]  ret_from_fork+0x10/0x20
> [    2.154273] ---[ end trace 0000000000000000 ]---
> [    2.154278] nouveau 57000000.gpu: pmu: map -22
> [    2.154285] nouveau 57000000.gpu: acr: one-time init failed, -22
> [    2.154559] nouveau 57000000.gpu: init failed with -22
> [    2.154564] nouveau: DRM-master:00000000:00000080: init failed with -22
> [    2.154574] nouveau 57000000.gpu: DRM-master: Device allocation failed: -22
> [    2.162905] nouveau: probe of 57000000.gpu failed with error -22
>
> #regzbot introduced: 2541626cfb79

As a quick check can you try changing

drivers/gpu/drm/nouveau/nvkm/core/firmware.c:nvkm_firmware_mem_target
from NVKM_MEM_TARGET_HOST to NVKM_MEM_TARGET_NCOH ?

Dave.
>
> Thanks,
>
> Diogo Ivo
>

