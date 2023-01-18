Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C882C671395
	for <lists+nouveau@lfdr.de>; Wed, 18 Jan 2023 07:13:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A95D610E681;
	Wed, 18 Jan 2023 06:13:28 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B7E4010E67E
 for <nouveau@lists.freedesktop.org>; Wed, 18 Jan 2023 06:13:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1674022405;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=/pZh0oWkHv9U+mVZ6EUlZd50f9ioPkk97n/cDzVAg/U=;
 b=ehC0sb2RRyQ4DZiZY2dk9RCgF8ph02jBlWM/O42rjePgOOZ0ZSD2+TCtjyIAmaS6QhcyJM
 ppWyuUd1hk+JC2Qslj5Al7c4JeDwPOlqLm54Mqa1hVjJsIvar0Q5TueswIf1IsjZVCzY+t
 991yhixfXQrRYcMtBftGzy6P5GhTOyo=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-444-37ZSYU8ONUWY6mw6LBkvDQ-1; Wed, 18 Jan 2023 01:13:24 -0500
X-MC-Unique: 37ZSYU8ONUWY6mw6LBkvDQ-1
Received: by mail-ed1-f69.google.com with SMTP id
 h18-20020a056402281200b0049e5078a6c3so354105ede.12
 for <nouveau@lists.freedesktop.org>; Tue, 17 Jan 2023 22:13:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=/pZh0oWkHv9U+mVZ6EUlZd50f9ioPkk97n/cDzVAg/U=;
 b=t1hHWC3BCGHz2VWn3KvvzArjh/4qSuc3SUUOWMCL19Itrqadac3rHtjlDefQKP/HJq
 Ly1KSsHLKoeChJVcr36dnqypobdWCZR+wTif5vPceL4IWaRbQyw+um2FTVv5lyeaQIKh
 x9dsv6lngTgGiihk8wVMKDNp8AkK+X9TMwh0+5CzlOR/c5QBveqfs/awcHkHWphHUWF2
 lXKV+Cgmybp+fLcPzaF9df/yI/KrbdDZ9SUZeGEGDXMrjKODTQj02+UTRRFMl6o7xxnu
 80/CtpWhoJv2X5ZQRehDl5p1ZxN1+wstfO4cop6MwZ99G65wsjNqKFn/Xlg6yADXuYKd
 t6/g==
X-Gm-Message-State: AFqh2krB4owiY2lWUB7pl6vflvUmXApKFDF3VnDWeblN3Vzz2Hf4sKcx
 msNmMLk4z7+tjfqqJlzfHEL6WWZRbtZ3mZ5d9CXo5Ib8p3bRVUUJCbCjpW2BNxTxXxHfqaHTyMH
 qlYrEwCooe/MBjpWbaXUpna4ZGg==
X-Received: by 2002:a05:6402:f04:b0:47f:ab65:b3fe with SMTP id
 i4-20020a0564020f0400b0047fab65b3femr6405217eda.33.1674022403401; 
 Tue, 17 Jan 2023 22:13:23 -0800 (PST)
X-Google-Smtp-Source: AMrXdXtJz/n+tV/U2PcwOK9ZeYmr68NHtYR8xg9kvYlieT1Bt1DnacXgtAgckPl/3L5ii/8Iya7teg==
X-Received: by 2002:a05:6402:f04:b0:47f:ab65:b3fe with SMTP id
 i4-20020a0564020f0400b0047fab65b3femr6405205eda.33.1674022403083; 
 Tue, 17 Jan 2023 22:13:23 -0800 (PST)
Received: from cassiopeiae.. ([2a02:810d:4b3f:de78:642:1aff:fe31:a19f])
 by smtp.gmail.com with ESMTPSA id
 v18-20020aa7cd52000000b0047eeaae9558sm5689188edw.60.2023.01.17.22.13.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Jan 2023 22:13:22 -0800 (PST)
From: Danilo Krummrich <dakr@redhat.com>
To: daniel@ffwll.ch, airlied@redhat.com, christian.koenig@amd.com,
 bskeggs@redhat.com, jason@jlekstrand.net, tzimmermann@suse.de,
 mripard@kernel.org, corbet@lwn.net
Date: Wed, 18 Jan 2023 07:12:42 +0100
Message-Id: <20230118061256.2689-1-dakr@redhat.com>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Nouveau] [PATCH drm-next 00/14] [RFC] DRM GPUVA Manager & Nouveau
 VM_BIND UAPI
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
Cc: nouveau@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

This patch series provides a new UAPI for the Nouveau driver in order to
support Vulkan features, such as sparse bindings and sparse residency.

Furthermore, with the DRM GPUVA manager it provides a new DRM core feature to
keep track of GPU virtual address (VA) mappings in a more generic way.

The DRM GPUVA manager is indented to help drivers implement userspace-manageable
GPU VA spaces in reference to the Vulkan API. In order to achieve this goal it
serves the following purposes in this context.

    1) Provide a dedicated range allocator to track GPU VA allocations and
       mappings, making use of the drm_mm range allocator.

    2) Generically connect GPU VA mappings to their backing buffers, in
       particular DRM GEM objects.

    3) Provide a common implementation to perform more complex mapping
       operations on the GPU VA space. In particular splitting and merging
       of GPU VA mappings, e.g. for intersecting mapping requests or partial
       unmap requests.

The new VM_BIND Nouveau UAPI build on top of the DRM GPUVA manager, itself
providing the following new interfaces.

    1) Initialize a GPU VA space via the new DRM_IOCTL_NOUVEAU_VM_INIT ioctl
       for UMDs to specify the portion of VA space managed by the kernel and
       userspace, respectively.

    2) Allocate and free a VA space region as well as bind and unbind memory
       to the GPUs VA space via the new DRM_IOCTL_NOUVEAU_VM_BIND ioctl.

    3) Execute push buffers with the new DRM_IOCTL_NOUVEAU_EXEC ioctl.

Both, DRM_IOCTL_NOUVEAU_VM_BIND and DRM_IOCTL_NOUVEAU_EXEC, make use of the DRM
scheduler to queue jobs and support asynchronous processing with DRM syncobjs
as synchronization mechanism.

By default DRM_IOCTL_NOUVEAU_VM_BIND does synchronous processing,
DRM_IOCTL_NOUVEAU_EXEC supports asynchronous processing only.

The new VM_BIND UAPI for Nouveau makes also use of drm_exec (execution context
for GEM buffers) by Christian König. Since the patch implementing drm_exec was
not yet merged into drm-next it is part of this series, as well as a small fix
for this patch, which was found while testing this series.

This patch series is also available at [1].

There is a Mesa NVK merge request by Dave Airlie [2] implementing the
corresponding userspace parts for this series.

The Vulkan CTS test suite passes the sparse binding and sparse residency test
cases for the new UAPI together with Dave's Mesa work.

There are also some test cases in the igt-gpu-tools project [3] for the new UAPI
and hence the DRM GPU VA manager. However, most of them are testing the DRM GPU
VA manager's logic through Nouveau's new UAPI and should be considered just as
helper for implementation.

However, I absolutely intend to change those test cases to proper kunit test
cases for the DRM GPUVA manager, once and if we agree on it's usefulness and
design.

[1] https://gitlab.freedesktop.org/nouvelles/kernel/-/tree/new-uapi-drm-next /
    https://gitlab.freedesktop.org/nouvelles/kernel/-/merge_requests/1
[2] https://gitlab.freedesktop.org/nouveau/mesa/-/merge_requests/150/
[3] https://gitlab.freedesktop.org/dakr/igt-gpu-tools/-/tree/wip_nouveau_vm_bind

I also want to give credit to Dave Airlie, who contributed a lot of ideas to
this patch series.

Christian König (1):
  drm: execution context for GEM buffers

Danilo Krummrich (13):
  drm/exec: fix memory leak in drm_exec_prepare_obj()
  drm: manager to keep track of GPUs VA mappings
  drm: debugfs: provide infrastructure to dump a DRM GPU VA space
  drm/nouveau: new VM_BIND uapi interfaces
  drm/nouveau: get vmm via nouveau_cli_vmm()
  drm/nouveau: bo: initialize GEM GPU VA interface
  drm/nouveau: move usercopy helpers to nouveau_drv.h
  drm/nouveau: fence: fail to emit when fence context is killed
  drm/nouveau: chan: provide nouveau_channel_kill()
  drm/nouveau: nvkm/vmm: implement raw ops to manage uvmm
  drm/nouveau: implement uvmm for user mode bindings
  drm/nouveau: implement new VM_BIND UAPI
  drm/nouveau: debugfs: implement DRM GPU VA debugfs

 Documentation/gpu/driver-uapi.rst             |   11 +
 Documentation/gpu/drm-mm.rst                  |   43 +
 drivers/gpu/drm/Kconfig                       |    6 +
 drivers/gpu/drm/Makefile                      |    3 +
 drivers/gpu/drm/amd/amdgpu/Kconfig            |    1 +
 drivers/gpu/drm/drm_debugfs.c                 |   56 +
 drivers/gpu/drm/drm_exec.c                    |  294 ++++
 drivers/gpu/drm/drm_gem.c                     |    3 +
 drivers/gpu/drm/drm_gpuva_mgr.c               | 1323 +++++++++++++++++
 drivers/gpu/drm/nouveau/Kbuild                |    3 +
 drivers/gpu/drm/nouveau/Kconfig               |    2 +
 drivers/gpu/drm/nouveau/include/nvif/if000c.h |   23 +-
 drivers/gpu/drm/nouveau/include/nvif/vmm.h    |   17 +-
 .../gpu/drm/nouveau/include/nvkm/subdev/mmu.h |   10 +
 drivers/gpu/drm/nouveau/nouveau_abi16.c       |   23 +
 drivers/gpu/drm/nouveau/nouveau_abi16.h       |    1 +
 drivers/gpu/drm/nouveau/nouveau_bo.c          |  152 +-
 drivers/gpu/drm/nouveau/nouveau_bo.h          |    2 +-
 drivers/gpu/drm/nouveau/nouveau_chan.c        |   16 +-
 drivers/gpu/drm/nouveau/nouveau_chan.h        |    1 +
 drivers/gpu/drm/nouveau/nouveau_debugfs.c     |   24 +
 drivers/gpu/drm/nouveau/nouveau_drm.c         |   25 +-
 drivers/gpu/drm/nouveau/nouveau_drv.h         |   92 +-
 drivers/gpu/drm/nouveau/nouveau_exec.c        |  310 ++++
 drivers/gpu/drm/nouveau/nouveau_exec.h        |   55 +
 drivers/gpu/drm/nouveau/nouveau_fence.c       |    7 +
 drivers/gpu/drm/nouveau/nouveau_fence.h       |    2 +-
 drivers/gpu/drm/nouveau/nouveau_gem.c         |   83 +-
 drivers/gpu/drm/nouveau/nouveau_mem.h         |    5 +
 drivers/gpu/drm/nouveau/nouveau_prime.c       |    2 +-
 drivers/gpu/drm/nouveau/nouveau_sched.c       |  780 ++++++++++
 drivers/gpu/drm/nouveau/nouveau_sched.h       |   98 ++
 drivers/gpu/drm/nouveau/nouveau_svm.c         |    2 +-
 drivers/gpu/drm/nouveau/nouveau_uvmm.c        |  575 +++++++
 drivers/gpu/drm/nouveau/nouveau_uvmm.h        |   68 +
 drivers/gpu/drm/nouveau/nouveau_vmm.c         |    4 +-
 drivers/gpu/drm/nouveau/nvif/vmm.c            |   73 +-
 .../gpu/drm/nouveau/nvkm/subdev/mmu/uvmm.c    |  168 ++-
 .../gpu/drm/nouveau/nvkm/subdev/mmu/uvmm.h    |    1 +
 drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmm.c |   32 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmm.h |    3 +
 include/drm/drm_debugfs.h                     |   25 +
 include/drm/drm_drv.h                         |    6 +
 include/drm/drm_exec.h                        |  144 ++
 include/drm/drm_gem.h                         |   75 +
 include/drm/drm_gpuva_mgr.h                   |  527 +++++++
 include/uapi/drm/nouveau_drm.h                |  216 +++
 47 files changed, 5266 insertions(+), 126 deletions(-)
 create mode 100644 drivers/gpu/drm/drm_exec.c
 create mode 100644 drivers/gpu/drm/drm_gpuva_mgr.c
 create mode 100644 drivers/gpu/drm/nouveau/nouveau_exec.c
 create mode 100644 drivers/gpu/drm/nouveau/nouveau_exec.h
 create mode 100644 drivers/gpu/drm/nouveau/nouveau_sched.c
 create mode 100644 drivers/gpu/drm/nouveau/nouveau_sched.h
 create mode 100644 drivers/gpu/drm/nouveau/nouveau_uvmm.c
 create mode 100644 drivers/gpu/drm/nouveau/nouveau_uvmm.h
 create mode 100644 include/drm/drm_exec.h
 create mode 100644 include/drm/drm_gpuva_mgr.h


base-commit: 0b45ac1170ea6416bc1d36798414c04870cd356d
-- 
2.39.0

